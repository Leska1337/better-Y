package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.SystemClock;
import android.util.TypedValue;
import android.view.View;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import com.innioasis.music.adapter.MyBaseAdapter;
import com.innioasis.music.data.Album;
import com.innioasis.music.data.Genre;
import com.innioasis.music.objects.Global;
import com.innioasis.music.util.SubMenuDialog;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.database.Y1Repository;
import com.innioasis.y1.utils.SharedPreferencesUtils;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Same-named albums in different folders are different albums: the physical album is the
 * FOLDER (CD/Disc subfolders roll up to their parent), and the album list carries
 * {@code name SEP folder}. The encoded string is opaque to the list caches and is decoded only
 * where it feeds a query or a label.
 */
public final class Albums {

    private static final char SEP = (char) 1;   // never appears in tag text

    // "Show all songs" of an artist: STX + artist. It travels the same stock path an album name
    // does, so the flat list, its sort menu and the Shuffle row all come from stock code.
    private static final char ALL = (char) 2;

    public static boolean isAllSongs(String s) {
        return s != null && s.length() > 0 && s.charAt(0) == ALL;
    }

    /** The artist a "Show all songs" row belongs to, or null for anything else. */
    public static String allSongsArtist(String s) {
        return isAllSongs(s) ? s.substring(1) : null;
    }

    private static String allMark(String artist) { return ALL + artist; }

    // "Show all songs" of a genre's album list. Not ALL: the two meet in songsSync and decode
    // to different things.
    private static final char GEN = (char) 3;

    public static String genreMark(String genre) { return GEN + (genre == null ? "" : genre); }

    /** The "Show all songs" marker of an artist, for building an album list by hand (Genres). */
    public static String artistMark(String artist) { return allMark(artist == null ? "" : artist); }

    /** The encoded album key of a song — the name a list row carries. */
    public static String albumKey(String album, String path) {
        return enc(album == null ? "" : album, albumFolder(path));
    }

    public static boolean isGenreAll(String s) {
        return s != null && s.length() > 0 && s.charAt(0) == GEN;
    }

    public static boolean isEnc(String s) { return s != null && s.indexOf(SEP) >= 0; }

    public static String realName(String s) {
        if (s == null) return null;
        // the flat list's title bar; an album artist's row carries a marker of its own under ours
        if (isAllSongs(s) || isGenreAll(s)) return AlbumArtists.name(s.substring(1));
        int i = s.indexOf(SEP);
        return i < 0 ? s : s.substring(0, i);
    }

    private static String folderOf(String s) {
        if (s == null) return null;
        int i = s.indexOf(SEP);
        return i < 0 ? null : s.substring(i + 1);
    }

    private static String enc(String name, String folder) { return name + SEP + folder; }

    private static boolean eq(String a, String b) {
        return (a == null ? "" : a).equals(b == null ? "" : b);
    }

    /** The encoded album key of a track — the key {@code CoverCache} uses. */
    public static String keyOf(Song s) {
        if (s == null) return null;
        String album = s.getAlbum() == null ? "" : s.getAlbum();
        return enc(album, albumFolder(s.getPath()));
    }

    /** Immediate parent directory of a track (per-disc; used for the Now-Playing cover). */
    public static String trackFolder(String path) {
        if (path == null) return "";
        int i = path.lastIndexOf('/');
        return i < 0 ? "" : path.substring(0, i);
    }

    /** Physical-album folder of a track: its parent dir, with CD/Disc subfolders rolled up. */
    public static String albumFolder(String path) {
        String dir = trackFolder(path);
        int j = dir.lastIndexOf('/');
        if (j < 0) return dir;
        String base = dir.substring(j + 1);
        return isCdFolder(base) ? dir.substring(0, j) : dir;
    }

    // The token may sit anywhere in the name ("CD2 (Bonus disk)").
    private static final Pattern CD_PAT = Pattern.compile("(cd|disc|disk|диск)[ ._-]?(\\d+)");

    private static boolean isCdFolder(String name) {
        return discNumber(name) > 0;
    }

    /**
     * The disc of a track: its folder if the folder says so, else the cached DISC NUMBER tag, else
     * 0. {@code Disc.SIDE_BASE + n} is a record side ("A1"), kept above every real disc number.
     */
    public static int discOf(String path) {
        int d = discNumber(trackFolder(path));
        return d > 0 ? d : DiscCache.get(path);
    }

    /** Disc number parsed from a folder name (e.g. "CD2 (Bonus)" -> 2), or 0 if none. */
    public static int discNumber(String name) {
        if (name == null) return 0;
        Matcher m = CD_PAT.matcher(name.toLowerCase(Locale.ROOT));
        if (!m.find()) return 0;
        try { return Integer.parseInt(m.group(2)); } catch (Throwable t) { return 0; }
    }

    // The whole library, shared by every album query; dropped by event (invalidate) and read
    // again off the main thread, so no screen waits for it. The TTL only backstops a write path
    // that forgets to invalidate: past it the list is still answered, and checked in the background.
    private static List songCache;
    private static long songCacheAt;
    /** What the last invalidate dropped: an unchanged library gets this very list back. */
    private static List songPrev;
    /** Bumped by every invalidate, so a read that raced a write is not kept. */
    private static int songGen;
    private static boolean checkAsked;
    private static final Object SONGS = new Object();
    private static final long CACHE_TTL_MS = 600000L;
    private static final long WARM_DELAY_MS = 2000L;
    private static Handler warmer;
    private static final Runnable WARM = new Warm();

    /** Drop the cached library. Called once per file during a scan, so it must stay trivial. */
    public static void invalidate() {
        synchronized (SONGS) {
            if (songCache != null) songPrev = songCache;
            songCache = null;
            songCacheAt = 0L;
            songGen++;
            sorted = null;
        }
        keyMemo = null;
        Find.clear();       // the Search rows count their songs off this very list
        warmSoon(WARM_DELAY_MS);
    }

    private static Handler worker() {
        synchronized (SONGS) {
            if (warmer == null) {
                // default priority: the read holds the database, which the main thread asks too
                HandlerThread t = new HandlerThread("ipp-library");
                t.start();
                warmer = new Handler(t.getLooper());
            }
            return warmer;
        }
    }

    /** Restarts the wait: a run of writes ends in one read. */
    private static void warmSoon(long delay) {
        try {
            Handler h = worker();
            h.removeCallbacks(WARM);
            h.postDelayed(WARM, delay);
        } catch (Throwable t) {
        }
    }

    /** Background work of the library's own thread, for the caches beside this one. */
    static void later(Runnable r, long delay) {
        try {
            worker().postDelayed(r, delay);
        } catch (Throwable t) {
        }
    }

    /** One read of the table, kept unless the table was written to meanwhile. */
    private static List readSongs() {
        Y1Repository repo = Y1Application.Companion.getY1Repository();
        if (repo == null) return null;
        int gen;
        synchronized (SONGS) { gen = songGen; }
        long t0 = SystemClock.uptimeMillis();
        Object order = orderNow();
        List all = repo.getSongsSync(0);
        if (order != orderNow()) order = null;
        Diag.slow("library read", t0);
        if (all == null) return null;
        synchronized (SONGS) {
            if (gen != songGen) return all;
            if (songCache != null) return songCache;
            if (songPrev != null && songPrev.equals(all)) all = songPrev;
            songPrev = null;
            songOrder = order;
            songCache = all;
            songCacheAt = System.currentTimeMillis();
        }
        return all;
    }

    /**
     * The song list read on the caller's thread, now. From the end of the stock scan, before its
     * flag drops: the read is then inside the time the scan dialog is up.
     */
    public static void loadNow() {
        try {
            Scan.done();
            lists();
            AlbumArtist.warm();
            MetaCache.warm();
            Schema.backfill();
        } catch (Throwable t) {
        }
    }

    /** The song list and what the first screens build from it: album folders, the All songs order. */
    private static void lists() {
        List all = allSongs();
        if (all == null) return;
        foldersOf(all);
        Artists.index(all);
        Y1Repository repo = Y1Application.Companion.getY1Repository();
        if (repo == null) return;
        songsIn(repo, Y1Repository.SongSortType.Companion.fromType(
                SharedPreferencesUtils.INSTANCE.getSortAllSong()));
    }

    /** The order {@code getSongsSync} reads in under the stock settings of this moment, as an All songs sort. */
    private static Object orderNow() {
        SharedPreferencesUtils p = SharedPreferencesUtils.INSTANCE;
        if (p.isSortByName()) {
            return p.isSortLogic() ? Y1Repository.SongSortType.FileName_A_To_Z
                    : Y1Repository.SongSortType.FileName_Z_To_A;
        }
        return p.isSortLogic() ? Y1Repository.SongSortType.Time_Asc
                : Y1Repository.SongSortType.Time_Desc;
    }

    /** The sort {@link #songCache} was read in, or null when it is not known. */
    private static Object songOrder;
    /** One All songs list in a sort the cached list is not in; dropped with it. */
    private static List sorted;
    private static Object sortedType;

    /**
     * All songs in the given sort without a query when the list is already in memory. A copy:
     * the screen's adapter owns what it is handed. Stock stores the sort as it queries, so that
     * is done here as well.
     */
    public static List songsList(Y1Repository repo, Y1Repository.SongSortType type) {
        List l = songsIn(repo, type);
        try {
            SharedPreferencesUtils.INSTANCE.setSortAllSong(type.getType());
        } catch (Throwable t) {
        }
        return l == null ? null : new ArrayList(l);
    }

    /**
     * The queried list over the Song objects the cached list already holds: a second set of them
     * is megabytes of heap, and every collection pauses for as long as the heap is large.
     */
    private static List shared(List l) {
        List all = songCache;
        if (l == null || all == null) return l;
        HashMap by = new HashMap(all.size() * 2);
        for (int i = 0; i < all.size(); i++) {
            Object o = all.get(i);
            if (o instanceof Song) by.put(((Song) o).getPath(), o);
        }
        ArrayList out = new ArrayList(l.size());
        for (int i = 0; i < l.size(); i++) {
            Object o = l.get(i);
            Object had = (o instanceof Song) ? by.get(((Song) o).getPath()) : null;
            out.add(had != null ? had : o);
        }
        return out;
    }

    private static List songsIn(Y1Repository repo, Y1Repository.SongSortType type) {
        int gen;
        synchronized (SONGS) {
            if (songCache != null && type == songOrder) return songCache;
            if (sorted != null && type == sortedType) return sorted;
            gen = songGen;
        }
        List l = shared(repo.getSongsList(type));
        synchronized (SONGS) {
            if (l != null && gen == songGen) {
                sorted = l;
                sortedType = type;
            }
        }
        return l;
    }

    private static boolean started;

    /**
     * Once per launch, from the main menu: with no scan to end in {@link #loadNow}, the list is
     * read on the library thread, so that the first section opened does not wait.
     */
    public static void atStart(Activity a) {
        if (started) return;
        started = true;
        if (songCache == null) warmSoon(0L);
    }

    static final class Warm implements Runnable {
        public void run() {
            try {
                if (Global.INSTANCE.getRefreshDatabaseState()) {
                    warmSoon(WARM_DELAY_MS);
                    return;
                }
                List old = songCache;
                if (old == null) {
                    lists();
                    AlbumArtist.warm();
                    MetaCache.warm();
                    Schema.backfill();
                    return;
                }
                if (System.currentTimeMillis() - songCacheAt < CACHE_TTL_MS) return;
                Y1Repository repo = Y1Application.Companion.getY1Repository();
                if (repo == null) return;
                int gen;
                synchronized (SONGS) { gen = songGen; }
                List fresh = repo.getSongsSync(0);
                if (fresh == null) return;
                boolean same = fresh.equals(old);
                synchronized (SONGS) {
                    if (gen != songGen) return;
                    if (same) songCacheAt = System.currentTimeMillis();
                }
                // a write nobody reported: everything built off the old list goes with it
                if (!same) Ipp.libraryChanged();
            } catch (Throwable t) {
            } finally {
                checkAsked = false;
            }
        }
    }

    // "Cache library": a signature of the library (row count, newest file date) written when a
    // pass completes. It lives in the prefs, not in the caches, so "Clear cache" must knock it
    // out explicitly or the button reports "already cached" for caches just wiped.

    private static final String CACHE_N = "cache_n";
    private static final String CACHE_T = "cache_t";
    private static final String CACHE_M = "cache_m";
    private static final String CACHE_V = "cache_v";

    /**
     * Bump whenever the pass starts filling something new, or an unchanged library reports
     * "already cached" for caches that were never written.
     */
    private static final int CACHE_VERSION = 3;

    /** The categories ({@code Pick.COVERS}/{@code TAGS}) the signature vouches for, or 0. */
    private static int cachedMask(Context c, int songs, int stamp) {
        if (c == null) return 0;
        if (Prefs.getInt(c, CACHE_N, -1) != songs
                || Prefs.getInt(c, CACHE_T, -1) != stamp
                || Prefs.getInt(c, CACHE_V, 0) != CACHE_VERSION) return 0;
        return Prefs.getInt(c, CACHE_M, 0);
    }

    /** True while the stored signature still describes this library, for all of these categories. */
    public static boolean cached(Context c, int songs, int stamp, int mask) {
        return mask != 0 && (cachedMask(c, songs, stamp) & mask) == mask;
    }

    /** A pass finished: its categories are added while the library is the same one. */
    public static void noteCached(Context c, int songs, int stamp, int mask) {
        if (c == null) return;
        int had = cachedMask(c, songs, stamp);
        Prefs.setInt(c, CACHE_N, songs);
        Prefs.setInt(c, CACHE_T, stamp);
        Prefs.setInt(c, CACHE_V, CACHE_VERSION);
        Prefs.setInt(c, CACHE_M, had | mask);
    }

    /** Called from SettingActivity's "Clear cache": everything the signature vouched for is gone. */
    public static void cacheCleared() {
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) return;
        Prefs.setInt(c, CACHE_N, -1);
        Prefs.setInt(c, CACHE_T, -1);
        Prefs.setInt(c, CACHE_V, 0);
        Prefs.setInt(c, CACHE_M, 0);
    }

    /** Only some categories were cleared: the signature keeps vouching for the rest. */
    public static void cacheCleared(int mask) {
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) return;
        Prefs.setInt(c, CACHE_M, Prefs.getInt(c, CACHE_M, 0) & ~mask);
    }

    public static List allSongs() {
        List c = songCache;
        if (c == null) return readSongs();
        if (!checkAsked && System.currentTimeMillis() - songCacheAt >= CACHE_TTL_MS) {
            checkAsked = true;
            warmSoon(0L);
        }
        return c;
    }

    // The canonical key of the per-album caches. Genres puts PLAIN names in the same adapter, so
    // without this one album is cached twice. A plain name is encoded only when it lives in exactly
    // one folder; a shared name has no single right entry and keeps its own.
    private static HashMap keyMemo;

    public static String coverKey(String name) {
        if (name == null || name.length() == 0 || isEnc(name) || isAllSongs(name)) return name;
        HashMap m = keyMemo;
        if (m == null) {
            List all = allSongs();
            if (all == null) return name;
            LinkedHashMap byName = foldersOf(all);
            m = new HashMap();
            Iterator it = byName.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry e = (Map.Entry) it.next();
                Object v = e.getValue();
                if (!(v instanceof LinkedHashSet)) continue;
                LinkedHashSet set = (LinkedHashSet) v;
                if (set.size() != 1) continue;
                String plain = (String) e.getKey();
                m.put(plain, enc(plain, (String) set.iterator().next()));
            }
            keyMemo = m;
        }
        Object k = m.get(name);
        return k == null ? name : (String) k;
    }

    private static List foldersFor;
    private static LinkedHashMap foldersMemo;

    /** {@link #foldersByName} of the whole library, kept for as long as the list object lives. Read only. */
    private static LinkedHashMap foldersOf(List all) {
        synchronized (SONGS) {
            if (foldersFor == all && foldersMemo != null) return foldersMemo;
        }
        LinkedHashMap m = foldersByName(all);
        synchronized (SONGS) {
            foldersFor = all;
            foldersMemo = m;
        }
        return m;
    }

    private static LinkedHashMap foldersByName(List songs) {
        LinkedHashMap map = new LinkedHashMap();
        for (int i = 0; i < songs.size(); i++) {
            Song s = (Song) songs.get(i);
            String key = s.getAlbum() == null ? "" : s.getAlbum();
            Object o = map.get(key);
            LinkedHashSet set = (o == null) ? null : (LinkedHashSet) o;
            if (set == null) { set = new LinkedHashSet(); map.put(key, set); }
            set.add(albumFolder(s.getPath()));
        }
        return map;
    }

    /** The Albums screen's list: the split main view, or one artist's albums (ipp_artist). */
    public static List listForView(List names, Activity activity) {
        String artist = null;
        if (activity != null) {
            Intent it = activity.getIntent();
            if (it != null) artist = it.getStringExtra("ipp_artist");
        }
        scope = artist;
        artistList = artist != null;
        if (artist == null) return split(names);

        if (names == null) return names;
        // Not getSongsByArtist: the row is a name derived from a tag, and only forMenu matches
        // by the test the row was drawn by.
        List asongs = Artists.forMenu(artist, null);
        if (asongs == null || asongs.isEmpty()) return new ArrayList();
        LinkedHashMap byName = foldersByName(asongs);
        ArrayList out = new ArrayList();
        if (!asongs.isEmpty()) out.add(allMark(artist));   // first row = "Show all songs"
        for (int i = 0; i < names.size(); i++) {
            String name = (String) names.get(i);
            Object o = byName.get(name == null ? "" : name);
            if (o == null) continue;
            ArrayList folders = new ArrayList((LinkedHashSet) o);
            Collections.sort(folders, STR_CMP);
            for (int j = 0; j < folders.size(); j++) out.add(enc(name, (String) folders.get(j)));
        }
        return byYear(out);
    }

    /**
     * Order by year per PHYSICAL album — after the split, since stock sorts the plain names and
     * same-named albums would share one year. The "Show all songs" row stays on top.
     */
    private static List byYear(ArrayList out) {
        try {
            int st = albumSortValue();
            boolean desc = st == Y1Repository.SortAlbumType.Date_Desc.getType();
            if (!desc && st != Y1Repository.SortAlbumType.Date_Asc.getType()) return out;
            int from = (!out.isEmpty() && isAllSongs((String) out.get(0))) ? 1 : 0;
            List tail = out.subList(from, out.size());   // a view: sorting it sorts `out`
            YearCache.warm(tail);
            Collections.sort(tail, new YearComparator(desc));
        } catch (Throwable t) {
        }
        return out;
    }

    /**
     * Paint the "Show all songs" row; true = ours, skip the album lookup. The look is set on EVERY
     * row, since rows are recycled. A GONE artist line centres the label (packed chain).
     */
    public static boolean allSongsRow(Album album, ImageView cover, TextView artistTv, TextView albumTv) {
        boolean mine = album != null && (isAllSongs(album.getName()) || isGenreAll(album.getName()));
        if (albumTv != null) {
            // 22sp = the Shuffle row's size; 20sp is item_album.xml's own
            albumTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, mine ? 22f : 20f);
        }
        if (artistTv != null) artistTv.setVisibility(mine ? View.GONE : View.VISIBLE);
        if (!mine) {
            Icons.reset(cover);
            pendingIcon = null;
            return false;
        }
        String label = "Show all songs";
        Context c = Y1Application.Companion.getAppContext();
        if (c != null) label = c.getString(R.string.ipp_show_all_songs);
        if (albumTv != null) albumTv.setText(label);
        if (cover != null) cover.setImageResource(R.mipmap.ipp_show_all_songs);
        pendingIcon = cover;
        return true;
    }

    /**
     * The icon parked by {@link #allSongsRow}, coloured at the END of getView, once the row's text
     * colour exists. A plain static is enough: getView is sequential on the UI thread.
     */
    private static ImageView pendingIcon;

    public static void tintAllSongsRow(TextView albumTv) {
        ImageView iv = pendingIcon;
        pendingIcon = null;
        if (iv == null || albumTv == null) return;
        Icons.menu(iv, albumTv.getCurrentTextColor());
    }

    // An artist's album list keeps a sort of its own. Which one applies is noted from the SCREEN
    // (noteAlbumList) — `scope` is armed one list build too late for the write.
    private static final String ARTIST_SORT = "artist_album_sort";

    private static boolean artistList;

    private static boolean artistView(Activity a) {
        try {
            return a != null && a.getIntent() != null
                    && a.getIntent().getStringExtra("ipp_artist") != null;
        } catch (Throwable t) {
            return false;
        }
    }

    /** Injected at the top of AlbumsActivity.getAlbumListBySort. */
    public static void noteAlbumList(Activity a) {
        artistList = artistView(a);
    }

    /** Replaces {@code SharedPreferencesUtils.getSortAlbum()} in AlbumsActivity.initView. */
    public static int albumSort(Activity a) {
        noteAlbumList(a);
        return albumSortValue();
    }

    /** The stored sort of a screen the caller has in hand (Alpha, deciding letters vs years). */
    public static int albumSortFor(Activity a) {
        return sortValue(artistView(a));
    }

    /** The stored sort of the list being built right now. */
    public static int albumSortValue() {
        return sortValue(artistList);
    }

    private static int sortValue(boolean artist) {
        if (!artist) return SharedPreferencesUtils.INSTANCE.getSortAlbum();
        Context c = Y1Application.Companion.getAppContext();
        int def = Y1Repository.SortAlbumType.A_Z.getType();
        return (c == null) ? def : Prefs.getInt(c, ARTIST_SORT, def);
    }

    /** Replaces the stock {@code setSortAlbum} in Y1Repository.getAlbumsBySort. */
    public static void noteAlbumSort(int type) {
        if (artistList) {
            Context c = Y1Application.Companion.getAppContext();
            if (c != null) Prefs.setInt(c, ARTIST_SORT, type);
            return;
        }
        SharedPreferencesUtils.INSTANCE.setSortAlbum(type);
    }

    // The flat "Show all songs" list keeps its own song sort, or "Subdiv. by Album" picked there
    // becomes the sort of every real album.
    private static final String ALL_SORT = "all_sort";

    /** The sort of the song list on screen, recorded by {@link #noteSort} on every build. */
    private static int songSort = -1;

    /** Which list that is — the encoded album key, or a marker. */
    private static String listKey;

    public static int songListSort() {
        return songSort;
    }

    /**
     * The level the queue re-opens (see {@link #restore}), checked against the screen's TITLE: the
     * album list's Shuffle row plays too, and then the last song list built is someone else's.
     */
    public static String levelFor(String title) {
        String k = listKey;
        if (k == null || title == null) return null;
        return title.equals(realName(k)) ? k : null;
    }

    /**
     * Re-open that level in a fresh AlbumsActivity, on the playing track. {@code i} is a copy of
     * the screen's own Intent, which carries the artist scope.
     */
    public static void restore(Intent i, String key, String focusPath) {
        if (i == null || key == null) return;
        i.putExtra(EXTRA_OPEN, key);
        pendingFocus = focusPath;
        // The top button goes back to the player underneath, not up to the album list.
        closeOnBack = true;
        returnAlbum = null;
        returnFocus = null;
    }

    /** Replaces the stock {@code setSortAlbumSong} in getSongsByAlbum. */
    public static void noteSort(String album, Y1Repository.SongSortType type) {
        if (type == null) return;
        int v = type.getType();
        songSort = v;
        listKey = album;
        if (isAllSongs(album)) {
            Context c = Y1Application.Companion.getAppContext();
            if (c != null) Prefs.setInt(c, ALL_SORT, v);
            return;
        }
        SharedPreferencesUtils.INSTANCE.setSortAlbumSong(v);
    }

    /** Replaces the stock {@code SongSortType.fromType(getSortAlbumSong())} in AlbumsActivity.confirm. */
    public static Y1Repository.SongSortType sortFor(String album) {
        int def = SharedPreferencesUtils.INSTANCE.getSortAlbumSong();
        if (isAllSongs(album)) {
            Context c = Y1Application.Companion.getAppContext();
            int v = (c == null) ? def : Prefs.getInt(c, ALL_SORT, def);
            return Y1Repository.SongSortType.Companion.fromType(v);
        }
        // A real album never offers "Subdiv. by Album": an Album value is a leftover.
        if (def == Y1Repository.SongSortType.Album.getType()) {
            return Y1Repository.SongSortType.Track_Number;
        }
        return Y1Repository.SongSortType.Companion.fromType(def);
    }

    /**
     * Refill the song menu before every show(): one dialog serves a real album and the flat
     * "Show all songs" list, which offer different entries.
     */
    public static void songMenu(SubMenuDialog dlg, Activity a, String albumName, MyBaseAdapter songs) {
        if (dlg == null || a == null) return;
        songDlg = dlg;
        boolean all = isAllSongs(albumName);
        ArrayList l = new ArrayList();
        l.add(a.getString(R.string.song_menu_sort_by_songname));
        l.add(a.getString(R.string.song_menu_sort_by_filename));
        if (all) l.add(a.getString(R.string.song_menu_sort_by_album));
        else if (Prefs.trackSortEnabled()) l.add(a.getString(R.string.ipp_sort_by_track));
        l.add(a.getString(R.string.music_multi_select));
        l.add(a.getString(R.string.all_select));
        l.add(a.getString(R.string.music_delete_file));
        l.add(a.getString(R.string.ipp_queue_add));
        // Each "open" entry only where it does not lead to where we already are.
        if (!all && Artists.canOpen(songs)) l.add(a.getString(R.string.ipp_open_artist));
        if (all) l.add(a.getString(R.string.ipp_open_album));
        else l.add(a.getString(R.string.ipp_set_thumb));
        dlg.setList(l);
        dlg.addPlaylistsToOptions();   // setList dropped them, and it refreshes the playlist set
    }

    /** The dialog {@link #songMenu} last built, so the artist submenu can dismiss it on its pick. */
    private static SubMenuDialog songDlg;

    /** "Open artist" on a song row of this screen — see {@link Artists#openFrom}. */
    public static boolean openArtistFrom(Activity a, MyBaseAdapter songs) {
        return Artists.openFrom(a, songDlg, songs);
    }

    // "Open album". The song to land on is a static, not an Intent extra: "Show all songs" swaps
    // its own list without a new Activity. Consumed by the first focus() after the songs load.
    private static final String EXTRA_OPEN = "ipp_open_album";
    private static String pendingFocus;

    // The top button goes back to where the album was opened FROM, on the same row.
    private static boolean closeOnBack;      // opened from another screen -> just finish()
    private static String returnAlbum;       // opened from this screen's flat list -> restore it
    private static String returnFocus;

    /** Note the picked song and return the encoded key of its album, or null. */
    public static String openTarget(MyBaseAdapter songs) {
        if (songs == null) return null;
        Object o = null;
        List sel = songs.getSelectedIndexList();
        if (sel != null && !sel.isEmpty()) o = songs.getItem(((Integer) sel.get(0)).intValue());
        if (o == null) o = songs.getItem(songs.getPosition());
        if (!(o instanceof Song)) return null;
        Song s = (Song) o;
        String key = keyOf(s);
        if (key == null) return null;
        pendingFocus = s.getPath();
        closeOnBack = false;
        returnAlbum = null;
        returnFocus = null;
        // shown WHOLE: a leftover artist scope would hide the other artists
        scope = null;
        if (sel != null) sel.clear();
        return key;
    }

    /**
     * Open an album by NAME (Search) in the Albums screen's own song list. A name shared by several
     * folders opens merged — one search row per distinct name.
     */
    public static void openAlbumName(Activity a, String name) {
        if (a == null || name == null || name.length() == 0) return;
        openKey(a, coverKey(name), null);
    }

    /** "Open album" on a search result: the song's physical album, landing on the song. */
    public static void openAlbumOfSong(Activity a, Song s) {
        if (a == null || s == null) return;
        openKey(a, keyOf(s), s.getPath());
    }

    private static void openKey(Activity a, String key, String focusPath) {
        if (key == null || key.length() == 0) return;
        pendingFocus = focusPath;
        closeOnBack = true;
        returnAlbum = null;
        returnFocus = null;
        scope = null;
        Intent i = new Intent(a, com.innioasis.music.AlbumsActivity.class);
        i.putExtra(EXTRA_OPEN, key);
        a.startActivity(i);
    }

    /** "Open album" from another screen: the Albums screen opens straight into it. */
    public static void openAlbumFrom(Activity a, MyBaseAdapter songs) {
        if (a == null) return;
        String key = openTarget(songs);
        if (key == null) return;
        closeOnBack = true;
        Intent i = new Intent(a, com.innioasis.music.AlbumsActivity.class);
        i.putExtra(EXTRA_OPEN, key);
        a.startActivity(i);
    }

    /** Opened from this screen's flat list: remember it and the row to come back to. */
    public static void noteReturn(String previousAlbum) {
        returnAlbum = previousAlbum;
        returnFocus = pendingFocus;
    }

    /** Top button: true when the Albums screen simply closes, having been opened for one album. */
    public static boolean backClose() {
        boolean b = closeOnBack;
        closeOnBack = false;
        return b;
    }

    /** Top button: the list to restore instead of going up to the album list, or null. */
    public static String backAlbum() {
        String a = returnAlbum;
        if (a == null) return null;
        returnAlbum = null;
        pendingFocus = returnFocus;
        returnFocus = null;
        return a;
    }

    /** AlbumsActivity.initView: the album to jump straight into, or null for a normal open. */
    public static String openRequest(Activity a) {
        try {
            String key = a == null || a.getIntent() == null
                    ? null : a.getIntent().getStringExtra(EXTRA_OPEN);
            if (key == null) pendingFocus = null;   // a normal open must not inherit a stale pick
            return key;
        } catch (Throwable t) {
            return null;
        }
    }

    /** After the album's song list has been filled: put the cursor on the song we came for. */
    public static void focus(MyBaseAdapter songs, ListView lv) {
        String p = pendingFocus;
        pendingFocus = null;
        if (p == null || songs == null) return;
        for (int i = 0; i < songs.getCount(); i++) {
            Object o = songs.getItem(i);
            if (o instanceof Song && p.equals(((Song) o).getPath())) {
                if (lv == null) {
                    songs.setPosition(i);
                } else {
                    Follow.land(songs, lv, i);
                }
                return;
            }
        }
    }

    // Where the album list stood before an album was opened: stock's way back parks the selected
    // row at the TOP. Consumed on use and guarded by the selected row ("Open album" notes nothing).
    private static int listFirst = -1;
    private static int listTop;
    private static int listPos = -1;

    /** {@code AlbumsActivity.confirm}, just before an album is opened from the album list. */
    public static void noteListScroll(ListView lv, Object albums) {
        listFirst = -1;
        try {
            if (lv == null || !(albums instanceof MyBaseAdapter)) return;
            View top = lv.getChildAt(0);
            listTop = top == null ? 0 : top.getTop();       // absolute: the album list has no padding
            listFirst = lv.getFirstVisiblePosition();
            listPos = ((MyBaseAdapter) albums).getPosition();
        } catch (Throwable t) {
            listFirst = -1;
        }
    }

    /** In place of stock's {@code Other.gotoAdapter(lv, a, -1)}: the album list as it was left. */
    public static void restoreList(ListView lv, MyBaseAdapter albums) {
        if (lv == null || albums == null) return;
        lv.setAdapter(albums);
        int pos = albums.getPosition();
        int first = listFirst;
        listFirst = -1;
        if (first >= 0 && first < albums.getCount() && listPos == pos) {
            // Through Head: the song list's padding is about to drop away underneath.
            Head.restore(lv, first, listTop);
        } else {
            lv.setSelection(pos);
        }
    }

    /** The album-row menu, rebuilt per show(): "Reset thumbnail" only on a pinned album. */
    public static void albumMenu(SubMenuDialog dlg, Activity a, MyBaseAdapter albums) {
        if (dlg == null || a == null) return;
        ArrayList l = new ArrayList();
        l.add(a.getString(R.string.song_menu_sort_by));
        l.add(a.getString(R.string.music_multi_select));
        l.add(a.getString(R.string.all_select));
        l.add(a.getString(R.string.album_menu_delete));
        l.add(a.getString(R.string.ipp_queue_add));
        if (Art.hasPick(Art.albumKey(albums))) l.add(a.getString(R.string.ipp_reset_thumb));
        dlg.setList(l);
        dlg.addPlaylistsToOptions();
    }

    /**
     * Main-view split: EVERY album is encoded, one entry per folder — so every album goes through
     * {@link #songs}/{@link #songsSync} and gets disc grouping.
     */
    public static List split(List names) {
        if (names == null) return names;
        List all = allSongs();
        if (all == null) return names;
        LinkedHashMap byName = foldersOf(all);
        ArrayList out = new ArrayList();
        for (int i = 0; i < names.size(); i++) {
            String name = (String) names.get(i);
            Object o = byName.get(name == null ? "" : name);
            LinkedHashSet set = (o == null) ? null : (LinkedHashSet) o;
            if (set == null || set.isEmpty()) { out.add(name); continue; }
            ArrayList folders = new ArrayList(set);
            Collections.sort(folders, STR_CMP);
            for (int j = 0; j < folders.size(); j++) out.add(enc(name, (String) folders.get(j)));
        }
        return byYear(out);
    }

    /** The same split for the Search results, keeping the query's own order. */
    public static List splitAlbums(List albums) {
        if (albums == null) return albums;
        List all = allSongs();
        if (all == null) return albums;
        LinkedHashMap byName = foldersOf(all);
        ArrayList out = new ArrayList();
        for (int i = 0; i < albums.size(); i++) {
            Album a = (Album) albums.get(i);
            if (a == null) continue;
            String name = a.getName() == null ? "" : a.getName();
            Object o = byName.get(name);
            LinkedHashSet set = (o == null) ? null : (LinkedHashSet) o;
            if (set == null || set.isEmpty()) { out.add(a); continue; }
            ArrayList folders = new ArrayList(set);
            Collections.sort(folders, STR_CMP);
            for (int j = 0; j < folders.size(); j++) {
                out.add(new Album(enc(name, (String) folders.get(j)), a.getArtist(), "", null));
            }
        }
        return out;
    }

    /**
     * The songs behind an album row that is not the Albums screen's own — an encoded key or a
     * plain name, in path order (so the first is the album's representative). Never null.
     */
    public static List songsOf(String key) {
        ArrayList out = new ArrayList();
        List all = allSongs();
        if (all == null || key == null) return out;
        String name = realName(key);
        String folder = isEnc(key) ? folderOf(key) : null;
        for (int i = 0; i < all.size(); i++) {
            Song s = (Song) all.get(i);
            if (s == null || !eq(s.getAlbum(), name)) continue;
            if (folder != null && !eq(albumFolder(s.getPath()), folder)) continue;
            out.add(s);
        }
        Collections.sort(out, PATH_CMP);
        return out;
    }

    private static final Comparator STR_CMP = new StrCmp();
    private static final class StrCmp implements Comparator {
        public int compare(Object a, Object b) {
            return ((String) a).toLowerCase(Locale.ROOT).compareTo(((String) b).toLowerCase(Locale.ROOT));
        }
    }

    private static ArrayList matchAlbum(List all, String name, String folder) {
        ArrayList matched = new ArrayList();
        for (int i = 0; i < all.size(); i++) {
            Song s = (Song) all.get(i);
            if (eq(s.getAlbum(), name) && eq(albumFolder(s.getPath()), folder)) matched.add(s);
        }
        return matched;
    }

    /**
     * The artist's "Show all songs" list. Never null — that falls through to the stock query.
     * Track_Number becomes Album: the stock artist query throws on it.
     */
    private static List artistSongs(String artist, Y1Repository.SongSortType sortType) {
        Y1Repository repo = Y1Application.Companion.getY1Repository();
        if (repo == null) return new ArrayList();
        Y1Repository.SongSortType t = sortType;
        if (t == Y1Repository.SongSortType.Track_Number) t = Y1Repository.SongSortType.Album;
        List l = repo.getSongsByArtist(artist, t);
        return l == null ? new ArrayList() : l;
    }

    // An album opened from an artist shows only that artist's tracks; armed by listForView. Only
    // getSongsByAlbum is scoped — the Sync query backs covers, playlists and delete, which are
    // about the whole album.
    private static String scope;

    /** better-Y → "Show songs only by the selected artist inside Artists → Album". */
    public static final String KEY_SCOPE = "artist_scope";

    private static boolean scopeEnabled() {
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) return false;
        return Prefs.on(c, KEY_SCOPE);
    }

    private static ArrayList onlyScoped(ArrayList matched) {
        String a = scope;
        if (a == null || matched.isEmpty() || !scopeEnabled()) return matched;
        // opened from Album Artists: the album is the unit there, guest tracks and all
        if (AlbumArtists.is(a)) return matched;
        ArrayList out = new ArrayList();
        for (int i = 0; i < matched.size(); i++) {
            Song s = (Song) matched.get(i);
            if (Artists.has(s.getArtist(), a)) out.add(s);
        }
        // never an empty album
        return out.isEmpty() ? matched : out;
    }

    /**
     * Whether the screen shows the flat "Show all songs" (Disc draws no dividers there). Noted from
     * {@code switchSongSortType}, NOT from {@link #songs}: YearCache calls that for other albums.
     */
    private static boolean allList;

    public static boolean isAllSongsList() {
        return allList;
    }

    /** {@code AlbumsActivity.switchSongSortType}: which of the two lists is being built. */
    public static void noteListAlbum(String album) {
        allList = isAllSongs(album);
    }

    /** getSongsByAlbum redirect: encoded album -> songs of that (name,folder), sorted per type; else null. */
    public static List songs(String album, Y1Repository.SongSortType sortType) {
        if (isAllSongs(album)) return artistSongs(allSongsArtist(album), sortType);
        if (!isEnc(album)) return null;
        List all = allSongs();
        if (all == null) return new ArrayList();
        ArrayList matched = onlyScoped(matchAlbum(all, realName(album), folderOf(album)));
        List base;
        if (sortType == Y1Repository.SongSortType.Track_Number) {
            Collections.sort(matched, new SongCmp(Y1Repository.SongSortType.FileName_A_To_Z));
            base = Prefs.trackSortEnabled() ? TrackCache.sorted(matched) : matched;
        } else {
            Collections.sort(matched, new SongCmp(sortType));
            base = matched;
        }
        return byDisc(base);
    }

    /**
     * Group by disc on top of the requested order (stable sort). {@code Disc} draws dividers only
     * for a list contiguous by disc, which no ordinary sort gives for record sides sharing a folder.
     * Both Albums and Genres must apply it.
     */
    public static List byDisc(List songs) {
        if (songs == null || songs.size() < 2) return songs;
        ArrayList out = new ArrayList(songs);
        Collections.sort(out, DISC_CMP);
        return out;
    }

    private static final Comparator DISC_CMP = new DiscCmp();
    private static final class DiscCmp implements Comparator {
        public int compare(Object a, Object b) {
            int da = discOf(((Song) a).getPath());
            int db = discOf(((Song) b).getPath());
            return da < db ? -1 : (da > db ? 1 : 0);
        }
    }

    /** getSongsByAlbumSync redirect: encoded album -> songs of that (name,folder)[,genre]; else null. */
    public static List songsSync(Album album, int isAudiobook, Genre genre) {
        if (album == null) return null;
        // A query with a genre comes only from the Genres screen.
        Genres.noteList(album, genre);
        // the genre's "Show all songs": path order, so it reads album by album
        if (isGenreAll(album.getName())) {
            List all = allSongs();
            if (all == null) return new ArrayList();
            String g = album.getName().substring(1);
            ArrayList out = new ArrayList();
            for (int i = 0; i < all.size(); i++) {
                Song s = (Song) all.get(i);
                if (s != null && GenreSplit.has(s.getGenre(), g)) out.add(s);
            }
            Collections.sort(out, PATH_CMP);
            return out;
        }
        // the artist's "Show all songs" inside Genres: within the genre, if there is one
        if (isAllSongs(album.getName())) {
            List all = allSongs();
            if (all == null) return new ArrayList();
            String a = album.getName().substring(1);
            String gname = genre == null ? null : genre.getName();
            ArrayList out = new ArrayList();
            for (int i = 0; i < all.size(); i++) {
                Song s = (Song) all.get(i);
                if (s == null || !Artists.has(s.getArtist(), a)) continue;
                if (gname != null && !GenreSplit.has(s.getGenre(), gname)) continue;
                out.add(s);
            }
            Collections.sort(out, PATH_CMP);
            return out;
        }
        if (!isEnc(album.getName())) return null;
        List all = allSongs();
        if (all == null) return new ArrayList();
        String name = realName(album.getName());
        String folder = folderOf(album.getName());
        String gname = genre == null ? null : genre.getName();
        ArrayList matched = new ArrayList();
        for (int i = 0; i < all.size(); i++) {
            Song s = (Song) all.get(i);
            if (!eq(s.getAlbum(), name) || !eq(albumFolder(s.getPath()), folder)) continue;
            if (gname != null && !GenreSplit.has(s.getGenre(), gname)) continue;
            matched.add(s);
        }
        // path order: the representative (first) song is from CD1
        Collections.sort(matched, PATH_CMP);
        return matched;
    }

    private static final Comparator PATH_CMP = new PathCmp();
    private static final class PathCmp implements Comparator {
        public int compare(Object a, Object b) {
            String x = ((Song) a).getPath();
            String y = ((Song) b).getPath();
            return (x == null ? "" : x).compareTo(y == null ? "" : y);
        }
    }

    /** Mirrors the stock ORDER BY used by getSongsByAlbum per sort type. */
    private static final class SongCmp implements Comparator {
        private final Y1Repository.SongSortType type;
        SongCmp(Y1Repository.SongSortType type) { this.type = type; }
        public int compare(Object oa, Object ob) {
            Song a = (Song) oa;
            Song b = (Song) ob;
            if (type == Y1Repository.SongSortType.Time_Asc) return cmpLong(a.getFileDate(), b.getFileDate());
            if (type == Y1Repository.SongSortType.Time_Desc) return -cmpLong(a.getFileDate(), b.getFileDate());
            if (type == Y1Repository.SongSortType.SongName_A_To_Z) return cmpStr(a.getPinyinSongName(), b.getPinyinSongName());
            if (type == Y1Repository.SongSortType.SongName_Z_To_A) return -cmpStr(a.getPinyinSongName(), b.getPinyinSongName());
            if (type == Y1Repository.SongSortType.Album) return cmpStr(a.getPinyinAlbum(), b.getPinyinAlbum());
            if (type == Y1Repository.SongSortType.FileName_Z_To_A) return -cmpStr(a.getPinyinName(), b.getPinyinName());
            return cmpStr(a.getPinyinName(), b.getPinyinName());
        }
    }

    private static int cmpStr(String a, String b) {
        String x = a == null ? "" : a.toLowerCase(Locale.ROOT);
        String y = b == null ? "" : b.toLowerCase(Locale.ROOT);
        return x.compareTo(y);
    }

    private static int cmpLong(long a, long b) { return a < b ? -1 : (a > b ? 1 : 0); }
}
