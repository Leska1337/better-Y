package com.innioasis.ipp;

import com.innioasis.y1.database.Song;

/**
 * The ALBUM ARTIST tag of an album: its representative's row ({@link Schema}), the song
 * {@link YearCache#repPath} names. It is one deliberate value — "Various Artists" is not two
 * artists — so it is never split and no setting rewrites it.
 */
public final class AlbumArtist {

    private AlbumArtist() { }

    /** Moves with every write of the tag columns, so Album Artists knows when to regroup. */
    public static int gen() {
        return Schema.gen();
    }

    /** The tag of one song, "" when the file has none, null when never read. */
    public static String of(Song s) {
        return s == null ? null : s.getAlbumArtist();
    }

    /** The tag, "" when the file has none, null when never read. */
    public static String get(String key) {
        if (key == null) return null;
        return of(Schema.row(YearCache.repPath(Albums.coverKey(key))));
    }

    public static boolean needsRead(String key) {
        return key != null && get(key) == null;
    }

    /** Reads the file only when its row never was; then into the row. Not on the UI thread. */
    public static String read(String key, String path) {
        if (key == null || path == null) return "";
        String kept = of(Schema.row(path));
        if (kept != null) return kept;
        Meta.Info i = Meta.read(path, false);
        Schema.stage(path, i);
        return i.albumArtist == null ? "" : i.albumArtist.trim();
    }

    public static String readAndSave(String key, String path) {
        String v = read(key, path);
        Schema.write();
        return v;
    }

    public static void flush() {
        Schema.write();
    }

    /**
     * An album row's artist line: exactly the name it is filed under in Album Artists
     * ({@link AlbumArtists#of}), so no setting may touch it. The representative's own artist
     * before the row's: the row's is not there until its background pass has run.
     */
    public static String line(String key, String tagArtist) {
        Song rep = key == null ? null : Schema.row(YearCache.repPath(Albums.coverKey(key)));
        if (rep != null) return AlbumArtists.of(of(rep), rep.getArtist());
        return AlbumArtists.of(get(key), tagArtist);
    }
}
