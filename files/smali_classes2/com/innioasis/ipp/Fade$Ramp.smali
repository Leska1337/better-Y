.class final Lcom/innioasis/ipp/Fade$Ramp;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Fade.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Fade;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Ramp"
.end annotation

.field cancelled:Z

.field private final ijk:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

.field private final p2:Landroid/media/MediaPlayer;

.field private final t0:J

.method constructor <init>(Landroid/media/MediaPlayer;Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)V
  .registers 5
  .line 90
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 87
    invoke-static { }, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v0
    iput-wide v0, p0, Lcom/innioasis/ipp/Fade$Ramp;->t0:J
  .line 90
    iput-object p1, p0, Lcom/innioasis/ipp/Fade$Ramp;->p2:Landroid/media/MediaPlayer;
    iput-object p2, p0, Lcom/innioasis/ipp/Fade$Ramp;->ijk:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;
    return-void
.end method

.method public run()V
  .registers 6
  .line 93
    iget-boolean v0, p0, Lcom/innioasis/ipp/Fade$Ramp;->cancelled:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 94
    invoke-static { }, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v0
    iget-wide v2, p0, Lcom/innioasis/ipp/Fade$Ramp;->t0:J
    sub-long/2addr v0, v2
  .line 95
    const-wide/16 v2, 300
    cmp-long v4, v0, v2
    if-ltz v4, :L2
  .line 96
    iget-object v0, p0, Lcom/innioasis/ipp/Fade$Ramp;->p2:Landroid/media/MediaPlayer;
    iget-object v1, p0, Lcom/innioasis/ipp/Fade$Ramp;->ijk:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;
    const/high16 v2, 0x3F800000
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Fade;->access$000(Landroid/media/MediaPlayer;Ltv/danmaku/ijk/media/player/IjkMediaPlayer;F)V
  .line 97
    invoke-static { }, Lcom/innioasis/ipp/Fade;->access$100()Lcom/innioasis/ipp/Fade$Ramp;
    move-result-object v0
    if-ne v0, p0, :L1
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Fade;->access$102(Lcom/innioasis/ipp/Fade$Ramp;)Lcom/innioasis/ipp/Fade$Ramp;
  :L1
  .line 98
    return-void
  :L2
  .line 100
    long-to-float v0, v0
    const/high16 v1, 0x43960000
    div-float/2addr v0, v1
  .line 101
    iget-object v1, p0, Lcom/innioasis/ipp/Fade$Ramp;->p2:Landroid/media/MediaPlayer;
    iget-object v2, p0, Lcom/innioasis/ipp/Fade$Ramp;->ijk:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;
    mul-float v0, v0, v0
    invoke-static { v1, v2, v0 }, Lcom/innioasis/ipp/Fade;->access$000(Landroid/media/MediaPlayer;Ltv/danmaku/ijk/media/player/IjkMediaPlayer;F)V
  .line 102
    new-instance v0, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    const-wide/16 v1, 20
    invoke-virtual { v0, p0, v1, v2 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 103
    return-void
.end method
