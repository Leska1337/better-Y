package com.innioasis.ipp;

import android.content.Context;

import com.innioasis.music.util.Other;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.utils.SharedPreferencesUtils;

/**
 * The three answers that belong to no subsystem of their own.
 *
 * Two of them are the mod's one global rule — a write to the Song table invalidates caches
 * — and they are named by name in {@code CLAUDE.md} and in half the skills, because every future
 * write path has to call one of them. The third is what a song is CALLED, which every list and both
 * players ask.
 *
 * It stays this small on purpose: a helper that grows a subsystem's worth of state belongs in a
 * class of its own, next to that state. The cover's geometry is in {@link Cover}, the marquee's
 * entry points in {@link Scroll}, the button thresholds and the bottom button in {@link Press}, and
 * "is this song already playing in this very list" in {@link Queue}.
 */
public final class Ipp {

    /**
     * Ipp: single entry point for "the Song table just changed", called from all six
     * {@code SongDao.insert}/{@code delete} sites in {@code Y1Repository} and its lambdas.
     *
     * - {@link Albums}: drops the cached full-library list (it is what every album/artist query
     *     filters).
     * - {@link CoverCache}/{@link BigCover}: forget the "no cover here" answers, so artwork added
     *     to a track that had none is picked up instead of being ignored until the cache is wiped
     *     by hand.
     *
     * Cheap enough to run once per file during a full scan.
     */
    public static void libraryChanged() {
        Albums.invalidate();
        CoverCache.clearMiss();
        BigCover.clearMiss();
        // ipp: forget where the external cover files are, so a cover.jpg/folder.jpg added later is
        // found instead of the memoised "nothing here" answer.
        Art.clear();
        // ipp: the "<n> artists <n> albums" line under a genre counts rows of this very table.
        // Memory only — a full scan calls this once per file.
        GenreInfo.invalidate();
    }

    /**
     * Ipp: one song's file changed on disk ("Update library"). Everything {@link #libraryChanged}
     * does, plus the cached covers of THAT song's album — the list thumbnail (keyed by the encoded
     * name+folder, {@code Albums.keyOf}) and the Now-Playing cover (keyed by the track's own
     * folder). Without those, replaced artwork goes on showing the old picture until the cache is
     * cleared by hand: mem and disk still hold it, and {@code clearMiss} only forgets absences.
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
            // ipp: and so was the TRACK NUMBER — the album's rows show it, so an edited tag has to
            // reach them. Dropped together with the disc number: DiscCache is what records that a
            // file has been read, so leaving one of the two behind means the other is never read
            // again.
            TrackCache.forget(path);
            // ipp: the big cover is keyed by the track, but the album's representative
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
     * The tag goes through {@code Other.unNamed} because an absent one is not an empty string
     * but {@code Constant.UNKNOWN} — "<unknown>" behind four U+FFE6, a sort-key prefix that
     * would otherwise be drawn. The file name goes through stock's own extension stripping.
     *
     * An audiobook has a switch of its own ({@code Audio.title}): a chapter's tags are routinely
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
