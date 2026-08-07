# Build AIT_Socks release APK from sibling apktool tree
#
# Pipeline: apktool b -> zipalign -> apksigner (v1+v2+v3) -> apksigner verify
#
# Order matters. Android 11+ rejects APKs targeting API 30+ unless resources.arsc
# is stored uncompressed AND aligned on a 4-byte boundary (install error -124),
# and unless the APK carries an APK Signature Scheme v2 or newer block. jarsigner
# only produces a v1 signature and rewrites the zip, which destroys the alignment
# zipalign just applied -- so it must not be used here at all.
$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$Tree = Join-Path (Split-Path -Parent $Root) "socksdroid-apktool"
if (-not (Test-Path $Tree)) {
  $Tree = Join-Path $Root "apktool-src"
}
$OutDir = Join-Path $Root "dist"
$Version = "1.0.1"
$Unsigned = Join-Path $OutDir "AIT_Socks-unsigned.apk"
$Aligned = Join-Path $OutDir "AIT_Socks-aligned.apk"
$Signed = Join-Path $OutDir "AIT_Socks-v$Version.apk"
$Apktool = if (Test-Path "C:\Users\NHI\tools\apktool\apktool.bat") {
  "C:\Users\NHI\tools\apktool\apktool.bat"
} else { "apktool" }
$Keystore = Join-Path $env:USERPROFILE ".android\ait-socks-release.jks"
$StorePass = if ($env:AIT_SOCKS_KEYSTORE_PASS) { $env:AIT_SOCKS_KEYSTORE_PASS } else { "ait-socks-2026" }

# --- locate Android SDK build-tools ------------------------------------------
function Get-BuildToolsDir {
  $roots = @(
    $env:ANDROID_SDK_ROOT,
    $env:ANDROID_HOME,
    (Join-Path $env:LOCALAPPDATA "Android\Sdk"),
    "C:\Android\Sdk"
  ) | Where-Object { $_ -and (Test-Path (Join-Path $_ "build-tools")) }

  foreach ($r in $roots) {
    $best = Get-ChildItem (Join-Path $r "build-tools") -Directory -ErrorAction SilentlyContinue |
      ForEach-Object {
        $v = $null
        if ([Version]::TryParse($_.Name, [ref]$v)) { [pscustomobject]@{ Ver = $v; Path = $_.FullName } }
      } |
      Sort-Object Ver -Descending |
      Select-Object -First 1
    if ($best) { return $best.Path }
  }
  return $null
}

$BuildTools = Get-BuildToolsDir
if ($BuildTools) {
  $ZipAlign = Join-Path $BuildTools "zipalign.exe"
  $ApkSigner = Join-Path $BuildTools "apksigner.bat"
} else {
  # fall back to PATH
  $ZipAlign = (Get-Command zipalign -ErrorAction SilentlyContinue).Source
  $ApkSigner = (Get-Command apksigner -ErrorAction SilentlyContinue).Source
}

$missing = @()
if (-not ($ZipAlign -and (Test-Path $ZipAlign))) { $missing += "zipalign" }
if (-not ($ApkSigner -and (Test-Path $ApkSigner))) { $missing += "apksigner" }
if ($missing.Count -gt 0) {
  throw @"
Missing Android SDK build-tools: $($missing -join ', ')

These are required. jarsigner is NOT a substitute -- it only emits a v1 signature
and re-writes the zip, so the resulting APK fails to install on Android 11+ with:
  Failure [-124: ... requires the resources.arsc ... uncompressed and aligned on a 4-byte boundary]

Install them, then re-run:
  sdkmanager "build-tools;34.0.0"
Or set ANDROID_SDK_ROOT / ANDROID_HOME to an SDK that already has build-tools/.
"@
}
Write-Host "==> build-tools: $(Split-Path -Leaf (Split-Path -Parent $ZipAlign))"

# --- build --------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path $OutDir | Out-Null
if (-not (Test-Path $Tree)) { throw "apktool source tree not found: $Tree" }

Write-Host "==> apktool b $Tree"
& $Apktool b -f -o $Unsigned $Tree
if ($LASTEXITCODE -ne 0) { throw "apktool failed" }

if (-not (Test-Path $Keystore)) {
  Write-Host "==> creating keystore $Keystore"
  New-Item -ItemType Directory -Force -Path (Split-Path $Keystore) | Out-Null
  & keytool -genkeypair -keystore $Keystore -storepass $StorePass -alias ait-socks `
    -keypass $StorePass -keyalg RSA -keysize 2048 -validity 10000 `
    -dname "CN=AIT Socks, OU=AIT, O=lieusonsg, C=VN"
  if ($LASTEXITCODE -ne 0) { throw "keytool failed" }
}

# -p page-aligns the uncompressed .so entries, 4 aligns everything else
# (incl. resources.arsc) on a 4-byte boundary. -f overwrites a stale output.
Write-Host "==> zipalign -p -f 4"
Remove-Item $Aligned -Force -ErrorAction SilentlyContinue
& $ZipAlign -p -f 4 $Unsigned $Aligned
if ($LASTEXITCODE -ne 0) { throw "zipalign failed" }

# apksigner signs in place of the zip layout, so alignment survives. Defaults to
# v1+v2+v3; v2 is what Android 11+ demands for targetSdk >= 30.
Write-Host "==> apksigner sign $Signed"
Remove-Item $Signed -Force -ErrorAction SilentlyContinue
& $ApkSigner sign --ks $Keystore --ks-pass "pass:$StorePass" `
  --ks-key-alias ait-socks --key-pass "pass:$StorePass" `
  --out $Signed $Aligned
if ($LASTEXITCODE -ne 0) { throw "apksigner sign failed" }

Write-Host "==> verify"
& $ApkSigner verify -v $Signed
if ($LASTEXITCODE -ne 0) { throw "apksigner verify failed" }

& $ZipAlign -c -p -v 4 $Signed | Out-Null
if ($LASTEXITCODE -ne 0) { throw "alignment check failed on the signed APK" }
Write-Host "alignment OK (4-byte, resources.arsc mmap-able)"

Remove-Item $Aligned -Force -ErrorAction SilentlyContinue

Write-Host "OK: $Signed"
Get-Item $Signed | Format-List FullName, Length, LastWriteTime
