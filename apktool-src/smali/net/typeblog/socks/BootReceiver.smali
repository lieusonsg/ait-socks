.class public Lnet/typeblog/socks/BootReceiver;
.super Landroid/content/BroadcastReceiver;
.source "BootReceiver.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "BootReceiver"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    .line 19
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    const-string v0, "android.intent.action.BOOT_COMPLETED"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 20
    new-instance p2, Lnet/typeblog/socks/util/ProfileManager;

    invoke-direct {p2, p1}, Lnet/typeblog/socks/util/ProfileManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {p2}, Lnet/typeblog/socks/util/ProfileManager;->getDefault()Lnet/typeblog/socks/util/Profile;

    move-result-object p2

    .line 22
    invoke-virtual {p2}, Lnet/typeblog/socks/util/Profile;->autoConnect()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p1}, Landroid/net/VpnService;->prepare(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    if-nez v0, :cond_0

    .line 28
    invoke-static {p1, p2}, Lnet/typeblog/socks/util/Utility;->startVpn(Landroid/content/Context;Lnet/typeblog/socks/util/Profile;)V

    :cond_0
    return-void
.end method
