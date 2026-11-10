package com.innioasis.ipp;

import android.os.Handler;
import android.os.Looper;

import com.innioasis.music.objects.Constant;
import com.innioasis.y1.database.Song;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;

/**
 * An album's own tags out of EVERY one of its songs' rows: the commonest album artist, the
 * commonest first track artist, the span of years, the representative (lowest path). Nothing is
 * opened here; songs never read are filled by {@link #shown}'s one background reader. Memoised
 * against the song list and {@link Schema#gen}.
 */
public final class AlbumTags {

    private AlbumTags() { }

    public static final class Sum {
        final List songs;
        /** The lowest path, as the album row and Cover Flow take it. */
        public final String rep;
        /** Commonest ALBUM ARTIST; "" when the songs read carry none, null when none was read. */
        public final String albumArtist;
        /** 0 when no song read carries a year. */
        public final int yearMin, yearMax;
        public final int unread;
        private String artist;

        Sum(List songs, String rep, String albumArtist, int yearMin, int yearMax, int unread) {
            this.songs = songs;
            this.rep = rep;
            this.albumArtist = albumArtist;
            this.yearMin = yearMin;
            this.yearMax = yearMax;
            this.unread = unread;
        }

        public boolean anyRead() {
            return unread < songs.size();
        }

        /** Commonest first artist of the tracks; {@code Constant.UNKNOWN} when none has one. */
        public synchronized String artist() {
            if (artist == null) artist = commonest(songs, false);
            return artist;
        }

        /** What the album is BY: its album artist, else its commonest track artist. */
        public String line() {
            String aa = albumArtist;
            return aa != null && aa.length() > 0 ? aa : artist();
        }
    }

    private static List memoFor;
    private static int memoGen = -1;
    private static HashMap memo = new HashMap();

    /**
     * Null for a key that names no album of the list (a marker row, a stale key). The main thread
     * never waits for the table: with no list in memory it gets null.
     */
    public static Sum of(String key) {
        if (key == null) return null;
        List all = Albums.loaded();
        if (all == null && Looper.myLooper() != Looper.getMainLooper()) all = Albums.allSongs();
        if (all == null) return null;
        int gen = Schema.gen();
        synchronized (AlbumTags.class) {
            if (all != memoFor || gen != memoGen) {
                memo = new HashMap();
                memoFor = all;
                memoGen = gen;
            }
            Object o = memo.get(key);
            if (o != null) return (Sum) o;
        }
        List songs = (List) index(all).get(key);
        if (songs == null || songs.isEmpty()) return null;
        Sum s = build(songs);
        synchronized (AlbumTags.class) {
            if (memoFor == all && memoGen == gen) memo.put(key, s);
        }
        return s;
    }

    private static Sum build(List songs) {
        String rep = null;
        int lo = 0, hi = 0, unread = 0;
        for (int i = 0; i < songs.size(); i++) {
            Song s = (Song) songs.get(i);
            String p = s.getPath();
            if (p != null && (rep == null || p.compareTo(rep) < 0)) rep = p;
            if (Schema.unread(s)) { unread++; continue; }
            int y = year(s.getYear());
            if (y == 0) continue;
            if (lo == 0 || y < lo) lo = y;
            if (y > hi) hi = y;
        }
        String aa = unread == songs.size() ? null : commonest(songs, true);
        return new Sum(songs, rep, aa, lo, hi, unread);
    }

    private static int year(String y) {
        if (y == null || y.length() != 4) return 0;
        try {
            return Integer.parseInt(y);
        } catch (Throwable t) {
            return 0;
        }
    }

    /**
     * The value most songs carry, a tie going to the one on the lowest path. Album artist as
     * written (never split, "" when none); the track artist's first part, UNKNOWN when none.
     */
    private static String commonest(List songs, boolean albumArtist) {
        HashMap count = new HashMap();
        HashMap firstAt = new HashMap();
        String best = null;
        int most = 0;
        for (int i = 0; i < songs.size(); i++) {
            Song s = (Song) songs.get(i);
            String v;
            if (albumArtist) {
                v = s.getAlbumArtist();
                v = v == null ? "" : v.trim();
            } else {
                v = AlbumArtists.first(s.getArtist());
                if (Constant.UNKNOWN.equals(v)) v = "";
            }
            if (v.length() == 0) continue;
            Integer c = (Integer) count.get(v);
            int n = c == null ? 1 : c.intValue() + 1;
            count.put(v, Integer.valueOf(n));
            String p = s.getPath() == null ? "" : s.getPath();
            String f = (String) firstAt.get(v);
            if (f == null || p.compareTo(f) < 0) firstAt.put(v, p);
            if (best == null || n > most
                    || (n == most && ((String) firstAt.get(v)).compareTo((String) firstAt.get(best)) < 0)) {
                best = v;
                most = n;
            }
        }
        if (best == null) return albumArtist ? "" : Constant.UNKNOWN;
        return best;
    }

    /** "1997", "2001 – 2004"; "" when read and yearless, null when nothing was read. */
    public static String yearLabel(Sum s) {
        if (s == null || !s.anyRead()) return null;
        if (s.yearMin == 0) return "";
        if (s.yearMax == s.yearMin) return String.valueOf(s.yearMin);
        return s.yearMin + " – " + s.yearMax;
    }

    /** Album key to its songs: the index Albums keeps for this list, else built here. Read only. */
    static HashMap index(List all) {
        HashMap ix = Albums.albumSongsOf(all);
        if (ix != null) return ix;
        synchronized (AlbumTags.class) {
            if (ownFor == all && own != null) return own;
        }
        ix = new HashMap();
        HashMap byDir = new HashMap();
        for (int i = 0; i < all.size(); i++) {
            Object o = all.get(i);
            if (!(o instanceof Song)) continue;
            Song s = (Song) o;
            if (s.getPath() == null) continue;
            String k = Albums.keyOf(s, byDir);
            ArrayList l = (ArrayList) ix.get(k);
            if (l == null) { l = new ArrayList(); ix.put(k, l); }
            l.add(s);
        }
        synchronized (AlbumTags.class) {
            own = ix;
            ownFor = all;
        }
        return ix;
    }

    private static HashMap own;
    private static List ownFor;

    // ---- the songs of albums on screen, read in the background ------------------------------

    private static final LinkedHashSet queue = new LinkedHashSet();
    /** Paths tried this run: a file that did not read stays unread and must not be retried per bind. */
    private static final HashSet tried = new HashSet();
    private static Thread filler;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    /** A row of this album is on screen: its unread songs are read once, then the lists repaint. */
    public static void shown(String key) {
        Sum s = of(key);
        if (s == null || s.unread == 0) return;
        Thread t;
        synchronized (queue) {
            if (!queue.add(key)) return;
            if (filler != null) return;
            t = filler = new Thread(new Fill(), "ipp-albumtags");
        }
        t.start();
    }

    /** The lists repaint at most this often while the reader works, and once when it is done. */
    private static final long REPAINT_MS = 1000L;

    private static final class Fill implements Runnable {
        public void run() {
            boolean wrote = false;
            long painted = android.os.SystemClock.uptimeMillis();
            while (true) {
                String key;
                synchronized (queue) {
                    if (queue.isEmpty()) {
                        filler = null;
                        break;
                    }
                    key = (String) queue.iterator().next();
                    queue.remove(key);
                }
                try {
                    Sum s = of(key);
                    if (s == null) continue;
                    for (int i = 0; i < s.songs.size(); i++) {
                        Song song = (Song) s.songs.get(i);
                        String p = song.getPath();
                        if (p == null || !Schema.unread(song)) continue;
                        synchronized (tried) {
                            if (!tried.add(p)) continue;
                        }
                        Schema.stage(p, Meta.read(p, false));
                    }
                    Schema.write();
                    wrote = true;
                } catch (Throwable t) {
                }
                long now = android.os.SystemClock.uptimeMillis();
                if (wrote && now - painted >= REPAINT_MS) {
                    painted = now;
                    wrote = false;
                    MAIN.post(new Repaint());
                }
            }
            if (wrote) MAIN.post(new Repaint());
        }
    }

    private static final class Repaint implements Runnable {
        public void run() {
            Lists.refresh();
        }
    }
}
