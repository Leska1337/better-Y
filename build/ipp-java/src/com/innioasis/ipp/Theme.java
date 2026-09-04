package com.innioasis.ipp;

import android.graphics.Color;

import java.util.HashMap;

/**
 * Theme helpers.
 *
 * {@link #parseColor} replaces the body of {@code ThemeManager.getColor(String)}, which called
 * {@code Color.parseColor} on every invocation with no cache at all. That method sits under
 * {@code itemSetTextColor} / {@code optionSetTextColor} / {@code menuItemSetTextColor}, i.e. it
 * runs once per TextView per bind: a single wheel click can rebind ~8 visible rows up to 11 times
 * (stock's SpeedUtil acceleration), which is a few hundred string parses per click.
 *
 * The mapping "#ffffff" -> int is a pure function of the string, so the cache never needs
 * invalidating on a theme change; it is bounded by the handful of distinct colours a config.json
 * declares. Nulls are cached too (a malformed colour must not be re-parsed on every row).
 *
 * Raw (non-generic) types: the bundled d8 crashes dexing generic Signature attrs.
 */
public final class Theme {

    private static final HashMap CACHE = new HashMap();

    /** Stock semantics: null / blank -> null, unparseable -> null, otherwise the parsed colour. */
    public static Integer parseColor(String s) {
        if (s == null) return null;
        if (CACHE.containsKey(s)) return (Integer) CACHE.get(s);
        Integer v = null;
        if (s.trim().length() != 0) {
            try {
                v = Integer.valueOf(Color.parseColor(s));
            } catch (Throwable t) {
                v = null;                      // stock returned null for an unparseable colour
            }
        }
        CACHE.put(s, v);
        return v;
    }
}
