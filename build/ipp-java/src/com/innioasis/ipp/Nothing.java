package com.innioasis.ipp;

import android.content.Context;
import android.util.AttributeSet;

/**
 * The "Nothing" label of an empty section, on the wallpaper as Brightness's text is: its colour
 * and outline by the same rule ({@link Preview#nothing}). Painted on attach — the e-book's is an
 * adapter's empty view — and again on every onResume, for a setting changed while covered.
 */
public class Nothing extends Outline {

    public Nothing(Context c) {
        super(c);
    }

    public Nothing(Context c, AttributeSet a) {
        super(c, a);
    }

    public Nothing(Context c, AttributeSet a, int style) {
        super(c, a, style);
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        Preview.nothing(this);
    }
}
