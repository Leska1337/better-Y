package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.PorterDuff;
import android.graphics.drawable.GradientDrawable;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import com.innioasis.music.SearchActivity;
import com.innioasis.music.adapter.rv.RVBaseAdapter;
import com.innioasis.music.data.Album;
import com.innioasis.music.util.Other;
import com.innioasis.music.util.SubMenuDialog;
import com.innioasis.y1.R;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.databinding.ActivitySearchBinding;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Hashtable;
import java.util.List;
import java.util.Locale;

/**
 * The Search screen: its rows, its long-press menu.
 *
 * Stock drew a result row from a background thread it started on EVERY bind: the song row's cover,
 * and the album row's cover, title AND subtitle. So scrolling showed rows whose text arrived a
 * thread hop after the row itself, and covers that were decoded again for every row that scrolled
 * past — with the decoded bitmap parked on the Item and thrown away again by the adapter's own
 * "±10 rows" cleanup. That is the blinking.
 *
 * Everything a row can answer from memory is written on the calling thread, exactly the shape the
 * album list already has (`AlbumListAdapter.getView`): the texts always, the cover from
 * {@link CoverCache} when it is there and the placeholder when it is not, and only a genuine cache
 * miss starts a thread — one per row subject per session, not one per bind.
 *
 * The other fixes carried over from the sections that already have them: the song title obeys
 * "Show titles from tags" ({@link Ipp#songTitle}), the artist line reads "; " as ", ", an ALBUM name is not a file name so it does not go through `processFileExtensions`
 * — that would cut "Vol.2" down to "Vol" — and a name shared by several folders is
 * several rows ({@link Albums#splitAlbums}).
 */
public final class Find {

    private Find() {}

    /**
     * From {@code initView} of both search screens (one layout): the magnifier's plate in the
     * menu's background, the magnifier — one flat shape — tinted its text colour.
     */
    public static void head(ActivitySearchBinding b) {
        if (b == null) return;
        try {
            menuPlate(b.iconBg);
            b.icon.setColorFilter(Icons.menuText(false), PorterDuff.Mode.SRC_IN);
        } catch (Throwable t) {
            // stock colours stay
        }
    }

    /** From both search screens' view holder constructors: the plate behind a result thumbnail. */
    public static void plate(View row) {
        if (row == null) return;
        try {
            menuPlate(row.findViewById(R.id.icon_bg));
        } catch (Throwable t) {
            // stock navy stays
        }
    }

    private static void menuPlate(View v) {
        if (v == null) return;
        GradientDrawable g = new GradientDrawable();
        g.setColor(Icons.menuBackground());
        g.setCornerRadius(8 * v.getResources().getDisplayMetrics().density);
        v.setBackgroundDrawable(g);
    }

    /** The list thumbnail size, the one {@link CoverCache} stores. */
    private static final int THUMB = 50;

    /** album key -> its song count and representative path. Dropped with the library. */
    private static final Hashtable infos = new Hashtable();

    /** keys a background read has already been started for (album keys and track paths). */
    private static final Hashtable reading = new Hashtable();

    /**
     * Track path -> its OWN 50px artwork, or {@link #SAME} when it has none of its own and the
     * album's thumbnail is the right picture. Memory only and bounded: a search list is short and
     * scrolled once, and the expensive half of the answer (BigCover's per-track note) is persisted
     * anyway.
     */
    private static final Hashtable own = new Hashtable();
    private static final Object SAME = new Object();
    private static final int OWN_MAX = 32;

    /** Called from {@link Albums#invalidate()}, i.e. from every write to the Song table. */
    public static void clear() {
        infos.clear();
        reading.clear();
        own.clear();
    }

    // ------------------------------------------------------------------ the two row kinds

    public static void songRow(ImageView icon, TextView title, TextView info, Song song, Bitmap def) {
        if (song == null) return;
        if (title != null) {
            // the tag title when "Show titles from tags" is on, the file name otherwise.
            // unNamed() around it because a tagless song's name is Constant.UNKNOWN, not "".
            String t = Ipp.songTitle(title.getContext(), song.getSongName(), song.getName());
            title.setText(Other.INSTANCE.unNamed(t));
        }
        // "; " reads as ", ", the same substitution every other song row makes.
        if (info != null) info.setText(Other.INSTANCE.unNamed(Artists.display(song.getArtist())));
        songCover(icon, song, def);
    }

    public static void albumRow(ImageView icon, TextView title, TextView info, Album album, Bitmap def) {
        if (album == null) return;
        String name = album.getName();
        // an album name is not a file name — no extension stripping here. albumLabel is
        // what every other album row in the mod shows: the real name out of the encoded key
        //, plus the year when "Show album year" is on — which is also what tells two
        // same-named albums apart now that they are separate rows.
        if (title != null) title.setText(Other.INSTANCE.unNamed(Prefs.albumLabel(name)));
        Info in = infoOf(name);
        if (info != null) info.setText(label(info.getContext(), in));
        albumCover(icon, name, in == null ? null : in.path, def);
    }

    // ------------------------------------------------------------------ the covers

    /**
     * An album row shows the album's thumbnail — the very entry the Albums screen caches, so the
     * two screens share one decode.
     */
    private static void albumCover(ImageView icon, String key, String path, Bitmap def) {
        if (icon == null) return;
        Bitmap b = null;
        if (key != null) {
            try {
                b = CoverCache.peek(key);
            } catch (Throwable t) {
                b = null;
            }
        }
        icon.setTag(key);
        icon.setImageBitmap(b != null ? b : def);
        if (b != null || key == null || path == null) return;
        if (start(key)) new Thread(new AlbumRead(icon, key, path, def)).start();
    }

    /**
     * A SONG row shows THAT SONG's artwork, not its album's — a compilation, a folder of singles
     * or one track carrying a cover of its own were all drawn with the album's picture, which is
     * the same rule the Now-Playing cover follows, at 50px.
     *
     * The album's thumbnail is still what goes up instantly: for the overwhelming majority of
     * tracks it IS the track's picture, so painting it costs no read and nothing swaps afterwards.
     * The background pass then asks {@link BigCover} — whose per-track note ("no artwork" / "the
     * same picture as this folder's representative" / "its own") is persisted and is exactly the
     * question being asked here — and only a track noted as having its own artwork is read at 50px
     * and repainted. A track whose note is already there costs one map lookup and no file at all.
     */
    private static void songCover(ImageView icon, Song song, Bitmap def) {
        if (icon == null) return;
        String path = song.getPath();
        String key = Albums.keyOf(song);
        Object t = path == null ? null : own.get(path);
        Bitmap b = (t instanceof Bitmap) ? (Bitmap) t : null;
        if (b == null) {
            try {
                b = CoverCache.peek(key);
            } catch (Throwable e) {
                b = null;
            }
        }
        icon.setTag(path);
        icon.setImageBitmap(b != null ? b : def);
        if (path == null || t != null) return;      // already resolved: its own picture, or SAME
        if (start(path)) new Thread(new TrackRead(icon, key, path, def)).start();
    }

    /** True when this key's background read has not been started yet — and claims it. */
    private static boolean start(String key) {
        if (reading.containsKey(key)) return false;
        reading.put(key, key);
        return true;
    }

    private static final class AlbumRead implements Runnable {
        private final ImageView icon;
        private final String key;
        private final String path;
        private final Bitmap def;

        AlbumRead(ImageView icon, String key, String path, Bitmap def) {
            this.icon = icon;
            this.key = key;
            this.path = path;
            this.def = def;
        }

        public void run() {
            Bitmap b = null;
            try {
                b = CoverCache.get(key, path);
            } catch (Throwable t) {
                b = null;
            }
            if (b == null) return;              // no artwork: the placeholder is already on the row
            post(icon, key, b, def);
        }
    }

    private static final class TrackRead implements Runnable {
        private final ImageView icon;
        private final String key;
        private final String path;
        private final Bitmap def;

        TrackRead(ImageView icon, String key, String path, Bitmap def) {
            this.icon = icon;
            this.key = key;
            this.path = path;
            this.def = def;
        }

        public void run() {
            Bitmap mine = trackArt(path);
            if (own.size() > OWN_MAX) own.clear();
            own.put(path, mine == null ? SAME : mine);
            Bitmap show = mine;
            if (show == null) {
                try {
                    show = CoverCache.get(key, path);   // the album's, read now if it was missing
                } catch (Throwable t) {
                    show = null;
                }
            }
            if (show == null) return;           // nothing anywhere: the placeholder stands
            post(icon, path, show, def);
        }
    }

    /**
     * The track's own 50px artwork, or null when it has none of its own.
     *
     * {@link BigCover#track} is what settles the question the first time — it reads the file, com-
     * pares the picture against the folder's representative and writes the answer down — so this
     * costs one metadata open per track ever, in the background. The thumbnail itself is then read
     * from the ORIGINAL rather than scaled down from BigCover's 300px JPEG: a thumbnail is never
     * made from another compressed copy anywhere in this cache (skill `ipp-covers`).
     */
    private static Bitmap trackArt(String path) {
        try {
            if (BigCover.knownNone(path)) return null;
            if (BigCover.needs(path)) BigCover.track(path);
            if (!BigCover.ownArt(path)) return null;
            Bitmap raw = Other.INSTANCE.getAlbumCover(path, THUMB, THUMB);
            if (raw == null) return null;
            Bitmap sq = Cover.square(raw, THUMB);
            return sq != null ? sq : raw;
        } catch (Throwable t) {
            return null;
        }
    }

    /**
     * The ImageView carries the key it is showing, so a read that comes back after its row has been
     * recycled onto another result is dropped instead of putting one song's cover on another's row.
     */
    private static void post(ImageView icon, String tag, Bitmap bmp, Bitmap def) {
        try {
            icon.post(new Paint(icon, tag, bmp, def));
        } catch (Throwable t) {
            // the row is gone; the next bind answers from the cache
        }
    }

    private static final class Paint implements Runnable {
        private final ImageView icon;
        private final String tag;
        private final Bitmap bmp;
        private final Bitmap def;

        Paint(ImageView icon, String tag, Bitmap bmp, Bitmap def) {
            this.icon = icon;
            this.tag = tag;
            this.bmp = bmp;
            this.def = def;
        }

        public void run() {
            if (!tag.equals(icon.getTag())) return;
            icon.setImageBitmap(bmp != null ? bmp : def);
        }
    }

    // ------------------------------------------------------------------ "<n> songs"

    private static final class Info {
        int n;
        String path;
    }

    /**
     * How many songs the album holds and which of them stands for it — taken from
     * {@link Albums#songsOf}, i.e. off the cached Song table the album lists are already built
     * from, so the row needs no query of its own and the folder-encoded key is honoured.
     * Memoised per key, because a bind must not walk the library.
     *
     * The representative is the FIRST song in path order, the same one `Albums.songsSync` hands
     * the album row, so the cover read finds what the Albums screen would have cached.
     */
    private static Info infoOf(String key) {
        if (key == null) return null;
        Object o = infos.get(key);
        if (o != null) return (Info) o;
        List songs;
        try {
            songs = Albums.songsOf(key);
        } catch (Throwable t) {
            songs = null;
        }
        if (songs == null) return null;         // not memoised: the next bind tries again
        Info in = new Info();
        in.n = songs.size();
        if (in.n > 0) {
            Song s = (Song) songs.get(0);
            if (s != null) in.path = s.getPath();
        }
        infos.put(key, in);
        return in;
    }

    private static String label(Context c, Info in) {
        if (c == null) return "";
        String word = c.getString(R.string.music_songs);
        // Stock concatenated the number straight onto the word ("12Songs"); every locale's value is
        // the bare noun, so the space belongs here.
        return (in == null ? 0 : in.n) + " " + word;
    }

    // ------------------------------------------------------------------ what the search matches

    /**
     * The song half of the search, widened from the file name to the TAGS.
     *
     * Stock matches one column: {@code lowerName}, the file name lowercased
     * ({@code where isAudiobook = 0 and lowerName like ?}). So a track whose tag says "Numb" while
     * the file is called `03.mp3` could not be found at all, and neither could an artist.
     *
     * Done in Java over {@link Albums#allSongs()} — the cached Song table the album lists are
     * already built from, and the very list this screen's album half has just walked — rather than
     * by widening the SQL, for two reasons: there is no lowercased column for the title or the
     * artist, and SQLite's {@code like}/{@code lower()} fold ASCII only, so a Cyrillic query would
     * have matched only tags that happen to be capitalised the same way. {@link String#toLowerCase}
     * folds every alphabet.
     *
     * The album tag is deliberately NOT matched here: an album that matches is already a row of its
     * own above the songs, and adding all of its tracks under it would say the same thing twice.
     *
     * Returns null when the cached list is unavailable, and the stock query stands.
     */
    public static List songs(String key) {
        if (key == null) return null;
        String k = key.toLowerCase(Locale.ROOT).trim();
        if (k.length() == 0) return null;
        List all;
        try {
            all = Albums.allSongs();
        } catch (Throwable t) {
            all = null;
        }
        if (all == null) return null;
        ArrayList out = new ArrayList();
        for (int i = 0; i < all.size(); i++) {
            Song s = (Song) all.get(i);
            if (s == null) continue;
            if (hit(unnumbered(s.getName()), k) || hit(s.getSongName(), k) || hit(s.getArtist(), k)) {
                out.add(s);
            }
        }
        Collections.sort(out, NAME_CMP);        // stock's own order: lower(pinyinName)
        return out;
    }

    /**
     * An untagged song does not carry an empty string, it carries {@code Constant.UNKNOWN} —
     * "<unknown>" behind four U+FFE6 — so without this every one of them would answer to a
     * search for "unknown".
     */
    /**
     * A file name without the track number in front of it.
     *
     * The file name is what stock searches, and on a properly named library nearly every one of
     * them opens with the position on the disc — so "01" matched a track of every album at once and
     * a two-digit query was useless. Two written forms are recognised, both only at the START:
     * bare digits ({@code 01 - Song}) and digits in brackets ({@code (01) Song}). A number anywhere
     * else is part of the name ("Song 2", "Blink 182") and still matches. A name that is nothing
     * but its number is left as it is — stripping it would leave nothing to search.
     */
    private static String unnumbered(String name) {
        if (name == null || name.length() == 0) return name;
        int i = 0;
        if (name.charAt(0) == '(') {
            int j = 1;
            while (j < name.length() && digit(name.charAt(j))) j++;
            if (j > 1 && j < name.length() && name.charAt(j) == ')') i = j + 1;
        } else {
            while (i < name.length() && digit(name.charAt(i))) i++;
        }
        if (i == 0) return name;
        while (i < name.length()) {
            char c = name.charAt(i);
            if (c == ' ' || c == '.' || c == '-' || c == '_') i++; else break;
        }
        return i >= name.length() ? name : name.substring(i);
    }

    private static boolean digit(char c) {
        return c >= '0' && c <= '9';
    }

    private static boolean hit(String value, String lowerKey) {
        if (value == null || value.length() == 0) return false;
        if (value.equals(com.innioasis.music.objects.Constant.UNKNOWN)) return false;
        return value.toLowerCase(Locale.ROOT).indexOf(lowerKey) >= 0;
    }

    private static final Comparator NAME_CMP = new NameCmp();

    private static final class NameCmp implements Comparator {
        public int compare(Object a, Object b) {
            String x = ((Song) a).getPinyinName();
            String y = ((Song) b).getPinyinName();
            x = x == null ? "" : x.toLowerCase(Locale.ROOT);
            y = y == null ? "" : y.toLowerCase(Locale.ROOT);
            return x.compareTo(y);
        }
    }

    // ------------------------------------------------------------------ the long-press menu

    /**
     * Built per long press, right before {@code show()}, the way `Albums.songMenu` is — the dialog
     * is a lazy singleton but the list it should show depends on the row under the cursor.
     *
     * The first three entries are stock's `Constant.SubMenuList` in stock's order, because this
     * screen's callback dispatches those BY INDEX (0/1 = multi-select, 2 = delete, anything past
     * that = a playlist). They are built from the string resources rather than copied out of that
     * list: it is filled in `MusicMainActivity.initView` and would be empty on any path that did
     * not go through the Music menu. The two ipp entries are matched by string in front of the
     * index dispatch.
     */
    public static void menu(SubMenuDialog dlg, Activity a, RVBaseAdapter adapter) {
        if (dlg == null || a == null) return;
        menuDlg = dlg;
        ArrayList l = new ArrayList();
        l.add(a.getString(R.string.music_multi_select));
        l.add(a.getString(R.string.all_select));
        l.add(a.getString(R.string.music_delete_file));
        l.add(a.getString(R.string.ipp_queue_add));
        // Both only on a song row: the album row IS the album, and the centre press already opens
        // it. Same rule the flat song lists follow, artist above album as everywhere.
        if (Artists.of(songOf(adapter)) != null) l.add(a.getString(R.string.ipp_open_artist));
        if (songOf(adapter) != null) l.add(a.getString(R.string.ipp_open_album));
        dlg.setList(l);
        dlg.addPlaylistsToOptions();            // setList dropped them, and it refreshes the set
    }

    /** The dialog {@link #menu} last built, so the artist submenu can dismiss it on its pick. */
    private static SubMenuDialog menuDlg;

    /**
     * "Open artist" — the artist's album list. Answers what {@code select} means: false leaves this
     * menu up behind the "which of these artists?" submenu, which dismisses it itself.
     */
    public static boolean openArtist(Activity a, RVBaseAdapter adapter) {
        Song s = songOf(adapter);
        if (s == null) return true;
        List sel = adapter.getMultiSelectIndexes();
        if (sel != null && !sel.isEmpty()) {
            sel.clear();
            adapter.notifyDataSetChanged();
        }
        return Artists.openFrom(a, menuDlg, s);
    }

    /** "Open album" — the album the focused song belongs to, landing on that song. */
    public static void openAlbum(Activity a, RVBaseAdapter adapter) {
        Song s = songOf(adapter);
        if (s == null) return;
        List sel = adapter.getMultiSelectIndexes();
        if (sel != null && !sel.isEmpty()) {
            sel.clear();
            adapter.notifyDataSetChanged();
        }
        Albums.openAlbumOfSong(a, s);
    }

    /** The song under the cursor, or null when the focused row is an album (or there is none). */
    private static Song songOf(RVBaseAdapter adapter) {
        if (adapter == null) return null;
        Object o = adapter.getSelectItem();
        if (!(o instanceof SearchActivity.Item)) return null;
        return ((SearchActivity.Item) o).getSong();
    }
}
