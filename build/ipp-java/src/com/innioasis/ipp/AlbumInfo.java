package com.innioasis.ipp;

import android.content.Context;

import java.io.File;

import com.innioasis.y1.Y1Application;

/**
 * The album row's two questions — the artist line's fallback and the song its cover is read from —
 * answered from {@link AlbumTags}, so the bind never queries. Holds nothing; {@link #clear}
 * deletes the file the answers were once kept in.
 */
public final class AlbumInfo {

    private AlbumInfo() { }

    /** The commonest track artist; null for a key that names no album. */
    public static String artist(String album) {
        AlbumTags.Sum s = album == null ? null : AlbumTags.of(Albums.coverKey(album));
        return s == null ? null : s.artist();
    }

    /** The representative's path; null for a key that names no album. */
    public static String path(String album) {
        AlbumTags.Sum s = album == null ? null : AlbumTags.of(Albums.coverKey(album));
        return s == null ? null : s.rep;
    }

    /** The row's background pass reports what it found; everything is in the song list already. */
    public static void put(String album, String artist, String path) {
    }

    public static void clear() {
        try {
            Context c = Y1Application.Companion.getAppContext();
            File d = c == null ? null : c.getCacheDir();
            if (d != null) new File(d, "ipp_albums.txt").delete();
        } catch (Throwable t) {
        }
    }
}
