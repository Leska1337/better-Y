package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.database.Cursor;
import android.widget.Toast;

import androidx.room.RoomDatabase;
import androidx.room.util.UUIDUtil;
import androidx.sqlite.db.SupportSQLiteDatabase;

import com.innioasis.music.adapter.rv.RVBaseAdapter;
import com.innioasis.music.objects.Constant;
import com.innioasis.music.util.Other;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Playlist;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.database.Y1Repository;
import com.innioasis.y1.utils.SharedPreferencesUtils;
import com.innioasis.y1_eBook.utils.FileEncodingDetector;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CodingErrorAction;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.UUID;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/**
 * Music playlists to and from {@code .m3u} / {@code .m3u8} files in {@code /Playlists/} at the
 * card's root — the folder other players and PC software look in.
 *
 * Export writes the songs in the order the playlist shows them now (its sort, "date added"
 * included), paths relative to /Music/ — or full computer paths when {@link M3uBase} knows where
 * /Music/ lies there — and {@code .m3u8} as soon as the name or any line is
 * not plain ASCII. Import finds each entry by its path, then by its file name alone, then by its
 * #EXTINF text ({@link Resolver}), and writes the songs with ascending "date added", so the file's
 * order is the playlist's order under Date added.
 * Favorites is recognised by {@link #MARK}, never by its name: that follows the interface language.
 */
public final class M3u {

    private M3u() { }

    /** The line that makes a file the Favorites playlist. Other players skip it as a comment. */
    static final String MARK = "#BETTERY:FAVORITES";
    private static final String HEAD = "#EXTM3U";
    private static final String NL = "\r\n";

    private static final Charset UTF8 = Charset.forName("UTF-8");

    /** An import target, as the planner decided it. */
    public static final int NEW = 0;
    public static final int REPLACE = 1;
    public static final int MERGE = 2;

    public static File dir() {
        return new File(Constant.ROOT_PATH, "Playlists");
    }

    private static Y1Repository repo() {
        return Y1Application.Companion.getY1Repository();
    }

    /** "Export to m3u" in the Playlists screen's menu — under every row, Favorites included. */
    public static void menu(List l, Context c) {
        l.add(c.getString(R.string.ipp_m3u_export));
    }

    /**
     * Its dispatch. The ticked rows, or the row under the cursor when nothing is ticked, ticks
     * cleared afterwards — the rule {@code Queue.addFromRvAdapter} follows.
     */
    public static boolean menuPick(Activity a, Object adapter, String s) {
        if (a == null || s == null || !s.equals(a.getString(R.string.ipp_m3u_export))) return false;
        try {
            if (!(adapter instanceof RVBaseAdapter)) return true;
            RVBaseAdapter ad = (RVBaseAdapter) adapter;
            ArrayList picked = new ArrayList();
            List sel = ad.getMultiSelectIndexes();
            if (sel != null && !sel.isEmpty()) {
                for (int i = 0; i < sel.size(); i++) {
                    Object o = ad.getItemByPosition(((Integer) sel.get(i)).intValue());
                    if (o instanceof Playlist) picked.add(o);
                }
                sel.clear();
                ad.notifyDataSetChanged();
            } else {
                Object o = ad.getSelectItem();
                if (o instanceof Playlist) picked.add(o);
            }
            if (!picked.isEmpty()) new Export(a, picked).start();
        } catch (Throwable t) {
            Toast.makeText(a, R.string.ipp_m3u_write_failed, Toast.LENGTH_SHORT).show();
        }
        return true;
    }

    /** One file to write. */
    static final class Job {
        String base;          // file name without the extension
        String ext;
        String text;
        int songs;
        boolean overwrite;    // the user said so: the file of the other extension goes too
    }

    /**
     * The export run: every file is built first, then the names that are taken are asked about one
     * by one, and nothing is written until the last answer — top button on a question writes nothing.
     */
    static final class Export {
        private final Activity a;
        private final ArrayList jobs = new ArrayList();
        private final HashSet taken = new HashSet();     // lower-case names this run has claimed
        private int at;
        private int choice = -1;                          // "same for the rest", once given

        Export(Activity a, List playlists) {
            this.a = a;
            for (int i = 0; i < playlists.size(); i++) {
                Job j = build(a, (Playlist) playlists.get(i));
                if (j != null) jobs.add(j);
            }
        }

        void start() {
            next();
        }

        void next() {
            while (at < jobs.size()) {
                Job j = (Job) jobs.get(at);
                if (taken.contains(j.base.toLowerCase())) {
                    j.base = freeFile(j.base, taken);     // two playlists of one name in one run
                } else if (exists(j.base)) {
                    if (choice < 0) {
                        ask(j);
                        return;
                    }
                    apply(j, choice);
                }
                taken.add(j.base.toLowerCase());
                at++;
            }
            write();
        }

        private void ask(Job j) {
            int left = 0;
            for (int i = at; i < jobs.size(); i++) {
                Job k = (Job) jobs.get(i);
                if (!taken.contains(k.base.toLowerCase()) && exists(k.base)) left++;
            }
            String[] rows = { a.getString(R.string.ipp_m3u_overwrite),
                    a.getString(R.string.ipp_m3u_new) };
            BackupDialog d = new BackupDialog(a,
                    a.getString(R.string.ipp_m3u_exists, new Object[] { existing(j.base) }),
                    rows, null, left > 1 ? a.getString(R.string.ipp_m3u_same) : null,
                    new ExportGo(this));
            d.setOnBack(new Nothing());
            d.show();
        }

        void answer(int row, boolean all) {
            Job j = (Job) jobs.get(at);
            apply(j, row);
            if (all) choice = row;
            taken.add(j.base.toLowerCase());
            at++;
            next();
        }

        private void apply(Job j, int row) {
            if (row == 0) j.overwrite = true;
            else j.base = freeFile(j.base, taken);
        }

        private void write() {
            if (jobs.isEmpty()) return;
            int songs = 0;
            Job last = null;
            try {
                File d = dir();
                if (!d.isDirectory() && !d.mkdirs()) throw new IllegalStateException("no dir");
                for (int i = 0; i < jobs.size(); i++) {
                    Job j = (Job) jobs.get(i);
                    if (j.overwrite) {
                        new File(d, j.base + ".m3u").delete();
                        new File(d, j.base + ".m3u8").delete();
                    }
                    writeFile(new File(d, j.base + j.ext), j.text);
                    songs += j.songs;
                    last = j;
                }
            } catch (Throwable t) {
                Diag.note("m3u export failed: " + t);
                Toast.makeText(a, R.string.ipp_m3u_write_failed, Toast.LENGTH_LONG).show();
                return;
            }
            String msg = jobs.size() == 1
                    ? a.getString(R.string.ipp_m3u_exported_one,
                            new Object[] { last.base + last.ext, Integer.valueOf(songs) })
                    : a.getString(R.string.ipp_m3u_exported_many,
                            new Object[] { Integer.valueOf(jobs.size()), Integer.valueOf(songs) });
            Toast.makeText(a, msg, Toast.LENGTH_LONG).show();
        }
    }

    static final class ExportGo extends BackupDialog.Go {
        private final Export e;

        ExportGo(Export e) { this.e = e; }

        public void go(int row) {
            e.answer(row, false);
        }

        @Override
        public void go(int row, boolean all) {
            e.answer(row, all);
        }
    }

    /** The top button on a question: the dialog closes and nothing else happens. */
    static final class Nothing implements Function0 {
        public Object invoke() {
            return Unit.INSTANCE;
        }
    }

    /** The file of one playlist, in the order the playlist is shown now. */
    private static Job build(Context c, Playlist p) {
        try {
            List songs = repo().getSongsByPlaylistSortByType(p,
                    Y1Repository.SongSortType.Companion.fromType(
                            SharedPreferencesUtils.INSTANCE.getSortPlayListSong()));
            StringBuilder sb = new StringBuilder(HEAD).append(NL);
            if (Playlists.isFav(p)) sb.append(MARK).append(NL);
            String base = M3uBase.get();
            if (base != null) sb.append(M3uBase.LINE).append(base).append(NL);
            int n = 0;
            if (songs != null) {
                for (int i = 0; i < songs.size(); i++) {
                    Object o = songs.get(i);
                    if (!(o instanceof Song)) continue;
                    Song s = (Song) o;
                    sb.append("#EXTINF:-1,").append(extinf(s)).append(NL);
                    String full = M3uBase.absolute(base, s.getPath());
                    sb.append(full != null ? full : relative(s.getPath())).append(NL);
                    n++;
                }
            }
            Job j = new Job();
            j.base = fileName(p.getName());
            j.text = sb.toString();
            j.songs = n;
            j.ext = ascii(j.base) && ascii(j.text) ? ".m3u" : ".m3u8";
            return j;
        } catch (Throwable t) {
            Diag.note("m3u export: " + t);
            return null;
        }
    }

    /** "Artist - Title", the form players show for a line they have not read the tags of. */
    private static String extinf(Song s) {
        String title = clean(Other.INSTANCE.unNamed(s.getSongName()));
        if (title.length() == 0) title = stem(last(s.getPath()));
        String artist = clean(Other.INSTANCE.unNamed(s.getArtist()));
        return artist.length() == 0 ? title : artist + " - " + title;
    }

    /**
     * A path is written relative to /Music/, not to where the file lies: the same music on a
     * computer sits in a folder of any name, anywhere, and a list dropped into that folder then
     * works in VLC and foobar as it is. Forward slashes, which both read on Windows as well.
     * Import looks such a path up under /Music/ ({@link #shapes}).
     */
    private static String relative(String path) {
        if (path == null) return "";
        String root = Constant.ROOT_PATH;
        String music = root + "/Music";
        if (path.startsWith(music + "/")) return path.substring(music.length() + 1);
        if (path.startsWith(root + "/")) return "../" + path.substring(root.length() + 1);
        return path;
    }

    private static String clean(String s) {
        if (s == null) return "";
        return s.replace('\r', ' ').replace('\n', ' ').trim();
    }

    private static boolean ascii(String s) {
        for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) > 0x7E) return false;
        }
        return true;
    }

    /** A playlist name as a FAT file name: the nine characters FAT refuses become '_'. */
    private static String fileName(String name) {
        StringBuilder sb = new StringBuilder();
        String n = name == null ? "" : name;
        for (int i = 0; i < n.length(); i++) {
            char ch = n.charAt(i);
            sb.append(ch < 0x20 || "\\/:*?\"<>|".indexOf(ch) >= 0 ? '_' : ch);
        }
        String out = sb.toString().trim();
        while (out.endsWith(".")) out = out.substring(0, out.length() - 1).trim();
        return out.length() == 0 ? "Playlist" : out;
    }

    private static boolean exists(String base) {
        return existing(base) != null;
    }

    /** The file already standing under this name, either extension — or null. */
    private static String existing(String base) {
        File d = dir();
        if (new File(d, base + ".m3u8").exists()) return base + ".m3u8";
        if (new File(d, base + ".m3u").exists()) return base + ".m3u";
        return null;
    }

    private static String freeFile(String base, HashSet taken) {
        for (int n = 2; ; n++) {
            String b = base + " (" + n + ")";
            if (!exists(b) && !taken.contains(b.toLowerCase())) return b;
        }
    }

    private static void writeFile(File f, String text) throws Exception {
        FileOutputStream out = new FileOutputStream(f);
        try {
            out.write(text.getBytes("UTF-8"));
            out.getFD().sync();
        } finally {
            out.close();
        }
    }

    /** One file of /Playlists/, read, and what is to be done with it. */
    public static final class Plan {
        public String name;          // the playlist it becomes (the file name, unless taken)
        public String file;          // the file's own name, for the summary
        public boolean fav;
        String base;                 // its #BETTERY:BASE line, or null
        public final ArrayList lines = new ArrayList();   // the entries, raw, in order
        final ArrayList infos = new ArrayList();          // each entry's #EXTINF text, or null
        public boolean picked;                            // ticked on the file list

        public int mode = NEW;
        Playlist target;             // REPLACE / MERGE

        // filled by apply()
        public int found;
        public final ArrayList missing = new ArrayList();  // file names
        public final ArrayList dups = new ArrayList();     // file names
    }

    /** Every .m3u / .m3u8 in the folder, read, sorted by name. Empty when there is none. */
    public static List scan() {
        ArrayList out = new ArrayList();
        File[] fs = dir().listFiles();
        if (fs == null) return out;
        Arrays.sort(fs, new ByName());
        for (int i = 0; i < fs.length; i++) {
            File f = fs[i];
            String n = f.getName();
            String low = n.toLowerCase();
            boolean u8 = low.endsWith(".m3u8");
            if (!f.isFile() || !(u8 || low.endsWith(".m3u"))) continue;
            try {
                Plan p = new Plan();
                p.file = n;
                p.name = n.substring(0, n.length() - (u8 ? 5 : 4)).trim();
                if (p.name.length() == 0) p.name = "Playlist";
                read(f, u8, p);
                out.add(p);
            } catch (Throwable t) {
                Diag.note("m3u read " + n + ": " + t);
            }
        }
        return out;
    }

    static final class ByName implements Comparator {
        public int compare(Object a, Object b) {
            return ((File) a).getName().compareToIgnoreCase(((File) b).getName());
        }
    }

    private static void read(File f, boolean u8, Plan p) throws Exception {
        byte[] b = bytes(f);
        int off = 0;
        Charset cs;
        if (b.length >= 3 && (b[0] & 0xFF) == 0xEF && (b[1] & 0xFF) == 0xBB && (b[2] & 0xFF) == 0xBF) {
            cs = UTF8;
            off = 3;
        } else if (u8 || utf8(b)) {
            cs = UTF8;
        } else {
            // A .m3u written on Windows is in the ANSI codepage — for this user base windows-1251
            // as often as not. The e-book reader's detector tells them apart (see Lyrics).
            Charset fb = Charset.forName("windows-1251");
            Charset d = null;
            try {
                d = FileEncodingDetector.INSTANCE.detectCharset(f.getPath(), fb);
            } catch (Throwable t) {
            }
            cs = d != null ? d : fb;
        }
        String text = new String(b, off, b.length - off, cs);
        String[] ls = text.split("\r\n|\r|\n");
        String info = null;
        for (int i = 0; i < ls.length; i++) {
            String l = ls[i].trim();
            if (l.length() > 0 && l.charAt(0) == '﻿') l = l.substring(1).trim();
            if (l.length() == 0) continue;
            if (l.charAt(0) == '#') {
                if (l.equalsIgnoreCase(MARK)) p.fav = true;
                if (l.regionMatches(true, 0, M3uBase.LINE, 0, M3uBase.LINE.length())) {
                    String pb = M3uBase.trim(l.substring(M3uBase.LINE.length()));
                    if (pb.length() > 0) p.base = pb;
                }
                // "#EXTINF:<seconds>,<Artist - Title>" belongs to the entry that follows it
                if (l.regionMatches(true, 0, "#EXTINF:", 0, 8)) {
                    int comma = l.indexOf(',');
                    info = comma > 0 ? l.substring(comma + 1).trim() : null;
                }
                continue;
            }
            p.lines.add(l);
            p.infos.add(info);
            info = null;
        }
    }

    private static byte[] bytes(File f) throws Exception {
        FileInputStream in = new FileInputStream(f);
        try {
            byte[] b = new byte[(int) f.length()];
            int got = 0;
            while (got < b.length) {
                int r = in.read(b, got, b.length - got);
                if (r < 0) break;
                got += r;
            }
            return got == b.length ? b : Arrays.copyOf(b, got);
        } finally {
            in.close();
        }
    }

    private static boolean utf8(byte[] b) {
        try {
            CharsetDecoder d = UTF8.newDecoder()
                    .onMalformedInput(CodingErrorAction.REPORT)
                    .onUnmappableCharacter(CodingErrorAction.REPORT);
            d.decode(ByteBuffer.wrap(b));
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    /**
     * Before anything is written: every file whose name is taken is asked about — Replace, Add
     * missing or Create new for an ordinary playlist, Replace or Add missing for Favorites (there
     * cannot be a second one). With "Same for the rest" on, the answer stands for every later file
     * of the same kind. Two files of one name in one run never ask: the second is simply new.
     */
    public static final class Ask {
        private final Activity a;
        private final List plans;
        private final Runnable done;
        private final Runnable cancel;
        private final HashMap existing = new HashMap();  // lower name -> Playlist
        private final HashSet planned = new HashSet();   // lower names this run creates or fills
        private int at;
        private int reg = -1;
        private int fav = -1;

        public Ask(Activity a, List plans, Runnable done, Runnable cancel) {
            this.a = a;
            this.plans = plans;
            this.done = done;
            this.cancel = cancel;
            try {
                List all = repo().getAllPlaylistSync();
                for (int i = 0; all != null && i < all.size(); i++) {
                    Object o = all.get(i);
                    if (!(o instanceof Playlist) || Playlists.isFav(o)) continue;
                    Playlist p = (Playlist) o;
                    if (p.getName() != null) existing.put(p.getName().toLowerCase(), p);
                }
            } catch (Throwable t) {
            }
        }

        public void start() {
            next();
        }

        private void next() {
            while (at < plans.size()) {
                Plan p = (Plan) plans.get(at);
                if (p.fav) {
                    if (fav < 0) {
                        askFav(p);
                        return;
                    }
                    p.mode = fav == 0 ? REPLACE : MERGE;
                } else {
                    String low = p.name.toLowerCase();
                    if (planned.contains(low)) {
                        p.name = free(p.name);
                    } else if (existing.containsKey(low)) {
                        if (reg < 0) {
                            askReg(p);
                            return;
                        }
                        reg(p, reg);
                    }
                    planned.add(p.name.toLowerCase());
                }
                at++;
            }
            done.run();
        }

        private void askReg(Plan p) {
            int left = 0;
            for (int i = at; i < plans.size(); i++) {
                Plan q = (Plan) plans.get(i);
                String low = q.name.toLowerCase();
                if (!q.fav && !planned.contains(low) && existing.containsKey(low)) left++;
            }
            show(p.name, new String[] { a.getString(R.string.ipp_m3u_replace),
                    a.getString(R.string.ipp_m3u_merge), a.getString(R.string.ipp_m3u_new) }, left);
        }

        private void askFav(Plan p) {
            int left = 0;
            for (int i = at; i < plans.size(); i++) {
                if (((Plan) plans.get(i)).fav) left++;
            }
            show(a.getString(R.string.ipp_favorites), new String[] {
                    a.getString(R.string.ipp_m3u_replace), a.getString(R.string.ipp_m3u_merge) }, left);
        }

        private void show(String name, String[] rows, int left) {
            BackupDialog d = new BackupDialog(a,
                    a.getString(R.string.ipp_m3u_exists, new Object[] { name }), rows, null,
                    left > 1 ? a.getString(R.string.ipp_m3u_same) : null, new AskGo(this));
            d.setOnBack(new Run(cancel));
            d.show();
        }

        void answer(int row, boolean all) {
            Plan p = (Plan) plans.get(at);
            if (p.fav) {
                p.mode = row == 0 ? REPLACE : MERGE;
                if (all) fav = row;
            } else {
                reg(p, row);
                if (all) reg = row;
                planned.add(p.name.toLowerCase());
            }
            at++;
            next();
        }

        private void reg(Plan p, int row) {
            if (row == 2) {
                p.mode = NEW;
                p.name = free(p.name);
                return;
            }
            p.mode = row == 0 ? REPLACE : MERGE;
            p.target = (Playlist) existing.get(p.name.toLowerCase());
        }

        private String free(String name) {
            for (int n = 2; ; n++) {
                String s = name + " (" + n + ")";
                String low = s.toLowerCase();
                if (!existing.containsKey(low) && !planned.contains(low)) return s;
            }
        }
    }

    static final class AskGo extends BackupDialog.Go {
        private final Ask ask;

        AskGo(Ask ask) { this.ask = ask; }

        public void go(int row) {
            ask.answer(row, false);
        }

        @Override
        public void go(int row, boolean all) {
            ask.answer(row, all);
        }
    }

    /** A dialog's back-key callback that runs something. */
    static final class Run implements Function0 {
        private final Runnable r;

        Run(Runnable r) { this.r = r; }

        public Object invoke() {
            if (r != null) r.run();
            return Unit.INSTANCE;
        }
    }

    /** Told after every entry, off the main thread. */
    public static abstract class Tick {
        public abstract void tick(Plan p, int entry);
    }

    private static final String SQL_REDATE =
            "update songCatPlaylist set date = ? where playlistId = ? and songId = ?";
    private static final String SQL_LAST =
            "select max(date) from songCatPlaylist where playlistId = ?";

    /**
     * One file into the library, off the main thread. The songs go through the stock
     * {@code addToPlayList} funnel — that is where the heart, the grid's cover and the "already
     * there" note are kept (Likes, PlGrid, Playlists) — and are then given dates one millisecond
     * apart in the file's order: the funnel stamps a whole batch with the same moment, and
     * "date added" would have nothing to order them by.
     */
    public static void apply(Context c, Plan p, Resolver r, Tick tick) {
        Y1Repository repo = repo();
        int n = p.lines.size();
        Song[] got = new Song[n];
        HashMap dirs = new HashMap();          // folder -> how many entries were found in it
        for (int i = 0; i < n; i++) {
            got[i] = r.byPath((String) p.lines.get(i), p.base);
            vote(dirs, got[i]);
            if (tick != null) tick.tick(p, i + 1);
        }
        // A bare file name (VLC writes the list next to the songs) is looked up by name. When two
        // folders hold a file of that name ("01 - Intro.mp3"), the one the rest of this list was
        // found in wins — so every name that is unambiguous goes first and votes, and the
        // ambiguous ones are settled after, wherever they stand in the list.
        for (int round = 0; round < 2; round++) {
            for (int i = 0; i < n; i++) {
                if (got[i] != null) continue;
                got[i] = r.byName((String) p.lines.get(i), dirs, round == 1);
                vote(dirs, got[i]);
            }
        }
        for (int i = 0; i < n; i++) {
            if (got[i] == null) got[i] = r.byInfo((String) p.infos.get(i), dirs);
            if (got[i] != null) r.learn.note((String) p.lines.get(i), got[i].getPath());
        }
        ArrayList songs = new ArrayList();
        HashSet ids = new HashSet();
        for (int i = 0; i < n; i++) {
            String raw = (String) p.lines.get(i);
            if (got[i] == null) {
                p.missing.add(shown(raw));
            } else if (!ids.add(got[i].getSongId())) {
                p.dups.add(shown(raw));   // the table holds a song once per playlist
            } else {
                songs.add(got[i]);
            }
        }
        p.found = songs.size();

        Playlist target;
        if (p.fav) {
            Fav.ensure(c);
            target = repo.getPlaylistById(UUID.fromString(Fav.UUID_STR));
        } else if (p.mode == NEW || p.target == null) {
            target = new Playlist(UUID.randomUUID(), p.name, p.name.toLowerCase(),
                    System.currentTimeMillis(), false);
            repo.addPlaylist(target);
        } else {
            target = p.target;
        }
        if (target == null) return;
        UUID id = target.getPlaylistId();

        ArrayList add = songs;
        if (p.mode == REPLACE) {
            List old = repo.getSongsByPlaylistSync(target);
            for (int i = 0; old != null && i < old.size(); i++) {
                repo.removeFromPlayList(((Song) old.get(i)).getSongId(), id);
            }
        } else if (p.mode == MERGE) {
            HashSet have = new HashSet();
            List old = repo.getSongsByPlaylistSync(target);
            for (int i = 0; old != null && i < old.size(); i++) {
                have.add(((Song) old.get(i)).getSongId());
            }
            add = new ArrayList();
            for (int i = 0; i < songs.size(); i++) {
                Song s = (Song) songs.get(i);
                if (!have.contains(s.getSongId())) add.add(s);
            }
        }
        if (add.isEmpty()) return;

        long base = System.currentTimeMillis();
        try {
            if (p.mode == MERGE) base = Math.max(base, last(id) + 1);
        } catch (Throwable t) {
            // now is later than anything already there anyway
        }
        repo.addToPlayList(add, id);
        try {
            redate(id, add, base);
        } catch (Throwable t) {
            Diag.note("m3u redate " + p.name + ": " + t);
        }
    }

    private static long last(UUID id) throws Exception {
        Cursor cur = PlGrid.db().query(SQL_LAST, new Object[] { UUIDUtil.convertUUIDToByte(id) });
        try {
            return cur.moveToFirst() && !cur.isNull(0) ? cur.getLong(0) : 0L;
        } finally {
            cur.close();
        }
    }

    private static void redate(UUID id, List songs, long base) throws Exception {
        RoomDatabase db = PlGrid.db();
        byte[] key = UUIDUtil.convertUUIDToByte(id);
        db.beginTransaction();
        try {
            SupportSQLiteDatabase w = db.getOpenHelper().getWritableDatabase();
            for (int i = 0; i < songs.size(); i++) {
                w.execSQL(SQL_REDATE, new Object[] { Long.valueOf(base + i), key,
                        ((Song) songs.get(i)).getSongId() });
            }
            db.setTransactionSuccessful();
        } finally {
            db.endTransaction();
        }
    }

    private static void vote(HashMap dirs, Song s) {
        if (s == null || s.getPath() == null) return;
        String d = parent(s.getPath());
        Integer c = (Integer) dirs.get(d);
        dirs.put(d, Integer.valueOf(c == null ? 1 : c.intValue() + 1));
    }

    private static String parent(String path) {
        int k = path.lastIndexOf('/');
        return k > 0 ? path.substring(0, k) : "";
    }

    /** The file name an entry points at — what the summary shows for a song that is not found. */
    static String shown(String raw) {
        String l = last(pct(raw).replace('\\', '/'));
        return l.length() > 0 ? l : raw;
    }

    private static String last(String path) {
        if (path == null) return "";
        int k = path.lastIndexOf('/');
        return k >= 0 ? path.substring(k + 1) : path;
    }

    private static String stem(String name) {
        int k = name.lastIndexOf('.');
        return k > 0 ? name.substring(0, k) : name;
    }

    /**
     * {@code %XX} sequences decoded as UTF-8, everything else kept as written. VLC writes every
     * path this way, bare file names included; '+' is left alone, unlike a form decoder, since it
     * is an ordinary character in a file name.
     */
    static String pct(String s) {
        if (s == null || s.indexOf('%') < 0) return s;
        java.io.ByteArrayOutputStream out = new java.io.ByteArrayOutputStream();
        int i = 0;
        boolean any = false;
        while (i < s.length()) {
            char ch = s.charAt(i);
            if (ch == '%' && i + 2 < s.length()
                    && hex(s.charAt(i + 1)) >= 0 && hex(s.charAt(i + 2)) >= 0) {
                out.write(hex(s.charAt(i + 1)) * 16 + hex(s.charAt(i + 2)));
                i += 3;
                any = true;
                continue;
            }
            byte[] b = String.valueOf(ch).getBytes(UTF8);
            out.write(b, 0, b.length);
            i++;
        }
        if (!any) return s;
        byte[] b = out.toByteArray();
        return utf8(b) ? new String(b, UTF8) : s;
    }

    private static int hex(char c) {
        if (c >= '0' && c <= '9') return c - '0';
        if (c >= 'a' && c <= 'f') return c - 'a' + 10;
        if (c >= 'A' && c <= 'F') return c - 'A' + 10;
        return -1;
    }

    /** Other roots a path written on an Android device may carry for the same card. */
    private static final String[] ROOTS = {
        "/storage/sdcard0", "/storage/emulated/0", "/mnt/sdcard", "/sdcard",
    };

    /** A '/' path under one of the card's own roots. */
    static boolean onCard(String s) {
        if (s.startsWith(Constant.ROOT_PATH + "/")) return true;
        for (int i = 0; i < ROOTS.length; i++) {
            if (s.startsWith(ROOTS[i] + "/")) return true;
        }
        return false;
    }

    /**
     * Every place an entry may mean, in the order they are tried: relative to /Playlists/, relative to
     * /Music/ (what export writes), relative to the card's root, a Windows path with its drive letter taken off,
     * an Android path under another name for the card, a {@code file://} URL — each as written
     * and then percent-decoded.
     */
    static List candidates(String raw) {
        ArrayList out = new ArrayList();
        String s = raw.trim();
        boolean url = s.regionMatches(true, 0, "file:", 0, 5);
        if (url) {
            s = s.substring(5);
            while (s.startsWith("//")) s = s.substring(1);
        }
        if (!url) shapes(s, out);
        String d = pct(s);
        if (url || !d.equals(s)) shapes(d, out);
        return out;
    }

    private static void shapes(String s, List out) {
        String root = Constant.ROOT_PATH;
        s = s.replace('\\', '/');
        if (s.length() >= 3 && s.charAt(0) == '/' && s.charAt(2) == ':') s = s.substring(1);
        if (s.length() >= 2 && Character.isLetter(s.charAt(0)) && s.charAt(1) == ':') {
            s = s.substring(2);
            if (!s.startsWith("/")) s = "/" + s;
            out.add(norm(root + s));
            return;
        }
        if (s.startsWith("/")) {
            for (int i = 0; i < ROOTS.length; i++) {
                if (s.startsWith(ROOTS[i] + "/")) {
                    out.add(norm(root + s.substring(ROOTS[i].length())));
                    return;
                }
            }
            out.add(norm(s));
            out.add(norm(root + s));
            return;
        }
        out.add(norm(dir().getPath() + "/" + s));
        out.add(norm(root + "/Music/" + s));    // what export writes
        out.add(norm(root + "/" + s));
    }

    /** "." and ".." resolved, doubled slashes dropped — without touching the disk. */
    static String norm(String path) {
        String[] parts = path.split("/");
        ArrayList stack = new ArrayList();
        for (int i = 0; i < parts.length; i++) {
            String q = parts[i];
            if (q.length() == 0 || q.equals(".")) continue;
            if (q.equals("..")) {
                if (!stack.isEmpty()) stack.remove(stack.size() - 1);
                continue;
            }
            stack.add(q);
        }
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < stack.size(); i++) sb.append('/').append((String) stack.get(i));
        return sb.length() == 0 ? "/" : sb.toString();
    }

    /**
     * Entry -> song, three ways, each tried only where the one before found nothing:
     *   - the path, exactly (one indexed query) and then ignoring case — FAT does not care about
     *     case, and a list written on a PC often spells a folder differently;
     *   - the file name alone, anywhere in the library — a list is often written next to its songs
     *     (VLC does) and then moved, so its paths point nowhere;
     *   - the #EXTINF text, "Artist - Title", against the tags.
     * The library is indexed once per import run, on the first entry that needs it.
     */
    public static final class Resolver {
        private final Y1Repository repo = repo();
        private HashMap byPath;      // lower path -> Song
        private HashMap byFile;      // lower file name -> List of Song
        private HashMap byInfo;      // lower "artist - title" -> List of Song
        private HashMap byTitle;     // lower title -> List of Song
        private final String stored = M3uBase.get();
        public final M3uBase.Learn learn = new M3uBase.Learn();

        /** The list's own base first, then the stored one, then every other shape. */
        Song byPath(String raw, String base) {
            List c = new ArrayList();
            M3uBase.strip(raw, base, c);
            if (!M3uBase.same(base, stored)) M3uBase.strip(raw, stored, c);
            c.addAll(candidates(raw));
            for (int i = 0; i < c.size(); i++) {
                Song s = repo.getSongByPathSync((String) c.get(i));
                if (s != null) return s;
            }
            build();
            for (int i = 0; i < c.size(); i++) {
                Object s = byPath.get(((String) c.get(i)).toLowerCase());
                if (s instanceof Song) return (Song) s;
            }
            return null;
        }

        /**
         * {@code vote} false answers only what is certain: one file of that name in the library,
         * or one of several sitting in a folder named as the entry's own ("…\2008 - Album\01 -
         * Intro.mp3" on a PC is ".../2008 - Album/01 - Intro.mp3" on the card).
         */
        Song byName(String raw, HashMap dirs, boolean vote) {
            build();
            String path = pct(raw).replace('\\', '/');
            List l = (List) byFile.get(last(path).toLowerCase());
            if (l == null || l.isEmpty()) return null;
            if (l.size() == 1) return (Song) l.get(0);
            String folder = last(parent(path)).toLowerCase();
            if (folder.length() > 0) {
                Song only = null;
                int hits = 0;
                for (int i = 0; i < l.size(); i++) {
                    Song s = (Song) l.get(i);
                    if (folder.equals(last(parent(s.getPath())).toLowerCase())) {
                        only = s;
                        hits++;
                    }
                }
                if (hits == 1) return only;
            }
            return vote ? pick(l, dirs) : null;
        }

        Song byInfo(String info, HashMap dirs) {
            if (info == null || info.length() == 0) return null;
            build();
            String low = key(info);
            Song s = pick((List) byInfo.get(low), dirs);
            if (s != null) return s;
            // the artist part is written differently more often than the title: try the title
            // after each " - ", as long as it names one song only or the vote settles it
            int k = low.indexOf(" - ");
            while (k >= 0) {
                s = pick((List) byTitle.get(low.substring(k + 3).trim()), dirs);
                if (s != null) return s;
                k = low.indexOf(" - ", k + 3);
            }
            return null;
        }

        /** One candidate: that one. Several: the one in the folder most of the list was found in. */
        private static Song pick(List l, HashMap dirs) {
            if (l == null || l.isEmpty()) return null;
            if (l.size() == 1) return (Song) l.get(0);
            Song best = null;
            int top = 0;
            for (int i = 0; i < l.size(); i++) {
                Song s = (Song) l.get(i);
                Integer c = (Integer) dirs.get(parent(s.getPath()));
                int v = c == null ? 0 : c.intValue();
                if (v > top) {
                    top = v;
                    best = s;
                }
            }
            return best;       // null when nothing tells them apart: better missing than wrong
        }

        private static String key(String s) {
            return s.toLowerCase().replace(';', ',').replaceAll("\\s+", " ").trim();
        }

        private static void add(HashMap m, String k, Object o) {
            if (k == null || k.length() == 0) return;
            List l = (List) m.get(k);
            if (l == null) {
                l = new ArrayList();
                m.put(k, l);
            }
            l.add(o);
        }

        private void build() {
            if (byPath != null) return;
            byPath = new HashMap();
            byFile = new HashMap();
            byInfo = new HashMap();
            byTitle = new HashMap();
            for (int k = 0; k <= 1; k++) {
                List all = repo.getSongsSync(k);
                for (int i = 0; all != null && i < all.size(); i++) {
                    Object o = all.get(i);
                    if (!(o instanceof Song)) continue;
                    Song s = (Song) o;
                    String path = s.getPath();
                    if (path == null) continue;
                    byPath.put(path.toLowerCase(), o);
                    add(byFile, last(path).toLowerCase(), o);
                    String title = clean(Other.INSTANCE.unNamed(s.getSongName()));
                    if (title.length() == 0) continue;
                    String artist = clean(Other.INSTANCE.unNamed(s.getArtist()));
                    add(byTitle, key(title), o);
                    if (artist.length() > 0) add(byInfo, key(artist + " - " + title), o);
                }
            }
        }
    }
}
