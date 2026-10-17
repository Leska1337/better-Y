package com.innioasis.ipp;

import android.content.Context;
import com.innioasis.music.objects.Constant;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Song;

import java.util.List;
import java.util.Locale;

/**
 * The artist line of Now Playing, display only. "player_album_artist" shows the album artist by
 * the rule of Album Artists ({@link AlbumArtists#of}: the tag as written, else the track's first
 * artist); "various_artist" puts the track's first artist in place of "Various (Artists)"; and
 * "feat_in_title" appends the track's other artists to the title as " (feat. B, C)".
 */
public final class Feat {

    public static final String KEY = "player_album_artist";
    public static final String KEY_VARIOUS = "various_artist";
    public static final String KEY_FEAT = "feat_in_title";

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
     * Null when the setting is off. The album artist is never rewritten; only the first-artist
     * fallback goes through {@link Artists#display}.
     */
    private static String shown(String raw, Song s) {
        if (s == null || !pref(KEY)) return null;
        String aa = albumArtist(s);
        if (aa.length() > 0 && !(pref(KEY_VARIOUS) && various(aa))) return aa;
        return Artists.display(first(raw));
    }

    /** From the caches only — the player must not open the file for it. "" when unknown. */
    private static String albumArtist(Song s) {
        try {
            String aa = AlbumArtist.get(Albums.keyOf(s));
            if (aa == null) {
                Meta.Info i = MetaCache.get(s.getPath());
                if (i != null) aa = i.albumArtist;
            }
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
        if (title == null || s == null || !pref(KEY_FEAT)) return title;
        String rawArtist = s.getArtist();
        String line = shown(rawArtist, s);
        if (line == null || rawArtist == null || Constant.UNKNOWN.equals(rawArtist)) return title;
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
