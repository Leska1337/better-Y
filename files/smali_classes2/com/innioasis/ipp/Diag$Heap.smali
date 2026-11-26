.class final Lcom/innioasis/ipp/Diag$Heap;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Diag.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Diag;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Heap"
.end annotation

.field private static asked:Z

.method constructor <init>()V
  .registers 1
  .line 251
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static flagged()Z
  .registers 3
  .line 255
    new-instance v0, Ljava/io/File;
    invoke-static { }, Lcom/innioasis/ipp/Panel;->card()Ljava/io/File;
    move-result-object v1
    const-string v2, "heap_dump"
    invoke-direct { v0, v1, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/io/File;->isFile()Z
    move-result v0
    return v0
.end method

.method static once()V
  .catchall { :L0 .. :L2 } :L7
  .catchall { :L2 .. :L4 } :L5
  .catchall { :L8 .. :L9 } :L7
  .registers 4
  .line 259
    const-class v0, Lcom/innioasis/ipp/Diag$Heap;
    monitor-enter v0
  :L0
  .line 260
    sget-boolean v1, Lcom/innioasis/ipp/Diag$Heap;->asked:Z
    if-eqz v1, :L1
    monitor-exit v0
    return-void
  :L1
  .line 261
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/Diag$Heap;->asked:Z
  .line 262
    monitor-exit v0
  :L2
  .line 264
    invoke-static { }, Lcom/innioasis/ipp/Diag$Heap;->flagged()Z
    move-result v0
    if-nez v0, :L3
    return-void
  :L3
  .line 265
    new-instance v0, Ljava/lang/Thread;
    new-instance v2, Lcom/innioasis/ipp/Diag$Heap;
    invoke-direct { v2 }, Lcom/innioasis/ipp/Diag$Heap;-><init>()V
    const-string v3, "ipp-diag-heap"
    invoke-direct { v0, v2, v3 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 266
    invoke-virtual { v0, v1 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 267
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  :L4
  .line 269
    goto :L6
  :L5
  .line 268
    move-exception v0
  :L6
  .line 270
    return-void
  :L7
  .line 262
    move-exception v1
  :L8
    monitor-exit v0
  :L9
    throw v1
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  :L0
  .line 274
    new-instance v0, Ljava/io/File;
    invoke-static { }, Lcom/innioasis/ipp/Panel;->logs()Ljava/io/File;
    move-result-object v1
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "heap_"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-static { }, Lcom/innioasis/ipp/Panel;->stamp()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, ".hprof"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-direct { v0, v1, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 275
    invoke-virtual { v0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v1
    invoke-static { v1 }, Landroid/os/Debug;->dumpHprofData(Ljava/lang/String;)V
  .line 276
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "heap dumped to "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v0 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L1
  .line 279
    goto :L3
  :L2
  .line 277
    move-exception v0
  .line 278
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "heap dump failed: "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L3
  .line 280
    return-void
.end method
