.class public Lnet/typeblog/socks/util/Profile;
.super Ljava/lang/Object;
.source "Profile.java"


# instance fields
.field private final mName:Ljava/lang/String;

.field private final mPref:Landroid/content/SharedPreferences;

.field private final mPrefix:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lnet/typeblog/socks/util/Profile;->mPref:Landroid/content/SharedPreferences;

    .line 14
    iput-object p2, p0, Lnet/typeblog/socks/util/Profile;->mName:Ljava/lang/String;

    .line 15
    invoke-static {p2}, Lnet/typeblog/socks/util/Profile;->prefPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lnet/typeblog/socks/util/Profile;->mPrefix:Ljava/lang/String;

    return-void
.end method

.method private key(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 163
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lnet/typeblog/socks/util/Profile;->mPrefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private static prefPrefix(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const-string v0, "_"

    const-string v1, "__"

    .line 167
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v1, " "

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public autoConnect()Z
    .locals 3

    .line 135
    iget-object v0, p0, Lnet/typeblog/socks/util/Profile;->mPref:Landroid/content/SharedPreferences;

    const-string v1, "auto"

    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method delete()V
    .locals 2

    .line 143
    iget-object v0, p0, Lnet/typeblog/socks/util/Profile;->mPref:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "server"

    .line 144
    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "port"

    .line 145
    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "userpw"

    .line 146
    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "username"

    .line 147
    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "password"

    .line 148
    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "route"

    .line 149
    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "dns"

    .line 150
    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "dns_port"

    .line 151
    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "perapp"

    .line 152
    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "appbypass"

    .line 153
    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "applist"

    .line 154
    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "ipv6"

    .line 155
    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "udp"

    .line 156
    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "udpgw"

    .line 157
    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "auto"

    .line 158
    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 159
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public getAppList()Ljava/lang/String;
    .locals 3

    .line 103
    iget-object v0, p0, Lnet/typeblog/socks/util/Profile;->mPref:Landroid/content/SharedPreferences;

    const-string v1, "applist"

    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDns()Ljava/lang/String;
    .locals 3

    .line 71
    iget-object v0, p0, Lnet/typeblog/socks/util/Profile;->mPref:Landroid/content/SharedPreferences;

    const-string v1, "dns"

    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "8.8.8.8"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDnsPort()I
    .locals 3

    .line 79
    iget-object v0, p0, Lnet/typeblog/socks/util/Profile;->mPref:Landroid/content/SharedPreferences;

    const-string v1, "dns_port"

    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x35

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 19
    iget-object v0, p0, Lnet/typeblog/socks/util/Profile;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getPassword()Ljava/lang/String;
    .locals 3

    .line 55
    iget-object v0, p0, Lnet/typeblog/socks/util/Profile;->mPref:Landroid/content/SharedPreferences;

    const-string v1, "password"

    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPort()I
    .locals 3

    .line 31
    iget-object v0, p0, Lnet/typeblog/socks/util/Profile;->mPref:Landroid/content/SharedPreferences;

    const-string v1, "port"

    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x438

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public getRoute()Ljava/lang/String;
    .locals 3

    .line 63
    iget-object v0, p0, Lnet/typeblog/socks/util/Profile;->mPref:Landroid/content/SharedPreferences;

    const-string v1, "route"

    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "all"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getServer()Ljava/lang/String;
    .locals 3

    .line 23
    iget-object v0, p0, Lnet/typeblog/socks/util/Profile;->mPref:Landroid/content/SharedPreferences;

    const-string v1, "server"

    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "127.0.0.1"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUDPGW()Ljava/lang/String;
    .locals 3

    .line 127
    iget-object v0, p0, Lnet/typeblog/socks/util/Profile;->mPref:Landroid/content/SharedPreferences;

    const-string v1, "udpgw"

    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "127.0.0.1:7300"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUsername()Ljava/lang/String;
    .locals 3

    .line 47
    iget-object v0, p0, Lnet/typeblog/socks/util/Profile;->mPref:Landroid/content/SharedPreferences;

    const-string v1, "username"

    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hasIPv6()Z
    .locals 3

    .line 111
    iget-object v0, p0, Lnet/typeblog/socks/util/Profile;->mPref:Landroid/content/SharedPreferences;

    const-string v1, "ipv6"

    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public hasUDP()Z
    .locals 3

    .line 119
    iget-object v0, p0, Lnet/typeblog/socks/util/Profile;->mPref:Landroid/content/SharedPreferences;

    const-string v1, "udp"

    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public isBypassApp()Z
    .locals 3

    .line 95
    iget-object v0, p0, Lnet/typeblog/socks/util/Profile;->mPref:Landroid/content/SharedPreferences;

    const-string v1, "appbypass"

    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public isPerApp()Z
    .locals 3

    .line 87
    iget-object v0, p0, Lnet/typeblog/socks/util/Profile;->mPref:Landroid/content/SharedPreferences;

    const-string v1, "perapp"

    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public isUserPw()Z
    .locals 3

    .line 39
    iget-object v0, p0, Lnet/typeblog/socks/util/Profile;->mPref:Landroid/content/SharedPreferences;

    const-string v1, "userpw"

    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public setAppList(Ljava/lang/String;)V
    .locals 2

    .line 107
    iget-object v0, p0, Lnet/typeblog/socks/util/Profile;->mPref:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "applist"

    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public setAutoConnect(Z)V
    .locals 2

    .line 139
    iget-object v0, p0, Lnet/typeblog/socks/util/Profile;->mPref:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "auto"

    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public setDns(Ljava/lang/String;)V
    .locals 2

    .line 75
    iget-object v0, p0, Lnet/typeblog/socks/util/Profile;->mPref:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "dns"

    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public setDnsPort(I)V
    .locals 2

    .line 83
    iget-object v0, p0, Lnet/typeblog/socks/util/Profile;->mPref:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "dns_port"

    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public setHasIPv6(Z)V
    .locals 2

    .line 115
    iget-object v0, p0, Lnet/typeblog/socks/util/Profile;->mPref:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "ipv6"

    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public setHasUDP(Z)V
    .locals 2

    .line 123
    iget-object v0, p0, Lnet/typeblog/socks/util/Profile;->mPref:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "udp"

    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public setIsBypassApp(Z)V
    .locals 2

    .line 99
    iget-object v0, p0, Lnet/typeblog/socks/util/Profile;->mPref:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "appbypass"

    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public setIsPerApp(Z)V
    .locals 2

    .line 91
    iget-object v0, p0, Lnet/typeblog/socks/util/Profile;->mPref:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "perapp"

    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public setIsUserpw(Z)V
    .locals 2

    .line 43
    iget-object v0, p0, Lnet/typeblog/socks/util/Profile;->mPref:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "userpw"

    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public setPassword(Ljava/lang/String;)V
    .locals 2

    .line 59
    iget-object v0, p0, Lnet/typeblog/socks/util/Profile;->mPref:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "password"

    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public setPort(I)V
    .locals 2

    .line 35
    iget-object v0, p0, Lnet/typeblog/socks/util/Profile;->mPref:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "port"

    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public setRoute(Ljava/lang/String;)V
    .locals 2

    .line 67
    iget-object v0, p0, Lnet/typeblog/socks/util/Profile;->mPref:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "route"

    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public setServer(Ljava/lang/String;)V
    .locals 2

    .line 27
    iget-object v0, p0, Lnet/typeblog/socks/util/Profile;->mPref:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "server"

    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public setUDPGW(Ljava/lang/String;)V
    .locals 2

    .line 131
    iget-object v0, p0, Lnet/typeblog/socks/util/Profile;->mPref:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "udpgw"

    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public setUsername(Ljava/lang/String;)V
    .locals 2

    .line 51
    iget-object v0, p0, Lnet/typeblog/socks/util/Profile;->mPref:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "username"

    invoke-direct {p0, v1}, Lnet/typeblog/socks/util/Profile;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method
