package com.innioasis.y1.activity;

import android.graphics.Color;
import android.graphics.Typeface;
import android.media.MediaMetadataRetriever;
import android.os.SystemClock;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.innioasis.ipp.AlbumArtist;
import com.innioasis.ipp.Anim;
import com.innioasis.ipp.AlbumArtists;
import com.innioasis.ipp.Feat;
import com.innioasis.ipp.Albums;
import com.innioasis.ipp.Alpha;
import com.innioasis.ipp.Art;
import com.innioasis.ipp.Artists;
import com.innioasis.ipp.Bar;
import com.innioasis.ipp.Backup;
import com.innioasis.ipp.BigCover;
import com.innioasis.ipp.CenterHold;
import com.innioasis.ipp.Cover;
import com.innioasis.ipp.CoverCache;
import com.innioasis.ipp.Diag;
import com.innioasis.ipp.DiscCache;
import com.innioasis.ipp.Fav;
import com.innioasis.ipp.Follow;
import com.innioasis.ipp.Force;
import com.innioasis.ipp.GenreInfo;
import com.innioasis.ipp.GenreSplit;
import com.innioasis.ipp.Help;
import com.innioasis.ipp.HelpDialog;
import com.innioasis.ipp.Ipp;
import com.innioasis.ipp.Keys;
import com.innioasis.ipp.Loading;
import com.innioasis.ipp.Loop;
import com.innioasis.ipp.MainMenu;
import com.innioasis.ipp.MenuStyle;
import com.innioasis.ipp.Meta;
import com.innioasis.ipp.Flow;
import com.innioasis.ipp.Pick;
import com.innioasis.ipp.PickDialog;
import com.innioasis.ipp.Prefs;
import com.innioasis.ipp.Saver;
import com.innioasis.ipp.Theme;
import com.innioasis.ipp.Tint;
import com.innioasis.ipp.TopBar;
import com.innioasis.ipp.TrackCache;
import com.innioasis.ipp.Wheel;
import com.innioasis.ipp.YearCache;
import com.innioasis.music.util.Other;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.base.BaseActivity;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.database.Y1Repository;
import com.innioasis.y1.databinding.ActivityAboutBinding;
import com.innioasis.y1.theme.ThemeManager;
import com.innioasis.y1.utils.DialogUtil;
import com.innioasis.y1.utils.LoadingDialog;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/**
 * The better-Y settings screen (reuses ActivityAboutBinding): the groups first, the centre button
 * opens one, the top button goes back. A declarative model ({@link #buildItems()}): adding a row
 * is one line in {@link #registry()} plus its line in the help asset; no fixed indices anywhere.
 */
public final class IppActivity extends BaseActivity {

    private static final int HEADER = 0;   // a group
    private static final int TOGGLE = 1;   // On/Off
    private static final int CHOICE = 2;   // cycles through words from the asset
    private static final int ACTION = 3;   // runs an action on confirm
    // like CHOICE, but over the numbers in choices[], shown as they are
    private static final int NUMBER = 4;
    private static final int SUB = 5;      // a section: a row that opens rows of its own

    private static final int ACCENT = Color.parseColor("#3CFFDE");

    /**
     * A group caption's rules and band, as alpha over the theme's colours — shared with the queue
     * screen and {@code Blue.band}, so they cannot drift apart.
     */
    public static final int RULE_ALPHA = 0x59000000;
    public static final int BAND_ALPHA = 0x59000000;

    /** Weaker over the WALLPAPER ({@link Theme#rowsPainted} false), where it reads as a stain. */
    public static final int BAND_ALPHA_BARE = 0x2E000000;

    public static int bandAlpha() {
        return Theme.rowsPainted() ? BAND_ALPHA : BAND_ALPHA_BARE;
    }

    private static final int HAIR_H = 1;
    private static final int HAIR_ALPHA = 0x1F000000;

    /**
     * One menu entry. Every word comes from the help asset ({@link #buildItems()}), never from
     * {@code strings.xml} — a second copy goes stale. A row the asset misses shows its KEY.
     */
    private static final class Item {
        final int type;
        final String key;      // TOGGLE/CHOICE: pref key; ACTION: action id; HEADER: group name
        final int count;       // CHOICE/NUMBER: how many values the row runs over
        final int[] choices;   // NUMBER: the values themselves (a CHOICE's are words, so asset-only)

        String label;          // from the asset; null shows the key
        String[] values;       // CHOICE: from the asset; null shows the index
        String showIf;         // if non-null, row shown only while that pref is on
        String parent;         // the SUB row it stands in; null stands in its group
        boolean wheel;         // CHOICE: opened and turned like a NUMBER, its words for values
        boolean indent;        // drawn in from its section's other rows, under the row it hangs on

        // No default here: it lives once, in Prefs.DEFAULTS, read by this screen and the feature.
        Item(int type, String key, int count, int[] choices, String showIf) {
            this.type = type;
            this.key = key;
            this.count = count;
            this.choices = choices;
            this.showIf = showIf;
        }

        Item in(String section) {
            parent = section;
            return this;
        }

        Item wheel() {
            wheel = true;
            return this;
        }

        Item indent() {
            indent = true;
            return this;
        }
    }

    private List items;                 // List<Item>
    private int[] groupOf;              // per item: index of the header or SUB row it stands under
    private int sel;                    // index into items of the focused selectable+visible row

    private int group = -1;             // the open header or SUB row; -1 = the list of groups
    private int[] cats;                 // index into items of each header, in order
    private int catSel;                 // index into cats

    // Two lists, one shown at a time: the groups, and the rows of the open group. The cursor of
    // the one shown is the screen's mark, which the travelling bar reads.
    private RecyclerView catList;
    private RecyclerView rowList;
    private LinearLayoutManager catLm;
    private LinearLayoutManager rowLm;
    private CatAdapter catAdapter;
    private RowAdapter rowAdapter;
    private int[] shown = new int[0];   // the open group's visible rows, as indices into items

    // NUMBER edit mode: the wheel picks the value, which blinks while it does.
    private static final long BLINK_MS = 400;
    private boolean editing;
    private int editIndex;              // index into items of the row being edited
    private int editVal;                // candidate index into that item's choices[]
    private Blink blink;

    /**
     * The menu: order, grouping, names and {@code showIf} from {@code assets/help/en.txt}
     * (English alone, so a translator cannot regroup), behaviour from {@link #registry()}. The
     * asset can never LOSE a setting: a row it forgets is appended, a key it invents is skipped.
     * A row with {@code showIf} is that row's SUB-ITEM.
     */
    private List buildItems() {
        List reg = registry();
        List rows = Help.rows(this);
        if (rows.isEmpty()) return reg;

        List out = new ArrayList();
        HashSet used = new HashSet();
        for (int i = 0; i < rows.size(); i++) {
            Help.Row r = (Help.Row) rows.get(i);
            Item it = find(reg, r.key);
            if (it == null || used.contains(r.key)) continue;
            used.add(r.key);
            it.label = r.label;
            it.showIf = r.showIf;
            it.parent = r.parent;
            if ((it.type == CHOICE || it.type == ACTION) && r.values != null && r.values.length == it.count) {
                it.values = r.values;
            }
            out.add(it);
        }
        // a typo costs one row's place, never the row
        for (int i = 0; i < reg.size(); i++) {
            Item it = (Item) reg.get(i);
            if (!used.contains(it.key)) out.add(it);
        }
        return out;
    }

    private static Item find(List reg, String key) {
        if (key == null) return null;
        for (int i = 0; i < reg.size(); i++) {
            Item it = (Item) reg.get(i);
            if (key.equals(it.key)) return it;
        }
        return null;
    }

    /**
     * Every row the app can draw, with its kind and key, in the fallback order. Grouped by WHERE
     * the effect is seen, not by what a row technically is.
     */
    private List registry() {
        List l = new ArrayList();

        l.add(new Item(HEADER, "tools", 0, null, null));
        l.add(new Item(ACTION, "cache", 0, null, null));
        l.add(new Item(ACTION, "scan", 0, null, null));
        l.add(new Item(ACTION, "backup", 0, null, null));           // Backup
        l.add(new Item(ACTION, "m3u_import", 0, null, null));       // M3u
        l.add(new Item(ACTION, "log", 0, null, null));              // Diag

        l.add(new Item(HEADER, "player", 0, null, null));
        l.add(new Item(ACTION, IppNowActivity.KEY_STYLE, 0, null, null));   // the player's colours and tilt
        l.add(new Item(CHOICE, "top_hold", 3, null, null));
        l.add(new Item(CHOICE, "book_top_hold", 2, null, null));
        l.add(new Item(TOGGLE, Feat.KEY_FIRST, 0, null, null));
        l.add(new Item(TOGGLE, Feat.KEY_FIRST_FEAT, 0, null, Feat.KEY_FIRST));
        l.add(new Item(TOGGLE, Feat.KEY, 0, null, null));
        l.add(new Item(TOGGLE, Feat.KEY_VARIOUS, 0, null, Feat.KEY));
        l.add(new Item(TOGGLE, Feat.KEY_FEAT, 0, null, Feat.KEY));
        l.add(new Item(CHOICE, Ipp.KEY_LINE_SCROLL, 4, null, null));

        l.add(new Item(HEADER, "menu", 0, null, null));
        l.add(new Item(ACTION, IppMenuActivity.KEY_STYLE, 0, null, null));  // style, margins, preview text
        l.add(new Item(TOGGLE, "alpha_scroll", 0, null, null));
        l.add(new Item(NUMBER, "alpha_threshold", Alpha.THRESHOLDS.length, Alpha.THRESHOLDS, null));
        l.add(new Item(TOGGLE, "follow_playing", 0, null, null));
        l.add(new Item(NUMBER, Follow.KEY_IDLE, Follow.IDLES.length, Follow.IDLES, null));
        l.add(new Item(TOGGLE, Loop.KEY, 0, null, null));
        if (Anim.NAV_BUILT || Anim.BUILT) l.add(new Item(TOGGLE, Anim.KEY, 0, null, null));
        if (Anim.NAV_BUILT) l.add(new Item(TOGGLE, Anim.KEY_NAV, 0, null, Anim.KEY));
        if (Anim.BUILT) l.add(new Item(TOGGLE, Anim.KEY_SCROLL, 0, null, Anim.KEY));
        l.add(new Item(SUB, "status_bar", 0, null, null));
        l.add(new Item(CHOICE, TopBar.KEY_TEXT, 3, null, null).in("status_bar"));
        l.add(new Item(CHOICE, TopBar.KEY_STYLE, 2, null, null).in("status_bar"));
        l.add(new Item(ACTION, TopBar.KEY_ICONS, TopBar.ICONS.length, null, null).in("status_bar"));
        mainMenu(l);

        l.add(new Item(HEADER, "metadata", 0, null, null));
        l.add(new Item(TOGGLE, "meta_title", 0, null, null));
        l.add(new Item(TOGGLE, "book_meta_title", 0, null, null));
        l.add(new Item(TOGGLE, "album_year", 0, null, null));
        l.add(new Item(TOGGLE, "track_numbers", 0, null, null));
        l.add(new Item(TOGGLE, Artists.KEY_SPLIT, 0, null, null));
        l.add(new Item(TOGGLE, GenreSplit.KEY_SPLIT, 0, null, null));
        l.add(new Item(TOGGLE, Albums.KEY_SCOPE, 0, null, null));

        l.add(new Item(HEADER, "system", 0, null, null));
        l.add(new Item(TOGGLE, "delete_folder", 0, null, null));
        l.add(new Item(TOGGLE, "keep_awake", 0, null, null));
        l.add(new Item(TOGGLE, "likes", 0, null, null));
        l.add(new Item(TOGGLE, CenterHold.KEY, 0, null, null));
        // likes_names is deliberately not built: it does nothing yet
        l.add(new Item(CHOICE, Keys.KEY_SECOND, 2, null, null));
        l.add(new Item(SUB, "screensaver", 0, null, null));
        l.add(new Item(TOGGLE, Saver.KEY_ON, 0, null, null).in("screensaver"));
        l.add(new Item(ACTION, Saver.KEY_STYLE, Saver.STYLES, null, Saver.KEY_ON).in("screensaver"));
        l.add(new Item(CHOICE, Saver.KEY_OFF, Saver.OFF_MS.length, null, Saver.KEY_ON).in("screensaver").wheel());
        l.add(new Item(TOGGLE, Saver.KEY_CHARGING, 0, null, Saver.KEY_ON).in("screensaver"));

        return l;
    }

    /** The Main menu section (MainMenu): a toggle per row, the rows of a menu indented under it. */
    private static void mainMenu(List l) {
        String s = "main_menu";
        l.add(new Item(SUB, s, 0, null, null));
        l.add(new Item(TOGGLE, "mm_now", 0, null, null).in(s));
        l.add(new Item(TOGGLE, MainMenu.KEY_MUSIC, 0, null, null).in(s));
        String[] music = {"mm_coverflow", "mm_songs", "mm_playlists", "mm_artists", AlbumArtists.KEY,
                "mm_albums", "mm_genres", "mm_folders", "mm_search"};
        for (int i = 0; i < music.length; i++) {
            l.add(new Item(TOGGLE, music[i], 0, null, MainMenu.KEY_MUSIC).in(s).indent());
        }
        l.add(new Item(TOGGLE, MainMenu.KEY_VIDEOS, 0, null, null).in(s));
        String[] videos = {"mm_video_all", "mm_video_playlist", "mm_video_folders", "mm_video_search"};
        for (int i = 0; i < videos.length; i++) {
            l.add(new Item(TOGGLE, videos[i], 0, null, MainMenu.KEY_VIDEOS).in(s).indent());
        }
        l.add(new Item(TOGGLE, MainMenu.KEY_BOOKS, 0, null, null).in(s));
        String[] books = {"mm_book_all", "mm_book_artists", "mm_book_albums", "mm_book_folders", "mm_bookmarks"};
        for (int i = 0; i < books.length; i++) {
            l.add(new Item(TOGGLE, books[i], 0, null, MainMenu.KEY_BOOKS).in(s).indent());
        }
        l.add(new Item(TOGGLE, "mm_ebook", 0, null, null).in(s));
        l.add(new Item(TOGGLE, "mm_photos", 0, null, null).in(s));
        l.add(new Item(TOGGLE, "mm_fm", 0, null, null).in(s));
        l.add(new Item(TOGGLE, "mm_bluetooth", 0, null, null).in(s));
    }

    /**
     * The theme's font: ThemeManager swaps {@code Typeface.MONOSPACE} for it. Read per call — it
     * changes with the theme.
     */
    private static Typeface font() {
        return Typeface.create(Typeface.MONOSPACE, Typeface.BOLD);
    }

    /** Sub-items carry the arrow; a section's rows are already inside what they depend on. */
    private static boolean marked(Item it) {
        return it.showIf != null && it.parent == null;
    }

    private boolean visible(Item it) {
        return it.showIf == null || Prefs.on(this, it.showIf);
    }

    /** A TOGGLE's state, default from {@code Prefs.DEFAULTS}. */
    private boolean toggleOn(Item it) {
        return Prefs.on(this, it.key);
    }

    /** A row of the open group or section, shown and not a caption. */
    private boolean selectable(int i) {
        Item it = (Item) items.get(i);
        return it.type != HEADER && groupOf[i] == group && visible(it);
    }

    private int firstSelectable() {
        for (int i = 0; i < items.size(); i++) {
            if (selectable(i)) return i;
        }
        return 0;
    }

    /**
     * "Enable animations" turned on turns Scroll on with it; Scroll turned off turns the whole row
     * off, and its sub-row closes with the cursor back on the row above it.
     */
    private void animLinked(String key) {
        if (Anim.KEY.equals(key) && Prefs.on(this, Anim.KEY)) {
            Prefs.setBool(this, Anim.KEY_SCROLL, true);
        } else if (Anim.KEY_SCROLL.equals(key) && !Prefs.on(this, Anim.KEY_SCROLL)) {
            Prefs.setBool(this, Anim.KEY, false);
            for (int i = 0; i < items.size(); i++) {
                if (Anim.KEY.equals(((Item) items.get(i)).key)) sel = i;
            }
        }
    }

    private void clampSel() {
        if (sel < 0 || sel >= items.size() || !selectable(sel)) {
            sel = firstSelectable();
        }
    }

    @Override
    public ActivityAboutBinding getViewBinding() {
        return ActivityAboutBinding.inflate(getLayoutInflater());
    }

    @Override
    public void initView() {
        setStateBarLeftText(getString(R.string.ipp_settings_title));

        ViewGroup root = (ViewGroup) getVb().getRoot();
        root.removeAllViews();

        items = buildItems();
        lastItems = items;
        int n = items.size();
        groupOf = new int[n];

        int heads = 0;
        for (int i = 0; i < n; i++) {
            if (((Item) items.get(i)).type == HEADER) heads++;
        }
        cats = new int[heads];
        int cur = -1;
        int c = 0;
        for (int i = 0; i < n; i++) {
            if (((Item) items.get(i)).type == HEADER) {
                cur = i;
                cats[c++] = i;
            }
            groupOf[i] = cur;
        }
        // a row named into a section stands under that row, not under the group
        for (int i = 0; i < n; i++) {
            Item it = (Item) items.get(i);
            if (it.type == HEADER || it.parent == null) continue;
            for (int j = 0; j < n; j++) {
                Item p = (Item) items.get(j);
                if (p.type == SUB && it.parent.equals(p.key)) groupOf[i] = j;
            }
        }

        // No side padding, or the wallpaper shows as a stripe down both edges; the row's own
        // padding keeps the text off the edge.
        android.widget.FrameLayout box = new android.widget.FrameLayout(this);
        catList = newList(R.id.rc_list);
        catLm = (LinearLayoutManager) catList.getLayoutManager();
        catAdapter = new CatAdapter(this);
        catList.setAdapter(catAdapter);
        rowList = newList(R.id.recycler);
        rowLm = (LinearLayoutManager) rowList.getLayoutManager();
        rowAdapter = new RowAdapter(this);
        rowList.setAdapter(rowAdapter);
        rowList.setVisibility(View.GONE);
        box.addView(catList, -1, -1);
        box.addView(rowList, -1, -1);
        root.addView(box, -1, -1);
        show(-1, -1);
        tip = com.innioasis.ipp.TipDialog.show(this, TIP, TIP_OFF);
    }

    /** The list of groups is open, the level {@link MenuStyle#section} lays out as the main menu. */
    public boolean atRoot() {
        return group < 0;
    }

    /** A list moved by Wheel.follow: rows rebound in place, never notified (ipp-wheel-scroll). */
    private RecyclerView newList(int id) {
        RecyclerView rv = new com.innioasis.ipp.Fixed(this);
        rv.setId(id);
        LinearLayoutManager lm = new LinearLayoutManager(this);
        rv.setLayoutManager(lm);
        rv.setItemAnimator(null);
        rv.setItemViewCacheSize(0);
        lm.setItemPrefetchEnabled(false);
        rv.setDescendantFocusability(ViewGroup.FOCUS_BLOCK_DESCENDANTS);
        return rv;
    }

    /**
     * The groups ({@code g == -1}), or the rows of one group or section with its name in the
     * status bar. {@code cursor} is the row to stand on; -1 is the first.
     */
    private void show(int g, int cursor) {
        group = g;
        if (g < 0) {
            setStateBarLeftText(getString(R.string.ipp_settings_title));
            rowList.setVisibility(View.GONE);
            catList.setVisibility(View.VISIBLE);
            setMark(catSel);
            catAdapter.notifyDataSetChanged();
            Bar.relist(catList);
            catLm.scrollToPosition(catSel);
        } else {
            setStateBarLeftText(label((Item) items.get(g)));
            sel = cursor >= 0 && selectable(cursor) ? cursor : firstSelectable();
            fitRows();
            catList.setVisibility(View.GONE);
            rowList.setVisibility(View.VISIBLE);
            relist();
            Bar.relist(rowList);
            rowLm.scrollToPosition(cursor >= 0 ? posOf(sel) : 0);
        }
        MenuStyle.section(this);
    }

    /** The open group's visible rows, the cursor among them, the list rebound. */
    private void relist() {
        ArrayList l = new ArrayList();
        for (int i = 0; i < items.size(); i++) {
            if (selectable(i)) l.add(Integer.valueOf(i));
        }
        shown = new int[l.size()];
        for (int p = 0; p < shown.length; p++) shown[p] = ((Integer) l.get(p)).intValue();
        setMark(posOf(sel));
        rowAdapter.notifyDataSetChanged();
    }

    /** An item's position in the open group's list, -1 when it is not shown. */
    private int posOf(int i) {
        for (int p = 0; p < shown.length; p++) {
            if (shown[p] == i) return p;
        }
        return -1;
    }

    /** item_main's text size, and how far it may shrink. */
    private static final float TEXT_SP = 22.0f;
    private static final float TEXT_MIN_SP = 14.0f;

    /** Where a row's text starts: under the status bar's title. */
    private static final int TEXT_START = 10;

    /** The arrow's distance from the screen edge, and the room kept for it beside a label. */
    private static final int ARROW_END = 5;
    private static final int ARROW_ROOM = 24;

    /** How far an indented row's text stands in. */
    private static final int INDENT = 22;

    /** Rows on one screen inside a group. */
    private static final int ROWS = 5;

    /** The sub-item arrow's size, sp, and its gap to the label, px. */
    private static final float MARK_SP = 13.0f;
    private static final int MARK_GAP = 3;

    private float textSp = TEXT_SP;     // every row's, from fitRows()
    private int rowPx;                  // a row's height without its hairline; 0 until fitRows()
    private boolean rowsFitted;

    /**
     * {@link #ROWS} rows fill the visible height exactly; one text size for all, shrunk until every
     * label of this language fits two lines beside its widest value. Once, at the first group.
     */
    private void fitRows() {
        // the box's: the list of groups is narrower beside the picture in Default
        View box = (View) catList.getParent();
        int visible = box.getHeight();
        int width = box.getWidth();
        if (rowsFitted || visible <= 0 || width <= 0) return;
        rowsFitted = true;
        int h = visible / ROWS - HAIR_H;

        float scaled = getResources().getDisplayMetrics().scaledDensity;
        float sp = TEXT_SP;
        for (; sp > TEXT_MIN_SP; sp -= 1.0f) {
            if (fits(sp * scaled, width, h)) break;
        }
        textSp = sp;
        rowPx = h;
    }

    /** Every label fits two lines of {@code h} at {@code px}. */
    private boolean fits(float px, int width, int h) {
        android.text.TextPaint p = new android.text.TextPaint(android.graphics.Paint.ANTI_ALIAS_FLAG);
        p.setTypeface(font());
        p.setTextSize(px);
        android.text.TextPaint mp = new android.text.TextPaint(android.graphics.Paint.ANTI_ALIAS_FLAG);
        mp.setTypeface(font());
        mp.setTextSize(MARK_SP * getResources().getDisplayMetrics().scaledDensity);
        int markRoom = (int) Math.ceil(mp.measureText("↴")) + MARK_GAP;
        for (int i = 0; i < items.size(); i++) {
            Item it = (Item) items.get(i);
            if (it.type == HEADER) continue;
            float widest = 0;
            // an ACTION's values name what it opens; its value column is empty
            String[] vals = it.type == ACTION ? new String[0] : valuesOf(it);
            for (int v = 0; v < vals.length; v++) widest = Math.max(widest, p.measureText(vals[v]));
            // the row's padding and the value column's
            int room = width - TEXT_START - 5 - 6 - 6 - (int) Math.ceil(widest);
            if (marked(it)) room -= markRoom;
            if (it.indent) room -= INDENT;
            if (it.type == SUB || it.type == ACTION) room -= ARROW_ROOM;
            if (room <= 0) return false;
            android.text.StaticLayout l = new android.text.StaticLayout(label(it), p, room,
                    android.text.Layout.Alignment.ALIGN_NORMAL, 1.0f, 0.0f, false);
            if (l.getLineCount() > 2 || l.getHeight() > h) return false;
        }
        return true;
    }

    /** Every value a row can show, for measuring the widest. */
    private String[] valuesOf(Item it) {
        if (it.type == TOGGLE) {
            return new String[]{getString(R.string.ipp_on), getString(R.string.ipp_off)};
        }
        if (it.type == NUMBER) {
            String[] s = new String[it.choices.length];
            for (int i = 0; i < s.length; i++) s[i] = String.valueOf(it.choices[i]);
            return s;
        }
        if (it.count > 0 && it.values != null) return it.values;
        if (it.count > 0) {
            String[] s = new String[it.count];
            for (int i = 0; i < s.length; i++) s[i] = String.valueOf(i);
            return s;
        }
        return new String[0];
    }

    /** Open the group under the cursor, unless it has nothing to show. */
    private void openGroup() {
        if (cats.length == 0) return;
        int g = cats[catSel];
        for (int i = 0; i < items.size(); i++) {
            Item it = (Item) items.get(i);
            if (groupOf[i] == g && it.type != HEADER && visible(it)) {
                show(g, -1);
                return;
            }
        }
    }

    /** Open the section row {@code s}, unless it has nothing to show. */
    private void openSub(int s) {
        for (int i = 0; i < items.size(); i++) {
            if (groupOf[i] == s && i != s && visible((Item) items.get(i))) {
                show(s, -1);
                return;
            }
        }
    }

    /** Which of the status bar's icons are shown, named by the row's own values. */
    private void pickIcons(Item it) {
        new PickDialog(getActivity(), label(it), getString(R.string.ipp_backup_save),
                TopBar.ICONS, valuesOf(it), TopBar.mask(this),
                new IconPick(this)).show();
    }

    static final class IconPick extends PickDialog.Go {
        private final IppActivity a;

        IconPick(IppActivity a) { this.a = a; }

        @Override
        public void go(int mask) {
            TopBar.save(a, mask);
        }
    }

    /** A value changed: a toggle may show or hide a sub-item, so the open list is rebuilt. */
    private void render() {
        if (group < 0) {
            catAdapter.notifyDataSetChanged();
            return;
        }
        clampSel();
        relist();
    }

    /** A group's row: the Music menu's own (item_main), its arrow where a stock Settings row has it. */
    CatHolder newCat(ViewGroup parent) {
        View v = getLayoutInflater().inflate(R.layout.item_main, parent, false);
        CatHolder h = new CatHolder(v, (TextView) v.findViewById(R.id.tv_item),
                (android.widget.ImageView) v.findViewById(R.id.iv_arrow));
        ViewGroup.MarginLayoutParams cp = (ViewGroup.MarginLayoutParams) h.arrow.getLayoutParams();
        cp.rightMargin = ARROW_END;
        cp.setMarginEnd(ARROW_END);
        return h;
    }

    /** A group's row, painted the way MainAdapter paints a row of the Music menu. */
    void bindCat(CatHolder h, int c) {
        h.label.setText(label((Item) items.get(cats[c])));
        boolean on = c == catSel;
        if (on) {
            if (!Anim.on()) ThemeManager.INSTANCE.itemSetBackground(h.itemView, R.drawable.item_selected_no_arrow, true);
            ThemeManager.INSTANCE.itemSetRightArrow(h.arrow, R.mipmap.right_arrow);
            h.arrow.setVisibility(View.VISIBLE);
            ThemeManager.INSTANCE.itemSetTextColor(h.label,
                    getResources().getColor(R.color.selected_text_color), true);
        } else {
            if (!Anim.on()) ThemeManager.INSTANCE.itemSetBackground(h.itemView, R.drawable.item_no_selected, false);
            ThemeManager.INSTANCE.itemSetTextColor(h.label, getResources().getColor(R.color.white), false);
            h.arrow.setVisibility(View.INVISIBLE);
        }
        Bar.row(h.itemView);
    }

    /**
     * A row of a group: label, value column, the theme's arrow on a row that opens something, the
     * sub-item mark before a row that exists only while another is on. Hairline on the bottom edge.
     */
    RowHolder newRow() {
        // a FIXED height: a theme's selection bitmap would stretch it
        LinearLayout line = new LinearLayout(this);
        // the view the highlight is painted on: the travelling bar empties it (Bar.specs)
        line.setId(R.id.layout);
        line.setOrientation(LinearLayout.HORIZONTAL);
        line.setBaselineAligned(false);
        line.setGravity(Gravity.CENTER_VERTICAL);
        line.setPadding(TEXT_START, 0, 5, 0);

        // "↴" rotated 180°, pointing back to its row. Rotated rather than a ready
        // glyph, which theme fonts may lack.
        TextView mark = new TextView(this);
        mark.setId(R.id.tv_item);
        mark.setTextSize(MARK_SP);
        mark.setTypeface(font());
        mark.setIncludeFontPadding(false);
        mark.setGravity(Gravity.CENTER);
        mark.setText("↴");
        mark.setRotation(180.0f);
        LinearLayout.LayoutParams mp = new LinearLayout.LayoutParams(-2, -1);
        mp.rightMargin = MARK_GAP;
        line.addView(mark, mp);

        // item_main's text. The two-argument setTypeface fakes bold for a font without it.
        TextView label = new TextView(this);
        label.setId(R.id.title);
        label.setTextSize(textSp);
        label.setTypeface(Typeface.MONOSPACE, Typeface.BOLD);
        label.setIncludeFontPadding(false);
        label.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, -1);
        lp.weight = 1.0f;
        line.addView(label, lp);

        TextView value = new TextView(this);
        value.setId(R.id.text);
        value.setTextSize(textSp);
        value.setTypeface(Typeface.MONOSPACE, Typeface.BOLD);
        value.setIncludeFontPadding(false);
        value.setGravity(Gravity.CENTER_VERTICAL);
        value.setPadding(6, 0, 6, 0);
        line.addView(value, -2, -2);

        // A row with no value opens something: the arrow of a stock Settings row.
        android.widget.ImageView arrow = new android.widget.ImageView(this);
        arrow.setId(R.id.arrow);
        arrow.setAdjustViewBounds(true);
        LinearLayout.LayoutParams ap = new LinearLayout.LayoutParams(-2, -1);
        ap.rightMargin = ARROW_END - line.getPaddingRight();
        line.addView(arrow, ap);

        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        // two lines of text until fitRows() has measured the screen
        box.addView(line, new LinearLayout.LayoutParams(-1, 2 * label.getLineHeight() + 4));
        box.addView(hair(), new LinearLayout.LayoutParams(-1, HAIR_H));
        box.setLayoutParams(new RecyclerView.LayoutParams(-1, -2));
        return new RowHolder(box, line, mark, label, value, arrow);
    }

    /** A row of the open group, at position {@code p}. */
    void bindRow(RowHolder h, int p) {
        int i = shown[p];
        Item it = (Item) items.get(i);
        h.item = i;
        if (h.label.getTextSize() != textSp * getResources().getDisplayMetrics().scaledDensity) {
            h.label.setTextSize(textSp);
            h.value.setTextSize(textSp);
        }
        setHeight(h.line, rowPx > 0 ? rowPx : 2 * h.label.getLineHeight() + 4);
        h.label.setText(label(it));
        h.value.setText(editing && i == editIndex ? candidate(it, editVal) : valueText(it));
        h.value.setVisibility(View.VISIBLE);
        h.mark.setVisibility(marked(it) ? View.VISIBLE : View.GONE);
        int start = it.indent ? TEXT_START + INDENT : TEXT_START;
        if (h.line.getPaddingLeft() != start) {
            h.line.setPadding(start, 0, h.line.getPaddingRight(), 0);
        }

        boolean on = (i == sel);
        int fg = on ? ACCENT : -1;
        if (!Anim.on()) ThemeManager.INSTANCE.itemSetBackground(h.line, on ? R.drawable.item_setting_sel : 0, on);
        ThemeManager.INSTANCE.itemSetTextColor(h.label, fg, on);
        ThemeManager.INSTANCE.itemSetTextColor(h.value, fg, on);
        ThemeManager.INSTANCE.itemSetTextColor(h.mark, fg, on);
        // seen only under the cursor, like a stock Settings row's
        if (it.type == SUB || it.type == ACTION) {
            if (on) ThemeManager.INSTANCE.itemSetRightArrow(h.arrow, R.mipmap.right_arrow);
            h.arrow.setVisibility(on ? View.VISIBLE : View.INVISIBLE);
        } else {
            h.arrow.setVisibility(View.GONE);
        }
        Bar.row(h.itemView);
    }

    private static boolean setHeight(View v, int h) {
        ViewGroup.LayoutParams lp = v.getLayoutParams();
        if (lp == null || lp.height == h) return false;
        lp.height = h;
        v.setLayoutParams(lp);
        return true;
    }

    /** A wheel click repaints the two rows that change, not the whole menu ({@link #render}). */
    private void move(int old) {
        clampSel();
        if (old == sel) return;
        int np = posOf(sel);
        setMark(np);
        Wheel.follow(rowList, posOf(old), np, rowAdapter);
    }

    /**
     * A row's hairline in the theme's item colour, weakened — read off a scratch TextView, since
     * {@code itemSetTextColor} ignores the colour it is passed.
     */
    private View hair() {
        if (hairColor == 0) {
            TextView probe = new TextView(this);
            ThemeManager.INSTANCE.itemSetTextColor(probe,
                    getResources().getColor(R.color.selected_text_color), false);
            hairColor = (probe.getCurrentTextColor() & 0x00FFFFFF) | HAIR_ALPHA;
        }
        View v = new View(this);
        v.setBackgroundColor(hairColor);
        return v;
    }

    private int hairColor;

    private CharSequence valueText(Item it) {
        if (it.type == TOGGLE) {
            return getString(toggleOn(it) ? R.string.ipp_on : R.string.ipp_off);
        }
        if (it.type == CHOICE || it.type == NUMBER) {
            int v = Prefs.val(this, it.key);
            if (v < 0 || v >= it.count) v = Prefs.defInt(it.key);
            if (it.type == NUMBER) return String.valueOf(it.choices[v]);
            return it.values != null ? it.values[v] : String.valueOf(v);
        }
        return "";   // ACTION: no value column
    }

    /** The next row of the open group; at its ends it stops, or goes round with loop scrolling. */
    private int step(int from, int dir) {
        int i = from + dir;
        while (i >= 0 && i < items.size()) {
            if (selectable(i)) return i;
            i += dir;
        }
        if (!Bar.wraps(rowList, dir)) return from;
        i = dir > 0 ? 0 : items.size() - 1;
        while (i != from) {
            if (selectable(i)) return i;
            i += dir;
        }
        return from;
    }

    /** The cursor over the groups; at the ends it stops, or goes round with loop scrolling. */
    private void moveCat(int dir) {
        int old = catSel;
        // while the rows still glide towards an end, going round it is swallowed
        boolean end = dir > 0 ? catSel >= cats.length - 1 : catSel <= 0;
        if (end && Bar.holds(catList, dir)) return;
        int c = Loop.step(catSel, dir, cats.length);
        if (c == old) return;
        catSel = c;
        setMark(catSel);
        Wheel.follow(catList, old, catSel, catAdapter);
    }

    @Override
    public void clockwise() {
        if (editing) { spin(1); return; }
        if (group < 0) { moveCat(1); return; }
        int old = sel;
        sel = step(sel, 1);
        move(old);
    }

    @Override
    public void antiClockwise() {
        if (editing) { spin(-1); return; }
        if (group < 0) { moveCat(-1); return; }
        int old = sel;
        sel = step(sel, -1);
        move(old);
    }

    /**
     * A NUMBER row is edited, not cycled: the wheel runs over the values, centre takes the one
     * shown, top puts the old one back.
     */
    private void startEdit(Item it) {
        editing = true;
        editIndex = sel;
        editVal = Prefs.val(this, it.key);
        if (editVal < 0 || editVal >= it.count) editVal = Prefs.defInt(it.key);
        if (blink == null) blink = new Blink(this);
        showCandidate(it);
    }

    private static String candidate(Item it, int v) {
        if (it.choices != null) return String.valueOf(it.choices[v]);
        return it.values != null ? it.values[v] : String.valueOf(v);
    }

    /** Wrapped both ways: 60 -> 5 going on, 5 -> 60 going back. */
    private void spin(int dir) {
        Item it = (Item) items.get(editIndex);
        int n = it.count;
        editVal = ((editVal + dir) % n + n) % n;
        showCandidate(it);
    }

    /** The value column of the row being edited, while it is on screen. */
    private TextView editValue() {
        View v = rowLm.findViewByPosition(posOf(editIndex));
        if (v == null) return null;
        RecyclerView.ViewHolder h = rowList.getChildViewHolder(v);
        return h instanceof RowHolder ? ((RowHolder) h).value : null;
    }

    /** The candidate, the blink restarted from "visible". */
    private void showCandidate(Item it) {
        rowList.removeCallbacks(blink);
        TextView v = editValue();
        if (v != null) {
            v.setText(candidate(it, editVal));
            v.setVisibility(View.VISIBLE);
        }
        rowList.postDelayed(blink, BLINK_MS);
    }

    void blinkTick() {
        if (!editing) return;
        TextView v = editValue();
        if (v != null) v.setVisibility(v.getVisibility() == View.VISIBLE ? View.INVISIBLE : View.VISIBLE);
        rowList.postDelayed(blink, BLINK_MS);
    }

    /** Leave edit mode; {@code commit} false drops the candidate. */
    private void endEdit(boolean commit) {
        if (!editing) return;
        editing = false;
        Item it = (Item) items.get(editIndex);
        if (blink != null) rowList.removeCallbacks(blink);
        if (commit) Prefs.setInt(this, it.key, editVal);
        render();
    }

    /** The value blinks while the wheel belongs to it. */
    static final class Blink implements Runnable {
        private final IppActivity a;
        Blink(IppActivity a) { this.a = a; }
        public void run() { a.blinkTick(); }
    }

    /** The groups. */
    static final class CatAdapter extends RecyclerView.Adapter {
        private final IppActivity a;

        CatAdapter(IppActivity a) { this.a = a; }

        public int getItemCount() { return a.cats == null ? 0 : a.cats.length; }

        public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int type) {
            return a.newCat(parent);
        }

        public void onBindViewHolder(RecyclerView.ViewHolder h, int p) {
            a.bindCat((CatHolder) h, p);
        }
    }

    /** The rows of the open group or section. */
    static final class RowAdapter extends RecyclerView.Adapter {
        private final IppActivity a;

        RowAdapter(IppActivity a) { this.a = a; }

        public int getItemCount() { return a.shown.length; }

        public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int type) {
            return a.newRow();
        }

        public void onBindViewHolder(RecyclerView.ViewHolder h, int p) {
            a.bindRow((RowHolder) h, p);
        }
    }

    static final class CatHolder extends RecyclerView.ViewHolder {
        final TextView label;
        final android.widget.ImageView arrow;

        CatHolder(View v, TextView label, android.widget.ImageView arrow) {
            super(v);
            this.label = label;
            this.arrow = arrow;
        }
    }

    static final class RowHolder extends RecyclerView.ViewHolder {
        final LinearLayout line;
        final TextView mark;
        final TextView label;
        final TextView value;
        final android.widget.ImageView arrow;
        int item;

        RowHolder(View box, LinearLayout line, TextView mark, TextView label, TextView value,
                android.widget.ImageView arrow) {
            super(box);
            this.line = line;
            this.mark = mark;
            this.label = label;
            this.value = value;
            this.arrow = arrow;
        }
    }

    @Override
    public void confirm() {
        if (editing) { endEdit(true); return; }
        if (group < 0) { openGroup(); return; }
        clampSel();
        Item it = (Item) items.get(sel);
        if (it.type == TOGGLE) {
            // read back with the row's own default, or a default-On row takes two presses
            Prefs.setBool(this, it.key, !toggleOn(it));
            // a backstop: Favorites can be deleted only with the delete protection off
            if ("likes".equals(it.key) && Prefs.on(this, it.key)) Fav.ensure(this);
            // the genre subtitles are cached counts the split changes
            if (GenreSplit.KEY_SPLIT.equals(it.key)) GenreInfo.clear();
            if (Anim.KEY.equals(it.key) || Anim.KEY_SCROLL.equals(it.key)) {
                animLinked(it.key);
                // this screen's own lists take the bar on or off now, not at the next resume
                Bar.apply(this);
            }
            // the two artist-line modes exclude each other; both rows stay on screen
            String rival = Feat.rival(it.key);
            if (rival != null && Prefs.on(this, it.key)) Prefs.setBool(this, rival, false);
            render();
        } else if (it.type == NUMBER || (it.type == CHOICE && it.wheel)) {
            startEdit(it);
        } else if (it.type == CHOICE) {
            int v = (Prefs.val(this, it.key) + 1) % it.count;
            Prefs.setInt(this, it.key, v);
            if (TopBar.KEY_TEXT.equals(it.key) || TopBar.KEY_STYLE.equals(it.key)) TopBar.apply(this);
            render();
        } else if (it.type == SUB) {
            openSub(sel);
        } else if (it.type == ACTION) {
            if (TopBar.KEY_ICONS.equals(it.key)) {
                pickIcons(it);
            } else if ("scan".equals(it.key)) {
                confirmScan(label(it));
            } else if ("cache".equals(it.key)) {
                confirmCache();
            } else if ("backup".equals(it.key)) {
                // no Yes/No: Load asks for itself once an archive is picked
                Backup.open(getActivity(), label(it));
            } else if (IppNowActivity.KEY_STYLE.equals(it.key)) {
                startActivity(new android.content.Intent(this, IppNowActivity.class));
            } else if (IppMenuActivity.KEY_STYLE.equals(it.key)) {
                startActivity(new android.content.Intent(this, IppMenuActivity.class));
            } else if (Saver.KEY_STYLE.equals(it.key)) {
                android.content.Intent i = new android.content.Intent(this, IppSaverActivity.class);
                i.putExtra(IppSaverActivity.EXTRA_PREVIEW, true);
                startActivity(i);
            } else if ("m3u_import".equals(it.key)) {
                startActivity(new android.content.Intent(this, IppImportActivity.class));
            } else if ("log".equals(it.key)) {
                confirmLog(label(it));
            }
        }
    }

    // action ids for Confirm ("Cache library" has a picker of its own, not a Yes/No)
    private static final int ACT_SCAN = 1;
    private static final int ACT_LOG = 2;

    private void confirmScan(String title) {
        DialogUtil d = new DialogUtil(getActivity(), false, R.style.Dialog_Common);
        d.setDialogTitle(title, getString(R.string.ipp_scan_confirm),
                new Confirm(this, ACT_SCAN), false, true);
    }

    private void confirmLog(String title) {
        DialogUtil d = new DialogUtil(getActivity(), false, R.style.Dialog_Common);
        d.setDialogTitle(title, getString(R.string.ipp_log_confirm),
                new Confirm(this, ACT_LOG), false, true);
    }

    /** "Cache library" asks WHAT to fill ({@link PickDialog}): the covers are the expensive half. */
    private void confirmCache() {
        Pick.askCache(getActivity(), new CachePick(this));
    }

    static final class CachePick extends PickDialog.Go {
        private final IppActivity a;

        CachePick(IppActivity a) { this.a = a; }

        @Override
        public void go(int mask) {
            a.runCacheLibrary(mask);
        }
    }

    private LoadingDialog progress;

    /**
     * "Update library": re-read the songs ALREADY in the library whose mtime changed. New and
     * deleted files are the stock scan's job, not started here (its dialog would cover ours).
     */
    void runFullRescan() {
        try {
            progress = new LoadingDialog(getActivity(), Loading.percent(getString(R.string.ipp_scan_running), 0), "",
                    R.style.Dialog_Common, new Noop());
            Loading.counter(progress);
            progress.show();
        } catch (Throwable t) {
            progress = null;
        }
        new Thread(new RescanTask(this)).start();
    }

    /** Worker -> UI. */
    void scanTick(String text) {
        runOnUiThread(new Tick(this, text));
    }

    void scanFinished(int updated) {
        runOnUiThread(new Done(this, updated));
    }

    /**
     * "Cache library": read up front, into file-backed caches, what the lists otherwise read while
     * the user looks. "Already cached" is the library signature ({@code Albums.cached}).
     */
    void runCacheLibrary(int mask) {
        if (mask == 0) return;
        try {
            progress = new LoadingDialog(getActivity(), Loading.percent(getString(R.string.ipp_cache_running), 0), "",
                    R.style.Dialog_Common, new Noop());
            Loading.counter(progress);
            progress.show();
        } catch (Throwable t) {
            progress = null;
        }
        new Thread(new CacheTask(this, mask)).start();
    }

    void cacheFinished(int albums) {
        runOnUiThread(new CacheDone(this, albums));
    }

    /** Yes/No for the Tools actions. */
    private static final class Confirm extends DialogUtil.DialogCallback {
        private final IppActivity a;
        private final int action;

        Confirm(IppActivity a, int action) {
            this.a = a;
            this.action = action;
        }

        @Override
        public void confirm() {
            if (action == ACT_LOG) {
                Diag.save(a);
            } else {
                a.runFullRescan();
            }
        }

        @Override
        public void cancel() {
        }
    }

    /**
     * Re-read the rows whose file changed: {@code fileToSong} and {@code SongDao.insert} never touch
     * the file — unlike {@code deleteSong}, which DELETES it from disk.
     */
    private static final class RescanTask implements Runnable {
        private final IppActivity a;

        RescanTask(IppActivity a) {
            this.a = a;
        }

        @Override
        public void run() {
            int updated = 0;
            long t0 = SystemClock.uptimeMillis();
            Rescan q = new Rescan();
            int n = 0;
            try {
                Y1Repository repo = Y1Application.Companion.getY1Repository();
                List songs = Albums.allSongs();             // read only: the list in memory
                if (songs == null) songs = repo.getSongsSync(0);
                n = songs == null ? 0 : songs.size();
                String label = a.getString(R.string.ipp_scan_running);
                // once per library: re-read rows the platform's tag limit truncated (Meta)
                boolean migrate = !Meta.libraryRead(a);
                q.show(a, label, n);
                // every row is checked before any file is read: the reads would hold the card
                // and stall the checks, and the scale only knows the reads once the checks end
                for (int i = 0; i < n; i++) {
                    Song s = (Song) songs.get(i);
                    if (s == null || s.getPath() == null) continue;
                    if ((i & 15) == 0) q.checked(i);
                    String path = s.getPath();
                    File f = new File(path);
                    // one look at the card: 0 is what a missing file answers
                    long date = f.lastModified();
                    if (date == 0L && !f.exists()) continue;       // gone: the stock scan removes it

                    // An external cover changes no song's mtime: Art stamps the cover files per
                    // folder when it reads them.
                    if (Art.coverChanged(path)) {
                        CoverCache.forget(Albums.keyOf(s));                  // the list thumbnail
                        BigCover.forget(path);                               // this track's cover
                        BigCover.forget(Albums.trackFolder(path));           // the album's own
                        updated++;
                    }

                    if (date == s.getFileDate() && !(migrate && Meta.reread(path))) continue;
                    q.add(f);
                }
                q.close();
                q.checkMs = SystemClock.uptimeMillis() - t0;
                q.checked(n);
                q.start(repo);
                while (!q.idle()) updated += q.write(repo, false);
                updated += q.write(repo, true);
                // only on a pass that ran to the end and read every file it meant to
                if (!q.failed) Meta.noteLibraryRead(a);
            } catch (Throwable t) {
            } finally {
                q.close();
                Art.flushStamps();
                Diag.note("update library: " + n + " row(s), " + q.built + " re-read, "
                        + (SystemClock.uptimeMillis() - t0) + " ms: checks " + q.checkMs
                        + ", reads " + q.readMs + " over the workers, slowest " + q.slowMs + " "
                        + q.slowName + ", writes " + q.insertMs + " + invalidation " + q.dropMs);
                a.scanFinished(updated);
            }
        }
    }

    /**
     * The files "Update library" re-reads: the checking thread queues them, workers then
     * read them ({@code fileToSong} is thread-safe, see Scan), and the songs are written a batch
     * at a time with one invalidation per batch.
     */
    private static final class Rescan {
        private static final int BATCH = 100;
        private final java.util.LinkedList todo = new java.util.LinkedList();
        private final ArrayList done = new ArrayList();
        private Y1Repository repo;
        private int live;
        private boolean closed;
        int queued;
        int built;
        boolean failed;
        // where the time went, for the log
        long checkMs, readMs, slowMs, insertMs, dropMs;
        String slowName = "";

        void start(Y1Repository r) {
            repo = r;
            int c = Runtime.getRuntime().availableProcessors() + 1;
            if (c > 3) c = 3;
            synchronized (this) {
                for (int i = 0; i < c; i++) {
                    live++;
                    new Thread(new RescanWorker(this), "ipp-rescan").start();
                }
            }
        }

        synchronized void add(File f) {
            todo.addLast(f);
            queued++;
            notifyAll();
        }

        synchronized void close() {
            closed = true;
            notifyAll();
        }

        /** Waits a little; true once every worker has finished. */
        synchronized boolean idle() {
            if (live == 0) return true;
            try {
                wait(200L);
            } catch (InterruptedException e) {
                return true;
            }
            return live == 0;
        }

        // A row checked is ~0.1 ms; a file re-read ~5 ms of the three workers, and as much again to
        // write it and drop what was cached for it.
        private static final int READ_COST = 50;
        private static final int WRITE_COST = 50;
        private IppActivity ui;
        private String label;
        private int rows, checked, written;
        private int shown;                  // the percent on screen: never goes back

        void show(IppActivity a, String text, int n) {
            ui = a;
            label = text;
            rows = n;
        }

        void checked(int i) {
            synchronized (this) {
                checked = i;
            }
            tick();
        }

        /** Checks, reads and writes, weighted; from any thread, re-texted when the percent grows. */
        void tick() {
            int p;
            synchronized (this) {
                long all = rows + (long) queued * (READ_COST + WRITE_COST);
                p = all == 0 ? 0 : (int) ((checked + (long) built * READ_COST
                        + (long) written * WRITE_COST) * 100 / all);
                if (p > 99) p = 99;
                if (p <= shown) return;
                shown = p;
            }
            ui.scanTick(Loading.percent(label, p));
        }

        /** Writes the songs read so far, when a batch is full or {@code all}; how many were written. */
        int write(Y1Repository r, boolean all) {
            Song[] b;
            synchronized (this) {
                if (done.isEmpty() || (!all && done.size() < BATCH)) return 0;
                b = (Song[]) done.toArray(new Song[done.size()]);
                done.clear();
            }
            long t0 = SystemClock.uptimeMillis();
            try {
                r.ippSongDao().insert(b);
            } catch (Throwable t) {
                synchronized (this) {
                    failed = true;
                }
                return 0;
            }
            long t1 = SystemClock.uptimeMillis();
            Ipp.songsChanged(b);
            insertMs += t1 - t0;
            dropMs += SystemClock.uptimeMillis() - t1;
            synchronized (this) {
                written += b.length;
            }
            tick();
            return b.length;
        }

        /** Worker side: the next file, or null once the queue is closed and empty. */
        synchronized File next() throws InterruptedException {
            while (todo.isEmpty() && !closed) wait();
            return todo.isEmpty() ? null : (File) todo.removeFirst();
        }

        synchronized void built(Song s, File f, long ms) {
            readMs += ms;
            if (ms > slowMs) {
                slowMs = ms;
                slowName = f.getName();
            }
            built++;
            if (s != null) done.add(s);
            else failed = true;
            notifyAll();
        }

        synchronized void quit() {
            live--;
            notifyAll();
        }
    }

    private static final class RescanWorker implements Runnable {
        private final Rescan q;

        RescanWorker(Rescan q) {
            this.q = q;
        }

        @Override
        public void run() {
            try {
                while (true) {
                    File f = q.next();
                    if (f == null) break;
                    Song s = null;
                    long t0 = SystemClock.uptimeMillis();
                    try {
                        s = q.repo.fileToSong(f);
                    } catch (Throwable t) {
                        s = null;
                    }
                    Diag.slow("update library " + f.getName(), t0);
                    q.built(s, f, SystemClock.uptimeMillis() - t0);
                    q.tick();
                }
            } catch (Throwable t) {
            } finally {
                q.quit();
            }
        }
    }

    /** "Cache library". Writes no database: the worst a mistake here costs is wasted work. */
    private static final class CacheTask implements Runnable {
        private final IppActivity a;
        /** What the user ticked: {@code Pick.COVERS}, {@code Pick.FLOW}, {@code Pick.TAGS}. */
        private final int mask;

        // progress, shared with the workers
        private final Object lock = new Object();
        private String label = "";
        private int total = 1;
        private int progress;
        private int shown;                  // the percent on screen: never goes back
        // The scale's units, ~3 ms each on 25 000 songs: an album prepared is 1, a song read 2, a
        // thumbnail from a cover file (a big picture decoded for 50 px) 9, a Cover Flow slide 2, and
        // COMMIT_ROWS rows of tags written are COMMIT_UNITS.
        static final int SONG_COST = 2;
        static final int ALBUM_COST = 9;
        static final int FLOW_COST = 2;
        static final int COMMIT_UNITS = 2;
        static final int COMMIT_ROWS = 5;
        /** Rows staged and written per portion, so the write moves the scale. */
        static final int COMMIT_BATCH = 1000;

        CacheTask(IppActivity a, int mask) {
            this.a = a;
            this.mask = mask;
        }

        // the albums this pass filled anything for: what the toast counts
        private final HashSet touched = new HashSet();

        void touch(String key) {
            if (key == null) return;
            synchronized (touched) {
                touched.add(key);
            }
        }

        void tick() {
            tick(1);
        }

        /** {@code units} of work done, from any worker; the dialog is re-texted when the percent grows. */
        void tick(int units) {
            int p;
            synchronized (lock) {
                progress += units;
                p = (int) (progress * 100L / total);
                if (p > 100) p = 100;
                if (p <= shown) return;
                shown = p;
            }
            a.scanTick(Loading.percent(label, p));
        }

        private int committed, commitTicked;

        /** Rows of tags written, counted together so no portion's remainder is lost. */
        void committed(int rows) {
            int c;
            synchronized (lock) {
                c = committed += rows;
            }
            commitUpTo(c);
        }

        /** The write's whole share, as if all {@code n} songs had had tags to write. */
        void committedAll(int n) {
            commitUpTo(n);
        }

        private void commitUpTo(int rows) {
            int u;
            synchronized (lock) {
                int want = (int) ((long) rows * COMMIT_UNITS / COMMIT_ROWS);
                u = want - commitTicked;
                if (u <= 0) return;
                commitTicked = want;
            }
            tick(u);
        }

        /** The scale, in song units; it may grow once the albums' own cost is known. */
        void scale(int units) {
            synchronized (lock) {
                total = units <= 0 ? 1 : units;
            }
        }

        /** Album thumbnails on the pool; each job ticks once. */
        void runAlbums(List list) {
            if (list.isEmpty()) return;
            Blocks aq = Blocks.each(list.size());
            AlbumWorker[] aw = new AlbumWorker[workers()];
            for (int i = 0; i < aw.length; i++) aw[i] = new AlbumWorker(this, list, aq);
            spread(aw);
        }

        @Override
        public void run() {
            synchronized (Pick.LOCK) {      // a clear still running finishes first
                pass();
            }
        }

        private void pass() {
            int done = 0;
            int unread = 0;
            int unwritten = 0;
            long tAlbums = 0L, tSongs = 0L, tFlow = 0L;
            long tPrep = 0L;
            long tCommit = 0L;
            int earlyFiles = 0;
            long heap = 0L;
            Steps steps = new Steps();
            boolean covers = (mask & Pick.COVERS) != 0;
            boolean tags = (mask & Pick.TAGS) != 0;
            boolean flow = (mask & Pick.FLOW) != 0;
            try {
                // the list in memory, read only: a query here is a second library in the heap
                List songs = Albums.allSongs();
                int n = songs == null ? 0 : songs.size();

                long newest = 0L;
                for (int i = 0; i < n; i++) {
                    Song s = (Song) songs.get(i);
                    if (s != null && s.getFileDate() > newest) newest = s.getFileDate();
                }
                int stamp = (int) (newest / 1000L);

                if (Albums.cached(a, n, stamp, mask)) {
                    done = -1;                      // nothing changed since the last pass
                    return;
                }
                BigCover.beginCache();              // the cover notes saved once, at the end
                HashMap byDir = new HashMap();      // the album folder once per directory
                label = a.getString(R.string.ipp_cache_running);
                long tPrep0 = SystemClock.uptimeMillis();

                // one representative per album: the lowest path, as the row reads it
                LinkedHashMap reps = new LinkedHashMap();
                for (int i = 0; i < n; i++) {
                    Song s = (Song) songs.get(i);
                    if (s == null || s.getPath() == null) continue;
                    String key = Albums.keyOf(s, byDir);
                    if (key == null) continue;
                    Song cur = (Song) reps.get(key);
                    if (cur == null || s.getPath().compareTo(cur.getPath()) < 0) reps.put(key, s);
                }

                ArrayList keys = new ArrayList(reps.keySet());
                int m = keys.size();
                // ONE scale over everything, in the units above. The thumbnails from cover files are
                // known after the preparation, so the scale grows then; the percent shown never goes back.
                int rest = n * SONG_COST + (tags ? n * COMMIT_UNITS / COMMIT_ROWS : 0) + (flow ? m * FLOW_COST : 0);
                scale(m + rest);

                // replaced external artwork first: nothing else here can notice it
                long tStale = SystemClock.uptimeMillis();
                if (covers) {
                    for (int i = 0; i < n; i++) {
                        Song s = (Song) songs.get(i);
                        if (s == null || s.getPath() == null) continue;
                        if (!Art.coverChanged(s.getPath())) continue;
                        CoverCache.forget(Albums.keyOf(s, byDir));
                        BigCover.forget(s.getPath());
                        BigCover.forget(Albums.trackFolder(s.getPath()));
                    }
                }
                tStale = SystemClock.uptimeMillis() - tStale;

                // Albums: the thumbnails. What each needs is decided HERE, so workers never touch
                // the caches' lazy loading.
                ArrayList jobs = new ArrayList();
                // a thumbnail out of the tags is made by the song half from the picture it reads
                // anyway; one from a cover file needs no song opened and is made up front
                ArrayList early = new ArrayList();
                int fromFiles = 0;
                HashMap fromSongs = new HashMap();      // representative path -> AlbumJob
                for (int i = 0; i < m; i++) {
                    String key = (String) keys.get(i);
                    Song s = (Song) reps.get(key);
                    String path = s.getPath();
                    AlbumJob j = new AlbumJob();
                    j.key = key;
                    j.path = path;
                    j.thumb = covers && CoverCache.peek(key) == null;
                    j.art = j.thumb && Art.thumbFromTags(key, path);
                    jobs.add(j);
                    if (j.art) fromSongs.put(path, j);
                    else early.add(j);
                    if (j.thumb && !j.art) fromFiles++;
                    tick();
                }
                scale(m + rest + fromFiles * ALBUM_COST);
                tPrep = SystemClock.uptimeMillis() - tPrep0;
                earlyFiles = fromFiles;
                // Cover Flow's slides, too, from the picture the song half holds
                HashSet slides = new HashSet();
                if (flow) {
                    for (int i = 0; i < m; i++) slides.add(((Song) reps.get(keys.get(i))).getPath());
                }

                long t0 = SystemClock.uptimeMillis();
                runAlbums(early);
                tAlbums = SystemClock.uptimeMillis() - t0;

                // Songs, the expensive half. A metadata read costs the file OPEN, so everything a
                // song gives — disc, track number, artwork — comes from ONE (DiscCache.read). In
                // PATH order: BigCover compares against one folder's representative at a time.
                t0 = SystemClock.uptimeMillis();
                if (songs != null && n > 0) {
                    ArrayList byPath = new ArrayList(songs);
                    try {
                        Collections.sort(byPath, new ByPath());
                    } catch (Throwable t) {
                    }
                    Blocks q = Blocks.folders(byPath);
                    SongWorker[] w = new SongWorker[workers()];
                    for (int i = 0; i < w.length; i++) {
                        w[i] = new SongWorker(this, byPath, q, tags, covers, fromSongs, slides);
                    }
                    spread(w);
                    // what the Tags still hold until the commit: the pass's high-water mark
                    Runtime rt = Runtime.getRuntime();
                    heap = rt.totalMemory() - rt.freeMemory();
                    for (int i = 0; i < w.length; i++) {
                        unread += w[i].failed;
                        unwritten += w[i].unwritten;
                        steps.add(w[i].steps);
                        steps.cover(w[i].walk);
                    }
                    if (tags) {
                        long tc = SystemClock.uptimeMillis();
                        for (int i = 0; i < w.length; i++) w[i].commit();
                        DiscCache.flush();
                        tCommit = SystemClock.uptimeMillis() - tc;
                        committedAll(n);      // songs with no tags to write had their share too
                    }
                }
                tSongs = SystemClock.uptimeMillis() - t0;

                // what the song half could not do: its representative had nothing read this time
                t0 = SystemClock.uptimeMillis();
                ArrayList late = new ArrayList();
                Iterator it = fromSongs.values().iterator();
                while (it.hasNext()) {
                    AlbumJob j = (AlbumJob) it.next();
                    if (!j.done) late.add(j);
                }
                runAlbums(late);
                tAlbums += SystemClock.uptimeMillis() - t0;

                // Cover Flow: only slides the song half did not make, from the cached big covers
                t0 = SystemClock.uptimeMillis();
                if (flow) {
                    for (int i = 0; i < m; i++) {
                        String p = ((Song) reps.get(keys.get(i))).getPath();
                        java.io.File had = com.innioasis.ipp.FlowCache.file(p);
                        boolean fresh = had != null && !had.exists();
                        if (!Flow.cacheSlide(p)) unwritten++;
                        else if (fresh) touch((String) keys.get(i));
                        tick(FLOW_COST);
                    }
                }
                tFlow = SystemClock.uptimeMillis() - t0;

                // a pass that left anything out is not "already cached": the next press finishes it
                tick(total);                    // the shares are estimates: end on 100%
                if (unread == 0 && unwritten == 0) Albums.noteCached(a, n, stamp, mask);
                Diag.note("cache library: prepare " + tPrep + " ms (replaced covers " + tStale + " ms), "
                        + earlyFiles + " thumbnail(s) from cover files; albums " + tAlbums
                        + " ms (" + late.size() + " late), songs "
                        + tSongs + " ms (tags written " + tCommit + " ms), flow " + tFlow + " ms, "
                        + workers() + " workers, heap "
                        + (heap >> 20) + " MB; "
                        + unread + " file(s) did not read, " + unwritten + " cover(s) not written");
                Diag.note("cache library steps: " + steps.line());
                Diag.note("cache library cover: " + steps.coverLine());
            } catch (Throwable t) {
            } finally {
                // a pass that died half way still writes down what it learned
                try { BigCover.endCache(); } catch (Throwable t) { }
                try { Art.flushStamps(); } catch (Throwable t) { }
                if (done != -1) {
                    synchronized (touched) {
                        done = touched.size();
                    }
                }
                a.cacheFinished(done);
            }
        }
    }

    // The pass is bound by file opens, so it runs a small pool. Safe by how the work is split, not
    // by locks: a worker takes whole FOLDERS (a cover walk's representative never crosses threads),
    // writes only its own keys, and its answers are committed on the pass thread afterwards.

    /**
     * The workers' nice value: below the main thread's, so the progress animation keeps its CPU on
     * a dual-core chip. Not THREAD_PRIORITY_BACKGROUND — that moves the thread into the background
     * cgroup, and binder hands the caller's priority on to mediaserver, which does the reading.
     */
    private static final int WORKER_PRIORITY = 5;

    /** One more than the cores: on the dual-core chip 3 beats 2 and matches 4, with less heap. */
    private static int workers() {
        int c = Runtime.getRuntime().availableProcessors();
        if (c < 1) c = 1;
        int n = c + 1;
        if (n > 4) n = 4;
        return n;
    }

    /** Start them all, wait for all of them. A worker that dies must not hang the pass. */
    private static void spread(Runnable[] rs) {
        Thread[] ts = new Thread[rs.length];
        for (int i = 0; i < rs.length; i++) {
            ts[i] = new Thread(rs[i]);
            ts[i].start();
        }
        for (int i = 0; i < ts.length; i++) {
            try {
                ts[i].join();
            } catch (Throwable t) {
            }
        }
    }

    /** The workers' shared queue of index ranges — per folder, for {@link BigCover.Walk}. */
    static final class Blocks {
        private final int[] from;
        private final int[] to;
        private int next;

        private Blocks(int[] from, int[] to) {
            this.from = from;
            this.to = to;
        }

        /** Every item its own block — for albums, which share nothing with each other. */
        static Blocks each(int n) {
            int[] f = new int[n];
            int[] t = new int[n];
            for (int i = 0; i < n; i++) {
                f[i] = i;
                t[i] = i + 1;
            }
            return new Blocks(f, t);
        }

        /** Runs of songs sharing a folder. The list must already be in path order. */
        static Blocks folders(List byPath) {
            int n = byPath.size();
            int[] f = new int[n];
            int[] t = new int[n];
            int count = 0;
            int start = 0;
            String cur = null;
            for (int i = 0; i < n; i++) {
                Object o = byPath.get(i);
                String p = (o instanceof Song) ? ((Song) o).getPath() : null;
                String dir = p == null ? "" : Albums.trackFolder(p);
                if (cur == null) {
                    cur = dir;
                } else if (!cur.equals(dir)) {
                    f[count] = start;
                    t[count] = i;
                    count++;
                    start = i;
                    cur = dir;
                }
            }
            if (n > 0) {
                f[count] = start;
                t[count] = n;
                count++;
            }
            int[] ff = new int[count];
            int[] tt = new int[count];
            System.arraycopy(f, 0, ff, 0, count);
            System.arraycopy(t, 0, tt, 0, count);
            return new Blocks(ff, tt);
        }

        synchronized int take() {
            return next < from.length ? next++ : -1;
        }

        int from(int b) { return from[b]; }

        int to(int b) { return to[b]; }
    }

    /**
     * Where the song half's time went, summed over the workers (so above the wall time): the open
     * with every tag, the picture, the big cover, the thumbnail, the slide — and the open per format.
     */
    static final class Steps {
        long files, openNs, artNs, coverNs, thumbNs, slideNs;
        final HashMap byExt = new HashMap();      // extension -> long[]{files, open ns, read by ours}

        void read(String path, DiscCache.Tags t) {
            files++;
            openNs += t.openNs;
            artNs += t.artNs;
            int dot = path.lastIndexOf('.');
            String ext = dot < 0 ? "?" : path.substring(dot + 1).toLowerCase();
            long[] e = (long[]) byExt.get(ext);
            if (e == null) byExt.put(ext, e = new long[3]);
            e[0]++;
            e[1] += t.openNs;
            if (t.ours) e[2]++;
        }

        // BigCover.cache's own breakdown, one Walk per worker
        long embedded, external, none, sameBytes, verbatim, encoded, samePixels, own, coverFailed;
        long externalNs, extLookups, decodeNs, storeNs, srcDecodeNs, encodeNs, probes, writeNs;

        void cover(BigCover.Walk w) {
            srcDecodeNs += w.srcDecodeNs;
            encodeNs += w.encodeNs;
            probes += w.probes;
            writeNs += w.writeNs;
            embedded += w.embedded;
            external += w.external;
            none += w.none;
            sameBytes += w.sameBytes;
            verbatim += w.verbatim;
            encoded += w.encoded;
            samePixels += w.samePixels;
            own += w.own;
            coverFailed += w.failed;
            externalNs += w.externalNs;
            extLookups += w.extLookups;
            decodeNs += w.decodeNs;
            storeNs += w.storeNs;
        }

        String coverLine() {
            return "picture from tags " + embedded + ", from a cover file " + external + ", none " + none
                    + "; same bytes " + sameBytes + ", new album stored as is " + verbatim
                    + ", re-encoded " + encoded + ", same pixels " + samePixels + ", own " + own
                    + ", failed " + coverFailed + "; cover file read " + externalNs / 1000000L
                    + " ms (" + extLookups + " folders looked up), decode " + decodeNs / 1000000L + " ms, encode+write " + storeNs / 1000000L
                    + " ms (source decode " + srcDecodeNs / 1000000L + " ms, " + probes + " encodes "
                    + encodeNs / 1000000L + " ms, write " + writeNs / 1000000L + " ms)";
        }

        void add(Steps s) {
            files += s.files;
            openNs += s.openNs;
            artNs += s.artNs;
            coverNs += s.coverNs;
            thumbNs += s.thumbNs;
            slideNs += s.slideNs;
            Iterator it = s.byExt.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry en = (Map.Entry) it.next();
                long[] v = (long[]) en.getValue();
                long[] e = (long[]) byExt.get(en.getKey());
                if (e == null) byExt.put(en.getKey(), e = new long[3]);
                e[0] += v[0];
                e[1] += v[1];
                e[2] += v[2];
            }
        }

        String line() {
            StringBuilder sb = new StringBuilder();
            sb.append(files).append(" files, open ").append(openNs / 1000000L)
                    .append(" ms, art ").append(artNs / 1000000L)
                    .append(" ms, cover ").append(coverNs / 1000000L)
                    .append(" ms, thumb ").append(thumbNs / 1000000L)
                    .append(" ms, slide ").append(slideNs / 1000000L).append(" ms;");
            Iterator it = byExt.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry en = (Map.Entry) it.next();
                long[] v = (long[]) en.getValue();
                sb.append(' ').append(en.getKey()).append(' ').append(v[0])
                        .append(" x ").append(v[0] > 0 ? v[1] / v[0] / 1000000L : 0).append(" ms (ours ").append(v[2]).append(")");
            }
            return sb.toString();
        }
    }

    /** One album's worth of work, and the answers coming back from the worker. */
    static final class AlbumJob {
        String key;
        String path;
        boolean thumb;       // build the 50px thumbnail
        boolean art;         // ... and it has to come out of the tags, not a cover file
        boolean done;        // made by the song half; read after the join
    }

    /** Opens one album's representative and builds its thumbnail; writes no cache but the covers'. */
    static final class AlbumWorker implements Runnable {
        private final CacheTask task;
        private final List jobs;
        private final Blocks q;

        AlbumWorker(CacheTask task, List jobs, Blocks q) {
            this.task = task;
            this.jobs = jobs;
            this.q = q;
        }

        public void run() {
            try { android.os.Process.setThreadPriority(WORKER_PRIORITY); } catch (Throwable t) { }
            int b;
            while ((b = q.take()) >= 0) {
                for (int i = q.from(b); i < q.to(b); i++) {
                    AlbumJob j = (AlbumJob) jobs.get(i);
                    if (j.thumb) task.touch(j.key);
                    try {
                        album(j);
                    } catch (Throwable t) {
                    }
                    task.tick(j.thumb && !j.art ? CacheTask.ALBUM_COST : 0);   // late ones ride the songs' share
                }
            }
        }
    }

    /** Reads one folder's songs; the covers are done here, the tags are handed back for committing. */
    static final class SongWorker implements Runnable {
        private final CacheTask task;
        private final List byPath;
        private final Blocks q;
        private final boolean tags;
        private final boolean covers;
        private final ArrayList paths = new ArrayList();
        private final ArrayList read = new ArrayList();
        private final Map thumbs;          // representative path -> AlbumJob; read only
        private final HashSet slides;      // Cover Flow's representatives; read only
        int failed;
        int unwritten;
        final Steps steps = new Steps();
        final BigCover.Walk walk = new BigCover.Walk();

        SongWorker(CacheTask task, List byPath, Blocks q, boolean tags, boolean covers,
                   Map thumbs, HashSet slides) {
            this.task = task;
            this.byPath = byPath;
            this.q = q;
            this.tags = tags;
            this.covers = covers;
            this.thumbs = thumbs;
            this.slides = slides;
        }

        public void run() {
            try { android.os.Process.setThreadPriority(WORKER_PRIORITY); } catch (Throwable t) { }
            BigCover.Walk w = walk;
            int b;
            while ((b = q.take()) >= 0) {
                for (int i = q.from(b); i < q.to(b); i++) {
                    try {
                        one(w, (Song) byPath.get(i));
                    } catch (Throwable t) {
                        failed++;
                    }
                    task.tick(CacheTask.SONG_COST);
                }
                w.done();          // end of this folder: let go of its representative
            }
        }

        private void one(BigCover.Walk w, Song s) {
            if (s == null || s.getPath() == null) return;
            String path = s.getPath();
            boolean wantTags = tags && !DiscCache.known(path);
            boolean wantArt = covers && BigCover.needs(path);
            if (!wantTags && !wantArt) return;          // nothing left to learn about it
            DiscCache.Tags t = DiscCache.read(path, wantTags, wantArt);
            steps.read(path, t);
            if (!t.ok) {
                failed++;                               // left unknown: read when it is next asked for
                return;
            }
            task.touch(Albums.keyOf(s));
            if (wantArt) {
                long t0 = System.nanoTime();
                boolean stored = BigCover.cache(w, path, t.art);
                steps.coverNs += System.nanoTime() - t0;
                if (!stored) {
                    unwritten++;
                } else {
                    // the same picture, at the other two sizes: no second open, no read-back
                    AlbumJob j = (AlbumJob) thumbs.get(path);
                    if (j != null) {
                        t0 = System.nanoTime();
                        Art.hint(path, t.art);
                        try {
                            CoverCache.get(j.key, path);
                        } finally {
                            Art.hint(null, null);
                        }
                        j.done = true;
                        steps.thumbNs += System.nanoTime() - t0;
                    }
                    if (t.art != null && slides.contains(path)) {
                        t0 = System.nanoTime();
                        Flow.slideFrom(path, t.art);
                        steps.slideNs += System.nanoTime() - t0;
                    }
                }
            }
            // the answer is kept until the commit; a library of pictures does not fit the heap
            t.art = null;
            if (wantTags) {
                paths.add(path);
                read.add(t);
            }
        }

        /** On the pass thread, after every worker has finished; written in portions that move the scale. */
        void commit() {
            int k = 0;
            for (int i = 0; i < paths.size(); i++) {
                DiscCache.commit((String) paths.get(i), (DiscCache.Tags) read.get(i));
                read.set(i, null);
                if (++k == CacheTask.COMMIT_BATCH) {
                    DiscCache.flush();
                    task.committed(k);
                    k = 0;
                }
            }
            task.committed(k);
        }
    }

    /**
     * An album's thumbnail, its embedded picture from ONE {@code setDataSource} on the
     * representative; its tags come from the song half. The thumbnail's priority is untouched: a
     * pinned song or a cover file still wins.
     */
    private static void album(AlbumJob j) {
        if (j == null || j.path == null) return;
        if (!j.art) {
            // the thumbnail may still come from a cover file: no metadata read
            if (j.thumb) CoverCache.get(j.key, j.path);
            return;
        }

        byte[] art = null;
        MediaMetadataRetriever r = new MediaMetadataRetriever();
        try {
            r.setDataSource(j.path);
            art = r.getEmbeddedPicture();
        } catch (Throwable t) {
        }
        try { r.release(); } catch (Throwable t) { }

        if (j.thumb) {
            // the hint is Art.thumb's LAST resort, held per thread
            if (j.art) Art.hint(j.path, art);
            try {
                CoverCache.get(j.key, j.path);
            } finally {
                Art.hint(null, null);
            }
        }
    }

    /** The cover pass wants a folder's songs together. */
    private static final class ByPath implements Comparator {
        @Override
        public int compare(Object a, Object b) {
            String x = a instanceof Song ? ((Song) a).getPath() : null;
            String y = b instanceof Song ? ((Song) b).getPath() : null;
            if (x == null) return y == null ? 0 : -1;
            if (y == null) return 1;
            return x.compareTo(y);
        }
    }

    /** Dismiss + report: how many albums were cached, or "already cached". */
    private static final class CacheDone implements Runnable {
        private final IppActivity a;
        private final int albums;

        CacheDone(IppActivity a, int albums) {
            this.a = a;
            this.albums = albums;
        }

        @Override
        public void run() {
            LoadingDialog d = a.progress;
            a.progress = null;
            if (d != null) {
                try { d.dismiss(); } catch (Throwable t) { }
            }
            Diag.note("cache library finished: " + albums + " album(s) cached");
            String msg = albums <= 0
                    ? a.getString(R.string.ipp_cache_none)
                    : a.getString(R.string.ipp_cache_result, new Object[]{Integer.valueOf(albums)});
            Toast.makeText(a.getContext(), msg, Toast.LENGTH_LONG).show();
        }
    }

    /** Progress text update (LoadingDialog.show(String) sets the text and keeps it showing). */
    private static final class Tick implements Runnable {
        private final IppActivity a;
        private final String text;

        Tick(IppActivity a, String text) {
            this.a = a;
            this.text = text;
        }

        @Override
        public void run() {
            LoadingDialog d = a.progress;
            if (d != null && d.isShowing()) Loading.show(d, text);
        }
    }

    /** Dismiss + report: how many rows were re-read, or "already up to date". */
    private static final class Done implements Runnable {
        private final IppActivity a;
        private final int updated;

        Done(IppActivity a, int updated) {
            this.a = a;
            this.updated = updated;
        }

        @Override
        public void run() {
            LoadingDialog d = a.progress;
            a.progress = null;
            if (d != null) {
                try { d.dismiss(); } catch (Throwable t) { }
            }
            Diag.note("update library finished: " + updated + " song(s) re-read");
            String msg = updated == 0
                    ? a.getString(R.string.ipp_scan_none)
                    : a.getString(R.string.ipp_scan_result, new Object[]{Integer.valueOf(updated)});
            Toast.makeText(a.getContext(), msg, Toast.LENGTH_LONG).show();
        }
    }

    /** LoadingDialog's back-key callback; it is not cancellable. */
    private static final class Noop implements Function0 {
        @Override
        public Object invoke() {
            return Unit.INSTANCE;
        }
    }

    @Override
    public void direction(BaseActivity.Direction d) {
        if (d == BaseActivity.Direction.TOP) {
            // the innermost thing open: the edit, the section, the group, then the screen
            if (editing) { endEdit(false); return; }
            if (group >= 0 && ((Item) items.get(group)).type == SUB) {
                // a menu row left with none of its rows on goes off with them
                if ("main_menu".equals(((Item) items.get(group)).key)) MainMenu.settle(this);
                show(groupOf[group], group);
                return;
            }
            if (group >= 0) { show(-1, -1); return; }
            finish();
        }
    }

    /** A long top press on a row shows its help from {@code assets/help/<lang>.txt}. */
    @Override
    public void longConfirm() {
        if (editing) return;
        if (group < 0) return;             // a group has no description
        if (items == null || sel < 0 || sel >= items.size()) return;
        Item it = (Item) items.get(sel);
        if (it.type == HEADER || it.key == null) return;
        List blocks = Help.blocks(this, it.key);
        if (blocks.isEmpty()) return;
        new HelpDialog(getActivity(), label(it), blocks).show();
    }

    /** The rows as last built, for {@code {row:<key>}} in a description. */
    private static List lastItems;

    /** A row's name for {@code {row:<key>}}, or null when this screen has never been built. */
    public static String labelOf(String key) {
        List l = lastItems;
        if (l == null || key == null) return null;
        for (int i = 0; i < l.size(); i++) {
            Item it = (Item) l.get(i);
            if (key.equals(it.key)) return label(it);
        }
        return null;
    }

    /** The asset's name for the row, or its key. */
    private static String label(Item it) {
        return it.label != null ? it.label : it.key;
    }

    /** The hint shown on entry: its asset row, and the "don't show again" flag. */
    private static final String TIP = "menu_tip";
    private static final String TIP_OFF = "menu_hint_off";
    private com.innioasis.ipp.TipDialog tip;

    @Override
    protected void onDestroy() {
        try {
            if (tip != null && tip.isShowing()) tip.dismiss();
        } catch (Throwable t) {
        }
        tip = null;
        super.onDestroy();
    }

    @Override
    public void quit() {
        endEdit(false);
        finish();
    }
}
