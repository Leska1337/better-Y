package com.innioasis.ipp;

import android.app.Activity;
import android.content.Intent;
import android.view.View;
import android.widget.ListAdapter;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;

import com.innioasis.music.adapter.MainAdapter;
import com.innioasis.music.adapter.MyBaseAdapter;
import com.innioasis.y1.R;
import com.innioasis.y1.base.BaseActivity;
import com.innioasis.y1_eBook.ui.main.MainActivity;

/**
 * The e-book Library as a section of its own: the same {@code MainActivity} opened again with
 * {@link #EXTRA}, so every stock function stays where it was. Menu mode shows a Music-menu list of
 * marks 0..2 (Continue Reading / Local files / Library); library mode shows the list alone and
 * keeps the cursor at or above {@code fixedSum}, so every book keeps stock's numbering. {@link #minMark} and
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
            View menu = a.findViewById(R.id.ipp_book_menu);
            View caption = a.findViewById(R.id.book_library);
            View divider = a.findViewById(R.id.ipp_book_divider);
            View list = a.findViewById(R.id.recyclerView);

            // stock's two rows stay for the binding; the menu is the list of three
            show(cont, false);
            show(local, false);
            show(menu, !lib);
            show(list, lib);
            // The row replaces them in the menu; in the Library the state bar says it.
            show(caption, false);
            show(divider, false);

            if (lib) {
                ((BaseActivity) a).setStateBarLeftText(a.getString(R.string.book_library));
                ((BaseActivity) a).setMark(LIBRARY_ROW);
            } else if (menu instanceof RecyclerView) {
                java.util.ArrayList items = new java.util.ArrayList();
                items.add(a.getString(R.string.book_continue_read));
                items.add(a.getString(R.string.book_local_file));
                items.add(a.getString(R.string.book_library));
                SongRows.set((RecyclerView) menu, new MainAdapter(a, items));
            }
        } catch (Throwable t) {
        }
    }

    private static void show(View v, boolean on) {
        if (v != null) v.setVisibility(on ? View.VISIBLE : View.GONE);
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

    /**
     * Round the end only once it has come to rest; meanwhile, and with going round off, the bar
     * bounces against it ({@link Loop#wrap}).
     */
    public static int belowFirst(Activity a, int min, int listSize, int fixedSum) {
        return Loop.wrap() ? maxMark(a, listSize, fixedSum) : min;
    }

    /** -1 when the cursor does not go round, as in {@link #belowFirst}. */
    public static int pastLast(Activity a, int fixedSum) {
        return Loop.wrap() ? minMark(a, fixedSum) : -1;
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
     * below the Library's floor) and, in the menu, moves the list's cursor to it.
     */
    public static void beforeShow(Activity a, int fixedSum) {
        try {
            if (a == null) return;
            fixed = fixedSum;
            BaseActivity b = (BaseActivity) a;
            int mark = b.getMark();
            int lo = minMark(a, fixedSum);
            if (mark < lo) { b.setMark(lo); mark = lo; }
            if (library(a)) return;
            View v = a.findViewById(R.id.ipp_book_menu);
            if (!(v instanceof RecyclerView)) return;
            RecyclerView rv = (RecyclerView) v;
            ListAdapter la = SongRows.adapter(rv);
            if (!(la instanceof MyBaseAdapter)) return;
            // the model's cursor follows the mark without a notify: three rows, a step or two
            MyBaseAdapter m = (MyBaseAdapter) la;
            while (m.getPosition() > mark && m.getPosition() > 0) m.toPrevious();
            while (m.getPosition() < mark && m.getPosition() < m.getCount() - 1) m.toNext();
            Wheel.follow(rv, mark, rv.getAdapter());
        } catch (Throwable t) {
        }
    }

    /** {@code fixedSum} as {@code showItem} last passed it: the mark of the Library's first book. */
    private static int fixed = 2;

    static int firstMark() {
        return fixed;
    }

    /**
     * In place of stock's scroll after a wheel step in the Library and Local files: the list
     * follows the cursor as every other list does ({@code Wheel.follow}). {@code pos} is a row.
     */
    public static void step(RecyclerView rv, int pos) {
        if (rv == null || !rv.isShown() || pos < 0) return;
        Wheel.follow(rv, pos, rv.getAdapter());
    }

    /** {@link #librarySub} for a row the travelling bar has just recoloured. */
    static void librarySub(View row) {
        View p = row == null ? null : row.findViewById(R.id.progress);
        View t = row == null ? null : row.findViewById(R.id.time);
        if (!(p instanceof TextView) || !(p.getParent() instanceof android.view.ViewGroup)) return;
        android.view.ViewGroup line = (android.view.ViewGroup) p.getParent();
        for (int i = 0; i < line.getChildCount(); i++) {
            View v = line.getChildAt(i);
            if (v instanceof TextView && v != p && v != t) Rows.subLine((TextView) p, (TextView) v);
        }
    }

    /** Size and date under a Local files row take the name's colour (stock left them white). */
    public static void searchSub(com.innioasis.y1.databinding.ItemBookSearchBinding b) {
        if (b == null) return;
        Rows.subLine(b.name, b.size);
        Rows.subLine(b.name, b.time);
    }

    /**
     * The "Progress" and "Last read time" captions of a Library row take their values' colour
     * (stock painted the values and left the captions white). The captions have no id: they are
     * the other children of the values' own line.
     */
    public static void librarySub(com.innioasis.y1.databinding.ItemBookLibraryBinding b) {
        if (b == null || b.progress == null) return;
        android.view.ViewParent p = b.progress.getParent();
        if (!(p instanceof android.view.ViewGroup)) return;
        android.view.ViewGroup line = (android.view.ViewGroup) p;
        for (int i = 0; i < line.getChildCount(); i++) {
            android.view.View v = line.getChildAt(i);
            if (v instanceof TextView && v != b.progress && v != b.time) {
                Rows.subLine(b.progress, (TextView) v);
            }
        }
    }

    /**
     * Local files never lists our folder: its row menu DELETES files, and losing
     * {@code comma_artists.txt} silently drops the artist-splitting exceptions. Full path match.
     */
    public static boolean hidden(java.io.File f) {
        try {
            if (f == null) return false;
            walkNodes++;
            // the name first: both full paths for every node of the card cost seconds on a big one
            java.io.File dir = ours;
            if (dir == null) ours = dir = Panel.card();
            if (!f.getName().equals(dir.getName())) return false;
            return dir != null && f.getAbsolutePath().equals(dir.getAbsolutePath());
        } catch (Throwable t) {
            return false;
        }
    }

    private static java.io.File ours;

    // the Local files walk, one at a time on its IO thread: what it cost goes to the log
    private static long walkT0, walkListMs;
    private static int walkDirs, walkNodes;

    public static void walkStart() {
        walkT0 = android.os.SystemClock.uptimeMillis();
        walkListMs = 0;
        walkDirs = 0;
        walkNodes = 0;
    }

    /** {@code listFiles} of the walk, timed apart from the looks at each child. */
    public static java.io.File[] list(java.io.File dir) {
        long t0 = android.os.SystemClock.uptimeMillis();
        java.io.File[] r = dir.listFiles();
        walkListMs += android.os.SystemClock.uptimeMillis() - t0;
        walkDirs++;
        return r;
    }

    private static java.io.File lastNode;
    private static boolean lastDir;

    /**
     * {@code isDirectory} for the walk, which asks it twice per child (the filter, then the loop)
     * one right after the other: the second answer is the first one's. A name with a media, picture
     * or text extension is a file without asking the card: a folder named like that is not walked.
     */
    public static boolean dir(java.io.File f) {
        if (f != lastNode) {
            String name = f.getName();
            int dot = name.lastIndexOf('.');
            String ext = dot < 0 ? "" : name.substring(dot + 1).toLowerCase(java.util.Locale.ROOT);
            lastDir = !Scan.fileExt(ext) && f.isDirectory();
            lastNode = f;
        }
        return lastDir;
    }

    public static void walkEnd(java.util.List found) {
        lastNode = null;
        Diag.note("local files: " + (found == null ? 0 : found.size()) + " found, " + walkDirs
                + " dirs, " + walkNodes + " nodes, " + (android.os.SystemClock.uptimeMillis() - walkT0)
                + " ms, listFiles " + walkListMs + " ms");
    }
}
