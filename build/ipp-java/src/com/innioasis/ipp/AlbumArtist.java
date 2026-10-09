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
 * The ALBUM ARTIST tag, cached per album in {@code ipp_albumartist.txt} (filled by row workers and
 * "Cache library"). It is one deliberate value — "Various Artists" is not two artists — so it is
 * never split and no setting rewrites it.
 */
public final class AlbumArtist {

    private AlbumArtist() { }

    /** album key -> album artist; "" means "read, the file has none". Missing = never read. */
    private static final HashMap map = new HashMap();
    private static boolean loaded;
    private static boolean dirty;

    private static final char SEP = '\t';

    /** Bumped on every changed answer, so Album Artists knows when to regroup. */
    private static int gen;

    public static synchronized int gen() {
        return gen;
    }

    private static File file() {
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) return null;
        File d = c.getCacheDir();
        return d == null ? null : new File(d, "ipp_albumartist.txt");
    }

    private static synchronized void load() {
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
        }
    }

    /** Reads the file now, off the main thread, so that no row waits for it. */
    public static synchronized void warm() {
        load();
    }

    private static synchronized void save() {
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
        }
    }

    /** The tag, "" when the file has none, null when never read. */
    public static String get(String key) {
        if (key == null) return null;
        String k = Albums.coverKey(key);
        synchronized (AlbumArtist.class) {
            load();
            return (String) map.get(k);
        }
    }

    public static boolean needsRead(String key) {
        return key != null && get(key) == null;
    }

    /** Remembers "" too, so an album without the tag is not re-read per bind. Not on the UI thread. */
    public static String read(String key, String path) {
        if (key == null) return "";
        String cached = get(key);
        if (cached != null) return cached;
        // Outside the lock: the UI thread calls get() meanwhile.
        String v = "";
        if (path != null) {
            String s = Meta.read(path, false).albumArtist;
            if (s != null) v = s.trim();
        }
        put(key, v);
        return v;
    }

    /** A tag the caller already read ("Cache library" opens each file once for all caches). */
    public static void put(String key, String tag) {
        if (key == null) return;
        String k = Albums.coverKey(key);
        String v = tag == null ? "" : tag.trim();
        synchronized (AlbumArtist.class) {
            load();
            if (v.equals(map.put(k, v))) return;
            dirty = true;
            gen++;
        }
    }

    public static String readAndSave(String key, String path) {
        String v = read(key, path);
        save();
        return v;
    }

    public static void flush() {
        save();
    }

    public static void forget(String key) {
        if (key == null) return;
        String k = Albums.coverKey(key);
        synchronized (AlbumArtist.class) {
            load();
            if (map.remove(k) != null) { dirty = true; gen++; save(); }
        }
    }

    public static synchronized void clear() {
        map.clear();
        loaded = false;
        dirty = false;
        gen++;
        try {
            File f = file();
            if (f != null && f.exists()) f.delete();
        } catch (Throwable t) {
        }
    }

    /**
     * An album row's artist line: exactly the name it is filed under in Album Artists
     * ({@link AlbumArtists#of}), so no setting may touch it.
     */
    public static String line(String key, String tagArtist) {
        return AlbumArtists.of(get(key), tagArtist);
    }
}
