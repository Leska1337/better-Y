package com.innioasis.ipp;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.drawable.GradientDrawable;
import android.graphics.Typeface;
import android.view.Gravity;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.innioasis.fm.configs.KeyMap;
import com.innioasis.y1.R;
import com.innioasis.y1.base.BaseActivity;
import com.innioasis.y1.base.BaseDialog;
import com.innioasis.y1.theme.ThemeManager;

/**
 * A tick list of categories ("Cache library", "Clear cache", the status bar's icons): "Select
 * all", one row per category, and the button as the last row; the top button closes. Dressed
 * like {@code SubMenuDialog} through ThemeManager's menu and option hooks, so a theme dresses it
 * unawares. The box is a {@link GradientDrawable}: {@code setBackgroundColor} on {@code bg_submenu}
 * would lose its corners.
 */
public final class PickDialog extends BaseDialog {

    public static abstract class Go {
        /** An OR of the ticked categories. */
        public abstract void go(int mask);
    }

    private final Activity activity;
    private final String title;
    private final String okText;
    private final int[] cats;
    private final boolean sizes;
    private final Go go;
    private final String[] names;     // the rows' own wording; null asks Pick.label
    private final int start;          // the categories ticked at first; -1 is all of them
    private final boolean none;       // whether an empty choice is an answer too

    /** [0] "Select all", then the categories. */
    private boolean[] on;
    private long[] size;              // -1 while not measured
    private View[] rows;
    private TextView[] labels;
    private TextView[] values;
    private ImageView[] ticks;
    /** The cursor over the rows and, past them, the button. */
    private Column col;

    private int okRow;

    /** {@code bg_submenu}'s colour. */
    private static final int BOX = 0xFF8C94B2;
    private static final float CORNER = 10.0f;

    public PickDialog(Activity a, String title, String okText, int[] cats, boolean sizes, Go go) {
        this(a, title, okText, cats, sizes, -1, go);
    }

    /** Ticked as {@code start} says; -1 ticks all. */
    public PickDialog(Activity a, String title, String okText, int[] cats, boolean sizes, int start,
            Go go) {
        super(a, R.style.Dialog_Common);
        this.activity = a;
        this.title = title;
        this.okText = okText;
        this.cats = cats;
        this.sizes = sizes;
        this.go = go;
        this.names = null;
        this.start = start;
        this.none = false;
    }

    /** A choice that is a SETTING: named rows, ticked as {@code start} says, and none is valid. */
    public PickDialog(Activity a, String title, String okText, int[] cats, String[] names,
            int start, Go go) {
        super(a, R.style.Dialog_Common);
        this.activity = a;
        this.title = title;
        this.okText = okText;
        this.cats = cats;
        this.sizes = false;
        this.go = go;
        this.names = names;
        this.start = start;
        this.none = true;
    }

    @Override
    protected void onCreate(android.os.Bundle b) {
        super.onCreate(b);

        int n = cats.length;
        on = new boolean[n + 1];
        size = new long[n + 1];
        for (int i = 0; i <= n; i++) {
            on[i] = i == 0 || start < 0 || (start & cats[i - 1]) != 0;
            size[i] = -1L;
        }
        okRow = n + 1;

        rows = new View[n + 2];
        labels = new TextView[n + 2];
        values = new TextView[n + 2];
        ticks = new ImageView[n + 2];

        LinearLayout box = new LinearLayout(activity);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(8, 6, 8, 6);
        Integer bg = ThemeManager.INSTANCE.menuBGColor();
        GradientDrawable shape = new GradientDrawable();
        shape.setCornerRadius(CORNER);
        shape.setColor(bg == null ? BOX : bg.intValue());
        box.setBackgroundDrawable(shape);

        TextView head = new TextView(activity);
        head.setTextSize(15.0f);
        head.setTypeface(font());
        head.setGravity(Gravity.CENTER);
        head.setPadding(4, 2, 4, 6);
        head.setText(title);
        ThemeManager.INSTANCE.menuItemSetTextColor(head,
                activity.getResources().getColor(R.color.white), false);
        box.addView(head, -1, -2);

        row(0, activity.getString(R.string.ipp_pick_all));
        for (int i = 0; i < n; i++) {
            String name = names != null && i < names.length ? names[i]
                    : activity.getString(Pick.label(cats[i]));
            row(i + 1, name);
        }
        View[] list = new View[okRow];
        System.arraycopy(rows, 0, list, 0, okRow);
        col = new Column(activity, list, new Look(this));
        LinearLayout.LayoutParams cp = new LinearLayout.LayoutParams(-1, 0);
        cp.weight = 1.0f;
        box.addView(col.list(), cp);
        col.bar(activity, true, R.drawable.item_selected_submenu,
                activity.getResources().getColor(R.color.selected_text_color_submenu),
                activity.getResources().getColor(R.color.white));

        LinearLayout buttons = new LinearLayout(activity);
        buttons.setOrientation(LinearLayout.HORIZONTAL);
        buttons.setGravity(Gravity.CENTER);
        buttons.setPadding(0, 6, 0, 0);
        buttons.addView(button(okRow, okText), new LinearLayout.LayoutParams(-2, -2));
        box.addView(buttons, -1, -2);

        setContentView(box);

        Window w = getWindow();
        if (w != null) {
            WindowManager.LayoutParams lp = w.getAttributes();
            lp.width = (int) (activity.getResources().getDimension(R.dimen.submenu_width) * 1.7f);
            lp.gravity = Gravity.CENTER;
            w.setAttributes(lp);
        }

        col.set(0);
        paint(okRow);
        // A theme's row bitmap lands asynchronously on the view that asked, possibly after the row
        // was cleared again, leaving stray highlights. Repainting once it is cached settles it.
        Rows.watchFlat(new Repaint(this));
        if (sizes) new Thread(new Measure(this)).start();
    }

    @Override
    public void dismiss() {
        Rows.watchFlat(null);
        super.dismiss();
    }

    static final class Repaint implements Runnable {
        private final PickDialog d;

        Repaint(PickDialog d) { this.d = d; }

        public void run() {
            if (!d.isShowing() || d.repainting) return;
            d.repainting = true;
            try {
                d.paintAll();
            } finally {
                d.repainting = false;
            }
        }
    }

    private boolean repainting;

    /** The theme font: ThemeManager swaps MONOSPACE for it. */
    private static Typeface font() {
        return Typeface.create(Typeface.MONOSPACE, Typeface.BOLD);
    }

    static final class Look extends Column.Painter {
        private final PickDialog d;

        Look(PickDialog d) { this.d = d; }

        public void paint(int row) { d.paint(row); }
    }

    private View row(int i, String label) {
        LinearLayout r = new LinearLayout(activity);
        r.setLayoutParams(new android.view.ViewGroup.LayoutParams(-1, -2));
        r.setOrientation(LinearLayout.HORIZONTAL);
        r.setGravity(Gravity.CENTER_VERTICAL);
        r.setPadding(5, 3, 5, 3);
        r.setTag(Rows.FLAT);

        ImageView t = new ImageView(activity);
        t.setImageBitmap(box(false));
        if (i == 0) t.setVisibility(View.INVISIBLE);   // "Select all" is an action: no box, same indent
        t.setScaleType(ImageView.ScaleType.FIT_CENTER);
        t.setTag(Bar.TICK);
        LinearLayout.LayoutParams tp = new LinearLayout.LayoutParams(16, 16);
        tp.rightMargin = 6;
        r.addView(t, tp);

        TextView l = new TextView(activity);
        l.setTextSize(14.0f);
        l.setTypeface(font());
        l.setMaxLines(3);
        l.setId(Column.TITLE);
        l.setText(label);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, -2);
        lp.weight = 1.0f;
        r.addView(l, lp);

        TextView v = new TextView(activity);
        v.setTextSize(12.0f);
        v.setTypeface(font());
        v.setGravity(Gravity.END);
        v.setPadding(4, 0, 2, 0);
        v.setId(Column.TEXT);
        r.addView(v, -2, -2);

        rows[i] = r;
        labels[i] = l;
        values[i] = v;
        ticks[i] = t;
        return r;
    }

    private View button(int i, String text) {
        TextView b = new TextView(activity);
        b.setTag(Rows.FLAT);
        b.setTextSize(15.0f);
        b.setTypeface(font());
        b.setGravity(Gravity.CENTER);
        b.setPadding(6, 4, 6, 4);
        b.setSingleLine(true);
        b.setText(text);
        rows[i] = b;
        labels[i] = b;
        return b;
    }

    private void paintAll() {
        col.paintAll();
        paint(okRow);
    }

    private void paint(int i) {
        if (rows[i] == null) return;
        boolean focus = i == col.sel();
        int fg = activity.getResources().getColor(focus
                ? R.color.selected_text_color_submenu : R.color.white);

        if (i == okRow) {
            // As DialogUtil dresses its buttons; the stock pill first, in case the theme says nothing.
            labels[i].setBackgroundResource(focus ? R.drawable.conform_bg : R.drawable.cancle_bg);
            ThemeManager.INSTANCE.optionSetBackground(labels[i],
                    focus ? R.drawable.conform_bg : R.drawable.cancle_bg, focus);
            ThemeManager.INSTANCE.optionSetTextColor(labels[i], -1, focus);
            Rows.noSize(labels[i]);
            return;
        }

        // Cleared FIRST and the highlight guaranteed AFTER: while the theme bitmap is loading
        // ThemeManager leaves the view untouched, and a row losing the highlight would keep it.
        // 0 for an unfocused row, as SubmenuAdapter does — with no theme the resource is applied.
        if (!col.barred()) {
            rows[i].setBackgroundDrawable(null);
            ThemeManager.INSTANCE.menuItemSetBackground(rows[i],
                    focus ? R.drawable.item_selected_submenu : 0, focus);
            if (focus && rows[i].getBackground() == null) {
                rows[i].setBackgroundResource(R.drawable.item_selected_submenu);
            }
            // A theme's 640x91 highlight bitmap would set the row's height.
            Rows.noSize(rows[i]);
        }
        ThemeManager.INSTANCE.menuItemSetTextColor(labels[i], fg, focus);
        ThemeManager.INSTANCE.menuItemSetTextColor(values[i], fg, focus);
        // The colour the label ACTUALLY got: under a theme fg is ignored.
        Icons.menu(ticks[i], labels[i].getCurrentTextColor());
        ticks[i].setImageBitmap(box(on[i]));
        values[i].setText(sizeText(i));
    }

    /** On "Select all", the sum. */
    private String sizeText(int i) {
        if (!sizes) return "";
        long n = size[i];
        return n < 0L ? "…" : Pick.sizeText(n);
    }

    /** White strokes on transparent, tinted per row. Two bitmaps for the whole app. */
    private static Bitmap boxOff;
    private static Bitmap boxOn;

    /** A tick box, empty or ticked: every tick list of the app draws these. */
    public static Bitmap box(boolean ticked) {
        if (boxOff == null) {
            boxOff = frame();
            boxOn = frame();
            Canvas c = new Canvas(boxOn);
            Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
            p.setColor(Color.WHITE);
            p.setStrokeWidth(2.0f);
            p.setStyle(Paint.Style.STROKE);
            c.drawLine(4.0f, 8.5f, 7.0f, 11.5f, p);
            c.drawLine(7.0f, 11.5f, 12.5f, 4.5f, p);
        }
        return ticked ? boxOn : boxOff;
    }

    private static Bitmap frame() {
        Bitmap b = Bitmap.createBitmap(16, 16, Bitmap.Config.ARGB_8888);
        Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
        p.setColor(Color.WHITE);
        p.setStrokeWidth(1.5f);
        p.setStyle(Paint.Style.STROKE);
        new Canvas(b).drawRect(1.0f, 1.0f, 15.0f, 15.0f, p);
        return b;
    }

    @Override
    public void shortUp(int keyCode) {
        KeyMap k = KeyMap.INSTANCE;
        if (keyCode == k.getKEY_UP() || keyCode == k.getKEY_LEFT()) {
            move(-1);
        } else if (keyCode == k.getKEY_DOWN() || keyCode == k.getKEY_RIGHT()) {
            move(1);
        } else if (keyCode == k.getKEY_ENTER()) {
            enter();
        } else if (keyCode == k.getKEY_MENU()) {
            close();
        }
    }

    /** A long centre press is the shutdown prompt everywhere. */
    @Override
    public void longDown(int keyCode, int repeatCount) {
        if (keyCode == KeyMap.INSTANCE.getKEY_ENTER() && repeatCount == 3
                && activity instanceof BaseActivity) {
            ((BaseActivity) activity).askShutdown();
        }
    }

    @Override
    public void longDownFinish(int keyCode) {
    }

    private void move(int dir) {
        int old = col.sel();
        int next = Loop.step(old, dir, rows.length);
        if (next == old) return;
        col.move(next);
        if (old == okRow || next == okRow) paint(okRow);
    }

    private void enter() {
        if (col.sel() == okRow) {
            int mask = 0;
            for (int i = 0; i < cats.length; i++) {
                if (on[i + 1]) mask |= cats[i];
            }
            dismiss();
            if (go != null && (none || mask != 0)) go.go(mask);
            return;
        }
        toggle(col.sel());
    }

    private boolean allOn() {
        boolean all = true;
        for (int j = 1; j < on.length; j++) all &= on[j];
        return all;
    }

    /** "Select all": all on, or all off when they already are. */
    private void toggle(int i) {
        if (i == 0) {
            boolean all = allOn();
            for (int j = 1; j < on.length; j++) on[j] = !all;
        } else {
            on[i] = !on[i];
        }
        tie(i);
        paintAll();
    }

    /**
     * Clearing the covers clears Cover Flow's copies too ({@code Pick.clearLocked}), so the dialog
     * says so: their row follows the covers' both ways, and cannot be unticked while those are.
     */
    private void tie(int changed) {
        if (!sizes) return;
        int covers = -1, flow = -1;
        for (int j = 0; j < cats.length; j++) {
            if (cats[j] == Pick.COVERS) covers = j + 1;
            if (cats[j] == Pick.FLOW) flow = j + 1;
        }
        if (covers <= 0 || flow <= 0) return;
        if (on[covers]) on[flow] = true;
        else if (changed == covers) on[flow] = false;
    }

    private void close() {
        try {
            kotlin.jvm.functions.Function0 back = getOnBack();
            if (back != null) back.invoke();
        } catch (Throwable t) {
        }
        dismiss();
    }

    /**
     * Walks the cache directories, so never on the way to a frame. What is outside the total (the
     * deleted songs, which compares every file with the library) comes last and on its own, so the
     * rest is not kept waiting for it.
     */
    static final class Measure implements Runnable {
        private final PickDialog d;

        Measure(PickDialog d) { this.d = d; }

        public void run() {
            long[] out = new long[d.cats.length + 1];
            java.util.Arrays.fill(out, -1L);
            long total = 0L;
            for (int i = 0; i < d.cats.length; i++) {
                if (!Pick.inTotal(d.cats[i])) continue;
                long n = Pick.size(d.cats[i]);
                out[i + 1] = n;
                total += n;
            }
            out[0] = total;
            post(out);
            out = (long[]) out.clone();
            boolean more = false;
            for (int i = 0; i < d.cats.length; i++) {
                if (Pick.inTotal(d.cats[i]) || !d.isShowing()) continue;
                out[i + 1] = Pick.size(d.cats[i]);
                more = true;
            }
            if (more) post(out);
        }

        private void post(long[] out) {
            try {
                d.activity.runOnUiThread(new Apply(d, out));
            } catch (Throwable t) {
            }
        }
    }

    static final class Apply implements Runnable {
        private final PickDialog d;
        private final long[] out;

        Apply(PickDialog d, long[] out) {
            this.d = d;
            this.out = out;
        }

        public void run() {
            if (!d.isShowing()) return;
            for (int i = 0; i < out.length && i < d.size.length; i++) d.size[i] = out[i];
            d.paintAll();
        }
    }
}
