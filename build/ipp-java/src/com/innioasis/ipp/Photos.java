package com.innioasis.ipp;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.cardview.widget.CardView;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.chad.library.adapter.base.BaseQuickAdapter;
import com.innioasis.y1.R;
import com.innioasis.y1.theme.ThemeManager;
import com.innioasis.y1.utils.PhotosDialog;
import com.innioasis.y1.view.ThemeOptionsDialog;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.WeakHashMap;

/**
 * The Photos screen and its icon strip in the theme's colours. Tiles: list text colour, the
 * focused frame, the folder picture recoloured (plate to the menu background, folder to the
 * timeline's colour). Strip: dressed as the long-press menu, its highlight as wide as the widest
 * label, so it keeps one size and follows the language.
 */
public final class Photos {

    private Photos() { }

    private static final int WHITE = 0xFFFFFFFF;

    /** {@code bg_submenu}. */
    private static final int MENU_BG = 0xFF8C94B2;

    /** Each side of the widest label inside the highlight. */
    private static final int PAD = 6;

    public static int menuBg() {
        Integer c = ThemeManager.INSTANCE.menuBGColor();
        return c == null ? MENU_BG : c.intValue();
    }

    /**
     * The focused tile's frame: the focused text's colour, or the Themes frame where that is the
     * folder plate's colour and the frame would vanish into it.
     */
    public static int focus(android.content.Context c) {
        int f = Theme.focusColor(c);
        return ((f ^ menuBg()) & 0xFFFFFF) == 0 ? Theme.tileFrame() : f;
    }

    /** The name under a tile. */
    public static void name(TextView tv) {
        if (tv == null) return;
        try {
            ThemeManager.INSTANCE.itemSetTextColor(tv, WHITE, false);
        } catch (Throwable t) {
        }
    }

    /** Off the cursor; full under it. */
    private static final float PLATE_IDLE = 0.8f;

    private static Bitmap folder;
    private static Bitmap folderFocus;
    private static int folderBg;
    private static int folderFg;

    /** After stock's {@code setImageResource}; focus read off the card the bind already painted. */
    public static void folder(ImageView iv) {
        if (iv == null) return;
        try {
            int bg = menuBg();
            int fg = Icons.progressColor();
            if (fg == 0) return;
            if (folder == null || bg != folderBg || fg != folderFg) {
                Bitmap idle = recolour(iv.getResources(), bg, fg, PLATE_IDLE);
                Bitmap full = recolour(iv.getResources(), bg, fg, 1f);
                if (idle == null || full == null) return;
                folder = idle;
                folderFocus = full;
                folderBg = bg;
                folderFg = fg;
            }
            boolean focus = false;
            Object p = iv.getParent();
            if (p instanceof CardView) {
                focus = ((CardView) p).getCardBackgroundColor().getDefaultColor() != 0;
            }
            iv.setImageBitmap(focus ? folderFocus : folder);
        } catch (Throwable t) {
        }
    }

    /**
     * {@code icon_folder.png} is two flat colours: each pixel is placed between them by luminance
     * and redrawn between {@code bg} and {@code fg}, edges included. {@code plate} scales the
     * plate's alpha.
     */
    private static Bitmap recolour(Resources r, int bg, int fg, float plate) {
        Bitmap src = BitmapFactory.decodeResource(r, R.drawable.icon_folder);
        if (src == null) return null;
        int w = src.getWidth();
        int h = src.getHeight();
        int[] px = new int[w * h];
        src.getPixels(px, 0, w, 0, 0, w, h);
        src.recycle();
        int lo = 255;
        int hi = 0;
        for (int i = 0; i < px.length; i++) {
            if ((px[i] >>> 24) < 128) continue;
            int l = lum(px[i]);
            if (l < lo) lo = l;
            if (l > hi) hi = l;
        }
        if (hi <= lo) return null;
        for (int i = 0; i < px.length; i++) {
            int a = px[i] >>> 24;
            if (a == 0) continue;
            float t = (lum(px[i]) - lo) / (float) (hi - lo);
            if (t < 0) t = 0;
            if (t > 1) t = 1;
            int alpha = (int) (a * (plate + (1 - plate) * t));
            px[i] = (alpha << 24) | mix(bg, fg, t);
        }
        return Bitmap.createBitmap(px, w, h, Bitmap.Config.ARGB_8888);
    }

    private static int lum(int p) {
        return (((p >> 16) & 0xFF) * 299 + ((p >> 8) & 0xFF) * 587 + (p & 0xFF) * 114) / 1000;
    }

    private static int mix(int a, int b, float t) {
        int r = (int) (((a >> 16) & 0xFF) * (1 - t) + ((b >> 16) & 0xFF) * t);
        int g = (int) (((a >> 8) & 0xFF) * (1 - t) + ((b >> 8) & 0xFF) * t);
        int bl = (int) ((a & 0xFF) * (1 - t) + (b & 0xFF) * t);
        return (r << 16) | (g << 8) | bl;
    }

    /**
     * From {@code PhotosDialog.onCreate}. A late theme bitmap may land on an entry that has lost
     * the cursor, so the strip is rebound when one arrives — cached by then.
     */
    public static void bar(RecyclerView rv) {
        if (rv == null) return;
        try {
            Rule rule = new Rule();
            rv.setTag(rule);
            rv.addItemDecoration(rule);
            paintBar(rv);
            Object root = rv.getParent();
            if (root instanceof View) {
                try {
                    shapePopup((View) root);
                } catch (Throwable t) {
                }
            }
            Repaint r = new Repaint(rv);
            Rows.watchFlat(r);
            Theme.watchMenuRows(r);
        } catch (Throwable t) {
        }
    }

    /** The menu colour's share kept when the theme's menu rows are see-through. */
    private static final float SEE_THROUGH = 0.9f;

    private static final int RULE_PX = 2;

    private static void paintBar(RecyclerView rv) {
        rv.setBackgroundColor(barColor());
        Object o = rv.getTag();
        if (o instanceof Rule) {
            ((Rule) o).paint.setColor(ruleColor(rv.getContext()));
            rv.invalidate();
        }
    }

    /** The list text's colour, read back off a probe. */
    private static int ruleColor(Context c) {
        TextView probe = new TextView(c);
        ThemeManager.INSTANCE.itemSetTextColor(probe, WHITE, false);
        return probe.getCurrentTextColor();
    }

    /** As {@code dialog_photos.xml}. */
    private static final int POPUP_RADIUS_DIP = 10;
    private static final int POPUP_ENTRY_DIP = 10;

    /** A better-Y menu row's hairline. */
    private static final int HAIR_ALPHA = 0x1F000000;

    /**
     * The "Set as" popup's geometry, once, while the dialog is built: it is INVISIBLE and holds its
     * room, and a size changed on opening makes the screen jump. Card cleared (its API 17 shadow is
     * a white rim); entries equal by MINIMUM width — MATCH_PARENT stretches the popup.
     */
    private static void shapePopup(View root) {
        View c = root.findViewById(R.id.set_wallpaper);
        View dv = root.findViewById(R.id.desktop);
        View gv = root.findViewById(R.id.global);
        if (!(c instanceof CardView) || !(dv instanceof TextView) || !(gv instanceof TextView)) return;
        CardView card = (CardView) c;
        TextView desktop = (TextView) dv;
        TextView global = (TextView) gv;
        View pv = root.findViewById(R.id.ipp_pl_cover);
        TextView cover = pv instanceof TextView ? (TextView) pv : null;
        View coverLine = root.findViewById(R.id.ipp_pl_cover_line);
        boolean withCover = cover != null;
        if (cover != null) cover.setVisibility(withCover ? View.VISIBLE : View.GONE);
        if (coverLine != null) coverLine.setVisibility(withCover ? View.VISIBLE : View.GONE);
        View sv = root.findViewById(R.id.ipp_ss_photo);
        TextView saver = sv instanceof TextView ? (TextView) sv : null;
        View saverLine = root.findViewById(R.id.ipp_ss_photo_line);
        float d = card.getResources().getDisplayMetrics().density;
        int pad = (int) (POPUP_ENTRY_DIP * d);
        shapeEntry(desktop, pad);
        shapeEntry(global, pad);
        int wide = Math.max(entryWidth(desktop), entryWidth(global));
        if (withCover) {
            shapeEntry(cover, pad);
            wide = Math.max(wide, entryWidth(cover));
            cover.setMinWidth(wide);
        }
        if (saver != null) {
            shapeEntry(saver, pad);
            wide = Math.max(wide, entryWidth(saver));
            saver.setMinWidth(wide);
            if (withCover) cover.setMinWidth(wide);
        }
        desktop.setMinWidth(wide);
        global.setMinWidth(wide);

        Object p = desktop.getParent();
        if (p instanceof ViewGroup) {
            ViewGroup box = (ViewGroup) p;
            int rule = ruleColor(card.getContext());
            GradientDrawable fill = new GradientDrawable();
            fill.setColor(barColor());
            fill.setCornerRadius(POPUP_RADIUS_DIP * d);
            fill.setStroke(RULE_PX, rule);
            box.setBackgroundDrawable(fill);
            int inset = (int) Math.ceil(POPUP_RADIUS_DIP * d * 0.3f) + RULE_PX;
            box.setPadding(inset, inset, inset, inset);
            int i = box.indexOfChild(desktop) + 1;
            View line = i < box.getChildCount() ? box.getChildAt(i) : null;
            if (line != null && !(line instanceof TextView)) hairline(line, rule);
            if (coverLine != null) hairline(coverLine, rule);
            if (saverLine != null) hairline(saverLine, rule);
        }
        card.setCardBackgroundColor(Color.TRANSPARENT);
        card.setCardElevation(0);
        card.setMaxCardElevation(0);
        card.setUseCompatPadding(false);
        card.setPreventCornerOverlap(false);
        card.setRadius(POPUP_RADIUS_DIP * d);
    }

    private static void hairline(View line, int rule) {
        line.setBackgroundColor((rule & 0x00FFFFFF) | HAIR_ALPHA);
        ViewGroup.LayoutParams lp = line.getLayoutParams();
        if (lp != null) {
            lp.height = 1;
            line.setLayoutParams(lp);
        }
        line.setLayerType(View.LAYER_TYPE_NONE, null);
    }

    /** Stock knew two entries; the playlist cover counts only while shown, the screensaver last. */
    public static int popupNext(CardView card, int pos) {
        return Math.min(pos + 1, saverPos(card));
    }

    /** The screensaver entry's position: after the playlist cover when that one is shown. */
    private static int saverPos(CardView card) {
        try {
            View v = card == null ? null : card.findViewById(R.id.ipp_pl_cover);
            if (v != null && v.getVisibility() == View.VISIBLE) return 3;
        } catch (Throwable t) {
        }
        return 2;
    }

    /** {@code PhotosDialog.setWallpaper}, once the desktop or global wallpaper is in place. */
    public static void wallpaperSet(android.content.Context c) {
        try {
            android.widget.Toast.makeText(c, R.string.ipp_wallpaper_set, android.widget.Toast.LENGTH_SHORT).show();
        } catch (Throwable t) {
        }
    }

    /** {@code PhotosDialog.onKeyUp}, centre in the popup: the picture becomes the screensaver's. */
    public static boolean popupSaver(CardView card, int pos, String path) {
        if (pos != saverPos(card)) return false;
        try {
            Prefs.setString(card.getContext(), Saver.KEY_IMAGE, path);
            Prefs.setInt(card.getContext(), Saver.KEY_BG, Saver.BG_WALLPAPER);
            Saver.prefetchWall(card.getContext(), null);
            android.widget.Toast.makeText(card.getContext(), R.string.ipp_ss_set, android.widget.Toast.LENGTH_SHORT).show();
        } catch (Throwable t) {
        }
        return true;
    }

    private static void shapeEntry(TextView tv, int pad) {
        ViewGroup.LayoutParams lp = tv.getLayoutParams();
        if (lp instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams m = (ViewGroup.MarginLayoutParams) lp;
            m.setMargins(0, 0, 0, 0);
            m.setMarginStart(0);
            m.setMarginEnd(0);
            tv.setLayoutParams(m);
        }
        tv.setPadding(pad, pad, pad, pad);
        tv.setGravity(Gravity.CENTER);
        tv.setTypeface(Typeface.MONOSPACE);
    }

    /**
     * From {@code PhotosDialog.refreshWallpaper}, every show and step. Must not change a size
     * (see {@link #shapePopup}).
     */
    public static void wallpaperPopup(CardView card, TextView desktop, TextView global, int pos) {
        if (desktop == null || global == null) return;
        try {
            popupEntry(desktop, pos == 0);
            popupEntry(global, pos == 1);
            View cover = card == null ? null : card.findViewById(R.id.ipp_pl_cover);
            if (cover instanceof TextView && cover.getVisibility() == View.VISIBLE) {
                popupEntry((TextView) cover, pos == 2);
            }
            View saver = card == null ? null : card.findViewById(R.id.ipp_ss_photo);
            if (saver instanceof TextView) popupEntry((TextView) saver, pos == saverPos(card));
        } catch (Throwable t) {
        }
    }

    private static void popupEntry(TextView tv, boolean focus) {
        int fg = tv.getResources().getColor(
                focus ? R.color.selected_text_color_submenu : R.color.white);
        ThemeManager.INSTANCE.menuItemSetTextColor(tv, fg, focus);
        highlight(tv, focus);
    }

    private static int entryWidth(TextView tv) {
        CharSequence s = tv.getText();
        float w = s == null ? 0 : tv.getPaint().measureText(s.toString());
        return (int) Math.ceil(w) + tv.getPaddingLeft() + tv.getPaddingRight();
    }

    /** The strip's top rule; {@code onDrawOver}, so it lies over a highlight. */
    static final class Rule extends RecyclerView.ItemDecoration {
        final Paint paint = new Paint();

        public void onDrawOver(Canvas c, RecyclerView parent, RecyclerView.State state) {
            c.drawRect(0, 0, parent.getWidth(), RULE_PX, paint);
        }
    }

    /** At 90% where the theme's menu rows are see-through. */
    private static int barColor() {
        int c = menuBg();
        if (Theme.menuRowsPainted()) return c;
        return ((int) (Color.alpha(c) * SEE_THROUGH) << 24) | (c & 0x00FFFFFF);
    }

    static final class Repaint implements Runnable {
        private final WeakReference rv;

        Repaint(RecyclerView rv) {
            this.rv = new WeakReference(rv);
        }

        public void run() {
            Object o = rv.get();
            if (!(o instanceof RecyclerView)) return;
            RecyclerView v = (RecyclerView) o;
            paintBar(v);
            RecyclerView.Adapter a = v.getAdapter();
            if (a != null) a.notifyDataSetChanged();
        }
    }

    /**
     * A theme's 640px row highlight on a ~90px entry: stretched, its borders vanish. Scaled by
     * HEIGHT, its two ends meet in the middle; the uniform middle is what is left out.
     */
    static final class Ends extends Drawable {
        private final Bitmap b;
        private final Paint p = new Paint(Paint.FILTER_BITMAP_FLAG);
        private final Rect src = new Rect();
        private final Rect dst = new Rect();

        Ends(Bitmap b) {
            this.b = b;
        }

        public void draw(Canvas c) {
            Rect r = getBounds();
            int w = r.width();
            int h = r.height();
            int bw = b.getWidth();
            int bh = b.getHeight();
            if (w <= 0 || h <= 0 || bw <= 0 || bh <= 0 || b.isRecycled()) return;
            int mid = r.left + w / 2;
            int half = (int) ((mid - r.left) * bh / (float) h);
            if (2 * half >= bw) {
                c.drawBitmap(b, null, r, p);
                return;
            }
            src.set(0, 0, half, bh);
            dst.set(r.left, r.top, mid, r.bottom);
            c.drawBitmap(b, src, dst, p);
            half = (int) ((r.right - mid) * bh / (float) h);
            src.set(bw - half, 0, bw, bh);
            dst.set(mid, r.top, r.right, r.bottom);
            c.drawBitmap(b, src, dst, p);
        }

        public void setAlpha(int a) {
            p.setAlpha(a);
        }

        public void setColorFilter(ColorFilter f) {
            p.setColorFilter(f);
        }

        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /** One strip entry, after stock painted it. */
    public static void menuItem(Object adapter, ImageView icon, TextView label, boolean focus) {
        if (icon == null || label == null) return;
        try {
            label.setTypeface(Typeface.MONOSPACE);
            int fg = label.getResources().getColor(
                    focus ? R.color.selected_text_color_submenu : R.color.white);
            ThemeManager.INSTANCE.menuItemSetTextColor(label, fg, focus);
            Icons.menu(icon, label.getCurrentTextColor());

            Object p = label.getParent();
            if (!(p instanceof View)) return;
            View cell = (View) p;
            highlight(cell, focus);
            fit(adapter, cell, label);
        } catch (Throwable t) {
        }
    }

    /**
     * The menu's row highlight, strip and popup alike. Cleared first, stock's guaranteed after:
     * ThemeManager leaves the view untouched while its bitmap loads (as in {@code PickDialog}).
     */
    public static void highlight(View cell, boolean focus) {
        cell.setTag(Rows.FLAT);
        cell.setBackgroundDrawable(null);
        ThemeManager.INSTANCE.menuItemSetBackground(cell,
                focus ? R.drawable.item_selected_submenu : 0, focus);
        if (focus && cell.getBackground() == null) {
            cell.setBackgroundResource(R.drawable.item_selected_submenu);
        }
        Drawable bg = cell.getBackground();
        if (bg instanceof BitmapDrawable) {
            Bitmap b = ((BitmapDrawable) bg).getBitmap();
            if (b != null) cell.setBackgroundDrawable(new Ends(b));
        }
        Rows.noSize(cell);
    }

    /** Both screens' {@code SubItem}s: missing one leaves the widest at zero, every entry a sliver. */
    private static String textOf(Object o) {
        if (o instanceof PhotosDialog.SubItem) return ((PhotosDialog.SubItem) o).getText();
        if (o instanceof ThemeOptionsDialog.SubItem) return ((ThemeOptionsDialog.SubItem) o).getText();
        return null;
    }

    /**
     * Narrowed to the widest label, centred in its column. Both margin fields are written: a
     * marginStart set elsewhere wins over leftMargin.
     */
    private static void fit(Object adapter, View cell, TextView label) {
        if (!(adapter instanceof BaseQuickAdapter)) return;
        List items = ((BaseQuickAdapter) adapter).getData();
        if (items == null || items.isEmpty()) return;
        float widest = 0;
        for (int i = 0; i < items.size(); i++) {
            String s = textOf(items.get(i));
            if (s == null) continue;
            widest = Math.max(widest, label.getPaint().measureText(s));
        }
        int col = cell.getResources().getDisplayMetrics().widthPixels / items.size();
        int w = Math.min(col, (int) Math.ceil(widest) + 2 * PAD);
        ViewGroup.LayoutParams lp = cell.getLayoutParams();
        if (!(lp instanceof ViewGroup.MarginLayoutParams)) return;
        ViewGroup.MarginLayoutParams m = (ViewGroup.MarginLayoutParams) lp;
        int start = (col - w) / 2;
        if (m.width == w && m.leftMargin == start) return;
        m.width = w;
        m.leftMargin = start;
        m.setMarginStart(start);
        cell.setLayoutParams(m);
    }

    /** Per grid, {first visible tile, offset} for each folder level entered. */
    private static final WeakHashMap windows = new WeakHashMap();

    /** Opening a folder, in step with stock's {@code stackIndex}. */
    public static void enter(RecyclerView rv) {
        try {
            if (rv == null) return;
            ArrayList stack = (ArrayList) windows.get(rv);
            if (stack == null) {
                stack = new ArrayList();
                windows.put(rv, stack);
            }
            int[] w = null;
            RecyclerView.LayoutManager lm = rv.getLayoutManager();
            if (lm instanceof LinearLayoutManager) {
                LinearLayoutManager l = (LinearLayoutManager) lm;
                int first = l.findFirstVisibleItemPosition();
                View v = first < 0 ? null : l.findViewByPosition(first);
                if (v != null) {
                    // As scrollToPositionWithOffset measures: from the padding to the margin.
                    ViewGroup.LayoutParams lp = v.getLayoutParams();
                    int margin = lp instanceof ViewGroup.MarginLayoutParams
                            ? ((ViewGroup.MarginLayoutParams) lp).topMargin : 0;
                    w = new int[]{first, l.getDecoratedTop(v) - margin - rv.getPaddingTop()};
                }
            }
            stack.add(w);
        } catch (Throwable t) {
        }
    }

    /** Back out of a folder: the window restored at once (stock smooth-scrolled from the top). */
    public static void back(RecyclerView rv, int mark) {
        try {
            if (rv == null) return;
            ArrayList stack = (ArrayList) windows.get(rv);
            int[] w = stack == null || stack.isEmpty() ? null
                    : (int[]) stack.remove(stack.size() - 1);
            RecyclerView.LayoutManager lm = rv.getLayoutManager();
            if (w != null && lm instanceof LinearLayoutManager && w[0] <= mark
                    && w[0] < rv.getAdapter().getItemCount()) {
                ((LinearLayoutManager) lm).scrollToPositionWithOffset(w[0], w[1]);
            } else {
                rv.scrollToPosition(mark);
            }
        } catch (Throwable t) {
            try {
                rv.scrollToPosition(mark);
            } catch (Throwable ignored) {
            }
        }
    }

    /**
     * The long-press mark on or off a tile, rebound in place: stock notified the whole grid, and
     * every tile was rebound and repainted for the one mark the menu sets and clears.
     */
    public static void mark(android.app.Activity a, Object adapter, int pos) {
        if (!rebind(a, adapter, pos)) ((RecyclerView.Adapter) adapter).notifyItemChanged(pos);
    }

    /** Clears the marks, then rebinds the tiles that carried one. */
    public static void unmark(android.app.Activity a, Object adapter, List marked) {
        Object[] was = marked.toArray();
        marked.clear();
        for (int i = 0; i < was.length; i++) {
            if (was[i] instanceof Integer) mark(a, adapter, ((Integer) was[i]).intValue());
        }
    }

    private static boolean rebind(android.app.Activity a, Object adapter, int pos) {
        try {
            RecyclerView.Adapter ad = (RecyclerView.Adapter) adapter;
            if (pos < 0 || pos >= ad.getItemCount()) return true;
            RecyclerView rv = ((com.innioasis.y1.databinding.ActivityPhotosBinding)
                    ((com.innioasis.y1.activity.PhotosActivity) a).getVb()).recycler;
            RecyclerView.ViewHolder h = rv.findViewHolderForAdapterPosition(pos);
            if (h == null) return false;
            ad.bindViewHolder(h, pos);
            return true;
        } catch (Throwable t) {
            return false;
        }
    }
}
