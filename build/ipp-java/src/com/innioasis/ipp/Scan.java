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
 * The stock library scan ({@code Y1Repository.refreshDatabase}) — two things bolted onto it, both
 * through single-call injections into its per-file lambda.
 *
 * <h3>1. The songs are built ahead of the scan, on several threads</h3>
 * The scan's cost is {@code fileToSong}: one {@code MediaMetadataRetriever} open per <b>new</b> file.
 * Its walk cannot be split — the queue, the batching and the inserts are stock's and stay on stock's
 * thread — so the work is moved <b>in front</b> of it instead: when the scan asks for a file, this
 * hands back a {@code Song} that a worker has already built, and the workers run on down the same
 * folder, a few files ahead. The scan thread keeps doing its own share (the first file of each
 * folder, the walk, the row lookups, the inserts) while they read.
 *
 * The folder is the unit because the scan's breadth-first walk adds a directory's children to its
 * queue together, so a folder's files are consumed in listing order. Workers stop as soon as the
 * scan moves on, never run more than {@link #LOOK} files ahead, and skip files the scan will skip
 * (a path already in the library) — otherwise an ordinary scan of an unchanged library would read
 * every file on the device for nothing.
 *
 * <b>{@code fileToSong} is only thread-safe because of one stock patch</b>: it calls
 * {@code HanziToPinyin.getString} five times per song, and that walks a single static ICU
 * {@code Collator} for every character above U+00FF (i.e. for every Cyrillic tag). That method is
 * now {@code synchronized} — the calls are short and the collator is the only shared thing in the
 * whole path, so serialising them costs nothing next to the file reads.
 *
 * <h3>An earlier attempt, and why it is gone</h3>
 * Before this, the same structure was used to pull the next files into the <b>page cache</b> (head
 * and tail) rather than to parse them. Measured on the device it was consistently <b>slower</b> —
 * 15-17 s against 11 s for 887 songs — because the card was already the limit and the read-ahead
 * added ~576 KB of reading per file on top of what the tag read actually touches. Overlapping is
 * only worth anything when the extra thread does the <i>same</i> work sooner, not more of it.
 *
 * <h3>2. Whether a file is already in the library is answered from memory</h3>
 * That test used to be an indexed query per file — for every file the walk meets, not only for the
 * music it keeps. It is now {@link #known}, answered from a set of every path the Song table holds.
 */
public final class Scan {

    private Scan() { }

    // ----------------------------------------------------------------- the "already known" test

    /**
     * <b>Replaces</b> the scan's {@code songDao.getSongByPathSync(path)}: same answer — null means
     * "not in the library, read it" — out of a set of every path the Song table holds, loaded once
     * per scan instead of one indexed query per file on the device.
     *
     * Only the null-ness of the answer is ever looked at, so a shared empty row stands for "known".
     *
     * The direction of any mistake matters here and only one of them is safe: a path we wrongly
     * call unknown is read and written again (the row's key comes from the path, so it replaces
     * itself — wasted work, nothing lost), while a path we wrongly call known would be dropped from
     * the library. So the set is built from the table itself and never guesses: both halves of it
     * ({@code isAudiobook} 0 and 1), reloaded whenever more than {@link #GAP_MS} has passed since
     * the last file — a walk asks about files continuously, so a gap that long means the previous
     * scan is over and the next one must not be answered from a stale set.
     */
    public static Song known(String path) {
        return inDb(path) ? MARKER : null;
    }

    /** Non-null stands for "this path is already in the library"; nothing reads its fields. */
    private static final Song MARKER = new Song();

    private static volatile HashSet paths;
    private static long asked;
    /** A gap this long between files means a different scan, and the set has to be read again. */
    private static final long GAP_MS = 5000L;

    /**
     * <b>The path has to be normalised first.</b> What was replaced here is not a plain query:
     * {@code SongDao.getSongByPathSync} is a default method whose body is
     * {@code getSongByPathSyncDB(Constant.normalizeAudioBookPath(path))}, and {@code fileToSong}
     * stores the normalised form too — so for an audiobook (whose folder differs in case) the raw
     * path the walk hands over never matches what the table holds, every book counts as new, and
     * the scan re-reads and re-inserts all of them on every boot. No duplicates appear, because the
     * insert replaces the same row, so the only visible sign is the "added" count.
     */
    static boolean inDb(String path) {
        if (path == null) return false;
        HashSet p = table();
        if (p == null) return false;
        return p.contains(Constant.INSTANCE.normalizeAudioBookPath(path));
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
            // Once per scan, which is once per boot and once per USB detach -- the two moments
            // the card can have lost comma_artists.txt, and the one place that already knows a
            // scan has begun. See Artists.ensureExceptions for why it is not seeded lazily.
            Artists.ensureExceptions();
            Y1Repository r = Y1Application.Companion.getY1Repository();
            if (r == null) return paths;                  // keep whatever we had
            HashSet p = new HashSet();
            fill(p, r.getSongsSync(0));                   // music
            fill(p, r.getSongsSync(1));                   // audiobooks
            Diag.note("library scan: " + p.size() + " path(s) already known");
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

    // ---------------------------------------------------------------- building ahead

    /** How many songs may stand ready in front of the scan. */
    private static final int LOOK = 4;
    /** A worker with nothing to do for this long goes away; the next file starts a new one. */
    private static final long IDLE_MS = 5000L;
    /** How long the scan waits for a song a worker is already building before doing it itself. */
    private static final long WAIT_MS = 20000L;

    private static final Object LOCK = new Object();

    private static Y1Repository repo;
    private static String dir;                 // the folder being built
    private static File[] files;               // its audio files, in the order the walk meets them
    private static int next;                   // index the workers take from
    private static int live;                   // workers running

    private static final HashMap ready = new HashMap();       // path -> Song, built and waiting
    private static final HashSet building = new HashSet();     // paths a worker has taken

    /**
     * Injected in place of {@code fileToSong} in the scan's per-file lambda: the same song, built
     * by a worker if one got there first, and the rest of the folder started behind it.
     */
    public static Song song(Y1Repository r, File f) {
        Song s = null;
        try {
            s = take(r, f);
        } catch (Throwable t) {
            s = null;
        }
        return s != null ? s : r.fileToSong(f);
    }

    /**
     * The song for {@code f} if it is ready or on its way, else null (the caller builds it itself).
     * Also what drives the queue: the file the scan is on marks how far the workers may fall behind.
     */
    private static Song take(Y1Repository r, File f) {
        String path = f.getPath();
        String folder = f.getParent();
        if (path == null || folder == null) return null;

        synchronized (LOCK) {
            repo = r;
            if (!folder.equals(dir)) {
                // A new folder: start again from the file the scan is actually on.
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
            // A worker is already parsing this very file; waiting for it beats starting over.
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

    /** Index just after {@code path} in the current folder's listing, or the current one. */
    private static int indexAfter(String path) {
        if (files == null) return 0;
        for (int i = 0; i < files.length; i++) {
            if (path.equals(files[i].getPath())) return i + 1;
        }
        return next;
    }

    /** Under the lock: make sure enough workers are alive to keep the queue full. */
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
        return c;               // plus the scan thread itself, which is doing its own share
    }

    /** The folder's audio files, by stock's own rule, in the order its walk will meet them. */
    private static File[] audio(Y1Repository r, File folder) {
        File[] all = folder.listFiles();
        if (all == null) return new File[0];
        File[] out = new File[all.length];
        int n = 0;
        for (int i = 0; i < all.length; i++) {
            try {
                if (all[i].isFile() && r.endIsMusic(all[i])) out[n++] = all[i];
            } catch (Throwable t) {
                // not a music file as far as we are concerned
            }
        }
        File[] cut = new File[n];
        System.arraycopy(out, 0, cut, 0, n);
        return cut;
    }

    /** Named (d8 here crashes on anonymous classes). */
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
                        // Skipped for the same reason the scan skips it, and answered from the same
                        // set of known paths. Not under the lock: the read below it is a file read.
                        if (!inDb(f.getPath())) s = r.fileToSong(f);
                    } catch (Throwable t) {
                        s = null;               // the scan will try it again the ordinary way
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

        /** Under the lock: the next file worth building, or null while the queue is full enough. */
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
