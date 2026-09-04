# ipp-java.ps1 -- compile Java sources of package com/innioasis/ipp into smali.
#
# Write NEW ipp classes in Java under build/ipp-java/src/com/innioasis/ipp/*.java,
# run this script -> it compiles them (javac -> d8 -> baksmali) and drops the
# resulting .smali into build/src/smali/com/innioasis/ipp/ (overwriting same-named).
# Stock files are NOT touched -- point injections into stock methods are still
# edited by hand in smali. Then run the usual build/build.ps1.
#
#   powershell -ExecutionPolicy Bypass -File build/ipp-java.ps1            # compile and place into tree
#   powershell -ExecutionPolicy Bypass -File build/ipp-java.ps1 -DryRun    # build to temp and list, no copy
#   powershell -ExecutionPolicy Bypass -File build/ipp-java.ps1 -Stubs     # regenerate app-stubs.jar from newest APK, exit
#
# Compile-time stubs of stock + existing ipp classes come from
# build/tools/android/app-stubs.jar (dex2jar of the newest built APK).
# The script regenerates them automatically if missing or older than the newest
# APK in build/out.

param(
    [switch]$DryRun,
    [switch]$Stubs
)
$ErrorActionPreference = 'Stop'

$build   = Split-Path -Parent $MyInvocation.MyCommand.Path         # ...\build
$tools   = Join-Path $build 'tools'
$jdk     = (Get-ChildItem (Join-Path $tools 'jdk') -Directory | Where-Object { $_.Name -like 'jdk-*' } | Select-Object -First 1).FullName
$javac   = Join-Path $jdk 'bin\javac.exe'
$android = Join-Path $tools 'android\android17.jar'
$stubsJar   = Join-Path $tools 'android\app-stubs.jar'
$rStubDir= Join-Path $tools 'android\rstub'          # compiled app R stub (classpath-only)
$publicXml = Join-Path $build 'src\res\values\public.xml'
$d8jar   = Join-Path $build 'sdk\lib\d8.jar'
$d2jLib  = Join-Path $tools 'dex2jar\dex-tools-v2.4\lib'
$srcDir  = Join-Path $build 'ipp-java\src'
# Output into classes2.dex: the stock classes.dex sits at ~65526 method refs (64K limit),
# so anything new must land in smali_classes2 (classes2.dex has ~25K headroom). Legacy
# multidex loads all dexes, and cross-dex refs resolve at runtime.
$treeOut = Join-Path $build 'src\smali_classes2'
$work    = Join-Path $env:TEMP 'ipp-java-build'

$d2jCp = (Get-ChildItem (Join-Path $d2jLib '*.jar') | ForEach-Object { $_.FullName }) -join ';'

# Run a native exe/java without PS 5.1 treating stderr as a terminating error.
# Prints merged stdout+stderr, then throws if the exit code is non-zero.
function Invoke-Native {
    param([string]$What, [scriptblock]$Call)
    $old = $ErrorActionPreference; $ErrorActionPreference = 'Continue'
    try { & $Call 2>&1 | ForEach-Object { Write-Host "  $_" } }
    finally { $ErrorActionPreference = $old }
    if ($LASTEXITCODE -ne 0) { throw "$What failed (exit $LASTEXITCODE)" }
}

function New-Stubs {
    $apk = Get-ChildItem (Join-Path $build 'out\*.apk') |
           Sort-Object LastWriteTime -Descending | Select-Object -First 1
    if (-not $apk) { throw "No APK in build/out to generate stubs from" }
    Write-Host "Stubs: dex2jar $($apk.Name) -> app-stubs.jar"
    if (Test-Path $stubsJar) { Remove-Item $stubsJar -Force }
    & java -cp $d2jCp com.googlecode.dex2jar.tools.Dex2jarCmd -f -o $stubsJar $apk.FullName | Out-Null
    if (-not (Test-Path $stubsJar)) { throw "dex2jar did not produce stubs" }
}

# Generate the app R stub from res/values/public.xml and compile it (compile-time only).
# Needed because release-dex inlines R.* constants and strips the fields, so app-stubs.jar
# is missing most R entries. public.xml is the frozen source of truth for resource ids.
function New-RStub {
    Write-Host "R stub: generating from public.xml"
    $rx = [regex]'type="([^"]+)"\s+name="([^"]+)"\s+id="(0x[0-9a-fA-F]+)"'
    $valid = [regex]'^[A-Za-z_][A-Za-z0-9_]*$'
    $types = [ordered]@{}
    foreach ($line in [System.IO.File]::ReadLines($publicXml)) {
        $m = $rx.Match($line); if (-not $m.Success) { continue }
        $t = $m.Groups[1].Value; $n = $m.Groups[2].Value; $i = $m.Groups[3].Value
        if (-not $valid.IsMatch($n)) { continue }       # skip non-Java-identifier names (dotted styles, $avd_*)
        if (-not $types.Contains($t)) { $types[$t] = [ordered]@{} }
        if (-not $types[$t].Contains($n)) { $types[$t][$n] = $i }   # dedupe: keep first
    }
    $sb = [System.Text.StringBuilder]::new()
    [void]$sb.AppendLine("package com.innioasis.y1;")
    [void]$sb.AppendLine("// AUTO-GENERATED R stub from res/values/public.xml (compile-time only).")
    [void]$sb.AppendLine("public final class R {")
    foreach ($t in $types.Keys) {
        [void]$sb.AppendLine("  public static final class $t {")
        foreach ($n in $types[$t].Keys) { [void]$sb.AppendLine("    public static final int $n = $($types[$t][$n]);") }
        [void]$sb.AppendLine("  }")
    }
    [void]$sb.AppendLine("}")
    $rSrcDir = Join-Path $env:TEMP 'ipp-rstub-src\com\innioasis\y1'
    if (Test-Path (Split-Path $rSrcDir)) { Remove-Item (Split-Path $rSrcDir) -Recurse -Force }
    New-Item -ItemType Directory -Force -Path $rSrcDir | Out-Null
    $rJava = Join-Path $rSrcDir 'R.java'
    [System.IO.File]::WriteAllText($rJava, $sb.ToString())
    if (Test-Path $rStubDir) { Remove-Item $rStubDir -Recurse -Force }
    New-Item -ItemType Directory -Force -Path $rStubDir | Out-Null
    Invoke-Native 'javac (R stub)' { & $javac -source 8 -target 8 -Xlint:-options -encoding UTF-8 -bootclasspath $android -d $rStubDir $rJava }
}

# -Stubs: only regenerate stubs
if ($Stubs) { New-Stubs; New-RStub; Write-Host "Done."; exit 0 }

# auto-generate R stub if missing or older than public.xml
$rStubMarker = Join-Path $rStubDir 'com\innioasis\y1\R.class'
if ((-not (Test-Path $rStubMarker)) -or ((Get-Item $rStubMarker).LastWriteTime -lt (Get-Item $publicXml).LastWriteTime)) {
    New-RStub
}

# auto-generate stubs if missing or older than newest APK
$freshApk = Get-ChildItem (Join-Path $build 'out\*.apk') -ErrorAction SilentlyContinue |
            Sort-Object LastWriteTime -Descending | Select-Object -First 1
if ((-not (Test-Path $stubsJar)) -or ($freshApk -and (Get-Item $stubsJar).LastWriteTime -lt $freshApk.LastWriteTime)) {
    New-Stubs
}

# collect .java
$javas = Get-ChildItem $srcDir -Recurse -Filter '*.java' -ErrorAction SilentlyContinue
if (-not $javas) { Write-Host "No .java under $srcDir -- nothing to compile."; exit 0 }
Write-Host "Sources ($($javas.Count)):"
$javas | ForEach-Object { Write-Host "  $($_.FullName.Substring($srcDir.Length+1))" }

# clean work dir
if (Test-Path $work) { Remove-Item $work -Recurse -Force }
$clsDir = Join-Path $work 'classes'; $dexDir = Join-Path $work 'dex'; $smDir = Join-Path $work 'smali'
New-Item -ItemType Directory -Force -Path $clsDir,$dexDir,$smDir | Out-Null

# 1. javac (bootclasspath = android.jar API17; classpath = stubs)
Write-Host "javac..."
$javaFiles = @($javas.FullName)
$cp = "$rStubDir;$stubsJar"    # R stub first so its complete R wins over the partial R in app-stubs
Invoke-Native 'javac' { & $javac -source 8 -target 8 -Xlint:-options -encoding UTF-8 -bootclasspath $android -classpath $cp -d $clsDir @javaFiles }

# 2. d8 (min-api 17)
Write-Host "d8..."
$classFiles = @(Get-ChildItem $clsDir -Recurse -Filter '*.class' | ForEach-Object { $_.FullName })
Invoke-Native 'd8' { & java -cp $d8jar com.android.tools.r8.D8 --min-api 17 --lib $android --lib $stubsJar --output $dexDir @classFiles }

# 3. baksmali (dex -> smali)
Write-Host "baksmali..."
$dexFile = Join-Path $dexDir 'classes.dex'
Invoke-Native 'baksmali' { & java -cp $d2jCp com.googlecode.d2j.smali.BaksmaliCmd -f -o $smDir $dexFile }

$produced = Get-ChildItem $smDir -Recurse -Filter '*.smali'
Write-Host "Produced smali ($($produced.Count)):"
$produced | ForEach-Object { Write-Host "  $($_.FullName.Substring($smDir.Length+1))" }

# 3a. Fix const/high16 literal form. d2j-baksmali writes the pre-shifted 16-bit value
#     (e.g. `const/high16 v0, 16768` for 16.0f / 0x41800000), but apktool's smali assembler
#     requires the full 32-bit value with the low 16 bits zeroed (`const/high16 v0, 0x41800000`).
#     Rewrite every decimal high16 literal to that hex form (hex literals from d2j are already
#     correct and left untouched). This is what makes float/large-int constants in Java UI code
#     assemble -- see the CLAUDE.md smali-gotcha note.
$hi16 = [regex]'(const(?:-wide)?/high16 [vp]\d+,\s*)(-?\d+)\b'
$produced | ForEach-Object {
    $p = $_.FullName
    $t = [System.IO.File]::ReadAllText($p)
    $t2 = $hi16.Replace($t, {
        param($m)
        $hi = ([int]$m.Groups[2].Value) -band 0xFFFF
        $m.Groups[1].Value + ('0x{0:X4}0000' -f $hi)
    })
    if ($t2 -ne $t) { [System.IO.File]::WriteAllText($p, $t2); Write-Host "  fixed high16 in $($_.Name)" }
}

# 3b. Fix .array-data element form. d2j-baksmali writes every element as its individual BYTES
#     (`5t 0t 0t 0t` for the int 5 inside a `.array-data 4` block), but apktool's smali assembler
#     reads each of those as an element of its own -- a 12-int array assembles into 48 entries,
#     `fill-array-data` then overruns the `new-array` and throws at RUNTIME, inside <clinit>:
#     the class fails to initialise and the first use of it kills the app (v0.10.7 did exactly
#     that on entering the innioasis++ screen). Regroup the bytes into one literal per element,
#     little-endian, and emit it in the declared width.
$arrData = [regex]'(?ms)^([ \t]*)\.array-data[ \t]+(\d+)[ \t]*\r?\n(.*?)^([ \t]*)\.end array-data'
$produced | ForEach-Object {
    $p = $_.FullName
    $t = [System.IO.File]::ReadAllText($p)
    $t2 = $arrData.Replace($t, {
        param($m)
        $indent = $m.Groups[1].Value
        $w      = [int]$m.Groups[2].Value
        $body   = $m.Groups[3].Value
        $bytes  = [regex]::Matches($body, '(-?\d+)t\b')
        $tokens = [regex]::Matches($body, '\S+')
        # only the byte-split form, and only when it divides evenly into elements
        if ($bytes.Count -eq 0 -or $bytes.Count -ne $tokens.Count) { return $m.Value }
        if ($w -lt 1 -or ($bytes.Count % $w) -ne 0) { return $m.Value }
        $sb = [System.Text.StringBuilder]::new()
        [void]$sb.Append($indent + ".array-data $w" + "`r`n")
        for ($i = 0; $i -lt $bytes.Count; $i += $w) {
            [long]$v = 0
            for ($k = $w - 1; $k -ge 0; $k--) {
                $v = ($v -shl 8) -bor ([int]$bytes[$i + $k].Groups[1].Value -band 0xFF)
            }
            if ($w -lt 8) {                       # sign-extend to the declared width
                $bits = $w * 8
                if ($v -band ([long]1 -shl ($bits - 1))) { $v = $v - ([long]1 -shl $bits) }
            }
            [void]$sb.Append($indent + "    " + $v.ToString() + $(if ($w -eq 8) { 'L' } else { '' }) + "`r`n")
        }
        [void]$sb.Append($m.Groups[4].Value + ".end array-data")
        $sb.ToString()
    })
    if ($t2 -ne $t) { [System.IO.File]::WriteAllText($p, $t2); Write-Host "  fixed array-data in $($_.Name)" }
}

if ($DryRun) { Write-Host "-DryRun: not copying into tree. Output: $smDir"; exit 0 }

# 4. copy generated smali into the tree (preserve package dirs). d8 only dexes the classes we
#    compiled, so the baksmali output holds ONLY our sources: com/innioasis/ipp/* plus
#    com/innioasis/y1/activity/IppActivity* (the one class we author in that otherwise-stock
#    package). Copying '*' from each package therefore never overwrites a stock file.
$srcCom = Join-Path $smDir 'com\innioasis\ipp'
if (-not (Test-Path $srcCom)) { throw "Expected package com/innioasis/ipp in baksmali output, not found" }
foreach ($pkg in @('com\innioasis\ipp', 'com\innioasis\y1\activity')) {
    $srcPkg = Join-Path $smDir $pkg
    if (-not (Test-Path $srcPkg)) { continue }
    $dstPkg = Join-Path $treeOut $pkg
    New-Item -ItemType Directory -Force -Path $dstPkg | Out-Null
    Copy-Item (Join-Path $srcPkg '*') $dstPkg -Recurse -Force
    Write-Host "Copied $pkg"
}
Write-Host "Done. Next: build/build.ps1"
