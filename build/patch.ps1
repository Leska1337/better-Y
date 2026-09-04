# Builds (and verifies) the publishable form of innioasis++.
#
# The mod is a set of edits to a decompiled stock launcher, and the stock tree is not ours to
# republish. So what goes out is: our own files as they are, a unified diff of the stock files we
# edited, a list of the stock files we delete, and a manifest pinning the exact inputs those were
# taken against. Nothing here is stored — every artefact is generated from git on demand, so future
# work on the launcher needs no change to this script.
#
#   .\build\patch.ps1 -Export            -> publish\  (manifest.json, stock.diff, files\, delete.txt,
#                                                      plus README/LICENSE/screenshots from build\publish-src
#                                                      and the build scripts, Java sources and image tools)
#   .\build\patch.ps1 -Apply <tree>      -> applies publish\ onto a freshly decompiled stock tree
#   .\build\patch.ps1 -Verify            -> decompiles the factory APK, applies, compares to build\src
#
# -Verify is the one that matters before a release: it proves the published set is enough to
# reproduce the tree we actually build from.

[CmdletBinding(DefaultParameterSetName = "Export")]
param(
    [Parameter(ParameterSetName = "Export")] [switch] $Export,
    [Parameter(ParameterSetName = "Apply", Mandatory = $true)] [string] $Apply,
    [Parameter(ParameterSetName = "Verify")] [switch] $Verify,
    [string] $Set = "",
    [string] $Base = ""
)

$ErrorActionPreference = "Stop"
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$root = (Resolve-Path (Join-Path $here "..")).Path
if (-not $Set) { $Set = Join-Path $root "publish" }
$src = Join-Path $root "build\src"
$apktool = Join-Path $root "build\tools\apktool.jar"
$stockApk = Join-Path $root "version 3.1.2 original apk\com.innioasis.y1_3.1.2.apk"

function Run-Git {
    param([string[]] $Arguments, [switch] $Raw)
    Push-Location $root
    try {
        $out = & git @Arguments 2>&1
        if ($LASTEXITCODE -ne 0) { throw "git $($Arguments -join ' ') failed:`n$out" }
    } finally { Pop-Location }
    if ($Raw) { return ($out -join "`n") }
    return $out
}

function Get-Base {
    if ($Base) { return $Base }
    # the baseline is the root commit: the factory tree, decompiled with the pinned apktool
    return (Run-Git @("rev-list", "--max-parents=0", "HEAD") | Select-Object -First 1)
}

function Get-ApktoolVersion {
    $v = & java -jar $apktool --version 2>&1 | Select-Object -First 1
    return "$v".Trim()
}

# --------------------------------------------------------------------------------------- export

function Invoke-Export {
    $base = Get-Base
    # The set is rebuilt from scratch, but NOT the git repository that lives in it: once the
    # public repo has been cloned or pushed from here, publish\.git holds its history, its remote
    # and its identity. Wiping it turns the next `git` run inside publish\ into a run against the
    # PARENT repository -- git finds no .git beside it and walks up -- and that one carries the
    # whole decompiled stock launcher and must never be pushed anywhere. Everything else goes.
    if (Test-Path $Set) {
        Get-ChildItem -Force $Set | Where-Object { $_.Name -ne ".git" } |
            ForEach-Object { Remove-Item -Recurse -Force $_.FullName }
    }
    New-Item -ItemType Directory -Force $Set | Out-Null

    $status = Run-Git @("diff", "--name-status", "$base", "HEAD", "--", "build/src")
    $numstat = Run-Git @("diff", "--numstat", "$base", "HEAD", "--", "build/src")

    # a "-" line count marks a binary file: it cannot be carried as a diff hunk
    $binary = @{}
    foreach ($line in $numstat) {
        $f = $line -split "`t"
        if ($f.Count -ge 3 -and $f[0] -eq "-" -and $f[1] -eq "-") { $binary[$f[2]] = $true }
    }

    $added = @(); $modText = @(); $modBinary = @(); $deleted = @()
    foreach ($line in $status) {
        $f = $line -split "`t"
        if ($f.Count -lt 2) { continue }
        $path = $f[1]
        # apktool's original/ holds the factory's own manifest and signature; the build does not read it
        if ($path -like "build/src/original/*") { continue }
        switch ($f[0][0]) {
            "A" { $added += $path }
            "D" { $deleted += $path }
            "M" { if ($binary[$path]) { $modBinary += $path } else { $modText += $path } }
        }
    }

    # 1. the diff of the stock files we edited — text only.
    # --output= makes git write the file itself. Piping it through PowerShell would split the
    # output into lines and rejoin them with LF, and apktool writes these files with CRLF — the
    # patch would then match nothing and `git apply` would fail on the first hunk.
    $diffPath = Join-Path $Set "stock.diff"
    $diffArgs = @("diff", "--output=$diffPath", "$base", "HEAD", "--") + $modText
    Run-Git -Arguments $diffArgs | Out-Null

    # 2. our own files, plus the stock binaries we replaced, copied verbatim
    $filesDir = Join-Path $Set "files"
    $copied = 0
    foreach ($path in ($added + $modBinary)) {
        $rel = $path.Substring("build/src/".Length)
        $dst = Join-Path $filesDir $rel
        New-Item -ItemType Directory -Force (Split-Path $dst) | Out-Null
        Copy-Item (Join-Path $root ($path -replace "/", "\")) $dst
        $copied++
    }

    # 3. what the mod removes from the stock tree
    $delRel = $deleted | ForEach-Object { $_.Substring("build/src/".Length) }
    [IO.File]::WriteAllLines((Join-Path $Set "delete.txt"), $delRel, (New-Object Text.UTF8Encoding $false))

    # 4. the inputs all of the above was taken against — a diff is only safe on a pinned tree
    $apk = Get-Item $stockApk
    $strings = Get-Content "$src\res\values\strings.xml" -Raw
    $modVer = [regex]::Match($strings, '<string name="ipp_version">([^<]+)</string>').Groups[1].Value
    $manifest = [ordered]@{
        mod_version      = $modVer
        base_commit      = $base
        apktool_version  = Get-ApktoolVersion
        apktool_command  = "apktool d -f -o <tree> com.innioasis.y1_3.1.2.apk"
        stock_apk        = @{
            name = $apk.Name
            size = $apk.Length
            md5  = (Get-FileHash $apk.FullName -Algorithm MD5).Hash
        }
        counts           = [ordered]@{
            ours = $added.Count; patched = $modText.Count
            patched_binary = $modBinary.Count; deleted = $deleted.Count
        }
    }
    $manifest | ConvertTo-Json -Depth 5 | Set-Content (Join-Path $Set "manifest.json") -Encoding UTF8

    # 5. what the public repository needs around all of the above (README, LICENSE, screenshots).
    # These are authored, not generated, so they live in build\publish-src and are copied verbatim.
    # -Apply reads only manifest.json, stock.diff, files\ and delete.txt, so they are inert for it.
    # Copied with their subfolders: the README pictures live in publish-src\screenshots and a
    # flat copy would publish a README whose every <img> is broken.
    $extras = 0
    $extraDir = Join-Path $root "build\publish-src"
    if (Test-Path $extraDir) {
        $extraRoot = (Resolve-Path $extraDir).Path
        Get-ChildItem $extraRoot -Recurse -File | ForEach-Object {
            $dst = Join-Path $Set $_.FullName.Substring($extraRoot.Length + 1)
            $dstDir = Split-Path $dst -Parent
            if (-not (Test-Path $dstDir)) { New-Item -ItemType Directory -Force $dstDir | Out-Null }
            Copy-Item $_.FullName $dst -Force
            $extras++
        }
    }

    # 6. the scripts that turn everything above back into an APK, and the ones that make an image.
    # The README hands the reader `build\patch.ps1 -Apply tree` and `build\build.ps1` by name, so
    # they are copied under their REPO-RELATIVE paths and those commands work as written.
    # build\rom-tools goes with them because mkboot.py is how a reader gets a boot image with adb
    # on, and that is the only way to install a build without SP Flash Tool.
    $scripts = 0
    $scriptFiles = @()
    $scriptFiles += Get-ChildItem (Join-Path $root "build") -File |
                    Where-Object { $_.Extension -in ".ps1", ".sh" }
    $scriptFiles += Get-ChildItem (Join-Path $root "build\ipp-java\src") -Recurse -File -Filter *.java
    $scriptFiles += Get-ChildItem (Join-Path $root "build\rom-tools") -File -Filter *.py
    foreach ($f in $scriptFiles) {
        $dst = Join-Path $Set $f.FullName.Substring($root.Length + 1)
        $dstDir = Split-Path $dst -Parent
        if (-not (Test-Path $dstDir)) { New-Item -ItemType Directory -Force $dstDir | Out-Null }
        Copy-Item $f.FullName $dst -Force
        $scripts++
    }

    Write-Host "exported to $Set" -ForegroundColor Green
    Write-Host ("  ours + replaced binaries : {0} files ({1:n0} KB)" -f $copied, ((Get-ChildItem $filesDir -Recurse -File | Measure-Object Length -Sum).Sum / 1KB))
    Write-Host ("  stock.diff               : {0} files ({1:n0} KB)" -f $modText.Count, ((Get-Item (Join-Path $Set "stock.diff")).Length / 1KB))
    Write-Host ("  delete.txt               : {0} paths" -f $delRel.Count)
    Write-Host ("  publish-src              : {0} files (README, LICENSE, screenshots)" -f $extras)
    Write-Host ("  build scripts + image tools: {0} files (both script sets, Java sources, mkboot)" -f $scripts)
}

# ---------------------------------------------------------------------------------------- apply

function Invoke-Apply {
    param([string] $Tree)
    $Tree = (Resolve-Path $Tree).Path
    $manifest = Get-Content (Join-Path $Set "manifest.json") -Raw | ConvertFrom-Json

    $ver = Get-ApktoolVersion
    if ($ver -ne $manifest.apktool_version) {
        throw "apktool mismatch: the set was made with $($manifest.apktool_version), this machine has $ver. " +
              "A unified diff only applies to an identically decompiled tree."
    }

    # the diff carries a/build/src/... — three leading components to strip when the tree IS build/src
    Push-Location $Tree
    try {
        # -c core.autocrlf=false is NOT optional: the target tree is outside any repository, so git
        # falls back to the machine's global setting, which on Git for Windows is autocrlf=true —
        # every patched file then comes out CRLF while apktool wrote LF.
        # --whitespace=nowarn: smali is machine-written, its trailing space is not ours to fix.
        $out = & git -c core.autocrlf=false -c core.safecrlf=false apply --unsafe-paths `
                    --whitespace=nowarn -p3 --directory="." (Join-Path $Set "stock.diff") 2>&1
        if ($LASTEXITCODE -ne 0) { throw "git apply failed:`n$out" }
    } finally { Pop-Location }

    $filesDir = Join-Path $Set "files"
    Get-ChildItem $filesDir -Recurse -File | ForEach-Object {
        $rel = $_.FullName.Substring($filesDir.Length + 1)
        $dst = Join-Path $Tree $rel
        New-Item -ItemType Directory -Force (Split-Path $dst) | Out-Null
        Copy-Item $_.FullName $dst -Force
    }

    foreach ($rel in (Get-Content (Join-Path $Set "delete.txt"))) {
        if (-not $rel) { continue }
        $p = Join-Path $Tree $rel
        if (Test-Path $p) { Remove-Item -Recurse -Force $p }
    }

    Write-Host "applied $Set onto $Tree" -ForegroundColor Green
}

# --------------------------------------------------------------------------------------- verify

function Invoke-Verify {
    $manifest = Get-Content (Join-Path $Set "manifest.json") -Raw | ConvertFrom-Json
    $md5 = (Get-FileHash $stockApk -Algorithm MD5).Hash
    if ($md5 -ne $manifest.stock_apk.md5) { throw "factory APK MD5 $md5 does not match the manifest" }

    $tmp = Join-Path $env:TEMP ("ipp-verify-" + [Guid]::NewGuid().ToString("N").Substring(0, 8))
    Write-Host "[1/3] decompiling the factory APK into $tmp" -ForegroundColor Cyan
    & java -jar $apktool d -f -o $tmp $stockApk | Out-Null
    if ($LASTEXITCODE -ne 0) { throw "apktool d failed" }

    Write-Host "[2/3] applying the published set" -ForegroundColor Cyan
    Invoke-Apply -Tree $tmp

    Write-Host "[3/3] comparing against build\src" -ForegroundColor Cyan
    # build/ and dist/ are apktool's own output, original/ is not read by the build, apktool.yml
    # records the APK name it was decompiled from
    $skip = @("build", "dist", "original", "apktool.yml")
    $cmp = Compare-Trees -A $tmp -B $src -Skip $skip
    if ($cmp.Equivalent.Count -gt 0) {
        # Our tree was first decompiled by an older apktool, which wrote a field's default value
        # into the .field line; 2.11.1 leaves it out. Same code, and these files are not in the
        # patch (we never edited them), so a builder simply keeps their own form.
        Write-Host ("{0} file(s) differ only in how baksmali writes a field default - equivalent:" -f $cmp.Equivalent.Count) -ForegroundColor DarkGray
        $cmp.Equivalent | Select-Object -First 5 | ForEach-Object { Write-Host "    $_" -ForegroundColor DarkGray }
        if ($cmp.Equivalent.Count -gt 5) { Write-Host ("    ... and {0} more" -f ($cmp.Equivalent.Count - 5)) -ForegroundColor DarkGray }
    }
    if ($cmp.Real.Count -eq 0) {
        Write-Host "OK - the published set reproduces build\src" -ForegroundColor Green
        Remove-Item -Recurse -Force $tmp
    } else {
        Write-Host ("{0} real difference(s):" -f $cmp.Real.Count) -ForegroundColor Red
        $cmp.Real | Select-Object -First 40 | ForEach-Object { Write-Host "  $_" }
        Write-Host "tree kept at $tmp" -ForegroundColor Yellow
        exit 1
    }
}

# A difference is "equivalent" when every changed line is a .field declaration — that is the one
# thing two apktool versions legitimately write differently. Anything else is a real difference.
function Test-FieldDefaultOnly {
    param([string] $PathA, [string] $PathB)
    if ($PathA -notlike "*.smali") { return $false }
    $a = [IO.File]::ReadAllText($PathA) -replace "`r", ""
    $b = [IO.File]::ReadAllText($PathB) -replace "`r", ""
    if ($a -eq $b) { return $true }   # line endings only
    $la = $a -split "`n"; $lb = $b -split "`n"
    if ($la.Count -ne $lb.Count) { return $false }
    for ($i = 0; $i -lt $la.Count; $i++) {
        if ($la[$i] -eq $lb[$i]) { continue }
        if ($la[$i] -notmatch '^\.field ' -or $lb[$i] -notmatch '^\.field ') { return $false }
        # the declaration itself, up to the value, must be identical
        if (($la[$i] -split " = ")[0] -ne ($lb[$i] -split " = ")[0]) { return $false }
    }
    return $true
}

function Compare-Trees {
    param([string] $A, [string] $B, [string[]] $Skip)
    $real = @(); $equivalent = @()
    $listOf = {
        param($rootDir)
        $map = @{}
        Get-ChildItem $rootDir -Recurse -File | ForEach-Object {
            $rel = $_.FullName.Substring($rootDir.Length + 1)
            $top = ($rel -split "\\")[0]
            if ($Skip -notcontains $top) { $map[$rel] = $_.Length }
        }
        return $map
    }
    $ma = & $listOf $A
    $mb = & $listOf $B
    foreach ($k in $ma.Keys) { if (-not $mb.ContainsKey($k)) { $real += "only in applied tree: $k" } }
    foreach ($k in $mb.Keys) { if (-not $ma.ContainsKey($k)) { $real += "missing from applied tree: $k" } }
    foreach ($k in $ma.Keys) {
        if (-not $mb.ContainsKey($k)) { continue }
        $pa = Join-Path $A $k; $pb = Join-Path $B $k
        if ($ma[$k] -eq $mb[$k] -and
            (Get-FileHash $pa -Algorithm MD5).Hash -eq (Get-FileHash $pb -Algorithm MD5).Hash) { continue }
        if (Test-FieldDefaultOnly -PathA $pa -PathB $pb) { $equivalent += $k } else { $real += "differs: $k" }
    }
    return [pscustomobject]@{ Real = $real; Equivalent = $equivalent }
}

switch ($PSCmdlet.ParameterSetName) {
    "Apply"  { Invoke-Apply -Tree $Apply }
    "Verify" { Invoke-Export; Invoke-Verify }
    default  { Invoke-Export }
}
