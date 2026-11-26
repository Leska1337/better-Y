package com.innioasis.ipp;

import android.graphics.Typeface;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import com.innioasis.y1.R;
import com.innioasis.y1.theme.ThemeManager;
import com.innioasis.y1.view.ShufflePlaylistItemView;

import java.lang.ref.WeakReference;

/**
 * Themes the "Shuffle" row above a song list — the one row painted outside any adapter, so
 * nothing else applies the theme's colour, font and background to it. Called from the view itself
 * (bind / show / updateSelectUI), so every screen with the row gets it.
 */
public final class Shuffle {

    private static WeakReference last;      // WeakReference<ShufflePlaylistItemView>
    private static boolean busy;

    public static void style(ShufflePlaylistItemView row) {
        if (row == null) return;
        last = new WeakReference(row);
        // Here rather than in the wheel code: every route that selects the row ends up in style().
        if (row.isSelect()) {
            SongRows.reveal(row);
        }
        View v = row.findViewById(R.id.tv_song_name);
        if (!(v instanceof TextView)) return;
        TextView tv = (TextView) v;
        // Read per call: setGlobalFont rewrites Typeface.MONOSPACE. The two-argument form fakes a
        // bold cut the theme font lacks; Typeface.create() does not.
        tv.setTypeface(Typeface.MONOSPACE, Typeface.BOLD);
        boolean sel = row.isSelect();
        int color = row.getResources().getColor(sel ? R.color.selected_text_color : R.color.white);
        ThemeManager.INSTANCE.itemSetTextColor(tv, color, sel);
        // After itemSetTextColor: the colour the theme actually settled on.
        View im = row.findViewById(R.id.img);
        if (im instanceof ImageView) Icons.menu((ImageView) im, tv.getCurrentTextColor());
        // Stock sets the background only from updateSelectUI, which a screen may never reach.
        ThemeManager.INSTANCE.itemSetBackground(row, sel ? R.drawable.item_selected_no_arrow : 0, sel);
        // the theme's arrow, as on the song rows below it; the layout holds the stock one
        View ar = row.findViewById(R.id.right_arrow);
        if (ar instanceof ImageView) ThemeManager.INSTANCE.itemSetRightArrow((ImageView) ar, R.mipmap.right_arrow);
        // row 0 of a list under the travelling bar: the bar paints it
        Bar.row(row);
    }

    /**
     * Re-applies the row's background once a theme bitmap has loaded. {@code setBackground} clears
     * the background while it loads asynchronously, and unlike list rows this one is not re-bound
     * on every click, so without this it stays empty for the life of the screen. Called from the
     * async applier; {@code busy} stops re-entry if our call starts another load.
     */
    public static void refresh() {
        if (busy) return;
        WeakReference w = last;
        if (w == null) return;
        Object o = w.get();
        if (!(o instanceof ShufflePlaylistItemView)) return;
        ShufflePlaylistItemView row = (ShufflePlaylistItemView) o;
        if (row.getWindowToken() == null) return;
        busy = true;
        try {
            boolean sel = row.isSelect();
            ThemeManager.INSTANCE.itemSetBackground(row, sel ? R.drawable.item_selected_no_arrow : 0, sel);
            Bar.row(row);
        } catch (Throwable t) {
        } finally {
            busy = false;
        }
    }
}
