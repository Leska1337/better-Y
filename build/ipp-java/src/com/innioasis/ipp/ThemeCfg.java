package com.innioasis.ipp;

import android.content.Context;
import android.content.SharedPreferences;
import android.widget.Toast;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;

import org.json.JSONObject;

import com.innioasis.y1.R;
import com.innioasis.y1.activity.theme.ThemeListActivity;
import com.innioasis.y1.theme.ThemeManager;

/**
 * The look settings a theme carries in its own folder ({@code better-Y.json}). Applying a theme
 * loads its file, or the Global copy when it has none; leaving a theme without a file stores the
 * current values as Global first, so edits made in the better-Y menu are not lost. A key missing
 * from a theme's file means its default, a key missing from Global leaves the value as it is.
 */
public final class ThemeCfg {

    static final String FILE = "better-Y.json";
    private static final String GLOBAL = "global:";

    private static final String[] TINT = {"light", "dark", "theme"};
    private static final String[] BOX = {"light", "dark", "theme", "off"};
    private static final String[] STYLE = {"default", "simple"};
    private static final String[] BAR = {"default", "centered"};
    private static final String[] SS_BG = {"light", "dark", "wallpaper"};
    private static final String[] SS_TINT = {"off", "light", "dark", "theme"};
    private static final String[] SS_STYLE = {"clock_left", "clock_center", "clock_right",
            "clock_date_left", "clock_date_center", "clock_date_right",
            "song_left", "song_center", "song_right"};

    /** CHOICE keys with the names their values are written under. */
    private static final String[] KEYS = {"icon_tint", Tint.KEY_TEXT, Tint.KEY_BOX,
            Tint.KEY_LYRICS, TopBar.KEY_TEXT, Preview.KEY, MenuStyle.KEY, TopBar.KEY_STYLE,
            Saver.KEY_STYLE, Saver.KEY_BG, Saver.KEY_TINT, Saver.KEY_CLOCK, Saver.KEY_TEXT};
    private static final Object[] NAMES = {TINT, TINT, BOX, TINT, TINT, TINT, STYLE, BAR,
            SS_STYLE, SS_BG, SS_TINT, TINT, TINT};

    /** TOGGLE keys. */
    private static final String[] FLAGS = {Pad.KEY};

    /** Whether Key tone's Sound is Theme: a yes or no, so a file name never goes in. */
    private static final String THEME_SOUND = "use_theme_key_sound";

    private ThemeCfg() {}

    /** Called from the theme confirm dialog right before stock stores the new name and relaunches. */
    public static void switchTo(String newPath) {
        try {
            SharedPreferences p = Prefs.file();
            if (p == null) return;
            File from = fileOf(dirOf(ThemeManager.INSTANCE.getThemeName()));
            // committed first: what follows reads Global back from p, not from an editor
            SharedPreferences.Editor g = p.edit();
            if (from == null || !from.isFile()) toGlobal(p, g);
            else rememberSound(p, g);
            g.commit();
            SharedPreferences.Editor e = p.edit();
            File to = fileOf(newPath);
            JSONObject j = to != null && to.isFile() ? read(to) : null;
            if (j != null) fromJson(j, p, e);
            else fromGlobal(p, e);
            // the theme's own screensaver picture, or none: the saver then shows the global wallpaper
            String ss = Saver.themePicture(newPath);
            if (ss != null) e.putString(Saver.KEY_IMAGE, ss);
            else e.remove(Saver.KEY_IMAGE);
            e.commit();
        } catch (Throwable t) {
            Diag.note("ThemeCfg.switchTo: " + t);
        }
    }

    /** Menu "Save config": the current values into the theme under the cursor, or Global for Default. */
    public static void save(Context c, ThemeListActivity.Item item) {
        boolean ok = false;
        String name = item == null ? "" : item.getName();
        try {
            SharedPreferences p = Prefs.file();
            File f = fileOf(item == null ? "" : item.getPath());
            if (p != null) {
                if (f == null) {
                    SharedPreferences.Editor e = p.edit();
                    toGlobal(p, e);
                    ok = e.commit();
                } else {
                    if (!f.isFile() && f.getParentFile().getName().equals(
                            ThemeManager.INSTANCE.getThemeName())) {
                        // the active theme leaves Global: keep what it had been showing
                        SharedPreferences.Editor e = p.edit();
                        toGlobal(p, e);
                        e.commit();
                    }
                    ok = write(f, toJson(p));
                    if (ok) Theme.cfgSaved(c, item.getPath());
                }
            }
        } catch (Throwable t) {
            Diag.note("ThemeCfg.save: " + t);
        }
        if (c == null) return;
        String msg = ok ? c.getString(R.string.ipp_theme_saved, name)
                : c.getString(R.string.ipp_theme_save_failed);
        Toast.makeText(c, msg, Toast.LENGTH_SHORT).show();
    }

    private static String dirOf(String themeName) {
        return themeName == null || themeName.length() == 0 ? "" : ThemeManager.themesPath + "/" + themeName;
    }

    /** Null for the default theme, which has no folder. */
    private static File fileOf(String dir) {
        return dir == null || dir.trim().length() == 0 ? null : new File(dir, FILE);
    }

    private static int current(SharedPreferences p, String key) {
        return p.getInt(key, Prefs.defInt(key));
    }

    private static boolean currentFlag(SharedPreferences p, String key) {
        return p.getBoolean(key, Prefs.defBool(key));
    }

    private static void toGlobal(SharedPreferences p, SharedPreferences.Editor e) {
        for (int i = 0; i < KEYS.length; i++) e.putInt(GLOBAL + KEYS[i], current(p, KEYS[i]));
        for (int i = 0; i < FLAGS.length; i++) e.putBoolean(GLOBAL + FLAGS[i], currentFlag(p, FLAGS[i]));
        rememberSound(p, e);
    }

    /** The key sound follows the user across themes, a file theme or not; Theme stays behind. */
    private static void rememberSound(SharedPreferences p, SharedPreferences.Editor e) {
        String s = p.getString(Tone.KEY_SOUND, "");
        if (!Tone.THEME.equals(s)) e.putString(GLOBAL + Tone.KEY_SOUND, s);
    }

    /**
     * The last sound chosen other than Theme: Theme comes only from a theme's flag, so Global
     * never holds it and a theme without the flag never inherits it. None yet is Default.
     */
    private static void soundFromGlobal(SharedPreferences p, SharedPreferences.Editor e) {
        String g = p.getString(GLOBAL + Tone.KEY_SOUND, "");
        if (Tone.THEME.equals(g)) g = "";
        String now = p.getString(Tone.KEY_SOUND, "");
        if (p.contains(GLOBAL + Tone.KEY_SOUND) || Tone.THEME.equals(now)) {
            e.putString(Tone.KEY_SOUND, g);
        }
    }

    private static void fromGlobal(SharedPreferences p, SharedPreferences.Editor e) {
        soundFromGlobal(p, e);
        for (int i = 0; i < KEYS.length; i++) {
            String g = GLOBAL + KEYS[i];
            if (p.contains(g)) e.putInt(KEYS[i], p.getInt(g, 0));
        }
        for (int i = 0; i < FLAGS.length; i++) {
            String g = GLOBAL + FLAGS[i];
            if (p.contains(g)) e.putBoolean(FLAGS[i], p.getBoolean(g, true));
        }
    }

    private static JSONObject toJson(SharedPreferences p) throws Exception {
        JSONObject j = new JSONObject();
        for (int i = 0; i < KEYS.length; i++) {
            String[] names = (String[]) NAMES[i];
            int v = current(p, KEYS[i]);
            if (v >= 0 && v < names.length) j.put(KEYS[i], names[v]);
            else j.put(KEYS[i], v);
        }
        for (int i = 0; i < FLAGS.length; i++) j.put(FLAGS[i], currentFlag(p, FLAGS[i]));
        j.put(THEME_SOUND, Tone.THEME.equals(p.getString(Tone.KEY_SOUND, "")));
        return j;
    }

    /**
     * Names or numbers both read; a value out of range falls back to the default. The key sound
     * is only ever "the theme's": without that flag the theme takes the Global one.
     */
    private static void fromJson(JSONObject j, SharedPreferences p, SharedPreferences.Editor e) {
        if (j.optBoolean(THEME_SOUND, false)) e.putString(Tone.KEY_SOUND, Tone.THEME);
        else soundFromGlobal(p, e);
        for (int i = 0; i < KEYS.length; i++) {
            String[] names = (String[]) NAMES[i];
            int v = Prefs.defInt(KEYS[i]);
            Object o = j.opt(KEYS[i]);
            if (o instanceof Number) {
                int n = ((Number) o).intValue();
                if (n >= 0 && n < names.length) v = n;
            } else if (o instanceof String) {
                for (int k = 0; k < names.length; k++) {
                    if (names[k].equalsIgnoreCase(((String) o).trim())) v = k;
                }
            }
            e.putInt(KEYS[i], v);
        }
        for (int i = 0; i < FLAGS.length; i++) {
            Object o = j.opt(FLAGS[i]);
            boolean v = o instanceof Boolean ? ((Boolean) o).booleanValue() : Prefs.defBool(FLAGS[i]);
            e.putBoolean(FLAGS[i], v);
        }
    }

    private static JSONObject read(File f) {
        InputStream in = null;
        try {
            in = new FileInputStream(f);
            byte[] b = new byte[(int) Math.min(f.length(), 64 * 1024)];
            int n = 0;
            while (n < b.length) {
                int r = in.read(b, n, b.length - n);
                if (r < 0) break;
                n += r;
            }
            return new JSONObject(new String(b, 0, n, "UTF-8"));
        } catch (Throwable t) {
            Diag.note("ThemeCfg.read " + f + ": " + t);
            return null;
        } finally {
            try { if (in != null) in.close(); } catch (Throwable t) {}
        }
    }

    private static boolean write(File f, JSONObject j) {
        FileOutputStream out = null;
        try {
            out = new FileOutputStream(f);
            out.write(j.toString(2).getBytes("UTF-8"));
            out.getFD().sync();
            return true;
        } catch (Throwable t) {
            Diag.note("ThemeCfg.write " + f + ": " + t);
            return false;
        } finally {
            try { if (out != null) out.close(); } catch (Throwable t) {}
        }
    }
}
