package com.innioasis.ipp;

import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.database.Y1Repository;

import java.io.File;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 * "Clear cache" → the cache of deleted songs. What is needed is worked out from the library as it
 * is now — the name each cache gives a song, its folder or its album — and the rest goes. Wrong
 * only ever in one direction: something dropped is read again when it is next shown, and a hash
 * that happens to match keeps a file that could have gone.
 */
public final class Stale {

    private Stale() { }

    /** Its weight on disk. Background thread only. */
    static long size() {
        return run(false);
    }

    static void clear() {
        run(true);
    }

    private static long run(boolean drop) {
        List music = Albums.allSongs();
        // an unread library is not an empty one: nothing is known to be unneeded
        if (music == null || music.isEmpty()) return 0L;
        List books = null;
        try {
            Y1Repository repo = Y1Application.Companion.getY1Repository();
            if (repo != null) books = repo.getSongsSync(1);
        } catch (Throwable t) {
            return 0L;
        }
        Need need = new Need();
        // the album keys of the list in memory are indexed already, and its groups keep a folder's
        // songs together: a key per song cost seconds on 25 000 songs
        HashMap index = Albums.albumSongsOf(music);
        if (index != null) {
            need.albums.addAll(index.keySet());
            Iterator it = index.values().iterator();
            while (it.hasNext()) need.addAll((List) it.next(), false);
        } else {
            need.addAll(music, true);
        }
        need.addAll(books, true);
        need.big.seal();
        need.flow.seal();

        long n = 0L;
        try { n += CoverCache.prune(need.albums, drop); } catch (Throwable t) { }
        try { n += BigCover.prune(need.big, need.folders, drop); } catch (Throwable t) { }
        try { n += FlowCache.prune(need.flow, drop); } catch (Throwable t) { }
        try { n += Art.prune(need.folders, drop); } catch (Throwable t) { }
        return n;
    }

    /**
     * Everything the caches may still need, in one pass: track folders, album keys both encoded and
     * plain (Genres asks under the plain name), and the keys of the big covers' and the Cover Flow
     * slides' file names. Nothing is built per song: a folder is cut out of a path only when it
     * differs from the last, and a path's hash is the one its String already holds.
     */
    private static final class Need {
        final HashSet folders = new HashSet();
        final HashSet albums = new HashSet();
        /** Paths and folders, as {@link Keys#of}: what a big cover or a note is named by. */
        final Keys big = new Keys();
        /** Folder hash and path hash: what a Cover Flow slide is named by. */
        final Keys flow = new Keys();
        private final HashMap byDir = new HashMap();
        private String last;
        private int lastHash;

        void addAll(List songs, boolean keys) {
            if (songs == null) return;
            for (int i = 0; i < songs.size(); i++) {
                Object o = songs.get(i);
                if (o instanceof Song) add((Song) o, keys);
            }
        }

        private void add(Song s, boolean key) {
            String p = s.getPath();
            if (p == null) return;
            int ph = p.hashCode();
            big.add(Keys.of(ph, p.length()));
            int cut = p.lastIndexOf('/');
            if (last == null || cut != last.length() || !p.startsWith(last)) {
                last = cut < 0 ? "" : p.substring(0, cut);
                lastHash = last.hashCode();
                if (folders.add(last)) big.add(Keys.of(lastHash, last.length()));
            }
            flow.add(((long) lastHash << 32) | (ph & 0xffffffffL));
            if (key) albums.add(Albums.keyOf(s, byDir));
            albums.add(s.getAlbum() == null ? "" : s.getAlbum());
        }
    }

    /** A sorted set of longs: a cache's file names as numbers, so no name is built per song. */
    static final class Keys {
        private long[] a = new long[4096];
        private int n;

        /** A string as a big cover names it: its hash and its length. */
        static long of(String s) {
            return of(s.hashCode(), s.length());
        }

        static long of(int hash, int length) {
            return ((long) hash << 32) | (length & 0xffffffffL);
        }

        void add(long k) {
            if (n == a.length) a = Arrays.copyOf(a, n * 2);
            a[n++] = k;
        }

        void seal() {
            Arrays.sort(a, 0, n);
        }

        boolean has(long k) {
            return Arrays.binarySearch(a, 0, n, k) >= 0;
        }
    }

    /**
     * The files of {@code dir} whose name, {@code hex-second} + {@code suffix}, is not in
     * {@code keep}: their weight, deleted when {@code drop}. The second part is a hex hash when
     * {@code hexSecond}, else a decimal length; a name of another shape is not needed.
     */
    static long files(File dir, Keys keep, String suffix, boolean hexSecond, boolean drop) {
        File[] fs = dir == null ? null : dir.listFiles();
        if (fs == null) return 0L;
        long n = 0L;
        for (int i = 0; i < fs.length; i++) {
            if (keep.has(key(fs[i].getName(), suffix, hexSecond))) continue;
            n += fs[i].length();
            if (drop) fs[i].delete();
        }
        return n;
    }

    /** Never a key of a song when the name is not of the cache's own shape. */
    private static long key(String name, String suffix, boolean hexSecond) {
        try {
            if (!name.endsWith(suffix)) return Long.MAX_VALUE;
            int end = name.length() - suffix.length();
            int dash = name.indexOf('-');
            if (dash <= 0 || dash >= end) return Long.MAX_VALUE;
            int a = (int) Long.parseLong(name.substring(0, dash), 16);
            String second = name.substring(dash + 1, end);
            int b = hexSecond ? (int) Long.parseLong(second, 16) : Integer.parseInt(second);
            return ((long) a << 32) | (b & 0xffffffffL);
        } catch (Throwable t) {
            return Long.MAX_VALUE;
        }
    }

    /** The files of {@code dir} not named in {@code keep}: their weight, deleted when {@code drop}. */
    static long files(File dir, Set keep, boolean drop) {
        File[] fs = dir == null ? null : dir.listFiles();
        if (fs == null) return 0L;
        long n = 0L;
        for (int i = 0; i < fs.length; i++) {
            if (keep.contains(fs[i].getName())) continue;
            n += fs[i].length();
            if (drop) fs[i].delete();
        }
        return n;
    }

    /** The weight of one key-value line of a cache's text file. */
    static long line(String key, String value) {
        try {
            return (key + "\t" + value + "\n").getBytes("UTF-8").length;
        } catch (Throwable t) {
            return key.length() + value.length() + 2;
        }
    }
}
