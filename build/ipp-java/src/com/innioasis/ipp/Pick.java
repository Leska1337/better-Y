package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageInfo;

import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.activity.SettingActivity;
import com.innioasis.y1.utils.LoadingDialog;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/**
 * The categories "Cache library" fills and "Clear cache" wipes, ticked in {@link PickDialog}.
 * Stock's clear empties every package's cache dir, ours included, so while an ipp category is
 * kept {@link #packages} takes our package out of that loop and the rest of our cache is emptied
 * by hand.
 */
public final class Pick {

    private Pick() { }

    /** List thumbnails and Now-Playing covers, memory and disk. */
    public static final int COVERS = 1;
    /** Everything read out of a tag. */
    public static final int TAGS = 2;
    /** Stock's clear of every package's cache. Clearing only. */
    public static final int SYSTEM = 4;
    /** Cover Flow's covers at slide size. Made from the covers, so they go with them. */
    public static final int FLOW = 8;
    /** What the three above hold for songs no longer in the library ({@link Stale}). Clearing only. */
    public static final int STALE = 16;

    public static final int CACHE_ALL = COVERS | TAGS | FLOW;

    public static int label(int cat) {
        if (cat == COVERS) return R.string.ipp_pick_covers;
        if (cat == TAGS) return R.string.ipp_pick_tags;
        if (cat == FLOW) return R.string.ipp_pick_flow;
        if (cat == STALE) return R.string.ipp_pick_stale;
        return R.string.ipp_pick_system;
    }

    /** Its weight is part of the others', so the total does not count it twice. */
    static boolean inTotal(int cat) {
        return cat != STALE;
    }

    /** From {@code SettingActivity.clickClearCache}; stock's body is {@code ippClearCache}. */
    public static void askClear(SettingActivity a) {
        if (a == null) return;
        int[] cats = new int[]{STALE, COVERS, FLOW, TAGS, SYSTEM};
        new PickDialog(a, a.getString(R.string.add_req_clear_cache),
                a.getString(R.string.ipp_pick_clear), cats, true, 0, new DoClear(a)).show();
    }

    static final class DoClear extends PickDialog.Go {
        private final SettingActivity a;

        DoClear(SettingActivity a) { this.a = a; }

        @Override
        public void go(int mask) {
            if (mask == 0) return;
            if ((mask & SYSTEM) != 0) {
                // Stock's path, with ours wiped from inside it: one dialog for both.
                a.ippClearCache(mask);
                return;
            }
            clearWithDialog(a, mask);
        }
    }

    /** Ours only: stock's "Clearing cache…" dialog, counting, over a background delete. */
    private static void clearWithDialog(SettingActivity a, int mask) {
        LoadingDialog d = null;
        try {
            d = new LoadingDialog(a, a.getString(R.string.add_req_clearing_cache), "",
                    R.style.Dialog_Common, new Noop());
            Loading.counter(d);
            d.show();
        } catch (Throwable t) {
            d = null;
        }
        begin(a, d);
        expect(0);
        clearAsync(mask);
    }

    // Stock counts its per-package callbacks with a bare clearFlag++ on binder threads: two at
    // once lose one, the count never reaches the total and its dialog never closes. So the
    // callbacks are counted here, and the dialog closes when the packages AND our half are done.

    private static final Object RUN = new Object();
    private static SettingActivity runHost;
    private static LoadingDialog runDialog;
    private static int runPackages, runRemoved, runSteps, runShown;
    private static boolean runOwnDone, runFinished;
    /** {@link #clearLocked}'s parts plus the rest of our cache dir. */
    private static final int STEPS = 5;
    /** The packages' share of the percent: they are done in a second or two. */
    private static final int PACKAGES_PCT = 20;

    /** From {@code ippClearCache} once its dialog is up, before anything is cleared. */
    public static void begin(SettingActivity a, LoadingDialog d) {
        synchronized (RUN) {
            runHost = a;
            runDialog = d;
            runPackages = -1;           // not known until stock has listed them
            runRemoved = 0;
            runSteps = 0;
            runShown = 0;
            runOwnDone = false;
            runFinished = false;
        }
        if (a != null) Loading.show(d, Loading.percent(a.getString(R.string.add_req_clearing_cache), 0));
    }

    /** The number of packages stock is about to clear. */
    public static void expect(int packages) {
        synchronized (RUN) {
            runPackages = packages;
        }
        advance();
    }

    /** One package's callback, from any binder thread. */
    public static void removedOne(SettingActivity a) {
        synchronized (RUN) {
            runRemoved++;
        }
        advance();
    }

    private static void step() {
        synchronized (RUN) {
            if (runHost == null) return;
            runSteps++;
        }
        advance();
    }

    private static void ownDone() {
        synchronized (RUN) {
            runOwnDone = true;
        }
        advance();
    }

    private static void advance() {
        SettingActivity a;
        LoadingDialog d;
        int p;
        boolean finish;
        synchronized (RUN) {
            a = runHost;
            d = runDialog;
            if (a == null || runFinished) return;
            boolean packagesDone = runPackages >= 0 && runRemoved >= runPackages;
            int pk = runPackages < 0 ? 0 : packagesDone ? PACKAGES_PCT : runRemoved * PACKAGES_PCT / runPackages;
            int own = runOwnDone ? 100 - PACKAGES_PCT : Math.min(runSteps, STEPS) * (100 - PACKAGES_PCT) / STEPS;
            p = pk + own;
            finish = packagesDone && runOwnDone;
            if (finish) {
                runFinished = true;
                runHost = null;
                runDialog = null;
            } else if (p <= runShown) {
                return;
            }
            runShown = p;
        }
        try {
            if (finish) a.runOnUiThread(new Done(a, d));
            else a.runOnUiThread(new Tick(d, Loading.percent(a.getString(R.string.add_req_clearing_cache), p)));
        } catch (Throwable t) {
        }
    }

    static final class Tick implements Runnable {
        private final LoadingDialog d;
        private final String text;

        Tick(LoadingDialog d, String text) {
            this.d = d;
            this.text = text;
        }

        public void run() {
            Loading.show(d, text);
        }
    }
    static final class Done implements Runnable {
        private final SettingActivity a;
        private final LoadingDialog dialog;

        Done(SettingActivity a, LoadingDialog dialog) {
            this.a = a;
            this.dialog = dialog;
        }

        public void run() {
            if (dialog != null) {
                try { dialog.dismiss(); } catch (Throwable t) { }
            }
            // the same word stock's own clear ends with
            try {
                android.widget.Toast.makeText(a, a.getString(R.string.add_req_clear_finish),
                        android.widget.Toast.LENGTH_SHORT).show();
            } catch (Throwable t) {
            }
            CacheSize.refresh(a);
        }
    }

    /** LoadingDialog's back-key callback. */
    static final class Noop implements Function0 {
        public Object invoke() {
            return Unit.INSTANCE;
        }
    }

    /**
     * From {@code SettingActivity.ippClearCache}, off the main thread so stock's progress dialog
     * keeps drawing. Also empties the rest of our cache dir when {@link #packages} took us out.
     */
    public static void clearAsync(int mask) {
        new Thread(new AsyncClear(mask)).start();
    }

    static final class AsyncClear implements Runnable {
        private final int mask;

        AsyncClear(int mask) { this.mask = mask; }

        public void run() {
            try {
                clear(mask);
                if ((mask & SYSTEM) != 0 && (mask & CACHE_ALL) != CACHE_ALL) {
                    ownCache(Y1Application.Companion.getAppContext());
                }
            } catch (Throwable t) {
            }
            ownDone();                      // always: the dialog waits for it
        }
    }

    /** Held by a clear and by "Cache library": a pass started during a clear would fill what it then drops. */
    public static final Object LOCK = new Object();

    /** Memory and files. {@link #SYSTEM} is ignored here. */
    public static void clear(int mask) {
        // first: "already cached" must not be answered while the clear is still running
        Albums.cacheCleared((mask & COVERS) != 0 ? (mask | FLOW) & CACHE_ALL : mask & CACHE_ALL);
        synchronized (LOCK) {
            clearLocked(mask);
        }
    }

    private static void clearLocked(int mask) {
        if ((mask & STALE) != 0) Stale.clear();
        step();
        if ((mask & COVERS) != 0) {
            CoverCache.clear();
            step();
            BigCover.clear();
            // the stamps vouch for the pictures, so they go with them
            Art.clearStamps();
            // and with the stamps gone nothing would notice Cover Flow's copies going stale
            mask |= FLOW;
        } else {
            step();
        }
        step();
        if ((mask & FLOW) != 0) FlowCache.clear();
        step();
        if ((mask & TAGS) != 0) {
            Schema.clearTags();
            AlbumInfo.clear();
            GenreInfo.clear();
        }
        step();
    }

    /**
     * The packages stock's clear loop may empty. Filtered BEFORE the loop, not inside it: the
     * progress dialog closes after as many callbacks as the list has entries.
     */
    public static List packages(List all, int mask) {
        if (all == null) return new ArrayList();
        if ((mask & CACHE_ALL) == CACHE_ALL) return all;
        ArrayList out = new ArrayList();
        Context c = Y1Application.Companion.getAppContext();
        String self = c == null ? null : c.getPackageName();
        for (int i = 0; i < all.size(); i++) {
            Object o = all.get(i);
            if (!(o instanceof PackageInfo)) continue;
            PackageInfo p = (PackageInfo) o;
            if (self != null && self.equals(p.packageName)) continue;
            out.add(p);
        }
        // An empty list means no callback and a dialog that never closes.
        return out.isEmpty() ? all : out;
    }

    /** Everything in our cache dir that is not an ipp cache (Glide's theme covers and the like). */
    private static void ownCache(Context c) {
        try {
            File d = c == null ? null : c.getCacheDir();
            File[] fs = d == null ? null : d.listFiles();
            if (fs == null) return;
            for (int i = 0; i < fs.length; i++) {
                if (fs[i].getName().startsWith("ipp_")) continue;
                delete(fs[i]);
            }
        } catch (Throwable t) {
        }
    }

    private static void delete(File f) {
        if (f == null) return;
        if (f.isDirectory()) {
            File[] kids = f.listFiles();
            if (kids != null) {
                for (int i = 0; i < kids.length; i++) delete(kids[i]);
            }
        }
        f.delete();
    }

    /** One category's weight on disk. Background thread only, as {@link CacheSize}. */
    public static long size(int cat) {
        try {
            Context c = Y1Application.Companion.getAppContext();
            File d = c == null ? null : c.getCacheDir();
            if (d == null) return 0L;
            if (cat == COVERS) {
                return CacheSize.dirSize(new File(d, "ipp_covers"))
                        + CacheSize.dirSize(new File(d, "ipp_big"))
                        + CacheSize.dirSize(new File(d, "ipp_bigcover.txt"))
                        + CacheSize.dirSize(new File(d, "ipp_covers_none.txt"))
                        + CacheSize.dirSize(new File(d, "ipp_art.txt"));
            }
            if (cat == FLOW) return CacheSize.dirSize(new File(d, "ipp_flow"));
            if (cat == STALE) return Stale.size();
            // the tags themselves are columns of the database, not files of the cache directory
            if (cat == TAGS) return tagFiles(d) + Schema.tagBytes();
            long n = CacheSize.total(c) - size(COVERS) - tagFiles(d) - size(FLOW);
            return n < 0L ? 0L : n;
        } catch (Throwable t) {
            return 0L;
        }
    }

    private static long tagFiles(File d) {
        return CacheSize.dirSize(new File(d, "ipp_genres.txt"));
    }

    public static String sizeText(long n) {
        return CacheSize.format(n);
    }

    /** [Tools] → "Cache library". */
    public static void askCache(Activity a, PickDialog.Go go) {
        if (a == null) return;
        int[] cats = new int[]{COVERS, FLOW, TAGS};
        new PickDialog(a, a.getString(R.string.ipp_cache),
                a.getString(R.string.ipp_pick_cache), cats, false, go).show();
    }
}
