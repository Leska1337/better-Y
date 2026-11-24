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

.field private final static WAKE_SLACK_MS:J = 300L

.field private final static WARN_MS:J = 2000L

.field private static done:Z

.field private static downAt:J

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
  .line 126
    sget-object v0, Lcom/innioasis/ipp/CenterHold;->ticker:Lcom/innioasis/ipp/CenterHold$Tick;
    if-eqz v0, :L0
  .line 127
    sget-object v1, Lcom/innioasis/ipp/CenterHold;->H:Landroid/os/Handler;
    invoke-virtual { v1, v0 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 128
    const/4 v0, 0
    sput-object v0, Lcom/innioasis/ipp/CenterHold;->ticker:Lcom/innioasis/ipp/CenterHold$Tick;
  :L0
  .line 130
    return-void
.end method

.method public static deferSleep()Z
  .catchall { :L0 .. :L5 } :L7
  .registers 10
  .line 59
    const/4 v0, 0
  :L0
    sget-wide v1, Lcom/innioasis/ipp/CenterHold;->downAt:J
    const-wide/16 v3, 0
    const/4 v5, 1
    cmp-long v6, v1, v3
    if-eqz v6, :L2
    invoke-static { }, Lcom/innioasis/ipp/Lit;->screenOn()Z
    move-result v1
    if-eqz v1, :L1
    sget-wide v1, Lcom/innioasis/ipp/CenterHold;->downAt:J
    invoke-static { }, Lcom/innioasis/ipp/Lit;->onAt()J
    move-result-wide v6
    const-wide/16 v8, 300
    add-long/2addr v6, v8
    cmp-long v8, v1, v6
    if-gez v8, :L2
  :L1
    return v5
  :L2
  .line 60
    sget-wide v1, Lcom/innioasis/ipp/CenterHold;->startAt:J
    cmp-long v6, v1, v3
    if-nez v6, :L3
    return v0
  :L3
  .line 61
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v1
  .line 62
    if-eqz v1, :L6
    const-string v2, "center_hold"
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :L4
    goto :L6
  :L4
  .line 63
    sput-boolean v5, Lcom/innioasis/ipp/CenterHold;->sleepOwed:Z
  :L5
  .line 64
    return v5
  :L6
  .line 62
    return v0
  :L7
  .line 65
    move-exception v1
  .line 66
    return v0
.end method

.method private static goToSleep(Landroid/content/Context;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 7
  .line 181
    if-nez p0, :L0
    return-void
  :L0
  .line 182
    const-string v0, "power"
    invoke-virtual { p0, v0 }, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object p0
  .line 183
    if-nez p0, :L1
    return-void
  :L1
  .line 184
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
  .line 185
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    invoke-static { v2, v3 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v2
    aput-object v2, v1, v5
    invoke-virtual { v0, p0, v1 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
  :L2
  .line 187
    goto :L4
  :L3
  .line 186
    move-exception p0
  :L4
  .line 188
    return-void
.end method

.method private static keepScreenOn(Landroid/content/Context;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 4
  .line 172
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    const-string v0, "power"
    invoke-virtual { p0, v0 }, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Landroid/os/PowerManager;
  :L1
  .line 173
    if-eqz p0, :L2
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    const/4 v2, 0
    invoke-virtual { p0, v0, v1, v2 }, Landroid/os/PowerManager;->userActivity(JZ)V
  :L2
  .line 175
    goto :L4
  :L3
  .line 174
    move-exception p0
  :L4
  .line 176
    return-void
.end method

.method public static key(Landroid/view/KeyEvent;)V
  .catchall { :L0 .. :L15 } :L16
  .registers 10
  .line 73
    if-eqz p0, :L18
  :L0
    invoke-virtual { p0 }, Landroid/view/KeyEvent;->getKeyCode()I
    move-result v0
    sget-object v1, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
    invoke-virtual { v1 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_ENTER()I
    move-result v1
    if-eq v0, v1, :L1
    goto/16 :L18
  :L1
  .line 74
    invoke-virtual { p0 }, Landroid/view/KeyEvent;->getAction()I
    move-result v0
    const-wide/16 v1, 0
    if-nez v0, :L2
    invoke-virtual { p0 }, Landroid/view/KeyEvent;->getDownTime()J
    move-result-wide v3
    sput-wide v3, Lcom/innioasis/ipp/CenterHold;->downAt:J
    goto :L3
  :L2
  .line 75
    sput-wide v1, Lcom/innioasis/ipp/CenterHold;->downAt:J
  :L3
  .line 76
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 77
    if-eqz v0, :L14
    const-string v3, "center_hold"
    invoke-static { v0, v3 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v3
    if-nez v3, :L4
    goto :L14
  :L4
  .line 81
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
  .line 82
    invoke-virtual { p0 }, Landroid/view/KeyEvent;->getFlags()I
    move-result v5
    and-int/lit8 v5, v5, 32
    const/4 v6, 0
    if-eqz v5, :L5
    const/4 v5, 1
    goto :L6
  :L5
    const/4 v5, 0
  :L6
  .line 83
    invoke-virtual { p0 }, Landroid/view/KeyEvent;->getAction()I
    move-result v7
    if-nez v7, :L12
  .line 84
    if-eqz v5, :L7
  .line 85
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->reset()V
  .line 86
    return-void
  :L7
  .line 88
    invoke-virtual { p0 }, Landroid/view/KeyEvent;->getRepeatCount()I
    move-result v0
    if-eqz v0, :L8
    sget-wide v7, Lcom/innioasis/ipp/CenterHold;->startAt:J
    cmp-long v0, v7, v1
    if-nez v0, :L11
  :L8
  .line 89
    invoke-virtual { p0 }, Landroid/view/KeyEvent;->getRepeatCount()I
    move-result p0
    if-nez p0, :L9
    sput-boolean v6, Lcom/innioasis/ipp/CenterHold;->done:Z
  :L9
  .line 90
    sget-boolean p0, Lcom/innioasis/ipp/CenterHold;->done:Z
    if-eqz p0, :L10
    return-void
  :L10
  .line 91
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/CenterHold;->start(J)V
  :L11
  .line 93
    sput-wide v3, Lcom/innioasis/ipp/CenterHold;->lastSeen:J
    goto :L13
  :L12
  .line 95
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->reset()V
  .line 96
    sput-boolean v6, Lcom/innioasis/ipp/CenterHold;->done:Z
  .line 97
    sget-boolean p0, Lcom/innioasis/ipp/CenterHold;->sleepOwed:Z
  .line 98
    sput-boolean v6, Lcom/innioasis/ipp/CenterHold;->sleepOwed:Z
  .line 100
    if-eqz p0, :L13
    if-nez v5, :L13
    sget-boolean p0, Lcom/innioasis/ipp/CenterHold;->warnedThisHold:Z
    if-nez p0, :L13
    invoke-static { v0 }, Lcom/innioasis/ipp/CenterHold;->goToSleep(Landroid/content/Context;)V
  :L13
  .line 104
    goto :L17
  :L14
  .line 78
    sget-wide v3, Lcom/innioasis/ipp/CenterHold;->startAt:J
    cmp-long p0, v3, v1
    if-eqz p0, :L15
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->reset()V
  :L15
  .line 79
    return-void
  :L16
  .line 102
    move-exception p0
  .line 103
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->reset()V
  :L17
  .line 105
    return-void
  :L18
  .line 73
    return-void
.end method

.method private static reset()V
  .registers 2
  .line 119
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->cancelTicker()V
  .line 120
    const-wide/16 v0, 0
    sput-wide v0, Lcom/innioasis/ipp/CenterHold;->startAt:J
  .line 121
    sput-wide v0, Lcom/innioasis/ipp/CenterHold;->lastSeen:J
  .line 122
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/CenterHold;->warned:Z
  .line 123
    return-void
.end method

.method private static start(J)V
  .registers 4
  .line 108
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->cancelTicker()V
  .line 109
    sput-wide p0, Lcom/innioasis/ipp/CenterHold;->startAt:J
  .line 110
    sput-wide p0, Lcom/innioasis/ipp/CenterHold;->lastSeen:J
  .line 111
    const/4 p0, 0
    sput-boolean p0, Lcom/innioasis/ipp/CenterHold;->warned:Z
  .line 112
    sput-boolean p0, Lcom/innioasis/ipp/CenterHold;->warnedThisHold:Z
  .line 113
    sput-boolean p0, Lcom/innioasis/ipp/CenterHold;->sleepOwed:Z
  .line 114
    new-instance p0, Lcom/innioasis/ipp/CenterHold$Tick;
    invoke-direct { p0 }, Lcom/innioasis/ipp/CenterHold$Tick;-><init>()V
    sput-object p0, Lcom/innioasis/ipp/CenterHold;->ticker:Lcom/innioasis/ipp/CenterHold$Tick;
  .line 115
    sget-object p1, Lcom/innioasis/ipp/CenterHold;->H:Landroid/os/Handler;
    const-wide/16 v0, 100
    invoke-virtual { p1, p0, v0, v1 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 116
    return-void
.end method
