package com.innioasis.y1.activity;

import android.graphics.Bitmap;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.graphics.drawable.BitmapDrawable;
import android.text.TextPaint;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.innioasis.fm.configs.KeyMap;
import com.innioasis.ipp.Force;
import com.innioasis.ipp.Help;
import com.innioasis.ipp.MenuStyle;
import com.innioasis.ipp.Pad;
import com.innioasis.ipp.Prefs;
import com.innioasis.ipp.Preview;
import com.innioasis.ipp.TipDialog;
import com.innioasis.ipp.Tone;
import com.innioasis.y1.R;
import com.innioasis.y1.base.BaseActivity;
import com.innioasis.y1.databinding.ActivityAboutBinding;
import com.innioasis.y1.theme.ThemeManager;
import com.innioasis.y1.utils.WallpaperUtils;

/**
 * The menu's Style preview: copies of the main menu and of Settings built from their own layouts,
 * with the cursor on the first row. Left/right pick a category, the wheel its value, written at
 * once and laid out by the same code as the real screens, so the top button keeps what is on
 * screen. Text color shows Settings, whose panel carries the text; the rest the main menu.
 * Finished in onStop: nothing of it stays behind, and the pictures are the shared caches'.
 */
public final class IppMenuActivity extends BaseActivity {

    /** The menu row that opens this screen. */
    public static final String KEY_STYLE = "menu_look";

    private static final String[] CATS = {MenuStyle.KEY, Pad.KEY, Preview.KEY};
    private static final int STYLE = 0;
    private static final int MARGINS = 1;
    private static final int TEXT = 2;
    /** Menu style as shown, Default, Even, Simple, to the stored index. */
    private static final int[] STYLES = {0, 2, 1};
    private static final String TIP = "ss_tip";
    private static final int BAND_H = 45;
    private static final int BAND_W = 460;

    private static final int[] MAIN_ROWS = {R.string.main_now, R.string.main_music,
            R.string.main_video, R.string.main_audiobook, R.string.main_book, R.string.main_photos,
            R.string.main_fm, R.string.main_bluetooth, R.string.main_setting};
    private static final int[] SET_ROWS = {R.string.ipp_settings_title,
            R.string.setting_change_theme, R.string.setting_eq, R.string.shuffle, R.string.repeat,
            R.string.setting_file_extensions, R.string.setting_key_lock};

    private TextView band;
    private TipDialog tip;
    private int cat;
    private int down = -1;
    private View mainPage;
    private View setPage;
    private RecyclerView mainList;
    private RecyclerView setList;
    private ImageView mainPic;
    private View panel;
    private ImageView setBack;

    @Override
    public ActivityAboutBinding getViewBinding() {
        return ActivityAboutBinding.inflate(getLayoutInflater());
    }

    @Override
    public void initView() {
        ((ViewGroup) getVb().getRoot()).removeAllViews();
        View content = ((android.app.Activity) this).findViewById(R.id.layoutContent);
        ViewGroup root = (ViewGroup) content.getParent();
        int at = root.indexOfChild(content) + 1;
        LayoutInflater inf = LayoutInflater.from(this);

        mainPage = inf.inflate(R.layout.activity_main, root, false);
        root.addView(mainPage, at, page());
        mainList = (RecyclerView) mainPage.findViewById(R.id.rc_list);
        mainList.setLayoutManager(new LinearLayoutManager(this));
        mainList.setAdapter(new Rows(this, MAIN_ROWS, true));
        mainPic = (ImageView) mainPage.findViewById(R.id.iv_now);
        ThemeManager.INSTANCE.commonSetIcon(mainPic, R.drawable.main_now_playing);
        ImageView mainBack = (ImageView) mainPage.findViewById(R.id.back);
        mainBack.setBackgroundDrawable(null);
        ThemeManager.INSTANCE.setDeskMask(mainBack);

        setPage = inf.inflate(R.layout.activity_setting, root, false);
        root.addView(setPage, at + 1, page());
        setList = (RecyclerView) setPage.findViewById(R.id.recycler);
        setList.setLayoutManager(new LinearLayoutManager(this));
        setList.setAdapter(new Rows(this, SET_ROWS, false));
        panel = (View) setPage.findViewById(R.id.right_title).getParent();
        ((TextView) setPage.findViewById(R.id.right_title)).setText(R.string.ipp_settings_title);
        ((TextView) setPage.findViewById(R.id.info_state_tv)).setText(R.string.ipp_version);
        MenuStyle.betterY((ImageView) setPage.findViewById(R.id.right_image));
        setBack = (ImageView) setPage.findViewById(R.id.back);
        setBack.setBackgroundDrawable(null);
        ThemeManager.INSTANCE.setSettingMask(setBack);

        band = new TextView(this);
        band.setGravity(Gravity.CENTER);
        band.setTextColor(0xFFFFFFFF);
        band.setTypeface(Typeface.MONOSPACE, Typeface.BOLD);
        band.setSingleLine(true);
        band.setBackgroundColor(0xB3000000);
        addContentView(band, new FrameLayout.LayoutParams(-1, BAND_H, Gravity.TOP));
        restyle();
        tip = TipDialog.show(this, TIP, TipDialog.STYLE_OFF);
    }

    private static ConstraintLayout.LayoutParams page() {
        ConstraintLayout.LayoutParams p = new ConstraintLayout.LayoutParams(-1, -1);
        p.topToTop = ConstraintLayout.LayoutParams.PARENT_ID;
        p.leftToLeft = ConstraintLayout.LayoutParams.PARENT_ID;
        return p;
    }

    /** Both pages as the style now says; also from {@code MenuStyle.apply} on every onResume. */
    public void restyle() {
        if (mainPage == null) return;
        boolean set = cat == TEXT;
        mainPage.setVisibility(set ? View.GONE : View.VISIBLE);
        setPage.setVisibility(set ? View.VISIBLE : View.GONE);
        MenuStyle.page(mainList, mainPic);
        MenuStyle.page(setList, panel);
        setBack.setVisibility(MenuStyle.simple(this) ? View.INVISIBLE : View.VISIBLE);
        int fg = Preview.fg(this);
        ((TextView) setPage.findViewById(R.id.right_title)).setTextColor(fg);
        ((TextView) setPage.findViewById(R.id.info_state_tv)).setTextColor(fg);
        Bitmap b = set ? WallpaperUtils.INSTANCE.getGlobalBitmap()
                : WallpaperUtils.INSTANCE.getDesktopBitmap();
        View decor = getWindow().getDecorView();
        if (b != null && decor.getTag(R.id.back) != b) {
            decor.setBackgroundDrawable(new BitmapDrawable(getResources(), b));
            decor.setTag(R.id.back, b);
        }
        bands();
    }

    @Override
    protected void onStop() {
        super.onStop();
        finish();
    }

    @Override
    protected void onDestroy() {
        try {
            if (tip != null && tip.isShowing()) tip.dismiss();
        } catch (Throwable t) {
        }
        tip = null;
        if (mainList != null) mainList.setAdapter(null);
        if (setList != null) setList.setAdapter(null);
        super.onDestroy();
    }

    @Override
    public boolean dispatchKeyEvent(KeyEvent e) {
        if (e == null) return true;
        if (Force.key(e)) return true;
        int code = e.getKeyCode();
        KeyMap k = KeyMap.INSTANCE;
        if (e.getAction() == KeyEvent.ACTION_DOWN) {
            Tone.key(e);
            if (e.getRepeatCount() == 0) down = code;
            if (code == k.getKEY_UP() || code == k.getKEY_DOWN()) {
                change(code == k.getKEY_DOWN() ? 1 : -1);
            } else if (e.getRepeatCount() == 0 && (code == k.getKEY_LEFT() || code == k.getKEY_RIGHT())) {
                cat = (cat + (code == k.getKEY_RIGHT() ? 1 : -1) + CATS.length) % CATS.length;
                restyle();
            }
            return true;
        }
        if (e.getAction() == KeyEvent.ACTION_UP && code == down) {
            down = -1;
            if (code == k.getKEY_MENU()) finish();
        }
        return true;
    }

    // ---- categories -------------------------------------------------------------------------

    /** The value as shown, the index into the asset row's values. */
    private int shown(int c) {
        if (c == MARGINS) return Prefs.on(this, Pad.KEY) ? 1 : 0;
        int v = Prefs.val(this, CATS[c]);
        if (c == STYLE) {
            for (int i = 0; i < STYLES.length; i++) {
                if (STYLES[i] == v) return i;
            }
            return 0;
        }
        return v < 0 || v > 2 ? 0 : v;
    }

    private void change(int step) {
        int v = shown(cat);
        if (cat == MARGINS) {
            Prefs.setBool(this, Pad.KEY, v == 0);
        } else {
            v = (v + step + 3) % 3;
            Prefs.setInt(this, CATS[cat], cat == STYLE ? STYLES[v] : v);
        }
        restyle();
    }

    /** The band in place of the status bar. */
    private void bands() {
        if (band == null) return;
        String key = CATS[cat];
        Help.Row r = Help.row(this, key);
        String name = r != null && r.label != null ? r.label : key;
        int v = shown(cat);
        String val = r != null && r.values != null && v < r.values.length ? r.values[v]
                : String.valueOf(v + 1);
        String text = "‹  " + name + ": " + val + "  ›";
        fit(band, 22, text, BAND_W, BAND_H - 4);
        band.setText(text);
    }

    /** From {@code px} down until {@code sample} fits {@code maxW} and a line {@code maxH}: theme fonts run large. */
    private static void fit(TextView t, float px, String sample, int maxW, int maxH) {
        TextPaint p = new TextPaint(t.getPaint());
        float s = px;
        for (; s > 8; s -= 1) {
            p.setTextSize(s);
            Paint.FontMetrics fm = p.getFontMetrics();
            if (p.measureText(sample) <= maxW && fm.descent - fm.ascent <= maxH) break;
        }
        t.setTextSize(TypedValue.COMPLEX_UNIT_PX, s);
    }

    // ---- the rows ---------------------------------------------------------------------------

    /** The main menu's rows (item_main) or Settings' (item_setting), painted as theirs; the first is the cursor. */
    static final class Rows extends RecyclerView.Adapter {
        private final IppMenuActivity a;
        private final int[] labels;
        private final boolean main;

        Rows(IppMenuActivity a, int[] labels, boolean main) {
            this.a = a;
            this.labels = labels;
            this.main = main;
        }

        @Override
        public int getItemCount() {
            return labels.length;
        }

        @Override
        public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int type) {
            return new Holder(LayoutInflater.from(a).inflate(
                    main ? R.layout.item_main : R.layout.item_setting, parent, false));
        }

        @Override
        public void onBindViewHolder(RecyclerView.ViewHolder h, int pos) {
            View row = h.itemView;
            boolean on = pos == 0;
            ThemeManager tm = ThemeManager.INSTANCE;
            TextView tv = (TextView) row.findViewById(main ? R.id.tv_item : R.id.title);
            ImageView arrow = (ImageView) row.findViewById(main ? R.id.iv_arrow : R.id.arrow);
            tv.setText(labels[pos]);
            if (!main) row.findViewById(R.id.text).setVisibility(View.GONE);
            View bg = main ? row.findViewById(R.id.layout) : row;
            if (on) {
                tm.itemSetBackground(bg, R.drawable.item_setting_sel, true);
                tm.itemSetTextColor(tv, main ? a.getResources().getColor(R.color.selected_text_color)
                        : 0xFF3CFFDE, true);
                tm.itemSetRightArrow(arrow, R.mipmap.right_arrow);
                arrow.setVisibility(View.VISIBLE);
            } else {
                tm.itemSetBackground(bg, main ? R.drawable.item_no_selected : 0, false);
                tm.itemSetTextColor(tv, a.getResources().getColor(R.color.white), false);
                arrow.setVisibility(main ? View.INVISIBLE : View.GONE);
            }
        }
    }

    static final class Holder extends RecyclerView.ViewHolder {
        Holder(View v) {
            super(v);
        }
    }

    @Override
    public void antiClockwise() {
    }

    @Override
    public void clockwise() {
    }

    @Override
    public void confirm() {
    }

    @Override
    public void direction(BaseActivity.Direction d) {
    }

    @Override
    public void longConfirm() {
    }

    @Override
    public void quit() {
        finish();
    }
}
