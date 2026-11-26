package com.innioasis.ipp;

import android.content.res.Resources;
import android.database.DataSetObserver;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ListAdapter;
import android.widget.TextView;

import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.innioasis.music.adapter.MyBaseAdapter;
import com.innioasis.music.adapter.SongListAdapter;
import com.innioasis.music.util.Other;
import com.innioasis.y1.R;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.databinding.ItemSonglistBinding;
import com.innioasis.y1.theme.ThemeManager;
import com.innioasis.y1.utils.SharedPreferencesUtils;
import com.innioasis.y1.view.ShufflePlaylistItemView;

import java.lang.ref.WeakReference;
import java.util.List;

/**
 * The lists of a music screen on one RecyclerView. The stock adapter ({@code MyBaseAdapter}) stays
 * the model — its items, cursor and ticks are what every screen and menu reads — and this draws its
 * rows: a song row by {@link #bindRow}, any other through the model's own {@code getView}. A screen
 * paging several lists (Genres) swaps them with {@link #set}, one instance per model. On a song
 * or audiobook list the Shuffle row is row 0 of the list itself, so adapter position p is list row p +
 * {@link #heads()}. Every {@code notifyDataSetChanged} of the model reaches the list through
 * {@link Watch}.
 */
public final class SongRows extends RecyclerView.Adapter implements Bar.Cursor, Bar.Ticks {

    private static final int ROW = 0;
    private static final int HEAD = 1;
    /** More than a screen of rows. */
    private static final int POOL = 16;

    private final MyBaseAdapter model;
    private final WeakReference list;
    /** The Shuffle row, on a song list only. */
    private final ShufflePlaylistItemView spv;
    /** This model's view type: the pool is the screen's, and its lists' rows must not mix. */
    private final int rowType;

    private SongRows(RecyclerView rv, ShufflePlaylistItemView spv, MyBaseAdapter model) {
        this.model = model;
        this.list = new WeakReference(rv);
        boolean songs = model instanceof SongListAdapter;
        this.spv = songs || model instanceof com.innioasis.y1.adapter.AudiobookAdapter ? spv : null;
        this.rowType = songs ? ROW : typeOf(model.getClass());
    }

    private static final java.util.HashMap TYPES = new java.util.HashMap();

    private static int typeOf(Class c) {
        Object t = TYPES.get(c);
        if (t == null) {
            t = Integer.valueOf(HEAD + 1 + TYPES.size());
            TYPES.put(c, t);
        }
        return ((Integer) t).intValue();
    }

    /** {@code initView}, in place of {@code lv.setAdapter}. */
    public static void attach(RecyclerView rv, SongListAdapter a) {
        set(rv, a);
    }

    /** {@code lv.setAdapter(adapter)}: whichever list of the screen goes on. */
    public static void set(RecyclerView rv, ListAdapter la) {
        if (rv == null || !(la instanceof MyBaseAdapter)) return;
        MyBaseAdapter a = (MyBaseAdapter) la;
        SongRows on = of(rv);
        if (on != null && on.model == a) {
            on.notifyDataSetChanged();
            return;
        }
        if (on == null) setUp(rv);
        Object w = MODELS.get(a);
        SongRows r = w == null ? null : (SongRows) ((WeakReference) w).get();
        if (r == null || r.list() != rv) {
            r = new SongRows(rv, shuffleOf(rv), a);
            // before setAdapter: it cannot change once the list observes the adapter
            r.setHasStableIds(true);
            a.registerDataSetObserver(new Watch(r));
            MODELS.put(a, new WeakReference(r));
        }
        if (r.spv != null) HEADS.put(r.spv, new WeakReference(r));
        // A rebuild (a jump by letter, a new sort) sends every row on screen to the pool, which
        // keeps 5 by default: the rest were inflated again on every jump.
        rv.getRecycledViewPool().setMaxRecycledViews(r.rowType, POOL);
        rv.setAdapter(r);
        Wheel.tune(rv);
    }

    /** Model → its rows: a list swapped back on keeps its instance and its one {@link Watch}. */
    private static final java.util.WeakHashMap MODELS = new java.util.WeakHashMap();

    private static void setUp(RecyclerView rv) {
        if (!(rv.getLayoutManager() instanceof LinearLayoutManager)) {
            rv.setLayoutManager(new LinearLayoutManager(rv.getContext()));
        }
        if (plate(rv) != null) {
            rv.addItemDecoration(new Gap());
            rv.getViewTreeObserver().addOnPreDrawListener(new Plate(rv));
        }
    }

    /** The screen's Shuffle row, moved into the list the first time: row 0 of every song list. */
    private static ShufflePlaylistItemView shuffleOf(RecyclerView rv) {
        Object w = SPVS.get(rv);
        Object o = w == null ? null : ((WeakReference) w).get();
        if (o instanceof ShufflePlaylistItemView) return (ShufflePlaylistItemView) o;
        Object p = rv.getParent();
        View s = p instanceof View ? ((View) p).findViewById(R.id.spv) : null;
        if (!(s instanceof ShufflePlaylistItemView)) return null;
        ShufflePlaylistItemView spv = (ShufflePlaylistItemView) s;
        if (spv.getParent() instanceof ViewGroup && spv.getParent() != rv) {
            int h = spv.getLayoutParams() == null ? ViewGroup.LayoutParams.WRAP_CONTENT
                    : spv.getLayoutParams().height;
            ((ViewGroup) spv.getParent()).removeView(spv);
            spv.setLayoutParams(new RecyclerView.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, h));
        }
        SPVS.put(rv, new WeakReference(spv));
        return spv;
    }

    private static final java.util.WeakHashMap SPVS = new java.util.WeakHashMap();

    static SongRows of(RecyclerView rv) {
        Object a = rv == null ? null : rv.getAdapter();
        return a instanceof SongRows ? (SongRows) a : null;
    }

    /** {@code lv.getAdapter()}: the model on the list. */
    public static ListAdapter adapter(RecyclerView rv) {
        SongRows r = of(rv);
        return r == null ? null : r.model;
    }

    /** {@code Other.gotoAdapter(lv, a, to)}: the list on, the cursor on {@code to} (-1 = its own). */
    public static void go(RecyclerView rv, MyBaseAdapter a, int to) {
        if (rv == null || a == null) return;
        set(rv, a);
        if (to >= 0) a.setPosition(to);
        select(rv, to >= 0 ? to : a.getPosition());
    }

    MyBaseAdapter model() {
        return model;
    }

    ShufflePlaylistItemView shuffle() {
        return spv;
    }

    RecyclerView list() {
        return (RecyclerView) list.get();
    }

    /** List rows ahead of the model's: the Shuffle row. */
    int heads() {
        return spv == null ? 0 : 1;
    }

    static int heads(RecyclerView rv) {
        SongRows r = of(rv);
        return r == null ? 0 : r.heads();
    }

    public int getItemCount() {
        int n = model.getCount();
        return n == 0 ? 0 : n + heads();
    }

    /**
     * Ids follow the SCREEN, not the song: a rebuild ({@code notifyDataSetChanged}) then finds
     * each row on screen by the id of the row that stood there and only detaches it, where without
     * ids every row left the window and came back from the pool — 30 ms per jump by letter.
     * {@link #moving} keeps that true across a jump. No item animator reads them.
     */
    public long getItemId(int p) {
        return p + idBase;
    }

    private long idBase;

    /**
     * The list is about to be placed with row {@code rvPos} at {@code y}: the rows that stand on
     * screen now get the ids of the rows that will stand in their places.
     */
    static void moving(RecyclerView rv, int rvPos, int y) {
        SongRows r = of(rv);
        if (r == null || rv.getChildCount() == 0) return;
        View c0 = rv.getChildAt(0);
        int h = c0.getHeight();
        if (h <= 0) return;
        // the first row on screen after the move is the one across the top edge, as now
        int above = Math.max(0, y + h - 1) / h;
        int first = rv.getChildLayoutPosition(c0);
        int shift = first - (rvPos - above);
        if (shift == 0) return;
        r.idBase += shift;
        // a row found by its id is reused as it is: without this it keeps the song it showed
        r.notifyDataSetChanged();
    }

    public int getItemViewType(int p) {
        return p < heads() ? HEAD : rowType;
    }

    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int type) {
        if (type == HEAD) {
            View v = spv != null && spv.getParent() == null ? (View) spv : new View(parent.getContext());
            return new HeadHolder(v);
        }
        if (type == ROW) {
            return new Holder(ItemSonglistBinding.inflate(LayoutInflater.from(parent.getContext()), parent, false));
        }
        // the model inflates its own row; it is bound for real right after
        View v = model.getView(0, null, parent);
        ViewGroup.LayoutParams lp = v.getLayoutParams();
        if (!(lp instanceof RecyclerView.LayoutParams)) {
            // inflated without a parent the row has none: full width, its own height
            v.setLayoutParams(new RecyclerView.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                    lp != null ? lp.height : ViewGroup.LayoutParams.WRAP_CONTENT));
        }
        return new ItemHolder(v);
    }

    public void onBindViewHolder(RecyclerView.ViewHolder h, int p) {
        try {
            if (h instanceof Holder) bindRow((Holder) h, p - heads());
            else if (h instanceof ItemHolder) bindItem(h.itemView, p - heads());
            else Bar.row(h.itemView);
        } catch (Throwable t) {
        }
    }

    /** A row that is not a song's: the model's own {@code getView} on the recycled row. */
    private void bindItem(View row, int q) {
        model.getView(q, row, list());
        Bar.row(row);
    }

    /** The cursor as a list row: the Shuffle row is 0 while the model is parked at -1 on it. */
    public int cursor() {
        return model.getPosition() + heads();
    }

    public boolean ticked(int p) {
        List s = model.getSelectedIndexList();
        if (p < heads() || s == null || s.isEmpty()) return false;
        // compared, not boxed: asked per row per frame by the Bar, and an Integer past 127 is new
        int v = p - heads();
        for (int i = 0; i < s.size(); i++) {
            Object o = s.get(i);
            if (o instanceof Integer && ((Integer) o).intValue() == v) return true;
        }
        return false;
    }

    /** {@code SongListAdapter.getView}, row for row. */
    private void bindRow(Holder h, int q) {
        SongListAdapter a = (SongListAdapter) model;
        RecyclerView rv = list();
        ListWatch.tick(a);
        Follow.note(a, rv);
        Disc.note(a, rv);
        List items = a.getItemList();
        Song song = (Song) items.get(q);
        ItemSonglistBinding b = h.b;
        View root = b.getRoot();
        Disc.bind(root, items, q, a);
        Rows.text(b.tvSongIndex, Disc.rowIndex(song, items, q, a));
        Rows.indexWidth(b.tvSongIndex, items, a);
        String name = Prefs.on(b.tvSongName.getContext(), "meta_title")
                ? Other.INSTANCE.unNamed(song.getSongName())
                : Other.INSTANCE.unNamed(SharedPreferencesUtils.INSTANCE.processFileExtensions(song.getName()));
        Rows.text(b.tvSongName, name);
        StringBuilder sb = new StringBuilder();
        sb.append(Artists.display(Other.INSTANCE.unNamed(song.getArtist())));
        if (a.getCanShowTime()) {
            sb.append("     ");
            sb.append(a.getFormat().format(Long.valueOf(song.getFileDate())));
        }
        if (a.getCanShowAlbum()) {
            sb.append("     ");
            sb.append(Other.INSTANCE.unNamed(song.getAlbum()));
        }
        Rows.text(b.tvArtists, sb.toString());

        Resources res = a.getContext().getResources();
        int sel = res.getColor(R.color.selected_text_color);
        // under the bar the list paints the backgrounds: setting one here re-lays the row out
        boolean bar = Bar.on(rv);
        int color;
        if (q == a.getPosition()) {
            Scroll.rowText(b.tvSongName);
            if (!bar) ThemeManager.INSTANCE.itemSetBackground(root, R.drawable.item_selected_no_arrow, true);
            ThemeManager.INSTANCE.itemSetRightArrow(b.rightArrow, R.mipmap.right_arrow);
            Other.INSTANCE.showV(b.rightArrow);
            color = sel;
        } else if (a.getSelectedIndexList().contains(Integer.valueOf(q))) {
            Scroll.rowPlain(b.tvSongName);
            Other.INSTANCE.hideV(b.rightArrow);
            if (!bar) ThemeManager.INSTANCE.itemSetBackground(root, R.drawable.item_selected_no_arrow, true);
            color = sel;
        } else {
            Scroll.rowPlain(b.tvSongName);
            Other.INSTANCE.hideV(b.rightArrow);
            if (!bar) ThemeManager.INSTANCE.itemSetBackground(root, R.drawable.item_no_selected, false);
            color = res.getColor(R.color.white);
        }
        ThemeManager.INSTANCE.itemSetTextColor(b.tvSongIndex, color, color == sel);
        ThemeManager.INSTANCE.itemSetTextColor(b.tvSongName, color, color == sel);
        ThemeManager.INSTANCE.itemSetTextColor(b.tvArtists, color, color == sel);
        Rows.songMark(root, q, a);
        if (!bar) Rows.flat(root);
        Bar.row(root);
    }

    /** From {@link Bar}: a row's text has a new colour, and what was tinted with it follows. */
    static void tinted(View row) {
        View t = row.findViewById(R.id.tv_song_name);
        if (!(t instanceof TextView)) {
            fileTinted(row);
            return;
        }
        int c = ((TextView) t).getCurrentTextColor();
        View m = row.findViewById(R.id.ipp_song_mark);
        if (m instanceof ImageView && m.getVisibility() == View.VISIBLE) Icons.menu((ImageView) m, c);
        View im = row instanceof ShufflePlaylistItemView ? row.findViewById(R.id.img) : null;
        if (im instanceof ImageView) Icons.menu((ImageView) im, c);
    }

    /**
     * A Folders row: the ▶ marker, and the icon only when it is ours (a theme's is drawn as is).
     * An audiobook row: its ▶ marker. A menu row: its icon.
     */
    private static void fileTinted(View row) {
        View t = row.findViewById(R.id.file_name);
        if (!(t instanceof TextView)) {
            if (albumTinted(row)) return;
            if (!markTinted(row, R.id.tv_name, R.id.ipp_book_mark)) markTinted(row, R.id.tv_item, R.id.ipp_row_icon);
            return;
        }
        int c = ((TextView) t).getCurrentTextColor();
        View m = row.findViewById(R.id.ipp_file_play);
        if (m instanceof ImageView && m.getVisibility() == View.VISIBLE) Icons.menu((ImageView) m, c);
        View i = row.findViewById(R.id.left_icon);
        if (i instanceof ImageView && ((ImageView) i).getColorFilter() != null) Icons.menu((ImageView) i, c);
    }

    /** An album row: the "Show all songs" icon, the one cover that carries a filter. */
    private static boolean albumTinted(View row) {
        View t = row.findViewById(R.id.album_name);
        if (!(t instanceof TextView)) return false;
        View c = row.findViewById(R.id.cover);
        if (c instanceof ImageView && ((ImageView) c).getColorFilter() != null) {
            Icons.menu((ImageView) c, ((TextView) t).getCurrentTextColor());
        }
        return true;
    }

    /** The image {@code mark} in the colour of the text {@code text}, if the row has both, shown. */
    private static boolean markTinted(View row, int text, int mark) {
        View t = row.findViewById(text);
        View m = row.findViewById(mark);
        if (!(t instanceof TextView) || !(m instanceof ImageView)) return false;
        if (m.getVisibility() == View.VISIBLE) Icons.menu((ImageView) m, ((TextView) t).getCurrentTextColor());
        return true;
    }

    /** The row of adapter position {@code pos}, or null: the multi-select blink. */
    public static View row(RecyclerView rv, int pos) {
        return rv == null ? null : Lv.row(rv, pos);
    }

    /** {@code lv.setSelection(pos)}: row 0 is the list at its start, any other row at the top. */
    public static void select(RecyclerView rv, int pos) {
        if (of(rv) == null) return;
        Bar.relist(rv);
        if (pos <= 0) Lv.rest(rv);
        else Lv.pin(rv, pos);
    }

    // ---- the disc plate ---------------------------------------------------------------------

    /** The screen's pinned disc plate ({@link Disc}), or null. */
    private static View plate(RecyclerView rv) {
        Object p = rv.getParent();
        View v = p instanceof View ? ((View) p).findViewById(R.id.ipp_disc_bar) : null;
        return v == null || v.getParent() != p ? null : v;
    }

    private static int plateHeight(View plate) {
        if (plate == null || plate.getVisibility() != View.VISIBLE) return 0;
        ViewGroup.LayoutParams lp = plate.getLayoutParams();
        return lp != null && lp.height > 0 ? lp.height : plate.getHeight();
    }

    /** The bottom of the Shuffle row while it is on screen, else the list's top. */
    private static int headBottom(RecyclerView rv) {
        SongRows r = of(rv);
        View s = r == null ? null : r.spv;
        int top = rv.getPaddingTop();
        if (s == null || s.getParent() != rv) return top;
        return Math.max(top, s.getBottom());
    }

    /**
     * Where the visible list begins for the row at list position {@code pos}: under the plate,
     * which stands under the Shuffle row. The Shuffle row itself is above it.
     */
    static int top(RecyclerView rv, int pos) {
        int pad = rv.getPaddingTop();
        if (pos < heads(rv)) return pad;
        int h = plateHeight(plate(rv));
        return h == 0 ? pad : headBottom(rv) + h;
    }

    /** The plate in the list's coordinates, {top, bottom}, or null while there is none. */
    static int[] plateSpan(RecyclerView rv) {
        int h = plateHeight(plate(rv));
        if (h == 0) return null;
        int t = headBottom(rv);
        return new int[] {t, t + h};
    }

    /** The same with the list pinned: the Shuffle row scrolled off, the plate on top. */
    static int pinTop(RecyclerView rv) {
        return rv.getPaddingTop() + plateHeight(plate(rv));
    }

    /** From {@link Disc}: the plate came or went, and the room under the Shuffle row with it. */
    static void plateChanged(View v) {
        if (v instanceof RecyclerView && of((RecyclerView) v) != null) {
            ((RecyclerView) v).invalidateItemDecorations();
        }
    }

    /** Room under the Shuffle row for the plate at the list's start. */
    static final class Gap extends RecyclerView.ItemDecoration {
        public void getItemOffsets(android.graphics.Rect out, View v, RecyclerView rv, RecyclerView.State st) {
            out.set(0, 0, 0, v instanceof ShufflePlaylistItemView ? plateHeight(plate(rv)) : 0);
        }
    }

    /** The plate rides under the Shuffle row and stays on top once the row has gone. */
    static final class Plate implements android.view.ViewTreeObserver.OnPreDrawListener {
        private final WeakReference rv;

        Plate(RecyclerView r) {
            rv = new WeakReference(r);
        }

        public boolean onPreDraw() {
            try {
                RecyclerView r = (RecyclerView) rv.get();
                View p = r == null ? null : plate(r);
                if (p == null || p.getVisibility() != View.VISIBLE) return true;
                float want = r.getTop() + headBottom(r) - p.getTop();
                if (p.getTranslationY() != want) {
                    p.setTranslationY(want);
                    // its backdrop is aligned to the screen (Head.backdrop)
                    p.invalidate();
                }
            } catch (Throwable t) {
            }
            return true;
        }
    }

    // ---- deleting ---------------------------------------------------------------------------

    /** The first ticked row, before {@code removeItems} takes the ticks away: {@link #kept}. */
    private static volatile int deleted = -1;

    /** Ahead of {@code removeItems}, on the deleting thread. */
    public static void deleting(MyBaseAdapter a) {
        List s = a == null ? null : a.getSelectedIndexList();
        int m = -1;
        for (int i = 0; s != null && i < s.size(); i++) {
            Object o = s.get(i);
            if (!(o instanceof Integer)) continue;
            int v = ((Integer) o).intValue();
            if (v >= 0 && (m < 0 || v < m)) m = v;
        }
        deleted = m;
    }

    /**
     * After a delete, in place of {@code setSelection}: the cursor stays on the place of the first
     * removed row (the last row, when the end was removed) and the list does not move. Stock put it
     * there too but pinned that row to the top, and sent the cursor to row 0 past the end.
     */
    public static void kept(RecyclerView rv, int pos) {
        SongRows r = of(rv);
        if (r == null) return;
        int p = deleted >= 0 ? deleted : pos;
        deleted = -1;
        r.model.setPosition(Math.min(p, r.model.getCount() - 1));
        Bar.relist(rv);
        rv.post(new Shown(rv));
    }

    /** The cursor's row off screen after a delete (the ticks were far apart): it goes to the top. */
    static final class Shown implements Runnable {
        private final WeakReference rv;

        Shown(RecyclerView r) {
            rv = new WeakReference(r);
        }

        public void run() {
            try {
                RecyclerView r = (RecyclerView) rv.get();
                SongRows s = of(r);
                if (s == null || s.model.getCount() == 0) return;
                RecyclerView.LayoutManager lm = r.getLayoutManager();
                int c = s.cursor();
                View v = lm == null ? null : lm.findViewByPosition(c);
                if (v == null || v.getTop() < top(r, c)
                        || v.getBottom() > r.getHeight() - r.getPaddingBottom()) {
                    Lv.pin(r, s.model.getPosition());
                }
            } catch (Throwable t) {
            }
        }
    }

    /** {@code BaseActivity.cancelMultiSelect} for a list on a RecyclerView. */
    public static void cancel(RecyclerView rv, MyBaseAdapter[] adapters) {
        SongRows r = of(rv);
        if (r == null || adapters == null) return;
        for (int i = 0; i < adapters.length; i++) {
            if (adapters[i] != r.model) continue;
            List s = r.model.getSelectedIndexList();
            if (s != null) s.clear();
            r.model.notifyDataSetChanged();
        }
    }

    /**
     * The Shuffle row became the cursor ({@link Shuffle#style}): it must not stay cut off by the
     * top edge. Posted — the step that selected it has just asked for a rebind of every row.
     */
    static void reveal(ShufflePlaylistItemView spv) {
        Object w = spv == null ? null : HEADS.get(spv);
        SongRows s = w == null ? null : (SongRows) ((WeakReference) w).get();
        RecyclerView rv = s == null ? null : s.list();
        if (rv == null || of(rv) != s) return;
        // scrolled off, the row is not even attached
        if (spv.getParent() == rv && spv.getTop() >= rv.getPaddingTop()) return;
        rv.removeCallbacks(REVEAL);
        rv.post(REVEAL.at(rv));
    }

    /** Shuffle row → its list's rows: off screen the row has no parent to be found by. */
    private static final java.util.WeakHashMap HEADS = new java.util.WeakHashMap();

    private static final Reveal REVEAL = new Reveal();

    static final class Reveal implements Runnable {
        private WeakReference rv = new WeakReference(null);

        Reveal at(RecyclerView r) {
            rv = new WeakReference(r);
            return this;
        }

        public void run() {
            try {
                RecyclerView r = (RecyclerView) rv.get();
                SongRows s = of(r);
                if (s == null || s.heads() == 0 || s.cursor() != 0) return;
                Wheel.follow(r, 0, s);
            } catch (Throwable t) {
            }
        }
    }

    /** The model's {@code notifyDataSetChanged} is the list's. */
    static final class Watch extends DataSetObserver {
        private final WeakReference rows;

        Watch(SongRows r) {
            rows = new WeakReference(r);
        }

        public void onChanged() {
            SongRows r = (SongRows) rows.get();
            if (r != null) r.notifyDataSetChanged();
        }

        public void onInvalidated() {
            onChanged();
        }
    }

    static final class Holder extends RecyclerView.ViewHolder {
        final ItemSonglistBinding b;

        Holder(ItemSonglistBinding b) {
            super(b.getRoot());
            this.b = b;
        }
    }

    /** A row the model draws itself. */
    static final class ItemHolder extends RecyclerView.ViewHolder {
        ItemHolder(View v) {
            super(v);
        }
    }

    static final class HeadHolder extends RecyclerView.ViewHolder {
        HeadHolder(View v) {
            super(v);
        }
    }
}
