package com.innioasis.ipp;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;

import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.service.PlayerService;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * The Now-Playing cover: memory cache + a JPEG file cache under {@code getCacheDir()}.
 *
 * ONE COVER PER TRACK, ONE FILE PER ALBUM
 *
 * The memory key is the track PATH, not its folder. A folder key is wrong as soon as two songs
 * sitting in one folder carry different artwork — a folder of singles, a compilation, or a folder
 * where one song has an embedded cover and its neighbour falls back to {@code folder.jpg}:
 * whichever song is opened first would define the cover for all of them.
 *
 * The disk still holds roughly one file per album:
 *   - The first track opened in a folder writes its cover under the folder key — the
 *       album's representative.
 *   - Every later track is compared against that representative ({@link Bitmap#sameAs}), which is
 *       true for an ordinary album. It then simply shares that one Bitmap: no second entry on
 *       disk, no second allocation in memory, and {@code Cover.fitMemo}/{@code Cover.reflect} keep
 *       hitting their memo because the object identity is unchanged.
 *   - Only a track whose artwork genuinely differs gets a file of its own.
 *
 * THE ANSWER PER TRACK IS WRITTEN DOWN ({@link #note})
 *
 * For the overwhelming majority of tracks there is nothing to put on disk, only the one bit
 * "this track shares the album's picture" — and kept in memory alone that bit dies with the
 * process, so after a reboot (or a theme switch, which kills the process) every track has to have
 * its tags read again before its cover can be shown, and "Cache library" can pre-fill nothing for
 * the player. So it is a small text file beside {@code ipp_discs.txt} mapping a track path to one
 * of {@link #NONE} / {@link #SHARED} / {@link #OWN}: the per-track guarantee survives a restart at
 * one line per song instead of one JPEG per song.
 *
 * RESOLUTION
 *
 * {@link #SIZE} is a cap, not a target: a cover that is already smaller is kept at its own
 * resolution and only compressed, because scaling 200x200 up to 300x300 stores (and displays) a
 * blurred version of a picture we have in full. Anything larger is scaled down to 300.
 * The crop is the same either way — {@code Ipp.square} fits by height and centre-crops the width,
 * and at the source's own height that fit is a no-op, so only the crop happens. The JPEG quality
 * follows from that same side: see {@link #quality}.
 *
 * To keep the tag read off the eye, {@link #prefetch} starts it the moment the song is picked in a
 * menu and {@link #prefetchPlaying} on every track change, so the read overlaps the player's own
 * ~200 ms of construction and layout instead of showing up as an empty cover frame afterwards.
 * The 50px list thumbnails are untouched — there, one cover per album is the intended behaviour.
 */
public final class BigCover {

    private BigCover() { }

    private static final int SIZE = 300;
    /**
     * The compression scheme's version marker: the sweep in {@link #dir} deletes every cached file
     * that does not end with this, so changing the scheme means changing this string and the old
     * files go on the first run. Quality is not part of a file name, so without that a changed
     * setting stays invisible until the user clears the cache by hand.
     */
    private static final String SUFFIX = "-300q.jpg";

    // ---- how hard a cover may be compressed -----------------------------------------------------
    //
    // The target is a FILE WEIGHT, not a quality number: the quality that reaches a given weight
    // depends entirely on the picture, and it is the weight that has to be bounded. So the encoder
    // is run at the highest quality whose output still fits {@link #LIMIT}, which by construction is
    // also the one that lands closest to it from below.
    //
    // The bounds are given on the PHOTOSHOP scale in the request (65..90) and are NOT the same
    // numbers here. Android compresses through libjpeg with the standard quantisation tables;
    // Photoshop's "Save for Web" uses its own, considerably gentler ones, so the same number is a
    // different picture — libjpeg 65 looks about like Photoshop 45..55. These two constants are the
    // libjpeg equivalents of Photoshop 65 and 90; change them, not the comment, if the anchor moves.
    private static final int Q_MIN = 76;       // ~ Photoshop 65
    private static final int Q_MAX = 92;       // ~ Photoshop 90

    /**
     * The most a cached cover may weigh. A source that already fits is stored verbatim —
     * whatever its pixel size — so an already-compressed cover is never compressed a second time;
     * {@link #peek} caps the decode instead, which is where the pixel size actually matters.
     */
    private static final int LIMIT = 25 * 1024;

    /** key (track path or folder) -> Bitmap. Same-artwork tracks share one entry's Bitmap. */
    private static final Hashtable mem = new Hashtable();

    /** key -> key, for "there is no cover here", so a coverless track is not re-read. */
    private static final Hashtable miss = new Hashtable();

    private static boolean swept;

    /** Guards the read-and-store path in {@link #track} against two background readers at once. */
    private static final Object LOCK = new Object();

    // ---------------------------------------------------------------- public API

    /**
     * The cover of one track, reading and caching it if needed. The only entry point the player
     * uses ({@code Ipp.bigCover}, from the background coroutine).
     */
    public static Bitmap track(String path) {
        if (path == null) return null;
        Bitmap hit = peekTrack(path);
        if (hit != null) return hit;
        if (miss.containsKey(path)) return null;

        // Two background readers can want the same track at once — the prefetch below and the
        // player's own async load. Serialising them means the second one finds the answer in
        // memory instead of decoding the same file again. Only ever called off the main thread.
        synchronized (LOCK) {
            hit = peekTrack(path);
            if (hit != null) return hit;
            if (miss.containsKey(path)) return null;

            String folder = Albums.trackFolder(path);
            if (note(path) == NONE) { miss.put(path, path); return null; }

            Src src;
            try {
                src = read(path);
            } catch (Throwable t) {
                src = null;
            }
            if (src == null) {
                miss.put(path, path);
                noteSet(path, NONE);
                return null;
            }
            Bitmap fresh = src.bmp;

            Bitmap rep = peek(folder);
            if (rep == null) {
                // First track seen in this folder: it becomes the album's representative.
                store(folder, src);
                mem.put(path, fresh);
                noteSet(path, SHARED);
                return fresh;
            }
            if (same(rep, fresh)) {
                mem.put(path, rep);        // share the representative; nothing new on disk
                noteSet(path, SHARED);
                return rep;
            }
            store(path, src);              // genuinely different artwork -> its own entry
            mem.put(path, fresh);
            noteSet(path, OWN);
            return fresh;
        }
    }

    /**
     * Warm the cache for the song that is about to be opened, from the moment it is picked in a
     * menu ({@code PlayerService.setMusicPlaylist}). The player Activity still has to be created,
     * inflated and laid out — a couple of hundred milliseconds — so this head start is usually
     * enough for {@code Ipp.instantCover} to find the cover already there and paint it with the
     * first frame.
     *
     * Why this and not a stand-in: painting the album's own cover instantly and swapping it when
     * the track's real one arrives is wrong for a track whose artwork differs. Reading early is the
     * only way to be both instant and right; it costs nothing when the track is already cached, and
     * nothing on the main thread either way.
     */
    public static void prefetch(List playlist, int pos) {
        try {
            if (playlist == null || pos < 0 || pos >= playlist.size()) return;
            Object o = playlist.get(pos);
            if (!(o instanceof Song)) return;
            warm(((Song) o).getPath());
        } catch (Throwable t) {
            // a cover is never worth failing playback for
        }
    }

    /**
     * Same head start for a track the user switched to by hand while a list is on screen.
     *
     * {@link #prefetch} only fires from {@code setMusicPlaylist} / {@code setAudiobookPlaylist},
     * i.e. when a song is opened from a menu — the side buttons never go through those, so
     * skipping a few tracks in a list and then opening the player found nothing cached and the
     * cover popped in late. Called from {@code ListWatch.onReceive}, which already listens for
     * {@code MY_PLAY_SONG}.
     *
     * {@code getPlayingSong} rather than {@code getPlayingMusic}: it answers with whichever of the
     * two is actually playing, so an audiobook gets the same head start.
     */
    public static void prefetchPlaying() {
        try {
            PlayerService s = Y1Application.Companion.getPlayerService();
            Song song = s == null ? null : s.getPlayingSong();
            warm(song == null ? null : song.getPath());
        } catch (Throwable t) {
            // ignore
        }
    }

    /**
     * Start the background read unless the answer is already in memory. Deliberately checks
     * {@code mem} and not {@link #peek} — peek decodes the cached JPEG, and both callers are on the
     * main thread; letting the worker do that read costs nothing and keeps the caller free.
     */
    private static void warm(String path) {
        if (path == null || mem.get(path) != null || miss.containsKey(path)) return;
        new Thread(new Warm(path)).start();
    }

    /** Named (d8 here crashes on anonymous classes). */
    static final class Warm implements Runnable {
        private final String path;
        Warm(String path) { this.path = path; }
        public void run() {
            try {
                track(path);
            } catch (Throwable t) {
                // ignore
            }
        }
    }

    /**
     * Cover for the instant paint: strictly what we already have for this exact track.
     * Never reads tags, so it is safe on the UI thread.
     *
     * It deliberately does not fall back to the album's representative as a guess. It does
     * hand back that very bitmap for a track {@link #note}d as {@link #SHARED} — but that is not a
     * guess, it is a recorded pixel comparison, which is the whole reason the note is persisted.
     */
    public static Bitmap peekTrack(String path) {
        if (path == null) return null;
        Bitmap b = peek(path);
        if (b != null) return b;
        if (note(path) != SHARED) return null;
        b = peek(Albums.trackFolder(path));
        if (b != null) mem.put(path, b);
        return b;
    }

    /**
     * Memory, then the "no cover" answers, then the JPEG file cache.
     *
     * The decode is CAPPED and cropped here, not only when the cover was written: a source that
     * already met the weight budget is stored untouched, so the file may be any resolution and any
     * aspect ratio. Doing it on the way out keeps the picture identical to what {@code read}
     * produced for the same bytes — which is what lets {@code same()} still recognise two tracks as
     * sharing one album's artwork.
     */
    public static Bitmap peek(String key) {
        if (key == null) return null;
        Object hit = mem.get(key);
        if (hit != null) return (Bitmap) hit;
        if (miss.containsKey(key)) return null;
        Bitmap b = null;
        try {
            File f = file(key);
            if (f != null && f.exists()) {
                String p = f.getAbsolutePath();
                BitmapFactory.Options o = new BitmapFactory.Options();
                o.inJustDecodeBounds = true;
                BitmapFactory.decodeFile(p, o);
                if (o.outWidth > 0 && o.outHeight > 0) {
                    o.inSampleSize = Art.sample(o.outWidth, o.outHeight, SIZE, SIZE);
                    o.inJustDecodeBounds = false;
                    b = square(BitmapFactory.decodeFile(p, o));
                }
            }
        } catch (Throwable t) {
            b = null;
        }
        if (b != null) mem.put(key, b);
        return b;
    }

    /**
     * Drop one key — memory, the "no cover" answer, the written-down per-track answer and the JPEG
     * on disk. Called per song from {@code Ipp.songChanged} (the "Update library" path) for both
     * the track and its folder, so replaced artwork is actually re-read instead of being served
     * from the cache.
     */
    public static void forget(String key) {
        if (key == null) return;
        mem.remove(key);
        miss.remove(key);
        noteForget(key);
        try {
            File f = file(key);
            if (f != null) f.delete();
        } catch (Throwable t) {
            // nothing to do
        }
    }

    /** Forget only the "no cover here" answers, keeping the covers we did find. */
    public static void clearMiss() {
        miss.clear();
        noteForgetNone();
    }

    /** Wipe everything, memory and disk ("Clear cache" in Settings). */
    public static void clear() {
        mem.clear();
        miss.clear();
        noteClear();
        try {
            File d = dir();
            if (d == null) return;
            File[] fs = d.listFiles();
            if (fs == null) return;
            for (int i = 0; i < fs.length; i++) fs[i].delete();
            d.delete();
        } catch (Throwable t) {
            // nothing to do
        }
    }

    // ---------------------------------------------------------------- "Cache library"

    /**
     * One folder being walked, and its representative — the ONLY picture a walk holds.
     *
     * An object per walk, not three statics: the caching pass is several threads, each taking whole
     * folders at a time, and a representative belongs to a FOLDER rather than to the pass — two
     * workers in two folders must not see each other's. Everything else the
     * walk touches is already safe for that — {@code mem}/{@code miss} are Hashtables, the notes are
     * synchronized, and the JPEGs are written under keys no two folders share.
     */
    public static final class Walk {
        private String folder;
        private byte[] raw;        // the representative's own file bytes, when read in this pass
        private Bitmap rep;        // decoded — only when a track's bytes actually differ

        /** Done with this folder: let go of the representative (it is on disk, not in memory). */
        public void done() {
            if (folder != null) mem.remove(folder);
            folder = null;
            raw = null;
            rep = null;
        }
    }

    /** True while a caching pass is running, so the notes are written once instead of per song. */
    private static volatile boolean passing;

    /** True while this track's cover has never been looked at; decides whether its tags need reading. */
    public static boolean needs(String path) {
        return note(path) == UNKNOWN;
    }

    /**
     * True only when this track is already KNOWN to have no artwork at all — a recorded answer
     * rather than a guess, the same note {@link #peekTrack} trusts — which lets the player paint
     * its placeholder
     * the moment the song starts instead of waiting for the async read to come back empty
     * ({@code Cover.instantBlank}). UNKNOWN says nothing, so a track nobody has read yet keeps
     * the old behaviour rather than being shown a placeholder it may not need.
     */
    /**
     * This track carries artwork of its OWN, different from its folder's representative.
     * The search row asks so it can show the song's picture rather than the album's; the answer is
     * the persisted note, so it costs a map lookup once the track has been read (by the player, the
     * prefetch or "Cache library").
     */
    public static boolean ownArt(String path) {
        return note(path) == OWN;
    }

    public static boolean knownNone(String path) {
        return note(path) == NONE;
    }

    /**
     * Fill the cache for one track from "Cache library" ([Tools] in better-Y), so the player
     * never has to read a tag while the user is waiting for it.
     *
     * Two things separate this from {@link #track}. The answer is written down for every song,
     * which is what makes the pass worth anything after a restart — for most tracks there is
     * nothing to put on disk, only the note that they share their album's picture. And nothing
     * is kept in memory beyond the album currently being walked: a 300px cover is ~360 KB
     * decoded, so a few hundred albums of them would be hundreds of megabytes and the pass would
     * run out of memory long before it finished. The representative is held in a field rather than
     * read back through {@link #peek}, because what is on disk is a lossy JPEG and comparing a
     * fresh decode against a re-decoded JPEG never matches — the caller feeds this the library
     * ordered by path, so a folder's songs arrive together and one held representative is enough.
     *
     * The artwork comes from the caller ({@code DiscCache.readTrack}), which already had the file
     * open for the disc and track numbers; only a track with no embedded picture is looked up on
     * disk here. Between that and the byte comparison below, an ordinary album now costs one file
     * open per song and one decode per album — and often not even that.
     *
     * Never call from the UI thread.
     */
    public static void cache(Walk w, String path, byte[] embedded) {
        if (path == null || w == null) return;
        try {
            if (note(path) != UNKNOWN) return;          // answered by an earlier pass
            String folder = Albums.trackFolder(path);
            if (w.folder != null && !w.folder.equals(folder)) w.done();
            w.folder = folder;

            byte[] raw = embedded != null && embedded.length > 0 ? embedded : external(path);
            if (raw == null || raw.length == 0) { noteSet(path, NONE); return; }

            // The cheap answer, and the one that applies to nearly every track: an album's songs
            // carry the very same picture BYTE FOR BYTE, so the comparison the cache needs can be
            // made without decoding anything at all — neither this track's artwork nor the
            // representative's. Decoding both and comparing pixels ({@link #same}) would be that work for
            // every song of every album.
            if (w.raw != null && Arrays.equals(w.raw, raw)) {
                noteSet(path, SHARED);
                return;
            }

            if (w.raw == null && w.rep == null) {
                Bitmap onDisk = peek(folder);
                if (onDisk == null) {
                    w.rep = storeSrc(folder, raw);      // this album's representative
                    w.raw = raw;
                    noteSet(path, SHARED);
                    return;
                }
                w.rep = onDisk;                         // written by an earlier pass or the player
            }

            // Genuinely different bytes. Only here is anything decoded — and the representative
            // only if it was stored verbatim and so never was.
            Bitmap fresh = capped(raw);
            if (fresh == null) { noteSet(path, NONE); return; }
            if (w.rep == null) w.rep = capped(w.raw);
            if (same(w.rep, fresh)) {
                // Pixel-equal to the representative, so these bytes stand for it from here on —
                // which is what gets the cheap path going in a folder whose representative was
                // already on disk (there, the stored JPEG's bytes are not the source's).
                if (w.raw == null) w.raw = raw;
                noteSet(path, SHARED);
            } else {
                Src src = new Src();
                src.bmp = fresh;
                src.raw = raw;
                store(path, src);
                mem.remove(path);                        // the file is the cache here, not memory
                noteSet(path, OWN);
            }
        } catch (Throwable t) {
            // one unreadable file must not stop the pass
        }
    }

    /** The external {@code cover.*}/{@code folder.*} serving a track, as bytes. */
    private static byte[] external(String path) {
        try {
            File f = Art.file(path);
            return f == null ? null : readAll(f);
        } catch (Throwable t) {
            return null;
        }
    }

    /**
     * Write one album representative during a pass, decoding it only if it has to be re-encoded.
     * Returns the decoded picture when there is one, so the caller can hold it — or null, which
     * means "stored verbatim, nothing decoded" and is the normal case.
     */
    private static Bitmap storeSrc(String key, byte[] raw) {
        if (raw.length <= LIMIT && isJpeg(raw)) {
            write(key, raw);
            return null;
        }
        Bitmap b = capped(raw);
        if (b == null) return null;
        Src s = new Src();
        s.bmp = b;
        s.raw = raw;
        store(key, s);
        mem.remove(key);            // during a pass the file is the cache, not memory
        return b;
    }

    /** A caching pass is starting: hold the per-song notes back until it ends. */
    public static void beginCache() {
        passing = true;
    }

    /** End of the caching pass: write the notes down once. */
    public static void endCache() {
        passing = false;
        noteSave();
    }

    // ---------------------------------------------------------------- the per-track note

    /** Never looked at. */
    private static final int UNKNOWN = -1;
    /** Read, and this track has no artwork at all — neither in the tags nor beside the file. */
    private static final int NONE = 0;
    /** Read, and its picture is pixel-identical to the album representative under the folder key. */
    private static final int SHARED = 1;
    /** Read, and different enough to have a cached JPEG of its own under the track key. */
    private static final int OWN = 2;

    private static final HashMap notes = new HashMap();   // track path -> Integer
    private static boolean notesLoaded;
    private static boolean notesDirty;
    private static final char SEP = '\t';

    private static File noteFile() {
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) return null;
        File d = c.getCacheDir();
        // beside ipp_discs.txt / ipp_years.txt, NOT inside ipp_big/ — dir() sweeps that folder of
        // everything that is not a -300.jpg
        return d == null ? null : new File(d, "ipp_bigcover.txt");
    }

    private static synchronized void noteLoad() {
        if (notesLoaded) return;
        notesLoaded = true;
        try {
            File f = noteFile();
            if (f == null || !f.exists()) return;
            FileInputStream in = new FileInputStream(f);
            byte[] b = new byte[in.available()];
            in.read(b);
            in.close();
            String[] lines = new String(b, "UTF-8").split("\n");
            for (int i = 0; i < lines.length; i++) {
                String s = lines[i];
                int t = s.indexOf(SEP);
                if (t <= 0) continue;
                try {
                    notes.put(s.substring(0, t), Integer.valueOf(s.substring(t + 1).trim()));
                } catch (Throwable e) {
                    // a corrupt line is one song that gets read again
                }
            }
        } catch (Throwable t) {
            // an unreadable cache is an empty cache
        }
    }

    private static synchronized void noteSave() {
        if (!notesDirty) return;
        try {
            File f = noteFile();
            if (f == null) return;
            StringBuilder sb = new StringBuilder();
            Iterator it = notes.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry e = (Map.Entry) it.next();
                String k = (String) e.getKey();
                if (k == null || k.indexOf(SEP) >= 0) continue;
                sb.append(k).append(SEP).append(((Integer) e.getValue()).intValue()).append('\n');
            }
            FileOutputStream o = new FileOutputStream(f);
            o.write(sb.toString().getBytes("UTF-8"));
            o.close();
            notesDirty = false;
        } catch (Throwable t) {
            // keep what we have in memory for this run
        }
    }

    private static synchronized int note(String path) {
        if (path == null) return UNKNOWN;
        noteLoad();
        Object o = notes.get(path);
        return o == null ? UNKNOWN : ((Integer) o).intValue();
    }

    /**
     * Record one answer. Written out immediately outside a caching pass (one track opened in the
     * player is one small file write, and the process can be killed at any time), and only at the
     * end of it while {@link #cache} is walking the library — a save per song there would rewrite
     * the whole file thousands of times.
     */
    private static synchronized void noteSet(String path, int value) {
        if (path == null) return;
        noteLoad();
        Object had = notes.put(path, Integer.valueOf(value));
        if (had != null && ((Integer) had).intValue() == value) return;
        notesDirty = true;
        if (!passing) noteSave();
    }

    private static synchronized void noteForget(String key) {
        noteLoad();
        if (notes.remove(key) != null) { notesDirty = true; noteSave(); }
    }

    /** The "no artwork" answers only — the counterpart of {@link #clearMiss} on disk. */
    private static synchronized void noteForgetNone() {
        noteLoad();
        ArrayList drop = new ArrayList();
        Iterator it = notes.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry e = (Map.Entry) it.next();
            if (((Integer) e.getValue()).intValue() == NONE) drop.add(e.getKey());
        }
        if (drop.isEmpty()) return;
        for (int i = 0; i < drop.size(); i++) notes.remove(drop.get(i));
        notesDirty = true;
        noteSave();
    }

    private static synchronized void noteClear() {
        notes.clear();
        notesLoaded = true;
        notesDirty = false;
        try {
            File f = noteFile();
            if (f != null && f.exists()) f.delete();
        } catch (Throwable t) {
            // ignore
        }
    }

    // ---------------------------------------------------------------- internals

    /** A track's artwork as both things the cache needs: the picture, and the file it came in. */
    static final class Src {
        Bitmap bmp;                            // the capped, centre-cropped square
        byte[] raw;                            // the source file's own bytes, untouched
    }

    /**
     * Read a track's artwork: the tags first, then the external cover files.
     *
     * This is stock's {@code Other.getAlbumCover} unrolled, for one reason — that method decodes the
     * embedded bytes and drops them, and the bytes are exactly what decides whether anything needs
     * re-compressing at all. Cost is unchanged: the same single {@code setDataSource}, the same
     * sampling rule ({@code Art.sample} is a transcription of stock's), and the external-file
     * fallback that Art injects into stock's null-return path is done here explicitly instead.
     *
     * {@link #SIZE} caps the picture rather than defining it. {@code Ipp.square} centre-crops the
     * source's largest square, whose side is {@code min(w, h)} — ask it for exactly that side and
     * the picture is not resampled at all, only cropped: "keep a small cover at its own resolution".
     */
    private static Src read(String path) {
        byte[] raw = bytes(path);
        if (raw == null || raw.length == 0) return null;
        Bitmap bmp = capped(raw);
        if (bmp == null) return null;
        Src s = new Src();
        s.bmp = bmp;
        s.raw = raw;
        return s;
    }

    /** The artwork's own bytes: the tag first, then the external {@code cover.*}/{@code folder.*}. */
    private static byte[] bytes(String path) {
        byte[] b = embedded(path);
        if (b != null && b.length > 0) return b;
        return external(path);
    }

    private static byte[] embedded(String path) {
        return Meta.art(path);
    }

    private static byte[] readAll(File f) throws IOException {
        long n = f.length();
        if (n <= 0 || n > 8 * 1024 * 1024) return null;      // a cover file, not an archive
        byte[] b = new byte[(int) n];
        FileInputStream in = new FileInputStream(f);
        try {
            int off = 0;
            while (off < b.length) {
                int r = in.read(b, off, b.length - off);
                if (r < 0) return null;
                off += r;
            }
        } finally {
            in.close();
        }
        return b;
    }

    /** Decode at or above {@link #SIZE}, then centre-crop the largest square, capped at SIZE. */
    private static Bitmap capped(byte[] raw) {
        try {
            BitmapFactory.Options o = new BitmapFactory.Options();
            o.inJustDecodeBounds = true;
            BitmapFactory.decodeByteArray(raw, 0, raw.length, o);
            if (o.outWidth <= 0 || o.outHeight <= 0) return null;
            o.inSampleSize = Art.sample(o.outWidth, o.outHeight, SIZE, SIZE);
            o.inJustDecodeBounds = false;
            Bitmap b = BitmapFactory.decodeByteArray(raw, 0, raw.length, o);
            return square(b);
        } catch (Throwable t) {
            return null;
        }
    }

    /** The same for a decoded bitmap: already a square at or under the cap means nothing to do. */
    private static Bitmap square(Bitmap b) {
        if (b == null) return null;
        int w = b.getWidth();
        int h = b.getHeight();
        if (w == h && w <= SIZE) return b;
        int side = Math.min(w, h);
        if (side <= 0 || side > SIZE) side = SIZE;
        Bitmap sq = Cover.square(b, side);
        return sq == null ? b : sq;
    }

    /**
     * Whether two covers are the same picture. {@code sameAs} answers false for bitmaps of
     * different sizes, which is what we want here — a track whose artwork is a different resolution
     * from the album's representative is a different picture as far as the cache is concerned, and
     * gets an entry of its own.
     */
    private static boolean same(Bitmap a, Bitmap b) {
        try {
            return a != null && b != null && a.sameAs(b);
        } catch (Throwable t) {
            return false;
        }
    }

    private static void store(String key, Src s) {
        try {
            if (s == null || s.bmp == null) return;
            byte[] out = fit(s);
            if (out == null) return;
            if (write(key, out)) mem.put(key, s.bmp);
        } catch (Throwable t) {
            // an unwritable cache is not worth failing the cover for
        }
    }

    /** The bytes onto disk under one key; nothing else. */
    private static boolean write(String key, byte[] out) {
        try {
            File f = file(key);
            if (f == null) return false;
            FileOutputStream os = new FileOutputStream(f);
            try {
                os.write(out);
            } finally {
                os.close();
            }
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    /**
     * The bytes to put on disk.
     *
     * A source that already fits {@link #LIMIT} is written as it is, whatever its pixel size:
     * re-encoding it could only take quality away, and it cannot make the file smaller than the
     * budget it already meets. The pixel cap is applied when it is read back instead ({@link #peek}
     * decodes with sampling and crops), so a big-but-light cover costs nothing extra in memory.
     * JPEG only — a PNG source is re-encoded, so the cache never holds anything but JPEG.
     *
     * Otherwise: the highest quality in {@code [Q_MIN, Q_MAX]} whose output still fits. Because the
     * search takes the largest one that fits, the winner is also the one that lands closest to the
     * limit from below — "the smaller the gap, the higher the quality" falls out of it rather than
     * being a separate rule. Binary search, so five encodes at most.
     *
     * The two limits can conflict on a very detailed cover, and then the QUALITY floor wins: the
     * file is allowed over 25 KB rather than the picture allowed under Photoshop 65.
     */
    private static byte[] fit(Src s) {
        if (s.raw != null && s.raw.length <= LIMIT && isJpeg(s.raw)) return s.raw;

        byte[] best = null;
        int lo = Q_MIN;
        int hi = Q_MAX;
        while (lo <= hi) {
            int mid = (lo + hi + 1) >> 1;
            byte[] out = encode(s.bmp, mid);
            if (out == null) break;
            if (out.length <= LIMIT) {
                best = out;
                lo = mid + 1;
            } else {
                hi = mid - 1;
            }
        }
        return best != null ? best : encode(s.bmp, Q_MIN);
    }

    private static byte[] encode(Bitmap b, int quality) {
        try {
            ByteArrayOutputStream out = new ByteArrayOutputStream(LIMIT);
            b.compress(Bitmap.CompressFormat.JPEG, quality, out);
            return out.toByteArray();
        } catch (Throwable t) {
            return null;
        }
    }

    /** SOI + the start of the first marker — enough to tell a JPEG from a PNG or a WebP. */
    private static boolean isJpeg(byte[] b) {
        return b.length > 3 && (b[0] & 0xFF) == 0xFF && (b[1] & 0xFF) == 0xD8 && (b[2] & 0xFF) == 0xFF;
    }

    private static File file(String key) {
        File d = dir();
        if (d == null) return null;
        return new File(d, Integer.toHexString(key.hashCode()) + "-" + key.length() + SUFFIX);
    }

    private static File dir() {
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) return null;
        File cache = c.getCacheDir();
        if (cache == null) return null;
        File d = new File(cache, "ipp_big");
        if (!d.exists()) d.mkdirs();
        if (!swept) {
            swept = true;
            try {
                File[] fs = d.listFiles();
                if (fs != null) {
                    for (int i = 0; i < fs.length; i++) {
                        if (!fs[i].getName().endsWith(SUFFIX)) fs[i].delete();
                    }
                }
            } catch (Throwable t) {
                // nothing to do
            }
        }
        return d;
    }
}
