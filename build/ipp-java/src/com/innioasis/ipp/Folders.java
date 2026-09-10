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
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * "Show all songs" in Folders: every music file below the folder on screen, in one list.
 *
 * Why it exists
 * A folder that holds only sub-folders can be listened to only one sub-folder at a time, and there
 * is no way to shuffle or queue the whole thing. The row appears exactly where that is the case:
 * the open folder has no songs of its own, does have folders, and there is something to play
 * underneath it. Anywhere else it would either duplicate the list already on screen or open an
 * empty one.
 *
 * How it works — one screen, two modes
 * There is no new Activity. The row opens {@code FilesActivity} again on the SAME folder with the
 * {@link #EXTRA} flag, and {@link #build} then fills that screen with the songs found recursively
 * instead of with the folder's own children. Everything the folder view already does then applies
 * to the flat list for free: the rows, playback (the whole list becomes the playlist), the ▶
 * marker, the long-press menu with "Add to queue" and multi-select.
 *
 * The two modes must not share a state-bar title: the queue's source and the ▶ marker identify a
 * list by its Activity class plus that title ({@code Queue.keyOf}), so two screens of the same
 * class showing different lists under one title would be taken for the same list. Hence
 * {@link #title}.
 *
 * The row itself
 * A sentinel {@code File} at index 0 — the same shape of trick as the artist view's "Show all
 * songs" marker album ({@code Albums.isAllSongs}), for the same reason: the list's item type is
 * fixed, and a marker item rides every path a real one does. Its name can never collide with a
 * real file (a control character), and nothing on disk answers to it, so the delete flow that
 * might be handed it finds nothing to delete.
 *
 * Raw (non-generic) types throughout: the bundled d8 crashes dexing generic Signature attrs.
 */
public final class Folders {

    private Folders() { }

    /** Intent flag: this FilesActivity shows everything below its folder, not its children. */
    public static final String EXTRA = "ipp_all";

    /**
     * Sentinel row name. It really does start with a raw U+0001 — invisible in an editor,
     * and that is the point: no file on a card can be called this, so the marker can never be
     * confused with a real row. Do not "tidy" the literal.
     */
    private static final String MARK = "ipp_show_all";

    /**
     * The second marker: Shuffle, and only inside the flat list — the folder view plays a folder
     * at a time and stock's own Shuffle row is what that means there.
     *
     * Same semantics as {@code ShufflePlaylistItemView}: it does not switch shuffle MODE on, it
     * hands the player a shuffled copy of the list. Its own U+0001 prefix, as above.
     */
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

    // ------------------------------------------------- a marker row is a button, not a file

    /**
     * Multi-select and its long-press menu must pass the two marker rows by: they are buttons, and
     * there is nothing behind them to delete, move or add to a playlist (the file they stand for
     * does not exist on the card at all).
     *
     * The two ticking paths are both in {@code MyBaseAdapter} — {@code addItemToSelectedIndex}
     * (the centre press) and {@code allSelect} ("Select all") — which every list in the app goes
     * through; only a Folders list can hold a marker, so everything else answers false on the
     * first test. The menu itself is stopped in {@code FilesActivity.longConfirm}, before the
     * dialog is shown.
     */
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
            // a marker left ticked is not worth a crash on a select-all
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
     * In multi-select the cursor does not stop on a marker row at all — the same way the Shuffle
     * row of a song list cannot be the cursor there. Called at the end of both wheel handlers of
     * {@code FilesActivity}: the markers are the FIRST row of the list, so the way off one is
     * always downwards, whichever direction the wheel came from.
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
            if (to < n) ad.setPosition(to);   // setPosition notifies for us
        } catch (Throwable t) {
            // the cursor sitting on a button it cannot tick is not worth a crash
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

    // ------------------------------------------------------------------------------- the content

    /**
     * Called from the end of {@code FilesActivity.refresh}'s coroutine, off the UI thread.
     *
     * Returns the flat song list when this screen is in "all" mode — the caller writes it to
     * {@code nowSongFileList}, which is what playback is built from — and null otherwise, having
     * inserted the marker row into {@code fileList} if this folder deserves one.
     *
     * @param fileList  the rows the screen is about to show (folders, then the folder's own songs)
     * @param ownSongs  the folder's own songs, i.e. the second half of that list
     */
    public static List build(Activity a, File dir, List fileList, List ownSongs) {
        try {
            if (dir == null || fileList == null) return null;
            if (allMode(a)) {
                List songs = songsUnder(dir);
                fileList.clear();
                if (!songs.isEmpty()) fileList.add(shufMark(dir));
                fileList.addAll(songs);
                // The Shuffle row is a row of the list, so the two are one short of each other --
                // which nothing has to know about: playback finds its index by PATH (stock's own
                // confirm, Rows.filePlaying and Follow all match File.getPath()), never by counting.
                return new ArrayList(songs);   // a copy: refresh() clears fileList in place
            }
            File row = folderRow(a, dir, fileList, ownSongs);
            if (row != null) fileList.add(0, row);
        } catch (Throwable t) {
            // a folder that cannot be walked is simply a folder without the row
        }
        return null;
    }

    /**
     * Which button, if any, an ordinary folder gets — and it is never both, because the two answer
     * different situations:
     *
     *   - Any sub-folders (with or without songs of its own) → Show all songs:
     *       what is on screen is not the music, it is the way to it, and this is the one row that
     *       opens all of it at once.
     *   - Songs and nothing else → Shuffle: everything is already on screen, so
     *       there is nothing to "show"; the only thing missing is playing it in a random order,
     *       which is what the same row does in every other song list in the app.
     *
     * "Sub-folders that are not empty either" is checked as what it is for — there must be songs
     * somewhere below, or the row opens an empty list. A folder of folders of folders passes;
     * one whose sub-folders hold nothing but pictures does not.
     *
     * Music only ({@code Prefs.defaultFolderPath}, and never inside Audiobooks): an audiobook is
     * listened to one book at a time and in order, which is the opposite of both these rows.
     */
    private static File folderRow(Activity a, File dir, List fileList, List ownSongs) {
        if (fileList.isEmpty()) return null;                         // nothing here at all
        String p = dir.getPath();
        if (p == null) return null;
        String root = Prefs.defaultFolderPath(a == null ? Y1Application.Companion.getAppContext() : a);
        if (root == null || !p.startsWith(root)) return null;
        if (Constant.INSTANCE.pathInAudiobook(p)) return null;

        // fileList is the sub-folders followed by the folder's own songs, so the difference of the
        // two sizes is exactly "does this folder have sub-folders" -- no second listing needed.
        int songs = ownSongs == null ? 0 : ownSongs.size();
        boolean hasDirs = fileList.size() > songs;
        if (hasDirs) return songsUnder(dir).isEmpty() ? null : mark(dir);
        return songs > 1 ? shufMark(dir) : null;   // one song is nothing to shuffle
    }

    /**
     * The cursor a folder opens on: the row under the button, when there is a button.
     *
     * The row is a button, and a folder is opened to look at what is in it — landing on the button
     * would mean every folder opens with the cursor on something that is not its contents. The
     * list is left where stock put it (row 0 at the top), so the button is on screen and one step
     * up reaches it. Injected after stock's own {@code setPosition(0)} / {@code setSelection(0)}.
     */
    public static void startRow(Object adapter) {
        if (!(adapter instanceof MyBaseAdapter)) return;
        try {
            MyBaseAdapter ad = (MyBaseAdapter) adapter;
            if (ad.getCount() < 2) return;
            Object o = ad.getItem(0);
            if (o instanceof File && isAnyMark((File) o)) ad.setPosition(1);
        } catch (Throwable t) {
            // the cursor staying on row 0 is not worth a crash
        }
    }

    /**
     * Every song of the library that lives below this folder, in path order — so a sub-folder's
     * tracks stay together and the sub-folders come in the order the folder view shows them.
     *
     * The source is {@code Albums.allSongs()}, the cached full song table, not a walk of the disk:
     * the folder view's own list is the library's too ({@code getSongsByParentPath}), so this
     * shows exactly what the screen it was opened from would show one folder at a time, and it
     * costs one pass over a list that is in memory anyway.
     */
    private static List songsUnder(File dir) {
        ArrayList out = new ArrayList();
        List all = Albums.allSongs();
        if (all == null) return out;
        String prefix = dir.getPath();
        if (prefix == null) return out;
        if (!prefix.endsWith("/")) prefix = prefix + "/";
        for (int i = 0; i < all.size(); i++) {
            Song s = (Song) all.get(i);
            String path = s == null ? null : s.getPath();
            if (path == null || !path.startsWith(prefix)) continue;
            File f = new File(path);
            if (f.exists()) out.add(f);
        }
        Collections.sort(out, PATH);
        return out;
    }

    private static final Comparator PATH = new PathCmp();
    private static final class PathCmp implements Comparator {
        public int compare(Object a, Object b) {
            String x = ((File) a).getPath();
            String y = ((File) b).getPath();
            return (x == null ? "" : x).compareTo(y == null ? "" : y);
        }
    }

    // ---------------------------------------------------------------------------- the row and it

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
     * The Shuffle row: play the flat list in a shuffled order, which is exactly what stock's own
     * Shuffle row means ({@code ShufflePlaylistItemView.getPlaylist} returns a shuffled copy) —
     * the shuffle SETTING is left alone, so what the row does is visible in the queue and can be
     * stepped back through like any other order.
     *
     * The songs come off the ADAPTER, not off the disk again: the list is on screen, so this costs
     * nothing and cannot disagree with what the user is looking at. Songs carry the path and
     * nothing else, the way {@code FilesActivity} builds them everywhere else — Now Playing and
     * the queue screen both re-read a song whose name is blank.
     *
     * {@code new Song()} then {@code setPath}, never the 17-argument constructor with nulls.
     * {@code Song} is a Kotlin data class whose every String parameter is non-null, so that
     * constructor opens with a {@code checkNotNullParameter} per argument and a null throws
     * immediately. Stock's {@code new Song(null, …, path, …)} is not that constructor at all — it
     * is the synthetic one carrying the default-argument mask, which fills the defaults in before
     * the real one is reached, and javac cannot call a synthetic member. The no-argument
     * constructor goes through the same mask with every slot defaulted, which is the same object.
     * (This cost a build: the NPE was caught by the {@code catch} below, so pressing the row did
     * nothing at all and said nothing anywhere.)
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

    /**
     * The flat list must not be called what the folder view is called — see the class comment.
     * Injected at the end of {@code FilesActivity.initView}, after stock has set the folder name.
     */
    public static void title(Activity a) {
        if (!allMode(a) || !(a instanceof BaseActivity)) return;
        try {
            ((BaseActivity) a).setStateBarLeftText(a.getString(R.string.ipp_show_all_songs));
        } catch (Throwable t) {
            // a title is not worth a crash
        }
    }

    /**
     * Every row's icon, at the very END of {@code FileListAdapter.getView} — which is where it has
     * to be, because the colour each one takes is the colour the row's NAME ended up with, and
     * that is settled by the ThemeManager calls above.
     *
     * A marker row also gets its label and the icon of the identically named row in the artist
     * view ({@code ipp_show_all_songs}); an ordinary row gets the mod's folder or file drawing.
     * All four are one set — 72x72 with the glyph inside a ~56 box — so they draw at one size in
     * the row's fixed 22dip frame and need no scaling to agree with each other.
     *
     * Nothing to undo of the LABEL on an ordinary row: stock's getView writes the name of every
     * row it binds, so a recycled marker row is overwritten before this runs. The icon is another
     * matter — see the tint and the tag below.
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
            // An ordinary row: the mod's own folder / file drawings in place of the stock ones,
            // painted in the colour the row's name has just been given. Same rule and the same
            // reason as the marker rows above them -- the whole list is then one set of artwork,
            // one size and one colour, and it follows the theme and the focus highlight.
            //
            // Stock's commonSetIcon has already run at the top of getView, so this OVERWRITES what
            // it set. That is deliberate: it is also the call that gives a theme its own
            // fileTypeFolder / fileTypeMusic picture, and such a theme keeps it exactly as drawn --
            // the tint is SRC_IN, which flattens a multi-coloured drawing into one colour.
            // Theme.hasFileIcon is what answers that, memoised per theme.
            //
            // The tag is cleared whatever happens, and so is the tint when it is not wanted: rows
            // are recycled, and a filter left on the view paints whatever lands in it next. With
            // seven rows on screen that reads as every seventh icon being the wrong colour, and it
            // only shows on themes whose item text colour differs from the icon's own -- the user
            // saw it on "Frutiger Aero" and "Win98 Refix".
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
            // Which picture this view is supposed to be holding, for keepIcon() below.
            img.setTag(R.id.ipp_row_icon, Integer.valueOf(
                    shuf ? R.mipmap.music_shuffle : R.mipmap.ipp_show_all_songs));
        }
    }

    /**
     * A theme's icon arriving LATE must not land on a marker row.
     *
     * {@code ThemeManager.setBackground(ImageView…)} reads the theme's picture through a cache
     * and, when it is not there yet, hands the load a callback that calls {@code setImageBitmap}
     * whenever it finishes. On the first visit to Folders the cache is empty, so our icon is set
     * first and the theme's folder icon overwrites it a moment later — "Win98 Refix shows the wrong
     * icon on Show all songs the first time". The row remembers which picture it should be showing
     * (the tag above), and this call, injected at the top of that callback, puts it back and
     * answers true so the theme's bitmap is dropped for this one view.
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
     * How much bigger the mod's own icons are drawn than the box they are given.
     *
     * The set is a glyph inside a ~56 box of a 72x72 canvas, and the row's frame is a fixed 22dip
     * with the default {@code fitCenter} — which scales the whole CANVAS, transparent margin and
     * all, so the glyph itself lands at about 17dip and reads small beside the text. 1.3 is very
     * nearly the 72/56 the margin takes away, and is applied as a SCALE rather than a bigger box:
     * growing the box would push every label right and the rows would stop lining up.
     *
     * Not applied to a theme's own {@code fileTypeFolder} / {@code fileTypeMusic} picture, which
     * is drawn to fill its canvas the way the stock one was.
     */
    private static final float BIG = 1.3f;

    /** Rows are recycled, so the scale is always SET, never only raised. */
    private static void scale(ImageView iv, float s) {
        if (iv == null || iv.getScaleX() == s) return;
        iv.setScaleX(s);
        iv.setScaleY(s);
    }

    /**
     * Videos → Folders is a screen of its own ({@code VideoListActivity}), and its folder rows put
     * the icon in {@code file_img} with a plain {@code setImageResource} — the theme is not asked
     * there at all, in stock or here. This replaces that call: the mod's folder drawing, and a tag
     * saying the view is holding it.
     *
     * The colour cannot be taken here — the row's name is painted several branches further down —
     * so the tag is what {@link #videoIcon} reads at the end of the bind.
     */
    public static void videoFolder(ImageView iv) {
        if (iv == null) return;
        iv.setImageResource(R.mipmap.ipp_folder);
        iv.setTag(R.id.ipp_row_icon, Integer.valueOf(R.mipmap.ipp_folder));
    }

    /**
     * ...and the end of that bind: the icon takes the colour its name ended up with, and its
     * scale, exactly as in the Folders list.
     *
     * The same ImageView also carries a VIDEO's thumbnail, so the tag is read and cleared in one
     * go: a recycled row that has become a video must lose both the tint and the enlargement, or
     * the picture comes out one flat colour and 30% too big.
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

    // ------------------------------------------------------------ the order the folder is listed in

    /**
     * How this section lists a folder: 0 A-Z, 1 Z-A, 2 oldest first, 3 newest first — the four
     * {@code FilesActivity.refresh} has always been able to produce. It could not be CHOSEN here,
     * though: the two flags it read are one global "sort" that Photos, the Settings screen and
     * several {@code Y1Repository} queries share, so a pick made in Folders would have reordered
     * screens the user was not looking at. This is Folders' own key, and nothing else reads it.
     */
    public static final String KEY_SORT = "folders_sort";

    /**
     * ...and Audiobooks keeps its own, because Folders is a SUB-SECTION of each section rather
     * than a section of its own: Music → Folders and Audiobooks → Folders are the same screen with
     * a different root, and one order shared between them means sorting a book by date puts the
     * albums in date order too. Which of the two a listing belongs to is answered by the folder
     * itself ({@code Constant.pathInAudiobook}), so no state has to be carried around. Videos →
     * Folders is a screen of its own and follows the section's own {@code videoSort}.
     */
    public static final String KEY_SORT_BOOK = "folders_sort_ab";

    private static final int SORT_A_Z = 0;
    private static final int SORT_Z_A = 1;
    private static final int SORT_OLD = 2;
    private static final int SORT_NEW = 3;

    private static String keyFor(String path) {
        try {
            if (path != null && Constant.INSTANCE.pathInAudiobook(path)) return KEY_SORT_BOOK;
        } catch (Throwable t) {
            // an unanswerable path is the music one, which is what the section usually is
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

    /** {@code FilesActivity.refresh}: which way round? A-Z and "oldest first" are both ascending. */
    public static boolean sortAsc(File dir) {
        int v = sortValue(pathOf(dir));
        return v == SORT_A_Z || v == SORT_OLD;
    }

    /**
     * The folder's OWN songs, in the same order — the second half of the sort, and the half stock
     * never had.
     *
     * What {@code refresh} sorts is the array of SUB-FOLDERS; the songs under them come from the
     * library ({@code getSongsByParentPath}) and were shown in whatever order the query returned.
     * A folder of folders therefore re-sorted and a folder of tracks did not, which is why picking
     * a sort in an audiobook — a book being exactly a folder of chapters — appeared to do nothing
     * at all. Sorted in place, before the list is handed on: this list is also the PLAY order
     * ({@code nowSongFileList}), so the two cannot be allowed to disagree.
     */
    public static void sortFiles(List files, File dir) {
        try {
            if (files == null || files.size() < 2) return;
            Collections.sort(files, new FileSort(sortByName(dir), sortAsc(dir)));
        } catch (Throwable t) {
            // a list in the library's own order is still a list
        }
    }

    /** Named, never anonymous: d8 crashes dexing anonymous classes here. */
    private static final class FileSort implements Comparator {
        private final boolean byName;
        private final boolean asc;

        FileSort(boolean byName, boolean asc) { this.byName = byName; this.asc = asc; }

        public int compare(Object a, Object b) {
            if (!(a instanceof File) || !(b instanceof File)) return 0;
            File x = (File) a, y = (File) b;
            int r;
            if (byName) {
                r = byName(x, y);
            } else {
                long lx = x.lastModified(), ly = y.lastModified();
                r = lx < ly ? -1 : (lx > ly ? 1 : 0);
                // FILES COPIED ONTO THE CARD IN ONE OPERATION ALL CARRY THE SAME MINUTE, and a
                // whole folder of them is the normal case rather than the exception — a season of
                // a series, an album's tracks, the videos someone has just dragged across. With
                // nothing to tell them apart the sort is stable, i.e. it leaves the list exactly
                // as it found it, and the entry reads as broken. The name is the tie-break, so
                // "oldest first" always produces SOME order and the two directions always differ.
                if (r == 0) r = byName(x, y);
            }
            return asc ? r : -r;
        }

        /** Plain String order, the comparison stock makes on the sub-folders. */
        private int byName(File x, File y) {
            String nx = x.getName(), ny = y.getName();
            return (nx == null ? "" : nx).compareTo(ny == null ? "" : ny);
        }
    }

    // ------------------------------------------- the same, for the folder list of the Videos section

    /**
     * The Videos section browses the card with a screen of its own ({@code VideoListActivity}),
     * and its folder list had no order to ask for either — it was whatever {@code listFiles}
     * returned. It follows the section's OWN sort, the stock {@code videoSort} the all-videos list
     * already uses, rather than {@link #KEY_SORT}: one section, one order, and nothing a person
     * picks in Videos reaches the Folders section or the other way round.
     *
     * Stock offers only A-Z and Z-A for it; the enum has always had the two creation-time values
     * as well, and the menu below offers all four.
     */
    public static void sortVideoFiles(List files) {
        try {
            if (files == null || files.size() < 2) return;
            int v = SharedPreferencesUtils.INSTANCE.getVideoSort();
            boolean byName = v == Y1Repository.SortVideoType.A_Z.getType()
                    || v == Y1Repository.SortVideoType.Z_A.getType();
            boolean asc = v == Y1Repository.SortVideoType.A_Z.getType()
                    || v == Y1Repository.SortVideoType.CreateTime_Asc.getType();
            // stock's own "unsorted": the file system's order is kept inside each half, but the
            // halves are still separated — see splitSort
            boolean none = v == Y1Repository.SortVideoType.None.getType();
            splitSort(files, none ? null : new FileSort(byName, asc), false);
        } catch (Throwable t) {
            // a folder listed in the file system's own order is still a folder
        }
    }

    /**
     * Folders above files, each half in the picked order — what Music and Audiobooks look like,
     * and what this section did not.
     *
     * There the two halves are separate by construction: {@code FilesActivity} lists the
     * sub-folders and then appends the folder's own songs, so a sort applied to either cannot mix
     * them. The Videos browser builds ONE list of {@code File}s in {@code isFolderOrVideo} —
     * folders and videos interleaved in whatever order the sort put them — so the separation has
     * to be made here.
     *
     * Split with one pass rather than by asking {@code isDirectory()} from inside the comparison:
     * that is a stat per call and a sort makes n log n of them, against n for the pass.
     *
     * A null comparator is "keep the order you were given inside each half", which is what stock's
     * own unsorted mode means once the halves are separated.
     */
    private static void splitSort(List items, Comparator cmp, boolean rows) {
        ArrayList dirs = new ArrayList();
        ArrayList rest = new ArrayList();
        for (int i = 0; i < items.size(); i++) {
            Object o = items.get(i);
            File f = rows ? rowFile(o) : (o instanceof File ? (File) o : null);
            if (f != null && f.isDirectory()) dirs.add(o); else rest.add(o);
        }
        if (cmp != null) {
            Collections.sort(dirs, cmp);
            Collections.sort(rest, cmp);
        }
        if (dirs.isEmpty() || rest.isEmpty()) {
            // nothing to separate; only the sort was wanted, and it has been made in place above
            if (cmp != null) Collections.sort(items, cmp);
            return;
        }
        items.clear();
        items.addAll(dirs);
        items.addAll(rest);
    }

    /**
     * The file a row of the video browser stands for. A row that is a folder carries only its
     * {@code targetFile}; a video carries a {@code VideoInfo} as well, and its path is the
     * honest answer for it (the two are built side by side in {@code VideoListActivity.confirm}).
     */
    private static File rowFile(Object o) {
        if (!(o instanceof VideoListActivity.BrowseItem)) return null;
        VideoListActivity.BrowseItem b = (VideoListActivity.BrowseItem) o;
        File f = b.getTargetFile();
        if (f != null) return f;
        VideoInfo vi = b.getVideoInfo();
        String p = vi == null ? null : vi.getFilePath();
        return p == null ? null : new File(p);
    }

    /** "Sort by File name" in the video folder menu: the four directions, then re-order the list. */
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
            // a sort that cannot be offered leaves the list in the order it is in
        }
    }

    /** Named, never anonymous: d8 crashes dexing anonymous classes here. */
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
                // the preference is written or it is not; either way the menu closes
            }
            return true;
        }
    }

    /**
     * Re-order the folder list that is ON SCREEN, rather than listing the card again.
     *
     * The list is built inside {@code VideoListActivity.confirm} — there is no "load this folder"
     * method to call a second time — and it is already exactly the rows the sort is about, so
     * sorting it in place is both the cheapest and the most honest answer. Rows are compared by
     * the file each one stands for, which is what the next listing will compare too.
     */
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
            if (v == Y1Repository.SortVideoType.None.getType()) return;
            boolean byName = v == Y1Repository.SortVideoType.A_Z.getType()
                    || v == Y1Repository.SortVideoType.Z_A.getType();
            boolean asc = v == Y1Repository.SortVideoType.A_Z.getType()
                    || v == Y1Repository.SortVideoType.CreateTime_Asc.getType();
            splitSort(data, new RowSort(byName, asc), true);
            ad.notifyDataSetChanged();
        } catch (Throwable t) {
            // the order is stored; the folder shows it the next time it is opened
        }
    }

    /** The same comparison, applied to the rows of the video browser. */
    private static final class RowSort implements Comparator {
        private final FileSort files;

        RowSort(boolean byName, boolean asc) { this.files = new FileSort(byName, asc); }

        public int compare(Object a, Object b) {
            File x = rowFile(a), y = rowFile(b);
            if (x == null || y == null) return 0;
            return files.compare(x, y);
        }
    }

    /**
     * "Sort by File name" in the folder's long-press menu: the four directions, then re-list.
     *
     * The entry is matched by STRING in {@code FilesActivity.subMenuSelectCallback} and acted on
     * before stock's dispatch, the way "Add to queue" is — that menu reads "anything past the
     * fixed entries is a playlist", and an entry of ours reaching it would be taken for one.
     */
    public static void sortMenu(Activity a) {
        try {
            if (a == null) return;
            ArrayList l = new ArrayList();
            l.add(a.getString(R.string.sort_a_z));
            l.add(a.getString(R.string.sort_z_a));
            l.add(a.getString(R.string.sort_time_asc));
            l.add(a.getString(R.string.sort_time_desc));
            // The 4th argument is the dialog THEME, not a flag (see ipp-menus-playlists).
            new SubMenuDialog(a, l, new SortPick(a), R.style.Dialog_Common).show();
        } catch (Throwable t) {
            // a sort that cannot be offered leaves the list in the order it is in
        }
    }

    /** Named, never anonymous: d8 crashes dexing anonymous classes here. */
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
                // the preference is written or it is not; either way the menu closes
            }
            return true;
        }
    }

    /**
     * Take back the tick the long-press put on the row it was raised on.
     *
     * {@code FilesActivity.longConfirm} ticks that row to highlight it behind the menu, and the
     * tick belongs to the SCREEN, not to the dialog — so an action that ends by rebuilding the
     * list has to clear it, or the row keeps its highlight beside the cursor for the rest of the
     * visit: two highlights on one screen, and moving the wheel only adds a second. Rebuilding
     * the list does not clear it either, because the selection is a list of INDEXES and survives
     * a new set of items. Same rule as {@code Queue.addFromAdapter}.
     */
    private static void clearTicks(Activity a) {
        try {
            View v = a.findViewById(R.id.lv);
            if (!(v instanceof android.widget.ListView)) return;
            Object ad = ((android.widget.ListView) v).getAdapter();
            if (!(ad instanceof MyBaseAdapter)) return;
            MyBaseAdapter m = (MyBaseAdapter) ad;
            List sel = m.getSelectedIndexList();
            if (sel == null || sel.isEmpty()) return;
            sel.clear();
            m.notifyDataSetChanged();
        } catch (Throwable t) {
            // a tick left behind is a cosmetic defect, not a reason to lose the sort
        }
    }

    /**
     * List the folder again, exactly as entering it does.
     *
     * NOT a re-sort of what the adapter holds: what the list IS — the marker row at its head, the
     * flat "all songs" mode, the state bar — is decided inside {@code refresh} and its coroutine,
     * so a second place that builds the list would drift from this one on the first change to
     * either. The path is worked out the way {@code initView} works it out.
     */
    private static void relist(Activity a) {
        if (!(a instanceof FilesActivity)) return;
        String p = currentPath(a);
        if (p == null) return;
        ((FilesActivity) a).refresh(p);
    }

    /**
     * The folder this screen is showing, worked out the way {@code FilesActivity.initView} works it
     * out — the intent's path, or the section's default when there is none. It answers both "which
     * folder to list again" and "which section's sort key this is".
     */
    private static String currentPath(Activity a) {
        String p = null;
        if (a != null && a.getIntent() != null) p = a.getIntent().getStringExtra("now_path");
        if (p == null && a != null) p = Prefs.defaultFolderPath(a);
        return p;
    }
}
