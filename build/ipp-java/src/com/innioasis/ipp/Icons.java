package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.view.View;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;

import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.theme.ThemeManager;

/**
 * Icon colours, and the theme colours read through ThemeManager. Each icon file is one flat colour
 * (#FFFFFF on, #C5C5C5 off; state is ACROSS files), so a SRC_IN recolour is pixel-exact and there
 * is no dark set to keep in step. {@code icon_tint}, Now-Playing row only: 0 LIGHT (stock),
 * 1 DARK, 2 THEME — active icons in the timeline's colour, inactive ones left grey so the states
 * stay apart. Always applied through {@link #apply}/{@link #menu}: a recycled ImageView must not
 * keep a stale filter.
 */
public final class Icons {

    private static final int LIGHT = 0;
    private static final int DARK = 1;
    private static final int THEME = 2;

    private static final int FULL_ALPHA = 255;

    // Alpha 0, never a real theme colour: coming back unchanged means the theme names none.
    private static final int PROBE = 0x00FEEDBE;
    private static final int NO_COLOR = 0;

    // On the application context: a static View holding an Activity would leak it.
    private static TextView probe;

    private static int mode() {
        Context c = Y1Application.Companion.getAppContext();
        return Prefs.val(c, "icon_tint");
    }

    /** The theme's {@code itemTextColor}, or 0 when it names none. */
    public static int themeColor() {
        return probeColor(false, false);
    }

    /** {@code itemSelectedTextColor}, or 0 — no stock fallback, so callers must cope without. */
    public static int themeSelColor() {
        return probeColor(false, true);
    }

    /**
     * {@code menuItemTextColor}: anything drawn on the menu's own background asks for this, not the
     * row colour — a theme may need light text there over dark list text.
     */
    public static int menuColor() {
        return probeColor(true, false);
    }

    /** {@code bg_submenu}, {@code white} and {@code selected_text_color_submenu}. */
    private static final int MENU_BG = 0xFF8C94B2;
    private static final int MENU_TEXT = 0xFFFFFFFF;
    private static final int MENU_SEL = 0xFF3B3D78;

    /** Stock's when the theme names none. */
    public static int menuBackground() {
        try {
            Integer c = ThemeManager.INSTANCE.menuBGColor();
            if (c != null) return c.intValue();
        } catch (Throwable t) {
        }
        return MENU_BG;
    }

    /** Stock's when the theme names none. */
    public static int menuText(boolean focus) {
        int c = probeColor(true, focus);
        return c != NO_COLOR ? c : (focus ? MENU_SEL : MENU_TEXT);
    }

    /**
     * ThemeManager's config is private, but its setters substitute the theme's colour: paint a
     * scratch TextView with a sentinel and see whether it survived. Read live, so a theme switch
     * needs no restart.
     */
    private static int probeColor(boolean menu, boolean focus) {
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) return NO_COLOR;
        try {
            if (probe == null) probe = new TextView(c);
            if (menu) ThemeManager.INSTANCE.menuItemSetTextColor(probe, PROBE, focus);
            else ThemeManager.INSTANCE.itemSetTextColor(probe, PROBE, focus);
            int v = probe.getCurrentTextColor();
            return v == PROBE ? NO_COLOR : v;
        } catch (Throwable t) {
            return NO_COLOR;
        }
    }

    /** The "off" drawings. */
    private static boolean isDimmed(int light) {
        return light == R.mipmap.ipp_heart_off
                || light == R.mipmap.ipp_AB_off
                || light == R.mipmap.music_no_shuffle
                || light == R.mipmap.music_no_repeat
                || light == R.mipmap.ipp_speed_off
                || light == R.mipmap.ipp_timer_off;
    }

    private static final int ON_LIGHT = 0xFFFFFFFF;
    private static final int OFF_LIGHT = 0xFFC5C5C5;
    private static final int ON_DARK = 0xFF121212;
    private static final int OFF_DARK = 0xFF717171;

    public static int stateColor(boolean on, int tint) {
        int m = mode();
        if (m == DARK) return on ? ON_DARK : OFF_DARK;
        if (m == THEME && on) {
            int c = (tint == NO_COLOR) ? themeColor() : tint;
            if (c != NO_COLOR) return c;
        }
        return on ? ON_LIGHT : OFF_LIGHT;
    }

    /**
     * One Now-Playing button. {@code tint} is THEME mode's colour at this site; 0 = the theme's
     * item text colour. The artwork's own colour clears the filter instead of setting it.
     */
    public static void apply(ImageView iv, int light, int tint) {
        if (iv == null || light == 0) return;
        boolean on = !isDimmed(light);
        iv.setImageResource(light);
        int c = stateColor(on, tint);
        if (c == (on ? ON_LIGHT : OFF_LIGHT)) reset(iv);
        else paint(iv, c);
    }

    /** An "on" drawing the layout already put on the view, coloured as the buttons are. */
    public static void on(ImageView iv, int tint) {
        if (iv == null) return;
        int c = stateColor(true, tint);
        if (c == ON_LIGHT) reset(iv);
        else paint(iv, c);
    }

    public static void apply(ImageView iv, int light) {
        apply(iv, light, NO_COLOR);
    }

    // The value is written INTO the icon (beside it, its changing width would shift the row).
    // The window is the hole inside ipp_timer_on's ring, in the set's 72x72 space, measured off
    // the alpha: centred on x 35, not the bitmap's 36 — the stem hangs into it.
    private static final float WIN_L = 20f;
    private static final float WIN_T = 28f;
    private static final float WIN_R = 51f;
    private static final float WIN_B = 53f;

    /** The value drawn alone, with no artwork (speed). */
    private static final float BOX_W = 68f;
    private static final float BOX_H = 52f;

    // drawn in the theme's font, so dropped with the theme (themeChanged)
    private static final java.util.HashMap stamps = new java.util.HashMap();

    public static void themeChanged() {
        stamps.clear();
    }

    /** "On" drawings only: the digits are drawn white, then recoloured with the icon as one bitmap. */
    public static void label(ImageView iv, int light, int tint, String text) {
        if (iv == null || light == 0) return;
        if (text == null || text.length() == 0) {
            apply(iv, light, tint);
            return;
        }
        Bitmap bm = stamped(iv, light, text);
        if (bm == null) iv.setImageResource(light);
        else iv.setImageBitmap(bm);
        boolean on = !isDimmed(light);
        int c = stateColor(on, tint);
        if (c == (on ? ON_LIGHT : OFF_LIGHT)) reset(iv);
        else paint(iv, c);
    }

    /**
     * A button whose whole face is the value (the audiobook speed off 1.0). Sized from
     * {@code widest}, so the number keeps one size through the cycle.
     */
    public static void value(ImageView iv, String text, String widest, int tint) {
        if (iv == null || text == null || text.length() == 0) return;
        Bitmap bm = drawn(text, widest);
        if (bm != null) iv.setImageBitmap(bm);
        int c = stateColor(true, tint);
        if (c == ON_LIGHT) reset(iv);
        else paint(iv, c);
    }

    private static Bitmap drawn(String text, String widest) {
        try {
            String key = "v|" + text + "|" + widest;
            Object cached = stamps.get(key);
            if (cached instanceof Bitmap) return (Bitmap) cached;
            Bitmap bm = Bitmap.createBitmap(72, 72, Bitmap.Config.ARGB_8888);
            android.graphics.Paint p = new android.graphics.Paint(android.graphics.Paint.ANTI_ALIAS_FLAG);
            p.setColor(ON_LIGHT);
            p.setTypeface(android.graphics.Typeface.create(android.graphics.Typeface.MONOSPACE,
                    android.graphics.Typeface.BOLD));
            p.setTextAlign(android.graphics.Paint.Align.CENTER);
            p.setTextSize(BOX_H);
            float w = p.measureText(widest == null ? text : widest);
            if (w > BOX_W) p.setTextSize(BOX_H * BOX_W / w);
            android.graphics.Paint.FontMetrics fm = p.getFontMetrics();
            new Canvas(bm).drawText(text, 36f, 36f - (fm.ascent + fm.descent) / 2f, p);
            stamps.put(key, bm);
            return bm;
        } catch (Throwable e) {
            return null;
        }
    }

    private static Bitmap stamped(ImageView iv, int res, String text) {
        try {
            String key = res + "|" + text;
            Object cached = stamps.get(key);
            if (cached instanceof Bitmap) return (Bitmap) cached;
            Bitmap src = android.graphics.BitmapFactory.decodeResource(iv.getResources(), res);
            if (src == null) return null;
            Bitmap bm = src.copy(Bitmap.Config.ARGB_8888, true);
            if (bm == null) return null;
            float sx = bm.getWidth() / 72f;
            float sy = bm.getHeight() / 72f;
            float l = WIN_L * sx, r = WIN_R * sx, t = WIN_T * sy, b = WIN_B * sy;
            android.graphics.Paint p = new android.graphics.Paint(android.graphics.Paint.ANTI_ALIAS_FLAG);
            p.setColor(ON_LIGHT);
            p.setTypeface(android.graphics.Typeface.create(android.graphics.Typeface.MONOSPACE,
                    android.graphics.Typeface.BOLD));
            p.setTextAlign(android.graphics.Paint.Align.CENTER);
            p.setTextSize(b - t);
            float w = p.measureText(text);
            if (w > (r - l)) p.setTextSize((b - t) * (r - l) / w);
            android.graphics.Paint.FontMetrics fm = p.getFontMetrics();
            new Canvas(bm).drawText(text, (l + r) / 2f, (t + b) / 2f - (fm.ascent + fm.descent) / 2f, p);
            stamps.put(key, bm);
            return bm;
        } catch (Throwable e) {
            return null;
        }
    }

    /** A menu icon takes the colour of the text beside it, whatever {@code icon_tint} says. */
    public static void menu(ImageView iv, int textColor) {
        if (iv == null) return;
        if (textColor == NO_COLOR) reset(iv);
        else paint(iv, textColor);
    }

    private static void paint(ImageView iv, int color) {
        iv.setColorFilter(color, PorterDuff.Mode.SRC_IN);
        iv.setImageAlpha(FULL_ALPHA);
    }

    /** Wherever an icon shares a recycled view with real art. */
    public static void reset(ImageView iv) {
        if (iv == null) return;
        iv.clearColorFilter();
        iv.setImageAlpha(FULL_ALPHA);
    }

    // The timeline colour, sampled from the progress drawable itself — right for the stock
    // gradient and for a theme's progressColor filter alike. Memoised per drawable instance.
    private static Object tlKey;
    private static int tlColor;

    private static final int SW = 4;
    private static final int SH = 8;

    /** 0 when it cannot be read. */
    public static int timelineColor(Activity a) {
        if (a == null) return NO_COLOR;
        try {
            View v = a.findViewById(R.id.pb_player);
            if (!(v instanceof ProgressBar)) return NO_COLOR;
            Drawable pd = ((ProgressBar) v).getProgressDrawable();
            if (!(pd instanceof LayerDrawable)) return NO_COLOR;
            Drawable prog = ((LayerDrawable) pd).findDrawableByLayerId(android.R.id.progress);
            if (prog == null) return NO_COLOR;
            if (prog == tlKey) return tlColor;
            tlColor = sample(prog);
            tlKey = prog;
            return tlColor;
        } catch (Throwable t) {
            return NO_COLOR;
        }
    }

    private static String pcTheme;
    private static int pcColor;

    /** {@link #timelineColor} for a screen without a timeline. Memoised per theme name. */
    public static int progressColor() {
        try {
            String theme = ThemeManager.INSTANCE.getThemeName();
            if (theme == null) theme = "";
            if (theme.equals(pcTheme)) return pcColor;
            Context c = Y1Application.Companion.getAppContext();
            Drawable d = c.getResources().getDrawable(R.drawable.shape_progressbar_pro).mutate();
            if (!(d instanceof LayerDrawable)) return NO_COLOR;
            ProgressBar pb = new ProgressBar(c, null, android.R.attr.progressBarStyleHorizontal);
            pb.setProgressDrawable(d);
            ThemeManager.INSTANCE.setCustomBackground(pb);
            Drawable prog = ((LayerDrawable) d).findDrawableByLayerId(android.R.id.progress);
            if (prog == null) return NO_COLOR;
            pcColor = sample(prog);
            pcTheme = theme;
            return pcColor;
        } catch (Throwable t) {
            return NO_COLOR;
        }
    }

    /** Averages the opaque pixels; the clip level is opened to full and restored. */
    private static int sample(Drawable d) {
        Rect old = d.copyBounds();
        int level = d.getLevel();
        Bitmap bm = null;
        try {
            bm = Bitmap.createBitmap(SW, SH, Bitmap.Config.ARGB_8888);
            d.setBounds(0, 0, SW, SH);
            d.setLevel(10000);
            d.draw(new Canvas(bm));
            long r = 0, g = 0, b = 0;
            int n = 0;
            for (int y = 0; y < SH; y++) {
                for (int x = 0; x < SW; x++) {
                    int p = bm.getPixel(x, y);
                    if (((p >>> 24) & 0xFF) < 128) continue;
                    r += (p >> 16) & 0xFF;
                    g += (p >> 8) & 0xFF;
                    b += p & 0xFF;
                    n++;
                }
            }
            if (n == 0) return NO_COLOR;
            return 0xFF000000 | ((int) (r / n) << 16) | ((int) (g / n) << 8) | (int) (b / n);
        } catch (Throwable t) {
            return NO_COLOR;
        } finally {
            try {
                d.setLevel(level);
                d.setBounds(old);
            } catch (Throwable t) {
            }
            if (bm != null) bm.recycle();
        }
    }
}
