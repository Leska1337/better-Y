package com.innioasis.ipp;

import android.content.Context;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Song;

/**
 * The TRACK NUMBER tag per path, in {@code ipp_tracks.txt}. No number reads as MAX_VALUE, which
 * sorts last, and is stored as such so the file is not opened again. {@link #get} never reads the
 * cache file — it is the drawing path; {@link #warmIfWanted} does, from the screens that show
 * the numbers.
 */
public final class TrackCache {

    private static boolean dirty;
    private static boolean loaded;
    private static final HashMap map = new HashMap();

    public static void clear() {
        map.clear();
        loaded = false;
        dirty = false;
        try {
            File f = file();
            if (f != null) {
                f.delete();
            }
        } catch (Throwable t) {
        }
    }

    /** Reads every song not cached yet; no number is stored as MAX_VALUE so it is not re-read. */
    private static void ensure(List songs) {
        if (songs == null) {
            return;
        }
        int n = songs.size();
        for (int i = 0; i < n; i++) {
            String path = ((Song) songs.get(i)).getPath();
            if (path == null) {
                continue;
            }
            if (map.containsKey(path)) {
                continue;
            }
            put(path, Meta.read(path, false).track);
            if (!map.containsKey(path)) {
                map.put(path, Integer.valueOf(Integer.MAX_VALUE));
                dirty = true;
            }
        }
    }

    /** Always together with {@code DiscCache.forget}: DiscCache records that the file was read. */
    public static void forget(String path) {
        if (path == null) {
            return;
        }
        load();
        if (map.remove(path) == null) {
            return;
        }
        dirty = true;
        save();
    }

    /** Loads the file before any row asks; from AlbumsActivity.initView and Genres.songs. */
    public static void warmIfWanted() {
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) {
            return;
        }
        if (!Prefs.on(c, "track_numbers")) {
            return;
        }
        load();
    }

    private static File file() {
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) {
            return null;
        }
        File dir = c.getCacheDir();
        if (dir == null) {
            return null;
        }
        return new File(dir, "ipp_tracks.txt");
    }

    /** Memory only. */
    public static int get(String path) {
        if (path == null) {
            return Integer.MAX_VALUE;
        }
        Integer v = (Integer) map.get(path);
        if (v == null) {
            return Integer.MAX_VALUE;
        }
        return v.intValue();
    }

    private static void load() {
        if (loaded) {
            return;
        }
        loaded = true;
        try {
            File f = file();
            if (f == null || !f.exists()) {
                return;
            }
            FileInputStream in = new FileInputStream(f);
            byte[] b = new byte[in.available()];
            in.read(b);
            in.close();
            String[] lines = new String(b).split("\n");
            for (int i = 0; i < lines.length; i++) {
                String line = lines[i];
                int tab = line.indexOf('\t');
                if (tab < 0) {
                    continue;
                }
                int n = parse(line.substring(tab + 1));
                if (n <= 0) {
                    continue;
                }
                map.put(line.substring(0, tab), Integer.valueOf(n));
            }
        } catch (Throwable t) {
        }
    }

    /**
     * The first number in the value. The prefix must be skipped: " 1", "A1" or "Track 3" read as 0
     * means no number, and one such song puts the whole album back on row numbers.
     */
    private static int parse(String s) {
        int n = 0;
        int i = 0;
        int len = s.length();
        while (i < len) {
            char c = s.charAt(i);
            if (c >= '0' && c <= '9') {
                break;
            }
            i++;
        }
        while (i < len) {
            char c = s.charAt(i);
            if (c < '0' || c > '9') {
                break;
            }
            n = n * 10 + (c - '0');
            i++;
        }
        return n;
    }

    /** A tag the caller already read. Does not write the file. */
    public static void put(String path, String tag) {
        if (path == null || tag == null) {
            return;
        }
        int n = parse(tag);
        if (n <= 0) {
            return;
        }
        map.put(path, Integer.valueOf(n));
        dirty = true;
    }

    private static void save() {
        if (!dirty) {
            return;
        }
        try {
            File f = file();
            if (f == null) {
                return;
            }
            StringBuilder sb = new StringBuilder();
            Iterator it = map.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry e = (Map.Entry) it.next();
                sb.append((String) e.getKey());
                sb.append('\t');
                sb.append(((Integer) e.getValue()).intValue());
                sb.append('\n');
            }
            FileOutputStream out = new FileOutputStream(f);
            out.write(sb.toString().getBytes());
            out.close();
            dirty = false;
        } catch (Throwable t) {
        }
    }

    /** A sorted copy; reads whatever is missing first. */
    public static List sorted(List songs) {
        if (songs == null) {
            return null;
        }
        load();
        ensure(songs);
        save();
        ArrayList copy = new ArrayList(songs);
        Collections.sort(copy, new TrackComparator());
        return copy;
    }
}
