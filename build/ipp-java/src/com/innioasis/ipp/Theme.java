package com.innioasis.ipp;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.PixelFormat;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.view.View;

import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.theme.ThemeManager;

import java.util.HashMap;

/**
 * Theme helpers.
 *
 * {@link #parseColor} replaces the body of {@code ThemeManager.getColor(String)}, which called
 * {@code Color.parseColor} on every invocation with no cache at all. That method sits under
 * {@code itemSetTextColor} / {@code optionSetTextColor} / {@code menuItemSetTextColor}, i.e. it
 * runs once per TextView per bind: a single wheel click can rebind ~8 visible rows up to 11 times
 * (stock's SpeedUtil acceleration), which is a few hundred string parses per click.
 *
 * The mapping "#ffffff" -> int is a pure function of the string, so the cache never needs
 * invalidating on a theme change; it is bounded by the handful of distinct colours a config.json
 * declares. Nulls are cached too (a malformed colour must not be re-parsed on every row).
 *
 * Raw (non-generic) types: the bundled d8 crashes dexing generic Signature attrs.
 */
public final class Theme {

    private static final HashMap CACHE = new HashMap();

    /** Stock semantics: null / blank -> null, unparseable -> null, otherwise the parsed colour. */
    public static Integer parseColor(String s) {
        if (s == null) return null;
        if (CACHE.containsKey(s)) return (Integer) CACHE.get(s);
        Integer v = null;
        if (s.trim().length() != 0) {
            try {
                v = Integer.valueOf(Color.parseColor(s));
            } catch (Throwable t) {
                v = null;                      // stock returned null for an unparseable colour
            }
        }
        CACHE.put(s, v);
        return v;
    }

    // ------------------------------------------------- does the theme paint the list rows itself?

    /**
     * Is a list row's own background OPAQUE, or does the wallpaper show through it? Asked by
     * anything washed over a row — the group captions of the better-Y menu and the queue, the
     * queue's playing row — since one alpha reads as a band over a colour and as a stain over a
     * photograph.
     *
     * **The config does not answer it:** every theme declares {@code itemBackground}, and what
     * separates them is behind it — "Frutiger Aero" ships a png transparent across its whole
     * canvas, "Junji Ito" writes a colour where a file name belongs (and
     * {@code ThemeManager.setBackground} resolves a colour only in its asynchronous branch, never
     * entered for a value that is not a file), so both come out as the stock, empty
     * {@code item_no_selected}. So the row is painted and then looked at.
     */
    public static boolean rowsPainted() {
        try {
            String theme = ThemeManager.INSTANCE.getThemeName();
            // Memoised against the theme's NAME: a switch recreates the Activity, not this class.
            if (painted != null && eq(theme, paintedFor)) return painted.booleanValue();
            Context c = Y1Application.Companion.getAppContext();
            if (c == null) return false;
            if (probe == null) probe = new View(c);
            ThemeManager.INSTANCE.itemSetBackground(probe, R.drawable.item_no_selected, false);
            boolean v = opaque(probe.getBackground());
            painted = Boolean.valueOf(v);
            paintedFor = theme;
            return v;
        } catch (Throwable t) {
            return false;                      // no theme is a theme with transparent rows
        }
    }

    /**
     * The scratch row the question is asked of. Kept rather than built per call: ThemeManager
     * hands its asynchronous answer to the view that asked, so a bitmap still being decoded
     * arrives on THIS one ({@link #landed}).
     */
    private static View probe;

    private static Boolean painted;
    private static String paintedFor;
    private static Runnable watch;

    /** One watcher at a time — the screen drawing bands, while it is on screen. */
    public static void watchRows(Runnable r) {
        watch = r;
    }

    /** ...and it takes its own back, never somebody else's: two such screens can be stacked. */
    public static void unwatchRows(Runnable r) {
        if (watch == r) watch = null;
    }

    /**
     * A theme bitmap has landed on a view (the asynchronous applier, through {@code Rows.reflat}).
     * Only ours matters: until the picture is decoded the probe answers "not painted", which on a
     * cold start is what the first screen to ask is told.
     */
    static void landed(View v) {
        if (v == null || v != probe) return;
        painted = null;
        Runnable r = watch;
        // Posted: the applier is in the middle of setting backgrounds, and the watcher rebuilds a
        // screen. The probe has no window, so the Handler is explicit.
        if (r != null) new Handler(Looper.getMainLooper()).post(r);
    }

    /** A background that lets more than half the wallpaper through is not one. */
    private static final int HALF = 128;

    private static boolean opaque(Drawable d) {
        if (d == null) return false;
        if (d instanceof ColorDrawable) return Color.alpha(((ColorDrawable) d).getColor()) >= HALF;
        if (d instanceof BitmapDrawable) {
            Bitmap b = ((BitmapDrawable) d).getBitmap();
            if (b == null || b.isRecycled()) return false;
            if (!b.hasAlpha()) return true;
            int w = b.getWidth(), h = b.getHeight();
            if (w <= 0 || h <= 0) return false;
            // Nine points, not the whole canvas: a row's background is drawn to be uniform.
            int sum = 0;
            for (int y = 0; y < 3; y++) {
                for (int x = 0; x < 3; x++) {
                    sum += Color.alpha(b.getPixel(x * (w - 1) / 2, y * (h - 1) / 2));
                }
            }
            return sum / 9 >= HALF;
        }
        // The stock item_no_selected is a shape filled with @android:color/transparent, and says so.
        return d.getOpacity() == PixelFormat.OPAQUE;
    }

    private static boolean eq(String a, String b) {
        return a == null ? b == null : a.equals(b);
    }
}
