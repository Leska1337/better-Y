package com.innioasis.ipp;

import java.util.Comparator;

/**
 * Sorts ALBUM NAMES by the year of their songs, read through {@link YearCache}.
 *
 * Its elements are the album name strings, not Song objects — that is what the album screens
 * hold. Raw {@code Comparator} for the same reason as {@link TrackComparator}: a generic one emits
 * a {@code Signature} attribute and d8 crashes on it.
 *
 * An album with no year sorts LAST in either direction: its year is replaced by
 * {@code Integer.MAX_VALUE} before the comparison and the descending flag is applied to the sign
 * afterwards, so "unknown" never floats to the top of a newest-first list.
 */
public final class YearComparator implements Comparator {

    private final boolean desc;

    public YearComparator(boolean desc) {
        this.desc = desc;
    }

    /** The album's year as an int, or 0 when there is no usable tag. */
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
