package com.innioasis.ipp;

import android.content.Context;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.database.Y1Repository;

/**
 * An album's year, read from ONE of its songs and kept in {@code ipp_years.txt}. {@code ""} means
 * "read, no year" — without it every untagged album is opened again on every pass.
 */
public final class YearCache {

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

    /** The first run of four digits: "1997-08-12" gives 1997. */
    private static String digits4(String s) {
        if (s == null) {
            return null;
        }
        int len = s.length();
        for (int i = 0; i < len - 3; i++) {
            String t = s.substring(i, i + 4);
            int j = 0;
            while (j < 4) {
                char c = t.charAt(j);
                if (c < '0' || c > '9') {
                    break;
                }
                j++;
            }
            if (j == 4) {
                return t;
            }
        }
        return null;
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
        return new File(dir, "ipp_years.txt");
    }

    /** "" for "read, no year", null for "never looked at". The key is canonicalised. */
    public static String get(String album) {
        album = Albums.coverKey(album);
        if (album == null) {
            return null;
        }
        load();
        return (String) map.get(album);
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
                map.put(line.substring(0, tab), line.substring(tab + 1));
            }
        } catch (Throwable t) {
        }
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
                sb.append((String) e.getValue());
                sb.append('\n');
            }
            FileOutputStream out = new FileOutputStream(f);
            out.write(sb.toString().getBytes());
            out.close();
            dirty = false;
        } catch (Throwable t) {
        }
    }

    /**
     * Tags the caller already read ("Cache library"). YEAR, else DATE, as {@link #warm} does.
     * Does not write the file — the caller's pass ends in {@link #warm}.
     */
    public static void put(String album, String year, String date) {
        album = Albums.coverKey(album);
        if (album == null) {
            return;
        }
        load();
        String y = digits4(year);
        if (y == null) {
            y = digits4(date);
        }
        if (y == null) {
            y = "";
        }
        map.put(album, y);
        dirty = true;
    }

    /** Reads every album not cached yet, then writes the file once. */
    public static void warm(List names) {
        if (names == null) {
            return;
        }
        load();
        try {
            Y1Repository repo = Y1Application.Companion.getY1Repository();
            int n = names.size();
            for (int i = 0; i < n; i++) {
                String album = (String) names.get(i);
                if (album == null) {
                    continue;
                }
                if (Albums.isAllSongs(album)) {
                    continue;
                }
                if (map.containsKey(album)) {
                    continue;
                }
                List songs = repo.getSongsByAlbum(album, Y1Repository.SongSortType.FileName_A_To_Z);
                if (songs == null || songs.isEmpty()) {
                    continue;
                }
                String path = ((Song) songs.get(0)).getPath();
                if (path == null) {
                    continue;
                }
                String year = "";
                Meta.Info info = Meta.read(path, false);
                String y = digits4(info.year);
                if (y == null) {
                    y = digits4(info.date);
                }
                if (y != null) {
                    year = y;
                }
                map.put(album, year);
                dirty = true;
            }
            save();
        } catch (Throwable t) {
        }
    }
}
