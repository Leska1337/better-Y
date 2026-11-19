package com.innioasis.ipp;

import android.os.Handler;
import android.os.HandlerThread;

import com.innioasis.y1.service.PlayerService;

import tv.danmaku.ijk.media.player.IjkMediaPlayer;

/**
 * The ffmpeg player between two tracks. Its reset tears the whole native player down and waits
 * for every thread of the track that played, 100–220 ms of the main thread on every change. So
 * stock's own initPlayer builds a new one instead (injected in toRestart, in place of reset),
 * and the old one is released here, on a thread of its own.
 */
public final class Ijk {

    private Ijk() { }

    /** ijkplayer's player options. */
    private static final int OPT_PLAYER = 4;

    private static Handler worker;

    /**
     * After initPlayer has put a new player in: the old one goes quiet at once — its queued events
     * would reach the service's listeners — and is released in the background, one at a time.
     */
    public static void swapped(PlayerService ps, IjkMediaPlayer old) {
        try {
            // an embedded cover is a video stream to ffmpeg: decoded on every track for nothing
            ps.getPlayer().setOption(OPT_PLAYER, "vn", 1L);
        } catch (Throwable t) {
        }
        if (old == null) return;
        try {
            old.resetListeners();
        } catch (Throwable t) {
        }
        if (worker == null) {
            HandlerThread t = new HandlerThread("ipp-ijk");
            t.start();
            worker = new Handler(t.getLooper());
        }
        worker.post(new Release(old));
    }

    static final class Release implements Runnable {
        private final IjkMediaPlayer p;

        Release(IjkMediaPlayer p) { this.p = p; }

        public void run() {
            try {
                p.release();
            } catch (Throwable t) {
            }
        }
    }
}
