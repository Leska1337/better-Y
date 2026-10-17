package com.innioasis.ipp;

import android.content.Context;

import com.innioasis.y1.Y1Application;

import java.io.File;
import java.io.FileInputStream;
import java.util.HashMap;

/**
 * The per-path tag table {@code ipp_meta.txt} that a library scanned before the tag columns has
 * instead of them. Read only by {@link Schema#backfill}, which fills the rows from it once and
 * then {@link #drop}s it; nothing writes it.
 */
public final class MetaCache {

    private MetaCache() { }

    private static final HashMap map = new HashMap();   // song path -> String[FIELDS]
    private static boolean loaded;

    private static final int FIELDS = 5;
    private static final char SEP = '\t';
    private static final String VER = "#v1";

    private static File file() {
        Context c = Y1Application.Companion.getAppContext();
        if (c == null) return null;
        File d = c.getCacheDir();
        return d == null ? null : new File(d, "ipp_meta.txt");
    }

    /** Null when the table has no line for this file. */
    public static synchronized Meta.Info get(String path) {
        if (path == null) return null;
        load();
        String[] v = (String[]) map.get(path);
        if (v == null) return null;
        Meta.Info i = new Meta.Info();
        i.ok = true;
        i.albumArtist = v[0];
        i.track = v[1];
        i.disc = v[2];
        i.year = v[3];
        i.date = v[4];
        return i;
    }

    private static void load() {
        if (loaded) return;
        loaded = true;
        try {
            File f = file();
            if (f == null || !f.exists()) return;
            FileInputStream in = new FileInputStream(f);
            byte[] b = new byte[in.available()];
            in.read(b);
            in.close();
            String[] lines = new String(b, "UTF-8").split("\n");
            if (lines.length == 0 || !VER.equals(lines[0].trim())) return;
            for (int i = 1; i < lines.length; i++) {
                String[] p = lines[i].split(String.valueOf(SEP), -1);
                if (p.length != FIELDS + 1 || p[0].length() == 0) continue;
                String[] v = new String[FIELDS];
                for (int k = 0; k < FIELDS; k++) v[k] = p[k + 1].length() == 0 ? null : p[k + 1];
                map.put(p[0], v);
            }
        } catch (Throwable t) {
        }
    }

    /** The table and its file, once the rows have what it held. */
    public static synchronized void drop() {
        map.clear();
        loaded = true;
        try {
            File f = file();
            if (f != null) f.delete();
        } catch (Throwable t) {
        }
    }
}
