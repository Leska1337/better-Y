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
 * Wheel navigation for the RecyclerView-based Settings screen.
 *
 * Stock did {@code smoothScrollToPosition(mark)} + {@code notifyDataSetChanged()} on EVERY wheel
 * click, so one click restarted a smooth-scroll animation and rebound every visible row — and
 * because the wheel's speed util can invoke the step up to 11 times inside a single key event,
 * that is up to 11 animation restarts and ~80 rebinds per click on a 480x360 API-17 device.
 *
 * Here the row is only scrolled to when it is not already fully on screen (moving the cursor
 * inside the visible window costs no scroll at all), that scroll is instant rather than animated,
 * and only the two rows whose highlight actually changes are rebound — in place, without an adapter
 * notification and therefore without a layout pass. The item animator is dropped: a selection
 * change must repaint instantly, not cross-fade.
 */
public final class Wheel {

    private static WeakReference lastRv;
    private static int lastPos = -1;
    /** The RecyclerView whose animator/cache/prefetch have already been set up; see {@link #follow}. */
    private static WeakReference tuned;

    // ------------------------------------------------------------------ ListView screens
    //
    // Replaces the body of Other.listViewScroll, which every list screen in the app goes through
    // (music, video, folders, genres, audiobooks). Stock does, per step:
    //     adapter.toNext()/toPrevious()  -> notifyDataSetChanged()
    //     lv.setSelection(...)           -> even when the window does not have to move
    // Both only call requestLayout(), so a burst of accelerated steps COALESCES into one layout —
    // there is no 11x rebuild here (SpeedUtil's runMultipleTimes is a plain synchronous loop). The
    // layout itself is the cost: `mDataChanged` makes ListView detach every visible child into the
    // recycler and re-fill, i.e. ~8 getView + measure passes per key event, to move a highlight
    // between two rows.
    //
    // So: while the cursor stays inside the visible window, nothing is notified and nothing is
    // scrolled — the two affected rows are rebound in place, and even that is POSTED, so an
    // accelerated burst of N steps still repaints exactly twice (the row the burst started on and
    // the one it ended on) instead of 2N times. Leaving the window falls back to stock's
    // notify + setSelection, which is what actually has to happen there.
    //
    // MyBaseAdapter.toNext/toPrevious (called from nowhere else) carry no notifyDataSetChanged, so
    // the position can move without dragging a layout along.
    //
    // ---- where the rest of a click goes, and why nothing more is done about it here -------------
    //
    // Profiled on the device (a debuggable build + `am profile`, eight clicks scrolling in All
    // songs, one traversal per click). Inclusive times, inflated by tracing, so read them against
    // each other and read the CALL COUNTS as exact:
    //
    //     ConstraintLayout.onLayout      24 calls   1135 ms
    //     ConstraintLayout.onMeasure     20 calls    808 ms
    //     ConstraintLayout.dispatchDraw  32 calls    293 ms
    //     SongListAdapter.getView        24 calls     67 ms
    //     everything ipp adds together              ~40 ms
    //
    // The row binds are ~5% of it. The cost is the measure and layout of the visible rows, and
    // inside those, largely Android 4.2's RTL resolution — View.measure() calls
    // resolveRtlPropertiesIfNeeded() over the whole subtree and canResolveTextDirection() walks up
    // the parent chain for every view, 31 130 calls over those eight clicks. Two ways at that were
    // TRIED AND REJECTED on measurements — do not re-derive them:
    //
    //  - Dropping notifyDataSetChanged from the scroll path so the layout can reuse its active
    //    views. Halves the getView calls (24 -> 14) and changes nothing else — the rows are dirty
    //    anyway and repainting in place invalidates them, so the traversal count goes UP (4 -> 11).
    //    Slightly WORSE in Albums (54 vs 46 ms per click), level in All songs. Posting that repaint
    //    instead is worse still (an extra layout pass) and repaints only the two ends of an
    //    accelerated burst, which shows two highlighted rows at once.
    //  - `android:supportsRtl="false"`, the one thing that would actually stop the RTL walk: ~5% by
    //    call counts, at the price of leaving the Hebrew locale un-mirrored.
    //
    // What is left is the row layout itself. `item_main.xml` (Artists, the Music menu) is a
    // LinearLayout with a fixed height and costs 25 ms per click; a wrap_content ConstraintLayout
    // costs 46 on the same ListView code path. So `item_songlist.xml` and `item_album.xml` are built
    // around a RelativeLayout — worth ~17% (49.6 -> 41 ms) and ~25% (48 -> 36). Each layout carries
    // its own measurements and traps in its own comment, including why a burst of injected input is
    // useless for measuring this.

    private static WeakReference pendLv;
    private static int pendFrom;
    // A separate flag, NOT `pendFrom < 0`: stock's cancelSelect() parks the adapter at position
    // **-1** while the cursor sits on the Shuffle row, so coming back down gives old == -1 — a
    // perfectly valid "the previous row is off screen". Overloading -1 as the idle sentinel made
    // the posted repaint cancel itself, and song 1 came back with no highlight at all.
    private static boolean pendOn;
    private static final Repaint REPAINT = new Repaint();

    public static void list(ListView lv, int type) {
        try {
            if (lv == null) return;
            ListAdapter la = lv.getAdapter();
            if (!(la instanceof MyBaseAdapter)) return;   // stock threw here too, and was caught
            MyBaseAdapter a = (MyBaseAdapter) la;

            // Who owns the cursor of this list: the user has just turned the wheel on it, so it is
            // theirs for a while and playback does not get to move it. Here and not in the key
            // handler — in the player the wheel is VOLUME, and this method is the one place the
            // cursor of a list actually moves. Before Alpha.step's fast-scroll branch and before
            // the "clamped at an end, nothing changed" return: both are the wheel being turned.
            // See Follow.
            Follow.touched(lv, a);

            // spun fast enough, a long list moves by first letter instead of by row.
            // drop() first, so a repaint posted by the previous (row-wise) step cannot fire on
            // top of the jump.
            if (Alpha.step(lv, a, type)) {
                drop();
                return;
            }

            // Catch-all for the status bar's icon: it steps aside for the playing marker, and the
            // question is normally re-asked when a song row binds — which never happens on a screen
            // that swaps one adapter for another inside the same ListView (Genres pages three
            // levels through one). A wheel click is the one thing every list has. One boolean in
            // the common case; see Status.check.
            Status.check(lv);

            int first = lv.getFirstVisiblePosition();
            int last = lv.getLastVisiblePosition();
            int old = a.getPosition();

            if (type == 1) a.toNext(); else a.toPrevious();
            int now = a.getPosition();
            if (now == old) return;                        // clamped at an end: nothing changed

            // Going down it scrolls at `now >= last`, one step "early", because
            // getLastVisiblePosition() counts the partially visible bottom row — with `now > last`
            // the cursor parked on that half-row and the list never followed it.
            //
            // Going up needs the same correction, for the same reason: getFirstVisiblePosition()
            // also counts a row that is only PARTIALLY on screen, so `now < first` alone let the
            // cursor land on a half-cut top row without scrolling — the highlight looked like it
            // had run off the screen and paging had stopped. `setSelection` normally leaves the
            // list row-aligned, which is why it only showed on the LAST page: there the scroll
            // clamps at the list's end, mid-row. Rather than mirroring the "one step early" trick
            // (which would cost a re-layout every time the cursor merely reaches a fully visible
            // top row), scroll only when the row it lands on is actually cut off.
            //
            // Landing on track 1 deliberately does NOT bring the Shuffle row back: that would push
            // the highlighted row down by the row's height, which reads as a jump. The row comes
            // back when it becomes the cursor, and then it lands exactly where track 1 was — see
            // Head.reveal, which hangs off the row's own selected state.
            boolean scroll = (type == 1)
                    ? (now >= last)
                    : (now < first || cutAtTop(lv, now, first));
            if (scroll) {
                drop();
                // Stock scrolls DOWN by whole rows: `now - last + first + 1` moves the window down
                // by as many rows as the cursor went past the bottom edge. That lands the cursor
                // on a fully visible row only while every row is the same height — which is every
                // list in the app except a multi-disc album's, where the first row of each disc
                // carries the disc strip. There, and only there, the window is moved by PIXELS:
                // the row is put against the bottom edge, exactly as far as it was cut off.
                // Every other list keeps stock behaviour, down to the partially visible row it
                // leaves at the bottom.
                boolean vary = type == 1 && Disc.variableRows(a);
                int h = vary ? rowHeight(lv, now, first) : 0;
                // The list's top edge is NOT its paddingTop: that padding is the space the
                // Shuffle row rides through, and once it has gone the list begins at 0 (or at the
                // disc bar). Head.top is that boundary; the offset setSelectionFromTop takes is
                // measured FROM the padding, hence the subtraction.
                int lt = Head.top(lv);
                int lb = lv.getHeight() - lv.getPaddingBottom();
                a.notifyDataSetChanged();
                if (vary && h > 0 && h <= lb - lt) {
                    // The height above is exact, so no correcting pass is posted: a second
                    // setSelectionFromTop lays the list out twice and that shows as a flicker,
                    // and that flicker is exactly what crossing a disc boundary would show.
                    Head.place(lv, now, lb - h);
                } else if (type == 1) {
                    // Stock moves the window down by whole rows, and the Shuffle row is a row's
                    // worth of space of its own — so while it is still showing it is the first
                    // thing to go, and the target is one row short of stock's. Without that a
                    // single step scrolled the row AND a list row away at once.
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

            if (skipFast(a)) {                             // adapter cannot be rebound in place
                a.notifyDataSetChanged();
                return;
            }

            arm(lv, old);
        } catch (Throwable t) {
            // a wheel click must never take the screen down
        }
    }

    /**
     * Arrange for the row the burst left and the row it lands on to be rebound once, after the
     * layout. {@code old} is remembered only the first time in a burst, so N accelerated steps still
     * cost exactly two rebinds.
     */
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
     * True when the row at {@code pos} is clipped by the list's top edge. Only called for a row at
     * or below {@code first}; an unknown row is false, so a missing child can never force a scroll.
     *
     * Package-visible: {@code Follow} scrolls by the same rule when it chases the playing track.
     */
    /**
     * The first row with anything of it left on screen.
     *
     * {@code getFirstVisiblePosition()} is the first ATTACHED child, and a child that has scrolled
     * entirely above the top edge stays attached — an exact restore of a list's scroll position
     * (Albums, Genres) routinely leaves one sitting at exactly {@code bottom == edge}. Stock's
     * downward scroll is "move the window on by {@code now - last} rows, measured from
     * {@code first}", so counting that row makes the step one row short and the cursor is left on
     * the sliver at the bottom edge, click after click.
     *
     * Package-visible: {@code Follow} scrolls by the same rule when it chases the playing track.
     */
    static int firstShown(ListView lv, int first, int edge) {
        int n = lv.getChildCount();
        for (int i = 0; i < n; i++) {
            View c = lv.getChildAt(i);
            if (c != null && c.getBottom() > edge) return first + i;
        }
        return first;
    }

    static boolean cutAtTop(ListView lv, int pos, int first) {
        int i = pos - first;
        if (i < 0 || i >= lv.getChildCount()) return false;
        View child = lv.getChildAt(i);
        if (child == null) return false;
        return child.getTop() < Head.top(lv);
    }

    /**
     * Height of the row the cursor landed on, in a list whose rows are not all the same height.
     *
     * It is still on screen whenever the cursor merely stepped onto the partially visible bottom
     * row (`last` counts that one), and then the height is read off it. A row BELOW the window —
     * where the step lands after the previous one was pinned to the bottom edge — has to be worked
     * out instead, and taking the bottom row's height as-is is wrong by exactly the disc strip
     * whenever one of the two carries one: that is what left the cursor a strip's height above the
     * bottom edge for the whole of CD2. Rows differ only by that strip, so subtracting it from the
     * measured row and adding it back for the target is exact.
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
                if (c.getHeight() > bottom - top) return;      // taller than the window: leave it
                if (c.getBottom() > bottom) {
                    Head.place(lv, pos, bottom - c.getHeight());
                } else if (c.getTop() < top) {
                    Head.place(lv, pos, top);
                }
            } catch (Throwable t) {
                // a wheel click must never take the screen down
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
     * Mark the wheel as moving and arrange for the panel beside the list to be painted — see
     * {@link #panelUpdate} for why it must not be painted from the row's bind.
     *
     * Two messages. {@link Now} is posted plainly, so it runs once the whole key event is done (the
     * speed util may step several rows inside one) and paints the row the cursor landed on — a lone
     * click shows its preview as promptly as the main menu does. It skips when the panel was painted
     * less than {@link #PANEL_MS} ago, so a fast spin does not repaint it for every row flown past:
     * on Settings that panel is a preview image, two captions and (on one row) the measured cache
     * size, the most expensive thing a click there can trigger. {@link Rest}, re-posted DELAYED on
     * every click, paints whatever the burst ended on.
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
     * Injected at the top of {@code SettingActivity.refreshRight}: true = do not paint the panel
     * now; note what it should show and let {@link Now} or {@link Rest} paint it from a plain posted
     * message.
     *
     * That panel — preview image and two captions — is stock-painted from inside a row's
     * bind, i.e. in the middle of the list's layout. Its views change size, and the
     * re-measure they ask for there cannot be served in the same frame, so the new content was
     * drawn into the bounds of whatever the panel showed before: the image cut off at the bottom,
     * the captions cut off at the end. Painting it from outside any layout pass makes the request
     * an ordinary one and the very first frame correct.
     *
     * Two earlier attempts at this are worth not repeating. Marking the panel's ancestors with
     * {@code forceLayout()} makes {@code isLayoutRequested()} true on them, and
     * {@code View.requestLayout()} only walks up while the parent has not already requested
     * layout — so it silently swallowed the requests the panel and the rows were raising
     * themselves. And re-measuring after the repaint instead of before only scheduled one more
     * pass, so the clipped version was drawn for a frame and then corrected — the flicker.
     */
    public static boolean panelUpdate(SettingActivity host, String title) {
        if (!busy || painting) {               // not a wheel move, or our own paint: paint it now
            painted = title;
            stateShift(host, title);
            return false;
        }
        panelHost = new WeakReference(host);
        panelTitle = title;
        return true;
    }

    /**
     * The state caption under the preview, moved down by {@code R.dimen.ipp_state_top}.
     *
     * The caption hangs off the bottom of the picture, which hangs off the bottom of the title, and
     * the title reserves two lines in the locales whose settings names need them
     * ({@code R.integer.ipp_title_lines}). In those locales the whole column sits a line lower and
     * the caption ends up crowded against it, so the dimen is non-zero for exactly the same
     * locales and zero everywhere else.
     *
     * About is the exception: its panel carries {@code AboutView} plus several lines of
     * device information, and there is no room below it — a shift there pushes the last line off
     * the screen. It is recognised the way stock recognises it in {@code refreshRight}, by the
     * title matching {@code setting_about}.
     *
     * Called from the paint path, not from a row's bind: a margin change asks for a layout, and
     * the whole point of the deferral above is that the panel's layout is not requested from
     * inside the list's own.
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
            // a cosmetic offset is never worth taking the screen down for
        }
    }

    private static String painted;

    /**
     * True while the panel is showing this row. Called by work that finishes late and wants to
     * repaint — {@code CacheSize} measures the cache on a background thread, and by the time it
     * has a number the wheel may have moved on, where repainting would put the wrong row's
     * content on screen.
     */
    public static boolean panelShows(String title) {
        return title != null && title.equals(painted);
    }

    /**
     * Paints whatever a panel beside the list is waiting for — the Settings panel or the
     * equaliser's preview — from a posted message, where no layout is in progress.
     */
    private static void paintPanel() {
        panelAt = SystemClock.uptimeMillis();
        Eq.paint();
        Object h = panelHost == null ? null : panelHost.get();
        String t = panelTitle;
        panelHost = null;
        panelTitle = null;
        if (h instanceof SettingActivity && t != null) {
            painting = true;
            try {
                painted = t;
                ((SettingActivity) h).ippRefreshRight(t);
            } catch (Throwable e) {
                // a stale panel is better than a crash on a wheel click
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
                    a.notifyDataSetChanged();              // could not reach a row: let the list do it
                }
            } catch (Throwable t) {
                // ignore
            }
        }
    }

    /**
     * True when the row is either off screen (nothing to do) or successfully rebound **in place**.
     *
     * Rebinding in place only works for an adapter that actually reuses {@code convertView}.
     * Several here do not — {@code SubmenuAdapter} (the sort / long-press menu) inflates a fresh
     * row every call and ignores the one it is given — so getView would quietly build an orphan
     * view and the row on screen would never change: the highlight simply stopped moving. The
     * returned view being the one we passed in is the reliable test, and the adapter is
     * remembered so the wasted inflate happens at most once per screen.
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
     * The same, for a caller that KNOWS which row is losing the cursor.
     *
     * The plain {@link #follow} remembers the row it painted last and repaints that one — right
     * for a list the wheel walks a row at a time, wrong the moment the screen puts the cursor
     * somewhere on its own: the Videos browser calls this when it opens a folder, i.e. with a new
     * list and a cursor that jumped, and the row it remembered belongs to the folder that has just
     * been left. The row that was highlighted then never got repainted and its highlight simply
     * stayed on screen beside the real one.
     */
    public static void follow(RecyclerView rv, int prev, int pos, RecyclerView.Adapter adapter) {
        if (rv == null) return;
        lastRv = new WeakReference(rv);
        lastPos = prev;
        follow(rv, pos, adapter);
    }

    public static void follow(RecyclerView rv, int pos, RecyclerView.Adapter adapter) {
        try {
            if (rv == null) return;
            // Once per RecyclerView. NOT `if (getItemAnimator() != null)`, which is what this used
            // to be: SettingActivity.initView already does `recycler.setItemAnimator(null)` itself,
            // so on the one screen that needed it most the whole block never ran — see the cache
            // note below for what that cost.
            if (tuned == null || tuned.get() != rv) {
                tuned = new WeakReference(rv);
                rv.setItemAnimator(null);
                // RecyclerView keeps the two most recently detached rows in a cache keyed BY
                // POSITION and brings them back **without rebinding** — that is the whole point of
                // that cache, and it is correct only for an adapter that notifies when a row's
                // content changes. Ours does not — the highlight is moved by rebinding the two rows
                // in place — so a row that had scrolled off would come back carrying the look it had
                // then: stepping onto the row just below the window would leave it unhighlighted and
                // the cursor would vanish from the screen. With the cache at zero a row that comes into
                // view is taken from the pool, which always rebinds, so the state on screen can only
                // ever be the state the adapter would paint now.
                //
                // What that looks like when it is NOT held at zero, measured on Settings with the
                // wheel logged: stepping up onto a row above the window, `paint` finds nothing to
                // rebind (the row is not attached) and hands the job to the scroll — and the layout
                // then serves that position out of `mCachedViews`, which returns a BOUND holder
                // untouched. So the row arrived carrying the look it had when it left, the cursor
                // was nowhere on screen, and because the adapter's bind is also what calls
                // `refreshRight`, the preview beside the list stayed on the row before last.
                rv.setItemViewCacheSize(0);

                // ...except that setItemViewCacheSize is NOT the last word on the cache's size.
                // GapWorker's LayoutPrefetchRegistryImpl records how many rows a scroll asked to
                // prefetch in LayoutManager.mPrefetchMaxCountObserved and then calls
                // Recycler.updateViewCacheSize(), which sets mViewCacheMax = mRequestedCacheMax +
                // that number — so the cache we just zeroed comes back holding one or two rows,
                // keyed by position and returned WITHOUT a rebind. The trigger is our own
                // scrollTo(): rv.scrollBy() goes through scrollByInternal, which posts to the gap
                // worker, and that is the path taken exactly when the cursor steps onto a partially
                // visible row — i.e. at the edge of the screen. So a row that scrolled off and came
                // back arrived carrying its old look and the highlight vanished, "sometimes", when
                // scrolling at the edge onto rows beyond it (reported on Settings).
                //
                // setItemPrefetchEnabled(false) resets mPrefetchMaxCountObserved to 0 and
                // re-runs updateViewCacheSize, so the cache stays at zero for good. Nothing is lost:
                // prefetch exists to spend idle frame time inflating rows ahead of a fling, and this
                // list is driven a row at a time by a wheel.
                RecyclerView.LayoutManager lm = rv.getLayoutManager();
                if (lm != null) lm.setItemPrefetchEnabled(false);
            }

            // Ask for the panel BEFORE the rows are rebound: `panelUpdate` paints it on the spot
            // unless `busy` is already set, and the panel is the most expensive thing on the
            // Settings screen — it belongs at the end of the burst, once.
            postRest(rv, pos);

            if (adapter != null) {
                int n = adapter.getItemCount();
                int prev = (lastRv != null && lastRv.get() == rv) ? lastPos : -1;
                // Rebound in place rather than through notifyItemChanged: a notify is an adapter
                // update, and RecyclerView answers it with a full layout pass over every visible
                // row, while two binds are what actually changed.
                //
                // Safe here in a way the ListView path is not (see Wheel.list, where the same idea
                // was tried and reverted): this repaint is SYNCHRONOUS, so an accelerated key event
                // taking several steps repaints every row it passes through, one pair at a time. The
                // ListView path posts its repaint once per burst and therefore only ever fixes the
                // two ends of it.
                if (prev < 0 || !paint(rv, adapter, prev, n) || !paint(rv, adapter, pos, n)) {
                    adapter.notifyDataSetChanged();   // unknown state, or a row we could not reach
                }
            }
            lastRv = new WeakReference(rv);
            lastPos = pos;

            scrollTo(rv, pos);
        } catch (Throwable t) {
            // a wheel click must never take the screen down
        }
    }

    /**
     * Rebinds one row of a RecyclerView in place. True when the row is off screen (nothing to do)
     * or was rebound; false means the caller has to fall back to notifying the adapter.
     *
     * {@code Adapter.bindViewHolder} is the very call RecyclerView makes itself, so the holder ends
     * up in exactly the state a layout pass would have left it in — only without the layout pass.
     */
    private static boolean paint(RecyclerView rv, RecyclerView.Adapter a, int p, int n) {
        try {
            if (p < 0 || p >= n) return false;
            RecyclerView.LayoutManager lm = rv.getLayoutManager();
            if (!(lm instanceof LinearLayoutManager)) return false;
            View v = ((LinearLayoutManager) lm).findViewByPosition(p);
            // Off screen: nothing to repaint, and it cannot come back stale — the view cache is
            // held at zero for exactly that reason (see follow()).
            if (v == null) return true;
            RecyclerView.ViewHolder h = rv.getChildViewHolder(v);
            if (h == null) return false;
            a.bindViewHolder(h, p);
            return true;
        } catch (Throwable t) {
            return false;                                  // fall back to notifying the adapter
        }
    }

    /**
     * Brings the row on screen — at once, not over an animation.
     *
     * Stock smooth-scrolled to the cursor on every click, and so did this method for a while. On a
     * wheel that is wrong twice over: an animation takes several frames of layout and draw, so a
     * click costs many times what moving a highlight should (measured on Settings: ~50 ms of CPU per
     * click, against ~19 ms for the ListView screens), and the list is then always chasing a target
     * the wheel has already left — which is what "let go of the wheel and it goes on scrolling"
     * is. Every ListView screen in the app moves its window instantly; these now do the same, and
     * the far case (the main menu wrapping from the last row round to the first) is a jump.
     *
     * The edge the row is put against follows the direction of travel, the rule {@code Wheel.list}
     * already uses: going down the row belongs at the bottom edge, going up at the top. Snapping a
     * downward step to the top would drag the list a whole screen further than asked.
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

        boolean down = first < 0 || pos > last;
        // The keyboard's letter strip is the one horizontal list driven by the wheel (Keys), and
        // everything below is the same arithmetic along the other axis — "top/bottom" read as
        // "start/end edge" there. Nothing else changes: a step still moves the window by exactly
        // how far the item is cut off, and the far case still puts it against the edge the cursor
        // is travelling towards.
        boolean horiz = l.getOrientation() == LinearLayoutManager.HORIZONTAL;
        int top = horiz ? rv.getPaddingLeft() : rv.getPaddingTop();
        int bottom = horiz ? rv.getWidth() - rv.getPaddingRight()
                           : rv.getHeight() - rv.getPaddingBottom();
        View v = l.findViewByPosition(pos);
        if (v != null) {
            // Partially visible, which is the ordinary case for a single step: move the window by
            // exactly how far the row is cut off, so nothing else on screen shifts needlessly.
            int d = down ? (horiz ? v.getRight() : v.getBottom()) - bottom
                         : (horiz ? v.getLeft() : v.getTop()) - top;
            if (d != 0) {
                if (horiz) rv.scrollBy(d, 0); else rv.scrollBy(0, d);
            }
            return;
        }
        View any = l.getChildAt(0);
        int h = any == null ? 0 : (horiz ? any.getWidth() : any.getHeight());
        if (h > 0 && bottom > top) {
            l.scrollToPositionWithOffset(pos, down ? (bottom - top) - h : 0);
        } else {
            rv.scrollToPosition(pos);
        }
    }

    // ---- where a level of a multi-level screen was left ----------------------------------------
    //
    // A screen that pages several lists through one ListView comes back up with stock's
    // Other.gotoAdapter(lv, a, -1), i.e. setAdapter + setSelection(getPosition()) — which parks the
    // row the user picked on the TOP edge and scrolls everything they were looking at away. Albums
    // got its own answer for this (Albums.noteListScroll/restoreList); Genres has three levels, so
    // the note is kept PER ADAPTER instead of in one pair of fields — each level has an adapter of
    // its own (genres, artists, albums, songs), which makes the adapter the natural key. The map is
    // weak, so a finished Activity's adapters are not held.
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
            // a list that comes back at the top is still a usable list
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
            // Head.restore, not setSelectionFromTop: coming back up a level the Shuffle row may
            // still be on its way out, so the list's padding is about to change underneath.
            Head.restore(lv, st[0], st[1]);
        } else {
            lv.setSelection(pos);
        }
    }
}
