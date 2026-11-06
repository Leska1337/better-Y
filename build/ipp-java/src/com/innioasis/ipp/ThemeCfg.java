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

    /** CHOICE keys with the names their values are written under. */
    private static final String[] KEYS = {"icon_tint", Tint.KEY_TEXT, Tint.KEY_BOX,
            Tint.KEY_LYRICS, TopBar.KEY_TEXT, Preview.KEY, MenuStyle.KEY, TopBar.KEY_STYLE};
    private static final Object[] NAMES = {TINT, TINT, BOX, TINT, TINT, TINT, STYLE, BAR};

    /** TOGGLE keys. */
    private static final String[] FLAGS = {Pad.KEY};

    private ThemeCfg() {}

    /** Called from the theme confirm dialog right before stock stores the new name and relaunches. */
    public static void switchTo(String newPath) {
        try {
            SharedPreferences p = Prefs.file();
            if (p == null) return;
            File from = fileOf(dirOf(ThemeManager.INSTANCE.getThemeName()));
            SharedPreferences.Editor e = p.edit();
            if (from == null || !from.isFile()) toGlobal(p, e);
            File to = fileOf(newPath);
            JSONObject j = to != null && to.isFile() ? read(to) : null;
            if (j != null) fromJson(j, e);
            else fromGlobal(p, e);
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
    }

    private static void fromGlobal(SharedPreferences p, SharedPreferences.Editor e) {
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
        return j;
    }

    /** Names or numbers both read; a value out of range falls back to the default. */
    private static void fromJson(JSONObject j, SharedPreferences.Editor e) {
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
