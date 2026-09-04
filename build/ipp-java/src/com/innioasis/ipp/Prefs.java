package com.innioasis.ipp;

import android.content.Context;
import android.content.SharedPreferences;

import java.io.File;
import java.util.HashMap;

import com.innioasis.y1.Y1Application;

/**
 * The mod's own preferences — the {@code "innioasis_plus"} SharedPreferences file — plus the
 * handful of small answers that are read out of it everywhere.
 *
 * <p>Nothing here is cached: {@code getSharedPreferences} hands back a process-wide instance whose
 * values are already in memory, so a get is a map lookup and the wrapper costs nothing.
 *
 * <p>Some of these questions no longer have a preference behind them. When a toggle turns out to be
 * the right behaviour rather than a choice, the row leaves the innioasis++ menu and the method
 * stays, answering a constant — that keeps the call sites (stock smali among them) untouched, which
 * is the whole point of them going through here.
 */
public final class Prefs {

    /**
     * What every innioasis++ setting answers before anyone has touched it — <b>the one place</b>.
     *
     * <p>It used to be two: the menu carried {@code Item.def} and every feature carried the same
     * number again in its own {@code getBool(key, def)}. Nothing keeps two such lists in step, and
     * the failure is silent in the worst way — the row shows "On" over a feature still behaving as
     * "Off". v0.34.5 moved nine defaults to On and the work was not in the menu at all but in twelve
     * readers plus one stock one, which is exactly the shape of the problem. So the readers stopped
     * stating a default: they ask {@link #on} / {@link #val}, and the answer lives here.
     *
     * <p>Booleans are 0/1. A key that is not listed answers 0 (Off / the first choice), which is
     * what an unlisted key should mean anyway. Preferences that are not menu settings — sort modes,
     * cache stamps, the per-song {@code like:} flags — have no business here and keep passing their
     * own default to {@link #getBool} / {@link #getInt}.
     */
    private static final HashMap DEFAULTS = new HashMap();

    static {
        // [Now Playing]
        def("icon_tint", 0);                 // Icons.LIGHT, private there
        def(Cover.KEY_TILT, 1);              // the stock, iPod-like look
        def("top_hold", 1);                  // Queue
        def("book_top_hold", 1);             // Queue
        def("first_artist_only", 0);
        def("feat_in_title", 0);
        // [Menu]
        def("alpha_scroll", 1);
        def("alpha_threshold", Alpha.THRESHOLD_DEFAULT);
        def("follow_playing", 1);
        def(Follow.KEY_IDLE, Follow.IDLE_DEFAULT);
        def(Pad.KEY, 1);
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
        // kb_lang2 is deliberately absent -- see defInt
    }

    private static void def(String key, int value) {
        DEFAULTS.put(key, Integer.valueOf(value));
    }

    /**
     * The default of a CHOICE/NUMBER setting.
     *
     * <p>One of them is not a constant and cannot be tabled: the keyboard's second layout depends
     * on the language the device is in, because stock gives a Russian device no way to type Latin
     * at all. It is asked of {@link Keys} instead.
     */
    public static int defInt(String key) {
        if (Keys.KEY_SECOND.equals(key)) return Keys.defaultSecond();
        Object v = DEFAULTS.get(key);
        return v == null ? 0 : ((Integer) v).intValue();
    }

    /** The default of a TOGGLE. */
    public static boolean defBool(String key) {
        return defInt(key) != 0;
    }

    /**
     * Is this toggle on? The reader does not get to state a default — that is the whole point.
     * A null Context answers the default rather than false: "the app is not up yet" is not the
     * same as "the user turned it off", and every caller of this used to guard for it by hand.
     */
    public static boolean on(Context c, String key) {
        return c == null ? defBool(key) : getBool(c, key, defBool(key));
    }

    /** The value of a CHOICE/NUMBER row, with the same rule. */
    public static int val(Context c, String key) {
        return c == null ? defInt(key) : getInt(c, key, defInt(key));
    }

    /**
     * The album row's label: the real album name (#291.3 strips the {@code name<SOH>folder}
     * encoding) with the year appended when "Show album year" is on.
     *
     * <p>{@link YearCache} is still asked with the ENCODED name — that is its key, one entry per
     * physical album — while what is shown is the decoded one.
     */
    public static String albumLabel(String album) {
        String out = Albums.realName(album);
        if (album == null || !albumYearEnabled()) {
            return out;
        }
        String year = YearCache.get(album);
        if (year == null || year.length() <= 0) {
            return out;
        }
        return out + " (" + year + ")";
    }

    public static boolean albumYearEnabled() {
        Context c = Y1Application.Companion.getAppContext();
        return on(c, "album_year");
    }

    /**
     * ipp #281.1: artist → albums is now the only mode (the flat song list is reachable from the
     * "Show all songs" row), so the toggle was dropped from the innioasis++ menu.
     */
    public static boolean artistAlbumsEnabled() {
        return true;
    }

    /**
     * ipp: Music → Folders opens {@code \Music\}, always. It used to be the "default_music" toggle,
     * off by default; it is now the behaviour and the row is gone from the innioasis++ menu. The
     * card's root is the fallback when there is no {@code \Music\} folder at all. See also
     * {@link #videoFolderPath()}.
     *
     * <p>The Context is unused and kept because the call sites are stock smali.
     */
    public static String defaultFolderPath(Context c) {
        return isDir("/storage/sdcard0/Music") ? "/storage/sdcard0/Music" : "/storage/sdcard0";
    }

    /** ipp: the same for Videos → Folders, which used to list the card's root. */
    public static String videoFolderPath() {
        return isDir("/storage/sdcard0/Videos") ? "/storage/sdcard0/Videos" : "/storage/sdcard0";
    }

    public static boolean getBool(Context c, String key, boolean def) {
        return prefs(c).getBoolean(key, def);
    }

    private static boolean isDir(String path) {
        return new File(path).isDirectory();
    }

    /**
     * The mod's own preferences file, never stock's — everything ipp stores is in here, so clearing
     * or backing it up touches nothing the launcher itself depends on.
     */
    private static SharedPreferences prefs(Context c) {
        return c.getSharedPreferences("innioasis_plus", 0);
    }

    /** Everything stored, for the diagnostic report ({@link Diag}). Raw map: values differ in type. */
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

    /**
     * ipp: on for good, and the "track_sort" row is gone from the innioasis++ menu. The track
     * numbers it needs are read by "Cache library" in the same file open as the disc numbers, so
     * there is nothing left to opt out of. The DEFAULT sort of an album's song list is unaffected:
     * stock's {@code getSortAlbumSong()} answers {@code FileName_A_To_Z} until the user picks
     * something else.
     */
    public static boolean trackSortEnabled() {
        return true;
    }
}
