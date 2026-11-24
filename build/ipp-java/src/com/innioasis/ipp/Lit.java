package com.innioasis.ipp;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.PowerManager;

/**
 * Is the screen on? Cached from the SCREEN_ON/OFF broadcasts. No View answers this here: with the
 * screen off the window still reports itself visible and focused, so a gate on
 * {@code isShown()}/{@code hasWindowFocus()} silently does nothing. {@code isScreenOn()} is a
 * binder call, too dear for {@link Scroll}'s 25 calls a second.
 */
public final class Lit {

    private Lit() { }

    /** Starts true: at worst a caller does its work once before the truth arrives. */
    private static volatile boolean on = true;
    /** Uptime of the last SCREEN_ON, as received. */
    private static volatile long onAt;
    private static boolean registered;

    public static boolean screenOn() {
        return on;
    }

    static long onAt() {
        return onAt;
    }

    /** Idempotent. The first value comes from PowerManager: a broadcast only reports the next change. */
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
            // Must read as "on", or everything gated on it stops.
            on = true;
        }
    }

    static final class Watch extends BroadcastReceiver {
        @Override
        public void onReceive(Context c, Intent i) {
            if (i == null) return;
            on = Intent.ACTION_SCREEN_ON.equals(i.getAction());
            if (on) {
                onAt = android.os.SystemClock.uptimeMillis();
                Wake.on();
                return;
            }
            Wake.off();
        }
    }
}
