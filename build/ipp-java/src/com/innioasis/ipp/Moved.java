package com.innioasis.ipp;

import android.content.SharedPreferences;
import android.database.Cursor;
import android.os.Handler;
import android.os.Looper;

import androidx.room.RoomDatabase;
import androidx.sqlite.db.SupportSQLiteDatabase;

import com.innioasis.music.objects.Constant;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.service.PlayerService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * A file the scan sees vanish from one path and appear at another keeps what pointed at it:
 * playlists, bookmarks, a book's progress, the date added, the like, the album's pinned thumbnail
 * and the play queue. Matched by file name, file date and title/artist/album; failing that, by date
 * and tags alone. A match that is not one-to-one is no match — a wrong one hands a song's links to
 * another song, a missed one only loses them as the plain clean-up would.
 */
final class Moved {

    /** Columns read after {@code rowid, path} while the scan added rows. */
    static final String COLS = ", songId, name, fileDate, songName, artist, album, date, isAudiobook, lowerName, pinyinName";

    private static final Object TWICE = new Object();

    private final HashMap strict = new HashMap();   // key -> Row, or TWICE
    private final HashMap loose = new HashMap();
    private final ArrayList gone = new ArrayList();

    static final class Row {
        String id, path, name, lower, pinyin, tags;
        long date;
        boolean titled;
        int claims;
    }

    private static Row row(Cursor c, String path) {
        Row r = new Row();
        r.path = path;
        r.id = c.getString(2);
        r.name = c.getString(3);
        r.date = c.getLong(8);
        r.lower = c.getString(10);
        r.pinyin = c.getString(11);
        r.tags = c.getLong(4) + "\u0000" + c.getString(5) + "\u0000" + c.getString(6) + "\u0000" + c.getString(7)
                + "\u0000" + c.getInt(9);
        // a title-less file says too little to be recognised without its name
        String t = c.getString(5);
        r.titled = t != null && t.length() > 0 && !Constant.UNKNOWN.equals(t);
        return r;
    }

    /** A row this scan inserted. */
    void fresh(Cursor c, String path) {
        Row r = row(c, path);
        put(strict, r.name + "\u0000" + r.tags, r);
        if (r.titled) put(loose, r.tags, r);
    }

    private static void put(HashMap m, String key, Row r) {
        m.put(key, m.containsKey(key) ? TWICE : r);
    }

    /** A row about to be dropped: its file is gone. Matched in {@link #relink}, once all are read. */
    void old(Cursor c, String path) {
        gone.add(row(c, path));
    }

    /**
     * Before the rows are deleted; answers how many moved files keep their links, 0 when the
     * database could not be rewritten. Whatever fails here, the clean-up goes on.
     */
    int relink(RoomDatabase db) {
        if (strict.isEmpty() || gone.isEmpty()) return 0;
        ArrayList claimed = new ArrayList();
        for (int i = 0; i < gone.size(); i++) {
            Row r = (Row) gone.get(i);
            Object to = strict.get(r.name + "\u0000" + r.tags);
            if (to == null && r.titled) to = loose.get(r.tags);
            if (!(to instanceof Row)) continue;
            ((Row) to).claims++;
            claimed.add(new Object[] { r, to });
        }
        HashMap moves = new HashMap();      // old path -> new Row
        ArrayList pairs = new ArrayList();
        for (int i = 0; i < claimed.size(); i++) {
            Object[] p = (Object[]) claimed.get(i);
            Row to = (Row) p[1];
            if (to.claims != 1) continue;
            pairs.add(p);
            moves.put(((Row) p[0]).path, to);
        }
        if (pairs.isEmpty()) return 0;
        boolean kept = false;
        try {
            tables(db, pairs);
            kept = true;
        } catch (Throwable t) {
            Diag.note("library scan: moved files not relinked in the database: " + t);
        }
        try {
            prefs(moves);
        } catch (Throwable t) {
        }
        new Handler(Looper.getMainLooper()).post(new Requeue(moves));
        Diag.note("library scan: " + pairs.size() + " moved file(s) keep their links");
        return kept ? pairs.size() : 0;
    }

    private static void tables(RoomDatabase db, List pairs) {
        db.beginTransaction();
        try {
            SupportSQLiteDatabase w = db.getOpenHelper().getWritableDatabase();
            w.execSQL("create temp table if not exists ipp_moved (old text primary key, new text not null, date integer not null)");
            w.execSQL("delete from ipp_moved");
            for (int i = 0; i < pairs.size(); i++) {
                Object[] p = (Object[]) pairs.get(i);
                Row from = (Row) p[0];
                Row to = (Row) p[1];
                w.execSQL("insert or replace into ipp_moved (old, new, date) values (?, ?, ?)",
                        new Object[] { from.id, to.id, Long.valueOf(from.date) });
            }
            w.execSQL("create index if not exists ipp_moved_new on ipp_moved (new)");
            String in = " where songId in (select old from ipp_moved)";
            String to = " set songId = (select new from ipp_moved where old = songId)";
            w.execSQL("update SongCatPlaylist" + to + in);
            w.execSQL("update Bookmark" + to + in);
            w.execSQL("update or replace Progress" + to + in);
            w.execSQL("update Song set date = (select date from ipp_moved where new = songId)"
                    + " where songId in (select new from ipp_moved)");
            w.execSQL("drop table ipp_moved");
            db.setTransactionSuccessful();
        } finally {
            db.endTransaction();
        }
    }

    /** The like and the pinned album thumbnail are keyed by the path. */
    private static void prefs(HashMap moves) {
        SharedPreferences p = Prefs.file();
        if (p == null) return;
        SharedPreferences.Editor e = p.edit();
        boolean any = false;
        Iterator it = moves.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry m = (Map.Entry) it.next();
            String from = Likes.key((String) m.getKey());
            if (!p.contains(from)) continue;
            e.putBoolean(Likes.key(((Row) m.getValue()).path), p.getBoolean(from, false));
            e.remove(from);
            any = true;
        }
        Iterator all = p.getAll().entrySet().iterator();
        while (all.hasNext()) {
            Map.Entry m = (Map.Entry) all.next();
            String k = (String) m.getKey();
            if (!k.startsWith(Art.PICK) || !(m.getValue() instanceof String)) continue;
            Row to = (Row) moves.get(m.getValue());
            if (to == null) continue;
            // the key carries the album's folder, which has moved with it
            String album = k.substring(Art.PICK.length());
            if (Albums.isEnc(album)) {
                Song s = new Song();
                s.setPath(to.path);
                s.setAlbum(Albums.realName(album));
                e.remove(k);
                k = Art.PICK + Albums.keyOf(s);
            }
            e.putString(k, to.path);
            any = true;
        }
        if (any) e.commit();
    }

    /** The play queue holds the songs themselves: they are given the new path where they are. */
    static final class Requeue implements Runnable {
        private final HashMap moves;

        Requeue(HashMap moves) { this.moves = moves; }

        public void run() {
            try {
                PlayerService ps = Y1Application.Companion.getPlayerService();
                if (ps != null) {
                    fix(ps.getMusicList());
                    fix(ps.getAudiobookList());
                }
                fix(Queue.manualSongs());
            } catch (Throwable t) {
            }
        }

        private void fix(List songs) {
            if (songs == null) return;
            for (int i = 0; i < songs.size(); i++) {
                Object o = songs.get(i);
                if (!(o instanceof Song)) continue;
                Song s = (Song) o;
                Row to = (Row) moves.get(s.getPath());
                if (to == null) continue;
                s.setPath(to.path);
                s.setSongId(to.id);
                s.setName(to.name);
                if (to.lower != null) s.setLowerName(to.lower);
                if (to.pinyin != null) s.setPinyinName(to.pinyin);
            }
        }
    }
}
