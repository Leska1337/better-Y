package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.SystemClock;
import android.util.TypedValue;
import android.view.View;
import android.widget.ImageView;
import androidx.recyclerview.widget.RecyclerView;
import android.widget.TextView;
import android.widget.Toast;
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

    /** {@link #keyOf} for a pass over many songs: {@code byDir} keeps the folder per directory. */
    public static String keyOf(Song s, HashMap byDir) {
        if (s == null) return null;
        String album = s.getAlbum() == null ? "" : s.getAlbum();
        return enc(album, albumFolder(s.getPath(), byDir));
    }

    /** {@link #albumFolder} once per directory: the songs of one directory share the answer. */
    static String albumFolder(String path, HashMap byDir) {
        String dir = trackFolder(path);
        String folder = (String) byDir.get(dir);
        if (folder == null) {
            folder = albumFolder(path);
            byDir.put(dir, folder);
        }
        return folder;
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

    // The token may sit anywhere in the name ("CD2 (Bonus disk)"), but as a word of its own and
    // with a disc-sized number: a catalogue number such as "UICD-3019" is not disc 3019.
    private static final Pattern CD_PAT =
            Pattern.compile("(?<![\\p{L}\\p{N}])(cd|disc|disk|диск)[ ._-]?(\\d{1,2})(?!\\d)");

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
    /** {@link #tableSig} taken with the list: the TTL check compares it, never the rows. */
    private static String songSig;
    private static final Object SONGS = new Object();
    private static final long CACHE_TTL_MS = 600000L;
    private static final long WARM_DELAY_MS = 2000L;
    private static Handler warmer;
    private static final Runnable WARM = new Warm();

    /** Drop the cached library. Called once per file during a scan, so it must stay trivial. */
    public static void invalidate() {
        synchronized (SONGS) {
            if (Thread.currentThread() != scanThread) foreign++;
            if (songCache != null) {
                songPrev = songCache;
                prevAt = songCacheAt;
                prevSig = songSig;
                sortedPrev = sorted;
                sortedPrevType = sortedType;
            }
            songCache = null;
            songCacheAt = 0L;
            songSig = null;
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
        String sig = tableSig();
        List all = null;
        // a tag write during the read moves a row (INSERT OR REPLACE): read again, not stock's
        // query — that one is ~20 s and another copy of the library in a heap that holds two already
        for (int i = 0; i < 3 && all == null && order != null; i++) {
            if (i > 0) sig = tableSig();
            all = readTable((Y1Repository.SongSortType) order, sig);
        }
        if (all == null) all = repo.getSongsSync(0);
        if (order != orderNow()) order = null;
        Diag.slow("library read", t0);
        if (all == null) return null;
        List read = all;
        synchronized (SONGS) {
            if (gen != songGen) return all;
            if (songCache != null) return songCache;
            if (songPrev != null && songPrev.equals(all)) all = songPrev;
            songPrev = null;
            sortedPrev = null;
            // Kept only when no write came during the read (songGen): read while a scan runs, it is
            // the table, and stays it if the scan writes nothing — keep() hands it back then.
            if (all != markList) markList = scanThread != null ? all : null;
            songOrder = order;
            songCache = all;
            songCacheAt = System.currentTimeMillis();
            songSig = sig;
        }
        Scan.loaded(550);
        if (all == read) {
            share(all);
            Scan.loaded(580);
            reserve();
        }
        Scan.loaded(670);
        return all;
    }

    /** Rows per portion: one cursor window holds ~3000 of them, and a window that fills re-runs the query. */
    private static final int PORTION = 1000;

    /**
     * {@code getSongsSync(0)} without its cost on a large library: the rows in rowid portions that
     * never fill the cursor window, then the stock order as rowids alone. The rows are built as the
     * stock DAO builds them, except that songId, which equals the path ({@link Schema}), is the
     * path's own object. Null when the table changed under the read: the caller asks stock.
     */
    private static List readTable(Y1Repository.SongSortType type, String sig) {
        String by = orderBy(type);
        if (by == null || sig == null) return null;
        Cursor c = null;
        try {
            androidx.room.RoomDatabase db = PlGrid.db();
            int n = (int) Long.parseLong(sig.substring(0, sig.indexOf('/')));
            long[] ids = new long[n];
            Song[] rows = new Song[n];
            int k = 0;
            long after = -1L;
            while (true) {
                c = db.query("select rowid as ipp_rowid, * from song where isAudiobook = 0 and rowid > "
                        + after + " order by rowid limit " + PORTION, null);
                int got = 0;
                int iName = c.getColumnIndexOrThrow("name"),
                        iPyName = c.getColumnIndexOrThrow("pinyinName"), iSong = c.getColumnIndexOrThrow("songName"),
                        iPySong = c.getColumnIndexOrThrow("pinyinSongName"), iArtist = c.getColumnIndexOrThrow("artist"),
                        iPyArtist = c.getColumnIndexOrThrow("pinyinArtist"), iAlbum = c.getColumnIndexOrThrow("album"),
                        iPyAlbum = c.getColumnIndexOrThrow("pinyinAlbum"), iGenre = c.getColumnIndexOrThrow("genre"),
                        iPyGenre = c.getColumnIndexOrThrow("pinyinGenre"), iPath = c.getColumnIndexOrThrow("path"),
                        iBook = c.getColumnIndexOrThrow("isAudiobook"), iDate = c.getColumnIndexOrThrow("date"),
                        iFile = c.getColumnIndexOrThrow("fileDate"), iLower = c.getColumnIndexOrThrow("lowerName"),
                        iLowAlbum = c.getColumnIndexOrThrow("lowAlbum");
                while (c.moveToNext()) {
                    if (k >= n) return null;
                    after = c.getLong(0);
                    String path = str(c, iPath);
                    Song s = new Song(path, str(c, iName), str(c, iPyName), str(c, iSong), str(c, iPySong),
                            str(c, iArtist), str(c, iPyArtist), str(c, iAlbum), str(c, iPyAlbum), str(c, iGenre),
                            str(c, iPyGenre), path, c.getInt(iBook), c.getLong(iDate), c.getLong(iFile),
                            str(c, iLower), str(c, iLowAlbum));
                    Schema.read(c, s);
                    ids[k] = after;
                    rows[k++] = s;
                    got++;
                }
                c.close();
                c = null;
                Scan.loaded(k * 500 / Math.max(n, 1));
                if (got < PORTION) break;
            }
            if (k != n) return null;
            c = db.query("select rowid from song where isAudiobook = 0 order by " + by, null);
            if (c.getCount() != n) return null;
            ArrayList out = new ArrayList(n);
            while (c.moveToNext()) {
                int at = java.util.Arrays.binarySearch(ids, c.getLong(0));
                if (at < 0 || rows[at] == null) return null;
                out.add(rows[at]);
                rows[at] = null;
            }
            c.close();
            c = null;
            if (!sig.equals(tableSig())) return null;
            return out;
        } catch (Throwable t) {
            Diag.note("library read in portions failed: " + t);
            return null;
        } finally {
            if (c != null) {
                try {
                    c.close();
                } catch (Throwable t) {
                }
            }
        }
    }

    private static String str(Cursor c, int i) {
        return c.isNull(i) ? null : c.getString(i);
    }

    private static final int RESERVE = 24 << 20;
    private static final int CAP = 1 << 20;
    /** Kept for good: what stops the free run under it from being handed back to the system. */
    private static byte[] cap;
    private static byte[] block;

    /**
     * Dalvik never compacts: after the read the free space is the holes of the copies dropped
     * around the live list, none big enough for a bitmap, and every large allocation then costs
     * two stop-the-world collections. A large array is grown at the top of the heap, a small one
     * laid on it and kept, and the large one let go: free memory at the very top is trimmed away,
     * under a live object it stays. On Dalvik the identity hash is the address.
     */
    private static void reserve() {
        try {
            // a field, not a local: Dalvik frees a local the moment it is last read
            block = new byte[RESERVE];
            int at = System.identityHashCode(block);
            // a try that lands lower fills an older hole the heap already has, and is let go after
            ArrayList tries = new ArrayList();
            for (int i = 0; i < 64; i++) {
                byte[] c = new byte[CAP];
                if (System.identityHashCode(c) - at > 0) {
                    cap = c;
                    Diag.note("heap reserve: " + (RESERVE >> 20) + " MB under the cap, try " + (i + 1));
                    return;
                }
                tries.add(c);
            }
            Diag.note("heap reserve: no cap above the block");
        } catch (Throwable t) {
        } finally {
            block = null;
        }
    }

    /**
     * One String object per text across the album, artist and genre fields and their lower and
     * pinyin copies: the songs of an album repeat them, and every collection pauses for as long as
     * the heap is large. Equal text only, so nothing that compares by content can tell.
     */
    private static void share(List all) {
        long t0 = SystemClock.uptimeMillis();
        HashMap seen = new HashMap();
        int bad = 0;
        for (int i = 0; i < all.size(); i++) {
            Object o = all.get(i);
            if (!(o instanceof Song)) continue;
            Song s = (Song) o;
            try {
                String v;
                if ((v = one(seen, s.getAlbum())) != null) { bad += odd(v, s.getAlbum()); s.setAlbum(v); }
                if ((v = one(seen, s.getLowAlbum())) != null) { bad += odd(v, s.getLowAlbum()); s.setLowAlbum(v); }
                if ((v = one(seen, s.getPinyinAlbum())) != null) { bad += odd(v, s.getPinyinAlbum()); s.setPinyinAlbum(v); }
                if ((v = one(seen, s.getArtist())) != null) { bad += odd(v, s.getArtist()); s.setArtist(v); }
                if ((v = one(seen, s.getPinyinArtist())) != null) { bad += odd(v, s.getPinyinArtist()); s.setPinyinArtist(v); }
                if ((v = one(seen, s.getGenre())) != null) { bad += odd(v, s.getGenre()); s.setGenre(v); }
                if ((v = one(seen, s.getPinyinGenre())) != null) { bad += odd(v, s.getPinyinGenre()); s.setPinyinGenre(v); }
                if ((v = one(seen, s.getAlbumArtist())) != null) { bad += odd(v, s.getAlbumArtist()); s.setAlbumArtist(v); }
            } catch (Throwable t) {
            }
        }
        String line = "library share: " + all.size() + " songs, " + seen.size() + " texts, "
                + bad + " odd, " + (SystemClock.uptimeMillis() - t0) + " ms";
        Diag.note(line);
    }

    private static int odd(String shared, String own) {
        return shared.equals(own) ? 0 : 1;
    }

    private static String one(HashMap seen, String v) {
        if (v == null) return null;
        String had = (String) seen.get(v);
        if (had == null) {
            seen.put(v, v);
            return v;
        }
        return had;
    }

    /**
     * The song list read on the caller's thread, now. From the end of the stock scan, before its
     * flag drops: the read is then inside the time the scan dialog is up.
     */
    public static void loadNow() {
        if (!menuShown) scanToast = true;
        try {
            boolean clean = Scan.clean();
            Scan.done();
            CoverCache.scanEnded(Scan.takeCardAway());
            keep(clean);
            lists();
            Schema.backfill();
        } catch (Throwable t) {
        } finally {
            Scan.tailEnds();
        }
    }

    // A scan that wrote nothing still invalidates (its tail inserts an empty batch), and reading the
    // table again is most of the scan's end. The list in memory when the scan began is that table.
    private static Thread scanThread;
    private static List markList;
    private static int markForeign;
    /** Invalidations from any thread but the scan's: a write the scan cannot vouch for. */
    private static int foreign;
    private static long prevAt;
    private static String prevSig;
    private static List sortedPrev;
    private static Object sortedPrevType;

    /** From the scan's first file, on its thread: what the table held as the scan began. */
    static void scanStarts() {
        synchronized (SONGS) {
            scanThread = Thread.currentThread();
            markList = songCache;
            markForeign = foreign;
        }
    }

    /**
     * The scan is over. When it wrote no row and nobody else invalidated meanwhile, the list it
     * dropped comes back as is — the very object, so whatever is memoised against it stays.
     */
    private static void keep(boolean clean) {
        synchronized (SONGS) {
            List m = markList;
            markList = null;
            scanThread = null;
            if (!clean || m == null || foreign != markForeign) return;
            if (songCache != null || songPrev != m) return;
            songCache = m;
            songCacheAt = prevAt;
            songSig = prevSig;
            sorted = sortedPrev;
            sortedType = sortedPrevType;
            songPrev = null;
            sortedPrev = null;
        }
        Diag.note("library scan: nothing written, the list in memory is kept");
    }

    /** The song list and what the first screens build from it: album folders, the All songs order. */
    private static void lists() {
        CoverCache.loadMiss();
        AlbumInfo.clear();      // the file an older build kept album rows in; nothing reads it
        List all = allSongs();
        if (all == null) return;
        foldersOf(all);
        Scan.loaded(720);
        Artists.index(all);
        Y1Repository repo = Y1Application.Companion.getY1Repository();
        if (repo == null) return;
        prepareAlbums(repo, all);
        Scan.loaded(800);
        songsIn(repo, Y1Repository.SongSortType.Companion.fromType(
                SharedPreferencesUtils.INSTANCE.getSortAllSong()));
        Scan.loaded(960);
        if (byDate(sortValue(false))) {
            HashMap index = albumSongsOf(all);
            if (index != null) YearCache.prepare(new ArrayList(index.keySet()));
        }
        synchronized (SONGS) { preparedFor = all; }
    }

    private static boolean byDate(int sort) {
        return sort == Y1Repository.SortAlbumType.Date_Asc.getType()
                || sort == Y1Repository.SortAlbumType.Date_Desc.getType();
    }

    /** The list {@link #lists} has finished building off. */
    private static List preparedFor;
    private static long bootAsked;
    /** Below the 60 s loadConfig gives the whole splash: the theme must still load. */
    private static final long BOOT_WAIT_MS = 30000L;

    /**
     * Part of the splash's wait: the library read and what is built off it, so the main menu opens
     * on a library that is ready. Not while a scan runs — its own window covers its read.
     */
    public static boolean bootReady() {
        long now = SystemClock.uptimeMillis();
        if (bootAsked == 0L) {
            bootAsked = now;
            started = true;
            if (songCache == null) warmSoon(0L);
        }
        if (bootWaitOver()) return true;
        synchronized (SONGS) {
            if (songCache != null && songCache == preparedFor) return true;
            // A scan runs on under the splash, but it holds off a read not yet begun: waiting for
            // that would be waiting for the whole scan.
            return Global.INSTANCE.getRefreshDatabaseState() && songCache == null && reader == null;
        }
    }

    /** The splash has waited its bound since it first asked. */
    public static boolean bootWaitOver() {
        return bootAsked != 0L && SystemClock.uptimeMillis() - bootAsked > BOOT_WAIT_MS;
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
    static List shared(List l) {
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

    /**
     * What a write of songs changes, in one aggregate row: their number and their paths. No rowid:
     * {@code Schema.write} stores tag columns with INSERT OR REPLACE, which gives the row a new one
     * without changing the library, and must not read as a write nobody reported. Null when the
     * database could not be asked.
     */
    private static String tableSig() {
        Cursor c = null;
        try {
            c = PlGrid.db().query("select count(*), total(length(path)), total(fileDate)"
                    + " from song where isAudiobook = 0", null);
            if (!c.moveToFirst()) return null;
            return c.getLong(0) + "/" + (long) c.getDouble(1) + "/" + (long) c.getDouble(2);
        } catch (Throwable t) {
            return null;
        } finally {
            if (c != null) {
                try {
                    c.close();
                } catch (Throwable t) {
                }
            }
        }
    }

    /** The ORDER BY of the stock {@code getSongsList} query for this sort; null for one it has not. */
    private static String orderBy(Y1Repository.SongSortType type) {
        if (type == Y1Repository.SongSortType.FileName_A_To_Z) return "lower(pinyinName)";
        if (type == Y1Repository.SongSortType.FileName_Z_To_A) return "lower(pinyinName) desc";
        if (type == Y1Repository.SongSortType.Time_Asc) return "fileDate";
        if (type == Y1Repository.SongSortType.Time_Desc) return "fileDate desc";
        if (type == Y1Repository.SongSortType.SongName_A_To_Z) return "lower(pinyinSongName) asc";
        if (type == Y1Repository.SongSortType.SongName_Z_To_A) return "lower(pinyinSongName) desc";
        if (type == Y1Repository.SongSortType.Album) return "lower(pinyinAlbum) desc";
        return null;
    }

    /**
     * That query's order with only the paths read, laid over the Song objects of the list in
     * memory — a full read with its sort is ~20 s on a large library, the paths ~3. Null whenever
     * the table and the list disagree (a row either side lacks): the caller then queries in full.
     */
    static List ordered(Y1Repository.SongSortType type) {
        String by = orderBy(type);
        List all = songCache;
        if (by == null || all == null) return null;
        Cursor c = null;
        try {
            HashMap byPath = new HashMap(all.size() * 2);
            for (int i = 0; i < all.size(); i++) {
                Object o = all.get(i);
                if (o instanceof Song) byPath.put(((Song) o).getPath(), o);
            }
            c = PlGrid.db().query("select path from song where isAudiobook = 0 order by " + by, null);
            if (c.getCount() != all.size()) return null;
            ArrayList out = new ArrayList(all.size());
            while (c.moveToNext()) {
                Object s = byPath.get(c.isNull(0) ? null : c.getString(0));
                if (s == null) return null;
                out.add(s);
            }
            return out;
        } catch (Throwable t) {
            return null;
        } finally {
            if (c != null) {
                try {
                    c.close();
                } catch (Throwable t) {
                }
            }
        }
    }

    private static List songsIn(Y1Repository repo, Y1Repository.SongSortType type) {
        // the list first, waiting for a read under way: without it ordered() has nothing to lay
        // the order over, and stock's full query ran beside the read (out of memory on 25 000)
        allSongs();
        int gen;
        List src = null;
        synchronized (SONGS) {
            if (songCache != null && type == songOrder) return songCache;
            if (sorted != null && type == sortedType) return sorted;
            Y1Repository.SongSortType pair = pairOf(type);
            if (pair != null && songCache != null && pair == songOrder) src = songCache;
            else if (pair != null && sorted != null && pair == sortedType) src = sorted;
            gen = songGen;
        }
        List l = src == null ? null : mirror(src, type);
        if (l != null) {
            synchronized (SONGS) {
                if (gen == songGen) {
                    sorted = l;
                    sortedType = type;
                }
            }
            return l;
        }
        l = ordered(type);
        if (l == null) l = shared(repo.getSongsList(type));
        synchronized (SONGS) {
            if (l != null && gen == songGen) {
                sorted = l;
                sortedType = type;
            }
        }
        return l;
    }

    // ---- the reverse of a sort in memory ----------------------------------------------------

    /** The sort whose stock query is this one's with the direction flipped; null when none is. */
    static Y1Repository.SongSortType pairOf(Y1Repository.SongSortType t) {
        if (t == Y1Repository.SongSortType.FileName_A_To_Z) return Y1Repository.SongSortType.FileName_Z_To_A;
        if (t == Y1Repository.SongSortType.FileName_Z_To_A) return Y1Repository.SongSortType.FileName_A_To_Z;
        if (t == Y1Repository.SongSortType.Time_Asc) return Y1Repository.SongSortType.Time_Desc;
        if (t == Y1Repository.SongSortType.Time_Desc) return Y1Repository.SongSortType.Time_Asc;
        if (t == Y1Repository.SongSortType.SongName_A_To_Z) return Y1Repository.SongSortType.SongName_Z_To_A;
        if (t == Y1Repository.SongSortType.SongName_Z_To_A) return Y1Repository.SongSortType.SongName_A_To_Z;
        return null;
    }

    /**
     * {@code src}, in its pair's order, reversed run by run: rows with equal keys come out of the
     * query in the same order whichever the direction, so a plain reverse would turn every such
     * run around (an album copied at once shares one fileDate). Null when there is no pair.
     */
    static List mirror(List src, Y1Repository.SongSortType type) {
        if (src == null || pairOf(type) == null) return null;
        int n = src.size();
        ArrayList out = new ArrayList(n);
        int end = n;
        while (end > 0) {
            int start = end - 1;
            while (start > 0 && sameKey((Song) src.get(start - 1), (Song) src.get(end - 1), type)) start--;
            for (int i = start; i < end; i++) out.add(src.get(i));
            end = start;
        }
        return out;
    }

    /** Equal under the query's ORDER BY: {@code lower()} of the pinyin column, or the date. */
    private static boolean sameKey(Song a, Song b, Y1Repository.SongSortType t) {
        if (t == Y1Repository.SongSortType.Time_Asc || t == Y1Repository.SongSortType.Time_Desc) {
            return a.getFileDate() == b.getFileDate();
        }
        boolean file = t == Y1Repository.SongSortType.FileName_A_To_Z || t == Y1Repository.SongSortType.FileName_Z_To_A;
        return lowerEq(file ? a.getPinyinName() : a.getPinyinSongName(),
                file ? b.getPinyinName() : b.getPinyinSongName());
    }

    /** 1 = this database's lower() folds every letter (ICU), 0 = only A-Z, -1 = not asked yet. */
    private static int unicodeLower = -1;

    /** Equal as SQLite's lower() makes them: whichever folding the database answers with. */
    static boolean lowerEq(String a, String b) {
        if (a == null || b == null) return a == b;
        if (a.length() != b.length()) return false;
        if (unicodeLower < 0) unicodeLower = askLower();
        boolean all = unicodeLower == 1;
        for (int i = 0; i < a.length(); i++) {
            char x = a.charAt(i);
            char y = b.charAt(i);
            if (x == y) continue;
            if (all) {
                if (Character.toLowerCase(x) != Character.toLowerCase(y)) return false;
            } else {
                if (x >= 'A' && x <= 'Z') x = (char) (x + 32);
                if (y >= 'A' && y <= 'Z') y = (char) (y + 32);
                if (x != y) return false;
            }
        }
        return true;
    }

    private static int askLower() {
        Cursor c = null;
        try {
            c = PlGrid.db().query("select lower('ПРИВЕТ')", null);
            if (!c.moveToFirst()) return 0;
            int r = "привет".equals(c.getString(0)) ? 1 : 0;
            return r;
        } catch (Throwable t) {
            return 0;
        } finally {
            if (c != null) {
                try {
                    c.close();
                } catch (Throwable t) {
                }
            }
        }
    }

    private static boolean started;

    /**
     * Once per launch, from the main menu: with no scan to end in {@link #loadNow}, the list is
     * read on the library thread, so that the first section opened does not wait.
     */
    public static void atStart(Activity a) {
        menuShown = true;
        if (scanToast && a != null) {
            scanToast = false;
            try {
                Toast.makeText(a, Scan.toast(a, a.getString(R.string.total_count) + Global.INSTANCE.getScanTotalCount()
                        + '\n' + a.getString(R.string.newly_added) + Global.INSTANCE.getScanNewAddedCount()
                        + '\n' + a.getString(R.string.deleted_count) + Global.INSTANCE.getScanDeletedCount()),
                        Toast.LENGTH_SHORT).show();
            } catch (Throwable t) {
            }
        }
        if (started) return;
        started = true;
        if (songCache == null) warmSoon(0L);
    }

    // Stock's scan toast is shown by the screen that showed the scan's window; a scan that ran
    // whole under the splash had none, and its toast is shown by the main menu instead.
    private static volatile boolean menuShown;
    private static volatile boolean scanToast;

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
                    Schema.backfill();
                    return;
                }
                if (System.currentTimeMillis() - songCacheAt < CACHE_TTL_MS) return;
                int gen;
                synchronized (SONGS) { gen = songGen; }
                String sig = tableSig();
                if (sig == null) return;
                boolean same;
                synchronized (SONGS) {
                    if (gen != songGen) return;
                    // no signature of its own: nothing to compare with, this one becomes it
                    same = songSig == null || sig.equals(songSig);
                    if (same) {
                        songSig = sig;
                        songCacheAt = System.currentTimeMillis();
                    }
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
    private static final int CACHE_VERSION = 4;

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

    /** The list in memory, or null; never reads. */
    static List loaded() {
        return songCache;
    }

    /** The thread reading the table now: a second asker waits for its list instead of reading too. */
    private static Thread reader;

    private static List readOnce() {
        synchronized (SONGS) {
            while (reader != null && reader != Thread.currentThread()) {
                try {
                    SONGS.wait();
                } catch (InterruptedException e) {
                    break;
                }
            }
            if (songCache != null) return songCache;
            reader = Thread.currentThread();
        }
        try {
            return readSongs();
        } finally {
            synchronized (SONGS) {
                reader = null;
                SONGS.notifyAll();
            }
        }
    }

    public static List allSongs() {
        List c = songCache;
        if (c == null) return readOnce();
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
        LinkedHashMap m = new LinkedHashMap();
        HashMap bySongs = new HashMap();
        // No string is built per song: the directory is found by its region of the path, and the
        // album key is made once per album and folder.
        Dirs dirs = new Dirs();
        HashMap folderIds = new HashMap();
        ArrayList folders = new ArrayList();      // folder id -> folder
        ArrayList pairs = new ArrayList();        // folder id -> [name, songs, name, songs...]
        for (int i = 0; i < all.size(); i++) {
            Song s = (Song) all.get(i);
            String name = s.getAlbum() == null ? "" : s.getAlbum();
            String path = s.getPath();
            int fid = dirs.find(path);
            if (fid < 0) {
                String folder = albumFolder(path);
                Object id = folderIds.get(folder);
                if (id == null) {
                    id = Integer.valueOf(folders.size());
                    folderIds.put(folder, id);
                    folders.add(folder);
                    pairs.add(new ArrayList(2));
                }
                fid = ((Integer) id).intValue();
                dirs.add(path, fid);
            }
            ArrayList here = (ArrayList) pairs.get(fid);
            ArrayList l = null;
            for (int j = 0; j < here.size(); j += 2) {
                Object n = here.get(j);
                if (n == name || n.equals(name)) { l = (ArrayList) here.get(j + 1); break; }
            }
            if (l == null) {
                l = new ArrayList();
                here.add(name);
                here.add(l);
                String folder = (String) folders.get(fid);
                Object o = m.get(name);
                LinkedHashSet set = (o == null) ? null : (LinkedHashSet) o;
                if (set == null) { set = new LinkedHashSet(); m.put(name, set); }
                set.add(folder);
                bySongs.put(enc(name, folder), l);
            }
            l.add(s);
        }
        synchronized (SONGS) {
            foldersFor = all;
            foldersMemo = m;
            albumSongsMemo = bySongs;
        }
        return m;
    }

    /** Directory of a path to an int, looked up by the path's own characters: no substring per song. */
    private static final class Dirs {
        private String[] keys = new String[4096];
        private int[] hashes = new int[4096];
        private int[] ids = new int[4096];
        int size;

        private static int end(String path) {
            return path == null ? -1 : path.lastIndexOf('/');
        }

        private static int hash(String path, int end) {
            int h = 0;
            for (int i = 0; i < end; i++) h = 31 * h + path.charAt(i);
            return h;
        }

        /** The id given to this path's directory, or -1. */
        int find(String path) {
            int end = end(path);
            if (end < 0) return -1;
            int h = hash(path, end);
            int mask = keys.length - 1;
            for (int i = h & mask; keys[i] != null; i = (i + 1) & mask) {
                String k = keys[i];
                if (hashes[i] == h && k.length() == end && path.regionMatches(0, k, 0, end)) return ids[i];
            }
            return -1;
        }

        void add(String path, int id) {
            int end = end(path);
            if (end < 0) return;
            if ((size + 1) * 2 > keys.length) grow();
            put(path.substring(0, end), hash(path, end), id);
        }

        private void put(String key, int h, int id) {
            int mask = keys.length - 1;
            int i = h & mask;
            while (keys[i] != null) i = (i + 1) & mask;
            keys[i] = key;
            hashes[i] = h;
            ids[i] = id;
            size++;
        }

        private void grow() {
            String[] k = keys;
            int[] h = hashes;
            int[] d = ids;
            keys = new String[k.length * 2];
            hashes = new int[k.length * 2];
            ids = new int[k.length * 2];
            size = 0;
            for (int i = 0; i < k.length; i++) if (k[i] != null) put(k[i], h[i], d[i]);
        }
    }

    /** Built with {@link #foldersOf}: an album's songs by name and folder, in the list's order. Read only. */
    private static HashMap albumSongsMemo;

    /** That index when it was built from this very list, else null. */
    static HashMap albumSongsOf(List all) {
        foldersOf(all);
        synchronized (SONGS) {
            return foldersFor == all ? albumSongsMemo : null;
        }
    }

    private static LinkedHashMap foldersByName(List songs) {
        LinkedHashMap map = new LinkedHashMap();
        HashMap byDir = new HashMap();
        for (int i = 0; i < songs.size(); i++) {
            Song s = (Song) songs.get(i);
            String key = s.getAlbum() == null ? "" : s.getAlbum();
            Object o = map.get(key);
            LinkedHashSet set = (o == null) ? null : (LinkedHashSet) o;
            if (set == null) { set = new LinkedHashSet(); map.put(key, set); }
            set.add(albumFolder(s.getPath(), byDir));
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
            pendingCover = cover;
            return false;
        }
        pendingCover = null;
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

    /** An album row's cover, parked the same way for {@link #blankRow}. */
    private static ImageView pendingCover;

    public static void tintAllSongsRow(TextView albumTv) {
        ImageView iv = pendingIcon;
        ImageView cover = pendingCover;
        pendingIcon = null;
        pendingCover = null;
        if (albumTv == null) return;
        if (iv != null) Icons.menu(iv, albumTv.getCurrentTextColor());
        else blankRow(cover, albumTv.getCurrentTextColor());
    }

    /** The row's read came back: stock's setImageBitmap, but a placeholder takes the label's colour. */
    public static void lateCover(ImageView iv, android.graphics.Bitmap b) {
        if (iv == null) return;
        if (b == null || b != CoverCache.rowBlank || !(iv.getParent() instanceof View)) {
            iv.setImageBitmap(b);
            return;
        }
        Rows.thumb(iv, b);
        View tv = ((View) iv.getParent()).findViewById(R.id.album_name);
        if (tv instanceof TextView) blankRow(iv, ((TextView) tv).getCurrentTextColor());
    }

    // The no-art placeholder: "Show all albums"' icon in the label's colour. A recoloured COPY, not a
    // filter on the view: a cover read later lands on this same view and would come out tinted.
    private static final HashMap BLANKS = new HashMap();
    private static android.graphics.Bitmap blanksOf;
    private static android.graphics.Bitmap blankIcon;

    private static void blankRow(ImageView cover, int color) {
        try {
            android.graphics.Bitmap blank = CoverCache.rowBlank;
            if (cover == null || blank == null || !(cover.getDrawable() instanceof Rows.Pic)) return;
            android.graphics.Bitmap b = ((Rows.Pic) cover.getDrawable()).b;
            if (blanksOf != blank) {
                BLANKS.clear();
                blanksOf = blank;
            }
            if (b != blank && !BLANKS.containsValue(b)) return;
            Integer k = Integer.valueOf(color);
            android.graphics.Bitmap t = (android.graphics.Bitmap) BLANKS.get(k);
            if (t == null) {
                // the drawing is "Show all albums"' icon, not stock's placeholder
                if (blankIcon == null) {
                    android.graphics.BitmapFactory.Options o = new android.graphics.BitmapFactory.Options();
                    o.inScaled = false;
                    blankIcon = android.graphics.BitmapFactory.decodeResource(cover.getResources(),
                            R.mipmap.ipp_show_all_albums, o);
                }
                android.graphics.Bitmap src = blankIcon != null ? blankIcon : blank;
                t = android.graphics.Bitmap.createBitmap(src.getWidth(), src.getHeight(),
                        android.graphics.Bitmap.Config.ARGB_8888);
                android.graphics.Paint p = new android.graphics.Paint(android.graphics.Paint.FILTER_BITMAP_FLAG);
                p.setColorFilter(new android.graphics.PorterDuffColorFilter(color,
                        android.graphics.PorterDuff.Mode.SRC_IN));
                new android.graphics.Canvas(t).drawBitmap(src, 0, 0, p);
                BLANKS.put(k, t);
            }
            Rows.thumb(cover, t);
        } catch (Throwable t) {
        }
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
    public static void focus(MyBaseAdapter songs, View lv) {
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
    public static void noteListScroll(View lv, Object albums) {
        listFirst = -1;
        try {
            if (lv == null || !(albums instanceof MyBaseAdapter)) return;
            int first = Lv.first(lv);
            View top = Lv.row(lv, first);
            listTop = top == null ? 0 : top.getTop();       // absolute: the album list has no padding
            listFirst = first;
            listPos = ((MyBaseAdapter) albums).getPosition();
        } catch (Throwable t) {
            listFirst = -1;
        }
    }

    /** In place of stock's {@code Other.gotoAdapter(lv, a, -1)}: the album list as it was left. */
    public static void restoreList(RecyclerView lv, MyBaseAdapter albums) {
        if (lv == null || albums == null) return;
        SongRows.set(lv, albums);
        int pos = albums.getPosition();
        int first = listFirst;
        listFirst = -1;
        if (first >= 0 && first < albums.getCount() && listPos == pos) {
            Lv.place(lv, first, listTop);
        } else {
            SongRows.select(lv, pos);
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
    // The last split, before the year sort: the same names over the same list give the same rows.
    // Weak: a library read since must not keep the old list alive.
    private static java.lang.ref.WeakReference splitFor;
    private static List splitNames;
    private static ArrayList splitOut;

    /** One row per album and folder, in the names' order; a copy the caller may sort. */
    private static ArrayList splitRows(List names, List all) {
        synchronized (SONGS) {
            if (splitFor != null && splitFor.get() == all && names.equals(splitNames)) return new ArrayList(splitOut);
        }
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
        synchronized (SONGS) {
            splitFor = new java.lang.ref.WeakReference(all);
            splitNames = new ArrayList(names);
            splitOut = new ArrayList(out);
        }
        return out;
    }

    // The album names of the stock query, by direction, for the list in memory: the query reads
    // the table those rows came from, and a write drops that list.
    private static java.lang.ref.WeakReference namesFor;
    private static boolean namesRev;
    private static List namesMemo;

    /** In place of {@code getAlbumsBySort} in AlbumsActivity: the same names and the same sort note. */
    public static List albumNames(Y1Repository r, Y1Repository.SortAlbumType t) {
        boolean rev = t == Y1Repository.SortAlbumType.Z_A;
        List all = loaded();
        List hit = null;
        synchronized (SONGS) {
            if (all != null && namesFor != null && namesFor.get() == all && namesRev == rev && namesMemo != null) {
                hit = new ArrayList(namesMemo);
            }
        }
        if (hit != null) {
            noteAlbumSort(t.getType());
            return hit;
        }
        List l = r.getAlbumsBySort(t);
        keepNames(all, rev, l);
        return l;
    }

    private static void keepNames(List all, boolean rev, List names) {
        if (all == null || names == null) return;
        synchronized (SONGS) {
            if (loaded() != all) return;
            namesFor = new java.lang.ref.WeakReference(all);
            namesRev = rev;
            namesMemo = new ArrayList(names);
        }
    }

    /** From {@link #lists}: the main Albums view's names and rows, so its first entry needs neither. */
    private static void prepareAlbums(Y1Repository repo, List all) {
        try {
            boolean rev = SharedPreferencesUtils.INSTANCE.getSortAlbum() == Y1Repository.SortAlbumType.Z_A.getType();
            List names = rev ? repo.ippSongDao().getAlbumsReverseSync(0) : repo.ippSongDao().getAlbumsSync(0);
            keepNames(all, rev, names);
            if (names != null) splitRows(names, all);
        } catch (Throwable t) {
        }
    }

    public static List split(List names) {
        if (names == null) return names;
        List all = allSongs();
        if (all == null) return names;
        ArrayList out = splitRows(names, all);
        List r = byYear(out);
        return r;
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
        if (isEnc(key)) {
            out.addAll(matchAlbum(all, name, folderOf(key)));
        } else {
            Object o = foldersOf(all).get(name == null ? "" : name);
            if (o != null) {
                Iterator it = ((LinkedHashSet) o).iterator();
                while (it.hasNext()) out.addAll(matchAlbum(all, name, (String) it.next()));
            }
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
        HashMap index = albumSongsOf(all);
        if (index != null) {
            Object l = index.get(enc(name == null ? "" : name, folder == null ? "" : folder));
            return l == null ? new ArrayList() : new ArrayList((ArrayList) l);
        }
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
        ArrayList matched = matchAlbum(all, name, folder);
        if (gname != null) {
            ArrayList in = new ArrayList();
            for (int i = 0; i < matched.size(); i++) {
                Song s = (Song) matched.get(i);
                if (GenreSplit.has(s.getGenre(), gname)) in.add(s);
            }
            matched = in;
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
