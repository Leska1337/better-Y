package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;

import com.innioasis.music.ArtistsActivity;
import com.innioasis.music.objects.Constant;
import com.innioasis.y1.R;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.database.Y1Repository;
import com.innioasis.y1.utils.SharedPreferencesUtils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Music → Album Artists: {@code ArtistsActivity} started with {@link #EXTRA}, every album filed
 * under {@link #of}. Names group trimmed and case-blind; the spelling shown is the commonest. Rows
 * carry {@link #MARK}, which rides every path an artist name already rides and is decoded only by
 * {@link #songs} and where text is drawn. An album opened from here is shown whole — the artist
 * scope would hide exactly the guest tracks an album artist gathers.
 */
public final class AlbumArtists {

    private AlbumArtists() { }

    public static final String KEY = "album_artists";

    public static final String EXTRA = "ipp_album_artists";

    // EOT: SOH..ETX already mark album keys and the two "Show all songs" rows (Albums).
    private static final char MARK = (char) 4;

    public static boolean is(String s) {
        return s != null && s.length() > 0 && s.charAt(0) == MARK;
    }

    /** Marker stripped; anything else returned as it is. */
    public static String name(String s) {
        return is(s) ? s.substring(1) : s;
    }

    private static String norm(String s) {
        return s == null ? "" : s.trim().toLowerCase(Locale.ROOT);
    }

    /**
     * ALBUM ARTIST as written, else the track's first artist (no toggle applies), else
     * {@code Constant.UNKNOWN}. For an album the two come from all its songs ({@link AlbumTags}).
     */
    public static String of(String aa, String tagArtist) {
        if (aa != null && aa.trim().length() > 0) return aa.trim();
        return first(tagArtist);
    }

    static String first(String tag) {
        if (tag == null) return Constant.UNKNOWN;
        String t = tag.trim();
        if (t.length() == 0 || Constant.UNKNOWN.equals(t)) return Constant.UNKNOWN;
        List ps = Artists.parts(t);
        String p = ps.isEmpty() ? t : ((String) ps.get(0)).trim();
        return p.length() == 0 ? Constant.UNKNOWN : p;
    }

    /** MusicMainActivity.initView, before setMainList: the row goes under Artists. */
    public static void musicMenu(List list, Context c) {
        try {
            if (list == null || c == null || !Prefs.on(c, KEY)) return;
            String label = c.getString(R.string.ipp_album_artists);
            if (list.contains(label)) return;
            int at = list.indexOf(c.getString(R.string.music_artists));
            list.add(at < 0 ? list.size() : at + 1, label);
        } catch (Throwable t) {
        }
    }

    /** The Album Artists row of the Music menu (MainMenu.musicPick). */
    static void open(Activity a) {
        Intent i = new Intent(a, ArtistsActivity.class);
        i.putExtra(EXTRA, true);
        a.startActivity(i);
    }

    private static boolean screen(Activity a) {
        try {
            return a != null && a.getIntent() != null && a.getIntent().getBooleanExtra(EXTRA, false);
        } catch (Throwable t) {
            return false;
        }
    }

    public static String title(Activity a, String stock) {
        return screen(a) ? a.getString(R.string.ipp_album_artists) : stock;
    }

    /** ArtistsActivity's two list builds (first fill on IO, sort change), in stock's artist sort. */
    public static List screenList(List stock, Activity a) {
        if (!screen(a)) return stock;
        try {
            boolean desc = SharedPreferencesUtils.INSTANCE.getSortArtist()
                    == Y1Repository.SortArtistsType.Z_A.getType();
            return rows(desc);
        } catch (Throwable t) {
            return new ArrayList();
        }
    }

    private static List memoAll;           // Albums.allSongs() the model was built from
    private static int memoGen = -1;       // AlbumArtist.gen() it was built with
    private static HashMap keyToNorm;      // album key -> group
    private static HashMap albumSongs;     // album key -> its songs, of memoAll. Read only
    private static LinkedHashMap names;    // group -> the spelling shown

    /**
     * An album none of whose songs was read has its representative read first, one file each —
     * seconds on a first entry, so never on the main thread then. Rebuilt only when the library or
     * an album artist changes.
     */
    private static synchronized boolean build() {
        List all = Albums.allSongs();
        if (all == null) return false;
        if (all == memoAll && memoGen == AlbumArtist.gen() && keyToNorm != null) return true;

        HashMap index = AlbumTags.index(all);
        readMissing(index);

        HashMap k2n = new HashMap();
        HashMap counts = new HashMap();    // group -> (spelling -> albums)
        Iterator it = index.keySet().iterator();
        while (it.hasNext()) {
            String key = (String) it.next();
            AlbumTags.Sum sum = AlbumTags.of(key);
            if (sum == null) continue;
            String v = sum.line();
            String n = Constant.UNKNOWN.equals(v) ? Constant.UNKNOWN : norm(v);
            k2n.put(key, n);
            HashMap c = (HashMap) counts.get(n);
            if (c == null) { c = new HashMap(); counts.put(n, c); }
            Integer was = (Integer) c.get(v);
            c.put(v, Integer.valueOf(was == null ? 1 : was.intValue() + 1));
        }
        LinkedHashMap shown = new LinkedHashMap();
        it = counts.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry e = (Map.Entry) it.next();
            String best = null;
            int most = 0;
            Iterator jt = ((HashMap) e.getValue()).entrySet().iterator();
            while (jt.hasNext()) {
                Map.Entry f = (Map.Entry) jt.next();
                String sp = (String) f.getKey();
                int n = ((Integer) f.getValue()).intValue();
                if (n > most || (n == most && sp.compareTo(best) < 0)) { best = sp; most = n; }
            }
            shown.put(e.getKey(), best);
        }
        albumSongs = index;
        keyToNorm = k2n;
        names = shown;
        memoAll = all;
        memoGen = AlbumArtist.gen();
        return true;
    }

    /** On a few threads; committed here, on one. */
    private static void readMissing(HashMap index) {
        ArrayList paths = new ArrayList();
        Iterator it = index.keySet().iterator();
        while (it.hasNext()) {
            AlbumTags.Sum sum = AlbumTags.of((String) it.next());
            if (sum == null || sum.anyRead() || sum.rep == null) continue;
            paths.add(sum.rep);
        }
        if (paths.isEmpty()) return;
        Meta.Info[] out = new Meta.Info[paths.size()];
        Reader job = new Reader(paths, out);
        int n = Math.min(3, Math.max(1, paths.size() / 8));
        Thread[] ts = new Thread[n - 1];
        for (int i = 0; i < ts.length; i++) {
            ts[i] = new Thread(job, "ipp-albumartist");
            ts[i].start();
        }
        job.run();
        for (int i = 0; i < ts.length; i++) {
            try { ts[i].join(); } catch (InterruptedException ie) { /* take what was read */ }
        }
        for (int i = 0; i < out.length; i++) {
            Schema.stage((String) paths.get(i), out[i]);
        }
        Schema.write();
    }

    /** Workers share one cursor; each slot is written by the one thread that took it. */
    private static final class Reader implements Runnable {
        private final List paths;
        private final Meta.Info[] out;
        private int next;

        Reader(List paths, Meta.Info[] out) {
            this.paths = paths;
            this.out = out;
        }

        private synchronized int take() {
            return next < paths.size() ? next++ : -1;
        }

        public void run() {
            int i;
            while ((i = take()) >= 0) {
                try {
                    out[i] = Meta.read((String) paths.get(i), false);
                } catch (Throwable t) {
                }
            }
        }
    }

    /** The unknown artist last in either direction. */
    public static List rows(boolean desc) {
        ArrayList out = new ArrayList();
        if (!build()) return out;
        ArrayList groups = new ArrayList(names.keySet());
        boolean unknown = groups.remove(Constant.UNKNOWN);
        Collections.sort(groups, new NormCmp(desc));
        for (int i = 0; i < groups.size(); i++) out.add(MARK + (String) names.get(groups.get(i)));
        if (unknown) out.add(MARK + Constant.UNKNOWN);
        return out;
    }

    private static final class NormCmp implements Comparator {
        private final boolean rev;
        NormCmp(boolean rev) { this.rev = rev; }
        public int compare(Object a, Object b) {
            int c = ((String) a).compareTo((String) b);
            return rev ? -c : c;
        }
    }

    /** Every song filed under this row. Never null. */
    public static List songs(String row, Y1Repository.SongSortType type) {
        ArrayList out = new ArrayList();
        try {
            if (!build()) return out;
            String n = name(row);
            String target = Constant.UNKNOWN.equals(n) ? Constant.UNKNOWN : norm(n);
            HashMap k2n;
            HashMap ix;
            synchronized (AlbumArtists.class) {
                k2n = keyToNorm;
                ix = albumSongs;
            }
            Iterator it = k2n.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry e = (Map.Entry) it.next();
                if (!target.equals(e.getValue())) continue;
                Object l = ix.get(e.getKey());
                if (l != null) out.addAll((List) l);
            }
            Y1Repository.SongSortType t = type == Y1Repository.SongSortType.Track_Number
                    ? Y1Repository.SongSortType.Album : type;
            Collections.sort(out, new Artists.SongCmp(t));
        } catch (Throwable t) {
        }
        return out;
    }
}
