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
  .line 1081
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1082
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$RescanTask;->a:Lcom/innioasis/y1/activity/IppActivity;
  .line 1083
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L3 } :L25
  .catchall { :L3 .. :L6 } :L24
  .catchall { :L8 .. :L19 } :L23
  .catchall { :L20 .. :L21 } :L22
  .registers 25
  .line 1087
    move-object/from16 v1, p0
    const-string v2, " ms"
    const-string v3, " re-read, "
    const-string v4, " row(s), "
    const-string v5, "update library: "
  .line 1088
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v6
  .line 1089
    new-instance v8, Lcom/innioasis/y1/activity/IppActivity$Rescan;
    const/4 v0, 0
    invoke-direct { v8, v0 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;-><init>(Lcom/innioasis/y1/activity/IppActivity$1;)V
  .line 1090
    nop
  .line 1092
    const/4 v9, 0
  :L0
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 1093
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v10
  .line 1094
    if-nez v10, :L1
    invoke-virtual { v0, v9 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsSync(I)Ljava/util/List;
    move-result-object v10
  :L1
  .line 1095
    if-nez v10, :L2
    const/4 v11, 0
    goto :L3
  :L2
    invoke-interface { v10 }, Ljava/util/List;->size()I
    move-result v11
  :L3
  .line 1096
    iget-object v12, v1, Lcom/innioasis/y1/activity/IppActivity$RescanTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    const v13, 2131821050
    invoke-virtual { v12, v13 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object v12
  .line 1098
    iget-object v13, v1, Lcom/innioasis/y1/activity/IppActivity$RescanTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-static { v13 }, Lcom/innioasis/ipp/Meta;->libraryRead(Landroid/content/Context;)Z
    move-result v13
    if-nez v13, :L4
    const/4 v13, 1
    goto :L5
  :L4
    const/4 v13, 0
  :L5
  .line 1099
    invoke-virtual { v8, v0 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;->start(Lcom/innioasis/y1/database/Y1Repository;)V
  :L6
  .line 1100
    const/4 v15, 0
    const/16 v16, 0
  :L7
    if-ge v15, v11, :L16
  :L8
  .line 1101
    invoke-interface { v10, v15 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v17
    check-cast v17, Lcom/innioasis/y1/database/Song;
  .line 1102
    if-eqz v17, :L15
    invoke-virtual/range { v17 .. v17 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v18
    if-nez v18, :L9
    goto :L15
  :L9
  .line 1103
    and-int/lit8 v18, v15, 15
    if-nez v18, :L10
    iget-object v14, v1, Lcom/innioasis/y1/activity/IppActivity$RescanTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v8, v15, v11 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;->percent(II)I
    move-result v9
    invoke-static { v12, v9 }, Lcom/innioasis/ipp/Loading;->percent(Ljava/lang/String;I)Ljava/lang/String;
    move-result-object v9
    invoke-virtual { v14, v9 }, Lcom/innioasis/y1/activity/IppActivity;->scanTick(Ljava/lang/String;)V
  :L10
  .line 1104
    invoke-virtual/range { v17 .. v17 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v9
  .line 1105
    new-instance v14, Ljava/io/File;
    invoke-direct { v14, v9 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 1107
    invoke-virtual { v14 }, Ljava/io/File;->lastModified()J
    move-result-wide v19
  .line 1108
    const-wide/16 v21, 0
    cmp-long v23, v19, v21
    if-nez v23, :L11
    invoke-virtual { v14 }, Ljava/io/File;->exists()Z
    move-result v21
    if-nez v21, :L11
    const/4 v9, 0
    goto :L15
  :L11
  .line 1112
    invoke-static { v9 }, Lcom/innioasis/ipp/Art;->coverChanged(Ljava/lang/String;)Z
    move-result v21
    if-eqz v21, :L12
  .line 1113
    invoke-static/range { v17 .. v17 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v21
    invoke-static/range { v21 .. v21 }, Lcom/innioasis/ipp/CoverCache;->forget(Ljava/lang/String;)V
  .line 1114
    invoke-static { v9 }, Lcom/innioasis/ipp/BigCover;->forget(Ljava/lang/String;)V
  .line 1115
    invoke-static { v9 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v21
    invoke-static/range { v21 .. v21 }, Lcom/innioasis/ipp/BigCover;->forget(Ljava/lang/String;)V
  .line 1116
    add-int/lit8 v16, v16, 1
  :L12
  .line 1119
    invoke-virtual/range { v17 .. v17 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide v21
    cmp-long v17, v19, v21
    if-nez v17, :L14
    if-eqz v13, :L13
    invoke-static { v9 }, Lcom/innioasis/ipp/Meta;->reread(Ljava/lang/String;)Z
    move-result v9
    if-nez v9, :L14
  :L13
  .line 1100
    const/4 v9, 0
    goto :L15
  :L14
  .line 1120
    invoke-virtual { v8, v14 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;->add(Ljava/io/File;)V
  .line 1121
    const/4 v9, 0
    invoke-virtual { v8, v0, v9 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;->write(Lcom/innioasis/y1/database/Y1Repository;Z)I
    move-result v14
    add-int v16, v16, v14
  :L15
  .line 1100
    add-int/lit8 v15, v15, 1
    goto :L7
  :L16
  .line 1123
    invoke-virtual { v8 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;->close()V
  :L17
  .line 1124
    invoke-virtual { v8 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;->idle()Z
    move-result v9
    if-nez v9, :L18
    iget-object v9, v1, Lcom/innioasis/y1/activity/IppActivity$RescanTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v8, v11, v11 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;->percent(II)I
    move-result v10
    invoke-static { v12, v10 }, Lcom/innioasis/ipp/Loading;->percent(Ljava/lang/String;I)Ljava/lang/String;
    move-result-object v10
    invoke-virtual { v9, v10 }, Lcom/innioasis/y1/activity/IppActivity;->scanTick(Ljava/lang/String;)V
    goto :L17
  :L18
  .line 1125
    const/4 v9, 1
    invoke-virtual { v8, v0, v9 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;->write(Lcom/innioasis/y1/database/Y1Repository;Z)I
    move-result v0
  :L19
    add-int v9, v16, v0
  :L20
  .line 1127
    iget-boolean v0, v8, Lcom/innioasis/y1/activity/IppActivity$Rescan;->failed:Z
    if-nez v0, :L21
    iget-object v0, v1, Lcom/innioasis/y1/activity/IppActivity$RescanTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-static { v0 }, Lcom/innioasis/ipp/Meta;->noteLibraryRead(Landroid/content/Context;)V
  :L21
  .line 1130
    invoke-virtual { v8 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;->close()V
  .line 1131
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  .line 1132
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v0, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v11 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget v4, v8, Lcom/innioasis/y1/activity/IppActivity$Rescan;->built:I
    invoke-virtual { v0, v4 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
  .line 1133
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
    sub-long/2addr v3, v6
    invoke-virtual { v0, v3, v4 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
  .line 1132
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 1134
    iget-object v0, v1, Lcom/innioasis/y1/activity/IppActivity$RescanTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v0, v9 }, Lcom/innioasis/y1/activity/IppActivity;->scanFinished(I)V
    goto :L28
  :L22
  .line 1128
    move-exception v0
    move v0, v9
    move v9, v11
    goto :L27
  :L23
    move-exception v0
    move v9, v11
    move/from16 v0, v16
    goto :L27
  :L24
    move-exception v0
    move v9, v11
    goto :L26
  :L25
    move-exception v0
  :L26
    const/4 v0, 0
  :L27
  .line 1130
    invoke-virtual { v8 }, Lcom/innioasis/y1/activity/IppActivity$Rescan;->close()V
  .line 1131
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  .line 1132
    new-instance v10, Ljava/lang/StringBuilder;
    invoke-direct { v10 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v10, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5, v9 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    iget v5, v8, Lcom/innioasis/y1/activity/IppActivity$Rescan;->built:I
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
  .line 1133
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
    sub-long/2addr v4, v6
    invoke-virtual { v3, v4, v5 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
  .line 1132
    invoke-static { v2 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 1134
    iget-object v2, v1, Lcom/innioasis/y1/activity/IppActivity$RescanTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v2, v0 }, Lcom/innioasis/y1/activity/IppActivity;->scanFinished(I)V
  :L28
  .line 1135
    nop
  .line 1136
    return-void
.end method
