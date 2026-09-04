package com.innioasis.ipp;

import android.content.Context;
import android.media.MediaMetadataRetriever;

import com.innioasis.y1.Y1Application;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * The DISC NUMBER tag of a track (ID3 {@code TPOS}), for albums that are not split into CD
 * folders.
 *
 * Why the tag at all
 * The disc a track belongs to is otherwise read off its folder name ("CD1", "Disc 2", "Диск3"),
 * which is free and reflects how the files were actually laid out — but it is blind to an album
 * that sits in ONE folder and says "1/2" and "2/2" in its tags. So: the folder answers first, and
 * the tag only where the folder says nothing ({@link Albums#discOf}).
 *
 * Cost
 * Unlike the album artist, this is a property of the TRACK, so it is one metadata read per song —
 * the expensive class. It is therefore read only by "Cache library", and in the same file open as
 * the track number ({@link #read}), which that pass reads anyway: having both makes the disc
 * number practically free.
 *
 * A cached 0 means "read, the file has no disc tag" — the difference between that and "never
 * looked at" ({@link #known}) is what stops every tagless song being re-read on every pass.
 *
 * Raw (non-generic) types throughout: the bundled d8 crashes dexing generic Signature attrs.
 */
public final class DiscCache {

    private DiscCache() { }

    private static final HashMap map = new HashMap();   // song path -> Integer disc (0 = none)
    private static boolean loaded;
    private static boolean dirty;

    private static final char SEP = '\t';

    /**
     * First line of the file. Its absence means the entries were written before sides of a record
     * were read (see {@link #sideOf}): a stored 0 then means "no DISC tag", which is exactly where
     * a side may be hiding, so those entries are dropped and re-read. Real disc numbers are kept —
     * nothing about them changed.
     */
    private static final String VER = "#v2";

    private static File file() {
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) return null;
        File d = c.getCacheDir();
        return d == null ? null : new File(d, "ipp_discs.txt");
    }

    private static void load() {
        if (loaded) return;
        loaded = true;
        try {
            File f = file();
            if (f == null || !f.exists()) return;
            FileInputStream in = new FileInputStream(f);
            byte[] b = new byte[in.available()];
            in.read(b);
            in.close();
            String[] lines = new String(b, "UTF-8").split("\n");
            boolean cur = lines.length > 0 && VER.equals(lines[0].trim());
            if (!cur) dirty = true;   // rewrite with the marker at the next save
            for (int i = 0; i < lines.length; i++) {
                String s = lines[i];
                int t = s.indexOf(SEP);
                if (t <= 0) continue;
                try {
                    int v = Integer.parseInt(s.substring(t + 1).trim());
                    if (!cur && v == 0) continue;   // may hide a side -- forget it, it is re-read
                    map.put(s.substring(0, t), Integer.valueOf(v));
                } catch (Throwable e) {
                    // a corrupt line is one song that gets read again
                }
            }
        } catch (Throwable t) {
            // an unreadable cache is an empty cache
        }
    }

    private static void save() {
        if (!dirty) return;
        try {
            File f = file();
            if (f == null) return;
            StringBuilder sb = new StringBuilder();
            sb.append(VER).append('\n');
            Iterator it = map.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry e = (Map.Entry) it.next();
                String k = (String) e.getKey();
                if (k == null || k.indexOf(SEP) >= 0) continue;
                sb.append(k).append(SEP).append(((Integer) e.getValue()).intValue()).append('\n');
            }
            FileOutputStream o = new FileOutputStream(f);
            o.write(sb.toString().getBytes("UTF-8"));
            o.close();
            dirty = false;
        } catch (Throwable t) {
            // keep what we have in memory for this run
        }
    }

    /** True once this song's tag has been looked at; a cached "no disc tag" counts. */
    public static boolean known(String path) {
        if (path == null) return true;
        load();
        return map.containsKey(path);
    }

    /** The song's disc number, or 0 when it has none / has never been read. */
    public static int get(String path) {
        if (path == null) return 0;
        load();
        Object o = map.get(path);
        return o == null ? 0 : ((Integer) o).intValue();
    }

    /**
     * "Read, and this file carries no track number" — the very value {@code TrackCache.ensure}
     * writes for such a song, so writing it here is what stops that method opening the same file a
     * second time at the end of the caching pass. {@code TrackCache.put} parses its argument, and
     * a plain number is the only thing it understands.
     */
    private static final String NO_TRACK = "2147483647";   // Integer.MAX_VALUE

    /** What one track's file gives the caching pass. Filled by {@link #read}, stored by
     *  {@link #commit} — the two are separate so the reading can be done by several threads while
     *  the caches are only ever written from one. */
    public static final class Tags {
        /** Whether the tags were asked for at all; a picture-only read stores nothing. */
        public boolean wanted;
        public int disc;              // 0 = no disc tag
        public String track;          // the raw tag, or null for "none"
        public byte[] art;            // the embedded picture, or null
    }

    /**
     * Everything the caching pass wants from one track, out of a single {@code
     * setDataSource} — the two tags above and, for the Now-Playing cover, the artwork bytes.
     *
     * Opening the file is what a metadata read costs (the container has to be parsed before any
     * key can be answered); pulling three values out of one open is practically free, while asking
     * for them separately pays that price again each time — one open here, a second inside
     * {@code BigCover} for the picture, and a third from {@code TrackCache.ensure} for every song
     * whose file carries no track number at all.
     *
     * Writes nothing anywhere, so any number of threads may call it at once. Never call from the
     * UI thread.
     */
    public static Tags read(String path, boolean tags, boolean art) {
        Tags out = new Tags();
        out.wanted = tags;
        if (path == null) return out;
        MediaMetadataRetriever r = new MediaMetadataRetriever();
        try {
            r.setDataSource(path);
            if (tags) {
                out.disc = parse(r.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DISC_NUMBER));
                out.track = r.extractMetadata(MediaMetadataRetriever.METADATA_KEY_CD_TRACK_NUMBER);
            }
            if (art) out.art = r.getEmbeddedPicture();
        } catch (Throwable t) {
            out.disc = 0;                   // an unreadable file is "read, nothing there"
            out.track = null;
        }
        try { r.release(); } catch (Throwable t) { }
        return out;
    }

    /** Store one read. Single-threaded by contract — see {@link #read}. */
    public static void commit(String path, Tags t) {
        if (path == null || t == null || !t.wanted) return;
        load();
        // "no track tag" is written down as the very value TrackCache.ensure would use, or that
        // method opens the file a second time at the end of the pass looking for it
        TrackCache.put(path, t.track != null ? t.track : NO_TRACK);
        int d = t.disc;
        if (d == 0) d = sideOf(t.track);
        map.put(path, Integer.valueOf(d));
        dirty = true;
    }

    /**
     * The side of a record a vinyl-numbered track belongs to — "A1" → side A — as a disc number
     * of {@code Disc.SIDE_BASE + n}, so the CD machinery shows it as a "Side A" divider and orders
     * side A before side B. 0 for anything else.
     *
     * Only where the file has no DISC tag of its own: an explicit tag is the deliberate value and
     * a letter in front of the track number is an interpretation of one. The pattern is exactly
     * one letter followed by a digit, so "Track 3", "CD2" and a plain "3" are not sides — and the
     * number itself is unaffected either way, {@code TrackCache} reading "A1" and "B1" both as 1,
     * which is what puts 1..4 under each side.
     */
    private static int sideOf(String track) {
        if (track == null || track.length() < 2) return 0;
        char c = track.charAt(0);
        if (c >= 'a' && c <= 'z') c = (char) (c - ('a' - 'A'));
        if (c < 'A' || c > 'Z') return 0;
        char d = track.charAt(1);
        if (d < '0' || d > '9') return 0;
        return Disc.SIDE_BASE + (c - 'A' + 1);
    }

    /**
     * Read the file in now, on the caller's thread. The map is loaded lazily, and a lazy load
     * racing several readers is the one thing that could corrupt it — the caching pass calls this
     * before starting its workers, which from then on only look keys up.
     */
    public static void warm() {
        load();
    }

    /**
     * The first number in the tag: "1/2" and "2/2" as well as a bare "1" or a zero-padded "01",
     * and anything with a prefix ("CD2"). Same idea as {@code TrackCache.parse}, which reads
     * "3/12" as 3.
     */
    private static int parse(String s) {
        if (s == null) return 0;
        int i = 0;
        int n = s.length();
        while (i < n && (s.charAt(i) < '0' || s.charAt(i) > '9')) i++;
        int v = 0;
        while (i < n && s.charAt(i) >= '0' && s.charAt(i) <= '9') {
            v = v * 10 + (s.charAt(i) - '0');
            i++;
        }
        return v;
    }

    public static void flush() {
        save();
    }

    /** One song's file was re-read ("Update library"), so its tag may have changed. */
    public static void forget(String path) {
        if (path == null) return;
        load();
        if (map.remove(path) != null) { dirty = true; save(); }
    }

    public static void clear() {
        map.clear();
        loaded = false;
        dirty = false;
        try {
            File f = file();
            if (f != null && f.exists()) f.delete();
        } catch (Throwable t) {
            // ignore
        }
    }
}
