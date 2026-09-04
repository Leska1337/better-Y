package com.innioasis.ipp;

import android.app.Activity;
import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;

import java.util.List;

import com.innioasis.fm.configs.KeyMap;
import com.innioasis.music.MusicPlayerActivity;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.base.BaseActivity;
import com.innioasis.y1.base.BasePlayerActivity;
import com.innioasis.y1.service.PlayerService;

/**
 * What a hardware button press means: how long a hold has to be before it counts as a long press,
 * and what the bottom button does when it is pressed once against twice.
 *
 * <p>Both questions are answered here rather than in the Activities because stock hardcodes them in
 * more than one place — the long-press threshold exists twice ({@code BaseActivity} and
 * {@code BasePlayerActivity}, with different numbers), and a value hardcoded twice is the shape of
 * bug this class exists to prevent.
 */
public final class Press {

    private static final Handler h = new Handler(Looper.getMainLooper());

    /** The pending play/pause of a first bottom press, waiting to see whether a second arrives. */
    private static Runnable pending;

    public static void clearPending(Runnable r) {
        if (pending == r) {
            pending = null;
        }
    }

    /**
     * ipp: how many key-repeat events a hold must produce before it counts as a long press.
     *
     * <p>Stock used a hard-coded 3 for every key (~500 ms: the ~400 ms Android key-repeat timeout
     * plus 3 × 50 ms). The top (MENU) button now fires on the FIRST repeat, which is as early as
     * the stock repeat mechanism allows. Called from {@code BaseActivity.dispatchKeyEvent} in BOTH
     * places that used the 3: the long-press trigger ({@code repeatCount == limit}) and the
     * short-press gate ({@code downRepeatCount < limit}) — they must stay the same number or a hold
     * would fire both.
     *
     * <p>Every other key keeps 3: the wheel (KEY_UP/KEY_DOWN) needs that tolerance, a slightly
     * long-held click must still scroll one row.
     */
    public static int longLimit(int key) {
        return key == KeyMap.INSTANCE.getKEY_MENU() ? 1 : 3;
    }

    /**
     * ipp: same idea as {@link #longLimit}, for the Now-Playing screen — {@code BasePlayerActivity}
     * overrides {@code dispatchKeyEvent} with its OWN long-press threshold, a hard-coded
     * {@code repeatCount == 8} (~800 ms), which is why the top button still felt slow there after
     * {@code longLimit} was added. The top (MENU) button now fires on the first repeat, like
     * everywhere else.
     *
     * <p>LEFT/RIGHT keep 8 on purpose: their long press starts seeking, and a hair-trigger there
     * would turn ordinary track skips into scrubs. ENTER (shutdown dialog) and PLAY (stop) keep it
     * for the same reason.
     */
    public static int playerLongLimit(int key) {
        return key == KeyMap.INSTANCE.getKEY_MENU() ? 1 : 8;
    }

    /**
     * The bottom button, which serves two gestures: pressed once it is play/pause, pressed twice it
     * opens the player. Nothing distinguishes them at the moment of the first press, so the
     * play/pause is posted 250 ms into the future ({@link Run}) and a second press within that
     * window cancels it and opens the player instead.
     *
     * <p>Not on the player itself — there the button is stock's.
     */
    public static boolean bottomPressed(BaseActivity a) {
        if (a == null || a instanceof BasePlayerActivity) {
            return false;
        }
        Runnable p = pending;
        if (p != null) {
            pending = null;
            h.removeCallbacks(p);
            return openPlayer(a);
        }
        Runnable r = new Run(a);
        pending = r;
        h.postDelayed(r, 250);
        return true;
    }

    /**
     * ipp #384.2: the double press means "show what is playing", and that is not always music — an
     * audiobook or the radio opens its OWN screen. Same dispatch stock's own "Now playing" menu
     * entry does; everything below stays the music path.
     */
    private static boolean openPlayer(Activity a) {
        if (Audio.openOther(a)) {
            return true;
        }
        try {
            PlayerService ps = Y1Application.Companion.getPlayerService();
            if (ps == null) {
                return false;
            }
            List list = ps.getMusicList();
            if (list != null && list.size() > 0) {
                if (a.isFinishing()) {
                    return false;
                }
                Intent i = new Intent(a, MusicPlayerActivity.class);
                i.putExtra("from_now_playing", true);
                a.startActivity(i);
                return true;
            }
        } catch (Throwable t) {
            return false;
        }
        // Nothing loaded: say so and still report the press as handled, or the stock branch would
        // act on it as well.
        try {
            Toast.makeText(a, a.getString(R.string.no_content), Toast.LENGTH_SHORT).show();
        } catch (Throwable t) {
        }
        return true;
    }

    /**
     * The deferred half of a single bottom press.
     *
     * <p>Named, never anonymous: d8 8.2.2-dev crashes dexing anonymous inner classes here, and this
     * one has to be an object anyway — {@link #bottomPressed} cancels it by identity
     * ({@code Handler.removeCallbacks}).
     *
     * <p>The first thing it does is drop itself from {@link #pending} — otherwise a press arriving
     * just after the tick has fired would find a stale Runnable there and take the "second press"
     * branch on what the user meant as a fresh first one.
     *
     * <p>The Activity is held RAW, without its {@code ViewBinding} type parameter: a generic field
     * type makes javac emit a class {@code Signature} attribute and the bundled d8 crashes dexing
     * those.
     */
    public static final class Run implements Runnable {

        private final BaseActivity a;

        Run(BaseActivity a) {
            this.a = a;
        }

        @Override
        public void run() {
            clearPending(this);
            if (a == null || a.isFinishing()) {
                return;
            }
            // Unmute first: the stock code mutes while it decides what the press meant.
            PlayerService ps = Y1Application.Companion.getPlayerService();
            if (ps != null) {
                ps.muteOrNoMuteMusic(false);
            }
            ps = Y1Application.Companion.getPlayerService();
            if (ps != null) {
                ps.playOrPause();
            }
            a.direction(BaseActivity.Direction.BOTTOM);
        }
    }
}
