package com.innioasis.ipp;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import com.innioasis.music.adapter.MyBaseAdapter;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.theme.ThemeManager;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

/**
 * The disc a multi-disc album's song list is currently in, plus per-disc
 * track numbering.
 *
 * The disc is shown on a bar PINNED under the Shuffle row (`ipp_disc_bar` in
 * activity_albums.xml), not on a divider inside the list. A divider inside the list was the
 * first implementation and it had two problems that are structural, not cosmetic: it made the
 * first row of every disc taller than the others, which breaks ListView's row-count scrolling
 * (the row the wheel lands on came out cut by the bottom edge), and it scrolled away, so once
 * past it there was nothing on screen saying which disc these tracks belong to. A separate
 * non-selectable list row would fix the second but not the first, and would renumber every
 * position in a list whose positions feed playback.
 *
 * So: rows are all the same height again, and the bar follows the list — it shows the disc of
 * the topmost visible row and switches when the list reaches the next one.
 *
 * The bar belongs to the two screens that show an ALBUM, never to a playlist that happens to hold
 * the same songs. The list content cannot tell those apart, so the signal is the adapter INSTANCE:
 * AlbumsActivity registers its song adapter via {@link #setAlbumAdapter}, GenresActivity registers
 * its two via {@link #setGenreAdapters} (and unregisters them for its flat lists), and only a
 * registered one is eligible — {@link #discList}. On top of that the list must be a single album,
 * contiguous by disc folder; a single disc numbered 1 (or no CD folders) shows no bar, a single
 * "CD2" folder does.
 *
 * Raw (non-generic) types throughout: the bundled d8 crashes on generic Signature attrs.
 */
public final class Disc {

    private static WeakReference albumAdapter;   // AlbumsActivity's song adapter (the only eligible one)

    public static void setAlbumAdapter(Object adapter) {
        albumAdapter = adapter == null ? null : new WeakReference(adapter);
    }

    private static boolean isAlbumAdapter(Object adapter) {
        return adapter != null && albumAdapter != null && albumAdapter.get() == adapter;
    }

    /**
     * The two song adapters of {@code GenresActivity}, registered by {@code Genres.songs} while the
     * list it is building is a REAL album and cleared while it is one of the marker "Show all
     * songs" lists.
     *
     * Two references because that screen swaps between two song adapters, and a slot of its own
     * rather than {@link #albumAdapter} because the two screens are told apart elsewhere —
     * {@code Follow} wants the Albums screen alone, and the "is this list flat" question has a
     * different answer on each ({@code Albums.isAllSongsList} against {@code Genres.flat}).
     *
     * Everything the divider machinery does, this list gets: the strip in the row, the pinned
     * bar, the per-disc restart of the numbering, the pixel scrolling that unequal rows need and
     * the cursor following the playing track. The TRACK NUMBER column on its own would be the wrong
     * half to give it: the tag numbers of a two-disc album restart at 1 half way down the list, and
     * with no strip and no bar there is nothing on screen saying why.
     *
     * Whether the list is an album is decided by {@code Genres.flat()} — the marker byte of the
     * name the list was built with — and not by "do all the rows carry one album name", because a
     * genre holding exactly one album gives a flat list indistinguishable from an album. That is
     * why registration itself is the answer here: an adapter is only ever registered for a list
     * that is a real album, so {@link #flatOf} can say so without asking again.
     */
    private static WeakReference genreAdapter1;
    private static WeakReference genreAdapter2;

    public static void setGenreAdapters(Object a, Object b) {
        genreAdapter1 = a == null ? null : new WeakReference(a);
        genreAdapter2 = b == null ? null : new WeakReference(b);
    }

    private static boolean isGenreAdapter(Object adapter) {
        if (adapter == null) return false;
        if (genreAdapter1 != null && genreAdapter1.get() == adapter) return true;
        return genreAdapter2 != null && genreAdapter2.get() == adapter;
    }

    /**
     * True for a song list that shows a RECORD: the Albums screen's (an album, or the artist's flat
     * "Show all songs", which rides the same adapter) and the Genres screen's while it is showing a
     * real album. False for a playlist, a folder, the library — the adapter instance is the only
     * signal there is, see the class comment.
     *
     * Everything here asks this one question: the strip in the row, the pinned bar, the per-disc
     * numbering and {@code Wheel}'s pixel scrolling. {@code Follow} does NOT: it has no radius and no
     * shuffle rule for an album to be exempt from, so it never asks.
     */
    public static boolean discList(Object adapter) {
        return isAlbumAdapter(adapter) || isGenreAdapter(adapter);
    }

    /**
     * Whether the list this adapter is showing is a flat "everything at once" one rather than a
     * record — the question {@link #compute} needs and the one thing the two screens answer
     * differently. The Albums screen notes it per list built ({@code Albums.isAllSongsList}); on
     * the Genres screen a registered adapter already means "a real album", because
     * {@code Genres.numbers} unregisters both for the marker lists.
     */
    private static boolean flatOf(Object adapter) {
        return isAlbumAdapter(adapter) && Albums.isAllSongsList();
    }

    private static String sig;
    private static boolean enabled;
    private static int[] discs;        // disc number per row
    private static int[] groupStart;   // first row index of this row's disc group
    private static boolean singleAlbum;   // every row of this list is the same album
    private static int[] tagNums;      // TRACK NUMBER per row, or null = number the rows
    private static String warmSig;     // the list whose missing tags have already been asked for

    private static String path(Object o) {
        Song s = (Song) o;
        return s == null || s.getPath() == null ? "" : s.getPath();
    }

    private static String album(Object o) {
        Song s = (Song) o;
        return s == null || s.getAlbum() == null ? "" : s.getAlbum();
    }

    private static void ensure(List songs, boolean flat) {
        if (songs == null) { sig = null; enabled = false; return; }
        int n = songs.size();
        String s = (flat ? "F|" : "A|")
                + n + "|" + (n > 0 ? path(songs.get(0)) : "") + "|" + (n > 0 ? path(songs.get(n - 1)) : "");
        if (s.equals(sig)) return;
        // set BEFORE computing: compute() does not read it, and the tag warm-up needs the
        // signature of the list it is reading tags for, not of the one before it
        sig = s;
        compute(songs, flat);
    }

    private static void compute(List songs, boolean flat) {
        int n = songs.size();
        discs = new int[n];
        groupStart = new int[n];
        enabled = false;
        if (n == 0) return;

        String album0 = album(songs.get(0));
        boolean single = true, contiguous = true, allPos = true;
        HashSet seen = new HashSet();
        int prev = -1;   // sentinel: real disc numbers are >= 0
        for (int i = 0; i < n; i++) {
            Object o = songs.get(i);
            if (!album(o).equals(album0)) single = false;
            int d = Albums.discOf(path(o));
            discs[i] = d;
            if (d <= 0) allPos = false;
            if (d != prev) {
                if (seen.contains(Integer.valueOf(d))) contiguous = false;   // disc block reappeared
                seen.add(Integer.valueOf(d));
            }
            prev = d;
        }
        // The artist's "Show all songs" rides this very adapter, and a disc number there names a
        // record the list is not showing -- exactly the reason track numbers are kept out of it.
        // One artist's songs can easily share one album name, and then everything below would
        // otherwise hold: dividers, the pinned bar, per-disc numbering.
        //
        // It is passed IN rather than read from Albums here, because the two screens keep the
        // answer in different places and this class serves both: Albums notes it per list built,
        // Genres expresses it by not registering its adapters at all. Reading Albums' flag while
        // computing for a Genres list would hand that list whatever the Albums screen was showing
        // last, which is a stale answer nothing on screen would explain.
        if (flat) single = false;

        enabled = single && contiguous && allPos;
        // a lone "CD 1", or a lone "Side A", says nothing the album's name does not -> no bar
        if (enabled && seen.size() == 1 && (discs[0] < 2 || discs[0] == SIDE_BASE + 1)) enabled = false;

        int gs = 0;
        for (int i = 0; i < n; i++) {
            if (i == 0 || discs[i] != discs[i - 1]) gs = i;
            groupStart[i] = gs;
        }

        singleAlbum = single;
        tagNums = tracks(songs);
    }

    // ------------------------------------------------------------- the TRACK NUMBER tag

    /** "Show the track number from the tag" — off by default, so nothing here runs unasked. */
    private static boolean tagsWanted() {
        Context c = Y1Application.Companion.getAppContext();
        return Prefs.on(c, "track_numbers");
    }

    /**
     * The TRACK NUMBER of every row, or null to number the rows the way this list always
     * has (position within its disc).
     *
     * A song without the tag shows "#", and does not take the numbers away
     * from the rest of the list. Both halves of that matter, and both come from the device: a
     * folder that holds an album together with loose tracks that are deliberately untagged (they
     * are not off any record) gives that album a few songs with no number — and numbering those
     * few by their position would mix two meanings in one column ("1, 2, 7, 4"), while letting
     * them veto the column put a fully tagged album back on row numbers because of songs that
     * were never part of it. "#" says what is true: this song has no track number.
     *
     * A list where NOT ONE song carries the tag is not an album being numbered at all, so it
     * keeps the row numbers it always had.
     *
     * Only a real album (every row the same album name): the artist's "Show all songs" rides the
     * very same adapter, and there a track number is a number out of a record the list is not
     * showing.
     *
     * The numbers come out of {@link TrackCache}, which is a plain map lookup — nothing is read
     * from a file on this path. Its cache file is read by {@code TrackCache.warmIfWanted}, called
     * from {@code AlbumsActivity.initView}, i.e. before this list can exist; what is missing from
     * it after that is read once, by {@link #warm}, off the drawing thread.
     */
    private static int[] tracks(List songs) {
        if (!singleAlbum || !tagsWanted()) return null;
        int n = songs.size();
        if (n == 0) return null;
        DiscCache.warm();
        int[] out = new int[n];
        ArrayList missing = null;
        for (int i = 0; i < n; i++) {
            String p = path(songs.get(i));
            int t = TrackCache.get(p);
            if (t > 0 && t != Integer.MAX_VALUE) { out[i] = t; continue; }
            out[i] = 0;
            // MAX_VALUE is "no number", and it is also what an unread file answers — the two are
            // told apart by DiscCache, which is written from the same read (DiscCache.commit).
            if (!DiscCache.known(p)) {
                if (missing == null) missing = new ArrayList();
                missing.add(p);
            }
        }
        if (missing != null) { warm(missing); return null; }
        for (int i = 0; i < n; i++) if (out[i] != 0) return out;
        return null;   // not one tagged song: this list is not numbered by tags
    }

    /**
     * Read the missing TRACK NUMBER tags of the list that has just been built, once, in the
     * background — one file open per song, and the answer is kept for good (ipp_tracks.txt /
     * ipp_discs.txt), so this is paid once per album ever, not once per visit.
     *
     * Reading is on the worker ({@code DiscCache.read} writes nothing anywhere); the caches are
     * written back on the main thread, which is the only thread that reads them while a list is on
     * screen. Then every live list is repainted; if the user has moved on by then, {@link #ensure}
     * recomputes for whatever list replaced this one.
     */
    private static void warm(final List paths) {
        if (sig == null || sig.equals(warmSig)) return;
        warmSig = sig;
        new Thread(new Warm(paths)).start();
    }

    /** Named, not anonymous: d8 8.2.2-dev crashes dexing an anonymous inner class here. */
    private static final class Warm implements Runnable {
        private final List paths;
        Warm(List paths) { this.paths = paths; }

        public void run() {
            final ArrayList tags = new ArrayList();
            for (int i = 0; i < paths.size(); i++) {
                tags.add(DiscCache.read((String) paths.get(i), true, false));
            }
            new Handler(Looper.getMainLooper()).post(new Commit(paths, tags));
        }
    }

    private static final class Commit implements Runnable {
        private final List paths;
        private final List tags;
        Commit(List paths, List tags) { this.paths = paths; this.tags = tags; }

        public void run() {
            for (int i = 0; i < paths.size(); i++) {
                DiscCache.commit((String) paths.get(i), (DiscCache.Tags) tags.get(i));
            }
            DiscCache.flush();
            sig = null;          // the numbers changed under the current list -- recompute it
            Lists.refresh();
        }
    }

    /** 1-based track number, restarting per disc; unchanged (pos+1) for non-album lists. */
    public static int number(List songs, int pos, Object adapter) {
        if (!discList(adapter)) return pos + 1;
        ensure(songs, flatOf(adapter));
        if (pos < 0) return pos + 1;
        if (tagNums != null && pos < tagNums.length) return tagNums[pos];
        if (!enabled || pos >= groupStart.length) return pos + 1;
        return pos - groupStart[pos] + 1;
    }

    /**
     * Row index text: the per-disc track number, and nothing else. The playing marker is an icon in
     * a view of its own, applied at the END of getView (see {@link Rows#songMark}), because its
     * tint has to be read from a colour that has already been set.
     */
    public static String rowIndex(Song song, List songs, int pos, Object adapter) {
        int n = number(songs, pos, adapter);
        // 0 means "this song carries no track number": "#" rather than a made-up number.
        // Only the cell is written -- the song still sorts by the MAX_VALUE TrackCache answers
        // for it, i.e. "sort by track number" keeps every one of them at the end of the list.
        return n <= 0 ? "#" : String.valueOf(n);
    }

    // ------------------------------------------------ how wide the number column has to be

    private static String wideSig;
    private static int wideDigits = 1;

    /**
     * How many characters the LONGEST number this list will show takes — what the number column
     * has to be wide enough for ({@link Rows#indexWidth}). Asked of this class rather than of the
     * list's size, because the column does not always show the row's position: tags can hold a
     * "101" in a 12-track album, and a multi-disc album restarts at 1 on every disc.
     *
     * Cached on the signature {@link #ensure} recomputes on, so the tag warm-up clearing
     * {@code sig} widens the column once the numbers it is sized for arrive.
     */
    public static int widestIndex(List songs, Object adapter) {
        if (songs == null) return 1;
        int n = songs.size();
        if (!discList(adapter)) return digits(n);
        ensure(songs, flatOf(adapter));
        if (sig != null && sig.equals(wideSig)) return wideDigits;
        wideSig = sig;
        wideDigits = widest(n);
        return wideDigits;
    }

    /** The three ways {@link #number} can answer, in its own order. */
    private static int widest(int n) {
        int max = 1;
        if (tagNums != null) {
            for (int i = 0; i < tagNums.length; i++) {
                int d = tagNums[i] <= 0 ? 1 : digits(tagNums[i]);   // 0 is "#"
                if (d > max) max = d;
            }
            return max;
        }
        if (!enabled || groupStart == null || groupStart.length < n) return digits(n);
        for (int i = 0; i < n; i++) {
            int d = digits(i - groupStart[i] + 1);
            if (d > max) max = d;
        }
        return max;
    }

    private static int digits(int v) {
        int d = 1;
        while (v >= 10) { v /= 10; d++; }
        return d;
    }

    // ------------------------------------------------------------------- discs and record sides

    /**
     * A side of a record is stored as a disc number of {@code SIDE_BASE + n} (A = 1), by
     * {@code DiscCache.commit} when the TRACK NUMBER tag is written the vinyl way ("A1", "B3")
     * and the file carries no DISC tag of its own.
     *
     * Everything a disc gets, a side then gets for free — the strip in the row, the pinned bar,
     * disc-first ordering in {@code Albums.songs}, the per-side restart of the row numbering and
     * the pixel scrolling of a list with unequal rows. The offset keeps sides above every real
     * disc number, so the plain {@code int} ordering those all rest on stays right, and makes the
     * two distinguishable, which is all {@link #discLabel} needs.
     */
    static final int SIDE_BASE = 1000;

    /** "CD 2" or "Side B" — the only place that tells the two apart. */
    private static String discLabel(int d) {
        if (d < SIDE_BASE) return "CD " + d;
        int i = d - SIDE_BASE;
        return i >= 1 && i <= 26 ? "Side " + (char) ('A' + i - 1) : "Side " + i;
    }

    // ------------------------------------------------------------------ the strip inside the row

    /**
     * The disc strip of one row: shown, with "CD N", only on the first row of each disc, and GONE
     * everywhere else — it must not take space on rows that have nothing to say.
     *
     * That makes the rows of a multi-disc album unequal in height, which stock's row-count
     * scrolling cannot land on precisely; {@link #variableRows} tells {@code Wheel.list} to scroll
     * this one list by pixels instead. Nothing else in the app is affected.
     *
     * Row 0 carries no label: the pinned bar shows the first disc from the moment the album opens,
     * and the two together would read as a duplicate.
     */
    public static void bind(View row, List songs, int pos, Object adapter) {
        if (row == null) return;
        View hv = row.findViewById(R.id.tv_disc_header);
        if (!(hv instanceof TextView)) return;
        TextView tv = (TextView) hv;
        if (!discList(adapter)) { hide(tv); return; }
        ensure(songs, flatOf(adapter));
        if (!enabled || discs == null || pos < 0 || pos >= discs.length) { hide(tv); return; }

        if (!(pos > 0 && groupStart[pos] == pos)) { hide(tv); return; }

        String label = discLabel(discs[pos]);
        // The strip cannot be focused — the row's highlight is inset past it (Rows.flat) — so its
        // look never depends on the row's state and only has to be set when the label itself
        // changes. Without this check the wheel's two-row repaint redid a ThemeManager colour, a
        // ThemeManager background and a drawable wrap on every click.
        if (label.equals(tv.getTag()) && tv.getVisibility() == View.VISIBLE) return;
        tv.setTag(label);
        tv.setText(label);
        ThemeManager.INSTANCE.itemSetTextColor(
                tv, row.getResources().getColor(R.color.selected_text_color), false);
        tv.setVisibility(View.VISIBLE);
        // With the highlight inset past it, an unpainted strip shows whatever is behind the list —
        // on a theme that paints its rows (Win98 Refix: itemBackground = 0.png) that is the
        // wallpaper, i.e. a coloured band across the row. It is part of the list, so it takes the
        // list's own unselected row background; Rows.noSize keeps that bitmap's intrinsic 640x91
        // from setting the strip's height.
        ThemeManager.INSTANCE.itemSetBackground(tv, R.drawable.item_no_selected, false);
        Rows.noSize(tv);
    }

    /**
     * True while the list this adapter shows has rows of UNEQUAL height — only a multi-disc
     * album's song list, where the first row of each disc carries the disc strip.
     * {@code Wheel.list} scrolls such a list by pixels instead of by whole rows.
     */
    public static boolean variableRows(Object adapter) {
        return discList(adapter) && enabled;
    }

    /** True for a row that carries a disc strip, and is therefore taller than the rest. */
    public static boolean startsDisc(int pos) {
        return enabled && groupStart != null && pos > 0 && pos < groupStart.length
                && groupStart[pos] == pos;
    }

    /**
     * Height of the disc strip in pixels, read off any row of the list. The strip has a fixed
     * layout height, so this is exact and needs no measuring — which is what lets
     * {@code Wheel.list} work out the height of a row that is still off screen.
     */
    public static int stripPx(View row) {
        if (row == null) return 0;
        View hv = row.findViewById(R.id.tv_disc_header);
        if (hv == null) return 0;
        ViewGroup.LayoutParams lp = hv.getLayoutParams();
        if (lp != null && lp.height > 0) return lp.height;
        if (!(hv instanceof TextView)) return 0;
        TextView tv = (TextView) hv;
        return tv.getLineHeight() + tv.getPaddingTop() + tv.getPaddingBottom();
    }

    private static void hide(TextView tv) {
        if (tv.getVisibility() == View.GONE && tv.getTag() == null) return;
        tv.setTag(null);
        tv.setVisibility(View.GONE);
        tv.setBackgroundDrawable(null);          // rows are recycled
    }

    // ------------------------------------------------------------------ the pinned bar

    private static WeakReference barLv;
    private static boolean posted;
    private static String shown;
    private static final Bar BAR = new Bar();

    /**
     * Called from {@code SongListAdapter.getView} for every row: keep the pinned bar in step with
     * the list. The {@code parent} argument IS the ListView (which is also how {@code Follow}
     * finds it), so the bar is reached with no per-Activity hook — and it has to come from there
     * rather than from {@code row.getParent()}, which is null on the list's very first fill,
     * where a freshly inflated row is not attached yet.
     *
     * Every path that moves the list (wheel, Alpha's jump, Follow, the first fill) rebinds rows,
     * so this is signal enough; the update is coalesced into one posted message, so a full
     * re-fill costs one, not eight.
     */
    public static void note(Object adapter, View parent) {
        if (!(parent instanceof ListView)) return;
        if (discList(adapter)) post((ListView) parent);
    }

    /**
     * Called from {@code AlbumListAdapter.getView}: the album list is shown in the very same
     * ListView as the songs, and it does not go through {@link #note} at all — without this the
     * bar would stay on screen, still naming the disc of the album that was open before.
     */
    public static void offBar(View parent) {
        if (!(parent instanceof ListView)) return;
        post((ListView) parent);
        // The status bar's icon has the same problem for the same reason: it steps aside for the
        // marker while an album is open, and leaving the album swaps the adapter of this very
        // ListView without binding another song row — so nothing re-asked the question and the icon
        // stayed hidden. This is the album list's counterpart of Follow.note's call. See Status.
        Status.check(parent);
    }

    /** Where {@link #BAR} is currently registered as a pre-draw listener, so it can be removed. */
    private static WeakReference preLv;

    /**
     * Update the bar once for this layout — from an {@code OnPreDrawListener}, not from a posted
     * message.
     *
     * A posted message runs a whole frame after the layout that asked for it, and in that frame the
     * old state is on screen: the row's strip has already been bound with "CD 2" while the bar
     * still says "CD 1". Crossing a disc boundary therefore drew one frame with BOTH labels before
     * the swap — at 30–60 ms a frame on this device that reads as a little animation. A pre-draw
     * listener runs after the layout and before the draw of the SAME traversal, so the bar and the
     * strip change together in one frame.
     *
     * Setting the text there costs nothing extra: both views have a fixed height and a non-wrapping
     * width, so {@code TextView.checkForRelayout} rebuilds the Layout and invalidates without
     * requesting one — no second traversal. It is registered per layout and removes itself, rather
     * than living on the tree, so nothing runs on frames that have no list movement in them.
     */
    private static void post(ListView lv) {
        barLv = new WeakReference(lv);
        if (posted) return;
        posted = true;
        ViewTreeObserver vto = lv.getViewTreeObserver();
        if (vto == null || !vto.isAlive()) {     // detached: nothing to draw into this frame
            lv.post(BAR);
            return;
        }
        preLv = new WeakReference(lv);
        vto.addOnPreDrawListener(BAR);
    }

    /**
     * The disc of the topmost visible row, or null when this list has no discs to show.
     *
     * No {@code ensure} here: {@link #rowIndex} runs for every row of the list with the list
     * itself, and this is a POSTED update, so by the time it runs the layout that triggered it
     * has already recomputed the disc layout for whatever the list holds now. (The adapter's own
     * list is not reachable from here anyway — {@code getMList()} is protected.)
     */
    private static String label(ListView lv) {
        ListAdapter la = lv.getAdapter();
        if (!discList(la)) return null;
        if (!enabled || discs == null) return null;
        // NOT getFirstVisiblePosition() — that is the first ATTACHED row, and since Head made the
        // list's padding the space the Shuffle row rides through (clipToPadding=false, rows are
        // laid out inside it), a row can be attached, positioned, and completely hidden behind the
        // bar. Naming ITS disc is what put "CD 1" over a screenful of CD 2: the last track of CD 1
        // had gone under the bar but was still child 0, so the bar went on calling itself CD 1 and
        // covered the "CD 2" strip that had arrived underneath it. Wheel.firstShown is the first
        // row with anything of it left on screen, which is the row the label is actually about.
        int first = lv.getFirstVisiblePosition();
        int pos = Wheel.firstShown(lv, first, Head.top(lv));
        if (pos < 0 || pos >= discs.length) return null;
        int d = discs[pos];
        // The first row of a disc still carries its own "CD N" inside the list, and while it is
        // fully on screen the bar goes on naming the disc ABOVE it — that is what "the label stays
        // at the top until you scroll back" looks like: the new one arrives from below, sits under
        // the bar for one step, and takes it over once its row has scrolled under the top edge.
        //
        // Handing over EARLIER — on the step that makes the new disc's first row the top one — was
        // tried and reverted. It does remove the moment when two CD labels stand one
        // above the other, but the strip is 16dip of the row's own height: a row placed against the
        // top edge then shows that space as a gap between the bar and its text, and since the row
        // below has no such space, crossing a disc boundary shifted the list by 16px. Every way of
        // closing that gap changes something the user wanted kept, so the one-step overlap stays.
        boolean taken = pos > 0 && groupStart[pos] == pos && under(lv, pos);
        if (pos > 0 && groupStart[pos] == pos && !taken) d = discs[pos - 1];
        handOver(lv, pos, taken);
        return discLabel(d);
    }

    /**
     * The row's own strip and the bar must never both be saying "CD N".
     *
     * The bar takes over as soon as the row's TOP crosses the bar's bottom — but the strip is
     * 16dip tall, so at that moment its lower part is still below the bar: measured on the device,
     * bar 45..61 against strip 50..66, i.e. five pixels of it, enough to show the bottoms of the
     * glyphs under a bar that has just started saying the same thing. Blank the text while the bar
     * has it.
     *
     * The view stays VISIBLE, and only the text goes: the row must keep its height (that height is
     * what {@code Wheel.list}'s pixel scrolling is computed from) AND its background — an INVISIBLE
     * view is measured but does not draw one, and on a theme that paints its rows that band would
     * show the wallpaper through it. The tag goes with the text because {@link #bind} early-outs on
     * it; clearing it is what lets the next bind put the label back. The restoring branch is a
     * safety net for the paths that move the list WITHOUT notifying the adapter (a deferred
     * {@code Head.place}), where no bind comes.
     */
    private static void handOver(ListView lv, int pos, boolean taken) {
        View c = lv.getChildAt(pos - lv.getFirstVisiblePosition());
        if (c == null) return;
        View h = c.findViewById(R.id.tv_disc_header);
        if (!(h instanceof TextView)) return;
        TextView tv = (TextView) h;
        if (taken) {
            if (tv.getText().length() == 0) return;
            tv.setText("");
            tv.setTag(null);
        } else if (pos > 0 && groupStart[pos] == pos && tv.getVisibility() == View.VISIBLE) {
            String label = discLabel(discs[pos]);
            if (label.contentEquals(tv.getText())) return;
            tv.setText(label);
            tv.setTag(label);
        }
    }

    /**
     * True once the row at {@code pos} (the topmost one with anything on screen) has started to
     * scroll under the top edge. Its own "CD N" strip sits in its top 16dip, so from that moment
     * the strip is behind the bar and the bar has to be the one saying it.
     *
     * {@code Head.top}, not {@code getPaddingTop()}: the padding is the space the Shuffle row rides
     * through, and once it has gone the list begins at the bar itself.
     */
    private static boolean under(ListView lv, int pos) {
        View c = lv.getChildAt(pos - lv.getFirstVisiblePosition());
        return c != null && c.getTop() < Head.top(lv);
    }

    static final class Bar implements ViewTreeObserver.OnPreDrawListener, Runnable {
        public boolean onPreDraw() {
            run();
            return true;                        // never hold the frame back
        }

        public void run() {
            posted = false;
            // Unregister from the view it was registered on, not from whatever barLv points at now:
            // a second list can have claimed barLv in between, and a listener left on the tree
            // would be added twice by the next post().
            Object p = preLv == null ? null : preLv.get();
            preLv = null;
            if (p instanceof View) {
                ViewTreeObserver vto = ((View) p).getViewTreeObserver();
                if (vto != null && vto.isAlive()) vto.removeOnPreDrawListener(this);
            }
            Object o = barLv == null ? null : barLv.get();
            if (o instanceof ListView) paint((ListView) o, label((ListView) o));
        }
    }

    /**
     * Put the bar in place synchronously, in the very call that hands the list its songs
     * ({@code SongListAdapter.setItems} inside AlbumsActivity's coroutine). The posted update is
     * one frame late, and since the bar takes layout space that frame is a visible blink with the
     * list jumping down under it.
     */
    /**
     * The same, for the Genres screen, which hands the bar its ListView instead of relying on the
     * one the last bound row came from. That screen can arrive at a song list without an album list
     * having been drawn first — the queue's "open source" builds the song level straight away — and
     * then nothing has yet said which ListView the bar lives in.
     */
    public static void preset(Object adapter, List songs, ListView lv) {
        if (lv != null && discList(adapter)) barLv = new WeakReference(lv);
        preset(adapter, songs);
    }

    public static void preset(Object adapter, List songs) {
        if (!discList(adapter)) return;
        // setItems IS the "this is a different list now" signal, and it is the only reliable one.
        // ensure()'s signature is count + first and last path, which cannot tell an album from the
        // artist's "Show all songs" when the two hold the same songs in the same order — one
        // artist with one record is exactly that case. The answer computed for the flat list was
        // then kept for the album, i.e. the album silently lost its dividers until something
        // re-queried it (changing the sort was what brought them back).
        sig = null;
        ensure(songs, flatOf(adapter));
        Object o = barLv == null ? null : barLv.get();
        if (!(o instanceof ListView)) return;
        // a fresh list is parked on row 0, so the bar names the first disc
        paint((ListView) o, enabled && discs != null && discs.length > 0 ? discLabel(discs[0]) : null);
    }

    /** Same, the other way: drop the bar before the album list is put back on screen. */
    public static void offBarNow() {
        Object o = barLv == null ? null : barLv.get();
        if (o instanceof ListView) paint((ListView) o, null);
    }

    private static void paint(ListView lv, String label) {
        try {
            Object parent = lv.getParent();
            if (!(parent instanceof View)) return;
            View v = ((View) parent).findViewById(R.id.ipp_disc_bar);
            if (!(v instanceof TextView)) return;
            TextView tv = (TextView) v;

            if (label == null) {
                shown = null;
                if (tv.getVisibility() != View.GONE) tv.setVisibility(View.GONE);
                return;
            }
            if (label.equals(shown) && tv.getVisibility() == View.VISIBLE) return;
            shown = label;
            tv.setText(label);
            // The bar sits above the list, over the window background, so it takes the list's own
            // row background from the theme — otherwise a theme that paints its rows (Win98 Refix:
            // itemBackground = 0.png) leaves the wallpaper showing through it as a coloured band.
            // Rows.noSize keeps that bitmap's intrinsic 640x91 from setting the bar's height. On
            // the stock themes itemBackground is empty and the bar stays transparent, which is
            // right there — their rows are transparent too.
            ThemeManager.INSTANCE.itemSetTextColor(
                    tv, tv.getResources().getColor(R.color.selected_text_color), false);
            ThemeManager.INSTANCE.itemSetBackground(tv, R.drawable.item_no_selected, false);
            Rows.noSize(tv);
            // Since the Shuffle row rides with the list (Head), this bar is the only thing left
            // pinned — and rows now pass UNDER it, which a transparent bar cannot survive: on the
            // stock themes item_no_selected is literally a transparent shape, so the text of the
            // rows sliding past would be read straight through the label. The wallpaper goes
            // behind it, under whatever the theme put there.
            Head.backdrop(tv);
            tv.setVisibility(View.VISIBLE);
        } catch (Throwable t) {
            // a bar that cannot be painted must never take the list down
        }
    }

    // The Shuffle row is 49 on every screen — exactly one list row — and it rides away with the list
    // (Head) rather than being pinned, so nothing here adjusts its height. Sizing it to make the
    // screen come to exactly 360 is deliberately NOT done: a screen that ends flush on a row
    // boundary gives no sign that the list goes on.
}
