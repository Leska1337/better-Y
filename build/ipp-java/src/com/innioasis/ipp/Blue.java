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
 * The Bluetooth screen: a paired device's long-press menu (forget / rename), its banded captions,
 * the search circle, and every text in the theme's colour. The rename is OURS, kept per MAC in
 * the ipp preferences: Android 4.2 hides {@code setAlias}. It survives unpairing and the stack
 * re-reading the advertised name.
 */
public final class Blue {

    private Blue() {}

    private static final String KEY = "bt_name:";

    /** The user's name if there is one, the device's otherwise. */
    public static String name(BluetoothDevice d) {
        if (d == null) return "";
        try {
            SharedPreferences p = Prefs.file();
            String addr = d.getAddress();
            if (p != null && addr != null) {
                String mine = p.getString(KEY + addr, null);
                if (mine != null && mine.length() != 0) return mine;
            }
        } catch (Throwable t) {
        }
        String n = d.getName();
        return n == null ? "" : n;
    }

    /** Long TOP on a paired device. Dispatched by string. */
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

    /**
     * Stock's confirm and aftermath. {@code showItemTips()} is private (synthetic accessor only),
     * so its mark-0 branch is reproduced: highlight on the On/Off row, both lists rebound.
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
            }
            a.setMark(0);
            title(a, true);
            repaint(a);
        }
    }

    /**
     * Seeding takes TWO calls: {@code setEditText} fills the display only, while the keys work on
     * {@code valueLiveData} — left empty, Delete does nothing. The model arrives through
     * {@code onInit} inside the first {@code show()}, hence the order.
     */
    private static void rename(BluetoothActivity a, BluetoothDevice d) {
        Rename cb = new Rename(a, d);
        InputMethodDialog dlg = new InputMethodDialog(a, cb, R.style.Dialog_Input_Method);
        dlg.show();
        cb.seed(name(d));
        dlg.setEditText(name(d));
    }

    /** Read once, on close. An empty name removes ours: how a rename is undone. */
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

        void seed(String s) {
            if (live != null) live.setValue(s);
        }

        public void onBack() {
            try {
                Object v = live == null ? null : live.getValue();
                String s = v == null ? "" : String.valueOf(v).trim();
                SharedPreferences p = Prefs.file();
                String addr = d.getAddress();
                if (p == null || addr == null) return;
                if (s.length() == 0) p.edit().remove(KEY + addr).commit();
                else p.edit().putString(KEY + addr, s).commit();
                repaint(a);
            } catch (Throwable t) {
            }
        }
    }

    private static void repaint(BluetoothActivity a) {
        try {
            ActivityBlutoothBinding vb = (ActivityBlutoothBinding) a.getVb();
            rebind(vb.recyclerMyDevice);
            rebind(vb.recyclerOtherDevice);
        } catch (Throwable t) {
        }
    }

    private static void rebind(RecyclerView rv) {
        if (rv == null) return;
        RecyclerView.Adapter ad = rv.getAdapter();
        if (ad != null) ad.notifyDataSetChanged();
    }

    /** As {@code showItemTips} paints mark 0. */
    private static void title(BluetoothActivity a, boolean on) {
        try {
            ActivityBlutoothBinding vb = (ActivityBlutoothBinding) a.getVb();
            LinearLayout t = vb.layoutTitle;
            ThemeManager.INSTANCE.itemSetBackground(t, on ? R.drawable.item_selected_no_arrow : 0, on);
            row(t, on);
        } catch (Throwable t) {
        }
    }

    private static final float CAPTION_SP = 13.0f;
    private static final int CAPTION_PAD = 3;

    private static final int CAP_START_DIP = 10;
    private static final int CAP_END_DIP = 8;

    /** The menu's own two thicknesses: a band's rules and a row's hairline. */
    private static final int RULE_H = 2;
    private static final int HAIR_ALPHA = 0x1F000000;

    /** The circle against the caption's letters, and its ring as a share of that. */
    private static final float SPIN = 1.4f;
    private static final float SPIN_RING = 0.16f;

    /**
     * The two captions as better-Y's banded group titles, in colours read off the theme. At the
     * END of {@code initView}: {@link #paint} would undo them.
     */
    public static void style(BluetoothActivity a) {
        try {
            ActivityBlutoothBinding vb = (ActivityBlutoothBinding) a.getVb();
            TextView mine = vb.title;
            LinearLayout col = (LinearLayout) mine.getParent();
            band(col, mine, null);
            // The other caption has no id: it is the column's one remaining TextView.
            View top = band(col, plain(col), spinner(a));
            // with no paired device the two bands touch: the first one's bottom rule is enough
            RecyclerView.Adapter ad = vb.recyclerMyDevice.getAdapter();
            if (top != null && ad != null) {
                Touch w = new Touch(ad, top);
                ad.registerAdapterDataObserver(w);
                w.onChanged();
            }
            capCentre(vb.tvTitle);
            capCentre(vb.tvState);
            searching(a);
        } catch (Throwable t) {
        }
    }

    /** The "Other devices" band's top rule, there only while paired devices stand above it. */
    static final class Touch extends RecyclerView.AdapterDataObserver {
        private final RecyclerView.Adapter ad;
        private final View rule;

        Touch(RecyclerView.Adapter ad, View rule) {
            this.ad = ad;
            this.rule = rule;
        }

        @Override
        public void onChanged() {
            rule.setVisibility(ad.getItemCount() > 0 ? View.VISIBLE : View.GONE);
        }

        @Override
        public void onItemRangeInserted(int start, int count) {
            onChanged();
        }

        @Override
        public void onItemRangeRemoved(int start, int count) {
            onChanged();
        }
    }

    /**
     * The On/Off row's two labels centred on their capitals rather than their boxes: of
     * different sizes, the boxes centred put the words at different heights.
     */
    private static void capCentre(TextView tv) {
        if (tv == null) return;
        Paint p = tv.getPaint();
        Paint.FontMetrics fm = p.getFontMetrics();
        android.graphics.Rect r = new android.graphics.Rect();
        p.getTextBounds("H", 0, 1, r);
        float glyph = -fm.ascent + (r.top + r.bottom) / 2.0f;
        float box = (fm.descent - fm.ascent) / 2.0f;
        tv.setTranslationY(Math.round(box - glyph));
    }

    private static TextView plain(LinearLayout col) {
        for (int i = 0; i < col.getChildCount(); i++) {
            View v = col.getChildAt(i);
            if (v instanceof TextView) return (TextView) v;
        }
        return null;
    }

    /** The caption moved into a band, with {@code tail} beside it; answers the band's top rule. */
    private static View band(LinearLayout col, TextView cap, View tail) {
        if (col == null || cap == null) return null;
        int at = col.indexOfChild(cap);
        if (at < 0) return null;
        col.removeViewAt(at);

        Context c = col.getContext();
        float d = col.getResources().getDisplayMetrics().density;
        cap.setTextSize(CAPTION_SP);
        // Two-argument form: it fakes bold for a theme font with no bold cut.
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
        View top = rule(c, rgb, IppActivity.RULE_ALPHA);
        box.addView(top, new LinearLayout.LayoutParams(-1, RULE_H));
        box.addView(line, new LinearLayout.LayoutParams(-1, -2));
        box.addView(rule(c, rgb, IppActivity.RULE_ALPHA), new LinearLayout.LayoutParams(-1, RULE_H));
        box.setBackgroundColor(washRgb(c) | IppActivity.bandAlpha());
        // No margin: a gap between theme-painted rows is a line of wallpaper.
        col.addView(box, at, new LinearLayout.LayoutParams(-1, -2));
        return top;
    }

    /** The search circle, at the end of the "Other devices" caption. */
    private static View spinner(Context c) {
        int n = Math.round(CAPTION_SP * c.getResources().getDisplayMetrics().scaledDensity * SPIN);
        View v = new Spin(c, itemRgb(c), Math.max(2.0f, n * SPIN_RING));
        v.setId(R.id.ipp_bl_spin);
        // INVISIBLE, not GONE: it is taller than the caption, and the list would jump.
        v.setVisibility(View.INVISIBLE);
        v.setLayoutParams(new LinearLayout.LayoutParams(n, n));
        return v;
    }

    /**
     * A fading ring with a gap (an even closed ring looks still). Drawn: {@code loading.png}'s ring
     * is a pixel and a half at this size.
     */
    private static final class Spin extends View {
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
            // Stops by hand: a sweep spans the FULL turn, and by default the tail meets the gap
            // half opaque.
            paint.setShader(new SweepGradient(w / 2.0f, h / 2.0f,
                    new int[] { 0xFF000000 | rgb, rgb }, new float[] { 0.0f, SWEEP / 360.0f }));
        }

        /** Mirrored: a sweep only runs clockwise, and the head must lead. */
        protected void onDraw(Canvas canvas) {
            int save = canvas.save();
            canvas.scale(-1.0f, 1.0f, getWidth() / 2.0f, getHeight() / 2.0f);
            canvas.drawArc(box, 0.0f, SWEEP, false, paint);
            canvas.restoreToCount(save);
        }
    }

    /**
     * End of stock's {@code showState}: follows the zero-height "Searching..." line, whose
     * visibility three branches set — read back rather than decided a fourth time.
     */
    public static void searching(BluetoothActivity a) {
        try {
            ActivityBlutoothBinding vb = (ActivityBlutoothBinding) a.getVb();
            View spin = vb.getRoot().findViewById(R.id.ipp_bl_spin);
            if (spin == null) return;               // before style()
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
        }
    }

    /** {@code R.anim.loading}'s 1.5 s, clockwise (that one turns the other way). */
    private static RotateAnimation turn() {
        RotateAnimation r = new RotateAnimation(0.0f, 360.0f,
                Animation.RELATIVE_TO_SELF, 0.5f, Animation.RELATIVE_TO_SELF, 0.5f);
        r.setDuration(1500);
        r.setInterpolator(new LinearInterpolator());
        r.setRepeatCount(Animation.INFINITE);
        return r;
    }

    /** The theme's SELECTED item colour: a band's wash. */
    private static int washRgb(Context c) {
        TextView probe = new TextView(c);
        ThemeManager.INSTANCE.itemSetTextColor(probe, ACCENT, true);
        return probe.getCurrentTextColor() & 0x00FFFFFF;
    }

    /** The ordinary item colour, read back off a scratch TextView (the setter ignores its argument). */
    private static int itemRgb(Context c) {
        TextView probe = new TextView(c);
        ThemeManager.INSTANCE.itemSetTextColor(probe,
                c.getResources().getColor(R.color.selected_text_color), false);
        return probe.getCurrentTextColor() & 0x00FFFFFF;
    }

    private static View rule(Context c, int rgb, int alpha) {
        View v = new View(c);
        v.setBackgroundColor(rgb | alpha);
        return v;
    }

    /** A focused row's colour when the theme names none. */
    private static final int ACCENT = 0xFF3CFFDE;

    /**
     * Every text of the screen (all {@code @color/white} in the layouts) in the theme's row colour.
     * The tree is walked: the "Other devices" caption has no id. Once, while the lists are still
     * empty; rows then paint themselves through {@link #row}.
     */
    public static void paint(View v) {
        walk(v, false);
    }

    /**
     * {@code sel} comes from the caller, the same flag the background just got: the lists number
     * their rows differently, and a second copy of that arithmetic is a second place to err.
     */
    public static void row(View v, boolean sel) {
        walk(v, sel);
    }

    /**
     * A DEVICE row, plus its bottom hairline. A list's last row drops it — the band below draws
     * that boundary.
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
        }
    }

    /** The layouts' colour, when the theme names none. */
    private static final int PLAIN = 0xFFFFFFFF;
}
