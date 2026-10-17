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
  .line 1098
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1092
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->lock:Ljava/lang/Object;
  .line 1093
    const-string v0, ""
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->label:Ljava/lang/String;
  .line 1094
    const/4 v0, 1
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
  .line 1095
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tickEvery:I
  .line 1099
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
  .line 1100
    iput p2, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->mask:I
  .line 1101
    return-void
.end method

.method public run()V
  .catchall { :L5 .. :L9 } :L95
  .catchall { :L12 .. :L13 } :L14
  .catchall { :L16 .. :L17 } :L95
  .catchall { :L18 .. :L19 } :L20
  .catchall { :L21 .. :L22 } :L23
  .catchall { :L25 .. :L26 } :L95
  .catchall { :L28 .. :L31 } :L14
  .catchall { :L32 .. :L33 } :L95
  .catchall { :L35 .. :L39 } :L14
  .catchall { :L40 .. :L43 } :L95
  .catchall { :L44 .. :L45 } :L14
  .catchall { :L45 .. :L46 } :L95
  .catchall { :L47 .. :L48 } :L14
  .catchall { :L48 .. :L49 } :L95
  .catchall { :L51 .. :L62 } :L93
  .catchall { :L63 .. :L64 } :L76
  .catchall { :L64 .. :L65 } :L66
  .catchall { :L67 .. :L69 } :L76
  .catchall { :L70 .. :L82 } :L83
  .catchall { :L84 .. :L85 } :L92
  .catchall { :L85 .. :L86 } :L87
  .catchall { :L88 .. :L89 } :L90
  .catchall { :L96 .. :L97 } :L98
  .catchall { :L99 .. :L100 } :L101
  .registers 24
  .line 1115
    move-object/from16 v7, p0
  .line 1116
    nop
  .line 1117
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
  .line 1118
    and-int/lit8 v1, v0, 2
    if-eqz v1, :L2
    const/4 v10, 1
    goto :L3
  :L2
    const/4 v10, 0
  :L3
  .line 1119
    and-int/lit8 v0, v0, 8
    if-eqz v0, :L4
    const/4 v11, 1
    goto :L5
  :L4
    const/4 v11, 0
  :L5
  .line 1121
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 1122
    if-nez v0, :L6
    const/4 v0, 0
    goto :L7
  :L6
    invoke-virtual { v0, v8 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsSync(I)Ljava/util/List;
    move-result-object v0
  :L7
  .line 1123
    if-nez v0, :L8
    const/4 v12, 0
    goto :L10
  :L8
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v3
  :L9
    move v12, v3
  :L10
  .line 1125
    nop
  .line 1126
    const-wide/16 v3, 0
    const/4 v5, 0
  :L11
    if-ge v5, v12, :L15
  :L12
  .line 1127
    invoke-interface { v0, v5 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lcom/innioasis/y1/database/Song;
  .line 1128
    if-eqz v6, :L13
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide v13
    cmp-long v15, v13, v3
    if-lez v15, :L13
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide v3
  :L13
  .line 1126
    add-int/lit8 v5, v5, 1
    goto :L11
  :L14
  .line 1227
    move-exception v0
    goto/16 :L96
  :L15
  .line 1130
    const-wide/16 v5, 1000
  :L16
    div-long/2addr v3, v5
    long-to-int v13, v3
  .line 1132
    iget-object v3, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    iget v4, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->mask:I
    invoke-static { v3, v12, v13, v4 }, Lcom/innioasis/ipp/Albums;->cached(Landroid/content/Context;III)Z
    move-result v3
  :L17
    if-eqz v3, :L25
  .line 1133
    nop
  :L18
  .line 1230
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->endCache()V
  :L19
    goto :L21
  :L20
    move-exception v0
  :L21
  .line 1231
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  :L22
    goto :L24
  :L23
    move-exception v0
  :L24
  .line 1232
    iget-object v0, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    const/4 v1, -1
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->cacheFinished(I)V
  .line 1134
    return-void
  :L25
  .line 1136
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->beginCache()V
  :L26
  .line 1139
    if-eqz v9, :L32
  .line 1140
    const/4 v3, 0
  :L27
    if-ge v3, v12, :L32
  :L28
  .line 1141
    invoke-interface { v0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/y1/database/Song;
  .line 1142
    if-eqz v4, :L31
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v5
    if-nez v5, :L29
    goto :L31
  :L29
  .line 1143
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v5
    invoke-static { v5 }, Lcom/innioasis/ipp/Art;->coverChanged(Ljava/lang/String;)Z
    move-result v5
    if-nez v5, :L30
    goto :L31
  :L30
  .line 1144
    invoke-static { v4 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v5
    invoke-static { v5 }, Lcom/innioasis/ipp/CoverCache;->forget(Ljava/lang/String;)V
  .line 1145
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v5
    invoke-static { v5 }, Lcom/innioasis/ipp/BigCover;->forget(Ljava/lang/String;)V
  .line 1146
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v4
    invoke-static { v4 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
    invoke-static { v4 }, Lcom/innioasis/ipp/BigCover;->forget(Ljava/lang/String;)V
  :L31
  .line 1140
    add-int/lit8 v3, v3, 1
    goto :L27
  :L32
  .line 1151
    new-instance v14, Ljava/util/LinkedHashMap;
    invoke-direct { v14 }, Ljava/util/LinkedHashMap;-><init>()V
  :L33
  .line 1152
    const/4 v3, 0
  :L34
    if-ge v3, v12, :L40
  :L35
  .line 1153
    invoke-interface { v0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/y1/database/Song;
  .line 1154
    if-eqz v4, :L39
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v5
    if-nez v5, :L36
    goto :L39
  :L36
  .line 1155
    invoke-static { v4 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v5
  .line 1156
    if-nez v5, :L37
    goto :L39
  :L37
  .line 1157
    invoke-virtual { v14, v5 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lcom/innioasis/y1/database/Song;
  .line 1158
    if-eqz v6, :L38
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v15
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v15, v6 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result v6
    if-gez v6, :L39
  :L38
    invoke-virtual { v14, v5, v4 }, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L39
  .line 1152
    add-int/lit8 v3, v3, 1
    goto :L34
  :L40
  .line 1161
    new-instance v15, Ljava/util/ArrayList;
    invoke-virtual { v14 }, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;
    move-result-object v3
    invoke-direct { v15, v3 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 1162
    invoke-virtual { v15 }, Ljava/util/ArrayList;->size()I
    move-result v6
  .line 1163
    iget-object v3, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    const v4, 2131821074
    invoke-virtual { v3, v4 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object v3
    iput-object v3, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->label:Ljava/lang/String;
  .line 1165
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
  .line 1166
    if-gtz v3, :L45
  :L44
    iput v2, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
  :L45
  .line 1167
    iget v3, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
    div-int/lit8 v3, v3, 60
    iput v3, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tickEvery:I
  :L46
  .line 1168
    if-ge v3, v2, :L48
  :L47
    iput v2, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tickEvery:I
  :L48
  .line 1172
    new-instance v3, Ljava/util/ArrayList;
    invoke-direct { v3 }, Ljava/util/ArrayList;-><init>()V
  :L49
  .line 1173
    const/4 v4, 0
    const/4 v5, 0
  :L50
    if-ge v4, v6, :L59
  :L51
  .line 1174
    invoke-virtual { v15, v4 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v16
    move-object/from16 v2, v16
    check-cast v2, Ljava/lang/String;
  .line 1175
    invoke-virtual { v14, v2 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v16
    check-cast v16, Lcom/innioasis/y1/database/Song;
  .line 1176
    if-eqz v10, :L53
    invoke-static { v2 }, Lcom/innioasis/ipp/AlbumInfo;->artist(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v18
    if-eqz v18, :L52
    invoke-static { v2 }, Lcom/innioasis/ipp/AlbumInfo;->path(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v18
    if-nez v18, :L53
  :L52
  .line 1177
    invoke-virtual/range { v16 .. v16 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v8
    invoke-virtual/range { v16 .. v16 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
    invoke-static { v2, v8, v1 }, Lcom/innioasis/ipp/AlbumInfo;->put(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
  :L53
  .line 1179
    invoke-static { v2 }, Lcom/innioasis/ipp/AlbumInfo;->path(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
  .line 1180
    if-nez v1, :L54
    invoke-virtual/range { v16 .. v16 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
  :L54
  .line 1181
    new-instance v8, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;
    invoke-direct { v8 }, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;-><init>()V
  .line 1182
    iput-object v2, v8, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->key:Ljava/lang/String;
  .line 1183
    iput-object v1, v8, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->path:Ljava/lang/String;
  .line 1184
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
  .line 1185
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
  .line 1186
    invoke-virtual { v3, v8 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1187
    add-int/lit8 v5, v5, 1
  .line 1173
    add-int/lit8 v4, v4, 1
    move/from16 v6, v16
    const/4 v2, 1
    const/4 v8, 0
    goto :L50
  :L59
  .line 1189
    move/from16 v16, v6
    invoke-virtual { v3 }, Ljava/util/ArrayList;->size()I
    move-result v1
    invoke-static { v1 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->each(I)Lcom/innioasis/y1/activity/IppActivity$Blocks;
    move-result-object v1
  .line 1190
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->access$400()I
    move-result v2
    new-array v4, v2, [Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;
  .line 1191
    const/4 v6, 0
  :L60
    if-ge v6, v2, :L61
    new-instance v8, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;
    invoke-direct { v8, v7, v3, v1 }, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;-><init>(Lcom/innioasis/y1/activity/IppActivity$CacheTask;Ljava/util/List;Lcom/innioasis/y1/activity/IppActivity$Blocks;)V
    aput-object v8, v4, v6
    add-int/lit8 v6, v6, 1
    goto :L60
  :L61
  .line 1192
    invoke-static { v4 }, Lcom/innioasis/y1/activity/IppActivity;->access$500([Ljava/lang/Runnable;)V
  :L62
  .line 1197
    if-eqz v0, :L78
    if-lez v12, :L78
  :L63
  .line 1198
    new-instance v8, Ljava/util/ArrayList;
    invoke-direct { v8, v0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  :L64
  .line 1200
    new-instance v0, Lcom/innioasis/y1/activity/IppActivity$ByPath;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Lcom/innioasis/y1/activity/IppActivity$ByPath;-><init>(Lcom/innioasis/y1/activity/IppActivity$1;)V
    invoke-static { v8, v0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  :L65
  .line 1202
    goto :L67
  :L66
  .line 1201
    move-exception v0
  :L67
  .line 1203
    invoke-static { v8 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->folders(Ljava/util/List;)Lcom/innioasis/y1/activity/IppActivity$Blocks;
    move-result-object v0
  .line 1204
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->access$400()I
    move-result v6
    new-array v4, v6, [Lcom/innioasis/y1/activity/IppActivity$SongWorker;
  .line 1205
    const/4 v3, 0
  :L68
    if-ge v3, v6, :L71
  .line 1206
    new-instance v17, Lcom/innioasis/y1/activity/IppActivity$SongWorker;
  :L69
    move-object/from16 v1, v17
    move-object/from16 v2, p0
    move/from16 v19, v3
    move-object v3, v8
    move-object/from16 v20, v4
    move-object v4, v0
    move-object/from16 v21, v8
    move v8, v5
    move v5, v10
    move/from16 v22, v8
    move/from16 v8, v16
    move-object/from16 v16, v0
    move v0, v6
    move v6, v9
  :L70
    invoke-direct/range { v1 .. v6 }, Lcom/innioasis/y1/activity/IppActivity$SongWorker;-><init>(Lcom/innioasis/y1/activity/IppActivity$CacheTask;Ljava/util/List;Lcom/innioasis/y1/activity/IppActivity$Blocks;ZZ)V
    aput-object v17, v20, v19
  .line 1205
    add-int/lit8 v3, v19, 1
    move v6, v0
    move-object/from16 v0, v16
    move-object/from16 v4, v20
    move/from16 v5, v22
    move/from16 v16, v8
    move-object/from16 v8, v21
    goto :L68
  :L71
  .line 1208
    move-object/from16 v20, v4
    move/from16 v22, v5
    move v0, v6
    move/from16 v8, v16
    invoke-static/range { v20 .. v20 }, Lcom/innioasis/y1/activity/IppActivity;->access$500([Ljava/lang/Runnable;)V
  .line 1209
    const/4 v1, 0
    const/4 v2, 0
  :L72
    if-ge v1, v0, :L73
    aget-object v3, v20, v1
    iget v3, v3, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->failed:I
    add-int/2addr v2, v3
    add-int/lit8 v1, v1, 1
    goto :L72
  :L73
  .line 1210
    if-eqz v10, :L79
  .line 1211
    const/4 v1, 0
  :L74
    if-ge v1, v0, :L75
    aget-object v3, v20, v1
    invoke-virtual { v3 }, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->commit()V
    add-int/lit8 v1, v1, 1
    goto :L74
  :L75
  .line 1212
    invoke-static { }, Lcom/innioasis/ipp/DiscCache;->flush()V
    goto :L79
  :L76
  .line 1227
    move-exception v0
    move/from16 v22, v5
  :L77
    move/from16 v8, v22
    goto/16 :L96
  :L78
  .line 1197
    move/from16 v22, v5
    move/from16 v8, v16
  .line 1217
    const/4 v2, 0
  :L79
    if-eqz v11, :L81
  .line 1218
    const/4 v0, 0
  :L80
    if-ge v0, v8, :L81
  .line 1219
    invoke-virtual { v15, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v1
    invoke-virtual { v14, v1 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Flow;->cacheSlide(Ljava/lang/String;)V
  .line 1220
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tick()V
  .line 1218
    add-int/lit8 v0, v0, 1
    goto :L80
  :L81
  .line 1225
    if-nez v2, :L84
    iget-object v0, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    iget v1, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->mask:I
    invoke-static { v0, v12, v13, v1 }, Lcom/innioasis/ipp/Albums;->noteCached(Landroid/content/Context;III)V
  :L82
    goto :L85
  :L83
  .line 1227
    move-exception v0
    goto :L77
  :L84
  .line 1226
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "cache library: "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " file(s) did not read"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L85
  .line 1230
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->endCache()V
  :L86
    goto :L88
  :L87
    move-exception v0
  :L88
  .line 1231
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  :L89
    goto :L91
  :L90
    move-exception v0
  :L91
  .line 1232
    iget-object v0, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    move/from16 v5, v22
    invoke-virtual { v0, v5 }, Lcom/innioasis/y1/activity/IppActivity;->cacheFinished(I)V
    goto :L103
  :L92
  .line 1227
    move-exception v0
    move/from16 v5, v22
    goto :L94
  :L93
    move-exception v0
  :L94
    move v8, v5
    goto :L96
  :L95
    move-exception v0
    const/4 v8, 0
  :L96
  .line 1230
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->endCache()V
  :L97
    goto :L99
  :L98
    move-exception v0
  :L99
  .line 1231
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  :L100
    goto :L102
  :L101
    move-exception v0
  :L102
  .line 1232
    iget-object v0, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v0, v8 }, Lcom/innioasis/y1/activity/IppActivity;->cacheFinished(I)V
  :L103
  .line 1233
    nop
  .line 1234
    return-void
.end method

.method tick()V
  .catchall { :L0 .. :L2 } :L3
  .catchall { :L4 .. :L5 } :L3
  .registers 5
  .line 1106
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->lock:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 1107
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->progress:I
    add-int/lit8 v1, v1, 1
    iput v1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->progress:I
  .line 1108
    iget v2, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tickEvery:I
    rem-int v2, v1, v2
    if-eqz v2, :L1
    monitor-exit v0
    return-void
  :L1
  .line 1109
    monitor-exit v0
  :L2
  .line 1110
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
  .line 1111
    return-void
  :L3
  .line 1109
    move-exception v1
  :L4
    monitor-exit v0
  :L5
    throw v1
.end method
