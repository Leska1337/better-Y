package com.innioasis.ipp;

import android.content.Context;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Map;

import com.innioasis.y1.Y1Application;

/**
 * What an album row needs but cannot afford to look up while it is being drawn: the artist line and
 * the path of the album's representative song, kept per album key.
 *
 * <p>Filled from the album row's own background thread ({@code AlbumListAdapter$getView$1}) and by
 * "Cache library"; read synchronously by the bind. Persisted as tab-separated lines in
 * {@code ipp_albums.txt} in the app cache dir, so "Clear cache" wipes it along with the others.
 *
 * <p>The key goes through {@link Albums#coverKey} — see {@link #artist(String)}.
 *
 * <p>The map is a raw {@code Hashtable}: raw because a generic field type makes javac emit a class
 * {@code Signature} attribute and the bundled d8 crashes dexing those, and a {@code Hashtable}
 * because its own synchronisation is what lets the drawing thread read while a worker writes. The
 * file is written under the map's monitor ({@link #save()}), which is what stops two workers
 * producing a half-written line.
 */
public final class AlbumInfo {

    private static final Hashtable map = new Hashtable();
    private static boolean loaded;

    /** A value carrying a tab or a newline would break the line format; such an entry is dropped. */
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

    /** Reads the file once. The flag is set BEFORE the read, so a failure is not retried per row. */
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
     * The album's artist line, or null when nothing has been cached for it.
     *
     * <p>ipp: the key is canonicalised first. The Genres screen feeds {@code AlbumListAdapter}
     * PLAIN album names while the Albums screen feeds folder-encoded ones (#291.3), so the same
     * album was cached under two keys — re-read and re-written on entering All Albums under a
     * genre, even though the Albums screen had already cached it. {@link Albums#coverKey} returns
     * an encoded name untouched, so the Albums screen pays nothing.
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

    /** The album's representative song path, or null when there is none. Key as in {@link #artist}. */
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

    /** Records both, and writes the file — but only when something actually changed. */
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
