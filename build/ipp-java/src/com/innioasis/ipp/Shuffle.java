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
 * The "Shuffle" row (view_shuffle_playlist_item) shown with a song list is the one row the app
 * paints outside its adapters, so nothing themes it on its own — stock hardcodes its looks in the
 * layout ({@code textColor="@color/white"}, {@code fontFamily="@font/montserrat_bold"}) and it then
 * ignores the theme every list row around it follows.
 *
 * {@link #style} applies the same treatment a list row gets — colour through
 * {@code ThemeManager.itemSetTextColor} (which substitutes the theme's own colour when the theme
 * defines one) and the theme font, read per call from {@code Typeface.MONOSPACE}, the static field
 * {@code ThemeManager.setGlobalFont} rewrites by reflection (so it must not be cached). The layout
 * carries no fontFamily of its own.
 *
 * Called from the view itself (bind / show / updateSelectUI), so every screen that shows the row
 * gets it.
 */
public final class Shuffle {

    private static WeakReference last;      // WeakReference<ShufflePlaylistItemView>
    private static boolean busy;

    public static void style(ShufflePlaylistItemView row) {
        if (row == null) return;
        last = new WeakReference(row);
        // The row rides with the list rather than sitting pinned above it. This is the one call
        // every screen with a Shuffle row makes (bind / show / updateSelectUI), so Head needs no
        // per-Activity hook of its own; attach() is idempotent.
        Head.attach(row);
        // The row cannot be the cursor and be off the top edge at the same time. This runs on every
        // route that can select it — the wheel's ordinary step, a fast burst, the alphabetical jump
        // — because it hangs off the row's own selected state rather than off the way it got there.
        if (row.isSelect()) Head.reveal(row);
        View v = row.findViewById(R.id.tv_song_name);
        if (!(v instanceof TextView)) return;
        TextView tv = (TextView) v;
        // The two-argument setTypeface is what an XML textStyle="bold" does: when the theme font
        // has no bold cut it still fakes one. Typeface.create() does not, and the row then comes
        // out thinner than the "Show all songs" row it sits next to.
        tv.setTypeface(Typeface.MONOSPACE, Typeface.BOLD);
        boolean sel = row.isSelect();
        int color = row.getResources().getColor(sel ? R.color.selected_text_color : R.color.white);
        ThemeManager.INSTANCE.itemSetTextColor(tv, color, sel);
        // The row's icon always takes the colour of the label beside it (the icon_tint setting is
        // Now Playing only). Read AFTER itemSetTextColor, so it is the colour the theme actually
        // settled on, and it changes together with the text when the row is focused.
        View im = row.findViewById(R.id.img);
        if (im instanceof ImageView) Icons.menu((ImageView) im, tv.getCurrentTextColor());
        // The row's background, on every pass. Stock applies it ONLY from updateSelectUI, which
        // runs from setSelect()/hide(), so on a screen where the row's own selected state never
        // changes it is never applied at all. Invisible on the stock themes (they leave
        // `itemBackground` empty, so the list rows are transparent too), glaring on a theme that
        // defines one: the list goes grey and the Shuffle row keeps showing the wallpaper.
        // style() is called from bind / show / updateSelectUI, i.e. whenever the row is put up.
        ThemeManager.INSTANCE.itemSetBackground(row, sel ? R.drawable.item_selected_no_arrow : 0, sel);
    }

    /**
     * Re-apply the row's theme background once a theme bitmap has finished loading.
     *
     * Why it is needed: {@code ShufflePlaylistItemView.updateSelectUI} is the only place that sets
     * this row's background, and it runs just once per screen unless the row's own selected state
     * changes — unlike list rows, which re-bind on every wheel click and therefore always get a
     * second chance. `ThemeManager.setBackground` loads a theme bitmap **asynchronously** the first
     * time and meanwhile calls `setBackgroundResource(0)`, i.e. clears the background. Without this
     * second chance, a theme that defines `itemBackground` (stock themes leave it empty; "Win98
     * Refix" sets 0.png) leaves the row with no background at all for the life of the screen — the
     * wallpaper showing through where the list rows are grey.
     *
     * Called from the async applier itself, so it fires exactly when there is something new to
     * apply. `busy` stops the re-entry that would otherwise be possible if the bitmap were still
     * not ready and our own call started another load.
     */
    public static void refresh() {
        if (busy) return;
        WeakReference w = last;
        if (w == null) return;
        Object o = w.get();
        if (!(o instanceof ShufflePlaylistItemView)) return;
        ShufflePlaylistItemView row = (ShufflePlaylistItemView) o;
        if (row.getWindowToken() == null) return;          // detached: nothing to repaint
        busy = true;
        try {
            boolean sel = row.isSelect();
            ThemeManager.INSTANCE.itemSetBackground(row, sel ? R.drawable.item_selected_no_arrow : 0, sel);
        } catch (Throwable t) {
            // a repaint must never take the screen down
        } finally {
            busy = false;
        }
    }
}
