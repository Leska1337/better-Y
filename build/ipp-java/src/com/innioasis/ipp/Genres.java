package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Looper;
import android.widget.ListView;

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
 * Re-opening the song list of the Genres screen — the last piece of the queue's "open source"
 * (#227), for the case where that screen is no longer in the stack.
 *
 * <p><b>Why it needs a class of its own.</b> Genres pages FOUR lists through one Activity (genres →
 * artists → albums → songs), and the only way in is {@code confirm()} on a row of whichever list is
 * attached at the time. So "open it at the song list" cannot be expressed as an Intent, and walking
 * back down would mean replaying three descents — each of which runs its query on a thread of its
 * own, so every step would have to wait for the previous list to arrive before it could pick a row
 * in it, and the rows to pick are the awkward ones (the "Show all albums" / "Show all songs" button
 * rows sit at index 0, and an artist row is a SPLIT name that has to be matched by the same test the
 * list was built with — skill {@code ipp-albums-artists}).
 *
 * <p><b>What it does instead.</b> The intermediate levels are not what the user asked for — the song
 * list is — so only that one is rebuilt, from the album (or marker) it was built from in the first
 * place. That is the whole of stock's own album→songs step, which is short: query, title, the
 * Shuffle row, the adapter, and attach it. The top button then LEAVES the screen instead of climbing
 * to an album list that was never filled, which is also what the user wants there: one press back to
 * the player the queue was opened from.
 *
 * <p>The album and the genre are held as the objects themselves rather than put in the Intent: the
 * Activity died, the process did not, so there is nothing to serialise — the same way {@code Albums}
 * carries its "Open album" focus. The Intent only carries the flag that says a jump was asked for,
 * which is what tells this apart from opening Genres by hand.
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

    /**
     * From {@code Albums.songsSync}: a song query carrying a GENRE can only have come from the
     * Genres screen — every other caller passes null — so this is the one call that sees which list
     * that screen is building, whether it is a real album or one of the two marker rows.
     */
    public static void noteList(Album album, Genre genre) {
        if (album == null || genre == null) return;
        listAlbum = album;
        listGenre = genre;
        noteFlat(Albums.isAllSongs(album.getName()) || Albums.isGenreAll(album.getName()));
    }

    /**
     * True while the song list on screen is one of the two "Show all songs" lists rather than an
     * album.
     *
     * <p>The menu (which entries a song row gets) and the sort (which of the two stored orders
     * applies) both read it, and they must get the SAME answer, so it comes from the album name the
     * list was BUILT with — the marker byte is what makes a marker list one — and not from the
     * songs. Deriving it from the songs, "they all carry one album name", is the tempting version
     * and it is wrong: a genre or an artist holding exactly one album gives a flat list that looks
     * like an album, and the album's menu then appeared over it (reported on v0.26.2).
     */
    private static boolean listFlat;

    /** The artist branch of {@code confirm}, which queries by ARTIST and never touches an album. */
    public static void noteFlat(boolean flat) {
        listFlat = flat;
    }

    public static boolean flat() {
        return listFlat;
    }

    /**
     * True when the recorded list is the one the track was started from. Guarded by the screen's
     * title, the same way {@code Albums.levelFor} is: the album list can start playback too, and
     * then the last song list built belongs to something the user opened earlier.
     */
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
     * {@code GenresActivity.initView}: the song list, built the way stock's own album→songs step
     * builds it. Safe to attach here — the genre list is filled by a coroutine that only feeds its
     * own adapter and never re-attaches it to the ListView, exactly as on the Albums screen.
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
            Mark.noteGenre(genre);              // the scope the level had, for the marker rows
            List songs = Y1Application.Companion.getY1Repository()
                    .getSongsByAlbumSync(album, 0, genre);
            if (songs == null || songs.isEmpty()) return;
            songs = songs(songs);      // the level's own sort, as on every other way into this list

            ActivityGenresBinding vb = (ActivityGenresBinding) g.getVb();
            g.setSongList(songs);
            g.setStateBarLeftText(Mark.title(album.getName()));
            vb.spv.bind(g.getAdapter4());
            vb.spv.show();
            g.getAdapter4().setItems(songs);
            // No album list was ever drawn on this screen, so nothing has told the bar which
            // ListView it lives in -- hand it over here, along with the list it is about.
            Disc.preset(g.getAdapter4(), songs, (ListView) vb.lv);
            Other.INSTANCE.gotoAdapter((ListView) vb.lv, g.getAdapter4(), 0);
            closeOnBack = true;

            int at = indexOf(songs, focus);
            if (at >= 0) Follow.land(g.getAdapter4(), (ListView) vb.lv, at);
        } catch (Throwable t) {
            // the screen still opens on the genre list, which is where it opened before this
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

    /**
     * Top button on a screen opened this way: leave it altogether. Stock would go up to the album
     * list of the artist — which on this screen was never built, since the levels above the song
     * list were skipped — and what is underneath the screen is the player the queue was opened from.
     */
    public static boolean backClose() {
        boolean b = closeOnBack;
        closeOnBack = false;
        return b;
    }

    // ================================================================== the long-press menu
    //
    // Stock builds ONE menu for all four levels (Constant.getSubMenuList(): multi-select, select
    // all, delete file) and dispatches it BY INDEX, which is why nothing level-specific could be
    // added to it: an entry inserted anywhere shifts the meaning of every entry after it, and the
    // "anything past index 2 is a playlist" rule is what the playlist half rests on.
    //
    // So the menu is now built per level (see #menu) exactly as Albums builds its two, and the
    // dispatch is done BY STRING in front of stock's (see #pick), which hands back the index stock
    // should see. Albums and Artists dispatch by string already; this brings the third screen into
    // line rather than inventing a third way.

    private static final int L_NONE = -1, L_GENRES = 0, L_ARTISTS = 1, L_ALBUMS = 2, L_SONGS = 3;

    /** {@link #pick}'s answers, in front of stock's 0/1/2 (+ anything else = a playlist). */
    private static final int DONE = -2;      // handled; close the menu (select returns true)
    private static final int OPEN = -1;      // handled; a sub-dialog is up, leave the menu behind

    /**
     * The menu the level is about to show. Held from {@link #menu} — which runs immediately before
     * every {@code show()} — so the sort sub-dialogs can dismiss their parent the way stock's own
     * do, without a synthetic accessor for {@code GenresActivity.subMenuDialog}.
     */
    private static SubMenuDialog parent;

    /** Which list the screen is showing, taken from the adapter the ListView actually carries. */
    private static int levelOf(Object adapter) {
        if (adapter instanceof GenreListAdapter) return L_GENRES;
        if (adapter instanceof MainAdapter) return L_ARTISTS;
        if (adapter instanceof AlbumListAdapter) return L_ALBUMS;
        if (adapter instanceof MyBaseAdapter) return L_SONGS;     // both song adapters
        return L_NONE;
    }

    private static ListView lv(GenresActivity a) {
        try {
            return ((ActivityGenresBinding) a.getVb()).lv;
        } catch (Throwable t) {
            return null;
        }
    }

    private static MyBaseAdapter live(GenresActivity a) {
        ListView lv = lv(a);
        Object o = lv == null ? null : lv.getAdapter();
        return (o instanceof MyBaseAdapter) ? (MyBaseAdapter) o : null;
    }

    /**
     * Rebuild the long-press menu for the level on screen. Called from {@code longConfirm} right
     * before {@code show()}, the one place every level goes through, and for the same reason
     * {@code Albums.songMenu} is called there: the dialog is a single per-activity instance serving
     * four different lists, and two of the entries depend on the focused ROW rather than the screen.
     *
     * <p>Stock calls the delete entry "Delete file" on all four levels, because it has one menu for
     * all four. Here each level names what it actually deletes, the way Albums and Artists name
     * theirs; the ACTION is untouched — the index handed back for it is stock's 2 either way.
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
                // "Subdiv. by Album" only in a list holding several albums, "Sort by track" only
                // inside one -- the same split Albums makes between its flat list and an album.
                if (flat) l.add(a.getString(R.string.song_menu_sort_by_album));
                else if (Prefs.trackSortEnabled()) l.add(a.getString(R.string.ipp_sort_by_track));
                l.add(a.getString(R.string.music_multi_select));
                l.add(a.getString(R.string.all_select));
                l.add(a.getString(R.string.music_delete_file));
                l.add(a.getString(R.string.ipp_queue_add));
                // "Open artist" on every song level, flat list and album alike — the same entry the
                // album's song list has in Albums, so the two sections do not disagree. It leads
                // the "open" entries everywhere in the mod.
                if (Artists.canOpen(ad)) l.add(a.getString(R.string.ipp_open_artist));
                // "Open album" only where the album is NOT what the list is showing; "Set as album
                // thumbnail" only where it is, and last, i.e. immediately before the playlists.
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
            dlg.addPlaylistsToOptions();   // setList dropped them, and it refreshes the playlist set
        } catch (Throwable t) {
            // the menu keeps whatever it was last built with, which is still a working menu
        }
    }

    private static int deleteLabel(int level) {
        if (level == L_GENRES) return R.string.ipp_delete_genre;
        if (level == L_ARTISTS) return R.string.artist_menu_delete;
        if (level == L_ALBUMS) return R.string.album_menu_delete;
        return R.string.music_delete_file;
    }

    /**
     * The entry the user picked, matched by string in front of stock's index dispatch.
     *
     * @return {@link #DONE} (handled, close the menu), {@link #OPEN} (handled, a sub-dialog is up
     *         and the menu must stay behind it, which is stock's own pattern for a sort), or the
     *         index stock should dispatch on: 0 multi-select, 1 select all, 2 delete, 3 playlist.
     */
    public static int pick(GenresActivity a, SubmenuAdapter.Item item) {
        try {
            if (a == null || item == null) return DONE;
            String s = item.getString();
            if (s == null) return DONE;
            MyBaseAdapter ad = live(a);
            int level = levelOf(ad);

            if (s.equals(a.getString(R.string.ipp_queue_add))) {
                Queue.addFromListView(lv(a));
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
                // false = a submenu is up and dismisses this menu itself, which is exactly what
                // OPEN means here.
                return Artists.openFrom(a, parent, ad) ? DONE : OPEN;
            }
            if (s.equals(a.getString(R.string.music_multi_select))) return 0;
            if (s.equals(a.getString(R.string.all_select))) return 1;
            if (s.equals(a.getString(R.string.music_delete_file))
             || s.equals(a.getString(R.string.album_menu_delete))
             || s.equals(a.getString(R.string.artist_menu_delete))
             || s.equals(a.getString(R.string.ipp_delete_genre))) return 2;
            // Everything else is a playlist row appended by addPlaylistsToOptions. Stock's branch
            // dereferences the playlist without a check, so an entry that is neither is dropped.
            return item.getPlaylist() != null ? 3 : DONE;
        } catch (Throwable t) {
            return DONE;
        }
    }

    /**
     * The album adapter to repaint after a thumbnail was pinned from a song list. It may hold the
     * genre's albums, an artist's, or nothing at all (a song list restored by {@link #openRequest}
     * has no level above it) — {@code Art} walks whatever is in it, so all three are fine.
     */
    private static MyBaseAdapter albumsAdapter(GenresActivity a) {
        try {
            return a.getAdapter3_1();
        } catch (Throwable t) {
            return null;
        }
    }

    // ================================================================== the sorts themselves
    //
    // Genres has no sort on any level in stock, so the menu entries above needed the orders first.
    // They are applied to the list that has just been built rather than pushed into the queries:
    // three of the four levels come from queries that take no sort at all (getGenresSync,
    // getArtistsByGenreSync, getAlbumsByGenreSync) and the fourth rides Albums.songsSync, which
    // answers for a marker row as much as for a real album. One rule covers all four and no query
    // is touched.
    //
    // The default is NONE — the order the query gave, i.e. exactly what this screen did before — so
    // nothing changes until the user picks something.

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

    /**
     * #362.3 — whether the wheel's fast jump applies to this level, and by what.
     *
     * <p>Same rule as everywhere else it applies ({@code Alpha.mode}): only under a sort that puts
     * the keys in order, or "next letter" lands one row further on over and over. All four levels
     * of this screen can be in such a sort now, which is what makes the jump possible here at all —
     * before v0.26.3 the section had no sorts and so no rule to hang it on.
     */
    public static int alphaKind(Object adapter) {
        int level = levelOf(adapter);
        // NONE means "no sort has ever been picked here", i.e. the list is in the order the stock
        // query returned it — and for these three that order IS alphabetical ascending: the DAO
        // reads them with `order by lower(pinyinGenre / pinyinArtist / pinyinAlbum)`. So the jump
        // applies from the first visit, without the user having to open the menu and choose the
        // sort the list is already in. The SONG level is the exception below: what the stock query
        // gives there is not a name order, which is why it is asked for explicitly.
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
            // The song-name sort and only it, exactly as Alpha.songs decides for every other song
            // list: that is the order the jump's keys are in (the tag titles). The file-name sorts
            // are left out on purpose — a file name usually opens with the track number, so every
            // group there would be a digit.
            return (s == S_NAME_AZ || s == S_NAME_ZA) ? A_LETTER : A_NONE;
        }
        return A_NONE;
    }

    // ---- applied where each list is filled ---------------------------------------------------

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

    /**
     * {@code confirm}: the artist list of a genre, sorted in place — the list already carries the
     * "Show all albums" button at index 0 and that row is not an artist, so it stays put.
     */
    public static void artists(List names) {
        try {
            if (names == null || names.size() < 3) return;
            int s = sortOf(K_ARTIST);
            if (s == NONE) return;
            Collections.sort(names.subList(1, names.size()), new NameCmp(s == Z_A));
        } catch (Throwable t) {
            // an unsorted list is still the list
        }
    }

    /**
     * An album list of this screen, sorted in place. Called on the way in — before the marker row
     * is put on top, from both builders ({@code Mark.genreAlbums}' caller and
     * {@code Mark.artistAlbums}) — and again on a live list when the sort is changed, where the
     * marker IS present and is skipped.
     */
    /**
     * The album list of a GENRE, as the screen's background thread has just got it from
     * {@code getAlbumsByGenreSync}: plain album names, one per name.
     *
     * <p><b>#291.3 reaches this list too.</b> The Albums screen encodes every album as
     * {@code name<SOH>folder} ({@code Albums.listForView} → {@code split}), so a name that several
     * folders share — "Demo", "Greatest Hits" — is several albums with their own covers, years and
     * songs. This list was the last one still built from bare names: every "Demo" in the library
     * collapsed into one row here and opening it gave all of them at once.
     *
     * <p>It cannot reuse {@code Albums.split}, because that one asks the whole library which
     * folders a name lives in, and this list is scoped to a genre: a folder whose tracks are all in
     * some other genre would become a row that opens empty. So the folders are collected from the
     * genre's own songs, which is the same set the row will show when it is opened
     * ({@code Albums.songsSync} filters by name + folder + genre). Every album is encoded, not only
     * the shared names — that is what makes the key identical to the Albums screen's, so the
     * thumbnail, the year, the album artist and a pinned thumbnail are the same entry there and
     * here ({@code Albums.coverKey}).
     */
    public static void albumList(List names, Genre g) {
        try {
            split(names, g == null ? null : g.getName());
        } catch (Throwable t) {
            // an unsplit list is the list this screen showed before v0.26.4
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
            // The very test the query behind the row makes, so a row cannot open empty — which
            // since #393 means GenreSplit, not equality: with the split on, a song reaches this
            // genre through a composite tag as well.
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
            if (set == null || set.isEmpty()) { out.add(o); continue; }   // defensive: keep as is
            ArrayList keys = new ArrayList(set);
            Collections.sort(keys, KEY_CMP);      // by folder: the keys share the name in front
            out.addAll(keys);
        }
        names.clear();
        names.addAll(out);
    }

    /**
     * How many albums a genre really has — distinct (name, folder) pairs among its songs, i.e. the
     * number of rows {@link #albumList} will build. The subtitle under a genre is counted with this
     * ({@code GenreInfo}) rather than with the query's distinct NAMES, or it says "3 albums" over a
     * list of four. Runs on that subtitle's own background pass, off the cached song table.
     */
    public static int albumCount(Genre g) {
        try {
            String genre = g == null ? null : g.getName();
            if (genre == null) return 0;
            List all = Albums.allSongs();
            if (all == null) return 0;
            LinkedHashSet keys = new LinkedHashSet();
            for (int i = 0; i < all.size(); i++) {
                Object o = all.get(i);
                if (!(o instanceof Song)) continue;
                Song s = (Song) o;
                if (!GenreSplit.has(s.getGenre(), genre)) continue;
                keys.add(Albums.albumKey(s.getAlbum(), s.getPath()));
            }
            return keys.size();
        } catch (Throwable t) {
            return 0;
        }
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
     * @param late the screen to come back to when the years have to be read and this is the main
     *             thread ({@code Mark.artistAlbums} builds its list there): the sort is done on
     *             the years already cached, the rest are read on a thread of their own and the
     *             list is sorted again when they arrive. Null where the caller is already off the
     *             main thread, which is where a year read belongs.
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
            // ditto
        }
    }

    /**
     * {@code GenresActivity.setSongList} — the one call every song list of this screen goes
     * through, whichever of the four ways it was built (an album, either marker row, or the list
     * restored for the queue's "open source"). It is also where the row's own second line is
     * decided, because the sort is what decides it.
     */
    public static List songs(GenresActivity a, List list) {
        int s = songSort();
        rowFlags(a, s);
        numbers(a);
        return songs(list);
    }

    /**
     * #291.3 / #220.1 — hand this screen's song adapters to {@link Disc}, which is what puts the CD
     * dividers, the pinned bar and the TRACK NUMBER column on them.
     *
     * <p>It is decided per LIST rather than per screen: an album gets all of it, the two "Show all
     * songs" lists get none of it, for the same reason the Albums screen keeps its dividers out of
     * the artist's flat list — a disc or a track number there names a record the list is not
     * showing. Which of the two this is comes from {@link #flat()}, i.e. from the marker byte of
     * the name the list was built with, never from "do all these songs share an album".
     *
     * <p>Unregistering is therefore not tidiness but the answer itself: {@code Disc} takes a
     * registered adapter to mean "a real album" and does not ask a second time.
     *
     * <p>The cache file has to be read before the first row binds, because {@code TrackCache.get}
     * answers from memory only — that read is what {@code warmIfWanted} does, gated on the setting,
     * exactly as {@code AlbumsActivity.initView} does it for the album screen. This is the
     * counterpart call for this one.
     */
    private static void numbers(GenresActivity a) {
        try {
            if (a == null || flat()) {
                Disc.setGenreAdapters(null, null);
                return;
            }
            TrackCache.warmIfWanted();
            Disc.setGenreAdapters(a.getAdapter3_2(), a.getAdapter4());
        } catch (Throwable t) {
            // the rows keep the numbers they had
        }
    }

    public static List songs(List list) {
        try {
            if (list == null || list.size() < 2) return list;
            int s = songSort();
            List out = s == NONE ? list : sortSongs(list, s);
            // Then group by disc, as the Albums screen does at the end of Albums.songs: the disc is
            // the PRIMARY key and the sort above only orders within it. Without this the list is in
            // whatever order was asked for, and Disc wants one that is contiguous by disc — which
            // path order gives for CDs in CD1/CD2 folders and never gives for the SIDES of a record,
            // where the two are one folder and interleave under every sort there is.
            // Not for the marker lists: "all songs of this genre" is not a record, and its order is
            // deliberately album-by-album.
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
     * What the second line of a song row shows, exactly as stock decides it for the same sorts in
     * {@code AlbumsActivity.switchSongSortType}: the artist always, plus the file date under a time
     * sort and the ALBUM only under "Subdiv. by Album" — which is offered in a "Show all songs"
     * list and nowhere else, so an album's own name never repeats itself down its own song list.
     * <p>The title itself is the tag's, as this screen has always shown it, and becomes the FILE
     * NAME under the two file-name sorts and the two time sorts — where the name being sorted on is
     * the point of the sort, which is stock's rule as well. Stock also drops to the file name under
     * a track sort; here it does not, because that would look like a defect on a screen whose rows
     * are otherwise titled from tags. ("Show titles from tags" overrides all of it, as everywhere.)
     */
    private static void rowFlags(GenresActivity a, int sort) {
        try {
            if (a == null) return;
            flags(a.getAdapter3_2(), sort);
            flags(a.getAdapter4(), sort);
        } catch (Throwable t) {
            // the rows keep the look they had
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

    // ---- picking a sort from the menu ---------------------------------------------------------

    private static void nameSortDialog(GenresActivity a, int level) {
        if (level == L_NONE || level == L_SONGS) return;
        ArrayList l = new ArrayList();
        l.add(a.getString(R.string.sort_a_z));
        l.add(a.getString(R.string.sort_z_a));
        // An album carries a year; a genre and an artist do not. Same four entries the Albums
        // screen offers for its album list, and the same two for the Artists screen.
        if (level == L_ALBUMS) {
            l.add(a.getString(R.string.ipp_sort_date_asc));
            l.add(a.getString(R.string.ipp_sort_date_desc));
        }
        // The 4th argument is the dialog THEME, not a flag (see ipp-menus-playlists).
        new SubMenuDialog(a, l, new NamePick(a, level), R.style.Dialog_Common).show();
    }

    private static void songDirDialog(GenresActivity a, int asc, int desc, boolean time) {
        ArrayList l = new ArrayList();
        l.add(a.getString(R.string.sort_a_z));
        l.add(a.getString(R.string.sort_z_a));
        // The file name carries a date; the song title does not. Stock's own split, kept.
        if (time) {
            l.add(a.getString(R.string.sort_time_asc));
            l.add(a.getString(R.string.sort_time_desc));
        }
        new SubMenuDialog(a, l, new SongPick(a, asc, desc), R.style.Dialog_Common).show();
    }

    /** Named, never anonymous: d8 8.2.2-dev crashes dexing anonymous classes here. */
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
            if (parent != null) parent.dismiss();   // stock's pattern: the pick closes both levels
            return true;
        }
    }

    /** The direction of a song sort: the entry above chose WHAT, this chooses which way round. */
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

    // ---- re-sorting the list that is on screen -------------------------------------------------

    private static void applyName(GenresActivity a, int level, int value) {
        try {
            MyBaseAdapter ad = live(a);
            if (ad == null || levelOf(ad) != level) return;
            setSort(level == L_GENRES ? K_GENRE : (level == L_ARTISTS ? K_ARTIST : K_ALBUM), value);

            if (level == L_ALBUMS && (value == YEAR_ASC || value == YEAR_DESC)) {
                // The years come out of the files themselves the first time an album is asked
                // about, so the sort cannot run on the main thread (YearCache.warm opens one file
                // per album). Everything else here is a string compare and is done in place.
                new Thread(new Resort(a, ad, true)).start();
                return;
            }
            resortNow(a, ad, level == L_ALBUMS);
        } catch (Throwable t) {
            // the list keeps the order it had
        }
    }

    private static void applySong(GenresActivity a, int value) {
        try {
            MyBaseAdapter ad = live(a);
            if (ad == null || levelOf(ad) != L_SONGS) return;
            setSort(flat() ? K_FLAT : K_SONG, value);
            rowFlags(a, value);
            // "Sort by track" reads the tag of every song whose number is not cached yet, so this
            // one goes to a thread of its own; the others follow it for one code path, not two.
            new Thread(new Resort(a, ad, false)).start();
        } catch (Throwable t) {
            // ditto
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
     * The sort that has to read something: it runs on a thread of its own and the result is applied
     * on the main one. A copy is sorted rather than the adapter's own list — {@code setItems}
     * clears its list before it copies the new one, so handing it {@code getItemList()} would empty
     * both.
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
                // the list keeps the order it had
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
                if (live(a) != ad) return;              // the user has moved on to another level
                if (levelOf(ad) == L_SONGS) a.setSongList(list);
                ad.setItems(list);                      // Queue.relist rides this: the play order
                // The disc bar takes layout space, so the posted update would show it a frame after
                // the re-sorted tracks -- i.e. the list visibly jumping down under it.
                if (levelOf(ad) == L_SONGS) Disc.preset(ad, list, lv(a));
                land(a, ad);                            // follows the list, as everywhere else
            } catch (Throwable t) {
                // ditto
            }
        }
    }

    /**
     * Where the cursor goes after a re-sort: the top of the list, which is what the Albums screen
     * does. {@code Mark.afterFill} then steps it off a button row, exactly as on a fresh build.
     */
    private static void land(GenresActivity a, MyBaseAdapter ad) {
        // The ticks are POSITIONS: after a re-sort they would point at other rows. longConfirm
        // also ticks the row it opened the menu on, so this is what leaves the list as we found it.
        List sel = ad.getSelectedIndexList();
        if (sel != null) sel.clear();
        ad.setPosition(0);
        ListView lv = lv(a);
        if (lv != null) lv.setSelection(0);
        Mark.afterFill(ad, lv);
        ad.notifyDataSetChanged();
    }

    // ---- the comparators ------------------------------------------------------------------------

    /** A row's name, whichever of the three kinds of item the level holds. */
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
            // realName: an album row of an artist's list carries the folder-encoded name, and the
            // folder must not decide where the row sorts.
            String x = Albums.realName(nameOf(a));
            String y = Albums.realName(nameOf(b));
            x = x == null ? "" : x.toLowerCase(Locale.ROOT);
            y = y == null ? "" : y.toLowerCase(Locale.ROOT);
            int c = x.compareTo(y);
            return desc ? -c : c;
        }
    }

    /** By year, then by name — the album's year comes out of {@code YearCache}, as in Albums. */
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
     * The years of a list of album rows, read once each — one file open per album, so never on the
     * main thread.
     *
     * @return true when a year is still missing afterwards, i.e. the read was skipped because this
     *         is the main thread and somebody has to do it elsewhere.
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

    /** Read the missing years off the main thread, then sort the list that is on screen again. */
    private static final class Warm implements Runnable {
        private final GenresActivity a;
        private final ArrayList names;

        Warm(GenresActivity a, ArrayList names) { this.a = a; this.names = names; }

        public void run() {
            try {
                YearCache.warm(names);
                a.runOnUiThread(new Late(a));
            } catch (Throwable t) {
                // the list keeps the order the cached years gave it
            }
        }
    }

    private static final class Late implements Runnable {
        private final GenresActivity a;

        Late(GenresActivity a) { this.a = a; }

        public void run() {
            try {
                MyBaseAdapter ad = live(a);
                if (ad == null || levelOf(ad) != L_ALBUMS) return;   // the user has moved on
                int pos = ad.getPosition();
                albums(ad.getItemList());
                ad.notifyDataSetChanged();
                // The list was built moments ago: if the cursor is still where the fill left it,
                // put it back on the first album; if the user has already moved, leave it alone.
                if (pos <= 1) land(a, ad);
            } catch (Throwable t) {
                // ditto
            }
        }
    }

    // ---- songs ----------------------------------------------------------------------------------

    private static List sortSongs(List src, int code) {
        ArrayList out = new ArrayList(src);
        if (code == S_TRACK) {
            Collections.sort(out, new SongCmp(S_FILE_AZ));       // a stable base for the numbers
            if (onMain()) {
                // TrackCache.sorted() reads the tag of every song whose number is not cached yet.
                // On the main thread (a list restored on the way into the screen) the cached
                // numbers are all we may use; the rest keep the file order, which is what an
                // untagged song does anyway.
                Collections.sort(out, new TrackComparator());
                return out;
            }
            List t = TrackCache.sorted(out);
            return t == null ? out : t;
        }
        Collections.sort(out, new SongCmp(code));
        return out;
    }

    /** The orders stock's own album query offers, done in Java (this screen has no such query). */
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
