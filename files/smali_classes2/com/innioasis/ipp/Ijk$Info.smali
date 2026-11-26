.class final Lcom/innioasis/ipp/Ijk$Info;
.super Ljava/lang/Object;
.implements Ltv/danmaku/ijk/media/player/IMediaPlayer$OnInfoListener;
.source "Ijk.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Ijk;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Info"
.end annotation

.field private at:J

.method constructor <init>()V
  .registers 1
  .line 56
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public onInfo(Ltv/danmaku/ijk/media/player/IMediaPlayer;II)Z
  .registers 7
  .line 60
    const/16 p3, 701
    const-string v0, " ms"
    if-ne p2, p3, :L0
  .line 61
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide p2
    iput-wide p2, p0, Lcom/innioasis/ipp/Ijk$Info;->at:J
  .line 62
    new-instance p2, Ljava/lang/StringBuilder;
    invoke-direct { p2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string p3, "ijk buffering start, position "
    invoke-virtual { p2, p3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p2
    invoke-interface { p1 }, Ltv/danmaku/ijk/media/player/IMediaPlayer;->getCurrentPosition()J
    move-result-wide v1
    invoke-virtual { p2, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
    goto :L1
  :L0
  .line 63
    const/16 p1, 702
    if-ne p2, p1, :L1
  .line 64
    new-instance p1, Ljava/lang/StringBuilder;
    invoke-direct { p1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string p2, "ijk buffering end, "
    invoke-virtual { p1, p2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide p2
    iget-wide v1, p0, Lcom/innioasis/ipp/Ijk$Info;->at:J
    sub-long/2addr p2, v1
    invoke-virtual { p1, p2, p3 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L1
  .line 66
    const/4 p1, 0
    return p1
.end method
