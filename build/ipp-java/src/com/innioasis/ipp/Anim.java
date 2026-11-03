package com.innioasis.ipp;

import android.content.Context;

import com.innioasis.y1.Y1Application;

/**
 * "Enable animations": the one switch every animation of ours answers to — the gliding rows and the
 * travelling cursor of the tile grids (Playlists, Themes, Photos) and of the main menu ({@link Bar}).
 * Off, they move at once, as stock does.
 */
public final class Anim {

    private Anim() { }

    public static final String KEY = "animations";

    /**
     * The animations are in this build at all. False: off everywhere, whatever the setting says,
     * and the menu has no row for it (its line in the help assets stays and is skipped).
     */
    public static final boolean BUILT = false;

    public static boolean on() {
        if (!BUILT) return false;
        Context c = Y1Application.Companion.getAppContext();
        return Prefs.on(c, KEY);
    }
}
