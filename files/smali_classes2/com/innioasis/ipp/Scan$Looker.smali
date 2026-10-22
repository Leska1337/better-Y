.class final Lcom/innioasis/ipp/Scan$Looker;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Scan.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Scan;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Looker"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 305
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .catchall { :L1 .. :L2 } :L13
  .catchall { :L2 .. :L6 } :L10
  .catchall { :L7 .. :L8 } :L13
  .catchall { :L11 .. :L12 } :L10
  .catchall { :L12 .. :L13 } :L13
  .catchall { :L14 .. :L16 } :L15
  .registers 10
  .line 310
    nop
  :L0
    const/4 v0, 0
  :L1
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$400()Ljava/util/LinkedList;
    move-result-object v1
    monitor-enter v1
  :L2
  .line 311
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    const-wide/16 v4, 5000
    add-long/2addr v2, v4
  :L3
  .line 312
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$400()Ljava/util/LinkedList;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/util/LinkedList;->isEmpty()Z
    move-result v4
    if-eqz v4, :L5
  .line 313
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
    sub-long v4, v2, v4
  .line 314
    const-wide/16 v6, 0
    cmp-long v8, v4, v6
    if-gtz v8, :L4
  .line 315
    invoke-static { v0 }, Lcom/innioasis/ipp/Scan;->access$502(Z)Z
  .line 316
    monitor-exit v1
    return-void
  :L4
  .line 318
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$400()Ljava/util/LinkedList;
    move-result-object v6
    invoke-virtual { v6, v4, v5 }, Ljava/lang/Object;->wait(J)V
  .line 319
    goto :L3
  :L5
  .line 320
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$400()Ljava/util/LinkedList;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, [Ljava/io/File;
  .line 321
    monitor-exit v1
  :L6
  .line 322
    const/4 v1, 0
  :L7
    array-length v3, v2
    if-ge v1, v3, :L9
    aget-object v3, v2, v1
    invoke-virtual { v3 }, Ljava/io/File;->isFile()Z
  :L8
    add-int/lit8 v1, v1, 1
    goto :L7
  :L9
  .line 323
    goto :L0
  :L10
  .line 321
    move-exception v2
  :L11
    monitor-exit v1
  :L12
    throw v2
  :L13
  .line 324
    move-exception v1
  .line 325
    invoke-static { }, Lcom/innioasis/ipp/Scan;->access$400()Ljava/util/LinkedList;
    move-result-object v1
    monitor-enter v1
  :L14
  .line 326
    invoke-static { v0 }, Lcom/innioasis/ipp/Scan;->access$502(Z)Z
  .line 327
    monitor-exit v1
  .line 329
    return-void
  :L15
  .line 327
    move-exception v0
    monitor-exit v1
  :L16
    goto :L18
  :L17
    throw v0
  :L18
    goto :L17
.end method
