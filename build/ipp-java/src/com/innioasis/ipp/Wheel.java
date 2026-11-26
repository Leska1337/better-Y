package com.innioasis.ipp;

import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;

import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.innioasis.music.adapter.MyBaseAdapter;
import com.innioasis.y1.R;
import com.innioasis.y1.activity.SettingActivity;

import java.lang.ref.WeakReference;

/**
 * Wheel navigation of every list ({@link #follow}; the music lists through {@link #rows}). Stock
 * notified the adapter (and smooth-scrolled) on every step; here a step inside the visible window
 * rebinds just the two rows whose highlight changes, in place, and scrolls only when the row is
 * cut off — instantly.
 */
public final class Wheel {

    /**
     * Whether the wheel accelerates here ({@code BaseActivity.getEnableSpeedClockwise}, asked on every
     * click; the extra rows are stock's count in {@code SpeedUtil}): only the lists of Music, Videos
     * and Audiobooks, which run to hundreds of rows, and not with alphabetical fast scroll, which
     * takes a fast wheel over itself. On a short menu it flies past the row aimed at.
     */
    public static boolean fast(com.innioasis.y1.base.BaseActivity a) {
        return longList(a) && !Prefs.on(a, "alpha_scroll");
    }

    private static boolean longList(com.innioasis.y1.base.BaseActivity a) {
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

    /**
     * Top of the wheel in {@code BaseActivity.dispatchKeyEvent}: true = the click is dropped. While a
     * grid's frame changes rows ({@link PlGrid#busy}), and within the stop after a wrap
     * ({@link Loop#afterWrap}).
     */
    public static boolean drop(android.app.Activity a) {
        return PlGrid.busy(a) || Loop.afterWrap();
    }

    private static WeakReference lastRv;
    private static int lastPos = -1;
    /** The adapter {@link #lastPos} belongs to: a screen may swap adapters in one RecyclerView. */
    private static WeakReference lastAdapter;
    /** The RecyclerView set up by {@link #follow}. */
    private static WeakReference tuned;
    /** ...and its layout manager: the prefetch flag is the manager's. */
    private static WeakReference tunedLm;


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
    /** {@code w} when it already holds {@code o}: these are set on every click. */
    private static WeakReference same(WeakReference w, Object o) {
        return w != null && w.get() == o ? w : new WeakReference(o);
    }

    private static void postRest(RecyclerView rv, int pos) {
        restRv = same(restRv, rv);
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
            return false;
        }
        panelHost = new WeakReference(host);
        panelTitle = title;
        return true;
    }

    private static String painted;

    /** The panel is painted with the cursor at rest, not from inside a burst of clicks. */
    static boolean panelAtRest() {
        return !busy;
    }

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

    /** When the wheel last moved a cursor: how {@link Loop} tells a fast wheel at the list's end. */
    static long stepAt;

    /** {@link #follow} for a caller that KNOWS which row loses the cursor (a jump, a new list). */
    public static void follow(RecyclerView rv, int prev, int pos, RecyclerView.Adapter adapter) {
        if (rv == null) return;
        lastRv = same(lastRv, rv);
        lastAdapter = same(lastAdapter, adapter);
        lastPos = prev;
        follow(rv, pos, adapter);
    }

    /**
     * A music list ({@link SongRows}), in place of {@code Other.listViewScroll}: the step drawn by
     * {@link #follow}, once per frame.
     */
    public static void rows(RecyclerView rv, int type) {
        try {
            // a dialog's list: its keys never pass BaseActivity's check (drop)
            if (Loop.afterWrap()) return;
            SongRows r = SongRows.of(rv);
            if (r == null) return;
            MyBaseAdapter a = r.model();
            Follow.touched(rv, a);
            if (Alpha.step(rv, a, type)) return;
            Status.check(rv);
            // a jump still being laid out, or the rows still gliding to the end to go round
            if (Bar.holds(rv, type)) return;
            int old = r.cursor();
            int m = a.getPosition();
            if (type == 1 ? m >= a.getCount() - 1 : m <= 0) {
                // round the end the step draws itself: what is drawn so far must be current
                flushRows();
                if (Loop.fromShuffle(rv, a, type)) return;
                // on the Shuffle row nothing is above it: the screen's spv.onAntiClockwise keeps it
                if (m < 0) {
                    Loop.aboveShuffle();
                    return;
                }
            }
            if (type == 1) a.toNext(); else a.toPrevious();
            if (a.getPosition() == m) {                 // clamped at an end
                Loop.list(rv, a, type, m);
                stepAt = SystemClock.uptimeMillis();
                return;
            }
            stepAt = SystemClock.uptimeMillis();
            // drawn next frame: going round must wait from now, not from the draw
            Loop.moved();
            stepRows(rv, old);
        } catch (Throwable t) {
        }
    }

    // A step moves the model's cursor at once and is DRAWN once per frame: the wheel's
    // acceleration replays a step several times per click, and a repaint and scroll per replay
    // let the clicks queue up behind the list — it scrolled on after the wheel stopped.
    private static WeakReference stepRv;
    private static int stepFrom;
    private static boolean stepOn;
    private static final Step STEP = new Step();

    private static void stepRows(RecyclerView rv, int from) {
        if (stepOn && stepRv != null && stepRv.get() == rv) return;   // drawn from the first one
        flushRows();
        stepRv = same(stepRv, rv);
        stepFrom = from;
        stepOn = true;
        android.view.Choreographer.getInstance().postFrameCallback(STEP);
    }

    /** The pending step drawn now. */
    static void flushRows() {
        if (!stepOn) return;
        android.view.Choreographer.getInstance().removeFrameCallback(STEP);
        STEP.doFrame(0);
    }

    static final class Step implements android.view.Choreographer.FrameCallback {
        public void doFrame(long nanos) {
            if (!stepOn) return;
            stepOn = false;
            RecyclerView rv = stepRv == null ? null : (RecyclerView) stepRv.get();
            stepRv = null;
            SongRows r = SongRows.of(rv);
            if (r == null) return;
            follow(rv, stepFrom, r.cursor(), r);
        }
    }

    /**
     * Once per RecyclerView AND LayoutManager — not keyed on getItemAnimator(), which Settings
     * nulls itself.
     */
    static void tune(RecyclerView rv) {
        RecyclerView.LayoutManager lm = rv.getLayoutManager();
        if (tuned != null && tuned.get() == rv && tunedLm != null && tunedLm.get() == lm) return;
        tuned = new WeakReference(rv);
        tunedLm = new WeakReference(lm);
        rv.setItemAnimator(null);
        // The view cache returns rows by position WITHOUT a rebind, and rows here are rebound in
        // place, never notified: a cached row comes back with its old look and the cursor
        // vanishes. Held at zero.
        rv.setItemViewCacheSize(0);
        // ...and prefetch re-grows that cache behind setItemViewCacheSize's back (GapWorker, on
        // our own scrollBy at the screen's edge). Off for good.
        if (lm != null) lm.setItemPrefetchEnabled(false);
        // A row never takes the focus: after a layout RecyclerView hands it to a row, and a
        // focused row scrolls the list to itself, behind the glide — the list stopped between
        // rows. The wheel needs no focus.
        rv.setDescendantFocusability(ViewGroup.FOCUS_BLOCK_DESCENDANTS);
        View f = rv.findFocus();
        if (f != null && f != rv) rv.requestFocus();
    }

    public static void follow(RecyclerView rv, int pos, RecyclerView.Adapter adapter) {
        try {
            if (rv == null) return;
            stepAt = SystemClock.uptimeMillis();
            if (pos != lastPos) Loop.moved();
            tune(rv);

            // the panel BEFORE the rows: it belongs at the end of the burst, once
            postRest(rv, pos);

            if (adapter != null) {
                int n = adapter.getItemCount();
                // the remembered row counts only for the same ADAPTER; unknown = full repaint
                int prev = (lastRv != null && lastRv.get() == rv
                        && lastAdapter != null && lastAdapter.get() == adapter) ? lastPos : -1;
                // past the end: Loop.mark's mark one beyond the list, as unknown as -1 (a wrap backwards)
                if (prev >= n) prev = -1;
                // In place, not notifyItemChanged (a full layout pass). Synchronous, so a burst
                // repaints every row it passes.
                if (prev < 0 || !paint(rv, adapter, prev, n) || !paint(rv, adapter, pos, n)) {
                    adapter.notifyDataSetChanged();
                }
                // an unknown row before counts: the first step on entering may well be round the end.
                // A step to the NEXT row is no wrap — on two rows both ends are next to each other,
                // and only a wrap just taken (Loop.justWrapped) says it went round.
                boolean ends = (prev == n - 1 || prev < 0) && pos == 0
                        || (prev == 0 || prev < 0) && pos == n - 1;
                wrapping = stickyWrap || n > 1 && ends
                        && (prev < 0 || Math.abs(pos - prev) > 1 || Loop.justWrapped());
                stickyWrap = false;
            } else {
                wrapping = false;
            }
            lastRv = same(lastRv, rv);
            lastAdapter = same(lastAdapter, adapter);
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
     * Bring the row on screen against the edge of the direction of travel: by {@link Glider} while
     * animations are on, else at once. Never a smooth scroll restarted per click — the list would
     * chase a target the wheel has left.
     */
    private static void scrollTo(RecyclerView rv, int pos) {
        RecyclerView.LayoutManager lm = rv.getLayoutManager();
        if (!(lm instanceof LinearLayoutManager)) {
            rv.scrollToPosition(pos);
            return;
        }
        LinearLayoutManager l = (LinearLayoutManager) lm;
        // round the end under a travelling bar: rows and bar move together, at once
        if (!releasing && wrapping && Bar.defer(rv, pos)) return;
        if (!jumping && retarget(rv, l, pos)) return;
        int first = l.findFirstCompletelyVisibleItemPosition();
        int last = l.findLastCompletelyVisibleItemPosition();
        if (first >= 0 && pos >= first && pos <= last) {
            // already fully visible, unless under a pinned plate (SongRows.top)
            View fv = l.getOrientation() == LinearLayoutManager.HORIZONTAL ? null : l.findViewByPosition(pos);
            if (fv == null || start(fv, false) >= SongRows.top(rv, pos)) return;
        }
        if (!releasing && gliding.get(rv) != null && PlGrid.holds(rv, pos)) {
            hold(rv);
            return;
        }
        if (!jumping && glide(rv, l, pos, first, last)) return;
        Glider.stop();                                               // a glide under way
        rv.stopScroll();

        boolean down = first < 0 || pos > last;
        // the keyboard's letter strip is horizontal: the same arithmetic on the other axis
        boolean horiz = l.getOrientation() == LinearLayoutManager.HORIZONTAL;
        int top = horiz ? rv.getPaddingLeft() : SongRows.top(rv, pos);
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
        // the step is drawn from a frame callback: a layout posted from here misses this frame
        Fixed.layNow(rv);
        // h is another row's height: rows differ (a disc strip), so the row is put to the edge by its own
        if (down && !horiz) Settle.at(rv, pos, bottom);
    }

    /** After the layout that brought the row in, before its draw: its bottom against {@code bottom}. */
    private static final class Settle implements android.view.ViewTreeObserver.OnPreDrawListener {
        private final RecyclerView rv;
        private final int pos, bottom;

        private Settle(RecyclerView rv, int pos, int bottom) {
            this.rv = rv;
            this.pos = pos;
            this.bottom = bottom;
        }

        static void at(RecyclerView rv, int pos, int bottom) {
            Settle s = new Settle(rv, pos, bottom);
            if (!rv.isLayoutRequested() && s.fix()) return;
            rv.getViewTreeObserver().addOnPreDrawListener(s);
        }

        /** False while the row is not laid out yet. */
        private boolean fix() {
            RecyclerView.LayoutManager lm = rv.getLayoutManager();
            View v = lm == null ? null : lm.findViewByPosition(pos);
            if (v == null) return false;
            int d = end(v, false) - bottom;
            if (d != 0) rv.scrollBy(0, d);
            return true;
        }

        public boolean onPreDraw() {
            try {
                rv.getViewTreeObserver().removeOnPreDrawListener(this);
                fix();
            } catch (Throwable t) {
            }
            return true;
        }
    }

    /**
     * The scroll a {@link Bar} deferred, once it has faded out — at once: a glide here is time
     * with neither bar nor colour on screen.
     */
    static void jumpNow(RecyclerView rv, int pos) {
        try {
            if (rv == null || rv.getWindowToken() == null) return;
            Glider.stop();
            releasing = true;
            jumping = true;
            scrollTo(rv, pos);
        } catch (Throwable t) {
        } finally {
            releasing = false;
            jumping = false;
        }
    }

    private static boolean jumping;

    /**
     * A grid's rows waiting for the cursor's frame to end its way along a row (PlGrid.holds);
     * the frame lets them go, and a timer does if it never does.
     */
    private static WeakReference heldRv;
    private static boolean heldWrap;
    private static boolean releasing;
    private static final long HOLD_MAX_MS = 500L;
    private static final android.os.Handler UI = new android.os.Handler(android.os.Looper.getMainLooper());
    private static final Release RELEASE = new Release();

    private static void hold(RecyclerView rv) {
        heldWrap = held(rv) && heldWrap || wrapping;
        heldRv = new WeakReference(rv);
        UI.removeCallbacks(RELEASE);
        UI.postDelayed(RELEASE, HOLD_MAX_MS);
    }

    static boolean held(RecyclerView rv) {
        return rv != null && heldRv != null && heldRv.get() == rv;
    }

    /** Posted: the frame asks from inside the list's draw, where a scroll must not run. */
    static void releaseSoon(RecyclerView rv) {
        if (!held(rv)) return;
        UI.removeCallbacks(RELEASE);
        UI.post(RELEASE);
    }

    static final class Release implements Runnable {
        public void run() {
            RecyclerView rv = heldRv == null ? null : (RecyclerView) heldRv.get();
            heldRv = null;
            boolean w = wrapping;
            try {
                if (rv == null || rv.getAdapter() == null || rv.getWindowToken() == null) return;
                wrapping = heldWrap;
                // the timer's release too: the frame may still be on its way, the rows go anyway
                releasing = true;
                scrollTo(rv, PlGrid.cursorAt(rv));
            } catch (Throwable t) {
            } finally {
                releasing = false;
                heldWrap = false;
                wrapping = w;
            }
        }
    }

    /** Grids whose rows slide into view rather than jump: a row of tiles is a big step. */
    private static final java.util.WeakHashMap gliding = new java.util.WeakHashMap();

    /** A grid asks for it (PlGrid), a list does with its travelling {@link Bar}. */
    public static void glides(RecyclerView rv, boolean on) {
        if (rv == null) return;
        if (on) {
            gliding.put(rv, Boolean.TRUE);
        } else {
            gliding.remove(rv);
            if (Glider.left(rv) != 0) Glider.stop();
        }
    }

    /**
     * Rows past the edge of a gliding grid: the distance to where the cursor's row will be
     * against the edge, measured from where the rows are NOW, handed to {@link Glider}. Further
     * than a few rows, the instant scroll.
     */
    private static boolean glide(RecyclerView rv, LinearLayoutManager l, int pos, int first, int last) {
        if (!(l instanceof androidx.recyclerview.widget.GridLayoutManager)) return glideList(rv, l, pos, first, last);
        if (gliding.get(rv) == null || first < 0) return false;
        int span = ((androidx.recyclerview.widget.GridLayoutManager) l).getSpanCount();
        boolean down = pos > last;
        View edge = l.findViewByPosition(down ? last : first);
        if (span <= 0 || edge == null) return false;
        int rows = down ? pos / span - last / span : first / span - pos / span;
        // round the end the rows jump, as a list's do
        if (wrapping || rows < 1 || rows > GLIDE_ROWS) return false;
        int step = end(edge, false) - start(edge, false);
        int d = down ? end(edge, false) + rows * step - (rv.getHeight() - rv.getPaddingBottom())
                     : start(edge, false) - rows * step - rv.getPaddingTop();
        Glider.to(rv, d, 0);
        return true;
    }

    /**
     * A list that asked for it ({@link #glides}, the lists with a travelling {@link Bar}) glides
     * only round its end; a step past the edge moves the rows at once, so the next row lands under
     * the bar standing there in the same frame. A row not laid out yet is estimated, and the glide
     * re-aims at it exactly once it is ({@link Glider#aim}).
     */
    private static boolean glideList(RecyclerView rv, LinearLayoutManager l, int pos, int first, int last) {
        if (!wrapping || first < 0 || l.getOrientation() != LinearLayoutManager.VERTICAL || gliding.get(rv) == null) {
            return false;
        }
        boolean down = pos > last;
        int top = SongRows.top(rv, pos);
        int bottom = rv.getHeight() - rv.getPaddingBottom();
        View v = l.findViewByPosition(pos);
        int rows = down ? pos - last : first - pos;
        if (rows < 1 || rows > (wrapping ? WRAP_LIST_ROWS : GLIDE_ROWS)) return false;
        int d, step;
        if (v != null) {
            step = end(v, false) - start(v, false);
            d = down ? end(v, false) - bottom : start(v, false) - top;
        } else {
            View edge = l.findViewByPosition(down ? last : first);
            if (edge == null) return false;
            step = end(edge, false) - start(edge, false);
            d = down ? end(edge, false) + rows * step - bottom : start(edge, false) - rows * step - top;
        }
        if (d == 0) return true;
        listGlide(rv, d, wrapping ? Math.min(WRAP_MAX_MS, WRAP_MS + WRAP_ROW_MS * rows) : 0, pos, down, step);
        return true;
    }

    /**
     * A list's glide trails the cursor by half a row at most: what is beyond goes at once. Behind
     * by more, a fast wheel kept the rows pressed against one edge and they sprang back when it
     * stopped, and the bar stood over a row that was not the cursor's.
     */
    private static void listGlide(RecyclerView rv, int d, int ms, int pos, boolean down, int h) {
        int lead = h / 2;
        if (ms == 0 && lead > 0 && Math.abs(d) > lead) {
            int ex = d > 0 ? d - lead : d + lead;
            Glider.stop();
            rv.scrollBy(0, ex);
            d -= ex;
        }
        Glider.to(rv, d, ms);
        Glider.aim(pos, down);
    }

    /**
     * While a glide is under way, "is the row on screen" is asked of where the rows WILL stand: a
     * row on screen now may be carried off by what is left of the glide (the wheel turned back).
     */
    private static boolean retarget(RecyclerView rv, LinearLayoutManager l, int pos) {
        float left = Glider.left(rv);
        if (left == 0 || l instanceof androidx.recyclerview.widget.GridLayoutManager) return false;
        View v = l.findViewByPosition(pos);
        if (v == null) return false;
        int top = SongRows.top(rv, pos);
        int bottom = rv.getHeight() - rv.getPaddingBottom();
        int s = Math.round(left);
        int vt = start(v, false) - s;
        int vb = end(v, false) - s;
        int extra = vb > bottom ? vb - bottom : vt < top ? vt - top : 0;
        if (extra != 0) listGlide(rv, s + extra, 0, pos, extra > 0, vb - vt);
        return true;
    }

    /** Further behind than this, the list jumps: a glide that far would trail the wheel. */
    private static final int GLIDE_ROWS = 4;

    /** A list round its end glides only this far; a long one binds every row it passes. */
    private static final int WRAP_LIST_ROWS = 15;

    /** The cursor has just gone round the list's end: glided however far that is. */
    private static boolean wrapping;

    /** Round the end the rows ease in over a time growing with the rows passed, not past a cap. */
    private static final int WRAP_MS = 180;
    private static final int WRAP_ROW_MS = 45;
    private static final int WRAP_MAX_MS = 450;

    /**
     * Follows the target on a spring: the list sets off and eases in softly. A new target only
     * changes what is left and keeps the speed — nothing restarts, so a fast wheel gives one
     * continuous movement instead of glides cut short and begun again at another speed.
     */
    static final class Glider implements android.view.Choreographer.FrameCallback {
        /**
         * The rows on the lists' bar spring (Bar), critically damped: they start and land gently
         * and never run past the row. A new target keeps the speed, so a turning wheel bends the
         * glide.
         */
        private static final float OMEGA = 30f;
        /** The rows' speed, px/s (+ down), and the part of a pixel not yet scrolled. */
        private static float vel, frac;

        private static final Glider G = new Glider();
        private static WeakReference view = new WeakReference(null);
        private static float left;
        private static long last;
        private static boolean running;
        /** A timed glide: its length, its distance and when it set out. */
        private static int easeMs, easeTotal;
        private static long easeAt;

        /** {@code ms} above 0: over that time, easing out, instead of the spring. */
        static void to(RecyclerView rv, int d, int ms) {
            if (view.get() != rv) {
                stop();
                view = new WeakReference(rv);
            }
            rv.stopScroll();
            if (!running) {
                vel = 0f;
                frac = 0f;
            }
            left = d;
            aimPos = -1;
            easeMs = ms;
            easeTotal = d;
            easeAt = 0;
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
            aimPos = -1;
        }

        /** The row the glide brings to an edge; while it is off screen the distance is a guess. */
        private static int aimPos = -1;
        private static boolean aimDown;

        static void aim(int pos, boolean down) {
            aimPos = pos;
            aimDown = down;
        }

        /**
         * The list's end in the direction of travel, told by the edge row itself — not by
         * computeVerticalScrollOffset, an estimate that can come out unchanged in the frame a row
         * enters and another leaves, which stopped glides short of the last row.
         */
        private static boolean atEnd(RecyclerView rv, boolean down) {
            RecyclerView.Adapter a = rv.getAdapter();
            int n = rv.getChildCount();
            if (a == null || n == 0) return true;
            View v = rv.getChildAt(down ? n - 1 : 0);
            int p = rv.getChildAdapterPosition(v);
            if (down) return p == a.getItemCount() - 1 && end(v, false) <= rv.getHeight() - rv.getPaddingBottom();
            return p == 0 && start(v, false) >= rv.getPaddingTop();
        }

        /** The guess replaced by the row's own edge once the row is laid out. */
        private static void reaim(RecyclerView rv) {
            if (aimPos < 0) return;
            RecyclerView.LayoutManager lm = rv.getLayoutManager();
            View v = lm instanceof LinearLayoutManager ? ((LinearLayoutManager) lm).findViewByPosition(aimPos) : null;
            if (v == null) return;
            int exact = aimDown ? end(v, false) - (rv.getHeight() - rv.getPaddingBottom())
                                : start(v, false) - SongRows.top(rv, aimPos);
            if (easeMs > 0) easeTotal += Math.round(exact - left);
            left = exact;
            aimPos = -1;
        }

        /** The scroll still to come on {@code rv}, in pixels, + down. */
        static float left(RecyclerView rv) {
            return running && view.get() == rv ? left : 0f;
        }

        public void doFrame(long nanos) {
            RecyclerView rv = (RecyclerView) view.get();
            if (rv != null) reaim(rv);
            if (rv == null || rv.getWindowToken() == null || left == 0) {
                running = false;
                left = 0;
                return;
            }
            long now = nanos / 1000000L;
            float dt = last == 0 ? 0.016f : Math.min(0.05f, (now - last) / 1000f);
            last = now;
            int s;
            if (easeMs > 0) {
                if (easeAt == 0) easeAt = now - 16;
                float t = Math.min(1f, (now - easeAt) / (float) easeMs);
                float u = 1f - t;
                s = t >= 1f ? Math.round(left)
                        : Math.round(easeTotal * (1f - u * u * u)) - Math.round(easeTotal - left);
            } else {
                float e = -left;
                float c = vel + OMEGA * e;
                float ex = (float) Math.exp(-OMEGA * dt);
                float ne = (e + c * dt) * ex;
                vel = (vel - OMEGA * c * dt) * ex;
                if (Math.abs(ne) < 0.5f && Math.abs(vel) < 15f) {
                    s = Math.round(left);
                    vel = 0f;
                    frac = 0f;
                } else {
                    frac += ne - e;
                    s = Math.round(frac);
                    frac -= s;
                }
            }
            long t0 = android.os.SystemClock.uptimeMillis();
            rv.scrollBy(0, s);
            if (android.os.SystemClock.uptimeMillis() - t0 >= 4) Frames.part("scroll", t0);
            left -= s;
            if (Math.abs(left) < 1f && Math.abs(vel) < 15f || atEnd(rv, left > 0)) left = 0;
            if (left != 0) {
                Loop.animating();
                android.view.Choreographer.getInstance().postFrameCallback(this);
            } else {
                running = false;
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
    public static void noteLevel(RecyclerView rv) {
        try {
            MyBaseAdapter a = Lv.model(rv);
            if (a == null || rv.getChildCount() == 0) return;
            View top = rv.getChildAt(0);
            level.put(a, new int[] {Lv.first(rv), top.getTop(), a.getPosition()});
        } catch (Throwable t) {
        }
    }

    /** In place of {@code Other.gotoAdapter(lv, a, -1)} on the way back up. */
    public static void gotoLevel(RecyclerView rv, MyBaseAdapter a) {
        if (rv == null || a == null) return;
        SongRows.set(rv, a);
        int pos = a.getPosition();
        Object o = level.remove(a);
        int[] st = (o instanceof int[]) ? (int[]) o : null;
        if (st != null && st[0] >= -SongRows.heads(rv) && st[0] < a.getCount() && st[2] == pos) {
            Lv.place(rv, st[0], st[1]);
        } else {
            SongRows.select(rv, pos);
        }
    }

}
