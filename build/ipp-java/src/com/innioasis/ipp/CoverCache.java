package com.innioasis.ipp;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Hashtable;

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
        return new File(d, Integer.toHexString(key.hashCode()) + "-" + key.length() + "-50q.jpg");
    }

    private static void remember(String key, Bitmap b) {
        if (b == null) {
            miss.put(key, key);
        } else {
            mem.put(key, b);
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
            remember(album, null);
            return null;
        }
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
        }
        remember(album, out);
        return out;
    }

    /** One album, everywhere: for REPLACED art, which {@link #clearMiss} does not reach. */
    public static void forget(String album) {
        if (album == null) {
            return;
        }
        mem.remove(album);
        miss.remove(album);
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
        miss.clear();
    }

    public static void clear() {
        mem.clear();
        miss.clear();
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
