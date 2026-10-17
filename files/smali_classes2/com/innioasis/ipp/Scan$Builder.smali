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
  .line 236
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static claim()Ljava/io/File;
  .registers 3
  .line 286
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$600()[Ljava/io/File;
    move-result-object v0
    const/4 v1, 0
    if-eqz v0, :L3
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$200()Ljava/lang/String;
    move-result-object v0
    if-nez v0, :L0
    goto :L3
  :L0
  .line 287
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
  .line 288
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$700()I
    move-result v0
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$600()[Ljava/io/File;
    move-result-object v2
    array-length v2, v2
    if-lt v0, v2, :L2
    return-object v1
  :L2
  .line 289
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$600()[Ljava/io/File;
    move-result-object v0
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$708()I
    move-result v1
    aget-object v0, v0, v1
  .line 290
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$400()Ljava/util/HashSet;
    move-result-object v1
    invoke-virtual { v0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  .line 291
    return-object v0
  :L3
  .line 286
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
  .line 244
    nop
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$000()Ljava/lang/Object;
    move-result-object v0
    monitor-enter v0
  :L1
  .line 245
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    const-wide/16 v3, 5000
    add-long/2addr v1, v3
  :L2
  .line 247
    invoke-static { }, Lcom/innioasis/ipp/Scan$Builder;->claim()Ljava/io/File;
    move-result-object v3
  .line 248
    if-eqz v3, :L12
  .line 256
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$200()Ljava/lang/String;
    move-result-object v1
  .line 257
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$300()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v2
  .line 258
    monitor-exit v0
  :L3
  .line 260
    nop
  .line 263
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
  .line 266
    goto :L7
  :L6
  .line 264
    move-exception v2
  .line 265
    nop
  :L7
  .line 268
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$000()Ljava/lang/Object;
    move-result-object v2
    monitor-enter v2
  :L8
  .line 269
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$400()Ljava/util/HashSet;
    move-result-object v4
    invoke-virtual { v3 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v4, v5 }, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z
  .line 270
    if-eqz v0, :L9
    if-eqz v1, :L9
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$200()Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v1, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L9
  .line 271
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$500()Ljava/util/HashMap;
    move-result-object v1
    invoke-virtual { v3 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v1, v3, v0 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L9
  .line 273
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$000()Ljava/lang/Object;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/Object;->notifyAll()V
  .line 274
    monitor-exit v2
  .line 275
    goto :L0
  :L10
  .line 274
    move-exception v0
    monitor-exit v2
  :L11
    throw v0
  :L12
  .line 249
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
    sub-long v3, v1, v3
  .line 250
    const-wide/16 v5, 0
    cmp-long v7, v3, v5
    if-gtz v7, :L13
  .line 251
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$110()I
  .line 252
    monitor-exit v0
    return-void
  :L13
  .line 254
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$000()Ljava/lang/Object;
    move-result-object v5
    invoke-virtual { v5, v3, v4 }, Ljava/lang/Object;->wait(J)V
  .line 255
    goto :L2
  :L14
  .line 258
    move-exception v1
    monitor-exit v0
  :L15
    throw v1
  :L16
  .line 276
    move-exception v0
  .line 277
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$000()Ljava/lang/Object;
    move-result-object v0
    monitor-enter v0
  :L17
  .line 278
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$110()I
  .line 279
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$000()Ljava/lang/Object;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/Object;->notifyAll()V
  .line 280
    monitor-exit v0
  .line 282
    return-void
  :L18
  .line 280
    move-exception v1
    monitor-exit v0
  :L19
    goto :L21
  :L20
    throw v1
  :L21
    goto :L20
.end method
