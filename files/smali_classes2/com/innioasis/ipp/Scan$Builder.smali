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
  .line 674
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static claim()Ljava/io/File;
  .registers 3
  .line 724
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$800()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 725
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$1200()I
    move-result v0
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$1300()I
    move-result v2
    if-ge v0, v2, :L1
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$1300()I
    move-result v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Scan;->access$1202(I)I
  :L1
  .line 726
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$1200()I
    move-result v0
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$1400()Ljava/util/ArrayList;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/util/ArrayList;->size()I
    move-result v2
    if-ge v0, v2, :L3
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$1100()Ljava/util/HashMap;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/util/HashMap;->size()I
    move-result v0
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$900()Ljava/util/HashSet;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/util/HashSet;->size()I
    move-result v2
    add-int/2addr v0, v2
    const/4 v2, 6
    if-ge v0, v2, :L3
  .line 727
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$1400()Ljava/util/ArrayList;
    move-result-object v0
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$1208()I
    move-result v2
    invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ljava/io/File;
  .line 728
    if-nez v0, :L2
    goto :L1
  :L2
  .line 729
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$900()Ljava/util/HashSet;
    move-result-object v1
    invoke-virtual { v0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  .line 730
    return-object v0
  :L3
  .line 732
    return-object v1
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L18
  .catchall { :L1 .. :L3 } :L16
  .catchall { :L4 .. :L6 } :L7
  .catchall { :L9 .. :L10 } :L18
  .catchall { :L10 .. :L13 } :L12
  .catchall { :L13 .. :L14 } :L18
  .catchall { :L14 .. :L17 } :L16
  .catchall { :L17 .. :L18 } :L18
  .catchall { :L19 .. :L21 } :L20
  .registers 9
  .line 681
    nop
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$600()Ljava/lang/Object;
    move-result-object v0
    monitor-enter v0
  :L1
  .line 682
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    const-wide/16 v3, 5000
    add-long/2addr v1, v3
  :L2
  .line 684
    invoke-static { }, Lcom/innioasis/ipp/Scan$Builder;->claim()Ljava/io/File;
    move-result-object v3
  .line 685
    if-eqz v3, :L14
  .line 693
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$800()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v1
  .line 694
    monitor-exit v0
  :L3
  .line 696
    nop
  .line 700
    const/4 v0, 0
    if-eqz v1, :L8
  :L4
    sget-boolean v2, Lcom/innioasis/ipp/ScanProbe;->force:Z
    if-nez v2, :L5
    invoke-virtual { v3 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Scan;->inDb(Ljava/lang/String;)Z
    move-result v2
    if-nez v2, :L8
  :L5
    invoke-virtual { v3 }, Ljava/io/File;->isFile()Z
    move-result v2
    if-eqz v2, :L8
  .line 701
    invoke-virtual { v1, v3 }, Lcom/innioasis/y1/database/Y1Repository;->fileToSong(Ljava/io/File;)Lcom/innioasis/y1/database/Song;
    move-result-object v0
  :L6
    goto :L8
  :L7
  .line 703
    move-exception v1
  .line 704
    goto :L9
  :L8
  .line 705
    nop
  :L9
  .line 707
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$600()Ljava/lang/Object;
    move-result-object v1
    monitor-enter v1
  :L10
  .line 708
    invoke-virtual { v3 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v2
  .line 709
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$900()Ljava/util/HashSet;
    move-result-object v3
    invoke-virtual { v3, v2 }, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z
  .line 710
    if-eqz v0, :L11
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$1000()Ljava/util/HashMap;
    move-result-object v3
    invoke-virtual { v3, v2 }, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L11
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$1100()Ljava/util/HashMap;
    move-result-object v3
    invoke-virtual { v3, v2, v0 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L11
  .line 711
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$600()Ljava/lang/Object;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/Object;->notifyAll()V
  .line 712
    monitor-exit v1
  .line 713
    goto :L0
  :L12
  .line 712
    move-exception v0
    monitor-exit v1
  :L13
    throw v0
  :L14
  .line 686
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
    sub-long v3, v1, v3
  .line 687
    const-wide/16 v5, 0
    cmp-long v7, v3, v5
    if-gtz v7, :L15
  .line 688
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$710()I
  .line 689
    monitor-exit v0
    return-void
  :L15
  .line 691
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$600()Ljava/lang/Object;
    move-result-object v5
    invoke-virtual { v5, v3, v4 }, Ljava/lang/Object;->wait(J)V
  .line 692
    goto :L2
  :L16
  .line 694
    move-exception v1
    monitor-exit v0
  :L17
    throw v1
  :L18
  .line 714
    move-exception v0
  .line 715
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$600()Ljava/lang/Object;
    move-result-object v0
    monitor-enter v0
  :L19
  .line 716
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$710()I
  .line 717
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$600()Ljava/lang/Object;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/Object;->notifyAll()V
  .line 718
    monitor-exit v0
  .line 720
    return-void
  :L20
  .line 718
    move-exception v1
    monitor-exit v0
  :L21
    goto :L23
  :L22
    throw v1
  :L23
    goto :L22
.end method
