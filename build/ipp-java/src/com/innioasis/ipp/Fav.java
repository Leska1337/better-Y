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
 * The Favorites playlist: created under a fixed UUID (found again after a rename or a language
 * switch; the name is only a label), and edited when the heart is pressed. Every failure is
 * swallowed — a database that will not answer must not take the player down.
 */
public final class Fav {

    private static Y1Repository repo() {
        return Y1Application.Companion.getY1Repository();
    }

    /** The one place the id is written down; {@link Likes} reads this very constant. */
    static final String UUID_STR = "1e5f0a00-0000-4000-8000-000000000001";

    private static UUID favUuid() {
        return UUID.fromString(UUID_STR);
    }

    private static String nameFor(Context c) {
        return c.getString(R.string.ipp_favorites);
    }

    /**
     * Only CREATES the playlist, never relabels it — that would undo a manual rename at the next
     * heart press. Relabelling is {@link #sync}'s job alone. Called once per app start.
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
            // The real constructor, safe because all three references are non-null.
            repo.addPlaylist(new Playlist(id, name, name.toLowerCase(),
                    System.currentTimeMillis(), false));
        } catch (Throwable t) {
        }
    }

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
            // By file: also works for a track the library has not indexed.
            repo.addToPlayListByFile(new File(path), favUuid());
        } catch (Throwable t) {
        }
    }

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
     * Relabels the playlist in the interface language — the one thing that undoes a manual rename.
     * Whether the language actually changed is decided by {@code Playlists.syncName}.
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
