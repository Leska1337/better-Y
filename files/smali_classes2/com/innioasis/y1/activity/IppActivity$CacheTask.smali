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
  .line 1086
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1080
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->lock:Ljava/lang/Object;
  .line 1081
    const-string v0, ""
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->label:Ljava/lang/String;
  .line 1082
    const/4 v0, 1
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
  .line 1083
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tickEvery:I
  .line 1087
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
  .line 1088
    iput p2, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->mask:I
  .line 1089
    return-void
.end method

.method public run()V
  .catchall { :L5 .. :L9 } :L103
  .catchall { :L12 .. :L13 } :L14
  .catchall { :L16 .. :L17 } :L103
  .catchall { :L18 .. :L19 } :L20
  .catchall { :L21 .. :L22 } :L23
  .catchall { :L25 .. :L26 } :L103
  .catchall { :L28 .. :L31 } :L14
  .catchall { :L32 .. :L33 } :L103
  .catchall { :L35 .. :L39 } :L14
  .catchall { :L40 .. :L43 } :L103
  .catchall { :L44 .. :L45 } :L14
  .catchall { :L45 .. :L46 } :L103
  .catchall { :L47 .. :L48 } :L14
  .catchall { :L48 .. :L49 } :L103
  .catchall { :L51 .. :L70 } :L101
  .catchall { :L71 .. :L72 } :L84
  .catchall { :L72 .. :L73 } :L74
  .catchall { :L75 .. :L77 } :L84
  .catchall { :L78 .. :L90 } :L91
  .catchall { :L92 .. :L93 } :L100
  .catchall { :L93 .. :L94 } :L95
  .catchall { :L96 .. :L97 } :L98
  .catchall { :L104 .. :L105 } :L106
  .catchall { :L107 .. :L108 } :L109
  .registers 25
  .line 1103
    move-object/from16 v7, p0
  .line 1104
    nop
  .line 1105
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
  .line 1106
    and-int/lit8 v1, v0, 2
    if-eqz v1, :L2
    const/4 v10, 1
    goto :L3
  :L2
    const/4 v10, 0
  :L3
  .line 1107
    and-int/lit8 v0, v0, 8
    if-eqz v0, :L4
    const/4 v11, 1
    goto :L5
  :L4
    const/4 v11, 0
  :L5
  .line 1109
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 1110
    if-nez v0, :L6
    const/4 v12, 0
    goto :L7
  :L6
    invoke-virtual { v0, v8 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsSync(I)Ljava/util/List;
    move-result-object v0
    move-object v12, v0
  :L7
  .line 1111
    if-nez v12, :L8
    const/4 v13, 0
    goto :L10
  :L8
    invoke-interface { v12 }, Ljava/util/List;->size()I
    move-result v0
  :L9
    move v13, v0
  :L10
  .line 1113
    nop
  .line 1114
    const-wide/16 v3, 0
    const/4 v0, 0
  :L11
    if-ge v0, v13, :L15
  :L12
  .line 1115
    invoke-interface { v12, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Lcom/innioasis/y1/database/Song;
  .line 1116
    if-eqz v5, :L13
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide v14
    cmp-long v6, v14, v3
    if-lez v6, :L13
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide v3
  :L13
  .line 1114
    add-int/lit8 v0, v0, 1
    goto :L11
  :L14
  .line 1232
    move-exception v0
    goto/16 :L104
  :L15
  .line 1118
    const-wide/16 v5, 1000
  :L16
    div-long/2addr v3, v5
    long-to-int v14, v3
  .line 1120
    iget-object v0, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    iget v3, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->mask:I
    invoke-static { v0, v13, v14, v3 }, Lcom/innioasis/ipp/Albums;->cached(Landroid/content/Context;III)Z
    move-result v0
  :L17
    if-eqz v0, :L25
  .line 1121
    nop
  :L18
  .line 1235
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->endCache()V
  :L19
    goto :L21
  :L20
    move-exception v0
  :L21
  .line 1236
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  :L22
    goto :L24
  :L23
    move-exception v0
  :L24
  .line 1237
    iget-object v0, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    const/4 v1, -1
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->cacheFinished(I)V
  .line 1122
    return-void
  :L25
  .line 1124
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->beginCache()V
  :L26
  .line 1127
    if-eqz v9, :L32
  .line 1128
    const/4 v0, 0
  :L27
    if-ge v0, v13, :L32
  :L28
  .line 1129
    invoke-interface { v12, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Song;
  .line 1130
    if-eqz v3, :L31
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v4
    if-nez v4, :L29
    goto :L31
  :L29
  .line 1131
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v4
    invoke-static { v4 }, Lcom/innioasis/ipp/Art;->coverChanged(Ljava/lang/String;)Z
    move-result v4
    if-nez v4, :L30
    goto :L31
  :L30
  .line 1132
    invoke-static { v3 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v4
    invoke-static { v4 }, Lcom/innioasis/ipp/CoverCache;->forget(Ljava/lang/String;)V
  .line 1133
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v4
    invoke-static { v4 }, Lcom/innioasis/ipp/BigCover;->forget(Ljava/lang/String;)V
  .line 1134
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v3
    invoke-static { v3 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    invoke-static { v3 }, Lcom/innioasis/ipp/BigCover;->forget(Ljava/lang/String;)V
  :L31
  .line 1128
    add-int/lit8 v0, v0, 1
    goto :L27
  :L32
  .line 1139
    new-instance v15, Ljava/util/LinkedHashMap;
    invoke-direct { v15 }, Ljava/util/LinkedHashMap;-><init>()V
  :L33
  .line 1140
    const/4 v0, 0
  :L34
    if-ge v0, v13, :L40
  :L35
  .line 1141
    invoke-interface { v12, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Song;
  .line 1142
    if-eqz v3, :L39
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v4
    if-nez v4, :L36
    goto :L39
  :L36
  .line 1143
    invoke-static { v3 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v4
  .line 1144
    if-nez v4, :L37
    goto :L39
  :L37
  .line 1145
    invoke-virtual { v15, v4 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Lcom/innioasis/y1/database/Song;
  .line 1146
    if-eqz v5, :L38
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v6, v5 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result v5
    if-gez v5, :L39
  :L38
    invoke-virtual { v15, v4, v3 }, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L39
  .line 1140
    add-int/lit8 v0, v0, 1
    goto :L34
  :L40
  .line 1149
    new-instance v6, Ljava/util/ArrayList;
    invoke-virtual { v15 }, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;
    move-result-object v0
    invoke-direct { v6, v0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 1150
    invoke-virtual { v6 }, Ljava/util/ArrayList;->size()I
    move-result v5
  .line 1151
    iget-object v0, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    const v3, 2131821074
    invoke-virtual { v0, v3 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object v0
    iput-object v0, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->label:Ljava/lang/String;
  .line 1153
    add-int v0, v5, v13
    if-eqz v11, :L41
    move v3, v5
    goto :L42
  :L41
    const/4 v3, 0
  :L42
    add-int/2addr v0, v3
    iput v0, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
  :L43
  .line 1154
    if-gtz v0, :L45
  :L44
    iput v2, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
  :L45
  .line 1155
    iget v0, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
    div-int/lit8 v0, v0, 60
    iput v0, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tickEvery:I
  :L46
  .line 1156
    if-ge v0, v2, :L48
  :L47
    iput v2, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tickEvery:I
  :L48
  .line 1160
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  :L49
  .line 1161
    const/4 v3, 0
    const/4 v4, 0
  :L50
    if-ge v3, v5, :L63
  :L51
  .line 1162
    invoke-virtual { v6, v3 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v16
    move-object/from16 v2, v16
    check-cast v2, Ljava/lang/String;
  .line 1163
    invoke-virtual { v15, v2 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v16
    check-cast v16, Lcom/innioasis/y1/database/Song;
  .line 1164
    if-eqz v10, :L53
    invoke-static { v2 }, Lcom/innioasis/ipp/AlbumInfo;->artist(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v18
    if-eqz v18, :L52
    invoke-static { v2 }, Lcom/innioasis/ipp/AlbumInfo;->path(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v18
    if-nez v18, :L53
  :L52
  .line 1165
    invoke-virtual/range { v16 .. v16 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v8
    invoke-virtual/range { v16 .. v16 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
    invoke-static { v2, v8, v1 }, Lcom/innioasis/ipp/AlbumInfo;->put(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
  :L53
  .line 1167
    invoke-static { v2 }, Lcom/innioasis/ipp/AlbumInfo;->path(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
  .line 1168
    if-nez v1, :L54
    invoke-virtual/range { v16 .. v16 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
  :L54
  .line 1169
    new-instance v8, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;
    invoke-direct { v8 }, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;-><init>()V
  .line 1170
    iput-object v2, v8, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->key:Ljava/lang/String;
  .line 1171
    iput-object v1, v8, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->path:Ljava/lang/String;
  .line 1172
    if-eqz v10, :L55
    invoke-static { v2 }, Lcom/innioasis/ipp/AlbumArtist;->needsRead(Ljava/lang/String;)Z
    move-result v16
    if-eqz v16, :L55
    move/from16 v16, v5
    const/4 v5, 1
    goto :L56
  :L55
    move/from16 v16, v5
    const/4 v5, 0
  :L56
    iput-boolean v5, v8, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->artist:Z
  .line 1173
    if-eqz v10, :L57
    invoke-static { v2 }, Lcom/innioasis/ipp/YearCache;->get(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
    if-nez v5, :L57
    const/4 v5, 1
    goto :L58
  :L57
    const/4 v5, 0
  :L58
    iput-boolean v5, v8, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->year:Z
  .line 1174
    if-eqz v9, :L59
    invoke-static { v2 }, Lcom/innioasis/ipp/CoverCache;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v5
    if-nez v5, :L59
    const/4 v5, 1
    goto :L60
  :L59
    const/4 v5, 0
  :L60
    iput-boolean v5, v8, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->thumb:Z
  .line 1175
    iget-boolean v5, v8, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->thumb:Z
    if-eqz v5, :L61
    invoke-static { v2, v1 }, Lcom/innioasis/ipp/Art;->thumbFromTags(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L61
    const/4 v1, 1
    goto :L62
  :L61
    const/4 v1, 0
  :L62
    iput-boolean v1, v8, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->art:Z
  .line 1176
    invoke-virtual { v0, v8 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1177
    add-int/lit8 v4, v4, 1
  .line 1161
    add-int/lit8 v3, v3, 1
    move/from16 v5, v16
    const/4 v2, 1
    const/4 v8, 0
    goto/16 :L50
  :L63
  .line 1179
    move/from16 v16, v5
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v1
    invoke-static { v1 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->each(I)Lcom/innioasis/y1/activity/IppActivity$Blocks;
    move-result-object v1
  .line 1180
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->access$400()I
    move-result v2
    new-array v3, v2, [Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;
  .line 1181
    const/4 v5, 0
  :L64
    if-ge v5, v2, :L65
    new-instance v8, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;
    invoke-direct { v8, v7, v0, v1 }, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;-><init>(Lcom/innioasis/y1/activity/IppActivity$CacheTask;Ljava/util/List;Lcom/innioasis/y1/activity/IppActivity$Blocks;)V
    aput-object v8, v3, v5
    add-int/lit8 v5, v5, 1
    goto :L64
  :L65
  .line 1182
    invoke-static { v3 }, Lcom/innioasis/y1/activity/IppActivity;->access$500([Ljava/lang/Runnable;)V
  .line 1183
    const/4 v1, 0
  :L66
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v2
    if-ge v1, v2, :L69
  .line 1184
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;
  .line 1185
    iget-boolean v3, v2, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->artist:Z
    if-eqz v3, :L67
    iget-object v3, v2, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->key:Ljava/lang/String;
    iget-object v5, v2, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->gotArtist:Ljava/lang/String;
    invoke-static { v3, v5 }, Lcom/innioasis/ipp/AlbumArtist;->put(Ljava/lang/String;Ljava/lang/String;)V
  :L67
  .line 1186
    iget-boolean v3, v2, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->year:Z
    if-eqz v3, :L68
    iget-object v3, v2, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->key:Ljava/lang/String;
    iget-object v5, v2, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->gotYear:Ljava/lang/String;
    iget-object v2, v2, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->gotDate:Ljava/lang/String;
    invoke-static { v3, v5, v2 }, Lcom/innioasis/ipp/YearCache;->put(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
  :L68
  .line 1183
    add-int/lit8 v1, v1, 1
    goto :L66
  :L69
  .line 1188
    if-eqz v10, :L70
  .line 1189
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->flush()V
  .line 1190
    invoke-static { v6 }, Lcom/innioasis/ipp/YearCache;->warm(Ljava/util/List;)V
  :L70
  .line 1196
    if-eqz v12, :L86
    if-lez v13, :L86
  :L71
  .line 1197
    new-instance v8, Ljava/util/ArrayList;
    invoke-direct { v8, v12 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  :L72
  .line 1199
    new-instance v0, Lcom/innioasis/y1/activity/IppActivity$ByPath;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Lcom/innioasis/y1/activity/IppActivity$ByPath;-><init>(Lcom/innioasis/y1/activity/IppActivity$1;)V
    invoke-static { v8, v0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  :L73
  .line 1201
    goto :L75
  :L74
  .line 1200
    move-exception v0
  :L75
  .line 1203
    invoke-static { }, Lcom/innioasis/ipp/DiscCache;->warm()V
  .line 1204
    invoke-static { v8 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->folders(Ljava/util/List;)Lcom/innioasis/y1/activity/IppActivity$Blocks;
    move-result-object v0
  .line 1205
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->access$400()I
    move-result v5
    new-array v3, v5, [Lcom/innioasis/y1/activity/IppActivity$SongWorker;
  .line 1206
    const/4 v2, 0
  :L76
    if-ge v2, v5, :L79
  .line 1207
    new-instance v17, Lcom/innioasis/y1/activity/IppActivity$SongWorker;
  :L77
    move-object/from16 v1, v17
    move/from16 v19, v2
    move-object/from16 v2, p0
    move-object/from16 v20, v3
    move-object v3, v8
    move-object/from16 v21, v8
    move v8, v4
    move-object v4, v0
    move/from16 v22, v8
    move/from16 v8, v16
    move-object/from16 v16, v0
    move v0, v5
    move v5, v10
    move/from16 v23, v13
    move-object v13, v6
    move v6, v9
  :L78
    invoke-direct/range { v1 .. v6 }, Lcom/innioasis/y1/activity/IppActivity$SongWorker;-><init>(Lcom/innioasis/y1/activity/IppActivity$CacheTask;Ljava/util/List;Lcom/innioasis/y1/activity/IppActivity$Blocks;ZZ)V
    aput-object v17, v20, v19
  .line 1206
    add-int/lit8 v2, v19, 1
    move v5, v0
    move-object v6, v13
    move-object/from16 v0, v16
    move-object/from16 v3, v20
    move/from16 v4, v22
    move/from16 v13, v23
    move/from16 v16, v8
    move-object/from16 v8, v21
    goto :L76
  :L79
  .line 1209
    move-object/from16 v20, v3
    move/from16 v22, v4
    move v0, v5
    move/from16 v23, v13
    move/from16 v8, v16
    move-object v13, v6
    invoke-static/range { v20 .. v20 }, Lcom/innioasis/y1/activity/IppActivity;->access$500([Ljava/lang/Runnable;)V
  .line 1210
    const/4 v1, 0
    const/4 v2, 0
  :L80
    if-ge v1, v0, :L81
    aget-object v3, v20, v1
    iget v3, v3, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->failed:I
    add-int/2addr v2, v3
    add-int/lit8 v1, v1, 1
    goto :L80
  :L81
  .line 1211
    if-eqz v10, :L87
  .line 1214
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
    invoke-static { v1 }, Lcom/innioasis/ipp/TrackCache;->sorted(Ljava/util/List;)Ljava/util/List;
  .line 1215
    const/4 v1, 0
  :L82
    if-ge v1, v0, :L83
    aget-object v3, v20, v1
    invoke-virtual { v3 }, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->commit()V
    add-int/lit8 v1, v1, 1
    goto :L82
  :L83
  .line 1216
    invoke-static { }, Lcom/innioasis/ipp/DiscCache;->flush()V
  .line 1217
    invoke-static { v12 }, Lcom/innioasis/ipp/TrackCache;->sorted(Ljava/util/List;)Ljava/util/List;
    goto :L87
  :L84
  .line 1232
    move-exception v0
    move/from16 v22, v4
  :L85
    move/from16 v8, v22
    goto/16 :L104
  :L86
  .line 1196
    move/from16 v22, v4
    move/from16 v23, v13
    move/from16 v8, v16
    move-object v13, v6
  .line 1222
    const/4 v2, 0
  :L87
    if-eqz v11, :L89
  .line 1223
    const/4 v0, 0
  :L88
    if-ge v0, v8, :L89
  .line 1224
    invoke-virtual { v13, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v1
    invoke-virtual { v15, v1 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Flow;->cacheSlide(Ljava/lang/String;)V
  .line 1225
    invoke-virtual/range { p0 .. p0 }, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tick()V
  .line 1223
    add-int/lit8 v0, v0, 1
    goto :L88
  :L89
  .line 1230
    if-nez v2, :L92
    iget-object v0, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    iget v1, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->mask:I
    move/from16 v8, v23
    invoke-static { v0, v8, v14, v1 }, Lcom/innioasis/ipp/Albums;->noteCached(Landroid/content/Context;III)V
  :L90
    goto :L93
  :L91
  .line 1232
    move-exception v0
    goto :L85
  :L92
  .line 1231
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
  :L93
  .line 1235
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->endCache()V
  :L94
    goto :L96
  :L95
    move-exception v0
  :L96
  .line 1236
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  :L97
    goto :L99
  :L98
    move-exception v0
  :L99
  .line 1237
    iget-object v0, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    move/from16 v4, v22
    invoke-virtual { v0, v4 }, Lcom/innioasis/y1/activity/IppActivity;->cacheFinished(I)V
    goto :L111
  :L100
  .line 1232
    move-exception v0
    move/from16 v4, v22
    goto :L102
  :L101
    move-exception v0
  :L102
    move v8, v4
    goto :L104
  :L103
    move-exception v0
    const/4 v8, 0
  :L104
  .line 1235
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->endCache()V
  :L105
    goto :L107
  :L106
    move-exception v0
  :L107
  .line 1236
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  :L108
    goto :L110
  :L109
    move-exception v0
  :L110
  .line 1237
    iget-object v0, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v0, v8 }, Lcom/innioasis/y1/activity/IppActivity;->cacheFinished(I)V
  :L111
  .line 1238
    nop
  .line 1239
    return-void
.end method

.method tick()V
  .catchall { :L0 .. :L2 } :L3
  .catchall { :L4 .. :L5 } :L3
  .registers 5
  .line 1094
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->lock:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 1095
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->progress:I
    add-int/lit8 v1, v1, 1
    iput v1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->progress:I
  .line 1096
    iget v2, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tickEvery:I
    rem-int v2, v1, v2
    if-eqz v2, :L1
    monitor-exit v0
    return-void
  :L1
  .line 1097
    monitor-exit v0
  :L2
  .line 1098
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->label:Ljava/lang/String;
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, "  "
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
  .line 1099
    return-void
  :L3
  .line 1097
    move-exception v1
  :L4
    monitor-exit v0
  :L5
    throw v1
.end method
