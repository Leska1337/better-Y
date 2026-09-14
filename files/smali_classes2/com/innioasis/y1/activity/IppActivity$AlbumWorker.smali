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
  .line 1377
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1378
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;->task:Lcom/innioasis/y1/activity/IppActivity$CacheTask;
  .line 1379
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;->jobs:Ljava/util/List;
  .line 1380
    iput-object p3, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Blocks;
  .line 1381
    return-void
.end method

.method public run()V
  .catchall { :L2 .. :L3 } :L4
  .registers 4
  .line 1385
    nop
  :L0
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Blocks;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->take()I
    move-result v0
    if-ltz v0, :L6
  .line 1386
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Blocks;
    invoke-virtual { v1, v0 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->from(I)I
    move-result v1
  :L1
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Blocks;
    invoke-virtual { v2, v0 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->to(I)I
    move-result v2
    if-ge v1, v2, :L0
  :L2
  .line 1388
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;->jobs:Ljava/util/List;
    invoke-interface { v2, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;
    invoke-static { v2 }, Lcom/innioasis/y1/activity/IppActivity;->access$800(Lcom/innioasis/y1/activity/IppActivity$AlbumJob;)V
  :L3
  .line 1391
    goto :L5
  :L4
  .line 1389
    move-exception v2
  :L5
  .line 1392
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;->task:Lcom/innioasis/y1/activity/IppActivity$CacheTask;
    invoke-virtual { v2 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tick()V
  .line 1386
    add-int/lit8 v1, v1, 1
    goto :L1
  :L6
  .line 1395
    return-void
.end method
