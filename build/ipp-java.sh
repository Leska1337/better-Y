#!/usr/bin/env bash
# ipp-java.sh -- compile the Java sources of package com/innioasis/ipp into smali.
#
# Write ipp classes in Java under build/ipp-java/src/com/innioasis/ipp/*.java, run this
# (javac -> d8 -> baksmali -> the two literal fixes) and the resulting .smali lands in
# build/src/smali_classes2/, overwriting same-named files. Stock files are NOT touched — point
# injections into stock methods stay hand-written smali. Then run build/build.sh.
#
#   ./build/ipp-java.sh              # compile and place into the tree
#   ./build/ipp-java.sh --dry-run    # build into the work dir and list, copy nothing
#   ./build/ipp-java.sh --stubs      # regenerate app-stubs.jar and the R stub, then exit
#
# The macOS/Linux side of ipp-java.ps1, step for step. Compile-time stubs of the stock and existing
# ipp classes come from build/tools/android/app-stubs.jar (dex2jar of the newest built APK); it is
# regenerated when missing or older than that APK. The R stub is generated from res/values/public.xml
# because release dex inlines R constants and strips the fields.
#
# One difference from the Windows side, and it is cosmetic: baksmali writes its output with this
# platform's line endings, so smali regenerated here comes out LF where the committed files are CRLF.
# It assembles identically; it is only worth knowing before committing a whole-file diff.

. "$(dirname "$0")/lib.sh"

DRY_RUN=0
STUBS_ONLY=0
for arg in "$@"; do
    case "$arg" in
        --dry-run) DRY_RUN=1 ;;
        --stubs)   STUBS_ONLY=1 ;;
        -h|--help) sed -n '2,20p' "$0"; exit 0 ;;
        *) die "unknown option: $arg" ;;
    esac
done

have perl || die "no perl: the two smali literal fixes are written in it"

setup_java
setup_javac
setup_d8

TOOLS="$BUILD_DIR/tools"
ANDROID_JAR="${ANDROID17_JAR:-$TOOLS/android/android17.jar}"
STUBS_JAR="$TOOLS/android/app-stubs.jar"
RSTUB_DIR="$TOOLS/android/rstub"
PUBLIC_XML="$BUILD_DIR/src/res/values/public.xml"
D2J_LIB="${DEX2JAR_LIB:-$TOOLS/dex2jar/dex-tools-v2.4/lib}"
SRC_DIR="$BUILD_DIR/ipp-java/src"
# Output into classes2.dex: stock classes.dex sits at the 64K method-ref limit, so anything new
# must land in smali_classes2. Legacy multidex loads all dexes and cross-dex refs resolve at runtime.
TREE_OUT="$BUILD_DIR/src/smali_classes2"
WORK="${TMPDIR:-/tmp}/ipp-java-build"

[ -f "$ANDROID_JAR" ] || die "no API 17 android.jar at $ANDROID_JAR — set ANDROID17_JAR"
[ -d "$D2J_LIB" ] || die "no dex-tools lib at $D2J_LIB — set DEX2JAR_LIB (dex-tools 2.4)"

D2J_CP="$(find "$D2J_LIB" -maxdepth 1 -name '*.jar' | tr '\n' ':' | sed 's/:$//')"
[ -n "$D2J_CP" ] || die "no jars under $D2J_LIB"

newest_apk() { ls -1t "$BUILD_DIR"/out/*.apk 2>/dev/null | head -1; }

new_stubs() {
    local apk
    apk="$(newest_apk)"
    [ -n "$apk" ] || die "No APK in build/out to generate stubs from"
    note "Stubs: dex2jar $(basename "$apk") -> app-stubs.jar"
    mkdir -p "$(dirname "$STUBS_JAR")"
    rm -f "$STUBS_JAR"
    "$JAVA" -cp "$D2J_CP" com.googlecode.dex2jar.tools.Dex2jarCmd -f -o "$STUBS_JAR" "$apk" >/dev/null
    [ -f "$STUBS_JAR" ] || die "dex2jar did not produce stubs"
}

# The app R stub, generated from public.xml and compiled for the classpath only. Ids inline to the
# same values, so nothing references R at runtime.
new_rstub() {
    note "R stub: generating from public.xml"
    local rsrc="$WORK/rstub-src/com/innioasis/y1"
    rm -rf "$WORK/rstub-src"
    mkdir -p "$rsrc"
    perl -ne '
        BEGIN { @order = (); %seen = (); %vals = (); %done = ();
                print "package com.innioasis.y1;\n";
                print "// AUTO-GENERATED R stub from res/values/public.xml (compile-time only).\n";
                print "public final class R {\n"; }
        if (/type="([^"]+)"\s+name="([^"]+)"\s+id="(0x[0-9a-fA-F]+)"/) {
            my ($t, $n, $i) = ($1, $2, $3);
            next unless $n =~ /^[A-Za-z_][A-Za-z0-9_]*$/;   # dotted style names are not identifiers
            push @order, $t unless $seen{$t}++;
            push @{ $vals{$t} }, [$n, $i] unless $done{"$t/$n"}++;   # dedupe: keep the first
        }
        END {
            for my $t (@order) {
                print "  public static final class $t {\n";
                print "    public static final int $_->[0] = $_->[1];\n" for @{ $vals{$t} };
                print "  }\n";
            }
            print "}\n";
        }
    ' "$PUBLIC_XML" > "$rsrc/R.java"
    rm -rf "$RSTUB_DIR"
    mkdir -p "$RSTUB_DIR"
    "$JAVAC" -source 8 -target 8 -Xlint:-options -encoding UTF-8 \
        -bootclasspath "$ANDROID_JAR" -d "$RSTUB_DIR" "$rsrc/R.java"
}

mkdir -p "$WORK"

if [ "$STUBS_ONLY" = 1 ]; then
    new_stubs
    new_rstub
    note "Done."
    exit 0
fi

# the R stub, if missing or older than public.xml
if [ ! -f "$RSTUB_DIR/com/innioasis/y1/R.class" ] || [ "$PUBLIC_XML" -nt "$RSTUB_DIR/com/innioasis/y1/R.class" ]; then
    new_rstub
fi

# the app stubs, if missing or older than the newest APK
FRESH_APK="$(newest_apk)"
if [ ! -f "$STUBS_JAR" ] || { [ -n "$FRESH_APK" ] && [ "$FRESH_APK" -nt "$STUBS_JAR" ]; }; then
    new_stubs
fi

# collect .java
if [ ! -d "$SRC_DIR" ]; then
    note "No .java under $SRC_DIR -- nothing to compile."
    exit 0
fi

# Every file list here is handed to xargs NUL-separated. A path can contain a space — a checkout
# under "Claude Projects" does — and both javac's @argfile and plain xargs split on whitespace:
# javac answers `invalid flag: /mnt/h/Claude` and stops. `sort` then `tr` rather than `sort -z`,
# which is GNU-only; a newline inside a source path would break this, and there is none.
JAVA_LIST="$WORK/sources.txt"
find "$SRC_DIR" -name '*.java' | sort > "$JAVA_LIST"
COUNT="$(wc -l < "$JAVA_LIST" | tr -d ' ')"
[ "$COUNT" != "0" ] || { note "No .java under $SRC_DIR -- nothing to compile."; exit 0; }
note "Sources ($COUNT):"
sed "s|^$SRC_DIR/|  |" "$JAVA_LIST"
tr '\n' '\0' < "$JAVA_LIST" > "$JAVA_LIST.z"

CLS="$WORK/classes"; DEX="$WORK/dex"; SM="$WORK/smali"
rm -rf "$CLS" "$DEX" "$SM"
mkdir -p "$CLS" "$DEX" "$SM"

# 1. javac (bootclasspath = android.jar API17; classpath = R stub first, so its complete R wins
#    over the partial one inside app-stubs)
note "javac..."
xargs -0 "$JAVAC" -source 8 -target 8 -Xlint:-options -encoding UTF-8 \
    -bootclasspath "$ANDROID_JAR" -classpath "$RSTUB_DIR:$STUBS_JAR" \
    -d "$CLS" < "$JAVA_LIST.z"

# 2. d8 (min-api 17). The class files are passed as arguments, as they are on the Windows side.
#    -x makes xargs FAIL if the list ever outgrows the command-line limit instead of splitting it:
#    a second d8 run would quietly overwrite classes.dex with half the classes.
note "d8..."
find "$CLS" -name '*.class' | sort | tr '\n' '\0' > "$WORK/classes.z"
xargs -0 -x "$JAVA" -cp "$D8_JAR" com.android.tools.r8.D8 --min-api 17 \
    --lib "$ANDROID_JAR" --lib "$STUBS_JAR" --output "$DEX" < "$WORK/classes.z"

# 3. baksmali (dex -> smali)
note "baksmali..."
"$JAVA" -cp "$D2J_CP" com.googlecode.d2j.smali.BaksmaliCmd -f -o "$SM" "$DEX/classes.dex"

find "$SM" -name '*.smali' | sort > "$WORK/produced.txt"
note "Produced smali ($(wc -l < "$WORK/produced.txt" | tr -d ' ')):"
sed "s|^$SM/|  |" "$WORK/produced.txt"

# 3a/3b. The two literal forms d2j-baksmali writes and apktool's assembler reads differently. Both
# failures are SILENT at build time, which is why they are fixed here rather than avoided by hand:
#
#   const/high16 — d2j writes the pre-shifted 16-bit value (16768 for 16.0f), the assembler wants
#   the full 32-bit one (0x41800000). Every float in UI code walks into this.
#
#   .array-data — d2j writes each element as its individual BYTES (`5t 0t 0t 0t` for the int 5 in a
#   `.array-data 4` block) and the assembler reads every one of those as an element of its own: a
#   12-int array assembles into 48 entries, fill-array-data overruns the new-array, and the class
#   fails to initialise at RUNTIME. Regroup the bytes into one literal per element, little-endian,
#   in the declared width.
cat > "$WORK/fixsmali.pl" <<'PERL'
use strict;
use warnings;
for my $p (@ARGV) {
    open(my $fh, '<:raw', $p) or die "$p: $!";
    my $t = do { local $/; <$fh> };
    close $fh;
    my $orig = $t;
    my $eol = ($t =~ /\r\n/) ? "\r\n" : "\n";

    my $hi = 0;
    $t =~ s{(const(?:-wide)?/high16 [vp]\d+,\s*)(-?\d+)\b}
           { $hi++; $1 . sprintf("0x%04X0000", $2 & 0xFFFF) }ge;

    my $ad = 0;
    $t =~ s{^([ \t]*)\.array-data[ \t]+(\d+)[ \t]*\r?\n(.*?)^([ \t]*)\.end array-data}{
        my $whole = $&;                      # captured first: the matches below clobber $&
        my ($indent, $w, $body, $endind) = ($1, $2, $3, $4);
        my @bytes  = ($body =~ /(-?\d+)t\b/g);
        my @tokens = ($body =~ /(\S+)/g);
        # only the byte-split form, and only when it divides evenly into elements
        if (!@bytes || scalar(@bytes) != scalar(@tokens) || $w < 1 || (scalar(@bytes) % $w)) {
            $whole;
        } else {
            $ad++;
            my $out = $indent . ".array-data $w" . $eol;
            for (my $i = 0; $i < scalar(@bytes); $i += $w) {
                my $v = 0;
                for (my $k = $w - 1; $k >= 0; $k--) {
                    $v = ($v << 8) | ($bytes[$i + $k] & 0xFF);
                }
                if ($w < 8) {                # sign-extend to the declared width
                    my $bits = $w * 8;
                    $v -= (1 << $bits) if $v & (1 << ($bits - 1));
                }
                $out .= $indent . "    " . $v . ($w == 8 ? "L" : "") . $eol;
            }
            $out . $endind . ".end array-data";
        }
    }gems;

    next if $t eq $orig;
    open(my $out, '>:raw', $p) or die "$p: $!";
    print $out $t;
    close $out;
    my $name = $p; $name =~ s{.*/}{};
    print "  fixed high16 in $name\n"     if $hi;
    print "  fixed array-data in $name\n" if $ad;
}
PERL
tr '\n' '\0' < "$WORK/produced.txt" | xargs -0 perl "$WORK/fixsmali.pl"

if [ "$DRY_RUN" = 1 ]; then
    note "--dry-run: not copying into the tree. Output: $SM"
    exit 0
fi

# 4. copy the generated smali into the tree. d8 only dexes what we compiled, so the baksmali output
#    holds nothing but our own classes: com/innioasis/ipp/* plus the two Java-authored classes in
#    the otherwise-stock com/innioasis/y1/activity. Copying each package therefore never overwrites
#    a stock file.
[ -d "$SM/com/innioasis/ipp" ] || die "Expected package com/innioasis/ipp in baksmali output, not found"
for pkg in com/innioasis/ipp com/innioasis/y1/activity; do
    [ -d "$SM/$pkg" ] || continue
    mkdir -p "$TREE_OUT/$pkg"
    cp -R "$SM/$pkg/." "$TREE_OUT/$pkg/"
    note "Copied $pkg"
done
note "Done. Next: build/build.sh"
