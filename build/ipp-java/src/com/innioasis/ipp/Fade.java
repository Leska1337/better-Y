package com.innioasis.ipp;

import android.media.MediaPlayer;
import android.os.Handler;
import android.os.Looper;

import tv.danmaku.ijk.media.player.IjkMediaPlayer;

/**
 * The very first sound after a reboot comes out at full scale for a few milliseconds — loud, and
 * clipped enough to buzz — before dropping to the volume the player is set to: the output path
 * being opened for the first time since the boot, with a signal already going into it.
 *
 * So the player's own volume (a digital gain before the mix, unrelated to the stream volume the
 * wheel moves) starts at zero and reaches 1.0 over {@link #MS} — whatever the analogue side does in
 * those milliseconds, it does it to silence.
 *
 * ONCE PER PROCESS, deliberately: the defect is the first playback after a boot, and a ramp on
 * every track would be a fade-in nobody asked for.
 *
 * The player is passed IN rather than asked of the service: {@code IjkMediaPlayer.setVolume} is a
 * native call, and a native call on a player that has not been prepared is a crash no {@code try}
 * can catch — so every call site sits directly in front of that player's own {@code start()}.
 */
public final class Fade {

    private Fade() {}

    private static final int MS = 300;    // ramp length: covers the pop, too short to read as a fade
    private static final int STEP = 20;   // how often the volume is written

    private static boolean done;
    private static Ramp running;

    public static void soften(MediaPlayer p) {
        if (p != null) begin(p, null);
    }

    public static void soften(IjkMediaPlayer p) {
        if (p != null) begin(null, p);
    }

    private static void begin(MediaPlayer p2, IjkMediaPlayer ijk) {
        try {
            if (done) return;
            done = true;
            set(p2, ijk, 0f);
            if (running != null) running.cancelled = true;
            running = new Ramp(p2, ijk);
            new Handler(Looper.getMainLooper()).postDelayed(running, STEP);
        } catch (Throwable t) {
            // a player that cannot be softened must not be left silent
            set(p2, ijk, 1f);
        }
    }

    private static void set(MediaPlayer p2, IjkMediaPlayer ijk, float v) {
        try {
            if (p2 != null) p2.setVolume(v, v);
        } catch (Throwable t) {
            // ignore
        }
        try {
            if (ijk != null) ijk.setVolume(v, v);
        } catch (Throwable t) {
            // ignore
        }
    }

    /** Named, never anonymous: d8 crashes dexing anonymous classes here. */
    private static final class Ramp implements Runnable {
        private final MediaPlayer p2;
        private final IjkMediaPlayer ijk;
        private final long t0 = System.currentTimeMillis();
        boolean cancelled;

        Ramp(MediaPlayer p2, IjkMediaPlayer ijk) { this.p2 = p2; this.ijk = ijk; }

        public void run() {
            if (cancelled) return;
            long d = System.currentTimeMillis() - t0;
            if (d >= MS) {
                set(p2, ijk, 1f);
                if (running == this) running = null;   // the player is not held past the ramp
                return;
            }
            float v = (float) d / (float) MS;
            set(p2, ijk, v * v);   // squared: a linear number is not a linear loudness
            new Handler(Looper.getMainLooper()).postDelayed(this, STEP);
        }
    }
}
