package com.innioasis.ipp;

import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.database.Y1Repository;

import java.io.File;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * "Clear cache" → the cache of deleted songs. What is needed is worked out from the library as it
 * is now — the name each cache gives a song, its folder or its album — and the rest goes. Wrong
 * only ever in one direction: something dropped is read again when it is next shown.
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
        HashSet paths = new HashSet();
        HashSet folders = new HashSet();
        HashSet albums = new HashSet();
        add(music, paths, folders, albums);
        add(books, paths, folders, albums);

        long n = 0L;
        try { n += CoverCache.prune(albums, drop); } catch (Throwable t) { }
        try { n += BigCover.prune(paths, folders, drop); } catch (Throwable t) { }
        try { n += FlowCache.prune(paths, drop); } catch (Throwable t) { }
        try { n += Art.prune(folders, drop); } catch (Throwable t) { }
        try { n += AlbumInfo.prune(albums, paths, drop); } catch (Throwable t) { }
        return n;
    }

    /** Album keys both encoded and plain: Genres asks the caches under the plain name. */
    private static void add(List songs, Set paths, Set folders, Set albums) {
        if (songs == null) return;
        for (int i = 0; i < songs.size(); i++) {
            Object o = songs.get(i);
            if (!(o instanceof Song)) continue;
            Song s = (Song) o;
            String p = s.getPath();
            if (p == null) continue;
            paths.add(p);
            folders.add(Albums.trackFolder(p));
            albums.add(Albums.keyOf(s));
            albums.add(s.getAlbum() == null ? "" : s.getAlbum());
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
