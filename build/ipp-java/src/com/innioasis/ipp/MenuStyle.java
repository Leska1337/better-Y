package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.ImageView;

import androidx.recyclerview.widget.RecyclerView;

import com.innioasis.y1.R;
import com.innioasis.y1.activity.DateOneLevelActivity;
import com.innioasis.y1.activity.EqActivity;
import com.innioasis.y1.activity.LanguageActivity;
import com.innioasis.y1.activity.MainActivity;
import com.innioasis.y1.activity.SettingActivity;
import com.innioasis.y1.activity.WallpaperListActivity;
import com.innioasis.y1.base.BaseActivity;
import com.innioasis.y1.databinding.ActivitySettingBinding;
import com.innioasis.y1.theme.ThemeManager;

/**
 * "menu_style" SIMPLE: a screen that draws a preview beside its list loses the preview, and the
 * list takes the whole width — the main menu, Settings and the screens inside it. The preview is
 * hidden and not painted: each painter asks {@link #simple} first. Stock never touches its
 * visibility. The style also picks the background of Settings and its screens ({@link #backdrop}).
 */
public final class MenuStyle {

    private MenuStyle() { }

    public static final String KEY = "menu_style";

    private static final int SIMPLE = 1;

    public static boolean simple(Context c) {
        return Prefs.val(c, KEY) == SIMPLE;
    }

    /** End of {@code BaseActivity.onResume}: a screen left open under the menu is not re-created. */
    public static void apply(Object activity) {
        if (!(activity instanceof Activity)) return;
        try {
            Activity a = (Activity) activity;
            boolean s = simple(a);
            if (a instanceof MainActivity) {
                pad(a.findViewById(R.id.rc_list));
                if (hide(a.findViewById(R.id.iv_now), s) && !s) mainPreview(a);
            } else if (a instanceof SettingActivity) {
                pad(a.findViewById(R.id.recycler));
                if (hide(parent(a.findViewById(R.id.right_title)), s) && !s) Wheel.paintPanel();
            } else if (a instanceof EqActivity) {
                widen(a.findViewById(R.id.recycler_list), s);
                hide(parent(a.findViewById(R.id.image)), s);
            } else if (a instanceof WallpaperListActivity) {
                widen(a.findViewById(R.id.recycler), s);
                hide(parent(a.findViewById(R.id.img)), s);
            } else if (a instanceof LanguageActivity) {
                widen(a.findViewById(R.id.recycler), s);
                hide(a.findViewById(R.id.image), s);
            } else if (a instanceof DateOneLevelActivity) {
                widen(a.findViewById(R.id.date_ll), s);
                hide(a.findViewById(R.id.show_time), s);
                hide(a.findViewById(R.id.imageView), s);
                hide(a.findViewById(R.id.show_date), s);
                dateIcon(a.findViewById(R.id.imageView));
            }
            backdrop(a, s);
            Preview.apply(a);
            Bar.apply(a);
        } catch (Throwable t) {
        }
    }

    /** The picture the Settings panel shows for Date & time, the theme's included. */
    private static void dateIcon(View v) {
        if (!(v instanceof ImageView) || v.getTag(R.id.imageView) != null) return;
        v.setTag(R.id.imageView, Boolean.TRUE);
        ThemeManager.INSTANCE.commonSetIcon((ImageView) v, R.drawable.icon_setting_day);
    }

    /**
     * Settings' background — the wallpaper under the theme's settingMask — in Default, the
     * wallpaper alone in Simple. The screens inside Settings carry it on the base layout's unused
     * {@code back}; Brightness, About, the date and time editor and better-Y never do.
     */
    private static void backdrop(Activity a, boolean simple) {
        try {
            if (a instanceof SettingActivity) {
                View back = ((ActivitySettingBinding) ((SettingActivity) a).getVb()).back;
                back.setVisibility(simple ? View.INVISIBLE : View.VISIBLE);
                return;
            }
            if (!(a instanceof LanguageActivity || a instanceof WallpaperListActivity
                    || a instanceof DateOneLevelActivity || a instanceof EqActivity)) {
                return;
            }
            ImageView back = ((BaseActivity) a).getBackImageView();
            if (simple) {
                back.setVisibility(View.GONE);
                return;
            }
            if (back.getTag(R.id.back) == null) {
                back.setTag(R.id.back, Boolean.TRUE);
                // the layout fills it black
                back.setBackgroundDrawable(null);
                ThemeManager.INSTANCE.setSettingMask(back);
            }
            back.setVisibility(View.VISIBLE);
        } catch (Throwable t) {
        }
    }

    /** These two lists' width is {@link Pad}'s, which asks {@link #simple} itself. */
    private static void pad(View v) {
        if (v instanceof RecyclerView) Pad.list((RecyclerView) v);
    }

    private static View parent(View v) {
        ViewParent p = v == null ? null : v.getParent();
        return p instanceof View ? (View) p : null;
    }

    /** True when the view changed: a preview shown again was not painted while hidden. */
    private static boolean hide(View v, boolean hide) {
        if (v == null) return false;
        int vis = hide ? View.GONE : View.VISIBLE;
        if (v.getVisibility() == vis) return false;
        v.setVisibility(vis);
        return true;
    }

    /** The main menu's painter is private; this runs once per change of the setting. */
    private static void mainPreview(Activity a) {
        try {
            java.lang.reflect.Method m = MainActivity.class.getDeclaredMethod("selItem", new Class[0]);
            m.setAccessible(true);
            m.invoke(a, new Object[0]);
        } catch (Throwable t) {
        }
    }

    /** The layout's own width is kept in a tag, to go back to. */
    private static void widen(View v, boolean wide) {
        if (v == null) return;
        ViewGroup.LayoutParams lp = v.getLayoutParams();
        if (lp == null) return;
        Object tag = v.getTag(R.id.layout);
        if (!(tag instanceof Integer)) {
            tag = Integer.valueOf(lp.width);
            v.setTag(R.id.layout, tag);
        }
        int w = wide ? ViewGroup.LayoutParams.MATCH_PARENT : ((Integer) tag).intValue();
        if (lp.width == w) return;
        lp.width = w;
        v.setLayoutParams(lp);
    }
}
