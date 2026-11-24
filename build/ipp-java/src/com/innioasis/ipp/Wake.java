package com.innioasis.ipp;

import android.app.Activity;
import android.graphics.Color;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.Window;

import java.util.ArrayList;
import java.util.List;

/**
 * The screen comes on out of black, the way the platform fades it out going off: a black cover
 * laid over every live screen while the screen is off, faded out from the first frame drawn after
 * it comes back on. Only the screen that draws first fades; the others lose the cover at once,
 * or a screen returned to later would fade in on its own.
 */
public final class Wake {

    private Wake() { }

    static final int FADE_MS = 250;
    /** From SCREEN_ON to the backlight: the display panel takes this long to come on, and a fade
     *  started at the first frame was over before anyone could see it. */
    static final int UNBLANK_MS = 550;
    /** Whatever has not drawn by then is not on screen: covers left are dropped. */
    private static final int GIVE_UP_MS = 1500;

    private static final List COVERS = new ArrayList();
    private static boolean armed;
    private static long onAt;
    private static Handler main;

    /** From {@link Lit} on SCREEN_OFF. */
    static void off() {
        try {
            armed = false;
            Object[] all = Theme.screens();
            for (int i = 0; i < all.length; i++) {
                Activity a = (Activity) all[i];
                if (a == null || a.isFinishing()) continue;
                cover(a);
            }
        } catch (Throwable t) {
        }
    }

    /** From {@link Lit} on SCREEN_ON. */
    static void on() {
        try {
            if (COVERS.isEmpty()) return;
            armed = true;
            onAt = SystemClock.uptimeMillis();
            if (main == null) main = new Handler(Looper.getMainLooper());
            main.removeCallbacks(GIVE_UP);
            main.postDelayed(GIVE_UP, GIVE_UP_MS);
            // A screen that drew before the broadcast came is not asked again.
            for (int i = 0; i < COVERS.size(); i++) ((View) COVERS.get(i)).invalidate();
        } catch (Throwable t) {
            dropAll(null);
        }
    }

    private static void cover(Activity a) {
        Window w = a.getWindow();
        View d = w == null ? null : w.getDecorView();
        if (!(d instanceof ViewGroup)) return;
        ViewGroup decor = (ViewGroup) d;
        // one still fading from the last time the screen came on: a fresh one in its place
        for (int i = COVERS.size() - 1; i >= 0; i--) {
            View v = (View) COVERS.get(i);
            if (v.getParent() == decor) remove(v);
        }
        Cover c = new Cover(a);
        c.setBackgroundColor(Color.BLACK);
        decor.addView(c, new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));
        c.first = new First(c);
        c.getViewTreeObserver().addOnPreDrawListener(c.first);
        COVERS.add(c);
    }

    /** The first cover drawn after the screen came on fades; every other one goes now. */
    static void drawn(Cover c) {
        if (!armed) return;
        armed = false;
        if (main != null) main.removeCallbacks(GIVE_UP);
        dropAll(c);
        long wait = Math.max(0, onAt + UNBLANK_MS - SystemClock.uptimeMillis());
        c.animate().alpha(0f).setStartDelay(wait).setDuration(FADE_MS).withEndAction(new Remove(c));
    }

    private static void dropAll(View keep) {
        for (int i = COVERS.size() - 1; i >= 0; i--) {
            View v = (View) COVERS.get(i);
            if (v == keep) continue;
            COVERS.remove(i);
            detach(v);
        }
    }

    static void remove(View v) {
        COVERS.remove(v);
        detach(v);
    }

    private static void detach(View v) {
        try {
            if (v instanceof Cover) unlisten((Cover) v);
            Object p = v.getParent();
            if (p instanceof ViewGroup) ((ViewGroup) p).removeView(v);
        } catch (Throwable t) {
        }
    }

    private static final Runnable GIVE_UP = new GiveUp();

    static final class GiveUp implements Runnable {
        public void run() {
            armed = false;
            dropAll(null);
        }
    }

    private static void unlisten(Cover c) {
        try {
            ViewTreeObserver o = c.getViewTreeObserver();
            if (c.first != null && o.isAlive()) o.removeOnPreDrawListener(c.first);
        } catch (Throwable t) {
        }
        c.first = null;
    }

    static final class Cover extends View {
        First first;

        Cover(Activity a) {
            super(a);
            setClickable(false);
            setFocusable(false);
        }
    }

    static final class First implements ViewTreeObserver.OnPreDrawListener {
        private final Cover c;

        First(Cover c) {
            this.c = c;
        }

        public boolean onPreDraw() {
            if (armed && c.isShown()) {
                unlisten(c);
                drawn(c);
            }
            return true;
        }
    }

    static final class Remove implements Runnable {
        private final View v;

        Remove(View v) {
            this.v = v;
        }

        public void run() {
            remove(v);
        }
    }
}
