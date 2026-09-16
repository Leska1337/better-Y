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

/**
 * The progress window ({@code LoadingDialog}: Update library, Cache library, clearing the cache,
 * the backup) in the theme's dialog colours — the same {@code dialogBackgroundColor} /
 * {@code dialogTextColor} the Yes/No dialogs take. Its layout has them written in (a white box,
 * #102162 text), and those are also the fallbacks here, so with no theme nothing changes.
 *
 * The spinner is tinted only when the theme names a text colour: its own blue is part of the stock
 * look, and a tint the theme did not ask for would replace it for no reason. It must not be tinted
 * with a plain colour filter: {@code loading.png} fades from navy to white at FULL alpha, so a
 * flat SRC_IN/ATOP fills the whole ring and the rotation stops being visible. {@link #FADE} turns
 * that darkness into alpha instead — the ring comes out in the theme's colour fading to nothing,
 * which is how the platform spinner on the USB screen looks.
 *
 * {@link #progress} dresses the OTHER progress window, the platform {@code ProgressDialog}; both
 * turn the same {@link Spin}.
 */
public final class Loading {

    private Loading() { }

    /** {@code @drawable/loading_dialog}. */
    private static final int BOX = 0xFFFFFFFF;
    private static final int RADIUS_DIP = 10;

    /** {@code dialog_loading.xml}. */
    private static final int TEXT = 0xFF102162;

    /** Alpha 0: a real theme colour can never be this, so it answers "the theme names none". */
    private static final int PROBE = 0x00FEEDBE;

    /** What a window holding the ring comes and goes with: the dialog's own fade, no scale. */
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
        } catch (Throwable t) {
            // a stock-coloured progress window is still a progress window
        }
    }

    /**
     * How much alpha one unit of darkness is worth. The ring's darkest pixel (#102162) has a
     * luminance of about 32, so without the gain its head would stop at 87% opacity.
     */
    private static final float FADE = 1.15f;

    // ------------------------------------------------ the PLATFORM's progress window (wallpapers)

    /** A rule under a dialog's title is a bare View a pixel or two high; nothing else here is. */
    private static final int RULE_MAX_DIP = 4;

    /**
     * The platform {@code ProgressDialog} — the app's own window, so it can be dressed: title
     * centred, message dropped (it repeated the title), the app's {@link Spin ring}, the theme's
     * dialog colours when it names them. The parts are found by WALKING the window: an
     * AlertDialog's ids are {@code com.android.internal.R.id.*}.
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
                // The window's padding lives in its nine-patch background: read it off the
                // drawable being replaced and put it back, or the title touches the edge.
                Rect pad = new Rect();
                Drawable had = decor.getBackground();
                if (had != null) had.getPadding(pad);
                GradientDrawable box = new GradientDrawable();
                box.setColor(bg);
                box.setCornerRadius(RADIUS_DIP * density);
                w.setBackgroundDrawable(box);
                decor.setPadding(pad.left, pad.top, pad.right, pad.bottom);
            }
            // From the decor's CHILDREN: the walk clears every group's background, and the
            // decor's own is the box just given it.
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
            // the platform's own window is still a progress window
        }
    }

    /**
     * A progress window raised but not seen (Photos opening a folder or a picture). It must stay
     * raised: it holds the keys while the load runs, and a second load started over the first
     * lands the wrong folder's list. Only its look goes.
     */
    public static void hidden(ProgressDialog d) {
        if (d == null) return;
        try {
            Window w = d.getWindow();
            if (w == null) return;
            // Before the window's first draw, which is when its enter animation is chosen.
            w.setWindowAnimations(0);
            w.clearFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            w.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            View decor = w.getDecorView();
            if (decor instanceof ViewGroup) {
                ViewGroup g = (ViewGroup) decor;
                for (int i = 0; i < g.getChildCount(); i++) g.getChildAt(i).setVisibility(View.INVISIBLE);
            }
        } catch (Throwable t) {
            // a window that shows is still a window that holds the keys
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
            // The line was laid out to hold circle and message side by side, so with the
            // message gone the circle stays where it left it unless the row is told to centre.
            if (!spin(v, color, (int) (PLATFORM_DIP * v.getResources().getDisplayMetrics().density))) {
                centre(v);
            }
            return;
        }
        if (v instanceof ViewGroup) {
            // Each panel of an AlertDialog carries a nine-patch of its own — a white box INSIDE
            // the one the window was just given, so the panels give theirs up. Padding survives:
            // a view keeps what a background gave it when that background goes.
            if (boxed) v.setBackgroundDrawable(null);
            ViewGroup g = (ViewGroup) v;
            for (int i = 0; i < g.getChildCount(); i++) dress(g.getChildAt(i), color, ruleMax, boxed);
            return;
        }
        if (themed) {
            // The rule under the title, in the platform's own accent. Height from the layout
            // params, not the view: this runs before the window has been measured.
            ViewGroup.LayoutParams lp = v.getLayoutParams();
            if (lp != null && lp.height > 0 && lp.height <= ruleMax) v.setBackgroundColor(color);
        }
    }

    /** The platform circle's size ({@code Widget.ProgressBar}), which the ring takes over. */
    private static final int PLATFORM_DIP = 48;

    /**
     * Puts a {@link Spin} where {@code stand} is and hides the stand; false leaves it untouched.
     * The ImageView of {@code dialog_loading.xml} stays (INVISIBLE, not replaced): {@code
     * LoadingDialog.onStart} casts it by id. The platform ProgressBar goes GONE.
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
                // the loop reads the flag before every frame
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
