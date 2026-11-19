package com.innioasis.ipp;

import android.os.Handler;
import android.os.Looper;

import com.google.gson.Gson;
import com.google.gson.stream.JsonWriter;
import com.innioasis.music.objects.Global;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.database.Y1Repository;
import com.innioasis.y1.service.PlayerService;
import com.innioasis.y1.utils.SharedPreferencesUtils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.util.List;

/**
 * The player state in {@code save_state}, in place of stock's {@code saveState}: the same JSON its
 * {@code restore} reads, streamed to the file. A list longer than {@link #FULL_MAX} keeps only the
 * path of each song but the playing one, and {@link #restored} swaps those stubs for the library's
 * rows. Stock built the whole JSON as one string: a queue of 25 000 songs ran out of memory after
 * 11 s on the main thread, saved nothing, and the watchdog of {@code Force} rebooted on top of it.
 */
public final class Saved {

    private Saved() { }

    /** Up to this many songs a list is written whole, exactly as stock writes it. */
    private static final int FULL_MAX = 2000;

    /**
     * From the top of both players' error listeners. A restore at boot that could not open its
     * file (the card still being checked) left stock's shutdown flag up, and the first track the
     * user then started was taken for the restore: paused at once and moved to the stored second,
     * and with the music still muted by it.
     * Not on -38: stock's pause on an idle player raises it before every first track.
     */
    public static void restoreFailed(int what) {
        try {
            if (what == -38) return;
            if (!SharedPreferencesUtils.INSTANCE.isShutdown()) return;
            SharedPreferencesUtils.INSTANCE.setShutdown(false);
            Global.INSTANCE.setRestoreCompleted(true);
            // the restore muted the music for its silent prepare; the volume comes back with it
            PlayerService ps = Y1Application.Companion.getPlayerService();
            if (ps != null) ps.muteOrNoMuteMusic(false);
        } catch (Throwable t) {
        }
    }

    /** From the top of stock's {@code saveState}; false = not written, stock's own code goes on. */
    public static boolean write(PlayerService ps) {
        Queue.saveSource(ps);
        File tmp = null;
        try {
            File dir = ps.getFilesDir();
            tmp = new File(dir, "save_state.tmp");
            Gson gson = new Gson();
            JsonWriter w = new JsonWriter(new BufferedWriter(
                    new OutputStreamWriter(new FileOutputStream(tmp), "UTF-8"), 1 << 16));
            PlayerService.Playing now = ps.getPlaying();
            int playing = now == PlayerService.Playing.Music ? 0 : now == PlayerService.Playing.Audiobook ? 1 : -1;
            long start = 0L;
            if (ps.getPlayingSong() != null && ps.getPlayerIsPrepared()
                    && ps.getCurrentPosition() <= ps.getDuration()) start = ps.getCurrentPosition();
            int bookmark = (playing == 1 && ps.getBookMarkProgress() != null) ? ps.getBookMarkIndex() : -1;
            w.beginObject();
            w.name("musicList");
            songs(w, gson, ps.getMusicList(), ps.getMusicIndex());
            w.name("musicIndex").value((long) ps.getMusicIndex());
            w.name("audiobookList");
            songs(w, gson, ps.getAudiobookList(), ps.getAudiobookIndex());
            w.name("audiobookIndex").value((long) ps.getAudiobookIndex());
            w.name("startTime").value(start);
            w.name("playing").value((long) playing);
            w.name("bookmarkIndex").value((long) bookmark);
            w.endObject();
            w.close();
            File to = new File(dir, "save_state");
            if (!tmp.renameTo(to)) {
                to.delete();
                if (!tmp.renameTo(to)) return false;
            }
            return true;
        } catch (Throwable t) {
            Diag.note("save_state not written: " + t);
            if (tmp != null) tmp.delete();
            return false;
        }
    }

    private static void songs(JsonWriter w, Gson gson, List l, int at) throws java.io.IOException {
        w.beginArray();
        int n = l == null ? 0 : l.size();
        boolean whole = n <= FULL_MAX;
        for (int i = 0; i < n; i++) {
            Song s = (Song) l.get(i);
            if (whole || i == at) {
                gson.toJson(s, Song.class, w);
            } else {
                w.beginObject();
                w.name("path").value(s.getPath());
                w.endObject();
            }
        }
        w.endArray();
    }

    /** A song read back from a path alone: no id, no name. */
    private static boolean stub(Song s) {
        return s != null && "".equals(s.getSongId()) && s.getPath() != null && s.getPath().length() > 0;
    }

    private static boolean hasStubs(List l) {
        if (l == null) return false;
        for (int i = 0; i < l.size(); i++) if (stub((Song) l.get(i))) return true;
        return false;
    }

    /** After stock's {@code restore} at boot: the stubs are looked up on the library thread. */
    public static void restored(PlayerService ps) {
        try {
            if (ps != null && (hasStubs(ps.getMusicList()) || hasStubs(ps.getAudiobookList()))) {
                Albums.later(new Resolve(ps), 0L);
            }
        } catch (Throwable t) {
        }
    }

    /** Music rows come out of the song list in memory, books (not in it) from the table one by one. */
    static final class Resolve implements Runnable {
        private final PlayerService ps;

        Resolve(PlayerService ps) { this.ps = ps; }

        public void run() {
            try {
                Albums.allSongs();
                Swap music = swap(ps.getMusicList(), false);
                Swap books = swap(ps.getAudiobookList(), true);
                Handler h = new Handler(Looper.getMainLooper());
                if (music != null) h.post(music);
                if (books != null) h.post(books);
            } catch (Throwable t) {
                Diag.note("save_state stubs not resolved: " + t);
            }
        }

        private static Swap swap(List l, boolean book) {
            if (l == null) return null;
            int n = l.size();
            Song[] was = new Song[n];
            Song[] row = new Song[n];
            int found = 0;
            Y1Repository repo = book ? Y1Application.Companion.getY1Repository() : null;
            for (int i = 0; i < n; i++) {
                Song s = (Song) l.get(i);
                if (!stub(s)) continue;
                Song r = book ? repo.getSongByPathSync(s.getPath()) : Schema.row(s.getPath());
                if (r == null) continue;
                was[i] = s;
                row[i] = r;
                found++;
            }
            return found == 0 ? null : new Swap(l, was, row);
        }
    }

    /** On the main thread, where the player reads its list: each stub still in its place gets its row. */
    static final class Swap implements Runnable {
        private final List list;
        private final Song[] was;
        private final Song[] row;

        Swap(List list, Song[] was, Song[] row) {
            this.list = list;
            this.was = was;
            this.row = row;
        }

        public void run() {
            try {
                if (list.size() != was.length) return;
                for (int i = 0; i < was.length; i++) {
                    if (was[i] != null && list.get(i) == was[i]) list.set(i, row[i]);
                }
            } catch (Throwable t) {
            }
        }
    }
}
