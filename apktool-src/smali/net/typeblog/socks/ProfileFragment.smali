.class public Lnet/typeblog/socks/ProfileFragment;
.super Landroid/preference/PreferenceFragment;
.source "ProfileFragment.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;
.implements Landroid/preference/Preference$OnPreferenceChangeListener;
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# instance fields
.field private mBinder:Lnet/typeblog/socks/IVpnService;

.field private final mConnection:Landroid/content/ServiceConnection;

.field private mManager:Lnet/typeblog/socks/util/ProfileManager;

.field private mPrefAppBypass:Landroid/preference/CheckBoxPreference;

.field private mPrefAppList:Landroid/preference/EditTextPreference;

.field private mPrefAuto:Landroid/preference/CheckBoxPreference;

.field private mPrefDns:Landroid/preference/EditTextPreference;

.field private mPrefDnsPort:Landroid/preference/EditTextPreference;

.field private mPrefIPv6:Landroid/preference/CheckBoxPreference;

.field private mPrefPassword:Landroid/preference/EditTextPreference;

.field private mPrefPerApp:Landroid/preference/CheckBoxPreference;

.field private mPrefPort:Landroid/preference/EditTextPreference;

.field private mPrefProfile:Landroid/preference/ListPreference;

.field private mPrefRoutes:Landroid/preference/ListPreference;

.field private mPrefServer:Landroid/preference/EditTextPreference;

.field private mPrefUDP:Landroid/preference/CheckBoxPreference;

.field private mPrefUDPGW:Landroid/preference/EditTextPreference;

.field private mPrefUsername:Landroid/preference/EditTextPreference;

.field private mPrefUserpw:Landroid/preference/CheckBoxPreference;

.field private mProfile:Lnet/typeblog/socks/util/Profile;

.field private mRunning:Z

.field private mStarting:Z

.field private final mStateRunnable:Ljava/lang/Runnable;

.field private mStopping:Z

.field private mSwitch:Landroid/widget/Switch;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 34
    invoke-direct {p0}, Landroid/preference/PreferenceFragment;-><init>()V

    const/4 v0, 0x0

    .line 40
    iput-boolean v0, p0, Lnet/typeblog/socks/ProfileFragment;->mRunning:Z

    .line 41
    iput-boolean v0, p0, Lnet/typeblog/socks/ProfileFragment;->mStarting:Z

    iput-boolean v0, p0, Lnet/typeblog/socks/ProfileFragment;->mStopping:Z

    .line 42
    new-instance v0, Lnet/typeblog/socks/ProfileFragment$1;

    invoke-direct {v0, p0}, Lnet/typeblog/socks/ProfileFragment$1;-><init>(Lnet/typeblog/socks/ProfileFragment;)V

    iput-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mConnection:Landroid/content/ServiceConnection;

    .line 63
    new-instance v0, Lnet/typeblog/socks/ProfileFragment$2;

    invoke-direct {v0, p0}, Lnet/typeblog/socks/ProfileFragment$2;-><init>(Lnet/typeblog/socks/ProfileFragment;)V

    iput-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mStateRunnable:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic access$000(Lnet/typeblog/socks/ProfileFragment;)Lnet/typeblog/socks/IVpnService;
    .locals 0

    .line 34
    iget-object p0, p0, Lnet/typeblog/socks/ProfileFragment;->mBinder:Lnet/typeblog/socks/IVpnService;

    return-object p0
.end method

.method static synthetic access$002(Lnet/typeblog/socks/ProfileFragment;Lnet/typeblog/socks/IVpnService;)Lnet/typeblog/socks/IVpnService;
    .locals 0

    .line 34
    iput-object p1, p0, Lnet/typeblog/socks/ProfileFragment;->mBinder:Lnet/typeblog/socks/IVpnService;

    return-object p1
.end method

.method static synthetic access$100(Lnet/typeblog/socks/ProfileFragment;)Z
    .locals 0

    .line 34
    iget-boolean p0, p0, Lnet/typeblog/socks/ProfileFragment;->mRunning:Z

    return p0
.end method

.method static synthetic access$102(Lnet/typeblog/socks/ProfileFragment;Z)Z
    .locals 0

    .line 34
    iput-boolean p1, p0, Lnet/typeblog/socks/ProfileFragment;->mRunning:Z

    return p1
.end method

.method static synthetic access$200(Lnet/typeblog/socks/ProfileFragment;)V
    .locals 0

    .line 34
    invoke-direct {p0}, Lnet/typeblog/socks/ProfileFragment;->updateState()V

    return-void
.end method

.method static synthetic access$300(Lnet/typeblog/socks/ProfileFragment;)Landroid/widget/Switch;
    .locals 0

    .line 34
    iget-object p0, p0, Lnet/typeblog/socks/ProfileFragment;->mSwitch:Landroid/widget/Switch;

    return-object p0
.end method

.method private addProfile()V
    .locals 3

    .line 315
    new-instance v0, Landroid/widget/EditText;

    invoke-virtual {p0}, Lnet/typeblog/socks/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    .line 316
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 318
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lnet/typeblog/socks/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f08001a

    .line 319
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 320
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lnet/typeblog/socks/ProfileFragment$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0, v0}, Lnet/typeblog/socks/ProfileFragment$$ExternalSyntheticLambda1;-><init>(Lnet/typeblog/socks/ProfileFragment;Landroid/widget/EditText;)V

    const v0, 0x104000a

    .line 321
    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget-object v1, Lnet/typeblog/socks/ProfileFragment$$ExternalSyntheticLambda2;->INSTANCE:Lnet/typeblog/socks/ProfileFragment$$ExternalSyntheticLambda2;

    const/high16 v2, 0x1040000

    .line 338
    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 341
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method private checkState()V
    .locals 5

    const/4 v0, 0x0

    .line 365
    iput-boolean v0, p0, Lnet/typeblog/socks/ProfileFragment;->mRunning:Z

    .line 366
    iget-object v1, p0, Lnet/typeblog/socks/ProfileFragment;->mSwitch:Landroid/widget/Switch;

    invoke-virtual {v1, v0}, Landroid/widget/Switch;->setEnabled(Z)V

    .line 367
    iget-object v1, p0, Lnet/typeblog/socks/ProfileFragment;->mSwitch:Landroid/widget/Switch;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 369
    iget-object v1, p0, Lnet/typeblog/socks/ProfileFragment;->mBinder:Lnet/typeblog/socks/IVpnService;

    if-nez v1, :cond_0

    .line 370
    invoke-virtual {p0}, Lnet/typeblog/socks/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Landroid/content/Intent;

    invoke-virtual {p0}, Lnet/typeblog/socks/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const-class v4, Lnet/typeblog/socks/SocksVpnService;

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v3, p0, Lnet/typeblog/socks/ProfileFragment;->mConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v1, v2, v3, v0}, Landroid/app/Activity;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    :cond_0
    return-void
.end method

.method private initPreferences()V
    .locals 1

    const-string v0, "profile"

    .line 211
    invoke-virtual {p0, v0}, Lnet/typeblog/socks/ProfileFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/ListPreference;

    iput-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefProfile:Landroid/preference/ListPreference;

    const-string v0, "server_ip"

    .line 212
    invoke-virtual {p0, v0}, Lnet/typeblog/socks/ProfileFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/EditTextPreference;

    iput-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefServer:Landroid/preference/EditTextPreference;

    const-string v0, "server_port"

    .line 213
    invoke-virtual {p0, v0}, Lnet/typeblog/socks/ProfileFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/EditTextPreference;

    iput-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefPort:Landroid/preference/EditTextPreference;

    const-string v0, "auth_userpw"

    .line 214
    invoke-virtual {p0, v0}, Lnet/typeblog/socks/ProfileFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/CheckBoxPreference;

    iput-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefUserpw:Landroid/preference/CheckBoxPreference;

    const-string v0, "auth_username"

    .line 215
    invoke-virtual {p0, v0}, Lnet/typeblog/socks/ProfileFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/EditTextPreference;

    iput-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefUsername:Landroid/preference/EditTextPreference;

    const-string v0, "auth_password"

    .line 216
    invoke-virtual {p0, v0}, Lnet/typeblog/socks/ProfileFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/EditTextPreference;

    iput-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefPassword:Landroid/preference/EditTextPreference;

    const-string v0, "adv_route"

    .line 217
    invoke-virtual {p0, v0}, Lnet/typeblog/socks/ProfileFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/ListPreference;

    iput-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefRoutes:Landroid/preference/ListPreference;

    const-string v0, "adv_dns"

    .line 218
    invoke-virtual {p0, v0}, Lnet/typeblog/socks/ProfileFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/EditTextPreference;

    iput-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefDns:Landroid/preference/EditTextPreference;

    const-string v0, "adv_dns_port"

    .line 219
    invoke-virtual {p0, v0}, Lnet/typeblog/socks/ProfileFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/EditTextPreference;

    iput-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefDnsPort:Landroid/preference/EditTextPreference;

    const-string v0, "adv_per_app"

    .line 220
    invoke-virtual {p0, v0}, Lnet/typeblog/socks/ProfileFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/CheckBoxPreference;

    iput-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefPerApp:Landroid/preference/CheckBoxPreference;

    const-string v0, "adv_app_bypass"

    .line 221
    invoke-virtual {p0, v0}, Lnet/typeblog/socks/ProfileFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/CheckBoxPreference;

    iput-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefAppBypass:Landroid/preference/CheckBoxPreference;

    const-string v0, "adv_app_list"

    .line 222
    invoke-virtual {p0, v0}, Lnet/typeblog/socks/ProfileFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/EditTextPreference;

    iput-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefAppList:Landroid/preference/EditTextPreference;

    const-string v0, "ipv6_proxy"

    .line 223
    invoke-virtual {p0, v0}, Lnet/typeblog/socks/ProfileFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/CheckBoxPreference;

    iput-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefIPv6:Landroid/preference/CheckBoxPreference;

    const-string v0, "udp_proxy"

    .line 224
    invoke-virtual {p0, v0}, Lnet/typeblog/socks/ProfileFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/CheckBoxPreference;

    iput-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefUDP:Landroid/preference/CheckBoxPreference;

    const-string v0, "udp_gw"

    .line 225
    invoke-virtual {p0, v0}, Lnet/typeblog/socks/ProfileFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/EditTextPreference;

    iput-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefUDPGW:Landroid/preference/EditTextPreference;

    const-string v0, "adv_auto_connect"

    .line 226
    invoke-virtual {p0, v0}, Lnet/typeblog/socks/ProfileFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/CheckBoxPreference;

    iput-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefAuto:Landroid/preference/CheckBoxPreference;

    .line 228
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefProfile:Landroid/preference/ListPreference;

    invoke-virtual {v0, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 229
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefServer:Landroid/preference/EditTextPreference;

    invoke-virtual {v0, p0}, Landroid/preference/EditTextPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 230
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefPort:Landroid/preference/EditTextPreference;

    invoke-virtual {v0, p0}, Landroid/preference/EditTextPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 231
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefUserpw:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 232
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefUsername:Landroid/preference/EditTextPreference;

    invoke-virtual {v0, p0}, Landroid/preference/EditTextPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 233
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefPassword:Landroid/preference/EditTextPreference;

    invoke-virtual {v0, p0}, Landroid/preference/EditTextPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 234
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefRoutes:Landroid/preference/ListPreference;

    invoke-virtual {v0, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 235
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefDns:Landroid/preference/EditTextPreference;

    invoke-virtual {v0, p0}, Landroid/preference/EditTextPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 236
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefDnsPort:Landroid/preference/EditTextPreference;

    invoke-virtual {v0, p0}, Landroid/preference/EditTextPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 237
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefPerApp:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 238
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefAppBypass:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 239
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefAppList:Landroid/preference/EditTextPreference;

    invoke-virtual {v0, p0}, Landroid/preference/EditTextPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 240
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefIPv6:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 241
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefUDP:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 242
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefUDPGW:Landroid/preference/EditTextPreference;

    invoke-virtual {v0, p0}, Landroid/preference/EditTextPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 243
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefAuto:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    return-void
.end method

.method static synthetic lambda$addProfile$1(Landroid/content/DialogInterface;I)V
    .locals 0

    return-void
.end method

.method static synthetic lambda$removeProfile$3(Landroid/content/DialogInterface;I)V
    .locals 0

    return-void
.end method

.method private reload()V
    .locals 5

    .line 247
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    if-nez v0, :cond_0

    .line 248
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mManager:Lnet/typeblog/socks/util/ProfileManager;

    invoke-virtual {v0}, Lnet/typeblog/socks/util/ProfileManager;->getDefault()Lnet/typeblog/socks/util/Profile;

    move-result-object v0

    iput-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    .line 251
    :cond_0
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefProfile:Landroid/preference/ListPreference;

    iget-object v1, p0, Lnet/typeblog/socks/ProfileFragment;->mManager:Lnet/typeblog/socks/util/ProfileManager;

    invoke-virtual {v1}, Lnet/typeblog/socks/util/ProfileManager;->getProfiles()[Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 252
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefProfile:Landroid/preference/ListPreference;

    iget-object v1, p0, Lnet/typeblog/socks/ProfileFragment;->mManager:Lnet/typeblog/socks/util/ProfileManager;

    invoke-virtual {v1}, Lnet/typeblog/socks/util/ProfileManager;->getProfiles()[Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 253
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefProfile:Landroid/preference/ListPreference;

    iget-object v1, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    invoke-virtual {v1}, Lnet/typeblog/socks/util/Profile;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 254
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefRoutes:Landroid/preference/ListPreference;

    iget-object v1, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    invoke-virtual {v1}, Lnet/typeblog/socks/util/Profile;->getRoute()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    const/4 v0, 0x2

    new-array v1, v0, [Landroid/preference/ListPreference;

    .line 255
    iget-object v2, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefProfile:Landroid/preference/ListPreference;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-object v2, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefRoutes:Landroid/preference/ListPreference;

    const/4 v4, 0x1

    aput-object v2, v1, v4

    invoke-direct {p0, v1}, Lnet/typeblog/socks/ProfileFragment;->resetList([Landroid/preference/ListPreference;)V

    .line 257
    iget-object v1, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefUserpw:Landroid/preference/CheckBoxPreference;

    iget-object v2, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    invoke-virtual {v2}, Lnet/typeblog/socks/util/Profile;->isUserPw()Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 258
    iget-object v1, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefPerApp:Landroid/preference/CheckBoxPreference;

    iget-object v2, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    invoke-virtual {v2}, Lnet/typeblog/socks/util/Profile;->isPerApp()Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 259
    iget-object v1, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefAppBypass:Landroid/preference/CheckBoxPreference;

    iget-object v2, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    invoke-virtual {v2}, Lnet/typeblog/socks/util/Profile;->isBypassApp()Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 260
    iget-object v1, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefIPv6:Landroid/preference/CheckBoxPreference;

    iget-object v2, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    invoke-virtual {v2}, Lnet/typeblog/socks/util/Profile;->hasIPv6()Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 261
    iget-object v1, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefUDP:Landroid/preference/CheckBoxPreference;

    iget-object v2, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    invoke-virtual {v2}, Lnet/typeblog/socks/util/Profile;->hasUDP()Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 262
    iget-object v1, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefAuto:Landroid/preference/CheckBoxPreference;

    iget-object v2, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    invoke-virtual {v2}, Lnet/typeblog/socks/util/Profile;->autoConnect()Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 264
    iget-object v1, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefServer:Landroid/preference/EditTextPreference;

    iget-object v2, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    invoke-virtual {v2}, Lnet/typeblog/socks/util/Profile;->getServer()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/EditTextPreference;->setText(Ljava/lang/String;)V

    .line 265
    iget-object v1, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefPort:Landroid/preference/EditTextPreference;

    iget-object v2, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    invoke-virtual {v2}, Lnet/typeblog/socks/util/Profile;->getPort()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/EditTextPreference;->setText(Ljava/lang/String;)V

    .line 266
    iget-object v1, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefUsername:Landroid/preference/EditTextPreference;

    iget-object v2, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    invoke-virtual {v2}, Lnet/typeblog/socks/util/Profile;->getUsername()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/EditTextPreference;->setText(Ljava/lang/String;)V

    .line 267
    iget-object v1, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefPassword:Landroid/preference/EditTextPreference;

    iget-object v2, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    invoke-virtual {v2}, Lnet/typeblog/socks/util/Profile;->getPassword()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/EditTextPreference;->setText(Ljava/lang/String;)V

    .line 268
    iget-object v1, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefDns:Landroid/preference/EditTextPreference;

    iget-object v2, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    invoke-virtual {v2}, Lnet/typeblog/socks/util/Profile;->getDns()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/EditTextPreference;->setText(Ljava/lang/String;)V

    .line 269
    iget-object v1, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefDnsPort:Landroid/preference/EditTextPreference;

    iget-object v2, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    invoke-virtual {v2}, Lnet/typeblog/socks/util/Profile;->getDnsPort()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/EditTextPreference;->setText(Ljava/lang/String;)V

    .line 270
    iget-object v1, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefUDPGW:Landroid/preference/EditTextPreference;

    iget-object v2, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    invoke-virtual {v2}, Lnet/typeblog/socks/util/Profile;->getUDPGW()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/EditTextPreference;->setText(Ljava/lang/String;)V

    const/4 v1, 0x7

    new-array v1, v1, [Landroid/preference/EditTextPreference;

    .line 271
    iget-object v2, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefServer:Landroid/preference/EditTextPreference;

    aput-object v2, v1, v3

    iget-object v2, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefPort:Landroid/preference/EditTextPreference;

    aput-object v2, v1, v4

    iget-object v2, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefUsername:Landroid/preference/EditTextPreference;

    aput-object v2, v1, v0

    const/4 v0, 0x3

    iget-object v2, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefPassword:Landroid/preference/EditTextPreference;

    aput-object v2, v1, v0

    const/4 v0, 0x4

    iget-object v2, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefDns:Landroid/preference/EditTextPreference;

    aput-object v2, v1, v0

    const/4 v0, 0x5

    iget-object v2, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefDnsPort:Landroid/preference/EditTextPreference;

    aput-object v2, v1, v0

    const/4 v0, 0x6

    iget-object v2, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefUDPGW:Landroid/preference/EditTextPreference;

    aput-object v2, v1, v0

    invoke-direct {p0, v1}, Lnet/typeblog/socks/ProfileFragment;->resetText([Landroid/preference/EditTextPreference;)V

    .line 273
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefAppList:Landroid/preference/EditTextPreference;

    iget-object v1, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    invoke-virtual {v1}, Lnet/typeblog/socks/util/Profile;->getAppList()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/EditTextPreference;->setText(Ljava/lang/String;)V

    return-void
.end method

.method private removeProfile()V
    .locals 5

    .line 345
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lnet/typeblog/socks/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f08001c

    .line 346
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f08001d

    .line 347
    invoke-virtual {p0, v1}, Lnet/typeblog/socks/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    invoke-virtual {v3}, Lnet/typeblog/socks/util/Profile;->getName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lnet/typeblog/socks/ProfileFragment$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lnet/typeblog/socks/ProfileFragment$$ExternalSyntheticLambda0;-><init>(Lnet/typeblog/socks/ProfileFragment;)V

    const v2, 0x104000a

    .line 348
    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    sget-object v1, Lnet/typeblog/socks/ProfileFragment$$ExternalSyntheticLambda3;->INSTANCE:Lnet/typeblog/socks/ProfileFragment$$ExternalSyntheticLambda3;

    const/high16 v2, 0x1040000

    .line 358
    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 361
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method private varargs resetList([Landroid/preference/ListPreference;)V
    .locals 4

    .line 277
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    .line 278
    invoke-virtual {v2}, Landroid/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private resetListN(Landroid/preference/ListPreference;Ljava/lang/Object;)V
    .locals 0

    .line 282
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private varargs resetText([Landroid/preference/EditTextPreference;)V
    .locals 9

    .line 286
    array-length v0, p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_2

    aget-object v3, p1, v2

    .line 287
    invoke-virtual {v3}, Landroid/preference/EditTextPreference;->getEditText()Landroid/widget/EditText;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/EditText;->getInputType()I

    move-result v4

    const/16 v5, 0x80

    and-int/2addr v4, v5

    if-eq v4, v5, :cond_0

    .line 288
    invoke-virtual {v3}, Landroid/preference/EditTextPreference;->getText()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/preference/EditTextPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 290
    :cond_0
    invoke-virtual {v3}, Landroid/preference/EditTextPreference;->getText()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_1

    .line 291
    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v6, 0x1

    new-array v7, v6, [Ljava/lang/Object;

    .line 292
    invoke-virtual {v3}, Landroid/preference/EditTextPreference;->getText()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v1

    const-string v8, "%%0%dd"

    invoke-static {v5, v8, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v1

    .line 291
    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "0"

    const-string v6, "*"

    .line 293
    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    .line 291
    invoke-virtual {v3, v4}, Landroid/preference/EditTextPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_1

    :cond_1
    const-string v4, ""

    .line 295
    invoke-virtual {v3, v4}, Landroid/preference/EditTextPreference;->setSummary(Ljava/lang/CharSequence;)V

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method private resetTextN(Landroid/preference/EditTextPreference;Ljava/lang/Object;)V
    .locals 5

    .line 301
    invoke-virtual {p1}, Landroid/preference/EditTextPreference;->getEditText()Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/EditText;->getInputType()I

    move-result v0

    const/16 v1, 0x80

    and-int/2addr v0, v1

    if-eq v0, v1, :cond_0

    .line 302
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/preference/EditTextPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 304
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    .line 305
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1

    .line 306
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    .line 307
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const/4 v4, 0x0

    aput-object p2, v3, v4

    const-string p2, "%%0%dd"

    invoke-static {v1, p2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    .line 306
    invoke-static {v0, p2, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    const-string v0, "0"

    const-string v1, "*"

    .line 308
    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p2

    .line 306
    invoke-virtual {p1, p2}, Landroid/preference/EditTextPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_1
    const-string p2, ""

    .line 310
    invoke-virtual {p1, p2}, Landroid/preference/EditTextPreference;->setSummary(Ljava/lang/CharSequence;)V

    :goto_0
    return-void
.end method

.method private startVpn()V
    .locals 3

    const/4 v0, 0x1

    .line 403
    iput-boolean v0, p0, Lnet/typeblog/socks/ProfileFragment;->mStarting:Z

    .line 404
    invoke-virtual {p0}, Lnet/typeblog/socks/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Landroid/net/VpnService;->prepare(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 407
    invoke-virtual {p0, v0, v1}, Lnet/typeblog/socks/ProfileFragment;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    const/4 v2, 0x0

    .line 409
    invoke-virtual {p0, v1, v0, v2}, Lnet/typeblog/socks/ProfileFragment;->onActivityResult(IILandroid/content/Intent;)V

    :goto_0
    return-void
.end method

.method private stopVpn()V
    .locals 2

    .line 414
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mBinder:Lnet/typeblog/socks/IVpnService;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v1, 0x1

    .line 417
    iput-boolean v1, p0, Lnet/typeblog/socks/ProfileFragment;->mStopping:Z

    .line 420
    :try_start_0
    invoke-interface {v0}, Lnet/typeblog/socks/IVpnService;->stop()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 422
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    const/4 v0, 0x0

    .line 425
    iput-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mBinder:Lnet/typeblog/socks/IVpnService;

    .line 427
    invoke-virtual {p0}, Lnet/typeblog/socks/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lnet/typeblog/socks/ProfileFragment;->mConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->unbindService(Landroid/content/ServiceConnection;)V

    .line 428
    invoke-direct {p0}, Lnet/typeblog/socks/ProfileFragment;->checkState()V

    return-void
.end method

.method private updateState()V
    .locals 3

    .line 375
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mBinder:Lnet/typeblog/socks/IVpnService;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 376
    iput-boolean v1, p0, Lnet/typeblog/socks/ProfileFragment;->mRunning:Z

    goto :goto_0

    .line 379
    :cond_0
    :try_start_0
    invoke-interface {v0}, Lnet/typeblog/socks/IVpnService;->isRunning()Z

    move-result v0

    iput-boolean v0, p0, Lnet/typeblog/socks/ProfileFragment;->mRunning:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 381
    :catch_0
    iput-boolean v1, p0, Lnet/typeblog/socks/ProfileFragment;->mRunning:Z

    .line 385
    :goto_0
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mSwitch:Landroid/widget/Switch;

    iget-boolean v2, p0, Lnet/typeblog/socks/ProfileFragment;->mRunning:Z

    invoke-virtual {v0, v2}, Landroid/widget/Switch;->setChecked(Z)V

    .line 387
    iget-boolean v0, p0, Lnet/typeblog/socks/ProfileFragment;->mStarting:Z

    if-nez v0, :cond_1

    iget-boolean v2, p0, Lnet/typeblog/socks/ProfileFragment;->mStopping:Z

    if-eqz v2, :cond_3

    :cond_1
    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lnet/typeblog/socks/ProfileFragment;->mRunning:Z

    if-nez v0, :cond_3

    :cond_2
    iget-boolean v0, p0, Lnet/typeblog/socks/ProfileFragment;->mStopping:Z

    if-eqz v0, :cond_4

    iget-boolean v0, p0, Lnet/typeblog/socks/ProfileFragment;->mRunning:Z

    if-nez v0, :cond_4

    .line 388
    :cond_3
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mSwitch:Landroid/widget/Switch;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/widget/Switch;->setEnabled(Z)V

    .line 391
    :cond_4
    iget-boolean v0, p0, Lnet/typeblog/socks/ProfileFragment;->mStarting:Z

    if-eqz v0, :cond_5

    iget-boolean v0, p0, Lnet/typeblog/socks/ProfileFragment;->mRunning:Z

    if-eqz v0, :cond_5

    .line 392
    iput-boolean v1, p0, Lnet/typeblog/socks/ProfileFragment;->mStarting:Z

    .line 395
    :cond_5
    iget-boolean v0, p0, Lnet/typeblog/socks/ProfileFragment;->mStopping:Z

    if-eqz v0, :cond_6

    iget-boolean v0, p0, Lnet/typeblog/socks/ProfileFragment;->mRunning:Z

    if-nez v0, :cond_6

    .line 396
    iput-boolean v1, p0, Lnet/typeblog/socks/ProfileFragment;->mStopping:Z

    .line 399
    :cond_6
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mSwitch:Landroid/widget/Switch;

    invoke-virtual {v0, p0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    return-void
.end method


# virtual methods
.method public synthetic lambda$addProfile$0$net-typeblog-socks-ProfileFragment(Landroid/widget/EditText;Landroid/content/DialogInterface;I)V
    .locals 2

    .line 322
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 324
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_0

    .line 325
    iget-object p2, p0, Lnet/typeblog/socks/ProfileFragment;->mManager:Lnet/typeblog/socks/util/ProfileManager;

    invoke-virtual {p2, p1}, Lnet/typeblog/socks/util/ProfileManager;->addProfile(Ljava/lang/String;)Lnet/typeblog/socks/util/Profile;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 328
    iput-object p2, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    .line 329
    invoke-direct {p0}, Lnet/typeblog/socks/ProfileFragment;->reload()V

    return-void

    .line 334
    :cond_0
    invoke-virtual {p0}, Lnet/typeblog/socks/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    const p3, 0x7f080013

    .line 335
    invoke-virtual {p0, p3}, Lnet/typeblog/socks/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object p3

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {p3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 334
    invoke-static {p2, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    .line 336
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method public synthetic lambda$removeProfile$2$net-typeblog-socks-ProfileFragment(Landroid/content/DialogInterface;I)V
    .locals 3

    .line 349
    iget-object p1, p0, Lnet/typeblog/socks/ProfileFragment;->mManager:Lnet/typeblog/socks/util/ProfileManager;

    iget-object p2, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    invoke-virtual {p2}, Lnet/typeblog/socks/util/Profile;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lnet/typeblog/socks/util/ProfileManager;->removeProfile(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 350
    invoke-virtual {p0}, Lnet/typeblog/socks/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const p2, 0x7f080014

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    iget-object v1, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    .line 351
    invoke-virtual {v1}, Lnet/typeblog/socks/util/Profile;->getName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    invoke-virtual {p0, p2, v0}, Lnet/typeblog/socks/ProfileFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 350
    invoke-static {p1, p2, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    .line 352
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 354
    :cond_0
    iget-object p1, p0, Lnet/typeblog/socks/ProfileFragment;->mManager:Lnet/typeblog/socks/util/ProfileManager;

    invoke-virtual {p1}, Lnet/typeblog/socks/util/ProfileManager;->getDefault()Lnet/typeblog/socks/util/Profile;

    move-result-object p1

    iput-object p1, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    .line 355
    invoke-direct {p0}, Lnet/typeblog/socks/ProfileFragment;->reload()V

    :goto_0
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    .line 202
    invoke-super {p0, p1, p2, p3}, Landroid/preference/PreferenceFragment;->onActivityResult(IILandroid/content/Intent;)V

    const/4 p1, -0x1

    if-ne p2, p1, :cond_0

    .line 205
    invoke-virtual {p0}, Lnet/typeblog/socks/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    iget-object p2, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    invoke-static {p1, p2}, Lnet/typeblog/socks/util/Utility;->startVpn(Landroid/content/Context;Lnet/typeblog/socks/util/Profile;)V

    .line 206
    invoke-direct {p0}, Lnet/typeblog/socks/ProfileFragment;->checkState()V

    :cond_0
    return-void
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 0

    if-eqz p2, :cond_0

    .line 194
    invoke-direct {p0}, Lnet/typeblog/socks/ProfileFragment;->startVpn()V

    goto :goto_0

    .line 196
    :cond_0
    invoke-direct {p0}, Lnet/typeblog/socks/ProfileFragment;->stopVpn()V

    :goto_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 79
    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0a0002

    .line 80
    invoke-virtual {p0, p1}, Lnet/typeblog/socks/ProfileFragment;->addPreferencesFromResource(I)V

    const/4 p1, 0x1

    .line 81
    invoke-virtual {p0, p1}, Lnet/typeblog/socks/ProfileFragment;->setHasOptionsMenu(Z)V

    .line 82
    new-instance p1, Lnet/typeblog/socks/util/ProfileManager;

    invoke-virtual {p0}, Lnet/typeblog/socks/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Lnet/typeblog/socks/util/ProfileManager;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lnet/typeblog/socks/ProfileFragment;->mManager:Lnet/typeblog/socks/util/ProfileManager;

    .line 83
    invoke-direct {p0}, Lnet/typeblog/socks/ProfileFragment;->initPreferences()V

    .line 84
    invoke-direct {p0}, Lnet/typeblog/socks/ProfileFragment;->reload()V

    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 2

    .line 89
    invoke-super {p0, p1, p2}, Landroid/preference/PreferenceFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    const/high16 v0, 0x7f060000

    .line 90
    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    const p2, 0x7f040003

    .line 92
    invoke-interface {p1, p2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    .line 93
    invoke-interface {p1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object p1

    const p2, 0x7f040002

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Switch;

    iput-object p1, p0, Lnet/typeblog/socks/ProfileFragment;->mSwitch:Landroid/widget/Switch;

    .line 94
    invoke-virtual {p1, p0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 95
    iget-object p1, p0, Lnet/typeblog/socks/ProfileFragment;->mSwitch:Landroid/widget/Switch;

    iget-object p2, p0, Lnet/typeblog/socks/ProfileFragment;->mStateRunnable:Ljava/lang/Runnable;

    const-wide/16 v0, 0x3e8

    invoke-virtual {p1, p2, v0, v1}, Landroid/widget/Switch;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 96
    invoke-direct {p0}, Lnet/typeblog/socks/ProfileFragment;->checkState()V

    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3

    .line 101
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/4 v1, 0x1

    const/high16 v2, 0x7f040000

    if-ne v0, v2, :cond_0

    .line 103
    invoke-direct {p0}, Lnet/typeblog/socks/ProfileFragment;->addProfile()V

    return v1

    :cond_0
    const v2, 0x7f040001

    if-ne v0, v2, :cond_1

    .line 106
    invoke-direct {p0}, Lnet/typeblog/socks/ProfileFragment;->removeProfile()V

    return v1

    .line 109
    :cond_1
    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 3

    .line 121
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefProfile:Landroid/preference/ListPreference;

    const/4 v1, 0x1

    if-ne p1, v0, :cond_0

    .line 122
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 123
    iget-object p2, p0, Lnet/typeblog/socks/ProfileFragment;->mManager:Lnet/typeblog/socks/util/ProfileManager;

    invoke-virtual {p2, p1}, Lnet/typeblog/socks/util/ProfileManager;->getProfile(Ljava/lang/String;)Lnet/typeblog/socks/util/Profile;

    move-result-object p2

    iput-object p2, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    .line 124
    iget-object p2, p0, Lnet/typeblog/socks/ProfileFragment;->mManager:Lnet/typeblog/socks/util/ProfileManager;

    invoke-virtual {p2, p1}, Lnet/typeblog/socks/util/ProfileManager;->switchDefault(Ljava/lang/String;)V

    .line 125
    invoke-direct {p0}, Lnet/typeblog/socks/ProfileFragment;->reload()V

    return v1

    .line 127
    :cond_0
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefServer:Landroid/preference/EditTextPreference;

    if-ne p1, v0, :cond_1

    .line 128
    iget-object p1, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lnet/typeblog/socks/util/Profile;->setServer(Ljava/lang/String;)V

    .line 129
    iget-object p1, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefServer:Landroid/preference/EditTextPreference;

    invoke-direct {p0, p1, p2}, Lnet/typeblog/socks/ProfileFragment;->resetTextN(Landroid/preference/EditTextPreference;Ljava/lang/Object;)V

    return v1

    .line 131
    :cond_1
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefPort:Landroid/preference/EditTextPreference;

    const/4 v2, 0x0

    if-ne p1, v0, :cond_3

    .line 132
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_2

    return v2

    .line 135
    :cond_2
    iget-object p1, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p1, v0}, Lnet/typeblog/socks/util/Profile;->setPort(I)V

    .line 136
    iget-object p1, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefPort:Landroid/preference/EditTextPreference;

    invoke-direct {p0, p1, p2}, Lnet/typeblog/socks/ProfileFragment;->resetTextN(Landroid/preference/EditTextPreference;Ljava/lang/Object;)V

    return v1

    .line 138
    :cond_3
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefUserpw:Landroid/preference/CheckBoxPreference;

    if-ne p1, v0, :cond_4

    .line 139
    iget-object p1, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result p2

    invoke-virtual {p1, p2}, Lnet/typeblog/socks/util/Profile;->setIsUserpw(Z)V

    return v1

    .line 141
    :cond_4
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefUsername:Landroid/preference/EditTextPreference;

    if-ne p1, v0, :cond_5

    .line 142
    iget-object p1, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lnet/typeblog/socks/util/Profile;->setUsername(Ljava/lang/String;)V

    .line 143
    iget-object p1, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefUsername:Landroid/preference/EditTextPreference;

    invoke-direct {p0, p1, p2}, Lnet/typeblog/socks/ProfileFragment;->resetTextN(Landroid/preference/EditTextPreference;Ljava/lang/Object;)V

    return v1

    .line 145
    :cond_5
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefPassword:Landroid/preference/EditTextPreference;

    if-ne p1, v0, :cond_6

    .line 146
    iget-object p1, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lnet/typeblog/socks/util/Profile;->setPassword(Ljava/lang/String;)V

    .line 147
    iget-object p1, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefPassword:Landroid/preference/EditTextPreference;

    invoke-direct {p0, p1, p2}, Lnet/typeblog/socks/ProfileFragment;->resetTextN(Landroid/preference/EditTextPreference;Ljava/lang/Object;)V

    return v1

    .line 149
    :cond_6
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefRoutes:Landroid/preference/ListPreference;

    if-ne p1, v0, :cond_7

    .line 150
    iget-object p1, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lnet/typeblog/socks/util/Profile;->setRoute(Ljava/lang/String;)V

    .line 151
    iget-object p1, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefRoutes:Landroid/preference/ListPreference;

    invoke-direct {p0, p1, p2}, Lnet/typeblog/socks/ProfileFragment;->resetListN(Landroid/preference/ListPreference;Ljava/lang/Object;)V

    return v1

    .line 153
    :cond_7
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefDns:Landroid/preference/EditTextPreference;

    if-ne p1, v0, :cond_8

    .line 154
    iget-object p1, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lnet/typeblog/socks/util/Profile;->setDns(Ljava/lang/String;)V

    .line 155
    iget-object p1, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefDns:Landroid/preference/EditTextPreference;

    invoke-direct {p0, p1, p2}, Lnet/typeblog/socks/ProfileFragment;->resetTextN(Landroid/preference/EditTextPreference;Ljava/lang/Object;)V

    return v1

    .line 157
    :cond_8
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefDnsPort:Landroid/preference/EditTextPreference;

    if-ne p1, v0, :cond_a

    .line 158
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_9

    return v2

    .line 161
    :cond_9
    iget-object p1, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p1, v0}, Lnet/typeblog/socks/util/Profile;->setDnsPort(I)V

    .line 162
    iget-object p1, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefDnsPort:Landroid/preference/EditTextPreference;

    invoke-direct {p0, p1, p2}, Lnet/typeblog/socks/ProfileFragment;->resetTextN(Landroid/preference/EditTextPreference;Ljava/lang/Object;)V

    return v1

    .line 164
    :cond_a
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefPerApp:Landroid/preference/CheckBoxPreference;

    if-ne p1, v0, :cond_b

    .line 165
    iget-object p1, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result p2

    invoke-virtual {p1, p2}, Lnet/typeblog/socks/util/Profile;->setIsPerApp(Z)V

    return v1

    .line 167
    :cond_b
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefAppBypass:Landroid/preference/CheckBoxPreference;

    if-ne p1, v0, :cond_c

    .line 168
    iget-object p1, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result p2

    invoke-virtual {p1, p2}, Lnet/typeblog/socks/util/Profile;->setIsBypassApp(Z)V

    return v1

    .line 170
    :cond_c
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefAppList:Landroid/preference/EditTextPreference;

    if-ne p1, v0, :cond_d

    .line 171
    iget-object p1, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lnet/typeblog/socks/util/Profile;->setAppList(Ljava/lang/String;)V

    return v1

    .line 173
    :cond_d
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefIPv6:Landroid/preference/CheckBoxPreference;

    if-ne p1, v0, :cond_e

    .line 174
    iget-object p1, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result p2

    invoke-virtual {p1, p2}, Lnet/typeblog/socks/util/Profile;->setHasIPv6(Z)V

    return v1

    .line 176
    :cond_e
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefUDP:Landroid/preference/CheckBoxPreference;

    if-ne p1, v0, :cond_f

    .line 177
    iget-object p1, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result p2

    invoke-virtual {p1, p2}, Lnet/typeblog/socks/util/Profile;->setHasUDP(Z)V

    return v1

    .line 179
    :cond_f
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefUDPGW:Landroid/preference/EditTextPreference;

    if-ne p1, v0, :cond_10

    .line 180
    iget-object p1, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lnet/typeblog/socks/util/Profile;->setUDPGW(Ljava/lang/String;)V

    .line 181
    iget-object p1, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefUDPGW:Landroid/preference/EditTextPreference;

    invoke-direct {p0, p1, p2}, Lnet/typeblog/socks/ProfileFragment;->resetTextN(Landroid/preference/EditTextPreference;Ljava/lang/Object;)V

    return v1

    .line 183
    :cond_10
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment;->mPrefAuto:Landroid/preference/CheckBoxPreference;

    if-ne p1, v0, :cond_11

    .line 184
    iget-object p1, p0, Lnet/typeblog/socks/ProfileFragment;->mProfile:Lnet/typeblog/socks/util/Profile;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result p2

    invoke-virtual {p1, p2}, Lnet/typeblog/socks/util/Profile;->setAutoConnect(Z)V

    return v1

    :cond_11
    return v2
.end method

.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method
