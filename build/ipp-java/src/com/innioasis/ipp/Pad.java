package com.innioasis.ipp;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;

import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.recyclerview.widget.RecyclerView;

import com.innioasis.y1.R;

/**
 * The main menu's and Settings' list geometry, put back the way stock had it.
 *
 * ON (the default) both lists run to the screen's left edge and down to its bottom: the 9dip left
 * margin goes away and the width grows by exactly that, so a row's right edge does not move, and
 * 307/305 becomes 315 = 360 − the 45px status bar. That is right for the default look and wrong for
 * some themes, whose row artwork is drawn expecting the stock inset — hence the toggle: with
 * {@code fixed_menu_pad} OFF, the two lists are handed the stock margin, width and height again.
 *
 * The row is worded as the thing it does ("Fixed menu margins") rather than as its negation, and
 * the key follows the wording. A key whose sentence is inverted without renaming it flips the
 * geometry on every device that has ever touched the row.
 *
 * Applied in code rather than by keeping two layouts because the layouts are shared with
 * everything else the screens draw, and a preference cannot pick an XML file at inflate time here.
 * One call at the end of each {@code initView}; which of the two screens it is, is answered by the
 * list's own id, so both share one method (and one method reference in the full {@code classes.dex}
 * — the Settings screen lives there).
 */
public final class Pad {

    private Pad() { }

    /** The preference key; ON (the default) = the mod's edge-to-edge lists, off = stock's. */
    public static final String KEY = "fixed_menu_pad";

    // Stock geometry, in dip (the device is 160 dpi, so dip == px), and the mod's beside it. Both
    // are written, never just the stock one: the setting can be turned back OFF, and a screen that
    // is only re-measured (not re-created) would otherwise keep the stock inset until a reboot.
    private static final int MARGIN = 9;
    private static final int MAIN_W = 204;
    private static final int MAIN_H = 307;
    private static final int SET_W = 218;
    private static final int SET_H = 305;
    private static final int IPP_MAIN_W = 213;
    private static final int IPP_SET_W = 227;
    private static final int IPP_H = 315;      // 360 - the 45px status bar

    /**
     * Called where each list is built, and again from {@code MainActivity.onResume} — the main menu
     * is not re-created when the user comes back to it from the settings screen, so its
     * {@code initRecycler} does not run again and the toggle would appear to do nothing there.
     */
    public static void list(RecyclerView rv) {
        try {
            if (rv == null) return;
            Context c = rv.getContext();
            if (c == null) return;
            boolean stock = !Prefs.on(c, KEY);

            int id = rv.getId();
            int w;
            int h;
            if (id == R.id.rc_list) {
                w = stock ? MAIN_W : IPP_MAIN_W;
                h = stock ? MAIN_H : IPP_H;
            } else if (id == R.id.recycler) {
                w = stock ? SET_W : IPP_SET_W;
                h = stock ? SET_H : IPP_H;
            } else {
                return;
            }

            ViewGroup.LayoutParams p = rv.getLayoutParams();
            if (!(p instanceof ViewGroup.MarginLayoutParams)) return;
            ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) p;
            float d = c.getResources().getDisplayMetrics().density;
            int wPx = px(w, d);
            int hPx = px(h, d);
            int mPx = stock ? px(MARGIN, d) : 0;
            if (lp.width == wPx && lp.height == hPx && lp.leftMargin == mPx) return;
            lp.width = wPx;
            lp.height = hPx;
            lp.leftMargin = mPx;
            rv.setLayoutParams(lp);
        } catch (Throwable t) {
            // the lists keep the geometry the layout gave them
        }
    }

    private static int px(int dip, float d) {
        return (int) (dip * d + 0.5f);
    }

    /**
     * A second view's place in a ConstraintLayout, taken from the first: every constraint, margin,
     * bias, chain, ratio and match-constraint setting, on fresh params.
     *
     * Not the copy constructor. It hands the copy the source's own {@code ConstraintWidget}, so the
     * solver sees one widget for two views: the second {@code add} resets it, the copy is never
     * measured, and it is laid out in the source's frame whatever its own params say. What the
     * constructor derives while resolving ({@code resolved*}, the dimension flags) is recomputed
     * by {@code validate}.
     */
    public static ConstraintLayout.LayoutParams copy(ConstraintLayout.LayoutParams src) {
        ConstraintLayout.LayoutParams p = new ConstraintLayout.LayoutParams(src.width, src.height);
        p.leftMargin = src.leftMargin;
        p.topMargin = src.topMargin;
        p.rightMargin = src.rightMargin;
        p.bottomMargin = src.bottomMargin;
        p.setMarginStart(src.getMarginStart());
        p.setMarginEnd(src.getMarginEnd());
        p.guideBegin = src.guideBegin;
        p.guideEnd = src.guideEnd;
        p.guidePercent = src.guidePercent;
        p.guidelineUseRtl = src.guidelineUseRtl;
        p.leftToLeft = src.leftToLeft;
        p.leftToRight = src.leftToRight;
        p.rightToLeft = src.rightToLeft;
        p.rightToRight = src.rightToRight;
        p.topToTop = src.topToTop;
        p.topToBottom = src.topToBottom;
        p.bottomToTop = src.bottomToTop;
        p.bottomToBottom = src.bottomToBottom;
        p.baselineToBaseline = src.baselineToBaseline;
        p.baselineToTop = src.baselineToTop;
        p.baselineToBottom = src.baselineToBottom;
        p.circleConstraint = src.circleConstraint;
        p.circleRadius = src.circleRadius;
        p.circleAngle = src.circleAngle;
        p.startToEnd = src.startToEnd;
        p.startToStart = src.startToStart;
        p.endToStart = src.endToStart;
        p.endToEnd = src.endToEnd;
        p.goneLeftMargin = src.goneLeftMargin;
        p.goneTopMargin = src.goneTopMargin;
        p.goneRightMargin = src.goneRightMargin;
        p.goneBottomMargin = src.goneBottomMargin;
        p.goneStartMargin = src.goneStartMargin;
        p.goneEndMargin = src.goneEndMargin;
        p.goneBaselineMargin = src.goneBaselineMargin;
        p.baselineMargin = src.baselineMargin;
        p.horizontalBias = src.horizontalBias;
        p.verticalBias = src.verticalBias;
        p.dimensionRatio = src.dimensionRatio;
        p.horizontalWeight = src.horizontalWeight;
        p.verticalWeight = src.verticalWeight;
        p.horizontalChainStyle = src.horizontalChainStyle;
        p.verticalChainStyle = src.verticalChainStyle;
        p.constrainedWidth = src.constrainedWidth;
        p.constrainedHeight = src.constrainedHeight;
        p.matchConstraintDefaultWidth = src.matchConstraintDefaultWidth;
        p.matchConstraintDefaultHeight = src.matchConstraintDefaultHeight;
        p.matchConstraintMinWidth = src.matchConstraintMinWidth;
        p.matchConstraintMaxWidth = src.matchConstraintMaxWidth;
        p.matchConstraintMinHeight = src.matchConstraintMinHeight;
        p.matchConstraintMaxHeight = src.matchConstraintMaxHeight;
        p.matchConstraintPercentWidth = src.matchConstraintPercentWidth;
        p.matchConstraintPercentHeight = src.matchConstraintPercentHeight;
        p.editorAbsoluteX = src.editorAbsoluteX;
        p.editorAbsoluteY = src.editorAbsoluteY;
        p.orientation = src.orientation;
        p.constraintTag = src.constraintTag;
        p.wrapBehaviorInParent = src.wrapBehaviorInParent;
        p.validate();
        return p;
    }
}
