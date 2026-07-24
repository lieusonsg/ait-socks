.class Lnet/typeblog/socks/System;
.super Ljava/lang/Object;
.source "System.java"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "system"

    .line 6
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native jniclose(I)V
.end method

.method public static native sendfd(ILjava/lang/String;)I
.end method
