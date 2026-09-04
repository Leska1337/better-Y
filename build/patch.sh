#!/usr/bin/env bash
# Builds (and verifies) the publishable form of better-Y.
#
# The mod is a set of edits to a decompiled stock launcher, and the stock tree is not ours to
# republish. So what goes out is: our own files as they are, a unified diff of the stock files we
# edited, a list of the stock files we delete, and a manifest pinning the exact inputs those were
# taken against. Nothing here is stored — every artefact is generated from git on demand.
#
#   ./build/patch.sh --export            -> publish/  (manifest.json, stock.diff, files/, delete.txt,
#                                                      plus README/LICENSE/screenshots from build/publish-src
#                                                      and the build scripts, Java sources and image tools)
#   ./build/patch.sh --apply <tree>      -> applies publish/ onto a freshly decompiled stock tree
#   ./build/patch.sh --verify            -> decompiles the factory APK, applies, compares to build/src
#
# --verify is the one that matters before a release: it proves the published set is enough to
# reproduce the tree we actually build from. The macOS/Linux side of patch.ps1.

. "$(dirname "$0")/lib.sh"

MODE="export"
TREE=""
SET_DIR="$ROOT/publish"
BASE=""
ALLOW_DEV=0

while [ $# -gt 0 ]; do
    case "$1" in
        --export) MODE="export" ;;
        --apply)  MODE="apply"; shift; TREE="${1:-}"; [ -n "$TREE" ] || die "--apply needs a tree" ;;
        --verify) MODE="verify" ;;
        --set)    shift; SET_DIR="${1:-}" ;;
        --base)   shift; BASE="${1:-}" ;;
        --allow-dev) ALLOW_DEV=1 ;;
        -h|--help) sed -n '2,20p' "$0"; exit 0 ;;
        *) die "unknown option: $1" ;;
    esac
    shift
done

have git || die "no git"
have perl || die "no perl"
setup_apktool

SRC="$BUILD_DIR/src"
STOCK_APK="$ROOT/version 3.1.2 original apk/com.innioasis.y1_3.1.2.apk"

apktool_version() { "${APKTOOL[@]}" --version 2>/dev/null | head -1 | tr -d '\r' | tr -d ' '; }

# the baseline is the root commit: the factory tree, decompiled with the pinned apktool
get_base() {
    if [ -n "$BASE" ]; then printf '%s' "$BASE"; return; fi
    git -C "$ROOT" rev-list --max-parents=0 HEAD | head -1
}

manifest_field() {   # manifest_field <file> <key>  — enough for the flat keys we read
    sed -n "s/.*\"$2\"[[:space:]]*:[[:space:]]*\"\([^\"]*\)\".*/\1/p" "$1" | head -1
}

# --------------------------------------------------------------------------------------- export

do_export() {
    local base
    base="$(get_base)"
    # The set is rebuilt from scratch, but NOT the git repository that lives in it: once the
    # public repo has been cloned or pushed from here, publish/.git holds its history, its remote
    # and its identity. Wiping it turns the next `git` run inside publish/ into a run against the
    # PARENT repository -- git finds no .git beside it and walks up -- and that one carries the
    # whole decompiled stock launcher and must never be pushed anywhere. Everything else goes.
    if [ -d "$SET_DIR" ]; then
        find "$SET_DIR" -mindepth 1 -maxdepth 1 ! -name .git -exec rm -rf {} +
    fi
    mkdir -p "$SET_DIR/files"

    # a "-" line count marks a binary file: it cannot be carried as a diff hunk
    local binlist="$SET_DIR/.binary"
    git -C "$ROOT" diff --numstat "$base" HEAD -- build/src \
        | awk -F'\t' '$1 == "-" && $2 == "-" { print $3 }' > "$binlist"

    local added=() modtext=() modbin=() deleted=()
    local st path
    while IFS=$'\t' read -r st path rest; do
        [ -n "${path:-}" ] || continue
        # apktool's original/ holds the factory's own manifest and signature; the build never reads it
        case "$path" in build/src/original/*) continue ;; esac
        case "${st:0:1}" in
            A) added+=("$path") ;;
            D) deleted+=("$path") ;;
            M) if grep -qxF "$path" "$binlist"; then modbin+=("$path"); else modtext+=("$path"); fi ;;
        esac
    done < <(git -C "$ROOT" diff --name-status "$base" HEAD -- build/src)
    rm -f "$binlist"

    # 1. the diff of the stock files we edited — text only. git writes the file itself: piping it
    #    through a shell that rewrites line endings would break every hunk, because apktool writes
    #    many of these files with CRLF.
    # (the ${arr[@]+"${arr[@]}"} form throughout: an empty array under `set -u` is an error in the
    # bash 3.2 macOS still ships)
    [ "${#modtext[@]}" -gt 0 ] || die "nothing to diff — is HEAD the same tree as the base commit?"
    git -C "$ROOT" diff --output="$SET_DIR/stock.diff" "$base" HEAD -- "${modtext[@]}"

    # 2. our own files, plus the stock binaries we replaced, copied verbatim
    local copied=0 rel dst
    for path in ${added[@]+"${added[@]}"} ${modbin[@]+"${modbin[@]}"}; do
        rel="${path#build/src/}"
        dst="$SET_DIR/files/$rel"
        mkdir -p "$(dirname "$dst")"
        cp "$ROOT/$path" "$dst"
        copied=$((copied + 1))
    done

    # 3. what the mod removes from the stock tree
    : > "$SET_DIR/delete.txt"
    for path in ${deleted[@]+"${deleted[@]}"}; do printf '%s\n' "${path#build/src/}" >> "$SET_DIR/delete.txt"; done

    # 4. the inputs all of the above was taken against — a diff is only safe on a pinned tree
    [ -f "$STOCK_APK" ] || die "no factory APK at $STOCK_APK"
    local apk_size apk_md5 ver
    apk_size="$(wc -c < "$STOCK_APK" | tr -d ' ')"
    apk_md5="$(md5_of "$STOCK_APK")"
    ver="$(mod_version)"
    cat > "$SET_DIR/manifest.json" <<JSON
{
    "mod_version":  "$ver",
    "base_commit":  "$base",
    "apktool_version":  "$(apktool_version)",
    "apktool_command":  "apktool d -f -o <tree> com.innioasis.y1_3.1.2.apk",
    "stock_apk":  {
                      "md5":  "$apk_md5",
                      "name":  "$(basename "$STOCK_APK")",
                      "size":  $apk_size
                  },
    "counts":  {
                   "ours":  ${#added[@]},
                   "patched":  ${#modtext[@]},
                   "patched_binary":  ${#modbin[@]},
                   "deleted":  ${#deleted[@]}
               }
}
JSON

    # 5. what the public repository needs around all of the above (README, LICENSE, screenshots).
    # These are authored, not generated, so they live in build/publish-src and are copied verbatim.
    # --apply reads only manifest.json, stock.diff, files/ and delete.txt, so they are inert for it.
    # Copied with their subfolders: the README pictures live in publish-src/screenshots and a
    # flat copy would publish a README whose every <img> is broken.
    local extras=0
    if [ -d "$BUILD_DIR/publish-src" ]; then
        while IFS= read -r f; do
            rel="${f#$BUILD_DIR/publish-src/}"
            mkdir -p "$SET_DIR/$(dirname "$rel")"
            cp "$f" "$SET_DIR/$rel"
            extras=$((extras + 1))
        done < <(find "$BUILD_DIR/publish-src" -type f)
    fi

    # 6. the scripts that turn everything above back into an APK, and the ones that make a boot
    # image. The README hands the reader `build/patch.sh --apply tree` and `build/build.sh` by
    # name, so they are copied under their REPO-RELATIVE paths and those commands work as written.
    # build/rom-tools goes with them because mkboot.py is how a reader gets a boot image with adb on,
    # and that is the only way to install a build without SP Flash Tool.
    local scripts=0
    while IFS= read -r f; do
        rel="${f#$ROOT/}"
        mkdir -p "$SET_DIR/$(dirname "$rel")"
        cp "$f" "$SET_DIR/$rel"
        scripts=$((scripts + 1))
    done < <( { find "$ROOT/build" -maxdepth 1 -type f \( -name '*.ps1' -o -name '*.sh' \)
                find "$ROOT/build/ipp-java/src" -type f -name '*.java'
                find "$ROOT/build/rom-tools" -type f -name '*.py'; } )

    printf 'exported to %s\n' "$SET_DIR"
    printf '  ours + replaced binaries : %d files (%d KB)\n' "$copied" \
        "$(( $(find "$SET_DIR/files" -type f -exec cat {} + | wc -c) / 1024 ))"
    printf '  stock.diff               : %d files (%d KB)\n' "${#modtext[@]}" \
        "$(( $(wc -c < "$SET_DIR/stock.diff") / 1024 ))"
    printf '  delete.txt               : %d paths\n' "${#deleted[@]}"
    printf '  publish-src              : %d files (README, LICENSE, screenshots)\n' "$extras"
    printf '  build scripts + image tools: %d files (both script sets, Java sources, mkboot)\n' "$scripts"
}

# ---------------------------------------------------------------------------------------- apply

do_apply() {
    local tree="$1"
    tree="$(cd "$tree" && pwd)"
    local want have_ver
    want="$(manifest_field "$SET_DIR/manifest.json" apktool_version)"
    have_ver="$(apktool_version)"
    if [ "$want" != "$have_ver" ]; then
        die "apktool mismatch: the set was made with $want, this machine has $have_ver. A unified diff only applies to an identically decompiled tree."
    fi

    # -c core.autocrlf=false is NOT optional: the target tree is outside any repository, so git
    # falls back to the machine's global setting, and CRLF there rewrites files apktool wrote LF.
    # --whitespace=nowarn: smali is machine-written, its trailing space is not ours to fix.
    ( cd "$tree" && git -c core.autocrlf=false -c core.safecrlf=false apply --unsafe-paths \
        --whitespace=nowarn -p3 --directory=. "$SET_DIR/stock.diff" )

    local rel dst
    while IFS= read -r rel; do
        dst="$tree/${rel#"$SET_DIR/files/"}"
        mkdir -p "$(dirname "$dst")"
        cp -f "$rel" "$dst"
    done < <(find "$SET_DIR/files" -type f)

    # The CR strip is not cosmetic: a set exported on Windows has CRLF here, and a path with a
    # trailing \r simply does not exist — every deletion would be skipped without a word.
    while IFS= read -r rel; do
        rel="${rel%$'\r'}"
        [ -n "$rel" ] || continue
        rm -rf "$tree/$rel"
    done < "$SET_DIR/delete.txt"

    printf 'applied %s onto %s\n' "$SET_DIR" "$tree"
}

# --------------------------------------------------------------------------------------- verify

# A difference is "equivalent" when every changed line is a .field declaration — the one thing two
# apktool versions legitimately write differently.
field_default_only() {
    perl -e '
        my ($pa, $pb) = @ARGV;
        exit 1 unless $pa =~ /\.smali$/;
        sub slurp { open(my $f, "<:raw", $_[0]) or exit 1; my $t = do { local $/; <$f> }; close $f; $t =~ s/\r//g; return $t; }
        my $a = slurp($pa); my $b = slurp($pb);
        exit 0 if $a eq $b;                       # line endings only
        my @la = split /\n/, $a, -1; my @lb = split /\n/, $b, -1;
        exit 1 if scalar(@la) != scalar(@lb);
        for my $i (0 .. $#la) {
            next if $la[$i] eq $lb[$i];
            exit 1 unless $la[$i] =~ /^\.field / && $lb[$i] =~ /^\.field /;
            my ($da) = split / = /, $la[$i], 2;
            my ($db) = split / = /, $lb[$i], 2;
            exit 1 unless $da eq $db;
        }
        exit 0;
    ' "$1" "$2"
}

# "<md5><TAB><relative path>" for every file under a tree, minus the top-level entries the build
# does not read (build/ and dist/ are apktool's own output, original/ holds the factory's manifest
# and signature, apktool.yml records the APK it was decompiled from).
#
# One md5 process for the whole tree, not one per file: these trees hold ~14 000 files, and a
# process per file is minutes of pure spawn overhead. NUL-separated so a path with a space cannot
# split a record, and the output is normalised because md5sum prints "hash  path" while macOS's
# md5 -r prints "hash path".
tree_hashes() {
    local sum
    if have md5sum; then sum=(md5sum); elif have md5; then sum=(md5 -r); else die "no md5sum or md5"; fi
    ( cd "$1" && find . -type f \
        -not -path './build/*' -not -path './dist/*' -not -path './original/*' \
        -not -path './apktool.yml' -print0 | xargs -0 "${sum[@]}" ) \
        | sed 's|^\([0-9a-fA-F]\{32\}\)  *\./|\1\t|' | sort -t"$(printf '\t')" -k2
}

do_verify() {
    local want md5
    want="$(manifest_field "$SET_DIR/manifest.json" md5)"
    md5="$(md5_of "$STOCK_APK")"
    [ "$md5" = "$want" ] || die "factory APK MD5 $md5 does not match the manifest"

    local tmp
    tmp="$(mktemp -d "${TMPDIR:-/tmp}/ipp-verify-XXXXXXXX")"
    printf '[1/3] decompiling the factory APK into %s\n' "$tmp"
    "${APKTOOL[@]}" d -f -o "$tmp" "$STOCK_APK" >/dev/null

    printf '[2/3] applying the published set\n'
    do_apply "$tmp"

    printf '[3/3] comparing against build/src\n'
    local ha="$tmp/../$(basename "$tmp").a.md5" hb="$tmp/../$(basename "$tmp").b.md5"
    tree_hashes "$tmp" > "$ha"
    tree_hashes "$SRC" > "$hb"

    local real=() equivalent=() f line
    # awk holds both sides keyed by path — bash 3.2 (macOS) has no associative arrays
    while IFS= read -r line; do
        case "$line" in
            +*) real+=("only in applied tree: ${line#+}") ;;
            -*) real+=("missing from applied tree: ${line#-}") ;;
            "!"*) f="${line#!}"
                  if field_default_only "$tmp/$f" "$SRC/$f"; then equivalent+=("$f"); else real+=("differs: $f"); fi ;;
        esac
    done < <(awk -F'\t' '
        NR == FNR { a[$2] = $1; next }
        { b[$2] = $1 }
        END {
            for (p in a) { if (!(p in b)) print "+" p; else if (a[p] != b[p]) print "!" p }
            for (p in b) { if (!(p in a)) print "-" p }
        }' "$ha" "$hb")
    rm -f "$ha" "$hb"

    if [ "${#equivalent[@]}" -gt 0 ]; then
        # Our tree was first decompiled by an older apktool, which wrote a field's default value
        # into the .field line; 2.11.1 leaves it out. Same code, and these files are not in the
        # patch, so a builder simply keeps their own form.
        printf '%d file(s) differ only in how baksmali writes a field default - equivalent:\n' "${#equivalent[@]}"
        printf '    %s\n' "${equivalent[@]:0:5}"
        [ "${#equivalent[@]}" -gt 5 ] && printf '    ... and %d more\n' "$(( ${#equivalent[@]} - 5 ))"
    fi
    if [ "${#real[@]}" -eq 0 ]; then
        printf 'OK - the published set reproduces build/src\n'
        rm -rf "$tmp"
    else
        printf '%d real difference(s):\n' "${#real[@]}"
        printf '  %s\n' "${real[@]:0:40}"
        printf 'tree kept at %s\n' "$tmp"
        exit 1
    fi
}

# The set in publish/ is what the public repository is built from, so it is exported off a release
# tree, not off a build of the day. --verify is not held to this: reproducing the tree is worth
# checking at any point.
if [ "$MODE" = "export" ] && [ "$ALLOW_DEV" -eq 0 ]; then
    case "$(mod_version)" in
        *-dev[0-9]*) die "the tree is at $(mod_version) - a dev build is not published; build with --release, or pass --allow-dev" ;;
    esac
fi

case "$MODE" in
    export) do_export ;;
    apply)  do_apply "$TREE" ;;
    verify) do_export; do_verify ;;
esac
