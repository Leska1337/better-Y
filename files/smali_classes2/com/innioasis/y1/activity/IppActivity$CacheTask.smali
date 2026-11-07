.class final Lcom/innioasis/y1/activity/IppActivity$CacheTask;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "CacheTask"
.end annotation

.field final static ALBUM_COST:I = 9

.field final static COMMIT_BATCH:I = 1000

.field final static COMMIT_ROWS:I = 5

.field final static COMMIT_UNITS:I = 2

.field final static FLOW_COST:I = 2

.field final static SONG_COST:I = 2

.field private final a:Lcom/innioasis/y1/activity/IppActivity;

.field private commitTicked:I

.field private committed:I

.field private label:Ljava/lang/String;

.field private final lock:Ljava/lang/Object;

.field private final mask:I

.field private progress:I

.field private shown:I

.field private total:I

.field private final touched:Ljava/util/HashSet;

.method constructor <init>(Lcom/innioasis/y1/activity/IppActivity;I)V
  .registers 4
  .line 1373
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1357
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->lock:Ljava/lang/Object;
  .line 1358
    const-string v0, ""
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->label:Ljava/lang/String;
  .line 1359
    const/4 v0, 1
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
  .line 1379
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touched:Ljava/util/HashSet;
  .line 1374
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
  .line 1375
    iput p2, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->mask:I
  .line 1376
    return-void
.end method

.method private commitUpTo(I)V
  .catchall { :L0 .. :L2 } :L3
  .catchall { :L4 .. :L5 } :L3
  .registers 7
  .line 1423
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->lock:Ljava/lang/Object;
    monitor-enter v0
  .line 1424
    int-to-long v1, p1
    const-wide/16 v3, 2
    mul-long v1, v1, v3
    const-wide/16 v3, 5
  :L0
    div-long/2addr v1, v3
    long-to-int p1, v1
  .line 1425
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->commitTicked:I
    sub-int v1, p1, v1
  .line 1426
    if-gtz v1, :L1
    monitor-exit v0
    return-void
  :L1
  .line 1427
    iput p1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->commitTicked:I
  .line 1428
    monitor-exit v0
  :L2
  .line 1429
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tick(I)V
  .line 1430
    return-void
  :L3
  .line 1428
    move-exception p1
  :L4
    monitor-exit v0
  :L5
    throw p1
.end method

.method private pass()V
  .catchall { :L5 .. :L11 } :L97
  .catchall { :L12 .. :L13 } :L14
  .catchall { :L15 .. :L16 } :L17
  .catchall { :L18 .. :L19 } :L20
  .catchall { :L22 .. :L58 } :L97
  .catchall { :L58 .. :L59 } :L60
  .catchall { :L61 .. :L80 } :L97
  .catchall { :L81 .. :L83 } :L96
  .catchall { :L83 .. :L84 } :L85
  .catchall { :L86 .. :L87 } :L88
  .catchall { :L89 .. :L90 } :L91
  .catchall { :L93 .. :L95 } :L94
  .catchall { :L98 .. :L99 } :L100
  .catchall { :L101 .. :L102 } :L103
  .catchall { :L104 .. :L105 } :L106
  .catchall { :L108 .. :L109 } :L110
  .catchall { :L111 .. :L112 } :L110
  .registers 43
  .line 1456
    move-object/from16 v9, p0
  .line 1457
    nop
  .line 1458
    nop
  .line 1459
    nop
  .line 1460
    nop
  .line 1461
    nop
  .line 1462
    nop
  .line 1463
    nop
  .line 1464
    new-instance v10, Lcom/innioasis/y1/activity/IppActivity$Steps;
    invoke-direct { v10 }, Lcom/innioasis/y1/activity/IppActivity$Steps;-><init>()V
  .line 1465
    iget v0, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->mask:I
    and-int/lit8 v1, v0, 1
    if-eqz v1, :L0
    const/4 v13, 1
    goto :L1
  :L0
    const/4 v13, 0
  :L1
  .line 1466
    and-int/lit8 v1, v0, 2
    if-eqz v1, :L2
    const/4 v14, 1
    goto :L3
  :L2
    const/4 v14, 0
  :L3
  .line 1467
    and-int/lit8 v0, v0, 8
    if-eqz v0, :L4
    const/4 v15, 1
    goto :L5
  :L4
    const/4 v15, 0
  :L5
  .line 1470
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 1471
    if-nez v0, :L6
    const/4 v8, 0
    goto :L7
  :L6
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v1
    move v8, v1
  :L7
  .line 1473
    nop
  .line 1474
    const-wide/16 v16, 0
    move-wide/from16 v2, v16
    const/4 v1, 0
  :L8
    if-ge v1, v8, :L10
  .line 1475
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/y1/database/Song;
  .line 1476
    if-eqz v4, :L9
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide v5
    cmp-long v7, v5, v2
    if-lez v7, :L9
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide v2
  :L9
  .line 1474
    add-int/lit8 v1, v1, 1
    goto :L8
  :L10
  .line 1478
    const-wide/16 v4, 1000
    div-long/2addr v2, v4
    long-to-int v7, v2
  .line 1480
    iget-object v1, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    iget v2, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->mask:I
    invoke-static { v1, v8, v7, v2 }, Lcom/innioasis/ipp/Albums;->cached(Landroid/content/Context;III)Z
    move-result v1
  :L11
    if-eqz v1, :L22
  .line 1481
    nop
  :L12
  .line 1637
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->endCache()V
  :L13
    goto :L15
  :L14
    move-exception v0
  :L15
  .line 1638
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->endCache()V
  :L16
    goto :L18
  :L17
    move-exception v0
  :L18
  .line 1639
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  :L19
    goto :L21
  :L20
    move-exception v0
  :L21
  .line 1640
    nop
  .line 1645
    const/4 v0, -1
    iget-object v1, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v1, v0 }, Lcom/innioasis/y1/activity/IppActivity;->cacheFinished(I)V
  .line 1482
    return-void
  :L22
  .line 1484
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->beginCache()V
  .line 1485
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->beginCache()V
  .line 1486
    new-instance v1, Ljava/util/HashMap;
    invoke-direct { v1 }, Ljava/util/HashMap;-><init>()V
  .line 1487
    iget-object v2, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    const v3, 2131821074
    invoke-virtual { v2, v3 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object v2
    iput-object v2, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->label:Ljava/lang/String;
  .line 1488
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
  .line 1491
    new-instance v6, Ljava/util/LinkedHashMap;
    invoke-direct { v6 }, Ljava/util/LinkedHashMap;-><init>()V
  .line 1492
    const/4 v4, 0
  :L23
    if-ge v4, v8, :L30
  .line 1493
    invoke-interface { v0, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Lcom/innioasis/y1/database/Song;
  .line 1494
    if-eqz v5, :L28
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v18
    if-nez v18, :L24
    move/from16 v20, v7
    goto :L29
  :L24
  .line 1495
    invoke-static { v5, v1 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;Ljava/util/HashMap;)Ljava/lang/String;
    move-result-object v11
  .line 1496
    if-nez v11, :L25
    move/from16 v20, v7
    goto :L29
  :L25
  .line 1497
    invoke-virtual { v6, v11 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v19
    check-cast v19, Lcom/innioasis/y1/database/Song;
  .line 1498
    if-eqz v19, :L26
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v12
    move/from16 v20, v7
    invoke-virtual/range { v19 .. v19 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v7
    invoke-virtual { v12, v7 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result v7
    if-gez v7, :L29
    goto :L27
  :L26
    move/from16 v20, v7
  :L27
    invoke-virtual { v6, v11, v5 }, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    goto :L29
  :L28
  .line 1494
    move/from16 v20, v7
  :L29
  .line 1492
    add-int/lit8 v4, v4, 1
    move/from16 v7, v20
    goto :L23
  :L30
  .line 1501
    move/from16 v20, v7
    new-instance v11, Ljava/util/ArrayList;
    invoke-virtual { v6 }, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;
    move-result-object v4
    invoke-direct { v11, v4 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 1502
    invoke-virtual { v11 }, Ljava/util/ArrayList;->size()I
    move-result v12
  .line 1505
    mul-int/lit8 v4, v8, 2
    if-eqz v14, :L31
    div-int/lit8 v5, v4, 5
    goto :L32
  :L31
    const/4 v5, 0
  :L32
    add-int/2addr v4, v5
    if-eqz v15, :L33
    mul-int/lit8 v5, v12, 2
    goto :L34
  :L33
    const/4 v5, 0
  :L34
    add-int/2addr v4, v5
  .line 1506
    add-int/2addr v4, v12
    invoke-virtual { v9, v4 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->scale(I)V
  .line 1509
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v21
  .line 1510
    if-eqz v13, :L39
  .line 1511
    const/4 v5, 0
  :L35
    if-ge v5, v8, :L39
  .line 1512
    invoke-interface { v0, v5 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Lcom/innioasis/y1/database/Song;
  .line 1513
    if-eqz v7, :L38
    invoke-virtual { v7 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v19
    if-nez v19, :L36
    goto :L38
  :L36
  .line 1514
    invoke-virtual { v7 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v19
    invoke-static/range { v19 .. v19 }, Lcom/innioasis/ipp/Art;->coverChanged(Ljava/lang/String;)Z
    move-result v19
    if-nez v19, :L37
    goto :L38
  :L37
  .line 1515
    invoke-static { v7, v1 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;Ljava/util/HashMap;)Ljava/lang/String;
    move-result-object v19
    invoke-static/range { v19 .. v19 }, Lcom/innioasis/ipp/CoverCache;->forget(Ljava/lang/String;)V
  .line 1516
    invoke-virtual { v7 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v19
    invoke-static/range { v19 .. v19 }, Lcom/innioasis/ipp/BigCover;->forget(Ljava/lang/String;)V
  .line 1517
    invoke-virtual { v7 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v7
    invoke-static { v7 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
    invoke-static { v7 }, Lcom/innioasis/ipp/BigCover;->forget(Ljava/lang/String;)V
  :L38
  .line 1511
    add-int/lit8 v5, v5, 1
    goto :L35
  :L39
  .line 1520
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v23
    move/from16 v19, v8
    sub-long v7, v23, v21
  .line 1524
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 1527
    new-instance v5, Ljava/util/ArrayList;
    invoke-direct { v5 }, Ljava/util/ArrayList;-><init>()V
  .line 1528
    nop
  .line 1529
    move-object/from16 v21, v10
    new-instance v10, Ljava/util/HashMap;
    invoke-direct { v10 }, Ljava/util/HashMap;-><init>()V
  .line 1530
    move-wide/from16 v22, v7
    const/4 v7, 0
    const/4 v8, 0
  :L40
    if-ge v7, v12, :L53
  .line 1531
    invoke-virtual { v11, v7 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v24
    move-object/from16 v25, v0
    move-object/from16 v0, v24
    check-cast v0, Ljava/lang/String;
  .line 1532
    invoke-virtual { v6, v0 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v24
    check-cast v24, Lcom/innioasis/y1/database/Song;
  .line 1533
    if-eqz v14, :L43
    invoke-static { v0 }, Lcom/innioasis/ipp/AlbumInfo;->artist(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v26
    if-eqz v26, :L42
    invoke-static { v0 }, Lcom/innioasis/ipp/AlbumInfo;->path(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v26
    if-nez v26, :L41
    goto :L42
  :L41
    move-object/from16 v27, v6
    move/from16 v26, v14
    goto :L44
  :L42
  .line 1534
    move/from16 v26, v14
    invoke-virtual/range { v24 .. v24 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v14
    move-object/from16 v27, v6
    invoke-virtual/range { v24 .. v24 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v6
    invoke-static { v0, v14, v6 }, Lcom/innioasis/ipp/AlbumInfo;->put(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    goto :L44
  :L43
  .line 1533
    move-object/from16 v27, v6
    move/from16 v26, v14
  :L44
  .line 1536
    invoke-static { v0 }, Lcom/innioasis/ipp/AlbumInfo;->path(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
  .line 1537
    if-nez v6, :L45
    invoke-virtual/range { v24 .. v24 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v6
  :L45
  .line 1538
    new-instance v14, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;
    invoke-direct { v14 }, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;-><init>()V
  .line 1539
    iput-object v0, v14, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->key:Ljava/lang/String;
  .line 1540
    iput-object v6, v14, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->path:Ljava/lang/String;
  .line 1541
    if-eqz v13, :L46
    invoke-static { v0 }, Lcom/innioasis/ipp/CoverCache;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v24
    if-nez v24, :L46
    move/from16 v24, v13
    const/4 v13, 1
    goto :L47
  :L46
    move/from16 v24, v13
    const/4 v13, 0
  :L47
    iput-boolean v13, v14, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->thumb:Z
  .line 1542
    iget-boolean v13, v14, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->thumb:Z
    if-eqz v13, :L48
    invoke-static { v0, v6 }, Lcom/innioasis/ipp/Art;->thumbFromTags(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L48
    const/4 v0, 1
    goto :L49
  :L48
    const/4 v0, 0
  :L49
    iput-boolean v0, v14, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->art:Z
  .line 1543
    invoke-virtual { v1, v14 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1544
    iget-boolean v0, v14, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->art:Z
    if-eqz v0, :L50
    invoke-virtual { v10, v6, v14 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    goto :L51
  :L50
  .line 1545
    invoke-virtual { v5, v14 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L51
  .line 1546
    iget-boolean v0, v14, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->thumb:Z
    if-eqz v0, :L52
    iget-boolean v0, v14, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->art:Z
    if-nez v0, :L52
    add-int/lit8 v8, v8, 1
  :L52
  .line 1547
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tick()V
  .line 1530
    add-int/lit8 v7, v7, 1
    move/from16 v13, v24
    move-object/from16 v0, v25
    move/from16 v14, v26
    move-object/from16 v6, v27
    goto/16 :L40
  :L53
  .line 1549
    move-object/from16 v25, v0
    move-object/from16 v27, v6
    move/from16 v24, v13
    move/from16 v26, v14
    mul-int/lit8 v0, v8, 9
    add-int/2addr v4, v0
    invoke-virtual { v9, v4 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->scale(I)V
  .line 1550
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sub-long v13, v0, v2
  .line 1551
    nop
  .line 1553
    new-instance v7, Ljava/util/HashSet;
    invoke-direct { v7 }, Ljava/util/HashSet;-><init>()V
  .line 1554
    if-eqz v15, :L56
  .line 1555
    const/4 v0, 0
  :L54
    if-ge v0, v12, :L55
    invoke-virtual { v11, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v1
    move-object/from16 v6, v27
    invoke-virtual { v6, v1 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v7, v1 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    add-int/lit8 v0, v0, 1
    move-object/from16 v27, v6
    goto :L54
  :L55
    move-object/from16 v6, v27
    goto :L57
  :L56
  .line 1554
    move-object/from16 v6, v27
  :L57
  .line 1558
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 1559
    invoke-virtual { v9, v5 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->runAlbums(Ljava/util/List;)V
  .line 1560
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    sub-long v27, v2, v0
  .line 1565
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v29
  .line 1566
    if-eqz v25, :L69
    if-lez v19, :L69
  .line 1567
    new-instance v5, Ljava/util/ArrayList;
    move-object/from16 v0, v25
    invoke-direct { v5, v0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  :L58
  .line 1569
    new-instance v0, Lcom/innioasis/y1/activity/IppActivity$ByPath;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Lcom/innioasis/y1/activity/IppActivity$ByPath;-><init>(Lcom/innioasis/y1/activity/IppActivity$1;)V
    invoke-static { v5, v0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  :L59
  .line 1571
    goto :L61
  :L60
  .line 1570
    move-exception v0
  :L61
  .line 1572
    invoke-static { v5 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->folders(Ljava/util/List;)Lcom/innioasis/y1/activity/IppActivity$Blocks;
    move-result-object v0
  .line 1573
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->access$500()I
    move-result v4
    new-array v3, v4, [Lcom/innioasis/y1/activity/IppActivity$SongWorker;
  .line 1574
    const/4 v2, 0
  :L62
    if-ge v2, v4, :L63
  .line 1575
    new-instance v25, Lcom/innioasis/y1/activity/IppActivity$SongWorker;
    move-object/from16 v1, v25
    move/from16 v31, v2
    move-object/from16 v2, p0
    move-object/from16 v32, v3
    move-object v3, v5
    move-wide/from16 v33, v13
    move v13, v4
    move-object v4, v0
    move-object v14, v5
    move/from16 v5, v26
    move-object/from16 v35, v14
    move-object v14, v6
    move/from16 v6, v24
    move/from16 v36, v20
    move-wide/from16 v37, v22
    move-object/from16 v20, v7
    move-object v7, v10
    move/from16 v39, v8
    move-object/from16 v22, v14
    move/from16 v14, v19
    move-object/from16 v8, v20
    invoke-direct/range { v1 .. v8 }, Lcom/innioasis/y1/activity/IppActivity$SongWorker;-><init>(Lcom/innioasis/y1/activity/IppActivity$CacheTask;Ljava/util/List;Lcom/innioasis/y1/activity/IppActivity$Blocks;ZZLjava/util/Map;Ljava/util/HashSet;)V
    aput-object v25, v32, v31
  .line 1574
    add-int/lit8 v2, v31, 1
    move v4, v13
    move/from16 v19, v14
    move-object/from16 v7, v20
    move-object/from16 v6, v22
    move-object/from16 v3, v32
    move-wide/from16 v13, v33
    move-object/from16 v5, v35
    move/from16 v20, v36
    move-wide/from16 v22, v37
    move/from16 v8, v39
    goto :L62
  :L63
  .line 1577
    move-object/from16 v32, v3
    move/from16 v39, v8
    move-wide/from16 v33, v13
    move/from16 v14, v19
    move/from16 v36, v20
    move-wide/from16 v37, v22
    move v13, v4
    move-object/from16 v22, v6
    invoke-static/range { v32 .. v32 }, Lcom/innioasis/y1/activity/IppActivity;->access$600([Ljava/lang/Runnable;)V
  .line 1579
    invoke-static { }, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;
    move-result-object v0
  .line 1580
    invoke-virtual { v0 }, Ljava/lang/Runtime;->totalMemory()J
    move-result-wide v1
    invoke-virtual { v0 }, Ljava/lang/Runtime;->freeMemory()J
    move-result-wide v3
    sub-long/2addr v1, v3
  .line 1581
    const/4 v0, 0
    const/4 v3, 0
    const/4 v4, 0
  :L64
    if-ge v0, v13, :L65
  .line 1582
    aget-object v5, v32, v0
    iget v5, v5, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->failed:I
    add-int/2addr v3, v5
  .line 1583
    aget-object v5, v32, v0
    iget v5, v5, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->unwritten:I
    add-int/2addr v4, v5
  .line 1584
    aget-object v5, v32, v0
    iget-object v5, v5, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->steps:Lcom/innioasis/y1/activity/IppActivity$Steps;
    move-object/from16 v6, v21
    invoke-virtual { v6, v5 }, Lcom/innioasis/y1/activity/IppActivity$Steps;->add(Lcom/innioasis/y1/activity/IppActivity$Steps;)V
  .line 1585
    aget-object v5, v32, v0
    iget-object v5, v5, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->walk:Lcom/innioasis/ipp/BigCover$Walk;
    invoke-virtual { v6, v5 }, Lcom/innioasis/y1/activity/IppActivity$Steps;->cover(Lcom/innioasis/ipp/BigCover$Walk;)V
  .line 1581
    add-int/lit8 v0, v0, 1
    move-object/from16 v21, v6
    goto :L64
  :L65
  .line 1587
    move-object/from16 v6, v21
    if-eqz v26, :L68
  .line 1588
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v7
  .line 1589
    const/4 v0, 0
  :L66
    if-ge v0, v13, :L67
    aget-object v5, v32, v0
    invoke-virtual { v5 }, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->commit()V
    add-int/lit8 v0, v0, 1
    goto :L66
  :L67
  .line 1590
    invoke-static { }, Lcom/innioasis/ipp/DiscCache;->flush()V
  .line 1591
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v16
    sub-long v16, v16, v7
  .line 1592
    invoke-virtual { v9, v14 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->committedAll(I)V
    move-wide/from16 v40, v1
    move-wide/from16 v0, v16
    move-wide/from16 v16, v40
    goto :L70
  :L68
  .line 1587
    move-wide/from16 v40, v1
    move-wide/from16 v0, v16
    move-wide/from16 v16, v40
    goto :L70
  :L69
  .line 1566
    move/from16 v39, v8
    move-wide/from16 v33, v13
    move/from16 v14, v19
    move/from16 v36, v20
    move-wide/from16 v37, v22
    move-object/from16 v22, v6
    move-object/from16 v6, v21
  .line 1595
    move-wide/from16 v0, v16
    const/4 v3, 0
    const/4 v4, 0
  :L70
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v7
    sub-long v7, v7, v29
  .line 1598
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v20
  .line 1599
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  .line 1600
    invoke-virtual { v10 }, Ljava/util/HashMap;->values()Ljava/util/Collection;
    move-result-object v5
    invoke-interface { v5 }, Ljava/util/Collection;->iterator()Ljava/util/Iterator;
    move-result-object v5
  :L71
  .line 1601
    invoke-interface { v5 }, Ljava/util/Iterator;->hasNext()Z
    move-result v10
    if-eqz v10, :L73
  .line 1602
    invoke-interface { v5 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v10
    check-cast v10, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;
  .line 1603
    iget-boolean v13, v10, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->done:Z
    if-nez v13, :L72
    invoke-virtual { v2, v10 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L72
  .line 1604
    goto :L71
  :L73
  .line 1605
    invoke-virtual { v9, v2 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->runAlbums(Ljava/util/List;)V
  .line 1606
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v23
    sub-long v23, v23, v20
    move v10, v4
    add-long v4, v27, v23
  .line 1609
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v20
  .line 1610
    if-eqz v15, :L79
  .line 1611
    const/4 v13, 0
  :L74
    if-ge v13, v12, :L79
  .line 1612
    invoke-virtual { v11, v13 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v15
    move/from16 v19, v12
    move-object/from16 v12, v22
    invoke-virtual { v12, v15 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v15
    check-cast v15, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v15 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v15
  .line 1613
    invoke-static { v15 }, Lcom/innioasis/ipp/FlowCache;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v22
  .line 1614
    if-eqz v22, :L75
    invoke-virtual/range { v22 .. v22 }, Ljava/io/File;->exists()Z
    move-result v22
    if-nez v22, :L75
    const/16 v22, 1
    goto :L76
  :L75
    const/16 v22, 0
  :L76
  .line 1615
    invoke-static { v15 }, Lcom/innioasis/ipp/Flow;->cacheSlide(Ljava/lang/String;)Z
    move-result v15
    if-nez v15, :L77
    add-int/lit8 v10, v10, 1
    goto :L78
  :L77
  .line 1616
    if-eqz v22, :L78
    invoke-virtual { v11, v13 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v15
    check-cast v15, Ljava/lang/String;
    invoke-virtual { v9, v15 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touch(Ljava/lang/String;)V
  :L78
  .line 1617
    const/4 v15, 2
    invoke-virtual { v9, v15 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tick(I)V
  .line 1611
    add-int/lit8 v13, v13, 1
    move-object/from16 v22, v12
    move/from16 v12, v19
    goto :L74
  :L79
  .line 1620
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v11
    sub-long v11, v11, v20
  .line 1623
    iget v13, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
    invoke-virtual { v9, v13 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tick(I)V
  :L80
  .line 1624
    if-nez v3, :L82
    if-nez v10, :L82
  :L81
    iget-object v13, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    iget v15, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->mask:I
    move/from16 v9, v36
    invoke-static { v13, v14, v9, v15 }, Lcom/innioasis/ipp/Albums;->noteCached(Landroid/content/Context;III)V
  :L82
  .line 1625
    new-instance v9, Ljava/lang/StringBuilder;
    invoke-direct { v9 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v13, "cache library: prepare "
    invoke-virtual { v9, v13 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v9
    move-wide/from16 v13, v33
    invoke-virtual { v9, v13, v14 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v9
    const-string v13, " ms (replaced covers "
    invoke-virtual { v9, v13 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v9
    move-wide/from16 v13, v37
    invoke-virtual { v9, v13, v14 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v9
    const-string v13, " ms), "
    invoke-virtual { v9, v13 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v9
    move/from16 v13, v39
    invoke-virtual { v9, v13 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v9
    const-string v13, " thumbnail(s) from cover files; albums "
    invoke-virtual { v9, v13 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v9
    invoke-virtual { v9, v4, v5 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v4
    const-string v5, " ms ("
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
  .line 1627
    invoke-virtual { v2 }, Ljava/util/ArrayList;->size()I
    move-result v2
    invoke-virtual { v4, v2 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v4, " late), songs "
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v7, v8 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v4, " ms (tags written "
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v0, v1 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " ms), flow "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v11, v12 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " ms, "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
  .line 1629
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->access$500()I
    move-result v1
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " workers, heap "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const/16 v1, 20
    shr-long v1, v16, v1
    invoke-virtual { v0, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " MB; "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " file(s) did not read, "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v10 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " cover(s) not written"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
  .line 1625
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 1632
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "cache library steps: "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v6 }, Lcom/innioasis/y1/activity/IppActivity$Steps;->line()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 1633
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "cache library cover: "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v6 }, Lcom/innioasis/y1/activity/IppActivity$Steps;->coverLine()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L83
  .line 1637
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->endCache()V
  :L84
    goto :L86
  :L85
    move-exception v0
  :L86
  .line 1638
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->endCache()V
  :L87
    goto :L89
  :L88
    move-exception v0
  :L89
  .line 1639
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  :L90
    goto :L92
  :L91
    move-exception v0
  :L92
  .line 1640
    nop
  .line 1641
    move-object/from16 v1, p0
    iget-object v2, v1, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touched:Ljava/util/HashSet;
    monitor-enter v2
  :L93
  .line 1642
    iget-object v0, v1, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touched:Ljava/util/HashSet;
    invoke-virtual { v0 }, Ljava/util/HashSet;->size()I
    move-result v0
  .line 1643
    monitor-exit v2
    goto :L109
  :L94
    move-exception v0
    monitor-exit v2
  :L95
    throw v0
  :L96
  .line 1634
    move-exception v0
    move-object/from16 v1, p0
    goto :L98
  :L97
    move-exception v0
    move-object v1, v9
  :L98
  .line 1637
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->endCache()V
  :L99
    goto :L101
  :L100
    move-exception v0
  :L101
  .line 1638
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->endCache()V
  :L102
    goto :L104
  :L103
    move-exception v0
  :L104
  .line 1639
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  :L105
    goto :L107
  :L106
    move-exception v0
  :L107
  .line 1640
    nop
  .line 1641
    iget-object v2, v1, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touched:Ljava/util/HashSet;
    monitor-enter v2
  :L108
  .line 1642
    iget-object v0, v1, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touched:Ljava/util/HashSet;
    invoke-virtual { v0 }, Ljava/util/HashSet;->size()I
    move-result v0
  .line 1643
    monitor-exit v2
  :L109
  .line 1645
    iget-object v2, v1, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v2, v0 }, Lcom/innioasis/y1/activity/IppActivity;->cacheFinished(I)V
  .line 1646
    nop
  .line 1647
    return-void
  :L110
  .line 1643
    move-exception v0
  :L111
    monitor-exit v2
  :L112
    goto :L114
  :L113
    throw v0
  :L114
    goto :L113
.end method

.method committed(I)V
  .catchall { :L0 .. :L1 } :L2
  .catchall { :L3 .. :L4 } :L2
  .registers 4
  .line 1410
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->lock:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 1411
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->committed:I
    add-int/2addr v1, p1
    iput v1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->committed:I
  .line 1412
    monitor-exit v0
  :L1
  .line 1413
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->commitUpTo(I)V
  .line 1414
    return-void
  :L2
  .line 1412
    move-exception p1
  :L3
    monitor-exit v0
  :L4
    throw p1
.end method

.method committedAll(I)V
  .registers 2
  .line 1418
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->commitUpTo(I)V
  .line 1419
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L2 } :L1
  .registers 3
  .line 1450
    sget-object v0, Lcom/innioasis/ipp/Pick;->LOCK:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 1451
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->pass()V
  .line 1452
    monitor-exit v0
  .line 1453
    return-void
  :L1
  .line 1452
    move-exception v1
    monitor-exit v0
  :L2
    throw v1
.end method

.method runAlbums(Ljava/util/List;)V
  .registers 7
  .line 1441
    invoke-interface { p1 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    return-void
  :L0
  .line 1442
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v0
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->each(I)Lcom/innioasis/y1/activity/IppActivity$Blocks;
    move-result-object v0
  .line 1443
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->access$500()I
    move-result v1
    new-array v2, v1, [Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;
  .line 1444
    const/4 v3, 0
  :L1
    if-ge v3, v1, :L2
    new-instance v4, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;
    invoke-direct { v4, p0, p1, v0 }, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;-><init>(Lcom/innioasis/y1/activity/IppActivity$CacheTask;Ljava/util/List;Lcom/innioasis/y1/activity/IppActivity$Blocks;)V
    aput-object v4, v2, v3
    add-int/lit8 v3, v3, 1
    goto :L1
  :L2
  .line 1445
    invoke-static { v2 }, Lcom/innioasis/y1/activity/IppActivity;->access$600([Ljava/lang/Runnable;)V
  .line 1446
    return-void
.end method

.method scale(I)V
  .catchall { :L0 .. :L2 } :L1
  .registers 3
  .line 1434
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->lock:Ljava/lang/Object;
    monitor-enter v0
  .line 1435
    if-gtz p1, :L0
    const/4 p1, 1
  :L0
    iput p1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
  .line 1436
    monitor-exit v0
  .line 1437
    return-void
  :L1
  .line 1436
    move-exception p1
    monitor-exit v0
  :L2
    throw p1
.end method

.method tick()V
  .registers 2
  .line 1389
    const/4 v0, 1
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tick(I)V
  .line 1390
    return-void
.end method

.method tick(I)V
  .catchall { :L0 .. :L3 } :L4
  .catchall { :L5 .. :L6 } :L4
  .registers 7
  .line 1395
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->lock:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 1396
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->progress:I
    add-int/2addr v1, p1
    iput v1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->progress:I
  .line 1397
    int-to-long v1, v1
    const-wide/16 v3, 100
    mul-long v1, v1, v3
    iget p1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
    int-to-long v3, p1
    div-long/2addr v1, v3
    long-to-int p1, v1
  .line 1398
    const/16 v1, 100
    if-le p1, v1, :L1
    const/16 p1, 100
  :L1
  .line 1399
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->shown:I
    if-gt p1, v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 1400
    iput p1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->shown:I
  .line 1401
    monitor-exit v0
  :L3
  .line 1402
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->label:Ljava/lang/String;
    invoke-static { v1, p1 }, Lcom/innioasis/ipp/Loading;->percent(Ljava/lang/String;I)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { v0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->scanTick(Ljava/lang/String;)V
  .line 1403
    return-void
  :L4
  .line 1401
    move-exception p1
  :L5
    monitor-exit v0
  :L6
    throw p1
.end method

.method touch(Ljava/lang/String;)V
  .catchall { :L1 .. :L3 } :L2
  .registers 4
  .line 1382
    if-nez p1, :L0
    return-void
  :L0
  .line 1383
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touched:Ljava/util/HashSet;
    monitor-enter v0
  :L1
  .line 1384
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touched:Ljava/util/HashSet;
    invoke-virtual { v1, p1 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  .line 1385
    monitor-exit v0
  .line 1386
    return-void
  :L2
  .line 1385
    move-exception p1
    monitor-exit v0
  :L3
    throw p1
.end method
