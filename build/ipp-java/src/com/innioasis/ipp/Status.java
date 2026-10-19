package com.innioasis.ipp;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.View;

import com.innioasis.music.adapter.MyBaseAdapter;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.service.PlayerService;
import com.innioasis.y1.utils.Static;

import java.io.File;

/**
 * The status-bar play icon. A track change publishes 1 → 3 → 0 → 1 on its way, which flashed ❚❚
 * in the lists and blinked the icon; those passing states are held back, but only during a track
 * change. And while the list on screen shows the play marker, the icon steps aside.
 */
public final class Status {

    private Status() { }

    private static final Handler H = new Handler(Looper.getMainLooper());

    /** {@code Static.playValue}: nothing loaded (icon hidden) and paused. */
    private static final int NONE = 0;
    private static final int PAUSE = 3;

    /** A held-back state is published anyway after this, so a track that never starts cannot stick. */
    private static final long FLIGHT_MS = 1500;

    private static final Settle SETTLE = new Settle();
    private static int pendingState;
    private static int pendingFrom;
    private static boolean pending;
    private static boolean firing;

    /** A track change is in progress: until "playing", what is published is scaffolding. */
    private static boolean flight;

    private static long openedAt = -100000;

    /**
     * From {@code PlayerService.restartPlay} and {@code Queue.onNewPlaylist} — both needed: a song
     * opened from a menu publishes its first state before restartPlay is reached.
     */
    public static void switching() {
        flight = true;
        Ahead.headPlaying();
    }

    /** A song opened from a menu: the player is coming up over this list ({@link #STEP_ASIDE_MS}). */
    public static void playerOpening() {
        flight = true;
        openedAt = SystemClock.uptimeMillis();
    }

    private static boolean justOpened() {
        return SystemClock.uptimeMillis() - openedAt < STEP_ASIDE_MS;
    }

    /**
     * Top of {@code Static.setPlayValue}; true = swallow. Holds back only PAUSE and NONE, only
     * during a track change — a real pause or stop is published at once. Main thread only.
     */
    public static boolean defer(int state, int from) {
        if (firing) return false;                  // our own delayed publish
        if (state != PAUSE && state != NONE) {     // settled on something real
            H.removeCallbacks(SETTLE);
            pending = false;
            flight = false;
            return false;
        }
        if (!flight) return false;
        H.removeCallbacks(SETTLE);
        pendingState = state;
        pendingFrom = from;
        pending = true;
        H.postDelayed(SETTLE, FLIGHT_MS);
        return true;
    }

    static final class Settle implements Runnable {
        public void run() {
            if (!pending) return;
            pending = false;
            flight = false;
            firing = true;
            try {
                Static.INSTANCE.setPlayValue(pendingState, pendingFrom);
            } catch (Throwable t) {
            } finally {
                firing = false;
            }
        }
    }

    private static final Bar BAR = new Bar();
    private static boolean posted;

    /** Per bound row (from {@code Follow.note}); the work runs once per layout, posted. */
    public static void check(View lv) {
        if (posted || lv == null) return;
        posted = true;
        if (!lv.post(BAR)) posted = false;
    }

    /**
     * The icon's wait before stepping aside, only after a song was opened from a menu: the player
     * covers the list at ~400 ms, and hiding the icon at once blinked it just before. Everything
     * else hides it immediately.
     */
    private static final long STEP_ASIDE_MS = 700;

    private static final Hide HIDE = new Hide();
    private static boolean hiding;

    /** We put the icon down, so stock re-showing it is undone at once. */
    private static boolean stepped;

    static final class Bar implements Runnable {
        public void run() {
            posted = false;
            try {
                View lv = Follow.list();
                if (lv == null) return;
                Object c = lv.getContext();
                if (!(c instanceof Activity)) return;
                if (markerVisible(lv, Follow.adapter())) {
                    if (!justOpened()) {
                        H.removeCallbacks(HIDE);
                        hiding = false;
                        stepped = true;
                        icon((Activity) c, View.GONE);
                        return;
                    }
                    if (hiding) return;
                    hiding = true;
                    H.postDelayed(HIDE, STEP_ASIDE_MS);
                } else {
                    H.removeCallbacks(HIDE);
                    hiding = false;
                    stepped = false;
                    icon((Activity) c, stock());
                }
            } catch (Throwable t) {
            }
        }
    }

    /** Asks again: the wheel may have moved on during the wait. */
    static final class Hide implements Runnable {
        public void run() {
            hiding = false;
            try {
                View lv = Follow.list();
                if (lv == null) return;
                Object c = lv.getContext();
                if (!(c instanceof Activity)) return;
                if (!markerVisible(lv, Follow.adapter())) return;
                stepped = true;
                icon((Activity) c, View.GONE);
            } catch (Throwable t) {
            }
        }
    }

    /**
     * After stock's {@code updatePlay} in onResume. Covers coming BACK to a list, whose rows are
     * not rebound.
     */
    public static void apply(Object activity) {
        step(activity, true);
    }

    /**
     * After stock's {@code updatePlay} in the play-state observer. A just-opened song is waited
     * out; once WE put the icon down, stock's re-show is undone at once.
     */
    public static void changed(Object activity) {
        step(activity, stepped || !justOpened());
    }

    private static void step(Object activity, boolean now) {
        try {
            if (!(activity instanceof Activity)) return;
            View lv = Follow.list();
            if (lv == null || lv.getContext() != activity) return;
            if (!markerVisible(lv, Follow.adapter())) return;
            if (now) {
                H.removeCallbacks(HIDE);
                hiding = false;
                stepped = true;
                icon((Activity) activity, View.GONE);
            } else if (!hiding) {
                hiding = true;
                H.postDelayed(HIDE, STEP_ASIDE_MS);
            }
        } catch (Throwable t) {
        }
    }

    /** Stock hides the icon only when nothing is loaded. */
    private static int stock() {
        try {
            Object v = Static.INSTANCE.getPlayValue().getValue();
            int state = (v instanceof Integer) ? ((Integer) v).intValue() : 0;
            return state == 0 ? View.GONE : View.VISIBLE;
        } catch (Throwable t) {
            return View.VISIBLE;
        }
    }

    private static void icon(Activity a, int vis) {
        View v = a.findViewById(R.id.play);
        if (v != null && v.getVisibility() != vis) v.setVisibility(vis);
    }

    /**
     * The marked row is among the visible ones. The adapter must still be the list's:
     * AlbumsActivity swaps it for the album list without binding a song row.
     */
    private static boolean markerVisible(View lv, MyBaseAdapter a) {
        if (a == null || Lv.model(lv) != a) return false;
        if (lv.getVisibility() != View.VISIBLE || lv.getWindowToken() == null) return false;
        PlayerService s = Y1Application.Companion.getPlayerService();
        // getPlayingSong, not getPlayingMusic: audiobook lists draw the marker too.
        Song song = (s == null) ? null : s.getPlayingSong();
        String path = (song == null) ? null : song.getPath();
        if (path == null || Rows.playMark(path, a) == 0) return false;
        int first = Lv.first(lv);
        int last = Lv.last(lv);
        int n = a.getCount();
        if (last >= n) last = n - 1;
        for (int i = (first < 0 ? 0 : first); i <= last; i++) {
            Object o = a.getItem(i);
            String p = (o instanceof Song) ? ((Song) o).getPath()
                     : (o instanceof File) ? ((File) o).getPath() : null;
            if (path.equals(p)) return true;
        }
        return false;
    }
}
