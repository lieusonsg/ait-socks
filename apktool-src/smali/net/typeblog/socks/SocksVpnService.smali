.class public Lnet/typeblog/socks/SocksVpnService;
.super Landroid/net/VpnService;
.source "SocksVpnService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnet/typeblog/socks/SocksVpnService$VpnBinder;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "SocksVpnService"


# instance fields
.field private final mBinder:Landroid/os/IBinder;

.field private mInterface:Landroid/os/ParcelFileDescriptor;

.field private mRunning:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 24
    invoke-direct {p0}, Landroid/net/VpnService;-><init>()V

    const/4 v0, 0x0

    .line 40
    iput-boolean v0, p0, Lnet/typeblog/socks/SocksVpnService;->mRunning:Z

    .line 41
    new-instance v0, Lnet/typeblog/socks/SocksVpnService$VpnBinder;

    invoke-direct {v0, p0}, Lnet/typeblog/socks/SocksVpnService$VpnBinder;-><init>(Lnet/typeblog/socks/SocksVpnService;)V

    iput-object v0, p0, Lnet/typeblog/socks/SocksVpnService;->mBinder:Landroid/os/IBinder;

    return-void
.end method

.method static synthetic access$000(Lnet/typeblog/socks/SocksVpnService;)Z
    .locals 0

    .line 24
    iget-boolean p0, p0, Lnet/typeblog/socks/SocksVpnService;->mRunning:Z

    return p0
.end method

.method static synthetic access$100(Lnet/typeblog/socks/SocksVpnService;)V
    .locals 0

    .line 24
    invoke-direct {p0}, Lnet/typeblog/socks/SocksVpnService;->stopMe()V

    return-void
.end method

.method private configure(Ljava/lang/String;Ljava/lang/String;ZZ[Ljava/lang/String;Z)V
    .locals 3

    .line 149
    new-instance v0, Landroid/net/VpnService$Builder;

    invoke-direct {v0, p0}, Landroid/net/VpnService$Builder;-><init>(Landroid/net/VpnService;)V

    const/16 v1, 0x5dc

    .line 150
    invoke-virtual {v0, v1}, Landroid/net/VpnService$Builder;->setMtu(I)Landroid/net/VpnService$Builder;

    move-result-object v1

    .line 151
    invoke-virtual {v1, p1}, Landroid/net/VpnService$Builder;->setSession(Ljava/lang/String;)Landroid/net/VpnService$Builder;

    move-result-object p1

    const-string v1, "26.26.26.1"

    const/16 v2, 0x18

    .line 152
    invoke-virtual {p1, v1, v2}, Landroid/net/VpnService$Builder;->addAddress(Ljava/lang/String;I)Landroid/net/VpnService$Builder;

    move-result-object p1

    const-string v1, "8.8.8.8"

    .line 153
    invoke-virtual {p1, v1}, Landroid/net/VpnService$Builder;->addDnsServer(Ljava/lang/String;)Landroid/net/VpnService$Builder;

    const/4 p1, 0x0

    if-eqz p6, :cond_0

    const/16 p6, 0x7e

    const-string v2, "fdfe:dcba:9876::1"

    .line 157
    invoke-virtual {v0, v2, p6}, Landroid/net/VpnService$Builder;->addAddress(Ljava/lang/String;I)Landroid/net/VpnService$Builder;

    move-result-object p6

    const-string v2, "::"

    .line 158
    invoke-virtual {p6, v2, p1}, Landroid/net/VpnService$Builder;->addRoute(Ljava/lang/String;I)Landroid/net/VpnService$Builder;

    .line 161
    :cond_0
    invoke-static {p0, v0, p2}, Lnet/typeblog/socks/util/Routes;->addRoutes(Landroid/content/Context;Landroid/net/VpnService$Builder;Ljava/lang/String;)V

    const/16 p2, 0x20

    .line 166
    invoke-virtual {v0, v1, p2}, Landroid/net/VpnService$Builder;->addRoute(Ljava/lang/String;I)Landroid/net/VpnService$Builder;

    const-string p2, "com.ait.socks"

    if-nez p3, :cond_1

    .line 172
    :try_start_0
    invoke-virtual {v0, p2}, Landroid/net/VpnService$Builder;->addDisallowedApplication(Ljava/lang/String;)Landroid/net/VpnService$Builder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_5

    :catch_0
    move-exception p1

    .line 174
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_5

    :cond_1
    if-eqz p4, :cond_3

    .line 180
    :try_start_1
    invoke-virtual {v0, p2}, Landroid/net/VpnService$Builder;->addDisallowedApplication(Ljava/lang/String;)Landroid/net/VpnService$Builder;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :catch_1
    move-exception p2

    .line 182
    invoke-virtual {p2}, Ljava/lang/Exception;->printStackTrace()V

    .line 185
    :goto_0
    array-length p2, p5

    :goto_1
    if-ge p1, p2, :cond_6

    aget-object p3, p5, p1

    .line 186
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p4

    if-eqz p4, :cond_2

    goto :goto_2

    .line 190
    :cond_2
    :try_start_2
    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v0, p3}, Landroid/net/VpnService$Builder;->addDisallowedApplication(Ljava/lang/String;)Landroid/net/VpnService$Builder;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catch_2
    move-exception p3

    .line 192
    invoke-virtual {p3}, Ljava/lang/Exception;->printStackTrace()V

    :goto_2
    add-int/lit8 p1, p1, 0x1

    goto :goto_1

    .line 196
    :cond_3
    array-length p3, p5

    :goto_3
    if-ge p1, p3, :cond_6

    aget-object p4, p5, p1

    .line 197
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p6

    if-nez p6, :cond_5

    invoke-virtual {p4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p6

    invoke-virtual {p6, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p6

    if-eqz p6, :cond_4

    goto :goto_4

    .line 202
    :cond_4
    :try_start_3
    invoke-virtual {p4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {v0, p4}, Landroid/net/VpnService$Builder;->addAllowedApplication(Ljava/lang/String;)Landroid/net/VpnService$Builder;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_4

    :catch_3
    move-exception p4

    .line 204
    invoke-virtual {p4}, Ljava/lang/Exception;->printStackTrace()V

    :cond_5
    :goto_4
    add-int/lit8 p1, p1, 0x1

    goto :goto_3

    .line 210
    :cond_6
    :goto_5
    invoke-virtual {v0}, Landroid/net/VpnService$Builder;->establish()Landroid/os/ParcelFileDescriptor;

    move-result-object p1

    iput-object p1, p0, Lnet/typeblog/socks/SocksVpnService;->mInterface:Landroid/os/ParcelFileDescriptor;

    return-void
.end method

.method private start(ILjava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;IZLjava/lang/String;)V
    .locals 4

    .line 215
    invoke-static {p0, p6, p7}, Lnet/typeblog/socks/util/Utility;->makePdnsdConf(Landroid/content/Context;Ljava/lang/String;I)V

    .line 217
    sget-object p6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 p7, 0x2

    new-array v0, p7, [Ljava/lang/Object;

    .line 218
    invoke-virtual {p0}, Lnet/typeblog/socks/SocksVpnService;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    invoke-virtual {p0}, Lnet/typeblog/socks/SocksVpnService;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const/4 v3, 0x1

    aput-object v1, v0, v3

    const-string v1, "%s/libpdnsd.so -c %s/pdnsd.conf"

    .line 217
    invoke-static {p6, v1, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p6

    invoke-static {p6}, Lnet/typeblog/socks/util/Utility;->exec(Ljava/lang/String;)I

    .line 220
    sget-object p6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/Object;

    .line 229
    invoke-virtual {p0}, Lnet/typeblog/socks/SocksVpnService;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    aput-object v1, v0, v2

    aput-object p2, v0, v3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, v0, p7

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const/4 p3, 0x3

    aput-object p2, v0, p3

    invoke-virtual {p0}, Lnet/typeblog/socks/SocksVpnService;->getFilesDir()Ljava/io/File;

    move-result-object p2

    const/4 p3, 0x4

    aput-object p2, v0, p3

    invoke-virtual {p0}, Lnet/typeblog/socks/SocksVpnService;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object p2

    iget-object p2, p2, Landroid/content/pm/ApplicationInfo;->dataDir:Ljava/lang/String;

    const/4 p3, 0x5

    aput-object p2, v0, p3

    const-string p2, "%s/libtun2socks.so --netif-ipaddr 26.26.26.2 --netif-netmask 255.255.255.0 --socks-server-addr %s:%d --tunfd %d --tunmtu 1500 --loglevel 3 --pid %s/tun2socks.pid --sock %s/sock_path"

    .line 220
    invoke-static {p6, p2, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    if-eqz p4, :cond_0

    .line 232
    new-instance p6, Ljava/lang/StringBuilder;

    invoke-direct {p6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " --username "

    invoke-virtual {p6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p6, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 233
    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " --password "

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    :cond_0
    if-eqz p8, :cond_1

    .line 237
    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " --netif-ip6addr fdfe:dcba:9876::2"

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 240
    :cond_1
    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " --dnsgw 26.26.26.1:8091"

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    if-eqz p9, :cond_2

    .line 243
    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " --udpgw-remote-server-addr "

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 250
    :cond_2
    invoke-static {p2}, Lnet/typeblog/socks/util/Utility;->exec(Ljava/lang/String;)I

    move-result p2

    if-eqz p2, :cond_3

    .line 251
    invoke-direct {p0}, Lnet/typeblog/socks/SocksVpnService;->stopMe()V

    return-void

    :cond_3
    :goto_0
    if-ge v2, p3, :cond_5

    .line 258
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lnet/typeblog/socks/SocksVpnService;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object p4

    iget-object p4, p4, Landroid/content/pm/ApplicationInfo;->dataDir:Ljava/lang/String;

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, "/sock_path"

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lnet/typeblog/socks/System;->sendfd(ILjava/lang/String;)I

    move-result p2

    const/4 p4, -0x1

    if-eq p2, p4, :cond_4

    .line 259
    iput-boolean v3, p0, Lnet/typeblog/socks/SocksVpnService;->mRunning:Z

    return-void

    :cond_4
    add-int/lit8 v2, v2, 0x1

    const-wide/16 p4, 0x3e8

    int-to-long p6, v2

    mul-long p6, p6, p4

    .line 266
    :try_start_0
    invoke-static {p6, p7}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p2

    .line 268
    invoke-virtual {p2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 273
    :cond_5
    invoke-direct {p0}, Lnet/typeblog/socks/SocksVpnService;->stopMe()V

    return-void
.end method

.method private stopMe()V
    .locals 2

    const/4 v0, 0x1

    .line 133
    invoke-virtual {p0, v0}, Lnet/typeblog/socks/SocksVpnService;->stopForeground(Z)V

    .line 135
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lnet/typeblog/socks/SocksVpnService;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "/tun2socks.pid"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lnet/typeblog/socks/util/Utility;->killPidFile(Ljava/lang/String;)V

    .line 136
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lnet/typeblog/socks/SocksVpnService;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "/pdnsd.pid"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lnet/typeblog/socks/util/Utility;->killPidFile(Ljava/lang/String;)V

    .line 139
    :try_start_0
    iget-object v0, p0, Lnet/typeblog/socks/SocksVpnService;->mInterface:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->getFd()I

    move-result v0

    invoke-static {v0}, Lnet/typeblog/socks/System;->jniclose(I)V

    .line 140
    iget-object v0, p0, Lnet/typeblog/socks/SocksVpnService;->mInterface:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 142
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 145
    :goto_0
    invoke-virtual {p0}, Lnet/typeblog/socks/SocksVpnService;->stopSelf()V

    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0

    .line 122
    iget-object p1, p0, Lnet/typeblog/socks/SocksVpnService;->mBinder:Landroid/os/IBinder;

    return-object p1
.end method

.method public onDestroy()V
    .locals 0

    .line 127
    invoke-super {p0}, Landroid/net/VpnService;->onDestroy()V

    .line 129
    invoke-direct {p0}, Lnet/typeblog/socks/SocksVpnService;->stopMe()V

    return-void
.end method

.method public onRevoke()V
    .locals 0

    .line 116
    invoke-super {p0}, Landroid/net/VpnService;->onRevoke()V

    .line 117
    invoke-direct {p0}, Lnet/typeblog/socks/SocksVpnService;->stopMe()V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 18

    move-object/from16 v10, p0

    move-object/from16 v0, p1

    const/4 v11, 0x1

    if-nez v0, :cond_0

    return v11

    .line 54
    :cond_0
    iget-boolean v1, v10, Lnet/typeblog/socks/SocksVpnService;->mRunning:Z

    if-eqz v1, :cond_1

    return v11

    :cond_1
    const-string v1, "SOCKSNAME"

    .line 58
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "SOCKSSERV"

    .line 59
    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const/16 v2, 0x438

    const-string v3, "SOCKSPORT"

    .line 60
    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v8

    const-string v2, "SOCKSUNAME"

    .line 61
    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v2, "SOCKSPASSWD"

    .line 62
    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const-string v2, "SOCKSROUTE"

    .line 63
    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "SOCKSDNS"

    .line 64
    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    const/16 v3, 0x35

    const-string v4, "SOCKSDNSPORT"

    .line 65
    invoke-virtual {v0, v4, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v14

    const-string v3, "SOCKSPERAPP"

    const/4 v4, 0x0

    .line 66
    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    const-string v5, "SOCKSAPPBYPASS"

    .line 67
    invoke-virtual {v0, v5, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v5

    const-string v6, "SOCKSAPPLIST"

    .line 68
    invoke-virtual {v0, v6}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    const-string v15, "SOCKSIPV6"

    .line 69
    invoke-virtual {v0, v15, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v15

    const-string v11, "SOCKSUDPGW"

    .line 70
    invoke-virtual {v0, v11}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 74
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1a

    if-lt v0, v4, :cond_2

    const-string v0, "com.ait.socks"

    .line 76
    new-instance v4, Landroid/app/NotificationChannel;

    move-object/from16 p1, v11

    const v11, 0x7f080011

    .line 77
    invoke-virtual {v10, v11}, Lnet/typeblog/socks/SocksVpnService;->getString(I)Ljava/lang/String;

    move-result-object v11

    move/from16 v16, v14

    const/4 v14, 0x0

    invoke-direct {v4, v0, v11, v14}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    .line 78
    const-class v11, Landroid/app/NotificationManager;

    invoke-virtual {v10, v11}, Lnet/typeblog/socks/SocksVpnService;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/app/NotificationManager;

    .line 79
    invoke-static {v11}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v14, v11

    check-cast v14, Landroid/app/NotificationManager;

    invoke-virtual {v11, v4}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    .line 80
    new-instance v4, Landroid/app/Notification$Builder;

    invoke-direct {v4, v10, v0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    move-object/from16 p1, v11

    move/from16 v16, v14

    .line 82
    new-instance v4, Landroid/app/Notification$Builder;

    invoke-direct {v4, v10}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    :goto_0
    const/high16 v0, 0x8000000

    .line 88
    sget v11, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v14, 0x17

    if-lt v11, v14, :cond_3

    const/high16 v0, 0xc000000

    .line 92
    :cond_3
    new-instance v11, Landroid/content/Intent;

    const-class v14, Lnet/typeblog/socks/MainActivity;

    invoke-direct {v11, v10, v14}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 v14, 0x0

    invoke-static {v10, v14, v11, v0}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    const v11, 0x7f080018

    .line 95
    invoke-virtual {v10, v11}, Lnet/typeblog/socks/SocksVpnService;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v4, v11}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v4

    const v11, 0x7f080017

    .line 96
    invoke-virtual {v10, v11}, Lnet/typeblog/socks/SocksVpnService;->getString(I)Ljava/lang/String;

    move-result-object v11

    move-object/from16 v17, v12

    move-object/from16 p3, v13

    const/4 v13, 0x1

    new-array v12, v13, [Ljava/lang/Object;

    aput-object v1, v12, v14

    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v4, v11}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v4

    const/4 v11, -0x2

    .line 97
    invoke-virtual {v4, v11}, Landroid/app/Notification$Builder;->setPriority(I)Landroid/app/Notification$Builder;

    move-result-object v4

    const v11, 0x7f030001

    .line 98
    invoke-virtual {v4, v11}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v4

    .line 99
    invoke-virtual {v4, v0}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v0

    .line 100
    invoke-virtual {v0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    .line 94
    invoke-virtual {v10, v13, v0}, Lnet/typeblog/socks/SocksVpnService;->startForeground(ILandroid/app/Notification;)V

    move-object/from16 v0, p0

    move v4, v5

    move-object v5, v6

    move v6, v15

    .line 103
    invoke-direct/range {v0 .. v6}, Lnet/typeblog/socks/SocksVpnService;->configure(Ljava/lang/String;Ljava/lang/String;ZZ[Ljava/lang/String;Z)V

    .line 108
    iget-object v0, v10, Lnet/typeblog/socks/SocksVpnService;->mInterface:Landroid/os/ParcelFileDescriptor;

    if-eqz v0, :cond_4

    .line 109
    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->getFd()I

    move-result v1

    move-object/from16 v0, p0

    move-object v2, v7

    move v3, v8

    move-object v4, v9

    move-object/from16 v5, v17

    move-object/from16 v6, p3

    move/from16 v7, v16

    move v8, v15

    move-object/from16 v9, p1

    invoke-direct/range {v0 .. v9}, Lnet/typeblog/socks/SocksVpnService;->start(ILjava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;IZLjava/lang/String;)V

    :cond_4
    const/4 v0, 0x1

    return v0
.end method
