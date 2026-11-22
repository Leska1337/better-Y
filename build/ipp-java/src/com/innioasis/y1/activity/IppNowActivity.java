package com.innioasis.y1.activity;

import android.graphics.Bitmap;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.os.Handler;
import android.os.Looper;
import android.text.TextPaint;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ProgressBar;
import android.widget.TextView;

import com.innioasis.fm.configs.KeyMap;
import com.innioasis.ipp.Audio;
import com.innioasis.ipp.BigCover;
import com.innioasis.ipp.Cover;
import com.innioasis.ipp.Deck;
import com.innioasis.ipp.Feat;
import com.innioasis.ipp.Force;
import com.innioasis.ipp.Help;
import com.innioasis.ipp.Ipp;
import com.innioasis.ipp.Prefs;
import com.innioasis.ipp.Queue;
import com.innioasis.ipp.Scroll;
import com.innioasis.ipp.Tint;
import com.innioasis.ipp.TipDialog;
import com.innioasis.ipp.Tone;
import com.innioasis.music.util.Other;
import com.innioasis.y1.R;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.base.BasePlayerActivity;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.service.PlayerService;
import com.innioasis.y1.utils.TimeUtils;

import me.wcy.lrcview.LrcView;

/**
 * Now Playing's Style preview: the player's own screen with no playback of its own. Left/right pick
 * a category, the wheel its value, shown live and written at once, so the top button keeps what is
 * on screen. Nothing playing: the placeholder cover and the asset's placeholder lines.
 * Must not call {@code super.refreshUI()}: it waits on a thread until a song is prepared.
 */
public final class IppNowActivity extends BasePlayerActivity {

    /** The menu row that opens this screen. */
    public static final String KEY_STYLE = "np_style";

    private static final String[] CATS = {"icon_tint", Tint.KEY_TEXT, Tint.KEY_BOX, Cover.KEY_TILT,
            Tint.KEY_LYRICS};
    private static final int[] COUNTS = {3, 3, 4, 2, 3};
    private static final int LYRICS = 4;
    private static final int TILT = 3;
    /** Placeholder lines: their asset row, values Title, Artist, Album, Lyrics. */
    private static final String BLANK = "np_blank";
    /** The screensaver's hint, under the flag every Style preview shares. */
    private static final String TIP = "ss_tip";
    private static final String TIP_OFF = TipDialog.STYLE_OFF;
    private static final String ZERO = "00:00";
    private static final String NO_TIME = "99:59:59";
    private static final int BAND_H = 45;
    private static final int BAND_W = 460;

    private final Handler ui = new Handler(Looper.getMainLooper());
    private TextView band;
    private TipDialog tip;
    private int cat;
    private int down = -1;
    /** The playing track's path and its cover's source, kept for a redraw in the other look. */
    private String path;
    private Bitmap src;

    @Override
    public void initView() {
        super.initView();
        band = new TextView(this);
        band.setGravity(Gravity.CENTER);
        band.setTextColor(0xFFFFFFFF);
        band.setTypeface(Typeface.MONOSPACE, Typeface.BOLD);
        band.setSingleLine(true);
        band.setBackgroundColor(0xB3000000);
        addContentView(band, new FrameLayout.LayoutParams(-1, BAND_H, Gravity.TOP));
        refreshUI();
        bands();
        tip = TipDialog.show(this, TIP, TIP_OFF);
    }

    @Override
    protected void onStop() {
        super.onStop();
        finish();
    }

    @Override
    protected void onDestroy() {
        ui.removeCallbacksAndMessages(null);
        try {
            if (tip != null && tip.isShowing()) tip.dismiss();
        } catch (Throwable t) {
        }
        tip = null;
        src = null;
        super.onDestroy();
    }

    @Override
    public void longPressEnter() {
    }

    @Override
    public void longPressMenu() {
    }

    @Override
    public boolean dispatchKeyEvent(KeyEvent e) {
        if (e == null) return true;
        if (Force.key(e)) return true;
        int code = e.getKeyCode();
        KeyMap k = KeyMap.INSTANCE;
        if (e.getAction() == KeyEvent.ACTION_DOWN) {
            Tone.key(e);
            if (e.getRepeatCount() == 0) down = code;
            if (code == k.getKEY_UP() || code == k.getKEY_DOWN()) {
                change(code == k.getKEY_DOWN() ? 1 : -1);
            } else if (e.getRepeatCount() == 0 && (code == k.getKEY_LEFT() || code == k.getKEY_RIGHT())) {
                cat = (cat + (code == k.getKEY_RIGHT() ? 1 : -1) + CATS.length) % CATS.length;
                bands();
            }
            return true;
        }
        if (e.getAction() == KeyEvent.ACTION_UP && code == down) {
            down = -1;
            if (code == k.getKEY_MENU()) finish();
        }
        return true;
    }

    // ---- categories -------------------------------------------------------------------------

    private int current(int c) {
        if (c == TILT) return Prefs.on(this, Cover.KEY_TILT) ? 1 : 0;
        int v = Prefs.val(this, CATS[c]);
        return v < 0 || v >= COUNTS[c] ? 0 : v;
    }

    private void change(int step) {
        int n = COUNTS[cat];
        int v = (current(cat) + step + n) % n;
        if (cat == TILT) Prefs.setBool(this, Cover.KEY_TILT, v == 1);
        else Prefs.setInt(this, CATS[cat], v);
        Tint.player(this);
        Deck.render(this);
        if (cat == TILT) showCover();
        bands();
    }

    /** The band in place of the status bar; the lyrics window stands while its colour is chosen. */
    private void bands() {
        boolean lyrics = cat == LYRICS;
        show(R.id.cl_lyric, lyrics);
        show(R.id.cl_player_center, !lyrics);
        if (band == null) return;
        String key = CATS[cat];
        Help.Row r = Help.row(this, key);
        String name = r != null && r.label != null ? r.label : key;
        int v = current(cat);
        String val;
        if (cat == TILT) val = getString(v == 1 ? R.string.ipp_on : R.string.ipp_off);
        else if (r != null && r.values != null && v < r.values.length) val = r.values[v];
        else val = String.valueOf(v + 1);
        String text = "‹  " + name + ": " + val + "  ›";
        fit(band, 22, text, BAND_W, BAND_H - 4);
        band.setText(text);
    }

    private void show(int id, boolean on) {
        View v = ((android.app.Activity) this).findViewById(id);
        if (v != null) v.setVisibility(on ? View.VISIBLE : View.GONE);
    }

    /** From {@code px} down until {@code sample} fits {@code maxW} and a line {@code maxH}: theme fonts run large. */
    private static void fit(TextView t, float px, String sample, int maxW, int maxH) {
        TextPaint p = new TextPaint(t.getPaint());
        float s = px;
        for (; s > 8; s -= 1) {
            p.setTextSize(s);
            Paint.FontMetrics fm = p.getFontMetrics();
            if (p.measureText(sample) <= maxW && fm.descent - fm.ascent <= maxH) break;
        }
        t.setTextSize(TypedValue.COMPLEX_UNIT_PX, s);
    }

    // ---- the player's lines -----------------------------------------------------------------

    /** Also on every MY_PLAY_SONG, through stock's receiver. */
    @Override
    public void refreshUI() {
        Deck.render(this);
        String[] blank = blanks();
        lyrics(blank[3]);
        PlayerService ps = Y1Application.Companion.getPlayerService();
        Song s = ps == null ? null : ps.getPlayingSong();
        TextView title = tv(R.id.tv_bookname);
        TextView heading = tv(R.id.tv_song_name2);
        TextView artist = tv(R.id.tv_bookplayer);
        TextView album = tv(R.id.tv_album);
        TextView index = tv(R.id.tv_index_of_songs);
        if (s == null) {
            Scroll.marqueeText(title, blank[0]);
            Scroll.marqueeText(heading, blank[0]);
            Ipp.playerLine(artist, blank[1], false);
            Ipp.playerLine(album, blank[2], true);
            if (index != null) index.setText("0/0");
            time(ZERO);
            ProgressBar pb = (ProgressBar) ((android.app.Activity) this).findViewById(R.id.pb_player);
            if (pb != null) pb.setProgress(0);
            setPath(null);
            return;
        }
        try {
            if (s.getName() == null || s.getName().trim().length() == 0) {
                s = Y1Application.Companion.getY1Repository().fileToSong(new java.io.File(s.getPath()));
            }
        } catch (Throwable t) {
        }
        boolean book = s == ps.getPlayingAudiobook();
        String name = book ? Audio.title(this, s.getSongName(), s.getName())
                : Feat.title(Ipp.songTitle(this, s.getSongName(), s.getName()), s);
        Scroll.marqueeText(title, name);
        Scroll.marqueeText(heading, name);
        String a = Other.INSTANCE.unNamed(s.getArtist());
        Ipp.playerLine(artist, book ? a : Feat.artist(a, s), false);
        Ipp.playerLine(album, Other.INSTANCE.unNamed(s.getAlbum()), true);
        try {
            int size = book ? ps.getAudiobookList().size() : ps.getMusicList().size();
            if (index != null) index.setText(Queue.trackNo(ps) + "/" + size);
        } catch (Throwable t) {
        }
        String all = ps.getPlayerIsPrepared() ? TimeUtils.time(ps.getDuration()) : ZERO;
        TextView end = tv(R.id.tv_play_all);
        if (end != null && !NO_TIME.equals(all)) end.setText(all);
        setPath(s.getPath());
    }

    /** Both marks; the progress thread then keeps the elapsed one live while a song is prepared. */
    private void time(String t) {
        TextView now = tv(R.id.tv_play_now);
        TextView end = tv(R.id.tv_play_all);
        if (now != null) now.setText(t);
        if (end != null) end.setText(t);
    }

    private TextView tv(int id) {
        View v = ((android.app.Activity) this).findViewById(id);
        return v instanceof TextView ? (TextView) v : null;
    }

    private String[] blanks() {
        String[] out = {"Title", "Artist", "Album", "Lyrics"};
        Help.Row r = Help.row(this, BLANK);
        if (r != null && r.values != null) {
            for (int i = 0; i < out.length && i < r.values.length; i++) out[i] = r.values[i];
        }
        return out;
    }

    /** Never the song's own text: one sung line and two unsung show both colours. */
    private void lyrics(String word) {
        View v = ((android.app.Activity) this).findViewById(R.id.lyric_lv);
        if (!(v instanceof LrcView)) return;
        LrcView lrc = (LrcView) v;
        lrc.setLabel(word);
        lrc.loadLrc("[00:00.00]" + word + "\n[99:00.00]" + word + "\n[99:01.00]" + word);
    }

    // ---- cover ------------------------------------------------------------------------------

    private void setPath(String p) {
        if (p == null ? path != null : !p.equals(path)) {
            path = p;
            src = null;
        }
        if (p != null && src == null) {
            try {
                src = BigCover.peekTrack(p);
            } catch (Throwable t) {
            }
            if (src == null && !BigCover.knownNone(p)) {
                new Thread(new Load(this, p), "ipp-now-cover").start();
            }
        }
        showCover();
    }

    private void showCover() {
        Cover.preview(this, src);
    }

    static final class Load implements Runnable {
        private final IppNowActivity a;
        private final String p;

        Load(IppNowActivity a, String p) {
            this.a = a;
            this.p = p;
        }

        @Override
        public void run() {
            Bitmap b = null;
            try {
                b = BigCover.track(p);
            } catch (Throwable t) {
            }
            if (b != null) a.ui.post(new Got(a, p, b));
        }
    }

    static final class Got implements Runnable {
        private final IppNowActivity a;
        private final String p;
        private final Bitmap b;

        Got(IppNowActivity a, String p, Bitmap b) {
            this.a = a;
            this.p = p;
            this.b = b;
        }

        @Override
        public void run() {
            if (a.isFinishing() || !p.equals(a.path)) return;
            a.src = b;
            a.showCover();
        }
    }
}
