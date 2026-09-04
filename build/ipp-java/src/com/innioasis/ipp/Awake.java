package com.innioasis.ipp;

import android.app.Activity;
import android.view.WindowManager;

import com.innioasis.y1.base.BasePlayerActivity;
import com.innioasis.y1_eBook.ui.epub.EpubActivity;
import com.innioasis.y1_eBook.ui.pdf.PdfActivity;
import com.innioasis.y1_eBook.ui.text.TextActivity;
import com.innioasis.y1_eBook.ui.word.WordActivity;

/**
 * #230 — the screen does not go out while there is something on it to read: the Lyrics window of
 * the player, and an open book.
 *
 * Both are the same situation and neither is covered by the device's own timeout, which counts
 * from the last key press: reading is exactly the case where nothing is pressed for minutes, and
 * the screen goes out mid-verse. Everywhere else the timeout is right — a list, a menu or the
 * player's own face is looked at for seconds — so this is deliberately not a blanket "keep awake".
 *
 * {@code FLAG_KEEP_SCREEN_ON} rather than a WakeLock: it belongs to the window, so it cannot leak
 * (an Activity that dies takes it with it) and needs no permission.
 *
 * Gated by the pref "keep_awake", default off.
 */
public final class Awake {

    private Awake() { }

    private static boolean enabled(Activity a) {
        return Prefs.on(a, "keep_awake");
    }

    private static void set(Activity a, boolean on) {
        try {
            if (on) a.getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
            else a.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        } catch (Throwable t) {
            // no window yet is nothing to keep on
        }
    }

    /**
     * Called at the end of {@code BasePlayerActivity.ippToggleLyric} — the one place the Lyrics
     * window opens and closes — so the flag follows the window both ways within the same screen.
     * Leaving the player needs no counterpart: the Activity is finished, and the flag with it.
     */
    public static void lyrics(Activity a) {
        if (!(a instanceof BasePlayerActivity)) return;
        boolean open = ((BasePlayerActivity) a).ippLyricOpen();
        set(a, open && enabled(a));
    }

    /**
     * Called from {@code y1_eBook.base.BaseActivity.onCreate} — the base of every e-book screen,
     * which is why the four READER activities are named here explicitly: its library screen is a
     * list like any other and has no business holding the screen on.
     */
    public static void book(Activity a) {
        boolean reading = a instanceof TextActivity || a instanceof EpubActivity
                || a instanceof PdfActivity || a instanceof WordActivity;
        if (reading && enabled(a)) set(a, true);
    }
}
