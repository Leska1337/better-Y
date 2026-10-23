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
  .line 1685
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1686
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;->task:Lcom/innioasis/y1/activity/IppActivity$CacheTask;
  .line 1687
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;->jobs:Ljava/util/List;
  .line 1688
    iput-object p3, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Blocks;
  .line 1689
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L2
  .catchall { :L5 .. :L6 } :L7
  .registers 6
  .line 1692
    const/4 v0, 5
  :L0
    invoke-static { v0 }, Landroid/os/Process;->setThreadPriority(I)V
  :L1
    goto :L3
  :L2
    move-exception v0
  :L3
  .line 1694
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Blocks;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->take()I
    move-result v0
    if-ltz v0, :L9
  .line 1695
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Blocks;
    invoke-virtual { v1, v0 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->from(I)I
    move-result v1
  :L4
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Blocks;
    invoke-virtual { v2, v0 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->to(I)I
    move-result v2
    if-ge v1, v2, :L3
  .line 1696
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;->jobs:Ljava/util/List;
    invoke-interface { v2, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;
  .line 1697
    iget-boolean v3, v2, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->thumb:Z
    if-eqz v3, :L5
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;->task:Lcom/innioasis/y1/activity/IppActivity$CacheTask;
    iget-object v4, v2, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->key:Ljava/lang/String;
    invoke-virtual { v3, v4 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touch(Ljava/lang/String;)V
  :L5
  .line 1699
    invoke-static { v2 }, Lcom/innioasis/y1/activity/IppActivity;->access$800(Lcom/innioasis/y1/activity/IppActivity$AlbumJob;)V
  :L6
  .line 1701
    goto :L8
  :L7
  .line 1700
    move-exception v2
  :L8
  .line 1702
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;->task:Lcom/innioasis/y1/activity/IppActivity$CacheTask;
    invoke-virtual { v2 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tick()V
  .line 1695
    add-int/lit8 v1, v1, 1
    goto :L4
  :L9
  .line 1705
    return-void
.end method
