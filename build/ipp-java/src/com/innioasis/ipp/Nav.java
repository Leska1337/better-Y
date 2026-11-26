package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import android.view.Choreographer;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.widget.AbsListView;
import android.widget.TextView;

import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.recyclerview.widget.RecyclerView;

import com.innioasis.fm.configs.KeyMap;
import com.innioasis.y1.R;
import com.innioasis.y1.activity.IppFlowActivity;
import com.innioasis.y1.activity.IppSaverActivity;
import com.innioasis.y1.activity.IppUsbActivity;
import com.innioasis.y1.base.BasePlayerActivity;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.WeakHashMap;

/**
 * "Navigation" animations, iPod-like, between screens and between the levels of one screen. Half
 * menu to half menu: the lists slide inside the left half. Half menu and a full-screen list: the
 * list comes in from the right and pushes the half out. Full list to full list: the whole screen
 * slides. Half menu to a screen with no list: the half menu parts to both sides over it. Back runs
 * the same in reverse. The screen left is drawn into a bitmap while the button that leaves it is
 * still down, so the drawing costs nothing on the way; the screen arrived at stays live. The status
 * bar never moves, and the popups of the screen arrived at stay hidden until the slide is over.
 */
public final class Nav {

    private Nav() { }

    private static final int SLIDE = 0;
    private static final int PUSH = 1;
    private static final int FULL = 2;
    private static final int SPLIT = 3;

    // the spring every slide rides, critically damped: most of the way in ~0.28 s, settled in ~0.45
    private static final float OMEGA = 14f;
    private static final long FRAME_NS = 27000000L;
    // a picture taken on the button press is good for the screen that press opens
    private static final long SHOT_MS = 3000;

    static WeakReference current;
    private static final WeakHashMap SEEN = new WeakHashMap();
    static Run running;
    private static Bitmap bufA;
    private static Bitmap bufB;
    private static Bitmap bufC;

    // the picture of the screen as it stood when center or top went down
    private static WeakReference keyAct;
    private static long keyAt;
    private static String keySig;
    private static boolean keyHalf;
    private static boolean keyMenu;
    private static boolean keyList;

    /** End of {@code BaseActivity.onResume}: forward when the screen is new, back when the last one finished. */
    public static void arrive(Object o) {
        if (!(o instanceof Activity)) return;
        try {
            Activity a = (Activity) o;
            boolean fresh = SEEN.put(a, Boolean.TRUE) == null;
            Activity prev = current == null ? null : (Activity) current.get();
            if (prev == a) return;
            current = new WeakReference(a);
            if (running != null) running.end();
            Popups.restore();
            if (prev == null || !Anim.nav()) return;
            if (a instanceof IppSaverActivity || a instanceof IppUsbActivity
                    || prev instanceof IppSaverActivity || prev instanceof IppUsbActivity) return;
            boolean back;
            if (fresh && !prev.isFinishing()) back = false;
            else if (!fresh && prev.isFinishing()) back = true;
            else return;
            Popups.hide(a);
            View decor = a.getWindow().getDecorView();
            decor.getViewTreeObserver().addOnPreDrawListener(new Start(a, prev, back));
        } catch (Throwable t) {
        }
    }

    /**
     * Start of {@code BaseActivity.dispatchKeyEvent}. Center or top down on a list: the screen is
     * drawn now, while nothing waits for it. Up: whatever the press changed is looked at on the next
     * frame, and a new level of the same screen slides in.
     */
    public static void key(Object o, KeyEvent e) {
        if (!(o instanceof Activity) || e == null || e.getRepeatCount() != 0) return;
        try {
            int code = e.getKeyCode();
            KeyMap k = KeyMap.INSTANCE;
            boolean top = code == k.getKEY_MENU();
            if (!top && code != k.getKEY_ENTER()) return;
            if (!Anim.nav()) return;
            Activity a = (Activity) o;
            if (e.getAction() == KeyEvent.ACTION_DOWN) {
                snap(a);
            } else if (e.getAction() == KeyEvent.ACTION_UP && shotOf(a)) {
                a.getWindow().getDecorView().getViewTreeObserver().addOnPreDrawListener(new Level(a, top));
            }
        } catch (Throwable t) {
        }
    }

    private static boolean shotOf(Activity a) {
        return keyAct != null && keyAct.get() == a && SystemClock.uptimeMillis() - keyAt < SHOT_MS;
    }

    private static void snap(Activity a) {
        keyAct = null;
        if (running != null) running.end();
        View list = MenuStyle.half(a);
        boolean menu = list == null && menu(a);
        if (list == null && !menu) return;
        View decor = a.getWindow().getDecorView();
        int w = decor.getWidth(), h = decor.getHeight();
        int top = top(a);
        if (w <= 0 || top >= h) return;
        bufA = buffer(bufA, w, h - top);
        window(bufA, a, top);
        keyList = list != null;
        if (keyList) {
            bufB = buffer(bufB, w, h - top);
            listShot(bufB, list, top);
        }
        keyHalf = list != null;
        keyEdge = keyHalf ? right(list) : -1;
        keyMenu = menu;
        keySig = sig(a);
        keyAt = SystemClock.uptimeMillis();
        keyAct = new WeakReference(a);
    }

    /** What tells one level of a screen from another: the title and which lists show what. */
    private static String sig(Activity a) {
        StringBuilder b = new StringBuilder();
        View t = a.findViewById(R.id.status_bar_time);
        if (t instanceof TextView) b.append(((TextView) t).getText());
        sigOf(a.findViewById(R.id.layoutContent), b);
        return b.toString();
    }

    private static void sigOf(View v, StringBuilder b) {
        if (v == null || v.getVisibility() != View.VISIBLE) return;
        if (v instanceof RecyclerView) {
            b.append('|').append(System.identityHashCode(((RecyclerView) v).getAdapter()));
            return;
        }
        if (v instanceof AbsListView) {
            b.append('|').append(System.identityHashCode(((AbsListView) v).getAdapter()));
            return;
        }
        if (v instanceof ViewGroup) {
            ViewGroup g = (ViewGroup) v;
            for (int i = 0; i < g.getChildCount(); i++) sigOf(g.getChildAt(i), b);
        }
    }

    private static final long WAIT_NS = 400000000L;

    /** The screen has no visible list, or one of them shows rows: an empty second list is no reason to wait. */
    private static boolean filled(View v) {
        int r = rowsIn(v);
        return r != 1;
    }

    // 0: no list here, 1: lists, all empty, 2: a list with rows
    private static int rowsIn(View v) {
        if (v == null || v.getVisibility() != View.VISIBLE) return 0;
        if (v instanceof RecyclerView) return ((RecyclerView) v).getChildCount() > 0 ? 2 : 1;
        if (v instanceof AbsListView) return ((AbsListView) v).getChildCount() > 0 ? 2 : 1;
        int best = 0;
        if (v instanceof ViewGroup) {
            ViewGroup g = (ViewGroup) v;
            for (int i = 0; i < g.getChildCount() && best < 2; i++) best = Math.max(best, rowsIn(g.getChildAt(i)));
        }
        return best;
    }

    /** A full-screen list: the screens the push and the full slide go between. */
    private static boolean menu(Activity a) {
        if (a instanceof BasePlayerActivity || a instanceof IppFlowActivity) return false;
        return MenuStyle.rows(a.findViewById(R.id.layoutContent));
    }

    private static final int[] LOC = new int[2];

    private static int left(View v) {
        v.getLocationInWindow(LOC);
        return LOC[0];
    }

    private static int right(View v) {
        v.getLocationInWindow(LOC);
        return LOC[0] + v.getWidth();
    }

    /** The bottom of the status bar, in the window. */
    private static int top(Activity a) {
        View bar = a.findViewById(R.id.status_bar);
        if (bar == null || !bar.isShown()) return 0;
        bar.getLocationInWindow(LOC);
        return LOC[1] + bar.getHeight();
    }

    /** The window below the status bar without its background: the wallpaper stands still. */
    private static void window(Bitmap b, Activity of, int top) {
        b.eraseColor(0);
        Canvas c = new Canvas(b);
        c.translate(0, -top);
        ViewGroup d = (ViewGroup) of.getWindow().getDecorView();
        for (int i = 0; i < d.getChildCount(); i++) {
            View v = d.getChildAt(i);
            if (v.getVisibility() != View.VISIBLE || v instanceof Layer) continue;
            c.save();
            c.translate(v.getLeft(), v.getTop());
            v.draw(c);
            c.restore();
        }
    }

    /** The list alone, where it stands, on a clear bitmap. */
    private static void listShot(Bitmap b, View list, int top) {
        b.eraseColor(0);
        Canvas c = new Canvas(b);
        list.getLocationInWindow(LOC);
        c.translate(LOC[0], LOC[1] - top);
        list.draw(c);
    }

    private static Bitmap buffer(Bitmap b, int w, int h) {
        if (b != null && b.getWidth() == w && b.getHeight() == h) return b;
        return Bitmap.createBitmap(w, h, Bitmap.Config.ARGB_8888);
    }

    static final class Start implements ViewTreeObserver.OnPreDrawListener {
        private final WeakReference act;
        private final WeakReference from;
        private final boolean back;

        Start(Activity a, Activity prev, boolean back) {
            act = new WeakReference(a);
            from = new WeakReference(prev);
            this.back = back;
        }

        @Override
        public boolean onPreDraw() {
            Activity a = (Activity) act.get();
            try {
                if (a != null) a.getWindow().getDecorView().getViewTreeObserver().removeOnPreDrawListener(this);
                Activity prev = (Activity) from.get();
                if (a == null || prev == null || current == null || current.get() != a) return true;
                boolean have = shotOf(prev);
                keyAct = null;
                View oldList = MenuStyle.half(prev);
                View newList = MenuStyle.half(a);
                Run r = null;
                if (oldList != null && newList != null) {
                    r = new Run(a, prev, back, SLIDE, oldList, newList);
                } else if (oldList != null) {
                    if (!back) r = new Run(a, prev, false, menu(a) ? PUSH : SPLIT, oldList, null);
                } else if (newList != null) {
                    if (back) r = new Run(a, prev, true, menu(prev) ? PUSH : SPLIT, null, newList);
                } else if (menu(a) && menu(prev)) {
                    r = new Run(a, prev, back, FULL, null, null);
                }
                if (r != null && have) r.preShot(keyList);
                if (r == null || !r.begin()) {
                    Popups.restore();
                    return true;
                }
                running = r;
                return true;
            } catch (Throwable t) {
                Popups.restore();
                return true;
            }
        }
    }

    /** After center or top: if the press changed the level of the same screen, it slides. */
    static final class Level implements ViewTreeObserver.OnPreDrawListener {
        private final WeakReference act;
        private final boolean back;

        Level(Activity a, boolean back) {
            act = new WeakReference(a);
            this.back = back;
        }

        @Override
        public boolean onPreDraw() {
            Activity a = (Activity) act.get();
            try {
                if (a == null) return true;
                a.getWindow().getDecorView().getViewTreeObserver().removeOnPreDrawListener(this);
                if (!shotOf(a) || a.isFinishing() || current == null || current.get() != a) return true;
                if (keySig.equals(sig(a))) return true;
                keyAct = null;
                View newList = MenuStyle.half(a);
                Run r = null;
                if (keyHalf && newList == null && !back && menu(a)) {
                    r = new Run(a, a, false, PUSH, null, null);
                    r.oldEdge = keyEdge;
                } else if (!keyHalf && newList != null && back) {
                    r = new Run(a, a, true, PUSH, null, newList);
                } else if (keyMenu && newList == null && menu(a)) {
                    r = new Run(a, a, back, FULL, null, null);
                }
                if (r == null) return true;
                r.preShot(false);
                if (!r.begin()) return true;
                running = r;
            } catch (Throwable t) {
            }
            return true;
        }
    }

    private static int keyEdge;

    /** One transition: the bitmaps, the layers drawing them, the views moved. */
    static final class Run implements Choreographer.FrameCallback {
        final Activity act;
        private final Activity prev;
        private final boolean back;
        private final int mode;
        private final View oldList;
        private final View newList;
        int oldEdge = -1;

        private ViewGroup decor;
        private View bar;
        private int top;
        private int w;
        private int h;
        // PUSH and SPLIT: the half list's right edge
        private int edge;
        // SLIDE: where both lists stand at rest
        private int oL, oR, nL, nR;
        private boolean pre;
        private boolean preList;
        private Bitmap shot;
        private Bitmap shot2;
        private Layer under;
        private Layer over;
        private Layer strip;
        private ViewGroup root;
        private final ArrayList moved = new ArrayList();
        private float[] origX;
        private boolean hid;
        private long last;
        private long first;
        private long elapsed;
        private float p;
        private boolean done;
        private Drawable oldBg;
        private final int[] loc = new int[2];
        private final int[] at = new int[2];

        Run(Activity a, Activity prev, boolean back, int mode, View oldList, View newList) {
            act = a;
            this.prev = prev;
            this.back = back;
            this.mode = mode;
            this.oldList = oldList;
            this.newList = newList;
        }

        /** The pictures taken on the button press stand for the screen left. */
        void preShot(boolean list) {
            pre = true;
            preList = list;
        }

        boolean begin() {
            decor = (ViewGroup) act.getWindow().getDecorView();
            w = decor.getWidth();
            h = decor.getHeight();
            if (w <= 0 || h <= 0) return false;
            bar = act.findViewById(R.id.status_bar);
            top = top(act);
            if (top >= h) return false;
            if (pre && (bufA == null || bufA.getWidth() != w || bufA.getHeight() != h - top)) return false;
            oldBg = prev.getWindow().getDecorView().getBackground();
            if (mode == SLIDE) {
                oL = left(oldList);
                oR = right(oldList);
                nL = left(newList);
                nR = right(newList);
                if (pre && preList) {
                    shot = bufB;
                } else {
                    shot = bufB = buffer(bufB, w, h - top);
                    listShot(shot, oldList, top);
                }
                newList.setVisibility(View.INVISIBLE);
                hid = true;
                over = layer(-1);
            } else {
                if (mode == PUSH || mode == SPLIT) {
                    edge = oldEdge >= 0 ? oldEdge : right(back ? newList : oldList);
                    edge = Math.min(w, edge);
                }
                if (!pre) {
                    shot = bufA = buffer(bufA, w, h - top);
                    window(shot, prev, top);
                } else {
                    shot = bufA;
                }
                if (mode == SPLIT) {
                    if (back) {
                        shot2 = bufC = buffer(bufC, w, h - top);
                        window(shot2, act, top);
                    }
                    over = layer(-1);
                } else if (!moveSetup()) {
                    return false;
                }
            }
            step(0f);
            Choreographer.getInstance().postFrameCallback(this);
            return true;
        }

        /** A layer over the window (-1) or under it (0), laid out at once: this frame draws it. */
        private Layer layer(int index) {
            Layer l = new Layer(this);
            decor.addView(l, index, new ViewGroup.LayoutParams(-1, -1));
            l.measure(View.MeasureSpec.makeMeasureSpec(w, View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(h, View.MeasureSpec.EXACTLY));
            l.layout(0, 0, w, h);
            return l;
        }

        /** PUSH and FULL move the live screen: every child of the base layout but the status bar. */
        private boolean moveSetup() {
            View content = act.findViewById(R.id.layoutContent);
            ViewParent rp = content == null ? null : content.getParent();
            if (!(rp instanceof ViewGroup)) return false;
            root = (ViewGroup) rp;
            for (int i = 0; i < root.getChildCount(); i++) {
                View v = root.getChildAt(i);
                if (v != bar) moved.add(v);
            }
            origX = new float[moved.size()];
            for (int i = 0; i < origX.length; i++) origX[i] = ((View) moved.get(i)).getTranslationX();
            if (mode == PUSH && back) over = layer(-1);
            else under = layer(0);
            // under the translucent status bar the screen stands still
            if (top > 0 && root instanceof ConstraintLayout && bar != null && bar.getParent() == root) {
                strip = new Layer(this);
                ConstraintLayout.LayoutParams lp = new ConstraintLayout.LayoutParams(w, top);
                lp.leftToLeft = ConstraintLayout.LayoutParams.PARENT_ID;
                lp.topToTop = ConstraintLayout.LayoutParams.PARENT_ID;
                root.addView(strip, root.indexOfChild(bar), lp);
                strip.measure(View.MeasureSpec.makeMeasureSpec(w, View.MeasureSpec.EXACTLY),
                        View.MeasureSpec.makeMeasureSpec(top, View.MeasureSpec.EXACTLY));
                strip.layout(0, 0, w, top);
            }
            return true;
        }

        @Override
        public void doFrame(long now) {
            if (done) return;
            Popups.hide(act);
            // a frame held up by the screen (a first draw, pictures decoded) advances by two frames
            // at most: the slide slows down there instead of jumping to its end
            if (last == 0) first = now;
            long dt = last == 0 ? FRAME_NS : Math.min(now - last, 2 * FRAME_NS);
            last = now;
            // a list filled in the background (Folders) is waited for, standing at the start
            if (elapsed == 0 && now - first < WAIT_NS && !filled(act.findViewById(R.id.layoutContent))) {
                Choreographer.getInstance().postFrameCallback(this);
                return;
            }
            elapsed += dt;
            float x = OMEGA * elapsed / 1e9f;
            float e = 1f - (1f + x) * (float) Math.exp(-x);
            if ((1f - e) * w < 0.5f) e = 1f;
            step(e);
            if (e >= 1f) {
                end();
                return;
            }
            Choreographer.getInstance().postFrameCallback(this);
        }

        private void step(float e) {
            p = e;
            if (origX != null) {
                float off;
                if (mode == PUSH) off = back ? Math.min(0f, w * e - edge) : w * (1f - e);
                else off = back ? w * e - w : w * (1f - e);
                for (int i = 0; i < origX.length; i++) ((View) moved.get(i)).setTranslationX(origX[i] + off);
            }
            if (under != null) under.invalidate();
            if (over != null) over.invalidate();
        }

        void end() {
            if (done) return;
            done = true;
            try {
                Choreographer.getInstance().removeFrameCallback(this);
                if (under != null) decor.removeView(under);
                if (over != null) decor.removeView(over);
                if (strip != null) root.removeView(strip);
                for (int i = 0; origX != null && i < origX.length; i++) ((View) moved.get(i)).setTranslationX(origX[i]);
                if (hid && newList.getVisibility() == View.INVISIBLE) newList.setVisibility(View.VISIBLE);
            } catch (Throwable t) {
            }
            shot = null;
            shot2 = null;
            Popups.restore();
            if (running == this) running = null;
        }

        void draw(Layer l, Canvas c) {
            if (done || shot == null) return;
            if (l == strip) {
                drawStrip(c);
                return;
            }
            Drawable bg = decor.getBackground();
            float s;
            switch (mode) {
                case SLIDE: {
                    // the two lists side by side, the half between them growing or shrinking to the new one
                    float dxOld, dxNew;
                    if (!back) {
                        dxOld = -oR * p;
                        dxNew = (oR - nL) * (1f - p);
                    } else {
                        dxOld = nR * p;
                        dxNew = -(nR - oL) * (1f - p);
                    }
                    // a wider half stands at its width from the start; a narrower one shrinks to it
                    c.clipRect(0, top, nR >= oR ? nR : oR + (nR - oR) * p, h);
                    c.drawBitmap(shot, dxOld, top, null);
                    newList.getLocationInWindow(loc);
                    l.getLocationInWindow(at);
                    c.translate(dxNew + loc[0] - at[0], loc[1] - at[1]);
                    newList.draw(c);
                    return;
                }
                case PUSH: {
                    float left = back ? w * p : w * (1f - p);
                    // the new screen is drawn over the old one's band coming back: the band is made opaque
                    if (!back) {
                        piece(c, shot, Math.min(0f, left - edge), 0, left);
                    } else {
                        paint(c, bg, 0, left, w);
                        piece(c, shot, left, left, w);
                    }
                    return;
                }
                case FULL: {
                    s = w * p;
                    if (!back) piece(c, shot, -s, 0, w - s);
                    else piece(c, shot, s, s, w);
                    return;
                }
                default: {
                    // SPLIT: the half menu's two parts move apart over the new screen, or close over the old
                    float q = back ? 1f - p : p;
                    Bitmap half = back ? shot2 : shot;
                    // the halves carry their own background, they are pictures moving apart
                    Drawable hb = back ? bg : oldBg;
                    if (back) {
                        paint(c, oldBg, 0, 0, w);
                        piece(c, shot, 0, 0, w);
                    }
                    float dl = -edge * q;
                    float dr = (w - edge) * q;
                    paint(c, hb, dl, 0, edge + dl);
                    piece(c, half, dl, 0, edge + dl);
                    paint(c, hb, dr, edge + dr, w);
                    piece(c, half, dr, edge + dr, w);
                }
            }
        }

        /** The bitmap drawn at dx, showing only the band from x0 to x1. */
        private void piece(Canvas c, Bitmap b, float dx, float x0, float x1) {
            if (x1 <= x0) return;
            c.save();
            c.clipRect(x0, top, x1, h);
            c.drawBitmap(b, dx, top, null);
            c.restore();
        }

        /** A window background drawn at dx, in the band from x0 to x1. */
        private void paint(Canvas c, Drawable bg, float dx, float x0, float x1) {
            if (x1 <= x0) return;
            c.save();
            c.clipRect(x0, top, x1, h);
            c.translate(dx, 0);
            if (bg == null) {
                c.drawColor(Color.BLACK);
            } else {
                bg.setBounds(0, 0, w, h);
                bg.draw(c);
            }
            c.restore();
        }

        /** Under the status bar: the background and the screen where they will stand. */
        private void drawStrip(Canvas c) {
            root.getLocationInWindow(at);
            c.save();
            c.translate(-at[0], -at[1]);
            Drawable bg = decor.getBackground();
            if (bg == null) {
                c.drawColor(Color.BLACK);
            } else {
                bg.setBounds(0, 0, w, h);
                bg.draw(c);
            }
            c.restore();
            c.clipRect(0, 0, w, top);
            for (int i = 0; i < origX.length; i++) {
                View v = (View) moved.get(i);
                if (v.getVisibility() != View.VISIBLE) continue;
                c.save();
                c.translate(v.getLeft() + origX[i] - strip.getLeft(), v.getTop() + v.getTranslationY() - strip.getTop());
                v.draw(c);
                c.restore();
            }
        }
    }

    /** The full-window view a transition draws in. */
    static final class Layer extends View {
        private final Run run;

        Layer(Run run) {
            super(run.act);
            this.run = run;
            setWillNotDraw(false);
        }

        @Override
        protected void onDraw(Canvas c) {
            run.draw(this, c);
        }
    }

    /**
     * The dialogs and popups of the screen arrived at, shown before its slide is over: their windows
     * are made invisible, dim included, and shown again at the end.
     */
    static final class Popups {
        private static final ArrayList HIDDEN = new ArrayList();
        private static java.lang.reflect.Field fViews;
        private static Object global;

        static void hide(Activity a) {
            try {
                if (global == null) {
                    Class g = Class.forName("android.view.WindowManagerGlobal");
                    global = g.getMethod("getInstance", new Class[0]).invoke(null, new Object[0]);
                    fViews = g.getDeclaredField("mViews");
                    fViews.setAccessible(true);
                }
                Object vs = fViews.get(global);
                int n = vs instanceof Object[] ? ((Object[]) vs).length : ((List) vs).size();
                View decor = a.getWindow().getDecorView();
                for (int i = 0; i < n; i++) {
                    View v = (View) (vs instanceof Object[] ? ((Object[]) vs)[i] : ((List) vs).get(i));
                    if (v == null || v == decor || host(v.getContext()) != a) continue;
                    // a dialog shown again sets its window visible again
                    if (v.getVisibility() != View.VISIBLE) continue;
                    v.setVisibility(View.INVISIBLE);
                    if (!HIDDEN.contains(v)) HIDDEN.add(v);
                }
            } catch (Throwable t) {
            }
        }

        static void restore() {
            for (int i = 0; i < HIDDEN.size(); i++) {
                View v = (View) HIDDEN.get(i);
                try {
                    if (v.getParent() != null && v.getVisibility() == View.INVISIBLE) v.setVisibility(View.VISIBLE);
                } catch (Throwable t) {
                }
            }
            HIDDEN.clear();
        }

        private static Activity host(Context c) {
            while (c instanceof ContextWrapper) {
                if (c instanceof Activity) return (Activity) c;
                c = ((ContextWrapper) c).getBaseContext();
            }
            return null;
        }
    }
}
