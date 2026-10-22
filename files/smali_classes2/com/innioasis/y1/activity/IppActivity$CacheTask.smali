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

.field private final a:Lcom/innioasis/y1/activity/IppActivity;

.field private label:Ljava/lang/String;

.field private final lock:Ljava/lang/Object;

.field private final mask:I

.field private progress:I

.field private tickEvery:I

.field private total:I

.field private final touched:Ljava/util/HashSet;

.method constructor <init>(Lcom/innioasis/y1/activity/IppActivity;I)V
  .registers 4
  .line 1267
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1261
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->lock:Ljava/lang/Object;
  .line 1262
    const-string v0, ""
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->label:Ljava/lang/String;
  .line 1263
    const/4 v0, 1
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
  .line 1264
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tickEvery:I
  .line 1273
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touched:Ljava/util/HashSet;
  .line 1268
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
  .line 1269
    iput p2, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->mask:I
  .line 1270
    return-void
.end method

.method public run()V
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
  .registers 32
  .line 1303
    move-object/from16 v9, p0
  .line 1304
    nop
  .line 1305
    nop
  .line 1306
    nop
  .line 1307
    nop
  .line 1308
    new-instance v10, Lcom/innioasis/y1/activity/IppActivity$Steps;
    invoke-direct { v10 }, Lcom/innioasis/y1/activity/IppActivity$Steps;-><init>()V
  .line 1309
    iget v0, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->mask:I
    and-int/lit8 v1, v0, 1
    const/4 v12, 1
    if-eqz v1, :L0
    const/4 v13, 1
    goto :L1
  :L0
    const/4 v13, 0
  :L1
  .line 1310
    and-int/lit8 v1, v0, 2
    if-eqz v1, :L2
    const/4 v14, 1
    goto :L3
  :L2
    const/4 v14, 0
  :L3
  .line 1311
    and-int/lit8 v0, v0, 8
    if-eqz v0, :L4
    const/4 v15, 1
    goto :L5
  :L4
    const/4 v15, 0
  :L5
  .line 1314
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 1315
    if-nez v0, :L6
    const/4 v8, 0
    goto :L7
  :L6
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v1
    move v8, v1
  :L7
  .line 1317
    nop
  .line 1318
    const/4 v3, 0
    const-wide/16 v4, 0
  :L8
    if-ge v3, v8, :L10
  .line 1319
    invoke-interface { v0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lcom/innioasis/y1/database/Song;
  .line 1320
    if-eqz v6, :L9
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide v16
    cmp-long v7, v16, v4
    if-lez v7, :L9
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide v4
  :L9
  .line 1318
    add-int/lit8 v3, v3, 1
    goto :L8
  :L10
  .line 1322
    const-wide/16 v6, 1000
    div-long/2addr v4, v6
    long-to-int v7, v4
  .line 1324
    iget-object v3, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    iget v4, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->mask:I
    invoke-static { v3, v8, v7, v4 }, Lcom/innioasis/ipp/Albums;->cached(Landroid/content/Context;III)Z
    move-result v3
  :L11
    if-eqz v3, :L19
  .line 1325
    nop
  :L12
  .line 1464
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->endCache()V
  :L13
    goto :L15
  :L14
    move-exception v0
  :L15
  .line 1465
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  :L16
    goto :L18
  :L17
    move-exception v0
  :L18
  .line 1466
    nop
  .line 1471
    const/4 v0, -1
    iget-object v1, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v1, v0 }, Lcom/innioasis/y1/activity/IppActivity;->cacheFinished(I)V
  .line 1326
    return-void
  :L19
  .line 1328
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->beginCache()V
  .line 1331
    if-eqz v13, :L24
  .line 1332
    const/4 v3, 0
  :L20
    if-ge v3, v8, :L24
  .line 1333
    invoke-interface { v0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/y1/database/Song;
  .line 1334
    if-eqz v4, :L23
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v5
    if-nez v5, :L21
    goto :L23
  :L21
  .line 1335
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v5
    invoke-static { v5 }, Lcom/innioasis/ipp/Art;->coverChanged(Ljava/lang/String;)Z
    move-result v5
    if-nez v5, :L22
    goto :L23
  :L22
  .line 1336
    invoke-static { v4 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v5
    invoke-static { v5 }, Lcom/innioasis/ipp/CoverCache;->forget(Ljava/lang/String;)V
  .line 1337
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v5
    invoke-static { v5 }, Lcom/innioasis/ipp/BigCover;->forget(Ljava/lang/String;)V
  .line 1338
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v4
    invoke-static { v4 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
    invoke-static { v4 }, Lcom/innioasis/ipp/BigCover;->forget(Ljava/lang/String;)V
  :L23
  .line 1332
    add-int/lit8 v3, v3, 1
    goto :L20
  :L24
  .line 1343
    new-instance v6, Ljava/util/LinkedHashMap;
    invoke-direct { v6 }, Ljava/util/LinkedHashMap;-><init>()V
  .line 1344
    const/4 v3, 0
  :L25
    if-ge v3, v8, :L30
  .line 1345
    invoke-interface { v0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/y1/database/Song;
  .line 1346
    if-eqz v4, :L29
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v5
    if-nez v5, :L26
    goto :L29
  :L26
  .line 1347
    invoke-static { v4 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v5
  .line 1348
    if-nez v5, :L27
    goto :L29
  :L27
  .line 1349
    invoke-virtual { v6, v5 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v16
    check-cast v16, Lcom/innioasis/y1/database/Song;
  .line 1350
    if-eqz v16, :L28
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
    invoke-virtual/range { v16 .. v16 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result v1
    if-gez v1, :L29
  :L28
    invoke-virtual { v6, v5, v4 }, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L29
  .line 1344
    add-int/lit8 v3, v3, 1
    goto :L25
  :L30
  .line 1353
    new-instance v5, Ljava/util/ArrayList;
    invoke-virtual { v6 }, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;
    move-result-object v1
    invoke-direct { v5, v1 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 1354
    invoke-virtual { v5 }, Ljava/util/ArrayList;->size()I
    move-result v4
  .line 1355
    iget-object v1, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    const v2, 2131821074
    invoke-virtual { v1, v2 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    iput-object v1, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->label:Ljava/lang/String;
  .line 1357
    add-int v1, v4, v8
    if-eqz v15, :L31
    move v2, v4
    goto :L32
  :L31
    const/4 v2, 0
  :L32
    add-int/2addr v1, v2
    iput v1, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
  .line 1358
    if-gtz v1, :L33
    iput v12, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
  :L33
  .line 1359
    iget v1, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
    div-int/lit8 v1, v1, 60
    iput v1, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tickEvery:I
  .line 1360
    if-ge v1, v12, :L34
    iput v12, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tickEvery:I
  :L34
  .line 1364
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 1367
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  .line 1368
    new-instance v3, Ljava/util/HashMap;
    invoke-direct { v3 }, Ljava/util/HashMap;-><init>()V
  .line 1369
    const/4 v11, 0
  :L35
    if-ge v11, v4, :L47
  .line 1370
    invoke-virtual { v5, v11 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v19
    move-object/from16 v12, v19
    check-cast v12, Ljava/lang/String;
  .line 1371
    invoke-virtual { v6, v12 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v19
    check-cast v19, Lcom/innioasis/y1/database/Song;
  .line 1372
    if-eqz v14, :L38
    invoke-static { v12 }, Lcom/innioasis/ipp/AlbumInfo;->artist(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v20
    if-eqz v20, :L37
    invoke-static { v12 }, Lcom/innioasis/ipp/AlbumInfo;->path(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v20
    if-nez v20, :L36
    goto :L37
  :L36
    move/from16 v20, v7
    move-object/from16 v21, v10
    goto :L39
  :L37
  .line 1373
    move/from16 v20, v7
    invoke-virtual/range { v19 .. v19 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v7
    move-object/from16 v21, v10
    invoke-virtual/range { v19 .. v19 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v10
    invoke-static { v12, v7, v10 }, Lcom/innioasis/ipp/AlbumInfo;->put(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    goto :L39
  :L38
  .line 1372
    move/from16 v20, v7
    move-object/from16 v21, v10
  :L39
  .line 1375
    invoke-static { v12 }, Lcom/innioasis/ipp/AlbumInfo;->path(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
  .line 1376
    if-nez v7, :L40
    invoke-virtual/range { v19 .. v19 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v7
  :L40
  .line 1377
    new-instance v10, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;
    invoke-direct { v10 }, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;-><init>()V
  .line 1378
    iput-object v12, v10, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->key:Ljava/lang/String;
  .line 1379
    iput-object v7, v10, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->path:Ljava/lang/String;
  .line 1380
    if-eqz v13, :L41
    invoke-static { v12 }, Lcom/innioasis/ipp/CoverCache;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v19
    if-nez v19, :L41
    move/from16 v19, v13
    const/4 v13, 1
    goto :L42
  :L41
    move/from16 v19, v13
    const/4 v13, 0
  :L42
    iput-boolean v13, v10, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->thumb:Z
  .line 1381
    iget-boolean v13, v10, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->thumb:Z
    if-eqz v13, :L43
    invoke-static { v12, v7 }, Lcom/innioasis/ipp/Art;->thumbFromTags(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v12
    if-eqz v12, :L43
    const/4 v12, 1
    goto :L44
  :L43
    const/4 v12, 0
  :L44
    iput-boolean v12, v10, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->art:Z
  .line 1382
    invoke-virtual { v1, v10 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1383
    iget-boolean v12, v10, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->art:Z
    if-eqz v12, :L45
    invoke-virtual { v3, v7, v10 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    goto :L46
  :L45
  .line 1384
    invoke-virtual { v2, v10 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L46
  .line 1369
    add-int/lit8 v11, v11, 1
    move/from16 v13, v19
    move/from16 v7, v20
    move-object/from16 v10, v21
    const/4 v12, 1
    goto/16 :L35
  :L47
  .line 1387
    move/from16 v20, v7
    move-object/from16 v21, v10
    move/from16 v19, v13
    new-instance v10, Ljava/util/HashSet;
    invoke-direct { v10 }, Ljava/util/HashSet;-><init>()V
  .line 1388
    if-eqz v15, :L49
  .line 1389
    const/4 v1, 0
  :L48
    if-ge v1, v4, :L49
    invoke-virtual { v5, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v7
    invoke-virtual { v6, v7 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v7 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v7
    invoke-virtual { v10, v7 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    add-int/lit8 v1, v1, 1
    goto :L48
  :L49
  .line 1392
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v11
  .line 1393
    invoke-virtual { v9, v2 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->runAlbums(Ljava/util/List;)V
  .line 1394
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    sub-long v11, v1, v11
  .line 1399
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v22
  .line 1400
    if-eqz v0, :L61
    if-lez v8, :L61
  .line 1401
    new-instance v13, Ljava/util/ArrayList;
    invoke-direct { v13, v0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  :L50
  .line 1403
    new-instance v0, Lcom/innioasis/y1/activity/IppActivity$ByPath;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Lcom/innioasis/y1/activity/IppActivity$ByPath;-><init>(Lcom/innioasis/y1/activity/IppActivity$1;)V
    invoke-static { v13, v0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  :L51
  .line 1405
    goto :L53
  :L52
  .line 1404
    move-exception v0
  :L53
  .line 1406
    invoke-static { v13 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->folders(Ljava/util/List;)Lcom/innioasis/y1/activity/IppActivity$Blocks;
    move-result-object v0
  .line 1407
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->access$500()I
    move-result v7
    new-array v2, v7, [Lcom/innioasis/y1/activity/IppActivity$SongWorker;
  .line 1408
    const/4 v1, 0
  :L54
    if-ge v1, v7, :L55
  .line 1409
    new-instance v17, Lcom/innioasis/y1/activity/IppActivity$SongWorker;
    move/from16 v18, v1
    move-object/from16 v1, v17
    move-object/from16 v24, v2
    move-object/from16 v2, p0
    move-object/from16 v25, v3
    move-object v3, v13
    move-object/from16 v26, v13
    move v13, v4
    move-object v4, v0
    move-object/from16 v27, v5
    move v5, v14
    move-object/from16 v28, v6
    move/from16 v6, v19
    move/from16 v29, v20
    move-object/from16 v20, v0
    move v0, v7
    move-object/from16 v7, v25
    move/from16 v30, v8
    move-object v8, v10
    invoke-direct/range { v1 .. v8 }, Lcom/innioasis/y1/activity/IppActivity$SongWorker;-><init>(Lcom/innioasis/y1/activity/IppActivity$CacheTask;Ljava/util/List;Lcom/innioasis/y1/activity/IppActivity$Blocks;ZZLjava/util/Map;Ljava/util/HashSet;)V
    aput-object v17, v24, v18
  .line 1408
    add-int/lit8 v1, v18, 1
    move v7, v0
    move v4, v13
    move-object/from16 v0, v20
    move-object/from16 v2, v24
    move-object/from16 v3, v25
    move-object/from16 v13, v26
    move-object/from16 v5, v27
    move-object/from16 v6, v28
    move/from16 v20, v29
    move/from16 v8, v30
    goto :L54
  :L55
  .line 1411
    move-object/from16 v24, v2
    move-object/from16 v25, v3
    move v13, v4
    move-object/from16 v27, v5
    move-object/from16 v28, v6
    move v0, v7
    move/from16 v30, v8
    move/from16 v29, v20
    invoke-static/range { v24 .. v24 }, Lcom/innioasis/y1/activity/IppActivity;->access$600([Ljava/lang/Runnable;)V
  .line 1413
    invoke-static { }, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;
    move-result-object v1
  .line 1414
    invoke-virtual { v1 }, Ljava/lang/Runtime;->totalMemory()J
    move-result-wide v2
    invoke-virtual { v1 }, Ljava/lang/Runtime;->freeMemory()J
    move-result-wide v4
    sub-long/2addr v2, v4
  .line 1415
    const/4 v1, 0
    const/4 v4, 0
    const/4 v5, 0
  :L56
    if-ge v1, v0, :L57
  .line 1416
    aget-object v6, v24, v1
    iget v6, v6, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->failed:I
    add-int/2addr v4, v6
  .line 1417
    aget-object v6, v24, v1
    iget v6, v6, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->unwritten:I
    add-int/2addr v5, v6
  .line 1418
    aget-object v6, v24, v1
    iget-object v6, v6, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->steps:Lcom/innioasis/y1/activity/IppActivity$Steps;
    move-object/from16 v7, v21
    invoke-virtual { v7, v6 }, Lcom/innioasis/y1/activity/IppActivity$Steps;->add(Lcom/innioasis/y1/activity/IppActivity$Steps;)V
  .line 1419
    aget-object v6, v24, v1
    iget-object v6, v6, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->walk:Lcom/innioasis/ipp/BigCover$Walk;
    invoke-virtual { v7, v6 }, Lcom/innioasis/y1/activity/IppActivity$Steps;->cover(Lcom/innioasis/ipp/BigCover$Walk;)V
  .line 1415
    add-int/lit8 v1, v1, 1
    move-object/from16 v21, v7
    goto :L56
  :L57
  .line 1421
    move-object/from16 v7, v21
    if-eqz v14, :L60
  .line 1422
    const/4 v1, 0
  :L58
    if-ge v1, v0, :L59
    aget-object v6, v24, v1
    invoke-virtual { v6 }, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->commit()V
    add-int/lit8 v1, v1, 1
    goto :L58
  :L59
  .line 1423
    invoke-static { }, Lcom/innioasis/ipp/DiscCache;->flush()V
  :L60
  .line 1426
    move-wide v1, v2
    goto :L62
  :L61
  .line 1400
    move-object/from16 v25, v3
    move v13, v4
    move-object/from16 v27, v5
    move-object/from16 v28, v6
    move/from16 v30, v8
    move/from16 v29, v20
    move-object/from16 v7, v21
  .line 1426
    const-wide/16 v1, 0
    const/4 v4, 0
    const/4 v5, 0
  :L62
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v17
    move v0, v5
    sub-long v5, v17, v22
  .line 1429
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v17
  .line 1430
    new-instance v3, Ljava/util/ArrayList;
    invoke-direct { v3 }, Ljava/util/ArrayList;-><init>()V
  .line 1431
    invoke-virtual/range { v25 .. v25 }, Ljava/util/HashMap;->values()Ljava/util/Collection;
    move-result-object v8
    invoke-interface { v8 }, Ljava/util/Collection;->iterator()Ljava/util/Iterator;
    move-result-object v8
  :L63
  .line 1432
    invoke-interface { v8 }, Ljava/util/Iterator;->hasNext()Z
    move-result v10
    if-eqz v10, :L65
  .line 1433
    invoke-interface { v8 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v10
    check-cast v10, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;
  .line 1434
    iget-boolean v14, v10, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->done:Z
    if-nez v14, :L64
    invoke-virtual { v3, v10 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L64
  .line 1435
    goto :L63
  :L65
  .line 1436
    invoke-virtual { v9, v3 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->runAlbums(Ljava/util/List;)V
  .line 1437
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v20
    sub-long v20, v20, v17
    add-long v11, v11, v20
  .line 1440
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v17
  .line 1441
    if-eqz v15, :L71
  .line 1442
    const/4 v8, 0
  :L66
    if-ge v8, v13, :L71
  .line 1443
    move-object/from16 v10, v27
    invoke-virtual { v10, v8 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v14
    move-object/from16 v15, v28
    invoke-virtual { v15, v14 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v14
    check-cast v14, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v14 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v14
  .line 1444
    invoke-static { v14 }, Lcom/innioasis/ipp/FlowCache;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v19
  .line 1445
    if-eqz v19, :L67
    invoke-virtual/range { v19 .. v19 }, Ljava/io/File;->exists()Z
    move-result v19
    if-nez v19, :L67
    const/16 v19, 1
    goto :L68
  :L67
    const/16 v19, 0
  :L68
  .line 1446
    invoke-static { v14 }, Lcom/innioasis/ipp/Flow;->cacheSlide(Ljava/lang/String;)Z
    move-result v14
    if-nez v14, :L69
    add-int/lit8 v0, v0, 1
    goto :L70
  :L69
  .line 1447
    if-eqz v19, :L70
    invoke-virtual { v10, v8 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v14
    check-cast v14, Ljava/lang/String;
    invoke-virtual { v9, v14 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touch(Ljava/lang/String;)V
  :L70
  .line 1448
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tick()V
  .line 1442
    add-int/lit8 v8, v8, 1
    move-object/from16 v27, v10
    move-object/from16 v28, v15
    goto :L66
  :L71
  .line 1451
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v13
  :L72
    sub-long v13, v13, v17
  .line 1454
    if-nez v4, :L74
    if-nez v0, :L74
  :L73
    iget-object v8, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    iget v10, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->mask:I
    move/from16 v9, v29
    move/from16 v15, v30
    invoke-static { v8, v15, v9, v10 }, Lcom/innioasis/ipp/Albums;->noteCached(Landroid/content/Context;III)V
  :L74
  .line 1455
    new-instance v8, Ljava/lang/StringBuilder;
    invoke-direct { v8 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v9, "cache library: albums "
    invoke-virtual { v8, v9 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v8
    invoke-virtual { v8, v11, v12 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v8
    const-string v9, " ms ("
    invoke-virtual { v8, v9 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v8
    invoke-virtual { v3 }, Ljava/util/ArrayList;->size()I
    move-result v3
    invoke-virtual { v8, v3 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v8, " late), songs "
    invoke-virtual { v3, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3, v5, v6 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v5, " ms, flow "
    invoke-virtual { v3, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3, v13, v14 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v5, " ms, "
    invoke-virtual { v3, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
  .line 1456
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->access$500()I
    move-result v5
    invoke-virtual { v3, v5 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v5, " workers, heap "
    invoke-virtual { v3, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    const/16 v5, 20
    shr-long/2addr v1, v5
    invoke-virtual { v3, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, " MB; "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, " file(s) did not read, "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " cover(s) not written"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
  .line 1455
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 1459
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "cache library steps: "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v7 }, Lcom/innioasis/y1/activity/IppActivity$Steps;->line()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 1460
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "cache library cover: "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v7 }, Lcom/innioasis/y1/activity/IppActivity$Steps;->coverLine()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L75
  .line 1464
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->endCache()V
  :L76
    goto :L78
  :L77
    move-exception v0
  :L78
  .line 1465
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  :L79
    goto :L81
  :L80
    move-exception v0
  :L81
  .line 1466
    nop
  .line 1467
    move-object/from16 v1, p0
    iget-object v2, v1, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touched:Ljava/util/HashSet;
    monitor-enter v2
  :L82
  .line 1468
    iget-object v0, v1, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touched:Ljava/util/HashSet;
    invoke-virtual { v0 }, Ljava/util/HashSet;->size()I
    move-result v0
  .line 1469
    monitor-exit v2
    goto :L95
  :L83
    move-exception v0
    monitor-exit v2
  :L84
    throw v0
  :L85
  .line 1461
    move-exception v0
    move-object/from16 v1, p0
    goto :L87
  :L86
    move-exception v0
    move-object v1, v9
  :L87
  .line 1464
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->endCache()V
  :L88
    goto :L90
  :L89
    move-exception v0
  :L90
  .line 1465
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  :L91
    goto :L93
  :L92
    move-exception v0
  :L93
  .line 1466
    nop
  .line 1467
    iget-object v2, v1, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touched:Ljava/util/HashSet;
    monitor-enter v2
  :L94
  .line 1468
    iget-object v0, v1, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touched:Ljava/util/HashSet;
    invoke-virtual { v0 }, Ljava/util/HashSet;->size()I
    move-result v0
  .line 1469
    monitor-exit v2
  :L95
  .line 1471
    iget-object v2, v1, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v2, v0 }, Lcom/innioasis/y1/activity/IppActivity;->cacheFinished(I)V
  .line 1472
    nop
  .line 1473
    return-void
  :L96
  .line 1469
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

.method runAlbums(Ljava/util/List;)V
  .registers 7
  .line 1294
    invoke-interface { p1 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    return-void
  :L0
  .line 1295
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v0
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->each(I)Lcom/innioasis/y1/activity/IppActivity$Blocks;
    move-result-object v0
  .line 1296
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->access$500()I
    move-result v1
    new-array v2, v1, [Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;
  .line 1297
    const/4 v3, 0
  :L1
    if-ge v3, v1, :L2
    new-instance v4, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;
    invoke-direct { v4, p0, p1, v0 }, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;-><init>(Lcom/innioasis/y1/activity/IppActivity$CacheTask;Ljava/util/List;Lcom/innioasis/y1/activity/IppActivity$Blocks;)V
    aput-object v4, v2, v3
    add-int/lit8 v3, v3, 1
    goto :L1
  :L2
  .line 1298
    invoke-static { v2 }, Lcom/innioasis/y1/activity/IppActivity;->access$600([Ljava/lang/Runnable;)V
  .line 1299
    return-void
.end method

.method tick()V
  .catchall { :L0 .. :L2 } :L3
  .catchall { :L4 .. :L5 } :L3
  .registers 5
  .line 1285
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->lock:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 1286
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->progress:I
    add-int/lit8 v1, v1, 1
    iput v1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->progress:I
  .line 1287
    iget v2, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tickEvery:I
    rem-int v2, v1, v2
    if-eqz v2, :L1
    monitor-exit v0
    return-void
  :L1
  .line 1288
    monitor-exit v0
  :L2
  .line 1289
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->label:Ljava/lang/String;
    mul-int/lit8 v1, v1, 100
    iget v3, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
    div-int/2addr v1, v3
    invoke-static { v2, v1 }, Lcom/innioasis/ipp/Loading;->percent(Ljava/lang/String;I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->scanTick(Ljava/lang/String;)V
  .line 1290
    return-void
  :L3
  .line 1288
    move-exception v1
  :L4
    monitor-exit v0
  :L5
    throw v1
.end method

.method touch(Ljava/lang/String;)V
  .catchall { :L1 .. :L3 } :L2
  .registers 4
  .line 1276
    if-nez p1, :L0
    return-void
  :L0
  .line 1277
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touched:Ljava/util/HashSet;
    monitor-enter v0
  :L1
  .line 1278
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touched:Ljava/util/HashSet;
    invoke-virtual { v1, p1 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  .line 1279
    monitor-exit v0
  .line 1280
    return-void
  :L2
  .line 1279
    move-exception p1
    monitor-exit v0
  :L3
    throw p1
.end method
