package com.innioasis.ipp;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Handler;
import android.os.HandlerThread;

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
import java.util.Hashtable;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
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
        if (path == null) return null;
        Bitmap hit = peekTrack(path);
        if (hit != null) return hit;
        if (miss.containsKey(path)) return null;

        // the prefetch and the player's own load: the second finds the answer in memory
        synchronized (LOCK) {
            hit = peekTrack(path);
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

            Bitmap rep = peek(folder);
            if (rep == null) {
                store(folder, src);
                sigSet(folder, src.raw);
                mem.put(path, fresh);
                noteSet(path, SHARED);
                return fresh;
            }
            if (sigIs(folder, src.raw) || same(rep, fresh)) {
                mem.put(path, rep);
                noteSet(path, SHARED);
                return rep;
            }
            store(path, src);
            mem.put(path, fresh);
            noteSet(path, OWN);
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

    /** Drop one key everywhere — memory, miss, note, JPEG ({@code Ipp.songChanged}). */
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

    /** This track's cover has never been looked at. */
    public static boolean needs(String path) {
        return note(path) == UNKNOWN;
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
     */
    public static void cache(Walk w, String path, byte[] embedded) {
        if (path == null || w == null) return;
        try {
            if (note(path) != UNKNOWN) return;
            String folder = Albums.trackFolder(path);
            if (w.folder != null && !w.folder.equals(folder)) w.done();
            w.folder = folder;

            byte[] raw = embedded != null && embedded.length > 0 ? embedded : external(path);
            if (raw == null || raw.length == 0) { noteSet(path, NONE); return; }

            // nearly every track: the same bytes as the representative, nothing decoded
            if (w.raw != null && Arrays.equals(w.raw, raw)) {
                noteSet(path, SHARED);
                return;
            }

            if (w.raw == null && w.rep == null) {
                File had = file(folder);
                if (had != null && had.exists() && sigIs(folder, raw)) {
                    w.raw = raw;
                    noteSet(path, SHARED);
                    return;
                }
                Bitmap onDisk = peek(folder);
                if (onDisk == null) {
                    w.rep = storeSrc(folder, raw);
                    w.raw = raw;
                    sigSet(folder, raw);
                    noteSet(path, SHARED);
                    return;
                }
                w.rep = onDisk;
            }

            Bitmap fresh = capped(raw);
            if (fresh == null) { noteSet(path, NONE); return; }
            if (w.rep == null) w.rep = capped(w.raw);
            if (same(w.rep, fresh)) {
                // these bytes stand for the representative from now on: starts the byte path
                if (w.raw == null) w.raw = raw;
                noteSet(path, SHARED);
            } else {
                Src src = new Src();
                src.bmp = fresh;
                src.raw = raw;
                store(path, src);
                mem.remove(path);
                noteSet(path, OWN);
            }
        } catch (Throwable t) {
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

    /** Store a representative during a pass; null = stored verbatim, nothing decoded. */
    private static Bitmap storeSrc(String key, byte[] raw) {
        if (raw.length <= LIMIT && isJpeg(raw)) {
            write(key, raw);
            return null;
        }
        Bitmap b = capped(raw);
        if (b == null) return null;
        Src s = new Src();
        s.bmp = b;
        s.raw = raw;
        store(key, s);
        mem.remove(key);
        return b;
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
                    notes.put(s.substring(0, t), Integer.valueOf(s.substring(t + 1).trim()));
                } catch (Throwable e) {
                }
            }
        } catch (Throwable t) {
        }
    }

    private static synchronized void noteSave() {
        if (!notesDirty) return;
        try {
            File f = noteFile();
            if (f == null) return;
            StringBuilder sb = new StringBuilder();
            Iterator it = notes.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry e = (Map.Entry) it.next();
                String k = (String) e.getKey();
                if (k == null || k.indexOf(SEP) >= 0) continue;
                sb.append(k).append(SEP).append(((Integer) e.getValue()).intValue()).append('\n');
            }
            FileOutputStream o = new FileOutputStream(f);
            o.write(sb.toString().getBytes("UTF-8"));
            o.close();
            notesDirty = false;
        } catch (Throwable t) {
        }
    }

    private static synchronized int note(String path) {
        if (path == null) return UNKNOWN;
        noteLoad();
        Object o = notes.get(path);
        return o == null ? UNKNOWN : ((Integer) o).intValue();
    }

    /** Saved at once outside a pass (the process can die any time), once at a pass's end. */
    private static synchronized void noteSet(String path, int value) {
        if (path == null) return;
        noteLoad();
        Object had = notes.put(path, Integer.valueOf(value));
        if (had != null && ((Integer) had).intValue() == value) return;
        notesDirty = true;
        if (!passing) noteSave();
    }

    private static synchronized void noteForget(String key) {
        noteLoad();
        boolean had = notes.remove(key) != null;
        if (notes.remove(SIG + key) != null) had = true;
        if (had) { notesDirty = true; noteSave(); }
    }

    /** {@link #clearMiss} on disk. */
    private static synchronized void noteForgetNone() {
        noteLoad();
        ArrayList drop = new ArrayList();
        Iterator it = notes.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry e = (Map.Entry) it.next();
            if (((String) e.getKey()).startsWith(SIG)) continue;
            if (((Integer) e.getValue()).intValue() == NONE) drop.add(e.getKey());
        }
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
        if (!passing) noteSave();
    }

    private static synchronized boolean sigIs(String folder, byte[] raw) {
        if (folder == null || raw == null) return false;
        noteLoad();
        Object had = notes.get(SIG + folder);
        return had != null && ((Integer) had).intValue() == sig(raw);
    }

    private static synchronized void noteClear() {
        notes.clear();
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

    private static void store(String key, Src s) {
        try {
            if (s == null || s.bmp == null) return;
            byte[] out = fit(s);
            if (out == null) return;
            if (write(key, out)) mem.put(key, s.bmp);
        } catch (Throwable t) {
        }
    }

    private static boolean write(String key, byte[] out) {
        try {
            File f = file(key);
            if (f == null) return false;
            FileOutputStream os = new FileOutputStream(f);
            try {
                os.write(out);
            } finally {
                os.close();
            }
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    /**
     * A JPEG that fits {@link #LIMIT} verbatim; otherwise the highest quality that fits, by binary
     * search. On a conflict the QUALITY floor wins over the weight.
     */
    private static byte[] fit(Src s) {
        if (s.raw != null && s.raw.length <= LIMIT && isJpeg(s.raw)) return s.raw;

        byte[] best = null;
        int lo = Q_MIN;
        int hi = Q_MAX;
        while (lo <= hi) {
            int mid = (lo + hi + 1) >> 1;
            byte[] out = encode(s.bmp, mid);
            if (out == null) break;
            if (out.length <= LIMIT) {
                best = out;
                lo = mid + 1;
            } else {
                hi = mid - 1;
            }
        }
        return best != null ? best : encode(s.bmp, Q_MIN);
    }

    private static byte[] encode(Bitmap b, int quality) {
        try {
            ByteArrayOutputStream out = new ByteArrayOutputStream(LIMIT);
            b.compress(Bitmap.CompressFormat.JPEG, quality, out);
            return out.toByteArray();
        } catch (Throwable t) {
            return null;
        }
    }

    /** SOI + the start of the first marker. */
    private static boolean isJpeg(byte[] b) {
        return b.length > 3 && (b[0] & 0xFF) == 0xFF && (b[1] & 0xFF) == 0xD8 && (b[2] & 0xFF) == 0xFF;
    }

    private static File file(String key) {
        File d = dir();
        if (d == null) return null;
        return new File(d, Integer.toHexString(key.hashCode()) + "-" + key.length() + SUFFIX);
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
