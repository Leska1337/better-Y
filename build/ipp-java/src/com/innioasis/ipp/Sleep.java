package com.innioasis.ipp;

import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import android.view.View;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;

import com.innioasis.y1.R;
import com.innioasis.y1.activity.SettingActivity;
import com.innioasis.y1.base.BaseBindingAdapter;
import com.innioasis.y1.databinding.ActivitySettingBinding;
import com.innioasis.y1.theme.ThemeManager;
import com.innioasis.y1.utils.SharedPreferencesUtils;

import java.util.List;

/**
 * The Sleep time row of Settings, opened like a value of the better-Y menu: the centre opens it,
 * the wheel runs over the times, the centre keeps the one shown, the top button puts the old one
 * back. Reached through {@code Tone}'s injections — SettingActivity lives in classes.dex, which
 * has no method references to spare. The times and pictures are stock's own list.
 */
final class Sleep {

    private Sleep() { }

    private static final int[] MS = { 10000, 15000, 30000, 45000, 60000, 120000, 300000, Integer.MAX_VALUE };
    private static final int[] SECONDS = { 10, 15, 30, 45, 60, 120, 300, 0 };
    private static final int[] ICONS = { R.drawable.icon_setting_sleep_10, R.drawable.icon_setting_sleep_15,
            R.drawable.icon_setting_sleep_30, R.drawable.icon_setting_sleep_45, R.drawable.icon_setting_sleep_60,
            R.drawable.icon_setting_sleep_120, R.drawable.icon_setting_sleep_300, 0 };

    private static final long BLINK_MS = 400;
    private static final Handler H = new Handler(Looper.getMainLooper());

    private static SettingActivity editing;
    private static int val;
    private static Blink blink;

    private static boolean ours(SettingActivity a, String title) {
        return a.getString(R.string.setting_sleeptime).equals(title);
    }

    /** The row's value, as stock writes it. */
    private static String text(SettingActivity a, int i) {
        return SECONDS[i] == 0 ? a.getString(R.string.setting_sleep_always) : SECONDS[i] + "s";
    }

    /** The panel's line under the picture, as stock writes it. */
    private static String info(SettingActivity a, int i) {
        return SECONDS[i] == 0 ? a.getString(R.string.setting_sleep_always)
                : SECONDS[i] + a.getString(R.string.time_second);
    }

    private static int icon(int i) {
        if (ICONS[i] != 0) return ICONS[i];
        return SharedPreferencesUtils.INSTANCE.getLanguage() == 0
                ? R.drawable.icon_setting_sleep_always : R.drawable.icon_setting_sleep_always_e;
    }

    private static int current(SettingActivity a) {
        try {
            int ms = Settings.System.getInt(a.getContentResolver(), "screen_off_timeout");
            for (int i = 0; i < MS.length; i++) if (MS[i] == ms) return i;
        } catch (Throwable t) {
        }
        return -1;
    }

    /** From {@code Tone.settingsConfirm}: opens the row, or keeps the value shown. */
    static boolean confirm(SettingActivity a, String title) {
        if (editing == a) {
            end(a, true);
            return true;
        }
        if (!ours(a, title)) return false;
        editing = a;
        val = Math.max(0, current(a));
        show(a);
        return true;
    }

    static boolean wheel(SettingActivity a, int dir) {
        if (editing != a) return false;
        val = ((val + dir) % MS.length + MS.length) % MS.length;
        show(a);
        return true;
    }

    static boolean top(SettingActivity a) {
        if (editing != a) return false;
        end(a, false);
        return true;
    }

    /** From {@code Tone.settingsPanel}: while the row is open the panel shows the time on offer. */
    static boolean panel(SettingActivity a, String title) {
        if (editing != a || !ours(a, title)) return false;
        paint(a);
        return true;
    }

    private static void paint(SettingActivity a) {
        ActivitySettingBinding vb = (ActivitySettingBinding) a.getVb();
        ThemeManager.INSTANCE.commonSetIcon(vb.rightImage, icon(val));
        vb.infoStateTv.setText(info(a, val));
    }

    private static void show(SettingActivity a) {
        paint(a);
        TextView tv = rowText(a);
        if (tv == null) return;
        tv.setText(text(a, val));
        H.removeCallbacks(blink);
        tv.setVisibility(View.VISIBLE);
        blink = new Blink(tv);
        H.postDelayed(blink, BLINK_MS);
    }

    private static TextView rowText(SettingActivity a) {
        RecyclerView rv = ((ActivitySettingBinding) a.getVb()).recycler;
        RecyclerView.ViewHolder h = rv.findViewHolderForAdapterPosition(a.getMark());
        return h == null ? null : (TextView) h.itemView.findViewById(R.id.text);
    }

    static final class Blink implements Runnable {
        private final TextView tv;
        Blink(TextView tv) { this.tv = tv; }
        public void run() {
            if (editing == null) return;
            if (tv.getWindowToken() == null) {   // the screen went away with the value open
                editing = null;
                return;
            }
            tv.setVisibility(tv.getVisibility() == View.VISIBLE ? View.INVISIBLE : View.VISIBLE);
            H.postDelayed(this, BLINK_MS);
        }
    }

    private static void end(SettingActivity a, boolean keep) {
        H.removeCallbacks(blink);
        TextView tv = rowText(a);
        if (tv != null) tv.setVisibility(View.VISIBLE);
        editing = null;
        if (keep) {
            try {
                Settings.System.putInt(a.getContentResolver(), "screen_off_timeout", MS[val]);
            } catch (Throwable t) {
            }
        }
        int now = current(a);
        RecyclerView.Adapter ad = ((ActivitySettingBinding) a.getVb()).recycler.getAdapter();
        if (now >= 0 && ad instanceof BaseBindingAdapter) {
            List data = ((BaseBindingAdapter) ad).getData();
            int m = a.getMark();
            if (m >= 0 && m < data.size()) {
                ((SettingActivity.SettingItem) data.get(m)).setText(text(a, now));
                ad.notifyItemChanged(m);
            }
        }
        a.ippRefreshRight(a.getString(R.string.setting_sleeptime));
    }
}
