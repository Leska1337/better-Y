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
 * The FM Radio screen: the frequency ruler, the big frequency over it and the volume bar.
 *
 * Every colour on that screen was written into the code that draws it — the ruler's own dark
 * ground, white ticks, a cyan tick every half-MHz, an orange line on the current frequency, and a
 * seek bar in two colours of its own — so the screen looked the same whatever theme was on, which
 * on a light theme means a dark slab across the bottom of it.
 *
 * Where each colour comes from, and why the ruler asks the MENU rather than the list: the ruler is
 * a panel laid over the screen with a ground of its own, which is what a submenu is, so its ground
 * is the menu's ({@code menuBackgroundColor}) and everything drawn on it takes the menu's text
 * colours — the plain one for the labels and the ticks, the small ones at 80% so they differ from
 * the half-MHz ones in weight rather than hue. The STATIONS are not furniture: the line on the
 * frequency being played and the marker of a station the user has kept take the timeline colour,
 * the accent the player's progress bar and its icons use; a station merely found by the search is
 * the same diamond filled with the ground instead, so it reads as an outline of one; both carry a
 * thin outline in the ticks' colour. The volume bar is a progress bar and takes the accent for the
 * same reason. The big frequency above all this is not on the panel at all — it stands on the
 * wallpaper like the player's own text — so it takes the LIST text colour.
 *
 * Every colour falls back to the stock one when the theme names none, so the default theme is
 * pixel-for-pixel what it was.
 */
public final class Fm {

    private Fm() { }

    /**
     * {@code bg_submenu}'s own colour — the menu's background when no theme names one, as every
     * other box the mod paints falls back to. The ruler's own {@code drawRGB(42, 43, 51)} is
     * deliberately NOT the fallback: it is a colour of nobody's, and a screen with no theme should
     * look like the rest of the app rather than like a slab of its own.
     */
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

    /**
     * The small ticks: {@link #plain} at 80%. They are the same furniture as the half-MHz ticks
     * and differ from them in weight, not in hue — a second colour there reads as a second kind
     * of thing.
     */
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
     * The marker of a station, DRAWN rather than tinted — a diamond in the colour asked for, on a
     * bitmap the size and shape of the artwork it replaces.
     *
     * The artwork cannot simply be recoloured: `icon_fm_mark`/`icon_fm_collect_mark` carry a black
     * SHADOW to the right of and below the diamond, which SRC_IN paints along with the shape
     * (it replaces the RGB and keeps the alpha), so the marker came out with a coloured smear
     * beside it. Invisible while the ruler was dark and the diamond was white; obvious the moment
     * either takes a theme's colour. No filter can tell a shadow from an edge, so the shape is
     * redrawn instead.
     *
     * Its size and position come from the ARTWORK, not from constants: the bounding box of the
     * pixels that are actually solid (the shadow is never more than half opaque), grown by half a
     * pixel so the antialiased edge sits where the drawn one did. That keeps the marker exactly
     * where stock put it — the draw site computes its x from the frequency and expects a bitmap
     * of this size.
     */
    public static Bitmap diamond(boolean kept) {
        // A kept station is filled with the accent; a found one is filled with the GROUND, so it
        // reads as an outline — and, being opaque, still covers the line of the played frequency
        // where the two meet. A translucent fill let that line through and the marker came out
        // looking like a diamond with a bar drawn across it.
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

            // The outline sits INSIDE the shape, so the marker keeps the size the artwork had.
            // A stroke straddles its path, so that path is the shape pulled in by half the width —
            // and pulling a diamond in by d is not scaling it by d: its faces stand at
            // a*h/hypot(a,h) from the centre, so that distance is what has to lose d.
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

    /**
     * Size "MHz" so that its top sits halfway up the number beside it. The two share a baseline
     * (the layout constrains them that way), so this is a question about one measurement each:
     * how far above the baseline the glyphs actually reach.
     *
     * MEASURED, not a fraction of the number's size — the label has to land on the half whatever
     * font the theme supplies, and a font's cap height is its own business. The number's own text
     * is what gets measured, because "87.5" and "102.5" reach the same height while an arbitrary
     * sample might not (a font with old-style figures has digits of several heights).
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

        // The unit's own reach, measured at a size of its own and scaled: bounds are linear in
        // the text size, so one measurement answers for every size.
        Paint p = new Paint(unit.getPaint());
        p.setTextSize(100f);
        Rect ur = new Rect();
        p.getTextBounds(u, 0, u.length(), ur);
        if (ur.top >= 0) return;
        unit.setTextSize(TypedValue.COMPLEX_UNIT_PX, 100f * half / -ur.top);
    }

    /**
     * Outline the label in the row-highlight colour, leaving its own fill alone.
     *
     * A TextView paints its text ONCE, in one style, so an outline of a second colour cannot come
     * from the label itself: a STROKE paint on it replaces the fill rather than joining it. The
     * outline is therefore a second label under the first — same font, same size, same layout
     * params, so it lands exactly behind it — carrying the text in STROKE only, and hung on the
     * original's text so the number stays in step as the wheel changes the frequency.
     *
     * UNDER, at twice the width, is what makes the outline an OUTER one. A stroke straddles the
     * glyph's contour, so half of it always falls inside the letter: drawn on top it eats into the
     * fill and the digits come out thinner. Drawn underneath, the fill covers that inner half and
     * only the outer half shows — which is why the width is doubled to leave {@link #TEXT_EDGE}
     * outside.
     *
     * Nothing happens with no theme: the row-highlight colour is the theme's alone (every screen
     * passes stock a highlight of its own), so there is nothing to outline with and the frequency
     * stands as it always did.
     */
    private static void outline(TextView src, int colour) {
        if (src == null || colour == 0) return;
        ViewParent vp = src.getParent();
        if (!(vp instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) vp;

        TextView o = new TextView(src.getContext());
        ViewGroup.LayoutParams lp = src.getLayoutParams();
        if (lp instanceof ConstraintLayout.LayoutParams) {
            // The copy constructor, not the same object: a params object belongs to one view, and
            // ConstraintLayout resolves state into it.
            o.setLayoutParams(new ConstraintLayout.LayoutParams((ConstraintLayout.LayoutParams) lp));
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
        o.setTextColor(colour);
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
     * Put the ruler where the frequency is, at once. Called from the top of
     * {@code FMMainActivity.scrollRuler}, which otherwise posts the move through a coroutine that
     * sleeps 50 ms first and then SMOOTH-scrolls: every wheel click restarted an animation, so the
     * ruler was always travelling towards a frequency the wheel had already left — the same
     * "let go of the wheel and it goes on scrolling" the RecyclerView screens had.
     *
     * The coroutine is left alone and still runs: a screen that has only just been built has a
     * ruler of zero width, where a scroll does nothing at all, and the delayed pass is what
     * catches that. By then it is a plain {@code scrollTo} to the same place, i.e. nothing moves.
     */
    public static void ruler(HorizontalScrollView sv, FmView ruler, float frequency) {
        if (sv == null || ruler == null) return;
        try {
            if (sv.getWidth() <= 0) return;
            sv.scrollTo(ruler.setFrequency(frequency), 0);
        } catch (Throwable t) {
            // ignore
        }
    }
}
