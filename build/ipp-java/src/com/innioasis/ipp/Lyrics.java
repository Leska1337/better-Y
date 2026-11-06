package com.innioasis.ipp;

import com.innioasis.y1_eBook.utils.FileEncodingDetector;

import java.io.File;
import java.nio.charset.Charset;

/**
 * Encoding detection for {@code .lrc} files through the e-book reader's detector (stock's
 * cpdetector has no Cyrillic and read Russian as GB2312), and the name-to-{@link Charset} step
 * shared by both: several names the detector returns are unknown to Android 4.2 under that
 * spelling, and an unguarded {@code forName} threw a correct detection away.
 */
public final class Lyrics {

    private Lyrics() { }

    private static final Charset UTF8 = Charset.forName("UTF-8");

    /**
     * Detector name (upper case) -> spellings to try. {@code X-ISO-10646-UCS-4-*} has no Java
     * charset at all; {@code HZ-GB-2312} is left out on purpose — decoded as GBK it is confident
     * garbage instead of an honest fallback.
     */
    private static final String[][] ALIASES = {
        { "MACCYRILLIC", "x-MacCyrillic", "MacCyrillic", "x-mac-cyrillic" },
        { "TIS620",      "TIS-620", "x-TIS620", "ISO-8859-11" },
        { "IBM855",      "IBM855", "cp855", "x-IBM855" },
        { "IBM866",      "IBM866", "cp866" },
        { "EUC-TW",      "x-EUC-TW", "EUC-TW" },
        { "SHIFT_JIS",   "Shift_JIS", "SJIS", "windows-31j" },
        { "GB18030",     "GB18030", "GBK" },
    };

    /**
     * Spliced into {@code FileEncodingDetector.detectCharset} in place of its bare
     * {@code Charset.forName}; null sends it down its own fallback branch.
     */
    public static Charset resolve(String name) {
        if (name == null) return null;
        String n = name.trim();
        if (n.length() == 0) return null;
        Charset direct = tryName(n);
        if (direct != null) return direct;

        String upper = n.toUpperCase();
        for (int i = 0; i < ALIASES.length; i++) {
            if (!ALIASES[i][0].equals(upper)) continue;
            for (int j = 1; j < ALIASES[i].length; j++) {
                Charset c = tryName(ALIASES[i][j]);
                if (c != null) return c;
            }
            break;
        }
        return null;
    }

    /** {@code isSupported} throws on a syntactically illegal name. */
    private static Charset tryName(String n) {
        try {
            return Charset.isSupported(n) ? Charset.forName(n) : null;
        } catch (Throwable t) {
            return null;
        }
    }

    /**
     * The same answer for bytes already in memory (a lyrics tag): strict UTF-8, then the
     * statistical detector, then Latin-1. Never null.
     */
    public static Charset guess(byte[] d, int off, int len) {
        try {
            UTF8.newDecoder()
                    .onMalformedInput(java.nio.charset.CodingErrorAction.REPORT)
                    .onUnmappableCharacter(java.nio.charset.CodingErrorAction.REPORT)
                    .decode(java.nio.ByteBuffer.wrap(d, off, len));
            return UTF8;
        } catch (Throwable t) {
        }
        try {
            org.mozilla.universalchardet.UniversalDetector u =
                    new org.mozilla.universalchardet.UniversalDetector();
            u.handleData(d, off, len);
            u.dataEnd();
            Charset c = resolve(u.getDetectedCharset());
            if (c != null) return c;
        } catch (Throwable t) {
        }
        return Charset.forName("ISO-8859-1");
    }

    /** Drop-in for {@code LyricParse.Companion.judgeCharset}. Never throws, never returns null. */
    public static Charset charset(File f) {
        try {
            if (f == null || !f.isFile()) return UTF8;
            Charset c = FileEncodingDetector.INSTANCE.detectCharset(f.getPath(), UTF8);
            Diag.note("lrc " + f.getName() + ": " + (c == null ? "?" : c.name()));
            return c == null ? UTF8 : c;
        } catch (Throwable t) {
            return UTF8;
        }
    }
}
