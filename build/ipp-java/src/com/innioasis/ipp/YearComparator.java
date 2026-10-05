package com.innioasis.ipp;

import java.util.Comparator;

/**
 * Album NAMES (not songs) by year ({@link YearCache}). An album with no year sorts last in either
 * direction: the flag is applied to the sign after unknowns become MAX_VALUE.
 */
public final class YearComparator implements Comparator {

    private final boolean desc;

    public YearComparator(boolean desc) {
        this.desc = desc;
    }

    /** 0 when there is no usable tag. */
    private static int yearOf(Object o) {
        if (o == null) {
            return 0;
        }
        String y = YearCache.get((String) o);
        if (y == null || y.length() != 4) {
            return 0;
        }
        try {
            return Integer.parseInt(y);
        } catch (Throwable t) {
            return 0;
        }
    }

    @Override
    public int compare(Object a, Object b) {
        int ya = yearOf(a);
        int yb = yearOf(b);
        if (ya == 0) {
            ya = Integer.MAX_VALUE;
        }
        if (yb == 0) {
            yb = Integer.MAX_VALUE;
        }
        if (ya == yb) {
            return 0;
        }
        int r = ya < yb ? -1 : 1;
        return desc ? -r : r;
    }
}
