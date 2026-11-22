package com.innioasis.ipp;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;

import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.recyclerview.widget.RecyclerView;

import com.innioasis.y1.R;

/**
 * The main menu's and Settings' list geometry. "fixed_menu_pad" ON (default): edge to edge, no
 * left margin, down to the bottom. OFF: stock's inset, which some themes' row artwork expects.
 * Inverting the row's wording without renaming the key flips the geometry on every device.
 * With {@link MenuStyle#simple} the list runs to the right edge, with {@link MenuStyle#even} to
 * the middle. OFF also keeps the rows' text at stock's inset; ON it stands under the status bar's
 * title, as the layouts have it. The other lists beside a preview take the margin in MenuStyle.
 * One method for both screens, told apart by the list's id — one reference in the full classes.dex.
 */
public final class Pad {

    private Pad() { }

    public static final String KEY = "fixed_menu_pad";

    // dip == px on this 160 dpi device. Both sets are written: the setting can be turned back on.
    private static final int MARGIN = 9;
    private static final int MAIN_W = 204;
    private static final int MAIN_H = 307;
    private static final int SET_W = 218;
    private static final int SET_H = 305;
    private static final int IPP_MAIN_W = 213;
    private static final int IPP_SET_W = 227;
    private static final int IPP_H = 315;      // 360 - the 45px status bar
    private static final int HALF = 240;

    /** Also from {@code MainActivity.onResume}: the main menu is not re-created on return. */
    public static void list(RecyclerView rv) {
        try {
            if (rv == null) return;
            Context c = rv.getContext();
            if (c == null) return;
            boolean stock = !Prefs.on(c, KEY);

            int id = rv.getId();
            if (id == R.id.rc_list || id == R.id.recycler) {
                if (rv.getTag(R.id.layout) == null) {
                    rv.setTag(R.id.layout, Boolean.TRUE);
                    rv.addOnChildAttachStateChangeListener(new Inset());
                }
                // the rows already there: the main menu is not rebuilt on return
                for (int i = 0; i < rv.getChildCount(); i++) inset(rv.getChildAt(i), stock);
            }
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
            if (MenuStyle.simple(c)) wPx = c.getResources().getDisplayMetrics().widthPixels - mPx;
            else if (MenuStyle.even(c)) wPx = px(HALF, d) - mPx;
            if (lp.width == wPx && lp.height == hPx && lp.leftMargin == mPx) return;
            lp.width = wPx;
            lp.height = hPx;
            lp.leftMargin = mPx;
            rv.setLayoutParams(lp);
        } catch (Throwable t) {
        }
    }

    // The label's start margin: stock's, and under the status bar's title (its own 10dip, less
    // the main menu label's 5dip padding).
    private static final int STOCK_MAIN = 0;
    private static final int STOCK_SET = 5;
    private static final int SHIFT = 5;

    private static void inset(View row, boolean stock) {
        if (row == null) return;
        int dip = STOCK_MAIN;
        View tv = row.findViewById(R.id.tv_item);
        if (tv == null) {
            tv = row.findViewById(R.id.title);
            dip = STOCK_SET;
        }
        if (tv == null || !(tv.getLayoutParams() instanceof ViewGroup.MarginLayoutParams)) return;
        ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) tv.getLayoutParams();
        int m = px(stock ? dip : dip + SHIFT, row.getResources().getDisplayMetrics().density);
        if (lp.leftMargin == m && lp.getMarginStart() == m) return;
        // both: the start form overwrites leftMargin on every layout pass
        lp.leftMargin = m;
        lp.setMarginStart(m);
        tv.setLayoutParams(lp);
    }

    static final class Inset implements RecyclerView.OnChildAttachStateChangeListener {
        @Override
        public void onChildViewAttachedToWindow(View row) {
            try {
                inset(row, !Prefs.on(row.getContext(), KEY));
            } catch (Throwable t) {
            }
        }

        @Override
        public void onChildViewDetachedFromWindow(View row) { }
    }

    private static int px(int dip, float d) {
        return (int) (dip * d + 0.5f);
    }

    /**
     * A second view's place in a ConstraintLayout, copied from the first on fresh params. Not the
     * copy constructor: it shares the source's {@code ConstraintWidget}, so the copy is never
     * measured and ignores its own geometry. Derived state is recomputed by {@code validate}.
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
