package com.innioasis.ipp;

import java.io.RandomAccessFile;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

/**
 * Tags of an MP4 file (m4a, m4b, m4r — AAC and ALAC alike): the iTunes list moov/udta/meta/ilst.
 * Boxes are walked by header and stepped over with {@code seek}, so it costs the same whether moov
 * is in front of the audio or after it. Values are shaped as the platform shapes them: track and
 * disc as "n/total", gnre as the bare ID3 genre number, the day atom as the year, the creation
 * time as the date.
 */
final class Mp4 {

    private Mp4() { }

    private static final int MAX_TEXT = 64 * 1024;
    private static final int MAX_ART = 8 * 1024 * 1024;

    /** False when no moov was found. */
    static boolean read(String path, Meta.Info out, boolean wantArt) {
        RandomAccessFile f = null;
        try {
            f = new RandomAccessFile(path, "r");
            long end = f.length();
            long pos = 0;
            byte[] h = new byte[16];
            while (pos + 8 <= end) {
                Box b = box(f, pos, end, h);
                if (b == null) return false;
                if (b.type.equals("moov")) {
                    walk(f, b.body, b.end, out, wantArt, h, 0);
                    return true;
                }
                pos = b.end;
            }
            return false;
        } catch (Throwable t) {
            return false;
        } finally {
            try {
                if (f != null) f.close();
            } catch (Throwable t) {
            }
        }
    }

    private static final class Box {
        String type;
        long body;
        long end;
    }

    private static Box box(RandomAccessFile f, long pos, long limit, byte[] h) throws Exception {
        f.seek(pos);
        f.readFully(h, 0, 8);
        long size = be32(h, 0) & 0xffffffffL;
        int hdr = 8;
        if (size == 1) {
            f.readFully(h, 8, 8);
            size = be64(h, 8);
            hdr = 16;
        } else if (size == 0) {
            size = limit - pos;
        }
        if (size < hdr || pos + size > limit) return null;
        Box b = new Box();
        b.type = new String(h, 4, 4, "ISO-8859-1");
        b.body = pos + hdr;
        b.end = pos + size;
        return b;
    }

    /** Down moov/udta/meta/ilst (and moov/meta/ilst); the items are read inside ilst. */
    private static void walk(RandomAccessFile f, long pos, long end, Meta.Info out, boolean wantArt,
                             byte[] h, int depth) throws Exception {
        if (depth > 4) return;
        while (pos + 8 <= end) {
            Box b = box(f, pos, end, h);
            if (b == null) return;
            if (b.type.equals("mvhd") && depth == 0) {
                out.date = created(f, b.body, h);
            } else if (b.type.equals("udta")) {
                walk(f, b.body, b.end, out, wantArt, h, depth + 1);
            } else if (b.type.equals("meta")) {
                // a full box (version and flags first), except in some QuickTime files
                long in = b.body;
                f.seek(in + 4);
                f.readFully(h, 0, 4);
                if (!new String(h, 0, 4, "ISO-8859-1").equals("hdlr")) in += 4;
                walk(f, in, b.end, out, wantArt, h, depth + 1);
            } else if (b.type.equals("ilst")) {
                items(f, b.body, b.end, out, wantArt, h);
            }
            pos = b.end;
        }
    }

    /**
     * The movie's creation time, which the platform gives as the DATE: seconds since 1904 in UTC,
     * written "yyyyMMddTHHmmss.000Z" — the encoder's clock, not the album's date.
     */
    private static String created(RandomAccessFile f, long body, byte[] h) throws Exception {
        f.seek(body);
        f.readFully(h, 0, 12);
        long t;
        if (h[0] == 1) t = be64(h, 4);
        else t = be32(h, 4) & 0xffffffffL;
        SimpleDateFormat d = new SimpleDateFormat("yyyyMMdd'T'HHmmss'.000Z'", Locale.US);
        d.setTimeZone(TimeZone.getTimeZone("UTC"));
        return d.format(new Date((t - 2082844800L) * 1000L));
    }

    private static void items(RandomAccessFile f, long pos, long end, Meta.Info out, boolean wantArt,
                              byte[] h) throws Exception {
        while (pos + 8 <= end) {
            Box item = box(f, pos, end, h);
            if (item == null) return;
            pos = item.end;
            String t = item.type;
            boolean art = t.equals("covr");
            if (art && !wantArt) continue;
            if (!art && !wanted(t) && !(out.wantLyrics && t.equals("©lyr"))) continue;
            // the first "data" child: type indicator and locale, then the value
            Box data = box(f, item.body, item.end, h);
            if (data == null || !data.type.equals("data")) continue;
            long len = data.end - data.body - 8;
            if (len <= 0 || len > (art ? MAX_ART : MAX_TEXT)) continue;
            byte[] v = new byte[(int) len];
            f.seek(data.body + 8);
            f.readFully(v);
            if (art) {
                if (out.art == null) out.art = v;
            } else {
                put(out, t, v);
            }
        }
    }

    private static boolean wanted(String t) {
        return t.equals("©nam") || t.equals("©ART") || t.equals("aART") || t.equals("©alb")
                || t.equals("©gen") || t.equals("gnre") || t.equals("trkn") || t.equals("disk")
                || t.equals("©day");
    }

    private static void put(Meta.Info out, String t, byte[] v) throws Exception {
        if (t.equals("trkn") || t.equals("disk")) {
            if (v.length < 6) return;
            int n = ((v[2] & 0xff) << 8) | (v[3] & 0xff);
            int of = ((v[4] & 0xff) << 8) | (v[5] & 0xff);
            String s = n + "/" + of;
            if (t.equals("trkn")) out.track = s;
            else out.disc = s;
            return;
        }
        if (t.equals("gnre")) {
            if (v.length < 2) return;
            int g = (((v[0] & 0xff) << 8) | (v[1] & 0xff)) - 1;
            if (g >= 0) out.genre = String.valueOf(g);
            return;
        }
        String s = new String(v, "UTF-8");
        if (t.equals("©nam")) out.title = s;
        else if (t.equals("©ART")) out.artist = s;
        else if (t.equals("aART")) out.albumArtist = s;
        else if (t.equals("©alb")) out.album = s;
        else if (t.equals("©gen")) out.genre = s;
        else if (t.equals("©day")) out.year = s;
        else if (t.equals("©lyr")) Meta.offerLyrics(out, s);
    }

    private static int be32(byte[] b, int p) {
        return ((b[p] & 0xff) << 24) | ((b[p + 1] & 0xff) << 16) | ((b[p + 2] & 0xff) << 8) | (b[p + 3] & 0xff);
    }

    private static long be64(byte[] b, int p) {
        return ((be32(b, p) & 0xffffffffL) << 32) | (be32(b, p + 4) & 0xffffffffL);
    }
}
