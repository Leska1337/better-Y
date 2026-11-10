package com.innioasis.ipp;

import com.innioasis.y1.database.Song;

/**
 * The ALBUM ARTIST of an album: the commonest one among its songs ({@link AlbumTags}). It is one
 * deliberate value — "Various Artists" is not two artists — so it is never split and no setting
 * rewrites it.
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

    /** "" when the songs read carry none, null when none of them was read. */
    public static String get(String key) {
        AlbumTags.Sum s = key == null ? null : AlbumTags.of(Albums.coverKey(key));
        return s == null ? null : s.albumArtist;
    }

    /** Not one song of the album was read: the row's background pass reads one. */
    public static boolean needsRead(String key) {
        AlbumTags.Sum s = key == null ? null : AlbumTags.of(Albums.coverKey(key));
        return s != null && !s.anyRead();
    }

    /** Reads the file only when no song of the album was; then into the row. Not on the UI thread. */
    public static String read(String key, String path) {
        if (key == null || path == null) return "";
        String kept = get(key);
        if (kept != null) return kept;
        Schema.stage(path, Meta.read(path, false));
        kept = get(key);
        return kept == null ? "" : kept;
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
     * An album row's artist line: exactly the name it is filed under in Album Artists, so no
     * setting may touch it. {@code tagArtist} only for a key that names no album of the list.
     */
    public static String line(String key, String tagArtist) {
        AlbumTags.Sum s = key == null ? null : AlbumTags.of(Albums.coverKey(key));
        if (s != null) return s.line();
        return AlbumArtists.of(null, tagArtist);
    }

    /** {@link #line} from the album row's bind: the row is on screen, so its songs get read. */
    public static String row(String key, String tagArtist) {
        if (key != null) AlbumTags.shown(Albums.coverKey(key));
        return line(key, tagArtist);
    }
}
