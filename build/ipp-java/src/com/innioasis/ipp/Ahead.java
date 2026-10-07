package com.innioasis.ipp;

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
 * the current one plays, and the head of a track that is about to start.
 */
public final class Ahead {

    private Ahead() { }

    /** After a track change: the starting track's own cold read must be over before ours begins. */
    private static final long WAIT_MS = 4000;

    /** Read in small pieces with a pause between, or our read starves the track that is playing. */
    private static final int CHUNK = 128 * 1024;
    private static final long PAUSE_MS = 20;

    /** Lossless files run to tens of megabytes; the start needs the head of the file, not all of it. */
    private static final long CAP = 32L * 1024 * 1024;

    /** What playback needs while the decoder's scan holds the card. */
    private static final long HEAD = 3L * 1024 * 1024;
    private static final int HEAD_CHUNK = 64 * 1024;

    /** A head read that never saw its track start gives up after this. */
    private static final long HEAD_MS = 1500;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Pick PICK = new Pick();

    private static Handler worker;
    private static Handler headWorker;

    /** The last file read to the end; one cut short is read again. */
    private static volatile String done;

    /** Bumped on every track change; a read that sees another number stops. */
    static volatile int turn;

    /** Bumped on every head read asked for; an older one stops. */
    static volatile int headTurn;

    /** From {@code ListWatch}, on the main thread. Fast skipping keeps pushing this back. */
    public static void onSongChanged() {
        turn++;
        MAIN.removeCallbacks(PICK);
        MAIN.postDelayed(PICK, WAIT_MS);
    }

    /**
     * A track is about to start: read the head of its file, at once and without pauses. From the
     * two places that know first — a song picked in a menu and {@code PlayerService.restartPlay}.
     */
    public static void head(String path) {
        try {
            if (path == null) return;
            if (headWorker == null) {
                HandlerThread t = new HandlerThread("ipp-head", Process.THREAD_PRIORITY_DEFAULT);
                t.start();
                headWorker = new Handler(t.getLooper());
            }
            headWorker.post(new Head(path, ++headTurn));
        } catch (Throwable t) {
        }
    }

    /** The same for the track the service is on. */
    public static void headPlaying() {
        try {
            PlayerService ps = Y1Application.Companion.getPlayerService();
            Song s = ps == null ? null : ps.getPlayingSong();
            if (s != null) head(s.getPath());
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
     * Stops the moment the player has the track: from there on our read would only be a third
     * one queueing for the card. "Has it" is the prepared flag coming back up after going down.
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
                long until = SystemClock.uptimeMillis() + HEAD_MS;
                boolean down = false;
                in = new FileInputStream(path);
                byte[] buf = new byte[HEAD_CHUNK];
                long total = 0;
                while (headTurn == mine && total < HEAD && SystemClock.uptimeMillis() < until) {
                    boolean prepared = ps.getPlayerIsPrepared();
                    if (!prepared) down = true;
                    else if (down) break;
                    int n = in.read(buf);
                    if (n < 0) break;
                    total += n;
                }
            } catch (Throwable t) {
            } finally {
                try { if (in != null) in.close(); } catch (Throwable t) { }
            }
        }
    }
}
