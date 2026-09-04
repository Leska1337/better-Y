package com.innioasis.ipp;

import android.content.Context;

import java.io.File;
import java.util.UUID;

import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Playlist;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.database.Y1Repository;

/**
 * #231 — the Favorites playlist itself: creating it, and putting a track in or taking it out when
 * the heart on the Now-Playing row is pressed.
 *
 * <p>Its UUID is a constant, not a lookup. The playlist has to be found again after a rename, in
 * another language, and from code that has no list in hand, so the id is what identifies it and the
 * name is only ever a label.
 *
 * <p>Everything here is wrapped in a {@code catch (Throwable)} and does nothing on failure: the
 * heart is a button on the player's row, and a database that will not answer must not take the
 * player down with it.
 *
 * <p>The heart the user SEES is a preference ({@code like:<path>}, see {@code Likes}) — this class
 * is the durable half, and the two are kept in step wherever the playlist is written.
 */
public final class Fav {

    private static Y1Repository repo() {
        return Y1Application.Companion.getY1Repository();
    }

    private static UUID favUuid() {
        return UUID.fromString("1e5f0a00-0000-4000-8000-000000000001");
    }

    private static String nameFor(Context c) {
        return c.getString(R.string.ipp_favorites);
    }

    /**
     * ipp #231: this only CREATES the playlist. It used to rename it back to the current locale's
     * default whenever the name differed — which is every "add to favourites" after the user has
     * renamed it by hand, so a manual name never survived the next heart press. Relabelling is the
     * language switch's job alone ({@link #sync(Context)}, hooked into both language screens).
     *
     * <p>Called from {@code Playlists.syncName} (i.e. {@code MainActivity.initView}) once per app
     * start, so the playlist exists by default whatever the "Likes system" setting says.
     */
    public static void ensure(Context c) {
        try {
            Y1Repository repo = repo();
            if (repo == null) {
                return;
            }
            UUID id = favUuid();
            if (repo.getPlaylistById(id) != null) {
                return;
            }
            String name = nameFor(c);
            // The real 5-argument constructor, and it is reachable: its three reference parameters
            // all get a checkNotNullParameter and all three are passed non-null here. (The trap is
            // the OTHER shape — a Kotlin data class whose defaults-synthetic is what stock's own
            // decompiled source appears to call; javac cannot call a synthetic member and would
            // resolve to the real one, which throws on the first null. See CLAUDE.md.)
            repo.addPlaylist(new Playlist(id, name, name.toLowerCase(),
                    System.currentTimeMillis(), false));
        } catch (Throwable t) {
        }
    }

    /** The heart pressed on: put this track in the playlist, creating the playlist if need be. */
    public static void add(Context c, String path) {
        if (path == null) {
            return;
        }
        try {
            ensure(c);
            Y1Repository repo = repo();
            if (repo == null) {
                return;
            }
            // By FILE rather than by song: addToPlayListByFile is the path that also works for a
            // track the library has not indexed.
            repo.addToPlayListByFile(new File(path), favUuid());
        } catch (Throwable t) {
        }
    }

    /** The heart pressed off. A track the library does not know is not in the playlist either. */
    public static void remove(Context c, String path) {
        if (path == null) {
            return;
        }
        try {
            Y1Repository repo = repo();
            if (repo == null) {
                return;
            }
            Song song = repo.getSongByPathSync(path);
            if (song == null) {
                return;
            }
            repo.removeFromPlayList(song.getSongId(), favUuid());
        } catch (Throwable t) {
        }
    }

    /**
     * Relabel the playlist in the interface language — the ONE thing that undoes a manual rename,
     * and only because the default name is generated and therefore belongs to the UI rather than to
     * the user's data.
     *
     * <p>Triggered by the language screens; {@code Playlists.syncName} is what decides that the
     * language has actually changed (it keeps the stored index, {@code fav_lang}), because a name
     * comparison cannot tell "renamed by hand" from "language switched".
     */
    public static void sync(Context c) {
        try {
            Y1Repository repo = repo();
            if (repo == null) {
                return;
            }
            Playlist p = repo.getPlaylistById(favUuid());
            if (p == null) {
                return;
            }
            String name = nameFor(c);
            if (name.equals(p.getName())) {
                return;
            }
            p.setName(name);
            p.setLowerName(name.toLowerCase());
            repo.updatePlaylist(p);
        } catch (Throwable t) {
        }
    }
}
