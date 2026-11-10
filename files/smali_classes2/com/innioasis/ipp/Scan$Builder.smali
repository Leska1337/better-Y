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
  .line 958
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static claim()Ljava/io/File;
  .registers 3
  .line 1008
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$800()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 1009
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$1200()I
    move-result v0
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$1300()I
    move-result v2
    if-ge v0, v2, :L1
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$1300()I
    move-result v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Scan;->access$1202(I)I
  :L1
  .line 1010
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
  .line 1011
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$1400()Ljava/util/ArrayList;
    move-result-object v0
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$1208()I
    move-result v2
    invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ljava/io/File;
  .line 1012
    if-nez v0, :L2
    goto :L1
  :L2
  .line 1013
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$900()Ljava/util/HashSet;
    move-result-object v1
    invoke-virtual { v0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  .line 1014
    return-object v0
  :L3
  .line 1016
    return-object v1
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L17
  .catchall { :L1 .. :L3 } :L15
  .catchall { :L4 .. :L5 } :L6
  .catchall { :L8 .. :L9 } :L17
  .catchall { :L9 .. :L12 } :L11
  .catchall { :L12 .. :L13 } :L17
  .catchall { :L13 .. :L16 } :L15
  .catchall { :L16 .. :L17 } :L17
  .catchall { :L18 .. :L20 } :L19
  .registers 9
  .line 965
    nop
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$600()Ljava/lang/Object;
    move-result-object v0
    monitor-enter v0
  :L1
  .line 966
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    const-wide/16 v3, 5000
    add-long/2addr v1, v3
  :L2
  .line 968
    invoke-static { }, Lcom/innioasis/ipp/Scan$Builder;->claim()Ljava/io/File;
    move-result-object v3
  .line 969
    if-eqz v3, :L13
  .line 977
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$800()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v1
  .line 978
    monitor-exit v0
  :L3
  .line 980
    nop
  .line 984
    const/4 v0, 0
    if-eqz v1, :L7
  :L4
    invoke-virtual { v3 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Scan;->inDb(Ljava/lang/String;)Z
    move-result v2
    if-nez v2, :L7
    invoke-virtual { v3 }, Ljava/io/File;->isFile()Z
    move-result v2
    if-eqz v2, :L7
  .line 985
    invoke-virtual { v1, v3 }, Lcom/innioasis/y1/database/Y1Repository;->fileToSong(Ljava/io/File;)Lcom/innioasis/y1/database/Song;
    move-result-object v0
  :L5
    goto :L7
  :L6
  .line 987
    move-exception v1
  .line 988
    goto :L8
  :L7
  .line 989
    nop
  :L8
  .line 991
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$600()Ljava/lang/Object;
    move-result-object v1
    monitor-enter v1
  :L9
  .line 992
    invoke-virtual { v3 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v2
  .line 993
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$900()Ljava/util/HashSet;
    move-result-object v3
    invoke-virtual { v3, v2 }, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z
  .line 994
    if-eqz v0, :L10
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$1000()Ljava/util/HashMap;
    move-result-object v3
    invoke-virtual { v3, v2 }, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L10
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$1100()Ljava/util/HashMap;
    move-result-object v3
    invoke-virtual { v3, v2, v0 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L10
  .line 995
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$600()Ljava/lang/Object;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/Object;->notifyAll()V
  .line 996
    monitor-exit v1
  .line 997
    goto :L0
  :L11
  .line 996
    move-exception v0
    monitor-exit v1
  :L12
    throw v0
  :L13
  .line 970
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
    sub-long v3, v1, v3
  .line 971
    const-wide/16 v5, 0
    cmp-long v7, v3, v5
    if-gtz v7, :L14
  .line 972
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$710()I
  .line 973
    monitor-exit v0
    return-void
  :L14
  .line 975
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$600()Ljava/lang/Object;
    move-result-object v5
    invoke-virtual { v5, v3, v4 }, Ljava/lang/Object;->wait(J)V
  .line 976
    goto :L2
  :L15
  .line 978
    move-exception v1
    monitor-exit v0
  :L16
    throw v1
  :L17
  .line 998
    move-exception v0
  .line 999
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$600()Ljava/lang/Object;
    move-result-object v0
    monitor-enter v0
  :L18
  .line 1000
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$710()I
  .line 1001
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$600()Ljava/lang/Object;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/Object;->notifyAll()V
  .line 1002
    monitor-exit v0
  .line 1004
    return-void
  :L19
  .line 1002
    move-exception v1
    monitor-exit v0
  :L20
    goto :L22
  :L21
    throw v1
  :L22
    goto :L21
.end method
