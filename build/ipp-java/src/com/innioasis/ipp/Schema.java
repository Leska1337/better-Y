package com.innioasis.ipp;

import android.database.Cursor;

import androidx.room.RoomDatabase;
import androidx.room.migration.Migration;
import androidx.room.util.TableInfo;
import androidx.sqlite.db.SupportSQLiteDatabase;
import androidx.sqlite.db.SupportSQLiteStatement;

import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.database.SongDao;
import com.innioasis.y1.database.Y1Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * The tag columns of the Song table beyond the stock ones, and the database version that has them.
 * Room is not run over these: the stock {@code Y1Database_Impl} and {@code SongDao_Impl} call here
 * to create, validate, bind and read them. A column added here needs all four, a new migration, a
 * new version and a new identity hash in both its places in the Impl smali — a mismatch is a crash
 * on the first open of the database, not a quiet loss.
 */
public final class Schema {

    private Schema() { }

    /** Stock binds 1..17; ours follow in this order, matching {@code SongDao_Impl$1.createQuery}. */
    private static final int FIRST = 18;

    static final class M67 extends Migration {
        M67() { super(6, 7); }

        @Override
        public void migrate(SupportSQLiteDatabase db) {
            db.execSQL("ALTER TABLE `Song` ADD COLUMN `albumArtist` TEXT");
            db.execSQL("ALTER TABLE `Song` ADD COLUMN `track` TEXT");
            db.execSQL("ALTER TABLE `Song` ADD COLUMN `disc` TEXT");
            db.execSQL("ALTER TABLE `Song` ADD COLUMN `year` TEXT");
            db.execSQL("ALTER TABLE `Song` ADD COLUMN `lyrics` INTEGER NOT NULL DEFAULT 0");
        }
    }

    /** Appended to the stock migration chain in {@code Y1Repository}. */
    public static RoomDatabase.Builder migrations(RoomDatabase.Builder b) {
        return b.addMigrations(new Migration[] { new M67() });
    }

    /** What {@code onValidateSchema} expects of the Song table besides the stock columns. */
    public static void columns(HashMap cols) {
        cols.put("albumArtist", new TableInfo.Column("albumArtist", "TEXT", false, 0, null, 1));
        cols.put("track", new TableInfo.Column("track", "TEXT", false, 0, null, 1));
        cols.put("disc", new TableInfo.Column("disc", "TEXT", false, 0, null, 1));
        cols.put("year", new TableInfo.Column("year", "TEXT", false, 0, null, 1));
        cols.put("lyrics", new TableInfo.Column("lyrics", "INTEGER", true, 0, null, 1));
    }

    public static void bind(SupportSQLiteStatement st, Song s) {
        text(st, FIRST, s.getAlbumArtist());
        text(st, FIRST + 1, s.getTrack());
        text(st, FIRST + 2, s.getDisc());
        text(st, FIRST + 3, s.getYear());
        st.bindLong(FIRST + 4, s.getLyrics());
    }

    private static void text(SupportSQLiteStatement st, int i, String v) {
        if (v == null) st.bindNull(i);
        else st.bindString(i, v);
    }

    /**
     * A file's tags into its row. {@code ""} is "read, no such tag"; null stays "never read", so a
     * reader can tell an untagged song from one whose file nobody has opened. The year is the first
     * four digits of YEAR, else of the full date.
     */
    public static void fill(Song s, Meta.Info i) {
        s.setAlbumArtist(seen(i.albumArtist));
        s.setTrack(seen(i.track));
        s.setDisc(seen(i.disc));
        String y = YearCache.digits4(i.year);
        if (y == null) y = YearCache.digits4(i.date);
        s.setYear(seen(y));
    }

    private static String seen(String v) {
        return v == null ? "" : v.trim();
    }

    /** Never read: every tag column null. */
    static boolean unread(Song s) {
        return s.getAlbumArtist() == null && s.getTrack() == null && s.getDisc() == null
                && s.getYear() == null;
    }

    private static final int BATCH = 100;

    /**
     * Rows scanned before the columns existed, filled from the tag table without opening a file.
     * Off the main thread, at the end of a scan or with none running; ends in
     * {@code Ipp.libraryChanged} when it wrote.
     */
    static void backfill() {
        Y1Repository repo = Y1Application.Companion.getY1Repository();
        if (repo == null) return;
        SongDao dao = repo.ippSongDao();
        int n = fillList(dao, Albums.allSongs()) + fillList(dao, repo.getSongsSync(1));
        if (n > 0) {
            Diag.note("schema: " + n + " row(s) filled from the tag table");
            Ipp.libraryChanged();
        }
    }

    private static int fillList(SongDao dao, List songs) {
        if (songs == null) return 0;
        ArrayList out = new ArrayList();
        int n = 0;
        for (int k = 0; k < songs.size(); k++) {
            Song s = (Song) songs.get(k);
            if (!unread(s)) continue;
            Meta.Info i = MetaCache.get(s.getPath());
            if (i == null) continue;
            fill(s, i);
            out.add(s);
            if (out.size() >= BATCH) n += flush(dao, out);
        }
        return n + flush(dao, out);
    }

    private static int flush(SongDao dao, ArrayList out) {
        int n = out.size();
        if (n == 0) return 0;
        dao.insert((Song[]) out.toArray(new Song[n]));
        out.clear();
        return n;
    }

    private static List indexed;
    private static HashMap byPath;
    private static final ArrayList staged = new ArrayList();

    /**
     * The library's row of a path, out of the song list in memory. Reads the list only when none
     * was ever loaded; while one is being re-read the previous index answers, its rows unchanged.
     */
    static synchronized Song row(String path) {
        if (path == null) return null;
        List l = Albums.loaded();
        if (l == null && byPath == null) l = Albums.allSongs();
        if (l != null && l != indexed) {
            HashMap m = new HashMap(l.size() * 2);
            for (int k = 0; k < l.size(); k++) {
                Song s = (Song) l.get(k);
                if (s.getPath() != null) m.put(s.getPath(), s);
            }
            byPath = m;
            indexed = l;
        }
        return byPath == null ? null : (Song) byPath.get(path);
    }

    /** A file just read, into its row in memory; {@link #write} stores what was staged. */
    static void stage(String path, Meta.Info i) {
        if (i == null || !i.ok) return;
        Song s = row(path);
        if (s == null) return;
        fill(s, i);
        synchronized (staged) {
            staged.add(s);
        }
    }

    private static int gen;

    static synchronized int gen() {
        return gen;
    }

    /** One batch for everything staged, then {@code Ipp.libraryChanged}. Not the UI thread for a big pass. */
    static void write() {
        Song[] rows;
        synchronized (staged) {
            if (staged.isEmpty()) return;
            rows = (Song[]) staged.toArray(new Song[staged.size()]);
            staged.clear();
        }
        synchronized (Schema.class) {
            gen++;
        }
        try {
            Y1Repository repo = Y1Application.Companion.getY1Repository();
            if (repo == null) return;
            repo.ippSongDao().insert(rows);
            Ipp.libraryChanged();
        } catch (Throwable t) {
            Diag.note("schema: " + rows.length + " row(s) not written: " + t);
        }
    }

    /** Per row, beside the stock read; a query that did not select a column leaves it unset. */
    public static void read(Cursor c, Song s) {
        int i = c.getColumnIndex("albumArtist");
        if (i >= 0) s.setAlbumArtist(c.getString(i));
        i = c.getColumnIndex("track");
        if (i >= 0) s.setTrack(c.getString(i));
        i = c.getColumnIndex("disc");
        if (i >= 0) s.setDisc(c.getString(i));
        i = c.getColumnIndex("year");
        if (i >= 0) s.setYear(c.getString(i));
        i = c.getColumnIndex("lyrics");
        if (i >= 0) s.setLyrics(c.getInt(i));
    }
}
