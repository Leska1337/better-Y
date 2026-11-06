package com.innioasis.ipp;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ScrollView;
import android.widget.TextView;

import com.innioasis.fm.configs.KeyMap;
import com.innioasis.y1.R;
import com.innioasis.y1.base.BasePlayerActivity;

import java.util.ArrayList;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import me.wcy.lrcview.LrcView;

/**
 * What the player's Lyrics window shows. The {@code .lrc} beside the track first, the text
 * embedded in the file only where there is none — and that one read only while the window is
 * open, in the background. Timed text goes to {@code LrcView} rewritten into the one stamp form
 * its parser accepts; untimed text is shown whole, scrolled by the wheel.
 */
public final class Lrc {

    private Lrc() { }

    /** The song {@code refreshLyric} was last given; main thread only. */
    private static String audio;
    /** The {@code .lrc} path stock last found missing or empty. */
    private static String missing;
    /** The song whose tags were read for it, so reopening the window does not read them again. */
    private static String tried;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private static final Pattern STAMP = Pattern.compile("\\[(\\d+):(\\d{1,2})(?:[.:](\\d{1,3}))?\\]");
    private static final Pattern META = Pattern.compile("\\[([A-Za-z#]+):([^\\]]*)\\]");
    private static final Pattern WORD = Pattern.compile("<\\d+:\\d{1,2}(?:[.:]\\d{1,3})?>");
    /** Line zero: lit until the first real line is due, which LrcView would light from 0:00. */
    private static final String LEAD = "…";

    /** From {@code BasePlayerActivity.refreshLyric}, before stock queues its read. */
    public static void track(String path) {
        audio = path;
    }

    /**
     * In place of both {@code LrcView.loadLrc} calls in stock's {@code .lrc} read; {@code text} is
     * "" when the file is missing. Stock sets the view's tag to {@code lrcPath} right after.
     */
    public static void loaded(BasePlayerActivity a, String text, String lrcPath) {
        try {
            tried = null;
            boolean none = text == null || text.trim().length() == 0;
            missing = none ? lrcPath : null;
            show(a, none ? "" : text);
            if (none) embedded(a);
        } catch (Throwable t) {
        }
    }

    /** From {@code BasePlayerActivity.ippToggleLyric}: the window has just opened or closed. */
    public static void window(BasePlayerActivity a) {
        try {
            embedded(a);
        } catch (Throwable t) {
        }
    }

    /** The wheel scrolls an untimed text; the volume is the wheel's again once it is closed. */
    public static boolean wheel(BasePlayerActivity a, int key) {
        try {
            if (!a.ippLyricOpen()) return false;
            ScrollView s = plain((Activity) a, false);
            if (s == null || s.getVisibility() != View.VISIBLE) return false;
            TextView tv = (TextView) s.getChildAt(0);
            int step = tv.getLineHeight();
            if (key == KeyMap.INSTANCE.getKEY_DOWN()) s.scrollBy(0, step);
            else if (key == KeyMap.INSTANCE.getKEY_UP()) s.scrollBy(0, -step);
            else return false;
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    private static void embedded(BasePlayerActivity a) {
        String path = audio;
        if (path == null || missing == null || !a.ippLyricOpen()) return;
        if (!missing.equals(lrcOf(path)) || path.equals(tried)) return;
        tried = path;
        new Thread(new Read(a, path), "ipp-lyrics").start();
    }

    private static final class Read implements Runnable {
        private final BasePlayerActivity a;
        private final String path;

        Read(BasePlayerActivity a, String path) {
            this.a = a;
            this.path = path;
        }

        public void run() {
            String text = Meta.lyrics(path);
            if (text != null) MAIN.post(new Got(a, path, text));
        }
    }

    /** Dropped when the song changed meanwhile, or a {@code .lrc} turned up for it. */
    private static final class Got implements Runnable {
        private final BasePlayerActivity a;
        private final String path;
        private final String text;

        Got(BasePlayerActivity a, String path, String text) {
            this.a = a;
            this.path = path;
            this.text = text;
        }

        public void run() {
            try {
                if (!path.equals(audio) || missing == null || !missing.equals(lrcOf(path))) return;
                if (((Activity) a).isFinishing()) return;
                show(a, text);
            } catch (Throwable t) {
            }
        }
    }

    private static void show(BasePlayerActivity a, String text) {
        Activity act = (Activity) a;
        View v = act.findViewById(R.id.lyric_lv);
        if (!(v instanceof LrcView)) return;
        LrcView lv = (LrcView) v;
        String timed = text.length() == 0 ? null : normalize(text);
        if (text.length() == 0 || timed != null) {
            ScrollView s = plain(act, false);
            if (s != null) s.setVisibility(View.GONE);
            lv.setVisibility(View.VISIBLE);
            lv.loadLrc(timed == null ? "" : timed);
            return;
        }
        ScrollView s = plain(act, true);
        if (s == null) return;
        TextView tv = (TextView) s.getChildAt(0);
        tv.setTextColor(Tint.lyricsColor(act));
        tv.setText(untimed(text));
        s.scrollTo(0, 0);
        lv.loadLrc("");
        lv.setVisibility(View.INVISIBLE);
        s.setVisibility(View.VISIBLE);
    }

    /** A sibling of {@code LrcView} inside its fading frame, made on first need. */
    private static ScrollView plain(Activity a, boolean make) {
        View v = a.findViewById(R.id.lyric_lv);
        if (v == null || !(v.getParent() instanceof ViewGroup)) return null;
        ViewGroup g = (ViewGroup) v.getParent();
        Object have = g.getTag(R.id.lyric_lv);
        if (have instanceof ScrollView) return (ScrollView) have;
        if (!make) return null;
        float dp = a.getResources().getDisplayMetrics().density;
        ScrollView s = new ScrollView(a);
        s.setVerticalScrollBarEnabled(false);
        s.setClipToPadding(false);
        int edge = (int) (40 * dp);
        s.setPadding(0, edge, 0, edge);
        TextView tv = new TextView(a);
        tv.setGravity(Gravity.CENTER_HORIZONTAL);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 27);
        int side = (int) (20 * dp);
        tv.setPadding(side, 0, side, 0);
        s.addView(tv, new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        s.setVisibility(View.GONE);
        g.addView(s, new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));
        g.setTag(R.id.lyric_lv, s);
        return s;
    }

    /** Stock's own rule: the extension cut at the last dot. */
    private static String lrcOf(String path) {
        int dot = path.lastIndexOf('.');
        return (dot < 0 ? path : path.substring(0, dot)) + ".lrc";
    }

    /** Some line opens with a time stamp: the text is meant to scroll with the song. */
    static boolean timed(String text) {
        String[] lines = text.split("\\r?\\n");
        for (int i = 0; i < lines.length; i++) {
            Matcher m = STAMP.matcher(lines[i].trim());
            if (m.lookingAt()) return true;
        }
        return false;
    }

    /** {@code [mm:ss.xxx]}: the form {@code LrcView} parses, three digits read as milliseconds. */
    static String stamp(long ms) {
        if (ms < 0) ms = 0;
        long min = ms / 60000;
        if (min > 99) min = 99;
        return String.format(Locale.ROOT, "[%02d:%02d.%03d]", min, (ms / 1000) % 60, ms % 1000);
    }

    /**
     * Any LRC as the one form {@code LrcView} reads: {@code [m:ss]}, {@code [mm:ss:xx]} and one
     * fraction digit restamped, {@code [offset:]} applied, word stamps {@code <..>} and the other
     * header tags dropped. Null when no line is timed.
     */
    static String normalize(String text) {
        if (text.startsWith("﻿")) text = text.substring(1);
        String[] lines = text.split("\\r?\\n|\\r");
        long offset = 0;
        for (int i = 0; i < lines.length; i++) {
            Matcher m = META.matcher(lines[i].trim());
            if (m.matches() && m.group(1).equalsIgnoreCase("offset")) {
                try {
                    offset = Long.parseLong(m.group(2).trim().replace("+", ""));
                } catch (Throwable t) {
                }
            }
        }
        StringBuilder out = new StringBuilder();
        ArrayList times = new ArrayList();
        boolean any = false;
        long first = Long.MAX_VALUE;
        for (int i = 0; i < lines.length; i++) {
            String s = lines[i].trim();
            times.clear();
            int p = 0;
            while (p < s.length() && s.charAt(p) == '[') {
                Matcher m = STAMP.matcher(s);
                m.region(p, s.length());
                if (!m.lookingAt()) break;
                times.add(Long.valueOf(ms(m) - offset));
                p = m.end();
            }
            if (times.isEmpty()) continue;
            String rest = WORD.matcher(s.substring(p)).replaceAll("").trim();
            if (rest.length() == 0) continue;
            for (int k = 0; k < times.size(); k++) {
                long t = ((Long) times.get(k)).longValue();
                out.append(stamp(t)).append(rest).append('\n');
                if (t < first) first = t;
                any = true;
            }
        }
        if (!any) return null;
        if (first > 0) out.insert(0, stamp(0) + LEAD + "\n");
        return out.toString();
    }

    private static long ms(Matcher m) {
        long t = Long.parseLong(m.group(1)) * 60000 + Long.parseLong(m.group(2)) * 1000;
        String f = m.group(3);
        if (f != null) {
            long v = Long.parseLong(f);
            t += f.length() == 1 ? v * 100 : f.length() == 2 ? v * 10 : v;
        }
        return t;
    }

    /** An untimed text minus any header tags; its line breaks as written. */
    private static String untimed(String text) {
        if (text.startsWith("﻿")) text = text.substring(1);
        String[] lines = text.split("\\r?\\n|\\r");
        StringBuilder out = new StringBuilder();
        for (int i = 0; i < lines.length; i++) {
            String s = lines[i].trim();
            if (META.matcher(s).matches()) continue;
            if (out.length() > 0) out.append('\n');
            out.append(s);
        }
        return out.toString().trim();
    }
}
