package com.innioasis.ipp;

import android.media.MediaMetadataRetriever;

import com.innioasis.y1.database.Song;
import com.innioasis.y1.utils.HanziToPinyin;

import java.io.RandomAccessFile;
import java.util.Locale;

/**
 * Everything anyone here wants to know about an audio file: the tags and, on request, the bytes of
 * the artwork embedded in it.
 *
 * One place, because the answer is not always the platform's
 * {@code MediaMetadataRetriever} decodes the container in-process and answers every key from one
 * open, which is why it is the default. But its ID3 parser refuses a tag larger than 3 MB
 * ("skipping huge ID3 metadata of size %d" in libstagefright) and silently falls back to the
 * 128-byte ID3v1 block at the end of the file. What comes back then is an album and a title
 * truncated to 30 bytes, no album artist, no disc number, no artwork at all — and, for anything not
 * written in Latin, mojibake: ID3v1 has no encoding field, so a CP1251 title arrives as the bytes
 * it is and goes through a UTF-8 decoder ("Пятна Роршаха" reaches the screen as "Ю..堀"). A five
 * megabyte cover in the tag is all it takes.
 *
 * So this class reads such a tag itself ({@link #id3}), and every caller asks it rather than the
 * retriever, so a file that needs the second path is not a special case anybody has to remember.
 * FLAC, m4a and ogg were measured on the device and need none of this — their extractors carry no
 * such limit and hand over even a huge picture — while WMA gives up nothing at all, having no ASF
 * extractor in this ROM; that one is a second implementation behind the same call, not a change at
 * any call site.
 *
 * Raw (non-generic) types throughout: the bundled d8 crashes dexing generic Signature attrs.
 */
public final class Meta {

    private Meta() { }

    /** What one file has to say. A null field is "not present", never "empty". */
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
    }

    /**
     * The platform's limit, less a margin.
     *
     * {@code kMaxMetadataSize} is 3 MB exactly, but what is compared against it is the tag size as
     * that parser computes it, and whether the ten header bytes and a v2.4 footer are inside that
     * number is not worth depending on. Reading a tag ourselves that the platform would have read
     * costs one file open and produces the same values, so the margin errs in the safe direction.
     */
    private static final long HUGE = 3L * 1024 * 1024 - 64 * 1024;

    /** A text frame larger than this is not a tag anybody wrote; skip it rather than allocate. */
    private static final int MAX_TEXT = 64 * 1024;

    /** A picture larger than this is not read into memory even when one was asked for. */
    private static final int MAX_ART = 8 * 1024 * 1024;

    // ------------------------------------------------------------------ the one entry point

    /**
     * Read {@code path}. Artwork is fetched only when {@code wantArt}, because that is the one key
     * that is not nearly free once the container is open.
     *
     * Never call from the UI thread. Writes nothing anywhere, so any number of threads may call it
     * at once.
     */
    public static Info read(String path, boolean wantArt) {
        Info out = new Info();
        if (path == null) return out;

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
            if (wantArt) out.art = r.getEmbeddedPicture();
        } catch (Throwable t) {
            // an unreadable file answers with nothing, exactly as the retriever alone would
        }
        try {
            r.release();
        } catch (Throwable t) {
            // nothing to do
        }

        if (oversized(path)) id3(path, out, wantArt);
        return out;
    }

    /**
     * The artwork embedded in a file, or null — the picture alone, for the callers that want
     * nothing else out of the file and would otherwise pay for every key of {@link #read}.
     */
    public static byte[] art(String path) {
        if (path == null) return null;
        byte[] out = null;
        MediaMetadataRetriever r = new MediaMetadataRetriever();
        try {
            r.setDataSource(path);
            out = r.getEmbeddedPicture();
        } catch (Throwable t) {
            // fall through to our own reader, which is the answer for an oversized tag anyway
        }
        try {
            r.release();
        } catch (Throwable t) {
            // nothing to do
        }
        return out != null && out.length > 0 ? out : tagArt(path);
    }

    /**
     * The artwork of a file whose tag the platform gave up on, or null — including null for every
     * ordinary file, which is what makes this cheap enough for the drawing path.
     *
     * For the callers that have already asked the retriever and been told "no picture"
     * ({@code Art.external}, reached from stock {@code Other.getAlbumCover}'s null return).
     */
    public static byte[] tagArt(String path) {
        if (!oversized(path)) return null;
        Info i = new Info();
        id3(path, i, true);
        return i.art;
    }

    /**
     * Put the tags of an oversized-tag file back into a freshly scanned song, pinyin keys included.
     *
     * Injected at the end of stock {@code Y1Repository.fileToSong}, i.e. on the one path that both
     * the library scan and "Update library" go through. An ordinary file leaves after ten bytes are
     * read; only a file the platform mis-read is opened again and re-tagged, and only the values
     * actually found in the tag are written — what the retriever produced for the rest is still the
     * better answer.
     */
    public static void fixSong(Song song) {
        if (song == null) return;
        try {
            String path = song.getPath();
            if (!oversized(path)) return;

            Info i = new Info();
            id3(path, i, false);
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
            // a song carrying what the retriever said is better than no song at all
        }
    }

    // ------------------------------------------------------------------ is the second path needed

    /**
     * True when the file starts with an ID3v2 tag the platform's parser will refuse.
     *
     * Ten bytes, and only for the extensions that carry ID3 at all — this runs once per file of a
     * scan, so it may not cost more than that.
     */
    private static boolean oversized(String path) {
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

    // ------------------------------------------------------------------ the ID3v2 reader

    /**
     * Fill in whatever the tag says, leaving every field it does not mention alone.
     *
     * The frames are walked by their headers and their bodies are stepped over with {@code seek},
     * so the five megabyte picture in front of which the text frames of an oversized tag often sit
     * is never read unless it was asked for. Versions 2.2, 2.3 and 2.4 differ in three places only
     * — the length of a frame id, the length of a frame header, and how the frame's size is
     * encoded — so one walk covers them.
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
                    // A tag may carry several pictures; the front cover is the album's, anything
                    // else (a back cover, an artist photo) only stands in when there is no front.
                    Pic got = picture(d, major);
                    if (got != null && (pic == null || (got.front && !pic.front))) pic = got;
                    continue;
                }
                put(out, id, text(d));
            }
            if (pic != null) out.art = pic.data;
        } catch (Throwable t) {
            // whatever was filled in before the file went wrong stays; the rest is the retriever's
        } finally {
            close(f);
        }
    }

    /**
     * One parsed picture frame. A return value rather than a pair of fields on the class: the
     * caching pass reads files on several threads at once, and statics would hand one worker's
     * answer to another.
     */
    private static final class Pic {
        boolean front;                                  // picture type 3, i.e. the front cover
        byte[] data;
    }

    /** The frames worth reading; everything else is stepped over unread. */
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
     * A genre as text, or null.
     *
     * ID3v2 inherited v1's numbering, so a genre may be written "(17)", "(17)Rock" or "Rock". The
     * name is taken where there is one; a bare number is left alone rather than expanded here,
     * because the table that turns it into a name is stock's own ({@code Y1Repository}'s
     * STANDARD_GENRES, applied to the retriever's answer) and a second copy of it would be a second
     * thing to keep in step. A number-only genre in a v2 tag is a relic anyway.
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
     * The size of a frame's body.
     *
     * 2.4 made it synchsafe; 2.3 and 2.2 write a plain big-endian number. Tools that label a tag
     * 2.4 while writing 2.3 sizes exist, and they are not handled: the walk stops at the first
     * frame id that is not one, which is the safe way to be wrong — the fields already read stand,
     * the rest stays the retriever's.
     */
    private static long frameLen(byte[] fh, int major) {
        if (major == 2) {
            return ((fh[3] & 0xffL) << 16) | ((fh[4] & 0xffL) << 8) | (fh[5] & 0xffL);
        }
        return major >= 4 ? syncsafe(fh, 4) : be32(fh, 4);
    }

    /** How far past the tag header the frames start when an extended header sits in between. */
    private static long extendedHeader(RandomAccessFile f, long pos, int major) throws Exception {
        byte[] e = new byte[4];
        f.seek(pos);
        if (f.read(e) != 4) return 0;
        // 2.4 counts the four size bytes themselves, 2.3 does not
        return major >= 4 ? syncsafe(e, 0) : be32(e, 0) + 4;
    }

    /**
     * The picture out of an APIC (2.3/2.4) or PIC (2.2) frame.
     *
     * Layout: text encoding, then the image type — a null-terminated MIME string, or three
     * characters ("JPG") in 2.2 — then the picture type byte, then a description in that same
     * encoding, then the bytes. The description is what makes this fiddly: it is terminated by one
     * zero byte in the 8-bit encodings and by two in the 16-bit ones.
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

    /**
     * A text frame's value: one encoding byte, then the string.
     *
     * A 2.4 frame may hold several values separated by a zero, and older tags often end the single
     * one with a zero as well — either way the first value is the answer, so the string stops at
     * the first terminator.
     */
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

    /**
     * Undo the unsynchronisation scheme: every {@code FF 00} in the stored bytes is an {@code FF}
     * that had a zero inserted after it so no run could be mistaken for an MPEG frame header.
     */
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

    // ------------------------------------------------------------------ small change

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
            // nothing to do
        }
    }
}
