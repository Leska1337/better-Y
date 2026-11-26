package com.innioasis.ipp;

import android.content.Context;

import com.innioasis.y1.Y1Application;

/**
 * "Enable animations" and its two sub-switches. Scroll: the gliding rows and the travelling cursor
 * of the lists and tile grids ({@link Bar}). Navigation: the slide between menu screens
 * ({@link Nav}). Off, everything moves at once, as stock does.
 */
public final class Anim {

    private Anim() { }

    public static final String KEY = "animations";
    public static final String KEY_NAV = "anim_nav";
    public static final String KEY_SCROLL = "anim_scroll";

    /**
     * The scroll animations are in this build at all. False: off whatever the setting says, and the
     * menu has no row for them.
     */
    public static final boolean BUILT = true;

    /** The same for the slide between screens. With both false the menu has no animations row at all. */
    public static final boolean NAV_BUILT = false;

    /** The scroll animations. */
    public static boolean on() {
        if (!BUILT) return false;
        Context c = Y1Application.Companion.getAppContext();
        return Prefs.on(c, KEY) && Prefs.on(c, KEY_SCROLL);
    }

    /** The slide between menu screens. */
    public static boolean nav() {
        if (!NAV_BUILT) return false;
        Context c = Y1Application.Companion.getAppContext();
        return Prefs.on(c, KEY) && Prefs.on(c, KEY_NAV);
    }
}
