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
  .catchall { :L5 .. :L13 } :L90
  .catchall { :L14 .. :L15 } :L16
  .catchall { :L17 .. :L18 } :L19
  .catchall { :L21 .. :L52 } :L90
  .catchall { :L52 .. :L53 } :L54
  .catchall { :L55 .. :L76 } :L90
  .catchall { :L77 .. :L79 } :L89
  .catchall { :L79 .. :L80 } :L81
  .catchall { :L82 .. :L83 } :L84
  .catchall { :L86 .. :L88 } :L87
  .catchall { :L91 .. :L92 } :L93
  .catchall { :L94 .. :L95 } :L96
  .catchall { :L98 .. :L99 } :L100
  .catchall { :L101 .. :L102 } :L100
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
    const/4 v11, 0
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
  .line 1313
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 1314
    if-nez v0, :L6
    const/4 v0, 0
    goto :L7
  :L6
    invoke-virtual { v0, v11 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsSync(I)Ljava/util/List;
    move-result-object v0
  :L7
  .line 1315
    if-nez v0, :L8
    const/4 v8, 0
    goto :L9
  :L8
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v2
    move v8, v2
  :L9
  .line 1317
    nop
  .line 1318
    const/4 v4, 0
    const-wide/16 v5, 0
  :L10
    if-ge v4, v8, :L12
  .line 1319
    invoke-interface { v0, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Lcom/innioasis/y1/database/Song;
  .line 1320
    if-eqz v7, :L11
    invoke-virtual { v7 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide v16
    cmp-long v18, v16, v5
    if-lez v18, :L11
    invoke-virtual { v7 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide v5
  :L11
  .line 1318
    add-int/lit8 v4, v4, 1
    goto :L10
  :L12
  .line 1322
    const-wide/16 v16, 1000
    div-long v5, v5, v16
    long-to-int v7, v5
  .line 1324
    iget-object v4, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    iget v5, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->mask:I
    invoke-static { v4, v8, v7, v5 }, Lcom/innioasis/ipp/Albums;->cached(Landroid/content/Context;III)Z
    move-result v4
  :L13
    if-eqz v4, :L21
  .line 1325
    nop
  :L14
  .line 1464
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->endCache()V
  :L15
    goto :L17
  :L16
    move-exception v0
  :L17
  .line 1465
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  :L18
    goto :L20
  :L19
    move-exception v0
  :L20
  .line 1466
    nop
  .line 1471
    const/4 v0, -1
    iget-object v1, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v1, v0 }, Lcom/innioasis/y1/activity/IppActivity;->cacheFinished(I)V
  .line 1326
    return-void
  :L21
  .line 1328
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->beginCache()V
  .line 1331
    if-eqz v13, :L26
  .line 1332
    const/4 v4, 0
  :L22
    if-ge v4, v8, :L26
  .line 1333
    invoke-interface { v0, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Lcom/innioasis/y1/database/Song;
  .line 1334
    if-eqz v5, :L25
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v6
    if-nez v6, :L23
    goto :L25
  :L23
  .line 1335
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v6
    invoke-static { v6 }, Lcom/innioasis/ipp/Art;->coverChanged(Ljava/lang/String;)Z
    move-result v6
    if-nez v6, :L24
    goto :L25
  :L24
  .line 1336
    invoke-static { v5 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v6
    invoke-static { v6 }, Lcom/innioasis/ipp/CoverCache;->forget(Ljava/lang/String;)V
  .line 1337
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v6
    invoke-static { v6 }, Lcom/innioasis/ipp/BigCover;->forget(Ljava/lang/String;)V
  .line 1338
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v5
    invoke-static { v5 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
    invoke-static { v5 }, Lcom/innioasis/ipp/BigCover;->forget(Ljava/lang/String;)V
  :L25
  .line 1332
    add-int/lit8 v4, v4, 1
    goto :L22
  :L26
  .line 1343
    new-instance v6, Ljava/util/LinkedHashMap;
    invoke-direct { v6 }, Ljava/util/LinkedHashMap;-><init>()V
  .line 1344
    const/4 v4, 0
  :L27
    if-ge v4, v8, :L32
  .line 1345
    invoke-interface { v0, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Lcom/innioasis/y1/database/Song;
  .line 1346
    if-eqz v5, :L31
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v16
    if-nez v16, :L28
    goto :L31
  :L28
  .line 1347
    invoke-static { v5 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v2
  .line 1348
    if-nez v2, :L29
    goto :L31
  :L29
  .line 1349
    invoke-virtual { v6, v2 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Song;
  .line 1350
    if-eqz v3, :L30
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v11
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v11, v3 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result v3
    if-gez v3, :L31
  :L30
    invoke-virtual { v6, v2, v5 }, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L31
  .line 1344
    add-int/lit8 v4, v4, 1
    const/4 v11, 0
    goto :L27
  :L32
  .line 1353
    new-instance v11, Ljava/util/ArrayList;
    invoke-virtual { v6 }, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;
    move-result-object v2
    invoke-direct { v11, v2 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 1354
    invoke-virtual { v11 }, Ljava/util/ArrayList;->size()I
    move-result v5
  .line 1355
    iget-object v2, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    const v3, 2131821074
    invoke-virtual { v2, v3 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object v2
    iput-object v2, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->label:Ljava/lang/String;
  .line 1357
    add-int v2, v5, v8
    if-eqz v15, :L33
    move v3, v5
    goto :L34
  :L33
    const/4 v3, 0
  :L34
    add-int/2addr v2, v3
    iput v2, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
  .line 1358
    if-gtz v2, :L35
    iput v12, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
  :L35
  .line 1359
    iget v2, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
    div-int/lit8 v2, v2, 60
    iput v2, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tickEvery:I
  .line 1360
    if-ge v2, v12, :L36
    iput v12, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tickEvery:I
  :L36
  .line 1364
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  .line 1367
    new-instance v3, Ljava/util/ArrayList;
    invoke-direct { v3 }, Ljava/util/ArrayList;-><init>()V
  .line 1368
    new-instance v4, Ljava/util/HashMap;
    invoke-direct { v4 }, Ljava/util/HashMap;-><init>()V
  .line 1369
    const/4 v12, 0
  :L37
    if-ge v12, v5, :L49
  .line 1370
    invoke-virtual { v11, v12 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v19
    move-object/from16 v1, v19
    check-cast v1, Ljava/lang/String;
  .line 1371
    invoke-virtual { v6, v1 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v19
    check-cast v19, Lcom/innioasis/y1/database/Song;
  .line 1372
    if-eqz v14, :L40
    invoke-static { v1 }, Lcom/innioasis/ipp/AlbumInfo;->artist(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v21
    if-eqz v21, :L39
    invoke-static { v1 }, Lcom/innioasis/ipp/AlbumInfo;->path(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v21
    if-nez v21, :L38
    goto :L39
  :L38
    move/from16 v21, v7
    move-object/from16 v22, v10
    goto :L41
  :L39
  .line 1373
    move/from16 v21, v7
    invoke-virtual/range { v19 .. v19 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v7
    move-object/from16 v22, v10
    invoke-virtual/range { v19 .. v19 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v10
    invoke-static { v1, v7, v10 }, Lcom/innioasis/ipp/AlbumInfo;->put(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    goto :L41
  :L40
  .line 1372
    move/from16 v21, v7
    move-object/from16 v22, v10
  :L41
  .line 1375
    invoke-static { v1 }, Lcom/innioasis/ipp/AlbumInfo;->path(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
  .line 1376
    if-nez v7, :L42
    invoke-virtual/range { v19 .. v19 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v7
  :L42
  .line 1377
    new-instance v10, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;
    invoke-direct { v10 }, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;-><init>()V
  .line 1378
    iput-object v1, v10, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->key:Ljava/lang/String;
  .line 1379
    iput-object v7, v10, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->path:Ljava/lang/String;
  .line 1380
    if-eqz v13, :L43
    invoke-static { v1 }, Lcom/innioasis/ipp/CoverCache;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v19
    if-nez v19, :L43
    move/from16 v19, v13
    const/4 v13, 1
    goto :L44
  :L43
    move/from16 v19, v13
    const/4 v13, 0
  :L44
    iput-boolean v13, v10, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->thumb:Z
  .line 1381
    iget-boolean v13, v10, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->thumb:Z
    if-eqz v13, :L45
    invoke-static { v1, v7 }, Lcom/innioasis/ipp/Art;->thumbFromTags(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L45
    const/4 v1, 1
    goto :L46
  :L45
    const/4 v1, 0
  :L46
    iput-boolean v1, v10, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->art:Z
  .line 1382
    invoke-virtual { v2, v10 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1383
    iget-boolean v1, v10, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->art:Z
    if-eqz v1, :L47
    invoke-virtual { v4, v7, v10 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    goto :L48
  :L47
  .line 1384
    invoke-virtual { v3, v10 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L48
  .line 1369
    add-int/lit8 v12, v12, 1
    move/from16 v13, v19
    move/from16 v7, v21
    move-object/from16 v10, v22
    goto/16 :L37
  :L49
  .line 1387
    move/from16 v21, v7
    move-object/from16 v22, v10
    move/from16 v19, v13
    new-instance v10, Ljava/util/HashSet;
    invoke-direct { v10 }, Ljava/util/HashSet;-><init>()V
  .line 1388
    if-eqz v15, :L51
  .line 1389
    const/4 v1, 0
  :L50
    if-ge v1, v5, :L51
    invoke-virtual { v11, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    invoke-virtual { v6, v2 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v10, v2 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    add-int/lit8 v1, v1, 1
    goto :L50
  :L51
  .line 1392
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
  .line 1393
    invoke-virtual { v9, v3 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->runAlbums(Ljava/util/List;)V
  .line 1394
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v12
    sub-long/2addr v12, v1
  .line 1399
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v23
  .line 1400
    if-eqz v0, :L63
    if-lez v8, :L63
  .line 1401
    new-instance v7, Ljava/util/ArrayList;
    invoke-direct { v7, v0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  :L52
  .line 1403
    new-instance v0, Lcom/innioasis/y1/activity/IppActivity$ByPath;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Lcom/innioasis/y1/activity/IppActivity$ByPath;-><init>(Lcom/innioasis/y1/activity/IppActivity$1;)V
    invoke-static { v7, v0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  :L53
  .line 1405
    goto :L55
  :L54
  .line 1404
    move-exception v0
  :L55
  .line 1406
    invoke-static { v7 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->folders(Ljava/util/List;)Lcom/innioasis/y1/activity/IppActivity$Blocks;
    move-result-object v0
  .line 1407
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->access$500()I
    move-result v3
    new-array v2, v3, [Lcom/innioasis/y1/activity/IppActivity$SongWorker;
  .line 1408
    const/4 v1, 0
  :L56
    if-ge v1, v3, :L57
  .line 1409
    new-instance v16, Lcom/innioasis/y1/activity/IppActivity$SongWorker;
    move/from16 v17, v1
    move-object/from16 v1, v16
    move-object/from16 v20, v2
    move-object/from16 v2, p0
    move-object/from16 v25, v11
    move v11, v3
    move-object v3, v7
    move-object/from16 v26, v4
    move-object v4, v0
    move/from16 v27, v5
    move v5, v14
    move-object/from16 v28, v6
    move/from16 v6, v19
    move/from16 v29, v21
    move-object/from16 v21, v7
    move-object/from16 v7, v26
    move/from16 v30, v8
    move-object v8, v10
    invoke-direct/range { v1 .. v8 }, Lcom/innioasis/y1/activity/IppActivity$SongWorker;-><init>(Lcom/innioasis/y1/activity/IppActivity$CacheTask;Ljava/util/List;Lcom/innioasis/y1/activity/IppActivity$Blocks;ZZLjava/util/Map;Ljava/util/HashSet;)V
    aput-object v16, v20, v17
  .line 1408
    add-int/lit8 v1, v17, 1
    move v3, v11
    move-object/from16 v2, v20
    move-object/from16 v7, v21
    move-object/from16 v11, v25
    move-object/from16 v4, v26
    move/from16 v5, v27
    move-object/from16 v6, v28
    move/from16 v21, v29
    move/from16 v8, v30
    goto :L56
  :L57
  .line 1411
    move-object/from16 v20, v2
    move-object/from16 v26, v4
    move/from16 v27, v5
    move-object/from16 v28, v6
    move/from16 v30, v8
    move-object/from16 v25, v11
    move/from16 v29, v21
    move v11, v3
    invoke-static/range { v20 .. v20 }, Lcom/innioasis/y1/activity/IppActivity;->access$600([Ljava/lang/Runnable;)V
  .line 1413
    invoke-static { }, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;
    move-result-object v0
  .line 1414
    invoke-virtual { v0 }, Ljava/lang/Runtime;->totalMemory()J
    move-result-wide v1
    invoke-virtual { v0 }, Ljava/lang/Runtime;->freeMemory()J
    move-result-wide v3
    sub-long/2addr v1, v3
  .line 1415
    const/4 v0, 0
    const/4 v3, 0
    const/4 v4, 0
  :L58
    if-ge v0, v11, :L59
  .line 1416
    aget-object v5, v20, v0
    iget v5, v5, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->failed:I
    add-int/2addr v3, v5
  .line 1417
    aget-object v5, v20, v0
    iget v5, v5, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->unwritten:I
    add-int/2addr v4, v5
  .line 1418
    aget-object v5, v20, v0
    iget-object v5, v5, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->steps:Lcom/innioasis/y1/activity/IppActivity$Steps;
    move-object/from16 v6, v22
    invoke-virtual { v6, v5 }, Lcom/innioasis/y1/activity/IppActivity$Steps;->add(Lcom/innioasis/y1/activity/IppActivity$Steps;)V
  .line 1419
    aget-object v5, v20, v0
    iget-object v5, v5, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->walk:Lcom/innioasis/ipp/BigCover$Walk;
    invoke-virtual { v6, v5 }, Lcom/innioasis/y1/activity/IppActivity$Steps;->cover(Lcom/innioasis/ipp/BigCover$Walk;)V
  .line 1415
    add-int/lit8 v0, v0, 1
    move-object/from16 v22, v6
    goto :L58
  :L59
  .line 1421
    move-object/from16 v6, v22
    if-eqz v14, :L62
  .line 1422
    const/4 v0, 0
  :L60
    if-ge v0, v11, :L61
    aget-object v5, v20, v0
    invoke-virtual { v5 }, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->commit()V
    add-int/lit8 v0, v0, 1
    goto :L60
  :L61
  .line 1423
    invoke-static { }, Lcom/innioasis/ipp/DiscCache;->flush()V
  :L62
  .line 1426
    move v0, v3
    move-wide v2, v1
    goto :L64
  :L63
  .line 1400
    move-object/from16 v26, v4
    move/from16 v27, v5
    move-object/from16 v28, v6
    move/from16 v30, v8
    move-object/from16 v25, v11
    move/from16 v29, v21
    move-object/from16 v6, v22
  .line 1426
    const/4 v0, 0
    const-wide/16 v2, 0
    const/4 v4, 0
  :L64
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v7
    sub-long v7, v7, v23
  .line 1429
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v10
  .line 1430
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 1431
    invoke-virtual/range { v26 .. v26 }, Ljava/util/HashMap;->values()Ljava/util/Collection;
    move-result-object v5
    invoke-interface { v5 }, Ljava/util/Collection;->iterator()Ljava/util/Iterator;
    move-result-object v5
  :L65
  .line 1432
    invoke-interface { v5 }, Ljava/util/Iterator;->hasNext()Z
    move-result v14
    if-eqz v14, :L67
  .line 1433
    invoke-interface { v5 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v14
    check-cast v14, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;
  .line 1434
    move/from16 v16, v4
    iget-boolean v4, v14, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->done:Z
    if-nez v4, :L66
    invoke-virtual { v1, v14 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L66
  .line 1435
    move/from16 v4, v16
    goto :L65
  :L67
  .line 1436
    move/from16 v16, v4
    invoke-virtual { v9, v1 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->runAlbums(Ljava/util/List;)V
  .line 1437
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
    sub-long/2addr v4, v10
    add-long/2addr v12, v4
  .line 1440
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
  .line 1441
    if-eqz v15, :L74
  .line 1442
    const/4 v10, 0
  :L68
    move/from16 v11, v27
    if-ge v10, v11, :L73
  .line 1443
    move-object/from16 v14, v25
    invoke-virtual { v14, v10 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v15
    move/from16 v27, v11
    move-object/from16 v11, v28
    invoke-virtual { v11, v15 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v15
    check-cast v15, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v15 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v15
  .line 1444
    invoke-static { v15 }, Lcom/innioasis/ipp/FlowCache;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v17
  .line 1445
    if-eqz v17, :L69
    invoke-virtual/range { v17 .. v17 }, Ljava/io/File;->exists()Z
    move-result v17
    if-nez v17, :L69
    const/16 v17, 1
    goto :L70
  :L69
    const/16 v17, 0
  :L70
  .line 1446
    invoke-static { v15 }, Lcom/innioasis/ipp/Flow;->cacheSlide(Ljava/lang/String;)Z
    move-result v15
    if-nez v15, :L71
    add-int/lit8 v16, v16, 1
    goto :L72
  :L71
  .line 1447
    if-eqz v17, :L72
    invoke-virtual { v14, v10 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v15
    check-cast v15, Ljava/lang/String;
    invoke-virtual { v9, v15 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touch(Ljava/lang/String;)V
  :L72
  .line 1448
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tick()V
  .line 1442
    add-int/lit8 v10, v10, 1
    move-object/from16 v28, v11
    move-object/from16 v25, v14
    goto :L68
  :L73
    move/from16 v10, v16
    goto :L75
  :L74
  .line 1441
    move/from16 v10, v16
  :L75
  .line 1451
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v14
  :L76
    sub-long/2addr v14, v4
  .line 1454
    if-nez v0, :L78
    if-nez v10, :L78
  :L77
    iget-object v4, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    iget v5, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->mask:I
    move/from16 v9, v29
    move/from16 v11, v30
    invoke-static { v4, v11, v9, v5 }, Lcom/innioasis/ipp/Albums;->noteCached(Landroid/content/Context;III)V
  :L78
  .line 1455
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
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v1
    invoke-virtual { v4, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v4, " late), songs "
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v7, v8 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v4, " ms, flow "
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v14, v15 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v4, " ms, "
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
  .line 1456
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->access$500()I
    move-result v4
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v4, " workers, heap "
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    const/16 v4, 20
    shr-long/2addr v2, v4
    invoke-virtual { v1, v2, v3 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, " MB; "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
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
  .line 1455
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 1459
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
  .line 1460
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
  .line 1464
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->endCache()V
  :L80
    goto :L82
  :L81
    move-exception v0
  :L82
  .line 1465
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  :L83
    goto :L85
  :L84
    move-exception v0
  :L85
  .line 1466
    nop
  .line 1467
    move-object/from16 v1, p0
    iget-object v2, v1, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touched:Ljava/util/HashSet;
    monitor-enter v2
  :L86
  .line 1468
    iget-object v0, v1, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touched:Ljava/util/HashSet;
    invoke-virtual { v0 }, Ljava/util/HashSet;->size()I
    move-result v0
  .line 1469
    monitor-exit v2
    goto :L99
  :L87
    move-exception v0
    monitor-exit v2
  :L88
    throw v0
  :L89
  .line 1461
    move-exception v0
    move-object/from16 v1, p0
    goto :L91
  :L90
    move-exception v0
    move-object v1, v9
  :L91
  .line 1464
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->endCache()V
  :L92
    goto :L94
  :L93
    move-exception v0
  :L94
  .line 1465
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  :L95
    goto :L97
  :L96
    move-exception v0
  :L97
  .line 1466
    nop
  .line 1467
    iget-object v2, v1, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touched:Ljava/util/HashSet;
    monitor-enter v2
  :L98
  .line 1468
    iget-object v0, v1, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->touched:Ljava/util/HashSet;
    invoke-virtual { v0 }, Ljava/util/HashSet;->size()I
    move-result v0
  .line 1469
    monitor-exit v2
  :L99
  .line 1471
    iget-object v2, v1, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v2, v0 }, Lcom/innioasis/y1/activity/IppActivity;->cacheFinished(I)V
  .line 1472
    nop
  .line 1473
    return-void
  :L100
  .line 1469
    move-exception v0
  :L101
    monitor-exit v2
  :L102
    goto :L104
  :L103
    throw v0
  :L104
    goto :L103
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
