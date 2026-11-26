package com.innioasis.ipp;

import android.app.Activity;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.view.Choreographer;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ImageView;
import android.widget.TextView;

import com.innioasis.y1.R;
import com.innioasis.y1.theme.ThemeManager;

import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/**
 * The travelling bar for a column of rows that is not a list (Date and time): the column's
 * background draws the rows' backgrounds and the bar, on {@link Bar}'s spring, and the rows'
 * own backgrounds stay empty. Texts take their colour by the share of the row the bar covers,
 * the cursor row's arrow rides on the bar. Fed by the screen's own repaint: the cursor row's
 * index after every step. A jump of more than one row (round the end) is a jump.
 */
public final class RowBar extends Drawable
        implements Choreographer.FrameCallback, ViewTreeObserver.OnPreDrawListener, Loop.Bumper {

    private static final float OMEGA = 30f;
    /** Thinner than this is a hairline, not a row. */
    private static final int HAIR = 2;

    private static final WeakHashMap BARS = new WeakHashMap();
    private static final WeakHashMap ROWS = new WeakHashMap();

    private final WeakReference col;
    private final View selProbe;
    private final View rowProbe;
    private final int selText;
    private final int rowText;
    /** What the column's background was: drawn first. */
    private Drawable under;
    private int cur = -1;
    private float y = Float.NaN, hb = Float.NaN, vel, movedTo = Float.NaN;
    private long last;
    private boolean running;
    /** A bounce against an end: the cursor row stays lit. */
    private boolean bouncing;

    private RowBar(ViewGroup col, int selRes, int rowRes, int selColor, int rowColor) {
        this.col = new WeakReference(col);
        android.content.Context c = col.getContext().getApplicationContext();
        selProbe = new View(c);
        rowProbe = new View(c);
        ThemeManager tm = ThemeManager.INSTANCE;
        tm.itemSetBackground(selProbe, selRes, true);
        tm.itemSetBackground(rowProbe, rowRes, false);
        // read back: the theme answers with its own colour, not the one asked for
        TextView t = new TextView(c);
        tm.itemSetTextColor(t, selColor, true);
        selText = t.getCurrentTextColor();
        tm.itemSetTextColor(t, rowColor, false);
        rowText = t.getCurrentTextColor();
    }

    /** Date and time: the end of its stock repaint, the cursor on row {@code pos} of {@code date_ll}. */
    public static void dateTime(Activity a, int pos) {
        View v = a.findViewById(R.id.date_ll);
        if (!(v instanceof ViewGroup)) return;
        update((ViewGroup) v, pos, R.drawable.item_selected_no_arrow, R.drawable.item_no_selected,
                a.getResources().getColor(R.color.selected_text_color), 0xFFFFFFFF);
    }

    /** True: the column has a bar, and the cursor row's arrow is left to it. */
    public static boolean update(ViewGroup col, int pos, int selRes, int rowRes, int selColor, int rowColor) {
        try {
            if (!Anim.on()) return false;
            RowBar b = (RowBar) BARS.get(col);
            if (b == null) {
                b = new RowBar(col, selRes, rowRes, selColor, rowColor);
                BARS.put(col, b);
                col.getViewTreeObserver().addOnPreDrawListener(b);
            }
            b.dress();
            for (int i = 0; i < col.getChildCount(); i++) {
                View r = col.getChildAt(i);
                ROWS.put(r, b);
                Bar.blank(r);
            }
            View arrow = b.arrowOf(pos);
            if (arrow != null && arrow.getVisibility() == View.VISIBLE) arrow.setVisibility(View.INVISIBLE);
            if (pos != b.cur && b.cur >= 0 && Math.abs(pos - b.cur) > 1) b.y = Float.NaN;
            if (pos != b.cur) b.bouncing = false;
            b.cur = pos;
            b.start();
            col.invalidate();
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    /** A row of a column with a bar: its own background stays empty. */
    static boolean owns(View v) {
        return v != null && ROWS.get(v) != null;
    }

    /** From the theme's asynchronous applier: a row blanked again, a probe repainted. */
    static boolean landed(View v) {
        if (v == null) return false;
        if (owns(v)) {
            Bar.blank(v);
            return true;
        }
        java.util.Iterator it = BARS.values().iterator();
        while (it.hasNext()) {
            RowBar b = (RowBar) it.next();
            if (v == b.selProbe || v == b.rowProbe) {
                View c = (View) b.col.get();
                if (c != null) c.postInvalidate();
                return true;
            }
        }
        return false;
    }

    /** The column's background is this, over whatever it had (Fill's rows below the last). */
    private void dress() {
        View c = (View) col.get();
        if (c == null || c.getBackground() == this) return;
        under = c.getBackground();
        c.setBackgroundDrawable(this);
    }

    private View row(int i) {
        ViewGroup c = (ViewGroup) col.get();
        int k = 0;
        for (int j = 0; c != null && j < c.getChildCount(); j++) {
            View v = c.getChildAt(j);
            if (v.getVisibility() != View.VISIBLE || v.getHeight() > 0 && v.getHeight() <= HAIR) continue;
            if (k++ == i) return v;
        }
        return null;
    }

    private View arrowOf(int i) {
        View r = row(i);
        return r == null ? null : r.findViewById(R.id.arrow);
    }

    public void bump(int dir) {
        View c = (View) col.get();
        if (c == null || !c.hasWindowFocus() || Float.isNaN(y)) return;
        bouncing = true;
        // a bar placed rather than moved starts from rest (doFrame)
        if (y != movedTo) {
            vel = 0f;
            movedTo = y;
        }
        vel += dir * Loop.BUMP_V;
        start();
    }

    public int at() {
        return cur;
    }

    public int count() {
        int n = 0;
        while (row(n) != null) n++;
        return n;
    }

    private void start() {
        if (running) return;
        running = true;
        last = 0;
        Choreographer.getInstance().postFrameCallback(this);
    }

    public void doFrame(long nanos) {
        ViewGroup c = (ViewGroup) col.get();
        View r = row(cur);
        if (c == null || r == null || c.getWindowToken() == null || r.getHeight() == 0) {
            running = false;
            return;
        }
        long now = nanos / 1000000L;
        float dt = last == 0 ? 0.016f : Math.min(0.05f, (now - last) / 1000f);
        last = now;
        float goal = r.getTop();
        int h = r.getHeight();
        if (Float.isNaN(y)) {
            y = goal;
            hb = h;
        }
        if (y != movedTo) vel = 0f;
        float e = y - goal;
        float a = Math.abs(e);
        float cv = vel + OMEGA * e;
        float ex = (float) Math.exp(-OMEGA * dt);
        float ne = (e + cv * dt) * ex;
        vel = (vel - OMEGA * cv * dt) * ex;
        if (a == 0) hb = h;
        else hb += (h - hb) * Math.max(0f, Math.min(1f, 1f - Math.abs(ne) / a));
        y = goal + ne;
        if (Math.abs(ne) < 0.5f && Math.abs(vel) < 15f) {
            y = goal;
            hb = h;
            vel = 0f;
        }
        movedTo = y;
        c.invalidate();
        if (y != goal || hb != h || vel != 0f) {
            // going round waits for this (Loop.swallow), a bounce included
            Loop.animating();
            Choreographer.getInstance().postFrameCallback(this);
        } else {
            running = false;
            bouncing = false;
        }
    }

    /** The texts' colours before the frame: a colour set from the drawing reaches the row a frame late. */
    public boolean onPreDraw() {
        try {
            ViewGroup c = (ViewGroup) col.get();
            if (c == null) return true;
            dress();
            for (int i = 0; ; i++) {
                View r = row(i);
                if (r == null) break;
                float f = cover(r, i == cur);
                tint(r, f >= 1f ? selText : f <= 0f ? rowText : mix(rowText, selText, f));
            }
        } catch (Throwable t) {
        }
        return true;
    }

    private float cover(View r, boolean isCursor) {
        if (Float.isNaN(y) || bouncing) return isCursor ? 1f : 0f;
        View goalRow = row(cur);
        if (goalRow != null && Math.abs(goalRow.getTop() - y) < 0.5f) return isCursor ? 1f : 0f;
        float top = r.getTop(), bottom = r.getBottom();
        float in = Math.min(bottom, y + hb) - Math.max(top, y);
        return in <= 0 || bottom <= top ? 0f : Math.min(1f, in / (bottom - top));
    }

    private static void tint(View v, int colour) {
        if (v instanceof TextView) {
            TextView t = (TextView) v;
            if (t.getCurrentTextColor() != colour) t.setTextColor(colour);
            return;
        }
        if (!(v instanceof ViewGroup)) return;
        ViewGroup g = (ViewGroup) v;
        for (int i = 0; i < g.getChildCount(); i++) tint(g.getChildAt(i), colour);
    }

    private static int mix(int a, int b, float f) {
        int r = 0;
        for (int s = 0; s < 32; s += 8) {
            int x = (a >>> s) & 0xff, y = (b >>> s) & 0xff;
            r |= (Math.round(x + (y - x) * f) & 0xff) << s;
        }
        return r;
    }

    @Override
    public void draw(Canvas c) {
        try {
            if (under != null) {
                under.setBounds(getBounds());
                under.draw(c);
            }
            Drawable rowBg = rowProbe.getBackground();
            Drawable selBg = selProbe.getBackground();
            for (int i = 0; ; i++) {
                View r = row(i);
                if (r == null) break;
                if (rowBg != null) {
                    rowBg.setBounds(r.getLeft(), r.getTop(), r.getRight(), r.getBottom());
                    rowBg.draw(c);
                }
            }
            View cr = row(cur);
            if (cr == null || cr.getHeight() == 0) return;
            // the highlight on screen: a click against an end bounces it (Loop)
            View cv = (View) col.get();
            if (cv != null && cv.hasWindowFocus()) Loop.bumper(this);
            // the screen opens before its rows are laid out: the bar stands on the first draw
            if (Float.isNaN(y)) {
                y = cr.getTop();
                hb = cr.getHeight();
                movedTo = y;
            }
            int top = Math.round(y);
            int bottom = top + Math.round(hb);
            if (selBg != null) {
                selBg.setBounds(cr.getLeft(), top, cr.getRight(), bottom);
                selBg.draw(c);
            }
            View arrow = cr.findViewById(R.id.arrow);
            if (arrow instanceof ImageView && arrow.getVisibility() != View.GONE && arrow.getWidth() > 0) {
                int dx = 0, dy = 0;
                for (View v = arrow; v != null && v != cr; v = (View) v.getParent()) {
                    dx += v.getLeft();
                    dy += v.getTop();
                }
                c.save();
                c.clipRect(cr.getLeft(), top, cr.getRight(), bottom);
                c.translate(cr.getLeft() + dx, top + dy);
                arrow.draw(c);
                c.restore();
            }
        } catch (Throwable t) {
        }
    }

    @Override
    public void setAlpha(int a) {
    }

    @Override
    public void setColorFilter(android.graphics.ColorFilter f) {
    }

    @Override
    public int getOpacity() {
        return android.graphics.PixelFormat.TRANSLUCENT;
    }
}
