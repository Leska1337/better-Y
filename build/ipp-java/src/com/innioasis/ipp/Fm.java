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
 * The FM Radio screen's colours and the ruler's scroll. The ruler is a panel, so it is dressed
 * from the theme's MENU section; stations and the volume bar take the timeline colour; the big
 * frequency, on the wallpaper, the LIST text colour. Each falls back to stock, except the ground,
 * which falls back to {@code bg_submenu}'s colour.
 */
public final class Fm {

    private Fm() { }

    private static final int BACK = 0xFF8C94B2;             // bg_submenu
    private static final int PLAIN = Color.WHITE;
    private static final int NOW = 0xFFFFB600;

    private static final int FAINT = 0xCC000000;            // 80%

    /** Opaque: nothing shows through a panel. */
    public static int back() {
        try {
            Integer c = ThemeManager.INSTANCE.menuBGColor();
            if (c != null) return c.intValue() | 0xFF000000;
        } catch (Throwable t) {
        }
        return BACK;
    }

    /** The frequency labels and the half-MHz ticks. */
    public static int plain() {
        int c = Icons.menuColor();
        return c == 0 ? PLAIN : c;
    }

    /** The small ticks: the same colour weaker, never a second colour. */
    public static int small() {
        return faint(plain());
    }

    /** The played frequency's line and a kept station's marker. */
    public static int now() {
        int c = Icons.progressColor();
        return c == 0 ? NOW : c;
    }

    public static int faint(int c) {
        return (c & 0x00FFFFFF) | FAINT;
    }

    /** From {@code FmView.onDraw} in place of its {@code drawRGB}. */
    public static void ground(Canvas c) {
        if (c == null) return;
        try {
            c.drawColor(back());
        } catch (Throwable t) {
        }
    }

    /**
     * A station marker, DRAWN: the artwork carries a shadow a tint would paint too. Sized from the
     * artwork, which the draw site expects. A found station is filled with the opaque ground, so
     * it covers the played frequency's line.
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

    private static int[] box;

    /** px (= dp at 160 dpi). */
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

            // The outline sits INSIDE, keeping the artwork's size: the faces stand at
            // a*h/hypot(a,h) from the centre, and that distance loses half the stroke.
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
                // The shadow never reaches this alpha; the shape's edge does.
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

    /** From {@code FMMainActivity.initView}; a theme switch recreates the Activity. */
    public static void screen(ActivityFmmainBinding vb) {
        if (vb == null) return;
        try {
            // "MHz" takes the number's colour, so the two never part.
            ThemeManager.INSTANCE.itemSetTextColor(vb.mainDiantai, PLAIN, false);
            ThemeManager.INSTANCE.itemSetTextColor(vb.mainDiantai2,
                    vb.mainDiantai.getCurrentTextColor(), false);
            // Before the outlines, which copy the label's size.
            unit(vb.mainDiantai, vb.mainDiantai2);
            int edge = Icons.themeSelColor();
            outline(vb.mainDiantai, edge);
            outline(vb.mainDiantai2, edge);

            // Visible until the ruler has drawn itself over them.
            int back = back();
            vb.tuneFrequency.setBackgroundColor(back);
            vb.radioRuler.setBackgroundColor(back);

            volume(vb.mainVolumeSeekbar);
        } catch (Throwable t) {
        }
    }

    private static final float TEXT_EDGE = 1f;

    private static final int TEXT_EDGE_ALPHA = 0x80000000;   // 50%

    /**
     * "MHz" sized so its top sits halfway up the number. Measured on the number's own text: cap
     * heights differ by font, and old-style figures have several.
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

        // Bounds are linear in the text size.
        Paint p = new Paint(unit.getPaint());
        p.setTextSize(100f);
        Rect ur = new Rect();
        p.getTextBounds(u, 0, u.length(), ur);
        if (ur.top >= 0) return;
        unit.setTextSize(TypedValue.COMPLEX_UNIT_PX, 100f * half / -ur.top);
    }

    /**
     * A STROKE-only copy of the label behind it, kept in step by a watcher. Behind and at twice the
     * width makes the outline an outer one: the fill covers the inner half. No theme, no outline.
     */
    private static void outline(TextView src, int colour) {
        if (src == null || colour == 0) return;
        ViewParent vp = src.getParent();
        if (!(vp instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) vp;

        TextView o = new TextView(src.getContext());
        ViewGroup.LayoutParams lp = src.getLayoutParams();
        if (lp instanceof ConstraintLayout.LayoutParams) {
            // Not shared and not copy-constructed: either would share the layout widget.
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
            }
        }
    }

    /** Mutated first: the drawable is shared, and an unmutated filter travels to other screens. */
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
     * Top of {@code FMMainActivity.scrollRuler}: true skips stock's delayed coroutine (a second
     * frame per step). False while the ruler has no width — the delayed pass catches that.
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

    /** A process was started from the app since {@code /dev/fm} was last (re)opened. */
    static volatile boolean dirty;

    /**
     * In {@code FmRadioService.powerUpFM}, right before the native power-up. A child process
     * closes its inherited {@code /dev/fm}, and the driver's state is spoilt for the next
     * power-up: slow, then the HAL's I2S setup fails and the chip answers nothing. Closing and
     * opening the device again gives a clean one.
     */
    public static void reopen() {
        if (!dirty) return;
        dirty = false;
        try {
            com.mediatek.FMRadio.FMRadioNative.closedev();
            boolean ok = com.mediatek.FMRadio.FMRadioNative.opendev();
            Diag.note("fm: /dev/fm reopened after a child process, " + (ok ? "ok" : "FAILED"));
        } catch (Throwable t) {
        }
    }

    /** FM on screen or playing: no process may be started from the app then (Panel.exec). */
    static boolean busy() {
        try {
            android.app.Activity a = Open.screen();
            if (a != null && a.getClass().getName().startsWith("com.innioasis.fm.")) return true;
            Object v = com.innioasis.y1.utils.Static.INSTANCE.getPlayValue().getValue();
            return v instanceof Integer && ((Integer) v).intValue() == 4;
        } catch (Throwable t) {
            return false;
        }
    }

    /** In the ruler's x: the window plus a window each side. */
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
