package com.innioasis.ipp;

import android.app.Activity;
import android.view.View;

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
 * The order of the Audiobooks section's three lists. Applied to the list on its way to the
 * adapter, not asked of the query: the stock queries read — and {@code getArtistsBySort} even
 * writes — sort preferences shared with Music, Photos and Settings. The name key is
 * {@code HanziToPinyin.getString}, the function that filled the pinyin columns, so A-Z matches the
 * database's.
 */
public final class Audiobooks {

    private Audiobooks() {}

    /** All audiobooks and one book's chapters: one screen, so one key. */
    public static final String KEY_SONGS = "ab_song_sort";

    /** Two lists shown by one Activity ({@code PlayerActivity}): one key each, never shared. */
    public static final String KEY_ARTISTS = "ab_artist_sort";
    public static final String KEY_ALBUMS = "ab_album_sort";

    private static final int SORT_A_Z = 0;
    private static final int SORT_Z_A = 1;
    private static final int SORT_OLD = 2;
    private static final int SORT_NEW = 3;

    private static String keyFor(Activity a) {
        if (a instanceof AllAudiobooksActivity) return KEY_SONGS;
        String kind = null;
        if (a != null && a.getIntent() != null) kind = a.getIntent().getStringExtra("title");
        return "album".equals(kind) ? KEY_ALBUMS : KEY_ARTISTS;
    }

    private static int value(String key) {
        return Prefs.val(Y1Application.Companion.getAppContext(), key);
    }

    private static boolean byName(int v) { return v == SORT_A_Z || v == SORT_Z_A; }

    private static boolean asc(int v) { return v == SORT_A_Z || v == SORT_OLD; }

    /**
     * Before the list becomes the adapter's: it is also the PLAY order, and a later re-sort drags
     * the running order with it through {@code Queue.relist}.
     */
    public static void sortSongs(List songs) {
        try {
            if (songs == null || songs.size() < 2) return;
            int v = value(KEY_SONGS);
            Collections.sort(songs, new SongSort(byName(v), asc(v)));
        } catch (Throwable t) {
        }
    }

    /** Artists and Albums: plain names, A-Z or Z-A. */
    public static void sortNames(Activity a, List names) {
        try {
            if (names == null || names.size() < 2) return;
            Collections.sort(names, new NameSort(value(keyFor(a)) == SORT_Z_A));
        } catch (Throwable t) {
        }
    }

    /** "Sort by File name" for songs (four directions), "Sort by" for names (two), as in Music. */
    private static int entry(Activity a) {
        return a instanceof AllAudiobooksActivity
                ? R.string.song_menu_sort_by_filename
                : R.string.song_menu_sort_by;
    }

    /** First, as on every other list screen. */
    public static void menu(List options, Activity a) {
        try {
            if (options == null || a == null) return;
            options.add(0, a.getString(entry(a)));
        } catch (Throwable t) {
        }
    }

    /**
     * Both menus are dispatched BY INDEX, so stock's indexes are shifted back by one; -1 means the
     * pick was ours and the caller returns true.
     */
    public static int pick(Activity a, SubmenuAdapter.Item item, int index) {
        try {
            String s = item == null ? null : item.getString();
            if (s != null && a != null && s.equals(a.getString(entry(a)))) {
                sortMenu(a);
                return -1;
            }
        } catch (Throwable t) {
        }
        return index > 0 ? index - 1 : index;
    }

    private static void sortMenu(Activity a) {
        try {
            ArrayList l = new ArrayList();
            l.add(a.getString(R.string.sort_a_z));
            l.add(a.getString(R.string.sort_z_a));
            if (a instanceof AllAudiobooksActivity) {
                l.add(a.getString(R.string.sort_time_asc));
                l.add(a.getString(R.string.sort_time_desc));
            }
            // The 4th argument is the dialog THEME, not a flag.
            new SubMenuDialog(a, l, new SortPick(a), R.style.Dialog_Common).show();
        } catch (Throwable t) {
        }
    }

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
            }
            return true;
        }
    }

    /**
     * Re-orders the list on screen (there is no method to reload it). The adapter gets a COPY:
     * {@code setItems} clears its own list, which is what {@code getItemList} returns. Cursor to
     * the top and ticks cleared, as stock's re-sorts do — the ticks are indexes and outlive the list.
     */
    private static void resort(Activity a) {
        View v = a.findViewById(R.id.lv_audiobooks);
        MyBaseAdapter m = v == null ? null : Lv.model(v);
        if (m == null) return;
        List items = m.getItemList();
        if (items == null || items.size() < 2) return;
        ArrayList out = new ArrayList(items);
        if (a instanceof AllAudiobooksActivity) sortSongs(out); else sortNames(a, out);
        m.setItems(out);
        m.setPosition(0);
        Lv.select(v, 0);
        List sel = m.getSelectedIndexList();
        if (sel != null && !sel.isEmpty()) sel.clear();
        m.notifyDataSetChanged();
    }

    /** The key the database sorts by: the pinyin columns are filled with this very call. */
    private static String pinyin(String s) {
        if (s == null) return "";
        try {
            String k = HanziToPinyin.getInstance().getString(s);
            if (k != null) return k;
        } catch (Throwable t) {
        }
        return s.toLowerCase(Locale.ROOT);
    }

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
                // A book copied in one go carries one date; without a tie-break the sort does nothing.
                if (r == 0) r = name(x, y);
            }
            return asc ? r : -r;
        }

        private int name(Song x, Song y) {
            int r = key(x).compareTo(key(y));
            return r != 0 ? r : nz(x.getPath()).compareTo(nz(y.getPath()));
        }

        private String key(Song s) {
            String p = s.getPinyinName();
            if (p != null && p.length() > 0) return p;
            return pinyin(s.getName());
        }

        private String nz(String s) { return s == null ? "" : s; }
    }

    private static final class NameSort implements Comparator {
        private final boolean reverse;
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
