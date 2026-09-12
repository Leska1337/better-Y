package com.innioasis.ipp;

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
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.cardview.widget.CardView;
import androidx.recyclerview.widget.RecyclerView;

import com.chad.library.adapter.base.BaseQuickAdapter;
import com.innioasis.y1.R;
import com.innioasis.y1.theme.ThemeManager;
import com.innioasis.y1.utils.PhotosDialog;

import java.lang.ref.WeakReference;
import java.util.List;

/**
 * The Photos screen and its icon strip in the theme's colours instead of the ones stock wrote in.
 *
 * Tiles: the name takes the list rows' text colour, the frame of the tile under the cursor the
 * colour a focused row's text takes, and the folder picture is recoloured — its navy plate to the
 * menu's background, the folder itself to the player timeline's colour.
 *
 * Strip: dressed as the long-press menu is — its background, its text colours and font, and under
 * the entry at the cursor its row highlight (colour or theme bitmap), exactly as SubmenuAdapter
 * paints a row. Each icon takes its label's colour. The highlight is as wide as the widest label,
 * so it does not change size from entry to entry and follows the language.
 */
public final class Photos {

    private Photos() { }

    private static final int WHITE = 0xFFFFFFFF;

    /** {@code bg_submenu}: the long-press menu's own colour when no theme names one. */
    private static final int MENU_BG = 0xFF8C94B2;

    /** Room on each side of the widest label inside the highlight. */
    private static final int PAD = 6;

    private static int menuBg() {
        Integer c = ThemeManager.INSTANCE.menuBGColor();
        return c == null ? MENU_BG : c.intValue();
    }

    /** The name under a tile. */
    public static void name(TextView tv) {
        if (tv == null) return;
        try {
            ThemeManager.INSTANCE.itemSetTextColor(tv, WHITE, false);
        } catch (Throwable t) {
            // stock white
        }
    }

    /** The plate's opacity on a tile the cursor is not on; under the cursor it is full. */
    private static final float PLATE_IDLE = 0.8f;

    private static Bitmap folder;
    private static Bitmap folderFocus;
    private static int folderBg;
    private static int folderFg;

    /**
     * After stock's {@code setImageResource(icon_folder)}; one recolour per pair of colours. The
     * tile's focus is read off its card, which the bind has already painted: 0 when the cursor is
     * elsewhere, the focus colour when it is here.
     */
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
            // the stock picture stays
        }
    }

    /**
     * {@code icon_folder.png} is two colours at full alpha — a navy plate and a yellow folder — so
     * each pixel is placed between the two by its luminance and redrawn between {@code bg} and
     * {@code fg}. The antialiased edges land in between, as they did in the original. The plate's
     * alpha is scaled by {@code plate}; the folder's is left as drawn.
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
     * From {@code PhotosDialog.onCreate}: the strip's colour. A theme's highlight bitmap may land
     * after the entry was painted and on an entry that has since lost the cursor, so the strip is
     * rebound whenever one arrives — by then it is cached and the rebind paints it synchronously.
     */
    public static void bar(RecyclerView rv) {
        if (rv == null) return;
        try {
            Rule rule = new Rule();
            rv.setTag(rule);
            rv.addItemDecoration(rule);
            paintBar(rv);
            Repaint r = new Repaint(rv);
            Rows.watchFlat(r);
            Theme.watchMenuRows(r);
        } catch (Throwable t) {
            // stock navy
        }
    }

    /** Share of the menu's colour the strip keeps when the menu's own rows are see-through. */
    private static final float SEE_THROUGH = 0.9f;

    /** The rule along the strip's top edge: the list text's colour at this share, this thick. */
    private static final float RULE_ALPHA = 0.85f;
    private static final int RULE_PX = 2;

    private static void paintBar(RecyclerView rv) {
        rv.setBackgroundColor(barColor());
        Object o = rv.getTag();
        if (o instanceof Rule) {
            TextView probe = new TextView(rv.getContext());
            ThemeManager.INSTANCE.itemSetTextColor(probe, WHITE, false);
            int t = probe.getCurrentTextColor();
            ((Rule) o).paint.setColor(((int) (Color.alpha(t) * RULE_ALPHA) << 24) | (t & 0x00FFFFFF));
            rv.invalidate();
        }
    }

    /**
     * The rule along the strip's top edge, inside the menu's fill. A decoration's
     * {@code onDrawOver} runs after the entries are drawn, so the rule lies over a highlight
     * instead of under it.
     */
    static final class Rule extends RecyclerView.ItemDecoration {
        final Paint paint = new Paint();

        public void onDrawOver(Canvas c, RecyclerView parent, RecyclerView.State state) {
            c.drawRect(0, 0, parent.getWidth(), RULE_PX, paint);
        }
    }

    /**
     * The menu's colour — at 90% where the theme's unfocused menu row is transparent, since the
     * strip then stands where such a menu would let the screen show through.
     */
    private static int barColor() {
        int c = menuBg();
        if (Theme.menuRowsPainted()) return c;
        return ((int) (Color.alpha(c) * SEE_THROUGH) << 24) | (c & 0x00FFFFFF);
    }

    /** Named (d8 here crashes on anonymous classes); weak, the dialog is not ours to keep. */
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
     * A theme's row highlight on an entry of the strip. The bitmap is drawn for a 640px-wide row;
     * stretched onto a ~90px entry its side borders shrink to a fraction of a pixel and vanish. So
     * it is scaled by HEIGHT, and its two ends are drawn at that scale meeting in the middle — the
     * uniform middle of the row is what is left out, its borders and corners are not.
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

    /**
     * One entry of the strip, after stock painted it. The background is cleared first and the
     * stock highlight guaranteed after: {@code menuItemSetBackground} leaves the view untouched
     * while the theme's bitmap is still loading (same trap as in {@code PickDialog}).
     */
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
            fit(adapter, cell, label);
        } catch (Throwable t) {
            // stock white / accent
        }
    }

    /**
     * The entry narrowed to the widest label and centred in its column. Both margin fields are
     * written: a marginStart left unset would not matter, but one set elsewhere wins over leftMargin.
     */
    private static void fit(Object adapter, View cell, TextView label) {
        if (!(adapter instanceof BaseQuickAdapter)) return;
        List items = ((BaseQuickAdapter) adapter).getData();
        if (items == null || items.isEmpty()) return;
        float widest = 0;
        for (int i = 0; i < items.size(); i++) {
            Object o = items.get(i);
            if (!(o instanceof PhotosDialog.SubItem)) continue;
            widest = Math.max(widest, label.getPaint().measureText(((PhotosDialog.SubItem) o).getText()));
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
}
