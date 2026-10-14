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
import java.util.HashSet;
import java.util.Hashtable;
import java.util.LinkedList;
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
                prepare(rv);
            } else {
                rv.setLayoutManager(new androidx.recyclerview.widget.LinearLayoutManager(a));
                Wheel.glides(rv, false);
                Object m = movers.remove(rv);
                if (m != null) rv.removeItemDecoration((RecyclerView.ItemDecoration) m);
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
            prepare(rv);
        } catch (Throwable t) {
        }
    }

    /** Entering the grid: files of deleted playlists go, every cover is decoded ahead. */
    private static void prepare(RecyclerView rv) {
        Wheel.glides(rv, true);
        if (movers.get(rv) == null) {
            Mover m = new Mover();
            movers.put(rv, m);
            rv.addItemDecoration(m);
        }
        Decoder.attach(rv);
        new Thread(new Prepare(rv), "ipp-pl-prepare").start();
        rv.postDelayed(new Warm(rv), WARM_MS);
    }

    /** After the grid's first frames, while it stands: first-time tiles are no work of a glide. */
    private static final long WARM_MS = 400L;
    /** Rows the glide round the list's end brings in at once, and some. */
    private static final int WARM_TILES = 12;

    /**
     * A collection while the grid stands, so the glide round the list's end does not run beside
     * one: on the cursor resting at either end with loop scrolling on, and once the pool is warm.
     */
    static final class Tidy implements Runnable {
        private static final long REST_MS = 300L;
        private static final Tidy T = new Tidy();
        private static WeakReference rv = new WeakReference(null);

        static void at(RecyclerView r) {
            rv = new WeakReference(r);
            UI.removeCallbacks(T);
            UI.postDelayed(T, REST_MS);
        }

        /** Garbage made since the last collection, under which one is not worth its work. */
        private static final long WORTH = 1024L * 1024L;
        private static long seen = -1;

        private static void collect() {
            if (seen < 0) android.os.Debug.startAllocCounting();
            long a = android.os.Debug.getGlobalAllocSize();
            if (a < seen) seen = a;                  // the counters were started over
            if (seen >= 0 && a - seen < WORTH) return;
            seen = a;
            System.gc();
        }

        static void now() {
            collect();
        }

        public void run() {
            try {
                RecyclerView r = (RecyclerView) rv.get();
                if (r == null || !(r.getAdapter() instanceof RVBaseAdapter) || !Loop.on()) return;
                int sel = ((RVBaseAdapter) r.getAdapter()).getSelectPosition();
                int n = r.getAdapter().getItemCount();
                if ((sel == 0 || sel == n - 1) && Wheel.Glider.left(r) == 0) collect();
            } catch (Throwable t) {
            }
        }
    }

    /**
     * Tiles made ahead into the pool, one per message so no frame carries more than one inflate:
     * the first glide round the list's end otherwise inflated every row it brought in.
     */
    static final class Warm implements Runnable {
        private final WeakReference rv;
        Warm(RecyclerView rv) { this.rv = new WeakReference(rv); }
        public void run() {
            try {
                RecyclerView r = (RecyclerView) rv.get();
                if (r == null || r.getWindowToken() == null || !(r.getLayoutManager() instanceof GridLayoutManager)) {
                    return;
                }
                RecyclerView.Adapter a = r.getAdapter();
                if (a == null || a.getItemCount() <= r.getChildCount()) return;
                int type = a.getItemViewType(0);
                RecyclerView.RecycledViewPool pool = r.getRecycledViewPool();
                pool.setMaxRecycledViews(type, WARM_TILES);
                if (pool.getRecycledViewCount(type) >= WARM_TILES) {
                    Tidy.now();
                    return;
                }
                pool.putRecycledView(a.createViewHolder(r, type));
                UI.post(this);
            } catch (Throwable t) {
            }
        }
    }

    private static final java.util.WeakHashMap movers = new java.util.WeakHashMap();

    /**
     * The cursor's frame: a ring from the frame's box in to the picture's, the card's dark edge
     * included, so it stays a frame in motion too. Along a row it travels over the tiles, every
     * frame covering a share of the way left (Wheel.Glider's law). To another row, the next or
     * round the list's end, it fades out where it stands and in on its tile as the rows stop,
     * and takes no new target meanwhile, so a fast wheel's targets switching sides cannot hold it
     * in the middle; further off it jumps. Kept in the list's content coordinates, so it rides
     * along while rows scroll.
     */
    static final class Mover extends RecyclerView.ItemDecoration {
        private static final float RATE = 22f;
        private static final float VMIN = 700f;
        private static final float VMAX = 6000f;

        private final android.graphics.Paint paint =
                new android.graphics.Paint(android.graphics.Paint.ANTI_ALIAS_FLAG);
        private final android.graphics.RectF draw = new android.graphics.RectF();
        private final android.graphics.Path ring = new android.graphics.Path();
        private float l, t, w, h, edge, rim, radius, inner;
        /** The tile a move to another row ends on. */
        private float lx, ly;
        private boolean has, leg;
        private long last;
        private int off, pitch, span = 1, legPos;
        /** On the way to another row: the frame's top on screen as it fades, and its opacity. */
        private float sy, fa = 1f;
        /** The rows have stopped and the frame is on its tile, fading in. */
        private boolean placed;
        /** When the list's draw reached the tiles: what they cost shows in a measured glide. */
        private long drawn;
        private static final long FADE_MS = 60L;
        private final android.graphics.Paint fade = new android.graphics.Paint();

        /**
         * How far the grid is scrolled, worked out from a laid-out row, and the step of a row.
         * RecyclerView's own figure is an estimate that shifts as rows come and go near the list's
         * end, and the frame, which keeps content coordinates, went off its tile and back with it.
         */
        private void measure(RecyclerView rv) {
            RecyclerView.LayoutManager lm = rv.getLayoutManager();
            span = lm instanceof GridLayoutManager ? ((GridLayoutManager) lm).getSpanCount() : 1;
            for (int i = 0; lm != null && i < rv.getChildCount(); i++) {
                View ch = rv.getChildAt(i);
                int p = rv.getChildLayoutPosition(ch);
                if (p == RecyclerView.NO_POSITION) continue;
                ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) ch.getLayoutParams();
                pitch = lm.getDecoratedMeasuredHeight(ch) + lp.topMargin + lp.bottomMargin;
                off = (p / span) * pitch - (lm.getDecoratedTop(ch) - lp.topMargin);
                return;
            }
            off = rv.computeVerticalScrollOffset();
        }

        /** The frame's box of a tile not laid out, from a laid-out one of its column. */
        private float[] project(RecyclerView rv, int p) {
            for (int i = 0; i < rv.getChildCount(); i++) {
                View ch = rv.getChildAt(i);
                int q = rv.getChildLayoutPosition(ch);
                if (q == RecyclerView.NO_POSITION || q % span != p % span) continue;
                View f = ch.findViewById(R.id.img_sel);
                if (f == null) continue;
                float[] b = box(f, rv, off, true);
                b[1] += (p / span - q / span) * pitch;
                return b;
            }
            return null;
        }

        /**
         * The frame, and the card's edge as it shows over the frame, as one: drawn over the tiles,
         * neither the edges under the way nor the one at the target change its colour.
         */
        private void frame(android.graphics.Canvas c, float x, float y, int fc) {
            // Drawn once into a picture: a Path is rasterised again at every new position on
            // this platform's renderer, which cost the moving frame most of its frame time.
            if (pic == null || pw != w || ph != h || pe != edge || pr != rim || pc != fc
                    || pRad != radius || pIn != inner) {
                int bw = (int) Math.ceil(w), bh = (int) Math.ceil(h);
                if (bw <= 0 || bh <= 0) return;
                if (pic == null || pic.getWidth() != bw || pic.getHeight() != bh) {
                    pic = Bitmap.createBitmap(bw, bh, Bitmap.Config.ARGB_8888);
                } else {
                    pic.eraseColor(0);
                }
                android.graphics.Canvas pcv = new android.graphics.Canvas(pic);
                draw.set(0, 0, w, h);
                ring(pcv, edge, radius, inner, fc);
                if (rim > 0) ring(pcv, rim, inner, Math.max(0f, inner - rim), overEdge(fc));
                pw = w; ph = h; pe = edge; pr = rim; pc = fc; pRad = radius; pIn = inner;
            }
            fade.setAlpha(Math.round(255 * fa));
            c.drawBitmap(pic, Math.round(x), Math.round(y), fa < 1f ? fade : null);
        }

        private boolean was;

        /** True once, on the frame the frame comes to rest. */
        private boolean rested(boolean moving) {
            boolean r = was && !moving;
            was = moving;
            return r;
        }

        private Bitmap pic;
        private float pw, ph, pe, pr, pRad, pIn;
        private int pc;

        /** Left and top of a view's box, less its padding or not, in the list's content coordinates. */
        private static float[] box(View f, RecyclerView rv, int off, boolean padded) {
            float x = padded ? f.getPaddingLeft() : 0, y = (padded ? f.getPaddingTop() : 0) + off;
            for (View v = f; v != null && v != rv; v = (View) v.getParent()) {
                x += v.getLeft();
                y += v.getTop();
                if (!(v.getParent() instanceof View)) break;
            }
            return new float[] {x, y};
        }

        /** A frame's step nearer its target, by Glider's law. */
        private static float glide(float at, float to, float dt) {
            float d = to - at, a = Math.abs(d);
            if (a < 1f) return to;
            float s = Math.min(a, Math.max(VMIN, Math.min(VMAX, a * RATE)) * dt);
            return at + (d > 0 ? s : -s);
        }

        /** The ring between the box drawn now and the same box inset by {@code by}. */
        private void ring(android.graphics.Canvas c, float by, float ro, float ri, int color) {
            ring.reset();
            ring.setFillType(android.graphics.Path.FillType.EVEN_ODD);
            ring.addRoundRect(draw, ro, ro, android.graphics.Path.Direction.CW);
            draw.inset(by, by);
            ring.addRoundRect(draw, ri, ri, android.graphics.Path.Direction.CW);
            paint.setColor(color);
            c.drawPath(ring, paint);
        }

        @Override
        public void onDraw(android.graphics.Canvas c, RecyclerView rv, RecyclerView.State state) {
            try {
                drawn = SystemClock.uptimeMillis();
                Context ctx = rv.getContext();
                RecyclerView.Adapter a = rv.getAdapter();
                if (!(a instanceof RVBaseAdapter) || multiMode(ctx) || menuMulti) {
                    has = false;
                    leg = false;
                    fa = 1f;
                    return;
                }
                measure(rv);
                int sel = ((RVBaseAdapter) a).getSelectPosition();
                View tile = rv.getLayoutManager() == null ? null
                        : rv.getLayoutManager().findViewByPosition(sel);
                View f = tile == null ? null : tile.findViewById(R.id.img_sel);
                View card = tile == null ? null : tile.findViewById(R.id.card);
                View img = tile == null ? null : tile.findViewById(R.id.img);
                long now = SystemClock.uptimeMillis();
                boolean moving = false;
                float[] fb = null;
                if (f instanceof CardView && card instanceof CardView && img != null) {
                    // the frame's and the card's boxes less the padding CardView keeps for its
                    // shadow on this API; the picture's box as it stands
                    fb = box(f, rv, off, true);
                    float[] cb = box(card, rv, off, true), ib = box(img, rv, off, false);
                    w = f.getWidth() - f.getPaddingLeft() - f.getPaddingRight();
                    h = f.getHeight() - f.getPaddingTop() - f.getPaddingBottom();
                    edge = Math.max(1f, cb[0] - fb[0]);
                    rim = Math.max(0f, ib[0] - cb[0]);
                    radius = ((CardView) f).getRadius();
                    inner = ((CardView) card).getRadius();
                } else if (has) {
                    // round the list's end: the tile is still off screen, the rows glide to it
                    fb = project(rv, sel);
                }
                if (fb != null && !has) {
                    l = fb[0]; t = fb[1];
                    has = true;
                } else if (fb != null) {
                    float dt = last == 0 ? 0.016f : Math.min(0.05f, (now - last) / 1000f);
                    float rem = Wheel.Glider.left(rv);
                    if (!leg && fb[1] != t) {
                        if (Math.abs(fb[1] - t) <= 1.5f * pitch || rem != 0) {
                            // To another row, the next or round the list's end, the frame does
                            // not travel: it fades where it stands on screen while the rows
                            // glide, and in on its tile once they stop.
                            leg = true;
                            sy = t - off;
                            fa = 1f;
                            placed = false;
                            legPos = sel;
                        } else {
                            l = fb[0];
                            t = fb[1];
                        }
                        lx = fb[0];
                        ly = fb[1];
                    }
                    if (leg) {
                        if (sel == legPos) {
                            lx = fb[0];
                            ly = fb[1];
                        }
                        // in as the rows ease the last half row in, riding along with its tile
                        if (!placed && Math.abs(rem) < pitch / 2f && fa == 0f) placed = true;
                        if (!placed) {
                            fa = Math.max(0f, fa - dt * 1000f / FADE_MS);
                            t = sy + off;
                        } else {
                            l = lx;
                            t = ly;
                            fa = Math.min(1f, fa + dt * 1000f / FADE_MS);
                            if (fa >= 1f) leg = false;
                        }
                    } else {
                        l = glide(l, fb[0], dt);
                    }
                    moving = leg || l != fb[0] || t != fb[1];
                }
                if (rested(moving)) Tidy.at(rv);
                last = moving ? now : 0;
                if (!has) return;
                if (moving) rv.postInvalidateOnAnimation();
            } catch (Throwable e) {
            }
        }

        @Override
        public void onDrawOver(android.graphics.Canvas c, RecyclerView rv, RecyclerView.State state) {
            try {
                if (SystemClock.uptimeMillis() - drawn >= 8) Frames.part("tiles drawn", drawn);
                if (has) frame(c, l, t - off, Theme.tileFrame());
            } catch (Throwable e) {
            }
        }
    }

    static final class Prepare implements Runnable {
        private final WeakReference rv;
        Prepare(RecyclerView rv) { this.rv = new WeakReference(rv); }
        public void run() {
            new Sweep().run();
            firsts((RecyclerView) rv.get());
            Decoder.all((RecyclerView) rv.get());
        }
    }

    /** Every playlist with no cover yet gets its first song's, here and now, not when shown. */
    private static void firsts(RecyclerView rv) {
        try {
            List l = repo().getAllPlaylistSync();
            if (l == null) return;
            for (int i = 0; i < l.size(); i++) {
                Object o = l.get(i);
                if (!(o instanceof Playlist) || Playlists.isFav(o)) continue;
                UUID id = ((Playlist) o).getPlaylistId();
                if (id == null || jpg(id).isFile()) continue;
                synchronized (tried) {
                    if (tried.contains(id)) continue;
                    tried.add(id);
                }
                if (!none(id).exists()) new First(id, rv).run();
            }
        } catch (Throwable t) {
        }
    }

    /** {@code MyAdapter.onCreateViewHolder}: asked of the list, not the setting, so they never mix. */
    public static int layout(ViewGroup parent, int stock) {
        if (parent instanceof RecyclerView
                && ((RecyclerView) parent).getLayoutManager() instanceof GridLayoutManager) {
            return R.layout.ipp_pl_tile;
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
            // The cursor's frame is drawn by Mover, travelling between tiles; the tile paints its
            // own only in the multi-selection, where Rows.blink blinks it.
            frame.setCardBackgroundColor(sel && multi ? Theme.tileFrame() : 0);
            if (sel && row.getParent() instanceof View) ((View) row.getParent()).invalidate();
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
            // off the multi-selection Mover draws the cursor's edge over the card's own
            paint(row, card, img, p, sel && multi, text.getCurrentTextColor());
        } catch (Throwable t) {
        }
        long ms = SystemClock.uptimeMillis() - t0;
        if (ms >= 3) Frames.part("tile", t0);
        if (ms >= TILE_SLOW_MS) Diag.note("slow: playlist tile " + ms + " ms");
        return true;
    }

    /** A tile is rebound on every wheel click that reaches it: a frame is ~16 ms. */
    private static final long TILE_SLOW_MS = 40L;

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
        card.setTag(R.id.ipp_pl_cover, Integer.valueOf(edge(ring)));
        card.setCardBackgroundColor(sel ? edge(Color.BLACK) : edge(ring));
        RecyclerView rv = row.getParent() instanceof RecyclerView ? (RecyclerView) row.getParent() : null;
        Bitmap b = p == null ? null : cover(p.getPlaylistId(), rv);
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
        if (loading) {
            // the bare plate for the few frames until the decoder repaints: an icon would flash
            img.setImageDrawable(null);
            return;
        }
        ViewGroup.LayoutParams lp = card.getLayoutParams();
        int pad = lp == null ? 0 : lp.width / 4;
        img.setPadding(pad, pad, pad, pad);
        img.setScaleType(ImageView.ScaleType.FIT_CENTER);
        img.setImageResource(fav ? R.mipmap.ipp_heart_on : R.mipmap.ipp_show_all_songs);
        int fg = Icons.progressColor();
        img.setColorFilter(fg == 0 ? Color.WHITE : fg, PorterDuff.Mode.SRC_IN);
        // a tile is bound before it is attached, the first time the grid fills included
        RecyclerView grid = rv != null ? rv : Decoder.grid();
        if (p != null && !fav && grid != null) first(p.getPlaylistId(), grid);
    }

    /**
     * {@code Rows.blink} on a tile of the multi-selection: the cursor's dark edge is made to sit
     * on the frame, so with the frame blinked off the tile shows the edge every other tile has.
     */
    public static void blinkEdge(View row, boolean on) {
        View card = row == null ? null : row.findViewById(R.id.card);
        Object tint = card == null ? null : card.getTag(R.id.ipp_pl_cover);
        if (!(card instanceof CardView) || !(tint instanceof Integer)) return;
        ((CardView) card).setCardBackgroundColor(on ? edge(Color.BLACK) : ((Integer) tint).intValue());
    }

    private static int edge(int c) {
        return (c & 0x00FFFFFF) | EDGE_ALPHA;
    }

    /** The cursor's card edge as it shows over the frame: black at EDGE_ALPHA over {@code frame}. */
    private static int overEdge(int frame) {
        int k = 255 - (EDGE_ALPHA >>> 24);
        return Color.argb(255, Color.red(frame) * k / 255, Color.green(frame) * k / 255,
                Color.blue(frame) * k / 255);
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
    private static final Hashtable mem = new Hashtable();

    static long memBytes() {
        return Diag.bitmapBytes(new ArrayList(mem.values()));
    }

    /** Set by {@link #cover}: the file is there and its picture is still being decoded. */
    private static boolean loading;

    /**
     * From memory only: a cover not decoded yet is queued for {@link Decoder} and the tile shows
     * its plate meanwhile (a stale picture, if there is one). Decoded on the main thread, a cover
     * costs 30–60 ms a tile, three per new row.
     */
    private static Bitmap cover(UUID id, RecyclerView rv) {
        loading = false;
        long m = jpg(id).lastModified();
        if (m == 0) return null;
        Object[] e = (Object[]) mem.get(id);
        if (e != null && ((Long) e[0]).longValue() == m) return (Bitmap) e[1];
        loading = true;
        Decoder.want(id, rv, true);
        return e == null ? null : (Bitmap) e[1];
    }

    /** One worker decodes the covers: the ones a tile asked for first, then every playlist's. */
    static final class Decoder implements Runnable {
        private static final LinkedList queue = new LinkedList();
        private static boolean running;
        private static WeakReference view = new WeakReference(null);
        private static boolean repaintPosted;

        /** The grid to repaint; a tile is bound before it is attached and cannot name it. */
        static void attach(RecyclerView rv) {
            synchronized (queue) {
                view = new WeakReference(rv);
            }
        }

        static RecyclerView grid() {
            synchronized (queue) {
                return (RecyclerView) view.get();
            }
        }

        static void want(UUID id, RecyclerView rv, boolean first) {
            synchronized (queue) {
                if (rv != null) view = new WeakReference(rv);
                queue.remove(id);
                if (first) queue.addFirst(id);
                else queue.addLast(id);
                if (running) return;
                running = true;
            }
            Thread t = new Thread(new Decoder(), "ipp-pl-covers");
            t.setDaemon(true);
            t.start();
        }

        /** Every playlist's cover, so scrolling meets them decoded. */
        static void all(RecyclerView rv) {
            try {
                List l = repo().getAllPlaylistSync();
                if (l == null) return;
                for (int i = 0; i < l.size(); i++) {
                    Object o = l.get(i);
                    if (o instanceof Playlist) want(((Playlist) o).getPlaylistId(), rv, false);
                }
            } catch (Throwable t) {
            }
        }

        public void run() {
            BitmapFactory.Options o = new BitmapFactory.Options();
            o.inPreferredConfig = Bitmap.Config.RGB_565;    // a cover is opaque: half the memory
            while (true) {
                UUID id;
                synchronized (queue) {
                    if (queue.isEmpty()) {
                        running = false;
                        return;
                    }
                    id = (UUID) queue.removeFirst();
                }
                try {
                    File f = jpg(id);
                    long m = f.lastModified();
                    Object[] e = (Object[]) mem.get(id);
                    if (m == 0 || (e != null && ((Long) e[0]).longValue() == m)) continue;
                    // a file that does not decode is remembered too, or every bind would queue it
                    Bitmap b = BitmapFactory.decodeFile(f.getPath(), o);
                    mem.put(id, new Object[] { Long.valueOf(m), b });
                    repaint();
                } catch (Throwable t) {
                }
            }
        }

        /** One repaint for however many covers arrive before it runs. */
        private static void repaint() {
            RecyclerView rv;
            synchronized (queue) {
                if (repaintPosted) return;
                rv = (RecyclerView) view.get();
                if (rv == null) return;
                repaintPosted = true;
            }
            rv.post(new Repainted(rv));
        }

        static final class Repainted implements Runnable {
            private final RecyclerView rv;
            Repainted(RecyclerView rv) { this.rv = rv; }
            public void run() {
                synchronized (queue) {
                    repaintPosted = false;
                }
                if (rv.getAdapter() != null) rv.getAdapter().notifyDataSetChanged();
            }
        }
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
