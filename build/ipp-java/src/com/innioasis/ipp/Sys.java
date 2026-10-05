package com.innioasis.ipp;

import android.app.AlarmManager;
import android.content.Context;
import android.provider.Settings;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * Backed-up settings that live outside the app's folder, read and written through their owners:
 * brightness and screen timeout in {@code Settings.System}; key vibration in MediaTek's AudioProfile
 * service (stock's {@code vibrator} preference is only a mirror — restoring it alone changes the
 * list, not the device); key tone through {@link Tone}; and the clock, restored to the moment of
 * the backup because after a flash it comes back years out.
 *
 * Every key is optional both ways, so an archive from another build is safe to read.
 */
public final class Sys {

    private Sys() { }

    private static final String PROFILE = "mtk_audioprofile_general";

    private static final String BRIGHTNESS = "screen_brightness";
    private static final String BRIGHTNESS_MODE = "screen_brightness_mode";
    private static final String SCREEN_OFF = "screen_off_timeout";

    /** {@code key=value} per line: plain text, so a person can read or edit it. */
    static String snapshot(Context c) {
        StringBuilder s = new StringBuilder(128);
        put(s, BRIGHTNESS, sysInt(c, BRIGHTNESS));
        put(s, BRIGHTNESS_MODE, sysInt(c, BRIGHTNESS_MODE));
        put(s, SCREEN_OFF, sysInt(c, SCREEN_OFF));
        put(s, "key_tone", Tone.on(c) ? 1 : 0);
        put(s, "key_vibration", profileFlag(c, "getHapticFeedbackEnabled"));
        s.append("clock=").append(System.currentTimeMillis()).append('\n');
        return s.toString();
    }

    /** A setting the device refuses is logged and skipped; the rest still applies. */
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
                    Tone.setOn(c, "1".equals(value));
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

    /** -1 when this device does not carry the key. */
    private static int sysInt(Context c, String key) {
        try {
            return Settings.System.getInt(c.getContentResolver(), key, -1);
        } catch (Throwable t) {
            return -1;
        }
    }

    /** 1, 0, or -1 when the service did not answer. */
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

    /** A MediaTek addition: the service name is read off {@code Context} by reflection, as stock does. */
    private static Object manager(Context c) throws Throwable {
        Field f = Context.class.getDeclaredField("AUDIOPROFILE_SERVICE");
        Object name = f.get(null);
        return name == null ? null : c.getSystemService((String) name);
    }

    /** {@code AlarmManager.setTime} (SET_TIME is in the manifest), {@code SystemClock} as fallback. */
    private static void setClock(Context c, long millis) {
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
