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
  .line 299
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static claim()Ljava/io/File;
  .registers 3
  .line 350
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$600()[Ljava/io/File;
    move-result-object v0
    const/4 v1, 0
    if-eqz v0, :L3
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$200()Ljava/lang/String;
    move-result-object v0
    if-nez v0, :L0
    goto :L3
  :L0
  .line 351
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$500()Ljava/util/HashMap;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/util/HashMap;->size()I
    move-result v0
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$400()Ljava/util/HashSet;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/util/HashSet;->size()I
    move-result v2
    add-int/2addr v0, v2
    const/4 v2, 4
    if-lt v0, v2, :L1
    return-object v1
  :L1
  .line 352
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$700()I
    move-result v0
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$600()[Ljava/io/File;
    move-result-object v2
    array-length v2, v2
    if-lt v0, v2, :L2
    return-object v1
  :L2
  .line 353
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$600()[Ljava/io/File;
    move-result-object v0
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$708()I
    move-result v1
    aget-object v0, v0, v1
  .line 354
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$400()Ljava/util/HashSet;
    move-result-object v1
    invoke-virtual { v0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  .line 355
    return-object v0
  :L3
  .line 350
    return-object v1
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L16
  .catchall { :L1 .. :L3 } :L14
  .catchall { :L4 .. :L5 } :L6
  .catchall { :L7 .. :L8 } :L16
  .catchall { :L8 .. :L11 } :L10
  .catchall { :L11 .. :L12 } :L16
  .catchall { :L12 .. :L15 } :L14
  .catchall { :L15 .. :L16 } :L16
  .catchall { :L17 .. :L19 } :L18
  .registers 9
  .line 307
    nop
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$000()Ljava/lang/Object;
    move-result-object v0
    monitor-enter v0
  :L1
  .line 308
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    const-wide/16 v3, 5000
    add-long/2addr v1, v3
  :L2
  .line 310
    invoke-static { }, Lcom/innioasis/ipp/Scan$Builder;->claim()Ljava/io/File;
    move-result-object v3
  .line 311
    if-eqz v3, :L12
  .line 319
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$200()Ljava/lang/String;
    move-result-object v1
  .line 320
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$300()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v2
  .line 321
    monitor-exit v0
  :L3
  .line 323
    nop
  .line 327
    const/4 v0, 0
  :L4
    invoke-virtual { v3 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v4
    invoke-static { v4 }, Lcom/innioasis/ipp/Scan;->inDb(Ljava/lang/String;)Z
    move-result v4
    if-nez v4, :L5
    invoke-virtual { v2, v3 }, Lcom/innioasis/y1/database/Y1Repository;->fileToSong(Ljava/io/File;)Lcom/innioasis/y1/database/Song;
    move-result-object v0
  :L5
  .line 330
    goto :L7
  :L6
  .line 328
    move-exception v2
  .line 329
    nop
  :L7
  .line 332
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$000()Ljava/lang/Object;
    move-result-object v2
    monitor-enter v2
  :L8
  .line 333
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$400()Ljava/util/HashSet;
    move-result-object v4
    invoke-virtual { v3 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v4, v5 }, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z
  .line 334
    if-eqz v0, :L9
    if-eqz v1, :L9
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$200()Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v1, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L9
  .line 335
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$500()Ljava/util/HashMap;
    move-result-object v1
    invoke-virtual { v3 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v1, v3, v0 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L9
  .line 337
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$000()Ljava/lang/Object;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/Object;->notifyAll()V
  .line 338
    monitor-exit v2
  .line 339
    goto :L0
  :L10
  .line 338
    move-exception v0
    monitor-exit v2
  :L11
    throw v0
  :L12
  .line 312
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
    sub-long v3, v1, v3
  .line 313
    const-wide/16 v5, 0
    cmp-long v7, v3, v5
    if-gtz v7, :L13
  .line 314
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$110()I
  .line 315
    monitor-exit v0
    return-void
  :L13
  .line 317
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$000()Ljava/lang/Object;
    move-result-object v5
    invoke-virtual { v5, v3, v4 }, Ljava/lang/Object;->wait(J)V
  .line 318
    goto :L2
  :L14
  .line 321
    move-exception v1
    monitor-exit v0
  :L15
    throw v1
  :L16
  .line 340
    move-exception v0
  .line 341
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$000()Ljava/lang/Object;
    move-result-object v0
    monitor-enter v0
  :L17
  .line 342
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$110()I
  .line 343
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$000()Ljava/lang/Object;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/Object;->notifyAll()V
  .line 344
    monitor-exit v0
  .line 346
    return-void
  :L18
  .line 344
    move-exception v1
    monitor-exit v0
  :L19
    goto :L21
  :L20
    throw v1
  :L21
    goto :L20
.end method
