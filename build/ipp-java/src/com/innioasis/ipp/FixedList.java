package com.innioasis.ipp;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.ListView;

/** {@link Fixed} for a ListView: a page change or a row's request lays out the list alone. */
public class FixedList extends ListView {

    public FixedList(Context c) {
        super(c);
    }

    public FixedList(Context c, AttributeSet a) {
        super(c, a);
    }

    public FixedList(Context c, AttributeSet a, int style) {
        super(c, a, style);
    }

    private final Fixed.Box box = new Fixed.Box(this);

    public void requestLayout() {
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
