.class public final Lcom/innioasis/ipp/Anim;
.super Ljava/lang/Object;
.source "Anim.java"

.field public final static BUILT:Z = true

.field public final static KEY:Ljava/lang/String; = "animations"

.field public final static KEY_NAV:Ljava/lang/String; = "anim_nav"

.field public final static KEY_SCROLL:Ljava/lang/String; = "anim_scroll"

.field public final static NAV_BUILT:Z = false

.method private constructor <init>()V
  .registers 1
  .line 14
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static nav()Z
  .registers 1
  .line 38
    const/4 v0, 0
    return v0
.end method

.method public static on()Z
  .registers 2
  .line 32
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 33
    const-string v1, "animations"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L0
    const-string v1, "anim_scroll"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    return v0
.end method
