.class Lnet/typeblog/socks/MainActivity$2;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


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

    iput-object p1, p0, Lnet/typeblog/socks/MainActivity$2;->this$0:Lnet/typeblog/socks/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lnet/typeblog/socks/MainActivity$2;->this$0:Lnet/typeblog/socks/MainActivity;

    invoke-static {v0}, Lnet/typeblog/socks/MainActivity;->access$200(Lnet/typeblog/socks/MainActivity;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnet/typeblog/socks/MainActivity$2;->this$0:Lnet/typeblog/socks/MainActivity;

    invoke-virtual {v0}, Lnet/typeblog/socks/MainActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lnet/typeblog/socks/MainActivity$2;->this$0:Lnet/typeblog/socks/MainActivity;

    invoke-virtual {v0}, Lnet/typeblog/socks/MainActivity;->finish()V

    :cond_0
    return-void
.end method
