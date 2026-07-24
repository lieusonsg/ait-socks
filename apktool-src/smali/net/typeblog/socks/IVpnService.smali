.class public interface abstract Lnet/typeblog/socks/IVpnService;
.super Ljava/lang/Object;
.source "IVpnService.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnet/typeblog/socks/IVpnService$Stub;,
        Lnet/typeblog/socks/IVpnService$Default;
    }
.end annotation


# virtual methods
.method public abstract isRunning()Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public abstract stop()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method
