package com.innioasis.ipp;

import android.os.CountDownTimer;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Process;
import android.os.SystemClock;

import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.service.PlayerService;

import java.io.FileInputStream;

/**
 * Gets a track's file into the system's page cache before the decoder asks for it. A cold mp3
 * stutters on start: the platform decoder scans the whole file for its seek table while playing
 * it, and the card cannot serve both reads in time. Two reads: the NEXT track of the queue while
 * the current one plays, and the track that is about to start. One already in the cache reads to
 * its end at once, and then the stock restart timer is not waited out.
 */
public final class Ahead {

    private Ahead() { }

    /** After a track change: the starting track's own cold read must be over before ours begins. */
    private static final long WAIT_MS = 4000;

    /** Read in small pieces with a pause between, or our read starves the track that is playing. */
    private static final int CHUNK = 128 * 1024;
    private static final long PAUSE_MS = 20;

    /** Lossless files run to tens of megabytes; no read goes past this. */
    private static final long CAP = 32L * 1024 * 1024;

    private static final int HEAD_CHUNK = 64 * 1024;

    /**
     * The longest a head read runs past {@code restartPlay}. It shares the card with the player
     * opening the file, so every millisecond here can be one the track starts later.
     */
    private static final long HEAD_MS = 350;

    /** For a song picked in a menu, until {@code restartPlay} arrives and sets the real limit. */
    private static final long PICKED_MS = 600;

    /** The stock restart timer; near its end it is left to fire by itself. */
    private static final long TIMER_MS = 200;
    private static final long TIMER_EDGE_MS = 20;

    /** Track changes closer than this are skipping: the stock timer is what keeps that light. */
    private static final long SERIES_MS = 600;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Pick PICK = new Pick();

    private static Handler worker;
    private static Handler headWorker;

    /** The last file read to the end; one cut short is read again, and this one is not read twice. */
    private static volatile String done;

    /** Bumped on every track change; a read that sees another number stops. */
    static volatile int turn;

    /** Bumped on every head read started; an older one stops. */
    static volatile int headTurn;

    /** The file the running head read is on, and when it stops. */
    static volatile String headPath;
    static volatile long headUntil;

    /** The restart timer that is running, for which file, since when. Main thread only. */
    private static CountDownTimer timer;
    private static String timerPath;
    private static long timerAt;
    private static long switchedAt;
    private static boolean series;

    /** From {@code ListWatch}, on the main thread. Fast skipping keeps pushing this back. */
    public static void onSongChanged() {
        turn++;
        MAIN.removeCallbacks(PICK);
        MAIN.postDelayed(PICK, WAIT_MS);
    }

    /** A song picked in a menu, before the player is even opened. */
    public static void picked(String path) {
        head(path, PICKED_MS);
    }

    /** Top of {@code PlayerService.restartPlay}, for the track the service is on. */
    public static void headPlaying() {
        try {
            long now = SystemClock.uptimeMillis();
            series = now - switchedAt < SERIES_MS;
            switchedAt = now;
            timer = null;
            PlayerService ps = Y1Application.Companion.getPlayerService();
            Song s = ps == null ? null : ps.getPlayingSong();
            timerPath = s == null ? null : s.getPath();
            if (s == null) return;
            if (timerPath.equals(done)) MAIN.post(new Early(timerPath));
            else head(timerPath, HEAD_MS);
        } catch (Throwable t) {
        }
    }

    /** {@code PlayerService.restartPlay} has started its timer. */
    public static void armed(CountDownTimer t) {
        timer = t;
        timerAt = SystemClock.uptimeMillis();
    }

    /**
     * A file read to its end is in the cache, so nothing is left to wait for. Calling
     * {@code onFinish} on a timer that has fired would start the track twice, hence the edge.
     */
    static final class Early implements Runnable {
        private final String path;

        Early(String path) {
            this.path = path;
        }

        public void run() {
            try {
                CountDownTimer t = timer;
                if (t == null || series || !path.equals(timerPath)) return;
                if (SystemClock.uptimeMillis() - timerAt >= TIMER_MS - TIMER_EDGE_MS) return;
                timer = null;
                t.cancel();
                t.onFinish();
            } catch (Throwable e) {
            }
        }
    }

    /**
     * A track is about to start: read its file to the end, at once and without pauses, for as
     * long as there is time. A second call for the file being read only moves the limit.
     */
    private static void head(String path, long ms) {
        try {
            if (path == null) return;
            headUntil = SystemClock.uptimeMillis() + ms;
            if (path.equals(headPath)) return;
            headPath = path;
            if (headWorker == null) {
                HandlerThread t = new HandlerThread("ipp-head", Process.THREAD_PRIORITY_BACKGROUND);
                t.start();
                headWorker = new Handler(t.getLooper());
            }
            headWorker.post(new Head(path, ++headTurn));
        } catch (Throwable t) {
        }
    }

    /** On the main thread: {@link Queue} is not thread-safe. */
    static final class Pick implements Runnable {
        public void run() {
            try {
                String path = Queue.nextPath();
                if (path == null || path.equals(done)) return;
                if (worker == null) {
                    HandlerThread t = new HandlerThread("ipp-ahead", Process.THREAD_PRIORITY_BACKGROUND);
                    t.start();
                    worker = new Handler(t.getLooper());
                }
                worker.post(new Read(path, turn));
            } catch (Throwable t) {
            }
        }
    }

    static final class Read implements Runnable {
        private final String path;
        private final int mine;

        Read(String path, int mine) {
            this.path = path;
            this.mine = mine;
        }

        public void run() {
            FileInputStream in = null;
            try {
                in = new FileInputStream(path);
                byte[] buf = new byte[CHUNK];
                long total = 0;
                while (turn == mine && total < CAP) {
                    int n = in.read(buf);
                    if (n < 0) break;
                    total += n;
                    Thread.sleep(PAUSE_MS);
                }
                if (turn == mine) done = path;
            } catch (Throwable t) {
            } finally {
                try { if (in != null) in.close(); } catch (Throwable t) { }
            }
        }
    }

    /**
     * Stops at {@link #headUntil}; and, should the player get the track sooner, at the prepared
     * flag coming back up after going down.
     */
    static final class Head implements Runnable {
        private final String path;
        private final int mine;

        Head(String path, int mine) {
            this.path = path;
            this.mine = mine;
        }

        public void run() {
            FileInputStream in = null;
            try {
                PlayerService ps = Y1Application.Companion.getPlayerService();
                if (ps == null) return;
                boolean down = false;
                in = new FileInputStream(path);
                byte[] buf = new byte[HEAD_CHUNK];
                long total = 0;
                while (headTurn == mine && total < CAP && SystemClock.uptimeMillis() < headUntil) {
                    boolean prepared = ps.getPlayerIsPrepared();
                    if (!prepared) down = true;
                    else if (down) break;
                    int n = in.read(buf);
                    if (n < 0) {
                        MAIN.post(new Early(path));
                        break;
                    }
                    total += n;
                }
            } catch (Throwable t) {
            } finally {
                if (headTurn == mine) headPath = null;
                try { if (in != null) in.close(); } catch (Throwable t) { }
            }
        }
    }
}
