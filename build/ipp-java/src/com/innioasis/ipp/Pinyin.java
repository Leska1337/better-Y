package com.innioasis.ipp;

import com.innioasis.y1.utils.HanziToPinyin;

import java.util.HashMap;

/**
 * Stock's {@code HanziToPinyin.getToken} remembered per character. It asks the ICU collator about
 * every character above U+00FF — every letter of a Cyrillic tag — and its answer depends on the
 * character alone, so each one is asked once per process. A fresh Token every time: the caller
 * puts it into the list it returns.
 */
public final class Pinyin {

    private Pinyin() { }

    /** char -> HanziToPinyin.Token as stock built it; read only. A library meets a few hundred. */
    private static final HashMap SEEN = new HashMap();
    /** A Chinese library meets thousands; past this the rest is asked as stock asks. */
    private static final int MAX = 4096;

    /** The remembered token of {@code c}, or null: then stock's getToken runs and {@link #keep} follows. */
    public static HanziToPinyin.Token token(char c) {
        HanziToPinyin.Token t;
        synchronized (SEEN) {
            t = (HanziToPinyin.Token) SEEN.get(Character.valueOf(c));
        }
        return t == null ? null : new HanziToPinyin.Token(t.type, t.source, t.target);
    }

    public static void keep(char c, HanziToPinyin.Token tok) {
        if (tok == null) return;
        HanziToPinyin.Token copy = new HanziToPinyin.Token(tok.type, tok.source, tok.target);
        synchronized (SEEN) {
            if (SEEN.size() < MAX) SEEN.put(Character.valueOf(c), copy);
        }
    }
}
