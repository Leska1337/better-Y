package com.innioasis.ipp;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.Shader;
import android.view.ViewGroup;
import android.widget.ImageView;

import com.innioasis.y1.Y1Application;
import com.innioasis.y1.base.BasePlayerActivity;
import com.innioasis.y1.databinding.ActivityMusicPlayerBinding;
import com.innioasis.y1.view.ReflectImageView;

import java.lang.ref.WeakReference;

/**
 * The Now-Playing cover: its bitmap geometry, its 3D tilt and its reflection.
 *
 * <p>The geometry half moved here from {@code Ipp} in v0.31.9. It had to: {@link #fitCover} is
 * memoised by {@link #fitMemo}/{@link #fitPut}, and while the two halves sat in different classes
 * the memo and its only user could not be read together — which is the whole reason that memo is
 * subtle (it keys on the SOURCE bitmap, because the result's identity changes on every call).
 *
 * <p>Now-Playing cover tilt.
 *
 * Stock applies the 3D look once, from {@code initView} via {@code coverBg.post{ … }}:
 * {@code setPivotX(0); setPivotY(getHeight()/3f); setRotationY(20f)}. But {@code cover_bg} starts
 * out {@code android:visibility="gone"} — it is only shown once a cover has been loaded — so when
 * that posted runnable happens to run while the view is still GONE, {@code getHeight()} is **0**:
 * the pivot lands on the top edge and the cover renders visibly wrong (the "broken" cover that
 * only re-applying the theme used to fix, because that re-created the Activity with different
 * timing).
 *
 * {@link #tilt} does the same maths but falls back to the height declared in the layout
 * (345dp, already in px on the LayoutParams at inflation time), so it is correct no matter
 * whether the view has been measured yet. It is called every time the cover is put on screen.
 */
public final class Cover {

    private static final float ROTATION = 20.0f;

    // ---- the look: tilted with a reflection, or flat --------------------------------------------

    /**
     * "Tilt the cover", [Now Playing]. On by default — that is the stock, iPod-like look.
     *
     * <p>It is the ROTATION alone. The reflection stays either way (the user's call, v0.39.3):
     * a cover drawn straight on still reads as standing on a reflective surface, and the two
     * views of the player disagreed without it — the placeholder shown for a track with no
     * artwork was never tilted, so turning the setting off would have changed nothing there
     * except taking its reflection away.
     */
    public static final String KEY_TILT = "cover_tilt";

    /** The look the memoised bitmaps below were built for: -1 = never asked, 0 = flat, 1 = tilted. */
    private static int look = -1;

    /**
     * True while the cover is drawn straight on: no rotation, and none of the things the rotation
     * is the reason for — the transparent frame, and the full width of the box (see {@link #inset}).
     *
     * <p><b>Asking is also what keeps the caches honest.</b> {@link #fitCover}'s result carries
     * {@link #softEdge}'s frame under the rotation and does not without it, so it is a bitmap built
     * for ONE of the two looks — and the memo is keyed on the SOURCE bitmap, which does not change
     * when the setting does, so it would go on serving the look the user has just left. Both memos
     * are dropped here, at the one place that can see the change, and every reader calls this
     * before consulting its own. The references are dropped, never recycled: one of those bitmaps
     * is on screen.
     *
     * <p>What is on DISK is unaffected and needs no second copy: {@code BigCover} stores the cover
     * itself, which is the same picture either way — the tilt is a transform on the view, and the
     * reflection is built at display time.
     */
    public static boolean flatCover() {
        try {
            int now = Prefs.on(Y1Application.Companion.getAppContext(), KEY_TILT) ? 1 : 0;
            if (now != look) {
                look = now;
                fitIn = null;
                fitOut = null;
                reflIn = null;
                reflOut = null;
            }
            return now == 0;
        } catch (Throwable t) {
            return false;                       // the stock look is the safe answer
        }
    }

    /**
     * Width the mirrored half is built at. The cover itself stays at its full 300px — only the
     * reflection is halved, because it is mirrored, faded out and nobody reads detail in it.
     * Quarter the pixels to allocate and blit.
     */
    private static final int REFL_W = 150;

    // ---- memo 1: fitCover ---------------------------------------------------------------------
    // fitCover allocates a fresh bitmap every call (softEdge's transparent frame), so the object
    // identity of the player cover changed on every open and nothing downstream could be memoised.
    // Its INPUT, however, is stable: it comes straight out of BigCover's in-memory table, which
    // hands back the very same Bitmap for the same track. Keying on that input makes the whole
    // chain (fit -> reflect) a cache hit when the same song is opened again.
    private static WeakReference fitIn;
    private static Bitmap fitOut;

    /** Cached {@link #fitCover} result for this source, or null. */
    private static Bitmap fitMemo(Bitmap in) {
        if (in == null || fitIn == null || fitOut == null) return null;
        if (fitIn.get() != in) return null;
        if (fitOut.isRecycled()) { fitOut = null; return null; }
        return fitOut;
    }

    /** Remember a {@link #fitCover} result; returns it unchanged so the caller can tail-return. */
    private static Bitmap fitPut(Bitmap in, Bitmap out) {
        if (in != null && out != null) {
            fitIn = new WeakReference(in);
            fitOut = out;
        }
        return out;
    }

    // ---- memo 2: the reflection ---------------------------------------------------------------
    private static WeakReference reflIn;
    private static Bitmap reflOut;

    /**
     * The cover + its mirrored reflection, i.e. what stock's private {@code DoReflection} built —
     * but memoised and with the mirror rendered at {@link #REFL_W}.
     *
     * Stock rebuilt this on every {@code setImageBitmap}: a full-size ARGB_8888 composite
     * (300x450, ~550 KB), a full-resolution mirrored copy of the lower half (~180 KB), two blits
     * and a gradient rect with an xfermode — all synchronous, before the player's first frame.
     * Measured cost of the cover path on this device: ~75 ms (a coverless track opened in ~195 ms,
     * the same track with a 300x300 cover in ~271 ms).
     *
     * Returning null means "not handled" — the caller falls back to the stock path.
     */
    public static Bitmap reflect(Bitmap src) {
        try {
            if (src == null) return null;
            // Asked before the memo, because it is what empties it when the look changes.
            flatCover();
            if (reflIn != null && reflOut != null && reflIn.get() == src && !reflOut.isRecycled()) {
                return reflOut;
            }
            int w = src.getWidth();
            int h = src.getHeight();
            if (w <= 0 || h <= 0) return null;
            int half = h / 2;
            if (half <= 0) return null;

            Bitmap out = Bitmap.createBitmap(w, h + half, Bitmap.Config.ARGB_8888);
            Canvas c = new Canvas(out);
            c.drawBitmap(src, 0.0f, 0.0f, null);

            // Mirror the lower half, built small and stretched back over the full width.
            float k = (w > REFL_W) ? ((float) REFL_W / (float) w) : 1.0f;
            Matrix m = new Matrix();
            m.preScale(k, -k);
            Bitmap mir = Bitmap.createBitmap(src, 0, half, w, half, m, true);
            Paint p = new Paint();
            p.setFilterBitmap(true);
            p.setAntiAlias(true);
            c.drawBitmap(mir, null, new Rect(0, h, w, h + half), p);

            // Same fade stock used: 0x70FFFFFF -> 0x00FFFFFF over the reflection, DST_IN.
            Paint g = new Paint();
            g.setShader(new LinearGradient(0.0f, h, 0.0f, h + half, 0x70FFFFFF, 0x00FFFFFF,
                    Shader.TileMode.CLAMP));
            g.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.DST_IN));
            c.drawRect(0.0f, h, w, h + half, g);

            reflIn = new WeakReference(src);
            reflOut = out;
            return out;
        } catch (Throwable t) {
            return null;                        // fall back to the stock DoReflection
        }
    }

    public static void tilt(BasePlayerActivity a) {
        try {
            if (a == null) return;
            ActivityMusicPlayerBinding vb = (ActivityMusicPlayerBinding) a.getVb();
            if (vb == null) return;

            ReflectImageView v = vb.coverBg;
            if (v == null) return;
            ViewGroup.MarginLayoutParams lp =
                    (ViewGroup.MarginLayoutParams) v.getLayoutParams();
            if (lp == null) return;
            capture(lp);

            // cover_bg2 -- the placeholder for a track with no artwork -- is not touched HERE:
            // stock never tilted it, so the setting has nothing to do there, and its own box is
            // set by blank() on a path that runs whether or not there is a cover.
            //
            // FIT_START in BOTH looks. The layout asks for centerCrop, which fits the composite
            // exactly while the view is the width the layout gives it (both are 2:3) and starts
            // cropping the moment either changes -- and both do below.
            boolean flat = flatCover();
            int side = boxW - inset(vb, boxW, leftOf(lp));      // the width the cover is DRAWN at
            v.setScaleType(ImageView.ScaleType.FIT_START);

            if (flat) {
                v.setRotationY(0.0f);
                v.setPadding(0, 0, boxW - side, 0);
                box(v, lp, boxW, boxH, topFor(vb, lp, side), leftOf(lp));
                return;
            }
            v.setPadding(0, 0, 0, 0);

            // The transform goes on FIRST, because the width below is measured off the matrix it
            // produces rather than predicted (see tiltWidth).
            float h = v.getHeight();
            if (h <= 0) h = lp.height;          // not laid out yet (the view starts GONE)
            v.setPivotX(0.0f);
            if (h > 0) v.setPivotY(h / 3.0f);
            v.setRotationY(ROTATION);

            // BOTH dimensions, and that is the whole of the first attempt's failure: the box is
            // 2:3 and so is the picture, so a wider box alone changed nothing at all -- the fit
            // stayed limited by the HEIGHT and the image went on being drawn at the width it
            // always had (v0.39.4 did exactly that and was invisible on the device). The box has
            // to grow in proportion.
            int w = tiltWidth(v, side);
            int nh = Math.round((float) w * boxH / boxW);
            box(v, lp, w, nh, topFor(vb, lp, w), leftOf(lp));
            if (nh > 0) v.setPivotY(nh / 3.0f);   // the box just changed; stock's rule, new height
        } catch (Throwable t) {
            // the tilt is cosmetic -- never let it take the player down
        }
    }

    /**
     * How much narrower than its box the flat cover is drawn, in pixels.
     *
     * <p><b>The cover view OVERLAPS the info rows and always has.</b> It sits at x = 10 and is 230
     * wide, i.e. it ends at 240, while {@code music_info_ll} is 235 wide against a right margin of
     * 10 and therefore begins at 235 — the last five pixels of the cover are behind the rows'
     * translucent background (the rows are declared after it, so they are drawn on top). The tilt
     * hides that: a 20° rotation about the left edge pulls the right-hand side back by about
     * cos 20° of the width, so the tilted cover happens to end just short of the rows. Drawn
     * straight on there is nothing to pull it back, and it runs under them.
     *
     * <p>So the flat cover is drawn as wide as the space between the rows and the screen edge
     * really allows, with the same margin on the right as the view has on the left. Read off the
     * two views' own LayoutParams rather than written down as a number: they are the layout's, and
     * a layout change has to move this with it. LayoutParams are resolved at inflation, so this
     * needs no measure pass and is correct on the very first call.
     */
    /** The box {@code cover_bg} is declared with, read once before anything of ours changes it. */
    private static int boxW;
    private static int boxH;

    /** The box {@code cover_bg} is declared with, taken from whichever of the two runs first. */
    private static void capture(ViewGroup.MarginLayoutParams cover) {
        if (boxW <= 0 && cover != null && cover.width > 0) {
            boxW = cover.width;
            boxH = cover.height;
        }
    }

    private static void box(ReflectImageView v, ViewGroup.MarginLayoutParams lp,
                            int w, int h, int top, int left) {
        if (w <= 0 || h <= 0 || top < 0 || left < 0) return;
        // Only on a real change: this asks for a layout.
        if (lp.width == w && lp.height == h && lp.topMargin == top && leftOf(lp) == left) return;
        lp.width = w;
        lp.height = h;
        lp.topMargin = top;
        lp.leftMargin = left;
        // Both, and the START one is the one that counts: the layout declares
        // android:layout_marginStart, which lives in a field of its own, and
        // resolveLayoutDirection copies it over leftMargin on EVERY layout pass. Setting
        // leftMargin alone is undone before it is ever used -- the placeholder stayed at its own
        // 25 while the box grew to the cover's width, so it ran to the right instead of moving to
        // where the cover starts (v0.39.9).
        lp.setMarginStart(left);
        v.setLayoutParams(lp);
    }

    /**
     * The left margin as DECLARED, which is not {@code leftMargin} here: with
     * {@code layout_marginStart} in the XML that field stays 0 until the first layout resolves it,
     * so reading it before then answers "flush with the screen's edge".
     */
    private static int leftOf(ViewGroup.MarginLayoutParams lp) {
        int m = lp.getMarginStart();
        return m > 0 ? m : lp.leftMargin;
    }

    /**
     * How wide the view has to be for the TILTED cover's right-hand edge to land where the flat
     * one's does (a test, the user's call, v0.39.4).
     *
     * <p>The rotation is applied to the whole view, so there is no "edge" to move on its own: a
     * point at local x is drawn foreshortened by the angle and then again by the perspective
     * divide, so the view's own right edge is drawn well to the left of where it sits. That is why
     * the tilted cover stands clear of the rows while the flat one runs up to them, and it is what
     * "move the right edge" has to undo — by making the view wide enough that its edge lands where
     * the flat cover's does.
     *
     * <p><b>The projection is MEASURED, not predicted.</b> The obvious closed form —
     * {@code x·cos θ · d/(d + x·sin θ)}, solved for the width — needs the camera distance in the
     * same units as the view's own coordinates, and {@code setCameraDistance}'s "depth pixels" are
     * not those units. Predicting it with the documented default (1280 at this density) came out
     * about twenty pixels short on the device. So the transform is applied first and then
     * {@link android.view.View#getMatrix()} is asked what it does to a point: that matrix IS what
     * the framework draws with, whatever the units are. It is monotonic in x, so one binary search
     * finds the width whose edge lands on {@code target}, and no camera distance is set at all —
     * the platform's own is left alone.
     *
     * <p><b>The caller has to grow the box in PROPORTION, not just widen it.</b> The declared box
     * is 2:3 and so is the cover with its reflection, so the fit is limited by the height by a
     * hair: widening the box alone leaves the picture drawn at exactly the width it was, and the
     * change is invisible.
     */
    private static int tiltWidth(ReflectImageView v, int target) {
        try {
            if (target <= 0) return boxW;
            android.graphics.Matrix m = v.getMatrix();
            if (m == null || m.isIdentity()) return boxW;   // nothing to compensate for
            float y = v.getPivotY();                        // the row the rotation leaves alone
            float lo = target;
            float hi = target * 3.0f;
            if (mapX(m, hi, y) < target) return Math.round(hi);
            for (int i = 0; i < 24; i++) {
                float mid = (lo + hi) * 0.5f;
                if (mapX(m, mid, y) < target) lo = mid; else hi = mid;
            }
            int w = Math.round((lo + hi) * 0.5f);
            return w < target ? target : w;
        } catch (Throwable t) {
            return boxW;
        }
    }

    /** Where the view's transform actually puts local x — the framework's own answer. */
    private static float mapX(android.graphics.Matrix m, float x, float y) {
        float[] p = new float[] { x, y };
        m.mapPoints(p);
        return p[0];
    }

    /**
     * Where the cover's top edge belongs, as a top margin, so that the cover is centred against
     * the block of rows beside it (the user's call, v0.39.4 for the flat look, v0.39.6 for the
     * tilted one).
     *
     * <p><b>A margin, not a top padding.</b> Padding can only push down, and the two looks want
     * opposite directions: the flat cover (215) is a little shorter than the rows (222) and goes
     * down about nine pixels, the tilted one (244) is taller and goes UP about five.
     *
     * <p>{@code side} is the cover's own height, which is its drawn width — it is a square. For the
     * tilted look that is the box's width, since the picture is fitted to it; the rotation is about
     * Y, so it foreshortens the far side and leaves the near edge's height alone.
     *
     * <p>The rows' height is asked of the view when it has been laid out and summed from its
     * children's own params when it has not, because {@code tilt} is called before the first
     * layout as well as after it and a number that changed between the two calls would be a
     * visible jump. The two agree here: {@code music_info_ll} is a plain vertical chain of
     * fixed-height rows.
     */
    private static int topFor(ActivityMusicPlayerBinding vb,
                              ViewGroup.MarginLayoutParams lp, int side) {
        try {
            ViewGroup.MarginLayoutParams ip =
                    (ViewGroup.MarginLayoutParams) vb.musicInfoLl.getLayoutParams();
            int rows = rowsHeight(vb.musicInfoLl);
            if (rows <= 0) return lp.topMargin;          // nothing to centre against; leave it
            int top = ip.topMargin + (rows - side) / 2;
            return top > 0 ? top : 0;
        } catch (Throwable t) {
            return lp.topMargin;
        }
    }

    private static int rowsHeight(ViewGroup g) {
        int h = g.getHeight();
        if (h > 0) return h;
        int sum = 0;
        for (int i = 0; i < g.getChildCount(); i++) {
            android.view.View c = g.getChildAt(i);
            if (c == null || c.getVisibility() == android.view.View.GONE) continue;
            ViewGroup.LayoutParams p = c.getLayoutParams();
            if (!(p instanceof ViewGroup.MarginLayoutParams)) return 0;
            ViewGroup.MarginLayoutParams m = (ViewGroup.MarginLayoutParams) p;
            if (m.height <= 0) return 0;        // wrap_content: nothing to sum, wait for a layout
            sum += m.height + m.topMargin;
        }
        return sum;
    }

    private static int inset(ActivityMusicPlayerBinding vb, int width, int left) {
        try {
            ViewGroup.MarginLayoutParams ip =
                    (ViewGroup.MarginLayoutParams) vb.musicInfoLl.getLayoutParams();
            int screen = vb.coverBg.getResources().getDisplayMetrics().widthPixels;
            int rowsLeft = screen - ip.rightMargin - ip.width;
            int room = rowsLeft - left - left;   // the gap, twice: to the screen and to the rows
            // The width is passed in rather than read off the view: the tilted look widens the
            // view, and asking it would then answer about a box of our own making.
            int pad = width - room;
            return pad > 0 ? pad : 0;
        } catch (Throwable t) {
            return 0;
        }
    }

    /**
     * {@code cover_bg2} — the placeholder shown for a track with no artwork — put in exactly the
     * box a cover gets (the user's call, v0.39.9).
     *
     * <p>The layout gives it one of its own: 200 wide at a left margin of 25 and a top margin of
     * 35, so it sat narrower than the cover, further from the screen's edge and closer to the rows
     * than to it. It now takes the cover's own left margin and the cover's drawn width, which puts
     * the same gap on both sides of it as on both sides of a cover, and it is centred against the
     * rows by the same rule. The height follows the box's 2:3, or the fit would be limited by it
     * and the picture would come out at the width it was — the trap {@code tiltWidth} explains.
     *
     * <p>{@code FIT_START} and no padding, so the picture starts at the box's top-left corner and
     * the box IS the geometry; nothing here depends on the placeholder's own resolution.
     *
     * <p>It has nothing to do with the tilt and never did — stock does not tilt this view — so this
     * runs in both looks, and it is applied from {@link #instantCover}, i.e. once per track before
     * anything has decided whether there is a cover at all. That is the only place guaranteed to
     * run: a track that is neither cached nor recorded as coverless reaches the placeholder through
     * a branch of stock's own, some 200 ms later, with nothing of ours in between.
     */
    private static void blank(BasePlayerActivity a) {
        try {
            ActivityMusicPlayerBinding vb = (ActivityMusicPlayerBinding) a.getVb();
            if (vb == null) return;
            ReflectImageView v = vb.coverBg2;
            if (v == null || vb.coverBg == null) return;
            ViewGroup.MarginLayoutParams lp =
                    (ViewGroup.MarginLayoutParams) v.getLayoutParams();
            ViewGroup.MarginLayoutParams cp =
                    (ViewGroup.MarginLayoutParams) vb.coverBg.getLayoutParams();
            if (lp == null || cp == null) return;
            capture(cp);                        // this runs before tilt on the coverless path
            if (boxW <= 0 || boxH <= 0) return;

            int left = leftOf(cp);
            int side = boxW - inset(vb, boxW, left);      // the width a cover is drawn at
            v.setScaleType(ImageView.ScaleType.FIT_START);
            v.setPadding(0, 0, 0, 0);
            box(v, lp, side, Math.round((float) side * boxH / boxW),
                    topFor(vb, lp, side), left);
        } catch (Throwable t) {
            // cosmetic; the placeholder is shown either way
        }
    }

    /**
     * The placeholder, painted as instantly as a cached cover is.
     *
     * A track WITH artwork never flashes, because {@code Ipp.instantCover} paints it out of
     * {@code BigCover} synchronously; a track WITHOUT any showed an empty frame until the async
     * read came back null some 200 ms later and stock's own branch made {@code cover_bg2} visible
     * — which is the blink at the start of every songless-cover track. So do the same thing the
     * cached-cover path does: when the track is <b>recorded</b> as having no artwork
     * ({@link BigCover#knownNone}), swap the views here and now.
     *
     * Nothing is built: both {@code cover_bg} and {@code cover_bg2} already hold the reflected
     * placeholder their constructor took from {@code Ipp.reflCache} — one bitmap for the whole
     * process, whichever player screen inflated it first. This is only which view is visible,
     * exactly what stock's null branch does, so the async pass that follows agrees with it.
     */
    public static void instantBlank(BasePlayerActivity a, String path) {
        try {
            if (a == null || path == null) return;
            if (!BigCover.knownNone(path)) return;
            ActivityMusicPlayerBinding vb = (ActivityMusicPlayerBinding) a.getVb();
            if (vb == null) return;
            if (vb.coverBg != null) vb.coverBg.setVisibility(android.view.View.GONE);
            if (vb.coverBg2 != null) vb.coverBg2.setVisibility(android.view.View.VISIBLE);
        } catch (Throwable t) {
            // the async path still shows it 200 ms later
        }
    }

    // ---- the placeholder's reflection, built once per process ---------------------------------

    /**
     * ipp: the reflected placeholder cover, built once at the first {@code ReflectImageView}
     * inflation and shared by every later one (see {@code ReflectImageView.<init>}). One immutable
     * bitmap, never recycled. {@code activity_music_player.xml} holds TWO of those views, so
     * without this every player open paid for the same ~834 KB composite twice.
     */
    private static Bitmap reflCache;

    public static Bitmap reflCache() {
        Bitmap b = reflCache;
        if (b == null) {
            return null;
        }
        if (b.isRecycled()) {
            b = null;
            reflCache = null;
        }
        return b;
    }

    public static void setReflCache(Bitmap b) {
        reflCache = b;
    }

    // ---- the cover's geometry -----------------------------------------------------------------

    /**
     * ipp #230: the Now-Playing cover is drawn rotated 20 deg around Y ({@link #tilt}), which turns
     * its top and bottom edges into slanted lines. Neither the software nor the hardware pipeline
     * antialiases the EDGE of a transformed bitmap, so those two edges came out as visible stair
     * steps.
     *
     * <p>Fix: give the bitmap a fully transparent 2px frame. The outermost texels are then
     * transparent, so the bilinear filtering that already applies inside the transformed image
     * fades the boundary out over ~1px instead of cutting it off at a hard texel row. Cheap, and it
     * needs no change to the ImageView, the layout or the rotation itself.
     *
     * <p>LEFT / RIGHT / TOP only - NOT the bottom. {@code ReflectImageView} builds the mirrored
     * reflection from the bitmap's own lower half and butts it against the bottom edge, so a
     * transparent row there became a 4px transparent seam between cover and reflection. The bottom
     * edge needs no antialiasing anyway: the reflection is drawn right up against it.
     *
     * <p>Applied at display time, never on the way into the cache: {@link BigCover} stores JPEG,
     * which has no alpha channel to store the frame in.
     */
    private static Bitmap softEdge(Bitmap src) {
        if (src == null) {
            return null;
        }
        try {
            int w = src.getWidth();
            int hgt = src.getHeight();
            if (w > 0 && hgt > 0) {
                Bitmap out = Bitmap.createBitmap(w + 4, hgt + 2, Bitmap.Config.ARGB_8888);
                Canvas canvas = new Canvas(out);
                Paint paint = new Paint();
                paint.setFilterBitmap(true);
                paint.setAntiAlias(true);
                canvas.drawBitmap(src, 2, 2, paint);
                return out;
            }
        } catch (Throwable t) {
        }
        return src;
    }

    /** The player's cover: a centred 1:1 crop capped at 320px, plus {@link #softEdge}'s frame. */
    public static Bitmap fitCover(Bitmap src) {
        if (src == null) {
            return null;
        }
        // Asked before the memo: it is what empties it when the look changes.
        boolean flat = flatCover();
        // Memoised by the SOURCE bitmap - see the memo above.
        Bitmap memo = fitMemo(src);
        if (memo != null) {
            return memo;
        }
        // ipp: CENTRE CROP TO 1:1, whatever the aspect ratio. This used to scale the picture to fit
        // the HEIGHT and centre it horizontally, which is a centre crop only for a landscape cover
        // - a portrait one was squeezed to fit the full height and came out with transparent bars
        // beside it, i.e. not cropped at all. Now the source's centred square (side = min(w, h)) is
        // taken and scaled into the target square, so both axes are cropped symmetrically.
        try {
            int w = src.getWidth();
            int hgt = src.getHeight();
            if (w > 0 && hgt > 0) {
                int side = w <= hgt ? w : hgt;          // side of the source's centred square
                int out = side > 320 ? 320 : side;      // the square actually drawn, capped at 320
                if (w == hgt && hgt == out) {
                    // already the exact square we want - the frame is only wanted under the rotation
                    return fitPut(src, flat ? src : softEdge(src));
                }
                int x = (w - side) / 2;
                int y = (hgt - side) / 2;
                Rect from = new Rect(x, y, x + side, y + side);
                Bitmap dst = Bitmap.createBitmap(out, out, Bitmap.Config.ARGB_8888);
                Canvas canvas = new Canvas(dst);
                Rect to = new Rect(0, 0, out, out);
                Paint paint = new Paint();
                paint.setFilterBitmap(true);
                paint.setAntiAlias(true);
                canvas.drawBitmap(src, from, to, paint);
                // transparent frame so the 20 deg Y-rotation leaves no stair-stepped edge
                // transparent frame so the 20 deg Y-rotation leaves no stair-stepped edge; drawn
                // straight on there is no slanted edge to fade, and the frame would only inset it
                return fitPut(src, flat ? dst : softEdge(dst));
            }
        } catch (Throwable t) {
        }
        return src;
    }

    /**
     * ipp: CENTRE CROP TO 1:1, whatever the aspect ratio - the source's centred square
     * (side = min(w, h)) scaled into a {@code size x size} bitmap. It used to fit the HEIGHT and
     * centre horizontally, which crops a landscape cover correctly but leaves a portrait one whole,
     * with transparent bars beside it. Both axes are cropped symmetrically now; for a square source
     * nothing changes.
     *
     * <p>The list thumbnails go through this one too ({@link CoverCache}, {@link BigCover},
     * {@link Find}), which is why it takes the size rather than assuming the player's.
     */
    public static Bitmap square(Bitmap src, int size) {
        if (src == null) {
            return null;
        }
        try {
            int w = src.getWidth();
            int hgt = src.getHeight();
            if (w > 0 && hgt > 0 && size > 0) {
                if (w == size && hgt == size) {
                    return src;
                }
                Paint paint = new Paint();
                paint.setFilterBitmap(true);
                paint.setAntiAlias(true);

                // Bilinear filtering only looks at 2x2 source pixels per destination pixel, so a
                // reduction of more than 2x SKIPS most of the source: at 300 -> 50 five sixths of
                // every 6x6 block never reach the result, and a hard edge comes out as stair steps.
                // Halving first, repeatedly, keeps every step inside what bilinear can average
                // properly and is what turns a big reduction into a smooth one. The loop does not
                // run at all when the source is already close to the target, which is every caller
                // that decoded with an inSampleSize (they arrive within 2x); it is the covers taken
                // straight out of BigCover's 300px memory that need it.
                Bitmap cur = src;
                boolean mine = false;                  // only OUR intermediates may be recycled
                while (w >= size * 2 && hgt >= size * 2) {
                    int nw = w / 2;
                    int nh = hgt / 2;
                    if (nw <= 0 || nh <= 0) break;
                    Bitmap half = Bitmap.createBitmap(nw, nh, Bitmap.Config.ARGB_8888);
                    Canvas hc = new Canvas(half);
                    hc.drawBitmap(cur, new Rect(0, 0, w, hgt), new Rect(0, 0, nw, nh), paint);
                    if (mine) {
                        cur.recycle();
                    }
                    cur = half;
                    mine = true;
                    w = nw;
                    hgt = nh;
                }

                int side = w <= hgt ? w : hgt;
                int x = (w - side) / 2;
                int y = (hgt - side) / 2;
                Rect from = new Rect(x, y, x + side, y + side);
                Bitmap dst = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888);
                Canvas canvas = new Canvas(dst);
                Rect to = new Rect(0, 0, size, size);
                canvas.drawBitmap(cur, from, to, paint);
                if (mine) {
                    cur.recycle();
                }
                return dst;
            }
        } catch (Throwable t) {
        }
        return src;
    }

    // ---- what the player asks for -------------------------------------------------------------

    /**
     * ipp #230.2: the body of this lives in {@link BigCover#track} - the cover is keyed by the
     * TRACK (with the album's representative shared on disk), not by the folder, so two songs
     * sitting in one folder with different artwork no longer inherit whichever was opened first.
     * The DB gate that used to sit here (song known + non-empty album) is gone: it only decided
     * whether the result was worth caching, and a per-track key is worth caching for any file.
     */
    public static Bitmap bigCover(String path) {
        if (path == null) {
            return null;
        }
        try {
            return BigCover.track(path);
        } catch (Throwable t) {
            return null;
        }
    }

    /**
     * This track's own cached cover if we have one, otherwise the album's representative as a
     * stand-in - {@link BigCover#peekTrack} decides. Memory/disk only, no tag read, so it stays
     * safe to call synchronously while the player is being built.
     */
    private static Bitmap bigCoverCached(String path) {
        if (path == null) {
            return null;
        }
        try {
            return BigCover.peekTrack(path);
        } catch (Throwable t) {
            return null;
        }
    }

    /** Paint the cover at once, from the caches, at the top of stock's {@code refreshCover}. */
    public static void instantCover(BasePlayerActivity a, String path) {
        blank(a);                      // the placeholder's box, whatever this track turns out to be
        Bitmap b = bigCoverCached(path);
        if (b == null) {
            // Nothing cached for this track. If we have already READ it and know it carries no
            // artwork at all, put the placeholder up now - the async read would only reach the same
            // conclusion ~200 ms later, and that delay is the blink at the start of a coverless
            // song.
            instantBlank(a, path);
            return;
        }
        b = fitCover(b);
        if (b == null) {
            return;
        }
        try {
            ActivityMusicPlayerBinding vb = (ActivityMusicPlayerBinding) a.getVb();
            ReflectImageView v = vb.coverBg;
            v.setImageBitmap(b);
            v.setVisibility(android.view.View.VISIBLE);
            vb.coverBg2.setVisibility(android.view.View.GONE);
            // the view was GONE until now, so stock's posted tilt may have measured it as 0-high
            tilt(a);
        } catch (Throwable t) {
        }
    }
}
