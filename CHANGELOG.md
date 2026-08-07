# Changelog

All notable changes to this project are documented here.

## [1.0.1] — 2026-08-07

Packaging fix only. **No change to app code, behaviour, or intent API** — the smali,
native libraries, and resources are byte-for-byte the same as v1.0.0.

### Fixed

- **APK now installs on Android 11+.** v1.0.0 failed with:

  ```
  Failure [-124: Failed parse during installPackageLI: Targeting R+ (version 30 and
  above) requires the resources.arsc of installed APKs to be stored uncompressed and
  aligned on a 4-byte boundary]
  ```

  The build signed with `jarsigner` and never ran `zipalign`. `jarsigner` rewrites the
  zip to insert `META-INF/`, which left `resources.arsc` at offset 65878 (`% 4 = 2`).
  Since the app declares `targetSdkVersion 31`, the Android R+ package parser rejects
  that. The check only exists on API 30+, so v1.0.0 installed fine on API <= 29 devices
  (e.g. Galaxy S9) — which is why it shipped unnoticed.

  In v1.0.1 `resources.arsc` sits at offset 60864 (`% 4 = 0`) and no stored zip entry
  is misaligned.

- **APK is now signed with APK Signature Scheme v2 and v3**, not just v1/JAR. Apps
  targeting API 30+ require v2 or newer. The signing key is unchanged
  (cert SHA-256 `800d13e3…61ac`), so v1.0.1 installs over an existing v1.0.0 without
  uninstalling.

### Changed

- `scripts/build.ps1` now runs `apktool b` → `zipalign -p -f 4` → `apksigner sign`
  (v1+v2+v3) → `apksigner verify` → `zipalign -c`. `jarsigner` is no longer used, and
  must not be reintroduced: it undoes the alignment.
- The build resolves Android SDK build-tools from `ANDROID_SDK_ROOT` / `ANDROID_HOME` /
  `%LOCALAPPDATA%\Android\Sdk` / `PATH`, and aborts with install instructions when they
  are missing instead of silently producing a broken APK.
- `.gitignore`: the negation `!dist/AIT_Socks-*.apk` was wide enough to cancel the rules
  that ignore build intermediates; narrowed to `!dist/AIT_Socks-v*.apk`. Also ignore
  `dist/*.idsig`.

### Verified

On the artifact — `resources.arsc` STORED at a 4-byte offset, no misaligned stored
entries, v1+v2+v3 signatures all verify, signer cert identical to v1.0.0.

On device — Galaxy S22 Ultra (SM-S908U, API 32, i.e. subject to the R+ parser check):
`adb install -r` succeeds, and a SOCKS5 proxy set through `intent_ip` / `intent_port`
moves the device egress IP from the local WAN address to the proxy address.

## [1.0.0] — 2026-07-24

Initial release. SocksDroid fork with an intent automation layer
(`intent_ip`, `intent_port`, `intent_start`, `intent_user`, `intent_passwd`,
`intent_finish`) for headless ADB-driven SOCKS5 setup on device farms.

> Known issue, fixed in 1.0.1: the published APK cannot be installed on Android 11+.

[1.0.1]: https://github.com/lieusonsg/ait-socks/releases/tag/v1.0.1
[1.0.0]: https://github.com/lieusonsg/ait-socks/releases/tag/v1.0.0
