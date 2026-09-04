package com.innioasis.y1.activity;

import android.graphics.Color;
import android.graphics.Typeface;
import android.media.MediaMetadataRetriever;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import com.innioasis.ipp.AlbumArtist;
import com.innioasis.ipp.AlbumInfo;
import com.innioasis.ipp.Albums;
import com.innioasis.ipp.Alpha;
import com.innioasis.ipp.Art;
import com.innioasis.ipp.Artists;
import com.innioasis.ipp.BigCover;
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
import com.innioasis.ipp.Keys;
import com.innioasis.ipp.Pad;
import com.innioasis.ipp.Panel;
import com.innioasis.ipp.Pick;
import com.innioasis.ipp.PickDialog;
import com.innioasis.ipp.Prefs;
import com.innioasis.ipp.TrackCache;
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
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/**
 * innioasis++ settings screen (reuses ActivityAboutBinding). Click-wheel driven:
 * UP/DOWN move focus over the visible selectable rows, centre/ENTER activates, top button
 * (MENU short-press) closes.
 *
 * The menu is a DECLARATIVE model ({@link #buildItems()}): each entry is one {@link Item}
 * (group header, toggle, choice or action). render / navigation / confirm all iterate that
 * list generically, so adding a row or a whole group is a single line in buildItems() -- no
 * fixed indices anywhere. Headers are skipped by navigation; a row with {@code showIf} set is
 * hidden unless that pref is on (e.g. likes_names only when likes is on).
 *
 * Authored in Java (build/ipp-java) and compiled to smali; do not hand-edit the generated
 * IppActivity*.smali. Raw collection types are used deliberately (the bundled d8 crashes on
 * generic Signature attributes); API is kept <= 17.
 */
public final class IppActivity extends BaseActivity {

    // item kinds
    private static final int HEADER = 0;   // non-selectable group title
    private static final int TOGGLE = 1;   // On/Off boolean pref
    private static final int CHOICE = 2;   // cycles through choices[] (string resources)
    private static final int ACTION = 3;   // runs an action on confirm
    // Like CHOICE, but choices[] holds the numbers themselves and the row shows them as-is.
    // A plain number is the same in every language, so this needs no string resources at all.
    private static final int NUMBER = 4;

    private static final int ACCENT = Color.parseColor("#3CFFDE");

    /**
     * One menu entry. Headers use only the label; the rest is per-kind.
     *
     * <p>Every word of it comes from the help asset — {@code label}, {@code values} and
     * {@code showIf} are filled in by {@link #buildItems()} from {@code Help.rows}. Nothing here
     * carries a string resource any more: keeping the names in {@code strings.xml} as well meant
     * writing every new row twice, and a second copy that is only ever a fallback is a copy that
     * silently goes stale. A row the asset does not name shows its KEY instead, which is never
     * blank and says exactly which line of which file is missing.
     */
    private static final class Item {
        final int type;
        final String key;      // TOGGLE/CHOICE: pref key; ACTION: action id; HEADER: group name
        final int count;       // CHOICE/NUMBER: how many values the row runs over
        final int[] choices;   // NUMBER: the values themselves (a CHOICE's are words, so asset-only)

        String label;          // from the asset; null shows the key
        String[] values;       // CHOICE: from the asset; null shows the index
        String showIf;         // if non-null, row shown only while that pref is on

        // What the row answers before anyone touches it is NOT here: it lives once, in
        // Prefs.DEFAULTS, and both this screen and the feature itself read it from there. A row
        // that carried its own copy is how a setting comes to say "On" over a feature behaving
        // as "Off" -- see the table's own comment.
        Item(int type, String key, int count, int[] choices, String showIf) {
            this.type = type;
            this.key = key;
            this.count = count;
            this.choices = choices;
            this.showIf = showIf;
        }
    }

    private List items;                 // List<Item>
    private View[] rowViews;            // container child per item (header TextView or row LinearLayout)
    private TextView[] labels;          // per item (null for headers)
    private TextView[] values;          // per item (null for headers)
    private TextView[] marks;           // the sub-item arrow, where a row has one
    private int sel;                    // index into items of the focused selectable+visible row
    private ScrollView scroller;

    // NUMBER edit mode: centre press opens the row for editing, the wheel then picks the value
    // instead of moving the cursor. The blinking value is what says "the wheel is in here now".
    private static final long BLINK_MS = 400;
    private boolean editing;
    private int editIndex;              // index into items of the row being edited
    private int editVal;                // candidate index into that item's choices[]
    private Blink blink;

    /**
     * The menu, arranged the way the help asset says and behaving the way {@link #registry()} says.
     *
     * <p>Order, grouping, names and {@code showIf} all come from {@code assets/help/en.txt} —
     * English alone, so a translator can regroup nothing by accident. The registry supplies what a
     * text file cannot: the kind of each row, its preference key, its default, and the numbers a
     * NUMBER row runs over.
     *
     * <p>Nothing the asset says can LOSE a setting, which is the whole reason the registry keeps
     * its own order: a row the file forgets is appended at the end rather than dropped, a key the
     * file invents is skipped, and an asset that cannot be read at all leaves the menu exactly as
     * it was before any of this existed.
     *
     * <p>A row whose {@code showIf} is set is a SUB-ITEM of the row it depends on and is drawn
     * with the arrow that says so; there is no separate flag, because a row that only exists while
     * another one is on IS that row's sub-item.
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
            if (it == null || used.contains(r.key)) continue;   // a key nothing in the app answers
            used.add(r.key);
            it.label = r.label;
            it.showIf = r.showIf;
            if (it.type == CHOICE && r.values != null && r.values.length == it.count) {
                it.values = r.values;
            }
            out.add(it);
        }
        // Whatever the file did not mention keeps its place at the end, headers included: a typo
        // must cost the arrangement of one row, never the row itself.
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
     * Every row the app can actually draw, with what it DOES and a sane order to fall back on.
     *
     * <p>The groups here are the user's ([Tools], [Now Playing], [Menu], [Metadata], [System]) —
     * the rows are grouped by WHERE their effect is seen, not by what they technically are, which
     * is why the two "titles from metadata" switches sit with the tags and the two "top button
     * hold" ones sit with the player. The asset may rearrange all of it; this is what stands when
     * it does not.
     */
    private List registry() {
        List l = new ArrayList();

        // [Tools] -- device actions, pinned at the very top
        l.add(new Item(HEADER, "tools", 0, null, null));
        l.add(new Item(ACTION, "reboot", 0, null, null));
        l.add(new Item(ACTION, "cache", 0, null, null));
        l.add(new Item(ACTION, "scan", 0, null, null));
        // #228.2: one file to attach to a bug report -- build, settings, library, logcat. See Diag.
        l.add(new Item(ACTION, "log", 0, null, null));
        // A diagnostic, not a feature: restarts SurfaceFlinger and writes a report to the card, so
        // the one defect we cannot reproduce -- the whole screen drawn shifted sideways -- can be
        // told apart from a panel fault at the moment it happens, with no PC in reach. See Panel.
        //
        // It is only OFFERED in debug mode (five centre presses on Settings -> About), because it
        // is only ever wanted by someone who has been asked for it: it kills the compositor, and
        // on a healthy device that is a black screen and a wait for nothing. showIf is no use here
        // -- it reads a preference, and the mode is a file on the card, read by stock's Timber tree
        // as well -- so the row simply is not built. buildItems runs per screen open, so the row
        // appears as soon as the mode is on.
        if (Diag.on()) l.add(new Item(ACTION, "sf", 0, null, null));

        // [Now Playing] -- everything whose effect is seen on the player screen
        l.add(new Item(HEADER, "player", 0, null, null));
        l.add(new Item(CHOICE, "icon_tint", 3, null, null));
        l.add(new Item(TOGGLE, Cover.KEY_TILT, 0, null, null));
        // Two rows, one question, asked per section: what the long top press does in the player.
        // They carry their own labels rather than the group telling them apart, because they no
        // longer sit in groups of their own.
        l.add(new Item(CHOICE, "top_hold", 3, null, null));
        l.add(new Item(CHOICE, "book_top_hold", 2, null, null));
        l.add(new Item(TOGGLE, "first_artist_only", 0, null, null));
        l.add(new Item(TOGGLE, "feat_in_title", 0, null, "first_artist_only"));

        // [Menu] -- how the lists behave under the wheel
        l.add(new Item(HEADER, "menu", 0, null, null));
        l.add(new Item(TOGGLE, "alpha_scroll", 0, null, null));
        l.add(new Item(NUMBER, "alpha_threshold", Alpha.THRESHOLDS.length, Alpha.THRESHOLDS, null));
        l.add(new Item(TOGGLE, "follow_playing", 0, null, null));
        l.add(new Item(NUMBER, Follow.KEY_IDLE, Follow.IDLES.length, Follow.IDLES, null));
        l.add(new Item(TOGGLE, Pad.KEY, 0, null, null));

        // [Metadata] -- what is read out of a tag and what is done with it
        l.add(new Item(HEADER, "metadata", 0, null, null));
        l.add(new Item(TOGGLE, "meta_title", 0, null, null));
        l.add(new Item(TOGGLE, "book_meta_title", 0, null, null));
        l.add(new Item(TOGGLE, "album_year", 0, null, null));
        l.add(new Item(TOGGLE, "track_numbers", 0, null, null));
        l.add(new Item(TOGGLE, Artists.KEY_SPLIT, 0, null, null));
        l.add(new Item(TOGGLE, GenreSplit.KEY_SPLIT, 0, null, null));
        l.add(new Item(TOGGLE, Albums.KEY_SCOPE, 0, null, null));

        // [System] -- the device rather than the music
        l.add(new Item(HEADER, "system", 0, null, null));
        l.add(new Item(TOGGLE, "delete_folder", 0, null, null));
        l.add(new Item(TOGGLE, "keep_awake", 0, null, null));
        l.add(new Item(TOGGLE, "likes", 0, null, null));
        // "Show likes next to song names" (likes_names) is deliberately NOT built: the toggle
        // exists and does nothing yet. Its preference stays for when it does.
        l.add(new Item(CHOICE, Keys.KEY_SECOND, 2, null, null));

        return l;
    }

    /**
     * The theme's font. The app theme sets {@code android:typeface="monospace"} and ThemeManager
     * swaps {@code Typeface.MONOSPACE} for the theme's font.ttf (or plain {@code DEFAULT} when the
     * theme carries none), so reading that field is how code-built views follow the theme —
     * a hard-coded {@code DEFAULT_BOLD} would ignore it. Read per call: the field changes when
     * the theme does.
     */
    private static Typeface font() {
        return Typeface.create(Typeface.MONOSPACE, Typeface.BOLD);
    }

    private boolean visible(Item it) {
        return it.showIf == null || Prefs.on(this, it.showIf);
    }

    /** A TOGGLE's state, with {@code def == 1} meaning "On until switched off". */
    private boolean toggleOn(Item it) {
        return Prefs.on(this, it.key);
    }

    private boolean selectable(int i) {
        Item it = (Item) items.get(i);
        return it.type != HEADER && visible(it);
    }

    private int firstSelectable() {
        for (int i = 0; i < items.size(); i++) {
            if (selectable(i)) return i;
        }
        return 0;
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

        LinearLayout container = new LinearLayout(this);
        container.setOrientation(LinearLayout.VERTICAL);
        container.setPadding(8, 0, 8, 0);

        items = buildItems();
        lastItems = items;
        int n = items.size();
        rowViews = new View[n];
        labels = new TextView[n];
        values = new TextView[n];
        marks = new TextView[n];

        for (int i = 0; i < n; i++) {
            Item it = (Item) items.get(i);
            if (it.type == HEADER) {
                // A group caption has to be told apart from a row WITHOUT relying on colour: with
                // some themes every line on this screen is painted the same, focused or not, so a
                // smaller, bolder font is not enough to read as a heading. It is BANDED instead —
                // a rule along its top edge and another along its bottom — because a line is a
                // shape rather than a shade, and nothing else on this screen has one.
                LinearLayout hb = new LinearLayout(this);
                hb.setOrientation(LinearLayout.VERTICAL);

                hb.addView(rule(), new LinearLayout.LayoutParams(-1, 2));

                TextView h = new TextView(this);
                h.setTextSize(13.0f);
                // Two-argument setTypeface, never Typeface.create: only this form fakes bold for a
                // theme font that carries no bold cut (see the Shuffle row in ipp-stock-ui-theming).
                h.setTypeface(font(), Typeface.BOLD);
                h.setIncludeFontPadding(false);
                h.setGravity(Gravity.CENTER_VERTICAL);
                h.setPadding(6, 8, 6, 8);
                h.setText(label(it));
                hb.addView(h, new LinearLayout.LayoutParams(-1, -2));

                hb.addView(rule(), new LinearLayout.LayoutParams(-1, 2));

                rowViews[i] = hb;
                labels[i] = h;          // headers keep their caption here so render() can paint it
                LinearLayout.LayoutParams hp = new LinearLayout.LayoutParams(-1, -2);
                hp.topMargin = 6;
                hp.bottomMargin = 4;
                container.addView(hb, hp);
            } else {
                // Full-width row carries the highlight, but its height is fixed to the text:
                // a theme's selected background can be a large bitmap and would otherwise
                // stretch the row to the bitmap's own height. Text is centred vertically.
                LinearLayout row = new LinearLayout(this);
                row.setOrientation(LinearLayout.HORIZONTAL);
                row.setBaselineAligned(false);
                row.setGravity(Gravity.CENTER_VERTICAL);
                row.setPadding(5, 0, 5, 0);

                // A row that exists only while another one is on is that row's SUB-ITEM, and says
                // so with an arrow leading the label. It is the docs' own "\u21b4" turned 180
                // degrees -- which is exactly "flipped and mirrored": it then points upwards and
                // runs right to left, back towards the row it belongs to. Rotating the glyph
                // rather than picking a ready-made character keeps the theme's font and asks the
                // font for nothing it may not carry (the up-and-leftwards arrows live in a much
                // rarer Unicode block than this one).
                if (it.showIf != null) {
                    TextView mark = new TextView(this);
                    mark.setTextSize(13.0f);
                    mark.setTypeface(font());
                    mark.setIncludeFontPadding(false);
                    mark.setGravity(Gravity.CENTER);
                    mark.setText("\u21b4");
                    mark.setRotation(180.0f);
                    LinearLayout.LayoutParams mp = new LinearLayout.LayoutParams(-2, -1);
                    mp.rightMargin = 3;
                    row.addView(mark, mp);
                    marks[i] = mark;
                }

                TextView label = new TextView(this);
                label.setTextSize(17.0f);
                label.setTypeface(font());
                label.setIncludeFontPadding(false);
                label.setGravity(Gravity.CENTER_VERTICAL);
                LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, -1);
                lp.weight = 1.0f;
                row.addView(label, lp);

                TextView value = new TextView(this);
                value.setTextSize(17.0f);
                value.setTypeface(font());
                value.setIncludeFontPadding(false);
                value.setGravity(Gravity.CENTER_VERTICAL);
                value.setPadding(6, 0, 6, 0);
                row.addView(value, -2, -2);

                rowViews[i] = row;
                labels[i] = label;
                values[i] = value;

                LinearLayout.LayoutParams rp = new LinearLayout.LayoutParams(-1,
                        (int) (label.getTextSize() * 3.0f));   // 2x the text-fitted height
                rp.topMargin = 2;
                rp.bottomMargin = 2;
                container.addView(row, rp);
            }
        }

        scroller = new ScrollView(this);
        scroller.addView(container, -1, -2);
        root.addView(scroller, -1, -1);

        sel = firstSelectable();
        render();
    }

    private void render() {
        clampSel();
        for (int i = 0; i < items.size(); i++) {
            Item it = (Item) items.get(i);
            if (it.type == HEADER) {
                TextView h = labels[i];
                // Ask the theme for its ORDINARY item colour ("false"), the same one the CD strip
                // takes: a theme is free to highlight with a colour that barely shows against its
                // own background, and a caption painted in it is hard to read wherever it does.
                // What sets the caption apart is the rules and the band below -- shape rather than
                // shade, which no theme can wash out.
                ThemeManager.INSTANCE.itemSetTextColor(h,
                        getResources().getColor(R.color.selected_text_color), false);
                // The rules are the caption own colour, thinned out, and read AFTER the theme has
                // had its say -- so they follow whatever colour the caption actually ended up
                // with, dark on a light theme and light on a dark one, with nothing to configure.
                int rgb = h.getCurrentTextColor() & 0x00FFFFFF;
                LinearLayout hb = (LinearLayout) rowViews[i];
                for (int c = 0; c < hb.getChildCount(); c++) {
                    View kid = hb.getChildAt(c);
                    if (!(kid instanceof TextView)) kid.setBackgroundColor(rgb | 0x59000000);
                }
                // The strip between the rules is washed with the same colour, far weaker: enough
                // to read as a band at a glance, not enough to look like the cursor is standing on
                // it. (setBackgroundColor on a view that had no background asks for a layout —
                // harmless here, this runs when the screen is built and on a value change, never
                // on the wheel's own path, which repaints two rows through paint().)
                hb.setBackgroundColor(rgb | 0x2E000000);
                continue;
            }

            LinearLayout row = (LinearLayout) rowViews[i];
            boolean vis = visible(it);
            row.setVisibility(vis ? View.VISIBLE : View.GONE);
            if (!vis) continue;

            labels[i].setText(label(it));
            values[i].setText(valueText(it));

            paint(i);
        }
        scrollToSel();
    }

    /**
     * Move the highlight without rebuilding the menu — what a wheel click actually needs.
     *
     * {@link #render} touches every row: two getString calls, a ThemeManager background and two
     * ThemeManager text colours each. That is fine once, but the wheel's speed util replays a
     * click up to eleven times inside one key event, so a fast scroll ran it eleven times over
     * ~20 rows. Only two rows ever change appearance, and the scroll is coalesced (see
     * {@link #postScroll}) so a burst ends in one animation instead of eleven restarts.
     */
    private void move(int old) {
        clampSel();
        if (old == sel) return;
        paint(old);
        paint(sel);
        postScroll();
    }

    /** Apply the focused/unfocused look to one row. */
    /**
     * One band of a group caption. A bare View: its colour cannot be chosen here, because it is
     * taken from the caption AFTER the theme has painted it (see {@link #render()}).
     */
    private View rule() {
        return new View(this);
    }

    private void paint(int i) {
        if (rowViews == null || i < 0 || i >= rowViews.length) return;
        Item it = (Item) items.get(i);
        if (it.type == HEADER || rowViews[i] == null) return;
        if (rowViews[i].getVisibility() != View.VISIBLE) return;
        boolean on = (i == sel);
        int fg = on ? ACCENT : -1;
        ThemeManager.INSTANCE.itemSetBackground(rowViews[i], on ? R.drawable.item_setting_sel : 0, on);
        ThemeManager.INSTANCE.itemSetTextColor(labels[i], fg, on);
        ThemeManager.INSTANCE.itemSetTextColor(values[i], fg, on);
        if (marks[i] != null) ThemeManager.INSTANCE.itemSetTextColor(marks[i], fg, on);
    }

    /** One scroll per burst of clicks, not one per click. */
    private void postScroll() {
        if (scroller == null || scrollPending) return;
        scrollPending = true;
        scroller.post(new Scroll(this));
    }

    private boolean scrollPending;

    /** Named (d8 here crashes on anonymous classes). */
    static final class Scroll implements Runnable {
        private final IppActivity a;
        Scroll(IppActivity a) { this.a = a; }
        public void run() {
            a.scrollPending = false;
            a.scrollToSel();
        }
    }

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

    private void scrollToSel() {
        if (scroller == null || rowViews == null || sel < 0 || sel >= rowViews.length) return;
        View v = rowViews[sel];
        if (v == null) return;
        // When focus is on the top-most selectable row, snap to the very top so the group
        // header sitting above it stays visible (otherwise scrolling up stops at the row's top).
        if (sel == firstSelectable()) {
            scroller.smoothScrollTo(0, 0);
            return;
        }
        int top = v.getTop();
        int bottom = v.getBottom();
        int scrollY = scroller.getScrollY();
        int h = scroller.getHeight();
        if (top < scrollY) {
            scroller.smoothScrollTo(0, top);
        } else if (bottom > scrollY + h) {
            scroller.smoothScrollTo(0, bottom - h);
        }
    }

    private int step(int from, int dir) {
        int i = from + dir;
        while (i >= 0 && i < items.size()) {
            if (selectable(i)) return i;
            i += dir;
        }
        return from;
    }

    @Override
    public void clockwise() {
        if (editing) { spin(1); return; }
        int old = sel;
        sel = step(sel, 1);
        move(old);
    }

    @Override
    public void antiClockwise() {
        if (editing) { spin(-1); return; }
        int old = sel;
        sel = step(sel, -1);
        move(old);
    }

    // ---------------------------------------------------------------- NUMBER edit mode

    /**
     * A NUMBER row is not cycled by repeated presses: the centre button opens it, the wheel then
     * runs over the values (wrapping at both ends), and the next centre press takes the one shown
     * while the top button puts the old one back. Repeated presses would mean 11 of them to get
     * from 5 to 60, and no way to change your mind on the way.
     */
    private void startEdit(Item it) {
        editing = true;
        editIndex = sel;
        editVal = Prefs.val(this, it.key);
        if (editVal < 0 || editVal >= it.count) editVal = Prefs.defInt(it.key);
        if (blink == null) blink = new Blink(this);
        showCandidate(it);
    }

    /** Wrapped both ways: 60 -> 5 going on, 5 -> 60 going back. */
    private void spin(int dir) {
        Item it = (Item) items.get(editIndex);
        int n = it.count;
        editVal = ((editVal + dir) % n + n) % n;
        showCandidate(it);
    }

    /** Paint the candidate and restart the blink from "visible", so a fresh value is readable. */
    private void showCandidate(Item it) {
        TextView v = values[editIndex];
        if (v == null) return;
        v.setText(String.valueOf(it.choices[editVal]));
        v.removeCallbacks(blink);
        v.setVisibility(View.VISIBLE);
        v.postDelayed(blink, BLINK_MS);
    }

    void blinkTick() {
        if (!editing) return;
        TextView v = values[editIndex];
        if (v == null) return;
        v.setVisibility(v.getVisibility() == View.VISIBLE ? View.INVISIBLE : View.VISIBLE);
        v.postDelayed(blink, BLINK_MS);
    }

    /** Leave edit mode; {@code commit} false simply drops the candidate and re-reads the pref. */
    private void endEdit(boolean commit) {
        if (!editing) return;
        editing = false;
        Item it = (Item) items.get(editIndex);
        TextView v = values[editIndex];
        if (v != null) {
            v.removeCallbacks(blink);
            v.setVisibility(View.VISIBLE);       // INVISIBLE keeps the space, but not the value
        }
        if (commit) Prefs.setInt(this, it.key, editVal);
        render();
    }

    /** The value blinks while the wheel belongs to it. Named: d8 here crashes on anonymous ones. */
    static final class Blink implements Runnable {
        private final IppActivity a;
        Blink(IppActivity a) { this.a = a; }
        public void run() { a.blinkTick(); }
    }

    @Override
    public void confirm() {
        if (editing) { endEdit(true); return; }
        clampSel();
        Item it = (Item) items.get(sel);
        if (it.type == TOGGLE) {
            // Read back through toggleOn, which knows the row's own default: a "flip it" helper
            // that reads the pref with a false default would show On for a row whose default is On
            // and then need two presses to turn it off. (Prefs had exactly such a helper; it was
            // unused for this reason and has been removed.)
            Prefs.setBool(this, it.key, !toggleOn(it));
            // #231: the Favorites playlist exists by default (Playlists.syncName, from
            // MainActivity.initView) and the setting only shows or hides it. This stays as the
            // backstop for the one case startup cannot cover — a build with the delete protection
            // off, where the playlist can actually be removed while the app is running.
            if ("likes".equals(it.key) && Prefs.on(this, it.key)) Fav.ensure(this);
            // #393: the line under a genre ("N artists N albums") is a written-down ANSWER, and
            // the split changes it. GenreInfo is invalidated by library writes and by nothing
            // else, so a toggle has to say so itself, or the subtitles keep yesterday's counts.
            if (GenreSplit.KEY_SPLIT.equals(it.key)) GenreInfo.clear();
            render();
        } else if (it.type == NUMBER) {
            startEdit(it);
        } else if (it.type == CHOICE) {
            int v = (Prefs.val(this, it.key) + 1) % it.count;
            Prefs.setInt(this, it.key, v);
            render();
        } else if (it.type == ACTION) {
            if ("reboot".equals(it.key)) {
                confirmReboot(label(it));
            } else if ("scan".equals(it.key)) {
                confirmScan(label(it));
            } else if ("cache".equals(it.key)) {
                confirmCache();
            } else if ("sf".equals(it.key)) {
                confirmSf(label(it));
            } else if ("log".equals(it.key)) {
                confirmLog(label(it));
            }
        }
    }

    // action ids for Confirm ("Cache library" has a picker of its own, not a Yes/No)
    private static final int ACT_REBOOT = 0;
    private static final int ACT_SCAN = 1;
    private static final int ACT_SF = 2;
    private static final int ACT_LOG = 3;

    private void confirmReboot(String title) {
        DialogUtil d = new DialogUtil(getActivity(), false, R.style.Dialog_Common);
        d.setDialogTitle(title, getString(R.string.ipp_reboot_confirm),
                new Confirm(this, ACT_REBOOT), false, true);
    }

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

    private void confirmSf(String title) {
        DialogUtil d = new DialogUtil(getActivity(), false, R.style.Dialog_Common);
        d.setDialogTitle(title, getString(R.string.ipp_sf_confirm),
                new Confirm(this, ACT_SF), false, true);
    }

    /**
     * Write the report, tell the user where it went, and only then take the compositor down.
     *
     * <p>The report is collected on a worker: it execs {@code dumpsys SurfaceFlinger}, a binder
     * round trip into the very process this is about, and a screen that is already drawing wrong
     * is not a screen to block the main thread on. The toast is shown from the main thread and
     * given a moment to be read — after the kill there may be nothing left to show it on.
     */
    void startSfRestart() {
        Thread t = new Thread(new SfRun(this), "ipp-sf-report");
        t.setDaemon(true);
        t.start();
    }

    /** @see IppActivity#startSfRestart() */
    private static final class SfRun implements Runnable {
        private final IppActivity a;

        SfRun(IppActivity a) {
            this.a = a;
        }

        public void run() {
            java.io.File f = Panel.report(a.getContext());
            a.runOnUiThread(new SfToast(a, f == null ? "?" : f.getAbsolutePath()));
            try {
                Thread.sleep(2500L);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
            Panel.restart();
        }
    }

    private static final class SfToast implements Runnable {
        private final IppActivity a;
        private final String path;

        SfToast(IppActivity a, String path) {
            this.a = a;
            this.path = path;
        }

        public void run() {
            try {
                Toast.makeText(a.getContext(), path, Toast.LENGTH_LONG).show();
            } catch (Throwable t) {
                // the report is written either way, which is the part that matters
            }
        }
    }

    /**
     * "Cache library" asks WHAT to fill rather than whether to start: the covers are the expensive
     * half by a wide margin, so re-reading only the tags after an edit — or only the pictures after
     * new artwork — is worth being able to say. {@link PickDialog} replaces the plain confirm.
     */
    private void confirmCache() {
        Pick.askCache(getActivity(), new CachePick(this));
    }

    /** Named (d8 here crashes on anonymous classes). */
    static final class CachePick extends PickDialog.Go {
        private final IppActivity a;

        CachePick(IppActivity a) { this.a = a; }

        @Override
        public void go(int mask) {
            a.runCacheLibrary(mask);
        }
    }

    /**
     * #228.2 -- "Update library" = refresh the metadata of songs ALREADY in the library, nothing
     * else. It does not look for new or deleted files: that is the stock scan's job (after a
     * reboot / USB detach), and it is left untouched so it stays fast — which is also why this
     * button no longer starts it, so the stock "Scanning files" dialog can no longer appear on
     * top of ours.
     *
     * A song is re-read only when its file's mtime differs from the row's fileDate (a tag edit
     * bumps it), so an unchanged library costs one lastModified() per row instead of a full
     * metadata decode, and the button can honestly report "already up to date".
     */
    private LoadingDialog progress;

    void runFullRescan() {
        try {
            progress = new LoadingDialog(getActivity(), getString(R.string.ipp_scan_running), "",
                    R.style.Dialog_Common, new Noop());
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
     * "Cache library" — read once, up front, everything the lists otherwise read while the user
     * is looking at them: the album thumbnails, each album's artist and representative song, its
     * release year, and (only when "Sort by Track Number" is on) every song's track number. All
     * four caches are file-backed, so this survives a restart.
     *
     * Whether there is anything to do is decided by a signature of the library — the row count and
     * the newest file date — stored when a pass completes. It matches only if the library has not
     * changed since, and that is what "already cached" means; the track-number half has its own
     * flag, so switching the sort on afterwards makes the button work again.
     */
    void runCacheLibrary(int mask) {
        if (mask == 0) return;
        try {
            progress = new LoadingDialog(getActivity(), getString(R.string.ipp_cache_running), "",
                    R.style.Dialog_Common, new Noop());
            progress.show();
        } catch (Throwable t) {
            progress = null;
        }
        new Thread(new CacheTask(this, mask)).start();
    }

    void cacheFinished(int albums) {
        runOnUiThread(new CacheDone(this, albums));
    }

    /**
     * {@code PowerManager.reboot()} does not return — it blocks in the system until the device goes
     * down, and the system's own shutdown screen comes up over us while it does. The dialog's
     * {@code dismiss()} runs AFTER the callback (DialogUtil.shortUp: confirm() then dismiss()), so
     * calling reboot straight from confirm() meant the dismiss never happened and the confirm
     * dialog stayed on screen, visible behind the shutdown screen. Let the dialog close and the
     * frame without it be drawn first; the delay is invisible next to a reboot.
     */
    void postReboot() {
        try {
            getVb().getRoot().postDelayed(new RebootRun(this), 400L);
        } catch (Throwable t) {
            Other.INSTANCE.reboot(getContext());
        }
    }

    // Named nested classes (NOT anonymous): the bundled d8 (R8 8.2.2-dev) crashes dexing
    // anonymous inner classes here, but named nested classes dex fine.

    /** @see IppActivity#postReboot() */
    private static final class RebootRun implements Runnable {
        private final IppActivity a;

        RebootRun(IppActivity a) {
            this.a = a;
        }

        public void run() {
            // Stock writes its saved state only when the device is SHUT DOWN, so a reboot came
            // back to the last shutdown's track and list — see Force.saveState.
            Force.saveState();
            Other.INSTANCE.reboot(a.getContext());
        }
    }

    /** Wheel-navigable Yes/No callback for the Tools actions. */
    private static final class Confirm extends DialogUtil.DialogCallback {
        private final IppActivity a;
        private final int action;

        Confirm(IppActivity a, int action) {
            this.a = a;
            this.action = action;
        }

        @Override
        public void confirm() {
            if (action == ACT_REBOOT) {
                a.postReboot();
            } else if (action == ACT_SF) {
                a.startSfRestart();
            } else if (action == ACT_LOG) {
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
     * Background worker: walk the song rows, re-read the ones whose file changed.
     * {@code ippReplaceSong} = fileToSong + INSERT OR REPLACE on the path-stable songId; it never
     * touches the file itself (unlike {@code deleteSong}, which deletes it from disk).
     */
    private static final class RescanTask implements Runnable {
        private final IppActivity a;

        RescanTask(IppActivity a) {
            this.a = a;
        }

        @Override
        public void run() {
            int updated = 0;
            try {
                Y1Repository repo = Y1Application.Companion.getY1Repository();
                List songs = repo.getSongsSync(0);
                int n = songs == null ? 0 : songs.size();
                String label = a.getString(R.string.ipp_scan_running);
                for (int i = 0; i < n; i++) {
                    Song s = (Song) songs.get(i);
                    if (s == null || s.getPath() == null) continue;
                    if ((i & 15) == 0) a.scanTick(label + "  " + (i * 100 / (n == 0 ? 1 : n)) + "%");
                    File f = new File(s.getPath());
                    if (!f.exists()) continue;                      // gone: the stock scan removes it

                    // An external cover.jpg / folder.jpg is not part of the song file, so replacing
                    // one leaves every mtime below untouched and the old picture cached. Art keeps
                    // a stamp of the cover files per folder and answers once per album.
                    // A folder seen for the first time (a song the stock scan has just added) is
                    // re-read the same way, but it is not something the user changed — counting it
                    // reported every freshly scanned song as updated.
                    int cover = Art.coverState(s.getPath());
                    if (cover != Art.COVER_SAME) {
                        CoverCache.forget(Albums.keyOf(s));                  // the list thumbnail
                        BigCover.forget(s.getPath());                        // this track's cover
                        BigCover.forget(Albums.trackFolder(s.getPath()));    // the album's own
                        if (cover == Art.COVER_CHANGED) updated++;
                    }

                    if (f.lastModified() == s.getFileDate()) continue;   // untouched since last read
                    repo.ippReplaceSong(f);
                    updated++;
                }
            } catch (Throwable t) {
                // never leave the dialog up: the report below runs either way
            } finally {
                Art.flushStamps();
                a.scanFinished(updated);
            }
        }
    }

    /**
     * Background worker for "Cache library". Nothing here writes to the database — it only fills
     * the caches the album lists read from, so the worst case of getting it wrong is wasted work.
     */
    private static final class CacheTask implements Runnable {
        private final IppActivity a;
        /** What the user ticked: {@code Pick.COVERS} and/or {@code Pick.TAGS}. */
        private final int mask;

        // progress, shared with the workers
        private final Object lock = new Object();
        private String label = "";
        private int total = 1;
        private int tickEvery = 1;
        private int progress;

        CacheTask(IppActivity a, int mask) {
            this.a = a;
            this.mask = mask;
        }

        /**
         * One item done, from whichever thread. The percentage is the only thing the workers share
         * besides the queue, so it is a counter under a lock rather than anything cleverer; the
         * dialog is only re-texted every 1/60 of the library.
         */
        void tick() {
            int v;
            synchronized (lock) {
                v = ++progress;
                if (v % tickEvery != 0) return;
            }
            a.scanTick(label + "  " + (v * 100 / total) + "%");
        }

        @Override
        public void run() {
            int done = 0;
            boolean covers = (mask & Pick.COVERS) != 0;
            boolean tags = (mask & Pick.TAGS) != 0;
            try {
                Y1Repository repo = Y1Application.Companion.getY1Repository();
                List songs = repo == null ? null : repo.getSongsSync(0);
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
                // Hold the per-track cover notes back until the end: they are one file, and the
                // workers below produce them by the thousand.
                BigCover.beginCache();

                // Replaced external artwork, before anything is filled: a cover.jpg / folder.jpg is
                // not part of any song file, so nothing else in this pass can notice that it
                // changed, and the stale thumbnail would simply be kept (it is already cached) and
                // the stale player covers with it. Same bookkeeping "Update library" uses — one
                // look per folder, and it also means whichever button the user presses leaves the
                // cover stamps in the same state.
                if (covers) {
                    for (int i = 0; i < n; i++) {
                        Song s = (Song) songs.get(i);
                        if (s == null || s.getPath() == null) continue;
                        if (!Art.coverChanged(s.getPath())) continue;
                        CoverCache.forget(Albums.keyOf(s));
                        BigCover.forget(s.getPath());
                        BigCover.forget(Albums.trackFolder(s.getPath()));
                    }
                }

                // One representative song per album — the lowest path, which is the one the album
                // row itself reads (Albums.songsSync orders by path, so CD1 wins over CD2).
                LinkedHashMap reps = new LinkedHashMap();
                for (int i = 0; i < n; i++) {
                    Song s = (Song) songs.get(i);
                    if (s == null || s.getPath() == null) continue;
                    String key = Albums.keyOf(s);
                    if (key == null) continue;
                    Song cur = (Song) reps.get(key);
                    if (cur == null || s.getPath().compareTo(cur.getPath()) < 0) reps.put(key, s);
                }

                ArrayList keys = new ArrayList(reps.keySet());
                int m = keys.size();
                label = a.getString(R.string.ipp_cache_running);
                // One scale over both halves: with the albums already cached their loop is over in
                // an instant and everything that is left is the per-song pass, so a percentage of
                // the albums alone would sit at 100% for the whole of the long part.
                total = m + n;
                if (total <= 0) total = 1;
                tickEvery = total / 60;
                if (tickEvery < 1) tickEvery = 1;

                // The album half. What each album needs is decided HERE, on this thread — those are
                // plain map lookups, and deciding them up front is what keeps the workers away from
                // the caches' lazy loading. The workers only open files and build thumbnails; the
                // answers come back and are written into the caches below, again on this thread.
                ArrayList jobs = new ArrayList();
                for (int i = 0; i < m; i++) {
                    String key = (String) keys.get(i);
                    Song s = (Song) reps.get(key);
                    if (tags && (AlbumInfo.artist(key) == null || AlbumInfo.path(key) == null)) {
                        AlbumInfo.put(key, s.getArtist(), s.getPath());
                    }
                    String path = AlbumInfo.path(key);
                    if (path == null) path = s.getPath();
                    AlbumJob j = new AlbumJob();
                    j.key = key;
                    j.path = path;
                    j.artist = tags && AlbumArtist.needsRead(key);
                    j.year = tags && YearCache.get(key) == null;
                    j.thumb = covers && CoverCache.peek(key) == null;
                    j.art = j.thumb && Art.thumbFromTags(key, path);
                    jobs.add(j);
                    done++;
                }
                Blocks aq = Blocks.each(jobs.size());
                AlbumWorker[] aw = new AlbumWorker[workers()];
                for (int i = 0; i < aw.length; i++) aw[i] = new AlbumWorker(this, jobs, aq);
                spread(aw);
                for (int i = 0; i < jobs.size(); i++) {
                    AlbumJob j = (AlbumJob) jobs.get(i);
                    if (j.artist) AlbumArtist.put(j.key, j.gotArtist);
                    if (j.year) YearCache.put(j.key, j.gotYear, j.gotDate);
                }
                if (tags) {
                    AlbumArtist.flush();
                    // Every album now has its year, so this walks the list, finds nothing to do and
                    // writes the file out — which is the only reason it is still called.
                    YearCache.warm(keys);
                }

                // The expensive half — the tags of every SONG, and this is where the whole pass
                // spends its minute. What a metadata read costs is the file OPEN: the container has
                // to be parsed before any key can be answered, and after that each key is nearly
                // free. So everything a song is needed for comes out of ONE open
                // (DiscCache.readTrack): the disc number, the track number and the artwork bytes.
                // The pass used to open every file twice — once here, once inside BigCover — and a
                // third time from TrackCache.ensure for every song with no track-number tag.
                //
                // The Now-Playing cover is per-track (#230.2), so it belongs in this half — without
                // it the player still had to read a tag the first time each song was opened, which
                // is the flash the caching pass exists to remove. Walked in PATH order rather than
                // the library's own (name/date) order: BigCover holds one album representative at a
                // time to compare against, and that only works when a folder's songs arrive
                // together.
                if (songs != null && n > 0) {
                    ArrayList byPath = new ArrayList(songs);
                    try {
                        Collections.sort(byPath, new ByPath());
                    } catch (Throwable t) {
                        // an unsortable list only costs cache locality
                    }
                    // Read the disc numbers in before the workers start: they only look the table
                    // up, and a lazy load racing three readers is the one thing that could corrupt
                    // it. Everything they write goes into their own list and is committed below.
                    DiscCache.warm();
                    Blocks q = Blocks.folders(byPath);
                    SongWorker[] w = new SongWorker[workers()];
                    for (int i = 0; i < w.length; i++) {
                        w[i] = new SongWorker(this, byPath, q, tags, covers);
                    }
                    spread(w);
                    if (tags) {
                        // The commits, on this thread and in one place, so no cache needs a lock.
                        // TrackCache is pulled in first: its file is read lazily, and reading it
                        // AFTER the puts would let the older numbers on disk overwrite them.
                        TrackCache.sorted(new ArrayList());
                        for (int i = 0; i < w.length; i++) w[i].commit();
                        DiscCache.flush();
                        // Writes out the track numbers collected above, and picks up any song whose
                        // number was still missing (TrackCache.sorted = load + read what is missing
                        // + save) — which, since the read writes down "this file has none" too, is
                        // now nothing at all.
                        TrackCache.sorted(songs);
                    }
                }

                Albums.noteCached(a, n, stamp, mask);
            } catch (Throwable t) {
                // report whatever was managed
            } finally {
                // in the finally, not after the loop: a pass that died half way must still write
                // down what it did learn about the covers it read
                try { BigCover.endCache(); } catch (Throwable t) { }
                try { Art.flushStamps(); } catch (Throwable t) { }
                a.cacheFinished(done);
            }
        }
    }

    // ---------------------------------------------------------------- the caching pass, in parallel
    //
    // The pass is bound by opening files: one open per song and one per album, and most of that time
    // the thread is waiting on the card rather than computing. The chip here is a dual-core MT6572,
    // so a small pool covers both the second core and the waiting.
    //
    // What makes it safe is where the work is split, not locks: the library is cut into whole ALBUM
    // FOLDERS and a worker takes one at a time, so the one piece of state a cover walk carries — the
    // album's representative picture — never crosses threads (BigCover.Walk). Everything else is
    // arranged so the caches are only ever written from the pass thread: what each item needs is
    // decided before the workers start (plain map lookups), the workers only read files and write
    // what belongs to one key (their own JPEGs, whose names no two folders share), and their answers
    // are committed afterwards. The two caches that are genuinely shared during a pass — BigCover's
    // per-track notes and its bitmap tables — are synchronized and Hashtables respectively.

    /** How many workers. One more than the cores, because each spends much of its time waiting. */
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
                // interrupted: carry on, the pass reports what it managed
            }
        }
    }

    /**
     * The queue the workers share: ranges of an index, handed out one at a time. Blocks rather than
     * single items because a cover walk is per folder — see {@link BigCover.Walk}.
     */
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

    /** One album's worth of work, and the answers coming back from the worker. */
    static final class AlbumJob {
        String key;
        String path;
        boolean artist;      // read the ALBUM ARTIST tag
        boolean year;        // read the year
        boolean thumb;       // build the 50px thumbnail
        boolean art;         // ... and it has to come out of the tags, not a cover file
        String gotArtist;
        String gotYear;
        String gotDate;
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
            int b;
            while ((b = q.take()) >= 0) {
                for (int i = q.from(b); i < q.to(b); i++) {
                    try {
                        album((AlbumJob) jobs.get(i));
                    } catch (Throwable t) {
                        // one unreadable album must not stop the pass
                    }
                    task.tick();
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

        SongWorker(CacheTask task, List byPath, Blocks q, boolean tags, boolean covers) {
            this.task = task;
            this.byPath = byPath;
            this.q = q;
            this.tags = tags;
            this.covers = covers;
        }

        public void run() {
            BigCover.Walk w = new BigCover.Walk();
            int b;
            while ((b = q.take()) >= 0) {
                for (int i = q.from(b); i < q.to(b); i++) {
                    try {
                        one(w, (Song) byPath.get(i));
                    } catch (Throwable t) {
                        // one unreadable file must not stop the pass
                    }
                    task.tick();
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
            if (wantArt) BigCover.cache(w, path, t.art);
            if (wantTags) {
                paths.add(path);
                read.add(t);
            }
        }

        /** On the pass thread, after every worker has finished. */
        void commit() {
            for (int i = 0; i < paths.size(); i++) {
                DiscCache.commit((String) paths.get(i), (DiscCache.Tags) read.get(i));
            }
        }
    }

    /**
     * Everything one ALBUM needs, out of a single {@code setDataSource} on its representative song:
     * the ALBUM ARTIST tag, the release year and the 50px thumbnail.
     *
     * These are three separate caches and each used to open the file for itself — the thumbnail
     * through {@code Other.getAlbumCover}, the album artist inside {@code AlbumArtist.read} and the
     * year inside {@code YearCache.warm} (which also ran a Room query per album to find the very
     * song we already have here). Opening the file is what a metadata read costs, so on a library
     * with a few hundred albums those two extra opens were a sizeable part of the whole pass.
     *
     * Nothing is read that the ticked categories do not need, so this does not tie the two
     * categories together: with only "Metadata" on, no picture is asked for; with only "Album
     * covers" on, no tags are; and an album that has all of it already is not opened at all. The
     * thumbnail's own priority is untouched — a pinned song or an external {@code folder.jpg} still
     * wins, and the tags are only consulted where they would have been anyway ({@code
     * Art.thumbFromTags}), which is also why the picture is not read when a cover file exists.
     */
    private static void album(AlbumJob j) {
        if (j == null || j.path == null) return;
        if (!j.artist && !j.year && !j.art) {
            // Nothing to read out of the file -- but the thumbnail may still have to be built from
            // a cover file sitting next to it, and that costs no metadata read at all.
            if (j.thumb) CoverCache.get(j.key, j.path);
            return;
        }

        byte[] art = null;
        MediaMetadataRetriever r = new MediaMetadataRetriever();
        try {
            r.setDataSource(j.path);
            if (j.artist) j.gotArtist = r.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUMARTIST);
            if (j.year) {
                j.gotYear = r.extractMetadata(MediaMetadataRetriever.METADATA_KEY_YEAR);
                j.gotDate = r.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DATE);
            }
            if (j.art) art = r.getEmbeddedPicture();
        } catch (Throwable t) {
            // an unreadable file is "read, nothing there" for each of them
        }
        try { r.release(); } catch (Throwable t) { }

        if (j.thumb) {
            // The hint is consumed by Art.thumb as the LAST resort, after the pinned song and the
            // cover files -- so the thumbnail is the same picture it would have been. It is held
            // per thread, so several album workers never see each other's.
            if (j.art) Art.hint(j.path, art);
            try {
                CoverCache.get(j.key, j.path);
            } finally {
                Art.hint(null, null);
            }
        }
    }

    /** Library order is by name or date; the cover pass wants a folder's songs together. */
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
            if (d != null && d.isShowing()) d.show(text);
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

    /** LoadingDialog's back-key callback; nothing to do (the dialog is not cancellable). */
    private static final class Noop implements Function0 {
        @Override
        public Object invoke() {
            return Unit.INSTANCE;
        }
    }

    @Override
    public void direction(BaseActivity.Direction d) {
        if (d == BaseActivity.Direction.TOP) {
            // While a value is open the top button cancels the edit rather than the screen —
            // one button, the innermost thing it can close.
            if (editing) { endEdit(false); return; }
            finish();
        }
    }

    /**
     * #228.1: hold the top button on a row and it explains itself. The text lives in
     * {@code assets/help/<lang>.txt}, keyed by the row's own key, and is paged with the wheel
     * ({@link HelpDialog}).
     *
     * <p>Long top press is free on this screen: stock routes it to {@code longConfirm}, which
     * every list uses for its long-press menu and which this screen has never had one for.
     */
    @Override
    public void longConfirm() {
        if (editing) return;               // the wheel is inside a value; one thing at a time
        if (items == null || sel < 0 || sel >= items.size()) return;
        Item it = (Item) items.get(sel);
        if (it.type == HEADER || it.key == null) return;
        List blocks = Help.blocks(this, it.key);
        if (blocks.isEmpty()) return;      // nothing written for this row yet: say nothing
        new HelpDialog(getActivity(), label(it), blocks).show();
    }

    /**
     * The rows as last built, so a description can name another row in the language on screen
     * ({@code {row:<key>}}). Static because {@link Help} is asked while this screen is the one on
     * top, which is the only way a description is ever read.
     */
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

    /** The row's name: what the asset called it, or its key when no file names it. */
    private static String label(Item it) {
        return it.label != null ? it.label : it.key;
    }

    @Override
    public void quit() {
        endEdit(false);
        finish();
    }
}
