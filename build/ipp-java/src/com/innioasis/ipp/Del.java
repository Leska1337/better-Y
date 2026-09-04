package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;

import com.innioasis.music.AlbumsActivity;
import com.innioasis.music.ArtistsActivity;
import com.innioasis.music.GenresActivity;
import com.innioasis.music.SearchActivity;
import com.innioasis.music.SongListActivity;
import com.innioasis.music.objects.Constant;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.activity.AllAudiobooksActivity;
import com.innioasis.y1.activity.PlayerActivity;

import java.io.File;

/**
 * #228 — deleting a song takes its folder with it, once nothing is left in that folder.
 *
 * "Nothing left" is deliberately narrow: any file that is not the album's own leftovers keeps the
 * folder. The leftovers are the files that belong to the songs and to nothing else —
 * {@code cover.*} / {@code folder.*} (the external artwork, see the ipp-covers skill) and
 * {@code *.lrc} (the lyrics of the tracks that have just gone). They are deleted with the folder;
 * an orphaned cover.jpg in an empty directory is not something anyone wants kept.
 *
 * A subfolder is held to exactly the same test rather than blocking the delete outright: an empty
 * directory next to the songs (or one holding nothing but those same leftovers) is as much a
 * remnant as the cover file is, so it goes with the rest. A subfolder with anything real in it
 * still keeps the whole tree.
 *
 * The hook is a single call at the end of {@code Y1Repository.deleteSong}, which is the one place
 * every delete goes through — one song, a whole album, a multi-select, the player's own menu. An
 * album is a loop of that call, so the folder simply goes with the last song of it, and nothing
 * has to know that an album was being deleted. The one delete that is left alone is the file
 * browser's — see {@link #raw}.
 *
 * Gated by the pref "delete_folder", default off (stock behaviour: the folder stays).
 */
public final class Del {

    private Del() { }

    private static boolean on(Context c) {
        return Prefs.on(c, "delete_folder");
    }

    /**
     * A delete driven from the file browser stays stock — there the user is deleting a FILE, sees
     * the folder it is in on the same screen and deletes it himself if he wants it gone. The rule
     * belongs to the music screens, where the folder is not shown at all.
     *
     * {@code Y1Repository.deleteSongsOfDir} is exactly that path and nothing else: FilesActivity,
     * PhotosActivity and VideoListActivity go through it, the music screens call {@code deleteSong}
     * directly. So it brackets itself with this counter (a counter, not a flag — the method
     * recurses into subdirectories), and {@link #folder} does nothing while it is up.
     *
     * Per thread: deletes run on a coroutine thread, and nothing says two screens cannot be at it.
     * Raw {@code ThreadLocal} deliberately — generics crash the bundled d8 (see CLAUDE.md).
     */
    private static final ThreadLocal RAW = new ThreadLocal();

    /** Called at both ends of {@code Y1Repository.deleteSongsOfDir}. */
    public static void raw(boolean enter) {
        try {
            int[] depth = (int[]) RAW.get();
            if (depth == null) {
                depth = new int[1];
                RAW.set(depth);
            }
            depth[0] += enter ? 1 : -1;
            if (depth[0] < 0) depth[0] = 0;
        } catch (Throwable t) {
            // a counter that will not count is not worth a crash mid-delete
        }
    }

    private static boolean raw() {
        try {
            int[] depth = (int[]) RAW.get();
            return depth != null && depth[0] > 0;
        } catch (Throwable t) {
            return false;
        }
    }

    /**
     * Called at the end of {@code Y1Repository.deleteSong}, after the file itself is gone: the
     * song's own folder first, then every folder above it that the same rule empties.
     * Off the main thread — every delete path runs in a coroutine on Dispatchers.IO.
     */
    public static void folder(String songPath) {
        try {
            if (songPath == null || songPath.length() == 0 || raw()) return;
            Context c = Y1Application.Companion.getAppContext();
            if (!on(c)) return;

            // ... and then upwards, as long as the same rule holds: the last album of an artist
            // leaves the artist's folder empty, and an empty artist folder is the same remnant the
            // album folder was. removable() is what ends the walk -- the card's own top-level
            // directories are never reached.
            File dir = new File(songPath).getParentFile();
            while (dir != null && dir.isDirectory() && removable(dir) && spent(dir, 0)) {
                File up = dir.getParentFile();
                Diag.note("deleting spent folder " + dir.getAbsolutePath());
                wipe(dir);
                dir = up;
            }
        } catch (Throwable t) {
            // a folder that will not go is not worth a crash on a delete that already succeeded
        }
    }

    /** How deep the "is anything left in here" walk goes; a music folder is never near that. */
    private static final int MAX_DEPTH = 8;

    /** True when the folder holds nothing but leftovers and folders that are themselves spent. */
    private static boolean spent(File dir, int depth) {
        if (depth > MAX_DEPTH) return false;
        File[] kids = dir.listFiles();
        if (kids == null) return false;
        for (int i = 0; i < kids.length; i++) {
            File f = kids[i];
            if (f.isDirectory()) {
                if (!spent(f, depth + 1)) return false;
            } else if (!leftover(f.getName())) {
                return false;
            }
        }
        return true;
    }

    /** Only ever called on a tree {@link #spent} has already walked, so nothing real is in it. */
    private static void wipe(File dir) {
        File[] kids = dir.listFiles();
        if (kids != null) {
            for (int i = 0; i < kids.length; i++) {
                if (kids[i].isDirectory()) wipe(kids[i]);
                else kids[i].delete();
            }
        }
        dir.delete();
    }

    /** cover.* / folder.* (external artwork) and *.lrc (lyrics) — nothing else. */
    private static boolean leftover(String name) {
        if (name == null) return false;
        String n = name.toLowerCase();
        if (n.endsWith(".lrc")) return true;
        int dot = n.lastIndexOf('.');
        String base = dot > 0 ? n.substring(0, dot) : n;
        return base.equals("cover") || base.equals("folder");
    }

    /**
     * A card's own top-level directories (Music, Videos, Audiobooks, …) are never albums, and the
     * card root least of all — the last song of {@code /storage/sdcard0/Music} must not take the
     * Music folder with it. Only what sits below one of those is a candidate.
     */
    private static boolean removable(File dir) {
        String p = dir.getAbsolutePath();
        if (Constant.INSTANCE.pathIsAudiobook(p)) return false;
        File parent = dir.getParentFile();
        if (parent == null) return false;
        return !cardRoot(p) && !cardRoot(parent.getAbsolutePath());
    }

    private static boolean cardRoot(String p) {
        return Constant.ROOT_PATH.equals(p) || Constant.INTERNAL_PATH.equals(p)
                || "/storage".equals(p) || "/mnt".equals(p) || "/".equals(p);
    }

    /**
     * #228 — the delete confirmation says that the folder may go too, so the setting never
     * surprises anyone. Injected at the single point every one of those dialogs passes through,
     * {@code DialogUtil.setDialogTitle(title, msg, callback, isConfirm, cancelable)}.
     *
     * Which dialog is which is decided by the screen that raised it: the same "Delete?" title is
     * used for playlists, bookmarks, photos and videos, where the folder rule does not apply at
     * all. Hence the explicit list of screens that delete SONGS — and a message that is already
     * set is never touched (FilesActivity deleting a directory has its own warning there).
     *
     * The wording stays conditional ("if nothing else is left in it") because at this point
     * nothing knows yet whether the folder will end up empty.
     */
    public static String msg(Activity a, String title, String msg) {
        try {
            if (msg != null && msg.length() > 0) return msg;
            if (a == null || !on(a) || title == null) return msg;
            if (!songScreen(a)) return msg;
            if (!title.equals(a.getString(R.string.is_delete))) return msg;
            return a.getString(R.string.ipp_del_folder_warn);
        } catch (Throwable t) {
            return msg;
        }
    }

    /** Folders is not here on purpose: its delete stays stock, warning and all — see {@link #raw}. */
    private static boolean songScreen(Activity a) {
        return a instanceof SongListActivity || a instanceof AlbumsActivity
                || a instanceof ArtistsActivity || a instanceof GenresActivity
                || a instanceof SearchActivity
                || a instanceof AllAudiobooksActivity || a instanceof PlayerActivity;
    }
}
