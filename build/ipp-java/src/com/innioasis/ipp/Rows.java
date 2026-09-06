package com.innioasis.ipp;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import com.innioasis.music.adapter.MyBaseAdapter;
import com.innioasis.music.util.Other;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.service.PlayerService;
import com.innioasis.y1.theme.ThemeManager;
import com.innioasis.y1.utils.SharedPreferencesUtils;
import com.innioasis.y1.utils.Static;

import java.io.File;

/**
 * List-row geometry.
 *
 * A list row is {@code layout_height="wrap_content"}, and {@code View.getSuggestedMinimumHeight()}
 * is {@code max(minHeight, background.getMinimumHeight())} — so the row is at least as tall as
 * whatever drawable is currently its background. The selection background is taller than the text:
 * the built-in {@code item_selected_no_arrow.9.png} is 480x42, and a theme's own
 * {@code itemSelectedBackground} bitmap is decoded at up to 640x91. The unselected background
 * ({@code item_no_selected}, a transparent shape) has no intrinsic size at all. Result: the row
 * the wheel is on grows, and — because ListView reuses the very same recycled View — it keeps the
 * larger height afterwards, which is the "строки расширяются при наведении и остаются такими".
 *
 * {@link #flat} re-wraps the background in a drawable that reports no intrinsic size, so the row
 * height comes from its text alone and the highlight simply stretches over it. This is the same
 * rule the code-built rows of IppActivity / IppQueueActivity already follow (fixed height derived
 * from the text) — see CLAUDE.md.
 */
public final class Rows {

    /**
     * The same for an All-audiobooks row ({@code AudiobookAdapter}, {@code item_player.xml}), in the
     * else-branch of its {@code getView}.
     *
     * That adapter was the last one still inflating a fresh row on every call, so the screen never
     * got the scrolling the other lists have: with {@code convertView} ignored, every wheel click
     * re-inflated the whole visible window and {@code Wheel.list} could not repaint the two rows in
     * place. Stock's else-branch only resets the background — everything else it leaves to the fresh
     * inflate — so the rest of the unselected state is here: both labels back to white and the
     * marquee taken off the name. The background stays stock's (`0`, i.e. what the row was
     * inflated with) rather than `item_no_selected`, which is what this row has always shown.
     */
    public static void bookRow(MyBaseAdapter a, View row) {
        if (row == null) return;
        try {
            int white = row.getResources().getColor(R.color.white);
            View name = row.findViewById(R.id.tv_name);
            if (name instanceof TextView) {
                TextView tv = (TextView) name;
                Scroll.rowPlain(tv);
                ThemeManager.INSTANCE.itemSetTextColor(tv, white, false);
            }
            View progress = row.findViewById(R.id.tv_prograss);
            if (progress instanceof TextView) {
                ThemeManager.INSTANCE.itemSetTextColor((TextView) progress, white, false);
            }
        } catch (Throwable t) {
            // a row that cannot be reset is still a drawable row
        }
    }

    /**
     * Put a recycled Folders row back to its unselected look, at the START of
     * {@code FileListAdapter.getView}.
     *
     * Stock ignores {@code convertView} there and inflates a fresh row on every call, so every wheel
     * click re-inflates the whole visible window and {@code Wheel.list} cannot use its in-place
     * repaint either (it only does that for adapters that honour convertView). Recycling the row
     * costs one thing: stock paints only the selected state and has no else-branch, because a newly
     * inflated row is unselected by definition. This is that missing branch — text colour,
     * background, arrow and marquee, exactly the four things the selected branch changes.
     */
    public static void fileRow(MyBaseAdapter a, View row) {
        if (row == null) return;
        try {
            View arrow = row.findViewById(R.id.right_arrow);
            if (arrow != null) Other.INSTANCE.hideV(arrow);
            View name = row.findViewById(R.id.file_name);
            if (name instanceof TextView) {
                TextView tv = (TextView) name;
                Scroll.rowPlain(tv);
                ThemeManager.INSTANCE.itemSetTextColor(
                        tv, row.getResources().getColor(R.color.white), false);
            }
            ThemeManager.INSTANCE.itemSetBackground(row, R.drawable.item_no_selected, false);
        } catch (Throwable t) {
            // a row that cannot be reset is still a drawable row
        }
    }

    /**
     * One half of the multi-select blink, in place of the bare
     * {@code ThemeManager.itemSetBackground(row, item_selected_no_arrow / item_no_selected, on)}
     * every screen with multi-select toggles from its own 500 ms thread.
     *
     * The background alone is not the whole highlight: the cursor row also carries the right
     * arrow, and a theme supplies that arrow as a PICTURE ({@code itemRightArrow}), which may have
     * the selection colour baked into it — "Win98 Refix" ships a white triangle on the same
     * opaque #0000A8 block its {@code itemSelectedBackground} is. So while the row's background
     * blinked off, a rectangle of selection colour stayed sitting at the right-hand end of it. The
     * arrow is therefore blinked with the background.
     *
     * Only VISIBLE ↔ INVISIBLE, never GONE: GONE means "this row has no arrow at all", which is
     * every row that is not the cursor, and it must stay that way. INVISIBLE also keeps the row's
     * measurement identical between the two halves of the blink, so nothing moves as it flashes.
     *
     * The arrow is looked for on the row AND on its parent, because the view the blink is handed
     * is not always the row's root: {@code VideoListActivity} paints {@code video_layout} /
     * {@code file_layout}, and {@code iv_arrow} is their SIBLING inside the item's FrameLayout.
     *
     * The drawable is passed through rather than chosen here: the sites are not unanimous —
     * {@code SearchActivity} highlights with {@code item_selected} where everything else uses
     * {@code item_selected_no_arrow} — and this is a fix for the arrow, not a change of highlight.
     */
    public static void blink(View row, int res, boolean on) {
        try {
            if (row == null) return;
            ThemeManager.INSTANCE.itemSetBackground(row, res, on);
            View a = arrowOf(row);
            if (a == null) return;
            if (on) {
                if (a.getVisibility() == View.INVISIBLE) a.setVisibility(View.VISIBLE);
            } else {
                if (a.getVisibility() == View.VISIBLE) a.setVisibility(View.INVISIBLE);
            }
        } catch (Throwable t) {
            // a blink that misses a frame is not worth taking the screen down for
        }
    }

    /**
     * The name a Videos row shows for {@code f}: extensions are hidden for FILES, never for
     * folders. {@code SharedPreferencesUtils.processFileExtensions} simply cuts everything after
     * the last dot, and {@code VideoListActivity} ran every entry through it, so {@code LOST.DIR}
     * came out as {@code LOST}. Same bug, same fix as {@code PhotosActivity} — the Folders list
     * ({@code FileListAdapter}) has always guarded it with {@code File.isFile()}.
     */
    public static String fileLabel(File f) {
        if (f == null) return "";
        String n = f.getName();
        if (f.isDirectory()) return n;
        return SharedPreferencesUtils.INSTANCE.processFileExtensions(n);
    }

    /** The row's right arrow, whatever the layout calls it; see {@link #blink}. */
    private static View arrowOf(View row) {
        View v = findArrow(row);
        if (v != null) return v;
        Object p = row.getParent();
        return (p instanceof View) ? findArrow((View) p) : null;
    }

    private static View findArrow(View v) {
        View a = v.findViewById(R.id.right_arrow);      // song / album / genre / file rows
        if (a == null) a = v.findViewById(R.id.iv_arrow); // main menu, video rows
        if (a == null) a = v.findViewById(R.id.arrow);    // settings rows
        return a;
    }

    /**
     * The playing marker in Folders — the ▶ of the song lists, in the place a Folders row has for
     * it: the file icon's own box ({@code ipp_file_play}, tied to all four of its edges). While it
     * shows, the icon is INVISIBLE rather than GONE, so it still measures and the name stays put.
     *
     * Deliberately a glyph and not an image: the icon slot is themed, and a themed picture is the
     * one thing that cannot be counted on to read as "playing" — the ▶ is the same mark the song
     * lists use, and its colour is copied from the row's own name, so it follows both the theme and
     * the focus highlight. That is why this runs at the END of getView: the name's colour is not
     * applied until the state branches above have run.
     *
     * Both states are written on every bind, so a recycled row can never keep another file's mark.
     * The condition is the one the ▶ follows everywhere — {@link Queue#atSource}: the marker
     * belongs only to the folder the track was actually started from.
     *
     * The path to compare is {@code File.getPath()}: that is literally what {@code FilesActivity}
     * puts into the {@code Song} it builds for the playlist.
     */
    public static void filePlaying(View row, int pos, Object adapter) {
        if (row == null) return;
        try {
            View mv = row.findViewById(R.id.ipp_file_play);
            View icon = row.findViewById(R.id.left_icon);
            if (!(mv instanceof ImageView)) return;
            ImageView mark = (ImageView) mv;
            int res = fileMark(pos, adapter);
            if (res != 0) {
                View name = row.findViewById(R.id.file_name);
                int colour = (name instanceof TextView)
                        ? ((TextView) name).getCurrentTextColor() : 0xFFFFFFFF;
                mark.setImageResource(res);
                Icons.menu(mark, colour);
                mark.setVisibility(View.VISIBLE);
                if (icon != null) icon.setVisibility(View.INVISIBLE);
            } else {
                mark.setVisibility(View.GONE);
                if (icon != null) icon.setVisibility(View.VISIBLE);
            }
        } catch (Throwable t) {
            // a marker is cosmetic — never take the list down for it
        }
    }

    /** The marker for the row at {@code pos} of this Folders list, or 0. */
    private static int fileMark(int pos, Object adapter) {
        if (!(adapter instanceof MyBaseAdapter)) return 0;
        Object o = ((MyBaseAdapter) adapter).getItem(pos);
        if (!(o instanceof File)) return 0;
        return playMark(((File) o).getPath(), adapter);
    }

    /**
     * The marker in a song list: it stands in the track number's own column, so the number is
     * blanked while it shows. Call at the END of getView — the colour it is tinted with is the one
     * the number has just been given, which is what makes it follow the theme and the focus
     * highlight.
     */
    public static void songMark(View row, int pos, Object adapter) {
        if (row == null) return;
        try {
            View mv = row.findViewById(R.id.ipp_song_mark);
            View nv = row.findViewById(R.id.tv_song_index);
            if (!(mv instanceof ImageView) || !(nv instanceof TextView)) return;
            ImageView mark = (ImageView) mv;
            TextView number = (TextView) nv;
            int res = 0;
            if (adapter instanceof MyBaseAdapter) {
                Object o = ((MyBaseAdapter) adapter).getItem(pos);
                if (o instanceof Song) res = playMark(((Song) o).getPath(), adapter);
            }
            if (res != 0) {
                mark.setImageResource(res);
                Icons.menu(mark, number.getCurrentTextColor());
                mark.setVisibility(View.VISIBLE);
                number.setText("");
            } else {
                mark.setVisibility(View.GONE);
            }
        } catch (Throwable t) {
            // ignore
        }
    }

    /**
     * The number column of an audiobook row, and the marker that stands in it.
     *
     * Both audiobook lists share {@code item_player.xml}, and neither had a column of its own —
     * which is why the number was added at all: a marker needs somewhere to be. Bookmarks get the
     * number and nothing else ({@link #bookIndex}), since a bookmark is a position in a book and
     * not a track the player can be on.
     *
     * Call at the END of getView, for the same reason the song and Folders markers are: the
     * colour it is tinted with (and the number is painted in) is the one the row's own name has
     * just been given, which is what makes both follow the theme and the focus highlight.
     */
    public static void bookMark(View row, int pos, Object adapter) {
        if (row == null) return;
        try {
            View nv = row.findViewById(R.id.ipp_book_index);
            View mv = row.findViewById(R.id.ipp_book_mark);
            if (!(nv instanceof TextView)) return;
            TextView number = (TextView) nv;
            int colour = rowColour(row);
            number.setTextColor(colour);
            int res = 0;
            if (adapter instanceof MyBaseAdapter) {
                Object o = ((MyBaseAdapter) adapter).getItem(pos);
                if (o instanceof Song) res = playMark(((Song) o).getPath(), adapter);
            }
            if (!(mv instanceof ImageView)) {
                number.setText(String.valueOf(pos + 1));
                return;
            }
            ImageView mark = (ImageView) mv;
            // Both states are written on every bind, so a recycled row can never keep another
            // book's marker — the defect the Folders marker had to be written this way for too.
            if (res != 0) {
                mark.setImageResource(res);
                Icons.menu(mark, colour);
                mark.setVisibility(View.VISIBLE);
                number.setText("");
            } else {
                mark.setVisibility(View.GONE);
                number.setText(String.valueOf(pos + 1));
            }
        } catch (Throwable t) {
            // a number and a marker are cosmetic — never take the list down for them
        }
    }

    /** The number alone, for the Bookmarks list: it shares the row but has nothing to mark. */
    public static void bookIndex(View row, int pos) {
        if (row == null) return;
        try {
            View nv = row.findViewById(R.id.ipp_book_index);
            if (!(nv instanceof TextView)) return;
            ((TextView) nv).setTextColor(rowColour(row));
            ((TextView) nv).setText(String.valueOf(pos + 1));
        } catch (Throwable t) {
            // ignore
        }
    }

    /**
     * Start the marquee that {@code makeItMarquee} could not, because the row had no width yet.
     *
     * {@code TextView.setSelected(true)} is what starts a marquee, and it only does so on the
     * TRANSITION into selected — after which {@code startMarquee} gives up unless the text is
     * already known to be wider than the view. On the FIRST fill of a list the row is bound before
     * it has ever been measured, so the width is 0, the marquee never starts, and nothing asks
     * again: the highlighted row simply stood still until the cursor was moved off it and back,
     * which rebinds a row that has a width by then. Every screen opened with the cursor already on
     * a long title showed it.
     *
     * So when the width is not there yet, ask once more after the layout that follows. Only
     * then — a bound row that already has a width has started it in the ordinary way, and this
     * costs nothing at all on the wheel path, where every row is laid out.
     */
    public static void marqueeKick(TextView tv) {
        if (tv == null || tv.getWidth() > 0) return;
        tv.post(new Kick(tv));
    }

    /** Named, not anonymous — the bundled d8 crashes dexing anonymous classes here. */
    static final class Kick implements Runnable {
        private final TextView tv;

        Kick(TextView tv) {
            this.tv = tv;
        }

        public void run() {
            try {
                // The row may have been recycled to another position in the meantime; a row that is
                // no longer the cursor has been through makeItNormal and is not selected any more.
                if (tv.getWidth() <= 0 || !tv.isSelected()) return;
                tv.setSelected(false);
                tv.setSelected(true);
            } catch (Throwable t) {
                // a title that does not scroll is not worth an exception
            }
        }
    }

    /** The colour the row's own name has just been given, white if there is no name to ask. */
    private static int rowColour(View row) {
        View name = row.findViewById(R.id.tv_name);
        return (name instanceof TextView) ? ((TextView) name).getCurrentTextColor() : 0xFFFFFFFF;
    }

    /**
     * The marker this row carries as a mipmap id, or 0 when it carries none — the single answer
     * behind both the song lists' number column and the icon slot of Folders.
     *
     * It is not one mark but the player's state, the same three the status bar distinguishes:
     * {@code ipp_play}, {@code ipp_pause}, {@code ipp_stop} (the last from the long press on the
     * play button). Read from {@code Static.playValue}, which is where every one of those states is
     * published; FM and "nothing loaded" mean this track is not what the player is on, and carry no
     * marker.
     *
     * The artwork is monochrome on purpose — it is tinted to the colour of the text beside it
     * ({@code Icons.menu}), the rule every menu icon in the mod follows.
     *
     * One condition on top of the path matching: {@link Queue#atSource} — the marker belongs only
     * to the list the track was started from. (There is deliberately no "hide the marker" setting:
     * the marker is what tells the list what is playing, and a list without it says nothing.)
     *
     * A play/pause does NOT broadcast MY_PLAY_SONG (only a track change does), so the lists are
     * repainted from {@code Static.setPlayValue} instead — see {@link Lists}.
     */
    public static int playMark(String path, Object adapter) {
        try {
            if (path == null) return 0;
            Context c = (adapter instanceof MyBaseAdapter)
                    ? ((MyBaseAdapter) adapter).getContext() : null;
            if (c == null) return 0;
            if (!Queue.atSource(adapter)) return 0;
            PlayerService s = Y1Application.Companion.getPlayerService();
            // getPlayingSong, not getPlayingMusic: an audiobook list carries the marker
            // too, and the music one must NOT while a book is playing — getPlayingMusic goes on
            // answering with the last song it held, so a music row would have marked itself.
            Song song = (s == null) ? null : s.getPlayingSong();
            if (song == null || !path.equals(song.getPath())) return 0;
            return stateIcon();
        } catch (Throwable t) {
            return 0;
        }
    }

    /** The state the status bar is showing, as the icon for a list row. */
    private static int stateIcon() {
        int state = 0;
        try {
            Object v = Static.INSTANCE.getPlayValue().getValue();
            if (v instanceof Integer) state = ((Integer) v).intValue();
        } catch (Throwable t) {
            return 0;
        }
        if (state == 1 || state == 2) return R.mipmap.ipp_play;    // music / audiobook
        if (state == 3) return R.mipmap.ipp_pause;
        if (state == 5) return R.mipmap.ipp_stop;
        return 0;                                                  // 0 nothing loaded, 4 FM
    }

    /**
     * True while this Genres row is still the one that background count was started for.
     *
     * {@code GenreListAdapter.getView} spawns a thread to count a genre's artists and albums and
     * writes the result into the row's subtitle when it finishes. That was safe while every row
     * was freshly inflated; with the row recycled, the row can be showing another genre by then,
     * and the late write would leave the wrong subtitle under it until the next rebind. getView
     * tags the subtitle with its genre, and this compares the tag by identity — the Genre objects
     * are the adapter's own list entries, so identity is exactly the right question.
     */
    public static boolean genreInfo(TextView info, Object genre) {
        return info != null && info.getTag() == genre;
    }

    /**
     * {@code setText} that does nothing when the text is already there — in place of the plain
     * {@code TextView.setText} in a row's bind.
     *
     * {@code TextView.setText} has no early-out of its own: it always drops the view's text
     * {@code Layout}, asks for a re-layout and measures the string again on the next pass. That is
     * the most expensive single thing a bind does, and the wheel spends most of its binds writing
     * text that is already on the row — moving the highlight rebinds two rows whose CONTENT has not
     * changed at all, and a row coming back into view usually gets the string it had before.
     *
     * Stock does the same comparison by hand in the main menu's adapter
     * ({@code if (!areEqual(binding.tvItem.getText(), bean)) setText(bean)}), which is where the
     * idea comes from; the song and album rows simply never got it.
     */
    public static void text(TextView tv, CharSequence s) {
        try {
            if (tv == null) return;
            CharSequence cur = tv.getText();
            if (cur == s) return;
            if (cur != null && s != null && cur.length() == s.length()
                    && cur.toString().equals(s.toString())) {
                return;
            }
            tv.setText(s);
        } catch (Throwable t) {
            if (tv != null) tv.setText(s);
        }
    }

    /**
     * Keep the row's height determined by its text, and keep the selection highlight OFF the disc
     * strip at the top of the row. Call at the END of getView, once the background and icons for
     * this row's state have been applied.
     *
     * The strip is part of the list, not of the track (see {@link com.innioasis.ipp.Disc}), so the
     * highlight starts under it instead of swallowing it. Only the first row of each disc has one.
     */
    public static void flat(View row) {
        try {
            if (row == null) return;
            int top = headerInset(row);
            Drawable d = row.getBackground();
            if (d instanceof Flat) { ((Flat) d).inset(top); return; }
            if (d != null && (top > 0 || d.getIntrinsicHeight() > 0)) {
                Flat f = new Flat(d);
                f.inset(top);                     // before attaching: bounds arrive with it
                row.setBackgroundDrawable(f);
            }
        } catch (Throwable t) {
            // row geometry is cosmetic -- never take the list down for it
        }
    }

    /**
     * Height of the row's disc strip, i.e. how much of the row's top the background must not
     * cover. Asked of {@link Disc#stripPx}, which is the single answer to that question: the strip
     * has a FIXED height in the layout, so its LayoutParams are what it is really laid out at, and
     * a second opinion here is a gap or an overlap of exactly their difference.
     *
     * Computing it from the font instead is what this used to do, and a theme with a font of its
     * own is where that breaks: at 10sp the line height of "Cupertino"'s opensans-condbold is 17
     * against the layout's 16, so the background started one pixel below the strip's bottom edge
     * and the wallpaper showed through the row as a dark line across the screen. Nothing about it
     * looks like a font problem, which is why it was chased in the theme's PNGs first.
     */
    private static int headerInset(View row) {
        View hv = row.findViewById(R.id.tv_disc_header);
        if (!(hv instanceof TextView) || hv.getVisibility() != View.VISIBLE) return 0;
        return Disc.stripPx(row);
    }

    /**
     * Same idea as {@link #flat} for a view that is not a row: keep its background from deciding
     * its height. Used for the pinned CD bar, which takes the theme's own row background and
     * would otherwise inherit that bitmap's intrinsic 640x91.
     */
    /**
     * Tag a code-built view with this and the asynchronous theme-bitmap applier will keep its
     * background from dictating a height ({@link #reflat}). The layouts do it by id; a view built
     * in code has none.
     */
    public static final String FLAT = "ipp_flat";

    /** Told (on the view's own thread) whenever a theme bitmap lands on a {@link #FLAT} view. */
    private static Runnable flatWatch;

    /** One watcher at a time — the picker dialog while it is on screen; null clears it. */
    public static void watchFlat(Runnable r) {
        flatWatch = r;
    }

    public static void noSize(View v) {
        try {
            if (v == null) return;
            Drawable d = v.getBackground();
            if (d != null && !(d instanceof Flat) && d.getIntrinsicHeight() > 0) {
                v.setBackgroundDrawable(new Flat(d));
            }
        } catch (Throwable t) {
            // cosmetic
        }
    }

    /**
     * Same, from the theme's ASYNCHRONOUS background applier
     * ({@code ThemeManager$setBackground$pair$1}). A theme bitmap that is not in the BitmapCache
     * yet is decoded on a coroutine and applied later — long after the adapter's getView, and
     * therefore unwrapped, which let the row stretch again on themes that ship an
     * {@code itemSelectedBackground} (HoloBubble / HoloFacet).
     *
     * That applier runs for every themed view in the app, so this only acts on the rows that need
     * it — song rows and album rows. The song recogniser is {@code tv_song_index}, NOT
     * {@code tv_song_name}: the Shuffle row
     * ({@code view_shuffle_playlist_item}) also has a {@code tv_song_name}, so the first version
     * wrapped its background too — and on the async path that left the row with no visible
     * background until the next wheel move re-applied it synchronously. Only
     * {@code item_songlist} carries a track-number view.
     */
    public static void reflat(View row) {
        try {
            if (row == null) return;
            // The pinned CD bar and the in-row disc strip carry the theme's row background too and
            // arrive here by the same asynchronous path, but neither is a row: the bar has no
            // track-number view to be recognised by, and flat() on the strip would find the strip
            // inside itself and inset its background away.
            int id = row.getId();
            if (id == R.id.ipp_disc_bar || id == R.id.tv_disc_header) { noSize(row); return; }
            // Views built in code carry no id to be recognised by, so they say so with a tag —
            // the picker dialog's rows (PickDialog), which have the same defect and no children of
            // their own to be identified by either. They also need telling that this happened at
            // all: a theme bitmap lands on whichever view ASKED for it, however long ago, and by
            // then that view may no longer be the one that wanted a highlight. A list survives
            // that because the next bind paints over it; a hand-painted dialog does not.
            if (FLAT.equals(row.getTag())) {
                noSize(row);
                Runnable r = flatWatch;
                if (r != null) row.post(r);
                return;
            }
            if (row.findViewById(R.id.tv_song_index) != null) { flat(row); return; }
            // An album row has the same defect and no disc strip to keep clear of. `album_name` is
            // unique to item_album.xml, the way tv_song_index is to item_songlist.xml.
            if (row.findViewById(R.id.album_name) != null) { noSize(row); return; }
            // the e-book rows, Library (item_book_library) and Local Files
            // (item_book_search). The synchronous wrap where they are bound is not the last word:
            // a theme bitmap that is not cached yet is decoded on a coroutine and applied long
            // after the bind, unwrapped, and the row stretches again. `progress` is shared with
            // view_video, which is not a row and for which this is a no-op anyway; `size` is
            // item_book_search's alone.
            if (row.findViewById(R.id.progress) != null || row.findViewById(R.id.size) != null) {
                noSize(row);
            }
        } catch (Throwable t) {
            // ignore
        }
    }

    // ------------------------------------------------------------------ applying a theme bitmap
    //
    // Stock's resource path early-outs on its own: View.setBackgroundResource returns immediately
    // when the id has not changed, and ImageView.setImageResource does the same. The theme's
    // BITMAP path has no such test — ThemeManager allocates a fresh BitmapDrawable and calls
    // setBackground() on every single bind — and View.setBackgroundDrawable then compares the old
    // and the new drawable's minimum size and calls requestLayout() whenever they differ. The Flat
    // wrapper below reports no intrinsic size while a theme bitmap reports its own, so the two
    // alternated and EVERY row bind requested a layout, twice.
    //
    // What that costs is not the request but what ListView does with it: setupChild re-MEASURES a
    // recycled row whose isLayoutRequested() is set, and these rows are ConstraintLayouts. With no
    // theme not one visible row is re-measured on a wheel click; with a theme all of them were.
    // That is the "scrolling is slower on some themes" report — the clicks then land more than
    // 200 ms apart, SpeedUtil treats the run as broken and drops its acceleration, so the same 30
    // rows take eight turns of the wheel instead of five.

    /**
     * Give a view a theme bitmap as its background, without disturbing its layout state when
     * nothing actually changed. A different bitmap is swapped INSIDE the wrapper where there is
     * one, which repaints the row and nothing more.
     */
    public static void bg(View v, Bitmap b) {
        if (v == null || b == null) return;
        try {
            Drawable cur = v.getBackground();
            if (cur instanceof Flat) {
                Flat f = (Flat) cur;
                if (f.holds(b)) return;
                f.swap(new BitmapDrawable(v.getResources(), b), 0);
                return;
            }
            if (cur instanceof BitmapDrawable && ((BitmapDrawable) cur).getBitmap() == b) return;
            v.setBackgroundDrawable(new BitmapDrawable(v.getResources(), b));
        } catch (Throwable t) {
            // a background is cosmetic — never take a list down for it
        }
    }

    /**
     * The same for ThemeManager's fallback to an APK resource. That call early-outs by itself
     * unless the view's background was last set as a Drawable — which is exactly what
     * {@link #flat} does to every song row, so the selected row re-read its resource and requested
     * a layout on every bind even with no theme at all.
     */
    public static void bgRes(View v, int resid) {
        if (v == null) return;
        try {
            Drawable cur = v.getBackground();
            // Resource 0 is not a resource: it is "this view has NO background", which is how
            // every row whose unselected state is plain transparency is painted (the e-book
            // Library and Local Files rows say exactly that). It must never be compared against
            // Flat.res, which is also 0 whenever the wrapper holds a THEME BITMAP — the two look
            // alike and the row was left wearing the selection it had just been told to drop.
            // Cost a build: the first time those rows were wrapped they stayed
            // highlighted after the cursor moved on (theme1/2/4).
            if (resid == 0) {
                if (cur != null) v.setBackgroundResource(0);
                return;
            }
            if (cur instanceof Flat) {
                Flat f = (Flat) cur;
                if (f.res == resid) return;
                Drawable d = v.getResources().getDrawable(resid);
                if (d != null) {
                    f.swap(d, resid);
                    return;
                }
            }
            v.setBackgroundResource(resid);
        } catch (Throwable t) {
            // ignore
        }
    }

    /** Same idea for an ImageView fed a theme bitmap (the row's right arrow). */
    public static void img(ImageView iv, Bitmap b) {
        if (iv == null || b == null) return;
        try {
            Drawable cur = iv.getDrawable();
            if (cur instanceof BitmapDrawable && ((BitmapDrawable) cur).getBitmap() == b) return;
            iv.setImageBitmap(b);
        } catch (Throwable t) {
            // ignore
        }
    }

    /**
     * The wrapped background: draws exactly as before, but claims no size of its own and can be
     * kept off the top {@code top} pixels of the row (the disc strip — see {@link #flat}).
     */
    static final class Flat extends Drawable {

        private Drawable d;
        private int top;
        /** The APK resource {@link #d} was built from, 0 when it is a theme bitmap. */
        int res;

        Flat(Drawable d) {
            this.d = d;
        }

        boolean holds(Bitmap b) {
            return d instanceof BitmapDrawable && ((BitmapDrawable) d).getBitmap() == b;
        }

        /**
         * Draw something else from now on. Deliberately NOT {@code View.setBackgroundDrawable}:
         * that compares minimum sizes and requests a layout, which is the cost this whole detour
         * exists to avoid. The view already holds this drawable, so invalidateSelf reaches it.
         */
        void swap(Drawable nd, int resid) {
            d = nd;
            res = resid;
            onBoundsChange(getBounds());
            invalidateSelf();
        }

        /** Leave the top {@code px} pixels of the row unpainted. Re-applied to live bounds. */
        void inset(int px) {
            if (px == top) return;
            top = px;
            onBoundsChange(getBounds());
            invalidateSelf();
        }

        public void draw(Canvas c) {
            d.draw(c);
        }

        protected void onBoundsChange(Rect b) {
            d.setBounds(b.left, b.top + top, b.right, b.bottom);
        }

        public void setAlpha(int a) {
            d.setAlpha(a);
        }

        public void setColorFilter(ColorFilter f) {
            d.setColorFilter(f);
        }

        public int getOpacity() {
            return d.getOpacity();
        }

        public int getIntrinsicWidth() {
            return -1;
        }

        public int getIntrinsicHeight() {
            return -1;
        }
    }
}
