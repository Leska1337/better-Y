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
 * One file the user can attach to a bug report, and the debug mode that makes the device
 * worth logging in the first place.
 *
 * The report
 * "Save diagnostic log" in [Tools] writes {@code better-Y/logs/log_<date>_<time>.log} to the CARD,
 * beside the crash logs: the report has to be readable later, over USB, from a device that may
 * never be next to a PC. It holds four things, because a report answering only one of them tends to need a second
 * round of questions: what build this is and what it is running on, what the mod is set to, what
 * the library looks like, and the tail of both logcat buffers.
 *
 * The one thing the button cannot fix is the age of the buffer. `logcat`'s ring is small and,
 * while music plays, `AudioFlinger` fills it in about twenty seconds (skill `ipp-device-testing`),
 * so a snapshot taken minutes after a defect may no longer carry it. That is what the debug mode is
 * for, and it is also why it is worth saying plainly: the log is most useful pressed straight away.
 *
 * The debug mode
 * Stock Timber logging is off in this build for a measured reason ({@code Y1Application$TimberTree}
 * — skill `ipp-perf-profiling`), and it is switched back on by a file on the card, read once at
 * {@code <clinit>}. Creating that file needs a PC, which is exactly what a user filing a bug report
 * does not have to hand. So it is toggled from the device instead: **five centre presses on Settings →
 * About**. Not a menu row, because it is not a feature — it costs speed everywhere, needs a reboot
 * to take effect, and a user who has not been asked for it has no business finding it. The same
 * five presses turn it off again.
 */
public final class Diag {

    private Diag() { }

    /**
     * The marker {@code Y1Application$TimberTree.<clinit>} reads. Hard-coded there as a literal, so
     * it is hard-coded here too — the two must agree, and there is nowhere shared to put it that
     * stock smali could reach as cheaply.
     */
    static final String MARK = "/storage/sdcard0/better-Y/debug_log";

    /**
     * The name a spilled ring is written under. "crash" rather than "state" because the person
     * asked for the file is the person who has just had one, and it has to be obvious which file
     * that is.
     */
    private static final String CRASH = "crash_";

    /** Presses on About that toggle the debug mode. */
    private static final int TAPS = 5;

    /** A gap longer than this starts the count over: five presses, not five presses ever. */
    private static final long GAP_MS = 2000L;

    /** How much of one command's output is kept. */
    private static final int CAP = 256 * 1024;

    /**
     * In the debug mode the main buffer is dumped whole: every wheel click writes a dozen system
     * lines into it, so a fixed tail misses whatever happened a few seconds before the user reached
     * the button. The ordinary report keeps its 800-line tail.
     * {@link Panel#exec} keeps the HEAD of the output and logcat prints oldest first, so this must
     * stay above the ~256 KB ring as text, or the newest lines are the ones cut.
     */
    private static final int MAIN_CAP = 1024 * 1024;

    private static int taps;
    private static long lastTap;

    /** Is the verbose (stock) logging mode on? */
    static boolean on() {
        try {
            return new File(MARK).isFile();
        } catch (Throwable t) {
            return false;
        }
    }

    // ------------------------------------------------------------------ the app's own log ring

    /**
     * The last {@value #RING} messages the app logged, kept in memory — the half of the report that
     * logcat cannot be relied on for.
     *
     * Three facts decide this design, and all three are measured (skill `ipp-perf-profiling`):
     *
     *   - The messages are already built. A Kotlin {@code Timber.d("… $x")} assembles its
     *       string at the call site, before any tree, any tag and any filter — so today the app
     *       pays for ~905 call sites' worth of text and then throws it away. Keeping a reference to
     *       what already exists costs a store, not a formatting pass.
     *   - What was expensive is the TAG, not the text. {@code DebugTree.getTag} takes a
     *       stack trace per call; that is why quiet mode exists at all, and it stays off here — the
     *       ring keeps the constant tag.
     *   - logcat's ring is not ours. It holds ~256 KB for the whole system, and while
     *       music plays {@code AudioFlinger} fills it in about twenty seconds, so a report saved a
     *       minute after a defect has already lost it. These 2000 entries are the app's alone, so
     *       they cover minutes of its work whatever the system is shouting about.
     *
     * Nothing here writes to a file or to the log driver: a record is a timestamp, a priority
     * and two references. The file is only ever built in {@link #report}.
     *
     * What reaches it is decided in {@code TimberTree.isLoggable}, at INFO. Keeping
     * DEBUG as well was measured and dropped: it is where stock's per-bind and per-click chatter
     * lives — several messages per wheel click, hundreds per screen open — and letting it through
     * cost ~9 ms on opening a list, because Timber then stops taking its early exit and the
     * messages stop dying young. The wheel never noticed either way.
     */
    private static final int RING = 2000;

    private static final long[] ringWhen = new long[RING];
    private static final int[] ringPri = new int[RING];
    private static final String[] ringTag = new String[RING];
    private static final String[] ringMsg = new String[RING];

    /** Total records ever stored; the ring holds the last RING of them. */
    private static int ringN;

    /**
     * Called from {@code Y1Application$TimberTree.log} for every message the app logs, whatever its
     * priority. Synchronized because Timber is called from every thread the app has; the block is
     * four stores long, so the lock is never held long enough to be contended in practice.
     */
    public static synchronized void ring(int priority, String tag, String message, Throwable t) {
        try {
            if (!armed) arm();
            int i = ringN % RING;
            ringWhen[i] = System.currentTimeMillis();
            ringPri[i] = priority;
            ringTag[i] = tag;
            // A throwable is rare (an error path) and its stack is the whole point of the record,
            // so it is flattened now — the objects behind it must not be kept alive until the
            // report is written.
            ringMsg[i] = t == null ? message
                    : message + '\n' + android.util.Log.getStackTraceString(t);
            ringN++;
        } catch (Throwable e) {
            // logging must never be able to break the thing it is logging
        }
    }

    /**
     * The mod's own voice in the log. Everything in {@code com/innioasis/ipp/} is silent by design
     * — a shipped build carries no {@code Log.e} — which meant the report described stock in
     * detail and said nothing at all about the half of the device the user is actually reporting
     * on. These are the decisions worth a line: a cache dropped, a folder deleted, an encoding
     * guessed, the queue rebuilt. They are rare events, so the ring stays readable.
     */
    public static void note(String message) {
        ring(4 /* INFO */, "ipp", message, null);
    }

    /** Oldest first, in logcat's own shape so the two halves of the report read alike. */
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

    // ------------------------------------------------------------------ surviving the crash

    /**
     * The ring lives in the process, so a crash takes it with it — and a crash is exactly the case
     * the report is wanted for. So the last thing the process does is write the ring out.
     *
     * Installed from the first {@link #ring} call rather than from {@code Y1Application}: the
     * app's first Timber message is "Y1Application Init start", i.e. this is armed a few
     * milliseconds into the process and no stock file has to be edited for it. Whatever handler
     * was in place is kept and called afterwards — xCrash is initialised just before this point
     * ({@code XCrash.init} in {@code Y1Application}) and writes the tombstone with the stack,
     * the threads and the memory; ours adds the one thing it cannot know, which is what the app
     * was doing beforehand.
     */
    private static boolean armed;
    private static Thread.UncaughtExceptionHandler prev;

    private static void arm() {
        armed = true;                       // set first: a failure here must not retry per message
        try {
            prev = Thread.getDefaultUncaughtExceptionHandler();
            Thread.setDefaultUncaughtExceptionHandler(new Crash());
        } catch (Throwable t) {
            // no handler, no crash file; the tombstone and logcat still carry the stack
        }
    }

    /** Named (d8 here crashes on anonymous classes). */
    static final class Crash implements Thread.UncaughtExceptionHandler {
        public void uncaughtException(Thread th, Throwable e) {
            spill("uncaught exception on thread " + (th == null ? "?" : th.getName()), e);
            try {
                if (prev != null) prev.uncaughtException(th, e);
            } catch (Throwable t) {
                // ignore
            }
        }
    }

    /**
     * Write the ring to the card because the process is about to end — a crash, a force reboot.
     * The report picks the newest of these up, so the history of a session
     * that died survives into the next one; without it the ring, being memory, would be exactly
     * as absent as the process.
     */
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
            // whatever was about to happen matters more than this file
        }
    }

    /** Write and flush to the card, or fail quietly. */
    private static void write(File f, String text) {
        FileOutputStream out = null;
        try {
            out = new FileOutputStream(f);
            out.write(text.getBytes("UTF-8"));
            out.flush();
            out.getFD().sync();             // the process is about to end
        } catch (Throwable t) {
            // ignore
        } finally {
            try {
                if (out != null) out.close();
            } catch (Throwable t) {
                // ignore
            }
        }
    }

    /** Keep the newest {@code keep} files with this prefix; the card is not a log server. */
    static void keepNewest(File dir, String prefix, int keep) {
        try {
            File[] fs = dir.listFiles();
            if (fs == null || fs.length <= keep) return;
            List mine = new ArrayList();
            for (int i = 0; i < fs.length; i++) {
                if (fs[i].isFile() && fs[i].getName().startsWith(prefix)) mine.add(fs[i]);
            }
            // The names carry yyyyMMdd_HHmmss, so alphabetical order IS chronological order.
            Collections.sort(mine, new NameCmp());
            for (int i = 0; i < mine.size() - keep; i++) ((File) mine.get(i)).delete();
        } catch (Throwable t) {
            // ignore
        }
    }

    /** Named, raw (the bundled d8 crashes dexing generic Signature attributes). */
    static final class NameCmp implements java.util.Comparator {
        public int compare(Object a, Object b) {
            return ((File) a).getName().compareTo(((File) b).getName());
        }
    }

    // ------------------------------------------------------------------ the hidden switch

    /**
     * Injected into {@code AboutActivity.confirm()}, which is empty in stock — the centre press
     * does nothing at all on that screen, so counting presses there takes nothing away.
     */
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
            // a diagnostic that throws is worse than one that does nothing
        }
    }

    /** Create or remove the marker. Returns false when the card would not have it. */
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

    // ------------------------------------------------------------------ the report

    /** [Tools] → "Save diagnostic log". Collected on a worker: it execs logcat and walks the card. */
    public static void save(Activity a) {
        Thread t = new Thread(new Save(a), "ipp-diag");
        t.setDaemon(true);
        t.start();
    }

    /** Named (d8 here crashes on anonymous classes). */
    static final class Save implements Runnable {
        private final Activity a;

        Save(Activity a) { this.a = a; }

        public void run() {
            File f = null;
            try {
                f = report(a);
            } catch (Throwable t) {
                // reported as a failure below
            }
            try {
                a.runOnUiThread(new Note(a, f));
            } catch (Throwable t) {
                // the screen is gone; the file is written either way
            }
        }
    }

    /** Back on the main thread: say where it went, or that it did not. */
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
                // ignore
            }
        }
    }

    /** Write the report and hand back the file, or null if nothing could be written. */
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
                s.append("\n--- logcat -b main -v time (tail 800) ---\n");
                s.append(Panel.exec(new String[]{"/system/bin/logcat", "-d", "-b", "main", "-v",
                        "time", "-t", "800"}, CAP));
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
                // ignore
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
    }

    /** "free 1.2 GB of 14.8 GB", or why not. The int overloads: the long ones are API 18. */
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

    /**
     * Every preference of the mod, sorted, minus the bulk. {@code like:<path>} is one entry per
     * favourited song and the cache stamps are machine-written numbers — hundreds of lines that say
     * nothing about a defect and would push the logcat tail out of a readable file. They are
     * counted instead.
     */
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

    /**
     * The Bluetooth rename keys carry the device's MAC ({@code bt_name:14:28:76:B6:79:0A}), and
     * this file is meant to be attached to a public bug report. The last two octets are kept —
     * enough to tell two paired devices apart in the log, not enough to identify the hardware.
     */
    private static String mask(String key) {
        if (key == null || !key.startsWith("bt_name:")) return key;
        int cut = key.length() - 5;                 // "XX:XX"
        return cut <= "bt_name:".length() ? key : "bt_name:…:" + key.substring(cut);
    }

    /**
     * What the library looks like from the app's side. The counts come off the cached song list
     * ({@code Albums.allSongs}) rather than from queries of their own: it is one table read the
     * screens have usually paid for already, and counting in Java keeps this out of the way of the
     * splitting rules — what is counted here is what is actually in the table.
     */
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
            // getCacheDir, not getExternalCacheDir: both cover caches live in the INTERNAL one
            // (CoverCache.dir / BigCover.dir), and the first report written on the device duly
            // said "covers 0 B" next to a library that had them all.
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

    // ------------------------------------------------------------------ what died, and how

    /** How much of one saved file is carried over into the report. */
    private static final int FILE_CAP = 64 * 1024;

    /** A crash older than this belongs to another session and is named, not quoted. */
    private static final long STALE_MS = 48L * 3600000L;

    /**
     * The two accounts of a crash, side by side: ours, which knows what the app was doing, and
     * xCrash's, which knows how it died.
     *
     * xCrash is initialised by stock ({@code XCrash.init} in {@code Y1Application}) and was
     * simply never read by anybody — it writes a tombstone per Java crash, per native crash and
     * per ANR, with the stack, every thread, the memory map and the logcat it could reach. So the
     * report does not need a crash catcher of its own for the stack; what it adds is
     * {@link #spill}'s file, which carries the ring as it stood when the process died.
     */
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
            // Only a RECENT one is carried in. The first report written on the device pulled in a
            // crash from three weeks earlier and spent 800 lines on it -- a tombstone is evidence
            // when it is about the session being reported and archaeology otherwise. The name and
            // the date stay either way, so an old one can still be asked for by hand.
            if (age > STALE_MS) {
                s.append("(older than ").append(STALE_MS / 3600000L)
                        .append(" h, not included -- ask for the file itself if it matters)\n");
            } else {
                s.append(tail(t, FILE_CAP));
            }
        }
    }

    /** Where xCrash keeps its tombstones; its own answer, with the default as the fallback. */
    private static File tombstones() {
        try {
            String d = xcrash.XCrash.getLogDir();
            if (d != null && d.length() > 0) return new File(d);
        } catch (Throwable t) {
            // the library is stock's, and its answer is only a convenience
        }
        try {
            Context c = Y1Application.Companion.getAppContext();
            return c == null ? null : new File(c.getFilesDir(), "tombstones");
        } catch (Throwable t) {
            return null;
        }
    }

    /**
     * The system's ANR traces. Every process is in there, ours among them, and the file is written
     * by {@code system_server} the moment something stops answering — which is the one failure a
     * log of our own can never describe, because the thread that would write it is the stuck one.
     */
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

    /** The newest file in a directory, optionally by prefix, or null. */
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

    /** The last {@code cap} bytes of a file — a tombstone or traces.txt can be megabytes. */
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
                // ignore
            }
        }
    }

    // ------------------------------------------------------------------ toasts

    private static void toast(Context c, int res) {
        if (c == null) return;
        toast(c, c.getString(res));
    }

    /** Centred, the way every toast of the mod's own is (see {@code Queue}). */
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
            // ignore
        }
    }
}
