.class public final Lcom/innioasis/ipp/CenterHold;
.super Ljava/lang/Object;
.source "CenterHold.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/CenterHold$Tick;
  }
.end annotation

.field final static DRY_RUN:Z = false

.field private final static GAP_MS:J = 800L

.field private final static H:Landroid/os/Handler;

.field private final static HOLD_MS:J = 5000L

.field public final static KEY:Ljava/lang/String; = "center_hold"

.field private final static TAG:Ljava/lang/String; = "Y1CenterHold"

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
  .line 56
    new-instance v0, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v0, Lcom/innioasis/ipp/CenterHold;->H:Landroid/os/Handler;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 39
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000()Lcom/innioasis/ipp/CenterHold$Tick;
  .registers 1
  .line 37
    sget-object v0, Lcom/innioasis/ipp/CenterHold;->ticker:Lcom/innioasis/ipp/CenterHold$Tick;
    return-object v0
.end method

.method static synthetic access$100()J
  .registers 2
  .line 37
    sget-wide v0, Lcom/innioasis/ipp/CenterHold;->startAt:J
    return-wide v0
.end method

.method static synthetic access$1000(Landroid/content/Context;J)V
  .registers 3
  .line 37
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/CenterHold;->fire(Landroid/content/Context;J)V
    return-void
.end method

.method static synthetic access$1100()Landroid/os/Handler;
  .registers 1
  .line 37
    sget-object v0, Lcom/innioasis/ipp/CenterHold;->H:Landroid/os/Handler;
    return-object v0
.end method

.method static synthetic access$1200()V
  .registers 0
  .line 37
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->reset()V
    return-void
.end method

.method static synthetic access$200()J
  .registers 2
  .line 37
    sget-wide v0, Lcom/innioasis/ipp/CenterHold;->lastSeen:J
    return-wide v0
.end method

.method static synthetic access$300(Ljava/lang/String;)V
  .registers 1
  .line 37
    invoke-static { p0 }, Lcom/innioasis/ipp/CenterHold;->stop(Ljava/lang/String;)V
    return-void
.end method

.method static synthetic access$402(Z)Z
  .registers 1
  .line 37
    sput-boolean p0, Lcom/innioasis/ipp/CenterHold;->sleepOwed:Z
    return p0
.end method

.method static synthetic access$500(Landroid/content/Context;)V
  .registers 1
  .line 37
    invoke-static { p0 }, Lcom/innioasis/ipp/CenterHold;->keepScreenOn(Landroid/content/Context;)V
    return-void
.end method

.method static synthetic access$600()Z
  .registers 1
  .line 37
    sget-boolean v0, Lcom/innioasis/ipp/CenterHold;->warned:Z
    return v0
.end method

.method static synthetic access$602(Z)Z
  .registers 1
  .line 37
    sput-boolean p0, Lcom/innioasis/ipp/CenterHold;->warned:Z
    return p0
.end method

.method static synthetic access$702(Z)Z
  .registers 1
  .line 37
    sput-boolean p0, Lcom/innioasis/ipp/CenterHold;->warnedThisHold:Z
    return p0
.end method

.method static synthetic access$800(Landroid/content/Context;)Z
  .registers 1
  .line 37
    invoke-static { p0 }, Lcom/innioasis/ipp/CenterHold;->es(Landroid/content/Context;)Z
    move-result p0
    return p0
.end method

.method static synthetic access$900(Landroid/content/Context;Ljava/lang/String;)V
  .registers 2
  .line 37
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/CenterHold;->toast(Landroid/content/Context;Ljava/lang/String;)V
    return-void
.end method

.method private static cancelTicker()V
  .registers 2
  .line 171
    sget-object v0, Lcom/innioasis/ipp/CenterHold;->ticker:Lcom/innioasis/ipp/CenterHold$Tick;
    if-eqz v0, :L0
  .line 172
    sget-object v0, Lcom/innioasis/ipp/CenterHold;->H:Landroid/os/Handler;
    sget-object v1, Lcom/innioasis/ipp/CenterHold;->ticker:Lcom/innioasis/ipp/CenterHold$Tick;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 173
    const/4 v0, 0
    sput-object v0, Lcom/innioasis/ipp/CenterHold;->ticker:Lcom/innioasis/ipp/CenterHold$Tick;
  :L0
  .line 175
    return-void
.end method

.method public static deferSleep()Z
  .catchall { :L0 .. :L3 } :L5
  .registers 6
  .line 80
    const/4 v0, 0
  :L0
    sget-wide v1, Lcom/innioasis/ipp/CenterHold;->startAt:J
    const-wide/16 v3, 0
    cmp-long v5, v1, v3
    if-nez v5, :L1
    return v0
  :L1
  .line 81
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v1
  .line 82
    if-eqz v1, :L4
    const-string v2, "center_hold"
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :L2
    goto :L4
  :L2
  .line 83
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/CenterHold;->sleepOwed:Z
  .line 84
    const-string v2, "Y1CenterHold"
    const-string v3, "stock sleep deferred to release"
    invoke-static { v2, v3 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  :L3
  .line 85
    return v1
  :L4
  .line 82
    return v0
  :L5
  .line 86
    move-exception v1
  .line 87
    return v0
.end method

.method private static es(Landroid/content/Context;)Z
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  :L0
  .line 263
    const-string p0, "es"
    invoke-static { }, Ljava/util/Locale;->getDefault()Ljava/util/Locale;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/util/Locale;->getLanguage()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
  :L1
    return p0
  :L2
  .line 264
    move-exception p0
  .line 265
    const/4 p0, 0
    return p0
.end method

.method private static fire(Landroid/content/Context;J)V
  .registers 4
  .line 212
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->reset()V
  .line 213
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/CenterHold;->done:Z
  .line 214
    const/4 p0, 0
    sput-boolean p0, Lcom/innioasis/ipp/CenterHold;->sleepOwed:Z
  .line 220
    new-instance p0, Ljava/lang/StringBuilder;
    invoke-direct { p0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v0, "SHUTDOWN after "
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, p1, p2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string p1, "ms"
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    const-string p1, "Y1CenterHold"
    invoke-static { p1, p0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 223
    sget-object p0, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { p0 }, Lcom/innioasis/music/util/Other;->shutdown()V
  .line 224
    return-void
.end method

.method private static goToSleep(Landroid/content/Context;)V
  .catchall { :L0 .. :L2 } :L3
  .catchall { :L4 .. :L5 } :L6
  .registers 7
  .line 239
    if-nez p0, :L0
    return-void
  :L0
  .line 240
    const-string v0, "power"
    invoke-virtual { p0, v0 }, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object p0
  .line 241
    if-nez p0, :L1
    return-void
  :L1
  .line 242
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
  .line 243
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
    invoke-static { v3, v4 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v1
    new-array v2, v2, [Ljava/lang/Object;
    aput-object v1, v2, v5
    invoke-virtual { v0, p0, v2 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
  :L2
  .line 249
    goto :L7
  :L3
  .line 244
    move-exception p0
  :L4
  .line 246
    const-string v0, "Y1CenterHold"
    const-string v1, "goToSleep failed"
    invoke-static { v0, v1, p0 }, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
  :L5
  .line 248
    goto :L7
  :L6
  .line 247
    move-exception p0
  :L7
  .line 250
    return-void
.end method

.method private static keepScreenOn(Landroid/content/Context;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 4
  .line 229
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    const-string v0, "power"
    invoke-virtual { p0, v0 }, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Landroid/os/PowerManager;
  :L1
  .line 230
    if-eqz p0, :L2
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    const/4 v2, 0
    invoke-virtual { p0, v0, v1, v2 }, Landroid/os/PowerManager;->userActivity(JZ)V
  :L2
  .line 233
    goto :L4
  :L3
  .line 231
    move-exception p0
  :L4
  .line 234
    return-void
.end method

.method public static key(Landroid/view/KeyEvent;)V
  .catchall { :L0 .. :L18 } :L19
  .catchall { :L20 .. :L21 } :L22
  .registers 12
  .line 93
    const-string v0, "Y1CenterHold"
    if-eqz p0, :L25
  :L0
    invoke-virtual { p0 }, Landroid/view/KeyEvent;->getKeyCode()I
    move-result v1
    sget-object v2, Lcom/innioasis/fm/configs/KeyMap;->INSTANCE:Lcom/innioasis/fm/configs/KeyMap;
    invoke-virtual { v2 }, Lcom/innioasis/fm/configs/KeyMap;->getKEY_ENTER()I
    move-result v2
    if-eq v1, v2, :L1
    goto/16 :L25
  :L1
  .line 94
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v1
  .line 95
    const-wide/16 v2, 0
    if-eqz v1, :L17
    const-string v4, "center_hold"
    invoke-static { v1, v4 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v4
    if-nez v4, :L2
    goto/16 :L17
  :L2
  .line 99
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
  .line 100
    invoke-virtual { p0 }, Landroid/view/KeyEvent;->getAction()I
    move-result v6
  .line 101
    new-instance v7, Ljava/lang/StringBuilder;
    invoke-direct { v7 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v8, "key action="
    invoke-virtual { v7, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v7
    invoke-virtual { v7, v6 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v7
    const-string v8, " repeat="
    invoke-virtual { v7, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v7
    invoke-virtual { p0 }, Landroid/view/KeyEvent;->getRepeatCount()I
    move-result v8
    invoke-virtual { v7, v8 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v7
    const-string v8, " flags=0x"
    invoke-virtual { v7, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v7
  .line 102
    invoke-virtual { p0 }, Landroid/view/KeyEvent;->getFlags()I
    move-result v8
    invoke-static { v8 }, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;
    move-result-object v8
    invoke-virtual { v7, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v7
    const-string v8, " screenOn="
    invoke-virtual { v7, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v7
  .line 103
    invoke-static { v1 }, Lcom/innioasis/ipp/CenterHold;->screenOn(Landroid/content/Context;)Z
    move-result v8
    invoke-virtual { v7, v8 }, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
    move-result-object v7
    const-string v8, " held="
    invoke-virtual { v7, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v7
    sget-wide v8, Lcom/innioasis/ipp/CenterHold;->startAt:J
    cmp-long v10, v8, v2
    if-nez v10, :L3
    move-wide v8, v2
    goto :L4
  :L3
    sget-wide v8, Lcom/innioasis/ipp/CenterHold;->startAt:J
    sub-long v8, v4, v8
  :L4
    invoke-virtual { v7, v8, v9 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v7
    invoke-virtual { v7 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v7
  .line 101
    invoke-static { v0, v7 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 105
    const/4 v7, 0
    if-nez v6, :L10
  .line 106
    invoke-virtual { p0 }, Landroid/view/KeyEvent;->getFlags()I
    move-result v1
    and-int/lit8 v1, v1, 32
    if-eqz v1, :L5
  .line 107
    const-string p0, "canceled flag"
    invoke-static { p0 }, Lcom/innioasis/ipp/CenterHold;->stop(Ljava/lang/String;)V
  .line 108
    return-void
  :L5
  .line 110
    invoke-virtual { p0 }, Landroid/view/KeyEvent;->getRepeatCount()I
    move-result v1
    if-eqz v1, :L6
    sget-wide v8, Lcom/innioasis/ipp/CenterHold;->startAt:J
    cmp-long v1, v8, v2
    if-nez v1, :L9
  :L6
  .line 111
    invoke-virtual { p0 }, Landroid/view/KeyEvent;->getRepeatCount()I
    move-result p0
    if-nez p0, :L7
  .line 112
    sput-boolean v7, Lcom/innioasis/ipp/CenterHold;->done:Z
  :L7
  .line 114
    sget-boolean p0, Lcom/innioasis/ipp/CenterHold;->done:Z
    if-eqz p0, :L8
    return-void
  :L8
  .line 115
    invoke-static { v4, v5 }, Lcom/innioasis/ipp/CenterHold;->start(J)V
  :L9
  .line 117
    sput-wide v4, Lcom/innioasis/ipp/CenterHold;->lastSeen:J
    goto :L16
  :L10
  .line 120
    invoke-virtual { p0 }, Landroid/view/KeyEvent;->getFlags()I
    move-result p0
    and-int/lit8 p0, p0, 32
    if-eqz p0, :L11
    const/4 p0, 1
    goto :L12
  :L11
    const/4 p0, 0
  :L12
  .line 121
    if-eqz p0, :L13
    const-string v2, "up canceled"
    goto :L14
  :L13
    const-string v2, "up"
  :L14
    invoke-static { v2 }, Lcom/innioasis/ipp/CenterHold;->stop(Ljava/lang/String;)V
  .line 122
    sput-boolean v7, Lcom/innioasis/ipp/CenterHold;->done:Z
  .line 126
    sget-boolean v2, Lcom/innioasis/ipp/CenterHold;->sleepOwed:Z
  .line 127
    sput-boolean v7, Lcom/innioasis/ipp/CenterHold;->sleepOwed:Z
  .line 128
    if-eqz v2, :L15
    if-nez p0, :L15
    sget-boolean p0, Lcom/innioasis/ipp/CenterHold;->warnedThisHold:Z
    if-nez p0, :L15
  .line 129
    const-string p0, "deferred sleep now"
    invoke-static { v0, p0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 130
    invoke-static { v1 }, Lcom/innioasis/ipp/CenterHold;->goToSleep(Landroid/content/Context;)V
    goto :L16
  :L15
  .line 131
    if-eqz v2, :L16
  .line 132
    new-instance p0, Ljava/lang/StringBuilder;
    invoke-direct { p0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "deferred sleep dropped (warned="
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    sget-boolean v1, Lcom/innioasis/ipp/CenterHold;->warnedThisHold:Z
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v1, ")"
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { v0, p0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  :L16
  .line 141
    goto :L24
  :L17
  .line 96
    sget-wide v4, Lcom/innioasis/ipp/CenterHold;->startAt:J
    cmp-long p0, v4, v2
    if-eqz p0, :L18
    const-string p0, "disabled"
    invoke-static { p0 }, Lcom/innioasis/ipp/CenterHold;->stop(Ljava/lang/String;)V
  :L18
  .line 97
    return-void
  :L19
  .line 135
    move-exception p0
  :L20
  .line 137
    const-string v1, "key failed"
    invoke-static { v0, v1, p0 }, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
  :L21
  .line 139
    goto :L23
  :L22
  .line 138
    move-exception p0
  :L23
  .line 140
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->reset()V
  :L24
  .line 142
    return-void
  :L25
  .line 93
    return-void
.end method

.method private static reset()V
  .registers 2
  .line 164
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->cancelTicker()V
  .line 165
    const-wide/16 v0, 0
    sput-wide v0, Lcom/innioasis/ipp/CenterHold;->startAt:J
  .line 166
    sput-wide v0, Lcom/innioasis/ipp/CenterHold;->lastSeen:J
  .line 167
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/CenterHold;->warned:Z
  .line 168
    return-void
.end method

.method private static screenOn(Landroid/content/Context;)Z
  .catchall { :L0 .. :L1 } :L4
  .registers 3
  .line 254
    const/4 v0, 1
  :L0
    const-string v1, "power"
    invoke-virtual { p0, v1 }, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Landroid/os/PowerManager;
  .line 255
    if-eqz p0, :L2
    invoke-virtual { p0 }, Landroid/os/PowerManager;->isScreenOn()Z
    move-result p0
  :L1
    if-eqz p0, :L2
    goto :L3
  :L2
    const/4 v0, 0
  :L3
    return v0
  :L4
  .line 256
    move-exception p0
  .line 257
    return v0
.end method

.method private static start(J)V
  .registers 4
  .line 145
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->cancelTicker()V
  .line 146
    sput-wide p0, Lcom/innioasis/ipp/CenterHold;->startAt:J
  .line 147
    sput-wide p0, Lcom/innioasis/ipp/CenterHold;->lastSeen:J
  .line 148
    const/4 p0, 0
    sput-boolean p0, Lcom/innioasis/ipp/CenterHold;->warned:Z
  .line 149
    sput-boolean p0, Lcom/innioasis/ipp/CenterHold;->warnedThisHold:Z
  .line 150
    sput-boolean p0, Lcom/innioasis/ipp/CenterHold;->sleepOwed:Z
  .line 151
    new-instance p0, Lcom/innioasis/ipp/CenterHold$Tick;
    invoke-direct { p0 }, Lcom/innioasis/ipp/CenterHold$Tick;-><init>()V
    sput-object p0, Lcom/innioasis/ipp/CenterHold;->ticker:Lcom/innioasis/ipp/CenterHold$Tick;
  .line 152
    sget-object p0, Lcom/innioasis/ipp/CenterHold;->H:Landroid/os/Handler;
    sget-object p1, Lcom/innioasis/ipp/CenterHold;->ticker:Lcom/innioasis/ipp/CenterHold$Tick;
    const-wide/16 v0, 100
    invoke-virtual { p0, p1, v0, v1 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 153
    const-string p0, "Y1CenterHold"
    const-string p1, "hold start"
    invoke-static { p0, p1 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 154
    return-void
.end method

.method private static stop(Ljava/lang/String;)V
  .registers 6
  .line 157
    sget-wide v0, Lcom/innioasis/ipp/CenterHold;->startAt:J
    const-wide/16 v2, 0
    cmp-long v4, v0, v2
    if-eqz v4, :L0
  .line 158
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "hold end: "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v0, " after "
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sget-wide v2, Lcom/innioasis/ipp/CenterHold;->startAt:J
    sub-long/2addr v0, v2
    invoke-virtual { p0, v0, v1 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v0, "ms"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    const-string v0, "Y1CenterHold"
    invoke-static { v0, p0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  :L0
  .line 160
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->reset()V
  .line 161
    return-void
.end method

.method private static toast(Landroid/content/Context;Ljava/lang/String;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 271
    if-eqz p0, :L3
    const/4 v0, 0
  :L0
    invoke-static { p0, p1, v0 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/widget/Toast;->show()V
  :L1
    goto :L3
  :L2
  .line 272
    move-exception p0
    goto :L4
  :L3
  .line 273
    nop
  :L4
  .line 274
    return-void
.end method
