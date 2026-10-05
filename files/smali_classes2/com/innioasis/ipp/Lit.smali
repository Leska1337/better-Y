.class public final Lcom/innioasis/ipp/Lit;
.super Ljava/lang/Object;
.source "Lit.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Lit$Watch;
  }
.end annotation

.field private static volatile on:Z

.field private static registered:Z

.method static constructor <clinit>()V
  .registers 1
  .line 20
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Lit;->on:Z
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 17
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$002(Z)Z
  .registers 1
  .line 15
    sput-boolean p0, Lcom/innioasis/ipp/Lit;->on:Z
    return p0
.end method

.method public static screenOn()Z
  .registers 1
  .line 24
    sget-boolean v0, Lcom/innioasis/ipp/Lit;->on:Z
    return v0
.end method

.method public static watch(Landroid/content/Context;)V
  .catchall { :L1 .. :L5 } :L6
  .registers 4
  .line 29
    sget-boolean v0, Lcom/innioasis/ipp/Lit;->registered:Z
    if-nez v0, :L8
    if-nez p0, :L0
    goto :L8
  :L0
  .line 31
    const/4 v0, 1
  :L1
    sput-boolean v0, Lcom/innioasis/ipp/Lit;->registered:Z
  .line 32
    invoke-virtual { p0 }, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
    move-result-object v1
  .line 33
    if-nez v1, :L2
    goto :L3
  :L2
    move-object p0, v1
  :L3
  .line 34
    const-string v1, "power"
    invoke-virtual { p0, v1 }, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroid/os/PowerManager;
  .line 35
    if-eqz v1, :L4
    invoke-virtual { v1 }, Landroid/os/PowerManager;->isScreenOn()Z
    move-result v1
    sput-boolean v1, Lcom/innioasis/ipp/Lit;->on:Z
  :L4
  .line 36
    new-instance v1, Landroid/content/IntentFilter;
    const-string v2, "android.intent.action.SCREEN_ON"
    invoke-direct { v1, v2 }, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V
  .line 37
    const-string v2, "android.intent.action.SCREEN_OFF"
    invoke-virtual { v1, v2 }, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V
  .line 38
    new-instance v2, Lcom/innioasis/ipp/Lit$Watch;
    invoke-direct { v2 }, Lcom/innioasis/ipp/Lit$Watch;-><init>()V
    invoke-virtual { p0, v2, v1 }, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
  :L5
  .line 42
    goto :L7
  :L6
  .line 39
    move-exception p0
  .line 41
    sput-boolean v0, Lcom/innioasis/ipp/Lit;->on:Z
  :L7
  .line 43
    return-void
  :L8
  .line 29
    return-void
.end method
