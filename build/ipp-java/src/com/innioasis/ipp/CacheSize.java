package com.innioasis.ipp;

import android.content.Context;
import android.os.SystemClock;

import com.innioasis.music.objects.Constant;
import com.innioasis.y1.R;
import com.innioasis.y1.activity.SettingActivity;

import java.io.File;

/**
 * The size under "Clear cache" in Settings, measured on a background thread. Stock walked every
 * app's cache directory on the main thread inside a row's bind. The panel gets the last value at
 * once and is repainted when a new one is in, if that row is still shown.
 */
public final class CacheSize {

    private CacheSize() { }

    /**
     * Not zero: the repaint that shows a result asks {@link #text} again, and an instantly stale
     * value would loop the measurement forever.
     */
    private static final long TTL_MS = 2000L;

    private static String value;
    private static long measuredAt;
    private static boolean stale = true;
    private static boolean running;

    /**
     * Never touches the filesystem. Measures only with the cursor at rest on the row: the walk is
     * thousands of files and megabytes of garbage, too much for every pass of the wheel.
     */
    public static String text(SettingActivity a) {
        boolean old = value == null || SystemClock.uptimeMillis() - measuredAt > TTL_MS;
        if (stale || old && Wheel.panelAtRest()) start(a);
        return value == null ? "…" : value;
    }

    /** The cache has just been cleared. */
    public static void refresh(SettingActivity a) {
        stale = true;
        start(a);
    }

    private static void start(SettingActivity a) {
        if (running || a == null) return;
        running = true;
        stale = false;
        new Thread(new Measure(a)).start();
    }

    static final class Measure implements Runnable {
        private final SettingActivity a;

        Measure(SettingActivity a) { this.a = a; }

        public void run() {
            String s = null;
            try {
                // as "Select all" in Clear cache: the tags too, which are database columns, not files;
                // the list only if it is in memory, a read here would be the whole table
                s = format(total(a) + Schema.tagBytes(Albums.loaded()));
            } catch (Throwable t) {
            }
            if (s != null) {
                value = s;
                measuredAt = SystemClock.uptimeMillis();
            }
            running = false;
            try {
                a.runOnUiThread(new Apply(a));
            } catch (Throwable t) {
            }
        }
    }

    static final class Apply implements Runnable {
        private final SettingActivity a;

        Apply(SettingActivity a) { this.a = a; }

        public void run() {
            try {
                String title = a.getString(R.string.add_req_clear_cache);
                if (!Wheel.panelShows(title)) return;
                a.ippRefreshRight(title);
            } catch (Throwable t) {
            }
        }
    }

    /** Also used by {@code Pick}, per category. */
    static long total(Context c) {
        long n = 0;
        File[] apps = new File("/data/data").listFiles();
        if (apps != null) {
            for (int i = 0; i < apps.length; i++) n += dirSize(new File(apps[i], "cache"));
        }
        // Spelled out: getExternalCacheDir() is refused to uid system with a logged stack.
        if (c != null) {
            n += dirSize(new File(Constant.ROOT_PATH, "Android/data/" + c.getPackageName() + "/cache"));
        }
        return n;
    }

    static long dirSize(File f) {
        if (f == null || !f.exists()) return 0;
        if (f.isFile()) return f.length();
        File[] kids = f.listFiles();
        if (kids == null) return 0;
        long n = 0;
        for (int i = 0; i < kids.length; i++) n += dirSize(kids[i]);
        return n;
    }

    /** Stock's format: "123 B", "45.6 KB", "7.8 MB". */
    static String format(long n) {
        StringBuilder b = new StringBuilder();
        if (n < 1024L) return b.append(n).append(" B").toString();
        String unit;
        long tenths;
        if (n < 1048576L) {
            tenths = n * 10L / 1024L;
            unit = " KB";
        } else {
            tenths = n * 10L / 1048576L;
            unit = " MB";
        }
        return b.append(tenths / 10L).append('.').append(tenths % 10L).append(unit).toString();
    }
}
