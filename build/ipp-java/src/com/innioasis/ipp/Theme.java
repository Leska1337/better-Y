package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
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

import androidx.cardview.widget.CardView;
import androidx.recyclerview.widget.RecyclerView;

import com.blankj.utilcode.util.AppUtils;
import com.innioasis.music.objects.Constant;
import com.innioasis.y1.R;
import com.innioasis.y1.activity.SplashActivity;
import com.innioasis.y1.activity.theme.ThemeListActivity;
import com.innioasis.y1.databinding.ItemSettingBinding;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.theme.ThemeManager;
import com.innioasis.y1.theme.ThemeConfig;
import com.innioasis.y1.theme.config.FileConfig;
import com.innioasis.y1.theme.config.MenuConfig;
import com.innioasis.y1.theme.util.BitmapCache;
import com.innioasis.y1.utils.SDReceiver;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import kotlin.Lazy;

/**
 * Theme questions and theme-coloured bits of stock screens (tiles, Brightness, the theme gallery).
 * {@link #parseColor} is the body of {@code ThemeManager.getColor}, cached: it runs per TextView
 * per bind, hundreds of parses a wheel click. A pure function of the string, so never invalidated.
 */
public final class Theme {

    private static final HashMap CACHE = new HashMap();

    /**
     * In place of stock's {@code isSdcard} in {@code ThemeManager.checkThemeValid}. That one asks
     * StatFs of the mount point, which answers for the filesystem UNDER it while vold is still
     * checking the card at boot (20 s on a large library) — the theme's config.json is missing
     * then, and the theme was reset. Here the card counts only once it is in /proc/mounts.
     */
    /**
     * The splash's wait in {@code ThemeManager.loadConfig}: a theme or a Key tone sound of the
     * card's is waited for until the card is really mounted. The library ({@link Albums#bootReady})
     * and, with neither of those, the card are waited for within the library's bound.
     */
    public static boolean bootReady() {
        try {
            String theme = ThemeManager.INSTANCE.getThemeName();
            Context c = Y1Application.Companion.getAppContext();
            boolean card = theme != null && theme.length() > 0
                    || c != null && Prefs.getString(c, Tone.KEY_SOUND, "").length() > 0;
            // asked first: it starts the read, which runs while the card is still being checked
            boolean library = Albums.bootReady();
            // the card too, within the library's bound: a scan at the mount starts while the splash
            // is up, and the main menu, opened right after, shows its window (stock looks for 6 s)
            boolean mounted = cardMounted() || !card && Albums.bootWaitOver();
            return mounted && library;
        } catch (Throwable t) {
            return cardMounted();
        }
    }

    public static boolean cardMounted() {
        if (!SDReceiver.Companion.isSdcard()) return false;
        BufferedReader in = null;
        try {
            in = new BufferedReader(new FileReader("/proc/mounts"));
            String root = " " + Constant.ROOT_PATH + " ";
            for (String l = in.readLine(); l != null; l = in.readLine()) {
                if (l.indexOf(root) >= 0) return true;
            }
            return false;
        } catch (Throwable t) {
            return false;
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (Throwable t) {
                }
            }
        }
    }

    private static final WeakHashMap SCREENS = new WeakHashMap();

    /** From {@code BaseActivity.onCreate}. */
    public static void created(Activity a) {
        SCREENS.put(a, Boolean.TRUE);
    }

    /** Every screen still alive. */
    static Object[] screens() {
        return SCREENS.keySet().toArray();
    }

    /**
     * In place of stock's {@code relaunchApp} once the theme is changed: the screens start over from
     * the splash, which loads the new theme, while the process keeps its library and playback. What
     * the process holds of the old theme is dropped first; failing that, the process is relaunched.
     * Every screen is finished by hand: FLAG_ACTIVITY_CLEAR_TASK closes nothing here, and the
     * singleTask main menu would come back as the old instance, in the old font and on the old row.
     */
    public static void relaunch() {
        try {
            forgetBitmaps();
            MenuStyle.themeChanged();
            Icons.themeChanged();
            Saver.themeChanged();
            Context c = Y1Application.Companion.getAppContext();
            Intent i = new Intent(c, SplashActivity.class);
            i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            c.startActivity(i);
            Object[] old = SCREENS.keySet().toArray();
            SCREENS.clear();
            for (int k = 0; k < old.length; k++) {
                Activity a = (Activity) old[k];
                if (a != null && !(a instanceof SplashActivity) && !a.isFinishing()) a.finish();
            }
            Diag.note("theme: " + ThemeManager.INSTANCE.getThemeName() + ", screens restarted");
        } catch (Throwable t) {
            Diag.note("Theme.relaunch: " + t);
            AppUtils.relaunchApp(true);
        }
    }

    /**
     * Stock keys the theme's pictures by role ("itemBackground"), not by theme, and does not clear
     * them at all on the way to no theme; its {@code clear()} parks them in weak references that
     * still answer.
     */
    private static void forgetBitmaps() throws Exception {
        Field f = ThemeManager.class.getDeclaredField("bitmapCache$delegate");
        f.setAccessible(true);
        BitmapCache cache = (BitmapCache) ((Lazy) f.get(null)).getValue();
        cache.clear();
        Field weak = BitmapCache.class.getDeclaredField("weakCache");
        weak.setAccessible(true);
        ((Map) weak.get(cache)).clear();
    }

    /** Stock semantics: null / blank / unparseable -> null. Nulls are cached too. */
    public static Integer parseColor(String s) {
        if (s == null) return null;
        if (CACHE.containsKey(s)) return (Integer) CACHE.get(s);
        Integer v = null;
        if (s.trim().length() != 0) {
            try {
                v = Integer.valueOf(Color.parseColor(s));
            } catch (Throwable t) {
                v = null;
            }
        }
        CACHE.put(s, v);
        return v;
    }

    /**
     * Is a list row's background OPAQUE? Asked by anything washed over a row: one alpha is a band
     * over a colour and a stain over a photograph. The config cannot answer (a fully transparent
     * png, a colour where a file name belongs), so a probe row is painted and looked at.
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
            return false;
        }
    }

    /** The unfocused row's background when it is opaque, else null. */
    public static android.graphics.drawable.Drawable rowBackground() {
        return rowsPainted() && probe != null ? probe.getBackground() : null;
    }

    /** Kept: a bitmap still decoding arrives later on THIS view ({@link #landed}). */
    private static View probe;

    private static Boolean painted;
    private static String paintedFor;
    private static Runnable watch;

    /** The same for the menu's unfocused row ({@code menuItemBackground}), for the Photos strip. */
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

    /** One watcher at a time; a stale one holds its screen weakly. */
    public static void watchMenuRows(Runnable r) {
        menuWatch = r;
    }

    /** One watcher at a time: the screen drawing bands. */
    public static void watchRows(Runnable r) {
        watch = r;
    }

    /** Only its own: two such screens can be stacked. */
    public static void unwatchRows(Runnable r) {
        if (watch == r) watch = null;
    }

    /**
     * A theme bitmap landed on a view ({@code Rows.reflat}). Only the probes matter: until then
     * they answer "not painted", which is what the first screen on a cold start was told.
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
        // Posted: the applier is mid-way through setting backgrounds. The probe has no window.
        if (r != null) new Handler(Looper.getMainLooper()).post(r);
    }

    /**
     * Has the theme shipped its own Folders folder / music icon? Then it is not tinted — SRC_IN
     * would flatten a multicolour drawing. Read from the config (the name IS the answer here),
     * checking the file exists; memoised per theme name.
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
            return false;
        }
    }

    private static boolean folderIcon;
    private static boolean musicIcon;
    // null until asked: it can never equal a theme name, the default theme being "".
    private static String fileIconsFor;

    /** {@code item_selected_submenu}: the menu highlight with no theme, or none named. */
    private static final int MENU_SEL_STOCK = 0xFF00F5FF;

    /**
     * {@code menuItemSelectedBackground}: its colour, stock's when none, 0 for a picture. From the
     * config: ThemeManager never applies a colour there, so a probe would answer stock.
     */
    public static int menuSelectedColor() {
        try {
            String theme = ThemeManager.INSTANCE.getThemeName();
            if (!eq(theme, menuSelFor)) {
                int v = MENU_SEL_STOCK;
                if (theme != null && theme.length() != 0) {
                    File dir = new File(ThemeManager.themesPath, theme);
                    ThemeConfig cfg = ThemeManager.INSTANCE.getConfig(dir.getAbsolutePath());
                    MenuConfig mc = (cfg == null) ? null : cfg.getMenuConfig();
                    String s = (mc == null) ? null : mc.getMenuItemSelectedBackground();
                    if (shipped(dir, s)) {
                        v = 0;
                    } else if (s != null) {
                        Integer c = parseColor(s);
                        if (c != null) v = c.intValue();
                    }
                }
                menuSel = v;
                menuSelFor = theme;
            }
            return menuSel;
        } catch (Throwable t) {
            return MENU_SEL_STOCK;
        }
    }

    private static int menuSel;
    private static String menuSelFor;

    private static boolean shipped(File dir, String name) {
        return name != null && name.length() != 0 && new File(dir, name).exists();
    }

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

    /** The layouts' focus colour, when the theme names none. */
    private static final int ACCENT = 0xFF3CFFDE;

    /** The wallpaper gallery's focused tile, framed as in Photos; the CardView's background IS it. */
    public static void focusCard(CardView card) {
        if (card == null) return;
        try {
            card.setCardBackgroundColor(Photos.focus(card.getContext()));
        } catch (Throwable t) {
        }
    }

    /** The colour a focused row's text takes: the focus frame of the Photos and wallpaper tiles. */
    static int focusColor(android.content.Context c) {
        TextView probe = new TextView(c);
        ThemeManager.INSTANCE.itemSetTextColor(probe, ACCENT, true);
        return probe.getCurrentTextColor();
    }

    /** An {@code item_setting.xml} row as stock Settings paints it; {@code sel} as its background. */
    public static void settingRow(ItemSettingBinding vb, boolean sel) {
        if (vb == null) return;
        try {
            int c = sel ? ACCENT : 0xFFFFFFFF;
            ThemeManager.INSTANCE.itemSetTextColor(vb.title, c, sel);
            ThemeManager.INSTANCE.itemSetTextColor(vb.text, c, sel);
            // the arrow only under the cursor, as in Settings; INVISIBLE keeps the label's width
            if (!sel && vb.arrow.getVisibility() == android.view.View.VISIBLE) {
                vb.arrow.setVisibility(android.view.View.INVISIBLE);
            }
        } catch (Throwable t) {
        }
    }

    /** Stock's {@code #65ffffff} track. */
    private static final int TRACK_ALPHA = 0x65;

    /** The Brightness bar in the timeline's colour, its track (a bare sibling View) too. */
    public static void brightnessBar(android.widget.ProgressBar pb) {
        try {
            if (pb == null) return;
            int c = Icons.progressColor();
            if (c == 0) return;
            float r = 10f * pb.getResources().getDisplayMetrics().density;
            android.graphics.drawable.GradientDrawable bg = new android.graphics.drawable.GradientDrawable();
            bg.setCornerRadius(r);
            bg.setColor(0);
            android.graphics.drawable.GradientDrawable fill = new android.graphics.drawable.GradientDrawable();
            fill.setCornerRadius(r);
            fill.setColor(c | 0xFF000000);
            android.graphics.drawable.ClipDrawable clip = new android.graphics.drawable.ClipDrawable(
                    fill, android.view.Gravity.LEFT, android.graphics.drawable.ClipDrawable.HORIZONTAL);
            android.graphics.drawable.LayerDrawable ld = new android.graphics.drawable.LayerDrawable(
                    new Drawable[]{bg, clip});
            ld.setId(0, android.R.id.background);
            ld.setId(1, android.R.id.progress);
            pb.setProgressDrawable(ld);
            if (pb.getParent() instanceof ViewGroup) {
                ViewGroup p = (ViewGroup) pb.getParent();
                for (int i = 0; i < p.getChildCount(); i++) {
                    View v = p.getChildAt(i);
                    if (v.getClass() == View.class) {
                        v.setBackgroundColor((c & 0x00FFFFFF) | (TRACK_ALPHA << 24));
                    }
                }
            }
        } catch (Throwable t) {
        }
    }

    /** The gallery that has had its hint already: once per entry, not per reload of the list. */
    private static WeakReference tipped;

    /**
     * The gallery's hint, from {@code ThemeListActivity$toPathFolder$2$1} right after its loading
     * window closes. Not while a theme is still being copied: its own window is up, and the list
     * is loaded again when it ends.
     */
    public static void tip(Activity a) {
        try {
            if (a == null || ThemeManager.INSTANCE.isRunCopyTheme()) return;
            if (tipped != null && tipped.get() == a) return;
            tipped = new WeakReference(a);
            TipDialog.show(a, "themes_tip", "themes_hint_off");
        } catch (Throwable t) {
        }
    }

    /**
     * The theme gallery's full-screen preview has no backdrop, so the grid hides under it —
     * INVISIBLE, keeping its layout and scroll position.
     */
    public static void fullShown(View full) {
        try {
            if (full == null || !(full.getParent() instanceof View)) return;
            View grid = ((View) full.getParent()).findViewById(R.id.recycler);
            if (grid != null) {
                grid.setVisibility(full.getVisibility() == View.VISIBLE ? View.INVISIBLE : View.VISIBLE);
            }
        } catch (Throwable t) {
        }
    }

    /** {@code ipp_pl_tile.xml}'s colours. */
    private static final int TILE_TEXT = 0xCCFFFFFF;
    private static final int TILE_FRAME = 0xFF36C6FF;

    /** As the Photos tiles' captions ({@link Photos#name}). */
    public static void tileName(TextView tv) {
        if (tv == null) return;
        try {
            ThemeManager.INSTANCE.itemSetTextColor(tv, TILE_TEXT, false);
        } catch (Throwable t) {
        }
    }

    /** The preview's "As Theme" hint, in the captions' colour; the glyph follows the label. */
    public static void fullHint(ImageView icon, TextView label) {
        if (label == null) return;
        tileName(label);
        if (icon != null) Icons.menu(icon, label.getCurrentTextColor());
    }

    public static int tileFrame() {
        int c = Icons.progressColor();
        return c == 0 ? TILE_FRAME : c;
    }

    /** The card's side as tileFit last made it, 0 before the first tile: a cover is decoded to it. */
    public static int tileCardSide() {
        return fitSide > TILE_INSET ? fitSide - TILE_INSET : 0;
    }

    /** EVEN on purpose: an odd inset is split 3/2 and the cover seems to jump a pixel on focus. */
    private static final int TILE_INSET = 6;

    /**
     * The caption's height per unit of type size, fixed so rows stand alike under every theme
     * font; the cover takes the rest.
     */
    private static final float CAPTION = 1.35f;

    private static int fitFor = -1;
    private static int fitSide;

    /**
     * Exactly two rows of cover plus caption per screen. In code, not a dimen: the 320x240 device
     * differs.
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
            // Font padding would be one more thing the theme's font moves.
            caption.setIncludeFontPadding(false);
            height(caption, cap);
            side(frame, fitSide);
            side(card, fitSide - TILE_INSET);
        } catch (Throwable t) {
        }
    }

    /**
     * An odd screen's odd pixel goes into the top padding, so a step is exactly a row. From
     * {@code initView}, BEFORE the first layout — later it moves the edge but not the rows.
     */
    public static void tileGrid(RecyclerView rv) {
        if (rv == null) return;
        try {
            int avail = rv.getResources().getDisplayMetrics().heightPixels
                    - (int) rv.getResources().getDimension(R.dimen.status_bar_height);
            rv.setPadding(rv.getPaddingLeft(), avail % 2, rv.getPaddingRight(), rv.getPaddingBottom());
        } catch (Throwable t) {
        }
    }

    /** Nothing when already that size: a write is a layout. */
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
     * A tile rebound for a DIFFERENT theme shows that theme's cover read ahead, or nothing until
     * Glide's arrives; the same theme keeps its picture. Rows gliding round the list's end rebind
     * every tile they bring in, and an emptied one blinked. True = the cover came from memory and
     * the gallery skips Glide.
     */
    public static boolean tileCover(ImageView iv, String path) {
        if (iv == null) return false;
        Bitmap b = path == null ? null : (Bitmap) covers.get(path);
        Object was = iv.getTag();
        if (was == null || !was.equals(path)) {
            iv.setImageDrawable(b == null ? null : new BitmapDrawable(iv.getResources(), b));
        } else if (b != null && !(iv.getDrawable() instanceof BitmapDrawable
                && ((BitmapDrawable) iv.getDrawable()).getBitmap() == b)) {
            // the same theme with Glide's picture or none yet: from now on ours
            iv.setImageDrawable(new BitmapDrawable(iv.getResources(), b));
        }
        iv.setTag(path);
        return b != null;
    }

    /**
     * A theme that carries better-Y.json shows the logo in the corner where multi-select puts its
     * box; in multi-select the box is stock's, as stock just set it. After stock's code for it.
     */
    public static void tileMark(ImageView mark, String path, boolean multi) {
        if (mark == null || multi) return;
        try {
            Bitmap b = hasCfg(path) ? markBitmap(mark) : null;
            if (b == null) {
                mark.setVisibility(View.GONE);
                return;
            }
            mark.setImageBitmap(b);
            mark.setVisibility(View.VISIBLE);
        } catch (Throwable t) {
        }
    }

    private static Bitmap logo;
    /** Theme path -> whether its folder has better-Y.json; cleared with each new gallery. */
    private static final java.util.Hashtable cfgs = new java.util.Hashtable();

    private static boolean hasCfg(String path) {
        if (path == null || path.trim().length() == 0) return false;
        Boolean b = (Boolean) cfgs.get(path);
        if (b == null) {
            b = Boolean.valueOf(new File(path, ThemeCfg.FILE).isFile());
            cfgs.put(path, b);
        }
        return b.booleanValue();
    }

    /** Save config wrote the file: the gallery shows the logo at once. */
    static void cfgSaved(Context c, String path) {
        if (path != null) cfgs.put(path, Boolean.TRUE);
        if (!(c instanceof Activity)) return;
        View v = ((Activity) c).findViewById(R.id.recycler);
        if (v instanceof RecyclerView && ((RecyclerView) v).getAdapter() != null) {
            ((RecyclerView) v).getAdapter().notifyDataSetChanged();
        }
    }

    /**
     * {@code plus_logo} scaled once to the box the layout gives the mark: halved while it is twice
     * the box or more, since a bilinear filter only averages 2:1 and a single 146 → 26 step aliases.
     */
    private static Bitmap markBitmap(ImageView v) {
        if (logo != null) return logo;
        ViewGroup.LayoutParams lp = v.getLayoutParams();
        int side = lp != null && lp.width > 0 ? lp.width
                : (int) (26 * v.getResources().getDisplayMetrics().density);
        BitmapFactory.Options o = new BitmapFactory.Options();
        o.inScaled = false;
        Bitmap b = BitmapFactory.decodeResource(v.getResources(), R.drawable.plus_logo, o);
        if (b == null) return null;
        while (b.getWidth() >= side * 2) {
            Bitmap h = Bitmap.createScaledBitmap(b, b.getWidth() / 2, b.getHeight() / 2, true);
            if (h != b) b.recycle();
            b = h;
        }
        Bitmap s = Bitmap.createScaledBitmap(b, side, side, true);
        if (s != b) b.recycle();
        logo = s;
        return logo;
    }

    /** Theme path -> its cover at the tile's own size ({@link Thumbs#themeBox}). */
    private static final java.util.Hashtable covers = new java.util.Hashtable();
    private static WeakReference coversFor = new WeakReference(null);

    /**
     * Once per gallery, from the first frame of the grid that has themes in it (it is filled
     * from the card, later the first time): every theme's cover read off the main thread.
     */
    public static void tilesAhead(RecyclerView rv) {
        try {
            RecyclerView.Adapter a = rv == null ? null : rv.getAdapter();
            if (!(a instanceof com.chad.library.adapter.base.BaseQuickAdapter) || coversFor.get() == a) return;
            List data = ((com.chad.library.adapter.base.BaseQuickAdapter) a).getData();
            if (data == null || data.isEmpty()) return;        // not filled yet: the next call
            coversFor = new WeakReference(a);
            cfgs.clear();
            ArrayList todo = new ArrayList();
            for (int i = 0; data != null && i < data.size(); i++) {
                Object o = data.get(i);
                if (!(o instanceof ThemeListActivity.Item)) continue;
                ThemeListActivity.Item it = (ThemeListActivity.Item) o;
                if (it.getPicturePath().trim().length() == 0 || covers.get(it.getPath()) != null) continue;
                todo.add(new String[] {it.getPath(), it.getPicturePath()});
            }
            if (!todo.isEmpty()) new Thread(new Covers(todo, Thumbs.themeBox(rv.getContext())), "ipp-theme-covers").start();
        } catch (Throwable t) {
        }
    }

    /** From the gallery's {@code onDestroy}: neither its covers nor Glide's pictures outlive it. */
    public static void galleryLeft(Activity a) {
        covers.clear();
        coversFor = new WeakReference(null);
        Thumbs.left(a);
    }

    static final class Covers implements Runnable {
        private final List todo;
        private final int[] box;
        Covers(List todo, int[] box) {
            this.todo = todo;
            this.box = box;
        }
        public void run() {
            for (int i = 0; i < todo.size(); i++) {
                String[] p = (String[]) todo.get(i);
                try {
                    Bitmap c = Thumbs.read(p[1], box[0], box[1]);
                    if (c != null) covers.put(p[0], c);
                } catch (Throwable t) {
                }
            }
        }
    }
}
