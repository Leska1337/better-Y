package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.os.Build;
import android.os.StatFs;
import android.os.SystemClock;
import android.widget.Toast;

import com.innioasis.music.objects.Constant;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.database.Y1Repository;
import com.innioasis.y1.theme.ThemeManager;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * "Save diagnostic log" ([Tools]): one file on the card to attach to a bug report — build,
 * settings, library, the app's own log ring and the logcat tails. And the hidden debug mode (stock
 * Timber logging, off for speed): five centre presses on Settings → About, not a menu row — it
 * costs speed everywhere and needs a reboot.
 */
public final class Diag {

    private Diag() { }

    /** Also a literal in {@code Y1Application$TimberTree.<clinit>}: the two must agree. */
    static final String MARK = "/storage/sdcard0/better-Y/debug_log";

    /** A spilled ring's file name. */
    private static final String CRASH = "crash_";

    private static final int TAPS = 5;

    /** A longer gap starts the count over. */
    private static final long GAP_MS = 2000L;

    /** How much of one command's output is kept. */
    private static final int CAP = 256 * 1024;

    /**
     * The whole main buffer. {@link Panel#exec} keeps the HEAD, logcat prints
     * oldest first: this must exceed the ring as text or the newest lines are cut.
     */
    private static final int MAIN_CAP = 1024 * 1024;

    private static int taps;
    private static long lastTap;

    static boolean on() {
        try {
            return new File(MARK).isFile();
        } catch (Throwable t) {
            return false;
        }
    }

    /**
     * The app's last messages in memory: logcat's ring is shared and AudioFlinger fills it in
     * seconds. A record is a store of already-built strings — no file, no log driver, no stack-trace
     * tag. INFO and up only ({@code TimberTree.isLoggable}): DEBUG cost ~9 ms per list opened.
     */
    private static final int RING = 2000;

    private static final long[] ringWhen = new long[RING];
    private static final int[] ringPri = new int[RING];
    private static final String[] ringTag = new String[RING];
    private static final String[] ringMsg = new String[RING];

    /** Total records ever stored; the ring holds the last RING of them. */
    private static int ringN;

    /** From {@code Y1Application$TimberTree.log}, on any thread. */
    public static synchronized void ring(int priority, String tag, String message, Throwable t) {
        try {
            if (!armed) arm();
            int i = ringN % RING;
            ringWhen[i] = System.currentTimeMillis();
            ringPri[i] = priority;
            ringTag[i] = tag;
            // flattened now, so the throwable's objects are not kept alive
            ringMsg[i] = t == null ? message
                    : message + '\n' + android.util.Log.getStackTraceString(t);
            ringN++;
        } catch (Throwable e) {
        }
    }

    /**
     * Development measurements: collector pauses after {@code slow:}, every frame gap of an
     * animation, the Cover Flow lines written always. A compile-time constant, so false leaves
     * them out of the dex; true brings them back.
     */
    public static final boolean MEASURE = false;

    /** The mod's own voice in the log: rare decisions worth a line, never per-row chatter. */
    public static void note(String message) {
        ring(4 /* INFO */, "ipp", message, null);
        if (message != null && message.startsWith("slow:")) {
            if (MEASURE) Gc.request();
            if (message.startsWith("slow: frames")) Heap.once();
        }
    }

    /** Diag.MEASURE: who ran on the CPU over the next 300 ms, written as one {@code cpu} line. */
    public static void cpu(String why) {
        if (MEASURE) Cpu.request(why);
    }

    /**
     * Two snapshots of /proc 300 ms apart: the whole CPU (/proc/stat), our process and each of
     * its threads, the busiest named. Ticks are 10 ms. Reads files only, starts no process.
     */
    static final class Cpu implements Runnable {
        private static volatile boolean running;
        private final String why;

        private Cpu(String why) { this.why = why; }

        static void request(String why) {
            if (running) return;
            running = true;
            try {
                Thread t = new Thread(new Cpu(why), "ipp-cpu");
                t.setPriority(Thread.MAX_PRIORITY);
                t.start();
            } catch (Throwable e) {
                running = false;
            }
        }

        public void run() {
            try {
                long[] c0 = total();
                java.util.HashMap a = threads();
                Thread.sleep(300);
                long[] c1 = total();
                java.util.HashMap b = threads();
                long all = c1[0] - c0[0], busy = c1[1] - c0[1];
                ArrayList rows = new ArrayList();
                long ours = 0;
                Iterator it = b.entrySet().iterator();
                while (it.hasNext()) {
                    Map.Entry e = (Map.Entry) it.next();
                    Object[] v = (Object[]) e.getValue();
                    Object[] w = (Object[]) a.get(e.getKey());
                    long d = ((Long) v[1]).longValue() - (w == null ? 0 : ((Long) w[1]).longValue());
                    if (d <= 0) continue;
                    ours += d;
                    rows.add(new Object[] { v[0] + " " + e.getKey(), Long.valueOf(d) });
                }
                Collections.sort(rows, new ByTicks());
                StringBuilder s = new StringBuilder("cpu ").append(why)
                        .append(": busy ").append(all > 0 ? busy * 100 / all : 0).append('%')
                        .append(", ours ").append(ours * 10).append(" ms, others ")
                        .append(Math.max(0, busy - ours) * 10).append(" ms of ").append(all * 10).append(" ms;");
                for (int i = 0; i < rows.size() && i < 6; i++) {
                    Object[] r = (Object[]) rows.get(i);
                    s.append(' ').append(r[0]).append(' ').append(((Long) r[1]).longValue() * 10);
                }
                String p = playing();
                if (p != null) s.append("; playing ").append(p);
                note(s.toString());
            } catch (Throwable e) {
            } finally {
                running = false;
            }
        }

        /** All ticks and busy ticks of every CPU together. */
        private static long[] total() throws java.io.IOException {
            String l = read("/proc/stat");
            int nl = l.indexOf('\n');
            String[] f = (nl > 0 ? l.substring(0, nl) : l).trim().split("\\s+");
            long all = 0, idle = 0;
            for (int i = 1; i < f.length; i++) {
                long v = Long.parseLong(f[i]);
                all += v;
                if (i == 4 || i == 5) idle += v;     // idle, iowait
            }
            return new long[] { all, all - idle };
        }

        /** tid -> { name, utime+stime } for every thread of this process. */
        private static java.util.HashMap threads() {
            java.util.HashMap m = new java.util.HashMap();
            String[] ts = new File("/proc/self/task").list();
            if (ts == null) return m;
            for (int i = 0; i < ts.length; i++) {
                try {
                    String st = read("/proc/self/task/" + ts[i] + "/stat");
                    int o = st.indexOf('('), c = st.lastIndexOf(')');
                    String[] f = st.substring(c + 2).trim().split(" ");
                    long t = Long.parseLong(f[11]) + Long.parseLong(f[12]);
                    m.put(ts[i], new Object[] { st.substring(o + 1, c), Long.valueOf(t) });
                } catch (Throwable e) {
                }
            }
            return m;
        }

        private static String read(String path) throws java.io.IOException {
            java.io.FileInputStream in = new java.io.FileInputStream(path);
            try {
                byte[] b = new byte[1024];
                int n = in.read(b);
                return n <= 0 ? "" : new String(b, 0, n, "US-ASCII");
            } finally {
                in.close();
            }
        }

        private static String playing() {
            try {
                com.innioasis.y1.service.PlayerService s = Y1Application.Companion.getPlayerService();
                Song song = s == null ? null : s.getPlayingSong();
                String p = song == null ? null : song.getPath();
                if (p == null) return null;
                int d = p.lastIndexOf('.');
                return d < 0 ? p : p.substring(d);
            } catch (Throwable e) {
                return null;
            }
        }
    }

    static final class ByTicks implements java.util.Comparator {
        public int compare(Object x, Object y) {
            long a = ((Long) ((Object[]) x)[1]).longValue(), b = ((Long) ((Object[]) y)[1]).longValue();
            return a > b ? -1 : a < b ? 1 : 0;
        }
    }

    /**
     * A heap dump to better-Y/logs at the first stuttering animation of the run and with every
     * "Save diagnostic log" — only while the empty file better-Y/heap_dump exists (put there by
     * hand over USB). Every thread stops for the seconds the dump takes, so it is never on by itself.
     */
    static final class Heap implements Runnable {
        private static boolean asked;

        static boolean flagged() {
            return new File(Panel.card(), "heap_dump").isFile();
        }

        static void once() {
            synchronized (Heap.class) {
                if (asked) return;
                asked = true;
            }
            try {
                if (!flagged()) return;
                Thread t = new Thread(new Heap(), "ipp-diag-heap");
                t.setDaemon(true);
                t.start();
            } catch (Throwable t) {
            }
        }

        public void run() {
            try {
                File f = new File(Panel.logs(), "heap_" + Panel.stamp() + ".hprof");
                android.os.Debug.dumpHprofData(f.getPath());
                note("heap dumped to " + f.getName());
            } catch (Throwable t) {
                note("heap dump failed: " + t);
            }
        }
    }

    /**
     * After a {@code slow:} line, the app's own collector pauses from logcat go into the ring
     * with it: logcat's buffer turns over in seconds while music plays, so a report taken a
     * minute later no longer says whether a GC stopped the app at that moment. A process
     * is started only after a slow step, one at a time.
     */
    static final class Gc implements Runnable {
        private static boolean running;
        private static String lastLine;     // the newest line already in the ring

        static void request() {
            if (Fm.busy()) return;                  // Panel.exec would refuse anyway
            synchronized (Gc.class) {
                if (running) return;
                running = true;
            }
            Thread t = new Thread(new Gc(), "ipp-diag-gc");
            t.setDaemon(true);
            t.start();
        }

        public void run() {
            try {
                String out = Panel.exec(new String[]{"/system/bin/logcat", "-d", "-b", "main",
                        "-v", "time", "dalvikvm:D", "*:S"}, CAP);
                String mine = "(" + android.os.Process.myPid() + "):";
                String[] lines = out.split("\n");
                List keep = new ArrayList();
                for (int i = lines.length - 1; i >= 0 && keep.size() < 20; i--) {
                    String l = lines[i].trim();
                    if (l.equals(lastLine)) break;
                    // the pauses only: the class verifier's lines share the tag
                    if (l.replace(" ", "").indexOf(mine) >= 0 && (l.indexOf("GC_") >= 0
                            || l.indexOf("WAIT_FOR_CONCURRENT_GC") >= 0 || l.indexOf("Grow heap") >= 0)) {
                        keep.add(0, l);
                    }
                }
                if (!keep.isEmpty()) lastLine = (String) keep.get(keep.size() - 1);
                for (int i = 0; i < keep.size(); i++) ring(3 /* DEBUG */, "gc", (String) keep.get(i), null);
            } catch (Throwable t) {
            } finally {
                synchronized (Gc.class) {
                    running = false;
                }
            }
        }
    }

    /** A step shorter than this leaves no line. */
    private static final long SLOW_MS = 200L;

    private static String markWhat;
    private static long markAt;

    /** A line when the step begun at uptime {@code since} ran long; nothing otherwise. */
    public static void slow(String what, long since) {
        long ms = SystemClock.uptimeMillis() - since;
        if (ms >= SLOW_MS) note("slow: " + what + ' ' + ms + " ms");
    }

    /**
     * {@link #slow} for a stock call site with no register to keep the time in: {@code mark}
     * before the step, {@link #lap} after it. Main thread only, and never nested.
     */
    public static void mark(String what) {
        markWhat = what;
        markAt = SystemClock.uptimeMillis();
    }

    public static void lap() {
        String what = markWhat;
        if (what == null) return;
        markWhat = null;
        slow(what, markAt);
    }

    /** Oldest first, in logcat's shape. */
    private static synchronized void ringDump(StringBuilder s) {
        int have = ringN < RING ? ringN : RING;
        s.append("\n--- app log (last ").append(have).append(" of ").append(ringN)
                .append(" since start) ---\n");
        if (have <= 0) {
            s.append("(empty)\n");
            return;
        }
        SimpleDateFormat f = new SimpleDateFormat("MM-dd HH:mm:ss.SSS", Locale.US);
        int first = ringN < RING ? 0 : ringN % RING;
        for (int k = 0; k < have; k++) {
            int i = (first + k) % RING;
            s.append(f.format(new Date(ringWhen[i]))).append(' ').append(pri(ringPri[i]))
                    .append('/').append(ringTag[i]).append(": ").append(ringMsg[i]).append('\n');
        }
    }

    /** android.util.Log's priorities, as logcat prints them. */
    private static char pri(int p) {
        switch (p) {
            case 2: return 'V';
            case 3: return 'D';
            case 4: return 'I';
            case 5: return 'W';
            case 6: return 'E';
            case 7: return 'A';
            default: return '?';
        }
    }

    /**
     * A crash writes the ring out. Armed by the first {@link #ring} call, milliseconds into the
     * process; xCrash's handler is kept and called after ours.
     */
    private static boolean armed;
    private static Thread.UncaughtExceptionHandler prev;

    private static void arm() {
        armed = true;                       // first: a failure must not retry per message
        try {
            prev = Thread.getDefaultUncaughtExceptionHandler();
            Thread.setDefaultUncaughtExceptionHandler(new Crash());
        } catch (Throwable t) {
        }
    }

    static final class Crash implements Thread.UncaughtExceptionHandler {
        public void uncaughtException(Thread th, Throwable e) {
            spill("uncaught exception on thread " + (th == null ? "?" : th.getName()), e);
            try {
                if (prev != null) prev.uncaughtException(th, e);
            } catch (Throwable t) {
            }
        }
    }

    /** The process is about to end (a crash, a force reboot): the ring goes to the card. */
    public static void spill(String why, Throwable e) {
        try {
            StringBuilder s = new StringBuilder(8192);
            s.append("better-Y ").append(Panel.version(Y1Application.Companion.getAppContext()))
                    .append('\n');
            s.append("when     ").append(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US)
                    .format(new Date())).append('\n');
            s.append("reason   ").append(why).append('\n');
            if (e != null) {
                s.append("\n--- stack ---\n").append(android.util.Log.getStackTraceString(e))
                        .append('\n');
            }
            ringDump(s);
            write(new File(Panel.logs(), CRASH + Panel.stamp() + ".log"), s.toString());
            keepNewest(Panel.logs(), CRASH, 5);
        } catch (Throwable t) {
        }
    }

    private static void write(File f, String text) {
        FileOutputStream out = null;
        try {
            out = new FileOutputStream(f);
            out.write(text.getBytes("UTF-8"));
            out.flush();
            out.getFD().sync();             // the process is about to end
        } catch (Throwable t) {
        } finally {
            try {
                if (out != null) out.close();
            } catch (Throwable t) {
            }
        }
    }

    /** Keep the newest {@code keep} files with this prefix. */
    static void keepNewest(File dir, String prefix, int keep) {
        try {
            File[] fs = dir.listFiles();
            if (fs == null || fs.length <= keep) return;
            List mine = new ArrayList();
            for (int i = 0; i < fs.length; i++) {
                if (fs[i].isFile() && fs[i].getName().startsWith(prefix)) mine.add(fs[i]);
            }
            Collections.sort(mine, new NameCmp());
            for (int i = 0; i < mine.size() - keep; i++) ((File) mine.get(i)).delete();
        } catch (Throwable t) {
        }
    }

    /** By name: the names carry yyyyMMdd_HHmmss, so this is chronological. */
    static final class NameCmp implements java.util.Comparator {
        public int compare(Object a, Object b) {
            return ((File) a).getName().compareTo(((File) b).getName());
        }
    }

    /** Injected into {@code AboutActivity.confirm()}, which is empty in stock. */
    public static void about(Activity a) {
        try {
            long now = SystemClock.uptimeMillis();
            if (now - lastTap > GAP_MS) taps = 0;
            lastTap = now;
            if (++taps < TAPS) return;
            taps = 0;
            boolean want = !on();
            if (!set(want)) return;
            toast(a, want ? R.string.ipp_debug_on : R.string.ipp_debug_off);
        } catch (Throwable t) {
        }
    }

    /** False when the card would not have it. */
    private static boolean set(boolean want) {
        try {
            File f = new File(MARK);
            if (!want) return !f.exists() || f.delete();
            File d = f.getParentFile();
            if (d != null && !d.isDirectory()) d.mkdirs();
            return f.exists() || f.createNewFile();
        } catch (Throwable t) {
            return false;
        }
    }

    /** [Tools] → "Save diagnostic log", on a worker. */
    public static void save(Activity a) {
        Thread t = new Thread(new Save(a), "ipp-diag");
        t.setDaemon(true);
        t.start();
    }

    static final class Save implements Runnable {
        private final Activity a;

        Save(Activity a) { this.a = a; }

        public void run() {
            File f = null;
            try {
                if (Heap.flagged()) new Heap().run();
            } catch (Throwable t) {
            }
            try {
                f = report(a);
            } catch (Throwable t) {
                // reported as a failure below
            }
            try {
                a.runOnUiThread(new Note(a, f));
            } catch (Throwable t) {
            }
        }
    }

    static final class Note implements Runnable {
        private final Activity a;
        private final File f;

        Note(Activity a, File f) { this.a = a; this.f = f; }

        public void run() {
            try {
                if (f == null) {
                    toast(a, R.string.ipp_log_fail);
                } else {
                    toast(a, a.getString(R.string.ipp_log_done, f.getAbsolutePath()));
                }
            } catch (Throwable t) {
            }
        }
    }

    /** The report's file, or null. */
    public static File report(Context c) {
        FileOutputStream out = null;
        try {
            File f = new File(Panel.logs(), "log_" + Panel.stamp() + ".log");
            StringBuilder s = new StringBuilder(8192);
            head(c, s);
            settings(c, s);
            library(c, s);
            ringDump(s);
            crashes(s);
            anr(s);
            if (on()) {
                s.append("\n--- logcat -b main -v time (whole buffer) ---\n");
                s.append(Panel.exec(new String[]{"/system/bin/logcat", "-d", "-b", "main", "-v",
                        "time"}, MAIN_CAP));
            } else {
                // While music plays these four are most of the buffer, a line per 23 ms buffer;
                // without them the buffer reaches minutes back instead of seconds
                s.append("\n--- logcat -b main -v time (whole buffer, audio output lines left out) ---\n");
                s.append(Panel.exec(new String[]{"/system/bin/logcat", "-d", "-b", "main", "-v",
                        "time", "AudioFlinger:S", "AudioMTKStreamOut:S", "AudioTrack:S",
                        "AudioMTKPolicyManager:S", "*:V"}, MAIN_CAP));
            }
            s.append("\n--- logcat -b system -v time (tail 300) ---\n");
            s.append(Panel.exec(new String[]{"/system/bin/logcat", "-d", "-b", "system", "-v",
                    "time", "-t", "300"}, CAP));

            out = new FileOutputStream(f);
            out.write(s.toString().getBytes("UTF-8"));
            out.flush();
            out.getFD().sync();
            return f;
        } catch (Throwable t) {
            return null;
        } finally {
            try {
                if (out != null) out.close();
            } catch (Throwable t) {
            }
        }
    }

    private static void head(Context c, StringBuilder s) {
        s.append("better-Y ").append(Panel.version(c)).append('\n');
        s.append("when     ").append(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US)
                .format(new Date())).append('\n');
        s.append("uptime   ").append(SystemClock.elapsedRealtime()).append(" ms\n");
        s.append("device   ").append(Build.MODEL).append(" / android ").append(Build.VERSION.RELEASE)
                .append(" sdk ").append(Build.VERSION.SDK_INT).append('\n');
        s.append("build    ").append(Build.DISPLAY).append(" / ").append(Build.FINGERPRINT)
                .append('\n');
        s.append("locale   ").append(Locale.getDefault()).append('\n');
        s.append("debug    ").append(on() ? "on" : "off").append(" (").append(MARK).append(")\n");
        s.append("usb      ").append(Panel.usb()).append('\n');
        s.append("card     ").append(space(Constant.ROOT_PATH)).append('\n');
        s.append("internal ").append(space(Constant.INTERNAL_PATH)).append('\n');
        s.append("data     ").append(space("/data")).append('\n');
        memory(s);
    }

    /**
     * The heap and what our picture caches hold of it: on API 17 a bitmap's pixels live in the
     * Dalvik heap, and every collector pause grows with what is live.
     */
    private static void memory(StringBuilder s) {
        try {
            Runtime r = Runtime.getRuntime();
            // collected first, so "used" is what is live and not garbage waiting for a pause
            System.gc();
            System.runFinalization();
            System.gc();
            long used = r.totalMemory() - r.freeMemory();
            s.append("heap     ").append(mb(used)).append(" live of ").append(mb(r.totalMemory()))
                    .append(" (max ").append(mb(r.maxMemory())).append(")\n");
            s.append("pictures big covers ").append(mb(BigCover.memBytes()))
                    .append(", thumbnails ").append(mb(CoverCache.memBytes()))
                    .append(", playlist covers ").append(mb(PlGrid.memBytes()))
                    .append(", screensaver ").append(mb(Saver.memBytes())).append('\n');
        } catch (Throwable t) {
        }
    }

    private static String mb(long bytes) {
        return String.format(Locale.US, "%.1f MB", bytes / 1048576f);
    }

    /** The pixels of the bitmaps among {@code values}, bare or in an {@code Object[]}, each once. */
    static long bitmapBytes(java.util.Collection values) {
        long n = 0;
        java.util.IdentityHashMap seen = new java.util.IdentityHashMap();
        Iterator it = values.iterator();
        while (it.hasNext()) {
            Object o = it.next();
            if (o instanceof Object[]) {
                Object[] a = (Object[]) o;
                for (int i = 0; i < a.length; i++) if (a[i] instanceof android.graphics.Bitmap) o = a[i];
            }
            if (o instanceof android.graphics.Bitmap && seen.put(o, o) == null) {
                android.graphics.Bitmap b = (android.graphics.Bitmap) o;
                n += (long) b.getRowBytes() * b.getHeight();
            }
        }
        return n;
    }

    /** The int overloads: the long ones are API 18. */
    private static String space(String path) {
        try {
            File d = new File(path);
            if (!d.isDirectory()) return path + " — missing";
            StatFs st = new StatFs(path);
            long block = st.getBlockSize();
            long free = block * st.getAvailableBlocks();
            long total = block * st.getBlockCount();
            return path + " free " + CacheSize.format(free) + " of " + CacheSize.format(total);
        } catch (Throwable t) {
            return path + " — unreadable";
        }
    }

    /** Every mod preference, sorted; the per-song {@code like:} keys only counted. */
    private static void settings(Context c, StringBuilder s) {
        s.append("\n--- better-Y settings ---\n");
        try {
            Map all = Prefs.all(c);
            if (all == null || all.isEmpty()) {
                s.append("(none)\n");
                return;
            }
            List keys = new ArrayList(all.keySet());
            Collections.sort(keys);
            int likes = 0;
            for (Iterator it = keys.iterator(); it.hasNext(); ) {
                String k = (String) it.next();
                if (k == null) continue;
                if (k.startsWith("like:")) {
                    likes++;
                    continue;
                }
                String v = String.valueOf(all.get(k));
                if (v.length() > 120) v = v.substring(0, 120) + "…";
                s.append(mask(k)).append(" = ").append(v).append('\n');
            }
            s.append("(liked songs: ").append(likes).append(")\n");
        } catch (Throwable t) {
            s.append("(failed: ").append(t).append(")\n");
        }
    }

    /** The Bluetooth keys carry a MAC and the report goes public: only the last two octets stay. */
    private static String mask(String key) {
        if (key == null || !key.startsWith("bt_name:")) return key;
        int cut = key.length() - 5;                 // "XX:XX"
        return cut <= "bt_name:".length() ? key : "bt_name:…:" + key.substring(cut);
    }

    /** Counted off the cached song list: raw table contents, before any splitting. */
    private static void library(Context c, StringBuilder s) {
        s.append("\n--- library ---\n");
        try {
            List all = Albums.allSongs();
            if (all == null) {
                s.append("songs    (unavailable)\n");
            } else {
                HashSet albums = new HashSet();
                HashSet artists = new HashSet();
                HashSet genres = new HashSet();
                int noTag = 0;
                for (int i = 0; i < all.size(); i++) {
                    Song song = (Song) all.get(i);
                    if (song == null) continue;
                    String a = song.getAlbum();
                    String ar = song.getArtist();
                    String g = song.getGenre();
                    if (a != null && a.length() > 0) albums.add(Albums.keyOf(song)); else noTag++;
                    if (ar != null && ar.length() > 0) artists.add(ar);
                    if (g != null && g.length() > 0) genres.add(g);
                }
                s.append("songs    ").append(all.size()).append('\n');
                s.append("albums   ").append(albums.size()).append(" (raw tags, before splitting)\n");
                s.append("artists  ").append(artists.size()).append(" (raw tags)\n");
                s.append("genres   ").append(genres.size()).append(" (raw tags)\n");
                s.append("no album ").append(noTag).append('\n');
            }
            Y1Repository repo = Y1Application.Companion.getY1Repository();
            List pl = repo == null ? null : repo.getAllPlaylistSync();
            s.append("playlists ").append(pl == null ? "(unavailable)" : String.valueOf(pl.size()))
                    .append('\n');
        } catch (Throwable t) {
            s.append("(failed: ").append(t).append(")\n");
        }
        try {
            // getCacheDir: both cover caches live in the INTERNAL one
            File cache = c == null ? null : c.getCacheDir();
            s.append("cache    covers ").append(CacheSize.format(CacheSize.dirSize(
                    cache == null ? null : new File(cache, "ipp_covers"))));
            s.append(", big ").append(CacheSize.format(CacheSize.dirSize(
                    cache == null ? null : new File(cache, "ipp_big"))));
            s.append(", all ").append(CacheSize.format(CacheSize.total(c))).append('\n');
        } catch (Throwable t) {
            s.append("cache    (failed: ").append(t).append(")\n");
        }
        try {
            s.append("theme    ").append(ThemeManager.INSTANCE.getThemeName()).append('\n');
            File[] dirs = new File(Constant.ROOT_PATH, "Themes").listFiles();
            s.append("installed");
            if (dirs == null) {
                s.append(" (none)");
            } else {
                for (int i = 0; i < dirs.length; i++) {
                    s.append(i == 0 ? " " : ", ").append(dirs[i].getName());
                }
            }
            s.append('\n');
        } catch (Throwable t) {
            s.append("theme    (failed: ").append(t).append(")\n");
        }
    }

    private static final int FILE_CAP = 64 * 1024;

    /** An older tombstone is named, not quoted. */
    private static final long STALE_MS = 48L * 3600000L;

    /** Both accounts of a crash: ours (what the app was doing) and stock xCrash's tombstone. */
    private static void crashes(StringBuilder s) {
        File f = newest(Panel.logs(), CRASH);
        s.append("\n--- last crash log the app saved before dying ---\n");
        if (f == null) {
            s.append("(none since the card was last cleared)\n");
        } else {
            s.append(f.getName()).append(", ").append(new SimpleDateFormat(
                    "yyyy-MM-dd HH:mm:ss", Locale.US).format(new Date(f.lastModified())))
                    .append('\n').append(tail(f, FILE_CAP));
        }
        s.append("\n--- last xCrash tombstone ---\n");
        File t = newest(tombstones(), null);
        if (t == null) {
            s.append("(none)\n");
        } else {
            long age = System.currentTimeMillis() - t.lastModified();
            s.append(t.getName()).append(", ").append(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss",
                    Locale.US).format(new Date(t.lastModified()))).append('\n');
            if (age > STALE_MS) {
                s.append("(older than ").append(STALE_MS / 3600000L)
                        .append(" h, not included -- ask for the file itself if it matters)\n");
            } else {
                s.append(tail(t, FILE_CAP));
            }
        }
    }

    /** xCrash's own answer, the default as the fallback. */
    private static File tombstones() {
        try {
            String d = xcrash.XCrash.getLogDir();
            if (d != null && d.length() > 0) return new File(d);
        } catch (Throwable t) {
        }
        try {
            Context c = Y1Application.Companion.getAppContext();
            return c == null ? null : new File(c.getFilesDir(), "tombstones");
        } catch (Throwable t) {
            return null;
        }
    }

    /** The system's ANR traces: a hang is the one failure our own log cannot describe. */
    private static void anr(StringBuilder s) {
        s.append("\n--- /data/anr/traces.txt (tail) ---\n");
        File f = new File("/data/anr/traces.txt");
        if (!f.isFile()) {
            s.append("(none)\n");
            return;
        }
        s.append("written ").append(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US)
                .format(new Date(f.lastModified()))).append('\n');
        s.append(tail(f, FILE_CAP));
    }

    private static File newest(File dir, String prefix) {
        try {
            File[] fs = dir == null ? null : dir.listFiles();
            if (fs == null) return null;
            File best = null;
            for (int i = 0; i < fs.length; i++) {
                if (!fs[i].isFile()) continue;
                if (prefix != null && !fs[i].getName().startsWith(prefix)) continue;
                if (best == null || fs[i].lastModified() > best.lastModified()) best = fs[i];
            }
            return best;
        } catch (Throwable t) {
            return null;
        }
    }

    /** The last {@code cap} bytes of a file. */
    private static String tail(File f, int cap) {
        java.io.RandomAccessFile r = null;
        try {
            r = new java.io.RandomAccessFile(f, "r");
            long len = r.length();
            long from = len > cap ? len - cap : 0;
            r.seek(from);
            byte[] b = new byte[(int) (len - from)];
            r.readFully(b);
            String s = new String(b, "UTF-8");
            if (s.length() == 0) return "(empty)\n";
            return from > 0 ? "(… " + from + " earlier bytes skipped)\n" + s : s;
        } catch (Throwable t) {
            return "(unreadable: " + t + ")\n";
        } finally {
            try {
                if (r != null) r.close();
            } catch (Throwable t) {
            }
        }
    }

    private static void toast(Context c, int res) {
        if (c == null) return;
        toast(c, c.getString(res));
    }

    /** Centred. */
    private static void toast(Context c, String text) {
        try {
            if (c == null || text == null) return;
            Toast t = Toast.makeText(c, text, Toast.LENGTH_LONG);
            android.view.View v = t.getView();
            android.view.View m = (v == null) ? null : v.findViewById(android.R.id.message);
            if (m instanceof android.widget.TextView) {
                ((android.widget.TextView) m).setGravity(android.view.Gravity.CENTER);
            }
            t.show();
        } catch (Throwable e) {
        }
    }
}
