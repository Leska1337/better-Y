package com.innioasis.ipp;

import android.content.Context;
import android.util.AttributeSet;
import android.view.ViewGroup;

import androidx.recyclerview.widget.RecyclerView;

/**
 * A RecyclerView of a fixed size that lays itself out when a row asks, instead of passing the
 * request up: a row's request otherwise re-lays out the whole window, the ConstraintLayout root
 * with the panel beside the list, on every wheel click. Its size depends on nothing inside it, so
 * nothing above it needs the pass. Its own layout params changed, or not laid out yet — the
 * request goes up as usual. Used from the layout XML.
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

    private final Self self = new Self(this);
    private boolean posted, laying;
    /** The layout params at the last layout: a change in them is a change of OUR size or place. */
    private int lw, lh, ml, mt, mr, mb;

    public void requestLayout() {
        if (laying || !contained()) {
            super.requestLayout();
            return;
        }
        forceLayout();
        if (!posted) {
            posted = true;
            postOnAnimation(self);
        }
    }

    private boolean contained() {
        if (getWidth() == 0 || getHeight() == 0 || getParent() == null || getWindowToken() == null) return false;
        ViewGroup.LayoutParams lp = getLayoutParams();
        if (lp == null || lp.width != lw || lp.height != lh) return false;
        if (lp instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams m = (ViewGroup.MarginLayoutParams) lp;
            if (m.leftMargin != ml || m.topMargin != mt || m.rightMargin != mr || m.bottomMargin != mb) return false;
        }
        return true;
    }

    protected void onMeasure(int w, int h) {
        laying = true;
        try {
            super.onMeasure(w, h);
        } finally {
            laying = false;
        }
    }

    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        laying = true;
        try {
            super.onLayout(changed, l, t, r, b);
        } finally {
            laying = false;
        }
        if (!selfLaying) healDue = true;   // inside the window's pass: the panel was measured before the binds
        ViewGroup.LayoutParams lp = getLayoutParams();
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

    /** Before the frame's traversal: the pass the window would have run, for this list alone. */
    static final class Self implements Runnable {
        private final Fixed rv;

        Self(Fixed rv) { this.rv = rv; }

        public void run() {
            rv.posted = false;
            if (!rv.isLayoutRequested()) return;
            // the window lays out anyway this frame: it will reach the list
            if (rv.getParent() != null && rv.getParent().isLayoutRequested()) return;
            if (!rv.contained()) {
                rv.passUp();
                return;
            }
            rv.selfLaying = true;
            try {
                rv.measure(MeasureSpec.makeMeasureSpec(rv.getWidth(), MeasureSpec.EXACTLY),
                        MeasureSpec.makeMeasureSpec(rv.getHeight(), MeasureSpec.EXACTLY));
                rv.layout(rv.getLeft(), rv.getTop(), rv.getRight(), rv.getBottom());
            } finally {
                rv.selfLaying = false;
            }
            rv.invalidate();
        }
    }

    private void passUp() {
        super.requestLayout();
    }

    private final Heal heal = new Heal(this);
    private boolean healDue, selfLaying;
    private long healAt;

    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        getViewTreeObserver().addOnPreDrawListener(heal);
    }

    protected void onDetachedFromWindow() {
        getViewTreeObserver().removeOnPreDrawListener(heal);
        super.onDetachedFromWindow();
    }


    /**
     * The window's pass measures the panel beside the list BEFORE it lays the list out, and the
     * rows' binds repaint the panel: its new text and picture are drawn in the old measure, and
     * the layout clears the request they made. The rows' own requests used to carry the window
     * into a second pass; they stop here now, so after such a pass the neighbours are measured
     * again and that draw is cancelled. Our own passes run outside the window's: not needed then.
     */
    static final class Heal implements android.view.ViewTreeObserver.OnPreDrawListener {
        private final Fixed rv;

        Heal(Fixed rv) { this.rv = rv; }

        public boolean onPreDraw() {
            if (!rv.healDue) return true;
            rv.healDue = false;
            // once per pass that needs it: a draw cancelled every frame would never show anything
            long now = android.os.SystemClock.uptimeMillis();
            if (now - rv.healAt < 300) return true;
            rv.healAt = now;
            if (!(rv.getParent() instanceof ViewGroup)) return true;
            ViewGroup g = (ViewGroup) rv.getParent();
            for (int i = 0; i < g.getChildCount(); i++) {
                android.view.View c = g.getChildAt(i);
                if (c != rv) force(c);
            }
            g.requestLayout();
            return false;
        }

        private static void force(android.view.View v) {
            if (v == null || v.getVisibility() == GONE) return;
            v.forceLayout();
            if (v instanceof ViewGroup) {
                ViewGroup g = (ViewGroup) v;
                for (int i = 0; i < g.getChildCount(); i++) force(g.getChildAt(i));
            }
        }
    }
}
