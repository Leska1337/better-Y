.class public final Lcom/innioasis/ipp/Ahead;
.super Ljava/lang/Object;
.source "Ahead.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Ahead$Pick;,
    Lcom/innioasis/ipp/Ahead$Head;,
    Lcom/innioasis/ipp/Ahead$Read;
  }
.end annotation

.field private final static CAP:J = 33554432L

.field private final static CHUNK:I = 131072

.field private final static HEAD:J = 3145728L

.field private final static HEAD_CHUNK:I = 65536

.field private final static HEAD_MS:J = 1500L

.field private final static MAIN:Landroid/os/Handler;

.field private final static PAUSE_MS:J = 20L

.field private final static PICK:Lcom/innioasis/ipp/Ahead$Pick;

.field private final static WAIT_MS:J = 4000L

.field private static volatile done:Ljava/lang/String;

.field static volatile headTurn:I

.field private static headWorker:Landroid/os/Handler;

.field static volatile turn:I

.field private static worker:Landroid/os/Handler;

.method static constructor <clinit>()V
  .registers 2
  .line 42
    new-instance v0, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v0, Lcom/innioasis/ipp/Ahead;->MAIN:Landroid/os/Handler;
  .line 43
    new-instance v0, Lcom/innioasis/ipp/Ahead$Pick;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Ahead$Pick;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Ahead;->PICK:Lcom/innioasis/ipp/Ahead$Pick;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 23
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
  .registers 1
  .line 21
    sget-object v0, Lcom/innioasis/ipp/Ahead;->done:Ljava/lang/String;
    return-object v0
.end method

.method static synthetic access$002(Ljava/lang/String;)Ljava/lang/String;
  .registers 1
  .line 21
    sput-object p0, Lcom/innioasis/ipp/Ahead;->done:Ljava/lang/String;
    return-object p0
.end method

.method static synthetic access$100()Landroid/os/Handler;
  .registers 1
  .line 21
    sget-object v0, Lcom/innioasis/ipp/Ahead;->worker:Landroid/os/Handler;
    return-object v0
.end method

.method static synthetic access$102(Landroid/os/Handler;)Landroid/os/Handler;
  .registers 1
  .line 21
    sput-object p0, Lcom/innioasis/ipp/Ahead;->worker:Landroid/os/Handler;
    return-object p0
.end method

.method public static head(Ljava/lang/String;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 4
  .line 70
    if-nez p0, :L0
    return-void
  :L0
  .line 71
    sget-object v0, Lcom/innioasis/ipp/Ahead;->headWorker:Landroid/os/Handler;
    if-nez v0, :L1
  .line 72
    new-instance v0, Landroid/os/HandlerThread;
    const-string v1, "ipp-head"
    const/4 v2, 0
    invoke-direct { v0, v1, v2 }, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V
  .line 73
    invoke-virtual { v0 }, Landroid/os/HandlerThread;->start()V
  .line 74
    new-instance v1, Landroid/os/Handler;
    invoke-virtual { v0 }, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;
    move-result-object v0
    invoke-direct { v1, v0 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v1, Lcom/innioasis/ipp/Ahead;->headWorker:Landroid/os/Handler;
  :L1
  .line 76
    sget-object v0, Lcom/innioasis/ipp/Ahead;->headWorker:Landroid/os/Handler;
    new-instance v1, Lcom/innioasis/ipp/Ahead$Head;
    sget v2, Lcom/innioasis/ipp/Ahead;->headTurn:I
    add-int/lit8 v2, v2, 1
    sput v2, Lcom/innioasis/ipp/Ahead;->headTurn:I
    invoke-direct { v1, p0, v2 }, Lcom/innioasis/ipp/Ahead$Head;-><init>(Ljava/lang/String;I)V
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  :L2
  .line 78
    goto :L4
  :L3
  .line 77
    move-exception p0
  :L4
  .line 79
    return-void
.end method

.method public static headPlaying()V
  .catchall { :L0 .. :L3 } :L4
  .registers 1
  :L0
  .line 84
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 85
    if-nez v0, :L1
    const/4 v0, 0
    goto :L2
  :L1
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingSong()Lcom/innioasis/y1/database/Song;
    move-result-object v0
  :L2
  .line 86
    if-eqz v0, :L3
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Ahead;->head(Ljava/lang/String;)V
  :L3
  .line 88
    goto :L5
  :L4
  .line 87
    move-exception v0
  :L5
  .line 89
    return-void
.end method

.method public static onSongChanged()V
  .registers 4
  .line 59
    sget v0, Lcom/innioasis/ipp/Ahead;->turn:I
    add-int/lit8 v0, v0, 1
    sput v0, Lcom/innioasis/ipp/Ahead;->turn:I
  .line 60
    sget-object v0, Lcom/innioasis/ipp/Ahead;->MAIN:Landroid/os/Handler;
    sget-object v1, Lcom/innioasis/ipp/Ahead;->PICK:Lcom/innioasis/ipp/Ahead$Pick;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  .line 61
    const-wide/16 v2, 4000
    invoke-virtual { v0, v1, v2, v3 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 62
    return-void
.end method
