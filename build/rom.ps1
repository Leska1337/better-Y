# Builds the release image for better-Y: the rom.zip that Innioasis Updater installs.
#
#   powershell -ExecutionPolicy Bypass -File build\rom.ps1            # newest APK in build\out
#   powershell -ExecutionPolicy Bypass -File build\rom.ps1 -Apk <path>
#
# Output lands in build\rom-out\:
#   rom.zip      a complete 3.1.2 flash set with our system.img in it
#
# The system.img is not written out beside it: it is in the archive already, and the archive is
# smaller than the bare image, so anyone who wants to flash that one partition by hand takes it
# out of there.
#
# rom.zip carries the WHOLE 3.1.2 set - every partition install_rom_sp.xml lists, the same set
# inniclassic and solar ship - and not just our system.img, for two reasons. One is that a manual
# SP Flash Tool run should leave no partition at an older version. The other is how the Updater
# picks files. Its Y1 path runs
#   mtk.py w logo,uboot,bootimg,recovery,android,usrdata  logo.bin,lk.bin,boot.img,...,userdata.img
# and _mtk_named_write_plan resolves each name as: the extracted archive first, then THE UPDATER'S
# OWN FOLDER, which still holds whatever stock images the user downloaded earlier and is never
# cleared. So leaving an image out does not mean "do not flash that partition" - it means "flash
# whatever happens to be lying around", which is how a device updated from an archive holding only
# system.img still got its usrdata rewritten from a cached factory userdata.img (settings and theme
# reset; music survived because it lives on the card). Shipping the full set makes the result the
# same on every machine, and brings users on older firmware up to 3.1.2 in one step.
#
# The cost is that usrdata IS rewritten: settings, theme and the library database go back to
# factory. Say so in the release notes. -Minimal builds the system.img-only archive instead, which
# updates the mod in place on a machine whose Updater folder is clean.
#
# The ext4 work runs in WSL (simg2img / debugfs / e2fsck): Windows has none of those, and debugfs
# edits the image in place without sudo or mounting. See skill ipp-release.
#
# EVERYTHING heavy happens inside the WSL filesystem (~/ipp-rom), never on /mnt/h. The images are
# 650 MB raw and get read and written several times; doing that across the 9p bridge does not just
# crawl, it wedges - a first version of this script hung with wsl.exe sitting at 0% CPU. Only the
# inputs (the stock archive, the APK) and the finished archive cross the bridge.

param(
    [string] $Apk = "",
    [string] $Out = "",
    [switch] $Minimal,     # rom.zip with system.img alone - see the note above before using it
    [switch] $AllowDev     # pack a -devN build anyway (trying the pipeline out, not a release)
)

$ErrorActionPreference = "Stop"
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$root = (Resolve-Path (Join-Path $here "..")).Path
if (-not $Out) { $Out = Join-Path $root "build\rom-out" }
# Every image comes from the y1-community base, the archive Updater CE installs as clean 3.1.2 and
# the one anyone can download. Its system.img is the factory one plus Wi-Fi/GPS support
# (bin/wifi_init, wifi_check, net_server, mp, am2, a patched Provision.apk and a font) and carries
# the SAME launcher, byte for byte - so the mod applies identically and nobody loses the radios by
# installing us. Its other images are the factory ones padded out with zeros to the partition size,
# which costs nothing in the archive (zeros compress) and nothing when flashed; the exception is
# preloader, built three months earlier, and that partition is written by neither the Updater nor
# our own install instructions.
$baseZip = Join-Path $root "ROM\y1-community_y1-stock-rom_Latest-3.1.2.zip"
$remote = "~/ipp-rom"

if (-not $Apk) {
    $Apk = (Get-ChildItem (Join-Path $root "build\out\*.apk") | Sort-Object LastWriteTime -Descending |
            Select-Object -First 1).FullName
}
if (-not (Test-Path $Apk)) { throw "APK not found: $Apk" }
# rom.zip is what the updaters install, so the launcher in it is the one users end up with: a build
# of the day has no business there. -AllowDev is for trying the pipeline out on one.
if (-not $AllowDev -and (Split-Path -Leaf $Apk) -match '-dev\d+\.apk$') {
    throw "$(Split-Path -Leaf $Apk) is a dev build - build with -Release first, or pass -AllowDev"
}

function ConvertTo-WslPath([string] $p) {
    $full = (Resolve-Path $p).Path
    return "/mnt/" + $full.Substring(0, 1).ToLower() + ($full.Substring(2) -replace "\\", "/")
}
# Named Invoke-Wsl, not Wsl: PowerShell resolves command names case-insensitively, so a function
# called Wsl swallows every call to wsl.exe and recurses into itself.
function Invoke-Wsl([string] $cmd) {
    # CR is stripped because a PowerShell here-string is CRLF and bash chokes on it; stderr is
    # merged INSIDE bash, since `2>&1` on a native command turns every stderr line into a
    # PowerShell error - and debugfs prints its version banner on stderr every run.
    $cmd = $cmd -replace "`r", ""
    $out = & wsl.exe -- bash -lc "{ $cmd ; } 2>&1"
    if ($LASTEXITCODE -ne 0) { throw "wsl failed: $cmd`n$($out -join "`n")" }
    return $out
}

New-Item -ItemType Directory -Force $Out | Out-Null

$baseW = ConvertTo-WslPath $baseZip
$apkW = ConvertTo-WslPath $Apk
$outW = ConvertTo-WslPath $Out
$toolsW = ConvertTo-WslPath (Join-Path $root "build\rom-tools")

Write-Host "launcher: $(Split-Path -Leaf $Apk) ($('{0:n0}' -f (Get-Item $Apk).Length) B)" -ForegroundColor Yellow

# Every command sent to WSL must be a SINGLE line: a multi-line argument does not survive the trip
# through wsl.exe (bash reports "unexpected end of file"). So the python steps live in files.
function New-WslScript([string] $name, [string] $body) {
    $p = Join-Path $env:TEMP $name
    [IO.File]::WriteAllText($p, ($body -replace "`r", ""), (New-Object Text.UTF8Encoding $false))
    return (ConvertTo-WslPath $p)
}

Write-Host "[1/6] staging the stock images inside WSL" -ForegroundColor Cyan
# python3's zipfile stands in for unzip, which the distro does not have
$stagePy = New-WslScript "ipp-stage.py" @'
import sys, zipfile
z = zipfile.ZipFile(sys.argv[1])
for n in sys.argv[2:]:
    open(n, "wb").write(z.read(n))
'@
# A raw ext4 image (the community base) is shorter than its partition - it is the sparse image
# expanded and trimmed. debugfs and our sparse packer both address blocks by the superblock's own
# count, so pad it back out to blocks * block_size before touching it.
$padPy = New-WslScript "ipp-pad.py" @'
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
'@

# The complete flash set: every partition install_rom_sp.xml lists, which is also exactly what
# inniclassic and solar ship in their rom.zip. Only one of them is not the stock file: system.img
# carries our launcher. adb needs no boot image of ours: the mod turns it on itself, by setting
# persist.sys.usb.config from the launcher (Panel.adb), which works on the factory boot as well.
# The Updater itself only writes six of them by name
# (logo, uboot, bootimg, recovery, android, usrdata); the rest - preloader, MBR, EBR1, secro,
# cache - are there so a manual SP Flash Tool run leaves nothing at an older version.
$stock = @("MT6572_Android_scatter.txt")
if (-not $Minimal) {
    $stock += @("preloader_g368_nyx.bin", "MBR", "EBR1", "lk.bin", "boot.img",
                "recovery.img", "secro.img", "logo.bin", "cache.img", "userdata.img")
}
$stockArgs = ($stock | ForEach-Object { "'$_'" }) -join " "
Invoke-Wsl "rm -rf $remote && mkdir -p $remote && cd $remote && python3 $stagePy '$baseW' $stockArgs system.img && cp '$apkW' new.apk && ls -l" | Select-Object -Last ($stock.Count + 2)


Write-Host "[2/6] preparing the raw ext4 image" -ForegroundColor Cyan
# the community system.img is already raw; the factory one is sparse. Take either.
Invoke-Wsl "cd $remote && if head -c4 system.img | od -An -tx1 | grep -q '3a ff 26 ed'; then simg2img system.img system.raw.img; else mv system.img system.raw.img; fi && python3 $padPy system.raw.img; stat -c '      %s bytes' system.raw.img" | ForEach-Object { Write-Host $_ }

Write-Host "[3/6] swapping the launcher in (debugfs, no mount)" -ForegroundColor Cyan
$cmds = @(
    "cd app"
    "rm com.innioasis.y1_3.1.2.apk"
    "write new.apk com.innioasis.y1_3.1.2.apk"
    "sif com.innioasis.y1_3.1.2.apk mode 0100644"   # -rw-r--r--
    "sif com.innioasis.y1_3.1.2.apk uid 0"          # debugfs writes it as the calling user
    "sif com.innioasis.y1_3.1.2.apk gid 0"
) -join "`n"
$cmdFile = Join-Path $env:TEMP "swap.debugfs"
[IO.File]::WriteAllText($cmdFile, $cmds + "`n", (New-Object Text.ASCIIEncoding))
$cmdW = ConvertTo-WslPath $cmdFile
Invoke-Wsl "cd $remote && debugfs -w -f $cmdW system.raw.img" | Out-Null

Write-Host "[4/6] verifying the image" -ForegroundColor Cyan
# read the launcher back out of the image and compare it with what went in
Invoke-Wsl "cd $remote && debugfs -R 'dump app/com.innioasis.y1_3.1.2.apk check.apk' system.raw.img >/dev/null && cmp check.apk new.apk && echo '      launcher in image: identical'"
Invoke-Wsl "cd $remote && e2fsck -fn system.raw.img | tail -2" | ForEach-Object { Write-Host "      $_" }

Write-Host "[5/6] raw -> sparse (RAW + DONT_CARE only)" -ForegroundColor Cyan
# NOT img2simg: its FILL chunks are what MT6572's DA cannot write (S_DA_SDMMC_WRITE_FAILED at 1%)
Invoke-Wsl "cd $remote && python3 '$toolsW/mksparse.py' system.raw.img system_ipp.img && simg2img system_ipp.img rt.img && cmp system.raw.img rt.img && rm rt.img && echo '      sparse round-trip: identical'"

Write-Host "[6/6] packing rom.zip and copying out" -ForegroundColor Cyan
$packPy = New-WslScript "ipp-pack.py" @'
import os, sys, zipfile
z = zipfile.ZipFile("rom.zip", "w", zipfile.ZIP_DEFLATED, compresslevel=6)
z.write("system_ipp.img", "system.img")     # our image under the name the Updater looks for
for n in sys.argv[1:]:
    if n != "system.img" and os.path.isfile(n):
        z.write(n)                          # untouched factory images
z.close()
for n in z.namelist():
    print("      %-28s %10d" % (n, os.path.getsize("system_ipp.img" if n == "system.img" else n)))
'@
Invoke-Wsl "cd $remote && python3 $packPy $stockArgs && cp rom.zip '$outW/rom.zip' && rm -rf $remote" | ForEach-Object { Write-Host $_ }

Write-Host ""
Write-Host "OK" -ForegroundColor Green
Write-Host ("  rom.zip     {0,12:n0} B   Innioasis Updater asset - keep this exact name" -f (Get-Item (Join-Path $Out "rom.zip")).Length)
