# AIT Socks

**ADB-friendly SOCKS5 VPN client for Android** — set host/port/auth with one `am start` command. Built for device farms, factory-reset automation, and MiChanger-style workflows.

> Fork lineage: [SocksDroid](https://github.com/typeblog/SocksDroid) (tun2socks VPN) + intent automation layer.

---

## Install

Download the latest APK from [Releases](https://github.com/lieusonsg/ait-socks/releases):

| | |
|--|--|
| Package | `com.ait.socks` |
| App name | **AIT Socks** |
| Min SDK | 21 (Android 5.0+) |
| VPN | system `VpnService` |

```bash
adb install -r AIT_Socks-v1.0.0.apk
```

First run may show a **one-time** Android VPN permission dialog — tap OK. After that, control is fully headless.

### MiChanger Samsung S9 ROM — skip / pre-allow VPN via AppOps

On **MiChanger custom ROM for Samsung S9** (e.g. `SamsungS9` / `s9_adr10_new` style images used with MiChangerPlus), you can pre-allow VPN activation over ADB:

```bash
adb shell appops set com.ait.socks ACTIVATE_VPN allow
```

Recommended order for farm scripts on that ROM:

```bash
adb install -r AIT_Socks-v1.0.0.apk
adb shell appops set com.ait.socks ACTIVATE_VPN allow
adb shell am start -n com.ait.socks/net.typeblog.socks.MainActivity \
  --es intent_ip "HOST" \
  --ei intent_port 1080 \
  --ez intent_start true
```

This has been verified on MiChanger S9 devices: set **AppOps first**, then start the intent — typically **no VPN consent dialog**.  
On stock Android / other ROMs, `ACTIVATE_VPN allow` may not replace the system VPN dialog; you may still need a one-time OK (or UI automation).

Re-run `appops set … allow` after reinstall, app data clear, or if you used **Forget VPN** in system settings.

---

## Quick start (ADB)

### Start SOCKS5

```bash
# On MiChanger S9 ROM — run AppOps first (see above)
adb shell appops set com.ait.socks ACTIVATE_VPN allow

adb shell am start -n com.ait.socks/net.typeblog.socks.MainActivity \
  --es intent_ip "160.250.166.22" \
  --ei intent_port 11245 \
  --ez intent_start true
```

### With username / password

```bash
adb shell am start -n com.ait.socks/net.typeblog.socks.MainActivity \
  --es intent_ip "IP_PROXY" \
  --ei intent_port 1080 \
  --ez intent_start true \
  --es intent_user "username" \
  --es intent_passwd "password"
```

### Stop

```bash
adb shell am start -n com.ait.socks/net.typeblog.socks.MainActivity \
  --ez intent_start false
```

Hard stop (recommended in scripts):

```bash
adb shell am force-stop com.ait.socks
```

### Verify

```bash
adb shell curl -s --max-time 10 https://api.ipify.org
# expect proxy public IP
```

---

## Intent extras

| Extra | Type | Description |
|-------|------|-------------|
| `intent_ip` | string | SOCKS5 host |
| `intent_port` | int (`--ei`) or string (`--es`) | Port (default `1080`) |
| `intent_start` | boolean | `true` = connect, `false` = disconnect |
| `intent_user` | string | Optional auth user |
| `intent_passwd` | string | Optional auth password |
| `intent_finish` | boolean | Finish activity after action (default `true`) |

Legacy SocksDroid service keys also accepted: `SOCKSSERV`, `SOCKSPORT`, `SOCKSUNAME`, `SOCKSPASSWD`.

---

## Why AIT Socks?

| Approach | After factory reset | Automation |
|----------|---------------------|------------|
| SocksDroid UI (tap IP/port/switch) | Painful | Fragile |
| HTTP `settings put global http_proxy` | Easy | Not real SOCKS5 |
| **AIT Socks intent** | `install` + 1 `am start` | Stable |

Ideal for:

- Multi-device farms  
- Post-wipe / post-MiChanger change scripts  
- CI / bots that only have ADB  

---

## Automation example (Python)

```python
import subprocess

def set_socks(serial: str, host: str, port: int,
              user: str | None = None, password: str | None = None,
              start: bool = True, michanger_s9: bool = True) -> None:
    if michanger_s9 and start:
        # MiChanger Samsung S9 ROM: pre-allow VPN (avoids consent dialog)
        subprocess.check_call([
            "adb", "-s", serial, "shell",
            "appops", "set", "com.ait.socks", "ACTIVATE_VPN", "allow",
        ])
    cmd = [
        "adb", "-s", serial, "shell", "am", "start",
        "-n", "com.ait.socks/net.typeblog.socks.MainActivity",
        "--es", "intent_ip", host,
        "--ei", "intent_port", str(port),
        "--ez", "intent_start", "true" if start else "false",
    ]
    if user is not None:
        cmd += ["--es", "intent_user", user, "--es", "intent_passwd", password or ""]
    subprocess.check_call(cmd)

# set_socks("2a52c8b138027ece", "160.250.166.22", 11245)
```

---

## Manual UI

Launch **AIT Socks** from the app drawer to edit profiles (same preference UI as SocksDroid). Intent automation and UI share the **Default** profile.

---

## Build from this repo

Requires: [apktool](https://apktool.org/), JDK (`jarsigner` / `keytool`).

```powershell
# Windows
powershell -ExecutionPolicy Bypass -File .\scripts\build.ps1
# output: dist\AIT_Socks-v1.0.0.apk
```

Patched activity reference (Java, for maintainers):

- `java/net/typeblog/socks/MainActivity.java`

The release APK is produced from the apktool tree (smali + native `libtun2socks` / `libpdnsd`).

---

## Security notes

- SOCKS credentials in intents may appear in `logcat` / shell history — prefer short-lived tokens on shared machines.  
- Only install APKs from this GitHub Releases page if you care about authenticity.  
- VPN routes device traffic through your SOCKS server; use a proxy you trust.

---

## Credits

- [SocksDroid](https://github.com/typeblog/SocksDroid) / [badvpn tun2socks](https://github.com/ambrop72/badvpn) — VPN + SOCKS engine  
- AIT — intent automation packaging for farm use  

---

## License

Upstream SocksDroid is free software; see `LICENSE`.  
AIT automation patches are provided under the same spirit — free to use and redistribute.
