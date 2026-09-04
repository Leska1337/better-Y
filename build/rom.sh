#!/usr/bin/env bash
# Builds the release image for better-Y: the rom.zip that the updaters install.
#
#   ./build/rom.sh                    # newest APK in build/out
#   ./build/rom.sh --apk <path>
#   ./build/rom.sh --minimal          # rom.zip with system.img alone - read the note below first
#
# Output lands in build/rom-out/rom.zip. The system.img is not written out beside it: it is in the
# archive already, and the archive is smaller than the bare image, so anyone who wants to flash
# that one partition by hand takes it out of there.
#
# The Linux side of rom.ps1 (which does the same work through WSL). It needs a Linux userland:
# python3, simg2img, debugfs and e2fsck (e2fsprogs, android-sdk-libsparse-utils or equivalent).
#
# rom.zip carries the WHOLE 3.1.2 set - every partition install_rom_sp.xml lists. One is that a
# manual SP Flash Tool run should leave no partition at an older version. The other is how the
# Updater picks files: it resolves each name in the extracted archive first, then in ITS OWN
# FOLDER, which still holds whatever stock images the user downloaded earlier and is never cleared.
# So leaving an image out does not mean "do not flash that partition" - it means "flash whatever
# happens to be lying around". The cost is that usrdata IS rewritten: settings, theme and the
# library database go back to factory. Say so in the release notes.
#
# Only one file in that set is not the stock one: system.img carries our launcher. adb needs no
# boot image of ours - the mod turns it on itself, by setting persist.sys.usb.config from the
# launcher (Panel.adb), which works on the factory boot as well.

. "$(dirname "$0")/lib.sh"

APK=""
OUT=""
MINIMAL=0
ALLOW_DEV=0
while [ $# -gt 0 ]; do
    case "$1" in
        --apk)     shift; APK="${1:-}"; [ -n "$APK" ] || die "--apk needs a path" ;;
        --out)     shift; OUT="${1:-}"; [ -n "$OUT" ] || die "--out needs a path" ;;
        --minimal) MINIMAL=1 ;;
        --allow-dev) ALLOW_DEV=1 ;;
        -h|--help) sed -n '2,25p' "$0"; exit 0 ;;
        *) die "unknown option: $1" ;;
    esac
    shift
done

[ -n "$OUT" ] || OUT="$BUILD_DIR/rom-out"
# Every image comes from the y1-community base, the archive Updater CE installs as clean 3.1.2 and
# the one anyone can download. Its system.img is the factory one plus Wi-Fi/GPS support and carries
# the SAME launcher, byte for byte, so the mod applies identically and nobody loses the radios by
# installing us. Its other images are the factory ones padded out with zeros to the partition size,
# which costs nothing in the archive (zeros compress) and nothing when flashed; the exception is
# preloader, built three months earlier, and that partition is written by neither the Updater nor
# our own install instructions.
BASE_ZIP="$ROOT/ROM/y1-community_y1-stock-rom_Latest-3.1.2.zip"

for t in python3 simg2img debugfs e2fsck cmp md5sum; do
    have "$t" || die "no $t — this script needs a Linux userland (e2fsprogs, libsparse tools)"
done
[ -f "$BASE_ZIP" ] || die "no stock archive at $BASE_ZIP"

if [ -z "$APK" ]; then
    APK="$(ls -t "$BUILD_DIR"/out/*.apk 2>/dev/null | head -1)"
fi
[ -n "$APK" ] && [ -f "$APK" ] || die "APK not found: ${APK:-none in $BUILD_DIR/out}"
# rom.zip is what the updaters install, so the launcher in it is the one users end up with: a build
# of the day has no business there. --allow-dev is for trying the pipeline out on one.
if [ "$ALLOW_DEV" -eq 0 ]; then
    case "$(basename "$APK")" in
        *-dev[0-9]*.apk) die "$(basename "$APK") is a dev build - build with --release first, or pass --allow-dev" ;;
    esac
fi

printf 'launcher: %s (%s B)\n' "$(basename "$APK")" "$(wc -c < "$APK" | tr -d ' ')"

# The work is 700 MB of images read and written several times over; it happens under the output
# directory, which is ignored by git, and is removed when the archive is packed. Point
# IPP_ROM_WORK at a native filesystem when the repository itself is not on one - under WSL, work
# on /mnt/<drive> goes through the 9p bridge and takes minutes per pass.
WORK="${IPP_ROM_WORK:-$OUT/.work}"
mkdir -p "$OUT"
rm -rf "$WORK"
mkdir -p "$WORK"

STOCK=("MT6572_Android_scatter.txt")
if [ "$MINIMAL" -eq 0 ]; then
    STOCK+=("preloader_g368_nyx.bin" "MBR" "EBR1" "lk.bin" "boot.img"
            "recovery.img" "secro.img" "logo.bin" "cache.img" "userdata.img")
fi

echo "[1/6] staging the stock images"
# python3's zipfile stands in for unzip, which a bare distro may not have
stage() {   # stage <zip> <name>...
    ( cd "$WORK" && python3 - "$@" <<'PY'
import sys, zipfile
z = zipfile.ZipFile(sys.argv[1])
for n in sys.argv[2:]:
    open(n, "wb").write(z.read(n))
PY
    )
}
stage "$BASE_ZIP" "${STOCK[@]}" system.img
cp "$APK" "$WORK/new.apk"
( cd "$WORK" && ls -l ) | tail -n "$(( ${#STOCK[@]} + 2 ))"

echo "[2/6] preparing the raw ext4 image"
# the community system.img is already raw; the factory one is sparse. Take either.
if head -c4 "$WORK/system.img" | od -An -tx1 | grep -q '3a ff 26 ed'; then
    simg2img "$WORK/system.img" "$WORK/system.raw.img"
    rm -f "$WORK/system.img"
else
    mv "$WORK/system.img" "$WORK/system.raw.img"
fi
# A raw ext4 image is shorter than its partition - it is the sparse image expanded and trimmed.
# debugfs and our sparse packer both address blocks by the superblock's own count, so pad it back
# out to blocks * block_size before touching it.
python3 - "$WORK/system.raw.img" <<'PY'
import os, struct, sys
p = sys.argv[1]
with open(p, "rb") as f:
    f.seek(1024)
    sb = f.read(1024)
if sb[56:58] != b"\x53\xef":
    raise SystemExit("not ext4: " + p)
blocks = struct.unpack("<I", sb[4:8])[0]
size = blocks * (1024 << struct.unpack("<I", sb[24:28])[0])
have = os.path.getsize(p)
if have < size:
    with open(p, "ab") as f:
        f.truncate(size)
    print("      padded %d -> %d bytes" % (have, size))
PY
printf '      %s bytes\n' "$(wc -c < "$WORK/system.raw.img" | tr -d ' ')"

echo "[3/6] swapping the launcher in (debugfs, no mount)"
# debugfs edits ext4 in place as an ordinary user - no mount, no sudo. It writes into the image's
# current directory, so the `cd app` comes first, and the file arrives owned by the calling user
# with an extra_isize the factory files do not have; the three sif lines put that back.
( cd "$WORK" && debugfs -w -f - system.raw.img >/dev/null 2>&1 <<'EOF'
cd app
rm com.innioasis.y1_3.1.2.apk
write new.apk com.innioasis.y1_3.1.2.apk
sif com.innioasis.y1_3.1.2.apk mode 0100644
sif com.innioasis.y1_3.1.2.apk uid 0
sif com.innioasis.y1_3.1.2.apk gid 0
EOF
)

echo "[4/6] verifying the image"
# read the launcher back out of the image and compare it with what went in
( cd "$WORK" && debugfs -R 'dump app/com.innioasis.y1_3.1.2.apk check.apk' system.raw.img >/dev/null 2>&1 )
cmp "$WORK/check.apk" "$WORK/new.apk" || die "the launcher in the image differs from the APK"
echo "      launcher in image: identical"
e2fsck -fn "$WORK/system.raw.img" 2>&1 | tail -2 | sed 's/^/      /'

echo "[5/6] raw -> sparse (RAW + DONT_CARE only)"
# NOT img2simg: its FILL chunks are what MT6572's DA cannot write (S_DA_SDMMC_WRITE_FAILED at 1%)
python3 "$BUILD_DIR/rom-tools/mksparse.py" "$WORK/system.raw.img" "$WORK/system_ipp.img"
simg2img "$WORK/system_ipp.img" "$WORK/rt.img"
cmp "$WORK/system.raw.img" "$WORK/rt.img" || die "the sparse image does not expand back to the raw one"
rm -f "$WORK/rt.img" "$WORK/system.raw.img" "$WORK/check.apk" "$WORK/new.apk"
echo "      sparse round-trip: identical"

echo "[6/6] packing rom.zip"
( cd "$WORK" && python3 - "${STOCK[@]}" <<'PY'
import os, sys, zipfile
z = zipfile.ZipFile("rom.zip", "w", zipfile.ZIP_DEFLATED, compresslevel=6)
z.write("system_ipp.img", "system.img")     # our image under the name the Updater looks for
for n in sys.argv[1:]:
    if n != "system.img" and os.path.isfile(n):
        z.write(n)                          # untouched factory images
z.close()
for n in z.namelist():
    print("      %-28s %10d" % (n, os.path.getsize("system_ipp.img" if n == "system.img" else n)))
PY
)
mv "$WORK/rom.zip" "$OUT/rom.zip"
rm -rf "$WORK"

printf '\nOK\n'
printf '  rom.zip     %12d B   Innioasis Updater asset - keep this exact name\n' "$(wc -c < "$OUT/rom.zip" | tr -d ' ')"
