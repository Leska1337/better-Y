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
  .line 1431
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1415
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->lock:Ljava/lang/Object;
  .line 1416
    const-string v0, ""
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->label:Ljava/lang/String;
  .line 1417
    const/4 v0, 1
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
  .line 1437
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touched:Ljava/util/HashSet;
  .line 1432
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
  .line 1433
    iput p2, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->mask:I
  .line 1434
    return-void
.end method

.method private commitUpTo(I)V
  .catchall { :L0 .. :L2 } :L3
  .catchall { :L4 .. :L5 } :L3
  .registers 7
  .line 1481
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->lock:Ljava/lang/Object;
    monitor-enter v0
  .line 1482
    int-to-long v1, p1
    const-wide/16 v3, 2
    mul-long v1, v1, v3
    const-wide/16 v3, 5
  :L0
    div-long/2addr v1, v3
    long-to-int p1, v1
  .line 1483
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->commitTicked:I
    sub-int v1, p1, v1
  .line 1484
    if-gtz v1, :L1
    monitor-exit v0
    return-void
  :L1
  .line 1485
    iput p1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->commitTicked:I
  .line 1486
    monitor-exit v0
  :L2
  .line 1487
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tick(I)V
  .line 1488
    return-void
  :L3
  .line 1486
    move-exception p1
  :L4
    monitor-exit v0
  :L5
    throw p1
.end method

.method private pass()V
  .catchall { :L5 .. :L11 } :L86
  .catchall { :L12 .. :L13 } :L14
  .catchall { :L15 .. :L16 } :L17
  .catchall { :L19 .. :L50 } :L86
  .catchall { :L50 .. :L51 } :L52
  .catchall { :L53 .. :L72 } :L86
  .catchall { :L73 .. :L75 } :L85
  .catchall { :L75 .. :L76 } :L77
  .catchall { :L78 .. :L79 } :L80
  .catchall { :L82 .. :L84 } :L83
  .catchall { :L87 .. :L88 } :L89
  .catchall { :L90 .. :L91 } :L92
  .catchall { :L94 .. :L95 } :L96
  .catchall { :L97 .. :L98 } :L96
  .registers 43
  .line 1514
    move-object/from16 v9, p0
  .line 1515
    nop
  .line 1516
    nop
  .line 1517
    nop
  .line 1518
    nop
  .line 1519
    nop
  .line 1520
    nop
  .line 1521
    nop
  .line 1522
    new-instance v10, Lcom/innioasis/y1/activity/IppActivity$Steps;
    invoke-direct { v10 }, Lcom/innioasis/y1/activity/IppActivity$Steps;-><init>()V
  .line 1523
    iget v0, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->mask:I
    and-int/lit8 v1, v0, 1
    if-eqz v1, :L0
    const/4 v13, 1
    goto :L1
  :L0
    const/4 v13, 0
  :L1
  .line 1524
    and-int/lit8 v1, v0, 2
    if-eqz v1, :L2
    const/4 v14, 1
    goto :L3
  :L2
    const/4 v14, 0
  :L3
  .line 1525
    and-int/lit8 v0, v0, 8
    if-eqz v0, :L4
    const/4 v15, 1
    goto :L5
  :L4
    const/4 v15, 0
  :L5
  .line 1528
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 1529
    if-nez v0, :L6
    const/4 v8, 0
    goto :L7
  :L6
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v1
    move v8, v1
  :L7
  .line 1531
    nop
  .line 1532
    const-wide/16 v16, 0
    move-wide/from16 v2, v16
    const/4 v1, 0
  :L8
    if-ge v1, v8, :L10
  .line 1533
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/y1/database/Song;
  .line 1534
    if-eqz v4, :L9
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide v5
    cmp-long v7, v5, v2
    if-lez v7, :L9
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide v2
  :L9
  .line 1532
    add-int/lit8 v1, v1, 1
    goto :L8
  :L10
  .line 1536
    const-wide/16 v4, 1000
    div-long/2addr v2, v4
    long-to-int v7, v2
  .line 1538
    iget-object v1, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    iget v2, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->mask:I
    invoke-static { v1, v8, v7, v2 }, Lcom/innioasis/ipp/Albums;->cached(Landroid/content/Context;III)Z
    move-result v1
  :L11
    if-eqz v1, :L19
  .line 1539
    nop
  :L12
  .line 1690
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->endCache()V
  :L13
    goto :L15
  :L14
    move-exception v0
  :L15
  .line 1691
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  :L16
    goto :L18
  :L17
    move-exception v0
  :L18
  .line 1692
    nop
  .line 1697
    const/4 v0, -1
    iget-object v1, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v1, v0 }, Lcom/innioasis/y1/activity/IppActivity;->cacheFinished(I)V
  .line 1540
    return-void
  :L19
  .line 1542
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->beginCache()V
  .line 1543
    new-instance v1, Ljava/util/HashMap;
    invoke-direct { v1 }, Ljava/util/HashMap;-><init>()V
  .line 1544
    iget-object v2, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    const v3, 2131821074
    invoke-virtual { v2, v3 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object v2
    iput-object v2, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->label:Ljava/lang/String;
  .line 1545
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
  .line 1548
    new-instance v6, Ljava/util/LinkedHashMap;
    invoke-direct { v6 }, Ljava/util/LinkedHashMap;-><init>()V
  .line 1549
    const/4 v4, 0
  :L20
    if-ge v4, v8, :L27
  .line 1550
    invoke-interface { v0, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Lcom/innioasis/y1/database/Song;
  .line 1551
    if-eqz v5, :L25
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v18
    if-nez v18, :L21
    move/from16 v20, v7
    goto :L26
  :L21
  .line 1552
    invoke-static { v5, v1 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;Ljava/util/HashMap;)Ljava/lang/String;
    move-result-object v11
  .line 1553
    if-nez v11, :L22
    move/from16 v20, v7
    goto :L26
  :L22
  .line 1554
    invoke-virtual { v6, v11 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v19
    check-cast v19, Lcom/innioasis/y1/database/Song;
  .line 1555
    if-eqz v19, :L23
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v12
    move/from16 v20, v7
    invoke-virtual/range { v19 .. v19 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v7
    invoke-virtual { v12, v7 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result v7
    if-gez v7, :L26
    goto :L24
  :L23
    move/from16 v20, v7
  :L24
    invoke-virtual { v6, v11, v5 }, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    goto :L26
  :L25
  .line 1551
    move/from16 v20, v7
  :L26
  .line 1549
    add-int/lit8 v4, v4, 1
    move/from16 v7, v20
    goto :L20
  :L27
  .line 1558
    move/from16 v20, v7
    new-instance v11, Ljava/util/ArrayList;
    invoke-virtual { v6 }, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;
    move-result-object v4
    invoke-direct { v11, v4 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 1559
    invoke-virtual { v11 }, Ljava/util/ArrayList;->size()I
    move-result v12
  .line 1562
    mul-int/lit8 v4, v8, 2
    if-eqz v14, :L28
    div-int/lit8 v5, v4, 5
    goto :L29
  :L28
    const/4 v5, 0
  :L29
    add-int/2addr v4, v5
    if-eqz v15, :L30
    mul-int/lit8 v5, v12, 2
    goto :L31
  :L30
    const/4 v5, 0
  :L31
    add-int/2addr v4, v5
  .line 1563
    add-int/2addr v4, v12
    invoke-virtual { v9, v4 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->scale(I)V
  .line 1566
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v21
  .line 1567
    if-eqz v13, :L36
  .line 1568
    const/4 v5, 0
  :L32
    if-ge v5, v8, :L36
  .line 1569
    invoke-interface { v0, v5 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Lcom/innioasis/y1/database/Song;
  .line 1570
    if-eqz v7, :L35
    invoke-virtual { v7 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v19
    if-nez v19, :L33
    goto :L35
  :L33
  .line 1571
    invoke-virtual { v7 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v19
    invoke-static/range { v19 .. v19 }, Lcom/innioasis/ipp/Art;->coverChanged(Ljava/lang/String;)Z
    move-result v19
    if-nez v19, :L34
    goto :L35
  :L34
  .line 1572
    invoke-static { v7, v1 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;Ljava/util/HashMap;)Ljava/lang/String;
    move-result-object v19
    invoke-static/range { v19 .. v19 }, Lcom/innioasis/ipp/CoverCache;->forget(Ljava/lang/String;)V
  .line 1573
    invoke-virtual { v7 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v19
    invoke-static/range { v19 .. v19 }, Lcom/innioasis/ipp/BigCover;->forget(Ljava/lang/String;)V
  .line 1574
    invoke-virtual { v7 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v7
    invoke-static { v7 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
    invoke-static { v7 }, Lcom/innioasis/ipp/BigCover;->forget(Ljava/lang/String;)V
  :L35
  .line 1568
    add-int/lit8 v5, v5, 1
    goto :L32
  :L36
  .line 1577
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v23
    move/from16 v19, v8
    sub-long v7, v23, v21
  .line 1581
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 1584
    new-instance v5, Ljava/util/ArrayList;
    invoke-direct { v5 }, Ljava/util/ArrayList;-><init>()V
  .line 1585
    nop
  .line 1586
    move-object/from16 v21, v10
    new-instance v10, Ljava/util/HashMap;
    invoke-direct { v10 }, Ljava/util/HashMap;-><init>()V
  .line 1587
    move-wide/from16 v22, v7
    const/4 v7, 0
    const/4 v8, 0
  :L37
    if-ge v7, v12, :L45
  .line 1588
    invoke-virtual { v11, v7 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v24
    move/from16 v25, v14
    move-object/from16 v14, v24
    check-cast v14, Ljava/lang/String;
  .line 1589
    invoke-virtual { v6, v14 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v24
    check-cast v24, Lcom/innioasis/y1/database/Song;
  .line 1590
    move-object/from16 v26, v0
    invoke-virtual/range { v24 .. v24 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
  .line 1591
    move-object/from16 v24, v6
    new-instance v6, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;
    invoke-direct { v6 }, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;-><init>()V
  .line 1592
    iput-object v14, v6, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->key:Ljava/lang/String;
  .line 1593
    iput-object v0, v6, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->path:Ljava/lang/String;
  .line 1594
    if-eqz v13, :L38
    invoke-static { v14 }, Lcom/innioasis/ipp/CoverCache;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v27
    if-nez v27, :L38
    move/from16 v27, v13
    const/4 v13, 1
    goto :L39
  :L38
    move/from16 v27, v13
    const/4 v13, 0
  :L39
    iput-boolean v13, v6, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->thumb:Z
  .line 1595
    iget-boolean v13, v6, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->thumb:Z
    if-eqz v13, :L40
    invoke-static { v14, v0 }, Lcom/innioasis/ipp/Art;->thumbFromTags(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v13
    if-eqz v13, :L40
    const/4 v13, 1
    goto :L41
  :L40
    const/4 v13, 0
  :L41
    iput-boolean v13, v6, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->art:Z
  .line 1596
    invoke-virtual { v1, v6 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1597
    iget-boolean v13, v6, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->art:Z
    if-eqz v13, :L42
    invoke-virtual { v10, v0, v6 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    goto :L43
  :L42
  .line 1598
    invoke-virtual { v5, v6 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L43
  .line 1599
    iget-boolean v0, v6, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->thumb:Z
    if-eqz v0, :L44
    iget-boolean v0, v6, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->art:Z
    if-nez v0, :L44
    add-int/lit8 v8, v8, 1
  :L44
  .line 1600
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tick()V
  .line 1587
    add-int/lit8 v7, v7, 1
    move-object/from16 v6, v24
    move/from16 v14, v25
    move-object/from16 v0, v26
    move/from16 v13, v27
    goto :L37
  :L45
  .line 1602
    move-object/from16 v26, v0
    move-object/from16 v24, v6
    move/from16 v27, v13
    move/from16 v25, v14
    mul-int/lit8 v0, v8, 9
    add-int/2addr v4, v0
    invoke-virtual { v9, v4 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->scale(I)V
  .line 1603
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sub-long v13, v0, v2
  .line 1604
    nop
  .line 1606
    new-instance v7, Ljava/util/HashSet;
    invoke-direct { v7 }, Ljava/util/HashSet;-><init>()V
  .line 1607
    if-eqz v15, :L48
  .line 1608
    const/4 v0, 0
  :L46
    if-ge v0, v12, :L47
    invoke-virtual { v11, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v1
    move-object/from16 v6, v24
    invoke-virtual { v6, v1 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v7, v1 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    add-int/lit8 v0, v0, 1
    move-object/from16 v24, v6
    goto :L46
  :L47
    move-object/from16 v6, v24
    goto :L49
  :L48
  .line 1607
    move-object/from16 v6, v24
  :L49
  .line 1611
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 1612
    invoke-virtual { v9, v5 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->runAlbums(Ljava/util/List;)V
  .line 1613
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    sub-long v28, v2, v0
  .line 1618
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v30
  .line 1619
    if-eqz v26, :L61
    if-lez v19, :L61
  .line 1620
    new-instance v5, Ljava/util/ArrayList;
    move-object/from16 v0, v26
    invoke-direct { v5, v0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  :L50
  .line 1622
    new-instance v0, Lcom/innioasis/y1/activity/IppActivity$ByPath;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Lcom/innioasis/y1/activity/IppActivity$ByPath;-><init>(Lcom/innioasis/y1/activity/IppActivity$1;)V
    invoke-static { v5, v0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  :L51
  .line 1624
    goto :L53
  :L52
  .line 1623
    move-exception v0
  :L53
  .line 1625
    invoke-static { v5 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->folders(Ljava/util/List;)Lcom/innioasis/y1/activity/IppActivity$Blocks;
    move-result-object v0
  .line 1626
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->access$500()I
    move-result v4
    new-array v3, v4, [Lcom/innioasis/y1/activity/IppActivity$SongWorker;
  .line 1627
    const/4 v2, 0
  :L54
    if-ge v2, v4, :L55
  .line 1628
    new-instance v24, Lcom/innioasis/y1/activity/IppActivity$SongWorker;
    move-object/from16 v1, v24
    move/from16 v26, v2
    move-object/from16 v2, p0
    move-object/from16 v32, v3
    move-object v3, v5
    move-wide/from16 v33, v13
    move v13, v4
    move-object v4, v0
    move-object v14, v5
    move/from16 v5, v25
    move-object/from16 v35, v14
    move-object v14, v6
    move/from16 v6, v27
    move/from16 v36, v20
    move-wide/from16 v37, v22
    move-object/from16 v20, v7
    move-object v7, v10
    move/from16 v39, v8
    move-object/from16 v22, v14
    move/from16 v14, v19
    move-object/from16 v8, v20
    invoke-direct/range { v1 .. v8 }, Lcom/innioasis/y1/activity/IppActivity$SongWorker;-><init>(Lcom/innioasis/y1/activity/IppActivity$CacheTask;Ljava/util/List;Lcom/innioasis/y1/activity/IppActivity$Blocks;ZZLjava/util/Map;Ljava/util/HashSet;)V
    aput-object v24, v32, v26
  .line 1627
    add-int/lit8 v2, v26, 1
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
    goto :L54
  :L55
  .line 1630
    move-object/from16 v32, v3
    move/from16 v39, v8
    move-wide/from16 v33, v13
    move/from16 v14, v19
    move/from16 v36, v20
    move-wide/from16 v37, v22
    move v13, v4
    move-object/from16 v22, v6
    invoke-static/range { v32 .. v32 }, Lcom/innioasis/y1/activity/IppActivity;->access$600([Ljava/lang/Runnable;)V
  .line 1632
    invoke-static { }, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;
    move-result-object v0
  .line 1633
    invoke-virtual { v0 }, Ljava/lang/Runtime;->totalMemory()J
    move-result-wide v1
    invoke-virtual { v0 }, Ljava/lang/Runtime;->freeMemory()J
    move-result-wide v3
    sub-long/2addr v1, v3
  .line 1634
    const/4 v0, 0
    const/4 v3, 0
    const/4 v4, 0
  :L56
    if-ge v0, v13, :L57
  .line 1635
    aget-object v5, v32, v0
    iget v5, v5, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->failed:I
    add-int/2addr v3, v5
  .line 1636
    aget-object v5, v32, v0
    iget v5, v5, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->unwritten:I
    add-int/2addr v4, v5
  .line 1637
    aget-object v5, v32, v0
    iget-object v5, v5, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->steps:Lcom/innioasis/y1/activity/IppActivity$Steps;
    move-object/from16 v6, v21
    invoke-virtual { v6, v5 }, Lcom/innioasis/y1/activity/IppActivity$Steps;->add(Lcom/innioasis/y1/activity/IppActivity$Steps;)V
  .line 1638
    aget-object v5, v32, v0
    iget-object v5, v5, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->walk:Lcom/innioasis/ipp/BigCover$Walk;
    invoke-virtual { v6, v5 }, Lcom/innioasis/y1/activity/IppActivity$Steps;->cover(Lcom/innioasis/ipp/BigCover$Walk;)V
  .line 1634
    add-int/lit8 v0, v0, 1
    move-object/from16 v21, v6
    goto :L56
  :L57
  .line 1640
    move-object/from16 v6, v21
    if-eqz v25, :L60
  .line 1641
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v7
  .line 1642
    const/4 v0, 0
  :L58
    if-ge v0, v13, :L59
    aget-object v5, v32, v0
    invoke-virtual { v5 }, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->commit()V
    add-int/lit8 v0, v0, 1
    goto :L58
  :L59
  .line 1643
    invoke-static { }, Lcom/innioasis/ipp/DiscCache;->flush()V
  .line 1644
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v16
    sub-long v16, v16, v7
  .line 1645
    invoke-virtual { v9, v14 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->committedAll(I)V
    move-wide/from16 v40, v1
    move-wide/from16 v0, v16
    move-wide/from16 v16, v40
    goto :L62
  :L60
  .line 1640
    move-wide/from16 v40, v1
    move-wide/from16 v0, v16
    move-wide/from16 v16, v40
    goto :L62
  :L61
  .line 1619
    move/from16 v39, v8
    move-wide/from16 v33, v13
    move/from16 v14, v19
    move/from16 v36, v20
    move-wide/from16 v37, v22
    move-object/from16 v22, v6
    move-object/from16 v6, v21
  .line 1648
    move-wide/from16 v0, v16
    const/4 v3, 0
    const/4 v4, 0
  :L62
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v7
    sub-long v7, v7, v30
  .line 1651
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v20
  .line 1652
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  .line 1653
    invoke-virtual { v10 }, Ljava/util/HashMap;->values()Ljava/util/Collection;
    move-result-object v5
    invoke-interface { v5 }, Ljava/util/Collection;->iterator()Ljava/util/Iterator;
    move-result-object v5
  :L63
  .line 1654
    invoke-interface { v5 }, Ljava/util/Iterator;->hasNext()Z
    move-result v10
    if-eqz v10, :L65
  .line 1655
    invoke-interface { v5 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v10
    check-cast v10, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;
  .line 1656
    iget-boolean v13, v10, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->done:Z
    if-nez v13, :L64
    invoke-virtual { v2, v10 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L64
  .line 1657
    goto :L63
  :L65
  .line 1658
    invoke-virtual { v9, v2 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->runAlbums(Ljava/util/List;)V
  .line 1659
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v23
    sub-long v23, v23, v20
    move v10, v4
    add-long v4, v28, v23
  .line 1662
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v20
  .line 1663
    if-eqz v15, :L71
  .line 1664
    const/4 v13, 0
  :L66
    if-ge v13, v12, :L71
  .line 1665
    invoke-virtual { v11, v13 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v15
    move/from16 v19, v12
    move-object/from16 v12, v22
    invoke-virtual { v12, v15 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v15
    check-cast v15, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v15 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v15
  .line 1666
    invoke-static { v15 }, Lcom/innioasis/ipp/FlowCache;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v22
  .line 1667
    if-eqz v22, :L67
    invoke-virtual/range { v22 .. v22 }, Ljava/io/File;->exists()Z
    move-result v22
    if-nez v22, :L67
    const/16 v22, 1
    goto :L68
  :L67
    const/16 v22, 0
  :L68
  .line 1668
    invoke-static { v15 }, Lcom/innioasis/ipp/Flow;->cacheSlide(Ljava/lang/String;)Z
    move-result v15
    if-nez v15, :L69
    add-int/lit8 v10, v10, 1
    goto :L70
  :L69
  .line 1669
    if-eqz v22, :L70
    invoke-virtual { v11, v13 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v15
    check-cast v15, Ljava/lang/String;
    invoke-virtual { v9, v15 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touch(Ljava/lang/String;)V
  :L70
  .line 1670
    const/4 v15, 2
    invoke-virtual { v9, v15 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tick(I)V
  .line 1664
    add-int/lit8 v13, v13, 1
    move-object/from16 v22, v12
    move/from16 v12, v19
    goto :L66
  :L71
  .line 1673
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v11
    sub-long v11, v11, v20
  .line 1676
    iget v13, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
    invoke-virtual { v9, v13 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tick(I)V
  :L72
  .line 1677
    if-nez v3, :L74
    if-nez v10, :L74
  :L73
    iget-object v13, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    iget v15, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->mask:I
    move/from16 v9, v36
    invoke-static { v13, v14, v9, v15 }, Lcom/innioasis/ipp/Albums;->noteCached(Landroid/content/Context;III)V
  :L74
  .line 1678
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
  .line 1680
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
  .line 1682
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
  .line 1678
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 1685
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
  .line 1686
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
  :L75
  .line 1690
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->endCache()V
  :L76
    goto :L78
  :L77
    move-exception v0
  :L78
  .line 1691
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  :L79
    goto :L81
  :L80
    move-exception v0
  :L81
  .line 1692
    nop
  .line 1693
    move-object/from16 v1, p0
    iget-object v2, v1, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touched:Ljava/util/HashSet;
    monitor-enter v2
  :L82
  .line 1694
    iget-object v0, v1, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touched:Ljava/util/HashSet;
    invoke-virtual { v0 }, Ljava/util/HashSet;->size()I
    move-result v0
  .line 1695
    monitor-exit v2
    goto :L95
  :L83
    move-exception v0
    monitor-exit v2
  :L84
    throw v0
  :L85
  .line 1687
    move-exception v0
    move-object/from16 v1, p0
    goto :L87
  :L86
    move-exception v0
    move-object v1, v9
  :L87
  .line 1690
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->endCache()V
  :L88
    goto :L90
  :L89
    move-exception v0
  :L90
  .line 1691
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  :L91
    goto :L93
  :L92
    move-exception v0
  :L93
  .line 1692
    nop
  .line 1693
    iget-object v2, v1, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touched:Ljava/util/HashSet;
    monitor-enter v2
  :L94
  .line 1694
    iget-object v0, v1, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touched:Ljava/util/HashSet;
    invoke-virtual { v0 }, Ljava/util/HashSet;->size()I
    move-result v0
  .line 1695
    monitor-exit v2
  :L95
  .line 1697
    iget-object v2, v1, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v2, v0 }, Lcom/innioasis/y1/activity/IppActivity;->cacheFinished(I)V
  .line 1698
    nop
  .line 1699
    return-void
  :L96
  .line 1695
    move-exception v0
  :L97
    monitor-exit v2
  :L98
    goto :L100
  :L99
    throw v0
  :L100
    goto :L99
.end method

.method committed(I)V
  .catchall { :L0 .. :L1 } :L2
  .catchall { :L3 .. :L4 } :L2
  .registers 4
  .line 1468
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->lock:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 1469
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->committed:I
    add-int/2addr v1, p1
    iput v1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->committed:I
  .line 1470
    monitor-exit v0
  :L1
  .line 1471
    invoke-direct { p0, v1 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->commitUpTo(I)V
  .line 1472
    return-void
  :L2
  .line 1470
    move-exception p1
  :L3
    monitor-exit v0
  :L4
    throw p1
.end method

.method committedAll(I)V
  .registers 2
  .line 1476
    invoke-direct { p0, p1 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->commitUpTo(I)V
  .line 1477
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L2 } :L1
  .registers 3
  .line 1508
    sget-object v0, Lcom/innioasis/ipp/Pick;->LOCK:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 1509
    invoke-direct { p0 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->pass()V
  .line 1510
    monitor-exit v0
  .line 1511
    return-void
  :L1
  .line 1510
    move-exception v1
    monitor-exit v0
  :L2
    throw v1
.end method

.method runAlbums(Ljava/util/List;)V
  .registers 7
  .line 1499
    invoke-interface { p1 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    return-void
  :L0
  .line 1500
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v0
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->each(I)Lcom/innioasis/y1/activity/IppActivity$Blocks;
    move-result-object v0
  .line 1501
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->access$500()I
    move-result v1
    new-array v2, v1, [Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;
  .line 1502
    const/4 v3, 0
  :L1
    if-ge v3, v1, :L2
    new-instance v4, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;
    invoke-direct { v4, p0, p1, v0 }, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;-><init>(Lcom/innioasis/y1/activity/IppActivity$CacheTask;Ljava/util/List;Lcom/innioasis/y1/activity/IppActivity$Blocks;)V
    aput-object v4, v2, v3
    add-int/lit8 v3, v3, 1
    goto :L1
  :L2
  .line 1503
    invoke-static { v2 }, Lcom/innioasis/y1/activity/IppActivity;->access$600([Ljava/lang/Runnable;)V
  .line 1504
    return-void
.end method

.method scale(I)V
  .catchall { :L0 .. :L2 } :L1
  .registers 3
  .line 1492
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->lock:Ljava/lang/Object;
    monitor-enter v0
  .line 1493
    if-gtz p1, :L0
    const/4 p1, 1
  :L0
    iput p1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
  .line 1494
    monitor-exit v0
  .line 1495
    return-void
  :L1
  .line 1494
    move-exception p1
    monitor-exit v0
  :L2
    throw p1
.end method

.method tick()V
  .registers 2
  .line 1447
    const/4 v0, 1
    invoke-virtual { p0, v0 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tick(I)V
  .line 1448
    return-void
.end method

.method tick(I)V
  .catchall { :L0 .. :L3 } :L4
  .catchall { :L5 .. :L6 } :L4
  .registers 7
  .line 1453
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->lock:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 1454
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->progress:I
    add-int/2addr v1, p1
    iput v1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->progress:I
  .line 1455
    int-to-long v1, v1
    const-wide/16 v3, 100
    mul-long v1, v1, v3
    iget p1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
    int-to-long v3, p1
    div-long/2addr v1, v3
    long-to-int p1, v1
  .line 1456
    const/16 v1, 100
    if-le p1, v1, :L1
    const/16 p1, 100
  :L1
  .line 1457
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->shown:I
    if-gt p1, v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 1458
    iput p1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->shown:I
  .line 1459
    monitor-exit v0
  :L3
  .line 1460
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->label:Ljava/lang/String;
    invoke-static { v1, p1 }, Lcom/innioasis/ipp/Loading;->percent(Ljava/lang/String;I)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { v0, p1 }, Lcom/innioasis/y1/activity/IppActivity;->scanTick(Ljava/lang/String;)V
  .line 1461
    return-void
  :L4
  .line 1459
    move-exception p1
  :L5
    monitor-exit v0
  :L6
    throw p1
.end method

.method touch(Ljava/lang/String;)V
  .catchall { :L1 .. :L3 } :L2
  .registers 4
  .line 1440
    if-nez p1, :L0
    return-void
  :L0
  .line 1441
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touched:Ljava/util/HashSet;
    monitor-enter v0
  :L1
  .line 1442
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touched:Ljava/util/HashSet;
    invoke-virtual { v1, p1 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  .line 1443
    monitor-exit v0
  .line 1444
    return-void
  :L2
  .line 1443
    move-exception p1
    monitor-exit v0
  :L3
    throw p1
.end method
