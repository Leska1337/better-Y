package com.innioasis.ipp;

import android.content.Context;
import android.content.SharedPreferences;

import java.io.File;
import java.util.HashMap;

import com.innioasis.y1.Y1Application;

/**
 * The mod's preferences ({@code "innioasis_plus"}, never stock's file) and the small answers read
 * from them everywhere. A few methods answer a constant: the behaviour is settled, and stock smali
 * still calls them.
 */
public final class Prefs {

    /**
     * Every better-Y setting's default, in one place. Readers never state their own — a default
     * named twice drifts, and the row shows "On" over a feature behaving as "Off". Unlisted keys
     * answer 0. Non-menu preferences (sort modes, stamps, {@code like:}) pass their own default.
     */
    private static final HashMap DEFAULTS = new HashMap();

    static {
        // [Now Playing]
        def("icon_tint", 0);                 // Icons.LIGHT, private there
        def(Tint.KEY_TEXT, 0);               // white, as the layout had it
        def(Tint.KEY_LYRICS, 0);
        def(Tint.KEY_BOX, 0);                // white, as the layout had it
        def(Cover.KEY_TILT, 1);              // the stock, iPod-like look
        def("top_hold", 1);                  // Queue
        def("book_top_hold", 1);             // Queue
        def(Feat.KEY_FIRST, 0);
        def(Feat.KEY_FIRST_FEAT, 0);
        def(Feat.KEY, 0);
        def(Feat.KEY_VARIOUS, 0);
        def(Feat.KEY_FEAT, 0);
        def(Ipp.KEY_LINE_SCROLL, 0);         // the title runs on its own; the two lines under it are asked for
        // [Menu]
        def("alpha_scroll", 1);
        def("alpha_threshold", Alpha.THRESHOLD_DEFAULT);
        def("follow_playing", 1);
        def(Follow.KEY_IDLE, Follow.IDLE_DEFAULT);
        def(Pad.KEY, 1);
        def(Loop.KEY, 0);
        def(Anim.KEY, 1);
        def(Anim.KEY_NAV, 1);
        def(Anim.KEY_SCROLL, 1);
        def(MenuStyle.KEY, 0);               // the preview beside the list, as stock draws it
        def(Preview.KEY, 0);                 // white, as the layouts have it
        def(TopBar.KEY_TEXT, 0);             // white, as the layout has it
        def(TopBar.KEY_ICONS, TopBar.ALL);
        def(TopBar.KEY_HEADER, 1);
        def(TopBar.KEY_STYLE, 0);
        for (int i = 0; i < MainMenu.DEFAULT_ON.length; i++) def(MainMenu.DEFAULT_ON[i], 1);
        // [Metadata]
        def("meta_title", 1);
        def("book_meta_title", 0);           // a chapter's tag is routinely worse than its file name
        def("album_year", 1);
        def("track_numbers", 1);
        def(Artists.KEY_SPLIT, 1);
        def(GenreSplit.KEY_SPLIT, 1);
        def(Albums.KEY_SCOPE, 1);
        // [System]
        def("delete_folder", 0);             // stock leaves the folder; taking it is opt-in
        def("keep_awake", 1);
        def("likes", 1);
        def(CenterHold.KEY, 0);
        def(Saver.KEY_ON, 0);
        def(Saver.KEY_STYLE, Saver.STYLE_DEFAULT);
        def(Saver.KEY_BRIGHT, Saver.BRIGHT_DEFAULT);
        def(Saver.KEY_OFF, Saver.OFF_DEFAULT);
        def(Saver.KEY_CHARGING, 0);
        def(Saver.KEY_BG, Saver.BG_WALLPAPER);   // the theme's global wallpaper until a picture is set
        def(Saver.KEY_TINT, Saver.TINT_OFF);
        def(Saver.KEY_CLOCK, Saver.COLOR_LIGHT);
        def(Saver.KEY_TEXT, Saver.COLOR_LIGHT);
        // Cover Flow's own settings
        def(Flow.KEY_COUNT, 2);              // seven albums, as the iPod shows them
        def(Flow.KEY_SORT, Flow.A_Z);
        def(Flow.KEY_GROUP, 0);
        def(Flow.KEY_YEAR, 0);
        def(Flow.KEY_START, Flow.START_LAST);
        // Settings -> Key tone
        def(Tone.KEY_ON, 1);                 // stock's own default
        def(Tone.KEY_VOLUME, Tone.VOLUME_DEFAULT);
        // kb_lang2 is deliberately absent -- see defInt
    }

    private static void def(String key, int value) {
        DEFAULTS.put(key, Integer.valueOf(value));
    }

    /** The keyboard's second layout depends on the device language, so {@link Keys} answers it. */
    public static int defInt(String key) {
        if (Keys.KEY_SECOND.equals(key)) return Keys.defaultSecond();
        Object v = DEFAULTS.get(key);
        return v == null ? 0 : ((Integer) v).intValue();
    }

    public static boolean defBool(String key) {
        return defInt(key) != 0;
    }

    /** A null Context answers the default: "app not up yet" is not "turned off". */
    public static boolean on(Context c, String key) {
        return c == null ? defBool(key) : getBool(c, key, defBool(key));
    }

    public static int val(Context c, String key) {
        return c == null ? defInt(key) : getInt(c, key, defInt(key));
    }

    /** Decoded name plus " (year)"; {@link YearCache} is keyed by the encoded name. */
    public static String albumLabel(String album) {
        if (album == null) return Albums.realName(null);
        // the marker rows name an album artist, which is not the key's to answer
        if (Albums.isAllSongs(album) || Albums.isGenreAll(album)) return Albums.realName(album);
        boolean on = albumYearEnabled();
        String year = on ? YearCache.label(album) : null;
        // the bind asks on every row: the name and the year are cut and joined once per album
        synchronized (LABELS) {
            Object[] m = (Object[]) LABELS.get(album);
            if (m != null && m[0] == (on ? Boolean.TRUE : Boolean.FALSE)
                    && (year == null ? m[1] == null : year.equals(m[1]))) {
                return (String) m[2];
            }
        }
        String out = Albums.realName(album);
        if (on && year != null && year.length() > 0) out = out + " (" + year + ")";
        synchronized (LABELS) {
            LABELS.put(album, new Object[] { on ? Boolean.TRUE : Boolean.FALSE, year, out });
        }
        return out;
    }

    private static final java.util.HashMap LABELS = new java.util.HashMap();

    /** From {@code Ipp.libraryChanged}: the albums and their names are read anew. */
    static void forgetLabels() {
        synchronized (LABELS) {
            LABELS.clear();
        }
    }

    public static boolean albumYearEnabled() {
        Context c = Y1Application.Companion.getAppContext();
        return on(c, "album_year");
    }

    /** An artist opens on his albums; the songs are behind "Show all songs". */
    public static boolean artistAlbumsEnabled() {
        return true;
    }

    /** Music → Folders opens Music, else the card root. The Context is for the stock call sites. */
    public static String defaultFolderPath(Context c) {
        return isDir("/storage/sdcard0/Music") ? "/storage/sdcard0/Music" : "/storage/sdcard0";
    }
    public static String videoFolderPath() {
        return isDir("/storage/sdcard0/Videos") ? "/storage/sdcard0/Videos" : "/storage/sdcard0";
    }

    public static boolean getBool(Context c, String key, boolean def) {
        return prefs(c).getBoolean(key, def);
    }

    private static boolean isDir(String path) {
        return new File(path).isDirectory();
    }

    private static SharedPreferences prefs(Context c) {
        return c.getSharedPreferences("innioasis_plus", 0);
    }

    /** The file itself, for keys that need {@code remove} or {@code commit}. Null before the app is up. */
    static SharedPreferences file() {
        Context c = Y1Application.Companion.getAppContext();
        return c == null ? null : prefs(c);
    }

    /** For the diagnostic report. */
    static java.util.Map all(Context c) {
        return c == null ? null : prefs(c).getAll();
    }

    public static void setBool(Context c, String key, boolean value) {
        prefs(c).edit().putBoolean(key, value).apply();
    }

    public static int getInt(Context c, String key, int def) {
        return prefs(c).getInt(key, def);
    }

    public static void setInt(Context c, String key, int value) {
        prefs(c).edit().putInt(key, value).apply();
    }

    public static String getString(Context c, String key, String def) {
        return prefs(c).getString(key, def);
    }

    public static void setString(Context c, String key, String value) {
        prefs(c).edit().putString(key, value).apply();
    }

    public static boolean has(Context c, String key) {
        return prefs(c).contains(key);
    }

    /** The "Track number" sort is always offered; the album's default sort stays stock's. */
    public static boolean trackSortEnabled() {
        return true;
    }
}
