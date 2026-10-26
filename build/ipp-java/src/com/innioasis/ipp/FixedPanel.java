package com.innioasis.ipp;

import android.content.Context;
import android.util.AttributeSet;

import androidx.constraintlayout.widget.ConstraintLayout;

/**
 * A ConstraintLayout of a fixed size that lays itself out when a child asks, as {@link Fixed}
 * does for a list: a preview beside a list repainted per wheel click (a caption of another width)
 * otherwise re-lays out the whole window. The children are still placed by this layout, so the
 * text stands where it always did. Used from the layout XML.
 */
public class FixedPanel extends ConstraintLayout {

    public FixedPanel(Context c) {
        super(c);
    }

    public FixedPanel(Context c, AttributeSet a) {
        super(c, a);
    }

    public FixedPanel(Context c, AttributeSet a, int style) {
        super(c, a, style);
    }

    private final Fixed.Box box = new Fixed.Box(this, false);

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
}
