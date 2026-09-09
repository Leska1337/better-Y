package com.innioasis.ipp;

import android.app.Activity;
import android.graphics.Color;
import android.view.View;
import android.widget.TextView;

import com.innioasis.y1.R;

import me.wcy.lrcview.LrcView;

/**
 * The colour of the player's own TEXT: the four information lines, the two time marks beside the
 * timeline, and the lyrics window.
 *
 * Every one of those was {@code @color/white} in the layout, which is right on a dark wallpaper
 * and unreadable on a light one — and unlike a list row there is no ThemeManager hook here at all:
 * the player draws over the wallpaper rather than over themed rows, so nothing was ever going to
 * colour these for us. Two settings answer it, both {@code CHOICE} rows carrying the same three
 * values as "Icon color", so the player's three colour questions read alike:
 *
 *   {@code text_tint}   — the information lines and the time marks.
 *   {@code lyrics_tint} — the lyrics window and nothing else.
 *
 *   0 LIGHT — white, the stock look.
 *   1 DARK  — #121212, the same near-black the dark icons use.
 *   2 THEME — the timeline's colour ({@link Icons#timelineColor}), which is what "Theme color"
 *             already means for the buttons right above these lines, so the two match. A theme
 *             may set none, so it falls back to the theme's list-row text colour and then to a
 *             colour of last resort: text left at 0 is invisible text.
 *
 * The lyrics window differs in one thing only — its last resort is the accent #3CFFDE the sung
 * line was hard-coded to, so the colour the lyrics have always had is what a theme with nothing
 * to say still gives. Under every setting the unsung lines are the sung one at half alpha, which
 * is what the stock pair (#3CFFDE against #80ffffff) said in two colours and this says in one.
 *
 * Applied once, from {@code BasePlayerActivity.initView}: nothing in either player re-colours
 * these views afterwards (they only ever have their text replaced), and the setting can only be
 * changed while the player is gone — it is {@code finish()}ed on exit.
 *
 * Raw (non-generic) types: the bundled d8 crashes dexing generic Signature attrs.
 */
public final class Tint {

    private Tint() { }

    /** The information lines and the time marks. */
    public static final String KEY_TEXT = "text_tint";

    /** The lyrics window. */
    public static final String KEY_LYRICS = "lyrics_tint";

    private static final int DARK = 1;
    private static final int THEME = 2;

    private static final int WHITE = 0xFFFFFFFF;
    private static final int BLACK = 0xFF121212;

    /** The colour the sung line was hard-coded to; THEME's last resort in the lyrics window. */
    private static final int ACCENT = 0xFF3CFFDE;

    /** An unsung line, as a share of the sung one's alpha. */
    private static final int HALF = 0x80;

    private static final int NO_COLOR = 0;

    /**
     * Paint every text the player owns. Either player may be handed here — both inflate
     * {@code activity_music_player}, so these are the same views on both.
     */
    public static void player(Activity a) {
        if (a == null) return;
        try {
            int text = color(a, KEY_TEXT, WHITE);
            paint(a, R.id.tv_bookname, text);
            paint(a, R.id.tv_bookplayer, text);
            paint(a, R.id.tv_album, text);
            paint(a, R.id.tv_index_of_songs, text);
            paint(a, R.id.tv_play_now, text);
            paint(a, R.id.tv_play_all, text);
            // The song's name above the lyrics is a title, not a lyric: it follows the lines it
            // is the heading of, not the words under it.
            paint(a, R.id.tv_song_name2, text);
            lyrics(a);
        } catch (Throwable t) {
            // A player that comes up in stock white beats a player that does not come up.
        }
    }

    private static void lyrics(Activity a) {
        View v = a.findViewById(R.id.lyric_lv);
        if (!(v instanceof LrcView)) return;
        int c = color(a, KEY_LYRICS, ACCENT);
        LrcView lrc = (LrcView) v;
        // The sung line, and also the "no lyrics" label — LrcView draws that in this same colour.
        lrc.setCurrentColor(c);
        lrc.setNormalColor(Color.argb(HALF, Color.red(c), Color.green(c), Color.blue(c)));
    }

    private static void paint(Activity a, int id, int color) {
        View v = a.findViewById(id);
        if (v instanceof TextView) ((TextView) v).setTextColor(color);
    }

    /** {@code last} is what THEME comes down to when the theme names no colour of its own. */
    private static int color(Activity a, String key, int last) {
        int m = Prefs.val(a, key);
        if (m == DARK) return BLACK;
        if (m == THEME) {
            int c = Icons.timelineColor(a);
            if (c != NO_COLOR) return c;
            c = Icons.themeColor();
            if (c != NO_COLOR) return c;
            return last;
        }
        return WHITE;                          // LIGHT
    }
}
