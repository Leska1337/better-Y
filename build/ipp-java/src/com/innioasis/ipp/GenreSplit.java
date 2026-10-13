package com.innioasis.ipp;

import android.content.Context;

import com.innioasis.music.data.Genre;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.utils.SharedPreferencesUtils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;

/**
 * A genre tag naming several genres ("Rock, Pop", "Electronic/Ambient") becomes several genres.
 * Separators are {@code , ; /} with or without spaces — deliberately not the artists' rule; a
 * genre named with a slash ("R&B/Soul") is split, a known and accepted cost.
 *
 * The query redirects answer in Java only for a genre a composite tag contributes to, and null
 * otherwise so stock's indexed SQL answers. A row and its contents must be found by the same test,
 * or the row opens empty. With the toggle off {@link #has} is stock's exact comparison.
 */
public final class GenreSplit {

    private GenreSplit() { }

    public static final String KEY_SPLIT = "genre_split";

    public static boolean enabled() {
        Context c = Y1Application.Companion.getAppContext();
        return Prefs.on(c, KEY_SPLIT);
    }

    static String norm(String s) {
        return s == null ? "" : s.trim().toLowerCase(Locale.ROOT);
    }

    private static boolean eq(String a, String b) {
        return (a == null ? "" : a).equals(b == null ? "" : b);
    }

    /** The cheap pre-check before a regex split; runs per song per genre-scoped list. */
    private static boolean joined(String s) {
        return s != null && (s.indexOf(',') >= 0 || s.indexOf(';') >= 0 || s.indexOf('/') >= 0);
    }

    public static List parts(String raw) {
        ArrayList out = new ArrayList();
        if (raw == null) return out;
        if (!joined(raw)) {
            out.add(raw);
            return out;
        }
        String[] chunks = raw.split("[,;/]");
        for (int i = 0; i < chunks.length; i++) {
            String p = chunks[i].trim();
            if (p.length() > 0) out.add(p);
        }
        if (out.isEmpty()) out.add(raw);   // a tag of nothing but separators stays as it is
        return out;
    }

    /** The one test every genre filter makes; with splitting off, stock's own comparison. */
    public static boolean has(String tag, String genre) {
        if (!enabled()) return eq(tag, genre);
        String target = norm(genre);
        String whole = norm(tag);
        if (target.length() == 0) return whole.length() == 0;
        if (whole.equals(target)) return true;
        if (!joined(tag)) return false;
        return inParts(tag, target);
    }

    /** {@link #has} ignoring case and stray spaces, for fallback lookups like {@code Artists.byTag}. */
    public static boolean hasLoose(String tag, String genre) {
        String target = norm(genre);
        if (norm(tag).equals(target)) return true;
        return enabled() && joined(tag) && inParts(tag, target);
    }

    private static boolean inParts(String tag, String normTarget) {
        List ps = parts(tag);
        for (int i = 0; i < ps.size(); i++) {
            if (norm((String) ps.get(i)).equals(normTarget)) return true;
        }
        return false;
    }

    // The last answer of collect(): opening one artist of a genre asks it several times over.
    private static List memoSongs;
    private static String memoTarget;
    private static ArrayList memoOut;

    /**
     * Null when no composite tag contributes, so stock's query answers. Off the cached table.
     * The list is shared with the memo: callers read it, never sort or change it.
     */
    private static ArrayList collect(Genre g) {
        if (g == null || !enabled()) return null;
        String target = norm(g.getName());
        if (target.length() == 0) return null;
        List all = Albums.allSongs();
        if (all == null) return null;
        synchronized (GenreSplit.class) {
            if (all == memoSongs && target.equals(memoTarget)) return memoOut;
        }
        ArrayList out = scan(all, target);
        synchronized (GenreSplit.class) {
            memoSongs = all;
            memoTarget = target;
            memoOut = out;
        }
        return out;
    }

    private static ArrayList scan(List all, String target) {
        ArrayList out = new ArrayList();
        boolean fromComposite = false;
        for (int i = 0; i < all.size(); i++) {
            Object o = all.get(i);
            if (!(o instanceof Song)) continue;
            Song s = (Song) o;
            String tag = s.getGenre();
            boolean whole = norm(tag).equals(target);
            if (!whole && !(joined(tag) && inParts(tag, target))) continue;
            out.add(s);
            if (!whole) fromComposite = true;
        }
        return fromComposite ? out : null;
    }

    /** True when stock's exact-match query would miss songs of this genre. */
    public static boolean composite(Genre g) {
        try {
            return collect(g) != null;
        } catch (Throwable t) {
            return false;
        }
    }

    /** {@code getSongsByGenreSync}, in stock's {@code lower(pinyinName)} order. */
    public static List songsIn(Genre g) {
        try {
            ArrayList had = collect(g);
            if (had == null) return null;
            ArrayList out = new ArrayList(had);
            Collections.sort(out, new FileNameCmp());
            return out;
        } catch (Throwable t) {
            return null;
        }
    }

    /** {@code getArtistsByGenreSync}. {@code Artists.listGenre} still splits what comes out. */
    public static List artistsIn(Genre g) {
        try {
            ArrayList songs = collect(g);
            return songs == null ? null : distinct(songs, F_ARTIST);
        } catch (Throwable t) {
            return null;
        }
    }

    /** {@code getAlbumsByGenreSync}. {@code Genres.albumList} still splits same-name albums. */
    public static List albumsIn(Genre g) {
        try {
            ArrayList songs = collect(g);
            return songs == null ? null : distinct(songs, F_ALBUM);
        } catch (Throwable t) {
            return null;
        }
    }

    /**
     * {@code getGenresSync}: expanded into parts, de-duplicated ignoring case (first spelling
     * kept), re-sorted only under the name order — {@code Alpha} relies on it being A→Z.
     */
    public static List list(List raw) {
        if (raw == null || !enabled()) return raw;
        try {
            LinkedHashMap seen = new LinkedHashMap();
            for (int i = 0; i < raw.size(); i++) {
                Object o = raw.get(i);
                if (!(o instanceof String)) continue;
                List ps = parts((String) o);
                for (int j = 0; j < ps.size(); j++) {
                    String p = (String) ps.get(j);
                    String k = norm(p);
                    if (!seen.containsKey(k)) seen.put(k, p);
                }
            }
            ArrayList out = new ArrayList(seen.values());
            SharedPreferencesUtils s = SharedPreferencesUtils.INSTANCE;
            if (s.isSortByName()) Collections.sort(out, new NameCmp(!s.isSortLogic()));
            return out;
        } catch (Throwable t) {
            return raw;
        }
    }

    private static final int F_ARTIST = 0, F_ALBUM = 1;

    /**
     * Distinct values of one column in the stock DAO's order. De-duplicated on the RAW value, case
     * included, as SQL's {@code distinct} is: the values are query keys, and a case-folded one is a
     * row that opens empty.
     */
    private static List distinct(ArrayList songs, int field) {
        SharedPreferencesUtils sp = SharedPreferencesUtils.INSTANCE;
        ArrayList copy = new ArrayList(songs);
        Collections.sort(copy, new RowCmp(field, sp.isSortByName(), sp.isSortLogic()));
        LinkedHashMap seen = new LinkedHashMap();
        for (int i = 0; i < copy.size(); i++) {
            Song s = (Song) copy.get(i);
            String v = (field == F_ARTIST) ? s.getArtist() : s.getAlbum();
            if (v == null) v = "";
            if (!seen.containsKey(v)) seen.put(v, v);
        }
        return new ArrayList(seen.values());
    }

    private static final class RowCmp implements Comparator {
        private final int field;
        private final boolean byName;
        private final boolean asc;

        RowCmp(int field, boolean byName, boolean asc) {
            this.field = field;
            this.byName = byName;
            this.asc = asc;
        }

        public int compare(Object oa, Object ob) {
            Song a = (Song) oa;
            Song b = (Song) ob;
            int c;
            if (byName) {
                c = cmpStr(key(a), key(b));
            } else {
                long x = a.getFileDate();
                long y = b.getFileDate();
                c = x < y ? -1 : (x > y ? 1 : 0);
            }
            return asc ? c : -c;
        }

        private String key(Song s) {
            return field == F_ARTIST ? s.getPinyinArtist() : s.getPinyinAlbum();
        }
    }

    private static final class FileNameCmp implements Comparator {
        public int compare(Object a, Object b) {
            return cmpStr(((Song) a).getPinyinName(), ((Song) b).getPinyinName());
        }
    }

    private static final class NameCmp implements Comparator {
        private final boolean rev;
        NameCmp(boolean rev) { this.rev = rev; }
        public int compare(Object a, Object b) {
            int c = cmpStr((String) a, (String) b);
            return rev ? -c : c;
        }
    }

    private static int cmpStr(String a, String b) {
        return norm(a).compareTo(norm(b));
    }
}
