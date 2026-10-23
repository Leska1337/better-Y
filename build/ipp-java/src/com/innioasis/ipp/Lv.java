package com.innioasis.ipp;

import android.view.View;
import android.view.ViewGroup;

import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.innioasis.music.adapter.MyBaseAdapter;
import com.innioasis.y1.view.ShufflePlaylistItemView;

/**
 * A list of a music screen (a RecyclerView on {@link SongRows}) asked in the positions of the
 * ADAPTER ({@code MyBaseAdapter}), so the Shuffle row the list carries as its row 0 is position -1
 * here. Anything that is not such a list answers as an empty one.
 */
final class Lv {

    private Lv() { }

    /** A list on SongRows; anything else is not one. */
    static boolean is(View v) {
        return rows(v) != null;
    }

    static MyBaseAdapter model(View v) {
        SongRows r = rows(v);
        return r == null ? null : r.model();
    }

    private static SongRows rows(View v) {
        return v instanceof RecyclerView ? SongRows.of((RecyclerView) v) : null;
    }

    private static LinearLayoutManager lm(View v) {
        if (!(v instanceof RecyclerView)) return null;
        RecyclerView.LayoutManager m = ((RecyclerView) v).getLayoutManager();
        return m instanceof LinearLayoutManager ? (LinearLayoutManager) m : null;
    }

    /** The first row attached (it may be wholly above the edge); -1 = the Shuffle row. */
    static int first(View v) {
        if (!(v instanceof RecyclerView)) return 0;
        RecyclerView rv = (RecyclerView) v;
        if (rv.getChildCount() == 0) return 0;
        return rv.getChildLayoutPosition(rv.getChildAt(0)) - SongRows.heads(rv);
    }

    static int last(View v) {
        if (!(v instanceof RecyclerView)) return -1;
        RecyclerView rv = (RecyclerView) v;
        int n = rv.getChildCount();
        if (n == 0) return -1;
        return rv.getChildLayoutPosition(rv.getChildAt(n - 1)) - SongRows.heads(rv);
    }

    /** The row of position {@code pos} if it is attached, else null. */
    static View row(View v, int pos) {
        LinearLayoutManager l = lm(v);
        return l == null ? null : l.findViewByPosition(pos + SongRows.heads((RecyclerView) v));
    }

    /** Where the visible list begins. */
    static int top(View v) {
        if (!(v instanceof RecyclerView)) return v.getPaddingTop();
        RecyclerView rv = (RecyclerView) v;
        return SongRows.top(rv, SongRows.heads(rv));
    }

    static int bottom(View v) {
        return v.getHeight() - v.getPaddingBottom();
    }

    /** The row's top at {@code y}. */
    static void place(View v, int pos, int y) {
        LinearLayoutManager l = lm(v);
        if (l == null) return;
        RecyclerView rv = (RecyclerView) v;
        Wheel.Glider.stop();
        rv.stopScroll();
        int h = SongRows.heads(rv);
        SongRows.moving(rv, pos + h, y);
        l.scrollToPositionWithOffset(pos + h, y - rv.getPaddingTop());
    }

    /** Against the top edge with the Shuffle row scrolled off. */
    static void pin(View v, int pos) {
        if (v instanceof RecyclerView) place(v, pos, SongRows.pinTop((RecyclerView) v));
    }

    /** The list at its start, the Shuffle row fully shown. */
    static void rest(View v) {
        if (v instanceof RecyclerView) place(v, -SongRows.heads((RecyclerView) v), v.getPaddingTop());
    }

    /** The first row with anything of it below {@code edge}; the Shuffle row does not count. */
    static int firstShown(View v, int edge) {
        if (!(v instanceof RecyclerView)) return 0;
        RecyclerView rv = (RecyclerView) v;
        int h = SongRows.heads(rv);
        for (int i = 0; i < rv.getChildCount(); i++) {
            View c = rv.getChildAt(i);
            int p = rv.getChildLayoutPosition(c) - h;
            if (p >= 0 && c.getBottom() > edge) return p;
        }
        return first(v);
    }

    /** {@code Other.gotoAdapter}. */
    static void go(View v, MyBaseAdapter a, int to) {
        if (v instanceof RecyclerView) SongRows.go((RecyclerView) v, a, to);
    }

    /** {@code setSelection}. */
    static void select(View v, int pos) {
        if (v instanceof RecyclerView) SongRows.select((RecyclerView) v, pos);
    }

    /** How far the list stands from its start, in px; -1 = its start is not attached. */
    static int scrolled(View v) {
        LinearLayoutManager l = lm(v);
        View c0 = l == null ? null : l.findViewByPosition(0);
        return c0 == null ? -1 : Math.max(0, v.getPaddingTop() - c0.getTop());
    }

    /** The screen's Shuffle row: row 0 of the list. */
    static ShufflePlaylistItemView shuffle(View v) {
        SongRows r = rows(v);
        return r == null ? null : r.shuffle();
    }

    /** The first song list of a screen. */
    static View find(View v) {
        if (is(v)) return v;
        if (!(v instanceof ViewGroup)) return null;
        ViewGroup g = (ViewGroup) v;
        for (int i = 0; i < g.getChildCount(); i++) {
            View l = find(g.getChildAt(i));
            if (l != null) return l;
        }
        return null;
    }
}
