package com.innioasis.ipp;

import android.database.Cursor;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.view.Choreographer;

import java.io.File;

/** Temporary: phase timings of Albums and Folders and trial reads of the song table, to logcat "ipplab". */
public final class Lab {

    private static long start;
    private static long last;
    private static String what;

    private static void begin(String w) {
        what = w;
        start = last = SystemClock.uptimeMillis();
    }

    private static void lap(String step) {
        long now = SystemClock.uptimeMillis();
        Log.i("ipplab", what + " " + step + " +" + (now - last) + " ms (" + (now - start) + ")");
        last = now;
    }

    public static void a0() { begin("albums"); }
    public static void a1() { lap("names query"); }
    public static void a2() { lap("listForView"); }
    public static void a3() { lap("years"); }
    public static void a4() { lap("to main + setAlbums"); frame(); }

    public static void f0() { begin("folders"); }
    public static void f1() { lap("byParentPath query"); }
    public static void f2() { lap("filter + exists"); }
    public static void f3() { lap("listFiles + sort"); }
    public static void f4() { lap("build"); }
    public static void f5() { lap("to main + setItems"); frame(); }

    public static void s(String step) { lap(step); }

    static void b(String w) { begin(w); }

    /** Who called: the thread and the first frames above the caller. */
    private static int whos;

    static void who(String what) {
        if (++whos > 40) return;
        StackTraceElement[] st = new Throwable().getStackTrace();
        StringBuilder b = new StringBuilder(what).append(" on ").append(Thread.currentThread().getName());
        for (int i = 2; i < st.length && i < 9; i++) {
            b.append(" < ").append(st[i].getClassName().replace("com.innioasis.", ""))
                    .append('.').append(st[i].getMethodName()).append(':').append(st[i].getLineNumber());
        }
        Log.i("ipplab", b.toString());
    }

    /** The end of the next frame: the callback runs before its traversal, the post lands after it. */
    private static void frame() {
        try {
            Choreographer.getInstance().postFrameCallback(new Frame());
        } catch (Throwable t) {
        }
    }

    static final class Frame implements Choreographer.FrameCallback, Runnable {
        public void doFrame(long nanos) {
            new Handler(Looper.getMainLooper()).post(this);
        }

        public void run() {
            lap("first frame");
        }
    }

    // ---- trial reads ------------------------------------------------------------------------

    private static boolean ran;

    /** Once per process, on the library thread, only while /data/local/tmp/ipplab exists. */
    static void reads() {
        if (ran) return;
        ran = true;
        try {
            if (!new File("/data/local/tmp/ipplab").exists()) return;
        } catch (Throwable t) {
            return;
        }
        Albums.later(new Reads(), 15000L);
    }

    private static boolean idsRan;

    /** Once per process, only while /data/local/tmp/ippid exists: songId against the path, and the references against the song table. */
    static void ids() {
        if (idsRan) return;
        idsRan = true;
        try {
            if (!new File("/data/local/tmp/ippid").exists()) return;
        } catch (Throwable t) {
            return;
        }
        Albums.later(new Ids(), 5000L);
    }

    static final class Ids implements Runnable {
        public void run() {
            try {
                androidx.room.RoomDatabase db = PlGrid.db();
                com.innioasis.music.util.Other o = com.innioasis.music.util.Other.INSTANCE;
                long t0 = SystemClock.uptimeMillis();
                int n = 0, same = 0, b64 = 0, book = 0, bad = 0, nl = 0, maxId = 0;
                long idChars = 0, pathChars = 0;
                Cursor c = db.query("select songId, path from song", null);
                while (c.moveToNext()) {
                    String id = c.getString(0), path = c.getString(1);
                    n++;
                    idChars += id.length();
                    pathChars += path.length();
                    if (id.length() > maxId) maxId = id.length();
                    if (id.indexOf('\n') >= 0) nl++;
                    if (id.equals(path)) {
                        same++;
                    } else if (id.equals(o.toBase64(path))) {
                        b64++;
                    } else if (path.startsWith("/storage/sdcard0/audiobooks")
                            && id.equals(o.toBase64("/storage/sdcard0/Audiobooks" + path.substring(27)))) {
                        book++;
                    } else {
                        if (bad++ < 5) Log.i("ipplab", "id bad: path " + path + " id decodes to " + decode(id));
                    }
                }
                c.close();
                Log.i("ipplab", "ids song: " + n + " rows, path " + same + ", base64 " + b64 + ", Audiobooks " + book + ", other "
                        + bad + ", with newline " + nl + ", id chars " + idChars + " (max " + maxId
                        + "), path chars " + pathChars + ", " + (SystemClock.uptimeMillis() - t0) + " ms");
                c = db.query("select count(*), count(distinct path), count(distinct lower(path)) from song", null);
                if (c.moveToFirst()) Log.i("ipplab", "ids paths: " + c.getLong(0) + " rows, " + c.getLong(1)
                        + " distinct, " + c.getLong(2) + " distinct ignoring case");
                c.close();
                refs(db, "songCatPlaylist");
                refs(db, "Progress");
                refs(db, "Bookmark");
            } catch (Throwable t) {
                Log.i("ipplab", "ids failed " + t);
            }
        }

        private static void refs(androidx.room.RoomDatabase db, String table) {
            Cursor c = db.query("select count(*) from " + table, null);
            long rows = c.moveToFirst() ? c.getLong(0) : -1;
            c.close();
            c = db.query("select songId from " + table + " where songId not in (select songId from song)", null);
            int orphans = 0, paths = 0, exist = 0;
            while (c.moveToNext()) {
                orphans++;
                String p = decode(c.getString(0));
                if (p != null && p.startsWith("/storage/")) {
                    paths++;
                    if (new File(p).exists()) exist++;
                }
                if (orphans <= 3) Log.i("ipplab", "ids " + table + " orphan decodes to " + p + " (" + c.getString(0) + ")");
            }
            c.close();
            Log.i("ipplab", "ids " + table + ": " + rows + " rows, " + orphans + " not in song, " + paths
                    + " decode to a path, " + exist + " of those exist");
        }

        private static String decode(String id) {
            try {
                return new String(android.util.Base64.decode(id, 0), "UTF-8");
            } catch (Throwable t) {
                return null;
            }
        }
    }

    private static boolean compared;

    /** Once per process, only while /data/local/tmp/ippread exists: the portions read against stock's. */
    static void compareRead(java.util.List mine) {
        if (compared || mine == null) return;
        compared = true;
        try {
            if (!new File("/data/local/tmp/ippread").exists()) return;
            long t0 = SystemClock.uptimeMillis();
            java.util.List stock = com.innioasis.y1.Y1Application.Companion.getY1Repository().getSongsSync(0);
            long t1 = SystemClock.uptimeMillis();
            int diff = 0, first = -1;
            int n = Math.min(mine.size(), stock.size());
            for (int i = 0; i < n; i++) {
                if (!mine.get(i).equals(stock.get(i))) {
                    diff++;
                    if (first < 0) first = i;
                }
            }
            Log.i("ipplab", "compare read: portions " + mine.size() + ", stock " + stock.size() + " rows in "
                    + (t1 - t0) + " ms, " + diff + " differ (first " + first + ")");
        } catch (Throwable t) {
            Log.i("ipplab", "compare read failed " + t);
        }
    }

    static final class Reads implements Runnable {
        public void run() {
            try {
                mirrors(com.innioasis.y1.database.Y1Repository.SongSortType.FileName_A_To_Z);
                mirrors(com.innioasis.y1.database.Y1Repository.SongSortType.Time_Asc);
                mirrors(com.innioasis.y1.database.Y1Repository.SongSortType.SongName_A_To_Z);
            } catch (Throwable t) {
                Log.i("ipplab", "reads failed " + t);
            }
        }

        /** Both directions by query, each mirrored against the other, position by position. */
        private static void mirrors(com.innioasis.y1.database.Y1Repository.SongSortType asc) {
            com.innioasis.y1.database.Y1Repository.SongSortType desc = Albums.pairOf(asc);
            java.util.List a = Albums.ordered(asc);
            java.util.List b = Albums.ordered(desc);
            if (a == null || b == null) {
                Log.i("ipplab", "mirror check " + asc + ": ordered " + (a != null) + "/" + (b != null));
                return;
            }
            long t0 = SystemClock.uptimeMillis();
            java.util.List mb = Albums.mirror(a, desc);
            long t1 = SystemClock.uptimeMillis();
            java.util.List ma = Albums.mirror(b, asc);
            Log.i("ipplab", "mirror check " + asc + ": " + a.size() + " rows, to desc " + differ(mb, b)
                    + " differ, to asc " + differ(ma, a) + " differ, mirror " + (t1 - t0) + " ms");
        }

        private static String differ(java.util.List x, java.util.List y) {
            int diff = 0, first = -1;
            int n = Math.min(x.size(), y.size());
            for (int i = 0; i < n; i++) {
                if (x.get(i) != y.get(i)) {
                    diff++;
                    if (first < 0) first = i;
                }
            }
            return diff + " (first " + first + ", sizes " + x.size() + "/" + y.size() + ")";
        }

        /** The path order against the full stock query, position by position. */
        private static void check(com.innioasis.y1.database.Y1Repository.SongSortType type) {
            long t0 = SystemClock.uptimeMillis();
            java.util.List a = Albums.ordered(type);
            long t1 = SystemClock.uptimeMillis();
            java.util.List b = Albums.shared(com.innioasis.y1.Y1Application.Companion.getY1Repository().getSongsList(type));
            long t2 = SystemClock.uptimeMillis();
            if (a == null || b == null) {
                Log.i("ipplab", "check " + type + ": ordered " + (a != null) + " full " + (b != null));
                return;
            }
            int diff = 0, first = -1;
            int n = Math.min(a.size(), b.size());
            for (int i = 0; i < n; i++) {
                if (a.get(i) != b.get(i)) {
                    diff++;
                    if (first < 0) first = i;
                }
            }
            Log.i("ipplab", "check " + type + ": " + a.size() + "/" + b.size() + " rows, " + diff
                    + " positions differ (first " + first + "), ordered " + (t1 - t0) + " ms, full " + (t2 - t1) + " ms");
        }

        /** The order alone: one light column. */
        private static void order(String by) throws Exception {
            long t0 = SystemClock.uptimeMillis();
            Cursor c = PlGrid.db().query("select rowid from song where isAudiobook = 0 order by " + by, null);
            int n = 0;
            try {
                while (c.moveToNext()) {
                    c.getLong(0);
                    n++;
                }
            } finally {
                c.close();
            }
            long t1 = SystemClock.uptimeMillis();
            c = PlGrid.db().query("select path from song where isAudiobook = 0 order by " + by, null);
            int m = 0;
            try {
                while (c.moveToNext()) {
                    c.getString(0);
                    m++;
                }
            } finally {
                c.close();
            }
            Log.i("ipplab", "order " + by + ": rowid " + n + " rows " + (t1 - t0) + " ms, path "
                    + m + " rows " + (SystemClock.uptimeMillis() - t1) + " ms");
        }

        /** Every column, in rowid portions: the window never fills, so no query runs twice. */
        private static void chunks(int size) throws Exception {
            long t0 = SystemClock.uptimeMillis();
            long after = -1L;
            int rows = 0, parts = 0;
            while (true) {
                Cursor c = PlGrid.db().query("select rowid, * from song where rowid > " + after
                        + " order by rowid limit " + size, null);
                int k = 0;
                try {
                    int cols = c.getColumnCount();
                    while (c.moveToNext()) {
                        after = c.getLong(0);
                        for (int i = 1; i < cols; i++) {
                            int type = c.getType(i);
                            if (type == Cursor.FIELD_TYPE_STRING) c.getString(i);
                            else if (type == Cursor.FIELD_TYPE_INTEGER) c.getLong(i);
                        }
                        k++;
                    }
                } finally {
                    c.close();
                }
                parts++;
                rows += k;
                if (k < size) break;
            }
            Log.i("ipplab", "chunks of " + size + ": " + rows + " rows in " + parts + " parts, "
                    + (SystemClock.uptimeMillis() - t0) + " ms");
        }
    }
}
