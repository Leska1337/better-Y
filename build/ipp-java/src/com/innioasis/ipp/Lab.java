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

    /** Every screen ever built, weakly; 5 s after a theme change, which of them survive a collection. */
    private static final java.util.WeakHashMap screensEver = new java.util.WeakHashMap();
    private static int screenNo;

    static void screen(android.app.Activity a) {
        screensEver.put(a, Integer.valueOf(++screenNo));
        stacks();
        allocs();
    }

    // ---- recent allocations ----------------------------------------------------------------

    private static boolean allocating;

    /** Once per process, only while /data/local/tmp/ippalloc exists: the DDM allocation tracker. */
    private static void allocs() {
        if (allocating) return;
        allocating = true;
        try {
            if (!new File("/data/local/tmp/ippalloc").exists()) return;
        } catch (Throwable t) {
            return;
        }
        Thread t = new Thread(new Allocs(), "ipp-allocs");
        t.setDaemon(true);
        t.start();
    }

    /**
     * Every second a 150 ms window of allocations, summed by the allocated class and the first frame
     * outside the platform; the 15 heaviest every 20 s. The ring holds the last 512 records of a
     * window, so the sums are shares, not bytes.
     */
    static final class Allocs implements Runnable {
        private final java.util.HashMap bytes = new java.util.HashMap();
        private long total;

        public void run() {
            try {
                Class vm = Class.forName("org.apache.harmony.dalvik.ddmc.DdmVmInternal");
                java.lang.reflect.Method on = vm.getMethod("enableRecentAllocations", new Class[] {boolean.class});
                java.lang.reflect.Method get = vm.getMethod("getRecentAllocations", new Class[0]);
                long lastDump = SystemClock.uptimeMillis();
                while (true) {
                    // a fresh ring per 150 ms window, off while parsing: the parse would fill it
                    on.invoke(null, new Object[] {Boolean.TRUE});
                    Thread.sleep(150);
                    byte[] d = (byte[]) get.invoke(null, new Object[0]);
                    on.invoke(null, new Object[] {Boolean.FALSE});
                    parse(d);
                    Thread.sleep(850);
                    long now = SystemClock.uptimeMillis();
                    if (now - lastDump >= 20000) {
                        Log.i("ipplab", "allocs " + (total >> 10) + " KB: " + Stacks.sorted(bytes, 15));
                        bytes.clear();
                        total = 0;
                        lastDump = now;
                    }
                }
            } catch (Throwable t) {
                Log.i("ipplab", "allocs failed: " + t);
            }
        }

        private void parse(byte[] d) {
            java.nio.ByteBuffer b = java.nio.ByteBuffer.wrap(d);
            int headLen = b.get(0) & 0xff, entryLen = b.get(1) & 0xff, frameLen = b.get(2) & 0xff;
            int n = b.getShort(3) & 0xffff, strings = b.getInt(5);
            int nClass = b.getShort(9) & 0xffff, nMethod = b.getShort(11) & 0xffff;
            b.position(strings);
            String[] cls = names(b, nClass), meth = names(b, nMethod);
            b.position(headLen);
            for (int i = 0; i < n; i++) {
                int at = b.position();
                int size = b.getInt();
                b.getShort();
                int type = b.getShort() & 0xffff;
                int depth = b.get() & 0xff;
                b.position(at + entryLen);
                String where = "?", top = null;
                for (int f = 0; f < depth; f++) {
                    int fa = b.position();
                    int c = b.getShort() & 0xffff, m = b.getShort() & 0xffff;
                    b.position(fa + frameLen);
                    String name = cls[c] + "." + meth[m];
                    if (top == null) top = name;
                    if ("?".equals(where) && !platform(cls[c])) where = name;
                }
                String k = cls[type] + " @ " + where.replace("com.innioasis.", "")
                        + ("?".equals(where) ? " top " + top : "");
                int[] v = (int[]) bytes.get(k);
                if (v == null) bytes.put(k, new int[] {size});
                else v[0] += size;
                total += size;
            }
        }

        private static boolean platform(String c) {
            return c.startsWith("java.") || c.startsWith("android.") || c.startsWith("dalvik.")
                    || c.startsWith("libcore.") || c.startsWith("com.android.") || c.startsWith("androidx.")
                    || c.startsWith("kotlin");
        }

        private static String[] names(java.nio.ByteBuffer b, int n) {
            String[] out = new String[n];
            for (int i = 0; i < n; i++) {
                int len = b.getInt();
                char[] ch = new char[len];
                for (int j = 0; j < len; j++) ch[j] = b.getChar();
                out[i] = ch.length > 0 && ch[0] == 'L' ? new String(ch, 1, len - 2).replace('/', '.') : new String(ch);
            }
            return out;
        }
    }

    // ---- stacks of the main and binder threads ----------------------------------------------

    private static boolean stacking;

    /** Once per process, only while /data/local/tmp/ippstack exists: samples stacks into "ipplab". */
    private static void stacks() {
        if (stacking) return;
        stacking = true;
        try {
            if (!new File("/data/local/tmp/ippstack").exists()) return;
        } catch (Throwable t) {
            return;
        }
        Thread t = new Thread(new Stacks(), "ipp-stacks");
        t.setDaemon(true);
        t.start();
    }

    /**
     * Every 15 ms: what each Binder_N executes (the onTransact above Binder.execTransact) and whether
     * the main thread is away from nativePollOnce. A main-thread streak of 250 ms or more is logged
     * with its frames and the binder calls that ran during it; binder totals every 30 s.
     */
    static final class Stacks implements Runnable {
        private final java.util.HashMap binder = new java.util.HashMap();
        private final java.util.HashMap streakMain = new java.util.HashMap();
        private final java.util.HashMap streakBinder = new java.util.HashMap();
        private Thread[] binders = new Thread[0];
        private long busySince, lastEnum, lastDump, samples;

        public void run() {
            Thread main = Looper.getMainLooper().getThread();
            lastDump = SystemClock.uptimeMillis();
            while (true) {
                try {
                    Thread.sleep(15);
                } catch (InterruptedException e) {
                    return;
                }
                long now = SystemClock.uptimeMillis();
                if (now - lastEnum > 2000) {
                    binders = binderThreads();
                    lastEnum = now;
                }
                samples++;
                for (int i = 0; i < binders.length; i++) {
                    String k = transact(binders[i].getStackTrace());
                    if (k == null) continue;
                    count(binder, k);
                    if (busySince != 0) count(streakBinder, k);
                }
                StackTraceElement[] ms = main.getStackTrace();
                boolean idle = ms.length == 0
                        || "nativePollOnce".equals(ms[0].getMethodName());
                if (!idle) {
                    if (busySince == 0) {
                        busySince = now;
                        streakMain.clear();
                        streakBinder.clear();
                    }
                    count(streakMain, top(ms, 0, 6));
                } else if (busySince != 0) {
                    long len = now - busySince;
                    busySince = 0;
                    if (len >= 250) {
                        Log.i("ipplab", "stall " + len + " ms main: " + sorted(streakMain, 4)
                                + " || binder: " + sorted(streakBinder, 4));
                    }
                }
                if (now - lastDump > 30000) {
                    Log.i("ipplab", "binder in " + (now - lastDump) / 1000 + " s, " + samples
                            + " samples: " + sorted(binder, 8));
                    binder.clear();
                    samples = 0;
                    lastDump = now;
                }
            }
        }

        private static Thread[] binderThreads() {
            ThreadGroup g = Thread.currentThread().getThreadGroup();
            while (g.getParent() != null) g = g.getParent();
            Thread[] all = new Thread[g.activeCount() + 16];
            int n = g.enumerate(all, true);
            java.util.ArrayList out = new java.util.ArrayList();
            for (int i = 0; i < n; i++) {
                if (all[i] != null && all[i].getName().startsWith("Binder")) out.add(all[i]);
            }
            return (Thread[]) out.toArray(new Thread[out.size()]);
        }

        /** The incoming call's onTransact and the top frames, or null for an idle binder thread. */
        private static String transact(StackTraceElement[] st) {
            for (int i = 0; i < st.length; i++) {
                if ("execTransact".equals(st[i].getMethodName())) {
                    String on = i > 0 ? st[i - 1].getClassName() : "?";
                    return on + " { " + top(st, 0, Math.min(i - 1, 4)) + " }";
                }
            }
            return null;
        }

        private static String top(StackTraceElement[] st, int from, int n) {
            StringBuilder b = new StringBuilder();
            for (int i = from; i < st.length && i < from + n; i++) {
                if (b.length() > 0) b.append(" < ");
                b.append(st[i].getClassName().replace("com.innioasis.", "")).append('.')
                        .append(st[i].getMethodName()).append(':').append(st[i].getLineNumber());
            }
            return b.toString();
        }

        private static void count(java.util.HashMap m, String k) {
            int[] c = (int[]) m.get(k);
            if (c == null) m.put(k, new int[] {1});
            else c[0]++;
        }

        private static String sorted(java.util.HashMap m, int n) {
            java.util.ArrayList l = new java.util.ArrayList(m.entrySet());
            java.util.Collections.sort(l, new ByCount());
            StringBuilder b = new StringBuilder();
            for (int i = 0; i < l.size() && i < n; i++) {
                java.util.Map.Entry e = (java.util.Map.Entry) l.get(i);
                b.append(" [").append(((int[]) e.getValue())[0]).append("x] ").append(e.getKey());
            }
            return b.toString();
        }
    }

    static final class ByCount implements java.util.Comparator {
        public int compare(Object a, Object b) {
            return ((int[]) ((java.util.Map.Entry) b).getValue())[0]
                    - ((int[]) ((java.util.Map.Entry) a).getValue())[0];
        }
    }

    static void screensLater() {
        new Handler(Looper.getMainLooper()).postDelayed(new Survivors(), 5000);
    }

    private static final class Survivors implements Runnable {
        public void run() {
            System.gc();
            System.runFinalization();
            System.gc();
            Object[] all = screensEver.keySet().toArray();
            StringBuilder b = new StringBuilder("screens alive ").append(all.length).append(':');
            for (int i = 0; i < all.length; i++) {
                android.app.Activity a = (android.app.Activity) all[i];
                if (a == null) continue;
                b.append(' ').append(a.getClass().getSimpleName()).append('#').append(screensEver.get(a));
                if (a.isDestroyed()) b.append("(destroyed)");
                else if (a.isFinishing()) b.append("(finishing)");
            }
            Log.i("ipplab", b.toString());
        }
    }

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

    /** The queue saved and handed to the player: size, the song at the index, whether its file is seen, who called. */
    static void queue(String what, java.util.List l, int at) {
        try {
            StringBuilder b = new StringBuilder("queue ").append(what).append(": ")
                    .append(l == null ? -1 : l.size()).append(" songs @").append(at);
            if (l != null && at >= 0 && at < l.size()) {
                com.innioasis.y1.database.Song s = (com.innioasis.y1.database.Song) l.get(at);
                b.append(" ").append(s.getPath()).append(" exists ").append(new File(s.getPath()).exists())
                        .append(" id ").append(s.getSongId().equals(s.getPath()) ? "path" : "other");
            }
            b.append(" on ").append(Thread.currentThread().getName()).append(" from");
            StackTraceElement[] st = new Throwable().getStackTrace();
            for (int i = 2; i < st.length && i < 7; i++) b.append(' ').append(st[i].getClassName())
                    .append('.').append(st[i].getMethodName());
            Log.i("ipplab", b.toString());
        } catch (Throwable t) {
            Log.i("ipplab", "queue " + what + " failed " + t);
        }
    }

    private static long restoreAt;

    /** Around the stock restore() at boot: the saved file, the time it took, what the player got. */
    public static void restoring(com.innioasis.y1.service.PlayerService ps) {
        restoreAt = SystemClock.uptimeMillis();
        try {
            File f = new File(ps.getFilesDir(), "save_state");
            Log.i("ipplab", "restore begins: save_state " + f.length() + " bytes, card "
                    + new File("/storage/sdcard0/Music").exists());
        } catch (Throwable t) {
            Log.i("ipplab", "restore begins failed " + t);
        }
    }

    public static void restored(com.innioasis.y1.service.PlayerService ps) {
        try {
            Log.i("ipplab", "restore ends +" + (SystemClock.uptimeMillis() - restoreAt) + " ms, playing "
                    + ps.getPlaying() + ", music " + (ps.getMusicList() == null ? -1 : ps.getMusicList().size())
                    + " @" + ps.getMusicIndex());
        } catch (Throwable t) {
            Log.i("ipplab", "restore ends failed " + t);
        }
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
