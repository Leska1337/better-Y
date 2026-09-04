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
 * The "<n> artists <n> albums" line under a genre's name.
 *
 * Stock computes it per row, on a background thread started from {@code GenreListAdapter.getView},
 * and keeps the answer on the {@code Genre} object — which {@code setGenres} rebuilds every time
 * the screen is opened. So the two queries ran again on every visit and, since a row is bound the
 * moment it scrolls into view, again for every row the user had not reached yet: the line arrived
 * a beat late each time, and the row grew as it did.
 *
 * The answer only changes when the library does, so it is written down — same shape as
 * {@code DiscCache} / {@code AlbumArtist}: a {@code name<TAB>line} text file beside them in the app
 * cache dir, loaded once. A cached line is put on the {@code Genre} before the row binds
 * ({@link #fill}), so there is nothing to wait for and nothing to resize.
 *
 * {@link #invalidate} is called from {@code Ipp.libraryChanged}, i.e. from every write to the Song
 * table — including once per file during a full scan, which is why it only clears memory and lets
 * the next {@link #put} rewrite the file.
 */
public final class GenreInfo {

    private GenreInfo() { }

    private static final HashMap map = new HashMap();   // genre name -> the info line
    private static boolean loaded;
    private static boolean dirty;
    private static final char SEP = '\t';

    /**
     * Put the remembered line on a genre before its row is bound. Returns quietly when the genre
     * already has one (stock's background thread has filled it in this session) or when we have
     * never computed it — then stock's thread runs exactly as before, and {@link #put} catches the
     * result on its way out.
     */
    public static void fill(Genre g) {
        try {
            if (g == null || g.getName() == null) return;
            String cur = g.getInfo();
            if (cur != null && cur.trim().length() > 0) return;
            load();
            Object v = map.get(g.getName());
            if (v != null) g.setInfo((String) v);
        } catch (Throwable t) {
            // a missing subtitle is not worth taking the list down for
        }
    }

    /**
     * Fill in every genre the cache does not know yet, in one background pass, and repaint
     * the list once at the end. Called from {@code GenreListAdapter.setGenres}.
     *
     * Stock's per-row thread is still there and still correct, but it starts when a row scrolls
     * into view: on a first run the lines therefore trickled in one row at a time, each arriving a
     * frame or two after its row was drawn. One pass for the whole (short) genre list means one
     * repaint, before the user has scrolled anywhere — and after it the file cache answers, so this
     * never runs twice for the same library.
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
            // the per-row thread is still there as a fallback
        }
    }

    /** Named (d8 here crashes dexing anonymous classes). */
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
                    // the ALBUM LIST of a genre splits a name shared by several folders
                    // into one row per folder ("Demo"), so the count under the genre has to be
                    // taken the same way or it names a number of albums the list does not show.
                    int albums = Genres.albumCount(g);
                    if (albums <= 0) albums = repo.getAlbumsByGenreSync(g).size();   // never 0
                    // exactly stock's wording and spacing (GenreListAdapter$getView$1)
                    String line = artists + " "
                            + c.getString(artists > 1 ? R.string.genre_artists : R.string.genre_artist)
                            + " " + albums + " "
                            + c.getString(albums > 1 ? R.string.genre_albums : R.string.genre_album);
                    g.setInfo(line);
                    put(g.getName(), line);
                }
                if (c instanceof Activity) ((Activity) c).runOnUiThread(new Repaint(adapter));
            } catch (Throwable t) {
                // ignore
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

    /** Called from the adapter's background thread once it has counted the artists and albums. */
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
            // ditto
        }
    }

    /** The library changed, so the counts may have. Memory only — see the class comment. */
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
            // ignore
        }
    }

    private static File file() {
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) return null;
        File d = c.getCacheDir();
        return d == null ? null : new File(d, "ipp_genres.txt");
    }

    /**
     * Format marker, first line of the file. Bump it whenever the LINE ITSELF is computed
     * differently — the entries are answers, not raw data, so a file written by an older build is
     * not stale in any way this class could notice. v2: the album count is the split one.
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
            if (lines.length == 0 || !VERSION.equals(lines[0].trim())) return;   // written by an
            for (int i = 1; i < lines.length; i++) {                             // older build
                String s = lines[i];
                int t = s.indexOf(SEP);
                if (t <= 0) continue;
                map.put(s.substring(0, t), s.substring(t + 1).trim());
            }
        } catch (Throwable t) {
            // an unreadable cache is an empty cache
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
            // keep what we have in memory for this run
        }
    }
}
