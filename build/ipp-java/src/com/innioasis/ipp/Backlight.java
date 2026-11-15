package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.provider.Settings;
import android.widget.ProgressBar;
import android.widget.TextView;

import com.innioasis.y1.R;
import com.innioasis.y1.activity.SettingActivity;
import com.innioasis.y1.databinding.ActivitySettingBinding;
import com.innioasis.y1.theme.ThemeManager;

/**
 * Brightness in percent over the range the screen really has, for the Brightness screen and the
 * screensaver alike: the power manager raises every level to the settings minimum (30 of 255),
 * so a plain 0..255 left its bottom steps all the same. Going under it by writing the backlight
 * file buys nothing: the driver's PWM stops one step below that minimum.
 */
public final class Backlight {

    private Backlight() { }

    private static final String SETTING = "screen_brightness";
    private static final int MAX = 255;
    public static final int STEP = 5;

    private static int floor = -1;

    /** The system's lowest level, from the framework's own config. */
    public static int floor() {
        if (floor < 0) {
            floor = 30;
            try {
                android.content.res.Resources r = android.content.res.Resources.getSystem();
                int id = r.getIdentifier("config_screenBrightnessSettingMinimum", "integer", "android");
                if (id != 0) floor = Math.max(1, Math.min(MAX - 1, r.getInteger(id)));
            } catch (Throwable t) {
            }
        }
        return floor;
    }

    public static int raw(int pct) {
        pct = Math.max(0, Math.min(100, pct));
        return Math.round(floor() + (MAX - floor()) * pct / 100f);
    }

    public static int pct(int raw) {
        return Math.max(0, Math.min(100, Math.round((raw - floor()) * 100f / (MAX - floor()))));
    }

    /** A window's brightness for {@code pct}. */
    public static float window(int pct) {
        return raw(pct) / (float) MAX;
    }

    public static int mainPct(Context c) {
        int s = MAX;
        try {
            s = Settings.System.getInt(c.getContentResolver(), SETTING);
        } catch (Throwable t) {
        }
        return pct(s);
    }

    private static void setMain(Context c, int pct) {
        try {
            android.content.ContentResolver cr = c.getContentResolver();
            if (Settings.System.getInt(cr, "screen_brightness_mode", 0) == 1) {
                Settings.System.putInt(cr, "screen_brightness_mode", 0);
            }
            Settings.System.putInt(cr, SETTING, raw(pct));
        } catch (Throwable t) {
        }
    }

    /** The Brightness screen: {@code dir} 0 paints it, ±1 is a wheel step of {@link #STEP} %. */
    public static void screen(Activity a, int dir) {
        try {
            ProgressBar bar = (ProgressBar) a.findViewById(R.id.brightness_pb);
            TextView tv = (TextView) a.findViewById(R.id.brightness_tv);
            int p = mainPct(a);
            if (dir != 0) {
                p = dir > 0 ? (p / STEP + 1) * STEP : ((p + STEP - 1) / STEP - 1) * STEP;
                p = Math.max(0, Math.min(100, p));
                setMain(a, p);
            }
            bar.setMax(100);
            bar.setProgress(p);
            tv.setText(p + "%");
        } catch (Throwable t) {
        }
    }

    /** The Settings panel on the Brightness row, in the same percent as the screen. */
    public static boolean panel(SettingActivity a, String title) {
        try {
            if (!a.getString(R.string.setting_brightness).equals(title)) return false;
            ActivitySettingBinding vb = (ActivitySettingBinding) a.getVb();
            ThemeManager.INSTANCE.commonSetIcon(vb.rightImage, R.drawable.icon_setting_brightness);
            vb.infoStateTv.setText(mainPct(a) + "%");
            return true;
        } catch (Throwable t) {
            return false;
        }
    }
}
