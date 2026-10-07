package com.innioasis.ipp;

import android.graphics.Paint;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.widget.TextView;

import java.util.ArrayList;

import com.innioasis.y1.R;

/**
 * The mod's marquee (player title, queue row, the focused list row): a doubled copy of the string
 * scrolled by {@code scrollTo}, so it runs continuously — unlike the platform's, which needs focus,
 * restarts on every rebind and fades the ends.
 *
 * EVERY LINE MOVES OFF ONE CLOCK AND SHARES ONE LAP: they rest and start together at one speed,
 * the lap as long as the longest line, shorter ones waiting at their start. One clock also means
 * one frame per tick for all of them (~3.4 ms whatever moved). One instance per TextView, on its
 * tag; the entry points are idempotent for the same string.
 */
public final class Scroll {

    /** Any resource id of ours will do as a tag key. */
    private static final int TAG = R.string.ipp_brand;

    /**
     * 50 px/s at 25 fps, DELIBERATE: below 25 fps the text judders; the CPU saving comes from the
     * tick's gates instead. Step and delay change the speed together.
     */
    private static final int STEP = 2;
    private static final int TICK = 40;

    /** The rest at the head of every lap: 1.5 s. */
    private static final int LEAD = 38;

    private static final String GAP = "     ";

    /** The hold for a screen being built (the queue takes ~400 ms to its window). */
    private static final int SETTLE = 1200;

    /** The heartbeat while nothing may move. */
    private static final int IDLE = 1000;

    /** Every line carrying our text, shown or not; pruned as their windows go. */
    private static final ArrayList LIVE = new ArrayList();

    private static final Tick TICKER = new Tick();
    private static Handler clock;
    private static boolean ticking;

    /** Ticks since the lap began: the whole synchronisation. */
    private static int phase;

    /**
     * Nothing moves while a screen is being BUILT on this thread — the ticks between its chunks
     * would judder. The signal is a line joining with NO WINDOW TOKEN; not merely "not shown",
     * which a covered screen's rows rebound on a track change also are.
     */
    private static long settleUntil;

    /** For screens that hold the string themselves (the players, the queue). */
    public static void marqueeText(TextView tv, String text) {
        if (tv == null) {
            return;
        }
        try {
            of(tv).apply(text == null ? "" : text);
        } catch (Throwable t) {
            tv.setText(text);
        }
    }

    /** The FOCUSED list row, text already set by the bind: a no-op rebind costs one compare. */
    public static void rowText(TextView tv) {
        if (tv == null) {
            return;
        }
        try {
            CharSequence cur = tv.getText();
            String s = cur == null ? "" : cur.toString();
            Scroll had = at(tv);
            if (had != null && had.holds(s)) {
                return;
            }
            of(tv).take(s);
        } catch (Throwable t) {
        }
    }

    /** Every OTHER row. Free for a line that never reached the point of moving. */
    public static void rowPlain(TextView tv) {
        if (tv == null) {
            return;
        }
        try {
            Scroll s = at(tv);
            if (s != null) {
                s.rest();
            }
        } catch (Throwable t) {
        }
    }

    /** Where rows OUTLIVE the focus change (the queue repaints two rows, not the list). */
    public static void stopMarquee(TextView tv) {
        if (tv == null) {
            return;
        }
        try {
            Scroll s = at(tv);
            if (s != null) {
                s.stop();
            }
        } catch (Throwable t) {
        }
    }

    private static Scroll at(TextView tv) {
        Object o = tv.getTag(TAG);
        return (o instanceof Scroll) ? (Scroll) o : null;
    }

    private static Scroll of(TextView tv) {
        Scroll s = at(tv);
        if (s == null) {
            s = new Scroll(tv);
            tv.setTag(TAG, s);
        }
        return s;
    }

    private final TextView tv;
    /** What the line really says. */
    private String last;
    /** The doubled copy once on the view, or null. */
    private String shown;
    private int x;
    /** One round, MEASURED: the offset where the second copy begins. */
    private int period;
    private boolean hscroll;
    private boolean running;
    private boolean doubled;
    private boolean measured;
    private boolean seen;
    /** On screen at the last tick: the transition restarts a lap. */
    private boolean wasShown;
    /** New text nobody has read yet: owes a lap, spent by the tick once on screen. */
    private boolean fresh;

    public Scroll(TextView tv) {
        this.tv = tv;
    }

    private boolean holds(String s) {
        return running && s.equals(doubled ? shown : last);
    }

    /**
     * TOUCHES THE VIEW NOT AT ALL: dropping the ellipsis rebuilds its text Layout (~2.2 ms a
     * label), so all of that waits for {@link #wrap}, which a turning wheel never reaches.
     */
    private void take(String s) {
        last = s;
        reset();
        running = true;
        join();
    }

    public void apply(String s) {
        if (s.equals(last)) {
            return;
        }
        last = s;
        reset();
        scrollable();
        singleLine();
        running = true;
        tv.setText(s);
        join();
    }

    /** {@code setSingleLine} has no early-out: it asks for a layout and rebuilds the text every call. */
    private void singleLine() {
        if (tv.getMaxLines() == 1
                && tv.getTransformationMethod() instanceof android.text.method.SingleLineTransformationMethod) {
            return;
        }
        tv.setSingleLine();
    }

    private void reset() {
        shown = null;
        doubled = false;
        measured = false;
        period = 0;
        if (x != 0) {
            x = 0;
            tv.scrollTo(0, 0);
        }
    }

    /**
     * No ellipsis, and horizontal scrolling set once per view: without it the text breaks by
     * WORDS and the ellipsis lands well before the edge.
     */
    private void scrollable() {
        if (tv.getEllipsize() != null) {
            tv.setEllipsize(null);
        }
        if (!hscroll) {
            tv.setHorizontallyScrolling(true);
            hscroll = true;
        }
    }

    /**
     * Only a line that reached {@link #wrap} has anything to undo. The text is put back only if the
     * view still carries OUR copy: a recycled row already holds the next song's name.
     */
    private void rest() {
        LIVE.remove(this);
        running = false;
        if (doubled) {
            CharSequence cur = tv.getText();
            if (cur != null && cur.toString().equals(shown)) {
                tv.setText(last);
            }
            tv.setEllipsize(TextUtils.TruncateAt.END);
        }
        reset();
    }

    /**
     * Restarts the lap for EVERY line (new text must be read; every rebind lands here, so a turning
     * wheel never reaches a running half). ONLY A LINE ON SCREEN restarts it: one bound into a
     * screen still being built would snap the lines being read back to their start.
     */
    private void join() {
        Lit.watch(tv.getContext());
        if (!LIVE.contains(this)) {
            LIVE.add(this);
        }
        if (tv.isShown()) {
            phase = 0;
        } else {
            // A list row is bound DETACHED, so lists always land here: the restart is granted by
            // the tick once the line is really on screen.
            fresh = true;
            if (tv.getWindowToken() == null) {
                settleUntil = android.os.SystemClock.uptimeMillis() + SETTLE;
            }
        }
        if (clock == null) {
            clock = new Handler(Looper.getMainLooper());
        }
        clock.removeCallbacks(TICKER);
        ticking = true;
        clock.postDelayed(TICKER, TICK);
    }

    public void stop() {
        LIVE.remove(this);
        running = false;
        if (doubled && last != null) {
            tv.setText(last);
        }
        last = null;
        reset();
    }

    /** Detached after having been attached. */
    private boolean dead() {
        if (tv.getWindowToken() != null) {
            seen = true;
            return false;
        }
        if (!seen) {
            return false;
        }
        tv.setTag(TAG, null);
        return true;
    }

    /**
     * Everything that touches the view, at the END of the lead-in. Measured with the PAINT, not
     * {@code getLayout()}, which answers "fits" for any ellipsized string. The period is exactly
     * the measure of what was built, rounded — a pixel more twitches at every lap.
     */
    private void wrap() {
        int room = tv.getWidth() - tv.getPaddingLeft() - tv.getPaddingRight();
        if (room <= 0) {
            return;                       // not laid out yet
        }
        measured = true;
        String base = last != null ? last : "";
        Paint paint = tv.getPaint();
        if (paint.measureText(base) <= room) {
            return;                       // it fits
        }
        String head = base + GAP;
        int per = Math.round(paint.measureText(head));
        if (per < 1) {
            return;
        }
        scrollable();
        shown = head + base;
        period = per;
        doubled = true;
        tv.setText(shown);
    }

    /** Back at its start once its own round is done, waiting for the longer lines. */
    private void move(int p) {
        int nx = 0;
        if (p > LEAD && doubled) {
            int d = (p - LEAD) * STEP;
            if (d < period) {
                nx = d;
            }
        }
        if (nx != x) {
            x = nx;
            tv.scrollTo(x, 0);
        }
    }

    private void park() {
        if (x != 0) {
            x = 0;
            tv.scrollTo(0, 0);
        }
    }

    /**
     * The one clock, behind two gates: the screen is off ({@link Lit} — no View can tell), and the
     * line is not shown ({@code isShown()}, which covers the Lyrics window and a covering Activity;
     * NOT {@code getWindowVisibility()}, which flips at the start of a transition).
     */
    static final class Tick implements Runnable {

        public void run() {
            ticking = false;
            for (int i = LIVE.size() - 1; i >= 0; i--) {
                if (((Scroll) LIVE.get(i)).dead()) {
                    LIVE.remove(i);
                }
            }
            int n = LIVE.size();
            if (n == 0) {
                return;
            }

            boolean lit = Lit.screenOn();
            boolean any = false;
            boolean was = false;
            boolean appeared = false;
            boolean vanished = false;
            boolean unread = false;
            for (int i = 0; i < n; i++) {
                Scroll s = (Scroll) LIVE.get(i);
                boolean on = lit && s.tv.isShown();
                if (s.wasShown) {
                    was = true;
                }
                if (on && !s.wasShown) {
                    appeared = true;
                }
                if (!on && s.wasShown) {
                    vanished = true;
                }
                s.wasShown = on;
                if (!on) {
                    s.park();
                } else {
                    any = true;
                    if (s.fresh) {
                        s.fresh = false;
                        unread = true;
                    }
                }
            }
            if (!any) {
                phase = 0;
                post(IDLE);
                return;
            }
            // A LAP IS RESTARTED BY A SCREEN GOING, NOT BY ONE ARRIVING: a new window reports its
            // views shown well before it covers the old one, which is still being read.
            if (vanished || (appeared && !was)) {
                phase = 0;
                settleUntil = 0;
            } else if (unread) {
                // New text on a line already on screen (a recycled view). Does NOT release a hold.
                phase = 0;
            }
            // Held until the replaced screen is gone (not until the new one appears: they
            // overlap), or until it turns out not to be coming.
            if (settleUntil != 0) {
                if (android.os.SystemClock.uptimeMillis() > settleUntil) {
                    settleUntil = 0;
                } else {
                    post(TICK);
                    return;
                }
            }

            if (phase == LEAD) {
                for (int i = 0; i < n; i++) {
                    Scroll s = (Scroll) LIVE.get(i);
                    if (!s.measured && s.wasShown) {
                        s.wrap();
                    }
                }
            }

            int longest = 0;
            for (int i = 0; i < n; i++) {
                Scroll s = (Scroll) LIVE.get(i);
                if (s.doubled && s.wasShown && s.period > longest) {
                    longest = s.period;
                }
            }

            // Nothing too long: rest AT the end of the lead-in, never past it — lines are measured
            // only at phase == LEAD, and a phase left beyond it means nothing ever scrolls again.
            if (phase >= LEAD && longest == 0) {
                phase = LEAD;
                post(IDLE);
                return;
            }

            for (int i = 0; i < n; i++) {
                Scroll s = (Scroll) LIVE.get(i);
                if (s.wasShown) {
                    s.move(phase);
                }
            }

            phase++;
            if (longest > 0 && phase > LEAD + longest / STEP) {
                phase = 0;
            }
            post(TICK);
        }

        private void post(int delay) {
            if (!ticking) {
                ticking = true;
                clock.postDelayed(TICKER, delay);
            }
        }
    }
}
