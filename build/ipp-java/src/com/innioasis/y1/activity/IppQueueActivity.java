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
import android.widget.ScrollView;
import android.widget.TextView;

import com.innioasis.ipp.Albums;
import com.innioasis.ipp.Artists;
import com.innioasis.ipp.BigCover;
import com.innioasis.ipp.Cover;
import com.innioasis.ipp.CoverCache;
import com.innioasis.ipp.Ipp;
import com.innioasis.ipp.Queue;
import com.innioasis.ipp.Scroll;
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
 * The "Up Next" screen. Row 0 is the track playing right now (marked ▶), then the
 * tracks added via "Add to queue", then the next {@link Queue#LOOKAHEAD} playlist tracks
 * (sequential, or the shuffle plan when shuffle is on — see {@link Queue}).
 *
 * Click-wheel driven, like IppActivity: UP/DOWN move focus, centre plays the focused track
 * right away, long top opens the row's menu, top closes.
 * The view is rebuilt from {@link Queue#upNext()} on every render and on every
 * {@code MY_PLAY_SONG} broadcast, so it follows track changes live.
 *
 * Raw collection types + named nested classes only (d8 constraints — see CLAUDE.md).
 */
public final class IppQueueActivity extends BaseActivity {

    private static final int ACCENT = Color.parseColor("#3CFFDE");

    private List rows;                 // List<Song> — current projection
    private LinearLayout header;       // row 0 — the playing track, pinned above the scroller
    private LinearLayout container;
    private ScrollView scroller;
    private int sel;
    private PlayWatch watch;

    // Per-row views, so a wheel click repaints two rows instead of rebuilding the list. With
    // more than a handful of manually queued tracks the rebuild is what made the screen crawl.
    private View[] rowViews;
    private TextView[] tagViews;       // the marker's colour source (only added for "•"/"▶")
    private TextView[] titleViews;
    private ImageView[] dotViews;      // the drawn mark of a song row, null on the playing one
    private int[] childIndex;          // row -> its position among the scroller's children (-1 = pinned)
    private boolean scrollPending;

    /**
     * Only what will be VISIBLE is built before the first frame; the rest is posted and lands one
     * frame later ({@link Tail}).
     *
     * This screen is opened from the player, and the player's title is SCROLLING while it opens
     * — the marquee is a Handler tick on the very thread that builds this list, so every
     * millisecond spent in {@link #initView} is a millisecond the title cannot move. Frozen on a
     * screen that has not changed yet, it reads as the device having hung, and that is what the
     * user reported: the scroll stops before the queue appears. Twenty-one rows were built for a
     * screen that shows about five.
     *
     * How many that is comes from the SCREEN, not from a constant — see {@link #syncRows()}.
     * A fixed six was one row short of a screenful, and once the tail stopped delaying the window
     * (see {@link #render()}) that missing row became visible: the list appeared with five songs
     * and the rest arrived a moment later, in plain sight. The floor below is what the count may
     * never drop under; a cursor already further down extends the synchronous part instead, or
     * {@link #scrollToSel} would have no row to scroll to.
     */
    private static final int SYNC_ROWS_MIN = 8;

    /**
     * Rows to build before the first frame: as many as the scroller can show, plus one for the row
     * the screen cuts in half and one to spare.
     *
     * It is the same arithmetic {@link #build} does — a row is 1.5x its text size plus its two
     * margins, and the playing row is that doubled — so it follows the theme's text size and the
     * screen without a second number to keep in step. Over-counting is the safe direction: a row
     * built and not shown costs a couple of milliseconds, a row shown and not built is the flash.
     */
    private int syncRows() {
        try {
            android.util.DisplayMetrics m = getResources().getDisplayMetrics();
            int screen = m.heightPixels;
            int bar = (int) getResources().getDimension(R.dimen.status_bar_height);
            int head = px(textSize(0), m) * 2 + 4;   // the pinned playing row: double height
            int step = px(textSize(1), m) + 4;       // every other row, with its margins
            if (step <= 0) return SYNC_ROWS_MIN;
            int fits = (screen - bar - head) / step;
            int n = 1 + fits + 2;
            return n < SYNC_ROWS_MIN ? SYNC_ROWS_MIN : n;
        } catch (Throwable t) {
            return SYNC_ROWS_MIN;
        }
    }

    /** A row's height in pixels, from the size {@link #textSize} hands to {@code setTextSize}. */
    private static int px(float sp, android.util.DisplayMetrics m) {
        return (int) (android.util.TypedValue.applyDimension(
                android.util.TypedValue.COMPLEX_UNIT_SP, sp, m) * 1.5f);
    }

    private boolean tailPending;
    private int tailFrom;
    private Tail tailRun;
    private boolean manualHeaderDone;   // group captions, carried across the two build passes
    private boolean autoHeaderDone;
    private String[] labels;            // one label() per row per render, not one per paint

    /**
     * One dot and one tick per (size, colour). Every unticked row draws the SAME mark, and drawing
     * it per row meant a Bitmap, a Canvas and a Paint each — twenty of them on the path that opens
     * the screen. Dies with the Activity, and a theme switch kills the process anyway (skill
     * {@code ipp-perf-profiling}), so nothing here can go stale.
     */
    private final java.util.HashMap markCache = new java.util.HashMap();

    // Multi-select. The ticked rows carry the very highlight the cursor does — stock draws
    // its multi-selection that way too — and the cursor is told apart by BLINKING, again as stock
    // does it (there from a 500 ms thread per screen; here one posted Runnable, stopped with the
    // screen). Row 0 can never be ticked: the track playing now is not something to remove.
    private static final int BLINK_MS = 500;
    private boolean multi;
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

        // The playing track sits OUTSIDE the scroller: it is what the screen is about, and with
        // twenty rows below it it would otherwise scroll away as soon as the cursor moved down.
        LinearLayout outer = new LinearLayout(this);
        outer.setOrientation(LinearLayout.VERTICAL);

        header = new LinearLayout(this);
        header.setOrientation(LinearLayout.VERTICAL);
        header.setPadding(8, 0, 8, 0);
        outer.addView(header, -1, -2);

        container = new LinearLayout(this);
        container.setOrientation(LinearLayout.VERTICAL);
        container.setPadding(8, 0, 8, 0);

        scroller = new ScrollView(this);
        scroller.addView(container, -1, -2);
        LinearLayout.LayoutParams sp = new LinearLayout.LayoutParams(-1, 0);
        sp.weight = 1.0f;
        outer.addView(scroller, sp);

        root.addView(outer, -1, -1);

        sel = 0;
        render();

        watch = new PlayWatch(this);
        registerReceiver(watch, new IntentFilter("android.intent.action.MY_PLAY_SONG"));
    }

    @Override
    protected void onDestroy() {
        stopBlink();
        cancelTail();
        if (watch != null) {
            try {
                unregisterReceiver(watch);
            } catch (Exception e) {
                // already gone
            }
            watch = null;
        }
        super.onDestroy();
    }

    /**
     * Keep the focused row on the same kind of entry when the track changes under us.
     *
     * A multi-selection does NOT survive it: the ticks are row numbers, and a track change shifts
     * every row up by one — the same ticks would then stand on other songs. Better to drop them
     * than to remove the wrong tracks.
     */
    void onTrackChanged() {
        endMulti();
        render();
    }

    /** The playing row is deliberately bigger: taller and 2pt larger than the rest. */
    private static float textSize(int row) {
        return row == 0 ? 18.0f : 16.0f;
    }

    /**
     * Build the whole list. Called when the CONTENT changes — opening the screen, a track change,
     * a removal — never for a wheel click, which only changes how two rows look ({@link #move}).
     * The manual part of the queue is unbounded, so with a few dozen queued tracks rebuilding
     * every row per click was the whole of the lag.
     */
    void render() {
        // Only the visible part is built here; see syncRows() for why that matters at all.
        rows = Queue.upNext();
        header.removeAllViews();
        container.removeAllViews();
        cancelTail();

        int n = rows.size();
        rowViews = new View[n];
        tagViews = new TextView[n];
        titleViews = new TextView[n];
        dotViews = new ImageView[n];
        labels = new String[n];
        manualHeaderDone = false;
        autoHeaderDone = false;

        if (n == 0) {
            TextView empty = new TextView(this);
            empty.setTextSize(16.0f);
            empty.setPadding(6, 12, 6, 6);
            empty.setText(getString(R.string.ipp_queue_empty));
            ThemeManager.INSTANCE.itemSetTextColor(empty, -1, false);
            container.addView(empty, -1, -2);
            return;
        }
        if (sel >= n) sel = n - 1;
        if (sel < 0) sel = 0;

        childIndex = new int[n];
        // The cursor's own row must exist before scrollToSel can find it, so a cursor that already
        // stands further down (a track change with the list scrolled) extends the synchronous part
        // rather than being left to the tail.
        int sync = Math.max(syncRows(), sel + 2);
        if (sync > n) sync = n;
        build(0, sync);
        if (sync < n) {
            tailFrom = sync;
            tailPending = true;
            if (tailRun == null) tailRun = new Tail(this);
            // The tail may not touch the tree until the window is really on the screen, and a
            // View.post does NOT wait for that. Measured: it lands between the first traversal and
            // the second, and its addView calls then force the whole tree to be measured again
            // (~45 ms) and the first real draw to cover all twenty-odd rows instead of the six that
            // are visible (58..124 ms instead of ~15) — i.e. posting the tail this way made the
            // screen appear LATER, on the one screen that is opened from the player while the
            // marquee is running. Window focus arrives after the first draw has been reported, so
            // that is what the first tail waits for; a later render (a track change) already has
            // the focus and posts straight away.
            if (hasWindowFocus()) header.post(tailRun);
        }
        // The scrollbar is woken by the first layout and stays on screen for about half a second —
        // longer than the tail takes to arrive — so with a short list underneath it the user
        // watched the thumb shrink as the rest of the rows landed. While the list is incomplete
        // the bar would be lying about the length anyway, so it is off until the tail is in.
        // Nothing is lost by that: it is an overlay (no space reserved, no re-layout), and the
        // first wheel click both completes the list and wakes the bar with the right range.
        scroller.setVerticalScrollBarEnabled(!tailPending);
        scrollToSel();
    }

    /** Build rows [from, to) into the header (row 0) and the scroller (the rest). */
    private void build(int from, int to) {
        for (int i = from; i < to; i++) {
            Song s = (Song) rows.get(i);
            boolean playing = (i == 0);
            boolean mine = Queue.isManualRow(i);
            float size = textSize(i);

            // Group captions, each shown only when its group has anything in it: "Up next" over
            // the hand-queued tracks, "Up next from: <list>" over what the playlist itself has
            // left. The second is therefore absent exactly when there is nothing left to play —
            // the last track of the list, or a list of one.
            if (!playing && mine && !manualHeaderDone) {
                container.addView(divider(manualCaption()), dividerParams());
                manualHeaderDone = true;
            } else if (!playing && !mine && !autoHeaderDone) {
                container.addView(divider(getString(R.string.ipp_queue_next_from,
                        new Object[]{Queue.source()})), dividerParams());
                autoHeaderDone = true;
            }

            LinearLayout row = new LinearLayout(this);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setBaselineAligned(false);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setPadding(5, 0, 5, 0);

            // The playing row shows the album thumbnail instead of a marker; if the cover is
            // unavailable it falls back to ▶ so the row is still recognisable.
            Bitmap art = playing ? cover(s) : null;
            TextView tag = new TextView(this);
            if (playing) {
                if (art != null) {
                    ImageView iv = new ImageView(this);
                    iv.setImageBitmap(art);
                    LinearLayout.LayoutParams ip = new LinearLayout.LayoutParams(COVER_PX, COVER_PX);
                    ip.rightMargin = 8;
                    row.addView(iv, ip);
                } else {
                    tag.setTextSize(size);
                    bold(tag);
                    tag.setIncludeFontPadding(false);
                    tag.setGravity(Gravity.CENTER_VERTICAL);
                    tag.setPadding(0, 0, 8, 0);
                    tag.setText("▶");
                    row.addView(tag, -2, -2);
                }
            } else {
                // Every song row carries the same mark now — hand-queued and playlist tracks are
                // told apart by the captions above them, not by the colour of a dot. Drawn, not a
                // glyph: a text shadow is a blur, and a real ring has to be stroked separately.
                ImageView dot = new ImageView(this);
                LinearLayout.LayoutParams dp = new LinearLayout.LayoutParams(-2, -2);
                dp.rightMargin = 8;
                row.addView(dot, dp);
                dotViews[i] = dot;
            }

            TextView title = new TextView(this);
            title.setTextSize(size);
            // Base weight is normal; only the song's own name is bold (see spanned()).
            title.setTypeface(Typeface.MONOSPACE, Typeface.NORMAL);
            title.setIncludeFontPadding(false);
            title.setGravity(Gravity.CENTER_VERTICAL);
            title.setSingleLine(true);
            title.setText(labelAt(i));
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, -1);
            lp.weight = 1.0f;
            row.addView(title, lp);

            rowViews[i] = row;
            tagViews[i] = tag;
            titleViews[i] = title;
            paint(i);

            // Fixed height derived from the text: a theme background bitmap would otherwise
            // stretch the row to its own intrinsic height (the tall blue block on HoloBubble).
            int h = rowHeight(title);
            if (playing) h *= 2;
            LinearLayout.LayoutParams rp = new LinearLayout.LayoutParams(-1, h);
            rp.topMargin = 2;
            rp.bottomMargin = 2;
            if (playing) {
                header.addView(row, rp);
                childIndex[i] = -1;                  // pinned, never scrolled to
            } else {
                childIndex[i] = container.getChildCount();
                container.addView(row, rp);
            }
        }
    }

    /**
     * The rows that were below the screen when it opened, built one frame after the window came
     * up. Also called from every key handler, so a press that somehow beats the posted message
     * finds the whole list there — the tail is a frame away, not a promise.
     */
    void buildTail() {
        if (!tailPending) return;
        tailPending = false;
        if (tailRun != null && header != null) header.removeCallbacks(tailRun);
        if (rows == null || container == null || isFinishing()) return;
        build(tailFrom, rows.size());
        if (scroller != null) scroller.setVerticalScrollBarEnabled(true);
        scrollToSel();
    }

    /**
     * The first tail waits here: the window has been drawn and handed over before focus arrives,
     * so building the rest of the list from this point costs the user nothing he can see.
     */
    @Override
    public void onWindowFocusChanged(boolean has) {
        super.onWindowFocusChanged(has);
        if (has && tailPending && tailRun != null && header != null) header.post(tailRun);
    }

    private void cancelTail() {
        tailPending = false;
        if (tailRun != null && header != null) header.removeCallbacks(tailRun);
    }

    /** Named, never anonymous: d8 crashes dexing anonymous classes here. */
    static final class Tail implements Runnable {
        private final IppQueueActivity a;
        Tail(IppQueueActivity a) { this.a = a; }
        public void run() { a.buildTail(); }
    }

    /** Move the focus: only the two rows whose look changed are repainted. */
    private void move(int old) {
        if (old == sel) return;
        paint(old);
        paint(sel);
        scrollToSel();
    }

    /**
     * The highlighted look of a row: the cursor, and — in multi-select — every ticked row. While
     * the blink is off the cursor draws unselected, which is the whole point of it: the ticks
     * stand still and the cursor flashes, so the two are never confused.
     */
    private void paintFocus(int i) {
        if (rowViews == null || i < 0 || i >= rowViews.length || rowViews[i] == null) return;
        boolean on = highlighted(i);
        boolean playing = (i == 0);
        TextView tag = tagViews[i];
        TextView title = titleViews[i];

        // Only a highlighted row carries the background; the playing one is marked by text colour
        // instead (a theme's selected background can be a big bitmap, so giving it to the playing
        // row as well as the cursor reads as two cursors).
        ThemeManager.INSTANCE.itemSetBackground(rowViews[i], on ? R.drawable.item_setting_sel : 0, on);
        ThemeManager.INSTANCE.itemSetTextColor(tag, on ? ACCENT : -1, on);
        ThemeManager.INSTANCE.itemSetTextColor(title, on ? ACCENT : -1, on);
        // The playing row is tinted the theme way, exactly like the "CD N" dividers: pass
        // selected_text_color through ThemeManager so a theme's own colour wins.
        if (playing && !on) {
            int cd = getResources().getColor(R.color.selected_text_color);
            ThemeManager.INSTANCE.itemSetTextColor(tag, cd, false);
            ThemeManager.INSTANCE.itemSetTextColor(title, cd, false);
        }
        // Redrawn per paint because with no theme its fill comes from the row's OWN text colour,
        // which is what has just changed. tag is coloured above, so it is the right source now.
        if (dotViews[i] != null) {
            dotViews[i].setImageBitmap(marked.contains(Integer.valueOf(i))
                    ? tickMark(textSize(i), tag) : queuedDot(textSize(i), tag));
        }
    }

    /**
     * The cursor is the thing that blinks — a ticked row under it included, or standing on a row
     * that is already ticked would look like standing on nothing. What says "ticked" while the
     * highlight is away is the tick itself, in the marker column.
     */
    private boolean highlighted(int i) {
        if (i == sel) return !multi || blinkOn;
        return marked.contains(Integer.valueOf(i));
    }

    /** Everything about a row that depends on whether it is focused, marquee included. */
    private void paint(int i) {
        if (rowViews == null || i < 0 || i >= rowViews.length || rowViews[i] == null) return;
        paintFocus(i);
        boolean on = (i == sel);
        TextView title = titleViews[i];

        // Only the focused row scrolls its text. The rows outlive the focus change now, so the
        // one that lost it has to be stopped explicitly: the marquee is a self-posting Handler
        // tick inside Ipp's Scroll, which setEllipsize/setSelected do not touch at all.
        String plain = labelAt(i);
        if (on) {
            Scroll.marqueeText(title, plain);
        } else {
            Scroll.stopMarquee(title);
        }
        // AFTER the marquee, never before: starting one goes through TextView.setSingleLine(),
        // which installs a SingleLineTransformationMethod of its own and would throw ours away —
        // which is exactly what made the bold vanish the moment a row took the focus. Setting it
        // re-runs it over the text the view already holds, and it keeps running over whatever
        // the marquee puts there on its next tick.
        title.setTransformationMethod(new BoldTitle(plain, titleLen(plain)));
    }

    /**
     * The mark of a user-queued row: a filled circle in the theme's **menu background** colour —
     * the colour behind the sort / long-press submenu ({@code menuBackgroundColor} in config.json)
     * — ringed with that colour's complement.
     *
     * Why drawn and not a "•" glyph: a TextView can only be given a {@code setShadowLayer}, which
     * is a soft blur and stayed barely visible around a dot this small. A real outline has to be
     * stroked separately from the fill, which needs a Canvas. It also makes the mark legible when
     * {@code menuBackgroundColor} happens to equal the list's own text colour (theme1 sets it to
     * #000000) — the ring still separates it from the plain dots of the projected rows.
     *
     * With no theme selected there is no {@code menuBackgroundColor} at all; then the fill is the
     * complement of the row's text colour, so the mark is still the inverse of its surroundings.
     */
    private Bitmap queuedDot(float sizeSp, TextView colourSource) {
        int fill;
        Integer c = null;
        try {
            c = ThemeManager.INSTANCE.menuBGColor();
        } catch (Throwable t) {
            // malformed theme colour -> treat as absent
        }
        if (c != null) {
            fill = c.intValue() | 0xFF000000;
        } else {
            fill = (colourSource.getCurrentTextColor() ^ 0x00FFFFFF) | 0xFF000000;
        }
        int ring = (fill ^ 0x00FFFFFF) | 0xFF000000;
        int box = markBox(sizeSp);

        // Every row's dot is this same bitmap; see markCache for why that is worth saying once.
        String key = "d" + box + ":" + fill;
        Object hit = markCache.get(key);
        if (hit instanceof Bitmap) return (Bitmap) hit;

        // The dot's own size is the row's "•": same font, same text size, so it is not visually
        // bigger than the glyph it stands for. The BOX it is drawn in is the marker column's, so
        // the dot and the tick take exactly the same room (see markBox).
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

    /**
     * The tick of a ticked row — the second marker of a selection, the first being the
     * highlight. Drawn, like the tick of the cache picker and for the same reason: two strokes on
     * a transparent square are one bitmap and follow the row's colour, where an asset would have
     * to be shipped per theme. Geometry is that dialog's 16px tick scaled to the marker column.
     *
     * Painted in the colour the text beside it has just been given, so it follows both the theme
     * and the focus highlight — the rule every mark in this app follows.
     */
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

    /**
     * The marker column: one square for the dot and the tick alike, so ticking a row cannot shift
     * its title sideways. Derived from the row's text size, so it scales with the row the way the
     * dot always did.
     */
    private int markBox(float sizeSp) {
        int n = Math.round(sizeSp * getResources().getDisplayMetrics().scaledDensity * 0.8f);
        return n < 10 ? 10 : n;
    }

    /**
     * A group caption, in the shape of the "CD N" dividers of an album: small, bold, and coloured
     * through {@code ThemeManager.itemSetTextColor} with {@code selected_text_color} so a theme's
     * own colour wins. Not selectable — the wheel walks songs, and these sit between them.
     */
    private TextView divider(String text) {
        TextView tv = new TextView(this);
        tv.setTextSize(12.0f);
        bold(tv);
        tv.setIncludeFontPadding(false);
        tv.setGravity(Gravity.CENTER_VERTICAL);
        tv.setPadding(5, 0, 5, 0);
        tv.setSingleLine(true);
        tv.setEllipsize(android.text.TextUtils.TruncateAt.END);
        tv.setText(text);
        ThemeManager.INSTANCE.itemSetTextColor(tv, getResources().getColor(R.color.selected_text_color), false);
        return tv;
    }

    private LinearLayout.LayoutParams dividerParams() {
        LinearLayout.LayoutParams p = new LinearLayout.LayoutParams(-1, -2);
        p.topMargin = 6;
        p.bottomMargin = 1;
        return p;
    }

    /** Row height that fits the text, independent of any theme background's intrinsic size. */
    static int rowHeight(TextView tv) {
        return (int) (tv.getTextSize() * 1.5f);
    }

    /**
     * The theme's font. The app theme sets {@code android:typeface="monospace"} and ThemeManager
     * swaps {@code Typeface.MONOSPACE} for the theme's font.ttf (or plain {@code DEFAULT} when the
     * theme carries none), so reading that field is how code-built views follow the theme.
     */
    private static Typeface font() {
        return Typeface.create(Typeface.MONOSPACE, Typeface.BOLD);
    }

    /**
     * Bold text in the theme's font. The TWO-argument form, not {@code Typeface.create}: only
     * this one fakes the weight when the theme's font.ttf has no bold cut, which is what an XML
     * {@code textStyle="bold"} does. With {@code create()} the rows rendered visibly thinner.
     */
    private static void bold(TextView tv) {
        tv.setTypeface(Typeface.MONOSPACE, Typeface.BOLD);
    }

    /**
     * The picture of the playing track — the one Now Playing is showing, not its album's.
     *
     * This row stands for one song, so the same rule the big cover follows applies at
     * 50px: a track with artwork of its own inside an album that has different artwork (a folder
     * of singles, a compilation, a song falling back to {@code folder.jpg}) was drawn with its
     * neighbour's picture, and the player right underneath showed the other one. {@code peekTrack}
     * answers with strictly what is already known for THIS track — it never reads a tag, so it is
     * safe here on the main thread, and it hands back the album's representative only for a track
     * recorded as sharing it, which is a pixel comparison rather than a guess. The album thumbnail
     * remains the fallback for a track nobody has read yet.
     *
     * The 300px result is scaled once per track rather than left to the ImageView: the row is
     * rebuilt on every render (a track change, a removal), and a 300px bitmap in a 50px view is
     * that much filtering per frame. Six times down is more than one bilinear pass can average, so
     * {@code Cover.square} halves its way there — see it for why that is what removes the stair
     * steps on the edges.
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

    /**
     * The caption over the hand-queued rows. It carries the count only while the screen is not
     * showing all of them — "Next in queue (20 of 137)" — so an ordinary queue reads exactly as it
     * did, and a long one says at a glance that there is more behind the twenty rows.
     */
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

    /**
     * The row's label, computed once per row per render. Building a row asked for it and then
     * {@code paint} asked again, and it is not free: a resolved song, the "titles from tags"
     * preference and two {@code unNamed} calls per ask.
     */
    private String labelAt(int i) {
        if (rows == null || i < 0 || i >= rows.size()) return "";
        if (labels != null && i < labels.length && labels[i] != null) return labels[i];
        String s = label((Song) rows.get(i));
        if (labels != null && i < labels.length) labels[i] = s;
        return s;
    }

    /** How much of the label is the song's own name — everything before the separator. */
    private static int titleLen(String plain) {
        if (plain == null) return 0;
        int i = plain.indexOf(SEP);
        return (i < 0) ? plain.length() : i;
    }

    /**
     * Bold title, plain artist — and it STAYS that way while the row scrolls.
     *
     * A span set on the text would not: the marquee re-sets the view's text on every tick (with
     * its own {@code label + gap + label} copy), which drops the styling. A TransformationMethod
     * is the one hook that runs on every setText, so the styling is re-derived from whatever text
     * the marquee has just put there — including both copies of the doubled string, which is why
     * this matches the label rather than a fixed range.
     *
     * {@code StyleSpan} fakes the weight exactly like the two-argument {@code setTypeface} when
     * the theme's font.ttf carries no bold cut.
     */
    static final class BoldTitle implements TransformationMethod {
        private final String plain;
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

    /**
     * Stock stores an unknown tag as {@code Constant.UNKNOWN}, which is "<unknown>" behind
     * four U+FFE6 — a sort-key prefix that keeps unknowns last, stripped for display by
     * {@code Other.unNamed}. Missing it is what drew the "￦￦￦￦" as four struck-through W's.
     */
    private static String unNamed(String s) {
        if (s == null) return "";
        try {
            return Other.INSTANCE.unNamed(s);
        } catch (Throwable t) {
            return s;
        }
    }

    /**
     * Folders puts PATH-ONLY songs into the playlist: {@code FilesActivity} builds every entry as
     * {@code new Song(path)}, so the name is empty and every tag is {@code Constant.UNKNOWN} —
     * which is why a folder's tracks all read alike here. Stock's own Now Playing has the same
     * problem and answers it the same way, by re-reading the song when the name is blank.
     *
     * The library row is tried first ({@code getSongByPathSync} — an indexed query, and Room here
     * allows main-thread queries) and only a file outside the library falls through to reading its
     * tags. Memoised by path: rows are rebuilt on every track change, and a metadata read per row
     * per rebuild is exactly the cost this screen cannot afford.
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

    /**
     * Rows are rebuilt on every render, so their geometry is only known after the next layout
     * pass — scrolling has to be posted, otherwise every getTop() is still 0 and the selection
     * walks off screen.
     */
    private void scrollToSel() {
        if (scroller == null || scrollPending) return;
        scrollPending = true;                    // one scroll per burst of clicks, not one each
        scroller.post(new ScrollTask(this));
    }

    void doScroll() {
        scrollPending = false;
        if (scroller == null || container == null) return;
        // Row 0 is pinned, and the scroller also holds the group captions, so a row's position
        // among the scroller's children is not its position in the list.
        if (childIndex == null || sel < 0 || sel >= childIndex.length) return;
        int idx = childIndex[sel];
        if (idx < 0) {
            scroller.smoothScrollTo(0, 0);
            return;
        }
        if (idx >= container.getChildCount()) return;
        View v = container.getChildAt(idx);
        if (v == null) return;
        int top = v.getTop();
        int bottom = v.getBottom();
        // The caption above a row belongs with it: scrolling to the row alone would leave the
        // group it opens cut off at the top edge.
        if (idx > 0 && container.getChildAt(idx - 1) instanceof TextView) {
            top = container.getChildAt(idx - 1).getTop();
        }
        int scrollY = scroller.getScrollY();
        int h = scroller.getHeight();
        if (top < scrollY) {
            scroller.smoothScrollTo(0, top);
        } else if (bottom > scrollY + h) {
            scroller.smoothScrollTo(0, bottom - h);
        }
    }

    @Override
    public void clockwise() {
        buildTail();                    // a press cannot outrun the tail, but it may not race it
        if (rows == null || sel >= rows.size() - 1) return;
        int old = sel++;
        move(old);
    }

    /** In multi-select the playing row is not merely un-tickable, the cursor never reaches it:
     *  a row the centre button does nothing on has no business being stood on. */
    @Override
    public void antiClockwise() {
        buildTail();
        if (sel <= (multi ? 1 : 0)) return;
        int old = sel--;
        move(old);
    }

    /**
     * Centre — play the focused track now; the pointer then follows it to the playing row.
     * On the playing row itself there is nothing to switch to, so it goes back to Now Playing
     * (this screen is always opened from the player, so finishing returns there).
     *
     * In multi-select the centre button ticks the row instead, exactly as it does in every stock
     * list. Row 0 is not tickable.
     */
    @Override
    public void confirm() {
        buildTail();
        if (rows == null || rows.isEmpty()) return;
        if (multi) {
            if (sel == 0) return;                    // the track playing now cannot be ticked
            Integer k = Integer.valueOf(sel);
            if (!marked.remove(k)) marked.add(k);
            paintFocus(sel);
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
     * Long TOP — the row's menu. {@code longConfirm} is what BaseActivity.dispatchKeyEvent calls
     * for a held top button ("长按 上"); {@code Direction.LTOP} exists in the enum but is dispatched
     * by nothing in this APK, so anything hung off THAT never fires at all.
     *
     * Three menus, one per state of the screen:
     *   - the PLAYING row — nothing to remove and nothing to tick, so: its artist, its album,
     *       the screen it was started from ("Open source" — the one thing not on this screen),
     *       and the playlists;
     *   - any other row — Remove, MultiSelect, its artist, its album, and the playlists;
     *   - in multi-select — only what several tracks at once can mean: Remove and a playlist.
     *
     * Built per press and dispatched BY STRING, never by index: the playlists are appended by
     * stock's own {@code addPlaylistsToOptions} and their number is whatever the user has made it.
     * There is no "clear the whole queue" here: it hung off LTOP, so it had never once run, and
     * the queue now goes with the list it was queued into anyway.
     */
    @Override
    public void longConfirm() {
        buildTail();
        if (rows == null || rows.isEmpty()) return;
        ArrayList l = new ArrayList();
        if (multi) {
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
        // The theme, not a flag: SubMenuDialog's trailing int is the dialog style, and 0 gives a
        // window sized for about twice the rows it has.
        menuDlg = new SubMenuDialog(getActivity(), l, new QMenu(this), R.style.Dialog_Common);
        menuDlg.addPlaylistsToOptions();
        menuDlg.show();
    }

    /**
     * One menu pick. Returns what {@code SubMenuDialog.Callback.select} means: true = close the
     * menu, false = leave it up (the "Open artist" submenu dismisses it itself, so the two dialogs
     * are never both waiting for a press).
     */
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
            // The queue screen is only ever opened from the player, so leaving it behind is right:
            // the user asked to go back to where the track came from.
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
            // Several artists on one tag — one entry each, in a menu of their own.
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

    // ------------------------------------------------------------------ what the menu does

    /**
     * Remove — the ticked rows, or the row under the cursor when nothing is ticked. No confirm
     * dialog: picking the entry out of a menu is already the deliberate act.
     *
     * Descending order matters. Everything {@link Queue} keeps is a POSITION: removing a
     * queued row takes its guest out of the playlist and shifts every index behind it down, and
     * the row → playlist-index table of the last projection is not shifted with them. Highest row
     * first means every projected row (they all stand below the queued ones) is dealt with before
     * the first shift happens, and the queued rows above are unaffected by the ones below them.
     */
    private void removePicked() {
        ArrayList todo = new ArrayList();
        if (multi && !marked.isEmpty()) {
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

    /** Add — the ticked rows, or the row under the cursor. Silent, like every other "Add to
     *  playlist" in the app; the write is off the main thread because a tick list can be long. */
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
        if (multi && !marked.isEmpty()) {
            java.util.Iterator it = marked.iterator();
            while (it.hasNext()) out.add(it.next());
            java.util.Collections.sort(out);
            return out;
        }
        if (sel >= 0 && rows != null && sel < rows.size()) out.add(Integer.valueOf(sel));
        return out;
    }

    /** "Open album" — the album this song sits in, landing on the song (the same machinery "Open album" uses elsewhere). */
    private void openAlbum() {
        Song s = songAt(sel);
        if (s == null) return;
        Albums.openAlbumOfSong(this, s);
        finish();                                  // same rule as "Open source": the player stays
    }

    /** "Open artist" — the artist's album list, exactly what picking them in Artists opens. */
    private void openArtist(String name) {
        if (name == null || name.length() == 0) return;
        Intent i = new Intent(this, com.innioasis.music.AlbumsActivity.class);
        i.putExtra("ipp_artist", name);
        startActivity(i);
        finish();
    }

    /**
     * The artists of a row, or null when there is nothing to open. With multi-artist splitting on
     * this is the same split the Artists list is built with ({@link Artists#parts}, exceptions
     * file included), so every entry is a row that really exists there; with it off the tag is one
     * artist, which is what the list shows then. Either way the string IS the key the artist's
     * songs are looked up by.
     */
    private List artistsOf(int row) {
        return Artists.of(songAt(row));
    }

    /** The song of a row, with the tags a Folders-built entry does not carry (see resolved). */
    private Song songAt(int row) {
        if (rows == null || row < 0 || row >= rows.size()) return null;
        Object o = rows.get(row);
        return (o instanceof Song) ? resolved((Song) o) : null;
    }

    // ------------------------------------------------------------------ multi-select

    private void startMulti() {
        if (multi) return;
        multi = true;
        marked.clear();
        // The row the menu was raised on is ticked straight away: it is the row the user was
        // pointing at when they asked for a selection, so making them tick it again is a press
        // for nothing.
        if (sel > 0) marked.add(Integer.valueOf(sel));
        blinkOn = false;
        blink = new Blink(this);
        if (container != null) container.postDelayed(blink, BLINK_MS);
        paintFocus(sel);
    }

    /** Leave multi-select: the ticks go, the blink stops, the cursor is lit again. */
    private void endMulti() {
        if (!multi) return;
        multi = false;
        marked.clear();
        stopBlink();
    }

    private void stopBlink() {
        blinkOn = true;
        if (blink != null) {
            if (container != null) container.removeCallbacks(blink);
            blink = null;
        }
    }

    void blinkTick() {
        if (!multi || blink == null) return;
        blinkOn = !blinkOn;
        paintFocus(sel);
        if (container != null) container.postDelayed(blink, BLINK_MS);
    }

    /** Repaint every row's focus state — after the ticks have gone, they all changed. */
    private void repaintAll() {
        if (rowViews == null) return;
        for (int i = 0; i < rowViews.length; i++) paintFocus(i);
    }

    @Override
    public void direction(BaseActivity.Direction d) {
        if (d == BaseActivity.Direction.TOP) {
            // The top button closes the innermost thing on screen, everywhere in this app: in
            // multi-select that is the selection, not the screen.
            if (multi) {
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

    /** Posted so the scroll runs after the rebuilt rows have been laid out (see scrollToSel). */
    private static final class ScrollTask implements Runnable {
        private final IppQueueActivity a;

        ScrollTask(IppQueueActivity a) {
            this.a = a;
        }

        @Override
        public void run() {
            a.doScroll();
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

    /** The row's long-press menu (named, never anonymous — d8 crashes on those here). */
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

    /** The multi-select blink of the cursor row — stock does this from a thread per screen. */
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

    /**
     * "Add to Playlist N", off the main thread the way every stock screen does it. Room here
     * allows main-thread queries, but a tick list can be long and this is a write per song.
     */
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
                // a playlist that could not be written is not worth taking the screen down for
            }
        }
    }
}
