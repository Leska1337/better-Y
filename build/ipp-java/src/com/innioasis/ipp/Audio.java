package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.CountDownTimer;
import android.widget.Toast;

import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.activity.AudioPlayerActivity;
import com.innioasis.music.util.Other;
import com.innioasis.y1.database.Bookmark;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.database.Y1Repository;
import com.innioasis.y1.service.PlayerService;
import com.innioasis.y1.utils.SharedPreferencesUtils;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * #384 — the audiobook side of the Now-Playing screen.
 *
 * Two things live here:
 *
 * 1. The playback speed and the sleep timer, which used to be reachable only through
 *    Audiobooks -> Settings ({@code SetupActivity}). They are ordinary preferences that
 *    {@code PlayerService} reads live, so a button on the player row only has to write them —
 *    plus {@code setSpeed} for the track that is already playing, and the countdown itself,
 *    which is stock's own {@code Y1Application.timer2} rebuilt the way SetupActivity built it.
 *    The Settings row is gone, so this is the only place that starts that timer besides
 *    {@code TempUtil.startAudiobookShutdown} (which restores it after a theme switch).
 *
 * 2. Which player screen "what is playing now" means (#384.2). Stock's own Now-Playing menu
 *    entry already dispatches on {@code PlayerService.getPlaying()}; the double-press of the
 *    bottom button did not, and always opened the music player.
 *
 * Java source of the ipp Audio helper; compiled to smali by build/ipp-java.ps1.
 */
public final class Audio {

    /** The rates SetupActivity offered, in the order it cycled them, plus 1.25. */
    private static final float[] RATES = { 0.75f, 1.0f, 1.25f, 1.5f, 2.0f };

    /** Sleep-timer steps in minutes; 0 = off. Same set (and order) as SetupActivity. */
    private static final int[] MINUTES = { 0, 10, 20, 30, 60 };

    private static final long MS_PER_MIN = 60000L;

    /** Off is drawn as a dash — a glyph rather than a word, so no string needs translating. */
    private static final String OFF = "—";

    private static PlayerService svc() {
        return Y1Application.Companion.getPlayerService();
    }

    /** True while the player service is on an audiobook (not music, FM or nothing). */
    public static boolean playingBook() {
        PlayerService ps = svc();
        return ps != null && ps.getPlaying() == PlayerService.Playing.Audiobook;
    }

    // ---- speed -------------------------------------------------------------------------------

    public static float rate() {
        return SharedPreferencesUtils.INSTANCE.getAudiobookPlayRate();
    }

    /**
     * The rate, written out. The speed button drops its artwork once it is set to anything but
     * 1.0 and shows the number alone across the whole button, so there is room for the digits
     * that were dropped while it had to fit inside the speedometer.
     */
    public static String rateLabel() {
        float r = rate();
        if (r == RATES[0]) return "0.75";
        if (r == RATES[2]) return "1.25";
        if (r == RATES[3]) return "1.5";
        if (r == RATES[4]) return "2.0";
        return "1.0";
    }

    /**
     * The widest label the cycle can produce. The type size is chosen from THIS rather than from
     * the value on screen, so the number keeps one size as the user clicks through the cycle
     * instead of growing and shrinking under the cursor.
     */
    public static final String RATE_WIDEST = "0.75";

    /** True while the speed is at its default (1.0), i.e. the button shows its "off" artwork. */
    public static boolean rateOff() {
        return rate() == RATES[1];
    }

    /**
     * Next rate in the cycle. Applied to the running player straight away, exactly as the
     * Settings screen did — the preference alone would only take effect on the next track.
     */
    public static void cycleRate() {
        float cur = rate();
        int i = 1;
        for (int k = 0; k < RATES.length; k++) {
            if (RATES[k] == cur) {
                i = k;
                break;
            }
        }
        float next = RATES[(i + 1) % RATES.length];
        SharedPreferencesUtils.INSTANCE.setAudiobookPlayRate(next);
        PlayerService ps = svc();
        if (ps != null && playingBook()) {
            try {
                ps.setSpeed(next);
            } catch (Throwable t) {
                // a player caught mid-reset answers with an error; the rate is stored either way
            }
        }
    }

    // ---- sleep timer -------------------------------------------------------------------------

    /** Milliseconds the timer was set to, or -1 when it is off (stock's own encoding). */
    public static long timerMs() {
        return SharedPreferencesUtils.INSTANCE.getAudiobookPlayTime();
    }

    /** Label for the window in ipp_timer_on: whole minutes, or the dash while it is off. */
    public static String timerLabel() {
        long ms = timerMs();
        if (ms <= 0L) return OFF;
        return String.valueOf(ms / MS_PER_MIN);
    }

    /** True while the timer is off, i.e. the button shows its "off" artwork. */
    public static boolean timerOff() {
        return timerMs() <= 0L;
    }

    /** Next step in the cycle: off -> 10 -> 20 -> 30 -> 60 -> off. */
    public static void cycleTimer() {
        long ms = timerMs();
        int cur = ms <= 0L ? 0 : (int) (ms / MS_PER_MIN);
        int i = 0;
        for (int k = 0; k < MINUTES.length; k++) {
            if (MINUTES[k] == cur) {
                i = k;
                break;
            }
        }
        int next = MINUTES[(i + 1) % MINUTES.length];
        stopTimer();
        if (next == 0) {
            SharedPreferencesUtils.INSTANCE.setAudiobookPlayTime(-1L);
            return;
        }
        long d = next * MS_PER_MIN;
        SharedPreferencesUtils.INSTANCE.setAudiobookPlayTime(d);
        Sleep t = new Sleep(d);
        Y1Application.timer2 = t;
        t.start();
    }

    private static void stopTimer() {
        CountDownTimer t = Y1Application.timer2;
        if (t != null) t.cancel();
        Y1Application.timer2 = null;
    }

    /**
     * The countdown, a named class because d8 crashes here on anonymous ones. Behaviour is
     * stock's: publish the remaining time (a theme switch kills the process and TempUtil
     * restarts the timer from it), pause the book when it runs out, forget the setting.
     */
    static final class Sleep extends CountDownTimer {
        Sleep(long ms) {
            super(ms, 1000L);
        }

        public void onTick(long left) {
            Y1Application.Companion.setMillisUntilFinished2(left);
        }

        public void onFinish() {
            try {
                PlayerService ps = Y1Application.Companion.getPlayerService();
                if (ps != null && ps.getPlaying() == PlayerService.Playing.Audiobook) {
                    ps.pause(2, false);
                }
            } catch (Throwable t) {
                // pausing a player that is already down is not worth a crash
            }
            SharedPreferencesUtils.INSTANCE.setAudiobookPlayTime(-1L);
            Y1Application.timer2 = null;
            Deck.repaintLast();
        }
    }

    // ---- what a book is called -----------------------------------------------------------------

    /**
     * The title of a book, under its own setting. Same shape as {@link Ipp#songTitle} and a separate
     * preference on purpose: an audiobook's tags are routinely worse than its file names (a chapter
     * is "Track 07" in the tag and "07 — The Lighthouse" on disk), which is the opposite of how
     * music usually goes, so the two cannot share one switch.
     *
     * <p>{@code Other.unNamed} is applied on both paths, because a book taken off the card by the
     * file browser carries {@code Constant.UNKNOWN} in every field it has no tag for.
     */
    public static String title(Context c, String tagTitle, String fileName) {
        try {
            if (Prefs.on(c, "book_meta_title")
                    && tagTitle != null && tagTitle.trim().length() > 0) {
                return Other.INSTANCE.unNamed(tagTitle);
            }
        } catch (Throwable t) {
            // fall through to the file name
        }
        String n = (fileName == null) ? "" : fileName;
        return Other.INSTANCE.unNamed(SharedPreferencesUtils.INSTANCE.processFileExtensions(n));
    }

    // ---- the long top press, and the button that carries what it is not doing ------------------

    /**
     * What holding the top button does in the audiobook player: 0 = add a bookmark (stock's own
     * behaviour, the default), 1 = open the play queue. The button at the head of the row carries
     * the other one, so both are always one press away.
     */
    public static int bookTopHold() {
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) return 0;
        return Prefs.val(c, "book_top_hold");
    }

    /** The moment the confirm dialog was raised — see {@link #armBookmark}. */
    private static Song markSong;
    private static long markPos = -1L;
    private static long markDur;

    /**
     * Note where the book stands right now, because the dialog that follows is answered seconds
     * later and the book keeps playing under it: asked at "Yes" the position was wherever the
     * reader had got to by then, so a bookmark raised at 1:00 and confirmed at 1:05 landed at 1:05.
     * Called from {@code AudioPlayerActivity.longPressMenu}, before the dialog is shown.
     */
    public static void armBookmark() {
        try {
            PlayerService ps = svc();
            if (ps == null) return;
            markSong = ps.getPlayingAudiobook();
            markPos = ps.getCurrentPosition();
            markDur = ps.getDuration();
        } catch (Throwable t) {
            markSong = null;
            markPos = -1L;
        }
    }

    /** The dialog was confirmed: write the bookmark for the moment it was RAISED, not for now. */
    public static void commitBookmark() {
        Song s = markSong;
        long pos = markPos;
        long dur = markDur;
        markSong = null;
        markPos = -1L;
        write(null, s, pos, dur);
    }

    /**
     * Bookmark the position playing right now. As a button this is a single press with no dialog
     * in between, so "now" is the moment the user meant; it says so with the same toast the
     * dialog's own path shows.
     */
    public static void addBookmark(Activity a) {
        try {
            PlayerService ps = svc();
            if (ps == null) return;
            write(a, ps.getPlayingAudiobook(), ps.getCurrentPosition(), ps.getDuration());
        } catch (Throwable t) {
            // a bookmark that could not be written must not take the player down
        }
    }

    /**
     * The row is looked up by path first, exactly as stock's dialog callback does: the song the
     * player holds may have been built by a file browser and carry no library id.
     */
    private static void write(Activity a, Song s, long pos, long dur) {
        try {
            if (s == null || pos < 0) return;
            Y1Repository repo = Y1Application.Companion.getY1Repository();
            Song row = repo.getSongByPathSync(s.getPath());
            String id = (row == null || row.getSongId() == null) ? s.getSongId() : row.getSongId();
            if (id == null) return;
            // The real constructor, not the defaults-synthetic jadx shows: every one of its object
            // parameters opens with a null check, so date and id are supplied here (CLAUDE.md).
            repo.insertBookmark(new Bookmark(id, pos, dur, new Date().getTime(), UUID.randomUUID()));
            Context c = (a != null) ? a : Y1Application.Companion.getAppContext();
            if (c != null) {
                Toast.makeText(c, c.getString(R.string.collection_succeeded), Toast.LENGTH_SHORT).show();
            }
        } catch (Throwable t) {
            // a bookmark that could not be written must not take the player down
        }
    }

    // ---- #384.2: which player screen is "now playing" ----------------------------------------

    /**
     * Open the player of whatever is actually playing, when that is NOT music. Returns false for
     * music (and for anything unplayable), leaving {@code Ipp.openPlayer}'s own path in charge.
     *
     * FM is opened without stock's headset check on purpose: the radio is already playing, so the
     * headset it needs is plugged in by definition, and stopping the source would be wrong here.
     */
    public static boolean openOther(Activity a) {
        try {
            if (a == null || a.isFinishing()) return false;
            PlayerService ps = svc();
            if (ps == null) return false;
            PlayerService.Playing p = ps.getPlaying();
            if (p == PlayerService.Playing.Audiobook) {
                List l = ps.getAudiobookList();
                if (l == null || l.isEmpty()) return false;
                Intent i = new Intent(a, AudioPlayerActivity.class);
                i.putExtra("from_now_playing", true);
                a.startActivity(i);
                return true;
            }
            if (p == PlayerService.Playing.FM) {
                a.startActivity(new Intent(a, com.innioasis.fm.FMMainActivity.class));
                return true;
            }
        } catch (Throwable t) {
            // fall through to the music path
        }
        return false;
    }
}
