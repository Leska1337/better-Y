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
 * [Tools] - "Data backup": everything the player keeps about itself, copied to the card and read
 * back from it.
 *
 * Why this exists. There are three ways to put a new build on the player and only two of them
 * leave the app's data alone: {@code adb install -r} and flashing the ANDROID partition on its own
 * both keep {@code usrdata}, but the Updater writes {@code usrdata} from the archive - always, on
 * both updaters, because the archive has to be complete (skill {@code ipp-release}) - and that
 * takes the settings, the likes, the playlists, the bookmarks and the reading progress with it.
 * The card survives all three, so a copy that lives on the card is a copy that survives an update.
 *
 * What is in the archive:
 *
 *   - {@code shared_prefs/} - the whole folder: the mod's own {@code innioasis_plus.xml} (its
 *       settings, the per-song {@code like:} flags, the sort modes, the Bluetooth names) and
 *       stock's {@code config.xml} (language, equalizer, wallpaper, repeat and shuffle modes, the
 *       reader's font and theme, Key lock).
 *   - {@code files/mmkv/} - which theme is chosen. Stock keeps that ONE setting in MMKV
 *       ({@code ThemeManager.themeName}) rather than in its preferences, so an archive without
 *       this folder restored the wallpaper and not the theme.
 *   - {@code databases/} - {@code y1_database} (the library, and inside it the playlists, the
 *       audiobook bookmarks and their progress) and {@code book_database.db} (the reader's
 *       progress). The library cannot be left out of it: one file holds both.
 *   - {@code files/save_state} - what was playing and at which second.
 *   - {@code cache/ipp_art.txt} - the album covers the user picked by hand ({@link Art}). It
 *       lives in the cache directory but it is a choice, not a cache.
 *   - {@code system.txt} - the settings that are not in this folder at all: brightness, the
 *       backlight timeout, Key tone, Key vibration and the clock. See {@link Sys}.
 *
 * Not in it: the cover caches and the tag caches (they are rebuilt from the files, and they are by
 * far the biggest thing in there), the themes' own folders, the music and
 * {@code comma_artists.txt} - those are on the card already and no update touches them. Nor the
 * paired Bluetooth devices: the stack is a separate app ({@code com.mediatek.bluetooth}, its own
 * uid), its data is not ours to read, and a pairing cannot be recreated without its link keys.
 * What the mod itself knows about a device - the name it was given - is in its preferences.
 */
public final class Backup {

    private Backup() { }

    /** {@code better-Y/backup_<yyyyMMdd_HHmmss>.zip}, the same shape as the diagnostic logs. */
    private static final String PREFIX = "backup_";
    private static final String SUFFIX = ".zip";

    /** How many are kept. The card is not an archive; five is the number the logs keep too. */
    private static final int KEEP = 5;

    /** Folders taken whole, one level deep - neither of these has sub-folders on this platform. */
    private static final String[] DIRS = {"shared_prefs", "databases"};

    /** Folders taken with everything under them; MMKV keeps a data file and a CRC beside it. */
    private static final String[] TREES = {"files/mmkv"};

    /** Single files taken by name. */
    private static final String[] FILES = {"files/save_state", "cache/ipp_art.txt"};

    /** The settings that live outside the data directory, as a text block. See {@link Sys}. */
    private static final String SYS = "system.txt";

    /** Where the archive is unpacked: inside the data directory, so the moves are renames. */
    private static final String STAGE = "ipp_restore";

    // ---------------------------------------------------------------- the menu row

    /**
     * The row opens a dialog of its own rather than doing something: it carries two actions, and
     * one row cannot ask which. Save writes a new archive, Load offers the ones on the card.
     */
    public static void open(Activity a, String title) {
        if (a == null) return;
        String[] rows = {a.getString(R.string.ipp_backup_save),
                a.getString(R.string.ipp_backup_load)};
        new BackupDialog(a, title, rows, null, new Action(a)).show();
    }

    /** Named class: the bundled d8 crashes dexing anonymous ones. */
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

    // ---------------------------------------------------------------- save

    /** The progress dialog of whichever half is running; null when nothing is. */
    private static LoadingDialog progress;

    static void startSave(Activity a) {
        progress = show(a, R.string.ipp_backup_saving);
        Thread t = new Thread(new SaveRun(a), "ipp-backup");
        t.setDaemon(true);
        t.start();
    }

    /** @see Backup#startSave(Activity) */
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
                // the screen is gone; the archive is written either way
            }
        }
    }

    /** Back on the main thread: close the dialog and say where the archive went. */
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
     * Write one archive, or null if nothing could be written.
     *
     * Two things happen before the first byte is copied, and both are about the copy being of what
     * the user can see rather than of whatever happens to be on disk:
     *
     *   - the preferences are FLUSHED. {@code apply()} - which is what every setting in this app
     *       is written with - queues the write, so the file can be a change or two behind the row
     *       the user has just switched.
     *   - each database is CHECKPOINTED, so the pages of a committed transaction are in the
     *       database file rather than only in its write-ahead log.
     */
    static File save(Context c) {
        File data = dataDir(c);
        if (data == null) return null;
        flushPrefs(c, data);
        File[] fs = new File(data, "databases").listFiles();
        for (int i = 0; fs != null && i < fs.length; i++) {
            // The database itself, not its -wal / -shm companions.
            if (fs[i].isFile() && fs[i].getName().indexOf('-') < 0) checkpoint(fs[i]);
        }

        File out = new File(Panel.dir(), PREFIX + Panel.stamp() + SUFFIX);
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
        Diag.keepNewest(PREFIX, KEEP);
        return out;
    }

    /**
     * What the archive says about itself. Nothing reads it - a restore is meant to work across
     * versions, which is the whole point of having one - but a person looking at the file needs to
     * know which player and which build it came off.
     */
    private static String meta(Context c) {
        StringBuilder s = new StringBuilder(256);
        s.append("better-Y ").append(Panel.version(c)).append('\n');
        s.append("when     ").append(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US)
                .format(new Date())).append('\n');
        s.append("build    ").append(Build.DISPLAY).append('\n');
        s.append("model    ").append(Build.MODEL).append('\n');
        return s.toString();
    }

    /**
     * Make the preferences on disk match the ones in memory.
     *
     * An empty {@code commit()} writes the whole map synchronously, so this asks for one on every
     * file in the folder rather than on the two the mod knows by name: whatever is in there is
     * what is about to be copied. Naming a file no code has opened yet is harmless - it reads the
     * file that is already there and writes it back.
     */
    private static void flushPrefs(Context c, File data) {
        File[] fs = new File(data, "shared_prefs").listFiles();
        for (int i = 0; fs != null && i < fs.length; i++) {
            String n = fs[i].getName();
            if (!fs[i].isFile() || !n.endsWith(".xml")) continue;
            try {
                c.getSharedPreferences(n.substring(0, n.length() - 4), 0).edit().commit();
            } catch (Throwable t) {
                // one file's worth of very recent changes; the rest of the archive is still good
            }
        }
    }

    /**
     * Fold the write-ahead log back into the database file.
     *
     * Room opens these in WAL mode, so a committed transaction can live entirely in
     * {@code <db>-wal} - and a database file copied without it is the state of some earlier
     * checkpoint. The {@code -wal} goes into the archive as well, so this is belt and braces
     * rather than the only thing between a backup and a stale one; what it buys is an archive that
     * does not depend on the two files being copied at the same instant.
     *
     * A second connection, not Room's: {@code Y1Repository} keeps its database private and Java
     * cannot reach it. SQLite is built for this - the checkpoint reports busy and changes nothing
     * if the app is writing at that moment.
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
                // ignore
            }
            try {
                if (d != null) d.close();
            } catch (Throwable t) {
                // ignore
            }
        }
    }

    /** Every file of one folder, by its path relative to the data directory; returns the count. */
    private static int addDir(ZipOutputStream z, File data, String rel) throws Throwable {
        File[] fs = new File(data, rel).listFiles();
        int n = 0;
        for (int i = 0; fs != null && i < fs.length; i++) {
            if (!fs[i].isFile()) continue;
            // -shm is a shared-memory index for the write-ahead log: SQLite rebuilds it, and a
            // stale one restored beside a database is worse than none at all.
            if (fs[i].getName().endsWith("-shm")) continue;
            if (addFile(z, data, rel + "/" + fs[i].getName())) n++;
        }
        return n;
    }

    /** One folder and everything under it. Depth-capped: a cycle here would write until the card is full. */
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

    // ---------------------------------------------------------------- load

    /** The archives on the card, newest first. Never null. */
    static File[] list() {
        List mine = new ArrayList();
        try {
            File[] fs = Panel.card().listFiles();
            for (int i = 0; fs != null && i < fs.length; i++) {
                String n = fs[i].getName();
                if (fs[i].isFile() && n.startsWith(PREFIX) && n.endsWith(SUFFIX)) mine.add(fs[i]);
            }
            // The names carry yyyyMMdd_HHmmss, so alphabetical order IS chronological order.
            Collections.sort(mine, new Diag.NameCmp());
            Collections.reverse(mine);
        } catch (Throwable t) {
            // whatever was collected before it failed
        }
        return (File[]) mine.toArray(new File[mine.size()]);
    }

    /**
     * The list of archives, or a toast when there is none. Each row is the moment it was taken
     * with its weight beside it - the two things that tell two backups apart.
     */
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

    /**
     * The date out of the file's own name, not its {@code lastModified()}: the player's clock is
     * reset by a flash, and after one the timestamps of everything on the card are wrong while the
     * names still say when they were written.
     */
    private static String when(String name) {
        try {
            String s = name.substring(PREFIX.length(), name.length() - SUFFIX.length());
            if (s.length() >= 15 && s.charAt(8) == '_') {
                return s.substring(0, 4) + "-" + s.substring(4, 6) + "-" + s.substring(6, 8)
                        + " " + s.substring(9, 11) + ":" + s.substring(11, 13);
            }
        } catch (Throwable t) {
            // an archive renamed by hand; its name is as good a label as any
        }
        return name;
    }

    /** Named (d8 crashes on anonymous classes). */
    static final class Load extends BackupDialog.Go {
        private final Activity a;
        private final File[] fs;

        Load(Activity a, File[] fs) {
            this.a = a;
            this.fs = fs;
        }

        public void go(int row) {
            if (row < 0 || row >= fs.length) return;
            // A restore replaces everything the player knows about itself, so it is asked twice:
            // once for the file, once for the deed.
            new DialogUtil(a, false, R.style.Dialog_Common).setDialogTitle(
                    a.getString(R.string.ipp_backup_load),
                    a.getString(R.string.ipp_backup_confirm),
                    new Go(a, fs[row]), false, true);
        }
    }

    /** Named (d8 crashes on anonymous classes). */
    static final class Go extends DialogUtil.DialogCallback {
        private final Activity a;
        private final File f;

        Go(Activity a, File f) {
            this.a = a;
            this.f = f;
        }

        public void cancel() { }

        /**
         * Posted, not started here: {@code DialogUtil.shortUp} calls this callback and dismisses
         * the confirm dialog only afterwards, so anything put on screen from inside it goes up
         * behind a dialog that is still there. The same 400 ms the reboot action uses, and the
         * same reason - let the dialog close and the frame without it be drawn.
         */
        public void confirm() {
            Start s = new Start(a, f);
            try {
                a.getWindow().getDecorView().postDelayed(s, 400L);
            } catch (Throwable t) {
                s.run();
            }
        }
    }

    /** @see Backup.Go#confirm() */
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
     * Unpack, put everything in place, and reboot the device.
     *
     * The reboot is not a nicety. Half of what has been restored is also state inside this
     * process: every preference file is a map in memory, Room is holding both databases open, and
     * MMKV has its file mapped. Nothing may be read from any of them again until they have been
     * read afresh, so the restore ends the session, and it ends it by rebooting rather than by
     * killing our own process - {@code killProcess} did bring the launcher back, in the state a
     * crash leaves it in, and the device had to be rebooted by hand anyway.
     *
     * What makes a reboot safe is that nothing restored can be written back over by the way down:
     * the preferences are applied THROUGH the preferences, so memory and disk already agree; the
     * databases and the MMKV file are put in place by {@code rename}, so a process still holding
     * the old file writes to the old file; and stock does not save the player state on a reboot
     * (that is {@code Force.saveState}, which the [Tools] reboot calls and this deliberately does
     * not - it would write the state we have just restored back over itself).
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
                // ignore
            }
        }
    }

    /** Named (d8 crashes on anonymous classes). */
    static final class Failed implements Runnable {
        private final Activity a;

        Failed(Activity a) { this.a = a; }

        public void run() {
            close();
            toast(a, a.getString(R.string.ipp_backup_restore_fail));
        }
    }

    /**
     * Read one archive back. True when the files are in place, false when nothing was touched.
     *
     * It happens in two passes, and the split is what keeps a half-read archive from becoming
     * half-restored data: everything is unpacked into a staging folder inside the data directory
     * first, and only once all of it is there does the second pass put it where it belongs. The
     * second pass treats the three kinds of content differently, and each for its own reason:
     *
     *   - **the preferences are applied through the preferences API**, not copied. The file is only
     *       half of a preference - the other half is a map in this process, and whichever is
     *       written last wins: a copied file is silently undone by the next {@code apply()}
     *       anywhere in the app, and there is one on the way to every reboot. Writing them through
     *       {@code clear()} + the values leaves memory and disk saying the same thing.
     *   - **everything else is moved by {@code rename}**, which is why the staging folder is
     *       inside the data directory: a rename replaces the directory entry and leaves the old
     *       file to whoever still holds it open, so Room and MMKV go on reading the files they
     *       opened rather than finding them changed underneath themselves.
     *   - **the system settings are applied last** ({@link Sys}), because one of them is the clock
     *       and everything above it is easier to reason about with the clock still standing still.
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

        // A write-ahead log left over from the database being replaced belongs to the file that is
        // going away: applied to the restored one it is corruption. So every -wal and -shm goes
        // before the move, and the ones the archive brought are put back by it.
        File[] fs = new File(data, "databases").listFiles();
        for (int i = 0; fs != null && i < fs.length; i++) {
            String n = fs[i].getName();
            if (n.endsWith("-wal") || n.endsWith("-shm")) fs[i].delete();
        }

        int done = 0;
        for (int i = 0; i < names.size(); i++) {
            String name = (String) names.get(i);
            if (SYS.equals(name)) continue;                 // applied below, not a file of ours
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

    /**
     * One preference file, applied as VALUES rather than copied as a file - see {@link #restore}.
     *
     * The format is the platform's own: one element per entry, the type as the tag name, the value
     * in an attribute except for strings, which carry it as text. Everything unknown is skipped,
     * so a file written by a later build cannot make this throw half way through and leave the
     * preferences in a state neither the archive nor the device ever had.
     */
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

    /** A small text file, or "" - {@code system.txt} is a few lines. */
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

    /**
     * Which entries of an archive are restored - a white list, so an archive that has been edited,
     * or one written by a later version that keeps more than this one understands, can only put
     * files where this version means to put them. It is also what keeps a path inside an entry
     * name from reaching outside the data directory.
     */
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

    // ---------------------------------------------------------------- plumbing

    /** {@code /data/data/com.innioasis.y1} - the folder everything we copy lives under. */
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
            // ignore
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
            // ignore
        }
    }

    private static void closeQuietly(OutputStream out) {
        try {
            if (out != null) out.close();
        } catch (Throwable t) {
            // ignore
        }
    }

    /**
     * The progress dialog. Writing a few megabytes of database through deflate is seconds on this
     * CPU, and a screen that simply sits there for that long reads as a button that did nothing.
     */
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
            // ignore
        }
    }

    /** The dialog's back-key callback: raw {@code Function0}, as {@code IppActivity} does it. */
    static final class Noop implements Function0 {
        public Object invoke() {
            return Unit.INSTANCE;
        }
    }

    /** Centred, the way every toast of the mod's own is. */
    private static void toast(Context c, String text) {
        try {
            if (c == null || text == null) return;
            Toast t = Toast.makeText(c, text, Toast.LENGTH_LONG);
            View v = t.getView();
            View m = (v == null) ? null : v.findViewById(android.R.id.message);
            if (m instanceof TextView) ((TextView) m).setGravity(Gravity.CENTER);
            t.show();
        } catch (Throwable e) {
            // ignore
        }
    }
}
