package com.innioasis.ipp;

import android.app.Activity;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
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
 * A list to pick ONE row from: Save/Load and the archive in "Data backup", a taken name in M3U
 * import/export. {@link PickDialog} without ticks or button — the centre press takes the row —
 * and dressed exactly like it, for the reasons written there.
 */
public final class BackupDialog extends BaseDialog {

    public static abstract class Go {
        public abstract void go(int row);

        /** With the switch row's state, for a dialog that has one. */
        public void go(int row, boolean all) {
            go(row);
        }
    }

    private final Activity activity;
    private final String title;
    private final String[] rows;
    private final String[] extras;
    private final Go go;

    /** An On/Off row under the choices ("Same for the rest"); the press flips it, the dialog stays. */
    private final String toggle;
    private boolean toggled;

    /** Smaller text under the title, or null. */
    private CharSequence note;

    private View[] views;
    private TextView[] labels;
    private TextView[] values;
    private Column col;

    /** {@code bg_submenu}'s own colour, for when the theme has nothing to say. */
    private static final int BOX = 0xFF8C94B2;
    private static final float CORNER = 10.0f;

    /** @param extras the right-hand column, or null */
    public BackupDialog(Activity a, String title, String[] rows, String[] extras, Go go) {
        this(a, title, rows, extras, null, go);
    }

    /** @param toggle the switch row's label, or null for none */
    public BackupDialog(Activity a, String title, String[] rows, String[] extras, String toggle,
            Go go) {
        super(a, R.style.Dialog_Common);
        this.activity = a;
        this.title = title;
        this.rows = rows;
        this.extras = extras;
        this.toggle = toggle;
        this.go = go;
    }

    /** Set before {@code show()}. */
    public BackupDialog note(CharSequence n) {
        note = n;
        return this;
    }

    @Override
    protected void onCreate(android.os.Bundle b) {
        super.onCreate(b);

        int n = rows.length + (toggle != null ? 1 : 0);
        views = new View[n];
        labels = new TextView[n];
        values = new TextView[n];

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

        if (note != null) {
            TextView nt = new TextView(activity);
            nt.setTextSize(12.5f);
            nt.setTypeface(Typeface.MONOSPACE);
            nt.setPadding(6, 0, 6, 8);
            nt.setText(note);
            ThemeManager.INSTANCE.menuItemSetTextColor(nt,
                    activity.getResources().getColor(R.color.white), false);
            box.addView(nt, -1, -2);
        }

        for (int i = 0; i < n; i++) row(i);
        col = new Column(activity, views, new Paint(this));
        box.addView(col.list(), -1, -2);
        col.bar(activity, true, R.drawable.item_selected_submenu,
                activity.getResources().getColor(R.color.selected_text_color_submenu),
                activity.getResources().getColor(R.color.white));

        setContentView(box);

        Window w = getWindow();
        if (w != null) {
            WindowManager.LayoutParams lp = w.getAttributes();
            lp.width = (int) (activity.getResources().getDimension(R.dimen.submenu_width) * 1.7f);
            lp.gravity = Gravity.CENTER;
            w.setAttributes(lp);
            // a question waits for its answer: no dimming, no screensaver while it is up
            w.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        }

        col.set(0);
        // A late theme bitmap lands on a row already cleared; see PickDialog.
        Rows.watchFlat(new Repaint(this));
    }

    @Override
    public void dismiss() {
        Rows.watchFlat(null);
        super.dismiss();
    }

    static final class Repaint implements Runnable {
        private final BackupDialog d;

        Repaint(BackupDialog d) { this.d = d; }

        public void run() {
            if (!d.isShowing() || d.repainting) return;
            d.repainting = true;
            try {
                d.col.paintAll();
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

    static final class Paint extends Column.Painter {
        private final BackupDialog d;

        Paint(BackupDialog d) { this.d = d; }

        public void paint(int row) { d.paint(row); }
    }

    private View row(int i) {
        LinearLayout r = new LinearLayout(activity);
        r.setLayoutParams(new ViewGroup.LayoutParams(-1, -2));
        r.setOrientation(LinearLayout.HORIZONTAL);
        r.setGravity(Gravity.CENTER_VERTICAL);
        r.setPadding(5, 3, 5, 3);
        r.setTag(Rows.FLAT);

        TextView l = new TextView(activity);
        l.setTextSize(14.0f);
        l.setTypeface(font());
        l.setMaxLines(2);
        l.setId(Column.TITLE);
        l.setText(i < rows.length ? rows[i] : toggle);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, -2);
        lp.weight = 1.0f;
        r.addView(l, lp);

        TextView v = new TextView(activity);
        v.setTextSize(12.0f);
        v.setTypeface(font());
        v.setGravity(Gravity.END);
        v.setPadding(4, 0, 2, 0);
        v.setSingleLine(true);
        v.setId(Column.TEXT);
        if (i >= rows.length) {
            v.setText(activity.getString(toggled ? R.string.ipp_on : R.string.ipp_off));
        } else {
            v.setText(extras == null || i >= extras.length || extras[i] == null ? "" : extras[i]);
        }
        r.addView(v, -2, -2);

        views[i] = r;
        labels[i] = l;
        values[i] = v;
        return r;
    }

    private void paint(int i) {
        if (views[i] == null) return;
        boolean focus = i == col.sel();
        int fg = activity.getResources().getColor(focus
                ? R.color.selected_text_color_submenu : R.color.white);

        // Cleared first and the highlight guaranteed after: ThemeManager may do neither while the
        // theme bitmap is loading. 0 for an unfocused row, as SubmenuAdapter does.
        if (!col.barred()) {
            views[i].setBackgroundDrawable(null);
            ThemeManager.INSTANCE.menuItemSetBackground(views[i],
                    focus ? R.drawable.item_selected_submenu : 0, focus);
            if (focus && views[i].getBackground() == null) {
                views[i].setBackgroundResource(R.drawable.item_selected_submenu);
            }
            Rows.noSize(views[i]);
        }
        ThemeManager.INSTANCE.menuItemSetTextColor(labels[i], fg, focus);
        ThemeManager.INSTANCE.menuItemSetTextColor(values[i], fg, focus);
    }

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
        col.step(dir);
    }

    /** Dismissed first: what the row starts may open a dialog of its own. */
    private void take() {
        int row = col.sel();
        if (row >= rows.length) {
            toggled = !toggled;
            values[row].setText(activity.getString(toggled ? R.string.ipp_on : R.string.ipp_off));
            return;
        }
        dismiss();
        if (go != null) go.go(row, toggled);
    }

    private void close() {
        try {
            kotlin.jvm.functions.Function0 back = getOnBack();
            if (back != null) back.invoke();
        } catch (Throwable t) {
        }
        dismiss();
    }
}
