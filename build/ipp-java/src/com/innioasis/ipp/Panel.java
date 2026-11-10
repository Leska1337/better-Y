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
 * Our folder on the card, adb switched on at every start, and the commands the diagnostic report
 * runs. What the app writes about itself goes to the card: the private directory cannot be read
 * from a PC, the card can, over USB.
 */
public final class Panel {

    private Panel() { }

    /** The folder's name, in one place — everything else asks {@link #card()}. */
    private static final String DIR = "better-Y";

    /** Not created here: the caller decides what an absent folder means. */
    static File card() {
        return new File(new File(Constant.ROOT_PATH), DIR);
    }

    /**
     * What the app writes about itself. The folder's root is kept for files a person puts there
     * ({@code comma_artists.txt}, {@code debug_log}).
     */
    static File logs() {
        return sub("logs");
    }

    static File backups() {
        return sub("backup");
    }

    private static File sub(String name) {
        File d = new File(card(), name);
        if (!d.isDirectory()) d.mkdirs();
        return d;
    }

    private static final String USB_KEY = "persist.sys.usb.config";

    /**
     * Turns adb on, once per app start, unconditionally. On this firmware only the property starts
     * adbd ({@code init.usb.rc}); {@code adb_enabled} does nothing, and a boot image's default never
     * arrives when the Updater leaves the boot partition alone. Allowed for uid {@code system}.
     * Written only when {@code adb} is missing — the write makes init reconfigure USB — and
     * extended rather than replaced, so MTP/PTP is kept.
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
            // init ignores a disallowed set silently; the read-back is the only way to see it.
            Diag.note("usb config " + cur + " -> asked " + next + ", now " + prop(USB_KEY));
        } catch (Throwable t) {
            Diag.note("usb config " + cur + " failed: " + t);
        }
    }

    /** "" when absent. {@code SystemProperties} is hidden API, hence reflection. */
    private static String prop(String key) {
        try {
            Class sp = Class.forName("android.os.SystemProperties");
            String v = (String) sp.getMethod("get", String.class, String.class).invoke(null, key, "");
            return v == null ? "" : v;
        } catch (Throwable t) {
            return "";
        }
    }

    /** What init was asked for, and what it is running. */
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
     * Output capped at {@code cap} bytes; a refusal's text is returned as the output. Never while
     * FM is up: the child closes the inherited {@code /dev/fm}, the driver powers the chip down
     * behind the FM service, and the radio stays silent until Pause and Play. Otherwise the next
     * power-up reopens the device first (Fm.reopen).
     */
    static String exec(String[] cmd, int cap) {
        if (Fm.busy()) return "(skipped: FM radio is on, a process started now silences it)\n";
        Process p = null;
        InputStream in = null;
        try {
            ProcessBuilder pb = new ProcessBuilder(cmd);
            pb.redirectErrorStream(true);
            Fm.dirty = true;
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
            }
            try {
                if (p != null) p.destroy();
            } catch (Throwable t) {
            }
        }
    }
}
