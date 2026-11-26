package com.innioasis.ipp;

import android.app.Activity;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;

import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import java.util.WeakHashMap;

import com.innioasis.y1.R;
import com.innioasis.y1.activity.DateOneLevelActivity;

/**
 * A theme whose rows are opaque: a list that ends above its own bottom edge goes on with empty
 * rows of that background down to it. They are drawn, not items, so the cursor never reaches them.
 * Every vertical list of the screen and Date and time's rows, whatever the menu style.
 */
public final class Fill extends RecyclerView.ItemDecoration {

    private Fill() { }

    private static final WeakHashMap DONE = new WeakHashMap();
    private static final Fill FILL = new Fill();

    /** From {@code MenuStyle.apply}, i.e. the end of every {@code BaseActivity.onResume}. */
    static void apply(Activity a) {
        try {
            walk(a.findViewById(android.R.id.content));
            if (a instanceof DateOneLevelActivity) rows(a.findViewById(R.id.date_ll));
        } catch (Throwable t) {
        }
    }

    private static void walk(View v) {
        if (v instanceof RecyclerView) {
            add((RecyclerView) v);
            return;
        }
        if (!(v instanceof ViewGroup)) return;
        ViewGroup g = (ViewGroup) v;
        for (int i = 0; i < g.getChildCount(); i++) walk(g.getChildAt(i));
    }

    /** A list built after {@code onResume} (Column): the walk did not see it. */
    static void list(RecyclerView rv) {
        add(rv);
    }

    /** The layout manager is not asked here: SongRows sets one with its adapter, after onResume. */
    private static void add(RecyclerView rv) {
        if (DONE.containsKey(rv)) return;
        DONE.put(rv, Boolean.TRUE);
        rv.addItemDecoration(FILL);
    }

    /** Rows that are not a list, laid out by their own group: Date and time's, Cover Flow's settings. */
    public static void rows(View v) {
        if (!(v instanceof ViewGroup) || DONE.containsKey(v)) return;
        DONE.put(v, Boolean.TRUE);
        v.setBackgroundDrawable(new Below((ViewGroup) v));
    }

    private static boolean vertical(RecyclerView r) {
        RecyclerView.LayoutManager lm = r.getLayoutManager();
        return lm instanceof LinearLayoutManager && !(lm instanceof GridLayoutManager)
                && ((LinearLayoutManager) lm).getOrientation() == LinearLayoutManager.VERTICAL;
    }

    /** {@code h}-tall rows at {@code step} from below {@code top} down to {@code bottom}. */
    private static void tile(Canvas c, Drawable bg, int left, int right, int top, int step, int h, int bottom) {
        for (int y = top + step; y < bottom; y += step) {
            bg.setBounds(left, y, right, y + h);
            bg.draw(c);
        }
    }

    private static final int HAIR = 2;

    static final class Below extends Drawable {
        private final java.lang.ref.WeakReference group;

        Below(ViewGroup g) {
            group = new java.lang.ref.WeakReference(g);
        }

        @Override
        public void draw(Canvas c) {
            try {
                ViewGroup g = (ViewGroup) group.get();
                Drawable bg = Theme.rowBackground();
                if (g == null || bg == null) return;
                // rows, not the hairlines between them; their pitch includes the hairline
                View last = null;
                View prev = null;
                for (int i = 0; i < g.getChildCount(); i++) {
                    View v = g.getChildAt(i);
                    if (v.getVisibility() != View.VISIBLE || v.getHeight() <= HAIR) continue;
                    prev = last;
                    last = v;
                }
                if (last == null) return;
                int h = last.getHeight();
                int step = prev != null ? Math.max(h, last.getTop() - prev.getTop()) : h;
                tile(c, bg, last.getLeft(), last.getRight(), last.getTop(), step, h, g.getHeight());
            } catch (Throwable t) {
            }
        }

        @Override
        public void setAlpha(int alpha) { }

        @Override
        public void setColorFilter(android.graphics.ColorFilter cf) { }

        @Override
        public int getOpacity() {
            return android.graphics.PixelFormat.TRANSLUCENT;
        }
    }

    @Override
    public void onDraw(Canvas c, RecyclerView r, RecyclerView.State s) {
        try {
            int n = r.getChildCount();
            RecyclerView.Adapter ad = r.getAdapter();
            if (n == 0 || ad == null || !vertical(r)) return;
            Drawable bg = Theme.rowBackground();
            if (bg == null) return;
            View last = null;
            View prev = null;
            int lastPos = -1;
            for (int i = 0; i < n; i++) {
                View v = r.getChildAt(i);
                int p = r.getChildLayoutPosition(v);
                if (p > lastPos) {
                    prev = last;
                    last = v;
                    lastPos = p;
                }
            }
            if (last == null || lastPos != ad.getItemCount() - 1) return;
            int h = last.getHeight();
            if (h <= 0) return;
            int bottom = r.getHeight() - r.getPaddingBottom();
            int top = Math.round(last.getTop() + last.getTranslationY());
            // the rows' own pitch, gaps between them included
            int step = prev != null ? top - Math.round(prev.getTop() + prev.getTranslationY()) : h;
            if (step < h) step = h;
            tile(c, bg, last.getLeft(), last.getRight(), top, step, h, bottom);
        } catch (Throwable t) {
        }
    }
}
