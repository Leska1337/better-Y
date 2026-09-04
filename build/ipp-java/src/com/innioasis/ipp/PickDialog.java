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
 * The tick list in front of "Cache library" and "Clear cache": which categories the button touches.
 *
 * A plain table with no borders: one row per category, the tick on the left, the label next to it
 * and its weight on disk at the end (clearing only, where the number is known). The first row is
 * "Select all" — it carries no tick of its own, it simply turns every category on or off. The last
 * row is the button, so the wheel runs over the whole dialog in one line; there is no Cancel,
 * because the top button closes the innermost thing on screen everywhere in this app.
 *
 * The look is {@code SubMenuDialog}'s, because that is the app's list-inside-a-dialog: a rounded box
 * in the menu's background colour, rows highlighted through
 * {@code ThemeManager.menuItemSetBackground} / {@code menuItemSetTextColor} and the button dressed
 * by {@code optionSetBackground} / {@code optionSetTextColor}, which is what every stock dialog's
 * buttons go through — so a theme dresses this dialog without knowing about it.
 *
 * The box is built as a {@link GradientDrawable} rather than {@code bg_submenu}: that drawable
 * carries the rounded corners, but a theme's {@code menuBackgroundColor} has to replace the colour,
 * and {@code setBackgroundColor} would replace the whole drawable — corners and all.
 *
 * Authored in Java (build/ipp-java); raw types and named nested classes only — see the notes in
 * CLAUDE.md about the bundled d8.
 */
public final class PickDialog extends BaseDialog {

    /** What to do with the categories the user ticked. Named class: d8 crashes on anonymous ones. */
    public static abstract class Go {
        /** {@code mask} is an OR of {@code Pick.COVERS} / {@code TAGS} / {@code SYSTEM}; 0 = none. */
        public abstract void go(int mask);
    }

    private final Activity activity;
    private final String title;
    private final String okText;
    private final int[] cats;
    private final boolean sizes;
    private final Go go;

    /** One entry per line the wheel can stop on: "select all", the categories, ok, cancel. */
    private boolean[] on;
    private long[] size;              // -1 while not measured
    private View[] rows;
    private TextView[] labels;
    private TextView[] values;
    private ImageView[] ticks;
    private int sel;

    private int okRow;

    /** {@code bg_submenu}'s own colour, for when the theme has nothing to say. */
    private static final int BOX = 0xFF8C94B2;
    private static final float CORNER = 10.0f;

    public PickDialog(Activity a, String title, String okText, int[] cats, boolean sizes, Go go) {
        super(a, R.style.Dialog_Common);
        this.activity = a;
        this.title = title;
        this.okText = okText;
        this.cats = cats;
        this.sizes = sizes;
        this.go = go;
    }

    @Override
    protected void onCreate(android.os.Bundle b) {
        super.onCreate(b);

        int n = cats.length;
        on = new boolean[n + 1];
        size = new long[n + 1];
        for (int i = 0; i <= n; i++) {
            on[i] = true;                 // "Select all" is on to begin with, so everything is
            size[i] = -1L;
        }
        okRow = n + 1;
        sel = 0;                          // the wheel starts at the top, on "Select all"

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

        // "Select all", then one row per category.
        box.addView(row(0, activity.getString(R.string.ipp_pick_all)), -1, -2);
        for (int i = 0; i < n; i++) {
            box.addView(row(i + 1, activity.getString(Pick.label(cats[i]))), -1, -2);
        }

        // One button, centred. There is no Cancel: the top button closes the innermost thing on
        // screen everywhere in this app, and here that is the dialog.
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

        paintAll();
        // A theme's row bitmaps are loaded in the background and applied by a callback that holds
        // the view which asked for them. Scroll faster than the first load and several rows have a
        // highlight in flight; each lands after its row has been cleared again, and the dialog
        // ends up highlighted end to end. A list never shows this because its next bind paints
        // over it — this is that repaint: once a bitmap has arrived it is cached, so painting again
        // is synchronous and settles it.
        Rows.watchFlat(new Repaint(this));
        if (sizes) new Thread(new Measure(this)).start();
    }

    @Override
    public void dismiss() {
        Rows.watchFlat(null);
        super.dismiss();
    }

    /** Named (d8 here crashes on anonymous classes). */
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

    /**
     * The theme's font, exactly as everywhere else that builds views in code: the app theme asks for
     * {@code monospace} and ThemeManager swaps that typeface for the theme's own font.ttf.
     */
    private static Typeface font() {
        return Typeface.create(Typeface.MONOSPACE, Typeface.BOLD);
    }

    private View row(int i, String label) {
        LinearLayout r = new LinearLayout(activity);
        r.setOrientation(LinearLayout.HORIZONTAL);
        r.setGravity(Gravity.CENTER_VERTICAL);
        r.setPadding(5, 3, 5, 3);
        r.setTag(Rows.FLAT);      // see paint(): the theme's highlight must not dictate a height

        // The tick leads the row. "Select all" keeps the view but never shows it, so every label
        // starts at the same x.
        ImageView t = new ImageView(activity);
        t.setImageBitmap(tick());
        t.setScaleType(ImageView.ScaleType.FIT_CENTER);
        LinearLayout.LayoutParams tp = new LinearLayout.LayoutParams(16, 16);
        tp.rightMargin = 6;
        r.addView(t, tp);

        TextView l = new TextView(activity);
        l.setTextSize(14.0f);
        l.setTypeface(font());
        // NOT single-line: a category says what it holds, and that does not fit on one line.
        l.setMaxLines(3);
        l.setText(label);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, -2);
        lp.weight = 1.0f;
        r.addView(l, lp);

        TextView v = new TextView(activity);
        v.setTextSize(12.0f);
        v.setTypeface(font());
        v.setGravity(Gravity.END);
        v.setPadding(4, 0, 2, 0);
        r.addView(v, -2, -2);

        rows[i] = r;
        labels[i] = l;
        values[i] = v;
        ticks[i] = t;
        return r;
    }

    private View button(int i, String text) {
        TextView b = new TextView(activity);
        b.setTag(Rows.FLAT);      // a theme's dialog-option bitmap sizes it the same way a row's does
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

    // ---------------------------------------------------------------- painting

    private void paintAll() {
        for (int i = 0; i < rows.length; i++) paint(i);
    }

    private void paint(int i) {
        if (rows[i] == null) return;
        boolean focus = (i == sel);
        int fg = activity.getResources().getColor(focus
                ? R.color.selected_text_color_submenu : R.color.white);

        if (i == okRow) {
            // Exactly what DialogUtil does to its own buttons — optionSetBackground /
            // optionSetTextColor are the theme's hooks for a dialog button, and going straight to
            // setBackgroundResource (as this did at first) is why it stayed stock-coloured under a
            // theme. -1 (white) is the default text colour stock passes there.
            // Same reason as the rows below: the stock pill goes on first, so a theme that answers
            // with nothing leaves a button that still looks like a button.
            labels[i].setBackgroundResource(focus ? R.drawable.conform_bg : R.drawable.cancle_bg);
            ThemeManager.INSTANCE.optionSetBackground(labels[i],
                    focus ? R.drawable.conform_bg : R.drawable.cancle_bg, focus);
            ThemeManager.INSTANCE.optionSetTextColor(labels[i], -1, focus);
            Rows.noSize(labels[i]);
            return;
        }

        // Cleared FIRST, and the highlight guaranteed AFTER, because ThemeManager may do neither.
        // Its setBackground leaves the view untouched whenever the theme's bitmap is not in its
        // cache yet (it returns "loading" and lets a callback paint later), so a row that is losing
        // the highlight can simply keep it — which is what left every row the cursor had passed
        // painted blue, at any scrolling speed. Here the dialog decides: nothing, then whatever the
        // theme has to say, then a fallback if it said nothing at all.
        rows[i].setBackgroundDrawable(null);
        // 0 for an unfocused row, exactly as SubmenuAdapter does it: with no theme the resource is
        // applied as it stands, so handing over the highlight drawable would paint every row.
        ThemeManager.INSTANCE.menuItemSetBackground(rows[i],
                focus ? R.drawable.item_selected_submenu : 0, focus);
        if (focus && rows[i].getBackground() == null) {
            rows[i].setBackgroundResource(R.drawable.item_selected_submenu);
        }
        // A theme's highlight is a bitmap drawn for a 640px-wide device (640x91), and a view's
        // height is at least its background's minimum — so the focused row grew to the bitmap's
        // own height and shoved the rest of the dialog about. Same defect the list rows have, same
        // answer: wrap it in a drawable with no intrinsic size. The tag is for the asynchronous
        // applier, which sets a fresh bitmap of its own long after this call.
        Rows.noSize(rows[i]);
        ThemeManager.INSTANCE.menuItemSetTextColor(labels[i], fg, focus);
        ThemeManager.INSTANCE.menuItemSetTextColor(values[i], fg, focus);
        // The tick takes the colour the label ACTUALLY got, not the one we asked for: under a theme
        // menuItemSetTextColor answers with the theme's own colour (its menuItemTextColor /
        // menuItemSelectedTextColor) and ignores fg entirely, so the two parted company — a white
        // tick beside black text, and unchanged as the cursor arrived. Reading the colour back off
        // the label is the rule every menu icon in the mod follows (Icons.menu), and it also gets
        // the tint mode right: SRC_IN, the shape being carried by the bitmap's alpha.
        Icons.menu(ticks[i], labels[i].getCurrentTextColor());
        // Row 0 is "Select all" — it drives the ticks below it and carries none of its own.
        ticks[i].setVisibility(i > 0 && on[i] ? View.VISIBLE : View.INVISIBLE);
        values[i].setText(sizeText(i));
    }

    /**
     * The weight of one category — and on the "Select all" row the sum, which is the number the
     * Settings row itself shows. Nothing until the measurement is in.
     */
    private String sizeText(int i) {
        if (!sizes) return "";
        long n = size[i];
        return n < 0L ? "…" : Pick.sizeText(n);
    }

    /**
     * The tick itself, drawn rather than shipped as an asset: two strokes on a transparent square,
     * tinted per row through {@code setColorFilter}, so it follows the theme's text colour and the
     * focus highlight the way every other mark in the app does. One bitmap for the whole app.
     */
    private static Bitmap mark;

    private static Bitmap tick() {
        if (mark != null) return mark;
        Bitmap b = Bitmap.createBitmap(16, 16, Bitmap.Config.ARGB_8888);
        Canvas c = new Canvas(b);
        Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
        p.setColor(Color.WHITE);
        p.setStrokeWidth(2.4f);
        p.setStyle(Paint.Style.STROKE);
        c.drawLine(2.5f, 8.5f, 6.5f, 12.5f, p);
        c.drawLine(6.5f, 12.5f, 13.5f, 3.5f, p);
        mark = b;
        return b;
    }

    // ---------------------------------------------------------------- the wheel

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

    /** Long centre press is the shutdown prompt everywhere in this app; keep it working here. */
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
        int old = sel;
        int next = sel + dir;
        if (next < 0 || next >= rows.length) return;      // no wrapping: the list is short
        sel = next;
        paint(old);
        paint(sel);
    }

    private void enter() {
        if (sel == okRow) {
            int mask = 0;
            for (int i = 0; i < cats.length; i++) {
                if (on[i + 1]) mask |= cats[i];
            }
            dismiss();
            if (go != null && mask != 0) go.go(mask);
            return;
        }
        toggle(sel);
    }

    /**
     * "Select all" turns every category on, or — when they are all on already — off. It shows no
     * tick of its own, so its state is simply what the rows below it say.
     */
    private void toggle(int i) {
        if (i == 0) {
            boolean all = true;
            for (int j = 1; j < on.length; j++) all &= on[j];
            for (int j = 1; j < on.length; j++) on[j] = !all;
        } else {
            on[i] = !on[i];
        }
        paintAll();
    }

    private void close() {
        try {
            kotlin.jvm.functions.Function0 back = getOnBack();
            if (back != null) back.invoke();
        } catch (Throwable t) {
            // nothing to do
        }
        dismiss();
    }

    // ---------------------------------------------------------------- the weight column

    /**
     * Measuring means walking the cache directories, so it is never done on the way to a frame: the
     * dialog opens with "…" in the column and fills the numbers in when they arrive.
     */
    static final class Measure implements Runnable {
        private final PickDialog d;

        Measure(PickDialog d) { this.d = d; }

        public void run() {
            final long[] out = new long[d.cats.length + 1];
            long total = 0L;
            for (int i = 0; i < d.cats.length; i++) {
                long n = Pick.size(d.cats[i]);
                out[i + 1] = n;
                total += n;
            }
            out[0] = total;
            try {
                d.activity.runOnUiThread(new Apply(d, out));
            } catch (Throwable t) {
                // the dialog is gone
            }
        }
    }

    /** Named (d8 here crashes on anonymous classes). */
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
