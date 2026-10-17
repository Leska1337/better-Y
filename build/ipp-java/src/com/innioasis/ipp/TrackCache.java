package com.innioasis.ipp;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.innioasis.y1.database.Song;

/**
 * The TRACK NUMBER tag of a song, out of its row ({@link Schema}). No number reads as MAX_VALUE,
 * which sorts last. {@link #get} never opens a file — it is the drawing path; {@link #sorted}
 * reads the songs whose file nobody has read yet.
 */
public final class TrackCache {

    /** Reads every song whose row was never filled, then stores them in one batch. */
    private static void ensure(List songs) {
        if (songs == null) {
            return;
        }
        int n = songs.size();
        for (int i = 0; i < n; i++) {
            String path = ((Song) songs.get(i)).getPath();
            Song row = Schema.row(path);
            if (row == null || !Schema.unread(row)) {
                continue;
            }
            Schema.stage(path, Meta.read(path, false));
        }
        Schema.write();
    }

    /** Memory only. */
    public static int get(String path) {
        Song s = Schema.row(path);
        String tag = s == null ? null : s.getTrack();
        if (tag == null) {
            return Integer.MAX_VALUE;
        }
        int n = parse(tag);
        return n > 0 ? n : Integer.MAX_VALUE;
    }

    /**
     * The first number in the value. The prefix must be skipped: " 1", "A1" or "Track 3" read as 0
     * means no number, and one such song puts the whole album back on row numbers.
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

    /** A sorted copy; reads whatever is missing first. */
    public static List sorted(List songs) {
        if (songs == null) {
            return null;
        }
        ensure(songs);
        ArrayList copy = new ArrayList(songs);
        Collections.sort(copy, new TrackComparator());
        return copy;
    }
}
