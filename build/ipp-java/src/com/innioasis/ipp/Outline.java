package com.innioasis.ipp;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.text.TextPaint;
import android.util.AttributeSet;
import android.widget.TextView;

/**
 * A TextView drawn twice, outline then fill, for text standing on the wallpaper (About,
 * Brightness). API 17 has no text stroke of its own. The colour swap inside {@link #onDraw} must
 * not invalidate, or the view would redraw for ever.
 */
public class Outline extends TextView {

    private int stroke;
    private float width;
    private boolean drawing;

    public Outline(Context c) {
        super(c);
    }

    public Outline(Context c, AttributeSet a) {
        super(c, a);
    }

    public Outline(Context c, AttributeSet a, int style) {
        super(c, a, style);
    }

    /**
     * Colour 0 turns the outline off but keeps its room, so the text stands where it does with
     * one. The edge glyphs' stroke needs room on two counts, and each alone leaves it cut: the
     * parent clips the view to its bounds (so it is padded), and TextView clips its drawing to the
     * INSIDE of its padding, widening that only by the shadow's radius (so a transparent shadow as
     * wide as the padding).
     */
    public void setOutline(int color, float px) {
        if (stroke == color && width == px) return;
        int was = width <= 0 ? 0 : room(width);
        int pad = px <= 0 ? 0 : room(px);
        stroke = color;
        width = px;
        if (pad != was) {
            int d = pad - was;
            setPadding(getPaddingLeft() + d, getPaddingTop() + d, getPaddingRight() + d,
                    getPaddingBottom() + d);
        }
        setShadowLayer(pad, 0, 0, 0);
        invalidate();
    }

    private static int room(float px) {
        return (int) Math.ceil(px) + 2;
    }

    @Override
    protected void onDraw(Canvas c) {
        if (stroke == 0 || width <= 0) {
            super.onDraw(c);
            return;
        }
        ColorStateList fill = getTextColors();
        TextPaint p = getPaint();
        drawing = true;
        try {
            p.setStyle(Paint.Style.STROKE);
            p.setStrokeJoin(Paint.Join.ROUND);
            p.setStrokeWidth(width);
            setTextColor(stroke);
            super.onDraw(c);
            p.setStyle(Paint.Style.FILL);
            setTextColor(fill);
            super.onDraw(c);
        } finally {
            p.setStyle(Paint.Style.FILL);
            drawing = false;
        }
    }

    @Override
    public void invalidate() {
        if (!drawing) super.invalidate();
    }
}
