package com.innioasis.ipp;

import android.content.Context;

import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Song;

import java.util.List;
import java.util.UUID;

/**
 * The Now-Playing heart. It is a preference ({@code like:<path>}), because {@code Deck.render} asks
 * on every click; the Favorites playlist is the durable half. Hooked into {@code Y1Repository}'s
 * {@code addToPlayList(List, UUID)} and {@code removeFromPlayList}, so the heart follows the playlist
 * when it is edited from a menu or the Playlists screen too.
 */
public final class Likes {

    private Likes() { }

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

    public static void noteAdd(List songs, UUID playlist) {
        // Shares this call site with the playlist cover.
        PlGrid.noteAdd(playlist);
        try {
            if (songs == null || !isFav(playlist)) return;
            for (int i = 0; i < songs.size(); i++) {
                Object o = songs.get(i);
                if (o instanceof Song) set(((Song) o).getPath(), true);
            }
        } catch (Throwable t) {
        }
    }

    /** The DAO deletes by song id, so the path is looked up. */
    public static void noteRemove(String songId, UUID playlist) {
        try {
            if (songId == null || !isFav(playlist)) return;
            com.innioasis.y1.database.Y1Repository repo = Y1Application.Companion.getY1Repository();
            if (repo == null) return;
            Song s = repo.getSongBySongIdSync(songId);
            if (s != null) set(s.getPath(), false);
        } catch (Throwable t) {
        }
    }

    /** The id lives only in {@link Fav#UUID_STR} — never a second copy here. */
    private static boolean isFav(UUID playlist) {
        return playlist != null && Fav.UUID_STR.equals(playlist.toString());
    }
}
