package com.innioasis.ipp;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.PorterDuff;
import android.graphics.Path;
import android.graphics.PorterDuffColorFilter;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.TypedValue;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.HorizontalScrollView;
import android.widget.SeekBar;
import android.widget.TextView;

import androidx.constraintlayout.widget.ConstraintLayout;

import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.theme.ThemeManager;
import com.mediatek.fm.databinding.ActivityFmmainBinding;
import com.mediatek.view.FmView;

/**
 * The FM Radio screen: the colours of the frequency ruler, of the big frequency over it and of the
 * volume bar, and the ruler's scroll.
 *
 * The ruler is a panel with a ground of its own, which is what a submenu is, so it is dressed from
 * the MENU section of the theme; the stations on it and the volume bar take the timeline colour,
 * and the big frequency, standing on the wallpaper, takes the LIST text colour. Each falls back to
 * the stock colour, so a screen with no theme looks as it did — except the ground, whose fallback
 * is {@code bg_submenu}'s colour rather than the ruler's own.
 */
public final class Fm {

    private Fm() { }

    /** {@code bg_submenu}'s own colour, as every other box the mod paints falls back to. */
    private static final int BACK = 0xFF8C94B2;
    private static final int PLAIN = Color.WHITE;
    private static final int NOW = 0xFFFFB600;

    /** A small tick against a half-MHz one: the same colour, one step weaker. */
    private static final int FAINT = 0xCC000000;            // 80%

    /** The ruler's ground — the menu's background, opaque: nothing shows through a panel. */
    public static int back() {
        try {
            Integer c = ThemeManager.INSTANCE.menuBGColor();
            if (c != null) return c.intValue() | 0xFF000000;
        } catch (Throwable t) {
            // malformed theme colour -> stock ground
        }
        return BACK;
    }

    /** The frequency labels and the half-MHz ticks. */
    public static int plain() {
        int c = Icons.menuColor();
        return c == 0 ? PLAIN : c;
    }

    /** The small ticks: the half-MHz ticks' colour one step weaker, never a second colour. */
    public static int small() {
        return faint(plain());
    }

    /** The line on the frequency being played, and the marker of a kept station. */
    public static int now() {
        int c = Icons.progressColor();
        return c == 0 ? NOW : c;
    }

    /** The same colour, one step weaker: full hue at 80% opacity. */
    public static int faint(int c) {
        return (c & 0x00FFFFFF) | FAINT;
    }

    /** The ruler's ground, from {@code FmView.onDraw} in place of its own {@code drawRGB}. */
    public static void ground(Canvas c) {
        if (c == null) return;
        try {
            c.drawColor(back());
        } catch (Throwable t) {
            // ignore
        }
    }

    /**
     * The marker of a station, DRAWN rather than the artwork recoloured: {@code icon_fm_mark} and
     * {@code icon_fm_collect_mark} carry a black shadow beside the diamond, and a tint paints the
     * shadow too. Its size comes from the artwork ({@link #geometry}), which is what keeps it
     * where stock put it — the draw site computes x from the frequency and expects that size.
     *
     * A found station is the same diamond filled with the GROUND: opaque, so it covers the line
     * of the played frequency instead of letting it through the shape.
     */
    public static Bitmap diamond(boolean kept) {
        int want = kept ? now() : back();
        int edge = plain();
        Bitmap b = kept ? keptBm : foundBm;
        if (b != null && !b.isRecycled()
                && (kept ? keptColor : foundColor) == want
                && (kept ? keptEdge : foundEdge) == edge) return b;
        b = draw(want, edge);
        if (b == null) return kept ? keptBm : foundBm;
        if (kept) { keptBm = b; keptColor = want; keptEdge = edge; }
        else { foundBm = b; foundColor = want; foundEdge = edge; }
        return b;
    }

    private static Bitmap keptBm;
    private static Bitmap foundBm;
    private static int keptColor;
    private static int foundColor;
    private static int keptEdge;
    private static int foundEdge;

    /** The artwork's own geometry: width, height, and the box the solid pixels sit in. */
    private static int[] box;

    /** The outline's width, px. The device is 160 dpi, so this is also its dp. */
    private static final float EDGE = 2f;

    private static Bitmap draw(int colour, int edge) {
        try {
            int[] g = geometry();
            if (g == null) return null;
            Bitmap b = Bitmap.createBitmap(g[0], g[1], Bitmap.Config.ARGB_8888);
            Canvas c = new Canvas(b);
            float left = g[2] - 0.5f, top = g[3] - 0.5f;
            float right = g[4] + 1.5f, bottom = g[5] + 1.5f;
            float cx = (left + right) / 2f, cy = (top + bottom) / 2f;
            float a = (right - left) / 2f, h = (bottom - top) / 2f;

            Paint paint = new Paint();
            paint.setAntiAlias(true);
            paint.setColor(colour);
            paint.setStyle(Paint.Style.FILL);
            c.drawPath(path(cx, cy, a, h), paint);

            // The outline sits INSIDE the shape, so the marker keeps the artwork's size. Pulling
            // a diamond in by d is not scaling it by d: its faces stand at a*h/hypot(a,h) from
            // the centre, and that is the distance which has to lose half the stroke's width.
            float k = 1f - (EDGE / 2f) * (float) Math.sqrt(a * a + h * h) / (a * h);
            if (k > 0f) {
                paint.setColor(edge);
                paint.setStyle(Paint.Style.STROKE);
                paint.setStrokeWidth(EDGE);
                c.drawPath(path(cx, cy, a * k, h * k), paint);
            }
            return b;
        } catch (Throwable t) {
            return null;
        }
    }

    private static Path path(float cx, float cy, float a, float b) {
        Path p = new Path();
        p.moveTo(cx, cy - b);
        p.lineTo(cx + a, cy);
        p.lineTo(cx, cy + b);
        p.lineTo(cx - a, cy);
        p.close();
        return p;
    }

    /** Measured once off the artwork: {@code w, h, left, top, right, bottom}. */
    private static int[] geometry() {
        if (box != null) return box;
        Context ctx = Y1Application.Companion.getAppContext();
        if (ctx == null) return null;
        Bitmap src = BitmapFactory.decodeResource(ctx.getResources(), R.drawable.icon_fm_mark);
        if (src == null) return null;
        int w = src.getWidth(), h = src.getHeight();
        int l = w, t = h, r = -1, b = -1;
        for (int y = 0; y < h; y++) {
            for (int x = 0; x < w; x++) {
                // Half opaque is the cut: the shadow never reaches it, the shape's own edge does.
                if ((src.getPixel(x, y) >>> 24) < 0xC0) continue;
                if (x < l) l = x;
                if (x > r) r = x;
                if (y < t) t = y;
                if (y > b) b = y;
            }
        }
        src.recycle();
        if (r < 0) return null;
        box = new int[] { w, h, l, t, r, b };
        return box;
    }

    /**
     * Everything on the screen that is not drawn by the ruler itself. Called from
     * {@code FMMainActivity.initView}; a theme switch recreates the Activity, so once is enough.
     */
    public static void screen(ActivityFmmainBinding vb) {
        if (vb == null) return;
        try {
            // The big frequency stands on the wallpaper, not on the ruler: the LIST text colour,
            // the same one the player's own lines take. Both labels, so "MHz" cannot part company
            // with the number it belongs to.
            ThemeManager.INSTANCE.itemSetTextColor(vb.mainDiantai, PLAIN, false);
            ThemeManager.INSTANCE.itemSetTextColor(vb.mainDiantai2,
                    vb.mainDiantai.getCurrentTextColor(), false);
            // Before the outlines: each of those copies the size of the label it stands behind.
            unit(vb.mainDiantai, vb.mainDiantai2);
            int edge = Icons.themeSelColor();
            outline(vb.mainDiantai, edge);
            outline(vb.mainDiantai2, edge);

            // The panel behind the ruler and the scroll view inside it: @color/white over
            // @color/black in the layout, both of them visible for as long as the ruler has not
            // drawn itself over them.
            int back = back();
            vb.tuneFrequency.setBackgroundColor(back);
            vb.radioRuler.setBackgroundColor(back);

            volume(vb.mainVolumeSeekbar);
        } catch (Throwable t) {
            // the screen in stock colours is better than no screen
        }
    }

    /** The outline round the big frequency, px. */
    private static final float TEXT_EDGE = 1f;

    /** ...and how solid: an outline states the shape, it does not compete with the fill. */
    private static final int TEXT_EDGE_ALPHA = 0x80000000;   // 50%

    /**
     * Size "MHz" so that its top sits halfway up the number beside it — the two share a baseline,
     * so both are one measurement: how far above it the glyphs reach. Measured rather than taken
     * as a fraction of the number's size, because a font's cap height is its own business, and
     * measured on the NUMBER's own text, a font with old-style figures having several heights.
     */
    private static void unit(TextView number, TextView unit) {
        if (number == null || unit == null) return;
        String n = number.getText() == null ? "" : number.getText().toString();
        if (n.length() == 0) n = "0";
        String u = unit.getText() == null ? "" : unit.getText().toString();
        if (u.length() == 0) return;

        Rect r = new Rect();
        number.getPaint().getTextBounds(n, 0, n.length(), r);
        float half = -r.top / 2f;                  // baseline to the middle of the digits
        if (half <= 0f) return;

        // Bounds are linear in the text size, so one measurement answers for every size.
        Paint p = new Paint(unit.getPaint());
        p.setTextSize(100f);
        Rect ur = new Rect();
        p.getTextBounds(u, 0, u.length(), ur);
        if (ur.top >= 0) return;
        unit.setTextSize(TypedValue.COMPLEX_UNIT_PX, 100f * half / -ur.top);
    }

    /**
     * Outline the label in the row-highlight colour. A TextView paints its text once and in one
     * style, so this is a second label behind the first carrying the text in STROKE only, kept in
     * step by a watcher on the original.
     *
     * BEHIND, at twice the width, is what makes the outline an outer one: a stroke straddles the
     * contour, and the fill covers the half that falls inside the glyph. With no theme there is no
     * highlight colour to use and nothing is added at all.
     */
    private static void outline(TextView src, int colour) {
        if (src == null || colour == 0) return;
        ViewParent vp = src.getParent();
        if (!(vp instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) vp;

        TextView o = new TextView(src.getContext());
        ViewGroup.LayoutParams lp = src.getLayoutParams();
        if (lp instanceof ConstraintLayout.LayoutParams) {
            // Fresh params, not the same object and not the copy constructor: both would leave the
            // clone sharing the original's layout widget, laid out in its frame and never measured.
            o.setLayoutParams(Pad.copy((ConstraintLayout.LayoutParams) lp));
        } else if (lp != null) {
            o.setLayoutParams(new ViewGroup.LayoutParams(lp));
        }
        o.setTypeface(src.getTypeface());
        o.setTextSize(TypedValue.COMPLEX_UNIT_PX, src.getTextSize());
        o.setIncludeFontPadding(src.getIncludeFontPadding());
        o.setGravity(src.getGravity());
        o.setPadding(src.getPaddingLeft(), src.getPaddingTop(),
                src.getPaddingRight(), src.getPaddingBottom());
        o.setText(src.getText());
        o.setTextColor((colour & 0x00FFFFFF) | TEXT_EDGE_ALPHA);
        o.getPaint().setStyle(Paint.Style.STROKE);
        o.getPaint().setStrokeWidth(TEXT_EDGE * 2f);
        o.getPaint().setStrokeJoin(Paint.Join.ROUND);
        group.addView(o, group.indexOfChild(src));
        src.addTextChangedListener(new Echo(o));
    }

    /** Keeps an outline label showing what the label under it shows. */
    static final class Echo implements TextWatcher {
        private final TextView out;

        Echo(TextView out) {
            this.out = out;
        }

        public void beforeTextChanged(CharSequence s, int start, int count, int after) { }

        public void onTextChanged(CharSequence s, int start, int before, int count) { }

        public void afterTextChanged(Editable s) {
            try {
                out.setText(s);
            } catch (Throwable t) {
                // an outline left behind is better than a crash on a frequency step
            }
        }
    }

    /**
     * The volume bar: its groove is the ruler's ground and the part that moves is the timeline
     * colour — it is a progress bar, and that is the colour every progress bar here has.
     *
     * The drawable is MUTATED first: it comes from resources and is shared with whatever else
     * inflates it, so a filter set on it as it stands travels to other screens.
     */
    private static void volume(SeekBar sb) {
        if (sb == null) return;
        Drawable d = sb.getProgressDrawable();
        if (!(d instanceof LayerDrawable)) return;
        LayerDrawable l = (LayerDrawable) d.mutate();
        Drawable groove = l.findDrawableByLayerId(android.R.id.background);
        Drawable bar = l.findDrawableByLayerId(android.R.id.progress);
        if (groove != null) groove.setColorFilter(back(), PorterDuff.Mode.SRC_IN);
        if (bar != null) bar.setColorFilter(now(), PorterDuff.Mode.SRC_IN);
        sb.setProgressDrawable(l);
    }

    /**
     * Put the ruler where the frequency is, at once, from the top of
     * {@code FMMainActivity.scrollRuler}. True when it did, and stock's delayed coroutine is then
     * skipped: it would cost a second frame per step. False while the ruler has no width yet —
     * the delayed pass is what catches that.
     */
    public static boolean ruler(HorizontalScrollView sv, FmView ruler, float frequency) {
        if (sv == null || ruler == null) return false;
        try {
            if (sv.getWidth() <= 0) return false;
            sv.scrollTo(ruler.setFrequency(frequency), 0);
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    /** Stock's tick spacing on the ruler, px, and its first tick's x. */
    private static final int TICK = 20;

    /**
     * The last tick {@code FmView.drawLines} draws: only the window and a screen's width each side,
     * not the whole ~4000 px ruler on every wheel step. The margin covers a scroll that does not
     * redraw. A mirrored layout draws everything.
     */
    public static int lastTick(android.view.View ruler, int last) {
        int[] w = window(ruler);
        return w == null ? last : Math.max(0, Math.min(last, (w[1] - TICK) / TICK + 1));
    }

    /** The first tick drawn; never past {@code last}, or the loop would not stop on it. */
    public static int firstTick(android.view.View ruler, int last) {
        int[] w = window(ruler);
        return w == null ? 0 : Math.max(0, Math.min(last, (w[0] - TICK) / TICK - 1));
    }

    /** The span of the ruler worth drawing, in its own x: the window plus a window each side. */
    private static int[] window(android.view.View ruler) {
        try {
            if (ruler == null || ruler.getLayoutDirection() == android.view.View.LAYOUT_DIRECTION_RTL) {
                return null;
            }
            ViewParent p = ruler.getParent();
            if (!(p instanceof HorizontalScrollView)) return null;
            HorizontalScrollView sv = (HorizontalScrollView) p;
            int pw = sv.getWidth();
            if (pw <= 0) return null;
            int x = sv.getScrollX();
            return new int[]{x - pw, x + 2 * pw};
        } catch (Throwable t) {
            return null;
        }
    }
}
