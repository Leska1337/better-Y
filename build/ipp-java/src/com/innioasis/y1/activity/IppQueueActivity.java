package com.innioasis.y1.activity;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.text.Spannable;
import android.text.SpannableString;
import android.text.method.TransformationMethod;
import android.text.style.StyleSpan;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.innioasis.ipp.Albums;
import com.innioasis.ipp.Anim;
import com.innioasis.ipp.Artists;
import com.innioasis.ipp.Bar;
import com.innioasis.ipp.BigCover;
import com.innioasis.ipp.Cover;
import com.innioasis.ipp.CoverCache;
import com.innioasis.ipp.Ipp;
import com.innioasis.ipp.Queue;
import com.innioasis.ipp.Scroll;
import com.innioasis.ipp.Theme;
import com.innioasis.ipp.Wheel;
import com.innioasis.music.adapter.SubmenuAdapter;
import com.innioasis.music.util.Other;
import com.innioasis.music.util.SubMenuDialog;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.base.BaseActivity;
import com.innioasis.y1.database.Playlist;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.database.Y1Repository;
import com.innioasis.y1.databinding.ActivityAboutBinding;
import com.innioasis.y1.theme.ThemeManager;

import java.io.File;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.UUID;

/**
 * The "Up Next" screen: the playing track pinned on top, then the queued tracks, then what the
 * playlist has left ({@link Queue#upNext()}) in a RecyclerView. Centre plays a row, long top opens
 * its menu, top closes. Rebuilt on every {@code MY_PLAY_SONG}, so it follows track changes live.
 * The cursor's position in the list is the screen's mark; the playing row is mark -1, the head
 * row of the travelling {@link Bar}.
 */
public final class IppQueueActivity extends BaseActivity {

    private static final int ACCENT = Color.parseColor("#3CFFDE");

    private List rows;                 // List<Song> — current projection; row 0 plays
    private int sel;                   // the cursor's ROW
    private PlayWatch watch;

    // The list: a position is a song row or a group caption, which the cursor never stands on.
    private RecyclerView list;
    private LinearLayoutManager lm;
    private QAdapter adapter;
    private TextView empty;
    private int[] entRow = new int[0];   // per position: its row, -1 for a caption
    private String[] entCap = new String[0];
    private int[] posOf = new int[0];    // per row: its position, -1 = the pinned playing row
    private int rowH;                    // a song row's height, from stretch(); 0 = natural

    // The playing row, built once: the bar keeps it as its head.
    private LinearLayout header;
    private View nowCap;
    private LinearLayout playBand;
    private LinearLayout playRow;
    private ImageView playCover;
    private TextView playTag;
    private TextView playTitle;
    private TextView playSub;

    /** A caption's text size, sp, and its air above and below the words, px. */
    private static final float CAPTION_SP = 12.0f;
    private static final int CAPTION_PAD = 3;
    /** A rule along a band's top and bottom edge, px. */
    private static final int RULE_H = 2;
    /** The playing row's wash, weaker than a caption's. */
    private static final int PLAY_ALPHA = 0x2E000000;

    /** ...weaker again over the wallpaper ({@link IppActivity#BAND_ALPHA_BARE}). */
    private static final int PLAY_ALPHA_BARE = 0x17000000;

    private static int playAlpha() {
        return Theme.rowsPainted() ? PLAY_ALPHA : PLAY_ALPHA_BARE;
    }

    /** The playing row's two lines, sp: the song's name, and the artist under it. */
    private static final float PLAY_NAME_SP = 18.0f;
    private static final float PLAY_SUB_SP = 14.0f;

    /** Between every two rows, so far weaker than a caption's rule. */
    private static final int HAIR_H = 1;
    private static final int HAIR_ALPHA = 0x1F000000;

    /** A row's height in pixels, from the size {@link #textSize} hands to {@code setTextSize}. */
    private static int px(float sp, android.util.DisplayMetrics m) {
        return (int) (android.util.TypedValue.applyDimension(
                android.util.TypedValue.COMPLEX_UNIT_SP, sp, m) * 1.5f);
    }

    // The pinned caption: the group the top of the list belongs to, worked out from the in-list
    // captions. The first group's caption is only ever here.
    private LinearLayout pinned;
    private TextView pinnedText;
    private String pinnedShown;
    private String pinnedFirst;
    private int[] capPos = new int[0];
    private int playBase;               // the playing row without the remainder stretch() gives it
    private int playExtra;
    private String[] labels;            // one label() per row per render, not one per bind

    /** One dot and one tick bitmap per (size, colour), not per row. */
    private final java.util.HashMap markCache = new java.util.HashMap();

    // Multi-select, as stock draws it: ticked rows carry the highlight, the cursor BLINKS. Row 0
    // is never ticked. The name is the one Bar reads by reflection.
    private static final int BLINK_MS = 500;
    private boolean isMultiSelect;
    private final HashSet marked = new HashSet();   // Integer row numbers
    private boolean blinkOn;
    private Blink blink;

    /** The open long-press menu, so the "Open artist" submenu can dismiss its parent. */
    private SubMenuDialog menuDlg;

    /** Resolved songs by path — see {@link #resolved}. Cleared with the screen. */
    private final java.util.HashMap resolvedByPath = new java.util.HashMap();

    @Override
    public ActivityAboutBinding getViewBinding() {
        return ActivityAboutBinding.inflate(getLayoutInflater());
    }

    @Override
    public void initView() {
        setStateBarLeftText(getString(R.string.ipp_queue_title));

        ViewGroup root = (ViewGroup) getVb().getRoot();
        root.removeAllViews();

        LinearLayout outer = new LinearLayout(this);
        outer.setOrientation(LinearLayout.VERTICAL);

        // no side padding, or the wallpaper shows as a stripe down both edges
        header = new LinearLayout(this);
        header.setOrientation(LinearLayout.VERTICAL);
        buildPlaying();
        outer.addView(header, -1, -2);

        pinnedText = captionView("");
        pinned = band(pinnedText, -2, IppActivity.RULE_ALPHA, RULE_H, IppActivity.bandAlpha());
        pinned.setVisibility(View.GONE);
        outer.addView(pinned, -1, -2);

        list = new RecyclerView(this);
        list.setId(R.id.recycler);
        lm = new LinearLayoutManager(this);
        list.setLayoutManager(lm);
        // rows are rebound in place by Wheel.follow, never notified (skill ipp-wheel-scroll)
        list.setItemAnimator(null);
        list.setItemViewCacheSize(0);
        lm.setItemPrefetchEnabled(false);
        list.setDescendantFocusability(ViewGroup.FOCUS_BLOCK_DESCENDANTS);
        adapter = new QAdapter(this);
        list.setAdapter(adapter);
        LinearLayout.LayoutParams sp = new LinearLayout.LayoutParams(-1, 0);
        sp.weight = 1.0f;
        outer.addView(list, sp);

        empty = new TextView(this);
        empty.setTextSize(16.0f);
        empty.setPadding(6, 12, 6, 6);
        empty.setText(getString(R.string.ipp_queue_empty));
        ThemeManager.INSTANCE.itemSetTextColor(empty, -1, false);
        empty.setVisibility(View.GONE);
        outer.addView(empty, -1, -2);

        root.addView(outer, -1, -1);

        list.getViewTreeObserver().addOnPreDrawListener(new Pin(this));

        sel = 0;
        // a theme's row picture lands late: repaint when it does
        retheme = new Retheme(this);
        Theme.watchRows(retheme);
        render();

        watch = new PlayWatch(this);
        registerReceiver(watch, new IntentFilter("android.intent.action.MY_PLAY_SONG"));
    }

    @Override
    protected void onDestroy() {
        Theme.unwatchRows(retheme);
        stopBlink();
        if (watch != null) {
            try {
                unregisterReceiver(watch);
            } catch (Exception e) {
            }
            watch = null;
        }
        super.onDestroy();
    }

    /** A track change drops the ticks: they are row numbers, and every row just moved. */
    void onTrackChanged() {
        endMulti();
        render();
    }

    /** The playing row is bigger. */
    private static float textSize(int row) {
        return row == 0 ? 18.0f : 16.0f;
    }

    /** The "Now playing" caption and the playing row: its cover, else ▶, then its two lines. */
    private void buildPlaying() {
        // captioned with the main menu's own words (main_now)
        nowCap = divider(getString(R.string.main_now));
        header.addView(nowCap, dividerParams());

        playRow = new LinearLayout(this);
        playRow.setId(R.id.search_head);
        playRow.setOrientation(LinearLayout.HORIZONTAL);
        playRow.setBaselineAligned(false);
        playRow.setGravity(Gravity.CENTER_VERTICAL);
        playRow.setPadding(10, 0, 5, 0);

        playCover = new ImageView(this);
        LinearLayout.LayoutParams ip = new LinearLayout.LayoutParams(COVER_PX, COVER_PX);
        ip.rightMargin = 8;
        playRow.addView(playCover, ip);

        playTag = new TextView(this);
        playTag.setId(R.id.tv_item);
        playTag.setTextSize(textSize(0));
        bold(playTag);
        playTag.setIncludeFontPadding(false);
        playTag.setGravity(Gravity.CENTER_VERTICAL);
        playTag.setPadding(0, 0, 8, 0);
        playTag.setText("▶");
        playRow.addView(playTag, -2, -2);

        // two lines: the name, bold as a whole, and the artist under it
        playTitle = new TextView(this);
        playTitle.setId(R.id.title);
        playTitle.setTextSize(PLAY_NAME_SP);
        bold(playTitle);
        playTitle.setIncludeFontPadding(false);
        playTitle.setGravity(Gravity.CENTER_VERTICAL);
        playTitle.setSingleLine(true);

        playSub = new TextView(this);
        playSub.setId(R.id.text);
        playSub.setTextSize(PLAY_SUB_SP);
        playSub.setTypeface(Typeface.MONOSPACE, Typeface.NORMAL);
        playSub.setIncludeFontPadding(false);
        playSub.setGravity(Gravity.CENTER_VERTICAL);
        playSub.setSingleLine(true);
        playSub.setEllipsize(android.text.TextUtils.TruncateAt.END);

        LinearLayout stack = new LinearLayout(this);
        stack.setOrientation(LinearLayout.VERTICAL);
        stack.setGravity(Gravity.CENTER_VERTICAL);
        stack.addView(playTitle, new LinearLayout.LayoutParams(-1, -2));
        stack.addView(playSub, new LinearLayout.LayoutParams(-1, -2));
        LinearLayout.LayoutParams stp = new LinearLayout.LayoutParams(0, -2);
        stp.weight = 1.0f;
        playRow.addView(stack, stp);

        // the wash without rules: the caption above already carries one
        playBand = band(playRow, -2, 0, 0, playAlpha());
        header.addView(playBand, new LinearLayout.LayoutParams(-1, -2));
    }

    /** Build the list when its CONTENT changes — never for a wheel click ({@link #move}). */
    void render() {
        rows = Queue.upNext();
        int n = rows.size();
        labels = new String[n];
        pinnedFirst = null;
        pinnedShown = null;

        if (n == 0) {
            entRow = new int[0];
            entCap = new String[0];
            posOf = new int[0];
            capPos = new int[0];
            header.setVisibility(View.GONE);
            pinned.setVisibility(View.GONE);
            list.setVisibility(View.GONE);
            empty.setVisibility(View.VISIBLE);
            adapter.notifyDataSetChanged();
            setMark(-1);
            return;
        }
        header.setVisibility(View.VISIBLE);
        list.setVisibility(View.VISIBLE);
        empty.setVisibility(View.GONE);
        if (sel >= n) sel = n - 1;
        if (sel < 0) sel = 0;

        // a group's caption only when the group has anything in it; the FIRST only on the pinned bar
        ArrayList ents = new ArrayList();
        ArrayList caps = new ArrayList();
        posOf = new int[n];
        posOf[0] = -1;
        boolean manualDone = false;
        boolean autoDone = false;
        for (int i = 1; i < n; i++) {
            boolean mine = Queue.isManualRow(i);
            String cap = null;
            if (mine && !manualDone) {
                cap = manualCaption();
                manualDone = true;
            } else if (!mine && !autoDone) {
                cap = getString(R.string.ipp_queue_next_from, new Object[]{Queue.source()});
                autoDone = true;
            }
            if (cap != null) {
                if (pinnedFirst == null) {
                    pinnedFirst = cap;
                } else {
                    caps.add(Integer.valueOf(ents.size()));
                    ents.add(cap);
                }
            }
            posOf[i] = ents.size();
            ents.add(Integer.valueOf(i));
        }
        entRow = new int[ents.size()];
        entCap = new String[ents.size()];
        for (int p = 0; p < entRow.length; p++) {
            Object o = ents.get(p);
            entRow[p] = o instanceof Integer ? ((Integer) o).intValue() : -1;
            entCap[p] = o instanceof String ? (String) o : null;
        }
        capPos = new int[caps.size()];
        for (int k = 0; k < capPos.length; k++) capPos[k] = ((Integer) caps.get(k)).intValue();
        if (pinnedFirst != null) setPinned(pinnedFirst); else pinned.setVisibility(View.GONE);

        fillPlaying();
        paintHead();
        setMark(posOf[sel]);
        adapter.notifyDataSetChanged();
        // a new list: the bar stands on the cursor instead of flying in from a row that is gone
        Bar.relist(list);
        list.stopScroll();
        lm.scrollToPosition(sel > 0 ? posOf[sel] : 0);
    }

    /** The playing row's content: its picture and its two lines. */
    private void fillPlaying() {
        Bitmap art = cover((Song) rows.get(0));
        if (art != null) {
            playCover.setImageBitmap(art);
            playCover.setVisibility(View.VISIBLE);
            playTag.setVisibility(View.GONE);
        } else {
            playCover.setVisibility(View.GONE);
            playTag.setVisibility(View.VISIBLE);
        }
        playSub.setText(artistAt(0));
        // a FIXED height: a theme bitmap would stretch the row
        int h = Math.max(rowHeight(playTitle) + rowHeight(playSub), COVER_PX);
        playBase = h;                            // stretch() adds to this
        setHeight(playRow, h + playExtra);
    }

    /** The playing row's look; under the bar its background is the bar's. */
    private void paintHead() {
        boolean on = highlighted(0);
        if (!Anim.on()) {
            ThemeManager.INSTANCE.itemSetBackground(playRow, on ? R.drawable.item_setting_sel : 0, on);
        }
        ThemeManager.INSTANCE.itemSetTextColor(playTag, on ? ACCENT : -1, on);
        ThemeManager.INSTANCE.itemSetTextColor(playTitle, on ? ACCENT : -1, on);
        ThemeManager.INSTANCE.itemSetTextColor(playSub, on ? ACCENT : -1, on);
        // marked by colour, not background: that would read as two cursors
        if (!on) {
            int cd = getResources().getColor(R.color.selected_text_color);
            ThemeManager.INSTANCE.itemSetTextColor(playTag, cd, false);
            ThemeManager.INSTANCE.itemSetTextColor(playTitle, cd, false);
            ThemeManager.INSTANCE.itemSetTextColor(playSub, cd, false);
        }
        // only the cursor's row scrolls; the playing row scrolls its name alone
        String name = nameAt(0);
        if (sel == 0) {
            Scroll.marqueeText(playTitle, name);
        } else {
            Scroll.stopMarquee(playTitle);
            if (!name.contentEquals(playTitle.getText())) playTitle.setText(name);
        }
    }

    /** A song row of the list, at position {@code p}. */
    void bindRow(RowHolder h, int p) {
        int r = entRow[p];
        h.row = r;
        setHeight(h.line, rowH > 0 ? rowH : rowHeight(h.title));
        // no hairline under a row a caption follows: the caption's rule draws that boundary
        boolean capNext = p + 1 < entRow.length && entRow[p + 1] < 0;
        h.hair.setVisibility(capNext ? View.GONE : View.VISIBLE);

        boolean on = highlighted(r);
        if (!Anim.on()) {
            ThemeManager.INSTANCE.itemSetBackground(h.line, on ? R.drawable.item_setting_sel : 0, on);
        }
        ThemeManager.INSTANCE.itemSetTextColor(h.title, on ? ACCENT : -1, on);

        // Only the cursor's row scrolls; a row that loses it is stopped explicitly (Scroll's
        // marquee is a Handler tick).
        String plain = labelAt(r);
        if (r == sel) {
            Scroll.marqueeText(h.title, plain);
        } else {
            Scroll.stopMarquee(h.title);
            if (!plain.contentEquals(h.title.getText())) h.title.setText(plain);
        }
        // AFTER the marquee: its setSingleLine() installs its own transformation over ours
        TransformationMethod tm = h.title.getTransformationMethod();
        if (!(tm instanceof BoldTitle) || !((BoldTitle) tm).plain.equals(plain)) {
            h.title.setTransformationMethod(new BoldTitle(plain, titleLen(plain)));
        }
        mark(h);
        Bar.row(h.itemView);
    }

    /** A caption of the list: the band, washed afresh — a theme may have landed since. */
    void bindCaption(CapHolder h, int p) {
        h.text.setText(entCap[p]);
        h.itemView.setBackgroundColor(washRgb() | IppActivity.bandAlpha());
    }

    /** The row's mark, in the colour its text has just been given: the dot, or the tick. */
    private void mark(RowHolder h) {
        Bitmap bm = marked.contains(Integer.valueOf(h.row))
                ? tickMark(textSize(h.row), h.title) : queuedDot(textSize(h.row), h.title);
        if (h.dot.getTag() == bm) return;
        h.dot.setTag(bm);
        h.dot.setImageBitmap(bm);
    }

    /** From {@link Bar}: it has just given a row's text another colour; the tick follows it. */
    public void tinted(View row) {
        Object t = row == null ? null : row.getTag();
        if (t instanceof RowHolder) mark((RowHolder) t);
    }

    /** A song row: the line, its hairline on the BOTTOM edge only — one line per boundary. */
    RowHolder newRow() {
        LinearLayout line = new LinearLayout(this);
        line.setOrientation(LinearLayout.HORIZONTAL);
        line.setBaselineAligned(false);
        line.setGravity(Gravity.CENTER_VERTICAL);
        line.setPadding(10, 0, 5, 0);

        // a drawn mark, not a glyph: its ring is stroked, a text shadow would blur
        ImageView dot = new ImageView(this);
        LinearLayout.LayoutParams dp = new LinearLayout.LayoutParams(-2, -2);
        dp.rightMargin = 8;
        line.addView(dot, dp);

        TextView title = new TextView(this);
        title.setId(R.id.title);
        title.setTextSize(textSize(1));
        // only the song's own name is bold (BoldTitle)
        title.setTypeface(Typeface.MONOSPACE, Typeface.NORMAL);
        title.setIncludeFontPadding(false);
        title.setGravity(Gravity.CENTER_VERTICAL);
        title.setSingleLine(true);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, -1);
        lp.weight = 1.0f;
        line.addView(title, lp);

        // no margins (a gap shows wallpaper): the hairline is inside the box
        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        box.addView(line, new LinearLayout.LayoutParams(-1, rowHeight(title)));
        View hair = rule(itemRgb(), HAIR_ALPHA);
        box.addView(hair, new LinearLayout.LayoutParams(-1, HAIR_H));
        box.setLayoutParams(new RecyclerView.LayoutParams(-1, -2));
        RowHolder h = new RowHolder(box, line, dot, title, hair);
        box.setTag(h);
        return h;
    }

    /** A group caption: not selectable — the wheel walks songs. */
    CapHolder newCaption() {
        TextView tv = captionView("");
        View box = band(tv, -2, IppActivity.RULE_ALPHA, RULE_H, IppActivity.bandAlpha());
        box.setLayoutParams(new RecyclerView.LayoutParams(-1, -2));
        box.setTag(Bar.CAPTION);
        return new CapHolder(box, tv);
    }

    /** The row at a position rebound in place, as {@code Wheel.follow} does it. */
    private void rebind(int p) {
        if (p < 0 || p >= entRow.length) return;
        View v = lm.findViewByPosition(p);
        if (v == null) return;
        adapter.bindViewHolder(list.getChildViewHolder(v), p);
    }

    /** Every row's look — after the ticks have gone, they all changed. */
    private void repaintAll() {
        paintHead();
        adapter.notifyDataSetChanged();
    }

    /**
     * Move the cursor: the two rows whose look changed are repainted, the list follows by
     * {@code Wheel.follow}. The playing row is the bar's head, outside the list.
     */
    private void move(int old, boolean wrapped) {
        if (old == sel) return;
        int op = posOf[old];
        int np = posOf[sel];
        setMark(np);
        if (old == 0 || sel == 0) paintHead();
        if (sel == 0) {
            rebind(op);
            // round the end: the list starts again from its top, under the row it hangs from
            if (wrapped) {
                list.stopScroll();
                lm.scrollToPositionWithOffset(0, 0);
            }
        } else if (old == 0) {
            // off the playing row: a known row before, unless the step went round the end
            Wheel.follow(list, wrapped ? -1 : np, np, adapter);
        } else {
            Wheel.follow(list, op, np, adapter);
        }
    }

    /** The highlight: the cursor, and every ticked row; blinked off, the cursor draws unselected. */
    private boolean highlighted(int i) {
        if (i == sel) return !isMultiSelect || blinkOn;
        return marked.contains(Integer.valueOf(i));
    }

    /**
     * A row's dot: the theme's menu background colour ringed with its complement — legible even
     * when that colour equals the text's. No theme: the text colour's complement.
     */
    private Bitmap queuedDot(float sizeSp, TextView colourSource) {
        int fill;
        Integer c = null;
        try {
            c = ThemeManager.INSTANCE.menuBGColor();
        } catch (Throwable t) {
        }
        if (c != null) {
            fill = c.intValue() | 0xFF000000;
        } else {
            fill = (colourSource.getCurrentTextColor() ^ 0x00FFFFFF) | 0xFF000000;
        }
        int ring = (fill ^ 0x00FFFFFF) | 0xFF000000;
        int box = markBox(sizeSp);

        String key = "d" + box + ":" + fill;
        Object hit = markCache.get(key);
        if (hit instanceof Bitmap) return (Bitmap) hit;

        // the size of the row's "•" glyph, in the marker column's box
        Paint p = new Paint();
        p.setAntiAlias(true);
        p.setTypeface(font());
        p.setTextSize(sizeSp * getResources().getDisplayMetrics().scaledDensity);
        Rect b = new Rect();
        p.getTextBounds("•", 0, 1, b);
        int d = Math.max(b.height(), b.width());
        if (d < 3) d = 3;

        float stroke = 1.5f;                     // a hairline ring, not a border
        if (d > box - 4) d = box - 4;             // room for the ring outside the fill

        Bitmap bm = Bitmap.createBitmap(box, box, Bitmap.Config.ARGB_8888);
        Canvas cv = new Canvas(bm);
        float c0 = box / 2.0f;
        float r = d / 2.0f;
        p.setStyle(Paint.Style.FILL);
        p.setColor(fill);
        cv.drawCircle(c0, c0, r, p);
        p.setStyle(Paint.Style.STROKE);
        p.setStrokeWidth(stroke);
        p.setColor(ring);
        cv.drawCircle(c0, c0, r, p);
        markCache.put(key, bm);
        return bm;
    }

    /** A ticked row's tick, drawn in the colour its text has just been given. */
    private Bitmap tickMark(float sizeSp, TextView colourSource) {
        int box = markBox(sizeSp);
        int colour = colourSource.getCurrentTextColor();
        String key = "t" + box + ":" + colour;
        Object hit = markCache.get(key);
        if (hit instanceof Bitmap) return (Bitmap) hit;

        Bitmap bm = Bitmap.createBitmap(box, box, Bitmap.Config.ARGB_8888);
        Canvas cv = new Canvas(bm);
        Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
        p.setColor(colour);
        p.setStyle(Paint.Style.STROKE);
        float k = box / 16.0f;
        float w = 2.4f * k;
        p.setStrokeWidth(w < 1.5f ? 1.5f : w);
        cv.drawLine(2.5f * k, 8.5f * k, 6.5f * k, 12.5f * k, p);
        cv.drawLine(6.5f * k, 12.5f * k, 13.5f * k, 3.5f * k, p);
        markCache.put(key, bm);
        return bm;
    }

    /** One square for dot and tick alike, so ticking never shifts the title. */
    private int markBox(float sizeSp) {
        int n = Math.round(sizeSp * getResources().getDisplayMetrics().scaledDensity * 0.8f);
        return n < 10 ? 10 : n;
    }

    /** A caption band with its words. */
    private View divider(String text) {
        return band(captionView(text), -2, IppActivity.RULE_ALPHA, RULE_H, IppActivity.bandAlpha());
    }

    /**
     * The pinned bar names the group at the top of the list: the last caption gone above the edge.
     * Per frame, since keys are not the only thing that moves the list.
     */
    void repin() {
        try {
            if (pinned == null || list == null) return;
            if (pinnedFirst == null) {
                if (pinned.getVisibility() != View.GONE) pinned.setVisibility(View.GONE);
                return;
            }
            String label = pinnedFirst;
            int first = lm.findFirstVisibleItemPosition();
            for (int k = 0; k < capPos.length; k++) {
                View v = lm.findViewByPosition(capPos[k]);
                // its BOTTOM edge: while on screen it is the heading itself
                if (v != null) {
                    if (v.getBottom() > 0) break;
                } else if (first < 0 || capPos[k] > first) {
                    break;
                }
                label = entCap[capPos[k]];
            }
            setPinned(label);
        } catch (Throwable t) {
        }
    }

    private void setPinned(String label) {
        if (pinnedText == null || pinned == null) return;
        if (label.equals(pinnedShown) && pinned.getVisibility() == View.VISIBLE) return;
        pinnedShown = label;
        pinnedText.setText(label);
        pinned.setVisibility(View.VISIBLE);
    }

    /**
     * Song rows of one height that divides the list's space, so the bottom row ends on the edge.
     * From the pre-draw (known only after layout); a changing pass cancels its frame. The remainder
     * goes into the PLAYING row, so song rows stay equal; {@code playExtra} is measured back out,
     * or the passes oscillate.
     */
    boolean stretch() {
        try {
            if (list == null || list.getVisibility() != View.VISIBLE) return false;
            int avail = list.getHeight() + playExtra;
            if (avail <= 0) return false;

            int natural = px(textSize(1), getResources().getDisplayMetrics());
            int fits = avail / (natural + HAIR_H);
            if (fits < 1) return false;
            int step = avail / fits;                  // at least the natural one, never less
            int rem = avail - fits * step;            // 0 .. fits-1

            boolean changed = false;
            if (rowH != step - HAIR_H) {
                rowH = step - HAIR_H;
                adapter.notifyDataSetChanged();
                changed = true;
            }
            if (playBase > 0 && setHeight(playRow, playBase + rem)) {
                playExtra = rem;
                changed = true;
            }
            return changed;
        } catch (Throwable t) {
            return false;
        }
    }

    private static boolean setHeight(View v, int h) {
        if (v == null) return false;
        ViewGroup.LayoutParams lp = v.getLayoutParams();
        if (lp == null || lp.height == h) return false;
        lp.height = h;
        v.setLayoutParams(lp);
        return true;
    }

    /** Every frame: the captions' positions settle only after layout, and the list glides. */
    static final class Pin implements android.view.ViewTreeObserver.OnPreDrawListener {
        private final IppQueueActivity a;

        Pin(IppQueueActivity a) {
            this.a = a;
        }

        public boolean onPreDraw() {
            a.repin();
            return !a.stretch();                 // resized: this frame is stale
        }
    }

    /** The words of a caption, in the colour an unfocused row is painted. */
    private TextView captionView(String text) {
        TextView tv = new TextView(this);
        tv.setTextSize(CAPTION_SP);
        bold(tv);
        tv.setIncludeFontPadding(false);
        tv.setGravity(Gravity.CENTER_VERTICAL);
        // air above and below, so the wash reads as a band, not a highlight
        tv.setPadding(10, CAPTION_PAD, 5, CAPTION_PAD);
        tv.setSingleLine(true);
        tv.setEllipsize(android.text.TextUtils.TruncateAt.END);
        tv.setText(text);
        ThemeManager.INSTANCE.itemSetTextColor(tv,
                getResources().getColor(R.color.selected_text_color), false);
        return tv;
    }

    /**
     * The better-Y menu's caption band: rules top and bottom, a wash between ({@code ruleAlpha} 0 =
     * the wash alone). Colours read off a scratch TextView — {@code itemSetTextColor} ignores the
     * colour passed — never off the content, which may be painted already.
     */
    private LinearLayout band(View content, int contentH, int ruleAlpha, int ruleH, int washAlpha) {
        TextView probe = new TextView(this);
        int wash = washRgb();
        ThemeManager.INSTANCE.itemSetTextColor(probe,
                getResources().getColor(R.color.selected_text_color), false);
        int rule = probe.getCurrentTextColor() & 0x00FFFFFF;

        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        if (ruleAlpha != 0) box.addView(rule(rule, ruleAlpha), new LinearLayout.LayoutParams(-1, ruleH));
        box.addView(content, new LinearLayout.LayoutParams(-1, contentH));
        if (ruleAlpha != 0) box.addView(rule(rule, ruleAlpha), new LinearLayout.LayoutParams(-1, ruleH));
        box.setBackgroundColor(wash | washAlpha);
        return box;
    }

    /** The theme's SELECTED item colour: a band's wash. */
    private int washRgb() {
        TextView probe = new TextView(this);
        ThemeManager.INSTANCE.itemSetTextColor(probe, ACCENT, true);
        return probe.getCurrentTextColor() & 0x00FFFFFF;
    }

    /** The theme's ordinary item colour (see {@link #band}). */
    private int itemRgb() {
        TextView probe = new TextView(this);
        ThemeManager.INSTANCE.itemSetTextColor(probe,
                getResources().getColor(R.color.selected_text_color), false);
        return probe.getCurrentTextColor() & 0x00FFFFFF;
    }

    /** One band of a caption or of a row, in the text's own colour thinned out. */
    private View rule(int rgb, int alpha) {
        View v = new View(this);
        v.setBackgroundColor(rgb | alpha);
        return v;
    }

    private LinearLayout.LayoutParams dividerParams() {
        // no margins on this screen: a gap is a line of wallpaper
        return new LinearLayout.LayoutParams(-1, -2);
    }

    /** Row height that fits the text, independent of any theme background's intrinsic size. */
    static int rowHeight(TextView tv) {
        return (int) (tv.getTextSize() * 1.5f);
    }

    /** The theme's font: ThemeManager swaps {@code Typeface.MONOSPACE} for it. */
    private static Typeface font() {
        return Typeface.create(Typeface.MONOSPACE, Typeface.BOLD);
    }

    /** The TWO-argument form: only it fakes bold for a theme font without a bold cut. */
    private static void bold(TextView tv) {
        tv.setTypeface(Typeface.MONOSPACE, Typeface.BOLD);
    }

    /**
     * The playing TRACK's own picture, as Now Playing shows it ({@code peekTrack}, no tag read);
     * the album thumbnail as the fallback. Scaled once per track, not per frame.
     */
    private Bitmap cover(Song s) {
        try {
            if (s == null) return null;
            String path = s.getPath();
            if (path != null && path.equals(coverPath) && coverArt != null) return coverArt;
            Bitmap own = BigCover.peekTrack(path);
            Bitmap out = own != null ? Cover.square(own, COVER_PX) : null;
            if (out == null) out = CoverCache.get(Albums.keyOf(s), path);
            coverPath = path;
            coverArt = out;
            return out;
        } catch (Exception e) {
            return null;
        }
    }

    /** The queued rows' caption, with "20 of 137" only when not all are shown. */
    private String manualCaption() {
        int all = Queue.manualCount();
        int shown = Queue.manualShown();
        if (all <= shown) return getString(R.string.ipp_queue_next_manual);
        return getString(R.string.ipp_queue_next_manual_n,
                new Object[]{Integer.valueOf(shown), Integer.valueOf(all)});
    }

    /** The size of the playing row's thumbnail, and the box it is laid out in. */
    private static final int COVER_PX = 50;

    private String coverPath;
    private Bitmap coverArt;

    private static final String SEP = " — ";

    /** The title first, then the artist (title = metadata-or-filename, per the meta_title setting). */
    private String label(Song s) {
        if (s == null) return "";
        s = resolved(s);
        String name = unNamed(Ipp.songTitle(this, s.getSongName(), s.getName()));
        String artist = unNamed(s.getArtist());
        if (artist.length() == 0) return name;
        return name + SEP + artist;
    }

    /** The row's label, computed once per row per render. */
    private String labelAt(int i) {
        if (rows == null || i < 0 || i >= rows.size()) return "";
        if (labels != null && i < labels.length && labels[i] != null) return labels[i];
        String s = label((Song) rows.get(i));
        if (labels != null && i < labels.length) labels[i] = s;
        return s;
    }

    /** The song's own name, and the artist under it — the playing row's two lines. */
    private String nameAt(int i) {
        String s = labelAt(i);
        int n = titleLen(s);
        return n <= 0 ? s : s.substring(0, n);
    }

    private String artistAt(int i) {
        String s = labelAt(i);
        int n = titleLen(s) + SEP.length();
        return n >= s.length() ? "" : s.substring(n);
    }

    /** How much of the label is the song's own name — everything before the separator. */
    private static int titleLen(String plain) {
        if (plain == null) return 0;
        int i = plain.indexOf(SEP);
        return (i < 0) ? plain.length() : i;
    }

    /**
     * Bold title, plain artist, kept while the row scrolls: the marquee re-sets the text every
     * tick, dropping spans, and a TransformationMethod runs on every setText — both copies of the
     * doubled string included.
     */
    static final class BoldTitle implements TransformationMethod {
        final String plain;
        private final int titleLen;

        BoldTitle(String plain, int titleLen) {
            this.plain = (plain == null) ? "" : plain;
            this.titleLen = titleLen;
        }

        public CharSequence getTransformation(CharSequence source, View view) {
            if (source == null) return "";
            if (titleLen <= 0 || plain.length() == 0) return source;
            String s = source.toString();
            SpannableString sp = new SpannableString(s);
            for (int i = s.indexOf(plain); i >= 0; i = s.indexOf(plain, i + 1)) {
                sp.setSpan(new StyleSpan(Typeface.BOLD), i, i + titleLen,
                        Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
            }
            return sp;
        }

        public void onFocusChanged(View v, CharSequence st, boolean focused, int dir, Rect prev) {
        }
    }

    /** Strips {@code Constant.UNKNOWN}'s "￦￦￦￦" sort prefix, or it shows as struck-through W's. */
    private static String unNamed(String s) {
        if (s == null) return "";
        try {
            return Other.INSTANCE.unNamed(s);
        } catch (Throwable t) {
            return s;
        }
    }

    /**
     * Folders puts PATH-ONLY songs in the playlist: re-read one with a blank name, as stock's Now
     * Playing does — the library row first, the file's tags only outside it. Memoised by path.
     */
    private Song resolved(Song s) {
        try {
            String n = s.getName();
            if (n != null && n.trim().length() > 0) return s;
            String p = s.getPath();
            if (p == null || p.length() == 0) return s;
            Object cached = resolvedByPath.get(p);
            if (cached instanceof Song) return (Song) cached;
            Y1Repository repo = Y1Application.Companion.getY1Repository();
            Song full = repo.getSongByPathSync(p);
            if (full == null) full = repo.fileToSong(new File(p));
            if (full == null) return s;
            resolvedByPath.put(p, full);
            return full;
        } catch (Throwable t) {
            return s;
        }
    }

    @Override
    public void clockwise() {
        if (rows == null || rows.isEmpty()) return;
        int old = sel;
        boolean wrapped = false;
        if (sel >= rows.size() - 1) {
            if (!Bar.wraps(list, 1)) return;
            sel = isMultiSelect ? 1 : 0;        // loop scrolling: round to the top
            if (sel >= rows.size() || sel == old) { sel = old; return; }
            wrapped = true;
        } else {
            sel++;
        }
        move(old, wrapped);
    }

    /** In multi-select the cursor never reaches the playing row. */
    @Override
    public void antiClockwise() {
        if (rows == null || rows.isEmpty()) return;
        int old = sel;
        boolean wrapped = false;
        if (sel <= (isMultiSelect ? 1 : 0)) {
            if (rows.size() - 1 <= sel || !Bar.wraps(list, -1)) return;
            sel = rows.size() - 1;      // loop scrolling: round to the bottom
            wrapped = true;
        } else {
            sel--;
        }
        move(old, wrapped);
    }

    /**
     * Centre plays the row now; on the playing row it goes back to Now Playing. In multi-select
     * it ticks the row instead.
     */
    @Override
    public void confirm() {
        if (rows == null || rows.isEmpty()) return;
        if (isMultiSelect) {
            if (sel == 0) return;
            Integer k = Integer.valueOf(sel);
            if (!marked.remove(k)) marked.add(k);
            rebind(posOf[sel]);
            return;
        }
        if (sel == 0) {
            finish();
            return;
        }
        Queue.playRow(sel);
        sel = 0;
        render();
    }

    /**
     * Long TOP: the row's menu ({@code Direction.LTOP} is dispatched by nothing in this APK). Per
     * state: the playing row, another row, or multi-select. Dispatched BY STRING: the playlists
     * appended after ours vary in number.
     */
    @Override
    public void longConfirm() {
        if (rows == null || rows.isEmpty()) return;
        ArrayList l = new ArrayList();
        if (isMultiSelect) {
            l.add(getString(R.string.ipp_queue_remove_it));
        } else if (sel == 0) {
            if (artistsOf(sel) != null) l.add(getString(R.string.ipp_open_artist));
            l.add(getString(R.string.ipp_open_album));
            if (Queue.hasSource()) l.add(getString(R.string.ipp_open_source));
        } else {
            if (Queue.canRemoveRow(sel)) l.add(getString(R.string.ipp_queue_remove_it));
            l.add(getString(R.string.music_multi_select));
            if (artistsOf(sel) != null) l.add(getString(R.string.ipp_open_artist));
            l.add(getString(R.string.ipp_open_album));
        }
        // the trailing int is the dialog THEME; 0 sizes the window for twice the rows
        menuDlg = new SubMenuDialog(getActivity(), l, new QMenu(this), R.style.Dialog_Common);
        menuDlg.addPlaylistsToOptions();
        menuDlg.show();
    }

    /** One menu pick: true = close the menu, false = a submenu is up and dismisses it itself. */
    boolean pick(SubmenuAdapter.Item item) {
        if (item == null) return true;
        Playlist pl = item.getPlaylist();
        if (pl != null) {
            addToPlaylist(pl.getPlaylistId());
            return true;
        }
        String s = item.getString();
        if (s == null) return true;
        if (s.equals(getString(R.string.ipp_queue_remove_it))) {
            removePicked();
            return true;
        }
        if (s.equals(getString(R.string.music_multi_select))) {
            startMulti();
            return true;
        }
        if (s.equals(getString(R.string.ipp_open_album))) {
            openAlbum();
            return true;
        }
        if (s.equals(getString(R.string.ipp_open_source))) {
            if (Queue.openSource(this)) finish();
            return true;
        }
        if (s.equals(getString(R.string.ipp_open_artist))) {
            List a = artistsOf(sel);
            if (a == null) return true;
            if (a.size() == 1) {
                openArtist((String) a.get(0));
                return true;
            }
            new SubMenuDialog(getActivity(), a, new QArtists(this), R.style.Dialog_Common).show();
            return false;                          // QArtists dismisses this one on its pick
        }
        return true;
    }

    /** A pick in the "which of these artists?" submenu. */
    void pickArtist(String name) {
        if (menuDlg != null) {
            menuDlg.dismiss();
            menuDlg = null;
        }
        openArtist(name);
    }

    /**
     * Remove the ticked rows, or the cursor's. HIGHEST row first: removing a queued row shifts the
     * list's indices, and the last projection's row table is not shifted with them.
     */
    private void removePicked() {
        ArrayList todo = new ArrayList();
        if (isMultiSelect && !marked.isEmpty()) {
            java.util.Iterator it = marked.iterator();
            while (it.hasNext()) todo.add(it.next());
            java.util.Collections.sort(todo);
        } else if (sel > 0) {
            todo.add(Integer.valueOf(sel));
        }
        for (int i = todo.size() - 1; i >= 0; i--) {
            int row = ((Integer) todo.get(i)).intValue();
            if (Queue.canRemoveRow(row)) Queue.removeRow(row);
        }
        endMulti();
        render();
    }

    /** Add the ticked rows, or the cursor's, silently and off the main thread. */
    private void addToPlaylist(UUID id) {
        if (id == null) return;
        ArrayList songs = new ArrayList();
        List rowsToAdd = pickedRows();
        for (int i = 0; i < rowsToAdd.size(); i++) {
            Song s = songAt(((Integer) rowsToAdd.get(i)).intValue());
            if (s != null) songs.add(s);
        }
        endMulti();
        repaintAll();
        if (songs.isEmpty()) return;
        new Thread(new AddTask(songs, id)).start();
    }

    /** The rows a menu action applies to: the ticks, or the cursor when there are none. */
    private List pickedRows() {
        ArrayList out = new ArrayList();
        if (isMultiSelect && !marked.isEmpty()) {
            java.util.Iterator it = marked.iterator();
            while (it.hasNext()) out.add(it.next());
            java.util.Collections.sort(out);
            return out;
        }
        if (sel >= 0 && rows != null && sel < rows.size()) out.add(Integer.valueOf(sel));
        return out;
    }

    /** "Open album": the song's album, landing on the song. The player stays underneath. */
    private void openAlbum() {
        Song s = songAt(sel);
        if (s == null) return;
        Albums.openAlbumOfSong(this, s);
        finish();
    }

    /** "Open artist": the artist's album list. */
    private void openArtist(String name) {
        if (name == null || name.length() == 0) return;
        Intent i = new Intent(this, com.innioasis.music.AlbumsActivity.class);
        i.putExtra("ipp_artist", name);
        startActivity(i);
        finish();
    }

    /** The row's artists as rows of the Artists list ({@link Artists#of}), or null. */
    private List artistsOf(int row) {
        return Artists.of(songAt(row));
    }

    /** The song of a row, with the tags a Folders-built entry does not carry (see resolved). */
    private Song songAt(int row) {
        if (rows == null || row < 0 || row >= rows.size()) return null;
        Object o = rows.get(row);
        return (o instanceof Song) ? resolved((Song) o) : null;
    }

    private void startMulti() {
        if (isMultiSelect) return;
        isMultiSelect = true;
        marked.clear();
        // the row the menu was raised on starts ticked
        if (sel > 0) marked.add(Integer.valueOf(sel));
        blinkOn = false;
        blink = new Blink(this);
        list.postDelayed(blink, BLINK_MS);
        rebind(posOf[sel]);
        showBlink();
    }

    /** Leave multi-select: the ticks go, the blink stops, the cursor is lit again. */
    private void endMulti() {
        if (!isMultiSelect) return;
        isMultiSelect = false;
        marked.clear();
        stopBlink();
    }

    private void stopBlink() {
        blinkOn = true;
        if (blink != null) {
            if (list != null) list.removeCallbacks(blink);
            blink = null;
        }
    }

    void blinkTick() {
        if (!isMultiSelect || blink == null) return;
        blinkOn = !blinkOn;
        showBlink();
        list.postDelayed(blink, BLINK_MS);
    }

    /** The cursor's half of the blink: the bar blinks where there is one, else the row repaints. */
    private void showBlink() {
        View v = sel == 0 ? playRow : lm.findViewByPosition(posOf[sel]);
        if (v != null && Anim.on() && Bar.blink(v, blinkOn)) return;
        if (sel == 0) paintHead(); else rebind(posOf[sel]);
    }

    @Override
    public void direction(BaseActivity.Direction d) {
        if (d == BaseActivity.Direction.TOP) {
            // the innermost thing open: the selection, then the screen
            if (isMultiSelect) {
                endMulti();
                repaintAll();
                return;
            }
            finish();
        }
    }

    @Override
    public void quit() {
        finish();
    }

    private Retheme retheme;

    /**
     * The theme's row picture arrived: a wash may want another alpha, and the rules of every
     * built row another colour — the rows are built afresh under a new adapter.
     */
    private static final class Retheme implements Runnable {
        private final IppQueueActivity a;
        Retheme(IppQueueActivity a) { this.a = a; }
        public void run() {
            if (a.isFinishing()) return;
            int wash = a.washRgb();
            if (a.pinned != null) a.pinned.setBackgroundColor(wash | IppActivity.bandAlpha());
            if (a.nowCap != null) a.nowCap.setBackgroundColor(wash | IppActivity.bandAlpha());
            if (a.playBand != null) a.playBand.setBackgroundColor(wash | playAlpha());
            a.adapter = new QAdapter(a);
            a.list.setAdapter(a.adapter);
            a.render();
        }
    }

    /** The list's rows, read off the screen's own tables. */
    static final class QAdapter extends RecyclerView.Adapter implements Bar.Ticks {
        private static final int ROW = 0;
        private static final int CAPTION = 1;
        private final IppQueueActivity a;

        QAdapter(IppQueueActivity a) {
            this.a = a;
        }

        public int getItemCount() {
            return a.entRow.length;
        }

        public int getItemViewType(int p) {
            return a.entRow[p] < 0 ? CAPTION : ROW;
        }

        public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int type) {
            return type == CAPTION ? (RecyclerView.ViewHolder) a.newCaption() : a.newRow();
        }

        public void onBindViewHolder(RecyclerView.ViewHolder h, int p) {
            if (h instanceof RowHolder) a.bindRow((RowHolder) h, p);
            else if (h instanceof CapHolder) a.bindCaption((CapHolder) h, p);
        }

        public boolean ticked(int p) {
            return p >= 0 && p < a.entRow.length && a.marked.contains(Integer.valueOf(a.entRow[p]));
        }
    }

    static final class RowHolder extends RecyclerView.ViewHolder {
        final LinearLayout line;
        final ImageView dot;
        final TextView title;
        final View hair;
        int row;

        RowHolder(View box, LinearLayout line, ImageView dot, TextView title, View hair) {
            super(box);
            this.line = line;
            this.dot = dot;
            this.title = title;
            this.hair = hair;
        }
    }

    static final class CapHolder extends RecyclerView.ViewHolder {
        final TextView text;

        CapHolder(View box, TextView text) {
            super(box);
            this.text = text;
        }
    }

    /** Live refresh: the service broadcasts MY_PLAY_SONG on every track change. */
    private static final class PlayWatch extends BroadcastReceiver {
        private final IppQueueActivity a;

        PlayWatch(IppQueueActivity a) {
            this.a = a;
        }

        @Override
        public void onReceive(Context c, Intent i) {
            a.onTrackChanged();
        }
    }

    /** The row's long-press menu. */
    private static final class QMenu implements SubMenuDialog.Callback {
        private final IppQueueActivity a;

        QMenu(IppQueueActivity a) {
            this.a = a;
        }

        @Override
        public boolean select(int index, SubmenuAdapter.Item item) {
            return a.pick(item);
        }
    }

    /** The "which artist?" submenu of a multi-artist tag. */
    private static final class QArtists implements SubMenuDialog.Callback {
        private final IppQueueActivity a;

        QArtists(IppQueueActivity a) {
            this.a = a;
        }

        @Override
        public boolean select(int index, SubmenuAdapter.Item item) {
            if (item != null) a.pickArtist(item.getString());
            return true;
        }
    }

    /** The multi-select blink of the cursor row. */
    private static final class Blink implements Runnable {
        private final IppQueueActivity a;

        Blink(IppQueueActivity a) {
            this.a = a;
        }

        @Override
        public void run() {
            a.blinkTick();
        }
    }

    /** "Add to Playlist N", off the main thread: a write per song. */
    private static final class AddTask implements Runnable {
        private final List songs;
        private final UUID id;

        AddTask(List songs, UUID id) {
            this.songs = songs;
            this.id = id;
        }

        @Override
        public void run() {
            try {
                Y1Repository repo = Y1Application.Companion.getY1Repository();
                if (repo != null) repo.addToPlayList(songs, id);
            } catch (Throwable t) {
            }
        }
    }
}
