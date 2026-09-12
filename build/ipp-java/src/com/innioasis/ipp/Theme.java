package com.innioasis.ipp;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.PixelFormat;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;

import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.theme.ThemeManager;
import com.innioasis.y1.theme.ThemeConfig;
import com.innioasis.y1.theme.config.FileConfig;

import java.io.File;

import java.util.HashMap;

/**
 * Theme helpers.
 *
 * {@link #parseColor} replaces the body of {@code ThemeManager.getColor(String)}, which called
 * {@code Color.parseColor} on every invocation with no cache at all. That method sits under
 * {@code itemSetTextColor} / {@code optionSetTextColor} / {@code menuItemSetTextColor}, i.e. it
 * runs once per TextView per bind: a single wheel click can rebind ~8 visible rows up to 11 times
 * (stock's SpeedUtil acceleration), which is a few hundred string parses per click.
 *
 * The mapping "#ffffff" -> int is a pure function of the string, so the cache never needs
 * invalidating on a theme change; it is bounded by the handful of distinct colours a config.json
 * declares. Nulls are cached too (a malformed colour must not be re-parsed on every row).
 *
 * Raw (non-generic) types: the bundled d8 crashes dexing generic Signature attrs.
 */
public final class Theme {

    private static final HashMap CACHE = new HashMap();

    /** Stock semantics: null / blank -> null, unparseable -> null, otherwise the parsed colour. */
    public static Integer parseColor(String s) {
        if (s == null) return null;
        if (CACHE.containsKey(s)) return (Integer) CACHE.get(s);
        Integer v = null;
        if (s.trim().length() != 0) {
            try {
                v = Integer.valueOf(Color.parseColor(s));
            } catch (Throwable t) {
                v = null;                      // stock returned null for an unparseable colour
            }
        }
        CACHE.put(s, v);
        return v;
    }

    // ------------------------------------------------- does the theme paint the list rows itself?

    /**
     * Is a list row's own background OPAQUE, or does the wallpaper show through it? Asked by
     * anything washed over a row — the group captions of the better-Y menu and the queue, the
     * queue's playing row — since one alpha reads as a band over a colour and as a stain over a
     * photograph.
     *
     * **The config does not answer it:** every theme declares {@code itemBackground}, and what
     * separates them is behind it — "Frutiger Aero" ships a png transparent across its whole
     * canvas, "Junji Ito" writes a colour where a file name belongs (and
     * {@code ThemeManager.setBackground} resolves a colour only in its asynchronous branch, never
     * entered for a value that is not a file), so both come out as the stock, empty
     * {@code item_no_selected}. So the row is painted and then looked at.
     */
    public static boolean rowsPainted() {
        try {
            String theme = ThemeManager.INSTANCE.getThemeName();
            // Memoised against the theme's NAME: a switch recreates the Activity, not this class.
            if (painted != null && eq(theme, paintedFor)) return painted.booleanValue();
            Context c = Y1Application.Companion.getAppContext();
            if (c == null) return false;
            if (probe == null) probe = new View(c);
            ThemeManager.INSTANCE.itemSetBackground(probe, R.drawable.item_no_selected, false);
            boolean v = opaque(probe.getBackground());
            painted = Boolean.valueOf(v);
            paintedFor = theme;
            return v;
        } catch (Throwable t) {
            return false;                      // no theme is a theme with transparent rows
        }
    }

    /**
     * The scratch row the question is asked of. Kept rather than built per call: ThemeManager
     * hands its asynchronous answer to the view that asked, so a bitmap still being decoded
     * arrives on THIS one ({@link #landed}).
     */
    private static View probe;

    private static Boolean painted;
    private static String paintedFor;
    private static Runnable watch;

    /**
     * The same question for the long-press menu's UNFOCUSED row ({@code menuItemBackground}):
     * asked by the Photos icon strip, which is a menu too and goes see-through where the theme's
     * menu rows do. Its own probe and memo; a late bitmap is reported to {@link #watchMenuRows}.
     */
    public static boolean menuRowsPainted() {
        try {
            String theme = ThemeManager.INSTANCE.getThemeName();
            if (menuPainted != null && eq(theme, menuPaintedFor)) return menuPainted.booleanValue();
            Context c = Y1Application.Companion.getAppContext();
            if (c == null) return false;
            if (menuProbe == null) menuProbe = new View(c);
            ThemeManager.INSTANCE.menuItemSetBackground(menuProbe, 0, false);
            boolean v = opaque(menuProbe.getBackground());
            menuPainted = Boolean.valueOf(v);
            menuPaintedFor = theme;
            return v;
        } catch (Throwable t) {
            return false;
        }
    }

    private static View menuProbe;
    private static Boolean menuPainted;
    private static String menuPaintedFor;
    private static Runnable menuWatch;

    /** One watcher at a time; a stale one is harmless, it holds its screen weakly. */
    public static void watchMenuRows(Runnable r) {
        menuWatch = r;
    }

    /** One watcher at a time — the screen drawing bands, while it is on screen. */
    public static void watchRows(Runnable r) {
        watch = r;
    }

    /** ...and it takes its own back, never somebody else's: two such screens can be stacked. */
    public static void unwatchRows(Runnable r) {
        if (watch == r) watch = null;
    }

    /**
     * A theme bitmap has landed on a view (the asynchronous applier, through {@code Rows.reflat}).
     * Only ours matters: until the picture is decoded the probe answers "not painted", which on a
     * cold start is what the first screen to ask is told.
     */
    static void landed(View v) {
        if (v == null) return;
        Runnable r;
        if (v == probe) {
            painted = null;
            r = watch;
        } else if (v == menuProbe) {
            menuPainted = null;
            r = menuWatch;
        } else {
            return;
        }
        // Posted: the applier is in the middle of setting backgrounds, and the watcher rebuilds a
        // screen. The probe has no window, so the Handler is explicit.
        if (r != null) new Handler(Looper.getMainLooper()).post(r);
    }

    // ------------------------------------------------- does the theme draw the file icons itself?

    /**
     * Has the theme brought its own picture for the folder / music icon of a Folders row
     * ({@code fileTypeFolder} and {@code fileTypeMusic} in its {@code config.json})?
     *
     * Asked before those icons are tinted to the colour of the label beside them, the way every
     * menu icon in the mod is: the tint is {@code SRC_IN}, which keeps the alpha and replaces
     * every colour with one — right for the stock artwork, which is a white glyph on transparent,
     * and destructive to a theme's own drawing, which may be of any number of colours. So a theme
     * that ships one keeps it exactly as drawn.
     *
     * The config is read rather than probed, which is the opposite of {@link #rowsPainted} and for
     * the opposite reason: there the answer is behind the name (a png can be transparent across
     * its whole canvas), here the name IS the answer — {@code commonSetIcon} looks up nothing else
     * before handing the picture over. The file is checked as well, because a name whose file is
     * missing falls all the way back to the stock resource, which is exactly what wants tinting.
     *
     * Memoised against the theme's NAME, which is also what makes it cheap: a config.json is
     * parsed once per theme rather than once per row.
     */
    public static boolean hasFileIcon(boolean folder) {
        try {
            String theme = ThemeManager.INSTANCE.getThemeName();
            if (!eq(theme, fileIconsFor)) {
                boolean f = false, m = false;
                if (theme != null && theme.length() != 0) {
                    File dir = new File(ThemeManager.themesPath, theme);
                    ThemeConfig cfg = ThemeManager.INSTANCE.getConfig(dir.getAbsolutePath());
                    FileConfig fc = (cfg == null) ? null : cfg.getFileConfig();
                    if (fc != null) {
                        f = shipped(dir, fc.getFolderIcon());
                        m = shipped(dir, fc.getMusicIcon());
                    }
                }
                folderIcon = f;
                musicIcon = m;
                fileIconsFor = theme;
            }
            return folder ? folderIcon : musicIcon;
        } catch (Throwable t) {
            return false;                      // unreadable config: the stock icons are what shows
        }
    }

    private static boolean folderIcon;
    private static boolean musicIcon;
    // null until asked: it can never equal a theme name, the default theme being "".
    private static String fileIconsFor;

    private static boolean shipped(File dir, String name) {
        return name != null && name.length() != 0 && new File(dir, name).exists();
    }

    /** A background that lets more than half the wallpaper through is not one. */
    private static final int HALF = 128;

    private static boolean opaque(Drawable d) {
        if (d == null) return false;
        if (d instanceof ColorDrawable) return Color.alpha(((ColorDrawable) d).getColor()) >= HALF;
        if (d instanceof BitmapDrawable) {
            Bitmap b = ((BitmapDrawable) d).getBitmap();
            if (b == null || b.isRecycled()) return false;
            if (!b.hasAlpha()) return true;
            int w = b.getWidth(), h = b.getHeight();
            if (w <= 0 || h <= 0) return false;
            // Nine points, not the whole canvas: a row's background is drawn to be uniform.
            int sum = 0;
            for (int y = 0; y < 3; y++) {
                for (int x = 0; x < 3; x++) {
                    sum += Color.alpha(b.getPixel(x * (w - 1) / 2, y * (h - 1) / 2));
                }
            }
            return sum / 9 >= HALF;
        }
        // The stock item_no_selected is a shape filled with @android:color/transparent, and says so.
        return d.getOpacity() == PixelFormat.OPAQUE;
    }

    private static boolean eq(String a, String b) {
        return a == null ? b == null : a.equals(b);
    }

    // ------------------------------------------------------- the theme gallery (ThemeListActivity)

    /** {@code item_theme.xml}'s own colours: the caption's white and the frame's blue. */
    private static final int TILE_TEXT = 0xCCFFFFFF;
    private static final int TILE_FRAME = 0xFF36C6FF;

    /**
     * The caption under a cover, in the theme's list-row colour — the answer the tiles of Photos
     * take ({@link Photos#name}); the layout's white when the theme names no colour.
     */
    public static void tileName(TextView tv) {
        if (tv == null) return;
        try {
            ThemeManager.INSTANCE.itemSetTextColor(tv, TILE_TEXT, false);
        } catch (Throwable t) {
            // the layout's white stays
        }
    }

    /** The frame around the cover under the cursor: the timeline's colour, stock blue without one. */
    public static int tileFrame() {
        int c = Icons.progressColor();
        return c == 0 ? TILE_FRAME : c;
    }

    /**
     * How much wider the frame is than the cover. **Even on purpose:** the cover is centred in it,
     * so an odd difference is split 3 and 2 and the frame comes out thicker on the top and left —
     * which reads as the cover jumping a pixel when the cursor lands on it.
     */
    private static final int TILE_INSET = 6;

    /**
     * The caption's height as a multiple of its type size — fixed so the rows stand in the same
     * place under every theme, since the theme supplies the font and a line is as tall as the font
     * says. The COVER takes what is left. A face taller than this is cropped symmetrically.
     */
    private static final float CAPTION = 1.35f;

    private static int fitFor = -1;
    private static int fitSide;

    /**
     * Sizes the cover so exactly two rows of "cover plus caption" fill the screen: the screen less
     * the status bar (what {@code BaseActivity} gives the content), halved, less the caption and
     * the row's margins. Code rather than a dimen — the 320x240 device has both smaller.
     */
    public static void tileFit(View frame, View card, TextView caption) {
        if (frame == null || card == null || caption == null) return;
        try {
            Context c = caption.getContext();
            int avail = c.getResources().getDisplayMetrics().heightPixels
                    - (int) c.getResources().getDimension(R.dimen.status_bar_height);
            int cap = Math.round(caption.getTextSize() * CAPTION);
            int gaps = 0;
            View row = (View) caption.getParent();
            if (row != null && row.getLayoutParams() instanceof ViewGroup.MarginLayoutParams) {
                ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) row.getLayoutParams();
                gaps = lp.topMargin + lp.bottomMargin;
            }
            int key = avail * 1000 + cap;
            if (key != fitFor) {
                fitFor = key;
                fitSide = avail / 2 - cap - gaps;
            }
            if (fitSide <= 0) return;
            // With includeFontPadding on (the default) a line is as tall as the font's top..bottom
            // rather than its ascent..descent — one more thing the theme's font would move.
            caption.setIncludeFontPadding(false);
            height(caption, cap);
            side(frame, fitSide);
            side(card, fitSide - TILE_INSET);
        } catch (Throwable t) {
            // the layout's own 140/135 stays
        }
    }

    /**
     * The odd pixel of an odd screen goes into the list's top padding, so the visible area is an
     * exact number of rows and a step is exactly a row; both {@code Wheel.scrollTo} and the layout
     * manager measure their edges from that padding. Must be called from {@code initView}, BEFORE
     * the first layout: applied later it moves the edge but not the rows.
     */
    public static void tileGrid(RecyclerView rv) {
        if (rv == null) return;
        try {
            int avail = rv.getResources().getDisplayMetrics().heightPixels
                    - (int) rv.getResources().getDimension(R.dimen.status_bar_height);
            rv.setPadding(rv.getPaddingLeft(), avail % 2, rv.getPaddingRight(), rv.getPaddingBottom());
        } catch (Throwable t) {
            // the list keeps the padding from its layout
        }
    }

    /** A square of {@code px}, and nothing at all when the view already is one: a write is a layout. */
    private static void side(View v, int px) {
        ViewGroup.LayoutParams lp = v.getLayoutParams();
        if (lp == null || (lp.width == px && lp.height == px)) return;
        lp.width = px;
        lp.height = px;
        v.setLayoutParams(lp);
    }

    private static void height(View v, int px) {
        ViewGroup.LayoutParams lp = v.getLayoutParams();
        if (lp == null || lp.height == px) return;
        lp.height = px;
        v.setLayoutParams(lp);
    }

    /**
     * Tags the cover as stock did, and empties a tile that has come back for a DIFFERENT theme —
     * otherwise the previous theme's picture sat there until Glide answered. A tile rebound for the
     * same theme keeps its picture, or the cursor passing over it would flicker in its own right.
     */
    public static void tileCover(ImageView iv, String path) {
        if (iv == null) return;
        Object was = iv.getTag();
        if (was == null || !was.equals(path)) iv.setImageDrawable(null);
        iv.setTag(path);
    }
}
