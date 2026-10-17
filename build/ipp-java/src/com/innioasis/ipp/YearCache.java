package com.innioasis.ipp;

import java.util.HashMap;
import java.util.List;

import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.database.Y1Repository;

/**
 * An album's year: the year column of ONE of its songs ({@link Schema}). {@code ""} means "read,
 * no year", null "never read". The song is the one {@link AlbumInfo} recorded for the row, else
 * the one {@link #warm} looked up, remembered in memory against the song list it was found in.
 */
public final class YearCache {

    private static List repsFor;
    private static final HashMap reps = new HashMap();   // album key -> path

    /** The first run of four digits: "1997-08-12" gives 1997. */
    static String digits4(String s) {
        if (s == null) {
            return null;
        }
        int len = s.length();
        for (int i = 0; i < len - 3; i++) {
            String t = s.substring(i, i + 4);
            int j = 0;
            while (j < 4) {
                char c = t.charAt(j);
                if (c < '0' || c > '9') {
                    break;
                }
                j++;
            }
            if (j == 4) {
                return t;
            }
        }
        return null;
    }

    /** An album's representative: the one {@link #warm} looked up, else the row's {@link AlbumInfo}. */
    static synchronized String repPath(String key) {
        List l = Albums.loaded();
        if (l != null && l != repsFor) {
            reps.clear();
            repsFor = l;
        }
        String p = (String) reps.get(key);
        return p != null ? p : AlbumInfo.path(key);
    }

    private static synchronized void noteRep(String key, String path) {
        reps.put(key, path);
    }

    /** "" for "read, no year", null for "never looked at". The key is canonicalised. */
    public static String get(String album) {
        album = Albums.coverKey(album);
        if (album == null) {
            return null;
        }
        Song s = Schema.row(repPath(album));
        return s == null ? null : s.getYear();
    }

    /** Reads every album whose song was never read, then stores them in one batch. */
    public static void warm(List names) {
        if (names == null) {
            return;
        }
        try {
            Y1Repository repo = Y1Application.Companion.getY1Repository();
            int n = names.size();
            for (int i = 0; i < n; i++) {
                String album = Albums.coverKey((String) names.get(i));
                if (album == null || Albums.isAllSongs(album)) {
                    continue;
                }
                if (get(album) != null) {
                    continue;
                }
                String path = repPath(album);
                if (path == null) {
                    List songs = repo.getSongsByAlbum(album, Y1Repository.SongSortType.FileName_A_To_Z);
                    if (songs == null || songs.isEmpty()) {
                        continue;
                    }
                    path = ((Song) songs.get(0)).getPath();
                    if (path == null) {
                        continue;
                    }
                    noteRep(album, path);
                }
                Song row = Schema.row(path);
                if (row != null && Schema.unread(row)) {
                    Schema.stage(path, Meta.read(path, false));
                }
            }
        } catch (Throwable t) {
        }
        Schema.write();
    }
}
