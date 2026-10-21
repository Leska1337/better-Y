package com.innioasis.ipp;

import android.os.SystemClock;
import android.util.Log;

import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.database.Y1Repository;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * DEBUG BUILD ONLY: measures the library scan. Every scan re-reads the whole library
 * (the first scan of the process only, {@link #force}, used by Scan), and the scan's end writes better-Y/logs/scan_*.txt plus logcat
 * tag IPPSCAN. Probes are single no-arg calls injected into the stock lambda and fileToSong.
 */
public final class ScanProbe {

    private ScanProbe() { }

    public static volatile boolean force = true;

    private static volatile Thread scanThread;
    private static long t0, tWalk, tFinal, tClean, tPreLoad, tLoaded;
    private static long[] cpu0;
    private static long proc0, io0, cpuThread0;
    private static long uptime0;

    // fileToSong stages: 0 pre, 1 open (MMR new + setDataSource), 2 extract+pinyin, 3 Meta.scanned,
    // 4 Timber "Song ->" line, 5 fixSong + rest. [0] = scan thread, [1] = workers.
    private static final String[] STAGE = {"pre", "open", "extract", "metaScanned", "log", "fixSong", "ownReader"};
    private static final long[][] stage = new long[2][7];
    private static final long[] files = new long[2];
    private static final long[] fileNs = new long[2];

    private static final HashMap extOpen = new HashMap();      // ext -> long[]{count, ns}
    private static final HashMap extOwn = new HashMap();       // ext -> long[]{count, ns, ok}
    private static final int TOP = 12;
    private static final long[] topNs = new long[TOP];
    private static final String[] topPath = new String[TOP];

    private static final ThreadLocal T = new ThreadLocal();   // long[]{last, begin, pyIn, pyLocked}

    private static long pyCount, pyWait, pyBody;
    private static long knownN, knownNs;
    // Scan.song outcomes on the scan thread: 0 ready, 1 waited, 2 first of folder, 3 nobody on it
    private static final String[] HOW = {"ready", "waited", "firstOfFolder", "nobodyOnIt"};
    private static final long[] howN = new long[4];
    private static final long[] howNs = new long[4];
    static int how;
    private static long insN, insNs, insRows, lcN, lcNs, listN, listNs, sleptN;
    private static long insAt, lcAt, listAt;

    private static long[] slot() {
        long[] s = (long[]) T.get();
        if (s == null) {
            s = new long[4];
            T.set(s);
        }
        return s;
    }

    private static int who() {
        return Thread.currentThread() == scanThread ? 0 : 1;
    }

    // ---------------------------------------------------------------- the stock lambda

    // the table as the previous scan left it, path -> fields; compared with this scan's rows
    private static HashMap before;
    private static final String[] FIELD = {"songName", "pinyinSongName", "album", "lowAlbum",
        "pinyinAlbum", "artist", "pinyinArtist", "genre", "pinyinGenre", "albumArtist", "track",
        "disc", "year"};

    private static String[] fields(Song s) {
        return new String[] {s.getSongName(), s.getPinyinSongName(), s.getAlbum(), s.getLowAlbum(),
            s.getPinyinAlbum(), s.getArtist(), s.getPinyinArtist(), s.getGenre(), s.getPinyinGenre(),
            s.getAlbumArtist(), s.getTrack(), s.getDisc(), s.getYear()};
    }

    private static HashMap table() {
        HashMap m = new HashMap();
        try {
            Y1Repository r = Y1Application.Companion.getY1Repository();
            for (int half = 0; half < 2; half++) {
                List l = r.getSongsSync(half);
                if (l == null) continue;
                for (int i = 0; i < l.size(); i++) {
                    Song s = (Song) l.get(i);
                    if (s.getPath() != null) m.put(s.getPath(), fields(s));
                }
            }
        } catch (Throwable t) {
            Log.e("IPPSCAN", "table read failed", t);
        }
        return m;
    }

    private static void compare(StringBuilder b) {
        HashMap after = table();
        int[] diff = new int[FIELD.length];
        int[] shown = new int[FIELD.length];
        HashMap byExt = new HashMap();
        int rows = 0, rowsDiff = 0, missing = 0;
        StringBuilder ex = new StringBuilder();
        Iterator it = before.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry e = (Map.Entry) it.next();
            String path = (String) e.getKey();
            String[] a = (String[]) e.getValue();
            String[] c = (String[]) after.get(path);
            if (c == null) {
                missing++;
                continue;
            }
            rows++;
            boolean any = false;
            for (int f = 0; f < FIELD.length; f++) {
                boolean same = a[f] == null ? c[f] == null : a[f].equals(c[f]);
                if (same) continue;
                any = true;
                diff[f]++;
                if (shown[f]++ < 4) {
                    ex.append("  ").append(FIELD[f]).append(": [").append(a[f]).append("] -> [")
                        .append(c[f]).append("] ").append(path).append('\n');
                }
            }
            if (any) {
                rowsDiff++;
                int dot = path.lastIndexOf('.');
                String ext = dot < 0 ? "?" : path.substring(dot + 1).toLowerCase();
                Integer n = (Integer) byExt.get(ext);
                byExt.put(ext, Integer.valueOf(n == null ? 1 : n.intValue() + 1));
            }
        }
        b.append("\nCOMPARED WITH THE PREVIOUS SCAN'S ROWS (old -> new)\n");
        b.append("  rows ").append(rows).append(", differing ").append(rowsDiff)
            .append(", gone ").append(missing).append(", new ").append(after.size() - rows).append('\n');
        for (int f = 0; f < FIELD.length; f++) {
            if (diff[f] > 0) b.append("  ").append(FIELD[f]).append(": ").append(diff[f]).append('\n');
        }
        b.append("  by extension: ").append(byExt).append('\n');
        b.append(ex);
    }

    public static void begin() {
        before = table();
        synchronized (ScanProbe.class) {
            scanThread = Thread.currentThread();
            for (int i = 0; i < 2; i++) {
                files[i] = 0;
                fileNs[i] = 0;
                for (int j = 0; j < 7; j++) stage[i][j] = 0;
            }
            extOpen.clear();
            extOwn.clear();
            for (int i = 0; i < TOP; i++) {
                topNs[i] = 0;
                topPath[i] = null;
            }
            pyCount = pyWait = pyBody = 0;
            knownN = knownNs = 0;
            for (int i = 0; i < 4; i++) {
                howN[i] = 0;
                howNs[i] = 0;
            }
            seenN = askedN = 0;
            for (int i = 0; i < wNs.length; i++) wNs[i] = 0;
            wLast = 0;
            wNodes = 0;
            wMusic = false;
            insN = insNs = insRows = lcN = lcNs = listN = listNs = sleptN = 0;
            tWalk = tFinal = tClean = tPreLoad = tLoaded = 0;
            uptime0 = SystemClock.uptimeMillis();
            cpu0 = cpuStat();
            proc0 = procCpu();
            io0 = readBytes();
            cpuThread0 = SystemClock.currentThreadTimeMillis();
            t0 = System.nanoTime();
        }
    }

    public static void walked() { tWalk = System.nanoTime(); }
    public static void finalInserted() { tFinal = System.nanoTime(); }
    public static void cleaned() { tClean = System.nanoTime(); }
    public static void preLoad() { tPreLoad = System.nanoTime(); }
    public static void slept() { sleptN++; }

    // the walk loop, segment by segment: each mark closes the segment since the previous one
    private static final String[] WSEG = {"tail: isHidden+listFiles+addAll (listFiles below)",
        "loop head: size, scanLock, get, Timber line", "queue remove(0)", "exists",
        "pathInThemes + Scan.skip", "book/music checks + pathInAudiobook",
        "lambda + repeatTry (Scan.known below)", "video check", "video lambda", "dir check"};
    private static final long[] wNs = new long[WSEG.length];
    private static long wLast, wNodes;
    private static boolean wMusic;

    private static void w(int seg) {
        long now = System.nanoTime();
        if (wLast != 0) wNs[seg] += now - wLast;
        wLast = now;
    }

    public static void wHead() { w(0); wNodes++; }
    public static void wLogged() { w(1); }
    public static void wRemoved() { w(2); }
    public static void wExists() { w(3); }
    public static void wSkip() { w(4); }
    public static void wMusic() { w(5); wMusic = true; }
    public static void wPost() { w(wMusic ? 6 : 5); wMusic = false; }
    public static void wVideo() { w(7); }
    public static void wVideoDone() { w(8); }
    public static void wDir() { w(9); }

    public static void list0() { listAt = System.nanoTime(); }
    public static void list1() {
        listN++;
        listNs += System.nanoTime() - listAt;
    }

    public static void ins0() { insAt = System.nanoTime(); }
    public static void ins1() {
        insN++;
        insNs += System.nanoTime() - insAt;
    }
    public static void lc0() { lcAt = System.nanoTime(); }
    public static void lc1() {
        lcN++;
        lcNs += System.nanoTime() - lcAt;
    }

    private static long seenN, askedN;

    static synchronized void exists(boolean seen) {
        if (seen) seenN++;
        else askedN++;
    }

    static synchronized void known(long ns) {
        knownN++;
        knownNs += ns;
    }

    static synchronized void song(int h, long ns) {
        if (Thread.currentThread() != scanThread) return;
        howN[h]++;
        howNs[h] += ns;
    }

    // ---------------------------------------------------------------- fileToSong

    public static void fBegin() {
        long[] s = slot();
        long now = System.nanoTime();
        s[0] = now;
        s[1] = now;
    }

    private static void mark(int st) {
        long[] s = slot();
        long now = System.nanoTime();
        long d = now - s[0];
        s[0] = now;
        synchronized (ScanProbe.class) {
            stage[who()][st] += d;
        }
    }

    public static void fPreMmr() { mark(0); }

    public static void fOpened(String path) {
        long[] s = slot();
        long d = System.nanoTime() - s[0];
        mark(1);
        String ext = "?";
        if (path != null) {
            int dot = path.lastIndexOf('.');
            if (dot >= 0) ext = path.substring(dot + 1).toLowerCase();
        }
        synchronized (ScanProbe.class) {
            long[] e = (long[]) extOpen.get(ext);
            if (e == null) {
                e = new long[2];
                extOpen.put(ext, e);
            }
            e[0]++;
            e[1] += d;
        }
    }

    /** Meta.scanOwn (marks its stage) and Meta.fixSong for the formats stock does not open. */
    static void own(String ext, long ns, boolean ok) {
        if (ext == null) ext = "?";
        if (!ext.startsWith("blind ")) mark(6);
        synchronized (ScanProbe.class) {
            long[] e = (long[]) extOwn.get(ext);
            if (e == null) {
                e = new long[3];
                extOwn.put(ext, e);
            }
            e[0]++;
            e[1] += ns;
            if (ok) e[2]++;
        }
    }

    public static void fExtracted() { mark(2); }
    public static void fScanned() { mark(3); }
    public static void fLogged() { mark(4); }

    public static void fEnd(com.innioasis.y1.database.Song song) {
        String path = song == null ? null : song.getPath();
        mark(5);
        long[] s = slot();
        long d = System.nanoTime() - s[1];
        synchronized (ScanProbe.class) {
            int w = who();
            files[w]++;
            fileNs[w] += d;
            int min = 0;
            for (int i = 1; i < TOP; i++) if (topNs[i] < topNs[min]) min = i;
            if (d > topNs[min]) {
                topNs[min] = d;
                topPath[min] = path;
            }
        }
    }

    // ---------------------------------------------------------------- HanziToPinyin.getString

    public static void pyIn() { slot()[2] = System.nanoTime(); }
    public static void pyLocked() { slot()[3] = System.nanoTime(); }
    public static void pyOut() {
        long[] s = slot();
        long now = System.nanoTime();
        synchronized (ScanProbe.class) {
            pyCount++;
            pyWait += s[3] - s[2];
            pyBody += now - s[3];
        }
    }

    // ---------------------------------------------------------------- the report

    public static void end() {
        try {
            long tEnd = System.nanoTime();
            tLoaded = tPreLoad == 0 ? 0 : tEnd;
            long[] cpu1 = cpuStat();
            long proc1 = procCpu();
            long io1 = readBytes();
            long thr = SystemClock.currentThreadTimeMillis() - cpuThread0;
            StringBuilder b = new StringBuilder();
            long total = ms(tEnd - t0);
            b.append("better-Y scan probe, force=").append(force)
                .append(", uptime at start ").append(uptime0 / 1000).append(" s")
                .append(", cores ").append(Runtime.getRuntime().availableProcessors()).append('\n');
            b.append("TOTAL ").append(total).append(" ms\n\n");

            b.append("PHASES (scan thread wall)\n");
            line(b, "walk+read (to end of BFS)", ms(tWalk - t0), total);
            line(b, "final insert", ms(tFinal - tWalk), total);
            line(b, "cleanup (exists per row)", ms(tClean - tFinal), total);
            b.append("    rows met by the walk ").append(seenN).append(", asked the card ").append(askedN).append("\n");
            line(b, "video delete + misc", ms(tPreLoad - tClean), total);
            line(b, "Albums.loadNow", ms(tEnd - tPreLoad), total);

            long walk = ms(tWalk - t0);
            b.append("\nINSIDE THE WALK (scan thread)\n");
            line(b, "Scan.known x" + knownN, ms(knownNs), walk);
            for (int i = 0; i < 4; i++) line(b, "Scan.song " + HOW[i] + " x" + howN[i], ms(howNs[i]), walk);
            line(b, "songDao.insert x" + insN, ms(insNs), walk);
            line(b, "Ipp.libraryChanged x" + lcN, ms(lcNs), walk);
            line(b, "listFiles x" + listN, ms(listNs), walk);
            long rest = walk - ms(knownNs) - ms(howNs[0] + howNs[1] + howNs[2] + howNs[3])
                - ms(insNs) - ms(lcNs) - ms(listNs);
            line(b, "rest of the walk (checks, lambdas, logging)", rest, walk);
            b.append("scanLock sleeps (100 ms each): ").append(sleptN).append('\n');
            b.append("WALK LOOP BY SEGMENT, ").append(wNodes).append(" nodes\n");
            for (int i = 0; i < wNs.length; i++) line(b, WSEG[i], ms(wNs[i]), walk);

            b.append("\nfileToSong, summed per thread group\n");
            String[] grp = {"scan thread", "workers"};
            for (int g = 0; g < 2; g++) {
                b.append(grp[g]).append(": ").append(files[g]).append(" files, ")
                    .append(ms(fileNs[g])).append(" ms, avg ")
                    .append(files[g] == 0 ? 0 : fileNs[g] / files[g] / 1000).append(" us\n");
                for (int j = 0; j < 7; j++) line(b, "  " + STAGE[j], ms(stage[g][j]), ms(fileNs[g]));
            }
            b.append("pinyin getString x").append(pyCount).append(": body ").append(ms(pyBody))
                .append(" ms, waiting for the lock ").append(ms(pyWait)).append(" ms\n");

            b.append("\nOPEN (MMR new + setDataSource) BY EXTENSION\n");
            Iterator it = extOpen.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry e = (Map.Entry) it.next();
                long[] v = (long[]) e.getValue();
                b.append("  ").append(e.getKey()).append(": ").append(v[0]).append(" files, ")
                    .append(ms(v[1])).append(" ms, avg ").append(v[0] == 0 ? 0 : v[1] / v[0] / 1000)
                    .append(" us\n");
            }

            b.append("\nOUR READER BY EXTENSION (Meta.scanOwn; \"blind\" = via fixSong)\n");
            it = extOwn.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry e = (Map.Entry) it.next();
                long[] v = (long[]) e.getValue();
                b.append("  ").append(e.getKey()).append(": ").append(v[0]).append(" files, ")
                    .append(v[2]).append(" answered, ").append(ms(v[1])).append(" ms, avg ")
                    .append(v[0] == 0 ? 0 : v[1] / v[0] / 1000).append(" us\n");
            }

            b.append("\nSLOWEST FILES (fileToSong wall)\n");
            for (int i = 0; i < TOP; i++) {
                int max = -1;
                for (int j = 0; j < TOP; j++) {
                    if (topPath[j] != null && (max < 0 || topNs[j] > topNs[max])) max = j;
                }
                if (max < 0) break;
                b.append("  ").append(ms(topNs[max])).append(" ms ").append(topPath[max]).append('\n');
                topPath[max] = null;
            }

            b.append("\nCPU\n");
            if (cpu0 != null && cpu1 != null) {
                long all = 0;
                for (int i = 0; i < cpu1.length; i++) all += cpu1[i] - cpu0[i];
                if (all > 0) {
                    b.append("  system: busy ").append(100 * (all - (cpu1[3] - cpu0[3]) - (cpu1[4] - cpu0[4])) / all)
                        .append("%, idle ").append(100 * (cpu1[3] - cpu0[3]) / all)
                        .append("%, iowait ").append(100 * (cpu1[4] - cpu0[4]) / all).append("% (all cores)\n");
                }
            }
            b.append("  app process CPU ").append((proc1 - proc0) * 10).append(" ms, scan thread CPU ")
                .append(thr).append(" ms\n");
            if (io0 >= 0 && io1 >= 0) {
                b.append("  app read from storage ").append((io1 - io0) / 1024).append(" KB\n");
            }

            if (before != null) compare(b);
            before = null;
            force = false;
            String text = b.toString();
            String[] lines = text.split("\n");
            for (int i = 0; i < lines.length; i++) Log.e("IPPSCAN", lines[i]);
            File f = new File(Panel.logs(), "scan_" + Panel.stamp() + ".txt");
            FileOutputStream o = new FileOutputStream(f);
            try {
                o.write(text.getBytes("UTF-8"));
            } finally {
                o.close();
            }
        } catch (Throwable t) {
            Log.e("IPPSCAN", "report failed", t);
        }
    }

    private static void line(StringBuilder b, String name, long v, long of) {
        b.append("  ").append(name).append(": ").append(v).append(" ms");
        if (of > 0) b.append(" (").append(v * 100 / of).append("%)");
        b.append('\n');
    }

    private static long ms(long ns) {
        return ns / 1000000L;
    }

    /** user nice system idle iowait irq softirq, in ticks. */
    private static long[] cpuStat() {
        String l = first("/proc/stat");
        if (l == null) return null;
        String[] p = l.trim().split("\\s+");
        long[] v = new long[7];
        for (int i = 0; i < 7 && i + 1 < p.length; i++) v[i] = Long.parseLong(p[i + 1]);
        return v;
    }

    private static long procCpu() {
        String l = first("/proc/self/stat");
        if (l == null) return 0;
        String[] p = l.substring(l.lastIndexOf(')') + 2).split(" ");
        return Long.parseLong(p[11]) + Long.parseLong(p[12]);    // utime, stime (fields 14, 15)
    }

    private static long readBytes() {
        BufferedReader r = null;
        try {
            r = new BufferedReader(new FileReader("/proc/self/io"));
            String l;
            while ((l = r.readLine()) != null) {
                if (l.startsWith("read_bytes:")) return Long.parseLong(l.substring(11).trim());
            }
        } catch (Throwable t) {
        } finally {
            try {
                if (r != null) r.close();
            } catch (Throwable t) {
            }
        }
        return -1;
    }

    private static String first(String path) {
        BufferedReader r = null;
        try {
            r = new BufferedReader(new FileReader(path));
            return r.readLine();
        } catch (Throwable t) {
            return null;
        } finally {
            try {
                if (r != null) r.close();
            } catch (Throwable t) {
            }
        }
    }
}
