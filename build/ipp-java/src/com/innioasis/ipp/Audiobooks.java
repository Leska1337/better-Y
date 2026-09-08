package com.innioasis.ipp;

import android.app.Activity;
import android.view.View;
import android.widget.ListView;

import com.innioasis.music.adapter.MyBaseAdapter;
import com.innioasis.music.adapter.SubmenuAdapter;
import com.innioasis.music.util.SubMenuDialog;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.activity.AllAudiobooksActivity;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.utils.HanziToPinyin;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

/**
 * The order the AUDIOBOOKS section lists things in — All audiobooks, Artists, Albums.
 *
 * Three lists had no order to ask for. Their queries could always produce one — the song list
 * through the four DAO variants behind {@code getSongsSync}, the two name lists through
 * {@code order by lower(pinyinArtist)} and its reverse — but there was no entry in any of the
 * three long-press menus, so what a screen showed was whatever the query happened to return.
 *
 * Why the order is applied HERE rather than asked of the query. The three stock paths all read
 * preferences that belong to somebody else: {@code getSongsSync} and {@code getAlbumsSync} read
 * the app-wide {@code isSortByName}/{@code isSortLogic} pair that Photos, the Settings screen and
 * a good part of {@code Y1Repository} share, and {@code getArtistsBySort} WRITES the artist sort
 * of the Music section as a side effect of being asked. Picking a sort in Audiobooks would then
 * reorder screens the user is not looking at. So the queries are left exactly as they are and the
 * list is put in order on its way to the adapter.
 *
 * The sort must therefore be computed rather than taken from the incoming order, and it is
 * computed the way the DATABASE would have: the name key is {@code HanziToPinyin.getString},
 * which is the very function that filled the {@code pinyin*} columns the stock queries order by,
 * so A-Z here and A-Z there are the same list.
 */
public final class Audiobooks {

    private Audiobooks() {}

    /**
     * All audiobooks and the chapter list of one book share a key: {@code AllAudiobooksActivity}
     * is one screen showing audiobook songs, entered either whole or filtered by an artist or an
     * album, and an order chosen in one of those is the order the section is being read in.
     */
    public static final String KEY_SONGS = "ab_song_sort";

    /**
     * The two name lists keep their own keys, and separately from each other: they are two
     * different lists shown by one Activity ({@code PlayerActivity}, told apart by its "title"
     * extra), which is exactly the shape that made sorting an artist's albums re-sort the whole
     * Albums screen — skill ipp-albums-artists, "The album LIST sort is per view too".
     */
    public static final String KEY_ARTISTS = "ab_artist_sort";
    public static final String KEY_ALBUMS = "ab_album_sort";

    private static final int SORT_A_Z = 0;
    private static final int SORT_Z_A = 1;
    private static final int SORT_OLD = 2;
    private static final int SORT_NEW = 3;

    /** Which list this screen is showing, and therefore which key answers for it. */
    private static String keyFor(Activity a) {
        if (a instanceof AllAudiobooksActivity) return KEY_SONGS;
        String kind = null;
        if (a != null && a.getIntent() != null) kind = a.getIntent().getStringExtra("title");
        return "album".equals(kind) ? KEY_ALBUMS : KEY_ARTISTS;
    }

    private static int value(String key) {
        return Prefs.val(Y1Application.Companion.getAppContext(), key);
    }

    /** A-Z and "oldest first" are both ascending; the other two are the same orders reversed. */
    private static boolean byName(int v) { return v == SORT_A_Z || v == SORT_Z_A; }

    private static boolean asc(int v) { return v == SORT_A_Z || v == SORT_OLD; }

    // ------------------------------------------------------------------ the order, applied

    /**
     * All audiobooks, and the chapters of one book — the same screen either way.
     *
     * Sorted before the list becomes the adapter's, because that list is also the PLAY order: the
     * player is handed exactly what the screen holds ({@code spv.getPlaylist()}), and a re-sort
     * made afterwards drags the running order with it through {@code Queue.relist}.
     */
    public static void sortSongs(List songs) {
        try {
            if (songs == null || songs.size() < 2) return;
            int v = value(KEY_SONGS);
            Collections.sort(songs, new SongSort(byName(v), asc(v)));
        } catch (Throwable t) {
            // a list in the query's own order is still a list
        }
    }

    /** The Artists and Albums lists of the section: plain names, A-Z or Z-A. */
    public static void sortNames(Activity a, List names) {
        try {
            if (names == null || names.size() < 2) return;
            Collections.sort(names, new NameSort(value(keyFor(a)) == SORT_Z_A));
        } catch (Throwable t) {
            // as above
        }
    }

    // ------------------------------------------------------------------ the menu entry

    /**
     * The entry's wording follows what the list is made of: the song list is ordered by the file
     * on disk ("Sort by File name", the same four directions it means everywhere else), while a
     * list of names has only the two, which is what the Music section's own Artists screen calls
     * "Sort by".
     */
    private static int entry(Activity a) {
        return a instanceof AllAudiobooksActivity
                ? R.string.song_menu_sort_by_filename
                : R.string.song_menu_sort_by;
    }

    /** Put the entry FIRST, as on every other list screen in the app. */
    public static void menu(List options, Activity a) {
        try {
            if (options == null || a == null) return;
            options.add(0, a.getString(entry(a)));
        } catch (Throwable t) {
            // a menu without the entry is stock's own menu
        }
    }

    /**
     * Claim the entry before the screen's own dispatch, and hand back the index that dispatch
     * should see.
     *
     * Both menus here are dispatched BY INDEX (0/1 multi-select, 2 delete), so an entry standing
     * in front of them means every stock number is one too high; {@code -1} says the pick was
     * ours and the caller returns true, closing the menu under the submenu.
     */
    public static int pick(Activity a, SubmenuAdapter.Item item, int index) {
        try {
            String s = item == null ? null : item.getString();
            if (s != null && a != null && s.equals(a.getString(entry(a)))) {
                sortMenu(a);
                return -1;
            }
        } catch (Throwable t) {
            // an unanswerable item is stock's own, which the shift below is for
        }
        return index > 0 ? index - 1 : index;
    }

    /** The directions, then the list is put in the chosen order. */
    private static void sortMenu(Activity a) {
        try {
            ArrayList l = new ArrayList();
            l.add(a.getString(R.string.sort_a_z));
            l.add(a.getString(R.string.sort_z_a));
            if (a instanceof AllAudiobooksActivity) {
                // A file has a date; an artist's name does not.
                l.add(a.getString(R.string.sort_time_asc));
                l.add(a.getString(R.string.sort_time_desc));
            }
            // The 4th argument is the dialog THEME, not a flag (see ipp-menus-playlists).
            new SubMenuDialog(a, l, new SortPick(a), R.style.Dialog_Common).show();
        } catch (Throwable t) {
            // a sort that cannot be offered leaves the list in the order it is in
        }
    }

    /** Named, never anonymous: d8 crashes dexing anonymous classes here. */
    public static final class SortPick implements SubMenuDialog.Callback {
        private final Activity a;

        SortPick(Activity a) { this.a = a; }

        public boolean select(int index, SubmenuAdapter.Item item) {
            try {
                String s = item == null ? null : item.getString();
                int v = SORT_A_Z;
                if (a.getString(R.string.sort_z_a).equals(s)) v = SORT_Z_A;
                else if (a.getString(R.string.sort_time_asc).equals(s)) v = SORT_OLD;
                else if (a.getString(R.string.sort_time_desc).equals(s)) v = SORT_NEW;
                Prefs.setInt(a, keyFor(a), v);
                resort(a);
            } catch (Throwable t) {
                // the preference is written or it is not; either way the menu closes
            }
            return true;
        }
    }

    /**
     * Re-order the list that is ON SCREEN rather than running the query again: the rows are
     * already exactly what the sort is about, and both screens build their list inside a
     * coroutine started from {@code initView}, i.e. there is no "load this list" method to call
     * a second time.
     *
     * The adapter is handed a COPY. {@code MyBaseAdapter.setItems} clears its own list before it
     * refills it, and {@code getItemList} hands back that very list — passing it straight back
     * would empty the screen.
     *
     * The cursor goes back to the top and the tick the long press put on its row is taken back,
     * which is what stock's own re-sorts do ({@code SongListActivity.switchSortType}); the tick
     * belongs to the SCREEN and is a list of indexes, so rebuilding the list does not clear it.
     */
    private static void resort(Activity a) {
        View v = a.findViewById(R.id.lv_audiobooks);
        if (!(v instanceof ListView)) return;
        ListView lv = (ListView) v;
        Object ad = lv.getAdapter();
        if (!(ad instanceof MyBaseAdapter)) return;
        MyBaseAdapter m = (MyBaseAdapter) ad;
        List items = m.getItemList();
        if (items == null || items.size() < 2) return;
        ArrayList out = new ArrayList(items);
        if (a instanceof AllAudiobooksActivity) sortSongs(out); else sortNames(a, out);
        m.setItems(out);
        m.setPosition(0);
        lv.setSelection(0);
        List sel = m.getSelectedIndexList();
        if (sel != null && !sel.isEmpty()) sel.clear();
        m.notifyDataSetChanged();
    }

    // ------------------------------------------------------------------ the comparisons

    /**
     * The name key the DATABASE sorts by. {@code pinyinName} and friends are filled with exactly
     * this call, and every stock query orders by {@code lower(pinyin…)} — the function already
     * lower-cases what it returns, so the two orders are one order. Falls back to the name itself
     * for anything it cannot answer.
     */
    private static String pinyin(String s) {
        if (s == null) return "";
        try {
            String k = HanziToPinyin.getInstance().getString(s);
            if (k != null) return k;
        } catch (Throwable t) {
            // below
        }
        return s.toLowerCase(Locale.ROOT);
    }

    /** Named, never anonymous: d8 crashes dexing anonymous classes here. */
    private static final class SongSort implements Comparator {
        private final boolean byName;
        private final boolean asc;

        SongSort(boolean byName, boolean asc) { this.byName = byName; this.asc = asc; }

        public int compare(Object a, Object b) {
            if (!(a instanceof Song) || !(b instanceof Song)) return 0;
            Song x = (Song) a, y = (Song) b;
            int r;
            if (byName) {
                r = name(x, y);
            } else {
                long lx = x.getFileDate(), ly = y.getFileDate();
                r = lx < ly ? -1 : (lx > ly ? 1 : 0);
                // A WHOLE BOOK COPIED ONTO THE CARD IN ONE OPERATION CARRIES ONE DATE, and that is
                // the normal case rather than the exception. With nothing to tell two chapters
                // apart the sort is stable, i.e. leaves the list exactly as it found it, and the
                // entry reads as broken. Same tie-break, for the same reason, as Folders.
                if (r == 0) r = name(x, y);
            }
            return asc ? r : -r;
        }

        private int name(Song x, Song y) {
            int r = key(x).compareTo(key(y));
            // Two files of one name in different folders: the path is what the library itself
            // keeps them apart by.
            return r != 0 ? r : nz(x.getPath()).compareTo(nz(y.getPath()));
        }

        private String key(Song s) {
            String p = s.getPinyinName();
            if (p != null && p.length() > 0) return p;
            return pinyin(s.getName());
        }

        private String nz(String s) { return s == null ? "" : s; }
    }

    /** Named, never anonymous: d8 crashes dexing anonymous classes here. */
    private static final class NameSort implements Comparator {
        private final boolean reverse;
        // One conversion per name rather than one per comparison.
        private final HashMap keys = new HashMap();

        NameSort(boolean reverse) { this.reverse = reverse; }

        public int compare(Object a, Object b) {
            int r = key(a).compareTo(key(b));
            return reverse ? -r : r;
        }

        private String key(Object o) {
            String s = o instanceof String ? (String) o : "";
            String k = (String) keys.get(s);
            if (k == null) {
                k = pinyin(s);
                keys.put(s, k);
            }
            return k;
        }
    }
}
