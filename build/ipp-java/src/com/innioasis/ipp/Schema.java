package com.innioasis.ipp;

import android.database.Cursor;

import androidx.room.RoomDatabase;
import androidx.room.migration.Migration;
import androidx.room.util.TableInfo;
import androidx.sqlite.db.SupportSQLiteDatabase;
import androidx.sqlite.db.SupportSQLiteStatement;

import com.innioasis.y1.database.Song;

import java.util.HashMap;

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
