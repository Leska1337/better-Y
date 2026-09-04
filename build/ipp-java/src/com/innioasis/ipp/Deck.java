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
 * Now-Playing interactive-button navigation (click-wheel over heart/shuffle/repeat/
 * lyrics/AB/queue) + AB-loop icon state. Wheel = move focus, center/ENTER = activate,
 * back = exit / cancel AB / close lyrics. Visibility of buttons depends on the
 * {@code top_hold} setting. State (shuffle/repeat) lives in SharedPreferencesUtils.
 *
 * On an audiobook the same row is shuffle / repeat / speed / timer instead (#384.1), all four
 * on the audiobook's own preferences — see {@link #book} and {@link Audio}.
 *
 * Java source of the ipp Deck helper; compiled to smali by build/ipp-java.ps1.
 * Public API (called from stock MusicPlayerActivity/BasePlayerActivity and DeckAnim):
 * render, enter, side, wheel, back, reset, animTick, topHold. Keep those public.
 */
public final class Deck {
    // The nine slots, in slot order: heart, shuffle, repeat, lyrics, AB, queue, speed, timer,
    // book-action — the last three are audiobook-only. Slot 8 is one button with two meanings: the
    // one of Bookmark / Queue that the long top press is NOT doing (see Audio.bookTopHold). It sits
    // at the head of the row, where the heart sits on music.

    /**
     * The order the wheel walks, per mode — NOT the slot numbers in order, and it has to match the
     * LinearLayout's own order exactly. Slot 8 (bookmark) is the row's first child and slot 5
     * (queue) its last, so the book row reads bookmark, shuffle, repeat, speed, timer — or, with
     * the setting the other way round, shuffle, repeat, speed, timer, queue. Exactly one of the
     * two is ever on the screen; the queue is last on the music row as well.
     */
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
    /** Last rendered player, so state changes can repaint the row. Weak — never leak an Activity. */
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
        // Likes owns the preference now: adding the song to the Favorites playlist from an
        // ordinary menu writes the same key, so the heart follows that too (#231).
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

    /**
     * #384.1 — the same row, on an audiobook. The screen is the one that decides, not the player
     * service: {@code AudioPlayerActivity} shares this layout with the music player, so without
     * the distinction its buttons went on toggling the MUSIC shuffle, liking the music track and
     * opening the music queue. In book mode the row is shuffle / repeat / speed / timer, and all
     * four read and write the audiobook's own preferences.
     */
    private static boolean book(BasePlayerActivity a) {
        return a instanceof com.innioasis.y1.activity.AudioPlayerActivity;
    }

    private static boolean shuffleOn(BasePlayerActivity a) {
        SharedPreferencesUtils s = SharedPreferencesUtils.INSTANCE;
        return book(a) ? s.getAudiobookIsShuffle() : s.getMusicIsShuffle();
    }

    /**
     * Flipping shuffle also starts (or ends) a shuffled pass — a fresh plan and a counter that
     * restarts at 1, see {@link Queue#onShuffleChanged}. The counter beside the title is repainted
     * here rather than through {@code refreshUI}, which would reload the cover and the lyrics for
     * a two-character change; without it the number would stay wrong until the next track.
     */
    private static void toggleShuffle(BasePlayerActivity a) {
        SharedPreferencesUtils s = SharedPreferencesUtils.INSTANCE;
        // #384: an audiobook goes through the same plan as music now, so both write their own
        // preference and then let Queue start (or end) a shuffled pass on the list that is playing.
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
            // A book resumed from a bookmark shows stock's own "0/n-1" instead of a track number;
            // leave that alone rather than paint a number over it.
            if (book(a) && ps.getBookMarkProgress() != null) return;
            View v = ((android.app.Activity) a).findViewById(R.id.tv_index_of_songs);
            if (v instanceof android.widget.TextView) {
                ((android.widget.TextView) v).setText(Queue.trackNo(ps) + "/" + ml.size());
            }
        } catch (Throwable t) {
            // the number is cosmetic; the next refreshUI paints it anyway
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

    // A/B points live on PlayerService; BasePlayerActivity's own getAPoint/getBPoint
    // are private and just delegate here with a -1 fallback, so read PlayerService
    // directly (public) to keep identical behavior without touching stock code.
    private static int abState(BasePlayerActivity a) {
        PlayerService ps = Y1Application.Companion.getPlayerService();
        long ap = ps != null ? ps.getAPoint() : -1L;
        if (ap < 0) return 0;
        long bp = ps != null ? ps.getBPoint() : -1L;
        return bp < 0 ? 1 : 2;
    }

    // ------------------------------------------------------ the A and B time labels on the bar

    /**
     * Where each A/B point's time is written under the progress bar
     * ({@code ProgressMaskView.onDraw}, one call in place of each label's own x).
     *
     * <p>Stock puts BOTH labels the same way — a little to the left of their own pin — and the A and
     * B points of a loop are routinely a few seconds apart, so the two strings were drawn on top of
     * each other and read as one ("000:26" for 0:04 and 0:26). Only the label moves: the pins mark
     * the real positions and must stay where they are.
     *
     * <p>The B label is the one that gives way, because A is drawn first and is already in place.
     * It keeps stock's position while that is free, steps to the other side of its own pin when it
     * is not, and past A's label altogether when even that overlaps — the last case being two pins
     * within a second of each other.
     *
     * <p><b>Direction is never assumed.</b> The bar is mirrored in Hebrew ({@code isIW}), where A
     * is the RIGHT-hand pin, so a fixed "A left, B right" rule would collide there instead. This
     * reacts to the overlap that actually happened, which is the same answer in both directions.
     */
    private static final float AB_GAP = 5f;

    private static float abLeft, abRight;
    private static boolean abHaveA;

    /** A's label: stock's own place, kept inside the view, and remembered for {@link #abBX}. */
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

    /** B's label: stock's place unless A is already sitting there. */
    public static float abBX(View v, android.graphics.Paint p, String text, float pinX) {
        try {
            float w = p.measureText(text);
            float x = abFit(v, pinX - p.getTextSize() - 2f, w);
            // Consumed, not merely read: a frame that draws B without an A (which the AB loop
            // cannot produce, since A is always set first) must not be pushed by a stale rectangle.
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

    /** True when a label at {@code x} would touch A's, gap included. */
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
        // cast to Activity to disambiguate Activity.findViewById(int) from the
        // generic AppCompatActivity.<T>findViewById(int) overload at compile time.
        View v = ((android.app.Activity) a).findViewById(id);
        if (v instanceof ImageView) return (ImageView) v;
        return null;
    }

    /** The focus wash painted behind the button that has the cursor. */
    private static final int HILITE = 1715273694;

    /**
     * Paints (or clears) that wash. Cheap ONLY because every button already has a background.
     *
     * <p>{@code setBackgroundColor} is not the harmless setter it looks like: with nothing behind
     * the view it goes through {@code View.setBackgroundDrawable}, which compares the old and the
     * new drawable's minimum size and calls {@code requestLayout()} when they differ — and "no old
     * drawable" counts as differing. Nine buttons painted from {@link #render} therefore dirtied
     * the whole player, and the traversal that followed re-measured it end to end: ~20 ms at the
     * first render and on every track change, measured from the requestLayout's own stack. Two
     * ColorDrawables report the same minimum size, so once the buttons carry a transparent one from
     * the layout there is nothing to re-measure — which is why {@code activity_music_player.xml}
     * gives each of them {@code android:background="#00000000"} and why that must not be tidied
     * away. The theme-bitmap version of the same trap is written up in {@code Rows.bg}.
     */
    private static void hl(ImageView iv, boolean on) {
        if (iv == null) return;
        iv.setBackgroundColor(on ? HILITE : 0);
    }

    private static boolean focused(int i) {
        return active && focus == i;
    }

    /**
     * Slots 6/7/8 exist only on an audiobook; 0/3/4 only on music. Slot 5 (queue) belongs to both,
     * and on a book it swaps with slot 8 (bookmark): whichever of the two the long top press is
     * NOT doing is the one on the row.
     */
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

    /** Where the focused slot stands in the walking order, or -1. */
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
                // #228.1: light / dark artwork, or the theme mode painted in the timeline's own
                // colour -- the button row sits right under it, so they read as one element.
                Icons.apply(iv, icon, tint);
            }
            hl(iv, focused(slot));
        }
    }

    /**
     * The two buttons that carry a value, written inside the icon. {@code text == null} means the
     * setting is at its default, and then only the plain "off" artwork is drawn.
     */
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
        // icon 0 = the value IS the button (speed, once it is off its default); otherwise the
        // number goes into the window the artwork leaves blank (timer), or there is none at all.
        if (icon == 0) Icons.value(iv, text, widest, tint);
        else Icons.label(iv, icon, tint, text);
        hl(iv, focused(slot));
    }

    public static void render(BasePlayerActivity a) {
        lastAct = a == null ? null : new WeakReference(a);
        boolean bk = book(a);
        int tint = Icons.timelineColor((android.app.Activity) a);   // once per pass, memoised
        // #384: bookmark at the head of the book row, queue at its end; whichever of the two the
        // long top press is not doing is the one shown, so exactly one is ever on the screen.
        apply(a, R.id.ipp_bookmark, 8, visible(a, 8), R.mipmap.ipp_bookmark, tint);
        // the hidden buttons are passed icon 0: reading a "like" or an A-B point that nothing is
        // going to draw would be work done for a button that is not on the screen.
        apply(a, R.id.ipp_heart, 0, !bk && heartShow(), bk ? 0 : iconHeart(), tint);
        apply(a, R.id.is_shuffle, 1, true, iconShuffle(a), tint);
        apply(a, R.id.repeat_mode, 2, true, iconRepeatOrAb(a), tint);
        apply(a, R.id.ipp_text, 3, !bk && showText(), R.mipmap.ipp_lyrics, tint);
        apply(a, R.id.ipp_ab, 4, !bk && showAb(), bk ? 0 : iconAb(a), tint);
        apply(a, R.id.ipp_queue, 5, visible(a, 5), R.mipmap.ipp_queue, tint);
        // Both follow the SETTING and nothing else. At the default (speed 1.0, timer off) each
        // draws its plain "off" artwork with no number. Set: the timer keeps its ring with the
        // minutes inside it, the speed drops the speedometer altogether and IS the number —
        // "0.75" written inside that dial is unreadable at 30x30 screen px.
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

    /** Repaint whatever player was rendered last, if it is still alive (the sleep timer uses it). */
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

    /**
     * #227.2 — open the play-queue screen (queue button, or top-button hold when top_hold=Queue).
     * Leaves the button row deactivated and repainted first: the deck is reset in onPause anyway,
     * so without repainting here the highlight would stay burned onto the button while the row
     * is no longer active.
     */
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
            // The focus is on a slot this mode does not walk — the row was left active on the other
            // player. Take the first button rather than sit there refusing to move.
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

    /**
     * Called from BasePlayerActivity.onPause. Repaints the button row after clearing the state —
     * otherwise the highlight stays drawn on whichever button had focus while the row is already
     * inactive, and nothing repaints it until the next refreshUI (i.e. the next track change).
     */
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
