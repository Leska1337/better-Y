.class final Lcom/innioasis/y1/activity/IppActivity$SongWorker;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "SongWorker"
.end annotation

.field private final byPath:Ljava/util/List;

.field private final covers:Z

.field private final paths:Ljava/util/ArrayList;

.field private final q:Lcom/innioasis/y1/activity/IppActivity$Blocks;

.field private final read:Ljava/util/ArrayList;

.field private final tags:Z

.field private final task:Lcom/innioasis/y1/activity/IppActivity$CacheTask;

.method constructor <init>(Lcom/innioasis/y1/activity/IppActivity$CacheTask;Ljava/util/List;Lcom/innioasis/y1/activity/IppActivity$Blocks;ZZ)V
  .registers 7
  .line 1469
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1466
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->paths:Ljava/util/ArrayList;
  .line 1467
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->read:Ljava/util/ArrayList;
  .line 1470
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->task:Lcom/innioasis/y1/activity/IppActivity$CacheTask;
  .line 1471
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->byPath:Ljava/util/List;
  .line 1472
    iput-object p3, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Blocks;
  .line 1473
    iput-boolean p4, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->tags:Z
  .line 1474
    iput-boolean p5, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->covers:Z
  .line 1475
    return-void
.end method

.method private one(Lcom/innioasis/ipp/BigCover$Walk;Lcom/innioasis/y1/database/Song;)V
  .registers 7
  .line 1494
    if-eqz p2, :L8
    invoke-virtual { p2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
    if-nez v0, :L0
    goto :L8
  :L0
  .line 1495
    invoke-virtual { p2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p2
  .line 1496
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->tags:Z
    const/4 v1, 1
    const/4 v2, 0
    if-eqz v0, :L1
    invoke-static { p2 }, Lcom/innioasis/ipp/DiscCache;->known(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L1
    const/4 v0, 1
    goto :L2
  :L1
    const/4 v0, 0
  :L2
  .line 1497
    iget-boolean v3, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->covers:Z
    if-eqz v3, :L3
    invoke-static { p2 }, Lcom/innioasis/ipp/BigCover;->needs(Ljava/lang/String;)Z
    move-result v3
    if-eqz v3, :L3
    goto :L4
  :L3
    const/4 v1, 0
  :L4
  .line 1498
    if-nez v0, :L5
    if-nez v1, :L5
    return-void
  :L5
  .line 1499
    invoke-static { p2, v0, v1 }, Lcom/innioasis/ipp/DiscCache;->read(Ljava/lang/String;ZZ)Lcom/innioasis/ipp/DiscCache$Tags;
    move-result-object v2
  .line 1500
    if-eqz v1, :L6
    iget-object v1, v2, Lcom/innioasis/ipp/DiscCache$Tags;->art:[B
    invoke-static { p1, p2, v1 }, Lcom/innioasis/ipp/BigCover;->cache(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;[B)V
  :L6
  .line 1501
    if-eqz v0, :L7
  .line 1502
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->paths:Ljava/util/ArrayList;
    invoke-virtual { p1, p2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1503
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->read:Ljava/util/ArrayList;
    invoke-virtual { p1, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L7
  .line 1505
    return-void
  :L8
  .line 1494
    return-void
.end method

.method commit()V
  .registers 4
  .line 1509
    const/4 v0, 0
  :L0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->paths:Ljava/util/ArrayList;
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v1
    if-ge v0, v1, :L1
  .line 1510
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->paths:Ljava/util/ArrayList;
    invoke-virtual { v1, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/lang/String;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->read:Ljava/util/ArrayList;
    invoke-virtual { v2, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/ipp/DiscCache$Tags;
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/DiscCache;->commit(Ljava/lang/String;Lcom/innioasis/ipp/DiscCache$Tags;)V
  .line 1509
    add-int/lit8 v0, v0, 1
    goto :L0
  :L1
  .line 1512
    return-void
.end method

.method public run()V
  .catchall { :L2 .. :L3 } :L4
  .registers 5
  .line 1478
    new-instance v0, Lcom/innioasis/ipp/BigCover$Walk;
    invoke-direct { v0 }, Lcom/innioasis/ipp/BigCover$Walk;-><init>()V
  :L0
  .line 1480
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Blocks;
    invoke-virtual { v1 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->take()I
    move-result v1
    if-ltz v1, :L7
  .line 1481
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Blocks;
    invoke-virtual { v2, v1 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->from(I)I
    move-result v2
  :L1
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Blocks;
    invoke-virtual { v3, v1 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->to(I)I
    move-result v3
    if-ge v2, v3, :L6
  :L2
  .line 1483
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->byPath:Ljava/util/List;
    invoke-interface { v3, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Song;
    invoke-direct { p0, v0, v3 }, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->one(Lcom/innioasis/ipp/BigCover$Walk;Lcom/innioasis/y1/database/Song;)V
  :L3
  .line 1486
    goto :L5
  :L4
  .line 1484
    move-exception v3
  :L5
  .line 1487
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->task:Lcom/innioasis/y1/activity/IppActivity$CacheTask;
    invoke-virtual { v3 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tick()V
  .line 1481
    add-int/lit8 v2, v2, 1
    goto :L1
  :L6
  .line 1489
    invoke-virtual { v0 }, Lcom/innioasis/ipp/BigCover$Walk;->done()V
    goto :L0
  :L7
  .line 1491
    return-void
.end method
