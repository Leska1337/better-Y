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
 * The category tick list in front of "Cache library" and "Clear cache": "Select all", one row per
 * category with its weight on disk, and the button as the last row; the top button closes. Dressed
 * like {@code SubMenuDialog} through ThemeManager's menu and option hooks, so a theme dresses it
 * unawares. The box is a {@link GradientDrawable}: {@code setBackgroundColor} on {@code bg_submenu}
 * would lose its corners.
 */
public final class PickDialog extends BaseDialog {

    public static abstract class Go {
        /** An OR of {@code Pick.COVERS} / {@code TAGS} / {@code SYSTEM}. */
        public abstract void go(int mask);
    }

    private final Activity activity;
    private final String title;
    private final String okText;
    private final int[] cats;
    private final boolean sizes;
    private final Go go;

    /** [0] "Select all", then the categories. */
    private boolean[] on;
    private long[] size;              // -1 while not measured
    private View[] rows;
    private TextView[] labels;
    private TextView[] values;
    private ImageView[] ticks;
    private int sel;

    private int okRow;

    /** {@code bg_submenu}'s colour. */
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
            on[i] = true;
            size[i] = -1L;
        }
        okRow = n + 1;
        sel = 0;

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

        box.addView(row(0, activity.getString(R.string.ipp_pick_all)), -1, -2);
        for (int i = 0; i < n; i++) {
            box.addView(row(i + 1, activity.getString(Pick.label(cats[i]))), -1, -2);
        }

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

    private View row(int i, String label) {
        LinearLayout r = new LinearLayout(activity);
        r.setOrientation(LinearLayout.HORIZONTAL);
        r.setGravity(Gravity.CENTER_VERTICAL);
        r.setPadding(5, 3, 5, 3);
        r.setTag(Rows.FLAT);

        // "Select all" keeps an invisible tick, so every label starts at the same x.
        ImageView t = new ImageView(activity);
        t.setImageBitmap(tick());
        t.setScaleType(ImageView.ScaleType.FIT_CENTER);
        LinearLayout.LayoutParams tp = new LinearLayout.LayoutParams(16, 16);
        tp.rightMargin = 6;
        r.addView(t, tp);

        TextView l = new TextView(activity);
        l.setTextSize(14.0f);
        l.setTypeface(font());
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
        for (int i = 0; i < rows.length; i++) paint(i);
    }

    private void paint(int i) {
        if (rows[i] == null) return;
        boolean focus = (i == sel);
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
        rows[i].setBackgroundDrawable(null);
        ThemeManager.INSTANCE.menuItemSetBackground(rows[i],
                focus ? R.drawable.item_selected_submenu : 0, focus);
        if (focus && rows[i].getBackground() == null) {
            rows[i].setBackgroundResource(R.drawable.item_selected_submenu);
        }
        // A theme's 640x91 highlight bitmap would set the row's height.
        Rows.noSize(rows[i]);
        ThemeManager.INSTANCE.menuItemSetTextColor(labels[i], fg, focus);
        ThemeManager.INSTANCE.menuItemSetTextColor(values[i], fg, focus);
        // The colour the label ACTUALLY got: under a theme fg is ignored.
        Icons.menu(ticks[i], labels[i].getCurrentTextColor());
        ticks[i].setVisibility(i > 0 && on[i] ? View.VISIBLE : View.INVISIBLE);
        values[i].setText(sizeText(i));
    }

    /** On "Select all", the sum. */
    private String sizeText(int i) {
        if (!sizes) return "";
        long n = size[i];
        return n < 0L ? "…" : Pick.sizeText(n);
    }

    /** White strokes on transparent, tinted per row. One bitmap for the whole app. */
    private static Bitmap mark;

    public static Bitmap tick() {
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
        int old = sel;
        int next = Loop.step(sel, dir, rows.length);
        if (next == sel) return;
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

    /** "Select all": all on, or all off when they already are. */
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
        }
        dismiss();
    }

    /** Walks the cache directories, so never on the way to a frame. */
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
