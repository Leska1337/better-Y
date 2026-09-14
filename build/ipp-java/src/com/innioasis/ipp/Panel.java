package com.innioasis.ipp;

import android.content.Context;

import com.innioasis.music.objects.Constant;
import com.innioasis.y1.R;

import java.io.File;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * The mod's place on the card and its reach into the system: our folder and its subfolders, adb
 * switched on at every start, and the commands the diagnostic report runs.
 *
 * Everything the app writes about itself goes to the CARD, not to logcat or the app's cache: the
 * private directory cannot be read from a PC (adb runs as {@code shell}), and the card can be, over
 * USB, from a device that may never be next to a PC.
 */
public final class Panel {

    private Panel() { }

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
     * ring a dying session spilled.
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

    /**
     * Run a command and return its output, capped. A command can be refused rather than fail —
     * {@code logcat} answers nothing unless the uid is in the {@code log} group — and a refusal is
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
