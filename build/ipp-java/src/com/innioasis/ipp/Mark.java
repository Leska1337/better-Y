package com.innioasis.ipp;

import android.content.Context;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;

import com.innioasis.music.GenresActivity;
import com.innioasis.music.adapter.AlbumListAdapter;
import com.innioasis.music.adapter.MainAdapter;
import com.innioasis.music.adapter.MyBaseAdapter;
import androidx.viewbinding.ViewBinding;

import com.innioasis.music.data.Album;
import com.innioasis.music.data.Genre;
import com.innioasis.music.util.Other;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.databinding.ActivityGenresBinding;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;

/**
 * The "Show all …" rows of Genres and Artists: they are buttons, not entries, and everything a list
 * does to an entry has to pass them by.
 *
 * <p>Two of them live here — Genres' <b>Show all albums</b> (row 0 of the artist level, stock's
 * "All Albums", relabelled and given an icon) and the <b>Show all songs</b> row of an album list
 * ({@code Albums.isAllSongs}, used by an artist's albums and by Genres' album level). Folders has
 * rows of the same kind and answers for itself ({@code Folders}, skill {@code ipp-folders}); the
 * rules are the ones written down there:
 *
 * <ul>
 *   <li>no tick in multi-select ({@code MyBaseAdapter.addItemToSelectedIndex}, and "select all"
 *       drops it again),</li>
 *   <li>no long-press menu,</li>
 *   <li>the cursor does not START on it — opening the screen puts it on the row below, because the
 *       list is what the user came to look at and the button is one click up.</li>
 * </ul>
 */
public final class Mark {

    private Mark() { }

    /** Row 0 of Genres' artist level: stock's "All Albums". */
    public static boolean isGenreAllAlbums(Object adapter, int position) {
        if (position != 0 || !(adapter instanceof MainAdapter)) return false;
        Context c = ((MainAdapter) adapter).getContext();
        return c instanceof GenresActivity;
    }

    /** The "Show all songs" row of an album list (artist's albums, Genres' album level). */
    public static boolean isAllSongsRow(Object adapter, int position) {
        try {
            if (position < 0 || !(adapter instanceof AlbumListAdapter)) return false;
            Object o = ((MyBaseAdapter) adapter).getItem(position);
            if (!(o instanceof Album)) return false;
            String n = ((Album) o).getName();
            return Albums.isAllSongs(n) || Albums.isGenreAll(n);
        } catch (Throwable t) {
            return false;
        }
    }

    // ---- Genres: the "Show all songs" row of a genre's album list ------------------------------
    //
    // The genre is noted when its album list is asked for and consumed when the list comes back:
    // the list arrives on the main thread through a static lambda that has no field for it, and
    // the two run one after the other with nothing in between that could open another genre.

    private static String pendingGenre;
    private static Genre genreObj;

    /** Called wherever the Genre object is to hand: opening a genre, and listing its albums. */
    public static void noteGenre(Genre g) {
        pendingGenre = g == null ? null : g.getName();
        genreObj = g;
    }

    /**
     * Genres, third level: picking an ARTIST opens that artist's albums instead of dropping every
     * one of their songs into one list — the same shape the Artists section has, and the reason
     * "Show all albums" above it now has a counterpart here. The list is built by hand because
     * stock has no query for "this artist's albums within this genre":
     *
     * <ul>
     *   <li>the artist's songs in this genre (the very query stock's own branch used), then</li>
     *   <li>their album keys, in first-seen order, deduplicated — the same encoded name a row
     *       carries everywhere else, so opening one lands in {@code Albums.songsSync} and the genre
     *       is applied there as well, and</li>
     *   <li>the artist's "Show all songs" marker on top, which is what the old behaviour becomes.</li>
     * </ul>
     *
     * Returns false when there is nothing to show, and then stock's own branch runs untouched.
     */
    public static boolean artistAlbums(GenresActivity a, String artist) {
        try {
            if (a == null || artist == null || artist.length() == 0) return false;
            // The list the screen draws and the list behind it have to be found by ONE test:
            // an artist row is a name Artists produced out of a tag, and the query matches the
            // column as written. forMenu owns that fallback now (Artists.byTag), so the Artists
            // screen and this one cannot drift apart.
            List songs = Artists.forMenu(artist, genreObj);
            if (songs == null || songs.isEmpty()) return false;

            ArrayList names = new ArrayList();
            LinkedHashSet seen = new LinkedHashSet();
            for (int i = 0; i < songs.size(); i++) {
                Object o = songs.get(i);
                if (!(o instanceof Song)) continue;
                Song s = (Song) o;
                String key = Albums.albumKey(s.getAlbum(), s.getPath());
                if (seen.add(key)) names.add(key);
            }
            if (names.isEmpty()) return false;
            // The album level's own sort, before the button goes on top. This runs on the MAIN
            // thread (confirm calls us directly), so a year sort takes the years that are cached
            // and hands `a` over for the missing ones to be read on a thread of their own.
            Genres.albums(names, a);
            names.add(0, Albums.artistMark(artist));

            a.setStateBarLeftText(Artists.display(artist));
            a.showOrHideNone(names.size());

            AlbumListAdapter ad = a.getAdapter3_1();
            List sel = ad.getSelectedIndexList();
            if (sel != null) sel.clear();
            ad.setAlbums(names);

            ViewBinding vb = a.getVb();
            ListView lv = vb instanceof ActivityGenresBinding ? ((ActivityGenresBinding) vb).lv : null;
            if (lv == null) return false;
            Other.INSTANCE.gotoAdapter(lv, ad, 0);
            afterFill(ad, lv);
            return true;
        } catch (Throwable t) {
            return false;       // stock's branch takes over
        }
    }

    /**
     * Put the "Show all songs" row at the top of a genre's album list, exactly as an artist's album
     * list gets one.
     *
     * <p>The list handed to {@code AlbumListAdapter.setAlbums} is a list of NAMES — the adapter
     * builds the {@link Album} objects itself — so the row is the marker STRING, not an Album.
     * (Putting an Album in threw {@code ClassCastException} inside setAlbums.) From there it
     * travels the stock path: the bind paints it ({@code Albums.allSongsRow}) and picking it ends
     * in {@code Albums.songsSync}, which answers with the genre's songs.
     */
    public static void genreAlbums(List albums) {
        try {
            String g = pendingGenre;
            if (g == null || albums == null || albums.isEmpty()) return;
            Object first = albums.get(0);
            if (first instanceof String && Albums.isGenreAll((String) first)) return;
            albums.add(0, Albums.genreMark(g));
        } catch (Throwable t) {
            // no button: the genre's albums are still all there
        }
    }

    /**
     * The artist's songs found the way the LIST that shows them is built, for when the query comes
     * back empty.
     *
     * <p>The names on the artist level of Genres are produced by {@code Artists.listGenre}, which
     * splits composite tags apart — so a row can be one name out of "A; B", while the query behind
     * it (stock, and the hook in front of it) matches the artist column as written. Anything the
     * split normalised away — a stray space, a difference in case — leaves the row on screen with
     * nothing behind it, which is what "this artist has no songs" was. Here the test is
     * {@code Artists.has}, the very one the splitting uses, over the cached song table.
     */

    /** The title bar of a list opened from one of those rows — the marker byte is not shown. */
    public static String title(String albumName) {
        return Albums.realName(albumName);
    }

    /** True for a row that is one of the buttons. */
    public static boolean blocked(Object adapter, int position) {
        return isGenreAllAlbums(adapter, position) || isAllSongsRow(adapter, position);
    }

    /**
     * True while the CURSOR stands on a button. Called at the top of a screen's {@code longConfirm},
     * where the list is all there is to go on — the adapter carries the cursor ({@code getPosition})
     * and the ListView carries the adapter, so one call answers for every level a screen pages
     * through.
     */
    public static boolean blockedList(ListView lv) {
        try {
            Object a = lv == null ? null : lv.getAdapter();
            if (!(a instanceof MyBaseAdapter)) return false;
            return blocked(a, ((MyBaseAdapter) a).getPosition());
        } catch (Throwable t) {
            return false;
        }
    }

    /**
     * "Select all" ticks every row it walks, so the buttons are un-ticked right after its loop —
     * the same shape {@code Folders.dropMarks} has.
     */
    public static void dropMarks(Object adapter, List selected) {
        try {
            if (selected == null || selected.isEmpty()) return;
            for (int i = selected.size() - 1; i >= 0; i--) {
                Object o = selected.get(i);
                if (!(o instanceof Integer)) continue;
                if (blocked(adapter, ((Integer) o).intValue())) selected.remove(i);
            }
        } catch (Throwable t) {
            // a tick too many is better than a crash while selecting
        }
    }

    /**
     * Just after a list that may begin with a button has been filled: move the cursor off it.
     *
     * <p>Only when the cursor is still on row 0, i.e. the list has just been built — re-sorting a
     * list the user has already walked leaves their row alone.
     */
    public static void afterFill(Object adapter) {
        afterFill(adapter, null);
    }

    /**
     * @param lv the list, when it is to hand: the cursor goes to row 1 but the list itself is left
     *           resting at row 0, or the button scrolls off the top edge and the screen opens with
     *           no sign that it is there at all. {@code Other.gotoAdapter(lv, a, 1)} does both at
     *           once and is exactly what must NOT happen here.
     */
    public static void afterFill(Object adapter, ListView lv) {
        try {
            if (!(adapter instanceof MyBaseAdapter)) return;
            MyBaseAdapter a = (MyBaseAdapter) adapter;
            if (a.getPosition() != 0 || a.getCount() < 2) return;
            if (!blocked(a, 0)) return;
            a.setPosition(1);
            if (lv != null) lv.setSelection(0);
        } catch (Throwable t) {
            // the cursor stays where it was
        }
    }

    /**
     * The cursor does not stop on a button while multi-select is on — there is nothing to tick, so
     * standing on it is a dead step. Called at the end of both wheel handlers of a screen that has
     * one, the same place and the same rule as {@code Folders.skipMark}: always push DOWNWARDS,
     * because the button is the first row whichever way the wheel came from.
     */
    public static void skip(Object adapter, boolean multi) {
        if (!multi || !(adapter instanceof MyBaseAdapter)) return;
        try {
            MyBaseAdapter a = (MyBaseAdapter) adapter;
            int pos = a.getPosition();
            if (!blocked(a, pos)) return;
            int n = a.getCount();
            int to = pos + 1;
            while (to < n && blocked(a, to)) to++;
            if (to < n) a.setPosition(to);      // setPosition notifies for us
        } catch (Throwable t) {
            // a cursor on a row it cannot tick is not worth a crash
        }
    }

    /**
     * Paint Genres' "Show all albums" row, at the very END of {@code MainAdapter.getView} — the row's
     * text colour has to be set already, because the icon copies it (the rule every menu icon in the
     * mod follows, so it tracks the theme and the focus highlight).
     *
     * <p>Both states are written on every bind: the rows are recycled, so an ordinary artist row
     * that once was this one would keep the icon.
     */
    public static void mainRow(View row, TextView tv, Object adapter) {
        try {
            if (row == null) return;
            ImageView iv = (ImageView) row.findViewById(R.id.ipp_row_icon);
            if (iv == null) return;
            if (!isAllAlbumsLabel(adapter, tv)) {
                if (iv.getVisibility() != View.GONE) {
                    Icons.reset(iv);
                    iv.setVisibility(View.GONE);
                }
                rowHeight(row, R.dimen.main_item_height);
                labelTop(tv, true);
                return;
            }
            // The button is as tall as the Shuffle row (49) rather than as a menu row (45); the
            // height has to be set here because item_main.xml is every other row as well, and it is
            // set BOTH ways because the rows are recycled.
            rowHeight(row, 0);
            labelTop(tv, false);
            iv.setVisibility(View.VISIBLE);
            iv.setImageResource(R.mipmap.ipp_show_all_albums);
            if (tv != null) Icons.menu(iv, tv.getCurrentTextColor());
        } catch (Throwable t) {
            // an unpainted icon is not worth a crash in a list bind
        }
    }

    /**
     * The bind knows the row by its LABEL rather than by its position, because at the point the
     * icon is painted — the end of {@code MainAdapter.getView} — the position argument is gone:
     * stock has reused that register for something else by then. Only ever asked on the Genres
     * screen, so the {@code getString} costs nothing anywhere else.
     */
    private static boolean isAllAlbumsLabel(Object adapter, TextView tv) {
        if (tv == null || !(adapter instanceof MainAdapter)) return false;
        Context c = ((MainAdapter) adapter).getContext();
        if (!(c instanceof GenresActivity)) return false;
        CharSequence s = tv.getText();
        return s != null && allAlbumsLabel().contentEquals(s);
    }

    /**
     * The label of an ordinary menu row is aligned to the row's TOP ({@code item_main.xml}) — that
     * is what keeps it from moving by a pixel when the marquee starts. In a 45-tall row the label
     * fills it anyway; in the button's 49 it left the text hanging above centre, out of line with
     * the Shuffle row it is supposed to match. So the button centres its label and every other row
     * puts the top alignment back (the rows are recycled).
     */
    private static void labelTop(TextView tv, boolean top) {
        try {
            if (tv == null) return;

            // Measured on the device, screenshot against screenshot, over the letters the two rows
            // share ("Show all", nothing descending): the album list's row draws them at y 67..85
            // and this one at 66..84. Both rows are 60 tall and both labels are centred in them —
            // but this view carries a 5dip padding and measures 44 where the other measures 32
            // (item_album pins its name to 32dip), and (60-44)/2 lands a pixel above (60-32)/2.
            // One pixel moves from the bottom padding to the top, which shifts the glyphs without
            // changing the view's height.
            int p = tv.getResources().getDimensionPixelSize(R.dimen.main_item_padding);
            int wantTop = top ? p : p + 1;
            if (tv.getPaddingTop() != wantTop) {
                tv.setPadding(p, wantTop, p, top ? p : p - 1);
            }

            ViewGroup.LayoutParams lp0 = tv.getLayoutParams();
            if (!(lp0 instanceof LinearLayout.LayoutParams)) return;
            LinearLayout.LayoutParams lp = (LinearLayout.LayoutParams) lp0;
            int want = top ? Gravity.TOP : Gravity.CENTER_VERTICAL;
            if (lp.gravity == want) return;
            lp.gravity = want;
            tv.setLayoutParams(lp);
        } catch (Throwable t) {
            // the label keeps the alignment the layout gave it
        }
    }

    /** The album row's height, in dip — what {@code item_album} measures, cover box included. */
    private static final int MARK_ROW_DIP = 60;

    /** @param dimen the dimension to take the height from, or 0 for the album row's height. */
    private static void rowHeight(View row, int dimen) {
        try {
            int want = dimen != 0
                    ? row.getResources().getDimensionPixelSize(dimen)
                    : (int) (MARK_ROW_DIP * row.getResources().getDisplayMetrics().density + 0.5f);
            ViewGroup.LayoutParams lp = row.getLayoutParams();
            if (lp == null) {
                row.setLayoutParams(new AbsListView.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, want));
                return;
            }
            if (lp.height == want) return;
            lp.height = want;
            row.setLayoutParams(lp);
        } catch (Throwable t) {
            // the row keeps the height its layout gave it
        }
    }

    /** The label stock's "All Albums" row now carries. */
    public static String allAlbumsLabel() {
        try {
            Context c = Y1Application.Companion.getAppContext();
            if (c != null) return c.getString(R.string.ipp_show_all_albums);
        } catch (Throwable t) {
            // fall through
        }
        return "Show all albums";
    }
}
