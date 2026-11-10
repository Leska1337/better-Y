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
 * The better-Y menu as {@code assets/help/<lang>.txt} declares it: row names, choice values and
 * the help text behind the top-button hold. English gives the structure, the device language the
 * wording. Format:
 *
 * [meta_title]                     ← the row's key
 * Song titles are read from the tag rather than from the file name.
 * @img meta_title_1.png caption    ← a page that is this picture
 * ---                              ← a forced page break; otherwise pages are measured
 *
 * {@code {row:<key>}} (another row's label), {@code {app:<name>}} and {@code {On}}/{@code {Off}}
 * are resolved at display time, in the device's language.
 */
public final class Help {

    private Help() { }

    private static final String DIR = "help";
    private static final String IMG = "help/img/";

    /** Text or a picture, never both. */
    public static final class Block {
        public final String text;      // null for a picture
        public final String img;       // null for text
        public final String cap;       // a picture's caption

        Block(String text, String img, String cap) {
            this.text = text;
            this.img = img;
            this.cap = cap;
        }
    }

    /** A row's wording and placement. What it DOES (kind, key, default) is in {@code IppActivity}. */
    public static final class Row {
        public final String key;       // row key (= its preference key / action id)
        public final boolean group;    // true for a group caption, which owns no setting
        public String label;           // null when no file names it: the string resource stands in
        public String showIf;          // parent row's key, or null — structure, so English only
        public String parent;          // the section row it stands in, or null — English only
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
     * In English's order. Empty if the asset cannot be read; the caller then keeps its own
     * order, so a mangled file costs the arrangement and never a setting.
     */
    public static List rows(Context c) {
        load(c);
        return order == null ? new ArrayList() : order;
    }

    /** Null when no asset names the row. */
    public static String label(Context c, String key) {
        Row r = row(c, key);
        return r == null ? null : r.label;
    }

    public static Row row(Context c, String key) {
        if (key == null) return null;
        load(c);
        return entries == null ? null : (Row) entries.get(key);
    }

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
                // "@img <file> <caption...>": the file name has no space.
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

    /** {width, height} without decoding, or null. */
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

    /** Decoded on demand: only one page shows it. */
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

    private static String raw(Context c, String key) {
        Row r = row(c, key);
        return r == null ? null : r.body;
    }

    /**
     * Once per language. Only English builds the arrangement, so a translation can never move a
     * row; it is laid over the top, and what it lacks stays English.
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

    /** The resource configuration's language, not {@code Locale.getDefault()}: they can differ. */
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
            return null;
        } finally {
            close(in);
        }
    }

    /**
     * {@code [[group]] Caption}, {@code [row] Name}, {@code [row if parent] Name} or
     * {@code [row in section] Name}; {@code * } is a value; the rest is the description. With
     * {@code o} null this is a translation pass,
     * which only fills rows English declared — a misspelt key is dropped.
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
                int sp = head.indexOf(' ');
                String key = sp > 0 ? head.substring(0, sp) : head;
                if (o != null) {
                    row = new Row(key, group);
                    row.showIf = clause(head, " if ");
                    row.parent = clause(head, " in ");
                    into.put(key, row);
                    o.add(row);
                } else {
                    row = (Row) into.get(key);
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

    /** The key after {@code word} in a row's head, or null. */
    private static String clause(String head, String word) {
        int at = head.indexOf(word);
        if (at < 0) return null;
        String s = head.substring(at + word.length()).trim();
        int sp = s.indexOf(' ');
        if (sp > 0) s = s.substring(0, sp);
        return s.length() == 0 ? null : s;
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
            if ("on".equalsIgnoreCase(tag)) return c.getString(R.string.ipp_on);
            if ("off".equalsIgnoreCase(tag)) return c.getString(R.string.ipp_off);
        } catch (Throwable t) {
        }
        return null;   // left as written
    }

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
        }
    }
}
