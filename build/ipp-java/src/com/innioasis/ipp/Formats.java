package com.innioasis.ipp;

import java.util.ArrayList;
import java.util.List;

/**
 * Audio extensions stock does not list, added where it builds its lists: the library filter
 * ({@code Y1Repository.endIsMusic}/{@code endIsAudiobook}) and the files ffmpeg plays
 * ({@code PlayerService.formatListForIjk}). Opus, an Ogg under {@code .oga} and an m4a audiobook.
 */
public final class Formats {

    private Formats() { }

    private static final String[] EXTRA = {"opus", "oga", "m4b"};

    /** Stock's list plus ours; stock's is immutable, so a copy. */
    public static List more(List stock) {
        ArrayList out = new ArrayList(stock == null ? EXTRA.length : stock.size() + EXTRA.length);
        if (stock != null) out.addAll(stock);
        for (int i = 0; i < EXTRA.length; i++) {
            if (!out.contains(EXTRA[i])) out.add(EXTRA[i]);
        }
        return out;
    }
}
