package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.widget.EditText;

import androidx.recyclerview.widget.RecyclerView;

import com.innioasis.fm.configs.KeyMap;
import com.innioasis.music.adapter.rv.RVBaseAdapter;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.utils.SharedPreferencesUtils;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;

/**
 * The on-screen keyboard ({@code InputMethodDialog}): case, alphabet and the letter strip.
 *
 * Stock had one alphabet, fixed at build time by the interface language (Russian → Cyrillic,
 * everything else → Latin), always drawn in capitals and always typed in lower case. Here the
 * strip shows exactly what pressing centre will type, and the two side questions — WHICH case and
 * WHICH alphabet — are on the two buttons that had nothing to do in this dialog:
 *
 *   - bottom, short — case (lower ↔ capital), and it also releases caps lock;
 *   - bottom, held — caps lock: the case stops falling back after a letter, and an arrow
 *       appears at the right-hand end of the input box;
 *   - top, held — the next layout: Latin → digits and symbols → Cyrillic → Latin, with
 *       the Cyrillic step in the ring only while "Second keyboard language" says so. The code of
 *       the one switched to is flashed on {@code Alpha}'s plate and goes by itself.
 *
 * The state is static, and that is correct here
 * There is exactly one of these dialogs on screen at a time, and each Activity keeps its own
 * lazily — {@code onCreate} therefore runs once per screen, while {@code show()} may run many
 * times. So the views are held weakly from {@link #attach} and the case is decided by what is in
 * the box rather than by a "dialog opened" event, which there is no reliable hook for. The
 * alphabet is remembered in the preferences instead: having picked Cyrillic once, the next search
 * should open in it.
 *
 * The capital on an empty box
 * A name is typed with a capital and a search is not, but the dialog cannot tell those apart — so
 * the rule is the one every phone keyboard uses: an empty box means the next letter is a capital,
 * and the case falls back to lower as soon as anything is in it. That is decided in {@link #value},
 * injected into {@code setEditTextValue}, which is the ONE place both paths go through — typing a
 * character and seeding the box for a rename.
 */
public final class Keys {

    private Keys() { }

    // ---- case ---------------------------------------------------------------------------------
    private static final int LOWER = 0;
    private static final int SHIFT = 1;   // one capital, then back to lower
    private static final int CAPS  = 2;   // caps lock: stays until switched off

    /** better-Y → "Second keyboard language": 0 = off, 1 = Russian. */
    public static final String KEY_SECOND = "kb_lang2";

    /** The layout last used, one of {@link #LAT}/{@link #NUM}/{@link #CYR}. Not user-facing. */
    private static final String KEY_LANG = "kb_lang";

    // ---- layouts, in the order the held top button walks them ---------------------------------
    private static final int LAT = 0;
    private static final int CYR = 1;   // only while "Second keyboard language" says so
    private static final int NUM = 2;   // always in the ring

    private static final String LATIN = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    /** Stock's own Russian row, in stock's order (Ё after Е). */
    private static final String CYRILLIC = "АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ";
    /**
     * Punctuation first, digits in the middle, the rarer symbols last — the order the user asked
     * for, and it puts what a name usually needs within a click or two of the start. Space is not
     * here: it is on the right-hand button already.
     */
    private static final String SYMBOLS = ".,?!'\"-_()0123456789[]@#$%&*+=/:;";

    /** The interface language index of Русский in {@code LanguageActivity.languageList}. */
    private static final int RUSSIAN = 4;

    private static int mode = SHIFT;
    private static int lang;

    private static WeakReference actRef;
    private static WeakReference listRef;
    private static WeakReference boxRef;
    private static WeakReference adRef;

    private static Drawable arrow;

    // ---------------------------------------------------------------- the dialog's own hooks

    /**
     * End of {@code InputMethodDialog.onCreate}. The dialog hands its own views over rather than
     * having them read back out of it: {@code binding} and {@code adapter} are private, and a
     * private member of another class is an {@code IllegalAccessError} from here just as it is
     * from smali.
     */
    public static void attach(Activity act, RecyclerView list, EditText box, RVBaseAdapter ad) {
        try {
            actRef = new WeakReference(act);
            listRef = new WeakReference(list);
            boxRef = new WeakReference(box);
            adRef = new WeakReference(ad);
            lang = Prefs.getInt(ctx(), KEY_LANG, LAT);
            if (lang == CYR && !secondOn()) lang = LAT;   // the setting was turned off since
            mode = SHIFT;                       // the box is empty until something seeds it
            apply();
        } catch (Throwable t) {
            // a keyboard that cannot be set up is still stock-usable
        }
    }

    /**
     * The letters, in the case they will be typed in. Replaces the body of stock's {@code
     * charsTable} lazy, which chose the alphabet by interface language and always returned
     * capitals.
     */
    public static List table() {
        String src = (lang == CYR) ? CYRILLIC : (lang == NUM) ? SYMBOLS : LATIN;
        boolean upper = mode != LOWER;
        ArrayList l = new ArrayList(src.length());
        for (int i = 0; i < src.length(); i++) {
            char c = src.charAt(i);
            l.add(String.valueOf(upper ? c : Character.toLowerCase(c)));
        }
        return l;
    }

    /**
     * How many key repeats count as "held" for this key.
     *
     * A repeat is ~50 ms after the platform's initial ~400 ms, so stock's {@code > 5} was ~700 ms
     * on top of that — fine for the one thing it guarded (the centre button putting the screen to
     * sleep, which must not go off by accident) and far too slow for a button whose held action is
     * ordinary work. The top and bottom buttons therefore use 1, the same number
     * {@code Ipp.playerLongLimit} gives the player's top button; the centre keeps stock's.
     */
    public static int hold(int key) {
        try {
            KeyMap km = KeyMap.INSTANCE;
            if (key == km.getKEY_MENU() || key == km.getKEY_PLAY()) return 1;
        } catch (Throwable t) {
            // fall through to stock
        }
        return 6;
    }

    /** Bottom button, short: capitals ↔ lower case. Caps lock is released by it as well. */
    public static void shift() {
        mode = (mode == LOWER) ? SHIFT : LOWER;
        apply();
    }

    /** Bottom button, held: caps lock on or off. */
    public static void caps() {
        mode = (mode == CAPS) ? LOWER : CAPS;
        apply();
    }

    /**
     * Top button, held: the next layout, round the ring Latin → digits → Cyrillic → Latin. The
     * digits are always in the ring; Cyrillic only while the "Second keyboard language" setting
     * says so, and then the ring is two long instead of three.
     */
    public static void alphabet() {
        if (lang == LAT) lang = secondOn() ? CYR : NUM;
        else if (lang == CYR) lang = NUM;
        else lang = LAT;
        try {
            Prefs.setInt(ctx(), KEY_LANG, lang);
        } catch (Throwable t) {
            // not being remembered is not a reason to refuse the switch
        }
        // The cursor goes back to the start: the layouts do not line up with each other, so the
        // place it was standing in means nothing in the one that has just come up.
        apply(true);
        Object a = actRef == null ? null : actRef.get();
        Object v = listRef == null ? null : listRef.get();
        if (a instanceof Activity && v instanceof View) {
            Alpha.flash((Activity) a, (View) v, code());
        }
    }

    /** What the plate says: the layout switched to. */
    private static String code() {
        if (lang == CYR) return "RU";
        if (lang == NUM) return "123";
        return "EN";
    }

    /**
     * Top of {@code setEditTextValue}: what the box is about to hold. Empty → the next letter is a
     * capital; anything else → lower case. Caps lock overrules both, which is what it is for.
     */
    public static void value(String s) {
        if (mode == CAPS) return;
        int want = (s == null || s.length() == 0) ? SHIFT : LOWER;
        if (want == mode) return;
        mode = want;
        // Nothing on screen depends on the case while the digits are up, so the strip is left
        // alone — the case still changes underneath, for when the letters come back.
        if (lang != NUM) apply();
    }

    /**
     * What {@code setEditTextValue} actually puts in the box: the whole string while it fits, and
     * otherwise {@code "..."} plus as much of the TAIL as the box can hold.
     *
     * How much fits is a width, not a character count. Stock cut at 6 characters, measured
     * for the 110dip box it shared with the letter row; when the box became a full-width row that
     * number was raised to 18, which is the same mistake one size up — a count cannot know that
     * "iiii" and "WWWW" are not the same width. Eighteen narrow letters left a quarter of the box
     * empty (reported), and a theme with a wider font would have overflowed it instead. Measuring
     * against the box's own paint is right for every string and every theme at once.
     *
     * Three things come off the usable width: the box's padding, the CapsLock arrow when it is
     * showing (a compound drawable, which {@code getWidth()} knows nothing about), and a caret's
     * worth at the end — the caret sits after the last glyph and has to stay on screen, or typing
     * looks like it has stopped.
     *
     * Before the first layout the box has no width — the seeding of a rename gets there — and
     * then the old count rule answers, which is what it was always doing at that moment anyway.
     */
    public static String fit(EditText box, String s) {
        try {
            if (s == null) return "";
            if (box == null) return countFit(s);
            float room = box.getWidth() - box.getPaddingLeft() - box.getPaddingRight() - CARET_PX;
            Drawable[] d = box.getCompoundDrawables();
            if (d != null && d.length > 2 && d[2] != null) {
                room -= d[2].getIntrinsicWidth() + box.getCompoundDrawablePadding();
            }
            if (room <= 0f) return countFit(s);
            Paint p = box.getPaint();
            if (p == null) return countFit(s);
            if (p.measureText(s) <= room) return s;

            float dots = p.measureText(DOTS);
            int n = s.length();
            int keep = 0;
            // Grow the tail one character at a time while the ellipsis and it still fit.
            for (int i = n; i > 0; i--) {
                if (dots + p.measureText(s, i - 1, n) > room) break;
                keep = n - i + 1;
            }
            if (keep < 1) keep = 1;      // never answer with the ellipsis alone
            return DOTS + s.substring(n - keep);
        } catch (Throwable t) {
            return s;
        }
    }

    private static final String DOTS = "...";
    /** Room kept free at the right-hand end for the caret. */
    private static final float CARET_PX = 8f;

    /** Stock's rule, kept for the one moment the box cannot be measured. */
    private static String countFit(String s) {
        return s.length() <= 18 ? s : DOTS + s.substring(s.length() - 16);
    }

    // ---------------------------------------------------------------- the letter strip

    /**
     * One wheel step along the strip. Replaces {@code RVBaseAdapter.toNext/toPrevious}, which is
     * stock's {@code notifyDataSetChanged()} + {@code smoothScrollToPosition()} per click — the
     * pattern {@code Wheel.follow} exists to replace (an animation restarted per click, every
     * visible cell rebound). This is the one horizontal list the wheel drives; see
     * {@code Wheel.scrollTo}.
     */
    public static void next() {
        step(1);
    }

    public static void prev() {
        step(-1);
    }

    private static void step(int d) {
        try {
            RVBaseAdapter ad = adapter();
            RecyclerView rv = list();
            if (ad == null || rv == null) return;
            int n = ad.getItemCount();
            if (n <= 0) return;
            int pos = ad.getSelectPosition() + d;
            if (pos < 0) pos = 0;
            if (pos >= n) pos = n - 1;
            ad.setSelectPosition(pos, false);
            Wheel.follow(rv, pos, ad);
        } catch (Throwable t) {
            // a wheel click must never take the dialog down
        }
    }

    /**
     * Re-fill the strip from {@link #table()} and put the caps-lock arrow where it belongs.
     *
     * The cursor keeps its place — the alphabets are different lengths (26 against 33), so it is
     * clamped rather than reset: switching to Cyrillic in the middle of the row should not throw
     * the strip back to А.
     */
    private static void apply() {
        apply(false);
    }

    private static void apply(boolean toStart) {
        try {
            RVBaseAdapter ad = adapter();
            if (ad == null) return;
            List t = table();
            int pos = toStart ? 0 : ad.getSelectPosition();
            ad.setItemList(t);
            if (pos >= t.size()) pos = t.size() - 1;
            if (pos < 0) pos = 0;
            ad.setSelectPosition(pos, false);
            RecyclerView rv = list();
            if (rv != null) Wheel.follow(rv, pos, ad);
            markCaps();
        } catch (Throwable t) {
            // ignore
        }
    }

    /**
     * The caps-lock arrow at the right-hand end of the input box, as a compound drawable — the box
     * is a stock view with no room for a sibling, and a compound drawable moves with the text
     * rather than sitting over it. Drawn rather than shipped as an asset (like the picker's tick,
     * `PickDialog`), so it needs no mipmap and no id in public.xml.
     */
    private static void markCaps() {
        Object o = boxRef == null ? null : boxRef.get();
        if (!(o instanceof EditText)) return;
        EditText box = (EditText) o;
        box.setCompoundDrawablesWithIntrinsicBounds(null, null, mode == CAPS ? arrow(box) : null, null);
    }

    private static Drawable arrow(View host) {
        if (arrow != null) return arrow;
        float d = host.getResources().getDisplayMetrics().density;
        int s = (int) (16 * d + 0.5f);
        if (s < 8) s = 8;
        Bitmap bm = Bitmap.createBitmap(s, s, Bitmap.Config.ARGB_8888);
        Canvas c = new Canvas(bm);
        Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
        p.setColor(0xFF000000);                    // the box's own text colour (@color/black)
        float w = s;
        float h = s;
        Path path = new Path();
        path.moveTo(w * 0.5f, h * 0.06f);          // head
        path.lineTo(w * 0.96f, h * 0.5f);
        path.lineTo(w * 0.7f, h * 0.5f);
        path.lineTo(w * 0.7f, h * 0.94f);          // stem
        path.lineTo(w * 0.3f, h * 0.94f);
        path.lineTo(w * 0.3f, h * 0.5f);
        path.lineTo(w * 0.04f, h * 0.5f);
        path.close();
        c.drawPath(path, p);
        arrow = new BitmapDrawable(host.getResources(), bm);
        return arrow;
    }

    // ---------------------------------------------------------------- settings

    /** True while a second alphabet is enabled in better-Y. */
    public static boolean secondOn() {
        try {
            return Prefs.val(ctx(), KEY_SECOND) == 1;
        } catch (Throwable t) {
            return false;
        }
    }

    /**
     * What the setting means before anyone has touched it. Stock gave a Russian device a Cyrillic
     * keyboard and no way to type Latin at all; the second alphabet replaces that, so on a Russian
     * device it starts enabled — otherwise the change would read as "the Russian letters are gone".
     */
    public static int defaultSecond() {
        try {
            return SharedPreferencesUtils.INSTANCE.getLanguage() == RUSSIAN ? 1 : 0;
        } catch (Throwable t) {
            return 0;
        }
    }

    // ---------------------------------------------------------------- plumbing

    private static RVBaseAdapter adapter() {
        Object o = adRef == null ? null : adRef.get();
        return (o instanceof RVBaseAdapter) ? (RVBaseAdapter) o : null;
    }

    private static RecyclerView list() {
        Object o = listRef == null ? null : listRef.get();
        return (o instanceof RecyclerView) ? (RecyclerView) o : null;
    }

    private static Context ctx() {
        return Y1Application.Companion.getAppContext();
    }
}
