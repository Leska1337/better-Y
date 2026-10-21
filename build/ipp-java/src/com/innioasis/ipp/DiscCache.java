package com.innioasis.ipp;

import com.innioasis.y1.database.Song;

/**
 * The DISC NUMBER tag of a track, out of its row ({@link Schema}), for albums not split into CD
 * folders — the folder name answers first ({@link Albums#discOf}). A row whose file was never read
 * is not {@link #known}; one read without the tag answers 0.
 */
public final class DiscCache {

    private DiscCache() { }

    /** A row whose file was read counts as known, tag or not. */
    public static boolean known(String path) {
        if (path == null) return true;
        Song s = Schema.row(path);
        return s == null || !Schema.unread(s);
    }

    /** 0 when it has none or was never read. */
    public static int get(String path) {
        Song s = Schema.row(path);
        if (s == null) return 0;
        int d = parse(s.getDisc());
        return d > 0 ? d : sideOf(s.getTrack());
    }

    /** One file's yield: filled by {@link #read} on any thread, stored by {@link #commit}. */
    public static final class Tags {
        /** False for a picture-only read, which stores nothing. */
        public boolean wanted;
        public Meta.Info info;
        public byte[] art;            // the embedded picture, or null
        /** False when the file did not read: nothing in here is an answer then. */
        public boolean ok;
        public long openNs;           // Meta.Info's, for the pass's log line
        public long artNs;
        public boolean ours;
    }

    /**
     * The tags and the artwork from one file open — opening is the whole cost of a metadata
     * read. Writes nothing, so any thread may call it; never the UI thread.
     */
    public static Tags read(String path, boolean tags, boolean art) {
        Tags out = new Tags();
        out.wanted = tags;
        if (path == null) return out;
        Meta.Info info = Meta.read(path, art);
        out.art = info.art;
        // the picture lives in out.art alone: the caller drops it, while info is kept to the commit
        info.art = null;
        if (tags) out.info = info;
        out.ok = info.ok;
        out.openNs = info.openNs;
        out.artNs = info.artNs;
        out.ours = info.ours;
        return out;
    }

    /** Into the row in memory; {@link #flush} stores the rows committed. */
    public static void commit(String path, Tags t) {
        if (path == null || t == null || !t.wanted || !t.ok) return;
        Schema.stage(path, t.info);
    }

    /**
     * A vinyl track number "A1" as disc {@code Disc.SIDE_BASE + 1}, so the CD dividers show sides.
     * Only without a DISC tag, and only one letter followed by a digit ("CD2" is not a side).
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

    /** The first number in the tag: "1/2", "01", "CD2". */
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
        Schema.write();
    }
}
