package com.innioasis.ipp;

import android.app.Activity;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.text.Layout;
import android.text.StaticLayout;
import android.view.Gravity;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.innioasis.fm.configs.KeyMap;
import com.innioasis.y1.R;
import com.innioasis.y1.base.BaseDialog;
import com.innioasis.y1.theme.ThemeManager;

import java.util.ArrayList;
import java.util.List;

/**
 * A one-time hint: the text, a "Don't show again" tick and a Close button, dressed like
 * {@link PickDialog}. Its wording is an asset row: the body is the text, the two values are the
 * button and the tick. The tick counts only when Close is pressed; the top button just closes.
 * A {@code ---} line splits the text into pages: the wheel turns them, and past the last one
 * moves on to the tick and the button. The window is as tall as its tallest page.
 */
public final class TipDialog extends BaseDialog {

    /** One "don't show again" for the hints of every Style preview. */
    public static final String STYLE_OFF = "style_hint_off";

    private static final int TICK = 0;
    private static final int NONE = -1;
    private static final int CLOSE = 1;
    private static final int BOX = 0xFF8C94B2;
    private static final float CORNER = 10.0f;

    private final Activity activity;
    private final String[] pages;
    private int page;
    private final String closeText;
    private final String tickText;
    private final String pref;
    private boolean off;
    private int sel = CLOSE;
    private final View[] rows = new View[2];
    private final TextView[] labels = new TextView[2];
    private ImageView tick;
    private TextView body;
    private TextView counter;

    /** Shows the hint of asset row {@code row} unless its tick was set; null when it is not shown. */
    public static TipDialog show(Activity a, String row, String pref) {
        try {
            if (Prefs.getBool(a, pref, false)) return null;
            Help.Row r = Help.row(a, row);
            if (r == null || r.body == null || r.body.trim().length() == 0) return null;
            String close = r.values != null && r.values.length > 0 ? r.values[0] : "OK";
            String never = r.values != null && r.values.length > 1 ? r.values[1] : "";
            TipDialog d = new TipDialog(a, r.body.trim(), close, never, pref);
            d.show();
            return d;
        } catch (Throwable t) {
            return null;
        }
    }

    private TipDialog(Activity a, String text, String closeText, String tickText, String pref) {
        super(a, R.style.Dialog_Common);
        this.activity = a;
        this.pages = split(text);
        if (pages.length > 1) sel = NONE;
        this.closeText = closeText;
        this.tickText = tickText;
        this.pref = pref;
    }

    @Override
    protected void onCreate(android.os.Bundle b) {
        super.onCreate(b);
        LinearLayout box = new LinearLayout(activity);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(10, 8, 10, 8);
        Integer bg = ThemeManager.INSTANCE.menuBGColor();
        GradientDrawable shape = new GradientDrawable();
        shape.setCornerRadius(CORNER);
        shape.setColor(bg == null ? BOX : bg.intValue());
        box.setBackgroundDrawable(shape);

        body = new TextView(activity);
        body.setTextSize(14.0f);
        body.setTypeface(font());
        body.setPadding(4, 2, 4, 8);
        body.setGravity(Gravity.CENTER);
        box.addView(body, -1, -2);
        counter = new TextView(activity);
        counter.setTextSize(12.0f);
        counter.setTypeface(font());
        counter.setGravity(Gravity.CENTER_HORIZONTAL);
        counter.setPadding(0, 0, 0, 4);
        counter.setVisibility(pages.length > 1 ? View.VISIBLE : View.GONE);
        box.addView(counter, -1, -2);

        LinearLayout r = new LinearLayout(activity);
        r.setOrientation(LinearLayout.HORIZONTAL);
        r.setGravity(Gravity.CENTER_VERTICAL);
        r.setPadding(5, 3, 5, 3);
        r.setTag(Rows.FLAT);
        tick = new ImageView(activity);
        tick.setImageBitmap(PickDialog.box(false));
        tick.setScaleType(ImageView.ScaleType.FIT_CENTER);
        LinearLayout.LayoutParams tp = new LinearLayout.LayoutParams(16, 16);
        tp.rightMargin = 6;
        r.addView(tick, tp);
        TextView l = new TextView(activity);
        l.setTextSize(14.0f);
        l.setTypeface(font());
        l.setMaxLines(2);
        l.setText(tickText);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, -2);
        lp.weight = 1.0f;
        r.addView(l, lp);
        rows[TICK] = r;
        labels[TICK] = l;
        box.addView(r, -1, -2);

        TextView btn = new TextView(activity);
        btn.setTag(Rows.FLAT);
        btn.setTextSize(15.0f);
        btn.setTypeface(font());
        btn.setGravity(Gravity.CENTER);
        btn.setPadding(6, 4, 6, 4);
        btn.setSingleLine(true);
        btn.setText(closeText);
        rows[CLOSE] = btn;
        labels[CLOSE] = btn;
        LinearLayout buttons = new LinearLayout(activity);
        buttons.setGravity(Gravity.CENTER);
        buttons.setPadding(0, 6, 0, 0);
        buttons.addView(btn, new LinearLayout.LayoutParams(-2, -2));
        box.addView(buttons, -1, -2);

        setContentView(box);
        int width = (int) (activity.getResources().getDimension(R.dimen.submenu_width) * 1.7f);
        Window w = getWindow();
        if (w != null) {
            WindowManager.LayoutParams wl = w.getAttributes();
            wl.width = width;
            wl.gravity = Gravity.CENTER;
            w.setAttributes(wl);
        }
        if (pages.length > 1) body.setHeight(tallest(width - 20 - 8) + 2 + 8);
        paint();
    }

    private static String[] split(String text) {
        List out = new ArrayList();
        StringBuilder cur = new StringBuilder();
        String[] lines = text.split("\n");
        for (int i = 0; i < lines.length; i++) {
            if (lines[i].trim().equals("---")) {
                out.add(cur.toString().trim());
                cur.setLength(0);
            } else {
                if (cur.length() > 0) cur.append('\n');
                cur.append(lines[i]);
            }
        }
        out.add(cur.toString().trim());
        return (String[]) out.toArray(new String[out.size()]);
    }

    /** Measured with the body's own paint, so turning a page never resizes the window. */
    private int tallest(int w) {
        int max = 0;
        for (int i = 0; i < pages.length; i++) {
            StaticLayout l = new StaticLayout(pages[i], body.getPaint(), w,
                    Layout.Alignment.ALIGN_CENTER, 1f, 0f, true);
            if (l.getHeight() > max) max = l.getHeight();
        }
        return max;
    }

    private static Typeface font() {
        return Typeface.create(Typeface.MONOSPACE, Typeface.BOLD);
    }

    private void paint() {
        int white = activity.getResources().getColor(R.color.white);
        body.setText(pages[page]);
        counter.setText((page + 1) + " / " + pages.length);
        ThemeManager.INSTANCE.menuItemSetTextColor(body, white, false);
        ThemeManager.INSTANCE.menuItemSetTextColor(counter, white, false);
        for (int i = 0; i < 2; i++) {
            boolean focus = i == sel;
            if (i == CLOSE) {
                labels[i].setBackgroundResource(focus ? R.drawable.conform_bg : R.drawable.cancle_bg);
                ThemeManager.INSTANCE.optionSetBackground(labels[i],
                        focus ? R.drawable.conform_bg : R.drawable.cancle_bg, focus);
                ThemeManager.INSTANCE.optionSetTextColor(labels[i], -1, focus);
                Rows.noSize(labels[i]);
                continue;
            }
            int fg = activity.getResources().getColor(focus
                    ? R.color.selected_text_color_submenu : R.color.white);
            rows[i].setBackgroundDrawable(null);
            ThemeManager.INSTANCE.menuItemSetBackground(rows[i],
                    focus ? R.drawable.item_selected_submenu : 0, focus);
            if (focus && rows[i].getBackground() == null) {
                rows[i].setBackgroundResource(R.drawable.item_selected_submenu);
            }
            Rows.noSize(rows[i]);
            ThemeManager.INSTANCE.menuItemSetTextColor(labels[i], fg, focus);
            Icons.menu(tick, labels[i].getCurrentTextColor());
            tick.setImageBitmap(PickDialog.box(off));
        }
    }

    @Override
    public void shortUp(int keyCode) {
        KeyMap k = KeyMap.INSTANCE;
        boolean back = keyCode == k.getKEY_UP() || keyCode == k.getKEY_LEFT();
        if (back || keyCode == k.getKEY_DOWN() || keyCode == k.getKEY_RIGHT()) {
            step(back ? -1 : 1);
            paint();
        } else if (keyCode == k.getKEY_ENTER()) {
            if (sel == NONE) {
                step(1);
                paint();
            } else if (sel == TICK) {
                off = !off;
                paint();
            } else {
                if (off) Prefs.setBool(activity, pref, true);
                dismiss();
            }
        } else if (keyCode == k.getKEY_MENU()) {
            dismiss();
        }
    }

    /**
     * Pages first, then the tick and the button. Past either end only with {@link Loop}: from the
     * button back to the first page (or the tick), and the other way.
     */
    private void step(int d) {
        int last = pages.length - 1;
        boolean one = pages.length == 1;
        if (d > 0) {
            if (sel == CLOSE) {
                if (Loop.on()) {
                    page = 0;
                    sel = one ? TICK : NONE;
                }
            } else if (sel == TICK) {
                sel = CLOSE;
            } else if (page < last) {
                page++;
            } else {
                sel = TICK;
            }
        } else {
            if (sel == CLOSE) {
                sel = TICK;
            } else if (sel == TICK && !one) {
                sel = NONE;
            } else if (sel == NONE && page > 0) {
                page--;
            } else if (Loop.on()) {
                page = last;
                sel = CLOSE;
            }
        }
    }

    @Override
    public void longDown(int keyCode, int repeatCount) {
    }

    @Override
    public void longDownFinish(int keyCode) {
    }
}
