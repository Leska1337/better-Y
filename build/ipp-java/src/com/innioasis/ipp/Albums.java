package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.util.TypedValue;
import android.view.View;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import com.innioasis.music.adapter.MyBaseAdapter;
import com.innioasis.music.data.Album;
import com.innioasis.music.data.Genre;
import com.innioasis.music.util.SubMenuDialog;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.database.Y1Repository;
import com.innioasis.y1.utils.SharedPreferencesUtils;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * #291.3 — treat same-named albums that are actually DIFFERENT albums as distinct.
 *
 * There is no album-artist column in the DB and API 17's MediaMetadataRetriever can't read
 * the ALBUMARTIST tag, so the physical-album identity is the **folder** the tracks live in
 * (CD1/CD2/Disc-N subfolders roll up to their parent, so multi-disc albums stay one album).
 * An album name shared by >1 folder is encoded as {@code name  folder} in the album list;
 * unique names stay plain. This keeps compilations / feat. tracks in one folder as a single
 * album (all songs), and only splits genuinely different same-named albums.
 *
 * The encoded string is opaque to the list caches (CoverCache/AlbumInfo/YearCache key on it,
 * so list covers/years are per-album) and is decoded only where it feeds a real SQL query or
 * the on-screen label/title. The Now-Playing big cover is keyed by {@link #albumFolder} too.
 *
 * Raw (non-generic) types throughout: the bundled d8 crashes dexing generic Signature attrs.
 */
public final class Albums {

    private static final char SEP = (char) 1;   // SOH (0x01) -- never appears in tag text

    // #281.1 -- the "Show all songs" pseudo-row of the artist view is a second marker: STX + artist.
    // It travels through the very same paths an album name does (list -> confirm -> albumName ->
    // switchSongSortType -> getSongsByAlbum), so the flat artist song list, its sort menu and the
    // Shuffle bar all come from stock code; only the three decoding points below know about it.
    private static final char ALL = (char) 2;   // STX (0x02)

    public static boolean isAllSongs(String s) {
        return s != null && s.length() > 0 && s.charAt(0) == ALL;
    }

    /** The artist a "Show all songs" row belongs to, or null for anything else. */
    public static String allSongsArtist(String s) {
        return isAllSongs(s) ? s.substring(1) : null;
    }

    private static String allMark(String artist) { return ALL + artist; }

    // The same trick once more, for the "Show all songs" row of a GENRE's album list (Genres ->
    // Show all albums). A third control character rather than reusing ALL, because the two decode
    // to different things: ALL means "this artist's songs", GEN means "this genre's songs", and
    // they meet in songsSync.
    private static final char GEN = (char) 3;   // ETX (0x03)

    public static String genreMark(String genre) { return GEN + (genre == null ? "" : genre); }

    /** The "Show all songs" marker of an artist, for building an album list by hand (Genres). */
    public static String artistMark(String artist) { return allMark(artist == null ? "" : artist); }

    /** The encoded album key of a song — the name a list row carries. */
    public static String albumKey(String album, String path) {
        return enc(album == null ? "" : album, albumFolder(path));
    }

    public static boolean isGenreAll(String s) {
        return s != null && s.length() > 0 && s.charAt(0) == GEN;
    }

    public static boolean isEnc(String s) { return s != null && s.indexOf(SEP) >= 0; }

    public static String realName(String s) {
        if (s == null) return null;
        if (isAllSongs(s) || isGenreAll(s)) return s.substring(1);   // the flat list's title bar
        int i = s.indexOf(SEP);
        return i < 0 ? s : s.substring(0, i);
    }

    private static String folderOf(String s) {
        if (s == null) return null;
        int i = s.indexOf(SEP);
        return i < 0 ? null : s.substring(i + 1);
    }

    private static String enc(String name, String folder) { return name + SEP + folder; }

    private static boolean eq(String a, String b) {
        return (a == null ? "" : a).equals(b == null ? "" : b);
    }

    /**
     * The encoded album key of a track — the very key `CoverCache` uses for list thumbnails,
     * so a song can be turned back into its cached 50px cover.
     */
    public static String keyOf(Song s) {
        if (s == null) return null;
        String album = s.getAlbum() == null ? "" : s.getAlbum();
        return enc(album, albumFolder(s.getPath()));
    }

    /** Immediate parent directory of a track (per-disc; used for the Now-Playing cover). */
    public static String trackFolder(String path) {
        if (path == null) return "";
        int i = path.lastIndexOf('/');
        return i < 0 ? "" : path.substring(0, i);
    }

    /** Physical-album folder of a track: its parent dir, with CD/Disc subfolders rolled up. */
    public static String albumFolder(String path) {
        String dir = trackFolder(path);
        int j = dir.lastIndexOf('/');
        if (j < 0) return dir;
        String base = dir.substring(j + 1);
        return isCdFolder(base) ? dir.substring(0, j) : dir;   // roll CD1/CD2 up to parent
    }

    // A "CD<n>" / "Disc<n>" disc folder: the token may sit anywhere in the name
    // (e.g. "CD2 (Bonus disk)"), not the whole name.
    private static final Pattern CD_PAT = Pattern.compile("(cd|disc|disk|диск)[ ._-]?(\\d+)");

    private static boolean isCdFolder(String name) {
        return discNumber(name) > 0;
    }

    /**
     * The disc a track belongs to: its folder if the folder says so ("CD1", "Disc 2", "Диск3"),
     * otherwise its DISC NUMBER tag, and 0 when neither knows.
     *
     * The folder comes first deliberately — it is free, and it is how the files were actually laid
     * out. The tag covers the case the folder cannot see at all: a multi-disc album sitting in one
     * folder. It is only ever a cache lookup here; the reading happens in "Cache library".
     *
     * A value of {@code Disc.SIDE_BASE + n} is a SIDE of a record, read off a vinyl-style track
     * number ("A1") by {@code DiscCache}. It is a disc everywhere below this line — the offset
     * only keeps sides above every real disc number, so this ordering stays right.
     */
    public static int discOf(String path) {
        int d = discNumber(trackFolder(path));
        return d > 0 ? d : DiscCache.get(path);
    }

    /** Disc number parsed from a folder name (e.g. "CD2 (Bonus)" -> 2), or 0 if none. */
    public static int discNumber(String name) {
        if (name == null) return 0;
        Matcher m = CD_PAT.matcher(name.toLowerCase(Locale.ROOT));
        if (!m.find()) return 0;
        try { return Integer.parseInt(m.group(2)); } catch (Throwable t) { return 0; }
    }

    // Every album query below scans the full library (there is no album-artist column, so the
    // (name,folder) filtering is done in Java), and `getSongsSync(0)` is a full table read that
    // constructs a Song object per row. Caching it means a burst of operations (list split +
    // every thumbnail + YearCache.warm + opening an album) shares ONE Room load instead of one
    // per album -- and, since the cache is invalidated by EVENT (below), re-entering the Albums
    // screen later in the same session costs nothing at all.
    //
    // The TTL is only a backstop against a write path this file does not know about: if some
    // future code changes the Song table without calling invalidate(), stale lists heal on their
    // own within it instead of surviving until the app restarts.
    private static List songCache;
    private static long songCacheAt;
    private static final long CACHE_TTL_MS = 600000L;   // 10 min backstop, not the primary rule

    /**
     * Drop the cached library. Called from every point that writes the Song table — the six
     * `SongDao.insert/delete` call sites inside `Y1Repository` and its `insertSong` /
     * `refreshDatabase` lambdas. Deliberately trivial: a full library scan calls this once per
     * file, and clearing a field hundreds of times costs nothing.
     */
    public static void invalidate() {
        songCache = null;
        songCacheAt = 0L;
        keyMemo = null;
        Find.clear();       // the Search rows count their songs off this very list
    }

    // ---- "Cache library" (IppActivity) -------------------------------------------------------
    //
    // Whether the caches are already filled is answered by a signature of the library — the row
    // count and the newest file date — written when a pass completes. It lives in the ipp
    // preferences, i.e. NOT in the caches themselves, so "Clear cache" has to knock it out
    // explicitly: otherwise the button reports "already cached" for caches that were just wiped.
    // Kept here rather than in IppActivity so both the writer and SettingActivity's clear path
    // agree on the keys.

    private static final String CACHE_N = "cache_n";
    private static final String CACHE_T = "cache_t";
    private static final String CACHE_M = "cache_m";
    private static final String CACHE_V = "cache_v";

    /**
     * What the pass fills. Bump it whenever it starts filling something it did not before, or an
     * install whose library has not changed since the last pass reports "already cached" for caches
     * that were never written. 2 = the Now-Playing covers were added; 3 = the signature carries a
     * category mask instead of the single "track numbers too" flag.
     */
    private static final int CACHE_VERSION = 3;

    /**
     * Which categories the signature vouches for ({@code Pick.COVERS} / {@code Pick.TAGS}), or 0
     * when it describes another library altogether. Since the user picks what to cache and what to
     * clear, "already cached" is a question about the selected categories, not about the pass.
     */
    private static int cachedMask(Context c, int songs, int stamp) {
        if (c == null) return 0;
        if (Prefs.getInt(c, CACHE_N, -1) != songs
                || Prefs.getInt(c, CACHE_T, -1) != stamp
                || Prefs.getInt(c, CACHE_V, 0) != CACHE_VERSION) return 0;
        return Prefs.getInt(c, CACHE_M, 0);
    }

    /** True while the stored signature still describes this library, for all of these categories. */
    public static boolean cached(Context c, int songs, int stamp, int mask) {
        return mask != 0 && (cachedMask(c, songs, stamp) & mask) == mask;
    }

    /**
     * A pass finished. The categories it filled are added to whatever the signature already
     * vouched for — but only while it describes this same library; otherwise it starts from here.
     */
    public static void noteCached(Context c, int songs, int stamp, int mask) {
        if (c == null) return;
        int had = cachedMask(c, songs, stamp);
        Prefs.setInt(c, CACHE_N, songs);
        Prefs.setInt(c, CACHE_T, stamp);
        Prefs.setInt(c, CACHE_V, CACHE_VERSION);
        Prefs.setInt(c, CACHE_M, had | mask);
    }

    /** Called from SettingActivity's "Clear cache": everything the signature vouched for is gone. */
    public static void cacheCleared() {
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) return;
        Prefs.setInt(c, CACHE_N, -1);
        Prefs.setInt(c, CACHE_T, -1);
        Prefs.setInt(c, CACHE_V, 0);
        Prefs.setInt(c, CACHE_M, 0);
    }

    /** Only some categories were cleared: the signature keeps vouching for the rest. */
    public static void cacheCleared(int mask) {
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) return;
        Prefs.setInt(c, CACHE_M, Prefs.getInt(c, CACHE_M, 0) & ~mask);
    }

    // package-private: Folders (#224) walks the same cached list to find a folder's songs
    public static List allSongs() {
        List c = songCache;
        if (c != null && System.currentTimeMillis() - songCacheAt < CACHE_TTL_MS) return c;
        Y1Repository repo = Y1Application.Companion.getY1Repository();
        if (repo == null) return null;
        List all = repo.getSongsSync(0);
        if (all != null) { songCache = all; songCacheAt = System.currentTimeMillis(); }
        return all;
    }

    // ---- the canonical cache key of an album --------------------------------------------------
    //
    // Every per-album cache (CoverCache, AlbumInfo, AlbumArtist, YearCache) is keyed by the album
    // string the row carries, and on the Albums screen that string is folder-encoded (#291.3). The
    // Genres screen is not ours: it puts PLAIN album names in the very same AlbumListAdapter, so
    // the same album asked under two different keys — the thumbnails were decoded a second time,
    // written to the cache a second time, and flashed in on entry even though the Albums screen
    // had cached them all.
    //
    // coverKey() is the translation, applied inside the caches themselves rather than at each of
    // the eight call sites in the adapter. An encoded name is returned untouched (the Albums screen
    // pays nothing, not even a lookup), and a plain name is encoded only when it belongs to exactly
    // ONE folder — where the answer is unambiguous, which is the overwhelming majority. A name
    // shared by several folders is one row in Genres but several on the Albums screen, so there is
    // no single right entry to point at; it keeps its own, as before.

    private static HashMap keyMemo;

    public static String coverKey(String name) {
        if (name == null || name.length() == 0 || isEnc(name) || isAllSongs(name)) return name;
        HashMap m = keyMemo;
        if (m == null) {
            List all = allSongs();
            if (all == null) return name;
            LinkedHashMap byName = foldersByName(all);
            m = new HashMap();
            Iterator it = byName.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry e = (Map.Entry) it.next();
                Object v = e.getValue();
                if (!(v instanceof LinkedHashSet)) continue;
                LinkedHashSet set = (LinkedHashSet) v;
                if (set.size() != 1) continue;
                String plain = (String) e.getKey();
                m.put(plain, enc(plain, (String) set.iterator().next()));
            }
            keyMemo = m;
        }
        Object k = m.get(name);
        return k == null ? name : (String) k;
    }

    // Build album-name -> ordered set of album folders, from a song list.
    private static LinkedHashMap foldersByName(List songs) {
        LinkedHashMap map = new LinkedHashMap();
        for (int i = 0; i < songs.size(); i++) {
            Song s = (Song) songs.get(i);
            String key = s.getAlbum() == null ? "" : s.getAlbum();
            Object o = map.get(key);
            LinkedHashSet set = (o == null) ? null : (LinkedHashSet) o;
            if (set == null) { set = new LinkedHashSet(); map.put(key, set); }
            set.add(albumFolder(s.getPath()));
        }
        return map;
    }

    /**
     * Album list for the Albums screen. Called from AlbumsActivity in place of the stock
     * filter. Main view: split same-name-different-folder albums. Artist view (ipp_artist):
     * that artist's albums, each folder-encoded so opening shows only its own songs.
     */
    public static List listForView(List names, Activity activity) {
        String artist = null;
        if (activity != null) {
            Intent it = activity.getIntent();
            if (it != null) artist = it.getStringExtra("ipp_artist");
        }
        scope = artist;   // #281.4: remember whose album list this is (cleared by the main view)
        artistList = artist != null;   // which of the two stored sorts this list uses
        if (artist == null) return split(names);

        if (names == null) return names;
        // Not repo.getSongsByArtist: that matches the artist column as written, and an artist ROW
        // is a name Artists derived from a tag (split into parts, trimmed, lower-cased). A tag with
        // a stray space or a different case therefore left the row on screen with no albums under
        // it at all -- the same defect that was fixed inside a genre first (VADDY_NN in Acoustic).
        // forMenu is the one lookup that answers with the test the row was drawn by.
        List asongs = Artists.forMenu(artist, null);
        if (asongs == null || asongs.isEmpty()) return new ArrayList();
        LinkedHashMap byName = foldersByName(asongs);
        ArrayList out = new ArrayList();
        if (!asongs.isEmpty()) out.add(allMark(artist));   // #281.1: first row = "Show all songs"
        for (int i = 0; i < names.size(); i++) {
            String name = (String) names.get(i);
            Object o = byName.get(name == null ? "" : name);
            if (o == null) continue;   // this artist doesn't have this album
            ArrayList folders = new ArrayList((LinkedHashSet) o);
            Collections.sort(folders, STR_CMP);
            for (int j = 0; j < folders.size(); j++) out.add(enc(name, (String) folders.get(j)));
        }
        return byYear(out);
    }

    /**
     * #291.2 — order by release year, per PHYSICAL album.
     *
     * Stock sorted the plain album names in {@code getAlbumsBySort}, i.e. before the split below
     * runs, so two same-named albums in different folders shared one year (the first one's) and
     * came out adjacent no matter what years they actually display. Sorting here instead — on the
     * encoded names, which is what YearCache keys on — gives each of them its own position.
     * The "Show all songs" marker row (index 0) is not an album and stays pinned at the top.
     */
    private static List byYear(ArrayList out) {
        try {
            int st = albumSortValue();
            boolean desc = st == Y1Repository.SortAlbumType.Date_Desc.getType();
            if (!desc && st != Y1Repository.SortAlbumType.Date_Asc.getType()) return out;
            int from = (!out.isEmpty() && isAllSongs((String) out.get(0))) ? 1 : 0;
            List tail = out.subList(from, out.size());   // a view: sorting it sorts `out`
            YearCache.warm(tail);
            Collections.sort(tail, new YearComparator(desc));
        } catch (Throwable t) {
            // an unsortable list is still a usable list
        }
        return out;
    }

    /**
     * #281.1 — paint the "Show all songs" pseudo-row. Called from AlbumListAdapter.getView before
     * it looks up a cover/artist; true means "this row is ours, skip the whole album lookup"
     * (which also keeps the row off the background cover thread).
     *
     * Rows are recycled, so the row look is set on EVERY row, not only ours — otherwise a row
     * that once was the pseudo-row would keep its font size / hidden artist line as an album.
     * Hiding the artist line is what centres the label: album_name + artist_name form a packed
     * vertical chain, so a GONE artist collapses the chain to the label alone.
     */
    public static boolean allSongsRow(Album album, ImageView cover, TextView artistTv, TextView albumTv) {
        boolean mine = album != null && (isAllSongs(album.getName()) || isGenreAll(album.getName()));
        if (albumTv != null) {
            // 22sp = the Shuffle row's size; 20sp is item_album.xml's own
            albumTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, mine ? 22f : 20f);
        }
        if (artistTv != null) artistTv.setVisibility(mine ? View.GONE : View.VISIBLE);
        if (!mine) {
            // Rows are recycled: a leftover #228.1 tint/dim would paint a real album cover.
            Icons.reset(cover);
            pendingIcon = null;
            return false;
        }
        String label = "Show all songs";
        Context c = Y1Application.Companion.getAppContext();
        if (c != null) label = c.getString(R.string.ipp_show_all_songs);
        if (albumTv != null) albumTv.setText(label);
        if (cover != null) cover.setImageResource(R.mipmap.ipp_show_all_songs);
        // The row's text colour is only applied later in getView, so the icon is coloured by
        // tintAllSongsRow() at the very end of the same pass.
        pendingIcon = cover;
        return true;
    }

    /**
     * #228.1 — finish the "Show all songs" icon at the END of AlbumListAdapter.getView.
     *
     * {@link #allSongsRow} runs near the top of getView, before the row's ThemeManager text
     * colours are applied, so the colour the icon should copy does not exist yet. The handoff is a
     * plain static because getView is strictly sequential on the UI thread: allSongsRow parks the
     * ImageView here (or clears it for an ordinary row) and this call, one pass later, consumes it.
     * Doing it here is also what makes the icon re-colour together with the label when the wheel
     * lands on the row — getView re-binds it on every focus change. Unlike the Now-Playing row,
     * this is unconditional: {@code icon_tint} only covers the player.
     */
    private static ImageView pendingIcon;

    public static void tintAllSongsRow(TextView albumTv) {
        ImageView iv = pendingIcon;
        pendingIcon = null;
        if (iv == null || albumTv == null) return;
        Icons.menu(iv, albumTv.getCurrentTextColor());
    }

    // ---- the album LIST keeps one sort per view ------------------------------------------------
    //
    // The Albums screen and an artist's album list are the SAME Activity, and stock keeps one
    // preference for it (albumSort, written as a side effect of getAlbumsBySort) — so ordering an
    // artist's albums by year re-ordered the main Albums screen as well. The artist view now has a
    // key of its own, the same way the flat "Show all songs" list keeps its own song sort below.
    //
    // Which of the two applies is decided by the SCREEN, not by `scope`: the write happens inside
    // Y1Repository, which has no Activity to ask, and `scope` is armed by listForView — i.e. one
    // list build too late for the write that starts the same build. `noteAlbumList` is therefore
    // called at the top of AlbumsActivity.getAlbumListBySort, the single path to getAlbumsBySort.
    private static final String ARTIST_SORT = "artist_album_sort";

    /** True while the album list being built is one artist's. */
    private static boolean artistList;

    private static boolean artistView(Activity a) {
        try {
            return a != null && a.getIntent() != null
                    && a.getIntent().getStringExtra("ipp_artist") != null;
        } catch (Throwable t) {
            return false;
        }
    }

    /** Injected at the top of AlbumsActivity.getAlbumListBySort. */
    public static void noteAlbumList(Activity a) {
        artistList = artistView(a);
    }

    /** Replaces {@code SharedPreferencesUtils.getSortAlbum()} in AlbumsActivity.initView. */
    public static int albumSort(Activity a) {
        noteAlbumList(a);
        return albumSortValue();
    }

    /** The stored sort of a screen the caller has in hand (Alpha, deciding letters vs years). */
    public static int albumSortFor(Activity a) {
        return sortValue(artistView(a));
    }

    /** The stored sort of the list being built right now. */
    public static int albumSortValue() {
        return sortValue(artistList);
    }

    private static int sortValue(boolean artist) {
        if (!artist) return SharedPreferencesUtils.INSTANCE.getSortAlbum();
        Context c = Y1Application.Companion.getAppContext();
        int def = Y1Repository.SortAlbumType.A_Z.getType();   // the same default stock uses
        return (c == null) ? def : Prefs.getInt(c, ARTIST_SORT, def);
    }

    /** Replaces the stock {@code setSortAlbum} in Y1Repository.getAlbumsBySort. */
    public static void noteAlbumSort(int type) {
        if (artistList) {
            Context c = Y1Application.Companion.getAppContext();
            if (c != null) Prefs.setInt(c, ARTIST_SORT, type);
            return;
        }
        SharedPreferencesUtils.INSTANCE.setSortAlbum(type);
    }

    // ---- #281.1: the flat list keeps its own sort ---------------------------------------------
    // Stock persists ONE preference (sortAlbumSong) for "the song list of an album", written as a
    // side effect of getSongsByAlbum and read back by AlbumsActivity.confirm. The "Show all songs"
    // list rides the very same path, so picking "Subdiv. by Album" there used to become the sort
    // of every real album afterwards. The marker list now writes/reads its own key instead.
    private static final String ALL_SORT = "all_sort";

    /** Replaces the stock {@code setSortAlbumSong} in getSongsByAlbum. */
    /**
     * The sort of the song list AlbumsActivity is showing right now.
     *
     * There is no way to ask the Activity: {@code albumName} is private and reachable only through
     * a synthetic accessor, which Java cannot call. But {@link #noteSort} runs on every build of
     * that list (it replaced stock's {@code setSortAlbumSong} inside {@code getSongsByAlbum}), so
     * recording it there answers the question without touching stock code. Read by {@code Alpha},
     * which needs to know whether jumping by letter would mean anything on this list.
     */
    private static int songSort = -1;

    /** Which list that is — the encoded album key, or one of the marker names (#281.1). */
    private static String listKey;

    public static int songListSort() {
        return songSort;
    }

    /**
     * The level the queue has to re-open when the Albums screen is gone (see {@link #restore}).
     *
     * Guarded by the screen's TITLE rather than trusted outright: the album LIST can start playback
     * too (its Shuffle row), and there the last song list built belongs to some album the user
     * opened earlier. The title of an album's song list is exactly {@link #realName} of its key, so
     * comparing the two says whether the recorded list is the one that was playing.
     */
    public static String levelFor(String title) {
        String k = listKey;
        if (k == null || title == null) return null;
        return title.equals(realName(k)) ? k : null;
    }

    /**
     * Re-open that level in a freshly started AlbumsActivity and land on the playing track.
     *
     * The same two steps as "Open album" (#362.2), and for the same reason: an album is chosen
     * INSIDE the Activity, so its own Intent names the section, not the list. The Intent handed in
     * is a copy of the one the screen was started with, which is what carries the artist scope
     * (#281.4) when the source was an artist's album list.
     */
    public static void restore(Intent i, String key, String focusPath) {
        if (i == null || key == null) return;
        i.putExtra(EXTRA_OPEN, key);
        pendingFocus = focusPath;
        // The top button LEAVES the screen instead of climbing to the album list: this album was
        // opened as "where the track came from", and what is underneath it is the player the queue
        // was reached from — which is where the user expects one press back to go.
        closeOnBack = true;
        returnAlbum = null;
        returnFocus = null;
    }

    public static void noteSort(String album, Y1Repository.SongSortType type) {
        if (type == null) return;
        int v = type.getType();
        songSort = v;
        listKey = album;
        if (isAllSongs(album)) {
            Context c = Y1Application.Companion.getAppContext();
            if (c != null) Prefs.setInt(c, ALL_SORT, v);
            return;
        }
        SharedPreferencesUtils.INSTANCE.setSortAlbumSong(v);
    }

    /** Replaces the stock {@code SongSortType.fromType(getSortAlbumSong())} in AlbumsActivity.confirm. */
    public static Y1Repository.SongSortType sortFor(String album) {
        int def = SharedPreferencesUtils.INSTANCE.getSortAlbumSong();
        if (isAllSongs(album)) {
            Context c = Y1Application.Companion.getAppContext();
            int v = (c == null) ? def : Prefs.getInt(c, ALL_SORT, def);
            return Y1Repository.SongSortType.Companion.fromType(v);
        }
        // A real album never offers "Subdiv. by Album", so an Album value here can only be a
        // leftover written by the flat list before this split existed -- ordering an album by its
        // own name is a no-op that also hides the track order. Fall back to the album default.
        if (def == Y1Repository.SongSortType.Album.getType()) {
            return Y1Repository.SongSortType.Track_Number;
        }
        return Y1Repository.SongSortType.Companion.fromType(def);
    }

    /**
     * #281.1 — refill the song-level menu of AlbumsActivity for the list currently on screen.
     * The dialog is a per-activity lazy singleton but serves two different lists: a real album
     * (track order makes sense, album subdivision does not) and the flat artist list built by the
     * "Show all songs" row (the other way round). Called right before every show().
     */
    public static void songMenu(SubMenuDialog dlg, Activity a, String albumName, MyBaseAdapter songs) {
        if (dlg == null || a == null) return;
        songDlg = dlg;
        boolean all = isAllSongs(albumName);
        ArrayList l = new ArrayList();
        l.add(a.getString(R.string.song_menu_sort_by_songname));
        l.add(a.getString(R.string.song_menu_sort_by_filename));
        if (all) l.add(a.getString(R.string.song_menu_sort_by_album));
        else if (Prefs.trackSortEnabled()) l.add(a.getString(R.string.ipp_sort_by_track));
        l.add(a.getString(R.string.music_multi_select));
        l.add(a.getString(R.string.all_select));
        l.add(a.getString(R.string.music_delete_file));
        l.add(a.getString(R.string.ipp_queue_add));
        // "Open artist" only INSIDE an album: the flat list is one artist's already, so it would
        // lead where we are. The menu is rebuilt per press, so it is offered only for a row that
        // really carries an artist. It leads the "open" entries everywhere in the mod.
        if (!all && Artists.canOpen(songs)) l.add(a.getString(R.string.ipp_open_artist));
        // "Set as album thumbnail" only inside a real album -- the "Show all songs" marker list is
        // not one album, so there is no thumbnail to point at. "Open album" is the mirror image:
        // only in that flat list, since inside an album it would lead where we already are. The
        // thumbnail entry comes last, i.e. immediately before the playlists.
        if (all) l.add(a.getString(R.string.ipp_open_album));
        else l.add(a.getString(R.string.ipp_set_thumb));
        dlg.setList(l);
        dlg.addPlaylistsToOptions();   // setList dropped them, and it refreshes the playlist set
    }

    /** The dialog {@link #songMenu} last built, so the artist submenu can dismiss it on its pick. */
    private static SubMenuDialog songDlg;

    /** "Open artist" on a song row of this screen — see {@link Artists#openFrom}. */
    public static boolean openArtistFrom(Activity a, MyBaseAdapter songs) {
        return Artists.openFrom(a, songDlg, songs);
    }

    // ------------------------------------------------------------------ #362.2 "Open album"

    /**
     * #362.2 — open the album a song belongs to, landing on that song.
     *
     * Offered only in the two flat "everything at once" lists (All songs, and the artist's
     * "Show all songs"), where the album a track came from is not on screen; inside an album it
     * would be a no-op.
     *
     * The song to land on is handed over in a static rather than in the Intent, because the same
     * two steps serve both cases: All songs starts a new AlbumsActivity, while "Show all songs" is
     * already inside one and only swaps its own list. It is consumed by the first {@link #focus}
     * after the album's songs have loaded — that has to wait for the load, since
     * {@code switchSongSortType} fills the list from a coroutine and parks the cursor on row 0.
     */
    private static final String EXTRA_OPEN = "ipp_open_album";
    private static String pendingFocus;

    // Where the top button goes from an album opened this way: back to where it was opened FROM,
    // not up to the album list, and landing on the same row. Which of the two applies depends on
    // how the album was opened.
    private static boolean closeOnBack;      // opened from another screen -> just finish()
    private static String returnAlbum;       // opened from this screen's flat list -> restore it
    private static String returnFocus;

    /**
     * Note the song the user picked and return the encoded name of its album, or null. Used
     * directly by AlbumsActivity (which switches its own list) and by {@link #openAlbumFrom}.
     */
    public static String openTarget(MyBaseAdapter songs) {
        if (songs == null) return null;
        Object o = null;
        List sel = songs.getSelectedIndexList();
        if (sel != null && !sel.isEmpty()) o = songs.getItem(((Integer) sel.get(0)).intValue());
        if (o == null) o = songs.getItem(songs.getPosition());
        if (!(o instanceof Song)) return null;
        Song s = (Song) o;
        String key = keyOf(s);
        if (key == null) return null;
        pendingFocus = s.getPath();
        closeOnBack = false;
        returnAlbum = null;
        returnFocus = null;
        // #362.2: an album reached this way is shown WHOLE. The artist scope (#281.4) is armed by
        // the artist's album list and would otherwise still be in force, hiding the other artists
        // of the very album the user asked to see.
        scope = null;
        if (sel != null) sel.clear();
        return key;
    }

    /**
     * #397.6 — open an album by NAME, from a screen that has no song adapter to ask (the Search
     * results). Same two steps as "Open album" above, so what comes up is the Albums screen's own
     * song list — track numbers, CD dividers, the Shuffle row, its sort menu and the queue — rather
     * than the bare file names ShowSongListActivity drew.
     *
     * The name goes through {@link #coverKey}, i.e. it is folder-encoded whenever it belongs to
     * exactly one folder (#291.3): the album then opens exactly as it does from the Albums screen,
     * cover cache and all. A name shared by several folders keeps its own and opens merged, which
     * is what the search result row itself stands for — one row per distinct name.
     */
    public static void openAlbumName(Activity a, String name) {
        if (a == null || name == null || name.length() == 0) return;
        openKey(a, coverKey(name), null);       // nothing to land on: the whole album was asked for
    }

    /**
     * #397 — "Open album" on a search result: the album that song belongs to, landing on the song
     * itself. {@link #keyOf} is the folder-encoded key, so the album that opens is the physical one
     * the file sits in even when the name is shared (#291.3).
     */
    public static void openAlbumOfSong(Activity a, Song s) {
        if (a == null || s == null) return;
        openKey(a, keyOf(s), s.getPath());
    }

    private static void openKey(Activity a, String key, String focusPath) {
        if (key == null || key.length() == 0) return;
        pendingFocus = focusPath;
        closeOnBack = true;                     // top button goes back to the screen we came from
        returnAlbum = null;
        returnFocus = null;
        scope = null;                           // no artist scope (#281.4) is in force here
        Intent i = new Intent(a, com.innioasis.music.AlbumsActivity.class);
        i.putExtra(EXTRA_OPEN, key);
        a.startActivity(i);
    }

    /** Same, from a screen that is not the Albums screen: opens it straight into that album. */
    public static void openAlbumFrom(Activity a, MyBaseAdapter songs) {
        if (a == null) return;
        String key = openTarget(songs);
        if (key == null) return;
        closeOnBack = true;                     // top button leaves the album screen entirely
        Intent i = new Intent(a, com.innioasis.music.AlbumsActivity.class);
        i.putExtra(EXTRA_OPEN, key);
        a.startActivity(i);
    }

    /**
     * Opened from this screen's own flat list: remember the list to come back to. Called right
     * after {@link #openTarget}, whose pick is also the row to land on when we return.
     */
    public static void noteReturn(String previousAlbum) {
        returnAlbum = previousAlbum;
        returnFocus = pendingFocus;
    }

    /** Top button: true when the Albums screen simply closes, having been opened for one album. */
    public static boolean backClose() {
        boolean b = closeOnBack;
        closeOnBack = false;
        return b;
    }

    /** Top button: the list to restore instead of going up to the album list, or null. */
    public static String backAlbum() {
        String a = returnAlbum;
        if (a == null) return null;
        returnAlbum = null;
        pendingFocus = returnFocus;             // land on the song the album was opened from
        returnFocus = null;
        return a;
    }

    /** AlbumsActivity.initView: the album to jump straight into, or null for a normal open. */
    public static String openRequest(Activity a) {
        try {
            String key = a == null || a.getIntent() == null
                    ? null : a.getIntent().getStringExtra(EXTRA_OPEN);
            if (key == null) pendingFocus = null;   // a normal open must not inherit a stale pick
            return key;
        } catch (Throwable t) {
            return null;
        }
    }

    /** After the album's song list has been filled: put the cursor on the song we came for. */
    public static void focus(MyBaseAdapter songs, ListView lv) {
        String p = pendingFocus;
        pendingFocus = null;
        if (p == null || songs == null) return;
        for (int i = 0; i < songs.getCount(); i++) {
            Object o = songs.getItem(i);
            if (o instanceof Song && p.equals(((Song) o).getPath())) {
                if (lv == null) {
                    songs.setPosition(i);
                } else {
                    // The song rests against the BOTTOM edge with the list above it on screen,
                    // rather than against the top with everything before it scrolled away —
                    // including the Shuffle row, which for the first track went off screen
                    // entirely. See Follow.land.
                    Follow.land(songs, lv, i);
                }
                return;
            }
        }
    }

    // ---- where the album list stood before an album was opened from it -------------------------
    //
    // AlbumsActivity shows both lists in ONE ListView and swaps the adapter, so coming back is
    // `gotoAdapter(lv, albums, -1)` -> `lv.setSelection(adapter.getPosition())`, which is stock and
    // which parks the row at the TOP of the screen: the highlight is on the right album, but the
    // list has scrolled under it and everything the user was looking at is gone. The song lists do
    // not show this because they are rebuilt from row 0 anyway.
    //
    // So: note the first visible row and its pixel offset on the way in, put them back on the way
    // out. The note is consumed on use and guarded by the selected row, because the same ListView
    // is also restored on paths that never noted anything (#362.2's "Open album").

    private static int listFirst = -1;
    private static int listTop;
    private static int listPos = -1;

    /** {@code AlbumsActivity.confirm}, just before an album is opened from the album list. */
    public static void noteListScroll(ListView lv, Object albums) {
        listFirst = -1;
        try {
            if (lv == null || !(albums instanceof MyBaseAdapter)) return;
            View top = lv.getChildAt(0);
            listTop = top == null ? 0 : top.getTop();       // absolute: the album list has no padding
            listFirst = lv.getFirstVisiblePosition();
            listPos = ((MyBaseAdapter) albums).getPosition();
        } catch (Throwable t) {
            listFirst = -1;
        }
    }

    /**
     * {@code AlbumsActivity.direction}, in place of stock's {@code Other.gotoAdapter(lv, a, -1)}:
     * put the album list back exactly where it was left, rather than scrolling the selected album
     * to the top edge.
     */
    public static void restoreList(ListView lv, MyBaseAdapter albums) {
        if (lv == null || albums == null) return;
        lv.setAdapter(albums);
        int pos = albums.getPosition();
        int first = listFirst;
        listFirst = -1;                                   // one restore per note
        if (first >= 0 && first < albums.getCount() && listPos == pos) {
            // Through Head: this runs BEFORE the Shuffle row is hidden, so the list's padding is
            // still the song list's and about to drop away underneath. Head.restore places it now
            // and again once that has settled, and marks the placement as final so the padding
            // change carries it instead of shifting it.
            Head.restore(lv, first, listTop);
        } else {
            lv.setSelection(pos);
        }
    }

    /**
     * The album-row long-press menu, rebuilt before every {@code show()} for the same reason
     * {@link #songMenu} is: "Reset thumbnail" is offered only on an album that actually has a
     * pinned thumbnail, and that is a property of the focused row, not of the screen.
     */
    public static void albumMenu(SubMenuDialog dlg, Activity a, MyBaseAdapter albums) {
        if (dlg == null || a == null) return;
        ArrayList l = new ArrayList();
        l.add(a.getString(R.string.song_menu_sort_by));
        l.add(a.getString(R.string.music_multi_select));
        l.add(a.getString(R.string.all_select));
        l.add(a.getString(R.string.album_menu_delete));
        l.add(a.getString(R.string.ipp_queue_add));
        if (Art.hasPick(Art.albumKey(albums))) l.add(a.getString(R.string.ipp_reset_thumb));
        dlg.setList(l);
        dlg.addPlaylistsToOptions();
    }

    /**
     * Main-view split: every album is encoded as (name, folder) — one entry per distinct
     * album folder. A name in one folder stays a single entry; a name in several folders
     * splits. Encoding all albums (not only the multi-folder ones) routes every album through
     * {@link #songs}/{@link #songsSync}, so a multi-disc album (its CD subfolders rolled up to
     * one folder) still gets disc-grouped songs + a CD1 thumbnail, matching the artist view.
     */
    public static List split(List names) {
        if (names == null) return names;
        List all = allSongs();
        if (all == null) return names;
        LinkedHashMap byName = foldersByName(all);
        ArrayList out = new ArrayList();
        for (int i = 0; i < names.size(); i++) {
            String name = (String) names.get(i);
            Object o = byName.get(name == null ? "" : name);
            LinkedHashSet set = (o == null) ? null : (LinkedHashSet) o;
            if (set == null || set.isEmpty()) { out.add(name); continue; }   // defensive: keep plain
            ArrayList folders = new ArrayList(set);
            Collections.sort(folders, STR_CMP);
            for (int j = 0; j < folders.size(); j++) out.add(enc(name, (String) folders.get(j)));
        }
        return byYear(out);
    }

    /**
     * #397 — the same split for the SEARCH results, which arrive as `Album` objects and must keep
     * the query's own order (no `byYear` here: this list is not an album list, it is what was
     * found). One row per folder the name lives in, encoded exactly as everywhere else, so the
     * row's thumbnail, its song count and the album it opens all agree with the Albums screen.
     */
    public static List splitAlbums(List albums) {
        if (albums == null) return albums;
        List all = allSongs();
        if (all == null) return albums;
        LinkedHashMap byName = foldersByName(all);
        ArrayList out = new ArrayList();
        for (int i = 0; i < albums.size(); i++) {
            Album a = (Album) albums.get(i);
            if (a == null) continue;
            String name = a.getName() == null ? "" : a.getName();
            Object o = byName.get(name);
            LinkedHashSet set = (o == null) ? null : (LinkedHashSet) o;
            if (set == null || set.isEmpty()) { out.add(a); continue; }   // defensive: keep plain
            ArrayList folders = new ArrayList(set);
            Collections.sort(folders, STR_CMP);
            for (int j = 0; j < folders.size(); j++) {
                out.add(new Album(enc(name, (String) folders.get(j)), a.getArtist(), "", null));
            }
        }
        return out;
    }

    /**
     * The songs behind an album row that is not the Albums screen's own — an encoded key or a
     * plain name, in path order (so the first is the album's representative). Never null.
     */
    public static List songsOf(String key) {
        ArrayList out = new ArrayList();
        List all = allSongs();
        if (all == null || key == null) return out;
        String name = realName(key);
        String folder = isEnc(key) ? folderOf(key) : null;
        for (int i = 0; i < all.size(); i++) {
            Song s = (Song) all.get(i);
            if (s == null || !eq(s.getAlbum(), name)) continue;
            if (folder != null && !eq(albumFolder(s.getPath()), folder)) continue;
            out.add(s);
        }
        Collections.sort(out, PATH_CMP);
        return out;
    }

    private static final Comparator STR_CMP = new StrCmp();
    private static final class StrCmp implements Comparator {
        public int compare(Object a, Object b) {
            return ((String) a).toLowerCase(Locale.ROOT).compareTo(((String) b).toLowerCase(Locale.ROOT));
        }
    }

    private static ArrayList matchAlbum(List all, String name, String folder) {
        ArrayList matched = new ArrayList();
        for (int i = 0; i < all.size(); i++) {
            Song s = (Song) all.get(i);
            if (eq(s.getAlbum(), name) && eq(albumFolder(s.getPath()), folder)) matched.add(s);
        }
        return matched;
    }

    /**
     * #281.1 — the artist's whole song list, for the "Show all songs" row. Never null (a null
     * would fall through to the stock query, which would look for an album literally named
     * "Artist"). Track_Number is remapped: the stock artist query has no case for it and
     * would throw, and grouping by album is what a track order means for a whole artist anyway.
     */
    private static List artistSongs(String artist, Y1Repository.SongSortType sortType) {
        Y1Repository repo = Y1Application.Companion.getY1Repository();
        if (repo == null) return new ArrayList();
        Y1Repository.SongSortType t = sortType;
        if (t == Y1Repository.SongSortType.Track_Number) t = Y1Repository.SongSortType.Album;
        List l = repo.getSongsByArtist(artist, t);
        return l == null ? new ArrayList() : l;
    }

    // ---- #281.4: an album opened from an artist shows only that artist's tracks ---------------
    //
    // The album name that travels to getSongsByAlbum carries a folder but no artist, and the
    // repository has no Activity to ask, so the scope is remembered here: listForView is called
    // on every album-list build and sets it to the ipp_artist extra — i.e. it is armed by the
    // artist view and cleared again by the main Albums view.
    //
    // Only this path (album -> song list, which is also what the Shuffle bar and playback use)
    // is scoped. getSongsByAlbumSync deliberately is NOT: it backs the list row's cover/artist
    // lookup, "add to playlist" and the delete-files flow, which are about the whole album.
    private static String scope;

    /**
     * innioasis++ → "Show songs only by the selected artist inside Artists → Album", ON by
     * default; Off is stock behaviour, i.e. the whole album. Was the inverted
     * "full_artist_albums", worded backwards for the same reason `Artists.KEY_SPLIT` was — see
     * there for why the key changed along with the wording.
     */
    public static final String KEY_SCOPE = "artist_scope";

    private static boolean scopeEnabled() {
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) return false;
        return Prefs.on(c, KEY_SCOPE);
    }

    private static ArrayList onlyScoped(ArrayList matched) {
        String a = scope;
        if (a == null || matched.isEmpty() || !scopeEnabled()) return matched;
        ArrayList out = new ArrayList();
        for (int i = 0; i < matched.size(); i++) {
            Song s = (Song) matched.get(i);
            if (Artists.has(s.getArtist(), a)) out.add(s);
        }
        // A stale scope (or a tag the artist list matched some other way) must never leave the
        // user with an empty album — fall back to the full one.
        return out.isEmpty() ? matched : out;
    }

    /**
     * Whether the list the album screen is showing right now is the artist's flat "Show all
     * songs" rather than a record. {@code Disc} asks: an artist whose songs all carry one album
     * name is still not an album being looked at, and CD / Side dividers there name a record the
     * list is not showing.
     *
     * Noted from {@code AlbumsActivity.switchSongSortType}, the one call that builds that screen's
     * song list, and NOT from {@link #songs} — {@code getSongsByAlbum} is also called off the
     * drawing path by {@code YearCache}, for an album that has nothing to do with the list on
     * screen, so a flag set there is overwritten at a moment nothing controls.
     */
    private static boolean allList;

    public static boolean isAllSongsList() {
        return allList;
    }

    /** {@code AlbumsActivity.switchSongSortType}: which of the two lists is being built. */
    public static void noteListAlbum(String album) {
        allList = isAllSongs(album);
    }

    /** getSongsByAlbum redirect: encoded album -> songs of that (name,folder), sorted per type; else null. */
    public static List songs(String album, Y1Repository.SongSortType sortType) {
        if (isAllSongs(album)) return artistSongs(allSongsArtist(album), sortType);
        if (!isEnc(album)) return null;
        List all = allSongs();
        if (all == null) return new ArrayList();
        ArrayList matched = onlyScoped(matchAlbum(all, realName(album), folderOf(album)));
        // Apply the requested order first, then group by disc as the PRIMARY key (stable sort
        // keeps the within-disc order). So multi-disc albums are always disc-grouped -> CD
        // dividers + per-disc numbering work for any sort, not just Track_Number.
        List base;
        if (sortType == Y1Repository.SongSortType.Track_Number) {
            Collections.sort(matched, new SongCmp(Y1Repository.SongSortType.FileName_A_To_Z));
            base = Prefs.trackSortEnabled() ? TrackCache.sorted(matched) : matched;
        } else {
            Collections.sort(matched, new SongCmp(sortType));
            base = matched;
        }
        return byDisc(base);
    }

    /**
     * Group a song list by disc, keeping the order within each disc — a stable sort with the disc
     * as the PRIMARY key, applied on top of whatever order was asked for.
     *
     * <p>This is what makes the dividers possible at all: {@code Disc} shows them only for a list
     * that is contiguous by disc, and no ordinary sort produces one. A multi-disc album whose CDs
     * live in {@code CD1/}, {@code CD2/} looks contiguous in plain path order and hides the
     * omission; a record whose SIDES are one folder and differ only by the "A1"/"B1" track tag does
     * not — sorted by name or by path the two sides interleave, so the whole album fell back to row
     * numbers with nothing to explain it. That was the Genres screen on v0.32.1, which ordered its
     * song list by path and stopped there: CD albums showed their strips, records showed none.
     *
     * <p>Public because both screens have to apply the SAME rule — the Albums screen through
     * {@link #songs}, the Genres screen through {@code Genres.songs}, which owns its own sorts.
     */
    public static List byDisc(List songs) {
        if (songs == null || songs.size() < 2) return songs;
        ArrayList out = new ArrayList(songs);
        Collections.sort(out, DISC_CMP);
        return out;
    }

    private static final Comparator DISC_CMP = new DiscCmp();
    private static final class DiscCmp implements Comparator {
        public int compare(Object a, Object b) {
            int da = discOf(((Song) a).getPath());
            int db = discOf(((Song) b).getPath());
            return da < db ? -1 : (da > db ? 1 : 0);
        }
    }

    /** getSongsByAlbumSync redirect: encoded album -> songs of that (name,folder)[,genre]; else null. */
    public static List songsSync(Album album, int isAudiobook, Genre genre) {
        if (album == null) return null;
        // A query carrying a genre comes from the Genres screen and from nowhere else, so this is
        // where that screen's current song list can be recognised — see Genres.noteList.
        Genres.noteList(album, genre);
        // Genres' "Show all songs" row: every song of the genre, in path order, which is the same
        // order the album list itself is in (so a genre reads album by album).
        if (isGenreAll(album.getName())) {
            List all = allSongs();
            if (all == null) return new ArrayList();
            String g = album.getName().substring(1);
            ArrayList out = new ArrayList();
            for (int i = 0; i < all.size(); i++) {
                Song s = (Song) all.get(i);
                if (s != null && GenreSplit.has(s.getGenre(), g)) out.add(s);
            }
            Collections.sort(out, PATH_CMP);
            return out;
        }
        // The artist's own "Show all songs", reached from an album list built by Genres. The genre
        // is honoured when there is one, so the row means "everything by this artist IN THIS GENRE"
        // — the same scope the list around it has.
        if (isAllSongs(album.getName())) {
            List all = allSongs();
            if (all == null) return new ArrayList();
            String a = album.getName().substring(1);
            String gname = genre == null ? null : genre.getName();
            ArrayList out = new ArrayList();
            for (int i = 0; i < all.size(); i++) {
                Song s = (Song) all.get(i);
                if (s == null || !Artists.has(s.getArtist(), a)) continue;
                if (gname != null && !GenreSplit.has(s.getGenre(), gname)) continue;
                out.add(s);
            }
            Collections.sort(out, PATH_CMP);
            return out;
        }
        if (!isEnc(album.getName())) return null;
        List all = allSongs();
        if (all == null) return new ArrayList();
        String name = realName(album.getName());
        String folder = folderOf(album.getName());
        String gname = genre == null ? null : genre.getName();
        ArrayList matched = new ArrayList();
        for (int i = 0; i < all.size(); i++) {
            Song s = (Song) all.get(i);
            if (!eq(s.getAlbum(), name) || !eq(albumFolder(s.getPath()), folder)) continue;
            if (gname != null && !GenreSplit.has(s.getGenre(), gname)) continue;
            matched.add(s);
        }
        // order by path so the album's representative (first) song is from the lowest disc
        // (CD1 < CD2 < ...): the list thumbnail / artist are taken from CD1.
        Collections.sort(matched, PATH_CMP);
        return matched;
    }

    private static final Comparator PATH_CMP = new PathCmp();
    private static final class PathCmp implements Comparator {
        public int compare(Object a, Object b) {
            String x = ((Song) a).getPath();
            String y = ((Song) b).getPath();
            return (x == null ? "" : x).compareTo(y == null ? "" : y);
        }
    }

    /** Mirrors the stock ORDER BY used by getSongsByAlbum per sort type. */
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
            return cmpStr(a.getPinyinName(), b.getPinyinName());
        }
    }

    private static int cmpStr(String a, String b) {
        String x = a == null ? "" : a.toLowerCase(Locale.ROOT);
        String y = b == null ? "" : b.toLowerCase(Locale.ROOT);
        return x.compareTo(y);
    }

    private static int cmpLong(long a, long b) { return a < b ? -1 : (a > b ? 1 : 0); }
}
