.class final Lcom/innioasis/y1/activity/IppActivity$RescanTask;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "RescanTask"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppActivity;)V
  .registers 2
  .line 1172
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1173
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$RescanTask;->a:Lcom/innioasis/y1/activity/IppActivity;
  .line 1174
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L55
  .catchall { :L2 .. :L3 } :L4
  .catchall { :L7 .. :L8 } :L55
  .catchall { :L10 .. :L11 } :L52
  .catchall { :L12 .. :L13 } :L51
  .catchall { :L15 .. :L16 } :L50
  .catchall { :L18 .. :L21 } :L30
  .catchall { :L22 .. :L27 } :L37
  .catchall { :L32 .. :L34 } :L49
  .catchall { :L35 .. :L36 } :L37
  .catchall { :L40 .. :L41 } :L49
  .catchall { :L42 .. :L43 } :L48
  .catchall { :L44 .. :L45 } :L46
  .registers 28
  .line 1178
    move-object/from16 v1, p0
    const-string v2, " + invalidation "
    const-string v3, ", writes "
    const-string v4, " "
    const-string v5, " over the workers, slowest "
    const-string v6, ", reads "
    const-string v7, " ms: checks "
    const-string v8, " re-read, "
    const-string v9, " row(s), "
    const-string v10, "update library: "
  .line 1179
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v11
  .line 1180
    new-instance v13, Lcom/innioasis/y1/activity/IppActivity$Rescan;
    const/4 v0, 0
    invoke-direct { v13, v0 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;-><init>(Lcom/innioasis/y1/activity/IppActivity$1;)V
  .line 1181
    nop
  .line 1183
    const/4 v14, 0
  :L0
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 1184
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v15
  :L1
  .line 1185
    if-nez v15, :L6
  :L2
    invoke-virtual { v0, v14 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsSync(I)Ljava/util/List;
    move-result-object v15
  :L3
    goto :L6
  :L4
  .line 1223
    move-exception v0
    move-object v15, v3
    move-object v3, v5
    move-object v5, v4
    move-object v4, v2
  :L5
    const/4 v2, 0
    goto/16 :L56
  :L6
  .line 1186
    if-nez v15, :L7
    goto :L9
  :L7
    invoke-interface { v15 }, Ljava/util/List;->size()I
    move-result v16
  :L8
    move/from16 v14, v16
  :L9
  .line 1187
    move-object/from16 v16, v2
  :L10
    iget-object v2, v1, Lcom/innioasis/y1/activity/IppActivity$RescanTask;->a:Lcom/innioasis/y1/activity/IppActivity;
  :L11
    move-object/from16 v17, v3
    const v3, 2131821050
  :L12
    invoke-virtual { v2, v3 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object v2
  .line 1189
    iget-object v3, v1, Lcom/innioasis/y1/activity/IppActivity$RescanTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-static { v3 }, Lcom/innioasis/ipp/Meta;->libraryRead(Landroid/content/Context;)Z
    move-result v3
  :L13
    move-object/from16 v18, v4
    if-nez v3, :L14
    const/4 v3, 1
    goto :L15
  :L14
    const/4 v3, 0
  :L15
  .line 1190
    iget-object v4, v1, Lcom/innioasis/y1/activity/IppActivity$RescanTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v13, v4, v2, v14 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;->show(Lcom/innioasis/y1/activity/IppActivity;Ljava/lang/String;I)V
  :L16
  .line 1193
    const/4 v2, 0
    const/4 v4, 0
  :L17
    if-ge v2, v14, :L31
  :L18
  .line 1194
    invoke-interface { v15, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v19
    check-cast v19, Lcom/innioasis/y1/database/Song;
  .line 1195
    if-eqz v19, :L28
    invoke-virtual/range { v19 .. v19 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v20
    if-nez v20, :L19
    move-object/from16 v21, v5
    move-object/from16 v20, v15
    goto :L29
  :L19
  .line 1196
    and-int/lit8 v20, v2, 15
    if-nez v20, :L20
    invoke-virtual { v13, v2 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;->checked(I)V
  :L20
  .line 1197
    move-object/from16 v20, v15
    invoke-virtual/range { v19 .. v19 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v15
  :L21
  .line 1198
    move-object/from16 v21, v5
  :L22
    new-instance v5, Ljava/io/File;
    invoke-direct { v5, v15 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 1200
    invoke-virtual { v5 }, Ljava/io/File;->lastModified()J
    move-result-wide v22
  .line 1201
    const-wide/16 v24, 0
    cmp-long v26, v22, v24
    if-nez v26, :L23
    invoke-virtual { v5 }, Ljava/io/File;->exists()Z
    move-result v24
    if-nez v24, :L23
    goto :L29
  :L23
  .line 1205
    invoke-static { v15 }, Lcom/innioasis/ipp/Art;->coverChanged(Ljava/lang/String;)Z
    move-result v24
    if-eqz v24, :L24
  .line 1206
    invoke-static/range { v19 .. v19 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v24
    invoke-static/range { v24 .. v24 }, Lcom/innioasis/ipp/CoverCache;->forget(Ljava/lang/String;)V
  .line 1207
    invoke-static { v15 }, Lcom/innioasis/ipp/BigCover;->forget(Ljava/lang/String;)V
  .line 1208
    invoke-static { v15 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v24
    invoke-static/range { v24 .. v24 }, Lcom/innioasis/ipp/BigCover;->forget(Ljava/lang/String;)V
  .line 1209
    add-int/lit8 v4, v4, 1
  :L24
  .line 1212
    invoke-virtual/range { v19 .. v19 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide v24
    cmp-long v19, v22, v24
    if-nez v19, :L26
    if-eqz v3, :L25
    invoke-static { v15 }, Lcom/innioasis/ipp/Meta;->reread(Ljava/lang/String;)Z
    move-result v15
    if-nez v15, :L26
  :L25
    goto :L29
  :L26
  .line 1213
    invoke-virtual { v13, v5 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;->add(Ljava/io/File;)V
  :L27
    goto :L29
  :L28
  .line 1195
    move-object/from16 v21, v5
    move-object/from16 v20, v15
  :L29
  .line 1193
    add-int/lit8 v2, v2, 1
    move-object/from16 v15, v20
    move-object/from16 v5, v21
    goto :L17
  :L30
  .line 1223
    move-exception v0
    move v2, v4
    move-object v3, v5
    move-object/from16 v4, v16
    move-object/from16 v15, v17
    move-object/from16 v5, v18
    goto/16 :L56
  :L31
  .line 1215
    move-object/from16 v21, v5
  :L32
    invoke-virtual { v13 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;->close()V
  .line 1216
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    sub-long/2addr v2, v11
    iput-wide v2, v13, Lcom/innioasis/y1/activity/IppActivity$Rescan;->checkMs:J
  .line 1217
    invoke-virtual { v13, v14 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;->checked(I)V
  .line 1218
    invoke-virtual { v13, v0 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;->start(Lcom/innioasis/y1/database/Y1Repository;)V
  :L33
  .line 1219
    invoke-virtual { v13 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;->idle()Z
    move-result v2
  :L34
    if-nez v2, :L39
    const/4 v2, 0
  :L35
    invoke-virtual { v13, v0, v2 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;->write(Lcom/innioasis/y1/database/Y1Repository;Z)I
    move-result v3
  :L36
    add-int/2addr v4, v3
    goto :L33
  :L37
  .line 1223
    move-exception v0
    move v2, v4
  :L38
    move-object/from16 v4, v16
    move-object/from16 v15, v17
    move-object/from16 v5, v18
    move-object/from16 v3, v21
    goto/16 :L56
  :L39
  .line 1220
    const/4 v2, 1
  :L40
    invoke-virtual { v13, v0, v2 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;->write(Lcom/innioasis/y1/database/Y1Repository;Z)I
    move-result v0
  :L41
    add-int v2, v4, v0
  :L42
  .line 1222
    iget-boolean v0, v13, Lcom/innioasis/y1/activity/IppActivity$Rescan;->failed:Z
  :L43
    if-nez v0, :L47
  :L44
    iget-object v0, v1, Lcom/innioasis/y1/activity/IppActivity$RescanTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-static { v0 }, Lcom/innioasis/ipp/Meta;->noteLibraryRead(Landroid/content/Context;)V
  :L45
    goto :L47
  :L46
  .line 1223
    move-exception v0
    goto :L38
  :L47
  .line 1225
    invoke-virtual { v13 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;->close()V
  .line 1226
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  .line 1227
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v0, v10 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v14 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v9 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget v3, v13, Lcom/innioasis/y1/activity/IppActivity$Rescan;->built:I
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
  .line 1228
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
    sub-long/2addr v3, v11
    invoke-virtual { v0, v3, v4 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-wide v3, v13, Lcom/innioasis/y1/activity/IppActivity$Rescan;->checkMs:J
    invoke-virtual { v0, v3, v4 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-wide v3, v13, Lcom/innioasis/y1/activity/IppActivity$Rescan;->readMs:J
    invoke-virtual { v0, v3, v4 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    move-object/from16 v3, v21
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-wide v3, v13, Lcom/innioasis/y1/activity/IppActivity$Rescan;->slowMs:J
    invoke-virtual { v0, v3, v4 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    move-object/from16 v5, v18
    invoke-virtual { v0, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-object v3, v13, Lcom/innioasis/y1/activity/IppActivity$Rescan;->slowName:Ljava/lang/String;
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    move-object/from16 v15, v17
    invoke-virtual { v0, v15 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-wide v3, v13, Lcom/innioasis/y1/activity/IppActivity$Rescan;->insertMs:J
    invoke-virtual { v0, v3, v4 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    move-object/from16 v4, v16
    goto/16 :L57
  :L48
  .line 1223
    move-exception v0
    move-object/from16 v15, v17
    move-object/from16 v5, v18
    move-object/from16 v3, v21
    goto :L54
  :L49
    move-exception v0
    move-object/from16 v15, v17
    move-object/from16 v5, v18
    move-object/from16 v3, v21
    move v2, v4
    goto :L54
  :L50
    move-exception v0
    move-object v3, v5
    move-object/from16 v4, v16
    move-object/from16 v15, v17
    move-object/from16 v5, v18
    goto/16 :L5
  :L51
    move-exception v0
    move-object v3, v5
    move-object/from16 v15, v17
    goto :L53
  :L52
    move-exception v0
    move-object v15, v3
    move-object v3, v5
  :L53
    const/4 v2, 0
    move-object v5, v4
  :L54
    move-object/from16 v4, v16
    goto :L56
  :L55
    move-exception v0
    move-object v15, v3
    move-object v3, v5
    move-object v5, v4
    move-object v4, v2
    const/4 v2, 0
    const/4 v14, 0
  :L56
  .line 1225
    invoke-virtual { v13 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;->close()V
  .line 1226
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  .line 1227
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v0, v10 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v14 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v9 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget v9, v13, Lcom/innioasis/y1/activity/IppActivity$Rescan;->built:I
    invoke-virtual { v0, v9 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
  .line 1228
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v8
    sub-long/2addr v8, v11
    invoke-virtual { v0, v8, v9 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-wide v7, v13, Lcom/innioasis/y1/activity/IppActivity$Rescan;->checkMs:J
    invoke-virtual { v0, v7, v8 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-wide v6, v13, Lcom/innioasis/y1/activity/IppActivity$Rescan;->readMs:J
    invoke-virtual { v0, v6, v7 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-wide v6, v13, Lcom/innioasis/y1/activity/IppActivity$Rescan;->slowMs:J
    invoke-virtual { v0, v6, v7 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-object v3, v13, Lcom/innioasis/y1/activity/IppActivity$Rescan;->slowName:Ljava/lang/String;
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v15 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-wide v5, v13, Lcom/innioasis/y1/activity/IppActivity$Rescan;->insertMs:J
    invoke-virtual { v0, v5, v6 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
  :L57
    invoke-virtual { v0, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-wide v3, v13, Lcom/innioasis/y1/activity/IppActivity$Rescan;->dropMs:J
    invoke-virtual { v0, v3, v4 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
  .line 1227
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 1231
    iget-object v0, v1, Lcom/innioasis/y1/activity/IppActivity$RescanTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/activity/IppActivity;->scanFinished(I)V
  .line 1232
    nop
  .line 1233
    return-void
.end method
