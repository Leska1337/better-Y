package com.innioasis.ipp;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Typeface;
import android.os.SystemClock;
import android.text.TextPaint;
import android.text.TextUtils;
import android.view.View;
import android.widget.TextView;

import com.innioasis.y1.theme.ThemeManager;

import java.util.List;

/**
 * The Cover Flow row. PictureFlow's geometry (Ariya Hidayat, MIT): side slides turned 70 degrees
 * and pushed back, the centre one flat at its own size, applied continuously in
 * {@code d = i - pos} so a slide is where it is because of pos alone and the animation is only
 * pos moving toward the target. Each slide is one bitmap under a perspective matrix: on this
 * device that costs ~0.4 ms of main thread a frame, against ~11 ms for PictureFlow's own column
 * renderer, and both hold the panel's 36 fps.
 */
public final class FlowView extends View {

    private static final float ANGLE = (float) Math.toRadians(70);
    private static final float SPACING = 40f;
    private static final int SIDE = 6;
    /** Screen row of the cover's bottom edge at rest. */
    private static final int BASE = 202;
    /** The row depth scales toward: two thirds down the cover, as in PictureFlow. */
    private static final int ANCHOR = BASE - Flow.S / 3;

    private static final float RATE = 8f;      // slides per second per slide still to go
    private static final float VMIN = 2.5f;
    private static final float VMAX = 30f;

    private final float offX;
    private final float offY;

    private List items;
    private Flow.Loader loader;

    private float pos;
    private int target;
    private long last;
    private int hidden = -1;

    private int w;
    private int h;

    private final Matrix m = new Matrix();
    private final float[] src = new float[8];
    private final float[] dst = new float[8];
    private final Paint bmpPaint = new Paint(Paint.FILTER_BITMAP_FLAG);
    private final Paint erase = new Paint(Paint.FILTER_BITMAP_FLAG);

    private final TextPaint name = new TextPaint(Paint.ANTI_ALIAS_FLAG);
    private final TextPaint artist = new TextPaint(Paint.ANTI_ALIAS_FLAG);
    /** The artist line is the name's colour, fainter — as at the head of the track list. */
    private static final int ARTIST_ALPHA = 0xB0;

    public FlowView(Context c) {
        super(c);
        offX = Flow.S / 2f * (1f - (float) Math.cos(ANGLE)) + Flow.S;
        offY = Flow.S / 2f * (float) Math.sin(ANGLE) + Flow.S / 4f;
        // the slides erase what stands behind them, which needs a layer of their own over the wallpaper
        setLayerType(LAYER_TYPE_HARDWARE, null);
        erase.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.DST_OUT));
        int fg = textColor(c);
        int shadow = lum(fg) > 128 ? 0xC0000000 : 0x80FFFFFF;
        name.setColor(fg);
        name.setTextSize(20);
        name.setTypeface(Typeface.create(Typeface.MONOSPACE, Typeface.BOLD));
        name.setFakeBoldText(true);
        name.setTextAlign(Paint.Align.CENTER);
        name.setShadowLayer(2, 0, 1, shadow);
        artist.setColor(fg);
        artist.setTextSize(17);
        artist.setTypeface(Typeface.MONOSPACE);
        artist.setTextAlign(Paint.Align.CENTER);
        artist.setShadowLayer(2, 0, 1, shadow);
    }

    /** The list rows' text colour, as the theme answers it. */
    private static int textColor(Context c) {
        try {
            TextView probe = new TextView(c);
            ThemeManager.INSTANCE.itemSetTextColor(probe, Color.WHITE, false);
            return probe.getCurrentTextColor();
        } catch (Throwable t) {
            return Color.WHITE;
        }
    }

    private static int lum(int p) {
        return (((p >> 16) & 0xFF) * 299 + ((p >> 8) & 0xFF) * 587 + (p & 0xFF) * 114) / 1000;
    }

    public void setItems(List items, Flow.Loader loader, int start) {
        this.items = items;
        this.loader = loader;
        target = start;
        pos = start;
        loader.aim(start);
        invalidate();
    }

    public int target() { return target; }

    public int count() { return items == null ? 0 : items.size(); }

    public void step(int dir) {
        if (items == null || items.isEmpty()) return;
        int t = Math.max(0, Math.min(items.size() - 1, target + dir));
        if (t == target) return;
        target = t;
        loader.aim(t);
        last = 0;
        postInvalidateOnAnimation();
    }

    /** The centre slide, reflection and all, is drawn by the card on top while it turns. */
    public void hide(int i) {
        hidden = i;
        invalidate();
    }

    /** Where the centre cover stands at rest. */
    public int coverLeft() { return w / 2 - Flow.S / 2; }

    public int coverTop() { return BASE - Flow.S; }

    private float spread;

    /** 0 the row as it stands; 1 every slide but the hidden one pushed off its side of the screen. */
    public void setSpread(float s) {
        spread = s;
        invalidate();
    }

    public float getSpread() { return spread; }

    private float labels = 1f;

    /** Opacity of the name and artist under the row: 0 while the centre cover is turned over. */
    public void setLabels(float a) {
        labels = a;
        invalidate();
    }

    public float getLabels() { return labels; }

    @Override
    protected void onSizeChanged(int nw, int nh, int ow, int oh) {
        w = nw;
        h = nh;
    }

    private boolean advance() {
        long now = SystemClock.uptimeMillis();
        float dt = last == 0 ? 0.016f : Math.min(0.1f, (now - last) / 1000f);
        last = now;
        float d = target - pos;
        if (d == 0) return false;
        float v = Math.max(VMIN, Math.min(VMAX, Math.abs(d) * RATE));
        float s = v * dt;
        if (s >= Math.abs(d)) pos = target;
        else pos += d > 0 ? s : -s;
        return pos != target;
    }

    @Override
    protected void onDraw(Canvas c) {
        boolean moving = advance();
        int n = count();
        if (n > 0 && w > 0) {
            int ci = Math.round(pos);
            // back to front: the outermost pair first, the centre last
            for (int k = SIDE + 1; k >= 0; k--) {
                slide(c, ci - k, n);
                if (k != 0) slide(c, ci + k, n);
            }
            Flow.Item it = (Flow.Item) items.get(Math.max(0, Math.min(n - 1, ci)));
            float cx = w / 2f;
            int ta = (int) (255 * (1f - Math.min(1f, spread * 2f)) * labels);
            name.setAlpha(ta);
            artist.setAlpha(ta * ARTIST_ALPHA / 255);
            c.drawText(TextUtils.ellipsize(it.name, name, w - 24, TextUtils.TruncateAt.END).toString(),
                    cx, h - 40, name);
            c.drawText(TextUtils.ellipsize(it.artist, artist, w - 24, TextUtils.TruncateAt.END).toString(),
                    cx, h - 14, artist);
        }
        if (moving) postInvalidateOnAnimation();
    }

    private float sAngle, sCx, sCy;
    private int sAlpha;

    /** PictureFlow's slide state, continuous in d. */
    private void place(float d) {
        float ad = Math.abs(d);
        float sg = d < 0 ? -1f : 1f;
        if (ad <= 1f) {
            sAngle = -sg * ANGLE * ad;
            sCx = sg * offX * ad;
            sCy = offY * ad;
        } else {
            sAngle = -sg * ANGLE;
            sCx = sg * (offX + SPACING * (ad - 1f));
            sCy = offY;
        }
        float b = (SIDE - ad) / 2f;
        sAlpha = b >= 1f ? 255 : b <= 0f ? 0 : (int) (b * 255);
    }

    private void slide(Canvas c, int i, int n) {
        if (i < 0 || i >= n || i == hidden) return;
        place(i - pos);
        if (sAlpha <= 0) return;
        Bitmap b = loader.get(i);
        if (b == null) return;
        float cos = (float) Math.cos(sAngle), sin = (float) Math.sin(sAngle);
        float half = Flow.S / 2f + Flow.PAD;
        float top = BASE - Flow.S - Flow.PAD;
        float bot = BASE + Flow.REFL;
        corner(0, -half, top, cos, sin);
        corner(2, half, top, cos, sin);
        corner(4, half, bot, cos, sin);
        corner(6, -half, bot, cos, sin);
        if (spread > 0f) {
            float off = (i < pos ? -spread : spread) * w;
            for (int k = 0; k < 8; k += 2) dst[k] += off;
        }
        int bw = b.getWidth(), bh = b.getHeight();
        src[0] = 0; src[1] = 0;
        src[2] = bw; src[3] = 0;
        src[4] = bw; src[5] = bh;
        src[6] = 0; src[7] = bh;
        if (!m.setPolyToPoly(src, 0, dst, 0, 4)) return;
        // the reflection is see-through, so what is behind it is cleared first and does not show
        Bitmap mk = Flow.mask();
        if (mk != null) {
            erase.setAlpha(sAlpha);
            c.drawBitmap(mk, m, erase);
        }
        bmpPaint.setAlpha(sAlpha);
        c.drawBitmap(b, m, bmpPaint);
    }

    /** Slide point (u across the slide, y the screen row it has at rest) to the screen. */
    private void corner(int k, float u, float y, float cos, float sin) {
        float x = sCx + u * cos;
        float z = h + sCy + u * sin;
        dst[k] = w / 2f + h * x / z;
        dst[k + 1] = ANCHOR + (y - ANCHOR) * h / z;
    }
}
