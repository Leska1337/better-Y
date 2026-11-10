.class final Lcom/innioasis/ipp/CoverCache$Save;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "CoverCache.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/CoverCache;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Save"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 193
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L2 } :L3
  .catchall { :L4 .. :L5 } :L3
  .registers 7
  .line 195
    invoke-static { }, Lcom/innioasis/ipp/CoverCache;->access$000()Ljava/lang/Object;
    move-result-object v0
    monitor-enter v0
  :L0
  .line 196
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    invoke-static { }, Lcom/innioasis/ipp/CoverCache;->access$100()J
    move-result-wide v3
    sub-long/2addr v1, v3
  .line 197
    const-wide/16 v3, 5000
    cmp-long v5, v1, v3
    if-gez v5, :L1
  .line 198
    sub-long/2addr v3, v1
    invoke-static { p0, v3, v4 }, Lcom/innioasis/ipp/Albums;->later(Ljava/lang/Runnable;J)V
  .line 199
    monitor-exit v0
    return-void
  :L1
  .line 201
    const/4 v1, 0
    invoke-static { v1 }, Lcom/innioasis/ipp/CoverCache;->access$202(Z)Z
  .line 202
    monitor-exit v0
  :L2
  .line 203
    invoke-static { }, Lcom/innioasis/ipp/CoverCache;->access$300()V
  .line 204
    return-void
  :L3
  .line 202
    move-exception v1
  :L4
    monitor-exit v0
  :L5
    throw v1
.end method
