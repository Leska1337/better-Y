package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;

import androidx.recyclerview.widget.RecyclerView;

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
 * The list cursor follows the playing track. One rule: the cursor is the USER's while the screen
 * is lit and the wheel moved it within {@link #idleMs()}, PLAYBACK's otherwise. Free, a track change
 * steps the cursor ({@link #moveTo}); becoming free, it catches up in one jump ({@link #land}). No
 * per-case rules on shuffle or distance — they contradicted each other. Leaving the player and the
 * queue's "open the source" act outside the toggle.
 */
public final class Follow {

    private Follow() { }

    /**
     * "Return delay", seconds. The pref is an INDEX into {@link #IDLES}, which the menu row is built
     * from.
     */
    public static final String KEY_IDLE = "follow_idle";
    public static final int[] IDLES = { 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 15, 20, 30 };
    public static final int IDLE_DEFAULT = 5;                // = 7 seconds

    public static long idleMs() {
        int i = Prefs.val(Y1Application.Companion.getAppContext(), KEY_IDLE);
        if (i < 0 || i >= IDLES.length) i = IDLE_DEFAULT;
        return IDLES[i] * 1000L;
    }

    private static WeakReference adapterRef;   // MyBaseAdapter
    private static WeakReference listRef;      // the song list, either kind (Lv)

    /**
     * When each list's cursor was last moved by the wheel, per ADAPTER — a global stamp would let
     * scrolling a menu freeze the following in the list under it.
     */
    private static final WeakHashMap lastMove = new WeakHashMap();

    /** {@code SongListAdapter.getView}, every row: remember the list being drawn. Keep it cheap. */
    public static void note(MyBaseAdapter a, ViewGroup parent) {
        if (a == null || !Lv.is(parent)) return;
        if (adapterRef == null || adapterRef.get() != a) adapterRef = new WeakReference(a);
        if (listRef == null || listRef.get() != parent) listRef = new WeakReference(parent);
        Lit.watch(parent.getContext());          // "is the screen on", see Lit
        if (pendingUntil != 0) tryPending(a, parent);
        Status.check(parent);
    }

    /**
     * The wheel has just moved this list's cursor. From {@code Wheel.rows}, NOT the
     * key event: in the player the wheel is volume. At its TOP, before Alpha's branch and the
     * clamped-at-an-end return — both are the user turning the wheel.
     */
    public static void touched(View lv, Object a) {
        if (a == null) return;
        // the landing watcher would undo the user's own scroll
        stopLanding();
        lastMove.put(a, Long.valueOf(android.os.SystemClock.uptimeMillis()));
        if (enabled()) arm(lv, a);
    }

    /** A fresh or uncovered list: free, whatever the wheel did before. */
    private static void free(Object a) {
        if (a != null) lastMove.remove(a);
    }

    private static long stamp(Object a) {
        Object o = (a == null) ? null : lastMove.get(a);
        return (o instanceof Long) ? ((Long) o).longValue() : 0L;
    }

    /**
     * An open menu stops the clock, or the cursor walks away from the row the menu acts on.
     * {@code SubMenuDialog.onStart}/{@code onStop}; a count, for a dialog over a dialog.
     */
    private static int holds;

    public static void hold(boolean on) {
        try {
            if (on) {
                holds++;
                return;
            }
            if (holds > 0) holds--;
            // closing a menu restarts the delay; the watcher re-armed brings the catch-up
            MyBaseAdapter a = adapter();
            View lv = list();
            if (a == null || lv == null || !enabled()) return;
            lastMove.put(a, Long.valueOf(android.os.SystemClock.uptimeMillis()));
            arm(lv, a);
        } catch (Throwable t) {
        }
    }

    /** Ticked rows (MultiSelect) hold the clock like a menu. */
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
     * How long until the list is playback's, or 0. A hold keeps the stamp CURRENT, so the full
     * delay is still there when it ends.
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

    private static boolean busy(Object a) {
        return freeIn(a) > 0;
    }

    /**
     * Busy → free has no event (the wheel reports no lifted finger), so it is a timer. One per
     * list: it re-arms itself for the remainder instead of a post per click.
     */
    private static Idle idle;

    private static void arm(View lv, Object a) {
        if (lv == null) return;
        if (idle != null && idle.alive && idle.adapter() == a) return;
        Idle i = new Idle(a, lv);
        idle = i;
        lv.postDelayed(i, idleMs());
    }

    private static final class Idle implements Runnable {
        private final WeakReference aRef;
        private final WeakReference lvRef;
        boolean alive = true;

        Idle(Object a, View lv) {
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
                if (!(a instanceof MyBaseAdapter) || !(lv instanceof View)) {
                    alive = false;
                    return;
                }
                long left = freeIn(a);
                if (left > 0) {
                    ((View) lv).postDelayed(this, left);
                    return;
                }
                alive = false;
                if (Follow.adapter() != a) return;
                catchUp((MyBaseAdapter) a, (View) lv);
            } catch (Throwable t) {
                alive = false;
            }
        }
    }

    /** The list has just become free: jump to what is playing. */
    private static void catchUp(MyBaseAdapter a, View lv) {
        try {
            if (!enabled()) return;
            if (!Queue.atSource(a)) return;
            String path = playingPath();
            if (path == null) return;
            int pos = indexOf(a, path);
            if (pos < 0 || pos == a.getPosition()) return;
            land(a, lv, pos);
        } catch (Throwable t) {
        }
    }

    /** {@code ListWatch}, every {@code MY_PLAY_SONG}: a free list STEPS, a busy one waits. */
    public static void onSongChanged() {
        try {
            if (!enabled()) return;
            MyBaseAdapter a = adapter();
            View lv = list();
            if (a == null || lv == null) return;
            if (busy(a)) return;
            // only the list the track was started from
            if (!Queue.atSource(a)) return;

            String path = playingPath();
            if (path == null) return;

            int pos = indexOf(a, path);
            if (pos < 0 || pos == a.getPosition()) return;
            moveTo(a, lv, pos);
        } catch (Throwable t) {
        }
    }

    /**
     * Land on row {@code pos}: it rests against the BOTTOM edge with the list above it on screen;
     * near the start the list stays at rest with the Shuffle row shown. Placed from a pre-draw:
     * the caller has usually just handed the list its songs, and the children are still the old ones.
     */
    public static void land(MyBaseAdapter a, View lv, int pos) {
        if (a == null || lv == null || pos < 0) return;
        try {
            leaveShuffleRow(lv);
            a.setPosition(pos);
            stopLanding();                       // never two of them correcting one list
            Land w = new Land(a, lv, pos);
            watching = w;
            lv.getViewTreeObserver().addOnPreDrawListener(w);
        } catch (Throwable t) {
        }
    }

    /** The one landing watcher, cancellable from {@link #touched}. */
    private static Land watching;

    private static void stopLanding() {
        Land w = watching;
        watching = null;
        if (w != null) w.drop();
    }

    private static final int MAX_PASSES = 12;
    private static final int SETTLED = 3;
    private static final long WATCH_MS = 2000;

    /**
     * The placement, then a check of where it landed: the first pass can only ESTIMATE (the row is
     * not attached and disc rows differ in height). Corrective passes cancel their frame, so only
     * the finished placement is drawn. It watches on until {@link #SETTLED} quiet passes — the disc
     * plate arriving pushes the row off — bounded by passes and time.
     */
    private static final class Land implements ViewTreeObserver.OnPreDrawListener {
        /**
         * The list this row number belongs to: Albums and Genres swap adapters in one list,
         * and leaving with the top button never reaches {@link #touched}.
         */
        private final MyBaseAdapter a;
        private final View lv;
        private final int pos;
        private final long until = android.os.SystemClock.uptimeMillis() + WATCH_MS;
        private int passes;
        private int settled;
        private int snaps;

        Land(MyBaseAdapter a, View lv, int pos) {
            this.a = a;
            this.lv = lv;
            this.pos = pos;
        }

        /**
         * Scroll only when the row needs it: if it would fit with the list at rest, rest it, with
         * the Shuffle row fully shown — otherwise a half-ridden Shuffle row is left over. Bounded
         * by {@link #snaps} so the two corrections cannot push each other back and forth.
         */
        private boolean restIfNoNeed(View c, int bottom, int h) {
            if (snaps >= 2) return false;
            int scrolled = Lv.scrolled(lv);
            if (scrolled <= 0) return false;                  // already at its start
            if (c.getTop() + scrolled > bottom - h) return false;   // the scroll is really needed
            snaps++;
            Lv.rest(lv);
            settled = 0;
            return true;
        }

        /** Safe twice, and from outside a pass. */
        void drop() {
            try {
                lv.getViewTreeObserver().removeOnPreDrawListener(this);
            } catch (Throwable t) {
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
                // Another list now; null is "not attached yet" and waits.
                Object now = Lv.model(lv);
                if (now != null && now != a) return done();

                int top = Lv.top(lv);
                int bottom = Lv.bottom(lv);
                if (++passes > MAX_PASSES
                        || android.os.SystemClock.uptimeMillis() > until) return done();
                if (bottom <= top) return true;           // not laid out yet

                View c = Lv.row(lv, pos);
                if (c != null) {
                    int h = c.getHeight();
                    if (h > bottom - top) return done();
                    if (restIfNoNeed(c, bottom, h)) return false;
                    if (c.getBottom() > bottom) {
                        Lv.place(lv, pos, bottom - h);
                        settled = 0;
                        return false;
                    }
                    if (c.getTop() < top) {
                        Lv.place(lv, pos, top);
                        settled = 0;
                        return false;
                    }
                    if (++settled >= SETTLED) return done();
                    return true;
                }

                // Not attached: aim with the tallest row — overshooting only shows the next row.
                int h = 0;
                for (int i = 0; i < ((android.view.ViewGroup) lv).getChildCount(); i++) {
                    View v = ((android.view.ViewGroup) lv).getChildAt(i);
                    if (v != null && v.getHeight() > h) h = v.getHeight();
                }
                if (h <= 0) return done();
                int y = bottom - h;
                if (y < top) y = top;
                Lv.place(lv, pos, y);
                settled = 0;
                return false;
            } catch (Throwable t) {
                return done();
            }
        }
    }

    /**
     * A STEP onto row {@code pos}, scrolled by exactly the wheel's rule ({@code Wheel.rows}), so it
     * sits as if scrolled there by hand. A jump is {@link #land}.
     */
    private static void moveTo(MyBaseAdapter a, View v, int pos) {
        if (!(v instanceof RecyclerView)) return;
        // the wheel's own step: Wheel.follow draws and scrolls it
        RecyclerView rv = (RecyclerView) v;
        int from = a.getPosition() + SongRows.heads(rv);
        leaveShuffleRow(v);
        a.setPosition(pos);
        Wheel.follow(rv, from, pos + SongRows.heads(rv), rv.getAdapter());
    }

    /**
     * The queue's "open the source": land on the playing track, outside the toggle and the
     * busy/free rule. The list is found by walking the screen; posted, the screen is still
     * coming back up.
     */
    public static void toPlaying(Activity act) {
        try {
            if (act == null || act.getWindow() == null) return;
            View lv = Lv.find(act.getWindow().getDecorView());
            if (lv == null) return;
            Object ad = Lv.model(lv);
            if (!(ad instanceof MyBaseAdapter)) return;
            free(ad);
            lv.post(new Jump((MyBaseAdapter) ad, lv));
        } catch (Throwable t) {
        }
    }

    /**
     * The player is being LEFT, not covered: {@code BasePlayerActivity.onPause} while finishing.
     * Not {@code onDestroy} — the list underneath resumes before it. Outside the toggle.
     */
    private static boolean fromPlayer;

    public static void leftPlayer(Activity player) {
        fromPlayer = player != null && player.isFinishing();
    }

    /**
     * {@code BaseActivity.onResume}, every screen: a list just built or uncovered is free — clear
     * its stamp and catch up. A list still EMPTY (songs come from a coroutine) is covered by the
     * pending request.
     */
    public static void resumed(Object screen) {
        boolean player = fromPlayer;
        fromPlayer = false;
        if (!player && !enabled()) return;
        try {
            if (!(screen instanceof Activity)) return;
            Activity act = (Activity) screen;
            if (act.getWindow() == null) return;
            View lv = Lv.find(act.getWindow().getDecorView());
            if (lv == null) return;
            // Armed BEFORE the adapter check: a new screen has no adapter at onResume yet.
            armPending(player, null, act);
            Object ad = Lv.model(lv);
            if (!(ad instanceof MyBaseAdapter)) return;
            free(ad);
            if (!Queue.atSource(ad)) return;
            lv.post(new Jump((MyBaseAdapter) ad, lv));
        } catch (Throwable t) {
        }
    }

    // A landing for a list not there yet, taken by the first row it binds. Harmless when stale:
    // the list must be the source and hold the track. A forced request (the queue's) is outside
    // the toggle and is never overwritten by a weak one.
    private static final long PENDING_MS = 5000;
    private static long pendingUntil;
    private static boolean pendingForce;
    private static WeakReference pendingFor;   // the adapter it is about, or null = whichever comes
    // The screen it is about, or null. Leaving the player lands only on the screen under it — the
    // next section opened from there is not "just left the player" and keeps its first row.
    private static WeakReference pendingScreen;

    public static void armPending() {
        armPending(true, null, null);
    }

    /**
     * {@code MyBaseAdapter.setItems}: a fresh list where no lifecycle fires (Albums and Genres
     * levels). Armed FOR THIS ADAPTER — a menu sets items too, and must not jump the list under it.
     */
    public static void rebuilt(Object a) {
        try {
            free(a);
            if (!enabled()) return;
            armPending(false, a, null);
        } catch (Throwable t) {
        }
    }

    private static void armPending(boolean force, Object a, Activity screen) {
        long now = android.os.SystemClock.uptimeMillis();
        if (force || pendingUntil == 0 || now > pendingUntil) {
            pendingForce = force;
            pendingFor = (a == null) ? null : new WeakReference(a);
            pendingScreen = (screen == null) ? null : new WeakReference(screen);
        }
        pendingUntil = now + PENDING_MS;
    }

    private static Activity activityOf(Context c) {
        while (c instanceof android.content.ContextWrapper) {
            if (c instanceof Activity) return (Activity) c;
            c = ((android.content.ContextWrapper) c).getBaseContext();
        }
        return null;
    }

    private static void tryPending(MyBaseAdapter a, View lv) {
        try {
            if (android.os.SystemClock.uptimeMillis() > pendingUntil) { pendingUntil = 0; return; }
            if (!pendingForce && !enabled()) { pendingUntil = 0; return; }
            if (pendingFor != null && pendingFor.get() != a) return;
            if (pendingScreen != null && pendingScreen.get() != activityOf(lv.getContext())
                    && !enabled()) return;
            if (busy(a)) return;
            if (!Queue.atSource(a)) return;
            String p = playingPath();
            if (p == null || indexOf(a, p) < 0) return;
            pendingUntil = 0;
            // Pre-draw, not post: posted, the highlight is drawn once in the wrong place.
            lv.getViewTreeObserver().addOnPreDrawListener(new PreJump(a, lv));
        } catch (Throwable t) {
            pendingUntil = 0;
        }
    }

    private static final class PreJump implements ViewTreeObserver.OnPreDrawListener {
        private final MyBaseAdapter a;
        private final View lv;

        PreJump(MyBaseAdapter a, View lv) {
            this.a = a;
            this.lv = lv;
        }

        @Override
        public boolean onPreDraw() {
            try {
                lv.getViewTreeObserver().removeOnPreDrawListener(this);
            } catch (Throwable t) {
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
            return false;
        }
    }

    private static final class Jump implements Runnable {
        private final MyBaseAdapter a;
        private final View lv;

        Jump(MyBaseAdapter a, View lv) {
            this.a = a;
            this.lv = lv;
        }

        @Override
        public void run() {
            try {
                String path = playingPath();
                if (path == null) return;
                int pos = indexOf(a, path);
                if (pos < 0) return;
                pendingUntil = 0;                            // no second landing on top of this one
                if (pos == a.getPosition()) return;
                land(a, lv, pos);
            } catch (Throwable t) {
            }
        }
    }

    /**
     * The Shuffle row keeps its own selection outside the adapter; a jump into the list leaves it
     * highlighted too. {@code onClockwise} is stock's exit from the row.
     */
    private static void leaveShuffleRow(View lv) {
        try {
            ShufflePlaylistItemView spv = Lv.shuffle(lv);
            if (spv != null && spv.isSelect()) spv.onClockwise();
        } catch (Throwable t) {
        }
    }

    /** The playing track's row, or -1. Folders' rows are {@code File}s, matched by path. */
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
        // whichever player is running: audiobooks follow too
        Song song = s.getPlayingSong();
        return song == null ? null : song.getPath();
    }

    /** The song list currently being drawn. */
    static MyBaseAdapter adapter() {
        Object o = adapterRef == null ? null : adapterRef.get();
        return (o instanceof MyBaseAdapter) ? (MyBaseAdapter) o : null;
    }

    static View list() {
        Object o = listRef == null ? null : listRef.get();
        return (o instanceof View) ? (View) o : null;
    }
}
