package com.innioasis.ipp;

import android.media.MediaPlayer;
import android.os.Handler;
import android.os.Looper;

import tv.danmaku.ijk.media.player.IjkMediaPlayer;

/**
 * The very first sound the device makes after a reboot comes out at full scale for a few
 * milliseconds — loud, and clipped enough to buzz — and then drops to the volume the player is
 * actually set to.
 *
 * It is not the app's doing: nothing in it writes a stream volume except the wheel in the player,
 * the slider in Settings, the radio and mute, and {@code MediaPlayer.setVolume} is not called
 * anywhere at all. What it looks like is the output path being opened for the first time since the
 * boot — the amplifier settling while a signal is already going into it.
 *
 * The one thing this side of it can do is not hand it a signal to pop on: the player's own volume
 * (a digital gain applied before the mix, nothing to do with the stream volume the wheel moves)
 * starts at zero and reaches 1.0 over {@link #MS}. Whatever the analogue side is doing in those
 * milliseconds, it is doing it to silence.
 *
 * ONCE PER PROCESS, and that is deliberate: the defect is the first playback after a boot, and a
 * ramp on every track would be a fade-in nobody asked for. The launcher is restarted by a reboot
 * and by very little else, so "the first track this process plays" is the same event.
 *
 * The player is passed IN rather than asked of the service, because the two are not
 * interchangeable here: {@code IjkMediaPlayer.setVolume} is a native call, and a native call on a
 * player that has not been prepared is a crash no {@code try} can catch. Every call site is
 * directly in front of that player's own {@code start()}.
 *
 * Raw (non-generic) types throughout: the bundled d8 crashes on generic Signature attrs.
 */
public final class Fade {

    private Fade() {}

    /** How long the ramp takes. Long enough to cover the pop, short enough not to read as a fade. */
    private static final int MS = 300;

    /** One step, i.e. how often the volume is written. */
    private static final int STEP = 20;

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
