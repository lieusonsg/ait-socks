.class Lnet/typeblog/socks/ProfileFragment$1;
.super Ljava/lang/Object;
.source "ProfileFragment.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/typeblog/socks/ProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lnet/typeblog/socks/ProfileFragment;


# direct methods
.method constructor <init>(Lnet/typeblog/socks/ProfileFragment;)V
    .locals 0

    .line 42
    iput-object p1, p0, Lnet/typeblog/socks/ProfileFragment$1;->this$0:Lnet/typeblog/socks/ProfileFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 0

    .line 45
    iget-object p1, p0, Lnet/typeblog/socks/ProfileFragment$1;->this$0:Lnet/typeblog/socks/ProfileFragment;

    invoke-static {p2}, Lnet/typeblog/socks/IVpnService$Stub;->asInterface(Landroid/os/IBinder;)Lnet/typeblog/socks/IVpnService;

    move-result-object p2

    invoke-static {p1, p2}, Lnet/typeblog/socks/ProfileFragment;->access$002(Lnet/typeblog/socks/ProfileFragment;Lnet/typeblog/socks/IVpnService;)Lnet/typeblog/socks/IVpnService;

    .line 48
    :try_start_0
    iget-object p1, p0, Lnet/typeblog/socks/ProfileFragment$1;->this$0:Lnet/typeblog/socks/ProfileFragment;

    invoke-static {p1}, Lnet/typeblog/socks/ProfileFragment;->access$000(Lnet/typeblog/socks/ProfileFragment;)Lnet/typeblog/socks/IVpnService;

    move-result-object p2

    invoke-interface {p2}, Lnet/typeblog/socks/IVpnService;->isRunning()Z

    move-result p2

    invoke-static {p1, p2}, Lnet/typeblog/socks/ProfileFragment;->access$102(Lnet/typeblog/socks/ProfileFragment;Z)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 50
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 53
    :goto_0
    iget-object p1, p0, Lnet/typeblog/socks/ProfileFragment$1;->this$0:Lnet/typeblog/socks/ProfileFragment;

    invoke-static {p1}, Lnet/typeblog/socks/ProfileFragment;->access$100(Lnet/typeblog/socks/ProfileFragment;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 54
    iget-object p1, p0, Lnet/typeblog/socks/ProfileFragment$1;->this$0:Lnet/typeblog/socks/ProfileFragment;

    invoke-static {p1}, Lnet/typeblog/socks/ProfileFragment;->access$200(Lnet/typeblog/socks/ProfileFragment;)V

    :cond_0
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 1

    .line 60
    iget-object p1, p0, Lnet/typeblog/socks/ProfileFragment$1;->this$0:Lnet/typeblog/socks/ProfileFragment;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lnet/typeblog/socks/ProfileFragment;->access$002(Lnet/typeblog/socks/ProfileFragment;Lnet/typeblog/socks/IVpnService;)Lnet/typeblog/socks/IVpnService;

    return-void
.end method
