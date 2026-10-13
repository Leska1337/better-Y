package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import com.innioasis.music.objects.Constant;
import com.innioasis.music.ArtistsActivity;
import com.innioasis.music.GenresActivity;
import com.innioasis.music.adapter.MyBaseAdapter;
import com.innioasis.music.adapter.SubmenuAdapter;
import com.innioasis.music.data.Genre;
import com.innioasis.music.util.Other;
import com.innioasis.music.util.SubMenuDialog;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.database.Y1Repository;
import com.innioasis.y1.utils.SharedPreferencesUtils;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Set;

/**
 * Multi-artist tags split into separate artists: on "; " if the tag has one, otherwise on ", ".
 * The separator includes the SPACE — "A,B" is one artist; a wrong split invents an artist and
 * takes a real one's songs away. Names that contain a comma are kept whole by the user-editable
 * {@code comma_artists.txt} (greedy longest-run match).
 */
public final class Artists {

    // Also seeds comma_artists.txt.
    private static final String[] DEFAULTS = {
        "Tyler, the Creator",
        "Earth, Wind & Fire",
        "Crosby, Stills & Nash",
        "Crosby, Stills, Nash & Young",
        "Blood, Sweat & Tears",
        "Emerson, Lake & Palmer",
        "Emerson, Lake & Powell",
        "Peter, Paul and Mary",
        "Bell, Book & Candle",
        "The Good, the Bad & the Queen",
    };

    private static Set exceptions;   // canonicalised, lazy

    /**
     * better-Y → "Split artists that are divided by commas and semicolons". Inverting the row's
     * wording without renaming the key turns every device that touched it into its opposite.
     */
    public static final String KEY_SPLIT = "artist_split";

    public static boolean splitEnabled() {
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) return false;
        return Prefs.on(c, KEY_SPLIT);
    }

    private static final HashMap NORM = new HashMap();

    /** Trimmed and lower-cased; remembered, because a pass over the library asks it per song. */
    private static String norm(String s) {
        if (s == null) return "";
        synchronized (NORM) {
            Object had = NORM.get(s);
            if (had != null) return (String) had;
        }
        String n = s.trim().toLowerCase(Locale.ROOT);
        synchronized (NORM) {
            if (NORM.size() >= 8192) NORM.clear();
            NORM.put(s, n);
        }
        return n;
    }

    // Parts trimmed and joined by ", ": the user's spacing around commas does not matter.
    private static String canon(String s) {
        if (s == null) return "";
        String[] c = s.split(",");
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < c.length; i++) {
            if (i > 0) sb.append(", ");
            sb.append(c[i].trim());
        }
        return norm(sb.toString());
    }

    private static File exceptionsFile() {
        try {
            File base = new File(Constant.ROOT_PATH);
            if (!base.isDirectory()) return null;
            return new File(Panel.card(), "comma_artists.txt");
        } catch (Throwable t) {
            return null;
        }
    }

    private static void seed(File f) throws Exception {
        File dir = f.getParentFile();
        if (dir != null && !dir.exists()) dir.mkdirs();
        BufferedWriter w = new BufferedWriter(new FileWriter(f));
        try {
            w.write("# better-Y - artist names NOT to split on a comma (one per line).\n");
            w.write("# Reboot the player after editing.\n");
            for (int i = 0; i < DEFAULTS.length; i++) {
                w.write(DEFAULTS[i]);
                w.write("\n");
            }
        } finally {
            w.close();
        }
    }

    private static void readInto(File f, Set set) throws Exception {
        BufferedReader r = new BufferedReader(new FileReader(f));
        try {
            String line;
            while ((line = r.readLine()) != null) {
                String t = line.trim();
                if (t.length() == 0 || t.charAt(0) == '#') continue;
                String k = canon(t);
                if (k.length() > 0) set.add(k);
            }
        } finally {
            r.close();
        }
    }

    private static Set loadExceptions() {
        HashSet set = new HashSet();
        File f = exceptionsFile();
        try {
            if (f != null) {
                if (!f.exists()) seed(f);
                if (f.exists()) {
                    readInto(f, set);
                    return set;
                }
            }
        } catch (Throwable t) {
        }
        for (int i = 0; i < DEFAULTS.length; i++) set.add(canon(DEFAULTS[i]));
        return set;
    }

    /**
     * Re-seed a deleted exceptions file, from the library scan: it runs at start and on USB detach
     * (when the file may have been removed), with the card mounted. An existing file is never
     * touched.
     */
    public static void ensureExceptions() {
        try {
            File f = exceptionsFile();
            if (f == null || f.exists()) return;
            seed(f);
            exceptions = null;
            synchronized (PARTS) {
                PARTS.clear();
            }
            synchronized (NPARTS) {
                NPARTS.clear();
                ixFor = null;
                ixGen++;
            }
        } catch (Throwable t) {
        }
    }

    private static Set exc() {
        if (exceptions == null) exceptions = loadExceptions();
        return exceptions;
    }

    /** The separators, space included. */
    static final String SEMI = "; ";
    static final String COMMA = ", ";

    /** One tag's parts. Memoised per tag; callers only read the list. */
    public static List parts(String raw) {
        if (raw == null) return new ArrayList();
        synchronized (PARTS) {
            List had = (List) PARTS.get(raw);
            if (had != null) return had;
        }
        List out = Collections.unmodifiableList(split(raw));
        synchronized (PARTS) {
            PARTS.put(raw, out);
        }
        return out;
    }

    private static final HashMap PARTS = new HashMap();

    private static ArrayList split(String raw) {
        ArrayList out = new ArrayList();
        if (raw.indexOf(SEMI) >= 0) {
            String[] chunks = raw.split(SEMI);
            for (int i = 0; i < chunks.length; i++) {
                String p = chunks[i].trim();
                if (p.length() > 0) out.add(p);
            }
        } else {
            commaSplit(out, raw);
        }
        if (out.isEmpty()) out.add(raw);
        return out;
    }

    /** Visual only: "; " reads as ", ". Never a query key. */
    public static String display(String raw) {
        if (raw == null || raw.indexOf(SEMI) < 0) return raw;
        return raw.replace(SEMI, COMMA);
    }

    /**
     * {@link #display} for a {@code MainAdapter} row — only on the screens whose MainAdapter holds
     * artists. Only the row's text changes; the list keeps the key.
     */
    public static String rowName(String name, Object adapter) {
        if (AlbumArtists.is(name)) return Other.INSTANCE.unNamed(AlbumArtists.name(name));
        if (name == null || name.indexOf(SEMI) < 0 || !(adapter instanceof MyBaseAdapter)) return name;
        Context c = ((MyBaseAdapter) adapter).getContext();
        if (c instanceof ArtistsActivity || c instanceof GenresActivity) return display(name);
        return name;
    }

    // The longest run of parts that forms an exception stays together.
    private static void commaSplit(List out, String raw) {
        String[] chunks = raw.split(COMMA);
        ArrayList cp = new ArrayList();
        for (int i = 0; i < chunks.length; i++) cp.add(chunks[i].trim());
        Set ex = exc();
        int n = cp.size();
        int i = 0;
        while (i < n) {
            int bestJ = -1;
            StringBuilder sb = new StringBuilder();
            for (int j = i; j < n; j++) {
                if (j > i) sb.append(", ");
                sb.append((String) cp.get(j));
                if (ex.contains(norm(sb.toString()))) bestJ = j;
            }
            if (bestJ >= i) {
                StringBuilder disp = new StringBuilder();
                for (int j = i; j <= bestJ; j++) {
                    if (j > i) disp.append(", ");
                    disp.append((String) cp.get(j));
                }
                String d = disp.toString().trim();
                if (d.length() > 0) out.add(d);
                i = bestJ + 1;
            } else {
                String p = (String) cp.get(i);
                if (p.length() > 0) out.add(p);
                i++;
            }
        }
    }

    /** getArtistsBySort: the artist list expanded into parts, de-duplicated case-insensitively. */
    public static List list(List raw, Y1Repository.SortArtistsType type) {
        if (raw == null || !splitEnabled()) return raw;
        LinkedHashMap seen = new LinkedHashMap();
        for (int i = 0; i < raw.size(); i++) {
            List ps = parts((String) raw.get(i));
            for (int j = 0; j < ps.size(); j++) {
                String p = (String) ps.get(j);
                String k = norm(p);
                if (!seen.containsKey(k)) seen.put(k, p);
            }
        }
        ArrayList result = new ArrayList(seen.values());
        Collections.sort(result, new NameCmp(type == Y1Repository.SortArtistsType.Z_A));
        return result;
    }

    /**
     * The same expansion for one genre ({@code getArtistsByGenreSync}). Re-sorted only when the
     * query sorted by name — a by-date list keeps its order.
     */
    public static List listGenre(List raw) {
        if (raw == null || !splitEnabled()) return raw;
        LinkedHashMap seen = new LinkedHashMap();
        for (int i = 0; i < raw.size(); i++) {
            List ps = parts((String) raw.get(i));
            for (int j = 0; j < ps.size(); j++) {
                String p = (String) ps.get(j);
                String k = norm(p);
                if (!seen.containsKey(k)) seen.put(k, p);
            }
        }
        ArrayList result = new ArrayList(seen.values());
        SharedPreferencesUtils s = SharedPreferencesUtils.INSTANCE;
        if (s.isSortByName()) Collections.sort(result, new NameCmp(!s.isSortLogic()));
        return result;
    }

    /**
     * {@link #songs} within a genre ({@code getSongsByArtistSync}'s genre branch); null = use the
     * stock exact-match query. The order mirrors the four stock DAO variants.
     */
    public static List songsInGenre(String artist, Genre genre) {
        if (genre == null) return null;
        // a composite genre has no stock query to fall back to, so it is always answered here
        boolean splitGenre = GenreSplit.composite(genre);
        if (!splitEnabled() && !splitGenre) return null;
        Y1Repository repo = Y1Application.Companion.getY1Repository();
        if (repo == null) return null;
        List all = repo.getSongsByGenreSync(genre);
        if (all == null) return null;
        String target = norm(artist);
        ArrayList matched = new ArrayList();
        boolean appearsAsPart = false;
        for (int i = 0; i < all.size(); i++) {
            Song s = (Song) all.get(i);
            if (!has(s.getArtist(), artist)) continue;
            matched.add(s);
            if (!norm(s.getArtist()).equals(target)) appearsAsPart = true;
        }
        if (!appearsAsPart && !splitGenre) return null;
        SharedPreferencesUtils sp = SharedPreferencesUtils.INSTANCE;
        Y1Repository.SongSortType type;
        if (sp.isSortByName()) {
            type = sp.isSortLogic()
                    ? Y1Repository.SongSortType.FileName_A_To_Z
                    : Y1Repository.SongSortType.FileName_Z_To_A;
        } else {
            type = sp.isSortLogic()
                    ? Y1Repository.SongSortType.Time_Asc
                    : Y1Repository.SongSortType.Time_Desc;
        }
        Collections.sort(matched, new SongCmp(type));
        return matched;
    }

    /**
     * True when {@code tag} credits {@code artist}: exactly, or — while splitting is on — by a
     * part. Exact first: with splitting off the list shows whole tags.
     */
    public static boolean has(String tag, String artist) {
        String target = norm(artist);
        if (target.length() == 0) return false;
        if (norm(tag).equals(target)) return true;
        if (!splitEnabled()) return false;
        return inParts(tag, target);
    }

    private static final HashMap NPARTS = new HashMap();

    /** Whether a part of the tag is this normalised name. The normalised parts are kept per tag. */
    private static boolean inParts(String tag, String target) {
        if (tag == null) return false;
        String[] ps = normParts(tag);
        for (int i = 0; i < ps.length; i++) {
            if (ps[i].equals(target)) return true;
        }
        return false;
    }

    private static String[] normParts(String tag) {
        String[] ps;
        synchronized (NPARTS) { ps = (String[]) NPARTS.get(tag); }
        if (ps == null) {
            List l = parts(tag);
            ps = new String[l.size()];
            for (int i = 0; i < ps.length; i++) ps[i] = norm((String) l.get(i));
            synchronized (NPARTS) { NPARTS.put(tag, ps); }
        }
        return ps;
    }

    private static List ixFor;
    private static String[] ixWhole;
    private static String[][] ixParts;
    private static int ixGen;

    /** The normalised tag and its parts of every song, by index in the list: built once per list. */
    static void index(List all) {
        if (all == null) return;
        int gen;
        synchronized (NPARTS) {
            if (ixFor == all) return;
            gen = ixGen;
        }
        int n = all.size();
        String[] w = new String[n];
        String[][] p = new String[n][];
        for (int i = 0; i < n; i++) {
            Object o = all.get(i);
            if (!(o instanceof Song)) continue;
            String tag = ((Song) o).getArtist();
            if (tag == null) continue;
            w[i] = norm(tag);
            p[i] = normParts(tag);
        }
        synchronized (NPARTS) {
            if (gen != ixGen) return;
            ixFor = all;
            ixWhole = w;
            ixParts = p;
        }
    }

    /**
     * What {@link #songs} and then {@link #byTag} answer for no genre, in one pass over the index.
     * Null when the index is not this list's, and the two are to be asked themselves.
     */
    private static List ofArtist(String artist) {
        List all = Albums.allSongs();
        String target = norm(artist);
        if (all == null || target.length() == 0) return null;
        index(all);
        String[] w;
        String[][] p;
        synchronized (NPARTS) {
            if (ixFor != all) return null;
            w = ixWhole;
            p = ixParts;
        }
        boolean split = splitEnabled();
        ArrayList part = new ArrayList();
        ArrayList any = new ArrayList();
        boolean asPart = false;
        for (int i = 0; i < w.length; i++) {
            if (w[i] == null) continue;
            boolean whole = w[i].equals(target);
            boolean in = false;
            if (split) {
                String[] ps = p[i];
                for (int j = 0; j < ps.length; j++) {
                    if (ps[j].equals(target)) { in = true; break; }
                }
            }
            if (in) {
                part.add(all.get(i));
                if (!whole) asPart = true;
            }
            if (whole || in) any.add(all.get(i));
        }
        if (asPart) {
            Collections.sort(part, new SongCmp(Y1Repository.SongSortType.SongName_A_To_Z));
            return part;
        }
        return any;
    }

    private static final class NameCmp implements Comparator {
        private final boolean rev;
        NameCmp(boolean rev) { this.rev = rev; }
        public int compare(Object a, Object b) {
            int c = norm((String) a).compareTo(norm((String) b));
            return rev ? -c : c;
        }
    }

    /**
     * An artist's songs to ACT on (playlists, the album list): the same set the screen draws.
     * Never null and never empty while the artist has songs — the row is a name derived from the
     * tag, which the exact-match stock query can miss; {@link #byTag} uses the row's own test.
     *
     * @param genre non-null inside Genres, where an artist means "in this genre".
     */
    public static List forMenu(String artist, Genre genre) {
        if (AlbumArtists.is(artist)) return AlbumArtists.songs(artist, Y1Repository.SongSortType.SongName_A_To_Z);
        try {
            List one = (genre == null) ? ofArtist(artist) : null;
            if (one != null && !one.isEmpty()) return one;
            if (one == null) {
                List split = (genre != null) ? songsInGenre(artist, genre)
                                             : songs(artist, Y1Repository.SongSortType.SongName_A_To_Z);
                if (split != null && !split.isEmpty()) return split;
                if (genre == null) {
                    List cached = byTag(artist, null);
                    if (cached != null && !cached.isEmpty()) return cached;
                }
            }
            Y1Repository repo = Y1Application.Companion.getY1Repository();
            if (repo != null) {
                List l = repo.getSongsByArtistSync(artist, 0, genre);
                if (l != null && !l.isEmpty()) return l;
            }
            List byTag = byTag(artist, genre);
            if (byTag != null) return byTag;
        } catch (Throwable t) {
        }
        return new ArrayList();
    }

    /** Songs crediting {@code artist} by the rule the artist LIST is built with. */
    private static List byTag(String artist, Genre genre) {
        try {
            List all = Albums.allSongs();
            if (all == null) return null;
            String g = genre == null || genre.getName() == null ? null : genre.getName().trim();
            ArrayList out = new ArrayList();
            for (int i = 0; i < all.size(); i++) {
                Object o = all.get(i);
                if (!(o instanceof Song)) continue;
                Song s = (Song) o;
                if (!has(s.getArtist(), artist)) continue;
                if (g != null && g.length() > 0 && !GenreSplit.hasLoose(s.getGenre(), g)) continue;
                out.add(s);
            }
            return out;
        } catch (Throwable t) {
            return null;
        }
    }

    /**
     * getSongsByArtist: songs where {@code artist} is a part of the tag; null when it never is a
     * part, so an ordinary artist keeps the stock query.
     */
    public static List songs(String artist, Y1Repository.SongSortType sortType) {
        if (AlbumArtists.is(artist)) return AlbumArtists.songs(artist, sortType);
        if (!splitEnabled()) return null;
        List all = Albums.allSongs();
        if (all == null) return null;
        String target = norm(artist);
        ArrayList matched = new ArrayList();
        boolean appearsAsPart = false;
        for (int i = 0; i < all.size(); i++) {
            Song s = (Song) all.get(i);
            boolean hit = inParts(s.getArtist(), target);
            if (hit) {
                matched.add(s);
                if (!norm(s.getArtist()).equals(target)) appearsAsPart = true;
            }
        }
        if (!appearsAsPart) return null;
        Collections.sort(matched, new SongCmp(sortType));
        return matched;
    }

    /** The stock ORDER BY of getSongsByArtist. */
    static final class SongCmp implements Comparator {
        private final Y1Repository.SongSortType type;
        SongCmp(Y1Repository.SongSortType type) { this.type = type; }
        public int compare(Object oa, Object ob) {
            Song a = (Song) oa;
            Song b = (Song) ob;
            if (type == Y1Repository.SongSortType.Time_Asc) return cmpLong(a.getFileDate(), b.getFileDate());
            if (type == Y1Repository.SongSortType.Time_Desc) return -cmpLong(a.getFileDate(), b.getFileDate());
            if (type == Y1Repository.SongSortType.SongName_A_To_Z) return cmpStr(a.getPinyinSongName(), b.getPinyinSongName());
            if (type == Y1Repository.SongSortType.SongName_Z_To_A) return -cmpStr(a.getPinyinSongName(), b.getPinyinSongName());
            if (type == Y1Repository.SongSortType.Album) return cmpStr(a.getPinyinAlbum(), b.getPinyinAlbum());
            if (type == Y1Repository.SongSortType.FileName_Z_To_A) return -cmpStr(a.getPinyinName(), b.getPinyinName());
            return cmpStr(a.getPinyinName(), b.getPinyinName());
        }
    }

    private static int cmpStr(String a, String b) {
        return norm(a).compareTo(norm(b));
    }

    private static int cmpLong(long a, long b) {
        return a < b ? -1 : (a > b ? 1 : 0);
    }

    // "Open artist" in a menu: one implementation for every screen, so they cannot drift apart.

    /** The artists of a song as rows of the Artists list, or null when there is nothing to open. */
    public static List of(Song s) {
        if (s == null) return null;
        String tag = s.getArtist();
        if (tag == null || tag.length() == 0 || tag.equals(Constant.UNKNOWN)) return null;
        ArrayList out = new ArrayList();
        if (splitEnabled()) {
            List p = parts(tag);
            for (int i = 0; i < p.size(); i++) {
                String one = (String) p.get(i);
                if (one != null && one.length() > 0) out.add(one);
            }
        } else {
            out.add(tag);
        }
        return out.isEmpty() ? null : out;
    }

    /** The song a long press was raised on: the ticked row, else the row under the cursor. */
    public static Song focused(MyBaseAdapter songs) {
        try {
            if (songs == null) return null;
            Object o = null;
            List sel = songs.getSelectedIndexList();
            if (sel != null && !sel.isEmpty()) o = songs.getItem(((Integer) sel.get(0)).intValue());
            if (o == null) o = songs.getItem(songs.getPosition());
            return (o instanceof Song) ? (Song) o : null;
        } catch (Throwable t) {
            return null;
        }
    }

    /** True while the row a menu is being rebuilt for has an artist worth opening. */
    public static boolean canOpen(MyBaseAdapter songs) {
        return of(focused(songs)) != null;
    }

    /**
     * Act on an "Open artist" pick.
     *
     * @return what {@code SubMenuDialog.Callback.select} means: true = close the menu; false = a
     *         submenu is up and dismisses this one itself, so the parent must stay behind it.
     */
    public static boolean openFrom(Activity a, SubMenuDialog parent, MyBaseAdapter songs) {
        try {
            Song s = focused(songs);
            if (of(s) == null) return true;
            if (songs != null) {
                List sel = songs.getSelectedIndexList();
                if (sel != null) sel.clear();
            }
            return openFrom(a, parent, s);
        } catch (Throwable t) {
            return true;
        }
    }

    /** The same, for a screen whose rows are not a {@code MyBaseAdapter}'s (the Search results). */
    public static boolean openFrom(Activity a, SubMenuDialog parent, Song s) {
        try {
            if (a == null) return true;
            List names = of(s);
            if (names == null) return true;
            if (names.size() == 1) {
                open(a, (String) names.get(0));
                return true;
            }
            // A submenu: the parent's select returns false and the child dismisses it on its pick.
            new SubMenuDialog(a, names, new Pick(a, parent), R.style.Dialog_Common).show();
            return false;
        } catch (Throwable t) {
            return true;
        }
    }

    /** Start the artist's album list — exactly what picking them on the Artists screen opens. */
    public static void open(Activity a, String name) {
        if (a == null || name == null || name.length() == 0) return;
        Intent i = new Intent(a, com.innioasis.music.AlbumsActivity.class);
        i.putExtra("ipp_artist", name);
        a.startActivity(i);
    }

    /** A pick in the "which of these artists?" submenu. */
    private static final class Pick implements SubMenuDialog.Callback {
        private final Activity a;
        private final SubMenuDialog parent;

        Pick(Activity a, SubMenuDialog parent) {
            this.a = a;
            this.parent = parent;
        }

        public boolean select(int index, SubmenuAdapter.Item item) {
            if (parent != null) {
                try {
                    parent.dismiss();
                } catch (Throwable t) {
                }
            }
            if (item != null) open(a, item.getString());
            return true;
        }
    }
}
