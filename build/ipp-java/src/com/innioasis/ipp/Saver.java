package com.innioasis.ipp;

import android.app.ActivityManager;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.ParcelFileDescriptor;
import android.os.SystemClock;
import android.provider.Settings;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.widget.ImageView;

import com.innioasis.y1.R;
import com.innioasis.y1.activity.IppSaverActivity;
import com.innioasis.y1.activity.WallpaperActivity;
import com.innioasis.y1.base.BaseActivity;
import com.innioasis.y1.theme.ThemeManager;
import com.innioasis.y1.utils.WallpaperUtils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.List;

/**
 * The screensaver: shown where the screen would otherwise dim at the system's Sleep time. The
 * moment is read from the power service's own dump (its last user activity, timeout and dim
 * duration), so a key that went to a dialog or a popup counts exactly as the system counts it,
 * with no hook in any of them. A screen wake lock (video, lyrics with keep_awake) means no saver.
 */
public final class Saver {

    private Saver() { }

    public static final String KEY_ON = "ss_on";
    public static final String KEY_STYLE = "ss_style";
    public static final String KEY_BRIGHT = "ss_bright";
    public static final String KEY_OFF = "ss_off";
    public static final String KEY_CHARGING = "ss_charging";
    public static final String KEY_BG = "ss_background";
    public static final String KEY_CLOCK = "ss_clock_color";
    public static final String KEY_TEXT = "ss_text_color";
    public static final String KEY_TINT = "ss_tint";
    /** The picture of "Set as -> Screensaver"; absent = the theme's global wallpaper. */
    public static final String KEY_IMAGE = "ss_image";

    /** Brightness in percent, the preview's values: 0..100, the index is the percent. */
    public static final int[] BRIGHTS = new int[101];
    public static final int BRIGHT_DEFAULT = 30;

    static {
        for (int i = 0; i < BRIGHTS.length; i++) BRIGHTS[i] = i;
    }

    /** "Turn off the screen after", in the order of the row's values; 0 = never. */
    public static final int[] OFF_MS = {15000, 30000, 45000, 60000, 120000, 180000, 240000,
            300000, 600000, 900000, 0};
    public static final int OFF_DEFAULT = 3;

    /** Clock, Clock and date, Playing song — each Left, Center, Right: the row's nine values. */
    public static final int STYLES = 9;
    public static final int STYLE_DEFAULT = 1;
    public static final int CLOCK = 0;
    public static final int DATE = 1;
    public static final int SONG = 2;

    public static final int BG_LIGHT = 0;
    public static final int BG_DARK = 1;
    public static final int BG_WALLPAPER = 2;

    public static final int COLOR_LIGHT = 0;
    public static final int COLOR_DARK = 1;
    public static final int COLOR_THEME = 2;

    public static final int TINT_OFF = 0;
    public static final int TINT_LIGHT = 1;
    public static final int TINT_DARK = 2;
    public static final int TINT_THEME = 3;

    public static int kind(int style) {
        return style / 3;
    }

    /** 0 left, 1 center, 2 right. */
    public static int side(int style) {
        return style % 3;
    }

    /** Ahead of the dim: the saver must replace it, not follow it. */
    private static final int LEAD_MS = 500;
    /** Sleep time "Never" is a huge timeout; nothing to replace then. */
    private static final long NEVER_MS = 24L * 3600 * 1000;
    private static final int RETRY_MS = 15000;

    private static boolean registered;
    private static Handler main;
    private static Context app;
    private static boolean showing;
    private static boolean dumping;
    private static boolean failedOnce;
    private static final Runnable CHECK = new Check();

    /** Once per process, from {@code BaseActivity.onCreate}. */
    public static void watch(Context c) {
        if (registered || c == null) return;
        registered = true;
        try {
            app = c.getApplicationContext();
            if (app == null) app = c;
            main = new Handler(Looper.getMainLooper());
            Lit.watch(app);
            IntentFilter f = new IntentFilter(Intent.ACTION_SCREEN_ON);
            f.addAction(Intent.ACTION_SCREEN_OFF);
            app.registerReceiver(new Screen(), f);
            schedule(idleDelay());
            if (Prefs.on(app, KEY_ON)) prefetchWall(app, null);
        } catch (Throwable t) {
        }
    }

    /** The saver came up / went away; the next idle period is counted from here. */
    public static void opened() {
        showing = true;
        if (main != null) main.removeCallbacks(CHECK);
    }

    public static void closed() {
        showing = false;
        schedule(idleDelay());
    }

    private static void schedule(long delay) {
        if (main == null) return;
        main.removeCallbacks(CHECK);
        if (!Lit.screenOn() || showing) return;
        main.postDelayed(CHECK, Math.max(1000, delay));
    }

    /** A first guess from the setting alone; the dump then corrects it. */
    private static long idleDelay() {
        long t = 30000;
        try {
            t = Settings.System.getInt(app.getContentResolver(), Settings.System.SCREEN_OFF_TIMEOUT, 30000);
        } catch (Throwable e) {
        }
        if (t <= 0 || t > NEVER_MS) return RETRY_MS * 4;
        return t - dimOf(t) - LEAD_MS;
    }

    /** PowerManagerService: 7 s or a fifth of the timeout, whichever is shorter. */
    private static long dimOf(long timeout) {
        return Math.min(7000, timeout / 5);
    }

    static final class Screen extends BroadcastReceiver {
        @Override
        public void onReceive(Context c, Intent i) {
            if (i == null) return;
            if (Intent.ACTION_SCREEN_ON.equals(i.getAction())) {
                // Lit learns of it from its own receiver, maybe after this one
                if (main != null) main.post(new Later());
            } else if (main != null) {
                main.removeCallbacks(CHECK);
            }
        }
    }

    static final class Later implements Runnable {
        @Override
        public void run() {
            schedule(idleDelay());
        }
    }

    static final class Check implements Runnable {
        @Override
        public void run() {
            if (showing || !Lit.screenOn()) return;
            if (!Prefs.on(app, KEY_ON)) {
                schedule(idleDelay());
                return;
            }
            prefetchWall(app, null);
            if (dumping) return;
            dumping = true;
            new Thread(new Dump(), "ipp-saver").start();
        }
    }

    /** What the power service says; read off the main thread, decided on it. */
    static final class Dump implements Runnable {
        @Override
        public void run() {
            long[] r = null;
            try {
                r = read();
            } catch (Throwable t) {
                if (!failedOnce) {
                    failedOnce = true;
                    Diag.note("saver: power dump failed: " + t);
                }
            }
            main.post(new Decide(r));
        }
    }

    static final class Decide implements Runnable {
        private final long[] r;

        Decide(long[] r) {
            this.r = r;
        }

        @Override
        public void run() {
            dumping = false;
            if (showing || !Lit.screenOn()) return;
            if (r == null) {
                schedule(RETRY_MS * 4);
                return;
            }
            long last = r[0], timeout = r[1], dim = r[2], locks = r[3], awake = r[4];
            if (timeout <= 0 || timeout > NEVER_MS) {
                schedule(RETRY_MS * 4);
                return;
            }
            long fire = last + timeout - dim - LEAD_MS;
            long now = SystemClock.uptimeMillis();
            if (fire - now > 100) {
                schedule(fire - now);
                return;
            }
            // SCREEN_BRIGHT | SCREEN_DIM: something holds the screen on — it is not idle
            // a progress window or the scan: the user is waiting on it, not idle
            if (Loading.up() || Scan.busy()) {
                // nor does the screen go out under it: the system's timeout starts over
                poke();
                schedule(timeout - dim - LEAD_MS);
                return;
            }
            if ((locks & 6) != 0 || awake == 0 || !ours()) {
                schedule(Math.min(RETRY_MS, timeout - dim - LEAD_MS));
                return;
            }
            show();
        }
    }

    private static void poke() {
        try {
            ((android.os.PowerManager) app.getSystemService(Context.POWER_SERVICE))
                    .userActivity(SystemClock.uptimeMillis(), false);
        } catch (Throwable t) {
        }
    }

    private static void show() {
        try {
            Intent i = new Intent(app, IppSaverActivity.class);
            i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            showing = true;
            app.startActivity(i);
        } catch (Throwable t) {
            showing = false;
            schedule(RETRY_MS);
        }
    }

    /** Our screen is in front, and not one that must not be covered. */
    private static boolean ours() {
        try {
            ActivityManager am = (ActivityManager) app.getSystemService(Context.ACTIVITY_SERVICE);
            List tasks = am.getRunningTasks(1);
            if (tasks == null || tasks.isEmpty()) return false;
            ComponentName top = ((ActivityManager.RunningTaskInfo) tasks.get(0)).topActivity;
            if (top == null || !app.getPackageName().equals(top.getPackageName())) return false;
            String cls = top.getClassName();
            return !cls.endsWith(".IppUsbActivity") && !cls.endsWith(".IppSaverActivity")
                    && !cls.endsWith(".VideoActivity");
        } catch (Throwable t) {
            return false;
        }
    }

    // ---- the Screensaver row of Settings -> Wallpaper ---------------------------------------

    /** After Ground glass, Desktop and Global; the gallery is opened with this as its "type". */
    private static final int WALL_ROW = 3;
    private static final int WALL_TYPE = 3;

    /** {@code WallpaperListActivity.initView}, after stock's three rows. */
    public static void wallpaperRow(Context c, Object adapter) {
        try {
            String name = Help.label(c, "screensaver");
            ((com.chad.library.adapter.base.BaseQuickAdapter) adapter).addData(name == null ? "Screensaver" : name);
        } catch (Throwable t) {
        }
    }

    /** {@code WallpaperListActivity.confirm}: true when it opened the gallery for the saver. */
    public static boolean wallpaperConfirm(BaseActivity a) {
        if (a.getMark() != WALL_ROW) return false;
        Intent i = new Intent(a, WallpaperActivity.class);
        i.putExtra("type", WALL_TYPE);
        a.startActivityForResult(i, 4);
        return true;
    }

    /** {@code WallpaperListActivity.updateRight}: the preview beside the list for this row. */
    public static boolean wallpaperPreview(BaseActivity a) {
        if (a.getMark() != WALL_ROW) return false;
        try {
            ImageView img = (ImageView) ((Activity) a).findViewById(R.id.img);
            Bitmap b = wall(a);
            // a large picture is read once, off the wheel's thread; the global preview stands in meanwhile
            if (b == null) {
                prefetchWall(a, img);
                b = WallpaperUtils.INSTANCE.getGlobalBitmapPreview();
            }
            if (b != null) img.setImageBitmap(b);
            else img.setImageResource(R.drawable.bg_main);
        } catch (Throwable t) {
        }
        return true;
    }

    /** {@code WallpaperActivity.save}: the gallery opened from the saver's row keeps the pick here. */
    public static void picked(Activity a, String path) {
        try {
            if (a.getIntent().getIntExtra("type", 0) == WALL_TYPE) {
                Prefs.setString(a, KEY_IMAGE, path);
                Prefs.setInt(a, KEY_BG, BG_WALLPAPER);
            }
            prefetchWall(a, null);
        } catch (Throwable t) {
        }
    }

    // ---- the picture, read once per path ----------------------------------------------------

    private static String wallKey;
    private static Bitmap wallBmp;
    private static String wallLoading;

    /** The saver's picture if already read; null otherwise (or when none is set). */
    public static Bitmap wall(Context c) {
        String p = Prefs.getString(c, KEY_IMAGE, null);
        synchronized (Saver.class) {
            return p != null && p.equals(wallKey) ? wallBmp : null;
        }
    }

    /** Reads the picture off the main thread; {@code show}, if still on this row, gets it after. */
    public static void prefetchWall(Context c, ImageView show) {
        if (c == null) return;
        String p = Prefs.getString(c, KEY_IMAGE, null);
        synchronized (Saver.class) {
            // a picture no longer chosen (a theme without one, after a switch that keeps the process)
            if (wallKey != null && !wallKey.equals(p)) {
                wallKey = null;
                wallBmp = null;
            }
            if (p == null || p.equals(wallKey) || p.equals(wallLoading)) return;
            wallLoading = p;
        }
        Context app = c.getApplicationContext();
        new Thread(new WallLoad(app == null ? c : app, p, show), "ipp-saver-wall").start();
    }

    /** The picture of {@code path}, read now and remembered; for a reader already off the main thread. */
    public static Bitmap loadWall(Context c, String path) {
        synchronized (Saver.class) {
            if (path.equals(wallKey)) return wallBmp;
        }
        Bitmap b = picture(c, path, 480, 360);
        // a file missing now may be on a card not mounted yet (boot): not remembered as "no picture"
        boolean known = b != null || WallpaperUtils.INSTANCE.getPresetMap().get(path) != null
                || new File(path).isFile();
        synchronized (Saver.class) {
            if (known) {
                wallKey = path;
                wallBmp = b;
            }
            if (path.equals(wallLoading)) wallLoading = null;
        }
        return b;
    }

    static final class WallLoad implements Runnable {
        private final Context c;
        private final String path;
        private final java.lang.ref.WeakReference show;

        WallLoad(Context c, String path, ImageView show) {
            this.c = c;
            this.path = path;
            this.show = show == null ? null : new java.lang.ref.WeakReference(show);
        }

        @Override
        public void run() {
            Bitmap b = loadWall(c, path);
            if (b != null && show != null && main != null) main.post(new WallShow(show, b));
        }
    }

    static final class WallShow implements Runnable {
        private final java.lang.ref.WeakReference show;
        private final Bitmap b;

        WallShow(java.lang.ref.WeakReference show, Bitmap b) {
            this.show = show;
            this.b = b;
        }

        @Override
        public void run() {
            ImageView v = (ImageView) show.get();
            if (v == null) return;
            android.content.Context ctx = v.getContext();
            // only while the cursor is still on the Screensaver row
            if (ctx instanceof BaseActivity && ((BaseActivity) ctx).getMark() == WALL_ROW) v.setImageBitmap(b);
        }
    }

    /** From {@code Theme.relaunch}: the old theme's {@code usb.*} is not kept for the new one. */
    public static synchronized void themeChanged() {
        usbKey = null;
        usbBmp = null;
    }

    /** The saver's picture and the theme's {@code usb.*}, for the diagnostic report. */
    static long memBytes() {
        java.util.ArrayList all = new java.util.ArrayList();
        synchronized (Saver.class) {
            all.add(wallBmp);
            all.add(usbBmp);
        }
        return Diag.bitmapBytes(all);
    }

    /** {@code screensaver.*} in a theme's folder; null for none and for the default theme. */
    public static String themePicture(String dir) {
        return themeFile(dir, "screensaver");
    }

    private static String usbKey;
    private static Bitmap usbBmp;

    /** The current theme's {@code usb.*} for the USB screen, read once per file; null for none. */
    public static Bitmap themeUsb(Context c) {
        try {
            String name = ThemeManager.INSTANCE.getThemeName();
            String path = name == null || name.length() == 0 ? null
                    : themeFile(ThemeManager.themesPath + "/" + name, "usb");
            synchronized (Saver.class) {
                if (usbKey != null && !usbKey.equals(path)) {
                    usbKey = null;
                    usbBmp = null;
                }
            }
            if (path == null) return null;
            synchronized (Saver.class) {
                if (path.equals(usbKey)) return usbBmp;
            }
            Bitmap b = picture(c, path, 480, 360);
            synchronized (Saver.class) {
                usbKey = path;
                usbBmp = b;
            }
            return b;
        } catch (Throwable t) {
            return null;
        }
    }

    /** {@code <base>.png/.jpg/.jpeg} in {@code dir}, any case. */
    static String themeFile(String dir, String base) {
        try {
            if (dir == null || dir.trim().length() == 0) return null;
            File[] fs = new File(dir).listFiles();
            if (fs == null) return null;
            for (int i = 0; i < fs.length; i++) {
                String n = fs[i].getName().toLowerCase(java.util.Locale.US);
                if (fs[i].isFile() && (n.equals(base + ".png") || n.equals(base + ".jpg")
                        || n.equals(base + ".jpeg"))) {
                    return fs[i].getAbsolutePath();
                }
            }
        } catch (Throwable t) {
        }
        return null;
    }

    /** Pixels a non-JPEG picture may decode to before it is subsampled on reading. */
    private static final int DECODE_BUDGET = 2000000;

    /**
     * The saver's picture: a file, or one of the gallery's presets by name, cropped to the centre
     * and scaled to exactly {@code w}x{@code h}; null when there is none or it cannot be read.
     */
    public static Bitmap picture(Context c, String path, int w, int h) {
        Bitmap b = decode(c, path, w, h, false);
        return b == null ? null : crop(b, w, h, Bitmap.Config.RGB_565, 0);
    }

    /** Size a wallpaper is stored at. */
    static final int WALL_W = 480, WALL_H = 360;

    /**
     * A picture chosen as wallpaper, in place of stock's copy of it: cropped to the centre as the
     * screen shows it, on white, and written as a JPEG of {@link #WALL_W}x{@link #WALL_H}. Read by halves:
     * decoded whole, a camera photo takes tens of megabytes.
     */
    public static void wallpaperFile(File f) {
        try {
            if (f == null) return;
            Context c = com.innioasis.y1.Y1Application.Companion.getAppContext();
            Bitmap b = decode(c, f.getAbsolutePath(), WALL_W, WALL_H, false);
            if (b == null) return;
            Bitmap out = crop(b, WALL_W, WALL_H, Bitmap.Config.ARGB_8888, 0xFFFFFFFF);
            java.io.FileOutputStream os = new java.io.FileOutputStream(f);
            try {
                out.compress(Bitmap.CompressFormat.JPEG, 95, os);
                os.flush();
            } finally {
                os.close();
                out.recycle();
            }
        } catch (Throwable t) {
            Diag.note("Saver.wallpaperFile: " + t);
        }
    }

    /**
     * A picture at its own size, or fitted into {@code w}x{@code h} when larger; never enlarged,
     * the alpha kept. For the theme's {@code better-Y.*}, which stands where a drawable would.
     */
    public static Bitmap fitted(Context c, String path, int w, int h) {
        Bitmap b = decode(c, path, w, h, true);
        if (b == null || (b.getWidth() <= w && b.getHeight() <= h)) return b;
        float k = Math.min((float) w / b.getWidth(), (float) h / b.getHeight());
        int fw = Math.max(1, Math.round(b.getWidth() * k)), fh = Math.max(1, Math.round(b.getHeight() * k));
        Bitmap out = Bitmap.createBitmap(fw, fh, Bitmap.Config.ARGB_8888);
        draw(b, out, 0, 0, b.getWidth(), b.getHeight());
        return out;
    }

    /**
     * Read in ARGB and reduced by halves, each filtered, to no less than what the last step needs:
     * {@code w}x{@code h} in both sides for a crop, in either for a fit. A single big step samples
     * a few source pixels per output pixel and looks pixelated.
     */
    private static Bitmap decode(Context c, String path, int w, int h, boolean fit) {
        if (path == null) return null;
        try {
            Object res = WallpaperUtils.INSTANCE.getPresetMap().get(path);
            BitmapFactory.Options o = new BitmapFactory.Options();
            o.inJustDecodeBounds = true;
            o.inScaled = false;
            if (res != null) BitmapFactory.decodeResource(c.getResources(), ((Integer) res).intValue(), o);
            else if (new File(path).isFile()) BitmapFactory.decodeFile(path, o);
            else return null;
            if (o.outWidth <= 0 || o.outHeight <= 0) return null;
            // JPEG is reduced on decoding by averaging; other formats only drop pixels, so they
            // are subsampled only as far as memory requires
            boolean jpeg = "image/jpeg".equals(o.outMimeType);
            int s = 1;
            while (halves(o.outWidth / s, o.outHeight / s, w, h, fit)
                    && (jpeg || (long) (o.outWidth / s) * (o.outHeight / s) > DECODE_BUDGET)) s *= 2;
            BitmapFactory.Options d = new BitmapFactory.Options();
            d.inSampleSize = s;
            d.inScaled = false;
            d.inPreferredConfig = Bitmap.Config.ARGB_8888;
            Bitmap b = res != null ? BitmapFactory.decodeResource(c.getResources(), ((Integer) res).intValue(), d)
                    : BitmapFactory.decodeFile(path, d);
            if (b == null) return null;
            while (halves(b.getWidth(), b.getHeight(), w, h, fit)) {
                Bitmap half = Bitmap.createScaledBitmap(b, b.getWidth() / 2, b.getHeight() / 2, true);
                if (half != b) b.recycle();
                b = half;
            }
            return b;
        } catch (Throwable t) {
            return null;
        }
    }

    /** Whether half of {@code bw}x{@code bh} is still no smaller than the last step needs. */
    private static boolean halves(int bw, int bh, int w, int h, boolean fit) {
        return fit ? bw / 2 >= w || bh / 2 >= h : bw / 2 >= w && bh / 2 >= h;
    }

    /** {@code b} as CENTER_CROP would show it in {@code w}x{@code h}, filtered, over {@code bg}. */
    private static Bitmap crop(Bitmap b, int w, int h, Bitmap.Config cfg, int bg) {
        int bw = b.getWidth(), bh = b.getHeight();
        int cw = bw, ch = bh;
        if ((long) bw * h > (long) bh * w) cw = (int) ((long) bh * w / h);
        else ch = (int) ((long) bw * h / w);
        int x = (bw - cw) / 2, y = (bh - ch) / 2;
        Bitmap out = Bitmap.createBitmap(w, h, cfg);
        if (bg != 0) out.eraseColor(bg);
        draw(b, out, x, y, cw, ch);
        return out;
    }

    /** The part of {@code b} at x,y of cw x ch over the whole of {@code out}, filtered; b is let go. */
    private static void draw(Bitmap b, Bitmap out, int x, int y, int cw, int ch) {
        android.graphics.Paint p = new android.graphics.Paint(
                android.graphics.Paint.FILTER_BITMAP_FLAG | android.graphics.Paint.DITHER_FLAG);
        new android.graphics.Canvas(out).drawBitmap(b, new android.graphics.Rect(x, y, x + cw, y + ch),
                new android.graphics.Rect(0, 0, out.getWidth(), out.getHeight()), p);
        b.recycle();
    }

    /** {last user activity (uptime), timeout, dim duration, wake lock summary, awake 1/0}. */
    private static long[] read() throws Exception {
        IBinder b = (IBinder) Class.forName("android.os.ServiceManager")
                .getMethod("getService", new Class[]{String.class}).invoke(null, new Object[]{"power"});
        if (b == null) return null;
        File f = new File(app.getCacheDir(), "ipp_power.txt");
        ParcelFileDescriptor pfd = ParcelFileDescriptor.open(f, ParcelFileDescriptor.MODE_WRITE_ONLY
                | ParcelFileDescriptor.MODE_CREATE | ParcelFileDescriptor.MODE_TRUNCATE);
        try {
            b.dump(pfd.getFileDescriptor(), new String[0]);
        } finally {
            pfd.close();
        }
        long last = -1, timeout = -1, dim = -1, locks = 0, awake = 1;
        BufferedReader in = new BufferedReader(new FileReader(f));
        try {
            String s;
            while ((s = in.readLine()) != null) {
                s = s.trim();
                if (s.startsWith("mLastUserActivityTime=")) last = number(s, '=');
                else if (s.startsWith("Screen off timeout:")) timeout = number(s, ':');
                else if (s.startsWith("Screen dim duration:")) dim = number(s, ':');
                else if (s.startsWith("mWakeLockSummary=0x")) locks = Long.parseLong(s.substring(19).trim(), 16);
                else if (s.startsWith("mWakefulness=")) awake = s.endsWith("Awake") ? 1 : 0;
            }
        } finally {
            in.close();
        }
        f.delete();
        if (last < 0 || timeout < 0) return null;
        if (dim < 0) dim = dimOf(timeout);
        return new long[]{last, timeout, dim, locks, awake};
    }

    /** The first run of digits after {@code sep}. */
    private static long number(String s, char sep) {
        int i = s.indexOf(sep) + 1;
        while (i < s.length() && !Character.isDigit(s.charAt(i))) i++;
        int j = i;
        while (j < s.length() && Character.isDigit(s.charAt(j))) j++;
        return j > i ? Long.parseLong(s.substring(i, j)) : -1;
    }
}
