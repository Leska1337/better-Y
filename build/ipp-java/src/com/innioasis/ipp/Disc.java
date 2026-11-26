package com.innioasis.ipp;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
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
 * Multi-disc albums: a strip on the first row of each disc, a bar PINNED under the Shuffle row
 * naming the disc of the topmost row, and per-disc numbering. Only for the adapter INSTANCES the
 * Albums and Genres screens register — a playlist holding the same songs looks identical — and only
 * for one album contiguous by disc. A lone disc 1 shows nothing.
 */
public final class Disc {

    private static WeakReference albumAdapter;   // AlbumsActivity's song adapter

    public static void setAlbumAdapter(Object adapter) {
        albumAdapter = adapter == null ? null : new WeakReference(adapter);
    }

    private static boolean isAlbumAdapter(Object adapter) {
        return adapter != null && albumAdapter != null && albumAdapter.get() == adapter;
    }

    /**
     * The two song adapters of {@code GenresActivity}, registered only while the list is a REAL
     * album — so registration itself answers "not flat". Not decided by "one album name on every
     * row": a genre holding one album gives a flat list that looks the same.
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

    /** A song list that may show a RECORD — the one question everything here asks. */
    public static boolean discList(Object adapter) {
        return isAlbumAdapter(adapter) || isGenreAdapter(adapter);
    }

    /** A flat "everything at once" list; a registered Genres adapter never is. */
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
        // BEFORE computing: the tag warm-up needs this list's signature
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
        // A flat list's songs can share one album name and still not be a record. Passed IN:
        // reading Albums' flag for a Genres list would be stale.
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

    /** "Show the track number from the tag". */
    private static boolean tagsWanted() {
        Context c = Y1Application.Companion.getAppContext();
        return Prefs.on(c, "track_numbers");
    }

    /**
     * The TRACK NUMBER of every row of a real album, or null for row numbers. An untagged song
     * shows "#" and does not take the numbers from the rest; a list with no tagged song at all keeps
     * row numbers. A map lookup only — what is missing is read once by {@link #warm}.
     */
    private static int[] tracks(List songs) {
        if (!singleAlbum || !tagsWanted()) return null;
        int n = songs.size();
        if (n == 0) return null;
        int[] out = new int[n];
        ArrayList missing = null;
        for (int i = 0; i < n; i++) {
            String p = path(songs.get(i));
            int t = TrackCache.get(p);
            if (t > 0 && t != Integer.MAX_VALUE) { out[i] = t; continue; }
            out[i] = 0;
            // MAX_VALUE is both "no number" and "unread"; DiscCache tells them apart
            if (!DiscCache.known(p)) {
                if (missing == null) missing = new ArrayList();
                missing.add(p);
            }
        }
        if (missing != null) { warm(missing); return null; }
        for (int i = 0; i < n; i++) if (out[i] != 0) return out;
        return null;
    }

    /**
     * Read the list's missing tags once, kept for good. Read on a worker, committed on the main
     * thread — the only one that reads the caches while a list is on screen.
     */
    private static void warm(final List paths) {
        if (sig == null || sig.equals(warmSig)) return;
        warmSig = sig;
        new Thread(new Warm(paths)).start();
    }

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
            sig = null;
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

    /** The row's number text; the playing marker is a view of its own ({@link Rows#songMark}). */
    public static String rowIndex(Song song, List songs, int pos, Object adapter) {
        int n = number(songs, pos, adapter);
        return n <= 0 ? "#" : String.valueOf(n);
    }

    private static String wideSig;
    private static int wideDigits = 1;

    /**
     * Characters in the LONGEST number this list shows ({@link Rows#indexWidth}) — not the list's
     * size: tags and per-disc restarts break that.
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

    /**
     * A record side ("A1" track tags, no DISC tag) is the disc {@code SIDE_BASE + n}, A = 1: it
     * gets everything a disc does, and stays above every real disc number.
     */
    static final int SIDE_BASE = 1000;

    /** Cover Flow: the disc of every row by {@link #compute}'s rule, else null. No shared state. */
    public static int[] albumDiscs(List songs) {
        int n = songs == null ? 0 : songs.size();
        if (n == 0) return null;
        int[] d = new int[n];
        HashSet seen = new HashSet();
        int prev = -1;
        for (int i = 0; i < n; i++) {
            d[i] = Albums.discOf(path(songs.get(i)));
            if (d[i] <= 0) return null;
            if (d[i] != prev && !seen.add(Integer.valueOf(d[i]))) return null;
            prev = d[i];
        }
        if (seen.size() == 1 && (d[0] < 2 || d[0] == SIDE_BASE + 1)) return null;
        return d;
    }

    /** "Track numbers from metadata inside albums". */
    public static boolean trackTags() {
        return tagsWanted();
    }

    public static String label(int d) {
        return discLabel(d);
    }

    /** "CD 2" or "Side B". */
    private static String discLabel(int d) {
        if (d < SIDE_BASE) return "CD " + d;
        int i = d - SIDE_BASE;
        return i >= 1 && i <= 26 ? "Side " + (char) ('A' + i - 1) : "Side " + i;
    }

    /** The strip on the first row of each disc, GONE elsewhere. Row 0 has none: the bar says it. */
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
        // The strip's look never depends on focus: set it only when the label changes, not on
        // every wheel click.
        if (label.equals(tv.getTag()) && tv.getVisibility() == View.VISIBLE) return;
        tv.setTag(label);
        tv.setText(label);
        ThemeManager.INSTANCE.itemSetTextColor(
                tv, row.getResources().getColor(R.color.selected_text_color), false);
        stripColor = tv.getCurrentTextColor();
        tv.setVisibility(View.VISIBLE);
        // the list's unselected row background, or a theme that paints its rows shows wallpaper;
        // noSize keeps that bitmap from setting the strip's height
        ThemeManager.INSTANCE.itemSetBackground(tv, R.drawable.item_no_selected, false);
        Rows.noSize(tv);
    }

    /** The theme's colour of a disc label, as the strip and the plate are given it; 0 = none yet. */
    private static int stripColor;

    static int stripColor() {
        return stripColor;
    }

    /** The strip's fixed layout height: exact for a row still off screen. */
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

    private static WeakReference barLv;
    private static boolean posted;
    private static String shown;
    private static final Bar BAR = new Bar();

    /**
     * {@code SongListAdapter.getView}, every row: keep the bar in step. {@code parent}, not
     * {@code row.getParent()} — null on the first fill. Coalesced into one update.
     */
    public static void note(Object adapter, View parent) {
        if (!Lv.is(parent)) return;
        if (discList(adapter)) post(parent);
    }

    /**
     * {@code AlbumListAdapter.getView}: the album list shares the songs' list, so without this
     * the bar would keep naming the last album's disc.
     */
    public static void offBar(View parent) {
        if (!Lv.is(parent)) return;
        post(parent);
        // the status icon too: leaving an album binds no song row (see Status)
        Status.check(parent);
    }

    private static WeakReference preLv;

    /**
     * Update the bar from a one-shot pre-draw listener, not a posted message: posted, it lands a
     * frame late and the bar and the strip show the same label for a frame.
     */
    private static void post(View lv) {
        barLv = new WeakReference(lv);
        if (posted) return;
        posted = true;
        ViewTreeObserver vto = lv.getViewTreeObserver();
        if (vto == null || !vto.isAlive()) {
            lv.post(BAR);
            return;
        }
        preLv = new WeakReference(lv);
        vto.addOnPreDrawListener(BAR);
    }

    /**
     * The disc of the topmost row, or null. No {@code ensure}: the layout that triggered this has
     * already recomputed for the current list.
     */
    private static String label(View lv) {
        Object la = Lv.model(lv);
        if (!discList(la)) return null;
        if (!enabled || discs == null) return null;
        // NOT getFirstVisiblePosition(): an attached row can be wholly hidden behind the bar.
        int pos = Lv.firstShown(lv, Lv.top(lv));
        if (pos < 0 || pos >= discs.length) return null;
        int d = discs[pos];
        // The bar keeps naming the disc ABOVE until the new disc's first row scrolls under the top
        // edge. Handing over earlier shifts the list by the strip's 16px at every boundary — the
        // one-step overlap is the chosen trade.
        boolean taken = pos > 0 && groupStart[pos] == pos && under(lv, pos);
        if (pos > 0 && groupStart[pos] == pos && !taken) d = discs[pos - 1];
        handOver(lv, pos, taken);
        return discLabel(d);
    }

    /**
     * Blank the strip's text while the bar says the same — its lower pixels still peek out below
     * the bar. Only the text: the view keeps its height and background. The tag goes too, so the
     * next {@link #bind} restores it; the restoring branch covers moves that bind nothing.
     */
    private static void handOver(View lv, int pos, boolean taken) {
        View c = Lv.row(lv, pos);
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

    /** The row at {@code pos} has started under the top edge ({@code Head.top}, not the padding). */
    private static boolean under(View lv, int pos) {
        View c = Lv.row(lv, pos);
        return c != null && c.getTop() < Lv.top(lv);
    }

    static final class Bar implements ViewTreeObserver.OnPreDrawListener, Runnable {
        public boolean onPreDraw() {
            run();
            return true;                        // never hold the frame back
        }

        public void run() {
            posted = false;
            // from the view it was registered on: barLv may point at another list by now
            Object p = preLv == null ? null : preLv.get();
            preLv = null;
            if (p instanceof View) {
                ViewTreeObserver vto = ((View) p).getViewTreeObserver();
                if (vto != null && vto.isAlive()) vto.removeOnPreDrawListener(this);
            }
            Object o = barLv == null ? null : barLv.get();
            if (o instanceof View) paint((View) o, label((View) o));
        }
    }

    /**
     * Genres: hands the bar its list — reached via "open source", no row has been bound to
     * say which list that is.
     */
    public static void preset(Object adapter, List songs, View lv) {
        if (lv != null && discList(adapter)) barLv = new WeakReference(lv);
        preset(adapter, songs);
    }

    /**
     * The bar put in place synchronously from {@code setItems}: the posted update is a frame late,
     * and the list jumps down under it.
     */
    public static void preset(Object adapter, List songs) {
        if (!discList(adapter)) return;
        // setItems is the only reliable "different list" signal: the signature cannot tell an
        // album from "Show all songs" holding the same songs
        sig = null;
        ensure(songs, flatOf(adapter));
        Object o = barLv == null ? null : barLv.get();
        if (!(o instanceof View)) return;
        // a fresh list is parked on row 0
        paint((View) o, enabled && discs != null && discs.length > 0 ? discLabel(discs[0]) : null);
    }

    /** Drop the bar before the album list is put back on screen. */
    public static void offBarNow() {
        Object o = barLv == null ? null : barLv.get();
        if (o instanceof View) paint((View) o, null);
    }

    /** The bar's left padding as the layout has it, read before any background replaces it. */
    private static int barLeft = -1;

    private static void paint(View lv, String label) {
        try {
            Object parent = lv.getParent();
            if (!(parent instanceof View)) return;
            View v = ((View) parent).findViewById(R.id.ipp_disc_bar);
            if (!(v instanceof TextView)) return;
            TextView tv = (TextView) v;

            if (label == null) {
                shown = null;
                if (tv.getVisibility() != View.GONE) {
                    tv.setVisibility(View.GONE);
                    SongRows.plateChanged(lv);
                }
                return;
            }
            if (label.equals(shown) && tv.getVisibility() == View.VISIBLE) return;
            shown = label;
            tv.setText(label);
            if (barLeft < 0) barLeft = tv.getPaddingLeft();
            int left = barLeft;
            // the theme's row background, as the strip has
            ThemeManager.INSTANCE.itemSetTextColor(
                    tv, tv.getResources().getColor(R.color.selected_text_color), false);
            stripColor = tv.getCurrentTextColor();
            ThemeManager.INSTANCE.itemSetBackground(tv, R.drawable.item_no_selected, false);
            Rows.noSize(tv);
            // rows pass UNDER the bar, so it must be opaque: the wallpaper behind it
            Head.backdrop(tv);
            // a layered background brings a padding of its own, zero, and takes the layout's
            tv.setPadding(left, tv.getPaddingTop(), tv.getPaddingRight(), tv.getPaddingBottom());
            if (tv.getVisibility() != View.VISIBLE) {
                tv.setVisibility(View.VISIBLE);
                SongRows.plateChanged(lv);
            }
        } catch (Throwable t) {
        }
    }
}
