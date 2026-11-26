package com.innioasis.ipp;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Paint;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowManager;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;

import com.blankj.utilcode.util.ActivityUtils;
import com.innioasis.music.PlayListActivity;
import com.innioasis.music.adapter.MyBaseAdapter;
import com.innioasis.music.adapter.SubmenuAdapter;
import com.innioasis.music.adapter.rv.RVBaseAdapter;
import com.innioasis.music.util.SubMenuDialog;
import com.innioasis.y1.R;
import com.innioasis.y1.base.BaseBindingAdapter;
import com.innioasis.y1.database.Playlist;
import com.innioasis.y1.activity.video.VideoListActivity;
import com.innioasis.y1.activity.video.SubMenuVideoDialog;
import com.innioasis.y1.activity.video.SubmenuVideoAdapter;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.WeakHashMap;

/**
 * Filters long-press menus: with SEVERAL rows ticked, only what a selection can mean. One hook per
 * dialog class ({@link SubMenuDialog}, {@code SubMenuVideoDialog}) covers every menu.
 *
 * The signal is MORE THAN ONE tick: a plain long press ticks the row under the cursor, before or
 * after {@code show()} depending on the screen, so one tick is ambiguous. Callbacks get the index
 * of the UNFILTERED menu ({@link #index}): some screens dispatch by index, and a dropped entry
 * would silently change what every entry below it does.
 */
public final class Menus {

    private Menus() {
    }

    /**
     * A whitelist: anything else is a sort, a single-row action or a screen command. Playlist rows
     * are kept by {@link #keeps}.
     */
    private static final int[] MULTI = {
            R.string.all_select,
            // The switch OUT of the mode the selection is in.
            R.string.music_multi_select,
            R.string.music_delete_file,
            R.string.audiobook_delete,
            R.string.album_menu_delete,
            R.string.artist_menu_delete,
            R.string.ipp_delete_genre,
            R.string.remove_it,
            R.string.delete_playlist,
            R.string.video_remove,
            R.string.ipp_queue_add,
            R.string.ipp_m3u_export,
            R.string.ipp_reset_pl_cover,
    };

    /** Per dialog: they are lazy singletons reused on every press. */
    private static final WeakHashMap SNAPS = new WeakHashMap();

    private static final class Snap {
        ArrayList full;      // the menu as the screen last built it
        ArrayList shown;     // what was left on screen, to tell "untouched" from "rebuilt"
        int[] map;           // shown index -> its index in full; null when nothing was dropped
        Object group;        // the "Add to playlist" entry standing for every playlist entry
        ArrayList entries;   // those entries, in the screen's order
        int[] entryIndex;    // each entry's index in full
    }

    /** The playlist chooser opened from a menu: not filtered, it is a list of names. */
    private static final WeakHashMap CHOOSERS = new WeakHashMap();

    /**
     * Top of {@code SubMenuDialog.onStart}, once per {@code show()}. The full menu is put back
     * before each pass; "rebuilt by the screen meanwhile" is told by reference against what we left.
     */
    public static void onShow(SubMenuDialog d) {
        // The menu stops the list's idle clock until SubMenuDialog.onStop — even when there is
        // nothing to filter.
        Follow.hold(true);
        filter(d);
        fit(d);
        Bar.dialog(d);
    }

    /**
     * Top of {@code SubMenuVideoDialog.onStart}, before stock puts the cursor on row 0. No
     * {@code Follow.hold}: no Videos list registers with {@link Follow}.
     */
    public static void onShowVideo(SubMenuVideoDialog d) {
        filter(d);
        fit(d);
        Bar.dialog(d);
    }

    /**
     * The menu widens to its longest entry, never narrower than stock's {@code submenu_width} and
     * never wider than the screen; it grows leftwards (the window is pinned top-right). Measured
     * at the first pre-draw with a bound row's own paint, i.e. the theme's font, and that frame
     * is cancelled so the narrow window is never drawn.
     */
    private static void fit(Dialog d) {
        try {
            Window w = d.getWindow();
            View v = d.findViewById(R.id.submenu);
            if (w == null || !(v instanceof ViewGroup) || !Lv.is(v)) return;
            int base = (int) d.getContext().getResources().getDimension(R.dimen.submenu_width);
            WindowManager.LayoutParams p = w.getAttributes();
            if (p.width != base) {
                p.width = base;
                w.setAttributes(p);
            }
            v.getViewTreeObserver().addOnPreDrawListener(new Fit(w, (ViewGroup) v, base));
        } catch (Throwable t) {
        }
    }

    private static final class Fit implements ViewTreeObserver.OnPreDrawListener {
        private final Window w;
        private final ViewGroup lv;
        private final int base;
        private int passes;

        Fit(Window w, ViewGroup lv, int base) {
            this.w = w;
            this.lv = lv;
            this.base = base;
        }

        @Override
        public boolean onPreDraw() {
            try {
                TextView tv = lv.getChildCount() == 0 ? null : firstText(lv.getChildAt(0));
                if (tv == null || tv.getWidth() == 0) {
                    if (++passes < 5) return true;
                    lv.getViewTreeObserver().removeOnPreDrawListener(this);
                    return true;
                }
                lv.getViewTreeObserver().removeOnPreDrawListener(this);
                MyBaseAdapter ad = Lv.model(lv);
                if (ad == null) return true;
                List items = ad.getItemList();
                if (items == null) return true;
                Paint paint = tv.getPaint();
                float widest = 0;
                for (int i = 0; i < items.size(); i++) {
                    String s = label(items.get(i));
                    if (s != null) widest = Math.max(widest, paint.measureText(s));
                }
                int room = tv.getWidth() - tv.getTotalPaddingLeft() - tv.getTotalPaddingRight();
                if (widest <= room) return true;
                int screen = lv.getResources().getDisplayMetrics().widthPixels;
                int want = Math.min(screen, base + (int) Math.ceil(widest - room) + 1);
                WindowManager.LayoutParams p = w.getAttributes();
                if (p.width == want) return true;
                p.width = want;
                w.setAttributes(p);
                return false;
            } catch (Throwable t) {
                return true;
            }
        }
    }

    private static TextView firstText(View v) {
        if (v instanceof TextView) return (TextView) v;
        if (!(v instanceof ViewGroup)) return null;
        ViewGroup g = (ViewGroup) v;
        for (int i = 0; i < g.getChildCount(); i++) {
            TextView t = firstText(g.getChildAt(i));
            if (t != null) return t;
        }
        return null;
    }

    /**
     * An entry under the playlists, which addPlaylistsToOptions always appends last. Right after
     * {@code show()}: the shown list is collapsed by then and its first frame not yet drawn.
     */
    public static void append(Dialog d, String s) {
        try {
            View v = d.findViewById(R.id.submenu);
            MyBaseAdapter a = v == null ? null : Lv.model(v);
            if (a == null) return;
            a.getItemList().add(new SubmenuAdapter.Item(s, null));
            a.notifyDataSetChanged();
        } catch (Throwable t) {
        }
    }

    private static void filter(Dialog d) {
        try {
            if (d == null || CHOOSERS.containsKey(d)) return;
            View v = d.findViewById(R.id.submenu);
            MyBaseAdapter a = v == null ? null : Lv.model(v);
            if (a == null) return;
            List items = a.getItemList();
            if (items == null || items.isEmpty()) return;

            Snap s = (Snap) SNAPS.get(d);
            if (s != null && same(items, s.shown)) {
                items.clear();
                items.addAll(s.full);
            } else {
                s = new Snap();
                s.full = new ArrayList(items);
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
                // Nothing kept means a menu this rule is not about (a sort submenu): shown whole.
                if (!keep.isEmpty() && keep.size() < items.size()) {
                    items.clear();
                    items.addAll(keep);
                    s.map = new int[idx.size()];
                    for (int i = 0; i < idx.size(); i++) {
                        s.map[i] = ((Integer) idx.get(i)).intValue();
                    }
                }
            }
            collapse(host, items, s);
            s.shown = new ArrayList(items);
            a.notifyDataSetChanged();
        } catch (Throwable t) {
        }
    }

    /** In {@code shortUp}, after the item was taken by the shown index. */
    public static int index(SubMenuDialog d, int shown) {
        return mapped(d, shown);
    }

    /** The same in {@code SubMenuVideoDialog.shortUp}. */
    public static int videoIndex(SubMenuVideoDialog d, int shown) {
        return mapped(d, shown);
    }

    private static int mapped(Dialog d, int shown) {
        try {
            Snap s = (Snap) SNAPS.get(d);
            if (s == null || s.map == null || shown < 0 || shown >= s.map.length) return shown;
            return s.map[shown];
        } catch (Throwable t) {
            return shown;
        }
    }

    /**
     * Of the "Add to <playlist>" entries left on screen only Favorites' stays; under it one "Add to
     * playlist" stands for the rest, where the first of them stood. Its chooser hands the screen's
     * callback the real entry and the index it would have had, so no dispatcher can tell.
     */
    private static void collapse(Activity host, List items, Snap s) {
        s.group = null;
        s.entries = null;
        s.entryIndex = null;
        if (host == null) return;
        ArrayList entries = new ArrayList();
        ArrayList entryIdx = new ArrayList();
        ArrayList rest = new ArrayList();
        ArrayList restIdx = new ArrayList();
        Object favEntry = null;
        int favIdx = -1;
        int at = -1;
        for (int i = 0; i < items.size(); i++) {
            Object o = items.get(i);
            int full = s.map == null ? i : s.map[i];
            if (isPlaylistEntry(o)) {
                if (at < 0) at = rest.size();
                if (isFavEntry(o)) {
                    favEntry = o;
                    favIdx = full;
                } else {
                    entries.add(o);
                    entryIdx.add(Integer.valueOf(full));
                }
            } else {
                rest.add(o);
                restIdx.add(Integer.valueOf(full));
            }
        }
        if (at < 0) return;
        boolean video = (favEntry != null ? favEntry : entries.get(0)) instanceof SubmenuVideoAdapter.Item;
        if (!entries.isEmpty()) {
            Object g = entry(video, host.getString(R.string.ipp_add_to_playlist));
            rest.add(at, g);
            restIdx.add(at, Integer.valueOf(-1));
            s.group = g;
            s.entries = entries;
            s.entryIndex = new int[entryIdx.size()];
            for (int i = 0; i < entryIdx.size(); i++) s.entryIndex[i] = ((Integer) entryIdx.get(i)).intValue();
        }
        if (favEntry != null) {
            rest.add(at, favEntry);
            restIdx.add(at, Integer.valueOf(favIdx));
        }
        items.clear();
        items.addAll(rest);
        s.map = new int[restIdx.size()];
        for (int i = 0; i < restIdx.size(); i++) s.map[i] = ((Integer) restIdx.get(i)).intValue();
    }

    /** No playlist: it must not count as a playlist entry itself. */
    private static Object entry(boolean video, String label) {
        return video ? (Object) new SubmenuVideoAdapter.Item(label, null)
                : (Object) new SubmenuAdapter.Item(label, null);
    }

    /** In {@code shortUp}, before the callback: true when the pick was "Add to playlist". */
    public static boolean group(SubMenuDialog d, int shown, SubMenuDialog.Callback cb) {
        return ours(d, shown, cb);
    }

    /** The same in {@code SubMenuVideoDialog.shortUp}. */
    public static boolean groupVideo(SubMenuVideoDialog d, int shown, SubMenuVideoDialog.Callback cb) {
        return ours(d, shown, cb);
    }

    private static boolean ours(Dialog d, int shown, Object cb) {
        try {
            Snap s = (Snap) SNAPS.get(d);
            if (s == null || s.shown == null || shown < 0 || shown >= s.shown.size()) return false;
            Object o = s.shown.get(shown);
            if (o == null || o != s.group) return false;
            Activity host = hostOf(d);
            if (host == null) return true;
            Integer[] order = new Integer[s.entries.size()];
            for (int i = 0; i < order.length; i++) order[i] = Integer.valueOf(i);
            java.util.Arrays.sort(order, new ByName(s.entries));
            List names = new ArrayList();
            int[] pick = new int[order.length];
            for (int i = 0; i < order.length; i++) {
                pick[i] = order[i].intValue();
                names.add(playlistName(s.entries.get(pick[i])));
            }
            // the 4th argument is the dialog THEME (ipp-menus-playlists)
            SubMenuDialog c = new SubMenuDialog(host, names,
                    new Chosen(d, cb, s.entries, s.entryIndex, pick), R.style.Dialog_Common);
            CHOOSERS.put(c, Boolean.TRUE);
            c.show();
        } catch (Throwable t) {
        }
        return true;
    }

    /** What a pick of the entry itself would have done; the menu closes when the callback says. */
    private static void dispatch(Dialog parent, Object cb, Object e, int full) {
        try {
            boolean close = true;
            if (cb instanceof SubMenuDialog.Callback && e instanceof SubmenuAdapter.Item) {
                close = ((SubMenuDialog.Callback) cb).select(full, (SubmenuAdapter.Item) e);
            } else if (cb instanceof SubMenuVideoDialog.Callback && e instanceof SubmenuVideoAdapter.Item) {
                close = ((SubMenuVideoDialog.Callback) cb).select(full, (SubmenuVideoAdapter.Item) e);
            }
            if (close && parent.isShowing()) parent.dismiss();
        } catch (Throwable t) {
        }
    }

    private static String playlistName(Object o) {
        try {
            if (o instanceof SubmenuAdapter.Item) {
                Playlist p = ((SubmenuAdapter.Item) o).getPlaylist();
                if (p != null && p.getName() != null) return p.getName();
            }
            if (o instanceof SubmenuVideoAdapter.Item) {
                com.innioasis.y1.database.video.VideoPlaylist p = ((SubmenuVideoAdapter.Item) o).getPlaylist();
                if (p != null && p.getPlaylistName() != null) return p.getPlaylistName();
            }
        } catch (Throwable t) {
        }
        String s = label(o);
        return s == null ? "" : s;
    }

    static final class ByName implements java.util.Comparator {
        private final List entries;

        ByName(List entries) {
            this.entries = entries;
        }

        public int compare(Object a, Object b) {
            Object x = entries.get(((Integer) a).intValue());
            Object y = entries.get(((Integer) b).intValue());
            return playlistName(x).compareToIgnoreCase(playlistName(y));
        }
    }

    private static boolean isFavEntry(Object o) {
        return o instanceof SubmenuAdapter.Item && Playlists.isFav(((SubmenuAdapter.Item) o).getPlaylist());
    }

    /** The chooser's pick, handed on by {@link #dispatch}. */
    static final class Chosen implements SubMenuDialog.Callback {
        private final Dialog parent;
        private final Object cb;
        private final List entries;
        private final int[] full;
        private final int[] pick;

        Chosen(Dialog parent, Object cb, List entries, int[] full, int[] pick) {
            this.parent = parent;
            this.cb = cb;
            this.entries = entries;
            this.full = full;
            this.pick = pick;
        }

        public boolean select(int index, SubmenuAdapter.Item item) {
            if (index >= 0 && index < pick.length) {
                int k = pick[index];
                dispatch(parent, cb, entries.get(k), full[k]);
            }
            return true;
        }
    }

    /**
     * No "Add to this playlist" inside that playlist; "Set as playlist cover" only while Playlists
     * is a grid; with several ticks only {@link #MULTI}.
     */
    private static boolean keeps(Activity host, Object o, boolean multi, UUID self) {
        if (isPlaylistEntry(o)) {
            UUID id = playlistId(o);
            return self == null || id == null || !self.equals(id);
        }
        String s = label(o);
        if (self != null && s != null && !PlGrid.on()
                && s.equals(host.getString(R.string.ipp_set_pl_cover))) {
            return false;
        }
        if (!multi) return true;
        if (s == null) return true;
        for (int i = 0; i < MULTI.length; i++) {
            if (s.equals(host.getString(MULTI[i]))) return true;
        }
        return false;
    }

    // The two item classes share the getters but no ancestor.

    private static String label(Object o) {
        if (o instanceof SubmenuAdapter.Item) return ((SubmenuAdapter.Item) o).getString();
        if (o instanceof SubmenuVideoAdapter.Item) return ((SubmenuVideoAdapter.Item) o).getString();
        return null;
    }

    /** "Add to <playlist>": always kept. */
    private static boolean isPlaylistEntry(Object o) {
        if (o instanceof SubmenuAdapter.Item) return ((SubmenuAdapter.Item) o).getPlaylist() != null;
        if (o instanceof SubmenuVideoAdapter.Item) {
            return ((SubmenuVideoAdapter.Item) o).getPlaylist() != null;
        }
        return false;
    }

    /** Music playlists only: the rule is about {@code PlayListActivity}. */
    private static UUID playlistId(Object o) {
        if (!(o instanceof SubmenuAdapter.Item)) return null;
        Playlist pl = ((SubmenuAdapter.Item) o).getPlaylist();
        return (pl == null) ? null : pl.getPlaylistId();
    }

    /** Wrapped: the field is a {@code lateinit}, and throws before {@code initView}. */
    private static UUID selfPlaylist(Activity a) {
        try {
            if (!(a instanceof PlayListActivity)) return null;
            Playlist p = ((PlayListActivity) a).getPlaylist();
            return (p == null) ? null : p.getPlaylistId();
        } catch (Throwable t) {
            return null;
        }
    }

    /** By reference. */
    private static boolean same(List now, List then) {
        if (then == null || now.size() != then.size()) return false;
        for (int i = 0; i < now.size(); i++) {
            if (now.get(i) != then.get(i)) return false;
        }
        return true;
    }

    /** Found by walking the view tree, which knows which of a screen's lists is shown. */
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
        if (v instanceof RecyclerView) {
            Object ad = ((RecyclerView) v).getAdapter();
            if (ad instanceof SongRows) ad = ((SongRows) ad).model();
            if (ad instanceof MyBaseAdapter) {
                List s = ((MyBaseAdapter) ad).getSelectedIndexList();
                return (s == null) ? 0 : s.size();
            }
            if (ad instanceof RVBaseAdapter) {
                List s = ((RVBaseAdapter) ad).getMultiSelectIndexes();
                return (s == null) ? 0 : s.size();
            }
            if (ad instanceof com.innioasis.y1.activity.video.adapter.RVBaseAdapter) {
                List s = ((com.innioasis.y1.activity.video.adapter.RVBaseAdapter) ad)
                        .getMultiSelectIndexes();
                return (s == null) ? 0 : s.size();
            }
            // Videos keeps its ticks on each row's BrowseItem, not in the adapter.
            if (ad instanceof BaseBindingAdapter) {
                return browseTicks(((BaseBindingAdapter) ad).getData());
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

    /** Other {@code BaseBindingAdapter} screens hold no BrowseItems and answer 0. */
    private static int browseTicks(List data) {
        if (data == null) return 0;
        int n = 0;
        for (int i = 0; i < data.size(); i++) {
            Object o = data.get(i);
            if (o instanceof VideoListActivity.BrowseItem
                    && ((VideoListActivity.BrowseItem) o).isMultiSelect()) {
                n++;
            }
        }
        return n;
    }

    /**
     * The Photos icon strip ({@code PhotosDialog}, from {@code PhotosActivity.longTop}): a folder
     * cannot be a wallpaper, so the last entry goes. ONLY the last may be dropped — both
     * dispatchers work by index, the dialog even compares against a hardcoded 4.
     */
    public static List photos(List subs, List data, int mark) {
        try {
            if (subs == null || subs.size() < 2) return subs;
            if (data == null || mark < 0 || mark >= data.size()) return subs;
            Object row = data.get(mark);
            if (!(row instanceof com.innioasis.y1.activity.PhotosActivity.Item)) return subs;
            if (!((com.innioasis.y1.activity.PhotosActivity.Item) row).isDirectory()) return subs;
            return new ArrayList(subs.subList(0, subs.size() - 1));
        } catch (Throwable t) {
            return subs;
        }
    }

    /** Stock's strip: delete, multi-select, select all, rename, set as. */
    private static final int[] PHOTO_FULL = {0, 3, 4};

    /** Shown strips standing for the stock one, and each one's stock indexes. */
    private static final WeakHashMap PHOTO_MAPS = new WeakHashMap();

    /**
     * An open picture: multi-select and select all are dropped (stock greys them and skips them).
     * The dialog then runs with isFull off, and {@link #photoIndex} gives its dispatch the stock index.
     */
    public static List photosFull(List subs, boolean full) {
        try {
            if (!full || subs == null || subs.size() != 5) return subs;
            ArrayList out = new ArrayList();
            for (int i = 0; i < PHOTO_FULL.length; i++) out.add(subs.get(PHOTO_FULL[i]));
            PHOTO_MAPS.put(out, PHOTO_FULL);
            return out;
        } catch (Throwable t) {
            return subs;
        }
    }

    /** {@code PhotosDialog.onKeyUp}: the shown entry as the stock index its callback expects. */
    public static int photoIndex(List subs, int shown) {
        int[] m = subs == null ? null : (int[]) PHOTO_MAPS.get(subs);
        return m == null || shown < 0 || shown >= m.length ? shown : m[shown];
    }

    /**
     * The dialog's context is a theme wrapper around the Activity; the top Activity is the
     * fallback, and right — a dialog does not pause the screen under it.
     */
    private static Activity hostOf(Dialog d) {
        try {
            Activity own = d.getOwnerActivity();
            if (own != null) return own;
            Context c = d.getContext();
            while (c instanceof ContextWrapper) {
                if (c instanceof Activity) return (Activity) c;
                c = ((ContextWrapper) c).getBaseContext();
            }
        } catch (Throwable t) {
        }
        try {
            return ActivityUtils.getTopActivity();
        } catch (Throwable t) {
            return null;
        }
    }
}
