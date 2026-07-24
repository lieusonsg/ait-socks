.class public final synthetic Lnet/typeblog/socks/ProfileFragment$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Lnet/typeblog/socks/ProfileFragment;

.field public final synthetic f$1:Landroid/widget/EditText;


# direct methods
.method public synthetic constructor <init>(Lnet/typeblog/socks/ProfileFragment;Landroid/widget/EditText;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnet/typeblog/socks/ProfileFragment$$ExternalSyntheticLambda1;->f$0:Lnet/typeblog/socks/ProfileFragment;

    iput-object p2, p0, Lnet/typeblog/socks/ProfileFragment$$ExternalSyntheticLambda1;->f$1:Landroid/widget/EditText;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    iget-object v0, p0, Lnet/typeblog/socks/ProfileFragment$$ExternalSyntheticLambda1;->f$0:Lnet/typeblog/socks/ProfileFragment;

    iget-object v1, p0, Lnet/typeblog/socks/ProfileFragment$$ExternalSyntheticLambda1;->f$1:Landroid/widget/EditText;

    invoke-virtual {v0, v1, p1, p2}, Lnet/typeblog/socks/ProfileFragment;->lambda$addProfile$0$net-typeblog-socks-ProfileFragment(Landroid/widget/EditText;Landroid/content/DialogInterface;I)V

    return-void
.end method
