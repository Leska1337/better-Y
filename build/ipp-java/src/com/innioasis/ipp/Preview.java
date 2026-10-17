package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.graphics.Color;
import android.graphics.ColorMatrix;
import android.graphics.ColorMatrixColorFilter;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.innioasis.y1.R;
import com.innioasis.y1.activity.AboutActivity;
import com.innioasis.y1.activity.BrightnessActivity;
import com.innioasis.y1.activity.DateOneLevelActivity;
import com.innioasis.y1.activity.DateTwoLevelActivity;
import com.innioasis.y1.activity.EqActivity;
import com.innioasis.y1.activity.LanguageActivity;
import com.innioasis.y1.activity.SettingActivity;
import com.innioasis.y1.activity.WallpaperListActivity;

/**
 * "preview_text": the text beside the lists of Settings and the screens inside it, and inside
 * About, which the layouts write white past the theme. 0 LIGHT (the layouts' white), 1 DARK,
 * 2 THEME — the theme's unfocused list text. The Language pictures are text too, and are
 * recoloured.
 */
public final class Preview {

    private Preview() { }

    public static final String KEY = "preview_text";

    private static final int DARK = 1;
    private static final int THEME = 2;

    private static final int WHITE = 0xFFFFFFFF;
    private static final int BLACK = 0xFF121212;

    /** 0 for LIGHT: the layouts' own white is left alone. */
    private static int color(Context c) {
        int v = Prefs.val(c, KEY);
        if (v == DARK) return BLACK;
        if (v == THEME) {
            int t = Icons.themeColor();
            return t != 0 ? (t | 0xFF000000) : WHITE;
        }
        return 0;
    }

    /** From {@code MenuStyle.apply}, i.e. the end of every {@code BaseActivity.onResume}. */
    static void apply(Activity a) {
        try {
            int c = color(a);
            int fg = c == 0 ? WHITE : c;
            if (a instanceof SettingActivity) {
                text(a, R.id.right_title, fg);
                text(a, R.id.info_state_tv, fg);
            } else if (a instanceof AboutActivity) {
                text(a, R.id.info_state_tv1, fg);
                text(a, R.id.info_state_tv2, fg);
            } else if (a instanceof EqActivity) {
                text(a, R.id.text, fg);
            } else if (a instanceof WallpaperListActivity) {
                View img = a.findViewById(R.id.img);
                if (img != null && img.getParent() instanceof ViewGroup) all((ViewGroup) img.getParent(), fg);
            } else if (a instanceof BrightnessActivity) {
                View tv = a.findViewById(R.id.brightness_tv);
                if (tv != null && tv.getParent() instanceof ViewGroup) all((ViewGroup) tv.getParent(), fg);
            } else if (a instanceof DateOneLevelActivity) {
                text(a, R.id.show_time, fg);
                text(a, R.id.show_date, fg);
                text(a, R.id.show_day, fg);
            } else if (a instanceof DateTwoLevelActivity) {
                text(a, R.id.date_month_tv, fg);
                text(a, R.id.tv1, fg);
                text(a, R.id.tv2, fg);
                text(a, R.id.tv3, fg);
            } else if (a instanceof LanguageActivity) {
                View v = a.findViewById(R.id.image);
                if (v instanceof ImageView) tint((ImageView) v, c);
            }
        } catch (Throwable t) {
        }
    }

    private static void text(Activity a, int id, int color) {
        View v = a.findViewById(id);
        if (v instanceof TextView) ((TextView) v).setTextColor(color);
    }

    /** Direct children only: the preview column, not the list beside it. */
    private static void all(ViewGroup g, int color) {
        for (int i = 0; i < g.getChildCount(); i++) {
            View v = g.getChildAt(i);
            if (v instanceof TextView) ((TextView) v).setTextColor(color);
        }
    }

    /**
     * The pictures are all white: the other languages' grey is white at ~40% alpha. So the colour
     * is replaced and the alpha kept. A filter, so stock's setImageResource keeps it.
     */
    private static void tint(ImageView iv, int c) {
        if (c == 0) {
            iv.clearColorFilter();
            return;
        }
        ColorMatrix m = new ColorMatrix(new float[] {
                0, 0, 0, 0, Color.red(c),
                0, 0, 0, 0, Color.green(c),
                0, 0, 0, 0, Color.blue(c),
                0, 0, 0, 1, 0,
        });
        iv.setColorFilter(new ColorMatrixColorFilter(m));
    }
}
