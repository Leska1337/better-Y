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

    public static final int CACHE_ALL = COVERS | TAGS;

    public static int label(int cat) {
        if (cat == COVERS) return R.string.ipp_pick_covers;
        if (cat == TAGS) return R.string.ipp_pick_tags;
        return R.string.ipp_pick_system;
    }

    /** From {@code SettingActivity.clickClearCache}; stock's body is {@code ippClearCache}. */
    public static void askClear(SettingActivity a) {
        if (a == null) return;
        int[] cats = new int[]{COVERS, TAGS, SYSTEM};
        new PickDialog(a, a.getString(R.string.add_req_clear_cache),
                a.getString(R.string.ipp_pick_clear), cats, true, new DoClear(a)).show();
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

    /** Ours only: stock's "Clearing cache…" dialog over a background delete. */
    private static void clearWithDialog(SettingActivity a, int mask) {
        LoadingDialog d = null;
        try {
            d = new LoadingDialog(a, a.getString(R.string.add_req_clearing_cache), "",
                    R.style.Dialog_Common, new Noop());
            d.show();
        } catch (Throwable t) {
            d = null;
        }
        new Thread(new ClearTask(a, mask, d)).start();
    }

    static final class ClearTask implements Runnable {
        private final SettingActivity a;
        private final int mask;
        private final LoadingDialog dialog;

        ClearTask(SettingActivity a, int mask, LoadingDialog dialog) {
            this.a = a;
            this.mask = mask;
            this.dialog = dialog;
        }

        public void run() {
            try {
                clear(mask);
            } catch (Throwable t) {
            }
            try {
                a.runOnUiThread(new Done(a, dialog));
            } catch (Throwable t) {
            }
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
        }
    }

    /** Memory and files. {@link #SYSTEM} is ignored here. */
    public static void clear(int mask) {
        if ((mask & COVERS) != 0) {
            CoverCache.clear();
            BigCover.clear();
        }
        if ((mask & TAGS) != 0) {
            // Cover-file stamps are text bookkeeping, so they belong to this category.
            Art.clearStamps();
            YearCache.clear();
            MetaCache.clear();
            TrackCache.clear();
            AlbumInfo.clear();
            AlbumArtist.clear();
            DiscCache.clear();
            GenreInfo.clear();
        }
        // "Already cached" is answered from a signature stored outside the caches.
        Albums.cacheCleared(mask & CACHE_ALL);
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
                        + CacheSize.dirSize(new File(d, "ipp_bigcover.txt"));
            }
            if (cat == TAGS) {
                return CacheSize.dirSize(new File(d, "ipp_art.txt"))
                        + CacheSize.dirSize(new File(d, "ipp_years.txt"))
                        + CacheSize.dirSize(new File(d, "ipp_tracks.txt"))
                        + CacheSize.dirSize(new File(d, "ipp_albums.txt"))
                        + CacheSize.dirSize(new File(d, "ipp_albumartist.txt"))
                        + CacheSize.dirSize(new File(d, "ipp_discs.txt"))
                        + CacheSize.dirSize(new File(d, "ipp_meta.txt"))
                        + CacheSize.dirSize(new File(d, "ipp_genres.txt"));
            }
            long n = CacheSize.total(c) - size(COVERS) - size(TAGS);
            return n < 0L ? 0L : n;
        } catch (Throwable t) {
            return 0L;
        }
    }

    public static String sizeText(long n) {
        return CacheSize.format(n);
    }

    /** [Tools] → "Cache library". */
    public static void askCache(Activity a, PickDialog.Go go) {
        if (a == null) return;
        int[] cats = new int[]{COVERS, TAGS};
        new PickDialog(a, a.getString(R.string.ipp_cache),
                a.getString(R.string.ipp_pick_cache), cats, false, go).show();
    }
}
