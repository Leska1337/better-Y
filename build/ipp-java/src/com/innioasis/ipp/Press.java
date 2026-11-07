package com.innioasis.ipp;

import android.app.Activity;
import android.content.Intent;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.view.KeyEvent;
import android.widget.Toast;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.List;

import com.innioasis.fm.configs.KeyMap;
import com.innioasis.music.MusicPlayerActivity;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.activity.IppFlowActivity;
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

    private static boolean laid;

    /**
     * Puts the wheel and side-key codes of this device and firmware into {@code KeyMap}, which
     * everything reads them from. The Y2's kernel sends the wheel as DPAD_UP/DOWN and prev/next as
     * DPAD_LEFT/RIGHT. On the Y1 the kernel without {@code /proc/tpd_keys_enable} (the Rockbox
     * builds, Type A and B) sends the wheel as scancodes 103/108 and prev/next as 105/106, and what
     * they become depends on that firmware's Generic.kl.
     */
    public static void layout() {
        if (laid) return;
        laid = true;
        KeyMap k = KeyMap.INSTANCE;
        String hw = Build.HARDWARE;
        if ("Y2".equals(Build.MODEL) || (hw != null && hw.indexOf("6582") >= 0)) {
            k.setKEY_UP(KeyEvent.KEYCODE_DPAD_UP);
            k.setKEY_DOWN(KeyEvent.KEYCODE_DPAD_DOWN);
            k.setKEY_LEFT(KeyEvent.KEYCODE_DPAD_LEFT);
            k.setKEY_RIGHT(KeyEvent.KEYCODE_DPAD_RIGHT);
            return;
        }
        if (!new File(KEY_LOCK).exists()) fromLayout(k);
    }

    /** The touch-wheel driver's switch; the stock 3.1.2 kernel has it, the Rockbox ones do not. */
    public static final String KEY_LOCK = "/proc/tpd_keys_enable";

    /** Codes for scancodes 103/108 (wheel) and 105/106 (prev/next); a pair it cannot read stays. */
    private static void fromLayout(KeyMap k) {
        int up = 0, down = 0, left = 0, right = 0;
        BufferedReader r = null;
        try {
            r = new BufferedReader(new FileReader("/system/usr/keylayout/Generic.kl"));
            String line;
            while ((line = r.readLine()) != null) {
                String[] w = line.trim().split("\\s+");
                if (w.length < 3 || !"key".equals(w[0])) continue;
                int code = KeyEvent.keyCodeFromString("KEYCODE_" + w[2]);
                if (code <= 0) continue;
                if ("103".equals(w[1])) up = code;
                else if ("108".equals(w[1])) down = code;
                else if ("105".equals(w[1])) left = code;
                else if ("106".equals(w[1])) right = code;
            }
        } catch (Throwable t) {
        } finally {
            if (r != null) try { r.close(); } catch (Throwable t) { }
        }
        if (up > 0 && down > 0) {
            k.setKEY_UP(up);
            k.setKEY_DOWN(down);
        }
        if (left > 0 && right > 0) {
            k.setKEY_LEFT(left);
            k.setKEY_RIGHT(right);
        }
    }

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
     * open the player. On the player itself the button stays stock's; Cover Flow, which opens the
     * player with its own flight, turns to the playing album instead.
     */
    public static boolean bottomPressed(BaseActivity a) {
        if (a == null || a instanceof BasePlayerActivity) {
            return false;
        }
        Runnable p = pending;
        if (p != null) {
            pending = null;
            h.removeCallbacks(p);
            if (a instanceof IppFlowActivity) {
                ((IppFlowActivity) a).toPlaying();
                return true;
            }
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
                ps.playOrPause();
            }
            a.direction(BaseActivity.Direction.BOTTOM);
        }
    }
}
