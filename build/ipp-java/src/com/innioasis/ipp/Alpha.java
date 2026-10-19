package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.BitmapDrawable;
import android.os.SystemClock;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.PopupWindow;
import android.widget.TextView;

import com.innioasis.music.adapter.AlbumListAdapter;
import com.innioasis.music.adapter.MainAdapter;
import com.innioasis.music.adapter.MyBaseAdapter;
import com.innioasis.music.adapter.SongListAdapter;
import com.innioasis.music.data.Album;
import com.innioasis.music.data.Genre;
import com.innioasis.music.objects.Constant;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.database.Y1Repository;
import com.innioasis.y1.theme.ThemeManager;
import com.innioasis.y1.utils.SharedPreferencesUtils;

import java.lang.ref.WeakReference;

/**
 * Fast scroll by first letter (by year for date-sorted albums): after {@link #threshold()} quick
 * clicks the list moves by group, the key shown large. Only where the screen's own sort makes a
 * jump meaningful (song-name sorts, Artists, Albums, Genres' levels); elsewhere nothing changes.
 * Where it applies, SpeedUtil's acceleration replays are dropped ({@link #BURST_MS}): one click is
 * one row, then one group. Jump mode ends only when the wheel is let go ({@link #IDLE_MS}).
 */
public final class Alpha {

    private Alpha() { }

    private static final int NONE = 0;
    private static final int LETTER = 1;
    private static final int YEAR = 2;

    /** Below this gap it is SpeedUtil replaying, not a click. */
    private static final long BURST_MS = 25;

    /** Clicks closer than this arm the jump. */
    private static final long FAST_MS = 250;

    private static final long IDLE_MS = 1000;

    /** The menu row is built from this array; the preference is an INDEX into it. */
    public static final int[] THRESHOLDS =
            { 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60 };
    public static final int THRESHOLD_DEFAULT = 5;           // = 30 clicks

    /** When the theme names no menu background. */
    private static final int PLATE_RGB = 0x007AFF;

    /** Translucent: a solid block over the list reads as a screen of its own. */
    private static final int PLATE_ALPHA = 0xD9000000;

    private static final int PAD_DP = 14;
    private static final int RADIUS_DP = 12;

    /** Blur radius and drop. */
    private static final int SHADOW_DP = 10;
    private static final int SHADOW_DY_DP = 2;
    private static final int SHADOW_COLOR = 0x33000000;

    /** A wide theme font gives way in text size, never in square ({@link #fit}). */
    private static final int LETTER_SP = 56;
    private static final int YEAR_SP = 40;

    /** The status bar's fallback height. */
    private static final int BAR_DP = 45;

    /**
     * The group of rows with no key (button rows, untagged songs). NOT a character: a real key is
     * one character, so any glyph marker could collide with a song called "#Selfie". Drawn as
     * {@link #OTHER_TEXT}; the identity must be unique, not the glyph.
     */
    private static final String OTHER = "(no key)";
    private static final String OTHER_TEXT = "#";

    /** A plain character is safe here: a year key is only digits. */
    private static final String NO_YEAR = "?";

    private static long lastCall;
    private static long lastClick;
    private static int fast;
    private static boolean jumping;

    private static WeakReference overlayRef;    // TextView
    private static final Hide HIDE = new Hide();

    private static final long FLASH_MS = 700;

    /**
     * The same plate, briefly, for the keyboard's layout switch ({@code Keys}). The Activity is
     * passed in: the host is in the dialog's window, whose context is a theme wrapper.
     */
    public static void flash(Activity act, View host, String text) {
        try {
            if (act == null || host == null || text == null) return;
            float d = act.getResources().getDisplayMetrics().density;

            TextView tv = plateView(act, d);
            tv.setText(text);
            fit(tv, text, YEAR_SP, d);
            int size = dress(tv, d);

            // A PopupWindow: in the content view the keyboard DIALOG would cover it.
            hidePop();
            PopupWindow pw = new PopupWindow(tv, size, size);
            pw.setBackgroundDrawable(null);
            pw.setTouchable(false);
            pw.setFocusable(false);
            pw.setOutsideTouchable(false);

            // A sub-window is laid out in its parent's frame (the dialog at the bottom), so the
            // screen centre is passed as an offset from that window's origin.
            int[] onScreen = new int[2];
            int[] inWindow = new int[2];
            host.getLocationOnScreen(onScreen);
            host.getLocationInWindow(inWindow);
            android.util.DisplayMetrics dm = act.getResources().getDisplayMetrics();
            int x = (dm.widthPixels - size) / 2 - (onScreen[0] - inWindow[0]);
            int y = (dm.heightPixels - size) / 2 - (onScreen[1] - inWindow[1]);
            pw.showAtLocation(host, Gravity.NO_GRAVITY, x, y);
            pop = pw;

            host.removeCallbacks(POP_HIDE);
            host.postDelayed(POP_HIDE, FLASH_MS);
        } catch (Throwable t) {
        }
    }

    /**
     * STRONG on purpose: nothing else holds the PopupWindow, so a weak handle is collected and the
     * plate stays up for good. Cleared on dismiss.
     */
    private static PopupWindow pop;
    private static final Runnable POP_HIDE = new PopHide();

    static final class PopHide implements Runnable {
        public void run() {
            hidePop();
        }
    }

    private static void hidePop() {
        try {
            PopupWindow p = pop;
            pop = null;
            if (p != null) p.dismiss();
        } catch (Throwable t) {
        }
    }

    private static TextView plateView(Activity act, float d) {
        TextView tv = new TextView(act);
        tv.setTextColor(ink());
        tv.setGravity(Gravity.CENTER);
        tv.setIncludeFontPadding(false);
        // Before fit(), which measures with this paint.
        tv.setTypeface(Typeface.MONOSPACE, Typeface.BOLD);
        return tv;
    }

    /** Top of {@code Wheel.list}; true = handled, no row scroll. */
    public static boolean step(View lv, MyBaseAdapter a, int type) {
        try {
            long now = SystemClock.uptimeMillis();
            boolean replay = (now - lastCall) < BURST_MS;
            lastCall = now;

            if (lv == null || a == null || !enabled()) { fast = 0; return false; }
            int mode = mode(lv, a);
            if (mode == NONE) { fast = 0; return false; }

            if (replay) return true;

            if (!jumping) {
                fast = (now - lastClick) < FAST_MS ? fast + 1 : 1;
                lastClick = now;
                if (fast < threshold()) return false;     // still an ordinary row step
                jumping = true;
            }
            lastClick = now;

            jump(lv, a, type, mode);
            show(lv, keyAt(a, a.getPosition(), mode));
            return true;
        } catch (Throwable t) {
            fast = 0;
            jumping = false;
            return false;
        }
    }

    /** By Activity class and adapter: {@code SongListAdapter} alone serves four sorts. */
    private static int mode(View lv, MyBaseAdapter a) {
        Context c = lv.getContext();
        if (!(c instanceof Activity)) return NONE;
        String screen = c.getClass().getName();
        SharedPreferencesUtils sp = SharedPreferencesUtils.INSTANCE;

        if (screen.endsWith(".SongListActivity") && a instanceof SongListAdapter) {
            return songs(sp.getSortAllSong());
        }
        // An artist's "Show all songs" or an album's songs, each with its own sort.
        if (screen.endsWith(".AlbumsActivity") && a instanceof SongListAdapter) {
            return songs(Albums.songListSort());
        }
        // "Date added" rides on FileName_A_To_Z, so it is asked about separately.
        if (screen.endsWith(".PlayListActivity") && a instanceof SongListAdapter) {
            if (Playlists.byAddedOn()) return NONE;
            return songs(sp.getSortPlayListSong());
        }
        if (screen.endsWith(".ArtistsActivity") && a instanceof MainAdapter) {
            int s = sp.getSortArtist();
            return (s == Y1Repository.SortArtistsType.A_Z.getType()
                 || s == Y1Repository.SortArtistsType.Z_A.getType()) ? LETTER : NONE;
        }
        if (screen.endsWith(".AlbumsActivity") && a instanceof AlbumListAdapter) {
            // This screen's own sort: an artist's album list keeps one.
            int s = Albums.albumSortFor((Activity) c);
            if (s == Y1Repository.SortAlbumType.A_Z.getType()
             || s == Y1Repository.SortAlbumType.Z_A.getType()) return LETTER;
            if (s == Y1Repository.SortAlbumType.Date_Asc.getType()
             || s == Y1Repository.SortAlbumType.Date_Desc.getType()) return YEAR;
        }
        // One list for four levels; the adapter is the level.
        if (screen.endsWith(".GenresActivity")) {
            int k = Genres.alphaKind(a);
            if (k == Genres.A_LETTER) return LETTER;
            if (k == Genres.A_YEAR) return YEAR;
        }
        return NONE;
    }

    /**
     * Only the SONG-NAME sorts, in the order of the keys {@link #label} reads. Deliberately not the
     * file-name sorts: file names open with track numbers, and every group would be a digit.
     */
    private static int songs(int s) {
        return is(s, Y1Repository.SongSortType.SongName_A_To_Z,
                     Y1Repository.SongSortType.SongName_Z_To_A) ? LETTER : NONE;
    }

    private static boolean is(int v, Y1Repository.SongSortType a, Y1Repository.SongSortType b) {
        return v == a.getType() || v == b.getType();
    }

    private static void jump(View lv, MyBaseAdapter a, int type, int mode) {
        int n = a.getCount();
        int pos = a.getPosition();
        if (pos < 0) pos = 0;
        String cur = keyAt(a, pos, mode);
        int target = -1;

        if (type == 1) {
            for (int i = pos + 1; i < n; i++) {
                if (!cur.equals(keyAt(a, i, mode))) { target = i; break; }
            }
            if (target < 0) target = n - 1;
        } else {
            int i = pos - 1;
            while (i >= 0 && cur.equals(keyAt(a, i, mode))) i--;   // last row of the previous group
            if (i < 0) {
                target = 0;
            } else {
                String prev = keyAt(a, i, mode);
                while (i > 0 && prev.equals(keyAt(a, i - 1, mode))) i--;   // ...and up to its first
                target = i;
            }
        }
        if (target == pos) return;

        a.setPosition(target);                   // setPosition repaints
        if (lv instanceof androidx.recyclerview.widget.RecyclerView) {
            Bar.stand((androidx.recyclerview.widget.RecyclerView) lv);
        }
        // To the top in BOTH directions, through Lv (not setSelection).
        Lv.pin(lv, target);
    }

    private static String keyAt(MyBaseAdapter a, int pos, int mode) {
        if (pos < 0 || pos >= a.getCount()) return mode == YEAR ? NO_YEAR : OTHER;
        // A button row would otherwise join the group its wording starts with.
        if (Mark.blocked(a, pos)) return mode == YEAR ? NO_YEAR : OTHER;
        Object o = a.getItem(pos);
        if (mode == YEAR) {
            if (!(o instanceof Album)) return NO_YEAR;
            String y = YearCache.get(((Album) o).getName());
            return (y == null || y.length() == 0) ? NO_YEAR : y;
        }
        String s = label(a, o);
        if (s == null) return OTHER;
        s = s.trim();
        // Untagged is Constant.UNKNOWN (sorted last), not "": one group, or the plate shows "￦".
        if (s.length() == 0 || Constant.UNKNOWN.equals(s)) return OTHER;
        // Every first character is its own group, digits and punctuation too.
        return String.valueOf(Character.toUpperCase(s.charAt(0)));
    }

    /**
     * The text a row is GROUPED by: it follows the SORT, so with "Song titles from metadata" off a
     * name-sorted list shows file names while the plate shows the tag title's letter — the order
     * the list is really in. Deliberate.
     */
    private static String label(MyBaseAdapter a, Object o) {
        if (o instanceof Song) {
            Song s = (Song) o;
            boolean byTitle = (a instanceof SongListAdapter) && ((SongListAdapter) a).getCanShowSongName();
            if (!byTitle) byTitle = Prefs.on(a.getContext(), "meta_title");
            if (byTitle) return s.getSongName();
            return SharedPreferencesUtils.INSTANCE.processFileExtensions(s.getName());
        }
        if (o instanceof Album) return Prefs.albumLabel(((Album) o).getName());
        if (o instanceof Genre) return ((Genre) o).getName();
        if (o instanceof String) return AlbumArtists.name((String) o);   // Album Artists' marker
        return null;
    }

    /** In the Activity's content FrameLayout, reused while that Activity is up. */
    private static void show(View lv, String key) {
        TextView tv = overlay(lv);
        if (tv == null) return;
        if (OTHER.equals(key)) key = OTHER_TEXT;
        tv.setText(key);
        fit(tv, key, key.length() > 2 ? YEAR_SP : LETTER_SP,
                lv.getResources().getDisplayMetrics().density);
        tv.setVisibility(View.VISIBLE);
        lv.removeCallbacks(HIDE);
        lv.postDelayed(HIDE, IDLE_MS);
    }

    private static TextView overlay(View lv) {
        Context c = lv.getContext();
        if (!(c instanceof Activity)) return null;
        Activity act = (Activity) c;
        View content = act.getWindow().getDecorView().findViewById(android.R.id.content);
        if (!(content instanceof FrameLayout)) return null;
        FrameLayout root = (FrameLayout) content;

        Object o = overlayRef == null ? null : overlayRef.get();
        if (o instanceof TextView && ((TextView) o).getParent() == root) return (TextView) o;

        float d = c.getResources().getDisplayMetrics().density;

        TextView tv = new TextView(c);
        tv.setText("");
        tv.setTextColor(ink());
        tv.setGravity(Gravity.CENTER);
        tv.setIncludeFontPadding(false);
        // The theme font, fake bold where it has no bold cut; before fit().
        tv.setTypeface(Typeface.MONOSPACE, Typeface.BOLD);

        int size = dress(tv, d);
        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(size, size);
        lp.gravity = Gravity.CENTER;
        lp.topMargin = barOffset(act, d);
        root.addView(tv, lp);
        overlayRef = new WeakReference(tv);
        return tv;
    }

    /**
     * One fixed square, sized for a four-digit year in the SYSTEM font — never the theme's, or a
     * wide theme font grows the plate. The text gives way instead ({@link #fit}).
     */
    private static int side(float d) {
        int pad = (int) (PAD_DP * d + 0.5f);
        android.text.TextPaint p = new android.text.TextPaint();
        p.setAntiAlias(true);
        p.setTypeface(Typeface.create(Typeface.DEFAULT, Typeface.BOLD));
        p.setTextSize(YEAR_SP * d);
        return (int) (p.measureText("0000") + 0.5f) + pad * 2;
    }

    /**
     * {@code baseSp}, or less until it fits in the view's own font (width is linear in size). Height
     * by the font's METRICS, which is what the TextView centres and clips by.
     */
    private static void fit(TextView tv, String text, int baseSp, float d) {
        int room = side(d) - 2 * (int) (PAD_DP * d + 0.5f);
        android.text.TextPaint p = new android.text.TextPaint(tv.getPaint());
        p.setTextSize(baseSp * d);
        float k = 1f;
        float w = p.measureText(text);
        if (w > room) k = room / w;
        Paint.FontMetrics fm = p.getFontMetrics();
        float h = fm.descent - fm.ascent;
        if (h > room) k = Math.min(k, room / h);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, k < 1f ? baseSp * k : baseSp);
    }

    /** Centred over the LIST: the app's own status bar is the content's top 45px. */
    private static int barOffset(Activity act, float d) {
        try {
            View bar = act.getWindow().getDecorView().findViewById(R.id.status_bar);
            if (bar == null || bar.getVisibility() != View.VISIBLE) return 0;
            int h = bar.getHeight();
            if (h <= 0) h = (int) (BAR_DP * d + 0.5f);      // not laid out yet
            return h / 2;
        } catch (Throwable t) {
            return 0;
        }
    }

    /** The wheel reports only clicks, so "let go" is a gap of {@link #IDLE_MS}. */
    static final class Hide implements Runnable {
        public void run() {
            fast = 0;
            jumping = false;
            Object o = overlayRef == null ? null : overlayRef.get();
            if (!(o instanceof TextView)) return;
            TextView tv = (TextView) o;
            tv.setVisibility(View.GONE);
            ViewGroup p = (tv.getParent() instanceof ViewGroup) ? (ViewGroup) tv.getParent() : null;
            if (p != null) p.removeView(tv);
            overlayRef = null;
        }
    }

    /** {@code menuBackgroundColor}, as the submenus. */
    private static int plate() {
        try {
            Integer c = ThemeManager.INSTANCE.menuBGColor();
            if (c != null) return (c.intValue() & 0x00FFFFFF) | PLATE_ALPHA;
        } catch (Throwable t) {
        }
        return PLATE_RGB | PLATE_ALPHA;
    }

    /**
     * {@code menuItemTextColor}: the SAME theme section as the plate's fill. The list text colour
     * can give black on black on a theme that sets its menu against itself.
     */
    private static int ink() {
        int c = Icons.menuColor();
        return c == 0 ? Color.WHITE : c;
    }

    /** The shadow's room on every side, px. */
    private static int margin(float d) {
        return (int) ((SHADOW_DP + SHADOW_DY_DP) * d + 0.5f);
    }

    /** The VIEW grows by the shadow's margin; the square keeps its size and place. */
    private static int dress(TextView tv, float d) {
        int side = side(d);
        tv.setBackgroundDrawable(new BitmapDrawable(tv.getResources(), plateBitmap(side, d)));
        return side + margin(d) * 2;
    }

    // Drawn ONCE into a bitmap: a blurred shadow is software-only on 4.2, and a software layer on
    // the view would take the key off the hardware path at every jump. Rebuilt on a theme change.
    private static Bitmap plateBm;
    private static int plateKey;

    /**
     * The shadow is punched out under the translucent plate (CLEAR, antialiased), or it would
     * darken the plate's middle.
     */
    private static Bitmap plateBitmap(int side, float d) {
        int fill = plate();
        int key = side * 31 + fill;
        Bitmap b = plateBm;
        if (b != null && !b.isRecycled() && key == plateKey) return b;

        int m = margin(d);
        int w = side + m * 2;
        float r = RADIUS_DP * d;
        b = Bitmap.createBitmap(w, w, Bitmap.Config.ARGB_8888);
        Canvas cv = new Canvas(b);

        Path path = new Path();
        path.addRoundRect(new RectF(m, m, m + side, m + side), r, r, Path.Direction.CW);

        Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
        p.setColor(SHADOW_COLOR);
        p.setShadowLayer(SHADOW_DP * d, 0.0f, SHADOW_DY_DP * d, SHADOW_COLOR);
        cv.drawPath(path, p);

        p = new Paint(Paint.ANTI_ALIAS_FLAG);
        p.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.CLEAR));
        cv.drawPath(path, p);

        p = new Paint(Paint.ANTI_ALIAS_FLAG);
        p.setColor(fill);
        cv.drawPath(path, p);

        plateBm = b;
        plateKey = key;
        return b;
    }

    private static boolean enabled() {
        Context c = Y1Application.Companion.getAppContext();
        return Prefs.on(c, "alpha_scroll");
    }

    private static int threshold() {
        Context c = Y1Application.Companion.getAppContext();
        int i = c == null ? THRESHOLD_DEFAULT
                          : Prefs.val(c, "alpha_threshold");
        if (i < 0 || i >= THRESHOLDS.length) i = THRESHOLD_DEFAULT;
        return THRESHOLDS[i];
    }
}
