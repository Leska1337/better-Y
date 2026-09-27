package com.innioasis.ipp;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;

import androidx.recyclerview.widget.RecyclerView;

import com.innioasis.fm.MenuActivity;
import com.innioasis.music.adapter.MyBaseAdapter;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.activity.BluetoothActivity;
import com.innioasis.y1.activity.EqActivity;
import com.innioasis.y1.activity.LanguageActivity;
import com.innioasis.y1.activity.PhotosActivity;
import com.innioasis.y1.activity.SettingActivity;
import com.innioasis.y1.activity.WallpaperActivity;
import com.innioasis.y1.activity.WallpaperListActivity;
import com.innioasis.y1.activity.theme.ThemeListActivity;
import com.innioasis.y1.activity.video.VideoListActivity;
import com.innioasis.y1.base.BaseActivity;
import com.innioasis.y1.databinding.ActivityBlutoothBinding;
import com.innioasis.y1.view.ShufflePlaylistItemView;

/**
 * Loop scrolling: past the last row the wheel comes back to the first, and before the first it
 * goes round to the last — what the main menu has always done, for every list. Setting
 * {@code loop_scroll} in [Menu], off by default. It wraps on every step, fast spin included, but
 * going round ends the wheel's acceleration: the other end is reached, never flown past.
 *
 * There is no single place the cursor steps: ListView lists go through {@code Wheel.list}
 * ({@link #list}), the two RecyclerView adapter families through their own
 * {@code toNext}/{@code toPrevious} ({@link #on} tested there), and the menu screens that keep
 * their cursor in {@code BaseActivity.mark} through {@link #mark}, called first thing in their
 * {@code clockwise}/{@code antiClockwise}. The screens of our own ask {@link #step}.
 *
 * A song list's Shuffle row is part of the circle: down from the last track lands on it, up from
 * it lands on the last track.
 */
public final class Loop {

    public static final String KEY = "loop_scroll";

    private Loop() {}

    public static boolean on() {
        Context c = Y1Application.Companion.getAppContext();
        return Prefs.on(c, KEY);
    }

    /**
     * Asked by a list standing at an end: may the cursor go round? True means it is about to, and
     * that is noted — a click that wraps ends the wheel's acceleration ({@link #takeWrap}).
     */
    public static boolean wrap() {
        if (!on()) return false;
        wrapped = true;
        return true;
    }

    private static boolean wrapped;

    /**
     * From {@code SpeedUtil.runMultipleTimes}, before and after each extra step of a fast click:
     * true once after a list has gone round. The burst stops there and the acceleration starts
     * over, so going round an end is always one row at a time — the list lands on its other end
     * and does not fly on past it.
     */
    public static boolean takeWrap() {
        if (!wrapped) return false;
        wrapped = false;
        return true;
    }

    /** The row after {@code pos} (or before, {@code dir < 0}) in a list of {@code n}. */
    public static int step(int pos, int dir, int n) {
        if (n <= 0) return pos;
        int p = pos + (dir > 0 ? 1 : -1);
        if (p >= n) return wrap() ? 0 : n - 1;
        if (p < 0) return wrap() ? n - 1 : 0;
        return p;
    }

    /**
     * Where going round backwards lands on the icon strip of Photos: its last entry — except that
     * with {@code isD} set the dialog never lets the cursor onto entry 4 (a step down onto it is
     * put back to 3), so 3 is the last one it can stand on.
     */
    public static int lastOfStrip(int size, boolean isD) {
        int n = size - 1;
        if (isD && n == 4) n = 3;
        return n < 0 ? 0 : n;
    }

    // ------------------------------------------------------------------ mark-driven menu screens

    /**
     * First thing in a menu screen's {@code clockwise}/{@code antiClockwise}. At an end of the list
     * the cursor is put ONE PAST it (-1 below the first row, {@code n} beyond the last), and the
     * screen's own step then carries it onto the other end — so everything the screen does after a
     * step (the panel, the preview, its Wheel.follow) runs exactly as for any other click. The row
     * the cursor left is then unknown to Wheel.follow, which answers with a full repaint.
     */
    public static void mark(BaseActivity a, int dir) {
        try {
            if (a == null || !on()) return;
            int n = count(a);
            if (n <= 1) return;
            int m = a.getMark();
            if (dir > 0 && m >= n - 1 && wrap()) a.setMark(-1);
            else if (dir < 0 && m <= 0 && wrap()) a.setMark(n);
        } catch (Throwable t) {
            // a wheel click must never take the screen down
        }
    }

    /** How many rows the screen's cursor runs over; 0 when it is not one of ours to wrap. */
    private static int count(BaseActivity a) {
        if (a instanceof BluetoothActivity) {
            // The cursor runs over the On/Off row plus both device lists: 0..my+other.
            ActivityBlutoothBinding vb = (ActivityBlutoothBinding) a.getVb();
            return 1 + items(vb.recyclerMyDevice) + items(vb.recyclerOtherDevice);
        }
        if (a instanceof SettingActivity || a instanceof LanguageActivity
                || a instanceof EqActivity || a instanceof PhotosActivity
                || a instanceof ThemeListActivity || a instanceof WallpaperActivity
                || a instanceof WallpaperListActivity || a instanceof VideoListActivity
                || a instanceof MenuActivity) {
            RecyclerView rv = firstList(a.getVb().getRoot());
            // A list that is not on screen is not what the wheel is driving: the theme gallery
            // hides its grid while a theme is shown full screen, and the wheel does nothing there.
            if (rv == null || !rv.isShown()) return 0;
            return items(rv);
        }
        return 0;
    }

    private static int items(RecyclerView rv) {
        if (rv == null || rv.getAdapter() == null) return 0;
        return rv.getAdapter().getItemCount();
    }

    /** The screen's list: the first RecyclerView in its tree. Each of these screens has one. */
    private static RecyclerView firstList(View v) {
        if (v instanceof RecyclerView) return (RecyclerView) v;
        if (!(v instanceof ViewGroup)) return null;
        ViewGroup g = (ViewGroup) v;
        for (int i = 0; i < g.getChildCount(); i++) {
            RecyclerView r = firstList(g.getChildAt(i));
            if (r != null) return r;
        }
        return null;
    }

    // ------------------------------------------------------------------ ListView lists

    /** The Shuffle row that has just been given the cursor by a wrap; see {@link #keep}. */
    private static ShufflePlaylistItemView kept;

    /**
     * From {@code Wheel.list}, BEFORE the step: the one move a step cannot express — up from the
     * Shuffle row, where the adapter is parked at -1 — goes round to the last track. True when
     * handled.
     */
    static boolean fromShuffle(ListView lv, MyBaseAdapter a, int type) {
        if (type == 1 || a.getPosition() >= 0 || !on()) return false;
        ShufflePlaylistItemView spv = shuffleRow(lv);
        if (spv == null || !spv.isSelect()) return false;
        int n = a.getCount();
        if (n <= 0) return false;
        wrap();
        spv.onClockwise();                 // stock's own exit from the row
        toRow(lv, a, n - 1);
        return true;
    }

    /**
     * From {@code Wheel.list}, when the step was clamped at an end ({@code old} is where it
     * stayed). True when the cursor went round.
     */
    static boolean list(ListView lv, MyBaseAdapter a, int type, int old) {
        if (!on()) return false;
        int n = a.getCount();
        if (n <= 0) return false;
        ShufflePlaylistItemView spv = shuffleRow(lv);
        boolean row = spv != null && spv.getVisibility() == View.VISIBLE
                && a.getSelectedIndexList().isEmpty();       // no Shuffle row in MultiSelect
        if (type == 1) {
            if (old != n - 1) return false;
            if (row) {
                // Onto the Shuffle row, by stock's own entry to it: with the adapter at row 0
                // and "came from row 0" recorded, onAntiClockwise selects the row, parks the
                // adapter at -1 and repaints. The screen's onClockwise, which follows this call
                // and would take the row straight back off, is told to leave it (keep).
                wrap();
                a.setPosition(0);
                spv.recordOldPosition();
                spv.onAntiClockwise(false);
                kept = spv;
                a.notifyDataSetChanged();
                Head.rest(lv);
                return true;
            }
            toRow(lv, a, 0);
            return true;
        }
        if (old != 0) return false;
        if (row) return false;             // up from track 1 is the Shuffle row, as ever
        if (n == 1) return false;
        toRow(lv, a, n - 1);
        return true;
    }

    private static void toRow(ListView lv, MyBaseAdapter a, int pos) {
        wrap();
        a.setPosition(pos);
        a.notifyDataSetChanged();
        if (pos == 0) Head.rest(lv);       // the start of the list, Shuffle row showing
        else Head.selectPinned(lv, pos);   // the list clamps it to its bottom edge
    }

    /**
     * From the top of {@code ShufflePlaylistItemView.onClockwise}: true when this row has just been
     * given the cursor by a wrap, and must keep it through the call that follows every step down.
     */
    public static boolean keep(ShufflePlaylistItemView spv) {
        if (spv == null || spv != kept) return false;
        kept = null;
        return true;
    }

    /** The Shuffle row beside this list, if the screen has one. */
    private static ShufflePlaylistItemView shuffleRow(ListView lv) {
        Object p = lv.getParent();
        if (!(p instanceof View)) return null;
        View v = ((View) p).findViewById(R.id.spv);
        return v instanceof ShufflePlaylistItemView ? (ShufflePlaylistItemView) v : null;
    }
}
