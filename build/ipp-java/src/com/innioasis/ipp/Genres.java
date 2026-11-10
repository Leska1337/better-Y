package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Looper;
import android.view.View;

import com.innioasis.music.GenresActivity;
import com.innioasis.music.adapter.AlbumListAdapter;
import com.innioasis.music.adapter.GenreListAdapter;
import com.innioasis.music.adapter.MainAdapter;
import com.innioasis.music.adapter.MyBaseAdapter;
import com.innioasis.music.adapter.SongListAdapter;
import com.innioasis.music.adapter.SubmenuAdapter;
import com.innioasis.music.data.Album;
import com.innioasis.music.data.Genre;
import com.innioasis.music.util.Other;
import com.innioasis.music.util.SubMenuDialog;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.databinding.ActivityGenresBinding;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;

/**
 * The Genres screen: its per-level menus and sorts, the album split, and re-opening its song list
 * for the queue's "open source" when the screen is gone. Four levels page through one Activity,
 * so that cannot be an Intent; only the song list is rebuilt, from the album it was built from,
 * and the top button then leaves the screen.
 */
public final class Genres {

    private Genres() { }

    private static final String EXTRA = "ipp_open_genre_songs";

    /** The list the Genres screen is showing right now, and the genre it is scoped to. */
    private static Album listAlbum;
    private static Genre listGenre;

    /** Armed by {@link #restore}, consumed by the {@link #openRequest} of the new screen. */
    private static Album openAlbum;
    private static Genre openGenre;
    private static String openFocus;
    private static boolean closeOnBack;

    /** {@code Albums.songsSync}: only Genres queries with a genre. */
    public static void noteList(Album album, Genre genre) {
        if (album == null || genre == null) return;
        listAlbum = album;
        listGenre = genre;
        noteFlat(Albums.isAllSongs(album.getName()) || Albums.isGenreAll(album.getName()));
    }

    /**
     * A "Show all songs" list, not an album — from the name the list was BUILT with, never from
     * "one album name on every row": a genre holding one album would look like an album.
     */
    private static boolean listFlat;

    /** The artist branch of {@code confirm}, which never touches an album. */
    public static void noteFlat(boolean flat) {
        listFlat = flat;
    }

    public static boolean flat() {
        return listFlat;
    }

    /** The recorded list is the source, checked by title as {@code Albums.levelFor} does. */
    public static boolean levelFor(String title) {
        Album a = listAlbum;
        return a != null && title != null && title.equals(Mark.title(a.getName()));
    }

    /** Ask the freshly started Genres screen to come up on that song list, landing on the track. */
    public static void restore(Intent i, String focusPath) {
        if (i == null || listAlbum == null) return;
        i.putExtra(EXTRA, true);
        openAlbum = listAlbum;
        openGenre = listGenre;
        openFocus = focusPath;
    }

    /**
     * {@code GenresActivity.initView}: the song list, built as stock's album→songs step does. Safe:
     * the genre list's coroutine never re-attaches its adapter.
     */
    public static void openRequest(Activity act) {
        try {
            if (!(act instanceof GenresActivity)) return;
            Intent in = act.getIntent();
            if (in == null || !in.getBooleanExtra(EXTRA, false)) return;
            Album album = openAlbum;
            Genre genre = openGenre;
            String focus = openFocus;
            openAlbum = null;
            openGenre = null;
            openFocus = null;
            if (album == null) return;

            GenresActivity g = (GenresActivity) act;
            Mark.noteGenre(genre);
            List songs = Y1Application.Companion.getY1Repository()
                    .getSongsByAlbumSync(album, 0, genre);
            if (songs == null || songs.isEmpty()) return;
            songs = songs(songs);

            ActivityGenresBinding vb = (ActivityGenresBinding) g.getVb();
            g.setSongList(songs);
            g.setStateBarLeftText(Mark.title(album.getName()));
            vb.spv.bind(g.getAdapter4());
            vb.spv.show();
            g.getAdapter4().setItems(songs);
            // no album list was drawn, so the bar is handed its list
            View lv = lv(g);
            Disc.preset(g.getAdapter4(), songs, lv);
            Lv.go(lv, g.getAdapter4(), 0);
            closeOnBack = true;

            int at = indexOf(songs, focus);
            if (at >= 0) Follow.land(g.getAdapter4(), lv, at);
        } catch (Throwable t) {
        }
    }

    private static int indexOf(List songs, String path) {
        if (path == null) return -1;
        for (int i = 0; i < songs.size(); i++) {
            Object o = songs.get(i);
            if (o instanceof Song && path.equals(((Song) o).getPath())) return i;
        }
        return -1;
    }

    /** Top button on a screen opened this way: leave it — the levels above were never built. */
    public static boolean backClose() {
        boolean b = closeOnBack;
        closeOnBack = false;
        return b;
    }

    // Stock has ONE menu for all four levels, dispatched BY INDEX. Here it is built per level
    // (menu) and dispatched BY STRING in front of stock's (pick), which hands back stock's index.
    private static final int L_NONE = -1, L_GENRES = 0, L_ARTISTS = 1, L_ALBUMS = 2, L_SONGS = 3;

    /** {@link #pick}'s answers, in front of stock's 0/1/2 (+ anything else = a playlist). */
    private static final int DONE = -2;      // handled; close the menu (select returns true)
    private static final int OPEN = -1;      // handled; a sub-dialog is up, leave the menu behind

    /** The menu being shown, so a sort sub-dialog can dismiss it. */
    private static SubMenuDialog parent;

    /** By the adapter the list actually carries. */
    private static int levelOf(Object adapter) {
        if (adapter instanceof GenreListAdapter) return L_GENRES;
        if (adapter instanceof MainAdapter) return L_ARTISTS;
        if (adapter instanceof AlbumListAdapter) return L_ALBUMS;
        if (adapter instanceof MyBaseAdapter) return L_SONGS;     // both song adapters
        return L_NONE;
    }

    private static View lv(GenresActivity a) {
        try {
            return ((android.app.Activity) a).findViewById(R.id.lv);
        } catch (Throwable t) {
            return null;
        }
    }

    private static MyBaseAdapter live(GenresActivity a) {
        View lv = lv(a);
        return lv == null ? null : Lv.model(lv);
    }

    /**
     * The menu for the level on screen, from {@code longConfirm} before every {@code show()}. The
     * delete entry names what it deletes; the action stays stock's index 2.
     */
    public static void menu(GenresActivity a, SubMenuDialog dlg) {
        parent = dlg;
        try {
            if (a == null || dlg == null) return;
            MyBaseAdapter ad = live(a);
            int level = levelOf(ad);
            if (level == L_NONE) return;

            ArrayList l = new ArrayList();
            if (level == L_SONGS) {
                boolean flat = flat();
                l.add(a.getString(R.string.song_menu_sort_by_songname));
                l.add(a.getString(R.string.song_menu_sort_by_filename));
                if (flat) l.add(a.getString(R.string.song_menu_sort_by_album));
                else if (Prefs.trackSortEnabled()) l.add(a.getString(R.string.ipp_sort_by_track));
                l.add(a.getString(R.string.music_multi_select));
                l.add(a.getString(R.string.all_select));
                l.add(a.getString(R.string.music_delete_file));
                l.add(a.getString(R.string.ipp_queue_add));
                if (Artists.canOpen(ad)) l.add(a.getString(R.string.ipp_open_artist));
                if (flat) l.add(a.getString(R.string.ipp_open_album));
                else l.add(a.getString(R.string.ipp_set_thumb));
            } else {
                l.add(a.getString(R.string.song_menu_sort_by));
                l.add(a.getString(R.string.music_multi_select));
                l.add(a.getString(R.string.all_select));
                l.add(a.getString(deleteLabel(level)));
                l.add(a.getString(R.string.ipp_queue_add));
                if (level == L_ALBUMS && Art.hasPick(Art.albumKey(ad))) {
                    l.add(a.getString(R.string.ipp_reset_thumb));
                }
            }
            dlg.setList(l);
            dlg.addPlaylistsToOptions();   // setList dropped them
        } catch (Throwable t) {
        }
    }

    private static int deleteLabel(int level) {
        if (level == L_GENRES) return R.string.ipp_delete_genre;
        if (level == L_ARTISTS) return R.string.artist_menu_delete;
        if (level == L_ALBUMS) return R.string.album_menu_delete;
        return R.string.music_delete_file;
    }

    /**
     * @return {@link #DONE}, {@link #OPEN} (a sub-dialog is up, the menu stays behind it), or
     *         stock's index: 0 multi-select, 1 select all, 2 delete, 3 playlist.
     */
    public static int pick(GenresActivity a, SubmenuAdapter.Item item) {
        try {
            if (a == null || item == null) return DONE;
            String s = item.getString();
            if (s == null) return DONE;
            MyBaseAdapter ad = live(a);
            int level = levelOf(ad);

            if (s.equals(a.getString(R.string.ipp_queue_add))) {
                Queue.addFromAdapter(live(a));
                return DONE;
            }
            if (s.equals(a.getString(R.string.song_menu_sort_by))) {
                nameSortDialog(a, level);
                return OPEN;
            }
            if (s.equals(a.getString(R.string.song_menu_sort_by_songname))) {
                songDirDialog(a, S_NAME_AZ, S_NAME_ZA, false);
                return OPEN;
            }
            if (s.equals(a.getString(R.string.song_menu_sort_by_filename))) {
                songDirDialog(a, S_FILE_AZ, S_FILE_ZA, true);
                return OPEN;
            }
            if (s.equals(a.getString(R.string.ipp_sort_by_track))) {
                applySong(a, S_TRACK);
                return DONE;
            }
            if (s.equals(a.getString(R.string.song_menu_sort_by_album))) {
                applySong(a, S_ALBUM);
                return DONE;
            }
            if (s.equals(a.getString(R.string.ipp_set_thumb))) {
                Art.setThumb(ad, albumsAdapter(a));
                return DONE;
            }
            if (s.equals(a.getString(R.string.ipp_reset_thumb))) {
                Art.resetThumb(ad);
                return DONE;
            }
            if (s.equals(a.getString(R.string.ipp_open_album))) {
                Albums.openAlbumFrom(a, ad);
                return DONE;
            }
            if (s.equals(a.getString(R.string.ipp_open_artist))) {
                return Artists.openFrom(a, parent, ad) ? DONE : OPEN;
            }
            if (s.equals(a.getString(R.string.music_multi_select))) return 0;
            if (s.equals(a.getString(R.string.all_select))) return 1;
            if (s.equals(a.getString(R.string.music_delete_file))
             || s.equals(a.getString(R.string.album_menu_delete))
             || s.equals(a.getString(R.string.artist_menu_delete))
             || s.equals(a.getString(R.string.ipp_delete_genre))) return 2;
            // stock's playlist branch dereferences without a check
            return item.getPlaylist() != null ? 3 : DONE;
        } catch (Throwable t) {
            return DONE;
        }
    }

    /** The album adapter to repaint after a pin; may be empty after {@link #openRequest}. */
    private static MyBaseAdapter albumsAdapter(GenresActivity a) {
        try {
            return a.getAdapter3_1();
        } catch (Throwable t) {
            return null;
        }
    }

    // Stock has no sort on any level: the lists are sorted after they are built, no query is
    // touched. NONE = the query's own order.
    private static final String K_GENRE  = "genre_sort";
    private static final String K_ARTIST = "genre_artist_sort";
    private static final String K_ALBUM  = "genre_album_sort";
    private static final String K_SONG   = "genre_song_sort";   // inside one album
    private static final String K_FLAT   = "genre_flat_sort";   // the two "Show all songs" lists

    private static final int NONE = -1;
    private static final int A_Z = 0, Z_A = 1, YEAR_ASC = 2, YEAR_DESC = 3;
    private static final int S_NAME_AZ = 0, S_NAME_ZA = 1, S_FILE_AZ = 2, S_FILE_ZA = 3,
                             S_TIME_ASC = 4, S_TIME_DESC = 5, S_TRACK = 6, S_ALBUM = 7;

    private static int sortOf(String key) {
        Context c = Y1Application.Companion.getAppContext();
        return c == null ? NONE : Prefs.getInt(c, key, NONE);
    }

    private static void setSort(String key, int value) {
        Context c = Y1Application.Companion.getAppContext();
        if (c != null) Prefs.setInt(c, key, value);
    }

    private static boolean onMain() {
        return Looper.myLooper() == Looper.getMainLooper();
    }

    /** {@link #alphaKind}: what the alphabetical fast scroll may jump by on the level in hand. */
    public static final int A_NONE = 0, A_LETTER = 1, A_YEAR = 2;

    /** The wheel's fast jump: only under a sort that puts its keys in order ({@code Alpha.mode}). */
    public static int alphaKind(Object adapter) {
        int level = levelOf(adapter);
        // NONE is the query's order, which for these three IS A-Z (order by lower(pinyin…))
        if (level == L_GENRES || level == L_ARTISTS) {
            int s = sortOf(level == L_GENRES ? K_GENRE : K_ARTIST);
            return (s == NONE || s == A_Z || s == Z_A) ? A_LETTER : A_NONE;
        }
        if (level == L_ALBUMS) {
            int s = sortOf(K_ALBUM);
            if (s == NONE || s == A_Z || s == Z_A) return A_LETTER;
            if (s == YEAR_ASC || s == YEAR_DESC) return A_YEAR;
            return A_NONE;
        }
        if (level == L_SONGS) {
            int s = songSort();
            // song name only: file names open with a track number
            return (s == S_NAME_AZ || s == S_NAME_ZA) ? A_LETTER : A_NONE;
        }
        return A_NONE;
    }

    /** {@code initView}: the genre list, straight off {@code getGenresSync}. */
    public static List genres(List names) {
        try {
            if (names == null || names.size() < 2) return names;
            int s = sortOf(K_GENRE);
            if (s == NONE) return names;
            ArrayList out = new ArrayList(names);
            Collections.sort(out, new NameCmp(s == Z_A));
            return out;
        } catch (Throwable t) {
            return names;
        }
    }

    /** {@code confirm}: a genre's artists, sorted in place; the button at index 0 stays. */
    public static void artists(List names) {
        try {
            if (names == null || names.size() < 3) return;
            int s = sortOf(K_ARTIST);
            if (s == NONE) return;
            Collections.sort(names.subList(1, names.size()), new NameCmp(s == Z_A));
        } catch (Throwable t) {
        }
    }

    /**
     * A genre's album list ({@code getAlbumsByGenreSync}, plain names): split into one row per
     * folder like the Albums screen, with the same keys. Not {@code Albums.split}: the folders come
     * from the GENRE's songs, or a folder outside the genre becomes a row that opens empty.
     */
    public static void albumList(List names, Genre g) {
        try {
            split(names, g == null ? null : g.getName());
        } catch (Throwable t) {
        }
        albums(names);
    }

    private static void split(List names, String genre) {
        if (names == null || names.isEmpty() || genre == null) return;
        List all = Albums.allSongs();
        if (all == null || all.isEmpty()) return;

        // album name -> its keys within this genre, in the order the songs come in
        LinkedHashMap byName = new LinkedHashMap();
        for (int i = 0; i < all.size(); i++) {
            Object o = all.get(i);
            if (!(o instanceof Song)) continue;
            Song s = (Song) o;
            // the row's own query's test: GenreSplit, not equality
            if (!GenreSplit.has(s.getGenre(), genre)) continue;
            String name = s.getAlbum() == null ? "" : s.getAlbum();
            Object v = byName.get(name);
            LinkedHashSet set = (v == null) ? null : (LinkedHashSet) v;
            if (set == null) { set = new LinkedHashSet(); byName.put(name, set); }
            set.add(Albums.albumKey(s.getAlbum(), s.getPath()));
        }
        if (byName.isEmpty()) return;

        ArrayList out = new ArrayList();
        for (int i = 0; i < names.size(); i++) {
            Object o = names.get(i);
            String name = (o instanceof String) ? (String) o : null;
            Object v = (name == null) ? null : byName.get(name);
            LinkedHashSet set = (v == null) ? null : (LinkedHashSet) v;
            if (set == null || set.isEmpty()) { out.add(o); continue; }
            ArrayList keys = new ArrayList(set);
            Collections.sort(keys, KEY_CMP);      // by folder: the keys share the name in front
            out.addAll(keys);
        }
        names.clear();
        names.addAll(out);
    }

    private static final Comparator KEY_CMP = new KeyCmp();
    private static final class KeyCmp implements Comparator {
        public int compare(Object a, Object b) {
            return ((String) a).toLowerCase(Locale.ROOT).compareTo(((String) b).toLowerCase(Locale.ROOT));
        }
    }

    public static void albums(List items) {
        albums(items, null);
    }

    /**
     * An album list, sorted in place; a marker row on top stays.
     *
     * @param late on the main thread, the screen to re-sort once the missing years are read;
     *             null off it.
     */
    public static void albums(List items, GenresActivity late) {
        try {
            if (items == null || items.size() < 2) return;
            int s = sortOf(K_ALBUM);
            if (s == NONE) return;
            int from = isMarker(items.get(0)) ? 1 : 0;
            if (items.size() - from < 2) return;
            List tail = items.subList(from, items.size());      // a view: sorting it sorts `items`
            if (s == YEAR_ASC || s == YEAR_DESC) {
                boolean missing = warmYears(tail);
                Collections.sort(tail, new YearCmp(s == YEAR_DESC));
                if (missing && late != null) new Thread(new Warm(late, names(tail))).start();
            } else {
                Collections.sort(tail, new NameCmp(s == Z_A));
            }
        } catch (Throwable t) {
        }
    }

    /** {@code GenresActivity.setSongList}, which every song list here goes through. */
    public static List songs(GenresActivity a, List list) {
        int s = songSort();
        rowFlags(a, s);
        numbers(a);
        return songs(list);
    }

    /**
     * Register the song adapters with {@link Disc} for an album, UNregister for a flat list —
     * registration itself is Disc's answer. The track cache file is read before the first bind.
     */
    private static void numbers(GenresActivity a) {
        try {
            if (a == null || flat()) {
                Disc.setGenreAdapters(null, null);
                return;
            }
            Disc.setGenreAdapters(a.getAdapter3_2(), a.getAdapter4());
        } catch (Throwable t) {
        }
    }

    public static List songs(List list) {
        try {
            if (list == null || list.size() < 2) return list;
            int s = songSort();
            List out = s == NONE ? list : sortSongs(list, s);
            // grouped by disc as in Albums.songs; not a flat list, which is album by album
            return flat() ? out : Albums.byDisc(out);
        } catch (Throwable t) {
            return list;
        }
    }

    /** The song sort in force: an album and a "Show all songs" list remember their own. */
    private static int songSort() {
        return sortOf(flat() ? K_FLAT : K_SONG);
    }

    /**
     * The row's lines per sort, as stock's {@code switchSongSortType} decides — except that a track
     * sort keeps the tag title here instead of dropping to the file name.
     */
    private static void rowFlags(GenresActivity a, int sort) {
        try {
            if (a == null) return;
            flags(a.getAdapter3_2(), sort);
            flags(a.getAdapter4(), sort);
        } catch (Throwable t) {
        }
    }

    private static void flags(Object o, int sort) {
        if (!(o instanceof SongListAdapter)) return;
        SongListAdapter ad = (SongListAdapter) o;
        ad.setCanShowAlbum(sort == S_ALBUM && flat());
        ad.setCanShowTime(sort == S_TIME_ASC || sort == S_TIME_DESC);
        ad.setCanShowSongName(sort == NONE || sort == S_NAME_AZ || sort == S_NAME_ZA
                || sort == S_ALBUM || sort == S_TRACK);
    }

    private static void nameSortDialog(GenresActivity a, int level) {
        if (level == L_NONE || level == L_SONGS) return;
        ArrayList l = new ArrayList();
        l.add(a.getString(R.string.sort_a_z));
        l.add(a.getString(R.string.sort_z_a));
        if (level == L_ALBUMS) {                 // only an album has a year
            l.add(a.getString(R.string.ipp_sort_date_asc));
            l.add(a.getString(R.string.ipp_sort_date_desc));
        }
        // the 4th argument is the dialog THEME, not a flag
        new SubMenuDialog(a, l, new NamePick(a, level), R.style.Dialog_Common).show();
    }

    private static void songDirDialog(GenresActivity a, int asc, int desc, boolean time) {
        ArrayList l = new ArrayList();
        l.add(a.getString(R.string.sort_a_z));
        l.add(a.getString(R.string.sort_z_a));
        if (time) {                              // stock's split: dates under the file name
            l.add(a.getString(R.string.sort_time_asc));
            l.add(a.getString(R.string.sort_time_desc));
        }
        new SubMenuDialog(a, l, new SongPick(a, asc, desc), R.style.Dialog_Common).show();
    }

    public static final class NamePick implements SubMenuDialog.Callback {
        private final GenresActivity a;
        private final int level;

        NamePick(GenresActivity a, int level) { this.a = a; this.level = level; }

        public boolean select(int index, SubmenuAdapter.Item item) {
            String s = item == null ? null : item.getString();
            int v = A_Z;
            if (a.getString(R.string.sort_z_a).equals(s)) v = Z_A;
            else if (a.getString(R.string.ipp_sort_date_asc).equals(s)) v = YEAR_ASC;
            else if (a.getString(R.string.ipp_sort_date_desc).equals(s)) v = YEAR_DESC;
            applyName(a, level, v);
            if (parent != null) parent.dismiss();   // the pick closes both levels
            return true;
        }
    }

    /** The direction of a song sort. */
    public static final class SongPick implements SubMenuDialog.Callback {
        private final GenresActivity a;
        private final int asc;
        private final int desc;

        SongPick(GenresActivity a, int asc, int desc) { this.a = a; this.asc = asc; this.desc = desc; }

        public boolean select(int index, SubmenuAdapter.Item item) {
            String s = item == null ? null : item.getString();
            int v = asc;
            if (a.getString(R.string.sort_z_a).equals(s)) v = desc;
            else if (a.getString(R.string.sort_time_asc).equals(s)) v = S_TIME_ASC;
            else if (a.getString(R.string.sort_time_desc).equals(s)) v = S_TIME_DESC;
            applySong(a, v);
            if (parent != null) parent.dismiss();
            return true;
        }
    }

    private static void applyName(GenresActivity a, int level, int value) {
        try {
            MyBaseAdapter ad = live(a);
            if (ad == null || levelOf(ad) != level) return;
            setSort(level == L_GENRES ? K_GENRE : (level == L_ARTISTS ? K_ARTIST : K_ALBUM), value);

            if (level == L_ALBUMS && (value == YEAR_ASC || value == YEAR_DESC)) {
                // years may need file reads: off the main thread
                new Thread(new Resort(a, ad, true)).start();
                return;
            }
            resortNow(a, ad, level == L_ALBUMS);
        } catch (Throwable t) {
        }
    }

    private static void applySong(GenresActivity a, int value) {
        try {
            MyBaseAdapter ad = live(a);
            if (ad == null || levelOf(ad) != L_SONGS) return;
            setSort(flat() ? K_FLAT : K_SONG, value);
            rowFlags(a, value);
            // the track sort may read tags; the rest share the one path
            new Thread(new Resort(a, ad, false)).start();
        } catch (Throwable t) {
        }
    }

    /** Sort the live list in place (no file reads on this path) and put the cursor back on top. */
    private static void resortNow(GenresActivity a, MyBaseAdapter ad, boolean albums) {
        List items = ad.getItemList();
        if (albums) albums(items);
        else {
            int s = sortOf(levelOf(ad) == L_GENRES ? K_GENRE : K_ARTIST);
            if (s == NONE) return;
            int from = (levelOf(ad) == L_ARTISTS && ad.getCount() > 1) ? 1 : 0;   // the button row
            Collections.sort(items.subList(from, items.size()), new NameCmp(s == Z_A));
        }
        land(a, ad);
    }

    /**
     * A sort that reads files, applied on the main thread. Sorts a COPY: {@code setItems} clears
     * its own list before copying, so its own list would come out empty.
     */
    private static final class Resort implements Runnable {
        private final GenresActivity a;
        private final MyBaseAdapter ad;
        private final boolean albums;

        Resort(GenresActivity a, MyBaseAdapter ad, boolean albums) { this.a = a; this.ad = ad; this.albums = albums; }

        public void run() {
            try {
                ArrayList copy = new ArrayList(ad.getItemList());
                List out = copy;
                if (albums) {
                    albums(copy);
                } else {
                    int s = songSort();
                    if (s != NONE) out = sortSongs(copy, s);
                }
                a.runOnUiThread(new Apply(a, ad, out));
            } catch (Throwable t) {
            }
        }
    }

    private static final class Apply implements Runnable {
        private final GenresActivity a;
        private final MyBaseAdapter ad;
        private final List list;

        Apply(GenresActivity a, MyBaseAdapter ad, List list) { this.a = a; this.ad = ad; this.list = list; }

        public void run() {
            try {
                if (live(a) != ad) return;              // the user has moved on
                if (levelOf(ad) == L_SONGS) a.setSongList(list);
                ad.setItems(list);                      // Queue.relist rides this: the play order
                if (levelOf(ad) == L_SONGS) Disc.preset(ad, list, lv(a));
                land(a, ad);
            } catch (Throwable t) {
            }
        }
    }

    /** After a re-sort: the top of the list, stepped off a button row by {@code Mark.afterFill}. */
    private static void land(GenresActivity a, MyBaseAdapter ad) {
        // ticks are POSITIONS, wrong after a re-sort
        List sel = ad.getSelectedIndexList();
        if (sel != null) sel.clear();
        ad.setPosition(0);
        View lv = lv(a);
        if (lv != null) Lv.select(lv, 0);
        Mark.afterFill(ad, lv);
        ad.notifyDataSetChanged();
    }

    /** A row's name, whichever kind of item the level holds. */
    private static String nameOf(Object o) {
        if (o instanceof String) return (String) o;
        if (o instanceof Album) return ((Album) o).getName();
        if (o instanceof Genre) return ((Genre) o).getName();
        return null;
    }

    private static boolean isMarker(Object o) {
        String n = nameOf(o);
        return n != null && (Albums.isAllSongs(n) || Albums.isGenreAll(n));
    }

    private static final class NameCmp implements Comparator {
        private final boolean desc;
        NameCmp(boolean desc) { this.desc = desc; }
        public int compare(Object a, Object b) {
            // realName: the folder must not decide the order
            String x = Albums.realName(nameOf(a));
            String y = Albums.realName(nameOf(b));
            x = x == null ? "" : x.toLowerCase(Locale.ROOT);
            y = y == null ? "" : y.toLowerCase(Locale.ROOT);
            int c = x.compareTo(y);
            return desc ? -c : c;
        }
    }

    /** By year ({@code YearCache}), then by name. */
    private static final class YearCmp implements Comparator {
        private final boolean desc;
        private final NameCmp byName = new NameCmp(false);
        YearCmp(boolean desc) { this.desc = desc; }
        public int compare(Object a, Object b) {
            int x = year(a);
            int y = year(b);
            if (x != y) return desc ? (x < y ? 1 : -1) : (x < y ? -1 : 1);
            return byName.compare(a, b);
        }
        private int year(Object o) {
            try {
                String s = YearCache.get(nameOf(o));
                if (s == null || s.length() != 4) return 0;
                return Integer.parseInt(s);
            } catch (Throwable t) {
                return 0;
            }
        }
    }

    /**
     * Read the albums' years — never on the main thread.
     *
     * @return true when on the main thread a year is missing: someone has to read it elsewhere.
     */
    private static boolean warmYears(List items) {
        if (!onMain()) {
            YearCache.warm(names(items));
            return false;
        }
        for (int i = 0; i < items.size(); i++) {
            if (YearCache.get(nameOf(items.get(i))) == null) return true;
        }
        return false;
    }

    private static ArrayList names(List items) {
        ArrayList out = new ArrayList();
        for (int i = 0; i < items.size(); i++) {
            String n = nameOf(items.get(i));
            if (n != null) out.add(n);
        }
        return out;
    }

    /** The missing years, off the main thread; then the list on screen is sorted again. */
    private static final class Warm implements Runnable {
        private final GenresActivity a;
        private final ArrayList names;

        Warm(GenresActivity a, ArrayList names) { this.a = a; this.names = names; }

        public void run() {
            try {
                YearCache.warm(names);
                a.runOnUiThread(new Late(a));
            } catch (Throwable t) {
            }
        }
    }

    private static final class Late implements Runnable {
        private final GenresActivity a;

        Late(GenresActivity a) { this.a = a; }

        public void run() {
            try {
                MyBaseAdapter ad = live(a);
                if (ad == null || levelOf(ad) != L_ALBUMS) return;
                int pos = ad.getPosition();
                albums(ad.getItemList());
                ad.notifyDataSetChanged();
                if (pos <= 1) land(a, ad);           // unless the user has already moved
            } catch (Throwable t) {
            }
        }
    }

    private static List sortSongs(List src, int code) {
        ArrayList out = new ArrayList(src);
        if (code == S_TRACK) {
            Collections.sort(out, new SongCmp(S_FILE_AZ));       // a stable base for the numbers
            if (onMain()) {
                // cached numbers only: TrackCache.sorted() reads tags
                Collections.sort(out, new TrackComparator());
                return out;
            }
            List t = TrackCache.sorted(out);
            return t == null ? out : t;
        }
        Collections.sort(out, new SongCmp(code));
        return out;
    }

    /** Stock's album-query orders, in Java. */
    private static final class SongCmp implements Comparator {
        private final int code;
        SongCmp(int code) { this.code = code; }
        public int compare(Object oa, Object ob) {
            Song a = (Song) oa;
            Song b = (Song) ob;
            if (code == S_TIME_ASC) return cmpLong(a.getFileDate(), b.getFileDate());
            if (code == S_TIME_DESC) return -cmpLong(a.getFileDate(), b.getFileDate());
            if (code == S_NAME_AZ) return cmpStr(a.getPinyinSongName(), b.getPinyinSongName());
            if (code == S_NAME_ZA) return -cmpStr(a.getPinyinSongName(), b.getPinyinSongName());
            if (code == S_ALBUM) return cmpStr(a.getPinyinAlbum(), b.getPinyinAlbum());
            if (code == S_FILE_ZA) return -cmpStr(a.getPinyinName(), b.getPinyinName());
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
