package com.innioasis.ipp;

import android.content.Context;
import android.content.res.AssetManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;

import com.innioasis.y1.R;
import com.innioasis.y1.activity.IppActivity;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * The text behind the help windows of the better-Y screen: what each row does, in the
 * device's language, shown by holding the top button on it.
 *
 * Why this is an ASSET and not a string resource
 * A description per row is a paragraph, not a label, and there are two dozen rows. As string
 * resources that would be ~24 entries in each of the eight locale files plus an id apiece in
 * {@code public.xml} — some 200 entries whose only reader is this one screen, and a translator
 * would have to be handed eight XML files to work in. As an asset it is one plain text file per
 * language ({@code assets/help/ru.txt}), which can be handed over, edited and diffed as itself,
 * and a language nobody has translated yet simply falls back to English instead of needing empty
 * entries everywhere.
 *
 * The format
 * [meta_title]                     ← the row's key, exactly as buildItems() spells it
 * Song titles are read from the tag rather than from the file name.
 * @img meta_title_1.png            ← a page that is nothing but this picture
 * ---                              ← a forced page break; otherwise pages are measured
 *
 * [alpha_scroll]
 * … {row:follow_playing} … {app:artists} … {On} … {Off} …
 *
 * {@code {row:<key>}} is the LABEL of another row of this menu, {@code {app:<name>}} is one
 * of the app's own names (a section, the favourites playlist), and {@code {On}} / {@code {Off}}
 * are a toggle's two values as the row itself shows them. All are resolved at display time,
 * in the language the device is in — a description that spelled another row's name out in words
 * would be wrong in every language but the one it was written in, and stale the moment that row is
 * renamed.
 */
public final class Help {

    private Help() { }

    private static final String DIR = "help";
    private static final String IMG = "help/img/";

    /** One page's worth of content: either text or a picture, never both. */
    public static final class Block {
        public final String text;      // null for a picture
        public final String img;       // null for text
        public final String cap;       // a picture may carry a caption; text never does

        Block(String text, String img, String cap) {
            this.text = text;
            this.img = img;
            this.cap = cap;
        }
    }

    /**
     * One row of the better-Y menu as the ASSET declares it: its name, the values of a choice
     * row, which other row it is a sub-item of, and its description. What the row DOES — its kind,
     * its preference key, its default — stays in {@code IppActivity}: that is behaviour, not
     * wording, and it cannot be written in a text file without inventing a language for it.
     */
    public static final class Row {
        public final String key;       // row key (= its preference key / action id)
        public final boolean group;    // true for a group caption, which owns no setting
        public String label;           // null when no file names it: the string resource stands in
        public String showIf;          // parent row's key, or null — structure, so English only
        public String[] values;        // CHOICE value labels, or null
        public String body;            // the description, as written

        Row(String key, boolean group) {
            this.key = key;
            this.group = group;
        }
    }

    private static HashMap entries;        // key -> Row, current language over English
    private static List order;             // Rows as ENGLISH lists them: the menu's own order
    private static String loadedFor;       // the language `entries` was built for

    /**
     * The menu as the English asset lays it out: groups and rows in their order, each already
     * carrying the label and values of the language on screen. Empty if the asset cannot be read
     * at all — the caller then keeps the order it was built with, so a mangled file costs the
     * arrangement and never a setting.
     */
    public static List rows(Context c) {
        load(c);
        return order == null ? new ArrayList() : order;
    }

    /** The row's name in the language on screen, or null when no asset names it. */
    public static String label(Context c, String key) {
        Row r = row(c, key);
        return r == null ? null : r.label;
    }

    /** One row's entry, or null. */
    public static Row row(Context c, String key) {
        if (key == null) return null;
        load(c);
        return entries == null ? null : (Row) entries.get(key);
    }

    /** Is there anything to show for this row? */
    public static boolean has(Context c, String key) {
        return raw(c, key) != null;
    }

    /** The row's help, split into blocks in the order they were written. */
    public static List blocks(Context c, String key) {
        List out = new ArrayList();
        String s = raw(c, key);
        if (s == null) return out;
        s = resolve(c, s);
        StringBuilder text = new StringBuilder();
        String[] lines = s.split("\n");
        for (int i = 0; i < lines.length; i++) {
            String line = lines[i];
            String t = line.trim();
            if (t.startsWith("@img ")) {
                flush(out, text);
                // "@img <file> <caption...>": the file name cannot contain a space, so the rest
                // of the line is the caption -- what the reader is meant to see in the picture.
                String rest = t.substring(5).trim();
                int sp = rest.indexOf(32);
                out.add(sp < 0 ? new Block(null, rest, null)
                               : new Block(null, rest.substring(0, sp), rest.substring(sp + 1).trim()));
            } else if (t.equals("---")) {
                flush(out, text);
            } else {
                if (text.length() > 0) text.append('\n');
                text.append(line);
            }
        }
        flush(out, text);
        return out;
    }

    private static void flush(List out, StringBuilder text) {
        String s = text.toString().trim();
        if (s.length() > 0) out.add(new Block(s, null, null));
        text.setLength(0);
    }

    /** How big a picture is, without decoding it: {int width, int height}, or null. */
    public static int[] size(Context c, String file) {
        InputStream in = null;
        try {
            BitmapFactory.Options o = new BitmapFactory.Options();
            o.inJustDecodeBounds = true;
            in = c.getAssets().open(IMG + file);
            BitmapFactory.decodeStream(in, null, o);
            return o.outWidth > 0 ? new int[]{o.outWidth, o.outHeight} : null;
        } catch (Throwable t) {
            return null;
        } finally {
            close(in);
        }
    }

    /** A picture from the asset folder, or null. Decoded on demand: only one page shows one. */
    public static Bitmap image(Context c, String file) {
        InputStream in = null;
        try {
            in = c.getAssets().open(IMG + file);
            return BitmapFactory.decodeStream(in);
        } catch (Throwable t) {
            return null;
        } finally {
            close(in);
        }
    }

    // ---------------------------------------------------------------- loading

    private static String raw(Context c, String key) {
        Row r = row(c, key);
        return r == null ? null : r.body;
    }

    /**
     * Read once per language and kept. English is read FIRST and is the only pass that builds the
     * arrangement — order, grouping and {@code showIf} — so a translator can never move a row by
     * accident; the device's language is then laid over the top, filling in whatever wording it
     * has. A half-translated file therefore shows English for the rest instead of nothing at all.
     */
    private static void load(Context c) {
        if (c == null) return;
        String lang = lang(c);
        if (entries != null && lang.equals(loadedFor)) return;
        HashMap m = new HashMap();
        List o = new ArrayList();
        parse(read(c, "en"), m, o);
        if (!"en".equals(lang)) parse(read(c, lang), m, null);
        entries = m;
        order = o;
        loadedFor = lang;
    }

    /**
     * The language the app is actually RENDERING in, taken from the resource configuration rather
     * than from {@code Locale.getDefault()} — the two can differ, and what the user is reading is
     * decided by the first.
     */
    private static String lang(Context c) {
        try {
            String l = c.getResources().getConfiguration().locale.getLanguage();
            return l == null || l.length() == 0 ? "en" : l;
        } catch (Throwable t) {
            return "en";
        }
    }

    private static String read(Context c, String lang) {
        InputStream in = null;
        try {
            AssetManager am = c.getAssets();
            in = am.open(DIR + "/" + lang + ".txt");
            ByteArrayOutputStream out = new ByteArrayOutputStream(8192);
            byte[] buf = new byte[4096];
            int got;
            while ((got = in.read(buf)) > 0) out.write(buf, 0, got);
            return new String(out.toByteArray(), "UTF-8");
        } catch (Throwable t) {
            return null;                       // no file for this language: English stands
        } finally {
            close(in);
        }
    }

    /**
     * A header line is {@code [[group]] Caption} or {@code [row]} / {@code [row if parent]} plus
     * the row's name; a {@code * } line is one value of a choice row; everything else is the
     * description. When {@code o} is null this is a TRANSLATION pass: it fills wording into rows
     * English already declared and adds nothing, so a stray or misspelt key in a translation is
     * dropped rather than growing a row nobody can reach.
     */
    private static void parse(String s, HashMap into, List o) {
        if (s == null) return;
        Row row = null;
        StringBuilder body = new StringBuilder();
        List vals = new ArrayList();
        String[] lines = s.split("\n");
        for (int i = 0; i < lines.length; i++) {
            String line = lines[i];
            String t = line.trim();
            boolean group = t.startsWith("[[");
            if (t.startsWith("[") && t.indexOf(']') > 1) {
                store(row, body, vals);
                int close = t.indexOf(group ? "]]" : "]");
                String head = t.substring(group ? 2 : 1, close).trim();
                String label = t.substring(close + (group ? 2 : 1)).trim();
                String key = head;
                String showIf = null;
                int sp = head.indexOf(" if ");
                if (sp > 0) {
                    key = head.substring(0, sp).trim();
                    showIf = head.substring(sp + 4).trim();
                }
                if (o != null) {
                    row = new Row(key, group);
                    row.showIf = (showIf == null || showIf.length() == 0) ? null : showIf;
                    into.put(key, row);
                    o.add(row);
                } else {
                    row = (Row) into.get(key);       // structure comes from English and only English
                }
                if (row != null && label.length() > 0) row.label = label;
                body.setLength(0);
                vals.clear();
            } else if (row != null && t.startsWith("* ")) {
                vals.add(t.substring(2).trim());
            } else if (row != null) {
                if (body.length() > 0) body.append('\n');
                body.append(line);
            }
        }
        store(row, body, vals);
    }

    private static void store(Row row, StringBuilder body, List vals) {
        if (row == null) return;
        String s = body.toString().trim();
        if (s.length() > 0) row.body = s;
        if (!vals.isEmpty()) {
            String[] a = new String[vals.size()];
            for (int i = 0; i < a.length; i++) a[i] = (String) vals.get(i);
            row.values = a;
        }
    }

    // ---------------------------------------------------------------- placeholders

    /** {@code {row:<key>}} and {@code {app:<name>}}, resolved in the language on screen. */
    private static String resolve(Context c, String s) {
        if (s.indexOf('{') < 0) return s;
        StringBuilder out = new StringBuilder(s.length() + 32);
        int i = 0;
        while (i < s.length()) {
            int open = s.indexOf('{', i);
            if (open < 0) { out.append(s.substring(i)); break; }
            int close = s.indexOf('}', open);
            if (close < 0) { out.append(s.substring(i)); break; }
            out.append(s, i, open);
            String tag = s.substring(open + 1, close);
            String value = value(c, tag);
            out.append(value == null ? s.substring(open, close + 1) : value);
            i = close + 1;
        }
        return out.toString();
    }

    private static String value(Context c, String tag) {
        try {
            if (tag.startsWith("row:")) {
                return IppActivity.labelOf(tag.substring(4));
            }
            if (tag.startsWith("app:")) {
                int res = appRes(tag.substring(4));
                return res == 0 ? null : c.getString(res);
            }
            // {On} / {Off} -- a toggle's two values, worded exactly as the row itself shows them.
            // Prefixless because a caption reads as a caption ("{On} + {Off}"), and case-blind
            // because a description writes it the way the sentence wants it.
            if ("on".equalsIgnoreCase(tag)) return c.getString(R.string.ipp_on);
            if ("off".equalsIgnoreCase(tag)) return c.getString(R.string.ipp_off);
        } catch (Throwable t) {
            // an unresolvable name is left as it was written, which is at least readable
        }
        return null;
    }

    /** The app's own names a description may need. Deliberately short: a list, not a lookup table. */
    private static int appRes(String name) {
        if ("artists".equals(name)) return R.string.music_artists;
        if ("albums".equals(name)) return R.string.music_albums;
        if ("genres".equals(name)) return R.string.music_genres;
        if ("folders".equals(name)) return R.string.music_folders;
        if ("favorites".equals(name)) return R.string.ipp_favorites;
        return 0;
    }

    private static void close(InputStream in) {
        try {
            if (in != null) in.close();
        } catch (Throwable t) {
            // ignore
        }
    }
}
