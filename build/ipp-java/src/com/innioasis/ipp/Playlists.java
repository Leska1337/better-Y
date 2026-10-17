package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.database.Cursor;

import androidx.room.RoomDatabase;
import androidx.room.util.UUIDUtil;

import com.innioasis.music.PlayListActivity;
import com.innioasis.music.adapter.MyBaseAdapter;
import com.innioasis.music.adapter.SubmenuAdapter;
import com.innioasis.music.adapter.rv.RVBaseAdapter;
import com.innioasis.music.util.SubMenuDialog;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.base.BaseActivity;
import com.innioasis.y1.database.Playlist;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.database.Y1Repository;
import com.innioasis.y1.activity.video.VideoListActivity;
import com.innioasis.y1.database.video.VideoInfo;
import com.innioasis.y1.utils.SharedPreferencesUtils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

/**
 * Playlists beyond stock. The Favorites playlist ({@link Fav}) is pinned to the top, hidden (not
 * deleted) while "Likes system" is off, and cannot be deleted — both list sources in
 * {@code Y1Repository} pass through {@link #first}. Also: date-added order for music and video
 * playlists, "Add to <playlist>" inside a playlist, and "already in the playlist".
 */
public final class Playlists {

    /** The id lives only in {@link Fav#UUID_STR}. */
    private static final String FAV_ID = Fav.UUID_STR;

    /** False only in a test build that must delete Favorites to check it is re-created. */
    private static final boolean PROTECT = true;

    /** For the delete guards; {@link #isFav} also answers pinning and hiding, which always hold. */
    public static boolean locked(Object o) {
        return PROTECT && isFav(o);
    }

    /** A {@code Playlist} or a {@code UUID}. */
    public static boolean isFav(Object o) {
        try {
            if (o instanceof Playlist) return FAV_ID.equals(String.valueOf(((Playlist) o).getPlaylistId()));
            if (o instanceof UUID) return FAV_ID.equals(o.toString());
            return false;
        } catch (Throwable t) {
            return false;
        }
    }

    /** "Likes system", which also shows the heart in {@code Deck}. */
    public static boolean enabled() {
        Context c = Y1Application.Companion.getAppContext();
        return Prefs.on(c, "likes");
    }

    /** Favorites first, or absent while likes are off. The input untouched when nothing to do. */
    public static List first(List playlists) {
        try {
            if (playlists == null || playlists.isEmpty()) return playlists;
            int at = -1;
            for (int i = 0; i < playlists.size(); i++) {
                if (isFav(playlists.get(i))) { at = i; break; }
            }
            if (at < 0) return playlists;
            if (!enabled()) {
                ArrayList out = new ArrayList(playlists);
                out.remove(at);
                return out;
            }
            if (at == 0) return playlists;
            ArrayList out = new ArrayList(playlists);
            out.add(0, out.remove(at));
            return out;
        } catch (Throwable t) {
            return playlists;
        }
    }

    // The user may rename Favorites, and a LANGUAGE CHANGE relabels it — nothing else does, so the
    // trigger is the stored language index, not the name. From MainActivity.initView: the language
    // screen itself still answers getString in the old locale.

    private static final String LANG_KEY = "fav_lang";
    private static final String HEART = "❤ ";
    private static final String OLD_RU = "Любимые треки";

    /** Once per app start, from {@code MainActivity.initView}. */
    public static void syncName(Context c) {
        try {
            if (c == null) return;
            // It EXISTS whatever the setting says, which only decides whether it is shown.
            Fav.ensure(c);

            int lang = SharedPreferencesUtils.INSTANCE.getLanguage();
            boolean relabel = Prefs.getInt(c, LANG_KEY, -1) != lang;
            if (relabel) Prefs.setInt(c, LANG_KEY, lang);

            Y1Repository repo = Y1Application.Companion.getY1Repository();
            if (repo == null) return;
            Playlist p = repo.getPlaylistById(UUID.fromString(FAV_ID));
            if (p == null) return;
            String name = c.getString(R.string.ipp_favorites);
            if (name.equals(p.getName())) return;
            // "❤ name" and the Russian "Любимые треки" are names a build generated, not renames.
            if (!relabel && !(HEART + name).equals(p.getName()) && !OLD_RU.equals(p.getName())) return;
            p.setName(name);
            p.setLowerName(name.toLowerCase());
            repo.updatePlaylist(p);
        } catch (Throwable t) {
        }
    }

    /**
     * The Playlists screen's long-press menu, built WHOLE before {@code show()}: stock rebuilds it
     * only after a create or rename, so editing its list worked in one state and not the other.
     * On Favorites: no delete, and no entries that start a multi-selection it cannot join.
     */
    public static void favMenu(SubMenuDialog dlg, Object adapter, Context c) {
        try {
            if (dlg == null || c == null) return;
            PlGrid.noteMenu(c);
            boolean fav = adapter instanceof RVBaseAdapter
                    && locked(((RVBaseAdapter) adapter).getSelectItem());
            List l = new ArrayList();
            // Stock's order.
            if (SharedPreferencesUtils.INSTANCE.getSortPlayListIsChange()) {
                l.add(c.getString(R.string.song_menu_sort_by));
            }
            if (!fav) {
                l.add(c.getString(R.string.music_multi_select));
                l.add(c.getString(R.string.all_select));
            }
            l.add(c.getString(R.string.new_playlist));
            if (!fav) l.add(c.getString(R.string.delete_playlist));
            l.add(c.getString(R.string.rename));
            M3u.menu(l, c);
            PlGrid.menu(l, adapter, c);
            PlGrid.viewEntry(l, c);
            dlg.setList(l);
        } catch (Throwable t) {
        }
    }

    /**
     * Favorites takes no part in a multi-selection (the user's call), like the button rows of
     * Genres and Folders. A tick has three ways in: here (top of
     * {@code addOrRemoveMultiSelectIndex}), {@link #untickFav} after {@code allSelect}, and
     * {@link #skip} in the wheel handlers.
     */
    public static boolean tickBlocked(Object adapter, int position) {
        try {
            if (!(adapter instanceof RVBaseAdapter) || position < 0) return false;
            return locked(((RVBaseAdapter) adapter).getItemByPosition(position));
        } catch (Throwable t) {
            return false;
        }
    }

    /** End of the clockwise handler; pushes DOWN, as {@code Mark.skip}: Favorites is the first row. */
    public static void skip(Object adapter, boolean multi) {
        if (!multi || !(adapter instanceof RVBaseAdapter)) return;
        try {
            RVBaseAdapter a = (RVBaseAdapter) adapter;
            int pos = a.getSelectPosition();
            if (!locked(a.getItemByPosition(pos))) return;
            moveTo(a, pos, below(a, pos));
        } catch (Throwable t) {
        }
    }

    /** End of the anticlockwise handler: on over Favorites, round to the end when the list loops. */
    public static void skipBack(Object adapter, boolean multi) {
        if (!multi || !(adapter instanceof RVBaseAdapter)) return;
        try {
            RVBaseAdapter a = (RVBaseAdapter) adapter;
            int pos = a.getSelectPosition();
            if (!locked(a.getItemByPosition(pos))) return;
            int to = pos - 1;
            while (to >= 0 && locked(a.getItemByPosition(to))) to--;
            if (to < 0 && Loop.wrap()) {
                to = a.getItemCount() - 1;
                while (to > pos && locked(a.getItemByPosition(to))) to--;
                if (to <= pos) to = -1;
            }
            moveTo(a, pos, to >= 0 ? to : below(a, pos));
        } catch (Throwable t) {
        }
    }

    private static int below(RVBaseAdapter a, int pos) {
        int n = a.getItemCount();
        int to = pos + 1;
        while (to < n && locked(a.getItemByPosition(to))) to++;
        return to < n ? to : -1;
    }

    /** Through {@code Wheel}, which must know the cursor left the row it last painted. */
    private static void moveTo(RVBaseAdapter a, int pos, int to) {
        if (to < 0) return;
        a.setSelectPosition(to, true);       // sets the field only
        if (!Wheel.refollow(a, to)) {
            a.notifyItemChanged(pos);
            a.notifyItemChanged(to);
        }
    }

    /**
     * Top of {@code deletePlaylist}: {@code removeMultiSelectItems} drops every ticked row from the
     * screen whatever the repository refused, so Favorites must not be ticked by then.
     */
    public static void untickFav(Object adapter) {
        try {
            if (!(adapter instanceof RVBaseAdapter)) return;
            RVBaseAdapter a = (RVBaseAdapter) adapter;
            List sel = a.getMultiSelectIndexes();
            if (sel == null || sel.isEmpty()) return;
            boolean dropped = false;
            for (int i = sel.size() - 1; i >= 0; i--) {
                Object o = sel.get(i);
                if (!(o instanceof Integer)) continue;
                if (!locked(a.getItemByPosition(((Integer) o).intValue()))) continue;
                sel.remove(i);
                dropped = true;
            }
            if (dropped) a.notifyDataSetChanged();
        } catch (Throwable t) {
        }
    }

    // A playlist's songs in the order ADDED (songCatPlaylist.date). Not a new SongSortType — every
    // `when` over it has a $WhenMappings array that would throw — so it rides FileName_A_To_Z and
    // re-orders the result. 0 off, 1 oldest first, 2 newest; persisted, CLEARED by any stock pick.
    // `pending` tells a reopen (keepAdded) from a stock pick and from ours.
    private static final String ADDED_KEY = "pl_added";
    private static final int KEEP = -1;

    private static int added = -1;          // -1 = not read yet
    private static int pending;

    private static int mode() {
        if (added < 0) {
            Context c = Y1Application.Companion.getAppContext();
            added = (c == null) ? 0 : Prefs.getInt(c, ADDED_KEY, 0);
        }
        return added;
    }

    /** Not a name order, so the alphabetical jump stays off whatever the stock field says. */
    public static boolean byAddedOn() {
        return mode() != 0;
    }

    /** Top of {@code getSongListBySort$default}: a restore, not a pick. */
    public static void keepAdded() {
        pending = KEEP;
    }

    /** Top of {@code getSongListBySort}. */
    public static void notePlaylistSort() {
        int p = pending;
        pending = 0;
        if (p == KEEP) { mode(); return; }
        added = p;
        Context c = Y1Application.Companion.getAppContext();
        if (c != null) Prefs.setInt(c, ADDED_KEY, p);
    }

    public static void addedSortDialog(Activity a, SubMenuDialog parent) {
        try {
            if (!(a instanceof PlayListActivity)) return;
            List l = new ArrayList();
            l.add(a.getString(R.string.ipp_sort_date_asc));
            l.add(a.getString(R.string.ipp_sort_date_desc));
            // The 4th argument is the dialog THEME, not a flag: 0 is the platform's theme.
            new SubMenuDialog(a, l, new AddedPick((PlayListActivity) a, parent), R.style.Dialog_Common).show();
        } catch (Throwable t) {
        }
    }

    public static final class AddedPick implements SubMenuDialog.Callback {
        private final PlayListActivity activity;
        private final SubMenuDialog parent;

        AddedPick(PlayListActivity activity, SubMenuDialog parent) {
            this.activity = activity;
            this.parent = parent;
        }

        public boolean select(int index, SubmenuAdapter.Item item) {
            String s = (item == null) ? null : item.getString();
            pending = activity.getString(R.string.ipp_sort_date_desc).equals(s) ? 2 : 1;
            // The carrier sort.
            activity.getSongListBySort(Y1Repository.SongSortType.FileName_A_To_Z);
            if (parent != null) parent.dismiss();   // the pick closes both levels, as stock's
            return true;
        }
    }

    private static final String SQL_ADDED =
            "select songId from songCatPlaylist where playlistId = ? order by date";

    /** The single exit of {@code getSongsByPlaylistSortByType}; untouched unless the mode is on. */
    public static List byAdded(RoomDatabase db, UUID playlistId, List songs) {
        if (mode() == 0 || db == null || playlistId == null || songs == null || songs.size() < 2) {
            return songs;
        }
        try {
            HashMap order = new HashMap();
            Cursor c = db.query(SQL_ADDED, new Object[] { UUIDUtil.convertUUIDToByte(playlistId) });
            try {
                int i = 0;
                while (c.moveToNext()) {
                    String id = c.isNull(0) ? null : c.getString(0);
                    if (id != null && !order.containsKey(id)) order.put(id, Integer.valueOf(i++));
                }
            } finally {
                c.close();
            }
            if (order.isEmpty()) return songs;
            ArrayList out = new ArrayList(songs);
            Collections.sort(out, new AddedCmp(order, added == 2));
            return out;
        } catch (Throwable t) {
            return songs;
        }
    }

    private static final class AddedCmp implements Comparator {
        private final HashMap order;
        private final boolean desc;

        AddedCmp(HashMap order, boolean desc) {
            this.order = order;
            this.desc = desc;
        }

        private int rank(Object o) {
            if (!(o instanceof Song)) return -1;
            Object r = order.get(((Song) o).getSongId());
            return (r instanceof Integer) ? ((Integer) r).intValue() : -1;
        }

        public int compare(Object a, Object b) {
            int ra = rank(a), rb = rank(b);
            // Unknown to the join table: last either way.
            if (ra < 0 || rb < 0) return (ra < 0 && rb < 0) ? 0 : (ra < 0 ? 1 : -1);
            return desc ? (rb - ra) : (ra - rb);
        }
    }

    // The same for a VIDEO playlist: playlist_video has no date and order_index is always 0, but
    // INSERT OR IGNORE appends, so rowid is the order filled. The mode rides on the video sort,
    // SHARED by every video screen; stock picks clear it in setVideoSort, ours arms `vKeep`.
    private static final String VADDED_KEY = "vpl_added";

    private static int vAdded = -1;         // -1 = not read yet
    private static boolean vKeep;

    private static int vMode() {
        if (vAdded < 0) {
            Context c = Y1Application.Companion.getAppContext();
            vAdded = (c == null) ? 0 : Prefs.getInt(c, VADDED_KEY, 0);
        }
        return vAdded;
    }

    private static void setVMode(int v) {
        if (vAdded == v) return;
        vAdded = v;
        Context c = Y1Application.Companion.getAppContext();
        if (c != null) Prefs.setInt(c, VADDED_KEY, v);
    }

    /** Top of {@code setVideoSort}. */
    public static void noteVideoSort() {
        if (vKeep) {
            vKeep = false;
            return;
        }
        setVMode(0);
    }

    public static void videoAddedDialog(Activity a) {
        try {
            if (a == null) return;
            List l = new ArrayList();
            l.add(a.getString(R.string.ipp_sort_date_asc));
            l.add(a.getString(R.string.ipp_sort_date_desc));
            new SubMenuDialog(a, l, new VideoAddedPick(a), R.style.Dialog_Common).show();
        } catch (Throwable t) {
        }
    }

    public static final class VideoAddedPick implements SubMenuDialog.Callback {
        private final Activity a;

        VideoAddedPick(Activity a) { this.a = a; }

        public boolean select(int index, SubmenuAdapter.Item item) {
            try {
                String s = item == null ? null : item.getString();
                setVMode(a.getString(R.string.ipp_sort_date_desc).equals(s) ? 2 : 1);
                // Carrier None keeps the DAO order for byAddedVideo; not a pick, hence vKeep.
                vKeep = true;
                SharedPreferencesUtils.INSTANCE.setVideoSort(
                        Y1Repository.SortVideoType.None.getType());
                relistVideos(a);
            } catch (Throwable t) {
            }
            return true;
        }
    }

    /** Reflection: {@code getVideoBySort()} is private and its accessor synthetic. */
    private static void relistVideos(Activity a) {
        try {
            if (!(a instanceof VideoListActivity)) return;
            java.lang.reflect.Method m = a.getClass().getDeclaredMethod("getVideoBySort");
            m.setAccessible(true);
            m.invoke(a);
        } catch (Throwable t) {
        }
    }

    private static final String SQL_VADDED =
            "select pv.video_id from playlist_video pv join video_playlist vp"
            + " on vp.playlist_id = pv.playlist_id where vp.playlist_name = ? order by pv.rowid";

    /**
     * The single exit of {@code getVideoToVideoPlayListNameBySort}; the name is saved to a spare
     * register at its top, since every branch reuses the parameter.
     */
    public static List byAddedVideo(RoomDatabase db, String playlistName, List videos) {
        if (vMode() == 0 || db == null || playlistName == null || videos == null
                || videos.size() < 2) {
            return videos;
        }
        try {
            HashMap order = new HashMap();
            Cursor c = db.query(SQL_VADDED, new Object[] { playlistName });
            try {
                int i = 0;
                while (c.moveToNext()) {
                    if (c.isNull(0)) continue;
                    Long id = Long.valueOf(c.getLong(0));
                    if (!order.containsKey(id)) order.put(id, Integer.valueOf(i++));
                }
            } finally {
                c.close();
            }
            if (order.isEmpty()) return videos;
            ArrayList out = new ArrayList(videos);
            Collections.sort(out, new VideoAddedCmp(order, vAdded == 2));
            return out;
        } catch (Throwable t) {
            return videos;
        }
    }

    private static final class VideoAddedCmp implements Comparator {
        private final HashMap order;
        private final boolean desc;

        VideoAddedCmp(HashMap order, boolean desc) {
            this.order = order;
            this.desc = desc;
        }

        private int rank(Object o) {
            if (!(o instanceof VideoInfo)) return -1;
            Object r = order.get(Long.valueOf(((VideoInfo) o).getVideo_id()));
            return (r instanceof Integer) ? ((Integer) r).intValue() : -1;
        }

        public int compare(Object a, Object b) {
            int ra = rank(a), rb = rank(b);
            if (ra < 0 || rb < 0) return (ra < 0 && rb < 0) ? 0 : (ra < 0 ? 1 : -1);
            return desc ? (rb - ra) : (ra - rb);
        }
    }

    /**
     * "Add to <playlist>" inside a playlist: stock's {@code select()} there knows only its own
     * strings. Claims only entries carrying a {@link Playlist}. The ticked songs or the focused
     * row, selection cleared after; the toast goes through {@code showToast} for {@link #addMsg}.
     */
    public static boolean addFromMenu(MyBaseAdapter adapter, SubmenuAdapter.Item item) {
        try {
            if (item == null) return false;
            Playlist p = item.getPlaylist();
            if (p == null) return false;
            if (adapter == null) return true;
            ArrayList songs = new ArrayList();
            List sel = adapter.getSelectedIndexList();
            if (sel != null && !sel.isEmpty()) {
                for (int i = 0; i < sel.size(); i++) {
                    Object o = adapter.getItem(((Integer) sel.get(i)).intValue());
                    if (o instanceof Song) songs.add(o);
                }
                sel.clear();
                adapter.notifyDataSetChanged();
            } else {
                Object o = adapter.getItem(adapter.getPosition());
                if (o instanceof Song) songs.add(o);
            }
            if (songs.isEmpty()) return true;
            Y1Application.Companion.getY1Repository().addToPlayList(songs, p.getPlaylistId());
            Context c = adapter.getContext();
            if (c instanceof BaseActivity) {
                ((BaseActivity) c).showToast(c.getString(R.string.added_successfully));
            }
        } catch (Throwable t) {
        }
        return true;
    }

    /**
     * Stock says "Added successfully" even when every song was already there. Noted in the add
     * funnel, where the actually NEW rows have just been counted.
     */
    private static boolean nothingNew;

    public static void noteAdded(List songs, List fresh) {
        nothingNew = fresh != null && fresh.isEmpty() && songs != null && !songs.isEmpty();
    }

    /** Top of {@code BaseActivity.showToast}: that exact message only; the note is consumed. */
    public static String addMsg(Context c, String msg) {
        try {
            if (!nothingNew || c == null || msg == null) return msg;
            if (!msg.equals(c.getString(R.string.added_successfully))) return msg;
            nothingNew = false;
            return c.getString(R.string.ipp_already_added);
        } catch (Throwable t) {
            return msg;
        }
    }
}
