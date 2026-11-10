package com.innioasis.ipp;

import android.content.Context;
import android.media.MediaMetadataRetriever;

import com.innioasis.music.objects.Constant;
import com.innioasis.y1.Y1Application;
import com.innioasis.y1.database.Song;
import com.innioasis.y1.database.Y1Repository;
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
        /** Read by our own reader, not the platform's ("Cache library" log). */
        public boolean ours;
        /** Set by {@link #lyrics} alone, so a scan never pays for the text. */
        boolean wantLyrics;
        String lyrics;
        int lyricsRank;
    }

    /** The platform's 3 MB less a margin: reading a tag it could have read costs only a file open. */
    private static final long HUGE = 3L * 1024 * 1024 - 64 * 1024;

    /** A text frame this big is nobody's tag; skipped. */
    private static final int MAX_TEXT = 64 * 1024;

    private static final int MAX_ART = 8 * 1024 * 1024;

    /** A lyrics frame this big is nobody's text. */
    private static final int MAX_LYRICS = 256 * 1024;

    /**
     * The reader version the Song table was read with. Nothing re-reads a known file on its own,
     * so "Update library" does one pass while this is behind. Bump it when the reader learns to
     * read something new.
     */
    private static final int READER = 2;

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
     * only when {@code wantArt}: the one key not free once open. Our reader first ({@link #own}),
     * the platform's where it cannot answer. Thread-safe; not the UI thread.
     */
    public static Info read(String path, boolean wantArt) {
        Info mine = own(path, wantArt);
        if (mine != null && mine.ok) return mine;

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

    /**
     * Our own readers, which read only the tag where the platform parses the whole container: ID3v2
     * for mp3, Vorbis comment for flac and Ogg, the iTunes list for MP4 — compared field by field
     * with the platform on a real library. Null for a format none of them reads; {@code ok} false
     * when the container did not parse, or an mp3 has no ID3v2 tag to walk whole — the platform's
     * then, ID3v1 included.
     */
    public static Info own(String path, boolean wantArt) {
        String ext = ext(path);
        if (ext == null) return null;
        Info out = new Info();
        long t0 = System.nanoTime();
        if (!ownInto(ext, path, out, wantArt)) {
            if (!readable(ext)) return null;
            out.ok = false;
        } else {
            out.ok = true;
            out.ours = true;
        }
        out.openNs = System.nanoTime() - t0;
        return out;
    }

    /**
     * The text embedded in the file — LRC when it carries timestamps, plain otherwise — or null.
     * Our readers only: the platform does not give lyrics out. Opens the file; not the UI thread.
     */
    public static String lyrics(String path) {
        String ext = ext(path);
        if (ext == null) return null;
        Info out = new Info();
        out.wantLyrics = true;
        try {
            ownInto(ext, path, out, false);
        } catch (Throwable t) {
        }
        return out.lyrics;
    }

    /** Timed text (SYLT included) wins over plain; among equals the last one in the file. */
    static void offerLyrics(Info out, String text) {
        if (text == null) return;
        text = text.trim();
        if (text.length() == 0) return;
        int rank = Lrc.timed(text) ? 2 : 1;
        if (rank < out.lyricsRank) return;
        out.lyrics = text;
        out.lyricsRank = rank;
    }

    private static boolean readable(String ext) {
        return ext.equals("mp3") || ext.equals("flac") || ext.equals("ogg") || ext.equals("oga")
                || ext.equals("opus") || ext.equals("m4a") || ext.equals("m4b") || ext.equals("m4r")
                || ext.equals("mp4");
    }

    private static boolean ownInto(String ext, String path, Info out, boolean wantArt) {
        if (ext.equals("mp3")) return id3(path, out, wantArt);
        if (ext.equals("flac")) return Vorbis.flac(path, out, wantArt);
        if (ext.equals("ogg") || ext.equals("oga") || ext.equals("opus")) return Vorbis.ogg(path, out, wantArt);
        if (ext.equals("m4a") || ext.equals("m4b") || ext.equals("m4r") || ext.equals("mp4")) {
            return Mp4.read(path, out, wantArt);
        }
        return false;
    }

    private static String ext(String path) {
        if (path == null) return null;
        int dot = path.lastIndexOf('.');
        return dot < 0 ? null : path.substring(dot + 1).toLowerCase(Locale.ROOT);
    }

    /**
     * Formats the stock scan does not open (it lists only what the platform reads), so the row gets
     * its tags from our reader alone: opus, an Ogg under {@code .oga}, an m4a audiobook.
     */
    public static boolean blind(String path) {
        String ext = ext(path);
        return ext != null && (ext.equals("opus") || ext.equals("oga") || ext.equals("m4b"));
    }

    /** A row read wrongly or not at all by the platform: the reader-version pass reads it again. */
    public static boolean reread(String path) {
        return blind(path) || oversized(path);
    }

    /**
     * For callers the retriever already told "no picture" ({@code Art.external}). Null for every
     * ordinary file after ten bytes, so cheap enough for the drawing path.
     */
    public static byte[] tagArt(String path) {
        if (blind(path)) {
            Info b = own(path, true);
            return b != null && b.ok ? b.art : null;
        }
        if (!oversized(path)) return null;
        Info i = new Info();
        id3(path, i, true);
        return i.art;
    }

    /**
     * End of stock {@code fileToSong} (scan and "Update library"): an oversized tag's values put
     * back, pinyin keys included — only those actually found; the rest stays the retriever's.
     * A format stock does not open at all ({@link #blind}) gets every value from our reader.
     */
    public static void fixSong(Song song) {
        if (song == null) return;
        try {
            String path = song.getPath();
            boolean blind = blind(path);
            if (!blind && !oversized(path)) return;

            Info i = Schema.info(song);
            if (blind) {
                if (!ownInto(ext(path), path, i, false)) return;     // left unread, not "no tags"
            } else {
                id3(path, i, false);
            }
            Schema.fill(song, i);
            HanziToPinyin h = HanziToPinyin.getInstance();

            if (i.title != null) {
                song.setSongName(i.title);
                song.setPinyinSongName(h.getString(i.title));
            }
            if (i.album != null) {
                song.setAlbum(i.album);
                song.setLowAlbum(i.album.toLowerCase(Locale.ROOT));
                song.setPinyinAlbum(Scan.pinyin(h, i.album));
            }
            if (i.artist != null) {
                song.setArtist(i.artist);
                song.setPinyinArtist(Scan.pinyin(h, i.artist));
            }
            if (i.genre != null) {
                song.setGenre(i.genre);
                song.setPinyinGenre(Scan.pinyin(h, i.genre));
            }
        } catch (Throwable t) {
        }
    }

    /**
     * From {@code Y1Repository.fileToSong} before it opens a retriever: true when our reader filled
     * the row and the platform is not asked (nor {@link #fixSong}). Every value goes through the
     * rules of stock's {@code extractMetadata}, so the row is what the platform's read would give.
     */
    public static boolean scanOwn(Song song) {
        if (song == null) return false;
        String path = song.getPath();
        String ext = ext(path);
        boolean done = false;
        try {
            if (ext != null && (ext.equals("mp3") || ext.equals("flac") || ext.equals("ogg")
                    || ext.equals("m4a") || ext.equals("m4r"))) {
                Info i = new Info();
                if (ownInto(ext, path, i, false)) done = fill(song, i);
            }
        } catch (Throwable t) {
            done = false;
        }
        return done;
    }

    /** False where stock's read would have failed part way (a genre number past its table). */
    private static boolean fill(Song song, Info i) {
        String genre = stockValue(i.genre);
        Integer n = number(genre);
        if (n != null) {
            String[] names = genreNames();
            if (names == null || n.intValue() < 0 || n.intValue() >= names.length) return false;
            genre = stockValue(names[n.intValue()]);
        }
        HanziToPinyin h = HanziToPinyin.getInstance();
        String title = stockValue(i.title);
        song.setSongName(title);
        song.setPinyinSongName(h.getString(title));
        String album = stockValue(i.album);
        song.setAlbum(album);
        song.setLowAlbum(album.toLowerCase(Locale.ROOT));
        song.setPinyinAlbum(Scan.pinyin(h, album));
        String artist = stockValue(i.artist);
        song.setArtist(artist);
        song.setPinyinArtist(Scan.pinyin(h, artist));
        song.setGenre(genre);
        song.setPinyinGenre(Scan.pinyin(h, genre));
        Schema.fill(song, i);
        return true;
    }

    /** Stock's {@code extractMetadata}: absent or blank is {@code Constant.UNKNOWN}. */
    private static String stockValue(String v) {
        if (v == null) return Constant.UNKNOWN;
        for (int k = 0; k < v.length(); k++) {
            char c = v.charAt(k);
            if (!Character.isWhitespace(c) && !Character.isSpaceChar(c)) return v;
        }
        return Constant.UNKNOWN;
    }

    /** Kotlin's {@code toIntOrNull}: an optional sign and decimal digits, nothing else. */
    private static Integer number(String v) {
        try {
            int k = 0;
            if (v.length() > 0 && (v.charAt(0) == '-' || v.charAt(0) == '+')) k = 1;
            if (k >= v.length()) return null;
            for (int j = k; j < v.length(); j++) {
                if (v.charAt(j) < '0' || v.charAt(j) > '9') return null;
            }
            return Integer.valueOf(v.charAt(0) == '+' ? v.substring(1) : v);
        } catch (Throwable t) {
            return null;
        }
    }

    private static volatile String[] genres;

    /** Stock's private STANDARD_GENRES, the table its {@code extractMetadata} maps a number by. */
    private static String[] genreNames() {
        String[] g = genres;
        if (g != null) return g;
        try {
            Object repo = Y1Application.Companion.getY1Repository();
            java.lang.reflect.Field f = Y1Repository.class.getDeclaredField("STANDARD_GENRES");
            f.setAccessible(true);
            g = (String[]) f.get(repo);
            genres = g;
        } catch (Throwable t) {
            g = null;
        }
        return g;
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
     * True when the whole tag was walked; false with no tag, or at a frame it could not read.
     */
    private static boolean id3(String path, Info out, boolean wantArt) {
        RandomAccessFile f = null;
        boolean whole = false;
        try {
            f = new RandomAccessFile(path, "r");
            byte[] h = new byte[10];
            if (f.read(h) != 10) return false;
            if (h[0] != 'I' || h[1] != 'D' || h[2] != '3') return false;

            int major = h[3] & 0xff;
            if (major < 2 || major > 4) return false;   // 2.5 does not exist; a 0xFF here is junk
            int flags = h[5] & 0xff;
            boolean unsync = (flags & 0x80) != 0;
            long end = 10 + syncsafe(h, 6);

            long pos = 10;
            if ((flags & 0x40) != 0) pos += extendedHeader(f, pos, major);

            int idLen = major == 2 ? 3 : 4;
            int hdrLen = major == 2 ? 6 : 10;
            byte[] fh = new byte[hdrLen];
            Pic pic = null;                             // the best picture seen so far

            // whole: the walk reached the padding or the tag's end, not a frame it could not read
            whole = true;
            while (pos + hdrLen <= end) {
                f.seek(pos);
                if (f.read(fh) != hdrLen) { whole = false; break; }
                if (fh[0] == 0) break;                  // padding: the frames are over
                String id = ascii(fh, 0, idLen);
                if (!isFrameId(id)) { whole = false; break; }   // not a frame boundary any more

                long len = frameLen(fh, major);
                if (len < 0 || pos + hdrLen + len > end) { whole = false; break; }
                long body = pos + hdrLen;
                pos = body + len;

                boolean picture = id.equals("APIC") || id.equals("PIC");
                boolean lyric = out.wantLyrics && (id.equals("USLT") || id.equals("ULT")
                        || id.equals("SYLT") || id.equals("SLT"));
                if (picture && (!wantArt || len > MAX_ART)) continue;
                if (!picture && (len < 1 || len > (lyric ? MAX_LYRICS : MAX_TEXT))) continue;
                if (!picture && !lyric && !wanted(id)) continue;

                f.seek(body);
                byte[] d = new byte[(int) len];
                if (f.read(d) != len) { whole = false; break; }
                if (unsync) d = resync(d);

                if (picture) {
                    // The front cover wins; another picture only stands in.
                    Pic got = picture(d, major);
                    if (got != null && (pic == null || (got.front && !pic.front))) pic = got;
                    continue;
                }
                if (lyric) {
                    boolean sylt = id.equals("SYLT") || id.equals("SLT");
                    offerLyrics(out, sylt ? sylt(d) : uslt(d));
                    continue;
                }
                put(out, id, text(d));
            }
            if (pic != null) out.art = pic.data;
        } catch (Throwable t) {
            whole = false;
        } finally {
            close(f);
        }
        return whole;
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
        else if (id.equals("TCON") || id.equals("TCO")) out.genre = v;   // "(17)" as written: the platform does not translate it
        else if (id.equals("TRCK") || id.equals("TRK")) out.track = v;
        else if (id.equals("TPOS") || id.equals("TPA")) out.disc = v;
        else if (id.equals("TYER") || id.equals("TYE")) out.year = v;
        else if (id.equals("TDRC") || id.equals("TDRL")) out.date = v;
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

    /** USLT/ULT: encoding, language, a description, then the whole text to the frame's end. */
    private static String uslt(byte[] d) {
        if (d.length < 5) return null;
        int enc = d[0] & 0xff;
        int p = past(d, 4, enc);
        if (p < 0 || p >= d.length) return null;
        java.nio.charset.Charset cs = charsetOf(d, p, d.length - p, enc);
        return decode(d, p, d.length, enc, cs);
    }

    /**
     * SYLT/SLT as LRC text: encoding, language, timestamp format, content type, description, then
     * text-and-time pairs. Times in MPEG frames (format 1) are not converted: null. Where the
     * entries are syllables, one that starts with a newline starts a line and the rest join it.
     */
    private static String sylt(byte[] d) {
        if (d.length < 7) return null;
        int enc = d[0] & 0xff;
        if ((d[4] & 0xff) != 2) return null;
        int p = past(d, 6, enc);
        if (p < 0) return null;
        java.nio.charset.Charset cs = charsetOf(d, p, d.length - p, enc);
        java.util.ArrayList texts = new java.util.ArrayList();
        java.util.ArrayList times = new java.util.ArrayList();
        boolean breaks = false;
        while (p < d.length) {
            int e = past(d, p, enc);
            if (e < 0 || e + 4 > d.length) break;
            String s = decode(d, p, e - (enc == 1 || enc == 2 ? 2 : 1), enc, cs);
            if (s == null) s = "";
            if (s.startsWith("\n") || s.startsWith("\r")) breaks = true;
            texts.add(s);
            times.add(Long.valueOf(be32(d, e)));
            p = e + 4;
        }
        if (texts.isEmpty()) return null;
        StringBuilder out = new StringBuilder();
        StringBuilder line = null;
        long at = 0;
        for (int i = 0; i < texts.size(); i++) {
            String s = (String) texts.get(i);
            long t = ((Long) times.get(i)).longValue();
            boolean starts = !breaks || line == null || s.startsWith("\n") || s.startsWith("\r");
            if (starts) {
                if (line != null) out.append(Lrc.stamp(at)).append(line.toString().trim()).append('\n');
                line = new StringBuilder();
                at = t;
            }
            line.append(s.replace('\r', ' ').replace('\n', ' '));
        }
        if (line != null) out.append(Lrc.stamp(at)).append(line.toString().trim()).append('\n');
        return out.toString();
    }

    /** The index after the zero (two zeros in UTF-16) that ends the string at {@code p}; -1 if none. */
    private static int past(byte[] d, int p, int enc) {
        if (enc == 1 || enc == 2) {
            while (p + 1 < d.length) {
                if (d[p] == 0 && d[p + 1] == 0) return p + 2;
                p += 2;
            }
            return -1;
        }
        while (p < d.length) {
            if (d[p] == 0) return p + 1;
            p++;
        }
        return -1;
    }

    /** Latin-1 by the letter of ID3, CP1251 and the like in practice: that one is guessed. */
    private static java.nio.charset.Charset charsetOf(byte[] d, int off, int len, int enc) {
        if (enc == 3) return java.nio.charset.Charset.forName("UTF-8");
        if (enc == 2) return java.nio.charset.Charset.forName("UTF-16BE");
        if (enc == 1) return null;
        return Lyrics.guess(d, off, len);
    }

    /** {@code d[off..end)}, trailing zeros dropped; UTF-16 strings carry their own byte order mark. */
    private static String decode(byte[] d, int off, int end, int enc, java.nio.charset.Charset cs) {
        if (enc == 1 || enc == 2) {
            // by pairs: a lone zero is the high half of the last character in UTF-16LE
            while (end - off >= 2 && d[end - 1] == 0 && d[end - 2] == 0) end -= 2;
        } else {
            while (end > off && d[end - 1] == 0) end--;
        }
        if (end <= off) return null;
        try {
            if (enc == 1) {
                if (end - off >= 2 && (d[off] & 0xff) == 0xff && (d[off + 1] & 0xff) == 0xfe) {
                    return new String(d, off + 2, end - off - 2, "UTF-16LE");
                }
                if (end - off >= 2 && (d[off] & 0xff) == 0xfe && (d[off + 1] & 0xff) == 0xff) {
                    return new String(d, off + 2, end - off - 2, "UTF-16BE");
                }
                return new String(d, off, end - off, "UTF-16BE");
            }
            return new String(d, off, end - off, cs.name());
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
