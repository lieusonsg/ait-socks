# AIT Socks — usage cheat sheet

## Component

```
com.ait.socks/net.typeblog.socks.MainActivity
```

## Start / stop

```bash
# MiChanger Samsung S9 ROM — allow VPN via AppOps first (no consent dialog)
adb shell appops set com.ait.socks ACTIVATE_VPN allow

# start
adb shell am start -n com.ait.socks/net.typeblog.socks.MainActivity \
  --es intent_ip "HOST" --ei intent_port PORT --ez intent_start true

# stop
adb shell am force-stop com.ait.socks
```

### MiChanger S9 note

On MiChanger’s Samsung S9 custom ROM, this works:

```bash
adb shell appops set com.ait.socks ACTIVATE_VPN allow
```

Run it **before** starting VPN. Re-apply after reinstall, clear data, or system “Forget VPN”.

## After factory reset

```bash
adb install -r AIT_Socks-v1.0.1.apk
# MiChanger S9 ROM:
adb shell appops set com.ait.socks ACTIVATE_VPN allow
adb shell am start -n com.ait.socks/net.typeblog.socks.MainActivity \
  --es intent_ip "HOST" --ei intent_port PORT --ez intent_start true
```

## Optional: system app (survives data wipe)

Flash or push to `/system/priv-app/AITSocks/AIT_Socks.apk` on custom ROM / TWRP, then reboot.
