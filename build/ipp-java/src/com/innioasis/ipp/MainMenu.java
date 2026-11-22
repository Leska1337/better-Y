package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import androidx.recyclerview.widget.RecyclerView;

import com.innioasis.music.objects.Constant;
import com.innioasis.y1.R;
import com.innioasis.y1.activity.IppFlowActivity;
import com.innioasis.y1.activity.video.VideoListActivity;
import com.innioasis.y1.base.BaseActivity;
import com.innioasis.y1.base.BaseBindingAdapter;

import java.util.ArrayList;
import java.util.List;

/**
 * better-Y → Menu → Main menu: which rows the main menu and the first level of Music, Videos and
 * Audiobooks show. Rows are matched by their label, and every menu that dispatches by index is
 * handed back the index stock's switch knows. Settings has no key: it cannot be hidden.
 */
public final class MainMenu {

    public static final String KEY_MUSIC = "mm_music";
    public static final String KEY_VIDEOS = "mm_videos";
    public static final String KEY_BOOKS = "mm_audiobooks";

    private static final int[] MAIN = {
        R.string.main_now, R.string.main_music, R.string.main_video, R.string.main_audiobook,
        R.string.main_book, R.string.main_photos, R.string.main_fm, R.string.main_bluetooth,
    };
    private static final String[] MAIN_KEYS = {
        "mm_now", KEY_MUSIC, KEY_VIDEOS, KEY_BOOKS, "mm_ebook", "mm_photos", "mm_fm", "mm_bluetooth",
    };

    private static final int[] MUSIC = {
        R.string.ipp_coverflow, R.string.music_all_songs, R.string.music_playlists,
        R.string.music_artists, R.string.ipp_album_artists, R.string.music_albums,
        R.string.music_genres, R.string.music_folders, R.string.music_search,
    };
    private static final String[] MUSIC_KEYS = {
        "mm_coverflow", "mm_songs", "mm_playlists", "mm_artists", AlbumArtists.KEY, "mm_albums",
        "mm_genres", "mm_folders", "mm_search",
    };
    // the rows of MusicMainActivity.confirm's switch, in its order
    private static final int[] MUSIC_STOCK = {
        R.string.music_all_songs, R.string.music_playlists, R.string.music_artists,
        R.string.music_albums, R.string.music_genres, R.string.music_folders, R.string.music_search,
    };

    // also the order of VideoListActivity.confirm's root switch
    private static final int[] VIDEOS = {
        R.string.video_list_all, R.string.video_list_playlist, R.string.video_list_folders,
        R.string.video_list_search,
    };
    private static final String[] VIDEO_KEYS = {
        "mm_video_all", "mm_video_playlist", "mm_video_folders", "mm_video_search",
    };

    private static final int[] BOOKS = {
        R.string.music_all_audiobooks, R.string.music_artists, R.string.music_albums,
        R.string.music_folders, R.string.music_bookmark_lists,
    };
    private static final String[] BOOK_KEYS = {
        "mm_book_all", "mm_book_artists", "mm_book_albums", "mm_book_folders", "mm_bookmarks",
    };

    /** Every key is On by default. */
    public static final String[] DEFAULT_ON = join(new String[][]{
        MAIN_KEYS, MUSIC_KEYS, VIDEO_KEYS, BOOK_KEYS});

    private static List mainFull;       // the main menu as stock builds it
    private static List bookFull;       // the Audiobooks menu as stock builds it
    private static List bookShown;
    private static List videoShown;     // BrowseItem rows of the Videos root

    private MainMenu() {}

    private static String[] join(String[][] parts) {
        ArrayList l = new ArrayList();
        for (int i = 0; i < parts.length; i++) {
            for (int j = 0; j < parts[i].length; j++) l.add(parts[i][j]);
        }
        return (String[]) l.toArray(new String[l.size()]);
    }

    /** The key of the row called {@code label}; null for a row that is always shown. */
    private static String keyOf(Context c, Object label, int[] rows, String[] keys) {
        if (label == null) return null;
        for (int i = 0; i < rows.length; i++) {
            if (label.equals(c.getString(rows[i]))) return keys[i];
        }
        return null;
    }

    private static List shown(Context c, List full, int[] rows, String[] keys) {
        ArrayList out = new ArrayList();
        for (int i = 0; i < full.size(); i++) {
            Object o = full.get(i);
            String k = keyOf(c, o, rows, keys);
            if (k == null || Prefs.on(c, k)) out.add(o);
        }
        return out;
    }

    private static int indexOf(Context c, Object label, int[] rows) {
        if (label == null) return -1;
        for (int i = 0; i < rows.length; i++) {
            if (label.equals(c.getString(rows[i]))) return i;
        }
        return -1;
    }

    /**
     * A menu row with none of its rows on is switched off, so the setting shows what the main
     * menu does. Run on leaving the section and before the main menu is filtered.
     */
    public static void settle(Context c) {
        settle(c, KEY_MUSIC, MUSIC_KEYS);
        settle(c, KEY_VIDEOS, VIDEO_KEYS);
        settle(c, KEY_BOOKS, BOOK_KEYS);
    }

    private static void settle(Context c, String key, String[] rows) {
        try {
            if (!Prefs.on(c, key)) return;
            for (int i = 0; i < rows.length; i++) {
                if (Prefs.on(c, rows[i])) return;
            }
            Prefs.setBool(c, key, false);
        } catch (Throwable t) {
        }
    }

    // ---- the main menu ----------------------------------------------------------------------

    /** End of MainActivity.initView: the list is the adapter's own, so it is filtered in place. */
    public static void main(List list, Context c) {
        try {
            settle(c);
            mainFull = new ArrayList(list);
            List s = shown(c, mainFull, MAIN, MAIN_KEYS);
            list.clear();
            list.addAll(s);
        } catch (Throwable t) {
        }
    }

    /**
     * MainActivity.onResume: the menu is not re-created on the way back from better-Y. The cursor
     * stays on the row it stood on, or the nearest one.
     */
    public static void mainResume(BaseActivity a) {
        try {
            if (mainFull == null) return;
            settle(a);
            RecyclerView rv = (RecyclerView) ((Activity) a).findViewById(R.id.rc_list);
            if (rv == null || !(rv.getAdapter() instanceof BaseBindingAdapter)) return;
            BaseBindingAdapter ad = (BaseBindingAdapter) rv.getAdapter();
            List d = ad.getData();
            List s = shown(a, mainFull, MAIN, MAIN_KEYS);
            if (s.equals(d)) return;
            int mark = a.getMark();
            Object at = mark >= 0 && mark < d.size() ? d.get(mark) : null;
            d.clear();
            d.addAll(s);
            int m = at == null ? -1 : d.indexOf(at);
            if (m < 0) m = Math.max(0, Math.min(mark, d.size() - 1));
            a.setMark(m);
            ad.notifyDataSetChanged();
            Bar.relist(rv);
            rv.scrollToPosition(m);
            MenuStyle.mainPreview(a);
        } catch (Throwable t) {
        }
    }

    // ---- Music ------------------------------------------------------------------------------

    /** After Flow.musicMenu in MusicMainActivity.initView. */
    public static void music(List list, Context c) {
        try {
            List s = shown(c, new ArrayList(list), MUSIC, MUSIC_KEYS);
            list.clear();
            list.addAll(s);
        } catch (Throwable t) {
        }
    }

    /** Top of MusicMainActivity.confirm: the index stock's switch knows; -1 when the row was ours. */
    public static int musicPick(Activity a, int pos) {
        try {
            List l = Constant.INSTANCE.getMainList();
            if (l == null || pos < 0 || pos >= l.size()) return -1;
            Object label = l.get(pos);
            if (a.getString(R.string.ipp_coverflow).equals(label)) {
                a.startActivity(new Intent(a, IppFlowActivity.class));
                return -1;
            }
            if (a.getString(R.string.ipp_album_artists).equals(label)) {
                AlbumArtists.open(a);
                return -1;
            }
            return indexOf(a, label, MUSIC_STOCK);
        } catch (Throwable t) {
            return pos;
        }
    }

    // ---- Audiobooks -------------------------------------------------------------------------

    /** EbookActivity.initView, on the list its adapter is built with. */
    public static void books(List list, Context c) {
        try {
            bookFull = new ArrayList(list);
            List s = shown(c, bookFull, BOOKS, BOOK_KEYS);
            list.clear();
            list.addAll(s);
            bookShown = list;
        } catch (Throwable t) {
        }
    }

    /** Top of EbookActivity.confirm: the shown row's index in the list stock built. */
    public static int bookPick(int pos) {
        try {
            if (bookShown == null || bookFull == null || pos < 0 || pos >= bookShown.size()) return pos;
            return bookFull.indexOf(bookShown.get(pos));
        } catch (Throwable t) {
            return pos;
        }
    }

    // ---- Videos -----------------------------------------------------------------------------

    /** End of VideoListActivity's videoMainList: the root rows, without the hidden ones. */
    public static List videos(List list, Context c) {
        try {
            ArrayList out = new ArrayList();
            for (int i = 0; i < list.size(); i++) {
                VideoListActivity.BrowseItem b = (VideoListActivity.BrowseItem) list.get(i);
                String k = keyOf(c, b.getDisplayName(), VIDEOS, VIDEO_KEYS);
                if (k == null || Prefs.on(c, k)) out.add(b);
            }
            videoShown = out;
            return out;
        } catch (Throwable t) {
            return list;
        }
    }

    /** VideoListActivity.confirm at the root: the cursor's row as stock's switch numbers it. */
    public static int videoPick(BaseActivity a) {
        int mark = a.getMark();
        try {
            if (videoShown == null || mark < 0 || mark >= videoShown.size()) return mark;
            VideoListActivity.BrowseItem b = (VideoListActivity.BrowseItem) videoShown.get(mark);
            int i = indexOf(a, b.getDisplayName(), VIDEOS);
            return i < 0 ? mark : i;
        } catch (Throwable t) {
            return mark;
        }
    }
}
