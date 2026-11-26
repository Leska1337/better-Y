.class final Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "AlbumWorker"
.end annotation

.field private final jobs:Ljava/util/List;

.field private final q:Lcom/innioasis/y1/activity/IppActivity$Blocks;

.field private final task:Lcom/innioasis/y1/activity/IppActivity$CacheTask;

.method constructor <init>(Lcom/innioasis/y1/activity/IppActivity$CacheTask;Ljava/util/List;Lcom/innioasis/y1/activity/IppActivity$Blocks;)V
  .registers 4
  .line 1909
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1910
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;->task:Lcom/innioasis/y1/activity/IppActivity$CacheTask;
  .line 1911
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;->jobs:Ljava/util/List;
  .line 1912
    iput-object p3, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Blocks;
  .line 1913
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L2
  .catchall { :L5 .. :L6 } :L7
  .registers 6
  .line 1916
    const/4 v0, 5
  :L0
    invoke-static { v0 }, Landroid/os/Process;->setThreadPriority(I)V
  :L1
    goto :L3
  :L2
    move-exception v0
  :L3
  .line 1918
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Blocks;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->take()I
    move-result v0
    if-ltz v0, :L11
  .line 1919
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Blocks;
    invoke-virtual { v1, v0 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->from(I)I
    move-result v1
  :L4
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Blocks;
    invoke-virtual { v2, v0 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->to(I)I
    move-result v2
    if-ge v1, v2, :L3
  .line 1920
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;->jobs:Ljava/util/List;
    invoke-interface { v2, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;
  .line 1921
    iget-boolean v3, v2, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->thumb:Z
    if-eqz v3, :L5
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;->task:Lcom/innioasis/y1/activity/IppActivity$CacheTask;
    iget-object v4, v2, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->key:Ljava/lang/String;
    invoke-virtual { v3, v4 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touch(Ljava/lang/String;)V
  :L5
  .line 1923
    invoke-static { v2 }, Lcom/innioasis/y1/activity/IppActivity;->access$800(Lcom/innioasis/y1/activity/IppActivity$AlbumJob;)V
  :L6
  .line 1925
    goto :L8
  :L7
  .line 1924
    move-exception v3
  :L8
  .line 1926
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;->task:Lcom/innioasis/y1/activity/IppActivity$CacheTask;
    iget-boolean v4, v2, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->thumb:Z
    if-eqz v4, :L9
    iget-boolean v2, v2, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->art:Z
    if-nez v2, :L9
    const/16 v2, 9
    goto :L10
  :L9
    const/4 v2, 0
  :L10
    invoke-virtual { v3, v2 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tick(I)V
  .line 1919
    add-int/lit8 v1, v1, 1
    goto :L4
  :L11
  .line 1929
    return-void
.end method
