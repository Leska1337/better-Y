package com.innioasis.ipp;

import android.os.SystemClock;

import com.innioasis.y1.database.Song;
import com.innioasis.y1.database.Y1Repository;

import com.innioasis.music.objects.Constant;
import com.innioasis.y1.Y1Application;

import java.io.File;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

/**
 * Speeds up the stock scan ({@code Y1Repository.refreshDatabase}) through single-call injections
 * into its per-file lambda. Workers build the {@code Song}s of the current folder a few files ahead
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
        boolean in = inDb(path);
        count();
        return in ? MARKER : null;
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

    /** Our card folder is not music; asked right after stock's {@code pathInThemes}. */
    public static boolean skip(boolean stock, String path) {
        return stock || ours(path);
    }

    /** In the clean-up, in place of {@code File.exists()}: rows from our folder go (row only). */
    public static boolean stays(boolean exists, Song s) {
        return exists && (s == null || !ours(s.getPath()));
    }

    /** Case-blind: the card is FAT, and a folder renamed by hand keeps being ours. */
    private static boolean ours(String path) {
        if (path == null) return false;
        String dir = Panel.card().getPath().toLowerCase();
        String p = path.toLowerCase();
        return p.equals(dir) || p.startsWith(dir + "/");
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
        paths = null;
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
            HashSet p = new HashSet();
            fill(p, r.getSongsSync(0));                   // music
            fill(p, r.getSongsSync(1));                   // audiobooks
            Diag.note("library scan: " + p.size() + " path(s) already known");
            synchronized (Scan.class) {
                seen = 0;
                expected = p.size();
                shown = -1;
            }
            // Only a scan of an EMPTY table reads every row with the current reader.
            if (p.isEmpty()) Meta.noteLibraryRead(Y1Application.Companion.getAppContext());
            paths = p;
            return p;
        } catch (Throwable t) {
            return paths;
        }
    }

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
    private static final int LOOK = 4;
    private static final long IDLE_MS = 5000L;
    /** The scan's wait for a song a worker is building, before doing it itself. */
    private static final long WAIT_MS = 20000L;

    private static final Object LOCK = new Object();

    private static Y1Repository repo;
    private static String dir;                 // the folder being built
    private static File[] files;               // its audio files, in the order the walk meets them
    private static int next;                   // index the workers take from
    private static int live;                   // workers running

    private static final HashMap ready = new HashMap();       // path -> Song, built and waiting
    private static final HashSet building = new HashSet();     // paths a worker has taken

    /** In place of {@code fileToSong} in the scan's per-file lambda. */
    public static Song song(Y1Repository r, File f) {
        Song s = null;
        try {
            s = take(r, f);
        } catch (Throwable t) {
            s = null;
        }
        return s != null ? s : r.fileToSong(f);
    }

    /** Ready or on its way, else null. The file the scan is on also drives the workers' queue. */
    private static Song take(Y1Repository r, File f) {
        String path = f.getPath();
        String folder = f.getParent();
        if (path == null || folder == null) return null;

        synchronized (LOCK) {
            repo = r;
            if (!folder.equals(dir)) {
                dir = folder;
                files = audio(r, new File(folder));
                next = indexAfter(path);
                ready.clear();
                building.clear();
                start();
                return null;                    // this one the scan builds itself
            }
            next = Math.max(next, indexAfter(path));

            Song s = (Song) ready.remove(path);
            if (s != null) {
                start();
                LOCK.notifyAll();
                return s;
            }
            if (!building.contains(path)) {
                start();
                LOCK.notifyAll();
                return null;                    // nobody is on it: quicker to do it here
            }
            // A worker is on this very file: waiting beats starting over.
            long deadline = SystemClock.uptimeMillis() + WAIT_MS;
            while (building.contains(path) && folder.equals(dir)) {
                long left = deadline - SystemClock.uptimeMillis();
                if (left <= 0L) break;
                try {
                    LOCK.wait(left);
                } catch (Throwable t) {
                    break;
                }
            }
            s = (Song) ready.remove(path);
            LOCK.notifyAll();
            return s;
        }
    }

    private static int indexAfter(String path) {
        if (files == null) return 0;
        for (int i = 0; i < files.length; i++) {
            if (path.equals(files[i].getPath())) return i + 1;
        }
        return next;
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
        if (c < 1) c = 1;
        if (c > 3) c = 3;
        return c;               // plus the scan thread itself
    }

    /** By stock's rule, in the order its walk meets them. */
    private static File[] audio(Y1Repository r, File folder) {
        File[] all = folder.listFiles();
        if (all == null) return new File[0];
        File[] out = new File[all.length];
        int n = 0;
        for (int i = 0; i < all.length; i++) {
            try {
                if (all[i].isFile() && r.endIsMusic(all[i])) out[n++] = all[i];
            } catch (Throwable t) {
            }
        }
        File[] cut = new File[n];
        System.arraycopy(out, 0, cut, 0, n);
        return cut;
    }

    static final class Builder implements Runnable {

        public void run() {
            try {
                while (true) {
                    File f;
                    String folder;
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
                        folder = dir;
                        r = repo;
                    }

                    Song s = null;
                    try {
                        // Known paths are skipped, as the scan skips them. Outside the lock.
                        if (!inDb(f.getPath())) s = r.fileToSong(f);
                    } catch (Throwable t) {
                        s = null;
                    }

                    synchronized (LOCK) {
                        building.remove(f.getPath());
                        if (s != null && folder != null && folder.equals(dir)) {
                            ready.put(f.getPath(), s);
                        }
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

        /** Under the lock; null while the queue is full. */
        private static File claim() {
            if (files == null || dir == null) return null;
            if (ready.size() + building.size() >= LOOK) return null;
            if (next >= files.length) return null;
            File f = files[next++];
            building.add(f.getPath());
            return f;
        }
    }
}
