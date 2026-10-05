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
 * The audiobook side of Now Playing: speed and sleep timer as player-row buttons (stock's
 * preferences, read live by {@code PlayerService}; the timer is stock's {@code Y1Application.timer2},
 * built as {@code SetupActivity} built it), bookmarks, the book's title, and which player
 * "now playing" opens.
 */
public final class Audio {

    /** SetupActivity's cycle, plus 1.25. */
    private static final float[] RATES = { 0.75f, 1.0f, 1.25f, 1.5f, 2.0f };

    /** Minutes; 0 = off. SetupActivity's set and order. */
    private static final int[] MINUTES = { 0, 10, 20, 30, 60 };

    private static final long MS_PER_MIN = 60000L;

    /** A glyph, so nothing needs translating. */
    private static final String OFF = "—";

    private static PlayerService svc() {
        return Y1Application.Companion.getPlayerService();
    }

    public static boolean playingBook() {
        PlayerService ps = svc();
        return ps != null && ps.getPlaying() == PlayerService.Playing.Audiobook;
    }

    public static float rate() {
        return SharedPreferencesUtils.INSTANCE.getAudiobookPlayRate();
    }

    public static String rateLabel() {
        float r = rate();
        if (r == RATES[0]) return "0.75";
        if (r == RATES[2]) return "1.25";
        if (r == RATES[3]) return "1.5";
        if (r == RATES[4]) return "2.0";
        return "1.0";
    }

    /** The type size is fitted to this, so the number keeps one size through the cycle. */
    public static final String RATE_WIDEST = "0.75";

    /** At 1.0 the button shows its "off" artwork. */
    public static boolean rateOff() {
        return rate() == RATES[1];
    }

    /** Also applied to the running track: the preference alone waits for the next one. */
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
                // A player caught mid-reset throws; the rate is stored either way.
            }
        }
    }

    /** -1 when off (stock's encoding). */
    public static long timerMs() {
        return SharedPreferencesUtils.INSTANCE.getAudiobookPlayTime();
    }

    public static String timerLabel() {
        long ms = timerMs();
        if (ms <= 0L) return OFF;
        return String.valueOf(ms / MS_PER_MIN);
    }

    public static boolean timerOff() {
        return timerMs() <= 0L;
    }

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
     * Stock's behaviour: publishes the time left (TempUtil restarts the timer from it after a
     * theme switch), pauses the book at the end, forgets the setting.
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
            }
            SharedPreferencesUtils.INSTANCE.setAudiobookPlayTime(-1L);
            Y1Application.timer2 = null;
            Deck.repaintLast();
        }
    }

    /**
     * {@link Ipp#songTitle} under a switch of its own: a chapter's tag is routinely worse than its
     * file name. {@code unNamed} on both paths — a book from the file browser carries
     * {@code Constant.UNKNOWN} in every field.
     */
    public static String title(Context c, String tagTitle, String fileName) {
        try {
            if (Prefs.on(c, "book_meta_title")
                    && tagTitle != null && tagTitle.trim().length() > 0) {
                return Other.INSTANCE.unNamed(tagTitle);
            }
        } catch (Throwable t) {
        }
        String n = (fileName == null) ? "" : fileName;
        return Other.INSTANCE.unNamed(SharedPreferencesUtils.INSTANCE.processFileExtensions(n));
    }

    /**
     * Holding the top button in the audiobook player: 0 = bookmark (stock), 1 = the queue. The
     * button at the head of the row carries the other one.
     */
    public static int bookTopHold() {
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) return 0;
        return Prefs.val(c, "book_top_hold");
    }

    private static Song markSong;
    private static long markPos = -1L;
    private static long markDur;

    /**
     * From {@code AudioPlayerActivity.longPressMenu}, before the confirm dialog: the book plays on
     * under it, and the bookmark belongs to the moment it was asked for, not to "Yes".
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

    public static void commitBookmark() {
        Song s = markSong;
        long pos = markPos;
        long dur = markDur;
        markSong = null;
        markPos = -1L;
        write(null, s, pos, dur);
    }

    /** The button: no dialog in between, so "now" is the moment meant. */
    public static void addBookmark(Activity a) {
        try {
            PlayerService ps = svc();
            if (ps == null) return;
            write(a, ps.getPlayingAudiobook(), ps.getCurrentPosition(), ps.getDuration());
        } catch (Throwable t) {
        }
    }

    /** By path first, as stock does: a song from the file browser carries no library id. */
    private static void write(Activity a, Song s, long pos, long dur) {
        try {
            if (s == null || pos < 0) return;
            Y1Repository repo = Y1Application.Companion.getY1Repository();
            Song row = repo.getSongByPathSync(s.getPath());
            String id = (row == null || row.getSongId() == null) ? s.getSongId() : row.getSongId();
            if (id == null) return;
            // The real constructor: every object parameter is null-checked, so all are supplied.
            repo.insertBookmark(new Bookmark(id, pos, dur, new Date().getTime(), UUID.randomUUID()));
            Context c = (a != null) ? a : Y1Application.Companion.getAppContext();
            if (c != null) {
                Toast.makeText(c, c.getString(R.string.collection_succeeded), Toast.LENGTH_SHORT).show();
            }
        } catch (Throwable t) {
        }
    }

    /**
     * Opens the player of an audiobook or the radio; false for music, which the caller handles.
     * FM skips stock's headset check: the radio already playing means a headset is in.
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
        }
        return false;
    }
}
