package com.innioasis.ipp;

import android.content.Context;

import com.innioasis.y1.Y1Application;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * The ALBUM ARTIST tag of an album, for the artist line under an album's name.
 *
 * Why a tag read at all
 * The album list has always shown the artist of the album's first song, which is wrong the
 * moment the album has guests on some tracks or is a compilation — and it is the tag that says what
 * the album as a whole is by. API 17's {@code MediaMetadataRetriever} does declare
 * {@code METADATA_KEY_ALBUMARTIST}, so it can simply be asked; if this device's extractor does not
 * fill it, every album answers "" and the list looks exactly as it did before.
 *
 * Why a cache, and how big
 * Reading it means opening the file's metadata, so the answer is remembered — one entry per
 * ALBUM (like the release year), not one per song the way track numbers are. The file lives beside
 * the other caches in the app's cache dir, so "Clear cache" wipes it with the rest, and
 * "Cache library" fills it in the same pass that fills the covers.
 *
 * What the toggle does and does not touch
 * "Show only the first artist" splits a multi-artist tag — it must not touch an album artist,
 * which is a single deliberate value ("Various Artists" is not two artists). So {@link #line} uses
 * the album artist as it stands and only falls back to {@link Feat#artist} when there is none.
 *
 * Raw (non-generic) types throughout: the bundled d8 crashes dexing generic Signature attrs.
 */
public final class AlbumArtist {

    private AlbumArtist() { }

    /** album key -> album artist; "" means "read, the file has none". Missing = never read. */
    private static final HashMap map = new HashMap();
    private static boolean loaded;
    private static boolean dirty;

    private static final char SEP = '\t';

    private static File file() {
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) return null;
        File d = c.getCacheDir();
        return d == null ? null : new File(d, "ipp_albumartist.txt");
    }

    private static void load() {
        if (loaded) return;
        loaded = true;
        try {
            File f = file();
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
                map.put(s.substring(0, t), s.substring(t + 1));
            }
        } catch (Throwable t) {
            // an unreadable cache is an empty cache
        }
    }

    private static void save() {
        if (!dirty) return;
        try {
            File f = file();
            if (f == null) return;
            StringBuilder sb = new StringBuilder();
            Iterator it = map.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry e = (Map.Entry) it.next();
                String k = (String) e.getKey();
                String v = (String) e.getValue();
                if (k == null || v == null || k.indexOf(SEP) >= 0 || v.indexOf('\n') >= 0) continue;
                sb.append(k).append(SEP).append(v).append('\n');
            }
            FileOutputStream o = new FileOutputStream(f);
            o.write(sb.toString().getBytes("UTF-8"));
            o.close();
            dirty = false;
        } catch (Throwable t) {
            // keep the value in memory for this run
        }
    }

    /** The cached album artist: the tag, "" when the file has none, null when never read. */
    public static String get(String key) {
        if (key == null) return null;
        load();
        return (String) map.get(Albums.coverKey(key));
    }

    /** True while this album's tag has not been looked at yet — i.e. it is worth a background read. */
    public static boolean needsRead(String key) {
        return key != null && get(key) == null;
    }

    /**
     * Read the tag off the album's representative track and remember the answer, "" included —
     * an album with no album artist must not be re-read on every bind. Never call from the UI
     * thread: this opens the file's metadata.
     */
    public static String read(String key, String path) {
        if (key == null) return "";
        load();
        // same key for the same album whichever screen asked -- see Albums.coverKey
        key = Albums.coverKey(key);
        String cached = (String) map.get(key);
        if (cached != null) return cached;
        String v = "";
        if (path != null) {
            String s = Meta.read(path, false).albumArtist;
            if (s != null) v = s.trim();
        }
        map.put(key, v);
        dirty = true;
        return v;
    }

    /** Read + write the file straight away; for the one-album-at-a-time background path. */
    /**
     * Record one album's ALBUM ARTIST from a tag the caller has already read — "Cache library"
     * takes the album artist, the year and the thumbnail out of a single {@code setDataSource}, and
     * asking each cache to open the file for itself was three opens per album. A null tag is stored
     * as {@code ""} ("read, this album has none"), which is what stops it being read again.
     */
    public static void put(String key, String tag) {
        if (key == null) return;
        load();
        map.put(Albums.coverKey(key), tag == null ? "" : tag.trim());
        dirty = true;
    }

    public static String readAndSave(String key, String path) {
        String v = read(key, path);
        save();
        return v;
    }

    /** Write out what a batch of {@link #read} calls collected ("Cache library"). */
    public static void flush() {
        save();
    }

    /**
     * One album's tag has been re-read from disk ("Update library" → {@code Ipp.songChanged}), so
     * the remembered answer may be out of date.
     */
    public static void forget(String key) {
        if (key == null) return;
        load();
        if (map.remove(Albums.coverKey(key)) != null) { dirty = true; save(); }
    }

    public static void clear() {
        map.clear();
        loaded = false;
        dirty = false;
        try {
            File f = file();
            if (f != null && f.exists()) f.delete();
        } catch (Throwable t) {
            // ignore
        }
    }

    /**
     * The artist line of an album row: the album artist when the file has one, otherwise the
     * track's own artist tag put through the "Show only the first artist" setting (which knows
     * about the "; "-over-", " priority and the comma_artists.txt exceptions).
     *
     * {@link Feat#first}, not {@code Feat.artist} — this line is shown as the tag is written, so
     * the "; " -> ", " substitution is deliberately not applied to it. It is the one artist line that
     * is not an artist of the library: it never becomes a row of the Artists list and is never
     * split, so there is nothing here for that substitution to make consistent.
     */
    public static String line(String key, String tagArtist) {
        String aa = get(key);
        if (aa != null && aa.length() > 0) return aa;
        return Feat.first(tagArtist);
    }
}
