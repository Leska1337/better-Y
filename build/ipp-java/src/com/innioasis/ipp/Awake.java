package com.innioasis.ipp;

import android.app.Activity;
import android.view.WindowManager;

import com.innioasis.y1.base.BasePlayerActivity;
import com.innioasis.y1_eBook.ui.epub.EpubActivity;
import com.innioasis.y1_eBook.ui.pdf.PdfActivity;
import com.innioasis.y1_eBook.ui.text.TextActivity;
import com.innioasis.y1_eBook.ui.word.WordActivity;

/**
 * Keeps the screen on while there is something to read — the player's Lyrics window and an open
 * book — and nowhere else ("keep_awake"). A window flag rather than a WakeLock, so it cannot leak.
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
        }
    }

    /** From {@code BasePlayerActivity.ippToggleLyric}, so the flag follows the window both ways. */
    public static void lyrics(Activity a) {
        if (!(a instanceof BasePlayerActivity)) return;
        boolean open = ((BasePlayerActivity) a).ippLyricOpen();
        set(a, open && enabled(a));
    }

    /**
     * From the e-book {@code BaseActivity.onCreate}; the readers are named because the library
     * screen shares that base and must not hold the screen on.
     */
    public static void book(Activity a) {
        boolean reading = a instanceof TextActivity || a instanceof EpubActivity
                || a instanceof PdfActivity || a instanceof WordActivity;
        if (reading && enabled(a)) set(a, true);
    }
}
