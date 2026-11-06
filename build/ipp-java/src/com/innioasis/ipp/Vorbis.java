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
     * Ogg: the first logical stream's second packet is its comment header, read as a stream. Page
     * bodies are read only where a byte is wanted, so a picture the caller did not ask for is
     * stepped over by page headers alone: it is most of a big comment packet.
     */
    static boolean ogg(String path, Meta.Info out, boolean wantArt) {
        RandomAccessFile f = null;
        try {
            f = new RandomAccessFile(path, "r");
            Ogg o = new Ogg(f, wantArt);
            byte[] head = new byte[16];
            int codec = codec(head, o.read(head, 0, head.length));
            if (codec == 0) return false;
            o.nextPacket();

            int off = codec == 1 ? 7 : codec == 2 ? 8 : 4;
            byte[] magic = new byte[8];
            int m = o.read(magic, 0, off);
            if (o.eof) return false;
            if (codec == 1 && !(m == off && magic[0] == 3)) return false;
            if (codec == 2 && !(m == off && magic[0] == 'O' && magic[4] == 'T')) return false;
            if (codec == 3 && !(m == off && (magic[0] & 0x7f) == 4)) return true;

            Pic pic = new Pic();
            byte[] w = new byte[4];
            if (o.read(w, 0, 4) != 4) return !o.eof;
            int vendor = le32(w, 0);
            if (vendor < 0 || !o.skip(vendor)) return !o.eof;
            if (o.read(w, 0, 4) != 4) return !o.eof;
            int n = le32(w, 0);
            byte[] k = new byte[64];
            for (int i = 0; i < n; i++) {
                if (o.read(w, 0, 4) != 4) break;
                int l = le32(w, 0);
                if (l < 0) break;
                int got = o.read(k, 0, Math.min(l, k.length));
                if (got < Math.min(l, k.length)) break;
                int eq = -1;
                for (int j = 0; j < got; j++) {
                    if (k[j] == '=') { eq = j; break; }
                }
                if (eq <= 0) {
                    if (!o.skip(l - got)) break;
                    continue;
                }
                String key = new String(k, 0, eq, "ISO-8859-1").toUpperCase(Locale.ROOT);
                int vl = l - eq - 1;
                boolean art = key.equals("METADATA_BLOCK_PICTURE");
                boolean want = art ? wantArt && vl > 0 && vl <= MAX_BLOCK : vl > 0 && vl <= 64 * 1024;
                if (!want) {
                    if (!o.skip(l - got)) break;
                    continue;
                }
                byte[] v = new byte[vl];
                int have = got - eq - 1;
                System.arraycopy(k, eq + 1, v, 0, have);
                if (o.read(v, have, vl - have) != vl - have) break;
                if (art) {
                    try {
                        byte[] b = Base64.decode(v, 0, vl, Base64.DEFAULT);
                        picture(b, 0, b.length, pic);
                    } catch (Throwable t) {
                    }
                } else {
                    put(out, key, utf8(v, 0, vl));
                }
            }
            if (o.eof) return false;
            if (pic.data != null) out.art = pic.data;
            return true;
        } catch (Throwable t) {
            return false;
        } finally {
            close(f);
        }
    }

    /**
     * The packets of an Ogg file's first logical stream, as bytes. A page body is read from the
     * first byte wanted, a window at a time, and not at all when only skipped over. {@code eof}:
     * the file ended inside a packet.
     */
    private static final class Ogg {
        private final RandomAccessFile f;
        private final long len;
        private long next;                  // the next page header
        private int serial;
        private boolean any;
        private final byte[] ph = new byte[27 + 255];
        private final byte[] seg = new byte[255];
        private int nseg;
        private int si;
        private long body;
        private int bodyLen;
        private final byte[] buf;
        private boolean loaded;
        private int winAt;                  // the body offset buf starts at
        private int winLen;
        private int off;                    // where the next segment starts in the body
        private int segStart;
        private int segLen;
        private int segAt;
        private boolean packetEnd;
        private boolean started;
        boolean eof;

        /** A small window when only text is wanted; a picture is read a page at a time. */
        Ogg(RandomAccessFile f, boolean wantArt) throws java.io.IOException {
            this.f = f;
            buf = new byte[wantArt ? 255 * 255 : 4096];
            len = f.length();
        }

        private boolean page() throws java.io.IOException {
            while (true) {
                if (next + 27 > len) return false;
                // the header and its segment table in one read: on vfat every call queues
                f.seek(next);
                int want = (int) Math.min((long) ph.length, len - next);
                int r = 0;
                while (r < want) {
                    int k = f.read(ph, r, want - r);
                    if (k < 0) break;
                    r += k;
                }
                if (r < 27 || ph[0] != 'O' || ph[1] != 'g' || ph[2] != 'g' || ph[3] != 'S') {
                    throw new java.io.IOException("not an Ogg page");
                }
                int s = le32(ph, 14);
                int n = ph[26] & 0xff;
                if (27 + n > r) throw new java.io.IOException("short page");
                System.arraycopy(ph, 27, seg, 0, n);
                int b = 0;
                for (int i = 0; i < n; i++) b += seg[i] & 0xff;
                body = next + 27 + n;
                next = body + b;
                if (!any) {
                    serial = s;
                    any = true;
                }
                if (s != serial) continue;          // another logical stream
                nseg = n;
                si = 0;
                off = 0;
                bodyLen = b;
                loaded = false;
                return true;
            }
        }

        /** The current packet has a byte left; false at its end (or the file's). */
        private boolean more() throws java.io.IOException {
            while (!started || segAt == segLen) {
                if (started && packetEnd) return false;
                while (si >= nseg) {
                    if (!page()) {
                        eof = true;
                        return false;
                    }
                }
                int l = seg[si++] & 0xff;
                segStart = off;
                off += l;
                segLen = l;
                segAt = 0;
                packetEnd = l < 255;
                started = true;
            }
            return true;
        }

        int read(byte[] b, int o, int n) throws java.io.IOException {
            int got = 0;
            while (got < n && more()) {
                int at = segStart + segAt;
                if (!loaded || at < winAt || at >= winAt + winLen) {
                    // a window of the body around the byte wanted, not the whole page: a page
                    // is up to 64 KB, mostly a picture nobody asked for
                    if (body + bodyLen > len) throw new java.io.IOException("short page");
                    winAt = at;
                    winLen = Math.min(buf.length, bodyLen - at);
                    f.seek(body + at);
                    f.readFully(buf, 0, winLen);
                    loaded = true;
                }
                int k = Math.min(Math.min(n - got, segLen - segAt), winAt + winLen - at);
                System.arraycopy(buf, at - winAt, b, o + got, k);
                segAt += k;
                got += k;
            }
            return got;
        }

        boolean skip(long n) throws java.io.IOException {
            while (n > 0 && more()) {
                int k = (int) Math.min(n, (long) (segLen - segAt));
                segAt += k;
                n -= k;
            }
            return n == 0;
        }

        void nextPacket() throws java.io.IOException {
            while (more()) segAt = segLen;
            started = false;
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
        else if (out.wantLyrics && (key.equals("LYRICS") || key.equals("UNSYNCEDLYRICS")
                || key.equals("UNSYNCED LYRICS") || key.equals("SYNCEDLYRICS"))) {
            Meta.offerLyrics(out, v);
        }
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
