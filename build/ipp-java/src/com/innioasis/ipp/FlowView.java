package com.innioasis.ipp;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.RectF;
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
 * pos moving toward the target. Each slide is one bitmap under a perspective matrix, drawn twice:
 * as the cover and, turned over, as its reflection. On this device the row costs ~0.4 ms of main
 * thread a frame, against ~11 ms for PictureFlow's own column renderer.
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
    /** The same pair once the centre was pressed on a moving row: it closes in briskly. */
    private static final float HURRY_RATE = 14f;
    private static final float HURRY_VMIN = 6f;
    private boolean hurry;

    /** A slide fades in over this long once its cover is in hand, instead of popping up. */
    public static final int FADE_MS = 200;
    private boolean fading;

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
    /** The labels' shadow at full opacity; it does not follow the paint's alpha, so it is scaled by hand. */
    private int shadow;

    public FlowView(Context c) {
        super(c);
        offX = Flow.S / 2f * (1f - (float) Math.cos(ANGLE)) + Flow.S;
        offY = Flow.S / 2f * (float) Math.sin(ANGLE) + Flow.S / 4f;
        // the slides erase what stands behind them, which needs a layer of their own over the wallpaper
        setLayerType(LAYER_TYPE_HARDWARE, null);
        erase.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.DST_OUT));
        int fg = textColor(c);
        shadow = lum(fg) > 128 ? 0xC0000000 : 0x80FFFFFF;
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

    private static int faded(int c, int a) {
        return ((c >>> 24) * a / 255) << 24 | (c & 0xFFFFFF);
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

    /** The row stands still: the centre slide is where it was aimed. */
    public boolean resting() { return pos == target; }

    /** Speeds the row's remaining approach up; the next step or the arrival ends it. */
    public void hurry() {
        if (pos == target) return;
        hurry = true;
        postInvalidateOnAnimation();
    }

    private Runnable onRest;
    private boolean wasMoving;

    /** Posted each time the row comes to rest after moving. */
    public void setOnRest(Runnable r) { onRest = r; }

    public int count() { return items == null ? 0 : items.size(); }

    public void step(int dir) {
        if (items == null || items.isEmpty()) return;
        int t = Math.max(0, Math.min(items.size() - 1, target + dir));
        if (t == target) return;
        target = t;
        hurry = false;
        if (!stepPending) {
            long now = SystemClock.uptimeMillis();
            long k = Open.lastKey();
            stepKey = k > 0 && k <= now && now - k < 1000 ? k : now;
            stepAt = now;
            stepPending = true;
        }
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
        float v = Math.max(hurry ? HURRY_VMIN : VMIN,
                Math.min(VMAX, Math.abs(d) * (hurry ? HURRY_RATE : RATE)));
        float s = v * dt;
        if (s >= Math.abs(d)) pos = target;
        else pos += d > 0 ? s : -s;
        if (pos == target) hurry = false;
        return pos != target;
    }

    // ---- measurement: frames of the row's own animation -------------------------------------

    /** What runs in the background meanwhile, set by the screen (measurement). */
    public static volatile boolean busyTracks, busyPic, busyGc;
    private static final long SLOW_FRAME = 40L;
    private long prevDraw, fStart, fWorst;
    private boolean prevAnim;
    private int fFrames, fSlow;
    // from the wheel's key event to the first frame that moves
    private long stepKey, stepAt, latMax, latSum;
    private boolean stepPending;
    private int fSteps, fLate;

    /** To the app's log and to logcat, beside the collector's own lines. */
    private static void say(String s) {
        Diag.note(s);
        android.util.Log.i("ippflow", s);
    }

    private String busy() {
        StringBuilder b = new StringBuilder();
        if (loader != null) {
            if (loader.busy) b.append(", slide").append(loader.how);
            long ago = SystemClock.uptimeMillis() - loader.doneAt;
            if (loader.doneAt > 0 && ago < 300) b.append(", last slide ").append(ago).append(" ms ago").append(loader.doneHow);
        }
        if (busyTracks) b.append(", tracks");
        if (busyPic) b.append(", picture");
        if (busyGc) b.append(", gc");
        return b.toString();
    }

    @Override
    protected void onDraw(Canvas c) {
        long now = SystemClock.uptimeMillis();
        if (prevAnim) {
            long gap = now - prevDraw;
            fFrames++;
            if (gap > fWorst) fWorst = gap;
            if (gap >= SLOW_FRAME) {
                fSlow++;
                say("flow frame " + gap + " ms" + busy());
            }
        } else {
            fStart = now;
            fFrames = 0;
            fSlow = 0;
            fWorst = 0;
            fSteps = 0;
            fLate = 0;
            latMax = 0;
            latSum = 0;
        }
        if (stepPending) {
            stepPending = false;
            long lat = now - stepKey;
            fSteps++;
            latSum += lat;
            if (lat > latMax) latMax = lat;
            if (lat >= 60) {
                fLate++;
                say("flow step late " + lat + " ms, key to step " + (stepAt - stepKey) + busy());
            }
        }
        prevDraw = now;
        draw0(c);
        long end = SystemClock.uptimeMillis();
        if (end - now >= 15) say("flow draw " + (end - now) + " ms");
        boolean anim = moving0 || fading;
        if (prevAnim && !anim) {
            say("frames flow scroll worst " + fWorst + " ms, " + fFrames + " frames in "
                    + (now - fStart) + " ms, slow " + fSlow + "; steps " + fSteps + ", key to frame max "
                    + latMax + " mean " + (fSteps > 0 ? latSum / fSteps : 0) + ", late " + fLate);
        }
        prevAnim = anim;
    }

    private boolean moving0;

    private void draw0(Canvas c) {
        boolean moving = advance();
        moving0 = moving;
        fading = false;
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
            name.setShadowLayer(2, 0, 1, faded(shadow, ta));
            artist.setShadowLayer(2, 0, 1, faded(shadow, ta));
            c.drawText(TextUtils.ellipsize(it.name, name, w - 24, TextUtils.TruncateAt.END).toString(),
                    cx, h - 40, name);
            c.drawText(TextUtils.ellipsize(it.artist, artist, w - 24, TextUtils.TruncateAt.END).toString(),
                    cx, h - 14, artist);
        }
        if (moving || fading) postInvalidateOnAnimation();
        if (wasMoving && !moving && onRest != null) post(onRest);
        wasMoving = moving;
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
        int a = sAlpha;
        long age = loader.age(i);
        if (age < FADE_MS) {
            a = (int) (a * (age < 0 ? 0 : age) / FADE_MS);
            fading = true;
        }
        float cos = (float) Math.cos(sAngle), sin = (float) Math.sin(sAngle);
        float off = spread > 0f ? (i < pos ? -spread : spread) * w : 0f;
        float half = Flow.S / 2f + Flow.F;
        int edge = Flow.F + Flow.S;     // the cover's bottom row in the slide

        erase.setAlpha(a);

        // Under the cover's soft bottom edge, the cover's last rows at the reflection's opacity:
        // the edge blends into what the reflection starts with instead of cutting a step.
        corner(0, -half, BASE - Flow.F, cos, sin);
        corner(2, half, BASE - Flow.F, cos, sin);
        corner(4, half, BASE, cos, sin);
        corner(6, -half, BASE, cos, sin);
        quad(edge - Flow.F, edge, off);
        if (!m.setPolyToPoly(src, 0, dst, 0, 4)) return;
        c.save();
        c.concat(m);
        c.drawBitmap(b, seamFrom, seamTo, erase);
        bmpPaint.setAlpha(a * Flow.REFL_ALPHA / 255);
        c.drawBitmap(b, seamFrom, seamTo, bmpPaint);
        c.restore();

        // The reflection: the slide's small mirror stretched and turned over under the cover, as the
        // player's. It is see-through, so what is behind it is cleared first, then drawn and faded.
        corner(0, -half, BASE, cos, sin);
        corner(2, half, BASE, cos, sin);
        corner(4, half, BASE + Flow.REFL, cos, sin);
        corner(6, -half, BASE + Flow.REFL, cos, sin);
        quad(edge, edge - Flow.REFL, off);
        if (!m.setPolyToPoly(src, 0, dst, 0, 4)) return;
        bmpPaint.setAlpha(a);
        c.save();
        c.concat(m);
        c.drawBitmap(b, reflFrom, reflTo, erase);
        c.drawBitmap(b, reflFrom, reflTo, bmpPaint);
        c.drawBitmap(Flow.fade(), null, reflTo, fade);
        c.restore();

        // the cover over it: the whole slide, frame and all
        corner(0, -half, BASE - Flow.S - Flow.F, cos, sin);
        corner(2, half, BASE - Flow.S - Flow.F, cos, sin);
        corner(4, half, BASE + Flow.F, cos, sin);
        corner(6, -half, BASE + Flow.F, cos, sin);
        quad(0, Flow.SH, off);
        if (!m.setPolyToPoly(src, 0, dst, 0, 4)) return;
        c.save();
        c.concat(m);
        if (a < 255) c.drawBitmap(b, slideFrom, slideTo, erase);
        c.drawBitmap(b, slideFrom, slideTo, bmpPaint);
        c.restore();
    }

    private final Rect slideFrom = new Rect(0, 0, Flow.SW, Flow.SH);
    private final RectF slideTo = new RectF(slideFrom);
    private final Rect reflFrom = Flow.MIR;
    private final Rect seamFrom = new Rect(0, Flow.S, Flow.SW, Flow.F + Flow.S);
    private final RectF seamTo = new RectF(seamFrom);
    private final RectF reflTo = new RectF(0, Flow.F + Flow.S - Flow.REFL, Flow.SW, Flow.F + Flow.S);
    private final Paint fade = fadePaint();

    private static Paint fadePaint() {
        Paint p = new Paint(Paint.FILTER_BITMAP_FLAG);
        p.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.DST_IN));
        return p;
    }

    /**
     * Source corners in the slide for the destination corners just set: x across, the rows at
     * the destination's top edge {@code y0} and at its bottom edge {@code y1}.
     */
    private void quad(float y0, float y1, float off) {
        float sw = Flow.SW;
        src[0] = 0; src[1] = y0;
        src[2] = sw; src[3] = y0;
        src[4] = sw; src[5] = y1;
        src[6] = 0; src[7] = y1;
        if (off != 0f) for (int k = 0; k < 8; k += 2) dst[k] += off;
    }

    /**
     * The centre slide as the flip turns it: the cover at {@link Flow#PAD} in, its reflection
     * under it as the row draws one. A layer of its own, so the fade's DST_IN touches nothing else.
     */
    public static final class Card extends View {
        private Bitmap b;
        private final Paint paint = new Paint(Paint.FILTER_BITMAP_FLAG);
        private final Paint fade = fadePaint();
        private final Rect from = Flow.MIR;
        private final Rect whole = new Rect(0, 0, Flow.SW, Flow.SH);
        private final Rect seam = new Rect(0, Flow.S, Flow.SW, Flow.F + Flow.S);
        private final Paint half = new Paint(Paint.FILTER_BITMAP_FLAG);
        private final RectF to = new RectF();

        public Card(Context c) {
            super(c);
            setLayerType(LAYER_TYPE_HARDWARE, null);
        }

        public void setSlide(Bitmap s) {
            b = s;
            invalidate();
        }

        @Override
        protected void onDraw(Canvas c) {
            if (b == null) return;
            float x = Flow.PAD - Flow.F, y = Flow.PAD - Flow.F;
            float base = Flow.PAD + Flow.S;
            // as the row draws it: the seam's underlay, the reflection, then the cover over both
            to.set(x, base - Flow.F, x + Flow.SW, base);
            half.setAlpha(Flow.REFL_ALPHA);
            c.drawBitmap(b, seam, to, half);
            c.save();
            c.translate(0, 2 * base);
            c.scale(1, -1);
            to.set(x, base - Flow.REFL, x + Flow.SW, base);
            c.drawBitmap(b, from, to, paint);
            c.drawBitmap(Flow.fade(), null, to, fade);
            c.restore();
            to.set(x, y, x + Flow.SW, y + Flow.SH);
            c.drawBitmap(b, whole, to, paint);
        }
    }

    /** Slide point (u across the slide, y the screen row it has at rest) to the screen. */
    private void corner(int k, float u, float y, float cos, float sin) {
        float x = sCx + u * cos;
        float z = h + sCy + u * sin;
        dst[k] = w / 2f + h * x / z;
        dst[k + 1] = ANCHOR + (y - ANCHOR) * h / z;
    }
}
