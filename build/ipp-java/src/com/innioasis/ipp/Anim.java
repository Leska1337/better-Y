package com.innioasis.ipp;

import android.content.Context;

import com.innioasis.y1.Y1Application;

/**
 * "Enable animations": the one switch every animation of ours answers to — the gliding rows and
 * the travelling cursor frame of the tile grids (Playlists, Themes, Photos). Off, they move at once,
 * as stock does.
 */
public final class Anim {

    private Anim() { }

    public static final String KEY = "animations";

    public static boolean on() {
        Context c = Y1Application.Companion.getAppContext();
        return Prefs.on(c, KEY);
    }
}
