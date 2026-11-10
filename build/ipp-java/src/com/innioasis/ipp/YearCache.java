package com.innioasis.ipp;

import java.util.List;

import com.innioasis.y1.database.Song;

/**
 * An album's year out of all its songs ({@link AlbumTags}): {@link #get} is the earliest, what
 * lists sort and group by; {@link #label} is what a row shows, a span when the songs differ.
 * {@code ""} means "read, no year", null "no song of it was read".
 */
public final class YearCache {

    private YearCache() { }

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

    /** The earliest year, four digits. The key is canonicalised. */
    public static String get(String album) {
        AlbumTags.Sum s = album == null ? null : AlbumTags.of(Albums.coverKey(album));
        if (s == null || !s.anyRead()) return null;
        return s.yearMin == 0 ? "" : String.valueOf(s.yearMin);
    }

    /** "1997" or "2001 – 2004". The key is canonicalised. */
    public static String label(String album) {
        return album == null ? null : AlbumTags.yearLabel(AlbumTags.of(Albums.coverKey(album)));
    }

    /** Reads the representative of every album none of whose songs was read, then stores them. */
    public static void warm(List names) {
        if (names == null) {
            return;
        }
        try {
            int n = names.size();
            for (int i = 0; i < n; i++) {
                String album = Albums.coverKey((String) names.get(i));
                if (album == null || Albums.isAllSongs(album)) {
                    continue;
                }
                AlbumTags.Sum s = AlbumTags.of(album);
                if (s == null || s.anyRead() || s.rep == null) {
                    continue;
                }
                Song row = Schema.row(s.rep);
                if (row != null && Schema.unread(row)) {
                    Schema.stage(s.rep, Meta.read(s.rep, false));
                }
            }
        } catch (Throwable t) {
        }
        Schema.write();
    }

    /** {@link #warm} for the whole library, off the screen. */
    static void prepare(List keys) {
        warm(keys);
    }
}
