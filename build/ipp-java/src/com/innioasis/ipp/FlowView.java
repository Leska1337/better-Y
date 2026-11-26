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
 * and pushed back (further turned and packed closer with five or seven albums on screen), the
 * centre one flat at its own size, applied continuously in
 * {@code d = i - pos} so a slide is where it is because of pos alone and the animation is only
 * pos moving toward the target. Each slide is one bitmap under a perspective matrix, drawn twice:
 * as the cover and, turned over, as its reflection. On this device the row costs ~0.4 ms of main
 * thread a frame, against ~11 ms for PictureFlow's own column renderer.
 */
public final class FlowView extends View {

    // Per albums on screen (Flow.COUNTS): the side covers' angle and the step between them; five
    // and seven turn the covers further and pack them closer. Seven's step is worked out by fit.
    private static final float[] ANGLES = { 70f, 75f, 80f };
    private static final float[] STEPS = { 40f, 64f, 40f };
    /** How far the side covers are pushed back past their own turn, in cover sizes: 0, the outer edge is the centre cover's height. */
    private static final float DEPTH = 0f;
    /** Covers drawn on each side; the outermost pair fades out. */
    private static final int SIDE = 6;
    /** How far past the screen's edge the outermost cover shown reaches: the filtered edge is soft. */
    private static final float EDGE_OUT = 2f;

    private float angle;
    private float spacing;
    /** Covers on each side at rest: the last of them reaches the screen's edge and hides the rest. */
    private int side;
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

    /** Slides that arrive while the screen opens stand there at once. */
    private final long calm = SystemClock.uptimeMillis() + 900;

    /** The screen is still opening: what arrives now is shown without fading in. */
    public boolean calm() {
        return SystemClock.uptimeMillis() < calm;
    }

    private float offX;
    private float offY;

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
        setCount(Flow.count(c));
        // the slides erase what stands behind them, which needs a layer of their own over the wallpaper
        setLayerType(LAYER_TYPE_HARDWARE, null);
        erase.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.DST_OUT));
        int fg = textColor(c);
        shadow = lum(fg) > 128 ? 0xC0000000 : 0x80FFFFFF;
        name.setColor(fg);
        name.setTextSize(22);
        name.setTypeface(Typeface.create(Typeface.MONOSPACE, Typeface.BOLD));
        name.setFakeBoldText(true);
        name.setTextAlign(Paint.Align.CENTER);
        name.setShadowLayer(2, 0, 1, shadow);
        artist.setColor(fg);
        artist.setTextSize(19);
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

    /** Albums on screen at rest: 3, 5 or 7. */
    public void setCount(int n) {
        int i = n <= 3 ? 0 : n <= 5 ? 1 : 2;
        side = (n - 1) / 2;
        angle = (float) Math.toRadians(ANGLES[i]);
        spacing = STEPS[i];
        float half = Flow.S / 2f;
        offX = half * (1f - (float) Math.cos(angle)) + Flow.S;
        offY = half * (float) Math.sin(angle) + Flow.S * DEPTH;
        fit();
        invalidate();
    }

    /**
     * Moves the side covers out until the outer edge of the last one shown at rest is past the
     * screen's: the covers behind it are then hidden by it, not faded out. The picture's edge, not
     * the slide's transparent frame round it, or a sliver of the next cover shows beside it. With
     * seven every side cover shows the same strip: the first from the centre cover's edge to its
     * outer edge, as wide as the step between the outer edges of the rest; its inner edge lies
     * behind the centre cover, as on the iPod.
     */
    private void fit() {
        if (w <= 0 || h <= 0) return;
        float u = Flow.S / 2f;
        float cos = (float) Math.cos(angle);
        // corner() solved for the centre x that projects the last one's edge u to w + EDGE_OUT
        float cx = (w / 2f + EDGE_OUT) * (h + Flow.S * DEPTH) / h - u * cos;
        if (side >= 3) {
            // the first one's outer edge one step past the centre cover's edge, the last one's at cx
            float scale = h / (h + Flow.S * DEPTH);
            spacing = (cx - (u / scale - u * cos)) / side;
            offX = u / scale - u * cos + spacing;
        } else {
            offX = cx - spacing * (side - 1);
        }
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
        if (Diag.MEASURE && !stepPending) {
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

    /** Slides a far trip starts short of its end: at the row's top speed a long one took seconds. */
    private static final int FAR = 10;

    /** Travels to slide {@code t}; from further than FAR it starts FAR slides short of it. */
    public void goTo(int t) {
        if (items == null || items.isEmpty()) return;
        t = Math.max(0, Math.min(items.size() - 1, t));
        if (t == target && pos == target) return;
        if (Math.abs(t - pos) > FAR) pos = t > pos ? t - FAR : t + FAR;
        target = t;
        hurry = false;
        loader.aim(t);
        last = 0;
        postInvalidateOnAnimation();
    }

    /** The centre slide, reflection and all, is drawn by the card on top while it turns. */
    public void hide(int i) {
        hidden = i;
        invalidate();
    }

    private Card turning;

    /**
     * The card turning over the hidden slide, or null for a picture that lands on it flat. The row
     * draws the card itself, last and in the pose the card's animation gives it: on top of the
     * neighbours, erasing only what it covers. Drawn by a view of its own, it could not erase them,
     * and the neighbours tucked behind it showed through its reflection.
     */
    public void turnedBy(Card v) {
        if (turning != null) turning.byRow = false;
        turning = v;
        if (v != null) v.byRow = true;
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
        fit();
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

    // ---- Diag.MEASURE: frames of the row's own animation ------------------------------------

    /** What runs in the background meanwhile, set by the screen. */
    public static volatile boolean busyTracks, busyPic, busyGc;
    private static final long SLOW_FRAME = 40L;
    private long prevDraw, fStart, fWorst;
    private boolean prevAnim, moving0;
    private int fFrames, fSlow;
    // from the wheel's key event to the first frame that moves
    private long stepKey, stepAt, latMax, latSum;
    private boolean stepPending;
    private int fSteps, fLate;

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
        if (!Diag.MEASURE) {
            draw0(c);
            return;
        }
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
                if (fLate == 0) Diag.cpu("flow step late");
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
            if (turning != null && turning.getVisibility() == VISIBLE) {
                turning.drawOn(c, erase);
                // redrawn each frame while the card turns, but not once it stands edge-on: that frame
                // is the track list's first, and a repaint of the row on top of it cost it a frame
                if (Math.abs(turning.getRotationY()) < 89.5f) fading = true;
            }
            Flow.Item it = (Flow.Item) items.get(Math.max(0, Math.min(n - 1, ci)));
            float cx = w / 2f;
            int ta = (int) (255 * (1f - Math.min(1f, spread * 2f)) * labels);
            if (ta != shadowAt) {
                shadowAt = ta;
                name.setAlpha(ta);
                artist.setAlpha(ta * ARTIST_ALPHA / 255);
                name.setShadowLayer(2, 0, 1, faded(shadow, ta));
                artist.setShadowLayer(2, 0, 1, faded(shadow, ta));
            }
            lines(it);
            c.drawText(nameFit, cx, h - 46, name);
            c.drawText(artistFit, cx, h - 19, artist);
        }
        if (moving || fading) postInvalidateOnAnimation();
        if (wasMoving && !moving && onRest != null) post(onRest);
        wasMoving = moving;
    }

    private int yearAt;
    // the last lines built, so a frame of an unchanged label allocates nothing
    private Flow.Item lineOf;
    private String lineArtist, lineYear, nameLine, artistLine;
    // the same lines cut to the width they were cut for; and the alpha the paints were last given
    private String nameFit, artistFit;
    private int fitW = -1, shadowAt = -1;

    /** Where the release year goes, the screen's setting: one of Flow.YEAR_*. */
    public void setYears(int at) {
        if (yearAt == at) return;
        yearAt = at;
        lineOf = null;
        invalidate();
    }

    private void lines(Flow.Item it) {
        String a = it.artist, y = it.year;
        if (it == lineOf && a == lineArtist && y == lineYear && fitW == w) return;
        lineOf = it;
        lineArtist = a;
        lineYear = y;
        fitW = w;
        nameLine = Flow.albumLine(it.name, y, yearAt);
        artistLine = Flow.artistLine(a, y, yearAt);
        nameFit = TextUtils.ellipsize(nameLine, name, w - 24, TextUtils.TruncateAt.END).toString();
        artistFit = TextUtils.ellipsize(artistLine, artist, w - 24, TextUtils.TruncateAt.END).toString();
    }

    private float sAngle, sCx, sCy;
    private int sAlpha;

    /** PictureFlow's slide state, continuous in d. */
    private void place(float d) {
        float ad = Math.abs(d);
        float sg = d < 0 ? -1f : 1f;
        if (ad <= 1f) {
            sAngle = -sg * angle * ad;
            sCx = sg * offX * ad;
            sCy = offY * ad;
        } else {
            sAngle = -sg * angle;
            sCx = sg * (offX + spacing * (ad - 1f));
            sCy = offY;
        }
        float b = (SIDE - ad) / 2f;
        sAlpha = b >= 1f ? 255 : b <= 0f ? 0 : (int) (b * 255);
    }

    private void slide(Canvas c, int i, int n) {
        // Hidden under the picture flying to or from the player, the slide still erases its place:
        // the picture's reflection is see-through, and the neighbours tucked behind the centre
        // showed through it. Under the turning card it is not drawn at all: the row draws the card.
        boolean ghost = i == hidden;
        if (i < 0 || i >= n) return;
        place(i - pos);
        if (sAlpha <= 0) return;
        Bitmap b = loader.get(i);
        if (b == null) return;
        int a = sAlpha;
        if (ghost && turning != null) return;
        long age = loader.age(i);
        if (age < FADE_MS && !ghost && SystemClock.uptimeMillis() - age > calm) {
            a = (int) (a * (age < 0 ? 0 : age) / FADE_MS);
            fading = true;
        }
        float cos = (float) Math.cos(sAngle), sin = (float) Math.sin(sAngle);
        float off = ghost || spread <= 0f ? 0f : (i < pos ? -spread : spread) * w;
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
        if (!ghost) c.drawBitmap(b, seamFrom, seamTo, bmpPaint);
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
        if (!ghost) {
            c.drawBitmap(b, reflFrom, reflTo, bmpPaint);
            c.drawBitmap(Flow.fade(), null, reflTo, fade);
        }
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
        if (a < 255 || ghost) c.drawBitmap(b, slideFrom, slideTo, erase);
        if (!ghost) c.drawBitmap(b, slideFrom, slideTo, bmpPaint);
        c.restore();
    }

    private final Rect slideFrom = new Rect(0, 0, Flow.SW, Flow.SH);
    private final RectF slideTo = new RectF(slideFrom);
    private final Rect reflFrom = Flow.MIR;
    private final Rect seamFrom = new Rect(0, Flow.S, Flow.SW, Flow.F + Flow.S);
    private final RectF seamTo = new RectF(seamFrom);
    private final RectF reflTo = new RectF(Flow.F, Flow.F + Flow.S - Flow.REFL, Flow.F + Flow.S, Flow.F + Flow.S);
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

        /** The row draws this card ({@link FlowView#turnedBy}): its own draw is skipped, its pose is used. */
        boolean byRow;

        public void setSlide(Bitmap s) {
            b = s;
            invalidate();
        }

        @Override
        protected void onDraw(Canvas c) {
            if (b == null || byRow) return;
            paint(c, null);
        }

        /** As this view would draw itself, on the row's canvas: each part first erases its place. */
        void drawOn(Canvas c, Paint erase) {
            if (b == null) return;
            c.save();
            c.translate(getLeft(), getTop());
            c.concat(getMatrix());
            erase.setAlpha(255);
            paint(c, erase);
            c.restore();
        }

        private void paint(Canvas c, Paint erase) {
            float x = Flow.PAD - Flow.F, y = Flow.PAD - Flow.F;
            float base = Flow.PAD + Flow.S;
            // as the row draws it: the seam's underlay, the reflection, then the cover over both
            to.set(x, base - Flow.F, x + Flow.SW, base);
            half.setAlpha(Flow.REFL_ALPHA);
            if (erase != null) c.drawBitmap(b, seam, to, erase);
            c.drawBitmap(b, seam, to, half);
            c.save();
            c.translate(0, 2 * base);
            c.scale(1, -1);
            to.set(x + Flow.F, base - Flow.REFL, x + Flow.F + Flow.S, base);
            if (erase != null) c.drawBitmap(b, from, to, erase);
            c.drawBitmap(b, from, to, paint);
            c.drawBitmap(Flow.fade(), null, to, fade);
            c.restore();
            to.set(x, y, x + Flow.SW, y + Flow.SH);
            if (erase != null) c.drawBitmap(b, whole, to, erase);
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
