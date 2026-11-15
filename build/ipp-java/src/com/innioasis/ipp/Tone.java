package com.innioasis.ipp;

import android.content.Context;
import android.content.Intent;
import android.media.AudioManager;
import android.media.SoundPool;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.SystemClock;
import android.view.KeyEvent;
import android.view.View;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;

import com.innioasis.fm.configs.KeyMap;
import com.innioasis.music.objects.Constant;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.activity.SettingActivity;
import com.innioasis.y1.base.BaseBindingAdapter;
import com.innioasis.y1.databinding.ActivitySettingBinding;
import com.innioasis.y1.theme.ThemeManager;
import com.innioasis.y1.utils.SharedPreferencesUtils;

import java.io.File;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

/**
 * The key tone, played by the launcher itself: Settings -> Key tone is a section of three rows
 * (on/off, volume 1..10, the sound) shown by a second instance of {@link SettingActivity}.
 *
 * The system tone ({@code PhoneWindowManager} -> {@code playSoundEffect(0)}, Effect_Tick.ogg at a
 * fixed -6 dB) cannot be given another file or volume — /system is read-only — so it is switched
 * off for good through the MTK audio profile and replaced here, on the same keys and on the first
 * down event only. The cost: the click comes off the main thread's key dispatch, so a screen that
 * is busy opening delays it, where the system's never was.
 *
 * Keys reach a window only while the screen is on, so the tone is silent with the screen off by
 * construction — a player in a pocket does not click at every brush of the wheel.
 */
public final class Tone {

    private Tone() { }

    public static final String KEY_ON = "key_tone";
    public static final String KEY_VOLUME = "key_tone_volume";
    public static final String KEY_SOUND = "key_tone_sound";

    /** Volume rows run 1..10; the stored value is the index, 7 = level 8 = stock's loudness. */
    public static final int VOLUME_DEFAULT = 7;

    /** 3 dB a step, level 10 = full scale; level 8 is the system's own -6 dB. */
    private static final float[] GAIN = {
            0.0447f, 0.0631f, 0.0891f, 0.1259f, 0.1778f,
            0.2512f, 0.3548f, 0.5012f, 0.7079f, 1.0f};

    /** {@link #KEY_SOUND}: "" is the stock tick, THEME the applied theme's file, else a file name. */
    static final String THEME = "\u0001theme";

    private static final String DEFAULT_PATH = "/system/media/audio/ui/Effect_Tick.ogg";
    private static final String DIR = "key-tone";
    private static final String THEME_FILE = "key-tone";
    private static final String[] EXT = {".mp3", ".ogg", ".wav"};

    /** The profile stock writes; there is only one on this device. */
    private static final String PROFILE = "mtk_audioprofile_general";

    /** Left by the build that only muted the system tone while the screen was off. */
    private static final String P_MUTED = "tone_muted";

    private static final String EXTRA = "ipp_key_tone";

    private static boolean started;

    // ---- the state --------------------------------------------------------------------------

    /**
     * From {@code BaseActivity.onCreate}; the work is done once. NOT from
     * {@code Y1Application.onCreate}: the Application class is verified before multidex installs
     * classes2, so a call into this package cannot resolve there and the launcher dies at every
     * start.
     */
    public static void watch(Context c) {
        if (started || c == null) return;
        started = true;
        try {
            Context app = c.getApplicationContext();
            if (app == null) app = c;
            Lit.watch(app);
            sync(app);
            sound(app);                      // load ahead, or the first press is silent
            new Thread(new Seed(app), "ipp-tone").start();
        } catch (Throwable t) {
        }
    }

    /**
     * The system tone is folded into ours and switched off. A profile found ON means somebody
     * wants the tone: stock's "Reset settings", a backup from before this build, or this device
     * on its first start with it. The first start also takes the profile's OFF as the user's.
     * Replaces the body of stock's {@code Utils.initKeyToneState}, so Settings and the status bar
     * read the result through stock's mirror.
     */
    public static void sync(Context c) {
        if (c == null) return;
        try {
            Object m = manager(c);
            boolean sys = m != null && enabled(m);
            boolean muted = Prefs.getBool(c, P_MUTED, false);
            if (sys || muted || !Prefs.has(c, KEY_ON)) Prefs.setBool(c, KEY_ON, sys || muted);
            if (muted) Prefs.setBool(c, P_MUTED, false);
            if (sys) enable(m, false);
        } catch (Throwable t) {
        }
        mirror(c);
    }

    public static boolean on(Context c) {
        return Prefs.on(c, KEY_ON);
    }

    /** From the backup's restore, and from Settings. */
    public static void setOn(Context c, boolean on) {
        if (c == null) return;
        Prefs.setBool(c, KEY_ON, on);
        mirror(c);
    }

    /**
     * From the top of {@code SettingActivity.setVibratorRingtone}, which writes both profile flags
     * at once: Key vibration's row passes stock's mirror of ours along, Reset passes true. Taken
     * as ours, and the profile is handed false.
     */
    public static boolean stockWrite(boolean on) {
        setOn(Y1Application.Companion.getAppContext(), on);
        return false;
    }

    /** Stock's copy, read by the Settings row and the status-bar icon. */
    private static void mirror(Context c) {
        try {
            SharedPreferencesUtils.INSTANCE.setRingtone(on(c));
        } catch (Throwable t) {
        }
    }

    // ---- playing ----------------------------------------------------------------------------

    /**
     * The keys the system clicked on: home, menu, back, the wheel, the side keys, play, centre.
     * The wheel and the side keys come from {@code KeyMap}: their codes differ per device and
     * firmware (see {@link Press#layout}).
     */
    private static boolean clicks(int k) {
        KeyMap m = KeyMap.INSTANCE;
        return k == 3 || k == 82 || k == 4 || k == 85 || k == 66
                || k == m.getKEY_UP() || k == m.getKEY_DOWN()
                || k == m.getKEY_LEFT() || k == m.getKEY_RIGHT();
    }

    private static long lastDown = -1;
    private static int lastKey;

    /**
     * From the top of every {@code dispatchKeyEvent} the app defines. One press passes several of
     * them (a screen's own and its base class's), so it is known by its down time and key code.
     */
    public static void key(KeyEvent e) {
        try {
            Open.key(e);
            if (e == null || e.getAction() != KeyEvent.ACTION_DOWN || e.getRepeatCount() != 0) return;
            int k = e.getKeyCode();
            if (!clicks(k)) return;
            if (e.getDownTime() == lastDown && k == lastKey) return;
            lastDown = e.getDownTime();
            lastKey = k;
            Context c = Y1Application.Companion.getAppContext();
            // While a value is open the wheel plays the candidate instead; the click on top of it,
            // at the saved sound and volume, would drown out exactly what is being compared.
            if (c == null || !on(c) || editing != null) return;
            play(sound(c), gain(c, -1));
        } catch (Throwable t) {
        }
    }

    private static SoundPool pool;
    private static final HashMap ids = new HashMap();     // path -> Integer sample id
    private static final HashMap loaded = new HashMap();  // Integer sample id -> Boolean
    private static int pending;                           // a preview waiting for its load
    private static float pendingGain;

    private static float gain(Context c, int index) {
        int v = index >= 0 ? index : Prefs.val(c, KEY_VOLUME);
        if (v < 0 || v >= GAIN.length) v = VOLUME_DEFAULT;
        return GAIN[v];
    }

    private static int previewStream;

    // Everything SoundPool runs on ipp-tone. play() on 4.2 creates and starts an AudioTrack in
    // mediaserver over binder, synchronously: 100–370 ms per click, which the main thread waited
    // out on every wheel click. The pool is created there too, so
    // its load callback arrives there and these fields live on one thread.

    private static Handler worker;

    private static synchronized Handler worker() {
        if (worker == null) {
            HandlerThread t = new HandlerThread("ipp-tone");
            t.start();
            worker = new Handler(t.getLooper());
        }
        return worker;
    }

    private static final int PLAY = 0, PREVIEW = 1, PRELOAD = 2;

    static final class Job implements Runnable {
        private final int kind;
        private final String path;
        private final float gain;

        Job(int kind, String path, float gain) {
            this.kind = kind;
            this.path = path;
            this.gain = gain;
        }

        public void run() {
            try {
                if (kind == PREVIEW) previewNow(path, gain);
                else playNow(path, gain);
                if (kind == PRELOAD) pending = 0;
            } catch (Throwable t) {
            }
        }
    }

    private static void play(String path, float gain) {
        if (path != null) worker().post(new Job(PLAY, path, gain));
    }

    private static void preview(String path, float gain) {
        if (path != null) worker().post(new Job(PREVIEW, path, gain));
    }

    /** A candidate cuts the one before it short, so a fast wheel never stacks them. */
    private static void previewNow(String path, float gain) {
        if (pool != null && previewStream != 0) pool.stop(previewStream);
        previewStream = 0;
        playNow(path, gain);
    }

    /** Now if loaded; otherwise loads it and plays it on arrival. */
    private static void playNow(String path, float gain) {
        if (path == null) return;
        if (pool == null) {
            pool = new SoundPool(4, AudioManager.STREAM_SYSTEM, 0);
            pool.setOnLoadCompleteListener(new Loaded());
        }
        Integer id = (Integer) ids.get(path);
        if (id == null) {
            id = Integer.valueOf(pool.load(path, 1));
            ids.put(path, id);
        }
        if (loaded.get(id) != null) {
            previewStream = pool.play(id.intValue(), gain, gain, 1, 0, 1.0f);
        } else {
            pending = id.intValue();
            pendingGain = gain;
        }
    }

    static final class Loaded implements SoundPool.OnLoadCompleteListener {
        @Override
        public void onLoadComplete(SoundPool p, int id, int status) {
            if (status != 0) return;
            loaded.put(Integer.valueOf(id), Boolean.TRUE);
            if (id == pending) {
                pending = 0;
                previewStream = p.play(id, pendingGain, pendingGain, 1, 0, 1.0f);
            }
        }
    }

    private static String soundFor = null;
    private static String themeFor = null;
    private static String path;
    private static boolean missing;      // the setting names a file that was not there, card not up yet
    private static long triedAt;
    /** Set by the end of a scan: the card was lent over USB, a sound may have been copied. */
    private static volatile boolean recheck;

    /** From the end of a scan. */
    static void recheck() {
        recheck = true;
    }
    private static boolean told;

    /** A named file found missing is looked for again this often: at boot the card may not be up. */
    private static final long RETRY_MS = 2000L;

    /**
     * The file the setting names, resolved once per (setting, theme) pair — except a named file
     * that was missing while the card was not up, which is retried: Default must not stick for the
     * whole session. With the card up a sound can only arrive over USB, and a scan follows that.
     */
    private static String sound(Context c) {
        String s = Prefs.getString(c, KEY_SOUND, "");
        String theme = ThemeManager.INSTANCE.getThemeName();
        long now = SystemClock.uptimeMillis();
        if (path != null && s.equals(soundFor) && eq(theme, themeFor)
                && !recheck && !(missing && now - triedAt >= RETRY_MS)) {
            return path;
        }
        soundFor = s;
        themeFor = theme;
        triedAt = now;
        recheck = false;
        String p = resolve(s, theme);
        boolean absent = s.length() > 0 && DEFAULT_PATH.equals(p);
        missing = absent && !Theme.cardMounted();
        if (absent && !told) {
            told = true;
            Diag.note("key tone: " + (THEME.equals(s) ? "theme's sound" : s) + " not found, Default for now");
        }
        if (!p.equals(path)) {
            path = p;
            worker().post(new Job(PRELOAD, path, 0.0f));    // nothing heard: it only gets the file loaded
        }
        return path;
    }

    private static String resolve(String s, String theme) {
        File f = null;
        if (THEME.equals(s)) {
            if (theme != null && theme.length() > 0) {
                File dir = new File(ThemeManager.themesPath, theme);
                for (int i = 0; i < EXT.length && f == null; i++) {
                    File t = new File(dir, THEME_FILE + EXT[i]);
                    if (t.isFile()) f = t;
                }
            }
        } else if (s.length() > 0) {
            File t = new File(dir(), s);
            if (t.isFile()) f = t;
        }
        return f != null ? f.getAbsolutePath() : DEFAULT_PATH;
    }

    private static File dir() {
        return new File(Panel.card(), DIR);
    }

    /** The sound the folder starts with, from the APK's assets. */
    private static final String SEED = "better-Y.mp3";

    /**
     * Makes better-Y/key-tone with our sound in it, so there is a place to put one's own. Only
     * when the FOLDER is missing: a sound the user deleted out of it stays deleted. A card not
     * mounted yet (or lent to a computer) is left for the next try.
     */
    static void seed(Context c) {
        File root = new File(Constant.ROOT_PATH);
        File d = dir();
        if (!root.canWrite() || d.isDirectory() || !d.mkdirs()) return;
        java.io.InputStream in = null;
        java.io.OutputStream out = null;
        File f = new File(d, SEED);
        try {
            in = c.getAssets().open(SEED);
            out = new java.io.FileOutputStream(f);
            byte[] b = new byte[8192];
            for (int n; (n = in.read(b)) > 0; ) out.write(b, 0, n);
        } catch (Throwable t) {
            f.delete();
        } finally {
            try { if (in != null) in.close(); } catch (Throwable t) { }
            try { if (out != null) out.close(); } catch (Throwable t) { }
        }
    }

    static final class Seed implements Runnable {
        private final Context c;
        Seed(Context c) { this.c = c; }
        public void run() {
            try { seed(c); } catch (Throwable t) { }
        }
    }

    private static boolean eq(String a, String b) {
        return a == null ? b == null : a.equals(b);
    }

    /** Default, Theme sound, then the files of better-Y/key-tone by name. */
    private static String[] soundIds() {
        List l = new ArrayList();
        l.add("");
        l.add(THEME);
        String[] names = dir().list();
        if (names != null) {
            Arrays.sort(names, String.CASE_INSENSITIVE_ORDER);
            for (int i = 0; i < names.length; i++) {
                if (audio(names[i]) && new File(dir(), names[i]).isFile()) l.add(names[i]);
            }
        }
        return (String[]) l.toArray(new String[l.size()]);
    }

    private static boolean audio(String name) {
        String n = name.toLowerCase();
        for (int i = 0; i < EXT.length; i++) if (n.endsWith(EXT[i])) return true;
        return false;
    }

    private static String soundName(Context c, String id) {
        if (id.length() == 0) return c.getString(R.string.ipp_tone_default);
        if (THEME.equals(id)) return c.getString(R.string.ipp_tone_theme);
        int dot = id.lastIndexOf('.');
        return dot > 0 ? id.substring(0, dot) : id;
    }

    // ---- the Settings section ---------------------------------------------------------------

    private static boolean section(SettingActivity a) {
        return a != null && a.getIntent() != null && a.getIntent().getBooleanExtra(EXTRA, false);
    }

    private static final int ROW_ON = 0;
    private static final int ROW_VOLUME = 1;
    private static final int ROW_SOUND = 2;

    private static int rowOf(SettingActivity a, String title) {
        if (a.getString(R.string.setting_clicker).equals(title)) return ROW_ON;
        if (a.getString(R.string.ipp_tone_volume).equals(title)) return ROW_VOLUME;
        if (a.getString(R.string.ipp_tone_sound).equals(title)) return ROW_SOUND;
        return -1;
    }

    private static String value(SettingActivity a, int row) {
        if (row == ROW_ON) return a.getString(on(a) ? R.string.On : R.string.Off);
        if (row == ROW_VOLUME) return String.valueOf(volumeIndex(a) + 1);
        return soundName(a, currentSound(a));
    }

    private static int volumeIndex(Context c) {
        int v = Prefs.val(c, KEY_VOLUME);
        return v < 0 || v >= GAIN.length ? VOLUME_DEFAULT : v;
    }

    /** The setting, or Default when it names a file that is gone. */
    private static String currentSound(Context c) {
        String s = Prefs.getString(c, KEY_SOUND, "");
        if (s.length() == 0 || THEME.equals(s)) return s;
        return new File(dir(), s).isFile() ? s : "";
    }

    /**
     * From the end of {@code setRecyclerData}: in the section the list is its own three rows,
     * and only the first while the tone is off.
     */
    public static void settingsRows(SettingActivity a, List list) {
        if (!section(a)) {
            // In Settings the row opens the section, so it carries the arrow, not a value.
            String name = a.getString(R.string.setting_clicker);
            for (int i = 0; i < list.size(); i++) {
                if (name.equals(((SettingActivity.SettingItem) list.get(i)).getTitle())) {
                    list.set(i, new SettingActivity.SettingItem(name, true, ""));
                }
            }
            return;
        }
        RecyclerView rv = ((ActivitySettingBinding) a.getVb()).recycler;
        if (fitted == null || fitted.get() != rv) {
            fitted = new java.lang.ref.WeakReference(rv);
            rv.addOnChildAttachStateChangeListener(new Fit(rv));
        }
        list.clear();
        list.add(new SettingActivity.SettingItem(a.getString(R.string.setting_clicker), false, value(a, ROW_ON)));
        if (!on(a)) return;
        list.add(new SettingActivity.SettingItem(a.getString(R.string.ipp_tone_volume), false, value(a, ROW_VOLUME)));
        list.add(new SettingActivity.SettingItem(a.getString(R.string.ipp_tone_sound), false, value(a, ROW_SOUND)));
    }

    // only to know the list again: weak, or it keeps a closed Settings screen with its background
    private static java.lang.ref.WeakReference fitted;

    /**
     * A sound's name can be any file name: in the row it ends in an ellipsis where it would push
     * the title aside (the stock value column is wrap_content); the panel keeps it whole.
     */
    static final class Fit implements RecyclerView.OnChildAttachStateChangeListener {
        private final RecyclerView rv;
        Fit(RecyclerView rv) { this.rv = rv; }

        @Override
        public void onChildViewAttachedToWindow(View row) {
            TextView title = (TextView) row.findViewById(R.id.title);
            TextView value = (TextView) row.findViewById(R.id.text);
            if (title == null || value == null) return;
            int w = rv.getWidth() > 0 ? rv.getWidth() : rv.getResources().getDisplayMetrics().widthPixels / 2;
            float dp = rv.getResources().getDisplayMetrics().density;
            int room = w - (int) Math.ceil(title.getPaint().measureText(String.valueOf(title.getText())))
                    - (int) (20 * dp);
            // each of the three asks a layout unasked: only where something changes
            if (value.getMaxLines() != 1) value.setSingleLine(true);
            value.setEllipsize(android.text.TextUtils.TruncateAt.END);
            int max = Math.max(room, w / 3);
            if (value.getMaxWidth() != max) value.setMaxWidth(max);
        }

        @Override
        public void onChildViewDetachedFromWindow(View row) { }
    }

    /** From the top of {@code confirm}; true when the press was ours. */
    public static boolean settingsConfirm(SettingActivity a, String title) {
        if (!section(a) && Sleep.confirm(a, title)) return true;
        if (!section(a)) {
            if (!a.getString(R.string.setting_clicker).equals(title)) return false;
            a.startActivity(new Intent(a, SettingActivity.class).putExtra(EXTRA, true));
            return true;
        }
        if (editing == a) {
            endEdit(a, true);
            return true;
        }
        int row = rowOf(a, title);
        if (row == ROW_ON) {
            setOn(a, !on(a));
            rebuild(a);
        } else if (row == ROW_VOLUME || row == ROW_SOUND) {
            startEdit(a, row);
        }
        return true;
    }

    /** From {@code refreshRight}, after the title is set: every row shows Key tone's picture. */
    public static boolean settingsPanel(SettingActivity a, String title) {
        if (Backlight.panel(a, title)) return true;
        if (Sleep.panel(a, title)) return true;
        if (MenuStyle.settingsLogo(a, title)) return true;
        if (!section(a)) return false;
        ActivitySettingBinding vb = (ActivitySettingBinding) a.getVb();
        ThemeManager.INSTANCE.commonSetIcon(vb.rightImage,
                on(a) ? R.drawable.icon_setting_ringtone_on : R.drawable.icon_setting_ringtone_off);
        int row = rowOf(a, title);
        vb.infoStateTv.setText(editing == a && row == editRow ? label(a) : row < 0 ? "" : value(a, row));
        return true;
    }

    /** From the top of {@code clockwise}/{@code antiClockwise}: inside a value the wheel is the value's. */
    public static boolean settingsWheel(SettingActivity a, int dir) {
        if (Sleep.wheel(a, dir)) return true;
        if (editing != a) return false;
        int n = editRow == ROW_VOLUME ? GAIN.length : options.length;
        editVal = ((editVal + dir) % n + n) % n;
        showCandidate(a);
        if (editRow == ROW_VOLUME) preview(sound(a), gain(a, editVal));
        else preview(resolve(options[editVal], ThemeManager.INSTANCE.getThemeName()), gain(a, -1));
        return true;
    }

    /** From {@code direction}: the top button puts an open value back rather than leaving. */
    public static boolean settingsTop(SettingActivity a) {
        if (Sleep.top(a)) return true;
        if (editing != a) return false;
        endEdit(a, false);
        return true;
    }

    /**
     * From the end of {@code onResume}. The section puts its own name in the status bar; Settings,
     * back from it, repaints the panel, which still shows the state from before.
     */
    public static void settingsResume(SettingActivity a) {
        try {
            String name = a.getString(R.string.setting_clicker);
            if (section(a)) {
                a.setStateBarLeftText(name);
                return;
            }
            BaseBindingAdapter ad = adapter(a);
            if (ad == null) return;
            List data = ad.getData();
            int m = a.getMark();
            if (m < 0 || m >= data.size()) return;
            String row = ((SettingActivity.SettingItem) data.get(m)).getTitle();
            // Brightness too: stock repaints it on return in the setting's own percent
            if (name.equals(row) || a.getString(R.string.setting_brightness).equals(row)) {
                a.ippRefreshRight(row);
            }
        } catch (Throwable t) {
        }
    }

    private static BaseBindingAdapter adapter(SettingActivity a) {
        RecyclerView rv = ((ActivitySettingBinding) a.getVb()).recycler;
        RecyclerView.Adapter ad = rv.getAdapter();
        return ad instanceof BaseBindingAdapter ? (BaseBindingAdapter) ad : null;
    }

    /** The rows below Key tone come and go with it; the cursor stays on Key tone, the first row. */
    private static void rebuild(SettingActivity a) {
        BaseBindingAdapter ad = adapter(a);
        if (ad == null) return;
        List l = new ArrayList();
        settingsRows(a, l);
        ad.setList(l);
        a.setMark(0);
        a.ippRefreshRight(a.getString(R.string.setting_clicker));
    }

    // ---- a value opened by the wheel --------------------------------------------------------

    private static final long BLINK_MS = 400;
    private static final Handler H = new Handler(Looper.getMainLooper());

    private static SettingActivity editing;
    private static int editRow;
    private static int editVal;
    private static String[] options = new String[0];
    private static Blink blink;

    private static void startEdit(SettingActivity a, int row) {
        editing = a;
        editRow = row;
        if (row == ROW_VOLUME) {
            editVal = volumeIndex(a);
        } else {
            seed(a);                         // a card that was away at start-up is here now
            options = soundIds();
            editVal = Math.max(0, Arrays.asList(options).indexOf(currentSound(a)));
        }
        showCandidate(a);
    }

    private static String label(SettingActivity a) {
        return editRow == ROW_VOLUME ? String.valueOf(editVal + 1) : soundName(a, options[editVal]);
    }

    /** The candidate in the row and the panel, and the blink restarted from "visible". */
    private static void showCandidate(SettingActivity a) {
        String s = label(a);
        ((ActivitySettingBinding) a.getVb()).infoStateTv.setText(s);
        TextView tv = rowText(a);
        if (tv == null) return;
        tv.setText(s);
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

    private static void endEdit(SettingActivity a, boolean commit) {
        H.removeCallbacks(blink);
        TextView tv = rowText(a);
        if (tv != null) tv.setVisibility(View.VISIBLE);
        if (commit) {
            if (editRow == ROW_VOLUME) Prefs.setInt(a, KEY_VOLUME, editVal);
            else Prefs.setString(a, KEY_SOUND, options[editVal]);
            path = null;                     // the same choice again looks for its file again
        }
        editing = null;
        BaseBindingAdapter ad = adapter(a);
        if (ad != null) {
            List data = ad.getData();
            int m = a.getMark();
            if (m >= 0 && m < data.size()) {
                SettingActivity.SettingItem it = (SettingActivity.SettingItem) data.get(m);
                it.setText(value(a, editRow));
                ad.notifyItemChanged(m);
            }
        }
        a.ippRefreshRight(editRow == ROW_VOLUME
                ? a.getString(R.string.ipp_tone_volume) : a.getString(R.string.ipp_tone_sound));
    }

    // ---- the MTK profile --------------------------------------------------------------------

    /** {@code Context.AUDIOPROFILE_SERVICE} is hidden, so only the service NAME needs reflection. */
    private static Object manager(Context c) {
        try {
            Field f = Context.class.getDeclaredField("AUDIOPROFILE_SERVICE");
            Object name = f.get(null);
            return (name instanceof String) ? c.getSystemService((String) name) : null;
        } catch (Throwable t) {
            return null;
        }
    }

    private static boolean enabled(Object m) {
        try {
            Method g = m.getClass().getMethod("getSoundEffectEnabled", String.class);
            Object v = g.invoke(m, PROFILE);
            return (v instanceof Boolean) && ((Boolean) v).booleanValue();
        } catch (Throwable t) {
            return false;
        }
    }

    private static void enable(Object m, boolean on) {
        try {
            Method s = m.getClass().getMethod("setSoundEffectEnabled", String.class, Boolean.TYPE);
            s.invoke(m, PROFILE, Boolean.valueOf(on));
        } catch (Throwable t) {
        }
    }
}
