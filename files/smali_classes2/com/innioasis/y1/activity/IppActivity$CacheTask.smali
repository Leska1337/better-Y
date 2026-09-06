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
  .line 1046
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1040
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->lock:Ljava/lang/Object;
  .line 1041
    const-string v0, ""
    iput-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->label:Ljava/lang/String;
  .line 1042
    const/4 v0, 1
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
  .line 1043
    iput v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tickEvery:I
  .line 1047
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
  .line 1048
    iput p2, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->mask:I
  .line 1049
    return-void
.end method

.method public run()V
  .catchall { :L3 .. :L7 } :L84
  .catchall { :L10 .. :L11 } :L12
  .catchall { :L14 .. :L15 } :L84
  .catchall { :L16 .. :L17 } :L18
  .catchall { :L19 .. :L20 } :L21
  .catchall { :L23 .. :L24 } :L84
  .catchall { :L26 .. :L29 } :L12
  .catchall { :L30 .. :L31 } :L84
  .catchall { :L33 .. :L37 } :L12
  .catchall { :L38 .. :L39 } :L84
  .catchall { :L40 .. :L41 } :L12
  .catchall { :L41 .. :L42 } :L84
  .catchall { :L43 .. :L44 } :L12
  .catchall { :L44 .. :L45 } :L84
  .catchall { :L47 .. :L67 } :L83
  .catchall { :L67 .. :L68 } :L69
  .catchall { :L70 .. :L76 } :L83
  .catchall { :L76 .. :L77 } :L78
  .catchall { :L79 .. :L80 } :L81
  .catchall { :L85 .. :L86 } :L87
  .catchall { :L88 .. :L89 } :L90
  .registers 20
  .line 1067
    move-object/from16 v7, p0
  .line 1068
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
  .line 1069
    and-int/lit8 v0, v0, 2
    if-eqz v0, :L2
    const/4 v10, 1
    goto :L3
  :L2
    const/4 v10, 0
  :L3
  .line 1071
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 1072
    if-nez v0, :L4
    const/4 v11, 0
    goto :L5
  :L4
    invoke-virtual { v0, v8 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsSync(I)Ljava/util/List;
    move-result-object v0
    move-object v11, v0
  :L5
  .line 1073
    if-nez v11, :L6
    const/4 v12, 0
    goto :L8
  :L6
    invoke-interface { v11 }, Ljava/util/List;->size()I
    move-result v0
  :L7
    move v12, v0
  :L8
  .line 1075
    nop
  .line 1076
    const-wide/16 v3, 0
    const/4 v0, 0
  :L9
    if-ge v0, v12, :L13
  :L10
  .line 1077
    invoke-interface { v11, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Lcom/innioasis/y1/database/Song;
  .line 1078
    if-eqz v5, :L11
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide v13
    cmp-long v6, v13, v3
    if-lez v6, :L11
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide v3
  :L11
  .line 1076
    add-int/lit8 v0, v0, 1
    goto :L9
  :L12
  .line 1216
    move-exception v0
    goto/16 :L85
  :L13
  .line 1080
    const-wide/16 v5, 1000
  :L14
    div-long/2addr v3, v5
    long-to-int v13, v3
  .line 1082
    iget-object v0, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    iget v3, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->mask:I
    invoke-static { v0, v12, v13, v3 }, Lcom/innioasis/ipp/Albums;->cached(Landroid/content/Context;III)Z
    move-result v0
  :L15
    if-eqz v0, :L23
  .line 1083
    nop
  :L16
  .line 1221
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->endCache()V
  :L17
    goto :L19
  :L18
    move-exception v0
  :L19
  .line 1222
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  :L20
    goto :L22
  :L21
    move-exception v0
  :L22
  .line 1223
    iget-object v0, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    const/4 v1, -1
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppActivity;->cacheFinished(I)V
  .line 1084
    return-void
  :L23
  .line 1088
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->beginCache()V
  :L24
  .line 1096
    if-eqz v9, :L30
  .line 1097
    const/4 v0, 0
  :L25
    if-ge v0, v12, :L30
  :L26
  .line 1098
    invoke-interface { v11, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Song;
  .line 1099
    if-eqz v3, :L29
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v4
    if-nez v4, :L27
    goto :L29
  :L27
  .line 1100
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v4
    invoke-static { v4 }, Lcom/innioasis/ipp/Art;->coverChanged(Ljava/lang/String;)Z
    move-result v4
    if-nez v4, :L28
    goto :L29
  :L28
  .line 1101
    invoke-static { v3 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v4
    invoke-static { v4 }, Lcom/innioasis/ipp/CoverCache;->forget(Ljava/lang/String;)V
  .line 1102
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v4
    invoke-static { v4 }, Lcom/innioasis/ipp/BigCover;->forget(Ljava/lang/String;)V
  .line 1103
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v3
    invoke-static { v3 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    invoke-static { v3 }, Lcom/innioasis/ipp/BigCover;->forget(Ljava/lang/String;)V
  :L29
  .line 1097
    add-int/lit8 v0, v0, 1
    goto :L25
  :L30
  .line 1109
    new-instance v0, Ljava/util/LinkedHashMap;
    invoke-direct { v0 }, Ljava/util/LinkedHashMap;-><init>()V
  :L31
  .line 1110
    const/4 v3, 0
  :L32
    if-ge v3, v12, :L38
  :L33
  .line 1111
    invoke-interface { v11, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/y1/database/Song;
  .line 1112
    if-eqz v4, :L37
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v5
    if-nez v5, :L34
    goto :L37
  :L34
  .line 1113
    invoke-static { v4 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v5
  .line 1114
    if-nez v5, :L35
    goto :L37
  :L35
  .line 1115
    invoke-virtual { v0, v5 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lcom/innioasis/y1/database/Song;
  .line 1116
    if-eqz v6, :L36
    invoke-virtual { v4 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v14
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v6
    invoke-virtual { v14, v6 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result v6
    if-gez v6, :L37
  :L36
    invoke-virtual { v0, v5, v4 }, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L37
  .line 1110
    add-int/lit8 v3, v3, 1
    goto :L32
  :L38
  .line 1119
    new-instance v3, Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;
    move-result-object v4
    invoke-direct { v3, v4 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 1120
    invoke-virtual { v3 }, Ljava/util/ArrayList;->size()I
    move-result v4
  .line 1121
    iget-object v5, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    const v6, 2131821074
    invoke-virtual { v5, v6 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object v5
    iput-object v5, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->label:Ljava/lang/String;
  .line 1125
    add-int v5, v4, v12
    iput v5, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
  :L39
  .line 1126
    if-gtz v5, :L41
  :L40
    iput v2, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
  :L41
  .line 1127
    iget v5, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->total:I
    div-int/lit8 v5, v5, 60
    iput v5, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tickEvery:I
  :L42
  .line 1128
    if-ge v5, v2, :L44
  :L43
    iput v2, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tickEvery:I
  :L44
  .line 1134
    new-instance v5, Ljava/util/ArrayList;
    invoke-direct { v5 }, Ljava/util/ArrayList;-><init>()V
  :L45
  .line 1135
    const/4 v6, 0
    const/4 v14, 0
  :L46
    if-ge v6, v4, :L59
  :L47
  .line 1136
    invoke-virtual { v3, v6 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v15
    check-cast v15, Ljava/lang/String;
  .line 1137
    invoke-virtual { v0, v15 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v16
    check-cast v16, Lcom/innioasis/y1/database/Song;
  .line 1138
    if-eqz v10, :L49
    invoke-static { v15 }, Lcom/innioasis/ipp/AlbumInfo;->artist(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v17
    if-eqz v17, :L48
    invoke-static { v15 }, Lcom/innioasis/ipp/AlbumInfo;->path(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v17
    if-nez v17, :L49
  :L48
  .line 1139
    invoke-virtual/range { v16 .. v16 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v2
    invoke-virtual/range { v16 .. v16 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v8
    invoke-static { v15, v2, v8 }, Lcom/innioasis/ipp/AlbumInfo;->put(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
  :L49
  .line 1141
    invoke-static { v15 }, Lcom/innioasis/ipp/AlbumInfo;->path(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 1142
    if-nez v2, :L50
    invoke-virtual/range { v16 .. v16 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v2
  :L50
  .line 1143
    new-instance v8, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;
    invoke-direct { v8 }, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;-><init>()V
  .line 1144
    iput-object v15, v8, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->key:Ljava/lang/String;
  .line 1145
    iput-object v2, v8, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->path:Ljava/lang/String;
  .line 1146
    if-eqz v10, :L51
    invoke-static { v15 }, Lcom/innioasis/ipp/AlbumArtist;->needsRead(Ljava/lang/String;)Z
    move-result v16
    if-eqz v16, :L51
    const/4 v1, 1
    goto :L52
  :L51
    const/4 v1, 0
  :L52
    iput-boolean v1, v8, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->artist:Z
  .line 1147
    if-eqz v10, :L53
    invoke-static { v15 }, Lcom/innioasis/ipp/YearCache;->get(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
    if-nez v1, :L53
    const/4 v1, 1
    goto :L54
  :L53
    const/4 v1, 0
  :L54
    iput-boolean v1, v8, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->year:Z
  .line 1148
    if-eqz v9, :L55
    invoke-static { v15 }, Lcom/innioasis/ipp/CoverCache;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v1
    if-nez v1, :L55
    const/4 v1, 1
    goto :L56
  :L55
    const/4 v1, 0
  :L56
    iput-boolean v1, v8, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->thumb:Z
  .line 1149
    iget-boolean v1, v8, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->thumb:Z
    if-eqz v1, :L57
    invoke-static { v15, v2 }, Lcom/innioasis/ipp/Art;->thumbFromTags(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L57
    const/4 v1, 1
    goto :L58
  :L57
    const/4 v1, 0
  :L58
    iput-boolean v1, v8, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->art:Z
  .line 1150
    invoke-virtual { v5, v8 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1151
    add-int/lit8 v14, v14, 1
  .line 1135
    add-int/lit8 v6, v6, 1
    const/4 v2, 1
    const/4 v8, 0
    goto :L46
  :L59
  .line 1153
    invoke-virtual { v5 }, Ljava/util/ArrayList;->size()I
    move-result v0
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->each(I)Lcom/innioasis/y1/activity/IppActivity$Blocks;
    move-result-object v0
  .line 1154
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->access$300()I
    move-result v1
    new-array v2, v1, [Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;
  .line 1155
    const/4 v4, 0
  :L60
    if-ge v4, v1, :L61
    new-instance v6, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;
    invoke-direct { v6, v7, v5, v0 }, Lcom/innioasis/y1/activity/IppActivity$AlbumWorker;-><init>(Lcom/innioasis/y1/activity/IppActivity$CacheTask;Ljava/util/List;Lcom/innioasis/y1/activity/IppActivity$Blocks;)V
    aput-object v6, v2, v4
    add-int/lit8 v4, v4, 1
    goto :L60
  :L61
  .line 1156
    invoke-static { v2 }, Lcom/innioasis/y1/activity/IppActivity;->access$400([Ljava/lang/Runnable;)V
  .line 1157
    const/4 v0, 0
  :L62
    invoke-virtual { v5 }, Ljava/util/ArrayList;->size()I
    move-result v1
    if-ge v0, v1, :L65
  .line 1158
    invoke-virtual { v5, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;
  .line 1159
    iget-boolean v2, v1, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->artist:Z
    if-eqz v2, :L63
    iget-object v2, v1, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->key:Ljava/lang/String;
    iget-object v4, v1, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->gotArtist:Ljava/lang/String;
    invoke-static { v2, v4 }, Lcom/innioasis/ipp/AlbumArtist;->put(Ljava/lang/String;Ljava/lang/String;)V
  :L63
  .line 1160
    iget-boolean v2, v1, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->year:Z
    if-eqz v2, :L64
    iget-object v2, v1, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->key:Ljava/lang/String;
    iget-object v4, v1, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->gotYear:Ljava/lang/String;
    iget-object v1, v1, Lcom/innioasis/y1/activity/IppActivity$AlbumJob;->gotDate:Ljava/lang/String;
    invoke-static { v2, v4, v1 }, Lcom/innioasis/ipp/YearCache;->put(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
  :L64
  .line 1157
    add-int/lit8 v0, v0, 1
    goto :L62
  :L65
  .line 1162
    if-eqz v10, :L66
  .line 1163
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->flush()V
  .line 1166
    invoke-static { v3 }, Lcom/innioasis/ipp/YearCache;->warm(Ljava/util/List;)V
  :L66
  .line 1183
    if-eqz v11, :L75
    if-lez v12, :L75
  .line 1184
    new-instance v8, Ljava/util/ArrayList;
    invoke-direct { v8, v11 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  :L67
  .line 1186
    new-instance v0, Lcom/innioasis/y1/activity/IppActivity$ByPath;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Lcom/innioasis/y1/activity/IppActivity$ByPath;-><init>(Lcom/innioasis/y1/activity/IppActivity$1;)V
    invoke-static { v8, v0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  :L68
  .line 1189
    goto :L70
  :L69
  .line 1187
    move-exception v0
  :L70
  .line 1193
    invoke-static { }, Lcom/innioasis/ipp/DiscCache;->warm()V
  .line 1194
    invoke-static { v8 }, Lcom/innioasis/y1/activity/IppActivity$Blocks;->folders(Ljava/util/List;)Lcom/innioasis/y1/activity/IppActivity$Blocks;
    move-result-object v0
  .line 1195
    invoke-static { }, Lcom/innioasis/y1/activity/IppActivity;->access$300()I
    move-result v15
    new-array v6, v15, [Lcom/innioasis/y1/activity/IppActivity$SongWorker;
  .line 1196
    const/4 v5, 0
  :L71
    if-ge v5, v15, :L72
  .line 1197
    new-instance v16, Lcom/innioasis/y1/activity/IppActivity$SongWorker;
    move-object/from16 v1, v16
    move-object/from16 v2, p0
    move-object v3, v8
    move-object v4, v0
    move/from16 v17, v5
    move v5, v10
    move-object/from16 v18, v6
    move v6, v9
    invoke-direct/range { v1 .. v6 }, Lcom/innioasis/y1/activity/IppActivity$SongWorker;-><init>(Lcom/innioasis/y1/activity/IppActivity$CacheTask;Ljava/util/List;Lcom/innioasis/y1/activity/IppActivity$Blocks;ZZ)V
    aput-object v16, v18, v17
  .line 1196
    add-int/lit8 v5, v17, 1
    move-object/from16 v6, v18
    goto :L71
  :L72
  .line 1199
    move-object/from16 v18, v6
    invoke-static/range { v18 .. v18 }, Lcom/innioasis/y1/activity/IppActivity;->access$400([Ljava/lang/Runnable;)V
  .line 1200
    if-eqz v10, :L75
  .line 1204
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    invoke-static { v0 }, Lcom/innioasis/ipp/TrackCache;->sorted(Ljava/util/List;)Ljava/util/List;
  .line 1205
    const/4 v8, 0
  :L73
    if-ge v8, v15, :L74
    aget-object v0, v18, v8
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppActivity$SongWorker;->commit()V
    add-int/lit8 v8, v8, 1
    goto :L73
  :L74
  .line 1206
    invoke-static { }, Lcom/innioasis/ipp/DiscCache;->flush()V
  .line 1211
    invoke-static { v11 }, Lcom/innioasis/ipp/TrackCache;->sorted(Ljava/util/List;)Ljava/util/List;
  :L75
  .line 1215
    iget-object v0, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    iget v1, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->mask:I
    invoke-static { v0, v12, v13, v1 }, Lcom/innioasis/ipp/Albums;->noteCached(Landroid/content/Context;III)V
  :L76
  .line 1221
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->endCache()V
  :L77
    goto :L79
  :L78
    move-exception v0
  :L79
  .line 1222
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  :L80
    goto :L82
  :L81
    move-exception v0
  :L82
  .line 1223
    iget-object v0, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v0, v14 }, Lcom/innioasis/y1/activity/IppActivity;->cacheFinished(I)V
    goto :L92
  :L83
  .line 1216
    move-exception v0
    move v8, v14
    goto :L85
  :L84
    move-exception v0
    const/4 v8, 0
  :L85
  .line 1221
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->endCache()V
  :L86
    goto :L88
  :L87
    move-exception v0
  :L88
  .line 1222
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  :L89
    goto :L91
  :L90
    move-exception v0
  :L91
  .line 1223
    iget-object v0, v7, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v0, v8 }, Lcom/innioasis/y1/activity/IppActivity;->cacheFinished(I)V
  :L92
  .line 1224
    nop
  .line 1225
    return-void
.end method

.method tick()V
  .catchall { :L0 .. :L2 } :L3
  .catchall { :L4 .. :L5 } :L3
  .registers 5
  .line 1058
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->lock:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 1059
    iget v1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->progress:I
    add-int/lit8 v1, v1, 1
    iput v1, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->progress:I
  .line 1060
    iget v2, p0, Lcom/innioasis/y1/activity/IppActivity$CacheTask;->tickEvery:I
    rem-int v2, v1, v2
    if-eqz v2, :L1
    monitor-exit v0
    return-void
  :L1
  .line 1061
    monitor-exit v0
  :L2
  .line 1062
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
  .line 1063
    return-void
  :L3
  .line 1061
    move-exception v1
  :L4
    monitor-exit v0
  :L5
    throw v1
.end method
