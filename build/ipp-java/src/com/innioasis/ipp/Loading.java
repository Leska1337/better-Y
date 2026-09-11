package com.innioasis.ipp;

import android.graphics.Color;
import android.graphics.ColorMatrix;
import android.graphics.ColorMatrixColorFilter;
import android.graphics.drawable.GradientDrawable;
import android.view.View;
import android.widget.ImageView;
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
