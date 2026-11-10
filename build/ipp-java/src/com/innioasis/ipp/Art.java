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
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.List;
import java.util.Set;

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
            if (f == null) return null;
            stampRead(path);
            return decode(f, w, h);
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
                stampRead(path);
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

    // A replaced cover FILE changes no mtime the library knows, so a folder's cover files are
    // stamped (name, mtime, length) in ipp_art.txt at the moment one of them is read into a cache.
    // A stamp therefore lives exactly as long as the pictures it vouches for: no stamp means
    // nothing of that folder's files is cached, and "Clear cache" (covers) drops both together.
    // The manual pick lives in the preferences and survives.

    private static final char SEP = '\t';

    /** folder path -> stamp of every cover file serving it. */
    private static final Hashtable stamps = new Hashtable();
    /** Folders answered in this run. */
    private static final Hashtable seen = new Hashtable();
    private static boolean stampsLoaded;
    private static boolean stampsDirty;
    private static boolean saveAsked;
    private static final long SAVE_DELAY_MS = 5000L;

    /** A cover file serving this song's folder is being read into a cache. */
    public static void stampRead(String songPath) {
        try {
            String dir = Albums.trackFolder(songPath);
            if (dir == null || dir.length() == 0) return;
            loadStamps();
            if (stamps.containsKey(dir)) return;
            String now = stamp(dir);
            if (now.length() == 0) return;
            boolean ask;
            synchronized (Art.class) {
                stamps.put(dir, now);
                stampsDirty = true;
                ask = !saveAsked;
                saveAsked = true;
            }
            if (ask) Albums.later(new Save(), SAVE_DELAY_MS);
        } catch (Throwable t) {
        }
    }

    static final class Save implements Runnable {
        public void run() { saveStamps(); }
    }

    /**
     * The cover files of this song's folder were replaced or removed since they were read. Once
     * per FOLDER per run. A folder with no stamp has nothing cached, so it has nothing to drop.
     */
    public static boolean coverChanged(String songPath) {
        try {
            String dir = Albums.trackFolder(songPath);
            if (dir == null || dir.length() == 0) return false;
            Object hit = seen.get(dir);
            if (hit != null) return ((Boolean) hit).booleanValue();

            loadStamps();
            String had = (String) stamps.get(dir);
            boolean changed = false;
            if (had != null) {
                String now = stamp(dir);
                changed = !now.equals(had);
                // dropped, not rewritten: the next read stamps what it reads
                if (changed) {
                    synchronized (Art.class) {
                        stamps.remove(dir);
                        stampsDirty = true;
                    }
                }
            }
            seen.put(dir, Boolean.valueOf(changed));
            return changed;
        } catch (Throwable t) {
            return false;
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

    /** Stamps of folders no song is in any more: their weight, and gone when {@code drop}. */
    static long prune(Set folders, boolean drop) {
        loadStamps();
        long n = 0L;
        synchronized (Art.class) {
            ArrayList gone = new ArrayList();
            Enumeration e = stamps.keys();
            while (e.hasMoreElements()) {
                String k = (String) e.nextElement();
                if (folders.contains(k)) continue;
                gone.add(k);
                n += Stale.line(k, (String) stamps.get(k));
            }
            if (!drop || gone.isEmpty()) return n;
            for (int i = 0; i < gone.size(); i++) stamps.remove(gone.get(i));
            stampsDirty = true;
        }
        saveStamps();
        return n;
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

    private static synchronized void loadStamps() {
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

    private static synchronized void saveStamps() {
        saveAsked = false;
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
    static final String PICK = "thumb";

    /** Null too when the pinned song is gone: back to the automatic thumbnail. */
    private static String picked(String albumKey) {
        try {
            String key = Albums.coverKey(albumKey);
            if (key == null) return null;
            SharedPreferences p = Prefs.file();
            if (p == null) return null;
            String pick = p.getString(PICK + key, null);
            if (pick == null || !new File(pick).isFile()) return null;
            return pick;
        } catch (Throwable t) {
            return null;
        }
    }

    /** The pinned song's path, null when none: Cover Flow draws the album from it too. */
    public static String pickedPath(String albumKey) {
        return picked(albumKey);
    }

    /**
     * Cover Flow's "Set as album cover" and "Reset cover": the very pick the thumbnail has, so
     * either menu changes both pictures and either "Reset" clears it. Null path resets.
     */
    public static boolean pin(String albumKey, String path) {
        try {
            String key = Albums.coverKey(albumKey);
            SharedPreferences p = Prefs.file();
            if (key == null || p == null) return false;
            if (path == null) p.edit().remove(PICK + key).commit();
            else p.edit().putString(PICK + key, path).commit();
            CoverCache.forget(key);
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    public static boolean hasPick(String albumKey) {
        try {
            String key = Albums.coverKey(albumKey);
            SharedPreferences p = Prefs.file();
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

        SharedPreferences p = Prefs.file();
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
        SharedPreferences p = Prefs.file();
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
