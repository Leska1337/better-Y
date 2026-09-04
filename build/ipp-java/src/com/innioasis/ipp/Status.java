package com.innioasis.ipp;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.View;
import android.widget.ListView;

import com.innioasis.music.adapter.MyBaseAdapter;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.service.PlayerService;
import com.innioasis.y1.utils.Static;

import java.io.File;

/**
 * The play state as the user sees it — the icon in the status bar, and its relationship with the
 * marker the lists draw ({@link Rows#playMark}).
 *
 * Two jobs, both about that one icon:
 * <ul>
 *   <li><b>What a track change publishes on its way is not a state.</b> Switching tracks pauses the
 *       old one and leaves {@code playing == None} while the next is prepared — and
 *       {@code setPlayValue} turns None into 0 whatever it was asked for. So the sequence is
 *       1 → 3 → 0 → 1, which flashed ❚❚ in the lists and blinked the status icon out. Both are
 *       held back, but <b>only between the start of a track change and the moment playback settles
 *       on something real</b>; outside that window nothing is delayed at all.</li>
 *   <li><b>The icon steps aside for the list.</b> While the list on screen is showing this very
 *       state next to the track itself, the status bar repeating it says nothing — so the icon is
 *       hidden, and it comes back the moment the marked row scrolls out of view or the user leaves
 *       for a screen that does not show one.</li>
 * </ul>
 *
 * Cost: {@link #check} is one boolean test per bound row, and at most one posted runnable per
 * layout, which walks the <b>visible</b> rows only (six to eight of them) and compares a path. It
 * never scans the list.
 */
public final class Status {

    private Status() { }

    private static final Handler H = new Handler(Looper.getMainLooper());

    // ------------------------------------------------- the states a track change publishes on its way

    /** {@code Static.playValue}: nothing loaded (icon hidden) and paused. */
    private static final int NONE = 0;
    private static final int PAUSE = 3;

    /**
     * How long a track is allowed to take before a held-back state is published anyway. Nobody
     * normally sees this: playback settles on "playing" long before, which publishes at once. It
     * exists so a track that never starts cannot leave the state stuck on the previous one.
     */
    private static final long FLIGHT_MS = 1500;

    private static final Settle SETTLE = new Settle();
    private static int pendingState;
    private static int pendingFrom;
    private static boolean pending;
    private static boolean firing;

    /** A track is being put on: from here to "playing", what is published is scaffolding. */
    private static boolean flight;

    /** When a song was opened from a menu, i.e. when the player was last on its way up. */
    private static long openedAt = -100000;

    /**
     * Injected at the start of {@code PlayerService.restartPlay} and of a new playlist
     * ({@code Queue.onNewPlaylist}, i.e. the top of {@code setMusicPlaylist}) — the two ways a
     * track change begins. Both are needed: opening a song from a menu publishes its first state
     * from {@code MusicPlayerActivity.onCreate}, before restartPlay is ever reached.
     */
    public static void switching() {
        flight = true;
    }

    /**
     * The stronger of the two: a song was opened <b>from a menu</b>, so the player Activity is on
     * its way up over this list. Only in that case does the icon wait before stepping aside — see
     * {@link #STEP_ASIDE_MS}. Skipping tracks with the side buttons goes through
     * {@link #switching()} alone and is not affected.
     */
    public static void playerOpening() {
        flight = true;
        openedAt = SystemClock.uptimeMillis();
    }

    private static boolean justOpened() {
        return SystemClock.uptimeMillis() - openedAt < STEP_ASIDE_MS;
    }

    /**
     * Injected at the top of {@code Static.setPlayValue}: true = swallow this call.
     *
     * Only two states are ever held back, and only while a track change is in flight:
     * <b>3 (paused)</b>, because switching tracks pauses the old one on the way, and
     * <b>0 (nothing loaded)</b>, which is not even asked for — {@code setPlayValue} substitutes it
     * for whatever it was given whenever {@code playing == None}, and that is exactly what the
     * player is between two tracks. Those two are what flashed: ❚❚ in the lists, and the status
     * bar's icon blinking out and coming back on the player.
     *
     * Outside a track change nothing is delayed at all — a pause, a stop or an ejected card is
     * published the moment it happens.
     *
     * On the main thread by construction: {@code setValue} on a MutableLiveData throws anywhere
     * else.
     */
    public static boolean defer(int state, int from) {
        if (firing) return false;                  // our own delayed publish coming back through
        if (state != PAUSE && state != NONE) {     // the player settled on something real
            H.removeCallbacks(SETTLE);
            pending = false;
            flight = false;
            return false;
        }
        if (!flight) return false;                 // asked for, not passed through: show it now
        H.removeCallbacks(SETTLE);
        pendingState = state;
        pendingFrom = from;
        pending = true;
        H.postDelayed(SETTLE, FLIGHT_MS);
        return true;
    }

    /** Named, not anonymous — the bundled d8 crashes dexing anonymous classes here. */
    static final class Settle implements Runnable {
        public void run() {
            if (!pending) return;
            pending = false;
            flight = false;
            firing = true;
            try {
                Static.INSTANCE.setPlayValue(pendingState, pendingFrom);
            } catch (Throwable t) {
                // a state that cannot be published is better than a crash on a timer
            } finally {
                firing = false;
            }
        }
    }

    // ------------------------------------------------------------- the icon and the list marker

    private static final Bar BAR = new Bar();
    private static boolean posted;

    /**
     * Called per bound row (from {@code Follow.note}). Everything real happens once per layout,
     * from the posted runnable — a bind is not the place to change the size of a sibling view, and
     * during a burst of wheel clicks there is nothing to recheck between the rows anyway.
     */
    public static void check(View lv) {
        if (posted || lv == null) return;
        posted = true;
        if (!lv.post(BAR)) posted = false;
    }

    /**
     * How long the icon waits before stepping aside — <b>only</b> when a song was just opened from
     * a menu ({@link #playerOpening()}), and for nothing else.
     *
     * That one case is special because the marker appears on the very row the cursor is on and the
     * player Activity comes up over the list a moment later (measured: displayed at ~400 ms), so
     * hiding the icon at once showed it blinking out just as the screen was being left, and the
     * player's own status bar brought it straight back. Waiting means it is simply never taken down
     * while the list is still what the user is looking at; by the time it is, the list is covered.
     * On the way back {@link #apply} hides it in the same frame stock shows it, so there is nothing
     * to see there either.
     *
     * Everything else — scrolling the marked row into view, skipping tracks with the side buttons,
     * pausing, stopping — hides the icon immediately.
     */
    private static final long STEP_ASIDE_MS = 700;

    private static final Hide HIDE = new Hide();
    private static boolean hiding;

    /** The icon is down because we put it down — so stock re-showing it is ours to undo at once. */
    private static boolean stepped;

    static final class Bar implements Runnable {
        public void run() {
            posted = false;
            try {
                ListView lv = Follow.list();
                if (lv == null) return;
                Object c = lv.getContext();
                if (!(c instanceof Activity)) return;
                if (markerVisible(lv, Follow.adapter())) {
                    if (!justOpened()) {           // nothing is about to cover us: step aside now
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
                // the status bar is cosmetic
            }
        }
    }

    /** Re-asks the question: the wheel may have moved on during the wait. */
    static final class Hide implements Runnable {
        public void run() {
            hiding = false;
            try {
                ListView lv = Follow.list();
                if (lv == null) return;
                Object c = lv.getContext();
                if (!(c instanceof Activity)) return;
                if (!markerVisible(lv, Follow.adapter())) return;
                stepped = true;
                icon((Activity) c, View.GONE);
            } catch (Throwable t) {
                // ignore
            }
        }
    }

    /**
     * Injected right after each of the two stock {@code updatePlay} calls — the LiveData observer
     * and onResume. Stock has just decided the icon's visibility by its own rule, which is exactly
     * the moment to take it back down if this screen's list is already saying the same thing.
     *
     * Doing it here is what covers coming BACK to a list screen: its rows are not rebound then, so
     * no bind-driven recheck would happen, but onResume always runs.
     */
    public static void apply(Object activity) {
        step(activity, true);
    }

    /**
     * The other injection: the play-state observer, i.e. stock has just repainted the icon because
     * the state changed <b>while this screen was up</b>.
     *
     * The difference from {@link #apply} is the whole of what was blinking. Starting a track from a
     * list publishes "playing" right there, which makes the marker appear on the row under the
     * cursor — and taking the icon down at that instant showed it vanish ~200 ms before the player
     * covered the screen. So a marker that has only just appeared is waited out exactly like one
     * scrolled into view; only when the icon is down BECAUSE WE PUT IT DOWN is stock's re-show
     * undone at once, which is what keeps a pause or a stop from flashing it back.
     */
    public static void changed(Object activity) {
        step(activity, stepped || !justOpened());
    }

    private static void step(Object activity, boolean now) {
        try {
            if (!(activity instanceof Activity)) return;
            ListView lv = Follow.list();
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
            // ignore
        }
    }

    /** What stock would show: the icon is hidden only when nothing is loaded at all. */
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
     * True while the marked row is among the rows actually on screen.
     *
     * The playing track is asked for once — {@link Rows#playMark} settles the source list and the
     * state in one call — and after that it is a path
     * compare over the visible window. The adapter must still be the one the ListView is showing:
     * {@code Follow} notes it from a song list's bind, and AlbumsActivity swaps its adapter for the
     * album list without binding another song row.
     */
    private static boolean markerVisible(ListView lv, MyBaseAdapter a) {
        if (a == null || lv.getAdapter() != a) return false;
        if (lv.getVisibility() != View.VISIBLE || lv.getWindowToken() == null) return false;
        PlayerService s = Y1Application.Companion.getPlayerService();
        // getPlayingSong, not getPlayingMusic: the audiobook lists draw the marker too since #384,
        // and asked for the music track this compared a path no book list can ever hold — so the
        // icon never stepped aside there, and while a book played it could have stepped aside for
        // a music list showing a track that was not playing at all.
        Song song = (s == null) ? null : s.getPlayingSong();
        String path = (song == null) ? null : song.getPath();
        if (path == null || Rows.playMark(path, a) == 0) return false;
        int first = lv.getFirstVisiblePosition();
        int last = lv.getLastVisiblePosition();
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
