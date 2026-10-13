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
 * The DISC NUMBER tag per track, for albums not split into CD folders — the folder name answers
 * first ({@link Albums#discOf}). One read per song, so only "Cache library" reads it, in the same
 * file open as the track number. A stored 0 means "read, no tag", unlike "never read".
 */
public final class DiscCache {

    private DiscCache() { }

    private static final HashMap map = new HashMap();   // song path -> Integer disc (0 = none)
    private static boolean loaded;
    private static boolean dirty;

    private static final char SEP = '\t';

    /**
     * First line of the file. Without it, a stored 0 predates {@link #sideOf} and may hide a
     * vinyl side, so such entries are dropped and re-read.
     */
    private static final String VER = "#v2";

    private static File file() {
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) return null;
        File d = c.getCacheDir();
        return d == null ? null : new File(d, "ipp_discs.txt");
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
            boolean cur = lines.length > 0 && VER.equals(lines[0].trim());
            if (!cur) dirty = true;   // rewrite with the marker at the next save
            for (int i = 0; i < lines.length; i++) {
                String s = lines[i];
                int t = s.indexOf(SEP);
                if (t <= 0) continue;
                try {
                    int v = Integer.parseInt(s.substring(t + 1).trim());
                    if (!cur && v == 0) continue;
                    map.put(s.substring(0, t), Integer.valueOf(v));
                } catch (Throwable e) {
                }
            }
        } catch (Throwable t) {
        }
    }

    private static void save() {
        if (!dirty) return;
        try {
            File f = file();
            if (f == null) return;
            StringBuilder sb = new StringBuilder();
            sb.append(VER).append('\n');
            Iterator it = map.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry e = (Map.Entry) it.next();
                String k = (String) e.getKey();
                if (k == null || k.indexOf(SEP) >= 0) continue;
                sb.append(k).append(SEP).append(((Integer) e.getValue()).intValue()).append('\n');
            }
            FileOutputStream o = new FileOutputStream(f);
            o.write(sb.toString().getBytes("UTF-8"));
            o.close();
            dirty = false;
        } catch (Throwable t) {
        }
    }

    /** A cached "no disc tag" counts as known. */
    public static boolean known(String path) {
        if (path == null) return true;
        load();
        return map.containsKey(path);
    }

    /** 0 when it has none or was never read. */
    public static int get(String path) {
        if (path == null) return 0;
        load();
        Object o = map.get(path);
        return o == null ? 0 : ((Integer) o).intValue();
    }

    /**
     * "No track number", as {@code TrackCache.ensure} stores it — written here so that method does
     * not open the file again at the end of the pass.
     */
    private static final String NO_TRACK = "2147483647";   // Integer.MAX_VALUE

    /** One file's yield: filled by {@link #read} on any thread, stored by {@link #commit} on one. */
    public static final class Tags {
        /** False for a picture-only read, which stores nothing. */
        public boolean wanted;
        public int disc;              // 0 = no disc tag
        public String track;          // the raw tag, or null for "none"
        public byte[] art;            // the embedded picture, or null
        /** False when the file did not read: nothing in here is an answer then. */
        public boolean ok;
    }

    /**
     * Both tags and the artwork from one file open — opening is the whole cost of a metadata
     * read. Writes nothing, so any thread may call it; never the UI thread.
     */
    public static Tags read(String path, boolean tags, boolean art) {
        Tags out = new Tags();
        out.wanted = tags;
        if (path == null) return out;
        Meta.Info info = Meta.read(path, art);
        if (tags) {
            out.disc = parse(info.disc);
            out.track = info.track;
        }
        out.art = info.art;
        out.ok = info.ok;
        return out;
    }

    /** Single-threaded by contract. */
    public static void commit(String path, Tags t) {
        if (path == null || t == null || !t.wanted || !t.ok) return;
        load();
        TrackCache.put(path, t.track != null ? t.track : NO_TRACK);
        int d = t.disc;
        if (d == 0) d = sideOf(t.track);
        map.put(path, Integer.valueOf(d));
        dirty = true;
    }

    /**
     * A vinyl track number "A1" as disc {@code Disc.SIDE_BASE + 1}, so the CD dividers show sides.
     * Only without a DISC tag, and only one letter followed by a digit ("CD2" is not a side).
     */
    private static int sideOf(String track) {
        if (track == null || track.length() < 2) return 0;
        char c = track.charAt(0);
        if (c >= 'a' && c <= 'z') c = (char) (c - ('a' - 'A'));
        if (c < 'A' || c > 'Z') return 0;
        char d = track.charAt(1);
        if (d < '0' || d > '9') return 0;
        return Disc.SIDE_BASE + (c - 'A' + 1);
    }

    /** Called before the caching pass starts its workers: a lazy load racing them corrupts the map. */
    public static void warm() {
        load();
    }

    /** The first number in the tag: "1/2", "01", "CD2". */
    private static int parse(String s) {
        if (s == null) return 0;
        int i = 0;
        int n = s.length();
        while (i < n && (s.charAt(i) < '0' || s.charAt(i) > '9')) i++;
        int v = 0;
        while (i < n && s.charAt(i) >= '0' && s.charAt(i) <= '9') {
            v = v * 10 + (s.charAt(i) - '0');
            i++;
        }
        return v;
    }

    public static void flush() {
        save();
    }

    public static void forget(String path) {
        if (path == null) return;
        load();
        if (map.remove(path) != null) { dirty = true; save(); }
    }

    public static void clear() {
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
