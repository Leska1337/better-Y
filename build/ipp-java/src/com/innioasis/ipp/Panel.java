package com.innioasis.ipp;

import android.content.Context;
import android.os.Build;
import android.os.SystemClock;

import com.innioasis.music.objects.Constant;
import com.innioasis.y1.R;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * A diagnostic for the one defect on this device that our code cannot be shown to cause or not
 * cause: the whole screen drawn shifted sideways, wrapping round from the right edge to the left,
 * with the row highlights drawn wrong along with it. Seen three times, always after a flash, once
 * at the moment the screen woke on a USB connect; it clears itself, and blanking the screen and
 * turning it back on clears it at once. It is not reproducible on demand, which is exactly why the
 * test has to be a button on the device rather than a command from a PC.
 *
 * What the test actually separates
 * Blanking the screen re-initialises the panel, so "it goes away when the screen is blanked" tells
 * us nothing on its own — everything from our own drawing down to the display controller is
 * re-done at once. What separates them is restarting the COMPOSITOR and nothing else:
 * SurfaceFlinger comes back with fresh state while the kernel's framebuffer and the panel are left
 * exactly as they were.
 *
 *   - Shift gone — it lived in software above the driver (SurfaceFlinger's composition,
 *       or something an app did to it). Then there is something to look for, and our own code is
 *       a candidate again.
 *   - Shift still there — nothing above the kernel display driver is responsible, and the
 *       app cannot be. That closes the question.
 *
 * {@code adb shell stop; start} would have been the obvious way to do this and is not available:
 * adb on this device runs as uid {@code shell}, which may not set the {@code ctl.*} properties, and
 * our boot images only add {@code adb} to {@code persist.sys.usb.config} — they do not make the
 * build debuggable. It is also the weaker test, because it restarts zygote and {@code system_server}
 * while usually leaving SurfaceFlinger alive, which is the one process this is about.
 *
 * Why the app can do what adb cannot
 * SurfaceFlinger runs as uid {@code system}, and so do we ({@code sharedUserId}), so {@code kill(2)}
 * on it is permitted — the same fact {@code Force} already leans on to kill {@code system_server}
 * when a reboot cannot be asked for politely.
 *
 * The report is written to the CARD, not to logcat or the app's cache, because the whole point
 * is that the defect turns up when there is no PC within reach: it has to be readable later, over
 * USB, in {@code better-Y/logs} beside the diagnostic report and the crash logs.
 */
public final class Panel {

    private Panel() { }

    /** Seconds to wait for the framework to fall over on its own before pushing it. */
    private static final long SETTLE_MS = 6000L;

    /** How much of one command's output is kept. A SurfaceFlinger dump is a few tens of KB. */
    private static final int CAP = 96 * 1024;

    /** The name of our folder on the card, in one place — everything else asks {@link #card()}. */
    private static final String DIR = "better-Y";

    /**
     * Our folder on the card, without creating it — the caller decides whether an absent
     * folder means "make one" or "there is nothing here".
     *
     * The card is named by {@code Constant.ROOT_PATH} — never
     * {@code getExternalStorageDirectory()}, which the platform refuses for uid {@code system} with
     * a {@code wtf} and a full stack.
     */
    static File card() {
        return new File(new File(Constant.ROOT_PATH), DIR);
    }

    /** {@link #card()}, created if it is not there — for the code that is about to write. */
    static File dir() {
        File d = card();
        if (!d.isDirectory()) d.mkdirs();
        return d;
    }

    /**
     * {@code better-Y/logs} — everything the app writes ABOUT ITSELF: the diagnostic report, the
     * ring a dying session spilled, the compositor's dump.
     *
     * The folder's root is left to the things a person puts there or edits by hand
     * ({@code comma_artists.txt}, {@code debug_log}), so what is a file the user WRITES and what
     * is a file the app writes are not mixed in one listing.
     */
    static File logs() {
        return sub("logs");
    }

    /** {@code better-Y/backup} — the data archives ({@link Backup}). */
    static File backups() {
        return sub("backup");
    }

    /** One folder inside ours, created along with ours if neither is there. */
    private static File sub(String name) {
        File d = new File(card(), name);
        if (!d.isDirectory()) d.mkdirs();
        return d;
    }

    /** The USB function set init switches on, and the one word that has to be in it. */
    private static final String USB_KEY = "persist.sys.usb.config";

    /**
     * Turn adb on, from {@code MainActivity.initView} — once per app start.
     *
     * adb is how a build reaches a player that cannot be flashed: {@code adb install -r} replaces
     * the launcher and leaves {@code usrdata} — settings, playlists, likes, bookmarks and the
     * library — exactly where it was. So the mod switches it on itself rather than leaving it to
     * the firmware, and it is on unconditionally: there is no row for it in the better-Y menu.
     *
     * The property is the lever; the setting is not. What starts {@code adbd} is
     * {@code init.usb.rc}: it reacts to {@code persist.sys.usb.config} by copying it into
     * {@code sys.usb.config}, and every function set that contains {@code adb} has a block that
     * starts the daemon. On this firmware nothing else has a say — with
     * {@code Settings.Global.adb_enabled} at 1 and a factory boot image the player stays silent, so
     * the framework's usual reconciliation of that setting into the property does not happen here.
     * A boot image can only change the property's DEFAULT, which init reads while {@code /data} is
     * empty, and that default never arrives at all when the firmware was installed by a tool that
     * leaves the boot partition alone — the official Innioasis Updater is one, it writes system and
     * usrdata only. Setting the property directly works whatever boot image the player carries.
     *
     * Permitted because the app runs as uid {@code system}: init's property ACL gives
     * {@code persist.sys.} to that uid. {@code SystemProperties} is hidden API, hence reflection.
     *
     * Read first, written only when {@code adb} is missing from it: the write is what makes init
     * reconfigure USB, and a launch has no business doing that when the answer is already yes. The
     * value is extended rather than replaced, so a player set to MTP or PTP keeps it — every such
     * combination has its own block in {@code init.usb.rc}.
     */
    public static void adb() {
        String cur = "?";
        try {
            cur = prop(USB_KEY);
            if (cur.contains("adb")) {
                Diag.note("usb config " + cur + ", adb already in it");
                return;
            }
            String next = cur.length() == 0 ? "mass_storage,adb" : cur + ",adb";
            Class sp = Class.forName("android.os.SystemProperties");
            sp.getMethod("set", String.class, String.class).invoke(null, USB_KEY, next);
            // The read-back is the whole point: init ignores a set it does not allow, silently, so
            // "asked" and "now" being different is the only way to see a refusal.
            Diag.note("usb config " + cur + " -> asked " + next + ", now " + prop(USB_KEY));
        } catch (Throwable t) {
            Diag.note("usb config " + cur + " failed: " + t);
        }
    }

    /** One system property, or "" — {@code SystemProperties} is hidden API, hence reflection. */
    private static String prop(String key) {
        try {
            Class sp = Class.forName("android.os.SystemProperties");
            String v = (String) sp.getMethod("get", String.class, String.class).invoke(null, key, "");
            return v == null ? "" : v;
        } catch (Throwable t) {
            return "";
        }
    }

    /** The USB state for the diagnostic report: what init was asked for, and what it is running. */
    public static String usb() {
        return "persist=" + prop(USB_KEY) + " sys=" + prop("sys.usb.config");
    }

    /**
     * Write the report and hand back the file, or null if nothing could be written. Runs on a
     * worker: it execs {@code dumpsys}, which is a binder round trip into a process that is, by
     * hypothesis, misbehaving.
     */
    public static File report(Context c) {
        FileOutputStream out = null;
        try {
            File f = new File(logs(), "sf_" + stamp() + ".log");
            StringBuilder s = new StringBuilder(4096);
            s.append("better-Y ").append(version(c)).append('\n');
            s.append("when    ").append(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US)
                    .format(new Date())).append('\n');
            s.append("uptime  ").append(SystemClock.elapsedRealtime()).append(" ms\n");
            s.append("build   ").append(Build.DISPLAY).append(" / ").append(Build.FINGERPRINT)
                    .append('\n');
            s.append("sf pid  ").append(Force.pidOf("/system/bin/surfaceflinger")).append('\n');

            s.append("\n--- /sys/class/graphics/fb0 ---\n");
            // A fixed list rather than the whole directory: some sysfs attributes block or have
            // side effects when read, and these are the ones that describe the geometry the panel
            // is being driven with -- which is what a sideways shift would show up in.
            String[] fb = {"name", "virtual_size", "bits_per_pixel", "stride", "mode", "modes",
                    "state", "blank", "rotate"};
            for (int i = 0; i < fb.length; i++) {
                String v = read("/sys/class/graphics/fb0/" + fb[i]);
                if (v != null) s.append(fb[i]).append(" = ").append(v.trim()).append('\n');
            }

            s.append("\n--- dumpsys SurfaceFlinger ---\n");
            s.append(exec(new String[]{"/system/bin/dumpsys", "SurfaceFlinger"}, CAP));
            s.append("\n--- logcat -d -v time (tail) ---\n");
            s.append(exec(new String[]{"/system/bin/logcat", "-d", "-v", "time", "-t", "300"}, CAP));

            out = new FileOutputStream(f);
            out.write(s.toString().getBytes("UTF-8"));
            out.flush();
            out.getFD().sync();        // the compositor is about to be killed under us
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

    /**
     * Kill the compositor, then make sure the device comes back to something usable.
     *
     * Killing SurfaceFlinger alone is the clean test: init restarts it, and if
     * {@code system_server} notices and goes down with it the whole framework comes back anyway.
     * If it does NOT notice, the screen is left frozen on the last frame it composed — which would
     * turn a diagnostic into a power-cycle — so after {@link #SETTLE_MS} the same ladder
     * {@code Force} uses takes {@code system_server} down deliberately. Neither step re-initialises
     * the panel, so the answer the test is after is not spoiled by the fallback.
     *
     * On a daemon thread with no Handler: our own process is very likely to be killed half way
     * through, and none of this may be allowed to hold a frame up.
     */
    public static void restart() {
        Diag.spill("SurfaceFlinger restart from [Tools]", null);
        Thread t = new Thread(new Kill(), "ipp-sf-restart");
        t.setDaemon(true);
        t.start();
    }

    private static final class Kill implements Runnable {
        public void run() {
            int sf = Force.pidOf("/system/bin/surfaceflinger");
            android.util.Log.e("ippPanel", "restarting surfaceflinger, pid=" + sf);
            if (sf > 0) {
                try {
                    android.os.Process.killProcess(sf);
                } catch (Throwable t) {
                    android.util.Log.e("ippPanel", "kill surfaceflinger failed", t);
                }
            }
            sleep(SETTLE_MS);
            // Still here, so the framework rode it out and the screen is showing a frame nothing
            // is going to replace. Take it down the way Force does.
            int ss = Force.pidOf("system_server");
            android.util.Log.e("ippPanel", "still here; system_server pid=" + ss);
            if (ss > 0) {
                try {
                    android.os.Process.killProcess(ss);
                } catch (Throwable t) {
                    // not ours to kill after all
                }
            }
        }
    }

    private static void sleep(long ms) {
        try {
            Thread.sleep(ms);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }

    static String stamp() {
        return new SimpleDateFormat("yyyyMMdd_HHmmss", Locale.US).format(new Date());
    }

    static String version(Context c) {
        try {
            return c == null ? "?" : c.getString(R.string.ipp_version);
        } catch (Throwable t) {
            return "?";
        }
    }

    /** A small file, or null. Used for sysfs, where every value is a line or two. */
    static String read(String path) {
        InputStream in = null;
        try {
            File f = new File(path);
            if (!f.isFile()) return null;
            in = new FileInputStream(f);
            byte[] b = new byte[512];
            int got = in.read(b);
            return got <= 0 ? "" : new String(b, 0, got, "UTF-8");
        } catch (Throwable t) {
            return null;
        } finally {
            try {
                if (in != null) in.close();
            } catch (Throwable t) {
                // ignore
            }
        }
    }

    /**
     * Run a command and return its output, capped. Both commands here can be refused rather than
     * fail — {@code dumpsys SurfaceFlinger} answers "Permission Denial" unless the caller holds
     * {@code android.permission.DUMP} (declared in the manifest for exactly this), and
     * {@code logcat} answers nothing unless the uid is in the {@code log} group. A refusal is
     * itself worth having in the file, so whatever comes back is what gets written.
     */
    static String exec(String[] cmd, int cap) {
        Process p = null;
        InputStream in = null;
        try {
            ProcessBuilder pb = new ProcessBuilder(cmd);
            pb.redirectErrorStream(true);
            p = pb.start();
            in = p.getInputStream();
            byte[] buf = new byte[8192];
            StringBuilder s = new StringBuilder(8192);
            int total = 0, got;
            while ((got = in.read(buf)) > 0) {
                if (total >= cap) break;
                if (total + got > cap) got = cap - total;
                s.append(new String(buf, 0, got, "UTF-8"));
                total += got;
            }
            return s.toString();
        } catch (Throwable t) {
            return "(failed: " + t + ")\n";
        } finally {
            try {
                if (in != null) in.close();
            } catch (Throwable t) {
                // ignore
            }
            try {
                if (p != null) p.destroy();
            } catch (Throwable t) {
                // ignore
            }
        }
    }
}
