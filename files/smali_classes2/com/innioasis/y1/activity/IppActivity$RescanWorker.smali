.class final Lcom/innioasis/y1/activity/IppActivity$RescanWorker;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "RescanWorker"
.end annotation

.field private final q:Lcom/innioasis/y1/activity/IppActivity$Rescan;

.method constructor <init>(Lcom/innioasis/y1/activity/IppActivity$Rescan;)V
  .registers 2
  .line 1321
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1322
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$RescanWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Rescan;
  .line 1323
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L2 } :L7
  .catchall { :L2 .. :L3 } :L4
  .catchall { :L5 .. :L6 } :L7
  .registers 8
  .line 1329
    nop
  :L0
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$RescanWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Rescan;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;->next()Ljava/io/File;
    move-result-object v0
  .line 1330
    if-nez v0, :L1
    goto :L8
  :L1
  .line 1331
    nop
  .line 1332
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
  :L2
  .line 1334
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity$RescanWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Rescan;
    invoke-static { v3 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;->access$400(Lcom/innioasis/y1/activity/IppActivity$Rescan;)Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v3
    invoke-virtual { v3, v0 }, Lcom/innioasis/y1/database/Y1Repository;->fileToSong(Ljava/io/File;)Lcom/innioasis/y1/database/Song;
    move-result-object v3
  :L3
  .line 1337
    goto :L5
  :L4
  .line 1335
    move-exception v3
  .line 1336
    const/4 v3, 0
  :L5
  .line 1338
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v5, "update library "
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v0 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v4
    invoke-static { v4, v1, v2 }, Lcom/innioasis/ipp/Diag;->slow(Ljava/lang/String;J)V
  .line 1339
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppActivity$RescanWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Rescan;
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v5
    sub-long/2addr v5, v1
    invoke-virtual { v4, v3, v0, v5, v6 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;->built(Lcom/innioasis/y1/database/Song;Ljava/io/File;J)V
  .line 1340
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$RescanWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Rescan;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;->tick()V
  :L6
  .line 1341
    goto :L0
  :L7
  .line 1342
    move-exception v0
  :L8
  .line 1344
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$RescanWorker;->q:Lcom/innioasis/y1/activity/IppActivity$Rescan;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;->quit()V
  .line 1345
    nop
  .line 1346
    return-void
.end method
