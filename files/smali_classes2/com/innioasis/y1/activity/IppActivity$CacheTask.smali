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
  .line 1124
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1118
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->lock:Ljava/lang/Object;
  .line 1119
    const-string v0, ""
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->label:Ljava/lang/String;
  .line 1120
    const/4 v0, 1
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
  .line 1121
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tickEvery:I
  .line 1125
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
  .line 1126
    iput p2, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->mask:I
  .line 1127
    return-void
.end method

.method public run()V
  .catchall { :L5 .. :L9 } :L106
  .catchall { :L12 .. :L13 } :L14
  .catchall { :L16 .. :L17 } :L106
  .catchall { :L18 .. :L19 } :L20
  .catchall { :L21 .. :L22 } :L23
  .catchall { :L25 .. :L26 } :L106
  .catchall { :L28 .. :L31 } :L14
  .catchall { :L32 .. :L33 } :L106
  .catchall { :L35 .. :L39 } :L14
  .catchall { :L40 .. :L43 } :L106
  .catchall { :L44 .. :L45 } :L14
  .catchall { :L45 .. :L46 } :L106
  .catchall { :L47 .. :L48 } :L14
  .catchall { :L48 .. :L49 } :L106
  .catchall { :L51 .. :L60 } :L104
  .catchall { :L62 .. :L63 } :L64
  .catchall { :L65 .. :L66 } :L103
  .catchall { :L67 .. :L68 } :L81
  .catchall { :L68 .. :L69 } :L70
  .catchall { :L71 .. :L73 } :L81
  .catchall { :L74 .. :L80 } :L90
  .catchall { :L84 .. :L85 } :L102
  .catchall { :L87 .. :L89 } :L90
  .catchall { :L91 .. :L92 } :L102
  .catchall { :L93 .. :L94 } :L90
  .catchall { :L94 .. :L95 } :L102
  .catchall { :L95 .. :L96 } :L97
  .catchall { :L98 .. :L99 } :L100
  .catchall { :L107 .. :L108 } :L109
  .catchall { :L110 .. :L111 } :L112
  .registers 29
  .line 1141
    move-object/from16 v7, p0
  .line 1142
    nop
  .line 1143
    nop
  .line 1144
    nop
  .line 1145
    nop
  .line 1146
    iget v0, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->mask:I
    and-int/lit8 v1, v0, 1
    const/4 v8, 0
    const/4 v2, 1
    if-eqz v1, :L0
    const/4 v9, 1
    goto :L1
  :L0
    const/4 v9, 0
  :L1
  .line 1147
    and-int/lit8 v1, v0, 2
    if-eqz v1, :L2
    const/4 v10, 1
    goto :L3
  :L2
    const/4 v10, 0
  :L3
  .line 1148
    and-int/lit8 v0, v0, 8
    if-eqz v0, :L4
    const/4 v11, 1
    goto :L5
  :L4
    const/4 v11, 0
  :L5
  .line 1150
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 1151
    if-nez v0, :L6
    const/4 v0, 0
    goto :L7
  :L6
    invoke-virtual { v0, v8 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsSync(I)Ljava/util/List;
    move-result-object v0
  :L7
  .line 1152
    if-nez v0, :L8
    const/4 v12, 0
    goto :L10
  :L8
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v3
  :L9
    move v12, v3
  :L10
  .line 1154
    nop
  .line 1155
    const/4 v5, 0
    const-wide/16 v13, 0
  :L11
    if-ge v5, v12, :L15
  :L12
  .line 1156
    invoke-interface { v0, v5 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lcom/innioasis/y1/database/Song;
  .line 1157
    if-eqz v6, :L13
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide v15
    cmp-long v17, v15, v13
    if-lez v17, :L13
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide v13
  :L13
  .line 1155
    add-int/lit8 v5, v5, 1
    goto :L11
  :L14
  .line 1270
    move-exception v0
    goto/16 :L107
  :L15
  .line 1159
    const-wide/16 v5, 1000
  :L16
    div-long/2addr v13, v5
    long-to-int v14, v13
  .line 1161
    iget-object v5, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    iget v6, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->mask:I
    invoke-static { v5, v12, v14, v6 }, Lcom/innioasis/ipp/Albums;->cached(Landroid/content/Context;III)Z
    move-result v5
  :L17
    if-eqz v5, :L25
  .line 1162
    nop
  :L18
  .line 1273
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->endCache()V
  :L19
    goto :L21
  :L20
    move-exception v0
  :L21
  .line 1274
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  :L22
    goto :L24
  :L23
    move-exception v0
  :L24
  .line 1275
    iget-object v0, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    const/4 v1, -1
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->cacheFinished(I)V
  .line 1163
    return-void
  :L25
  .line 1165
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->beginCache()V
  :L26
  .line 1168
    if-eqz v9, :L32
  .line 1169
    const/4 v5, 0
  :L27
    if-ge v5, v12, :L32
  :L28
  .line 1170
    invoke-interface { v0, v5 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lcom/innioasis/y1/database/Song;
  .line 1171
    if-eqz v6, :L31
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v13
    if-nez v13, :L29
    goto :L31
  :L29
  .line 1172
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v13
    invoke-static { v13 }, Lcom/innioasis/ipp/Art;->coverChanged(Ljava/lang/String;)Z
    move-result v13
    if-nez v13, :L30
    goto :L31
  :L30
  .line 1173
    invoke-static { v6 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v13
    invoke-static { v13 }, Lcom/innioasis/ipp/CoverCache;->forget(Ljava/lang/String;)V
  .line 1174
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v13
    invoke-static { v13 }, Lcom/innioasis/ipp/BigCover;->forget(Ljava/lang/String;)V
  .line 1175
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v6
    invoke-static { v6 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
    invoke-static { v6 }, Lcom/innioasis/ipp/BigCover;->forget(Ljava/lang/String;)V
  :L31
  .line 1169
    add-int/lit8 v5, v5, 1
    goto :L27
  :L32
  .line 1180
    new-instance v13, Ljava/util/LinkedHashMap;
    invoke-direct { v13 }, Ljava/util/LinkedHashMap;-><init>()V
  :L33
  .line 1181
    const/4 v5, 0
  :L34
    if-ge v5, v12, :L40
  :L35
  .line 1182
    invoke-interface { v0, v5 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lcom/innioasis/y1/database/Song;
  .line 1183
    if-eqz v6, :L39
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v15
    if-nez v15, :L36
    goto :L39
  :L36
  .line 1184
    invoke-static { v6 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v15
  .line 1185
    if-nez v15, :L37
    goto :L39
  :L37
  .line 1186
    invoke-virtual { v13, v15 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v16
    check-cast v16, Lcom/innioasis/y1/database/Song;
  .line 1187
    if-eqz v16, :L38
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v3
    invoke-virtual/range { v16 .. v16 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v3, v4 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result v3
    if-gez v3, :L39
  :L38
    invoke-virtual { v13, v15, v6 }, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L39
  .line 1181
    add-int/lit8 v5, v5, 1
    goto :L34
  :L40
  .line 1190
    new-instance v15, Ljava/util/ArrayList;
    invoke-virtual { v13 }, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;
    move-result-object v3
    invoke-direct { v15, v3 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 1191
    invoke-virtual { v15 }, Ljava/util/ArrayList;->size()I
    move-result v6
  .line 1192
    iget-object v3, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    const v4, 2131821074
    invoke-virtual { v3, v4 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    iput-object v3, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->label:Ljava/lang/String;
  .line 1194
    add-int v3, v6, v12
    if-eqz v11, :L41
    move v4, v6
    goto :L42
  :L41
    const/4 v4, 0
  :L42
    add-int/2addr v3, v4
    iput v3, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
  :L43
  .line 1195
    if-gtz v3, :L45
  :L44
    iput v2, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
  :L45
  .line 1196
    iget v3, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
    div-int/lit8 v3, v3, 60
    iput v3, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tickEvery:I
  :L46
  .line 1197
    if-ge v3, v2, :L48
  :L47
    iput v2, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tickEvery:I
  :L48
  .line 1201
    new-instance v3, Ljava/util/ArrayList;
    invoke-direct { v3 }, Ljava/util/ArrayList;-><init>()V
  :L49
  .line 1202
    const/4 v4, 0
    const/4 v5, 0
  :L50
    if-ge v4, v6, :L59
  :L51
  .line 1203
    invoke-virtual { v15, v4 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v16
    move-object/from16 v2, v16
    check-cast v2, Ljava/lang/String;
  .line 1204
    invoke-virtual { v13, v2 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v16
    check-cast v16, Lcom/innioasis/y1/database/Song;
  .line 1205
    if-eqz v10, :L53
    invoke-static { v2 }, Lcom/innioasis/ipp/AlbumInfo;->artist(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v20
    if-eqz v20, :L52
    invoke-static { v2 }, Lcom/innioasis/ipp/AlbumInfo;->path(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v20
    if-nez v20, :L53
  :L52
  .line 1206
    invoke-virtual/range { v16 .. v16 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v8
    invoke-virtual/range { v16 .. v16 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
    invoke-static { v2, v8, v1 }, Lcom/innioasis/ipp/AlbumInfo;->put(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
  :L53
  .line 1208
    invoke-static { v2 }, Lcom/innioasis/ipp/AlbumInfo;->path(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
  .line 1209
    if-nez v1, :L54
    invoke-virtual/range { v16 .. v16 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
  :L54
  .line 1210
    new-instance v8, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;
    invoke-direct { v8 }, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;-><init>()V
  .line 1211
    iput-object v2, v8, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->key:Ljava/lang/String;
  .line 1212
    iput-object v1, v8, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->path:Ljava/lang/String;
  .line 1213
    if-eqz v9, :L55
    invoke-static { v2 }, Lcom/innioasis/ipp/CoverCache;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v16
    if-nez v16, :L55
    move/from16 v16, v6
    const/4 v6, 1
    goto :L56
  :L55
    move/from16 v16, v6
    const/4 v6, 0
  :L56
    iput-boolean v6, v8, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->thumb:Z
  .line 1214
    iget-boolean v6, v8, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->thumb:Z
    if-eqz v6, :L57
    invoke-static { v2, v1 }, Lcom/innioasis/ipp/Art;->thumbFromTags(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L57
    const/4 v1, 1
    goto :L58
  :L57
    const/4 v1, 0
  :L58
    iput-boolean v1, v8, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->art:Z
  .line 1215
    invoke-virtual { v3, v8 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1216
    add-int/lit8 v5, v5, 1
  .line 1202
    add-int/lit8 v4, v4, 1
    move/from16 v6, v16
    const/4 v2, 1
    const/4 v8, 0
    goto :L50
  :L59
  .line 1218
    move/from16 v16, v6
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
  .line 1219
    invoke-virtual { v3 }, Ljava/util/ArrayList;->size()I
    move-result v4
    invoke-static { v4 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->each(I)Lcom/innioasis/y1/activity/IppActivity$Blocks;
    move-result-object v4
  .line 1220
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->access$300()I
    move-result v6
    new-array v8, v6, [Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;
  :L60
  .line 1221
    move/from16 v19, v5
    const/4 v5, 0
  :L61
    if-ge v5, v6, :L65
    move/from16 v22, v6
  :L62
    new-instance v6, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;
    invoke-direct { v6, v7, v3, v4 }, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;-><init>(Lcom/innioasis/y1/activity/IppActivity$CacheTask;Ljava/util/List;Lcom/innioasis/y1/activity/IppActivity$Blocks;)V
    aput-object v6, v8, v5
  :L63
    add-int/lit8 v5, v5, 1
    move/from16 v6, v22
    goto :L61
  :L64
  .line 1270
    move-exception v0
    move/from16 v8, v19
    goto/16 :L107
  :L65
  .line 1222
    invoke-static { v8 }, Lcom/innioasis/y1/activity/IppActivity;->access$400([Ljava/lang/Runnable;)V
  .line 1223
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
    sub-long v5, v3, v1
  .line 1228
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v22
  :L66
  .line 1229
    if-eqz v0, :L83
    if-lez v12, :L83
  :L67
  .line 1230
    new-instance v8, Ljava/util/ArrayList;
    invoke-direct { v8, v0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  :L68
  .line 1232
    new-instance v0, Lcom/innioasis/y1/activity/IppActivity$ByPath;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Lcom/innioasis/y1/activity/IppActivity$ByPath;-><init>(Lcom/innioasis/y1/activity/IppActivity$1;)V
    invoke-static { v8, v0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  :L69
  .line 1234
    goto :L71
  :L70
  .line 1233
    move-exception v0
  :L71
  .line 1235
    invoke-static { v8 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->folders(Ljava/util/List;)Lcom/innioasis/y1/activity/IppActivity$Blocks;
    move-result-object v0
  .line 1236
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->access$300()I
    move-result v4
    new-array v3, v4, [Lcom/innioasis/y1/activity/IppActivity$SongWorker;
  .line 1237
    const/4 v2, 0
  :L72
    if-ge v2, v4, :L75
  .line 1238
    new-instance v17, Lcom/innioasis/y1/activity/IppActivity$SongWorker;
  :L73
    move-object/from16 v1, v17
    move/from16 v18, v2
    move-object/from16 v2, p0
    move-object/from16 v21, v3
    move-object v3, v8
    move-object/from16 v24, v8
    move v8, v4
    move-object v4, v0
    move-wide/from16 v25, v5
    move/from16 v6, v19
    move v5, v10
    move/from16 v27, v6
    move/from16 v19, v12
    move/from16 v12, v16
    move v6, v9
  :L74
    invoke-direct/range { v1 .. v6 }, Lcom/innioasis/y1/activity/IppActivity$SongWorker;-><init>(Lcom/innioasis/y1/activity/IppActivity$CacheTask;Ljava/util/List;Lcom/innioasis/y1/activity/IppActivity$Blocks;ZZ)V
    aput-object v17, v21, v18
  .line 1237
    add-int/lit8 v2, v18, 1
    move v4, v8
    move/from16 v16, v12
    move/from16 v12, v19
    move-object/from16 v3, v21
    move-object/from16 v8, v24
    move-wide/from16 v5, v25
    move/from16 v19, v27
    goto :L72
  :L75
  .line 1240
    move-object/from16 v21, v3
    move v8, v4
    move-wide/from16 v25, v5
    move/from16 v27, v19
    move/from16 v19, v12
    move/from16 v12, v16
    invoke-static/range { v21 .. v21 }, Lcom/innioasis/y1/activity/IppActivity;->access$400([Ljava/lang/Runnable;)V
  .line 1242
    invoke-static { }, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;
    move-result-object v0
  .line 1243
    invoke-virtual { v0 }, Ljava/lang/Runtime;->totalMemory()J
    move-result-wide v1
    invoke-virtual { v0 }, Ljava/lang/Runtime;->freeMemory()J
    move-result-wide v3
    sub-long v3, v1, v3
  .line 1244
    const/4 v0, 0
    const/4 v1, 0
    const/4 v2, 0
  :L76
    if-ge v0, v8, :L77
  .line 1245
    aget-object v5, v21, v0
    iget v5, v5, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->failed:I
    add-int/2addr v1, v5
  .line 1246
    aget-object v5, v21, v0
    iget v5, v5, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->unwritten:I
    add-int/2addr v2, v5
  .line 1244
    add-int/lit8 v0, v0, 1
    goto :L76
  :L77
  .line 1248
    if-eqz v10, :L84
  .line 1249
    const/4 v0, 0
  :L78
    if-ge v0, v8, :L79
    aget-object v5, v21, v0
    invoke-virtual { v5 }, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->commit()V
    add-int/lit8 v0, v0, 1
    goto :L78
  :L79
  .line 1250
    invoke-static { }, Lcom/innioasis/ipp/DiscCache;->flush()V
  :L80
    goto :L84
  :L81
  .line 1270
    move-exception v0
    move/from16 v27, v19
  :L82
    move/from16 v8, v27
    goto/16 :L107
  :L83
  .line 1229
    move-wide/from16 v25, v5
    move/from16 v27, v19
    move/from16 v19, v12
    move/from16 v12, v16
  .line 1253
    const/4 v1, 0
    const/4 v2, 0
    const-wide/16 v3, 0
  :L84
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v5
    sub-long v5, v5, v22
  .line 1256
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v8
  :L85
  .line 1257
    if-eqz v11, :L91
  .line 1258
    const/4 v0, 0
  :L86
    if-ge v0, v12, :L91
  :L87
  .line 1259
    invoke-virtual { v15, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v10
    invoke-virtual { v13, v10 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v10
    check-cast v10, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v10 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v10
    invoke-static { v10 }, Lcom/innioasis/ipp/Flow;->cacheSlide(Ljava/lang/String;)Z
    move-result v10
    if-nez v10, :L88
    add-int/lit8 v2, v2, 1
  :L88
  .line 1260
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tick()V
  :L89
  .line 1258
    add-int/lit8 v0, v0, 1
    goto :L86
  :L90
  .line 1270
    move-exception v0
    goto :L82
  :L91
  .line 1263
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v10
  :L92
    sub-long/2addr v10, v8
  .line 1266
    if-nez v1, :L94
    if-nez v2, :L94
  :L93
    iget-object v0, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    iget v8, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->mask:I
    move/from16 v9, v19
    invoke-static { v0, v9, v14, v8 }, Lcom/innioasis/ipp/Albums;->noteCached(Landroid/content/Context;III)V
  :L94
  .line 1267
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v8, "cache library: albums "
    invoke-virtual { v0, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    move-wide/from16 v8, v25
    invoke-virtual { v0, v8, v9 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v8, " ms, songs "
    invoke-virtual { v0, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v5, v6 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v5, " ms, flow "
    invoke-virtual { v0, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v10, v11 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v5, " ms, heap "
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
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L95
  .line 1273
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->endCache()V
  :L96
    goto :L98
  :L97
    move-exception v0
  :L98
  .line 1274
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  :L99
    goto :L101
  :L100
    move-exception v0
  :L101
  .line 1275
    iget-object v0, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    move/from16 v5, v27
    invoke-virtual { v0, v5 }, Lcom/innioasis/y1/activity/IppActivity;->cacheFinished(I)V
    goto :L114
  :L102
  .line 1270
    move-exception v0
    move/from16 v5, v27
    goto :L105
  :L103
    move-exception v0
    move/from16 v5, v19
    goto :L105
  :L104
    move-exception v0
  :L105
    move v8, v5
    goto :L107
  :L106
    move-exception v0
    const/4 v8, 0
  :L107
  .line 1273
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->endCache()V
  :L108
    goto :L110
  :L109
    move-exception v0
  :L110
  .line 1274
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  :L111
    goto :L113
  :L112
    move-exception v0
  :L113
  .line 1275
    iget-object v0, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v0, v8 }, Lcom/innioasis/y1/activity/IppActivity;->cacheFinished(I)V
  :L114
  .line 1276
    nop
  .line 1277
    return-void
.end method

.method tick()V
  .catchall { :L0 .. :L2 } :L3
  .catchall { :L4 .. :L5 } :L3
  .registers 5
  .line 1132
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->lock:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 1133
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->progress:I
    add-int/lit8 v1, v1, 1
    iput v1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->progress:I
  .line 1134
    iget v2, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tickEvery:I
    rem-int v2, v1, v2
    if-eqz v2, :L1
    monitor-exit v0
    return-void
  :L1
  .line 1135
    monitor-exit v0
  :L2
  .line 1136
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->label:Ljava/lang/String;
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, "\n"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    mul-int/lit8 v1, v1, 100
    iget v3, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
    div-int/2addr v1, v3
    invoke-virtual { v2, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, "%"
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->scanTick(Ljava/lang/String;)V
  .line 1137
    return-void
  :L3
  .line 1135
    move-exception v1
  :L4
    monitor-exit v0
  :L5
    throw v1
.end method
