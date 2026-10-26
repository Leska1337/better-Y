package com.innioasis.ipp;

import android.app.Activity;
import android.content.Intent;
import android.view.View;

import androidx.recyclerview.widget.RecyclerView;
import android.widget.ImageView;
import android.widget.TextView;

import com.innioasis.music.FilesActivity;
import com.innioasis.music.MusicPlayerActivity;
import com.innioasis.music.adapter.MyBaseAdapter;
import com.innioasis.music.adapter.SubmenuAdapter;
import com.innioasis.music.objects.Constant;
import com.innioasis.music.util.SubMenuDialog;
import com.innioasis.y1.activity.video.VideoListActivity;
import com.innioasis.y1.base.BaseBindingAdapter;
import com.innioasis.y1.database.Y1Repository;
import com.innioasis.y1.database.video.VideoInfo;
import com.innioasis.y1.utils.SharedPreferencesUtils;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.base.BaseActivity;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.service.PlayerService;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * Folders' button rows, its icons and its sort. "Show all songs" opens {@code FilesActivity} again
 * on the same folder with {@link #EXTRA}, and {@link #build} fills it with every song below — so
 * the flat list gets everything the folder view does. It needs its own title ({@link #title}): the
 * queue tells lists apart by class plus title. A button is a sentinel {@code File} at index 0.
 */
public final class Folders {

    private Folders() { }

    /** Intent flag: this FilesActivity shows everything below its folder, not its children. */
    public static final String EXTRA = "ipp_all";

    /** Starts with a raw, invisible U+0001 that no file name can have. Do not "tidy" the literal. */
    private static final String MARK = "ipp_show_all";

    /** Shuffle: like stock's row, a shuffled copy of the list, not the shuffle MODE. */
    private static final String SHUF = MARK + "_shuffle";   // inherits MARK's U+0001 prefix

    private static File mark(File dir) { return new File(dir, MARK); }
    private static File shufMark(File dir) { return new File(dir, SHUF); }

    public static boolean isMark(File f) {
        return f != null && MARK.equals(f.getName());
    }

    public static boolean isShuffle(File f) {
        return f != null && SHUF.equals(f.getName());
    }

    private static boolean isAnyMark(File f) { return isMark(f) || isShuffle(f); }

    /** {@code MyBaseAdapter.addItemToSelectedIndex}: a marker row is a button, never ticked. */
    public static boolean noSelect(Object adapter, int index) {
        return markAt(adapter, index);
    }

    /** {@code MyBaseAdapter.allSelect}: take the marker rows back out of the selection. */
    public static void dropMarks(Object adapter) {
        if (!(adapter instanceof MyBaseAdapter)) return;
        try {
            List sel = ((MyBaseAdapter) adapter).getSelectedIndexList();
            if (sel == null) return;
            for (int i = sel.size() - 1; i >= 0; i--) {
                Object o = sel.get(i);
                if (o instanceof Integer && markAt(adapter, ((Integer) o).intValue())) sel.remove(i);
            }
        } catch (Throwable t) {
        }
    }

    /** {@code FilesActivity.longConfirm}: no long-press menu while the cursor is on a marker row. */
    public static boolean onMark(Object adapter) {
        if (!(adapter instanceof MyBaseAdapter)) return false;
        try {
            return markAt(adapter, ((MyBaseAdapter) adapter).getPosition());
        } catch (Throwable t) {
            return false;
        }
    }

    /**
     * In multi-select the cursor skips a marker row — always downwards, the markers being first.
     * From the end of both wheel handlers of {@code FilesActivity}.
     */
    public static void skipMark(Object adapter, boolean multi) {
        if (!multi || !(adapter instanceof MyBaseAdapter)) return;
        try {
            MyBaseAdapter ad = (MyBaseAdapter) adapter;
            int pos = ad.getPosition();
            if (!markAt(ad, pos)) return;
            int n = ad.getCount();
            int to = pos + 1;
            while (to < n && markAt(ad, to)) to++;
            if (to < n) ad.setPosition(to);
        } catch (Throwable t) {
        }
    }

    private static boolean markAt(Object adapter, int index) {
        if (!(adapter instanceof MyBaseAdapter)) return false;
        try {
            MyBaseAdapter ad = (MyBaseAdapter) adapter;
            if (index < 0 || index >= ad.getCount()) return false;
            Object o = ad.getItem(index);
            return (o instanceof File) && isAnyMark((File) o);
        } catch (Throwable t) {
            return false;
        }
    }

    private static boolean allMode(Activity a) {
        try {
            return a != null && a.getIntent() != null && a.getIntent().getBooleanExtra(EXTRA, false);
        } catch (Throwable t) {
            return false;
        }
    }

    /**
     * End of {@code FilesActivity.refresh}'s coroutine, off the UI thread. In "all" mode: the flat
     * song list, which becomes {@code nowSongFileList}; otherwise null, with a button row inserted.
     *
     * @param fileList  the rows about to be shown (folders, then the folder's own songs)
     * @param ownSongs  the folder's own songs, the second half of that list
     */
    public static List build(Activity a, File dir, List fileList, List ownSongs) {
        try {
            if (dir == null || fileList == null) return null;
            if (allMode(a)) {
                List songs = songsUnder(dir);
                fileList.clear();
                if (!songs.isEmpty()) fileList.add(shufMark(dir));
                fileList.addAll(songs);
                // One row short of fileList: harmless, playback matches by PATH, never by index.
                return new ArrayList(songs);   // a copy: refresh() clears fileList in place
            }
            File row = folderRow(a, dir, fileList, ownSongs);
            if (row != null) fileList.add(0, row);
        } catch (Throwable t) {
        }
        return null;
    }

    /**
     * The button of an ordinary folder: sub-folders with songs somewhere below → Show all songs;
     * songs only → Shuffle; never both. Music only — an audiobook is played in order.
     */
    private static File folderRow(Activity a, File dir, List fileList, List ownSongs) {
        if (fileList.isEmpty()) return null;
        String p = dir.getPath();
        if (p == null) return null;
        String root = Prefs.defaultFolderPath(a == null ? Y1Application.Companion.getAppContext() : a);
        if (root == null || !p.startsWith(root)) return null;
        if (Constant.INSTANCE.pathInAudiobook(p)) return null;

        // fileList = sub-folders + own songs: the size difference says whether there are folders
        int songs = ownSongs == null ? 0 : ownSongs.size();
        boolean hasDirs = fileList.size() > songs;
        if (hasDirs) return anyUnder(dir) ? mark(dir) : null;
        return songs > 1 ? shufMark(dir) : null;
    }

    /** Whether {@link #songsUnder} would find anything: stops at the first song still on the card. */
    private static boolean anyUnder(File dir) {
        List all = Albums.allSongs();
        String prefix = dir.getPath();
        if (all == null || prefix == null) return false;
        if (!prefix.endsWith("/")) prefix = prefix + "/";
        for (int i = 0; i < all.size(); i++) {
            Song s = (Song) all.get(i);
            String path = s == null ? null : s.getPath();
            if (path != null && path.startsWith(prefix) && new File(path).exists()) return true;
        }
        return false;
    }

    /**
     * In place of {@code getSongsByParentPath} in {@code FilesActivity.refresh}: the folder's own
     * songs off the list in memory. That query reads every row below the folder (the whole library
     * at the root) for stock to keep the direct children; the order is {@link #sortFiles}'s anyway.
     * Audiobooks are not in that list, and with no list yet nothing is read here: the query.
     */
    public static List byParent(Y1Repository repo, String dir) {
        try {
            List all = Albums.loaded();
            if (all != null && dir != null && !Constant.INSTANCE.pathInAudiobook(dir)) {
                ArrayList out = new ArrayList();
                int n = dir.length();
                for (int i = 0; i < all.size(); i++) {
                    Song s = (Song) all.get(i);
                    String path = s == null ? null : s.getPath();
                    if (path != null && path.length() > n + 1 && path.charAt(n) == '/'
                            && path.startsWith(dir) && path.indexOf('/', n + 1) < 0) out.add(s);
                }
                return out;
            }
        } catch (Throwable t) {
        }
        return repo.getSongsByParentPath(dir);
    }

    /**
     * A folder opens with the cursor under its button, the button still on screen. After stock's
     * own {@code setPosition(0)} / {@code setSelection(0)}.
     */
    public static void startRow(Object adapter) {
        if (!(adapter instanceof MyBaseAdapter)) return;
        try {
            MyBaseAdapter ad = (MyBaseAdapter) adapter;
            if (ad.getCount() < 2) return;
            Object o = ad.getItem(0);
            if (o instanceof File && isAnyMark((File) o)) ad.setPosition(1);
        } catch (Throwable t) {
        }
    }

    /**
     * Every library song below this folder, in path order — off the cached table, not the disk.
     * Not checked against the card, like every other library screen: a stat per song costs seconds.
     */
    private static List songsUnder(File dir) {
        ArrayList out = new ArrayList();
        List all = Albums.allSongs();
        if (all == null) return out;
        String prefix = dir.getPath();
        if (prefix == null) return out;
        if (!prefix.endsWith("/")) prefix = prefix + "/";
        String[] paths = new String[all.size()];
        int n = 0;
        for (int i = 0; i < all.size(); i++) {
            Song s = (Song) all.get(i);
            String path = s == null ? null : s.getPath();
            if (path != null && path.startsWith(prefix)) paths[n++] = path;
        }
        Arrays.sort(paths, 0, n);
        out.ensureCapacity(n);
        for (int i = 0; i < n; i++) out.add(new File(paths[i]));
        return out;
    }

    /** {@code FilesActivity.confirm}: either marker row acts instead of opening a file. */
    public static boolean open(Activity a, File item, Object adapter) {
        if (a == null) return false;
        if (isShuffle(item)) return shufflePlay(a, adapter);
        if (!isMark(item)) return false;
        try {
            Intent i = new Intent(a, FilesActivity.class);
            i.putExtra("now_path", item.getParent());   // the literal: KEY_NOW_PATH inlines anyway
            i.putExtra(EXTRA, true);
            a.startActivity(i);
        } catch (Throwable t) {
            return false;
        }
        return true;
    }

    /**
     * Play the list on screen in a shuffled copy. Path-only songs, as {@code FilesActivity} builds
     * them. {@code new Song()} + {@code setPath}, never the 17-argument constructor: it throws on
     * the first null, silently inside the catch (cost a build).
     */
    private static boolean shufflePlay(Activity a, Object adapter) {
        try {
            if (!(adapter instanceof MyBaseAdapter)) return true;
            MyBaseAdapter ad = (MyBaseAdapter) adapter;
            int n = ad.getCount();
            ArrayList songs = new ArrayList();
            for (int i = 0; i < n; i++) {
                Object o = ad.getItem(i);
                if (!(o instanceof File) || isAnyMark((File) o)) continue;
                Song s = new Song();
                s.setPath(((File) o).getPath());
                songs.add(s);
            }
            if (songs.isEmpty()) return true;
            Collections.shuffle(songs);
            PlayerService ps = Y1Application.Companion.getPlayerService();
            if (ps != null) ps.setMusicPlaylist(songs, 0);
            a.startActivity(new Intent(a, MusicPlayerActivity.class));
        } catch (Throwable t) {
            // handled either way: the row must never fall through to "open this file"
        }
        return true;
    }

    /** The flat list's own title. End of {@code FilesActivity.initView}. */
    public static void title(Activity a) {
        if (!allMode(a) || !(a instanceof BaseActivity)) return;
        try {
            ((BaseActivity) a).setStateBarLeftText(a.getString(R.string.ipp_show_all_songs));
        } catch (Throwable t) {
        }
    }

    /**
     * Every row's icon, at the END of {@code FileListAdapter.getView} — it takes the colour the
     * row's name ended up with. A marker row also gets its label.
     */
    public static void row(View row, int pos, Object adapter) {
        if (row == null || !(adapter instanceof MyBaseAdapter)) return;
        Object o;
        try {
            o = ((MyBaseAdapter) adapter).getItem(pos);
        } catch (Throwable t) {
            return;
        }
        File f = (o instanceof File) ? (File) o : null;
        boolean mine = isAnyMark(f);
        View nv = row.findViewById(R.id.file_name);
        View iv = row.findViewById(R.id.left_icon);
        TextView tv = (nv instanceof TextView) ? (TextView) nv : null;
        ImageView img = (iv instanceof ImageView) ? (ImageView) iv : null;

        if (!mine) {
            // The mod's drawings over stock's, tinted — unless the theme has its own folder/file
            // picture, which a SRC_IN tint would flatten. Tag and tint are always reset: rows are
            // recycled.
            if (img != null) {
                img.setTag(R.id.ipp_row_icon, null);
                boolean dir = f != null && !f.isFile();
                if (tv != null && f != null && !Theme.hasFileIcon(dir)) {
                    img.setImageResource(dir ? R.mipmap.ipp_folder : R.mipmap.ipp_folders_music);
                    Icons.menu(img, tv.getCurrentTextColor());
                    scale(img, BIG);
                } else {
                    Icons.reset(img);
                    scale(img, 1f);
                }
            }
            return;
        }

        boolean shuf = isShuffle(f);
        if (tv != null) {
            tv.setText(row.getContext().getString(
                    shuf ? R.string.random_play_option : R.string.ipp_show_all_songs));
        }
        if (img != null) {
            img.setVisibility(View.VISIBLE);
            img.setImageResource(shuf ? R.mipmap.music_shuffle : R.mipmap.ipp_show_all_songs);
            if (tv != null) Icons.menu(img, tv.getCurrentTextColor());
            scale(img, BIG);
            // for keepIcon()
            img.setTag(R.id.ipp_row_icon, Integer.valueOf(
                    shuf ? R.mipmap.music_shuffle : R.mipmap.ipp_show_all_songs));
        }
    }

    /**
     * A theme icon loading LATE ({@code ThemeManager.setBackground}'s callback, on an empty cache)
     * must not land on a marker row: top of that callback, true = drop the theme's bitmap.
     */
    public static boolean keepIcon(ImageView iv) {
        try {
            if (iv == null) return false;
            Object t = iv.getTag(R.id.ipp_row_icon);
            if (!(t instanceof Integer)) return false;
            iv.setImageResource(((Integer) t).intValue());
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    /**
     * ~72/56: the mod's glyphs sit in a margin of their 72px canvas. A SCALE, not a bigger box,
     * which would push the labels right. Not for a theme's own pictures.
     */
    private static final float BIG = 1.3f;

    /** Always SET: rows are recycled. */
    private static void scale(ImageView iv, float s) {
        if (iv == null || iv.getScaleX() == s) return;
        iv.setScaleX(s);
        iv.setScaleY(s);
    }

    /**
     * Videos → Folders: replaces the folder row's {@code setImageResource}. Tinted later by
     * {@link #videoIcon}, once the name has its colour.
     */
    public static void videoFolder(ImageView iv) {
        if (iv == null) return;
        iv.setImageResource(R.mipmap.ipp_folder);
        iv.setTag(R.id.ipp_row_icon, Integer.valueOf(R.mipmap.ipp_folder));
    }

    /**
     * End of that bind. The same view carries a video's thumbnail, so a recycled row loses the
     * tint and the scale.
     */
    public static void videoIcon(com.innioasis.y1.databinding.ItemVideoBinding b) {
        if (b == null) return;
        ImageView iv = b.fileImg;
        if (iv == null) return;
        boolean mine = iv.getTag(R.id.ipp_row_icon) instanceof Integer;
        iv.setTag(R.id.ipp_row_icon, null);
        if (mine) {
            Icons.menu(iv, b.fileName == null ? 0 : b.fileName.getCurrentTextColor());
            scale(iv, BIG);
        } else {
            Icons.reset(iv);
            scale(iv, 1f);
        }
    }

    /**
     * Folders' own sort: 0 A-Z, 1 Z-A, 2 oldest, 3 newest. Not stock's flags — they are one global
     * sort shared with other screens.
     */
    public static final String KEY_SORT = "folders_sort";

    /** Audiobooks → Folders keeps its own, told apart by the path itself. */
    public static final String KEY_SORT_BOOK = "folders_sort_ab";

    private static final int SORT_A_Z = 0;
    private static final int SORT_Z_A = 1;
    private static final int SORT_OLD = 2;
    private static final int SORT_NEW = 3;

    private static String keyFor(String path) {
        try {
            if (path != null && Constant.INSTANCE.pathInAudiobook(path)) return KEY_SORT_BOOK;
        } catch (Throwable t) {
        }
        return KEY_SORT;
    }

    private static int sortValue(String path) {
        return Prefs.val(Y1Application.Companion.getAppContext(), keyFor(path));
    }

    private static String pathOf(File dir) {
        return dir == null ? null : dir.getPath();
    }

    /** {@code FilesActivity.refresh}: by name, or by the file's date? */
    public static boolean sortByName(File dir) {
        int v = sortValue(pathOf(dir));
        return v == SORT_A_Z || v == SORT_Z_A;
    }

    /** {@code FilesActivity.refresh}: A-Z and "oldest first" are both ascending. */
    public static boolean sortAsc(File dir) {
        int v = sortValue(pathOf(dir));
        return v == SORT_A_Z || v == SORT_OLD;
    }

    /**
     * The folder's OWN songs in the same order — stock sorts only the sub-folders. In place, before
     * it becomes the play order too.
     */
    public static void sortFiles(List files, File dir) {
        try {
            if (files == null || files.size() < 2) return;
            order(files, true, sortByName(dir), sortAsc(dir), false, false);
        } catch (Throwable t) {
        }
    }

    /**
     * The one place a folder listing is ordered. Each file is stat'ed ONCE, before the sort — not
     * O(n log n) times from the comparator. {@code sorted == false} keeps the file system's order
     * (a stable sort) and only moves folders up.
     */
    private static void order(List items, boolean sorted, boolean byName, boolean asc,
                              boolean dirsFirst, boolean rows) {
        int n = items.size();
        Key[] keys = new Key[n];
        for (int i = 0; i < n; i++) {
            Object o = items.get(i);
            File f = rows ? rowFile(o) : (o instanceof File ? (File) o : null);
            String name = f == null ? null : f.getName();
            keys[i] = new Key(o,
                    dirsFirst && f != null && f.isDirectory(),
                    name == null ? "" : name,
                    (sorted && !byName && f != null) ? f.lastModified() : 0L);
        }
        Arrays.sort(keys, new KeySort(sorted, byName, asc, dirsFirst));
        for (int i = 0; i < n; i++) items.set(i, keys[i].item);
    }

    private static final class Key {
        final Object item;
        final boolean dir;
        final String name;
        final long time;

        Key(Object item, boolean dir, String name, long time) {
            this.item = item; this.dir = dir; this.name = name; this.time = time;
        }
    }

    private static final class KeySort implements Comparator {
        private final boolean sorted;
        private final boolean byName;
        private final boolean asc;
        private final boolean dirsFirst;

        KeySort(boolean sorted, boolean byName, boolean asc, boolean dirsFirst) {
            this.sorted = sorted; this.byName = byName; this.asc = asc; this.dirsFirst = dirsFirst;
        }

        public int compare(Object a, Object b) {
            Key x = (Key) a, y = (Key) b;
            // folders stay on top in BOTH directions: Z-A reverses each half, not the halves
            if (dirsFirst && x.dir != y.dir) return x.dir ? -1 : 1;
            if (!sorted) return 0;
            int r;
            if (byName) {
                r = x.name.compareTo(y.name);
            } else {
                r = x.time < y.time ? -1 : (x.time > y.time ? 1 : 0);
                // Files copied in one go share a minute: without a tie-break the two directions
                // look identical.
                if (r == 0) r = x.name.compareTo(y.name);
            }
            return asc ? r : -r;
        }
    }

    /** Videos → Folders follows the section's own stock {@code videoSort}, all four directions. */
    public static void sortVideoFiles(List files) {
        try {
            if (files == null || files.size() < 2) return;
            int v = SharedPreferencesUtils.INSTANCE.getVideoSort();
            boolean byName = v == Y1Repository.SortVideoType.A_Z.getType()
                    || v == Y1Repository.SortVideoType.Z_A.getType();
            boolean asc = v == Y1Repository.SortVideoType.A_Z.getType()
                    || v == Y1Repository.SortVideoType.CreateTime_Asc.getType();
            // folders above files: unlike the other two sections, this browser builds ONE list
            boolean none = v == Y1Repository.SortVideoType.None.getType();
            order(files, !none, byName, asc, true, false);
        } catch (Throwable t) {
        }
    }

    /** The file a video browser row stands for: a folder's target, else the video's path. */
    private static File rowFile(Object o) {
        if (!(o instanceof VideoListActivity.BrowseItem)) return null;
        VideoListActivity.BrowseItem b = (VideoListActivity.BrowseItem) o;
        File f = b.getTargetFile();
        if (f != null) return f;
        VideoInfo vi = b.getVideoInfo();
        String p = vi == null ? null : vi.getFilePath();
        return p == null ? null : new File(p);
    }

    /** "Sort by File name" in the video folder menu. */
    public static void videoSortMenu(Activity a) {
        try {
            if (a == null) return;
            ArrayList l = new ArrayList();
            l.add(a.getString(R.string.sort_a_z));
            l.add(a.getString(R.string.sort_z_a));
            l.add(a.getString(R.string.sort_time_asc));
            l.add(a.getString(R.string.sort_time_desc));
            new SubMenuDialog(a, l, new VideoSortPick(a), R.style.Dialog_Common).show();
        } catch (Throwable t) {
        }
    }

    public static final class VideoSortPick implements SubMenuDialog.Callback {
        private final Activity a;

        VideoSortPick(Activity a) { this.a = a; }

        public boolean select(int index, SubmenuAdapter.Item item) {
            try {
                String s = item == null ? null : item.getString();
                Y1Repository.SortVideoType t = Y1Repository.SortVideoType.A_Z;
                if (a.getString(R.string.sort_z_a).equals(s)) t = Y1Repository.SortVideoType.Z_A;
                else if (a.getString(R.string.sort_time_asc).equals(s)) t = Y1Repository.SortVideoType.CreateTime_Asc;
                else if (a.getString(R.string.sort_time_desc).equals(s)) t = Y1Repository.SortVideoType.CreateTime_Desc;
                SharedPreferencesUtils.INSTANCE.setVideoSort(t.getType());
                resortVideoList(a);
            } catch (Throwable t) {
            }
            return true;
        }
    }

    /** Re-order the list ON SCREEN: there is no "load this folder" method to call again. */
    private static void resortVideoList(Activity a) {
        try {
            View root = a.findViewById(R.id.recycler);
            if (!(root instanceof RecyclerView)) return;
            RecyclerView rv = (RecyclerView) root;
            RecyclerView.Adapter ad = rv.getAdapter();
            if (!(ad instanceof BaseBindingAdapter)) return;
            List data = ((BaseBindingAdapter) ad).getData();
            if (data == null || data.size() < 2) return;
            int v = SharedPreferencesUtils.INSTANCE.getVideoSort();
            boolean none = v == Y1Repository.SortVideoType.None.getType();
            boolean byName = v == Y1Repository.SortVideoType.A_Z.getType()
                    || v == Y1Repository.SortVideoType.Z_A.getType();
            boolean asc = v == Y1Repository.SortVideoType.A_Z.getType()
                    || v == Y1Repository.SortVideoType.CreateTime_Asc.getType();
            order(data, !none, byName, asc, true, true);
            ad.notifyDataSetChanged();
        } catch (Throwable t) {
        }
    }

    /**
     * "Sort by File name" in the folder's menu — matched by STRING before stock's dispatch, which
     * would take an entry past its own for a playlist.
     */
    public static void sortMenu(Activity a) {
        try {
            if (a == null) return;
            ArrayList l = new ArrayList();
            l.add(a.getString(R.string.sort_a_z));
            l.add(a.getString(R.string.sort_z_a));
            l.add(a.getString(R.string.sort_time_asc));
            l.add(a.getString(R.string.sort_time_desc));
            // the 4th argument is the dialog THEME, not a flag
            new SubMenuDialog(a, l, new SortPick(a), R.style.Dialog_Common).show();
        } catch (Throwable t) {
        }
    }

    public static final class SortPick implements SubMenuDialog.Callback {
        private final Activity a;

        SortPick(Activity a) { this.a = a; }

        public boolean select(int index, SubmenuAdapter.Item item) {
            try {
                String s = item == null ? null : item.getString();
                int v = SORT_A_Z;
                if (a.getString(R.string.sort_z_a).equals(s)) v = SORT_Z_A;
                else if (a.getString(R.string.sort_time_asc).equals(s)) v = SORT_OLD;
                else if (a.getString(R.string.sort_time_desc).equals(s)) v = SORT_NEW;
                Prefs.setInt(a, keyFor(currentPath(a)), v);
                clearTicks(a);
                relist(a);
            } catch (Throwable t) {
            }
            return true;
        }
    }

    /**
     * Clear the tick the long-press put on its row: it belongs to the screen and, being an INDEX,
     * survives the re-list as a second highlight.
     */
    private static void clearTicks(Activity a) {
        try {
            View v = a.findViewById(R.id.lv);
            MyBaseAdapter m = v == null ? null : Lv.model(v);
            if (m == null) return;
            List sel = m.getSelectedIndexList();
            if (sel == null || sel.isEmpty()) return;
            sel.clear();
            m.notifyDataSetChanged();
        } catch (Throwable t) {
        }
    }

    /** List the folder again through {@code refresh} — not a second place that builds the list. */
    private static void relist(Activity a) {
        if (!(a instanceof FilesActivity)) return;
        String p = currentPath(a);
        if (p == null) return;
        ((FilesActivity) a).refresh(p);
    }

    /** The folder on screen, worked out as {@code FilesActivity.initView} does. */
    private static String currentPath(Activity a) {
        String p = null;
        if (a != null && a.getIntent() != null) p = a.getIntent().getStringExtra("now_path");
        if (p == null && a != null) p = Prefs.defaultFolderPath(a);
        return p;
    }
}
