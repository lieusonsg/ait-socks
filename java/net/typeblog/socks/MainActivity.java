package net.typeblog.socks;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.SharedPreferences;
import android.net.VpnService;
import android.os.Bundle;
import android.os.IBinder;
import android.text.TextUtils;
import android.util.Log;
import android.widget.Toast;

import net.typeblog.socks.util.Constants;
import net.typeblog.socks.util.Profile;
import net.typeblog.socks.util.ProfileManager;
import net.typeblog.socks.util.Utility;

/**
 * Automation-friendly entry for SOCKS5.
 *
 * Example:
 * <pre>
 * adb shell am start -n com.ait.socks/net.typeblog.socks.MainActivity \
 *   --es intent_ip "160.250.166.22" \
 *   --ei intent_port 11245 \
 *   --ez intent_start true \
 *   --es intent_user "username" \
 *   --es intent_passwd "password"
 * </pre>
 *
 * Stop:
 * <pre>
 * adb shell am start -n com.ait.socks/net.typeblog.socks.MainActivity \
 *   --ez intent_start false
 * </pre>
 */
public class MainActivity extends Activity {
    private static final String TAG = "AitSocks";
    private static final int REQ_VPN = 1001;

    public static final String EXTRA_IP = "intent_ip";
    public static final String EXTRA_PORT = "intent_port";
    public static final String EXTRA_START = "intent_start";
    public static final String EXTRA_USER = "intent_user";
    public static final String EXTRA_PASSWD = "intent_passwd";
    /** Optional: close activity after start/stop (default true in automation mode). */
    public static final String EXTRA_FINISH = "intent_finish";

    private boolean mAutomation;
    private boolean mPendingStart;
    private boolean mFinishAfter = true;
    private Profile mProfile;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (handleAutomation(getIntent())) {
            return;
        }
        // Manual UI (original SocksDroid preferences screen)
        getFragmentManager()
                .beginTransaction()
                .replace(android.R.id.content, new ProfileFragment())
                .commit();
    }

    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        setIntent(intent);
        handleAutomation(intent);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == REQ_VPN) {
            if (resultCode == RESULT_OK && mPendingStart) {
                startSocks();
            } else {
                Log.w(TAG, "VPN permission denied or cancelled");
                toast("VPN permission denied");
            }
            if (mFinishAfter) {
                finish();
            }
        }
    }

    /**
     * @return true if intent was treated as automation (UI not shown)
     */
    private boolean handleAutomation(Intent intent) {
        if (intent == null) {
            return false;
        }
        boolean hasIp = intent.hasExtra(EXTRA_IP);
        boolean hasStart = intent.hasExtra(EXTRA_START);
        // Also accept legacy SOCKS* extras as automation markers
        boolean hasLegacy = intent.hasExtra(Constants.INTENT_SERVER);
        if (!hasIp && !hasStart && !hasLegacy) {
            return false;
        }

        mAutomation = true;
        mFinishAfter = intent.getBooleanExtra(EXTRA_FINISH, true);

        String ip = firstNonEmpty(
                intent.getStringExtra(EXTRA_IP),
                intent.getStringExtra(Constants.INTENT_SERVER));
        int port = readPort(intent);
        String user = firstNonEmpty(
                intent.getStringExtra(EXTRA_USER),
                intent.getStringExtra(Constants.INTENT_USERNAME));
        String pass = firstNonEmpty(
                intent.getStringExtra(EXTRA_PASSWD),
                intent.getStringExtra(Constants.INTENT_PASSWORD));
        boolean start = intent.getBooleanExtra(EXTRA_START, true);

        ProfileManager manager = new ProfileManager(getApplicationContext());
        mProfile = manager.getDefault();
        if (mProfile == null) {
            toast("No profile");
            if (mFinishAfter) finish();
            return true;
        }

        if (!TextUtils.isEmpty(ip)) {
            mProfile.setServer(ip.trim());
        }
        if (port > 0 && port <= 65535) {
            mProfile.setPort(port);
        }
        if (!TextUtils.isEmpty(user) || !TextUtils.isEmpty(pass)) {
            mProfile.setIsUserpw(true);
            if (user != null) mProfile.setUsername(user);
            if (pass != null) mProfile.setPassword(pass);
        } else if (hasIp || hasLegacy) {
            // explicit config without auth → clear userpw
            if (TextUtils.isEmpty(user) && TextUtils.isEmpty(pass)
                    && (intent.hasExtra(EXTRA_USER) || intent.hasExtra(EXTRA_PASSWD))) {
                mProfile.setIsUserpw(false);
            }
        }

        // Persist last profile pointer
        SharedPreferences pref = getSharedPreferences(Constants.PREF, 0);
        pref.edit().putString(Constants.PREF_LAST_PROFILE, mProfile.getName()).apply();

        Log.i(TAG, "automation start=" + start
                + " server=" + mProfile.getServer()
                + ":" + mProfile.getPort()
                + " auth=" + mProfile.isUserPw());

        if (!start) {
            stopSocks();
            return true;
        }

        mPendingStart = true;
        Intent prepare = VpnService.prepare(this);
        if (prepare != null) {
            // First-time VPN consent (one system dialog)
            startActivityForResult(prepare, REQ_VPN);
        } else {
            startSocks();
            if (mFinishAfter) {
                finish();
            }
        }
        return true;
    }

    private void startSocks() {
        try {
            Utility.startVpn(this, mProfile);
            toast("SOCKS ON " + mProfile.getServer() + ":" + mProfile.getPort());
        } catch (Exception e) {
            Log.e(TAG, "startVpn failed", e);
            toast("start failed: " + e.getMessage());
        }
    }

    private void stopSocks() {
        // Bind to VPN process and request stop via AIDL
        Intent svc = new Intent(this, SocksVpnService.class);
        bindService(svc, new ServiceConnection() {
            @Override
            public void onServiceConnected(ComponentName name, IBinder service) {
                try {
                    IVpnService.Stub.asInterface(service).stop();
                    toast("SOCKS OFF");
                } catch (Exception e) {
                    Log.e(TAG, "stop failed", e);
                }
                try {
                    unbindService(this);
                } catch (Exception ignored) {
                }
                if (mFinishAfter) {
                    finish();
                }
            }

            @Override
            public void onServiceDisconnected(ComponentName name) {
            }
        }, BIND_AUTO_CREATE);

        // Fallback if service not running
        getWindow().getDecorView().postDelayed(() -> {
            if (mFinishAfter && !isFinishing()) {
                finish();
            }
        }, 1500);
    }

    private static int readPort(Intent intent) {
        // --ei intent_port 1080
        int port = intent.getIntExtra(EXTRA_PORT, -1);
        if (port > 0) {
            return port;
        }
        port = intent.getIntExtra(Constants.INTENT_PORT, -1);
        if (port > 0) {
            return port;
        }
        // --es intent_port "1080"
        String s = intent.getStringExtra(EXTRA_PORT);
        if (!TextUtils.isEmpty(s)) {
            try {
                return Integer.parseInt(s.trim());
            } catch (NumberFormatException ignored) {
            }
        }
        return 1080;
    }

    private static String firstNonEmpty(String a, String b) {
        if (!TextUtils.isEmpty(a)) return a;
        if (!TextUtils.isEmpty(b)) return b;
        return null;
    }

    private void toast(String msg) {
        try {
            Toast.makeText(getApplicationContext(), msg, Toast.LENGTH_SHORT).show();
        } catch (Exception ignored) {
        }
    }
}
