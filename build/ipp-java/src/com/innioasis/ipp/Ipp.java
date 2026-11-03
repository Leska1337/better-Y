package com.innioasis.ipp;

import android.content.Context;
import android.text.TextUtils;
import android.widget.TextView;

import com.innioasis.music.util.Other;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.utils.SharedPreferencesUtils;

/**
 * The answers that belong to no subsystem: the cache-invalidation rule for writes to the Song
 * table, a song's displayed title, and which player lines run the marquee. Kept small on purpose —
 * a helper that grows state of its own belongs in a class next to that state.
 */
public final class Ipp {

    /**
     * "The Song table just changed": called from every {@code SongDao.insert}/{@code delete} site
     * in {@code Y1Repository}. Forgets the cached library and every remembered "nothing here", so
     * artwork or files added later are picked up. Cheap enough to run once per file of a scan.
     */
    public static void libraryChanged() {
        Albums.invalidate();
        CoverCache.clearMiss();
        BigCover.clearMiss();
        Art.clear();
        GenreInfo.invalidate();
        Prefs.forgetLabels();
    }

    /**
     * One song's file changed on disk ("Update library"): {@link #libraryChanged} plus everything
     * cached for that song and its album. {@code clearMiss} only forgets absences, so without this
     * replaced artwork and tags keep showing until the cache is cleared by hand.
     */
    public static void songChanged(Song song) {
        libraryChanged();
        forget(song);
    }

    /** {@link #songChanged} for a batch written at once: the library is dropped once, not per song. */
    public static void songsChanged(Song[] songs) {
        libraryChanged();
        if (songs == null) return;
        BigCover.beginForget();
        FlowCache.beginForget();
        try {
            for (int i = 0; i < songs.length; i++) forget(songs[i]);
        } finally {
            FlowCache.endForget();
            BigCover.endForget();
        }
    }

    private static void forget(Song song) {
        if (song == null) {
            return;
        }
        try {
            String album = Albums.keyOf(song);
            CoverCache.forget(album);
            String path = song.getPath();
            // The folder's stand-in cover may be this very track's picture.
            BigCover.forget(path);
            BigCover.forget(Albums.trackFolder(path));
        } catch (Throwable t) {
        }
    }

    /**
     * The tag under "Song titles from metadata", the file name otherwise. An absent tag is
     * {@code Constant.UNKNOWN}, not "", hence {@code unNamed}. Audiobooks have their own switch
     * ({@code Audio.title}).
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

    /** "Long artist/album scroll": 0 neither, 1 the artist line, 2 the album line, 3 both. */
    public static final String KEY_LINE_SCROLL = "artist_album_scroll";

    /**
     * A player's artist or album line: marquee or truncated. The off branch actively undoes a
     * running marquee, because the player is not rebuilt when the setting changes.
     */
    public static void playerLine(TextView tv, String text, boolean album) {
        if (tv == null) {
            return;
        }
        String s = text == null ? "" : text;
        int v = Prefs.val(tv.getContext(), KEY_LINE_SCROLL);
        if (album ? (v == 2 || v == 3) : (v == 1 || v == 3)) {
            Scroll.marqueeText(tv, s);
            return;
        }
        Scroll.stopMarquee(tv);
        tv.setEllipsize(TextUtils.TruncateAt.END);
        tv.setText(s);
    }
}
