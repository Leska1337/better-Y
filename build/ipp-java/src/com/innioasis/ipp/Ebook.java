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
 * The e-book Library as a section of its own: the same {@code MainActivity} opened again with
 * {@link #EXTRA}, so every stock function stays where it was. Menu mode shows rows 0..2 (Continue
 * Reading / Local files / Library); library mode shows the list alone and keeps the cursor at or
 * above {@code fixedSum}, so every book keeps stock's numbering. {@link #minMark} and
 * {@link #maxMark} are the only places that know the mode.
 */
public final class Ebook {

    private Ebook() { }

    public static final String EXTRA = "ipp_library";

    private static final int LIBRARY_ROW = 2;

    public static boolean library(Activity a) {
        try {
            return a != null && a.getIntent() != null && a.getIntent().getBooleanExtra(EXTRA, false);
        } catch (Throwable t) {
            return false;
        }
    }

    /** In {@code MainActivity.initView}, before stock's {@code showItem()}. */
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
            // The row replaces them in the menu; in the Library the state bar says it.
            show(caption, false);
            show(divider, false);

            if (lib) {
                ((BaseActivity) a).setStateBarLeftText(a.getString(R.string.book_library));
                ((BaseActivity) a).setMark(LIBRARY_ROW);
            } else {
                label(row, a.getString(R.string.book_library));
            }
        } catch (Throwable t) {
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

    public static int minMark(Activity a, int fixedSum) {
        return library(a) ? fixedSum : 0;
    }

    /** Floored at {@code fixedSum}, so an empty library cannot put the cursor on a hidden row. */
    public static int maxMark(Activity a, int listSize, int fixedSum) {
        if (!library(a)) return LIBRARY_ROW;
        int last = (listSize - 1) + fixedSum;
        return last < fixedSum ? fixedSum : last;
    }

    /** No wheel acceleration on these screens, so {@link Loop#on}, not {@link Loop#wrap}. */
    public static int belowFirst(Activity a, int min, int listSize, int fixedSum) {
        return Loop.on() ? maxMark(a, listSize, fixedSum) : min;
    }

    /** -1 without loop scrolling. */
    public static int pastLast(Activity a, int fixedSum) {
        return Loop.on() ? minMark(a, fixedSum) : -1;
    }

    /** The long-press book menu: never in menu mode, where no book is under the cursor. */
    public static int menuFloor(Activity a, int fixedSum) {
        return library(a) ? fixedSum : Integer.MAX_VALUE;
    }

    /**
     * Top of the centre-press branch; true = handled. The Library row opens the Library; a press
     * in an empty Library does nothing (stock would index an empty list).
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

    /**
     * Top of {@code showItem}: clamps the mark into this mode's range (stock's delete path sets it
     * below the Library's floor) and paints the Library row, which stock never touches.
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
        }
    }

    /** Stock's private {@code selItem}, call for call — keep them identical. */
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

    /** Size and date under a Local files row take the name's colour (stock left them white). */
    public static void searchSub(com.innioasis.y1.databinding.ItemBookSearchBinding b) {
        if (b == null) return;
        Rows.subLine(b.name, b.size);
        Rows.subLine(b.name, b.time);
    }

    /**
     * Local files never lists our folder: its row menu DELETES files, and losing
     * {@code comma_artists.txt} silently drops the artist-splitting exceptions. Full path match.
     */
    public static boolean hidden(java.io.File f) {
        try {
            if (f == null) return false;
            java.io.File dir = Panel.card();
            return dir != null && f.getAbsolutePath().equals(dir.getAbsolutePath());
        } catch (Throwable t) {
            return false;
        }
    }
}
