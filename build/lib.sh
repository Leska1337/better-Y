#!/usr/bin/env bash
# Shared bits of the bash build scripts. Sourced, never run.
#
# These scripts are the macOS/Linux side of build.ps1, ipp-java.ps1 and patch.ps1; the two sides do
# the same steps in the same order and produce the same artefacts. Windows keeps the .ps1 — a Unix
# shell is assumed here down to the classpath separator (':') and forward slashes.
#
# Every tool is looked for in the same three places, in this order: an environment variable, the
# copy this repository's Windows side keeps under build/tools and build/sdk, then PATH (plus
# $ANDROID_HOME/build-tools for the SDK ones). So a checkout that already carries the Windows
# toolchain needs no setup at all, and a bare clone needs either the variables or the tools
# installed. build/tools, build/sdk and build/keys are NOT in the repository.
#
#   JAVA, JAVAC             java / javac to use
#   APKTOOL_JAR             apktool 2.11.1 (the version is checked where it matters)
#   ZIPALIGN, APKSIGNER_JAR from any Android build-tools
#   D8_JAR                  d8 from the same build-tools
#   ANDROID17_JAR           an API 17 android.jar
#   DEX2JAR_LIB             the lib/ directory of dex-tools 2.4
#   ANDROID_HOME            searched for build-tools when the above are unset

set -euo pipefail

BUILD_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(dirname "$BUILD_DIR")"

die() { printf '%s\n' "$*" >&2; exit 1; }
have() { command -v "$1" >/dev/null 2>&1; }
note() { printf '%s\n' "$*"; }

# Newest build-tools directory under $ANDROID_HOME, or nothing.
sdk_build_tools() {
    local home="${ANDROID_HOME:-${ANDROID_SDK_ROOT:-}}"
    [ -n "$home" ] && [ -d "$home/build-tools" ] || return 0
    ls -1d "$home"/build-tools/*/ 2>/dev/null | sort -V | tail -1
}

setup_java() {
    JAVA="${JAVA:-}"
    if [ -z "$JAVA" ]; then
        if [ -n "${JAVA_HOME:-}" ] && [ -x "$JAVA_HOME/bin/java" ]; then JAVA="$JAVA_HOME/bin/java"
        elif have java; then JAVA="java"
        else die "no java: install a JDK, or set JAVA"
        fi
    fi
}

setup_javac() {
    JAVAC="${JAVAC:-}"
    if [ -z "$JAVAC" ]; then
        if [ -n "${JAVA_HOME:-}" ] && [ -x "$JAVA_HOME/bin/javac" ]; then JAVAC="$JAVA_HOME/bin/javac"
        elif have javac; then JAVAC="javac"
        else die "no javac: install a JDK (a JRE is not enough), or set JAVAC"
        fi
    fi
}

# APKTOOL is an array: it may be a jar we run with java, or a wrapper script on PATH.
setup_apktool() {
    setup_java
    if [ -n "${APKTOOL_JAR:-}" ]; then
        [ -f "$APKTOOL_JAR" ] || die "APKTOOL_JAR is set but $APKTOOL_JAR is not there"
        APKTOOL=("$JAVA" -jar "$APKTOOL_JAR")
    elif [ -f "$BUILD_DIR/tools/apktool.jar" ]; then
        APKTOOL=("$JAVA" -jar "$BUILD_DIR/tools/apktool.jar")
    elif have apktool; then
        APKTOOL=(apktool)
    else
        die "no apktool: put apktool.jar in build/tools, set APKTOOL_JAR, or install apktool"
    fi
}

setup_zipalign() {
    ZIPALIGN="${ZIPALIGN:-}"
    if [ -z "$ZIPALIGN" ]; then
        local bt
        bt="$(sdk_build_tools)"
        if [ -x "$BUILD_DIR/sdk/zipalign" ]; then ZIPALIGN="$BUILD_DIR/sdk/zipalign"
        elif have zipalign; then ZIPALIGN="zipalign"
        elif [ -n "$bt" ] && [ -x "${bt}zipalign" ]; then ZIPALIGN="${bt}zipalign"
        else die "no zipalign: it is the one native tool here — install Android build-tools, or set ZIPALIGN"
        fi
    fi
}

# APKSIGNER is an array, same reason as APKTOOL.
setup_apksigner() {
    setup_java
    local bt
    bt="$(sdk_build_tools)"
    if [ -n "${APKSIGNER_JAR:-}" ]; then
        [ -f "$APKSIGNER_JAR" ] || die "APKSIGNER_JAR is set but $APKSIGNER_JAR is not there"
        APKSIGNER=("$JAVA" -jar "$APKSIGNER_JAR")
    elif [ -f "$BUILD_DIR/sdk/lib/apksigner.jar" ]; then
        APKSIGNER=("$JAVA" -jar "$BUILD_DIR/sdk/lib/apksigner.jar")
    elif [ -n "$bt" ] && [ -f "${bt}lib/apksigner.jar" ]; then
        APKSIGNER=("$JAVA" -jar "${bt}lib/apksigner.jar")
    elif have apksigner; then
        APKSIGNER=(apksigner)
    else
        die "no apksigner: install Android build-tools, or set APKSIGNER_JAR"
    fi
}

setup_d8() {
    setup_java
    local bt
    bt="$(sdk_build_tools)"
    if [ -n "${D8_JAR:-}" ]; then
        [ -f "$D8_JAR" ] || die "D8_JAR is set but $D8_JAR is not there"
    elif [ -f "$BUILD_DIR/sdk/lib/d8.jar" ]; then D8_JAR="$BUILD_DIR/sdk/lib/d8.jar"
    elif [ -n "$bt" ] && [ -f "${bt}lib/d8.jar" ]; then D8_JAR="${bt}lib/d8.jar"
    else die "no d8.jar: install Android build-tools, or set D8_JAR"
    fi
}

# MD5 in upper case, the form the manifest carries.
md5_of() {
    local f="$1"
    if have md5sum; then md5sum "$f" | cut -d' ' -f1 | tr 'a-f' 'A-F'
    elif have md5; then md5 -q "$f" | tr 'a-f' 'A-F'
    else die "no md5sum or md5 on this machine"
    fi
}

# The mod version, the single source of truth for every output name.
mod_version() {
    local s="$BUILD_DIR/src/res/values/strings.xml"
    [ -f "$s" ] || die "no $s"
    local v
    v="$(sed -n 's/.*<string name="ipp_version">\([^<]*\)<\/string>.*/\1/p' "$s" | head -1)"
    [ -n "$v" ] || die "could not read ipp_version from strings.xml"
    printf '%s' "$v"
}

# The mod version as an integer, written into apktool.yml so the APK's versionCode GROWS with it.
# vA.B.C -> A*10000 + B*100 + C, which keeps the order of the versions and clears the stock 312 by
# a wide margin. It must never go down: an APK put on the player with `adb install -r` survives the
# next boot only while its code beats the one in /system, and losing that comparison does not merely
# ignore the update -- see the note at the call site in build.sh.
sync_version_code() {
    local v="$1" y="$BUILD_DIR/src/apktool.yml" a b c code
    case "$v" in
        v*) v="${v#v}" ;;
    esac
    a="${v%%.*}"; c="${v##*.}"; b="${v#*.}"; b="${b%.*}"
    case "$a$b$c" in
        *[!0-9]*|"") die "ipp_version '$1' is not vA.B.C - cannot derive a versionCode" ;;
    esac
    code=$(( a * 10000 + b * 100 + c ))
    [ -f "$y" ] || die "no $y"
    # A temp file rather than sed -i: the flag needs an argument on BSD sed (macOS) and must not
    # have one on GNU sed. The expression keeps the line's trailing CR, which the whole tree uses.
    sed -E "s/^(  versionCode: )[0-9]+/\1$code/" "$y" > "$y.new" && mv -f "$y.new" "$y"
    printf '%s' "$code"
}
