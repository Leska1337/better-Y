package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.SystemClock;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ListView;
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
 * #362.3 — jump-scrolling long lists by first letter (or, for albums sorted by date, by year).
 *
 * Spin the wheel; once {@link #threshold()} clicks have come in quick succession the list stops
 * moving by rows and starts moving by <b>group</b>, with the group's key shown large in the middle
 * of the screen. Off by default; the toggle is "Alphabetical fast scroll" in innioasis++, with a
 * sub-row for the number of clicks that arms it.
 *
 * <h3>Where it applies</h3>
 * Only where a jump means something, decided by <b>screen + that screen's own sort setting</b>:
 * <ul>
 *   <li>All songs, sorted by song name → by letter</li>
 *   <li>Artists (A–Z / Z–A, its only sorts) → by letter</li>
 *   <li>Albums, A–Z / Z–A → by letter; Albums, oldest/newest first → <b>by year</b></li>
 * </ul>
 * Under any other sort the letters are scattered and a "next letter" would land one row further
 * on, over and over — so nothing changes there at all. The screen is identified by its Activity
 * class and the level by its adapter, which is the only thing available here: a ListAdapter is all
 * {@code Wheel.list} has, and {@code SongListAdapter} alone serves All songs, an album, an artist
 * and a playlist, each with its own stored sort.
 *
 * <h3>No acceleration in those lists</h3>
 * One wheel click reaches {@code Wheel.list} once, and then several more times in a row, because
 * {@code SpeedUtil.runMultipleTimes} replays the step synchronously to accelerate long scrolls.
 * Where this feature applies, those replays are <b>dropped</b> ({@link #BURST_MS} tells a replay
 * from a real click): below the threshold that means one click = one row, above it one click = one
 * group. Otherwise the acceleration both flies past the rows the user is reading and makes the
 * threshold nearly unreachable. Every other list keeps stock acceleration untouched.
 *
 * <h3>Leaving jump mode</h3>
 * Only by letting go of the wheel: {@link #IDLE_MS} after the last click the key comes off screen
 * and the next click steps by row again. Slowing down deliberately does <b>not</b> drop out — the
 * point is to be able to step group by group and read them.
 */
public final class Alpha {

    private Alpha() { }

    private static final int NONE = 0;
    private static final int LETTER = 1;
    private static final int YEAR = 2;

    /** Shortest gap that can separate two real clicks; below it, this is SpeedUtil replaying. */
    private static final long BURST_MS = 25;

    /** Clicks closer together than this count towards arming the jump. */
    private static final long FAST_MS = 250;

    /** No click for this long: the key comes off screen and jump mode ends. */
    private static final long IDLE_MS = 1000;

    /**
     * Click counts offered by the "Activation threshold" row, in menu order — 5..60 by 5.
     * Public because the menu row is built from this very array ({@code IppActivity.buildItems}):
     * the stored preference is an INDEX into it, so the two must never be able to disagree.
     */
    public static final int[] THRESHOLDS =
            { 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60 };
    public static final int THRESHOLD_DEFAULT = 5;           // = 30 clicks

    /** The plate behind the key, when the theme does not supply one. See {@link #plate}. */
    private static final int PLATE_RGB = 0x007AFF;

    /**
     * The plate is translucent, the way the iPod's letter overlay is: it sits on top of the list
     * the user is scrolling, and a solid block reads as a screen of its own.
     */
    private static final int PLATE_ALPHA = 0xCC000000;

    /** Plate geometry, dp: padding around the key and the corner radius. */
    private static final int PAD_DP = 14;
    private static final int RADIUS_DP = 12;

    /** Key text size, sp: one letter, vs a four-digit year that needs four glyphs. */
    private static final int LETTER_SP = 56;
    private static final int YEAR_SP = 40;

    /** Fallback for the app's own status bar (res/values/dimens.xml), dp. See {@link #barOffset}. */
    private static final int BAR_DP = 45;

    /**
     * The group of rows that have no key of their own: a "Show all songs" button row, and a song
     * with no title tag.
     *
     * <p>Its key is <b>not a character</b>, and that is the whole point. A real key is now always
     * exactly one character — the row's own first one — so any marker chosen out of the alphabet
     * can be a real key as well: "#" collides with a song called "#Selfie", "?" with one called
     * "?" and so on for whatever gets picked next. A key of a different LENGTH cannot collide with
     * any of them, whatever a song turns out to be called.
     *
     * <p>{@link #OTHER_TEXT} is what the plate DRAWS for it. A label may repeat — "#Selfie" is
     * shown "#" as well — but the two are separate groups and the jump steps between them; it is
     * the identity that has to be unique, not the glyph.
     */
    private static final String OTHER = "(no key)";
    private static final String OTHER_TEXT = "#";

    /**
     * An album whose year is not known. Safe as a plain character, unlike {@link #OTHER}: in
     * {@link #YEAR} mode a key is a year out of {@code YearCache} and can only be digits.
     */
    private static final String NO_YEAR = "?";

    private static long lastCall;
    private static long lastClick;
    private static int fast;
    private static boolean jumping;

    private static WeakReference overlayRef;    // TextView
    private static final Hide HIDE = new Hide();

    /** How long {@link #flash} leaves its plate on screen. */
    private static final long FLASH_MS = 700;

    /**
     * The same plate, borrowed by the on-screen keyboard to say which alphabet it has just
     * switched to (`Keys`, #409). It is not a jump key: it appears on the switch, sits there for
     * {@link #FLASH_MS} and goes — nothing on the keyboard has to be scrolled to find it, so
     * leaving it up would only cover the screen.
     *
     * <p>It is the jump key's own square, at its own size — the two are the same object as far as
     * the user is concerned, so nothing about it is re-measured for the shorter text. What differs
     * is the window it lives in (see below) and that the Activity is passed in rather than taken
     * from the host view's context: the host here is a view of the <b>dialog's</b> window, whose
     * context is a {@code ContextThemeWrapper}, not the Activity itself.
     */
    public static void flash(Activity act, View host, String text) {
        try {
            if (act == null || host == null || text == null) return;
            float d = act.getResources().getDisplayMetrics().density;

            TextView tv = plateView(act, d);
            tv.setText(text);
            tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, YEAR_SP);
            int side = side(tv, d);            // the jump key's own square, same size, fixed

            // A window of its own, and that is the whole point: the jump key is a child of the
            // Activity's content view, which the keyboard's DIALOG covers — the plate came up
            // BEHIND it. A PopupWindow is a sub-window hung off the host's own window token, so it
            // is drawn over the window the host belongs to, dialog included.
            hidePop();
            PopupWindow pw = new PopupWindow(tv, side, side);
            pw.setBackgroundDrawable(null);
            pw.setTouchable(false);
            pw.setFocusable(false);
            pw.setOutsideTouchable(false);

            // ...but a sub-window is laid out inside its PARENT window's frame, so Gravity.CENTER
            // centred the plate on the keyboard dialog sitting at the bottom of the screen, not on
            // the screen. The position is therefore computed in screen coordinates and passed as
            // an offset from the parent window's own origin (NO_GRAVITY = left/top + x/y).
            int[] onScreen = new int[2];
            int[] inWindow = new int[2];
            host.getLocationOnScreen(onScreen);
            host.getLocationInWindow(inWindow);
            android.util.DisplayMetrics dm = act.getResources().getDisplayMetrics();
            // Centred on the WHOLE screen, status bar included — unlike a jump key, which is
            // shifted down by half the bar to sit in the middle of the list it belongs to
            // (barOffset). Here there is no list under the plate: the keyboard covers the bottom
            // of the screen and the plate is simply in the middle of what is left.
            int x = (dm.widthPixels - side) / 2 - (onScreen[0] - inWindow[0]);
            int y = (dm.heightPixels - side) / 2 - (onScreen[1] - inWindow[1]);
            pw.showAtLocation(host, Gravity.NO_GRAVITY, x, y);
            pop = pw;

            host.removeCallbacks(POP_HIDE);
            host.postDelayed(POP_HIDE, FLASH_MS);
        } catch (Throwable t) {
            // an overlay is never worth taking a key press down with it
        }
    }

    /**
     * A STRONG reference, deliberately. It was a {@code WeakReference} first and the plate could
     * be left on screen for good: nothing else holds the PopupWindow object itself (the window
     * manager holds its decor view), so a collection between two switches lost the handle, the
     * next switch had nothing to dismiss and put a second plate over the first. Cleared on
     * dismiss, so it holds an Activity no longer than the plate is up.
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
            // a dismissed-twice popup is not an error worth propagating
        }
    }

    /** The plate as a standalone view, for {@link #flash} — same look, no parent of its own. */
    private static TextView plateView(Activity act, float d) {
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(plate());
        bg.setCornerRadius(RADIUS_DP * d);

        TextView tv = new TextView(act);
        tv.setTextColor(Color.WHITE);
        tv.setGravity(Gravity.CENTER);
        tv.setIncludeFontPadding(false);
        tv.setBackgroundDrawable(bg);
        tv.setTypeface(Typeface.MONOSPACE, Typeface.BOLD);
        return tv;
    }

    /**
     * Handle one wheel step, or decline it. Called at the top of {@code Wheel.list};
     * {@code true} means the step is dealt with and the ordinary row scroll must not run.
     */
    public static boolean step(ListView lv, MyBaseAdapter a, int type) {
        try {
            long now = SystemClock.uptimeMillis();
            boolean replay = (now - lastCall) < BURST_MS;
            lastCall = now;

            if (lv == null || a == null || !enabled()) { fast = 0; return false; }
            int mode = mode(lv, a);
            if (mode == NONE) { fast = 0; return false; }

            if (replay) return true;             // no acceleration where this feature applies

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
            return false;                        // never take a wheel click down with us
        }
    }

    // ---------------------------------------------------------------- where it applies

    private static int mode(ListView lv, MyBaseAdapter a) {
        Context c = lv.getContext();
        if (!(c instanceof Activity)) return NONE;
        String screen = c.getClass().getName();
        SharedPreferencesUtils sp = SharedPreferencesUtils.INSTANCE;

        if (screen.endsWith(".SongListActivity") && a instanceof SongListAdapter) {
            return songs(sp.getSortAllSong());
        }
        // An artist's "Show all songs" — the same flat "everything at once" list All songs is, and
        // the same reason to want it. Its sort is its own (the marker list keeps a separate key),
        // and a real album's song list comes through here too: sorted by name it jumps by letter,
        // by track number it does not, which is the rule everywhere else.
        if (screen.endsWith(".AlbumsActivity") && a instanceof SongListAdapter) {
            return songs(Albums.songListSort());
        }
        // A playlist's songs: the same flat list of names, with a sort of its own. The ipp
        // "date added" mode rides on FileName_A_To_Z, so it has to be asked about separately —
        // the stored sort would otherwise answer for an order that is not alphabetical at all.
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
            // an artist's album list keeps its own sort -- ask about THIS screen, not the app-wide one
            int s = Albums.albumSortFor((Activity) c);
            if (s == Y1Repository.SortAlbumType.A_Z.getType()
             || s == Y1Repository.SortAlbumType.Z_A.getType()) return LETTER;
            if (s == Y1Repository.SortAlbumType.Date_Asc.getType()
             || s == Y1Repository.SortAlbumType.Date_Desc.getType()) return YEAR;
        }
        // Genres pages all four of its levels through one ListView, so the adapter is the level and
        // each level has a sort of its own to ask about (v0.26.3). Genres answers for all four.
        if (screen.endsWith(".GenresActivity")) {
            int k = Genres.alphaKind(a);
            if (k == Genres.A_LETTER) return LETTER;
            if (k == Genres.A_YEAR) return YEAR;
        }
        return NONE;
    }

    /**
     * A song list may be jumped through by letter only while it is ORDERED by the keys the jump
     * groups on — otherwise "next letter" lands one row further on, over and over. That order is
     * the SONG-NAME sort and only it: the list is then in the order of the tag titles
     * ({@code order by lower(pinyinSongName)}), which is what {@link #label} reads.
     *
     * <p>Deliberately NOT the file-name sorts, even though with "Song titles from metadata" off
     * those are the ones whose order the rows visibly show. The keys would then be file names, and
     * a file name of a track routinely opens with its track number — every group would be a digit
     * and the jump would be a jump between numbers, not between letters.
     */
    private static int songs(int s) {
        return is(s, Y1Repository.SongSortType.SongName_A_To_Z,
                     Y1Repository.SongSortType.SongName_Z_To_A) ? LETTER : NONE;
    }

    private static boolean is(int v, Y1Repository.SongSortType a, Y1Repository.SongSortType b) {
        return v == a.getType() || v == b.getType();
    }

    // ---------------------------------------------------------------- the jump

    private static void jump(ListView lv, MyBaseAdapter a, int type, int mode) {
        int n = a.getCount();
        int pos = a.getPosition();
        if (pos < 0) pos = 0;
        String cur = keyAt(a, pos, mode);
        int target = -1;

        if (type == 1) {
            for (int i = pos + 1; i < n; i++) {
                if (!cur.equals(keyAt(a, i, mode))) { target = i; break; }
            }
            if (target < 0) target = n - 1;      // last group already: park on the last row
        } else {
            int i = pos - 1;
            while (i >= 0 && cur.equals(keyAt(a, i, mode))) i--;   // last row of the previous group
            if (i < 0) {
                target = 0;                      // first group already: park on the first row
            } else {
                String prev = keyAt(a, i, mode);
                while (i > 0 && prev.equals(keyAt(a, i - 1, mode))) i--;   // ...and up to its first
                target = i;
            }
        }
        if (target == pos) return;

        a.setPosition(target);                   // setPosition repaints
        // The target row goes to the top in BOTH directions: the point of the jump is to see what
        // is under the new key, not to peek at the tail of the previous group. Through Head,
        // because the Shuffle row rides in the list's top padding now — a plain setSelection would
        // park the row at that padding and bring the Shuffle row back into the middle of the list.
        Head.selectPinned(lv, target);
    }

    /** The group a row belongs to: its first letter, or the album's year in {@link #YEAR} mode. */
    private static String keyAt(MyBaseAdapter a, int pos, int mode) {
        if (pos < 0 || pos >= a.getCount()) return mode == YEAR ? NO_YEAR : OTHER;
        // A "Show all albums" / "Show all songs" button is not an entry and has no key of its own;
        // leaving it to its label would file it under the letter its wording happens to start with
        // and merge it into a real group. It is a group of one, at the top, where it sits anyway.
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
        // A song with no title tag has no key of its own: an absent tag is not an empty string but
        // Constant.UNKNOWN — "<unknown>" behind four U+FFE6, a sort-key prefix that parks every one
        // of them together at the END of the list. So they are one group — OTHER, drawn "#"; left
        // to itself the first character would be that marker and the plate would show "￦".
        if (s.length() == 0 || Constant.UNKNOWN.equals(s)) return OTHER;
        // Every first character is a group of its own — a digit as much as a letter, and each
        // punctuation mark separately. Filing all of them into one "#" made a single group out of
        // everything a list opens with before "A", which on a list of file names is most of it:
        // "01 …", "1-04 …", "(live) …" all landed in the same jump. The sort these lists are in is
        // by character, so a group of one character is contiguous whatever the character is.
        return String.valueOf(Character.toUpperCase(s.charAt(0)));
    }

    /**
     * The text a row is GROUPED by, which is not always the text it shows.
     *
     * <p>For a song it is the tag title whenever the list is sorted by song name, and the file name
     * otherwise — i.e. it follows the SORT, because a group only means anything while the list is
     * in the order of the keys ({@code canShowSongName} is set by every screen's own
     * {@code switchSortType}, and by {@code Genres.flags}). With "Song titles from metadata" off
     * the rows then show file names while the plate shows the letter of the tag title: that is the
     * order the list is really in, and it is deliberate — the alternative is no fast scroll at all
     * on a name-sorted list with the setting off.
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
        if (o instanceof Genre) return ((Genre) o).getName();     // the genre list of Genres
        if (o instanceof String) return (String) o;
        return null;
    }

    // ---------------------------------------------------------------- the key on screen

    /**
     * Show the key over the middle of the screen and re-arm the idle timer. The view is added to
     * the Activity's own content FrameLayout (a FrameLayout on every Android, so a centred child
     * needs no layout of ours) and reused while that Activity is on screen.
     */
    private static void show(ListView lv, String key) {
        TextView tv = overlay(lv);
        if (tv == null) return;
        // The one key that is not what it draws: OTHER is an identity rather than a character,
        // so that no song can ever be filed into it by being called that. See its own comment.
        if (OTHER.equals(key)) key = OTHER_TEXT;
        tv.setText(key);
        // A year needs four glyphs where a letter needs one; the plate itself does not change
        // size — it is fixed at the widest case, see {@link #side}.
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, key.length() > 2 ? YEAR_SP : LETTER_SP);
        tv.setVisibility(View.VISIBLE);
        lv.removeCallbacks(HIDE);
        lv.postDelayed(HIDE, IDLE_MS);
    }

    private static TextView overlay(ListView lv) {
        Context c = lv.getContext();
        if (!(c instanceof Activity)) return null;
        Activity act = (Activity) c;
        View content = act.getWindow().getDecorView().findViewById(android.R.id.content);
        if (!(content instanceof FrameLayout)) return null;
        FrameLayout root = (FrameLayout) content;

        Object o = overlayRef == null ? null : overlayRef.get();
        if (o instanceof TextView && ((TextView) o).getParent() == root) return (TextView) o;

        float d = c.getResources().getDisplayMetrics().density;

        GradientDrawable bg = new GradientDrawable();
        bg.setColor(plate());
        bg.setCornerRadius(RADIUS_DP * d);

        TextView tv = new TextView(c);
        tv.setText("");
        tv.setTextColor(Color.WHITE);
        tv.setGravity(Gravity.CENTER);
        tv.setIncludeFontPadding(false);
        tv.setBackgroundDrawable(bg);
        // Per call, and the two-argument form: it is what follows a theme's font.ttf (ThemeManager
        // swaps the static Typeface.MONOSPACE) and what fakes bold when that font has no bold cut.
        tv.setTypeface(Typeface.MONOSPACE, Typeface.BOLD);

        int side = side(tv, d);
        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(side, side);
        lp.gravity = Gravity.CENTER;
        lp.topMargin = barOffset(act, d);
        root.addView(tv, lp);
        overlayRef = new WeakReference(tv);
        return tv;
    }

    /**
     * One fixed square for every key, iPod-style. The widest thing this ever shows is a
     * four-digit year, so that is what the plate is measured for — a single letter then sits in
     * the same square instead of the plate changing shape from one jump to the next. Measured
     * with the view's own paint (theme font included), not guessed from a dp constant.
     */
    private static int side(TextView tv, float d) {
        int pad = (int) (PAD_DP * d + 0.5f);
        android.text.TextPaint p = new android.text.TextPaint(tv.getPaint());
        p.setTextSize(YEAR_SP * d);
        return (int) (p.measureText("0000") + 0.5f) + pad * 2;
    }

    /**
     * Centre the plate over the LIST, not over the window. The window is fullscreen
     * ({@code BaseActivity.onCreate} sets FLAG_FULLSCREEN) and the app draws its own status bar
     * as the top 45px of {@code android.R.id.content}, so {@code Gravity.CENTER} sits half that
     * bar too high; shifting down by half its height puts the plate in the middle of what is
     * actually below it. Screens that hide the bar (the player) get no offset.
     */
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

    /**
     * The wheel has been left alone for {@link #IDLE_MS}: take the key off screen and end jump
     * mode, so the next click steps by row again. There is no "finger lifted" event to hook — the
     * wheel only ever reports clicks — so a gap with no clicks is what "let go" means here.
     */
    static final class Hide implements Runnable {
        public void run() {
            fast = 0;
            jumping = false;
            Object o = overlayRef == null ? null : overlayRef.get();
            if (!(o instanceof TextView)) return;
            TextView tv = (TextView) o;
            tv.setVisibility(View.GONE);
            ViewGroup p = (tv.getParent() instanceof ViewGroup) ? (ViewGroup) tv.getParent() : null;
            if (p != null) p.removeView(tv);     // don't outlive the Activity that holds it
            overlayRef = null;
        }
    }

    /**
     * The plate takes the theme's {@code menuBackgroundColor} — the colour behind the sort /
     * long-press submenu — so the key reads as part of the same interface. Drawn rather than
     * themed through {@code ThemeManager} (which paints views, not shapes), and with a fixed
     * fallback: with no theme selected there is no such colour at all. Read at creation only; a
     * theme switch re-creates the Activity and with it this view.
     */
    private static int plate() {
        try {
            Integer c = ThemeManager.INSTANCE.menuBGColor();
            if (c != null) return (c.intValue() & 0x00FFFFFF) | PLATE_ALPHA;
        } catch (Throwable t) {
            // malformed theme colour -> treat as absent
        }
        return PLATE_RGB | PLATE_ALPHA;
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
