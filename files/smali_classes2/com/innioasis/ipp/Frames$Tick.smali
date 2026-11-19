.class final Lcom/innioasis/ipp/Frames$Tick;
.super Ljava/lang/Object;
.implements Landroid/view/Choreographer$FrameCallback;
.source "Frames.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Frames;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Tick"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 78
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public doFrame(J)V
  .registers 10
  .line 80
    invoke-static { }, Lcom/innioasis/ipp/Frames;->access$000()Ljava/lang/String;
    move-result-object v0
    if-nez v0, :L0
    return-void
  :L0
  .line 81
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    invoke-static { }, Lcom/innioasis/ipp/Frames;->access$100()J
    move-result-wide v2
    sub-long/2addr v0, v2
    const-wide/16 v2, 3000
    cmp-long v4, v0, v2
    if-lez v4, :L1
  .line 82
    invoke-static { }, Lcom/innioasis/ipp/Frames;->stop()V
  .line 83
    return-void
  :L1
  .line 85
    invoke-static { }, Landroid/os/SystemClock;->currentThreadTimeMillis()J
    move-result-wide v0
  .line 86
    invoke-static { }, Lcom/innioasis/ipp/Frames;->access$200()J
    move-result-wide v2
    const-wide/16 v4, 0
    cmp-long v6, v2, v4
    if-eqz v6, :L3
  .line 87
    invoke-static { }, Lcom/innioasis/ipp/Frames;->access$200()J
    move-result-wide v2
    sub-long v2, p1, v2
    const-wide/32 v4, 1000000
    div-long/2addr v2, v4
  .line 88
    invoke-static { }, Lcom/innioasis/ipp/Frames;->access$300()J
    move-result-wide v4
    cmp-long v6, v2, v4
    if-lez v6, :L2
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Frames;->access$302(J)J
  :L2
  .line 89
    invoke-static { }, Lcom/innioasis/ipp/Frames;->access$400()Ljava/lang/StringBuilder;
    move-result-object v4
    const/16 v5, 32
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, v2, v3 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
  .line 91
    const-wide/16 v4, 50
    cmp-long v6, v2, v4
    if-ltz v6, :L3
    invoke-static { }, Lcom/innioasis/ipp/Frames;->access$400()Ljava/lang/StringBuilder;
    move-result-object v2
    const/16 v3, 47
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-static { }, Lcom/innioasis/ipp/Frames;->access$500()J
    move-result-wide v3
    sub-long v3, v0, v3
    invoke-virtual { v2, v3, v4 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
  :L3
  .line 93
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/Frames;->access$202(J)J
  .line 94
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Frames;->access$502(J)J
  .line 95
    invoke-static { }, Lcom/innioasis/ipp/Frames;->access$608()I
  .line 96
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p1
    invoke-virtual { p1, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  .line 97
    return-void
.end method
