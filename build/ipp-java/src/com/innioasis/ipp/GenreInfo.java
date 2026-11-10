package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.os.SystemClock;

import com.innioasis.music.adapter.MyBaseAdapter;
import com.innioasis.music.data.Genre;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.database.Y1Repository;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
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
            if (todo.isEmpty()) return;
            warming = true;
            new Thread(new Warm(adapter, todo)).start();
        } catch (Throwable t) {
            warming = false;
        }
    }

    /** A {@link #warm} pass is counting; stock's per-row count would only repeat it. */
    private static volatile boolean warming;

    /**
     * True when the row needs no count of its own: the line is there, or the pass is bringing it.
     * Stock starts a counting thread on every bind of every row otherwise.
     */
    public static boolean counted(Genre g) {
        try {
            if (warming || g == null) return true;
            String cur = g.getInfo();
            return cur != null && cur.trim().length() > 0;
        } catch (Throwable t) {
            return false;
        }
    }

    /** What one genre gathers in the pass. */
    private static final class Bucket {
        final HashSet albums = new HashSet();
        final HashSet artists = new HashSet();
        /** Raw tag -> its artists: what stock's exact-match query sees. */
        final HashMap exact = new HashMap();
        /** Some song is here through a part of a composite tag. */
        boolean composite;
    }

    private static Bucket bucket(HashMap all, String key) {
        Bucket b = (Bucket) all.get(key);
        if (b == null) {
            b = new Bucket();
            all.put(key, b);
        }
        return b;
    }

    /**
     * Every genre's artists and albums out of ONE walk of the song list. The answers must be the
     * ones the lists give: artists as {@code getArtistsByGenreSync} (exact tag unless a composite
     * tag contributes, then {@code Artists.listGenre}), albums as the folder-split rows {@code Genres.albumList} builds.
     */
    private static HashMap count() {
        boolean split = GenreSplit.enabled();
        HashMap all = new HashMap();        // genre key -> Bucket
        HashMap byTag = new HashMap();      // raw tag -> the keys it files a song under
        List songs = Albums.allSongs();
        if (songs == null) return all;
        for (int i = 0; i < songs.size(); i++) {
            Object o = songs.get(i);
            if (!(o instanceof Song)) continue;
            Song s = (Song) o;
            String tag = s.getGenre();
            if (tag == null) tag = "";
            String[] keys = (String[]) byTag.get(tag);
            if (keys == null) {
                LinkedHashSet ks = new LinkedHashSet();
                if (split) {
                    ks.add(GenreSplit.norm(tag));
                    List ps = GenreSplit.parts(tag);
                    for (int j = 0; j < ps.size(); j++) ks.add(GenreSplit.norm((String) ps.get(j)));
                } else {
                    ks.add(tag);
                }
                keys = (String[]) ks.toArray(new String[ks.size()]);
                byTag.put(tag, keys);
            }
            String artist = s.getArtist();
            if (artist == null) artist = "";
            String album = Albums.albumKey(s.getAlbum(), s.getPath());
            for (int k = 0; k < keys.length; k++) {
                Bucket b = bucket(all, keys[k]);
                b.albums.add(album);
                b.artists.add(artist);
                if (k > 0) b.composite = true;      // keys[0] is the whole tag
                HashSet ex = (HashSet) b.exact.get(tag);
                if (ex == null) {
                    ex = new HashSet();
                    b.exact.put(tag, ex);
                }
                ex.add(artist);
            }
        }
        return all;
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
                long t0 = SystemClock.uptimeMillis();
                boolean split = GenreSplit.enabled();
                HashMap all = count();
                for (int i = 0; i < todo.size(); i++) {
                    Genre g = (Genre) todo.get(i);
                    String name = g.getName();
                    String key = split ? GenreSplit.norm(name) : name;
                    Bucket b = (Bucket) all.get(key);
                    int artists = 0;
                    int albums = 0;
                    if (b != null) {
                        boolean whole = split && key.length() > 0 && b.composite;
                        HashSet as = whole ? b.artists : (HashSet) b.exact.get(name);
                        if (as != null) artists = Artists.listGenre(new ArrayList(as)).size();
                        // as the genre's album list shows them: same-named albums split by folder
                        albums = b.albums.size();
                    }
                    if (artists <= 0) artists = repo.getArtistsByGenreSync(g).size();
                    if (albums <= 0) albums = repo.getAlbumsByGenreSync(g).size();
                    // Stock's wording and spacing (GenreListAdapter$getView$1).
                    String line = artists + " "
                            + c.getString(artists > 1 ? R.string.genre_artists : R.string.genre_artist)
                            + " " + albums + " "
                            + c.getString(albums > 1 ? R.string.genre_albums : R.string.genre_album);
                    g.setInfo(line);
                    keep(name, line);
                }
                save();
                Diag.slow("genre counts, " + todo.size(), t0);
                warming = false;
                if (c instanceof Activity) ((Activity) c).runOnUiThread(new Repaint(adapter));
            } catch (Throwable t) {
            } finally {
                warming = false;
            }
        }
    }

    /** {@link #put} without the file write: the pass saves once. */
    private static void keep(String name, String line) {
        if (name == null || name.indexOf(SEP) >= 0 || line.indexOf(SEP) >= 0) return;
        load();
        if (line.equals(map.get(name))) return;
        map.put(name, line);
        dirty = true;
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
