package com.innioasis.ipp;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.PowerManager;

/**
 * Is the screen on? One boolean, kept current by the two broadcasts that say so.
 *
 * It exists because nothing a View can be asked answers that question on this device.
 * With the screen off the Activity really is stopped ({@code dumpsys activity} says
 * {@code state=STOPPED}), but the window it owns goes on reporting {@code mViewVisibility=0x0} to
 * its own client and even keeps the focus — so {@code getWindowVisibility()}, {@code isShown()} and
 * {@code hasWindowFocus()} all still say "visible", and a gate built on any of them is dead code
 * that builds, runs and does nothing. That was measured, not assumed: a first fix along those lines
 * changed the CPU figure by nothing at all.
 *
 * {@code PowerManager.isScreenOn()} does answer, but it is a binder call, and the caller this
 * was written for asks 25 times a second ({@link Scroll}). So the answer is cached and the two
 * broadcasts keep it right; the initial value is taken from {@code PowerManager} once, at
 * registration, because a broadcast only ever tells us about the NEXT change.
 *
 * Registration is lazy and self-contained — {@link #watch(Context)} from the first caller that
 * has a Context, on the application context so nothing holds an Activity. No stock file is touched.
 */
public final class Lit {

    private Lit() { }

    /** Screen state. Starts true: worst case a caller does its work once before the truth arrives. */
    private static volatile boolean on = true;
    private static boolean registered;

    /** The cached screen state. Costs one field read, which is the whole point. */
    public static boolean screenOn() {
        return on;
    }

    /** Registers the receiver once. Safe to call on every use; does nothing after the first. */
    public static void watch(Context c) {
        if (registered || c == null) return;
        try {
            registered = true;
            Context app = c.getApplicationContext();
            if (app == null) app = c;
            PowerManager pm = (PowerManager) app.getSystemService(Context.POWER_SERVICE);
            if (pm != null) on = pm.isScreenOn();
            IntentFilter f = new IntentFilter(Intent.ACTION_SCREEN_ON);
            f.addAction(Intent.ACTION_SCREEN_OFF);
            app.registerReceiver(new Watch(), f);
        } catch (Throwable t) {
            // A screen state we cannot follow must read as "on", or everything gated on it stops.
            on = true;
        }
    }

    /** Named, not anonymous: d8 8.2.2-dev crashes dexing anonymous classes here (see CLAUDE.md). */
    static final class Watch extends BroadcastReceiver {
        @Override
        public void onReceive(Context c, Intent i) {
            if (i == null) return;
            on = Intent.ACTION_SCREEN_ON.equals(i.getAction());
        }
    }
}
