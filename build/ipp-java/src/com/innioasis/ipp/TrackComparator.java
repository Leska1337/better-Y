package com.innioasis.ipp;

import java.util.Comparator;

import com.innioasis.y1.database.Song;

/** Songs by TRACK NUMBER ({@link TrackCache}); untagged files read 0 and sort first. */
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
