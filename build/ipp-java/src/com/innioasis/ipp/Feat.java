package com.innioasis.ipp;

import android.content.Context;
import com.innioasis.music.objects.Constant;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Song;

import java.util.List;
import java.util.Locale;

/**
 * The artist line of Now Playing, display only, in one of two modes that exclude each other.
 * "first_artist_only" cuts it to the track's first artist. "player_album_artist" shows the album
 * artist by the rule of Album Artists ({@link AlbumArtists#of}: the tag as written, else the
 * track's first artist), with "various_artist" putting the first artist in place of "Various
 * (Artists)". Each mode's sub-row appends the artists the line leaves out to the title.
 */
public final class Feat {

    public static final String KEY_FIRST = "first_artist_only";
    public static final String KEY_FIRST_FEAT = "feat_in_title";
    public static final String KEY = "player_album_artist";
    public static final String KEY_VARIOUS = "various_artist";
    public static final String KEY_FEAT = "aa_feat_in_title";

    /** The mode a toggle switches off when it is turned on, or null. */
    public static String rival(String key) {
        if (KEY_FIRST.equals(key)) return KEY;
        if (KEY.equals(key)) return KEY_FIRST;
        return null;
    }

    private static boolean pref(String key) {
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) return false;
        return Prefs.on(c, key);
    }

    /** The player's artist line; {@code raw} is the track's tag as stock shows it. */
    public static String artist(String raw, Song s) {
        String a = shown(raw, s);
        return a == null ? Artists.display(raw) : a;
    }

    /**
     * Null when neither mode is on. The album artist is never rewritten; only the first artist
     * goes through {@link Artists#display}.
     */
    private static String shown(String raw, Song s) {
        if (s == null) return null;
        if (!pref(KEY)) return pref(KEY_FIRST) ? Artists.display(first(raw)) : null;
        String aa = albumArtist(s);
        if (aa.length() > 0 && !(pref(KEY_VARIOUS) && various(aa))) return aa;
        return Artists.display(first(raw));
    }

    /** The song's own row — the player must not open the file for it. "" when unknown. */
    private static String albumArtist(Song s) {
        try {
            String aa = s.getAlbumArtist();
            if (aa == null) aa = AlbumArtist.of(Schema.row(s.getPath()));
            return aa == null ? "" : aa.trim();
        } catch (Throwable t) {
            return "";
        }
    }

    private static boolean various(String aa) {
        String a = aa.trim().toLowerCase(Locale.ROOT);
        return a.equals("various") || a.equals("various artists");
    }

    private static String first(String raw) {
        if (raw == null) return null;
        List ps = Artists.parts(raw);
        if (ps.size() < 2) return raw;
        return (String) ps.get(0);
    }

    /**
     * The track's artists not already in the artist line. Left alone when the title already names
     * one of them — files often carry the featuring in both tags, and a second copy is worse.
     */
    public static String title(String title, Song s) {
        if (title == null || s == null || !pref(pref(KEY) ? KEY_FEAT : KEY_FIRST_FEAT)) return title;
        String rawArtist = s.getArtist();
        String line = shown(rawArtist, s);
        if (line == null || rawArtist == null || Constant.UNKNOWN.equals(rawArtist)) return title;
        // With "Various Artists" left in the line, every artist of the song would go to the title.
        if (various(line)) return title;
        List ps = Artists.parts(rawArtist);
        if (ps.isEmpty()) return title;

        String hay = title.toLowerCase(Locale.ROOT);
        String lineLow = line.toLowerCase(Locale.ROOT);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < ps.size(); i++) {
            String p = (String) ps.get(i);
            if (p == null || p.trim().length() == 0) continue;
            String pl = p.trim().toLowerCase(Locale.ROOT);
            if (lineLow.indexOf(pl) >= 0) continue;
            if (hay.indexOf(pl) >= 0) return title;
            if (sb.length() > 0) sb.append(", ");
            sb.append(p.trim());
        }
        if (sb.length() == 0) return title;
        return title + " (feat. " + sb.toString() + ")";
    }
}
