package com.innioasis.ipp;

import android.graphics.Paint;
import android.graphics.drawable.ClipDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.text.TextPaint;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.SeekBar;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;

import com.innioasis.y1.activity.EqActivity;
import com.innioasis.y1.databinding.ActivityEqBinding;
import com.innioasis.y1.databinding.DialogEqEditBinding;
import com.innioasis.y1.databinding.ItemEqEditBinding;
import com.innioasis.y1.theme.ThemeManager;
import com.innioasis.y1.utils.EqSPUtils;

import java.lang.ref.WeakReference;
import java.util.List;

/**
 * The Equalizer screen and its preset editor. The preview (big icon and caption) is painted after
 * the highlight moves, not before as stock did: swapping that image lays out the whole screen, and
 * the highlight waited behind it. It rides on the Settings panel's messages ({@code Wheel.postRest}):
 * {@link #preview} notes the screen, {@code Wheel.follow} posts, {@link #paint} runs.
 */
public final class Eq {

    private static WeakReference host;

    /** In place of {@code showThisEq()} in the two wheel handlers. */
    public static void preview(EqActivity a) {
        host = new WeakReference(a);
    }

    /** The preset in use, cursor elsewhere: the plain row colour, told apart by its underline alone. */
    public static void active(TextView tv) {
        if (tv == null) return;
        ThemeManager.INSTANCE.itemSetTextColor(tv, -1, false);
    }

    /** The preset in use is underlined, cursor or not. Every bind: rows are recycled. */
    public static void underline(TextView tv, int pos) {
        if (tv == null) return;
        int f = tv.getPaintFlags();
        boolean on = pos == EqSPUtils.INSTANCE.getEqualizerInt();
        tv.setPaintFlags(on ? f | Paint.UNDERLINE_TEXT_FLAG : f & ~Paint.UNDERLINE_TEXT_FLAG);
    }

    // The preset editor (EqEditDialog), in the long-press menu's colours.

    /** Stock's #3CFFDE, when the progress colour cannot be read. */
    private static final int BAR = 0xFF3CFFDE;

    private static final float SIZE = 16f;

    private static int menuBg() {
        return Icons.menuBackground();
    }

    private static int menuText(boolean focus) {
        return Icons.menuText(focus);
    }

    private static int bar() {
        int c = Icons.progressColor();
        return c == 0 ? BAR : c;
    }

    /** From {@code EqEditDialog.onCreate}, right after the binding is inflated. */
    public static void editBox(DialogEqEditBinding b) {
        if (b == null) return;
        try {
            b.getRoot().setCardBackgroundColor(menuBg());
            b.title.setTextColor(menuText(false));
            editReset(b.reset, false);
        } catch (Throwable t) {
        }
    }

    /** {@code EqEditDialog.switchReset}: filled with the menu text colour (80% unfocused). */
    public static void editReset(TextView tv, boolean focus) {
        if (tv == null) return;
        try {
            int fill = menuText(false);
            if (!focus) fill = (fill & 0x00FFFFFF) | (((fill >>> 24) * 4 / 5) << 24);
            GradientDrawable g = new GradientDrawable();
            g.setColor(fill);
            g.setCornerRadius(6 * tv.getResources().getDisplayMetrics().density);
            tv.setBackgroundDrawable(g);
            tv.setTextColor(menuBg() | 0xFF000000);
        } catch (Throwable t) {
        }
    }

    // Worked out once per dialog by editFit, applied to every row by editRow.
    private static float fitScale = 1f;
    private static int sideW;
    private static int sideH;

    private static final float SIZE_TITLE = 18f;
    private static final float SIZE_RESET = 14f;
    private static final int KNOB_DP = 14;
    private static final int OUTLINE_PX = 2;
    /** Range ±1500 mB; "+" may be the wider. */
    private static final String WIDEST = "-15";
    private static final String WIDEST_PLUS = "+15";
    /** Below this the text may clip instead. */
    private static final float MIN_SCALE = 0.5f;

    /**
     * End of {@code EqEditDialog.showDialog}: a fixed box (screen height less 16dp each side,
     * 300 wide or more for the value column) and the text shrunk until it fits, whatever the font.
     */
    public static void editFit(android.app.Dialog d, DialogEqEditBinding b) {
        if (d == null || b == null) return;
        try {
            android.view.Window w = d.getWindow();
            if (w == null) return;
            android.util.DisplayMetrics dm = b.title.getResources().getDisplayMetrics();
            float dp = dm.density;
            int height = dm.heightPixels - Math.round(32 * dp);
            int maxWidth = dm.widthPixels - Math.round(16 * dp);
            int baseWidth = Math.min(300, maxWidth);

            View card = b.getRoot();
            int padV = card.getPaddingTop() + card.getPaddingBottom() + Math.round(4 * dp) + 4;
            int padH = card.getPaddingLeft() + card.getPaddingRight() + Math.round(30 * dp) + 4;
            int knob = Math.round(KNOB_DP * dp);
            int reset = Math.round(24 * dp);
            int bar = Math.round(188 * dp);        // the SeekBar's 180dip and its 4dip margins

            TextPaint p = new TextPaint(b.title.getPaint());
            float k = 1f;
            int width = baseWidth;
            int sw = 0;
            int sh = 0;
            while (true) {
                int title = line(p, SIZE_TITLE * k, dm);
                int hz = line(p, SIZE * k, dm);
                sh = Math.max(line(p, SIZE * k, dm), knob);
                p.setTextSize(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, SIZE * k, dm));
                sw = (int) Math.ceil(Math.max(p.measureText(WIDEST), p.measureText(WIDEST_PLUS))) + 2;
                int row = (height - padV - title - reset) / 5;
                width = Math.max(baseWidth, sw + bar + padH);
                boolean fits = hz + sh <= row && line(p, SIZE_RESET * k, dm) <= reset
                        && width <= maxWidth;
                if (fits || k <= MIN_SCALE) break;
                k -= 0.05f;
            }
            if (width > maxWidth) width = maxWidth;
            fitScale = k;
            sideW = sw;
            sideH = sh;

            b.title.setTextSize(TypedValue.COMPLEX_UNIT_SP, SIZE_TITLE * k);
            b.title.setSingleLine(true);
            b.title.setEllipsize(android.text.TextUtils.TruncateAt.END);
            b.reset.setTextSize(TypedValue.COMPLEX_UNIT_SP, SIZE_RESET * k);
            b.reset.setSingleLine(true);

            View inner = (View) b.recycler.getParent();
            ViewGroup.LayoutParams ilp = inner.getLayoutParams();
            ilp.height = ViewGroup.LayoutParams.MATCH_PARENT;
            inner.setLayoutParams(ilp);
            android.widget.LinearLayout.LayoutParams rlp =
                    (android.widget.LinearLayout.LayoutParams) b.recycler.getLayoutParams();
            rlp.height = 0;
            rlp.weight = 1f;
            b.recycler.setLayoutParams(rlp);
            stretch(b.recycler);

            w.setLayout(width, height);
            RecyclerView.Adapter a = b.recycler.getAdapter();
            if (a != null) a.notifyDataSetChanged();
        } catch (Throwable t) {
        }
    }

    /** One line's height, as a TextView with font padding lays it out. */
    private static int line(TextPaint p, float sp, android.util.DisplayMetrics dm) {
        p.setTextSize(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, sp, dm));
        Paint.FontMetricsInt fm = p.getFontMetricsInt();
        return fm.bottom - fm.top;
    }

    /**
     * One band row, in place of the tail of the adapter's {@code init}. The left label stays
     * hidden: {@link #value} reads the range out of it.
     */
    public static void editRow(ItemEqEditBinding b, int index, int pos) {
        if (b == null) return;
        try {
            boolean cur = index == pos;
            int text = menuText(false);
            b.hz.setTextColor(text);
            b.hz.setTextSize(TypedValue.COMPLEX_UNIT_SP, SIZE * fitScale);
            if (b.hz.getMaxLines() != 1) b.hz.setSingleLine(true);
            b.leftText.setVisibility(View.GONE);
            side(b.rightText, text);
            int v = value(b);
            b.rightText.setText(v > 0 ? "+" + v : String.valueOf(v));

            View root = b.getRoot();
            ViewGroup.LayoutParams lp = root.getLayoutParams();
            if (lp instanceof ViewGroup.MarginLayoutParams) {
                ViewGroup.MarginLayoutParams m = (ViewGroup.MarginLayoutParams) lp;
                if (m.width != ViewGroup.LayoutParams.MATCH_PARENT || m.topMargin != 0) {
                    m.width = ViewGroup.LayoutParams.MATCH_PARENT;
                    m.topMargin = 0;
                    root.setLayoutParams(m);
                }
            }

            SeekBar sb = b.seekbar;
            float dp = sb.getResources().getDisplayMetrics().density;
            int bar = bar();
            int track = (text & 0x00FFFFFF) | 0x33000000;
            Drawable pd = sb.getProgressDrawable();
            if (!(pd instanceof Track) || ((Track) pd).bar != bar || ((Track) pd).track != track) {
                sb.setProgressDrawable(Track.make(bar, track, 5 * dp));
            }
            GradientDrawable knob = new GradientDrawable();
            knob.setShape(GradientDrawable.OVAL);
            int d = Math.round(KNOB_DP * dp);
            knob.setSize(d, d);
            knob.setColor(bar);
            if (cur) knob.setStroke(OUTLINE_PX, outline(bar));
            sb.setThumb(knob);
        } catch (Throwable t) {
        }
    }

    /** dB. Stock's bind wrote the range's low end into the left label and the bar from it. */
    private static int value(ItemEqEditBinding b) {
        int min = 0;
        try {
            min = Integer.parseInt(b.leftText.getText().toString().trim());
        } catch (Throwable t) {
            min = -(b.seekbar.getMax() / 2);
        }
        return b.seekbar.getProgress() + min;
    }

    private static void side(TextView tv, int color) {
        tv.setTextColor(color);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, SIZE * fitScale);
        if (tv.getMaxLines() != 1) tv.setSingleLine(true);
        if (tv.getGravity() != Gravity.CENTER) tv.setGravity(Gravity.CENTER);
        if (sideW <= 0) return;
        ViewGroup.LayoutParams lp = tv.getLayoutParams();
        if (lp != null && (lp.width != sideW || lp.height != sideH)) {
            lp.width = sideW;
            lp.height = sideH;
            tv.setLayoutParams(lp);
        }
    }

    /** The first candidate contrasting with both box and bar; else the best of the weaker contrasts. */
    private static int outline(int bar) {
        int bg = menuBg() | 0xFF000000;
        int[] tries = { menuText(true), menuText(false), 0xFFFFFFFF, 0xFF000000 };
        int best = tries[0];
        double bestScore = 0;
        for (int i = 0; i < tries.length; i++) {
            int c = tries[i] | 0xFF000000;
            double s = Math.min(contrast(c, bg), contrast(c, bar));
            // float: a round double literal is const-wide/high16, which apktool refuses.
            if ((float) s >= 2f) return c;
            if (s > bestScore) {
                bestScore = s;
                best = c;
            }
        }
        return best;
    }

    /** WCAG contrast ratio, 1 (same) .. 21 (black on white). */
    private static double contrast(int a, int b) {
        double la = luminance(a);
        double lb = luminance(b);
        return (Math.max(la, lb) + 0.05) / (Math.min(la, lb) + 0.05);
    }

    private static double luminance(int c) {
        return 0.2126 * channel((c >> 16) & 0xFF) + 0.7152 * channel((c >> 8) & 0xFF)
                + 0.0722 * channel(c & 0xFF);
    }

    private static double channel(int v) {
        double s = v / 255.0;
        return s <= 0.03928 ? s / 12.92 : Math.pow((s + 0.055) / 1.055, 2.4);
    }

    /** Remembers its colours, so a rebind with the same ones keeps it. */
    static final class Track extends LayerDrawable {
        final int bar;
        final int track;

        private Track(Drawable[] layers, int bar, int track) {
            super(layers);
            this.bar = bar;
            this.track = track;
        }

        static Track make(int bar, int track, float radius) {
            GradientDrawable back = new GradientDrawable();
            back.setColor(track);
            back.setCornerRadius(radius);
            GradientDrawable fill = new GradientDrawable();
            fill.setColor(bar);
            fill.setCornerRadius(radius);
            ClipDrawable clip = new ClipDrawable(fill, Gravity.LEFT, ClipDrawable.HORIZONTAL);
            Track t = new Track(new Drawable[] { back, clip }, bar, track);
            t.setId(0, android.R.id.background);
            t.setId(1, android.R.id.progress);
            return t;
        }
    }

    /** From {@code Wheel.paintPanel}. */
    static void paint() {
        Object o = host == null ? null : host.get();
        host = null;
        if (!(o instanceof EqActivity)) return;
        try {
            EqActivity a = (EqActivity) o;
            if (MenuStyle.simple(a)) return;
            Object b = a.getVb();
            if (!(b instanceof ActivityEqBinding)) return;
            ActivityEqBinding vb = (ActivityEqBinding) b;

            List l = presets(a);
            int m = a.getMark();
            if (l == null || m < 0 || m >= l.size()) return;
            Object d = l.get(m);
            if (!(d instanceof EqActivity.EqData)) return;
            EqActivity.EqData eq = (EqActivity.EqData) d;

            ThemeManager.INSTANCE.commonSetIcon(vb.image, eq.getIcon());
            vb.text.setText(eq.getStr());
        } catch (Throwable t) {
        }
    }

    private static WeakReference listHost;
    private static List list;

    /** Once per screen: stock's {@code getEqList} parses all ten presets with a new Gson each. */
    private static List presets(EqActivity a) {
        if (list == null || listHost == null || listHost.get() != a) {
            list = EqActivity.getEqList();
            listHost = new WeakReference(a);
        }
        return list;
    }

    /**
     * The rows share the list's measured height; the remainder goes a pixel each to the top rows,
     * so the last row ends at the bottom edge (not expressible in {@code item_eq.xml}).
     */
    public static void stretch(RecyclerView rv) {
        try {
            if (rv != null) rv.getViewTreeObserver().addOnPreDrawListener(new Stretch(rv));
        } catch (Throwable t) {
        }
    }

    /**
     * PRE-DRAW, returning false on a pass that changes anything: the frame is cancelled, so rows are
     * never drawn at their layout height first. Settles after one pass; re-checked on every one,
     * since rebound rows come back at their layout height.
     */
    static final class Stretch implements ViewTreeObserver.OnPreDrawListener {
        private final RecyclerView rv;

        Stretch(RecyclerView rv) {
            this.rv = rv;
        }

        public boolean onPreDraw() {
            try {
                RecyclerView.Adapter a = rv.getAdapter();
                int rows = a == null ? 0 : a.getItemCount();
                int h = rv.getHeight();
                int n = rv.getChildCount();
                if (rows <= 0 || h <= 0 || n <= 0) return true;
                int base = h / rows;
                int rem = h - base * rows;
                boolean changed = false;
                for (int i = 0; i < n; i++) {
                    View c = rv.getChildAt(i);
                    int pos = rv.getChildAdapterPosition(c);
                    if (pos < 0) continue;
                    int want = base + (pos < rem ? 1 : 0);
                    ViewGroup.LayoutParams lp = c.getLayoutParams();
                    if (lp == null || lp.height == want) continue;
                    lp.height = want;
                    c.setLayoutParams(lp);
                    changed = true;
                }
                return !changed;
            } catch (Throwable t) {
                return true;
            }
        }
    }
}
