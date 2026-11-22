package com.innioasis.ipp;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;
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
import java.util.List;

/**
 * List rows: their markers, number column and height. A {@code wrap_content} row is at least as
 * tall as its background, and the selection bitmaps are taller than the text — so the cursor row
 * grew and, recycled, stayed grown. {@link #flat} wraps the background in a drawable with no
 * intrinsic size, so the text alone decides the height.
 */
public final class Rows {

    /**
     * A recycled All-audiobooks row back to unselected: the missing else-branch of a getView that
     * now honours {@code convertView}. Stock's own background (0) stays.
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
        }
    }

    /**
     * A recycled Folders row back to unselected, at the START of {@code FileListAdapter.getView}:
     * stock paints only the selected state. Undoes exactly the four things it changes.
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
        }
    }

    /**
     * One half of the multi-select blink, in place of stock's bare {@code itemSetBackground}. The
     * arrow blinks too — a theme's arrow picture can carry the selection colour. VISIBLE ↔
     * INVISIBLE only: GONE means "no arrow", and INVISIBLE keeps the row still. {@code res} is the
     * caller's, unchanged.
     */
    public static void blink(View row, int res, boolean on) {
        try {
            if (row == null) return;
            // under a travelling bar the bar blinks, and the row has no background to toggle
            if (Bar.blink(row, on)) return;
            // a grid tile blinks its frame
            View frame = row.findViewById(R.id.img_sel);
            if (frame instanceof androidx.cardview.widget.CardView) {
                ((androidx.cardview.widget.CardView) frame).setCardBackgroundColor(
                        on ? Theme.tileFrame() : 0);
                PlGrid.blinkEdge(row, on);
                return;
            }
            ThemeManager.INSTANCE.itemSetBackground(row, res, on);
            // the text goes with the background: selected-colour text on a plain row is
            // invisible on a light theme, the whole row blinked out
            android.content.res.Resources rs = row.getResources();
            blinkText(row, rs.getColor(on ? R.color.selected_text_color : R.color.white), on);
            View a = arrowOf(row);
            if (a == null) return;
            if (on) {
                if (a.getVisibility() == View.INVISIBLE) a.setVisibility(View.VISIBLE);
            } else {
                if (a.getVisibility() == View.VISIBLE) a.setVisibility(View.INVISIBLE);
            }
        } catch (Throwable t) {
        }
    }

    /**
     * Every text of the row in the theme's colour for that half of the blink, and the playing
     * marker tinted after it. Not the disc strip, which keeps its own colour.
     */
    private static void blinkText(View v, int color, boolean on) {
        if (v instanceof TextView) {
            if (v.getId() != R.id.tv_disc_header) {
                ThemeManager.INSTANCE.itemSetTextColor((TextView) v, color, on);
            }
            return;
        }
        if (!(v instanceof ViewGroup)) return;
        ViewGroup g = (ViewGroup) v;
        for (int i = 0; i < g.getChildCount(); i++) blinkText(g.getChildAt(i), color, on);
        View m = g.findViewById(R.id.ipp_song_mark);
        View n = g.findViewById(R.id.tv_song_index);
        if (m instanceof ImageView && n instanceof TextView && m.getVisibility() == View.VISIBLE) {
            Icons.menu((ImageView) m, ((TextView) n).getCurrentTextColor());
        }
    }

    /** A Videos row's name: the extension is cut for FILES only ({@code LOST.DIR} stays whole). */
    public static String fileLabel(File f) {
        if (f == null) return "";
        String n = f.getName();
        if (f.isDirectory()) return n;
        return SharedPreferencesUtils.INSTANCE.processFileExtensions(n);
    }

    /** The right arrow, on the row or its parent (Videos paints a child of the item). */
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
     * The playing marker in Folders, in the file icon's box; the icon goes INVISIBLE so the name
     * stays put. At the END of getView, tinted like the name. Both states on every bind: recycled.
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
        }
    }

    /** The marker for the row at {@code pos} of this Folders list, or 0. */
    private static int fileMark(int pos, Object adapter) {
        if (!(adapter instanceof MyBaseAdapter)) return 0;
        Object o = ((MyBaseAdapter) adapter).getItem(pos);
        if (!(o instanceof File)) return 0;
        return playMark(((File) o).getPath(), adapter);
    }

    /** The marker in a song list, in the number's column. END of getView, tinted like the number. */
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
        }
    }

    /** An audiobook row's number column and its marker. END of getView, tinted like the name. */
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
        }
    }

    /** The number alone, for the Bookmarks list: a bookmark is never "playing". */
    public static void bookIndex(View row, int pos) {
        if (row == null) return;
        try {
            View nv = row.findViewById(R.id.ipp_book_index);
            if (!(nv instanceof TextView)) return;
            ((TextView) nv).setTextColor(rowColour(row));
            ((TextView) nv).setText(String.valueOf(pos + 1));
        } catch (Throwable t) {
        }
    }

    /** The colour the row's own name has just been given, white if there is no name to ask. */
    private static int rowColour(View row) {
        View name = row.findViewById(R.id.tv_name);
        return (name instanceof TextView) ? ((TextView) name).getCurrentTextColor() : 0xFFFFFFFF;
    }

    /**
     * The row's marker as a mipmap id, or 0: the player's state as the status bar shows it
     * (play/pause/stop, from {@code Static.playValue}), only in the source list. A play/pause
     * broadcasts nothing, so {@link Lists} repaints from {@code setPlayValue}.
     */
    public static int playMark(String path, Object adapter) {
        try {
            if (path == null) return 0;
            Context c = (adapter instanceof MyBaseAdapter)
                    ? ((MyBaseAdapter) adapter).getContext() : null;
            if (c == null) return 0;
            if (!Queue.atSource(adapter)) return 0;
            PlayerService s = Y1Application.Companion.getPlayerService();
            // getPlayingSong: getPlayingMusic keeps answering with the last song long after
            Song song = (s == null) ? null : s.getPlayingSong();
            if (song == null || !path.equals(song.getPath())) return 0;
            return stateIcon();
        } catch (Throwable t) {
            return 0;
        }
    }

    /** The state the status bar is showing, as the icon for a list row. */
    public static int stateIcon() {
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
     * This Genres row still shows the genre its background count was started for — recycled, it
     * may not. The tag is compared by identity: the adapter's own Genre objects.
     */
    public static boolean genreInfo(TextView info, Object genre) {
        return info != null && info.getTag() == genre;
    }

    /**
     * {@code setText} that does nothing when the text is already there: {@code setText} always
     * re-lays out, and most wheel binds write the text the row already has.
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

    private static final int INDEX_GAP_DIP = 8;
    private static final int INDEX_MIN_DIP = 40;
    private static final int INDEX_MAX_DIP = 120;

    private static Object indexFont;     // the Typeface the measurements below were taken with
    private static float indexSize;
    private static float indexDigit;     // the widest digit: not all equal in every font
    private static float indexHash;      // "#"

    /**
     * The number column, sized for the widest number THIS list shows ({@link Disc#widestIndex}),
     * in the row's font. Always an EXACT width, never {@code wrap_content}: the marquee would grow
     * it. Re-lays out only when the width really changes.
     */
    public static void indexWidth(TextView tv, List songs, Object adapter) {
        if (tv == null) return;
        try {
            Object font = tv.getTypeface();
            float size = tv.getTextSize();
            if (font != indexFont || size != indexSize) {
                android.text.TextPaint p = tv.getPaint();
                float w = 0f;
                for (char c = '0'; c <= '9'; c++) {
                    float cw = p.measureText(String.valueOf(c));
                    if (cw > w) w = cw;
                }
                indexDigit = w;
                indexHash = p.measureText("#");
                indexSize = size;
                indexFont = font;
            }
            float need = indexDigit * Disc.widestIndex(songs, adapter);
            if (indexHash > need) need = indexHash;

            float d = tv.getResources().getDisplayMetrics().density;
            int px = (int) (need + 0.5f) + (int) (INDEX_GAP_DIP * d + 0.5f);
            int min = (int) (INDEX_MIN_DIP * d + 0.5f);
            int max = (int) (INDEX_MAX_DIP * d + 0.5f);
            if (px < min) px = min;
            if (px > max) px = max;

            ViewGroup.LayoutParams lp = tv.getLayoutParams();
            if (lp == null || lp.width == px) return;
            lp.width = px;
            tv.setLayoutParams(lp);
        } catch (Throwable t) {
        }
    }

    /**
     * A row's SECOND line takes the colour its first came out in — read off the view, since
     * {@code itemSetTextColor} answers with the theme's colour, not the one asked for.
     */
    public static void subLine(TextView main, TextView sub) {
        if (main == null || sub == null) return;
        try {
            sub.setTextColor(main.getCurrentTextColor());
        } catch (Throwable t) {
        }
    }

    /** The duration under a video's name, in the Videos list and inside its playlists. */
    public static void videoSub(com.innioasis.y1.databinding.ItemVideoBinding b) {
        if (b == null) return;
        subLine(b.videoName, b.videoTime);
    }

    /**
     * The value at the end of an FM menu row, coloured like a second line. Takes the BINDING: the
     * register holding the view is reused before that bind ends.
     */
    public static void fmMenuValue(com.innioasis.y1.databinding.ItemFmMenuBinding b) {
        if (b == null) return;
        subLine(b.tvItem, b.text);
    }

    /**
     * The row's height from its text, and the highlight kept OFF the disc strip, which belongs to
     * the list. END of getView.
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
        }
    }

    /**
     * The strip's height, from {@link Disc#stripPx} — never from the font: a theme font's line
     * height differs by a pixel and the wallpaper shows through as a line.
     */
    private static int headerInset(View row) {
        View hv = row.findViewById(R.id.tv_disc_header);
        if (!(hv instanceof TextView) || hv.getVisibility() != View.VISIBLE) return 0;
        return Disc.stripPx(row);
    }

    /** Tag for a code-built view, so {@link #reflat} recognises it — it has no id. */
    public static final String FLAT = "ipp_flat";

    /** Told (on the view's own thread) whenever a theme bitmap lands on a {@link #FLAT} view. */
    private static Runnable flatWatch;

    /** One watcher at a time — the picker dialog while it is on screen; null clears it. */
    public static void watchFlat(Runnable r) {
        flatWatch = r;
    }

    /** {@link #flat} for a view that is not a row: its background must not decide its height. */
    public static void noSize(View v) {
        try {
            if (v == null) return;
            Drawable d = v.getBackground();
            if (d != null && !(d instanceof Flat) && d.getIntrinsicHeight() > 0) {
                v.setBackgroundDrawable(new Flat(d));
            }
        } catch (Throwable t) {
        }
    }

    /**
     * Same, from the theme's ASYNCHRONOUS applier ({@code ThemeManager$setBackground$pair$1}): an
     * uncached bitmap lands long after getView, unwrapped. It runs for every themed view, so rows
     * are recognised: songs by {@code tv_song_index} — NOT {@code tv_song_name}, which the Shuffle
     * row has too.
     */
    public static void reflat(View row) {
        try {
            if (row == null) return;
            // the one place that hears "a theme bitmap has landed"
            Theme.landed(row);
            if (Bar.landed(row)) return;
            // not rows: flat() on the strip would inset its own background away
            int id = row.getId();
            if (id == R.id.ipp_disc_bar || id == R.id.tv_disc_header) { noSize(row); return; }
            // A code-built view says so with a tag, and is told: a late bitmap may land after its
            // highlight moved, and no next bind paints over a hand-painted dialog.
            if (FLAT.equals(row.getTag())) {
                noSize(row);
                Runnable r = flatWatch;
                if (r != null) row.post(r);
                return;
            }
            if (row.findViewById(R.id.tv_song_index) != null) { flat(row); return; }
            if (row.findViewById(R.id.album_name) != null) { noSize(row); return; }
            // the e-book rows (Library, Local Files)
            if (row.findViewById(R.id.progress) != null || row.findViewById(R.id.size) != null) {
                noSize(row);
            }
        } catch (Throwable t) {
        }
    }

    // Stock's theme BITMAP path sets a fresh drawable on every bind, and alternating with the Flat
    // wrapper's size requested a layout each time — every visible row re-measured per wheel click,
    // slow enough to break SpeedUtil's acceleration on themed screens.

    /** A theme bitmap as background ({@link Ends}), untouched when unchanged; swapped INSIDE a wrapper. */
    public static void bg(View v, Bitmap b) {
        if (v == null || b == null) return;
        try {
            Drawable cur = v.getBackground();
            if (cur instanceof Flat) {
                Flat f = (Flat) cur;
                if (f.holds(b)) return;
                // a bar's row: the bar blanks it again right after, so nothing is built for it
                if (f.res == BLANK && Bar.owns(v)) return;
                Drawable d = f.spareFor(b);
                f.swap(d != null ? d : Ends.of(v.getResources(), b), 0);
                return;
            }
            if (cur instanceof BitmapDrawable && ((BitmapDrawable) cur).getBitmap() == b) return;
            v.setBackgroundDrawable(Ends.of(v.getResources(), b));
        } catch (Throwable t) {
        }
    }

    /**
     * The same for an APK resource: stock's early-out fails once {@link #flat} has set a Drawable.
     */
    public static void bgRes(View v, int resid) {
        if (v == null) return;
        try {
            Drawable cur = v.getBackground();
            // 0 is "NO background", and must never be compared against Flat.res, which is also 0
            // for a THEME BITMAP: the row kept its selection (cost a build).
            if (resid == 0) {
                // a row under a travelling Bar is blank already, and must stay wrapped
                if (cur instanceof Flat && ((Flat) cur).res == BLANK) return;
                if (cur != null) v.setBackgroundResource(0);
                return;
            }
            if (cur instanceof Flat) {
                Flat f = (Flat) cur;
                if (f.res == resid) return;
                // a new GradientDrawable per bind is a Paint with a finalizer each time
                Drawable d = f.spareFor(resid);
                if (d == null) d = Ends.drawable(v.getResources(), resid);
                if (d != null) {
                    f.swap(d, resid);
                    return;
                }
            }
            if (!Ends.res(v, resid)) v.setBackgroundResource(resid);
        } catch (Throwable t) {
        }
    }

    /** {@link Flat#res} of a row a {@link Bar} paints: the wrapper holds nothing. */
    static final int BLANK = -1;

    private static final java.util.WeakHashMap IMG_SPARE = new java.util.WeakHashMap();

    /** Same idea for an ImageView fed a theme bitmap (the row's right arrow). */
    public static void img(ImageView iv, Bitmap b) {
        if (iv == null || b == null) return;
        try {
            Drawable cur = iv.getDrawable();
            if (cur instanceof BitmapDrawable && ((BitmapDrawable) cur).getBitmap() == b) return;
            // the arrow alternates between two bitmaps, cursor and plain: keep the other one
            Object sp = IMG_SPARE.get(iv);
            if (cur instanceof BitmapDrawable) IMG_SPARE.put(iv, cur);
            if (sp instanceof BitmapDrawable && ((BitmapDrawable) sp).getBitmap() == b) {
                iv.setImageDrawable((Drawable) sp);
                return;
            }
            iv.setImageBitmap(b);
        } catch (Throwable t) {
        }
    }

    /**
     * The album row's cover, in place of {@code setImageBitmap}: that call builds a BitmapDrawable,
     * its Paint, bounds and callback reference on every bind. The row keeps one {@link Pic} and
     * only its bitmap changes; a new size goes through the ImageView again, as it must be refitted.
     */
    public static void thumb(ImageView iv, Bitmap b) {
        if (iv == null) return;
        try {
            Drawable cur = iv.getDrawable();
            if (b != null && cur instanceof Pic) {
                Pic p = (Pic) cur;
                if (p.b == b) return;
                if (p.b != null && p.b.getWidth() == b.getWidth() && p.b.getHeight() == b.getHeight()) {
                    p.b = b;
                    p.invalidateSelf();
                    return;
                }
            }
            if (b == null) {
                iv.setImageBitmap(null);
                return;
            }
            Pic p = cur instanceof Pic ? (Pic) cur : new Pic();
            p.b = b;
            p.density = iv.getResources().getDisplayMetrics().densityDpi;
            if (cur == p) iv.setImageDrawable(null);
            iv.setImageDrawable(p);
        } catch (Throwable t) {
            iv.setImageBitmap(b);
        }
    }

    /** A bitmap drawn filtered, as BitmapDrawable draws it, that can be handed another one. */
    static final class Pic extends Drawable {
        Bitmap b;
        // the resources' density, as setImageBitmap's BitmapDrawable scales the bitmap to it
        int density;
        private final Paint paint = new Paint(Paint.FILTER_BITMAP_FLAG | Paint.DITHER_FLAG);

        public void draw(Canvas c) {
            Bitmap x = b;
            if (x != null && !x.isRecycled()) c.drawBitmap(x, null, getBounds(), paint);
        }

        public void setAlpha(int a) {
            paint.setAlpha(a);
            invalidateSelf();
        }

        public void setColorFilter(ColorFilter f) {
            paint.setColorFilter(f);
            invalidateSelf();
        }

        public int getOpacity() {
            return android.graphics.PixelFormat.TRANSLUCENT;
        }

        public int getIntrinsicWidth() {
            return b == null ? -1 : b.getScaledWidth(density);
        }

        public int getIntrinsicHeight() {
            return b == null ? -1 : b.getScaledHeight(density);
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

        Drawable inner() {
            return d;
        }

        boolean holds(Bitmap b) {
            return d instanceof BitmapDrawable && ((BitmapDrawable) d).getBitmap() == b;
        }

        /** The theme bitmap drawn before the current one: a row's cursor and plain look alternate. */
        private BitmapDrawable spare;

        BitmapDrawable spareFor(Bitmap b) {
            return spare != null && spare.getBitmap() == b ? spare : null;
        }

        /** The APK resource drawn before the current one, kept for the same reason as {@link #spare}. */
        private Drawable spareRes;
        private int spareResId;

        Drawable spareFor(int resid) {
            return spareRes != null && spareResId == resid ? spareRes : null;
        }

        /** Draw something else, NOT via {@code setBackgroundDrawable}, which requests a layout. */
        void swap(Drawable nd, int resid) {
            if (d != nd && res > 0) {
                spareRes = d;
                spareResId = res;
            } else if (d instanceof BitmapDrawable && d != nd) spare = (BitmapDrawable) d;
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
