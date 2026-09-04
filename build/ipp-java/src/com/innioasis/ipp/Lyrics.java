package com.innioasis.ipp;

import com.innioasis.y1_eBook.utils.FileEncodingDetector;

import java.io.File;
import java.nio.charset.Charset;

/**
 * Character-encoding detection for {@code .lrc} files, and the name-to-{@link Charset} step for
 * everything that goes through the app's detector.
 *
 * Why not stock's detector
 * {@code LyricParse.judgeCharset} asked cpdetector, whose actual engine here is a jchardet
 * build with these verifiers and no others: {@code BIG5, CP1252, EUC-JP, EUC-KR, EUC-TW, GB18030,
 * GB2312, HZ, ISO-2022-CN/JP/KR, SJIS, UCS2BE, UCS2LE, UTF8}. There is not one Cyrillic verifier in
 * it. Worse, its {@code ALL} mode walks the CJK group first, and a pair of Cyrillic bytes
 * (0xC0–0xFF followed by 0xC0–0xFF) is a valid two-byte GB2312/Big5 sequence — so a Russian lyric
 * file was answered with a Chinese codepage, decoded two bytes to one CJK character, and the bytes
 * that did not pair up became U+FFFD. That is the CJK-and-diamonds screen.
 *
 * The app already ships a detector that gets this right, in the e-book reader:
 * {@code FileEncodingDetector} tries the BOM, then a strict UTF-8 decode, then
 * {@code org.mozilla.universalchardet}, whose bundled models cover Big5 / GB18030 / EUC-KR /
 * Shift_JIS / EUC-JP / EUC-TW and the ISO-2022 family plus windows-1251, KOI8-R, IBM866,
 * IBM855, ISO-8859-5, MacCyrillic, windows-1253, ISO-8859-7, windows-1255, ISO-8859-8, TIS-620 and
 * windows-1252. A strict superset of what cpdetector could do. Lyrics go through it now, so a lyric
 * file and a book in the same encoding are read the same way.
 *
 * The name is not always a name Android knows
 * The detector answers with a name, and stock then does {@code Charset.forName(name)}
 * unguarded. Several names it can return are not in Android 4.2's charset table —
 * {@code MACCYRILLIC}, {@code TIS620}, {@code IBM855}, {@code EUC-TW}, the {@code X-ISO-10646-UCS-4}
 * pair — and {@code forName} throws on them, which threw away a correct detection. {@link #resolve}
 * is spliced into that one line: it tries the name as given, then the platform spellings of it, and
 * returns null when nothing fits so the caller falls back as it would have anyway. Both lyrics and
 * the book reader go through that line, so both are covered.
 */
public final class Lyrics {

    private Lyrics() { }

    private static final Charset UTF8 = Charset.forName("UTF-8");

    /**
     * Detector name (upper case) -> the spellings to try, in order. Only names that Android may not
     * know under the detector's own spelling are listed; everything else resolves directly.
     *
     * The two {@code X-ISO-10646-UCS-4-*} names are deliberately absent: they are UCS-4 in unusual
     * byte orders that Java has no charset for at all, so there is nothing to map them to.
     * {@code HZ-GB-2312} is absent for a different reason — it is an escape encoding, and decoding
     * it as GBK would produce confident garbage rather than an honest fallback.
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
     * The charset for a detected name, or null when the platform has nothing for it.
     * Spliced into {@code FileEncodingDetector.detectCharset} in place of its bare
     * {@code Charset.forName(it)} — null makes it take its own fallback branch.
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

    /** {@code isSupported} throws on a syntactically illegal name, so both calls are guarded. */
    private static Charset tryName(String n) {
        try {
            return Charset.isSupported(n) ? Charset.forName(n) : null;
        } catch (Throwable t) {
            return null;
        }
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
