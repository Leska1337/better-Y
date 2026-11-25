package com.innioasis.ipp;

import android.os.SystemClock;
import android.view.Choreographer;

/**
 * The longest frame of an animation, written to the app's log only when one stuttered:
 * {@code slow: frames <what> worst N ms, F frames in T ms, <parts>}. {@link #part} names a step
 * that ran on the main thread meanwhile. With {@link Diag#MEASURE} every gap follows, a slow one
 * with {@code /N}, the main thread's own CPU time in it. Main thread only, one
 * animation at a time.
 */
public final class Frames {

    private Frames() { }

    /** Three frames at 60 fps: one dropped frame is not worth a line. */
    private static final long SLOW_MS = 50L;

    /** Longer than any of the animations measured: the frame callback must not run forever. */
    private static final long GIVE_UP_MS = 3000L;

    private static String what;
    private static long startAt;
    private static long lastNanos;
    private static long lastCpu;
    private static long worst;
    private static int count;
    private static StringBuilder parts;
    /** Every frame's gap, in order (measurement). */
    private static StringBuilder gaps;
    private static Tick tick;
    private static boolean always;

    public static void start(String w) {
        start(w, false);
    }

    /** {@code always}: the line is written for every run, {@code frames …} when none stuttered. */
    public static void start(String w, boolean always) {
        try {
            Frames.always = always;
            if (tick == null) tick = new Tick();
            else Choreographer.getInstance().removeFrameCallback(tick);
            what = w;
            startAt = SystemClock.uptimeMillis();
            lastNanos = 0;
            worst = 0;
            count = 0;
            parts = new StringBuilder();
            gaps = new StringBuilder();
            Choreographer.getInstance().postFrameCallback(tick);
        } catch (Throwable t) {
        }
    }

    public static void part(String name, long since) {
        if (what != null) parts.append(", ").append(name).append(' ').append(SystemClock.uptimeMillis() - since);
    }

    public static void stop() {
        try {
            if (what == null) return;
            Choreographer.getInstance().removeFrameCallback(tick);
            if (worst >= SLOW_MS || always) {
                long ms = SystemClock.uptimeMillis() - startAt;
                String line = (worst >= SLOW_MS ? "slow: frames " : "frames ") + what + " worst " + worst
                        + " ms, " + count + " frames in " + ms + " ms, mean "
                        + (count > 0 ? ms / count : 0) + " ms" + parts
                        + (Diag.MEASURE ? "; gaps" + gaps : "");
                Diag.note(line);
                if (Diag.MEASURE) android.util.Log.i("ippflow", line);
            }
            what = null;
        } catch (Throwable t) {
        }
    }

    static final class Tick implements Choreographer.FrameCallback {
        public void doFrame(long nanos) {
            if (what == null) return;
            if (SystemClock.uptimeMillis() - startAt > GIVE_UP_MS) {
                stop();                      // the animation never reported its end
                return;
            }
            if (lastNanos != 0) {
                long gap = (nanos - lastNanos) / 1000000L;
                if (gap > worst) worst = gap;
                if (Diag.MEASURE) {
                    gaps.append(' ').append(gap);
                    // a slow frame: how much of it the main thread spent running, the rest it waited
                    if (gap >= SLOW_MS) gaps.append('/').append(SystemClock.currentThreadTimeMillis() - lastCpu);
                }
            }
            lastNanos = nanos;
            if (Diag.MEASURE) lastCpu = SystemClock.currentThreadTimeMillis();
            count++;
            Choreographer.getInstance().postFrameCallback(this);
        }
    }
}
