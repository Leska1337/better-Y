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
 * What a button press means: the long-press thresholds (stock hardcodes them twice, with different
 * numbers) and the bottom button's single press against double press.
 */
public final class Press {

    private static final Handler h = new Handler(Looper.getMainLooper());

    /** A first bottom press's play/pause, waiting to see whether a second arrives. */
    private static Runnable pending;

    public static void clearPending(Runnable r) {
        if (pending == r) {
            pending = null;
        }
    }

    /**
     * Key repeats before a hold is a long press, for {@code BaseActivity.dispatchKeyEvent}. Both the
     * trigger and the short-press gate there ask this, and must get the same number or a hold fires
     * both. The top button fires on the first repeat; everything else keeps 3, so a slightly long
     * wheel click still scrolls one row.
     */
    public static int longLimit(int key) {
        return key == KeyMap.INSTANCE.getKEY_MENU() ? 1 : 3;
    }

    /**
     * The same for {@code BasePlayerActivity}, which has its own threshold of 8. LEFT/RIGHT keep it:
     * their long press seeks, and a hair trigger would turn track skips into scrubs.
     */
    public static int playerLongLimit(int key) {
        return key == KeyMap.INSTANCE.getKEY_MENU() ? 1 : 8;
    }

    /**
     * Pressed once: play/pause, posted 250 ms ahead. Pressed again inside that window: cancel it and
     * open the player. On the player itself the button stays stock's.
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

    /** An audiobook or the radio opens its own screen, as stock's "Now playing" entry does. */
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
        // Still handled, or the stock branch acts on the press too.
        try {
            Toast.makeText(a, a.getString(R.string.no_content), Toast.LENGTH_SHORT).show();
        } catch (Throwable t) {
        }
        return true;
    }

    /**
     * The deferred single press, cancelled by identity. It clears {@link #pending} first, or a press
     * right after it fired would be taken for the second one.
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
            // Stock mutes while it decides what the press meant.
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
