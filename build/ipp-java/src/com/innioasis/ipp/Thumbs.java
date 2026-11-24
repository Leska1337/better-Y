package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.os.Handler;
import android.os.Looper;
import android.view.ViewGroup;
import android.widget.ImageView;

import com.bumptech.glide.Glide;
import com.bumptech.glide.RequestBuilder;
import com.bumptech.glide.load.DecodeFormat;
import com.bumptech.glide.load.engine.DiskCacheStrategy;
import com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool;
import com.bumptech.glide.load.resource.bitmap.BitmapTransformation;
import com.bumptech.glide.load.resource.bitmap.DownsampleStrategy;
import com.bumptech.glide.request.target.Target;

import java.io.File;
import java.security.MessageDigest;

/**
 * Picture tiles of Photos and of the wallpaper gallery: Glide, at the tile's own size, scaled
 * down by halves (each step a true 2x2 average) and cropped to it, RGB_565 when there is no
 * alpha. Below KitKat Glide only samples by powers of two, which skips pixels outside JPEG, and
 * the tile stretched what came. What Glide holds in memory is dropped when the screen closes.
 */
public final class Thumbs {

    private Thumbs() { }

    /** Disk cache JPEG quality of a finished tile. */
    static final int QUALITY = 90;
    /** Above this many pixels a non-JPEG picture is sampled before it is shrunk. */
    private static final int WHOLE_MAX = 2000000;

    private static final Shrink SHRINK = new Shrink();
    private static final Half HALF = new Half(false);
    private static final Half WHOLE = new Half(true);

    /** Photos: into stock's target, which checks the tile still shows this path. */
    public static void photo(Context c, String path, ImageView img, Object target) {
        try {
            if (c == null || path == null || img == null) return;
            float d = img.getResources().getDisplayMetrics().density;
            ViewGroup.LayoutParams lp = img.getLayoutParams();
            int w = lp != null && lp.width > 0 ? lp.width : (int) (100 * d);
            int h = lp != null && lp.height > 0 ? lp.height : (int) (75 * d);
            RequestBuilder rb = tile(Glide.with(c).load(new File(path)), path);
            rb = (RequestBuilder) rb.override(w, h);
            rb.into((Target) target);
        } catch (Throwable t) {
        }
    }

    /** The wallpaper gallery's picture file, at the size the tile lays out to. */
    public static void wallpaper(Context c, String path, ImageView img) {
        try {
            if (c == null || path == null || img == null) return;
            RequestBuilder rb = tile(Glide.with(c).load(new File(path)), path);
            rb = (RequestBuilder) rb.diskCacheStrategy(DiskCacheStrategy.RESOURCE);
            rb.into(img);
        } catch (Throwable t) {
        }
    }

    /** A preset of the wallpaper gallery: its 480x360 resource was drawn into the tile as it was. */
    public static void preset(ImageView img, int res) {
        try {
            if (img == null) return;
            tile(Glide.with(img.getContext()).load(Integer.valueOf(res)), "").into(img);
        } catch (Throwable t) {
            img.setImageResource(res);
        }
    }

    /** From the screen's {@code onDestroy}: no tile stays in Glide's memory behind it. */
    public static void left(Activity a) {
        try {
            new Handler(Looper.getMainLooper()).post(new Clear(a.getApplicationContext()));
        } catch (Throwable t) {
        }
    }

    static final class Clear implements Runnable {
        private final Context c;

        Clear(Context c) {
            this.c = c;
        }

        public void run() {
            try {
                Glide.get(c).clearMemory();
            } catch (Throwable t) {
            }
        }
    }

    private static RequestBuilder tile(RequestBuilder rb, String name) {
        rb = (RequestBuilder) rb.format(DecodeFormat.PREFER_RGB_565);
        rb = (RequestBuilder) rb.downsample(isJpeg(name) ? HALF : WHOLE);
        rb = (RequestBuilder) rb.transform(SHRINK);
        return (RequestBuilder) rb.encodeQuality(QUALITY);
    }

    private static boolean isJpeg(String name) {
        String n = name.toLowerCase();
        return n.endsWith(".jpg") || n.endsWith(".jpeg");
    }

    /**
     * Twice the tile, so the decoder's sampling (a DCT average in JPEG) leaves the last halving to
     * {@link Shrink}; a non-JPEG picture of moderate size is read whole, sampling there drops pixels.
     */
    static final class Half extends DownsampleStrategy {
        private final boolean whole;

        Half(boolean whole) {
            this.whole = whole;
        }

        public float getScaleFactor(int sw, int sh, int w, int h) {
            if (whole && (long) sw * sh <= WHOLE_MAX) return 1f;
            float f = 2f * Math.max((float) w / sw, (float) h / sh);
            return Math.min(1f, f);
        }

        public DownsampleStrategy.SampleSizeRounding getSampleSizeRounding(int sw, int sh, int w, int h) {
            return DownsampleStrategy.SampleSizeRounding.QUALITY;
        }
    }

    static final class Shrink extends BitmapTransformation {
        private static final byte[] ID = "com.innioasis.ipp.Thumbs.Shrink.1".getBytes();

        protected Bitmap transform(BitmapPool pool, Bitmap src, int w, int h) {
            return shrink(pool, src, w, h);
        }

        public boolean equals(Object o) {
            return o instanceof Shrink;
        }

        public int hashCode() {
            return 0x1b5e7a;
        }

        public void updateDiskCacheKey(MessageDigest md) {
            md.update(ID);
        }
    }

    /** Centre crop to w x h, by halves while the source is at least twice the target. */
    static Bitmap shrink(BitmapPool pool, Bitmap src, int w, int h) {
        int sw = src.getWidth();
        int sh = src.getHeight();
        if (sw == w && sh == h) return src;
        float scale = Math.max((float) w / sw, (float) h / sh);
        int cw = Math.min(sw, Math.round(w / scale));
        int ch = Math.min(sh, Math.round(h / scale));
        Rect r = new Rect((sw - cw) / 2, (sh - ch) / 2, (sw - cw) / 2 + cw, (sh - ch) / 2 + ch);
        Bitmap.Config cfg = src.getConfig() == Bitmap.Config.RGB_565
                ? Bitmap.Config.RGB_565 : Bitmap.Config.ARGB_8888;
        Paint p = new Paint(Paint.FILTER_BITMAP_FLAG | Paint.DITHER_FLAG);
        Bitmap cur = src;
        while (r.width() >= 2 * w && r.height() >= 2 * h) {
            int nw = r.width() / 2;
            int nh = r.height() / 2;
            Bitmap next = blank(pool, nw, nh, cfg);
            new Canvas(next).drawBitmap(cur, r, new Rect(0, 0, nw, nh), p);
            if (cur != src) pool.put(cur);
            cur = next;
            r = new Rect(0, 0, nw, nh);
        }
        Bitmap out = blank(pool, w, h, cfg);
        new Canvas(out).drawBitmap(cur, r, new Rect(0, 0, w, h), p);
        if (cur != src) pool.put(cur);
        return out;
    }

    private static Bitmap blank(BitmapPool pool, int w, int h, Bitmap.Config cfg) {
        Bitmap b = pool.get(w, h, cfg);
        if (cfg == Bitmap.Config.ARGB_8888) b.eraseColor(0);
        return b;
    }
}
