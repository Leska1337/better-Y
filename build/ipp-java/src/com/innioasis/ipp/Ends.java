package com.innioasis.ipp;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.view.View;

import java.util.HashMap;
import java.util.WeakHashMap;

/**
 * A theme's row bitmap drawn so its ends keep their proportions: the columns at either end that
 * differ from the uniform middle are scaled to the row's height only, the middle is stretched. A
 * cursor's corners then look the same in a narrow list and a wide one. The ends are found in the
 * bitmap itself, once per bitmap; a bitmap with no uniform middle is stretched whole, as before.
 */
public final class Ends {

    private Ends() { }

    /** Per channel: compression noise is not an edge. */
    private static final int TOL = 12;
    private static final int[] PLAIN = new int[0];
    private static final WeakHashMap CAPS = new WeakHashMap();

    /** In place of {@code new BitmapDrawable}: still one, so the callers' bitmap checks hold. */
    static BitmapDrawable of(Resources r, Bitmap b) {
        int[] c = caps(b);
        return c == null ? new BitmapDrawable(r, b) : new Sliced(r, b, c[0], c[1]);
    }

    /**
     * An APK resource the same way: stock's own cursor {@code item_setting_sel} is a plain PNG,
     * stretched whole, where the lists' {@code item_selected_no_arrow} is a 9-patch. Anything that
     * is not a plain bitmap with ends comes back as stock builds it.
     */
    static Drawable drawable(Resources r, int resid) {
        Bitmap b = resBitmap(r, resid);
        if (b != null) {
            int[] c = caps(b);
            Sliced s = new Sliced(r, b, c[0], c[1]);
            s.res = resid;
            return s;
        }
        return r.getDrawable(resid);
    }

    /** {@code setBackgroundResource} for a resource {@link #drawable} slices; false leaves it to stock. */
    static boolean res(View v, int resid) {
        Drawable cur = v.getBackground();
        if (cur instanceof Sliced && ((Sliced) cur).res == resid) return true;
        if (resBitmap(v.getResources(), resid) == null) return false;
        v.setBackgroundDrawable(drawable(v.getResources(), resid));
        return true;
    }

    /** Per resource, once: its bitmap when it is plain and has ends, else null. */
    private static Bitmap resBitmap(Resources r, int resid) {
        Integer key = Integer.valueOf(resid);
        Object o;
        synchronized (RES) {
            o = RES.get(key);
        }
        if (o == null) {
            Drawable d = r.getDrawable(resid);
            Bitmap b = d instanceof BitmapDrawable ? ((BitmapDrawable) d).getBitmap() : null;
            o = b != null && caps(b) != null ? (Object) b : PLAIN;
            synchronized (RES) {
                RES.put(key, o);
            }
        }
        return o == PLAIN ? null : (Bitmap) o;
    }

    private static final HashMap RES = new HashMap();

    private static int[] caps(Bitmap b) {
        Object o;
        synchronized (CAPS) {
            o = CAPS.get(b);
        }
        if (o == null) {
            int[] c = measure(b);
            o = c == null ? PLAIN : c;
            synchronized (CAPS) {
                CAPS.put(b, o);
            }
        }
        return o == PLAIN ? null : (int[]) o;
    }

    /** The widths of the two ends, or null: no ends, or a middle under a quarter, which is a picture. */
    private static int[] measure(Bitmap b) {
        try {
            int w = b.getWidth();
            int h = b.getHeight();
            if (w < 8 || h < 2) return null;
            int mid = w / 2;
            int[] ref = new int[h];
            int[] col = new int[h];
            b.getPixels(ref, 0, 1, mid, 0, 1, h);
            int left = mid;
            while (left > 0 && same(b, left - 1, ref, col)) left--;
            int right = mid;
            while (right < w - 1 && same(b, right + 1, ref, col)) right++;
            if (left == 0 && right == w - 1) return null;
            if (right - left + 1 < w / 4) return null;
            return new int[]{left, w - 1 - right};
        } catch (Throwable t) {
            return null;
        }
    }

    /** Every row: a corner's arm is a few pixels thick and slips between sampled rows. */
    private static boolean same(Bitmap b, int x, int[] ref, int[] col) {
        b.getPixels(col, 0, 1, x, 0, 1, col.length);
        for (int i = 0; i < col.length; i++) {
            int p = col[i];
            int q = ref[i];
            for (int s = 0; s < 32; s += 8) {
                if (Math.abs(((p >>> s) & 0xFF) - ((q >>> s) & 0xFF)) > TOL) return false;
            }
        }
        return true;
    }

    static final class Sliced extends BitmapDrawable {
        private final int capL;
        private final int capR;
        /** The APK resource it was built from, 0 for a theme bitmap. */
        int res;
        private final Rect src = new Rect();
        private final Rect dst = new Rect();

        Sliced(Resources r, Bitmap b, int capL, int capR) {
            super(r, b);
            this.capL = capL;
            this.capR = capR;
        }

        @Override
        public void draw(Canvas c) {
            Bitmap b = getBitmap();
            Rect o = getBounds();
            int bw = b.getWidth();
            int bh = b.getHeight();
            if (o.height() <= 0 || bh <= 0) return;
            float s = (float) o.height() / bh;
            int dl = Math.round(capL * s);
            int dr = Math.round(capR * s);
            // a row narrower than its two ends: stretched whole
            if (dl + dr >= o.width()) {
                super.draw(c);
                return;
            }
            if (capL > 0) {
                src.set(0, 0, capL, bh);
                dst.set(o.left, o.top, o.left + dl, o.bottom);
                c.drawBitmap(b, src, dst, getPaint());
            }
            src.set(capL, 0, bw - capR, bh);
            dst.set(o.left + dl, o.top, o.right - dr, o.bottom);
            c.drawBitmap(b, src, dst, getPaint());
            if (capR > 0) {
                src.set(bw - capR, 0, bw, bh);
                dst.set(o.right - dr, o.top, o.right, o.bottom);
                c.drawBitmap(b, src, dst, getPaint());
            }
        }
    }
}
