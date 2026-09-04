# Builds, signs (AOSP platform testkey) and verifies the better-Y modded APK.
# Output name: better-Y_3.1.2_<mod_version>.apk  (mod_version read from ipp_version in strings.xml)
# Usage:  powershell -ExecutionPolicy Bypass -File build.ps1            # dev build, -devN grows by one
#         powershell -ExecutionPolicy Bypass -File build.ps1 -Release  # the release, version as it stands
param([switch] $Release)
$ErrorActionPreference = "Stop"
$ws  = $PSScriptRoot
$out = Join-Path $ws "out"
$dest = "/data/local/tmp/ipp.apk"   # fixed device path (our boot image, /ipp_installer.sh) - do not change

# mod version = single source of truth in strings.xml, and it carries the dev number: vA.B.C is a
# release, vA.B.C-devN the Nth build after it. N is raised HERE, right before the build, so no two
# APKs can go out under one number -- doing it by hand meant remembering it every single time.
# -Release skips the bump and demands a clean vA.B.C, because the released APK must not say -dev.
$sxPath = "$ws\src\res\values\strings.xml"
# ISO-8859-1 maps byte to char one for one, so the file round-trips byte for byte: the UTF-8 of the
# other strings and the line endings pass through untouched. Reading it as text in a real encoding
# and writing it back would rewrite the whole file, which is what mangles these resources.
$latin1 = [Text.Encoding]::GetEncoding(28591)
$sx = $latin1.GetString([IO.File]::ReadAllBytes($sxPath))
$m = [regex]::Match($sx, '<string name="ipp_version">(v?)(\d+)\.(\d+)\.(\d+)(?:-dev(\d+))?</string>')
if (-not $m.Success) { throw "ipp_version in strings.xml is not vA.B.C or vA.B.C-devN" }
$verPfx = $m.Groups[1].Value
$verA = [int]$m.Groups[2].Value; $verB = [int]$m.Groups[3].Value; $verC = [int]$m.Groups[4].Value
$verN = if ($m.Groups[5].Success) { [int]$m.Groups[5].Value } else { 0 }

if ($Release) {
    if ($verN -ne 0) { throw "-Release wants a clean vA.B.C in strings.xml, found -dev$verN" }
    $modVer = "$verPfx$verA.$verB.$verC"
} else {
    $verN++
    # 999 dev builds is the room the versionCode formula below leaves between two releases. Running
    # out means the release is long overdue, not that the number should wrap.
    if ($verN -gt 999) { throw "dev number is out of room at $verN - cut a release first" }
    $modVer = "$verPfx$verA.$verB.$verC-dev$verN"
    $sxNew = $sx.Remove($m.Index, $m.Length).Insert($m.Index, "<string name=""ipp_version"">$modVer</string>")
    [IO.File]::WriteAllBytes($sxPath, $latin1.GetBytes($sxNew))
}
$apkName = "better-Y_3.1.2_$modVer.apk"

# versionCode = (A*10000 + B*100 + C) * 1000 + N, written into apktool.yml on every build. It has to
# GROW, because that is the only thing that decides whether a build put on the player with
# `adb install -r` is still there after a reboot: PackageManager compares the copy in /data with
# the one in /system, and on anything but a higher number it reverts the update. On this firmware
# that revert also takes the launcher out of the package database -- there is then no home activity
# at all, and the player hangs on the boot logo until the next reboot rescans /system. So the
# number is never edited by hand and never lowered. The last three digits are what dev builds grow
# in: v1.0.0 is 10000000, its seventh dev build 10000007, and the release after it, v1.0.1,
# 10001000 -- so the order holds across the release too.
$verCode = ($verA * 10000 + $verB * 100 + $verC) * 1000 + $verN
$ymlPath = "$ws\src\apktool.yml"
$yml = [IO.File]::ReadAllText($ymlPath)
$ymlNew = [regex]::Replace($yml, '(?m)^(  versionCode: )\d+', ('${1}' + $verCode))
if ($ymlNew -ne $yml) { [IO.File]::WriteAllText($ymlPath, $ymlNew, (New-Object Text.ASCIIEncoding)) }

Write-Host "mod version: $modVer (versionCode $verCode)  ->  $apkName" -ForegroundColor Yellow

$unsigned = Join-Path $out "unsigned.apk"
$aligned  = Join-Path $out "aligned.apk"
$final    = Join-Path $out $apkName

Write-Host "[1/4] apktool build..." -ForegroundColor Cyan
java -jar "$ws\tools\apktool.jar" b "$ws\src" -o $unsigned
if ($LASTEXITCODE -ne 0) { throw "apktool build failed" }

Write-Host "[2/4] zipalign..." -ForegroundColor Cyan
& "$ws\sdk\zipalign.exe" -p -f 4 $unsigned $aligned
if ($LASTEXITCODE -ne 0) { throw "zipalign failed" }

Write-Host "[3/4] sign (platform key)..." -ForegroundColor Cyan
java -jar "$ws\sdk\lib\apksigner.jar" sign `
  --key "$ws\keys\platform.pk8" --cert "$ws\keys\platform.x509.pem" `
  --min-sdk-version 17 --v1-signing-enabled true --v2-signing-enabled true --v3-signing-enabled false `
  --out $final $aligned
if ($LASTEXITCODE -ne 0) { throw "signing failed" }

Write-Host "[4/4] verify..." -ForegroundColor Cyan
java -jar "$ws\sdk\lib\apksigner.jar" verify --min-sdk-version 17 --print-certs $final |
  Select-String "SHA-1 digest|Verifies" | ForEach-Object { $_.Line }

Remove-Item $unsigned,$aligned -ErrorAction SilentlyContinue
# builds live only in build/out - they used to be copied to 'modded apk' as well, which just
# duplicated every APK; adb now runs from the 'platform-tools' folder instead.
Write-Host "`nOK -> $final" -ForegroundColor Green
Write-Host "Push: adb push `"$final`" $dest"
