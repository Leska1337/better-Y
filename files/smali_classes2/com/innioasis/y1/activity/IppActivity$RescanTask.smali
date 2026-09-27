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
  .line 1065
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1066
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$RescanTask;->a:Lcom/innioasis/y1/activity/IppActivity;
  .line 1067
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L3 } :L17
  .catchall { :L5 .. :L15 } :L16
  .registers 16
  .line 1071
    nop
  .line 1073
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v1
  .line 1074
    invoke-virtual { v1, v0 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsSync(I)Ljava/util/List;
    move-result-object v2
  .line 1075
    if-nez v2, :L1
    const/4 v3, 0
    goto :L2
  :L1
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v3
  :L2
  .line 1076
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppActivity$RescanTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    const v5, 2131821050
    invoke-virtual { v4, v5 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object v4
  .line 1080
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppActivity$RescanTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-static { v5 }, Lcom/innioasis/ipp/Meta;->libraryRead(Landroid/content/Context;)Z
    move-result v5
  :L3
  .line 1081
    const/4 v6, 1
    xor-int/2addr v5, v6
    const/4 v7, 0
  :L4
    if-ge v0, v3, :L14
  :L5
  .line 1082
    invoke-interface { v2, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v8
    check-cast v8, Lcom/innioasis/y1/database/Song;
  .line 1083
    if-eqz v8, :L13
    invoke-virtual { v8 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v9
    if-nez v9, :L6
    goto/16 :L13
  :L6
  .line 1084
    and-int/lit8 v9, v0, 15
    if-nez v9, :L9
    iget-object v9, p0, Lcom/innioasis/y1/activity/IppActivity$RescanTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    new-instance v10, Ljava/lang/StringBuilder;
    invoke-direct { v10 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v10, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v10
    const-string v11, "  "
    invoke-virtual { v10, v11 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v10
    mul-int/lit8 v11, v0, 100
    if-nez v3, :L7
    const/4 v12, 1
    goto :L8
  :L7
    move v12, v3
  :L8
    div-int/2addr v11, v12
    invoke-virtual { v10, v11 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v10
    const-string v11, "%"
    invoke-virtual { v10, v11 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v10
    invoke-virtual { v10 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v10
    invoke-virtual { v9, v10 }, Lcom/innioasis/y1/activity/IppActivity;->scanTick(Ljava/lang/String;)V
  :L9
  .line 1085
    new-instance v9, Ljava/io/File;
    invoke-virtual { v8 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v10
    invoke-direct { v9, v10 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 1086
    invoke-virtual { v9 }, Ljava/io/File;->exists()Z
    move-result v10
    if-nez v10, :L10
    goto :L13
  :L10
  .line 1094
    invoke-virtual { v8 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v10
    invoke-static { v10 }, Lcom/innioasis/ipp/Art;->coverState(Ljava/lang/String;)I
    move-result v10
  .line 1095
    if-eqz v10, :L11
  .line 1096
    invoke-static { v8 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v11
    invoke-static { v11 }, Lcom/innioasis/ipp/CoverCache;->forget(Ljava/lang/String;)V
  .line 1097
    invoke-virtual { v8 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v11
    invoke-static { v11 }, Lcom/innioasis/ipp/BigCover;->forget(Ljava/lang/String;)V
  .line 1098
    invoke-virtual { v8 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v11
    invoke-static { v11 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v11
    invoke-static { v11 }, Lcom/innioasis/ipp/BigCover;->forget(Ljava/lang/String;)V
  .line 1099
    const/4 v11, 2
    if-ne v10, v11, :L11
    add-int/lit8 v7, v7, 1
  :L11
  .line 1107
    invoke-virtual { v9 }, Ljava/io/File;->lastModified()J
    move-result-wide v10
    invoke-virtual { v8 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide v12
    cmp-long v14, v10, v12
    if-nez v14, :L12
    if-eqz v5, :L13
  .line 1108
    invoke-virtual { v8 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v8
    invoke-static { v8 }, Lcom/innioasis/ipp/Meta;->oversized(Ljava/lang/String;)Z
    move-result v8
    if-nez v8, :L12
    goto :L13
  :L12
  .line 1109
    invoke-virtual { v1, v9 }, Lcom/innioasis/y1/database/Y1Repository;->ippReplaceSong(Ljava/io/File;)V
  .line 1110
    add-int/lit8 v7, v7, 1
  :L13
  .line 1081
    add-int/lit8 v0, v0, 1
    goto/16 :L4
  :L14
  .line 1112
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$RescanTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-static { v0 }, Lcom/innioasis/ipp/Meta;->noteLibraryRead(Landroid/content/Context;)V
  :L15
  .line 1116
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  .line 1117
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$RescanTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v0, v7 }, Lcom/innioasis/y1/activity/IppActivity;->scanFinished(I)V
    goto :L19
  :L16
  .line 1113
    move-exception v0
    move v0, v7
    goto :L18
  :L17
    move-exception v1
  :L18
  .line 1116
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  .line 1117
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity$RescanTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v1, v0 }, Lcom/innioasis/y1/activity/IppActivity;->scanFinished(I)V
  :L19
  .line 1118
    nop
  .line 1119
    return-void
.end method
