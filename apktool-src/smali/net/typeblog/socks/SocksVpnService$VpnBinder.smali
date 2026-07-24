.class Lnet/typeblog/socks/SocksVpnService$VpnBinder;
.super Lnet/typeblog/socks/IVpnService$Stub;
.source "SocksVpnService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/typeblog/socks/SocksVpnService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "VpnBinder"
.end annotation


# instance fields
.field final synthetic this$0:Lnet/typeblog/socks/SocksVpnService;


# direct methods
.method constructor <init>(Lnet/typeblog/socks/SocksVpnService;)V
    .locals 0

    .line 25
    iput-object p1, p0, Lnet/typeblog/socks/SocksVpnService$VpnBinder;->this$0:Lnet/typeblog/socks/SocksVpnService;

    invoke-direct {p0}, Lnet/typeblog/socks/IVpnService$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public isRunning()Z
    .locals 1

    .line 28
    iget-object v0, p0, Lnet/typeblog/socks/SocksVpnService$VpnBinder;->this$0:Lnet/typeblog/socks/SocksVpnService;

    invoke-static {v0}, Lnet/typeblog/socks/SocksVpnService;->access$000(Lnet/typeblog/socks/SocksVpnService;)Z

    move-result v0

    return v0
.end method

.method public stop()V
    .locals 1

    .line 33
    iget-object v0, p0, Lnet/typeblog/socks/SocksVpnService$VpnBinder;->this$0:Lnet/typeblog/socks/SocksVpnService;

    invoke-static {v0}, Lnet/typeblog/socks/SocksVpnService;->access$100(Lnet/typeblog/socks/SocksVpnService;)V

    return-void
.end method
