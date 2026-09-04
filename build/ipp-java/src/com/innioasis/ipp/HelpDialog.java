package com.innioasis.ipp;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.text.Layout;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.innioasis.fm.configs.KeyMap;
import com.innioasis.y1.R;
import com.innioasis.y1.base.BaseActivity;
import com.innioasis.y1.base.BaseDialog;
import com.innioasis.y1.theme.ThemeManager;

import java.util.ArrayList;
import java.util.List;

/**
 * The help window of a row of the better-Y screen: hold the top button on a row and
 * this comes up with what that row does. Text and screenshots alike, paged with the wheel.
 *
 * The wheel pages; it does not scroll
 * One gesture, one meaning: the wheel steps between whole pages, the top button closes, the centre
 * does nothing (the user's call — there is nothing here to confirm). Scrolling text with the same
 * wheel that pages the window would leave the reader unable to tell which of the two a click is
 * about to do, and a half-scrolled page has no honest page number to show.
 *
 * Pages are MEASURED, and so is the window
 * Nothing in the asset says where a page ends: the text is broken where it stops fitting, using
 * the very {@link TextPaint} it will be drawn with. That matters because the eight translations
 * differ in length by a third or more — hand-placed breaks would be right in one language and
 * leave half-empty pages in the others. {@code ---} forces a break where the author wants one, and
 * a picture is always a page of its own.
 *
 * The BOX is measured too, in both directions, and sized to the widest and tallest page of that
 * one description: a one-line row does not open a half-screen window, and a long one is not
 * cramped. Sized once per description rather than per page, so paging does not make the window
 * jump — the exception being a picture, which gets the height it needs to stay legible.
 *
 * Built in code on the {@code PickDialog} pattern, for the same reasons: the theme's colours
 * come through {@code ThemeManager}, and the box is a {@link GradientDrawable} rather than
 * {@code bg_submenu} (a theme replaces the colour, and {@code setBackgroundColor} would take the
 * rounded corners with it).
 */
public final class HelpDialog extends BaseDialog {

    /** Screen is 480x360; leave a hair of wallpaper around the box in both directions. */
    private static final int W_MAX = 460;
    private static final int W_MIN = 200;
    private static final int BODY_MAX = 268;
    /** The body is never squeezed below this, however tall the title comes out. */
    private static final int BODY_MIN = 60;

    /** Left and right padding of the box, which the content has to fit inside. */
    private static final int PAD_X = 10;
    /** Top and bottom padding of the box, and the wallpaper left above and below it. */
    private static final int PAD_Y = 8;
    private static final int SLACK_Y = 10;

    /**
     * The colours of a STOCK dialog, and applied the way stock applies them: the box is
     * {@code dialogBGColor(white)} and every line of text is {@code dialogTextColor(black)} — the
     * two hooks {@code DialogUtil} itself calls on {@code popup_dialog.xml}, so a theme that
     * repaints the app's dialogs repaints this one with them. The corner radius is that layout's
     * own 10dip. (The message in stock is #555555 in the XML and then painted black by the code;
     * black is therefore what it really shows.)
     */
    private static final int BOX = 0xFFFFFFFF;
    private static final int INK = 0xFF000000;
    private static final float CORNER = 10.0f;

    private final Activity activity;
    private final String title;
    private final List blocks;         // List<Help.Block>, as written

    private List pages;                // List<Page>, as shown
    private int page;

    private LinearLayout hole;         // the body box: text, or picture over caption
    private TextView head;
    private TextView body;
    private ImageView shot;
    private TextView cap;
    private TextView foot;

    private int contentW;              // the widest page's width, i.e. what the box is sized to
    private int textH;                 // the tallest text page, so paging text does not resize
    private int bodyMax = BODY_MAX;    // what the title and the counter leave for the body

    /** One page: a slice of a text block, or a picture with its caption. */
    private static final class Page {
        final String text;
        final String img;
        final String cap;

        Page(String text, String img, String cap) {
            this.text = text;
            this.img = img;
            this.cap = cap;
        }
    }

    public HelpDialog(Activity a, String title, List blocks) {
        super(a, R.style.Dialog_Common);
        this.activity = a;
        this.title = title;
        this.blocks = blocks;
    }

    @Override
    protected void onCreate(android.os.Bundle b) {
        super.onCreate(b);

        LinearLayout box = new LinearLayout(activity);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(PAD_X, PAD_Y, PAD_X, PAD_Y);
        GradientDrawable shape = new GradientDrawable();
        shape.setCornerRadius(CORNER);
        shape.setColor(ThemeManager.INSTANCE.dialogBGColor(BOX));
        box.setBackgroundDrawable(shape);

        head = new TextView(activity);
        head.setTextSize(15.0f);
        head.setTypeface(font(), Typeface.BOLD);
        head.setGravity(Gravity.CENTER);
        head.setPadding(4, 0, 4, 12);          // the gap between the row's name and its description
        head.setText(title);
        paint(head);
        box.addView(head, -1, -2);

        hole = new LinearLayout(activity);
        hole.setOrientation(LinearLayout.VERTICAL);
        hole.setGravity(Gravity.CENTER);

        body = new TextView(activity);
        body.setTextSize(14.0f);
        body.setTypeface(font());
        body.setIncludeFontPadding(false);
        body.setLineSpacing(0.0f, 1.05f);
        // Centred both ways: the box is only as big as the description, so a page that does not
        // fill it sits in the middle of what room is left rather than hanging off one corner.
        body.setGravity(Gravity.CENTER);
        paint(body);
        hole.addView(body, new LinearLayout.LayoutParams(-1, -2));

        shot = new ImageView(activity);
        shot.setAdjustViewBounds(true);
        shot.setScaleType(ImageView.ScaleType.FIT_CENTER);
        shot.setVisibility(View.GONE);
        LinearLayout.LayoutParams sp = new LinearLayout.LayoutParams(-1, 0);
        sp.weight = 1.0f;                      // the caption takes what it needs, the shot the rest
        hole.addView(shot, sp);

        cap = new TextView(activity);
        cap.setTextSize(12.0f);
        cap.setTypeface(font());
        cap.setIncludeFontPadding(false);
        cap.setGravity(Gravity.CENTER);
        cap.setPadding(2, 5, 2, 0);
        cap.setVisibility(View.GONE);
        paint(cap);
        hole.addView(cap, new LinearLayout.LayoutParams(-1, -2));

        box.addView(hole, new LinearLayout.LayoutParams(-1, BODY_MAX));

        foot = new TextView(activity);
        foot.setTextSize(12.0f);
        foot.setTypeface(font());
        foot.setGravity(Gravity.CENTER);
        foot.setPadding(0, 8, 0, 0);
        paint(foot);
        box.addView(foot, -1, -2);

        setContentView(box);

        // Two passes, and they settle: the first one is what fixes the box's WIDTH, and only at
        // that width is it known how many lines the title takes -- i.e. how much height is left
        // for the body. Re-breaking against the smaller height cannot move the width again
        // (lines are always measured against W_MAX, never against the box), so one repeat is
        // enough and a third pass would return the same pages.
        pages = paginate(BODY_MAX);
        bodyMax = room();
        if (bodyMax < BODY_MAX) pages = paginate(bodyMax);

        Window w = getWindow();
        if (w != null) {
            WindowManager.LayoutParams lp = w.getAttributes();
            lp.width = contentW + PAD_X * 2;
            lp.gravity = Gravity.CENTER;
            w.setAttributes(lp);
        }

        show(0);
    }

    /** Title, body, caption and footer, in the colour a stock dialog paints its own text. */
    private void paint(TextView tv) {
        tv.setTextColor(ThemeManager.INSTANCE.dialogTextColor(INK));
    }

    private Typeface font() {
        return Typeface.MONOSPACE;
    }

    // ---------------------------------------------------------------- measuring

    /**
     * Break the text into pages against the largest box allowed, then record how wide and how tall
     * that description's biggest page actually came out — which is what the window is sized to.
     *
     * Shrinking the box to the widest LINE cannot re-wrap anything: by construction every line
     * already fits in that width. That is why the width may be measured after the break rather
     * than solved together with it.
     */
    private List paginate(int room) {
        List out = new ArrayList();
        TextPaint tp = body.getPaint();
        int max = W_MAX - PAD_X * 2;
        float line = tp.getFontSpacing() * 1.05f;
        int perPage = (int) (room / line);
        if (perPage < 1) perPage = 1;
        int tallest = 0;               // in PIXELS, measured, not in lines
        float widest = 0.0f;

        for (int i = 0; i < blocks.size(); i++) {
            Help.Block blk = (Help.Block) blocks.get(i);
            if (blk.img != null) {
                out.add(new Page(null, blk.img, blk.cap));
                int[] size = Help.size(activity, blk.img);
                float w = size == null ? max : size[0];
                if (w > max) w = max;
                if (w > widest) widest = w;
                if (blk.cap != null) {
                    float cw = cap.getPaint().measureText(blk.cap);
                    if (cw > max) cw = max;
                    if (cw > widest) widest = cw;
                }
                continue;
            }
            StaticLayout sl = new StaticLayout(blk.text, tp, max,
                    Layout.Alignment.ALIGN_NORMAL, 1.05f, 0.0f, false);
            int n = sl.getLineCount();
            for (int j = 0; j < n; j++) {
                float lw = sl.getLineWidth(j);
                if (lw > widest) widest = lw;
            }
            int from = 0;
            while (from < n) {
                int to = from + perPage;
                if (to > n) to = n;
                String part = blk.text.substring(sl.getLineStart(from), sl.getLineEnd(to - 1)).trim();
                out.add(new Page(part, null, null));
                // Measure the page as it will be LAID OUT rather than counting lines times the
                // font spacing: the two are not the same number (spacing multiplier, rounding,
                // includeFontPadding), and the arithmetic came out a few pixels short -- which is
                // exactly enough to shave the bottom off the last line.
                StaticLayout pl = new StaticLayout(part, tp, max,
                        Layout.Alignment.ALIGN_NORMAL, 1.05f, 0.0f, false);
                if (pl.getHeight() > tallest) tallest = pl.getHeight();
                from = to;
            }
        }
        if (out.isEmpty()) out.add(new Page("", null, null));

        contentW = (int) Math.ceil(widest) + 4;             // a hair, so nothing sits on the edge
        if (contentW > max) contentW = max;
        if (contentW < W_MIN - PAD_X * 2) contentW = W_MIN - PAD_X * 2;
        textH = tallest + 2;                                // a hair, so nothing sits on the edge
        if (textH < 3) textH = (int) Math.ceil(line);
        return out;
    }

    // ---------------------------------------------------------------- showing

    private void show(int i) {
        if (pages == null || pages.isEmpty()) return;
        if (i < 0) i = 0;
        if (i >= pages.size()) i = pages.size() - 1;
        page = i;
        Page p = (Page) pages.get(page);

        if (p.img != null) {
            Bitmap bm = Help.image(activity, p.img);
            shot.setImageBitmap(bm);
            shot.setVisibility(bm == null ? View.GONE : View.VISIBLE);
            body.setVisibility(bm == null ? View.VISIBLE : View.GONE);
            if (bm == null) body.setText("");
            cap.setText(p.cap == null ? "" : p.cap);
            cap.setVisibility(p.cap == null || bm == null ? View.GONE : View.VISIBLE);
            // A picture is a page of its own and gets the height it needs: a screenshot squeezed
            // into the height of a paragraph is not worth showing at all.
            resize(bm == null ? textH : shotHeight(bm, p.cap));
        } else {
            shot.setVisibility(View.GONE);
            shot.setImageBitmap(null);
            cap.setVisibility(View.GONE);
            body.setVisibility(View.VISIBLE);
            body.setText(p.text);
            resize(textH);
        }
        // One page needs no counter: a number that never changes only asks to be read.
        foot.setText(pages.size() < 2 ? "" : (page + 1) + " / " + pages.size());
    }

    /**
     * How much height is left for the body once the title and the page counter have taken theirs.
     *
     * A constant sized for a ONE-LINE title is not enough: a row whose name wraps to two lines
     * ("Show songs only by selected artist inside of Artists - Album") then pushes the counter off
     * the bottom of the screen. So everything here is measured rather than assumed: the title is broken at the width the box actually came out at, and the
     * counter is one line of its own paint.
     */
    private int room() {
        try {
            int screen = activity.getResources().getDisplayMetrics().heightPixels;
            int w = contentW - head.getPaddingLeft() - head.getPaddingRight();
            if (w < 1) w = contentW;
            StaticLayout hl = new StaticLayout(title == null ? "" : title, head.getPaint(), w,
                    Layout.Alignment.ALIGN_NORMAL, 1.0f, 0.0f, false);
            int headH = hl.getHeight() + head.getPaddingTop() + head.getPaddingBottom();
            int footH = (int) Math.ceil(foot.getPaint().getFontSpacing())
                    + foot.getPaddingTop() + foot.getPaddingBottom();
            int room = screen - SLACK_Y * 2 - PAD_Y * 2 - headH - footH;
            if (room > BODY_MAX) room = BODY_MAX;
            if (room < BODY_MIN) room = BODY_MIN;
            return room;
        } catch (Throwable t) {
            return BODY_MAX;
        }
    }

    /** Height of a picture page: the fitted picture, plus its caption if it has one. */
    private int shotHeight(Bitmap bm, String caption) {
        int h = bodyMax;
        if (bm.getWidth() > 0) {
            h = (int) ((long) bm.getHeight() * contentW / bm.getWidth());
            if (h > bm.getHeight()) h = bm.getHeight();      // never blow a screenshot up
        }
        if (caption != null) {
            StaticLayout sl = new StaticLayout(caption, cap.getPaint(), contentW,
                    Layout.Alignment.ALIGN_NORMAL, 1.0f, 0.0f, false);
            h += sl.getHeight() + cap.getPaddingTop();
        }
        return h > bodyMax ? bodyMax : h;
    }

    /** The box takes the height of what is on it; the window is wrap_content and follows. */
    private void resize(int h) {
        if (hole == null) return;
        if (h > bodyMax) h = bodyMax;
        ViewGroup.LayoutParams lp = hole.getLayoutParams();
        if (lp == null || lp.height == h) return;
        lp.height = h;
        hole.setLayoutParams(lp);
    }

    // ---------------------------------------------------------------- the wheel

    @Override
    public void shortUp(int keyCode) {
        KeyMap k = KeyMap.INSTANCE;
        if (keyCode == k.getKEY_UP() || keyCode == k.getKEY_LEFT()) {
            show(page - 1);
        } else if (keyCode == k.getKEY_DOWN() || keyCode == k.getKEY_RIGHT()) {
            show(page + 1);
        } else if (keyCode == k.getKEY_MENU()) {
            dismiss();
        }
    }

    /** Long centre press blanks the screen everywhere in this app; keep it working here. */
    @Override
    public void longDown(int keyCode, int repeatCount) {
        if (keyCode == KeyMap.INSTANCE.getKEY_ENTER() && repeatCount == 3
                && activity instanceof BaseActivity) {
            ((BaseActivity) activity).askShutdown();
        }
    }

    @Override
    public void longDownFinish(int keyCode) {
    }
}
