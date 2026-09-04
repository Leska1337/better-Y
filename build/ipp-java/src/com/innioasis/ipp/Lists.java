package com.innioasis.ipp;

import android.widget.BaseAdapter;

import java.lang.ref.WeakReference;
import java.util.ArrayList;

/**
 * Every song list that is still alive, so a track change repaints all of them — not just the one
 * the user happens to be looking at.
 *
 * A registry rather than one adapter, because list screens stack. Every folder of Folders is its own
 * {@code FilesActivity} (that is why {@code setStateBarLeftText} is only called from
 * {@code initView}), and the same holds for a song list under an album list: the screen underneath
 * is not destroyed, only covered, and nothing rebinds its rows when it comes back. Remember just the
 * last adapter to bind a row and a track started in the folder on top leaves the playing marker on
 * the old file in the folder underneath, until the wheel happens to repaint that one row.
 *
 * A weak reference each: an adapter is kept alive by its ListView and its Activity, and once those
 * are gone the entry drops out on the next pass. Registered adapters are only the ones that draw a
 * playing marker (the song lists and Folders), so the set is a handful at most, and
 * {@code notifyDataSetChanged} on a covered screen costs nothing until it is shown again.
 */
public final class Lists {

    private Lists() { }

    private static final ArrayList refs = new ArrayList();   // ArrayList<WeakReference>

    /** The adapter that bound the last row — the fast path out of {@link #note}. */
    private static Object last;

    /**
     * Called per bound row (from {@code ListWatch.tick}), so the common case has to be free: while
     * one screen is drawing, the adapter is the same object every time.
     */
    public static void note(BaseAdapter a) {
        if (a == null || a == last) return;
        last = a;
        try {
            for (int i = refs.size() - 1; i >= 0; i--) {
                Object o = ((WeakReference) refs.get(i)).get();
                if (o == null) {
                    refs.remove(i);
                } else if (o == a) {
                    return;
                }
            }
            refs.add(new WeakReference(a));
        } catch (Throwable t) {
            // a registry miss only costs a stale marker
        }
    }

    /** A track change: repaint every live list, dropping the ones whose screen has gone. */
    public static void refresh() {
        try {
            for (int i = refs.size() - 1; i >= 0; i--) {
                Object o = ((WeakReference) refs.get(i)).get();
                if (o == null) {
                    refs.remove(i);
                    continue;
                }
                try {
                    ((BaseAdapter) o).notifyDataSetChanged();
                } catch (Throwable t) {
                    // one list refusing to repaint must not stop the others
                }
            }
        } catch (Throwable t) {
            // ignore
        }
    }
}
