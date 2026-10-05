package com.innioasis.ipp;

import android.widget.BaseAdapter;

import java.lang.ref.WeakReference;
import java.util.ArrayList;

/**
 * Every live song list, so a track change repaints all of them. List screens stack (each folder
 * is its own {@code FilesActivity}) and a covered one is not rebound when it comes back — with only
 * the last adapter remembered, the screen underneath keeps the marker on the old track.
 */
public final class Lists {

    private Lists() { }

    private static final ArrayList refs = new ArrayList();   // ArrayList<WeakReference>

    private static Object last;

    /** Called per bound row, so the common case — the same adapter again — must be free. */
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
        }
    }

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
                }
            }
        } catch (Throwable t) {
        }
    }
}
