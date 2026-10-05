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
 * The Shuffle row rides with the list instead of being pinned above it — a virtual header. Not
 * {@code addHeaderView}: it shifts every position against the adapter's and makes
 * {@code getAdapter()} a {@code HeaderViewListAdapter}, breaking every cast. The ListView gets the
 * full height, {@code paddingTop} = everything above it and {@code clipToPadding=false}, so the
 * padding acts as the header; the row and the disc bar are translated up with the content.
 *
 * The disc bar stays PINNED and gets an opaque wallpaper {@link #backdrop}. The visible top edge
 * is {@link #top}, not {@code getPaddingTop()}; scrolling goes through {@link #selectPinned}, since
 * a plain {@code setSelection} brings the Shuffle row back mid-list.
 */
public final class Head {

    /** Keyed on the ListView, by identity. */
    private static final WeakHashMap rides = new WeakHashMap();

    /** From {@link Shuffle#style}, so every screen with a Shuffle row is covered. Idempotent. */
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
                // Also the call made when the row is SHOWN: claim its space now, not a frame later.
                ((Ride) had).applyPadding();
                return;
            }
            Ride r = new Ride(lv, spv, root.findViewById(R.id.ipp_disc_bar));
            rides.put(lv, r);
            lv.setClipToPadding(false);
            lv.getViewTreeObserver().addOnPreDrawListener(r);
            r.applyPadding();
        } catch (Throwable t) {
        }
    }

    private static Ride ride(ListView lv) {
        if (lv == null) return null;
        Object o = rides.get(lv);
        return (o instanceof Ride) ? (Ride) o : null;
    }

    /** Where the visible list begins, in the ListView's coordinates. */
    public static int top(ListView lv) {
        Ride r = ride(lv);
        return r == null ? lv.getPaddingTop() : r.edge();
    }

    /**
     * The row's top at {@code y}. The trap this class turns on: {@code setSelectionFromTop} adds
     * {@code mListPadding.top}, which is refreshed only in {@code onMeasure} — right after a
     * {@code setPadding} it is stale and the placement silently misses. So when the padding has just
     * moved, the placement is DEFERRED to the next pre-draw.
     */
    public static void place(ListView lv, int pos, int y) {
        Ride r = ride(lv);
        if (r == null) { lv.setSelection(pos); return; }
        if (r.applyPadding()) { r.anchor(pos, y, true); return; }
        lv.setSelectionFromTop(pos, y - lv.getPaddingTop());
    }

    /**
     * Restoring a list while the padding is about to change (out of an album or a Genres level):
     * placed now, and again as a fixed placement once the padding settles.
     */
    public static void restore(ListView lv, int pos, int y) {
        Ride r = ride(lv);
        if (r != null) r.anchor(pos, y, true);
        lv.setSelectionFromTop(pos, y - lv.getPaddingTop());
    }

    /**
     * The Shuffle row became the cursor, so it must not be off the top edge. From {@link Shuffle#style}:
     * the one event every route to it (step, burst, alphabetical jump) shares.
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
            // Runs on every repaint of the row.
            if (r == null || r.headerHeight() == 0 || r.ridden() == 0) return;
            rest(lv);
        } catch (Throwable t) {
        }
    }

    /** 0 while the Shuffle row is fully shown, its height once gone. */
    public static int ridden(ListView lv) {
        Ride r = ride(lv);
        return r == null ? 0 : r.ridden();
    }

    /**
     * Row 0 against the padding, Shuffle row fully shown. Not via {@link #top}, which shrinks as
     * the header rides away: right for a step, wrong for a jump.
     */
    public static void rest(ListView lv) {
        Ride r = ride(lv);
        if (r == null) {
            lv.setSelectionFromTop(0, 0);
            return;
        }
        place(lv, 0, r.wantPad());
    }

    /** Partly on screen: a scrolling downward step consumes it first ({@code Wheel.list}). */
    public static boolean headerShowing(ListView lv) {
        Ride r = ride(lv);
        return r != null && r.headerHeight() > 0 && r.ridden() < r.headerHeight();
    }

    /** Against the top edge with the Shuffle row scrolled OFF. */
    public static void selectPinned(ListView lv, int pos) {
        Ride r = ride(lv);
        if (r == null) { lv.setSelection(pos); return; }
        place(lv, pos, r.barHeight());
    }

    /**
     * An opaque wallpaper copy behind the disc bar, so rows passing under it are not read through
     * it (stock themes keep it transparent). From {@code Disc.paint}, after the theme.
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
        }
    }

    /** The wallpaper aligned to the SCREEN, so it matches at every point of the bar's travel. */
    static final class Backdrop extends Drawable {
        private final View host;
        private final Bitmap bmp;
        private final int[] loc = new int[2];
        private final Rect dst = new Rect();
        /**
         * Filtered as the window background draws it: the wallpaper is 320x240, and an unfiltered
         * upscale shows as a rectangle on a detailed wallpaper.
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

    /**
     * One per list screen, before every draw: only the finished layout knows where ListView's own
     * corrections left the content. Cheap; translations are written only when they change.
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

        /** From the layout params before the first layout: the first fill is built on the padding. */
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

        /** A placement waiting for the padding change to be measured; see {@link #place}. */
        private int pendPos = -1;
        private int pendY;
        private int pendAge;
        /**
         * True: an explicit placement, final. False: "where the list stands, moved with the
         * padding", which a second padding change carries forward.
         */
        private boolean pendFixed;
        /** The adapter an unfixed anchor belongs to; see {@link #flushAnchor}. */
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
         * Keeps the padding in step — and MOVES THE CONTENT WITH IT: a re-layout anchors on the top
         * child, so changed padding alone moves nothing and the Shuffle row ends up off the edge.
         * The top child keeps its offset from the OLD padding; the move is recorded and carried
         * out on the next pre-draw (see {@link #place}).
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
                // The padding moves twice on a multi-disc album (row, then bar); recomputing from
                // the stale screen would lose the row every other time. Carry the pending one.
                if (!pendFixed) pendY += want - had;
                pendAge = 0;
            } else if (c != null && first >= 0) {
                anchor(first, c.getTop() + want - had, false);
            } else {
                // Empty (an album still loading): stock's setSelection(0) would land against the
                // stale padding, so the rest position is claimed as the last word.
                anchor(0, want, false);
            }
            lv.setPadding(lv.getPaddingLeft(), want, lv.getPaddingRight(), lv.getPaddingBottom());
            return true;
        }

        /**
         * True when a placement was carried out. An empty list keeps the anchor for the list about
         * to arrive, for at most {@link #PEND_FRAMES}.
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
            // An unfixed anchor on a swapped list is a row nobody asked about (Genres swaps in one
            // callback): rest instead. A fixed one names its list and is kept.
            Object was = pendAd == null ? null : pendAd.get();
            pendAd = null;
            if (!pendFixed && was != null && was != ad) { pos = 0; y = wantPad(); }
            if (pos >= n) pos = n - 1;
            lv.setSelectionFromTop(pos, y - lv.getPaddingTop());
            return true;
        }

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

        /** The bar's current bottom, never above the bar itself. */
        int edge() {
            int bh = barHeight();
            int e = headerHeight() + bh - ridden();
            return e < bh ? bh : e;
        }

        public boolean onPreDraw() {
            try {
                // A padding change is laid out before any frame; its placement waits a pass more.
                if (applyPadding()) return false;
                if (flushAnchor()) return false;
                float ty = -ridden();
                View s = spv();
                if (s != null && s.getTranslationY() != ty) s.setTranslationY(ty);
                View b = bar();
                if (b != null && b.getTranslationY() != ty) {
                    b.setTranslationY(ty);
                    // Re-record: the screen-aligned backdrop must not travel with the view.
                    b.invalidate();
                }
            } catch (Throwable t) {
            }
            return true;
        }
    }
}
