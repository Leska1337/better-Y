package com.innioasis.ipp;

import android.app.Activity;
import android.os.SystemClock;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewTreeObserver;

/**
 * What opening a screen cost, phase by phase, written to the app's log only when it ran long:
 * {@code slow: open <Screen> N ms: key 40, create 210, ...}. Every screen goes through
 * {@code BaseActivity.onCreate}, which calls {@link #open} at its top and {@link #step} at the
 * points worth naming; the end is the first frame. Main thread only, one screen at a time.
 */
public final class Open {

    private Open() { }

    /** From the press to the first frame, or from onCreate when no press led here. */
    private static final long SLOW_MS = 400L;

    /** A press older than this did not open the screen. */
    private static final long KEY_MS = 5000L;

    private static long keyAt;
    private static Activity screen;
    private static long startAt;
    private static long fromAt;     // the press that opened the screen, or startAt
    private static long lastAt;
    private static StringBuilder steps;
    private static boolean watching;

    /** From {@code Tone.key}, which every {@code dispatchKeyEvent} calls. */
    static void key(KeyEvent e) {
        if (e != null) keyAt = e.getEventTime();
    }

    /** When the last key event happened, uptime ms (measurement). */
    public static long lastKey() {
        return keyAt;
    }

    /** The screen opened last. */
    static Activity screen() {
        return screen;
    }

    /** Top of {@code BaseActivity.onCreate}: nothing of the window may be touched yet. */
    public static void open(Activity a) {
        try {
            long now = SystemClock.uptimeMillis();
            screen = a;
            startAt = now;
            lastAt = now;
            watching = false;
            steps = new StringBuilder();
            fromAt = now;
            if (keyAt > 0 && keyAt <= now && now - keyAt < KEY_MS) {
                fromAt = keyAt;
                steps.append(", key ").append(now - keyAt);
            }
        } catch (Throwable t) {
        }
    }

    /**
     * Names the stretch since the previous point. The first call that finds the window's decor
     * starts the wait for the first frame.
     */
    public static void step(String what) {
        try {
            if (steps == null || screen == null) return;
            long now = SystemClock.uptimeMillis();
            steps.append(", ").append(what).append(' ').append(now - lastAt);
            lastAt = now;
            if (watching) return;
            View decor = screen.getWindow().peekDecorView();
            if (decor == null) return;
            watching = true;
            decor.getViewTreeObserver().addOnPreDrawListener(new Drawn(decor, screen));
        } catch (Throwable t) {
        }
    }

    /** Measure and layout are behind the pre-draw; a post from it lands after the frame. */
    static final class Drawn implements ViewTreeObserver.OnPreDrawListener, Runnable {
        private final View decor;
        private final Activity a;

        Drawn(View decor, Activity a) {
            this.decor = decor;
            this.a = a;
        }

        public boolean onPreDraw() {
            try {
                ViewTreeObserver o = decor.getViewTreeObserver();
                if (o.isAlive()) o.removeOnPreDrawListener(this);
                if (screen == a) step("layout");
                decor.post(this);
            } catch (Throwable t) {
            }
            return true;
        }

        public void run() {
            try {
                if (screen != a || steps == null) return;
                step("draw");
                long now = SystemClock.uptimeMillis();
                if (now - startAt >= SLOW_MS || now - fromAt >= SLOW_MS + 600L) {
                    Diag.note("slow: open " + a.getClass().getSimpleName() + ' '
                            + (now - fromAt) + " ms" + steps.toString().replaceFirst(", ", ": "));
                }
                screen = null;
                steps = null;
            } catch (Throwable t) {
            }
        }
    }
}
