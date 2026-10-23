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
  .catchall { :L5 .. :L11 } :L93
  .catchall { :L12 .. :L13 } :L14
  .catchall { :L15 .. :L16 } :L17
  .catchall { :L18 .. :L19 } :L20
  .catchall { :L22 .. :L53 } :L93
  .catchall { :L53 .. :L54 } :L55
  .catchall { :L56 .. :L76 } :L93
  .catchall { :L77 .. :L79 } :L92
  .catchall { :L79 .. :L80 } :L81
  .catchall { :L82 .. :L83 } :L84
  .catchall { :L85 .. :L86 } :L87
  .catchall { :L89 .. :L91 } :L90
  .catchall { :L94 .. :L95 } :L96
  .catchall { :L97 .. :L98 } :L99
  .catchall { :L100 .. :L101 } :L102
  .catchall { :L104 .. :L105 } :L106
  .catchall { :L107 .. :L108 } :L106
  .registers 31
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
    if-eqz v3, :L22
  .line 1325
    nop
  :L12
  .line 1466
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->endCache()V
  :L13
    goto :L15
  :L14
    move-exception v0
  :L15
  .line 1467
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->endCache()V
  :L16
    goto :L18
  :L17
    move-exception v0
  :L18
  .line 1468
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  :L19
    goto :L21
  :L20
    move-exception v0
  :L21
  .line 1469
    nop
  .line 1474
    const/4 v0, -1
    iget-object v1, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v1, v0 }, Lcom/innioasis/y1/activity/IppActivity;->cacheFinished(I)V
  .line 1326
    return-void
  :L22
  .line 1328
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->beginCache()V
  .line 1329
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->beginCache()V
  .line 1330
    new-instance v3, Ljava/util/HashMap;
    invoke-direct { v3 }, Ljava/util/HashMap;-><init>()V
  .line 1333
    if-eqz v13, :L27
  .line 1334
    const/4 v4, 0
  :L23
    if-ge v4, v8, :L27
  .line 1335
    invoke-interface { v0, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Lcom/innioasis/y1/database/Song;
  .line 1336
    if-eqz v5, :L26
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v6
    if-nez v6, :L24
    goto :L26
  :L24
  .line 1337
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v6
    invoke-static { v6 }, Lcom/innioasis/ipp/Art;->coverChanged(Ljava/lang/String;)Z
    move-result v6
    if-nez v6, :L25
    goto :L26
  :L25
  .line 1338
    invoke-static { v5, v3 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;Ljava/util/HashMap;)Ljava/lang/String;
    move-result-object v6
    invoke-static { v6 }, Lcom/innioasis/ipp/CoverCache;->forget(Ljava/lang/String;)V
  .line 1339
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v6
    invoke-static { v6 }, Lcom/innioasis/ipp/BigCover;->forget(Ljava/lang/String;)V
  .line 1340
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v5
    invoke-static { v5 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
    invoke-static { v5 }, Lcom/innioasis/ipp/BigCover;->forget(Ljava/lang/String;)V
  :L26
  .line 1334
    add-int/lit8 v4, v4, 1
    goto :L23
  :L27
  .line 1345
    new-instance v6, Ljava/util/LinkedHashMap;
    invoke-direct { v6 }, Ljava/util/LinkedHashMap;-><init>()V
  .line 1346
    const/4 v4, 0
  :L28
    if-ge v4, v8, :L33
  .line 1347
    invoke-interface { v0, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Lcom/innioasis/y1/database/Song;
  .line 1348
    if-eqz v5, :L32
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v16
    if-nez v16, :L29
    goto :L32
  :L29
  .line 1349
    invoke-static { v5, v3 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;Ljava/util/HashMap;)Ljava/lang/String;
    move-result-object v1
  .line 1350
    if-nez v1, :L30
    goto :L32
  :L30
  .line 1351
    invoke-virtual { v6, v1 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/database/Song;
  .line 1352
    if-eqz v2, :L31
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v11
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v11, v2 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result v2
    if-gez v2, :L32
  :L31
    invoke-virtual { v6, v1, v5 }, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L32
  .line 1346
    add-int/lit8 v4, v4, 1
    goto :L28
  :L33
  .line 1355
    new-instance v11, Ljava/util/ArrayList;
    invoke-virtual { v6 }, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;
    move-result-object v1
    invoke-direct { v11, v1 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 1356
    invoke-virtual { v11 }, Ljava/util/ArrayList;->size()I
    move-result v5
  .line 1357
    iget-object v1, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    const v2, 2131821074
    invoke-virtual { v1, v2 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object v1
    iput-object v1, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->label:Ljava/lang/String;
  .line 1359
    add-int v1, v5, v8
    if-eqz v15, :L34
    move v2, v5
    goto :L35
  :L34
    const/4 v2, 0
  :L35
    add-int/2addr v1, v2
    iput v1, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
  .line 1360
    if-gtz v1, :L36
    iput v12, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
  :L36
  .line 1361
    iget v1, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
    div-int/lit8 v1, v1, 60
    iput v1, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tickEvery:I
  .line 1362
    if-ge v1, v12, :L37
    iput v12, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tickEvery:I
  :L37
  .line 1366
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 1369
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  .line 1370
    new-instance v4, Ljava/util/HashMap;
    invoke-direct { v4 }, Ljava/util/HashMap;-><init>()V
  .line 1371
    const/4 v3, 0
  :L38
    if-ge v3, v5, :L50
  .line 1372
    invoke-virtual { v11, v3 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v18
    move-object/from16 v12, v18
    check-cast v12, Ljava/lang/String;
  .line 1373
    invoke-virtual { v6, v12 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v18
    check-cast v18, Lcom/innioasis/y1/database/Song;
  .line 1374
    if-eqz v14, :L41
    invoke-static { v12 }, Lcom/innioasis/ipp/AlbumInfo;->artist(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v19
    if-eqz v19, :L40
    invoke-static { v12 }, Lcom/innioasis/ipp/AlbumInfo;->path(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v19
    if-nez v19, :L39
    goto :L40
  :L39
    move/from16 v19, v7
    move-object/from16 v20, v10
    goto :L42
  :L40
  .line 1375
    move/from16 v19, v7
    invoke-virtual/range { v18 .. v18 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v7
    move-object/from16 v20, v10
    invoke-virtual/range { v18 .. v18 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v10
    invoke-static { v12, v7, v10 }, Lcom/innioasis/ipp/AlbumInfo;->put(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    goto :L42
  :L41
  .line 1374
    move/from16 v19, v7
    move-object/from16 v20, v10
  :L42
  .line 1377
    invoke-static { v12 }, Lcom/innioasis/ipp/AlbumInfo;->path(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
  .line 1378
    if-nez v7, :L43
    invoke-virtual/range { v18 .. v18 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v7
  :L43
  .line 1379
    new-instance v10, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;
    invoke-direct { v10 }, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;-><init>()V
  .line 1380
    iput-object v12, v10, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->key:Ljava/lang/String;
  .line 1381
    iput-object v7, v10, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->path:Ljava/lang/String;
  .line 1382
    if-eqz v13, :L44
    invoke-static { v12 }, Lcom/innioasis/ipp/CoverCache;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v18
    if-nez v18, :L44
    move/from16 v18, v13
    const/4 v13, 1
    goto :L45
  :L44
    move/from16 v18, v13
    const/4 v13, 0
  :L45
    iput-boolean v13, v10, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->thumb:Z
  .line 1383
    iget-boolean v13, v10, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->thumb:Z
    if-eqz v13, :L46
    invoke-static { v12, v7 }, Lcom/innioasis/ipp/Art;->thumbFromTags(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v12
    if-eqz v12, :L46
    const/4 v12, 1
    goto :L47
  :L46
    const/4 v12, 0
  :L47
    iput-boolean v12, v10, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->art:Z
  .line 1384
    invoke-virtual { v1, v10 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1385
    iget-boolean v12, v10, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->art:Z
    if-eqz v12, :L48
    invoke-virtual { v4, v7, v10 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    goto :L49
  :L48
  .line 1386
    invoke-virtual { v2, v10 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L49
  .line 1371
    add-int/lit8 v3, v3, 1
    move/from16 v13, v18
    move/from16 v7, v19
    move-object/from16 v10, v20
    const/4 v12, 1
    goto/16 :L38
  :L50
  .line 1389
    move/from16 v19, v7
    move-object/from16 v20, v10
    move/from16 v18, v13
    new-instance v10, Ljava/util/HashSet;
    invoke-direct { v10 }, Ljava/util/HashSet;-><init>()V
  .line 1390
    if-eqz v15, :L52
  .line 1391
    const/4 v1, 0
  :L51
    if-ge v1, v5, :L52
    invoke-virtual { v11, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v3
    invoke-virtual { v6, v3 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v10, v3 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    add-int/lit8 v1, v1, 1
    goto :L51
  :L52
  .line 1394
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v12
  .line 1395
    invoke-virtual { v9, v2 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->runAlbums(Ljava/util/List;)V
  .line 1396
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    sub-long v12, v1, v12
  .line 1401
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v21
  .line 1402
    if-eqz v0, :L63
    if-lez v8, :L63
  .line 1403
    new-instance v7, Ljava/util/ArrayList;
    invoke-direct { v7, v0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  :L53
  .line 1405
    new-instance v0, Lcom/innioasis/y1/activity/IppActivity$ByPath;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Lcom/innioasis/y1/activity/IppActivity$ByPath;-><init>(Lcom/innioasis/y1/activity/IppActivity$1;)V
    invoke-static { v7, v0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  :L54
  .line 1407
    goto :L56
  :L55
  .line 1406
    move-exception v0
  :L56
  .line 1408
    invoke-static { v7 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->folders(Ljava/util/List;)Lcom/innioasis/y1/activity/IppActivity$Blocks;
    move-result-object v0
  .line 1409
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->access$500()I
    move-result v3
    new-array v2, v3, [Lcom/innioasis/y1/activity/IppActivity$SongWorker;
  .line 1410
    const/4 v1, 0
  :L57
    if-ge v1, v3, :L58
  .line 1411
    new-instance v16, Lcom/innioasis/y1/activity/IppActivity$SongWorker;
    move/from16 v17, v1
    move-object/from16 v1, v16
    move-object/from16 v23, v2
    move-object/from16 v2, p0
    move-object/from16 v24, v11
    move v11, v3
    move-object v3, v7
    move-object/from16 v25, v4
    move-object v4, v0
    move/from16 v26, v5
    move v5, v14
    move-object/from16 v27, v6
    move/from16 v6, v18
    move/from16 v28, v19
    move-object/from16 v19, v7
    move-object/from16 v7, v25
    move/from16 v29, v8
    move-object v8, v10
    invoke-direct/range { v1 .. v8 }, Lcom/innioasis/y1/activity/IppActivity$SongWorker;-><init>(Lcom/innioasis/y1/activity/IppActivity$CacheTask;Ljava/util/List;Lcom/innioasis/y1/activity/IppActivity$Blocks;ZZLjava/util/Map;Ljava/util/HashSet;)V
    aput-object v16, v23, v17
  .line 1410
    add-int/lit8 v1, v17, 1
    move v3, v11
    move-object/from16 v7, v19
    move-object/from16 v2, v23
    move-object/from16 v11, v24
    move-object/from16 v4, v25
    move/from16 v5, v26
    move-object/from16 v6, v27
    move/from16 v19, v28
    move/from16 v8, v29
    goto :L57
  :L58
  .line 1413
    move-object/from16 v23, v2
    move-object/from16 v25, v4
    move/from16 v26, v5
    move-object/from16 v27, v6
    move/from16 v29, v8
    move-object/from16 v24, v11
    move/from16 v28, v19
    move v11, v3
    invoke-static/range { v23 .. v23 }, Lcom/innioasis/y1/activity/IppActivity;->access$600([Ljava/lang/Runnable;)V
  .line 1415
    invoke-static { }, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;
    move-result-object v0
  .line 1416
    invoke-virtual { v0 }, Ljava/lang/Runtime;->totalMemory()J
    move-result-wide v1
    invoke-virtual { v0 }, Ljava/lang/Runtime;->freeMemory()J
    move-result-wide v3
    sub-long/2addr v1, v3
  .line 1417
    const/4 v0, 0
    const/4 v3, 0
    const/4 v4, 0
  :L59
    if-ge v0, v11, :L60
  .line 1418
    aget-object v5, v23, v0
    iget v5, v5, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->failed:I
    add-int/2addr v3, v5
  .line 1419
    aget-object v5, v23, v0
    iget v5, v5, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->unwritten:I
    add-int/2addr v4, v5
  .line 1420
    aget-object v5, v23, v0
    iget-object v5, v5, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->steps:Lcom/innioasis/y1/activity/IppActivity$Steps;
    move-object/from16 v6, v20
    invoke-virtual { v6, v5 }, Lcom/innioasis/y1/activity/IppActivity$Steps;->add(Lcom/innioasis/y1/activity/IppActivity$Steps;)V
  .line 1421
    aget-object v5, v23, v0
    iget-object v5, v5, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->walk:Lcom/innioasis/ipp/BigCover$Walk;
    invoke-virtual { v6, v5 }, Lcom/innioasis/y1/activity/IppActivity$Steps;->cover(Lcom/innioasis/ipp/BigCover$Walk;)V
  .line 1417
    add-int/lit8 v0, v0, 1
    move-object/from16 v20, v6
    goto :L59
  :L60
  .line 1423
    move-object/from16 v6, v20
    if-eqz v14, :L64
  .line 1424
    const/4 v0, 0
  :L61
    if-ge v0, v11, :L62
    aget-object v5, v23, v0
    invoke-virtual { v5 }, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->commit()V
    add-int/lit8 v0, v0, 1
    goto :L61
  :L62
  .line 1425
    invoke-static { }, Lcom/innioasis/ipp/DiscCache;->flush()V
    goto :L64
  :L63
  .line 1402
    move-object/from16 v25, v4
    move/from16 v26, v5
    move-object/from16 v27, v6
    move/from16 v29, v8
    move-object/from16 v24, v11
    move/from16 v28, v19
    move-object/from16 v6, v20
  .line 1428
    const-wide/16 v1, 0
    const/4 v3, 0
    const/4 v4, 0
  :L64
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v7
    sub-long v7, v7, v21
  .line 1431
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v10
  .line 1432
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1433
    invoke-virtual/range { v25 .. v25 }, Ljava/util/HashMap;->values()Ljava/util/Collection;
    move-result-object v5
    invoke-interface { v5 }, Ljava/util/Collection;->iterator()Ljava/util/Iterator;
    move-result-object v5
  :L65
  .line 1434
    invoke-interface { v5 }, Ljava/util/Iterator;->hasNext()Z
    move-result v14
    if-eqz v14, :L67
  .line 1435
    invoke-interface { v5 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v14
    check-cast v14, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;
  .line 1436
    move/from16 v16, v4
    iget-boolean v4, v14, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->done:Z
    if-nez v4, :L66
    invoke-virtual { v0, v14 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L66
  .line 1437
    move/from16 v4, v16
    goto :L65
  :L67
  .line 1438
    move/from16 v16, v4
    invoke-virtual { v9, v0 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->runAlbums(Ljava/util/List;)V
  .line 1439
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
    sub-long/2addr v4, v10
    add-long/2addr v12, v4
  .line 1442
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
  .line 1443
    if-eqz v15, :L74
  .line 1444
    const/4 v10, 0
  :L68
    move/from16 v11, v26
    if-ge v10, v11, :L73
  .line 1445
    move-object/from16 v14, v24
    invoke-virtual { v14, v10 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v15
    move/from16 v26, v11
    move-object/from16 v11, v27
    invoke-virtual { v11, v15 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v15
    check-cast v15, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v15 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v15
  .line 1446
    invoke-static { v15 }, Lcom/innioasis/ipp/FlowCache;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v17
  .line 1447
    if-eqz v17, :L69
    invoke-virtual/range { v17 .. v17 }, Ljava/io/File;->exists()Z
    move-result v17
    if-nez v17, :L69
    const/16 v17, 1
    goto :L70
  :L69
    const/16 v17, 0
  :L70
  .line 1448
    invoke-static { v15 }, Lcom/innioasis/ipp/Flow;->cacheSlide(Ljava/lang/String;)Z
    move-result v15
    if-nez v15, :L71
    add-int/lit8 v16, v16, 1
    goto :L72
  :L71
  .line 1449
    if-eqz v17, :L72
    invoke-virtual { v14, v10 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v15
    check-cast v15, Ljava/lang/String;
    invoke-virtual { v9, v15 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touch(Ljava/lang/String;)V
  :L72
  .line 1450
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tick()V
  .line 1444
    add-int/lit8 v10, v10, 1
    move-object/from16 v27, v11
    move-object/from16 v24, v14
    goto :L68
  :L73
    move/from16 v10, v16
    goto :L75
  :L74
  .line 1443
    move/from16 v10, v16
  :L75
  .line 1453
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v14
  :L76
    sub-long/2addr v14, v4
  .line 1456
    if-nez v3, :L78
    if-nez v10, :L78
  :L77
    iget-object v4, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    iget v5, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->mask:I
    move/from16 v9, v28
    move/from16 v11, v29
    invoke-static { v4, v11, v9, v5 }, Lcom/innioasis/ipp/Albums;->noteCached(Landroid/content/Context;III)V
  :L78
  .line 1457
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v5, "cache library: albums "
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, v12, v13 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v4
    const-string v5, " ms ("
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v0
    invoke-virtual { v4, v0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v4, " late), songs "
    invoke-virtual { v0, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v7, v8 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v4, " ms, flow "
    invoke-virtual { v0, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v14, v15 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v4, " ms, "
    invoke-virtual { v0, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
  .line 1458
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->access$500()I
    move-result v4
    invoke-virtual { v0, v4 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v4, " workers, heap "
    invoke-virtual { v0, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const/16 v4, 20
    shr-long/2addr v1, v4
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
  .line 1457
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 1461
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
  .line 1462
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
  :L79
  .line 1466
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->endCache()V
  :L80
    goto :L82
  :L81
    move-exception v0
  :L82
  .line 1467
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->endCache()V
  :L83
    goto :L85
  :L84
    move-exception v0
  :L85
  .line 1468
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  :L86
    goto :L88
  :L87
    move-exception v0
  :L88
  .line 1469
    nop
  .line 1470
    move-object/from16 v1, p0
    iget-object v2, v1, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touched:Ljava/util/HashSet;
    monitor-enter v2
  :L89
  .line 1471
    iget-object v0, v1, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touched:Ljava/util/HashSet;
    invoke-virtual { v0 }, Ljava/util/HashSet;->size()I
    move-result v0
  .line 1472
    monitor-exit v2
    goto :L105
  :L90
    move-exception v0
    monitor-exit v2
  :L91
    throw v0
  :L92
  .line 1463
    move-exception v0
    move-object/from16 v1, p0
    goto :L94
  :L93
    move-exception v0
    move-object v1, v9
  :L94
  .line 1466
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->endCache()V
  :L95
    goto :L97
  :L96
    move-exception v0
  :L97
  .line 1467
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->endCache()V
  :L98
    goto :L100
  :L99
    move-exception v0
  :L100
  .line 1468
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  :L101
    goto :L103
  :L102
    move-exception v0
  :L103
  .line 1469
    nop
  .line 1470
    iget-object v2, v1, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touched:Ljava/util/HashSet;
    monitor-enter v2
  :L104
  .line 1471
    iget-object v0, v1, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touched:Ljava/util/HashSet;
    invoke-virtual { v0 }, Ljava/util/HashSet;->size()I
    move-result v0
  .line 1472
    monitor-exit v2
  :L105
  .line 1474
    iget-object v2, v1, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v2, v0 }, Lcom/innioasis/y1/activity/IppActivity;->cacheFinished(I)V
  .line 1475
    nop
  .line 1476
    return-void
  :L106
  .line 1472
    move-exception v0
  :L107
    monitor-exit v2
  :L108
    goto :L110
  :L109
    throw v0
  :L110
    goto :L109
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
