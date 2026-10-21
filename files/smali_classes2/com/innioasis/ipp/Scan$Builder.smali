.class final Lcom/innioasis/ipp/Scan$Builder;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Scan.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Scan;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Builder"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 484
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static claim()Ljava/io/File;
  .registers 3
  .line 534
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$800()[Ljava/io/File;
    move-result-object v0
    const/4 v1, 0
    if-eqz v0, :L3
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$400()Ljava/lang/String;
    move-result-object v0
    if-nez v0, :L0
    goto :L3
  :L0
  .line 535
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$700()Ljava/util/HashMap;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/util/HashMap;->size()I
    move-result v0
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$600()Ljava/util/HashSet;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/util/HashSet;->size()I
    move-result v2
    add-int/2addr v0, v2
    const/4 v2, 4
    if-lt v0, v2, :L1
    return-object v1
  :L1
  .line 536
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$900()I
    move-result v0
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$800()[Ljava/io/File;
    move-result-object v2
    array-length v2, v2
    if-lt v0, v2, :L2
    return-object v1
  :L2
  .line 537
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$800()[Ljava/io/File;
    move-result-object v0
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$908()I
    move-result v1
    aget-object v0, v0, v1
  .line 538
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$600()Ljava/util/HashSet;
    move-result-object v1
    invoke-virtual { v0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  .line 539
    return-object v0
  :L3
  .line 534
    return-object v1
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L17
  .catchall { :L1 .. :L3 } :L15
  .catchall { :L4 .. :L6 } :L7
  .catchall { :L8 .. :L9 } :L17
  .catchall { :L9 .. :L12 } :L11
  .catchall { :L12 .. :L13 } :L17
  .catchall { :L13 .. :L16 } :L15
  .catchall { :L16 .. :L17 } :L17
  .catchall { :L18 .. :L20 } :L19
  .registers 9
  .line 492
    nop
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$200()Ljava/lang/Object;
    move-result-object v0
    monitor-enter v0
  :L1
  .line 493
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    const-wide/16 v3, 5000
    add-long/2addr v1, v3
  :L2
  .line 495
    invoke-static { }, Lcom/innioasis/ipp/Scan$Builder;->claim()Ljava/io/File;
    move-result-object v3
  .line 496
    if-eqz v3, :L13
  .line 504
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$400()Ljava/lang/String;
    move-result-object v1
  .line 505
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$500()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v2
  .line 506
    monitor-exit v0
  :L3
  .line 508
    nop
  .line 511
    const/4 v0, 0
  :L4
    sget-boolean v4, Lcom/innioasis/ipp/ScanProbe;->force:Z
    if-nez v4, :L5
    invoke-virtual { v3 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v4
    invoke-static { v4 }, Lcom/innioasis/ipp/Scan;->inDb(Ljava/lang/String;)Z
    move-result v4
    if-nez v4, :L6
  :L5
    invoke-virtual { v2, v3 }, Lcom/innioasis/y1/database/Y1Repository;->fileToSong(Ljava/io/File;)Lcom/innioasis/y1/database/Song;
    move-result-object v0
  :L6
  .line 514
    goto :L8
  :L7
  .line 512
    move-exception v2
  .line 513
    nop
  :L8
  .line 516
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$200()Ljava/lang/Object;
    move-result-object v2
    monitor-enter v2
  :L9
  .line 517
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$600()Ljava/util/HashSet;
    move-result-object v4
    invoke-virtual { v3 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v4, v5 }, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z
  .line 518
    if-eqz v0, :L10
    if-eqz v1, :L10
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$400()Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v1, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L10
  .line 519
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$700()Ljava/util/HashMap;
    move-result-object v1
    invoke-virtual { v3 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v1, v3, v0 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L10
  .line 521
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$200()Ljava/lang/Object;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/Object;->notifyAll()V
  .line 522
    monitor-exit v2
  .line 523
    goto :L0
  :L11
  .line 522
    move-exception v0
    monitor-exit v2
  :L12
    throw v0
  :L13
  .line 497
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
    sub-long v3, v1, v3
  .line 498
    const-wide/16 v5, 0
    cmp-long v7, v3, v5
    if-gtz v7, :L14
  .line 499
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$310()I
  .line 500
    monitor-exit v0
    return-void
  :L14
  .line 502
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$200()Ljava/lang/Object;
    move-result-object v5
    invoke-virtual { v5, v3, v4 }, Ljava/lang/Object;->wait(J)V
  .line 503
    goto :L2
  :L15
  .line 506
    move-exception v1
    monitor-exit v0
  :L16
    throw v1
  :L17
  .line 524
    move-exception v0
  .line 525
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$200()Ljava/lang/Object;
    move-result-object v0
    monitor-enter v0
  :L18
  .line 526
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$310()I
  .line 527
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$200()Ljava/lang/Object;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/Object;->notifyAll()V
  .line 528
    monitor-exit v0
  .line 530
    return-void
  :L19
  .line 528
    move-exception v1
    monitor-exit v0
  :L20
    goto :L22
  :L21
    throw v1
  :L22
    goto :L21
.end method
