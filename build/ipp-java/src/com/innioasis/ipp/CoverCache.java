package com.innioasis.ipp;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Hashtable;

import com.innioasis.y1.Y1Application;

/**
 * The 50px thumbnail of an album row: in memory, and as a JPEG under {@code ipp_covers/}.
 *
 * <p>Three parts, and the middle one is the easy one to lose: {@code mem} holds the bitmaps,
 * {@code miss} holds the albums we have already established have no artwork at all, and the folder
 * holds the JPEGs. Without {@code miss} an album with no cover is re-read on every bind; because of
 * it, artwork added later would never be noticed — which is why {@link #clearMiss()} exists and is
 * called from {@code Ipp.libraryChanged}, i.e. from every point that writes the Song table.
 *
 * <p>Both maps are raw {@code Hashtable}s: {@code Hashtable} because the drawing thread reads them
 * while background readers write, raw because a generic field type makes javac emit a class
 * {@code Signature} attribute and the bundled d8 crashes dexing those.
 *
 * <p>This cache and {@code BigCover} are independent and both read the ORIGINAL — a thumbnail is
 * never made from the 300px JPEG, so there is no second compression anywhere.
 */
public final class CoverCache {

    private static final Hashtable mem = new Hashtable();
    private static final Hashtable miss = new Hashtable();
    private static boolean swept;

    /**
     * The cache folder, created on demand and swept once per run.
     *
     * <p>The quality is not part of a file name, so a changed encoding scheme would be invisible
     * until every entry happened to be rewritten. The suffix carries it instead ({@code -50q.jpg}),
     * and everything that does not end in the current one is deleted here — so bumping the suffix
     * retires the old files by itself instead of the user being told to clear the cache.
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

    /** Hash plus length: short, collision-shy enough for this, and safe as a file name. */
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
     * The thumbnail if it is already known — memory, then the JPEG on disk. Never reads a tag, so
     * it is what the bind calls.
     *
     * <p>ipp: the key is canonicalised — the Genres screen puts PLAIN album names in the same
     * {@code AlbumListAdapter} the Albums screen fills with folder-encoded ones (#291.3), so
     * entering All Albums under a genre decoded and re-wrote every thumbnail the Albums screen had
     * already cached. {@link Albums#coverKey} returns an encoded name untouched.
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

    /** The thumbnail, reading and storing it if it is not cached yet. Key as in {@link #peek}. */
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
            // ipp: the album thumbnail is Art.thumb, not Other.getAlbumCover — it takes the ALBUM
            // key as well as the song, because a song pinned via "Set as album thumbnail" must win
            // outright: the pick changes which SONG is read, and the automatic order
            // (folder.* > cover.* > embedded, the reverse of a track's own cover) would answer from
            // the folder before ever reaching it. Reached on a cache miss only, so the drawing path
            // is untouched and an album with no pick behaves exactly as before.
            Bitmap raw = Art.thumb(album, songPath, 50);
            if (raw != null) {
                out = Cover.square(raw, 50);
                if (out == null) {
                    out = raw;
                }
                File f = file(album);
                if (f != null) {
                    FileOutputStream os = new FileOutputStream(f);
                    // ipp: JPEG quality 85, was 60. At 50 px one 8x8 block is a sixth of the
                    // picture, so the usual "60 is plenty" intuition does not hold — the artefacts
                    // are the size of the artwork's features. 85 here is libjpeg's scale; it is
                    // roughly Photoshop's 80, which is what was asked for (Android compresses with
                    // the standard quantisation tables, Photoshop with gentler ones of its own, so
                    // the same number is a different picture). The file is ~2-3 KB either way at
                    // this size. Read from the ORIGINAL, not from BigCover's JPEG (Art.thumb goes
                    // to the external file or the tag), so there is no second compression to blame.
                    // The file suffix carries a "q" since this changed: dir() deletes everything
                    // that does not end with it, so the old files go by themselves.
                    out.compress(Bitmap.CompressFormat.JPEG, 85, os);
                    os.close();
                }
            }
        } catch (Throwable t) {
        }
        remember(album, out);
        return out;
    }

    /**
     * ipp: drop ONE album's cached thumbnail — memory entry, "no cover" answer and the JPEG on disk
     * — so the next lookup re-reads the tags. Needed when a track's artwork is REPLACED:
     * {@link #clearMiss()} only helps where there was no cover at all, since a cached one is still
     * served from mem/disk. Called per song from {@code Ipp.songChanged} (the "Update library" path).
     */
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

    /**
     * ipp: forget only the "this album has no cover" answers, keeping the covers we DID find (mem +
     * the JPEG file cache). Without this, adding artwork to a track that had none was never
     * noticed: the album stayed in {@code miss} for good, so the list thumbnail remained empty even
     * after "Update library", and only wiping the whole cache helped. Called from
     * {@code Ipp.libraryChanged}, i.e. from every point that writes the Song table.
     */
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
