package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;

import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

/**
 * A short list of rows a screen builds itself, shown in a RecyclerView so it gets what every other
 * list has: the travelling bar, {@link Wheel#follow} and the wrap rules. Each row is a view type
 * of its own, built once by the screen and handed back on every bind, so the screen keeps its
 * arrays of views; it paints a row in {@link Painter#paint}. A cursor past the rows is a button
 * below the list: the bar stands on it only when it was given as the list's foot.
 */
public final class Column extends RecyclerView.Adapter implements Bar.Cursor {

    public static abstract class Painter {
        public abstract void paint(int row);
    }

    private final View[] rows;
    private final Painter painter;
    private final RecyclerView rv;
    private int sel;

    /** The rows carry their heights in their layout params. */
    public Column(Context c, View[] rows, Painter painter) {
        this.rows = rows;
        this.painter = painter;
        rv = new Fixed(c);
        LinearLayoutManager lm = new LinearLayoutManager(c);
        rv.setLayoutManager(lm);
        rv.setItemAnimator(null);
        rv.setItemViewCacheSize(0);
        lm.setItemPrefetchEnabled(false);
        rv.setDescendantFocusability(ViewGroup.FOCUS_BLOCK_DESCENDANTS);
        rv.setAdapter(this);
        Fill.list(rv);
    }

    public RecyclerView list() {
        return rv;
    }

    /**
     * The travelling bar over the rows, while "Enable animations" is on. {@code menu}: the theme's
     * menu colours and backgrounds (a dialog), not its list rows'.
     */
    public void bar(Activity a, boolean menu, int selRes, int selColor, int rowColor) {
        bar(a, menu, selRes, selColor, rowColor, 0);
    }

    /** With a row below the list ({@code foot}, by id) that the bar travels onto as one more row. */
    public void bar(Activity a, boolean menu, int selRes, int selColor, int rowColor, int foot) {
        Bar.column(a, rv, menu, selRes, selColor, rowColor, new int[] {TITLE, TEXT}, foot);
    }

    /** The ids the bar recolours: a row's label and its value column. */
    public static final int TITLE = com.innioasis.y1.R.id.title;
    public static final int TEXT = com.innioasis.y1.R.id.text;

    /** The bar paints the rows' highlight: their own background stays empty. */
    public boolean barred() {
        return Bar.on(rv);
    }

    public int cursor() {
        return sel;
    }

    public int sel() {
        return sel;
    }

    /** The cursor put without a step: the bar stands on it, the list shows it. */
    public void set(int s) {
        sel = s;
        Bar.relist(rv);
        if (s < rows.length) rv.scrollToPosition(s);
        paintAll();
    }

    /** One wheel click over the rows; at the ends it stops, or goes round with loop scrolling. */
    public void step(int dir) {
        boolean end = dir > 0 ? sel >= rows.length - 1 : sel <= 0;
        if (end && Bar.holds(rv, dir)) return;
        move(Loop.step(sel, dir, rows.length));
    }

    /** The cursor to {@code s}, which may be past the rows (a button of the screen). */
    public void move(int s) {
        int old = sel;
        if (s == old) return;
        sel = s;
        if (old < rows.length && s < rows.length) {
            Wheel.follow(rv, old, s, this);
            return;
        }
        if (old < rows.length) repaint(old);
        if (s < rows.length) {
            rv.scrollToPosition(s);
            repaint(s);
        }
        rv.invalidate();
    }

    public void repaint(int i) {
        if (i < 0 || i >= rows.length) return;
        painter.paint(i);
        Bar.row(rows[i]);
    }

    public void paintAll() {
        for (int i = 0; i < rows.length; i++) repaint(i);
    }

    public int getItemCount() {
        return rows.length;
    }

    public int getItemViewType(int p) {
        return p;
    }

    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int type) {
        View v = rows[type];
        ViewParent p = v.getParent();
        if (p instanceof ViewGroup && p != parent) ((ViewGroup) p).removeView(v);
        return new Holder(v);
    }

    public void onBindViewHolder(RecyclerView.ViewHolder h, int p) {
        painter.paint(p);
        Bar.row(h.itemView);
    }

    static final class Holder extends RecyclerView.ViewHolder {
        Holder(View v) {
            super(v);
        }
    }
}
