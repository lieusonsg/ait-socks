.class public Lnet/typeblog/socks/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# static fields
.field private static final REQ_VPN:I = 0x3e9

.field private static final TAG:Ljava/lang/String; = "AitSocks"


# instance fields
.field private mFinishAfter:Z

.field private mPass:Ljava/lang/String;

.field private mPendingStart:Z

.field private mPort:I

.field private mServer:Ljava/lang/String;

.field private mUser:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lnet/typeblog/socks/MainActivity;->mFinishAfter:Z

    const/16 v0, 0x438

    iput v0, p0, Lnet/typeblog/socks/MainActivity;->mPort:I

    return-void
.end method

.method private finishIfNeeded()V
    .locals 1

    iget-boolean v0, p0, Lnet/typeblog/socks/MainActivity;->mFinishAfter:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lnet/typeblog/socks/MainActivity;->finish()V

    :cond_0
    return-void
.end method

.method private handleAutomation(Landroid/content/Intent;)Z
    .locals 8

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    const-string v1, "intent_ip"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v2

    const-string v3, "intent_start"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v4

    const-string v5, "SOCKSSERV"

    invoke-virtual {p1, v5}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v6

    if-nez v2, :cond_1

    if-nez v4, :cond_1

    if-nez v6, :cond_1

    return v0

    :cond_1
    const-string v0, "intent_finish"

    const/4 v2, 0x1

    invoke-virtual {p1, v0, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lnet/typeblog/socks/MainActivity;->mFinishAfter:Z

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2

    invoke-virtual {p1, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_2
    invoke-direct {p0, p1}, Lnet/typeblog/socks/MainActivity;->readPort(Landroid/content/Intent;)I

    move-result v1

    const-string v4, "intent_user"

    invoke-virtual {p1, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_3

    const-string v4, "SOCKSUNAME"

    invoke-virtual {p1, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :cond_3
    const-string v5, "intent_passwd"

    invoke-virtual {p1, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_4

    const-string v5, "SOCKSPASSWD"

    invoke-virtual {p1, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    :cond_4
    invoke-virtual {p1, v3, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz v0, :cond_5

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    :cond_5
    iput-object v0, p0, Lnet/typeblog/socks/MainActivity;->mServer:Ljava/lang/String;

    iput v1, p0, Lnet/typeblog/socks/MainActivity;->mPort:I

    iput-object v4, p0, Lnet/typeblog/socks/MainActivity;->mUser:Ljava/lang/String;

    iput-object v5, p0, Lnet/typeblog/socks/MainActivity;->mPass:Ljava/lang/String;

    if-eqz v0, :cond_6

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_6

    invoke-direct {p0, v0, v1, v4, v5}, Lnet/typeblog/socks/MainActivity;->saveProfile(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    :cond_6
    if-nez p1, :cond_7

    invoke-direct {p0}, Lnet/typeblog/socks/MainActivity;->stopSocks()V

    return v2

    :cond_7
    iget-object p1, p0, Lnet/typeblog/socks/MainActivity;->mServer:Ljava/lang/String;

    if-eqz p1, :cond_8

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    if-nez p1, :cond_9

    :cond_8
    invoke-direct {p0}, Lnet/typeblog/socks/MainActivity;->loadServerFromPrefs()V

    :cond_9
    iget-object p1, p0, Lnet/typeblog/socks/MainActivity;->mServer:Ljava/lang/String;

    if-eqz p1, :cond_c

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    if-nez p1, :cond_a

    goto :goto_0

    :cond_a
    iput-boolean v2, p0, Lnet/typeblog/socks/MainActivity;->mPendingStart:Z

    invoke-static {p0}, Landroid/net/VpnService;->prepare(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p1

    if-eqz p1, :cond_b

    const/16 v0, 0x3e9

    invoke-virtual {p0, p1, v0}, Lnet/typeblog/socks/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_1

    :cond_b
    invoke-direct {p0}, Lnet/typeblog/socks/MainActivity;->startSocks()V

    invoke-direct {p0}, Lnet/typeblog/socks/MainActivity;->finishIfNeeded()V

    goto :goto_1

    :cond_c
    :goto_0
    const-string p1, "missing intent_ip"

    invoke-direct {p0, p1}, Lnet/typeblog/socks/MainActivity;->toast(Ljava/lang/String;)V

    invoke-direct {p0}, Lnet/typeblog/socks/MainActivity;->finishIfNeeded()V

    :goto_1
    return v2
.end method

.method private loadServerFromPrefs()V
    .locals 4

    const-string v0, "profile"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lnet/typeblog/socks/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "Defaultserver"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lnet/typeblog/socks/MainActivity;->mServer:Ljava/lang/String;

    const-string v1, "Defaultport"

    const/16 v3, 0x438

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lnet/typeblog/socks/MainActivity;->mPort:I

    const-string v1, "Defaultusername"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lnet/typeblog/socks/MainActivity;->mUser:Ljava/lang/String;

    const-string v1, "Defaultpassword"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lnet/typeblog/socks/MainActivity;->mPass:Ljava/lang/String;

    return-void
.end method

.method private readPort(Landroid/content/Intent;)I
    .locals 3

    const-string v0, "intent_port"

    const/4 v1, -0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    if-lez v2, :cond_0

    return v2

    :cond_0
    const-string v2, "SOCKSPORT"

    invoke-virtual {p1, v2, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    if-lez v1, :cond_1

    return v1

    :cond_1
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_2

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    if-lez p1, :cond_2

    return p1

    :catch_0
    :cond_2
    const/16 p1, 0x438

    return p1
.end method

.method private saveProfile(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 3

    const-string v0, "profile"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lnet/typeblog/socks/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "Defaultserver"

    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string p1, "Defaultport"

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    const-string p1, "last_profile"

    const-string p2, "Default"

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    if-eqz p3, :cond_0

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p1

    if-nez p1, :cond_1

    :cond_0
    if-eqz p4, :cond_2

    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result p1

    if-lez p1, :cond_2

    :cond_1
    const/4 v1, 0x1

    :cond_2
    const-string p1, "Defaultuserpw"

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    if-eqz p3, :cond_3

    const-string p1, "Defaultusername"

    invoke-interface {v0, p1, p3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    :cond_3
    if-eqz p4, :cond_4

    const-string p1, "Defaultpassword"

    invoke-interface {v0, p1, p4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    :cond_4
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method private startSocks()V
    .locals 5

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lnet/typeblog/socks/SocksVpnService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "SOCKSNAME"

    const-string v2, "Default"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "SOCKSSERV"

    iget-object v2, p0, Lnet/typeblog/socks/MainActivity;->mServer:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "SOCKSPORT"

    iget v2, p0, Lnet/typeblog/socks/MainActivity;->mPort:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, "SOCKSROUTE"

    const-string v2, "all"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "SOCKSDNS"

    const-string v2, "8.8.8.8"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "SOCKSDNSPORT"

    const/16 v2, 0x35

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, "SOCKSPERAPP"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v1, "SOCKSIPV6"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-object v1, p0, Lnet/typeblog/socks/MainActivity;->mUser:Ljava/lang/String;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-gtz v1, :cond_1

    :cond_0
    iget-object v1, p0, Lnet/typeblog/socks/MainActivity;->mPass:Ljava/lang/String;

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_2

    :cond_1
    const-string v1, "SOCKSUNAME"

    iget-object v2, p0, Lnet/typeblog/socks/MainActivity;->mUser:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "SOCKSPASSWD"

    iget-object v2, p0, Lnet/typeblog/socks/MainActivity;->mPass:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_2
    :try_start_0
    invoke-virtual {p0, v0}, Lnet/typeblog/socks/MainActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SOCKS ON "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lnet/typeblog/socks/MainActivity;->mServer:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lnet/typeblog/socks/MainActivity;->mPort:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lnet/typeblog/socks/MainActivity;->toast(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "start failed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lnet/typeblog/socks/MainActivity;->toast(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private stopSocks()V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lnet/typeblog/socks/SocksVpnService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    new-instance v1, Lnet/typeblog/socks/MainActivity$1;

    invoke-direct {v1, p0}, Lnet/typeblog/socks/MainActivity$1;-><init>(Lnet/typeblog/socks/MainActivity;)V

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lnet/typeblog/socks/MainActivity;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    new-instance v0, Lnet/typeblog/socks/MainActivity$2;

    invoke-direct {v0, p0}, Lnet/typeblog/socks/MainActivity$2;-><init>(Lnet/typeblog/socks/MainActivity;)V

    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    const-wide/16 v2, 0x5dc

    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private toast(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    :try_start_0
    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method static synthetic access$000(Lnet/typeblog/socks/MainActivity;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lnet/typeblog/socks/MainActivity;->toast(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lnet/typeblog/socks/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Lnet/typeblog/socks/MainActivity;->finishIfNeeded()V

    return-void
.end method

.method static synthetic access$200(Lnet/typeblog/socks/MainActivity;)Z
    .locals 0

    iget-boolean p0, p0, Lnet/typeblog/socks/MainActivity;->mFinishAfter:Z

    return p0
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    const/16 p3, 0x3e9

    if-ne p1, p3, :cond_2

    const/4 p1, -0x1

    if-ne p2, p1, :cond_0

    iget-boolean p1, p0, Lnet/typeblog/socks/MainActivity;->mPendingStart:Z

    if-eqz p1, :cond_1

    invoke-direct {p0}, Lnet/typeblog/socks/MainActivity;->startSocks()V

    goto :goto_0

    :cond_0
    const-string p1, "VPN permission denied"

    invoke-direct {p0, p1}, Lnet/typeblog/socks/MainActivity;->toast(Ljava/lang/String;)V

    :cond_1
    :goto_0
    invoke-direct {p0}, Lnet/typeblog/socks/MainActivity;->finishIfNeeded()V

    :cond_2
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lnet/typeblog/socks/MainActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-direct {p0, p1}, Lnet/typeblog/socks/MainActivity;->handleAutomation(Landroid/content/Intent;)Z

    move-result p1

    if-eqz p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lnet/typeblog/socks/MainActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object p1

    new-instance v0, Lnet/typeblog/socks/ProfileFragment;

    invoke-direct {v0}, Lnet/typeblog/socks/ProfileFragment;-><init>()V

    const v1, 0x1020002

    invoke-virtual {p1, v1, v0}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentTransaction;->commit()I

    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/app/Activity;->onNewIntent(Landroid/content/Intent;)V

    invoke-virtual {p0, p1}, Lnet/typeblog/socks/MainActivity;->setIntent(Landroid/content/Intent;)V

    invoke-direct {p0, p1}, Lnet/typeblog/socks/MainActivity;->handleAutomation(Landroid/content/Intent;)Z

    return-void
.end method
