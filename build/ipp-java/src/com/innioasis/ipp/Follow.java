package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ListView;

import com.innioasis.music.adapter.MyBaseAdapter;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.service.PlayerService;
import com.innioasis.y1.view.ShufflePlaylistItemView;

import java.io.File;
import java.lang.ref.WeakReference;
import java.util.List;
import java.util.WeakHashMap;

/**
 * The list cursor follows the playing track.
 *
 * One rule, and it is about ownership of the cursor: the cursor belongs to the USER while
 * they are turning the wheel, and to PLAYBACK the rest of the time. Nothing else is asked — not how
 * the track changed, not how far away it is, not whether shuffle is on.
 *
 * A list is busy (the user's) while the screen is lit and its own cursor has moved
 * within the last {@link #idleMs()}. It is free (playback's) otherwise, which is exactly the
 * three cases worth naming:
 *   - the screen is off — there is nobody looking at the list, let alone turning the wheel;
 *   - the wheel has been silent for {@link #idleMs()} — the user has stopped browsing;
 *   - the list has only just been opened, or uncovered from under the player — nothing has been
 *       done to its cursor yet at all ({@link #resumed}).
 *
 * While the list is free, a track change moves the cursor onto the new track — a step,
 * scrolled by the wheel's own arithmetic ({@link #moveTo}). And the moment a busy list becomes
 * free, it catches up with whatever is playing in one move — a jump ({@link #land}) — rather
 * than sitting on a stale row until the next track happens to start. That is the whole of it.
 *
 * ONE question, asked directly. The tempting shape is a set of conditions per entry point — one
 * for a track change ({@code onSongChanged}), one for coming back from the player
 * ({@code resumed}) — each with its own take on "manual switch only", on shuffle, on a radius of
 * rows round the cursor and on an exemption for albums. Those disagree, and the shuffle rule in
 * particular points both ways: with a radius, following a shuffled track is a jump out of nowhere
 * and must be refused, while on leaving the player it is exactly what is wanted. Neither is a rule
 * about shuffle — both are the same rule about who was last touching the wheel, read through two
 * different proxies. Asking that directly costs one timestamp and every special case disappears.
 *
 * The consequence to know about: with the screen on and the wheel idle, a long list scrolls
 * by itself as playback moves through it. That is what "the cursor belongs to playback" means,
 * it is what Winamp and foobar2000 do with follow-playback on, and it is what the master toggle
 * "Selection follows playing song" is for.
 *
 * Two things deliberately sit outside the toggle, because the user asked for them by name rather
 * than by setting: leaving the player ({@link #leftPlayer}) and the queue's "open the source"
 * ({@link #toPlaying}, {@link #armPending}).
 *
 * The adapter and its ListView are noted from {@code SongListAdapter.getView} (its {@code parent}
 * argument is the ListView), so every screen built on that adapter is covered without a
 * per-Activity hook. No BroadcastReceiver of its own: {@code ListWatch} already listens for
 * {@code MY_PLAY_SONG} to refresh the playing indicator and calls {@link #onSongChanged} from
 * there.
 */
public final class Follow {

    private Follow() { }

    /**
     * How long the cursor stays the user's after it last moved — the "Return delay" sub-row of
     * "Selection follows playing song", in seconds.
     *
     * It is the one number the whole rule rests on, and how long "still browsing" lasts is not
     * something one number can answer for everybody: reading a screenful takes as long as it takes.
     * Public because the menu row is built from this very array ({@code IppActivity.buildItems}) —
     * the stored preference is an INDEX into it, so the two can never disagree. Same shape as
     * {@code Alpha.THRESHOLDS}.
     */
    public static final String KEY_IDLE = "follow_idle";
    public static final int[] IDLES = { 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 15, 20, 30 };
    public static final int IDLE_DEFAULT = 5;                // = 7 seconds

    private static long idleMs() {
        int i = Prefs.val(Y1Application.Companion.getAppContext(), KEY_IDLE);
        if (i < 0 || i >= IDLES.length) i = IDLE_DEFAULT;
        return IDLES[i] * 1000L;
    }

    private static WeakReference adapterRef;   // MyBaseAdapter
    private static WeakReference listRef;      // ListView

    /**
     * When each list's cursor was last moved by the wheel, keyed by the ADAPTER.
     *
     * Per list, never global: the long-press menu, the queue screen and every other list in the
     * app come through the same {@code Wheel.list}, and a global stamp would let scrolling one of
     * them freeze the following in another. The adapter is the natural key — it is what
     * {@code Wheel} has in its hand, it is what {@code Queue.atSource} and {@code Disc} identify a
     * list by, and a weak one lets a finished Activity's adapters go. Same shape as
     * {@code Wheel.noteLevel}.
     */
    private static final WeakHashMap lastMove = new WeakHashMap();

    /** Remember the song list currently being drawn. Called per row, so it stays a few compares. */
    public static void note(MyBaseAdapter a, ViewGroup parent) {
        if (a == null || !(parent instanceof ListView)) return;
        if (adapterRef == null || adapterRef.get() != a) adapterRef = new WeakReference(a);
        if (listRef == null || listRef.get() != parent) listRef = new WeakReference(parent);
        // "Is the screen on" is one of the two halves of `busy`, and nothing a View can be asked
        // answers it on this device (see Lit). Registering costs one static boolean test after the
        // first row ever bound.
        Lit.watch(parent.getContext());
        if (pendingUntil != 0) tryPending(a, (ListView) parent);
        // The status bar's play icon steps aside while this list is showing the same state itself.
        // One boolean test here; the work is posted, once per layout. See Status.
        Status.check(parent);
    }

    // ---- who owns the cursor -------------------------------------------------------------------

    /**
     * The cursor of this list has just been moved by the wheel — it is the user's for the next
     * {@link #idleMs()}.
     *
     * Called from {@code Wheel.list}, i.e. from where the CURSOR moves, and that placement is
     * the whole trap. The obvious hook is the key event, and it is wrong: in the player the
     * wheel is volume, so a naive stamp there would count turning the volume up as working with the
     * list, and leaving the player after a nudge of the volume would stop landing on the playing
     * track. {@code Wheel.list} has exactly one caller (stock {@code Other.listViewScroll}) and the
     * player, having no ListView, never reaches it.
     *
     * At the TOP of {@code Wheel.list}, before {@code Alpha.step} takes the fast-scroll branch
     * and before the "clamped at an end, nothing changed" return: both are the user turning the
     * wheel, whether or not the cursor ended up anywhere new.
     */
    public static void touched(ListView lv, Object a) {
        if (a == null) return;
        // The landing watcher lets go the instant the user takes the wheel. It stays installed for
        // up to WATCH_MS after a jump, watching for the list to move under it and putting it back —
        // which is right while the list is still assembling itself and WRONG the moment the move it
        // sees is the user's own: it undid the wheel's scroll, so the cursor walked off the bottom
        // edge and the list stood still. Cancelled here rather than merely ignored,
        // because Wheel.list runs this before it scrolls anything.
        stopLanding();
        lastMove.put(a, Long.valueOf(android.os.SystemClock.uptimeMillis()));
        if (enabled()) arm(lv, a);
    }

    /**
     * This list's cursor has not been touched at all — a freshly built list, or one uncovered from
     * under the player. Free, whatever the wheel was doing before it was covered.
     */
    private static void free(Object a) {
        if (a != null) lastMove.remove(a);
    }

    private static long stamp(Object a) {
        Object o = (a == null) ? null : lastMove.get(a);
        return (o instanceof Long) ? ((Long) o).longValue() : 0L;
    }

    /**
     * A long-press menu is open over the list ({@code SubMenuDialog}), which stops the clock.
     *
     * The menu is the user working with the row it was raised on, and it stays up for as long as
     * they read it — so without this the delay simply ran out underneath it and the cursor walked
     * away to the playing track while the menu went on standing over the row it had been opened
     * for, about to act on a row that was no longer there.
     *
     * Held from {@code Menus.onShow} ({@code SubMenuDialog.onStart}, which every menu in the app
     * goes through) and released from {@code SubMenuDialog.onStop}. A count and not a flag, so a
     * dialog raised over a dialog cannot release the hold early; {@code onStart}/{@code onStop} are
     * paired by the framework, and a stray release cannot take it below zero.
     */
    private static int holds;

    public static void hold(boolean on) {
        try {
            if (on) {
                holds++;
                return;
            }
            if (holds > 0) holds--;
            // Closing a menu is the user still working with this list, not the end of it: the
            // delay starts over from here, and the watcher is re-armed so the catch-up still comes
            // by itself. Without the arm, a list nothing has scrolled since would sit there until
            // the next track change.
            MyBaseAdapter a = adapter();
            ListView lv = list();
            if (a == null || lv == null || !enabled()) return;
            lastMove.put(a, Long.valueOf(android.os.SystemClock.uptimeMillis()));
            arm(lv, a);
        } catch (Throwable t) {
            // a clock that does not restart is better than a dialog that cannot close
        }
    }

    /**
     * Rows are ticked on this list — MultiSelect. Same as a menu being open, and for the same
     * reason: the ticks are a job the user is in the middle of, and the cursor walking away from
     * them mid-job is the cursor being taken off the row they are about to act on.
     */
    private static boolean ticked(Object a) {
        try {
            if (!(a instanceof MyBaseAdapter)) return false;
            List s = ((MyBaseAdapter) a).getSelectedIndexList();
            return s != null && !s.isEmpty();
        } catch (Throwable t) {
            return false;
        }
    }

    /**
     * How long until this list becomes playback's again, or 0 if it already is. One place, so the
     * test and the timer that waits for it can never read the clock differently.
     *
     * A held clock keeps its own stamp current rather than merely reporting "not yet":
     * held means the time is not passing at all, so when the hold ends the full delay must still be
     * there. Reporting alone would let the delay run out underneath the hold and the cursor would
     * jump the instant the menu closed — the very thing the hold exists to stop.
     */
    private static long freeIn(Object a) {
        long now = android.os.SystemClock.uptimeMillis();
        if (holds > 0 || ticked(a)) {
            if (a != null) lastMove.put(a, Long.valueOf(now));
            return idleMs();
        }
        if (!Lit.screenOn()) return 0;
        long t = stamp(a);
        if (t == 0) return 0;
        long left = idleMs() - (now - t);
        return left > 0 ? left : 0;
    }

    /** Is this list the user's right now? */
    private static boolean busy(Object a) {
        return freeIn(a) > 0;
    }

    /**
     * The busy → free transition, which has no event of its own: the wheel only ever reports
     * clicks, never a finger being lifted, so the end of browsing can only be a timer.
     *
     * One outstanding watcher per list is enough — a further click while it is queued does not
     * re-post, it lets the watcher fire, notice the list is busy again and re-arm itself for the
     * remainder. Otherwise a fast scroll (which reaches {@code Wheel.list} several times per click,
     * see {@code SpeedUtil}) would queue a message per step.
     */
    private static Idle idle;

    private static void arm(ListView lv, Object a) {
        if (lv == null) return;
        if (idle != null && idle.alive && idle.adapter() == a) return;
        Idle i = new Idle(a, lv);
        idle = i;
        lv.postDelayed(i, idleMs());
    }

    /** Named, never anonymous — d8 crashes on anonymous classes here (see CLAUDE.md). */
    private static final class Idle implements Runnable {
        private final WeakReference aRef;
        private final WeakReference lvRef;
        boolean alive = true;

        Idle(Object a, ListView lv) {
            this.aRef = new WeakReference(a);
            this.lvRef = new WeakReference(lv);
        }

        Object adapter() {
            return aRef.get();
        }

        @Override
        public void run() {
            try {
                Object a = aRef.get();
                Object lv = lvRef.get();
                if (!(a instanceof MyBaseAdapter) || !(lv instanceof ListView)) {
                    alive = false;
                    return;
                }
                long left = freeIn(a);
                if (left > 0) {                      // touched again, or a menu is holding the clock
                    ((ListView) lv).postDelayed(this, left);
                    return;
                }
                alive = false;
                // Not the list being drawn any more: its cursor is nobody's business now, and the
                // screen that took its place has a watcher of its own.
                if (Follow.adapter() != a) return;
                catchUp((MyBaseAdapter) a, (ListView) lv);
            } catch (Throwable t) {
                alive = false;
            }
        }
    }

    /**
     * Catch up with what is playing, in one move. The list has just become free (the wheel fell
     * silent, or the screen came back to it), so the row it should be pointing at is whatever is
     * playing — however far away that is, which makes this a jump and not a step.
     */
    private static void catchUp(MyBaseAdapter a, ListView lv) {
        try {
            if (!enabled()) return;
            if (!Queue.atSource(a)) return;
            String path = playingPath();
            if (path == null) return;
            int pos = indexOf(a, path);
            if (pos < 0 || pos == a.getPosition()) return;
            land(a, lv, pos);
        } catch (Throwable t) {
            // a cursor left where it was is no reason to crash the screen
        }
    }

    /**
     * Called from {@code ListWatch.onReceive}, i.e. on every {@code MY_PLAY_SONG}.
     *
     * A track change while the list is free is a STEP: playback has moved on by one, so the
     * cursor moves on with it and the list scrolls exactly as the wheel would have scrolled it. A
     * track change while the list is busy is ignored outright — the catch-up happens by itself when
     * the wheel falls silent.
     */
    public static void onSongChanged() {
        try {
            if (!enabled()) return;
            MyBaseAdapter a = adapter();
            ListView lv = list();
            if (a == null || lv == null) return;
            if (busy(a)) return;
            // Only in the list the track was started from. Elsewhere the same file may well be on
            // screen, but that list is not what is playing — moving its cursor onto the track would
            // be the same lie the ▶ marker no longer tells (Queue.atSource).
            if (!Queue.atSource(a)) return;

            String path = playingPath();
            if (path == null) return;

            int pos = indexOf(a, path);
            if (pos < 0 || pos == a.getPosition()) return;
            moveTo(a, lv, pos);
        } catch (Throwable t) {
            // following the track is never worth an exception on a broadcast
        }
    }

    /**
     * Land on row {@code pos}: the cursor goes there and the list is placed so the row rests against
     * the bottom edge, with everything before it on screen — what the list looks like when it
     * has simply been scrolled down to that track. Near the start of the list nothing can be scrolled
     * above row 0, so it rests at the top instead and the Shuffle row is showing, which is where that
     * row belongs: putting the TRACK against the top edge pushed the Shuffle row off the screen for
     * track 1, and left an album opened at its last track resting a row short of it.
     *
     * The placement waits for a pre-draw. It needs a row's height, and that can only be had from
     * the list's own children — while the caller is usually the code that has just handed the list
     * its songs, when the children still belong to whatever the list was showing before.
     */
    public static void land(MyBaseAdapter a, ListView lv, int pos) {
        if (a == null || lv == null || pos < 0) return;
        try {
            leaveShuffleRow(lv);
            a.setPosition(pos);
            stopLanding();                       // never two of them correcting one list
            Land w = new Land(a, lv, pos);
            watching = w;
            lv.getViewTreeObserver().addOnPreDrawListener(w);
        } catch (Throwable t) {
            // the cursor is on the right row either way; only the scroll is missing
        }
    }

    /**
     * The landing watcher currently installed, if any — see {@link #touched} for why one has to be
     * cancellable from outside. At most one: a second landing is a second answer to the same
     * question, and the older one has no business correcting the list towards the older row.
     */
    private static Land watching;

    private static void stopLanding() {
        Land w = watching;
        watching = null;
        if (w != null) w.drop();
    }

    /**
     * The placement itself, and then a check of where it actually landed — the check is the point.
     *
     * A first placement can only ESTIMATE, because the row it is aiming at is usually not attached
     * yet and its height is what the placement is made of. In an album the rows are not all the same
     * height (the first row of a disc carries the "CD N" strip), so an estimate off by a strip left
     * the track cut by the bottom edge, or below it altogether. Once the list has been laid out the
     * row is attached and answers for itself, so the next pass corrects it exactly — the same test
     * {@code Wheel.Fit} makes after a wheel click, against the same two edges.
     *
     * Every corrective pass returns false, i.e. cancels that frame, so none of it is ever drawn: the
     * first thing on screen is the finished placement.
     *
     * And it keeps watching for a moment afterwards, which is the second half of the same
     * problem. A correct placement does not stay correct: this list is still assembling itself, and
     * the "CD N" bar arriving grows the ListView's top padding from 49 to 65 — a padding change
     * carries the content with it (see {@code Head}), so the row that was resting exactly on the
     * bottom edge is pushed a strip's height past it. Measured on the device: pass 2 placed the row
     * at 266..315 against a bottom of 315, and what the user saw was that same row cut off. So the
     * listener stays until the row has been where it belongs for {@link #SETTLED} passes running,
     * bounded by {@link #MAX_PASSES} and by {@link #WATCH_MS} — {@code Head.place} can defer a
     * placement of its own, and two of them must not end up waiting for each other.
     *
     * Named, never anonymous — d8 crashes on anonymous classes here (see CLAUDE.md).
     */
    private static final int MAX_PASSES = 12;
    private static final int SETTLED = 3;
    private static final long WATCH_MS = 2000;

    private static final class Land implements ViewTreeObserver.OnPreDrawListener {
        /**
         * The list this row number means something in. AlbumsActivity and GenresActivity page
         * several lists through ONE ListView by swapping the adapter, so a row number outlives the
         * list it was worked out from — the same trap {@code Head}'s anchor has. Entering an album
         * and leaving it again straight away left this watcher correcting the ALBUM list towards a
         * track's row number for the rest of {@link #WATCH_MS}: the album list scrolled off to row
         * N while its cursor stayed where the user had left it, i.e. the highlight ended up
         * somewhere off screen. Leaving is the top button, not the wheel, so {@link #touched} —
         * the other way a landing is cancelled — never ran.
         */
        private final MyBaseAdapter a;
        private final ListView lv;
        private final int pos;
        private final long until = android.os.SystemClock.uptimeMillis() + WATCH_MS;
        private int passes;
        private int settled;
        private int snaps;

        Land(MyBaseAdapter a, ListView lv, int pos) {
            this.a = a;
            this.lv = lv;
            this.pos = pos;
        }

        /**
         * The list is only allowed to be scrolled at all when the row we came for needs it — and
         * that is the floor {@code Head.top} cannot express.
         *
         * {@code Head.top(lv)} is where the visible list begins right now, so it shrinks
         * as the Shuffle row rides away. Correcting a row "to the top edge" against it therefore
         * accepts whatever ride the placement arithmetic happened to leave and settles on it: half
         * a Shuffle row or none of one at all, differing from one album to the
         * next because what leaks in is where the list before it stood.
         *
         * So the question is asked the other way round. Row 0 is still attached, so the distance
         * from where it rests to where it is is how far this list has been scrolled from its
         * own start. With the list back at rest the row we came for would sit exactly that much
         * lower — and if it would still fit above the bottom edge there, there was never any reason
         * to have scrolled: the list belongs at its start, with the Shuffle row fully shown. Only
         * when the row genuinely does not fit is a scroll real, and then the ride is not an
         * artefact but the answer.
         *
         * Bounded by {@link #snaps} because the two corrections must never be able to push each
         * other back and forth; it converges on its own (after resting the scroll is 0, so the test
         * cannot fire again), and the bound is for the case where something else is moving the list
         * at the same time.
         */
        private boolean restIfNoNeed(View c, int bottom, int h) {
            if (snaps >= 2) return false;
            if (lv.getFirstVisiblePosition() != 0 || lv.getChildCount() == 0) return false;
            View c0 = lv.getChildAt(0);
            if (c0 == null) return false;
            int scrolled = lv.getPaddingTop() - c0.getTop();
            if (scrolled <= 0) return false;                  // already at its start
            if (c.getTop() + scrolled > bottom - h) return false;   // the scroll is really needed
            snaps++;
            Head.rest(lv);
            settled = 0;
            return true;
        }

        /** Take this watcher off the list. Safe to call twice; safe to call from outside a pass. */
        void drop() {
            try {
                lv.getViewTreeObserver().removeOnPreDrawListener(this);
            } catch (Throwable t) {
                // nothing left to undo
            }
        }

        private boolean done() {
            drop();
            if (watching == this) watching = null;
            return true;
        }

        @Override
        public boolean onPreDraw() {
            try {
                // The screen has swapped lists under us: this row number belongs to the list we
                // were landing in and means something else in the one now attached. A null adapter
                // is "not attached yet", which is not the same thing and must wait.
                Object now = lv.getAdapter();
                if (now != null && now != a) return done();

                int top = Head.top(lv);
                int bottom = lv.getHeight() - lv.getPaddingBottom();
                if (++passes > MAX_PASSES
                        || android.os.SystemClock.uptimeMillis() > until) return done();
                if (bottom <= top) return true;           // not laid out yet; wait for a real one

                View c = lv.getChildAt(pos - lv.getFirstVisiblePosition());
                if (c != null) {                          // it is on screen: it answers for itself
                    int h = c.getHeight();
                    if (h > bottom - top) return done();  // taller than the window: leave it be
                    if (restIfNoNeed(c, bottom, h)) return false;
                    if (c.getBottom() > bottom) {
                        Head.place(lv, pos, bottom - h);
                        settled = 0;
                        return false;
                    }
                    if (c.getTop() < top) {
                        Head.place(lv, pos, top);
                        settled = 0;
                        return false;
                    }
                    // Where it belongs — but the list may still be growing a "CD N" bar above it,
                    // which would push it off again, so let a few frames confirm it before letting go.
                    if (++settled >= SETTLED) return done();
                    return true;
                }

                // Not attached, so aim with the tallest row there is: overshooting only leaves the
                // next row peeking (which is what a scrolled list looks like), undershooting cuts
                // the row we came for. The pass after this one has it attached and corrects it.
                int h = 0;
                for (int i = 0; i < lv.getChildCount(); i++) {
                    View v = lv.getChildAt(i);
                    if (v != null && v.getHeight() > h) h = v.getHeight();
                }
                if (h <= 0) return done();
                int y = bottom - h;
                if (y < top) y = top;
                Head.place(lv, pos, y);
                settled = 0;
                return false;
            } catch (Throwable t) {
                return done();
            }
        }
    }

    /**
     * Put the cursor on row {@code pos} and bring it into view.
     *
     * Stepping (a track change while the list is free) scrolls by exactly the rule the
     * wheel uses ({@code Wheel.list}): going down at {@code pos >= last}, because
     * {@code getLastVisiblePosition()} counts the half-visible bottom row; going up when the row is
     * above the window or cut off by its top edge. Keeping the two in step matters — otherwise the
     * list a switched track scrolled to sits differently from the same list scrolled there by hand.
     *
     * A JUMP — catching up after the wheel falls silent, or landing after "open the source" — is
     * a different question and is {@link #land}: the row can be anywhere, and this arithmetic only
     * describes a step.
     */
    private static void moveTo(MyBaseAdapter a, ListView lv, int pos) {
        int first = lv.getFirstVisiblePosition();
        int last = lv.getLastVisiblePosition();
        leaveShuffleRow(lv);                                 // see below — before setPosition
        a.setPosition(pos);                                  // setPosition repaints
        if (pos >= last) {
            int target = pos - last + Wheel.firstShown(lv, first, Head.top(lv)) + 1;
            if (Head.headerShowing(lv)) target--;            // the Shuffle row is a slot of its own
            if (target < 0) target = 0;
            Head.selectPinned(lv, target);
        } else if (pos < first || Wheel.cutAtTop(lv, pos, first)) {
            Head.selectPinned(lv, pos);
        }
    }

    /**
     * Land on the playing track in this screen's list — what "open the source" asks of the screen it
     * comes back to (the queue). Outside the toggle and outside the busy/free rule alike: the
     * user has just asked for this one thing, about this one list.
     *
     * The ListView is found by walking the screen instead of by id — every section has its own
     * layout — and the adapter is whichever level that section is showing right now (Genres pages
     * three of them through one ListView). Posted, because the screen is still coming back up when
     * this is called: the activities that were covering it are only being finished.
     */
    public static void toPlaying(Activity act) {
        try {
            if (act == null || act.getWindow() == null) return;
            ListView lv = findList(act.getWindow().getDecorView());
            if (lv == null) return;
            Object ad = lv.getAdapter();
            if (!(ad instanceof MyBaseAdapter)) return;
            free(ad);
            lv.post(new Jump((MyBaseAdapter) ad, lv));
        } catch (Throwable t) {
            // coming back to the screen matters more than where its cursor lands
        }
    }

    // ---- a list that has just come up ----------------------------------------------------------

    /**
     * The player is going away. Set from {@code BasePlayerActivity.onPause} and only while the
     * player is finishing — that is what tells "the user left it" from "something was opened
     * over it" (the queue screen, an "Open album" out of a menu).
     *
     * {@code onDestroy} is too late and is the trap here: the lifecycle is
     * player.onPause → list.onResume → player.onStop → player.onDestroy, so a flag armed there is
     * set after the screen underneath has already asked for it. Covers both players —
     * {@code MusicPlayerActivity} and {@code AudioPlayerActivity} share the base.
     *
     * It matters because leaving the player is deliberately kept OUTSIDE the "Selection follows
     * playing song" toggle: that toggle is about a list the user is looking at, and while the
     * player was on top there was nothing to look at.
     */
    private static boolean fromPlayer;

    public static void leftPlayer(Activity player) {
        fromPlayer = player != null && player.isFinishing();
    }

    /**
     * Called from {@code BaseActivity.onResume}, i.e. on every screen there is.
     *
     * A list that has just been built, or has just been uncovered, is free by definition:
     * nothing has been done to its cursor since it came up, so it points at whatever is playing. So
     * this both clears the list's own busy stamp — wheel clicks from before the screen was covered
     * are not "the user is browsing this list right now" — and catches up straight away.
     *
     * {@code Queue.atSource} as everywhere else, so another section holding the same file is left
     * alone; and {@link Jump} answers "this list does not hold that track" for itself. Posted rather
     * than done here: the screen is still coming back up. A list that is still EMPTY at this point —
     * the usual case for a freshly built one, whose songs arrive from a coroutine a frame or more
     * later — is covered by the pending request instead.
     */
    public static void resumed(Object screen) {
        boolean player = fromPlayer;
        fromPlayer = false;
        // One boolean and one preference read on every screen change there is; the tree walk below
        // happens only when there is something for it to do.
        if (!player && !enabled()) return;
        try {
            if (!(screen instanceof Activity)) return;
            Activity act = (Activity) screen;
            if (act.getWindow() == null) return;
            ListView lv = findList(act.getWindow().getDecorView());
            if (lv == null) return;
            // The request is armed BEFORE the adapter is asked for, and that ORDER is the whole of
            // it: a screen being built for the first time has no adapter at onResume — its songs
            // arrive from a coroutine a frame or more later — so arming after the adapter check
            // armed nothing at all on the one path this was written for, and opening a list did
            // not land on the playing track. Both guards live in tryPending and cost
            // nothing when the list turns out not to be the source.
            armPending(player, null);
            Object ad = lv.getAdapter();
            if (!(ad instanceof MyBaseAdapter)) return;
            free(ad);
            if (!Queue.atSource(ad)) return;
            lv.post(new Jump((MyBaseAdapter) ad, lv));
        } catch (Throwable t) {
            // coming back to the screen matters more than where its cursor lands
        }
    }

    /**
     * The same thing for a screen whose list is not there yet — either because it has to be BUILT
     * again (the queue's "open the source", when the source was no longer in the stack) or because
     * it is simply still filling itself in ({@link #resumed}). There is nothing to move at that
     * moment, so the request waits and is taken by the first row the new list binds.
     *
     * Two guards, and between them they make a stale request harmless: the list must be the one the
     * track was started from ({@code Queue.atSource}, i.e. the same screen and the same title) and
     * it must actually hold the track. {@link #PENDING_MS} is the backstop for the case where the
     * screen never comes up at all.
     *
     * {@code force} is what the queue asks with: an explicit "show me the source" is outside the
     * toggle, while an ordinary screen coming up is not. A weak request never overwrites an
     * outstanding strong one.
     */
    private static final long PENDING_MS = 5000;
    private static long pendingUntil;
    private static boolean pendingForce;
    private static WeakReference pendingFor;   // the adapter it is about, or null = whichever comes

    public static void armPending() {
        armPending(true, null);
    }

    /**
     * A list has just been handed a new set of rows — from {@code MyBaseAdapter.setItems}, the one
     * call every list in the app is built by. That is what makes "the list has only just been
     * opened" work on the screens that never resume: AlbumsActivity and GenresActivity page their
     * levels through a single Activity and a single ListView, so entering an album or descending a
     * genre fires no lifecycle callback at all — but it always sets items.
     *
     * Armed FOR THIS ADAPTER, which is what keeps it honest: the long-press menu is a
     * {@code MyBaseAdapter} too and sets its items every time it opens, and a request left open to
     * whoever binds next would be taken by the song list underneath — raising a menu would jump the
     * list to the playing track. A menu's own request is simply never claimed and expires.
     */
    public static void rebuilt(Object a) {
        try {
            free(a);
            if (!enabled()) return;
            armPending(false, a);
        } catch (Throwable t) {
            // a list that does not catch up is not worth an exception in the adapter
        }
    }

    private static void armPending(boolean force, Object a) {
        long now = android.os.SystemClock.uptimeMillis();
        if (force || pendingUntil == 0 || now > pendingUntil) {
            pendingForce = force;
            pendingFor = (a == null) ? null : new WeakReference(a);
        }
        pendingUntil = now + PENDING_MS;
    }

    private static void tryPending(MyBaseAdapter a, ListView lv) {
        try {
            if (android.os.SystemClock.uptimeMillis() > pendingUntil) { pendingUntil = 0; return; }
            if (!pendingForce && !enabled()) { pendingUntil = 0; return; }
            if (pendingFor != null && pendingFor.get() != a) return;   // it is about another list
            if (busy(a)) return;                                       // still the user's
            if (!Queue.atSource(a)) return;
            String p = playingPath();
            if (p == null || indexOf(a, p) < 0) return;
            pendingUntil = 0;
            // Pre-draw, not post: this runs from a bind, i.e. inside the layout pass, and a posted
            // move happens a whole frame later — the screen is drawn once with the cursor where the
            // list built it and then again with it on the playing track, which reads as the
            // highlight jumping. A pre-draw listener runs after the layout and before the draw of
            // the SAME traversal, and cancelling that draw means the first thing shown is already
            // right. (Same reason Disc hands the CD bar over from one.)
            lv.getViewTreeObserver().addOnPreDrawListener(new PreJump(a, lv));
        } catch (Throwable t) {
            pendingUntil = 0;
        }
    }

    /** Named, never anonymous — d8 crashes on anonymous classes here (see CLAUDE.md). */
    private static final class PreJump implements ViewTreeObserver.OnPreDrawListener {
        private final MyBaseAdapter a;
        private final ListView lv;

        PreJump(MyBaseAdapter a, ListView lv) {
            this.a = a;
            this.lv = lv;
        }

        @Override
        public boolean onPreDraw() {
            try {
                lv.getViewTreeObserver().removeOnPreDrawListener(this);
            } catch (Throwable t) {
                // it will not be called twice either way: the move is idempotent
            }
            try {
                String p = playingPath();
                if (p == null) return true;
                int pos = indexOf(a, p);
                if (pos < 0) return true;
                land(a, lv, pos);
            } catch (Throwable t) {
                return true;
            }
            return false;        // skip this frame; the traversal the move asks for draws the row
        }
    }

    private static ListView findList(View v) {
        if (v instanceof ListView) return (ListView) v;
        if (!(v instanceof ViewGroup)) return null;
        ViewGroup g = (ViewGroup) v;
        for (int i = 0; i < g.getChildCount(); i++) {
            ListView lv = findList(g.getChildAt(i));
            if (lv != null) return lv;
        }
        return null;
    }

    /** Named, never anonymous — d8 crashes on anonymous classes here (see CLAUDE.md). */
    private static final class Jump implements Runnable {
        private final MyBaseAdapter a;
        private final ListView lv;

        Jump(MyBaseAdapter a, ListView lv) {
            this.a = a;
            this.lv = lv;
        }

        @Override
        public void run() {
            try {
                String path = playingPath();
                if (path == null) return;
                int pos = indexOf(a, path);
                if (pos < 0) return;                         // this list does not hold that track
                // Taken here, so a pending request cannot land the same row a second time and set
                // a second placement running over the top of this one.
                pendingUntil = 0;
                if (pos == a.getPosition()) return;
                land(a, lv, pos);
            } catch (Throwable t) {
                // ignore — a cursor left where it was is no reason to crash the screen
            }
        }
    }

    /**
     * The Shuffle row above the list keeps its own selected state, entirely outside the adapter:
     * while the cursor is on it the adapter is parked at -1 ({@code cancelSelect}) and the row
     * paints its own highlight. Moving the cursor down normally goes through
     * {@code ShufflePlaylistItemView.onClockwise}, which clears that; jumping straight into the
     * list from here does not, so the highlight stayed on the Shuffle row as well as on the track
     * — two cursors on one screen.
     *
     * The row is a sibling of the ListView (@id/spv, in every screen that has one), which is how
     * {@code Disc} reaches the disc bar too. {@code onClockwise} is the stock exit from the row and
     * does all three things needed: clear its flag, let the adapter select rows again
     * ({@code setDenySelectIndex(false)}) and repaint.
     */
    private static void leaveShuffleRow(ListView lv) {
        try {
            Object parent = lv.getParent();
            if (!(parent instanceof View)) return;
            View v = ((View) parent).findViewById(R.id.spv);
            if (!(v instanceof ShufflePlaylistItemView)) return;
            ShufflePlaylistItemView spv = (ShufflePlaylistItemView) v;
            if (spv.isSelect()) spv.onClockwise();
        } catch (Throwable t) {
            // the follow is worth more than the tidy-up
        }
    }

    /**
     * Row of the playing track in the open list, or -1 if this list does not hold it.
     *
     * Folders is the one list that is not made of songs: its rows are {@code File}s (folders as
     * well as files), and the {@code Song} FilesActivity builds for the playlist carries exactly
     * {@code File.getPath()}, so that is what matches.
     */
    private static int indexOf(MyBaseAdapter a, String path) {
        for (int i = 0; i < a.getCount(); i++) {
            Object o = a.getItem(i);
            if (o instanceof Song && path.equals(((Song) o).getPath())) return i;
            if (o instanceof File && path.equals(((File) o).getPath())) return i;
        }
        return -1;
    }

    private static boolean enabled() {
        Context c = Y1Application.Companion.getAppContext();
        return Prefs.on(c, "follow_playing");
    }

    private static String playingPath() {
        PlayerService s = Y1Application.Companion.getPlayerService();
        if (s == null) return null;
        // The song of whichever player is running — the audiobook list follows its book the same
        // way a song list follows its track.
        Song song = s.getPlayingSong();
        return song == null ? null : song.getPath();
    }

    /** The song list currently being drawn — {@code Status} asks the same question. */
    static MyBaseAdapter adapter() {
        Object o = adapterRef == null ? null : adapterRef.get();
        return (o instanceof MyBaseAdapter) ? (MyBaseAdapter) o : null;
    }

    static ListView list() {
        Object o = listRef == null ? null : listRef.get();
        return (o instanceof ListView) ? (ListView) o : null;
    }
}
