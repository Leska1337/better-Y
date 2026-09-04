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
 * A genre tag that lists several genres at once ("Rock, Pop", "Electronic/Ambient") becomes
 * several genres, the way {@link Artists} splits a multi-artist tag.
 *
 * The separator rule is NOT the artists' one, and that is deliberate (the user's call).
 * There it is the punctuation plus the space after it, because a comma inside an artist's name is
 * common enough to need an exceptions file ("Tyler, the Creator"); a genre is a word out of a short
 * vocabulary, taggers write it every which way ("Rock,Pop", "Rock / Pop"), and a comma inside a
 * genre name is not a thing. So the separators are {@code , ; /} with any amount of space
 * around them or none. The cost is accepted and known: a genre whose NAME carries a slash
 * ("Folk/Rock", "R&B/Soul") is split in two.
 *
 * Where it applies. Every genre-scoped query of {@code Y1Repository} — the genre list
 * itself, the artists, the albums and the songs of a genre — plus the genre filters the mod already
 * does in Java ({@code Albums.songsSync}, {@code Genres.split}/{@code albumCount},
 * {@code Artists.byTag}). The three query redirects follow the pattern the data layer uses
 * everywhere here: answer in Java only when the genre really is one that a composite tag
 * contributes to, and return null otherwise so the ordinary genre keeps stock's indexed SQL
 * and its collation. That is what {@link #collect} decides, and it is the same test the genre LIST
 * is built with — a row and its contents must be found by one test, or the row opens empty (the
 * lesson of {@code Artists.byTag}, skill {@code ipp-albums-artists}).
 *
 * With the toggle off nothing changes at all: {@link #has} then makes the very comparison
 * stock's SQL makes (equality on the raw string), and the three redirects answer null.
 *
 * Gated by {@link #KEY_SPLIT} ("Split genres that are divided by commas, semicolons and
 * slashes"), On unless switched off — as the artist row is.
 *
 * Raw (non-generic) types throughout: the bundled d8 crashes dexing generic Signature
 * attributes.
 */
public final class GenreSplit {

    private GenreSplit() { }

    /** better-Y → "Split genres that are divided by commas, semicolons and slashes". */
    public static final String KEY_SPLIT = "genre_split";

    public static boolean enabled() {
        Context c = Y1Application.Companion.getAppContext();
        return Prefs.on(c, KEY_SPLIT);
    }

    private static String norm(String s) {
        return s == null ? "" : s.trim().toLowerCase(Locale.ROOT);
    }

    private static boolean eq(String a, String b) {
        return (a == null ? "" : a).equals(b == null ? "" : b);
    }

    /**
     * Does this tag carry a separator at all? Asked before {@link #parts}, because the answer is no
     * for almost every song in the library and a "no" here costs three {@code indexOf}s instead of
     * a regex split — this runs once per song per genre-scoped list.
     */
    private static boolean joined(String s) {
        return s != null && (s.indexOf(',') >= 0 || s.indexOf(';') >= 0 || s.indexOf('/') >= 0);
    }

    /** One raw genre tag → its parts, trimmed; a tag that carries no separator is one part. */
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

    /**
     * True when {@code tag} carries {@code genre} — the one test every genre filter in the mod
     * makes. With splitting off it is stock's own comparison, so a filter that goes through here
     * behaves exactly as it did before the toggle existed.
     */
    public static boolean has(String tag, String genre) {
        if (!enabled()) return eq(tag, genre);
        String target = norm(genre);
        String whole = norm(tag);
        if (target.length() == 0) return whole.length() == 0;
        if (whole.equals(target)) return true;
        if (!joined(tag)) return false;
        return inParts(tag, target);
    }

    /**
     * {@link #has} for the fallback lookups — {@code Artists.byTag} and its like — whose whole
     * point is that the row's text and the tag it came from may differ by a stray space or a
     * difference in case. Those were lenient about that before this class existed and stay so with
     * the split off; what is added is the parts.
     */
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

    /**
     * The songs of a genre, gathered by {@link #has} — or null when this genre owes nothing
     * to a composite tag, which is the signal to let stock's indexed query answer.
     *
     * Read off the cached song table ({@code Albums.allSongs}), so a burst of these — the genre
     * list's subtitles ask per row — shares one Room load.
     */
    private static ArrayList collect(Genre g) {
        if (g == null || !enabled()) return null;
        String target = norm(g.getName());
        if (target.length() == 0) return null;
        List all = Albums.allSongs();
        if (all == null) return null;
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

    /**
     * True when a query for this genre has to be answered in Java — i.e. some song reaches it
     * through a composite tag. Asked by {@code Artists.songsInGenre}, which may not fall back to
     * the stock exact-match query for such a genre: that query would answer with nothing.
     */
    public static boolean composite(Genre g) {
        try {
            return collect(g) != null;
        } catch (Throwable t) {
            return false;
        }
    }

    // ---- the three query redirects ------------------------------------------------------------

    /** {@code getSongsByGenreSync}: stock orders by {@code lower(pinyinName)} and offers no sort. */
    public static List songsIn(Genre g) {
        try {
            ArrayList out = collect(g);
            if (out == null) return null;
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
     * {@code getGenresSync}: the genre list itself, expanded into parts and de-duplicated
     * case-insensitively (the first spelling seen is the one kept).
     *
     * Re-sorted only under the query's own name order — exactly {@code Artists.listGenre}'s rule
     * and for the same two reasons: a by-date list sorted alphabetically would be a different list,
     * and the alphabetical jump ({@code Alpha}) reads "no sort chosen" on this level as "the order
     * the query gave, which IS A→Z" (skill {@code ipp-genres}). Leaving the parts where their
     * composite tag stood would quietly break that.
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

    // ---- distinct artist / album, in the order the DAO would have given -------------------------

    private static final int F_ARTIST = 0, F_ALBUM = 1;

    /**
     * The distinct values of one column over these songs, ordered the way the stock query orders
     * them: {@code lower(pinyinArtist)} / {@code lower(pinyinAlbum)} under "sort by name",
     * {@code fileDate} otherwise, each with its reverse — the four DAO methods the repository picks
     * between.
     *
     * De-duplication is on the RAW value, case included, because SQL's {@code distinct} is: what
     * comes out of here is a query key ({@code Genres.split} looks an album name up by
     * {@code equals}, and an artist row is what the songs behind it are matched by), so a name
     * folded to another case would be a row that opens empty.
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
