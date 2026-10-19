package com.innioasis.ipp;

import android.view.View;
import android.view.ViewGroup;
import android.widget.ListAdapter;
import android.widget.ListView;

import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.innioasis.music.adapter.MyBaseAdapter;
import com.innioasis.music.util.Other;
import com.innioasis.y1.R;
import com.innioasis.y1.view.ShufflePlaylistItemView;

/**
 * A song list asked the same questions whether it is a ListView or a RecyclerView on
 * {@link SongRows}. Positions are always the ADAPTER's ({@code MyBaseAdapter}), so the Shuffle
 * row a RecyclerView carries as its row 0 is position -1 here.
 */
final class Lv {

    private Lv() { }

    /** A song list of either kind; anything else is not one. */
    static boolean is(View v) {
        return v instanceof ListView || v instanceof RecyclerView && SongRows.of((RecyclerView) v) != null;
    }

    static MyBaseAdapter model(View v) {
        if (v instanceof ListView) {
            ListAdapter la = ((ListView) v).getAdapter();
            return la instanceof MyBaseAdapter ? (MyBaseAdapter) la : null;
        }
        SongRows r = rows(v);
        return r == null ? null : r.model();
    }

    private static SongRows rows(View v) {
        return v instanceof RecyclerView ? SongRows.of((RecyclerView) v) : null;
    }

    private static LinearLayoutManager lm(View v) {
        RecyclerView.LayoutManager m = ((RecyclerView) v).getLayoutManager();
        return m instanceof LinearLayoutManager ? (LinearLayoutManager) m : null;
    }

    /** The first row attached (it may be wholly above the edge); -1 = the Shuffle row. */
    static int first(View v) {
        if (v instanceof ListView) return ((ListView) v).getFirstVisiblePosition();
        RecyclerView rv = (RecyclerView) v;
        if (rv.getChildCount() == 0) return 0;
        return rv.getChildLayoutPosition(rv.getChildAt(0)) - SongRows.heads(rv);
    }

    static int last(View v) {
        if (v instanceof ListView) return ((ListView) v).getLastVisiblePosition();
        RecyclerView rv = (RecyclerView) v;
        int n = rv.getChildCount();
        if (n == 0) return -1;
        return rv.getChildLayoutPosition(rv.getChildAt(n - 1)) - SongRows.heads(rv);
    }

    /** The row of position {@code pos} if it is attached, else null. */
    static View row(View v, int pos) {
        if (v instanceof ListView) {
            ListView lv = (ListView) v;
            int i = pos - lv.getFirstVisiblePosition();
            return i < 0 || i >= lv.getChildCount() ? null : lv.getChildAt(i);
        }
        LinearLayoutManager l = lm(v);
        return l == null ? null : l.findViewByPosition(pos + SongRows.heads((RecyclerView) v));
    }

    /** Where the visible list begins. */
    static int top(View v) {
        if (v instanceof ListView) return Head.top((ListView) v);
        RecyclerView rv = (RecyclerView) v;
        return SongRows.top(rv, SongRows.heads(rv));
    }

    static int bottom(View v) {
        return v.getHeight() - v.getPaddingBottom();
    }

    /** The row's top at {@code y}. */
    static void place(View v, int pos, int y) {
        if (v instanceof ListView) {
            Head.place((ListView) v, pos, y);
            return;
        }
        RecyclerView rv = (RecyclerView) v;
        LinearLayoutManager l = lm(v);
        if (l == null) return;
        Wheel.Glider.stop();
        rv.stopScroll();
        int h = SongRows.heads(rv);
        SongRows.moving(rv, pos + h, y);
        l.scrollToPositionWithOffset(pos + h, y - rv.getPaddingTop());
    }

    /** Against the top edge with the Shuffle row scrolled off. */
    static void pin(View v, int pos) {
        if (v instanceof ListView) Head.selectPinned((ListView) v, pos);
        else place(v, pos, SongRows.pinTop((RecyclerView) v));
    }

    /** The list at its start, the Shuffle row fully shown. */
    static void rest(View v) {
        if (v instanceof ListView) Head.rest((ListView) v);
        else place(v, -SongRows.heads((RecyclerView) v), v.getPaddingTop());
    }

    /** The first row with anything of it below {@code edge}; the Shuffle row does not count. */
    static int firstShown(View v, int edge) {
        if (v instanceof ListView) {
            ListView lv = (ListView) v;
            return Wheel.firstShown(lv, lv.getFirstVisiblePosition(), edge);
        }
        RecyclerView rv = (RecyclerView) v;
        int h = SongRows.heads(rv);
        for (int i = 0; i < rv.getChildCount(); i++) {
            View c = rv.getChildAt(i);
            int p = rv.getChildLayoutPosition(c) - h;
            if (p >= 0 && c.getBottom() > edge) return p;
        }
        return first(v);
    }

    /** {@code Other.gotoAdapter}, for either kind. */
    static void go(View v, MyBaseAdapter a, int to) {
        if (v instanceof ListView) Other.INSTANCE.gotoAdapter((ListView) v, a, to);
        else if (v instanceof RecyclerView) SongRows.go((RecyclerView) v, a, to);
    }

    /** {@code setSelection}, for either kind. */
    static void select(View v, int pos) {
        if (v instanceof ListView) ((ListView) v).setSelection(pos);
        else if (v instanceof RecyclerView) SongRows.select((RecyclerView) v, pos);
    }

    /** How far the list stands from its start, in px; -1 = its start is not attached. */
    static int scrolled(View v) {
        if (v instanceof ListView) {
            ListView lv = (ListView) v;
            if (lv.getFirstVisiblePosition() != 0 || lv.getChildCount() == 0) return -1;
            View c0 = lv.getChildAt(0);
            return c0 == null ? -1 : Math.max(0, lv.getPaddingTop() - c0.getTop());
        }
        LinearLayoutManager l = lm(v);
        View c0 = l == null ? null : l.findViewByPosition(0);
        return c0 == null ? -1 : Math.max(0, v.getPaddingTop() - c0.getTop());
    }

    /** The screen's Shuffle row: a sibling of a ListView, row 0 of a RecyclerView. */
    static ShufflePlaylistItemView shuffle(View v) {
        SongRows r = rows(v);
        if (r != null) return r.shuffle();
        Object p = v.getParent();
        if (!(p instanceof View)) return null;
        View s = ((View) p).findViewById(R.id.spv);
        return s instanceof ShufflePlaylistItemView ? (ShufflePlaylistItemView) s : null;
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
