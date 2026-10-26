.class final Lcom/innioasis/ipp/AlbumInfo$Save;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "AlbumInfo.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/AlbumInfo;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Save"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 135
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L2 } :L3
  .catchall { :L4 .. :L5 } :L3
  .registers 7
  .line 137
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->access$000()Ljava/util/Hashtable;
    move-result-object v0
    monitor-enter v0
  :L0
  .line 138
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->access$100()J
    move-result-wide v3
    sub-long/2addr v1, v3
  .line 139
    const-wide/16 v3, 5000
    cmp-long v5, v1, v3
    if-gez v5, :L1
  .line 140
    sub-long/2addr v3, v1
    invoke-static { p0, v3, v4 }, Lcom/innioasis/ipp/Albums;->later(Ljava/lang/Runnable;J)V
  .line 141
    monitor-exit v0
    return-void
  :L1
  .line 143
    const/4 v1, 0
    invoke-static { v1 }, Lcom/innioasis/ipp/AlbumInfo;->access$202(Z)Z
  .line 144
    monitor-exit v0
  :L2
  .line 145
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->access$300()V
  .line 146
    return-void
  :L3
  .line 144
    move-exception v1
  :L4
    monitor-exit v0
  :L5
    throw v1
.end method
