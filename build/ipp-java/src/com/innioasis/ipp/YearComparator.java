package com.innioasis.ipp;

import java.util.Comparator;
import java.util.HashMap;

/**
 * Album NAMES (not songs) by year ({@link YearCache}). An album with no year sorts last in either
 * direction: the flag is applied to the sign after unknowns become MAX_VALUE.
 */
public final class YearComparator implements Comparator {

    private final boolean desc;
    /** Each album's year looked up once per sort, not once per comparison. */
    private final HashMap years = new HashMap();

    public YearComparator(boolean desc) {
        this.desc = desc;
    }

    private int year(Object o) {
        Object y = years.get(o);
        if (y == null) {
            y = Integer.valueOf(yearOf(o));
            years.put(o, y);
        }
        return ((Integer) y).intValue();
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
        int ya = year(a);
        int yb = year(b);
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
