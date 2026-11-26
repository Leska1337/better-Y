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
     * May the cursor go round? True also records the wrap for {@link #takeWrap}. With animations
     * on, only once the end has come to rest: a click past it while the step there still moves is
     * swallowed, and the highlight bounces against the end ({@link #swallow}).
     */
    public static boolean wrap() {
        if (!on()) {
            edge();
            return false;
        }
        if (swallow()) return false;
        wrapped = true;
        wraps++;
        postWrap = true;
        wrappedAt = android.os.SystemClock.uptimeMillis();
        wrapTime = wrappedAt;
        return true;
    }

    private static boolean wrapped;
    private static long wrappedAt;
    /** Every wrap counted, for whoever must tell a move round the end from an ordinary one later on. */
    static int wraps;

    /** The last click's answer, and when: asked again within SAME_CLICK_MS it is the same click. */
    private static boolean swallowed;
    private static long swallowAt;
    /** Asked again within this, it is the same click (a screen that asks twice per step). */
    private static final long SAME_CLICK_MS = 25L;

    /** True = the click past the end is lost: the step to the end still moves on screen. */
    static boolean swallow() {
        long now = android.os.SystemClock.uptimeMillis();
        if (swallowed && now - swallowAt < SAME_CLICK_MS) return true;
        boolean rest = settled(now);
        clickAt = now;
        if (!Anim.on() || rest) {
            swallowed = false;
            return false;
        }
        swallowed = true;
        swallowAt = now;
        bump();
        return true;
    }

    // ---- the end at rest, and the bounce against it -----------------------------------------

    /** The last frame of a highlight or rows moving to a step (not a bounce), and the last step. */
    private static long animAt, movedAt;
    /** Longer than a frame (27 ms): no frame since means the motion is over. */
    private static final long SETTLE_MS = 40L;

    /** From each animation's frame while it moves to a step: Bar, the grid's frame, Glider. */
    public static void animating() {
        animAt = android.os.SystemClock.uptimeMillis();
    }

    /**
     * The wheel has stood still this long before the click that goes round: a turning wheel,
     * however slow, stays against the end. Clicks against it count, swallowed or not.
     */
    public static final long STOP_MS = 300L;
    /** The last click at the end, swallowed or let round. */
    private static long clickAt;

    private static boolean settled(long now) {
        return now - animAt > SETTLE_MS && now - Math.max(movedAt, clickAt) > STOP_MS;
    }

    /** What shows a swallowed click: the highlight drawn last pushes past the end and springs back. */
    public interface Bumper {
        /** {@code dir} +1 past the last row, -1 past the first. */
        void bump(int dir);

        /** Where the cursor stands, and of how many. */
        int at();

        int count();
    }

    private static java.lang.ref.WeakReference bumper;

    /** From a highlight's draw: it is the one on screen. */
    public static void bumper(Bumper b) {
        if (bumper == null || bumper.get() != b) bumper = new java.lang.ref.WeakReference(b);
    }

    private static long edgeAt;

    /** A click against an end with going round off: the bounce alone, once per click. */
    private static void edge() {
        if (!Anim.on()) return;
        long now = android.os.SystemClock.uptimeMillis();
        if (now - edgeAt < SAME_CLICK_MS) return;
        edgeAt = now;
        bump();
    }

    private static void bump() {
        Bumper b = bumper == null ? null : (Bumper) bumper.get();
        if (b == null) return;
        int n = b.count();
        if (n > 0) b.bump(b.at() < n / 2 ? -1 : 1);
    }

    /** A bounce's speed, px/s: on the lists' spring (OMEGA 30) it peaks about 3 px out. */
    public static final float BUMP_V = 240f;

    /** A wrap just taken, and when: the cursor stands still for {@link #PAUSE_MS} after it. */
    private static boolean postWrap;
    private static long wrapTime;

    /** The stop at the other end after a wrap (animations on); clicks inside it are lost. */
    public static final long PAUSE_MS = 100L;

    /** The main menu went round by its own code. */
    static void noteWrap() {
        wraps++;
        postWrap = true;
        wrapTime = android.os.SystemClock.uptimeMillis();
    }

    /** Top of a wheel click: true = still within the stop after a wrap, the click is lost. */
    static boolean afterWrap() {
        if (!postWrap) return false;
        if (Anim.on() && android.os.SystemClock.uptimeMillis() - wrapTime < PAUSE_MS) return true;
        postWrap = false;
        return false;
    }

    /** A cursor moved by the wheel off the row it stood on: going round waits for it to rest. */
    static void moved() {
        swallowed = false;
        movedAt = android.os.SystemClock.uptimeMillis();
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

    /** A column of rows that is not a list (Date and time, {@code clockwise}/{@code antiClockwise}): the next row. */
    public static int rows(int pos, int dir, int n) {
        int p = step(pos, dir, n);
        if (p != pos) moved();
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
            if (a == null) return;
            int n = count(a);
            if (n <= 1) return;
            int m = a.getMark();
            if (!on()) {
                if (dir > 0 ? m >= n - 1 : m <= 0) edge();
                return;
            }
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
        // not round yet: the click is lost against the end and the bar bounces
        if (!wrap()) return true;
        int from = cursorRow(lv, a);
        spv.onClockwise();                 // stock's own exit from the row
        toRow(lv, a, n - 1, from);
        return true;
    }

    /** From {@code Wheel.rows}: up from the Shuffle row with nothing to go round to, the bounce against the top. */
    static void aboveShuffle() {
        if (!on()) edge();
    }

    /** From {@code Wheel.rows} after a step clamped at {@code old}. True when the cursor went round. */
    static boolean list(View lv, MyBaseAdapter a, int type, int old) {
        if (!on()) {
            edge();
            return false;
        }
        int n = a.getCount();
        if (n <= 0) return false;
        ShufflePlaylistItemView spv = Lv.shuffle(lv);
        boolean row = spv != null && spv.getVisibility() == View.VISIBLE
                && a.getSelectedIndexList().isEmpty();       // no Shuffle row in MultiSelect
        int from = cursorRow(lv, a);
        if (type == 1) {
            if (old != n - 1) return false;
            if (!wrap()) return false;
            if (row) {
                // Through stock's own entry to the row. The screen's onClockwise that follows
                // would take it straight back off, so it is told to leave it (keep).
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
        if (!wrap()) return false;
        toRow(lv, a, n - 1, from);
        return true;
    }

    /** The cursor as a row of the list: the Shuffle row is its row 0 ({@code SongRows}). */
    private static int cursorRow(View lv, MyBaseAdapter a) {
        return a.getPosition() + (lv instanceof RecyclerView ? SongRows.heads((RecyclerView) lv) : 0);
    }

    /** Once {@link #wrap} has let the cursor round. */
    private static void toRow(View lv, MyBaseAdapter a, int pos, int from) {
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
