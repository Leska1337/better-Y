package com.innioasis.ipp;

import android.os.Handler;
import android.os.Looper;
import android.widget.TextView;

import com.innioasis.y1.R;

/**
 * The mod's own marquee — the running title of the player and of the queue row.
 *
 * Not the platform's: {@code android:ellipsize="marquee"} needs the view to be selected and
 * focused, restarts from scratch on every rebind and fades the ends out. This one scrolls a
 * doubled copy of the string ("text + gap + text") by {@code scrollTo}, so the line runs
 * continuously and reappears from the right without a jump.
 *
 * One instance per TextView, kept on the view's own tag; {@link #apply(String)} is
 * idempotent for the same string, which is what lets it be called from a bind that runs many times
 * a second.
 */
public final class Scroll implements Runnable {

    /**
     * The tag key an instance is kept under, so one view keeps one marquee however often it is
     * bound. A {@code setTag(int, Object)} key has to be a resource id and any id of ours will do.
     */
    private static final int TAG = R.string.ipp_brand;

    /**
     * Put this text on the view and run the marquee over it — the entry point every caller uses,
     * stock smali included ({@code MusicPlayerActivity}, {@code AudioPlayerActivity}).
     *
     * {@link #apply} early-outs on the same string, so calling this from a bind that runs many
     * times a second costs nothing once the text has settled.
     */
    public static void marqueeText(TextView tv, String text) {
        if (tv == null) {
            return;
        }
        try {
            Object o = tv.getTag(TAG);
            Scroll s;
            if (o instanceof Scroll) {
                s = (Scroll) o;
            } else {
                s = new Scroll(tv);
                tv.setTag(TAG, s);
            }
            s.apply(text);
        } catch (Throwable t) {
            tv.setText(text);
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
            Object o = tv.getTag(TAG);
            if (o instanceof Scroll) {
                ((Scroll) o).stop();
            }
        } catch (Throwable t) {
        }
    }

    private final TextView tv;
    private final Handler h;
    private String last;
    private int x;
    private int period;
    private boolean doubled;

    public Scroll(TextView tv) {
        this.tv = tv;
        this.h = new Handler(Looper.getMainLooper());
        this.x = 0;
        this.period = 0;
        this.doubled = false;
        this.last = null;
    }

    /** How much wider the first line is than the room the view has for it; <= 0 means it fits. */
    private int overflow() {
        android.text.Layout l = tv.getLayout();
        if (l == null || l.getLineCount() <= 0) {
            return 0;
        }
        int w = (int) l.getLineWidth(0);
        int room = tv.getWidth() - tv.getPaddingLeft() - tv.getPaddingRight();
        return w - room;
    }

    /**
     * Stop scrolling and leave the row as it was before the marquee started.
     *
     * The tick is a self-posting Handler message, so nothing outside this class can cancel it —
     * {@code setEllipsize} / {@code setSelected} do not touch it, which is why a row kept animating
     * after the wheel had moved on. {@link #run} replaces the text with the doubled copy, so the
     * plain string has to be put back, and {@code last} is cleared so applying the SAME text again
     * starts a fresh scroll.
     */
    public void stop() {
        h.removeCallbacks(this);
        tv.scrollTo(0, 0);
        if (last != null) {
            tv.setText(last);
        }
        last = null;
        x = 0;
        period = 0;
        doubled = false;
    }

    /** Put this string on the view and (re)start the marquee, unless it is already the one shown. */
    public void apply(String s) {
        // ipp: the screen-state receiver is registered from here — the first place in the mod that
        // has a Context and needs the answer. Idempotent, so no stock file has to be edited to do it.
        Lit.watch(tv.getContext());

        if (s == null) {
            s = "";
        }
        if (s.equals(last)) {
            return;
        }
        last = s;
        tv.setEllipsize(null);
        tv.setSingleLine();
        tv.setHorizontallyScrolling(true);
        tv.setText(s);
        x = 0;
        period = 0;
        doubled = false;
        tv.scrollTo(0, 0);
        h.removeCallbacks(this);
        h.postDelayed(this, 1500);
    }

    @Override
    public void run() {
        if (tv.getWindowToken() == null) {
            last = null;
            return;
        }

        // ipp: nothing to scroll into a screen that is off, or that the user is no longer looking
        // at. The 40 ms tick then drops to a one-second heartbeat and the scroll picks itself up on
        // its own when the title comes back. Measured with the screen off: 0.6% CPU against 0.17%
        // with a title that does not scroll — 750 pointless ticks per 30 s.
        //
        // Two questions, and neither can answer the other's case:
        //
        // - THE SCREEN IS OFF. That comes from Lit (a SCREEN_ON/SCREEN_OFF receiver) and from
        //   nothing the view can be asked: with the screen off this Activity really is STOPPED, but
        //   its window goes on reporting mViewVisibility=0x0 to its own client and keeps the focus,
        //   so getWindowVisibility(), isShown() and hasWindowFocus() all still answer "visible" and
        //   a gate built on any of them is dead code that builds, runs and changes no measurement.
        // - THE TITLE IS NOT ON SCREEN. isShown() walks the parent chain, so it covers both ways
        //   that happens: the LYRICS window, which hides `cl_player_center` (Other.hideV =
        //   INVISIBLE) with the title inside it while the Activity stays RESUMED, and another
        //   Activity taking over, where ActivityThread sets the whole decor INVISIBLE at onStop.
        //   (It also covers `tv_song_name2`, the title inside the lyrics window, which the stock
        //   layout leaves GONE.)
        //
        // NOT getWindowVisibility(): it flips when the app TRANSITION starts, which is before the
        // incoming screen has drawn anything, so opening the queue snaps the player's title back to
        // its start while the player is still the thing on the screen — and that reads as the device
        // having hung for a moment. isShown() goes false at onStop instead, i.e. once the new screen
        // is actually up, which is the moment there is nothing left to see anyway. The few ticks in
        // between cost nothing.
        //
        // Stopping outright is not an option: apply() early-outs on the same text, so nothing would
        // ever start it again.
        if (!Lit.screenOn() || !tv.isShown()) {
            x = 0;
            tv.scrollTo(0, 0);
            h.postDelayed(this, 1000);
            return;
        }

        if (!doubled) {
            if (overflow() <= 0) {
                x = 0;
                tv.scrollTo(0, 0);
                h.postDelayed(this, 1000);
                return;
            }
            String base = last != null ? last : "";
            String one = base + "     ";
            period = (int) tv.getPaint().measureText(one) + 1;
            tv.setText(one + base);
            doubled = true;
        }

        // ipp: 2px every 40ms = 50 px/s at 25 fps, and this rate is DELIBERATE — do not trade it
        // for CPU again. One tick is a scrollTo, i.e. an invalidate of a hardware-accelerated
        // window, and on this device that is ~3.4 ms of main thread whatever moved: a scrolling
        // title measures 10.57% CPU against 1.97% for one that fits. The cost falls linearly with
        // the frame rate (4px/80ms measures 5.1% at the same 50 px/s), but the text visibly judders
        // below 25 fps, and the saving that matters comes from the screen-off gate above instead.
        // The step and the delay below belong together: changing one alone changes the speed of
        // the text.
        int nx = x + 2;
        if (nx >= period && period > 0) {
            x = 0;
            tv.scrollTo(0, 0);
            h.postDelayed(this, 1500);
            return;
        }
        x = nx;
        tv.scrollTo(x, 0);
        h.postDelayed(this, 40);
    }
}
