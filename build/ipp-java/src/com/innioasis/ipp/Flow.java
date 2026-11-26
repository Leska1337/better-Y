package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.os.Handler;
import android.os.SystemClock;
import android.view.Choreographer;
import android.view.View;
import android.view.ViewGroup;

import com.innioasis.music.objects.Constant;
import com.innioasis.music.util.Other;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.activity.IppFlowActivity;
import com.innioasis.y1.base.BasePlayerActivity;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.service.PlayerService;
import com.innioasis.y1.utils.SharedPreferencesUtils;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Locale;

/**
 * Cover Flow: its row in the Music menu, the album list behind it, the slides {@link FlowView}
 * draws and the flip into Now Playing.
 *
 * A slide is the cover and a small copy of its lower half, built off the main thread into a
 * bitmap of one fixed size; the reflection is that copy, turned and faded at draw time ({@link FlowView}).
 */
public final class Flow {

    /** Side of the centre cover in screen pixels, at rest. */
    public static final int S = 180;
    /** Reflection rows under the cover: half of it, as the player's own reflection, so the cover
     *  that moves between the two screens does not change length on arrival. */
    public static final int REFL = S / 2;
    /** The card's transparent frame left, right and on top: the filtering then softens the slanted edges. */
    public static final int PAD = 2;

    /**
     * Slides in RGB_565 would be half ARGB's weight, but with no alpha there is no soft frame, and
     * the slanted edges of the side slides come out as stair steps.
     */
    static final boolean OPAQUE = false;
    /**
     * The frame round the cover inside a slide, on all four sides: {@link #PAD} when it can be
     * transparent, none otherwise. The bottom one is what softens the seam with the reflection.
     */
    public static final int F = OPAQUE ? 0 : PAD;
    /** A slide's size: the cover and its frame, no reflection. */
    public static final int SW = S + 2 * F;
    public static final int SH = S + 2 * F;
    /**
     * The reflection's own small copy, under the cover in the slide bitmap: the player builds its
     * mirror at this size (150 across a 304 picture, 75 rows) and stretches it, and the picture
     * landing from Now Playing is that one shrunk to the slide — same softness, no change on landing.
     */
    public static final int MIR_W = 150;
    public static final int MIR_H = 75;
    /**
     * The mirror's rows in the slide bitmap, unturned: the row draws it upside down. Clear rows
     * between it and the cover's frame: a slanted slide is filtered across its bottom edge, and
     * mirror pixels right under the frame turn its soft edge into a stair.
     */
    public static final int MIR_GAP = 2;
    public static final Rect MIR = new Rect(0, SH + MIR_GAP, MIR_W, SH + MIR_GAP + MIR_H);

    /** The extra that tells the player it was opened by the first half of a flip. */
    public static final String EXTRA_FLIP = "ipp_flip";
    /**
     * The two halves of a turn: the cover's, short — it is small and only goes edge-on — and the
     * track list's, longer, since it travels the farthest and needs the frames. The half reaching
     * the edge speeds up into it and the other slows out of it, with curves whose speeds meet
     * there ({@link #CARD_EASE}); otherwise the turn leaps at the edge.
     */
    public static final int CARD_MS = 75;
    public static final int LIST_MS = 190;
    /** The list's curve factor; steeper puts more of its path into the first frames. */
    public static final float TURN_EASE = 1.73f;
    /** The cover's curve factor, from the list's: equal speed at the edge. */
    public static final float CARD_EASE = TURN_EASE * CARD_MS / LIST_MS;
    /** The list going edge-on, closed or on a track pressed: short, or the press reads as lag. */
    public static final int LEAVE_MS = 130;
    public static final float LEAVE_EASE = 1f;
    /** The cover's curve coming out of the closed list's edge: equal speed there. */
    public static final float BACK_EASE = LEAVE_EASE * CARD_MS / LEAVE_MS;

    /** Albums on screen at rest, the screen's own setting: an index into {@link #COUNTS}. */
    public static final String KEY_COUNT = "flow_count";
    public static final int[] COUNTS = { 3, 5, 7 };

    public static int count(Context c) {
        int i = Prefs.val(c, KEY_COUNT);
        return COUNTS[i >= 0 && i < COUNTS.length ? i : COUNTS.length - 1];
    }

    /** The row's order, the album menu's Sort by: one of A_Z..NEWEST. */
    public static final String KEY_SORT = "flow_sort";
    public static final int A_Z = 0, Z_A = 1, OLDEST = 2, NEWEST = 3;
    /** Albums of one artist together, artists A to Z, Sort by inside each; nothing marks the groups. */
    public static final String KEY_GROUP = "flow_group";
    /** Where the release year goes, under the cover and over the tracks alike: one of YEAR_*. */
    public static final String KEY_YEAR = "flow_year";
    public static final int YEAR_OFF = 0, YEAR_ARTIST = 1, YEAR_ALBUM = 2;
    /** What the row stands on when the screen opens: one of START_*. */
    public static final String KEY_START = "flow_start";
    public static final int START_LAST = 0, START_PLAYING = 1;

    public static int yearAt(Context c) {
        return Prefs.val(c, KEY_YEAR);
    }

    /** "Artist • 2017"; the artist alone when the year is off, elsewhere or unknown. */
    public static String artistLine(String artist, String year, int at) {
        if (at != YEAR_ARTIST || year == null || year.length() == 0) return artist;
        return artist == null || artist.length() == 0 ? year : artist + " • " + year;
    }

    /** "Album (2017)"; the name alone when the year is off, elsewhere or unknown. */
    public static String albumLine(String name, String year, int at) {
        if (at != YEAR_ALBUM || year == null || year.length() == 0) return name;
        return name + " (" + year + ")";
    }

    private Flow() {}

    // ---- the Music menu ---------------------------------------------------------------------

    /** Injected after AlbumArtists.musicMenu in MusicMainActivity.initView. */
    public static void musicMenu(List list, Context c) {
        try {
            String label = c.getString(R.string.ipp_coverflow);
            if (!list.contains(label)) list.add(0, label);
        } catch (Throwable t) {
        }
    }

    // ---- albums -----------------------------------------------------------------------------

    /** One album of the flow. {@code artist} is filled in late when the tag has not been read. */
    public static final class Item {
        public final String key;
        public final String name;
        public final Song rep;
        public volatile String artist;
        /** "1997" or "2001 – 2004", "" when the tags have none, null while never read. */
        public volatile String year;
        /** What the row is ordered by. */
        final String sort;

        Item(String key, String name, Song rep) {
            this.key = key;
            String real = Albums.realName(key);
            this.sort = real == null ? "" : real.toLowerCase(Locale.ROOT);
            this.name = name;
            this.rep = rep;
            this.artist = artistOf(key, rep);
            this.year = yearOf(key, rep);
        }
    }

    /**
     * The song the album's cover is drawn from: the one pinned as its thumbnail (Art), else the
     * representative. The slide, its FlowCache file and the picture landing from the player all
     * ask this, so a pick made in Albums shows here and the other way round.
     */
    public static Song coverOf(Item it) {
        String p = Art.pickedPath(it.key);
        if (p == null || p.equals(it.rep.getPath())) return it.rep;
        Song s = new Song();
        s.setPath(p);
        return s;
    }

    /** The album's years, as the Albums screen shows them. */
    static String yearOf(String key, Song rep) {
        return YearCache.label(key);
    }

    /** Music → Album Artists' rule, over all the album's songs. */
    static String artistOf(String key, Song rep) {
        return Other.INSTANCE.unNamed(AlbumArtist.line(key, rep.getArtist()));
    }

    // The row, kept against the list object it was built from: a pass over a large library is
    // seconds, and between two entries only the album-artist lines can change.
    private static List rowFor;
    private static int rowGen;
    private static List row;

    /** Every album of the library, A to Z; unknown names sort last by their own prefix. Read only. */
    public static List albums() {
        long t0 = SystemClock.uptimeMillis();
        List all = Albums.allSongs();
        Diag.slow("flow songs", t0);
        int gen = AlbumArtist.gen();
        List kept = null;
        synchronized (Flow.class) {
            if (all != null && all == rowFor && row != null) {
                kept = row;
                if (gen == rowGen) gen = -1;
                else rowGen = gen;
            }
        }
        if (kept != null) {
            // the tag columns were written since: only the line under each cover can have changed
            if (gen != -1) {
                for (int i = 0; i < kept.size(); i++) {
                    Item it = (Item) kept.get(i);
                    it.artist = artistOf(it.key, it.rep);
                    it.year = yearOf(it.key, it.rep);
                }
            }
            return kept;
        }
        List built = build(all);
        synchronized (Flow.class) {
            if (all != null) {
                rowFor = all;
                rowGen = gen;
                row = built;
            }
        }
        return built;
    }

    private static List build(List all) {
        ArrayList out = new ArrayList();
        long t0 = SystemClock.uptimeMillis();
        if (all == null) return out;
        HashMap reps = new HashMap();
        // one key per album tag and folder, not per song: the songs of a folder share it
        HashMap keys = new HashMap();
        for (int i = 0; i < all.size(); i++) {
            Song s = (Song) all.get(i);
            if (s == null || s.getPath() == null) continue;
            String at = s.getAlbum() + '\n' + Albums.trackFolder(s.getPath());
            String k = (String) keys.get(at);
            if (k == null) {
                k = Albums.keyOf(s);
                keys.put(at, k);
            }
            Song r = (Song) reps.get(k);
            if (r == null || s.getPath().compareTo(r.getPath()) < 0) reps.put(k, s);
        }
        Object[] found = reps.keySet().toArray();
        for (int i = 0; i < found.length; i++) {
            String k = (String) found[i];
            out.add(new Item(k, Other.INSTANCE.unNamed(Albums.realName(k)), (Song) reps.get(k)));
        }
        Collections.sort(out, BY_NAME);
        Diag.slow("flow albums " + out.size(), t0);
        return out;
    }

    /**
     * The row in the order the screen's settings ask for: a copy, the kept row stays A to Z. Reads
     * the years, or the album artists when grouping, of albums never read — not on the UI thread.
     */
    public static List ordered(Context c, List row) {
        int sort = Prefs.val(c, KEY_SORT);
        boolean group = Prefs.val(c, KEY_GROUP) != 0;   // the window stores every row as a number
        if (row == null || row.isEmpty() || (sort == A_Z && !group)) return row;
        long t0 = SystemClock.uptimeMillis();
        ArrayList out = new ArrayList(row);
        if (sort == OLDEST || sort == NEWEST) {
            ArrayList keys = new ArrayList(out.size());
            for (int i = 0; i < out.size(); i++) keys.add(((Item) out.get(i)).key);
            YearCache.warm(keys);
        }
        HashMap groups = null;
        if (group) {
            groups = new HashMap();
            boolean read = false;
            for (int i = 0; i < out.size(); i++) {
                Item it = (Item) out.get(i);
                if (AlbumArtist.needsRead(it.key)) {
                    AlbumArtist.read(it.key, it.rep.getPath());
                    it.artist = artistOf(it.key, it.rep);
                    it.year = yearOf(it.key, it.rep);
                    read = true;
                }
                // as written, so an unknown artist keeps its sort-last prefix
                String g = AlbumArtist.line(it.key, it.rep.getArtist());
                groups.put(it, g == null ? "" : g.toLowerCase(Locale.ROOT));
            }
            if (read) AlbumArtist.flush();
        }
        Collections.sort(out, new Order(sort, groups));
        Diag.slow("flow order " + out.size(), t0);
        return out;
    }

    private static final class Order implements Comparator {
        private final int sort;
        private final HashMap groups;
        private final YearComparator years;

        Order(int sort, HashMap groups) {
            this.sort = sort;
            this.groups = groups;
            this.years = sort == OLDEST || sort == NEWEST ? new YearComparator(sort == NEWEST) : null;
        }

        public int compare(Object a, Object b) {
            Item x = (Item) a, y = (Item) b;
            int c;
            if (groups != null) {
                c = ((String) groups.get(x)).compareTo((String) groups.get(y));
                if (c != 0) return c;
            }
            if (years != null) {
                c = years.compare(x.key, y.key);
                if (c != 0) return c;
            }
            c = BY_NAME.compare(x, y);
            return sort == Z_A ? -c : c;
        }
    }

    private static final Comparator BY_NAME = new ByName();

    private static final class ByName implements Comparator {
        public int compare(Object a, Object b) {
            int c = ((Item) a).sort.compareTo(((Item) b).sort);
            return c != 0 ? c : ((Item) a).key.compareTo(((Item) b).key);
        }
    }

    /**
     * The back of the cover: the album's songs in disc and track order — the order the Albums
     * screen plays them in — numbered as that screen numbers them, with a divider row in front of
     * each disc or side where that screen shows one. No pinned bar here, so the first disc gets
     * its divider too.
     */
    public static final class Back {
        public List songs;
        /** Per row: the number column, or null on a divider. */
        public String[] nums;
        /** Per row: the track's title or the divider's label. */
        public String[] texts;
        /** Per row: the index into {@code songs}, or -1 on a divider. */
        public int[] song;
    }

    /** Off the main thread: reads the disc and track tags of every song not read yet. */
    public static Back back(Item it) {
        long t0 = SystemClock.uptimeMillis();
        List l = Albums.songsOf(it.key);
        int read = 0;
        for (int i = 0; i < l.size(); i++) {
            String p = ((Song) l.get(i)).getPath();
            if (p == null || DiscCache.known(p)) continue;
            DiscCache.commit(p, DiscCache.read(p, true, false));
            read++;
        }
        if (read > 0) DiscCache.flush();
        Diag.slow("flow back, " + read + " of " + l.size() + " read from the card", t0);
        List byTrack = TrackCache.sorted(l);
        List s = Albums.byDisc(byTrack != null ? byTrack : l);

        int n = s.size();
        int[] discs = Disc.albumDiscs(s);
        int[] tags = null;
        if (Disc.trackTags()) {
            tags = new int[n];
            boolean any = false;
            for (int i = 0; i < n; i++) {
                int t = TrackCache.get(((Song) s.get(i)).getPath());
                tags[i] = t > 0 && t != Integer.MAX_VALUE ? t : 0;
                if (tags[i] > 0) any = true;
            }
            if (!any) tags = null;   // not one tagged song: numbered by position, as on the Albums screen
        }
        ArrayList nums = new ArrayList();
        ArrayList texts = new ArrayList();
        ArrayList idx = new ArrayList();
        int start = 0;
        for (int i = 0; i < n; i++) {
            if (discs != null && (i == 0 || discs[i] != discs[i - 1])) {
                start = i;
                nums.add(null);
                texts.add(Disc.label(discs[i]));
                idx.add(Integer.valueOf(-1));
            }
            int num = tags != null ? tags[i] : i - start + 1;
            nums.add(num > 0 ? num + "." : "#");
            texts.add(title((Song) s.get(i)));
            idx.add(Integer.valueOf(i));
        }
        Back b = new Back();
        b.songs = s;
        b.nums = (String[]) nums.toArray(new String[nums.size()]);
        b.texts = (String[]) texts.toArray(new String[texts.size()]);
        b.song = new int[idx.size()];
        for (int i = 0; i < b.song.length; i++) b.song[i] = ((Integer) idx.get(i)).intValue();
        return b;
    }

    /**
     * A track as the back of the cover lists it: the title tag whatever "Song titles from
     * metadata" says — the file name only when there is no tag — and the hidden artists appended
     * as the player appends them.
     */
    public static String title(Song s) {
        String t = s.getSongName();
        if (t == null || t.trim().length() == 0 || Constant.UNKNOWN.equals(t)) {
            t = SharedPreferencesUtils.INSTANCE.processFileExtensions(s.getName() != null ? s.getName() : new File(s.getPath()).getName());
        } else {
            t = Other.INSTANCE.unNamed(t);
        }
        return Feat.title(t, s);
    }

    // ---- slides -----------------------------------------------------------------------------

    /** An empty slide, room for its mirror under it; its frame, never drawn into, stays transparent. */
    static Bitmap newSlide() {
        return Bitmap.createBitmap(SW, MIR.bottom,OPAQUE ? Bitmap.Config.RGB_565 : Bitmap.Config.ARGB_8888);
    }

    private static final Rect MIR_FROM = new Rect(F, F + S - REFL, F + S, F + S);

    /** The cover's lower half, without the frame, shrunk into its {@link #MIR} rows. */
    static void mirror(Canvas c, Bitmap s, Paint p) {
        c.setBitmap(s);
        c.drawBitmap(s, MIR_FROM, MIR, p);
    }

    /** Filtered, and over whatever a reused slide's mirror held: the frame columns are see-through. */
    static Paint mirrorPaint() {
        Paint p = new Paint(Paint.FILTER_BITMAP_FLAG);
        p.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.SRC));
        return p;
    }

    /** The card for an album without a cover: {@code ipp_flow_blank}, drawn at S whatever its size. */
    static Bitmap blank() {
        try {
            BitmapFactory.Options o = new BitmapFactory.Options();
            o.inScaled = false;
            Bitmap src = BitmapFactory.decodeResource(Y1Application.Companion.getAppContext().getResources(),
                    R.drawable.ipp_flow_blank, o);
            if (src != null) {
                Bitmap b = newSlide();
                Canvas c = new Canvas(b);
                c.drawBitmap(src, null, new Rect(F, F, F + S, F + S), new Paint(Paint.FILTER_BITMAP_FLAG));
                src.recycle();
                mirror(c, b, mirrorPaint());
                return b;
            }
        } catch (Throwable t) {
        }
        // PictureFlow's own grey card
        int[] px = new int[S * S];
        for (int y = 0; y < S; y++) {
            for (int x = 0; x < S; x++) {
                int g = 0x30 + (x + y) * 0x30 / (2 * S);
                if (x < 3 || y < 3 || x >= S - 3 || y >= S - 3) g = 0x60;
                px[y * S + x] = 0xFF000000 | (g << 16) | (g << 8) | g;
            }
        }
        Bitmap b = newSlide();
        b.setPixels(px, 0, S, F, F, S, S);
        mirror(new Canvas(), b, mirrorPaint());
        return b;
    }

    private static Bitmap fade;

    /**
     * The reflection's opacity at the cover's edge: the player's own (Cover.reflect), so the
     * picture landing from Now Playing turns into the slide without a change of light.
     */
    public static final int REFL_ALPHA = 0x70;

    /**
     * The reflection's fade as alpha, one column stretched across: {@link #REFL_ALPHA} at the
     * cover's edge to nothing. Drawn DST_IN over a reflection just drawn on ground the slide has cleared.
     */
    static Bitmap fade() {
        if (fade == null) {
            int[] px = new int[REFL];
            for (int r = 0; r < REFL; r++) px[r] = (REFL_ALPHA * (2 * r + 1) / (2 * REFL)) << 24;
            fade = Bitmap.createBitmap(px, 1, REFL, Bitmap.Config.ARGB_8888);
        }
        return fade;
    }

    /**
     * "Cache library": the slide straight from the picture's bytes the pass has just read, with no
     * second open and no read-back of the big cover's JPEG. False leaves it to {@link #cacheSlide}.
     */
    public static boolean slideFrom(String path, byte[] raw) {
        try {
            if (raw == null || raw.length == 0) return false;
            File f = FlowCache.file(path);
            if (f == null) return false;
            if (f.exists()) return true;
            BitmapFactory.Options o = new BitmapFactory.Options();
            o.inJustDecodeBounds = true;
            BitmapFactory.decodeByteArray(raw, 0, raw.length, o);
            if (o.outWidth <= 0 || o.outHeight <= 0) return false;
            o.inSampleSize = Art.sample(o.outWidth, o.outHeight, S, S);
            o.inJustDecodeBounds = false;
            Bitmap b = BitmapFactory.decodeByteArray(raw, 0, raw.length, o);
            if (b == null) return false;
            return FlowCache.write(path, Cover.square(b, S));
        } catch (Throwable t) {
            return false;
        }
    }

    /**
     * "Cache library": an album's Cover Flow cover, unless it is there already. False when it
     * should be there and is not — the pass then is not complete.
     */
    public static boolean cacheSlide(String path) {
        try {
            File f = FlowCache.file(path);
            if (f == null || f.exists()) return true;
            Bitmap src = BigCover.peekTrackFree(path);
            if (src == null) src = BigCover.trackFree(path);
            if (src == null) return BigCover.knownNone(path);
            return FlowCache.write(path, Cover.square(src, S));
        } catch (Throwable t) {
            return false;
        }
    }

    // ---- the loader -------------------------------------------------------------------------

    /**
     * Builds slides nearest the target first, on one thread, and keeps only a window around it: a
     * slide is ~130 KB and a library holds hundreds of albums. An album artist not read yet is
     * read on the way, and the row repainted.
     */
    public static final class Loader implements Runnable {
        public static final int AHEAD = 7;
        /**
         * Kept around the target. Wider than what is drawn (seven covers each side of pos, and pos trails the
         * target by up to a few slides on a fast spin), because what falls out is refilled for the
         * next slide in place: it must not be one the row still draws.
         */
        public static final int KEEP = 16;
        /** Every slide the window can hold, made before the first: none is allocated while the row moves. */
        private static final int SLIDES = 2 * KEEP + 2;

        private final List items;
        private final Runnable onSlide;
        private final Handler ui;
        public final Hashtable slides = new Hashtable();
        /** When each slide was put in, for the row to fade it in from there. */
        private final Hashtable born = new Hashtable();
        private volatile int target;
        private volatile boolean stop;
        // Diag.MEASURE: the slide being built and what it allocated, for FlowView's frame lines
        public volatile boolean busy;
        public volatile String how = "";
        public volatile String doneHow = "";
        public volatile long doneAt;
        private Bitmap blank;
        private boolean readArtist;
        private final Object wake = new Object();
        // Nothing of a slide's making is allocated per slide: the bitmaps come from the pool, the
        // decode lands in a reused buffer. A collector pause one allocation sets off stops the
        // whole app for 60-150 ms at this heap's size, a dropped frame the eye sees.
        private final ArrayList pool = new ArrayList();
        private Bitmap decoded;
        private final Canvas canvas = new Canvas();
        private final Paint filter = new Paint(Paint.FILTER_BITMAP_FLAG | Paint.DITHER_FLAG);
        private final Paint mirrorPaint = mirrorPaint();
        private final Rect from = new Rect();
        private final Rect to = new Rect(F, F, F + S, F + S);

        public Loader(List items, Handler ui, Runnable onSlide) {
            this.items = items;
            this.ui = ui;
            this.onSlide = onSlide;
        }

        public void aim(int t) {
            target = t;
            synchronized (wake) { wake.notifyAll(); }
        }

        public void quit() {
            stop = true;
            synchronized (wake) { wake.notifyAll(); }
        }

        private volatile boolean held;

        /**
         * Held while the screen animates: a slide's decode can still allocate (a cover not cached,
         * or of an odd size), and a collector pause stops the animation with every other thread.
         */
        public void hold(boolean on) {
            held = on;
            if (!on) synchronized (wake) { wake.notifyAll(); }
        }

        public Bitmap get(int i) {
            Object o = slides.get(Integer.valueOf(i));
            return o == null ? null : (Bitmap) o;
        }

        /** Ms since slide {@code i} was put in. */
        public long age(int i) {
            Object o = born.get(Integer.valueOf(i));
            return o == null ? Long.MAX_VALUE : SystemClock.uptimeMillis() - ((Long) o).longValue();
        }

        public void run() {
            try {
                synchronized (SPARE) {
                    while (!SPARE.isEmpty() && pool.size() < SLIDES) {
                        pool.add(SPARE.remove(SPARE.size() - 1));
                    }
                }
                if (pool.size() < SLIDES) room();
                // what the screen opens on first, at the screen's own priority; the rest of the
                // pool after it, still before the row can move
                int t = target;
                while (!stop && next(t, FIRST)) { }
                first = true;
                android.os.Process.setThreadPriority(android.os.Process.THREAD_PRIORITY_BACKGROUND);
                while (pool.size() + built() < SLIDES && !stop) pool.add(newSlide());
                loop();
            } finally {
                if (readArtist) AlbumArtist.flush();
                giveBack();
            }
        }

        /**
         * The pool outlives the screen. Made again on every entry it cost two collector pauses per
         * slide — about four seconds — whenever the heap had no free run a slide's size, and
         * letting go of a reserve block does not keep one: the next collection trims the heap
         * straight back. 34 slides, about 6.5 MB, held for the life of the process.
         */
        private static final ArrayList SPARE = new ArrayList();

        /** Slides either side of the target the screen waits for before it shows. */
        public static final int FIRST = 3;

        private volatile boolean first;

        /** The slides the screen opens on are built. */
        public boolean firstReady() {
            return first;
        }

        private int built() {
            int n = 0;
            Object[] vs = slides.values().toArray();
            for (int i = 0; i < vs.length; i++) if (vs[i] != blank) n++;
            return n;
        }

        private void giveBack() {
            synchronized (SPARE) {
                ArrayList all = new ArrayList(pool);
                Object[] vs = slides.values().toArray();
                for (int i = 0; i < vs.length; i++) if (vs[i] != blank) all.add(vs[i]);
                for (int i = 0; i < all.size() && SPARE.size() < SLIDES; i++) {
                    if (!SPARE.contains(all.get(i))) SPARE.add(all.get(i));
                }
            }
        }

        private static volatile byte[] reserve;

        /**
         * Before the pool is first made: one block taken and let go, so that the heap grows in one
         * step and the slides land in the room it leaves instead of growing it one slide at a time
         * with the whole app stopped for each.
         */
        private static void room() {
            try {
                reserve = new byte[8 << 20];
            } catch (Throwable t) {
            }
            reserve = null;
        }

        private void loop() {
            while (!stop) {
                if (held) {
                    synchronized (wake) {
                        while (held && !stop) {
                            try { wake.wait(); } catch (InterruptedException e) { return; }
                        }
                    }
                    continue;
                }
                int r = renewAt;
                if (r >= 0) {
                    renewAt = -1;
                    Object old = slides.get(Integer.valueOf(r));
                    if (old != null && r < items.size()) {
                        // built in place of the old one, which goes back to the pool once replaced
                        build(r);
                        if (old != blank && old != slides.get(Integer.valueOf(r))) pool.add(old);
                    }
                    continue;
                }
                int t = target;
                if (!next(t, AHEAD)) {
                    synchronized (wake) {
                        if (target == t && renewAt < 0 && !stop) {
                            try { wake.wait(); } catch (InterruptedException e) { return; }
                        }
                    }
                }
            }
        }

        /** The nearest slide within {@code reach} of {@code t} not yet built, built; false when there is none. */
        private boolean next(int t, int reach) {
            // every round, not only when idle: a long fast run would otherwise keep every slide passed
            evict(t);
            int want = -1;
            for (int d = 0; d <= reach && want < 0; d++) {
                if (has(t + d)) want = t + d;
                else if (has(t - d)) want = t - d;
            }
            if (want < 0) return false;
            Item it = (Item) items.get(want);
            if (AlbumArtist.needsRead(it.key) || it.year == null) {
                AlbumArtist.read(it.key, it.rep.getPath());
                it.artist = artistOf(it.key, it.rep);
                it.year = yearOf(it.key, it.rep);
                readArtist = true;
            }
            AlbumTags.shown(it.key);
            born.put(Integer.valueOf(want), Long.valueOf(SystemClock.uptimeMillis()));
            build(want);
            return true;
        }

        private void build(int at) {
            Item it = (Item) items.get(at);
            if (Diag.MEASURE) {
                how = pool.isEmpty() ? " new-slide" : "";
                busy = true;
            }
            Bitmap s = pool.isEmpty() ? newSlide() : (Bitmap) pool.remove(pool.size() - 1);
            if (cover(it, s)) {
                mirror(canvas, s, mirrorPaint);
            } else {
                pool.add(s);
                if (blank == null) blank = blank();
                s = blank;
            }
            slides.put(Integer.valueOf(at), s);
            if (Diag.MEASURE) {
                doneHow = how;
                doneAt = SystemClock.uptimeMillis();
                busy = false;
            }
            ui.post(onSlide);
        }

        private volatile int renewAt = -1;

        /** Slide {@code i} built again, with no fade-in: its album's cover was pinned or reset. */
        public void renew(int i) {
            renewAt = i;
            synchronized (wake) { wake.notifyAll(); }
        }

        private boolean has(int i) {
            return i >= 0 && i < items.size() && !slides.containsKey(Integer.valueOf(i));
        }

        private void evict(int t) {
            Object[] ks = slides.keySet().toArray();
            for (int i = 0; i < ks.length; i++) {
                int k = ((Integer) ks[i]).intValue();
                if (Math.abs(k - t) > KEEP) {
                    Object b = slides.remove(ks[i]);
                    born.remove(ks[i]);
                    if (b != null && b != blank) pool.add(b);
                }
            }
        }

        /**
         * The album's cover drawn into slide {@code s}; false when it has none. From Cover Flow's
         * own cache when it has the cover; otherwise from the big cover's JPEG, into one reused
         * buffer when the size allows; only a cover never cached goes through
         * {@code BigCover.trackFree}, which reads it and writes it down for good.
         */
        private boolean cover(Item it, Bitmap s) {
            try {
                String path = coverOf(it).getPath();
                File ff = FlowCache.file(path);
                if (ff != null && ff.exists()) {
                    Bitmap fb = decodeSlide(ff);
                    if (fb != null) {
                        canvas.setBitmap(s);
                        canvas.drawBitmap(fb, F, F, null);
                        return true;
                    }
                }
                if (Diag.MEASURE) how += " no-flow";
                if (!slideSize(path, s)) return false;
                // written from the slide itself: the next visit decodes it straight to size
                flowCanvas.drawBitmap(s, to, all, null);
                FlowCache.write(path, flowBuf);
                return true;
            } catch (Throwable t) {
                return false;
            }
        }

        // Cover Flow's own cache, read and written through one buffer of its size
        private final Bitmap flowBuf = Bitmap.createBitmap(S, S, Bitmap.Config.ARGB_8888);
        private final Canvas flowCanvas = new Canvas(flowBuf);
        private final Rect all = new Rect(0, 0, S, S);

        /** A FlowCache file into {@link #flowBuf}; null if it is not one. */
        private Bitmap decodeSlide(File f) {
            int n = read(f);
            if (n <= 0) return null;
            BitmapFactory.Options o = opts;
            o.inTempStorage = scratch;
            o.inSampleSize = 1;
            o.inBitmap = null;
            o.inJustDecodeBounds = true;
            BitmapFactory.decodeByteArray(file, 0, n, o);
            if (o.outWidth != S || o.outHeight != S) return null;
            o.inJustDecodeBounds = false;
            o.inMutable = true;
            o.inBitmap = flowBuf;
            try {
                return BitmapFactory.decodeByteArray(file, 0, n, o);
            } catch (IllegalArgumentException e) {
                return null;
            } finally {
                o.inBitmap = null;
            }
        }

        /** The cover scaled into slide {@code s} from the big cover; false when it has none. */
        private boolean slideSize(String path, Bitmap s) {
            try {
                Bitmap src = null;
                File f = BigCover.cachedFile(path);
                if (f != null) src = decode(f);
                if (src == null) {
                    if (Diag.MEASURE) how += " uncached";
                    src = BigCover.trackFree(path);
                }
                if (src == null) return false;
                int w = src.getWidth(), h = src.getHeight();
                if (Diag.MEASURE && (w != 300 || h != 300)) how += " " + w + "x" + h;
                int m = Math.min(w, h);
                canvas.setBitmap(s);
                if (m > 2 * S) {
                    // past 2x one bilinear pass skips pixels: Cover.square halves in steps
                    Bitmap sq = Cover.square(src, S);
                    canvas.drawBitmap(sq, F, F, filter);
                    return true;
                }
                from.set((w - m) / 2, (h - m) / 2, (w - m) / 2 + m, (h - m) / 2 + m);
                canvas.drawBitmap(src, from, to, filter);
                return true;
            } catch (Throwable t) {
                return false;
            }
        }

        // the file and the decoder's scratch, reused: a stream per decode is two buffers of garbage a slide
        private byte[] file = new byte[64 * 1024];
        private final byte[] scratch = new byte[16 * 1024];
        private final BitmapFactory.Options opts = new BitmapFactory.Options();

        /** The whole file in {@link #file}; its length, or 0. */
        private int read(File f) {
            java.io.FileInputStream in = null;
            try {
                long len = f.length();
                if (len <= 0 || len > 8 * 1024 * 1024) return 0;
                if (file.length < len) file = new byte[(int) len + 16 * 1024];
                in = new java.io.FileInputStream(f);
                int n = 0;
                while (n < len) {
                    int r = in.read(file, n, (int) len - n);
                    if (r < 0) break;
                    n += r;
                }
                return n;
            } catch (Throwable t) {
                return 0;
            } finally {
                try { if (in != null) in.close(); } catch (Throwable t) { }
            }
        }

        private Bitmap decode(File f) {
            int n = read(f);
            if (n <= 0) return null;
            BitmapFactory.Options o = opts;
            o.inTempStorage = scratch;
            o.inBitmap = null;
            o.inSampleSize = 1;
            o.inJustDecodeBounds = true;
            BitmapFactory.decodeByteArray(file, 0, n, o);
            if (o.outWidth <= 0 || o.outHeight <= 0) return null;
            o.inSampleSize = Art.sample(o.outWidth, o.outHeight, S, S);
            o.inJustDecodeBounds = false;
            o.inMutable = true;
            // API 17 reuses a buffer only of exactly the same size, at no sampling
            if (o.inSampleSize == 1 && decoded != null
                    && decoded.getWidth() == o.outWidth && decoded.getHeight() == o.outHeight) {
                o.inBitmap = decoded;
            }
            Bitmap b;
            try {
                b = BitmapFactory.decodeByteArray(file, 0, n, o);
            } catch (IllegalArgumentException e) {
                o.inBitmap = null;
                b = BitmapFactory.decodeByteArray(file, 0, n, o);
            }
            if (b != null && o.inSampleSize == 1) decoded = b;
            return b;
        }
    }

    // ---- into Now Playing and back ----------------------------------------------------------
    //
    // The cover travels between the two screens as the player's own picture: the very bitmap the
    // player builds (Cover.fitCover's framed cover under Cover.reflect's reflection) in a box the
    // size of the player's cover view, drawn FIT_START and turned about the same pivot. At the
    // player's end of the move it is therefore what the player draws, pixel for pixel, and the
    // player opens under it with no transition. Where that view stands is read off the player
    // each time it is left and kept, so the next opening lands where the last one was measured.

    /**
     * The player's cover view in window pixels: x, y, width, height, pivot x, pivot y, rotationY,
     * padding left, top, right, bottom. One per look: with the tilt off the box keeps its width and
     * narrows the picture by a right padding instead.
     */
    private static final String KEY_GEO = "flow_geo_";
    private static final int GEO_N = 11;
    private static float[] geoTilt;
    private static float[] geoFlat;

    private static final String EXTRA_BACK = "ipp_flip_back";

    /** Cover Flow is being returned to from a player it opened, and takes the cover back. */
    private static boolean returning;

    /** Cover Flow's onResume: true once, after a player it opened has been left by the top button. */
    public static boolean takeReturning() {
        boolean r = returning;
        returning = false;
        return r;
    }

    /** As last measured in the current look; before that, what the player was measured at. */
    public static float[] geo(Context c) {
        boolean flat = Cover.flatCover();
        float[] mem = flat ? geoFlat : geoTilt;
        if (mem != null) return mem;
        try {
            String s = Prefs.getString(c, KEY_GEO + (flat ? "flat" : "tilt"), null);
            if (s != null) {
                String[] p = s.split(",");
                if (p.length == GEO_N) {
                    float[] g = new float[GEO_N];
                    for (int i = 0; i < GEO_N; i++) g[i] = Float.parseFloat(p[i]);
                    if (flat) geoFlat = g;
                    else geoTilt = g;
                    return g;
                }
            }
        } catch (Throwable t) {
        }
        return flat ? new float[] { 10, 50, 230, 345, 115, 172.5f, 0, 0, 0, 15, 0 }
                : new float[] { 10, 50, 265, 398, 0, 398 / 3f, 20, 0, 0, 0, 0 };
    }

    private static void measure(Activity a) {
        View v = a.findViewById(R.id.cover_bg);
        if (v == null || v.getVisibility() != View.VISIBLE) v = a.findViewById(R.id.cover_bg2);
        if (v == null || v.getVisibility() != View.VISIBLE || v.getWidth() <= 0) return;
        // the untransformed box: the view's own matrix would move the corner it reports
        int[] at = new int[2];
        ((View) v.getParent()).getLocationInWindow(at);
        float[] g = { at[0] + v.getLeft(), at[1] + v.getTop(), v.getWidth(), v.getHeight(),
                v.getPivotX(), v.getPivotY(), v.getRotationY(),
                v.getPaddingLeft(), v.getPaddingTop(), v.getPaddingRight(), v.getPaddingBottom() };
        boolean flat = Cover.flatCover();
        if (flat) geoFlat = g;
        else geoTilt = g;
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < GEO_N; i++) {
            if (i > 0) sb.append(',');
            sb.append(g[i]);
        }
        Prefs.setString(a, KEY_GEO + (flat ? "flat" : "tilt"), sb.toString());
    }

    /**
     * The picture the player will show for this track: its 300 px cover, framed and reflected
     * exactly as the player frames and reflects it. Null when the cover is not in hand.
     */
    public static Bitmap trip(Song track, Song rep) {
        return trip(track, rep, null);
    }

    /**
     * {@link #trip} built ahead, its cover read past BigCover's memory; {@code src} gets the
     * cover and the path it was read for, for {@code BigCover.keep} if this picture flies — the
     * player then finds the very same bitmap, and with it the same composite.
     */
    public static Bitmap tripAhead(Song track, Song rep, Object[] src) {
        return trip(track, rep, src);
    }

    private static Bitmap trip(Song track, Song rep, Object[] src) {
        try {
            boolean free = src != null;
            String at = track == null ? null : track.getPath();
            // a track known to have no artwork shows the placeholder, not its album's cover
            if (at != null && BigCover.knownNone(at)) return Cover.blankCover();
            Bitmap b = at == null ? null : free ? BigCover.peekTrackFree(at) : BigCover.peekTrack(at);
            if (b == null && rep != null) {
                at = rep.getPath();
                if (BigCover.knownNone(at)) return Cover.blankCover();
                b = free ? BigCover.peekTrackFree(at) : BigCover.peekTrack(at);
            }
            if (b == null) return null;
            if (free) {
                src[0] = b;
                src[1] = at;
            }
            // one step under Cover's lock: built on two threads at once, the first composite
            // could be handed out for redrawing before it was held
            synchronized (Cover.class) {
                Bitmap out = Cover.reflect(Cover.fitCover(b));
                Cover.hold(out);        // ours for the whole trip: the player must not redraw it
                return out;
            }
        } catch (Throwable t) {
            return null;
        }
    }

    /** Injected after BasePlayerActivity.initView in MusicPlayerActivity: arms the way back. */
    public static void flipIn(Activity a) {
        Open.step("base");
        try {
            Intent i = a.getIntent();
            if (i == null || !i.getBooleanExtra(EXTRA_FLIP, false)) return;
            // armed once; a re-created player leaves the ordinary way
            i.removeExtra(EXTRA_FLIP);
            i.putExtra(EXTRA_BACK, true);
            // the cover is already on screen, so the first frame must not be without it: stock
            // paints the cached one only from a later refresh
            PlayerService ps = Y1Application.Companion.getPlayerService();
            Song s = ps == null ? null : ps.getPlayingMusic();
            if (s != null && a instanceof BasePlayerActivity) Cover.instantCover((BasePlayerActivity) a, s.getPath());
            Open.step("cover");
            fadeIn(a);
        } catch (Throwable t) {
        }
    }

    public static final int FADE_MS = 250;

    /** The player comes in around a cover already in place: everything but it and the backdrop fades in. */
    private static void fadeIn(Activity a) {
        try {
            View center = a.findViewById(R.id.cl_player_center);
            View cover = a.findViewById(R.id.cover_bg);
            View cover2 = a.findViewById(R.id.cover_bg2);
            if (center == null || !(center.getParent() instanceof ViewGroup)) return;
            ViewGroup root = (ViewGroup) center.getParent();
            FadeStart go = new FadeStart();
            for (int i = 0; i < root.getChildCount(); i++) {
                View v = root.getChildAt(i);
                int id = v.getId();
                if (id == R.id.player_bg || id == R.id.mask_bg) continue;
                if (v != center) {
                    go.add(v);
                    continue;
                }
                ViewGroup g = (ViewGroup) center;
                for (int k = 0; k < g.getChildCount(); k++) {
                    View c = g.getChildAt(k);
                    if (c != cover && c != cover2) go.add(c);
                }
            }
            Choreographer.getInstance().postFrameCallback(go);
        } catch (Throwable t) {
        }
    }

    /**
     * Hides the views at once and fades them in once the track has started: the player's first
     * frame builds the whole screen, and the track's start comes right after it — on the ffmpeg
     * formats a new player, the file opened and its threads busy, 100–200 ms of lost frames. The
     * fade begun before them lost its first steps; it waits for prepared, WAIT_MS at the most.
     */
    static final class FadeStart implements Choreographer.FrameCallback {
        private static final long WAIT_MS = 600;
        private final ArrayList views = new ArrayList();
        private final ArrayList alphas = new ArrayList();
        private boolean first = true;
        /** The track is starting: unprepared at the first frame, as the player restarts it from initView. */
        private boolean starting;
        private int after;
        private long since;

        void add(View v) {
            views.add(v);
            alphas.add(Float.valueOf(v.getAlpha()));
            v.setAlpha(0f);
        }

        public void doFrame(long nanos) {
            PlayerService ps = Y1Application.Companion.getPlayerService();
            boolean ready = ps != null && ps.getPlayerIsPrepared();
            if (first) {
                since = SystemClock.uptimeMillis();
                starting = !ready;
            }
            // a starting track: its prepared handling, then one frame more; the one playing: at once
            boolean settled = !starting || (ready && ++after > 1);
            if (first || (!settled && SystemClock.uptimeMillis() - since < WAIT_MS)) {
                first = false;
                Choreographer.getInstance().postFrameCallback(this);
                return;
            }
            Frames.start("player fade", Diag.MEASURE);
            for (int i = 0; i < views.size(); i++) {
                ((View) views.get(i)).animate().alpha(((Float) alphas.get(i)).floatValue())
                        .setDuration(FADE_MS).withLayer().withEndAction(FADED);
            }
        }
    }

    /** The fade's frames go to the log once it is over: every view ends it, the first one stops. */
    private static final Runnable FADED = new Faded();

    static final class Faded implements Runnable {
        public void run() { Frames.stop(); }
    }

    /**
     * Injected at the top of BasePlayerActivity.pressMenu (the top button): a player Cover Flow
     * opened notes where its cover is and leaves with no transition, so Cover Flow can take the
     * cover back from that spot. True when it has taken the press.
     */
    public static boolean flipBack(Activity a) {
        try {
            Intent i = a.getIntent();
            if (i == null || !i.getBooleanExtra(EXTRA_BACK, false)) return false;
            i.removeExtra(EXTRA_BACK);
            measure(a);
            returning = true;
            a.finish();
            a.overridePendingTransition(0, 0);
            return true;
        } catch (Throwable t) {
            return false;
        }
    }
}
