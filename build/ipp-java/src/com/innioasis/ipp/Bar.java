package com.innioasis.ipp;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.view.Choreographer;
import android.view.View;
import android.view.ViewParent;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

import com.innioasis.y1.R;
import com.innioasis.y1.base.BaseActivity;
import com.innioasis.y1.theme.ThemeManager;

/**
 * The travelling highlight of the menu lists (main menu, Settings, Language, Wallpaper,
 * Equalizer, Videos, Search, video search, Playlists as a list, the FM menu, the queue): the list
 * paints every row's background itself and draws the selected one as a bar that slides from row
 * to row, kept inside the list's edges while the rows move under it. On a jump (round the list's end) the rows and
 * the bar move at once, in the same frame. Ticked rows of a multi-select keep a still highlight
 * and the bar blinks. Only with "Enable animations"; off, the rows paint themselves as stock does.
 */
public final class Bar extends RecyclerView.ItemDecoration
        implements Choreographer.FrameCallback, RecyclerView.OnChildAttachStateChangeListener, Loop.Bumper {

    /**
     * What one screen's rows are made of, and the colours stock gives them. {@code bgs}: the views
     * stock paints the background on, when not the row itself. {@code byAdapter}: the cursor is
     * the adapter's ({@code RVBaseAdapter}), not the screen's mark.
     */
    static final class Spec {
        final int list, selRes, rowRes, selColor, rowColor, arrow;
        final int[] texts;
        int[] bgs = new int[0];
        /** A second arrow id, for a screen whose lists draw different rows (Genres). */
        int arrow2;
        boolean byAdapter;
        /** Subtracted from the screen's mark: the mark of the list's first row (E-book's Library). */
        int markBase;
        /** A list above this one on the same marks: its rows are subtracted too (Bluetooth). */
        int markList;
        /** A row ABOVE the list that the cursor stands on as position -1 (Search's input line). */
        int head;
        /** The row stands BELOW the list, the cursor on it is the list's count (the import's button). */
        boolean headBelow;
        /** That row's own look when no bar stands on it: its highlight, its plain text (0 = the rows'). */
        int headSel = R.drawable.item_selected;
        int headColor;
        /** The long-press menus: the theme's menu colours and backgrounds, not its list rows'. */
        boolean menu;

        Spec(int list, int selRes, int rowRes, int selColor, int rowColor, int[] texts, int arrow) {
            this.list = list;
            this.selRes = selRes;
            this.rowRes = rowRes;
            this.selColor = selColor;
            this.rowColor = rowColor;
            this.texts = texts;
            this.arrow = arrow;
        }
    }

    /** Stock's cursor colour on the Settings family of rows, and its plain white. */
    private static final int ACCENT = 0xFF3CFFDE;
    private static final int WHITE = 0xFFFFFFFF;

    private static Spec spec(BaseActivity a) {
        if (a instanceof com.innioasis.y1.activity.MainActivity) {
            return new Spec(R.id.rc_list, R.drawable.item_setting_sel, R.drawable.item_no_selected,
                    a.getResources().getColor(R.color.selected_text_color),
                    a.getResources().getColor(R.color.white), new int[] {R.id.tv_item}, R.id.iv_arrow);
        }
        if (a instanceof com.innioasis.y1.activity.SettingActivity) {
            return new Spec(R.id.recycler, R.drawable.item_setting_sel, 0, ACCENT, WHITE,
                    new int[] {R.id.title, R.id.text}, R.id.arrow);
        }
        if (a instanceof com.innioasis.y1.activity.LanguageActivity) {
            return new Spec(R.id.recycler, R.drawable.item_selected_no_arrow, R.drawable.item_no_selected,
                    a.getResources().getColor(R.color.selected_text_color),
                    a.getResources().getColor(R.color.white), new int[] {R.id.tv_item}, R.id.iv_arrow);
        }
        if (a instanceof com.innioasis.y1.activity.WallpaperListActivity) {
            return new Spec(R.id.recycler, R.drawable.item_selected_no_arrow, 0, ACCENT, WHITE,
                    new int[] {R.id.title, R.id.text}, R.id.arrow);
        }
        if (a instanceof com.innioasis.y1.activity.EqActivity) {
            return new Spec(R.id.recycler_list, R.drawable.item_selected_no_arrow, 0, ACCENT, WHITE,
                    new int[] {R.id.text}, 0);
        }
        if (a instanceof com.innioasis.y1.activity.video.VideoListActivity) {
            Spec s = plain(a, R.id.recycler, new int[] {R.id.file_name, R.id.video_name, R.id.video_time});
            s.bgs = new int[] {R.id.video_layout, R.id.file_layout};
            return s;
        }
        if (a instanceof com.innioasis.music.SearchActivity
                || a instanceof com.innioasis.y1.activity.video.SearchVideoActivity) {
            Spec s = plain(a, R.id.search_list, new int[] {R.id.title, R.id.info});
            s.byAdapter = true;
            s.head = R.id.search_head;
            return s;
        }
        if (a instanceof com.innioasis.music.PlaylistsActivity) {
            Spec s = plain(a, R.id.playlist, new int[] {R.id.tv_item});
            s.byAdapter = true;
            return s;
        }
        if (a instanceof com.innioasis.y1.activity.IppQueueActivity) {
            // the playing row pinned above the list is the cursor's position -1
            Spec s = new Spec(R.id.recycler, R.drawable.item_setting_sel, 0, ACCENT, WHITE,
                    new int[] {R.id.title, R.id.text, R.id.tv_item}, 0);
            s.head = R.id.search_head;
            s.headSel = R.drawable.item_setting_sel;
            s.headColor = a.getResources().getColor(R.color.selected_text_color);
            return s;
        }
        if (a instanceof com.innioasis.music.SongListActivity
                || a instanceof com.innioasis.music.PlayListActivity) {
            // the Shuffle row is the list's row 0, the cursor the adapter's (SongRows)
            Spec s = new Spec(R.id.lv, R.drawable.item_selected_no_arrow, R.drawable.item_no_selected,
                    a.getResources().getColor(R.color.selected_text_color),
                    a.getResources().getColor(R.color.white),
                    new int[] {R.id.tv_song_index, R.id.tv_song_name, R.id.tv_artists}, R.id.right_arrow);
            s.byAdapter = true;
            return s;
        }
        if (a instanceof com.innioasis.music.GenresActivity
                || a instanceof com.innioasis.music.AlbumsActivity
                || a instanceof com.innioasis.music.ArtistsActivity) {
            // several lists through one RecyclerView (SongRows): genres, artists, albums, songs
            Spec s = new Spec(R.id.lv, R.drawable.item_selected_no_arrow, R.drawable.item_no_selected,
                    a.getResources().getColor(R.color.selected_text_color),
                    a.getResources().getColor(R.color.white),
                    new int[] {R.id.genre_name, R.id.info, R.id.tv_item, R.id.album_name, R.id.artist_name,
                            R.id.tv_song_index, R.id.tv_song_name, R.id.tv_artists}, R.id.right_arrow);
            s.arrow2 = R.id.iv_arrow;
            s.byAdapter = true;
            return s;
        }
        if (a instanceof com.innioasis.y1.activity.AllAudiobooksActivity
                || a instanceof com.innioasis.y1.activity.BookMarkActivity) {
            // books and bookmarks share item_player; the Shuffle row of the books is row 0 (SongRows)
            int list = a instanceof com.innioasis.y1.activity.BookMarkActivity ? R.id.lv_bookmark : R.id.lv_audiobooks;
            Spec s = new Spec(list, R.drawable.item_selected_no_arrow, R.drawable.item_no_selected,
                    a.getResources().getColor(R.color.selected_text_color),
                    a.getResources().getColor(R.color.white),
                    new int[] {R.id.ipp_book_index, R.id.tv_name, R.id.tv_prograss}, 0);
            s.byAdapter = true;
            return s;
        }
        if (a instanceof com.innioasis.y1_eBook.ui.main.MainActivity && Ebook.library(a)
                || a instanceof com.innioasis.y1_eBook.ui.search.SearchActivity) {
            // the Library and Local files: the cursor is the screen's mark, past the menu's rows
            boolean lib = a instanceof com.innioasis.y1_eBook.ui.main.MainActivity;
            Spec s = new Spec(R.id.recyclerView, R.drawable.bg_fm_menu_sel, 0, ACCENT, WHITE,
                    lib ? new int[] {R.id.name, R.id.progress, R.id.time} : new int[] {R.id.name, R.id.size, R.id.time},
                    lib ? R.id.iv_arrow : 0);
            s.bgs = new int[] {R.id.layout};
            if (lib) s.markBase = Ebook.firstMark();
            return s;
        }
        if (a instanceof com.innioasis.music.MusicMainActivity
                || a instanceof com.innioasis.y1.activity.EbookActivity
                || a instanceof com.innioasis.y1_eBook.ui.main.MainActivity) {
            // the E-book menu is a Music menu list of its own id (Ebook)
            boolean book = a instanceof com.innioasis.y1_eBook.ui.main.MainActivity;
            Spec s = plain(a, book ? R.id.ipp_book_menu : R.id.lv, new int[] {R.id.tv_item});
            s.byAdapter = true;
            return s;
        }
        if (a instanceof com.innioasis.y1.activity.PlayerActivity) {
            // the artists or the albums of Audiobooks: Music menu rows (item_main)
            Spec s = plain(a, R.id.lv_audiobooks, new int[] {R.id.tv_item});
            s.byAdapter = true;
            return s;
        }
        if (a instanceof com.innioasis.music.FilesActivity) {
            // a folder of Music or Audiobooks, its own Activity per folder (SongRows)
            Spec s = new Spec(R.id.lv, R.drawable.item_selected_no_arrow, R.drawable.item_no_selected,
                    a.getResources().getColor(R.color.selected_text_color),
                    a.getResources().getColor(R.color.white),
                    new int[] {R.id.file_name}, R.id.right_arrow);
            s.byAdapter = true;
            return s;
        }
        if (a instanceof com.innioasis.fm.MenuActivity) {
            // four levels through this one list, each its own adapter (ipp-fm)
            return new Spec(R.id.recycler, R.drawable.bg_fm_menu_sel, 0, ACCENT, WHITE,
                    new int[] {R.id.tv_item, R.id.text}, R.id.iv_arrow);
        }
        return null;
    }

    /**
     * Every list of the screen that carries a bar. The better-Y menu has two, its groups and the
     * rows of one group, shown one at a time; the cursor is the mark of whichever is shown.
     */
    private static Spec[] specs(BaseActivity a) {
        if (a instanceof com.innioasis.y1.activity.IppActivity) {
            // the groups are the Music menu's own rows, the rows a stock Settings row's
            Spec cats = new Spec(R.id.rc_list, R.drawable.item_selected_no_arrow, R.drawable.item_no_selected,
                    a.getResources().getColor(R.color.selected_text_color),
                    a.getResources().getColor(R.color.white), new int[] {R.id.tv_item}, R.id.iv_arrow);
            Spec rows = new Spec(R.id.recycler, R.drawable.item_setting_sel, 0, ACCENT, WHITE,
                    new int[] {R.id.title, R.id.text, R.id.tv_item}, R.id.arrow);
            // the highlight is the inner line's, under the hairline: a row left lit while the bar
            // was off keeps it there
            rows.bgs = new int[] {R.id.layout};
            return new Spec[] {cats, rows};
        }
        if (a instanceof com.innioasis.y1.activity.BluetoothActivity) {
            // the On/Off line is mark 0, the paired devices follow, the found ones after them;
            // across the headings between the parts the bar jumps
            Spec mine = blue(a, R.id.recycler_my_device);
            // the On/Off line is the first list's position -1: the bar stands and bounces there
            mine.head = R.id.layout_title;
            mine.headSel = R.drawable.item_selected_no_arrow;
            Spec other = blue(a, R.id.recycler_other_device);
            other.markList = R.id.recycler_my_device;
            return new Spec[] {mine, other};
        }
        Spec s = spec(a);
        return s == null ? new Spec[0] : new Spec[] {s};
    }

    private static Spec blue(BaseActivity a, int list) {
        Spec s = new Spec(list, R.drawable.bg_bl_sel, 0,
                a.getResources().getColor(R.color.selected_text_color),
                a.getResources().getColor(R.color.white), new int[] {R.id.tv_name, R.id.tv_state, R.id.tv_title}, 0);
        s.markBase = 1;
        return s;
    }

    /** The music and video lists: stock's selected row and plain row, its two text colours. */
    private static Spec plain(BaseActivity a, int list, int[] texts) {
        return new Spec(list, R.drawable.item_selected_no_arrow, R.drawable.item_no_selected,
                a.getResources().getColor(R.color.selected_text_color),
                a.getResources().getColor(R.color.white), texts, R.id.iv_arrow);
    }

    /**
     * The bar's spring, critically damped: it starts and lands softly, never runs past its row, and
     * a new target only bends its path, so under a turning wheel it trails the cursor a little. A
     * step of one row settles in about 160 ms.
     */
    private static final float OMEGA = 30f;
    /** Rows the cursor may move between two frames and still be glided to. */
    private static final int JUMP = 4;

    private static final WeakHashMap BARS = new WeakHashMap();

    private final WeakReference rv;
    private final WeakReference activity;
    private final Spec spec;
    private final View selProbe;
    private final View rowProbe;
    private final int selText;
    private final int rowText;
    private final int headText;
    private float y = Float.NaN;
    /** The spring's speed, px/s, and where it left the bar last frame. */
    private float vel, movedTo = Float.NaN;
    /** A bounce against the list's end ({@link #bump}): the cursor's row stays lit, and wrapping does not wait for it. */
    private boolean bouncing;
    private float bounceGoal;
    /** A jump: the bar waits for the cursor's row to be laid out, then stands on it. */
    private boolean snap;
    private int lastPos = -1;
    private long last;
    private boolean running;
    /** The multi-select blink's dark half: the screen's timer says so, a bind of the cursor's row undoes it. */
    private boolean blinkOff;
    private long blinkAt;
    /** The bar's height as drawn: it changes on its way between rows of different heights. */
    private float hb = Float.NaN;
    private final WeakReference head;
    /** The one reference ROWS maps this bar's rows to. */
    private final WeakReference self = new WeakReference(this);
    private final HeadPaint headPaint = new HeadPaint(this);
    /** What the input line last showed of the bar; it is redrawn only when that changes. */
    private long headKey = NO_KEY;
    /** Not Long.MIN_VALUE: its constant does not assemble (const-wide/high16). */
    private static final long NO_KEY = 0x7ffffffffffffffeL;

    /** A screen just opened lays itself out over several frames: the bar stands on its row meanwhile. */
    private static final long OPEN_MS = 400L;
    private final long standUntil = android.os.SystemClock.uptimeMillis() + OPEN_MS;

    private boolean opening() {
        return android.os.SystemClock.uptimeMillis() < standUntil;
    }

    private Bar(RecyclerView rv, BaseActivity a, Spec spec) {
        this.rv = new WeakReference(rv);
        this.activity = new WeakReference(a);
        this.spec = spec;
        View hv = spec.head == 0 ? null : ((android.app.Activity) a).findViewById(spec.head);
        head = new WeakReference(hv);
        if (hv != null) ROWS.put(hv, self);
        Context c = rv.getContext().getApplicationContext();
        selProbe = new View(c);
        rowProbe = new View(c);
        ThemeManager tm = ThemeManager.INSTANCE;
        if (spec.menu) {
            tm.menuItemSetBackground(selProbe, spec.selRes, true);
            tm.menuItemSetBackground(rowProbe, spec.rowRes, false);
        } else {
            tm.itemSetBackground(selProbe, spec.selRes, true);
            tm.itemSetBackground(rowProbe, spec.rowRes, false);
        }
        // read back: the theme answers with its own colour, not the one asked for
        TextView t = new TextView(c);
        if (spec.menu) tm.menuItemSetTextColor(t, spec.selColor, true);
        else tm.itemSetTextColor(t, spec.selColor, true);
        selText = t.getCurrentTextColor();
        if (spec.menu) tm.menuItemSetTextColor(t, spec.rowColor, false);
        else tm.itemSetTextColor(t, spec.rowColor, false);
        rowText = t.getCurrentTextColor();
        if (spec.headColor != 0) ThemeManager.INSTANCE.itemSetTextColor(t, spec.headColor, false);
        headText = spec.headColor != 0 ? t.getCurrentTextColor() : rowText;
    }

    /**
     * End of {@code BaseActivity.onResume} (through MenuStyle.apply): on before the first frame,
     * and "Enable animations" may have changed in the better-Y menu while the screen was covered.
     */
    public static void apply(android.app.Activity act) {
        try {
            if (!(act instanceof BaseActivity)) return;
            BaseActivity a = (BaseActivity) act;
            Spec[] ss = specs(a);
            for (int i = 0; i < ss.length; i++) apply(a, ss[i]);
        } catch (Throwable t) {
        }
    }

    private static void apply(BaseActivity a, Spec s) {
        View v = ((android.app.Activity) a).findViewById(s.list);
        if (v instanceof RecyclerView) attach(a, (RecyclerView) v, s);
    }

    /**
     * Top of {@code SubMenuDialog.onStart} and {@code SubMenuVideoDialog.onStart} (through Menus):
     * the long-press menu's list gets a bar of its own, standing on the cursor at every show.
     */
    static void dialog(android.app.Dialog d) {
        try {
            View v = d.findViewById(R.id.submenu);
            Context c = d.getContext();
            while (!(c instanceof BaseActivity) && c instanceof android.content.ContextWrapper) {
                c = ((android.content.ContextWrapper) c).getBaseContext();
            }
            if (!(v instanceof RecyclerView) || !(c instanceof BaseActivity)) return;
            BaseActivity a = (BaseActivity) c;
            Spec s = new Spec(R.id.submenu, R.drawable.item_selected_submenu, 0,
                    a.getResources().getColor(R.color.selected_text_color_submenu),
                    a.getResources().getColor(R.color.white), new int[] {R.id.submenu_item}, 0);
            s.bgs = new int[] {R.id.submenu_item};
            s.byAdapter = true;
            s.menu = true;
            RecyclerView rv = (RecyclerView) v;
            attach(a, rv, s);
            // every show is a new window: the colours' listener went with the old one
            Bar b = (Bar) BARS.get(rv);
            if (b != null) {
                rv.getViewTreeObserver().removeOnPreDrawListener(b.tinter);
                rv.getViewTreeObserver().addOnPreDrawListener(b.tinter);
            }
            relist(rv);
        } catch (Throwable t) {
        }
    }

    /**
     * A list a screen builds itself ({@link Column}), in an Activity or a dialog over one: the
     * cursor is its adapter's. {@code foot}: the id of a row below the list the cursor stands on
     * as position count (the import's button), 0 for none. Every show of a dialog is a new window:
     * the colours' listener is hung again.
     */
    static void column(android.app.Activity act, RecyclerView rv, boolean menu, int selRes,
            int selColor, int rowColor, int[] texts, int foot) {
        try {
            if (!(act instanceof BaseActivity)) return;
            Spec s = new Spec(rv.getId(), selRes, 0, selColor, rowColor, texts, 0);
            s.byAdapter = true;
            s.menu = menu;
            if (foot != 0) {
                s.head = foot;
                s.headBelow = true;
                s.headSel = selRes;
                s.headColor = selColor;
            }
            attach((BaseActivity) act, rv, s);
            Bar b = (Bar) BARS.get(rv);
            if (b != null) {
                rv.getViewTreeObserver().removeOnPreDrawListener(b.tinter);
                rv.getViewTreeObserver().addOnPreDrawListener(b.tinter);
            }
            relist(rv);
        } catch (Throwable t) {
        }
    }

    /** The tag of a row's tick box: it takes the colour the bar gives the row's text. */
    public static final String TICK = "ipp_tick";

    private static void attach(BaseActivity a, RecyclerView rv, Spec s) {
        try {
            Bar b = (Bar) BARS.get(rv);
            boolean on = Anim.on();
            if (on == (b != null)) {
                // a screen come back to: whatever stock repainted meanwhile is coloured again
                if (b != null) b.dirty = true;
                return;
            }
            if (on) {
                b = new Bar(rv, a, s);
                BARS.put(rv, b);
                rv.addItemDecoration(b);
                rv.addOnChildAttachStateChangeListener(b);
                rv.getViewTreeObserver().addOnPreDrawListener(b.tinter);
            } else {
                BARS.remove(rv);
                rv.removeItemDecoration(b);
                rv.removeOnChildAttachStateChangeListener(b);
                rv.getViewTreeObserver().removeOnPreDrawListener(b.tinter);
                b.stop();
                b.undressHead();
            }
            Wheel.glides(rv, on);
            if (rv.getAdapter() != null) rv.getAdapter().notifyDataSetChanged();
        } catch (Throwable t) {
        }
    }

    /**
     * End of every {@code BaseBindingAdapter} bind: a bound row of a bar's list loses its
     * background, cursor arrow and text colours to the list.
     */
    public static void bound(androidx.viewbinding.ViewBinding vb) {
        row(vb == null ? null : vb.getRoot());
    }

    /** End of both {@code RVBaseAdapter.onBindViewHolder}: the same for their rows. */
    public static void row(View row) {
        try {
            Bar b = row == null ? null : of(row);
            if (b == null) return;
            RecyclerView r = (RecyclerView) b.rv.get();
            if (r == null || !live(r)) return;
            // a bind of the cursor's row lights it, as stock's bind lights its background
            if (row.getParent() == r && r.getChildLayoutPosition(row) == b.cursor()) b.blinkOff = false;
            b.dirty = true;
            b.clean(row);
            // The bar is the LIST's drawing: a row repainted redraws only the row. Where nothing
            // else moves the list (the Equalizer's ten rows) the bar stood where it was.
            r.invalidate();
        } catch (Throwable t) {
        }
    }

    /** A row entering the list mid-glide was bound before it had a parent: taken in here. */
    public void onChildViewAttachedToWindow(View row) {
        try {
            RecyclerView r = (RecyclerView) rv.get();
            dirty = true;
            if (r != null && live(r)) clean(row);
        } catch (Throwable t) {
        }
    }

    public void onChildViewDetachedFromWindow(View row) {
    }

    /** A grid (Playlists as tiles) keeps its own frame: the bar draws nothing and touches no row. */
    private static boolean live(RecyclerView r) {
        return !(r.getLayoutManager() instanceof androidx.recyclerview.widget.GridLayoutManager);
    }

    /**
     * The tag of a list child that is not a row (the queue's group captions): the bar neither
     * paints under it nor strips or tints it, and the cursor never stands on it.
     */
    public static final Object CAPTION = new Object();

    private static boolean caption(View v) {
        return v.getTag() == CAPTION;
    }

    /**
     * The disc strip on top of a disc's first row: its bottom within the row, 0 = none. The bar
     * stands under it, as it stands under a caption.
     */
    private static int strip(View row) {
        View s = row == null ? null : row.findViewById(R.id.tv_disc_header);
        if (s == null || s.getVisibility() != View.VISIBLE || s.getHeight() == 0) return 0;
        int y = s.getBottom();
        for (ViewParent p = s.getParent(); p instanceof View && p != row; p = p.getParent()) {
            y += ((View) p).getTop();
        }
        return y;
    }

    /**
     * A queue caption between where the bar is and where it goes: the bar jumps it. A disc strip
     * or the pinned plate it slides across, as Cover Flow's track window does.
     */
    private static boolean crosses(RecyclerView r, float from, float fromH, float to, float toH) {
        if (Math.abs(to - from) < 0.5f) return false;
        boolean down = to > from;
        float gapTop = down ? from + fromH : to + toH;
        float gapBottom = down ? to : from;
        // outside the list: the queue's caption pinned between its playing row and the list
        if (gapTop < -1 && gapBottom >= 0) return true;
        for (int i = 0; i < r.getChildCount(); i++) {
            View v = r.getChildAt(i);
            if (!caption(v)) continue;
            float t = v.getTop() + v.getTranslationY();
            if (t >= gapTop - 1 && t + v.getHeight() <= gapBottom + 1) return true;
        }
        return false;
    }

    /** An adapter of our own that says where the cursor is, as a row of the list. */
    public interface Cursor {
        int cursor();
    }

    /** The list carries a bar: its rows leave their backgrounds to it. */
    static boolean on(RecyclerView r) {
        return r != null && BARS.get(r) != null && live(r);
    }

    /** An adapter of our own that keeps the multi-select ticks. */
    public interface Ticks {
        boolean ticked(int pos);
    }

    private void clean(View row) {
        if (caption(row)) return;
        WeakReference me = self;
        if (ROWS.get(row) != me) ROWS.put(row, me);
        if (spec.bgs.length == 0) {
            blank(row);
        } else {
            for (int i = 0; i < spec.bgs.length; i++) {
                View v = row.findViewById(spec.bgs[i]);
                if (v == null) continue;
                // known by memory: the theme's late bitmap lands on THIS view (landed)
                ROWS.put(v, me);
                blank(v);
            }
        }
        // the disc strip lets the bar through: its background is drawn under the rows (onDraw)
        View st = row.findViewById(R.id.tv_disc_header);
        if (st != null && st.getVisibility() == View.VISIBLE) {
            ROWS.put(st, me);
            blank(st);
        }
        View arrow = arrowOf(row);
        if (arrow != null && arrow.getVisibility() == View.VISIBLE) arrow.setVisibility(View.INVISIBLE);
        tint(row, row.getHeight());
    }

    private static final Drawable EMPTY = new android.graphics.drawable.ColorDrawable(0);

    /**
     * The row's background emptied INSIDE a {@code Rows.Flat}, once wrapped: swapping a wrapper's
     * content asks no layout, while setting or clearing a background re-lays out the whole window
     * (Settings with its panel) on every click.
     */
    static void blank(View row) {
        Drawable d = row.getBackground();
        if (d instanceof Rows.Flat) {
            Rows.Flat f = (Rows.Flat) d;
            if (f.res != Rows.BLANK) f.swap(EMPTY, Rows.BLANK);
        } else {
            Rows.Flat f = new Rows.Flat(EMPTY);
            f.res = Rows.BLANK;
            row.setBackgroundDrawable(f);
        }
    }

    /** From the theme's asynchronous applier: true when the view was a bar's row or probe. */
    static boolean landed(View v) {
        try {
            if (v == null) return false;
            if (RowBar.landed(v)) return true;
            Bar own = of(v);
            if (own != null) {
                if (v == own.head.get()) {
                    // with no results under it the line keeps stock's look (Tinter)
                    RecyclerView r = (RecyclerView) own.rv.get();
                    if (r != null && r.getChildCount() > 0) own.dressHead();
                } else {
                    blank(v);
                }
                own.dirty = true;
                return true;
            }
            java.util.Iterator it = BARS.values().iterator();
            while (it.hasNext()) {
                Bar b = (Bar) it.next();
                if (v == b.selProbe || v == b.rowProbe) {
                    RecyclerView r = (RecyclerView) b.rv.get();
                    if (r != null) r.postInvalidate();
                    return true;
                }
            }
        } catch (Throwable t) {
        }
        return false;
    }

    /**
     * The bar a row belongs to. By its parent — and by memory, for a list rebuilding in place
     * (a preset picked): its rows are re-bound DETACHED, parent null, and kept the old colour.
     */
    /** The row is painted by a bar, so its own background stays empty. */
    static boolean owns(View row) {
        return row != null && (of(row) != null || RowBar.owns(row));
    }

    private static Bar of(View row) {
        ViewParent p = row.getParent();
        Bar b = p instanceof RecyclerView ? (Bar) BARS.get(p) : null;
        if (b != null) {
            if (ROWS.get(row) != b.self) ROWS.put(row, b.self);
            return b;
        }
        Object w = ROWS.get(row);
        b = w == null ? null : (Bar) ((WeakReference) w).get();
        return b != null && BARS.containsValue(b) ? b : null;
    }

    private static final WeakHashMap ROWS = new WeakHashMap();

    /**
     * True = swallow the wheel's step. While a jump is still being laid out, any step. And on an
     * end while the rows still glide towards it: going round then, that end is never seen.
     */
    public static boolean holds(RecyclerView r, int dir) {
        try {
            Bar b = r == null ? null : (Bar) BARS.get(r);
            if (b == null || r.getAdapter() == null || !live(r)) return false;
            if (b.snap) return true;
            int m = b.cursor();
            int n = r.getAdapter().getItemCount();
            boolean h = dir > 0 ? m >= n - 1 : m <= 0;
            // the main menu goes round by its own code, past Loop.wrap: its fast-wheel click is lost here
            if (h && b.activity.get() instanceof com.innioasis.y1.activity.MainActivity) {
                if (Loop.swallow()) return true;
                Loop.noteWrap();
            }
            if (Wheel.Glider.left(r) == 0) return false;
            return h;
        } catch (Throwable t) {
            return false;
        }
    }

    /** {@code RVBaseAdapter.toNext}/{@code toPrevious} at an end: round it, unless {@link #holds}. */
    public static boolean wraps(RecyclerView r, int dir) {
        // holds first: a wrap asked of Loop is recorded as taken
        return !holds(r, dir) && Loop.wrap();
    }

    /**
     * The multi-select blink ({@code Rows.blink}): true when the row is a bar's, which then blinks
     * the bar and leaves the row's background alone. Videos hands in a child of the row.
     */
    public static boolean blink(View v, boolean on) {
        try {
            for (int i = 0; v != null && i < 3; i++) {
                Bar b = of(v);
                if (b != null) {
                    RecyclerView r = (RecyclerView) b.rv.get();
                    if (r == null || !live(r)) return false;
                    b.blinkAt = android.os.SystemClock.uptimeMillis();
                    if (b.blinkOff != !on) {
                        b.blinkOff = !on;
                        r.invalidate();
                        // the timer may stop on the dark half (a menu opened): the bar comes back
                        if (!on) r.postInvalidateDelayed(BLINK_MS);
                    }
                    return true;
                }
                ViewParent p = v.getParent();
                v = p instanceof View && !(p instanceof RecyclerView) ? (View) p : null;
            }
        } catch (Throwable t) {
        }
        return false;
    }

    /** Longer than the screens' 500 ms blink: a dark half older than this, the timer has stopped. */
    private static final long BLINK_MS = 700L;

    /**
     * The bar in the blink's dark half — only while the timer runs and the screen is still in
     * multi-select: left the mode or opened a menu on the dark half, the bar is back.
     */
    private boolean dark() {
        if (!blinkOff) return false;
        if (android.os.SystemClock.uptimeMillis() - blinkAt >= BLINK_MS || !multi()) {
            blinkOff = false;
            return false;
        }
        return true;
    }

    /** The screen's own {@code isMultiSelect}: private, read by reflection; none = false. */
    private boolean multi() {
        Object a = activity.get();
        if (a == null) return false;
        try {
            Class k = a.getClass();
            Object f = MULTI.get(k);
            if (f == null) {
                try {
                    java.lang.reflect.Field d = k.getDeclaredField("isMultiSelect");
                    d.setAccessible(true);
                    f = d;
                } catch (NoSuchFieldException e) {
                    f = Boolean.FALSE;
                }
                MULTI.put(k, f);
            }
            return f instanceof java.lang.reflect.Field && ((java.lang.reflect.Field) f).getBoolean(a);
        } catch (Throwable t) {
            return false;
        }
    }

    private static final java.util.HashMap MULTI = new java.util.HashMap();

    /** A jump by letter: the bar stands on the cursor's row once it is laid out, not flown there. */
    static void stand(RecyclerView r) {
        Bar b = r == null ? null : (Bar) BARS.get(r);
        if (b != null) b.dirty = true;
        if (b != null) b.snap = true;
    }

    /** Playlists turned back into a list in place: glide again, and the bar stands on the cursor. */
    public static boolean relist(RecyclerView r) {
        Bar b = r == null ? null : (Bar) BARS.get(r);
        if (b == null) return false;
        b.dirty = true;
        b.y = Float.NaN;
        b.snap = false;
        b.lastPos = -1;
        return true;
    }

    /**
     * Top of {@code BaseQuickAdapter.setList}: a new list in the same adapter (a Videos folder
     * opened or left). The bar stands on the cursor, as on a new adapter, instead of flying there
     * from a row of the list that is gone.
     */
    public static void relisted(RecyclerView.Adapter a) {
        try {
            if (a == null || BARS.isEmpty()) return;
            java.util.Iterator it = BARS.values().iterator();
            while (it.hasNext()) {
                Bar b = (Bar) it.next();
                RecyclerView r = (RecyclerView) b.rv.get();
                if (r != null && r.getAdapter() == a) relist(r);
            }
        } catch (Throwable t) {
        }
    }

    public void bump(int dir) {
        RecyclerView r = (RecyclerView) rv.get();
        if (r == null || !r.hasWindowFocus() || !live(r) || !onList(r) || snap || Float.isNaN(y)) return;
        int h = height(r);
        if (h <= 0) return;
        bouncing = true;
        bounceGoal = target(r, h);
        // a bar placed rather than moved starts from rest (doFrame)
        if (y != movedTo) {
            vel = 0f;
            movedTo = y;
        }
        vel += dir * Loop.BUMP_V;
        start();
    }

    public int at() {
        return cursor();
    }

    public int count() {
        RecyclerView r = (RecyclerView) rv.get();
        RecyclerView.Adapter a = r == null ? null : r.getAdapter();
        return a == null ? 0 : a.getItemCount();
    }

    private int cursor() {
        if (spec.byAdapter) {
            RecyclerView r = (RecyclerView) rv.get();
            RecyclerView.Adapter a = r == null ? null : r.getAdapter();
            if (a instanceof Cursor) return ((Cursor) a).cursor();
            if (a instanceof com.innioasis.music.adapter.rv.RVBaseAdapter) {
                return ((com.innioasis.music.adapter.rv.RVBaseAdapter) a).getSelectPosition();
            }
            if (a instanceof com.innioasis.y1.activity.video.adapter.RVBaseAdapter) {
                return ((com.innioasis.y1.activity.video.adapter.RVBaseAdapter) a).getSelectPosition();
            }
            return -1;
        }
        BaseActivity a = (BaseActivity) activity.get();
        if (a == null) return -1;
        int before = 0;
        if (spec.markList != 0) {
            View above = ((android.app.Activity) a).findViewById(spec.markList);
            RecyclerView.Adapter ad = above instanceof RecyclerView ? ((RecyclerView) above).getAdapter() : null;
            before = ad == null ? 0 : ad.getItemCount();
        }
        return a.getMark() - spec.markBase - before;
    }

    /** The cursor on a row of the list: off it (Search's input line) there is no bar. */
    private boolean onList(RecyclerView r) {
        int c = cursor();
        return r.getAdapter() != null && c >= 0 && c < r.getAdapter().getItemCount() || onHead();
    }

    /** The input line, while it is on screen. */
    private View head() {
        View v = (View) head.get();
        return v != null && v.isShown() ? v : null;
    }

    private boolean onHead() {
        if (head() == null) return false;
        if (!spec.headBelow) return cursor() == -1;
        RecyclerView r = (RecyclerView) rv.get();
        RecyclerView.Adapter a = r == null ? null : r.getAdapter();
        return a != null && cursor() == a.getItemCount();
    }

    /** The input line's top in the list's coordinates; it stands right above the list. */
    private static int headTop(RecyclerView r, View hv) {
        if (hv.getParent() == r.getParent()) return hv.getTop() - r.getTop();
        int[] a = new int[2];
        int[] b = new int[2];
        hv.getLocationInWindow(a);
        r.getLocationInWindow(b);
        return a[1] - b[1];
    }

    /** A row ticked in multi-select. Videos keeps the tick on the row's item, the rest in the adapter. */
    private static boolean ticked(RecyclerView r, int pos) {
        RecyclerView.Adapter a = r.getAdapter();
        if (pos < 0) return false;
        if (a instanceof Ticks) return ((Ticks) a).ticked(pos);
        java.util.List l = null;
        if (a instanceof com.innioasis.music.adapter.rv.RVBaseAdapter) {
            l = ((com.innioasis.music.adapter.rv.RVBaseAdapter) a).getMultiSelectIndexes();
        } else if (a instanceof com.innioasis.y1.activity.video.adapter.RVBaseAdapter) {
            l = ((com.innioasis.y1.activity.video.adapter.RVBaseAdapter) a).getMultiSelectIndexes();
        } else if (a instanceof com.innioasis.y1.base.BaseBindingAdapter) {
            java.util.List d = ((com.innioasis.y1.base.BaseBindingAdapter) a).getData();
            if (d == null || pos >= d.size()) return false;
            Object o = d.get(pos);
            return o instanceof com.innioasis.y1.activity.video.VideoListActivity.BrowseItem
                    && ((com.innioasis.y1.activity.video.VideoListActivity.BrowseItem) o).isMultiSelect();
        }
        return l != null && !l.isEmpty() && l.contains(Integer.valueOf(pos));
    }

    /**
     * A cursor moved further than the rows ever glide (a list rebuilt, a return) is stood on, not
     * flown to. Two wheel steps between frames are NOT that: they cut the glide short.
     */
    private void observe() {
        RecyclerView r = (RecyclerView) rv.get();
        Object ad = r == null ? null : r.getAdapter();
        if (adapter.get() != ad) {
            // another list in the same RecyclerView (the FM menu's levels): stand on its cursor
            adapter = new WeakReference(ad);
            y = Float.NaN;
            snap = false;
            lastPos = -1;
        }
        int pos = cursor();
        if (lastPos >= 0 && Math.abs(pos - lastPos) > JUMP) snap = true;
        lastPos = pos;
    }

    private WeakReference adapter = new WeakReference(null);

    /** The bar onto the cursor's row once that row is laid out; false while it is not yet. */
    private boolean settle(RecyclerView r, int h) {
        if (snap) {
            // after the jump's layout, never on the rows from before it
            if (r.isLayoutRequested() || cursorRow(r) == null && !onHead()) return false;
            y = target(r, h);
            hb = h;
            snap = false;
        } else if (Float.isNaN(y)) {
            y = target(r, h);
            hb = h;
        }
        return true;
    }

    /**
     * From {@code Wheel.scrollTo}: a jump moves the rows at once ({@code Wheel.jumpNow}), and the
     * bar and the text colour stand on the row they bring in the same frame. A glide, a fade or a
     * flight here parts the bar from the colour, or blinks.
     */
    static boolean defer(RecyclerView r, int pos) {
        Bar b = r == null ? null : (Bar) BARS.get(r);
        if (b == null || !live(r)) return false;
        b.lastPos = pos;
        b.snap = true;
        b.dirty = true;
        Wheel.jumpNow(r, pos);
        b.start();
        return true;
    }

    private View cursorRow(RecyclerView r) {
        RecyclerView.LayoutManager lm = r.getLayoutManager();
        return lm instanceof LinearLayoutManager ? ((LinearLayoutManager) lm).findViewByPosition(cursor()) : null;
    }

    /** Where the bar belongs now: on the cursor's row, never past the list's edges. */
    private float target(RecyclerView r, int h) {
        if (onHead()) return headTop(r, head());
        // under a pinned plate, if the screen has one (SongRows.top)
        int top = SongRows.top(r, cursor());
        int bottom = r.getHeight() - r.getPaddingBottom() - h;
        float t;
        View v = cursorRow(r);
        if (v != null) {
            t = v.getTop() + v.getTranslationY() + strip(v);
        } else {
            View first = r.getChildCount() > 0 ? r.getChildAt(0) : null;
            int fp = first == null ? 0 : r.getChildLayoutPosition(first);
            t = cursor() < fp ? top : bottom;
        }
        return Math.max(top, Math.min(bottom, t));
    }

    /**
     * The text colour. A bar at rest (at an edge, the rows jumping under it) gives the cursor's row
     * the selected colour at once; a sliding bar mixes each row's colour by the share of the row it
     * covers — one colour per row, so no edge runs through the text. Off the bar a row has the
     * plain colour.
     */
    private void tint(View row, int h) {
        RecyclerView r = (RecyclerView) rv.get();
        if (h <= 0 || r == null || caption(row)) return;
        int pos = r.getChildLayoutPosition(row);
        Object a = activity.get();
        int off = rowText;
        float f = cover(r, h, row, pos == cursor());
        // the cursor's own row is lit by the bar alone, ticked or not: it goes dark with the blink
        if (pos != cursor() && ticked(r, pos)) f = 1f;
        int want = f >= 1f ? selText : f <= 0f ? off : mix(off, selText, f);
        boolean changed = false;
        for (int i = 0; i < spec.texts.length; i++) {
            View tv = row.findViewById(spec.texts[i]);
            if (!(tv instanceof TextView)) continue;
            TextView t = (TextView) tv;
            if (t.getCurrentTextColor() != want) {
                t.setTextColor(want);
                changed = true;
            }
        }
        if (changed) followText(row, a, want);
        int st = strip(row);
        if (st > 0) {
            float top = row.getTop() + row.getTranslationY();
            stripText(row.findViewById(R.id.tv_disc_header), share(r, h, top, top + st));
        }
    }

    /** A disc label's colour by the share of it the bar covers: its own colour, the bar's text. */
    private void stripText(View v, float f) {
        int off = Disc.stripColor();
        if (!(v instanceof TextView) || off == 0) return;
        int want = f >= 1f ? selText : f <= 0f ? off : mix(off, selText, f);
        if (((TextView) v).getCurrentTextColor() != want) ((TextView) v).setTextColor(want);
    }

    /** The share of the span {@code top..bottom} (list coordinates) the drawn bar covers. */
    private float share(RecyclerView r, int h, float top, float bottom) {
        if (snap || Float.isNaN(y) || !onList(r) || dark() || bottom <= top) return 0f;
        float bt = Math.round(y);
        float bb = bt + Math.round(Float.isNaN(hb) ? h : hb);
        float o = Math.min(bb, bottom) - Math.max(bt, top);
        return o <= 0 ? 0f : Math.min(1f, o / (bottom - top));
    }

    // ---- the pinned disc plate --------------------------------------------------------------

    /** The plate beside the list, shown, or null. */
    private static View plate(RecyclerView r) {
        Object p = r.getParent();
        View v = p instanceof View ? ((View) p).findViewById(R.id.ipp_disc_bar) : null;
        return v == null || v.getParent() != p || v.getVisibility() != View.VISIBLE ? null : v;
    }

    /** The plate's top in the list's coordinates. */
    private static float plateTop(RecyclerView r, View plate) {
        return plate.getTop() + plate.getTranslationY() - r.getTop();
    }

    private float plateShare = -1f;

    /** From the Tinter: the plate's label coloured like a row's, and its bar part repainted. */
    private void tintPlate(RecyclerView r, int h) {
        View p = plate(r);
        if (p == null) return;
        float t = plateTop(r, p);
        float f = share(r, h, t, t + p.getHeight());
        stripText(p, f);
        if (f != plateShare || f > 0f) p.invalidate();
        plateShare = f;
    }

    /** Over the plate's background: the share of the bar that passes under it. */
    private void drawOnPlate(Canvas c, View plate) {
        RecyclerView r = (RecyclerView) rv.get();
        if (r == null || r.getChildCount() == 0 || !live(r) || dark() || snap || Float.isNaN(y)) return;
        if (!onList(r)) return;
        Drawable sel = selProbe.getBackground();
        if (sel == null) return;
        int h = height(r);
        float pt = plateTop(r, plate);
        int bt = Math.round(y);
        int hh = Math.round(Float.isNaN(hb) ? h : hb);
        float ot = Math.max(bt, pt), ob = Math.min(bt + hh, pt + plate.getHeight());
        if (ob <= ot) return;
        View any = r.getChildAt(0);
        int dx = plate.getLeft() - r.getLeft();
        int dy = Math.round(pt);
        c.save();
        c.clipRect(0, ot - dy, plate.getWidth(), ob - dy);
        sel.setBounds(any.getLeft() - dx, bt - dy, any.getRight() - dx, bt - dy + hh);
        sel.draw(c);
        // the cursor's arrow too: the plate covers the one the list draws
        c.translate(-dx, -dy);
        drawArrow(c, r, bt, hh);
        c.restore();
    }

    /** The bar of the list beside {@code plate}, or null. */
    private static Bar ofPlate(View plate) {
        ViewParent p = plate.getParent();
        java.util.Iterator it = BARS.entrySet().iterator();
        while (it.hasNext()) {
            java.util.Map.Entry e = (java.util.Map.Entry) it.next();
            Object k = e.getKey();
            if (k instanceof View && ((View) k).getParent() == p) return (Bar) e.getValue();
        }
        return null;
    }

    /** The top layer of the plate's background ({@code Head.backdrop}): the bar crossing it. */
    static final class PlatePart extends Drawable {
        private final View host;

        PlatePart(View host) {
            this.host = host;
        }

        public void draw(Canvas c) {
            try {
                Bar b = ofPlate(host);
                if (b != null) b.drawOnPlate(c, host);
            } catch (Throwable t) {
            }
        }

        public void setAlpha(int a) {
        }

        public void setColorFilter(android.graphics.ColorFilter f) {
        }

        public int getOpacity() {
            return android.graphics.PixelFormat.TRANSLUCENT;
        }
    }

    private static int mix(int a, int b, float f) {
        int r = 0;
        for (int s = 0; s < 32; s += 8) {
            int x = (a >>> s) & 0xff, y = (b >>> s) & 0xff;
            r |= (Math.round(x + (y - x) * f) & 0xff) << s;
        }
        return r;
    }

    /**
     * The share of the row the bar covers: at rest, the cursor's row whole and no other; sliding,
     * by its drawn edges. In the blink's dark half, none.
     */
    private float cover(RecyclerView r, int h, View row, boolean isCursor) {
        if (snap || Float.isNaN(y) || !onList(r) || dark()) return 0f;
        if (bouncing || Math.abs(target(r, h) - y) < 0.5f) return isCursor ? 1f : 0f;
        int bt = Math.round(y);
        int bb = bt + Math.round(Float.isNaN(hb) ? h : hb);
        float top = row.getTop() + row.getTranslationY() + strip(row);
        float bottom = row.getTop() + row.getTranslationY() + row.getHeight();
        if (bottom <= top) return 0f;
        float in = Math.min(bottom, bb) - Math.max(top, bt);
        return in <= 0 ? 0f : Math.min(1f, in / (bottom - top));
    }

    /**
     * The input line: at rest, lit while the cursor is on it; sliding, while the bar covers three
     * quarters of it. In the blink's dark half, never.
     */
    private boolean claims(RecyclerView r, int h, float top, boolean isCursor) {
        if (snap || Float.isNaN(y) || !onList(r) || dark()) return false;
        if (Math.abs(target(r, h) - y) < 0.5f) return isCursor;
        return Math.abs(top - y) <= h / 4f;
    }

    /** The input line's texts, by the same rule as a row's. */
    private void tintHead(RecyclerView r, int h) {
        View hv = head();
        if (hv == null) return;
        int want = claims(r, h, headTop(r, hv), onHead()) ? selText : headText;
        for (int i = 0; i < spec.texts.length; i++) {
            View tv = hv.findViewById(spec.texts[i]);
            if (tv instanceof TextView && ((TextView) tv).getCurrentTextColor() != want) {
                ((TextView) tv).setTextColor(want);
            }
        }
    }

    /**
     * The input line's background is {@link HeadPaint}: its row background and its share of the
     * bar, under its own texts. Stock repaints it on every step through {@code Rows.bgRes}, which
     * swaps the wrapper's content and asks no layout; it is swapped back before the frame.
     */
    private void dressHead() {
        View hv = (View) head.get();
        if (hv == null) return;
        stockHead = false;
        Drawable d = hv.getBackground();
        if (d instanceof Rows.Flat) {
            Rows.Flat f = (Rows.Flat) d;
            if (f.inner() != headPaint) f.swap(headPaint, Rows.BLANK);
        } else {
            Rows.Flat f = new Rows.Flat(headPaint);
            f.res = Rows.BLANK;
            hv.setBackgroundDrawable(f);
        }
    }

    private boolean dressed() {
        View hv = (View) head.get();
        Drawable d = hv == null ? null : hv.getBackground();
        return d instanceof Rows.Flat && ((Rows.Flat) d).inner() == headPaint;
    }

    /** The line has stock's look: an empty list under it from the first frame was never dressed. */
    private boolean stockHead;

    /** No bar (gone, or no results under it): the line gets stock's own look for where the cursor is. */
    private void undressHead() {
        View hv = (View) head.get();
        if (hv == null) return;
        boolean on = cursor() == -1;
        stockHead = true;
        ThemeManager.INSTANCE.itemSetBackground(hv, on ? spec.headSel : R.drawable.item_no_selected, on);
        for (int i = 0; i < spec.texts.length; i++) {
            View tv = hv.findViewById(spec.texts[i]);
            if (tv instanceof TextView) ((TextView) tv).setTextColor(on ? selText : headText);
        }
        headKey = NO_KEY;
        y = Float.NaN;
    }

    /** Redraws the input line only when what it shows of the bar has changed. */
    private void refreshHead(RecyclerView r) {
        View hv = head();
        if (hv == null) return;
        long key = Float.isNaN(y) || !onList(r) || dark() ? NO_KEY
                : ((long) Math.round(y) << 32) ^ (Math.round(hb) & 0xffffffffL);
        if (key == headKey) return;
        headKey = key;
        hv.invalidate();
    }

    /** The background of the input line: see {@link #dressHead}. */
    static final class HeadPaint extends Drawable {
        private final WeakReference bar;

        HeadPaint(Bar b) {
            bar = new WeakReference(b);
        }

        public void draw(Canvas c) {
            try {
                Bar b = (Bar) bar.get();
                if (b == null) return;
                android.graphics.Rect bo = getBounds();
                Drawable rowBg = b.rowProbe.getBackground();
                if (rowBg != null) {
                    rowBg.setBounds(bo);
                    rowBg.draw(c);
                }
                RecyclerView r = (RecyclerView) b.rv.get();
                View hv = b.head();
                Drawable sel = b.selProbe.getBackground();
                if (r == null || hv == null || sel == null || Float.isNaN(b.y) || !b.onList(r) || b.dark()) return;
                int top = Math.round(b.y) - headTop(r, hv);
                int hh = Math.round(Float.isNaN(b.hb) ? hv.getHeight() : b.hb);
                if (top >= bo.bottom || top + hh <= bo.top) return;
                c.save();
                c.clipRect(bo);
                sel.setBounds(bo.left, top, bo.right, top + hh);
                sel.draw(c);
                c.restore();
            } catch (Throwable t) {
            }
        }

        public void setAlpha(int a) {
        }

        public void setColorFilter(android.graphics.ColorFilter f) {
        }

        public int getOpacity() {
            return android.graphics.PixelFormat.TRANSLUCENT;
        }
    }

    /** What the bind tinted with the text's colour: the Favorites heart, a Videos folder icon. */
    private static void followText(View row, Object a, int color) {
        View tick = row.findViewWithTag(TICK);
        if (tick instanceof android.widget.ImageView) {
            Icons.menu((android.widget.ImageView) tick, color);
        } else if (a instanceof com.innioasis.music.PlaylistsActivity) {
            PlGrid.listRow(row);
        } else if (a instanceof com.innioasis.y1_eBook.ui.main.MainActivity) {
            Ebook.librarySub(row);
        } else if (a instanceof com.innioasis.y1.activity.IppQueueActivity) {
            ((com.innioasis.y1.activity.IppQueueActivity) a).tinted(row);
        } else if (a instanceof com.innioasis.music.SongListActivity
                || a instanceof com.innioasis.music.PlayListActivity
                || a instanceof com.innioasis.music.GenresActivity
                || a instanceof com.innioasis.music.AlbumsActivity
                || a instanceof com.innioasis.music.ArtistsActivity
                || a instanceof com.innioasis.music.FilesActivity
                || a instanceof com.innioasis.y1.activity.AllAudiobooksActivity
                || a instanceof com.innioasis.y1.activity.PlayerActivity
                || a instanceof com.innioasis.y1.activity.BookMarkActivity
                || a instanceof com.innioasis.music.MusicMainActivity
                || a instanceof com.innioasis.y1.activity.EbookActivity) {
            SongRows.tinted(row);
        } else if (a instanceof com.innioasis.y1.activity.video.VideoListActivity) {
            View v = row.findViewById(R.id.file_img);
            // only an icon of ours carries a filter; a picture of a video does not
            if (v instanceof android.widget.ImageView && ((android.widget.ImageView) v).getColorFilter() != null) {
                Icons.menu((android.widget.ImageView) v, color);
            }
        }
    }

    /** The bar's height: the cursor row's — the Equalizer's rows differ by a pixel. */
    private int height(RecyclerView r) {
        View hv = onHead() ? head() : null;
        if (hv != null) return hv.getHeight();
        View v = cursorRow(r);
        for (int i = 0; v == null && i < r.getChildCount(); i++) {
            if (!caption(r.getChildAt(i))) v = r.getChildAt(i);
        }
        return v == null ? 0 : v.getHeight() - strip(v);
    }

    /**
     * Before the frame: the cursor's row may have moved without the list redrawing (the layout
     * above it changed), so the bar is told here — it stands on it while the screen is opening,
     * else it goes. Here and not in the draw, or the texts keep the colours of the old place.
     */
    private void follow(RecyclerView r, int h) {
        if (!onList(r) || snap || Float.isNaN(y)) return;
        float goal = target(r, h);
        if (goal == y && hb == h) return;
        if (opening()) {
            y = goal;
            hb = h;
            r.invalidate();
            View hv = head();
            if (hv != null) hv.invalidate();
        } else {
            start();
        }
    }

    private final Tinter tinter = new Tinter(this);

    /** A row was bound or taken in since the colours were last laid: lay them all again. */
    private boolean dirty = true;
    /** {@link #key} when the colours were last laid. */
    private long drawnKey;

    /** What the colours depend on: the bar, the cursor, where the rows, the plate and the line stand. */
    private long key(RecyclerView r, int h) {
        long k = Float.isNaN(y) ? -1 : Math.round(y);
        k = k * 31 + (Float.isNaN(hb) ? -1 : Math.round(hb));
        k = k * 31 + h;
        k = k * 31 + cursor();
        k = k * 31 + (snap ? 1 : 0) + (dark() ? 2 : 0) + (bouncing ? 4 : 0);
        k = k * 31 + System.identityHashCode(r.getAdapter());
        k = k * 31 + r.getHeight();
        int n = r.getChildCount();
        k = k * 31 + n;
        if (n > 0) {
            View f = r.getChildAt(0);
            View l = r.getChildAt(n - 1);
            k = k * 31 + r.getChildLayoutPosition(f);
            k = k * 31 + Math.round(f.getTop() + f.getTranslationY());
            k = k * 31 + Math.round(l.getBottom() + l.getTranslationY());
        }
        View c = cursorRow(r);
        k = k * 31 + (c == null ? -1 : Math.round(c.getTop() + c.getTranslationY()) * 7 + c.getHeight());
        View hv = head();
        k = k * 31 + (hv == null ? -1 : hv.getTop());
        View p = plate(r);
        k = k * 31 + (p == null ? -1 : Math.round(plateTop(r, p)) * 7 + p.getHeight());
        return k;
    }

    /**
     * The text colours, BEFORE the list draws: a colour set from inside the draw reaches the row
     * only with the next frame, and a bar at rest has no next frame — the row stayed uncoloured.
     */
    static final class Tinter implements android.view.ViewTreeObserver.OnPreDrawListener {
        private final WeakReference bar;

        Tinter(Bar b) {
            bar = new WeakReference(b);
        }

        public boolean onPreDraw() {
            try {
                Bar b = (Bar) bar.get();
                RecyclerView r = b == null ? null : (RecyclerView) b.rv.get();
                if (r == null || !live(r)) return true;
                // the better-Y menu's list not shown: its cursor is the other list's
                if (!r.isShown() && b.head.get() == null) return true;
                if (r.getChildCount() == 0) {
                    // no results: the input line alone, as stock paints it
                    if (!b.stockHead) b.undressHead();
                    return true;
                }
                b.observe();
                int h = b.height(r);
                // a frame drawn for something else (a marquee, the clock) with the bar and the
                // rows where they were: the colours are what they were
                if (b.dirty || b.opening() || b.key(r, h) != b.drawnKey) {
                    if (b.onList(r)) b.settle(r, h);
                    b.follow(r, h);
                    for (int i = 0; i < r.getChildCount(); i++) b.tint(r.getChildAt(i), h);
                    b.tintPlate(r, h);
                    b.dirty = false;
                    b.drawnKey = b.key(r, h);
                }
                if (b.head.get() != null) {
                    b.dressHead();
                    b.tintHead(r, h);
                    b.refreshHead(r);
                }
            } catch (Throwable t) {
            }
            return true;
        }
    }

    public void onDraw(Canvas c, RecyclerView r, RecyclerView.State s) {
        try {
            int n = r.getChildCount();
            if (n == 0 || !live(r)) return;
            observe();
            Drawable rowBg = rowProbe.getBackground();
            Drawable selBg = selProbe.getBackground();
            View any = r.getChildAt(0);
            int left = any.getLeft();
            int right = any.getRight();
            int cur = cursor();
            for (int i = 0; i < n; i++) {
                View v = r.getChildAt(i);
                if (caption(v)) continue;
                int p = r.getChildLayoutPosition(v);
                // a ticked row keeps stock's still highlight; the cursor's own is the bar
                Drawable d = p != cur && ticked(r, p) ? selBg : rowBg;
                if (d == null) continue;
                int t = Math.round(v.getTop() + v.getTranslationY());
                d.setBounds(v.getLeft(), t, v.getRight(), t + v.getHeight());
                d.draw(c);
                // the disc strip's own background, which it no longer draws itself (clean)
                int st = d == rowBg ? strip(v) : 0;
                if (st > 0) {
                    d.setBounds(v.getLeft(), t, v.getRight(), t + st);
                    d.draw(c);
                }
            }
            if (!onList(r)) {
                // off the list: the bar comes back standing on the row, not flying in
                y = Float.NaN;
                return;
            }
            // the highlight on screen: a click swallowed at the end bounces it (Loop)
            if (r.hasWindowFocus()) Loop.bumper(this);
            int h = height(r);
            boolean laid = settle(r, h);
            float goal = target(r, h);
            if (!laid) {
                start();
                return;
            }
            int top = Math.round(y);
            int hh = Math.round(Float.isNaN(hb) ? h : hb);
            if (!dark()) {
                if (selBg != null) {
                    selBg.setBounds(left, top, right, top + hh);
                    selBg.draw(c);
                }
                drawArrow(c, r, top, hh);
            }
            if (y != goal || hb != h) start();
        } catch (Throwable t) {
        }
    }

    private View arrowOf(View row) {
        View a = spec.arrow == 0 ? null : row.findViewById(spec.arrow);
        if (a == null && spec.arrow2 != 0) a = row.findViewById(spec.arrow2);
        return a;
    }

    /**
     * The cursor row's own arrow, drawn on the bar: the theme's arrow may carry the bar's colour.
     * Placed below the disc strip, as the bar is. An arrow as tall as its row is drawn at the bar's
     * height, its width from the picture's proportions — not the view's, which a row with a disc
     * strip measures differently. Any other is drawn as laid out, clipped to the bar.
     */
    private void drawArrow(Canvas c, RecyclerView r, int top, int hh) {
        View row = cursorRow(r);
        if (row == null) return;
        View arrow = arrowOf(row);
        // a GONE arrow keeps the width of its last layout
        if (arrow == null || arrow.getVisibility() == View.GONE || arrow.getWidth() == 0) return;
        // the arrow may sit deeper than the row's own children
        int dx = 0, dy = 0;
        for (View v = arrow; v != null && v != row; ) {
            dx += v.getLeft();
            dy += v.getTop();
            ViewParent p = v.getParent();
            v = p instanceof View ? (View) p : null;
        }
        int st = strip(row);
        int body = row.getHeight() - st;
        int right = row.getLeft() + dx + arrow.getWidth();
        Drawable d = arrow instanceof ImageView ? ((ImageView) arrow).getDrawable() : null;
        if (d != null && hh > 0 && shownHeight((ImageView) arrow, d) >= body - 1
                && d.getIntrinsicWidth() > 0 && d.getIntrinsicHeight() > 0) {
            int w = Math.round((float) d.getIntrinsicWidth() * hh / d.getIntrinsicHeight());
            android.graphics.Rect was = d.copyBounds();
            d.setBounds(right - w, top, right, top + hh);
            d.draw(c);
            d.setBounds(was);
            return;
        }
        c.save();
        c.clipRect(row.getLeft(), top, row.getRight(), top + hh);
        c.translate(row.getLeft() + dx, top + dy - st);
        arrow.draw(c);
        c.restore();
    }

    /** The picture's height as drawn: a view as tall as its row may centre a small arrow in it. */
    private static float shownHeight(ImageView v, Drawable d) {
        v.getImageMatrix().getValues(MATRIX);
        return d.getBounds().height() * MATRIX[android.graphics.Matrix.MSCALE_Y];
    }

    /** Read on every draw of the arrow: one array, main thread only. */
    private static final float[] MATRIX = new float[9];

    private void start() {
        if (running) return;
        running = true;
        last = 0;
        Choreographer.getInstance().postFrameCallback(this);
    }

    private void stop() {
        if (running) Choreographer.getInstance().removeFrameCallback(this);
        running = false;
    }

    public void doFrame(long nanos) {
        RecyclerView r = (RecyclerView) rv.get();
        if (r == null || r.getWindowToken() == null || r.getChildCount() == 0 || !live(r) || !onList(r)
                || !r.isShown() && head.get() == null) {
            running = false;
            return;
        }
        long now = nanos / 1000000L;
        float dt = last == 0 ? 0.016f : Math.min(0.05f, (now - last) / 1000f);
        last = now;
        observe();
        int h = height(r);
        if (!snap && settle(r, h)) {
            float goal = target(r, h);
            // a new step during a bounce is a step again
            if (bouncing && Math.abs(goal - bounceGoal) >= 0.5f) bouncing = false;
            // a divider between the two rows (the bar would pass under it), or the screen just opened
            if (!Float.isNaN(hb) && (opening() || crosses(r, y, hb, goal, h))) {
                y = goal;
                hb = h;
            }
            // placed rather than moved since the last frame: the spring starts from rest
            if (y != movedTo) vel = 0f;
            float e = y - goal;
            float a = Math.abs(e);
            float cv = vel + OMEGA * e;
            float ex = (float) Math.exp(-OMEGA * dt);
            float ne = (e + cv * dt) * ex;
            vel = (vel - OMEGA * cv * dt) * ex;
            // the height changes by the same share of the way (the input line is taller)
            if (Float.isNaN(hb) || a == 0) hb = h;
            else hb += (h - hb) * Math.max(0f, Math.min(1f, 1f - Math.abs(ne) / a));
            y = goal + ne;
            if (Math.abs(ne) < 0.5f && Math.abs(vel) < 15f) {
                y = goal;
                hb = h;
                vel = 0f;
            }
            movedTo = y;
        }
        r.invalidate();
        // the input line draws its share of the bar in the same frame
        View hv = head();
        if (hv != null) hv.invalidate();
        if (snap || y != target(r, h) || hb != h || vel != 0f) {
            // going round waits for this (Loop.swallow), a bounce included
            Loop.animating();
            Choreographer.getInstance().postFrameCallback(this);
        } else {
            running = false;
            bouncing = false;
        }
    }
}
