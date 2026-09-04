package com.innioasis.ipp;

import android.content.Context;

import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Song;

import java.util.List;
import java.util.UUID;

/**
 * #231 — the heart on the Now-Playing button row, and the Favorites playlist behind it.
 *
 * The heart is a preference ({@code like:<path>}), not a database query: {@code Deck.render} runs
 * on every track change and every wheel click over the button row, and a playlist membership query
 * there would be a Room round-trip per repaint. The preference is the fast answer; the playlist is
 * the durable one, and the two are kept in step by writing the preference wherever the playlist is
 * written.
 *
 * That second half is what this class adds. {@code Deck} keeps both sides itself when the heart is
 * pressed, but the Favorites playlist is an ordinary playlist as well — it appears in the
 * long-press "Add to Playlist N" submenu and on the Playlists screen, where a song can be added or
 * removed without the heart ever being touched. The hooks are in {@code Y1Repository}, at the two
 * points every one of those paths funnels through:
 * <ul>
 *   <li>{@code addToPlayList(List, UUID)} — also the body of the single-song overload and of
 *       {@code addToPlayListByFile}, so one injection covers all three.</li>
 *   <li>{@code removeFromPlayList(String songId, UUID)}.</li>
 * </ul>
 * Anything aimed at another playlist is ignored after one UUID compare.
 */
public final class Likes {

    private Likes() { }

    /**
     * The Favorites playlist's fixed id. Duplicated from {@code Fav} rather than shared: that class
     * is hand-written smali and its {@code favUuid()} is private, and making it public would need a
     * two-phase build for the sake of one constant that has never changed and never will.
     */
    private static final String FAV_UUID = "1e5f0a00-0000-4000-8000-000000000001";

    /** Preference key for one song's heart. */
    public static String key(String path) {
        return "like:" + path;
    }

    public static boolean get(String path) {
        if (path == null) return false;
        Context c = Y1Application.Companion.getAppContext();
        return c != null && Prefs.getBool(c, key(path), false);
    }

    public static void set(String path, boolean on) {
        if (path == null) return;
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) return;
        Prefs.setBool(c, key(path), on);
    }

    /** Songs just added to a playlist: light the heart if that playlist is Favorites. */
    public static void noteAdd(List songs, UUID playlist) {
        try {
            if (songs == null || !isFav(playlist)) return;
            for (int i = 0; i < songs.size(); i++) {
                Object o = songs.get(i);
                if (o instanceof Song) set(((Song) o).getPath(), true);
            }
        } catch (Throwable t) {
            // the heart is never worth failing the playlist write for
        }
    }

    /**
     * A song just removed from a playlist. Only the song id is available here — that is what the
     * DAO deletes by — so the path is looked up; the row is still in the Song table either way,
     * this only removes it from a playlist.
     */
    public static void noteRemove(String songId, UUID playlist) {
        try {
            if (songId == null || !isFav(playlist)) return;
            com.innioasis.y1.database.Y1Repository repo = Y1Application.Companion.getY1Repository();
            if (repo == null) return;
            Song s = repo.getSongBySongIdSync(songId);
            if (s != null) set(s.getPath(), false);
        } catch (Throwable t) {
            // ditto
        }
    }

    private static boolean isFav(UUID playlist) {
        return playlist != null && FAV_UUID.equals(playlist.toString());
    }
}
