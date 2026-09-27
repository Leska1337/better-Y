package com.innioasis.y1.activity;

import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.ScrollView;
import android.widget.TextView;

import com.innioasis.ipp.Diag;
import com.innioasis.ipp.Help;
import com.innioasis.ipp.Loop;
import com.innioasis.ipp.Icons;
import com.innioasis.ipp.M3u;
import com.innioasis.ipp.PickDialog;
import com.innioasis.y1.R;
import com.innioasis.y1.base.BaseActivity;
import com.innioasis.y1.databinding.ActivityAboutBinding;
import com.innioasis.y1.theme.ThemeManager;

import java.util.List;

/**
 * "Import playlists": every .m3u / .m3u8 in /Playlists/ into the library ({@link M3u}).
 *
 * Four stages on one screen. The files of the folder, each with a tick: nothing is imported that
 * was not picked. The questions, over it — a name that is taken, Favorites — so the transfer that
 * follows runs without stopping. Then the transfer with its progress; it
 * cannot be interrupted, since a playlist left half-written is worse than one not touched. Then the
 * summary: per playlist how many songs made it, and under it the file name of each song that did
 * not. The wheel scrolls the summary, the top button leaves.
 *
 * Authored in Java (build/ipp-java); raw types and named nested classes only.
 */
public final class IppImportActivity extends BaseActivity {

    private static final float TEXT_SP = 15.0f;
    private static final float SMALL_SP = 13.0f;
    private static final int RULE_H = 2;

    private LinearLayout container;
    private LinearLayout footer;
    private ScrollView scroller;
    private TextView name;
    private TextView which;
    private TextView counts;
    private ProgressBar bar;

    private List plans;                  // List<M3u.Plan>
    private int total;                   // entries across every file
    private boolean running;
    private boolean finished;

    // written by the worker, read by the posted repaint
    volatile int doneEntries;
    volatile int current;
    private volatile boolean paintPending;

    @Override
    public ActivityAboutBinding getViewBinding() {
        return ActivityAboutBinding.inflate(getLayoutInflater());
    }

    @Override
    public void initView() {
        String title = Help.label(this, "m3u_import");
        setStateBarLeftText(title != null ? title : "");

        ViewGroup root = (ViewGroup) getVb().getRoot();
        root.removeAllViews();
        container = new LinearLayout(this);
        container.setOrientation(LinearLayout.VERTICAL);
        scroller = new ScrollView(this);
        scroller.addView(container, -1, -2);
        // The file list's button stands under the scroller, at the bottom edge of the screen
        LinearLayout outer = new LinearLayout(this);
        outer.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams sp = new LinearLayout.LayoutParams(-1, 0);
        sp.weight = 1.0f;
        outer.addView(scroller, sp);
        footer = new LinearLayout(this);
        footer.setOrientation(LinearLayout.VERTICAL);
        outer.addView(footer, new LinearLayout.LayoutParams(-1, -2));
        root.addView(outer, -1, -1);

        // Posted: the questions are dialogs, and this window is not up yet.
        root.post(new Begin(this));
    }

    void begin() {
        all = M3u.scan();
        if (all.isEmpty()) {
            finished = true;
            // in the middle of the screen, as a message rather than as a first row
            scroller.setFillViewport(true);
            container.setGravity(Gravity.CENTER);
            TextView none = line(getString(R.string.ipp_m3u_none), TEXT_SP);
            none.setGravity(Gravity.CENTER);
            none.setPadding(16, 0, 16, 0);
            container.addView(none, new LinearLayout.LayoutParams(-1, -2));
            return;
        }
        buildList();
    }

    // ---------------------------------------------------------------- the file list

    private static final int ACCENT = 0xFF3CFFDE;

    private List all;                    // every file of the folder, List<M3u.Plan>
    private boolean listing;
    private View[] rows;                 // "Select all", the files, the button
    private View[] boxes;                // each row inside its hairline: the container's children
    private TextView[] labels;
    private TextView[] values;
    private ImageView[] ticks;
    private int sel;

    /**
     * Nothing is imported before the user says which files: a tick per file, "Select all" on top
     * (no tick of its own — it turns them all on or off), the button below. The centre press ticks
     * or presses; the wheel moves the cursor.
     */
    void buildList() {
        listing = true;
        container.removeAllViews();
        footer.removeAllViews();
        int n = all.size() + 2;
        rows = new View[n];
        labels = new TextView[n];
        values = new TextView[n];
        ticks = new ImageView[n];
        boxes = new View[n];
        for (int i = 0; i < n; i++) {
            LinearLayout r = new LinearLayout(this);
            r.setOrientation(LinearLayout.HORIZONTAL);
            r.setGravity(Gravity.CENTER_VERTICAL);
            r.setPadding(5, 0, 5, 0);

            ImageView t = new ImageView(this);
            t.setImageBitmap(PickDialog.tick());
            LinearLayout.LayoutParams tp = new LinearLayout.LayoutParams(-2, -2);
            tp.rightMargin = 6;
            r.addView(t, tp);

            TextView l = line(label(i), 17.0f);
            l.setSingleLine(true);
            l.setEllipsize(android.text.TextUtils.TruncateAt.END);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, -2);
            lp.weight = 1.0f;
            r.addView(l, lp);

            TextView v = line("", 15.0f);
            v.setPadding(6, 0, 4, 0);
            if (i > 0 && i <= all.size()) {
                v.setText(String.valueOf(((M3u.Plan) all.get(i - 1)).lines.size()));
            }
            r.addView(v, -2, -2);

            if (i == n - 1) {
                // the button: its words centred, no tick, no count
                t.setVisibility(View.GONE);
                l.setGravity(Gravity.CENTER);
                bold(l);
            }
            rows[i] = r;
            labels[i] = l;
            values[i] = v;
            ticks[i] = t;
            if (step == 0) fit((int) (l.getTextSize() * 2.4f) + HAIR_H);
            if (i == n - 1) {
                // A hairline of its own only where the list stops short of it: a row that touches
                // the button already draws that boundary, and a second line beside it reads as one
                // twice as thick. The footer keeps its height either way, so the fit holds.
                boolean touches = n - 1 >= fitRows;
                int bh = step;
                if (!touches) {
                    View hair = new View(this);
                    hair.setBackgroundColor(itemRgb() | HAIR_ALPHA);
                    footer.addView(hair, new LinearLayout.LayoutParams(-1, HAIR_H));
                    bh -= HAIR_H;
                }
                footer.addView(r, new LinearLayout.LayoutParams(-1, bh));
                boxes[i] = r;
            } else {
                boxes[i] = boxed(r, step - HAIR_H);
                container.addView(boxes[i], new LinearLayout.LayoutParams(-1, -2));
            }
        }
        sel = Math.min(sel, n - 1);
        for (int i = 0; i < n; i++) paintRow(i);
        scrollToSel(true);
    }

    private int step;                    // a list row with its hairline, and the button
    private int fitRows;                 // how many list rows the scroller shows

    /**
     * The file list's rows sized so the screen holds a whole number of them, the button included:
     * the list scrolls a row at a time, and with a height that does not divide, the row at the top
     * or the bottom edge was always cut. The rows are made a pixel or two shorter or taller than
     * {@code want} to get there; what still does not divide goes to the top padding, as the grid
     * of playlists does it ({@code Theme.tileGrid}).
     */
    private void fit(int want) {
        View body = (View) scroller.getParent();
        int avail = body.getHeight();
        if (avail <= 0) {
            avail = getResources().getDisplayMetrics().heightPixels
                    - (int) getResources().getDimension(R.dimen.status_bar_height);
        }
        int k = Math.max(2, Math.round(avail / (float) want));
        step = avail / k;
        fitRows = k - 1;                 // the button takes one step of the screen
        body.setPadding(0, avail - step * k, 0, 0);
    }

    private String label(int i) {
        if (i == 0) return getString(R.string.all_select);
        if (i == all.size() + 1) return getString(R.string.ipp_m3u_import_go);
        return ((M3u.Plan) all.get(i - 1)).file;
    }

    private void paintRow(int i) {
        boolean on = i == sel;
        ThemeManager.INSTANCE.itemSetBackground(rows[i], on ? R.drawable.item_setting_sel : 0, on);
        ThemeManager.INSTANCE.itemSetTextColor(labels[i], on ? ACCENT : -1, on);
        ThemeManager.INSTANCE.itemSetTextColor(values[i], on ? ACCENT : -1, on);
        // the colour the label actually got, not the one asked for: the theme answers for it
        Icons.menu(ticks[i], labels[i].getCurrentTextColor());
        boolean file = i > 0 && i <= all.size();
        if (file) {
            ticks[i].setVisibility(((M3u.Plan) all.get(i - 1)).picked
                    ? View.VISIBLE : View.INVISIBLE);
        } else if (i == 0) {
            ticks[i].setVisibility(View.INVISIBLE);   // keeps the labels in one column
        }
    }

    private void moveSel(int dir) {
        int next = Loop.step(sel, dir, rows.length);
        if (next == sel) return;
        int old = sel;
        sel = next;
        paintRow(old);
        paintRow(sel);
        scrollToSel(true);
    }

    void scrollToSel(boolean mayPost) {
        View v = boxes == null ? null : boxes[sel];
        if (v == null || scroller == null || v.getParent() != container) return;   // the button
        if (v.getHeight() <= 0) {
            if (mayPost) scroller.post(new ScrollLater(this));
            return;
        }
        int y = scroller.getScrollY();
        int h = scroller.getHeight();
        if (v.getTop() < y) scroller.scrollTo(0, v.getTop());
        else if (v.getBottom() > y + h) scroller.scrollTo(0, v.getBottom() - h);
    }

    private void press() {
        int n = all.size();
        if (sel == 0) {
            boolean every = true;
            for (int i = 0; i < n; i++) every &= ((M3u.Plan) all.get(i)).picked;
            for (int i = 0; i < n; i++) ((M3u.Plan) all.get(i)).picked = !every;
            for (int i = 1; i <= n; i++) paintRow(i);
        } else if (sel <= n) {
            M3u.Plan p = (M3u.Plan) all.get(sel - 1);
            p.picked = !p.picked;
            paintRow(sel);
        } else {
            go();
        }
    }

    /** The ticked files, asked about and then transferred. Nothing ticked: a toast says so. */
    private void go() {
        java.util.ArrayList picked = new java.util.ArrayList();
        for (int i = 0; i < all.size(); i++) {
            M3u.Plan p = (M3u.Plan) all.get(i);
            if (p.picked) picked.add(p);
        }
        if (picked.isEmpty()) {
            android.widget.Toast.makeText(this, R.string.ipp_m3u_none_picked,
                    android.widget.Toast.LENGTH_SHORT).show();
            return;
        }
        listing = false;
        plans = picked;
        new M3u.Ask(getActivity(), plans, new Start(this), new Back(this)).start();
    }

    /**
     * The top button on a question: nothing is written yet, so the list comes back with the same
     * ticks. The files are read again — the questions already answered changed the plans' names.
     */
    void backToList() {
        java.util.HashSet ticked = new java.util.HashSet();
        for (int i = 0; i < all.size(); i++) {
            M3u.Plan p = (M3u.Plan) all.get(i);
            if (p.picked) ticked.add(p.file);
        }
        all = M3u.scan();
        for (int i = 0; i < all.size(); i++) {
            M3u.Plan p = (M3u.Plan) all.get(i);
            p.picked = ticked.contains(p.file);
        }
        if (all.isEmpty()) {
            finish();
            return;
        }
        buildList();
    }

    // ---------------------------------------------------------------- the transfer

    void start() {
        if (isFinishing()) return;
        container.removeAllViews();
        footer.removeAllViews();
        rows = null;
        boxes = null;
        running = true;
        total = 0;
        for (int i = 0; i < plans.size(); i++) total += ((M3u.Plan) plans.get(i)).lines.size();

        LinearLayout panel = new LinearLayout(this);
        panel.setOrientation(LinearLayout.VERTICAL);
        panel.setPadding(10, 14, 10, 10);

        name = line("", TEXT_SP);
        bold(name);
        panel.addView(name, new LinearLayout.LayoutParams(-1, -2));
        which = line("", SMALL_SP);
        panel.addView(which, new LinearLayout.LayoutParams(-1, -2));

        // The player's own timeline drawable, put through the same theme hook the player uses.
        bar = new ProgressBar(this, null, android.R.attr.progressBarStyleHorizontal);
        try {
            Drawable d = getResources().getDrawable(R.drawable.shape_progressbar_pro).mutate();
            bar.setProgressDrawable(d);
            ThemeManager.INSTANCE.setCustomBackground(bar);
        } catch (Throwable t) {
            // the platform's own bar
        }
        bar.setMax(Math.max(1, total));
        LinearLayout.LayoutParams bp = new LinearLayout.LayoutParams(-1, 8);
        bp.topMargin = 12;
        bp.bottomMargin = 8;
        panel.addView(bar, bp);

        counts = line("", SMALL_SP);
        panel.addView(counts, new LinearLayout.LayoutParams(-1, -2));
        container.addView(panel, new LinearLayout.LayoutParams(-1, -2));

        paint();
        Thread t = new Thread(new Work(this), "ipp-m3u-import");
        t.start();
    }

    /** Worker -> UI, one repaint in flight at a time: a tick per entry would flood the queue. */
    void tick() {
        if (paintPending) return;
        paintPending = true;
        container.post(new Paint(this));
    }

    void paint() {
        paintPending = false;
        if (name == null || plans == null) return;
        int i = Math.min(current, plans.size() - 1);
        M3u.Plan p = (M3u.Plan) plans.get(i);
        name.setText(p.fav ? getString(R.string.ipp_favorites) : p.name);
        which.setText(getString(R.string.ipp_m3u_progress,
                new Object[] { Integer.valueOf(i + 1), Integer.valueOf(plans.size()) }));
        counts.setText(getString(R.string.ipp_m3u_songs,
                new Object[] { Integer.valueOf(doneEntries), Integer.valueOf(total) }));
        bar.setProgress(doneEntries);
    }

    void work() {
        M3u.Resolver r = new M3u.Resolver();
        Ticker tk = new Ticker(this);
        for (int i = 0; i < plans.size(); i++) {
            current = i;
            tk.base = doneEntries;
            M3u.Plan p = (M3u.Plan) plans.get(i);
            try {
                M3u.apply(getApplicationContext(), p, r, tk);
            } catch (Throwable t) {
                Diag.note("m3u import " + p.file + ": " + t);
            }
            doneEntries = tk.base + p.lines.size();
            tick();
        }
        container.post(new Done(this));
    }

    // ---------------------------------------------------------------- the summary

    void done() {
        running = false;
        finished = true;
        container.removeAllViews();

        int ok = 0;
        int bad = 0;
        for (int i = 0; i < plans.size(); i++) {
            M3u.Plan p = (M3u.Plan) plans.get(i);
            ok += p.found;
            bad += p.missing.size() + p.dups.size();
        }
        Diag.note("m3u import: " + plans.size() + " file(s), " + ok + " song(s) in, " + bad + " not");

        lastHair = null;
        TextView head = line(getString(R.string.ipp_m3u_done,
                new Object[] { Integer.valueOf(ok), Integer.valueOf(bad) }), TEXT_SP);
        bold(head);
        container.addView(item(head), new LinearLayout.LayoutParams(-1, -2));

        boolean afterCaption = false;
        for (int i = 0; i < plans.size(); i++) {
            M3u.Plan p = (M3u.Plan) plans.get(i);
            String n = p.fav ? getString(R.string.ipp_favorites) : p.name;
            dropHair();   // the caption's own rule draws that boundary
            // straight under another caption, that one's bottom rule is this one's top
            container.addView(caption(n + "  " + p.found + "/" + p.lines.size(), !afterCaption),
                    new LinearLayout.LayoutParams(-1, -2));
            afterCaption = p.missing.isEmpty() && p.dups.isEmpty();
            for (int k = 0; k < p.missing.size(); k++) {
                container.addView(item(line((String) p.missing.get(k), SMALL_SP)),
                        new LinearLayout.LayoutParams(-1, -2));
            }
            for (int k = 0; k < p.dups.size(); k++) {
                container.addView(item(line(getString(R.string.ipp_m3u_dup,
                        new Object[] { p.dups.get(k) }), SMALL_SP)),
                        new LinearLayout.LayoutParams(-1, -2));
            }
        }
        scroller.scrollTo(0, 0);
    }

    // ---------------------------------------------------------------- views

    /** A line of text in the colour an unfocused row is painted. */
    private TextView line(String text, float sp) {
        TextView tv = new TextView(this);
        tv.setTextSize(sp);
        tv.setTypeface(Typeface.MONOSPACE);       // the theme's font: ThemeManager puts it there
        tv.setText(text);
        ThemeManager.INSTANCE.itemSetTextColor(tv,
                getResources().getColor(R.color.selected_text_color), false);
        return tv;
    }

    private static void bold(TextView tv) {
        tv.setTypeface(Typeface.MONOSPACE, Typeface.BOLD);
    }

    /**
     * A summary row: one line, the theme's unfocused row background under it, a hairline along
     * its bottom — the rows of the better-Y menu and of the queue, without a cursor.
     */
    private View item(TextView tv) {
        tv.setSingleLine(true);
        tv.setEllipsize(android.text.TextUtils.TruncateAt.END);
        tv.setGravity(Gravity.CENTER_VERTICAL);
        tv.setPadding(10, 0, 8, 0);
        ThemeManager.INSTANCE.itemSetBackground(tv, 0, false);
        ThemeManager.INSTANCE.itemSetTextColor(tv, -1, false);
        return boxed(tv, (int) (tv.getTextSize() * 2.4f));
    }

    /**
     * A row inside a box carrying a hairline along its BOTTOM edge only: one line per boundary,
     * the menu's caption rule thinner and far weaker. Height fixed, so a theme's row picture cannot
     * stretch the row to its own size.
     */
    private View boxed(View row, int h) {
        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        box.addView(row, new LinearLayout.LayoutParams(-1, h));
        View hair = new View(this);
        hair.setBackgroundColor(itemRgb() | HAIR_ALPHA);
        box.addView(hair, new LinearLayout.LayoutParams(-1, HAIR_H));
        lastHair = hair;
        return box;
    }

    private static final int HAIR_H = 1;
    private static final int HAIR_ALPHA = 0x1F000000;
    private View lastHair;           // the hairline of the last row added, while it still has one
    private int itemRgb = -1;

    /** Something with a rule of its own follows: the last row gives its hairline up. */
    private void dropHair() {
        if (lastHair != null) lastHair.setVisibility(View.GONE);
        lastHair = null;
    }

    /** The theme's ordinary item colour — painted on a probe and read back, the only way to ask. */
    private int itemRgb() {
        if (itemRgb < 0) {
            TextView probe = new TextView(this);
            ThemeManager.INSTANCE.itemSetTextColor(probe,
                    getResources().getColor(R.color.selected_text_color), false);
            itemRgb = probe.getCurrentTextColor() & 0x00FFFFFF;
        }
        return itemRgb;
    }

    /**
     * The better-Y menu's group caption: a rule, the washed strip, a rule. {@code top} false leaves
     * the upper rule out, for a caption right under another one: two translucent rules side by
     * side read as one line twice as thick.
     */
    private View caption(String text, boolean top) {
        TextView tv = line(text, SMALL_SP);
        bold(tv);
        tv.setGravity(Gravity.CENTER_VERTICAL);
        tv.setPadding(6, 4, 6, 4);
        tv.setSingleLine(true);
        tv.setEllipsize(android.text.TextUtils.TruncateAt.END);
        int rule = tv.getCurrentTextColor() & 0x00FFFFFF;

        TextView probe = new TextView(this);
        ThemeManager.INSTANCE.itemSetTextColor(probe, 0xFF3CFFDE, true);
        int wash = probe.getCurrentTextColor() & 0x00FFFFFF;

        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        if (top) {
            View above = new View(this);
            above.setBackgroundColor(rule | IppActivity.RULE_ALPHA);
            box.addView(above, new LinearLayout.LayoutParams(-1, RULE_H));
        }
        box.addView(tv, new LinearLayout.LayoutParams(-1, -2));
        View bottom = new View(this);
        bottom.setBackgroundColor(rule | IppActivity.RULE_ALPHA);
        box.addView(bottom, new LinearLayout.LayoutParams(-1, RULE_H));
        box.setBackgroundColor(wash | IppActivity.bandAlpha());
        return box;
    }

    // ---------------------------------------------------------------- keys

    private int step() {
        return (int) (getResources().getDisplayMetrics().scaledDensity * SMALL_SP * 2.5f);
    }

    @Override
    public void clockwise() {
        if (listing) moveSel(1);
        else if (finished && scroller != null) scroller.scrollBy(0, step());
    }

    @Override
    public void antiClockwise() {
        if (listing) moveSel(-1);
        else if (finished && scroller != null) scroller.scrollBy(0, -step());
    }

    @Override
    public void confirm() {
        if (listing) press();
    }

    @Override
    public void longConfirm() {
    }

    @Override
    public void direction(BaseActivity.Direction d) {
        // Not while the transfer runs: it cannot be stopped halfway, and leaving would hide it.
        if (d == BaseActivity.Direction.TOP && !running) finish();
    }

    @Override
    public void quit() {
        if (!running) finish();
    }

    // ---------------------------------------------------------------- named runnables
    // (d8 here crashes on anonymous classes)

    static final class Begin implements Runnable {
        private final IppImportActivity a;
        Begin(IppImportActivity a) { this.a = a; }
        public void run() {
            if (!a.isFinishing()) a.begin();
        }
    }

    static final class Start implements Runnable {
        private final IppImportActivity a;
        Start(IppImportActivity a) { this.a = a; }
        public void run() { a.start(); }
    }

    static final class Back implements Runnable {
        private final IppImportActivity a;
        Back(IppImportActivity a) { this.a = a; }
        public void run() {
            if (!a.isFinishing()) a.backToList();
        }
    }

    static final class ScrollLater implements Runnable {
        private final IppImportActivity a;
        ScrollLater(IppImportActivity a) { this.a = a; }
        public void run() {
            if (a.listing) a.scrollToSel(false);
        }
    }

    static final class Work implements Runnable {
        private final IppImportActivity a;
        Work(IppImportActivity a) { this.a = a; }
        public void run() { a.work(); }
    }

    static final class Paint implements Runnable {
        private final IppImportActivity a;
        Paint(IppImportActivity a) { this.a = a; }
        public void run() {
            if (!a.isFinishing() && !a.finished) a.paint();
        }
    }

    static final class Done implements Runnable {
        private final IppImportActivity a;
        Done(IppImportActivity a) { this.a = a; }
        public void run() {
            if (!a.isFinishing()) a.done();
        }
    }

    static final class Ticker extends M3u.Tick {
        private final IppImportActivity a;
        int base;

        Ticker(IppImportActivity a) { this.a = a; }

        public void tick(M3u.Plan p, int entry) {
            a.doneEntries = base + entry;
            a.tick();
        }
    }
}
