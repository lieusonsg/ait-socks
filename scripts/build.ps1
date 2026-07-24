# Build AIT_Socks release APK from sibling apktool tree
$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$Tree = Join-Path (Split-Path -Parent $Root) "socksdroid-apktool"
if (-not (Test-Path $Tree)) {
  $Tree = Join-Path $Root "apktool-src"
}
$OutDir = Join-Path $Root "dist"
$Version = "1.0.0"
$Unsigned = Join-Path $OutDir "AIT_Socks-unsigned.apk"
$Signed = Join-Path $OutDir "AIT_Socks-v$Version.apk"
$Apktool = if (Test-Path "C:\Users\NHI\tools\apktool\apktool.bat") {
  "C:\Users\NHI\tools\apktool\apktool.bat"
} else { "apktool" }
$Keystore = Join-Path $env:USERPROFILE ".android\ait-socks-release.jks"
$StorePass = if ($env:AIT_SOCKS_KEYSTORE_PASS) { $env:AIT_SOCKS_KEYSTORE_PASS } else { "ait-socks-2026" }

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
}

Copy-Item $Unsigned $Signed -Force
Write-Host "==> jarsigner $Signed"
& jarsigner -sigalg SHA256withRSA -digestalg SHA-256 `
  -keystore $Keystore -storepass $StorePass -keypass $StorePass `
  $Signed ait-socks | Out-Null
if ($LASTEXITCODE -ne 0) { throw "jarsigner failed" }

Write-Host "OK: $Signed"
Get-Item $Signed | Format-List FullName, Length, LastWriteTime
