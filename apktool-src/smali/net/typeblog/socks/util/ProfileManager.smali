.class public Lnet/typeblog/socks/util/ProfileManager;
.super Ljava/lang/Object;
.source "ProfileManager.java"


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mPref:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lnet/typeblog/socks/util/ProfileManager;->mContext:Landroid/content/Context;

    const-string v0, "profile"

    const/4 v1, 0x0

    .line 20
    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Lnet/typeblog/socks/util/ProfileManager;->mPref:Landroid/content/SharedPreferences;

    return-void
.end method

.method private getProfileList()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 24
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 25
    iget-object v1, p0, Lnet/typeblog/socks/util/ProfileManager;->mContext:Landroid/content/Context;

    const v2, 0x7f08001b

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    iget-object v1, p0, Lnet/typeblog/socks/util/ProfileManager;->mPref:Landroid/content/SharedPreferences;

    const-string v2, "profile"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 29
    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, v1, v3

    .line 30
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 31
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method


# virtual methods
.method public addProfile(Ljava/lang/String;)Lnet/typeblog/socks/util/Profile;
    .locals 3

    .line 59
    invoke-direct {p0}, Lnet/typeblog/socks/util/ProfileManager;->getProfileList()Ljava/util/List;

    move-result-object v0

    .line 60
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 63
    :cond_0
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const/4 v1, 0x0

    .line 64
    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 65
    iget-object v1, p0, Lnet/typeblog/socks/util/ProfileManager;->mPref:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "\n"

    invoke-static {v0, v2}, Lnet/typeblog/socks/util/Utility;->join(Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "profile"

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "last_profile"

    .line 66
    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 67
    invoke-virtual {p0}, Lnet/typeblog/socks/util/ProfileManager;->getDefault()Lnet/typeblog/socks/util/Profile;

    move-result-object p1

    return-object p1
.end method

.method public getDefault()Lnet/typeblog/socks/util/Profile;
    .locals 4

    .line 50
    new-instance v0, Lnet/typeblog/socks/util/Profile;

    iget-object v1, p0, Lnet/typeblog/socks/util/ProfileManager;->mPref:Landroid/content/SharedPreferences;

    invoke-direct {p0}, Lnet/typeblog/socks/util/ProfileManager;->getProfileList()Ljava/util/List;

    move-result-object v2

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "last_profile"

    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lnet/typeblog/socks/util/Profile;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    return-object v0
.end method

.method public getProfile(Ljava/lang/String;)Lnet/typeblog/socks/util/Profile;
    .locals 2

    .line 42
    invoke-direct {p0}, Lnet/typeblog/socks/util/ProfileManager;->getProfileList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 45
    :cond_0
    new-instance v0, Lnet/typeblog/socks/util/Profile;

    iget-object v1, p0, Lnet/typeblog/socks/util/ProfileManager;->mPref:Landroid/content/SharedPreferences;

    invoke-direct {v0, v1, p1}, Lnet/typeblog/socks/util/Profile;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    return-object v0
.end method

.method public getProfiles()[Ljava/lang/String;
    .locals 2

    .line 38
    invoke-direct {p0}, Lnet/typeblog/socks/util/ProfileManager;->getProfileList()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    return-object v0
.end method

.method public removeProfile(Ljava/lang/String;)Z
    .locals 4

    .line 72
    invoke-direct {p0}, Lnet/typeblog/socks/util/ProfileManager;->getProfileList()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    .line 73
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    .line 77
    :cond_0
    new-instance v2, Lnet/typeblog/socks/util/Profile;

    iget-object v3, p0, Lnet/typeblog/socks/util/ProfileManager;->mPref:Landroid/content/SharedPreferences;

    invoke-direct {v2, v3, p1}, Lnet/typeblog/socks/util/Profile;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    invoke-virtual {v2}, Lnet/typeblog/socks/util/Profile;->delete()V

    .line 79
    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 80
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 82
    iget-object p1, p0, Lnet/typeblog/socks/util/ProfileManager;->mPref:Landroid/content/SharedPreferences;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v1, "\n"

    invoke-static {v0, v1}, Lnet/typeblog/socks/util/Utility;->join(Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "profile"

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "last_profile"

    .line 83
    invoke-interface {p1, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    const/4 p1, 0x1

    return p1

    :cond_1
    :goto_0
    return v1
.end method

.method public switchDefault(Ljava/lang/String;)V
    .locals 2

    .line 54
    invoke-direct {p0}, Lnet/typeblog/socks/util/ProfileManager;->getProfileList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 55
    iget-object v0, p0, Lnet/typeblog/socks/util/ProfileManager;->mPref:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "last_profile"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_0
    return-void
.end method
