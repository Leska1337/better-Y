package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;

import com.innioasis.music.adapter.MyBaseAdapter;
import com.innioasis.music.data.Genre;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Y1Repository;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * The "<n> artists <n> albums" line under a genre, cached in {@code ipp_genres.txt}. Stock
 * recomputes it per row on every visit, so it arrived late and the row grew. {@link #invalidate}
 * runs per file of a scan, which is why it clears memory only.
 */
public final class GenreInfo {

    private GenreInfo() { }

    private static final HashMap map = new HashMap();   // genre name -> the info line
    private static boolean loaded;
    private static boolean dirty;
    private static final char SEP = '\t';

    /** Before the row binds; when nothing is cached, stock's per-row thread runs as before. */
    public static void fill(Genre g) {
        try {
            if (g == null || g.getName() == null) return;
            String cur = g.getInfo();
            if (cur != null && cur.trim().length() > 0) return;
            load();
            Object v = map.get(g.getName());
            if (v != null) g.setInfo((String) v);
        } catch (Throwable t) {
        }
    }

    /**
     * From {@code GenreListAdapter.setGenres}: every uncached genre in one background pass and one
     * repaint, instead of lines trickling in row by row.
     */
    public static void warm(MyBaseAdapter adapter) {
        try {
            if (adapter == null) return;
            load();
            ArrayList todo = new ArrayList();
            for (int i = 0; i < adapter.getCount(); i++) {
                Object o = adapter.getItem(i);
                if (!(o instanceof Genre)) continue;
                Genre g = (Genre) o;
                if (g.getName() == null) continue;
                Object v = map.get(g.getName());
                if (v != null) { g.setInfo((String) v); continue; }
                todo.add(g);
            }
            if (!todo.isEmpty()) new Thread(new Warm(adapter, todo)).start();
        } catch (Throwable t) {
        }
    }

    static final class Warm implements Runnable {
        private final MyBaseAdapter adapter;
        private final ArrayList todo;

        Warm(MyBaseAdapter adapter, ArrayList todo) {
            this.adapter = adapter;
            this.todo = todo;
        }

        public void run() {
            try {
                Context c = adapter.getContext();
                Y1Repository repo = Y1Application.Companion.getY1Repository();
                if (c == null || repo == null) return;
                for (int i = 0; i < todo.size(); i++) {
                    Genre g = (Genre) todo.get(i);
                    int artists = repo.getArtistsByGenreSync(g).size();
                    // Counted as the genre's album list shows them: same-named albums split by folder.
                    int albums = Genres.albumCount(g);
                    if (albums <= 0) albums = repo.getAlbumsByGenreSync(g).size();
                    // Stock's wording and spacing (GenreListAdapter$getView$1).
                    String line = artists + " "
                            + c.getString(artists > 1 ? R.string.genre_artists : R.string.genre_artist)
                            + " " + albums + " "
                            + c.getString(albums > 1 ? R.string.genre_albums : R.string.genre_album);
                    g.setInfo(line);
                    put(g.getName(), line);
                }
                if (c instanceof Activity) ((Activity) c).runOnUiThread(new Repaint(adapter));
            } catch (Throwable t) {
            }
        }
    }

    static final class Repaint implements Runnable {
        private final MyBaseAdapter adapter;
        Repaint(MyBaseAdapter adapter) { this.adapter = adapter; }
        public void run() {
            try { adapter.notifyDataSetChanged(); } catch (Throwable t) { }
        }
    }

    /** From stock's per-row thread, with its result. */
    public static void put(String name, String line) {
        try {
            if (name == null || line == null || line.length() == 0) return;
            if (name.indexOf(SEP) >= 0 || line.indexOf(SEP) >= 0) return;
            load();
            if (line.equals(map.get(name))) return;
            map.put(name, line);
            dirty = true;
            save();
        } catch (Throwable t) {
        }
    }

    public static void invalidate() {
        map.clear();
        loaded = true;      // do not read the stale file back
        dirty = false;
    }

    public static void clear() {
        map.clear();
        loaded = true;
        dirty = false;
        try {
            File f = file();
            if (f != null && f.exists()) f.delete();
        } catch (Throwable t) {
        }
    }

    private static File file() {
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) return null;
        File d = c.getCacheDir();
        return d == null ? null : new File(d, "ipp_genres.txt");
    }

    /**
     * First line of the file. Bump it whenever the line is computed differently: the entries are
     * answers, so an older file is not stale in any way this class could notice.
     */
    private static final String VERSION = "#v2";

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
            if (lines.length == 0 || !VERSION.equals(lines[0].trim())) return;
            for (int i = 1; i < lines.length; i++) {
                String s = lines[i];
                int t = s.indexOf(SEP);
                if (t <= 0) continue;
                map.put(s.substring(0, t), s.substring(t + 1).trim());
            }
        } catch (Throwable t) {
        }
    }

    private static synchronized void save() {
        if (!dirty) return;
        try {
            File f = file();
            if (f == null) return;
            StringBuilder sb = new StringBuilder();
            sb.append(VERSION).append('\n');
            Iterator it = map.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry e = (Map.Entry) it.next();
                sb.append((String) e.getKey()).append(SEP).append((String) e.getValue()).append('\n');
            }
            FileOutputStream o = new FileOutputStream(f);
            o.write(sb.toString().getBytes("UTF-8"));
            o.close();
            dirty = false;
        } catch (Throwable t) {
        }
    }
}
