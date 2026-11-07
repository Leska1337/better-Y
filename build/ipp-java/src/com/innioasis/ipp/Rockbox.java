package com.innioasis.ipp;

import android.app.ActivityManager;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;

import com.innioasis.y1.R;
import com.innioasis.y1.activity.SettingActivity;
import com.innioasis.y1.utils.SDReceiver;
import com.innioasis.y1.utils.SharedPreferencesUtils;

import java.io.File;
import java.util.List;

/**
 * The firmware with Rockbox beside us: stock's own Launcher row of Settings (its theme icon
 * included, titled "Rockbox") goes back to Rockbox, the Key lock row goes when the kernel has no
 * switch for it, and coming back from Rockbox scans the library. Rockbox disables itself when it
 * hands over to us, so the row has to enable it before launching it — stock's own action only
 * opens the home chooser, which would find nobody.
 */
public final class Rockbox {

    private Rockbox() { }

    private static final String PACKAGE = "org.rockbox";

    /** Installed, enabled or not. */
    private static boolean present(Context c) {
        try {
            c.getPackageManager().getApplicationEnabledSetting(PACKAGE);
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    private static boolean started;

    /**
     * From {@code BaseActivity.onCreate}, once per process. While Rockbox ran we were disabled and
     * heard no USB, and enabling us brings no MEDIA_MOUNTED, so the stock scan is started the way
     * that broadcast starts it. A second start while a scan runs does nothing.
     */
    public static void started(Context c) {
        if (started) return;
        started = true;
        try {
            if (!present(c)) return;
            SharedPreferencesUtils.INSTANCE.setWasUnmounted(true);
            new SDReceiver().onReceive(c, new Intent(Intent.ACTION_MEDIA_MOUNTED));
        } catch (Throwable t) {
        }
    }

    /** End of {@code SettingActivity.setRecyclerData}: stock's Launcher row under Language. */
    public static void settingsRows(SettingActivity a, List list) {
        try {
            if (!new File(Press.KEY_LOCK).exists()) {
                drop(list, a.getString(R.string.setting_key_lock));
            }
            if (!present(a)) return;
            String lang = a.getString(R.string.setting_language);
            int at = -1;
            for (int i = 0; i < list.size(); i++) {
                if (lang.equals(((SettingActivity.SettingItem) list.get(i)).getTitle())) {
                    at = i + 1;
                    break;
                }
            }
            if (at < 0) return;
            list.add(at, new SettingActivity.SettingItem(
                    a.getString(R.string.setting_launcher), true, ""));
        } catch (Throwable t) {
        }
    }

    private static void drop(List list, String title) {
        for (int i = list.size() - 1; i >= 0; i--) {
            if (title.equals(((SettingActivity.SettingItem) list.get(i)).getTitle())) {
                list.remove(i);
            }
        }
    }

    /** From the top of {@code SettingActivity.confirm}; true when the row was ours. */
    public static boolean settingsConfirm(SettingActivity a, String title) {
        if (!a.getString(R.string.setting_launcher).equals(title)) return false;
        try {
            PackageManager pm = a.getPackageManager();
            pm.setApplicationEnabledSetting(PACKAGE,
                    PackageManager.COMPONENT_ENABLED_STATE_ENABLED, 0);
            Intent go = pm.getLaunchIntentForPackage(PACKAGE);
            if (go == null) return true;
            a.startActivity(go);
            a.finishAffinity();
            ((ActivityManager) a.getSystemService(Context.ACTIVITY_SERVICE))
                    .killBackgroundProcesses(a.getPackageName());
        } catch (Throwable t) {
        }
        return true;
    }
}
