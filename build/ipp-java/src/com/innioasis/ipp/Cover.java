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
 * The Now-Playing cover: its bitmap geometry, its 3D tilt and its reflection. Stock tilts once
 * from a posted runnable that can run while {@code cover_bg} is still GONE and 0 high, putting the
 * pivot on the top edge; {@link #tilt} falls back to the declared height and runs every time the
 * cover is shown.
 */
public final class Cover {

    private static final float ROTATION = 20.0f;

    /** "Tilt the cover", [Now Playing]: the rotation alone, the reflection stays either way. */
    public static final String KEY_TILT = "cover_tilt";

    /** The look the memoised bitmaps were built for: -1 = never asked, 0 = flat, 1 = tilted. */
    private static int look = -1;

    /**
     * True while the cover is drawn flat. Asking also drops both memos when the look changes: they
     * key on the SOURCE bitmap, which does not change with the setting. Every reader asks first.
     * Dropped, never recycled — one is on screen.
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
            return false;
        }
    }

    /** The width the faded mirror is built at; the cover itself stays full size. */
    private static final int REFL_W = 150;

    // fitCover's memo, keyed on its INPUT — BigCover hands back the same Bitmap for a track, while
    // the output is new on every call.
    private static WeakReference fitIn;
    private static Bitmap fitOut;

    /** Cached {@link #fitCover} result for this source, or null. */
    private static Bitmap fitMemo(Bitmap in) {
        if (in == null || fitIn == null || fitOut == null) return null;
        if (fitIn.get() != in) return null;
        if (fitOut.isRecycled()) { fitOut = null; return null; }
        return fitOut;
    }

    /** Remember a {@link #fitCover} result; returns it. */
    private static Bitmap fitPut(Bitmap in, Bitmap out) {
        if (in != null && out != null) {
            fitIn = new WeakReference(in);
            fitOut = out;
        }
        return out;
    }

    private static WeakReference reflIn;
    private static int reflGen;
    private static Bitmap reflOut;

    /** The composite that left the screen at the last change; the next cover is drawn into it. */
    private static Bitmap spare;

    /** A composite someone outside the player keeps: never handed out for redrawing. */
    private static Bitmap held;

    /** Keep this {@link #reflect} result out of the buffers that get redrawn. */
    public static synchronized void hold(Bitmap b) {
        held = b;
        if (spare == b) spare = null;
    }

    /**
     * Stock's {@code DoReflection}, memoised and with a smaller mirror — stock rebuilt it on every
     * {@code setImageBitmap}, before the first frame. Null = not handled, stock's path runs.
     */
    public static synchronized Bitmap reflect(Bitmap src) {
        try {
            if (src == null) return null;
            flatCover();
            if (reflIn != null && reflOut != null && reflIn.get() == src
                    && reflGen == src.getGenerationId() && !reflOut.isRecycled()) {
                return reflOut;
            }
            int w = src.getWidth();
            int h = src.getHeight();
            if (w <= 0 || h <= 0) return null;
            int half = h / 2;
            if (half <= 0) return null;

            // Redrawn in place where the size allows: a fresh composite per track is what fills
            // the heap during a run of track changes.
            Bitmap out = spare;
            spare = null;
            if (out != null && !out.isRecycled() && out.isMutable()
                    && out.getWidth() == w && out.getHeight() == h + half) {
                out.eraseColor(0);
            } else {
                out = Bitmap.createBitmap(w, h + half, Bitmap.Config.ARGB_8888);
            }
            Canvas c = new Canvas(out);
            c.drawBitmap(src, 0.0f, 0.0f, null);

            float k = (w > REFL_W) ? ((float) REFL_W / (float) w) : 1.0f;
            Matrix m = new Matrix();
            m.preScale(k, -k);
            Bitmap mir = Bitmap.createBitmap(src, 0, half, w, half, m, true);
            Paint p = new Paint();
            p.setFilterBitmap(true);
            p.setAntiAlias(true);
            c.drawBitmap(mir, null, new Rect(0, h, w, h + half), p);

            // stock's fade
            Paint g = new Paint();
            g.setShader(new LinearGradient(0.0f, h, 0.0f, h + half, 0x70FFFFFF, 0x00FFFFFF,
                    Shader.TileMode.CLAMP));
            g.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.DST_IN));
            c.drawRect(0.0f, h, w, h + half, g);

            if (reflOut != held) spare = reflOut;
            reflIn = new WeakReference(src);
            reflGen = src.getGenerationId();
            reflOut = out;
            return out;
        } catch (Throwable t) {
            return null;
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

            // The placeholder (cover_bg2) is never tilted; its box is blank()'s. FIT_START in both
            // looks: the layout's centerCrop crops as soon as the box changes, and it does below.
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

            // The transform goes on FIRST: tiltWidth measures its matrix.
            float h = v.getHeight();
            if (h <= 0) h = lp.height;          // not laid out yet (the view starts GONE)
            v.setPivotX(0.0f);
            if (h > 0) v.setPivotY(h / 3.0f);
            v.setRotationY(ROTATION);

            // BOTH dimensions: box and picture are 2:3, so a wider box alone is still fitted by
            // the height and changes nothing.
            int w = tiltWidth(v, side);
            int nh = Math.round((float) w * boxH / boxW);
            box(v, lp, w, nh, topFor(vb, lp, w), leftOf(lp));
            if (nh > 0) v.setPivotY(nh / 3.0f);   // stock's rule, new height
        } catch (Throwable t) {
        }
    }

    /** The box {@code cover_bg} is declared with, read before anything of ours changes it. */
    private static int boxW;
    private static int boxH;

    /** Taken by whichever of tilt/blank runs first. */
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
        // marginStart wins: it is copied over leftMargin on every layout pass
        lp.setMarginStart(left);
        v.setLayoutParams(lp);
    }

    /** The left margin as DECLARED: {@code leftMargin} is 0 until the first layout. */
    private static int leftOf(ViewGroup.MarginLayoutParams lp) {
        int m = lp.getMarginStart();
        return m > 0 ? m : lp.leftMargin;
    }

    /**
     * The view width at which the TILTED cover's right edge lands where the flat one's does.
     * MEASURED off {@link android.view.View#getMatrix()} by binary search: the closed form needs the
     * camera distance in units the documentation gets wrong, and came out ~20 px short.
     */
    private static int tiltWidth(ReflectImageView v, int target) {
        try {
            if (target <= 0) return boxW;
            android.graphics.Matrix m = v.getMatrix();
            if (m == null || m.isIdentity()) return boxW;
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

    /** Where the view's transform puts local x. */
    private static float mapX(android.graphics.Matrix m, float x, float y) {
        float[] p = new float[] { x, y };
        m.mapPoints(p);
        return p[0];
    }

    /**
     * The top margin that centres the cover against the rows beside it — a margin, since the tilted
     * cover moves UP. {@code side} is the cover's height (a square). Before the first layout the
     * rows' height is summed from their params, so the two calls agree.
     */
    private static int topFor(ActivityMusicPlayerBinding vb,
                              ViewGroup.MarginLayoutParams lp, int side) {
        try {
            ViewGroup.MarginLayoutParams ip =
                    (ViewGroup.MarginLayoutParams) vb.musicInfoLl.getLayoutParams();
            int rows = rowsHeight(vb.musicInfoLl);
            if (rows <= 0) return lp.topMargin;
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
            if (m.height <= 0) return 0;        // wrap_content: wait for a layout
            sum += m.height + m.topMargin;
        }
        return sum;
    }

    /**
     * How much narrower than its box the flat cover is drawn. The view overlaps the info rows; the
     * tilt pulls its right side clear, flat it runs under them. Read off both views' LayoutParams.
     */
    private static int inset(ActivityMusicPlayerBinding vb, int width, int left) {
        try {
            ViewGroup.MarginLayoutParams ip =
                    (ViewGroup.MarginLayoutParams) vb.musicInfoLl.getLayoutParams();
            int screen = vb.coverBg.getResources().getDisplayMetrics().widthPixels;
            int rowsLeft = screen - ip.rightMargin - ip.width;
            int room = rowsLeft - left - left;   // the gap, twice: to the screen and to the rows
            // width passed in: the tilted look widens the view itself
            int pad = width - room;
            return pad > 0 ? pad : 0;
        } catch (Throwable t) {
            return 0;
        }
    }

    /**
     * {@code cover_bg2}, the no-artwork placeholder, in exactly the box a flat cover gets. From
     * {@link #instantCover}, once per track before anything knows whether there is a cover — the
     * one place sure to run; stock shows the placeholder later with nothing of ours in between.
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
            capture(cp);                        // runs before tilt on the coverless path
            if (boxW <= 0 || boxH <= 0) return;

            int left = leftOf(cp);
            int side = boxW - inset(vb, boxW, left);      // the width a cover is drawn at
            v.setScaleType(ImageView.ScaleType.FIT_START);
            v.setPadding(0, 0, 0, 0);
            box(v, lp, side, Math.round((float) side * boxH / boxW),
                    topFor(vb, lp, side), left);
        } catch (Throwable t) {
        }
    }

    /**
     * The placeholder painted at once for a track KNOWN to have no artwork — otherwise it blinks
     * in ~200 ms later. Only the views' visibility, exactly what stock's null branch then does.
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

    /**
     * The reflected placeholder, built at the first {@code ReflectImageView} inflation and shared
     * by every later one. Never recycled.
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

    /**
     * The framed cover of the track on screen. Never shown itself — only {@link #reflect}'s
     * composite is — so every cover is drawn into the same one; its generation id tells them apart.
     */
    private static Bitmap edge;

    /**
     * A transparent 2px frame, so bilinear filtering fades the tilted cover's slanted edges instead
     * of stair-stepping them. Not on the bottom: a seam would open above the reflection. At display
     * time only — the JPEG cache has no alpha. Drawn into one buffer, {@link #edge}.
     */
    private static Bitmap softEdge(Bitmap src) {
        if (src == null) {
            return null;
        }
        try {
            int w = src.getWidth();
            int hgt = src.getHeight();
            if (w > 0 && hgt > 0) {
                Bitmap out = edge;
                if (out != null && !out.isRecycled()
                        && out.getWidth() == w + 4 && out.getHeight() == hgt + 2) {
                    out.eraseColor(0);
                } else {
                    out = Bitmap.createBitmap(w + 4, hgt + 2, Bitmap.Config.ARGB_8888);
                    edge = out;
                }
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
    public static synchronized Bitmap fitCover(Bitmap src) {
        if (src == null) {
            return null;
        }
        boolean flat = flatCover();             // before the memo: it empties it
        Bitmap memo = fitMemo(src);
        if (memo != null) {
            return memo;
        }
        try {
            int w = src.getWidth();
            int hgt = src.getHeight();
            if (w > 0 && hgt > 0) {
                int side = w <= hgt ? w : hgt;          // side of the source's centred square
                int out = side > 320 ? 320 : side;
                if (w == hgt && hgt == out) {
                    // the frame is only wanted under the rotation
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
                return fitPut(src, flat ? dst : softEdge(dst));
            }
        } catch (Throwable t) {
        }
        return src;
    }

    /**
     * The source's centred square scaled to {@code size} — both axes cropped, so a portrait cover
     * gets no side bars. Shared by the thumbnails, hence the size parameter.
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

                // Halve first: bilinear reads 2x2 pixels, so a bigger reduction skips most of the
                // source and stair-steps the edges.
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

    /** The player's cover, from {@link BigCover#track}. No DB gate: any file is worth caching. */
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

    /** {@link BigCover#peekTrack}: no tag read, safe while the player is being built. */
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
        blank(a);
        Bitmap b = bigCoverCached(path);
        if (b == null) {
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
            tilt(a);                   // the view was GONE until now
        } catch (Throwable t) {
        }
    }
}
