package com.innioasis.ipp;

import android.os.SystemClock;

import com.innioasis.y1.database.Song;
import com.innioasis.y1.database.SongDao;
import com.innioasis.y1.database.Y1Repository;
import com.innioasis.y1.utils.HanziToPinyin;

import com.innioasis.music.objects.Constant;
import com.innioasis.y1.Y1Application;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;

/**
 * Speeds up the stock scan ({@code Y1Repository.refreshDatabase}) through single-call injections
 * into its walk. Workers build the {@code Song}s of the files the walk will reach next, a few ahead
 * of the scan, which stays on stock's thread; whether a path is already known is answered from
 * memory. {@code fileToSong} is thread-safe only because {@code HanziToPinyin.getString} is
 * patched {@code synchronized}.
 *
 * Do NOT turn this into read-ahead into the page cache: it measured slower (15-17 s against 11 s);
 * the card is the limit, so only doing the same work sooner helps, never doing more of it.
 */
public final class Scan {

    private Scan() { }

    /**
     * Replaces the scan's {@code getSongByPathSync}; only null-ness is read. A wrong "unknown"
     * re-reads a file harmlessly, a wrong "known" drops it from the library — so the set is the
     * table itself, both halves, reloaded after a {@link #GAP_MS} pause (a new scan).
     */
    public static Song known(String path) {
        long lt = SystemClock.uptimeMillis();
        if (!marked) mark();
        boolean in = inDb(path);
        meet(path);
        count();
        labKnown += SystemClock.uptimeMillis() - lt;
        return in ? MARKER : null;
    }

    // Whether this scan wrote a row: every song built is inserted, every row not staying is deleted.
    private static boolean marked;
    private static boolean wrote;

    // Temporary: where a scan's time goes, one ipplab line at its end.
    private static long labStart, labLook, labList, labSong, labTail, labLoad, labKnown, labListed, labCpu, labCpuTail;
    private static int labNodes, labDirs, labSongs;

    /** In place of the walk's {@code listFiles}: timed. */
    public static File[] list(File f) {
        long t = SystemClock.uptimeMillis();
        File[] r = f.listFiles();
        labList += SystemClock.uptimeMillis() - t;
        labDirs++;
        return r;
    }

    private static void labEnd() {
        if (labStart == 0L) return;
        long now = SystemClock.uptimeMillis();
        android.util.Log.i("ipplab", "scan: total " + (now - labStart) + " ms, walk "
                + ((labTail == 0L ? now : labTail) - labStart) + " ms, tail " +(labTail == 0L ? 0 : now - labTail)
                + " ms; " + labNodes + " nodes looked " + labLook + " ms; " + labDirs + " dirs listFiles " + labList
                + " ms; " + labSongs + " songs built " + labSong + " ms; paths load " + labLoad + " ms; wrote " + wrote
                + "; known " + labKnown + " ms (incl. load), listed " + labListed + " ms; walk cpu "
                + (labCpuTail - labCpu) + " ms");
        labStart = labLook = labList = labSong = labTail = labLoad = labKnown = labListed = labCpu = labCpuTail = 0L;
        labNodes = labDirs = labSongs = 0;
    }

    private static synchronized void mark() {
        labStart = SystemClock.uptimeMillis();
        labCpu = SystemClock.currentThreadTimeMillis();
        marked = true;
        py = new HashMap();
        Albums.scanStarts();
    }

    /**
     * In place of the per-file lambda's {@code songDao.insert}: the batch of 100 is written by
     * a thread of its own while the walk goes on. The writer drops the caches after each write,
     * so no list read in between can be kept as the table.
     */
    public static void insert(SongDao dao, Song[] batch) {
        if (dao == null || batch == null) return;
        synchronized (WRITES) {
            WRITES.addLast(new Object[] {dao, batch});
            if (!writing) {
                writing = true;
                new Thread(new Writer(), "ipp-scan-db").start();
            }
            WRITES.notifyAll();
        }
    }

    /**
     * In place of the tail's {@code songDao.insert}: every batch still queued is written first,
     * so the stock invalidation after it, {@code Albums.loadNow} and the scan's flag all come
     * after the last row is in the table. A failure here is thrown, as stock's insert throws.
     */
    public static void insertLast(SongDao dao, Song[] batch) {
        synchronized (WRITES) {
            long until = SystemClock.uptimeMillis() + FLUSH_MS;
            while ((!WRITES.isEmpty() && writing) || inWrite) {
                long left = until - SystemClock.uptimeMillis();
                if (left <= 0L) break;
                try {
                    WRITES.wait(left);
                } catch (InterruptedException e) {
                    break;
                }
            }
        }
        while (true) {      // left by a writer that died
            Object[] w;
            synchronized (WRITES) {
                if (WRITES.isEmpty()) break;
                w = (Object[]) WRITES.removeFirst();
            }
            write((SongDao) w[0], (Song[]) w[1]);
        }
        dao.insert(batch);
    }

    private static final java.util.LinkedList WRITES = new java.util.LinkedList();
    private static boolean writing;
    private static boolean inWrite;
    /** A writer that has not finished by then is stuck; the scan must not hang on it. */
    private static final long FLUSH_MS = 60000L;

    static final class Writer implements Runnable {
        public void run() {
            try {
                while (true) {
                    Object[] w;
                    synchronized (WRITES) {
                        long until = SystemClock.uptimeMillis() + IDLE_MS;
                        while (WRITES.isEmpty()) {
                            long left = until - SystemClock.uptimeMillis();
                            if (left <= 0L) {
                                writing = false;
                                return;
                            }
                            WRITES.wait(left);
                        }
                        w = (Object[]) WRITES.removeFirst();
                        inWrite = true;
                    }
                    try {
                        write((SongDao) w[0], (Song[]) w[1]);
                    } finally {
                        synchronized (WRITES) {
                            inWrite = false;
                            WRITES.notifyAll();
                        }
                    }
                }
            } catch (Throwable t) {
                synchronized (WRITES) {
                    writing = false;
                    inWrite = false;
                    WRITES.notifyAll();
                }
            }
        }
    }

    /** Three tries a second apart, as stock's {@code repeatTry} gives its per-file lambda. */
    private static void write(SongDao dao, Song[] batch) {
        for (int i = 0; i < 3; i++) {
            try {
                dao.insert(batch);
                Ipp.libraryChanged();
                return;
            } catch (Throwable e) {
                SystemClock.sleep(1000L);
            }
        }
        Diag.note("library scan: a batch of " + batch.length + " song(s) was not written");
    }

    /** Pinyin of a tag remembered while a scan runs; dropped at its end. */
    private static volatile HashMap py;

    /**
     * {@code HanziToPinyin.getString} answers from the string alone, and an album's songs repeat
     * its album, artist and genre — while every call takes the collator's lock.
     */
    public static String pinyin(HanziToPinyin h, String s) {
        HashMap m = py;
        if (m == null || s == null) return h.getString(s);
        String r;
        synchronized (m) {
            r = (String) m.get(s);
        }
        if (r != null) return r;
        r = h.getString(s);
        synchronized (m) {
            m.put(s, r);
        }
        return r;
    }

    /** From the scan's end: it walked music files and neither inserted nor deleted a row. */
    static synchronized boolean clean() {
        return marked && !wrote;
    }

    // the scan window's progress: music files met against the rows the table held before
    private static int seen;
    private static int expected;
    private static int shown = -1;

    private static synchronized void count() {
        int n = ++seen;
        int step = expected > 0 ? n * 100 / expected : n / 16;
        if (step == shown) return;
        shown = step;
        Loading.scanned(n, expected);
    }

    // The walk's checks of one node, in place of stock's File.exists / endIsAudiobook / endIsMusic /
    // endIsVideo / isDirectory: each of those asks the file system again and builds its list anew.
    // The lists are stock's, plus Formats; the answers are stock's for every node.

    private static final String[] MUSIC = {"ogg", "mp3", "amr", "ape", "flac", "wav", "wma", "aac",
        "m4r", "mmf", "mp2", "wv", "m4a", "mid", "aiff", "au", "mka", "ra", "ac3", "aif", "caf", "3gpp"};
    private static final String[] BOOK = {"ogg", "mp3", "amr", "ape", "flac", "wav", "wma", "aac",
        "m4r", "mmf", "mp2", "wv", "m4a", "aiff", "au", "mka", "ra", "ac3", "aif", "caf", "3gpp"};
    private static final String[] VIDEO = {"mp4", "mov", "wmv", "flv", "avi", "mkv"};

    private static final HashSet musicExt = new HashSet(Formats.more(java.util.Arrays.asList(MUSIC)));
    private static final HashSet bookExt = new HashSet(Formats.more(java.util.Arrays.asList(BOOK)));
    private static final HashSet videoExt = new HashSet(java.util.Arrays.asList(VIDEO));

    private static final int EXISTS = 1;
    private static final int DIR = 2;

    // the node the walk is on; the walk is one thread
    private static File node;
    private static int kind;
    private static String ext;

    private static int kind(File f) {
        if (f != node) {
            long t = SystemClock.uptimeMillis();
            int k = 0;
            if (f.isFile()) k = EXISTS;
            else if (f.isDirectory()) k = EXISTS | DIR;
            else if (f.exists()) k = EXISTS;
            labLook += SystemClock.uptimeMillis() - t;
            labNodes++;
            ext = extOf(f);
            kind = k;
            node = f;
        }
        return kind;
    }

    private static String extOf(File f) {
        String name = f.getName();
        int dot = name.lastIndexOf('.');
        return dot < 0 ? "" : name.substring(dot + 1).toLowerCase(Locale.ROOT);
    }

    public static boolean exists(File f) {
        return (kind(f) & EXISTS) != 0;
    }

    public static boolean dir(File f) {
        return (kind(f) & DIR) != 0;
    }

    /**
     * After the walk's {@code listFiles}: the children are looked at on another thread, in the
     * order the walk will reach them, so its own look at each finds the file system's answer
     * cached. The same look, sooner, on the second core; nothing is answered from here.
     */
    public static void listed(File[] children) {
        if (children == null || children.length == 0) return;
        long lt = SystemClock.uptimeMillis();
        queue(children);
        synchronized (AHEAD) {
            AHEAD.addLast(children);
            if (!looking) {
                looking = true;
                new Thread(new Looker(), "ipp-scan-stat").start();
            }
            AHEAD.notifyAll();
        }
        labListed += SystemClock.uptimeMillis() - lt;
    }

    private static final java.util.LinkedList AHEAD = new java.util.LinkedList();
    private static boolean looking;

    static final class Looker implements Runnable {
        public void run() {
            try {
                while (true) {
                    File[] next;
                    synchronized (AHEAD) {
                        long until = SystemClock.uptimeMillis() + IDLE_MS;
                        while (AHEAD.isEmpty()) {
                            long left = until - SystemClock.uptimeMillis();
                            if (left <= 0L) {
                                looking = false;
                                return;
                            }
                            AHEAD.wait(left);
                        }
                        next = (File[]) AHEAD.removeFirst();
                    }
                    for (int i = 0; i < next.length; i++) next[i].isFile();
                }
            } catch (Throwable t) {
                synchronized (AHEAD) {
                    looking = false;
                }
            }
        }
    }

    /** Stock's endIsAudiobook. */
    public static boolean book(File f) {
        return (kind(f) & DIR) == 0 && !f.isHidden() && bookExt.contains(ext);
    }

    /** Stock's endIsMusic. */
    public static boolean music(File f) {
        return (kind(f) & DIR) == 0 && !f.isHidden() && musicExt.contains(ext);
    }

    /** Stock's endIsVideo. */
    public static boolean video(File f) {
        return (kind(f) & DIR) == 0 && !f.isHidden() && videoExt.contains(ext);
    }

    /** Stock's {@code ThemeManager.pathInThemes}: a bare prefix, as stock has it, without a copy. */
    public static boolean themes(String path) {
        return path != null && path.regionMatches(true, 0, THEMES, 0, THEMES.length());
    }

    private static final String THEMES = "/storage/sdcard0/themes";

    /** Our card folder is not music; asked right after stock's {@code pathInThemes}. */
    public static boolean skip(boolean stock, String path) {
        return stock || ours(path);
    }

    /**
     * In the clean-up, in place of {@code File.exists()}: rows from our folder go (row only). A
     * file the walk has just met exists without asking the card; any other row is asked as stock
     * asks, so a path that fails to match only costs the call.
     */
    public static boolean stays(Song s) {
        if (s == null) return true;
        String path = s.getPath();
        if (path == null) return true;
        boolean seen;
        synchronized (Scan.class) {
            seen = met.contains(path);
        }
        boolean stays = !ours(path) && (seen || new File(path).exists());
        if (!stays) {
            synchronized (Scan.class) {
                wrote = true;
            }
        }
        return stays;
    }

    /**
     * In place of the clean-up's {@code getSongsSync()}: only the rows whose files the walk has not
     * met — every other row the clean-up would keep anyway. Usually none; those there are, are
     * dropped here in bulk ({@link #drop}) and stock's loop gets nothing left to do. No paths from
     * this scan: the query, as stock asks it.
     */
    public static List rows(SongDao dao) {
        labTail = SystemClock.uptimeMillis();
        labCpuTail = SystemClock.currentThreadTimeMillis();
        ArrayList unmet = new ArrayList();
        synchronized (Scan.class) {
            if (paths == null) return dao.getSongsSync();
            java.util.Iterator it = paths.iterator();
            while (it.hasNext()) {
                Object p = it.next();
                if (!met.contains(p)) unmet.add(p);
            }
        }
        if (unmet.isEmpty()) return unmet;
        try {
            drop(unmet);
            return new ArrayList();
        } catch (Throwable t) {
            Diag.note("library scan: batch clean-up failed, row by row: " + t);
        }
        // what the batch did not delete, as stock asks it
        ArrayList out = new ArrayList(unmet.size());
        for (int i = 0; i < unmet.size(); i++) {
            Song s = dao.getSongByPathSyncDB((String) unmet.get(i));
            if (s != null) out.add(s);
        }
        return out;
    }

    /**
     * The clean-up in bulk: the unmet rows found in one pass by rowid (path has no index, and a
     * query per path read the whole table each time), each kept or dropped by {@link #stays}
     * exactly as stock's loop decides, deleted in transactions of {@link #DROP_BATCH}.
     */
    private static void drop(List unmet) throws Exception {
        HashSet want = new HashSet(unmet);
        ArrayList ids = new ArrayList();
        long after = -1L;
        while (true) {
            android.database.Cursor c = PlGrid.db().query("select rowid, path from song where rowid > " + after
                    + " order by rowid limit " + PORTION, null);
            int n = 0;
            try {
                while (c.moveToNext()) {
                    after = c.getLong(0);
                    n++;
                    if (c.isNull(1)) continue;
                    String path = c.getString(1);
                    if (!want.contains(path)) continue;
                    Song probe = new Song();
                    probe.setPath(path);
                    if (!stays(probe)) ids.add(Long.valueOf(after));
                }
            } finally {
                c.close();
            }
            if (n < PORTION) break;
        }
        androidx.room.RoomDatabase db = PlGrid.db();
        int gone = 0;
        for (int from = 0; from < ids.size(); from += DROP_BATCH) {
            while (com.innioasis.music.objects.Global.INSTANCE.getScanLock()) Thread.sleep(100L);
            if (!com.innioasis.music.util.Other.INSTANCE.sdCardIsReady()) break;
            int to = Math.min(ids.size(), from + DROP_BATCH);
            db.beginTransaction();
            try {
                androidx.sqlite.db.SupportSQLiteStatement st = db.compileStatement("delete from song where rowid = ?");
                for (int i = from; i < to; i++) {
                    st.bindLong(1, ((Long) ids.get(i)).longValue());
                    st.executeUpdateDelete();
                    st.clearBindings();
                }
                db.setTransactionSuccessful();
            } finally {
                db.endTransaction();
            }
            gone += to - from;
            synchronized (Scan.class) {
                dropped += to - from;
            }
            com.innioasis.music.objects.Global g = com.innioasis.music.objects.Global.INSTANCE;
            g.setScanDeletedCount(g.getScanDeletedCount() + (to - from));
        }
        Diag.note("library scan: " + gone + " row(s) of missing files dropped in bulk");
        if (gone > 0) Ipp.libraryChanged();
    }

    private static final int DROP_BATCH = 500;

    /** Rows {@link #drop} deleted: the dialog's total no longer counts them. */
    private static int dropped;

    /** The clean-up's "total" for the scan dialog: what {@code getSongsSync().size()} would say. */
    public static int total(List rows) {
        synchronized (Scan.class) {
            if (paths != null) return paths.size() + added - dropped;
        }
        return rows == null ? 0 : rows.size();
    }

    private static int added;

    private static synchronized void built(Song s) {
        wrote = true;
        HashSet p = paths;
        if (s == null || p == null) return;
        if (!p.contains(s.getPath())) added++;
    }

    /** The music files this scan's walk has met, as the table writes them; dropped at its end. */
    private static HashSet met = new HashSet();

    private static synchronized void meet(String path) {
        if (path != null) met.add(Constant.INSTANCE.normalizeAudioBookPath(path));
    }

    /** Case-blind: the card is FAT, and a folder renamed by hand keeps being ours. */
    private static boolean ours(String path) {
        String dir = card;
        if (dir == null) card = dir = Panel.card().getPath();
        return under(path, dir);
    }

    private static String card;

    /** {@code path} is {@code dir} or lies in it, case-blind, without a lower-cased copy. */
    private static boolean under(String path, String dir) {
        if (path == null) return false;
        int n = dir.length();
        if (!path.regionMatches(true, 0, dir, 0, n)) return false;
        return path.length() == n || path.charAt(n) == '/';
    }

    /** Non-null = known; nothing reads its fields. */
    private static final Song MARKER = new Song();

    private static volatile HashSet paths;
    private static long asked;
    private static final long GAP_MS = 5000L;

    /**
     * Normalised as stock's query normalises it: the table holds the normalised audiobook path,
     * and without it every book is re-read and re-inserted on every boot.
     */
    static boolean inDb(String path) {
        if (path == null) return false;
        HashSet p = table();
        if (p == null) return false;
        return p.contains(Constant.INSTANCE.normalizeAudioBookPath(path));
    }

    /**
     * The scan's end (from {@code Albums.loadNow}): the set is let go, ~0.7 MB of paths kept for
     * nothing — the next scan reads it again anyway, and a missing set only means reading it.
     */
    static synchronized void done() {
        labEnd();
        Tone.recheck();
        paths = null;
        added = 0;
        dropped = 0;
        met = new HashSet();
        marked = false;
        wrote = false;
        py = null;
        forgetQueue();
    }

    private static synchronized HashSet table() {
        long now = SystemClock.uptimeMillis();
        HashSet p = paths;
        if (p == null || now - asked > GAP_MS) p = load();
        asked = now;
        return p;
    }

    private static HashSet load() {
        try {
            // Once per scan (boot, USB detach): when the card may have lost comma_artists.txt.
            Artists.ensureExceptions();
            Y1Repository r = Y1Application.Companion.getY1Repository();
            if (r == null) return paths;
            long lt = SystemClock.uptimeMillis();
            HashSet p = pathsOnly();
            labLoad += SystemClock.uptimeMillis() - lt;
            if (p == null) {
                p = new HashSet();
                fill(p, r.ippSongDao().getSongsSync());
            }
            Diag.note("library scan: " + p.size() + " path(s) already known");
            synchronized (Scan.class) {
                seen = 0;
                expected = p.size();
                shown = -1;
                added = 0;
            }
            // Only a scan of an EMPTY table reads every row with the current reader.
            if (p.isEmpty()) Meta.noteLibraryRead(Y1Application.Companion.getAppContext());
            paths = p;
            return p;
        } catch (Throwable t) {
            return paths;
        }
    }

    /**
     * Every row's path, music and audiobooks, without building a Song per row; null on failure.
     * In rowid portions: one query over a large table overflows the cursor window and runs again.
     */
    private static HashSet pathsOnly() {
        HashSet p = new HashSet();
        long after = -1L;
        while (true) {
            android.database.Cursor c = null;
            int n = 0;
            try {
                c = PlGrid.db().query("select rowid, path from song where rowid > " + after
                        + " order by rowid limit " + PORTION, null);
                while (c.moveToNext()) {
                    after = c.getLong(0);
                    if (!c.isNull(1)) p.add(c.getString(1));
                    n++;
                }
            } catch (Throwable t) {
                return null;
            } finally {
                try {
                    if (c != null) c.close();
                } catch (Throwable t) {
                }
            }
            if (n < PORTION) return p;
        }
    }

    private static final int PORTION = 5000;

    private static void fill(HashSet p, List songs) {
        if (songs == null) return;
        for (int i = 0; i < songs.size(); i++) {
            Object o = songs.get(i);
            if (!(o instanceof Song)) continue;
            String path = ((Song) o).getPath();
            if (path != null) p.add(path);
        }
    }

    /** Songs that may stand ready in front of the scan. */
    private static final int LOOK = 6;
    private static final long IDLE_MS = 5000L;
    /** The scan's wait for a song a worker is building, before doing it itself. */
    private static final long WAIT_MS = 20000L;

    private static final Object LOCK = new Object();

    // The files the walk will hand to the song lambda, in the order it will: its queue is FIFO and
    // every listFiles of it passes through listed, so the order is that of the children listed.
    private static Y1Repository repo;
    // Under LOCK only. Replaced rather than cleared at the end: a cleared table keeps its size.
    private static ArrayList upcoming = new ArrayList();  // File, nulled once passed
    private static HashMap at = new HashMap();            // path -> index, while not passed
    private static int cursor;                 // the walk is past everything before this
    private static int next;                   // index the workers take from
    private static int live;                   // workers running

    private static HashMap ready = new HashMap();       // path -> Song, built and waiting
    private static final HashSet building = new HashSet();     // paths a worker has taken

    /** The song lambda's own test, on the name only: a book extension in the audiobook folder, music outside it. */
    private static boolean songFile(File f) {
        if (f.isHidden()) return false;
        String path = f.getPath();
        if (path == null) return false;
        String e = extOf(f);
        return Constant.INSTANCE.pathInAudiobook(path) ? bookExt.contains(e) : musicExt.contains(e);
    }

    /**
     * From {@link #listed}: the walk's next files the table does not know, for the workers to build
     * ahead. A known file is never asked for; one asked for but not queued is built by the scan.
     */
    private static void queue(File[] children) {
        ArrayList fresh = null;
        for (int i = 0; i < children.length; i++) {
            File f = children[i];
            try {
                if (f == null || !songFile(f) || inDb(f.getPath())) continue;
            } catch (Throwable t) {
                continue;
            }
            if (fresh == null) fresh = new ArrayList();
            fresh.add(f);
        }
        if (fresh == null) return;
        synchronized (LOCK) {
            boolean any = false;
            for (int i = 0; i < fresh.size(); i++) {
                File f = (File) fresh.get(i);
                at.put(f.getPath(), Integer.valueOf(upcoming.size()));
                upcoming.add(f);
                any = true;
            }
            if (any && repo != null) {
                start();
                LOCK.notifyAll();
            }
        }
    }

    /** In place of {@code fileToSong} in the scan's per-file lambda. */
    public static Song song(Y1Repository r, File f) {
        long lt = SystemClock.uptimeMillis();
        Song s = null;
        try {
            s = take(r, f);
        } catch (Throwable t) {
            s = null;
        }
        if (s == null) s = r.fileToSong(f);
        labSong += SystemClock.uptimeMillis() - lt;
        labSongs++;
        built(s);
        return s;
    }

    /** Ready or on its way, else null. The file the scan is on also moves the workers' window. */
    private static Song take(Y1Repository r, File f) {
        String path = f.getPath();
        if (path == null) return null;

        synchronized (LOCK) {
            if (repo == null) {
                repo = r;
                start();
                LOCK.notifyAll();
            }
            Object o = at.get(path);
            int idx = o == null ? -1 : ((Integer) o).intValue();
            if (idx < cursor) {
                return null;                    // not where the walk was expected to be
            }
            pass(idx);
            if (idx >= next) {
                next = idx + 1;
                at.remove(path);
                start();
                LOCK.notifyAll();
                return null;                    // nobody is on it: quicker to do it here
            }
            Song s = (Song) ready.remove(path);
            if (s == null && building.contains(path)) {
                // A worker is on this very file: waiting beats starting over.
                long deadline = SystemClock.uptimeMillis() + WAIT_MS;
                while (building.contains(path)) {
                    long left = deadline - SystemClock.uptimeMillis();
                    if (left <= 0L) break;
                    try {
                        LOCK.wait(left);
                    } catch (Throwable t) {
                        break;
                    }
                }
                s = (Song) ready.remove(path);
            }
            at.remove(path);
            LOCK.notifyAll();
            return s;
        }
    }

    /** Under the lock: the walk is at {@code idx}; what it went past is never asked for. */
    private static void pass(int idx) {
        for (int i = cursor; i < idx; i++) {
            File g = (File) upcoming.get(i);
            if (g == null) continue;
            String p = g.getPath();
            at.remove(p);
            ready.remove(p);
            upcoming.set(i, null);
        }
        upcoming.set(idx, null);
        cursor = idx + 1;
    }

    /** Under the lock. */
    private static void start() {
        int want = pool();
        while (live < want) {
            live++;
            new Thread(new Builder()).start();
        }
    }

    private static int pool() {
        int c = Runtime.getRuntime().availableProcessors();
        c++;                    // the scan thread mostly waits on them; a fourth only crowds the lock
        if (c > 3) c = 3;
        return c;
    }

    /** From {@link #done}. */
    private static void forgetQueue() {
        synchronized (LOCK) {
            upcoming = new ArrayList();
            at = new HashMap();
            ready = new HashMap();
            cursor = 0;
            next = 0;
            repo = null;
            LOCK.notifyAll();
        }
    }

    static final class Builder implements Runnable {

        public void run() {
            try {
                while (true) {
                    File f;
                    Y1Repository r;
                    synchronized (LOCK) {
                        long idleUntil = SystemClock.uptimeMillis() + IDLE_MS;
                        while (true) {
                            f = claim();
                            if (f != null) break;
                            long left = idleUntil - SystemClock.uptimeMillis();
                            if (left <= 0L) {
                                live--;
                                return;
                            }
                            LOCK.wait(left);
                        }
                        r = repo;
                    }

                    Song s = null;
                    try {
                        // Known paths are skipped, as the scan skips them; a folder named like a
                        // song is not built. Outside the lock.
                        if (r != null && !inDb(f.getPath()) && f.isFile()) {
                            s = r.fileToSong(f);
                        }
                    } catch (Throwable t) {
                        s = null;
                    }

                    synchronized (LOCK) {
                        String p = f.getPath();
                        building.remove(p);
                        if (s != null && at.containsKey(p)) ready.put(p, s);
                        LOCK.notifyAll();
                    }
                }
            } catch (Throwable t) {
                synchronized (LOCK) {
                    live--;
                    LOCK.notifyAll();
                }
            }
        }

        /** Under the lock; null while the window is full. */
        private static File claim() {
            if (repo == null) return null;
            if (next < cursor) next = cursor;
            while (next < upcoming.size() && ready.size() + building.size() < LOOK) {
                File f = (File) upcoming.get(next++);
                if (f == null) continue;
                building.add(f.getPath());
                return f;
            }
            return null;
        }
    }
}
