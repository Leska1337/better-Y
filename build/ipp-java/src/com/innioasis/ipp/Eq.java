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

import com.innioasis.y1.Y1Application;
import com.innioasis.y1.activity.EqActivity;
import com.innioasis.y1.databinding.ActivityEqBinding;
import com.innioasis.y1.databinding.DialogEqEditBinding;
import com.innioasis.y1.databinding.ItemEqEditBinding;
import com.innioasis.y1.theme.ThemeManager;
import com.innioasis.y1.utils.EqSPUtils;

import java.lang.ref.WeakReference;
import java.util.List;

/**
 * The Equalizer's preview — the big icon and the caption beside the list — painted after the wheel
 * click instead of before it, and at most once per 70 ms while the wheel turns.
 *
 * Stock calls {@code EqActivity.showThisEq()} at the top of {@code clockwise()} /
 * {@code antiClockwise()}, i.e. before the list is even told the cursor moved, and it is by
 * far the most expensive thing a click there can do: {@code ThemeManager.commonSetIcon} swaps the
 * image of a 200dip {@code wrap_content} + {@code adjustViewBounds} ImageView, so every click asks
 * for a layout of the whole screen (and, with a theme that ships its own equaliser icons, decodes a
 * bitmap for it). The list itself costs nothing to move — all ten rows fit, so {@code Wheel.follow}
 * never scrolls and only rebinds the two rows whose highlight changed. That is the whole of "the
 * equaliser scrolls thick and unresponsive": the highlight was waiting behind the picture.
 *
 * Same answer as the panel beside the Settings list ({@code Wheel.postRest}), and it rides on the
 * same messages: {@link #preview} only notes which screen is asking, {@code Wheel.follow} — called
 * immediately after it — posts them, and {@link #paint} runs from there once the highlight has
 * moved.
 */
public final class Eq {

    private static WeakReference host;

    /** In place of {@code showThisEq()} in the two wheel handlers. */
    public static void preview(EqActivity a) {
        host = new WeakReference(a);
    }

    /** Stock's hardcoded #ADFF2F, when the sample cannot be read. */
    private static final int ACTIVE = 0xFFADFF2F;

    /**
     * The text of the preset in use, when the cursor is not on it: the colour of the player's
     * timeline ({@code Icons.progressColor}), so a theme's {@code progressColor} reaches it.
     */
    public static void active(TextView tv) {
        if (tv == null) return;
        int c = Icons.progressColor();
        tv.setTextColor(c != 0 ? c : ACTIVE);
    }

    /**
     * The preset in use is underlined, cursor or not: a theme's timeline colour may equal its text
     * colour, and then the underline is what still tells the row apart. Set on every bind, since
     * the row is recycled.
     */
    public static void underline(TextView tv, int pos) {
        if (tv == null) return;
        int f = tv.getPaintFlags();
        boolean on = pos == EqSPUtils.INSTANCE.getEqualizerInt();
        tv.setPaintFlags(on ? f | Paint.UNDERLINE_TEXT_FLAG : f & ~Paint.UNDERLINE_TEXT_FLAG);
    }

    // ---- the preset editor (EqEditDialog) in the long-press menu's colours --------------------

    /** {@code bg_submenu}: the menu's background when no theme names one. */
    private static final int MENU_BG = 0xFF8C94B2;
    private static final int MENU_TEXT = 0xFFFFFFFF;
    /** {@code selected_text_color_submenu}. */
    private static final int MENU_SEL = 0xFF3B3D78;
    /** Stock's #3CFFDE, when the progress colour cannot be read. */
    private static final int BAR = 0xFF3CFFDE;

    private static final float SIZE = 16f;

    private static int menuBg() {
        try {
            Integer c = ThemeManager.INSTANCE.menuBGColor();
            if (c != null) return c.intValue();
        } catch (Throwable t) {
            // malformed theme colour
        }
        return MENU_BG;
    }

    private static int menuText(boolean focus) {
        try {
            TextView probe = probe();
            int fallback = focus ? MENU_SEL : MENU_TEXT;
            ThemeManager.INSTANCE.menuItemSetTextColor(probe, fallback, focus);
            return probe.getCurrentTextColor();
        } catch (Throwable t) {
            return focus ? MENU_SEL : MENU_TEXT;
        }
    }

    private static TextView probe;

    private static TextView probe() {
        if (probe == null) probe = new TextView(Y1Application.Companion.getAppContext());
        return probe;
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
            // the stock white box stays
        }
    }

    /**
     * {@code EqEditDialog.switchReset}: the button is filled with the menu's text colour, at 80%
     * while the cursor is elsewhere, and its label is the menu's background made opaque.
     */
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
            // keep whatever the button had
        }
    }

    // Sizes worked out once per dialog by editFit and applied to every row by editRow.
    private static float fitScale = 1f;
    private static int sideW;
    private static int sideH;

    private static final float SIZE_TITLE = 18f;
    private static final float SIZE_RESET = 14f;
    private static final int KNOB_DP = 14;
    private static final int OUTLINE_PX = 2;
    /** The label the side columns are measured by: the device's band range is ±1500 mB. */
    private static final String WIDEST = "-15";
    /** Below this the text is unreadable anyway; the box stays fixed and the text may clip. */
    private static final float MIN_SCALE = 0.5f;

    /**
     * End of {@code EqEditDialog.showDialog}: the window gets a fixed height, and the text shrinks
     * until the title, five bands and Reset fit in it. The height is the screen's less 16dp above
     * and below — the box never grows past it whatever the theme's font. The width starts at
     * stock's 300 and grows, up to the screen less 8dp a side, when the digit columns need it;
     * past that the text shrinks too.
     *
     * The bands then share the list's height ({@link #stretch}), so every row is the same size
     * whichever one the cursor is on.
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
                sw = (int) Math.ceil(p.measureText(WIDEST)) + 2;
                int row = (height - padV - title - reset) / 5;
                width = Math.max(baseWidth, 2 * sw + bar + padH);
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
            // the stock wrap_content box stays
        }
    }

    /** A single line's height at {@code sp}, as a TextView with font padding lays it out. */
    private static int line(TextPaint p, float sp, android.util.DisplayMetrics dm) {
        p.setTextSize(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, sp, dm));
        Paint.FontMetricsInt fm = p.getFontMetricsInt();
        return fm.bottom - fm.top;
    }

    /**
     * The whole look of one band row, in place of the tail of the adapter's {@code init}: the text
     * in the menu's colour, the bar and the knob in the progress colour, the knob of the band under
     * the cursor outlined ({@link #outline}), and the digits in columns of a fixed size.
     */
    public static void editRow(ItemEqEditBinding b, int index, int pos) {
        if (b == null) return;
        try {
            boolean cur = index == pos;
            int text = menuText(false);
            b.hz.setTextColor(text);
            b.hz.setTextSize(TypedValue.COMPLEX_UNIT_SP, SIZE * fitScale);
            if (b.hz.getMaxLines() != 1) b.hz.setSingleLine(true);
            side(b.leftText, text);
            side(b.rightText, text);

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
            // a stale row is better than a crash on a wheel click
        }
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

    /**
     * The knob's outline has to stand out against the box AND against the bar it sits on, and a
     * theme's menu colours can equal either (a selected text colour the same as the bar, a text
     * colour the same as the box). So the menu's selected and plain text colours are tried in that
     * order, then white and black, and the first that contrasts with both is taken; if none does,
     * the one whose weaker contrast is the strongest.
     */
    private static int outline(int bar) {
        int bg = menuBg() | 0xFF000000;
        int[] tries = { menuText(true), menuText(false), 0xFFFFFFFF, 0xFF000000 };
        int best = tries[0];
        double bestScore = 0;
        for (int i = 0; i < tries.length; i++) {
            int c = tries[i] | 0xFF000000;
            double s = Math.min(contrast(c, bg), contrast(c, bar));
            // Compared as a float: a double literal whose low 48 bits are zero (1.0, 2.0, 100.0)
            // becomes const-wide/high16, which the smali pipeline does not rewrite and apktool
            // refuses; the float form is const/high16, which it does.
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

    /** The bar's drawable, remembering its colours so a rebind with the same ones keeps it. */
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
            Object b = a.getVb();
            if (!(b instanceof ActivityEqBinding)) return;
            ActivityEqBinding vb = (ActivityEqBinding) b;

            List l = EqActivity.getEqList();
            int m = a.getMark();
            if (l == null || m < 0 || m >= l.size()) return;
            Object d = l.get(m);
            if (!(d instanceof EqActivity.EqData)) return;
            EqActivity.EqData eq = (EqActivity.EqData) d;

            ThemeManager.INSTANCE.commonSetIcon(vb.image, eq.getIcon());
            vb.text.setText(eq.getStr());
        } catch (Throwable t) {
            // a stale preview is better than a crash on a wheel click
        }
    }

    /**
     * The preset rows share the list's whole height instead of leaving a strip under the last one.
     *
     * The rows are a fixed 30dip in the layout and there are ten of them, so they came to 300 of
     * the 315 the screen has below the status bar. 315 / 10 is not a whole number, which is why the
     * height cannot simply be written into {@code item_eq.xml}: the remainder is handed out one
     * pixel at a time to the topmost rows, and that is what makes the last row end exactly at the
     * bottom edge.
     *
     * Applied from a layout listener because the height has to come from the list's measured
     * one, and re-checked on every pass so a rebound row cannot come back at its layout height. It
     * settles after one pass — nothing is written once every row already has the height it wants,
     * so the {@code requestLayout} this causes is not repeated.
     */
    public static void stretch(RecyclerView rv) {
        try {
            if (rv != null) rv.getViewTreeObserver().addOnPreDrawListener(new Stretch(rv));
        } catch (Throwable t) {
            // the rows keep their layout height
        }
    }

    /**
     * A PRE-DRAW listener, not a layout one, and it returns false on the pass that changes
     * anything: that cancels the frame about to be drawn, so the rows are never shown at their
     * layout height first and corrected afterwards — which is exactly the twitch a layout listener
     * produced (the first pass drew 30px rows, the second 31/32). Once every row has the height it
     * wants nothing is written and the frame goes through.
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
                return true;    // leave the rows as the layout made them
            }
        }
    }
}
