package com.innioasis.ipp;

/**
 * The e-book reader keeps each line's terminator, and a TextView ending in "\n" draws an extra
 * empty line. Dropped at display time only — the byte offsets used for paging are untouched.
 */
public final class Book {

    private Book() { }

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
