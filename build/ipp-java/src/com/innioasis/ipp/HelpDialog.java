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
 * A better-Y row's help window, paged by the wheel — paged, never scrolled: one gesture, one
 * meaning. Pages are measured with the paint they are drawn with (translations differ in length by
 * a third); the box is sized once per description to its widest and tallest page, so paging does
 * not make it jump — except for a picture, which gets the height it needs.
 */
public final class HelpDialog extends BaseDialog {

    /** The screen is 480x360. */
    private static final int W_MAX = 460;
    private static final int W_MIN = 200;
    private static final int BODY_MAX = 268;
    private static final int BODY_MIN = 60;

    private static final int PAD_X = 10;
    /** Box padding; SLACK_Y is the wallpaper left above and below. */
    private static final int PAD_Y = 8;
    private static final int SLACK_Y = 10;

    /** A stock dialog's colours, through the same two hooks {@code DialogUtil} uses. */
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

    private int contentW;              // the widest page
    private int textH;                 // the tallest text page
    private int bodyMax = BODY_MAX;    // what the title and the counter leave for the body

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
        head.setPadding(4, 0, 4, 12);
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
        body.setGravity(Gravity.CENTER);
        paint(body);
        hole.addView(body, new LinearLayout.LayoutParams(-1, -2));

        shot = new ImageView(activity);
        shot.setAdjustViewBounds(true);
        shot.setScaleType(ImageView.ScaleType.FIT_CENTER);
        shot.setVisibility(View.GONE);
        LinearLayout.LayoutParams sp = new LinearLayout.LayoutParams(-1, 0);
        sp.weight = 1.0f;                      // the caption takes what it needs
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

        // Two passes: the first fixes the width, which decides how many lines the title takes and
        // so the body's height. Lines are always broken at W_MAX, so the width cannot move again.
        pages = paginate(BODY_MAX);
        bodyMax = room();
        if (bodyMax < BODY_MAX) pages = paginate(bodyMax);

        Window w = getWindow();
        if (w != null) {
            WindowManager.LayoutParams lp = w.getAttributes();
            lp.width = contentW + PAD_X * 2;
            lp.gravity = Gravity.CENTER;
            w.setAttributes(lp);
            // reading takes longer than the sleep time; the screensaver too stays away while it is up
            w.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        }

        show(0);
    }

    private void paint(TextView tv) {
        tv.setTextColor(ThemeManager.INSTANCE.dialogTextColor(INK));
    }

    private Typeface font() {
        return Typeface.MONOSPACE;
    }

    /**
     * Breaks against the largest box, then records the biggest page — the window's size. Shrinking
     * to the widest LINE cannot re-wrap anything, so width is measured after the break.
     */
    private List paginate(int room) {
        List out = new ArrayList();
        TextPaint tp = body.getPaint();
        int max = W_MAX - PAD_X * 2;
        float line = tp.getFontSpacing() * 1.05f;
        int perPage = (int) (room / line);
        if (perPage < 1) perPage = 1;
        int tallest = 0;               // pixels, measured
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
                // Laid out, not lines × spacing: the arithmetic comes out a few pixels short and
                // shaves the bottom off the last line.
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
            resize(bm == null ? textH : shotHeight(bm, p.cap));
        } else {
            shot.setVisibility(View.GONE);
            shot.setImageBitmap(null);
            cap.setVisibility(View.GONE);
            body.setVisibility(View.VISIBLE);
            body.setText(p.text);
            resize(textH);
        }
        foot.setText(pages.size() < 2 ? "" : (page + 1) + " / " + pages.size());
    }

    /** The body's height once title and counter are measured: a two-line title must fit too. */
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

    private int shotHeight(Bitmap bm, String caption) {
        int h = bodyMax;
        if (bm.getWidth() > 0) {
            h = (int) ((long) bm.getHeight() * contentW / bm.getWidth());
            if (h > bm.getHeight()) h = bm.getHeight();      // never enlarged
        }
        if (caption != null) {
            StaticLayout sl = new StaticLayout(caption, cap.getPaint(), contentW,
                    Layout.Alignment.ALIGN_NORMAL, 1.0f, 0.0f, false);
            h += sl.getHeight() + cap.getPaddingTop();
        }
        return h > bodyMax ? bodyMax : h;
    }

    private void resize(int h) {
        if (hole == null) return;
        if (h > bodyMax) h = bodyMax;
        ViewGroup.LayoutParams lp = hole.getLayoutParams();
        if (lp == null || lp.height == h) return;
        lp.height = h;
        hole.setLayoutParams(lp);
    }

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

    /** A long centre press is the shutdown prompt everywhere. */
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
