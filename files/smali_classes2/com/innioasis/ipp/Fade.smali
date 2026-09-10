.class public final Lcom/innioasis/ipp/Fade;
.super Ljava/lang/Object;
.source "Fade.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Fade$Ramp;
  }
.end annotation

.field private final static MS:I = 300

.field private final static STEP:I = 20

.field private static done:Z

.field private static running:Lcom/innioasis/ipp/Fade$Ramp;

.method private constructor <init>()V
  .registers 1
  .line 37
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000(Landroid/media/MediaPlayer;Ltv/danmaku/ijk/media/player/IjkMediaPlayer;F)V
  .registers 3
  .line 35
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Fade;->set(Landroid/media/MediaPlayer;Ltv/danmaku/ijk/media/player/IjkMediaPlayer;F)V
    return-void
.end method

.method static synthetic access$100()Lcom/innioasis/ipp/Fade$Ramp;
  .registers 1
  .line 35
    sget-object v0, Lcom/innioasis/ipp/Fade;->running:Lcom/innioasis/ipp/Fade$Ramp;
    return-object v0
.end method

.method static synthetic access$102(Lcom/innioasis/ipp/Fade$Ramp;)Lcom/innioasis/ipp/Fade$Ramp;
  .registers 1
  .line 35
    sput-object p0, Lcom/innioasis/ipp/Fade;->running:Lcom/innioasis/ipp/Fade$Ramp;
    return-object p0
.end method

.method private static begin(Landroid/media/MediaPlayer;Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 6
  :L0
  .line 58
    sget-boolean v0, Lcom/innioasis/ipp/Fade;->done:Z
    if-eqz v0, :L1
    return-void
  :L1
  .line 59
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Fade;->done:Z
  .line 60
    const/4 v1, 0
    invoke-static { p0, p1, v1 }, Lcom/innioasis/ipp/Fade;->set(Landroid/media/MediaPlayer;Ltv/danmaku/ijk/media/player/IjkMediaPlayer;F)V
  .line 61
    sget-object v1, Lcom/innioasis/ipp/Fade;->running:Lcom/innioasis/ipp/Fade$Ramp;
    if-eqz v1, :L2
    iput-boolean v0, v1, Lcom/innioasis/ipp/Fade$Ramp;->cancelled:Z
  :L2
  .line 62
    new-instance v0, Lcom/innioasis/ipp/Fade$Ramp;
    invoke-direct { v0, p0, p1 }, Lcom/innioasis/ipp/Fade$Ramp;-><init>(Landroid/media/MediaPlayer;Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)V
    sput-object v0, Lcom/innioasis/ipp/Fade;->running:Lcom/innioasis/ipp/Fade$Ramp;
  .line 63
    new-instance v0, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sget-object v1, Lcom/innioasis/ipp/Fade;->running:Lcom/innioasis/ipp/Fade$Ramp;
    const-wide/16 v2, 20
    invoke-virtual { v0, v1, v2, v3 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  :L3
  .line 67
    goto :L5
  :L4
  .line 64
    move-exception v0
  .line 66
    const/high16 v0, 0x3F800000
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/Fade;->set(Landroid/media/MediaPlayer;Ltv/danmaku/ijk/media/player/IjkMediaPlayer;F)V
  :L5
  .line 68
    return-void
.end method

.method private static set(Landroid/media/MediaPlayer;Ltv/danmaku/ijk/media/player/IjkMediaPlayer;F)V
  .catchall { :L0 .. :L1 } :L2
  .catchall { :L5 .. :L6 } :L7
  .registers 3
  .line 72
    if-eqz p0, :L3
  :L0
    invoke-virtual { p0, p2, p2 }, Landroid/media/MediaPlayer;->setVolume(FF)V
  :L1
    goto :L3
  :L2
  .line 73
    move-exception p0
    goto :L4
  :L3
  .line 75
    nop
  :L4
  .line 77
    if-eqz p1, :L8
  :L5
    invoke-virtual { p1, p2, p2 }, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setVolume(FF)V
  :L6
    goto :L8
  :L7
  .line 78
    move-exception p0
    goto :L9
  :L8
  .line 80
    nop
  :L9
  .line 81
    return-void
.end method

.method public static soften(Landroid/media/MediaPlayer;)V
  .registers 2
  .line 49
    if-eqz p0, :L0
    const/4 v0, 0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Fade;->begin(Landroid/media/MediaPlayer;Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)V
  :L0
  .line 50
    return-void
.end method

.method public static soften(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)V
  .registers 2
  .line 53
    if-eqz p0, :L0
    const/4 v0, 0
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Fade;->begin(Landroid/media/MediaPlayer;Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)V
  :L0
  .line 54
    return-void
.end method
