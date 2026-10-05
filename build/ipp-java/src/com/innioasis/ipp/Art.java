package com.innioasis.ipp;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.widget.Toast;

import com.innioasis.music.adapter.MyBaseAdapter;
import com.innioasis.music.data.Album;
import com.innioasis.music.util.Other;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Song;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.List;

/**
 * Cover art from files, hooked into the null return of stock {@code Other.getAlbumCover} — so
 * every consumer inherits it, cached by the caller's cache, and embedded art keeps priority.
 * {@code cover.*} serves its own folder only; {@code folder.*} serves its folder and everything
 * below. The nearer folder wins; within one, {@code cover} beats {@code folder}. {@link #chain}
 * memoises per directory, so a tree costs one stat per folder per run.
 *
 * Also: the album thumbnail ({@link #thumb}), noticing a replaced cover file, and the manual
 * "Set as album thumbnail" pick.
 */
public final class Art {

    private Art() { }

    /** In the track's own folder, by priority. */
    private static final String[] OWN = {
        "cover.jpg", "cover.jpeg", "cover.png",
        "folder.jpg", "folder.jpeg", "folder.png",
    };

    /** For an album thumbnail the priority is reversed: folder.jpg stands for the whole folder. */
    private static final String[] OWN_THUMB = {
        "folder.jpg", "folder.jpeg", "folder.png",
        "cover.jpg", "cover.jpeg", "cover.png",
    };

    /** In a parent folder: {@code cover.*} is not inherited. */
    private static final String[] UP = {
        "folder.jpg", "folder.jpeg", "folder.png",
    };

    /** "No folder.* here nor above" (Hashtable forbids nulls). */
    private static final String NONE = "";

    /** directory path -> the folder.* serving it, or {@link #NONE}. */
    private static final Hashtable chain = new Hashtable();

    /** From stock's {@code getAlbumCover} null path, with its arguments. */
    public static Bitmap external(String path, int w, int h) {
        try {
            // An over-3 MB ID3 tag is refused whole by the platform: read it here first, or a
            // track with art of its own gets the folder's.
            byte[] raw = Meta.tagArt(path);
            if (raw != null) {
                Bitmap b = decode(raw, w, h);
                if (b != null) return b;
            }
            File f = file(path);
            return f == null ? null : decode(f, w, h);
        } catch (Throwable t) {
            return null;
        }
    }

    public static File file(String path) {
        return file(path, OWN);
    }

    private static File file(String path, String[] own) {
        if (path == null) return null;
        int i = path.lastIndexOf('/');
        if (i <= 0) return null;
        File dir = new File(path.substring(0, i));

        for (int k = 0; k < own.length; k++) {
            File c = new File(dir, own[k]);
            if (c.isFile()) return c;
        }
        String up = chain(dir.getParentFile());
        return up == null || up.length() == 0 ? null : new File(up);
    }

    /**
     * An album's list thumbnail, from {@code CoverCache.get} on a miss. A pinned song wins outright
     * (read as any track's cover), or a folder.jpg would make the pick a no-op. Otherwise
     * {@code folder.*} → {@code cover.*} → embedded: the reverse of a track's own cover.
     */
    public static Bitmap thumb(String albumKey, String path, int size) {
        String pick = picked(albumKey);
        if (pick != null) {
            Bitmap b = pickedArt(pick, size);
            if (b != null) return b;
        }
        try {
            File f = file(path, OWN_THUMB);
            if (f != null) {
                Bitmap b = decode(f, size, size);
                if (b != null) return b;
            }
        } catch (Throwable t) {
        }
        if (path == null) return null;
        byte[] hint = hintFor(path);
        if (hint != null) return decode(hint, size, size);
        return Other.INSTANCE.getAlbumCover(path, size, size);
    }

    // "Cache library" reads each file once; the embedded art it got is parked here so the last step
    // of thumb() does not open the file again. Only that last step: a pick and cover files still
    // win. Matched by path.

    /** Per THREAD: several workers run at once. */
    private static final ThreadLocal hint = new ThreadLocal();
    /** "Read, no embedded picture" — an answer, so no second open follows. */
    private static final byte[] NO_ART = new byte[0];

    private static final class Hint {
        String path;
        byte[] art;
    }

    /** A null path clears. */
    public static void hint(String path, byte[] art) {
        if (path == null) {
            hint.set(null);
            return;
        }
        Hint h = new Hint();
        h.path = path;
        h.art = art == null ? NO_ART : art;
        hint.set(h);
    }

    /** The automatic thumbnail comes from the tags, so a hint is worth giving. */
    public static boolean thumbFromTags(String albumKey, String path) {
        try {
            return path != null && picked(albumKey) == null && file(path, OWN_THUMB) == null;
        } catch (Throwable t) {
            return false;
        }
    }

    private static byte[] hintFor(String path) {
        Object o = hint.get();
        if (!(o instanceof Hint)) return null;
        Hint h = (Hint) o;
        return h.path != null && h.path.equals(path) ? h.art : null;
    }

    private static Bitmap decode(byte[] raw, int w, int h) {
        try {
            if (raw == null || raw.length == 0) return null;
            BitmapFactory.Options o = new BitmapFactory.Options();
            o.inJustDecodeBounds = true;
            BitmapFactory.decodeByteArray(raw, 0, raw.length, o);
            if (o.outWidth <= 0 || o.outHeight <= 0) return null;
            o.inSampleSize = sample(o.outWidth, o.outHeight, w, h);
            o.inJustDecodeBounds = false;
            return BitmapFactory.decodeByteArray(raw, 0, raw.length, o);
        } catch (Throwable t) {
            return null;
        }
    }

    /** As any track's cover: the tags, then {@link #external} through the null path. */
    private static Bitmap pickedArt(String pick, int size) {
        try {
            return Other.INSTANCE.getAlbumCover(pick, size, size);
        } catch (Throwable t) {
            return null;
        }
    }

    /** Its own {@code folder.*} or the nearest above; memoised for every directory on the way. */
    private static String chain(File dir) {
        if (dir == null) return NONE;
        String key = dir.getAbsolutePath();
        Object hit = chain.get(key);
        if (hit != null) return (String) hit;

        String found = NONE;
        for (int k = 0; k < UP.length; k++) {
            File c = new File(dir, UP[k]);
            if (c.isFile()) { found = c.getAbsolutePath(); break; }
        }
        if (found.length() == 0) found = chain(dir.getParentFile());
        chain.put(key, found);
        return found;
    }

    /**
     * Runs once per file of a scan, so it must stay this cheap; the stamps belong to "Clear cache"
     * ({@link #clearStamps}).
     */
    public static void clear() {
        chain.clear();
    }

    // A replaced cover FILE changes no mtime the library knows, so "Update library" stamps the
    // cover files per folder (name, mtime, length) in ipp_art.txt; a folder whose stamp changed
    // has its pictures forgotten. The manual pick lives in the preferences and survives.

    private static final char SEP = '\t';

    /** folder path -> stamp of every cover file serving it. */
    private static final Hashtable stamps = new Hashtable();
    /** Folders answered in this run. */
    private static final Hashtable seen = new Hashtable();
    private static boolean stampsLoaded;
    private static boolean stampsDirty;

    /** A first-seen folder with a cover counts: re-reading beats a wrong picture. */
    public static boolean coverChanged(String songPath) {
        return coverState(songPath) != COVER_SAME;
    }

    public static final int COVER_SAME = 0;
    /**
     * A cover file and no stamp yet: re-read, but NOT counted as a user's change, or "Update
     * library" reports every freshly scanned song as updated.
     */
    public static final int COVER_NEW = 1;
    /** Replaced or removed since the last pass. */
    public static final int COVER_CHANGED = 2;

    /** Once per FOLDER per run. */
    public static int coverState(String songPath) {
        try {
            String dir = Albums.trackFolder(songPath);
            if (dir == null || dir.length() == 0) return COVER_SAME;
            Object hit = seen.get(dir);
            if (hit != null) return ((Integer) hit).intValue();

            loadStamps();
            String now = stamp(dir);
            String had = (String) stamps.get(dir);
            int state;
            if (now.length() == 0) {
                // "Nothing" is not written down, or the file outgrows the caches it describes.
                state = had != null ? COVER_CHANGED : COVER_SAME;
                if (had != null) {
                    stamps.remove(dir);
                    stampsDirty = true;
                }
            } else if (had == null) {
                state = COVER_NEW;
                stamps.put(dir, now);
                stampsDirty = true;
            } else {
                state = now.equals(had) ? COVER_SAME : COVER_CHANGED;
                if (state != COVER_SAME) {
                    stamps.put(dir, now);
                    stampsDirty = true;
                }
            }
            seen.put(dir, Integer.valueOf(state));
            return state;
        } catch (Throwable t) {
            return COVER_SAME;
        }
    }

    /** Once, at the end of the pass. */
    public static void flushStamps() {
        seen.clear();
        saveStamps();
    }

    /** "Clear cache" took the covers: the stamps vouch for pictures that are gone. */
    public static void clearStamps() {
        chain.clear();
        stamps.clear();
        seen.clear();
        stampsLoaded = false;
        stampsDirty = false;
        try {
            File f = stampFile();
            if (f != null && f.exists()) f.delete();
        } catch (Throwable t) {
        }
    }

    /** Every file that could serve the folder, own and inherited: name, mtime, length. */
    private static String stamp(String dir) {
        StringBuilder b = new StringBuilder();
        File d = new File(dir);
        for (int k = 0; k < OWN_THUMB.length; k++) {
            File c = new File(d, OWN_THUMB[k]);
            if (c.isFile()) b.append(OWN_THUMB[k]).append(':')
                    .append(c.lastModified()).append(':').append(c.length()).append(';');
        }
        String up = chain(d.getParentFile());
        if (up != null && up.length() > 0) {
            File c = new File(up);
            // Not its (long) path: another file would have to match mtime and length both.
            if (c.isFile()) b.append("^:")
                    .append(c.lastModified()).append(':').append(c.length()).append(';');
        }
        return b.toString();
    }

    private static File stampFile() {
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) return null;
        File d = c.getCacheDir();
        return d == null ? null : new File(d, "ipp_art.txt");
    }

    private static void loadStamps() {
        if (stampsLoaded) return;
        stampsLoaded = true;
        try {
            File f = stampFile();
            if (f == null || !f.exists()) return;
            FileInputStream in = new FileInputStream(f);
            byte[] b = new byte[in.available()];
            in.read(b);
            in.close();
            String[] lines = new String(b, "UTF-8").split("\n");
            for (int i = 0; i < lines.length; i++) {
                int t = lines[i].indexOf(SEP);
                if (t <= 0) continue;
                stamps.put(lines[i].substring(0, t), lines[i].substring(t + 1));
            }
        } catch (Throwable t) {
        }
    }

    private static void saveStamps() {
        if (!stampsDirty) return;
        try {
            File f = stampFile();
            if (f == null) return;
            StringBuilder sb = new StringBuilder();
            Enumeration e = stamps.keys();
            while (e.hasMoreElements()) {
                String k = (String) e.nextElement();
                if (k == null || k.indexOf(SEP) >= 0) continue;
                sb.append(k).append(SEP).append((String) stamps.get(k)).append('\n');
            }
            FileOutputStream o = new FileOutputStream(f);
            o.write(sb.toString().getBytes("UTF-8"));
            o.close();
            stampsDirty = false;
        } catch (Throwable t) {
        }
    }

    /**
     * "Set as album thumbnail": in the preferences, not the cache, so it survives Clear cache and
     * rescans. Keyed by the encoded album, so a same-named album elsewhere keeps its own.
     */
    private static final String PICK = "thumb";

    /** Null too when the pinned song is gone: back to the automatic thumbnail. */
    private static String picked(String albumKey) {
        try {
            String key = Albums.coverKey(albumKey);
            if (key == null) return null;
            SharedPreferences p = prefs();
            if (p == null) return null;
            String pick = p.getString(PICK + key, null);
            if (pick == null || !new File(pick).isFile()) return null;
            return pick;
        } catch (Throwable t) {
            return null;
        }
    }

    public static boolean hasPick(String albumKey) {
        try {
            String key = Albums.coverKey(albumKey);
            SharedPreferences p = prefs();
            return key != null && p != null && p.getString(PICK + key, null) != null;
        } catch (Throwable t) {
            return false;
        }
    }

    /** The focused album row's key, canonicalised: one pick per album whichever section. */
    public static String albumKey(MyBaseAdapter albums) {
        if (albums == null) return null;
        Object o = albums.getItem(albums.getPosition());
        return (o instanceof Album) ? Albums.coverKey(((Album) o).getName()) : null;
    }

    /** The focused (or single ticked) song. */
    public static boolean setThumb(MyBaseAdapter songs, MyBaseAdapter albums) {
        if (songs == null) return false;
        Object o = null;
        List sel = songs.getSelectedIndexList();
        if (sel != null && !sel.isEmpty()) o = songs.getItem(((Integer) sel.get(0)).intValue());
        if (o == null) o = songs.getItem(songs.getPosition());
        if (!(o instanceof Song)) return false;
        Song s = (Song) o;
        String key = Albums.keyOf(s);
        if (key == null || s.getPath() == null) return false;

        SharedPreferences p = prefs();
        if (p == null) return false;
        p.edit().putString(PICK + key, s.getPath()).commit();
        repaint(albums, key, s.getPath());

        if (sel != null) sel.clear();
        songs.notifyDataSetChanged();
        toast(R.string.ipp_thumb_set);
        return true;
    }

    public static boolean resetThumb(MyBaseAdapter albums) {
        String key = albumKey(albums);
        if (key == null) return false;
        SharedPreferences p = prefs();
        if (p == null) return false;
        if (p.getString(PICK + key, null) == null) return false;
        p.edit().remove(PICK + key).commit();
        // longConfirm ticked the row.
        List sel = albums.getSelectedIndexList();
        if (sel != null) sel.clear();
        repaint(albums, key, null);
        toast(R.string.ipp_thumb_reset);
        return true;
    }

    /**
     * Also the Bitmap on the {@code Album} model, which the adapter prefers over the cache — else
     * the old cover comes back. Re-read synchronously: one 50px decode, no second flicker.
     */
    private static void repaint(MyBaseAdapter albums, String key, String path) {
        CoverCache.forget(key);
        if (albums == null) return;
        for (int i = 0; i < albums.getCount(); i++) {
            Object o = albums.getItem(i);
            if (!(o instanceof Album)) continue;
            Album al = (Album) o;
            if (!key.equals(Albums.coverKey(al.getName()))) continue;
            String src = path != null ? path : al.getCoverFlag();
            al.setBitmap(src == null ? null : CoverCache.get(key, src));
        }
        albums.notifyDataSetChanged();
    }

    private static void toast(int stringId) {
        try {
            Context c = Y1Application.Companion.getAppContext();
            if (c != null) Toast.makeText(c, c.getString(stringId), Toast.LENGTH_SHORT).show();
        } catch (Throwable t) {
        }
    }

    private static SharedPreferences prefs() {
        Context c = Y1Application.Companion.getAppContext();
        return c == null ? null : c.getSharedPreferences("innioasis_plus", 0);
    }

    /** Stock's contract: a non-positive size decodes as is. */
    private static Bitmap decode(File f, int w, int h) {
        if (w <= 0 || h <= 0) return BitmapFactory.decodeFile(f.getAbsolutePath());
        BitmapFactory.Options o = new BitmapFactory.Options();
        o.inJustDecodeBounds = true;
        BitmapFactory.decodeFile(f.getAbsolutePath(), o);
        o.inSampleSize = sample(o.outWidth, o.outHeight, w, h);
        o.inJustDecodeBounds = false;
        return BitmapFactory.decodeFile(f.getAbsolutePath(), o);
    }

    /**
     * Stock's {@code calculateInSampleSize}, exactly: it stays AT OR ABOVE the requested size, so
     * the resize that follows is a downscale. "Halve until no bigger" overshoots a step, and
     * {@code Cover.square}/{@code fitCover} then blow the result up — blurry covers.
     */
    static int sample(int srcW, int srcH, int w, int h) {
        int s = 1;
        if (srcH > h || srcW > w) {
            int halfH = srcH / 2;
            int halfW = srcW / 2;
            while (halfH / s >= h && halfW / s >= w) s *= 2;
        }
        return s;
    }
}
