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
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Set;

/**
 * #281.2 — split artists that a tag glues together with "," or ";" into separate
 * entries (e.g. "Lil Wayne, Eminem" -> "Lil Wayne" + "Eminem"). Separator priority:
 * if the string contains "; " split on that only, otherwise split on ", ".
 *
 * <b>The separator is the punctuation AND the space after it</b> (#220.2). "A;B" and "A,B"
 * are one artist, not two: without a space the character is at least as likely to be part of
 * a name as to be separating two of them, and a wrong split here is not cosmetic — it invents
 * an artist in the list and takes the songs of a real one away. The same rule decides the
 * visual ';' -> ',' of {@link #display}, so what is shown and what is split can never disagree.
 *
 * Comma-split respects an EXCEPTIONS list of names that legitimately contain a comma
 * ("Tyler, the Creator", "Earth, Wind & Fire", ...): those are kept whole. The list
 * lives in a user-editable file on external storage, seeded on first run with a
 * built-in default set (see {@link #DEFAULTS}); if storage is unavailable the built-in
 * defaults are used from memory. Matching is a greedy longest-run merge, so an exception
 * is protected both standalone and inside a collab tag ("Tyler, the Creator, Frank Ocean").
 *
 * Two stock injection points call in here:
 *  - Y1Repository.getArtistsBySort -> {@link #list} expands the artist list.
 *  - Y1Repository.getSongsByArtist -> {@link #songs} returns the union of songs where
 *    the picked name is one of the parts; returns null for ordinary (non-split) artists
 *    so the native SQL query + ordering is used unchanged. This also fixes the
 *    artist->albums path (#281.1), which routes through getSongsByArtist.
 *
 * Gated by {@link #KEY_SPLIT} ("Split artists that are divided by commas and semicolons"),
 * which is On unless switched off.
 * Raw (non-generic) types are used throughout on purpose: the bundled d8 crashes
 * dexing generic Signature attributes (Deck, which has none, compiles fine).
 */
public final class Artists {

    // Built-in default keep-whole names; also seeds the user-editable file on first run.
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

    private static Set exceptions;   // canonicalised names to keep whole (lazy-loaded)

    /**
     * innioasis++ → "Split artists that are divided by commas and semicolons", ON by default.
     *
     * It used to be the inverted "hide_artist_split" ("Merge multi-artist tags"), worded backwards
     * only so that a pref read with a false default showed the right On/Off. The menu can carry a
     * default now (IppActivity's Item.def), so the row says what switching it on does — and the
     * key changed with it, because the same key under the opposite wording would have turned every
     * device that had ever touched the old row into its opposite.
     */
    public static final String KEY_SPLIT = "artist_split";

    public static boolean splitEnabled() {
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) return false;
        return Prefs.on(c, KEY_SPLIT);
    }

    private static String norm(String s) {
        return s == null ? "" : s.trim().toLowerCase(Locale.ROOT);
    }

    // Canonical key for a possibly-comma-containing name: parts trimmed, joined ", ", lowercased.
    // Makes file entries match regardless of the user's spacing around commas.
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

    // ---- exceptions file ----

    /**
     * The card's root is taken from {@code Constant.ROOT_PATH}, not from
     * {@code Environment.getExternalStorageDirectory()}: the app runs as uid {@code system}
     * ({@code sharedUserId}), and for that uid the platform refuses the static storage paths —
     * {@code Environment.throwIfSystem} logs a {@code wtf} with a full stack ("Static storage paths
     * aren't available from AID_SYSTEM") on every call, which lands in the system dropbox. The
     * answer would be that same path anyway; every other place in the app that needs the card names
     * it through this constant.
     */
    private static File exceptionsFile() {
        try {
            File base = new File(Constant.ROOT_PATH);
            if (!base.isDirectory()) return null;
            // Panel.card() names the mod's folder on the card in one place -- it does not create
            // it; seed() below does that when there is a list to write.
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
                    return set;   // file is the source of truth when readable
                }
            }
        } catch (Throwable t) {
            // fall through to in-memory defaults
        }
        for (int i = 0; i < DEFAULTS.length; i++) set.add(canon(DEFAULTS[i]));
        return set;
    }

    /**
     * The file is the user's, and a user may delete it from a PC over USB. Seeding it lazily is
     * not enough on its own: {@link #loadExceptions} runs on the first comma-split of the session,
     * which happens only once a screen or the player actually asks about an artist -- and if the
     * card is not mounted yet at that moment, the answer is the in-memory defaults and the cached
     * set never asks again.
     *
     * So the library scan asks instead ({@code Scan.load}), which is the right moment twice over:
     * it runs at system start and on USB detach -- the very event that can have removed the file --
     * the card is certainly mounted by then, and it is the scan thread, not the main one. Cost is
     * one {@code exists()} against two full-table reads standing next to it.
     *
     * A missing file is written back from {@link #DEFAULTS} and the cached set is dropped, so the
     * split reloads from what was just written; a file that is there is left completely alone,
     * a user's edits to it included. No card means no answer, so nothing is written and the next
     * scan asks again.
     */
    public static void ensureExceptions() {
        try {
            File f = exceptionsFile();
            if (f == null || f.exists()) return;
            seed(f);
            exceptions = null;
        } catch (Throwable t) {
            // an unwritable card is not worth a crash on the way into the main menu
        }
    }

    private static Set exc() {
        if (exceptions == null) exceptions = loadExceptions();
        return exceptions;
    }

    // ---- splitting ----

    /** The separators, space included — see the class comment for why the space is part of them. */
    static final String SEMI = "; ";
    static final String COMMA = ", ";

    /**
     * Split one raw artist tag into its parts using the "; "-over-", " priority + exceptions.
     * Public because {@link Feat} (#358) reuses exactly this splitting — including the
     * comma_artists.txt exceptions — to decide which artists the player may hide.
     */
    public static List parts(String raw) {
        ArrayList out = new ArrayList();
        if (raw == null) return out;
        if (raw.indexOf(SEMI) >= 0) {
            String[] chunks = raw.split(SEMI);
            for (int i = 0; i < chunks.length; i++) {
                String p = chunks[i].trim();
                if (p.length() > 0) out.add(p);
            }
        } else {
            commaSplit(out, raw);
        }
        if (out.isEmpty()) out.add(raw);   // preserve non-splittable / empty tags as-is
        return out;
    }

    /**
     * #220.2 — visual only: a tag that separates its artists with "; " reads as ", ".
     *
     * Same rule as {@link #parts}: only the separator with a space after it, so a ';' that is
     * part of the text itself is left where it is. Nothing here reaches the database or a query
     * key — the callers are row text and the player's artist line.
     */
    public static String display(String raw) {
        if (raw == null || raw.indexOf(SEMI) < 0) return raw;
        return raw.replace(SEMI, COMMA);
    }

    /**
     * {@link #display} for a {@code MainAdapter} row, which is the Artists list — and also the
     * main Music menu and the Genres screen's own levels, none of which have artists in them.
     * So the screen decides: only the two Activities whose MainAdapter holds artist names
     * (ArtistsActivity, and GenresActivity's second level) get the substitution.
     *
     * The row's text is the only thing touched. That same String is the key the songs of the
     * artist are looked up by ({@code getSongsByArtist}), and the list still holds it unchanged.
     */
    public static String rowName(String name, Object adapter) {
        if (name == null || name.indexOf(SEMI) < 0 || !(adapter instanceof MyBaseAdapter)) return name;
        Context c = ((MyBaseAdapter) adapter).getContext();
        if (c instanceof ArtistsActivity || c instanceof GenresActivity) return display(name);
        return name;
    }

    // Split on ", " but greedily keep together any run of parts that forms an exception.
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

    /**
     * Expand a raw distinct-artist list into split parts, de-duplicated
     * case-insensitively (first display form kept) and re-sorted A-Z / Z-A.
     * Called from Y1Repository.getArtistsBySort; returns the input untouched when disabled.
     */
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
     * The artist list of one genre — the same expansion as {@link #list}, wrapped around
     * {@code Y1Repository.getArtistsByGenreSync}. Without it the Genres screen was the one place
     * left showing raw "A, B" rows while every other screen showed A and B separately.
     *
     * The sort is not {@code SortArtistsType} here: the genre query picks one of four DAO methods
     * from the app-wide "sort by name / by date" pair. So the incoming order is preserved (a split
     * tag's parts appear where the tag was) and only re-sorted where the query itself sorted by
     * name — sorting a by-date list alphabetically would be a different list, not a split one.
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
     * Songs of one artist <b>within one genre</b>, part-matching multi-artist tags — the genre
     * counterpart of {@link #songs}, injected into {@code getSongsByArtistSync}'s genre branch.
     * Same contract: null means "not a split artist, use the stock exact-match query".
     *
     * The genre's songs come from the stock query and are then filtered in Java, so the genre
     * membership rule stays the database's. The order mirrors the four DAO variants the stock
     * branch would have used.
     */
    public static List songsInGenre(String artist, Genre genre) {
        if (genre == null) return null;
        // #393: a genre that a composite tag contributes to has no exact-match query to fall back
        // to -- stock's `genre = (?)` answers with nothing for it -- so this method has to answer
        // whether or not the ARTIST is a split one, and even with artist splitting switched off.
        boolean splitGenre = GenreSplit.composite(genre);
        if (!splitEnabled() && !splitGenre) return null;
        Y1Repository repo = Y1Application.Companion.getY1Repository();
        if (repo == null) return null;
        List all = repo.getSongsByGenreSync(genre);   // GenreSplit.songsIn answers for a split one
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
     * True when {@code tag} credits {@code artist}: an exact tag match, and — while splitting
     * is on — any of the tag's parts. The exact check comes first on purpose: with splitting
     * off ("Merge multi-artist tags") the artist list shows whole tags, so "A, B" must match
     * itself rather than being compared against its own parts. Used by {@link Albums} (#281.4).
     */
    public static boolean has(String tag, String artist) {
        String target = norm(artist);
        if (target.length() == 0) return false;
        if (norm(tag).equals(target)) return true;
        if (!splitEnabled()) return false;
        List ps = parts(tag);
        for (int i = 0; i < ps.size(); i++) {
            if (norm((String) ps.get(i)).equals(target)) return true;
        }
        return false;
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
     * An artist's songs for a MENU action — "Add to Playlist N" on an artist row, and anything
     * else that gathers an artist's songs to act on them rather than to draw them.
     *
     * <p>Never null: unlike {@link #songs}, whose null means "let the indexed query answer", a call
     * site here has nowhere to fall back to, so the fallback is made inside. Stock's own
     * {@code getSongsByArtistSync} matches the tag EXACTLY, which for a split artist (#281.2) is a
     * different set from the one the screen is showing — an artist with two songs of their own and
     * three credited as "BEAT CRUSADERS, ASPARAGUS" had five rows on screen and put two in the
     * playlist. The list drawn and the list acted on have to be the same list.
     *
     * <p>And it is never EMPTY either, while the artist really has songs — which is the second half
     * of the same rule and cost its own report (VADDY_NN in the genre Acoustic, then the same
     * artist on the Artists screen). A row of the artist list is a name this class produced:
     * {@link #parts} splits the tag and {@link #norm} trims and lower-cases what comes out. The
     * query behind the row matches the {@code artist} column exactly as written, so a tag with a
     * stray space or a different case leaves a row on screen with nothing behind it — no albums
     * under the artist, nothing added to a playlist. {@link #byTag} answers with the SAME test the
     * row was drawn by, so the two cannot disagree.
     *
     * @param genre non-null inside the Genres section, where an artist means "in this genre".
     */
    public static List forMenu(String artist, Genre genre) {
        try {
            List split = (genre != null) ? songsInGenre(artist, genre)
                                         : songs(artist, Y1Repository.SongSortType.SongName_A_To_Z);
            if (split != null && !split.isEmpty()) return split;
            Y1Repository repo = Y1Application.Companion.getY1Repository();
            if (repo != null) {
                List l = repo.getSongsByArtistSync(artist, 0, genre);
                if (l != null && !l.isEmpty()) return l;
            }
            List byTag = byTag(artist, genre);
            if (byTag != null) return byTag;
        } catch (Throwable t) {
            // fall through to an empty list: a menu action on nothing does nothing
        }
        return new ArrayList();
    }

    /**
     * Every song whose tag credits {@code artist} by the rule the artist LIST is built with, out of
     * the cached song table — the last resort of {@link #forMenu}, for a row whose name no query
     * can match because the name is derived from the tag rather than taken from it.
     */
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
     * Songs where {@code artist} is one of the parts of a song's (possibly multi-artist)
     * tag. Returns null when {@code artist} never appears as a sub-part of a multi-artist
     * tag — signalling the caller to fall back to the native exact-match query so ordinary
     * artists keep the stock SQL ordering untouched.
     */
    public static List songs(String artist, Y1Repository.SongSortType sortType) {
        if (!splitEnabled()) return null;
        Y1Repository repo = Y1Application.Companion.getY1Repository();
        if (repo == null) return null;
        List all = repo.getSongsSync(0);
        if (all == null) return null;
        String target = norm(artist);
        ArrayList matched = new ArrayList();
        boolean appearsAsPart = false;
        for (int i = 0; i < all.size(); i++) {
            Song s = (Song) all.get(i);
            List ps = parts(s.getArtist());
            boolean hit = false;
            for (int j = 0; j < ps.size(); j++) {
                if (norm((String) ps.get(j)).equals(target)) { hit = true; break; }
            }
            if (hit) {
                matched.add(s);
                if (!norm(s.getArtist()).equals(target)) appearsAsPart = true;
            }
        }
        if (!appearsAsPart) return null;   // ordinary standalone artist -> use stock query
        Collections.sort(matched, new SongCmp(sortType));
        return matched;
    }

    /** Java re-implementation of the stock ORDER BY used by getSongsByArtist per sort type. */
    private static final class SongCmp implements Comparator {
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
            // FileName_A_To_Z and any default: order by lower(pinyinName)
            return cmpStr(a.getPinyinName(), b.getPinyinName());
        }
    }

    private static int cmpStr(String a, String b) {
        return norm(a).compareTo(norm(b));
    }

    // Long.compare is API 19; device is API 17, so compare manually.
    private static int cmpLong(long a, long b) {
        return a < b ? -1 : (a > b ? 1 : 0);
    }

    // ================================================================== "Open artist" in a menu
    //
    // The entry the queue screen has had since #227.4, offered on the song lists that do not stand
    // for one artist: All songs, an album inside Albums, and the "Show all songs" lists of Genres.
    // One implementation for all of them, because the split, the submenu and the Intent must not
    // be able to drift apart between screens.

    /**
     * The artists of a song, or null when there is nothing to open. With multi-artist splitting on
     * this is the same split the Artists list itself is built with ({@link #parts}, the
     * {@code comma_artists.txt} exceptions included), so every entry is a row that really exists
     * there; with it off the tag is one artist, which is what the list shows then. Either way the
     * string IS the key the artist's songs are looked up by.
     */
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
            // Same as the "Open album" entry beside it: the highlight would be left on a row of a
            // screen the user is walking away from.
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
            // Several artists on one tag (#281.2) — one entry each, in a menu of their own. Stock's
            // own submenu pattern: the parent's select returns false and the child dismisses it on
            // its pick, so the two dialogs are never both waiting for a press.
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

    /** A pick in the "which of these artists?" submenu. Named, never anonymous: d8 crashes here. */
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
                    // it is already gone; nothing to close
                }
            }
            if (item != null) open(a, item.getString());
            return true;
        }
    }
}
