package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.innioasis.y1.R;

/**
 * The status bar: "bar_text" colours its title and the battery percentage (0 LIGHT, 1 DARK,
 * 2 THEME — the list text's colour), "bar_icons" is a mask of the icons it shows. The icons
 * themselves stay the theme's: nothing here tints them.
 *
 * A hidden icon is folded to zero width, never GONE: stock sets the visibility of each from
 * several places, and a fold survives all of them.
 */
public final class TopBar {

    private TopBar() { }

    public static final String KEY_TEXT = "bar_text";

    public static final String KEY_ICONS = "bar_icons";

    public static final int PLAY = 1;
    public static final int HEADSET = 2;
    public static final int BLUETOOTH = 4;
    public static final int BATTERY = 8;

    public static final int ALL = PLAY | HEADSET | BLUETOOTH | BATTERY;

    /** In the order the picker lists them. */
    public static final int[] ICONS = new int[]{PLAY, HEADSET, BLUETOOTH, BATTERY};

    private static final int DARK = 1;
    private static final int THEME = 2;

    private static final int WHITE = 0xFFFFFFFF;
    private static final int BLACK = 0xFF121212;

    /** From {@code BaseActivity.onResume}, and from the menu when either setting changes. */
    public static void apply(Object activity) {
        if (!(activity instanceof Activity)) return;
        try {
            Activity a = (Activity) activity;
            // through the bar: the screen's own content may carry the same ids
            View bar = a.findViewById(R.id.status_bar);
            if (bar == null) return;
            int c = color(a);
            paint(bar, R.id.status_bar_time, c);
            paint(bar, R.id.battery_num, c);
            int mask = Prefs.val(a, KEY_ICONS);
            fold(bar, R.id.play, (mask & PLAY) == 0);
            fold(bar, R.id.headset, (mask & HEADSET) == 0);
            fold(bar, R.id.bluetooth, (mask & BLUETOOTH) == 0);
            fold(bar, R.id.battery, (mask & BATTERY) == 0);
        } catch (Throwable t) {
        }
    }

    private static int color(Context c) {
        int v = Prefs.val(c, KEY_TEXT);
        if (v == DARK) return BLACK;
        if (v == THEME) {
            int t = Icons.themeColor();
            if (t != 0) return t;
        }
        return WHITE;
    }

    private static void paint(View bar, int id, int color) {
        View v = bar.findViewById(id);
        if (v instanceof TextView) ((TextView) v).setTextColor(color);
    }

    /** The layout's own width and end margin are kept in a tag, to unfold to. */
    private static void fold(View bar, int id, boolean hide) {
        View v = bar.findViewById(id);
        if (v == null) return;
        ViewGroup.LayoutParams p = v.getLayoutParams();
        if (!(p instanceof LinearLayout.LayoutParams)) return;
        LinearLayout.LayoutParams lp = (LinearLayout.LayoutParams) p;
        Object tag = v.getTag(R.id.status_bar);
        int[] own;
        if (tag instanceof int[]) {
            own = (int[]) tag;
        } else {
            own = new int[]{lp.width, lp.getMarginEnd()};
            v.setTag(R.id.status_bar, own);
        }
        int w = hide ? 0 : own[0];
        int m = hide ? 0 : own[1];
        if (lp.width == w && lp.getMarginEnd() == m) return;
        lp.width = w;
        // both: the start/end form overwrites rightMargin on every layout pass
        lp.rightMargin = m;
        lp.setMarginEnd(m);
        v.setLayoutParams(lp);
    }
}
