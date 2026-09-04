package com.innioasis.ipp;

import android.app.Activity;
import android.content.Intent;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import com.innioasis.music.FilesActivity;
import com.innioasis.music.MusicPlayerActivity;
import com.innioasis.music.adapter.MyBaseAdapter;
import com.innioasis.music.objects.Constant;
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
 * #224 — "Show all songs" in Folders: every music file below the folder on screen, in one list.
 *
 * <h3>Why it exists</h3>
 * A folder that holds only sub-folders can be listened to only one sub-folder at a time, and there
 * is no way to shuffle or queue the whole thing. The row appears exactly where that is the case:
 * the open folder has no songs of its own, does have folders, and there is something to play
 * underneath it. Anywhere else it would either duplicate the list already on screen or open an
 * empty one.
 *
 * <h3>How it works — one screen, two modes</h3>
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
 * <h3>The row itself</h3>
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
     * Sentinel row name. It really does start with a raw <b>U+0001</b> — invisible in an editor,
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
     * <ul>
     *   <li><b>Any sub-folders</b> (with or without songs of its own) → <b>Show all songs</b>:
     *       what is on screen is not the music, it is the way to it, and this is the one row that
     *       opens all of it at once.</li>
     *   <li><b>Songs and nothing else</b> → <b>Shuffle</b>: everything is already on screen, so
     *       there is nothing to "show"; the only thing missing is playing it in a random order,
     *       which is what the same row does in every other song list in the app.</li>
     * </ul>
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
     * <b>{@code new Song()} then {@code setPath}, never the 17-argument constructor with nulls.</b>
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
     * The marker row's own look, at the very END of {@code FileListAdapter.getView}: the label and
     * the icon of the identically named row in the artist view (`ipp_show_all_songs`), tinted with
     * the colour the row's name has just been given — the rule every menu icon in the mod follows,
     * so it tracks the theme and the focus highlight.
     *
     * Nothing to undo for an ordinary row: stock's getView writes the name and the icon of every
     * row it binds, so a recycled marker row is overwritten before this runs.
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

        // Rows are recycled, so the enlargement has to be taken back off an ordinary row -- and it
        // is a SCALE, not a size: growing the 22dip box would push the label right, and the marker
        // rows would then not line up with the folders under them.
        if (img != null && (img.getScaleX() != (mine ? BIG : 1f))) {
            img.setScaleX(mine ? BIG : 1f);
            img.setScaleY(mine ? BIG : 1f);
        }
        if (!mine) {
            // Recycled rows again, and this one is not about size: the marker's icon is TINTED to
            // the colour of its label (Icons.menu), and a tint left on the view paints the folder
            // icon that lands in it next. With seven rows on screen that is every seventh folder,
            // and it only shows on themes whose item text colour differs from the icon's own — the
            // user saw it on "Frutiger Aero" and "Win98 Refix".
            if (img != null) {
                Icons.reset(img);
                img.setTag(R.id.ipp_row_icon, null);
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
            // Which picture this view is supposed to be holding, for keepIcon() below.
            img.setTag(R.id.ipp_row_icon, Integer.valueOf(
                    shuf ? R.mipmap.music_shuffle : R.mipmap.ipp_show_all_songs));
        }
    }

    /**
     * A theme's icon arriving LATE must not land on a marker row.
     *
     * <p>{@code ThemeManager.setBackground(ImageView…)} reads the theme's picture through a cache
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
     * How much bigger the marker rows' icons are drawn than the folder icon beside them.
     *
     * The ipp artwork is a shape inside a 72x72 canvas with transparent margin all round, while
     * the stock folder mipmap fills its own — so at the same 22dip box the ipp glyph comes out
     * visibly smaller and the row reads as less important than the folders under it, which is the
     * opposite of what these two rows are.
     */
    private static final float BIG = 1.3f;
}
