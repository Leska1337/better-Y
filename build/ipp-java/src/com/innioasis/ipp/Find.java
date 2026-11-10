package com.innioasis.ipp;

import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.PorterDuff;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
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
 * The Search screen: rows, matching, long-press menu. A row is written on the calling thread from
 * memory — texts always, the cover from {@link CoverCache} or the placeholder — and only a real
 * cache miss starts a thread, once per subject per session (stock started one per bind, which
 * blinked). An ALBUM name skips {@code processFileExtensions}, which cuts "Vol.2" to "Vol".
 */
public final class Find {

    private Find() {}

    /** {@code initView} of both search screens: the magnifier's plate and tint, menu colours. */
    public static void head(ActivitySearchBinding b) {
        if (b == null) return;
        try {
            menuPlate(b.iconBg);
            b.icon.setColorFilter(Icons.menuText(false), PorterDuff.Mode.SRC_IN);
        } catch (Throwable t) {
        }
    }

    /** Both screens' view holders: the plate behind a thumbnail. */
    public static void plate(View row) {
        if (row == null) return;
        try {
            menuPlate(row.findViewById(R.id.icon_bg));
        } catch (Throwable t) {
        }
    }

    private static void menuPlate(View v) {
        if (v == null) return;
        GradientDrawable g = new GradientDrawable();
        g.setColor(Icons.menuBackground());
        g.setCornerRadius(8 * v.getResources().getDisplayMetrics().density);
        v.setBackgroundDrawable(g);
    }

    private static final int THUMB = 50;

    /** album key -> its song count and representative path. */
    private static final Hashtable infos = new Hashtable();

    /** Keys a background read was started for (album keys and track paths). */
    private static final Hashtable reading = new Hashtable();

    /**
     * Track path -> its OWN 50px artwork, or {@link #SAME} when the album's thumbnail is right.
     * Memory only and bounded; BigCover's per-track note is the persisted half.
     */
    private static final Hashtable own = new Hashtable();
    private static final Object SAME = new Object();
    private static final int OWN_MAX = 32;

    /** From {@link Albums#invalidate()}. */
    public static void clear() {
        infos.clear();
        reading.clear();
        own.clear();
    }

    public static void songRow(ImageView icon, TextView title, TextView info, Song song, Bitmap def) {
        if (song == null) return;
        if (title != null) {
            String t = Ipp.songTitle(title.getContext(), song.getSongName(), song.getName());
            title.setText(Other.INSTANCE.unNamed(t));
        }
        if (info != null) info.setText(Other.INSTANCE.unNamed(Artists.display(song.getArtist())));
        songCover(icon, song, def);
    }

    public static void albumRow(ImageView icon, TextView title, TextView info, Album album, Bitmap def) {
        if (album == null) return;
        String name = album.getName();
        if (title != null) title.setText(Other.INSTANCE.unNamed(Prefs.albumLabel(name)));
        Info in = infoOf(name);
        if (info != null) info.setText(label(info.getContext(), in));
        albumCover(icon, name, in == null ? null : in.path, def);
    }

    /** The very entry the Albums screen caches: one decode for both screens. */
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
     * A SONG row shows that song's own artwork, as Now Playing does. The album's thumbnail goes up
     * at once (usually it IS the picture); {@link BigCover}'s persisted per-track note decides in
     * the background, and only a track with art of its own is read and repainted.
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
        if (path == null || t != null) return;      // already resolved
        if (start(path)) new Thread(new TrackRead(icon, key, path, def)).start();
    }

    /** Claims the key's background read; false when already started. */
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
            if (b == null) return;
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
                    show = CoverCache.get(key, path);
                } catch (Throwable t) {
                    show = null;
                }
            }
            if (show == null) return;
            post(icon, path, show, def);
        }
    }

    /**
     * Null when the track has no art of its own. {@link BigCover#track} settles that once per
     * track ever; the thumbnail is read from the ORIGINAL, never from BigCover's JPEG.
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

    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    /**
     * Dropped when the ImageView has been recycled onto another key meanwhile. Through the main
     * Handler, not {@code View.post}: from a worker that is lost while the row is detached.
     */
    private static void post(ImageView icon, String tag, Bitmap bmp, Bitmap def) {
        try {
            MAIN.post(new Paint(icon, tag, bmp, def));
        } catch (Throwable t) {
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

    private static final class Info {
        int n;
        String path;
    }

    /**
     * Off the cached table, memoised (a bind must not walk the library). The representative is
     * the first song in path order, as the album row's, so the cover read finds the same entry.
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
        if (songs == null) return null;         // not memoised
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
        // Every locale's value is the bare noun; the space belongs here.
        return (in == null ? 0 : in.n) + " " + word;
    }

    /**
     * The song half of the search: file name, title tag and artist (stock matched the file name
     * only). In Java, not SQL: SQLite folds ASCII only, so Cyrillic would miss. The album tag is
     * left out on purpose — a matching album is its own row above. Null = stock's query stands.
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
        Collections.sort(out, NAME_CMP);        // stock's order: lower(pinyinName)
        return out;
    }

    /**
     * Without a leading track number ({@code 01 - Song}, {@code (01) Song}), or "01" matches every
     * album. A number elsewhere is part of the name; a name that is only a number is kept.
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

    /** An untagged field is {@code Constant.UNKNOWN}, which must not answer a search for "unknown". */
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

    /**
     * Built per long press, before {@code show()}. The first three are stock's
     * {@code Constant.SubMenuList} in stock's order — the callback dispatches them BY INDEX — but
     * from the resources, since that list is empty unless the Music menu was passed through.
     */
    public static void menu(SubMenuDialog dlg, Activity a, RVBaseAdapter adapter) {
        if (dlg == null || a == null) return;
        menuDlg = dlg;
        ArrayList l = new ArrayList();
        l.add(a.getString(R.string.music_multi_select));
        l.add(a.getString(R.string.all_select));
        l.add(a.getString(R.string.music_delete_file));
        l.add(a.getString(R.string.ipp_queue_add));
        // Song rows only: an album row's centre press already opens it.
        if (Artists.of(songOf(adapter)) != null) l.add(a.getString(R.string.ipp_open_artist));
        if (songOf(adapter) != null) l.add(a.getString(R.string.ipp_open_album));
        dlg.setList(l);
        dlg.addPlaylistsToOptions();            // setList dropped them
    }

    /** For the artist submenu to dismiss on its pick. */
    private static SubMenuDialog menuDlg;

    /** As {@code select}'s result: false leaves this menu up under the artist submenu. */
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

    /** Lands on that song. */
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

    /**
     * The tail of the search adapters' toNext/toPrevious (music and video), the cursor already
     * moved: {@code Wheel.follow} onto a result row; onto the input line, only the row it left is
     * repainted. Stock's input-line painting runs after this.
     */
    public static void step(androidx.recyclerview.widget.RecyclerView lv,
            androidx.recyclerview.widget.RecyclerView.Adapter a, int old) {
        try {
            if (lv == null || a == null) return;
            int now = -1;
            if (a instanceof RVBaseAdapter) {
                now = ((RVBaseAdapter) a).getSelectPosition();
            } else if (a instanceof com.innioasis.y1.activity.video.adapter.RVBaseAdapter) {
                now = ((com.innioasis.y1.activity.video.adapter.RVBaseAdapter) a).getSelectPosition();
            }
            int n = a.getItemCount();
            // off the input line the row before is known: not the "unknown" a wrap is guessed from
            if (now >= 0 && now < n) {
                if (old < 0) Wheel.follow(lv, now, now, a);
                else Wheel.follow(lv, now, a);
            } else if (old >= 0 && old < n) {
                a.notifyItemChanged(old);
            }
        } catch (Throwable t) {
        }
    }

    /** Null on an album row. */
    private static Song songOf(RVBaseAdapter adapter) {
        if (adapter == null) return null;
        Object o = adapter.getSelectItem();
        if (!(o instanceof SearchActivity.Item)) return null;
        return ((SearchActivity.Item) o).getSong();
    }
}
