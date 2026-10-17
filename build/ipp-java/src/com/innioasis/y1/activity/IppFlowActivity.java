package com.innioasis.y1.activity;

import android.animation.ObjectAnimator;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.TransitionDrawable;
import android.os.Handler;
import android.os.SystemClock;
import android.text.TextPaint;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.DecelerateInterpolator;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.innioasis.ipp.BigCover;
import com.innioasis.ipp.Cover;
import com.innioasis.ipp.Diag;
import com.innioasis.ipp.Flow;
import com.innioasis.ipp.FlowView;
import com.innioasis.ipp.Frames;
import com.innioasis.ipp.Lit;
import com.innioasis.ipp.Photos;
import com.innioasis.ipp.Prefs;
import com.innioasis.ipp.Rows;
import com.innioasis.ipp.Theme;
import com.innioasis.music.MusicPlayerActivity;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.base.BaseActivity;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.databinding.ActivityAboutBinding;
import com.innioasis.y1.service.PlayerService;
import com.innioasis.y1.theme.ThemeManager;

import java.util.List;

/**
 * Cover Flow: the library's albums as a row of covers ({@link FlowView}) over the theme's
 * global wallpaper. The wheel moves along the row, centre turns the cover over to its track list, centre
 * on a track plays the album from it and carries the cover into Now Playing, top turns back and
 * then leaves.
 */
public final class IppFlowActivity extends BaseActivity {

    private static final String KEY_POS = "flow_pos";
    private static final int PANEL_W = 360;
    /** The neighbours running off the screen, and the cover travelling to or from the player. */
    private static final int SPREAD_MS = 200;
    private static final int MOVE_MS = 260;
    /** What the turn back takes beyond its two halves: the second waits for the first's end action. */
    private static final int TURN_SLACK_MS = 40;

    private FlowView flow;
    private FlowView.Card card;
    /** The player's own picture, travelling between this screen and the player. */
    private ImageView trip;
    private Panel panel;
    private Flow.Loader loader;
    private Handler ui;
    private List items;

    /** 0 the row, 1 turning over, 2 the track list, 3 turning back, 4 at the player, 5 back from it. */
    private int state;
    private int flipped = -1;

    @Override
    public ActivityAboutBinding getViewBinding() {
        return ActivityAboutBinding.inflate(getLayoutInflater());
    }

    @Override
    public void initView() {
        setStateBarLeftText(getString(R.string.ipp_coverflow));
        ui = new Handler();
        ViewGroup root = (ViewGroup) getVb().getRoot();
        root.removeAllViews();
        root.setBackgroundDrawable(null);
        FrameLayout box = new FrameLayout(this);
        flow = new FlowView(this);
        box.addView(flow, new FrameLayout.LayoutParams(-1, -1));
        card = new FlowView.Card(this);
        card.setVisibility(View.GONE);
        box.addView(card, new FrameLayout.LayoutParams(Flow.S + 2 * Flow.PAD, Flow.PAD + Flow.S + Flow.REFL));
        trip = new ImageView(this);
        trip.setScaleType(ImageView.ScaleType.FIT_START);
        trip.setVisibility(View.GONE);
        box.addView(trip, new FrameLayout.LayoutParams(1, 1));
        panel = new Panel(this);
        panel.setVisibility(View.INVISIBLE);   // laid out from the start: the flip needs its size
        box.addView(panel, new FrameLayout.LayoutParams(PANEL_W, -1));
        root.addView(box, -1, -1);
        Rows.watchFlat(new Highlight(panel));
        new Thread(new Load(this), "ipp-flow-list").start();
    }

    void loaded(List l) {
        if (isFinishing()) return;
        items = l;
        if (l.isEmpty()) {
            Toast.makeText(this, getString(R.string.no_content), Toast.LENGTH_SHORT).show();
            return;
        }
        mode(mode);
        int start = Math.max(0, Math.min(l.size() - 1, Prefs.getInt(this, KEY_POS, 0)));
        loader = new Flow.Loader(l, ui, new Repaint(this));
        Thread t = new Thread(loader, "ipp-flow-covers");
        t.setDaemon(true);
        t.start();
        flow.setItems(l, loader, start);
        flow.setOnRest(new Rested(this));
        flow.setLabels(0);
        labels(1, FlowView.FADE_MS);
        armBack();
    }

    @Override
    protected void onResume() {
        super.onResume();
        boolean turn = Flow.takeReturning();
        if (state == 4) back(turn);
    }

    @Override
    protected void onDestroy() {
        Rows.watchFlat(null);
        if (loader != null) loader.quit();
        if (items != null && flow != null) Prefs.setInt(this, KEY_POS, flow.target());
        super.onDestroy();
    }

    @Override
    public void clockwise() {
        if (state == 0) {
            flipPending = false;            // turned on: the press was not for this album
            flow.step(1);
            armBack();
        } else if (state == 2) {
            panel.move(1);
            armAhead();
        }
    }

    @Override
    public void antiClockwise() {
        if (state == 0) {
            flipPending = false;
            flow.step(-1);
            armBack();
        } else if (state == 2) {
            panel.move(-1);
            armAhead();
        }
    }

    @Override
    public void confirm() {
        if (items == null || items.isEmpty()) return;
        if (state == 0) {
            // The row still easing in: it is hurried in and the flip waits for it to stand. A flip
            // started on a moving row cut its last frames short and met the work its rest sets off.
            if (flow.resting()) flipOver();
            else {
                flipPending = true;
                flow.hurry();
            }
        } else if (state == 2) {
            play();
        }
    }

    /** The centre was pressed while the row moved: flip when it rests (Rested). */
    boolean flipPending;

    /** Measurement: long top cycles normal → no System.gc → no build ahead, shown in the status bar. */
    private static int mode;
    private static final String[] MODES = { "normal", "nogc", "nodwell" };

    private void mode(int m) {
        mode = m;
        noGc = m == 1;
        noDwell = m == 2;
        if (noDwell) ui.removeCallbacks(backDwell);
        setStateBarLeftText(getString(R.string.ipp_coverflow) + " [" + MODES[m] + "]");
        Diag.note("flow measure: " + MODES[m]);
    }

    @Override
    public void longConfirm() {
        if (state == 0) mode((mode + 1) % MODES.length);
    }

    @Override
    public void direction(BaseActivity.Direction d) {
        if (d == BaseActivity.Direction.TOP) {
            if (state == 2) flipBack();
            else if (state == 0) finish();
        }
    }

    @Override
    public void quit() {
        finish();
    }

    private void flipOver() {
        Frames.start("flip over", true);
        long t0 = SystemClock.uptimeMillis();
        int i = flow.target();
        Flow.Item it = (Flow.Item) items.get(i);
        Bitmap s = loader.get(i);
        state = 1;
        flipped = i;
        hold(true);
        panel.show(it);
        tracks(it);

        FrameLayout.LayoutParams lp = (FrameLayout.LayoutParams) card.getLayoutParams();
        lp.leftMargin = flow.coverLeft() - Flow.PAD;
        lp.setMarginStart(flow.coverLeft() - Flow.PAD);
        lp.topMargin = flow.coverTop() - Flow.PAD;
        card.setLayoutParams(lp);
        lp = (FrameLayout.LayoutParams) panel.getLayoutParams();
        int px = (flow.getWidth() - PANEL_W) / 2;
        lp.leftMargin = px;
        lp.setMarginStart(px);
        panel.setLayoutParams(lp);

        card.setSlide(s);
        card.setPivotX((Flow.S + 2 * Flow.PAD) / 2f);
        card.setPivotY((Flow.PAD + Flow.S + Flow.REFL) / 2f);
        card.setTranslationX(0);
        card.setTranslationY(0);
        card.setScaleX(1);
        card.setScaleY(1);
        card.setRotationY(0);
        card.setVisibility(View.VISIBLE);
        flow.hide(i);
        shrunk();
        panel.setRotationY(90);
        card.animate().rotationY(-90).setDuration(Flow.CARD_MS)
                .setInterpolator(new AccelerateInterpolator(Flow.CARD_EASE)).withEndAction(new Half(this, true));
        labels(0, Flow.CARD_MS);
        Frames.part("setup", t0);
    }

    /** The panel drawn over the cover's own square, which is where its turn starts and ends. */
    private void shrunk() {
        int ph = flow.getHeight();
        panel.setScaleX((float) Flow.S / PANEL_W);
        panel.setScaleY(ph > 0 ? (float) Flow.S / ph : 1f);
        panel.setTranslationY(flow.coverTop() + Flow.S / 2f - ph / 2f);
    }

    void halfOver() {
        card.setVisibility(View.GONE);
        panel.setVisibility(View.VISIBLE);
        panel.animate().rotationY(0).scaleX(1).scaleY(1).translationY(0).setDuration(Flow.LIST_MS)
                .setInterpolator(new DecelerateInterpolator(Flow.TURN_EASE))
                .withEndAction(new Done(this, 2));
    }

    private void flipBack() {
        Frames.start("flip back", true);
        hold(true);
        state = 3;
        // back in only as the cover finishes turning round: both halves of the turn, the frame the
        // second half waits to start, and slow at first so it does not look done half way
        labels(1, Flow.LEAVE_MS + Flow.CARD_MS + TURN_SLACK_MS).setInterpolator(new AccelerateInterpolator(1.5f));
        edgeOn(new Half(this, false), Flow.LEAVE_MS, Flow.LEAVE_EASE);
    }

    /** The track list shrinks onto the cover's square and turns edge-on. */
    private void edgeOn(Runnable end, int ms, float ease) {
        int ph = flow.getHeight();
        panel.animate().rotationY(90).scaleX((float) Flow.S / PANEL_W)
                .scaleY(ph > 0 ? (float) Flow.S / ph : 1f)
                .translationY(flow.coverTop() + Flow.S / 2f - ph / 2f)
                .setDuration(ms).setInterpolator(new AccelerateInterpolator(ease))
                .withEndAction(end);
    }

    /**
     * Back from the player. Left by the top button, it handed the cover back: the player's picture
     * starts exactly where the player drew it and returns to the middle while the row closes in
     * around it. Left any other way, the row is simply put back.
     */
    private void back(boolean turn) {
        panel.animate().cancel();
        panel.setVisibility(View.INVISIBLE);
        panel.setRotationY(0);
        panel.setScaleX(1);
        panel.setScaleY(1);
        panel.setTranslationY(0);
        trip.animate().cancel();
        trip.setAlpha(1f);
        flow.setLabels(1);
        if (!turn || trip.getDrawable() == null) {
            flow.setSpread(0);
            done(0);
            return;
        }
        state = 5;
        Frames.start("from player");
        hold(true);
        // it leaves with what the player shows now: the track may have changed since the way in
        try {
            PlayerService ps = Y1Application.Companion.getPlayerService();
            Song now = ps == null ? null : ps.getPlayingMusic();
            Bitmap shown = now == null ? null : Flow.trip(now, null);
            if (shown != null) trip.setImageBitmap(shown);
        } catch (Throwable t) {
        }
        // it lands as the album's slide, so a track's own cover turns into the album's on the way
        if (flipped >= 0 && flipped < items.size()) {
            Bitmap album = Flow.trip(null, ((Flow.Item) items.get(flipped)).rep);
            Drawable was = trip.getDrawable();
            // only when the two differ: half way through a cross-fade both are see-through, and
            // a picture faded into itself visibly dims
            if (album != null && was instanceof BitmapDrawable
                    && !album.sameAs(((BitmapDrawable) was).getBitmap())) {
                TransitionDrawable td = new TransitionDrawable(
                        new Drawable[] { was, new BitmapDrawable(getResources(), album) });
                td.setCrossFadeEnabled(true);
                trip.setImageDrawable(td);
                td.startTransition(MOVE_MS);
            }
        }
        placeTrip();
        float[] p = startPose();
        trip.setTranslationX(0);
        trip.setTranslationY(0);
        trip.setScaleX(1);
        trip.setScaleY(1);
        trip.setRotationY(Flow.geo(this)[6]);
        trip.setVisibility(View.VISIBLE);
        flow.setSpread(1);
        trip.animate().translationX(p[0]).translationY(p[1]).scaleX(p[2]).scaleY(p[2]).rotationY(0)
                .setDuration(MOVE_MS).setInterpolator(new DecelerateInterpolator())
                .withEndAction(new Done(this, 0));
        spread(1, 0, MOVE_MS, new DecelerateInterpolator());
    }

    private void spread(float from, float to, int ms, android.animation.TimeInterpolator in) {
        ObjectAnimator an = ObjectAnimator.ofFloat(flow, "spread", from, to);
        an.setDuration(ms);
        an.setInterpolator(in);
        an.start();
    }

    void halfBack() {
        panel.setVisibility(View.INVISIBLE);
        card.setVisibility(View.VISIBLE);
        card.animate().rotationY(0).setDuration(Flow.CARD_MS)
                .setInterpolator(new DecelerateInterpolator(Flow.BACK_EASE)).withEndAction(new Done(this, 0));
    }

    void tripGone() {
        trip.setVisibility(View.GONE);
        trip.setImageBitmap(null);
        trip.setAlpha(1f);
    }

    /** The name and artist under the row fade out while the cover turns over, and back in. */
    private ObjectAnimator labels(float to, int ms) {
        ObjectAnimator an = ObjectAnimator.ofFloat(flow, "labels", flow.getLabels(), to);
        an.setDuration(ms);
        an.start();
        return an;
    }

    void done(int s) {
        Frames.stop();
        hold(false);
        state = s;
        if (s == 0) armBack();
        if (s == 2) {
            panel.restart();
            armAhead();
        }
        if (s == 0) {
            card.setVisibility(View.GONE);
            card.setSlide(null);
            // Swapped in one frame: the slide is the landed picture at its size, mirror and all. A
            // cross-fade between the two shows both half see-through, the reflection dimming.
            tripGone();
            flow.hide(-1);
            flow.setLabels(1);
            flipped = -1;
        }
    }

    /**
     * Plays the album from the track, then: the neighbours run off both sides of the screen while
     * the track list turns edge-on and comes round as the cover, travelling onto the spot the
     * player draws its own. The player then opens with no transition, under a cover already there.
     */
    private void play() {
        List songs = panel.songs;
        int at = panel.track();
        if (songs == null || at < 0) return;
        Frames.start("to player");
        hold(true);
        // The picture first, before anything moves and before the playlist: the playlist starts a
        // read of this track's cover that a picture built ahead has just put in memory. When none
        // is ready, ~90 ms of stillness after the press reads as nothing, inside the flight as a jolt.
        Song track = (Song) songs.get(at);
        tripPic = takeAhead(track);
        if (tripPic == null) {
            long t1 = SystemClock.uptimeMillis();
            tripPic = Flow.trip(track, ((Flow.Item) items.get(flipped)).rep);
            Frames.part("picture", t1);
        }
        long t0 = SystemClock.uptimeMillis();
        try {
            PlayerService ps = Y1Application.Companion.getPlayerService();
            if (ps != null) ps.setMusicPlaylist(songs, at);
        } catch (Throwable t) {
            Frames.stop();
            hold(false);
            return;
        }
        Frames.part("playlist", t0);
        state = 4;
        spread(0, 1, SPREAD_MS, new AccelerateInterpolator());
        edgeOn(new ToPlayer(this), Flow.LEAVE_MS, Flow.LEAVE_EASE);
    }

    void toPlayer() {
        panel.setVisibility(View.INVISIBLE);
        Bitmap pic = tripPic;
        tripPic = null;
        if (pic == null) {
            openPlayer();
            return;
        }
        trip.animate().cancel();
        trip.setAlpha(1f);
        trip.setImageBitmap(pic);
        placeTrip();
        float[] p = startPose();
        trip.setTranslationX(p[0]);
        trip.setTranslationY(p[1]);
        trip.setScaleX(p[2]);
        trip.setScaleY(p[2]);
        trip.setRotationY(-90);
        trip.setVisibility(View.VISIBLE);
        trip.animate().rotationY(Flow.geo(this)[6]).translationX(0).translationY(0).scaleX(1).scaleY(1)
                .setDuration(MOVE_MS).setInterpolator(new DecelerateInterpolator())
                .withEndAction(new Open(this));
    }

    /** The travelling picture's box: the player's cover view, at its place in the window. */
    private void placeTrip() {
        float[] g = Flow.geo(this);
        int[] at = new int[2];
        ((View) trip.getParent()).getLocationInWindow(at);
        FrameLayout.LayoutParams lp = (FrameLayout.LayoutParams) trip.getLayoutParams();
        lp.width = Math.round(g[2]);
        lp.height = Math.round(g[3]);
        lp.leftMargin = Math.round(g[0]) - at[0];
        lp.setMarginStart(lp.leftMargin);
        lp.topMargin = Math.round(g[1]) - at[1];
        trip.setLayoutParams(lp);
        trip.setPivotX(g[4]);
        trip.setPivotY(g[5]);
        trip.setPadding(Math.round(g[7]), Math.round(g[8]), Math.round(g[9]), Math.round(g[10]));
    }

    /**
     * Translation x, y and scale that lay the picture's cover over the centre slide's: the picture
     * is FIT_START inside the box's padding, the cover inside it framed by 2 px on the left and on top when tilted.
     */
    private float[] startPose() {
        float[] g = Flow.geo(this);
        FrameLayout.LayoutParams lp = (FrameLayout.LayoutParams) trip.getLayoutParams();
        float iw = trip.getDrawable().getIntrinsicWidth();
        float ih = trip.getDrawable().getIntrinsicHeight();
        float f = Math.min((g[2] - g[7] - g[9]) / iw, (g[3] - g[8] - g[10]) / ih);
        int fr = Cover.flatCover() ? 0 : 2;     // the frame comes with the tilt only (Cover.fitCover)
        float side = (iw - 2 * fr) * f;
        float s0 = Flow.S / side;
        float qx = g[7] + fr * f, qy = g[8] + fr * f;
        float tx = flow.coverLeft() - lp.leftMargin - g[4] - s0 * (qx - g[4]);
        float ty = flow.coverTop() - lp.topMargin - g[5] - s0 * (qy - g[5]);
        return new float[] { tx, ty, s0 };
    }

    /** An animation is on screen: the loader holds, and the builds ahead make no pictures. */
    volatile boolean animating;

    private void hold(boolean on) {
        animating = on;
        if (loader != null) loader.hold(on);
    }

    // The album's track list, built once the row has rested on it (the same DWELL_MS): built on
    // the press, its 200–700 ms of allocation falls inside the flip, and the collector pauses it
    // sets off are the flip's lost frames. One build at a time; Flow.back is not meant to run
    // twice at once.
    private final BackDwell backDwell = new BackDwell(this);
    private Flow.Item backFor;
    private Flow.Back backReady;
    private Flow.Item backBusy;
    private Flow.Item backNext;     // flipped while another album's list was being built

    /** Measurement switches: no build ahead on the row's rest; no System.gc after a build. */
    static boolean noDwell, noGc;

    private void armBack() {
        ui.removeCallbacks(backDwell);
        if (noDwell) return;
        ui.postDelayed(backDwell, DWELL_MS);
    }

    void tracksAhead(Flow.Item it) {
        if (it == null || it == backFor || backBusy != null) return;
        startBack(it);
    }

    private void startBack(Flow.Item it) {
        backBusy = it;
        Thread t = new Thread(new Tracks(this, it), "ipp-flow-tracks");
        t.setDaemon(true);
        t.start();
    }

    /** The flipped album's list: at once when it is built, else when its build ends. */
    private void tracks(Flow.Item it) {
        ui.removeCallbacks(backDwell);
        if (it == backFor && backReady != null) {
            ui.post(new TracksDone(this, it, backReady, SystemClock.uptimeMillis()));
        } else if (backBusy == it) {
            // backDone hands it over
        } else if (backBusy != null) {
            backNext = it;
        } else {
            startBack(it);
        }
    }

    void backDone(Flow.Item it, Flow.Back b, long t0) {
        backBusy = null;
        backFor = it;
        backReady = b;
        new TracksDone(this, it, b, t0).run();
        Flow.Item next = backNext;
        backNext = null;
        if (next != null && next != it) startBack(next);
    }

    /** The cursor rests this long on a track before its picture is built: never under the wheel. */
    private static final int DWELL_MS = 300;

    private final Dwell dwell = new Dwell(this);
    private Bitmap aheadPic;
    private String aheadFor;
    private String aheadBusy;
    private Object[] aheadSrc;      // its cover and the path it was read for
    private Bitmap tripPic;         // taken at the press, flown by toPlayer

    /**
     * The picture that flies into the player, built in the background once the cursor rests on a
     * track. Built in the middle of the flight it cost 76–140 ms of the main thread, a frame lost
     * each time. Cover.fitCover and Cover.reflect are synchronized, and with Cover Flow on top no
     * player is drawing into their buffers.
     */
    private void armAhead() {
        ui.removeCallbacks(dwell);
        ui.postDelayed(dwell, DWELL_MS);
    }

    void ahead() {
        if (state != 2 || aheadBusy != null || flipped < 0 || flipped >= items.size()) return;
        int at = panel.track();
        Song track = panel.songs != null && at >= 0 && at < panel.songs.size()
                ? (Song) panel.songs.get(at) : null;
        if (track == null || track.getPath() == null || track.getPath().equals(aheadFor)) return;
        aheadBusy = track.getPath();
        Thread t = new Thread(new Ahead(this, track, ((Flow.Item) items.get(flipped)).rep), "ipp-flow-trip");
        t.setDaemon(true);
        t.start();
    }

    void aheadDone(String path, Bitmap b, Object[] src) {
        aheadBusy = null;
        aheadFor = b == null ? null : path;
        aheadPic = b;
        aheadSrc = src;
        if (state == 2) armAhead();         // the cursor may have moved on meanwhile
    }

    /** The prepared picture when it is this track's; null otherwise. */
    private Bitmap takeAhead(Song track) {
        if (track == null || aheadPic == null || !track.getPath().equals(aheadFor)) return null;
        Bitmap b = aheadPic;
        Object[] src = aheadSrc;
        aheadPic = null;
        aheadFor = null;
        aheadSrc = null;
        if (src != null && src[0] instanceof Bitmap) BigCover.keep((String) src[1], (Bitmap) src[0]);
        return b;
    }

    void openPlayer() {
        Frames.stop();
        Intent i = new Intent(this, MusicPlayerActivity.class);
        i.putExtra(Flow.EXTRA_FLIP, true);
        startActivity(i);
        overridePendingTransition(0, 0);
    }

    /** The album's name and artist over its tracks, a cursor bar on the track under the wheel. */
    static final class Panel extends View {
        private static final int HEAD = 54;
        private static final int ROW = 26;

        private final TextPaint head = new TextPaint(Paint.ANTI_ALIAS_FLAG);
        private final TextPaint sub = new TextPaint(Paint.ANTI_ALIAS_FLAG);
        private final TextPaint text = new TextPaint(Paint.ANTI_ALIAS_FLAG);
        private final Paint bg = new Paint();
        private final Paint bar = new Paint();
        private final Paint line = new Paint();
        private String title = "";
        private String artist = "";
        List songs;
        /** Per row: the number column (null on a divider), the title or label, the song or -1. */
        private String[] nums;
        private String[] names;
        private int[] song;
        /** Where a track's title starts: past the widest number. */
        private float nameX = 8;
        private int sel;
        private int first;

        /** Carries the menu's row highlight, colour or theme bitmap, for onDraw to paint with. */
        private final View hl;
        private int fg = 0xFFFFFFFF;
        private int fgSel = 0xFF000000;

        Panel(Context c) {
            super(c);
            head.setTextSize(18);
            head.setTypeface(Typeface.create(Typeface.MONOSPACE, Typeface.BOLD));
            head.setFakeBoldText(true);
            sub.setTextSize(15);
            sub.setTypeface(Typeface.MONOSPACE);
            text.setTextSize(16);
            text.setTypeface(Typeface.MONOSPACE);
            hl = new View(c);
            colours();
        }

        /** The long-press menu's colours: its background, its two text colours, its highlight. */
        private void colours() {
            try {
                Context c = getContext();
                TextView probe = new TextView(c);
                ThemeManager.INSTANCE.menuItemSetTextColor(probe, c.getResources().getColor(R.color.white), false);
                fg = probe.getCurrentTextColor();
                ThemeManager.INSTANCE.menuItemSetTextColor(probe,
                        c.getResources().getColor(R.color.selected_text_color_submenu), true);
                fgSel = probe.getCurrentTextColor();
            } catch (Throwable t) {
            }
            bg.setColor(Photos.menuBg());
            head.setColor(fg);
            sub.setColor((0xB0 << 24) | (fg & 0xFFFFFF));
            line.setColor((0x50 << 24) | (fg & 0xFFFFFF));
            int sc = Theme.menuSelectedColor();
            bar.setColor(sc != 0 ? sc : 0xFF00F5FF);
            highlight();
        }

        /** Again once a theme's bitmap has landed: it is cached by then, and applied at once. */
        void highlight() {
            try {
                Photos.highlight(hl, true);
            } catch (Throwable t) {
            }
            invalidate();
        }

        void show(Flow.Item it) {
            title = it.name;
            artist = it.artist;
            songs = null;
            names = null;
            sel = 0;
            first = 0;
            invalidate();
        }

        void setSongs(Flow.Back b) {
            songs = b.songs;
            nums = b.nums;
            names = b.texts;
            song = b.song;
            float wide = 0;
            for (int i = 0; i < nums.length; i++) {
                if (nums[i] != null) wide = Math.max(wide, text.measureText(nums[i]));
            }
            nameX = 8 + wide + text.measureText(" ");
            sel = 0;
            first = 0;
            if (song.length > 0 && song[0] < 0) sel = 1;   // the cursor never stands on a divider
            if (sel >= song.length) sel = 0;
            restart();
        }

        /** The song under the cursor, as an index into {@link #songs}; -1 when there is none. */
        int track() {
            return song == null || sel >= song.length ? -1 : song[sel];
        }

        void move(int d) {
            if (names == null || names.length == 0) return;
            int s = sel;
            do {
                s += d;
            } while (s >= 0 && s < song.length && song[s] < 0);
            if (s < 0 || s >= song.length) return;
            sel = s;
            int rows = rows();
            // a divider right above the cursor comes into view with it
            int top = sel > 0 && song[sel - 1] < 0 ? sel - 1 : sel;
            if (top < first) first = top;
            if (sel >= first + rows) first = sel - rows + 1;
            restart();
        }

        // The marquee of the row under the cursor, at the pace of the mod's other marquees (Scroll).
        private static final int STEP = 2;
        private static final int TICK = 40;
        private static final int LEAD = 38;
        private static final int IDLE = 1000;
        private static final String GAP = "     ";
        private int offset;
        private int lead;
        private final Tick tick = new Tick(this);

        /** From the head of the line again, after its rest. */
        void restart() {
            offset = 0;
            lead = LEAD;
            removeCallbacks(tick);
            postDelayed(tick, TICK);
            invalidate();
        }

        void tick() {
            if (!isShown() || names == null || sel >= names.length) return;
            if (!Lit.screenOn()) {
                postDelayed(tick, IDLE);
                return;
            }
            String s = names[sel];
            if (text.measureText(s) <= getWidth() - 8 - nameX) return;
            if (lead > 0) {
                lead--;
            } else {
                offset += STEP;
                if (offset >= text.measureText(s + GAP)) {
                    offset = 0;
                    lead = LEAD;
                }
                invalidate();
            }
            postDelayed(tick, TICK);
        }

        private int rows() {
            return Math.max(1, (getHeight() - HEAD) / ROW);
        }

        @Override
        protected void onDraw(Canvas c) {
            int w = getWidth(), h = getHeight();
            c.drawRect(0, 0, w, h, bg);
            c.drawRect(0, 0, w, 1, line);
            c.drawRect(0, h - 1, w, h, line);
            c.drawRect(0, 0, 1, h, line);
            c.drawRect(w - 1, 0, w, h, line);
            c.drawText(TextUtils.ellipsize(title, head, w - 16, TextUtils.TruncateAt.END).toString(),
                    8, 22, head);
            c.drawText(TextUtils.ellipsize(artist, sub, w - 16, TextUtils.TruncateAt.END).toString(),
                    8, 43, sub);
            c.drawRect(6, HEAD - 3, w - 6, HEAD - 2, line);
            if (names == null) return;
            int rows = rows();
            for (int r = 0; r < rows && first + r < names.length; r++) {
                int i = first + r;
                int top = HEAD + r * ROW;
                boolean on = i == sel;
                if (on) {
                    Drawable d = hl.getBackground();
                    if (d != null) {
                        d.setBounds(1, top, w - 1, top + ROW);
                        d.draw(c);
                    } else {
                        c.drawRect(1, top, w - 1, top + ROW, bar);
                    }
                }
                String s = names[i];
                if (nums[i] == null) {
                    // a disc or side divider: the label in the artist's colour, never under the cursor
                    c.drawText(TextUtils.ellipsize(s, sub, w - 16, TextUtils.TruncateAt.END).toString(),
                            8, top + 19, sub);
                    continue;
                }
                text.setColor(on ? fgSel : fg);
                c.drawText(nums[i], nameX - text.measureText(" ") - text.measureText(nums[i]), top + 19, text);
                float room = w - 8 - nameX;
                if (on && text.measureText(s) > room) {
                    // the title under the cursor runs when it does not fit, as a second copy after a gap
                    float period = text.measureText(s + GAP);
                    c.save();
                    c.clipRect(nameX, top, w - 8, top + ROW);
                    c.drawText(s, nameX - offset, top + 19, text);
                    c.drawText(s, nameX - offset + period, top + 19, text);
                    c.restore();
                    continue;
                }
                c.drawText(TextUtils.ellipsize(s, text, room, TextUtils.TruncateAt.END).toString(),
                        nameX, top + 19, text);
            }
        }
    }

    static final class Load implements Runnable {
        private final IppFlowActivity a;

        Load(IppFlowActivity a) { this.a = a; }

        public void run() {
            long t0 = SystemClock.uptimeMillis();
            List l = Flow.albums();
            a.ui.post(new Loaded(a, l, t0));
        }
    }

    static final class Loaded implements Runnable {
        private final IppFlowActivity a;
        private final List l;
        private final long t0;

        Loaded(IppFlowActivity a, List l, long t0) { this.a = a; this.l = l; this.t0 = t0; }

        public void run() {
            a.loaded(l);
            Diag.slow("flow list shown", t0);
        }
    }

    static final class Repaint implements Runnable {
        private final IppFlowActivity a;

        Repaint(IppFlowActivity a) { this.a = a; }

        public void run() { a.flow.invalidate(); }
    }

    static final class Tracks implements Runnable {
        private final IppFlowActivity a;
        private final Flow.Item it;

        Tracks(IppFlowActivity a, Flow.Item it) { this.a = a; this.it = it; }

        public void run() {
            long t0 = SystemClock.uptimeMillis();
            FlowView.busyTracks = true;
            Flow.Back b = Flow.back(it);
            FlowView.busyTracks = false;
            // No picture for the player here: ~1 MB of bitmaps on every rest of the row, and the
            // collection after it, cost the scrolling row its frames. The open list builds it once
            // the cursor rests on a track (armAhead).
            a.ui.post(new BackDone(a, it, b, t0));
        }
    }

    static final class BackDone implements Runnable {
        private final IppFlowActivity a;
        private final Flow.Item it;
        private final Flow.Back b;
        private final long t0;

        BackDone(IppFlowActivity a, Flow.Item it, Flow.Back b, long t0) {
            this.a = a; this.it = it; this.b = b; this.t0 = t0;
        }

        public void run() { a.backDone(it, b, t0); }
    }

    static final class Rested implements Runnable {
        private final IppFlowActivity a;

        Rested(IppFlowActivity a) { this.a = a; }

        public void run() {
            if (a.state != 0) return;
            if (a.flipPending) {
                a.flipPending = false;
                a.flipOver();
            } else {
                a.armBack();
            }
        }
    }

    static final class BackDwell implements Runnable {
        private final IppFlowActivity a;

        BackDwell(IppFlowActivity a) { this.a = a; }

        public void run() {
            // not while the row is still easing in: what the build allocates would cost the
            // collector pauses that eat its last frames; the row's rest arms this again
            if (!a.flow.resting()) return;
            if (a.state == 0 && a.items != null && !a.items.isEmpty()) {
                a.tracksAhead((Flow.Item) a.items.get(a.flow.target()));
            }
        }
    }

    static final class TracksDone implements Runnable {
        private final IppFlowActivity a;
        private final Flow.Item it;
        private final Flow.Back b;
        private final long t0;

        TracksDone(IppFlowActivity a, Flow.Item it, Flow.Back b, long t0) {
            this.a = a; this.it = it; this.b = b; this.t0 = t0;
        }

        public void run() {
            if (a.flipped >= 0 && a.items.get(a.flipped) == it) {
                a.panel.setSongs(b);
                if (a.state == 2) a.armAhead();
            }
            Diag.slow("flow tracks shown", t0);
        }
    }

    static final class Half implements Runnable {
        private final IppFlowActivity a;
        private final boolean over;

        Half(IppFlowActivity a, boolean over) { this.a = a; this.over = over; }

        public void run() {
            if (over) a.halfOver();
            else a.halfBack();
        }
    }

    static final class Done implements Runnable {
        private final IppFlowActivity a;
        private final int s;

        Done(IppFlowActivity a, int s) { this.a = a; this.s = s; }

        public void run() { a.done(s); }
    }

    static final class Dwell implements Runnable {
        private final IppFlowActivity a;

        Dwell(IppFlowActivity a) { this.a = a; }

        public void run() { a.ahead(); }
    }

    static final class Ahead implements Runnable {
        private final IppFlowActivity a;
        private final Song track;
        private final Song rep;

        Ahead(IppFlowActivity a, Song track, Song rep) { this.a = a; this.track = track; this.rep = rep; }

        public void run() {
            Object[] src = new Object[2];
            FlowView.busyPic = true;
            Bitmap b = Flow.tripAhead(track, rep, src);
            FlowView.busyPic = false;
            a.ui.post(new AheadDone(a, track.getPath(), b, src));
            IppFlowActivity.tidy();
        }
    }

    static final class AheadDone implements Runnable {
        private final IppFlowActivity a;
        private final String path;
        private final Bitmap b;
        private final Object[] src;

        AheadDone(IppFlowActivity a, String path, Bitmap b, Object[] src) {
            this.a = a; this.path = path; this.b = b; this.src = src;
        }

        public void run() { a.aheadDone(path, b, src); }
    }

    /**
     * After a build ahead, while the screen is still: the garbage it left is collected now, by
     * the concurrent collector (pauses of a few ms), and not by a stop-everything pause at the
     * next flip's first allocation.
     */
    static void tidy() {
        if (noGc) return;
        FlowView.busyGc = true;
        System.gc();
        FlowView.busyGc = false;
    }

    static final class ToPlayer implements Runnable {
        private final IppFlowActivity a;

        ToPlayer(IppFlowActivity a) { this.a = a; }

        public void run() { a.toPlayer(); }
    }

    static final class Tick implements Runnable {
        private final Panel p;

        Tick(Panel p) { this.p = p; }

        public void run() { p.tick(); }
    }

    static final class Highlight implements Runnable {
        private final Panel p;

        Highlight(Panel p) { this.p = p; }

        public void run() { p.highlight(); }
    }

    static final class Open implements Runnable {
        private final IppFlowActivity a;

        Open(IppFlowActivity a) { this.a = a; }

        public void run() { a.openPlayer(); }
    }
}
