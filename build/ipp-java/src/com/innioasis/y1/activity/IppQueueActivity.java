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
import com.innioasis.ipp.Loop;
import com.innioasis.ipp.Artists;
import com.innioasis.ipp.BigCover;
import com.innioasis.ipp.Cover;
import com.innioasis.ipp.CoverCache;
import com.innioasis.ipp.Ipp;
import com.innioasis.ipp.Queue;
import com.innioasis.ipp.Scroll;
import com.innioasis.ipp.Theme;
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
 * playlist has left ({@link Queue#upNext()}). Centre plays a row, long top opens its menu, top
 * closes. Rebuilt on every {@code MY_PLAY_SONG}, so it follows track changes live.
 */
public final class IppQueueActivity extends BaseActivity {

    private static final int ACCENT = Color.parseColor("#3CFFDE");

    private List rows;                 // List<Song> — current projection
    private LinearLayout header;       // row 0 — the playing track, pinned above the scroller
    private LinearLayout container;
    private ScrollView scroller;
    private int sel;
    private PlayWatch watch;

    // per-row views: a wheel click repaints two rows instead of rebuilding the list
    private View[] rowViews;
    private TextView[] tagViews;       // the marker's colour source (only added for "•"/"▶")
    private TextView[] titleViews;
    private TextView[] subViews;       // the artist line, only on the playing row
    private ImageView[] dotViews;      // the drawn mark of a song row, null on the playing one
    private int[] childIndex;          // row -> its position among the scroller's children (-1 = pinned)
    private boolean scrollPending;

    /**
     * Only the VISIBLE rows are built before the first frame, the rest a frame later
     * ({@link Tail}): the player's marquee freezes while this screen builds, which reads as a hang.
     * How many is the screen's ({@link #syncRows()}); this is the floor.
     */
    private static final int SYNC_ROWS_MIN = 8;

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

    /**
     * Rows to build before the first frame: what the scroller shows plus two, by {@link #build}'s
     * own arithmetic. Over-counting is the safe side.
     */
    private int syncRows() {
        try {
            android.util.DisplayMetrics m = getResources().getDisplayMetrics();
            int screen = m.heightPixels;
            int bar = (int) getResources().getDimension(R.dimen.status_bar_height);
            // the pinned block: two captions and the playing row
            int cap = px(CAPTION_SP, m) + CAPTION_PAD * 2 + RULE_H * 2;
            int play = px(PLAY_NAME_SP, m) + px(PLAY_SUB_SP, m);
            if (play < COVER_PX) play = COVER_PX;
            int head = cap * 2 + play;
            int step = px(textSize(1), m) + HAIR_H;
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

    // The pinned caption: the group the top of the list belongs to, worked out from the in-list
    // captions. The first group's caption is only ever here.
    private LinearLayout pinned;
    private TextView pinnedText;
    private String pinnedShown;
    private String pinnedFirst;
    private final ArrayList capViews = new ArrayList();
    private final ArrayList capLabels = new ArrayList();
    private View lastHair;              // the hairline of the last row added, if it still has one
    private int playBase;               // the playing row without the remainder stretch() gives it
    private int playExtra;
    private String[] labels;            // one label() per row per render, not one per paint

    /** One dot and one tick bitmap per (size, colour), not per row. */
    private final java.util.HashMap markCache = new java.util.HashMap();

    // Multi-select, as stock draws it: ticked rows carry the highlight, the cursor BLINKS. Row 0
    // is never ticked.
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

        // the playing track OUTSIDE the scroller, so it never scrolls away
        LinearLayout outer = new LinearLayout(this);
        outer.setOrientation(LinearLayout.VERTICAL);

        // no side padding, or the wallpaper shows as a stripe down both edges
        header = new LinearLayout(this);
        header.setOrientation(LinearLayout.VERTICAL);
        outer.addView(header, -1, -2);

        pinnedText = captionView("");
        pinned = band(pinnedText, -2, IppActivity.RULE_ALPHA, RULE_H, IppActivity.bandAlpha());
        pinned.setVisibility(View.GONE);
        outer.addView(pinned, -1, -2);

        container = new LinearLayout(this);
        container.setOrientation(LinearLayout.VERTICAL);

        scroller = new ScrollView(this);
        scroller.addView(container, -1, -2);
        LinearLayout.LayoutParams sp = new LinearLayout.LayoutParams(-1, 0);
        sp.weight = 1.0f;
        outer.addView(scroller, sp);

        root.addView(outer, -1, -1);

        // on the tree: setOnScrollChangeListener is API 23
        Pin pin = new Pin(this);
        scroller.getViewTreeObserver().addOnScrollChangedListener(pin);
        scroller.getViewTreeObserver().addOnPreDrawListener(pin);

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
        cancelTail();
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

    /** Build the list when its CONTENT changes — never for a wheel click ({@link #move}). */
    void render() {
        rows = Queue.upNext();
        header.removeAllViews();
        container.removeAllViews();
        cancelTail();

        int n = rows.size();
        rowViews = new View[n];
        tagViews = new TextView[n];
        titleViews = new TextView[n];
        subViews = new TextView[n];
        dotViews = new ImageView[n];
        labels = new String[n];
        manualHeaderDone = false;
        autoHeaderDone = false;
        capViews.clear();
        capLabels.clear();
        pinnedFirst = null;
        lastHair = null;
        playBase = 0;
        playExtra = 0;
        pinnedShown = null;
        if (pinned != null) pinned.setVisibility(View.GONE);

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
        // the cursor's row must exist for scrollToSel
        int sync = Math.max(syncRows(), sel + 2);
        if (sync > n) sync = n;
        build(0, sync);
        if (sync < n) {
            tailFrom = sync;
            tailPending = true;
            if (tailRun == null) tailRun = new Tail(this);
            // The tail waits for window FOCUS (onWindowFocusChanged): a View.post lands before the
            // first draw and drags every row into it, so the screen appeared later.
            if (hasWindowFocus()) header.post(tailRun);
        }
        // the scrollbar would shrink before the user's eyes as the tail lands
        scroller.setVerticalScrollBarEnabled(!tailPending);
        scrollToSel();
        repin();
    }

    /** Build rows [from, to) into the header (row 0) and the scroller (the rest). */
    private void build(int from, int to) {
        for (int i = from; i < to; i++) {
            Song s = (Song) rows.get(i);
            boolean playing = (i == 0);
            boolean mine = Queue.isManualRow(i);
            float size = textSize(i);

            // a group's caption only when the group has anything in it
            if (!playing && mine && !manualHeaderDone) {
                caption(manualCaption());
                manualHeaderDone = true;
            } else if (!playing && !mine && !autoHeaderDone) {
                caption(getString(R.string.ipp_queue_next_from,
                        new Object[]{Queue.source()}));
                autoHeaderDone = true;
            }

            LinearLayout row = new LinearLayout(this);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setBaselineAligned(false);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setPadding(5, 0, 5, 0);

            // the playing row: its cover, else ▶
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
                // a drawn mark, not a glyph: its ring is stroked, a text shadow would blur
                ImageView dot = new ImageView(this);
                LinearLayout.LayoutParams dp = new LinearLayout.LayoutParams(-2, -2);
                dp.rightMargin = 8;
                row.addView(dot, dp);
                dotViews[i] = dot;
            }

            TextView title = new TextView(this);
            title.setTextSize(playing ? PLAY_NAME_SP : size);
            // only the song's own name is bold (spanned())
            title.setTypeface(Typeface.MONOSPACE, Typeface.NORMAL);
            title.setIncludeFontPadding(false);
            title.setGravity(Gravity.CENTER_VERTICAL);
            title.setSingleLine(true);

            TextView sub = null;
            if (playing) {
                // two lines: the name, bold as a whole, and the artist under it
                title.setText(nameAt(i));
                bold(title);

                sub = new TextView(this);
                sub.setTextSize(PLAY_SUB_SP);
                sub.setTypeface(Typeface.MONOSPACE, Typeface.NORMAL);
                sub.setIncludeFontPadding(false);
                sub.setGravity(Gravity.CENTER_VERTICAL);
                sub.setSingleLine(true);
                sub.setEllipsize(android.text.TextUtils.TruncateAt.END);
                sub.setText(artistAt(i));

                LinearLayout stack = new LinearLayout(this);
                stack.setOrientation(LinearLayout.VERTICAL);
                stack.setGravity(Gravity.CENTER_VERTICAL);
                stack.addView(title, new LinearLayout.LayoutParams(-1, -2));
                stack.addView(sub, new LinearLayout.LayoutParams(-1, -2));
                LinearLayout.LayoutParams stp = new LinearLayout.LayoutParams(0, -2);
                stp.weight = 1.0f;
                row.addView(stack, stp);
            } else {
                title.setText(labelAt(i));
                LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, -1);
                lp.weight = 1.0f;
                row.addView(title, lp);
            }

            rowViews[i] = row;
            tagViews[i] = tag;
            titleViews[i] = title;
            subViews[i] = sub;
            paint(i);

            // a FIXED height: a theme bitmap would stretch the row
            int h = rowHeight(title);
            if (playing) {
                h = Math.max(h + rowHeight(sub), COVER_PX);
                playBase = h;                        // stretch() adds to this
            }
            if (playing) {
                // captioned with the main menu's own words (main_now)
                header.addView(divider(getString(R.string.main_now)), dividerParams());
                // the wash without rules: the caption above already carries one
                header.addView(band(row, h, 0, 0, playAlpha()),
                        new LinearLayout.LayoutParams(-1, -2));
                childIndex[i] = -1;                  // pinned, never scrolled to
            } else {
                // no margins (a gap shows wallpaper): the hairline is inside the box
                childIndex[i] = container.getChildCount();
                container.addView(rowBox(row, h), new LinearLayout.LayoutParams(-1, -2));
            }
        }
    }

    /** The rows below the screen, a frame later. Also from every key handler, in case one wins. */
    void buildTail() {
        if (!tailPending) return;
        tailPending = false;
        if (tailRun != null && header != null) header.removeCallbacks(tailRun);
        if (rows == null || container == null || isFinishing()) return;
        build(tailFrom, rows.size());
        if (scroller != null) scroller.setVerticalScrollBarEnabled(true);
        scrollToSel();
        repin();
    }

    /** The first tail waits for focus, which arrives after the first draw. */
    @Override
    public void onWindowFocusChanged(boolean has) {
        super.onWindowFocusChanged(has);
        if (has && tailPending && tailRun != null && header != null) header.post(tailRun);
    }

    private void cancelTail() {
        tailPending = false;
        if (tailRun != null && header != null) header.removeCallbacks(tailRun);
    }

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

    /** The highlight: the cursor, and every ticked row; blinked off, the cursor draws unselected. */
    private void paintFocus(int i) {
        if (rowViews == null || i < 0 || i >= rowViews.length || rowViews[i] == null) return;
        boolean on = highlighted(i);
        boolean playing = (i == 0);
        TextView tag = tagViews[i];
        TextView title = titleViews[i];

        // the playing row is marked by colour, not background: that would read as two cursors
        ThemeManager.INSTANCE.itemSetBackground(rowViews[i], on ? R.drawable.item_setting_sel : 0, on);
        TextView sub = subViews[i];
        ThemeManager.INSTANCE.itemSetTextColor(tag, on ? ACCENT : -1, on);
        ThemeManager.INSTANCE.itemSetTextColor(title, on ? ACCENT : -1, on);
        if (sub != null) ThemeManager.INSTANCE.itemSetTextColor(sub, on ? ACCENT : -1, on);
        // through ThemeManager, so a theme's own colour wins
        if (playing && !on) {
            int cd = getResources().getColor(R.color.selected_text_color);
            ThemeManager.INSTANCE.itemSetTextColor(tag, cd, false);
            ThemeManager.INSTANCE.itemSetTextColor(title, cd, false);
            if (sub != null) ThemeManager.INSTANCE.itemSetTextColor(sub, cd, false);
        }
        // per paint: its fill follows the text colour just set on tag
        if (dotViews[i] != null) {
            dotViews[i].setImageBitmap(marked.contains(Integer.valueOf(i))
                    ? tickMark(textSize(i), tag) : queuedDot(textSize(i), tag));
        }
    }

    /** The cursor blinks even over a ticked row; the tick mark says "ticked" meanwhile. */
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

        // Only the focused row scrolls; the one that lost focus is stopped explicitly (Scroll's
        // marquee is a Handler tick). The playing row scrolls its name alone.
        String plain = (i == 0) ? nameAt(i) : labelAt(i);
        if (on) {
            Scroll.marqueeText(title, plain);
        } else {
            Scroll.stopMarquee(title);
        }
        if (i == 0) return;                      // bold as a whole, no span
        // AFTER the marquee: its setSingleLine() installs its own transformation over ours
        title.setTransformationMethod(new BoldTitle(plain, titleLen(plain)));
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

    /** A group caption: not selectable — the wheel walks songs. */
    private View divider(String text) {
        return band(captionView(text), -2, IppActivity.RULE_ALPHA, RULE_H, IppActivity.bandAlpha());
    }

    /** A caption into the list — but the FIRST only onto the pinned bar, or it shows twice. */
    private void caption(String text) {
        if (pinnedFirst == null) {
            pinnedFirst = text;
            setPinned(text);
            return;
        }
        dropHair();                              // the caption's rule draws this boundary
        View box = divider(text);
        capViews.add(box);
        capLabels.add(text);
        container.addView(box, dividerParams());
    }

    /**
     * The pinned bar names the group at the top of the list: the last caption gone above the edge.
     * From a scroll listener, since keys are not the only thing that moves the list.
     */
    void repin() {
        try {
            if (pinned == null || scroller == null) return;
            if (pinnedFirst == null) {
                if (pinned.getVisibility() != View.GONE) pinned.setVisibility(View.GONE);
                return;
            }
            int y = scroller.getScrollY();
            String label = pinnedFirst;
            for (int i = 0; i < capViews.size(); i++) {
                View v = (View) capViews.get(i);
                // not laid out yet: its top reads 0, "at the very top"
                if (v.getHeight() <= 0) break;
                // its BOTTOM edge: while on screen it is the heading itself
                if (v.getTop() + v.getHeight() - y > 0) break;
                label = (String) capLabels.get(i);
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
            if (scroller == null || rowViews == null || rowViews.length < 2) return false;
            int avail = scroller.getHeight() + playExtra;
            if (avail <= 0) return false;

            int natural = px(textSize(1), getResources().getDisplayMetrics());
            int fits = avail / (natural + HAIR_H);
            if (fits < 1) return false;
            int step = avail / fits;                  // at least the natural one, never less
            int rem = avail - fits * step;            // 0 .. fits-1
            int rowH = step - HAIR_H;

            boolean changed = false;
            for (int i = 1; i < rowViews.length; i++) {
                if (setHeight(rowViews[i], rowH)) changed = true;
            }
            if (playBase > 0 && setHeight(rowViews[0], playBase + rem)) {
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

    /** Every scroll frame and every layout: the captions' positions settle only after layout. */
    static final class Pin implements android.view.ViewTreeObserver.OnScrollChangedListener,
            android.view.ViewTreeObserver.OnPreDrawListener {
        private final IppQueueActivity a;

        Pin(IppQueueActivity a) {
            this.a = a;
        }

        public void onScrollChanged() {
            a.repin();
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
        tv.setPadding(5, CAPTION_PAD, 5, CAPTION_PAD);
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

    /** A song row with a hairline on its BOTTOM edge only: one line per boundary. */
    private LinearLayout rowBox(View row, int h) {
        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        box.addView(row, new LinearLayout.LayoutParams(-1, h));
        View hair = rule(itemRgb(), HAIR_ALPHA);
        box.addView(hair, new LinearLayout.LayoutParams(-1, HAIR_H));
        lastHair = hair;
        return box;
    }

    /** Take the last row's hairline away — something with a rule of its own follows it. */
    private void dropHair() {
        if (lastHair != null) lastHair.setVisibility(View.GONE);
        lastHair = null;
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

    /**
     * Scroll in the SAME frame the highlight moved — posted, one frame shows no highlight at all.
     * Posted only when the rows are not laid out yet.
     */
    private void scrollToSel() {
        if (scroller == null) return;
        if (!doScroll()) postScroll();
    }

    private void postScroll() {
        if (scrollPending) return;
        scrollPending = true;
        scroller.post(new ScrollTask(this));
    }

    /** False when the rows are not laid out yet and there is nothing to measure a scroll by. */
    boolean doScroll() {
        scrollPending = false;
        if (scroller == null || container == null) return false;
        // row 0 is pinned and captions sit between rows: childIndex maps the two
        if (childIndex == null || sel < 0 || sel >= childIndex.length) return false;
        int idx = childIndex[sel];
        if (idx < 0) {
            glide(0);
            return true;
        }
        if (idx >= container.getChildCount()) return false;
        View v = container.getChildAt(idx);
        if (v == null) return false;
        if (v.getHeight() <= 0) return false;    // not laid out: its edges read 0
        int top = v.getTop();
        int bottom = v.getBottom();
        // the caption above a row comes into view with it
        if (idx > 0 && container.getChildAt(idx - 1) instanceof TextView) {
            top = container.getChildAt(idx - 1).getTop();
        }
        int scrollY = scroller.getScrollY();
        int h = scroller.getHeight();
        if (top < scrollY) {
            glide(top);
        } else if (bottom > scrollY + h) {
            glide(bottom - h);
        }
        return true;
    }

    /** Move the list to {@code y} at once, never animated (skill {@code wip-scroll-animation}). */
    private void glide(int y) {
        int max = container.getHeight() - scroller.getHeight();
        if (max < 0) max = 0;
        if (y < 0) y = 0;
        if (y > max) y = max;
        scroller.scrollTo(0, y);
    }

    @Override
    public void clockwise() {
        buildTail();
        if (rows == null) return;
        int old = sel;
        if (sel >= rows.size() - 1) {
            if (!Loop.wrap()) return;
            sel = multi ? 1 : 0;        // loop scrolling: round to the top
            if (sel >= rows.size() || sel == old) { sel = old; return; }
        } else {
            sel++;
        }
        move(old);
    }

    /** In multi-select the cursor never reaches the playing row. */
    @Override
    public void antiClockwise() {
        buildTail();
        if (rows == null) return;
        int old = sel;
        if (sel <= (multi ? 1 : 0)) {
            if (rows.size() - 1 <= sel || !Loop.wrap()) return;
            sel = rows.size() - 1;      // loop scrolling: round to the bottom
        } else {
            sel--;
        }
        move(old);
    }

    /**
     * Centre plays the row now; on the playing row it goes back to Now Playing. In multi-select
     * it ticks the row instead.
     */
    @Override
    public void confirm() {
        buildTail();
        if (rows == null || rows.isEmpty()) return;
        if (multi) {
            if (sel == 0) return;
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
     * Long TOP: the row's menu ({@code Direction.LTOP} is dispatched by nothing in this APK). Per
     * state: the playing row, another row, or multi-select. Dispatched BY STRING: the playlists
     * appended after ours vary in number.
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
        if (multi && !marked.isEmpty()) {
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
        if (multi) return;
        multi = true;
        marked.clear();
        // the row the menu was raised on starts ticked
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
            // the innermost thing open: the selection, then the screen
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

    private Retheme retheme;

    /**
     * The theme's row picture arrived: a wash may want another alpha. {@link #render} repaints all
     * but the PINNED caption, built once in {@link #initView}.
     */
    private static final class Retheme implements Runnable {
        private final IppQueueActivity a;
        Retheme(IppQueueActivity a) { this.a = a; }
        public void run() {
            if (a.isFinishing()) return;
            if (a.pinned != null) a.pinned.setBackgroundColor(a.washRgb() | IppActivity.bandAlpha());
            a.render();
        }
    }

    /** The scroll, once the rebuilt rows are laid out (see scrollToSel). */
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
