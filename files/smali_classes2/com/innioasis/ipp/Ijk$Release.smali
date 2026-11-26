.class final Lcom/innioasis/ipp/Ijk$Release;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Ijk.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Ijk;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Release"
.end annotation

.field private final p:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

.method constructor <init>(Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)V
  .registers 2
  .line 73
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Ijk$Release;->p:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  :L0
  .line 77
    iget-object v0, p0, Lcom/innioasis/ipp/Ijk$Release;->p:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;
    invoke-virtual { v0 }, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->release()V
  :L1
  .line 79
    goto :L3
  :L2
  .line 78
    move-exception v0
  :L3
  .line 80
    return-void
.end method
