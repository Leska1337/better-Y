package com.innioasis.ipp;

import android.content.Context;
import android.os.SystemClock;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import androidx.recyclerview.widget.RecyclerView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.innioasis.music.GenresActivity;
import com.innioasis.music.adapter.AlbumListAdapter;
import com.innioasis.music.adapter.MainAdapter;
import com.innioasis.music.adapter.MyBaseAdapter;

import com.innioasis.music.data.Album;
import com.innioasis.music.data.Genre;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;

/**
 * The "Show all …" button rows of Genres and of album lists: Genres' "Show all albums" (stock's
 * "All Albums", row 0 of the artist level) and an album list's "Show all songs". As in Folders: no
 * tick, no long-press menu, and the cursor does not START on one.
 */
public final class Mark {

    private Mark() { }

    /** Row 0 of Genres' artist level. */
    public static boolean isGenreAllAlbums(Object adapter, int position) {
        if (position != 0 || !(adapter instanceof MainAdapter)) return false;
        Context c = ((MainAdapter) adapter).getContext();
        return c instanceof GenresActivity;
    }

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

    // Noted when a genre's album list is asked for, consumed when it comes back (through a static
    // lambda with no field for it); nothing in between can open another genre.
    private static String pendingGenre;
    private static Genre genreObj;

    public static void noteGenre(Genre g) {
        pendingGenre = g == null ? null : g.getName();
        genreObj = g;
    }

    /**
     * Genres, picking an ARTIST: that artist's albums within the genre, with "Show all songs" on
     * top, as in Artists. Album keys are the usual encoded names, so opening one applies the genre
     * in {@code Albums.songsSync}. False = nothing to show; stock's branch runs.
     */
    public static boolean artistAlbums(GenresActivity a, String artist) {
        try {
            if (a == null || artist == null || artist.length() == 0) return false;
            long t0 = SystemClock.uptimeMillis();
            // The same test that built the artist row (Artists.byTag), or the row opens empty.
            List songs = Artists.forMenu(artist, genreObj);
            Diag.slow("genre artist songs", t0);
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
            // On the main thread: a year sort uses cached years and reads the rest on a thread.
            Genres.albums(names, a);
            names.add(0, Albums.artistMark(artist));

            a.setStateBarLeftText(Artists.display(artist));
            a.showOrHideNone(names.size());

            AlbumListAdapter ad = a.getAdapter3_1();
            List sel = ad.getSelectedIndexList();
            if (sel != null) sel.clear();
            ad.setAlbums(names);

            View lv = ((android.app.Activity) a).findViewById(R.id.lv);
            if (!Lv.is(lv)) return false;
            Lv.go(lv, ad, 0);
            afterFill(ad, lv);
            Diag.slow("genre artist albums", t0);
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    /**
     * "Show all songs" on top of a genre's album list. {@code setAlbums} takes NAMES, so the row is
     * the marker string — an {@link Album} there throws {@code ClassCastException}.
     */
    public static void genreAlbums(List albums) {
        try {
            String g = pendingGenre;
            if (g == null || albums == null || albums.isEmpty()) return;
            Object first = albums.get(0);
            if (first instanceof String && Albums.isGenreAll((String) first)) return;
            albums.add(0, Albums.genreMark(g));
        } catch (Throwable t) {
        }
    }

    /** Without the marker byte. */
    public static String title(String albumName) {
        return Albums.realName(albumName);
    }

    public static boolean blocked(Object adapter, int position) {
        return isGenreAllAlbums(adapter, position) || isAllSongsRow(adapter, position);
    }

    /** The cursor is on a button; top of a screen's {@code longConfirm}, for every level. */
    public static boolean blockedList(View lv) {
        try {
            Object a = lv == null ? null : Lv.model(lv);
            if (!(a instanceof MyBaseAdapter)) return false;
            return blocked(a, ((MyBaseAdapter) a).getPosition());
        } catch (Throwable t) {
            return false;
        }
    }

    /** After "Select all"'s loop, which ticks every row. */
    public static void dropMarks(Object adapter, List selected) {
        try {
            if (selected == null || selected.isEmpty()) return;
            for (int i = selected.size() - 1; i >= 0; i--) {
                Object o = selected.get(i);
                if (!(o instanceof Integer)) continue;
                if (blocked(adapter, ((Integer) o).intValue())) selected.remove(i);
            }
        } catch (Throwable t) {
        }
    }

    /** Moves the cursor off a leading button, only while it is still on row 0 (a fresh list). */
    public static void afterFill(Object adapter) {
        afterFill(adapter, (View) null);
    }

    /**
     * @param lv kept resting at row 0 while the cursor goes to row 1, or the button scrolls off
     *           the top — so NOT {@code Other.gotoAdapter(lv, a, 1)}.
     */
    public static void afterFill(Object adapter, View lv) {
        try {
            if (!(adapter instanceof MyBaseAdapter)) return;
            MyBaseAdapter a = (MyBaseAdapter) adapter;
            if (a.getPosition() != 0 || a.getCount() < 2) return;
            if (!blocked(a, 0)) return;
            a.setPosition(1);
            if (lv != null) Lv.select(lv, 0);
        } catch (Throwable t) {
        }
    }

    /**
     * In multi-select the cursor never stops on a button. End of both wheel handlers, as
     * {@code Folders.skipMark}; always pushes DOWN — the button is the first row.
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
            if (to < n) a.setPosition(to);      // setPosition notifies
        } catch (Throwable t) {
        }
    }

    /**
     * Genres' "Show all albums" row, at the END of {@code MainAdapter.getView}: the icon copies the
     * text colour already set. Both states are written on every bind — rows are recycled.
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
            // As tall as an album row, not a menu row; item_main.xml is every other row too.
            rowHeight(row, 0);
            labelTop(tv, false);
            iv.setVisibility(View.VISIBLE);
            iv.setImageResource(R.mipmap.ipp_show_all_albums);
            if (tv != null) Icons.menu(iv, tv.getCurrentTextColor());
        } catch (Throwable t) {
        }
    }

    /** By LABEL: at the end of {@code MainAdapter.getView} the position register is reused. */
    private static boolean isAllAlbumsLabel(Object adapter, TextView tv) {
        if (tv == null || !(adapter instanceof MainAdapter)) return false;
        Context c = ((MainAdapter) adapter).getContext();
        if (!(c instanceof GenresActivity)) return false;
        CharSequence s = tv.getText();
        return s != null && allAlbumsLabel().contentEquals(s);
    }

    /**
     * A menu row's label is top-aligned (so the marquee does not shift it); the taller button
     * centres its label instead, and recycled rows get the top alignment back.
     */
    private static void labelTop(TextView tv, boolean top) {
        try {
            if (tv == null) return;

            // One pixel from bottom padding to top: measured, it lines the glyphs up with the
            // album list's "Show all songs" row.
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
        }
    }

    /** {@code item_album}'s height, cover box included. */
    private static final int MARK_ROW_DIP = 60;

    /** @param dimen 0 for the album row's height. */
    private static void rowHeight(View row, int dimen) {
        try {
            int want = dimen != 0
                    ? row.getResources().getDimensionPixelSize(dimen)
                    : (int) (MARK_ROW_DIP * row.getResources().getDisplayMetrics().density + 0.5f);
            ViewGroup.LayoutParams lp = row.getLayoutParams();
            if (lp == null) {
                row.setLayoutParams(new RecyclerView.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, want));
                return;
            }
            if (lp.height == want) return;
            lp.height = want;
            row.setLayoutParams(lp);
        } catch (Throwable t) {
        }
    }

    public static String allAlbumsLabel() {
        try {
            Context c = Y1Application.Companion.getAppContext();
            if (c != null) return c.getString(R.string.ipp_show_all_albums);
        } catch (Throwable t) {
        }
        return "Show all albums";
    }
}
