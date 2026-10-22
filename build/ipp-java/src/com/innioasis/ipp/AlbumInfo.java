package com.innioasis.ipp;

import android.content.Context;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import com.innioasis.y1.Y1Application;

/**
 * An album row's artist line and representative song path, per album key, so the bind never
 * queries. Filled by the row's background thread and "Cache library"; persisted as tab-separated
 * lines in {@code ipp_albums.txt} in the cache dir. A {@code Hashtable} so the drawing thread can
 * read while a worker writes; the file is written under its monitor.
 */
public final class AlbumInfo {

    private static final Hashtable map = new Hashtable();
    private static boolean loaded;

    /** A tab or newline would break the line format. */
    private static boolean bad(String s) {
        return s.indexOf('\t') >= 0 || s.indexOf('\n') >= 0;
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
        return new File(dir, "ipp_albums.txt");
    }

    /** The flag is set before the read, so a failure is not retried per row. */
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
                String[] p = lines[i].split("\t");
                if (p.length < 2) {
                    continue;
                }
                String path = p.length >= 3 ? p[2] : "";
                map.put(p[0], new String[] { p[1], path });
            }
        } catch (Throwable t) {
        }
    }

    private static void saveLocked() {
        try {
            File f = file();
            if (f == null) {
                return;
            }
            StringBuilder sb = new StringBuilder();
            Iterator it = map.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry e = (Map.Entry) it.next();
                String[] v = (String[]) e.getValue();
                sb.append((String) e.getKey());
                sb.append("\t");
                sb.append(v[0]);
                sb.append("\t");
                sb.append(v[1]);
                sb.append("\n");
            }
            FileOutputStream out = new FileOutputStream(f);
            out.write(sb.toString().getBytes());
            out.close();
        } catch (Throwable t) {
        }
    }

    private static void save() {
        synchronized (map) {
            saveLocked();
        }
    }

    /**
     * Null when nothing is cached. The key is canonicalised: Genres feeds plain album names,
     * Albums feeds folder-encoded ones, and both must hit the same entry.
     */
    public static String artist(String album) {
        album = Albums.coverKey(album);
        if (album == null) {
            return null;
        }
        load();
        String[] v = (String[]) map.get(album);
        if (v == null) {
            return null;
        }
        return v[0];
    }

    /** Key as in {@link #artist}. */
    public static String path(String album) {
        album = Albums.coverKey(album);
        if (album == null) {
            return null;
        }
        load();
        String[] v = (String[]) map.get(album);
        if (v == null) {
            return null;
        }
        String path = v[1];
        if (path.length() == 0) {
            return null;
        }
        return path;
    }

    /** Writes the file only when something changed. */
    public static void put(String album, String artist, String path) {
        album = Albums.coverKey(album);
        if (album == null) {
            return;
        }
        if (artist == null) {
            artist = "";
        }
        if (path == null) {
            path = "";
        }
        if (bad(album) || bad(artist) || bad(path)) {
            return;
        }
        load();
        String[] old = (String[]) map.get(album);
        if (old != null && old[0].equals(artist) && old[1].equals(path)) {
            return;
        }
        map.put(album, new String[] { artist, path });
        save();
    }

    /**
     * Lines of albums no song carries, or whose song is gone: their weight, and gone when
     * {@code drop}. A dropped line is read again by the row that needs it.
     */
    static long prune(Set albums, Stale.Keys paths, boolean drop) {
        load();
        long n = 0L;
        synchronized (map) {
            ArrayList gone = new ArrayList();
            Iterator it = map.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry e = (Map.Entry) it.next();
                String[] v = (String[]) e.getValue();
                if (albums.contains(e.getKey())
                        && (v[1].length() == 0 || paths.has(Stale.Keys.of(v[1])))) {
                    continue;
                }
                gone.add(e.getKey());
                n += Stale.line((String) e.getKey(), v[0] + "\t" + v[1]);
            }
            if (drop && !gone.isEmpty()) {
                for (int i = 0; i < gone.size(); i++) map.remove(gone.get(i));
                saveLocked();
            }
        }
        return n;
    }

    public static void clear() {
        map.clear();
        loaded = false;
        try {
            File f = file();
            if (f != null) {
                f.delete();
            }
        } catch (Throwable t) {
        }
    }
}
