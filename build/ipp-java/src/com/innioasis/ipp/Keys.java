package com.innioasis.ipp;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Typeface;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.LayerDrawable;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.EditText;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;

import com.innioasis.fm.configs.KeyMap;
import com.innioasis.music.adapter.rv.RVBaseAdapter;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.utils.SharedPreferencesUtils;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;

/**
 * The on-screen keyboard ({@code InputMethodDialog}): the strip shows exactly what centre types.
 * Bottom short — case (also releases caps lock); bottom held — caps lock; top held — the next
 * layout, Latin → symbols → Cyrillic (only with "Second keyboard language"), flashed on
 * {@code Alpha}'s plate.
 *
 * State is static: one dialog at a time, kept lazily per Activity, so {@code show()} has no
 * reliable hook — views are held weakly from {@link #attach}. An empty box means a capital next
 * ({@link #value}, in {@code setEditTextValue}, which both typing and seeding pass through).
 */
public final class Keys {

    private Keys() { }

    private static final int LOWER = 0;
    private static final int SHIFT = 1;   // one capital, then back to lower
    private static final int CAPS  = 2;   // caps lock: stays until switched off

    /** "Second keyboard language": 0 = off, 1 = Russian. */
    public static final String KEY_SECOND = "kb_lang2";

    /** The layout last used, so the next search opens in it. */
    private static final String KEY_LANG = "kb_lang";

    private static final int LAT = 0;
    private static final int CYR = 1;   // only with "Second keyboard language"
    private static final int NUM = 2;

    private static final String LATIN = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    /** Stock's row and order. */
    private static final String CYRILLIC = "АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ";
    /** The order the user asked for. Space is on the right-hand button. */
    private static final String SYMBOLS = ".,?!'\"-_()0123456789[]@#$%&*+=/\\:;";

    /** Русский in {@code LanguageActivity.languageList}. */
    private static final int RUSSIAN = 4;

    private static int mode = SHIFT;
    private static int lang;

    private static WeakReference actRef;
    private static WeakReference listRef;
    private static WeakReference boxRef;
    private static WeakReference adRef;

    private static Drawable arrow;

    /**
     * End of {@code InputMethodDialog.onCreate}, which hands its views over: they are private
     * there, and reading them from here is an {@code IllegalAccessError}.
     */
    public static void attach(Activity act, RecyclerView list, EditText box, RVBaseAdapter ad) {
        try {
            actRef = new WeakReference(act);
            listRef = new WeakReference(list);
            boxRef = new WeakReference(box);
            adRef = new WeakReference(ad);
            lang = Prefs.getInt(ctx(), KEY_LANG, LAT);
            if (lang == CYR && !secondOn()) lang = LAT;
            mode = SHIFT;                       // the box is empty until something seeds it
            paint(list, box);
            apply();
        } catch (Throwable t) {
        }
    }

    private static final int SHADOW_DP = 3;
    /** Per ring; the ring against the face has all of them. */
    private static final int SHADOW_STEP = 0x18000000;

    /** A rounded face inset by {@code sh} with {@code sh} shadow rings, all inside the bounds. */
    private static Shadowed shadowed(int color, int radius, int sh) {
        Drawable[] layers = new Drawable[sh + 1];
        for (int i = 0; i < sh; i++) {
            GradientDrawable ring = new GradientDrawable();
            ring.setColor(SHADOW_STEP);
            ring.setCornerRadius(radius + sh - i);
            layers[i] = ring;
        }
        GradientDrawable face = new GradientDrawable();
        face.setColor(color);
        face.setCornerRadius(radius);
        layers[sh] = face;
        Shadowed d = new Shadowed(layers);
        for (int i = 0; i <= sh; i++) d.setLayerInset(i, i, i, i, i);
        return d;
    }

    /**
     * Each view grows by the shadow and gives it back out of its margins, so the faces stay put;
     * the panel's growth is the window's ({@link #frame}).
     */
    private static void paint(RecyclerView list, EditText box) {
        float dp = box.getResources().getDisplayMetrics().density;
        int sh = Math.round(SHADOW_DP * dp);
        View panel = (View) box.getParent();
        panel.setBackgroundDrawable(shadowed(Icons.menuBackground(), Math.round(8 * dp), sh));
        panel.setPadding(sh, sh, sh, sh);
        fitHeight(box, dp);

        if (box.getBackground() instanceof Shadowed) return;    // a second attach
        int l = box.getPaddingLeft();
        int t = box.getPaddingTop();
        int r = box.getPaddingRight();
        int b = box.getPaddingBottom();
        box.setBackgroundDrawable(shadowed(0xFFFFFFFF, Math.round(5 * dp), sh));
        box.setPadding(l + sh, t + sh, r + sh, b + sh);

        ViewGroup.LayoutParams lp = box.getLayoutParams();
        if (lp instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams m = (ViewGroup.MarginLayoutParams) lp;
            if (m.height > 0) m.height += 2 * sh;
            m.leftMargin -= sh;
            m.rightMargin -= sh;
            m.topMargin -= sh;
            box.setLayoutParams(m);
        }
        ViewGroup.LayoutParams llp = list.getLayoutParams();
        if (llp instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams m = (ViewGroup.MarginLayoutParams) llp;
            m.topMargin = Math.max(0, m.topMargin - sh);
            list.setLayoutParams(m);
        }
    }

    /** {@code dialog_input_method.xml}'s face height. */
    private static final int BOX_DP = 36;
    private static final float BOX_SP = 24f;
    private static final float BOX_SP_MIN = 12f;

    /** Shrunk until a line of the theme's font fits, padding included, or its tops are cut. */
    private static void fitHeight(EditText box, float dp) {
        android.util.DisplayMetrics dm = box.getResources().getDisplayMetrics();
        int room = Math.round(BOX_DP * dp) - 2;
        android.text.TextPaint p = new android.text.TextPaint(box.getPaint());
        float sp = BOX_SP;
        while (sp > BOX_SP_MIN) {
            p.setTextSize(android.util.TypedValue.applyDimension(
                    android.util.TypedValue.COMPLEX_UNIT_SP, sp, dm));
            Paint.FontMetricsInt fm = p.getFontMetricsInt();
            if (fm.bottom - fm.top <= room) break;
            sp -= 1f;
        }
        box.setTextSize(android.util.TypedValue.COMPLEX_UNIT_SP, sp);
    }

    /** Recognisable, so a second attach does not grow the box again. */
    static final class Shadowed extends LayerDrawable {
        Shadowed(Drawable[] layers) {
            super(layers);
        }
    }

    /** The window grown by the shadow, so the face keeps stock's width and place. */
    public static void frame(Dialog d) {
        if (d == null) return;
        try {
            Window w = d.getWindow();
            if (w == null) return;
            int sh = Math.round(SHADOW_DP * d.getContext().getResources().getDisplayMetrics().density);
            WindowManager.LayoutParams a = w.getAttributes();
            if (a.width > 0) a.width += 2 * sh;
            a.y = Math.max(0, a.y - sh);
            w.setAttributes(a);
        } catch (Throwable t) {
        }
    }

    /**
     * Tail of {@code MyViewHolder.bind}. Under the cursor: bold, panel colour, on the menu
     * highlight's colour — or the menu text colour when the highlight is a picture.
     */
    public static void cell(TextView tv, boolean selected) {
        if (tv == null) return;
        try {
            tv.setTextColor(selected ? Icons.menuBackground() | 0xFF000000 : Icons.menuText(false));
            tv.setTypeface(selected ? Typeface.DEFAULT_BOLD : Typeface.DEFAULT);
            if (selected) {
                GradientDrawable g = new GradientDrawable();
                int plate = Theme.menuSelectedColor();
                g.setColor(plate != 0 ? plate : Icons.menuText(false));
                g.setCornerRadius(5 * tv.getResources().getDisplayMetrics().density);
                tv.setBackgroundDrawable(g);
            } else {
                tv.setBackgroundDrawable(null);
            }
        } catch (Throwable t) {
        }
    }

    /** In the case they will be typed in; the body of stock's {@code charsTable} lazy. */
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
     * Key repeats that count as "held". Top and bottom: 1, as {@code Press.playerLongLimit};
     * the centre keeps stock's slow threshold, which guards against an accidental shutdown.
     */
    public static int hold(int key) {
        try {
            KeyMap km = KeyMap.INSTANCE;
            if (key == km.getKEY_MENU() || key == km.getKEY_PLAY()) return 1;
        } catch (Throwable t) {
        }
        return 6;
    }

    /** Also releases caps lock. */
    public static void shift() {
        mode = (mode == LOWER) ? SHIFT : LOWER;
        apply();
    }

    public static void caps() {
        mode = (mode == CAPS) ? LOWER : CAPS;
        apply();
    }

    public static void alphabet() {
        if (lang == LAT) lang = secondOn() ? CYR : NUM;
        else if (lang == CYR) lang = NUM;
        else lang = LAT;
        try {
            Prefs.setInt(ctx(), KEY_LANG, lang);
        } catch (Throwable t) {
        }
        // To the start: positions mean nothing across layouts.
        apply(true);
        Object a = actRef == null ? null : actRef.get();
        Object v = listRef == null ? null : listRef.get();
        if (a instanceof Activity && v instanceof View) {
            Alpha.flash((Activity) a, (View) v, code());
        }
    }

    private static String code() {
        if (lang == CYR) return "RU";
        if (lang == NUM) return "123";
        return "EN";
    }

    /** Top of {@code setEditTextValue}: empty → capital next, else lower. Caps lock overrules. */
    public static void value(String s) {
        if (mode == CAPS) return;
        int want = (s == null || s.length() == 0) ? SHIFT : LOWER;
        if (want == mode) return;
        mode = want;
        if (lang != NUM) apply();
    }

    /**
     * The whole string while it fits, else "..." plus as much of the TAIL as fits — measured with
     * the box's paint, not counted (a count cannot tell "iiii" from "WWWW"). Off the width: padding,
     * the caps arrow, and room for the caret. Before the first layout, the count rule.
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
    private static final float CARET_PX = 8f;

    /** For the moment the box cannot be measured. */
    private static String countFit(String s) {
        return s.length() <= 18 ? s : DOTS + s.substring(s.length() - 16);
    }

    /** In place of {@code toNext/toPrevious}: {@code Wheel.follow}, not a rebind and animation per click. */
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
            // Always a ring, whatever loop scrolling says.
            int pos = ad.getSelectPosition() + d;
            if (pos < 0) pos = n - 1;
            if (pos >= n) pos = 0;
            ad.setSelectPosition(pos, false);
            Wheel.follow(rv, pos, ad);
        } catch (Throwable t) {
        }
    }

    /** Refills the strip; the cursor keeps its place, clamped. */
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
        }
    }

    /** The caps arrow as a compound drawable: the stock box has no room for a sibling. */
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

    public static boolean secondOn() {
        try {
            return Prefs.val(ctx(), KEY_SECOND) == 1;
        } catch (Throwable t) {
            return false;
        }
    }

    /** On for a Russian device, which stock gave Cyrillic alone. */
    public static int defaultSecond() {
        try {
            return SharedPreferencesUtils.INSTANCE.getLanguage() == RUSSIAN ? 1 : 0;
        } catch (Throwable t) {
            return 0;
        }
    }

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
