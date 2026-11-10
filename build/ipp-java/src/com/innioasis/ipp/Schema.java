package com.innioasis.ipp;

import android.content.Context;
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

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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

    /**
     * songId becomes the path itself instead of its base64, which cost a second, longer copy of
     * every path in the heap. The references are decoded back to the path they were made of, so a
     * playlist entry, a bookmark or a progress keeps its song even when the song is no longer in
     * the table. An id that does not decode to a path is left as it is.
     */
    static final class M78 extends Migration {
        M78() { super(7, 8); }

        @Override
        public void migrate(SupportSQLiteDatabase db) {
            db.execSQL("UPDATE OR IGNORE `Song` SET `songId` = `path` WHERE `songId` <> `path`");
            refs(db, "SongCatPlaylist");
            refs(db, "Progress");
            refs(db, "Bookmark");
        }

        private static void refs(SupportSQLiteDatabase db, String table) {
            ArrayList old = new ArrayList();
            Cursor c = db.query("SELECT DISTINCT `songId` FROM `" + table + "` WHERE substr(`songId`, 1, 1) <> '/'");
            try {
                while (c.moveToNext()) old.add(c.getString(0));
            } finally {
                c.close();
            }
            for (int i = 0; i < old.size(); i++) {
                String id = (String) old.get(i), path = pathOf(id);
                // Progress is keyed by songId: two old spellings of one path keep one row.
                if (path != null) db.execSQL("UPDATE OR REPLACE `" + table + "` SET `songId` = ? WHERE `songId` = ?",
                        new Object[] { path, id });
            }
        }
    }

    /** The path an old base64 songId was made of, as {@code fileToSong} stores it; null if it is not one. */
    static String pathOf(String id) {
        try {
            String p = new String(android.util.Base64.decode(id, android.util.Base64.DEFAULT), "UTF-8");
            return p.startsWith("/") ? com.innioasis.music.objects.Constant.INSTANCE.normalizeAudioBookPath(p) : null;
        } catch (Throwable t) {
            return null;
        }
    }

    /** Appended to the stock migration chain in {@code Y1Repository}. */
    public static RoomDatabase.Builder migrations(RoomDatabase.Builder b) {
        return b.addMigrations(new Migration[] { new M67(), new M78() });
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

    /** The row's tags as a reader's answer, for a reader that adds to them ({@code Meta.fixSong}). */
    static Meta.Info info(Song s) {
        Meta.Info i = new Meta.Info();
        i.albumArtist = s.getAlbumArtist();
        i.track = s.getTrack();
        i.disc = s.getDisc();
        i.year = s.getYear();
        i.ok = true;
        return i;
    }

    /** The tag columns' text in UTF-8: what "Clear cache" shows as the metadata's weight. */
    static long tagBytes() {
        return tagBytes(Albums.allSongs());
    }

    /** Over a list already in hand; null counts nothing. */
    static long tagBytes(List l) {
        long n = 0;
        try {
            if (l == null) return 0;
            for (int k = 0; k < l.size(); k++) {
                Song s = (Song) l.get(k);
                n += utf8(s.getAlbumArtist()) + utf8(s.getTrack()) + utf8(s.getDisc())
                        + utf8(s.getYear());
            }
        } catch (Throwable t) {
        }
        return n;
    }

    /** Counted, not encoded: getBytes per field was ~1.3 s and 100 000 arrays on 25 000 songs. */
    private static int utf8(String v) {
        if (v == null) return 0;
        int n = 0;
        for (int i = 0; i < v.length(); i++) {
            char c = v.charAt(i);
            if (c < 0x80) n += 1;
            else if (c < 0x800) n += 2;
            else if (Character.isHighSurrogate(c)) { n += 4; i++; }
            else n += 3;
        }
        return n;
    }

    /**
     * "Clear cache": every row back to "never read", so the next "Cache library" or the screens
     * read the files again. One UPDATE: rewriting the rows one by one took ~50 s on 25 000 songs.
     * No {@code Ipp.libraryChanged}, as in {@link #write}: the list in memory is cleared in place,
     * and a re-read of a big library under the picker held two copies of it in the heap.
     */
    static void clearTags() {
        synchronized (Schema.class) {
            written.clear();
        }
        List mem = Albums.loaded();
        if (mem != null) {
            for (int k = 0; k < mem.size(); k++) {
                Song s = (Song) mem.get(k);
                if (s == null) continue;
                s.setAlbumArtist(null);
                s.setTrack(null);
                s.setDisc(null);
                s.setYear(null);
            }
        }
        synchronized (Schema.class) {
            gen++;                          // the album artists are grouped again
        }
        try {
            RoomDatabase db = PlGrid.db();
            SupportSQLiteStatement st = db.getOpenHelper().getWritableDatabase().compileStatement(SQL_CLEAR);
            st.executeUpdateDelete();
        } catch (Throwable t) {
        }
    }

    private static final String SQL_CLEAR = "UPDATE `Song` SET `albumArtist` = NULL, `track` = NULL,"
            + " `disc` = NULL, `year` = NULL WHERE `albumArtist` IS NOT NULL OR `track` IS NOT NULL"
            + " OR `disc` IS NOT NULL OR `year` IS NOT NULL";

    /** The files the tags were kept in before the columns; nothing reads them. */
    private static void dropFiles() {
        try {
            Context c = Y1Application.Companion.getAppContext();
            File dir = c == null ? null : c.getCacheDir();
            if (dir == null) return;
            String[] names = { "ipp_tracks.txt", "ipp_discs.txt", "ipp_years.txt",
                    "ipp_albumartist.txt" };
            for (int k = 0; k < names.length; k++) new File(dir, names[k]).delete();
        } catch (Throwable t) {
        }
    }

    /** Never read: every tag column null. */
    static boolean unread(Song s) {
        return s.getAlbumArtist() == null && s.getTrack() == null && s.getDisc() == null
                && s.getYear() == null;
    }

    private static final int BATCH = 100;

    /**
     * Rows scanned before the columns existed, filled from the old tag table without opening a
     * file; then the old files go. Off the main thread, at the end of a scan or with none running;
     * ends in {@code Ipp.libraryChanged} when it wrote. Once the table is gone this costs one pass.
     */
    static void backfill() {
        Y1Repository repo = Y1Application.Companion.getY1Repository();
        if (repo == null) return;
        SongDao dao = repo.ippSongDao();
        int n = fillList(dao, Albums.allSongs()) + fillList(dao, repo.getSongsSync(1));
        MetaCache.drop();
        dropFiles();
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
    /** path -> row written this run, until a list read after the write carries it by itself. */
    private static final HashMap written = new HashMap();

    /**
     * The library's row of a path, out of the song list in memory. Reads the list only when none
     * was ever loaded; while one is being re-read the previous index answers, its rows unchanged.
     * A list read before a write is brought up to it here, or its rows would read NULL again.
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
            carry();
        }
        return byPath == null ? null : (Song) byPath.get(path);
    }

    private static void carry() {
        Iterator it = written.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry e = (Map.Entry) it.next();
            Song now = (Song) byPath.get(e.getKey());
            Song w = (Song) e.getValue();
            if (now == null || now == w || !unread(now)) {
                if (now != w) it.remove();
                continue;
            }
            copy(w, now);
        }
    }

    private static void copy(Song from, Song to) {
        to.setAlbumArtist(from.getAlbumArtist());
        to.setTrack(from.getTrack());
        to.setDisc(from.getDisc());
        to.setYear(from.getYear());
        to.setLyrics(from.getLyrics());
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
        synchronized (Schema.class) {
            gen++;                          // the row in memory changed: AlbumTags answers anew
        }
    }

    private static int gen;

    static synchronized int gen() {
        return gen;
    }

    /**
     * One batch for everything staged. No {@code Ipp.libraryChanged}: the rows written are the
     * list's own objects, already filled in place, and a reset per album row re-read the whole
     * library on every thread at once. Not the UI thread for a big pass.
     */
    static void write() {
        Song[] rows;
        synchronized (staged) {
            if (staged.isEmpty()) return;
            rows = (Song[]) staged.toArray(new Song[staged.size()]);
            staged.clear();
        }
        synchronized (Schema.class) {
            gen++;
            for (int k = 0; k < rows.length; k++) {
                String p = rows[k].getPath();
                written.put(p, rows[k]);
                Song now = byPath == null ? null : (Song) byPath.get(p);
                if (now != null && now != rows[k] && unread(now)) copy(rows[k], now);
            }
        }
        try {
            update(rows);
        } catch (Throwable t) {
            Diag.note("schema: " + rows.length + " row(s) not written: " + t);
        }
    }

    // Only our columns, by the key. An INSERT OR REPLACE of the whole row deletes and re-inserts it
    // with every column and index, ~1.2 ms a row (30 s of a pass over 25 000 songs). This way the
    // row keeps its rowid, and a row deleted meanwhile is not brought back.
    private static final String SQL_TAGS = "UPDATE `Song` SET `albumArtist` = ?, `track` = ?,"
            + " `disc` = ?, `year` = ?, `lyrics` = ? WHERE `songId` = ?";

    private static void update(Song[] rows) throws Exception {
        RoomDatabase db = PlGrid.db();
        db.beginTransaction();
        try {
            SupportSQLiteStatement st = db.getOpenHelper().getWritableDatabase().compileStatement(SQL_TAGS);
            for (int k = 0; k < rows.length; k++) {
                Song s = rows[k];
                String id = s.getSongId();
                if (id == null) continue;
                text(st, 1, s.getAlbumArtist());
                text(st, 2, s.getTrack());
                text(st, 3, s.getDisc());
                text(st, 4, s.getYear());
                st.bindLong(5, s.getLyrics());
                st.bindString(6, id);
                st.executeUpdateDelete();
            }
            db.setTransactionSuccessful();
        } finally {
            db.endTransaction();
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
