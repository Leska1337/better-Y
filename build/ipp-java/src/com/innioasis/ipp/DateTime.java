package com.innioasis.ipp;

import android.app.Activity;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import com.innioasis.y1.R;
import com.innioasis.y1.activity.DateOneLevelActivity;
import com.innioasis.y1.theme.ThemeManager;

/**
 * The Date & time screen's rows, after stock's {@code refresh()} has painted them: the two long
 * labels end in "…" and the cursor's scrolls; the Time row, which has no value to show, carries
 * the theme's arrow while it is the cursor, as a Settings row does.
 */
public final class DateTime {

    private DateTime() { }

    private static final int TIME = 1;

    public static void rows(Object activity) {
        if (!(activity instanceof DateOneLevelActivity)) return;
        try {
            int pos = ((DateOneLevelActivity) activity).getPosition();
            Activity a = (Activity) activity;
            label(a.findViewById(R.id.item_ltv2), pos == 2);
            label(a.findViewById(R.id.item_ltv3), pos == 3);
            View row = a.findViewById(R.id.item1);
            View arrow = row == null ? null : row.findViewById(R.id.arrow);
            if (arrow instanceof ImageView) {
                if (pos == TIME) {
                    ThemeManager.INSTANCE.itemSetRightArrow((ImageView) arrow, R.mipmap.right_arrow);
                    arrow.setVisibility(View.VISIBLE);
                } else {
                    arrow.setVisibility(View.GONE);
                }
            }
            RowBar.dateTime(a, pos);
        } catch (Throwable t) {
        }
    }

    private static void label(View v, boolean focus) {
        if (!(v instanceof TextView)) return;
        if (focus) Scroll.rowText((TextView) v);
        else Scroll.rowPlain((TextView) v);
    }
}
