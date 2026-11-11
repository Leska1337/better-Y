package com.innioasis.ipp;

import android.app.Activity;
import android.graphics.Typeface;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.StyleSpan;
import android.view.WindowManager;

import androidx.lifecycle.MutableLiveData;

import com.innioasis.music.objects.Constant;
import com.innioasis.y1.R;
import com.innioasis.y1.utils.InputMethodDialog;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

/**
 * Where the card's /Music/ lies on a computer, kept in better-Y/music_path.txt (one line,
 * "D:\Music" or "/Users/me/Music"). With it, export writes full paths — the list plays from any
 * folder on that computer — and import maps them back by taking the base off. The rest of the
 * card maps to the base's parent ("D:\Audiobooks\..."). No file: export stays relative to /Music/.
 */
public final class M3uBase {

    private M3uBase() { }

    /** The line carrying the base inside a list, so import does not depend on the file. */
    static final String LINE = "#BETTERY:BASE:";

    static File file() {
        return new File(Panel.card(), "music_path.txt");
    }

    /** The stored base, or null. */
    public static String get() {
        try {
            File f = file();
            if (!f.isFile()) return null;
            FileInputStream in = new FileInputStream(f);
            byte[] b;
            try {
                b = new byte[(int) Math.min(f.length(), 4096)];
                int got = 0;
                while (got < b.length) {
                    int r = in.read(b, got, b.length - got);
                    if (r < 0) break;
                    got += r;
                }
            } finally {
                in.close();
            }
            String[] ls = new String(b, "UTF-8").split("\r\n|\r|\n");
            for (int i = 0; i < ls.length; i++) {
                String l = ls[i].trim();
                if (l.length() > 0 && l.charAt(0) == '\uFEFF') l = l.substring(1).trim();
                if (l.length() > 0) return trim(l);
            }
        } catch (Throwable t) {
        }
        return null;
    }

    static boolean put(String base) {
        try {
            File d = Panel.card();
            if (!d.isDirectory() && !d.mkdirs()) return false;
            FileOutputStream out = new FileOutputStream(file());
            try {
                out.write((trim(base) + "\r\n").getBytes("UTF-8"));
                out.getFD().sync();
            } finally {
                out.close();
            }
            return true;
        } catch (Throwable t) {
            Diag.note("music_path write: " + t);
            return false;
        }
    }

    /** Trailing separators off; "D:\" stays "D:". */
    static String trim(String s) {
        String t = s.trim();
        while (t.length() > 1 && (t.endsWith("/") || t.endsWith("\\"))) {
            t = t.substring(0, t.length() - 1);
        }
        return t;
    }

    private static String key(String s) {
        return trim(s.replace('\\', '/')).toLowerCase();
    }

    public static boolean same(String a, String b) {
        if (a == null || b == null) return a == b;
        return key(a).equals(key(b));
    }

    private static boolean windows(String b) {
        return b.indexOf('\\') >= 0 || (b.length() >= 2 && b.charAt(1) == ':');
    }

    private static String parent(String b) {
        int i = Math.max(b.lastIndexOf('/'), b.lastIndexOf('\\'));
        return i > 0 ? b.substring(0, i) : b;
    }

    /** A card path as the computer under this base spells it, or null when it is not on the card. */
    static String absolute(String base, String path) {
        if (base == null || path == null) return null;
        String root = Constant.ROOT_PATH;
        String music = root + "/Music";
        String b;
        String rest;
        if (path.startsWith(music + "/")) {
            b = base;
            rest = path.substring(music.length() + 1);
        } else if (path.startsWith(root + "/")) {
            b = parent(base);
            rest = path.substring(root.length() + 1);
        } else {
            return null;
        }
        char sep = windows(base) ? '\\' : '/';
        return b + sep + rest.replace('/', sep);
    }

    /** The card path an entry means under this base, added to {@code out}; nothing when it is not under it. */
    static void strip(String raw, String base, List out) {
        if (base == null || base.length() == 0) return;
        String s = M3u.pct(raw.trim()).replace('\\', '/');
        String b = trim(base.replace('\\', '/'));
        String root = Constant.ROOT_PATH;
        if (s.regionMatches(true, 0, b + "/", 0, b.length() + 1)) {
            out.add(M3u.norm(root + "/Music/" + s.substring(b.length() + 1)));
            return;
        }
        String p = parent(b);
        if (!p.equals(b) && s.regionMatches(true, 0, p + "/", 0, p.length() + 1)) {
            out.add(M3u.norm(root + "/" + s.substring(p.length() + 1)));
        }
    }

    // ---- the base a run of imports points at ------------------------------------------------

    /**
     * Each found song votes for the prefix its entry has in front of the song's path under /Music/:
     * "D:\Music\A\B\01.mp3" found as /Music/A/B/01.mp3 votes "D:\Music". Only full paths off the
     * card vote; the prefix with most votes wins.
     */
    public static final class Learn {
        private final HashMap votes = new HashMap();   // key -> Object[] { spelling, Integer }

        void note(String raw, String path) {
            String music = Constant.ROOT_PATH + "/Music/";
            if (raw == null || path == null || !path.startsWith(music)) return;
            String s = M3u.pct(raw.trim());
            if (s.regionMatches(true, 0, "file:", 0, 5)) return;
            String n = s.replace('\\', '/');
            boolean drive = n.length() >= 2 && Character.isLetter(n.charAt(0)) && n.charAt(1) == ':';
            if (!drive && !n.startsWith("/")) return;
            if (!drive && M3u.onCard(n)) return;
            String rel = path.substring(music.length());
            int cut = n.length() - rel.length();
            if (cut < 2 || n.charAt(cut - 1) != '/') return;
            if (!n.regionMatches(true, cut, rel, 0, rel.length())) return;
            String base = trim(s.substring(0, cut - 1));
            if (base.length() == 0) return;
            String k = key(base);
            Object[] v = (Object[]) votes.get(k);
            if (v == null) {
                v = new Object[] { base, Integer.valueOf(0) };
                votes.put(k, v);
            }
            v[1] = Integer.valueOf(((Integer) v[1]).intValue() + 1);
        }

        /** The winning base, or null when no entry voted. */
        public String best() {
            String out = null;
            int most = 0;
            for (Iterator it = votes.values().iterator(); it.hasNext(); ) {
                Object[] v = (Object[]) it.next();
                int c = ((Integer) v[1]).intValue();
                if (c > most) {
                    most = c;
                    out = (String) v[0];
                }
            }
            return out;
        }
    }

    // ---- the question -----------------------------------------------------------------------

    /** Asked after an import whose lists point at a base other than the stored one. */
    public static void offer(Activity a, String learned) {
        if (learned == null || same(learned, get())) return;
        ask(a, learned);
    }

    static void ask(Activity a, String path) {
        if (a == null || a.isFinishing()) return;
        SpannableStringBuilder sb = new SpannableStringBuilder();
        sb.append(path);
        sb.setSpan(new StyleSpan(Typeface.BOLD), 0, sb.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        String why = a.getString(R.string.ipp_m3u_base_why);
        sb.append("\n\n").append(why).append(why.endsWith("。") ? "" : " ")
                .append(a.getString(R.string.ipp_m3u_base_tree)).append("\n\n");
        sb.append(a.getString(R.string.ipp_m3u_base_foot));
        String[] rows = { a.getString(R.string.ipp_backup_save),
                a.getString(R.string.ipp_m3u_base_edit), a.getString(R.string.ipp_m3u_base_skip) };
        new BackupDialog(a, a.getString(R.string.ipp_m3u_base_ask), rows, null, new Answer(a, path))
                .note(sb).show();
    }

    static final class Answer extends BackupDialog.Go {
        private final Activity a;
        private final String path;

        Answer(Activity a, String path) {
            this.a = a;
            this.path = path;
        }

        public void go(int row) {
            if (row == 0) put(path);
            else if (row == 1) edit(a, path);
        }
    }

    /**
     * Seeding takes TWO calls: {@code setEditText} fills the display only, while the keys work on
     * {@code valueLiveData}, which arrives through {@code onInit} inside the first {@code show()}.
     */
    static void edit(Activity a, String path) {
        Typed cb = new Typed(a, path);
        InputMethodDialog dlg = new InputMethodDialog(a, cb, R.style.Dialog_Input_Method);
        dlg.show();
        // typing a path out takes longer than the sleep time
        if (dlg.getWindow() != null) {
            dlg.getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        }
        cb.seed(path);
        dlg.setEditText(path);
    }

    /** On close the question comes back with what was typed; emptied, with the path it had. */
    static final class Typed implements InputMethodDialog.Callback {
        private final Activity a;
        private final String path;
        private MutableLiveData live;

        Typed(Activity a, String path) {
            this.a = a;
            this.path = path;
        }

        public void onInit(MutableLiveData valueLiveData) {
            live = valueLiveData;
        }

        void seed(String s) {
            if (live != null) live.setValue(s);
        }

        public void onBack() {
            Object v = live == null ? null : live.getValue();
            String s = v == null ? "" : trim(String.valueOf(v));
            ask(a, s.length() == 0 ? path : s);
        }
    }
}
