package com.innioasis.ipp;

import android.content.res.Resources;
import android.database.DataSetObserver;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
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
 * A song list on a RecyclerView. {@code SongListAdapter} stays the model — its items, cursor and
 * ticks are what every screen and menu reads — and this draws its rows. The Shuffle row is row 0
 * of the list itself, so it scrolls with it and the travelling {@link Bar} stands on it; adapter
 * position p is list row p + {@link #HEAD_ROWS}. Every {@code notifyDataSetChanged} of the model
 * reaches the list through {@link Watch}.
 */
public final class SongRows extends RecyclerView.Adapter implements Bar.Cursor, Bar.Ticks {

    /** The Shuffle row ahead of the songs. */
    static final int HEAD_ROWS = 1;

    private static final int ROW = 0;
    private static final int HEAD = 1;
    /** More than a screen of rows. */
    private static final int POOL = 16;

    private final SongListAdapter model;
    private final WeakReference list;
    private final ShufflePlaylistItemView spv;

    private SongRows(RecyclerView rv, ShufflePlaylistItemView spv, SongListAdapter model) {
        this.model = model;
        this.list = new WeakReference(rv);
        this.spv = spv;
    }

    /** {@code initView}, in place of {@code lv.setAdapter}: the screen's {@code spv} beside the list. */
    public static void attach(RecyclerView rv, SongListAdapter a) {
        Object p = rv == null ? null : rv.getParent();
        View s = p instanceof View ? ((View) p).findViewById(R.id.spv) : null;
        attach(rv, s instanceof ShufflePlaylistItemView ? (ShufflePlaylistItemView) s : null, a);
    }

    /** The Shuffle row moves into the list, as its row 0. */
    public static void attach(RecyclerView rv, ShufflePlaylistItemView spv, SongListAdapter a) {
        if (rv == null || a == null) return;
        if (spv != null && spv.getParent() instanceof ViewGroup && spv.getParent() != rv) {
            int h = spv.getLayoutParams() == null ? ViewGroup.LayoutParams.WRAP_CONTENT
                    : spv.getLayoutParams().height;
            ((ViewGroup) spv.getParent()).removeView(spv);
            spv.setLayoutParams(new RecyclerView.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, h));
        }
        rv.setLayoutManager(new LinearLayoutManager(rv.getContext()));
        SongRows r = new SongRows(rv, spv, a);
        // before setAdapter: it cannot change once the list observes the adapter
        r.setHasStableIds(true);
        if (spv != null) HEADS.put(spv, new WeakReference(r));
        a.registerDataSetObserver(new Watch(r));
        Wheel.tune(rv);
        // A rebuild (a jump by letter, a new sort) sends every row on screen to the pool, which
        // keeps 5 by default: the rest were inflated again on every jump.
        rv.getRecycledViewPool().setMaxRecycledViews(ROW, POOL);
        rv.setAdapter(r);
    }

    static SongRows of(RecyclerView rv) {
        Object a = rv == null ? null : rv.getAdapter();
        return a instanceof SongRows ? (SongRows) a : null;
    }

    SongListAdapter model() {
        return model;
    }

    ShufflePlaylistItemView shuffle() {
        return spv;
    }

    RecyclerView list() {
        return (RecyclerView) list.get();
    }

    public int getItemCount() {
        int n = model.getCount();
        return n == 0 ? 0 : n + HEAD_ROWS;
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
        r.idBase += first - (rvPos - above);
    }

    public int getItemViewType(int p) {
        return p < HEAD_ROWS ? HEAD : ROW;
    }

    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int type) {
        if (type == HEAD) {
            View v = spv != null && spv.getParent() == null ? (View) spv : new View(parent.getContext());
            return new HeadHolder(v);
        }
        dbgMade++;
        return new Holder(ItemSonglistBinding.inflate(LayoutInflater.from(parent.getContext()), parent, false));
    }

    public void onBindViewHolder(RecyclerView.ViewHolder h, int p) {
        try {
            long t0 = android.os.SystemClock.uptimeMillis();
            if (h.itemView.isLayoutRequested()) dbgReqBefore++;
            if (h instanceof Holder) bindRow((Holder) h, p - HEAD_ROWS);
            else Bar.row(h.itemView);
            dbgBinds++;
            if (h.itemView.isLayoutRequested()) {
                dbgReqAfter++;
                if (dbgWho == null) dbgWho = who(h.itemView, new StringBuilder()).toString();
            }
            dbgBindMs += android.os.SystemClock.uptimeMillis() - t0;
        } catch (Throwable t) {
        }
    }

    // temporary: what a jump by letter costs
    static int dbgBinds, dbgMade, dbgReqBefore, dbgReqAfter;
    static long dbgBindMs;
    static String dbgWho;

    private static StringBuilder who(View v, StringBuilder b) {
        if (v.isLayoutRequested()) {
            String n;
            try {
                n = v.getId() == View.NO_ID ? v.getClass().getSimpleName() : v.getResources().getResourceEntryName(v.getId());
            } catch (Throwable t) {
                n = v.getClass().getSimpleName();
            }
            b.append(n).append(' ');
        }
        if (v instanceof ViewGroup) {
            ViewGroup g = (ViewGroup) v;
            for (int i = 0; i < g.getChildCount(); i++) who(g.getChildAt(i), b);
        }
        return b;
    }

    /** The cursor as a list row: the Shuffle row is 0 while the model is parked at -1 on it. */
    public int cursor() {
        return model.getPosition() + HEAD_ROWS;
    }

    public boolean ticked(int p) {
        List s = model.getSelectedIndexList();
        return p >= HEAD_ROWS && s != null && s.contains(Integer.valueOf(p - HEAD_ROWS));
    }

    /** {@code SongListAdapter.getView}, row for row. */
    private void bindRow(Holder h, int q) {
        SongListAdapter a = model;
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
        if (!(t instanceof TextView)) return;
        int c = ((TextView) t).getCurrentTextColor();
        View m = row.findViewById(R.id.ipp_song_mark);
        if (m instanceof ImageView && m.getVisibility() == View.VISIBLE) Icons.menu((ImageView) m, c);
        View im = row instanceof ShufflePlaylistItemView ? row.findViewById(R.id.img) : null;
        if (im instanceof ImageView) Icons.menu((ImageView) im, c);
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
                View v = lm == null ? null : lm.findViewByPosition(s.cursor());
                if (v == null || v.getTop() < r.getPaddingTop()
                        || v.getBottom() > r.getHeight() - r.getPaddingBottom()) {
                    Lv.pin(r, s.model.getPosition());
                }
            } catch (Throwable t) {
            }
        }
    }

    /** {@code BaseActivity.cancelMultiSelect} for a song list on a RecyclerView. */
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
                if (s == null || s.cursor() != 0) return;
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

    static final class HeadHolder extends RecyclerView.ViewHolder {
        HeadHolder(View v) {
            super(v);
        }
    }
}
