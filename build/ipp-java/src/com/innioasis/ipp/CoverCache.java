package com.innioasis.ipp;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Set;

import com.innioasis.y1.Y1Application;

/**
 * The 50px album-row thumbnail: bitmaps in {@code mem}, JPEGs under {@code ipp_covers/}, and
 * {@code miss} for albums known to have no art — without it they are re-read on every bind, and
 * without {@link #clearMiss} art added later is never seen. Read from the original, never from
 * {@code BigCover}'s JPEG, so nothing is compressed twice.
 */
public final class CoverCache {

    private static final Hashtable mem = new Hashtable();
    private static final Hashtable miss = new Hashtable();
    private static boolean swept;

    static long memBytes() {
        return Diag.bitmapBytes(new java.util.ArrayList(mem.values()));
    }

    /**
     * Swept once per run of every file without the current suffix ({@code -50q.jpg}), so changing
     * the suffix retires old encodings by itself.
     */
    private static File dir() {
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) {
            return null;
        }
        File cache = c.getCacheDir();
        if (cache == null) {
            return null;
        }
        File d = new File(cache, "ipp_covers");
        if (!d.exists()) {
            d.mkdirs();
        }
        if (!swept) {
            swept = true;
            try {
                File[] fs = d.listFiles();
                if (fs != null) {
                    for (int i = 0; i < fs.length; i++) {
                        if (!fs[i].getName().endsWith("-50q.jpg")) {
                            fs[i].delete();
                        }
                    }
                }
            } catch (Throwable t) {
            }
        }
        return d;
    }

    /** Hash plus length: short, and safe as a file name. */
    private static File file(String key) {
        File d = dir();
        if (d == null) {
            return null;
        }
        return new File(d, name(key));
    }

    private static String name(String key) {
        return Integer.toHexString(key.hashCode()) + "-" + key.length() + "-50q.jpg";
    }

    /** Thumbnails of albums no song carries any more: their weight, and gone when {@code drop}. */
    static long prune(Set albums, boolean drop) {
        HashSet keep = new HashSet();
        Iterator it = albums.iterator();
        while (it.hasNext()) keep.add(name((String) it.next()));
        if (drop) {
            loadMiss();
            boolean gone = false;
            synchronized (miss) {
                Iterator m = miss.keySet().iterator();
                while (m.hasNext()) {
                    if (!albums.contains(m.next())) {
                        m.remove();
                        gone = true;
                    }
                }
            }
            if (gone) askSave();
        }
        return Stale.files(dir(), keep, drop);
    }

    private static void remember(String key, Bitmap b) {
        remember(key, b, true);
    }

    /** {@code kept}: a "no cover" that was read, not one a failure left — only that one is saved. */
    private static void remember(String key, Bitmap b, boolean kept) {
        if (b != null) {
            mem.put(key, b);
            return;
        }
        loadMiss();
        if (miss.put(key, key) == null && kept && key.indexOf('\n') < 0) askSave();
    }

    /** Written once the answers stop coming, on the library's thread: never while a list scrolls. */
    private static void askSave() {
        boolean ask;
        synchronized (SAVE) {
            missDirty = true;
            lastMiss = android.os.SystemClock.uptimeMillis();
            ask = !saveAsked;
            saveAsked = true;
        }
        if (ask) Albums.later(new Save(), SAVE_DELAY_MS);
    }

    // "No cover" outlives the process: the first pass after a boot would otherwise read every
    // coverless album again. Dropped by every real write to the library and after a USB session
    // (Scan.keepsMisses), never by the clean scan of a boot. The bind asks loadMiss on every row,
    // so neither it nor the save may take a lock the main thread waits on.
    private static volatile boolean missLoaded;
    private static volatile boolean missDirty;
    private static boolean saveAsked;
    private static long lastMiss;
    private static final long SAVE_DELAY_MS = 5000L;
    private static final Object SAVE = new Object();

    private static File missFile() {
        Context c = Y1Application.Companion.getAppContext();
        File d = c == null ? null : c.getCacheDir();
        // NOT inside ipp_covers/, which dir() sweeps
        return d == null ? null : new File(d, "ipp_covers_none.txt");
    }

    /** Once per process; from the library's preparation, so the first row does not wait for it. */
    static void loadMiss() {
        if (missLoaded) return;
        synchronized (CoverCache.class) {
            if (missLoaded) return;
            missLoaded = true;
            try {
                File f = missFile();
                if (f == null || !f.exists()) return;
                FileInputStream in = new FileInputStream(f);
                byte[] b = new byte[(int) f.length()];
                int got = 0;
                while (got < b.length) {
                    int n = in.read(b, got, b.length - got);
                    if (n < 0) break;
                    got += n;
                }
                in.close();
                String[] keys = new String(b, 0, got, "UTF-8").split("\n");
                for (int i = 0; i < keys.length; i++) {
                    if (keys[i].length() == 0) continue;
                    String k = unpack(keys[i]);
                    miss.put(k, k);
                }
            } catch (Throwable t) {
            }
        }
    }

    // On disk a folder-encoded key drops the "/storage/" every path starts with and keeps the
    // volume ("sdcard0/…"): a second volume must stay apart. A line still holding the full path
    // reads as it is.
    private static final char SEP = (char) 1;
    private static final String ROOT = "/storage/";

    private static String pack(String key) {
        int s = key.indexOf(SEP);
        if (s < 0 || !key.startsWith(ROOT, s + 1)) return key;
        return key.substring(0, s + 1) + key.substring(s + 1 + ROOT.length());
    }

    private static String unpack(String line) {
        int s = line.indexOf(SEP);
        if (s < 0 || s + 1 >= line.length() || line.charAt(s + 1) == '/') return line;
        return line.substring(0, s + 1) + ROOT + line.substring(s + 1);
    }

    static final class Save implements Runnable {
        public void run() {
            synchronized (SAVE) {
                long quiet = android.os.SystemClock.uptimeMillis() - lastMiss;
                if (quiet < SAVE_DELAY_MS) {
                    Albums.later(this, SAVE_DELAY_MS - quiet);
                    return;
                }
                saveAsked = false;
            }
            saveMiss();
        }
    }

    private static void saveMiss() {
        synchronized (FILE) {
            saveLocked();
        }
    }

    private static final Object FILE = new Object();

    private static void saveLocked() {
        if (!missDirty) return;
        missDirty = false;
        try {
            File f = missFile();
            if (f == null) return;
            Object[] keys;
            synchronized (miss) {
                keys = miss.keySet().toArray();
            }
            if (keys.length == 0) {
                f.delete();
                return;
            }
            // streamed through a small buffer: the whole file as one string is ~1.5 MB of garbage
            // and a collection that stops every thread, the main one included
            File tmp = new File(f.getPath() + ".tmp");
            java.io.Writer w = new java.io.BufferedWriter(new java.io.OutputStreamWriter(
                    new FileOutputStream(tmp), "UTF-8"), 8192);
            try {
                for (int i = 0; i < keys.length; i++) {
                    String k = (String) keys[i];
                    if (k.indexOf('\n') >= 0) continue;
                    w.write(pack(k));
                    w.write('\n');
                }
            } finally {
                w.close();
            }
            if (!tmp.renameTo(f)) tmp.delete();
        } catch (Throwable t) {
        }
    }

    /**
     * Memory, then disk; never reads a tag, so the bind calls this. The key is canonicalised:
     * Genres feeds plain album names, Albums folder-encoded ones.
     */
    public static Bitmap peek(String album) {
        album = Albums.coverKey(album);
        if (album == null) {
            return null;
        }
        Bitmap b = (Bitmap) mem.get(album);
        if (b != null) {
            return b;
        }
        loadMiss();
        if (miss.containsKey(album)) {
            return null;
        }
        Bitmap out = null;
        try {
            File f = file(album);
            if (f != null && f.exists()) {
                out = BitmapFactory.decodeFile(f.getAbsolutePath());
            }
        } catch (Throwable t) {
            out = null;
        }
        if (out != null) {
            remember(album, out);
        }
        return out;
    }

    /** The album rows' placeholder, as their adapter hands it in: Albums recolours it. */
    static volatile Bitmap rowBlank;

    /**
     * {@link #peek} for an album row: an album known to have no art answers the row's placeholder,
     * not null — null makes the row start a thread that reads the album again on every bind.
     */
    public static Bitmap rowPeek(String album, Bitmap placeholder) {
        rowBlank = placeholder;
        Bitmap b = peek(album);
        if (b != null) return b;
        String key = Albums.coverKey(album);
        return key != null && miss.containsKey(key) ? placeholder : null;
    }

    /** Reads and stores the thumbnail on a miss. Key as in {@link #peek}. */
    public static Bitmap get(String album, String songPath) {
        album = Albums.coverKey(album);
        if (album == null) {
            return null;
        }
        Bitmap out = peek(album);
        if (out != null) {
            return out;
        }
        if (miss.containsKey(album)) {
            return null;
        }
        if (songPath == null) {
            remember(album, null, false);
            return null;
        }
        boolean failed = false;
        try {
            // Takes the album key: a "Set as album thumbnail" pick must beat folder.*/cover.*.
            Bitmap raw = Art.thumb(album, songPath, 50);
            if (raw != null) {
                out = Cover.square(raw, 50);
                if (out == null) {
                    out = raw;
                }
                File f = file(album);
                if (f != null) {
                    FileOutputStream os = new FileOutputStream(f);
                    // At 50 px one 8x8 block is a sixth of the picture; lower quality shows. A
                    // change here needs a new file suffix (see dir()).
                    out.compress(Bitmap.CompressFormat.JPEG, 85, os);
                    os.close();
                }
            }
        } catch (Throwable t) {
            failed = true;
        }
        remember(album, out, !failed);
        return out;
    }

    /** One album, everywhere: for REPLACED art, which {@link #clearMiss} does not reach. */
    public static void forget(String album) {
        if (album == null) {
            return;
        }
        mem.remove(album);
        loadMiss();
        if (miss.remove(album) != null) askSave();
        try {
            File f = file(album);
            if (f != null) {
                f.delete();
            }
        } catch (Throwable t) {
        }
    }

    /** Forgets only the "no cover" answers, keeping the covers found. */
    public static void clearMiss() {
        if (Scan.keepsMisses()) return;
        dropMiss();
    }

    private static void dropMiss() {
        synchronized (CoverCache.class) {
            missLoaded = true;      // the file goes too: nothing left to load
        }
        // under the file's lock: a save under way would otherwise write the dropped answers back
        synchronized (FILE) {
            miss.clear();
            missDirty = false;
            try {
                File f = missFile();
                if (f != null) f.delete();
            } catch (Throwable t) {
            }
        }
    }

    /** The end of a scan that wrote nothing: still dropped when the card was away (USB). */
    static void scanEnded(boolean cardAway) {
        if (cardAway) dropMiss();
    }

    public static void clear() {
        mem.clear();
        dropMiss();
        try {
            File d = dir();
            if (d != null) {
                File[] fs = d.listFiles();
                if (fs != null) {
                    for (int i = 0; i < fs.length; i++) {
                        fs[i].delete();
                    }
                    d.delete();
                }
            }
        } catch (Throwable t) {
        }
    }
}
