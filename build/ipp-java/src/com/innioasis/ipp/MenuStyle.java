package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.recyclerview.widget.RecyclerView;

import com.innioasis.music.MusicMainActivity;
import com.innioasis.y1.R;
import com.innioasis.y1.activity.DateOneLevelActivity;
import com.innioasis.y1.activity.EbookActivity;
import com.innioasis.y1.activity.EqActivity;
import com.innioasis.y1.activity.IppActivity;
import com.innioasis.y1.activity.LanguageActivity;
import com.innioasis.y1.activity.MainActivity;
import com.innioasis.y1.activity.SettingActivity;
import com.innioasis.y1.activity.WallpaperListActivity;
import com.innioasis.y1.activity.video.VideoListActivity;
import com.innioasis.y1.base.BaseActivity;
import com.innioasis.y1.base.BaseBindingAdapter;
import com.innioasis.y1.databinding.ActivitySettingBinding;
import com.innioasis.y1.theme.ThemeManager;
import com.innioasis.y1.utils.WallpaperUtils;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * "menu_style" SIMPLE: a screen that draws a preview beside its list loses the preview, and the
 * list takes the whole width — the main menu, Settings and the screens inside it. The preview is
 * hidden and not painted: each painter asks {@link #simple} first. Stock never touches its
 * visibility. The style also picks the background of Settings and its screens ({@link #backdrop}).
 */
public final class MenuStyle {

    private MenuStyle() { }

    public static final String KEY = "menu_style";

    private static final int SIMPLE = 1;

    public static boolean simple(Context c) {
        return Prefs.val(c, KEY) == SIMPLE;
    }

    /** End of {@code BaseActivity.onResume}: a screen left open under the menu is not re-created. */
    public static void apply(Object activity) {
        if (!(activity instanceof Activity)) return;
        try {
            Activity a = (Activity) activity;
            boolean s = simple(a);
            if (a instanceof MainActivity) {
                pad(a.findViewById(R.id.rc_list));
                if (hide(a.findViewById(R.id.iv_now), s) && !s) mainPreview(a);
                if (!s) preloadMain(a);
            } else if (a instanceof SettingActivity) {
                pad(a.findViewById(R.id.recycler));
                if (hide(parent(a.findViewById(R.id.right_title)), s) && !s) Wheel.paintPanel();
            } else if (a instanceof EqActivity) {
                widen(a.findViewById(R.id.recycler_list), s);
                hide(parent(a.findViewById(R.id.image)), s);
            } else if (a instanceof WallpaperListActivity) {
                widen(a.findViewById(R.id.recycler), s);
                hide(parent(a.findViewById(R.id.img)), s);
            } else if (a instanceof LanguageActivity) {
                widen(a.findViewById(R.id.recycler), s);
                hide(a.findViewById(R.id.image), s);
            } else if (a instanceof DateOneLevelActivity) {
                widen(a.findViewById(R.id.date_ll), s);
                hide(a.findViewById(R.id.show_time), s);
                hide(a.findViewById(R.id.imageView), s);
                hide(a.findViewById(R.id.show_date), s);
                dateIcon(a.findViewById(R.id.imageView));
            }
            section(a);
            backdrop(a, s);
            Preview.apply(a);
            Bar.apply(a);
            Fill.apply(a);
        } catch (Throwable t) {
        }
    }

    // the main menu's list and iv_now (activity_main.xml); better-Y takes Settings' list and panel
    // (activity_setting.xml). Every layout here spans the whole screen.
    private static final int SPLIT_W = 213;
    private static final int SET_W = 227;
    private static final int PIC_W = 179;
    private static final int PIC_TOP = 86;
    private static final int PIC_RIGHT = 23;

    /**
     * Default style: the first level of Music, Audiobooks, E-book, Videos and better-Y is laid out
     * as the main menu, its list on the left and the section's own main-menu picture on the right
     * for every row. Deeper levels of the same screen, and Simple, take the whole width.
     */
    public static void section(Activity a) {
        try {
            View list;
            int pic;
            boolean root = true;
            if (a instanceof MusicMainActivity) {
                list = a.findViewById(R.id.lv);
                pic = R.drawable.main_music;
            } else if (a instanceof EbookActivity) {
                list = a.findViewById(R.id.lv);
                pic = R.drawable.main_audiobook;
            } else if (a instanceof com.innioasis.y1_eBook.ui.main.MainActivity) {
                list = a.findViewById(R.id.ipp_book_menu);
                pic = R.drawable.main_book;
                root = !Ebook.library(a);
            } else if (a instanceof VideoListActivity) {
                list = a.findViewById(R.id.recycler);
                pic = R.drawable.main_video;
                root = videoRoot(a);
                watchVideos(a, list);
            } else if (a instanceof IppActivity) {
                list = a.findViewById(R.id.rc_list);
                pic = R.drawable.plus_logo;
                root = ((IppActivity) a).atRoot();
            } else {
                return;
            }
            boolean set = a instanceof IppActivity;
            boolean on = root && !simple(a);
            split(a, list, pic, on, set);
            wallpaper(a, on, set);
        } catch (Throwable t) {
        }
    }

    private static void split(Activity a, View list, int pic, boolean on, boolean set) {
        if (list == null) return;
        ViewGroup.LayoutParams lp = list.getLayoutParams();
        if (lp == null) return;
        Object tag = list.getTag(R.id.layoutContent);
        if (!(tag instanceof Integer)) {
            tag = Integer.valueOf(lp.width);
            list.setTag(R.id.layoutContent, tag);
        }
        int w = on ? px(a, set ? SET_W : SPLIT_W) : ((Integer) tag).intValue();
        if (lp.width != w) {
            lp.width = w;
            list.setLayoutParams(lp);
        }
        View box = sectionPic(a, on, set);
        if (box == null) return;
        box.setVisibility(on ? View.VISIBLE : View.GONE);
        if (!on) return;
        ImageView iv = (ImageView) (box instanceof ImageView ? box : box.findViewById(R.id.right_image));
        Bitmap own = pic == R.drawable.plus_logo ? logo(a) : null;
        Object want = own != null ? (Object) own : Integer.valueOf(pic);
        if (!want.equals(iv.getTag(R.id.layoutContent))) {
            iv.setTag(R.id.layoutContent, want);
            if (own != null) iv.setImageBitmap(own);
            else ThemeManager.INSTANCE.commonSetIcon(iv, pic);
        }
        View info = box.findViewById(R.id.info_state_tv);
        if (info instanceof TextView) ((TextView) info).setTextColor(Preview.fg(a));
    }

    // the theme's better-Y.* by theme name: a folder is listed once, not on every step of the wheel
    private static String logoTheme;
    private static Bitmap logoBmp;

    /** The current theme's {@code better-Y.*} (any case), read once; null keeps {@code plus_logo}. */
    static Bitmap logo(Context c) {
        try {
            String name = ThemeManager.INSTANCE.getThemeName();
            if (name == null) name = "";
            synchronized (MenuStyle.class) {
                if (name.equals(logoTheme)) return logoBmp;
            }
            String path = name.length() == 0 ? null : Saver.themeFile(ThemeManager.themesPath + "/" + name, "better-y");
            Bitmap b = path == null ? null : Saver.picture(c, path, LOGO_SIDE, LOGO_SIDE);
            synchronized (MenuStyle.class) {
                logoTheme = name;
                logoBmp = b;
            }
            return b;
        } catch (Throwable t) {
            return null;
        }
    }

    private static final int LOGO_SIDE = 360;

    /** From the scan's end: a file put in by USB is looked for again. */
    static synchronized void logoRecheck() {
        logoTheme = null;
        logoBmp = null;
    }

    /** From {@code Tone.settingsPanel}: the better-Y row of Settings shows the theme's own picture. */
    static boolean settingsLogo(SettingActivity a, String title) {
        if (!a.getString(R.string.ipp_settings_title).equals(title)) return false;
        Bitmap b = logo(a);
        if (b == null) return false;
        ActivitySettingBinding vb = (ActivitySettingBinding) a.getVb();
        vb.rightImage.setImageBitmap(b);
        vb.infoStateTv.setText(R.string.ipp_version);
        return true;
    }

    /**
     * Added to the base layout's root beside {@code layoutContent}: the main menu's iv_now, or for
     * better-Y Settings' own panel out of activity_setting.xml — its caption written but invisible,
     * so the picture stands to the pixel where Settings has it, and the version under the picture.
     * Both picture ids are ones {@link #res} caches a stock picture for.
     */
    private static View sectionPic(Activity a, boolean create, boolean set) {
        View content = a.findViewById(R.id.layoutContent);
        ViewParent p = content == null ? null : content.getParent();
        if (!(p instanceof ConstraintLayout)) return null;
        ConstraintLayout root = (ConstraintLayout) p;
        Object had = root.getTag(R.id.iv_now);
        if (had instanceof View) return (View) had;
        if (!create) return null;
        View box;
        ConstraintLayout.LayoutParams lp;
        if (set) {
            ViewGroup page = (ViewGroup) android.view.LayoutInflater.from(a)
                    .inflate(R.layout.activity_setting, root, false);
            box = (View) page.findViewById(R.id.right_title).getParent();
            lp = Pad.copy((ConstraintLayout.LayoutParams) box.getLayoutParams());
            page.removeView(box);
            TextView title = (TextView) box.findViewById(R.id.right_title);
            title.setText(R.string.ipp_settings_title);
            title.setTextColor(0);
            ((ImageView) box.findViewById(R.id.right_image)).setImageDrawable(null);
            ((TextView) box.findViewById(R.id.info_state_tv)).setText(R.string.ipp_version);
        } else {
            ImageView iv = new ImageView(a);
            iv.setId(R.id.iv_now);
            iv.setAdjustViewBounds(true);
            box = iv;
            lp = new ConstraintLayout.LayoutParams(px(a, PIC_W), ViewGroup.LayoutParams.WRAP_CONTENT);
            lp.topToTop = ConstraintLayout.LayoutParams.PARENT_ID;
            lp.rightToRight = ConstraintLayout.LayoutParams.PARENT_ID;
            lp.topMargin = px(a, PIC_TOP);
            lp.rightMargin = px(a, PIC_RIGHT);
            lp.setMarginEnd(px(a, PIC_RIGHT));
        }
        root.addView(box, root.indexOfChild(content) + 1, lp);
        root.setTag(R.id.iv_now, box);
        return box;
    }

    /**
     * The split level's background: the main menu's (desktop wallpaper under the theme's deskMask)
     * for the sections it opens, Settings' (settingMask over the window's wallpaper) for better-Y.
     * Elsewhere, and in Simple, the window's own wallpaper as stock sets it.
     */
    private static void wallpaper(Activity a, boolean on, boolean set) {
        if (!(a instanceof BaseActivity)) return;
        if (!set) {
            View decor = a.getWindow().getDecorView();
            Bitmap desk = WallpaperUtils.INSTANCE.getDesktopBitmap();
            Object had = decor.getTag(R.id.back);
            if (on && desk != null && had != desk) {
                decor.setBackgroundDrawable(new BitmapDrawable(a.getResources(), desk));
                decor.setTag(R.id.back, desk);
            } else if (!on && had != null) {
                Bitmap g = WallpaperUtils.INSTANCE.getGlobalBitmap();
                if (g != null) decor.setBackgroundDrawable(new BitmapDrawable(a.getResources(), g));
                decor.setTag(R.id.back, null);
            }
        }
        ImageView back = ((BaseActivity) a).getBackImageView();
        if (back == null) return;
        if (!on) {
            back.setVisibility(View.GONE);
            return;
        }
        if (back.getTag(R.id.back) == null) {
            back.setTag(R.id.back, Boolean.TRUE);
            // the layout fills it black
            back.setBackgroundDrawable(null);
            if (set) {
                ThemeManager.INSTANCE.setSettingMask(back);
            } else {
                ThemeManager.INSTANCE.setDeskMask(back);
            }
        }
        back.setVisibility(View.VISIBLE);
    }

    private static int px(Context c, int dip) {
        return (int) (dip * c.getResources().getDisplayMetrics().density + 0.5f);
    }

    private static java.lang.reflect.Field videoStack;

    /** Videos keeps every level in one list; the first is the one with no history behind it. */
    private static boolean videoRoot(Activity a) {
        try {
            if (videoStack == null) {
                java.lang.reflect.Field f = VideoListActivity.class.getDeclaredField("browseHistoryStack");
                f.setAccessible(true);
                videoStack = f;
            }
            Object s = videoStack.get(a);
            return s instanceof java.util.Collection && ((java.util.Collection) s).isEmpty();
        } catch (Throwable t) {
            return false;
        }
    }

    /** Every change of level in Videos is a setList on the same adapter, after the history moved. */
    private static void watchVideos(Activity a, View list) {
        if (!(list instanceof RecyclerView) || list.getTag(R.id.iv_now) != null) return;
        RecyclerView.Adapter ad = ((RecyclerView) list).getAdapter();
        if (ad == null) return;
        list.setTag(R.id.iv_now, Boolean.TRUE);
        ad.registerAdapterDataObserver(new VideoLevel(a));
    }

    static final class VideoLevel extends RecyclerView.AdapterDataObserver {
        private final WeakReference act;

        VideoLevel(Activity a) {
            act = new WeakReference(a);
        }

        @Override
        public void onChanged() {
            Activity a = (Activity) act.get();
            if (a != null) section(a);
        }
    }

    /** The picture the Settings panel shows for Date & time, the theme's included. */
    private static void dateIcon(View v) {
        if (!(v instanceof ImageView) || v.getTag(R.id.imageView) != null) return;
        v.setTag(R.id.imageView, Boolean.TRUE);
        ThemeManager.INSTANCE.commonSetIcon((ImageView) v, R.drawable.icon_setting_day);
    }

    /**
     * Settings' background — the wallpaper under the theme's settingMask — in Default, the
     * wallpaper alone in Simple. The screens inside Settings carry it on the base layout's unused
     * {@code back}; Brightness, About, the date and time editor and better-Y never do.
     */
    private static void backdrop(Activity a, boolean simple) {
        try {
            if (a instanceof SettingActivity) {
                View back = ((ActivitySettingBinding) ((SettingActivity) a).getVb()).back;
                back.setVisibility(simple ? View.INVISIBLE : View.VISIBLE);
                return;
            }
            if (!(a instanceof LanguageActivity || a instanceof WallpaperListActivity
                    || a instanceof DateOneLevelActivity || a instanceof EqActivity)) {
                return;
            }
            ImageView back = ((BaseActivity) a).getBackImageView();
            if (simple) {
                back.setVisibility(View.GONE);
                return;
            }
            if (back.getTag(R.id.back) == null) {
                back.setTag(R.id.back, Boolean.TRUE);
                // the layout fills it black
                back.setBackgroundDrawable(null);
                ThemeManager.INSTANCE.setSettingMask(back);
            }
            back.setVisibility(View.VISIBLE);
        } catch (Throwable t) {
        }
    }

    /** These two lists' width is {@link Pad}'s, which asks {@link #simple} itself. */
    private static void pad(View v) {
        if (v instanceof RecyclerView) Pad.list((RecyclerView) v);
    }

    private static View parent(View v) {
        ViewParent p = v == null ? null : v.getParent();
        return p instanceof View ? (View) p : null;
    }

    /** True when the view changed: a preview shown again was not painted while hidden. */
    private static boolean hide(View v, boolean hide) {
        if (v == null) return false;
        int vis = hide ? View.GONE : View.VISIBLE;
        if (v.getVisibility() == vis) return false;
        v.setVisibility(vis);
        return true;
    }

    /** The main menu's painter is private; this runs once per change of the setting. */
    private static void mainPreview(Activity a) {
        try {
            java.lang.reflect.Method m = MainActivity.class.getDeclaredMethod("selItem", new Class[0]);
            m.setAccessible(true);
            m.invoke(a, new Object[0]);
        } catch (Throwable t) {
        }
    }

    // The pictures beside the main menu and the Settings list, handled the way a theme's are: decoded
    // off the main thread at the view's width, kept, and shown when ready. Stock decodes the ~400 px
    // PNG on the main thread on every wheel click instead (the resource cache holds it weakly).
    // Only stock pictures land here — a theme's own go to its BitmapCache. Applying a theme drops
    // them all ({@link #themeChanged}): a theme with pictures of its own has no use for them.
    private static final HashMap PREVIEWS = new HashMap();
    private static final Object PROBE = new Object();
    private static Handler loader;
    private static Handler main;
    private static boolean mainLoaded;

    // what MainActivity.selItem shows for each row
    private static final int[] MAIN_ROWS = {
        R.string.main_now, R.string.main_photos, R.string.main_music, R.string.main_audiobook,
        R.string.main_book, R.string.main_calc, R.string.main_calendar, R.string.main_fm,
        R.string.main_setting, R.string.main_random, R.string.main_bluetooth, R.string.main_video,
    };
    private static final int[] MAIN_PICS = {
        R.drawable.main_now_playing, R.drawable.main_photos, R.drawable.main_music,
        R.drawable.main_audiobook, R.drawable.main_book, R.drawable.main_calc,
        R.drawable.main_calendar, R.drawable.main_fm, R.drawable.main_setting,
        R.drawable.main_shuffle, R.drawable.main_bluetooth, R.drawable.main_video,
    };

    private static boolean panel(ImageView iv) {
        int id = iv.getId();
        return id == R.id.iv_now || id == R.id.right_image
                || id == R.id.image && host(iv) instanceof EqActivity;
    }

    /** AppCompat hands its ImageView a TintContextWrapper, not the activity. */
    private static android.content.Context host(View v) {
        android.content.Context c = v.getContext();
        for (int i = 0; i < 4 && !(c instanceof android.app.Activity)
                && c instanceof android.content.ContextWrapper; i++) {
            c = ((android.content.ContextWrapper) c).getBaseContext();
        }
        return c;
    }

    /** Stands in for {@code setImageResource} in {@code ThemeManager}: commonSetIcon, setBackground. */
    public static void res(ImageView iv, int id) {
        try {
            if (iv.getTag(R.id.right_image) == PROBE) {
                loadLater(iv.getResources(), id, iv.getLayoutParams().width, null);
                return;
            }
            int w = panel(iv) ? width(iv) : 0;
            if (w > 0) {
                Drawable d;
                synchronized (PREVIEWS) { d = (Drawable) PREVIEWS.get(key(id, w)); }
                if (d != null) {
                    iv.setTag(R.id.iv_now, null);
                    iv.setImageDrawable(d);
                    return;
                }
                // the view keeps what it shows until the picture lands, as with a theme's
                iv.setTag(R.id.iv_now, Integer.valueOf(id));
                loadLater(iv.getResources(), id, w, iv);
                return;
            }
        } catch (Throwable t) {
        }
        iv.setImageResource(id);
    }

    private static Long key(int id, int w) {
        return Long.valueOf(((long) id << 16) | (w & 0xffff));
    }

    /** Laid out: its width; before that, the first fixed width up the tree (Settings' panel column). */
    private static int width(View v) {
        if (v.getWidth() > 0) return v.getWidth();
        for (int i = 0; i < 4 && v != null; i++) {
            ViewGroup.LayoutParams lp = v.getLayoutParams();
            if (lp == null || lp.width == ViewGroup.LayoutParams.WRAP_CONTENT) return 0;
            if (lp.width > 0) return lp.width;
            ViewParent p = v.getParent();
            v = p instanceof View ? (View) p : null;
        }
        return 0;
    }

    // The loader thread's own: the decoded PNG and the 2w step are drawn into these, reused per size,
    // so a picture leaves nothing behind but itself — garbage here is a collection on every thread.
    private static Bitmap scratch;
    private static Bitmap half;
    private static final Paint FILTER = new Paint(Paint.FILTER_BITMAP_FLAG);

    private static Drawable build(Resources r, int id, int w) {
        BitmapFactory.Options o = new BitmapFactory.Options();
        o.inJustDecodeBounds = true;
        BitmapFactory.decodeResource(r, id, o);
        int sw = o.outWidth;
        int sh = o.outHeight;
        if (sw <= 0 || sh <= 0) return null;
        if (scratch == null || scratch.getWidth() != sw || scratch.getHeight() != sh) {
            scratch = Bitmap.createBitmap(sw, sh, Bitmap.Config.ARGB_8888);
        }
        o = new BitmapFactory.Options();
        o.inScaled = false;
        o.inMutable = true;
        o.inSampleSize = 1;     // 4.2's Skia reuses inBitmap only for exactly 1, and the default is 0
        o.inBitmap = scratch;
        Bitmap src = BitmapFactory.decodeResource(r, id, o);
        if (src == null) return null;
        Bitmap b;
        if (sw > w) {
            int h = Math.max(1, Math.round(sh * (float) w / sw));
            Bitmap from = src;
            // bilinear is a box filter only up to 2:1, so a larger step goes through 2w first
            if (sw > 2 * w) {
                if (half == null || half.getWidth() != 2 * w || half.getHeight() != 2 * h) {
                    half = Bitmap.createBitmap(2 * w, 2 * h, Bitmap.Config.ARGB_8888);
                }
                half.eraseColor(0);
                new Canvas(half).drawBitmap(src, new Rect(0, 0, sw, sh), new Rect(0, 0, 2 * w, 2 * h), FILTER);
                from = half;
            }
            b = Bitmap.createScaledBitmap(from, w, h, true);
        } else {
            b = src.copy(Bitmap.Config.ARGB_8888, false);
        }
        if (src != scratch) scratch = null;
        if (b == null) return null;
        Drawable d = new BitmapDrawable(r, b);
        synchronized (PREVIEWS) {
            Drawable had = (Drawable) PREVIEWS.get(key(id, w));
            if (had != null) return had;
            PREVIEWS.put(key(id, w), d);
        }
        return d;
    }

    private static void loadLater(Resources r, int id, int w, ImageView show) {
        if (w <= 0) return;
        Handler h;
        synchronized (PREVIEWS) {
            if (show == null && PREVIEWS.containsKey(key(id, w))) return;
            if (loader == null) {
                HandlerThread t = new HandlerThread("ipp-preview");
                t.start();
                loader = new Handler(t.getLooper());
                main = new Handler(Looper.getMainLooper());
            }
            h = loader;
        }
        h.post(new Load(r, id, w, show));
        h.removeCallbacks(DROP);
        h.postDelayed(DROP, 3000L);
    }

    private static final Runnable DROP = new Drop();

    /** The scratch bitmaps go once the queue has been quiet a while. */
    static final class Drop implements Runnable {
        public void run() {
            scratch = null;
            half = null;
        }
    }

    static final class Load implements Runnable {
        private final Resources r;
        private final int id;
        private final int w;
        private final WeakReference show;

        Load(Resources r, int id, int w, ImageView show) {
            this.r = r;
            this.id = id;
            this.w = w;
            this.show = show == null ? null : new WeakReference(show);
        }

        public void run() {
            try {
                Drawable d;
                synchronized (PREVIEWS) { d = (Drawable) PREVIEWS.get(key(id, w)); }
                if (d == null) d = build(r, id, w);
                if (d != null && show != null) main.post(new Show(show, id, d));
            } catch (Throwable t) {
            }
        }
    }

    /** On the main thread: the picture, unless the view has been asked for another since. */
    static final class Show implements Runnable {
        private final WeakReference view;
        private final int id;
        private final Drawable d;

        Show(WeakReference view, int id, Drawable d) {
            this.view = view;
            this.id = id;
            this.d = d;
        }

        public void run() {
            ImageView iv = (ImageView) view.get();
            if (iv == null || !Integer.valueOf(id).equals(iv.getTag(R.id.iv_now))) return;
            iv.setTag(R.id.iv_now, null);
            iv.setImageDrawable(d);
        }
    }

    /** A view nobody shows: what the theme decides for it is what the real one will get. */
    private static ImageView probeView(Context c, int w) {
        ImageView p = new ImageView(c);
        p.setLayoutParams(new ViewGroup.LayoutParams(w, ViewGroup.LayoutParams.WRAP_CONTENT));
        p.setTag(R.id.right_image, PROBE);
        return p;
    }

    /** From {@link Theme#relaunch}: the next main menu preloads again, the new theme's way. */
    public static void themeChanged() {
        synchronized (PREVIEWS) {
            PREVIEWS.clear();
        }
        mainLoaded = false;
    }

    /** Once per theme: the pictures of the rows the main menu has, the current theme's way. */
    private static void preloadMain(Activity a) {
        if (mainLoaded) return;
        View iv = a.findViewById(R.id.iv_now);
        View rv = a.findViewById(R.id.rc_list);
        if (iv == null || !(rv instanceof RecyclerView)) return;
        RecyclerView.Adapter ad = ((RecyclerView) rv).getAdapter();
        if (!(ad instanceof BaseBindingAdapter)) return;
        int w = width(iv);
        if (w <= 0) return;
        mainLoaded = true;
        List rows = ((BaseBindingAdapter) ad).getData();
        ImageView p = probeView(a, w);
        for (int i = 0; i < MAIN_ROWS.length; i++) {
            if (rows.contains(a.getString(MAIN_ROWS[i]))) {
                ThemeManager.INSTANCE.commonSetIcon(p, MAIN_PICS[i]);
            }
        }
        // Settings' background, decoded in the background on first use: without this its first
        // two frames were drawn with no background at all
        ThemeManager.INSTANCE.setSettingMask(new ImageView(a));
    }

    /** The layout's own width is kept in a tag, to go back to. */
    private static void widen(View v, boolean wide) {
        if (v == null) return;
        ViewGroup.LayoutParams lp = v.getLayoutParams();
        if (lp == null) return;
        Object tag = v.getTag(R.id.layout);
        if (!(tag instanceof Integer)) {
            tag = Integer.valueOf(lp.width);
            v.setTag(R.id.layout, tag);
        }
        int w = wide ? ViewGroup.LayoutParams.MATCH_PARENT : ((Integer) tag).intValue();
        if (lp.width == w) return;
        lp.width = w;
        v.setLayoutParams(lp);
    }
}
