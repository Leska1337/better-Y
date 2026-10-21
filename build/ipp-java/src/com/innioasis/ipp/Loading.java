package com.innioasis.ipp;

import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorMatrix;
import android.graphics.ColorMatrixColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.Gravity;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.Window;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;

import androidx.constraintlayout.widget.ConstraintLayout;

import com.innioasis.y1.R;
import com.innioasis.y1.theme.ThemeManager;
import com.innioasis.y1.utils.LoadingDialog;

import java.lang.ref.WeakReference;

/**
 * The progress windows in the theme's dialog colours: {@code LoadingDialog} and the platform
 * {@code ProgressDialog} ({@link #progress}), both turning the same {@link Spin}. The ring is tinted
 * only when the theme names a text colour, and never with a flat filter: {@code loading.png} fades
 * navy to white at FULL alpha, so SRC_IN fills the ring and the rotation vanishes; {@link #fade}
 * turns darkness into alpha instead.
 */
public final class Loading {

    private Loading() { }

    /** {@code @drawable/loading_dialog}. */
    private static final int BOX = 0xFFFFFFFF;
    private static final int RADIUS_DIP = 10;

    /** {@code dialog_loading.xml}. */
    private static final int TEXT = 0xFF102162;

    /** Alpha 0, never a real theme colour: the answer means "the theme names none". */
    private static final int PROBE = 0x00FEEDBE;

    /** Fade only, no scale — see {@link Spin}. */
    private static final int FADE_STYLE = R.style.ipp_Fade;

    /** From {@code LoadingDialog.onCreate}, right after {@code setContentView}. */
    public static void paint(Dialog d, View root) {
        if (root == null) return;
        try {
            ThemeManager tm = ThemeManager.INSTANCE;
            GradientDrawable box = new GradientDrawable();
            box.setColor(tm.dialogBGColor(BOX));
            box.setCornerRadius(RADIUS_DIP * root.getResources().getDisplayMetrics().density);
            root.setBackgroundDrawable(box);

            int themed = tm.dialogTextColor(PROBE);
            int text = themed == PROBE ? TEXT : themed;
            text(root, R.id.content, text);
            text(root, R.id.tip, text);
            View img = root.findViewById(R.id.loading_img);
            if (spin(img, themed, 0)) {
                Window w = d == null ? null : d.getWindow();
                if (w != null) w.setWindowAnimations(FADE_STYLE);
            } else if (themed != PROBE && img instanceof ImageView) {
                ((ImageView) img).setColorFilter(fade(themed));
            }
            View c = root.findViewById(R.id.content);
            if (c instanceof TextView) steady((TextView) c);
        } catch (Throwable t) {
        }
    }

    // ---- progress text ----------------------------------------------------------------------

    /** The progress line over the title. */
    public static String percent(String title, int pct) {
        return pct + "%\n" + title;
    }

    /** Re-text a showing window, its width held. */
    public static void show(LoadingDialog d, String text) {
        if (d == null) return;
        try {
            d.show(text);
            View v = d.findViewById(R.id.content);
            if (v instanceof TextView) steady((TextView) v);
        } catch (Throwable t) {
        }
    }

    /** The screen stays on while a long pass shows its window; the flag goes with the window. */
    public static void awake(Dialog d) {
        try {
            Window w = d == null ? null : d.getWindow();
            if (w != null) w.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        } catch (Throwable t) {
        }
    }

    /**
     * A text whose first line is the progress: the width is fixed at its widest form ("100%", or the
     * count, which only grows), so the window does not jump with each digit. Only ever widened.
     */
    private static void steady(TextView tv) {
        CharSequence cs = tv.getText();
        if (cs == null) return;
        String s = cs.toString();
        int nl = s.indexOf('\n');
        String head = nl < 0 ? s : s.substring(0, nl);
        if (head.length() == 0 || !Character.isDigit(head.charAt(0))) return;
        Paint p = tv.getPaint();
        float w = Math.max(p.measureText(head), p.measureText(FULL));
        int from = nl + 1;
        while (nl >= 0 && from <= s.length()) {
            int end = s.indexOf('\n', from);
            String line = end < 0 ? s.substring(from) : s.substring(from, end);
            w = Math.max(w, p.measureText(line));
            if (end < 0) break;
            from = end + 1;
        }
        int px = (int) Math.ceil(w) + tv.getPaddingLeft() + tv.getPaddingRight();
        int max = tv.getResources().getDisplayMetrics().widthPixels * 9 / 10;
        if (px > max) px = max;
        Object had = tv.getTag(R.id.content);
        if (had instanceof Integer && px <= ((Integer) had).intValue()) return;
        tv.setTag(R.id.content, Integer.valueOf(px));
        tv.setWidth(px);
    }

    private static final String FULL = "100%";

    // ---- the stock scan's window ------------------------------------------------------------

    private static volatile WeakReference scanDialog;
    private static String scanTitle;

    /** In place of the stock scan window's {@code show()}: kept awake and given the progress line. */
    public static void scan(LoadingDialog d) {
        if (d == null) return;
        awake(d);
        d.show();
        try {
            scanTitle = d.getContext().getString(R.string.scanning_files);
            scanDialog = new WeakReference(d);
            show(d, percent(scanTitle, 0));
        } catch (Throwable t) {
        }
    }

    /** From the scan's thread: {@code seen} music files met, of {@code known} in the table before. */
    static void scanned(int seen, int known) {
        WeakReference r = scanDialog;
        LoadingDialog d = r == null ? null : (LoadingDialog) r.get();
        if (d == null) return;
        String line = known > 0 ? percent(scanTitle, Math.min(99, seen * 100 / known))
                : seen + "\n" + scanTitle;
        MAIN.post(new ScanText(d, line));
    }

    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private static final class ScanText implements Runnable {
        private final LoadingDialog d;
        private final String text;

        ScanText(LoadingDialog d, String text) {
            this.d = d;
            this.text = text;
        }

        public void run() {
            if (!d.isShowing()) return;
            show(d, text);
        }
    }

    /** Alpha per unit of darkness: without the gain the ring's head stops at 87%. */
    private static final float FADE = 1.15f;

    /** The rule under a dialog's title is a bare View this thin; nothing else here is. */
    private static final int RULE_MAX_DIP = 4;

    /**
     * The platform {@code ProgressDialog}: title centred, message dropped (it repeated the title),
     * our ring. Parts are found by walking the window — its ids are internal.
     */
    public static void progress(ProgressDialog d) {
        if (d == null) return;
        try {
            d.setMessage("");
            Window w = d.getWindow();
            View decor = w == null ? null : w.getDecorView();
            if (decor == null) return;

            ThemeManager tm = ThemeManager.INSTANCE;
            int bg = tm.dialogBGColor(PROBE);
            boolean boxed = bg != PROBE;
            float density = decor.getResources().getDisplayMetrics().density;
            if (boxed) {
                // The padding lives in the nine-patch being replaced: carried over.
                Rect pad = new Rect();
                Drawable had = decor.getBackground();
                if (had != null) had.getPadding(pad);
                GradientDrawable box = new GradientDrawable();
                box.setColor(bg);
                box.setCornerRadius(RADIUS_DIP * density);
                w.setBackgroundDrawable(box);
                decor.setPadding(pad.left, pad.top, pad.right, pad.bottom);
            }
            // From the CHILDREN: the walk clears backgrounds, and the decor's is the new box.
            int fg = tm.dialogTextColor(PROBE);
            int rule = (int) (RULE_MAX_DIP * density);
            if (decor instanceof ViewGroup) {
                ViewGroup g = (ViewGroup) decor;
                for (int i = 0; i < g.getChildCount(); i++) dress(g.getChildAt(i), fg, rule, boxed);
            } else {
                dress(decor, fg, rule, boxed);
            }
            // Before the window's first draw, which is when its enter animation is chosen.
            if (holdsSpin(decor)) w.setWindowAnimations(FADE_STYLE);
        } catch (Throwable t) {
        }
    }

    /**
     * Photos' progress window, made invisible but kept up: it holds the keys during the load,
     * and a second load over the first lands the wrong folder's list.
     */
    public static void hidden(ProgressDialog d) {
        if (d == null) return;
        try {
            Window w = d.getWindow();
            if (w == null) return;
            // Before the first draw, when the enter animation is chosen.
            w.setWindowAnimations(0);
            w.clearFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            w.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            View decor = w.getDecorView();
            if (decor instanceof ViewGroup) {
                ViewGroup g = (ViewGroup) decor;
                for (int i = 0; i < g.getChildCount(); i++) g.getChildAt(i).setVisibility(View.INVISIBLE);
            }
        } catch (Throwable t) {
        }
    }

    private static void dress(View v, int color, int ruleMax, boolean boxed) {
        boolean themed = color != PROBE;
        if (v instanceof TextView) {
            TextView tv = (TextView) v;
            CharSequence s = tv.getText();
            if (s == null || s.length() == 0) {
                tv.setVisibility(View.GONE);
                return;
            }
            tv.setGravity(Gravity.CENTER);
            if (themed) tv.setTextColor(color);
            return;
        }
        if (v instanceof ProgressBar) {
            // With the message gone the circle must be centred explicitly.
            if (!spin(v, color, (int) (PLATFORM_DIP * v.getResources().getDisplayMetrics().density))) {
                centre(v);
            }
            return;
        }
        if (v instanceof ViewGroup) {
            // Each panel carries its own white nine-patch inside the box; its padding survives.
            if (boxed) v.setBackgroundDrawable(null);
            ViewGroup g = (ViewGroup) v;
            for (int i = 0; i < g.getChildCount(); i++) dress(g.getChildAt(i), color, ruleMax, boxed);
            return;
        }
        if (themed) {
            // The rule under the title. Height from the params: nothing is measured yet.
            ViewGroup.LayoutParams lp = v.getLayoutParams();
            if (lp != null && lp.height > 0 && lp.height <= ruleMax) v.setBackgroundColor(color);
        }
    }

    /** {@code Widget.ProgressBar}'s size. */
    private static final int PLATFORM_DIP = 48;

    /**
     * A {@link Spin} in place of {@code stand}. The ImageView of {@code dialog_loading.xml} stays,
     * INVISIBLE: {@code LoadingDialog.onStart} casts it by id.
     */
    private static boolean spin(View stand, int color, int sidePx) {
        ViewParent vp = stand == null ? null : stand.getParent();
        if (!(vp instanceof ViewGroup)) return false;
        ViewGroup parent = (ViewGroup) vp;
        try {
            ViewGroup.LayoutParams lp = stand.getLayoutParams();
            ViewGroup.LayoutParams own;
            int hide;
            if (lp instanceof ConstraintLayout.LayoutParams) {
                own = Pad.copy((ConstraintLayout.LayoutParams) lp);
                hide = View.INVISIBLE;
            } else if (parent instanceof LinearLayout && sidePx > 0) {
                LinearLayout.LayoutParams ll = new LinearLayout.LayoutParams(sidePx, sidePx);
                ll.gravity = Gravity.CENTER;
                ((LinearLayout) parent).setGravity(Gravity.CENTER);
                own = ll;
                hide = View.GONE;
            } else {
                return false;
            }
            Spin s = new Spin(stand.getContext(), color);
            s.setId(View.generateViewId());
            parent.addView(s, parent.indexOfChild(stand) + 1, own);
            stand.setVisibility(hide);
            // INVISIBLE is still drawn under a view animation, and onStart starts one.
            if (stand instanceof ImageView) ((ImageView) stand).setImageDrawable(null);
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    private static boolean holdsSpin(View v) {
        if (v instanceof Spin) return true;
        if (!(v instanceof ViewGroup)) return false;
        ViewGroup g = (ViewGroup) v;
        for (int i = 0; i < g.getChildCount(); i++) {
            if (holdsSpin(g.getChildAt(i))) return true;
        }
        return false;
    }

    /**
     * The ring, turned by its own thread in its own surface: progress windows go up exactly while
     * the main thread is busy, and a ring it animated stood still. The angle is from the clock, so
     * a GC pause is a skip. The thread is joined when the surface goes — drawing into a destroyed
     * one crashes. The surface is a child window that a window's SCALE animation misplaces, so its
     * window only fades ({@link #FADE_STYLE}); do not bring the scale back.
     */
    public static final class Spin extends SurfaceView implements SurfaceHolder.Callback, Runnable {

        /** One clockwise turn, the same as {@code @anim/loading}. */
        private static final long TURN_MS = 800;
        private static final long FRAME_MS = 20;

        private static Bitmap ring;

        private final Paint paint = new Paint(Paint.FILTER_BITMAP_FLAG | Paint.ANTI_ALIAS_FLAG);
        private final RectF box = new RectF();
        private volatile boolean running;
        private Thread thread;

        public Spin(Context c, int color) {
            super(c);
            if (color != PROBE) paint.setColorFilter(fade(color));
            setZOrderOnTop(true);
            getHolder().setFormat(PixelFormat.TRANSLUCENT);
            getHolder().addCallback(this);
        }

        public void surfaceCreated(SurfaceHolder h) {
            halt();
            running = true;
            thread = new Thread(this, "ipp-spin");
            thread.start();
        }

        public void surfaceChanged(SurfaceHolder h, int format, int w, int hh) {
        }

        public void surfaceDestroyed(SurfaceHolder h) {
            halt();
        }

        protected void onDetachedFromWindow() {
            halt();
            super.onDetachedFromWindow();
        }

        private void halt() {
            running = false;
            Thread t = thread;
            thread = null;
            if (t == null) return;
            t.interrupt();
            try {
                t.join(500);
            } catch (InterruptedException e) {
            }
        }

        public void run() {
            Bitmap b = ring(getResources());
            SurfaceHolder h = getHolder();
            long start = SystemClock.uptimeMillis();
            while (running) {
                frame(h, b, 360f * ((SystemClock.uptimeMillis() - start) % TURN_MS) / TURN_MS);
                try {
                    Thread.sleep(FRAME_MS);
                } catch (InterruptedException e) {
                    return;
                }
            }
        }

        private void frame(SurfaceHolder h, Bitmap b, float degrees) {
            Canvas c = null;
            try {
                c = h.lockCanvas();
                if (c == null) return;
                c.drawColor(0, PorterDuff.Mode.CLEAR);
                if (b == null) return;
                float w = c.getWidth();
                float hh = c.getHeight();
                float side = Math.min(w, hh);
                box.set((w - side) / 2, (hh - side) / 2, (w + side) / 2, (hh + side) / 2);
                c.save();
                c.rotate(degrees, w / 2, hh / 2);
                c.drawBitmap(b, null, box, paint);
                c.restore();
            } catch (Throwable t) {
                running = false;
            } finally {
                if (c != null) {
                    try {
                        h.unlockCanvasAndPost(c);
                    } catch (Throwable t) {
                        running = false;
                    }
                }
            }
        }

        private static synchronized Bitmap ring(Resources r) {
            if (ring == null) {
                BitmapFactory.Options o = new BitmapFactory.Options();
                o.inScaled = false;
                ring = BitmapFactory.decodeResource(r, R.drawable.loading, o);
            }
            return ring;
        }
    }

    private static void centre(View v) {
        ViewGroup.LayoutParams lp = v.getLayoutParams();
        if (lp instanceof LinearLayout.LayoutParams) {
            ((LinearLayout.LayoutParams) lp).gravity = Gravity.CENTER;
        } else if (lp instanceof FrameLayout.LayoutParams) {
            ((FrameLayout.LayoutParams) lp).gravity = Gravity.CENTER;
        }
        ViewParent p = v.getParent();
        if (p instanceof LinearLayout) {
            ((LinearLayout) p).setGravity(Gravity.CENTER);
        } else if (p instanceof RelativeLayout) {
            ((RelativeLayout) p).setGravity(Gravity.CENTER);
        }
    }

    /** Colour: the tint. Alpha: the source's alpha minus its luminance, scaled by {@link #FADE}. */
    private static ColorMatrixColorFilter fade(int c) {
        float k = FADE;
        return new ColorMatrixColorFilter(new ColorMatrix(new float[] {
                0, 0, 0, 0, Color.red(c),
                0, 0, 0, 0, Color.green(c),
                0, 0, 0, 0, Color.blue(c),
                -0.299f * k, -0.587f * k, -0.114f * k, k, 0,
        }));
    }

    private static void text(View root, int id, int color) {
        View v = root.findViewById(id);
        if (v instanceof TextView) ((TextView) v).setTextColor(color);
    }
}
