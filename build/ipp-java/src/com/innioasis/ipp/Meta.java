package com.innioasis.ipp;

import android.content.Context;
import android.media.MediaMetadataRetriever;

import com.innioasis.y1.database.Song;
import com.innioasis.y1.utils.HanziToPinyin;

import java.io.RandomAccessFile;
import java.util.Locale;

/**
 * The one place a file's tags and embedded artwork are read. {@code MediaMetadataRetriever} by
 * default; but its ID3 parser refuses a tag over 3 MB (a big cover is enough) and silently falls
 * back to ID3v1 — 30-byte fields, no album artist, disc or art, mojibake for non-Latin. Such a tag
 * is read here ({@link #id3}). FLAC, m4a and ogg have no such limit; WMA yields nothing on this ROM.
 */
public final class Meta {

    private Meta() { }

    /** A null field is "not present", never "empty". */
    public static final class Info {
        public String title;
        public String artist;
        public String albumArtist;
        public String album;
        public String genre;
        public String track;            // the raw tag, "01/05" and all
        public String disc;
        public String year;
        public String date;             // the fuller date, where YEAR is absent
        public byte[] art;              // only when it was asked for
        /** False when the read failed part way: its nulls then say nothing about the file. */
        public boolean ok;
        /** What the read cost, ns: the open with every key, and the picture alone ("Cache library" log). */
        public long openNs;
        public long artNs;
    }

    /** The platform's 3 MB less a margin: reading a tag it could have read costs only a file open. */
    private static final long HUGE = 3L * 1024 * 1024 - 64 * 1024;

    /** A text frame this big is nobody's tag; skipped. */
    private static final int MAX_TEXT = 64 * 1024;

    private static final int MAX_ART = 8 * 1024 * 1024;

    /**
     * The reader version the Song table was read with. Nothing re-reads a known file on its own,
     * so "Update library" does one pass while this is behind. Bump it when the reader learns to
     * read something new.
     */
    private static final int READER = 1;

    private static final String KEY_READER = "meta_v";

    public static boolean libraryRead(Context c) {
        return c != null && Prefs.getInt(c, KEY_READER, 0) >= READER;
    }

    /** End of "Update library", and a scan that starts on an empty table. */
    public static void noteLibraryRead(Context c) {
        if (c == null) return;
        Prefs.setInt(c, KEY_READER, READER);
    }

    /**
     * Opens the file: callers ask only for a song whose row was never read, or for its art. Art
     * only when {@code wantArt}: the one key not free once open. Thread-safe; not the UI thread.
     */
    public static Info read(String path, boolean wantArt) {
        Info out = new Info();
        if (path == null) return out;

        long t0 = System.nanoTime();
        MediaMetadataRetriever r = new MediaMetadataRetriever();
        try {
            r.setDataSource(path);
            out.title = r.extractMetadata(MediaMetadataRetriever.METADATA_KEY_TITLE);
            out.artist = r.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ARTIST);
            out.albumArtist = r.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUMARTIST);
            out.album = r.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUM);
            out.genre = r.extractMetadata(MediaMetadataRetriever.METADATA_KEY_GENRE);
            out.track = r.extractMetadata(MediaMetadataRetriever.METADATA_KEY_CD_TRACK_NUMBER);
            out.disc = r.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DISC_NUMBER);
            out.year = r.extractMetadata(MediaMetadataRetriever.METADATA_KEY_YEAR);
            out.date = r.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DATE);
            long t1 = System.nanoTime();
            if (wantArt) out.art = r.getEmbeddedPicture();
            out.artNs = System.nanoTime() - t1;
            out.ok = true;
        } catch (Throwable t) {
        }
        try {
            r.release();
        } catch (Throwable t) {
        }

        boolean huge = oversized(path);
        if (huge) {
            id3(path, out, wantArt);
            out.ok = true;
        }
        out.openNs = System.nanoTime() - t0 - out.artNs;
        return out;
    }

    /** The picture alone, without paying for every key of {@link #read}. */
    public static byte[] art(String path) {
        if (path == null) return null;
        byte[] out = null;
        MediaMetadataRetriever r = new MediaMetadataRetriever();
        try {
            r.setDataSource(path);
            out = r.getEmbeddedPicture();
        } catch (Throwable t) {
        }
        try {
            r.release();
        } catch (Throwable t) {
        }
        return out != null && out.length > 0 ? out : tagArt(path);
    }

    /**
     * For callers the retriever already told "no picture" ({@code Art.external}). Null for every
     * ordinary file after ten bytes, so cheap enough for the drawing path.
     */
    public static byte[] tagArt(String path) {
        if (!oversized(path)) return null;
        Info i = new Info();
        id3(path, i, true);
        return i.art;
    }

    /**
     * End of stock {@code fileToSong} (scan and "Update library"): an oversized tag's values put
     * back, pinyin keys included — only those actually found; the rest stays the retriever's.
     */
    public static void fixSong(Song song) {
        if (song == null) return;
        try {
            String path = song.getPath();
            if (!oversized(path)) return;

            Info i = Schema.info(song);
            id3(path, i, false);
            Schema.fill(song, i);
            HanziToPinyin h = HanziToPinyin.getInstance();

            if (i.title != null) {
                song.setSongName(i.title);
                song.setPinyinSongName(h.getString(i.title));
            }
            if (i.album != null) {
                song.setAlbum(i.album);
                song.setLowAlbum(i.album.toLowerCase(Locale.ROOT));
                song.setPinyinAlbum(h.getString(i.album));
            }
            if (i.artist != null) {
                song.setArtist(i.artist);
                song.setPinyinArtist(h.getString(i.artist));
            }
            if (i.genre != null) {
                song.setGenre(i.genre);
                song.setPinyinGenre(h.getString(i.genre));
            }
        } catch (Throwable t) {
        }
    }

    /**
     * From {@code Y1Repository.fileToSong}, while its retriever is still open on the file: the
     * tags the Song row has no column for, taken out of the open the scan pays for anyway.
     */
    public static void scanned(MediaMetadataRetriever r, Song song) {
        if (r == null || song == null) return;
        try {
            Info i = new Info();
            i.albumArtist = r.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUMARTIST);
            i.track = r.extractMetadata(MediaMetadataRetriever.METADATA_KEY_CD_TRACK_NUMBER);
            i.disc = r.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DISC_NUMBER);
            i.year = r.extractMetadata(MediaMetadataRetriever.METADATA_KEY_YEAR);
            i.date = r.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DATE);
            Schema.fill(song, i);
        } catch (Throwable t) {
        }
    }

    /** An ID3v2 tag the platform will refuse. Ten bytes: runs once per file of a scan. */
    public static boolean oversized(String path) {
        if (path == null) return false;
        int dot = path.lastIndexOf('.');
        if (dot < 0) return false;
        String ext = path.substring(dot + 1).toLowerCase(Locale.ROOT);
        if (!(ext.equals("mp3") || ext.equals("aiff") || ext.equals("aif") || ext.equals("wav"))) {
            return false;
        }
        RandomAccessFile f = null;
        try {
            f = new RandomAccessFile(path, "r");
            byte[] h = new byte[10];
            if (f.read(h) != 10) return false;
            if (h[0] != 'I' || h[1] != 'D' || h[2] != '3') return false;
            return syncsafe(h, 6) >= HUGE;
        } catch (Throwable t) {
            return false;
        } finally {
            close(f);
        }
    }

    /**
     * Fills what the tag says, leaving the rest alone. Frames are walked by header and stepped over
     * with {@code seek}, so a huge picture is read only when asked for. One walk for 2.2-2.4.
     */
    private static void id3(String path, Info out, boolean wantArt) {
        RandomAccessFile f = null;
        try {
            f = new RandomAccessFile(path, "r");
            byte[] h = new byte[10];
            if (f.read(h) != 10) return;
            if (h[0] != 'I' || h[1] != 'D' || h[2] != '3') return;

            int major = h[3] & 0xff;
            if (major < 2 || major > 4) return;         // 2.5 does not exist; a 0xFF here is junk
            int flags = h[5] & 0xff;
            boolean unsync = (flags & 0x80) != 0;
            long end = 10 + syncsafe(h, 6);

            long pos = 10;
            if ((flags & 0x40) != 0) pos += extendedHeader(f, pos, major);

            int idLen = major == 2 ? 3 : 4;
            int hdrLen = major == 2 ? 6 : 10;
            byte[] fh = new byte[hdrLen];
            Pic pic = null;                             // the best picture seen so far

            while (pos + hdrLen <= end) {
                f.seek(pos);
                if (f.read(fh) != hdrLen) break;
                if (fh[0] == 0) break;                  // padding: the frames are over
                String id = ascii(fh, 0, idLen);
                if (!isFrameId(id)) break;              // not a frame boundary any more

                long len = frameLen(fh, major);
                if (len < 0 || pos + hdrLen + len > end) break;
                long body = pos + hdrLen;
                pos = body + len;

                boolean picture = id.equals("APIC") || id.equals("PIC");
                if (picture && (!wantArt || len > MAX_ART)) continue;
                if (!picture && (len < 1 || len > MAX_TEXT)) continue;
                if (!picture && !wanted(id)) continue;

                f.seek(body);
                byte[] d = new byte[(int) len];
                if (f.read(d) != len) break;
                if (unsync) d = resync(d);

                if (picture) {
                    // The front cover wins; another picture only stands in.
                    Pic got = picture(d, major);
                    if (got != null && (pic == null || (got.front && !pic.front))) pic = got;
                    continue;
                }
                put(out, id, text(d));
            }
            if (pic != null) out.art = pic.data;
        } catch (Throwable t) {
        } finally {
            close(f);
        }
    }

    /** A return value, not statics: several threads read files at once. */
    private static final class Pic {
        boolean front;                                  // picture type 3
        byte[] data;
    }

    private static boolean wanted(String id) {
        return id.equals("TIT2") || id.equals("TT2")
            || id.equals("TPE1") || id.equals("TP1")
            || id.equals("TPE2") || id.equals("TP2")
            || id.equals("TALB") || id.equals("TAL")
            || id.equals("TCON") || id.equals("TCO")
            || id.equals("TRCK") || id.equals("TRK")
            || id.equals("TPOS") || id.equals("TPA")
            || id.equals("TYER") || id.equals("TYE")
            || id.equals("TDRC") || id.equals("TDRL");
    }

    private static void put(Info out, String id, String v) {
        if (v == null || v.length() == 0) return;
        if (id.equals("TIT2") || id.equals("TT2")) out.title = v;
        else if (id.equals("TPE1") || id.equals("TP1")) out.artist = v;
        else if (id.equals("TPE2") || id.equals("TP2")) out.albumArtist = v;
        else if (id.equals("TALB") || id.equals("TAL")) out.album = v;
        else if (id.equals("TCON") || id.equals("TCO")) out.genre = genre(v);
        else if (id.equals("TRCK") || id.equals("TRK")) out.track = v;
        else if (id.equals("TPOS") || id.equals("TPA")) out.disc = v;
        else if (id.equals("TYER") || id.equals("TYE")) out.year = v;
        else if (id.equals("TDRC") || id.equals("TDRL")) out.date = v;
    }

    /**
     * "(17)Rock" -> "Rock". A bare number gives null rather than a second copy of stock's
     * STANDARD_GENRES table.
     */
    private static String genre(String v) {
        String s = v.trim();
        if (s.startsWith("(")) {
            int k = s.indexOf(')');
            if (k > 0) s = s.substring(k + 1).trim();
        }
        if (s.length() == 0) return null;
        boolean digits = true;
        for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) < '0' || s.charAt(i) > '9') { digits = false; break; }
        }
        return digits ? null : s;
    }

    /**
     * Synchsafe in 2.4, plain big-endian before. A "2.4" tag written with 2.3 sizes is not handled;
     * the walk stops at the first bad frame id, which is the safe way to be wrong.
     */
    private static long frameLen(byte[] fh, int major) {
        if (major == 2) {
            return ((fh[3] & 0xffL) << 16) | ((fh[4] & 0xffL) << 8) | (fh[5] & 0xffL);
        }
        return major >= 4 ? syncsafe(fh, 4) : be32(fh, 4);
    }

    private static long extendedHeader(RandomAccessFile f, long pos, int major) throws Exception {
        byte[] e = new byte[4];
        f.seek(pos);
        if (f.read(e) != 4) return 0;
        // 2.4 counts the four size bytes themselves, 2.3 does not
        return major >= 4 ? syncsafe(e, 0) : be32(e, 0) + 4;
    }

    /**
     * APIC/PIC: encoding, MIME (three chars in 2.2), picture type, description, bytes. The
     * description ends with one zero in 8-bit encodings, two in 16-bit ones.
     */
    private static Pic picture(byte[] d, int major) {
        if (d.length < 4) return null;
        int enc = d[0] & 0xff;
        int p = 1;
        if (major == 2) {
            p += 3;
        } else {
            while (p < d.length && d[p] != 0) p++;
            p++;                                        // the MIME string's terminator
        }
        if (p >= d.length) return null;
        Pic out = new Pic();
        out.front = (d[p] & 0xff) == 3;
        p++;
        boolean wide = enc == 1 || enc == 2;
        if (wide) {
            while (p + 1 < d.length && !(d[p] == 0 && d[p + 1] == 0)) p += 2;
            p += 2;
        } else {
            while (p < d.length && d[p] != 0) p++;
            p++;
        }
        if (p >= d.length) return null;
        out.data = new byte[d.length - p];
        System.arraycopy(d, p, out.data, 0, out.data.length);
        return out;
    }

    /** The FIRST value: 2.4 separates several with a zero, older tags often end with one. */
    private static String text(byte[] d) {
        int enc = d[0] & 0xff;
        int off = 1;
        int len = d.length - 1;
        String charset;
        if (enc == 1) {
            // UTF-16 with a byte order mark; without one the specification says big-endian
            if (len >= 2 && (d[1] & 0xff) == 0xff && (d[2] & 0xff) == 0xfe) {
                charset = "UTF-16LE";
                off += 2;
                len -= 2;
            } else if (len >= 2 && (d[1] & 0xff) == 0xfe && (d[2] & 0xff) == 0xff) {
                charset = "UTF-16BE";
                off += 2;
                len -= 2;
            } else {
                charset = "UTF-16BE";
            }
        } else if (enc == 2) {
            charset = "UTF-16BE";
        } else if (enc == 3) {
            charset = "UTF-8";
        } else {
            charset = "ISO-8859-1";
        }
        boolean wide = charset.startsWith("UTF-16");
        int n = 0;
        if (wide) {
            while (n + 1 < len && !(d[off + n] == 0 && d[off + n + 1] == 0)) n += 2;
        } else {
            while (n < len && d[off + n] != 0) n++;
        }
        if (n <= 0) return null;
        try {
            return new String(d, off, n, charset).trim();
        } catch (Throwable t) {
            return null;
        }
    }

    /** Unsynchronisation: every stored {@code FF 00} is an {@code FF}. */
    private static byte[] resync(byte[] d) {
        int n = 0;
        for (int i = 0; i < d.length; i++) {
            if (i > 0 && (d[i] & 0xff) == 0 && (d[i - 1] & 0xff) == 0xff) continue;
            n++;
        }
        if (n == d.length) return d;
        byte[] out = new byte[n];
        int k = 0;
        for (int i = 0; i < d.length; i++) {
            if (i > 0 && (d[i] & 0xff) == 0 && (d[i - 1] & 0xff) == 0xff) continue;
            out[k++] = d[i];
        }
        return out;
    }

    private static boolean isFrameId(String id) {
        for (int i = 0; i < id.length(); i++) {
            char c = id.charAt(i);
            if (!((c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9'))) return false;
        }
        return id.length() > 0;
    }

    private static String ascii(byte[] b, int off, int len) {
        try {
            return new String(b, off, len, "ISO-8859-1");
        } catch (Throwable t) {
            return "";
        }
    }

    private static long syncsafe(byte[] b, int off) {
        return ((b[off] & 0x7fL) << 21) | ((b[off + 1] & 0x7fL) << 14)
             | ((b[off + 2] & 0x7fL) << 7) | (b[off + 3] & 0x7fL);
    }

    private static long be32(byte[] b, int off) {
        return ((b[off] & 0xffL) << 24) | ((b[off + 1] & 0xffL) << 16)
             | ((b[off + 2] & 0xffL) << 8) | (b[off + 3] & 0xffL);
    }

    private static void close(RandomAccessFile f) {
        if (f == null) return;
        try {
            f.close();
        } catch (Throwable t) {
        }
    }
}
