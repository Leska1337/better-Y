package com.innioasis.ipp;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.PowerManager;
import android.os.SystemClock;
import android.view.KeyEvent;
import android.widget.Toast;

import com.innioasis.fm.configs.KeyMap;
import com.innioasis.music.util.Other;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;

/**
 * Shut down by holding the CENTRE button for {@link #HOLD_MS}, toggle "center_hold", off by
 * default. Never swallows a key.
 *
 * The device goes down only on positive evidence that the button is still held: every repeat
 * refreshes {@link #lastSeen}, and no repeat for {@link #GAP_MS} cancels the hold. A lost UP
 * (screen off, focus moved, Activity gone) therefore cancels exactly like a release.
 */
public final class CenterHold {

    private CenterHold() { }

    public static final String KEY = "center_hold";

    private static final long HOLD_MS = 5000;
    private static final long WARN_MS = 2000;
    /** The first repeat comes ~400-500 ms after DOWN. */
    private static final long GAP_MS = 800;
    private static final long TICK_MS = 100;

    private static final Handler H = new Handler(Looper.getMainLooper());

    private static long startAt;      // 0 = idle
    private static long lastSeen;
    private static boolean warned;
    private static boolean done;      // fired for this hold; wait for a fresh press
    private static Tick ticker;
    private static boolean sleepOwed;
    private static boolean warnedThisHold;   // survives reset(): read on the UP after it
    /** Down time of the centre press now held. */
    private static long downAt;
    /** A press down before SCREEN_ON arrived plus this is the one that woke the screen. */
    private static final long WAKE_SLACK_MS = 300;

    /**
     * Called first in every stock sleepScreen: the centre hold sleeps the screen at ~0.6 s, which
     * would cancel the key. While a hold runs the sleep is owed to a release before the warning;
     * true = the caller must not sleep now. A hold begun by the press that woke the screen never
     * sleeps it.
     */
    public static boolean deferSleep() {
        try {
            // held from the locked screen: the press that woke it must not put it out again
            if (downAt != 0 && (!Lit.screenOn() || downAt < Lit.onAt() + WAKE_SLACK_MS)) return true;
            if (startAt == 0) return false;
            Context c = Y1Application.Companion.getAppContext();
            if (c == null || !Prefs.on(c, KEY)) return false;
            sleepOwed = true;
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    /** From {@link Force#key}, i.e. first in every dispatchKeyEvent of the app. */
    public static void key(KeyEvent e) {
        try {
            if (e == null || e.getKeyCode() != KeyMap.INSTANCE.getKEY_ENTER()) return;
            if (e.getAction() == KeyEvent.ACTION_DOWN) downAt = e.getDownTime();
            else downAt = 0;
            Context c = Y1Application.Companion.getAppContext();
            if (c == null || !Prefs.on(c, KEY)) {
                if (startAt != 0) reset();
                return;
            }
            long now = SystemClock.uptimeMillis();
            boolean canceled = (e.getFlags() & KeyEvent.FLAG_CANCELED) != 0;
            if (e.getAction() == KeyEvent.ACTION_DOWN) {
                if (canceled) {
                    reset();
                    return;
                }
                if (e.getRepeatCount() == 0 || startAt == 0) {
                    if (e.getRepeatCount() == 0) done = false;
                    if (done) return;
                    start(now);
                }
                lastSeen = now;
            } else {
                reset();
                done = false;
                boolean owed = sleepOwed;
                sleepOwed = false;
                // Released after the warning means "cancel": the screen stays on.
                if (owed && !canceled && !warnedThisHold) goToSleep(c);
            }
        } catch (Throwable t) {
            reset();
        }
    }

    private static void start(long now) {
        cancelTicker();
        startAt = now;
        lastSeen = now;
        warned = false;
        warnedThisHold = false;
        sleepOwed = false;
        ticker = new Tick();
        H.postDelayed(ticker, TICK_MS);
    }

    private static void reset() {
        cancelTicker();
        startAt = 0;
        lastSeen = 0;
        warned = false;
    }

    private static void cancelTicker() {
        if (ticker != null) {
            H.removeCallbacks(ticker);
            ticker = null;
        }
    }

    static final class Tick implements Runnable {
        Tick() { }

        public void run() {
            try {
                if (ticker != this || startAt == 0) return;
                long now = SystemClock.uptimeMillis();
                if (now - lastSeen > GAP_MS) {
                    reset();
                    sleepOwed = false;     // state unknown: leave the screen as it is
                    return;
                }
                Context c = Y1Application.Companion.getAppContext();
                keepScreenOn(c);
                long held = now - startAt;
                if (!warned && held >= HOLD_MS - WARN_MS) {
                    warned = true;
                    warnedThisHold = true;
                    if (c != null) {
                        Toast.makeText(c, c.getString(R.string.ipp_center_hold_warn),
                                Toast.LENGTH_SHORT).show();
                    }
                }
                if (held >= HOLD_MS) {
                    reset();
                    done = true;
                    sleepOwed = false;
                    Other.INSTANCE.shutdown();   // saves the player state itself, as stock's confirm
                    return;
                }
                H.postDelayed(this, TICK_MS);
            } catch (Throwable t) {
                reset();
            }
        }
    }

    /** The screen must not go dark, and take the key stream with it, while the button is held. */
    private static void keepScreenOn(Context c) {
        try {
            PowerManager pm = c == null ? null : (PowerManager) c.getSystemService(Context.POWER_SERVICE);
            if (pm != null) pm.userActivity(SystemClock.uptimeMillis(), false);
        } catch (Throwable t) {
        }
    }

    /** Stock's own call: PowerManager.goToSleep by reflection, allowed for uid system. */
    private static void goToSleep(Context c) {
        try {
            if (c == null) return;
            Object pm = c.getSystemService(Context.POWER_SERVICE);
            if (pm == null) return;
            pm.getClass().getMethod("goToSleep", new Class[] { Long.TYPE })
                    .invoke(pm, new Object[] { Long.valueOf(SystemClock.uptimeMillis()) });
        } catch (Throwable t) {
        }
    }
}
