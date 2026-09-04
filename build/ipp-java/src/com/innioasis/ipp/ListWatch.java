package com.innioasis.ipp;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.widget.BaseAdapter;

import com.innioasis.y1.Y1Application;

/**
 * The {@code MY_PLAY_SONG} receiver — the one place that learns "the playing track has changed"
 * and hands that fact to everyone who draws it.
 *
 * <p>Registration is lazy and idempotent: {@link #tick(BaseAdapter)} is called from the
 * {@code getView} of every song adapter, so the receiver comes up the first time any list is drawn
 * and no stock file has to be edited to register it. It is never unregistered — it lives on the
 * application context and holds nothing.
 */
public final class ListWatch extends BroadcastReceiver {

    static boolean registered;

    public static void tick(BaseAdapter a) {
        if (a == null) {
            return;
        }
        // ipp: register the list so a track change can repaint EVERY live one, not only the
        // topmost. A list screen stacked on another (every folder of Folders is its own
        // FilesActivity) is not destroyed when it is covered, and nothing rebinds its rows when it
        // comes back — see Lists.
        Lists.note(a);

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
        // ipp: repaint every live song list, not just the one on top — the screen underneath keeps
        // its rows exactly as they were drawn and would show the playing marker on the old track
        // when the user comes back to it. See Lists.
        Lists.refresh();

        // ipp #362.1: same broadcast, second job — move the list cursor onto the track that just
        // started, when the user switched it by hand. Follow keeps its own reference to the list
        // and must consume the "manual" flag either way.
        Follow.onSongChanged();

        // ipp #230.2: third job — start reading the new track's Now-Playing cover in the
        // background. BigCover.prefetch only fires from setMusicPlaylist (a song opened from a
        // menu); switching tracks with the side buttons never goes through it, so opening the
        // player afterwards found nothing cached and the cover popped in late. Cheap: a memory
        // check, then at most one thread.
        BigCover.prefetchPlaying();
    }
}
