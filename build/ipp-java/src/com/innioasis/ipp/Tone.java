package com.innioasis.ipp;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * The key tone, silenced while the screen is off.
 *
 * With Key lock off the touch panel goes on reporting the wheel whatever the screen is doing, so a
 * player in a pocket clicks at every brush of the ring. The reporting itself cannot be stopped
 * from here — the only lever is {@code /proc/tpd_keys_enable}, which is Key lock and takes every
 * button with it — and the tone is played by {@code system_server} before the policy decides
 * whether the event reaches a window (with the screen off it does not). So the consequence is what
 * is answered, and it is not only noise: each tone starts an {@code AudioTrack} and takes the
 * {@code AudioOut_2} wake lock. The transport keys lose their click too; that is the trade.
 *
 * The switch is the MTK audio profile ({@code setSoundEffectEnabled("mtk_audioprofile_general",…)},
 * what the stock "Key tone" row writes through {@code Utils.initKeyToneState}), NOT
 * {@code Settings.System.SOUND_EFFECTS_ENABLED} — those two disagree here and the framework reads
 * the profile, so the other one reads as already solved when nothing is.
 *
 * Stock's own copy of the setting ({@code SharedPreferencesUtils.getRingtone()}, read by the
 * Settings row and the status-bar icon) is never written: only the profile is, and only while the
 * screen is off. Settings re-reads the profile into that copy when the row is shown, which needs
 * the screen on, i.e. the tone is already back.
 */
public final class Tone {

    private Tone() { }

    /** The profile stock writes; there is only one on this device. */
    private static final String PROFILE = "mtk_audioprofile_general";

    /**
     * "The tone is off because WE turned it off." It outlives the process on purpose: a session
     * that dies with the screen off would otherwise leave the user's Key tone silently off for
     * good, with the Settings row still saying On.
     */
    private static final String P_RESTORE = "tone_muted";

    private static boolean registered;

    /**
     * Called from {@code BaseActivity.onCreate}: the work is done once and every later call
     * returns at a field read, so whichever screen is built first will do — the launcher is HOME,
     * so one always is.
     *
     * NOT from {@code Y1Application.onCreate}, where this belongs by meaning. The Application
     * class is verified before multidex installs classes2, so a reference to the ipp package
     * cannot resolve there: the call becomes a thrown verify error that no {@code try} inside the
     * method can catch, and the launcher dies at every start — a loop a reboot does not end. It is
     * the one file with this restriction; cross-dex calls work both ways everywhere else.
     */
    public static void watch(Context c) {
        if (registered || c == null) return;
        try {
            registered = true;
            Context app = c.getApplicationContext();
            if (app == null) app = c;
            Lit.watch(app);
            IntentFilter f = new IntentFilter(Intent.ACTION_SCREEN_ON);
            f.addAction(Intent.ACTION_SCREEN_OFF);
            app.registerReceiver(new Watch(), f);
            // A process can start either way out of step: restarted after a death while muted,
            // or started with the screen already off.
            if (Lit.screenOn()) restore(app); else mute(app);
        } catch (Throwable t) {
            // a key tone that cannot be followed is a nuisance; a crash in onCreate is not
        }
    }

    /** Named, not anonymous: d8 crashes dexing anonymous classes here (see CLAUDE.md). */
    static final class Watch extends BroadcastReceiver {
        @Override
        public void onReceive(Context c, Intent i) {
            if (c == null || i == null) return;
            if (Intent.ACTION_SCREEN_ON.equals(i.getAction())) restore(c); else mute(c);
        }
    }

    /** The breadcrumb is written BEFORE the tone is silenced: the other order can lose it. */
    private static void mute(Context c) {
        try {
            if (Prefs.getBool(c, P_RESTORE, false)) return;   // already ours
            Object m = manager(c);
            if (m == null || !enabled(m)) return;             // the user has it off anyway
            Prefs.setBool(c, P_RESTORE, true);
            if (!enable(m, false)) Prefs.setBool(c, P_RESTORE, false);
        } catch (Throwable t) {
            // as above
        }
    }

    /** The breadcrumb is cleared only once the tone is actually back, or it would be lost with it. */
    private static void restore(Context c) {
        try {
            if (!Prefs.getBool(c, P_RESTORE, false)) return;
            Object m = manager(c);
            if (m == null || !enable(m, true)) return;
            Prefs.setBool(c, P_RESTORE, false);
        } catch (Throwable t) {
            // as above
        }
    }

    /** {@code Context.AUDIOPROFILE_SERVICE} is hidden, so only the service NAME needs reflection. */
    private static Object manager(Context c) {
        try {
            Field f = Context.class.getDeclaredField("AUDIOPROFILE_SERVICE");
            Object name = f.get(null);
            return (name instanceof String) ? c.getSystemService((String) name) : null;
        } catch (Throwable t) {
            return null;
        }
    }

    private static boolean enabled(Object m) {
        try {
            Method g = m.getClass().getMethod("getSoundEffectEnabled", String.class);
            Object v = g.invoke(m, PROFILE);
            return (v instanceof Boolean) && ((Boolean) v).booleanValue();
        } catch (Throwable t) {
            return false;
        }
    }

    private static boolean enable(Object m, boolean on) {
        try {
            Method s = m.getClass().getMethod("setSoundEffectEnabled", String.class, Boolean.TYPE);
            s.invoke(m, PROFILE, Boolean.valueOf(on));
            return true;
        } catch (Throwable t) {
            return false;
        }
    }
}
