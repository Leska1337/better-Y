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
import com.innioasis.y1.utils.SharedPreferencesUtils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

/**
 * Where the favourites playlist ({@link Fav}) sits in a playlist list, and what may be done to it.
 *
 * It is not an ordinary playlist — it is generated, always present, and it is the heart on the
 * Now-Playing row seen from the other side — so three things are true of it that are not true of
 * the others, and all three are decided here because both list sources in {@code Y1Repository}
 * ({@code getAllPlaylistSync} and {@code getPlayListBySort}) already run through {@link #first}:
 * <ul>
 *   <li>It is pinned to the top, whatever the chosen sort.</li>
 *   <li>It is <b>hidden entirely while "Likes system" is off</b> — the setting hides the heart, and
 *       a playlist the user cannot fill from the player has no business being in the list either.
 *       Nothing is deleted: the playlist, its songs and the {@code like:} preferences all stay, so
 *       turning the setting back on brings everything back exactly as it was.</li>
 *   <li>It cannot be deleted ({@link #trimMenu} takes the entry out of the long-press menu, and
 *       {@code Y1Repository.deletePlaylist} refuses it outright for the multi-select path).</li>
 * </ul>
 *
 * Raw (non-generic) types throughout: the bundled d8 crashes dexing generic Signature attrs.
 */
public final class Playlists {

    /** Must match {@code Fav.favUuid()} (hand-written smali, where it is private). */
    private static final String FAV_ID = "1e5f0a00-0000-4000-8000-000000000001";

    /**
     * The favourites playlist cannot be deleted by hand (#231). Ships as {@code true}; a test build
     * that has to delete it — to check that switching "Likes system" on creates it again, which
     * otherwise needs a full reflash — sets this to false and nothing else.
     */
    private static final boolean PROTECT = true;

    /**
     * True for the favourites playlist while it is protected, i.e. for the three guards that keep
     * it: the menu entry, the multi-select untick and the delete loop in {@code PlaylistsActivity}.
     *
     * <p>Kept apart from {@link #isFav} because that one also answers "pin this row to the top" and
     * "hide it while likes are off", and those hold whether the delete guard is on or not.
     */
    public static boolean locked(Object o) {
        return PROTECT && isFav(o);
    }

    /** True for the favourites playlist. Accepts a {@code Playlist} or a {@code UUID}. */
    public static boolean isFav(Object o) {
        try {
            if (o instanceof Playlist) return FAV_ID.equals(String.valueOf(((Playlist) o).getPlaylistId()));
            if (o instanceof UUID) return FAV_ID.equals(o.toString());
            return false;
        } catch (Throwable t) {
            return false;
        }
    }

    /** The "Likes system" setting — the same one that shows or hides the heart in {@code Deck}. */
    public static boolean enabled() {
        Context c = Y1Application.Companion.getAppContext();
        return Prefs.on(c, "likes");
    }

    /**
     * Same list with the favourites playlist first — or without it at all while likes are off.
     * Returns the input untouched when there is nothing to do, so the common case allocates
     * nothing.
     */
    public static List first(List playlists) {
        try {
            if (playlists == null || playlists.isEmpty()) return playlists;
            int at = -1;
            for (int i = 0; i < playlists.size(); i++) {
                if (isFav(playlists.get(i))) { at = i; break; }
            }
            if (at < 0) return playlists;                 // absent
            if (!enabled()) {
                ArrayList out = new ArrayList(playlists); // hidden, not deleted
                out.remove(at);
                return out;
            }
            if (at == 0) return playlists;                // already first
            ArrayList out = new ArrayList(playlists);
            out.add(0, out.remove(at));
            return out;
        } catch (Throwable t) {
            return playlists;                             // never let ordering break the list
        }
    }

    // ---- the playlist's name follows the interface language ------------------------------------
    //
    // Two rules that have to coexist: the user may rename it like any other playlist, and switching
    // the interface language must relabel it (it is a generated playlist, so it belongs to the UI,
    // not to the user's data). So the rename is undone by a LANGUAGE CHANGE and by nothing else —
    // which is why the trigger is the stored language index, not the name.
    //
    // Stock renamed it from Fav.ensure instead, i.e. on every "add to favourites", so a manual name
    // never survived the next heart press; and the Settings language screen never renamed it at all
    // (only the first-boot one did), so the label lagged a language behind. Both are fixed by
    // asking here, from MainActivity.initView, which is where the app lands after a language change
    // and — unlike the language screen itself — with the new locale genuinely in effect: the switch
    // goes through the system configuration, so a getString taken straight after it still answers
    // in the old language.

    private static final String LANG_KEY = "fav_lang";

    public static void syncName(Context c) {
        try {
            if (c == null) return;
            // #231 — the playlist EXISTS by default, whatever the "Likes system" setting says; the
            // setting only decides whether it is shown (see first() above). It used to come into
            // being when the system was switched on, so an install that never touched the toggle
            // had no Favorites playlist at all — and turning the system on afterwards was the only
            // way to get one. ensure() is a no-op once it is there, and this runs from
            // MainActivity.initView, i.e. once per app start.
            Fav.ensure(c);

            int lang = SharedPreferencesUtils.INSTANCE.getLanguage();
            if (Prefs.getInt(c, LANG_KEY, -1) == lang) return;
            Prefs.setInt(c, LANG_KEY, lang);

            Y1Repository repo = Y1Application.Companion.getY1Repository();
            if (repo == null) return;
            Playlist p = repo.getPlaylistById(UUID.fromString(FAV_ID));
            if (p == null) return;                       // created on the first heart, in this locale
            String name = c.getString(R.string.ipp_favorites);
            if (name.equals(p.getName())) return;
            p.setName(name);
            p.setLowerName(name.toLowerCase());
            repo.updatePlaylist(p);
        } catch (Throwable t) {
            // a playlist named in the previous language is not worth a crash on startup
        }
    }

    /**
     * The Playlists screen's long-press menu, with "Delete playlist" left out on the favourites
     * row. Called from {@code longConfirm} immediately before {@code show()}.
     *
     * It builds the whole list rather than editing one, because stock only rebuilds the menu
     * {@code if (canChangePlayList)} — a flag that starts false and is only ever set by creating or
     * renaming a playlist. Until then the dialog keeps the list its lazy constructor made, so
     * trimming the list stock had just built worked in one state and did nothing in the other; that
     * is why the entry came back after a rename flipped the flag. Reached on every long press, the
     * result is the same menu whichever path stock took.
     *
     * The delete loop is guarded as well ({@code PlaylistsActivity$deletePlaylist$…$confirm$1}) —
     * multi-select deletes every ticked row and the menu cannot know about those. This is so the
     * user is not offered an action that would silently do nothing.
     */
    public static void favMenu(SubMenuDialog dlg, Object adapter, Context c) {
        try {
            if (dlg == null || c == null) return;
            boolean fav = adapter instanceof RVBaseAdapter
                    && locked(((RVBaseAdapter) adapter).getSelectItem());
            List l = new ArrayList();
            // the order stock builds, minus the one entry
            if (SharedPreferencesUtils.INSTANCE.getSortPlayListIsChange()) {
                l.add(c.getString(R.string.song_menu_sort_by));
            }
            // The favourites row takes no part in a multi-selection (see tickBlocked), so the two
            // entries that start one are not offered on it either — a mode this row cannot enter.
            if (!fav) {
                l.add(c.getString(R.string.music_multi_select));
                l.add(c.getString(R.string.all_select));
            }
            l.add(c.getString(R.string.new_playlist));
            if (!fav) l.add(c.getString(R.string.delete_playlist));
            l.add(c.getString(R.string.rename));
            dlg.setList(l);
        } catch (Throwable t) {
            // leave whatever menu the dialog already has
        }
    }

    /**
     * The favourites row takes no part in a multi-selection at all (v0.32.6, the user's call).
     *
     * <p>It could be ticked and swept up by "Select all" before, and the tick was only taken back
     * at the moment a delete ran ({@link #untickFav}) — so the row highlighted itself, joined a
     * count of "3 selected" and then quietly was not one of them. A row that cannot be acted on
     * has no business being selectable, which is the rule the button rows of Genres and Folders
     * already follow ({@code Mark.blocked}, skill {@code ipp-genres}).
     *
     * <p>Three places say it, because a tick has three ways in: this one is the tick itself
     * (injected at the top of {@code RVBaseAdapter.addOrRemoveMultiSelectIndex}, which also covers
     * the one the long press puts on the row it was raised on), {@link #untickFav} at the end of
     * {@code allSelect}, and {@link #skip} in the wheel handlers. The menu on that row loses
     * "MultiSelect" and "Select all" with them ({@link #favMenu}) — offering a mode the row cannot
     * enter is the same defect one step earlier.
     */
    public static boolean tickBlocked(Object adapter, int position) {
        try {
            if (!(adapter instanceof RVBaseAdapter) || position < 0) return false;
            return locked(((RVBaseAdapter) adapter).getItemByPosition(position));
        } catch (Throwable t) {
            return false;
        }
    }

    /**
     * The cursor does not stop on the favourites row while multi-select is on — there is nothing to
     * tick there, so standing on it is a dead step. Called at the end of both wheel handlers of
     * {@code PlaylistsActivity}, which is where its own {@code isMultiSelect} can be read.
     *
     * <p>Always pushes DOWNWARDS, the same rule {@code Mark.skip} follows for the button rows: the
     * favourites row is pinned to the top of the list ({@link #first}), so it is the first row
     * whichever way the wheel came from.
     */
    public static void skip(Object adapter, boolean multi) {
        if (!multi || !(adapter instanceof RVBaseAdapter)) return;
        try {
            RVBaseAdapter a = (RVBaseAdapter) adapter;
            int pos = a.getSelectPosition();
            if (!locked(a.getItemByPosition(pos))) return;
            int n = a.getItemCount();
            int to = pos + 1;
            while (to < n && locked(a.getItemByPosition(to))) to++;
            if (to >= n) return;                 // nothing below it: leave the cursor where it is
            a.setSelectPosition(to, true);       // sets the field only
            a.notifyItemChanged(pos);
            a.notifyItemChanged(to);
        } catch (Throwable t) {
            // a cursor on a row it cannot tick is not worth a crash
        }
    }

    /**
     * Take the favourites row out of the multi-select before a delete runs. Called at the top of
     * {@code PlaylistsActivity.deletePlaylist}, i.e. before the confirm dialog is even raised.
     *
     * The repository call was already guarded, but that only stopped HALF of a delete: the UI
     * half is {@code RVBaseAdapter.removeMultiSelectItems}, which drops every ticked row from the
     * adapter whatever the loop decided — so Favorites disappeared off the screen and stayed gone
     * until the list was rebuilt from the DB. "Select all" made that the normal case. Unticking it
     * here fixes both halves at once, and it is the main thread, so the row can be repainted.
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
            // the guard in the delete loop still stands
        }
    }

    // ---- a playlist's songs in the order they were ADDED ---------------------------------------
    //
    // The join table (songCatPlaylist) carries the moment each song was put into the playlist, and
    // nothing in stock ever reads it: its seven sorts are all properties of the file. Adding an
    // eighth SongSortType is not an option — every `when` over that enum compiles to a
    // $WhenMappings array sized values().length and would throw on the new ordinal — so this rides
    // an ordinary sort (FileName_A_To_Z) and re-orders the result the repository hands back.
    //
    // Which order that is lives in one field: 0 = off (the stock sort stands), 1 = oldest first,
    // 2 = newest first. It is persisted, so it survives leaving the screen, and it is CLEARED by
    // any stock sort pick. Telling the two apart is what `pending` does: reopening the screen goes
    // through getSongListBySort$default (which restores the stored sort and calls keepAdded), a
    // stock pick calls getSongListBySort directly, and our own pick arms `pending` first.
    private static final String ADDED_KEY = "pl_added";
    private static final int KEEP = -1;

    private static int added = -1;          // -1 = not read from the preferences yet
    private static int pending;

    private static int mode() {
        if (added < 0) {
            Context c = Y1Application.Companion.getAppContext();
            added = (c == null) ? 0 : Prefs.getInt(c, ADDED_KEY, 0);
        }
        return added;
    }

    /**
     * True while the playlist is showing its songs in the order they were ADDED, which is not a
     * name order — so the alphabetical jump has to stay off there whatever the stock sort field
     * still says (the mode rides on {@code FileName_A_To_Z}, see {@link #byAdded}).
     */
    public static boolean byAddedOn() {
        return mode() != 0;
    }

    /** Top of {@code getSongListBySort$default}: this call restores the stored sort, it is not a pick. */
    public static void keepAdded() {
        pending = KEEP;
    }

    /** Top of {@code getSongListBySort}: consume the pick, if there was one. */
    public static void notePlaylistSort() {
        int p = pending;
        pending = 0;
        if (p == KEEP) { mode(); return; }
        added = p;
        Context c = Y1Application.Companion.getAppContext();
        if (c != null) Prefs.setInt(c, ADDED_KEY, p);
    }

    /** The long-press menu entry: pick a direction, then reload the list. */
    public static void addedSortDialog(Activity a, SubMenuDialog parent) {
        try {
            if (!(a instanceof PlayListActivity)) return;
            List l = new ArrayList();
            l.add(a.getString(R.string.ipp_sort_date_asc));
            l.add(a.getString(R.string.ipp_sort_date_desc));
            // The 4th argument is the DIALOG THEME, not a flag -- stock reaches this constructor
            // through the defaults-synthetic, which substitutes Dialog_Common. Passing 0 gives the
            // platform's own dialog theme, which is what sized the window for four rows.
            new SubMenuDialog(a, l, new AddedPick((PlayListActivity) a, parent), R.style.Dialog_Common).show();
        } catch (Throwable t) {
            // no dialog is better than a crash out of a menu
        }
    }

    /** Named, never anonymous: d8 8.2.2-dev crashes dexing anonymous classes here. */
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
            // The carrier sort: case 1 of the screen's own `when`, which shows plain file names.
            activity.getSongListBySort(Y1Repository.SongSortType.FileName_A_To_Z);
            if (parent != null) parent.dismiss();   // stock's pattern: the pick closes both levels
            return true;
        }
    }

    private static final String SQL_ADDED =
            "select songId from songCatPlaylist where playlistId = ? order by date";

    /**
     * Injected at the single exit of {@code Y1Repository.getSongsByPlaylistSortByType}. Returns the
     * list untouched unless the date-added order is on, so the ordinary sorts cost one int compare.
     * The database is read through the repository's own field (the call site is inside that class);
     * one query, on the IO dispatcher the caller already runs on.
     */
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
            return songs;   // an unsortable list is still a usable list
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
            // a song the join table does not know about goes last whichever way round we are
            if (ra < 0 || rb < 0) return (ra < 0 && rb < 0) ? 0 : (ra < 0 ? 1 : -1);
            return desc ? (rb - ra) : (ra - rb);
        }
    }

    // ------------------------------------------------- "Add to <playlist>" inside a playlist

    /**
     * The playlists were appended to the playlist screen's own long-press menu, and stock's
     * {@code select()} there dispatches on strings it knows — so an entry naming a playlist fell
     * through and did nothing. This answers it, and only ever claims an entry that really carries
     * a {@link Playlist}, so it can sit in front of the stock dispatch without hiding anything.
     *
     * <p>The ticked songs, or the row under the cursor when nothing is ticked — the same rule
     * {@code Queue.addFromAdapter} follows, selection cleared afterwards for the same reason (the
     * rows stay highlighted otherwise and the next pick re-adds them).
     *
     * <p>The toast is the stock one, and it goes through {@code BaseActivity.showToast} on purpose:
     * that is where {@link #addMsg} turns it into "already in the playlist" when the songs were all
     * there already — which, adding from one playlist to another, is a thing that happens often.
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
            // an add that failed is not worth taking the screen down for
        }
        return true;
    }

    // ------------------------------------------------- "it is already in that playlist"

    /**
     * Stock says "Added successfully" whatever happened, and {@code Y1Repository.addToPlayList}
     * quietly skips every song the playlist already holds — so adding a track twice looked like it
     * had worked and nothing changed.
     *
     * <p>Noted at the one place that knows: the funnel where the rows that are actually NEW have
     * just been counted (every add in the app ends up there, the single-song overload and
     * {@code addToPlayListByFile} included).
     */
    private static boolean nothingNew;

    public static void noteAdded(List songs, List fresh) {
        nothingNew = fresh != null && fresh.isEmpty() && songs != null && !songs.isEmpty();
    }

    /**
     * Injected at the top of {@code BaseActivity.showToast} — one hook instead of the nineteen
     * places that raise this toast. Nothing but that exact message is ever touched, and the note
     * is consumed, so a later toast of any kind reads as it was written.
     */
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
