package com.innioasis.ipp;

import android.content.Context;
import android.os.SystemClock;

import com.innioasis.y1.R;
import com.innioasis.y1.activity.SettingActivity;

import java.io.File;

/**
 * The cache size shown under "Clear cache" in Settings — measured off the drawing path.
 *
 * Stock computes it inside {@code updateClearCache}, which is called from {@code refreshRight},
 * which is called from a row's <b>bind</b>. Measuring means walking {@code /data/data/*}{@code
 * /cache} recursively plus the app's external cache directory — a full directory tree per call, on
 * the main thread, inside the list's layout. The logcat trace for it (Android 4.2 prints a whole
 * stack from {@code getExternalCacheDir} on this device) is what put us onto it.
 *
 * So the panel now asks {@link #text} for a <b>value</b>, never for a measurement: it gets the last
 * known one straight away, and a background thread refreshes it when it is missing or stale. When
 * the thread finishes it repaints the panel — but only if that row is still the one on screen
 * ({@code Wheel.panelShows}), otherwise a late measurement would overwrite whatever the user has
 * moved on to.
 *
 * The measuring and formatting are done here rather than by calling {@code TrackCache.cacheSizeText}
 * on purpose: that method also triggers {@code TrackCache.load()}, and pulling the track-number
 * cache in from a background thread could race the main thread reading it. The formatting matches
 * stock's exactly — bytes below 1 KB, otherwise one decimal of KB or MB.
 */
public final class CacheSize {

    private CacheSize() { }

    /**
     * How long a measurement counts as current. Short on purpose: the panel is repainted when the
     * wheel lands on a row, so "the cursor is on Clear cache" and "someone asked {@link #text}"
     * are the same moment — this measures on every visit to the row rather than on a timer.
     *
     * It is not zero because the repaint that shows a finished measurement asks again: {@link
     * Apply} → {@code ippRefreshRight} → {@code updateClearCache} → {@link #text}. A value that
     * went stale instantly would start the next scan there, and so on forever. Two seconds is far
     * longer than that round trip and far shorter than a deliberate look at the row.
     */
    private static final long TTL_MS = 2000L;

    private static String value;
    private static long measuredAt;
    private static boolean stale = true;
    private static boolean running;

    /**
     * What to show right now. Never touches the filesystem: returns the last measurement (or a
     * placeholder before the first one) and starts a background re-measure when needed.
     */
    public static String text(SettingActivity a) {
        if (stale || value == null || SystemClock.uptimeMillis() - measuredAt > TTL_MS) start(a);
        return value == null ? "…" : value;
    }

    /** The cache has just been cleared: measure again and repaint when the number is in. */
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

    /** Named (d8 here crashes on anonymous classes). */
    static final class Measure implements Runnable {
        private final SettingActivity a;

        Measure(SettingActivity a) { this.a = a; }

        public void run() {
            String s = null;
            try {
                s = format(total(a));
            } catch (Throwable t) {
                // an unmeasurable cache just keeps the previous number
            }
            if (s != null) {
                value = s;
                measuredAt = SystemClock.uptimeMillis();
            }
            running = false;
            try {
                a.runOnUiThread(new Apply(a));
            } catch (Throwable t) {
                // the Activity is gone; the value is cached for the next visit anyway
            }
        }
    }

    /** Back on the main thread: repaint the panel, if it is still showing this row. */
    static final class Apply implements Runnable {
        private final SettingActivity a;

        Apply(SettingActivity a) { this.a = a; }

        public void run() {
            try {
                String title = a.getString(R.string.add_req_clear_cache);
                if (!Wheel.panelShows(title)) return;
                a.ippRefreshRight(title);
            } catch (Throwable t) {
                // ignore
            }
        }
    }

    // ---------------------------------------------------------------- measuring

    /** Package-visible: {@code Pick} shows the same numbers, split per category. */
    static long total(Context c) {
        long n = 0;
        File[] apps = new File("/data/data").listFiles();
        if (apps != null) {
            for (int i = 0; i < apps.length; i++) n += dirSize(new File(apps[i], "cache"));
        }
        if (c != null) n += dirSize(c.getExternalCacheDir());
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
