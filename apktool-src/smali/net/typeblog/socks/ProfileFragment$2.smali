.class Lnet/typeblog/socks/ProfileFragment$2;
.super Ljava/lang/Object;
.source "ProfileFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


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

    .line 63
    iput-object p1, p0, Lnet/typeblog/socks/ProfileFragment$2;->this$0:Lnet/typeblog/socks/ProfileFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 66
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment$2;->this$0:Lnet/typeblog/socks/ProfileFragment;

    invoke-static {v0}, Lnet/typeblog/socks/ProfileFragment;->access$200(Lnet/typeblog/socks/ProfileFragment;)V

    .line 67
    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment$2;->this$0:Lnet/typeblog/socks/ProfileFragment;

    invoke-static {v0}, Lnet/typeblog/socks/ProfileFragment;->access$300(Lnet/typeblog/socks/ProfileFragment;)Landroid/widget/Switch;

    move-result-object v0

    const-wide/16 v1, 0x3e8

    invoke-virtual {v0, p0, v1, v2}, Landroid/widget/Switch;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
