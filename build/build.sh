#!/usr/bin/env bash
# Builds, signs (AOSP platform testkey) and verifies the better-Y modded APK.
# Output name: better-Y_3.1.2_<mod_version>.apk  (mod_version read from ipp_version in strings.xml)
#
#   ./build/build.sh
#
# The macOS/Linux side of build.ps1: same four steps, same output. Tools are found as described in
# lib.sh. The signing key is not in the repository — it is the public AOSP platform testkey, and
# the README says where to get it and what fingerprint it must print.

. "$(dirname "$0")/lib.sh"

OUT="$BUILD_DIR/out"
DEST="/data/local/tmp/ipp.apk"   # fixed device path (our boot image, /ipp_installer.sh) - do not change

setup_apktool
setup_zipalign
setup_apksigner

KEY="$BUILD_DIR/keys/platform.pk8"
CERT="$BUILD_DIR/keys/platform.x509.pem"
[ -f "$KEY" ] && [ -f "$CERT" ] || die "no signing key in build/keys — see the README (AOSP platform testkey)"

VER="$(mod_version)"
APK_NAME="better-Y_3.1.2_$VER.apk"
# The versionCode is derived from the same string and written into apktool.yml on every build.
# It has to GROW, because that is the only thing that decides whether a build put on the player
# with `adb install -r` is still there after a reboot: PackageManager compares the copy in /data
# with the one in /system, and on anything but a higher number it reverts the update. On this
# firmware that revert also takes the launcher out of the package database -- there is then no
# home activity at all, and the player hangs on the boot logo until the next reboot rescans
# /system. So the number is never edited by hand and never lowered.
VER_CODE="$(sync_version_code "$VER")"
printf 'mod version: %s (versionCode %s)  ->  %s\n' "$VER" "$VER_CODE" "$APK_NAME"

mkdir -p "$OUT"
UNSIGNED="$OUT/unsigned.apk"
ALIGNED="$OUT/aligned.apk"
FINAL="$OUT/$APK_NAME"

echo "[1/4] apktool build..."
"${APKTOOL[@]}" b "$BUILD_DIR/src" -o "$UNSIGNED"

echo "[2/4] zipalign..."
"$ZIPALIGN" -p -f 4 "$UNSIGNED" "$ALIGNED"

echo "[3/4] sign (platform key)..."
"${APKSIGNER[@]}" sign \
    --key "$KEY" --cert "$CERT" \
    --min-sdk-version 17 --v1-signing-enabled true --v2-signing-enabled true --v3-signing-enabled false \
    --out "$FINAL" "$ALIGNED"

echo "[4/4] verify..."
"${APKSIGNER[@]}" verify --min-sdk-version 17 --print-certs "$FINAL" | grep -E "SHA-1 digest|Verifies" || true

rm -f "$UNSIGNED" "$ALIGNED"
# builds live only in build/out
printf '\nOK -> %s\n' "$FINAL"
printf 'Push: adb push "%s" %s\n' "$FINAL" "$DEST"
