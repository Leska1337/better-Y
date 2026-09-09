package com.innioasis.ipp;

import android.app.Activity;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.innioasis.fm.configs.KeyMap;
import com.innioasis.y1.R;
import com.innioasis.y1.base.BaseActivity;
import com.innioasis.y1.base.BaseDialog;
import com.innioasis.y1.theme.ThemeManager;

/**
 * A dialog that is a list to pick ONE row out of - the "Data backup" row uses it twice: once to
 * ask Save or Load, once to pick which archive to read back.
 *
 * It is {@link PickDialog} without the ticks and without the button: a centre press takes the row
 * the cursor is on, and there is nothing else to confirm. The top button closes it, as it closes
 * the innermost thing on screen everywhere in this app.
 *
 * Everything about how it is dressed is {@code PickDialog}'s, for the same reasons written down
 * there: the rounded box is a {@link GradientDrawable} so a theme's {@code menuBackgroundColor}
 * can replace the colour without taking the corners with it, the rows go through
 * {@code ThemeManager.menuItemSetBackground} / {@code menuItemSetTextColor}, each row is painted
 * in three steps because ThemeManager may do nothing at all, and {@code Rows.noSize} keeps a
 * theme's highlight bitmap from dictating the height of a row.
 *
 * Authored in Java (build/ipp-java); raw types and named nested classes only.
 */
public final class BackupDialog extends BaseDialog {

    /** What to do with the row the user took. Named class: d8 crashes on anonymous ones. */
    public static abstract class Go {
        public abstract void go(int row);
    }

    private final Activity activity;
    private final String title;
    private final String[] rows;
    private final String[] extras;
    private final Go go;

    private View[] views;
    private TextView[] labels;
    private TextView[] values;
    private int sel;

    /** {@code bg_submenu}'s own colour, for when the theme has nothing to say. */
    private static final int BOX = 0xFF8C94B2;
    private static final float CORNER = 10.0f;

    /**
     * @param rows   one label per line, in the order they are shown
     * @param extras the right-hand column, or null when the rows carry nothing but a label
     */
    public BackupDialog(Activity a, String title, String[] rows, String[] extras, Go go) {
        super(a, R.style.Dialog_Common);
        this.activity = a;
        this.title = title;
        this.rows = rows;
        this.extras = extras;
        this.go = go;
    }

    @Override
    protected void onCreate(android.os.Bundle b) {
        super.onCreate(b);

        int n = rows.length;
        views = new View[n];
        labels = new TextView[n];
        values = new TextView[n];
        sel = 0;

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

        for (int i = 0; i < n; i++) box.addView(row(i), -1, -2);

        setContentView(box);

        Window w = getWindow();
        if (w != null) {
            WindowManager.LayoutParams lp = w.getAttributes();
            lp.width = (int) (activity.getResources().getDimension(R.dimen.submenu_width) * 1.7f);
            lp.gravity = Gravity.CENTER;
            w.setAttributes(lp);
        }

        paintAll();
        // A theme's row bitmap arrives from a background load and is applied to the view that
        // asked for it, however long ago; each one that lands after its row was cleared again
        // leaves that row highlighted. This repaint is what settles it - see PickDialog.
        Rows.watchFlat(new Repaint(this));
    }

    @Override
    public void dismiss() {
        Rows.watchFlat(null);
        super.dismiss();
    }

    /** Named (d8 crashes on anonymous classes). */
    static final class Repaint implements Runnable {
        private final BackupDialog d;

        Repaint(BackupDialog d) { this.d = d; }

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
     * The theme's font, as everywhere else that builds views in code: the app theme asks for
     * {@code monospace} and ThemeManager swaps that typeface for the theme's own font.ttf.
     */
    private static Typeface font() {
        return Typeface.create(Typeface.MONOSPACE, Typeface.BOLD);
    }

    private View row(int i) {
        LinearLayout r = new LinearLayout(activity);
        r.setOrientation(LinearLayout.HORIZONTAL);
        r.setGravity(Gravity.CENTER_VERTICAL);
        r.setPadding(5, 3, 5, 3);
        r.setTag(Rows.FLAT);      // see paint(): the theme's highlight must not dictate a height

        TextView l = new TextView(activity);
        l.setTextSize(14.0f);
        l.setTypeface(font());
        l.setMaxLines(2);
        l.setText(rows[i]);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, -2);
        lp.weight = 1.0f;
        r.addView(l, lp);

        TextView v = new TextView(activity);
        v.setTextSize(12.0f);
        v.setTypeface(font());
        v.setGravity(Gravity.END);
        v.setPadding(4, 0, 2, 0);
        v.setSingleLine(true);
        v.setText(extras == null || i >= extras.length || extras[i] == null ? "" : extras[i]);
        r.addView(v, -2, -2);

        views[i] = r;
        labels[i] = l;
        values[i] = v;
        return r;
    }

    // ---------------------------------------------------------------- painting

    private void paintAll() {
        for (int i = 0; i < views.length; i++) paint(i);
    }

    private void paint(int i) {
        if (views[i] == null) return;
        boolean focus = (i == sel);
        int fg = activity.getResources().getColor(focus
                ? R.color.selected_text_color_submenu : R.color.white);

        // Cleared FIRST and the highlight guaranteed AFTER, because ThemeManager may do neither:
        // its setBackground leaves the view untouched while the theme's bitmap is not in the cache
        // yet, so a row losing the highlight can simply keep it.
        views[i].setBackgroundDrawable(null);
        // 0 for an unfocused row, exactly as SubmenuAdapter does it: with no theme the resource is
        // applied as it stands, so handing over the highlight drawable would paint every row.
        ThemeManager.INSTANCE.menuItemSetBackground(views[i],
                focus ? R.drawable.item_selected_submenu : 0, focus);
        if (focus && views[i].getBackground() == null) {
            views[i].setBackgroundResource(R.drawable.item_selected_submenu);
        }
        Rows.noSize(views[i]);
        ThemeManager.INSTANCE.menuItemSetTextColor(labels[i], fg, focus);
        ThemeManager.INSTANCE.menuItemSetTextColor(values[i], fg, focus);
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
            take();
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
        if (next < 0 || next >= views.length) return;      // no wrapping: the list is short
        sel = next;
        paint(old);
        paint(sel);
    }

    /** The dialog goes first: what the row starts may put a dialog of its own on the screen. */
    private void take() {
        int row = sel;
        dismiss();
        if (go != null) go.go(row);
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
}
