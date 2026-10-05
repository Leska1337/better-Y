package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.os.Handler;
import android.os.SystemClock;
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
 * A slide is the cover with its reflection under it in one bitmap, built off the main thread, so
 * drawing one is a single bitmap under a perspective matrix.
 */
public final class Flow {

    /** Side of the centre cover in screen pixels, at rest. */
    public static final int S = 180;
    /** Reflection rows under the cover: half of it, as the player's own reflection, so the cover
     *  that moves between the two screens does not change length on arrival. */
    public static final int REFL = S / 2;
    /** Transparent frame left, right and on top: the filtering then softens the slanted edges. */
    public static final int PAD = 2;

    /** The extra that tells the player it was opened by the first half of a flip. */
    public static final String EXTRA_FLIP = "ipp_flip";
    public static final int FLIP_MS = 90;

    private Flow() {}

    // ---- the Music menu ---------------------------------------------------------------------

    /** Injected after AlbumArtists.musicMenu in MusicMainActivity.initView. */
    public static void musicMenu(List list, Context c) {
        try {
            String label = c.getString(R.string.ipp_coverflow);
            if (!list.contains(label)) list.add(0, label);
        } catch (Throwable t) {
            // the menu stands without it
        }
    }

    /**
     * Injected in MusicMainActivity.confirm after AlbumArtists.musicPick, so the index it gets is
     * already past that row: ours opens the screen and answers -1, the rest move up by one.
     */
    public static int musicPick(Activity a, int pos) {
        try {
            if (pos < 0) return pos;
            List l = Constant.INSTANCE.getMainList();
            if (l == null || l.isEmpty() || !a.getString(R.string.ipp_coverflow).equals(l.get(0))) return pos;
            if (pos > 0) return pos - 1;
            a.startActivity(new Intent(a, IppFlowActivity.class));
            return -1;
        } catch (Throwable t) {
            return pos;
        }
    }

    // ---- albums -----------------------------------------------------------------------------

    /** One album of the flow. {@code artist} is filled in late when the tag has not been read. */
    public static final class Item {
        public final String key;
        public final String name;
        public final Song rep;
        public volatile String artist;

        Item(String key, String name, Song rep) {
            this.key = key;
            this.name = name;
            this.rep = rep;
            this.artist = artistOf(key, rep, AlbumArtist.get(key));
        }
    }

    /** Music → Album Artists' rule: the album artist as written, else the track's first artist. */
    static String artistOf(String key, Song rep, String aa) {
        return Other.INSTANCE.unNamed(AlbumArtists.of(aa, rep.getArtist()));
    }

    /** Every album of the library, A to Z; unknown names sort last by their own prefix. */
    public static List albums() {
        ArrayList out = new ArrayList();
        List all = Albums.allSongs();
        if (all == null) return out;
        HashMap reps = new HashMap();
        for (int i = 0; i < all.size(); i++) {
            Song s = (Song) all.get(i);
            if (s == null || s.getPath() == null) continue;
            String k = Albums.keyOf(s);
            Song r = (Song) reps.get(k);
            if (r == null || s.getPath().compareTo(r.getPath()) < 0) reps.put(k, s);
        }
        Object[] keys = reps.keySet().toArray();
        for (int i = 0; i < keys.length; i++) {
            String k = (String) keys[i];
            out.add(new Item(k, Other.INSTANCE.unNamed(Albums.realName(k)), (Song) reps.get(k)));
        }
        Collections.sort(out, BY_NAME);
        return out;
    }

    private static final Comparator BY_NAME = new ByName();

    private static final class ByName implements Comparator {
        public int compare(Object a, Object b) {
            String x = Albums.realName(((Item) a).key);
            String y = Albums.realName(((Item) b).key);
            int c = (x == null ? "" : x).toLowerCase(Locale.ROOT)
                    .compareTo((y == null ? "" : y).toLowerCase(Locale.ROOT));
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
        List l = Albums.songsOf(it.key);
        DiscCache.warm();
        boolean read = false;
        for (int i = 0; i < l.size(); i++) {
            String p = ((Song) l.get(i)).getPath();
            if (p == null || DiscCache.known(p)) continue;
            DiscCache.commit(p, DiscCache.read(p, true, false));
            read = true;
        }
        if (read) DiscCache.flush();
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
        return Feat.title(t, s.getArtist());
    }

    // ---- slides -----------------------------------------------------------------------------

    /** The cover of an album at slide size, or null when it has none. Off the main thread only. */
    static Bitmap cover(Item it) {
        try {
            Bitmap b = BigCover.track(it.rep.getPath());
            return b == null ? null : Cover.square(b, S);
        } catch (Throwable t) {
            return null;
        }
    }

    /** The cover, or the blank card PictureFlow draws for an album without one. */
    private static int[] face(Bitmap cover) {
        int[] px = new int[S * S];
        if (cover != null) {
            cover.getPixels(px, 0, S, 0, 0, S, S);
            return px;
        }
        for (int y = 0; y < S; y++) {
            for (int x = 0; x < S; x++) {
                int g = 0x30 + (x + y) * 0x30 / (2 * S);
                if (x < 3 || y < 3 || x >= S - 3 || y >= S - 3) g = 0x60;
                px[y * S + x] = 0xFF000000 | (g << 16) | (g << 8) | g;
            }
        }
        return px;
    }

    /** Cover over its mirror image, the mirror fading from half opacity to nothing. */
    static Bitmap slide(Bitmap cover) {
        int[] px = face(cover);
        int w = S + 2 * PAD;
        int h = PAD + S + REFL;
        int[] out = new int[w * h];
        for (int y = 0; y < S; y++) System.arraycopy(px, y * S, out, (PAD + y) * w + PAD, S);
        for (int y = 0; y < REFL; y++) {
            int a = 128 * (REFL - y) / REFL;
            int src = (S - 1 - y) * S;
            int dst = (PAD + S + y) * w + PAD;
            for (int x = 0; x < S; x++) out[dst + x] = (a << 24) | (px[src + x] & 0xFFFFFF);
        }
        return Bitmap.createBitmap(out, w, h, Bitmap.Config.ARGB_8888);
    }

    private static Bitmap mask;

    /** A slide's shape, opaque over the cover and its reflection alike: what a slide hides. */
    static Bitmap mask() {
        if (mask == null) {
            int w = S + 2 * PAD;
            int h = PAD + S + REFL;
            int[] out = new int[w * h];
            for (int y = PAD; y < h; y++) {
                for (int x = PAD; x < PAD + S; x++) out[y * w + x] = 0xFF000000;
            }
            mask = Bitmap.createBitmap(out, w, h, Bitmap.Config.ARGB_8888);
        }
        return mask;
    }

    // ---- the loader -------------------------------------------------------------------------

    /**
     * Builds slides nearest the target first, on one thread, and keeps only a window around it: a
     * slide is ~220 KB and a library holds hundreds of albums. An album artist not read yet is
     * read on the way, and the row repainted.
     */
    public static final class Loader implements Runnable {
        public static final int AHEAD = 7;
        public static final int KEEP = 10;

        private final List items;
        private final Runnable onSlide;
        private final Handler ui;
        public final Hashtable slides = new Hashtable();
        /** When each slide was put in, for the row to fade it in from there. */
        private final Hashtable born = new Hashtable();
        private volatile int target;
        private volatile boolean stop;
        private Bitmap blank;
        private boolean readArtist;
        private final Object wake = new Object();

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
            android.os.Process.setThreadPriority(android.os.Process.THREAD_PRIORITY_BACKGROUND);
            try {
                loop();
            } finally {
                if (readArtist) AlbumArtist.flush();
            }
        }

        private void loop() {
            while (!stop) {
                int t = target;
                int want = -1;
                for (int d = 0; d <= AHEAD && want < 0; d++) {
                    if (has(t + d)) want = t + d;
                    else if (has(t - d)) want = t - d;
                }
                if (want < 0) {
                    evict(t);
                    synchronized (wake) {
                        if (target == t && !stop) {
                            try { wake.wait(); } catch (InterruptedException e) { return; }
                        }
                    }
                    continue;
                }
                Item it = (Item) items.get(want);
                if (AlbumArtist.needsRead(it.key)) {
                    it.artist = artistOf(it.key, it.rep, AlbumArtist.read(it.key, it.rep.getPath()));
                    readArtist = true;
                }
                Bitmap c = cover(it);
                Bitmap s;
                if (c == null) {
                    if (blank == null) blank = slide(null);
                    s = blank;
                } else {
                    s = slide(c);
                }
                born.put(Integer.valueOf(want), Long.valueOf(SystemClock.uptimeMillis()));
                slides.put(Integer.valueOf(want), s);
                ui.post(onSlide);
            }
        }

        private boolean has(int i) {
            return i >= 0 && i < items.size() && !slides.containsKey(Integer.valueOf(i));
        }

        private void evict(int t) {
            Object[] ks = slides.keySet().toArray();
            for (int i = 0; i < ks.length; i++) {
                int k = ((Integer) ks[i]).intValue();
                if (Math.abs(k - t) > KEEP) {
                    slides.remove(ks[i]);
                    born.remove(ks[i]);
                }
            }
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
            // the defaults below
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
        try {
            Bitmap b = track == null ? null : BigCover.peekTrack(track.getPath());
            if (b == null && rep != null) b = BigCover.peekTrack(rep.getPath());
            if (b == null) return null;
            return Cover.reflect(Cover.fitCover(b));
        } catch (Throwable t) {
            return null;
        }
    }

    /** Injected after BasePlayerActivity.initView in MusicPlayerActivity: arms the way back. */
    public static void flipIn(Activity a) {
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
            fadeIn(a);
        } catch (Throwable t) {
            // the player leaves the ordinary way
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
            for (int i = 0; i < root.getChildCount(); i++) {
                View v = root.getChildAt(i);
                int id = v.getId();
                if (id == R.id.player_bg || id == R.id.mask_bg) continue;
                if (v != center) {
                    fade(v);
                    continue;
                }
                ViewGroup g = (ViewGroup) center;
                for (int k = 0; k < g.getChildCount(); k++) {
                    View c = g.getChildAt(k);
                    if (c != cover && c != cover2) fade(c);
                }
            }
        } catch (Throwable t) {
            // shown at once
        }
    }

    private static void fade(View v) {
        float to = v.getAlpha();
        v.setAlpha(0f);
        v.animate().alpha(to).setDuration(FADE_MS).withLayer();
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
