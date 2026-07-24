# AIT Socks — usage cheat sheet

## Component

```
com.ait.socks/net.typeblog.socks.MainActivity
```

## Start / stop

```bash
# start
adb shell am start -n com.ait.socks/net.typeblog.socks.MainActivity \
  --es intent_ip "HOST" --ei intent_port PORT --ez intent_start true

# stop
adb shell am force-stop com.ait.socks
```

## After factory reset

```bash
adb install -r AIT_Socks-v1.0.0.apk
# first time only: accept VPN dialog
adb shell am start -n com.ait.socks/net.typeblog.socks.MainActivity \
  --es intent_ip "HOST" --ei intent_port PORT --ez intent_start true
```

## Optional: system app (survives data wipe)

Flash or push to `/system/priv-app/AITSocks/AIT_Socks.apk` on custom ROM / TWRP, then reboot.
