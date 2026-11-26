package com.innioasis.ipp;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.view.View;

import com.innioasis.y1.utils.WallpaperUtils;

/** The pinned disc bar over a song list: rows pass under it, so it needs a background of its own. */
public final class Head {

    /**
     * An opaque wallpaper copy behind the disc bar, so rows passing under it are not read through
     * it (stock themes keep it transparent). From {@code Disc.paint}, after the theme.
     */
    public static void backdrop(View bar) {
        try {
            if (bar == null) return;
            Bitmap w = WallpaperUtils.INSTANCE.getGlobalBitmap();
            if (w == null || w.isRecycled()) return;
            Drawable cur = bar.getBackground();
            Backdrop bd = new Backdrop(bar, w);
            // on top: the travelling highlight where it crosses the plate
            Drawable over = new Bar.PlatePart(bar);
            Drawable[] layers = cur == null ? new Drawable[] {bd, over} : new Drawable[] {bd, cur, over};
            bar.setBackgroundDrawable(new LayerDrawable(layers));
        } catch (Throwable t) {
        }
    }

    /** The wallpaper aligned to the SCREEN, so it matches at every point of the bar's travel. */
    static final class Backdrop extends Drawable {
        private final View host;
        private final Bitmap bmp;
        private final int[] loc = new int[2];
        private final Rect dst = new Rect();
        /**
         * Filtered as the window background draws it: the wallpaper is 320x240, and an unfiltered
         * upscale shows as a rectangle on a detailed wallpaper.
         */
        private final android.graphics.Paint paint = new android.graphics.Paint(
                android.graphics.Paint.FILTER_BITMAP_FLAG | android.graphics.Paint.DITHER_FLAG);

        Backdrop(View host, Bitmap bmp) {
            this.host = host;
            this.bmp = bmp;
        }

        public void draw(Canvas c) {
            if (bmp.isRecycled()) return;
            host.getLocationOnScreen(loc);
            android.util.DisplayMetrics dm = host.getResources().getDisplayMetrics();
            dst.set(-loc[0], -loc[1], dm.widthPixels - loc[0], dm.heightPixels - loc[1]);
            c.drawBitmap(bmp, null, dst, paint);
        }

        public void setAlpha(int a) { }

        public void setColorFilter(ColorFilter f) { }

        public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }
}
