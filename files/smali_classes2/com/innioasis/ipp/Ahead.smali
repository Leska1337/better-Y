.class public final Lcom/innioasis/ipp/Ahead;
.super Ljava/lang/Object;
.source "Ahead.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Ahead$Pick;,
    Lcom/innioasis/ipp/Ahead$Early;,
    Lcom/innioasis/ipp/Ahead$Head;,
    Lcom/innioasis/ipp/Ahead$Read;
  }
.end annotation

.field private final static CAP:J = 33554432L

.field private final static CHUNK:I = 131072

.field private final static HEAD_CHUNK:I = 65536

.field private final static HEAD_MS:J = 350L

.field private final static MAIN:Landroid/os/Handler;

.field private final static PAUSE_MS:J = 20L

.field private final static PICK:Lcom/innioasis/ipp/Ahead$Pick;

.field private final static PICKED_MS:J = 600L

.field private final static SERIES_MS:J = 600L

.field private final static TIMER_EDGE_MS:J = 20L

.field private final static TIMER_MS:J = 200L

.field private final static WAIT_MS:J = 4000L

.field private static volatile done:Ljava/lang/String;

.field static volatile headPath:Ljava/lang/String;

.field static volatile headTurn:I

.field static volatile headUntil:J

.field private static headWorker:Landroid/os/Handler;

.field private static series:Z

.field private static switchedAt:J

.field private static timer:Landroid/os/CountDownTimer;

.field private static timerAt:J

.field private static timerPath:Ljava/lang/String;

.field static volatile turn:I

.field private static worker:Landroid/os/Handler;

.method static constructor <clinit>()V
  .registers 2
  .line 55
    new-instance v0, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v0, Lcom/innioasis/ipp/Ahead;->MAIN:Landroid/os/Handler;
  .line 56
    new-instance v0, Lcom/innioasis/ipp/Ahead$Pick;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Ahead$Pick;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Ahead;->PICK:Lcom/innioasis/ipp/Ahead$Pick;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 25
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000()Landroid/os/CountDownTimer;
  .registers 1
  .line 23
    sget-object v0, Lcom/innioasis/ipp/Ahead;->timer:Landroid/os/CountDownTimer;
    return-object v0
.end method

.method static synthetic access$002(Landroid/os/CountDownTimer;)Landroid/os/CountDownTimer;
  .registers 1
  .line 23
    sput-object p0, Lcom/innioasis/ipp/Ahead;->timer:Landroid/os/CountDownTimer;
    return-object p0
.end method

.method static synthetic access$100()Z
  .registers 1
  .line 23
    sget-boolean v0, Lcom/innioasis/ipp/Ahead;->series:Z
    return v0
.end method

.method static synthetic access$200()Ljava/lang/String;
  .registers 1
  .line 23
    sget-object v0, Lcom/innioasis/ipp/Ahead;->timerPath:Ljava/lang/String;
    return-object v0
.end method

.method static synthetic access$300()J
  .registers 2
  .line 23
    sget-wide v0, Lcom/innioasis/ipp/Ahead;->timerAt:J
    return-wide v0
.end method

.method static synthetic access$400()Ljava/lang/String;
  .registers 1
  .line 23
    sget-object v0, Lcom/innioasis/ipp/Ahead;->done:Ljava/lang/String;
    return-object v0
.end method

.method static synthetic access$402(Ljava/lang/String;)Ljava/lang/String;
  .registers 1
  .line 23
    sput-object p0, Lcom/innioasis/ipp/Ahead;->done:Ljava/lang/String;
    return-object p0
.end method

.method static synthetic access$500()Landroid/os/Handler;
  .registers 1
  .line 23
    sget-object v0, Lcom/innioasis/ipp/Ahead;->worker:Landroid/os/Handler;
    return-object v0
.end method

.method static synthetic access$502(Landroid/os/Handler;)Landroid/os/Handler;
  .registers 1
  .line 23
    sput-object p0, Lcom/innioasis/ipp/Ahead;->worker:Landroid/os/Handler;
    return-object p0
.end method

.method static synthetic access$600()Landroid/os/Handler;
  .registers 1
  .line 23
    sget-object v0, Lcom/innioasis/ipp/Ahead;->MAIN:Landroid/os/Handler;
    return-object v0
.end method

.method public static armed(Landroid/os/CountDownTimer;)V
  .registers 3
  .line 112
    sput-object p0, Lcom/innioasis/ipp/Ahead;->timer:Landroid/os/CountDownTimer;
  .line 113
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sput-wide v0, Lcom/innioasis/ipp/Ahead;->timerAt:J
  .line 114
    return-void
.end method

.method private static head(Ljava/lang/String;J)V
  .catchall { :L0 .. :L3 } :L4
  .registers 5
  .line 146
    if-nez p0, :L0
    return-void
  :L0
  .line 147
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    add-long/2addr v0, p1
    sput-wide v0, Lcom/innioasis/ipp/Ahead;->headUntil:J
  .line 148
    sget-object p1, Lcom/innioasis/ipp/Ahead;->headPath:Ljava/lang/String;
    invoke-virtual { p0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L1
    return-void
  :L1
  .line 149
    sput-object p0, Lcom/innioasis/ipp/Ahead;->headPath:Ljava/lang/String;
  .line 150
    sget-object p1, Lcom/innioasis/ipp/Ahead;->headWorker:Landroid/os/Handler;
    if-nez p1, :L2
  .line 151
    new-instance p1, Landroid/os/HandlerThread;
    const-string p2, "ipp-head"
    const/16 v0, 10
    invoke-direct { p1, p2, v0 }, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V
  .line 152
    invoke-virtual { p1 }, Landroid/os/HandlerThread;->start()V
  .line 153
    new-instance p2, Landroid/os/Handler;
    invoke-virtual { p1 }, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;
    move-result-object p1
    invoke-direct { p2, p1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object p2, Lcom/innioasis/ipp/Ahead;->headWorker:Landroid/os/Handler;
  :L2
  .line 155
    sget-object p1, Lcom/innioasis/ipp/Ahead;->headWorker:Landroid/os/Handler;
    new-instance p2, Lcom/innioasis/ipp/Ahead$Head;
    sget v0, Lcom/innioasis/ipp/Ahead;->headTurn:I
    add-int/lit8 v0, v0, 1
    sput v0, Lcom/innioasis/ipp/Ahead;->headTurn:I
    invoke-direct { p2, p0, v0 }, Lcom/innioasis/ipp/Ahead$Head;-><init>(Ljava/lang/String;I)V
    invoke-virtual { p1, p2 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  :L3
  .line 157
    goto :L5
  :L4
  .line 156
    move-exception p0
  :L5
  .line 158
    return-void
.end method

.method public static headPlaying()V
  .catchall { :L0 .. :L9 } :L10
  .registers 7
  :L0
  .line 96
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 97
    sget-wide v2, Lcom/innioasis/ipp/Ahead;->switchedAt:J
    sub-long v2, v0, v2
    const-wide/16 v4, 600
    cmp-long v6, v2, v4
    if-gez v6, :L1
    const/4 v2, 1
    goto :L2
  :L1
    const/4 v2, 0
  :L2
    sput-boolean v2, Lcom/innioasis/ipp/Ahead;->series:Z
  .line 98
    sput-wide v0, Lcom/innioasis/ipp/Ahead;->switchedAt:J
  .line 99
    const/4 v0, 0
    sput-object v0, Lcom/innioasis/ipp/Ahead;->timer:Landroid/os/CountDownTimer;
  .line 100
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v1
  .line 101
    if-nez v1, :L3
    move-object v1, v0
    goto :L4
  :L3
    invoke-virtual { v1 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingSong()Lcom/innioasis/y1/database/Song;
    move-result-object v1
  :L4
  .line 102
    if-nez v1, :L5
    goto :L6
  :L5
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
  :L6
    sput-object v0, Lcom/innioasis/ipp/Ahead;->timerPath:Ljava/lang/String;
  .line 103
    if-nez v1, :L7
    return-void
  :L7
  .line 104
    sget-object v1, Lcom/innioasis/ipp/Ahead;->done:Ljava/lang/String;
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L8
    sget-object v0, Lcom/innioasis/ipp/Ahead;->MAIN:Landroid/os/Handler;
    new-instance v1, Lcom/innioasis/ipp/Ahead$Early;
    sget-object v2, Lcom/innioasis/ipp/Ahead;->timerPath:Ljava/lang/String;
    invoke-direct { v1, v2 }, Lcom/innioasis/ipp/Ahead$Early;-><init>(Ljava/lang/String;)V
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    goto :L9
  :L8
  .line 105
    sget-object v0, Lcom/innioasis/ipp/Ahead;->timerPath:Ljava/lang/String;
    const-wide/16 v1, 350
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Ahead;->head(Ljava/lang/String;J)V
  :L9
  .line 107
    goto :L11
  :L10
  .line 106
    move-exception v0
  :L11
  .line 108
    return-void
.end method

.method public static onSongChanged()V
  .registers 4
  .line 83
    sget v0, Lcom/innioasis/ipp/Ahead;->turn:I
    add-int/lit8 v0, v0, 1
    sput v0, Lcom/innioasis/ipp/Ahead;->turn:I
  .line 84
    sget-object v0, Lcom/innioasis/ipp/Ahead;->MAIN:Landroid/os/Handler;
    sget-object v1, Lcom/innioasis/ipp/Ahead;->PICK:Lcom/innioasis/ipp/Ahead$Pick;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 85
    const-wide/16 v2, 4000
    invoke-virtual { v0, v1, v2, v3 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 86
    return-void
.end method

.method public static picked(Ljava/lang/String;)V
  .registers 3
  .line 90
    const-wide/16 v0, 600
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Ahead;->head(Ljava/lang/String;J)V
  .line 91
    return-void
.end method
