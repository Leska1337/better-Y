package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Build;
import android.util.Xml;
import android.view.Gravity;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import com.innioasis.music.util.Other;
import com.innioasis.y1.R;
import com.innioasis.y1.utils.DialogUtil;
import com.innioasis.y1.utils.LoadingDialog;

import org.xmlpull.v1.XmlPullParser;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/**
 * [Tools] - "Data backup": the app's data copied to the card and read back, so it survives an
 * Updater flash, which rewrites {@code usrdata}. In the archive: {@code shared_prefs/},
 * {@code files/mmkv/} (the chosen theme), {@code databases/}, {@code files/save_state} and
 * {@code system.txt} ({@link Sys}). Not the rebuildable caches, and not Bluetooth pairings —
 * another app's data.
 */
public final class Backup {

    private Backup() { }

    /** {@code better-Y/backup/backup_<yyyyMMdd_HHmmss>.zip}. */
    private static final String PREFIX = "backup_";
    private static final String SUFFIX = ".zip";

    private static final int KEEP = 5;

    /** Folders taken one level deep. */
    private static final String[] DIRS = {"shared_prefs", "databases"};

    /** Folders taken with everything under them. */
    private static final String[] TREES = {"files/mmkv"};

    private static final String[] FILES = {"files/save_state"};

    private static final String SYS = "system.txt";

    /** Where the archive is unpacked: inside the data directory, so the moves are renames. */
    private static final String STAGE = "ipp_restore";

    /** The row opens a Save / Load dialog. */
    public static void open(Activity a, String title) {
        if (a == null) return;
        String[] rows = {a.getString(R.string.ipp_backup_save),
                a.getString(R.string.ipp_backup_load)};
        new BackupDialog(a, title, rows, null, new Action(a)).show();
    }

    static final class Action extends BackupDialog.Go {
        private final Activity a;

        Action(Activity a) { this.a = a; }

        public void go(int row) {
            if (row == 0) {
                startSave(a);
            } else {
                askLoad(a);
            }
        }
    }

    private static LoadingDialog progress;

    static void startSave(Activity a) {
        progress = show(a, R.string.ipp_backup_saving);
        Thread t = new Thread(new SaveRun(a), "ipp-backup");
        t.setDaemon(true);
        t.start();
    }

    static final class SaveRun implements Runnable {
        private final Activity a;

        SaveRun(Activity a) { this.a = a; }

        public void run() {
            File f = null;
            try {
                f = save(a);
            } catch (Throwable t) {
                Diag.note("backup failed: " + t);
            }
            try {
                a.runOnUiThread(new Saved(a, f));
            } catch (Throwable t) {
            }
        }
    }

    static final class Saved implements Runnable {
        private final Activity a;
        private final File f;

        Saved(Activity a, File f) {
            this.a = a;
            this.f = f;
        }

        public void run() {
            close();
            if (f == null) {
                toast(a, a.getString(R.string.ipp_backup_fail));
            } else {
                toast(a, a.getString(R.string.ipp_backup_done,
                        new Object[]{f.getAbsolutePath()}));
            }
        }
    }

    /**
     * Write one archive, or null. First the prefs are flushed ({@code apply()} lags) and each
     * database checkpointed, so the copy is what the user sees.
     */
    static File save(Context c) {
        File data = dataDir(c);
        if (data == null) return null;
        flushPrefs(c, data);
        File[] fs = new File(data, "databases").listFiles();
        for (int i = 0; fs != null && i < fs.length; i++) {
            if (fs[i].isFile() && fs[i].getName().indexOf('-') < 0) checkpoint(fs[i]);
        }

        File out = new File(Panel.backups(), PREFIX + Panel.stamp() + SUFFIX);
        ZipOutputStream z = null;
        int n = 0;
        try {
            z = new ZipOutputStream(new BufferedOutputStream(new FileOutputStream(out)));
            put(z, "meta.txt", meta(c).getBytes("UTF-8"));
            put(z, SYS, Sys.snapshot(c).getBytes("UTF-8"));
            n++;
            for (int i = 0; i < DIRS.length; i++) n += addDir(z, data, DIRS[i]);
            for (int i = 0; i < TREES.length; i++) n += addTree(z, data, TREES[i], 0);
            for (int i = 0; i < FILES.length; i++) {
                if (addFile(z, data, FILES[i])) n++;
            }
            z.finish();
        } catch (Throwable t) {
            Diag.note("backup write failed: " + t);
            closeQuietly(z);
            out.delete();
            return null;
        }
        closeQuietly(z);
        if (n == 0) {
            out.delete();
            return null;
        }
        Diag.note("backup saved: " + out.getName() + ", " + n + " file(s), " + out.length() + " B");
        Diag.keepNewest(Panel.backups(), PREFIX, KEEP);
        return out;
    }

    /** For a person looking at the file; nothing reads it back. */
    private static String meta(Context c) {
        StringBuilder s = new StringBuilder(256);
        s.append("better-Y ").append(Panel.version(c)).append('\n');
        s.append("when     ").append(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US)
                .format(new Date())).append('\n');
        s.append("build    ").append(Build.DISPLAY).append('\n');
        s.append("model    ").append(Build.MODEL).append('\n');
        return s.toString();
    }

    /** An empty {@code commit()} on every prefs file writes its whole map synchronously. */
    private static void flushPrefs(Context c, File data) {
        File[] fs = new File(data, "shared_prefs").listFiles();
        for (int i = 0; fs != null && i < fs.length; i++) {
            String n = fs[i].getName();
            if (!fs[i].isFile() || !n.endsWith(".xml")) continue;
            try {
                c.getSharedPreferences(n.substring(0, n.length() - 4), 0).edit().commit();
            } catch (Throwable t) {
            }
        }
    }

    /**
     * Fold the WAL into the database file, through a second connection (Room's is private); busy
     * changes nothing. The {@code -wal} is archived too — this only removes the timing dependency.
     */
    private static void checkpoint(File db) {
        SQLiteDatabase d = null;
        Cursor cur = null;
        try {
            d = SQLiteDatabase.openDatabase(db.getAbsolutePath(), null,
                    SQLiteDatabase.OPEN_READWRITE);
            cur = d.rawQuery("PRAGMA wal_checkpoint(TRUNCATE)", null);
            if (cur != null) cur.moveToFirst();
        } catch (Throwable t) {
            Diag.note("backup checkpoint " + db.getName() + " failed: " + t);
        } finally {
            try {
                if (cur != null) cur.close();
            } catch (Throwable t) {
            }
            try {
                if (d != null) d.close();
            } catch (Throwable t) {
            }
        }
    }

    private static int addDir(ZipOutputStream z, File data, String rel) throws Throwable {
        File[] fs = new File(data, rel).listFiles();
        int n = 0;
        for (int i = 0; fs != null && i < fs.length; i++) {
            if (!fs[i].isFile()) continue;
            // a stale -shm restored beside a database is worse than none; SQLite rebuilds it
            if (fs[i].getName().endsWith("-shm")) continue;
            if (addFile(z, data, rel + "/" + fs[i].getName())) n++;
        }
        return n;
    }

    /** Depth-capped: a cycle would write until the card is full. */
    private static int addTree(ZipOutputStream z, File data, String rel, int depth) throws Throwable {
        if (depth > 4) return 0;
        File[] fs = new File(data, rel).listFiles();
        int n = 0;
        for (int i = 0; fs != null && i < fs.length; i++) {
            String sub = rel + "/" + fs[i].getName();
            if (fs[i].isDirectory()) {
                n += addTree(z, data, sub, depth + 1);
            } else if (addFile(z, data, sub)) {
                n++;
            }
        }
        return n;
    }

    private static boolean addFile(ZipOutputStream z, File data, String rel) throws Throwable {
        File f = new File(data, rel);
        if (!f.isFile()) return false;
        InputStream in = null;
        try {
            in = new BufferedInputStream(new FileInputStream(f));
            z.putNextEntry(new ZipEntry(rel));
            copy(in, z);
            z.closeEntry();
            return true;
        } finally {
            closeQuietly(in);
        }
    }

    private static void put(ZipOutputStream z, String name, byte[] body) throws Throwable {
        z.putNextEntry(new ZipEntry(name));
        z.write(body);
        z.closeEntry();
    }

    /** The archives, newest first. Never null. */
    static File[] list() {
        List mine = new ArrayList();
        collect(mine, Panel.backups());
        try {
            Collections.sort(mine, new Diag.NameCmp());
            Collections.reverse(mine);
        } catch (Throwable t) {
        }
        return (File[]) mine.toArray(new File[mine.size()]);
    }

    private static void collect(List out, File dir) {
        try {
            File[] fs = dir == null ? null : dir.listFiles();
            for (int i = 0; fs != null && i < fs.length; i++) {
                String n = fs[i].getName();
                if (fs[i].isFile() && n.startsWith(PREFIX) && n.endsWith(SUFFIX)) out.add(fs[i]);
            }
        } catch (Throwable t) {
        }
    }

    static void askLoad(Activity a) {
        File[] fs = list();
        if (fs.length == 0) {
            toast(a, a.getString(R.string.ipp_backup_none));
            return;
        }
        String[] rows = new String[fs.length];
        String[] sizes = new String[fs.length];
        for (int i = 0; i < fs.length; i++) {
            rows[i] = when(fs[i].getName());
            sizes[i] = CacheSize.format(fs[i].length());
        }
        new BackupDialog(a, a.getString(R.string.ipp_backup_pick), rows, sizes, new Load(a, fs))
                .show();
    }

    /** The date from the NAME: a flash resets the clock, so file times on the card lie. */
    private static String when(String name) {
        try {
            String s = name.substring(PREFIX.length(), name.length() - SUFFIX.length());
            if (s.length() >= 15 && s.charAt(8) == '_') {
                return s.substring(0, 4) + "-" + s.substring(4, 6) + "-" + s.substring(6, 8)
                        + " " + s.substring(9, 11) + ":" + s.substring(11, 13);
            }
        } catch (Throwable t) {
        }
        return name;
    }

    static final class Load extends BackupDialog.Go {
        private final Activity a;
        private final File[] fs;

        Load(Activity a, File[] fs) {
            this.a = a;
            this.fs = fs;
        }

        public void go(int row) {
            if (row < 0 || row >= fs.length) return;
            new DialogUtil(a, false, R.style.Dialog_Common).setDialogTitle(
                    a.getString(R.string.ipp_backup_load),
                    a.getString(R.string.ipp_backup_confirm),
                    new Go(a, fs[row]), false, true);
        }
    }

    static final class Go extends DialogUtil.DialogCallback {
        private final Activity a;
        private final File f;

        Go(Activity a, File f) {
            this.a = a;
            this.f = f;
        }

        public void cancel() { }

        /** Posted: the confirm dialog is dismissed only after this returns. */
        public void confirm() {
            Start s = new Start(a, f);
            try {
                a.getWindow().getDecorView().postDelayed(s, 400L);
            } catch (Throwable t) {
                s.run();
            }
        }
    }

    static final class Start implements Runnable {
        private final Activity a;
        private final File f;

        Start(Activity a, File f) {
            this.a = a;
            this.f = f;
        }

        public void run() {
            progress = show(a, R.string.ipp_backup_restoring);
            Thread t = new Thread(new RestoreRun(a, f), "ipp-restore");
            t.setDaemon(true);
            t.start();
        }
    }

    /**
     * Unpack, put in place, REBOOT: prefs, Room and MMKV all hold state in this process
     * ({@code killProcess} leaves a crashed launcher). No {@code Force.saveState} here — it would
     * write the old player state over the restored one.
     */
    static final class RestoreRun implements Runnable {
        private final Activity a;
        private final File f;

        RestoreRun(Activity a, File f) {
            this.a = a;
            this.f = f;
        }

        public void run() {
            boolean ok = false;
            try {
                ok = restore(a, f);
            } catch (Throwable t) {
                Diag.note("restore failed: " + t);
            }
            if (ok) {
                try {
                    Other.INSTANCE.reboot(a);
                } catch (Throwable t) {
                    Diag.note("reboot after restore failed: " + t);
                }
                return;
            }
            try {
                a.runOnUiThread(new Failed(a));
            } catch (Throwable t) {
            }
        }
    }

    static final class Failed implements Runnable {
        private final Activity a;

        Failed(Activity a) { this.a = a; }

        public void run() {
            close();
            toast(a, a.getString(R.string.ipp_backup_restore_fail));
        }
    }

    /**
     * Read one archive back; false = nothing touched. Unpacked to a stage first, so a half-read
     * archive is never half restored. Prefs go through the API (a copied file is undone by the next
     * {@code apply()}), the rest by {@code rename} (open handles keep the old file), {@link Sys} last.
     */
    static boolean restore(Context c, File zip) {
        File data = dataDir(c);
        if (data == null || zip == null || !zip.isFile()) return false;
        File stage = new File(data, STAGE);
        wipe(stage);
        List names = new ArrayList();
        ZipInputStream z = null;
        try {
            z = new ZipInputStream(new BufferedInputStream(new FileInputStream(zip)));
            ZipEntry e;
            while ((e = z.getNextEntry()) != null) {
                String name = e.getName();
                if (e.isDirectory() || !wanted(name)) continue;
                File out = new File(stage, name);
                File parent = out.getParentFile();
                if (parent != null) parent.mkdirs();
                OutputStream os = null;
                try {
                    os = new BufferedOutputStream(new FileOutputStream(out));
                    copy(z, os);
                } finally {
                    closeQuietly(os);
                }
                names.add(name);
            }
        } catch (Throwable t) {
            Diag.note("restore unpack failed: " + t);
            closeQuietly(z);
            wipe(stage);
            return false;
        }
        closeQuietly(z);
        if (names.isEmpty()) {
            wipe(stage);
            return false;
        }

        // The old database's WAL applied to the restored one is corruption.
        File[] fs = new File(data, "databases").listFiles();
        for (int i = 0; fs != null && i < fs.length; i++) {
            String n = fs[i].getName();
            if (n.endsWith("-wal") || n.endsWith("-shm")) fs[i].delete();
        }

        int done = 0;
        for (int i = 0; i < names.size(); i++) {
            String name = (String) names.get(i);
            if (SYS.equals(name)) continue;
            if (name.startsWith("shared_prefs/")) {
                if (applyPrefs(c, stage, name)) done++;
                continue;
            }
            File from = new File(stage, name);
            File to = new File(data, name);
            File parent = to.getParentFile();
            if (parent != null) parent.mkdirs();
            to.delete();
            if (from.renameTo(to)) done++;
        }

        File sys = new File(stage, SYS);
        if (sys.isFile()) {
            Sys.apply(c, text(sys));
            done++;
        }

        wipe(stage);
        Diag.note("restore: " + done + " of " + names.size() + " item(s) from " + zip.getName());
        return done > 0;
    }

    /** One prefs file applied as VALUES. Anything unknown is skipped, never thrown on. */
    private static boolean applyPrefs(Context c, File stage, String rel) {
        InputStream in = null;
        try {
            String name = rel.substring("shared_prefs/".length(), rel.length() - 4);
            XmlPullParser p = Xml.newPullParser();
            in = new BufferedInputStream(new FileInputStream(new File(stage, rel)));
            p.setInput(in, "UTF-8");
            SharedPreferences.Editor e = c.getSharedPreferences(name, 0).edit();
            e.clear();
            HashSet set = null;
            String setKey = null;
            for (int ev = p.getEventType(); ev != XmlPullParser.END_DOCUMENT; ev = p.next()) {
                if (ev == XmlPullParser.END_TAG && "set".equals(p.getName())) {
                    if (setKey != null && set != null) e.putStringSet(setKey, set);
                    set = null;
                    setKey = null;
                    continue;
                }
                if (ev != XmlPullParser.START_TAG) continue;
                String tag = p.getName();
                String key = p.getAttributeValue(null, "name");
                String val = p.getAttributeValue(null, "value");
                if ("string".equals(tag)) {
                    // Inside a <set> the strings carry no name of their own.
                    if (set != null && key == null) set.add(p.nextText());
                    else if (key != null) e.putString(key, p.nextText());
                } else if ("set".equals(tag)) {
                    setKey = key;
                    set = new HashSet();
                } else if (key == null || val == null) {
                    continue;
                } else if ("boolean".equals(tag)) {
                    e.putBoolean(key, "true".equals(val));
                } else if ("int".equals(tag)) {
                    e.putInt(key, Integer.parseInt(val));
                } else if ("long".equals(tag)) {
                    e.putLong(key, Long.parseLong(val));
                } else if ("float".equals(tag)) {
                    e.putFloat(key, Float.parseFloat(val));
                }
            }
            return e.commit();
        } catch (Throwable t) {
            Diag.note("restore prefs " + rel + " failed: " + t);
            return false;
        } finally {
            closeQuietly(in);
        }
    }

    /** A small text file, or "". */
    private static String text(File f) {
        InputStream in = null;
        try {
            in = new BufferedInputStream(new FileInputStream(f));
            java.io.ByteArrayOutputStream out = new java.io.ByteArrayOutputStream();
            copy(in, out);
            return new String(out.toByteArray(), "UTF-8");
        } catch (Throwable t) {
            return "";
        } finally {
            closeQuietly(in);
        }
    }

    /** A white list: an edited or newer archive cannot put files anywhere else. */
    private static boolean wanted(String name) {
        if (name == null || name.length() == 0) return false;
        if (name.indexOf("..") >= 0 || name.charAt(0) == '/' || name.indexOf('\\') >= 0) {
            return false;
        }
        if (SYS.equals(name)) return true;
        if (name.startsWith("shared_prefs/") && name.endsWith(".xml")) {
            return name.indexOf('/', 13) < 0;
        }
        if (name.startsWith("databases/") && !name.endsWith("-shm")) {
            return name.indexOf('/', 10) < 0;
        }
        for (int i = 0; i < TREES.length; i++) {
            if (name.startsWith(TREES[i] + "/")) return true;
        }
        for (int i = 0; i < FILES.length; i++) {
            if (FILES[i].equals(name)) return true;
        }
        return false;
    }

    /** {@code /data/data/com.innioasis.y1}. */
    private static File dataDir(Context c) {
        File f = c == null ? null : c.getFilesDir();
        return f == null ? null : f.getParentFile();
    }

    private static void wipe(File dir) {
        try {
            File[] fs = dir.listFiles();
            for (int i = 0; fs != null && i < fs.length; i++) {
                if (fs[i].isDirectory()) wipe(fs[i]);
                else fs[i].delete();
            }
            dir.delete();
        } catch (Throwable t) {
        }
    }

    private static void copy(InputStream in, OutputStream out) throws Throwable {
        byte[] buf = new byte[8192];
        int got;
        while ((got = in.read(buf)) > 0) out.write(buf, 0, got);
        out.flush();
    }

    private static void closeQuietly(InputStream in) {
        try {
            if (in != null) in.close();
        } catch (Throwable t) {
        }
    }

    private static void closeQuietly(OutputStream out) {
        try {
            if (out != null) out.close();
        } catch (Throwable t) {
        }
    }

    private static LoadingDialog show(Activity a, int res) {
        try {
            LoadingDialog d = new LoadingDialog(a, a.getString(res), "", R.style.Dialog_Common,
                    new Noop());
            d.show();
            return d;
        } catch (Throwable t) {
            return null;
        }
    }

    private static void close() {
        LoadingDialog d = progress;
        progress = null;
        try {
            if (d != null) d.dismiss();
        } catch (Throwable t) {
        }
    }

    /** The dialog's back-key callback. */
    static final class Noop implements Function0 {
        public Object invoke() {
            return Unit.INSTANCE;
        }
    }

    /** Centred. */
    private static void toast(Context c, String text) {
        try {
            if (c == null || text == null) return;
            Toast t = Toast.makeText(c, text, Toast.LENGTH_LONG);
            View v = t.getView();
            View m = (v == null) ? null : v.findViewById(android.R.id.message);
            if (m instanceof TextView) ((TextView) m).setGravity(Gravity.CENTER);
            t.show();
        } catch (Throwable e) {
        }
    }
}
