package com.innioasis.ipp;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;

import androidx.recyclerview.widget.RecyclerView;

/**
 * A RecyclerView of a fixed size that lays itself out when a row asks, instead of passing the
 * request up: a row's request otherwise re-lays out the whole window, the ConstraintLayout root
 * with the panel beside the list, on every wheel click. Its size depends on nothing inside it, so
 * nothing above it needs the pass. Its own layout params changed, wrap_content, or not laid out
 * yet — the request goes up as usual. Used from the layout XML.
 */
public class Fixed extends RecyclerView {

    public Fixed(Context c) {
        super(c);
    }

    public Fixed(Context c, AttributeSet a) {
        super(c, a);
    }

    public Fixed(Context c, AttributeSet a, int style) {
        super(c, a, style);
    }

    private final Box box = new Box(this, true);

    /**
     * The pending self-layout run at once. For a caller already inside a frame callback (the
     * wheel's step): a posted one lands a frame late, and that frame shows the rows without the
     * cursor's row — the highlight blinked at the list's edge.
     */
    public static void layNow(View v) {
        if (v instanceof Fixed) ((Fixed) v).box.now();
    }

    public void requestLayout() {
        // null while the base constructor runs
        if (box == null || !box.take()) super.requestLayout();
    }

    protected void onMeasure(int w, int h) {
        box.laying = true;
        try {
            super.onMeasure(w, h);
        } finally {
            box.laying = false;
        }
    }

    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        box.laying = true;
        try {
            super.onLayout(changed, l, t, r, b);
        } finally {
            box.laying = false;
        }
        box.laid();
    }

    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        box.attachedAt = android.os.SystemClock.uptimeMillis();
        getViewTreeObserver().addOnPreDrawListener(box);
    }

    protected void onDetachedFromWindow() {
        getViewTreeObserver().removeOnPreDrawListener(box);
        super.onDetachedFromWindow();
    }

    /**
     * The list's own layout. {@code take} answers a request: true when the list lays itself
     * out (before the frame's traversal), false when it goes up. The layout params at the last
     * layout are kept: a change in them is a change of the list's own size or place.
     */
    static final class Box implements Runnable, ViewTreeObserver.OnPreDrawListener {
        private final ViewGroup v;
        private final boolean heal;
        boolean laying;
        private boolean posted, selfLaying, healDue, passing;
        private long healAt;
        long attachedAt;
        private int lw, lh, ml, mt, mr, mb;

        /** {@code heal}: re-measure the neighbours after the window's first passes (a list's rows paint them). */
        Box(ViewGroup v, boolean heal) {
            this.v = v;
            this.heal = heal;
        }

        boolean take() {
            if (laying || passing || !contained()) return false;
            v.forceLayout();
            if (!posted) {
                posted = true;
                v.postOnAnimation(this);
            }
            return true;
        }

        private boolean contained() {
            if (v.getWidth() == 0 || v.getHeight() == 0 || v.getParent() == null || v.getWindowToken() == null) {
                return false;
            }
            ViewGroup.LayoutParams lp = v.getLayoutParams();
            if (lp == null || lp.width != lw || lp.height != lh) return false;
            if (lp.width == ViewGroup.LayoutParams.WRAP_CONTENT || lp.height == ViewGroup.LayoutParams.WRAP_CONTENT) {
                return false;
            }
            if (lp instanceof ViewGroup.MarginLayoutParams) {
                ViewGroup.MarginLayoutParams m = (ViewGroup.MarginLayoutParams) lp;
                if (m.leftMargin != ml || m.topMargin != mt || m.rightMargin != mr || m.bottomMargin != mb) return false;
            }
            return true;
        }

        /** End of the list's onLayout. */
        void laid() {
            // the window's first passes: the neighbours were measured before the rows were bound
            if (heal && !selfLaying && android.os.SystemClock.uptimeMillis() - attachedAt < 1000) healDue = true;
            ViewGroup.LayoutParams lp = v.getLayoutParams();
            if (lp == null) return;
            lw = lp.width;
            lh = lp.height;
            if (lp instanceof ViewGroup.MarginLayoutParams) {
                ViewGroup.MarginLayoutParams m = (ViewGroup.MarginLayoutParams) lp;
                ml = m.leftMargin;
                mt = m.topMargin;
                mr = m.rightMargin;
                mb = m.bottomMargin;
            }
        }

        void now() {
            if (!posted) return;
            v.removeCallbacks(this);
            run();
        }

        /** Before the frame's traversal: the pass the window would have run, for this list alone. */
        public void run() {
            posted = false;
            if (!v.isLayoutRequested()) return;
            // the window lays out anyway this frame: it will reach the list
            if (v.getParent() != null && v.getParent().isLayoutRequested()) return;
            if (!contained()) {
                passing = true;
                try {
                    v.requestLayout();
                } finally {
                    passing = false;
                }
                return;
            }
            selfLaying = true;
            try {
                v.measure(View.MeasureSpec.makeMeasureSpec(v.getWidth(), View.MeasureSpec.EXACTLY),
                        View.MeasureSpec.makeMeasureSpec(v.getHeight(), View.MeasureSpec.EXACTLY));
                v.layout(v.getLeft(), v.getTop(), v.getRight(), v.getBottom());
            } finally {
                selfLaying = false;
            }
            v.invalidate();
        }

        /**
         * The window's pass measures a panel beside the list BEFORE it lays the list out, and the
         * rows' binds repaint the panel: the new text and picture are drawn in the old measure and
         * the layout clears their request. The rows' requests used to carry the window into a
         * second pass; they stop here, so after such a pass on opening the neighbours are measured
         * again and that draw is cancelled — once per 300 ms at most, a draw cancelled every frame
         * shows nothing.
         */
        public boolean onPreDraw() {
            if (!healDue) return true;
            healDue = false;
            long now = android.os.SystemClock.uptimeMillis();
            if (now - healAt < 300 || !(v.getParent() instanceof ViewGroup)) return true;
            healAt = now;
            ViewGroup g = (ViewGroup) v.getParent();
            for (int i = 0; i < g.getChildCount(); i++) {
                View c = g.getChildAt(i);
                if (c != v) force(c);
            }
            g.requestLayout();
            return false;
        }

        private static void force(View c) {
            if (c == null || c.getVisibility() == View.GONE) return;
            c.forceLayout();
            if (c instanceof ViewGroup) {
                ViewGroup g = (ViewGroup) c;
                for (int i = 0; i < g.getChildCount(); i++) force(g.getChildAt(i));
            }
        }
    }
}
