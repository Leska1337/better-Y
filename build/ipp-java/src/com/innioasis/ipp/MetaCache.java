package com.innioasis.ipp;

import android.content.Context;

import com.innioasis.y1.Y1Application;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.Map;

/**
 * The tags a file open gives beyond its Song row — album artist, track, disc, year — per path, in
 * {@code ipp_meta.txt}, so that no list opens the file for them. Filled by the scan out of the
 * very open that builds the row, and by every other read {@link Meta} makes. The values are raw,
 * as the tag has them: parsing stays with the cache that asks. Every method takes the class lock,
 * because the scan's workers, the lists and the caching pass all come here at once.
 */
public final class MetaCache {

    private MetaCache() { }

    private static final HashMap map = new HashMap();   // song path -> String[FIELDS]
    private static boolean loaded;
    private static boolean dirty;
    private static boolean flushAsked;

    private static final int FIELDS = 5;
    private static final char SEP = '\t';
    private static final String VER = "#v1";
    private static final long FLUSH_DELAY_MS = 5000L;
    private static final Runnable FLUSH = new Flush();

    private static File file() {
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) return null;
        File d = c.getCacheDir();
        return d == null ? null : new File(d, "ipp_meta.txt");
    }

    /** Null when this file was never read; otherwise only the fields kept here are set. */
    public static synchronized Meta.Info get(String path) {
        if (path == null) return null;
        load();
        String[] v = (String[]) map.get(path);
        if (v == null) return null;
        Meta.Info i = new Meta.Info();
        i.albumArtist = v[0];
        i.track = v[1];
        i.disc = v[2];
        i.year = v[3];
        i.date = v[4];
        return i;
    }

    /** Written to the file a few seconds later, off the caller's thread. */
    public static void put(String path, Meta.Info i) {
        if (path == null || i == null || path.indexOf(SEP) >= 0 || path.indexOf('\n') >= 0) return;
        boolean ask;
        synchronized (MetaCache.class) {
            load();
            map.put(path, new String[] {
                    clean(i.albumArtist), clean(i.track), clean(i.disc), clean(i.year), clean(i.date) });
            dirty = true;
            ask = !flushAsked;
            flushAsked = true;
        }
        if (ask) Albums.later(FLUSH, FLUSH_DELAY_MS);
    }

    /** An absent tag and an empty one are the same answer; a field never carries a separator. */
    private static String clean(String s) {
        if (s == null || s.length() == 0) return null;
        return s.replace(SEP, ' ').replace('\n', ' ').replace('\r', ' ');
    }

    /** Reads the file now, off the main thread, so that no list waits for it. */
    public static synchronized void warm() {
        load();
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
            if (lines.length == 0 || !VER.equals(lines[0].trim())) return;
            for (int n = 1; n < lines.length; n++) {
                String[] p = lines[n].split("\t", -1);
                if (p.length != FIELDS + 1 || p[0].length() == 0) continue;
                String[] v = new String[FIELDS];
                for (int k = 0; k < FIELDS; k++) v[k] = p[k + 1].length() == 0 ? null : p[k + 1];
                map.put(p[0], v);
            }
        } catch (Throwable t) {
        }
    }

    /** The lock is held for the copy only, not for the write. */
    public static void flush() {
        Object[] rows;
        synchronized (MetaCache.class) {
            flushAsked = false;
            if (!dirty) return;
            dirty = false;
            rows = map.entrySet().toArray();
        }
        try {
            File f = file();
            if (f == null) return;
            StringBuilder sb = new StringBuilder(rows.length * 96);
            sb.append(VER).append('\n');
            for (int n = 0; n < rows.length; n++) {
                Map.Entry e = (Map.Entry) rows[n];
                String[] v = (String[]) e.getValue();
                sb.append((String) e.getKey());
                for (int k = 0; k < FIELDS; k++) {
                    sb.append(SEP);
                    if (v[k] != null) sb.append(v[k]);
                }
                sb.append('\n');
            }
            FileOutputStream o = new FileOutputStream(f);
            o.write(sb.toString().getBytes("UTF-8"));
            o.close();
            Diag.note("tags table: " + rows.length + " songs saved");
        } catch (Throwable t) {
            synchronized (MetaCache.class) { dirty = true; }
        }
    }

    static final class Flush implements Runnable {
        public void run() { flush(); }
    }

    public static synchronized void clear() {
        map.clear();
        loaded = false;
        dirty = false;
        try {
            File f = file();
            if (f != null && f.exists()) f.delete();
        } catch (Throwable t) {
        }
    }
}
