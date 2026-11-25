package com.innioasis.y1.activity;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.os.BatteryManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.PowerManager;
import android.os.SystemClock;
import android.text.TextPaint;
import android.text.TextUtils;
import android.text.format.DateFormat;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.innioasis.ipp.Albums;
import com.innioasis.ipp.BigCover;
import com.innioasis.ipp.Cover;
import com.innioasis.ipp.Feat;
import com.innioasis.ipp.Icons;
import com.innioasis.ipp.Ipp;
import com.innioasis.ipp.Prefs;
import com.innioasis.ipp.Saver;
import com.innioasis.ipp.Tone;
import com.innioasis.fm.configs.KeyMap;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.service.PlayerService;
import com.innioasis.y1.theme.ThemeManager;
import com.innioasis.music.util.Other;
import com.innioasis.y1.utils.WallpaperUtils;

import java.util.Date;
import java.util.Locale;

/**
 * The screensaver ({@link Saver}) and its live preview. Nothing ticks: the clock is redrawn on
 * TIME_TICK, the song on MY_PLAY_SONG. The first key only closes it and goes nowhere else; the
 * screen going off closes it too, so waking returns to the screen it covered.
 */
public final class IppSaverActivity extends Activity {

    /**
     * Preview from the Style row: left/right pick a category, the wheel its value, shown live and
     * written at once, so leaving keeps what is on screen.
     */
    public static final String EXTRA_PREVIEW = "preview";

    /** The preview's categories; their names and values are the asset's rows of the same keys. */
    private static final String[] CATS = {Saver.KEY_STYLE, Saver.KEY_BRIGHT, Saver.KEY_BG,
            Saver.KEY_TINT, Saver.KEY_CLOCK, Saver.KEY_TEXT};
    private static final int[] COUNTS = {Saver.STYLES, Saver.BRIGHTS.length, 3, 4, 3, 3};
    private static final int BRIGHT_STEP = 5;
    /** The preview's hint: its asset row, and the flag every Style preview shares. */
    private static final String TIP = "ss_tip";
    private static final String TIP_OFF = com.innioasis.ipp.TipDialog.STYLE_OFF;
    private com.innioasis.ipp.TipDialog tip;

    private static final int LIGHT = 0xFFFFFFFF;
    private static final int DARK = 0xFF121212;
    private static final int MARGIN = 24;
    private static final int COVER = 180;
    private static final int COVER_CENTER = 170;
    private static final int TEXT_EDGE = 8;
    /** The stock context menu's own background, for a theme that sets none. */
    private static final int MENU_BG = 0xFF8C94B2;
    /** Each line may wrap once; then it ends in an ellipsis. */
    private static final int LINES = 2;
    /** How far the date may run past the clock's width when centred; at a side it may not. */
    private static final int DATE_OVER = 70;
    private int dateOver;

    private boolean preview;
    private int cat;
    private int style;
    private Handler ui;
    private FrameLayout back;
    private FrameLayout content;
    private TextView head;
    private TextView band;
    private TextView clock;
    private TextView date;
    private ImageView cover;
    private String coverPath;
    private String lastPath;
    private Bitmap lastCover;
    private Rx rx;
    private final Runnable sleep = new Sleep(this);
    private final Runnable fade = new Fade(this);
    private static final int FADE_STEPS = 25;
    private static final int FADE_STEP_MS = 60;
    private float from;
    private float target;
    private int step;
    private int down = -1;

    @Override
    protected void onCreate(Bundle b) {
        super.onCreate(b);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        Window w = getWindow();
        w.setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);
        w.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        ui = new Handler();
        preview = getIntent().getBooleanExtra(EXTRA_PREVIEW, false);
        int bi = Prefs.val(this, Saver.KEY_BRIGHT);
        if (bi < 0 || bi >= Saver.BRIGHTS.length) bi = Saver.BRIGHT_DEFAULT;
        target = com.innioasis.ipp.Backlight.window(Saver.BRIGHTS[bi]);
        // the saver eases down from the brightness the user was looking at; the preview is at once
        from = preview ? target : systemBrightness();
        brightness(from);
        if (!preview) ui.postDelayed(fade, FADE_STEP_MS);
        style = Prefs.val(this, Saver.KEY_STYLE);
        if (style < 0 || style >= Saver.STYLES) style = Saver.STYLE_DEFAULT;

        FrameLayout root = new FrameLayout(this);
        back = new FrameLayout(this);
        root.addView(back, new FrameLayout.LayoutParams(-1, -1));
        paintBack();
        content = new FrameLayout(this);
        root.addView(content, new FrameLayout.LayoutParams(-1, -1));
        if (preview) {
            head = band(root, Gravity.TOP);
            band = band(root, Gravity.BOTTOM);
        }
        setContentView(root);
        layout();
        bands();
        if (preview) tip = com.innioasis.ipp.TipDialog.show(this, TIP, TIP_OFF);

        rx = new Rx(this);
        IntentFilter f = new IntentFilter(Intent.ACTION_TIME_TICK);
        f.addAction(Intent.ACTION_TIME_CHANGED);
        f.addAction(Intent.ACTION_TIMEZONE_CHANGED);
        f.addAction(Intent.ACTION_SCREEN_OFF);
        f.addAction(Intent.ACTION_POWER_CONNECTED);
        f.addAction(Intent.ACTION_POWER_DISCONNECTED);
        f.addAction("android.intent.action.MY_PLAY_SONG");
        registerReceiver(rx, f);

        if (!preview) {
            Saver.opened();
            try {
                // undims the screen if the dim got there first
                ((PowerManager) getSystemService(POWER_SERVICE)).userActivity(SystemClock.uptimeMillis(), false);
            } catch (Throwable t) {
            }
            armOff();
        }
    }

    @Override
    protected void onStop() {
        super.onStop();
        finish();
    }

    @Override
    protected void onDestroy() {
        ui.removeCallbacks(sleep);
        ui.removeCallbacks(fade);
        try {
            if (tip != null && tip.isShowing()) tip.dismiss();
        } catch (Throwable t) {
        }
        try {
            unregisterReceiver(rx);
        } catch (Throwable t) {
        }
        if (!preview) Saver.closed();
        super.onDestroy();
    }

    @Override
    public boolean dispatchKeyEvent(KeyEvent e) {
        int code = e.getKeyCode();
        if (e.getAction() == KeyEvent.ACTION_DOWN) {
            if (preview) Tone.key(e);
            if (e.getRepeatCount() == 0) down = code;
            if (preview) {
                KeyMap k = KeyMap.INSTANCE;
                if (code == k.getKEY_UP() || code == k.getKEY_DOWN()) {
                    change(code == k.getKEY_DOWN() ? 1 : -1);
                } else if (e.getRepeatCount() == 0 && (code == k.getKEY_LEFT() || code == k.getKEY_RIGHT())) {
                    cat = (cat + (code == k.getKEY_RIGHT() ? 1 : -1) + CATS.length) % CATS.length;
                    bands();
                }
            }
            return true;
        }
        if (e.getAction() == KeyEvent.ACTION_UP && code == down) {
            down = -1;
            if (!preview || code == KeyMap.INSTANCE.getKEY_MENU()) finish();
        }
        return true;
    }

    // ---- preview ----------------------------------------------------------------------------

    private TextView band(FrameLayout root, int gravity) {
        TextView t = new TextView(this);
        t.setGravity(Gravity.CENTER);
        t.setTextColor(LIGHT);
        t.setTypeface(Typeface.MONOSPACE, Typeface.BOLD);
        fit(t, 22, "Hg", 0, 28);
        t.setBackgroundColor(0xB3000000);
        FrameLayout.LayoutParams bl = new FrameLayout.LayoutParams(-1, 44);
        bl.gravity = gravity;
        root.addView(t, bl);
        return t;
    }

    private int current(int c) {
        if (c == 0) return style;
        int v = Prefs.val(this, CATS[c]);
        return v < 0 || v >= COUNTS[c] ? 0 : v;
    }

    /** One wheel step in the current category: written at once and shown at once. */
    private void change(int step) {
        String key = CATS[cat];
        int n = COUNTS[cat];
        int v;
        if (Saver.KEY_BRIGHT.equals(key)) {
            // 5 % steps from 0 to 100, landing on a multiple of 5 from any stored value; no wrap,
            // which would throw the screen from 100 % to 0 %
            int pct = Saver.BRIGHTS[current(cat)];
            pct = step > 0 ? (pct / BRIGHT_STEP + 1) * BRIGHT_STEP
                    : ((pct + BRIGHT_STEP - 1) / BRIGHT_STEP - 1) * BRIGHT_STEP;
            pct = Math.max(Saver.BRIGHTS[0], Math.min(Saver.BRIGHTS[n - 1], pct));
            v = pct - Saver.BRIGHTS[0];
        } else {
            v = (current(cat) + step + n) % n;
        }
        Prefs.setInt(this, key, v);
        if (Saver.KEY_STYLE.equals(key)) {
            style = v;
        } else if (Saver.KEY_BRIGHT.equals(key)) {
            target = com.innioasis.ipp.Backlight.window(Saver.BRIGHTS[v]);
            brightness(target);
        } else if (Saver.KEY_BG.equals(key) || Saver.KEY_TINT.equals(key)) {
            paintBack();
        }
        if (!Saver.KEY_BRIGHT.equals(key)) layout();
        bands();
    }

    private void bands() {
        if (head == null) return;
        String key = CATS[cat];
        com.innioasis.ipp.Help.Row r = com.innioasis.ipp.Help.row(this, key);
        String name = r != null && r.label != null ? r.label : key;
        head.setText("‹  " + name + "  ›");
        int v = current(cat);
        String val;
        if (Saver.KEY_BRIGHT.equals(key)) val = Saver.BRIGHTS[v] + "%";
        else if (r != null && r.values != null && v < r.values.length) val = r.values[v];
        else val = String.valueOf(v + 1);
        band.setText(val);
    }

    private void paintBack() {
        back.removeAllViews();
        background(back);
        tint(back);
    }

    // ---- drawing ----------------------------------------------------------------------------

    private void background(FrameLayout root) {
        int bg = Prefs.val(this, Saver.KEY_BG);
        if (bg == Saver.BG_LIGHT) {
            root.setBackgroundColor(LIGHT);
            return;
        }
        root.setBackgroundColor(0xFF000000);
        if (bg != Saver.BG_WALLPAPER) return;
        ImageView wall = new ImageView(this);
        wall.setScaleType(ImageView.ScaleType.CENTER_CROP);
        root.addView(wall, new FrameLayout.LayoutParams(-1, -1));
        String path = Prefs.getString(this, Saver.KEY_IMAGE, null);
        Bitmap known = path == null ? null : Saver.wall(this);
        if (known != null) {
            wall.setImageBitmap(known);
        } else if (path != null) {
            new Thread(new LoadWall(this, wall, path), "ipp-saver-wall").start();
        } else {
            Bitmap g = WallpaperUtils.INSTANCE.getGlobalBitmap();
            if (g != null) wall.setImageBitmap(g);
        }
    }

    /** Over the background and under everything else, as on the USB screen. */
    private void tint(FrameLayout root) {
        int v = Prefs.val(this, Saver.KEY_TINT);
        int c;
        if (v == Saver.TINT_LIGHT) c = 0x80FFFFFF;
        else if (v == Saver.TINT_DARK) c = 0x80000000;
        else if (v == Saver.TINT_THEME) c = (menuBackground() & 0x00FFFFFF) | 0x80000000;
        else return;
        View veil = new View(this);
        veil.setBackgroundColor(c);
        root.addView(veil, new FrameLayout.LayoutParams(-1, -1));
    }

    private static int menuBackground() {
        try {
            Integer c = ThemeManager.INSTANCE.menuBGColor();
            if (c != null) return c.intValue();
        } catch (Throwable t) {
        }
        return MENU_BG;
    }

    private boolean onPicture() {
        return Prefs.val(this, Saver.KEY_BG) == Saver.BG_WALLPAPER;
    }

    private int color(String key) {
        int v = Prefs.val(this, key);
        if (v == Saver.COLOR_DARK) return DARK;
        if (v == Saver.COLOR_THEME) {
            int c = Icons.progressColor();
            if (c == 0) c = Icons.themeColor();
            if (c != 0) return c | 0xFF000000;
        }
        return LIGHT;
    }

    private TextView text(int color, boolean bold) {
        TextView t = new TextView(this);
        t.setTextColor(color);
        t.setTypeface(Typeface.MONOSPACE, bold ? Typeface.BOLD : Typeface.NORMAL);
        t.setIncludeFontPadding(false);
        if (onPicture()) {
            // readable over any picture: a shadow of the opposite brightness
            boolean light = (Math.max(Math.max((color >> 16) & 0xFF, (color >> 8) & 0xFF), color & 0xFF)) > 0x80;
            t.setShadowLayer(4, 0, 1, light ? 0xB3000000 : 0xB3FFFFFF);
        }
        return t;
    }

    /**
     * Theme fonts run far larger than the stock one at the same size: from {@code px} down until
     * {@code sample} is no wider than {@code maxW} (0: any) and a line no taller than {@code maxH}.
     */
    private static void fit(TextView t, float px, String sample, int maxW, int maxH) {
        TextPaint p = new TextPaint(t.getPaint());
        float s = px;
        for (; s > 8; s -= 1) {
            p.setTextSize(s);
            Paint.FontMetrics fm = p.getFontMetrics();
            if ((maxW <= 0 || p.measureText(sample) <= maxW) && fm.descent - fm.ascent <= maxH) break;
        }
        t.setTextSize(TypedValue.COMPLEX_UNIT_PX, s);
    }

    private static int gravityOf(int side) {
        return side == 0 ? Gravity.LEFT : side == 2 ? Gravity.RIGHT : Gravity.CENTER_HORIZONTAL;
    }

    /** Builds the current preset. Also the preview's step: cheap, a handful of views. */
    private void layout() {
        content.removeAllViews();
        clock = null;
        date = null;
        cover = null;
        coverPath = null;
        int kind = Saver.kind(style);
        int side = Saver.side(style);
        Song s = kind == Saver.SONG ? playing() : null;
        if (s != null) {
            song(s, side);
        } else {
            clockBlock(side, kind == Saver.DATE);
        }
    }

    private void clockBlock(int side, boolean withDate) {
        dateOver = side == 1 ? DATE_OVER : 0;
        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setGravity(gravityOf(side));
        clock = text(color(Saver.KEY_CLOCK), true);
        fit(clock, 110, "00:00", 320, 116);
        box.addView(clock, new LinearLayout.LayoutParams(-2, -2));
        if (withDate) {
            date = text(color(Saver.KEY_TEXT), false);
            fit(date, 24, "Hg", 0, 30);
            date.setGravity(gravityOf(side));
            LinearLayout.LayoutParams dl = new LinearLayout.LayoutParams(-2, -2);
            dl.topMargin = 8;
            box.addView(date, dl);
        }
        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(-2, -2);
        lp.gravity = Gravity.CENTER_VERTICAL | gravityOf(side);
        lp.leftMargin = MARGIN;
        lp.rightMargin = MARGIN;
        content.addView(box, lp);
        tick();
    }

    private void tick() {
        if (clock == null) return;
        Date now = new Date();
        boolean h24 = DateFormat.is24HourFormat(this);
        String time = DateFormat.format(h24 ? "kk:mm" : "h:mm", now).toString();
        clock.setText(time);
        if (date == null) return;
        Locale loc = getResources().getConfiguration().locale;
        String day = DateFormat.format("EEEE", now).toString();
        if (day.length() > 0) day = day.substring(0, 1).toUpperCase(loc) + day.substring(1);
        String full = java.text.DateFormat.getDateInstance(java.text.DateFormat.LONG, loc).format(now);
        // the date is never wider than the clock above it: the full date goes under the day
        int w = (int) Math.ceil(clock.getPaint().measureText(time)) + dateOver;
        String one = day + ", " + full;
        date.setMaxWidth(w);
        date.setText(date.getPaint().measureText(one) <= w ? one : day + "\n" + full);
    }

    private static Song playing() {
        try {
            PlayerService ps = Y1Application.Companion.getPlayerService();
            return ps == null ? null : ps.getPlayingSong();
        } catch (Throwable t) {
            return null;
        }
    }

    private TextView line(String s, int color, boolean bold, float px, int maxH) {
        TextView t = text(color, bold);
        fit(t, px, "Hg", 0, maxH);
        t.setMaxLines(LINES);
        t.setEllipsize(TextUtils.TruncateAt.END);
        t.setText(s);
        return t;
    }

    private void song(Song s, int side) {
        int textColor = color(Saver.KEY_TEXT);
        TextView title = line(Ipp.songTitle(this, s.getSongName(), s.getName()), textColor, true, 28, 34);
        String a = s.getArtist();
        try {
            a = Feat.artist(a, s);
        } catch (Throwable t) {
        }
        TextView artist = line(Other.INSTANCE.unNamed(a == null ? "" : a), textColor, false, 22, 28);
        String al = Albums.realName(s.getAlbum());
        TextView album = line(Other.INSTANCE.unNamed(al == null ? "" : al), textColor, false, 20, 26);

        cover = new ImageView(this);
        cover.setScaleType(ImageView.ScaleType.CENTER_CROP);
        coverPath = s.getPath();
        Bitmap known = coverPath.equals(lastPath) ? lastCover : null;
        if (known == null) {
            try {
                known = BigCover.peekTrack(coverPath);
            } catch (Throwable t) {
            }
        }
        if (known != null) {
            cover.setImageBitmap(known);
            lastPath = coverPath;
            lastCover = known;
        } else {
            Bitmap blank = blank();
            if (blank != null) cover.setImageBitmap(blank);
            new Thread(new LoadCover(this, coverPath), "ipp-saver-cover").start();
        }

        if (side == 1) {
            LinearLayout box = new LinearLayout(this);
            box.setOrientation(LinearLayout.VERTICAL);
            box.setGravity(Gravity.CENTER_HORIZONTAL);
            int c = centerCover(title, artist, album);
            box.addView(cover, new LinearLayout.LayoutParams(c, c));
            addLine(box, title, Gravity.CENTER_HORIZONTAL, 14);
            addLine(box, artist, Gravity.CENTER_HORIZONTAL, 6);
            addLine(box, album, Gravity.CENTER_HORIZONTAL, 4);
            FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(-1, -2);
            lp.gravity = Gravity.CENTER_VERTICAL;
            lp.leftMargin = MARGIN;
            lp.rightMargin = MARGIN;
            content.addView(box, lp);
            return;
        }
        boolean left = side == 0;
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout lines = new LinearLayout(this);
        lines.setOrientation(LinearLayout.VERTICAL);
        int g = left ? Gravity.LEFT : Gravity.RIGHT;
        addLine(lines, title, g, 0);
        addLine(lines, artist, g, 8);
        addLine(lines, album, g, 6);
        LinearLayout.LayoutParams cl = new LinearLayout.LayoutParams(COVER, COVER);
        LinearLayout.LayoutParams ll = new LinearLayout.LayoutParams(0, -2, 1f);
        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(-1, -2);
        lp.gravity = Gravity.CENTER_VERTICAL;
        // the text runs on almost to the screen's edge; the cover keeps the margin
        if (left) {
            ll.leftMargin = 20;
            row.addView(cover, cl);
            row.addView(lines, ll);
            lp.leftMargin = MARGIN;
            lp.rightMargin = TEXT_EDGE;
        } else {
            ll.rightMargin = 20;
            row.addView(lines, ll);
            row.addView(cover, cl);
            lp.leftMargin = TEXT_EDGE;
            lp.rightMargin = MARGIN;
        }
        content.addView(row, lp);
    }

    private Bitmap blankPic;

    /**
     * The player's placeholder as a plain square. {@link Cover#blankCover} carries the player's
     * frame and reflection, half again as tall, and a square crop cuts through it. Kept while
     * this screen lives, not by the process; ARGB_8888, since RGB_565 bands its gradient.
     */
    private Bitmap blank() {
        Bitmap b = blankPic;
        if (b != null && !b.isRecycled()) return b;
        try {
            BitmapFactory.Options o = new BitmapFactory.Options();
            o.inScaled = false;            Bitmap src = BitmapFactory.decodeResource(Y1Application.Companion.getAppContext().getResources(),
                    com.innioasis.y1.R.drawable.bg_player_cover_view, o);
            if (src == null) return null;
            int w = src.getWidth();
            int h = src.getHeight();
            int side = w <= h ? w : h;
            b = side == w && side == h ? src : Bitmap.createBitmap(src, (w - side) / 2, (h - side) / 2, side, side);
            blankPic = b;
            return b;
        } catch (Throwable t) {
            return null;
        }
    }

    /** The cover under which all three lines still fit the screen, wrapped as they will be. */
    private int centerCover(TextView title, TextView artist, TextView album) {
        int width = getResources().getDisplayMetrics().widthPixels - 2 * MARGIN;
        int height = getResources().getDisplayMetrics().heightPixels;
        int text = tall(title, width) + tall(artist, width) + tall(album, width) + 14 + 6 + 4;
        return Math.max(80, Math.min(COVER_CENTER, height - 24 - text));
    }

    private static int tall(TextView t, int width) {
        CharSequence s = t.getText();
        android.text.StaticLayout l = new android.text.StaticLayout(s == null ? "" : s, t.getPaint(), width,
                android.text.Layout.Alignment.ALIGN_NORMAL, 1f, 0f, false);
        Paint.FontMetricsInt fm = t.getPaint().getFontMetricsInt();
        return Math.min(LINES, Math.max(1, l.getLineCount())) * (fm.descent - fm.ascent);
    }

    private static void addLine(LinearLayout box, TextView t, int gravity, int top) {
        t.setGravity(gravity);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-1, -2);
        lp.topMargin = top;
        box.addView(t, lp);
    }

    private void songChanged() {
        if (Saver.kind(style) != Saver.SONG) return;
        Song s = playing();
        String path = s == null ? null : s.getPath();
        if (path != null && path.equals(coverPath)) return;
        layout();
    }

    // ---- brightness -------------------------------------------------------------------------

    private float systemBrightness() {
        try {
            int v = android.provider.Settings.System.getInt(getContentResolver(),
                    android.provider.Settings.System.SCREEN_BRIGHTNESS);
            return Math.max(0.01f, Math.min(1f, v / 255f));
        } catch (Throwable t) {
            return target;
        }
    }

    private void brightness(float v) {
        WindowManager.LayoutParams lp = getWindow().getAttributes();
        lp.screenBrightness = v;
        getWindow().setAttributes(lp);
    }

    private void fadeStep() {
        step++;
        float k = Math.min(1f, step / (float) FADE_STEPS);
        brightness(from + (target - from) * k);
        if (step < FADE_STEPS) ui.postDelayed(fade, FADE_STEP_MS);
    }

    static final class Fade implements Runnable {
        private final IppSaverActivity a;

        Fade(IppSaverActivity a) {
            this.a = a;
        }

        @Override
        public void run() {
            if (!a.isFinishing()) a.fadeStep();
        }
    }

    // ---- turning the screen off -------------------------------------------------------------

    private void armOff() {
        ui.removeCallbacks(sleep);
        if (preview) return;
        int i = Prefs.val(this, Saver.KEY_OFF);
        if (i < 0 || i >= Saver.OFF_MS.length) i = Saver.OFF_DEFAULT;
        int ms = Saver.OFF_MS[i];
        if (ms == 0) return;
        if (Prefs.on(this, Saver.KEY_CHARGING) && charging()) return;
        ui.postDelayed(sleep, ms);
    }

    private boolean charging() {
        try {
            Intent b = registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            return b != null && b.getIntExtra(BatteryManager.EXTRA_PLUGGED, 0) != 0;
        } catch (Throwable t) {
            return false;
        }
    }

    private void goToSleep() {
        try {
            ((PowerManager) getSystemService(POWER_SERVICE)).goToSleep(SystemClock.uptimeMillis());
        } catch (Throwable t) {
            // the system's own timeout then does it
            getWindow().clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        }
    }

    static final class Sleep implements Runnable {
        private final IppSaverActivity a;

        Sleep(IppSaverActivity a) {
            this.a = a;
        }

        @Override
        public void run() {
            a.goToSleep();
        }
    }

    static final class Rx extends BroadcastReceiver {
        private final IppSaverActivity a;

        Rx(IppSaverActivity a) {
            this.a = a;
        }

        @Override
        public void onReceive(Context c, Intent i) {
            String act = i == null ? null : i.getAction();
            if (act == null) return;
            if (Intent.ACTION_SCREEN_OFF.equals(act)) {
                a.finish();
            } else if (Intent.ACTION_POWER_CONNECTED.equals(act) || Intent.ACTION_POWER_DISCONNECTED.equals(act)) {
                // the plug changes slightly before EXTRA_PLUGGED does
                a.ui.postDelayed(new Rearm(a), 1500);
            } else if ("android.intent.action.MY_PLAY_SONG".equals(act)) {
                a.songChanged();
            } else {
                a.tick();
            }
        }
    }

    static final class Rearm implements Runnable {
        private final IppSaverActivity a;

        Rearm(IppSaverActivity a) {
            this.a = a;
        }

        @Override
        public void run() {
            if (!a.isFinishing()) a.armOff();
        }
    }

    static final class LoadCover implements Runnable {
        private final IppSaverActivity a;
        private final String path;

        LoadCover(IppSaverActivity a, String path) {
            this.a = a;
            this.path = path;
        }

        @Override
        public void run() {
            Bitmap b = null;
            try {
                b = BigCover.track(path);
            } catch (Throwable t) {
            }
            if (b != null) a.ui.post(new ShowCover(a, path, b));
        }
    }

    static final class ShowCover implements Runnable {
        private final IppSaverActivity a;
        private final String path;
        private final Bitmap b;

        ShowCover(IppSaverActivity a, String path, Bitmap b) {
            this.a = a;
            this.path = path;
            this.b = b;
        }

        @Override
        public void run() {
            a.lastPath = path;
            a.lastCover = b;
            if (a.cover != null && path.equals(a.coverPath)) a.cover.setImageBitmap(b);
        }
    }

    static final class LoadWall implements Runnable {
        private final IppSaverActivity a;
        private final ImageView v;
        private final String path;

        LoadWall(IppSaverActivity a, ImageView v, String path) {
            this.a = a;
            this.v = v;
            this.path = path;
        }

        @Override
        public void run() {
            Bitmap b = Saver.loadWall(a, path);
            if (b == null) b = WallpaperUtils.INSTANCE.getGlobalBitmap();
            if (b != null) a.ui.post(new ShowWall(v, b));
        }
    }

    static final class ShowWall implements Runnable {
        private final ImageView v;
        private final Bitmap b;

        ShowWall(ImageView v, Bitmap b) {
            this.v = v;
            this.b = b;
        }

        @Override
        public void run() {
            v.setImageBitmap(b);
        }
    }
}
