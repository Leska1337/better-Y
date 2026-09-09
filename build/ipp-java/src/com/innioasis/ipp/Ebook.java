package com.innioasis.ipp;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;

import com.innioasis.y1.R;
import com.innioasis.y1.base.BaseActivity;
import com.innioasis.y1.theme.ThemeManager;
import com.innioasis.y1_eBook.ui.main.MainActivity;

/**
 * The e-book Library becomes a section of its own, reached by a row of the same name.
 *
 * One Activity, two modes
 * There is no second Activity: {@code MainActivity} is opened again with {@link #EXTRA}, and which
 * of its own views are shown decides what the screen is. That is the whole point — "don't touch
 * the functionality" is satisfied literally, because opening a book, the delete menu, the book
 * list and "Continue Reading" all stay exactly where stock put them.
 *
 *   menu mode     rows 0..2 = Continue Reading / Local file / Library, the list hidden
 *   library mode  the list alone, the three rows hidden
 *
 * Why the cursor never goes below fixedSum in library mode
 * Stock's {@code mark} counts the fixed rows first and the books after them ({@code fixedSum} = 2),
 * and its centre-press tests {@code mark == 0} and {@code mark == 1} before treating the mark as a
 * book. Rather than renumber any of that, library mode simply keeps the cursor at or above
 * {@code fixedSum}: the hidden rows keep their numbers, every book keeps the number stock gave it,
 * and the branch that opens a book is reached by the same arithmetic as before. So
 * {@link #minMark} is the floor, {@link #maxMark} the ceiling, and both are the only places that
 * know which mode this is.
 *
 * Raw (non-generic) types throughout: the bundled d8 crashes dexing generic Signature attrs.
 */
public final class Ebook {

    private Ebook() { }

    /** Intent flag: this MainActivity is the Library, not the menu. */
    public static final String EXTRA = "ipp_library";

    /** The mark of the "Library" row in menu mode — the last of the three. */
    private static final int LIBRARY_ROW = 2;

    public static boolean library(Activity a) {
        try {
            return a != null && a.getIntent() != null && a.getIntent().getBooleanExtra(EXTRA, false);
        } catch (Throwable t) {
            return false;
        }
    }

    // ------------------------------------------------------------------------- which screen it is

    /**
     * Injected into {@code MainActivity.initView}, just before stock's own {@code showItem()}:
     * hide the half of the layout this mode is not, and in library mode put the cursor on the
     * first book and the section's name in the state bar.
     */
    public static void setup(Activity a) {
        try {
            if (a == null) return;
            boolean lib = library(a);
            View cont = a.findViewById(R.id.continue_reading);
            View local = a.findViewById(R.id.local_files);
            View row = a.findViewById(R.id.ipp_library_row);
            View caption = a.findViewById(R.id.book_library);
            View divider = a.findViewById(R.id.ipp_book_divider);
            View list = a.findViewById(R.id.recyclerView);

            show(cont, !lib);
            show(local, !lib);
            show(row, !lib);
            show(list, lib);
            // The caption and its rule belonged to the list while both lived on one screen. In the
            // menu they are replaced by the row; in the Library the state bar already says it.
            show(caption, false);
            show(divider, false);

            if (lib) {
                ((BaseActivity) a).setStateBarLeftText(a.getString(R.string.book_library));
                ((BaseActivity) a).setMark(LIBRARY_ROW);
            } else {
                label(row, a.getString(R.string.book_library));
            }
        } catch (Throwable t) {
            // a screen that cannot be re-arranged is still the stock screen
        }
    }

    private static void show(View v, boolean on) {
        if (v != null) v.setVisibility(on ? View.VISIBLE : View.GONE);
    }

    private static void label(View row, String text) {
        if (row == null) return;
        View tv = row.findViewById(R.id.tv_item);
        if (tv instanceof TextView) ((TextView) tv).setText(text);
    }

    // ------------------------------------------------------------------------------- the cursor

    /** Lowest mark this mode allows: the first book's own number in the Library, row 0 in the menu. */
    public static int minMark(Activity a, int fixedSum) {
        return library(a) ? fixedSum : 0;
    }

    /**
     * Highest mark this mode allows. In the menu it is the Library row, whatever the book list
     * holds — the list is not on screen. In the Library it is stock's own last row, with a floor
     * of {@code fixedSum} so an empty library cannot push the cursor onto a hidden row.
     */
    public static int maxMark(Activity a, int listSize, int fixedSum) {
        if (!library(a)) return LIBRARY_ROW;
        int last = (listSize - 1) + fixedSum;
        return last < fixedSum ? fixedSum : last;
    }

    /**
     * The floor the long-press menu (remove / delete a book) needs: stock refuses it below
     * {@code fixedSum}, i.e. on a fixed row. In the menu there is no book under the cursor at all,
     * so nothing may open it.
     */
    public static int menuFloor(Activity a, int fixedSum) {
        return library(a) ? fixedSum : Integer.MAX_VALUE;
    }

    // ------------------------------------------------------------------------------- the presses

    /**
     * Injected at the top of the centre-press branch of {@code direction}. True = handled here.
     *
     * Two cases: the Library row of the menu opens this same Activity as the Library, and a press
     * in an empty Library does nothing — stock would index the book list, which the floor above
     * keeps the cursor pointing into even when there is nothing in it.
     */
    public static boolean confirm(Activity a, int mark) {
        try {
            if (a == null) return false;
            if (!library(a)) {
                if (mark != LIBRARY_ROW) return false;
                Intent i = new Intent(a, MainActivity.class);
                i.putExtra(EXTRA, true);
                a.startActivity(i);
                return true;
            }
            return books(a) == 0;
        } catch (Throwable t) {
            return true;   // never fall through to "open the book at this index" after a failure
        }
    }

    private static int books(Activity a) {
        View v = a.findViewById(R.id.recyclerView);
        if (!(v instanceof RecyclerView)) return 0;
        RecyclerView.Adapter ad = ((RecyclerView) v).getAdapter();
        return ad == null ? 0 : ad.getItemCount();
    }

    // ------------------------------------------------------------------------------- the painting

    /**
     * Injected at the TOP of {@code showItem}, so stock reads the mark after this has settled it.
     *
     * Does the two things stock cannot know about: keeps the mark inside this mode's range (the
     * delete path sets it to 1 or 2 outright, which is below the Library's floor when the last
     * book goes), and paints the Library row, which is ours. Stock never touches that row, so the
     * two cannot fight over it.
     */
    public static void beforeShow(Activity a, int fixedSum) {
        try {
            if (a == null) return;
            BaseActivity b = (BaseActivity) a;
            int mark = b.getMark();
            int lo = minMark(a, fixedSum);
            if (mark < lo) { b.setMark(lo); mark = lo; }
            if (library(a)) return;
            paint(a.findViewById(R.id.ipp_library_row), mark == LIBRARY_ROW);
        } catch (Throwable t) {
            // cosmetic
        }
    }

    /**
     * The look of one fixed row, selected or not — the same calls stock's own private
     * {@code selItem} makes, which cannot be called from here (it takes a generated binding).
     * Kept identical to it on purpose: the three rows are the same row three times over.
     */
    private static void paint(View row, boolean sel) {
        if (row == null) return;
        View tv = row.findViewById(R.id.tv_item);
        View arrow = row.findViewById(R.id.iv_arrow);
        View box = row.findViewById(R.id.layout);
        if (box == null) box = row;
        if (tv instanceof TextView) {
            ThemeManager.INSTANCE.itemSetTextColor((TextView) tv,
                    sel ? Color.parseColor("#3CFFDE") : -1, sel);
        }
        if (arrow instanceof ImageView) {
            arrow.setVisibility(sel ? View.VISIBLE : View.GONE);
            if (sel) ThemeManager.INSTANCE.itemSetRightArrow((ImageView) arrow, R.mipmap.right_arrow);
        }
        ThemeManager.INSTANCE.itemSetBackground(box, sel ? R.drawable.bg_fm_menu_sel : 0, sel);
    }

    /**
     * The size and the date under a file's name in Local files.
     *
     * Stock paints the name through ThemeManager and leaves those two at {@code @color/white},
     * which on a light theme is a name in the theme's colour with two invisible lines beneath it.
     * They take whatever the name became, cursor row included — called from both halves of
     * {@code SearchActivity.selItem}, after it has painted the name.
     */
    public static void searchSub(com.innioasis.y1.databinding.ItemBookSearchBinding b) {
        if (b == null) return;
        Rows.subLine(b.name, b.size);
        Rows.subLine(b.name, b.time);
    }
}
