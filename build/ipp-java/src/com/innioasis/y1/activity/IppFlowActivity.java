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
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.DecelerateInterpolator;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.innioasis.ipp.Albums;
import com.innioasis.ipp.Anim;
import com.innioasis.ipp.Art;
import com.innioasis.ipp.BigCover;
import com.innioasis.ipp.Cover;
import com.innioasis.ipp.Diag;
import com.innioasis.ipp.Flow;
import com.innioasis.ipp.Follow;
import com.innioasis.ipp.FlowView;
import com.innioasis.ipp.Frames;
import com.innioasis.ipp.Help;
import com.innioasis.ipp.Lists;
import com.innioasis.ipp.Lit;
import com.innioasis.ipp.Menus;
import com.innioasis.ipp.Loop;
import com.innioasis.ipp.Photos;
import com.innioasis.ipp.Prefs;
import com.innioasis.ipp.Queue;
import com.innioasis.ipp.Rows;
import com.innioasis.ipp.Theme;
import com.innioasis.music.MusicPlayerActivity;
import com.innioasis.music.adapter.SubmenuAdapter;
import com.innioasis.music.util.SubMenuDialog;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.base.BaseActivity;
import com.innioasis.y1.database.Playlist;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.database.Y1Repository;
import com.innioasis.y1.databinding.ActivityAboutBinding;
import com.innioasis.y1.service.PlayerService;
import com.innioasis.y1.theme.ThemeManager;
import com.innioasis.y1.utils.DialogUtil;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Cover Flow: the library's albums as a row of covers ({@link FlowView}) over the theme's
 * global wallpaper. The wheel moves along the row, centre turns the cover over to its track list, centre
 * on a track plays the album from it and carries the cover into Now Playing, top turns back and
 * then leaves, a long top press on the row opens the album's menu.
 */
public final class IppFlowActivity extends BaseActivity {

    private static final String KEY_POS = "flow_pos";
    private static final int PANEL_W = 360;
    /** The neighbours running off the screen, and the cover travelling to or from the player. */
    private static final int SPREAD_MS = 200;
    private static final int MOVE_MS = 260;
    /** How long after a picture built ahead the list must still stand before its garbage is collected. */
    private static final int TIDY_MS = 700;
    /** What the turn back takes beyond its two halves: the second waits for the first's end action. */
    private static final int TURN_SLACK_MS = 40;

    private FlowView flow;
    private FlowView.Card card;
    /** The player's own picture, travelling between this screen and the player. */
    private ImageView trip;
    private Panel panel;
    private Opts opts;
    private Flow.Loader loader;
    private Handler ui;
    private List items;

    /**
     * 0 the row, 1 turning over, 2 the track list, 3 turning back, 4 at the player, 5 back from it,
     * 6 the settings over the row.
     */
    private volatile int state;
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
        flow.setYears(Flow.yearAt(this));
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
        opts = new Opts(this);
        opts.setVisibility(View.GONE);
        box.addView(opts, new FrameLayout.LayoutParams(-1, -1));
        root.addView(box, -1, -1);
        Rows.watchFlat(new Highlight(panel));
        Lists.watch(playChange);
        new Thread(new Load(this), "ipp-flow-list").start();
        getWindow().getDecorView().getViewTreeObserver().addOnPreDrawListener(new Gate(this));
    }

    // The open list's cursor follows the playing track by the lists' rule (Follow): the user's
    // while the wheel moved it within the return delay or a menu is up, playback's otherwise.
    private final Runnable playChange = new PlayChange(this);
    private final Runnable land = new Land(this);
    private long wheelAt;
    private SubMenuDialog trackMenu;

    /** A track change or play/pause: the marker repaints, a free cursor steps to the track. */
    void playChanged() {
        panel.invalidate();
        if (state == 2 && free() && follows()) {
            String p = Panel.playingPath();
            if (p != null && panel.follow(p)) armAhead();
        }
    }

    private boolean follows() {
        return Prefs.on(this, "follow_playing");
    }

    private boolean free() {
        if (trackMenu != null && trackMenu.isShowing()) return false;
        return !Lit.screenOn() || SystemClock.uptimeMillis() - wheelAt >= Follow.idleMs();
    }

    /** The wheel moved the cursor: the user's until the return delay runs out. */
    private void wheeled() {
        wheelAt = SystemClock.uptimeMillis();
        ui.removeCallbacks(land);
        if (follows()) ui.postDelayed(land, Follow.idleMs());
    }

    /** The return delay is over: the cursor catches up with the playing track. */
    void landed() {
        if (state != 2 || !follows()) return;
        if (trackMenu != null && trackMenu.isShowing()) {
            wheeled();                      // a menu up holds the delay
            return;
        }
        String p = Panel.playingPath();
        if (p != null && panel.follow(p)) armAhead();
    }

    void loaded(List l) {
        if (isFinishing()) return;
        items = l;
        if (l.isEmpty()) {
            Toast.makeText(this, getString(R.string.no_content), Toast.LENGTH_SHORT).show();
            if (loader == null && flow.count() > 0) finish();    // the last album deleted
            return;
        }
        int start = Math.max(0, Math.min(l.size() - 1, Prefs.getInt(this, KEY_POS, 0)));
        if (keepKey == null && Prefs.val(this, Flow.KEY_START) == Flow.START_PLAYING) {
            int at = playingAlbum(l);
            if (at >= 0) start = at;
        }
        for (int i = 0; keepKey != null && i < l.size(); i++) {
            if (keepKey.equals(((Flow.Item) l.get(i)).key)) start = i;
        }
        keepKey = null;
        loader = new Flow.Loader(l, ui, new Repaint(this));
        loader.aim(start);
        Thread t = new Thread(loader, "ipp-flow-covers");
        t.setDaemon(true);
        t.start();
        flow.setItems(l, loader, start);
        flow.setOnRest(new Rested(this));
        if (flow.calm()) {
            flow.setLabels(1);
        } else {
            flow.setLabels(0);
            labels(1, FlowView.FADE_MS);
        }
        armBack();
    }

    /** The playing music's album as an index into the row, -1 when it is not there. */
    private static int playingAlbum(List l) {
        Song s = playingMusic();
        String key = s == null ? null : Albums.keyOf(s);
        for (int i = 0; key != null && i < l.size(); i++) {
            if (key.equals(((Flow.Item) l.get(i)).key)) return i;
        }
        return -1;
    }

    private static Song playingMusic() {
        try {
            PlayerService ps = Y1Application.Companion.getPlayerService();
            return ps == null ? null : ps.getPlayingMusic();
        } catch (Throwable t) {
            return null;
        }
    }

    /** Where the row goes once the list has turned back: the double bottom press from the list. */
    private int goAfter = -1;

    /**
     * The double bottom press: the row travels to the playing album. In that album's open list
     * the cursor goes to the track; another album's list turns back first.
     */
    public void toPlaying() {
        if (items == null || items.isEmpty()) return;
        int at = playingAlbum(items);
        if (at < 0) return;
        if (state == 0) {
            flipPending = false;
            flow.goTo(at);
            armBack();
        } else if (state == 2) {
            if (at == flipped) {
                Song s = playingMusic();
                if (s != null && panel.select(s.getPath())) armAhead();
            } else {
                goAfter = at;
                flipBack();
            }
        }
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
            wheeled();
        } else if (state == 6) {
            opts.move(1);
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
            wheeled();
        } else if (state == 6) {
            opts.move(-1);
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
        } else if (state == 6) {
            opts.change();
            flow.setCount(Flow.count(this));
            flow.setYears(Flow.yearAt(this));
        }
    }

    /** The centre was pressed while the row moved: flip when it rests (Rested). */
    boolean flipPending;

    /** The long top press: the album's menu, on the row only. */
    @Override
    public void longConfirm() {
        if (items == null || items.isEmpty()) return;
        if (state == 2) {
            trackMenu();
            return;
        }
        if (state != 0) return;
        List l = new ArrayList();
        l.add(getString(R.string.song_menu_sort_by));
        l.add(getString(R.string.ipp_queue_add));
        l.add(getString(R.string.album_menu_delete));
        // only on an album with a pick, made here or in Albums: it is the one pick
        if (Art.hasPick(((Flow.Item) items.get(flow.target())).key)) l.add(getString(R.string.ipp_reset_cover));
        // the trailing int is the dialog THEME; 0 sizes the window for twice the rows
        menu = new SubMenuDialog(getActivity(), l, new AlbumMenu(this, flow.target()), R.style.Dialog_Common);
        menu.addPlaylistsToOptions();           // Favorites and "Add to playlist" (Menus.collapse)
        menu.show();
        Menus.append(menu, getString(R.string.main_setting));
    }

    /** The long top press on the open list: the track under the cursor's menu. */
    private void trackMenu() {
        int at = panel.track();
        if (panel.songs == null || at < 0) return;
        Song s = (Song) panel.songs.get(at);
        List l = new ArrayList();
        l.add(getString(R.string.music_delete_file));
        l.add(getString(R.string.ipp_queue_add));
        l.add(getString(R.string.ipp_set_cover));
        trackMenu = new SubMenuDialog(getActivity(), l, new TrackMenu(this, s), R.style.Dialog_Common);
        trackMenu.addPlaylistsToOptions();
        trackMenu.show();
        wheeled();                              // the menu holds the cursor where the user put it
    }

    boolean trackPick(Song s, SubmenuAdapter.Item item) {
        if (item == null || s == null) return true;
        List one = new ArrayList();
        one.add(s);
        Playlist pl = item.getPlaylist();
        if (pl != null) {
            addTo(one, pl);
            return true;
        }
        String str = item.getString();
        if (getString(R.string.ipp_queue_add).equals(str)) {
            Queue.addAllFromMusic(one);
        } else if (getString(R.string.music_delete_file).equals(str)) {
            DialogUtil d = new DialogUtil(getActivity(), false, R.style.Dialog_Common);
            d.setDialogTitle(getString(R.string.is_delete), "", new DeleteTrack(this, s), false, true);
        } else if (getString(R.string.ipp_set_cover).equals(str)) {
            if (flipped >= 0 && flipped < items.size()) pin(flipped, s.getPath(), R.string.ipp_cover_set);
        }
        return true;
    }

    /** The album's pick set or cleared (null), its slide redrawn; Albums' thumbnail follows (Art.pin). */
    private void pin(int at, String path, int said) {
        if (!Art.pin(((Flow.Item) items.get(at)).key, path)) return;
        if (loader != null) loader.renew(at);
        showToast(getString(said));
    }

    /** A slide is in: the row repaints, and a renewed one of the open album goes onto the card. */
    void slid() {
        flow.invalidate();
        if (flipped >= 0 && loader != null) {
            Bitmap b = loader.get(flipped);
            if (b != null) card.setSlide(b);
        }
    }

    /** Songs into a playlist off the main thread; the toast says whether any were new (Playlists.addMsg). */
    private void addTo(List songs, Playlist pl) {
        Thread t = new Thread(new AddTo(this, songs, null, pl.getPlaylistId()), "ipp-flow-playlist");
        t.setDaemon(true);
        t.start();
    }

    void added() {
        if (!isFinishing()) showToast(getString(R.string.added_successfully));
    }

    /** The open list's track off the card, then the list again; the album's last one turns it back. */
    void deleteTrack(Song s) {
        if (flipped < 0 || flipped >= items.size()) return;
        Thread t = new Thread(new DeleteSong(this, s, (Flow.Item) items.get(flipped), panel.row()),
                "ipp-flow-delete");
        t.setDaemon(true);
        t.start();
    }

    void trackDeleted(Flow.Item it, Flow.Back b, int row) {
        backFor = null;
        backReady = null;
        if (isFinishing() || state != 2 || flipped < 0 || items.get(flipped) != it) return;
        if (b == null || b.songs == null || b.songs.isEmpty()) {
            reloadAfter = true;
            flipBack();
            return;
        }
        backFor = it;
        backReady = b;
        panel.setSongs(b);
        panel.near(row);
        armAhead();
    }

    /** The row is built again once the list has turned back: its album is gone. */
    private boolean reloadAfter;

    /** The album menu while it is up, for the Sort by dialog to close with it. */
    private SubMenuDialog menu;
    /** The album the row stood on before it was built again in another order. */
    private String keepKey;

    boolean pick(int at, SubmenuAdapter.Item item) {
        String s = item == null ? null : item.getString();
        if (s == null || at < 0 || at >= items.size()) return true;
        Flow.Item it = (Flow.Item) items.get(at);
        Playlist pl = item.getPlaylist();
        if (pl != null) {
            Thread t = new Thread(new AddTo(this, null, it, pl.getPlaylistId()), "ipp-flow-playlist");
            t.setDaemon(true);
            t.start();
            return true;
        }
        if (s.equals(getString(R.string.song_menu_sort_by))) {
            List l = new ArrayList();
            l.add(getString(R.string.sort_a_z));
            l.add(getString(R.string.sort_z_a));
            l.add(getString(R.string.ipp_sort_date_asc));
            l.add(getString(R.string.ipp_sort_date_desc));
            new SubMenuDialog(getActivity(), l, new SortMenu(this), R.style.Dialog_Common).show();
            return false;                       // the album menu stays behind the sort dialog
        }
        if (s.equals(getString(R.string.ipp_queue_add))) {
            Thread t = new Thread(new Enqueue(this, it), "ipp-flow-queue");
            t.setDaemon(true);
            t.start();
        } else if (s.equals(getString(R.string.album_menu_delete))) {
            DialogUtil d = new DialogUtil(getActivity(), false, R.style.Dialog_Common);
            d.setDialogTitle(getString(R.string.is_delete), "", new DeleteAlbum(this, it), false, true);
        } else if (s.equals(getString(R.string.ipp_reset_cover))) {
            pin(at, null, R.string.ipp_cover_reset);
        } else if (s.equals(getString(R.string.main_setting))) {
            state = 6;
            opts.open();
            flow.setVisibility(View.INVISIBLE);
            setStateBarLeftText(opts.title());
        }
        return true;
    }

    boolean sort(SubmenuAdapter.Item item) {
        String s = item == null ? null : item.getString();
        int v = -1;
        if (getString(R.string.sort_a_z).equals(s)) v = Flow.A_Z;
        else if (getString(R.string.sort_z_a).equals(s)) v = Flow.Z_A;
        else if (getString(R.string.ipp_sort_date_asc).equals(s)) v = Flow.OLDEST;
        else if (getString(R.string.ipp_sort_date_desc).equals(s)) v = Flow.NEWEST;
        if (menu != null) menu.dismiss();      // the pick closes both levels
        menu = null;
        if (v >= 0 && v != Prefs.val(this, Flow.KEY_SORT)) {
            Prefs.setInt(this, Flow.KEY_SORT, v);
            reload();
        }
        return true;
    }

    /** The album's songs off the main thread, then into the queue in the order its back lists them. */
    void enqueued(List songs) {
        if (songs != null && !songs.isEmpty()) Queue.addAllFromMusic(songs);
    }

    /** Every song of the album, files and all, as the Albums screen deletes one; then the row again. */
    void delete(Flow.Item it) {
        Thread t = new Thread(new Delete(this, it), "ipp-flow-delete");
        t.setDaemon(true);
        t.start();
    }

    /** The library changed under the row: built again, standing where it stood. */
    void reload() {
        if (isFinishing()) return;
        if (loader != null) loader.quit();
        loader = null;
        if (items != null && flow != null) {
            int at = flow.target();
            Prefs.setInt(this, KEY_POS, at);
            if (at >= 0 && at < items.size()) keepKey = ((Flow.Item) items.get(at)).key;
        }
        backFor = null;
        backReady = null;
        new Thread(new Load(this), "ipp-flow-list").start();
    }

    @Override
    public void direction(BaseActivity.Direction d) {
        if (d == BaseActivity.Direction.TOP) {
            if (state == 2) flipBack();
            else if (state == 0) finish();
            else if (state == 6) {
                opts.setVisibility(View.GONE);
                flow.setVisibility(View.VISIBLE);
                setStateBarLeftText(getString(R.string.ipp_coverflow));
                state = 0;
                if (opts.regrouped()) reload();
            }
        }
    }

    @Override
    public void quit() {
        finish();
    }

    private void flipOver() {
        Frames.start("flip over", Diag.MEASURE);
        long t0 = SystemClock.uptimeMillis();
        int i = flow.target();
        Flow.Item it = (Flow.Item) items.get(i);
        Bitmap s = loader.get(i);
        state = 1;
        flipped = i;
        hold(true);
        panel.show(it);
        tracks(it);
        // the panel's first frame is the flip's edge: allocating there waits out a running collection
        panel.prepare();

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
        flow.turnedBy(card);
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
        Frames.start("flip back", Diag.MEASURE);
        hold(true);
        state = 3;
        // back in only as the cover finishes turning round: both halves of the turn, the frame the
        // second half waits to start, and slow at first so it does not look done half way
        labels(1, Flow.LEAVE_MS + Flow.CARD_MS + TURN_SLACK_MS).setInterpolator(new AccelerateInterpolator(1.5f));
        edgeOn(new Half(this, false), 90, Flow.LEAVE_MS, Flow.LEAVE_EASE);
    }

    /** The track list shrinks onto the cover's square and turns edge-on, to {@code turn} degrees. */
    private void edgeOn(Runnable end, float turn, int ms, float ease) {
        int ph = flow.getHeight();
        panel.animate().rotationY(turn).scaleX((float) Flow.S / PANEL_W)
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
        flow.turnedBy(null);
        if (!turn || trip.getDrawable() == null) {
            flow.setSpread(0);
            done(0);
            return;
        }
        state = 5;
        Frames.start("from player", Diag.MEASURE);
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
            Bitmap album = Flow.trip(null, Flow.coverOf((Flow.Item) items.get(flipped)));
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
        Drawable d = trip.getDrawable();
        trip.setVisibility(View.GONE);
        trip.setImageBitmap(null);
        trip.setAlpha(1f);
        // landed, and the player that showed it is gone: the next press draws into it, no new composite
        if (d instanceof TransitionDrawable) {
            TransitionDrawable td = (TransitionDrawable) d;
            for (int i = 0; i < td.getNumberOfLayers(); i++) release(td.getDrawable(i));
        } else {
            release(d);
        }
    }

    private static void release(Drawable d) {
        if (d instanceof BitmapDrawable) Cover.release(((BitmapDrawable) d).getBitmap());
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
            if (goAfter >= 0) {
                flow.goTo(goAfter);
                goAfter = -1;
            }
            if (reloadAfter) {
                reloadAfter = false;
                reload();
            }
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
        Frames.start("to player", Diag.MEASURE);
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
        edgeOn(new ToPlayer(this), -90, Flow.LEAVE_MS, Flow.LEAVE_EASE);
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
        trip.setRotationY(90);
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

    private void armBack() {
        ui.removeCallbacks(backDwell);
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
            // in the flip's setup, not in its frames
            new TracksDone(this, it, backReady, SystemClock.uptimeMillis()).run();
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
        // the picture built for the track left behind is redrawn for this one, not thrown away
        Bitmap old = aheadPic;
        aheadPic = null;
        aheadFor = null;
        aheadSrc = null;
        Cover.release(old);
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

    /**
     * Cover Flow's own settings, drawn as the better-Y menu draws a group's rows (IppActivity's
     * newRow and bindRow): five rows to the screen, the theme's setting bar under the cursor, the
     * group's name in the status bar. A layer of this screen, so it opens at once; the row of covers
     * is hidden under it. Its words are the help asset's Cover Flow group, eight languages.
     */
    static final class Opts extends FrameLayout {
        private static final String GROUP = "coverflow";
        private static final String[] KEYS = { Flow.KEY_COUNT, Flow.KEY_GROUP, Flow.KEY_YEAR, Flow.KEY_START };
        /** Each row's values when the asset names none; null is an Off/On row. */
        private static final int[][] NUMS = { Flow.COUNTS, null, { 0, 1, 2 }, { 0, 1 } };
        // the better-Y menu's own numbers
        private static final int ROWS = 5;
        private static final int ACCENT = 0xFF3CFFDE;
        private static final float TEXT_SP = 22f, TEXT_MIN_SP = 14f;
        private static final int TEXT_START = 10;
        private static final int HAIR_ALPHA = 0x1F000000;

        private String title;
        private final String[] labels = new String[KEYS.length];
        private final String[][] values = new String[KEYS.length][];
        private final LinearLayout[] lines = new LinearLayout[KEYS.length];
        private final TextView[] names = new TextView[KEYS.length];
        private final TextView[] vals = new TextView[KEYS.length];
        private final View[] items = new View[KEYS.length];
        private final com.innioasis.ipp.Column col;
        private boolean fitted;

        Opts(Context c) {
            super(c);
            names(c);
            TextView probe = new TextView(c);
            ThemeManager.INSTANCE.itemSetTextColor(probe, c.getResources().getColor(R.color.selected_text_color), false);
            int hair = (probe.getCurrentTextColor() & 0x00FFFFFF) | HAIR_ALPHA;
            for (int k = 0; k < KEYS.length; k++) {
                LinearLayout line = new LinearLayout(c);
                line.setOrientation(LinearLayout.HORIZONTAL);
                line.setBaselineAligned(false);
                line.setGravity(Gravity.CENTER_VERTICAL);
                line.setPadding(TEXT_START, 0, 5, 0);
                TextView label = new TextView(c);
                label.setTypeface(Typeface.MONOSPACE, Typeface.BOLD);
                label.setIncludeFontPadding(false);
                label.setGravity(Gravity.CENTER_VERTICAL);
                label.setText(labels[k]);
                label.setId(com.innioasis.ipp.Column.TITLE);
                LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, -1);
                lp.weight = 1f;
                line.addView(label, lp);
                TextView value = new TextView(c);
                value.setTypeface(Typeface.MONOSPACE, Typeface.BOLD);
                value.setIncludeFontPadding(false);
                value.setGravity(Gravity.CENTER_VERTICAL);
                value.setPadding(6, 0, 6, 0);
                value.setId(com.innioasis.ipp.Column.TEXT);
                line.addView(value, -2, -2);
                LinearLayout item = new LinearLayout(c);
                item.setOrientation(LinearLayout.VERTICAL);
                item.setLayoutParams(new ViewGroup.LayoutParams(-1, -2));
                item.addView(line, new LinearLayout.LayoutParams(-1, 0));
                View h = new View(c);
                h.setBackgroundColor(hair);
                item.addView(h, new LinearLayout.LayoutParams(-1, 1));
                items[k] = item;
                lines[k] = line;
                names[k] = label;
                vals[k] = value;
            }
            col = new com.innioasis.ipp.Column(c, items, new Look(this));
            addView(col.list(), -1, -1);
            col.bar((android.app.Activity) c, false, R.drawable.item_setting_sel, ACCENT, 0xFFFFFFFF);
        }

        static final class Look extends com.innioasis.ipp.Column.Painter {
            private final Opts o;

            Look(Opts o) { this.o = o; }

            public void paint(int row) { o.paint(row); }
        }

        /** The menu's rule: 22sp, smaller until every label fits two lines beside its widest value. */
        private void fit() {
            int h = ((View) getParent()).getHeight();
            int width = ((View) getParent()).getWidth();
            if (fitted || h <= 0) return;
            fitted = true;
            int row = h / ROWS - 1;
            float scaled = getResources().getDisplayMetrics().scaledDensity;
            float sp = TEXT_SP;
            TextPaint p = new TextPaint(Paint.ANTI_ALIAS_FLAG);
            p.setTypeface(Typeface.create(Typeface.MONOSPACE, Typeface.BOLD));
            for (; sp > TEXT_MIN_SP; sp -= 1f) {
                p.setTextSize(sp * scaled);
                boolean all = true;
                for (int k = 0; k < KEYS.length && all; k++) {
                    float widest = 0;
                    for (int v = 0; v < values[k].length; v++) widest = Math.max(widest, p.measureText(values[k][v]));
                    int room = width - TEXT_START - 5 - 6 - 6 - (int) Math.ceil(widest);
                    android.text.StaticLayout l = new android.text.StaticLayout(labels[k], p, Math.max(1, room),
                            android.text.Layout.Alignment.ALIGN_NORMAL, 1f, 0f, false);
                    all = room > 0 && l.getLineCount() <= 2 && l.getHeight() <= row;
                }
                if (all) break;
            }
            for (int k = 0; k < KEYS.length; k++) {
                names[k].setTextSize(sp);
                vals[k].setTextSize(sp);
                lines[k].getLayoutParams().height = row;
            }
            requestLayout();
        }

        /** A row painted as bindRow paints it: the setting bar and the accent under the cursor. */
        private void paint(int k) {
            boolean on = k == col.sel();
            int v = Prefs.val(getContext(), KEYS[k]);
            vals[k].setText(v >= 0 && v < values[k].length ? values[k][v] : "");
            int fg = on ? ACCENT : -1;
            if (!col.barred()) {
                ThemeManager.INSTANCE.itemSetBackground(lines[k], on ? R.drawable.item_setting_sel : 0, on);
            }
            ThemeManager.INSTANCE.itemSetTextColor(names[k], fg, on);
            ThemeManager.INSTANCE.itemSetTextColor(vals[k], fg, on);
        }

        String title() { return title; }

        private void names(Context c) {
            title = c.getString(R.string.ipp_coverflow);
            List rows = Help.rows(c);
            boolean in = false;
            for (int i = 0; i < rows.size(); i++) {
                Help.Row r = (Help.Row) rows.get(i);
                if (r.group) {
                    in = GROUP.equals(r.key);
                    if (in && r.label != null) title = r.label;
                    continue;
                }
                for (int k = 0; in && k < KEYS.length; k++) {
                    if (!KEYS[k].equals(r.key)) continue;
                    labels[k] = r.label;
                    if (r.values != null && NUMS[k] != null && r.values.length == NUMS[k].length) values[k] = r.values;
                }
            }
            for (int k = 0; k < KEYS.length; k++) {
                if (labels[k] == null) labels[k] = KEYS[k];
                if (values[k] != null) continue;
                if (NUMS[k] == null) {
                    values[k] = new String[] { c.getString(R.string.ipp_off), c.getString(R.string.ipp_on) };
                    continue;
                }
                values[k] = new String[NUMS[k].length];
                for (int v = 0; v < NUMS[k].length; v++) values[k][v] = String.valueOf(NUMS[k][v]);
            }
        }

        /** Grouping as it stood when the window opened. */
        private int group;

        /** Grouping was switched while the window was open: the row needs building again. */
        boolean regrouped() { return Prefs.val(getContext(), Flow.KEY_GROUP) != group; }

        void open() {
            group = Prefs.val(getContext(), Flow.KEY_GROUP);
            fit();
            setVisibility(View.VISIBLE);
            col.set(0);
        }

        void move(int d) {
            col.step(d);
        }

        /** The value under the cursor to the next one, round the end. */
        void change() {
            int sel = col.sel();
            int v = Prefs.val(getContext(), KEYS[sel]);
            Prefs.setInt(getContext(), KEYS[sel], (v + 1) % values[sel].length);
            col.repaint(sel);
        }
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
        /**
         * Per row, the title cut to its room, where its number starts, and both as alpha masks
         * drawn in the row's colour. The whole window is redrawn on every step, and a drawText
         * cost ~0.6 ms here: a frame of text was ~14 ms, of masks a bitmap each.
         */
        private String[] fitted;
        private Bitmap[] nameMask, numMask;
        private float[] numAt;
        private int fitW;
        private String titleFit, artistFit;
        private Bitmap titleMask, artistMask;
        private final Paint maskPaint = new Paint();

        /** {@code s} drawn once into an ALPHA_8 bitmap, opaque: the colour comes at drawing. */
        private static Bitmap mask(String s, TextPaint p, int width, int height, int baseline) {
            if (s == null || s.length() == 0 || width <= 0) return null;
            try {
                Bitmap b = Bitmap.createBitmap(width, height, Bitmap.Config.ALPHA_8);
                int col = p.getColor();
                p.setColor(0xFF000000);
                new Canvas(b).drawText(s, 0, baseline, p);
                p.setColor(col);
                return b;
            } catch (Throwable t) {
                return null;
            }
        }

        private void drawMask(Canvas c, Bitmap b, float x, float y, int colour) {
            if (b == null) return;
            maskPaint.setColor(colour);
            c.drawBitmap(b, x, y, maskPaint);
        }

        /** Where a track's title starts: past the widest number. */
        private float nameX = 8;
        private int sel;
        private int first;
        /** The bar's top and the window's top as drawn, in px from the first row: they travel to sel and first. */
        private float barY;
        private float scrollY;
        private long frameAt;

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
            String y = it.year;
            int at = Flow.yearAt(getContext());
            title = Flow.albumLine(it.name, y, at);
            artist = Flow.artistLine(it.artist, y, at);
            titleFit = null;
            artistFit = null;
            songs = null;
            names = null;
            sel = 0;
            first = 0;
            settle();
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
            nameX = 8 + Math.max(wide, MARK) + text.measureText(" ");
            fitted = new String[names.length];
            nameMask = new Bitmap[names.length];
            numMask = new Bitmap[names.length];
            numAt = new float[names.length];
            float numEnd = nameX - text.measureText(" ");
            for (int i = 0; i < nums.length; i++) {
                if (nums[i] != null) numAt[i] = numEnd - text.measureText(nums[i]);
            }
            sel = 0;
            first = 0;
            if (song.length > 0 && song[0] < 0) sel = 1;   // the cursor never stands on a divider
            if (sel >= song.length) sel = 0;
            settle();
            if (Prefs.on(getContext(), "follow_playing")) {
                String p = playingPath();
                if (p != null) select(p);
            }
            restart();
        }

        /** The cursor onto the track at {@code path}, the window centred on it; false when it is not here. */
        boolean select(String path) {
            if (names == null || path == null) return false;
            int at = rowOf(path);
            if (at < 0) return false;
            sel = at;
            int rows = rows();
            first = Math.max(0, Math.min(song.length - rows, sel - rows / 2));
            settle();
            restart();
            return true;
        }

        /**
         * The cursor onto the track at {@code path} as the wheel would bring it: the window moves
         * only as far as it must, and a near step glides. False when the track is not here.
         */
        boolean follow(String path) {
            if (names == null || path == null) return false;
            int at = rowOf(path);
            if (at < 0) return false;
            if (at == sel) return true;
            boolean far = Math.abs(at - sel) > JUMP;
            int was = first;
            sel = at;
            int rows = rows();
            int top = sel > 0 && song[sel - 1] < 0 ? sel - 1 : sel;
            if (top < first) first = top;
            if (sel >= first + rows) first = sel - rows + 1;
            if (!Anim.on() || far) settle();
            else shift(was, rows);
            restart();
            return true;
        }

        int row() { return sel; }

        /** The cursor back near row {@code row}, on a track: after a deletion. */
        void near(int row) {
            if (song == null || song.length == 0) return;
            int s = Math.max(0, Math.min(song.length - 1, row));
            while (s < song.length && song[s] < 0) s++;
            if (s >= song.length) {
                s = song.length - 1;
                while (s > 0 && song[s] < 0) s--;
            }
            sel = s;
            int rows = rows();
            first = Math.max(0, Math.min(Math.max(0, song.length - rows), first));
            if (sel < first) first = sel;
            if (sel >= first + rows) first = sel - rows + 1;
            settle();
            restart();
        }

        private int rowOf(String path) {
            for (int i = 0; i < song.length; i++) {
                if (song[i] >= 0 && path.equals(((Song) songs.get(song[i])).getPath())) return i;
            }
            return -1;
        }

        /** Whatever is playing, music or audiobook, as the lists' marker asks it. */
        static String playingPath() {
            try {
                PlayerService ps = Y1Application.Companion.getPlayerService();
                Song s = ps == null ? null : ps.getPlayingSong();
                return s == null ? null : s.getPath();
            } catch (Throwable t) {
                return null;
            }
        }

        // The playing marker: the lists' state icon in the number's column, in the row's text colour.
        private static final int MARK = 16;
        private final Paint markPaint = new Paint(Paint.FILTER_BITMAP_FLAG);
        private final android.graphics.Rect markTo = new android.graphics.Rect();
        private int markRes;
        private int markColour;
        private Bitmap mark;

        private Bitmap mark(int res) {
            if (res != markRes) {
                markRes = res;
                mark = null;
                try {
                    mark = android.graphics.BitmapFactory.decodeResource(getResources(), res);
                } catch (Throwable t) {
                }
            }
            return mark;
        }

        /** The bar and the window stand where they belong, no travel. */
        private void settle() {
            barY = sel * ROW;
            barV = 0f;
            scrollY = first * ROW;
            frameAt = 0;
        }

        /** The song under the cursor, as an index into {@link #songs}; -1 when there is none. */
        int track() {
            return song == null || sel >= song.length ? -1 : song[sel];
        }

        void move(int d) {
            if (names == null || names.length == 0) return;
            if (postWrap) {
                // the stop after a wrap, as in the lists (Loop.afterWrap)
                if (Anim.on() && SystemClock.uptimeMillis() - selAt < Loop.PAUSE_MS) return;
                postWrap = false;
            }
            int s = sel;
            do {
                s += d;
            } while (s >= 0 && s < song.length && song[s] < 0);
            boolean wrap = false;
            if (s < 0 || s >= song.length) {
                if (!Loop.on()) {
                    // against the end: the bounce alone
                    if (Anim.on()) {
                        bouncing = true;
                        barV += d * Loop.BUMP_V;
                        invalidate();
                    }
                    return;
                }
                // only once the wheel and the bar have stood still; meanwhile the bar bounces (Loop.swallow)
                long now = SystemClock.uptimeMillis();
                long quiet = now - Math.max(selAt, endAt);
                endAt = now;
                if (Anim.on() && (quiet <= Loop.STOP_MS || barY != sel * ROW || scrollY != first * ROW
                        || barV != 0f)) {
                    bouncing = true;
                    barV += d * Loop.BUMP_V;
                    invalidate();
                    return;
                }
                // round the end (Loop scrolling): the first or the last track, past its dividers
                s = d > 0 ? 0 : song.length - 1;
                while (s >= 0 && s < song.length && song[s] < 0) s += d > 0 ? 1 : -1;
                if (s < 0 || s >= song.length || s == sel) return;
                wrap = true;
                postWrap = true;
            }
            int was = first;
            sel = s;
            selAt = SystemClock.uptimeMillis();
            bouncing = false;
            int rows = rows();
            // a divider right above the cursor comes into view with it
            int top = sel > 0 && song[sel - 1] < 0 ? sel - 1 : sel;
            if (top < first) first = top;
            if (sel >= first + rows) first = sel - rows + 1;
            // the lists' rule: a step glides; going round the end and a jump further than JUMP rows
            // stand at once
            if (!Anim.on() || wrap || Math.abs(sel * ROW - barY) > JUMP * ROW) settle();
            else shift(was, rows);
            restart();
        }

        /**
         * The window past its edge moves at once, as a list does: the bar keeps its place on the
         * screen and goes on from there, so at the edge the next row is under it in the same frame.
         */
        private void shift(int was, int rows) {
            if (first == was) return;
            float onScreen = barY - scrollY;
            scrollY = first * ROW;
            barY = scrollY + Math.max(0, Math.min((rows - 1) * ROW, onScreen));
        }

        // The travel: the bar on the lists' critically damped spring (Bar); the window by the lists'
        // Glider only where shift did not move it.
        private static final int JUMP = 4;
        /** When the wheel last stepped; a bounce against the end under way; a wrap just taken. */
        private long selAt, endAt;
        private boolean bouncing, postWrap;
        private static final float OMEGA = 30f;
        /** The spring's speed, px/s. */
        private float barV;
        private static final float LIST_RATE = 14f, LIST_MIN = 400f, LIST_MAX = 6000f;

        /** One frame of travel; true while either has a way to go. */
        private boolean travel() {
            float barT = sel * ROW, scrollT = first * ROW;
            if (!Anim.on()) {
                barY = barT;
                scrollY = scrollT;
                return false;
            }
            long now = SystemClock.uptimeMillis();
            long dt = frameAt == 0 ? 16 : Math.min(50, now - frameAt);
            frameAt = now;
            if (barY != barT || barV != 0f) {
                float e = barY - barT;
                float cv = barV + OMEGA * e;
                float t = dt / 1000f;
                float ex = (float) Math.exp(-OMEGA * t);
                float ne = (e + cv * t) * ex;
                barV = (barV - OMEGA * cv * t) * ex;
                barY = barT + ne;
                if (Math.abs(ne) < 0.5f && Math.abs(barV) < 15f) {
                    barY = barT;
                    barV = 0f;
                }
            }
            scrollY = approach(scrollY, scrollT, dt, LIST_RATE, LIST_MIN, LIST_MAX);
            boolean going = barY != barT || scrollY != scrollT || barV != 0f;
            if (!going) {
                frameAt = 0;
                bouncing = false;
            }
            return going;
        }

        private static float approach(float cur, float to, long dt, float rate, float min, float max) {
            float d = to - cur;
            float ad = Math.abs(d);
            if (ad < 0.5f) return to;
            float v = Math.max(min, Math.min(max, ad * rate));
            float step = v * dt / 1000f;
            if (step >= ad) return to;
            return cur + (d > 0 ? step : -step);
        }

        /** {@code a} to {@code b} by {@code f}, channel by channel. */
        private static int blend(int a, int b, float f) {
            if (f <= 0) return a;
            if (f >= 1) return b;
            int r = 0;
            for (int s = 0; s < 32; s += 8) {
                int ca = (a >>> s) & 0xFF, cb = (b >>> s) & 0xFF;
                r |= ((int) (ca + (cb - ca) * f + 0.5f) & 0xFF) << s;
            }
            return r;
        }

        // The marquee of the row under the cursor, at the pace of the mod's other marquees (Scroll).
        private static final int STEP = 2;
        private static final int TICK = 40;
        private static final int LEAD = 38;
        private static final int IDLE = 1000;
        private static final String GAP = "     ";
        private int offset;
        private int lead;
        /** The line has started running: until then it rests ellipsised, as the lists' rows do. */
        private boolean ran;
        private final Tick tick = new Tick(this);

        /** From the head of the line again, after its rest. */
        void restart() {
            offset = 0;
            lead = LEAD;
            ran = false;
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
                ran = true;
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

        /** The head's masks for width {@code w}; everything fitted to another width is dropped. */
        private void fitHead(int w) {
            if (w != fitW) {
                fitW = w;
                titleFit = null;
                artistFit = null;
                if (fitted != null) {
                    fitted = new String[fitted.length];
                    nameMask = new Bitmap[fitted.length];
                }
            }
            if (titleFit == null) {
                titleFit = TextUtils.ellipsize(title, head, w - 16, TextUtils.TruncateAt.END).toString();
                titleMask = mask(titleFit, head, w - 16, 30, 22);
            }
            if (artistFit == null) {
                artistFit = TextUtils.ellipsize(artist, sub, w - 16, TextUtils.TruncateAt.END).toString();
                artistMask = mask(artistFit, sub, w - 16, 30, 22);
            }
        }

        /** Row {@code i}'s cut title and its masks, built on first need. */
        private void fitRow(int i, int w) {
            if (nums[i] == null) {
                if (fitted[i] == null) {
                    fitted[i] = TextUtils.ellipsize(names[i], sub, w - 16, TextUtils.TruncateAt.END).toString();
                    nameMask[i] = mask(fitted[i], sub, w - 16, ROW, 19);
                }
                return;
            }
            if (numMask[i] == null) numMask[i] = mask(nums[i], text, (int) Math.ceil(nameX - numAt[i]), ROW, 19);
            if (fitted[i] == null) {
                float room = w - 8 - nameX;
                fitted[i] = TextUtils.ellipsize(names[i], text, room, TextUtils.TruncateAt.END).toString();
                nameMask[i] = mask(fitted[i], text, (int) room, ROW, 19);
            }
        }

        /** Everything the first frame will draw, built now: that frame is the flip's edge. */
        void prepare() {
            int w = getWidth();
            if (w <= 0) return;
            fitHead(w);
            if (names == null) return;
            int from = Math.max(0, (int) (scrollY / ROW));
            int to = Math.min(names.length, from + rows() + 1);
            for (int i = from; i < to; i++) fitRow(i, w);
            int res = playingPath() == null ? 0 : Rows.stateIcon();
            if (res != 0) mark(res);
        }

        @Override
        protected void onDraw(Canvas c) {
            int w = getWidth(), h = getHeight();
            fitHead(w);
            c.drawRect(0, 0, w, h, bg);
            c.drawRect(0, 0, w, 1, line);
            c.drawRect(0, h - 1, w, h, line);
            c.drawRect(0, 0, 1, h, line);
            c.drawRect(w - 1, 0, w, h, line);
            drawMask(c, titleMask, 8, 0, head.getColor());
            drawMask(c, artistMask, 8, 21, sub.getColor());
            c.drawRect(6, HEAD - 3, w - 6, HEAD - 2, line);
            if (names == null) return;
            boolean going = travel();
            int rows = rows();
            c.save();
            // at rest exactly the whole rows stock showed; in travel the next one slides in under the clip
            c.clipRect(1, HEAD, w - 1, HEAD + rows * ROW);
            float barTop = HEAD + barY - scrollY;
            Drawable d = hl.getBackground();
            if (d != null) {
                d.setBounds(1, (int) barTop, w - 1, (int) barTop + ROW);
                d.draw(c);
            } else {
                c.drawRect(1, barTop, w - 1, barTop + ROW, bar);
            }
            int from = Math.max(0, (int) (scrollY / ROW));
            String playing = playingPath();
            int markAt = playing == null ? -1 : rowOf(playing);
            int res = markAt < 0 ? 0 : Rows.stateIcon();
            Bitmap m = res == 0 ? null : mark(res);
            for (int i = from; i < names.length; i++) {
                int top = HEAD + Math.round(i * ROW - scrollY);
                if (top >= HEAD + rows * ROW) break;
                boolean on = i == sel;
                // the text takes the cursor's colour as far as the bar covers its row
                float cover = bouncing ? (on ? 1f : 0f)
                        : (Math.min(barTop + ROW, top + ROW) - Math.max(barTop, top)) / ROW;
                String s = names[i];
                fitRow(i, w);
                if (nums[i] == null) {
                    // a disc or side divider: the label in the artist's colour, never under the cursor
                    drawMask(c, nameMask[i], 8, top, sub.getColor());
                    continue;
                }
                text.setColor(blend(fg, fgSel, cover));
                float numEnd = nameX - text.measureText(" ");
                if (i == markAt && m != null) {
                    int mt = top + (ROW - MARK) / 2;
                    markTo.set((int) numEnd - MARK, mt, (int) numEnd, mt + MARK);
                    if (markColour != text.getColor()) {
                        markColour = text.getColor();
                        markPaint.setColorFilter(new android.graphics.PorterDuffColorFilter(
                                markColour, android.graphics.PorterDuff.Mode.SRC_IN));
                    }
                    c.drawBitmap(m, null, markTo, markPaint);
                } else {
                    drawMask(c, numMask[i], numAt[i], top, text.getColor());
                }
                if (on && ran && fitted[i] != s) {
                    // cut = it does not fit: the title under the cursor runs, as a second copy after a gap
                    float period = text.measureText(s + GAP);
                    c.save();
                    c.clipRect(nameX, top, w - 8, top + ROW);
                    c.drawText(s, nameX - offset, top + 19, text);
                    c.drawText(s, nameX - offset + period, top + 19, text);
                    c.restore();
                    continue;
                }
                drawMask(c, nameMask[i], nameX, top, text.getColor());
            }
            c.restore();
            if (going) postInvalidateOnAnimation();
        }
    }

    static final class Load implements Runnable {
        private final IppFlowActivity a;

        Load(IppFlowActivity a) { this.a = a; }

        public void run() {
            long t0 = SystemClock.uptimeMillis();
            List l = Flow.ordered(a, Flow.albums());
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

    /**
     * The screen's first frame waits for the centre cover and three either side, so that the row
     * opens whole instead of covers popping up one by one; never longer than {@code GATE_MS}.
     */
    static final class Gate implements android.view.ViewTreeObserver.OnPreDrawListener {
        private static final long GATE_MS = 600;
        private final IppFlowActivity a;
        private final long until = SystemClock.uptimeMillis() + GATE_MS;

        Gate(IppFlowActivity a) { this.a = a; }

        public boolean onPreDraw() {
            Flow.Loader l = a.loader;
            boolean empty = a.items != null && a.items.isEmpty();
            if (!empty && !a.isFinishing() && SystemClock.uptimeMillis() < until
                    && (l == null || !l.firstReady())) {
                return false;
            }
            a.getWindow().getDecorView().getViewTreeObserver().removeOnPreDrawListener(this);
            return true;
        }
    }

    static final class Repaint implements Runnable {
        private final IppFlowActivity a;

        Repaint(IppFlowActivity a) { this.a = a; }

        public void run() { a.slid(); }
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
            // a collection overlapping a flip just begun costs it a frame, and a list only glanced
            // at closes about now: collect only once the list has stood a while longer
            try {
                Thread.sleep(TIDY_MS);
            } catch (InterruptedException e) {
            }
            if (!a.animating && a.state == 2) IppFlowActivity.tidy();
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
        FlowView.busyGc = true;
        System.gc();
        FlowView.busyGc = false;
    }

    static final class AlbumMenu implements SubMenuDialog.Callback {
        private final IppFlowActivity a;
        private final int at;

        AlbumMenu(IppFlowActivity a, int at) { this.a = a; this.at = at; }

        @Override
        public boolean select(int index, SubmenuAdapter.Item item) { return a.pick(at, item); }
    }

    static final class SortMenu implements SubMenuDialog.Callback {
        private final IppFlowActivity a;

        SortMenu(IppFlowActivity a) { this.a = a; }

        @Override
        public boolean select(int index, SubmenuAdapter.Item item) { return a.sort(item); }
    }

    static final class Enqueue implements Runnable {
        private final IppFlowActivity a;
        private final Flow.Item it;

        Enqueue(IppFlowActivity a, Flow.Item it) { this.a = a; this.it = it; }

        public void run() {
            Flow.Back b = Flow.back(it);
            a.ui.post(new Enqueued(a, b == null ? null : b.songs));
        }
    }

    static final class Enqueued implements Runnable {
        private final IppFlowActivity a;
        private final List songs;

        Enqueued(IppFlowActivity a, List songs) { this.a = a; this.songs = songs; }

        public void run() { a.enqueued(songs); }
    }

    static final class DeleteAlbum extends DialogUtil.DialogCallback {
        private final IppFlowActivity a;
        private final Flow.Item it;

        DeleteAlbum(IppFlowActivity a, Flow.Item it) { this.a = a; this.it = it; }

        @Override
        public void confirm() { a.delete(it); }

        @Override
        public void cancel() {
        }
    }

    static final class Delete implements Runnable {
        private final IppFlowActivity a;
        private final Flow.Item it;

        Delete(IppFlowActivity a, Flow.Item it) { this.a = a; this.it = it; }

        public void run() {
            try {
                // deleteSong takes the FILE off the card, and invalidates the caches itself
                Y1Repository r = Y1Application.Companion.getY1Repository();
                List l = new ArrayList(Albums.songsOf(it.key));
                r.startDeleteSongs();
                try {
                    for (int i = 0; i < l.size(); i++) r.deleteSong((Song) l.get(i));
                } finally {
                    r.endDeleteSongs();
                }
            } catch (Throwable t) {
            }
            a.ui.post(new Reload(a));
        }
    }

    static final class PlayChange implements Runnable {
        private final IppFlowActivity a;

        PlayChange(IppFlowActivity a) { this.a = a; }

        public void run() { a.playChanged(); }
    }

    static final class Land implements Runnable {
        private final IppFlowActivity a;

        Land(IppFlowActivity a) { this.a = a; }

        public void run() { a.landed(); }
    }

    static final class TrackMenu implements SubMenuDialog.Callback {
        private final IppFlowActivity a;
        private final Song s;

        TrackMenu(IppFlowActivity a, Song s) { this.a = a; this.s = s; }

        @Override
        public boolean select(int index, SubmenuAdapter.Item item) { return a.trackPick(s, item); }
    }

    /** The given songs, or the album's in the order its back lists them, into a playlist. */
    static final class AddTo implements Runnable {
        private final IppFlowActivity a;
        private final List songs;
        private final Flow.Item it;
        private final UUID id;

        AddTo(IppFlowActivity a, List songs, Flow.Item it, UUID id) {
            this.a = a; this.songs = songs; this.it = it; this.id = id;
        }

        public void run() {
            try {
                List l = songs;
                if (l == null) {
                    Flow.Back b = Flow.back(it);
                    l = b == null ? null : b.songs;
                }
                if (l == null || l.isEmpty()) return;
                Y1Application.Companion.getY1Repository().addToPlayList(l, id);
                a.ui.post(new Added(a));
            } catch (Throwable t) {
            }
        }
    }

    static final class Added implements Runnable {
        private final IppFlowActivity a;

        Added(IppFlowActivity a) { this.a = a; }

        public void run() { a.added(); }
    }

    static final class DeleteTrack extends DialogUtil.DialogCallback {
        private final IppFlowActivity a;
        private final Song s;

        DeleteTrack(IppFlowActivity a, Song s) { this.a = a; this.s = s; }

        @Override
        public void confirm() { a.deleteTrack(s); }

        @Override
        public void cancel() {
        }
    }

    static final class DeleteSong implements Runnable {
        private final IppFlowActivity a;
        private final Song s;
        private final Flow.Item it;
        private final int row;

        DeleteSong(IppFlowActivity a, Song s, Flow.Item it, int row) {
            this.a = a; this.s = s; this.it = it; this.row = row;
        }

        public void run() {
            Flow.Back b = null;
            try {
                // deleteSong takes the FILE off the card, and invalidates the caches itself
                Y1Repository r = Y1Application.Companion.getY1Repository();
                r.startDeleteSongs();
                try {
                    r.deleteSong(s);
                } finally {
                    r.endDeleteSongs();
                }
                b = Flow.back(it);
            } catch (Throwable t) {
            }
            a.ui.post(new TrackDeleted(a, it, b, row));
        }
    }

    static final class TrackDeleted implements Runnable {
        private final IppFlowActivity a;
        private final Flow.Item it;
        private final Flow.Back b;
        private final int row;

        TrackDeleted(IppFlowActivity a, Flow.Item it, Flow.Back b, int row) {
            this.a = a; this.it = it; this.b = b; this.row = row;
        }

        public void run() { a.trackDeleted(it, b, row); }
    }

    static final class Reload implements Runnable {
        private final IppFlowActivity a;

        Reload(IppFlowActivity a) { this.a = a; }

        public void run() { a.reload(); }
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
