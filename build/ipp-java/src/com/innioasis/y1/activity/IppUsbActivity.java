package com.innioasis.y1.activity;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.PorterDuff;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.innioasis.ipp.Force;
import com.innioasis.ipp.Icons;
import com.innioasis.y1.R;
import com.innioasis.y1.theme.ThemeManager;
import com.innioasis.y1.utils.WallpaperUtils;

import java.lang.reflect.Method;

/**
 * "USB connected", in place of the system's screen of the same name ({@link com.innioasis.ipp.Usb}
 * refuses that one's start and opens this). Same layout, same commands — the storage switch and
 * the two broadcasts stock's receiver listens for — painted from the theme: its font, the global
 * wallpaper under the context menu's colour at half opacity (30% for the stock colour), the menu's unselected text colour
 * for text and icon, and the button inverted from those two.
 *
 * Centre switches the storage; top leaves, but only while the storage is off — the card belongs to
 * the computer until then. Unplugging the cable closes the screen in either state.
 */
public final class IppUsbActivity extends Activity {

    private static final String USB_STATE = "android.hardware.usb.action.USB_STATE";
    private static final String PRE_UNMOUNT = "com.innioasis.y1.PRE_UNMOUNT_SDCARD";
    private static final String PRE_MOUNT = "com.innioasis.y1.PRE_MOUNT_SDCARD";

    /** The stock context menu's own background ({@code bg_submenu}), for a theme that sets none. */
    private static final int MENU_BG = 0xFF8C94B2;

    /** A switch that never reports back must not leave the screen spinning with no way out. */
    private static final int SWITCH_TIMEOUT_MS = 20000;

    private TextView banner;
    private TextView message;
    private TextView button;
    private ProgressBar progress;
    private Plug plug;
    private Media media;
    private Handler ui;
    private final Runnable giveUp = new GiveUp(this);

    private boolean shared;
    private boolean busy;
    private boolean target;
    private boolean cleanDown;

    @Override
    protected void onCreate(Bundle b) {
        super.onCreate(b);
        // Both, as BaseActivity does: without the flag the system status bar stays on top.
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN);
        ui = new Handler();
        build();
        plug = new Plug(this);
        Intent state = registerReceiver(plug, new IntentFilter(USB_STATE));
        if (state != null && !state.getBooleanExtra("connected", false)) {
            finish();
            return;
        }
        media = new Media(this);
        IntentFilter f = new IntentFilter(Intent.ACTION_MEDIA_SHARED);
        f.addAction("android.intent.action.MEDIA_UNSHARED");
        f.addAction(Intent.ACTION_MEDIA_MOUNTED);
        f.addAction(Intent.ACTION_MEDIA_UNMOUNTED);
        f.addDataScheme("file");
        registerReceiver(media, f);
        shared = storage("isUsbMassStorageEnabled");
        render();
    }

    @Override
    protected void onDestroy() {
        ui.removeCallbacks(giveUp);
        unregister(plug);
        unregister(media);
        super.onDestroy();
    }

    private void unregister(BroadcastReceiver r) {
        try {
            if (r != null) unregisterReceiver(r);
        } catch (Throwable t) {
            // not registered
        }
    }

    private void build() {
        int bg = menuBackground();
        int text = menuText();
        int opaqueBg = bg | 0xFF000000;

        FrameLayout root = new FrameLayout(this);
        ImageView wall = new ImageView(this);
        wall.setScaleType(ImageView.ScaleType.CENTER_CROP);
        Bitmap g = WallpaperUtils.INSTANCE.getGlobalBitmap();
        if (g != null) wall.setImageBitmap(g);
        root.addView(wall, new FrameLayout.LayoutParams(-1, -1));
        View veil = new View(this);
        // The stock menu colour is light enough that half of it washes the wallpaper out; it is
        // compared by value, so a theme that writes the same colour gets the same veil.
        int alpha = (bg & 0x00FFFFFF) == (MENU_BG & 0x00FFFFFF) ? 0x4D000000 : 0x80000000;
        veil.setBackgroundColor((bg & 0x00FFFFFF) | alpha);
        root.addView(veil, new FrameLayout.LayoutParams(-1, -1));

        RelativeLayout box = new RelativeLayout(this);
        root.addView(box, new FrameLayout.LayoutParams(-1, -1));

        TextView title = text(20, text);
        title.setId(1);
        title.setText(R.string.ipp_usb_title);
        title.setPadding(dp(6), 0, 0, 0);
        RelativeLayout.LayoutParams lp = new RelativeLayout.LayoutParams(-1, -2);
        lp.addRule(RelativeLayout.ALIGN_PARENT_TOP);
        box.addView(title, lp);

        ImageView icon = new ImageView(this);
        icon.setId(2);
        icon.setImageResource(R.mipmap.ipp_usb);
        Icons.menu(icon, text);
        lp = new RelativeLayout.LayoutParams(-2, -2);
        lp.addRule(RelativeLayout.BELOW, 1);
        lp.addRule(RelativeLayout.CENTER_HORIZONTAL);
        box.addView(icon, lp);

        banner = text(24, text);
        banner.setId(3);
        banner.setGravity(Gravity.CENTER);
        lp = new RelativeLayout.LayoutParams(-1, -2);
        lp.addRule(RelativeLayout.BELOW, 2);
        box.addView(banner, lp);

        message = text(16, text);
        message.setGravity(Gravity.CENTER);
        message.setPadding(dp(30), 0, dp(30), 0);
        lp = new RelativeLayout.LayoutParams(-1, -2);
        lp.addRule(RelativeLayout.BELOW, 3);
        lp.topMargin = dp(2);
        box.addView(message, lp);

        RelativeLayout bottom = new RelativeLayout(this);
        lp = new RelativeLayout.LayoutParams(-2, -2);
        lp.addRule(RelativeLayout.ALIGN_PARENT_BOTTOM);
        lp.addRule(RelativeLayout.CENTER_HORIZONTAL);
        lp.bottomMargin = dp(16);
        box.addView(bottom, lp);

        button = text(20, opaqueBg);
        button.setPadding(dp(18), dp(4), dp(18), dp(4));
        GradientDrawable pill = new GradientDrawable();
        pill.setColor(text);
        pill.setCornerRadius(dp(27));
        button.setBackgroundDrawable(pill);
        bottom.addView(button, new RelativeLayout.LayoutParams(-2, -2));

        progress = new ProgressBar(this);
        progress.setIndeterminate(true);
        Drawable spin = progress.getIndeterminateDrawable();
        if (spin != null) spin.setColorFilter(text, PorterDuff.Mode.SRC_IN);
        RelativeLayout.LayoutParams pp = new RelativeLayout.LayoutParams(-2, -2);
        pp.addRule(RelativeLayout.CENTER_IN_PARENT);
        bottom.addView(progress, pp);

        setContentView(root, new ViewGroup.LayoutParams(-1, -1));
    }

    private TextView text(int sp, int color) {
        TextView tv = new TextView(this);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        tv.setTextColor(color);
        tv.setTypeface(Typeface.MONOSPACE);      // the theme's font: ThemeManager puts it there
        return tv;
    }

    private void render() {
        banner.setText(shared ? R.string.ipp_usb_in_use : R.string.ipp_usb_connected);
        message.setText(shared ? R.string.ipp_usb_in_use_message : R.string.ipp_usb_message);
        button.setText(shared ? R.string.ipp_usb_off : R.string.ipp_usb_on);
        button.setVisibility(busy ? View.INVISIBLE : View.VISIBLE);
        progress.setVisibility(busy ? View.VISIBLE : View.GONE);
    }

    @Override
    public boolean dispatchKeyEvent(KeyEvent e) {
        if (Force.key(e)) return true;
        if (e.getAction() == KeyEvent.ACTION_DOWN) {
            cleanDown = e.getRepeatCount() == 0;       // a hold is not a press
            return true;
        }
        if (e.getAction() != KeyEvent.ACTION_UP || !cleanDown) return true;
        cleanDown = false;
        int k = e.getKeyCode();
        if (k == KeyEvent.KEYCODE_ENTER || k == KeyEvent.KEYCODE_DPAD_CENTER) {
            toggle();
        } else if (k == KeyEvent.KEYCODE_BACK && !shared && !busy) {
            finish();
        }
        return true;
    }

    private void toggle() {
        if (busy) return;
        busy = true;
        target = !shared;
        render();
        ui.postDelayed(giveUp, SWITCH_TIMEOUT_MS);
        Thread t = new Thread(new Switch(this, target), "ipp-usb-switch");
        t.setDaemon(true);
        t.start();
    }

    /**
     * The state is read, never assumed: the switch call returns before the card is actually
     * handed over, so the screen follows the storage broadcasts and waits for the state it asked for.
     */
    void settle() {
        shared = storage("isUsbMassStorageEnabled");
        if (busy && shared == target) {
            busy = false;
            ui.removeCallbacks(giveUp);
        }
        if (!isFinishing()) render();
    }

    void giveUp() {
        busy = false;
        settle();
    }

    /** The StorageManager's storage switch is hidden API; a no-argument method by name. */
    boolean storage(String name) {
        try {
            Object sm = getSystemService(Context.STORAGE_SERVICE);
            Method m = sm.getClass().getMethod(name);
            Object v = m.invoke(sm);
            return (v instanceof Boolean) && ((Boolean) v).booleanValue();
        } catch (Throwable t) {
            android.util.Log.e("ippUsb", name + " failed", t);
            return false;
        }
    }

    private int menuBackground() {
        try {
            Integer c = ThemeManager.INSTANCE.menuBGColor();
            if (c != null) return c.intValue();
        } catch (Throwable t) {
            // no theme
        }
        return MENU_BG;
    }

    /** Asked of the theme and read back: the setter answers with the theme's colour, not ours. */
    private int menuText() {
        try {
            TextView probe = new TextView(this);
            ThemeManager.INSTANCE.menuItemSetTextColor(probe, Color.WHITE, false);
            return probe.getCurrentTextColor();
        } catch (Throwable t) {
            return Color.WHITE;
        }
    }

    private int dp(int v) {
        return Math.round(v * getResources().getDisplayMetrics().density);
    }

    /**
     * The switch, off the main thread. The broadcast goes first, as stock's screen sends it — our
     * own receiver stops the player before the card is taken away.
     */
    static final class Switch implements Runnable {
        private final IppUsbActivity a;
        private final boolean on;

        Switch(IppUsbActivity a, boolean on) {
            this.a = a;
            this.on = on;
        }

        public void run() {
            try {
                a.sendBroadcast(new Intent(on ? PRE_UNMOUNT : PRE_MOUNT));
                a.storage(on ? "enableUsbMassStorage" : "disableUsbMassStorage");
            } catch (Throwable t) {
                android.util.Log.e("ippUsb", "switch failed", t);
            }
            a.ui.post(new Settle(a));
        }
    }

    static final class Settle implements Runnable {
        private final IppUsbActivity a;

        Settle(IppUsbActivity a) {
            this.a = a;
        }

        public void run() {
            a.settle();
        }
    }

    static final class GiveUp implements Runnable {
        private final IppUsbActivity a;

        GiveUp(IppUsbActivity a) {
            this.a = a;
        }

        public void run() {
            a.giveUp();
        }
    }

    /** Shared, unshared, mounted, unmounted: each is a moment to read the state again. */
    static final class Media extends BroadcastReceiver {
        private final IppUsbActivity a;

        Media(IppUsbActivity a) {
            this.a = a;
        }

        @Override
        public void onReceive(Context c, Intent i) {
            a.settle();
        }
    }

    /** The cable: out means the screen has nothing left to say. */
    static final class Plug extends BroadcastReceiver {
        private final IppUsbActivity a;

        Plug(IppUsbActivity a) {
            this.a = a;
        }

        @Override
        public void onReceive(Context c, Intent i) {
            if (i != null && !i.getBooleanExtra("connected", false)) a.finish();
        }
    }
}
