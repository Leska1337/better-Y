package com.innioasis.ipp;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.PowerManager;
import android.os.SystemClock;
import android.view.KeyEvent;

import com.innioasis.fm.configs.KeyMap;
import com.innioasis.music.util.Other;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.activity.SettingActivity;
import com.innioasis.y1.databinding.ActivitySettingBinding;
import com.innioasis.y1.service.PlayerService;
import com.innioasis.y1.theme.ThemeManager;
import com.innioasis.y1.utils.DialogUtil;

import java.io.File;
import java.io.FileInputStream;
import java.util.List;

/**
 * Force reboot: TOP + BOTTOM held for three seconds, with fallbacks for a system that no longer
 * answers ({@link #reboot}). While both are held the pair is SWALLOWED, or their own long presses
 * (menu, stop) fire half a second in. State is static: a press can start on one Activity and end
 * on the next. Hooked into every {@code dispatchKeyEvent} that does not delegate.
 *
 * The keys arrive on the MAIN thread, which is the one stuck when this is wanted, so a watchdog
 * thread restarts things when the main thread stops answering. The kernel's input devices are not
 * readable for uid {@code system}.
 */
public final class Force {

    private Force() { }

    private static final long HOLD_MS = 3000;
    /** A DOWN older than this never got its UP (its Activity went away). */
    private static final long STALE_MS = 8000;
    private static final long PING_MS = 2000;
    /** Well above an ANR's 5 s; every heavy pass here runs on its own thread. */
    private static final long STUCK_MS = 20000;

    private static final Handler H = new Handler(Looper.getMainLooper());

    private static long menuAt;     // uptime of the DOWN, 0 while the button is up
    private static long playAt;
    private static boolean armed;   // both were down; keys stay swallowed until both are up again
    private static Boom pending;
    private static volatile boolean fired;

    /** First thing in {@code dispatchKeyEvent}; true = swallow. */
    public static boolean key(KeyEvent e) {
        try {
            if (e == null) return false;
            watch();
            CenterHold.key(e);
            // After firing, nothing gets through: the top button's short press arrives on its UP
            // and would change the screen under the shutdown window.
            if (fired) return true;
            int code = e.getKeyCode();
            boolean menu = code == KeyMap.INSTANCE.getKEY_MENU();
            boolean play = code == KeyMap.INSTANCE.getKEY_PLAY();
            if (!menu && !play) return false;

            long now = SystemClock.uptimeMillis();
            int action = e.getAction();
            if (action == KeyEvent.ACTION_DOWN) {
                if (menu && menuAt == 0) menuAt = now;
                if (play && playAt == 0) playAt = now;
            } else if (action == KeyEvent.ACTION_UP) {
                if (menu) menuAt = 0;
                if (play) playAt = 0;
            }
            if (menuAt != 0 && now - menuAt > STALE_MS) menuAt = 0;
            if (playAt != 0 && now - playAt > STALE_MS) playAt = 0;

            boolean both = menuAt != 0 && playAt != 0;
            if (both) {
                armed = true;
                if (pending == null) {
                    pending = new Boom();
                    H.postDelayed(pending, HOLD_MS);
                }
            } else {
                cancel();
                if (menuAt == 0 && playAt == 0) {
                    boolean was = armed;
                    armed = false;
                    return was;   // the release that ends it is swallowed too
                }
            }
            return armed;
        } catch (Throwable t) {
            reset();
            return false;
        }
    }

    private static void cancel() {
        if (pending != null) {
            H.removeCallbacks(pending);
            pending = null;
        }
    }

    private static void reset() {
        cancel();
        menuAt = 0;
        playAt = 0;
        armed = false;
    }

    /** Leaves {@code armed} set: the releases still to come must be swallowed (see {@link #key}). */
    private static final class Boom implements Runnable {
        public void run() {
            cancel();
            reboot();
        }
    }

    // Shutdown and reboot never return, and DialogUtil dismisses only after the callback has, so
    // the confirm dialog would stay under the shutdown screen: the frame is handed back first.
    private static final int SHUTDOWN_DELAY_MS = 400;

    /** Replaces {@code Other.INSTANCE.shutdown()} in {@code BaseActivity$askShutdown$1.confirm}. */
    public static void postShutdown() {
        H.postDelayed(new Down(), SHUTDOWN_DELAY_MS);
    }

    private static final class Down implements Runnable {
        public void run() {
            Other.INSTANCE.shutdown();
        }
    }

    // The Reboot row of stock Settings, under Shutdown and with its picture. Stock finds rows by
    // TITLE in the list, confirm and the panel, and so do these three hooks.

    /** End of {@code SettingActivity.setRecyclerData}. */
    public static void settingsRow(SettingActivity a, List list) {
        String off = a.getString(R.string.setting_shutdown);
        int at = list.size();
        for (int i = 0; i < list.size(); i++) {
            if (off.equals(((SettingActivity.SettingItem) list.get(i)).getTitle())) {
                at = i + 1;
                break;
            }
        }
        list.add(at, new SettingActivity.SettingItem(a.getString(R.string.ipp_reboot), true, ""));
    }

    /** From the top of {@code SettingActivity.confirm}; true when the row was ours. */
    public static boolean settingsConfirm(SettingActivity a, String title) {
        String name = a.getString(R.string.ipp_reboot);
        if (!name.equals(title)) return false;
        DialogUtil d = new DialogUtil(a.getActivity(), false, R.style.Dialog_Common);
        d.setDialogTitle(name, a.getString(R.string.ipp_reboot_confirm), new Again(), false, true);
        return true;
    }

    /** From {@code SettingActivity.refreshRight}, after the title is set; true when it was ours. */
    public static boolean settingsPanel(SettingActivity a, String title) {
        if (!a.getString(R.string.ipp_reboot).equals(title)) return false;
        ActivitySettingBinding vb = (ActivitySettingBinding) a.getVb();
        ThemeManager.INSTANCE.commonSetIcon(vb.rightImage, R.drawable.icon_setting_shutdown);
        vb.infoStateTv.setText("");
        return true;
    }

    private static final class Again extends DialogUtil.DialogCallback {
        @Override
        public void confirm() {
            H.postDelayed(new Restart(), SHUTDOWN_DELAY_MS);
        }

        @Override
        public void cancel() {
        }
    }

    private static final class Restart implements Runnable {
        public void run() {
            saveState();
            Context c = Y1Application.Companion.getAppContext();
            if (c != null) Other.INSTANCE.reboot(c);
        }
    }

    /**
     * Both paths end here, once. On a thread of our own, never a Handler: {@code PowerManager.reboot};
     * if still alive, kill {@code system_server} (same uid, so permitted — init restarts the
     * framework); last, kill ourselves (the HOME app is restarted at once).
     */
    private static void reboot() {
        if (fired) return;
        fired = true;
        // A forced reboot is exactly the session worth reading afterwards.
        Diag.spill("force reboot (top + bottom held)", null);
        Thread t = new Thread(new Boot(), "ipp-force-boot");
        t.setDaemon(true);
        t.start();
    }

    /**
     * Stock saves the playing state only on shutdown and at 2% battery, so without this a reboot
     * comes back to the last shutdown's track, list and source.
     */
    public static void saveState() {
        try {
            PlayerService ps = Y1Application.Companion.getPlayerService();
            if (ps != null) ps.saveState();
        } catch (Throwable t) {
        }
    }

    private static final class Boot implements Runnable {
        public void run() {
            saveState();
            // An accepted request gets a long grace: escalating while the framework tears down
            // restarts the screen once on the way to a reboot already happening.
            boolean asked = false;
            try {
                Context c = Y1Application.Companion.getAppContext();
                PowerManager pm = c == null ? null
                        : (PowerManager) c.getSystemService(Context.POWER_SERVICE);
                if (pm != null) {
                    pm.reboot("");                        // does not return when it works
                    asked = true;
                }
            } catch (Throwable t) {
                android.util.Log.e("ippForce", "PowerManager.reboot failed", t);
            }
            sleep(asked ? 20000 : 3000);
            int pid = systemServer();
            android.util.Log.e("ippForce", "still here; system_server pid=" + pid);
            if (pid > 0) {
                try {
                    android.os.Process.killProcess(pid);
                } catch (Throwable t) {
                }
                sleep(4000);
            }
            try {
                android.os.Process.killProcess(android.os.Process.myPid());
            } catch (Throwable t) {
                fired = false;
            }
        }
    }

    private static void sleep(long ms) {
        try {
            Thread.sleep(ms);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }

    private static int systemServer() {
        return pidOf("system_server");
    }

    /** From {@code /proc}, not {@code ps}: a wedged system may not start a process. 0 = none. */
    private static int pidOf(String name) {
        try {
            File[] fs = new File("/proc").listFiles();
            for (int i = 0; fs != null && i < fs.length; i++) {
                String n = fs[i].getName();
                int pid;
                try {
                    pid = Integer.parseInt(n);
                } catch (NumberFormatException e) {
                    continue;
                }
                if (pid == android.os.Process.myPid()) continue;
                if (name.equals(readCmdline(fs[i]))) return pid;
            }
        } catch (Throwable t) {
        }
        return 0;
    }

    private static String readCmdline(File procDir) {
        FileInputStream in = null;
        try {
            in = new FileInputStream(new File(procDir, "cmdline"));
            byte[] b = new byte[128];
            int got = in.read(b);
            if (got <= 0) return null;
            int end = 0;
            while (end < got && b[end] != 0) end++;
            return new String(b, 0, end, "UTF-8");
        } catch (Throwable t) {
            return null;
        } finally {
            try {
                if (in != null) in.close();
            } catch (Throwable t) {
            }
        }
    }

    private static boolean watching;
    /** Uptime of the main thread's last answer. */
    private static volatile long pong;

    private static void watch() {
        if (watching) return;
        watching = true;
        try {
            pong = SystemClock.uptimeMillis();
            Thread t = new Thread(new Ping(), "ipp-force");
            t.setDaemon(true);
            t.start();
        } catch (Throwable t) {
        }
    }

    private static final class Pong implements Runnable {
        public void run() {
            pong = SystemClock.uptimeMillis();
        }
    }

    /** Posts every round instead of waiting for the last answer, so a slow main thread is not "stuck". */
    private static final class Ping implements Runnable {
        public void run() {
            Pong back = new Pong();
            while (true) {
                try {
                    H.post(back);
                    Thread.sleep(PING_MS);
                } catch (InterruptedException e) {
                    return;
                } catch (Throwable t) {
                    return;
                }
                if (SystemClock.uptimeMillis() - pong >= STUCK_MS) {
                    android.util.Log.e("ippForce", "main thread wedged for "
                            + (SystemClock.uptimeMillis() - pong) + "ms, rebooting");
                    reboot();
                    return;
                }
            }
        }
    }
}
