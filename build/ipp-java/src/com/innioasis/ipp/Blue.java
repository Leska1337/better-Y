package com.innioasis.ipp;

import android.bluetooth.BluetoothDevice;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.SweepGradient;
import android.graphics.Typeface;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.LinearInterpolator;
import android.view.animation.RotateAnimation;
import android.widget.LinearLayout;
import android.widget.TextView;

import androidx.lifecycle.MutableLiveData;
import androidx.recyclerview.widget.RecyclerView;

import com.innioasis.music.adapter.SubmenuAdapter;
import com.innioasis.music.util.SubMenuDialog;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.activity.BluetoothActivity;
import com.innioasis.y1.activity.IppActivity;
import com.innioasis.y1.base.BaseBindingAdapter;
import com.innioasis.y1.databinding.ActivityBlutoothBinding;
import com.innioasis.y1.theme.ThemeManager;
import com.innioasis.y1.utils.BLUtils;
import com.innioasis.y1.utils.DialogUtil;
import com.innioasis.y1.utils.InputMethodDialog;

import java.util.ArrayList;

/**
 * The Bluetooth screen's paired devices: a long press on one opens a menu instead of going
 * straight to the unpair dialog, and the second entry renames it.
 *
 * The rename is OURS, not the system's: Android 4.2 has no public way to set a device's alias
 * ({@code BluetoothDevice.setAlias} is @hide on this platform), so the chosen name is kept in the
 * ipp preferences under the device's MAC address and applied wherever a row draws a name. That also
 * means it cannot be lost by the stack re-reading the device's advertised name, and unpairing the
 * device leaves it behind harmlessly (pairing it again shows the name the user gave it).
 */
public final class Blue {

    private Blue() {}

    private static final String KEY = "bt_name:";

    /** The name a row shows: the user's own if there is one, the device's otherwise. */
    public static String name(BluetoothDevice d) {
        if (d == null) return "";
        try {
            SharedPreferences p = prefs();
            String addr = d.getAddress();
            if (p != null && addr != null) {
                String mine = p.getString(KEY + addr, null);
                if (mine != null && mine.length() != 0) return mine;
            }
        } catch (Throwable t) {
            // fall through to the device's own name
        }
        String n = d.getName();
        return n == null ? "" : n;
    }

    // ------------------------------------------------------------------ the long-press menu

    /**
     * Long TOP on a paired device. Stock raised the unpair confirm straight away; it is the first
     * of two entries now. Dispatched by string, like every other menu the mod builds.
     */
    public static void menu(BluetoothActivity a, BluetoothDevice d) {
        if (a == null || d == null) return;
        ArrayList l = new ArrayList();
        l.add(a.getString(R.string.ipp_bl_forget));
        l.add(a.getString(R.string.ipp_bl_rename));
        new SubMenuDialog(a, l, new Pick(a, d), R.style.Dialog_Common).show();
    }

    private static final class Pick implements SubMenuDialog.Callback {
        private final BluetoothActivity a;
        private final BluetoothDevice d;

        Pick(BluetoothActivity a, BluetoothDevice d) {
            this.a = a;
            this.d = d;
        }

        public boolean select(int index, SubmenuAdapter.Item item) {
            String s = item == null ? null : item.getString();
            if (s == null) return true;
            if (s.equals(a.getString(R.string.ipp_bl_forget))) forget(a, d);
            else if (s.equals(a.getString(R.string.ipp_bl_rename))) rename(a, d);
            return true;
        }
    }

    // ------------------------------------------------------------------ forget

    /**
     * The same confirm stock's {@code longConfirm} raised, kept word for word ({@code bl_unpair}),
     * and the same three things afterwards — unpair, put the cursor back on the On/Off row, repaint.
     * {@code showItemTips()} itself is private and reachable only through a synthetic accessor,
     * which Java cannot call, so its mark-0 branch is reproduced here: the title row takes the
     * highlight and both lists are rebound.
     */
    private static void forget(BluetoothActivity a, BluetoothDevice d) {
        new DialogUtil(a, true, R.style.Dialog_Common)
                .setDialogTitle(a.getString(R.string.bl_unpair), "", new Forget(a, d), false, true);
    }

    private static final class Forget extends DialogUtil.DialogCallback {
        private final BluetoothActivity a;
        private final BluetoothDevice d;

        Forget(BluetoothActivity a, BluetoothDevice d) {
            this.a = a;
            this.d = d;
        }

        public void cancel() {}

        public void confirm() {
            try {
                BLUtils.INSTANCE.unPairDevice(d);
            } catch (Throwable t) {
                // the stack refused; the list below still repaints from what it has
            }
            a.setMark(0);
            title(a, true);
            repaint(a);
        }
    }

    // ------------------------------------------------------------------ rename

    /**
     * Seeding the keyboard takes TWO calls, and that is not a detail: {@code setEditText} writes the
     * display box only, while every key the dialog handles works on {@code valueLiveData}. With the
     * model left empty, Delete ({@code inputChar("-")}) takes its early exit — "nothing to delete" —
     * and the name on screen can only be added to, never shortened, until a character has been
     * typed. Stock's own seeded input (SearchActivity) sets both for exactly this reason.
     *
     * The model is reachable only through {@code onInit}, which the dialog calls from
     * {@code onCreate}, i.e. inside the first {@code show()} — hence the order here.
     */
    private static void rename(BluetoothActivity a, BluetoothDevice d) {
        Rename cb = new Rename(a, d);
        InputMethodDialog dlg = new InputMethodDialog(a, cb, R.style.Dialog_Input_Method);
        dlg.show();
        cb.seed(name(d));
        dlg.setEditText(name(d));
    }

    /**
     * The keyboard dialog hands its live value out through {@code onInit} and calls {@code onBack}
     * when it closes — which is the only moment this screen needs, so no observer is registered:
     * the value is read once, at the end.
     *
     * An empty name means "no name of my own": the entry is removed and the row goes back to what
     * the device calls itself, which is also how a rename is undone.
     */
    private static final class Rename implements InputMethodDialog.Callback {
        private final BluetoothActivity a;
        private final BluetoothDevice d;
        private MutableLiveData live;

        Rename(BluetoothActivity a, BluetoothDevice d) {
            this.a = a;
            this.d = d;
        }

        public void onInit(MutableLiveData valueLiveData) {
            live = valueLiveData;
        }

        /** Put the current name into the dialog's own model, not just into its display box. */
        void seed(String s) {
            if (live != null) live.setValue(s);
        }

        public void onBack() {
            try {
                Object v = live == null ? null : live.getValue();
                String s = v == null ? "" : String.valueOf(v).trim();
                SharedPreferences p = prefs();
                String addr = d.getAddress();
                if (p == null || addr == null) return;
                if (s.length() == 0) p.edit().remove(KEY + addr).commit();
                else p.edit().putString(KEY + addr, s).commit();
                repaint(a);
            } catch (Throwable t) {
                // a rename that cannot be stored must not take the screen down
            }
        }
    }

    // ------------------------------------------------------------------ shared bits

    /** Rebind both device lists — the adapters are reached through the binding, not the Activity. */
    private static void repaint(BluetoothActivity a) {
        try {
            ActivityBlutoothBinding vb = (ActivityBlutoothBinding) a.getVb();
            rebind(vb.recyclerMyDevice);
            rebind(vb.recyclerOtherDevice);
        } catch (Throwable t) {
            // nothing to repaint
        }
    }

    private static void rebind(RecyclerView rv) {
        if (rv == null) return;
        RecyclerView.Adapter ad = rv.getAdapter();
        if (ad != null) ad.notifyDataSetChanged();
    }

    /** The On/Off row's highlight, the way {@code showItemTips} paints it for mark 0. */
    private static void title(BluetoothActivity a, boolean on) {
        try {
            ActivityBlutoothBinding vb = (ActivityBlutoothBinding) a.getVb();
            LinearLayout t = vb.layoutTitle;
            ThemeManager.INSTANCE.itemSetBackground(t, on ? R.drawable.item_selected_no_arrow : 0, on);
            row(t, on);
        } catch (Throwable t) {
            // the row keeps the look it had
        }
    }

    // ------------------------------------------------------------------ the shape of the screen

    /** A caption's text size, sp, and the air above and below its words, px. */
    private static final float CAPTION_SP = 13.0f;
    private static final int CAPTION_PAD = 3;

    /** Where a caption's words start, and how close to the edge of the screen the circle sits. */
    private static final int CAP_START_DIP = 10;
    private static final int CAP_END_DIP = 8;

    /** A band's rules, and the hairline under a device row — the menu's own two thicknesses. */
    private static final int RULE_H = 2;
    private static final int HAIR_ALPHA = 0x1F000000;

    /** The circle: how much bigger than the caption's letters, and its ring as a share of that. */
    private static final float SPIN = 1.4f;
    private static final float SPIN_RING = 0.16f;

    /**
     * The two captions in the banded shape of the better-Y menu's group titles — built here and
     * not in the layout because not one of their colours can be chosen, all three are read back
     * off the theme. Called at the END of {@code initView}: {@link #paint} would undo the words.
     */
    public static void style(BluetoothActivity a) {
        try {
            ActivityBlutoothBinding vb = (ActivityBlutoothBinding) a.getVb();
            TextView mine = vb.title;
            LinearLayout col = (LinearLayout) mine.getParent();
            band(col, mine, null);
            // The first is inside its band by now, so the column's remaining TextView is the
            // other caption — which carries no id of its own to be asked for.
            band(col, plain(col), spinner(a));
            searching(a);
        } catch (Throwable t) {
            // the stock captions are still captions
        }
    }

    /** The column's own TextView child, there being exactly one left by the time this is asked. */
    private static TextView plain(LinearLayout col) {
        for (int i = 0; i < col.getChildCount(); i++) {
            View v = col.getChildAt(i);
            if (v instanceof TextView) return (TextView) v;
        }
        return null;
    }

    /** One caption, taken out of the column and put back in a band, with {@code tail} beside it. */
    private static void band(LinearLayout col, TextView cap, View tail) {
        if (col == null || cap == null) return;
        int at = col.indexOfChild(cap);
        if (at < 0) return;
        col.removeViewAt(at);

        Context c = col.getContext();
        float d = col.getResources().getDisplayMetrics().density;
        cap.setTextSize(CAPTION_SP);
        // Two-argument setTypeface, never Typeface.create: only this form fakes bold for a theme
        // font with no bold cut, and MONOSPACE is what ThemeManager swaps for that font.
        cap.setTypeface(Typeface.MONOSPACE, Typeface.BOLD);
        cap.setIncludeFontPadding(false);
        cap.setGravity(Gravity.CENTER_VERTICAL);
        cap.setSingleLine(true);
        cap.setEllipsize(TextUtils.TruncateAt.END);
        cap.setPadding(0, 0, 0, 0);
        ThemeManager.INSTANCE.itemSetTextColor(cap,
                c.getResources().getColor(R.color.selected_text_color), false);

        LinearLayout line = new LinearLayout(c);
        line.setOrientation(LinearLayout.HORIZONTAL);
        line.setGravity(Gravity.CENTER_VERTICAL);
        line.setBaselineAligned(false);
        line.setPadding((int) (CAP_START_DIP * d), CAPTION_PAD, (int) (CAP_END_DIP * d), CAPTION_PAD);
        LinearLayout.LayoutParams words = new LinearLayout.LayoutParams(0, -2);
        words.weight = 1.0f;
        line.addView(cap, words);
        if (tail != null) line.addView(tail);

        int rgb = itemRgb(c);
        LinearLayout box = new LinearLayout(c);
        box.setOrientation(LinearLayout.VERTICAL);
        box.addView(rule(c, rgb, IppActivity.RULE_ALPHA), new LinearLayout.LayoutParams(-1, RULE_H));
        box.addView(line, new LinearLayout.LayoutParams(-1, -2));
        box.addView(rule(c, rgb, IppActivity.RULE_ALPHA), new LinearLayout.LayoutParams(-1, RULE_H));
        box.setBackgroundColor(washRgb(c) | IppActivity.bandAlpha());
        // No margin, here or on a row: the theme paints the rows, so a gap between two of them is
        // a line of wallpaper across the list. What separates the parts is the rules themselves.
        col.addView(box, at, new LinearLayout.LayoutParams(-1, -2));
    }

    /**
     * The circle that turns while the stack is looking for devices, at the right-hand end of the
     * "Other devices" caption. Drawn rather than scaled from {@code loading.png} (see {@link Spin}).
     */
    private static View spinner(Context c) {
        int n = Math.round(CAPTION_SP * c.getResources().getDisplayMetrics().scaledDensity * SPIN);
        View v = new Spin(c, itemRgb(c), Math.max(2.0f, n * SPIN_RING));
        v.setId(R.id.ipp_bl_spin);
        // INVISIBLE, not GONE: the circle is taller than the caption's letters, and a caption of
        // a different height steps the whole list up and down as the discovery starts and stops.
        v.setVisibility(View.INVISIBLE);
        v.setLayoutParams(new LinearLayout.LayoutParams(n, n));
        return v;
    }

    /**
     * A ring fading from the theme's colour to nothing round the circle, with a gap: a closed ring
     * of one even colour looks still however fast it spins. Drawn instead of {@code loading.png}
     * because at this size that picture's ring is a pixel and a half and cannot be thickened.
     */
    private static final class Spin extends View {
        /** How much of the circle the arc covers; the rest is the gap that shows it turning. */
        private static final float SWEEP = 300.0f;

        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final RectF box = new RectF();
        private final int rgb;
        private final float ring;

        Spin(Context c, int rgb, float ring) {
            super(c);
            this.rgb = rgb;
            this.ring = ring;
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(ring);
            paint.setStrokeCap(Paint.Cap.ROUND);
        }

        protected void onSizeChanged(int w, int h, int ow, int oh) {
            float half = ring / 2.0f;
            box.set(half, half, w - half, h - half);
            // The stops are placed by hand because a sweep is spread over the FULL turn whatever
            // is drawn of it: with the default two the tail meets the gap half opaque, and the
            // two ends read as one line crossing itself.
            paint.setShader(new SweepGradient(w / 2.0f, h / 2.0f,
                    new int[] { 0xFF000000 | rgb, rgb }, new float[] { 0.0f, SWEEP / 360.0f }));
        }

        /** Mirrored: a sweep only runs clockwise, so flipping is the only way to lead with the head. */
        protected void onDraw(Canvas canvas) {
            int save = canvas.save();
            canvas.scale(-1.0f, 1.0f, getWidth() / 2.0f, getHeight() / 2.0f);
            canvas.drawArc(box, 0.0f, SWEEP, false, paint);
            canvas.restoreToCount(save);
        }
    }

    /**
     * Start or stop the circle, from the end of stock's {@code showState}. What it follows is the
     * "Searching..." line, drawn at no height ({@code activity_blutooth.xml}): three branches
     * there set its visibility, and reading it back is one place where deciding again would be
     * three.
     */
    public static void searching(BluetoothActivity a) {
        try {
            ActivityBlutoothBinding vb = (ActivityBlutoothBinding) a.getVb();
            View spin = vb.getRoot().findViewById(R.id.ipp_bl_spin);
            if (spin == null) return;               // before style() has run, i.e. from initView
            boolean on = vb.loading.getVisibility() == View.VISIBLE;
            if (on == (spin.getVisibility() == View.VISIBLE)) return;
            if (on) {
                spin.setVisibility(View.VISIBLE);
                spin.startAnimation(turn());
            } else {
                spin.clearAnimation();
                spin.setVisibility(View.INVISIBLE);
            }
        } catch (Throwable t) {
            // a circle that will not turn must not take the screen down
        }
    }

    /** One turn, clockwise: {@code R.anim.loading}'s 1.5 s, which turns the other way and is shared. */
    private static RotateAnimation turn() {
        RotateAnimation r = new RotateAnimation(0.0f, 360.0f,
                Animation.RELATIVE_TO_SELF, 0.5f, Animation.RELATIVE_TO_SELF, 0.5f);
        r.setDuration(1500);
        r.setInterpolator(new LinearInterpolator());
        r.setRepeatCount(Animation.INFINITE);
        return r;
    }

    /** The theme's SELECTED item colour — a band's wash — read the only way there is. */
    private static int washRgb(Context c) {
        TextView probe = new TextView(c);
        ThemeManager.INSTANCE.itemSetTextColor(probe, ACCENT, true);
        return probe.getCurrentTextColor() & 0x00FFFFFF;
    }

    /**
     * The theme's ordinary item colour — the rules, the hairlines and the spinner. Read off a
     * scratch TextView because {@code itemSetTextColor} answers with the theme's own colour and
     * ignores the one it is passed, so painting and looking is the only way to ask.
     */
    private static int itemRgb(Context c) {
        TextView probe = new TextView(c);
        ThemeManager.INSTANCE.itemSetTextColor(probe,
                c.getResources().getColor(R.color.selected_text_color), false);
        return probe.getCurrentTextColor() & 0x00FFFFFF;
    }

    /** One band of a caption, or a row's hairline: the text's own colour thinned out. */
    private static View rule(Context c, int rgb, int alpha) {
        View v = new View(c);
        v.setBackgroundColor(rgb | alpha);
        return v;
    }

    /** What a focused row shows where the theme names no colour of its own. */
    private static final int ACCENT = 0xFF3CFFDE;

    /**
     * Every text on this screen in the theme's ordinary row colour.
     *
     * The whole screen was {@code @color/white} in the layouts — the On/Off row, the "My devices"
     * and "Other devices" captions, the searching line, and both labels of a device row — which is
     * a screen of invisible text on any light theme.
     *
     * The tree is walked rather than the views named one by one because one of them has no id at
     * all — the "Other devices" caption — so a binding cannot reach it. Called for the whole
     * screen once it is built, which is also the only moment it is right for every row: the lists
     * are still empty then, and from that point on each row paints itself through {@link #row}.
     */
    public static void paint(View v) {
        walk(v, false);
    }

    /**
     * One row, painted for the cursor or off it — the two device lists and the On/Off row, which
     * is a row of this screen like any other however little it looks like one.
     *
     * The flag is the SAME one the row's background was just given, and comes from the caller
     * rather than being worked out here: the three lists number their rows differently (the On/Off
     * row is mark 0, the paired devices follow it, the found ones follow those), and a second
     * place doing that arithmetic is a second place to get it wrong.
     */
    public static void row(View v, boolean sel) {
        walk(v, sel);
    }

    /**
     * A DEVICE row: the same text, plus the hairline along its bottom edge
     * ({@code item_blutooth.xml}'s last child) in the theme's colour.
     *
     * The LAST row of a list gives its hairline up: the band under it draws that boundary with a
     * rule of its own, and the two together are a thickness found nowhere else on the screen.
     * The count comes from the adapter because {@code getMyItem} is private.
     */
    public static void row(View v, boolean sel, BaseBindingAdapter ad, int pos) {
        walk(v, sel);
        try {
            View hair = ((ViewGroup) v).getChildAt(1);
            if (hair == null) return;
            hair.setBackgroundColor(itemRgb(v.getContext()) | HAIR_ALPHA);
            boolean last = ad != null && pos == ad.getDataListSize() - 1;
            hair.setVisibility(last ? View.GONE : View.VISIBLE);
        } catch (Throwable t) {
            // a row without its line is still a row
        }
    }

    private static void walk(View v, boolean sel) {
        try {
            if (v == null) return;
            if (v instanceof TextView) {
                TextView tv = (TextView) v;
                int c = sel ? tv.getResources().getColor(R.color.selected_text_color) : PLAIN;
                ThemeManager.INSTANCE.itemSetTextColor(tv, c, sel);
                return;
            }
            if (v instanceof ViewGroup) {
                ViewGroup g = (ViewGroup) v;
                for (int i = 0; i < g.getChildCount(); i++) walk(g.getChildAt(i), sel);
            }
        } catch (Throwable t) {
            // stock white is a look; a crash on the way into the screen is not
        }
    }

    /** What the layouts said, and what a theme naming no colour of its own still gets. */
    private static final int PLAIN = 0xFFFFFFFF;

    private static SharedPreferences prefs() {
        Context c = Y1Application.Companion.getAppContext();
        return c == null ? null : c.getSharedPreferences("innioasis_plus", 0);
    }
}
