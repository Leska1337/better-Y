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
 * #291.1 — external cover art from files.
 *
 * Stock only ever reads the artwork embedded in the tags ({@code Other.getAlbumCover}); when a
 * track has none, the whole app shows no cover at all. This class is the fallback, hooked into the
 * one place that decides "no cover": the null-return path of {@code Other.getAlbumCover}. Every
 * consumer therefore inherits it — the 50px list thumbnails ({@code CoverCache}), the 300px
 * Now-Playing cover ({@code BigCover}), {@code Ipp.bigCover} and the stock search rows — and it is
 * cached by whatever cache the caller already has. Embedded artwork keeps priority: we are only
 * ever asked after the tags came up empty.
 *
 * <h3>Where a cover file is looked for</h3>
 * <ul>
 *   <li>{@code cover.jpg|jpeg|png} — <b>only</b> in the track's own folder. It covers the songs
 *       sitting next to it and is not inherited by subfolders.</li>
 *   <li>{@code folder.jpg|jpeg|png} — in the track's folder and in <b>every</b> parent folder, up
 *       to the filesystem root. So {@code …/The Marshall Mathers LP/folder.jpg} serves the songs of
 *       that folder and of everything nested under it ({@code CD1/}, {@code CD1/whatever/}, …),
 *       whatever those subfolders are called.</li>
 * </ul>
 * The nearer folder always wins, and {@code cover} beats {@code folder} within one folder.
 *
 * <h3>Why the walk is not slow</h3>
 * Three layers keep it off the hot path:
 * <ol>
 *   <li>It runs <b>only when there is no embedded artwork</b> — a tagged library never enters here.</li>
 *   <li>{@link #chain} memoises the {@code folder.*} answer <b>per directory</b>, including the
 *       "nothing anywhere above" answer, and it memoises every directory it walked through on the
 *       way. So a whole tree costs at most one stat per folder per run, not one per song.</li>
 *   <li>The bitmap itself is cached by the caller ({@code CoverCache}/{@code BigCover} keep both the
 *       covers found and the "no cover" answers, in memory and as JPEGs on disk).</li>
 * </ol>
 * The memo is dropped from {@code Ipp.libraryChanged}, i.e. whenever the Song table is written —
 * the same event that forgets the caches' "no cover" answers, so a cover file added later is picked
 * up by the next scan / "Update library" instead of being remembered as absent for good.
 */
public final class Art {

    private Art() { }

    /** Basenames tried in the track's own folder, in priority order. */
    private static final String[] OWN = {
        "cover.jpg", "cover.jpeg", "cover.png",
        "folder.jpg", "folder.jpeg", "folder.png",
    };

    /**
     * Same, for an album's list thumbnail — where the priority is reversed, {@code folder} first.
     * A track's own artwork is about that track; an album's thumbnail is about the album, and
     * {@code folder.jpg} is the picture that was put there to stand for the whole folder. See
     * {@link #thumb}.
     */
    private static final String[] OWN_THUMB = {
        "folder.jpg", "folder.jpeg", "folder.png",
        "cover.jpg", "cover.jpeg", "cover.png",
    };

    /** Basenames tried in a parent folder — {@code cover.*} is deliberately not inherited. */
    private static final String[] UP = {
        "folder.jpg", "folder.jpeg", "folder.png",
    };

    /** Memo value standing for "no folder.* here nor anywhere above" (Hashtable forbids nulls). */
    private static final String NONE = "";

    /** directory path -> the folder.* serving it (inherited from above), or {@link #NONE}. */
    private static final Hashtable chain = new Hashtable();

    /**
     * The external cover for a song, decoded at roughly {@code w}x{@code h}, or null.
     * Called from the null-return path of stock {@code Other.getAlbumCover}, with that method's
     * own arguments — so the sampling matches what the caller asked for.
     */
    public static Bitmap external(String path, int w, int h) {
        try {
            File f = file(path);
            return f == null ? null : decode(f, w, h);
        } catch (Throwable t) {
            return null;
        }
    }

    /** The cover file serving a song, or null. */
    public static File file(String path) {
        return file(path, OWN);
    }

    private static File file(String path, String[] own) {
        if (path == null) return null;
        int i = path.lastIndexOf('/');
        if (i <= 0) return null;
        File dir = new File(path.substring(0, i));

        // The track's own folder, in the caller's priority order.
        for (int k = 0; k < own.length; k++) {
            File c = new File(dir, own[k]);
            if (c.isFile()) return c;
        }
        // Above it: folder.* only, nearest first.
        String up = chain(dir.getParentFile());
        return up == null || up.length() == 0 ? null : new File(up);
    }

    /**
     * An album's list thumbnail. Called from {@code CoverCache.get}, i.e. on a cache miss only —
     * once per album.
     *
     * <b>A song pinned by the user wins outright</b> ("Set as album thumbnail"): its own artwork is
     * read the way a track's cover is read anywhere else — the tags first, then a cover file next
     * to it. Anything less makes the pick a no-op in a folder that has a {@code folder.jpg}, since
     * pinning changes which <i>song</i> is read and the automatic order below never gets that far.
     *
     * Automatically, the order is <b>{@code folder.*} → {@code cover.*} → the artwork embedded in
     * the song</b> — the opposite of a track's own cover ({@link #external}, which only ever runs
     * after the tags came up empty). The row stands for the whole album, and a {@code folder.jpg}
     * sitting next to the files was put there to be exactly that, while the embedded picture
     * belongs to whichever single song the cache happened to ask about.
     */
    public static Bitmap thumb(String albumKey, String path, int size) {
        String pick = picked(albumKey);
        if (pick != null) {
            Bitmap b = pickedArt(pick, size);
            if (b != null) return b;
            // the pinned song turned out to have no artwork at all -- rather than show nothing,
            // fall through to what the album would have shown anyway
        }
        try {
            File f = file(path, OWN_THUMB);
            if (f != null) {
                Bitmap b = decode(f, size, size);
                if (b != null) return b;
            }
        } catch (Throwable t) {
            // fall through to the embedded artwork
        }
        if (path == null) return null;
        byte[] hint = hintFor(path);
        if (hint != null) return decode(hint, size, size);
        return Other.INSTANCE.getAlbumCover(path, size, size);
    }

    // ------------------------------------------------- artwork the caller has already read
    //
    // "Cache library" opens each album's representative file once and takes the album artist, the
    // year and the embedded picture out of that one open. The thumbnail is built by CoverCache,
    // which ends up here — and the last step of {@link #thumb} is stock's getAlbumCover, i.e. a
    // second open of the very same file. So the caller leaves the bytes here first.
    //
    // Only the LAST step is replaced: a pinned song and the external cover files still win, exactly
    // as they do without a hint. The hint is matched by path, so a UI thread asking about another
    // song never sees it — and one asking about this song would get the same picture anyway.

    /**
     * Per THREAD, not per class: the caching pass runs several album workers at once, and each has
     * its own file open. A static pair of fields would hand one worker's picture to another.
     */
    private static final ThreadLocal hint = new ThreadLocal();
    /** "Read, and this file has no embedded picture" — an answer, so no second open follows it. */
    private static final byte[] NO_ART = new byte[0];

    /** One thread's parked artwork: {@code [path, bytes]}. */
    private static final class Hint {
        String path;
        byte[] art;
    }

    /** Park the artwork of {@code path} for the next {@link #thumb} about it; null path clears. */
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

    /** True when the automatic thumbnail comes from the song's own tags, i.e. a hint is worth reading. */
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

    /**
     * The pinned song's own cover, read exactly as a track's cover is read everywhere else:
     * {@code getAlbumCover} is the tags, and its null path falls back to {@link #external}
     * (#291.1), i.e. a cover file beside the song.
     */
    private static Bitmap pickedArt(String pick, int size) {
        try {
            return Other.INSTANCE.getAlbumCover(pick, size, size);
        } catch (Throwable t) {
            return null;
        }
    }

    /**
     * The {@code folder.*} serving {@code dir} — its own, or the nearest one above it. Memoised for
     * every directory on the way, so the second song of an album (and every song of every sibling
     * album under a shared folder.jpg) answers from the table.
     */
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
     * Forget where the cover files are. Called from {@code Ipp.libraryChanged}, i.e. once per file
     * during a full scan — it must stay this cheap. The cover stamps below are NOT dropped here for
     * exactly that reason; they belong to "Clear cache" ({@link #clearStamps}).
     */
    public static void clear() {
        chain.clear();
    }

    // ---------------------------------------------- noticing a replaced external cover file
    // ("Update library", #3)
    //
    // A tag edit — including new embedded artwork — bumps the audio file's mtime, and that is what
    // "Update library" already watches: such a song is re-read and Ipp.songChanged drops its album's
    // cached pictures. An external cover.jpg / folder.jpg is a different file entirely, so replacing
    // it changes nothing the song rows can see, and the old thumbnail was served until the whole
    // cache was cleared by hand. So the button now also watches the cover FILE, per folder: its
    // path, mtime and length are written down beside the other caches, and a folder whose stamp no
    // longer matches has its pictures forgotten — the thumbnail, the album representative and the
    // per-track covers. The user's manual pick ("Set as album thumbnail") lives in the preferences,
    // not in a cache, so it survives untouched: only the picture behind it is re-read.

    private static final char SEP = '\t';

    /** folder path -> stamp of every cover file serving it. */
    private static final Hashtable stamps = new Hashtable();
    /** Folders already answered in this run, so a 100-song album costs one look. */
    private static final Hashtable seen = new Hashtable();
    private static boolean stampsLoaded;
    private static boolean stampsDirty;

    /**
     * True when the external artwork serving this song has changed since the last "Update library".
     *
     * Worked out once per FOLDER and remembered for the rest of the run — every song of an album
     * needs the same answer. A folder that has never been stamped and does have a cover file counts as
     * changed: we cannot know, and re-reading one album's picture is cheaper than showing the wrong
     * one until someone clears the cache. A folder with no cover file at all is never "changed" on
     * that account — an added one is picked up by {@code CoverCache.clearMiss} anyway.
     */
    public static boolean coverChanged(String songPath) {
        return coverState(songPath) != COVER_SAME;
    }

    /** The folder's artwork is the same as it was written down. */
    public static final int COVER_SAME = 0;
    /**
     * The folder has a cover file and no stamp yet — a folder the library has never been through.
     * Its pictures are re-read like a changed one, but it is NOT a change the user made: counting
     * it as one made "Update library" report every freshly scanned song as updated.
     */
    public static final int COVER_NEW = 1;
    /** The cover file behind this folder was replaced or removed since the last pass. */
    public static final int COVER_CHANGED = 2;

    /**
     * As {@link #coverChanged}, but tells a first look at a folder apart from a real change.
     * Answered once per FOLDER and remembered for the rest of the run.
     */
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
                // No cover file here nor above. Nothing to remember — writing down "nothing" for
                // every folder of the library is what made this file bigger than the caches it is
                // supposed to describe. It is only a change if there used to be one.
                state = had != null ? COVER_CHANGED : COVER_SAME;
                if (had != null) {
                    stamps.remove(dir);
                    stampsDirty = true;
                }
            } else if (had == null) {
                state = COVER_NEW;                // never seen: re-read it, but it is not a change
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

    /** Write the stamps down once, at the end of the pass. */
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
            // ignore
        }
    }

    /**
     * Everything that could serve this folder as a cover, as one string: the files inside it, in a
     * fixed order, plus the {@code folder.*} inherited from above. Name, mtime and length of each —
     * a replaced picture changes at least one of the last two.
     */
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
            // The inherited file's own path is deliberately NOT part of the stamp: it can be a very
            // long absolute path, this is written once per folder, and a different file above would
            // have to match both mtime and length to slip through.
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
            // an unreadable stamp file is an empty one: one pass re-reads some covers
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
            // keep them in memory for this run
        }
    }

    // ------------------------------------------------- manual album thumbnail ("Set as album
    // thumbnail" in an album's song menu)

    /**
     * An album's list thumbnail is read from whichever of its songs the cover cache happens to be
     * asked about first — fine when the album's artwork is uniform, useless when it is not. This
     * lets the user point at one song and say "this one is the album".
     *
     * The pick is stored in the ipp preferences rather than merely written into the cover cache,
     * so it survives "Clear cache", a library rescan and a reboot. It is keyed by the encoded
     * album string ({@code name<SOH>folder}, {@code Albums.keyOf}) — the very key the thumbnail
     * cache uses, so a same-named album in another folder keeps its own pick.
     */
    private static final String PICK = "thumb";

    /**
     * The song the user pinned as this album's thumbnail, or null — for an album with no pick, and
     * for one whose pinned song has since been deleted (then the album quietly goes back to its
     * automatic thumbnail rather than showing nothing).
     */
    private static String picked(String albumKey) {
        try {
            // canonical key: the same album is asked about under a plain name from Genres and
            // under a folder-encoded one from Albums -- see albumKey() below
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

    /** Whether the user has pinned a song as this album's thumbnail. */
    public static boolean hasPick(String albumKey) {
        try {
            String key = Albums.coverKey(albumKey);
            SharedPreferences p = prefs();
            return key != null && p != null && p.getString(PICK + key, null) != null;
        } catch (Throwable t) {
            return false;
        }
    }

    /**
     * The album key of the row the wheel is on in an album list, or null.
     *
     * <b>One pick per album, whichever section it was made in.</b> The Albums screen puts
     * FOLDER-ENCODED names into its rows; the Genres screen puts PLAIN ones into the very same
     * adapter. So every read and every write of a pick goes through {@code Albums.coverKey} - the
     * canonicalisation the cover, year and album-artist caches already apply. An encoded name comes
     * back untouched (the Albums screen pays nothing, not even a lookup), a plain one is encoded
     * when it belongs to exactly one folder. A name shared by several folders is one row in Genres
     * but several in Albums, so there is no single album to point at and it keeps its own key -
     * the same rule, and the same limit, the thumbnail cache itself has.
     */
    public static String albumKey(MyBaseAdapter albums) {
        if (albums == null) return null;
        Object o = albums.getItem(albums.getPosition());
        return (o instanceof Album) ? Albums.coverKey(((Album) o).getName()) : null;
    }

    /**
     * Make the focused (or single selected) song of an album's song list the album's thumbnail.
     * Returns true when something was picked.
     */
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

    /**
     * Drop the pinned thumbnail of the focused album, so it goes back to the automatic one.
     * Returns true when there was something to reset.
     */
    public static boolean resetThumb(MyBaseAdapter albums) {
        String key = albumKey(albums);
        if (key == null) return false;
        SharedPreferences p = prefs();
        if (p == null) return false;
        if (p.getString(PICK + key, null) == null) return false;
        p.edit().remove(PICK + key).commit();
        // longConfirm selected the row to open the menu on; leave the list as we found it
        List sel = albums.getSelectedIndexList();
        if (sel != null) sel.clear();
        repaint(albums, key, null);
        toast(R.string.ipp_thumb_reset);
        return true;
    }

    /**
     * Put the album's new thumbnail on screen right away.
     *
     * There are <b>three</b> caches in front of an album row, and forgetting only the first left
     * the old picture on screen until the Albums screen was rebuilt from scratch: the JPEG/memory
     * entry in {@link CoverCache}, and the Bitmap held by the {@code Album} model object itself —
     * which is what {@code AlbumListAdapter.getView} falls back to, and it only re-reads the cache
     * when that field is null. (That was the "empty frame, then the old cover" flicker: the row
     * drew the default placeholder, then the background thread put {@code album.getBitmap()} back.)
     *
     * So: forget the cache entry, then re-read it synchronously — one 50px decode on a menu
     * action, which is cheap and avoids a second flicker — and hand the result to the model object
     * before repainting.
     */
    private static void repaint(MyBaseAdapter albums, String key, String path) {
        CoverCache.forget(key);        // memory entry, "no cover" answer and the cached JPEG
        if (albums == null) return;
        for (int i = 0; i < albums.getCount(); i++) {
            Object o = albums.getItem(i);
            if (!(o instanceof Album)) continue;
            Album al = (Album) o;
            // the row may carry a plain name (Genres) where the key is encoded (Albums)
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
            // a missing context must not undo the pick
        }
    }

    private static SharedPreferences prefs() {
        Context c = Y1Application.Companion.getAppContext();
        return c == null ? null : c.getSharedPreferences("innioasis_plus", 0);
    }

    /**
     * Same downsampling contract as stock {@code Other.getAlbumCover}: a non-positive size means
     * "decode as is", otherwise sub-sample by a power of two.
     */
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
     * <b>Byte-for-byte the rule stock uses</b> ({@code Other.calculateInSampleSize}) — the whole
     * point of this class is that an external cover goes through the same pipeline as an embedded
     * one, and the sampling is the one step where "roughly the same" is visible.
     *
     * The obvious formulation ("halve until the image is no bigger than asked for") overshoots by
     * one step: it stops at the first size <i>below</i> the requested one, and everything after it
     * — {@code Ipp.square}, {@code Ipp.fitCover} — then scales that back <i>up</i> to 50 / 300 px.
     * A 500x500 {@code folder.jpg} decoded to 31x31 and blown up to a 50px thumbnail is exactly the
     * "external covers are blurry" report; the same file reached the player as 250x250 stretched to
     * 300, and a wide cover lost its crop into the bargain (the centre crop was taken from a source
     * a quarter of the width it should have been). Stock's rule stops one step earlier, i.e. always
     * at or above the requested size, so the resize that follows is a downscale.
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
