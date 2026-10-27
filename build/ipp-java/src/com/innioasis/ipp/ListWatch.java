package com.innioasis.ipp;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.SystemClock;
import android.widget.BaseAdapter;

import com.innioasis.y1.Y1Application;

/**
 * The {@code MY_PLAY_SONG} receiver: hands "the playing track changed" to everyone who draws it.
 * Registered lazily from every song adapter's {@code getView}, on the application context, and
 * never unregistered.
 */
public final class ListWatch extends BroadcastReceiver {

    static boolean registered;

    public static void tick(BaseAdapter a) {
        if (a == null) {
            return;
        }
        Lists.note(a);
        register();
    }

    static void register() {
        if (registered) {
            return;
        }
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) {
            return;
        }
        registered = true;
        c.registerReceiver(new ListWatch(), new IntentFilter("android.intent.action.MY_PLAY_SONG"));
    }

    @Override
    public void onReceive(Context context, Intent intent) {
        long t0 = SystemClock.uptimeMillis();
        Lists.refresh();
        Follow.onSongChanged();
        // The side buttons never go through setMusicPlaylist, where the other prefetch fires.
        BigCover.prefetchPlaying();
        Ahead.onSongChanged();
        Diag.slow("ListWatch", t0);
    }
}
