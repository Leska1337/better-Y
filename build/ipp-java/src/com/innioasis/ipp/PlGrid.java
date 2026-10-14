package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.SystemClock;
import android.graphics.Color;
import android.graphics.PorterDuff;
import android.graphics.drawable.BitmapDrawable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.cardview.widget.CardView;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.room.RoomDatabase;
import androidx.room.util.UUIDUtil;

import com.innioasis.music.PlayListActivity;
import com.innioasis.music.adapter.SongListAdapter;
import com.innioasis.music.adapter.SubmenuAdapter;
import com.innioasis.music.adapter.rv.RVBaseAdapter;
import com.innioasis.music.util.SubMenuDialog;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Playlist;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.database.Y1Repository;
import com.innioasis.y1.theme.ThemeManager;

import java.io.File;
import java.io.FileOutputStream;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.UUID;

/**
 * The Playlists screen as a grid of covers — the theme gallery's tile, three to a row — when its
 * "View" entry says Grid. Stock's adapter and wheel stay. A cover is a JPEG on the card,
 * {@code better-Y/playlists/<id>.jpg}; without one a playlist takes its FIRST song's cover once,
 * in the background (Favorites keeps the heart). {@code <id>.none} records "the placeholder", or a
 * reset would be undone at the next draw; songs going into an EMPTY playlist clear it.
 */
public final class PlGrid {

    private PlGrid() { }

    public static final String KEY = "playlists_view";
    private static final int GRID = 1;

    /** The stored cover's side: above the tile (~117 px here) with room for a bigger screen. */
    private static final int SIDE = 200;
    private static final int QUALITY = 85;              // libjpeg scale, as the thumbnails

    private static final int MENU_BG = 0xFF8C94B2;      // bg_submenu, the menu without a theme
    /** The edge round a tile's picture, cover or placeholder alike: 20% (the user's number). */
    private static final int EDGE_ALPHA = 0x33000000;

    private static final String SQL_FIRST =
            "select songId from songCatPlaylist where playlistId = ? order by date limit 1";
    private static final String SQL_COUNT =
            "select count(*) from songCatPlaylist where playlistId = ?";

    /** List (0, as stock draws it) or Grid — picked with "View" in the screen's own menu. */
    public static boolean on() {
        Context c = Y1Application.Companion.getAppContext();
        return c != null && Prefs.getInt(c, KEY, 0) == GRID;
    }

    /** "View" leads the Playlists screen's menu. */
    public static void viewEntry(List l, Context c) {
        l.add(0, c.getString(R.string.ipp_pl_view));
    }

    /** List / Grid, over the menu; the pick closes both. */
    private static void viewDialog(Activity a) {
        List l = new ArrayList();
        l.add(a.getString(R.string.ipp_pl_list));
        l.add(a.getString(R.string.ipp_pl_grid));
        // the 4th argument is the dialog THEME, not a flag (see Playlists.addedSortDialog)
        new SubMenuDialog(a, l, new ViewPick(a), R.style.Dialog_Common).show();
    }

    static final class ViewPick implements SubMenuDialog.Callback {
        private final Activity a;

        ViewPick(Activity a) { this.a = a; }

        public boolean select(int index, SubmenuAdapter.Item item) {
            String s = item == null ? null : item.getString();
            setView(a, a.getString(R.string.ipp_pl_grid).equals(s));
            return true;
        }
    }

    /**
     * The screen changes in place. The pool is emptied — {@link #layout} is asked only for NEW
     * holders — and the grid's padding is set before the adapter returns ({@code Theme.tileGrid}).
     */
    private static void setView(Activity a, boolean grid) {
        try {
            if (grid == on()) return;
            Prefs.setInt(a, KEY, grid ? GRID : 0);
            View v = a.findViewById(R.id.playlist);
            if (!(v instanceof RecyclerView)) return;
            RecyclerView rv = (RecyclerView) v;
            RVBaseAdapter ad = adapter(a);
            if (ad == null) return;
            rv.setAdapter(null);
            rv.getRecycledViewPool().clear();
            if (grid) {
                rv.setLayoutManager(new GridLayoutManager(a, 3));
                Theme.tileGrid(rv);
                new Thread(new Sweep()).start();
            } else {
                rv.setLayoutManager(new androidx.recyclerview.widget.LinearLayoutManager(a));
                rv.setPadding(rv.getPaddingLeft(), 0, rv.getPaddingRight(), rv.getPaddingBottom());
            }
            lastMulti = false;
            rv.setAdapter(ad);
            int pos = ad.getSelectPosition();
            if (pos >= 0 && pos < ad.getItemCount()) rv.scrollToPosition(pos);
        } catch (Throwable t) {
        }
    }

    /** {@code PlaylistsActivity.initView}, after the adapter is set and before the list is filled. */
    public static void setup(RecyclerView rv) {
        if (rv == null || !on()) return;
        try {
            rv.setLayoutManager(new GridLayoutManager(rv.getContext(), 3));
            Theme.tileGrid(rv);
            new Thread(new Sweep()).start();
        } catch (Throwable t) {
        }
    }

    /** {@code MyAdapter.onCreateViewHolder}: asked of the list, not the setting, so they never mix. */
    public static int layout(ViewGroup parent, int stock) {
        if (parent instanceof RecyclerView
                && ((RecyclerView) parent).getLayoutManager() instanceof GridLayoutManager) {
            return R.layout.item_theme;
        }
        return stock;
    }

    /**
     * Top of {@code MyViewHolder.bind}. True when the row is a tile and has been painted, so the
     * stock bind — which knows only the list row — must not run.
     */
    public static boolean bind(View row, Object item, boolean sel, boolean ticked) {
        if (row == null) return false;
        View f = row.findViewById(R.id.img_sel);
        if (!(f instanceof CardView)) {
            // a list row: the stock bind paints it and loses the item on the way; listRow reads it
            // back from here at the end
            row.setTag(R.id.ipp_pl_cover, item);
            return false;
        }
        long t0 = SystemClock.uptimeMillis();
        decodeMs = -1;
        try {
            CardView frame = (CardView) f;
            CardView card = (CardView) row.findViewById(R.id.card);
            ImageView img = (ImageView) row.findViewById(R.id.img);
            TextView text = (TextView) row.findViewById(R.id.text);
            ImageView tick = (ImageView) row.findViewById(R.id.img_m_select);
            Playlist p = item instanceof Playlist ? (Playlist) item : null;

            text.setText(p == null ? "" : p.getName());
            Theme.tileName(text);
            Theme.tileFit(frame, card, text);
            frame.setCardBackgroundColor(sel ? Theme.tileFrame() : 0);

            // the theme gallery's own marks: an empty circle on every tile while the mode is on,
            // filled on the ticked ones; Favorites takes no part in a selection (Playlists.tickBlocked)
            Context c = row.getContext();
            RVBaseAdapter ad = adapter(c);
            // The menu turns the mode OFF as it opens but acts on the ticks: the marks stay until
            // the ticks go.
            List ticks = ad == null ? null : ad.getMultiSelectIndexes();
            if (ticks == null || ticks.isEmpty()) menuMulti = false;
            boolean multi = multiMode(c) || menuMulti;
            if (multi != lastMulti) {
                // every tile once: stock rebinds only some on a mode change
                lastMulti = multi;
                if (ad != null) UI.post(new Rebind(ad));
            }
            // stock says "not ticked" for the tile under the cursor: ask the selection
            if (sel && !ticked && ad != null && ad.getMultiSelectIndexes() != null) {
                ticked = ad.getMultiSelectIndexes().contains(Integer.valueOf(ad.getSelectPosition()));
            }
            if (multi && p != null && !Playlists.locked(p)) {
                tick.setVisibility(View.VISIBLE);
                tick.setImageResource(ticked
                        ? R.drawable.icon_theme_mulselect_selected : R.drawable.icon_theme_mulselect);
            } else {
                tick.setVisibility(View.GONE);
            }
            paint(row, card, img, p, sel, text.getCurrentTextColor());
        } catch (Throwable t) {
        }
        long ms = SystemClock.uptimeMillis() - t0;
        if (ms >= TILE_SLOW_MS) {
            Diag.note("slow: playlist tile " + ms + " ms"
                    + (decodeMs >= 0 ? ", cover decoded in " + decodeMs : ""));
        }
        return true;
    }

    /** A tile is rebound on every wheel click that reaches it: a frame is ~16 ms. */
    private static final long TILE_SLOW_MS = 40L;

    /** The last {@link #bind}'s cover decode, -1 when it came from memory. */
    private static long decodeMs;

    /** {@code ring}: the caption's colour, for the card's 2px edge off the cursor. */
    private static void paint(View row, CardView card, ImageView img, Playlist p, boolean sel,
                              int ring) {
        if (img.getTag(R.id.ipp_pl_cover) == null) {
            // item_theme.xml caps the picture at 100x75 for a theme's 4:3 preview; a cover is
            // square and fills the card
            img.setTag(R.id.ipp_pl_cover, Boolean.TRUE);
            img.setAdjustViewBounds(false);
            img.setMaxWidth(Integer.MAX_VALUE);
            img.setMaxHeight(Integer.MAX_VALUE);
        }
        card.setCardBackgroundColor(((sel ? Color.BLACK : ring) & 0x00FFFFFF) | EDGE_ALPHA);
        Bitmap b = p == null ? null : cover(p.getPlaylistId());
        if (b != null) {
            img.setBackgroundColor(0);
            img.clearColorFilter();
            img.setPadding(0, 0, 0, 0);
            img.setScaleType(ImageView.ScaleType.CENTER_CROP);
            img.setImageBitmap(b);
            return;
        }
        // the placeholder's plate is the picture's own background, inside the card's edge
        boolean fav = p != null && Playlists.isFav(p);
        img.setBackgroundColor(menuBg() | 0xFF000000);
        ViewGroup.LayoutParams lp = card.getLayoutParams();
        int pad = lp == null ? 0 : lp.width / 4;
        img.setPadding(pad, pad, pad, pad);
        img.setScaleType(ImageView.ScaleType.FIT_CENTER);
        img.setImageResource(fav ? R.mipmap.ipp_heart_on : R.mipmap.ipp_show_all_songs);
        int fg = Icons.progressColor();
        img.setColorFilter(fg == 0 ? Color.WHITE : fg, PorterDuff.Mode.SRC_IN);
        if (p != null && !fav && row.getParent() instanceof RecyclerView) {
            first(p.getPlaylistId(), (RecyclerView) row.getParent());
        }
    }

    private static Bitmap heart;
    private static int heartColor;
    private static BitmapDrawable heartDrawable;

    /** End of a LIST row's bind: the heart before Favorites, in the name's colour; others lose it. */
    public static void listRow(View row) {
        try {
            if (row == null) return;
            View v = row.findViewById(R.id.tv_item);
            if (!(v instanceof TextView)) return;
            TextView tv = (TextView) v;
            // the plain left slot: clearing START on API 17 leaves the resolved left drawable
            if (!Playlists.isFav(row.getTag(R.id.ipp_pl_cover))) {
                if (tv.getCompoundDrawables()[0] != null) tv.setCompoundDrawables(null, null, null, null);
                return;
            }
            int color = tv.getCurrentTextColor();
            if (heartDrawable == null || color != heartColor) {
                if (heart == null) {
                    heart = BitmapFactory.decodeResource(tv.getResources(), R.mipmap.ipp_heart_on);
                }
                if (heart == null) return;
                BitmapDrawable d = new BitmapDrawable(tv.getResources(), heart);
                d.setColorFilter(color, PorterDuff.Mode.SRC_IN);
                heartDrawable = d;
                heartColor = color;
            }
            int side = Math.round(tv.getTextSize());
            heartDrawable.setBounds(0, 0, side, side);
            tv.setCompoundDrawablePadding(side / 4);
            if (tv.getCompoundDrawables()[0] != heartDrawable) {
                tv.setCompoundDrawables(heartDrawable, null, null, null);
            }
        } catch (Throwable t) {
        }
    }

    /** Photos does not list the covers' folder: it is ours, not pictures. */
    public static boolean hidden(File f) {
        try {
            return f != null && f.getAbsolutePath().equals(dir().getAbsolutePath());
        } catch (Throwable t) {
            return false;
        }
    }

    private static int menuBg() {
        Integer c = ThemeManager.INSTANCE.menuBGColor();
        return c == null ? MENU_BG : c.intValue();
    }

    private static boolean lastMulti;
    private static boolean menuMulti;    // the menu was opened from the multi-selection

    /** From {@code Playlists.favMenu}, before the menu drops the mode. */
    static void noteMenu(Context c) {
        menuMulti = c != null && multiMode(c);
    }
    private static final android.os.Handler UI = new android.os.Handler(android.os.Looper.getMainLooper());

    /** Posted, never run from inside a bind: RecyclerView refuses a change in mid-layout. */
    static final class Rebind implements Runnable {
        private final RVBaseAdapter a;

        Rebind(RVBaseAdapter a) { this.a = a; }

        public void run() {
            a.notifyDataSetChanged();
        }
    }

    private static Field adapterField;

    /** The screen's own adapter: behind a private Kotlin lazy, its accessor a synthetic. */
    private static RVBaseAdapter adapter(Context c) {
        try {
            if (adapterField == null) {
                Field f = c.getClass().getDeclaredField("adapter$delegate");
                f.setAccessible(true);
                adapterField = f;
            }
            Object o = adapterField.get(c);
            if (o instanceof kotlin.Lazy) o = ((kotlin.Lazy) o).getValue();
            return o instanceof RVBaseAdapter ? (RVBaseAdapter) o : null;
        } catch (Throwable t) {
            return null;
        }
    }

    private static Field multiField;

    /** The screen's own {@code isMultiSelect}: private, and its accessor is a synthetic. */
    private static boolean multiMode(Context c) {
        try {
            if (multiField == null) {
                Field f = c.getClass().getDeclaredField("isMultiSelect");
                f.setAccessible(true);
                multiField = f;
            }
            return multiField.getBoolean(c);
        } catch (Throwable t) {
            return false;
        }
    }

    static File dir() {
        return new File(Panel.card(), "playlists");
    }

    private static File jpg(UUID id) {
        return new File(dir(), id + ".jpg");
    }

    private static File none(UUID id) {
        return new File(dir(), id + ".none");
    }

    /** id -> {mtime, bitmap}: a tile is rebound on every wheel click that reaches it. */
    private static final HashMap mem = new HashMap();

    private static Bitmap cover(UUID id) {
        File f = jpg(id);
        if (!f.isFile()) return null;
        long m = f.lastModified();
        Object[] e = (Object[]) mem.get(id);
        if (e != null && ((Long) e[0]).longValue() == m) return (Bitmap) e[1];
        long t0 = SystemClock.uptimeMillis();
        Bitmap b = BitmapFactory.decodeFile(f.getPath());
        decodeMs = SystemClock.uptimeMillis() - t0;
        if (b != null) mem.put(id, new Object[] { Long.valueOf(m), b });
        return b;
    }

    public static boolean hasCover(Object o) {
        return o instanceof Playlist && jpg(((Playlist) o).getPlaylistId()).isFile();
    }

    /** Off the main thread: a picture square-cropped and written as the playlist's cover. */
    static boolean write(UUID id, Bitmap src) {
        if (id == null || src == null) return false;
        FileOutputStream out = null;
        File tmp = null;
        try {
            int side = Math.min(SIDE, Math.min(src.getWidth(), src.getHeight()));
            Bitmap sq = Cover.square(src, side);
            if (sq == null) return false;
            File d = dir();
            if (!d.isDirectory() && !d.mkdirs()) return false;
            tmp = new File(d, id + ".tmp");
            out = new FileOutputStream(tmp);
            boolean ok = sq.compress(Bitmap.CompressFormat.JPEG, QUALITY, out);
            out.close();
            out = null;
            if (sq != src) sq.recycle();         // src may be BigCover's, on screen elsewhere
            File f = jpg(id);
            if (!ok || (f.exists() && !f.delete()) || !tmp.renameTo(f)) return false;
            none(id).delete();
            return true;
        } catch (Throwable t) {
            return false;
        } finally {
            try { if (out != null) out.close(); } catch (Throwable t) { /* nothing */ }
            if (tmp != null && tmp.exists()) tmp.delete();
        }
    }

    /** "Reset cover": the placeholder, and it stays until the playlist is emptied and refilled. */
    static void reset(UUID id) {
        try {
            jpg(id).delete();
            mem.remove(id);
            File d = dir();
            if (d.isDirectory() || d.mkdirs()) none(id).createNewFile();
        } catch (Throwable t) {
        }
    }

    /** Ids a worker has been started for in this process — one try per playlist per run. */
    private static final HashSet tried = new HashSet();

    private static void first(UUID id, RecyclerView rv) {
        synchronized (tried) {
            if (tried.contains(id)) return;
            tried.add(id);
        }
        if (none(id).exists()) return;
        new Thread(new First(id, rv)).start();
    }

    static final class First implements Runnable {
        private final UUID id;
        private final WeakReference rv;

        First(UUID id, RecyclerView rv) {
            this.id = id;
            this.rv = new WeakReference(rv);
        }

        public void run() {
            try {
                String songId = firstSong(id);
                if (songId == null) return;              // empty: the first add decides
                Song s = repo().getSongBySongIdSync(songId);
                Bitmap b = s == null ? null : BigCover.track(s.getPath());
                if (b == null) {
                    File d = dir();
                    if (d.isDirectory() || d.mkdirs()) none(id).createNewFile();
                    return;
                }
                if (!write(id, b)) return;
                RecyclerView v = (RecyclerView) rv.get();
                if (v != null) v.post(new Repaint(v));
            } catch (Throwable t) {
            }
        }
    }

    static final class Repaint implements Runnable {
        private final WeakReference rv;

        Repaint(RecyclerView rv) {
            this.rv = new WeakReference(rv);
        }

        public void run() {
            RecyclerView v = (RecyclerView) rv.get();
            if (v != null && v.getAdapter() != null) v.getAdapter().notifyDataSetChanged();
        }
    }

    /**
     * {@code Likes.noteAdd}, BEFORE the rows are written: an empty playlist starts its cover over.
     * A cover set by hand stays.
     */
    public static void noteAdd(UUID id) {
        try {
            if (id == null || Playlists.isFav(id) || jpg(id).isFile()) return;
            if (count(id) != 0) return;
            none(id).delete();
            // a tile shown while the playlist was empty has had its one try this run
            synchronized (tried) {
                tried.remove(id);
            }
        } catch (Throwable t) {
        }
    }

    private static Y1Repository repo() {
        return Y1Application.Companion.getY1Repository();
    }

    private static Field dbField;

    /** The repository's own database: private, and the one place the join table can be read. */
    static RoomDatabase db() throws Exception {
        if (dbField == null) {
            Field f = Y1Repository.class.getDeclaredField("database");
            f.setAccessible(true);
            dbField = f;
        }
        return (RoomDatabase) dbField.get(repo());
    }

    private static String firstSong(UUID id) throws Exception {
        Cursor c = db().query(SQL_FIRST, new Object[] { UUIDUtil.convertUUIDToByte(id) });
        try {
            return c.moveToFirst() && !c.isNull(0) ? c.getString(0) : null;
        } finally {
            c.close();
        }
    }

    private static int count(UUID id) throws Exception {
        Cursor c = db().query(SQL_COUNT, new Object[] { UUIDUtil.convertUUIDToByte(id) });
        try {
            return c.moveToFirst() ? c.getInt(0) : 0;
        } finally {
            c.close();
        }
    }

    /** Files of playlists that are gone. Favorites is kept: hidden while likes are off, not gone. */
    static final class Sweep implements Runnable {
        public void run() {
            try {
                File[] fs = dir().listFiles();
                if (fs == null || fs.length == 0) return;
                HashSet ids = new HashSet();
                ids.add(Fav.UUID_STR);
                List all = repo().getAllPlaylistSync();
                if (all == null) return;
                for (int i = 0; i < all.size(); i++) {
                    Object o = all.get(i);
                    if (o instanceof Playlist) ids.add(String.valueOf(((Playlist) o).getPlaylistId()));
                }
                for (int i = 0; i < fs.length; i++) {
                    String n = fs[i].getName();
                    int dot = n.indexOf('.');
                    if (dot > 0 && !ids.contains(n.substring(0, dot))) fs[i].delete();
                }
            } catch (Throwable t) {
            }
        }
    }

    /** The Playlists screen's menu: "Reset cover" on a tile that has one of its own. */
    public static void menu(List l, Object adapter, Context c) {
        try {
            if (!on() || !(adapter instanceof RVBaseAdapter)) return;
            RVBaseAdapter a = (RVBaseAdapter) adapter;
            if (hasCover(a.getSelectItem())) l.add(c.getString(R.string.ipp_reset_pl_cover));
        } catch (Throwable t) {
        }
    }

    /** The screen's one ipp dispatch, in front of stock's {@code select}; M3u's too. */
    public static boolean menuPick(Activity a, Object adapter, String s) {
        if (M3u.menuPick(a, adapter, s)) return true;
        if (a != null && s != null && s.equals(a.getString(R.string.ipp_pl_view))) {
            try {
                viewDialog(a);
            } catch (Throwable t) {
            }
            return true;
        }
        try {
            if (a == null || s == null || !s.equals(a.getString(R.string.ipp_reset_pl_cover))) {
                return false;
            }
            if (!(adapter instanceof RVBaseAdapter)) return true;
            RVBaseAdapter ad = (RVBaseAdapter) adapter;
            Object o = ad.getSelectItem();
            if (!(o instanceof Playlist)) return true;
            reset(((Playlist) o).getPlaylistId());
            ad.notifyItemChanged(ad.getSelectPosition());
            Toast.makeText(a, R.string.ipp_pl_cover_reset, Toast.LENGTH_SHORT).show();
        } catch (Throwable t) {
        }
        return true;
    }

    /**
     * "Set as playlist cover" inside a playlist: the song's OWN picture, the one Now Playing shows
     * for it. Offered only in the grid — {@code Menus} takes it out of the menu otherwise.
     */
    public static boolean songPick(Activity a, String s) {
        try {
            if (!(a instanceof PlayListActivity) || s == null
                    || !s.equals(a.getString(R.string.ipp_set_pl_cover))) {
                return false;
            }
            PlayListActivity pa = (PlayListActivity) a;
            SongListAdapter ad = pa.getAdapter();
            Object o = ad == null ? null : ad.getItem(ad.getPosition());
            Playlist p = pa.getPlaylist();
            if (!(o instanceof Song) || p == null) return true;
            new Thread(new FromSong(a, p.getPlaylistId(), ((Song) o).getPath())).start();
        } catch (Throwable t) {
        }
        return true;
    }

    static final class FromSong implements Runnable {
        private final Activity a;
        private final UUID id;
        private final String path;

        FromSong(Activity a, UUID id, String path) {
            this.a = a;
            this.id = id;
            this.path = path;
        }

        public void run() {
            Bitmap b = null;
            boolean ok = false;
            try {
                b = BigCover.track(path);
                ok = write(id, b);
            } catch (Throwable t) {
            }
            if (ok) {
                a.runOnUiThread(new Say(a, R.string.ipp_pl_cover_set));
            } else if (b == null) {
                a.runOnUiThread(new Say(a, R.string.ipp_pl_cover_none));
            }
        }
    }

    static final class Say implements Runnable {
        private final Context c;
        private final int res;

        Say(Context c, int res) {
            this.c = c;
            this.res = res;
        }

        public void run() {
            Toast.makeText(c, res, Toast.LENGTH_SHORT).show();
        }
    }

    /** The third entry of the "Set as…" popup: which playlist gets this picture. */
    public static void fromPhoto(Activity a, String path) {
        try {
            if (a == null || path == null) return;
            List pls = repo().getAllPlaylistSync();
            if (pls == null || pls.isEmpty()) return;
            List names = new ArrayList();
            for (int i = 0; i < pls.size(); i++) names.add(((Playlist) pls.get(i)).getName());
            // the 4th argument is the dialog THEME (ipp-menus-playlists)
            new SubMenuDialog(a, names, new PhotoPick(a, pls, path), R.style.Dialog_Common).show();
        } catch (Throwable t) {
        }
    }

    static final class PhotoPick implements SubMenuDialog.Callback {
        private final Activity a;
        private final List pls;
        private final String path;

        PhotoPick(Activity a, List pls, String path) {
            this.a = a;
            this.pls = pls;
            this.path = path;
        }

        public boolean select(int index, SubmenuAdapter.Item item) {
            if (index >= 0 && index < pls.size()) {
                new Thread(new FromPhoto(a, ((Playlist) pls.get(index)).getPlaylistId(), path)).start();
            }
            return true;
        }
    }

    static final class FromPhoto implements Runnable {
        private final Activity a;
        private final UUID id;
        private final String path;

        FromPhoto(Activity a, UUID id, String path) {
            this.a = a;
            this.id = id;
            this.path = path;
        }

        public void run() {
            boolean ok = false;
            try {
                BitmapFactory.Options o = new BitmapFactory.Options();
                o.inJustDecodeBounds = true;
                BitmapFactory.decodeFile(path, o);
                int s = 1;
                // largest power of two that still leaves the short side at or above SIDE
                while (Math.min(o.outWidth, o.outHeight) / (s * 2) >= SIDE) s *= 2;
                o = new BitmapFactory.Options();
                o.inSampleSize = s;
                Bitmap b = BitmapFactory.decodeFile(path, o);
                ok = write(id, b);
                if (b != null) b.recycle();
            } catch (Throwable t) {
            }
            if (ok) a.runOnUiThread(new Say(a, R.string.ipp_pl_cover_set));
        }
    }
}
