# Builds, signs (AOSP platform testkey) and verifies the better-Y modded APK.
# Output name: better-Y_3.1.2_<mod_version>.apk  (mod_version read from ipp_version in strings.xml)
# Usage:  powershell -ExecutionPolicy Bypass -File build.ps1
$ErrorActionPreference = "Stop"
$ws  = $PSScriptRoot
$out = Join-Path $ws "out"
$dest = "/data/local/tmp/ipp.apk"   # fixed device path (our boot image, /ipp_installer.sh) - do not change

# mod version = single source of truth in strings.xml
$strings = Get-Content "$ws\src\res\values\strings.xml" -Raw
$modVer = [regex]::Match($strings, '<string name="ipp_version">([^<]+)</string>').Groups[1].Value
if (-not $modVer) { throw "could not read ipp_version from strings.xml" }
$apkName = "better-Y_3.1.2_$modVer.apk"

# versionCode = vA.B.C -> A*10000 + B*100 + C, written into apktool.yml on every build. It has to
# GROW, because that is the only thing that decides whether a build put on the player with
# `adb install -r` is still there after a reboot: PackageManager compares the copy in /data with
# the one in /system, and on anything but a higher number it reverts the update. On this firmware
# that revert also takes the launcher out of the package database -- there is then no home activity
# at all, and the player hangs on the boot logo until the next reboot rescans /system. So the
# number is never edited by hand and never lowered.
$m = [regex]::Match($modVer, '^v?(\d+)\.(\d+)\.(\d+)$')
if (-not $m.Success) { throw "ipp_version '$modVer' is not vA.B.C - cannot derive a versionCode" }
$verCode = [int]$m.Groups[1].Value * 10000 + [int]$m.Groups[2].Value * 100 + [int]$m.Groups[3].Value
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
