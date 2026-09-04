package com.innioasis.ipp;

import android.content.Context;
import com.innioasis.y1.Y1Application;

import java.util.List;
import java.util.Locale;

/**
 * #358 -- multi-artist tags in Now Playing, VISUAL ONLY.
 *
 * Two independent prefs, both default off:
 *  - "first_artist_only": the player's artist line shows only the first artist of a
 *    "A, B, C" / "A; B" tag.
 *  - "feat_in_title" (a sub-row of the first one, hidden while it is off): the artists
 *    that were hidden are appended to the song title as " (feat. B, C)".
 *
 * Splitting is {@link Artists#parts}, so the ';'-over-',' priority and the user-editable
 * comma_artists.txt exception list ("Tyler, the Creator", ...) apply here too.
 *
 * Nothing here touches the database, the library lists or the play order -- both helpers
 * are pure String -> String and are called only from MusicPlayerActivity.refreshUI.
 */
public final class Feat {

    private static boolean pref(String key) {
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) return false;
        return Prefs.on(c, key);
    }

    /** #358.1 -- hide everything after the first artist. */
    public static boolean hideEnabled() {
        return pref("first_artist_only");
    }

    /** #358.2 -- move the hidden artists into the title (only meaningful while .1 is on). */
    private static boolean featEnabled() {
        return pref("feat_in_title");
    }

    /**
     * The player's artist line: first part of a multi-artist tag, or the tag unchanged — and in
     * either case with "; " read as ", " (#220.2).
     */
    public static String artist(String raw) {
        return Artists.display(first(raw));
    }

    /**
     * The same "show only the first artist" rule with the tag otherwise left exactly as written.
     *
     * {@link AlbumArtist#line} uses this one: the artist line of an album row is the ALBUM ARTIST
     * tag when there is one, and the album row is the only place it is ever shown — it is never
     * an entry in the Artists list and is never split. So nothing there is rewritten, ';' included.
     */
    public static String first(String raw) {
        if (raw == null || !hideEnabled()) return raw;
        List ps = Artists.parts(raw);
        if (ps.size() < 2) return raw;
        return (String) ps.get(0);
    }

    /**
     * The player's title line: " (feat. B, C)" for the artists {@link #artist} hides.
     *
     * Left alone when the title already mentions one of them -- files routinely carry the
     * featuring in BOTH the title and the artist tag, and appending a second copy is worse
     * than showing none.
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
            if (hay.indexOf(p.toLowerCase(Locale.ROOT)) >= 0) return title;   // already there
            if (sb.length() > 0) sb.append(", ");
            sb.append(p);
        }
        if (sb.length() == 0) return title;
        return title + " (feat. " + sb.toString() + ")";
    }
}
