package com.innioasis.ipp;

import android.content.Context;
import android.media.MediaMetadataRetriever;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.database.Y1Repository;

/**
 * The year of an album, read from the tags of ONE of its songs and remembered in
 * {@code ipp_years.txt}.
 *
 * <p>A year is a property of the album, not of the track — one {@code MediaMetadataRetriever} per
 * album, which is what makes it affordable at all. (A per-track year range "(2001 – 2004)" was
 * considered and deferred for exactly that reason: it needs every file of the library read.)
 *
 * <p>{@code ""} means "read, and this album has no year": without it every untagged album would be
 * opened again on every pass. {@link #get(String)} therefore answers "" and null differently, and
 * {@link YearComparator} treats both as "no year".
 *
 * <p>Keys go through {@link Albums#coverKey}, so an album asked about by its plain name from Genres
 * and by its folder-encoded name from Albums is one entry, not two.
 *
 * <p>The map is a raw {@code HashMap} — a generic field type makes javac emit a class
 * {@code Signature} attribute and the bundled d8 crashes dexing those.
 */
public final class YearCache {

    private static boolean dirty;
    private static boolean loaded;
    private static final HashMap map = new HashMap();

    public static void clear() {
        map.clear();
        loaded = false;
        dirty = false;
        try {
            File f = file();
            if (f != null) {
                f.delete();
            }
        } catch (Throwable t) {
        }
    }

    /** The first run of four digits in the string, or null. "1997-08-12" and "1997" both give 1997. */
    private static String digits4(String s) {
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

    private static File file() {
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) {
            return null;
        }
        File dir = c.getCacheDir();
        if (dir == null) {
            return null;
        }
        return new File(dir, "ipp_years.txt");
    }

    /**
     * The album's year, "" for "read, no year", null for "never looked at".
     *
     * <p>ipp: the key is canonicalised — the Genres screen asks with a PLAIN album name where the
     * Albums screen asks with a folder-encoded one (see {@link Albums#coverKey} / CoverCache.peek).
     */
    public static String get(String album) {
        album = Albums.coverKey(album);
        if (album == null) {
            return null;
        }
        load();
        return (String) map.get(album);
    }

    private static void load() {
        if (loaded) {
            return;
        }
        loaded = true;
        try {
            File f = file();
            if (f == null || !f.exists()) {
                return;
            }
            FileInputStream in = new FileInputStream(f);
            byte[] b = new byte[in.available()];
            in.read(b);
            in.close();
            String[] lines = new String(b).split("\n");
            for (int i = 0; i < lines.length; i++) {
                String line = lines[i];
                int tab = line.indexOf('\t');
                if (tab < 0) {
                    continue;
                }
                map.put(line.substring(0, tab), line.substring(tab + 1));
            }
        } catch (Throwable t) {
        }
    }

    /** Writes the file, but only when something has been added since the last write. */
    private static void save() {
        if (!dirty) {
            return;
        }
        try {
            File f = file();
            if (f == null) {
                return;
            }
            StringBuilder sb = new StringBuilder();
            Iterator it = map.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry e = (Map.Entry) it.next();
                sb.append((String) e.getKey());
                sb.append('\t');
                sb.append((String) e.getValue());
                sb.append('\n');
            }
            FileOutputStream out = new FileOutputStream(f);
            out.write(sb.toString().getBytes());
            out.close();
            dirty = false;
        } catch (Throwable t) {
        }
    }

    /**
     * Records ONE album's year from tags the caller has already read out of a file it had open
     * anyway ("Cache library" reads the album artist, the year and the thumbnail from a single
     * {@code setDataSource}). Exactly {@link #warm}'s rule: YEAR first, DATE as the fallback, four
     * digits out of either, and "" for "read, no year" so it is not read again.
     *
     * <p>It does not write the file — the caller's pass ends in {@link #warm}, which does.
     */
    public static void put(String album, String year, String date) {
        album = Albums.coverKey(album);
        if (album == null) {
            return;
        }
        load();
        String y = digits4(year);
        if (y == null) {
            y = digits4(date);
        }
        if (y == null) {
            y = "";
        }
        map.put(album, y);
        dirty = true;
    }

    /** Reads the year of every album of the list that has none cached, then writes the file once. */
    public static void warm(List names) {
        if (names == null) {
            return;
        }
        load();
        try {
            Y1Repository repo = Y1Application.Companion.getY1Repository();
            int n = names.size();
            for (int i = 0; i < n; i++) {
                String album = (String) names.get(i);
                if (album == null) {
                    continue;
                }
                // ipp #281.1: the "Show all songs" row is not an album — never scan the artist
                // for a year.
                if (Albums.isAllSongs(album)) {
                    continue;
                }
                if (map.containsKey(album)) {
                    continue;
                }
                List songs = repo.getSongsByAlbum(album, Y1Repository.SongSortType.FileName_A_To_Z);
                if (songs == null || songs.isEmpty()) {
                    continue;
                }
                String path = ((Song) songs.get(0)).getPath();
                if (path == null) {
                    continue;
                }
                String year = "";
                MediaMetadataRetriever mmr = new MediaMetadataRetriever();
                try {
                    mmr.setDataSource(path);
                    String y = digits4(mmr.extractMetadata(MediaMetadataRetriever.METADATA_KEY_YEAR));
                    if (y == null) {
                        y = digits4(mmr.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DATE));
                    }
                    if (y != null) {
                        year = y;
                    }
                } catch (Throwable t) {
                }
                try {
                    mmr.release();
                } catch (Throwable t) {
                }
                map.put(album, year);
                dirty = true;
            }
            save();
        } catch (Throwable t) {
        }
    }
}
