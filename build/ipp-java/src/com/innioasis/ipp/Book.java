package com.innioasis.ipp;

/**
 * Small fixes to the e-book text reader.
 *
 * Every line was followed by a blank one
 * {@code TextViewModel} splits the file into lines by scanning the raw bytes for {@code 0x0A} and
 * cuts after it, so each {@code TextItem} keeps its own line terminator. Each item is then
 * its own {@code TextView} row in the RecyclerView ({@code item_book_text.xml}) — and a TextView
 * whose text ends in {@code "\n"} lays out a second, empty line. So a single Enter in the file came
 * out as a blank line on screen, and a file with Windows line endings kept a stray {@code \r} as
 * well. The terminator carries no information once the line is a row of its own, so it is dropped
 * at display time: purely presentational, nothing touches the byte offsets the reader uses for
 * paging and reading progress.
 */
public final class Book {

    private Book() { }

    /** One line as it should be drawn: without the terminator the splitter left on it. */
    public static CharSequence line(String s) {
        if (s == null) return "";
        int n = s.length();
        while (n > 0) {
            char c = s.charAt(n - 1);
            if (c != '\n' && c != '\r') break;
            n--;
        }
        return n == s.length() ? s : s.substring(0, n);
    }
}
