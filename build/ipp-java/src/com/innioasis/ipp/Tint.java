package com.innioasis.ipp;

import android.app.Activity;
import android.graphics.Color;
import android.view.View;
import android.widget.TextView;

import com.innioasis.y1.R;

import me.wcy.lrcview.LrcView;

/**
 * The colour of the player's text: "text_tint" for the information lines and time marks,
 * "lyrics_tint" for the lyrics window, "box_tint" for the boxes behind the lines and the
 * buttons. Values as "Icon color": 0 LIGHT (white, stock), 1 DARK,
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

    public static final String KEY_BOX = "box_tint";

    private static final int DARK = 1;
    private static final int THEME = 2;
    /** "box_tint" only: no boxes at all. */
    private static final int BOX_OFF = 3;

    private static final int WHITE = 0xFFFFFFFF;
    private static final int BLACK = 0xFF121212;

    /** Stock's sung-line colour; THEME's last resort in the lyrics window. */
    private static final int ACCENT = 0xFF3CFFDE;

    private static final int HALF = 0x80;

    /** The layout's {@code #1affffff}. */
    private static final int BOX_ALPHA = 0x1A;

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
            int box = Prefs.val(a, KEY_BOX) == BOX_OFF ? 0 : box(color(a, KEY_BOX, WHITE));
            back(a, R.id.tv_bookname, box);
            back(a, R.id.tv_bookplayer, box);
            back(a, R.id.tv_album, box);
            back(a, R.id.tv_index_of_songs, box);
            back(a, R.id.layout_status_icon, box);
            lyrics(a);
            volume(a);
        } catch (Throwable t) {
        }
    }

    /** The quieter/louder icons beside the volume bar: "Icon color", as the buttons. */
    private static void volume(Activity a) {
        View v = a.findViewById(R.id.ll_volume);
        if (!(v instanceof android.view.ViewGroup)) return;
        android.view.ViewGroup g = (android.view.ViewGroup) v;
        int tint = Icons.timelineColor(a);
        for (int i = 0; i < g.getChildCount(); i++) {
            if (g.getChildAt(i) instanceof android.widget.ImageView) {
                Icons.on((android.widget.ImageView) g.getChildAt(i), tint);
            }
        }
    }

    private static void lyrics(Activity a) {
        View v = a.findViewById(R.id.lyric_lv);
        if (!(v instanceof LrcView)) return;
        int c = lyricsColor(a);
        LrcView lrc = (LrcView) v;
        // Also the colour of the "no lyrics" label.
        lrc.setCurrentColor(c);
        lrc.setNormalColor(Color.argb(HALF, Color.red(c), Color.green(c), Color.blue(c)));
    }

    /** The sung line's colour; also the whole of an untimed text ({@code Lrc}). */
    static int lyricsColor(Activity a) {
        return color(a, KEY_LYRICS, ACCENT);
    }

    /** The colour at the layout's own opacity: the box only shades what is under it. */
    private static int box(int c) {
        return (BOX_ALPHA << 24) | (c & 0xFFFFFF);
    }

    /** Over the layout's ColorDrawable, which this recolours rather than replaces: no layout pass. */
    private static void back(Activity a, int id, int color) {
        View v = a.findViewById(id);
        if (v != null) v.setBackgroundColor(color);
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
