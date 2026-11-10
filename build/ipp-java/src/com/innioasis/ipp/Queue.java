package com.innioasis.ipp;

import android.app.Activity;
import android.content.Intent;
import android.content.Context;
import android.content.SharedPreferences;
import android.view.View;
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
 * "Up Next": the authority on what plays next, and the model behind the queue screen — the track
 * playing, the hand-queued tracks, then the next {@link #LOOKAHEAD} of the playlist. Shuffle is a
 * precomputed {@link #plan} served by {@link #takeNext} ahead of stock's random pick, so what is
 * shown is what plays. A queued track is spliced into the list behind the current one
 * ({@link #insertGuest}) and leaves at the next pass ({@link #dropGuests}). {@link #hist} lets Back
 * retrace the path taken. Works on whichever list is PLAYING, music or audiobook.
 */
public final class Queue {

    /**
     * How far the screen looks ahead, and how many queued tracks it shows. Both bounded: each row
     * is a view built before the first frame. The cut is at the far end; the caption tells the total.
     */
    public static final int LOOKAHEAD = 20;
    public static final int MANUAL_MAX = 20;

    private static final ArrayList manual = new ArrayList();   // ArrayList<Song> — user-queued

    /** The queued songs themselves, for {@code Moved}; main thread only. */
    static List manualSongs() { return manual; }
    /**
     * Aligned with {@link #manual}: the list position of a GUEST (spliced in when queued), or -1
     * for an entry the list holds already.
     */
    private static final ArrayList guestIdx = new ArrayList();  // ArrayList<Integer>
    /**
     * Where the guests that already PLAYED stand, until the pass ends (Back can walk into one).
     * Positions, not songs: the same song object can stand in the list twice.
     */
    private static final ArrayList spent = new ArrayList();     // ArrayList<Integer>
    private static final ArrayList plan = new ArrayList();     // ArrayList<Integer> — shuffle cycle
    private static final ArrayList hist = new ArrayList();     // ArrayList<Integer> — visited indices
    private static final ArrayList skip = new ArrayList();     // ArrayList<Integer> — dropped rows
    /** Passes that carried queued tracks and lie BEHIND us — see {@link #notePass}. */
    private static final ArrayList past = new ArrayList();     // ArrayList<Pass>
    /** ...and the ones AHEAD, stepped backwards out of. */
    private static final ArrayList future = new ArrayList();   // ArrayList<Pass>
    private static final Random rnd = new Random();

    private static final int MAX_PAST = 4;

    /** 0 = music, 1 = audiobook: the indices here mean something in one list only. */
    private static int kind = 0;

    /** Playlist position to continue from once the manual entries are exhausted (-1 = none). */
    private static int resume = -1;
    /** Playlist size the shuffle plan was built for; a different size invalidates it. */
    private static int planFor = -1;

    /** Past this point Back restarts the track, as on every hardware player. */
    private static final long PREV_RESTART_MS = 4000;

    /** Last observed shuffle setting: -1 unknown, 0 off, 1 on. See {@link #syncShuffle}. */
    private static int lastShuffle = -1;

    /**
     * The shuffled pass's length: the position in it is {@code passLen - plan.size()}, what Now
     * Playing shows under shuffle. Derived, not counted — a counter drifts at every boundary.
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

    // Audiobooks go through the same hooks, so everything asks WHICH list. Read explicitly, not via
    // getPlayList(): that answers an empty list while `playing` is None.

    /** True while the service is on an audiobook. */
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

    /** For a kind that is no longer current (cleaning up after a switch). */
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

    /** The playing kind changed: the session starts over, the old list's guests taken out first. */
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
        }
    }

    public static void add(Song s) {
        if (s == null) return;
        syncKind();
        manual.add(s);
        guestIdx.add(Integer.valueOf(insertGuest(s)));
    }

    /**
     * Splice a queued track in behind the one playing (and behind those already waiting); returns
     * its position, or -1. Also when the list already holds the song: it plays now AND in its place.
     * On adding, not on reaching it, so the counter is right at once (1/3 → 1/4). Every index here
     * moves up with it ({@link #shiftUp}); a guest is never part of the shuffle plan.
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

    /** A guest removed before it played leaves the playlist too. */
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
        }
    }

    /**
     * A new pass begins: the played guests leave with the pass that carried them, or the list only
     * grows. Entries still waiting stay.
     */
    private static void dropGuests() {
        if (spent.isEmpty()) return;
        notePass(past);
        stripGuests();
    }

    /**
     * The same without remembering — for stepping BACK over a boundary, where recording would
     * restore the entry just taken from {@link #past} and Back would bounce for ever.
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
                // standing ON it is fine: the caller overwrites the index
                if (cur > at) setIndex(ps, cur - 1);
                shiftDown(at);
            }
        } catch (Throwable t) {
        }
    }

    /**
     * One finished pass that HELD queued tracks, kept whole so Back over the boundary walks into
     * it as it was played, guests included.
     */
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

    /** Remember the pass that is ending, while the list still holds it. */
    private static void notePass(ArrayList stack) {
        try {
            if (spent.isEmpty()) return;
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
            // Back lands on the last track; left in the history it would play twice
            int n = p.hist.size();
            if (n > 0 && ((Integer) p.hist.get(n - 1)).intValue() == p.index) p.hist.remove(n - 1);
            stack.add(p);
            while (stack.size() > MAX_PAST) stack.remove(0);
        } catch (Throwable t) {
        }
    }

    /**
     * Put a remembered pass back whole and land in it: walking BACK at its last track, FORWARD
     * ({@code atStart}) at its first with a fresh history. False = nothing remembered there.
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
                hist.clear();
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
     * A queued track's turn: move it to stand right behind the track being left — playback may
     * reach it from elsewhere than where it was parked. Returns where it went; the caller sets the
     * play index.
     */
    private static int moveGuest(List ml, int from, int cur) {
        try {
            if (ml == null || from < 0 || from >= ml.size()) return from;
            int to = (cur > from ? cur - 1 : cur) + 1;
            if (to == from) return from;
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

    /** Append a menu selection and say so. The one funnel: the guard and the toast live here. */
    public static void addAll(List songs) {
        if (songs == null) return;
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
     * "Add to queue" from a long-press menu: the ticked rows, else the focused one. A song is
     * queued as is; an album, artist or playlist row queues all its songs.
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
            // cleared, or the next "Add to queue" queues them again
            sel.clear();
            a.notifyDataSetChanged();
        } else {
            Object o = a.getItem(a.getPosition());
            if (o != null) picked.add(o);
        }
        addPicked(picked);
    }

    /** A screen's list of either kind: the adapter on it is the active level. */
    public static void addFromList(View lv) {
        MyBaseAdapter a = lv == null ? null : Lv.model(lv);
        if (a != null) addFromAdapter(a);
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

    /** The Search results: rows are {@code SearchActivity.Item} wrappers, unwrapped. Music only. */
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

    // The queue belongs to the player that is PLAYING: a song spliced into the audiobook list would
    // be played by the book player. The section a row was picked in decides.

    /** The section of the add in progress, consumed by {@link #addAll}; -1 = ask the songs. */
    private static int fromKind = -1;

    /** SongListActivity's own gather loop. */
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
        }
        return 0;
    }

    /** A toast with CENTRED text: the platform's start-aligned second line looks ragged. */
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
        }
    }

    /** 1 = the row was picked in the audiobook section, 0 = anywhere else. */
    private static int screenKind(Context c) {
        try {
            if (!(c instanceof Activity)) return 0;
            String n = c.getClass().getName();
            if (n.endsWith(".AllAudiobooksActivity")) return 1;
            // the file browser serves both sections: its start path decides
            if (n.endsWith(".FilesActivity")) {
                String p = ((Activity) c).getIntent().getStringExtra("now_path");
                if (p != null && (p.startsWith(com.innioasis.music.objects.Constant.AUDIOBOOK_PATH)
                        || p.startsWith(com.innioasis.music.objects.Constant.AUDIOBOOK_PATH_LOW))) {
                    return 1;
                }
            }
        } catch (Throwable t) {
        }
        return 0;
    }

    /** Not while the OTHER kind is playing — and then the user is told so, not silently refused. */
    private static boolean allowedFrom(int from) {
        try {
            PlayerService ps = svc();
            if (ps == null) return true;
            PlayerService.Playing p = ps.getPlaying();
            int playing;
            if (p == PlayerService.Playing.Audiobook) playing = 1;
            else if (p == PlayerService.Playing.Music) playing = 0;
            else return true;
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
                        // the "Show all songs" row stands for the whole artist
                        collect(songs, artistSongs(repo, Albums.allSongsArtist(an)));
                    } else {
                        // keeps the folder-encoded album name working (songsSync filters by folder)
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
        }
    }

    private static void collect(ArrayList into, List songs) {
        if (songs == null) return;
        for (int i = 0; i < songs.size(); i++) {
            if (songs.get(i) != null) into.add(songs.get(i));
        }
    }

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

    private static boolean repeatAll() {
        SharedPreferencesUtils s = SharedPreferencesUtils.INSTANCE;
        return (book() ? s.getAudiobookRepeatMode() : s.getMusicRepeatMode()) == 2;
    }

    /**
     * One shuffle cycle: every track but the current one, each once — the shown list is finite
     * and duplicate-free. A waiting guest is not part of it.
     */
    private static void newCycle(int size, int cur) {
        plan.clear();
        planFor = size;
        for (int i = 0; i < size; i++) {
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
     * Notice a flipped shuffle setting by reading the flag, not by hooking every writer. ON starts
     * a pass at the current track (counter back to 1); OFF drops the plan.
     */
    private static void syncShuffle(int size, int cur) {
        int sh = shuffle() ? 1 : 0;
        if (lastShuffle == sh) return;
        boolean first = (lastShuffle < 0);
        lastShuffle = sh;
        if (first) return;                       // the first observation only records
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
        }
    }

    /** Now Playing's number before the slash ({@code refreshUI}): place in the list, or in the pass. */
    public static int trackNo(PlayerService ps) {
        try {
            if (ps == null) return 1;
            syncKind();
            List ml = list(ps);
            int size = (ml == null) ? 0 : ml.size();
            int cur = index(ps);
            syncShuffle(size, cur);
            if (!shuffle()) {
                // a waiting queue entry takes no number: the tracks beyond it keep theirs
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
     * Play the track again from the top. A seek works only while the player holds it: fast
     * skipping leaves it reset mid-prepare, where seek/start silently do nothing (the "track stops
     * halfway" hang). Then {@code restartPlay} rebuilds it.
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
            }
        }
        try {
            ps.restartPlay(true);
        } catch (Throwable t) {
        }
        return 2;
    }

    /**
     * Far enough in for Back to restart. Only a prepared player is asked: mid-prepare the position
     * is a stale one and turned fast Back presses into restarts.
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

    /** The list ended without "repeat list": pause, rewound to the top. */
    private static int stopAtEnd(PlayerService ps) {
        try {
            ps.pause(book() ? 10 : 9, true);     // stock's own end-of-list pause message, per kind
            ps.setCurrentPosition(0L);
        } catch (Throwable t) {
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

    /** The track-completion handler, in place of stock's "index == size-1". Queued tracks win. */
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

    /** Unbounded on purpose: Back walks home to the track opened from the menu. */
    private static void pushHist(int idx) {
        if (idx < 0) return;
        if (!shuffle()) return;     // sequential Back needs no history
        hist.add(Integer.valueOf(idx));
    }

    /**
     * A song opened from a menu: a fresh session — plan, history, removed rows and the manual
     * queue (a queued track is a guest of its list) all reset.
     */
    public static void onNewPlaylist(List handed) {
        newPlaylist(0, handed);
    }

    /**
     * The same for a book ({@code setAudiobookPlaylist}): a call of its own, since the service
     * still says "music" at this moment.
     */
    public static void onNewBookPlaylist(List handed) {
        newPlaylist(1, handed);
    }

    /** @param handed the list given to the player, compared here for {@link #srcOrdered}. */
    private static void newPlaylist(int k, List handed) {
        // a queue live on the OTHER list leaves it now; this kind's list is replaced wholesale
        if (kind != k) dropGuestsFrom(kind);
        kind = k;
        clearSession();
        dropStalePlayer();      // a track started from a re-opened source: see openSource
        noteSource(handed);
        Status.playerOpening();
    }

    /**
     * The source list was re-sorted: the play order follows, in place
     * ({@code MyBaseAdapter.setItems}). Not through {@code setMusicPlaylist} —
     * {@link #noteReopen} would early-return for the song playing. Nothing is restarted. Guards:
     * the session began in the screen's order ({@link #srcOrdered}), the list is the SOURCE
     * (strictly — "unknown" must not mean yes) and the order really changed.
     */
    public static void relist(Object adapter) {
        try {
            if (!(adapter instanceof MyBaseAdapter)) return;
            noteBuilt((MyBaseAdapter) adapter);
            if (srcKey == null || !srcOrdered) return;
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
            if (at < 0) return;

            // a copy: the adapter goes on mutating its own
            setList(ps, new ArrayList(items));
            setIndex(ps, at);
            // every index kept is into an order that no longer exists
            clearSession();
        } catch (Throwable t) {
        }
    }

    /** Remember a song list as it was built, for {@link #ordered}. No copy. */
    private static void noteBuilt(MyBaseAdapter a) {
        try {
            List items = a.getItemList();
            if (items == null || items.isEmpty() || !(items.get(0) instanceof Song)) return;
            lastList = new WeakReference(a);
        } catch (Throwable t) {
        }
    }

    /** The same songs in the same order, passing over everything the QUEUE put into the list. */
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

    /** Strict: unlike {@link #atSource(Object)}, "unknown" is no. */
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
     * The source is the state-bar TITLE of the screen on top — still the list screen, since
     * {@code setMusicPlaylist} runs before the player starts. One hook instead of eight.
     */
    private static void noteSource(List handed) {
        try {
            Activity a = ActivityUtils.getTopActivity();
            String t = (a instanceof BaseActivity) ? ((BaseActivity) a).getStateBarLeftText() : null;
            source = (t == null) ? "" : t;
            srcKey = keyOf(a);
            srcOrdered = ordered(a, handed);
            // a COPY of its Intent: the extras say which album, folder or playlist
            srcIntent = (a == null || srcKey == null) ? null : new Intent(a.getIntent());
            // the instance itself: its Intent names the level it was ENTERED at (see openSource)
            srcAct = (a == null || srcKey == null) ? null : new WeakReference(a);
            // the list inside a screen with levels, should it have to be rebuilt
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
            srcOrdered = true;
        }
    }

    /** Is {@code handed} the list on screen, row for row ({@link #srcOrdered})? "Cannot tell" = yes. */
    private static boolean ordered(Activity a, List handed) {
        try {
            if (a == null || handed == null || handed.isEmpty()) return true;
            WeakReference r = lastList;
            Object o = (r == null) ? null : r.get();
            if (!(o instanceof MyBaseAdapter)) return true;
            MyBaseAdapter built = (MyBaseAdapter) o;
            if (built.getContext() != a) return true;
            List items = built.getItemList();
            if (items == null || items.size() != handed.size()) return true;
            for (int i = 0; i < items.size(); i++) {
                Object x = items.get(i), y = handed.get(i);
                if (!(x instanceof Song) || !(y instanceof Song)) return true;
                if (!eq(((Song) x).getPath(), ((Song) y).getPath())) return false;
            }
            return true;
        } catch (Throwable t) {
            return true;
        }
    }

    private static Intent srcIntent;
    private static WeakReference srcAct;    // WeakReference<Activity>
    private static String srcLevel;         // the list inside that screen, when it has levels
    private static boolean srcGenre;        // ...and the same for the Genres screen (see Genres)
    private static WeakReference dropPlayer;// the player "open source" left behind, if any

    /**
     * The list was handed over in the SOURCE SCREEN'S OWN ORDER. A Shuffle row's is a permutation
     * on purpose, and {@link #relist} must leave such a session alone, or re-entering the section
     * replaces it in sort order. Only a comparison can tell the two taps apart.
     */
    private static boolean srcOrdered = true;

    /** The last SONG list built ({@code setItems}), weakly — the adapter, not a copy. */
    private static WeakReference lastList;  // WeakReference<MyBaseAdapter>

    /** The player the queue was opened from: a way back until a track starts from the source. */
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
            if (p == ActivityUtils.getTopActivity()) return;
            p.finish();
        } catch (Throwable t) {
        }
    }

    /** True while there is a screen to go back to; the queue screen offers it on the playing row. */
    public static boolean hasSource() {
        ensureSource();
        return srcIntent != null;
    }

    // The source survives a restart: playback restored at boot has no screen on top to read it
    // from. Saved with stock's own state, with a SIGNATURE of the list checked on reading back.
    private static final String P_SIG = "src_sig";
    private static final String P_KEY = "src_key";
    private static final String P_NAME = "src_name";
    private static final String P_URI = "src_uri";
    private static final String P_UUID = "src_uuid";
    private static final String P_LEVEL = "src_level";
    private static final String P_GENRE = "src_genre";
    private static final String P_ORDERED = "src_ordered";

    /** The stored source has been looked at (or a live one was noted): do not look again. */
    private static boolean srcLoaded;

    /** {@code PlayerService.saveState()}. {@code commit()}: the process is on its way down. */
    public static void saveSource(PlayerService ps) {
        try {
            SharedPreferences p = Prefs.file();
            if (p == null) return;
            SharedPreferences.Editor e = p.edit();
            String sig = (srcIntent == null) ? null : listSig(ps);
            if (sig == null) {
                e.putString(P_SIG, "");
            } else {
                e.putString(P_SIG, sig);
                e.putString(P_KEY, srcKey == null ? "" : srcKey);
                e.putString(P_NAME, source == null ? "" : source);
                e.putString(P_URI, srcIntent.toUri(0));
                e.putString(P_UUID, uuidExtras(srcIntent));
                e.putString(P_LEVEL, srcLevel == null ? "" : srcLevel);
                e.putBoolean(P_GENRE, srcGenre);
                e.putBoolean(P_ORDERED, srcOrdered);
            }
            e.commit();
        } catch (Throwable t) {
        }
    }

    /** Kind, length and both ends: enough to say "not that list" after a restart. */
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

    /** {@code Intent.toUri} drops UUID extras, and a playlist travels as one. */
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

    /** Read the stored source back, once, only while none is known, and only for the same list. */
    private static void ensureSource() {
        if (srcLoaded || srcKey != null) return;
        try {
            PlayerService ps = svc();
            if (ps == null) return;                    // ask again later
            String sig = listSig(ps);
            if (sig == null) return;
            srcLoaded = true;
            SharedPreferences p = Prefs.file();
            if (p == null) return;
            if (!sig.equals(p.getString(P_SIG, ""))) return;
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
            srcOrdered = p.getBoolean(P_ORDERED, true);
        } catch (Throwable t) {
            srcLoaded = true;
        }
    }

    /**
     * Back to the screen the track was started from. The live instance is raised
     * ({@code REORDER_TO_FRONT}), not its Intent restarted: Albums, Artists and Genres walk their
     * levels inside one instance, and the Intent names the level it was ENTERED at. If it is gone,
     * it is rebuilt with its level restored. The player stays underneath, one press back, until a
     * track starts from this list.
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
                Follow.armPending();          // only if it is rebuilt after all
                from.startActivity(i);
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

    // A song is "the one playing" only in the list it was started from. The list's key is the
    // Activity class plus its state-bar title, which survives leaving and coming back.
    private static String srcKey;

    private static String keyOf(Activity a) {
        // the main menu is never a source (Shuffle Quick, boot restore): null = unknown
        if (!(a instanceof BaseActivity)) return null;
        if (a.getClass().getName().endsWith(".MainActivity")) return null;
        String t = ((BaseActivity) a).getStateBarLeftText();
        return a.getClass().getName() + ((char) 1) + (t == null ? "" : t);
    }

    /**
     * The screen ON TOP is the source. Only for {@code setMusicPlaylist}; a row bind asks
     * {@link #atSource(Object)} — rows are re-bound while the PLAYER is on top.
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

    /** Set by {@link #noteReopen}, consumed once by {@link #consumeSkipRestart}. */
    private static boolean skipRestart;

    /**
     * The playing MUSIC track — not {@link #playingPath()}: {@link #noteReopen} is about a MUSIC
     * list, and a playing audiobook must not answer for it. Do not merge the two.
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
     * {@code setMusicPlaylist}: reopening the playing song continues it — only in its source list;
     * elsewhere it starts there and that list becomes the source. Answers and arms in one call.
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

    // weak: a key only, and a strong one kept the last closed list screen alive
    private static WeakReference memoAdapter;
    private static String memoTitle;
    private static String memoKey;
    private static boolean memoAns;

    /**
     * This adapter's list is the source — asked of its own Activity, whatever is on top. Per bound
     * row, so memoised on the adapter and the title String (re-assigned when the list switches).
     */
    public static boolean atSource(Object adapter) {
        try {
            ensureSource();
            String k = srcKey;
            if (k == null) return true;
            if (!(adapter instanceof MyBaseAdapter)) return true;
            Context c = ((MyBaseAdapter) adapter).getContext();
            String t = (c instanceof BaseActivity) ? ((BaseActivity) c).getStateBarLeftText() : null;
            if (memoAdapter != null && adapter == memoAdapter.get() && t == memoTitle && k == memoKey) {
                return memoAns;
            }
            String s = keyOf((c instanceof Activity) ? (Activity) c : null);
            memoAdapter = new WeakReference(adapter);
            memoTitle = t;
            memoKey = k;
            memoAns = (s == null) || k.equals(s);
            return memoAns;
        } catch (Throwable e) {
            return true;
        }
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

    /**
     * Take entry {@code row} of the manual queue and answer the list index it plays at. A GUEST
     * is played where it stands; an entry the list held already is a jump, so the interrupted run
     * is remembered in {@link #resume}.
     */
    private static int takeManual(List ml, int row, int cur) {
        Song s = (Song) manual.remove(row);
        int at = ((Integer) guestIdx.remove(row)).intValue();
        int idx = guestAt(ml, at, s);
        if (idx >= 0) {
            idx = moveGuest(ml, idx, cur);
            spent.add(Integer.valueOf(idx));             // it stays until the pass is over
            // a guest is not in the plan: the pass grows by one, or the counter repeats a number
            if (shuffle() && planFor >= 0) passLen++;
            return idx;
        }
        // only when the splice failed (nothing was playing when it was queued)
        idx = indexOf(ml, s);
        if (idx < 0) {
            ml.add(s);
            idx = ml.size() - 1;
            if (planFor >= 0) planFor = ml.size();
            spent.add(Integer.valueOf(idx));
        } else {
            if (resume < 0) resume = cur;
            // out of the plan too, or the queue only brought it forward
            if (shuffle()) dropFromPlan(idx);
        }
        return idx;
    }

    /**
     * Top of {@code PlayerService.nextSong()}. Returns:
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
                if (idx < 0) return stopAtEnd(ps);
                ps.setPlayIndex(idx);
                return 1;
            }

            int nxt = nextSeq(size, base);
            if (nxt < 0) {
                if (!repeatAll()) return stopAtEnd(ps);
                // a pass stepped BACKWARDS out of stands ahead: walk into it whole
                if (restorePass(ps, future, true)) return 1;
                dropGuests();
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
     * Next shuffled index, or -1 at the end of the pass without "repeat list". A new pass is built
     * around the track picked to play NOW, not the old one.
     */
    private static int nextShuffled(int size, int cur) {
        int idx = popCycle(size, cur);
        if (idx >= 0) return idx;
        if (!repeatAll()) return -1;
        dropGuests();
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
     * {@code PlayerService.prevSong()}. Returns 0 — stock's index-1; 1 — index set, caller restarts
     * play; 2 — handled. Rules in order: past {@link #PREV_RESTART_MS} restart the track; shuffle —
     * walk the history, the session's first track restarts; otherwise index-1 within the LIST,
     * wrapping to the last only with "repeat list".
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
                // first track of the pass, a remembered pass behind it: step into it whole
                if (passLen - plan.size() <= 1 && restorePass(ps, past, false)) return 1;
                // nothing played before it: no pass is invented behind it
                if (hist.isEmpty()) return toStart(ps);
                int idx = ((Integer) hist.remove(hist.size() - 1)).intValue();
                if (idx < 0 || idx >= size) return toStart(ps);
                putBackInPlan(cur, idx, size);
                if (plan.size() >= passLen) {
                    // back over the START of this pass: at the END of the one before it
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
                if (restorePass(ps, past, false)) return 1;
                if (!repeatAll()) return toStart(ps);
                // The wrap enters the list's own pass, so the guests leave; this pass is
                // remembered AHEAD, for stepping forward into it again.
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
     * Back under shuffle puts the track being LEFT at the front of the plan, so Back/Forward
     * retrace one path. Repeated Backs stack: A→B→C, Back twice → plan [B, C, …].
     */
    private static void putBackInPlan(int cur, int target, int size) {
        if (!shuffle()) return;
        if (cur < 0 || cur >= size || cur == target) return;
        if (skipped(cur)) return;                   // removed on purpose
        if (planFor != size) return;                // no live plan
        dropFromPlan(cur);                          // never twice
        plan.add(0, Integer.valueOf(cur));
    }

    /**
     * The queue screen's rows: playing, manual entries, then the next {@link #LOOKAHEAD}. Records
     * the list index behind each row for {@link #playRow}.
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
            // the FIRST MANUAL_MAX: rows 1..n still map onto manual[0..n-1]
            int shown = manual.size() > MANUAL_MAX ? MANUAL_MAX : manual.size();
            for (int i = 0; i < shown; i++) {           // rows 1.. — user-queued
                out.add(manual.get(i));
                idx.add(Integer.valueOf(-1));
            }
            rowManual = shown;
            manualTotal = manual.size();

            // what is left of this pass — never wrapping, even with repeat on
            int base = (resume >= 0 ? resume : cur);
            if (base < 0 || base >= size) base = 0;
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
        }
        rowIdx = new int[idx.size()];
        for (int i = 0; i < idx.size(); i++) {
            rowIdx[i] = ((Integer) idx.get(i)).intValue();
        }
        return out;
    }

    /**
     * The file that plays after the current one, or null at the end of the pass. Leaves the queue
     * screen's row records as they were.
     */
    public static String nextPath() {
        int[] ri = rowIdx;
        int rm = rowManual, mt = manualTotal;
        try {
            String playing = playingPath();
            List rows = upNext();
            if (playing == null || rows.size() < 2) return null;
            Object first = rows.get(0), next = rows.get(1);
            if (!(first instanceof Song) || !playing.equals(((Song) first).getPath())) return null;
            return (next instanceof Song) ? ((Song) next).getPath() : null;
        } catch (Throwable t) {
            return null;
        } finally {
            rowIdx = ri;
            rowManual = rm;
            manualTotal = mt;
        }
    }

    /** A user-queued row of the last {@link #upNext()}. */
    public static boolean isManualRow(int row) {
        return row >= 1 && row <= rowManual;
    }

    /** A queued entry leaves the queue; a playlist track is skipped for the rest of the session. */
    public static void removeRow(int row) {
        if (isManualRow(row)) {
            manual.remove(row - 1);
            int at = ((Integer) guestIdx.remove(row - 1)).intValue();
            if (at >= 0) dropGuest(at);
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
     * Play this row now. Playlist tracks above it are skipped; queued ones are NEVER dropped —
     * they play after it.
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
