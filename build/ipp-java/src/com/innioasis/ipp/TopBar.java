package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.innioasis.y1.R;
import com.innioasis.y1.activity.SettingActivity;
import com.innioasis.y1.base.BaseActivity;
import com.innioasis.y1.utils.SharedPreferencesUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * The status bar: "bar_text" colours its title and the battery percentage (0 LIGHT, 1 DARK,
 * 2 THEME — the list text's colour), "bar_icons" is a mask of the icons it shows. The icons
 * themselves stay the theme's: nothing here tints them. The battery percentage is ticked in the
 * same picker but stays stock's own "batteryPercentage", so stock shows and hides it itself.
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

    /** The picker's bit for stock's setting; never stored in "bar_icons". */
    public static final int PERCENT = 16;

    /** The section title; stored as "bar_header", so masks saved without it keep the title. */
    public static final int HEADER = 32;

    public static final String KEY_HEADER = "bar_header";

    /** 0 DEFAULT: title left, icons right. 1 CENTERED: icons left, title in the middle. */
    public static final String KEY_STYLE = "bar_style";

    private static final int CENTERED = 1;

    public static final int ALL = PLAY | HEADSET | BLUETOOTH | BATTERY;

    /** In the order the picker lists them. */
    public static final int[] ICONS = new int[]{HEADER, PLAY, HEADSET, BLUETOOTH, BATTERY, PERCENT};

    /** What the picker opens with. */
    public static int mask(Context c) {
        int m = Prefs.val(c, KEY_ICONS) & ALL;
        if (Prefs.on(c, KEY_HEADER)) m |= HEADER;
        try {
            if (SharedPreferencesUtils.INSTANCE.getBatteryPercentage()) m |= PERCENT;
        } catch (Throwable t) {
        }
        return m;
    }

    /** What the picker was closed with. */
    public static void save(BaseActivity a, int mask) {
        Prefs.setInt(a, KEY_ICONS, mask & ALL);
        Prefs.setBool(a, KEY_HEADER, (mask & HEADER) != 0);
        try {
            SharedPreferencesUtils.INSTANCE.setBatteryPercentage((mask & PERCENT) != 0);
            a.updateBatteryPercentageBase();
        } catch (Throwable t) {
        }
        apply(a);
    }

    /** End of {@code SettingActivity.setRecyclerData}: the stock row the picker stands in for. */
    public static void settingsRows(SettingActivity a, List list) {
        try {
            String name = a.getString(R.string.setting_battery_percentage);
            for (int i = list.size() - 1; i >= 0; i--) {
                if (name.equals(((SettingActivity.SettingItem) list.get(i)).getTitle())) list.remove(i);
            }
        } catch (Throwable t) {
        }
    }

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
            if (bar instanceof LinearLayout) {
                arrange((LinearLayout) bar, Prefs.val(a, KEY_STYLE) == CENTERED);
            }
            View title = bar.findViewById(R.id.status_bar_time);
            if (title != null) {
                title.setVisibility(Prefs.on(a, KEY_HEADER) ? View.VISIBLE : View.INVISIBLE);
            }
        } catch (Throwable t) {
        }
    }

    /** The bar's children as the layout has them, the second spacer, the title's start margin. */
    private static final class Order {
        View[] stock;
        View spacer;
        int titleStart;
        boolean centered;
    }

    private static final int[] LEFT = new int[]{R.id.play, R.id.headset, R.id.bluetooth,
            R.id.ringtone, R.id.vibrator};

    /**
     * Centered: the playback, headphone and Bluetooth icons go to the left edge, the title between
     * two spacers, battery and percent stay right. The bar's start padding takes over the title's
     * start margin, so the first icon stands where the title did.
     */
    private static void arrange(LinearLayout bar, boolean centered) {
        Object tag = bar.getTag(R.id.status_bar_time);
        Order o;
        if (tag instanceof Order) {
            o = (Order) tag;
            if (o.centered == centered) return;
        } else {
            if (!centered) return;
            o = new Order();
            o.stock = new View[bar.getChildCount()];
            for (int i = 0; i < o.stock.length; i++) o.stock[i] = bar.getChildAt(i);
            o.spacer = new View(bar.getContext());
            o.spacer.setLayoutParams(new LinearLayout.LayoutParams(0, 0, 1f));
            View title = bar.findViewById(R.id.status_bar_time);
            if (title == null) return;
            o.titleStart = ((LinearLayout.LayoutParams) title.getLayoutParams()).getMarginStart();
            title.addOnLayoutChangeListener(new Center());
            bar.setTag(R.id.status_bar_time, o);
        }
        View title = bar.findViewById(R.id.status_bar_time);
        View[] order;
        if (centered) {
            ArrayList l = new ArrayList();
            for (int i = 0; i < LEFT.length; i++) {
                View v = bar.findViewById(LEFT[i]);
                if (v != null) l.add(v);
            }
            View stockSpacer = null;
            for (int i = 0; i < o.stock.length; i++) {
                if (o.stock[i].getId() == View.NO_ID) stockSpacer = o.stock[i];
            }
            if (stockSpacer != null) l.add(stockSpacer);
            l.add(title);
            l.add(o.spacer);
            for (int i = 0; i < o.stock.length; i++) {
                View v = o.stock[i];
                if (!l.contains(v)) l.add(v);
            }
            order = (View[]) l.toArray(new View[l.size()]);
        } else {
            order = o.stock;
        }
        bar.removeAllViews();
        for (int i = 0; i < order.length; i++) bar.addView(order[i]);
        LinearLayout.LayoutParams lp = (LinearLayout.LayoutParams) title.getLayoutParams();
        int m = centered ? 0 : o.titleStart;
        lp.leftMargin = m;
        lp.setMarginStart(m);
        title.setLayoutParams(lp);
        bar.setPadding(centered ? o.titleStart : indentOf(bar), bar.getPaddingTop(),
                bar.getPaddingRight(), bar.getPaddingBottom());
        if (!centered) title.setTranslationX(0);
        o.centered = centered;
    }

    /**
     * From {@code MenuStyle}: how far the screen's row text stands right of where the title
     * starts, so with stock margins the title moves onto the same line. Not in Centered.
     */
    static void indent(Activity a, int px) {
        View bar = a.findViewById(R.id.status_bar);
        if (bar == null) return;
        bar.setTag(R.id.status_bar, Integer.valueOf(px));
        Object tag = bar.getTag(R.id.status_bar_time);
        if (tag instanceof Order && ((Order) tag).centered) return;
        if (bar.getPaddingLeft() == px) return;
        bar.setPadding(px, bar.getPaddingTop(), bar.getPaddingRight(), bar.getPaddingBottom());
    }

    private static int indentOf(View bar) {
        Object t = bar.getTag(R.id.status_bar);
        return t instanceof Integer ? ((Integer) t).intValue() : 0;
    }

    /** Moves the title, laid out between the two groups, to the middle of the screen. */
    private static final class Center implements View.OnLayoutChangeListener {
        public void onLayoutChange(View v, int l, int t, int r, int b, int ol, int ot, int or,
                int ob) {
            View bar = (View) v.getParent();
            if (bar == null) return;
            Object tag = bar.getTag(R.id.status_bar_time);
            boolean on = tag instanceof Order && ((Order) tag).centered;
            v.setTranslationX(on ? bar.getWidth() / 2f - (l + r) / 2f : 0f);
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

    /**
     * The battery percentage, from stock's {@code updateBattery}, which runs on every battery
     * broadcast (voltage, temperature) whatever the level: a wrap_content text set again
     * re-lays out the whole window, so the same text is not set.
     */
    public static void percent(TextView tv, CharSequence s) {
        if (tv == null) return;
        if (s != null && TextUtils.equals(tv.getText(), s)) return;
        tv.setText(s);
    }
}
