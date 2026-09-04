package com.innioasis.ipp;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ListView;

import com.innioasis.y1.R;
import com.innioasis.y1.utils.WallpaperUtils;

import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/**
 * The Shuffle row rides with the list instead of being pinned above it.
 *
 * <h3>Why it is not simply a header view</h3>
 * {@code lv.addHeaderView(spv)} is the obvious answer and it is unusable here: it shifts every
 * ListView position by one relative to the adapter's, and that correspondence is what the whole of
 * this mod's navigation is built on ({@code Wheel}, {@code Follow}, {@code Disc}, {@code Alpha},
 * {@code Status}, {@code Albums} …) — and worse, {@code lv.getAdapter()} then returns a
 * {@code HeaderViewListAdapter}, which every {@code (MyBaseAdapter) lv.getAdapter()} cast in stock
 * and ipp code alike would fail on. Hiding the row (GONE) when the list has scrolled does not work
 * either: the list grows by the row's height and there is nothing to fill the freed space with, so
 * the content jumps by 60px, and "hide it once first > 0" oscillates — hiding it lets the list fill
 * upwards, first goes back to 0, and the row comes back.
 *
 * <h3>What is done instead — the virtual header</h3>
 * The ListView is given the FULL height of the screen (its top is constrained to the parent, not to
 * the Shuffle row) plus {@code paddingTop} = the height of everything above it, and
 * {@code clipToPadding="false"}. With that flag {@code ListView.fillUp}/{@code fillDown} use 0 and
 * the full height as their bounds instead of the padding, i.e. rows really are laid out inside the
 * padding area rather than dropped — while {@code correctTooLow}/{@code correctTooHigh} still clamp
 * row 0's resting place to {@code mListPadding.top}. So the padding behaves exactly like a header:
 * it is the space the list rests below and scrolls through.
 *
 * The Shuffle row and the disc bar are then moved up in step with the content
 * ({@code setTranslationY(-ridden)}), so the row's bottom edge and row 0's top edge stay glued
 * together to the pixel. Neither the ListView's size nor any position arithmetic changes.
 *
 * <h3>The disc bar</h3>
 * It stays PINNED — it names the disc that has already scrolled off — so once the Shuffle row is
 * gone it sits at the top edge and rows pass under it. That is what a sticky header looks like, and
 * it needs the bar to be opaque: on the stock themes it is deliberately transparent (their list rows
 * are transparent too), so the text of the rows sliding under it would show through. {@link
 * #backdrop} puts a copy of the wallpaper behind it — drawn aligned to the SCREEN, so it matches
 * whatever is behind the bar at any point of its travel, not just where it comes to rest.
 *
 * <h3>The effective top edge</h3>
 * {@code lv.getPaddingTop()} is no longer where the visible list begins: once the Shuffle row has
 * ridden away that is 0 (or the disc bar's height). {@link #top} answers that question and every
 * place that used to read {@code getPaddingTop()} — {@code Wheel.cutAtTop}, {@code Wheel.Fit},
 * {@code Disc.under} — goes through it. Likewise a plain {@code setSelection(pos)} would park the
 * row at {@code paddingTop}, i.e. bring the Shuffle row back into the middle of the list, so the
 * scroll calls go through {@link #selectPinned} instead.
 *
 * Raw (non-generic) types throughout: the bundled d8 crashes on generic Signature attributes.
 */
public final class Head {

    /** Keyed on the ListView; identity, since View does not override equals/hashCode. */
    private static final WeakHashMap rides = new WeakHashMap();


    /**
     * Called from {@link Shuffle#style}, i.e. from {@code ShufflePlaylistItemView.bind/show/
     * updateSelectUI} — so every one of the six screens that has a Shuffle row is covered with no
     * per-Activity hook. Idempotent.
     */
    public static void attach(View spv) {
        try {
            if (spv == null) return;
            Object p = spv.getParent();
            if (!(p instanceof View)) return;
            View root = (View) p;
            View v = root.findViewById(R.id.lv);
            if (!(v instanceof ListView)) v = root.findViewById(R.id.lv_audiobooks);
            if (!(v instanceof ListView)) return;
            ListView lv = (ListView) v;
            Object had = rides.get(lv);
            if (had instanceof Ride) {
                // Already riding — but this is also the call the row makes when it is SHOWN, and on
                // most screens that happens well after the screen was built, so the space it needs
                // is claimed here rather than a frame later.
                ((Ride) had).applyPadding();
                return;
            }
            Ride r = new Ride(lv, spv, root.findViewById(R.id.ipp_disc_bar));
            rides.put(lv, r);
            lv.setClipToPadding(false);
            lv.getViewTreeObserver().addOnPreDrawListener(r);
            r.applyPadding();
        } catch (Throwable t) {
            // a list that keeps the stock pinned row is still a usable list
        }
    }

    private static Ride ride(ListView lv) {
        if (lv == null) return null;
        Object o = rides.get(lv);
        return (o instanceof Ride) ? (Ride) o : null;
    }

    /**
     * Where the visible part of the list begins, in the ListView's own coordinates: 0 on a screen
     * with no Shuffle row, the padding while the row is fully shown, the disc bar's height once it
     * has ridden away.
     */
    public static int top(ListView lv) {
        Ride r = ride(lv);
        return r == null ? lv.getPaddingTop() : r.edge();
    }

    /**
     * Put the row's top at {@code y}, in the ListView's own coordinates.
     *
     * <b>Not</b> {@code setSelectionFromTop(pos, y - getPaddingTop())}, and this is the trap the
     * whole class turns on: that method computes {@code mSpecificTop = mListPadding.top + y} <i>at
     * the moment of the call</i>, and {@code mListPadding} is only refreshed in
     * {@code AbsListView.onMeasure}. So immediately after a {@code setPadding} the two disagree by
     * exactly the change, and the placement silently lands where it would have without it — which
     * is why an initial "shift the list down by the Shuffle row's height" did nothing at all.
     * When the padding has just moved the placement is therefore DEFERRED to the next pre-draw,
     * where a measure has been and gone.
     */
    public static void place(ListView lv, int pos, int y) {
        Ride r = ride(lv);
        if (r == null) { lv.setSelection(pos); return; }
        if (r.applyPadding()) { r.anchor(pos, y, true); return; }
        lv.setSelectionFromTop(pos, y - lv.getPaddingTop());
    }

    /**
     * Put a list back exactly where it was left, in list coordinates, when the padding is about to
     * change underneath — the way out of an album or of a level of Genres.
     *
     * Those restores run <b>before</b> the Shuffle row is hidden, so the padding at the moment of
     * the call is still the song list's. Placing it now and again once the padding has settled is
     * what makes it land right without a frame in between: the pending placement is fixed, so the
     * padding change carries it rather than shifting it.
     */
    public static void restore(ListView lv, int pos, int y) {
        Ride r = ride(lv);
        if (r != null) r.anchor(pos, y, true);
        lv.setSelectionFromTop(pos, y - lv.getPaddingTop());
    }

    /**
     * The Shuffle row has just become the cursor: it cannot be the selected thing and be off the
     * top edge at the same time, so bring the list back to rest.
     *
     * Called from {@link Shuffle#style} whenever the row paints itself selected — which is the ONE
     * event common to every way of getting there. Reaching it through the wheel's ordinary step is
     * handled in {@code Wheel.list}, but a fast burst and the alphabetical jump both take their own
     * route, and neither ends in that branch; this is the backstop that does not care which route
     * was taken.
     */
    public static void reveal(View spv) {
        try {
            if (spv == null) return;
            Object p = spv.getParent();
            if (!(p instanceof View)) return;
            View v = ((View) p).findViewById(R.id.lv);
            if (!(v instanceof ListView)) v = ((View) p).findViewById(R.id.lv_audiobooks);
            if (!(v instanceof ListView)) return;
            ListView lv = (ListView) v;
            Ride r = ride(lv);
            // Called from a repaint of the row, i.e. constantly: do nothing at all unless the row
            // really is off the top edge.
            if (r == null || r.headerHeight() == 0 || r.ridden() == 0) return;
            rest(lv);
        } catch (Throwable t) {
            // never take a repaint of the row down over this
        }
    }

    /**
     * How far the content has ridden up over the Shuffle row — 0 while the row is fully shown, its
     * whole height once the row has gone. Anything in between is the row cut in half.
     */
    public static int ridden(ListView lv) {
        Ride r = ride(lv);
        return r == null ? 0 : r.ridden();
    }

    /**
     * Bring the list back to rest at its very START: row 0 against the padding, so the Shuffle row
     * is fully shown where there is one and the list is simply at the top where there is not.
     *
     * <p>This is the one position {@link #top} cannot describe — that method answers "where does
     * the visible list begin right now", which shrinks as the header rides away, so it is the right
     * boundary for a step and the wrong floor for a jump.
     */
    public static void rest(ListView lv) {
        Ride r = ride(lv);
        if (r == null) {
            lv.setSelectionFromTop(0, 0);
            return;
        }
        place(lv, 0, r.wantPad());
    }

    /**
     * True while the Shuffle row is still (partly) on screen. The row is a slot of its own above
     * row 0, so a downward step that has to scroll consumes it first — see {@code Wheel.list}.
     */
    public static boolean headerShowing(ListView lv) {
        Ride r = ride(lv);
        return r != null && r.headerHeight() > 0 && r.ridden() < r.headerHeight();
    }

    /**
     * Put the row against the top edge with the Shuffle row scrolled OFF — the downward case, where
     * the row above is what the list is moving away from.
     */
    public static void selectPinned(ListView lv, int pos) {
        Ride r = ride(lv);
        if (r == null) { lv.setSelection(pos); return; }
        place(lv, pos, r.barHeight());
    }

    // ------------------------------------------------------------------ the pinned bar's backdrop

    /**
     * Give the disc bar an opaque copy of what is behind it, so the rows passing under it are not
     * read through it. Called from {@code Disc.paint} after the theme has had its say — a theme that
     * paints its rows (Win98 Refix) already covers this, the stock themes deliberately do not.
     */
    public static void backdrop(View bar) {
        try {
            if (bar == null) return;
            Bitmap w = WallpaperUtils.INSTANCE.getGlobalBitmap();
            if (w == null || w.isRecycled()) return;
            Drawable cur = bar.getBackground();
            Backdrop bd = new Backdrop(bar, w);
            if (cur == null) {
                bar.setBackgroundDrawable(bd);
            } else {
                Drawable[] layers = new Drawable[2];
                layers[0] = bd;
                layers[1] = cur;
                bar.setBackgroundDrawable(new LayerDrawable(layers));
            }
        } catch (Throwable t) {
            // a see-through bar is better than a crash
        }
    }

    /**
     * The wallpaper, drawn where the wallpaper is — the canvas is translated by the host view's
     * position on screen, so the piece that lands inside the view is exactly the piece the window
     * background would have shown there. That is what makes it right while the bar is still riding
     * up as well as when it has come to rest.
     */
    static final class Backdrop extends Drawable {
        private final View host;
        private final Bitmap bmp;
        private final int[] loc = new int[2];
        private final Rect dst = new Rect();
        /**
         * Filtering matters and is not a nicety: the wallpaper is kept at 320x240
         * ({@code WallpaperUtils.loadBitmap} thumbnails it) and the window background draws it
         * through a {@code BitmapDrawable}, whose default paint carries FILTER_BITMAP_FLAG. Drawing
         * the same pixels with a null paint gives a hard-edged upscale to 480x360 — invisible on a
         * flat colour, and instantly visible as a rectangle on a detailed wallpaper.
         */
        private final android.graphics.Paint paint = new android.graphics.Paint(
                android.graphics.Paint.FILTER_BITMAP_FLAG | android.graphics.Paint.DITHER_FLAG);

        Backdrop(View host, Bitmap bmp) {
            this.host = host;
            this.bmp = bmp;
        }

        public void draw(Canvas c) {
            if (bmp.isRecycled()) return;
            host.getLocationOnScreen(loc);
            android.util.DisplayMetrics dm = host.getResources().getDisplayMetrics();
            dst.set(-loc[0], -loc[1], dm.widthPixels - loc[0], dm.heightPixels - loc[1]);
            c.drawBitmap(bmp, null, dst, paint);
        }

        public void setAlpha(int a) { }

        public void setColorFilter(ColorFilter f) { }

        public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    // ------------------------------------------------------------------ the ride itself

    /**
     * One per list screen. Runs before every draw, which is the only signal there is: the list is
     * moved with {@code setSelection}/{@code setSelectionFromTop} and then corrected by ListView's
     * own {@code correctTooLow}/{@code correctTooHigh}, so nothing short of the finished layout
     * knows where the content actually ended up. The body is a handful of field reads and two
     * translations that are only written when they change.
     */
    static final class Ride implements ViewTreeObserver.OnPreDrawListener {

        private final WeakReference lvRef;
        private final WeakReference spvRef;
        private final WeakReference barRef;

        Ride(ListView lv, View spv, View bar) {
            lvRef = new WeakReference(lv);
            spvRef = new WeakReference(spv);
            barRef = bar == null ? null : new WeakReference(bar);
        }

        private ListView lv() {
            Object o = lvRef.get();
            return (o instanceof ListView) ? (ListView) o : null;
        }

        private View spv() {
            Object o = spvRef.get();
            return (o instanceof View) ? (View) o : null;
        }

        private View bar() {
            Object o = barRef == null ? null : barRef.get();
            return (o instanceof View) ? (View) o : null;
        }

        /**
         * A view's height as it will be laid out. {@code getHeight()} is 0 until the first layout,
         * and both views here carry a fixed height in their layout params, so the answer is exact
         * from the very first pass — which matters, because the padding is what the list's first
         * fill is built on.
         */
        private static int h(View v) {
            if (v == null || v.getVisibility() != View.VISIBLE) return 0;
            int n = v.getHeight();
            if (n > 0) return n;
            ViewGroup.LayoutParams lp = v.getLayoutParams();
            return (lp != null && lp.height > 0) ? lp.height : 0;
        }

        int headerHeight() { return h(spv()); }

        int barHeight() { return h(bar()); }

        int wantPad() { return headerHeight() + barHeight(); }

        /** A placement waiting for the padding change to have been measured. See {@link #place}. */
        private int pendPos = -1;
        private int pendY;
        private int pendAge;
        /**
         * True when {@link #pendY} is where the row must end up, full stop — an explicit placement.
         * False when it is only "wherever the list stands, moved with the padding", which is what
         * {@link #applyPadding} records and what a second padding change has to carry forward.
         */
        private boolean pendFixed;
        /**
         * The adapter the placement was worked out from. An unfixed anchor is "row N of THIS list,
         * where it stands now"; if the list has been swapped for another one before the placement
         * is carried out, row N of the new list is a row nobody asked about — see
         * {@link #flushAnchor}.
         */
        private WeakReference pendAd;

        /** Frames a placement may wait for an empty list to be filled. */
        private static final int PEND_FRAMES = 120;

        void anchor(int pos, int y, boolean fixed) {
            pendPos = pos;
            pendY = y;
            pendAge = 0;
            pendFixed = fixed;
            ListView l = lv();
            Object ad = l == null ? null : l.getAdapter();
            pendAd = ad == null ? null : new WeakReference(ad);
        }

        /**
         * Keep the padding in step with what is above the list — and MOVE THE CONTENT WITH IT.
         *
         * The second half is the whole of it. ListView only rests row 0 against the padding while
         * it is correcting an overshoot ({@code correctTooLow}/{@code correctTooHigh}); an ordinary
         * re-layout is anchored on the top child's current position, so growing the padding under a
         * list that is already filled changes nothing on screen — the Shuffle row simply ends up off
         * the top edge, which is what every long list opened like (a short one looked right only
         * because {@code correctTooHigh} pushed it down to fill the gap at the bottom, and a
         * six-track album came out with the Shuffle row cut in half for the same reason).
         *
         * A header appearing above the list has to push the list down by its height, and one going
         * away has to pull it back up: so the top child keeps its offset from the OLD padding, which
         * moves the content by exactly the delta. That also covers the way back out of an album —
         * {@code Albums.restoreList} runs before {@code spv.hide()}, so it places the album list
         * while the padding is still the song list's, and this pulls it back into place.
         *
         * The move itself cannot be made here, see {@link #place}: it is recorded and carried out
         * on the next pre-draw, once a measure has brought {@code mListPadding} up to date.
         */
        boolean applyPadding() {
            ListView lv = lv();
            if (lv == null) return false;
            int want = wantPad();
            int had = lv.getPaddingTop();
            if (had == want) return false;
            View c = lv.getChildCount() > 0 ? lv.getChildAt(0) : null;
            int first = lv.getFirstVisiblePosition();
            if (pendPos >= 0) {
                // A placement is already decided and merely waiting to be measured — which is the
                // ordinary case on a multi-disc album, where the padding moves TWICE (the row, then
                // the disc bar). The list on screen is still the one from before the first change,
                // so recomputing from it would fold the stale position back in and lose the row
                // again, every other time. Carry the decision across instead — and an explicit
                // placement is already expressed in final coordinates, so it is carried untouched.
                if (!pendFixed) pendY += want - had;
                pendAge = 0;
            } else if (c != null && first >= 0) {
                anchor(first, c.getTop() + want - had, false);
            } else {
                // An EMPTY list still has to be told where to rest. This is the ordinary case on
                // entering an album: the row is shown while the songs are still being fetched, so
                // there is nothing to shift — and then stock's own setSelection(0) lands in the
                // window where mListPadding is still the old value and parks row 0 at 0, i.e. the
                // Shuffle row ends up off the top edge. Claiming the rest position here is what
                // puts it back, because the deferred placement is the last word.
                anchor(0, want, false);
            }
            lv.setPadding(lv.getPaddingLeft(), want, lv.getPaddingRight(), lv.getPaddingBottom());
            return true;
        }

        /**
         * Carry out a deferred placement. True when one was pending, i.e. a layout is coming.
         *
         * An empty list keeps the anchor rather than dropping it: entering an album shows the
         * Shuffle row before the songs have been fetched, and the placement is meant for the list
         * that is about to arrive. {@link #PEND_FRAMES} bounds the wait so a list that never fills
         * cannot leave one lying around.
         */
        boolean flushAnchor() {
            ListView lv = lv();
            if (lv == null || pendPos < 0) return false;
            android.widget.ListAdapter ad = lv.getAdapter();
            int n = ad == null ? 0 : ad.getCount();
            if (n == 0) {
                if (++pendAge > PEND_FRAMES) pendPos = -1;
                return false;
            }
            int pos = pendPos;
            int y = pendY;
            pendPos = -1;
            // The list has been swapped since the anchor was worked out, and an unfixed anchor is
            // only ever "row N of the list as it stands" — row N of a DIFFERENT list is a row
            // nobody asked about. It happens on the Genres screen, whose confirm() shows the
            // Shuffle row and hands the list its songs in ONE UI callback: the padding change
            // anchors on the album list the screen is leaving (say its 15th row, because that is
            // where the user was), no pre-draw happens in between to spend that anchor, and the
            // freshly opened album came up scrolled to its 15th track with the cursor off screen.
            // The Albums screen never showed it because its songs arrive from a coroutine a frame
            // later, by which time the album list has already consumed the anchor harmlessly.
            // A FIXED anchor is an explicit placement by code that knows which list it means
            // (Follow.land, Albums.restoreList, Wheel), so it is carried across untouched.
            Object was = pendAd == null ? null : pendAd.get();
            pendAd = null;
            if (!pendFixed && was != null && was != ad) { pos = 0; y = wantPad(); }
            if (pos >= n) pos = n - 1;
            lv.setSelectionFromTop(pos, y - lv.getPaddingTop());
            return true;
        }

        /** How far the content has ridden up over the Shuffle row, 0..its height. */
        int ridden() {
            ListView lv = lv();
            int sh = headerHeight();
            if (lv == null || sh == 0) return 0;
            if (lv.getFirstVisiblePosition() != 0 || lv.getChildCount() == 0) return sh;
            View c = lv.getChildAt(0);
            if (c == null) return sh;
            int s = lv.getPaddingTop() - c.getTop();
            if (s < 0) return 0;
            return s > sh ? sh : s;
        }

        /** Where the visible list begins: the bar's current bottom, never above the bar itself. */
        int edge() {
            int bh = barHeight();
            int e = headerHeight() + bh - ridden();
            return e < bh ? bh : e;
        }

        public boolean onPreDraw() {
            try {
                // The padding is the list's whole geometry, so a change to it has to be laid out
                // before anything is drawn — otherwise the frame shows the old arrangement. The
                // placement that goes with it waits for the pass after, where the measure that
                // refreshed mListPadding has already happened.
                if (applyPadding()) return false;
                if (flushAnchor()) return false;
                float ty = -ridden();
                View s = spv();
                if (s != null && s.getTranslationY() != ty) s.setTranslationY(ty);
                View b = bar();
                if (b != null && b.getTranslationY() != ty) {
                    b.setTranslationY(ty);
                    // Its backdrop is a piece of the wallpaper aligned to the SCREEN, and a
                    // hardware display list is recorded once and then merely re-transformed —
                    // moving the view alone would carry the piece along with it and it would stop
                    // matching what is behind. Re-record it.
                    b.invalidate();
                }
            } catch (Throwable t) {
                // never take a frame down over this
            }
            return true;
        }
    }
}
