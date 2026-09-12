package com.innioasis.ipp;

import android.app.ProgressDialog;
import android.graphics.Color;
import android.graphics.ColorMatrix;
import android.graphics.ColorMatrixColorFilter;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.Window;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.innioasis.y1.R;
import com.innioasis.y1.theme.ThemeManager;

/**
 * The progress window ({@code LoadingDialog}: Update library, Cache library, clearing the cache,
 * the backup) in the theme's dialog colours — the same {@code dialogBackgroundColor} /
 * {@code dialogTextColor} the Yes/No dialogs take. Its layout has them written in (a white box,
 * #102162 text), and those are also the fallbacks here, so with no theme nothing changes.
 *
 * The spinner is tinted only when the theme names a text colour: its own blue is part of the stock
 * look, and a tint the theme did not ask for would replace it for no reason. It must not be tinted
 * with a plain colour filter: {@code loading.png} fades from navy to white at FULL alpha, so a
 * flat SRC_IN/ATOP fills the whole ring and the rotation stops being visible. {@link #FADE} turns
 * that darkness into alpha instead — the ring comes out in the theme's colour fading to nothing,
 * which is how the platform spinner on the USB screen looks.
 *
 * {@link #progress} dresses the OTHER progress window, the platform {@code ProgressDialog} the
 * wallpaper gallery raises while it reads the card.
 */
public final class Loading {

    private Loading() { }

    /** {@code @drawable/loading_dialog}. */
    private static final int BOX = 0xFFFFFFFF;
    private static final int RADIUS_DIP = 10;

    /** {@code dialog_loading.xml}. */
    private static final int TEXT = 0xFF102162;

    /** Alpha 0: a real theme colour can never be this, so it answers "the theme names none". */
    private static final int PROBE = 0x00FEEDBE;

    /** From {@code LoadingDialog.onCreate}, right after {@code setContentView}. */
    public static void paint(View root) {
        if (root == null) return;
        try {
            ThemeManager tm = ThemeManager.INSTANCE;
            GradientDrawable box = new GradientDrawable();
            box.setColor(tm.dialogBGColor(BOX));
            box.setCornerRadius(RADIUS_DIP * root.getResources().getDisplayMetrics().density);
            root.setBackgroundDrawable(box);

            int themed = tm.dialogTextColor(PROBE);
            int text = themed == PROBE ? TEXT : themed;
            text(root, R.id.content, text);
            text(root, R.id.tip, text);
            if (themed != PROBE) {
                View img = root.findViewById(R.id.loading_img);
                if (img instanceof ImageView) ((ImageView) img).setColorFilter(fade(themed));
            }
        } catch (Throwable t) {
            // a stock-coloured progress window is still a progress window
        }
    }

    /**
     * How much alpha one unit of darkness is worth. The ring's darkest pixel (#102162) has a
     * luminance of about 32, so without the gain its head would stop at 87% opacity.
     */
    private static final float FADE = 1.15f;

    // ------------------------------------------------ the PLATFORM's progress window (wallpapers)

    /** A rule under a dialog's title is a bare View a pixel or two high; nothing else here is. */
    private static final int RULE_MAX_DIP = 4;

    /**
     * The window the wallpaper gallery raises while it walks the card for pictures — a platform
     * {@code ProgressDialog}, but the app's own and not the system's, so it can be dressed.
     *
     * What it ends up showing is its title over a turning circle: the message under them is the
     * word "Searching" beside a title that already said as much, and with it gone the title is the
     * one line on the window and reads better centred. The colours are the theme's dialog pair,
     * the same {@link #paint} gives the app's own progress window, and they are applied only when
     * the theme names them — the platform's window is a look of its own, not a defect to fix.
     *
     * The views are found by walking the window rather than by id: the ids of an AlertDialog's
     * parts are {@code com.android.internal.R.id.*} and not ours to name.
     */
    public static void progress(ProgressDialog d) {
        if (d == null) return;
        try {
            d.setMessage("");
            Window w = d.getWindow();
            View decor = w == null ? null : w.getDecorView();
            if (decor == null) return;

            ThemeManager tm = ThemeManager.INSTANCE;
            int bg = tm.dialogBGColor(PROBE);
            boolean boxed = bg != PROBE;
            float density = decor.getResources().getDisplayMetrics().density;
            if (boxed) {
                // The platform's background is a nine-patch and carries the window's padding; a
                // plain colour has none, so it is read off the drawable being replaced and put
                // back by hand, or the title ends up against the edge of the box.
                Rect pad = new Rect();
                Drawable had = decor.getBackground();
                if (had != null) had.getPadding(pad);
                GradientDrawable box = new GradientDrawable();
                box.setColor(bg);
                box.setCornerRadius(RADIUS_DIP * density);
                w.setBackgroundDrawable(box);
                decor.setPadding(pad.left, pad.top, pad.right, pad.bottom);
            }
            // From the decor's CHILDREN: the walk clears the background of every group it passes,
            // and the decor's own is the box just given it.
            int fg = tm.dialogTextColor(PROBE);
            int rule = (int) (RULE_MAX_DIP * density);
            if (decor instanceof ViewGroup) {
                ViewGroup g = (ViewGroup) decor;
                for (int i = 0; i < g.getChildCount(); i++) dress(g.getChildAt(i), fg, rule, boxed);
            } else {
                dress(decor, fg, rule, boxed);
            }
        } catch (Throwable t) {
            // the platform's own window is still a progress window
        }
    }

    private static void dress(View v, int color, int ruleMax, boolean boxed) {
        boolean themed = color != PROBE;
        if (v instanceof TextView) {
            TextView tv = (TextView) v;
            CharSequence s = tv.getText();
            if (s == null || s.length() == 0) {
                tv.setVisibility(View.GONE);
                return;
            }
            tv.setGravity(Gravity.CENTER);
            if (themed) tv.setTextColor(color);
            return;
        }
        if (v instanceof ProgressBar) {
            // With the message gone the circle is alone on its line, and that line was laid out
            // to hold the two side by side: it stays where the message left it unless both the
            // row and the circle's own place in it are told to centre.
            centre(v);
            if (themed) {
                Drawable dr = ((ProgressBar) v).getIndeterminateDrawable();
                if (dr != null) dr.setColorFilter(color, PorterDuff.Mode.SRC_IN);
            }
            return;
        }
        if (v instanceof ViewGroup) {
            // Each panel of an AlertDialog carries a nine-patch of its own — the white box that
            // showed up INSIDE the one this window was just given. Only the window's background
            // is wanted, so the panels give theirs up. Their padding is not lost with it: a view
            // keeps the padding a background gave it when that background goes.
            if (boxed) v.setBackgroundDrawable(null);
            ViewGroup g = (ViewGroup) v;
            for (int i = 0; i < g.getChildCount(); i++) dress(g.getChildAt(i), color, ruleMax, boxed);
            return;
        }
        if (themed) {
            // The rule under the title, which the platform draws in its own accent. Its height is
            // read from the layout params rather than from the view: this runs as the window is
            // shown, before anything has been measured.
            ViewGroup.LayoutParams lp = v.getLayoutParams();
            if (lp != null && lp.height > 0 && lp.height <= ruleMax) v.setBackgroundColor(color);
        }
    }

    private static void centre(View v) {
        ViewGroup.LayoutParams lp = v.getLayoutParams();
        if (lp instanceof LinearLayout.LayoutParams) {
            ((LinearLayout.LayoutParams) lp).gravity = Gravity.CENTER;
        } else if (lp instanceof FrameLayout.LayoutParams) {
            ((FrameLayout.LayoutParams) lp).gravity = Gravity.CENTER;
        }
        ViewParent p = v.getParent();
        if (p instanceof LinearLayout) {
            ((LinearLayout) p).setGravity(Gravity.CENTER);
        } else if (p instanceof RelativeLayout) {
            ((RelativeLayout) p).setGravity(Gravity.CENTER);
        }
    }

    /** Colour: the tint. Alpha: the source's alpha minus its luminance, scaled by {@link #FADE}. */
    private static ColorMatrixColorFilter fade(int c) {
        float k = FADE;
        return new ColorMatrixColorFilter(new ColorMatrix(new float[] {
                0, 0, 0, 0, Color.red(c),
                0, 0, 0, 0, Color.green(c),
                0, 0, 0, 0, Color.blue(c),
                -0.299f * k, -0.587f * k, -0.114f * k, k, 0,
        }));
    }

    private static void text(View root, int id, int color) {
        View v = root.findViewById(id);
        if (v instanceof TextView) ((TextView) v).setTextColor(color);
    }
}
