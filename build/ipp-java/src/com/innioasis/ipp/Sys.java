package com.innioasis.ipp;

import android.app.AlarmManager;
import android.content.Context;
import android.provider.Settings;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * The settings a backup has to carry that do NOT live in the app's own folder - and therefore
 * cannot be copied as a file at all. Each one is read through the API that owns it and written back
 * through the same one ({@link Backup}).
 *
 * There are three owners, and finding out which is which is the whole of this class:
 *
 *   - **Brightness, auto-brightness and the backlight timeout** are {@code Settings.System}
 *     ({@code screen_brightness}, {@code screen_brightness_mode}, {@code screen_off_timeout}) -
 *     stock reads and writes them exactly there, from {@code BrightnessActivity} and
 *     {@code SettingActivity}.
 *   - **Key tone and Key vibration** are held by MediaTek's AudioProfile service, under the profile
 *     {@code mtk_audioprofile_general}. The {@code ringtone} / {@code vibrator} entries in stock's
 *     own preferences are a MIRROR for the settings list, not the state: {@code clickRingtone}
 *     writes the preference and then calls the service, and {@code updateVibrator} reads the
 *     service back and overwrites the preference with it. So a restore that only put the
 *     preference file back showed the new value in the list while the player went on beeping as
 *     before - which is exactly what it did.
 *   - **The clock** is the device's own. It cannot be restored faithfully - the player has no
 *     network and no way of knowing how long ago the backup was taken - so what is restored is the
 *     moment the backup was written. After a flash the clock comes back years out (2022 has been
 *     seen), and the right date with the wrong minutes is worth more than that. The time zone is
 *     left alone: this firmware has no screen for it.
 *
 * The AudioProfile service is reached by reflection because both the service name
 * ({@code Context.AUDIOPROFILE_SERVICE}) and the manager's methods are MediaTek additions absent
 * from the SDK - the same reflection stock itself uses, kept call for call.
 *
 * Every value is optional in both directions: a key the snapshot does not carry is left as it is,
 * and a value this device refuses to give up is simply not in the snapshot. That is what makes an
 * archive from another build safe to read.
 */
public final class Sys {

    private Sys() { }

    /** The AudioProfile profile every one of stock's calls names. */
    private static final String PROFILE = "mtk_audioprofile_general";

    private static final String BRIGHTNESS = "screen_brightness";
    private static final String BRIGHTNESS_MODE = "screen_brightness_mode";
    private static final String SCREEN_OFF = "screen_off_timeout";

    /**
     * The snapshot for the archive: {@code key=value} per line, missing keys simply absent. Plain
     * text on purpose - it is the one part of a backup a person may want to read or edit by hand.
     */
    static String snapshot(Context c) {
        StringBuilder s = new StringBuilder(128);
        put(s, BRIGHTNESS, sysInt(c, BRIGHTNESS));
        put(s, BRIGHTNESS_MODE, sysInt(c, BRIGHTNESS_MODE));
        put(s, SCREEN_OFF, sysInt(c, SCREEN_OFF));
        put(s, "key_tone", profileFlag(c, "getSoundEffectEnabled"));
        put(s, "key_vibration", profileFlag(c, "getHapticFeedbackEnabled"));
        s.append("clock=").append(System.currentTimeMillis()).append('\n');
        return s.toString();
    }

    /**
     * Apply a snapshot. Nothing here is allowed to stop the restore: a device that refuses one of
     * these settings still gets everything else, and the failure is written to the log ring.
     */
    static void apply(Context c, String text) {
        if (c == null || text == null) return;
        String[] lines = text.split("\n");
        for (int i = 0; i < lines.length; i++) {
            String line = lines[i].trim();
            int eq = line.indexOf('=');
            if (eq <= 0) continue;
            String key = line.substring(0, eq).trim();
            String value = line.substring(eq + 1).trim();
            try {
                if (BRIGHTNESS.equals(key) || BRIGHTNESS_MODE.equals(key)
                        || SCREEN_OFF.equals(key)) {
                    Settings.System.putInt(c.getContentResolver(), key, Integer.parseInt(value));
                } else if ("key_tone".equals(key)) {
                    setProfileFlag(c, "setSoundEffectEnabled", "1".equals(value));
                } else if ("key_vibration".equals(key)) {
                    setProfileFlag(c, "setHapticFeedbackEnabled", "1".equals(value));
                } else if ("clock".equals(key)) {
                    setClock(c, Long.parseLong(value));
                }
            } catch (Throwable t) {
                Diag.note("restore " + key + " failed: " + t);
            }
        }
    }

    private static void put(StringBuilder s, String key, int value) {
        if (value >= 0) s.append(key).append('=').append(value).append('\n');
    }

    /** One {@code Settings.System} int, or -1 when this device does not carry it. */
    private static int sysInt(Context c, String key) {
        try {
            return Settings.System.getInt(c.getContentResolver(), key, -1);
        } catch (Throwable t) {
            return -1;
        }
    }

    /** 1, 0, or -1 for "the service did not answer" - which keeps the key out of the snapshot. */
    private static int profileFlag(Context c, String getter) {
        try {
            Object m = manager(c);
            if (m == null) return -1;
            Method get = m.getClass().getMethod(getter, String.class);
            Object v = get.invoke(m, PROFILE);
            if (!(v instanceof Boolean)) return -1;
            return ((Boolean) v).booleanValue() ? 1 : 0;
        } catch (Throwable t) {
            Diag.note("audioprofile " + getter + " failed: " + t);
            return -1;
        }
    }

    private static void setProfileFlag(Context c, String setter, boolean on) throws Throwable {
        Object m = manager(c);
        if (m == null) return;
        Method set = m.getClass().getMethod(setter, String.class, Boolean.TYPE);
        set.invoke(m, PROFILE, Boolean.valueOf(on));
    }

    /**
     * MediaTek's AudioProfileManager, or null. Both the service name and the class are additions to
     * this firmware, so the name is read off {@code Context} as a field - stock does the same, and
     * hardcoding the string would tie us to a value only this ROM knows.
     */
    private static Object manager(Context c) throws Throwable {
        Field f = Context.class.getDeclaredField("AUDIOPROFILE_SERVICE");
        Object name = f.get(null);
        return name == null ? null : c.getSystemService((String) name);
    }

    /**
     * Set the clock. {@code AlarmManager.setTime} is the way the framework means it to be done and
     * needs {@code SET_TIME}, which the manifest carries; {@code SystemClock} is the same call one
     * layer down and stands in if the manager refuses.
     */
    private static void setClock(Context c, long millis) {
        // A backup old enough that the value is nonsense is not worth arguing about, but zero and
        // negative are: they would put the device in 1970.
        if (millis <= 0L) return;
        try {
            AlarmManager am = (AlarmManager) c.getSystemService(Context.ALARM_SERVICE);
            if (am != null) {
                am.setTime(millis);
                return;
            }
        } catch (Throwable t) {
            Diag.note("setTime via AlarmManager failed: " + t);
        }
        try {
            android.os.SystemClock.setCurrentTimeMillis(millis);
        } catch (Throwable t) {
            Diag.note("setCurrentTimeMillis failed: " + t);
        }
    }
}
