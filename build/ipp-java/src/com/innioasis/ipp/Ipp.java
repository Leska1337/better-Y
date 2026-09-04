package com.innioasis.ipp;

import android.content.Context;

import com.innioasis.music.util.Other;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.utils.SharedPreferencesUtils;

/**
 * The three answers that belong to no subsystem of their own.
 *
 * <p>Two of them are the mod's one global rule — <b>a write to the Song table invalidates caches</b>
 * — and they are named by name in {@code CLAUDE.md} and in half the skills, because every future
 * write path has to call one of them. The third is what a song is CALLED, which every list and both
 * players ask.
 *
 * <p>Everything else this class used to hold moved out in v0.31.9, each piece next to the state it
 * works on: the cover's geometry to {@link Cover}, the marquee's entry points to {@link Scroll},
 * the button thresholds and the bottom button to {@link Press}, and "is this song already playing
 * in this very list" to {@link Queue}.
 */
public final class Ipp {

    /**
     * ipp: single entry point for "the Song table just changed", called from all six
     * {@code SongDao.insert}/{@code delete} sites in {@code Y1Repository} and its lambdas.
     *
     * <ul>
     * <li>{@link Albums}: drops the cached full-library list (it is what every album/artist query
     *     filters).
     * <li>{@link CoverCache}/{@link BigCover}: forget the "no cover here" answers, so artwork added
     *     to a track that had none is picked up instead of being ignored until the cache is wiped
     *     by hand.
     * </ul>
     *
     * <p>Cheap enough to run once per file during a full scan.
     */
    public static void libraryChanged() {
        Albums.invalidate();
        CoverCache.clearMiss();
        BigCover.clearMiss();
        // ipp #291.1: forget where the external cover files are, so a cover.jpg/folder.jpg added
        // later is found instead of the memoised "nothing here" answer.
        Art.clear();
        // ipp: the "<n> artists <n> albums" line under a genre counts rows of this very table.
        // Memory only — a full scan calls this once per file.
        GenreInfo.invalidate();
    }

    /**
     * ipp: one song's file changed on disk ("Update library"). Everything {@link #libraryChanged}
     * does, plus the cached covers of THAT song's album — the list thumbnail (keyed by the encoded
     * name+folder, {@code Albums.keyOf}) and the Now-Playing cover (keyed by the track's own
     * folder). Without this, replacing existing artwork kept showing the old picture until the
     * whole cache was cleared by hand, because mem/disk still had it and {@code clearMiss} only
     * forgets absences.
     */
    public static void songChanged(Song song) {
        libraryChanged();
        if (song == null) {
            return;
        }
        try {
            String album = Albums.keyOf(song);
            CoverCache.forget(album);
            // ipp: the ALBUM ARTIST tag was just re-read from the file too
            AlbumArtist.forget(album);
            String path = song.getPath();
            // ipp: the DISC NUMBER tag was re-read from this file too
            DiscCache.forget(path);
            // ipp #220.1: and so was the TRACK NUMBER — the album's rows show it, so an edited tag
            // has to reach them. Dropped together with the disc number: DiscCache is what records
            // that a file has been read, so leaving one of the two behind means the other is never
            // read again.
            TrackCache.forget(path);
            // ipp #230.2: the big cover is keyed by the track, but the album's representative
            // (folder key) may be this very track's picture — drop both, or the replaced artwork
            // keeps being served as the stand-in for the whole folder.
            BigCover.forget(path);
            BigCover.forget(Albums.trackFolder(path));
        } catch (Throwable t) {
        }
    }

    /**
     * The title of a song as the user has asked to see it: the tag under "Song titles from
     * metadata", the file name otherwise.
     *
     * <p>The tag goes through {@code Other.unNamed} because an absent one is not an empty string
     * but {@code Constant.UNKNOWN} — "&lt;unknown&gt;" behind four U+FFE6, a sort-key prefix that
     * would otherwise be drawn. The file name goes through stock's own extension stripping.
     *
     * <p>An audiobook has a switch of its own ({@code Audio.title}): a chapter's tags are routinely
     * worse than its file name, which is the opposite of how music usually goes.
     */
    public static String songTitle(Context c, String tagTitle, String fileName) {
        if (Prefs.on(c, "meta_title")
                && tagTitle != null && tagTitle.trim().length() > 0) {
            return Other.INSTANCE.unNamed(tagTitle);
        }
        if (fileName == null) {
            fileName = "";
        }
        return SharedPreferencesUtils.INSTANCE.processFileExtensions(fileName);
    }
}
