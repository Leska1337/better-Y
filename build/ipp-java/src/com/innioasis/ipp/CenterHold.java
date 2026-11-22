package com.innioasis.ipp;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.PowerManager;
import android.os.SystemClock;
import android.util.Log;
import android.view.KeyEvent;
import android.widget.Toast;

import com.innioasis.fm.configs.KeyMap;
import com.innioasis.music.util.Other;
import com.innioasis.y1.Y1Application;

import java.util.Locale;

/**
 * Shut down by holding the CENTRE button (KEY_ENTER) for {@link #HOLD_MS}.
 *
 * Stock already turns a short hold of the centre button into the "Shut down?" dialog. This keeps
 * going past that: still holding at {@link #HOLD_MS} means "yes", without the confirm.
 *
 * SAFETY RULE -- the device goes down only on POSITIVE evidence that the button is still held.
 * A held key keeps producing ACTION_DOWN repeats (~every 50 ms after the first ~400 ms). Every one
 * of them refreshes {@link #lastSeen}; the ticker cancels the hold as soon as no repeat has come for
 * {@link #GAP_MS}. So a release whose ACTION_UP is lost (screen off, focus moving to the dialog,
 * an Activity going away) cancels exactly like a real release, instead of being taken for a hold.
 * If repeats do not survive the dialog opening, the feature simply never fires: it fails safe.
 *
 * Gated by the better-Y toggle "center_hold", default OFF (see Prefs.DEFAULTS). Off means this
 * class only returns; no event is ever swallowed here in any state.
 *
 * Called from {@link Force#key}, i.e. first thing in every dispatchKeyEvent of the app.
 * Everything is wrapped: a failure here must never cost a key press.
 */
public final class CenterHold {

    private CenterHold() { }

    public static final String KEY = "center_hold";

    /** true: at the threshold only log + toast, never shut down. The diagnostic build. */
    static final boolean DRY_RUN = false;

    /** Total hold before shutdown. Well past stock's dialog (~0.5-0.8 s). */
    private static final long HOLD_MS = 5000;
    /** Warn this long before firing. */
    private static final long WARN_MS = 2000;
    /** No repeat for this long = the button is not held any more (first repeat comes ~400-500 ms). */
    private static final long GAP_MS = 800;
    /** Ticker period. */
    private static final long TICK_MS = 100;

    private static final String TAG = "Y1CenterHold";
    private static final Handler H = new Handler(Looper.getMainLooper());

    private static long startAt;      // uptime of the first DOWN, 0 = idle
    private static long lastSeen;     // uptime of the last DOWN/repeat
    private static boolean warned;
    private static boolean done;      // fired (or dry-fired) for this hold; wait for a fresh press
    private static Tick ticker;
    /** Stock asked for screen-off during this hold; we owe it on a clean release. */
    private static boolean sleepOwed;
    /** The warning was shown during this hold (survives reset(): read on the UP after it). */
    private static boolean warnedThisHold;

    /**
     * Stock turns the screen OFF on a centre hold (~0.6 s: LongDownCenterUtil in the menus,
     * longPressEnter on the player screens). Screen-off cancels the key, so the hold could never
     * reach {@link #HOLD_MS}. Called first thing in both stock sleep methods: while the feature is
     * on AND a hold is running, the sleep is DEFERRED to the release (true = caller must not sleep
     * now). Feature off, or no hold running, answers false and stock sleeps exactly as before.
     *
     * Failure mode: if the release is never seen, the owed sleep is simply dropped -- the screen
     * stays on and its normal timeout applies. Never a shutdown.
     */
    public static boolean deferSleep() {
        try {
            if (startAt == 0) return false;
            Context c = Y1Application.Companion.getAppContext();
            if (c == null || !Prefs.on(c, KEY)) return false;
            sleepOwed = true;
            Log.i(TAG, "stock sleep deferred to release");
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    public static void key(KeyEvent e) {
        try {
            if (e == null || e.getKeyCode() != KeyMap.INSTANCE.getKEY_ENTER()) return;
            Context c = Y1Application.Companion.getAppContext();
            if (c == null || !Prefs.on(c, KEY)) {
                if (startAt != 0) stop("disabled");
                return;
            }
            long now = SystemClock.uptimeMillis();
            int action = e.getAction();
            Log.i(TAG, "key action=" + action + " repeat=" + e.getRepeatCount()
                    + " flags=0x" + Integer.toHexString(e.getFlags())
                    + " screenOn=" + screenOn(c) + " held=" + (startAt == 0 ? 0 : now - startAt));

            if (action == KeyEvent.ACTION_DOWN) {
                if ((e.getFlags() & KeyEvent.FLAG_CANCELED) != 0) {
                    stop("canceled flag");
                    return;
                }
                if (e.getRepeatCount() == 0 || startAt == 0) {
                    if (e.getRepeatCount() == 0) {
                        done = false;
                    }
                    if (done) return;               // still the hold that already fired
                    start(now);
                }
                lastSeen = now;
            } else {
                // ACTION_UP (or anything else): the hold is over.
                boolean canceled = (e.getFlags() & KeyEvent.FLAG_CANCELED) != 0;
                stop(canceled ? "up canceled" : "up");
                done = false;
                // Pay the deferred stock screen-off -- but only on a clean release that came
                // BEFORE the warning. Released after the warning means "cancel the shutdown":
                // the screen stays on.
                boolean owed = sleepOwed;
                sleepOwed = false;
                if (owed && !canceled && !warnedThisHold) {
                    Log.i(TAG, "deferred sleep now");
                    goToSleep(c);
                } else if (owed) {
                    Log.i(TAG, "deferred sleep dropped (warned=" + warnedThisHold + ")");
                }
            }
        } catch (Throwable t) {
            try {
                Log.e(TAG, "key failed", t);
            } catch (Throwable ignore) {
            }
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
        Log.i(TAG, "hold start");
    }

    private static void stop(String why) {
        if (startAt != 0) {
            Log.i(TAG, "hold end: " + why + " after " + (SystemClock.uptimeMillis() - startAt) + "ms");
        }
        reset();
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

    /** Named, never anonymous: the bundled d8 crashes dexing anonymous inner classes (see Press). */
    static final class Tick implements Runnable {
        Tick() { }   // package-private: no synthetic accessor class (CenterHold$1)

        public void run() {
            try {
                if (ticker != this || startAt == 0) return;
                long now = SystemClock.uptimeMillis();
                if (now - lastSeen > GAP_MS) {
                    stop("no repeat for " + (now - lastSeen) + "ms (release or lost UP)");
                    sleepOwed = false;     // unknown state: leave the screen as it is
                    return;
                }
                Context c = Y1Application.Companion.getAppContext();
                keepScreenOn(c);
                long held = now - startAt;
                if (!warned && held >= HOLD_MS - WARN_MS) {
                    warned = true;
                    warnedThisHold = true;
                    Log.i(TAG, "warn at " + held + "ms");
                    toast(c, es(c) ? "Apagando... suelta para cancelar"
                                   : "Shutting down... release to cancel");
                }
                if (held >= HOLD_MS) {
                    fire(c, held);
                    return;
                }
                H.postDelayed(this, TICK_MS);
            } catch (Throwable t) {
                reset();
            }
        }
    }

    private static void fire(Context c, long held) {
        reset();
        done = true;
        sleepOwed = false;
        if (DRY_RUN) {
            Log.i(TAG, "WOULD_SHUTDOWN after " + held + "ms (dry run)");
            toast(c, es(c) ? "[prueba] Aqui se apagaria" : "[test] Would shut down here");
            return;
        }
        Log.i(TAG, "SHUTDOWN after " + held + "ms");
        // Other.shutdown() saves the player state itself (stock) and blocks while the system
        // brings up its shutdown screen; on the main thread exactly like the stock dialog's confirm.
        Other.INSTANCE.shutdown();
    }

    /** The screen must not go dark (and take the key stream with it) while the button is held. */
    private static void keepScreenOn(Context c) {
        try {
            PowerManager pm = c == null ? null : (PowerManager) c.getSystemService(Context.POWER_SERVICE);
            if (pm != null) pm.userActivity(SystemClock.uptimeMillis(), false);
        } catch (Throwable t) {
            // not fatal: the gap rule still cancels if the repeats stop
        }
    }

    /** Same call stock makes (PowerManager.goToSleep by reflection; uid system may). */
    private static void goToSleep(Context c) {
        try {
            if (c == null) return;
            Object pm = c.getSystemService(Context.POWER_SERVICE);
            if (pm == null) return;
            pm.getClass().getMethod("goToSleep", new Class[] { Long.TYPE })
                    .invoke(pm, new Object[] { Long.valueOf(SystemClock.uptimeMillis()) });
        } catch (Throwable t) {
            try {
                Log.e(TAG, "goToSleep failed", t);
            } catch (Throwable ignore) {
            }
        }
    }

    private static boolean screenOn(Context c) {
        try {
            PowerManager pm = (PowerManager) c.getSystemService(Context.POWER_SERVICE);
            return pm != null && pm.isScreenOn();
        } catch (Throwable t) {
            return true;
        }
    }

    private static boolean es(Context c) {
        try {
            return "es".equals(Locale.getDefault().getLanguage());
        } catch (Throwable t) {
            return false;
        }
    }

    private static void toast(Context c, String s) {
        try {
            if (c != null) Toast.makeText(c, s, Toast.LENGTH_SHORT).show();
        } catch (Throwable t) {
        }
    }
}
