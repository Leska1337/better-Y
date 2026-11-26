.class final Lcom/innioasis/ipp/Diag$Gc;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Diag.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Diag;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Gc"
.end annotation

.field private static lastLine:Ljava/lang/String;

.field private static running:Z

.method constructor <init>()V
  .registers 1
  .line 289
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static request()V
  .catchall { :L1 .. :L3 } :L4
  .catchall { :L5 .. :L6 } :L4
  .registers 4
  .line 294
    invoke-static { }, Lcom/innioasis/ipp/Fm;->busy()Z
    move-result v0
    if-eqz v0, :L0
    return-void
  :L0
  .line 295
    const-class v0, Lcom/innioasis/ipp/Diag$Gc;
    monitor-enter v0
  :L1
  .line 296
    sget-boolean v1, Lcom/innioasis/ipp/Diag$Gc;->running:Z
    if-eqz v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 297
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/Diag$Gc;->running:Z
  .line 298
    monitor-exit v0
  :L3
  .line 299
    new-instance v0, Ljava/lang/Thread;
    new-instance v2, Lcom/innioasis/ipp/Diag$Gc;
    invoke-direct { v2 }, Lcom/innioasis/ipp/Diag$Gc;-><init>()V
    const-string v3, "ipp-diag-gc"
    invoke-direct { v0, v2, v3 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 300
    invoke-virtual { v0, v1 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 301
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 302
    return-void
  :L4
  .line 298
    move-exception v1
  :L5
    monitor-exit v0
  :L6
    throw v1
.end method

.method public run()V
  .catchall { :L0 .. :L8 } :L13
  .catchall { :L10 .. :L12 } :L11
  .catchall { :L14 .. :L17 } :L16
  .registers 11
  .line 306
    const/16 v0, 8
    const/4 v1, 0
  :L0
    new-array v0, v0, [Ljava/lang/String;
    const-string v2, "/system/bin/logcat"
    aput-object v2, v0, v1
    const-string v2, "-d"
    const/4 v3, 1
    aput-object v2, v0, v3
    const-string v2, "-b"
    const/4 v4, 2
    aput-object v2, v0, v4
    const-string v2, "main"
    const/4 v4, 3
    aput-object v2, v0, v4
    const-string v2, "-v"
    const/4 v5, 4
    aput-object v2, v0, v5
    const-string v2, "time"
    const/4 v5, 5
    aput-object v2, v0, v5
    const-string v2, "dalvikvm:D"
    const/4 v5, 6
    aput-object v2, v0, v5
    const-string v2, "*:S"
    const/4 v5, 7
    aput-object v2, v0, v5
    const/high16 v2, 0x00040000
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Panel;->exec([Ljava/lang/String;I)Ljava/lang/String;
    move-result-object v0
  .line 308
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v5, "("
    invoke-virtual { v2, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-static { }, Landroid/os/Process;->myPid()I
    move-result v5
    invoke-virtual { v2, v5 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v5, "):"
    invoke-virtual { v2, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
  .line 309
    const-string v5, "\n"
    invoke-virtual { v0, v5 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v0
  .line 310
    new-instance v5, Ljava/util/ArrayList;
    invoke-direct { v5 }, Ljava/util/ArrayList;-><init>()V
  .line 311
    array-length v6, v0
    sub-int/2addr v6, v3
  :L1
    if-ltz v6, :L5
    invoke-interface { v5 }, Ljava/util/List;->size()I
    move-result v7
    const/16 v8, 20
    if-ge v7, v8, :L5
  .line 312
    aget-object v7, v0, v6
    invoke-virtual { v7 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v7
  .line 313
    sget-object v8, Lcom/innioasis/ipp/Diag$Gc;->lastLine:Ljava/lang/String;
    invoke-virtual { v7, v8 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v8
    if-eqz v8, :L2
    goto :L5
  :L2
  .line 315
    const-string v8, " "
    const-string v9, ""
    invoke-virtual { v7, v8, v9 }, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    move-result-object v8
    invoke-virtual { v8, v2 }, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    move-result v8
    if-ltz v8, :L4
    const-string v8, "GC_"
    invoke-virtual { v7, v8 }, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    move-result v8
    if-gez v8, :L3
    const-string v8, "WAIT_FOR_CONCURRENT_GC"
  .line 316
    invoke-virtual { v7, v8 }, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    move-result v8
    if-gez v8, :L3
    const-string v8, "Grow heap"
    invoke-virtual { v7, v8 }, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    move-result v8
    if-ltz v8, :L4
  :L3
  .line 317
    invoke-interface { v5, v1, v7 }, Ljava/util/List;->add(ILjava/lang/Object;)V
  :L4
  .line 311
    add-int/lit8 v6, v6, -1
    goto :L1
  :L5
  .line 320
    invoke-interface { v5 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-nez v0, :L6
    invoke-interface { v5 }, Ljava/util/List;->size()I
    move-result v0
    sub-int/2addr v0, v3
    invoke-interface { v5, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ljava/lang/String;
    sput-object v0, Lcom/innioasis/ipp/Diag$Gc;->lastLine:Ljava/lang/String;
  :L6
  .line 321
    const/4 v0, 0
  :L7
    invoke-interface { v5 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v0, v2, :L9
    const-string v2, "gc"
    invoke-interface { v5, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
    const/4 v6, 0
    invoke-static { v4, v2, v3, v6 }, Lcom/innioasis/ipp/Diag;->ring(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
  :L8
    add-int/lit8 v0, v0, 1
    goto :L7
  :L9
  .line 324
    const-class v0, Lcom/innioasis/ipp/Diag$Gc;
    monitor-enter v0
  :L10
  .line 325
    sput-boolean v1, Lcom/innioasis/ipp/Diag$Gc;->running:Z
  .line 326
    monitor-exit v0
    goto :L15
  :L11
    move-exception v1
    monitor-exit v0
  :L12
    throw v1
  :L13
  .line 322
    move-exception v0
  .line 324
    const-class v0, Lcom/innioasis/ipp/Diag$Gc;
    monitor-enter v0
  :L14
  .line 325
    sput-boolean v1, Lcom/innioasis/ipp/Diag$Gc;->running:Z
  .line 326
    monitor-exit v0
  :L15
  .line 327
    nop
  .line 328
    return-void
  :L16
  .line 326
    move-exception v1
    monitor-exit v0
  :L17
    goto :L19
  :L18
    throw v1
  :L19
    goto :L18
.end method
