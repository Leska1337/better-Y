package com.innioasis.ipp;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;

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
 * Loop scrolling ("loop_scroll"): past either end of any list the wheel goes round to the other.
 * Going round ends the wheel's acceleration, so the other end is reached, never flown past. The
 * Shuffle row is part of the circle. Entry points, one per way a cursor steps: {@link #list} for
 * the music lists, {@link #on} in the other RecyclerView adapters' toNext/toPrevious,
 * {@link #mark} for mark-driven menu screens, {@link #step} for our own screens.
 */
public final class Loop {

    public static final String KEY = "loop_scroll";

    private Loop() {}

    public static boolean on() {
        Context c = Y1Application.Companion.getAppContext();
        return Prefs.on(c, KEY);
    }

    /**
     * May the cursor go round? True also records the wrap for {@link #takeWrap}. Under a fast
     * wheel (animations on) the first click past the end is swallowed and the next one goes round;
     * a slow wheel goes round at once.
     */
    public static boolean wrap() {
        if (!on()) return false;
        if (swallow()) return false;
        wrapped = true;
        wraps++;
        postWrap = true;
        wrappedAt = android.os.SystemClock.uptimeMillis();
        return true;
    }

    private static boolean wrapped;
    private static long wrappedAt;
    /** Every wrap counted, for whoever must tell a move round the end from an ordinary one later on. */
    static int wraps;

    /** Clicks closer than this are a fast wheel. */
    private static final long FAST_MS = 130L;
    /** This stay at the end has had its click swallowed; a step off the end clears it. */
    private static boolean swallowed;
    private static long swallowAt;
    /** Asked again within this, it is the same click (a screen that asks twice per step). */
    private static final long SAME_CLICK_MS = 25L;

    /** True = the click past the end is lost: the first one under a fast wheel. */
    static boolean swallow() {
        long now = android.os.SystemClock.uptimeMillis();
        if (swallowed && now - swallowAt < SAME_CLICK_MS) return true;
        if (!Anim.on() || swallowed || now - Wheel.stepAt >= FAST_MS) {
            swallowed = false;
            return false;
        }
        swallowed = true;
        swallowAt = now;
        return true;
    }

    /** A wrap just taken: the next click, if the wheel is still fast, is lost too. */
    private static boolean postWrap;

    /** The main menu went round by its own code. */
    static void noteWrap() {
        wraps++;
        postWrap = true;
    }

    /** Top of a wheel click: true = the first click after a wrap under a fast wheel, lost. */
    static boolean afterWrap() {
        if (!postWrap) return false;
        postWrap = false;
        return Anim.on() && android.os.SystemClock.uptimeMillis() - Wheel.stepAt < FAST_MS;
    }

    /** A cursor moved by the wheel ({@code Wheel.follow}) off the row it stood on. */
    static void moved() {
        swallowed = false;
    }

    /** For {@code Wheel.follow}, once: the step it repaints went round, within this key event. */
    static boolean justWrapped() {
        boolean w = android.os.SystemClock.uptimeMillis() - wrappedAt < JUST_MS;
        wrappedAt = 0;
        return w;
    }

    private static final long JUST_MS = 150L;

    /** From {@code SpeedUtil.runMultipleTimes}: true once after a wrap, which ends the burst. */
    public static boolean takeWrap() {
        if (!wrapped) return false;
        wrapped = false;
        return true;
    }

    public static int step(int pos, int dir, int n) {
        if (n <= 0) return pos;
        int p = pos + (dir > 0 ? 1 : -1);
        if (p >= n) return wrap() ? 0 : n - 1;
        if (p < 0) return wrap() ? n - 1 : 0;
        return p;
    }

    /** The last entry of the Photos icon strip; with {@code isD} the cursor never stands on 4. */
    public static int lastOfStrip(int size, boolean isD) {
        int n = size - 1;
        if (isD && n == 4) n = 3;
        return n < 0 ? 0 : n;
    }

    /**
     * First thing in a menu screen's clockwise/antiClockwise: at an end the cursor is put one PAST
     * it, and the screen's own step carries it onto the other end, so everything after the step
     * runs as for any click.
     */
    public static void mark(BaseActivity a, int dir) {
        try {
            if (a == null || !on()) return;
            int n = count(a);
            if (n <= 1) return;
            int m = a.getMark();
            // not round while the rows still glide to this end under a travelling bar
            if (Bar.holds(firstList(a.getVb().getRoot()), dir)) return;
            if (dir > 0 && m >= n - 1 && wrap()) a.setMark(-1);
            else if (dir < 0 && m <= 0 && wrap()) a.setMark(n);
        } catch (Throwable t) {
        }
    }

    /** Rows the cursor runs over; 0 for a screen that does not wrap. */
    private static int count(BaseActivity a) {
        if (a instanceof BluetoothActivity) {
            // The On/Off row plus both device lists.
            ActivityBlutoothBinding vb = (ActivityBlutoothBinding) a.getVb();
            return 1 + items(vb.recyclerMyDevice) + items(vb.recyclerOtherDevice);
        }
        if (a instanceof SettingActivity || a instanceof LanguageActivity
                || a instanceof EqActivity || a instanceof PhotosActivity
                || a instanceof ThemeListActivity || a instanceof WallpaperActivity
                || a instanceof WallpaperListActivity || a instanceof VideoListActivity
                || a instanceof MenuActivity) {
            RecyclerView rv = firstList(a.getVb().getRoot());
            // The theme gallery hides its grid while a theme is shown full screen.
            if (rv == null || !rv.isShown()) return 0;
            return items(rv);
        }
        return 0;
    }

    private static int items(RecyclerView rv) {
        if (rv == null || rv.getAdapter() == null) return 0;
        return rv.getAdapter().getItemCount();
    }

    /** Each of these screens has exactly one. */
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

    /** The Shuffle row a wrap has just given the cursor; see {@link #keep}. */
    private static ShufflePlaylistItemView kept;

    /**
     * From {@code Wheel.list}/{@code Wheel.rows}, before the step: up from the Shuffle row (adapter
     * parked at -1) to the last track, the one move a step cannot express. True when handled.
     */
    static boolean fromShuffle(View lv, MyBaseAdapter a, int type) {
        if (type == 1 || a.getPosition() >= 0 || !on()) return false;
        ShufflePlaylistItemView spv = Lv.shuffle(lv);
        if (spv == null || !spv.isSelect()) return false;
        int n = a.getCount();
        if (n <= 0) return false;
        wrap();
        int from = cursorRow(lv, a);
        spv.onClockwise();                 // stock's own exit from the row
        toRow(lv, a, n - 1, from);
        return true;
    }

    /** From {@code Wheel.rows} after a step clamped at {@code old}. True when the cursor went round. */
    static boolean list(View lv, MyBaseAdapter a, int type, int old) {
        if (!on()) return false;
        int n = a.getCount();
        if (n <= 0) return false;
        ShufflePlaylistItemView spv = Lv.shuffle(lv);
        boolean row = spv != null && spv.getVisibility() == View.VISIBLE
                && a.getSelectedIndexList().isEmpty();       // no Shuffle row in MultiSelect
        int from = cursorRow(lv, a);
        if (type == 1) {
            if (old != n - 1) return false;
            if (row) {
                // Through stock's own entry to the row. The screen's onClockwise that follows
                // would take it straight back off, so it is told to leave it (keep).
                wrap();
                a.setPosition(0);
                spv.recordOldPosition();
                spv.onAntiClockwise(false);
                kept = spv;
                a.notifyDataSetChanged();
                if (lv instanceof RecyclerView) Wheel.follow((RecyclerView) lv, from, 0, ((RecyclerView) lv).getAdapter());
                return true;
            }
            toRow(lv, a, 0, from);
            return true;
        }
        if (old != 0) return false;
        if (row) return false;             // up from track 1 is the Shuffle row, as ever
        if (n == 1) return false;
        toRow(lv, a, n - 1, from);
        return true;
    }

    /** The cursor as a row of the list: the Shuffle row is its row 0 ({@code SongRows}). */
    private static int cursorRow(View lv, MyBaseAdapter a) {
        return a.getPosition() + (lv instanceof RecyclerView ? SongRows.heads((RecyclerView) lv) : 0);
    }

    private static void toRow(View lv, MyBaseAdapter a, int pos, int from) {
        wrap();
        a.setPosition(pos);
        a.notifyDataSetChanged();
        // round the end: Wheel.follow stands the rows and the bar on it at once
        if (lv instanceof RecyclerView) {
            Wheel.follow((RecyclerView) lv, from, pos + SongRows.heads((RecyclerView) lv), ((RecyclerView) lv).getAdapter());
        }
    }

    /** From the top of {@code ShufflePlaylistItemView.onClockwise}: true once after {@link #list} wrapped onto it. */
    public static boolean keep(ShufflePlaylistItemView spv) {
        if (spv == null || spv != kept) return false;
        kept = null;
        return true;
    }
}
