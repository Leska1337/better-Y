package com.innioasis.ipp;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.SystemClock;

import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.service.PlayerService;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.zip.CRC32;

/**
 * The Now-Playing cover: memory + JPEG cache. Keyed by track PATH — tracks of one folder can
 * differ — yet about one file per album: the first track of a folder is its representative, a
 * pixel-equal track shares that Bitmap, only differing artwork gets a file. The per-track answer
 * ({@link #note}) is persisted so it survives a restart. {@link #SIZE} caps, never upscales.
 */
public final class BigCover {

    private BigCover() { }

    private static final int SIZE = 300;
    /** Change it with the compression scheme: {@link #dir} sweeps every file not ending in it. */
    private static final String SUFFIX = "-300q.jpg";

    // The target is a file WEIGHT: the highest quality whose output fits LIMIT. The bounds are
    // libjpeg's equivalents of Photoshop 65..90 — the same number is a harsher picture here.
    private static final int Q_MIN = 76;       // ~ Photoshop 65
    private static final int Q_MAX = 92;       // ~ Photoshop 90

    /** A source that already fits is stored verbatim, never compressed twice. */
    private static final int LIMIT = 25 * 1024;

    /**
     * Track path or folder -> Bitmap, LRU. Bounded: Cover Flow reads every album it passes, and an
     * unbounded map filled the heap into constant GC pauses.
     */
    private static final Map mem = Collections.synchronizedMap(new Lru());
    private static final int MEM_MAX = 24;

    static long memBytes() {
        java.util.ArrayList l;
        synchronized (mem) {
            l = new java.util.ArrayList(mem.values());
        }
        return Diag.bitmapBytes(l);
    }

    private static final class Lru extends LinkedHashMap {
        Lru() { super(32, 0.75f, true); }

        protected boolean removeEldestEntry(Map.Entry e) { return size() > MEM_MAX; }
    }

    /** "No cover here", so a coverless track is not re-read. */
    private static final Hashtable miss = new Hashtable();

    private static boolean swept;

    private static final Object LOCK = new Object();

    /** The cover of one track, reading and caching it if needed. Off the main thread only. */
    public static Bitmap track(String path) {
        return track(path, true);
    }

    /**
     * {@link #track} that leaves memory as it was: for a reader that walks many albums, as Cover
     * Flow does after the cache was cleared. The file and the note are written as usual.
     */
    public static Bitmap trackFree(String path) {
        return track(path, false);
    }

    private static Bitmap track(String path, boolean store) {
        if (path == null) return null;
        Bitmap hit = store ? peekTrack(path) : peekTrackFree(path);
        if (hit != null) return hit;
        if (miss.containsKey(path)) return null;

        // the prefetch and the player's own load: the second finds the answer in memory
        synchronized (LOCK) {
            hit = store ? peekTrack(path) : peekTrackFree(path);
            if (hit != null) return hit;
            if (miss.containsKey(path)) return null;

            String folder = Albums.trackFolder(path);
            if (note(path) == NONE) { miss.put(path, path); return null; }

            Src src;
            try {
                src = read(path);
            } catch (OutOfMemoryError e) {
                return null;
            } catch (Throwable t) {
                src = null;
            }
            if (src == UNREAD) return null;
            if (src == null) {
                miss.put(path, path);
                noteSet(path, NONE);
                return null;
            }
            Bitmap fresh = src.bmp;

            // noted only once the JPEG is on disk: a note without its file is never read again
            Bitmap rep = peek(folder, store);
            if (rep == null) {
                if (store) mem.put(path, fresh);
                if (!store(folder, src, null, store)) return fresh;
                sigSet(folder, src.raw);
                noteSet(path, SHARED);
                return fresh;
            }
            if (sigIs(folder, src.raw) || same(rep, fresh)) {
                if (store) mem.put(path, rep);
                noteSet(path, SHARED);
                return rep;
            }
            if (store) mem.put(path, fresh);
            if (store(path, src, null, store)) noteSet(path, OWN);
            return fresh;
        }
    }

    /**
     * Read the cover of the song picked in a menu while the player is still being built, so
     * {@code Cover.instantCover} paints it with the first frame. Not a stand-in album cover: a
     * track's own artwork can differ.
     */
    public static void prefetch(List playlist, int pos) {
        try {
            if (playlist == null || pos < 0 || pos >= playlist.size()) return;
            Object o = playlist.get(pos);
            if (!(o instanceof Song)) return;
            Ahead.picked(((Song) o).getPath());
            warm(((Song) o).getPath());
        } catch (Throwable t) {
        }
    }

    /**
     * The same head start on every track change ({@code ListWatch}) — the side buttons never go
     * through {@link #prefetch}. {@code getPlayingSong}, so audiobooks are covered too. The track
     * after it as well: the next press then finds its cover in memory instead of decoding the
     * JPEG on the main thread.
     */
    public static void prefetchPlaying() {
        try {
            PlayerService s = Y1Application.Companion.getPlayerService();
            Song song = s == null ? null : s.getPlayingSong();
            warm(song == null ? null : song.getPath());
            warm(Queue.nextPath());
        } catch (Throwable t) {
        }
    }

    /** Checks {@code mem}, not {@link #peek}: peek decodes, and the callers are on the main thread. */
    private static void warm(String path) {
        if (path == null || mem.get(path) != null || miss.containsKey(path)) return;
        if (worker == null) {
            HandlerThread t = new HandlerThread("ipp-cover");
            t.start();
            worker = new Handler(t.getLooper());
        }
        worker.post(new Warm(path));
    }

    /**
     * One thread for every read ahead: starting a thread per track costs the main thread more than
     * the read saves. Ordinary priority — at a background one it stalls with locks held.
     */
    private static Handler worker;

    static final class Warm implements Runnable {
        private final String path;
        Warm(String path) { this.path = path; }
        public void run() {
            try {
                track(path);
            } catch (Throwable t) {
            }
        }
    }

    /**
     * Strictly what we already have for this track; never reads tags. The representative only for
     * a track noted {@link #SHARED} — a recorded comparison, never a guess.
     */
    public static Bitmap peekTrack(String path) {
        if (path == null) return null;
        Bitmap b = peek(path);
        if (b != null) return b;
        if (note(path) != SHARED) return null;
        b = peek(Albums.trackFolder(path));
        if (b != null) mem.put(path, b);
        return b;
    }

    /** The cached JPEG of this track, or null. Fills nothing in memory: for Cover Flow. */
    public static File cachedFile(String path) {
        if (path == null) return null;
        int n = note(path);
        String key = n == OWN ? path : n == SHARED ? Albums.trackFolder(path) : null;
        File f = key == null ? null : file(key);
        return f != null && f.exists() ? f : null;
    }

    /**
     * Memory, then the misses, then the JPEG. Capped and cropped on the way OUT — a verbatim file
     * may be any size — so it matches what {@code read} gives and {@code same()} still works.
     */
    public static Bitmap peek(String key) {
        return peek(key, true);
    }

    /**
     * {@link #peekTrack} that leaves memory as it was: for pictures built ahead in Cover Flow,
     * where every album the row rested on would otherwise stay in memory and every collector
     * pause grows with it. {@link #keep} puts the one that is used in.
     */
    public static Bitmap peekTrackFree(String path) {
        if (path == null) return null;
        Bitmap b = peek(path, false);
        if (b != null || note(path) != SHARED) return b;
        return peek(Albums.trackFolder(path), false);
    }

    /** A cover read by {@link #peekTrackFree}, into memory once it is the one being played. */
    public static void keep(String path, Bitmap b) {
        if (path != null && b != null && mem.get(path) == null) mem.put(path, b);
    }

    private static Bitmap peek(String key, boolean store) {
        if (key == null) return null;
        Object hit = mem.get(key);
        if (hit != null) return (Bitmap) hit;
        if (miss.containsKey(key)) return null;
        Bitmap b = null;
        try {
            File f = file(key);
            if (f != null && f.exists()) {
                String p = f.getAbsolutePath();
                BitmapFactory.Options o = new BitmapFactory.Options();
                o.inJustDecodeBounds = true;
                BitmapFactory.decodeFile(p, o);
                if (o.outWidth > 0 && o.outHeight > 0) {
                    o.inSampleSize = Art.sample(o.outWidth, o.outHeight, SIZE, SIZE);
                    o.inJustDecodeBounds = false;
                    b = square(BitmapFactory.decodeFile(p, o));
                }
            }
        } catch (Throwable t) {
            b = null;
        }
        if (b != null && store) mem.put(key, b);
        return b;
    }

    /** Drop one key everywhere — memory, miss, note, JPEG, Cover Flow's copy ({@code Ipp.songChanged}). */
    public static void forget(String key) {
        if (key == null) return;
        mem.remove(key);
        miss.remove(key);
        noteForget(key);
        try {
            File f = file(key);
            if (f != null) f.delete();
        } catch (Throwable t) {
        }
        FlowCache.forget(key);
    }

    /** Forget only the "no cover here" answers, keeping the covers we did find. */
    public static void clearMiss() {
        miss.clear();
        noteForgetNone();
    }

    /** Wipe everything, memory and disk ("Clear cache" in Settings). */
    public static void clear() {
        mem.clear();
        miss.clear();
        noteClear();
        try {
            File d = dir();
            if (d == null) return;
            File[] fs = d.listFiles();
            if (fs == null) return;
            for (int i = 0; i < fs.length; i++) fs[i].delete();
            d.delete();
        } catch (Throwable t) {
        }
    }

    /**
     * "Cache library": one folder being walked and its representative. An object, not statics —
     * the pass runs several threads, each in its own folder.
     */
    public static final class Walk {
        private String folder;
        private byte[] raw;        // the representative's own file bytes, when read in this pass
        private Bitmap rep;        // decoded — only when a track's bytes actually differ
        // the last cover file read, kept across folders: a folder.jpg above serves several
        private String extPath;
        private long extLen, extMod;
        private byte[] extBytes;
        // the answer for the last directory, none included: a miss on FAT scans the whole directory
        private String extDir;
        private byte[] extDirBytes;

        // Where the time went, for the pass's log line. Counts by where the picture came from and
        // which way it was settled; times in ns.
        public long embedded, external, none;
        public long sameBytes, sigOnDisk, verbatim, encoded, samePixels, own, failed;
        public long externalNs, decodeNs, storeNs, extLookups;
        // storeNs split: the source's decode for a re-encode, the encodes (and their count), the writes
        public long srcDecodeNs, encodeNs, probes, writeNs;

        /** Done with this folder: the representative is on disk. */
        public void done() {
            if (folder != null) mem.remove(folder);
            folder = null;
            raw = null;
            rep = null;
        }
    }

    /** While a pass runs the notes are saved once, at its end. */
    private static volatile boolean passing;

    /** This track's cover has never been looked at, or its note points at a JPEG that is not there. */
    public static boolean needs(String path) {
        int n = note(path);
        if (n == UNKNOWN) return true;
        if (n == NONE) return false;
        return cachedFile(path) == null;
    }

    /** This track has artwork of its OWN, different from its folder's (the Search row). */
    public static boolean ownArt(String path) {
        return note(path) == OWN;
    }

    /**
     * KNOWN to have no artwork — a recorded answer, so the player paints its placeholder at once
     * ({@code Cover.instantBlank}). UNKNOWN says nothing.
     */
    public static boolean knownNone(String path) {
        return note(path) == NONE;
    }

    /**
     * "Cache library" for one track. Unlike {@link #track}: the note is written for every song,
     * and nothing stays in memory beyond the folder being walked (hundreds of decoded covers run
     * out of memory). The representative is held, not re-read: a re-decoded JPEG never matches.
     * {@code embedded} comes from the caller, which already had the file open. Never on the UI thread.
     * False when the JPEG could not be written: the track is left unknown for the next pass.
     */
    public static boolean cache(Walk w, String path, byte[] embedded) {
        if (path == null || w == null) return true;
        try {
            if (!needs(path)) return true;
            String folder = Albums.trackFolder(path);
            if (w.folder != null && !w.folder.equals(folder)) w.done();
            w.folder = folder;

            byte[] raw;
            if (embedded != null && embedded.length > 0) {
                raw = embedded;
                w.embedded++;
            } else {
                long t0 = System.nanoTime();
                raw = external(w, path);
                w.externalNs += System.nanoTime() - t0;
                if (raw != null && raw.length > 0) w.external++;
            }
            if (raw == null || raw.length == 0) { w.none++; noteSet(path, NONE); return true; }

            // nearly every track: the same bytes as the representative, nothing decoded
            if (w.raw != null && Arrays.equals(w.raw, raw)) {
                w.sameBytes++;
                noteSet(path, SHARED);
                return true;
            }

            if (w.raw == null && w.rep == null) {
                File had = file(folder);
                if (had != null && had.exists() && sigIs(folder, raw)) {
                    w.sigOnDisk++;
                    w.raw = raw;
                    noteSet(path, SHARED);
                    return true;
                }
                long t0 = System.nanoTime();
                Bitmap onDisk = peek(folder);
                w.decodeNs += System.nanoTime() - t0;
                if (onDisk == null) {
                    t0 = System.nanoTime();
                    int r = storeSrc(w, folder, raw);
                    w.storeNs += System.nanoTime() - t0;
                    if (r == STORE_FAILED) { w.failed++; return false; }
                    if (r == STORE_NO_PICTURE) { w.none++; noteSet(path, NONE); return true; }
                    w.raw = raw;
                    sigSet(folder, raw);
                    noteSet(path, SHARED);
                    return true;
                }
                w.rep = onDisk;
            }

            long t0 = System.nanoTime();
            Bitmap fresh = capped(raw);
            if (fresh != null && w.rep == null) w.rep = capped(w.raw);
            w.decodeNs += System.nanoTime() - t0;
            if (fresh == null) { w.none++; noteSet(path, NONE); return true; }
            if (same(w.rep, fresh)) {
                w.samePixels++;
                // these bytes stand for the representative from now on: starts the byte path
                if (w.raw == null) w.raw = raw;
                noteSet(path, SHARED);
                return true;
            }
            Src src = new Src();
            src.bmp = fresh;
            src.raw = raw;
            t0 = System.nanoTime();
            boolean ok = store(path, src, w);
            w.storeNs += System.nanoTime() - t0;
            mem.remove(path);
            if (!ok) { w.failed++; return false; }
            w.own++;
            noteSet(path, OWN);
            return true;
        } catch (Throwable t) {
            w.failed++;
            return false;
        }
    }

    /** The external {@code cover.*}/{@code folder.*} serving a track, as bytes. */
    private static byte[] external(String path) {
        try {
            File f = Art.file(path);
            if (f == null) return null;
            Art.stampRead(path);
            return readAll(f);
        } catch (Throwable t) {
            return null;
        }
    }

    /**
     * {@link #external(String)} for a pass: a folder's songs share one cover file, so the bytes
     * read for the last song are handed back while the file's path, length and date are the same.
     * A directory is looked up once; what changed under the pass was dropped at its start.
     */
    private static byte[] external(Walk w, String path) {
        int cut = path.lastIndexOf('/');
        String dir = cut > 0 ? path.substring(0, cut) : "";
        if (dir.equals(w.extDir)) return w.extDirBytes;
        try {
            byte[] b = externalFile(w, path);
            w.extDir = dir;
            w.extDirBytes = b;
            w.extLookups++;
            return b;
        } catch (Throwable t) {
            return null;                    // not remembered: the next song of the folder tries again
        }
    }

    private static byte[] externalFile(Walk w, String path) throws IOException {
        File f = Art.file(path);
        if (f == null) return null;
        Art.stampRead(path);
        String p = f.getPath();
        long len = f.length();
        long mod = f.lastModified();
        if (w.extBytes != null && p.equals(w.extPath) && len == w.extLen && mod == w.extMod) {
            return w.extBytes;
        }
        byte[] b = readAll(f);
        w.extPath = p;
        w.extLen = len;
        w.extMod = mod;
        w.extBytes = b;
        return b;
    }

    private static final int STORED = 0;
    private static final int STORE_NO_PICTURE = 1;
    private static final int STORE_FAILED = 2;

    /** Store a representative during a pass; a fitting JPEG goes verbatim, nothing decoded. */
    private static int storeSrc(Walk w, String key, byte[] raw) {
        if (raw.length <= LIMIT && isJpeg(raw)) {
            w.verbatim++;
            long t0 = System.nanoTime();
            boolean ok = write(key, raw);
            w.writeNs += System.nanoTime() - t0;
            return ok ? STORED : STORE_FAILED;
        }
        w.encoded++;
        long t0 = System.nanoTime();
        Bitmap b = capped(raw);
        w.srcDecodeNs += System.nanoTime() - t0;
        if (b == null) return STORE_NO_PICTURE;
        Src s = new Src();
        s.bmp = b;
        s.raw = raw;
        boolean ok = store(key, s, w);
        mem.remove(key);
        if (!ok) return STORE_FAILED;
        w.rep = b;
        return STORED;
    }

    public static void beginCache() {
        passing = true;
    }

    public static void endCache() {
        passing = false;
        noteSave();
    }

    // The per-track note.
    private static final int UNKNOWN = -1;
    /** No artwork, in the tags or beside the file. */
    private static final int NONE = 0;
    /** Pixel-identical to the folder's representative. */
    private static final int SHARED = 1;
    /** A JPEG of its own under the track key. */
    private static final int OWN = 2;

    private static final HashMap notes = new HashMap();   // track path -> Integer
    private static boolean notesLoaded;
    private static boolean notesDirty;
    /** False only while no note can be NONE: clearMiss then has nothing to look for. */
    private static boolean mayNone;
    private static final char SEP = '\t';

    private static File noteFile() {
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) return null;
        File d = c.getCacheDir();
        // NOT inside ipp_big/, which dir() sweeps
        return d == null ? null : new File(d, "ipp_bigcover.txt");
    }

    private static synchronized void noteLoad() {
        if (notesLoaded) return;
        notesLoaded = true;
        try {
            File f = noteFile();
            if (f == null || !f.exists()) return;
            FileInputStream in = new FileInputStream(f);
            byte[] b = new byte[in.available()];
            in.read(b);
            in.close();
            String[] lines = new String(b, "UTF-8").split("\n");
            for (int i = 0; i < lines.length; i++) {
                String s = lines[i];
                int t = s.indexOf(SEP);
                if (t <= 0) continue;
                try {
                    Integer v = Integer.valueOf(s.substring(t + 1).trim());
                    notes.put(s.substring(0, t), v);
                    if (v.intValue() == NONE) mayNone = true;
                } catch (Throwable e) {
                }
            }
        } catch (Throwable t) {
        }
    }

    /** Written from a snapshot, outside the class lock: the main thread asks notes meanwhile. */
    private static void noteSave() {
        Object[] ks, vs;
        synchronized (BigCover.class) {
            if (!notesDirty) return;
            notesDirty = false;
            ks = notes.keySet().toArray();
            vs = notes.values().toArray();
        }
        boolean ok = false;
        synchronized (NOTE_FILE) {
            try {
                File f = noteFile();
                if (f != null) {
                    // streamed: the whole file built as one String was ~2.5 MB of garbage per
                    // note, a run of stop-everything collections at every first open of a track
                    File tmp = new File(f.getPath() + ".tmp");
                    java.io.Writer w = new java.io.BufferedWriter(
                            new java.io.OutputStreamWriter(new FileOutputStream(tmp), "UTF-8"), 8192);
                    try {
                        for (int i = 0; i < ks.length; i++) {
                            String k = (String) ks[i];
                            if (k == null || k.indexOf(SEP) >= 0) continue;
                            w.write(k);
                            w.write(SEP);
                            w.write(String.valueOf(((Integer) vs[i]).intValue()));
                            w.write('\n');
                        }
                    } finally {
                        w.close();
                    }
                    ok = tmp.renameTo(f);
                }
            } catch (Throwable t) {
            }
        }
        if (!ok) {
            synchronized (BigCover.class) {
                notesDirty = true;
            }
        }
    }

    private static final Object NOTE_FILE = new Object();

    // A new note outside a pass is written once the notes stop coming: per note it was the whole
    // file (~400 KB) per track read. A process that dies meanwhile loses only those notes, and
    // their tracks are read again.
    private static final long SAVE_DELAY_MS = 5000L;
    private static long lastNote;
    private static boolean saveAsked;

    private static synchronized void askSave() {
        lastNote = SystemClock.uptimeMillis();
        if (saveAsked) return;
        saveAsked = true;
        Albums.later(new Save(), SAVE_DELAY_MS);
    }

    static final class Save implements Runnable {
        public void run() {
            long wait;
            synchronized (BigCover.class) {
                wait = SAVE_DELAY_MS - (SystemClock.uptimeMillis() - lastNote);
                if (wait <= 0) saveAsked = false;
            }
            if (wait > 0) {
                Albums.later(this, wait);
                return;
            }
            noteSave();
        }
    }

    private static synchronized int note(String path) {
        if (path == null) return UNKNOWN;
        noteLoad();
        Object o = notes.get(path);
        return o == null ? UNKNOWN : ((Integer) o).intValue();
    }

    /** Saved a few seconds after the last new note outside a pass, once at a pass's end. */
    private static synchronized void noteSet(String path, int value) {
        if (path == null) return;
        noteLoad();
        Object had = notes.put(path, Integer.valueOf(value));
        if (value == NONE) mayNone = true;
        if (had != null && ((Integer) had).intValue() == value) return;
        notesDirty = true;
        if (!passing) askSave();
    }

    private static synchronized void noteForget(String key) {
        noteLoad();
        boolean had = notes.remove(key) != null;
        if (notes.remove(SIG + key) != null) had = true;
        if (had) { notesDirty = true; if (forgetting == 0) noteSave(); }
    }

    // a batch of forgets writes the notes once, at its end, not the whole file per forget
    private static int forgetting;

    public static synchronized void beginForget() {
        forgetting++;
    }

    public static synchronized void endForget() {
        if (forgetting > 0) forgetting--;
        if (forgetting == 0 && !passing) noteSave();
    }

    /** {@link #clearMiss} on disk. */
    private static synchronized void noteForgetNone() {
        noteLoad();
        if (!mayNone) return;
        ArrayList drop = new ArrayList();
        Iterator it = notes.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry e = (Map.Entry) it.next();
            if (((String) e.getKey()).startsWith(SIG)) continue;
            if (((Integer) e.getValue()).intValue() == NONE) drop.add(e.getKey());
        }
        mayNone = false;
        if (drop.isEmpty()) return;
        for (int i = 0; i < drop.size(); i++) notes.remove(drop.get(i));
        notesDirty = true;
        noteSave();
    }

    // The representative's SOURCE bytes, as a checksum beside the notes. A re-compressed JPEG
    // never decodes back to its source's pixels, so without it every track compared against a
    // representative read off the disk gets a file of its own.

    private static final String SIG = "\u0001";

    private static int sig(byte[] raw) {
        CRC32 c = new CRC32();
        c.update(raw, 0, raw.length);
        return (int) c.getValue() ^ raw.length;
    }

    private static synchronized void sigSet(String folder, byte[] raw) {
        if (folder == null || raw == null) return;
        noteLoad();
        Integer v = Integer.valueOf(sig(raw));
        if (v.equals(notes.put(SIG + folder, v))) return;
        notesDirty = true;
        if (!passing) askSave();
    }

    private static synchronized boolean sigIs(String folder, byte[] raw) {
        if (folder == null || raw == null) return false;
        noteLoad();
        Object had = notes.get(SIG + folder);
        return had != null && ((Integer) had).intValue() == sig(raw);
    }

    private static synchronized void noteClear() {
        notes.clear();
        mayNone = false;
        notesLoaded = true;
        notesDirty = false;
        try {
            File f = noteFile();
            if (f != null && f.exists()) f.delete();
        } catch (Throwable t) {
        }
    }

    static final class Src {
        Bitmap bmp;                            // the capped, centre-cropped square
        byte[] raw;                            // the source file's own bytes, untouched
    }

    /** A file that did not read: neither a cover nor "no cover", so nothing is written down. */
    private static final Src UNREAD = new Src();

    /**
     * A track's artwork — the tag first, then the external {@code cover.*}/{@code folder.*} —
     * keeping the BYTES: they decide whether it needs re-compressing at all.
     */
    private static Src read(String path) {
        Meta.Info i = Meta.read(path, true);
        byte[] raw = i.art != null && i.art.length > 0 ? i.art : external(path);
        if (raw == null || raw.length == 0) return i.ok ? null : UNREAD;
        Bitmap bmp = capped(raw);
        if (bmp == null) return null;
        Src s = new Src();
        s.bmp = bmp;
        s.raw = raw;
        return s;
    }

    private static byte[] readAll(File f) throws IOException {
        long n = f.length();
        if (n <= 0 || n > 8 * 1024 * 1024) return null;      // a cover file, not an archive
        byte[] b = new byte[(int) n];
        FileInputStream in = new FileInputStream(f);
        try {
            int off = 0;
            while (off < b.length) {
                int r = in.read(b, off, b.length - off);
                if (r < 0) return null;
                off += r;
            }
        } finally {
            in.close();
        }
        return b;
    }

    /** Decode at or above {@link #SIZE}, then centre-crop the largest square, capped at SIZE. */
    private static Bitmap capped(byte[] raw) {
        try {
            BitmapFactory.Options o = new BitmapFactory.Options();
            o.inJustDecodeBounds = true;
            BitmapFactory.decodeByteArray(raw, 0, raw.length, o);
            if (o.outWidth <= 0 || o.outHeight <= 0) return null;
            o.inSampleSize = Art.sample(o.outWidth, o.outHeight, SIZE, SIZE);
            o.inJustDecodeBounds = false;
            Bitmap b = BitmapFactory.decodeByteArray(raw, 0, raw.length, o);
            return square(b);
        } catch (OutOfMemoryError e) {
            throw e;                               // not an answer about the picture
        } catch (Throwable t) {
            return null;
        }
    }

    /** The largest centred square, cropped at the source's own size up to the cap. */
    private static Bitmap square(Bitmap b) {
        if (b == null) return null;
        int w = b.getWidth();
        int h = b.getHeight();
        if (w == h && w <= SIZE) return b;
        int side = Math.min(w, h);
        if (side <= 0 || side > SIZE) side = SIZE;
        Bitmap sq = Cover.square(b, side);
        return sq == null ? b : sq;
    }

    /** A different resolution is a different picture here. */
    private static boolean same(Bitmap a, Bitmap b) {
        try {
            return a != null && b != null && a.sameAs(b);
        } catch (Throwable t) {
            return false;
        }
    }

    /** False when nothing reached the disk — an encode that ran out of memory included. */
    private static boolean store(String key, Src s, Walk w) {
        return store(key, s, w, true);
    }

    /** {@code keep} false writes the file and leaves memory as it was, for {@link #trackFree}. */
    private static boolean store(String key, Src s, Walk w, boolean keep) {
        try {
            if (s == null || s.bmp == null) return false;
            byte[] out = fit(s, w);
            if (out == null) return false;
            long t0 = System.nanoTime();
            boolean ok = write(key, out);
            if (w != null) w.writeNs += System.nanoTime() - t0;
            if (!ok) return false;
            if (keep) mem.put(key, s.bmp);
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    /** A half-written file is deleted: it would pass for a cover. */
    private static boolean write(String key, byte[] out) {
        File f = null;
        try {
            f = file(key);
            if (f == null) return false;
            FileOutputStream os = new FileOutputStream(f);
            try {
                os.write(out);
            } finally {
                os.close();
            }
            return true;
        } catch (Throwable t) {
            try { if (f != null) f.delete(); } catch (Throwable e) { }
            return false;
        }
    }

    /**
     * A JPEG that fits {@link #LIMIT} verbatim; otherwise the highest quality that fits, by a search
     * that brackets it. On a conflict the QUALITY floor wins over the weight.
     */
    private static byte[] fit(Src s, Walk w) {
        if (s.raw != null && s.raw.length <= LIMIT && isJpeg(s.raw)) return s.raw;

        // A search over [lo, hi] for the highest quality that fits, as a binary search would find
        // it; only the next probe is chosen differently — where the weights seen so far put the
        // limit (ln size is close to linear in ln of libjpeg's table scale, 200 - 2q).
        byte[] best = null;
        byte[] atMin = null;
        int bestQ = 0;
        int lo = Q_MIN;
        int hi = Q_MAX;
        int q = lastQ;
        if (q < Q_MIN || q > Q_MAX) q = (Q_MIN + Q_MAX) >> 1;
        double lnLimit = Math.log(limit());
        double xa = 0, ya = 0, xb = 0, yb = 0;
        int points = 0;
        while (lo <= hi) {
            if (q < lo) q = lo;
            if (q > hi) q = hi;
            byte[] out = encode(s.bmp, q, w);
            if (out == null) break;
            if (out.length <= LIMIT) {
                best = out;
                bestQ = q;
                lo = q + 1;
            } else {
                if (q == Q_MIN) atMin = out;
                hi = q - 1;
            }
            xa = xb;
            ya = yb;
            xb = Math.log(200 - 2 * q);
            yb = Math.log(out.length);
            points++;
            double slope = SLOPE;
            if (points > 1 && xb != xa) {
                double k = (yb - ya) / (xb - xa);
                if (k < 0) slope = k;
            }
            double scale = Math.exp(xb + (lnLimit - yb) / slope);
            int m = (int) Math.ceil(scale);       // ints: a round double literal does not assemble
            q = m >= 200 ? Q_MIN : (200 - m) >> 1;
        }
        byte[] res = best != null ? best : atMin != null ? atMin : encode(s.bmp, Q_MIN, w);
        if (best != null) lastQ = bestQ;
        return res;
    }

    /** d(ln size)/d(ln scale) before two probes have measured it. */
    private static final double SLOPE = -0.6;

    /** Not a compile-time constant, which would fold into a round double literal. */
    private static int limit() {
        return LIMIT;
    }

    /** The quality the last re-encoded cover settled on; shared by the workers, only a guess. */
    private static volatile int lastQ;

    private static byte[] encode(Bitmap b, int quality, Walk w) {
        long t0 = System.nanoTime();
        try {
            ByteArrayOutputStream out = new ByteArrayOutputStream(LIMIT);
            b.compress(Bitmap.CompressFormat.JPEG, quality, out);
            return out.toByteArray();
        } catch (Throwable t) {
            return null;
        } finally {
            if (w != null) { w.probes++; w.encodeNs += System.nanoTime() - t0; }
        }
    }

    /** SOI + the start of the first marker. */
    private static boolean isJpeg(byte[] b) {
        return b.length > 3 && (b[0] & 0xFF) == 0xFF && (b[1] & 0xFF) == 0xD8 && (b[2] & 0xFF) == 0xFF;
    }

    private static File file(String key) {
        File d = dir();
        if (d == null) return null;
        return new File(d, name(key));
    }

    private static String name(String key) {
        return Integer.toHexString(key.hashCode()) + "-" + key.length() + SUFFIX;
    }

    /**
     * Covers and notes of no path or folder in {@code keep} ({@link Stale.Keys#of}): their weight,
     * gone when {@code drop}.
     */
    static long prune(Stale.Keys keep, Set folders, boolean drop) {
        return Stale.files(dir(), keep, SUFFIX, false, drop) + pruneNotes(keep, folders, drop);
    }

    private static synchronized long pruneNotes(Stale.Keys keep, Set folders, boolean drop) {
        noteLoad();
        long n = 0L;
        ArrayList gone = new ArrayList();
        Iterator it = notes.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry e = (Map.Entry) it.next();
            String k = (String) e.getKey();
            boolean live = k.startsWith(SIG) ? folders.contains(k.substring(SIG.length()))
                    : keep.has(Stale.Keys.of(k));
            if (live) continue;
            gone.add(k);
            n += Stale.line(k, String.valueOf(e.getValue()));
        }
        if (drop && !gone.isEmpty()) {
            for (int i = 0; i < gone.size(); i++) notes.remove(gone.get(i));
            notesDirty = true;
            noteSave();
        }
        return n;
    }

    private static File dir() {
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) return null;
        File cache = c.getCacheDir();
        if (cache == null) return null;
        File d = new File(cache, "ipp_big");
        if (!d.exists()) d.mkdirs();
        if (!swept) {
            swept = true;
            try {
                File[] fs = d.listFiles();
                if (fs != null) {
                    for (int i = 0; i < fs.length; i++) {
                        if (!fs[i].getName().endsWith(SUFFIX)) fs[i].delete();
                    }
                }
            } catch (Throwable t) {
            }
        }
        return d;
    }
}
