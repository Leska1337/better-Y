package com.innioasis.ipp;

import android.util.Base64;

import java.io.RandomAccessFile;
import java.util.Locale;

/**
 * Tags of FLAC and of Ogg (Vorbis, Opus, FLAC in Ogg): a Vorbis comment, and the picture as a FLAC
 * PICTURE block — in the file's metadata for FLAC, base64 in METADATA_BLOCK_PICTURE for Ogg. Keys
 * as the platform maps them; a key given twice keeps the LAST value, as the platform does.
 */
final class Vorbis {

    private Vorbis() { }

    private static final int MAX_BLOCK = 12 * 1024 * 1024;
    private static final int MAX_ART = 8 * 1024 * 1024;

    /** False when the file is not a FLAC this reader understands. */
    static boolean flac(String path, Meta.Info out, boolean wantArt) {
        RandomAccessFile f = null;
        try {
            f = new RandomAccessFile(path, "r");
            byte[] h = new byte[10];
            long pos = 0;
            if (f.read(h) != 10) return false;
            if (h[0] == 'I' && h[1] == 'D' && h[2] == '3') {
                // an ID3v2 tag some taggers put in front: stepped over
                pos = 10 + (((h[6] & 0x7f) << 21) | ((h[7] & 0x7f) << 14) | ((h[8] & 0x7f) << 7) | (h[9] & 0x7f));
                if ((h[5] & 0x10) != 0) pos += 10;
                f.seek(pos);
                if (f.read(h, 0, 4) != 4) return false;
            }
            if (h[0] != 'f' || h[1] != 'L' || h[2] != 'a' || h[3] != 'C') return false;
            pos += 4;
            Pic pic = new Pic();
            byte[] bh = new byte[4];
            while (true) {
                f.seek(pos);
                if (f.read(bh) != 4) break;
                boolean last = (bh[0] & 0x80) != 0;
                int type = bh[0] & 0x7f;
                int len = ((bh[1] & 0xff) << 16) | ((bh[2] & 0xff) << 8) | (bh[3] & 0xff);
                long body = pos + 4;
                pos = body + len;
                if (type == 4 || (type == 6 && wantArt)) {
                    if (len > MAX_BLOCK) { if (last) break; else continue; }
                    byte[] d = new byte[len];
                    f.seek(body);
                    f.readFully(d);
                    if (type == 4) comment(d, 0, len, out, pic, wantArt);
                    else picture(d, 0, len, pic);
                }
                if (last || type == 127) break;
            }
            if (pic.data != null) out.art = pic.data;
            return true;
        } catch (Throwable t) {
            return false;
        } finally {
            close(f);
        }
    }

    /**
     * Ogg: the first logical stream's second packet is its comment header. Pages are read whole
     * and only that packet is kept.
     */
    static boolean ogg(String path, Meta.Info out, boolean wantArt) {
        RandomAccessFile f = null;
        try {
            f = new RandomAccessFile(path, "r");
            long len = f.length();
            byte[] ph = new byte[27];
            byte[] seg = new byte[255];
            byte[] packet = null;      // the comment packet, as it grows
            int have = 0;
            int index = 0;             // which packet the segments belong to
            int codec = 0;             // 1 vorbis, 2 opus, 3 flac
            byte[] head = new byte[16];
            int headLen = 0;
            long pos = 0;
            int serial = 0;
            boolean first = true;
            while (pos + 27 <= len) {
                f.seek(pos);
                if (f.read(ph) != 27) return false;
                if (ph[0] != 'O' || ph[1] != 'g' || ph[2] != 'g' || ph[3] != 'S') return false;
                int s = le32(ph, 14);
                if (first) { serial = s; first = false; }
                int n = ph[26] & 0xff;
                if (f.read(seg, 0, n) != n) return false;
                int body = 0;
                for (int i = 0; i < n; i++) body += seg[i] & 0xff;
                long data = pos + 27 + n;
                pos = data + body;
                if (s != serial) continue;            // another logical stream
                byte[] page = new byte[body];
                f.readFully(page);
                int at = 0;
                for (int i = 0; i < n; i++) {
                    int l = seg[i] & 0xff;
                    if (index == 0) {
                        int k = Math.min(l, head.length - headLen);
                        if (k > 0) { System.arraycopy(page, at, head, headLen, k); headLen += k; }
                    } else if (index == 1) {
                        if (packet == null) packet = new byte[Math.max(4096, l)];
                        if (have + l > MAX_BLOCK) return false;
                        if (have + l > packet.length) {
                            byte[] g = new byte[Math.max(have + l, packet.length * 2)];
                            System.arraycopy(packet, 0, g, 0, have);
                            packet = g;
                        }
                        System.arraycopy(page, at, packet, have, l);
                        have += l;
                    }
                    at += l;
                    if (l < 255) {
                        if (index == 0) codec = codec(head, headLen);
                        if (index == 0 && codec == 0) return false;
                        index++;
                        if (index == 2) {
                            Pic pic = new Pic();
                            int off = codec == 1 ? 7 : codec == 2 ? 8 : 4;
                            if (codec == 1 && !(have > 7 && packet[0] == 3)) return false;
                            if (codec == 2 && !(have > 8 && packet[0] == 'O' && packet[4] == 'T')) return false;
                            if (codec == 3 && !(have > 4 && (packet[0] & 0x7f) == 4)) return true;
                            comment(packet, off, have, out, pic, wantArt);
                            if (pic.data != null) out.art = pic.data;
                            return true;
                        }
                    }
                }
            }
            return false;
        } catch (Throwable t) {
            return false;
        } finally {
            close(f);
        }
    }

    private static int codec(byte[] h, int n) {
        if (n >= 7 && h[0] == 1 && h[1] == 'v' && h[2] == 'o' && h[3] == 'r') return 1;
        if (n >= 8 && h[0] == 'O' && h[1] == 'p' && h[2] == 'u' && h[3] == 's' && h[4] == 'H') return 2;
        if (n >= 5 && (h[0] & 0xff) == 0x7f && h[1] == 'F' && h[2] == 'L' && h[3] == 'A' && h[4] == 'C') return 3;
        return 0;
    }

    /** A front cover wins; any other picture only stands in. */
    private static final class Pic {
        byte[] data;
        boolean front;
    }

    /** Vendor string, then count, then KEY=value entries; every length little-endian. */
    private static void comment(byte[] d, int p, int end, Meta.Info out, Pic pic, boolean wantArt)
            throws Exception {
        if (p + 4 > end) return;
        int vendor = le32(d, p);
        p += 4;
        if (vendor < 0 || p + vendor + 4 > end) return;
        p += vendor;
        int n = le32(d, p);
        p += 4;
        for (int i = 0; i < n && p + 4 <= end; i++) {
            int l = le32(d, p);
            p += 4;
            if (l < 0 || p + l > end) return;
            int eq = -1;
            for (int k = p; k < p + l && k < p + 64; k++) {
                if (d[k] == '=') { eq = k; break; }
            }
            if (eq > p) {
                String key = new String(d, p, eq - p, "ISO-8859-1").toUpperCase(Locale.ROOT);
                int vs = eq + 1;
                int vl = p + l - vs;
                if (key.equals("METADATA_BLOCK_PICTURE")) {
                    if (wantArt && vl > 0) {
                        try {
                            byte[] b = Base64.decode(d, vs, vl, Base64.DEFAULT);
                            picture(b, 0, b.length, pic);
                        } catch (Throwable t) {
                        }
                    }
                } else if (vl > 0 && vl <= 64 * 1024) {
                    put(out, key, utf8(d, vs, vl));
                }
            }
            p += l;
        }
    }

    private static void put(Meta.Info out, String key, String v) {
        if (v == null) return;
        if (key.equals("TITLE")) out.title = v;
        else if (key.equals("ARTIST")) out.artist = v;
        else if (key.equals("ALBUMARTIST") || key.equals("ALBUM ARTIST")) out.albumArtist = v;
        else if (key.equals("ALBUM")) out.album = v;
        else if (key.equals("GENRE")) out.genre = v;
        else if (key.equals("TRACKNUMBER")) out.track = v;
        else if (key.equals("DISCNUMBER")) out.disc = v;
        else if (key.equals("DATE")) out.date = v;
    }

    /** FLAC PICTURE: type, MIME, description, four sizes, data; every number big-endian. */
    private static void picture(byte[] d, int p, int end, Pic pic) {
        if (p + 8 > end) return;
        int type = be32(d, p);
        p += 4;
        int mime = be32(d, p);
        p += 4;
        if (mime < 0 || p + mime + 4 > end) return;
        p += mime;
        int desc = be32(d, p);
        p += 4;
        if (desc < 0 || p + desc + 20 > end) return;
        p += desc + 16;
        int n = be32(d, p);
        p += 4;
        if (n <= 0 || n > MAX_ART || p + n > end) return;
        boolean front = type == 3;
        if (pic.data != null && (pic.front || !front)) return;
        byte[] b = new byte[n];
        System.arraycopy(d, p, b, 0, n);
        pic.data = b;
        pic.front = front;
    }

    private static String utf8(byte[] d, int off, int len) {
        try {
            return new String(d, off, len, "UTF-8");
        } catch (Throwable t) {
            return null;
        }
    }

    private static int le32(byte[] b, int p) {
        return (b[p] & 0xff) | ((b[p + 1] & 0xff) << 8) | ((b[p + 2] & 0xff) << 16) | ((b[p + 3] & 0xff) << 24);
    }

    private static int be32(byte[] b, int p) {
        return ((b[p] & 0xff) << 24) | ((b[p + 1] & 0xff) << 16) | ((b[p + 2] & 0xff) << 8) | (b[p + 3] & 0xff);
    }

    private static void close(RandomAccessFile f) {
        try {
            if (f != null) f.close();
        } catch (Throwable t) {
        }
    }
}
