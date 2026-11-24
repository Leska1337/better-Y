package com.innioasis.ipp;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.Shader;
import android.graphics.drawable.BitmapDrawable;
import android.view.ViewGroup;
import android.widget.ImageView;

import com.innioasis.y1.R;
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

    /**
     * Composites off the screen; the next cover is drawn into one. Two: Cover Flow's way back
     * flies two at once (the track's cover fading into the album's) and gives both back.
     */
    private static Bitmap spare, spare2;

    /** A composite someone outside the player keeps: never handed out for redrawing. */
    private static Bitmap held;

    private static void give(Bitmap b) {
        if (b == null || b == spare || b == spare2) return;
        if (spare == null) spare = b;
        else if (spare2 == null) spare2 = b;
        else spare = b;
    }

    /** A spare of this size, taken out of the pair; null when neither fits. */
    private static Bitmap take(int w, int h) {
        Bitmap b = spare;
        if (b != null && !b.isRecycled() && b.isMutable() && b.getWidth() == w && b.getHeight() == h) {
            spare = null;
            return b;
        }
        b = spare2;
        if (b != null && !b.isRecycled() && b.isMutable() && b.getWidth() == w && b.getHeight() == h) {
            spare2 = null;
            return b;
        }
        return null;
    }

    /** Keep this {@link #reflect} result out of the buffers that get redrawn. */
    public static synchronized void hold(Bitmap b) {
        held = b;
        if (spare == b) spare = null;
        if (spare2 == b) spare2 = null;
    }

    /** A {@link #reflect} result its keeper no longer needs: the next composite is drawn into it. */
    public static synchronized void release(Bitmap b) {
        if (b == null || b == blankPic || b.isRecycled() || !b.isMutable()) return;
        if (held == b) held = null;
        if (reflOut == b) {
            reflOut = null;
            reflIn = null;
        }
        give(b);
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
            Bitmap out = take(w, h + half);
            if (out != null) {
                out.eraseColor(0);
            } else {
                out = Bitmap.createBitmap(w, h + half, Bitmap.Config.ARGB_8888);
            }
            Canvas c = new Canvas(out);
            c.drawBitmap(src, 0.0f, 0.0f, null);
            mirror(c, src, w, h, flatCover() ? 0 : 2);

            if (reflOut != held) give(reflOut);
            reflIn = new WeakReference(src);
            reflGen = src.getGenerationId();
            reflOut = out;
            return out;
        } catch (Throwable t) {
            return null;
        }
    }

    /** The faded mirror of {@code src}'s lower half, under it on {@code c}; the side frame {@code f} stays out of it. */
    private static void mirror(Canvas c, Bitmap src, int w, int h, int f) {
        int half = h / 2;
        float k = (w > REFL_W) ? ((float) REFL_W / (float) w) : 1.0f;
        Matrix m = new Matrix();
        m.preScale(k, -k);
        Bitmap mir = Bitmap.createBitmap(src, f, half, w - 2 * f, half, m, true);
        Paint p = new Paint();
        p.setFilterBitmap(true);
        p.setAntiAlias(true);
        c.drawBitmap(mir, null, new Rect(f, h, w - f, h + half), p);

        // stock's fade
        Paint g = new Paint();
        g.setShader(new LinearGradient(0.0f, h, 0.0f, h + half, 0x70FFFFFF, 0x00FFFFFF,
                Shader.TileMode.CLAMP));
        g.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.DST_IN));
        c.drawRect(0.0f, h, w, h + half, g);
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
            shape(vb, v, lp, leftOf(lp));
        } catch (Throwable t) {
        }
    }

    /**
     * The cover's box, padding and tilt on {@code v}: {@code cover_bg} itself, or the placeholder
     * put exactly where a cover stands ({@code left} is the cover's). FIT_START in both looks: the
     * layout's centerCrop crops as soon as the box changes, and it does below.
     */
    private static void shape(ActivityMusicPlayerBinding vb, ReflectImageView v,
                              ViewGroup.MarginLayoutParams lp, int left) {
        try {
            if (boxW <= 0 || boxH <= 0) return;
            boolean flat = flatCover();
            int side = boxW - inset(vb, boxW, left);      // the width the cover is DRAWN at
            v.setScaleType(ImageView.ScaleType.FIT_START);

            if (flat) {
                v.setRotationY(0.0f);
                v.setPadding(0, 0, boxW - side, 0);
                box(v, lp, boxW, boxH, topFor(vb, lp, side), left);
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
            box(v, lp, w, nh, topFor(vb, lp, w), left);
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
     * {@code cover_bg2}, the no-artwork placeholder, shown as a cover is: same box, same tilt or
     * none as "Tilt the cover" says, same frame and reflection. From
     * {@link #instantCover}, once per track before anything knows whether there is a cover — the
     * one place sure to run; stock shows the placeholder later with nothing of ours in between.
     */
    private static void blank(BasePlayerActivity a) {
        try {
            if (srcKeep == null) keepSrcs(a.getResources());
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
            Bitmap pic = blankCover();
            android.graphics.drawable.Drawable d = v.getDrawable();
            if (pic != null && !(d instanceof BitmapDrawable && ((BitmapDrawable) d).getBitmap() == pic)) {
                // past setImageBitmap: that one reflects again, through the cover's own buffers
                v.setImageDrawable(new BitmapDrawable(a.getResources(), pic));
            }
            shape(vb, v, lp, leftOf(cp));
        } catch (Throwable t) {
        }
    }

    private static Bitmap blankPic;
    private static int blankLook = -1;

    /**
     * The player's button icons (the android:src of activity_music_player), held: Resources keeps
     * a decoded drawable only weakly, and after each collection the layout decoded them all
     * again. The cover views' own src is a 4×4 ipp_cover_src: they never show it.
     */
    private static Object[] srcKeep;

    private static final int[] PLAYER_SRCS = {
            R.drawable.icon_a_to_b, R.drawable.icon_b_question_mark,
            R.mipmap.ipp_bookmark, R.mipmap.ipp_heart_off, R.mipmap.ipp_lyrics, R.mipmap.ipp_queue,
            R.mipmap.ipp_speed_off, R.mipmap.ipp_timer_off, R.mipmap.music_no_repeat,
            R.mipmap.music_no_shuffle, R.mipmap.music_volume_full, R.mipmap.music_volume_off };

    private static void keepSrcs(android.content.res.Resources r) {
        Object[] k = new Object[PLAYER_SRCS.length];
        for (int i = 0; i < k.length; i++) {
            try {
                k[i] = r.getDrawable(PLAYER_SRCS[i]);
            } catch (Throwable t) {
            }
        }
        srcKeep = k;
    }

    /** The placeholder as a cover is shown, framed for the look and reflected; also what Cover Flow flies. One per look. */
    public static synchronized Bitmap blankCover() {
        boolean flat = flatCover();
        int now = flat ? 0 : 1;
        if (blankPic != null && blankLook == now && !blankPic.isRecycled()) return blankPic;
        BitmapFactory.Options o = new BitmapFactory.Options();
        o.inScaled = false;
        Bitmap src = BitmapFactory.decodeResource(
                Y1Application.Companion.getAppContext().getResources(), R.drawable.bg_player_cover_view, o);
        if (src == null) return null;
        int w = src.getWidth();
        int h = src.getHeight();
        int side = w <= h ? w : h;
        int f = flat ? 0 : 2;               // softEdge's frame: left, right and top
        Bitmap framed = Bitmap.createBitmap(side + 2 * f, side + f, Bitmap.Config.ARGB_8888);
        Paint p = new Paint(Paint.FILTER_BITMAP_FLAG);
        int x = (w - side) / 2;
        int y = (h - side) / 2;
        new Canvas(framed).drawBitmap(src, new Rect(x, y, x + side, y + side),
                new Rect(f, f, f + side, f + side), p);
        src.recycle();
        int fw = framed.getWidth();
        int fh = framed.getHeight();
        Bitmap out = Bitmap.createBitmap(fw, fh + fh / 2, Bitmap.Config.ARGB_8888);
        Canvas c = new Canvas(out);
        c.drawBitmap(framed, 0, 0, null);
        mirror(c, framed, fw, fh, f);
        framed.recycle();
        blankPic = out;
        blankLook = now;
        return out;
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

    /** Now Playing's Style preview: {@code src} as the player shows it in the current look, the placeholder for null. */
    public static void preview(BasePlayerActivity a, Bitmap src) {
        try {
            ActivityMusicPlayerBinding vb = (ActivityMusicPlayerBinding) a.getVb();
            blank(a);
            Bitmap b = src == null ? null : fitCover(src);
            if (b == null) {
                vb.coverBg.setVisibility(android.view.View.GONE);
                vb.coverBg2.setVisibility(android.view.View.VISIBLE);
                return;
            }
            vb.coverBg.setImageBitmap(b);
            vb.coverBg.setVisibility(android.view.View.VISIBLE);
            vb.coverBg2.setVisibility(android.view.View.GONE);
            tilt(a);
        } catch (Throwable t) {
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
