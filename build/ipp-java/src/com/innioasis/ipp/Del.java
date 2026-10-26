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
import com.innioasis.y1.activity.IppFlowActivity;
import com.innioasis.y1.activity.PlayerActivity;

import java.io.File;

/**
 * Deleting a song takes its folder with it once nothing else is left there ("delete_folder",
 * off by default). Only {@code cover.*}, {@code folder.*} and {@code *.lrc} count as leftovers; a
 * subfolder holding nothing else goes too, anything real keeps the whole tree. Hooked at the end
 * of {@code Y1Repository.deleteSong}, which every music delete goes through — an album simply loses
 * its folder with its last song.
 */
public final class Del {

    private Del() { }

    private static boolean on(Context c) {
        return Prefs.on(c, "delete_folder");
    }

    /**
     * Depth of {@code deleteSongsOfDir}, the file browsers' delete, during which {@link #folder}
     * does nothing: there the user sees the folder and deletes it himself. A counter because the
     * method recurses; per thread because two screens may delete at once.
     */
    private static final ThreadLocal RAW = new ThreadLocal();

    /** Both ends of {@code Y1Repository.deleteSongsOfDir}. */
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
     * After the file is gone: the song's folder, then each folder above it the same rule empties
     * (an artist's last album). {@link #removable} stops the walk below the card's top level.
     * Runs on Dispatchers.IO.
     */
    public static void folder(String songPath) {
        try {
            if (songPath == null || songPath.length() == 0 || raw()) return;
            Context c = Y1Application.Companion.getAppContext();
            if (!on(c)) return;

            File dir = new File(songPath).getParentFile();
            while (dir != null && dir.isDirectory() && removable(dir) && spent(dir, 0)) {
                File up = dir.getParentFile();
                Diag.note("deleting spent folder " + dir.getAbsolutePath());
                wipe(dir);
                dir = up;
            }
        } catch (Throwable t) {
        }
    }

    private static final int MAX_DEPTH = 8;

    /** Nothing but leftovers and folders that are themselves spent. */
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

    /** Only on a tree {@link #spent} has already cleared. */
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

    private static boolean leftover(String name) {
        if (name == null) return false;
        String n = name.toLowerCase();
        if (n.endsWith(".lrc")) return true;
        int dot = n.lastIndexOf('.');
        String base = dot > 0 ? n.substring(0, dot) : n;
        return base.equals("cover") || base.equals("folder");
    }

    /** Never the card root or its top-level folders: the last song of Music must not take Music. */
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
     * The delete confirmation warns that the folder may go too. Hooked into
     * {@code DialogUtil.setDialogTitle}; the screen decides, because the same "Delete?" title serves
     * playlists, photos and videos. A message already set is never touched.
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

    /** Not Folders: its delete stays stock ({@link #raw}). */
    private static boolean songScreen(Activity a) {
        return a instanceof SongListActivity || a instanceof AlbumsActivity
                || a instanceof ArtistsActivity || a instanceof GenresActivity
                || a instanceof SearchActivity || a instanceof IppFlowActivity
                || a instanceof AllAudiobooksActivity || a instanceof PlayerActivity;
    }
}
