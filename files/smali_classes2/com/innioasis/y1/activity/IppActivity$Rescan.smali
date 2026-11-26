.class final Lcom/innioasis/y1/activity/IppActivity$Rescan;
.super Ljava/lang/Object;
.source "IppActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Rescan"
.end annotation

.field private final static BATCH:I = 100

.field private final static READ_COST:I = 50

.field private final static WRITE_COST:I = 50

.field built:I

.field checkMs:J

.field private checked:I

.field private closed:Z

.field private final done:Ljava/util/ArrayList;

.field dropMs:J

.field failed:Z

.field insertMs:J

.field private label:Ljava/lang/String;

.field private live:I

.field queued:I

.field readMs:J

.field private repo:Lcom/innioasis/y1/database/Y1Repository;

.field private rows:I

.field private shown:I

.field slowMs:J

.field slowName:Ljava/lang/String;

.field private final todo:Ljava/util/LinkedList;

.field private ui:Lcom/innioasis/y1/activity/IppActivity;

.field private written:I

.method private constructor <init>()V
  .registers 2
  .line 1241
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1243
    new-instance v0, Ljava/util/LinkedList;
    invoke-direct { v0 }, Ljava/util/LinkedList;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->todo:Ljava/util/LinkedList;
  .line 1244
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->done:Ljava/util/ArrayList;
  .line 1253
    const-string v0, ""
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->slowName:Ljava/lang/String;
    return-void
.end method

.method synthetic constructor <init>(Lcom/innioasis/y1/activity/IppActivity$1;)V
  .registers 2
  .line 1241
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;-><init>()V
    return-void
.end method

.method static synthetic access$400(Lcom/innioasis/y1/activity/IppActivity$Rescan;)Lcom/innioasis/y1/database/Y1Repository;
  .registers 1
  .line 1241
    iget-object p0, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->repo:Lcom/innioasis/y1/database/Y1Repository;
    return-object p0
.end method

.method declared-synchronized add(Ljava/io/File;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
    monitor-enter p0
  :L0
  .line 1268
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->todo:Ljava/util/LinkedList;
    invoke-virtual { v0, p1 }, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V
  .line 1269
    iget p1, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->queued:I
    add-int/lit8 p1, p1, 1
    iput p1, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->queued:I
  .line 1270
    invoke-virtual { p0 }, Ljava/lang/Object;->notifyAll()V
  :L1
  .line 1271
    monitor-exit p0
    return-void
  :L2
  .line 1267
    move-exception p1
    monitor-exit p0
    throw p1
.end method

.method declared-synchronized built(Lcom/innioasis/y1/database/Song;Ljava/io/File;J)V
  .catchall { :L0 .. :L4 } :L5
  .registers 8
    monitor-enter p0
  :L0
  .line 1360
    iget-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->readMs:J
    add-long/2addr v0, p3
    iput-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->readMs:J
  .line 1361
    iget-wide v0, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->slowMs:J
    cmp-long v2, p3, v0
    if-lez v2, :L1
  .line 1362
    iput-wide p3, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->slowMs:J
  .line 1363
    invoke-virtual { p2 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object p2
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->slowName:Ljava/lang/String;
  :L1
  .line 1365
    iget p2, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->built:I
    const/4 p3, 1
    add-int/2addr p2, p3
    iput p2, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->built:I
  .line 1366
    if-eqz p1, :L2
    iget-object p2, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->done:Ljava/util/ArrayList;
    invoke-virtual { p2, p1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L3
  :L2
  .line 1367
    iput-boolean p3, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->failed:Z
  :L3
  .line 1368
    invoke-virtual { p0 }, Ljava/lang/Object;->notifyAll()V
  :L4
  .line 1369
    monitor-exit p0
    return-void
  :L5
  .line 1359
    move-exception p1
    monitor-exit p0
    throw p1
.end method

.method checked(I)V
  .catchall { :L0 .. :L1 } :L2
  .catchall { :L3 .. :L4 } :L2
  .registers 2
  .line 1305
    monitor-enter p0
  :L0
  .line 1306
    iput p1, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->checked:I
  .line 1307
    monitor-exit p0
  :L1
  .line 1308
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;->tick()V
  .line 1309
    return-void
  :L2
  .line 1307
    move-exception p1
  :L3
    monitor-exit p0
  :L4
    throw p1
.end method

.method declared-synchronized close()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
    monitor-enter p0
  .line 1274
    const/4 v0, 1
  :L0
    iput-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->closed:Z
  .line 1275
    invoke-virtual { p0 }, Ljava/lang/Object;->notifyAll()V
  :L1
  .line 1276
    monitor-exit p0
    return-void
  :L2
  .line 1273
    move-exception v0
    monitor-exit p0
    throw v0
.end method

.method declared-synchronized idle()Z
  .catchall { :L0 .. :L1 } :L10
  .catch Ljava/lang/InterruptedException; { :L3 .. :L4 } :L9
  .catchall { :L3 .. :L4 } :L10
  .catchall { :L5 .. :L6 } :L10
  .registers 5
    monitor-enter p0
  :L0
  .line 1280
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->live:I
  :L1
    const/4 v1, 1
    if-nez v0, :L2
    monitor-exit p0
    return v1
  :L2
  .line 1282
    const-wide/16 v2, 200
  :L3
    invoke-virtual { p0, v2, v3 }, Ljava/lang/Object;->wait(J)V
  :L4
  .line 1285
    nop
  :L5
  .line 1286
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->live:I
  :L6
    if-nez v0, :L7
    goto :L8
  :L7
    const/4 v1, 0
  :L8
    monitor-exit p0
    return v1
  :L9
  .line 1283
    move-exception v0
  .line 1284
    monitor-exit p0
    return v1
  :L10
  .line 1279
    move-exception v0
    monitor-exit p0
    throw v0
.end method

.method declared-synchronized next()Ljava/io/File;
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/InterruptedException;
    }
  .end annotation
  .catchall { :L0 .. :L3 } :L4
  .registers 2
    monitor-enter p0
  :L0
  .line 1355
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->todo:Ljava/util/LinkedList;
    invoke-virtual { v0 }, Ljava/util/LinkedList;->isEmpty()Z
    move-result v0
    if-eqz v0, :L1
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->closed:Z
    if-nez v0, :L1
    invoke-virtual { p0 }, Ljava/lang/Object;->wait()V
    goto :L0
  :L1
  .line 1356
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->todo:Ljava/util/LinkedList;
    invoke-virtual { v0 }, Ljava/util/LinkedList;->isEmpty()Z
    move-result v0
    if-eqz v0, :L2
    const/4 v0, 0
    goto :L3
  :L2
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->todo:Ljava/util/LinkedList;
    invoke-virtual { v0 }, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Ljava/io/File;
  :L3
    monitor-exit p0
    return-object v0
  :L4
  .line 1354
    move-exception v0
    monitor-exit p0
    goto :L6
  :L5
    throw v0
  :L6
    goto :L5
.end method

.method declared-synchronized quit()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
    monitor-enter p0
  :L0
  .line 1372
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->live:I
    add-int/lit8 v0, v0, -1
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->live:I
  .line 1373
    invoke-virtual { p0 }, Ljava/lang/Object;->notifyAll()V
  :L1
  .line 1374
    monitor-exit p0
    return-void
  :L2
  .line 1371
    move-exception v0
    monitor-exit p0
    throw v0
.end method

.method show(Lcom/innioasis/y1/activity/IppActivity;Ljava/lang/String;I)V
  .registers 4
  .line 1299
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->ui:Lcom/innioasis/y1/activity/IppActivity;
  .line 1300
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->label:Ljava/lang/String;
  .line 1301
    iput p3, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->rows:I
  .line 1302
    return-void
.end method

.method start(Lcom/innioasis/y1/database/Y1Repository;)V
  .catchall { :L2 .. :L5 } :L4
  .registers 6
  .line 1256
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->repo:Lcom/innioasis/y1/database/Y1Repository;
  .line 1257
    invoke-static { }, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;
    move-result-object p1
    invoke-virtual { p1 }, Ljava/lang/Runtime;->availableProcessors()I
    move-result p1
    add-int/lit8 p1, p1, 1
  .line 1258
    const/4 v0, 3
    if-le p1, v0, :L0
    const/4 p1, 3
  :L0
  .line 1259
    monitor-enter p0
  .line 1260
    const/4 v0, 0
  :L1
    if-ge v0, p1, :L3
  :L2
  .line 1261
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->live:I
    add-int/lit8 v1, v1, 1
    iput v1, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->live:I
  .line 1262
    new-instance v1, Ljava/lang/Thread;
    new-instance v2, Lcom/innioasis/y1/activity/IppActivity$RescanWorker;
    invoke-direct { v2, p0 }, Lcom/innioasis/y1/activity/IppActivity$RescanWorker;-><init>(Lcom/innioasis/y1/activity/IppActivity$Rescan;)V
    const-string v3, "ipp-rescan"
    invoke-direct { v1, v2, v3 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    invoke-virtual { v1 }, Ljava/lang/Thread;->start()V
  .line 1260
    add-int/lit8 v0, v0, 1
    goto :L1
  :L3
  .line 1264
    monitor-exit p0
  .line 1265
    return-void
  :L4
  .line 1264
    move-exception p1
    monitor-exit p0
  :L5
    goto :L7
  :L6
    throw p1
  :L7
    goto :L6
.end method

.method tick()V
  .catchall { :L0 .. :L5 } :L6
  .catchall { :L7 .. :L8 } :L6
  .registers 11
  .line 1314
    monitor-enter p0
  :L0
  .line 1315
    iget v0, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->rows:I
    int-to-long v0, v0
    iget v2, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->queued:I
    int-to-long v2, v2
    const-wide/16 v4, 100
    mul-long v2, v2, v4
    add-long/2addr v0, v2
  .line 1316
    const-wide/16 v2, 0
    cmp-long v6, v0, v2
    if-nez v6, :L1
    const/4 v0, 0
    goto :L2
  :L1
    iget v2, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->checked:I
    int-to-long v2, v2
    iget v6, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->built:I
    int-to-long v6, v6
    const-wide/16 v8, 50
    mul-long v6, v6, v8
    add-long/2addr v2, v6
    iget v6, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->written:I
    int-to-long v6, v6
    mul-long v6, v6, v8
    add-long/2addr v2, v6
    mul-long v2, v2, v4
    div-long/2addr v2, v0
    long-to-int v0, v2
  :L2
  .line 1318
    const/16 v1, 99
    if-le v0, v1, :L3
    const/16 v0, 99
  :L3
  .line 1319
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->shown:I
    if-gt v0, v1, :L4
    monitor-exit p0
    return-void
  :L4
  .line 1320
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->shown:I
  .line 1321
    monitor-exit p0
  :L5
  .line 1322
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->ui:Lcom/innioasis/y1/activity/IppActivity;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->label:Ljava/lang/String;
    invoke-static { v2, v0 }, Lcom/innioasis/ipp/Loading;->percent(Ljava/lang/String;I)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v1, v0 }, Lcom/innioasis/y1/activity/IppActivity;->scanTick(Ljava/lang/String;)V
  .line 1323
    return-void
  :L6
  .line 1321
    move-exception v0
  :L7
    monitor-exit p0
  :L8
    throw v0
.end method

.method write(Lcom/innioasis/y1/database/Y1Repository;Z)I
  .catchall { :L0 .. :L2 } :L15
  .catchall { :L3 .. :L4 } :L10
  .catchall { :L5 .. :L6 } :L7
  .catchall { :L8 .. :L9 } :L7
  .catchall { :L11 .. :L13 } :L12
  .catchall { :L14 .. :L16 } :L15
  .registers 9
  .line 1328
    monitor-enter p0
  :L0
  .line 1329
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->done:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v0
    const/4 v1, 0
    if-nez v0, :L14
    if-nez p2, :L1
    iget-object p2, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->done:Ljava/util/ArrayList;
    invoke-virtual { p2 }, Ljava/util/ArrayList;->size()I
    move-result p2
    const/16 v0, 100
    if-ge p2, v0, :L1
    goto :L14
  :L1
  .line 1330
    iget-object p2, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->done:Ljava/util/ArrayList;
    invoke-virtual { p2 }, Ljava/util/ArrayList;->size()I
    move-result v0
    new-array v0, v0, [Lcom/innioasis/y1/database/Song;
    invoke-virtual { p2, v0 }, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    move-result-object p2
    check-cast p2, [Lcom/innioasis/y1/database/Song;
  .line 1331
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->done:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->clear()V
  .line 1332
    monitor-exit p0
  :L2
  .line 1333
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
  :L3
  .line 1335
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Y1Repository;->ippSongDao()Lcom/innioasis/y1/database/SongDao;
    move-result-object p1
    invoke-interface { p1, p2 }, Lcom/innioasis/y1/database/SongDao;->insert([Lcom/innioasis/y1/database/Song;)V
  :L4
  .line 1341
    nop
  .line 1342
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 1343
    invoke-static { p2 }, Lcom/innioasis/ipp/Ipp;->songsChanged([Lcom/innioasis/y1/database/Song;)V
  .line 1344
    iget-wide v4, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->insertMs:J
    sub-long v2, v0, v2
    add-long/2addr v4, v2
    iput-wide v4, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->insertMs:J
  .line 1345
    iget-wide v2, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->dropMs:J
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
    sub-long/2addr v4, v0
    add-long/2addr v2, v4
    iput-wide v2, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->dropMs:J
  .line 1346
    monitor-enter p0
  :L5
  .line 1347
    iget p1, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->written:I
    array-length v0, p2
    add-int/2addr p1, v0
    iput p1, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->written:I
  .line 1348
    monitor-exit p0
  :L6
  .line 1349
    invoke-virtual { p0 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;->tick()V
  .line 1350
    array-length p1, p2
    return p1
  :L7
  .line 1348
    move-exception p1
  :L8
    monitor-exit p0
  :L9
    throw p1
  :L10
  .line 1336
    move-exception p1
  .line 1337
    monitor-enter p0
  .line 1338
    const/4 p1, 1
  :L11
    iput-boolean p1, p0, Lcom/innioasis/y1/activity/IppActivity$Rescan;->failed:Z
  .line 1339
    monitor-exit p0
  .line 1340
    return v1
  :L12
  .line 1339
    move-exception p1
    monitor-exit p0
  :L13
    throw p1
  :L14
  .line 1329
    monitor-exit p0
    return v1
  :L15
  .line 1332
    move-exception p1
    monitor-exit p0
  :L16
    throw p1
.end method
