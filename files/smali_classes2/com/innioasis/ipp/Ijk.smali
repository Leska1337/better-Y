.class public final Lcom/innioasis/ipp/Ijk;
.super Ljava/lang/Object;
.source "Ijk.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Ijk$Release;
  }
.end annotation

.field private final static OPT_PLAYER:I = 4

.field private static worker:Landroid/os/Handler;

.method private constructor <init>()V
  .registers 1
  .line 18
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static swapped(Lcom/innioasis/y1/service/PlayerService;Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)V
  .catchall { :L0 .. :L1 } :L2
  .catchall { :L4 .. :L5 } :L6
  .registers 6
  :L0
  .line 32
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getPlayer()Ltv/danmaku/ijk/media/player/IjkMediaPlayer;
    move-result-object p0
    const-string v0, "vn"
    const-wide/16 v1, 1
    const/4 v3, 4
    invoke-virtual { p0, v3, v0, v1, v2 }, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOption(ILjava/lang/String;J)V
  :L1
  .line 34
    goto :L3
  :L2
  .line 33
    move-exception p0
  :L3
  .line 35
    if-nez p1, :L4
    return-void
  :L4
  .line 37
    invoke-virtual { p1 }, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->resetListeners()V
  :L5
  .line 39
    goto :L7
  :L6
  .line 38
    move-exception p0
  :L7
  .line 40
    sget-object p0, Lcom/innioasis/ipp/Ijk;->worker:Landroid/os/Handler;
    if-nez p0, :L8
  .line 41
    new-instance p0, Landroid/os/HandlerThread;
    const-string v0, "ipp-ijk"
    invoke-direct { p0, v0 }, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V
  .line 42
    invoke-virtual { p0 }, Landroid/os/HandlerThread;->start()V
  .line 43
    new-instance v0, Landroid/os/Handler;
    invoke-virtual { p0 }, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;
    move-result-object p0
    invoke-direct { v0, p0 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v0, Lcom/innioasis/ipp/Ijk;->worker:Landroid/os/Handler;
  :L8
  .line 45
    sget-object p0, Lcom/innioasis/ipp/Ijk;->worker:Landroid/os/Handler;
    new-instance v0, Lcom/innioasis/ipp/Ijk$Release;
    invoke-direct { v0, p1 }, Lcom/innioasis/ipp/Ijk$Release;-><init>(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)V
    invoke-virtual { p0, v0 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 46
    return-void
.end method
