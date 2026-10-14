package com.innioasis.ipp;

import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListAdapter;
import android.widget.ListView;

import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.innioasis.music.adapter.MyBaseAdapter;
import com.innioasis.y1.R;
import com.innioasis.y1.activity.SettingActivity;

import java.lang.ref.WeakReference;

/**
 * Wheel navigation: ListView lists ({@link #list}) and RecyclerView ones ({@link #follow}). Stock
 * notified the adapter (and smooth-scrolled) on every step; here a step inside the visible window
 * rebinds just the two rows whose highlight changes, in place, and scrolls only when the row is
 * cut off — instantly.
 */
public final class Wheel {

    /**
     * Whether the wheel accelerates here ({@code BaseActivity.getEnableSpeedClockwise}): only on
     * lists that can run to hundreds of rows. On a short menu it flies past the target.
     */
    public static boolean fast(com.innioasis.y1.base.BaseActivity a) {
        return a instanceof com.innioasis.music.SongListActivity
                || a instanceof com.innioasis.music.AlbumsActivity
                || a instanceof com.innioasis.music.ArtistsActivity
                || a instanceof com.innioasis.music.GenresActivity
                || a instanceof com.innioasis.music.FilesActivity
                || a instanceof com.innioasis.music.PlaylistsActivity
                || a instanceof com.innioasis.music.PlayListActivity
                || a instanceof com.innioasis.music.SearchActivity
                || a instanceof com.innioasis.y1.activity.video.VideoListActivity
                || a instanceof com.innioasis.y1.activity.video.SearchVideoActivity
                || a instanceof com.innioasis.y1.activity.AllAudiobooksActivity
                || a instanceof com.innioasis.y1.activity.PlayerActivity
                || a instanceof com.innioasis.y1.activity.BookMarkActivity;
    }

    private static WeakReference lastRv;
    private static int lastPos = -1;
    /** The adapter {@link #lastPos} belongs to: a screen may swap adapters in one RecyclerView. */
    private static WeakReference lastAdapter;
    /** The RecyclerView set up by {@link #follow}. */
    private static WeakReference tuned;
    /** ...and its layout manager: the prefetch flag is the manager's. */
    private static WeakReference tunedLm;

    // ListView lists: replaces the body of Other.listViewScroll. Stock notified the adapter per
    // step, so ListView re-filled every visible row to move a highlight. Inside the window nothing
    // is notified: the two rows are rebound in place, POSTED, so a burst repaints twice, not 2N
    // times. What a click still costs is the rows' measure and layout — profiled, and the rejected
    // alternatives: skill ipp-perf-profiling.

    private static WeakReference pendLv;
    private static int pendFrom;
    // A flag of its own, NOT pendFrom < 0: the adapter is parked at -1 on the Shuffle row, a valid
    // "previous row".
    private static boolean pendOn;
    private static final Repaint REPAINT = new Repaint();

    public static void list(ListView lv, int type) {
        try {
            if (lv == null) return;
            ListAdapter la = lv.getAdapter();
            if (!(la instanceof MyBaseAdapter)) return;
            MyBaseAdapter a = (MyBaseAdapter) la;

            // The cursor is the user's now (Follow) — here, where it moves, not in the key handler
            // (in the player the wheel is volume); before both early returns below.
            Follow.touched(lv, a);

            // fast spin: by letter. drop() first, so a pending repaint cannot land on the jump
            if (Alpha.step(lv, a, type)) {
                drop();
                return;
            }

            // the one thing every list has, for screens that swap adapters (see Status)
            Status.check(lv);

            int first = lv.getFirstVisiblePosition();
            int last = lv.getLastVisiblePosition();
            int old = a.getPosition();

            // Loop scrolling: up from the Shuffle row goes round to the last track...
            if (Loop.fromShuffle(lv, a, type)) {
                drop();
                return;
            }
            if (type == 1) a.toNext(); else a.toPrevious();
            int now = a.getPosition();
            if (now == old) {                              // clamped at an end
                // ...and a step past either end comes back at the other one.
                if (Loop.list(lv, a, type, old)) drop();
                return;
            }

            // first/last visible both count PARTIAL rows: down scrolls at `now >= last`, up only
            // when the row landed on is actually cut off. Landing on track 1 does NOT bring the
            // Shuffle row back — it returns when it becomes the cursor (Head.reveal).
            boolean scroll = (type == 1)
                    ? (now >= last)
                    : (now < first || cutAtTop(lv, now, first));
            if (scroll) {
                drop();
                // Stock scrolls down by whole rows, right only while rows are equal. A multi-disc
                // album's are not, and there alone the window moves by PIXELS.
                boolean vary = type == 1 && Disc.variableRows(a);
                int h = vary ? rowHeight(lv, now, first) : 0;
                // the top edge is Head.top, not paddingTop
                int lt = Head.top(lv);
                int lb = lv.getHeight() - lv.getPaddingBottom();
                a.notifyDataSetChanged();
                if (vary && h > 0 && h <= lb - lt) {
                    // exact, so no correcting pass: a second placement flickers
                    Head.place(lv, now, lb - h);
                } else if (type == 1) {
                    // the Shuffle row, while showing, is the first row's worth to go
                    int target = now - last + firstShown(lv, first, lt) + 1;
                    if (Head.headerShowing(lv)) target--;
                    if (target < 0) target = 0;
                    Head.selectPinned(lv, target);
                    if (vary) postFit(lv, now);
                } else {
                    Head.selectPinned(lv, now);
                    if (vary) postFit(lv, now);
                }
                return;
            }

            if (skipFast(a)) {                             // cannot be rebound in place
                a.notifyDataSetChanged();
                return;
            }

            arm(lv, old);
        } catch (Throwable t) {
        }
    }

    /** Rebind the burst's first and last rows once; {@code old} is kept from the first step. */
    private static void arm(ListView lv, int old) {
        if (!pendOn || pendLv == null || pendLv.get() != lv) {
            pendLv = new WeakReference(lv);
            pendFrom = old;                                // where this burst started
            pendOn = true;
            lv.post(REPAINT);
        }
    }

    private static void drop() {
        pendLv = null;
        pendFrom = 0;
        pendOn = false;
    }

    /**
     * The first row with anything of it on screen — not {@code getFirstVisiblePosition()}: a row
     * wholly above the edge stays attached, and counting it leaves every step one row short.
     */
    static int firstShown(ListView lv, int first, int edge) {
        int n = lv.getChildCount();
        for (int i = 0; i < n; i++) {
            View c = lv.getChildAt(i);
            if (c != null && c.getBottom() > edge) return first + i;
        }
        return first;
    }

    /** The row at {@code pos} is clipped by the top edge; an unknown row is false. */
    static boolean cutAtTop(ListView lv, int pos, int first) {
        int i = pos - first;
        if (i < 0 || i >= lv.getChildCount()) return false;
        View child = lv.getChildAt(i);
        if (child == null) return false;
        return child.getTop() < Head.top(lv);
    }

    /**
     * The landed row's height in a list of unequal rows: read off it, or for a row below the window
     * worked out from the bottom row — rows differ only by the disc strip, so that is exact.
     */
    private static int rowHeight(ListView lv, int pos, int first) {
        View c = lv.getChildAt(pos - first);
        if (c != null) return c.getHeight();
        int n = lv.getChildCount();
        if (n == 0) return 0;
        View bottom = lv.getChildAt(n - 1);
        if (bottom == null) return 0;
        int strip = Disc.stripPx(bottom);
        int base = bottom.getHeight() - (Disc.startsDisc(first + n - 1) ? strip : 0);
        return base + (Disc.startsDisc(pos) ? strip : 0);
    }

    private static WeakReference fitLv;
    private static int fitPos = -1;
    private static final Fit FIT = new Fit();

    private static void postFit(ListView lv, int pos) {
        fitLv = new WeakReference(lv);
        fitPos = pos;
        lv.removeCallbacks(FIT);
        lv.post(FIT);
    }

    /** Checks the landing after the layout and corrects it only when it is actually wrong. */
    static final class Fit implements Runnable {
        public void run() {
            try {
                Object o = fitLv == null ? null : fitLv.get();
                int pos = fitPos;
                fitLv = null;
                fitPos = -1;
                if (!(o instanceof ListView) || pos < 0) return;
                ListView lv = (ListView) o;
                View c = lv.getChildAt(pos - lv.getFirstVisiblePosition());
                if (c == null) return;
                int top = Head.top(lv);
                int bottom = lv.getHeight() - lv.getPaddingBottom();
                if (c.getHeight() > bottom - top) return;
                if (c.getBottom() > bottom) {
                    Head.place(lv, pos, bottom - c.getHeight());
                } else if (c.getTop() < top) {
                    Head.place(lv, pos, top);
                }
            } catch (Throwable t) {
            }
        }
    }

    private static WeakReference restRv;
    private static int restPos = -1;
    private static boolean busy;
    private static final Rest REST = new Rest();
    private static final Now NOW = new Now();

    /** The panel beside the list is painted at most once per this many ms while the wheel turns. */
    private static final int PANEL_MS = 70;
    private static long panelAt;
    private static boolean painting;

    /**
     * The wheel is moving: the panel beside the list is painted by {@link Now} after the key event
     * (throttled to {@link #PANEL_MS}), and by {@link Rest} at the end of the burst.
     */
    private static void postRest(RecyclerView rv, int pos) {
        restRv = new WeakReference(rv);
        restPos = pos;
        busy = true;
        rv.removeCallbacks(REST);
        rv.postDelayed(REST, PANEL_MS);
        rv.removeCallbacks(NOW);
        rv.post(NOW);
    }

    private static WeakReference panelHost;
    private static String panelTitle;

    /**
     * Top of {@code SettingActivity.refreshRight}: true = paint later from a posted message. Stock
     * paints the panel from inside a row's bind, mid-layout, and its resized views were drawn into
     * the old bounds — clipped. Do not {@code forceLayout()} the ancestors: it swallows the
     * requests.
     */
    public static boolean panelUpdate(SettingActivity host, String title) {
        if (MenuStyle.simple(host)) {          // no panel: kept for the day it is shown again
            panelHost = new WeakReference(host);
            panelTitle = title;
            return true;
        }
        if (!busy || painting) {               // not a wheel move, or our own paint
            painted = title;
            stateShift(host, title);
            return false;
        }
        panelHost = new WeakReference(host);
        panelTitle = title;
        return true;
    }

    /**
     * The state caption moved down by {@code ipp_state_top} — non-zero in the locales with a
     * two-line title. Not on About: no room below it. From the paint path, never a bind.
     */
    private static void stateShift(SettingActivity host, String title) {
        try {
            View tv = ((android.app.Activity) host).findViewById(R.id.info_state_tv);
            if (tv == null) return;
            ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) tv.getLayoutParams();
            if (lp == null) return;
            int top = 0;
            if (!host.getString(R.string.setting_about).equals(title)) {
                top = host.getResources().getDimensionPixelSize(R.dimen.ipp_state_top);
            }
            if (lp.topMargin != top) {
                lp.topMargin = top;
                tv.setLayoutParams(lp);
            }
        } catch (Throwable t) {
        }
    }

    private static String painted;

    /** The panel still shows this row — for late work ({@code CacheSize}) before it repaints. */
    public static boolean panelShows(String title) {
        return title != null && title.equals(painted);
    }

    /** Paints the Settings panel or the equaliser's preview, outside any layout. */
    static void paintPanel() {
        panelAt = SystemClock.uptimeMillis();
        Eq.paint();
        Object h = panelHost == null ? null : panelHost.get();
        if (h instanceof SettingActivity && MenuStyle.simple((SettingActivity) h)) return;
        String t = panelTitle;
        panelHost = null;
        panelTitle = null;
        if (h instanceof SettingActivity && t != null) {
            painting = true;
            try {
                painted = t;
                ((SettingActivity) h).ippRefreshRight(t);
            } catch (Throwable e) {
            } finally {
                painting = false;
            }
        }
    }

    /** Right after the key event: paint, unless the panel was painted within {@link #PANEL_MS}. */
    static final class Now implements Runnable {
        public void run() {
            if (SystemClock.uptimeMillis() - panelAt >= PANEL_MS) paintPanel();
        }
    }

    /** End of a burst of clicks: paint what the burst ended on, if {@link Now} has not already. */
    static final class Rest implements Runnable {
        public void run() {
            busy = false;
            restRv = null;
            paintPanel();
        }
    }

    /** Rebinds just the row the burst left and the row it landed on. */
    static final class Repaint implements Runnable {
        public void run() {
            try {
                if (!pendOn) return;
                WeakReference w = pendLv;
                int from = pendFrom;                       // may legitimately be -1 (see pendOn)
                drop();
                if (w == null) return;
                Object o = w.get();
                if (!(o instanceof ListView)) return;
                ListView lv = (ListView) o;
                ListAdapter la = lv.getAdapter();
                if (!(la instanceof MyBaseAdapter)) return;
                MyBaseAdapter a = (MyBaseAdapter) la;
                int first = lv.getFirstVisiblePosition();
                int last = lv.getLastVisiblePosition();
                int now = a.getPosition();
                if (!bind(lv, a, from, first, last) || !bind(lv, a, now, first, last)) {
                    a.notifyDataSetChanged();
                }
            } catch (Throwable t) {
            }
        }
    }

    /**
     * Off screen, or rebound IN PLACE. An adapter that ignores {@code convertView} returns an
     * orphan view; that is the test, and such an adapter is remembered.
     */
    private static boolean bind(ListView lv, MyBaseAdapter a, int pos, int first, int last) {
        if (pos < first || pos > last) return true;
        if (pos < 0 || pos >= a.getCount()) return false;
        View child = lv.getChildAt(pos - first);
        if (child == null) return false;
        if (a.getView(pos, child, lv) == child) return true;
        noFast = new WeakReference(a);
        return false;
    }

    private static WeakReference noFast;

    private static boolean skipFast(MyBaseAdapter a) {
        return noFast != null && noFast.get() == a;
    }

    /**
     * The cursor moved again right after {@link #follow}, by a screen's own rule: the same
     * repaint and scroll from where follow left it, and a move round the end stays one. False =
     * not the list follow saw last; the caller repaints.
     */
    public static boolean refollow(RecyclerView.Adapter adapter, int pos) {
        RecyclerView rv = lastRv == null ? null : (RecyclerView) lastRv.get();
        if (rv == null || lastAdapter == null || lastAdapter.get() != adapter) return false;
        stickyWrap = wrapping;
        follow(rv, pos, adapter);
        return true;
    }

    private static boolean stickyWrap;

    /** {@link #follow} for a caller that KNOWS which row loses the cursor (a jump, a new list). */
    public static void follow(RecyclerView rv, int prev, int pos, RecyclerView.Adapter adapter) {
        if (rv == null) return;
        lastRv = new WeakReference(rv);
        lastAdapter = new WeakReference(adapter);
        lastPos = prev;
        follow(rv, pos, adapter);
    }

    public static void follow(RecyclerView rv, int pos, RecyclerView.Adapter adapter) {
        try {
            if (rv == null) return;
            // Once per RecyclerView AND LayoutManager — not keyed on getItemAnimator(), which
            // Settings nulls itself.
            RecyclerView.LayoutManager lm = rv.getLayoutManager();
            if (tuned == null || tuned.get() != rv || tunedLm == null || tunedLm.get() != lm) {
                tuned = new WeakReference(rv);
                tunedLm = new WeakReference(lm);
                rv.setItemAnimator(null);
                // The view cache returns rows by position WITHOUT a rebind, and rows here are
                // rebound in place, never notified: a cached row comes back with its old look and
                // the cursor vanishes. Held at zero.
                rv.setItemViewCacheSize(0);
                // ...and prefetch re-grows that cache behind setItemViewCacheSize's back
                // (GapWorker, on our own scrollBy at the screen's edge). Off for good.
                if (lm != null) lm.setItemPrefetchEnabled(false);
            }

            // the panel BEFORE the rows: it belongs at the end of the burst, once
            postRest(rv, pos);

            if (adapter != null) {
                int n = adapter.getItemCount();
                // the remembered row counts only for the same ADAPTER; unknown = full repaint
                int prev = (lastRv != null && lastRv.get() == rv
                        && lastAdapter != null && lastAdapter.get() == adapter) ? lastPos : -1;
                // In place, not notifyItemChanged (a full layout pass). Synchronous here, so a
                // burst repaints every row it passes — unlike the posted ListView path.
                if (prev < 0 || !paint(rv, adapter, prev, n) || !paint(rv, adapter, pos, n)) {
                    adapter.notifyDataSetChanged();
                }
                // an unknown row before counts: the first step on entering may well be round the end
                wrapping = stickyWrap || n > 1 && ((prev == n - 1 || prev < 0) && pos == 0
                        || (prev == 0 || prev < 0) && pos == n - 1);
                stickyWrap = false;
            } else {
                wrapping = false;
            }
            lastRv = new WeakReference(rv);
            lastAdapter = new WeakReference(adapter);
            lastPos = pos;

            scrollTo(rv, pos);
        } catch (Throwable t) {
        }
    }

    /**
     * One row rebound in place by RecyclerView's own {@code bindViewHolder}. True = off screen or
     * rebound; false = the caller notifies.
     */
    private static boolean paint(RecyclerView rv, RecyclerView.Adapter a, int p, int n) {
        try {
            if (p < 0 || p >= n) return false;
            RecyclerView.LayoutManager lm = rv.getLayoutManager();
            if (!(lm instanceof LinearLayoutManager)) return false;
            View v = ((LinearLayoutManager) lm).findViewByPosition(p);
            // off screen cannot come back stale: the view cache is at zero
            if (v == null) return true;
            RecyclerView.ViewHolder h = rv.getChildViewHolder(v);
            if (h == null) return false;
            a.bindViewHolder(h, p);
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    /**
     * Bring the row on screen INSTANTLY — an animation costs frames per click and leaves the list
     * chasing a target the wheel has left. Against the edge of the direction of travel.
     */
    private static void scrollTo(RecyclerView rv, int pos) {
        RecyclerView.LayoutManager lm = rv.getLayoutManager();
        if (!(lm instanceof LinearLayoutManager)) {
            rv.scrollToPosition(pos);
            return;
        }
        LinearLayoutManager l = (LinearLayoutManager) lm;
        int first = l.findFirstCompletelyVisibleItemPosition();
        int last = l.findLastCompletelyVisibleItemPosition();
        if (first >= 0 && pos >= first && pos <= last) {
            return;                                                  // already fully visible
        }
        if (glide(rv, l, pos, first, last)) return;
        Glider.stop();                                               // a glide under way
        rv.stopScroll();

        boolean down = first < 0 || pos > last;
        // the keyboard's letter strip is horizontal: the same arithmetic on the other axis
        boolean horiz = l.getOrientation() == LinearLayoutManager.HORIZONTAL;
        int top = horiz ? rv.getPaddingLeft() : rv.getPaddingTop();
        int bottom = horiz ? rv.getWidth() - rv.getPaddingRight()
                           : rv.getHeight() - rv.getPaddingBottom();
        View v = l.findViewByPosition(pos);
        if (v != null) {
            // partially visible: move by exactly how far it is cut off
            int d = down ? end(v, horiz) - bottom : start(v, horiz) - top;
            if (d != 0) {
                if (horiz) rv.scrollBy(d, 0); else rv.scrollBy(0, d);
            }
            return;
        }
        View any = l.getChildAt(0);
        int h = any == null ? 0 : end(any, horiz) - start(any, horiz);
        if (h > 0 && bottom > top) {
            l.scrollToPositionWithOffset(pos, down ? (bottom - top) - h : 0);
        } else {
            rv.scrollToPosition(pos);
        }
    }

    /** Grids whose rows slide into view rather than jump: a row of tiles is a big step. */
    private static final java.util.WeakHashMap gliding = new java.util.WeakHashMap();

    /** The Playlists grid asks for it; every other list keeps the instant scroll. */
    public static void glides(RecyclerView rv, boolean on) {
        if (rv == null) return;
        if (on) gliding.put(rv, Boolean.TRUE);
        else gliding.remove(rv);
    }

    /**
     * Rows past the edge of a gliding grid: the distance to where the cursor's row will be
     * against the edge, measured from where the rows are NOW, handed to {@link Glider}. Further
     * than a few rows, the instant scroll.
     */
    private static boolean glide(RecyclerView rv, LinearLayoutManager l, int pos, int first, int last) {
        if (!(l instanceof androidx.recyclerview.widget.GridLayoutManager) || gliding.get(rv) == null
                || first < 0) {
            return false;
        }
        int span = ((androidx.recyclerview.widget.GridLayoutManager) l).getSpanCount();
        boolean down = pos > last;
        View edge = l.findViewByPosition(down ? last : first);
        if (span <= 0 || edge == null) return false;
        int rows = down ? pos / span - last / span : first / span - pos / span;
        if (rows < 1 || rows > GLIDE_ROWS && !wrapping) return false;
        int step = end(edge, false) - start(edge, false);
        int d = down ? end(edge, false) + rows * step - (rv.getHeight() - rv.getPaddingBottom())
                     : start(edge, false) - rows * step - rv.getPaddingTop();
        Glider.to(rv, d);
        return true;
    }

    /** Further behind than this, the list jumps: a glide that far would trail the wheel. */
    private static final int GLIDE_ROWS = 4;

    /** The cursor has just gone round the list's end: glided however far that is. */
    private static boolean wrapping;

    /**
     * Follows the target the way the Cover Flow row does: every frame covers a share of what is
     * left, so the list runs fast while far behind and eases in as it arrives. A new target only
     * changes what is left — nothing restarts, so a fast wheel gives one continuous movement
     * instead of glides cut short and begun again at another speed.
     */
    static final class Glider implements android.view.Choreographer.FrameCallback {
        /** Share of the distance left covered per second; and the floor and ceiling of speed. */
        private static final float RATE = 14f;
        private static final float VMIN = 400f;
        private static final float VMAX = 6000f;

        private static final Glider G = new Glider();
        private static WeakReference view = new WeakReference(null);
        private static float left;
        private static long last;
        private static boolean running;

        static void to(RecyclerView rv, int d) {
            if (view.get() != rv) {
                stop();
                view = new WeakReference(rv);
            }
            rv.stopScroll();
            left = d;
            if (wrapping) {
                Frames.start("grid wrap");
                if (!counting) android.os.Debug.startAllocCounting();
                counting = true;
                alloc = android.os.Debug.getThreadAllocSize();
            }
            if (!running && d != 0) {
                running = true;
                last = 0;
                android.view.Choreographer.getInstance().postFrameCallback(G);
            }
        }

        static void stop() {
            if (running) android.view.Choreographer.getInstance().removeFrameCallback(G);
            running = false;
            left = 0;
        }

        /** What the main thread had allocated when a glide round the list's end set out. */
        private static int alloc;
        private static boolean counting;

        /** The end of a glide: a glide round the end reports its frames and its garbage. */
        private static void measured() {
            int kb = (android.os.Debug.getThreadAllocSize() - alloc) / 1024;
            Frames.part("alloc KB", android.os.SystemClock.uptimeMillis() - kb);
            Frames.stop();
        }

        /** The scroll still to come on {@code rv}, in pixels, + down. */
        static float left(RecyclerView rv) {
            return running && view.get() == rv ? left : 0f;
        }

        public void doFrame(long nanos) {
            RecyclerView rv = (RecyclerView) view.get();
            if (rv == null || rv.getWindowToken() == null || left == 0) {
                running = false;
                left = 0;
                measured();
                return;
            }
            long now = nanos / 1000000L;
            float dt = last == 0 ? 0.016f : Math.min(0.05f, (now - last) / 1000f);
            last = now;
            float a = Math.abs(left);
            float v = Math.max(VMIN, Math.min(VMAX, a * RATE));
            int s = Math.round(Math.min(a, Math.max(1f, v * dt)));
            if (left < 0) s = -s;
            int was = rv.computeVerticalScrollOffset();
            long t0 = android.os.SystemClock.uptimeMillis();
            rv.scrollBy(0, s);
            if (android.os.SystemClock.uptimeMillis() - t0 >= 4) Frames.part("scroll", t0);
            left -= s;
            // the list's end stops the scroll short: nothing is left to do there
            if (Math.abs(left) < 1f || rv.computeVerticalScrollOffset() == was) left = 0;
            if (left != 0) {
                android.view.Choreographer.getInstance().postFrameCallback(this);
            } else {
                running = false;
                measured();
            }
        }
    }

    /** A row's edges INCLUDING margins, as the list steps (the gallery tiles have margins). */
    private static int start(View v, boolean horiz) {
        ViewGroup.MarginLayoutParams lp = margins(v);
        if (horiz) return v.getLeft() - (lp == null ? 0 : lp.leftMargin);
        return v.getTop() - (lp == null ? 0 : lp.topMargin);
    }

    private static int end(View v, boolean horiz) {
        ViewGroup.MarginLayoutParams lp = margins(v);
        if (horiz) return v.getRight() + (lp == null ? 0 : lp.rightMargin);
        return v.getBottom() + (lp == null ? 0 : lp.bottomMargin);
    }

    private static ViewGroup.MarginLayoutParams margins(View v) {
        ViewGroup.LayoutParams lp = v.getLayoutParams();
        return lp instanceof ViewGroup.MarginLayoutParams ? (ViewGroup.MarginLayoutParams) lp : null;
    }

    // Where each level of a multi-level screen (Genres) was left, per ADAPTER: stock's way back
    // parks the picked row on the TOP edge.
    private static final java.util.WeakHashMap level = new java.util.WeakHashMap();

    /** Called where the user descends a level: remember where THIS list stands. */
    public static void noteLevel(ListView lv) {
        try {
            if (lv == null) return;
            Object a = lv.getAdapter();
            if (!(a instanceof MyBaseAdapter)) return;
            View top = lv.getChildAt(0);
            level.put(a, new int[] {
                    lv.getFirstVisiblePosition(),
                    top == null ? 0 : top.getTop(),        // absolute; see Head.restore
                    ((MyBaseAdapter) a).getPosition()
            });
        } catch (Throwable t) {
        }
    }

    /** In place of {@code Other.gotoAdapter(lv, a, -1)} on the way back up. */
    public static void gotoLevel(ListView lv, MyBaseAdapter a) {
        if (lv == null || a == null) return;
        lv.setAdapter(a);
        int pos = a.getPosition();
        Object o = level.remove(a);                       // one restore per note
        int[] st = (o instanceof int[]) ? (int[]) o : null;
        if (st != null && st[0] >= 0 && st[0] < a.getCount() && st[2] == pos) {
            // Head.restore: the padding may be about to change underneath
            Head.restore(lv, st[0], st[1]);
        } else {
            lv.setSelection(pos);
        }
    }
}
