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
 * Light / dark / themed icons.
 *
 * The set encodes state ACROSS FILES, not inside them: "shuffle on" and "shuffle off" are two
 * drawings, and each file is filled with exactly one flat colour — #FFFFFF for an on state,
 * #C5C5C5 for an off one. That is what makes the dark mode a recolour rather than a second set of
 * artwork: SRC_IN replaces RGB and keeps alpha, so tinting the light file is pixel-for-pixel what
 * a dark file would be, antialiased edges included — so there is no second, dark set of PNGs to
 * keep in step.
 *
 * Three modes ({@code icon_tint}):
 *   0 LIGHT — the artwork's own colours (stock look).
 *   1 DARK  — recoloured #121212 on / #717171 off.
 *   2 THEME — the ACTIVE icons painted in the timeline's colour, the inactive ones left at their
 *             own #C5C5C5, which is what keeps the two states distinguishable. A theme with no
 *             colour of its own falls back to plain light.
 *
 * The setting covers the Now-Playing button row only. Menu icons ({@link #menu}) always take the
 * colour of the text beside them — see the note there.
 *
 * Everything is applied through {@link #apply} / {@link #menu}, so a recycled ImageView never
 * keeps a stale filter or alpha (an album cover inheriting one would come out tinted).
 */
public final class Icons {

    private static final int LIGHT = 0;
    private static final int DARK = 1;
    private static final int THEME = 2;

    private static final int FULL_ALPHA = 255;

    // Fed to itemSetTextColor as the "theme has no colour" fallback; if it comes back unchanged
    // the theme defines none. Alpha 0 -> can never collide with a real theme colour.
    private static final int PROBE = 0x00FEEDBE;
    private static final int NO_COLOR = 0;

    // Reused, never attached to a window. Built on the APPLICATION context on purpose:
    // a static View holding an Activity would leak it.
    private static TextView probe;

    private static int mode() {
        Context c = Y1Application.Companion.getAppContext();
        return Prefs.val(c, "icon_tint");
    }

    /**
     * The theme's item text colour, read through the only public door there is: ThemeManager
     * keeps its parsed config private, but {@code itemSetTextColor} substitutes the theme's own
     * colour for the one passed in whenever it has one — so paint a scratch TextView with a
     * sentinel and see whether it survived. Read live (never memoised) so a theme switch is
     * picked up without restarting the app; the parse itself is memoised in Theme.parseColor.
     */
    private static int themeColor() {
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) return NO_COLOR;
        try {
            if (probe == null) probe = new TextView(c);
            ThemeManager.INSTANCE.itemSetTextColor(probe, PROBE, false);
            int v = probe.getCurrentTextColor();
            return v == PROBE ? NO_COLOR : v;
        } catch (Throwable t) {
            return NO_COLOR;
        }
    }

    /** The dimmed ("off") members of the set — the files drawn at #C5C5C5. */
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

    /**
     * The colour an icon in the given state is drawn in right now. Public because the audiobook
     * speed / timer value beside its icon is a TextView and has to be painted the same, or the
     * pair would read as two things.
     */
    public static int stateColor(boolean on, int tint) {
        int m = mode();
        if (m == DARK) return on ? ON_DARK : OFF_DARK;
        if (m == THEME && on) {
            int c = (tint == NO_COLOR) ? themeColor() : tint;
            if (c != NO_COLOR) return c;
        }
        // THEME leaves the "off" state at its own grey, for the same reason isDimmed exists.
        return on ? ON_LIGHT : OFF_LIGHT;
    }

    /**
     * Draw one Now-Playing button, honouring the current mode. {@code tint} is the colour THEME
     * mode paints with at this site (the timeline's own colour); 0 falls back to the theme's item
     * text colour.
     *
     * The state is read off the file: {@link #isDimmed} lists the "off" drawings. In THEME mode
     * only the ACTIVE icons take the theme colour — the dimmed ones stay at their own #C5C5C5.
     * Painting both in one colour, even with the "off" one at 77% alpha, left the two states too
     * close to tell apart; keeping the off state grey is what makes "shuffle on" read differently
     * from "shuffle off" whatever the theme colour is.
     *
     * When the wanted colour IS the artwork's own, the filter is cleared instead of set — same
     * pixels, and no filter left on a view that may be recycled for a real picture.
     */
    public static void apply(ImageView iv, int light, int tint) {
        if (iv == null || light == 0) return;
        boolean on = !isDimmed(light);
        iv.setImageResource(light);
        int c = stateColor(on, tint);
        if (c == (on ? ON_LIGHT : OFF_LIGHT)) reset(iv);
        else paint(iv, c);
    }

    /** Same as {@link #apply} with no site colour of its own. */
    public static void apply(ImageView iv, int light) {
        apply(iv, light, NO_COLOR);
    }

    // ---- icons that carry a value: audiobook speed and sleep timer ---------------------
    //
    // Five rates and five timer steps cannot be told apart by artwork, so the value is written
    // into the window the "on" drawings leave empty. Beside the icon it does not work: the number
    // is 2-4 characters wide depending on the setting, so the buttons after it would shift every
    // time it changed.
    //
    // The window is measured off the artwork's alpha, in the 72x72 space the set is drawn in, and
    // scaled to whatever the bitmap turns out to be — redrawing the icons at another size changes
    // nothing here, only moving the hole does.
    //
    // It is the hole inside the ring of ipp_timer_on, which runs y 25..58 and is centred on
    // x 35 — NOT on the bitmap's own 36, and not on the middle of the ring's outer bounds either,
    // because the stem hangs into it from the top. Centring the text on the bitmap instead of on
    // the hole is what left the digits sitting high and to the right of the ring.
    private static final float WIN_L = 20f;
    private static final float WIN_T = 28f;
    private static final float WIN_R = 51f;
    private static final float WIN_B = 53f;

    /** Box the value gets when it is drawn on its OWN, with no artwork under it (speed). */
    private static final float BOX_W = 68f;
    private static final float BOX_H = 52f;

    /** res|text -> the stamped bitmap. A handful of entries, all 72x72. */
    private static final java.util.HashMap stamps = new java.util.HashMap();

    /**
     * Draw a button with its value inside it. Only ever called for an "on" drawing (the default
     * setting shows no number at all), so the digits are written in that artwork's own white and
     * the mode's recolour then covers icon and number alike — they are one bitmap by then.
     */
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
     * A button whose whole face IS the value — no artwork under it. The audiobook speed uses this
     * once it leaves 1.0: written inside the speedometer the number had to be abbreviated to two
     * or three characters, and "0.75" at that size is a smudge; given the whole button it is
     * roughly twice the size and needs no abbreviating.
     *
     * {@code widest} is the longest label the setting can take, and the type size is measured from
     * it, so the number does not change size as the cycle is clicked through.
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
            // the theme's font, read per call the way every code-built view here has to
            p.setTypeface(android.graphics.Typeface.create(android.graphics.Typeface.MONOSPACE,
                    android.graphics.Typeface.BOLD));
            p.setTextAlign(android.graphics.Paint.Align.CENTER);
            // start from the window's height and shrink until the widest value fits its width
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

    /**
     * A menu icon: always painted in the colour of the text beside it, whatever {@code icon_tint}
     * says — that setting is about the Now-Playing button row alone. Called after the row's own
     * ThemeManager colour has been applied, so it also re-colours with the text when the wheel
     * lands on the row. These icons have no "off" state, so there is nothing to keep apart.
     */
    public static void menu(ImageView iv, int textColor) {
        if (iv == null) return;
        if (textColor == NO_COLOR) reset(iv);
        else paint(iv, textColor);
    }

    private static void paint(ImageView iv, int color) {
        iv.setColorFilter(color, PorterDuff.Mode.SRC_IN);
        iv.setImageAlpha(FULL_ALPHA);
    }

    /** Drop tint + dim. Needed wherever one of these icons shares a recycled view with real art. */
    public static void reset(ImageView iv) {
        if (iv == null) return;
        iv.clearColorFilter();
        iv.setImageAlpha(FULL_ALPHA);
    }

    // ---- the Now-Playing timeline colour -----------------------------------------------------
    //
    // Sampled from the progress bar's own drawable rather than guessed, so it is right in all
    // three cases: the stock XML gradient (#0067CF -> #32FFEB, vertical), a theme that sets
    // playerConfig.progressColor (ThemeManager applies that as a SRC_IN filter on this very
    // Drawable instance), and any future change to either. Memoised on the drawable instance —
    // a new player Activity inflates a new one, and a theme switch recreates the Activity.
    private static Object tlKey;
    private static int tlColor;

    private static final int SW = 4;
    private static final int SH = 8;

    /** Average colour of the played part of the timeline, or 0 when it can't be read. */
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

    /**
     * Render the progress layer into a tiny bitmap and average its opaque pixels. The layer is a
     * ClipDrawable whose level is the current playback position, so it must be temporarily opened
     * to full — level and bounds are both restored before returning, and the bar redraws itself
     * from the next progress tick anyway.
     */
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
                // restoring must never take the player down
            }
            if (bm != null) bm.recycle();
        }
    }
}
