package com.innioasis.ipp;

import android.content.Context;
import android.media.MediaMetadataRetriever;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Song;

/**
 * The TRACK NUMBER tag of a song, kept per path in {@code ipp_tracks.txt}.
 *
 * {@link #get(String)} answers {@code Integer.MAX_VALUE} for a song with no number — which is
 * what puts untagged songs at the end of "Sort by track" — and it deliberately does NOT read the
 * file: it is the drawing path, so the one read is done by {@link #warmIfWanted()} from the two
 * screens that show track numbers — {@code AlbumsActivity.initView} and {@code Genres.songs}.
 *
 * A tagless file is written down as that same MAX_VALUE by {@link #ensure}, so it is not opened
 * again on the next pass.
 *
 * The map is a raw {@code HashMap} — a generic field type makes javac emit a class
 * {@code Signature} attribute and the bundled d8 crashes dexing those.
 */
public final class TrackCache {

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

    /**
     * Reads the track number of every song of the list that has none cached.
     *
     * A file whose tag gives nothing is written down as MAX_VALUE — the very value {@link #get}
     * would have answered — so it is not opened again. Without that, every untagged song in the
     * library was re-read on every sort.
     */
    private static void ensure(List songs) {
        if (songs == null) {
            return;
        }
        int n = songs.size();
        for (int i = 0; i < n; i++) {
            String path = ((Song) songs.get(i)).getPath();
            if (path == null) {
                continue;
            }
            if (map.containsKey(path)) {
                continue;
            }
            MediaMetadataRetriever mmr = new MediaMetadataRetriever();
            try {
                mmr.setDataSource(path);
                put(path, mmr.extractMetadata(MediaMetadataRetriever.METADATA_KEY_CD_TRACK_NUMBER));
            } catch (Throwable t) {
            }
            try {
                mmr.release();
            } catch (Throwable t) {
            }
            if (!map.containsKey(path)) {
                map.put(path, Integer.valueOf(Integer.MAX_VALUE));
                dirty = true;
            }
        }
    }

    /**
     * Ipp: this song's file was re-read ("Update library"), so its TRACK NUMBER tag may have
     * changed — drop the remembered one. Its counterpart in {@code DiscCache.forget} is called from
     * the same place ({@code Ipp.songChanged}); the two must be dropped together, because
     * {@code DiscCache} is what records for both of them that a file has been looked at.
     */
    public static void forget(String path) {
        if (path == null) {
            return;
        }
        load();
        if (map.remove(path) == null) {
            return;
        }
        dirty = true;
        save();
    }

    /**
     * Ipp: read the cache file in NOW, before any album row asks for a track number.
     * {@link #get} answers from memory only, and a row bind is the drawing path — so the one file
     * read is done here, once, from {@code AlbumsActivity.initView} and from {@code Genres.songs}
     * (the Genres screen shows the column for a real album too).
     *
     * Gated on the setting, because with it off nothing on any screen asks for a track number
     * and the read would be pure cost.
     */
    public static void warmIfWanted() {
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) {
            return;
        }
        if (!Prefs.on(c, "track_numbers")) {
            return;
        }
        load();
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
        return new File(dir, "ipp_tracks.txt");
    }

    /** The song's track number, or {@code Integer.MAX_VALUE}. Memory only — never opens a file. */
    public static int get(String path) {
        if (path == null) {
            return Integer.MAX_VALUE;
        }
        Integer v = (Integer) map.get(path);
        if (v == null) {
            return Integer.MAX_VALUE;
        }
        return v.intValue();
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
                int n = parse(line.substring(tab + 1));
                if (n <= 0) {
                    continue;
                }
                map.put(line.substring(0, tab), Integer.valueOf(n));
            }
        } catch (Throwable t) {
        }
    }

    /**
     * Ipp: skip whatever stands in FRONT of the number, then read it — the first number in
     * the value, which is the rule {@code DiscCache.parse} has always used and the one the docs
     * claimed this method used too. It did not: it read digits from index 0 and stopped at the
     * first non-digit, so "1/12" worked but " 1", "A1" (vinyl side numbering) and "Track 3" all
     * parsed as 0 — and 0 is not stored at all, i.e. the song counts as having no track number. One
     * such song is enough to put a whole album back on row numbers, which is what it looked like on
     * the device: an album whose tags are all filled showing 1..N positions instead.
     */
    private static int parse(String s) {
        int n = 0;
        int i = 0;
        int len = s.length();
        while (i < len) {
            char c = s.charAt(i);
            if (c >= '0' && c <= '9') {
                break;
            }
            i++;
        }
        while (i < len) {
            char c = s.charAt(i);
            if (c < '0' || c > '9') {
                break;
            }
            n = n * 10 + (c - '0');
            i++;
        }
        return n;
    }

    /** Records one song's number from a tag the caller has already read. Does not write the file. */
    public static void put(String path, String tag) {
        if (path == null || tag == null) {
            return;
        }
        int n = parse(tag);
        if (n <= 0) {
            return;
        }
        map.put(path, Integer.valueOf(n));
        dirty = true;
    }

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
                sb.append(((Integer) e.getValue()).intValue());
                sb.append('\n');
            }
            FileOutputStream out = new FileOutputStream(f);
            out.write(sb.toString().getBytes());
            out.close();
            dirty = false;
        } catch (Throwable t) {
        }
    }

    /** A copy of the song list ordered by track number, reading whatever is missing first. */
    public static List sorted(List songs) {
        if (songs == null) {
            return null;
        }
        load();
        ensure(songs);
        save();
        ArrayList copy = new ArrayList(songs);
        Collections.sort(copy, new TrackComparator());
        return copy;
    }
}
