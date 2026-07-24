.class Lnet/typeblog/socks/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnet/typeblog/socks/MainActivity;->stopSocks()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lnet/typeblog/socks/MainActivity;


# direct methods
.method constructor <init>(Lnet/typeblog/socks/MainActivity;)V
    .locals 0

    iput-object p1, p0, Lnet/typeblog/socks/MainActivity$1;->this$0:Lnet/typeblog/socks/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 0

    :try_start_0
    invoke-static {p2}, Lnet/typeblog/socks/IVpnService$Stub;->asInterface(Landroid/os/IBinder;)Lnet/typeblog/socks/IVpnService;

    move-result-object p1

    invoke-interface {p1}, Lnet/typeblog/socks/IVpnService;->stop()V

    iget-object p1, p0, Lnet/typeblog/socks/MainActivity$1;->this$0:Lnet/typeblog/socks/MainActivity;

    const-string p2, "SOCKS OFF"

    invoke-static {p1, p2}, Lnet/typeblog/socks/MainActivity;->access$000(Lnet/typeblog/socks/MainActivity;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    iget-object p1, p0, Lnet/typeblog/socks/MainActivity$1;->this$0:Lnet/typeblog/socks/MainActivity;

    invoke-virtual {p1, p0}, Lnet/typeblog/socks/MainActivity;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    iget-object p1, p0, Lnet/typeblog/socks/MainActivity$1;->this$0:Lnet/typeblog/socks/MainActivity;

    invoke-static {p1}, Lnet/typeblog/socks/MainActivity;->access$100(Lnet/typeblog/socks/MainActivity;)V

    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 0

    return-void
.end method
