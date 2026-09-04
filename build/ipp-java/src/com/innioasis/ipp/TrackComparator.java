package com.innioasis.ipp;

import java.util.Comparator;

import com.innioasis.y1.database.Song;

/**
 * Sorts songs by their TRACK NUMBER tag, read through {@link TrackCache}.
 *
 * Raw {@code Comparator} on purpose — a generic one makes javac emit a class {@code Signature}
 * attribute, and the bundled d8 (R8 8.2.2-dev) crashes dexing those. Hence the casts in
 * {@link #compare}.
 *
 * Songs with no tag come back as 0 from the cache and therefore sort first, which is what the
 * album screens want: an untagged file has nothing to place it by.
 */
public final class TrackComparator implements Comparator {

    @Override
    public int compare(Object a, Object b) {
        int na = TrackCache.get(((Song) a).getPath());
        int nb = TrackCache.get(((Song) b).getPath());
        if (na < nb) {
            return -1;
        }
        if (na > nb) {
            return 1;
        }
        return 0;
    }
}
