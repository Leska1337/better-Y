.class final Lcom/innioasis/ipp/BigCover$Save;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "BigCover.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/BigCover;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Save"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 657
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L2 } :L4
  .catchall { :L5 .. :L6 } :L4
  .registers 7
  .line 660
    const-class v0, Lcom/innioasis/ipp/BigCover;
    monitor-enter v0
  :L0
  .line 661
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->access$1000()J
    move-result-wide v3
    sub-long/2addr v1, v3
    const-wide/16 v3, 5000
    sub-long/2addr v3, v1
  .line 662
    const-wide/16 v1, 0
    cmp-long v5, v3, v1
    if-gtz v5, :L1
    const/4 v5, 0
    invoke-static { v5 }, Lcom/innioasis/ipp/BigCover;->access$1102(Z)Z
  :L1
  .line 663
    monitor-exit v0
  :L2
  .line 664
    cmp-long v0, v3, v1
    if-lez v0, :L3
  .line 665
    invoke-static { p0, v3, v4 }, Lcom/innioasis/ipp/Albums;->later(Ljava/lang/Runnable;J)V
  .line 666
    return-void
  :L3
  .line 668
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->access$1200()V
  .line 669
    return-void
  :L4
  .line 663
    move-exception v1
  :L5
    monitor-exit v0
  :L6
    throw v1
.end method
