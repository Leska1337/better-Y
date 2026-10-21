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
  .line 532
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static claim()Ljava/io/File;
  .registers 3
  .line 582
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$800()[Ljava/io/File;
    move-result-object v0
    const/4 v1, 0
    if-eqz v0, :L3
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$400()Ljava/lang/String;
    move-result-object v0
    if-nez v0, :L0
    goto :L3
  :L0
  .line 583
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
  .line 584
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$900()I
    move-result v0
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$800()[Ljava/io/File;
    move-result-object v2
    array-length v2, v2
    if-lt v0, v2, :L2
    return-object v1
  :L2
  .line 585
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$800()[Ljava/io/File;
    move-result-object v0
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$908()I
    move-result v1
    aget-object v0, v0, v1
  .line 586
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$600()Ljava/util/HashSet;
    move-result-object v1
    invoke-virtual { v0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  .line 587
    return-object v0
  :L3
  .line 582
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
  .line 540
    nop
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$200()Ljava/lang/Object;
    move-result-object v0
    monitor-enter v0
  :L1
  .line 541
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    const-wide/16 v3, 5000
    add-long/2addr v1, v3
  :L2
  .line 543
    invoke-static { }, Lcom/innioasis/ipp/Scan$Builder;->claim()Ljava/io/File;
    move-result-object v3
  .line 544
    if-eqz v3, :L13
  .line 552
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$400()Ljava/lang/String;
    move-result-object v1
  .line 553
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$500()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v2
  .line 554
    monitor-exit v0
  :L3
  .line 556
    nop
  .line 559
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
  .line 562
    goto :L8
  :L7
  .line 560
    move-exception v2
  .line 561
    nop
  :L8
  .line 564
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$200()Ljava/lang/Object;
    move-result-object v2
    monitor-enter v2
  :L9
  .line 565
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$600()Ljava/util/HashSet;
    move-result-object v4
    invoke-virtual { v3 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v4, v5 }, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z
  .line 566
    if-eqz v0, :L10
    if-eqz v1, :L10
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$400()Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v1, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L10
  .line 567
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$700()Ljava/util/HashMap;
    move-result-object v1
    invoke-virtual { v3 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v1, v3, v0 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L10
  .line 569
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$200()Ljava/lang/Object;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/Object;->notifyAll()V
  .line 570
    monitor-exit v2
  .line 571
    goto :L0
  :L11
  .line 570
    move-exception v0
    monitor-exit v2
  :L12
    throw v0
  :L13
  .line 545
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
    sub-long v3, v1, v3
  .line 546
    const-wide/16 v5, 0
    cmp-long v7, v3, v5
    if-gtz v7, :L14
  .line 547
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$310()I
  .line 548
    monitor-exit v0
    return-void
  :L14
  .line 550
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$200()Ljava/lang/Object;
    move-result-object v5
    invoke-virtual { v5, v3, v4 }, Ljava/lang/Object;->wait(J)V
  .line 551
    goto :L2
  :L15
  .line 554
    move-exception v1
    monitor-exit v0
  :L16
    throw v1
  :L17
  .line 572
    move-exception v0
  .line 573
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$200()Ljava/lang/Object;
    move-result-object v0
    monitor-enter v0
  :L18
  .line 574
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$310()I
  .line 575
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$200()Ljava/lang/Object;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/Object;->notifyAll()V
  .line 576
    monitor-exit v0
  .line 578
    return-void
  :L19
  .line 576
    move-exception v1
    monitor-exit v0
  :L20
    goto :L22
  :L21
    throw v1
  :L22
    goto :L21
.end method
