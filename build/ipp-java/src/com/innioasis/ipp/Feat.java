package com.innioasis.ipp;

import android.content.Context;
import com.innioasis.y1.Y1Application;

import java.util.List;
import java.util.Locale;

/**
 * Multi-artist tags in Now Playing, display only: "first_artist_only" cuts the artist line to the
 * first artist, and "feat_in_title" (its sub-row) appends the rest to the title as
 * " (feat. B, C)". Splitting is {@link Artists#parts}, exceptions list included.
 */
public final class Feat {

    private static boolean pref(String key) {
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) return false;
        return Prefs.on(c, key);
    }

    public static boolean hideEnabled() {
        return pref("first_artist_only");
    }

    private static boolean featEnabled() {
        return pref("feat_in_title");
    }

    /** The player's artist line, with "; " read as ", ". */
    public static String artist(String raw) {
        return Artists.display(first(raw));
    }

    /**
     * The first artist with the tag otherwise left as written — for {@link AlbumArtist#line}, whose
     * ALBUM ARTIST tag is never split or rewritten, ';' included.
     */
    public static String first(String raw) {
        if (raw == null || !hideEnabled()) return raw;
        List ps = Artists.parts(raw);
        if (ps.size() < 2) return raw;
        return (String) ps.get(0);
    }

    /**
     * Left alone when the title already names one of the hidden artists — files often carry the
     * featuring in both tags, and a second copy is worse than none.
     */
    public static String title(String title, String rawArtist) {
        if (title == null || rawArtist == null) return title;
        if (!hideEnabled() || !featEnabled()) return title;
        List ps = Artists.parts(rawArtist);
        if (ps.size() < 2) return title;

        String hay = title.toLowerCase(Locale.ROOT);
        StringBuilder sb = new StringBuilder();
        for (int i = 1; i < ps.size(); i++) {
            String p = (String) ps.get(i);
            if (p == null || p.length() == 0) continue;
            if (hay.indexOf(p.toLowerCase(Locale.ROOT)) >= 0) return title;
            if (sb.length() > 0) sb.append(", ");
            sb.append(p);
        }
        if (sb.length() == 0) return title;
        return title + " (feat. " + sb.toString() + ")";
    }
}
