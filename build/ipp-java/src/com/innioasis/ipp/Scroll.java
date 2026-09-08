package com.innioasis.ipp;

import android.graphics.Paint;
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
 *   the same DURATION instead would mean a different speed each, and text scrolling at a speed of
 *   its own cannot be read alongside text that does not; equalising the DISTANCE instead — one
 *   period for every line, the gap stretched to fill it — costs a gap so wide on a short line
 *   that the row reads as empty for seconds at a time;
 * - the wait is invisible, because a round ends exactly where it began. The period is MEASURED
 *   off the string that was built, so the offset a line wraps at really is where its second copy
 *   starts, and the line rests at its own first pixel rather than a pixel or two off it;
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

    /** The gap between one copy of a line and the next. */
    private static final String GAP = "     ";

    /**
     * How long the lines hold still for a screen that is being built, in ms. Long enough for the
     * heaviest screen here (the queue takes some 400 ms from its first bound row to its window),
     * short enough that a line bound into something that never appears is not frozen for long.
     */
    private static final int SETTLE = 1200;

    /** The heartbeat while nothing may move: the screen is off, or no line is on screen. */
    private static final int IDLE = 1000;

    /** Every line carrying text of ours, shown or not. Pruned as their windows go. */
    private static final ArrayList LIVE = new ArrayList();

    private static final Tick TICKER = new Tick();
    private static Handler clock;
    private static boolean ticking;

    /**
     * Ticks since the current lap began — the shared phase, and the whole of the synchronisation.
     * Up to {@link #LEAD} every line rests at its start; past it, every line has covered
     * {@code (phase - LEAD) * STEP} pixels of the lap, and stands wherever that leaves it within
     * its own round.
     */
    private static int phase;

    /**
     * While a screen is being BUILT, nothing moves — the deadline by which it must have appeared.
     *
     * The lines cannot move then anyway: the marquee is a message on the very thread that builds
     * the screen, so a screen coming up blocks it, and what shows through is not a pause but a
     * judder — the ticks that land between one chunk of that work and the next each carry the text
     * 2px and stop again. The queue is the worst of them, building its visible rows and then its
     * tail a frame later. Holding the lines still from the first row bound turns that into what it
     * really is: a line that stopped, and then a new screen.
     *
     * The signal is a line joining with NO WINDOW TOKEN — a view that is not attached to a window
     * at all, which is a screen still being put together. Merely "not shown" is not the same thing
     * and must not be used here: a covered Activity's rows are rebound on every track change
     * ({@code Lists.refresh}), and taking those for a screen being built would hold the marquee on
     * the screen the user IS looking at, every time a track starts.
     */
    private static long settleUntil;

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
    /** The characters of the doubled copy once it is on the view, or null. */
    private String shown;
    private int x;
    /** One round of this line: from one copy of the text to the start of the next, MEASURED. */
    private int period;
    private boolean hscroll;
    private boolean running;
    private boolean doubled;
    private boolean measured;
    private boolean seen;
    /** Whether the tick found this line on screen last time — the transition is what restarts a lap. */
    private boolean wasShown;
    /**
     * This line has been given text nobody has read yet, and owes a lap from the rest — spent by
     * the tick when the line is on screen. See {@link #join}.
     */
    private boolean fresh;

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
     *
     * BUT ONLY A LINE THAT IS ITSELF ON SCREEN MAY RESTART THE LAP. A screen is built well before
     * it is shown — the queue's rows are bound in {@code onCreate}, some 400 ms before its window
     * covers the player — so a line joining from there would snap the lines the user is still
     * looking at back to their start, in the middle of reading them, for no visible reason. The
     * lap is restarted by the OLD screen going instead, which is the tick's business.
     *
     * A line joining unseen means something else as well, and it is the only warning there is:
     * a screen is being built on this thread right now. Everything holds still from here — see
     * {@link #settleUntil}.
     */
    private void join() {
        // ipp: the screen-state receiver is registered from here — the first place in the mod that
        // has a Context and needs the answer. Idempotent, so no stock file has to be edited to do it.
        Lit.watch(tv.getContext());
        if (!LIVE.contains(this)) {
            LIVE.add(this);
        }
        if (tv.isShown()) {
            phase = 0;
        } else {
            // A LIST ROW IS BOUND WHILE IT IS DETACHED, so the branch above is never the one a list
            // takes: ListView scraps its children and re-attaches them after getView, and
            // isShown() answers false for every row of every list. The lap restart is therefore
            // asked for here and granted by the tick, once the line is really on screen — which
            // also keeps the other half of the rule, that a screen being BUILT must not restart
            // the lap of the screen the user is still reading.
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
     * detail: until the ellipsis is dropped, the view's layout line width is exactly the view's
     * width whatever the text says — asking it would answer "it fits" for every string there is,
     * and nothing would ever scroll.
     *
     * THE PERIOD IS THE MEASURE OF WHAT WAS BUILT, ROUNDED — not the measure plus a pixel, and not
     * a width worked out from anything else. It is the offset at which the second copy begins, so
     * a line standing there is standing exactly where it started, which is what lets it wrap and
     * then wait out the rest of the lap with nothing moving on screen. A period a pixel past that
     * offset is a pixel of correction every time the lap turns over.
     */
    private void wrap() {
        int room = tv.getWidth() - tv.getPaddingLeft() - tv.getPaddingRight();
        if (room <= 0) {
            return;                       // not laid out yet; the next lap asks again
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

    /**
     * Where this line stands at that phase of the shared lap: at {@code (phase - LEAD) * STEP} of
     * its own round, and back at its start once that round is done — where it waits for the lines
     * still running.
     */
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
                    if (s.fresh) {                 // new text, and now on screen: it owes a lap
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
            // A LAP IS RESTARTED BY A SCREEN GOING, NOT BY ONE ARRIVING. A window is up and its
            // views report themselves shown a good while before it covers what is under it — the
            // queue binds its rows in onCreate and takes some 400 ms to appear — so a line
            // restarting the lap as it arrives snaps the lines the user is still reading back to
            // their start, in front of them. The screen it came to replace going away is the
            // moment nothing of the old one is left to disturb, and the new line gets its full
            // rest from there.
            if (vanished || (appeared && !was)) {
                phase = 0;
                settleUntil = 0;
            } else if (unread) {
                // A line already on screen has been given text nobody has read yet — the row the
                // cursor has just moved onto, or the one a track change moved the cursor to on a
                // RECYCLED view, which is the case the transition above cannot see: the instance
                // on that view was never off screen, so nothing "appeared". It owes a lap from the
                // rest, and so do the lines beside it. This does NOT release a hold: a screen
                // being built rebinds rows too, and what it is being built over must stand still.
                phase = 0;
            }
            // A screen is being built on this very thread: hold everything where it stands until
            // the screen it replaces has gone, or until it turns out not to be coming. Not until
            // the new one APPEARS: the two windows overlap for a tick or two, and moving in that
            // window is the last of the judder rather than the end of it. See settleUntil.
            if (settleUntil != 0) {
                if (android.os.SystemClock.uptimeMillis() > settleUntil) {
                    settleUntil = 0;
                } else {
                    post(TICK);
                    return;
                }
            }

            // The lead-in is over: work out which lines are too long for their view, and how far
            // the longest of them has to go.
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

            // Nothing on screen is too long for its view: rest here until something new arrives,
            // which restarts the lap from join().
            //
            // THE PHASE RESTS AT THE END OF THE LEAD-IN AND IS NEVER LEFT PAST IT. Lines are
            // measured and doubled at exactly {@code phase == LEAD}, and only the lap turning over
            // brings the phase back round to it — so with nothing moving there is no lap, and a
            // phase left standing beyond that point is a screen on which nothing can ever be
            // measured, and therefore on which nothing can ever scroll, again. It is reached by an
            // ordinary track change: the running title stops being the cursor while it is halfway
            // through its round, the longest line becomes 0 at a phase well past the lead-in, and
            // the clock rests there for good. That is "the scroll works once and then never".
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
