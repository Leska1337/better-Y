package com.innioasis.ipp;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.view.Choreographer;
import android.view.View;
import android.view.ViewParent;
import android.widget.TextView;

import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

import com.innioasis.y1.R;
import com.innioasis.y1.base.BaseActivity;
import com.innioasis.y1.theme.ThemeManager;

/**
 * The travelling highlight of the menu lists (main menu, Settings, Language, Wallpaper,
 * Equalizer): the list paints every row's background itself and draws the selected one as a bar
 * that slides from row to row, kept inside the list's edges while the rows glide under it. On a
 * jump (round the list's end) the rows and the bar move at once, in the same frame. Only with
 * "Enable animations"; off, the rows paint themselves as stock does.
 */
public final class Bar extends RecyclerView.ItemDecoration
        implements Choreographer.FrameCallback, RecyclerView.OnChildAttachStateChangeListener {

    /** What one screen's rows are made of, and the colours stock gives them. */
    static final class Spec {
        final int list, selRes, rowRes, selColor, rowColor, arrow;
        final int[] texts;

        Spec(int list, int selRes, int rowRes, int selColor, int rowColor, int[] texts, int arrow) {
            this.list = list;
            this.selRes = selRes;
            this.rowRes = rowRes;
            this.selColor = selColor;
            this.rowColor = rowColor;
            this.texts = texts;
            this.arrow = arrow;
        }
    }

    /** Stock's cursor colour on the Settings family of rows, and its plain white. */
    private static final int ACCENT = 0xFF3CFFDE;
    private static final int WHITE = 0xFFFFFFFF;

    private static Spec spec(BaseActivity a) {
        if (a instanceof com.innioasis.y1.activity.MainActivity) {
            return new Spec(R.id.rc_list, R.drawable.item_setting_sel, R.drawable.item_no_selected,
                    a.getResources().getColor(R.color.selected_text_color),
                    a.getResources().getColor(R.color.white), new int[] {R.id.tv_item}, R.id.iv_arrow);
        }
        if (a instanceof com.innioasis.y1.activity.SettingActivity) {
            return new Spec(R.id.recycler, R.drawable.item_setting_sel, 0, ACCENT, WHITE,
                    new int[] {R.id.title, R.id.text}, R.id.arrow);
        }
        if (a instanceof com.innioasis.y1.activity.LanguageActivity) {
            return new Spec(R.id.recycler, R.drawable.item_selected_no_arrow, R.drawable.item_no_selected,
                    a.getResources().getColor(R.color.selected_text_color),
                    a.getResources().getColor(R.color.white), new int[] {R.id.tv_item}, R.id.iv_arrow);
        }
        if (a instanceof com.innioasis.y1.activity.WallpaperListActivity) {
            return new Spec(R.id.recycler, R.drawable.item_selected_no_arrow, 0, ACCENT, WHITE,
                    new int[] {R.id.title, R.id.text}, R.id.arrow);
        }
        if (a instanceof com.innioasis.y1.activity.EqActivity) {
            return new Spec(R.id.recycler_list, R.drawable.item_selected_no_arrow, 0, ACCENT, WHITE,
                    new int[] {R.id.text}, 0);
        }
        return null;
    }

    /** Share of the distance covered per second, and the floor and ceiling of speed: Mover's law. */
    private static final float RATE = 22f;
    private static final float VMIN = 700f;
    private static final float VMAX = 6000f;
    /** Rows the cursor may move between two frames and still be glided to. */
    private static final int JUMP = 4;

    private static final WeakHashMap BARS = new WeakHashMap();

    private final WeakReference rv;
    private final WeakReference activity;
    private final Spec spec;
    private final View selProbe;
    private final View rowProbe;
    private final int selText;
    private final int rowText;
    private float y = Float.NaN;
    /** A jump: the bar waits for the cursor's row to be laid out, then stands on it. */
    private boolean snap;
    private int lastPos = -1;
    private long last;
    private boolean running;

    private Bar(RecyclerView rv, BaseActivity a, Spec spec) {
        this.rv = new WeakReference(rv);
        this.activity = new WeakReference(a);
        this.spec = spec;
        Context c = rv.getContext().getApplicationContext();
        selProbe = new View(c);
        rowProbe = new View(c);
        ThemeManager.INSTANCE.itemSetBackground(selProbe, spec.selRes, true);
        ThemeManager.INSTANCE.itemSetBackground(rowProbe, spec.rowRes, false);
        // read back: the theme answers with its own colour, not the one asked for
        TextView t = new TextView(c);
        ThemeManager.INSTANCE.itemSetTextColor(t, spec.selColor, true);
        selText = t.getCurrentTextColor();
        ThemeManager.INSTANCE.itemSetTextColor(t, spec.rowColor, false);
        rowText = t.getCurrentTextColor();
    }

    /**
     * End of {@code BaseActivity.onResume} (through MenuStyle.apply): on before the first frame,
     * and "Enable animations" may have changed in the better-Y menu while the screen was covered.
     */
    public static void apply(android.app.Activity act) {
        try {
            if (!(act instanceof BaseActivity)) return;
            BaseActivity a = (BaseActivity) act;
            Spec s = spec(a);
            if (s == null) return;
            View v = act.findViewById(s.list);
            if (!(v instanceof RecyclerView)) return;
            RecyclerView rv = (RecyclerView) v;
            Bar b = (Bar) BARS.get(rv);
            boolean on = Anim.on();
            if (on == (b != null)) return;
            if (on) {
                b = new Bar(rv, a, s);
                BARS.put(rv, b);
                rv.addItemDecoration(b);
                rv.addOnChildAttachStateChangeListener(b);
                rv.getViewTreeObserver().addOnPreDrawListener(b.tinter);
            } else {
                BARS.remove(rv);
                rv.removeItemDecoration(b);
                rv.removeOnChildAttachStateChangeListener(b);
                rv.getViewTreeObserver().removeOnPreDrawListener(b.tinter);
                b.stop();
            }
            Wheel.glides(rv, on);
            if (rv.getAdapter() != null) rv.getAdapter().notifyDataSetChanged();
        } catch (Throwable t) {
        }
    }

    /**
     * End of every {@code BaseBindingAdapter} bind: a bound row of a bar's list loses its
     * background, cursor arrow and text colours to the list.
     */
    public static void bound(androidx.viewbinding.ViewBinding vb) {
        try {
            View row = vb == null ? null : vb.getRoot();
            Bar b = row == null ? null : of(row);
            if (b == null) return;
            b.clean(row);
            // The bar is the LIST's drawing: a row repainted redraws only the row. Where nothing
            // else moves the list (the Equalizer's ten rows) the bar stood where it was.
            RecyclerView r = (RecyclerView) b.rv.get();
            if (r != null) r.invalidate();
        } catch (Throwable t) {
        }
    }

    /** A row entering the list mid-glide was bound before it had a parent: taken in here. */
    public void onChildViewAttachedToWindow(View row) {
        try {
            clean(row);
        } catch (Throwable t) {
        }
    }

    public void onChildViewDetachedFromWindow(View row) {
    }

    private void clean(View row) {
        ROWS.put(row, new WeakReference(this));
        blank(row);
        if (spec.arrow != 0) {
            View arrow = row.findViewById(spec.arrow);
            if (arrow != null && arrow.getVisibility() == View.VISIBLE) arrow.setVisibility(View.INVISIBLE);
        }
        tint(row, row.getHeight());
    }

    private static final Drawable EMPTY = new android.graphics.drawable.ColorDrawable(0);

    /**
     * The row's background emptied INSIDE a {@code Rows.Flat}, once wrapped: swapping a wrapper's
     * content asks no layout, while setting or clearing a background re-lays out the whole window
     * (Settings with its panel) on every click.
     */
    private static void blank(View row) {
        Drawable d = row.getBackground();
        if (d instanceof Rows.Flat) {
            Rows.Flat f = (Rows.Flat) d;
            if (f.res != Rows.BLANK) f.swap(EMPTY, Rows.BLANK);
        } else {
            Rows.Flat f = new Rows.Flat(EMPTY);
            f.res = Rows.BLANK;
            row.setBackgroundDrawable(f);
        }
    }

    /** From the theme's asynchronous applier: true when the view was a bar's row or probe. */
    static boolean landed(View v) {
        try {
            if (v == null) return false;
            if (of(v) != null) {
                blank(v);
                return true;
            }
            java.util.Iterator it = BARS.values().iterator();
            while (it.hasNext()) {
                Bar b = (Bar) it.next();
                if (v == b.selProbe || v == b.rowProbe) {
                    RecyclerView r = (RecyclerView) b.rv.get();
                    if (r != null) r.postInvalidate();
                    return true;
                }
            }
        } catch (Throwable t) {
        }
        return false;
    }

    /**
     * The bar a row belongs to. By its parent — and by memory, for a list rebuilding in place
     * (a preset picked): its rows are re-bound DETACHED, parent null, and kept the old colour.
     */
    private static Bar of(View row) {
        ViewParent p = row.getParent();
        Bar b = p instanceof RecyclerView ? (Bar) BARS.get(p) : null;
        if (b != null) {
            ROWS.put(row, new WeakReference(b));
            return b;
        }
        Object w = ROWS.get(row);
        b = w == null ? null : (Bar) ((WeakReference) w).get();
        return b != null && BARS.containsValue(b) ? b : null;
    }

    private static final WeakHashMap ROWS = new WeakHashMap();

    /**
     * True = swallow the wheel's step. While a jump is still being laid out, any step. And on an
     * end while the rows still glide towards it: going round then, that end is never seen.
     */
    public static boolean holds(RecyclerView r, int dir) {
        try {
            Bar b = r == null ? null : (Bar) BARS.get(r);
            if (b == null || r.getAdapter() == null) return false;
            if (b.snap) return true;
            if (Wheel.Glider.left(r) == 0) return false;
            BaseActivity a = (BaseActivity) b.activity.get();
            if (a == null) return false;
            int m = a.getMark();
            int n = r.getAdapter().getItemCount();
            return dir > 0 ? m >= n - 1 : m <= 0;
        } catch (Throwable t) {
            return false;
        }
    }

    private int cursor() {
        BaseActivity a = (BaseActivity) activity.get();
        return a == null ? -1 : a.getMark();
    }

    /**
     * A cursor moved further than the rows ever glide (a list rebuilt, a return) is stood on, not
     * flown to. Two wheel steps between frames are NOT that: they cut the glide short.
     */
    private void observe() {
        int pos = cursor();
        if (lastPos >= 0 && Math.abs(pos - lastPos) > JUMP) snap = true;
        lastPos = pos;
    }

    /** The bar onto the cursor's row once that row is laid out; false while it is not yet. */
    private boolean settle(RecyclerView r, int h) {
        if (snap) {
            // after the jump's layout, never on the rows from before it
            if (r.isLayoutRequested() || cursorRow(r) == null) return false;
            y = target(r, h);
            snap = false;
        } else if (Float.isNaN(y)) {
            y = target(r, h);
        }
        return true;
    }

    /**
     * From {@code Wheel.scrollTo}: a jump moves the rows at once ({@code Wheel.jumpNow}), and the
     * bar and the text colour stand on the row they bring in the same frame. A glide, a fade or a
     * flight here parts the bar from the colour, or blinks.
     */
    static boolean defer(RecyclerView r, int pos) {
        Bar b = r == null ? null : (Bar) BARS.get(r);
        if (b == null) return false;
        b.lastPos = pos;
        b.snap = true;
        Wheel.jumpNow(r, pos);
        b.start();
        return true;
    }

    private View cursorRow(RecyclerView r) {
        RecyclerView.LayoutManager lm = r.getLayoutManager();
        return lm instanceof LinearLayoutManager ? ((LinearLayoutManager) lm).findViewByPosition(cursor()) : null;
    }

    /** Where the bar belongs now: on the cursor's row, never past the list's edges. */
    private float target(RecyclerView r, int h) {
        int top = r.getPaddingTop();
        int bottom = r.getHeight() - r.getPaddingBottom() - h;
        float t;
        View v = cursorRow(r);
        if (v != null) {
            t = v.getTop() + v.getTranslationY();
        } else {
            View first = r.getChildCount() > 0 ? r.getChildAt(0) : null;
            int fp = first == null ? 0 : r.getChildLayoutPosition(first);
            t = cursor() < fp ? top : bottom;
        }
        return Math.max(top, Math.min(bottom, t));
    }

    /**
     * The text colour, selected only where the bar stands. A sliding bar claims the row it covers
     * three quarters of; a bar at rest (at an edge, the rows gliding under it) claims the cursor's
     * row at once. Off the bar a row has the plain colour — the Equalizer's active preset its own,
     * asked of {@link Eq} rather than remembered from a bind, which a list rebuilding in place
     * does not always run where it can be seen.
     */
    private void tint(View row, int h) {
        RecyclerView r = (RecyclerView) rv.get();
        if (h <= 0 || r == null) return;
        int pos = r.getChildLayoutPosition(row);
        boolean on = false;
        if (!snap && !Float.isNaN(y)) {
            if (Math.abs(target(r, h) - y) < 0.5f) on = pos == cursor();
            else on = Math.abs(row.getTop() + row.getTranslationY() - y) <= h / 4f;
        }
        int off = activity.get() instanceof com.innioasis.y1.activity.EqActivity ? Eq.rowColor(pos, rowText) : rowText;
        for (int i = 0; i < spec.texts.length; i++) {
            View tv = row.findViewById(spec.texts[i]);
            if (!(tv instanceof TextView)) continue;
            int want = on ? selText : off;
            TextView t = (TextView) tv;
            if (t.getCurrentTextColor() != want) t.setTextColor(want);
        }
    }

    /** The bar's height: the cursor row's — the Equalizer's rows differ by a pixel. */
    private int height(RecyclerView r) {
        View v = cursorRow(r);
        if (v == null && r.getChildCount() > 0) v = r.getChildAt(0);
        return v == null ? 0 : v.getHeight();
    }

    private final Tinter tinter = new Tinter(this);

    /**
     * The text colours, BEFORE the list draws: a colour set from inside the draw reaches the row
     * only with the next frame, and a bar at rest has no next frame — the row stayed uncoloured.
     */
    static final class Tinter implements android.view.ViewTreeObserver.OnPreDrawListener {
        private final WeakReference bar;

        Tinter(Bar b) {
            bar = new WeakReference(b);
        }

        public boolean onPreDraw() {
            try {
                Bar b = (Bar) bar.get();
                RecyclerView r = b == null ? null : (RecyclerView) b.rv.get();
                if (r == null || r.getChildCount() == 0) return true;
                b.observe();
                int h = b.height(r);
                b.settle(r, h);
                for (int i = 0; i < r.getChildCount(); i++) b.tint(r.getChildAt(i), h);
            } catch (Throwable t) {
            }
            return true;
        }
    }

    public void onDraw(Canvas c, RecyclerView r, RecyclerView.State s) {
        try {
            int n = r.getChildCount();
            if (n == 0) return;
            observe();
            Drawable rowBg = rowProbe.getBackground();
            Drawable selBg = selProbe.getBackground();
            View any = r.getChildAt(0);
            int left = any.getLeft();
            int right = any.getRight();
            int h = height(r);
            boolean laid = settle(r, h);
            float goal = target(r, h);
            if (rowBg != null) {
                for (int i = 0; i < n; i++) {
                    View v = r.getChildAt(i);
                    int t = Math.round(v.getTop() + v.getTranslationY());
                    rowBg.setBounds(v.getLeft(), t, v.getRight(), t + v.getHeight());
                    rowBg.draw(c);
                }
            }
            if (!laid) {
                start();
                return;
            }
            int top = Math.round(y);
            if (selBg != null) {
                selBg.setBounds(left, top, right, top + h);
                selBg.draw(c);
            }
            drawArrow(c, r, top);
            if (y != goal) start();
        } catch (Throwable t) {
        }
    }

    /** The cursor row's own arrow, drawn on the bar: the theme's arrow may carry the bar's colour. */
    private void drawArrow(Canvas c, RecyclerView r, int top) {
        View row = cursorRow(r);
        if (row == null) return;
        if (spec.arrow == 0) return;
        View arrow = row.findViewById(spec.arrow);
        // a GONE arrow keeps the width of its last layout
        if (arrow == null || arrow.getVisibility() == View.GONE || arrow.getWidth() == 0) return;
        c.save();
        c.translate(row.getLeft() + arrow.getLeft(), top + arrow.getTop());
        arrow.draw(c);
        c.restore();
    }

    private void start() {
        if (running) return;
        running = true;
        last = 0;
        Choreographer.getInstance().postFrameCallback(this);
    }

    private void stop() {
        if (running) Choreographer.getInstance().removeFrameCallback(this);
        running = false;
    }

    public void doFrame(long nanos) {
        RecyclerView r = (RecyclerView) rv.get();
        if (r == null || r.getWindowToken() == null || r.getChildCount() == 0) {
            running = false;
            return;
        }
        long now = nanos / 1000000L;
        float dt = last == 0 ? 0.016f : Math.min(0.05f, (now - last) / 1000f);
        last = now;
        observe();
        int h = height(r);
        if (!snap && settle(r, h)) {
            float goal = target(r, h);
            float d = goal - y;
            float a = Math.abs(d);
            float v = Math.max(VMIN, Math.min(VMAX, a * RATE));
            float step = Math.min(a, v * dt);
            y += d < 0 ? -step : step;
            if (Math.abs(goal - y) < 0.5f) y = goal;
        }
        r.invalidate();
        if (snap || y != target(r, h)) {
            Choreographer.getInstance().postFrameCallback(this);
        } else {
            running = false;
        }
    }
}
