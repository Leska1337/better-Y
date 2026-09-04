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
 * What "Cache library" fills and "Clear cache" wipes, as a handful of categories the user ticks in
 * {@link PickDialog}.
 *
 * Why categories at all
 * All-or-nothing buttons are not enough. The expensive half of each is the covers: filling them is
 * one file open per song, and throwing them away means every list and every player screen reads its
 * artwork again. Re-reading the track numbers after a tag edit, or dropping only the pictures, are
 * both perfectly ordinary things to want.
 *
 * The system category is not ours
 * Stock's "Clear cache" asks the package manager to empty the cache directory of every installed
 * package, and ours is one of them: that single call is what deletes {@code ipp_covers/},
 * {@code ipp_big/} and the {@code ipp_*.txt} files, whatever the user ticked. So when the ipp
 * categories are not all selected, {@link #packages} drops our own package from that loop and
 * empties the rest of our cache directory ({@code Glide}'s theme covers and anything else that is
 * not ours) by hand — otherwise unticking "Covers" would still lose the covers.
 */
public final class Pick {

    private Pick() { }

    /** The 50px list thumbnails and the 300px Now-Playing covers, memory and disk. */
    public static final int COVERS = 1;
    /** Everything read out of a tag: years, album artists, track and disc numbers, genres. */
    public static final int TAGS = 2;
    /** Stock's own clear: the cache directory of every installed package. Clearing only. */
    public static final int SYSTEM = 4;

    /** What a "Cache library" pass can fill. */
    public static final int CACHE_ALL = COVERS | TAGS;

    public static int label(int cat) {
        if (cat == COVERS) return R.string.ipp_pick_covers;
        if (cat == TAGS) return R.string.ipp_pick_tags;
        return R.string.ipp_pick_system;
    }

    // ---------------------------------------------------------------- "Clear cache"

    /**
     * Open the picker for Settings → "Clear cache". Called from stock
     * {@code SettingActivity.clickClearCache}, whose own body has moved to {@code ippClearCache}.
     */
    public static void askClear(SettingActivity a) {
        if (a == null) return;
        int[] cats = new int[]{COVERS, TAGS, SYSTEM};
        new PickDialog(a, a.getString(R.string.add_req_clear_cache),
                a.getString(R.string.ipp_pick_clear), cats, true, new DoClear(a)).show();
    }

    /** Named (d8 here crashes on anonymous classes). */
    static final class DoClear extends PickDialog.Go {
        private final SettingActivity a;

        DoClear(SettingActivity a) { this.a = a; }

        @Override
        public void go(int mask) {
            if (mask == 0) return;
            if ((mask & SYSTEM) != 0) {
                // The stock path: its LoadingDialog, its per-package observer, its dismissal. Our
                // own categories are wiped from inside it, so both halves report as one action.
                a.ippClearCache(mask);
                return;
            }
            clearWithDialog(a, mask);
        }
    }

    /** ipp categories only: stock's "Clearing cache…" dialog over a background delete. */
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

    /** Named (d8 here crashes on anonymous classes). */
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
                // a half-deleted cache is still a cache
            }
            try {
                a.runOnUiThread(new Done(a, dialog));
            } catch (Throwable t) {
                // the screen is gone; the caches are cleared either way
            }
        }
    }

    /** Back on the main thread: close the dialog and re-measure the number under the row. */
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

    /** LoadingDialog's back-key callback; nothing to do. */
    static final class Noop implements Function0 {
        public Object invoke() {
            return Unit.INSTANCE;
        }
    }

    /**
     * The same, off the main thread — the entry point for {@code SettingActivity.ippClearCache}.
     *
     * Deleting a few hundred cover JPEGs is not instant, and there the system half is under way at
     * the same time behind stock's own progress dialog: doing ours inline would freeze the frame
     * that dialog is drawn in. When the system category was picked as well as an ipp one, the
     * rest of our own cache directory (Glide's theme covers) is emptied here too, because
     * {@link #packages} has just taken us out of the package manager's loop to protect the ipp
     * caches the user kept.
     */
    public static void clearAsync(int mask) {
        new Thread(new AsyncClear(mask)).start();
    }

    /** Named (d8 here crashes on anonymous classes). */
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
                // a half-deleted cache is still a cache
            }
        }
    }

    /**
     * Wipe the ipp caches of these categories — memory and the files under {@code getCacheDir()}.
     * The {@link #SYSTEM} bit is not ours and is ignored here.
     */
    public static void clear(int mask) {
        if ((mask & COVERS) != 0) {
            CoverCache.clear();
            BigCover.clear();
        }
        if ((mask & TAGS) != 0) {
            // The cover-file stamps are bookkeeping about files, not pictures — they live with the
            // other text caches, so clearing the covers alone does not report a category that is
            // still a few KB (which is exactly what a cleared cache plus "Update library" showed).
            Art.clearStamps();
            YearCache.clear();
            TrackCache.clear();
            AlbumInfo.clear();
            AlbumArtist.clear();
            DiscCache.clear();
            GenreInfo.clear();
        }
        // "Cache library" answers "already cached" from a signature stored outside the caches, so
        // the categories that were just wiped have to be struck off it explicitly.
        Albums.cacheCleared(mask & CACHE_ALL);
    }

    /**
     * The packages stock's clear loop may empty, given what the user ticked — and the point where
     * our own cache directory is dealt with.
     *
     * Called from {@code SettingActivity.ippClearCache} between {@code getInstalledPackages} and
     * the loop, because {@code clearTotal} (which decides when the progress dialog closes) is the
     * size of the list the loop runs over: filtering inside the loop instead would leave the dialog
     * waiting for callbacks that never come. What is left of our own cache directory is emptied by
     * {@link #clearAsync}, off this thread.
     */
    public static List packages(List all, int mask) {
        if (all == null) return new ArrayList();
        if ((mask & CACHE_ALL) == CACHE_ALL) return all;   // nothing of ours to protect
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
        // An empty list would mean no observer callback and a progress dialog that never closes.
        return out.isEmpty() ? all : out;
    }

    /**
     * Empty our own cache directory of everything that is not an ipp cache — Glide's theme
     * covers and whatever else the app keeps there. Used when the package manager is not allowed to
     * do it for us because the user kept one of the ipp categories.
     */
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
            // nothing to do
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

    // ---------------------------------------------------------------- the weight column

    /**
     * What one category weighs on disk, for the dialog's size column. Measured on a background
     * thread ({@link PickDialog}), never on the way to drawing a row — the same reason
     * {@link CacheSize} exists.
     */
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
                        + CacheSize.dirSize(new File(d, "ipp_genres.txt"));
            }
            // Everything else the "Clear cache" row counts: the whole device's caches minus ours.
            long n = CacheSize.total(c) - size(COVERS) - size(TAGS);
            return n < 0L ? 0L : n;
        } catch (Throwable t) {
            return 0L;
        }
    }

    /** Stock's format, so the dialog's numbers and the one under the row agree. */
    public static String sizeText(long n) {
        return CacheSize.format(n);
    }

    // ---------------------------------------------------------------- "Cache library"

    /** Open the picker for [Tools] → "Cache library". The callback is the caller's own. */
    public static void askCache(Activity a, PickDialog.Go go) {
        if (a == null) return;
        int[] cats = new int[]{COVERS, TAGS};
        new PickDialog(a, a.getString(R.string.ipp_cache),
                a.getString(R.string.ipp_pick_cache), cats, false, go).show();
    }
}
