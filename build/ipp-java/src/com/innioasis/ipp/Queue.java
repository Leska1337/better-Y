package com.innioasis.ipp;

import android.app.Activity;
import android.content.Intent;
import android.content.Context;
import android.content.SharedPreferences;
import android.widget.ListView;
import android.widget.Toast;

import com.blankj.utilcode.util.ActivityUtils;
import com.innioasis.y1.base.BaseActivity;
import com.innioasis.y1.base.BasePlayerActivity;

import com.innioasis.music.adapter.MyBaseAdapter;
import com.innioasis.music.adapter.rv.RVBaseAdapter;
import com.innioasis.music.data.Album;
import com.innioasis.music.data.Genre;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Playlist;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.database.Y1Repository;
import com.innioasis.y1.service.PlayerService;
import com.innioasis.y1.utils.SharedPreferencesUtils;

import java.io.File;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import java.util.UUID;

/**
 * #227 — "Up Next": the authority on what plays next, and the model behind the queue screen.
 *
 * The screen shows a live projection, not just what the user queued:
 *   row 0            = the track playing right now
 *   rows 1..manual   = tracks added via "Add to queue", in the order they were added
 *   the rest         = the next {@link #LOOKAHEAD} tracks of the playlist itself
 *                      (sequential order, or — with shuffle on — the precomputed shuffle plan,
 *                       so what is shown is exactly what will play)
 *
 * Why a plan: stock shuffle picks a fresh random index inside {@code PlayerService.shuffleSong()}
 * at the moment of switching, so upcoming tracks could not be shown at all. Instead
 * {@link #takeNext} is injected ahead of that call and serves indices from {@link #plan}, a
 * shuffled permutation queue — displayed order == played order.
 *
 * A queued track is spliced into the playlist right behind the one playing now, the moment it is
 * queued ({@link #insertGuest}) — the list IS the play order, and the Now-Playing counter (N/M,
 * read from {@code getMusicList()}) is the track's place in it. It leaves again when the list
 * starts a new pass ({@link #dropGuests}): a queued track is a one-time visit, not a new member
 * of the album.
 *
 * {@link #hist} keeps the last {@link #HIST_MAX} play positions so the Back/prev button
 * returns along the path actually taken (including shuffle hops), instead of index-1.
 *
 * Everything here works on the list that is PLAYING — the music list or, since #384, the audiobook
 * one. The two are never live at the same time: {@link #syncKind} notices the switch and starts a
 * new session, because every index kept here means something only inside one list.
 *
 * In-memory only; raw (non-generic) collections — the bundled d8 crashes on generic Signature
 * attributes. Called from stock smali (PlayerService.nextSong/prevSong, the long-press menus)
 * and from IppQueueActivity, so the entry points must stay public.
 */
public final class Queue {

    /**
     * How far ahead the screen looks into the playlist, and — separately — how many hand-queued
     * tracks it shows. The two are counted apart because they answer different questions, but both
     * are bounded: a row on that screen is a view built before the first frame, so an unbounded
     * queue is an unbounded opening cost, and a few hundred queued tracks is what made it crawl.
     * The manual queue used to be shown in full, on the grounds that a row has to be reachable to
     * be removed; the cut is at the far end, so as the front of it is played or removed the rest
     * comes into view, and the caption says how many there are in all.
     */
    public static final int LOOKAHEAD = 20;
    public static final int MANUAL_MAX = 20;

    private static final ArrayList manual = new ArrayList();   // ArrayList<Song> — user-queued
    /**
     * The musicList position of each pending entry of {@link #manual}, aligned with it: {@code >= 0}
     * for a GUEST — a track the playlist did not hold, spliced into it when it was queued — and -1
     * for an entry the playlist holds already, which is reached by moving the play index onto it.
     */
    private static final ArrayList guestIdx = new ArrayList();  // ArrayList<Integer>
    /**
     * Where the guests that have already PLAYED are standing. They stay in the list for the rest of
     * the pass — Back has to be able to walk into one — and {@link #dropGuests} takes them out when
     * a new pass begins, since a queued track is a one-time visit.
     *
     * Positions, not the songs themselves: the same song can be queued into a list that already
     * holds it, and then the list holds two entries that are equal in every way and even the same
     * object. Only the position tells them apart.
     */
    private static final ArrayList spent = new ArrayList();     // ArrayList<Integer>
    private static final ArrayList plan = new ArrayList();     // ArrayList<Integer> — shuffle cycle
    private static final ArrayList hist = new ArrayList();     // ArrayList<Integer> — visited indices
    private static final ArrayList skip = new ArrayList();     // ArrayList<Integer> — dropped rows
    /** Passes that carried queued tracks and lie BEHIND us — see {@link #notePass}. */
    private static final ArrayList past = new ArrayList();     // ArrayList<Pass>
    /** ...and the ones that lie AHEAD, stepped backwards out of. Same thing, other direction. */
    private static final ArrayList future = new ArrayList();   // ArrayList<Pass>
    private static final Random rnd = new Random();

    /** How many finished passes are kept. A pass is a shallow copy of the list; four is plenty. */
    private static final int MAX_PAST = 4;

    /**
     * Which player the state below belongs to: 0 = music, 1 = audiobook (#384). Everything here
     * holds indices into ONE list, so the two cannot share it — {@link #syncKind} notices the
     * change and starts over.
     */
    private static int kind = 0;

    /** Playlist position to continue from once the manual entries are exhausted (-1 = none). */
    private static int resume = -1;
    /** Playlist size the shuffle plan was built for; a different size invalidates it. */
    private static int planFor = -1;

    /**
     * Back restarts the track instead of changing it once this much of it has played — the rule
     * every hardware player has. Only inside the first seconds is Back "the previous track".
     */
    private static final long PREV_RESTART_MS = 4000;

    /** Last observed shuffle setting: -1 unknown, 0 off, 1 on. See {@link #syncShuffle}. */
    private static int lastShuffle = -1;

    /**
     * How many tracks the current shuffled pass holds. With {@link #plan} — what is still ahead
     * of us in it — this IS the position in the pass: {@code passLen - plan.size()}. That is the
     * number Now Playing shows under shuffle instead of the track's place in the list (#5),
     * where the list order says nothing about what has been heard.
     *
     * Derived rather than counted on purpose: a counter of its own drifts apart from the queue
     * at every boundary (a new pass, a step back over one, a row removed from the queue screen),
     * and each of those had to be patched separately. Read it off the queue and it cannot lie.
     */
    private static int passLen = 1;

    /** musicList index behind each row of the last {@link #upNext()} (-1 = manual entry). */
    private static int[] rowIdx = new int[0];
    private static int rowManual = 0;
    private static int manualTotal = 0;

    /** Hand-queued tracks shown by the last {@link #upNext()}, capped at {@link #MANUAL_MAX}. */
    public static int manualShown() {
        return rowManual;
    }

    /** How many there really are, so the caption can say what the screen is not showing. */
    public static int manualCount() {
        return manualTotal;
    }

    private static PlayerService svc() {
        return Y1Application.Companion.getPlayerService();
    }

    // ------------------------------------------------------- music or audiobook (#384, this file)
    //
    // The audiobook player is the music player's screen with another list behind it, and stock's own
    // next/prev for it is a plain (index ± 1) wrap with no notion of a shuffled pass, a queue or the
    // end of the list. It now goes through exactly the same hooks, so everything below has to ask
    // WHICH list it is working on. PlayerService.getPlayIndex/setPlayIndex already dispatch on the
    // same flag; the lists are read explicitly rather than through getPlayList(), which answers with
    // an empty list whenever `playing` is None and would look like "the list is gone".

    /** True while the service is on an audiobook. The flag the player itself dispatches on. */
    private static boolean book() {
        try {
            PlayerService ps = svc();
            return ps != null && ps.getPlaying() == PlayerService.Playing.Audiobook;
        } catch (Throwable t) {
            return false;
        }
    }

    private static List list(PlayerService ps) {
        if (ps == null) return null;
        return book() ? ps.getAudiobookList() : ps.getMusicList();
    }

    /** The same, for a kind that is no longer the current one (cleaning up after a switch). */
    private static List listOf(PlayerService ps, int k) {
        if (ps == null) return null;
        return k == 1 ? ps.getAudiobookList() : ps.getMusicList();
    }

    private static int index(PlayerService ps) {
        if (ps == null) return -1;
        return book() ? ps.getAudiobookIndex() : ps.getMusicIndex();
    }

    private static void setIndex(PlayerService ps, int i) {
        if (ps == null) return;
        if (book()) ps.setAudiobookIndex(i);
        else ps.setMusicIndex(i);
    }

    private static void setList(PlayerService ps, List l) {
        if (ps == null || l == null) return;
        if (book()) ps.setAudiobookList(l);
        else ps.setMusicList(l);
    }

    private static boolean shuffle() {
        SharedPreferencesUtils s = SharedPreferencesUtils.INSTANCE;
        return book() ? s.getAudiobookIsShuffle() : s.getMusicIsShuffle();
    }

    /**
     * The playing kind has changed under us — a book was opened while a music queue was live, or
     * the other way round. Every index here means something only inside one list, so the session
     * starts over; the guests standing in the list we are leaving are taken out of it first, or it
     * would go on holding a track nothing remembers having put there.
     */
    private static void syncKind() {
        int k = book() ? 1 : 0;
        if (k == kind) return;
        dropGuestsFrom(kind);
        kind = k;
        clearSession();
    }

    private static void clearSession() {
        plan.clear();
        hist.clear();
        skip.clear();
        manual.clear();
        guestIdx.clear();
        spent.clear();
        past.clear();
        future.clear();
        resume = -1;
        planFor = -1;
        passLen = 1;
        lastShuffle = -1;
    }

    /** Take every track the queue spliced into the list of kind {@code k} back out of it. */
    private static void dropGuestsFrom(int k) {
        try {
            PlayerService ps = svc();
            List ml = listOf(ps, k);
            if (ml == null) return;
            ArrayList at = new ArrayList();
            for (int i = 0; i < guestIdx.size(); i++) at.add(guestIdx.get(i));
            for (int i = 0; i < spent.size(); i++) at.add(spent.get(i));
            while (!at.isEmpty()) {                      // highest first: the rest stay put
                int p = -1, row = -1;
                for (int i = 0; i < at.size(); i++) {
                    int v = ((Integer) at.get(i)).intValue();
                    if (v > p) { p = v; row = i; }
                }
                at.remove(row);
                if (p < 0 || p >= ml.size()) continue;
                ml.remove(p);
                int cur = (k == 1 ? ps.getAudiobookIndex() : ps.getMusicIndex());
                if (cur > p) {
                    if (k == 1) ps.setAudiobookIndex(cur - 1);
                    else ps.setMusicIndex(cur - 1);
                }
            }
        } catch (Throwable t) {
            // a stray track in a list we have just left is not worth an exception
        }
    }

    // ---------------------------------------------------------------- manual queue

    public static void add(Song s) {
        if (s == null) return;
        syncKind();
        manual.add(s);
        guestIdx.add(Integer.valueOf(insertGuest(s)));
    }

    /**
     * Splice a queued track into the playlist right behind the track playing now (and behind
     * whatever is already waiting there). Returns the position it went to, or -1 if there was no
     * playlist to put it in.
     *
     * <p>Also when the list ALREADY holds that song: it gets an entry of its own, and the original
     * keeps its turn later on. That is what queueing a track off the album you are listening to
     * means — it plays now as well as in its place — and it is what the old "jump to it instead"
     * did anyway, only without ever admitting it: the jump remembered where it had come from and
     * came back, so the track played twice while the counter said the list was still three long.
     *
     * <p>Why on adding, and not when the track is finally reached (v0.24.9): the list IS the play
     * order, and the number Now Playing shows is the track's place in it. Appended at the end when
     * it started playing, a track queued into a list of three read <b>4/4</b> the moment it played,
     * and the total only grew then — until it did, the user was looking at 1/3 with a fourth track
     * already queued. Spliced in behind the current one it reads 1/3 → <b>1/4</b> on adding and
     * <b>2/4</b> when it plays, and the track that used to follow keeps its place after it.
     *
     * <p>Everything else here holds musicList INDICES — the shuffle plan, the back history, the
     * removed rows, {@link #resume} — so they all move up with the splice ({@link #shiftUp}). The
     * plan is not rebuilt: a guest is a queue entry, not part of the shuffled pass, so it is simply
     * absent from it (and {@link #newCycle} leaves pending guests out for the same reason).
     */
    private static int insertGuest(Song s) {
        try {
            PlayerService ps = svc();
            if (ps == null) return -1;
            List ml = list(ps);
            if (ml == null || ml.isEmpty()) return -1;
            int cur = index(ps);
            if (cur < 0 || cur >= ml.size()) return -1;
            int at = cur + 1;
            for (int i = 0; i < guestIdx.size(); i++) {  // queue order: behind the ones waiting
                int g = ((Integer) guestIdx.get(i)).intValue();
                if (g >= at) at = g + 1;
            }
            if (at > ml.size()) at = ml.size();
            ml.add(at, s);
            shiftUp(at);
            return at;
        } catch (Throwable t) {
            return -1;                                    // it stays a plain queue entry
        }
    }

    /**
     * A guest that leaves the queue without ever playing leaves the playlist with it — otherwise
     * the list would go on holding a track the user has just removed, and play it in its turn.
     */
    private static void dropGuest(int at) {
        try {
            PlayerService ps = svc();
            if (ps == null) return;
            List ml = list(ps);
            if (ml == null || at < 0 || at >= ml.size()) return;
            ml.remove(at);
            int cur = index(ps);
            if (cur > at) setIndex(ps, cur - 1);
            shiftDown(at);
        } catch (Throwable t) {
            // a stale row must never take the screen down
        }
    }

    /**
     * The list is starting a new pass — "repeat list" has come round to the beginning, or a spent
     * shuffle cycle is being replaced — so the tracks the queue spliced into it leave with the pass
     * that carried them. Without this the playlist only ever grows: a queued track played again on
     * every repeat, and the counter never came back to the list's own length (1/3 stayed 4/4).
     *
     * Entries still waiting in the queue stay where they are: their turn has not come yet.
     */
    private static void dropGuests() {
        if (spent.isEmpty()) return;
        notePass(past);                              // this pass held queued tracks: remember it
        stripGuests();
    }

    /**
     * The same without remembering anything. Going BACKWARDS over a pass boundary strips the guests
     * too — the pass being wrapped into is one nobody queued anything into, so it has to be the
     * list's own — but recording it would put back the very entry the step just took out of
     * {@link #past}, and Back would bounce between two passes for ever.
     */
    private static void stripGuests() {
        try {
            if (spent.isEmpty()) return;
            PlayerService ps = svc();
            if (ps == null) { spent.clear(); return; }
            List ml = list(ps);
            if (ml == null) { spent.clear(); return; }
            while (!spent.isEmpty()) {
                int at = -1, k = -1;                     // highest position first: the rest stay put
                for (int i = 0; i < spent.size(); i++) {
                    int v = ((Integer) spent.get(i)).intValue();
                    if (v > at) { at = v; k = i; }
                }
                spent.remove(k);
                if (at < 0 || at >= ml.size()) continue;
                ml.remove(at);
                int cur = index(ps);
                // Standing ON the track being removed is fine: the index is overwritten by the
                // very call this is being done for, and nothing reads it in between.
                if (cur > at) setIndex(ps, cur - 1);
                shiftDown(at);
            }
        } catch (Throwable t) {
            // the list keeping a queued track is a nuisance; a crash mid-track-change is not
        }
    }

    // ------------------------------------------------------- the pass a queued track belonged to
    //
    // A queued track is a guest of ONE pass: when the list comes round again the guests leave with
    // the pass that carried them (see dropGuests), and the list is its own three tracks once more.
    // Walking BACK over that boundary has to undo exactly that, or the tracks the user queued would
    // be gone from a pass they demonstrably played through — the list went 1/4 all the way to 4/4,
    // then Back off the new pass's first track answered 3/3.
    //
    // So the pass being retired is kept whole: its list (guests included), where it ended, and the
    // shuffle state that went with it. Only passes that actually HELD queued tracks are kept —
    // stepping back past one of those into an ordinary pass is meant to give the list's own length
    // again, which is what happens when there is nothing left to restore.

    /** One finished pass, kept so Back can walk into it. Named — d8 crashes on anonymous ones. */
    static final class Pass {
        ArrayList list;      // the playlist exactly as it was played, queued tracks included
        ArrayList spent;     // where inside it the queued tracks stood
        ArrayList hist;      // the path actually taken through it (shuffle)
        ArrayList plan;      // what was left of its shuffle cycle (empty at the end of a pass)
        ArrayList skip;      // rows the user had removed while it was running
        int index;           // its last track — where Back lands
        int passLen;
        int planFor;
    }

    /**
     * Remember the pass that is ending. Called from {@link #dropGuests}, i.e. exactly when there is
     * something to remember and while the list still holds it.
     */
    private static void notePass(ArrayList stack) {
        try {
            if (spent.isEmpty()) return;         // nothing was queued into it: nothing to remember
            PlayerService ps = svc();
            if (ps == null) return;
            List ml = list(ps);
            if (ml == null || ml.isEmpty()) return;
            Pass p = new Pass();
            p.list = new ArrayList(ml);
            p.index = index(ps);
            p.spent = new ArrayList(spent);
            p.hist = new ArrayList(hist);
            p.plan = new ArrayList(plan);
            p.skip = new ArrayList(skip);
            p.passLen = passLen;
            p.planFor = planFor;
            // The last track of the pass has already been pushed onto the history by the very
            // takeNext that is retiring it, and Back lands on that track — leaving it in would
            // make the next Back play it a second time.
            int n = p.hist.size();
            if (n > 0 && ((Integer) p.hist.get(n - 1)).intValue() == p.index) p.hist.remove(n - 1);
            stack.add(p);
            while (stack.size() > MAX_PAST) stack.remove(0);
        } catch (Throwable t) {
            // failing to remember a pass costs the user a wrong number, not a crash
        }
    }

    /**
     * A boundary has been reached and a remembered pass stands on the other side of it: put that
     * pass back whole — its list, its guests, its history and its counter — and land inside it.
     *
     * <p>{@code atStart} says which way we are crossing. Walking BACK, the pass behind us is
     * entered at the track it ended on ({@code past}); walking FORWARD, the pass ahead of us is one
     * we previously walked backwards out of, so it is entered at its first track ({@code future})
     * and its old history is not ours — the run through it starts again.
     *
     * <p>Returns false when there is nothing remembered on that side, and then the ordinary rules
     * (wrap with "repeat list" on, restart otherwise) apply unchanged.
     */
    private static boolean restorePass(PlayerService ps, ArrayList stack, boolean atStart) {
        try {
            if (stack.isEmpty() || ps == null) return false;
            Pass p = (Pass) stack.remove(stack.size() - 1);
            if (p == null || p.list == null || p.list.isEmpty()) return false;
            setList(ps, new ArrayList(p.list));
            refill(spent, p.spent);
            refill(hist, p.hist);
            refill(plan, p.plan);
            refill(skip, p.skip);
            passLen = p.passLen;
            planFor = p.planFor;
            resume = -1;
            int at;
            if (atStart) {
                hist.clear();                        // the run through it begins again
                at = nextSeq(p.list.size(), -1);
            } else {
                at = p.index;
            }
            if (at < 0 || at >= p.list.size()) at = 0;
            ps.setPlayIndex(at);
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    private static void refill(ArrayList dst, ArrayList src) {
        dst.clear();
        if (src != null) dst.addAll(src);
    }

    /** The playlist's size and the play index, read together after the list has been changed. */
    private static int[] sizeCur() {
        int[] out = new int[]{0, -1};
        try {
            PlayerService ps = svc();
            if (ps == null) return out;
            List ml = list(ps);
            if (ml == null) return out;
            out[0] = ml.size();
            out[1] = index(ps);
        } catch (Throwable t) {
            // leave it empty; the caller stops
        }
        return out;
    }

    /** True for a musicList position holding a guest that has not played yet. */
    private static boolean pendingGuest(int idx) {
        return has(guestIdx, idx);
    }

    /** How many still-waiting queue entries stand before {@code idx}. See {@link #trackNo}. */
    private static int pendingBefore(int idx) {
        int n = 0;
        for (int i = 0; i < guestIdx.size(); i++) {
            int g = ((Integer) guestIdx.get(i)).intValue();
            if (g >= 0 && g < idx) n++;
        }
        return n;
    }

    /** The list's own number for a position: its place among everything but the pending entries. */
    private static int seqNo(int idx) {
        int n = idx + 1 - pendingBefore(idx);
        return n < 1 ? 1 : n;
    }

    /**
     * A queued track's turn has come: move it out of the slot it was parked in and stand it
     * immediately behind the track being left. Returns where it ended up.
     *
     * <p>It is parked behind whatever was playing when it was QUEUED, and that is only where it
     * belongs if playback reaches it from there. Back and Forward can leave from somewhere else
     * entirely — go back round to the album's last track and step forward, and the queued track is
     * the fourth thing heard, not the second. Leaving it parked showed it as 2/4 and then carried
     * on into the middle of the album; moved, it reads 4/4, Back off it walks the album from its
     * last track, and one more step forward is the end of the list, which is what it now is.
     *
     * <p>Everything here holds positions, so the removal and the insertion are both announced
     * ({@link #shiftDown} / {@link #shiftUp}). The play index is not: the caller overwrites it with
     * the value returned here.
     */
    private static int moveGuest(List ml, int from, int cur) {
        try {
            if (ml == null || from < 0 || from >= ml.size()) return from;
            int to = (cur > from ? cur - 1 : cur) + 1;
            if (to == from) return from;                 // already standing where it should
            Object s = ml.get(from);
            ml.remove(from);
            shiftDown(from);
            if (to < 0) to = 0;
            if (to > ml.size()) to = ml.size();
            ml.add(to, s);
            shiftUp(to);
            return to;
        } catch (Throwable t) {
            return from;
        }
    }

    /** True for a position the QUEUE put in the list, whether waiting or already played. */
    private static boolean queued(int idx) {
        return has(guestIdx, idx) || has(spent, idx);
    }

    private static boolean has(ArrayList l, int idx) {
        for (int i = 0; i < l.size(); i++) {
            if (((Integer) l.get(i)).intValue() == idx) return true;
        }
        return false;
    }

    /** The recorded position of a guest, if the list still holds that very song there. */
    private static int guestAt(List ml, int at, Song s) {
        if (at < 0 || ml == null || at >= ml.size()) return -1;
        return ml.get(at) == s ? at : -1;
    }

    /** Every stored musicList index moves up by one when a track is spliced in at {@code at}. */
    private static void shiftUp(int at) {
        bump(plan, at, 1);
        bump(hist, at, 1);
        bump(skip, at, 1);
        bump(guestIdx, at, 1);
        bump(spent, at, 1);
        if (resume >= at) resume++;
        if (planFor >= 0) planFor++;
    }

    /** ...and back down when the track at {@code at} is taken out again. */
    private static void shiftDown(int at) {
        bump(plan, at + 1, -1);
        bump(hist, at + 1, -1);
        bump(skip, at + 1, -1);
        bump(guestIdx, at + 1, -1);
        bump(spent, at + 1, -1);
        if (resume > at) resume--;
        if (planFor > 0) planFor--;
    }

    private static void bump(ArrayList l, int from, int by) {
        for (int i = 0; i < l.size(); i++) {
            int v = ((Integer) l.get(i)).intValue();
            if (v >= from) l.set(i, Integer.valueOf(v + by));
        }
    }

    /**
     * Append a menu selection to the queue and confirm it on screen. The toast lives here (not
     * at the call site) so every "Add to queue" entry added to a menu later gets it for free.
     */
    public static void addAll(List songs) {
        if (songs == null) return;
        // The guard sits HERE and not in the addFrom* helpers: this is the one funnel every path
        // goes through, and SongListActivity's branch predates those helpers and gathers its own
        // rows — so a guard up there let the whole Songs screen past it.
        int from = fromKind;
        fromKind = -1;
        if (from < 0) from = kindOfSongs(songs);
        if (!allowedFrom(from)) return;
        int before = manual.size();
        for (int i = 0; i < songs.size(); i++) {
            add((Song) songs.get(i));
        }
        if (manual.size() == before) return;
        toast(R.string.ipp_queue_added);
    }

    /**
     * "Add to queue" from a long-press menu. Takes the adapter the menu was opened on and
     * queues whatever is picked there — the multi-selected rows, or the focused one when
     * nothing is selected. Item type decides what that means: a song is queued as-is, an
     * album / artist / playlist row queues all of its songs. One helper serves every list
     * screen, so adding the entry to another menu stays a two-line smali edit.
     */
    public static void addFromAdapter(MyBaseAdapter a) {
        if (a == null) return;
        fromKind = screenKind(a.getContext());
        ArrayList picked = new ArrayList();
        List sel = a.getSelectedIndexList();
        if (sel != null && !sel.isEmpty()) {
            for (int i = 0; i < sel.size(); i++) {
                Object o = a.getItem(((Integer) sel.get(i)).intValue());
                if (o != null) picked.add(o);
            }
            // Clear it afterwards, like the stock add-to-playlist path: otherwise the rows stay
            // highlighted and the next "Add to queue" would queue them again.
            sel.clear();
            a.notifyDataSetChanged();
        } else {
            Object o = a.getItem(a.getPosition());
            if (o != null) picked.add(o);
        }
        addPicked(picked);
    }

    /**
     * For screens that page through several levels in one ListView (genres → artists → albums
     * → songs, folders → files): the list's current adapter is the active level, which is how
     * stock itself tells them apart.
     */
    public static void addFromListView(ListView lv) {
        if (lv == null) return;
        Object a = lv.getAdapter();
        if (a instanceof MyBaseAdapter) addFromAdapter((MyBaseAdapter) a);
    }

    /** Same, for the RecyclerView-based adapter used by the playlists screen (music only). */
    public static void addFromRvAdapter(RVBaseAdapter a) {
        if (a == null) return;
        fromKind = 0;
        ArrayList picked = new ArrayList();
        List sel = a.getMultiSelectIndexes();
        if (sel != null && !sel.isEmpty()) {
            for (int i = 0; i < sel.size(); i++) {
                Object o = a.getItemByPosition(((Integer) sel.get(i)).intValue());
                if (o != null) picked.add(o);
            }
            sel.clear();
            a.notifyDataSetChanged();
        } else {
            Object o = a.getSelectItem();
            if (o != null) picked.add(o);
        }
        addPicked(picked);
    }

    /**
     * #397 — the Search results. Same gather as {@link #addFromRvAdapter}, but its rows are
     * `SearchActivity.Item` wrappers rather than the model objects themselves, so each is unwrapped
     * into the Song or the Album it stands for and {@link #addPicked} then treats it like any other
     * menu selection (an album row queues the whole album, folder-encoded name included).
     *
     * Search only ever lists music, so the section is stated outright.
     */
    public static void addFromSearch(RVBaseAdapter a) {
        if (a == null) return;
        fromKind = 0;
        ArrayList picked = new ArrayList();
        List sel = a.getMultiSelectIndexes();
        if (sel != null && !sel.isEmpty()) {
            for (int i = 0; i < sel.size(); i++) {
                unwrap(picked, a.getItemByPosition(((Integer) sel.get(i)).intValue()));
            }
            sel.clear();
            a.notifyDataSetChanged();
        } else {
            unwrap(picked, a.getSelectItem());
        }
        addPicked(picked);
    }

    private static void unwrap(ArrayList into, Object row) {
        if (row == null) return;
        if (row instanceof com.innioasis.music.SearchActivity.Item) {
            com.innioasis.music.SearchActivity.Item it = (com.innioasis.music.SearchActivity.Item) row;
            if (it.getSong() != null) into.add(it.getSong());
            else if (it.getAlbum() != null) into.add(it.getAlbum());
            return;
        }
        into.add(row);
    }

    // ------------------------------------------------------- the queue belongs to one player only
    //
    // A book and a song are two different lists with two different players behind them, so a queue
    // cannot hold both: splicing a song into the audiobook list would have the book player try to
    // play it in its turn. The section a row was picked in is what says which it is, and the answer
    // is compared against what is actually PLAYING — a queue is only anyone's while there is
    // something for it to be a queue of.

    /**
     * Section the add in progress came from, set by whichever entry point knows and consumed by
     * {@link #addAll}. -1 = nobody said, and then the songs themselves are asked.
     */
    private static int fromKind = -1;

    /** Called from SongListActivity's own gather loop, which does not go through an adapter here. */
    public static void addAllFromMusic(List songs) {
        fromKind = 0;
        addAll(songs);
    }

    /** Last resort when no entry point named the section: where the files live. */
    private static int kindOfSongs(List songs) {
        try {
            for (int i = 0; i < songs.size(); i++) {
                Object o = songs.get(i);
                if (!(o instanceof Song)) continue;
                String p = ((Song) o).getPath();
                if (p == null) continue;
                return (p.startsWith(com.innioasis.music.objects.Constant.AUDIOBOOK_PATH)
                        || p.startsWith(com.innioasis.music.objects.Constant.AUDIOBOOK_PATH_LOW))
                        ? 1 : 0;
            }
        } catch (Throwable t) {
            // fall through
        }
        return 0;
    }

    /**
     * A toast whose text is CENTRED. The platform's own layout leaves it aligned to the start, so
     * anything that wraps to a second line comes out ragged inside a box that is symmetrical.
     * {@code android.R.id.message} is the id AOSP gives that TextView; if it is ever not there the
     * toast still shows, just as it did.
     */
    private static void toast(int res) {
        try {
            Context c = Y1Application.Companion.getAppContext();
            if (c == null) return;
            Toast t = Toast.makeText(c, c.getString(res), Toast.LENGTH_SHORT);
            android.view.View v = t.getView();
            android.view.View m = (v == null) ? null : v.findViewById(android.R.id.message);
            if (m instanceof android.widget.TextView) {
                ((android.widget.TextView) m).setGravity(android.view.Gravity.CENTER);
            }
            t.show();
        } catch (Throwable e) {
            // a message that could not be shown must not stop what it was announcing
        }
    }

    /** 1 = the row was picked in the audiobook section, 0 = anywhere else. */
    private static int screenKind(Context c) {
        try {
            if (!(c instanceof Activity)) return 0;
            String n = c.getClass().getName();
            if (n.endsWith(".AllAudiobooksActivity")) return 1;
            // The file browser serves both sections; which one it is showing is the path it was
            // started on (it starts a fresh instance per folder, so the extra is always current).
            if (n.endsWith(".FilesActivity")) {
                String p = ((Activity) c).getIntent().getStringExtra("now_path");
                if (p != null && (p.startsWith(com.innioasis.music.objects.Constant.AUDIOBOOK_PATH)
                        || p.startsWith(com.innioasis.music.objects.Constant.AUDIOBOOK_PATH_LOW))) {
                    return 1;
                }
            }
        } catch (Throwable t) {
            // an unrecognised screen is music, which is what everything but two of them is
        }
        return 0;
    }

    /**
     * True when a row picked in section {@code from} may join the queue. It may not while the OTHER
     * kind is playing — the queue is that player's — and the user is told which one it is rather
     * than left with a menu entry that quietly does nothing.
     */
    private static boolean allowedFrom(int from) {
        try {
            PlayerService ps = svc();
            if (ps == null) return true;
            PlayerService.Playing p = ps.getPlaying();
            int playing;
            if (p == PlayerService.Playing.Audiobook) playing = 1;
            else if (p == PlayerService.Playing.Music) playing = 0;
            else return true;                    // nothing is playing: the queue is not yet anyone's
            List ml = listOf(ps, playing);
            if (ml == null || ml.isEmpty()) return true;
            if (from == playing) return true;
            toast(playing == 1 ? R.string.ipp_queue_busy_book : R.string.ipp_queue_busy_music);
            return false;
        } catch (Throwable t) {
            return true;
        }
    }

    /** Resolve picked rows to songs and queue them (one toast for the whole batch). */
    private static void addPicked(List items) {
        try {
            Y1Repository repo = Y1Application.Companion.getY1Repository();
            ArrayList songs = new ArrayList();
            for (int i = 0; i < items.size(); i++) {
                Object o = items.get(i);
                if (o instanceof Song) {
                    songs.add(o);
                } else if (o instanceof Album) {
                    String an = ((Album) o).getName();
                    if (Albums.isAllSongs(an)) {
                        // #281.1: the "Show all songs" row stands for the whole artist
                        collect(songs, artistSongs(repo, Albums.allSongsArtist(an)));
                    } else {
                        // keeps #291.3's encoded album name working (songsSync filters by folder)
                        collect(songs, repo.getSongsByAlbumSync((Album) o, 0, null));
                    }
                } else if (o instanceof Playlist) {
                    collect(songs, repo.getSongsByPlaylistSync((Playlist) o));
                } else if (o instanceof Genre) {
                    collect(songs, repo.getSongsByGenreSync((Genre) o));
                } else if (o instanceof File) {
                    collect(songs, fileSongs(repo, (File) o));
                } else if (o instanceof String) {
                    collect(songs, artistSongs(repo, (String) o));
                }
            }
            addAll(songs);
        } catch (Exception e) {
            // a broken row must never take the menu down
        }
    }

    private static void collect(ArrayList into, List songs) {
        if (songs == null) return;
        for (int i = 0; i < songs.size(); i++) {
            if (songs.get(i) != null) into.add(songs.get(i));
        }
    }

    /**
     * Artist rows go through {@link Artists#songs} first so a split artist (#281.2) matches its
     * collaborations; null means an ordinary artist, which the indexed query handles. The
     * sync query is used rather than {@code getSongsByArtist}, whose side effect would rewrite
     * the user's artist-song sort preference.
     */
    /** Folders screen: a directory queues everything inside it, a file queues that one song. */
    private static List fileSongs(Y1Repository repo, File f) {
        if (f == null) return null;
        if (f.isDirectory()) return repo.getSongsByParentPath(f.getPath());
        Song s = repo.getSongByPathSync(f.getPath());
        if (s == null) return null;
        ArrayList one = new ArrayList();
        one.add(s);
        return one;
    }

    private static List artistSongs(Y1Repository repo, String artist) {
        return Artists.forMenu(artist, null);
    }

    // ---------------------------------------------------------------- shuffle plan

    private static boolean repeatAll() {
        SharedPreferencesUtils s = SharedPreferencesUtils.INSTANCE;
        return (book() ? s.getAudiobookRepeatMode() : s.getMusicRepeatMode()) == 2;
    }

    /**
     * The plan is **one shuffle cycle**: every track of the playlist except the current one,
     * in random order, each exactly once. That is what makes the shown list duplicate-free and
     * finite — when the cycle empties, the playlist has been played through.
     */
    private static void newCycle(int size, int cur) {
        plan.clear();
        planFor = size;
        for (int i = 0; i < size; i++) {
            // A guest still waiting in the queue is not part of the shuffled pass: it plays when
            // the queue reaches it, and the pass must not draw it before that (nor twice).
            if (i != cur && !skipped(i) && !pendingGuest(i)) plan.add(Integer.valueOf(i));
        }
        Collections.shuffle(plan, rnd);
        passLen = plan.size() + 1;          // this track plus everything planned after it
    }

    /** Tracks the user removed from the queue by hand; they are left out until a new session. */
    private static boolean skipped(int idx) {
        return skip.contains(Integer.valueOf(idx));
    }

    /** Next sequential index after {@code base} that is still wanted; -1 when the list ends. */
    private static int nextSeq(int size, int base) {
        for (int p = base + 1; p < size; p++) {
            if (!skipped(p) && !pendingGuest(p)) return p;
        }
        return -1;
    }

    /** Previous wanted index before {@code base}; -1 at the start. {@code prevSeq(size)} = last. */
    private static int prevSeq(int base) {
        for (int p = base - 1; p >= 0; p--) {
            if (!skipped(p) && !pendingGuest(p)) return p;
        }
        return -1;
    }

    /**
     * Notice that the shuffle setting has been flipped — from the Now-Playing button, from
     * Settings, from anywhere. Reading the flag rather than hooking every writer keeps this
     * correct for setters this class does not know about.
     *
     * Turning it ON starts a new shuffled pass: a fresh plan built around the track playing now,
     * which therefore becomes the pass's first — so the counter restarts at 1 (#5). Turning it
     * OFF throws the plan away; the list's own order is the order again, and the counter goes
     * back to the track's place in it.
     */
    private static void syncShuffle(int size, int cur) {
        int sh = shuffle() ? 1 : 0;
        if (lastShuffle == sh) return;
        boolean first = (lastShuffle < 0);
        lastShuffle = sh;
        if (first) return;                       // first observation records, it does not reset
        hist.clear();
        resume = -1;
        if (sh == 1) {
            newCycle(size, cur);
        } else {
            plan.clear();
            planFor = -1;
            passLen = 1;
        }
    }

    /** Called from the Now-Playing shuffle button so the change lands before the next repaint. */
    public static void onShuffleChanged() {
        try {
            PlayerService ps = svc();
            if (ps == null) return;
            syncKind();
            List ml = list(ps);
            syncShuffle(ml == null ? 0 : ml.size(), index(ps));
        } catch (Exception e) {
            // the setting is already written; the next playback call will pick the change up
        }
    }

    /**
     * The number Now Playing shows before the slash (injected into {@code refreshUI}).
     * Shuffle off: the track's own place in the list. Shuffle on: its place in the pass — see
     * {@link #passLen}.
     */
    public static int trackNo(PlayerService ps) {
        try {
            if (ps == null) return 1;
            syncKind();
            List ml = list(ps);
            int size = (ml == null) ? 0 : ml.size();
            int cur = index(ps);
            syncShuffle(size, cur);
            if (!shuffle()) {
                // A queue entry that has not played yet holds no number of its own: it is simply
                // "after the one playing now", so the tracks BEYOND it keep their own places. That
                // is what makes Back off the first track of a three-track album land on 3/4 and not
                // on 4/4 — the queued track is still ahead, not behind. Once it has played it is an
                // ordinary member of the list, standing where it was actually heard (moveGuest),
                // so its position is its number like everything else's.
                return seqNo(cur);
            }
            int n = passLen - plan.size();
            if (n < 1) n = 1;
            if (size > 0 && n > size) n = size;
            return n;
        } catch (Exception e) {
            return 1;
        }
    }

    /**
     * Back with the track already under way, or nothing behind it: play it again from the top.
     *
     * A seek only means something while the player actually holds the track. Fast skipping
     * leaves it {@code reset()} in the middle of {@code prepareAsync} (stock's own doing — the
     * next press resets it before the previous prepare has called back, and MediaPlayer answers
     * -38 from then on), and stock recovers only on the NEXT real track change. Seeking and
     * start()ing it in that state does nothing at all except tell the UI it is playing: the
     * "track stops halfway and only skipping brings it back" hang, confirmed in logcat as
     * {@code seekTo in wrong state: mPlayer=0x0} / {@code start called in state 0} straight out
     * of here. So when the player is not holding the track, restart it instead — that rewinds
     * AND puts the player back together (reset + setDataSource + prepareAsync + play).
     */
    private static int toStart(PlayerService ps) {
        boolean live;
        try {
            live = ps.getPlayerIsPrepared() && ps.getDuration() > 0;
        } catch (Throwable t) {
            live = false;
        }
        if (live) {
            try {
                ps.setCurrentPosition(0L);
                if (!ps.isPlaying()) ps.play(true);
                return 2;
            } catch (Throwable t) {
                // fall through and restart it properly
            }
        }
        try {
            ps.restartPlay(true);
        } catch (Throwable t) {
            // nothing left to try
        }
        return 2;
    }

    /**
     * True once the track is far enough in for Back to mean "start it again" rather than "previous
     * track". The player is only asked when it can answer: mid-re-prepare
     * {@code getCurrentPosition()} keeps handing back the position of a player that has already
     * been reset, and that stale number came out true in the middle of the list — turning a fast
     * run of Back presses into a restart the user never asked for. A prepared player with a real
     * duration is the guard.
     */
    private static boolean pastRestartPoint(PlayerService ps) {
        try {
            if (!ps.getPlayerIsPrepared()) return false;
            long dur = ps.getDuration();
            if (dur <= 0) return false;
            long pos = ps.getCurrentPosition();
            return pos >= PREV_RESTART_MS && pos <= dur;
        } catch (Throwable t) {
            return false;
        }
    }

    /**
     * The list has ended and "repeat list" is off, so there is nowhere to go: stop — the track
     * stops and is rewound to its beginning, ready to be played again from the top.
     */
    private static int stopAtEnd(PlayerService ps) {
        try {
            ps.pause(book() ? 10 : 9, true);     // stock's own end-of-list pause message, per kind
            ps.setCurrentPosition(0L);
        } catch (Throwable t) {
            // nothing to recover: playback is over either way
        }
        return 2;
    }

    /** Build the cycle if the playlist changed or it was never built; never refills a spent one. */
    private static void ensureCycle(int size, int cur) {
        if (size <= 0) { plan.clear(); return; }
        if (planFor != size) newCycle(size, cur);
    }

    /** Next index of the current cycle, or -1 when the cycle is spent. */
    private static int popCycle(int size, int cur) {
        ensureCycle(size, cur);
        while (!plan.isEmpty()) {
            int idx = ((Integer) plan.remove(0)).intValue();
            if (idx != cur && idx >= 0 && idx < size) return idx;
        }
        return -1;
    }

    /**
     * Injected into the track-completion handler in place of stock's "index == size-1" test
     * (which only makes sense for sequential play). True → the player pauses and the queue
     * screen shows just the finished track. Pending manual entries always win.
     */
    public static boolean endOfList(PlayerService ps) {
        try {
            if (ps == null) return false;
            syncKind();
            if (!manual.isEmpty()) return false;
            List ml = list(ps);
            if (ml == null || ml.isEmpty()) return false;
            int size = ml.size();
            syncShuffle(size, index(ps));
            if (repeatAll()) return false;
            if (shuffle()) {
                ensureCycle(size, index(ps));
                return plan.isEmpty();
            }
            int cur = (resume >= 0 ? resume : index(ps));
            return nextSeq(size, cur) < 0;
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * Unbounded on purpose: Back can walk all the way home to the track opened from the menu
     * (a few thousand ints even after a very long session — nothing the player will notice).
     * {@link #onNewPlaylist} drops it when another song is opened from a menu.
     */
    private static void pushHist(int idx) {
        if (idx < 0) return;
        if (!shuffle()) return;     // sequential Back is index-1; it needs no history at all
        hist.add(Integer.valueOf(idx));
    }

    /**
     * Opening a song from a menu starts a fresh session: the shuffle plan, the back-history, the
     * removed-row set and the MANUAL QUEUE all reset.
     *
     * <p>The manual queue used to survive this deliberately ("the user put them there on purpose"),
     * and that is what the user asked to change: a queued track is a guest of the list it was
     * queued into, so it goes when that list does. Same in {@link #relist}.
     */
    public static void onNewPlaylist() {
        newPlaylist(0);
    }

    /**
     * The same for a book (#384): injected into {@code setAudiobookPlaylist}. It has to be a call of
     * its own rather than one that asks the service what is playing, because the list is handed over
     * BEFORE the player screen sets the flag — at this moment the service still says "music".
     */
    public static void onNewBookPlaylist() {
        newPlaylist(1);
    }

    private static void newPlaylist(int k) {
        // The list about to be replaced wholesale is the one of kind k, so its guests go with it and
        // there is nothing to take out. A queue live on the OTHER list is a different matter: that
        // list is not being touched, and a track the queue spliced into it has to leave it now.
        if (kind != k) dropGuestsFrom(kind);
        kind = k;
        clearSession();
        dropStalePlayer();      // a track started from a re-opened source: see openSource
        noteSource();
        // A song was opened from a menu: a track change starts here rather than at restartPlay
        // (MusicPlayerActivity publishes its first play state from onCreate, before the player has
        // been told to start anything), AND the player Activity is on its way up over this list,
        // which is the one case where the status bar's icon waits before stepping aside. See Status.
        Status.playerOpening();
    }

    /**
     * The list the queue was built from has just been rebuilt — re-sorted, in practice — so the
     * play order has to follow it. Injected at the end of {@code MyBaseAdapter.setItems}, the one
     * call every ListView-based list in the app goes through.
     *
     * <p>What was wrong without it: a sort change rewrites the SCREEN's list and nothing else. The
     * player keeps the order it was handed when the track was opened, so track 1 of 4 goes on
     * calling itself 1/4 after the sort has made it the last one, "Up next" still lists what used
     * to follow it, and the two only come right when some song is started again — which is the one
     * thing that hands the player a new list.
     *
     * <p>So the player's list and index are replaced in place. Deliberately NOT through
     * {@code setMusicPlaylist}: that is "a song was opened", and {@code Ipp.noteReopen} sitting at
     * the top of it would early-return for the very song that is playing. Nothing is started or
     * stopped here — only the order changes, and the track keeps playing through it.
     *
     * <p>The plan, the back-history and the removed rows all hold INDICES into the old order, so
     * they mean nothing now and go; the manual queue holds songs and stays, as it does across a
     * session reset. There is nothing to repaint: the Now-Playing counter is read in
     * {@code refreshUI} and the player Activity is finished when it is left, so it is rebuilt from
     * the new index the next time it opens; the queue screen and the ▶ marker are projections of
     * exactly what has just been updated.
     *
     * <p>Guards, in order of cost: the adapter must be a song list, it must be the screen the queue
     * was actually started from (strictly — "unknown" must NOT mean "yes" here, or every list build
     * in the app would rewrite the playlist), and the ORDER must really have changed. That last
     * test is what keeps re-entering the source screen from resetting a live shuffle pass; it walks
     * the two lists comparing paths and stops at the first difference, which for a re-sort is
     * usually the first row.
     */
    public static void relist(Object adapter) {
        try {
            if (srcKey == null || !(adapter instanceof MyBaseAdapter)) return;
            PlayerService ps = Y1Application.Companion.getPlayerService();
            if (ps == null) return;
            syncKind();
            List now = list(ps);
            if (now == null || now.isEmpty()) return;
            int cur = index(ps);
            if (cur < 0 || cur >= now.size()) return;
            Object o = now.get(cur);
            if (!(o instanceof Song)) return;

            List items = ((MyBaseAdapter) adapter).getItemList();
            if (items == null || items.isEmpty() || !(items.get(0) instanceof Song)) return;
            if (sameOrder(now, items)) return;
            if (!fromSource(adapter)) return;

            String path = ((Song) o).getPath();
            int at = -1;
            for (int i = 0; i < items.size(); i++) {
                Object s = items.get(i);
                if (s instanceof Song && eq(path, ((Song) s).getPath())) { at = i; break; }
            }
            if (at < 0) return;                  // the playing track is not in the new list at all

            // A copy: the adapter goes on owning (and mutating) the list it was handed.
            setList(ps, new ArrayList(items));
            setIndex(ps, at);
            // The rebuilt list is the source's own — whatever was queued into the old one is not
            // part of it, so what was queued into the old list goes with it (guests included: the
            // list that held them has just been replaced by the one below), and so do the passes
            // remembered for it: every index in them is into an order that no longer exists.
            clearSession();
        } catch (Throwable t) {
            // the play order not following a sort is a nuisance; a crash in a list build is not
        }
    }

    /**
     * True when the two lists hold the same songs in the same order. Everything the QUEUE put into
     * the player's list is passed over — waiting or already played — since none of it was ever part of
     * the source's own list: counting it as a difference would make merely re-entering the source
     * screen rebuild the playlist, which is exactly what this test exists to prevent.
     */
    private static boolean sameOrder(List a, List b) {
        int j = 0;
        for (int i = 0; i < a.size(); i++) {
            if (queued(i)) continue;
            if (j >= b.size()) return false;
            Object x = a.get(i), y = b.get(j++);
            if (!(x instanceof Song) || !(y instanceof Song)) return false;
            if (!eq(((Song) x).getPath(), ((Song) y).getPath())) return false;
        }
        return j == b.size();
    }

    private static boolean eq(String a, String b) {
        return a == null ? b == null : a.equals(b);
    }

    /**
     * {@link #atSource(Object)} answers "yes" when the source is unknown, which is right for the ▶
     * marker and wrong here — this one has to be sure.
     */
    private static boolean fromSource(Object adapter) {
        String k = srcKey;
        if (k == null) return false;
        Context c = ((MyBaseAdapter) adapter).getContext();
        if (!(c instanceof Activity)) return false;
        String s = keyOf((Activity) c);
        return s != null && k.equals(s);
    }

    /** Where this queue came from, for the queue screen's "Up next from: …" divider. */
    private static String source = "";

    public static String source() {
        ensureSource();
        return source == null ? "" : source;
    }

    /**
     * The playlist / album / folder / section a queue was built from is simply the TITLE of the
     * screen it was started from — which every screen already puts in the state bar. Reading it
     * off the Activity on top costs one hook here instead of an injection into each of the eight
     * screens that can start playback, and it names exactly what the user was looking at.
     *
     * Safe to read here: this runs inside {@code setMusicPlaylist}, which every screen calls
     * BEFORE starting the player, so the list screen is still the one on top.
     */
    private static void noteSource() {
        try {
            Activity a = ActivityUtils.getTopActivity();
            String t = (a instanceof BaseActivity) ? ((BaseActivity) a).getStateBarLeftText() : null;
            source = (t == null) ? "" : t;
            srcKey = keyOf(a);
            // A COPY of the screen's own Intent, which is what makes "open the source" possible at
            // all: the key above only names the screen (class + title), and an album, a folder or
            // a playlist is that class plus the extras it was started with. The copy is taken here
            // because this is the one moment the screen in question is on top; it is dropped when
            // there is no screen to remember (playback restored at boot, Shuffle Quick).
            srcIntent = (a == null || srcKey == null) ? null : new Intent(a.getIntent());
            // The screen ITSELF, weakly, which is what "go back to it" really means: several
            // sections page through their levels inside one Activity without ever starting a new
            // one (an album's songs, an artist's albums), so its Intent names the section it was
            // entered at and not the list the song was actually started from. The instance is
            // still sitting in the stack under the player, with its level intact. See openSource.
            srcAct = (a == null || srcKey == null) ? null : new WeakReference(a);
            // Which LIST inside that screen, for the sections that page their levels through one
            // Activity. Only Albums needs it: an artist's songs are shown by that same screen (the
            // "Show all songs" marker), and ArtistsActivity's own song level is dead code —
            // Prefs.artistAlbumsEnabled() is a constant true, so an artist always opens albums.
            srcLevel = (a instanceof com.innioasis.music.AlbumsActivity)
                    ? Albums.levelFor(source) : null;
            srcGenre = (a instanceof com.innioasis.music.GenresActivity)
                    && Genres.levelFor(source);
        } catch (Throwable e) {
            source = "";
            srcKey = null;
            srcIntent = null;
            srcAct = null;
            srcLevel = null;
            srcGenre = false;
        }
    }

    private static Intent srcIntent;
    private static WeakReference srcAct;    // WeakReference<Activity>
    private static String srcLevel;         // the list inside that screen, when it has levels
    private static boolean srcGenre;        // ...and the same for the Genres screen (see Genres)
    private static WeakReference dropPlayer;// the player "open source" left behind, if any

    /**
     * The player the queue was opened from, remembered while the source list is put in front of it.
     * It stays reachable by the back button — until a track is started from that list, which is when
     * it becomes a screen the user has already left behind twice over.
     */
    private static void notePlayerToDrop(List all) {
        dropPlayer = null;
        for (int i = 0; all != null && i < all.size(); i++) {
            Object a = all.get(i);
            if (a instanceof BasePlayerActivity) {
                dropPlayer = new WeakReference(a);
                return;
            }
        }
    }

    /** A new track was started: the player left behind by "open source" is not a way back any more. */
    private static void dropStalePlayer() {
        try {
            Object o = (dropPlayer == null) ? null : dropPlayer.get();
            dropPlayer = null;
            if (!(o instanceof Activity)) return;
            Activity p = (Activity) o;
            if (p.isFinishing()) return;
            if (p == ActivityUtils.getTopActivity()) return;   // it is what the user is looking at
            p.finish();
        } catch (Throwable t) {
            // an extra screen in the back stack is not worth an exception on the play path
        }
    }

    /** True while there is a screen to go back to; the queue screen offers it on the playing row. */
    public static boolean hasSource() {
        ensureSource();
        return srcIntent != null;
    }

    // ------------------------------------------------------- the source outlives the process
    //
    // Playback is restored when the app starts (PlayerService.restore -> setMusicPlaylist) with no
    // Activity on top at all, so noteSource has nothing to read and the source is lost — which is
    // "unknown" everywhere it is asked: no "Open source" on the queue screen, and the play marker
    // showing in EVERY list that holds the song rather than in the one it was started from. Right
    // after a flash that is the state the device comes up in.
    //
    // So it is written down beside stock's own saved state and read back on the first question
    // asked of it. Two things make that safe:
    //   - it is saved from PlayerService.saveState(), i.e. at the same instant stock writes the
    //     list it will restore, so the two cannot describe different sessions;
    //   - and it carries a SIGNATURE of that list (kind, size, first and last path), checked
    //     against the list actually restored. Shuffle Quick, a different list, a library that has
    //     changed underneath: any of them fails the check and the source stays unknown, which is
    //     the behaviour that was there before.

    private static final String P_SIG = "src_sig";
    private static final String P_KEY = "src_key";
    private static final String P_NAME = "src_name";
    private static final String P_URI = "src_uri";
    private static final String P_UUID = "src_uuid";
    private static final String P_LEVEL = "src_level";
    private static final String P_GENRE = "src_genre";

    /** The stored source has been looked at (or a live one was noted): do not look again. */
    private static boolean srcLoaded;

    private static SharedPreferences prefs() {
        Context c = Y1Application.Companion.getAppContext();
        return (c == null) ? null : c.getSharedPreferences("innioasis_plus", Context.MODE_PRIVATE);
    }

    /**
     * Called from {@code PlayerService.saveState()} — the one moment stock writes down what is
     * playing, so this is written in the same breath and by the same trigger.
     *
     * <p>{@code commit()}, not {@code apply()}: the process is on its way down when this runs.
     */
    public static void saveSource(PlayerService ps) {
        try {
            SharedPreferences p = prefs();
            if (p == null) return;
            SharedPreferences.Editor e = p.edit();
            String sig = (srcIntent == null) ? null : listSig(ps);
            if (sig == null) {
                e.putString(P_SIG, "");        // nothing to come back to
            } else {
                e.putString(P_SIG, sig);
                e.putString(P_KEY, srcKey == null ? "" : srcKey);
                e.putString(P_NAME, source == null ? "" : source);
                e.putString(P_URI, srcIntent.toUri(0));
                e.putString(P_UUID, uuidExtras(srcIntent));
                e.putString(P_LEVEL, srcLevel == null ? "" : srcLevel);
                e.putBoolean(P_GENRE, srcGenre);
            }
            e.commit();
        } catch (Throwable t) {
            // the source not surviving a reboot is not worth a crash on the way down
        }
    }

    /**
     * Which list this is, in a form that can be compared after a restart: the kind, the length and
     * the two ends. Not the whole list — this only has to be able to say "not that one", and the
     * pair it is compared against was written by the same call that wrote the list itself.
     */
    private static String listSig(PlayerService ps) {
        try {
            if (ps == null) return null;
            List l = list(ps);
            if (l == null || l.isEmpty()) return null;
            Object a = l.get(0);
            Object b = l.get(l.size() - 1);
            if (!(a instanceof Song) || !(b instanceof Song)) return null;
            return kind + "|" + l.size() + "|" + ((Song) a).getPath() + "|" + ((Song) b).getPath();
        } catch (Throwable t) {
            return null;
        }
    }

    /**
     * A UUID extra is invisible to {@code Intent.toUri} — it encodes primitives and strings only,
     * and a playlist travels as a {@code UUID} (Serializable). Without this the playlist screen
     * would be rebuilt with no playlist in it.
     */
    private static String uuidExtras(Intent i) {
        StringBuilder sb = new StringBuilder();
        try {
            android.os.Bundle b = i.getExtras();
            if (b == null) return "";
            java.util.Iterator it = b.keySet().iterator();
            while (it.hasNext()) {
                String k = (String) it.next();
                Object v = b.get(k);
                if (!(v instanceof UUID)) continue;
                if (sb.length() > 0) sb.append('\n');
                sb.append(k).append('=').append(v.toString());
            }
        } catch (Throwable t) {
            return sb.toString();
        }
        return sb.toString();
    }

    /**
     * Read the stored source back, once, and only while none is known — a source noted this
     * session is always the better answer. The check is the list signature: the list the player
     * holds now must be the one that was playing when it was written down.
     */
    private static void ensureSource() {
        if (srcLoaded || srcKey != null) return;
        try {
            PlayerService ps = svc();
            if (ps == null) return;                    // no service yet: ask again later
            String sig = listSig(ps);
            if (sig == null) return;                   // nothing playing yet: likewise
            srcLoaded = true;
            SharedPreferences p = prefs();
            if (p == null) return;
            if (!sig.equals(p.getString(P_SIG, ""))) return;   // a different session's list
            String key = p.getString(P_KEY, "");
            String uri = p.getString(P_URI, "");
            if (key.length() == 0 || uri.length() == 0) return;
            Intent i = Intent.parseUri(uri, 0);
            String uu = p.getString(P_UUID, "");
            if (uu.length() > 0) {
                String[] rows = uu.split("\n");
                for (int n = 0; n < rows.length; n++) {
                    int at = rows[n].indexOf('=');
                    if (at <= 0) continue;
                    i.putExtra(rows[n].substring(0, at),
                            UUID.fromString(rows[n].substring(at + 1)));
                }
            }
            srcKey = key;
            source = p.getString(P_NAME, "");
            srcIntent = i;
            srcAct = null;                             // the screen itself did not survive
            String lvl = p.getString(P_LEVEL, "");
            srcLevel = (lvl.length() == 0) ? null : lvl;
            srcGenre = p.getBoolean(P_GENRE, false);
        } catch (Throwable t) {
            srcLoaded = true;                          // a stored source that cannot be read is gone
        }
    }

    /**
     * Go back to the screen the playing track was started from — the album, the folder, the
     * playlist, the artist's song list.
     *
     * <p>Not by starting its Intent: an Activity here is a whole SECTION, not a screen. Albums,
     * Artists and Genres walk their levels inside one instance and never start a second one, so the
     * Intent that launched it names the level it was ENTERED at — restarting it landed on the album
     * list instead of the album, on the artist list instead of the artist. (Folders looked right
     * only because a folder there really is its own Activity.)
     *
     * <p>So the live instance is what is remembered, and it is brought to the front over everything
     * that was covering it (`FLAG_ACTIVITY_REORDER_TO_FRONT` — the one way to raise an instance
     * without building a second one). The section comes back exactly as it was left, on the list the
     * song was started from, and nothing is created or re-initialised. If it is gone from the stack
     * after all — the user walked out of it before coming here, which finishes it — then it is built
     * again from its Intent, with the level inside it restored on top of that.
     *
     * <p><b>The player is deliberately left where it is</b>, underneath: one press back from the list
     * returns to it, and from there on the stack is the one the user came up. It stops being wanted
     * the moment a track is started from this list — a new player opens then, and the old one is
     * only a leftover of the way here, so {@link #onNewPlaylist} drops it (see {@link #dropPlayer}).
     */
    public static boolean openSource(Activity from) {
        try {
            ensureSource();
            if (from == null || srcIntent == null) return false;
            Activity src = (srcAct == null) ? null : (Activity) srcAct.get();
            List all = ActivityUtils.getActivityList();          // newest first
            boolean alive = false;
            for (int i = 0; all != null && i < all.size(); i++) {
                if (all.get(i) == src) { alive = ActivityUtils.isActivityAlive(src); break; }
            }
            notePlayerToDrop(all);

            Intent i = new Intent(srcIntent);
            if (alive) {
                i.addFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT);
                Follow.armPending();          // only if it is rebuilt after all; a no-op otherwise
                from.startActivity(i);
                // Land on the track that is playing, the way "Open album" lands on the song it was
                // opened for: the cursor was left wherever the list was when the song was started,
                // and playback has moved on since. The instance keeps its list, so this is a move.
                Follow.toPlaying(src);
                return true;
            }
            i.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_SINGLE_TOP);
            if (srcLevel != null) {
                Albums.restore(i, srcLevel, playingPath());       // lands on the track itself
            } else if (srcGenre) {
                Genres.restore(i, playingPath());                 // the song list of a genre
            } else {
                Follow.armPending();                              // Folders, playlists, Songs
            }
            from.startActivity(i);
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    // ------------------------------------------------------------- which menu the queue came from
    //
    // A song is "the one playing" only in the list it was started from: found again somewhere else
    // it is the same song, but that screen is not what is playing, so it carries no marker and
    // opening it there starts it there rather than picking the running playback up.
    //
    // The screen is identified by a key that survives leaving it and coming back: the Activity's
    // class plus the title it puts in the state bar. The title is what tells apart the several
    // lists one Activity shows -- AlbumsActivity is every album AND the artist's "Show all songs";
    // the class is what tells apart two screens that happen to share a title.

    private static String srcKey;

    private static String keyOf(Activity a) {
        // The main menu is deliberately never a source: Shuffle Quick and the state restored at
        // boot both reach setMusicPlaylist with MainActivity on top, and neither was started from
        // a list. A null key means "unknown", and unknown behaves exactly as before -- the marker
        // shows wherever the song appears.
        if (!(a instanceof BaseActivity)) return null;
        if (a.getClass().getName().endsWith(".MainActivity")) return null;
        String t = ((BaseActivity) a).getStateBarLeftText();
        return a.getClass().getName() + ((char) 1) + (t == null ? "" : t);
    }

    /**
     * True when the screen ON TOP is the one the playing track was started from.
     *
     * Only right where the screen on top IS the screen being asked about — {@code setMusicPlaylist}
     * runs from a list's own confirm(), before the player is started. Anything that binds a row
     * must ask {@link #atSource(Object)} instead: rows are re-bound on a track change while the
     * PLAYER is on top (ListWatch), and the answer must be about the list, not about what covers it.
     */
    public static boolean atSource() {
        ensureSource();
        String k = srcKey;
        if (k == null) return true;
        try {
            String s = keyOf(ActivityUtils.getTopActivity());
            return s == null || k.equals(s);
        } catch (Throwable e) {
            return true;
        }
    }

    // ---- reopening the song that is already playing --------------------------------------------

    /** Set by {@link #noteReopen}, consumed once by {@link #consumeSkipRestart}. */
    private static boolean skipRestart;

    /**
     * The playing MUSIC track, and deliberately not this class's other {@link #playingPath()},
     * which answers with {@code getPlayingSong()} — whichever of music and audiobook is actually
     * playing.
     *
     * <p>The one word matters here: {@link #noteReopen} is asked from
     * {@code PlayerService.setMusicPlaylist}, i.e. about a song being opened from a MUSIC list, and
     * with {@code getPlayingSong()} a playing audiobook could answer for it. The other way round
     * would be wrong too — that is the {@code getPlayingMusic()} trap, which goes on answering with
     * the last song it held long after it stopped, which is why the row marker asks the other one.
     */
    private static String playingMusicPath() {
        PlayerService ps = Y1Application.Companion.getPlayerService();
        if (ps == null) {
            return null;
        }
        Song s = ps.getPlayingMusic();
        return s == null ? null : s.getPath();
    }

    /**
     * ipp: "reopening the song that is already playing continues it" holds only in the list it was
     * started from. Opening the same file from another section starts it THERE, which is also what
     * makes that section the new source ({@link #onNewPlaylist} runs on the proceed path).
     *
     * <p>Injected into {@code PlayerService.setMusicPlaylist}: it answers the question and arms the
     * flag in one call, because the two must be decided from the same instant.
     */
    public static boolean noteReopen(List list, int index) {
        boolean same = false;
        skipRestart = false;
        if (atSource() && list != null && index >= 0 && index < list.size()) {
            Object o = list.get(index);
            if (o instanceof Song) {
                String playing = playingMusicPath();
                if (playing != null) {
                    same = playing.equals(((Song) o).getPath());
                    skipRestart = same;
                }
            }
        }
        return same;
    }

    public static boolean consumeSkipRestart() {
        boolean b = skipRestart;
        skipRestart = false;
        return b;
    }

    private static Object memoAdapter;
    private static String memoTitle;
    private static String memoKey;
    private static boolean memoAns;

    /**
     * True when the list this adapter draws is the one the playing track was started from.
     *
     * The screen is the adapter's own {@code getContext()} — the Activity that built it — which is
     * the right question whatever happens to be on top at the moment the row is bound.
     *
     * Asked once per bound row, so the answer is memoised on the identity of the adapter and of the
     * screen's title String: both are stable fields, and the title is re-assigned exactly when the
     * Activity switches its list (AlbumsActivity shows every album through one adapter).
     */
    public static boolean atSource(Object adapter) {
        try {
            ensureSource();
            String k = srcKey;
            if (k == null) return true;
            if (!(adapter instanceof MyBaseAdapter)) return true;
            Context c = ((MyBaseAdapter) adapter).getContext();
            String t = (c instanceof BaseActivity) ? ((BaseActivity) c).getStateBarLeftText() : null;
            if (adapter == memoAdapter && t == memoTitle && k == memoKey) return memoAns;
            String s = keyOf((c instanceof Activity) ? (Activity) c : null);
            memoAdapter = adapter;
            memoTitle = t;
            memoKey = k;
            memoAns = (s == null) || k.equals(s);
            return memoAns;
        } catch (Throwable e) {
            return true;
        }
    }

    /**
     * Kept because AlbumsActivity's play call site calls them. They used to mark "started from an
     * album", which decided whether Back walked the played path or stock's index-1 — a distinction
     * that no longer exists: with shuffle off Back is index-1 everywhere, bounded by the list's own
     * first and last track, and with shuffle on it is the history everywhere.
     */
    public static void markAlbum() {
    }

    public static void markAlbum(String albumName) {
    }

    /** The file that is playing right now, or null. */
    private static String playingPath() {
        try {
            PlayerService ps = svc();
            Song s = (ps == null) ? null : ps.getPlayingSong();
            return (s == null) ? null : s.getPath();
        } catch (Throwable t) {
            return null;
        }
    }

    private static int indexOf(List ml, Song s) {
        if (ml == null || s == null) return -1;
        String p = s.getPath();
        if (p == null) return -1;
        for (int i = 0; i < ml.size(); i++) {
            Song o = (Song) ml.get(i);
            if (o != null && p.equals(o.getPath())) return i;
        }
        return -1;
    }

    // ---------------------------------------------------------------- playback hooks

    /**
     * Take entry {@code row} of the manual queue and answer the musicList index it plays at.
     *
     * <p>A GUEST is already standing in the list exactly where the queue put it, so playback just
     * carries on into it and {@link #resume} is left alone — what follows it in the list IS what
     * follows it in the queue. An entry the list already held is somewhere else entirely, so that
     * jump remembers the run it interrupts and comes back to it once the queue is drained.
     */
    private static int takeManual(List ml, int row, int cur) {
        Song s = (Song) manual.remove(row);
        int at = ((Integer) guestIdx.remove(row)).intValue();
        int idx = guestAt(ml, at, s);
        if (idx >= 0) {                                  // the guest: it plays behind us, wherever
            idx = moveGuest(ml, idx, cur);               // that turns out to be
            spent.add(Integer.valueOf(idx));             // it stays until the pass is over
            // Under shuffle the counter is the place in the PASS, read as passLen - plan.size().
            // A guest is not in the plan, so the pass is one track longer for having played it —
            // without this it would show the same number as the track before it.
            if (shuffle() && planFor >= 0) passLen++;
            return idx;
        }
        // Only reachable when the splice failed (nothing was playing when it was queued).
        idx = indexOf(ml, s);
        if (idx < 0) {                                   // not in the list at all: append it
            ml.add(s);
            idx = ml.size() - 1;
            if (planFor >= 0) planFor = ml.size();
            spent.add(Integer.valueOf(idx));
        } else {
            if (resume < 0) resume = cur;                // remember the interrupted run
            // It is in the list, so the shuffled pass has it planned somewhere ahead: take it out
            // there, or the queue would only have brought it forward, not moved it.
            if (shuffle()) dropFromPlan(idx);
        }
        return idx;
    }

    /**
     * Injected at the top of PlayerService.nextSong()'s music branch. Returns:
     *   0 — nothing decided, let stock advance (only on an empty/absent list);
     *   1 — the index is set, caller falls through to restartPlay;
     *   2 — handled, caller returns: the list has ended with "repeat list" off.
     */
    public static int takeNext(PlayerService ps) {
        try {
            if (ps == null) return 0;
            syncKind();
            List ml = list(ps);
            if (ml == null || ml.isEmpty()) return 0;
            int size = ml.size();
            int cur = index(ps);
            syncShuffle(size, cur);
            boolean sh = shuffle();
            pushHist(cur);

            if (!manual.isEmpty()) {
                int idx = takeManual(ml, 0, cur);
                if (idx < 0) return 0;
                ps.setPlayIndex(idx);
                return 1;
            }

            int base = cur;
            if (resume >= 0) {                          // queue drained -> continue where we were
                base = resume;
                resume = -1;
                if (base < 0 || base >= size) base = 0;
            }

            if (sh) {
                int idx = nextShuffled(size, base);
                if (idx < 0) return stopAtEnd(ps);      // #4: the pass is over, repeat is off
                ps.setPlayIndex(idx);
                return 1;
            }

            int nxt = nextSeq(size, base);
            if (nxt < 0) {
                // #3: coming off the last track is what "repeat list" MEANS. Without it the
                // list simply ends here.
                if (!repeatAll()) return stopAtEnd(ps);
                // A pass we stepped BACKWARDS out of stands ahead of us: walk back into it whole,
                // from its first track, rather than build a fresh one without its queued tracks.
                if (restorePass(ps, future, true)) return 1;
                dropGuests();                       // a new pass: the list is its own again
                size = ml.size();
                nxt = nextSeq(size, -1);
                if (nxt < 0) return stopAtEnd(ps);
            }
            ps.setPlayIndex(nxt);
            return 1;
        } catch (Exception e) {
            return 0;
        }
    }

    /**
     * Next shuffled index, or -1 when the pass is spent and there is to be no other. A spent
     * cycle means every track has been played once; with "repeat list" on a fresh pass is built
     * around the track picked to play now (building it around the *old* track left the new one
     * still in the plan and one entry short on screen), and with it off the list is over (#4).
     */
    private static int nextShuffled(int size, int cur) {
        int idx = popCycle(size, cur);
        if (idx >= 0) return idx;
        if (!repeatAll()) return -1;
        dropGuests();                    // the pass is spent; what the queue lent it goes back
        int[] sc = sizeCur();            // the list may have shrunk under us
        size = sc[0];
        cur = sc[1];
        if (size <= 0) return -1;
        int pick = randomOther(size, cur);
        if (pick < 0) return -1;
        newCycle(size, pick);
        return pick;
    }

    /** A random index other than {@code cur}, honouring removed rows; -1 if there is none. */
    private static int randomOther(int size, int cur) {
        ArrayList pool = new ArrayList();
        for (int i = 0; i < size; i++) {
            if (i != cur && !skipped(i) && !pendingGuest(i)) pool.add(Integer.valueOf(i));
        }
        if (pool.isEmpty()) return -1;
        return ((Integer) pool.get(rnd.nextInt(pool.size()))).intValue();
    }

    /**
     * Injected into PlayerService.prevSong()'s music branch. Returns:
     *   0 — let stock do index-1;
     *   1 — the index is set, caller falls through to restartPlay;
     *   2 — handled, caller returns (the track was restarted or there is nowhere to go).
     *
     * Three rules, in this order:
     *  1. Past {@link #PREV_RESTART_MS} Back restarts the track rather than changing it (#1).
     *  2. Shuffle on — walk the history, so Back retraces the path actually played. The track
     *     the SESSION opened on is the hard left edge: there it restarts and goes on playing,
     *     and no new pass is invented behind it.
     *  3. Shuffle off — index-1 everywhere (#2), bounded by the LIST's own first and last track
     *     rather than by whichever track the session happened to open on (#3). Off the first
     *     track Back only wraps round to the last one when "repeat list" is on; otherwise it
     *     restarts the track, four-second rule or not.
     */
    public static int prevAction(PlayerService ps) {
        try {
            if (ps == null) return 0;
            syncKind();
            List ml = list(ps);
            if (ml == null || ml.isEmpty()) return 0;
            int size = ml.size();
            int cur = index(ps);
            syncShuffle(size, cur);

            if (pastRestartPoint(ps)) return toStart(ps);

            if (shuffle()) {
                // Standing on the FIRST track of the pass (its number is 1) with a remembered pass
                // behind it: step back into that one whole, queued tracks and all.
                if (passLen - plan.size() <= 1 && restorePass(ps, past, false)) return 1;
                // Nothing was played before this track in this session, so there is nothing to
                // go back to: it restarts and keeps playing. No pass is invented here — that
                // would take the user somewhere they have never been.
                if (hist.isEmpty()) return toStart(ps);
                int idx = ((Integer) hist.remove(hist.size() - 1)).intValue();
                if (idx < 0 || idx >= size) return toStart(ps);
                putBackInPlan(cur, idx, size);
                if (plan.size() >= passLen) {
                    // The step went back over the START of this pass, so we are now standing at
                    // the END of the one before it: nothing ahead, and the number is its length.
                    plan.clear();
                    planFor = size;
                    passLen = size;
                }
                resume = -1;
                ps.setPlayIndex(idx);
                return 1;
            }

            int prv = prevSeq(cur);
            if (prv < 0) {
                // The first track of the list is the first track of the pass: a remembered pass
                // stands behind it and is stepped into whole, before any wrap is considered.
                if (restorePass(ps, past, false)) return 1;
                if (!repeatAll()) return toStart(ps);
                // Wrapping round goes into a pass nothing was ever queued into — the list's own —
                // so whatever this one is still carrying leaves with it, exactly as it would have
                // going forwards. Without this the wrap landed on 4/4 of a three-track album.
                // The pass being left is remembered on the OTHER side, so stepping forward again
                // walks back into it instead of building a fresh one without the queued tracks.
                notePass(future);
                stripGuests();
                size = ml.size();
                prv = prevSeq(size);                 // wrap to the last wanted track
                if (prv < 0) return toStart(ps);
            }
            resume = -1;
            ps.setPlayIndex(prv);
            return 1;
        } catch (Exception e) {
            return 0;
        }
    }

    /**
     * Back under shuffle must put the track we are LEAVING back at the front of the plan, so
     * skipping forward again replays the very track we came from instead of drawing a new random
     * one — i.e. Back/Forward retrace one path, the way they already do with shuffle off. The
     * restored index also reappears as row 1 of the queue screen, since the screen is a
     * projection of the plan.
     *
     * Repeated Backs stack correctly: leaving A→B→C and pressing Back twice restores C then B,
     * leaving the plan as [B, C, …], so Forward plays B then C.
     */
    private static void putBackInPlan(int cur, int target, int size) {
        if (!shuffle()) return;                     // sequential Back/Forward is index±1 already
        if (cur < 0 || cur >= size || cur == target) return;
        if (skipped(cur)) return;                   // the user removed this row on purpose
        if (planFor != size) return;                // no live plan to put it back into
        dropFromPlan(cur);                          // never let it appear twice
        plan.add(0, Integer.valueOf(cur));
    }

    // ---------------------------------------------------------------- screen projection

    /**
     * Rows for the queue screen: now-playing first, then the manual entries, then the next
     * {@link #LOOKAHEAD} playlist tracks (shuffle-aware). Also records, for each row, the
     * playlist index behind it — see {@link #playRow}.
     */
    public static List upNext() {
        ArrayList out = new ArrayList();
        ArrayList idx = new ArrayList();
        try {
            PlayerService ps = svc();
            if (ps == null) { rowIdx = new int[0]; rowManual = 0; manualTotal = 0; return out; }
            syncKind();
            List ml = list(ps);
            if (ml == null || ml.isEmpty()) { rowIdx = new int[0]; rowManual = 0; manualTotal = 0; return out; }
            int size = ml.size();
            int cur = index(ps);
            syncShuffle(size, cur);

            if (cur >= 0 && cur < size) {               // row 0 — playing right now
                out.add(ml.get(cur));
                idx.add(Integer.valueOf(cur));
            }
            // The FIRST MANUAL_MAX of them, so rows 1..n still map onto manual[0..n-1] and
            // removeRow needs nothing (see isManualRow). What is cut off is the far end of a queue
            // nobody was going to scroll to: every one of those rows is a view built before the
            // screen can be used, and a few hundred of them is what made the queue crawl.
            int shown = manual.size() > MANUAL_MAX ? MANUAL_MAX : manual.size();
            for (int i = 0; i < shown; i++) {           // rows 1.. — user-queued
                out.add(manual.get(i));
                idx.add(Integer.valueOf(-1));
            }
            rowManual = shown;
            manualTotal = manual.size();

            // What is left to play — never more than the playlist holds, so a 5-track album
            // shows 4 upcoming from its first track and 3 from its second.
            int base = (resume >= 0 ? resume : cur);    // where the playlist run continues
            if (base < 0 || base >= size) base = 0;
            // The list is always visually finite — it never wraps past the end, not even with
            // repeat on. Repeat only means that when the last track finishes, a new pass is
            // built (see nextShuffled / the stock wrap for sequential play).
            int room = LOOKAHEAD;
            if (shuffle()) {
                ensureCycle(size, cur);
                for (int i = 0; i < plan.size() && room > 0; i++) {
                    int p = ((Integer) plan.get(i)).intValue();
                    if (p == cur || p < 0 || p >= size || skipped(p)) continue;
                    out.add(ml.get(p));
                    idx.add(Integer.valueOf(p));
                    room--;
                }
            } else {
                for (int p = nextSeq(size, base); p >= 0 && room > 0; p = nextSeq(size, p)) {
                    out.add(ml.get(p));
                    idx.add(Integer.valueOf(p));
                    room--;
                }
            }
        } catch (Exception e) {
            // fall through with whatever was collected
        }
        rowIdx = new int[idx.size()];
        for (int i = 0; i < idx.size(); i++) {
            rowIdx[i] = ((Integer) idx.get(i)).intValue();
        }
        return out;
    }

    /** True if this row of the last {@link #upNext()} is a user-queued entry (removable). */
    public static boolean isManualRow(int row) {
        return row >= 1 && row <= rowManual;
    }

    /** Any row but the playing one can be removed: user-queued entries leave the queue, and
     *  a projected playlist track is skipped for the rest of the session. */
    public static void removeRow(int row) {
        if (isManualRow(row)) {
            manual.remove(row - 1);
            int at = ((Integer) guestIdx.remove(row - 1)).intValue();
            if (at >= 0) dropGuest(at);   // it was only in the list because the queue put it there
            return;
        }
        if (row <= 0 || row >= rowIdx.length) return;
        int idx = rowIdx[row];
        if (idx < 0) return;
        skip.add(Integer.valueOf(idx));
        dropFromPlan(idx);
    }

    /** True while this row can be removed (everything except the track playing right now). */
    public static boolean canRemoveRow(int row) {
        return row >= 1 && (isManualRow(row) || row < rowIdx.length);
    }

    /** Remove exactly this index from the shuffle cycle. */
    private static void dropFromPlan(int idx) {
        for (int i = 0; i < plan.size(); i++) {
            if (((Integer) plan.get(i)).intValue() == idx) {
                plan.remove(i);
                return;
            }
        }
    }

    /**
     * Play the track of this row right now. The playlist tracks listed above it are skipped
     * (under shuffle that means dropping the planned entries above it), but **manually queued
     * tracks are never dropped** — the user put them there deliberately, so they stay pending
     * and play after this one.
     */
    public static void playRow(int row) {
        try {
            PlayerService ps = svc();
            if (ps == null || row < 0) return;
            syncKind();
            List ml = list(ps);
            if (ml == null || ml.isEmpty()) return;
            if (row == 0) return;                        // already playing

            int cur = index(ps);
            if (isManualRow(row)) {
                pushHist(cur);
                // only the picked entry leaves the queue — the ones above it stay pending
                int idx = takeManual(ml, row - 1, cur);
                if (idx < 0) return;
                ps.setPlayIndex(idx);
            } else {
                if (row >= rowIdx.length) return;
                int idx = rowIdx[row];
                if (idx < 0 || idx >= ml.size()) return;
                pushHist(cur);
                resume = -1;
                if (shuffle()) dropPlanThrough(idx);
                ps.setPlayIndex(idx);
            }
            ps.restartPlay(false);
        } catch (Exception e) {
            // ignore — never crash the UI on a stale row
        }
    }

    /** Drop planned entries up to and including {@code idx} (they were shown above the pick). */
    private static void dropPlanThrough(int idx) {
        for (int i = 0; i < plan.size(); i++) {
            if (((Integer) plan.get(i)).intValue() == idx) {
                for (int k = 0; k <= i; k++) {
                    plan.remove(0);
                }
                return;
            }
        }
    }
}
