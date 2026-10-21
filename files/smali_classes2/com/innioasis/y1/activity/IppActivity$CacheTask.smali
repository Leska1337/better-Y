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

.method constructor <init>(Lcom/innioasis/y1/activity/IppActivity;I)V
  .registers 4
  .line 1130
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1124
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->lock:Ljava/lang/Object;
  .line 1125
    const-string v0, ""
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->label:Ljava/lang/String;
  .line 1126
    const/4 v0, 1
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
  .line 1127
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tickEvery:I
  .line 1131
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
  .line 1132
    iput p2, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->mask:I
  .line 1133
    return-void
.end method

.method public run()V
  .catchall { :L5 .. :L9 } :L117
  .catchall { :L12 .. :L13 } :L14
  .catchall { :L17 .. :L18 } :L117
  .catchall { :L19 .. :L20 } :L21
  .catchall { :L22 .. :L23 } :L24
  .catchall { :L26 .. :L27 } :L117
  .catchall { :L29 .. :L32 } :L14
  .catchall { :L33 .. :L44 } :L117
  .catchall { :L46 .. :L57 } :L58
  .catchall { :L60 .. :L61 } :L115
  .catchall { :L63 .. :L64 } :L58
  .catchall { :L65 .. :L66 } :L115
  .catchall { :L67 .. :L68 } :L81
  .catchall { :L68 .. :L69 } :L70
  .catchall { :L71 .. :L73 } :L81
  .catchall { :L74 .. :L80 } :L90
  .catchall { :L85 .. :L87 } :L113
  .catchall { :L88 .. :L89 } :L90
  .catchall { :L92 .. :L93 } :L113
  .catchall { :L95 .. :L97 } :L90
  .catchall { :L99 .. :L100 } :L113
  .catchall { :L101 .. :L102 } :L103
  .catchall { :L104 .. :L105 } :L112
  .catchall { :L105 .. :L106 } :L107
  .catchall { :L108 .. :L109 } :L110
  .catchall { :L118 .. :L119 } :L120
  .catchall { :L121 .. :L122 } :L123
  .registers 33
  .line 1156
    move-object/from16 v9, p0
  .line 1157
    nop
  .line 1158
    nop
  .line 1159
    nop
  .line 1160
    nop
  .line 1161
    new-instance v10, Lcom/innioasis/y1/activity/IppActivity$Steps;
    invoke-direct { v10 }, Lcom/innioasis/y1/activity/IppActivity$Steps;-><init>()V
  .line 1162
    iget v0, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->mask:I
    and-int/lit8 v1, v0, 1
    const/4 v11, 0
    const/4 v2, 1
    if-eqz v1, :L0
    const/4 v12, 1
    goto :L1
  :L0
    const/4 v12, 0
  :L1
  .line 1163
    and-int/lit8 v1, v0, 2
    if-eqz v1, :L2
    const/4 v13, 1
    goto :L3
  :L2
    const/4 v13, 0
  :L3
  .line 1164
    and-int/lit8 v0, v0, 8
    if-eqz v0, :L4
    const/4 v14, 1
    goto :L5
  :L4
    const/4 v14, 0
  :L5
  .line 1166
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 1167
    if-nez v0, :L6
    const/4 v0, 0
    goto :L7
  :L6
    invoke-virtual { v0, v11 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsSync(I)Ljava/util/List;
    move-result-object v0
  :L7
  .line 1168
    if-nez v0, :L8
    const/4 v15, 0
    goto :L10
  :L8
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v3
  :L9
    move v15, v3
  :L10
  .line 1170
    nop
  .line 1171
    const/4 v5, 0
    const-wide/16 v6, 0
  :L11
    if-ge v5, v15, :L16
  :L12
  .line 1172
    invoke-interface { v0, v5 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v8
    check-cast v8, Lcom/innioasis/y1/database/Song;
  .line 1173
    if-eqz v8, :L13
    invoke-virtual { v8 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide v16
    cmp-long v18, v16, v6
    if-lez v18, :L13
    invoke-virtual { v8 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide v6
  :L13
  .line 1171
    add-int/lit8 v5, v5, 1
    goto :L11
  :L14
  .line 1311
    move-exception v0
  :L15
    move-object v1, v9
    goto/16 :L118
  :L16
  .line 1175
    const-wide/16 v16, 1000
  :L17
    div-long v6, v6, v16
    long-to-int v8, v6
  .line 1177
    iget-object v5, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    iget v6, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->mask:I
    invoke-static { v5, v15, v8, v6 }, Lcom/innioasis/ipp/Albums;->cached(Landroid/content/Context;III)Z
    move-result v5
  :L18
    if-eqz v5, :L26
  .line 1178
    nop
  :L19
  .line 1314
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->endCache()V
  :L20
    goto :L22
  :L21
    move-exception v0
  :L22
  .line 1315
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  :L23
    goto :L25
  :L24
    move-exception v0
  :L25
  .line 1316
    iget-object v0, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    const/4 v1, -1
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->cacheFinished(I)V
  .line 1179
    return-void
  :L26
  .line 1181
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->beginCache()V
  :L27
  .line 1184
    if-eqz v12, :L33
  .line 1185
    const/4 v5, 0
  :L28
    if-ge v5, v15, :L33
  :L29
  .line 1186
    invoke-interface { v0, v5 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lcom/innioasis/y1/database/Song;
  .line 1187
    if-eqz v6, :L32
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v7
    if-nez v7, :L30
    goto :L32
  :L30
  .line 1188
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v7
    invoke-static { v7 }, Lcom/innioasis/ipp/Art;->coverChanged(Ljava/lang/String;)Z
    move-result v7
    if-nez v7, :L31
    goto :L32
  :L31
  .line 1189
    invoke-static { v6 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v7
    invoke-static { v7 }, Lcom/innioasis/ipp/CoverCache;->forget(Ljava/lang/String;)V
  .line 1190
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v7
    invoke-static { v7 }, Lcom/innioasis/ipp/BigCover;->forget(Ljava/lang/String;)V
  .line 1191
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v6
    invoke-static { v6 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    invoke-static { v6 }, Lcom/innioasis/ipp/BigCover;->forget(Ljava/lang/String;)V
  :L32
  .line 1185
    add-int/lit8 v5, v5, 1
    goto :L28
  :L33
  .line 1196
    new-instance v7, Ljava/util/LinkedHashMap;
    invoke-direct { v7 }, Ljava/util/LinkedHashMap;-><init>()V
  .line 1197
    const/4 v5, 0
  :L34
    if-ge v5, v15, :L39
  .line 1198
    invoke-interface { v0, v5 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lcom/innioasis/y1/database/Song;
  .line 1199
    if-eqz v6, :L38
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v16
    if-nez v16, :L35
    goto :L38
  :L35
  .line 1200
    invoke-static { v6 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v3
  .line 1201
    if-nez v3, :L36
    goto :L38
  :L36
  .line 1202
    invoke-virtual { v7, v3 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/y1/database/Song;
  .line 1203
    if-eqz v4, :L37
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v11
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v11, v4 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result v4
    if-gez v4, :L38
  :L37
    invoke-virtual { v7, v3, v6 }, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L38
  .line 1197
    add-int/lit8 v5, v5, 1
    const/4 v11, 0
    goto :L34
  :L39
  .line 1206
    new-instance v11, Ljava/util/ArrayList;
    invoke-virtual { v7 }, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;
    move-result-object v3
    invoke-direct { v11, v3 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 1207
    invoke-virtual { v11 }, Ljava/util/ArrayList;->size()I
    move-result v6
  .line 1208
    iget-object v3, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    const v4, 2131821074
    invoke-virtual { v3, v4 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    iput-object v3, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->label:Ljava/lang/String;
  .line 1210
    add-int v3, v6, v15
    if-eqz v14, :L40
    move v4, v6
    goto :L41
  :L40
    const/4 v4, 0
  :L41
    add-int/2addr v3, v4
    iput v3, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
  .line 1211
    if-gtz v3, :L42
    iput v2, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
  :L42
  .line 1212
    iget v3, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
    div-int/lit8 v3, v3, 60
    iput v3, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tickEvery:I
  .line 1213
    if-ge v3, v2, :L43
    iput v2, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tickEvery:I
  :L43
  .line 1217
    new-instance v3, Ljava/util/ArrayList;
    invoke-direct { v3 }, Ljava/util/ArrayList;-><init>()V
  .line 1220
    new-instance v4, Ljava/util/ArrayList;
    invoke-direct { v4 }, Ljava/util/ArrayList;-><init>()V
  .line 1221
    new-instance v5, Ljava/util/HashMap;
    invoke-direct { v5 }, Ljava/util/HashMap;-><init>()V
  :L44
  .line 1222
    const/4 v1, 0
    const/4 v2, 0
  :L45
    if-ge v2, v6, :L59
  :L46
  .line 1223
    invoke-virtual { v11, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v21
    move/from16 v22, v8
    move-object/from16 v8, v21
    check-cast v8, Ljava/lang/String;
  .line 1224
    invoke-virtual { v7, v8 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v21
    check-cast v21, Lcom/innioasis/y1/database/Song;
  .line 1225
    if-eqz v13, :L49
    invoke-static { v8 }, Lcom/innioasis/ipp/AlbumInfo;->artist(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v23
    if-eqz v23, :L48
    invoke-static { v8 }, Lcom/innioasis/ipp/AlbumInfo;->path(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v23
    if-nez v23, :L47
    goto :L48
  :L47
    move-object/from16 v23, v10
    move/from16 v24, v13
    goto :L50
  :L48
  .line 1226
    move-object/from16 v23, v10
    invoke-virtual/range { v21 .. v21 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v10
    move/from16 v24, v13
    invoke-virtual/range { v21 .. v21 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v13
    invoke-static { v8, v10, v13 }, Lcom/innioasis/ipp/AlbumInfo;->put(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    goto :L50
  :L49
  .line 1225
    move-object/from16 v23, v10
    move/from16 v24, v13
  :L50
  .line 1228
    invoke-static { v8 }, Lcom/innioasis/ipp/AlbumInfo;->path(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v10
  .line 1229
    if-nez v10, :L51
    invoke-virtual/range { v21 .. v21 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v10
  :L51
  .line 1230
    new-instance v13, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;
    invoke-direct { v13 }, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;-><init>()V
  .line 1231
    iput-object v8, v13, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->key:Ljava/lang/String;
  .line 1232
    iput-object v10, v13, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->path:Ljava/lang/String;
  .line 1233
    if-eqz v12, :L52
    invoke-static { v8 }, Lcom/innioasis/ipp/CoverCache;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v21
    if-nez v21, :L52
    move/from16 v21, v12
    const/4 v12, 1
    goto :L53
  :L52
    move/from16 v21, v12
    const/4 v12, 0
  :L53
    iput-boolean v12, v13, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->thumb:Z
  .line 1234
    iget-boolean v12, v13, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->thumb:Z
    if-eqz v12, :L54
    invoke-static { v8, v10 }, Lcom/innioasis/ipp/Art;->thumbFromTags(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v8
    if-eqz v8, :L54
    const/4 v8, 1
    goto :L55
  :L54
    const/4 v8, 0
  :L55
    iput-boolean v8, v13, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->art:Z
  .line 1235
    invoke-virtual { v3, v13 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1236
    iget-boolean v8, v13, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->art:Z
    if-eqz v8, :L56
    invoke-virtual { v5, v10, v13 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    goto :L57
  :L56
  .line 1237
    invoke-virtual { v4, v13 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L57
  .line 1238
    add-int/lit8 v1, v1, 1
  .line 1222
    add-int/lit8 v2, v2, 1
    move/from16 v12, v21
    move/from16 v8, v22
    move-object/from16 v10, v23
    move/from16 v13, v24
    goto/16 :L45
  :L58
  .line 1311
    move-exception v0
    move v11, v1
    goto/16 :L15
  :L59
  .line 1241
    move/from16 v22, v8
    move-object/from16 v23, v10
    move/from16 v21, v12
    move/from16 v24, v13
  :L60
    new-instance v10, Ljava/util/HashSet;
    invoke-direct { v10 }, Ljava/util/HashSet;-><init>()V
  :L61
  .line 1242
    if-eqz v14, :L65
  .line 1243
    const/4 v2, 0
  :L62
    if-ge v2, v6, :L65
  :L63
    invoke-virtual { v11, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v3
    invoke-virtual { v7, v3 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v10, v3 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L64
    add-int/lit8 v2, v2, 1
    goto :L62
  :L65
  .line 1246
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
  .line 1247
    invoke-virtual { v9, v4 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->runAlbums(Ljava/util/List;)V
  .line 1248
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v12
    sub-long/2addr v12, v2
  .line 1253
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v25
  :L66
  .line 1254
    if-eqz v0, :L84
    if-lez v15, :L84
  :L67
  .line 1255
    new-instance v8, Ljava/util/ArrayList;
    invoke-direct { v8, v0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  :L68
  .line 1257
    new-instance v0, Lcom/innioasis/y1/activity/IppActivity$ByPath;
    const/4 v2, 0
    invoke-direct { v0, v2 }, Lcom/innioasis/y1/activity/IppActivity$ByPath;-><init>(Lcom/innioasis/y1/activity/IppActivity$1;)V
    invoke-static { v8, v0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  :L69
  .line 1259
    goto :L71
  :L70
  .line 1258
    move-exception v0
  :L71
  .line 1260
    invoke-static { v8 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->folders(Ljava/util/List;)Lcom/innioasis/y1/activity/IppActivity$Blocks;
    move-result-object v0
  .line 1261
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->access$300()I
    move-result v4
    new-array v3, v4, [Lcom/innioasis/y1/activity/IppActivity$SongWorker;
  .line 1262
    const/4 v2, 0
  :L72
    if-ge v2, v4, :L75
  .line 1263
    new-instance v16, Lcom/innioasis/y1/activity/IppActivity$SongWorker;
  :L73
    move/from16 v27, v1
    move-object/from16 v1, v16
    move/from16 v17, v2
    move-object/from16 v2, p0
    move-object/from16 v19, v3
    move-object v3, v8
    move/from16 v20, v15
    move v15, v4
    move-object v4, v0
    move-object/from16 v28, v5
    move/from16 v5, v24
    move-object/from16 v29, v11
    move v11, v6
    move/from16 v6, v21
    move-object/from16 v30, v7
    move-object/from16 v7, v28
    move/from16 v31, v22
    move-object/from16 v22, v8
    move-object v8, v10
  :L74
    invoke-direct/range { v1 .. v8 }, Lcom/innioasis/y1/activity/IppActivity$SongWorker;-><init>(Lcom/innioasis/y1/activity/IppActivity$CacheTask;Ljava/util/List;Lcom/innioasis/y1/activity/IppActivity$Blocks;ZZLjava/util/Map;Ljava/util/HashSet;)V
    aput-object v16, v19, v17
  .line 1262
    add-int/lit8 v2, v17, 1
    move v6, v11
    move v4, v15
    move-object/from16 v3, v19
    move/from16 v15, v20
    move-object/from16 v8, v22
    move/from16 v1, v27
    move-object/from16 v5, v28
    move-object/from16 v11, v29
    move-object/from16 v7, v30
    move/from16 v22, v31
    goto :L72
  :L75
  .line 1265
    move/from16 v27, v1
    move-object/from16 v19, v3
    move-object/from16 v28, v5
    move-object/from16 v30, v7
    move-object/from16 v29, v11
    move/from16 v20, v15
    move/from16 v31, v22
    move v15, v4
    move v11, v6
    invoke-static/range { v19 .. v19 }, Lcom/innioasis/y1/activity/IppActivity;->access$400([Ljava/lang/Runnable;)V
  .line 1267
    invoke-static { }, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;
    move-result-object v0
  .line 1268
    invoke-virtual { v0 }, Ljava/lang/Runtime;->totalMemory()J
    move-result-wide v1
    invoke-virtual { v0 }, Ljava/lang/Runtime;->freeMemory()J
    move-result-wide v3
    sub-long v3, v1, v3
  .line 1269
    const/4 v0, 0
    const/4 v1, 0
    const/4 v2, 0
  :L76
    if-ge v0, v15, :L77
  .line 1270
    aget-object v5, v19, v0
    iget v5, v5, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->failed:I
    add-int/2addr v1, v5
  .line 1271
    aget-object v5, v19, v0
    iget v5, v5, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->unwritten:I
    add-int/2addr v2, v5
  .line 1272
    aget-object v5, v19, v0
    iget-object v5, v5, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->steps:Lcom/innioasis/y1/activity/IppActivity$Steps;
    move-object/from16 v6, v23
    invoke-virtual { v6, v5 }, Lcom/innioasis/y1/activity/IppActivity$Steps;->add(Lcom/innioasis/y1/activity/IppActivity$Steps;)V
  .line 1273
    aget-object v5, v19, v0
    iget-object v5, v5, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->walk:Lcom/innioasis/ipp/BigCover$Walk;
    invoke-virtual { v6, v5 }, Lcom/innioasis/y1/activity/IppActivity$Steps;->cover(Lcom/innioasis/ipp/BigCover$Walk;)V
  .line 1269
    add-int/lit8 v0, v0, 1
    move-object/from16 v23, v6
    goto :L76
  :L77
  .line 1275
    move-object/from16 v6, v23
    if-eqz v24, :L85
  .line 1276
    const/4 v0, 0
  :L78
    if-ge v0, v15, :L79
    aget-object v5, v19, v0
    invoke-virtual { v5 }, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->commit()V
    add-int/lit8 v0, v0, 1
    goto :L78
  :L79
  .line 1277
    invoke-static { }, Lcom/innioasis/ipp/DiscCache;->flush()V
  :L80
    goto :L85
  :L81
  .line 1311
    move-exception v0
    move/from16 v27, v1
  :L82
    move-object v1, v9
  :L83
    move/from16 v11, v27
    goto/16 :L118
  :L84
  .line 1254
    move/from16 v27, v1
    move-object/from16 v28, v5
    move-object/from16 v30, v7
    move-object/from16 v29, v11
    move/from16 v20, v15
    move/from16 v31, v22
    move v11, v6
    move-object/from16 v6, v23
  .line 1280
    const/4 v1, 0
    const/4 v2, 0
    const-wide/16 v3, 0
  :L85
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v7
    sub-long v7, v7, v25
  .line 1283
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v15
  .line 1284
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 1285
    invoke-virtual/range { v28 .. v28 }, Ljava/util/HashMap;->values()Ljava/util/Collection;
    move-result-object v5
    invoke-interface { v5 }, Ljava/util/Collection;->iterator()Ljava/util/Iterator;
    move-result-object v5
  :L86
  .line 1286
    invoke-interface { v5 }, Ljava/util/Iterator;->hasNext()Z
    move-result v10
  :L87
    if-eqz v10, :L91
  :L88
  .line 1287
    invoke-interface { v5 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v10
    check-cast v10, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;
  .line 1288
    move/from16 v17, v2
    iget-boolean v2, v10, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->done:Z
    if-nez v2, :L89
    invoke-virtual { v0, v10 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L89
  .line 1289
    move/from16 v2, v17
    goto :L86
  :L90
  .line 1311
    move-exception v0
    goto :L82
  :L91
  .line 1290
    move/from16 v17, v2
  :L92
    invoke-virtual { v9, v0 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->runAlbums(Ljava/util/List;)V
  .line 1291
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v21
    sub-long v21, v21, v15
    add-long v12, v12, v21
  .line 1294
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v15
  :L93
  .line 1295
    if-eqz v14, :L98
  .line 1296
    move/from16 v2, v17
    const/4 v5, 0
  :L94
    if-ge v5, v11, :L99
  .line 1297
    move-object/from16 v10, v29
  :L95
    invoke-virtual { v10, v5 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v14
    move-object/from16 v29, v10
    move-object/from16 v10, v30
    invoke-virtual { v10, v14 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v14
    check-cast v14, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v14 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v14
    invoke-static { v14 }, Lcom/innioasis/ipp/Flow;->cacheSlide(Ljava/lang/String;)Z
    move-result v14
    if-nez v14, :L96
    add-int/lit8 v2, v2, 1
  :L96
  .line 1298
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tick()V
  :L97
  .line 1296
    add-int/lit8 v5, v5, 1
    move-object/from16 v30, v10
    goto :L94
  :L98
  .line 1295
    move/from16 v2, v17
  :L99
  .line 1301
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v10
  :L100
    sub-long/2addr v10, v15
  .line 1304
    if-nez v1, :L104
    if-nez v2, :L104
  :L101
    iget-object v5, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    iget v14, v9, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->mask:I
    move/from16 v15, v20
    move/from16 v9, v31
    invoke-static { v5, v15, v9, v14 }, Lcom/innioasis/ipp/Albums;->noteCached(Landroid/content/Context;III)V
  :L102
    goto :L104
  :L103
  .line 1311
    move-exception v0
    move-object/from16 v1, p0
    goto/16 :L83
  :L104
  .line 1305
    new-instance v5, Ljava/lang/StringBuilder;
    invoke-direct { v5 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v9, "cache library: albums "
    invoke-virtual { v5, v9 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5, v12, v13 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v5
    const-string v9, " ms ("
    invoke-virtual { v5, v9 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v0
    invoke-virtual { v5, v0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v5, " late), songs "
    invoke-virtual { v0, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v7, v8 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v5, " ms, flow "
    invoke-virtual { v0, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v10, v11 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v5, " ms, "
    invoke-virtual { v0, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
  .line 1306
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->access$300()I
    move-result v5
    invoke-virtual { v0, v5 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v5, " workers, heap "
    invoke-virtual { v0, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const/16 v5, 20
    shr-long/2addr v3, v5
    invoke-virtual { v0, v3, v4 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v3, " MB; "
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " file(s) did not read, "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " cover(s) not written"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
  .line 1305
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 1309
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
  .line 1310
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
  :L105
  .line 1314
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->endCache()V
  :L106
    goto :L108
  :L107
    move-exception v0
  :L108
  .line 1315
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  :L109
    goto :L111
  :L110
    move-exception v0
  :L111
  .line 1316
    move-object/from16 v1, p0
    iget-object v0, v1, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    move/from16 v2, v27
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/activity/IppActivity;->cacheFinished(I)V
    goto :L125
  :L112
  .line 1311
    move-exception v0
    move-object/from16 v1, p0
    goto :L114
  :L113
    move-exception v0
    move-object v1, v9
  :L114
    move/from16 v2, v27
    goto :L116
  :L115
    move-exception v0
    move v2, v1
    move-object v1, v9
  :L116
    move v11, v2
    goto :L118
  :L117
    move-exception v0
    move-object v1, v9
    const/4 v11, 0
  :L118
  .line 1314
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->endCache()V
  :L119
    goto :L121
  :L120
    move-exception v0
  :L121
  .line 1315
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  :L122
    goto :L124
  :L123
    move-exception v0
  :L124
  .line 1316
    iget-object v0, v1, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v0, v11 }, Lcom/innioasis/y1/activity/IppActivity;->cacheFinished(I)V
  :L125
  .line 1317
    nop
  .line 1318
    return-void
.end method

.method runAlbums(Ljava/util/List;)V
  .registers 7
  .line 1147
    invoke-interface { p1 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    return-void
  :L0
  .line 1148
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v0
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->each(I)Lcom/innioasis/y1/activity/IppActivity$Blocks;
    move-result-object v0
  .line 1149
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->access$300()I
    move-result v1
    new-array v2, v1, [Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;
  .line 1150
    const/4 v3, 0
  :L1
    if-ge v3, v1, :L2
    new-instance v4, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;
    invoke-direct { v4, p0, p1, v0 }, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;-><init>(Lcom/innioasis/y1/activity/IppActivity$CacheTask;Ljava/util/List;Lcom/innioasis/y1/activity/IppActivity$Blocks;)V
    aput-object v4, v2, v3
    add-int/lit8 v3, v3, 1
    goto :L1
  :L2
  .line 1151
    invoke-static { v2 }, Lcom/innioasis/y1/activity/IppActivity;->access$400([Ljava/lang/Runnable;)V
  .line 1152
    return-void
.end method

.method tick()V
  .catchall { :L0 .. :L2 } :L3
  .catchall { :L4 .. :L5 } :L3
  .registers 5
  .line 1138
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->lock:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 1139
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->progress:I
    add-int/lit8 v1, v1, 1
    iput v1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->progress:I
  .line 1140
    iget v2, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tickEvery:I
    rem-int v2, v1, v2
    if-eqz v2, :L1
    monitor-exit v0
    return-void
  :L1
  .line 1141
    monitor-exit v0
  :L2
  .line 1142
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->label:Ljava/lang/String;
    mul-int/lit8 v1, v1, 100
    iget v3, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
    div-int/2addr v1, v3
    invoke-static { v2, v1 }, Lcom/innioasis/ipp/Loading;->percent(Ljava/lang/String;I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->scanTick(Ljava/lang/String;)V
  .line 1143
    return-void
  :L3
  .line 1141
    move-exception v1
  :L4
    monitor-exit v0
  :L5
    throw v1
.end method
