package com.innioasis.ipp;

import android.app.Activity;
import android.graphics.Color;
import android.view.View;
import android.widget.TextView;

import com.innioasis.y1.R;

import me.wcy.lrcview.LrcView;

/**
 * The colour of the player's text: "text_tint" for the information lines and time marks,
 * "lyrics_tint" for the lyrics window. Values as "Icon color": 0 LIGHT (white, stock), 1 DARK,
 * 2 THEME (the timeline's colour, then the list text's, then a last resort — 0 is invisible).
 * Unsung lyric lines are the sung colour at half alpha.
 *
 * Applied once from {@code BasePlayerActivity.initView}: nothing re-colours these views later, and
 * the setting cannot change while a player is open.
 */
public final class Tint {

    private Tint() { }

    public static final String KEY_TEXT = "text_tint";

    public static final String KEY_LYRICS = "lyrics_tint";

    private static final int DARK = 1;
    private static final int THEME = 2;

    private static final int WHITE = 0xFFFFFFFF;
    private static final int BLACK = 0xFF121212;

    /** Stock's sung-line colour; THEME's last resort in the lyrics window. */
    private static final int ACCENT = 0xFF3CFFDE;

    private static final int HALF = 0x80;

    private static final int NO_COLOR = 0;

    /** Either player: both inflate {@code activity_music_player}. */
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
            // The heading above the lyrics follows the information lines, not the lyrics.
            paint(a, R.id.tv_song_name2, text);
            lyrics(a);
        } catch (Throwable t) {
        }
    }

    private static void lyrics(Activity a) {
        View v = a.findViewById(R.id.lyric_lv);
        if (!(v instanceof LrcView)) return;
        int c = color(a, KEY_LYRICS, ACCENT);
        LrcView lrc = (LrcView) v;
        // Also the colour of the "no lyrics" label.
        lrc.setCurrentColor(c);
        lrc.setNormalColor(Color.argb(HALF, Color.red(c), Color.green(c), Color.blue(c)));
    }

    private static void paint(Activity a, int id, int color) {
        View v = a.findViewById(id);
        if (v instanceof TextView) ((TextView) v).setTextColor(color);
    }

    /** {@code last}: THEME's answer when the theme names no colour. */
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
        return WHITE;
    }
}
