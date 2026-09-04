package com.innioasis.ipp;

import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.widget.TextView;

import java.util.ArrayList;

import com.innioasis.y1.R;

/**
 * The mod's own marquee — the running title of the player, of the queue row and of the row under
 * the cursor in the song, album and artist lists.
 *
 * Not the platform's: {@code android:ellipsize="marquee"} needs the view to be selected and
 * focused, restarts from scratch on every rebind and fades the ends out. This one scrolls a
 * doubled copy of the string ("text + gap + text") by {@code scrollTo}, so the line runs
 * continuously and reappears from the right without a jump.
 *
 * EVERY LINE ON SCREEN MOVES OFF ONE CLOCK AND SHARES ONE LAP, and that is what makes several of
 * them at once readable. Each instance keeps its own text and its own width, but not its own
 * timer: the static ticker below advances all of them in a single message, so
 *
 * - they start together, rest together and start again together — no line ever pauses while its
 *   neighbour is halfway across, which is what independent timers look like;
 * - they travel at the same speed. The lap lasts as long as the LONGEST line needs; a shorter one
 *   finishes its own round earlier and waits at its start until the lap ends. Giving every line
 *   the same DURATION instead would mean a different speed each, and text that scrolls at a speed
 *   of its own cannot be read alongside text that does not;
 * - they cost one frame between them. A {@code scrollTo} is an invalidate of a
 *   hardware-accelerated window and on this device that is ~3.4 ms of main thread whatever moved,
 *   so the bill is per FRAME and not per view — sixteen labels moved in one tick cost what one
 *   label moved in one tick costs, while sixteen timers landing on sixteen different milliseconds
 *   cost sixteen times that.
 *
 * One instance per TextView, kept on the view's own tag; the entry points are idempotent for the
 * same string, which is what lets them be called from a bind that runs many times a second.
 */
public final class Scroll {

    /**
     * The tag key an instance is kept under, so one view keeps one marquee however often it is
     * bound. A {@code setTag(int, Object)} key has to be a resource id and any id of ours will do.
     */
    private static final int TAG = R.string.ipp_brand;

    /**
     * 2px every 40ms = 50 px/s at 25 fps, and this rate is DELIBERATE — do not trade it for CPU
     * again. A scrolling title measures 10.57% CPU against 1.97% for one that fits; the cost falls
     * linearly with the frame rate (4px/80ms measures 5.1% at the same 50 px/s), but the text
     * visibly judders below 25 fps, and the saving that matters comes from the gates in the tick
     * instead. The step and the delay belong together: changing one alone changes the speed.
     */
    private static final int STEP = 2;
    private static final int TICK = 40;

    /** The rest at the head of every lap, in ticks — 1.5 s of standing still to be read. */
    private static final int LEAD = 38;

    /** The heartbeat while nothing may move: the screen is off, or no line is on screen. */
    private static final int IDLE = 1000;

    /** Every line carrying text of ours, shown or not. Pruned as their windows go. */
    private static final ArrayList LIVE = new ArrayList();

    private static final Tick TICKER = new Tick();
    private static Handler clock;
    private static boolean ticking;

    /**
     * Ticks since the current lap began — the shared phase, and the whole of the synchronisation.
     * Up to {@link #LEAD} every line rests at its start; past it, every line stands at
     * {@code (phase - LEAD) * STEP} of its own text, clamped to its own width.
     */
    private static int phase;

    /**
     * Put this text on the view and run the marquee over it — the entry point of the screens that
     * hold the string themselves ({@code MusicPlayerActivity}, {@code AudioPlayerActivity},
     * {@code IppQueueActivity}).
     */
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

    /**
     * The entry point of the FOCUSED list row: scroll whatever text the adapter has just put on
     * this view. Every other row of the list goes to {@link #rowPlain} instead — only the row under
     * the cursor runs, the way the stock marquee did.
     *
     * The row's own bind has already set the string, so there is nothing to pass and nothing to
     * set again — a rebind that changed nothing costs one string compare and no layout at all,
     * which matters because this runs for every visible row of every list that has it.
     */
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

    /**
     * The entry point of every OTHER row: give up the cursor and go back to the resting look.
     *
     * Costs NOTHING for a line that was not actually running — which is every row on screen but
     * one, and the row under the cursor too while the wheel is still turning. Only a line that
     * reached the point of moving has anything to put back.
     */
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

    /**
     * Cancel the marquee started by {@link #marqueeText}, if any. Needed wherever the rows OUTLIVE
     * the focus change — the queue screen repaints two rows instead of rebuilding the list, so the
     * view that lost focus is still on screen and would otherwise go on scrolling.
     */
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
    /** The plain string, i.e. what the line really says. */
    private String last;
    /** The doubled copy actually on the view once it is known to overflow, or null. */
    private String shown;
    private int x;
    private int period;
    private boolean hscroll;
    private boolean running;
    private boolean doubled;
    private boolean measured;
    private boolean seen;

    public Scroll(TextView tv) {
        this.tv = tv;
    }

    /** True while the view is running and carries exactly this text — nothing to do on a rebind. */
    private boolean holds(String s) {
        return running && s.equals(doubled ? shown : last);
    }

    /**
     * The text the adapter has already set: take it over, and TOUCH THE VIEW NOT AT ALL.
     *
     * Everything a running line needs — dropping the ellipsis, the doubled copy — is done later,
     * by {@link #wrap}, at the end of the lead-in. That is the whole of what makes a moving list
     * cost nothing: {@code setEllipsize} drops the view's text {@code Layout} and the next measure
     * rebuilds it, ~2.2 ms a label on this device, and a click that moves the cursor binds two
     * rows. Doing it here — once as the row takes the cursor and once as it gives it up — measured
     * 47.8 ms/click on Albums against 39.0 with no switching at all; doing it in {@code wrap}
     * means a lap that never reaches its running half never touches a view, and while the wheel is
     * turning no lap ever does.
     */
    private void take(String s) {
        last = s;
        reset();
        running = true;
        join();
    }

    /** Put this string on the view and (re)start the marquee, unless it is already the one shown. */
    public void apply(String s) {
        if (s.equals(last)) {
            return;
        }
        last = s;
        reset();
        scrollable();
        tv.setSingleLine();
        running = true;
        tv.setText(s);
        join();
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
     * The layout a running line needs: no ellipsis, so the text is laid out at its full width
     * instead of being cut at the view's edge.
     *
     * The horizontal scrolling is set once per view and never taken back — without it
     * {@code StaticLayout} breaks the text by WORDS at the view's width and the ellipsis lands at
     * the last space that fits, well before the right edge. Every row layout here turns it on
     * itself through {@code android:singleLine="true"}; this call is what makes the class not
     * depend on that.
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
     * Give up the cursor: stop, put the plain string back and cut it with an ellipsis again.
     *
     * Only a line that actually reached {@link #wrap} has anything to undo — a row that merely
     * held the cursor for a moment while the wheel went past was never touched, so it is left
     * exactly as the adapter drew it.
     *
     * The text is put back only if the view still carries OUR doubled copy. A row is recycled
     * while it is running as readily as at any other time, and by then the adapter has already
     * written the next song's name onto it — restoring the old string there would put the wrong
     * text on the row and leave it that way.
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
     * Join the clock and start the lap again from its rest, for EVERY line — a line that has just
     * been given new text has not been read yet, and the others have to wait for it or the two are
     * out of step for good.
     *
     * That is also what keeps a moving list cheap: every rebind lands here, so while the wheel is
     * turning the lap never reaches its running half and no text is ever doubled.
     */
    private void join() {
        // ipp: the screen-state receiver is registered from here — the first place in the mod that
        // has a Context and needs the answer. Idempotent, so no stock file has to be edited to do it.
        Lit.watch(tv.getContext());
        if (!LIVE.contains(this)) {
            LIVE.add(this);
        }
        phase = 0;
        if (clock == null) {
            clock = new Handler(Looper.getMainLooper());
        }
        clock.removeCallbacks(TICKER);
        ticking = true;
        clock.postDelayed(TICKER, TICK);
    }

    /**
     * Stop scrolling and leave the line as it was before the marquee started. The text has to be
     * put back by hand, because {@link #wrap} replaced it with the doubled copy.
     */
    public void stop() {
        LIVE.remove(this);
        running = false;
        if (doubled && last != null) {
            tv.setText(last);
        }
        last = null;
        reset();
    }

    /** Detached after having been attached: the view is gone and so is the instance on its tag. */
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
     * Work out whether this line has anywhere to go, and if it has, make it able to go there:
     * drop the ellipsis and put the doubled copy on it.
     *
     * EVERYTHING that touches the view is here, at the END of the lead-in, and not at the bind —
     * both the {@code setEllipsize} and the {@code setText} drop the view's text {@code Layout},
     * and a list under the wheel rebinds its rows far too often to pay for either. A lap only ever
     * reaches this point after 1.5 s of the list standing still.
     *
     * **The width is measured with the PAINT, not off {@code getLayout()}**, and that is not a
     * detail: until the line above runs, the view is still ellipsized, so its layout's line width
     * is exactly the view's width whatever the text says — asking it would answer "it fits" for
     * every string there is, and nothing would ever scroll.
     */
    private void wrap() {
        int room = tv.getWidth() - tv.getPaddingLeft() - tv.getPaddingRight();
        if (room <= 0) {
            return;                       // not laid out yet; the next lap asks again
        }
        measured = true;
        String base = last != null ? last : "";
        if (tv.getPaint().measureText(base) <= room) {
            return;                       // it fits
        }
        scrollable();
        String one = base + "     ";
        period = (int) tv.getPaint().measureText(one) + 1;
        shown = one + base;
        doubled = true;
        tv.setText(shown);
    }

    /** Where this line stands at that phase of the shared lap. */
    private void move(int p) {
        int nx = 0;
        if (p > LEAD && doubled) {
            nx = (p - LEAD) * STEP;
            if (nx > period) {
                nx = period;
            }
        }
        if (nx != x) {
            x = nx;
            tv.scrollTo(x, 0);
        }
    }

    /** Nothing to scroll into a screen that is off, or a line the user is not looking at. */
    private void park() {
        if (x != 0) {
            x = 0;
            tv.scrollTo(0, 0);
        }
    }

    /**
     * The one clock. Two gates decide whether anything may move at all, and neither can answer the
     * other's case:
     *
     * - THE SCREEN IS OFF. That comes from {@link Lit} (a SCREEN_ON/SCREEN_OFF receiver) and from
     *   nothing a view can be asked: with the screen off the Activity really is STOPPED, but its
     *   window goes on reporting {@code mViewVisibility=0x0} to its own client and keeps the focus,
     *   so {@code getWindowVisibility()}, {@code isShown()} and {@code hasWindowFocus()} all still
     *   answer "visible" and a gate built on any of them is dead code that builds, runs and changes
     *   no measurement.
     * - THE LINE IS NOT ON SCREEN. {@code isShown()} walks the parent chain, so it covers both ways
     *   that happens: the LYRICS window, which hides {@code cl_player_center} with the title inside
     *   it while the Activity stays RESUMED, and another Activity taking over, where ActivityThread
     *   sets the whole decor INVISIBLE at onStop. NOT {@code getWindowVisibility()}: it flips when
     *   the app TRANSITION starts, which is before the incoming screen has drawn anything, so
     *   opening the queue would snap the player's title back to its start while the player is still
     *   the thing on the screen.
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
            for (int i = 0; i < n; i++) {
                Scroll s = (Scroll) LIVE.get(i);
                if (!lit || !s.tv.isShown()) {
                    s.park();
                } else {
                    any = true;
                }
            }
            if (!any) {
                phase = 0;
                post(IDLE);
                return;
            }

            // The lead-in is over: find out which lines overflow and how far the longest has to go.
            if (phase == LEAD) {
                for (int i = 0; i < n; i++) {
                    Scroll s = (Scroll) LIVE.get(i);
                    if (!s.measured && s.tv.isShown()) {
                        s.wrap();
                    }
                }
            }

            int longest = 0;
            for (int i = 0; i < n; i++) {
                Scroll s = (Scroll) LIVE.get(i);
                if (s.doubled && s.tv.isShown() && s.period > longest) {
                    longest = s.period;
                }
            }

            // Nothing on screen is too long for its view: rest here until something new arrives,
            // which restarts the lap from join().
            if (phase >= LEAD && longest == 0) {
                post(IDLE);
                return;
            }

            for (int i = 0; i < n; i++) {
                Scroll s = (Scroll) LIVE.get(i);
                if (s.tv.isShown()) {
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
