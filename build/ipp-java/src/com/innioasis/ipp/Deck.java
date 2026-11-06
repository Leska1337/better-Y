package com.innioasis.ipp;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.widget.ImageView;
import com.innioasis.fm.configs.KeyMap;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.base.BasePlayerActivity;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.service.PlayerService;
import com.innioasis.y1.utils.SharedPreferencesUtils;

import java.lang.ref.WeakReference;

/**
 * The Now-Playing button row: the wheel moves focus, centre activates, back exits / cancels AB /
 * closes lyrics; plus the AB-loop icon. Which buttons show follows {@code top_hold}. On an
 * audiobook the row is the book's own: shuffle, repeat, speed, timer ({@link Audio}).
 */
public final class Deck {
    // Slots: 0 heart, 1 shuffle, 2 repeat, 3 lyrics, 4 AB, 5 queue, 6 speed, 7 timer, 8 bookmark;
    // 6-8 are audiobook-only. On a book, 5 and 8 swap: the one the long top press is NOT doing.

    /** The walking order per mode: must match the LinearLayout's child order exactly. */
    private static final int[] ORDER_MUSIC = { 0, 1, 2, 3, 4, 5 };
    private static final int[] ORDER_BOOK = { 8, 1, 2, 6, 7, 5 };

    private static int[] order(BasePlayerActivity a) {
        return book(a) ? ORDER_BOOK : ORDER_MUSIC;
    }

    static boolean active = false;
    static int focus = 0;
    static Handler animH = new Handler(Looper.getMainLooper());
    static Runnable animR = new DeckAnim();
    static boolean animPhase = false;
    static boolean animRunning = false;
    static BasePlayerActivity animAct = null;
    /** The last rendered player, for repaints on state changes. */
    static WeakReference lastAct = null;

    private static Context appCtx() {
        return Y1Application.Companion.getAppContext();
    }

    private static String curPath() {
        PlayerService ps = Y1Application.Companion.getPlayerService();
        if (ps == null) return null;
        Song s = ps.getPlayingMusic();
        if (s == null) return null;
        return s.getPath();
    }

    private static boolean curLiked() {
        return Likes.get(curPath());
    }

    private static void toggleLike() {
        String path = curPath();
        if (path == null) return;
        Context c = appCtx();
        if (c == null) return;
        boolean on = !Likes.get(path);
        Likes.set(path, on);
        if (on) {
            Fav.add(c, path);
        } else {
            Fav.remove(c, path);
        }
    }

    /** The screen decides, not the service: both players share this layout. */
    private static boolean book(BasePlayerActivity a) {
        return a instanceof com.innioasis.y1.activity.AudioPlayerActivity;
    }

    private static boolean shuffleOn(BasePlayerActivity a) {
        SharedPreferencesUtils s = SharedPreferencesUtils.INSTANCE;
        return book(a) ? s.getAudiobookIsShuffle() : s.getMusicIsShuffle();
    }

    /**
     * Also starts or ends a shuffled pass ({@link Queue#onShuffleChanged}). The counter is repainted
     * here, not via {@code refreshUI}, which would reload cover and lyrics.
     */
    private static void toggleShuffle(BasePlayerActivity a) {
        SharedPreferencesUtils s = SharedPreferencesUtils.INSTANCE;
        if (book(a)) s.setAudiobookIsShuffle(!s.getAudiobookIsShuffle());
        else s.setMusicIsShuffle(!s.getMusicIsShuffle());
        Queue.onShuffleChanged();
        refreshCounter(a);
    }

    private static void refreshCounter(BasePlayerActivity a) {
        try {
            if (a == null) return;
            PlayerService ps = Y1Application.Companion.getPlayerService();
            if (ps == null) return;
            java.util.List ml = book(a) ? ps.getAudiobookList() : ps.getMusicList();
            if (ml == null) return;
            // A book resumed from a bookmark shows stock's "0/n-1"; left alone.
            if (book(a) && ps.getBookMarkProgress() != null) return;
            View v = ((android.app.Activity) a).findViewById(R.id.tv_index_of_songs);
            if (v instanceof android.widget.TextView) {
                ((android.widget.TextView) v).setText(Queue.trackNo(ps) + "/" + ml.size());
            }
        } catch (Throwable t) {
        }
    }

    private static int repeatMode(BasePlayerActivity a) {
        SharedPreferencesUtils s = SharedPreferencesUtils.INSTANCE;
        return book(a) ? s.getAudiobookRepeatMode() : s.getMusicRepeatMode();
    }

    private static void cycleRepeat(BasePlayerActivity a) {
        SharedPreferencesUtils s = SharedPreferencesUtils.INSTANCE;
        int m = repeatMode(a);
        int next = m == 0 ? 2 : (m == 2 ? 1 : 0);
        if (book(a)) s.setAudiobookRepeatMode(next);
        else s.setMusicRepeatMode(next);
    }

    private static boolean heartHidden() {
        Context c = appCtx();
        if (c == null) return true;
        return !Prefs.on(c, "likes");
    }

    private static boolean heartShow() {
        return !heartHidden();
    }

    public static int topHold() {
        Context c = appCtx();
        if (c == null) return 0;
        return Prefs.val(c, "top_hold");
    }

    private static boolean showText() {
        return topHold() != 0;
    }

    private static boolean showAb() {
        return topHold() != 2;
    }

    private static boolean showQueue() {
        return topHold() != 1;
    }

    // From PlayerService: BasePlayerActivity's getAPoint/getBPoint are private delegates to it.
    private static int abState(BasePlayerActivity a) {
        PlayerService ps = Y1Application.Companion.getPlayerService();
        long ap = ps != null ? ps.getAPoint() : -1L;
        if (ap < 0) return 0;
        long bp = ps != null ? ps.getBPoint() : -1L;
        return bp < 0 ? 1 : 2;
    }

    /**
     * The A/B time labels under the bar ({@code ProgressMaskView.onDraw}), kept from overlapping;
     * the pins never move. B gives way: stock's place, else the other side of its pin, else past
     * A's label. Reacts to the actual overlap — the bar is mirrored in Hebrew.
     */
    private static final float AB_GAP = 5f;

    private static float abLeft, abRight;
    private static boolean abHaveA;

    /** Stock's place, kept inside the view, remembered for {@link #abBX}. */
    public static float abAX(View v, android.graphics.Paint p, String text, float pinX) {
        try {
            float w = p.measureText(text);
            float x = abFit(v, pinX - p.getTextSize() - 2f, w);
            abLeft = x;
            abRight = x + w;
            abHaveA = true;
            return x;
        } catch (Throwable t) {
            abHaveA = false;
            return pinX;
        }
    }

    public static float abBX(View v, android.graphics.Paint p, String text, float pinX) {
        try {
            float w = p.measureText(text);
            float x = abFit(v, pinX - p.getTextSize() - 2f, w);
            // Consumed: B must never be pushed by a stale A.
            boolean haveA = abHaveA;
            abHaveA = false;
            if (!haveA || !abHits(x, w)) return x;
            float other = abFit(v, pinX + AB_GAP, w);
            if (!abHits(other, w)) return other;
            return abFit(v, abRight + AB_GAP, w);
        } catch (Throwable t) {
            return pinX;
        }
    }

    private static boolean abHits(float x, float w) {
        return x + w > abLeft - AB_GAP && x < abRight + AB_GAP;
    }

    private static float abFit(View v, float x, float w) {
        int width = v == null ? 0 : v.getWidth();
        if (width > 0 && x + w > width) x = width - w;
        return x < 0f ? 0f : x;
    }

    private static int iconHeart() {
        return curLiked() ? R.mipmap.ipp_heart_on : R.mipmap.ipp_heart_off;
    }

    private static int iconShuffle(BasePlayerActivity a) {
        return shuffleOn(a) ? R.mipmap.music_shuffle : R.mipmap.music_no_shuffle;
    }

    private static int iconRepeat(BasePlayerActivity a) {
        int m = repeatMode(a);
        return m == 0 ? R.mipmap.music_no_repeat : (m == 1 ? R.mipmap.music_repeat_one : R.mipmap.music_repeat_all);
    }

    private static int iconAb(BasePlayerActivity a) {
        int st = abState(a);
        if (st == 0) return R.mipmap.ipp_AB_off;
        if (st == 1) return animPhase ? R.mipmap.ipp_AB_select : R.mipmap.ipp_AB;
        return animPhase ? R.mipmap.ipp_AB_off : R.mipmap.ipp_AB;
    }

    private static void startAnim(BasePlayerActivity a) {
        animAct = a;
        if (animRunning) return;
        animRunning = true;
        animH.postDelayed(animR, 400L);
    }

    private static void stopAnim() {
        animRunning = false;
        if (animH != null) {
            animH.removeCallbacks(animR);
        }
    }

    public static void animTick() {
        BasePlayerActivity a = animAct;
        if (a == null) {
            animRunning = false;
            return;
        }
        if (abState(a) == 0) {
            animRunning = false;
            render(a);
        } else {
            animPhase = !animPhase;
            render(a);
            animH.postDelayed(animR, 400L);
        }
    }

    private static int iconRepeatOrAb(BasePlayerActivity a) {
        if (book(a) || topHold() != 2 || abState(a) == 0) return iconRepeat(a);
        return iconAb(a);
    }

    private static ImageView iv(BasePlayerActivity a, int id) {
        // Cast: findViewById is ambiguous with AppCompatActivity's generic overload.
        View v = ((android.app.Activity) a).findViewById(id);
        if (v instanceof ImageView) return (ImageView) v;
        return null;
    }

    /** The focus wash behind the button with the cursor. */
    private static final int HILITE = 1715273694;

    /**
     * Cheap ONLY because every button already has a background: from none, setBackgroundColor
     * requests a layout of the whole player (~20 ms per render). So the
     * {@code android:background="#00000000"} in {@code activity_music_player.xml} must stay.
     */
    private static void hl(ImageView iv, boolean on) {
        if (iv == null) return;
        iv.setBackgroundColor(on ? HILITE : 0);
    }

    private static boolean focused(int i) {
        return active && focus == i;
    }

    /** 6-8 on a book only, 0/3/4 on music only; on a book 5 and 8 swap. */
    private static boolean visible(BasePlayerActivity a, int i) {
        if (book(a)) {
            if (i == 8) return Audio.bookTopHold() == 1;
            if (i == 5) return Audio.bookTopHold() != 1;
            return i == 1 || i == 2 || i == 6 || i == 7;
        }
        if (i == 0) return heartShow();
        if (i == 3) return showText();
        if (i == 4) return showAb();
        if (i == 5) return showQueue();
        return i < 6;
    }

    private static int firstVisible(BasePlayerActivity a) {
        int[] o = order(a);
        for (int i = 0; i < o.length; i++) {
            if (visible(a, o[i])) return o[i];
        }
        return 0;
    }

    /** -1 when not in this mode's order. */
    private static int posOf(BasePlayerActivity a, int slot) {
        int[] o = order(a);
        for (int i = 0; i < o.length; i++) {
            if (o[i] == slot) return i;
        }
        return -1;
    }

    private static void apply(BasePlayerActivity a, int id, int slot, boolean show, int icon, int tint) {
        ImageView iv = iv(a, id);
        if (iv == null) return;
        if (!show) {
            iv.setVisibility(8);
            hl(iv, false);
        } else {
            iv.setVisibility(0);
            if (icon != 0) {
                Icons.apply(iv, icon, tint);
            }
            hl(iv, focused(slot));
        }
    }

    /** Speed and timer. {@code text == null}: at the default, plain "off" artwork. */
    private static void label(BasePlayerActivity a, int id, int slot, boolean show, int icon,
                              int tint, String text, String widest) {
        ImageView iv = iv(a, id);
        if (iv == null) return;
        if (!show) {
            iv.setVisibility(8);
            hl(iv, false);
            return;
        }
        iv.setVisibility(0);
        // icon 0: the value IS the button (speed); else it goes inside the artwork (timer).
        if (icon == 0) Icons.value(iv, text, widest, tint);
        else Icons.label(iv, icon, tint, text);
        hl(iv, focused(slot));
    }

    public static void render(BasePlayerActivity a) {
        lastAct = a == null ? null : new WeakReference(a);
        boolean bk = book(a);
        int tint = Icons.timelineColor((android.app.Activity) a);   // memoised
        apply(a, R.id.ipp_bookmark, 8, visible(a, 8), R.mipmap.ipp_bookmark, tint);
        // Hidden buttons get icon 0: no reading state nothing will draw.
        apply(a, R.id.ipp_heart, 0, !bk && heartShow(), bk ? 0 : iconHeart(), tint);
        apply(a, R.id.is_shuffle, 1, true, iconShuffle(a), tint);
        apply(a, R.id.repeat_mode, 2, true, iconRepeatOrAb(a), tint);
        apply(a, R.id.ipp_text, 3, !bk && showText(), R.mipmap.ipp_lyrics, tint);
        apply(a, R.id.ipp_ab, 4, !bk && showAb(), bk ? 0 : iconAb(a), tint);
        apply(a, R.id.ipp_queue, 5, visible(a, 5), R.mipmap.ipp_queue, tint);
        // Set, the speed drops its dial and IS the number: "0.75" inside it is unreadable at 30px.
        boolean spOn = !Audio.rateOff();
        boolean tmOn = !Audio.timerOff();
        label(a, R.id.ipp_speed, 6, bk, spOn ? 0 : R.mipmap.ipp_speed_off,
                tint, spOn ? Audio.rateLabel() : null, Audio.RATE_WIDEST);
        label(a, R.id.ipp_timer, 7, bk, tmOn ? R.mipmap.ipp_timer_on : R.mipmap.ipp_timer_off,
                tint, tmOn ? Audio.timerLabel() : null, null);
        if (!bk && abState(a) != 0) {
            startAnim(a);
        } else {
            stopAnim();
        }
    }

    /** For the sleep timer. */
    public static void repaintLast() {
        Object a = (lastAct == null ? null : lastAct.get());
        if (a instanceof BasePlayerActivity) render((BasePlayerActivity) a);
    }

    public static void enter(BasePlayerActivity a) {
        if (a.ippLyricOpen()) return;
        if (!active) {
            active = true;
            focus = firstVisible(a);
            render(a);
            return;
        }
        int i = focus;
        if (i == 8) {
            Audio.addBookmark((android.app.Activity) a);
        } else if (i == 6) {
            Audio.cycleRate();
        } else if (i == 7) {
            Audio.cycleTimer();
        } else if (i == 0) {
            toggleLike();
        } else if (i == 1) {
            toggleShuffle(a);
        } else if (i == 2) {
            cycleRepeat(a);
        } else if (i == 3) {
            a.ippToggleLyric();
            active = false;
        } else if (i == 4) {
            a.ippToggleAB();
        } else if (i == 5) {
            openQueue(a);
            active = false;
        }
        render(a);
    }

    /** The row is deactivated and repainted first, or the highlight stays burned on. */
    public static void openQueue(BasePlayerActivity a) {
        if (a == null) return;
        active = false;
        focus = 0;
        render(a);
        android.app.Activity act = (android.app.Activity) a;
        act.startActivity(new android.content.Intent(act, com.innioasis.y1.activity.IppQueueActivity.class));
    }

    public static boolean side(BasePlayerActivity a, int dir) {
        if (!active) return false;
        int[] o = order(a);
        int i = posOf(a, focus);
        if (i < 0) {
            // Left active on the other player: take the first button.
            focus = firstVisible(a);
            render(a);
            return true;
        }
        do {
            i += dir;
            if (i < 0 || i >= o.length) return true;
        } while (!visible(a, o[i]));
        focus = o[i];
        render(a);
        return true;
    }

    public static boolean wheel(BasePlayerActivity a, int key) {
        if (Lrc.wheel(a, key)) return true;
        if (!active) return false;
        if (key == KeyMap.INSTANCE.getKEY_DOWN()) {
            side(a, 1);
            return true;
        }
        if (key != KeyMap.INSTANCE.getKEY_UP()) return false;
        side(a, -1);
        return true;
    }

    public static boolean back(BasePlayerActivity a) {
        if (abState(a) == 1) {
            a.ippCancelAB();
            render(a);
            return true;
        }
        if (a.ippLyricOpen()) {
            a.ippToggleLyric();
            return true;
        }
        if (!active) return false;
        active = false;
        focus = 0;
        render(a);
        return true;
    }

    /** From {@code onPause}; repainted, or the highlight stays until the next track. */
    public static void reset() {
        active = false;
        focus = 0;
        stopAnim();
        animAct = null;
        Object a = (lastAct == null ? null : lastAct.get());
        if (a instanceof BasePlayerActivity) {
            render((BasePlayerActivity) a);
        }
    }
}
