package com.innioasis.ipp;

import android.graphics.Paint;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;

import com.innioasis.y1.activity.EqActivity;
import com.innioasis.y1.databinding.ActivityEqBinding;
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
