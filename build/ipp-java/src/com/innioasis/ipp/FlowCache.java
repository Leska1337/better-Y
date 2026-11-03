package com.innioasis.ipp;

import android.content.Context;
import android.graphics.Bitmap;

import com.innioasis.y1.Y1Application;

import java.io.File;
import java.io.FileOutputStream;

/**
 * Cover Flow's own covers on disk: an album's cover at slide size, so a slide is one decode into a
 * reused buffer with nothing scaled and nothing allocated. Made from the big cover, so it goes
 * when that does: a file is named by its folder and track, and {@code BigCover.forget} of either
 * drops it here too.
 */
public final class FlowCache {

    private FlowCache() { }

    private static final String SUFFIX = "-180.jpg";
    /** libjpeg's scale, about Photoshop 85: at slide size the artefacts are the artwork's size. */
    private static final int QUALITY = 90;

    private static String hex(String s) {
        return Integer.toHexString(s.hashCode());
    }

    static File dir() {
        Context c = Y1Application.Companion.getAppContext();
        File cache = c == null ? null : c.getCacheDir();
        if (cache == null) return null;
        File d = new File(cache, "ipp_flow");
        if (!d.exists()) d.mkdirs();
        return d;
    }

    /** The file for a track's cover, there or not. */
    public static File file(String path) {
        File d = path == null ? null : dir();
        if (d == null) return null;
        return new File(d, name(Albums.trackFolder(path), path));
    }

    /** The file name of a track's slide; {@code folder} is the track's own directory. */
    static String name(String folder, String path) {
        return hex(folder) + "-" + hex(path) + SUFFIX;
    }

    /** Slides whose {@link #name} is not in {@code keep} (folder hash, path hash): their weight. */
    static long prune(Stale.Keys keep, boolean drop) {
        return Stale.files(dir(), keep, SUFFIX, true, drop);
    }

    /** A cover {@link Flow#S} square, written for good. */
    static boolean write(String path, Bitmap square) {
        File f = file(path);
        if (f == null || square == null) return false;
        FileOutputStream out = null;
        try {
            out = new FileOutputStream(f);
            if (!square.compress(Bitmap.CompressFormat.JPEG, QUALITY, out)) {
                out.close();
                out = null;
                f.delete();
                return false;
            }
            return true;
        } catch (Throwable t) {
            f.delete();
            return false;
        } finally {
            try { if (out != null) out.close(); } catch (Throwable t) { }
        }
    }

    /** From {@code BigCover.forget}: the key is a track or a folder, and both readings go. */
    public static void forget(String key) {
        if (key == null) return;
        try {
            File d = dir();
            if (d == null) return;
            new File(d, hex(Albums.trackFolder(key)) + "-" + hex(key) + SUFFIX).delete();
            String folder = hex(key);
            java.util.HashMap held = Thread.currentThread() == holder ? byFolder : null;
            if (held != null) {
                java.util.ArrayList names = (java.util.ArrayList) held.remove(folder);
                if (names == null) return;
                for (int i = 0; i < names.size(); i++) new File(d, (String) names.get(i)).delete();
                return;
            }
            String[] names = d.list();
            if (names == null) return;
            for (int i = 0; i < names.length; i++) {
                if (names[i].startsWith(folder + "-")) new File(d, names[i]).delete();
            }
        } catch (Throwable t) {
        }
    }

    // A batch of forgets lists the folder once, not every slide on disk twice per song.
    private static Thread holder;
    private static java.util.HashMap byFolder;

    /** The calling thread's forgets until {@link #endForget} use one listing, by folder hash. */
    public static void beginForget() {
        try {
            File d = dir();
            String[] names = d == null ? null : d.list();
            java.util.HashMap m = new java.util.HashMap();
            for (int i = 0; names != null && i < names.length; i++) {
                int cut = names[i].indexOf('-');
                if (cut <= 0) continue;
                String k = names[i].substring(0, cut);
                java.util.ArrayList l = (java.util.ArrayList) m.get(k);
                if (l == null) m.put(k, l = new java.util.ArrayList());
                l.add(names[i]);
            }
            byFolder = m;
            holder = Thread.currentThread();
        } catch (Throwable t) {
        }
    }

    public static void endForget() {
        if (Thread.currentThread() != holder) return;
        holder = null;
        byFolder = null;
    }

    public static void clear() {
        try {
            File d = dir();
            File[] fs = d == null ? null : d.listFiles();
            if (fs == null) return;
            for (int i = 0; i < fs.length; i++) fs[i].delete();
        } catch (Throwable t) {
        }
    }
}
