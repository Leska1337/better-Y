.class public final Lcom/innioasis/ipp/CenterHold;
.super Ljava/lang/Object;
.source "CenterHold.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/CenterHold$Tick;
  }
.end annotation

.field private final static GAP_MS:J = 800L

.field private final static H:Landroid/os/Handler;

.field private final static HOLD_MS:J = 5000L

.field public final static KEY:Ljava/lang/String; = "center_hold"

.field private final static TICK_MS:J = 100L

.field private final static WARN_MS:J = 2000L

.field private static done:Z

.field private static lastSeen:J

.field private static sleepOwed:Z

.field private static startAt:J

.field private static ticker:Lcom/innioasis/ipp/CenterHold$Tick;

.field private static warned:Z

.field private static warnedThisHold:Z

.method static constructor <clinit>()V
  .registers 2
  .line 36
    new-instance v0, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v0, Lcom/innioasis/ipp/CenterHold;->H:Landroid/os/Handler;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 26
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000()Lcom/innioasis/ipp/CenterHold$Tick;
  .registers 1
  .line 24
    sget-object v0, Lcom/innioasis/ipp/CenterHold;->ticker:Lcom/innioasis/ipp/CenterHold$Tick;
    return-object v0
.end method

.method static synthetic access$100()J
  .registers 2
  .line 24
    sget-wide v0, Lcom/innioasis/ipp/CenterHold;->startAt:J
    return-wide v0
.end method

.method static synthetic access$200()J
  .registers 2
  .line 24
    sget-wide v0, Lcom/innioasis/ipp/CenterHold;->lastSeen:J
    return-wide v0
.end method

.method static synthetic access$300()V
  .registers 0
  .line 24
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->reset()V
    return-void
.end method

.method static synthetic access$402(Z)Z
  .registers 1
  .line 24
    sput-boolean p0, Lcom/innioasis/ipp/CenterHold;->sleepOwed:Z
    return p0
.end method

.method static synthetic access$500(Landroid/content/Context;)V
  .registers 1
  .line 24
    invoke-static { p0 }, Lcom/innioasis/ipp/CenterHold;->keepScreenOn(Landroid/content/Context;)V
    return-void
.end method

.method static synthetic access$600()Z
  .registers 1
  .line 24
    sget-boolean v0, Lcom/innioasis/ipp/CenterHold;->warned:Z
    return v0
.end method

.method static synthetic access$602(Z)Z
  .registers 1
  .line 24
    sput-boolean p0, Lcom/innioasis/ipp/CenterHold;->warned:Z
    return p0
.end method

.method static synthetic access$702(Z)Z
  .registers 1
  .line 24
    sput-boolean p0, Lcom/innioasis/ipp/CenterHold;->warnedThisHold:Z
    return p0
.end method

.method static synthetic access$802(Z)Z
  .registers 1
  .line 24
    sput-boolean p0, Lcom/innioasis/ipp/CenterHold;->done:Z
    return p0
.end method

.method static synthetic access$900()Landroid/os/Handler;
  .registers 1
  .line 24
    sget-object v0, Lcom/innioasis/ipp/CenterHold;->H:Landroid/os/Handler;
    return-object v0
.end method

.method private static cancelTicker()V
  .registers 2
  .line 117
    sget-object v0, Lcom/innioasis/ipp/CenterHold;->ticker:Lcom/innioasis/ipp/CenterHold$Tick;
    if-eqz v0, :L0
  .line 118
    sget-object v1, Lcom/innioasis/ipp/CenterHold;->H:Landroid/os/Handler;
    invoke-virtual { v1, v0 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 119
    const/4 v0, 0
    sput-object v0, Lcom/innioasis/ipp/CenterHold;->ticker:Lcom/innioasis/ipp/CenterHold$Tick;
  :L0
  .line 121
    return-void
.end method

.method public static deferSleep()Z
  .catchall { :L0 .. :L3 } :L5
  .registers 6
  .line 53
    const/4 v0, 0
  :L0
    sget-wide v1, Lcom/innioasis/ipp/CenterHold;->startAt:J
    const-wide/16 v3, 0
    cmp-long v5, v1, v3
    if-nez v5, :L1
    return v0
  :L1
  .line 54
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v1
  .line 55
    if-eqz v1, :L4
    const-string v2, "center_hold"
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :L2
    goto :L4
  :L2
  .line 56
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/CenterHold;->sleepOwed:Z
  :L3
  .line 57
    return v1
  :L4
  .line 55
    return v0
  :L5
  .line 58
    move-exception v1
  .line 59
    return v0
.end method

.method private static goToSleep(Landroid/content/Context;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 7
  .line 172
    if-nez p0, :L0
    return-void
  :L0
  .line 173
    const-string v0, "power"
    invoke-virtual { p0, v0 }, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object p0
  .line 174
    if-nez p0, :L1
    return-void
  :L1
  .line 175
    invoke-virtual { p0 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v0
    const-string v1, "goToSleep"
    const/4 v2, 1
    new-array v3, v2, [Ljava/lang/Class;
    sget-object v4, Ljava/lang/Long;->TYPE:Ljava/lang/Class;
    const/4 v5, 0
    aput-object v4, v3, v5
    invoke-virtual { v0, v1, v3 }, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    move-result-object v0
    new-array v1, v2, [Ljava/lang/Object;
  .line 176
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    invoke-static { v2, v3 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v2
    aput-object v2, v1, v5
    invoke-virtual { v0, p0, v1 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
  :L2
  .line 178
    goto :L4
  :L3
  .line 177
    move-exception p0
  :L4
  .line 179
    return-void
.end method

.method private static keepScreenOn(Landroid/content/Context;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 4
  .line 163
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    const-string v0, "power"
    invoke-virtual { p0, v0 }, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Landroid/os/PowerManager;
  :L1
  .line 164
    if-eqz p0, :L2
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    const/4 v2, 0
    invoke-virtual { p0, v0, v1, v2 }, Landroid/os/PowerManager;->userActivity(JZ)V
  :L2
  .line 166
    goto :L4
  :L3
  .line 165
    move-exception p0
  :L4
  .line 167
    return-void
.end method

.method public static key(Landroid/view/KeyEvent;)V
  .catchall { :L0 .. :L13 } :L14
  .registers 10
  .line 66
    if-eqz p0, :L16
  :L0
    invoke-virtual { p0 }, Landroid/view/KeyEvent;->getKeyCode()I
    move-result v0
    sget-object v1, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
    invoke-virtual { v1 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_ENTER()I
    move-result v1
    if-eq v0, v1, :L1
    goto/16 :L16
  :L1
  .line 67
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 68
    const-wide/16 v1, 0
    if-eqz v0, :L12
    const-string v3, "center_hold"
    invoke-static { v0, v3 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v3
    if-nez v3, :L2
    goto :L12
  :L2
  .line 72
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
  .line 73
    invoke-virtual { p0 }, Landroid/view/KeyEvent;->getFlags()I
    move-result v5
    and-int/lit8 v5, v5, 32
    const/4 v6, 0
    if-eqz v5, :L3
    const/4 v5, 1
    goto :L4
  :L3
    const/4 v5, 0
  :L4
  .line 74
    invoke-virtual { p0 }, Landroid/view/KeyEvent;->getAction()I
    move-result v7
    if-nez v7, :L10
  .line 75
    if-eqz v5, :L5
  .line 76
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->reset()V
  .line 77
    return-void
  :L5
  .line 79
    invoke-virtual { p0 }, Landroid/view/KeyEvent;->getRepeatCount()I
    move-result v0
    if-eqz v0, :L6
    sget-wide v7, Lcom/innioasis/ipp/CenterHold;->startAt:J
    cmp-long v0, v7, v1
    if-nez v0, :L9
  :L6
  .line 80
    invoke-virtual { p0 }, Landroid/view/KeyEvent;->getRepeatCount()I
    move-result p0
    if-nez p0, :L7
    sput-boolean v6, Lcom/innioasis/ipp/CenterHold;->done:Z
  :L7
  .line 81
    sget-boolean p0, Lcom/innioasis/ipp/CenterHold;->done:Z
    if-eqz p0, :L8
    return-void
  :L8
  .line 82
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/CenterHold;->start(J)V
  :L9
  .line 84
    sput-wide v3, Lcom/innioasis/ipp/CenterHold;->lastSeen:J
    goto :L11
  :L10
  .line 86
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->reset()V
  .line 87
    sput-boolean v6, Lcom/innioasis/ipp/CenterHold;->done:Z
  .line 88
    sget-boolean p0, Lcom/innioasis/ipp/CenterHold;->sleepOwed:Z
  .line 89
    sput-boolean v6, Lcom/innioasis/ipp/CenterHold;->sleepOwed:Z
  .line 91
    if-eqz p0, :L11
    if-nez v5, :L11
    sget-boolean p0, Lcom/innioasis/ipp/CenterHold;->warnedThisHold:Z
    if-nez p0, :L11
    invoke-static { v0 }, Lcom/innioasis/ipp/CenterHold;->goToSleep(Landroid/content/Context;)V
  :L11
  .line 95
    goto :L15
  :L12
  .line 69
    sget-wide v3, Lcom/innioasis/ipp/CenterHold;->startAt:J
    cmp-long p0, v3, v1
    if-eqz p0, :L13
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->reset()V
  :L13
  .line 70
    return-void
  :L14
  .line 93
    move-exception p0
  .line 94
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->reset()V
  :L15
  .line 96
    return-void
  :L16
  .line 66
    return-void
.end method

.method private static reset()V
  .registers 2
  .line 110
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->cancelTicker()V
  .line 111
    const-wide/16 v0, 0
    sput-wide v0, Lcom/innioasis/ipp/CenterHold;->startAt:J
  .line 112
    sput-wide v0, Lcom/innioasis/ipp/CenterHold;->lastSeen:J
  .line 113
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/CenterHold;->warned:Z
  .line 114
    return-void
.end method

.method private static start(J)V
  .registers 4
  .line 99
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->cancelTicker()V
  .line 100
    sput-wide p0, Lcom/innioasis/ipp/CenterHold;->startAt:J
  .line 101
    sput-wide p0, Lcom/innioasis/ipp/CenterHold;->lastSeen:J
  .line 102
    const/4 p0, 0
    sput-boolean p0, Lcom/innioasis/ipp/CenterHold;->warned:Z
  .line 103
    sput-boolean p0, Lcom/innioasis/ipp/CenterHold;->warnedThisHold:Z
  .line 104
    sput-boolean p0, Lcom/innioasis/ipp/CenterHold;->sleepOwed:Z
  .line 105
    new-instance p0, Lcom/innioasis/ipp/CenterHold$Tick;
    invoke-direct { p0 }, Lcom/innioasis/ipp/CenterHold$Tick;-><init>()V
    sput-object p0, Lcom/innioasis/ipp/CenterHold;->ticker:Lcom/innioasis/ipp/CenterHold$Tick;
  .line 106
    sget-object p1, Lcom/innioasis/ipp/CenterHold;->H:Landroid/os/Handler;
    const-wide/16 v0, 100
    invoke-virtual { p1, p0, v0, v1 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 107
    return-void
.end method
