package com.innioasis.ipp;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.PowerManager;
import android.os.SystemClock;
import android.view.KeyEvent;

import com.innioasis.fm.configs.KeyMap;
import com.innioasis.music.util.Other;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.service.PlayerService;

import java.io.File;
import java.io.FileInputStream;

/**
 * Force reboot: hold the TOP and BOTTOM buttons together for three seconds. Plus a watchdog
 * for the case the buttons cannot get through at all.
 *
 * It has to work whatever state the device is in, which is what {@link #reboot} is built
 * around: the real reboot first, and two harder fallbacks under it for when the system itself has
 * stopped answering. Nothing here goes through a Handler — the main thread is the one thing that
 * cannot be relied on at the moment any of this is wanted.
 *
 * The buttons are {@code KEY_MENU} (keycode 4, the top one) and {@code KEY_PLAY} (85, the
 * bottom one) — the same pair every screen reads through {@link KeyMap}. While both are held the
 * pair is SWALLOWED: without that, the top button's own long press opens the long-press menu and
 * the bottom one stops playback about half a second in, so letting go to change your mind would
 * leave both behind. Releasing either before the three seconds are up cancels it and costs nothing.
 *
 * State is static because the keys are the device's, not a screen's — a press can start on one
 * Activity and end on the next. A DOWN whose UP never arrives (the Activity it belonged to went
 * away with it) would otherwise leave a button "held" forever and swallow the other one from then
 * on, so a press older than {@link #STALE_MS} is dropped.
 *
 * Hooked into the top of every {@code dispatchKeyEvent} in the app that does not delegate to
 * another one: the two base Activities (music and e-book), {@code BasePlayerActivity},
 * {@code BaseDialog} (a dialog takes the keys away from the Activity under it),
 * {@code InputMethodDialog}, and the four screens that override the method without calling super.
 *
 * The watchdog exists because all of the above hangs off {@code dispatchKeyEvent}, i.e.
 * off the MAIN THREAD — which is exactly the thread that is not running when a screen is stuck, so
 * the one moment the combination is wanted is the one moment it cannot be noticed. A plain thread
 * therefore pings the main thread every {@link #PING_MS} and restarts the process when the answer
 * has not come back for {@link #STUCK_MS}. Reading the buttons straight from the kernel was tried
 * first and is not possible: {@code /dev/input/event*} is {@code root:input 0660} and the app's
 * process (uid {@code system}) is not in the {@code input} group — and no permission grants it.
 */
public final class Force {

    private Force() { }

    /** How long both buttons must be down. */
    private static final long HOLD_MS = 3000;
    /** A key that has been "down" longer than this never got its UP; forget it. */
    private static final long STALE_MS = 8000;
    /** How often the watchdog asks the main thread whether it is still there. */
    private static final long PING_MS = 2000;
    /**
     * No answer for this long means the main thread is wedged. Well above anything legitimate:
     * Android calls 5 s an ANR, and the heavy passes in this app (the library scan, "Cache
     * library") all run on threads of their own.
     */
    private static final long STUCK_MS = 20000;

    private static final Handler H = new Handler(Looper.getMainLooper());

    private static long menuAt;     // uptime of the DOWN, 0 while the button is up
    private static long playAt;
    private static boolean armed;   // both were down; keys stay swallowed until both are up again
    private static Boom pending;
    private static volatile boolean fired;

    /**
     * Called first thing in {@code dispatchKeyEvent}. Returns true when the event must not reach
     * the app at all — i.e. while both buttons are down, and for the release that ends it.
     */
    public static boolean key(KeyEvent e) {
        try {
            if (e == null) return false;
            watch();                       // the watchdog starts with the first key press of the run
            // Once the reboot is on its way the app takes NO further key events at all. The pair is
            // still held at that moment and their releases are yet to come — and the top button's
            // short press is delivered on the UP, so anything let through here changes the screen
            // underneath the system's shutdown window. Everything else on the device is about to go
            // away too, so swallowing the lot costs nothing.
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
                    return was;   // the release that broke the pair is not a button press either
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

    /**
     * Fires three seconds into the hold.
     *
     * The swallowing stays ARMED — only the pending fire is dropped. The buttons are still down
     * at this point and their releases are yet to come: the top one's short press is delivered on
     * the UP, so clearing {@code armed} here handed the app a "back" the moment the user let go,
     * i.e. the screen changed underneath the system's shutdown window. {@link #key} disarms itself
     * when both buttons are up, swallowing the release that does it, exactly as it does when the
     * hold is abandoned early.
     */
    private static final class Boom implements Runnable {
        public void run() {
            cancel();
            reboot();
        }
    }

    // ---- the Shutdown confirm dialog ----------------------------------------------------------
    //
    // Stock's callback shuts the device down inside `confirm()`, and `DialogUtil.shortUp` calls
    // `dismiss()` only AFTER the callback returns — but `Other.shutdown()` never returns: it
    // reflects into IPowerManager and blocks in the system while the shutdown screen comes up. So
    // the confirm dialog stayed on screen underneath it. Exactly the same shape as the Reboot row
    // of the better-Y screen (`IppActivity.postReboot`), and the same answer: hand the frame
    // back first, shut down 400 ms later. The delay is not a race to win — nothing after this
    // point matters, the device is going down either way.

    private static final int SHUTDOWN_DELAY_MS = 400;

    /** Replaces `Other.INSTANCE.shutdown()` in `BaseActivity$askShutdown$1.confirm`. */
    public static void postShutdown() {
        H.postDelayed(new Down(), SHUTDOWN_DELAY_MS);
    }

    private static final class Down implements Runnable {
        public void run() {
            Other.INSTANCE.shutdown();
        }
    }

    /**
     * Both paths end here, and only one of them may get through. Three steps, each a fallback for
     * the one before, so that something happens whatever state the device is in:
     *
     *   - {@code PowerManager.reboot} — the real thing, a full reboot. Called from a
     *       thread of our own, never from a Handler: a wedged main thread must not be able to hold
     *       it up, and the call is a Binder round trip to {@code system_server} either way. It does
     *       not return when it works.
     *   - kill {@code system_server} — if we are still here seconds later, the system
     *       process is not answering, and a reboot that has to be asked for politely is exactly
     *       what cannot work then. The app runs as uid {@code system} ({@code sharedUserId}), which
     *       is the same uid {@code system_server} runs as, so {@code kill(2)} is permitted; init
     *       restarts zygote and the whole framework comes back up. Not a kernel reboot, but from
     *       the outside it is a full restart of everything the user can see.
     *   - kill ourselves — the last resort; the launcher is the HOME app, so the system
     *       starts it again at once.
     */
    private static void reboot() {
        if (fired) return;
        fired = true;
        // The ring dies with the process, and a forced reboot is precisely a session worth
        // reading afterwards -- it means the device was wedged enough to be held down.
        Diag.spill("force reboot (top + bottom held)", null);
        Thread t = new Thread(new Boot(), "ipp-force-boot");
        t.setDaemon(true);
        t.start();
    }

    /**
     * Write down what is playing before going down.
     *
     * Stock saves that state in exactly two places — {@code Other.shutdown()} and a 2% battery
     * warning — so a REBOOT came back to whatever the last shutdown had left behind: the wrong
     * track, the wrong list, and (since the queue's source is written in the same breath) the
     * wrong screen behind "Open source". Always the same wrong one, too, which is what it looked
     * like on the device. Both of our reboot paths call this first.
     *
     * It is the whole playlist through Gson and a file write, which is a moment's work — and
     * this is a reboot, so the moment is free.
     */
    public static void saveState() {
        try {
            PlayerService ps = Y1Application.Companion.getPlayerService();
            if (ps != null) ps.saveState();
        } catch (Throwable t) {
            // going down without it is what stock did anyway
        }
    }

    private static final class Boot implements Runnable {
        public void run() {
            saveState();
            // Whether the system took the request at all. It matters because the reboot itself
            // takes seconds during which the framework tears everything down — escalating in the
            // middle of that restarts the launcher (and the framework with it) on the way to a
            // reboot that was already happening, which is exactly what it looked like: the screen
            // came back once before the device finally went down. So a request that was accepted
            // gets a long grace period, and only a REFUSED one is escalated at once.
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
                    // not ours to kill after all
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

    /** The pid of {@code system_server}, or 0. */
    private static int systemServer() {
        return pidOf("system_server");
    }

    /**
     * The pid of the process whose command line is exactly {@code name}, or 0. Read from
     * {@code /proc}, which needs no permission — and no {@code ps}, which is a process of its own
     * and might be exactly what a wedged system cannot start.
     */
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
            // fall through
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
                // ignore
            }
        }
    }

    // ------------------------------------------------------------------------------------------
    // The watchdog.
    // ------------------------------------------------------------------------------------------

    private static boolean watching;
    /** Uptime of the last answer from the main thread. */
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
            // no watchdog: the button combination above still works while the app does
        }
    }

    /** Runs on the main thread; the one thing it does is say that it ran. */
    private static final class Pong implements Runnable {
        public void run() {
            pong = SystemClock.uptimeMillis();
        }
    }

    /**
     * A plain thread, so a wedged main thread cannot hold it up. It posts {@link Pong} and looks at
     * how long ago the last one came back — posting every round rather than waiting for the
     * previous one keeps it correct when the main thread is merely slow: a late answer simply moves
     * the mark forward again.
     */
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
