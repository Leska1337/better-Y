package com.innioasis.ipp;

import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Process;

import java.io.FileInputStream;

/**
 * Reads the NEXT track of the queue while the current one plays, so its file is in the system's
 * page cache when it starts. A cold mp3 stutters on start: the platform decoder scans the whole
 * file for its seek table while playing it, and the card cannot serve both reads in time.
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

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Pick PICK = new Pick();

    private static Handler worker;
    /** The last file read to the end; one cut short is read again. */
    private static volatile String done;

    /** Bumped on every track change; a read that sees another number stops. */
    static volatile int turn;

    /** From {@code ListWatch}, on the main thread. Fast skipping keeps pushing this back. */
    public static void onSongChanged() {
        turn++;
        MAIN.removeCallbacks(PICK);
        MAIN.postDelayed(PICK, WAIT_MS);
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
}
