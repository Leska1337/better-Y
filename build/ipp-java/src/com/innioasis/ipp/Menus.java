package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.ListView;

import androidx.recyclerview.widget.RecyclerView;

import com.blankj.utilcode.util.ActivityUtils;
import com.innioasis.music.PlayListActivity;
import com.innioasis.music.adapter.MyBaseAdapter;
import com.innioasis.music.adapter.SubmenuAdapter;
import com.innioasis.music.adapter.rv.RVBaseAdapter;
import com.innioasis.music.util.SubMenuDialog;
import com.innioasis.y1.R;
import com.innioasis.y1.database.Playlist;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.WeakHashMap;

/**
 * The long-press menu of a screen with SEVERAL rows ticked shows only what several rows can mean —
 * delete, remove, add to the queue, add to a playlist, select all. Sorting a list, opening one
 * song's album or its artist, renaming a playlist: none of that is an action on a selection, and
 * offering it there either does nothing or quietly acts on one arbitrary row of the tick list.
 *
 * <p><b>One hook for every screen.</b> Every menu in this app is a {@link SubMenuDialog}, and every
 * one of them is shown through {@code onStart} — so the filter sits there instead of in the eight
 * places menus are built. That also covers the ipp menus that are rebuilt per press
 * ({@code Albums.songMenu}, {@code Find.menu}, {@code Genres.menu}, {@code Playlists.favMenu}) with
 * nothing added to them.
 *
 * <p><b>The signal is MORE THAN ONE ticked row</b>, and it has to be that rather than "any tick at
 * all": a plain long press ticks the row under the cursor to highlight it, and the screens do not
 * agree on when — {@code AlbumsActivity} ticks it BEFORE {@code show()}, everything else after. So
 * one tick is ambiguous (a long press, or a selection of one), while two are not. With a single
 * ticked row the whole menu is shown, which is right either way: every entry in it means something
 * for one row.
 *
 * <p><b>The index a callback sees is the one the UNFILTERED menu would have given</b>
 * ({@link #index}, injected in {@code shortUp}). Most screens dispatch on the item's string, but
 * {@code FilesActivity} and {@code GenresActivity} dispatch by INDEX ("anything past the fixed
 * items is a playlist"), and dropping an entry above those would silently change what every entry
 * below it does.
 *
 * <p>Raw types and named classes only — see CLAUDE.md on the bundled d8.
 */
public final class Menus {

    private Menus() {
    }

    /**
     * What survives a multi-selection. A whitelist rather than a list of things to hide: a menu
     * entry that is not here is either a sort, a single-row action or a screen command, and any of
     * those is a mistake to offer for a selection. Playlist rows ("Add to Playlist N") are kept by
     * {@link #keeps} without being named here — how many there are is up to the user.
     */
    private static final int[] MULTI = {
            R.string.all_select,
            R.string.music_delete_file,
            R.string.audiobook_delete,
            R.string.album_menu_delete,
            R.string.artist_menu_delete,
            R.string.ipp_delete_genre,
            R.string.remove_it,
            R.string.delete_playlist,
            R.string.video_remove,
            R.string.ipp_queue_add,
    };

    /** Per dialog, because they are lazy singletons reused on every press. */
    private static final WeakHashMap SNAPS = new WeakHashMap();

    private static final class Snap {
        ArrayList full;      // the menu as the screen last built it
        ArrayList shown;     // what was left on screen, to tell "untouched" from "rebuilt"
        int[] map;           // shown index -> its index in full; null when nothing was dropped
    }

    /**
     * Injected at the top of {@code SubMenuDialog.onStart}, i.e. once per {@code show()} — the one
     * point every menu of every screen goes through, and the only one that runs again when a lazily
     * built dialog is shown a second time.
     *
     * <p>The unfiltered menu is remembered and put back before each pass, because the entries we
     * drop must come back next time. Whether the screen has rebuilt the menu in the meantime is
     * answered by comparing what is there now against what we left ({@code shown}) — by reference,
     * so a rebuilt list is never mistaken for the one we filtered.
     */
    public static void onShow(SubMenuDialog d) {
        // A menu standing over a list stops that list's "the wheel has fallen silent" clock: the
        // user is reading it, and the row it was raised on must still be there when they choose.
        // Released from SubMenuDialog.onStop. Before the guards below, so a menu this method has
        // nothing to filter still holds the clock. See Follow.hold.
        Follow.hold(true);
        try {
            if (d == null) return;
            View v = d.findViewById(R.id.submenu);
            if (!(v instanceof ListView)) return;
            Object ad = ((ListView) v).getAdapter();
            if (!(ad instanceof MyBaseAdapter)) return;
            MyBaseAdapter a = (MyBaseAdapter) ad;
            List items = a.getItemList();
            if (items == null || items.isEmpty()) return;

            Snap s = (Snap) SNAPS.get(d);
            if (s != null && same(items, s.shown)) {
                items.clear();
                items.addAll(s.full);              // untouched since we filtered it: restore
            } else {
                s = new Snap();
                s.full = new ArrayList(items);     // the screen built this one
                SNAPS.put(d, s);
            }
            s.map = null;

            Activity host = hostOf(d);
            boolean multi = host != null && ticks(host) > 1;
            UUID self = selfPlaylist(host);
            if (multi || self != null) {
                ArrayList keep = new ArrayList();
                ArrayList idx = new ArrayList();
                for (int i = 0; i < items.size(); i++) {
                    Object o = items.get(i);
                    if (keeps(host, o, multi, self)) {
                        keep.add(o);
                        idx.add(Integer.valueOf(i));
                    }
                }
                // Never leave an empty box on screen: a menu with nothing multi-capable in it is a
                // menu this rule has nothing to say about (a sort submenu raised over a selection),
                // and it is shown whole.
                if (!keep.isEmpty() && keep.size() < items.size()) {
                    items.clear();
                    items.addAll(keep);
                    s.map = new int[idx.size()];
                    for (int i = 0; i < idx.size(); i++) {
                        s.map[i] = ((Integer) idx.get(i)).intValue();
                    }
                }
            }
            s.shown = new ArrayList(items);
            a.notifyDataSetChanged();
        } catch (Throwable t) {
            // a menu that could not be filtered is still a usable menu
        }
    }

    /**
     * The index the callback is handed: where this entry stands in the menu the screen BUILT, not
     * where it stands after filtering. Injected in {@code shortUp}, after the item itself has been
     * taken (that one is looked up by the shown index).
     */
    public static int index(SubMenuDialog d, int shown) {
        try {
            Snap s = (Snap) SNAPS.get(d);
            if (s == null || s.map == null || shown < 0 || shown >= s.map.length) return shown;
            return s.map[shown];
        } catch (Throwable t) {
            return shown;
        }
    }

    /**
     * Whether this entry belongs in the menu as the screen stands. Two rules:
     * <ul>
     *   <li>"Add to <em>this</em> playlist" is not offered while standing INSIDE that playlist —
     *       every song there is in it by definition, so the entry can only ever answer "already in
     *       the playlist";</li>
     *   <li>with several rows ticked, only what a selection can mean (see {@link #MULTI}).</li>
     * </ul>
     */
    private static boolean keeps(Activity host, Object o, boolean multi, UUID self) {
        if (!(o instanceof SubmenuAdapter.Item)) return true;
        SubmenuAdapter.Item it = (SubmenuAdapter.Item) o;
        Playlist pl = it.getPlaylist();
        if (pl != null) {
            return self == null || !self.equals(pl.getPlaylistId());
        }
        if (!multi) return true;
        String s = it.getString();
        if (s == null) return true;
        for (int i = 0; i < MULTI.length; i++) {
            if (s.equals(host.getString(MULTI[i]))) return true;
        }
        return false;
    }

    /**
     * The playlist the screen IS, when it is a playlist at all. Wrapped because the field is a
     * Kotlin {@code lateinit} — asking before {@code initView} has filled it throws rather than
     * answering null, and this runs on whatever dialog any screen happens to raise.
     */
    private static UUID selfPlaylist(Activity a) {
        try {
            if (!(a instanceof PlayListActivity)) return null;
            Playlist p = ((PlayListActivity) a).getPlaylist();
            return (p == null) ? null : p.getPlaylistId();
        } catch (Throwable t) {
            return null;
        }
    }

    /** Same entries, in the same order, by reference — "has the screen rebuilt this menu?" */
    private static boolean same(List now, List then) {
        if (then == null || now.size() != then.size()) return false;
        for (int i = 0; i < now.size(); i++) {
            if (now.get(i) != then.get(i)) return false;
        }
        return true;
    }

    /**
     * How many rows are ticked on the screen behind the menu. The list is found by walking the
     * Activity's own view tree: a screen may show several lists (Albums shows albums and songs
     * through one ListView, Genres four levels), and which of them is on screen is exactly what
     * the view tree already knows.
     */
    private static int ticks(Activity a) {
        try {
            if (a == null || a.getWindow() == null) return 0;
            return ticksIn(a.getWindow().getDecorView());
        } catch (Throwable t) {
            return 0;
        }
    }

    private static int ticksIn(View v) {
        if (v == null) return 0;
        if (v instanceof AbsListView) {
            Object ad = ((AbsListView) v).getAdapter();
            if (ad instanceof MyBaseAdapter) {
                List s = ((MyBaseAdapter) ad).getSelectedIndexList();
                return (s == null) ? 0 : s.size();
            }
            return 0;
        }
        if (v instanceof RecyclerView) {
            Object ad = ((RecyclerView) v).getAdapter();
            if (ad instanceof RVBaseAdapter) {
                List s = ((RVBaseAdapter) ad).getMultiSelectIndexes();
                return (s == null) ? 0 : s.size();
            }
            if (ad instanceof com.innioasis.y1.activity.video.adapter.RVBaseAdapter) {
                List s = ((com.innioasis.y1.activity.video.adapter.RVBaseAdapter) ad)
                        .getMultiSelectIndexes();
                return (s == null) ? 0 : s.size();
            }
            return 0;
        }
        if (v instanceof ViewGroup) {
            ViewGroup g = (ViewGroup) v;
            int best = 0;
            for (int i = 0; i < g.getChildCount(); i++) {
                int n = ticksIn(g.getChildAt(i));
                if (n > best) best = n;
            }
            return best;
        }
        return 0;
    }

    /**
     * The screen the menu belongs to. {@code Dialog.getContext()} is a {@code ContextThemeWrapper}
     * around the Activity (the dialog carries a theme), so it is unwrapped; the Activity on top is
     * the fallback, and it is the right one — a dialog does not pause the screen under it.
     */
    private static Activity hostOf(SubMenuDialog d) {
        try {
            Activity own = d.getOwnerActivity();
            if (own != null) return own;
            Context c = d.getContext();
            while (c instanceof ContextWrapper) {
                if (c instanceof Activity) return (Activity) c;
                c = ((ContextWrapper) c).getBaseContext();
            }
        } catch (Throwable t) {
            // fall through to the top Activity
        }
        try {
            return ActivityUtils.getTopActivity();
        } catch (Throwable t) {
            return null;
        }
    }
}
