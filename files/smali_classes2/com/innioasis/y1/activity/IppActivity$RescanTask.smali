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
  .line 929
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 930
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppActivity$RescanTask;->a:Lcom/innioasis/y1/activity/IppActivity;
  .line 931
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L3 } :L17
  .catchall { :L5 .. :L13 } :L15
  .registers 13
  .line 935
    nop
  .line 937
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v1
  .line 938
    invoke-virtual { v1, v0 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsSync(I)Ljava/util/List;
    move-result-object v2
  .line 939
    if-nez v2, :L1
    const/4 v3, 0
    goto :L2
  :L1
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v3
  :L2
  .line 940
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppActivity$RescanTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    const v5, 2131821050
    invoke-virtual { v4, v5 }, Lcom/innioasis/y1/activity/IppActivity;->getString(I)Ljava/lang/String;
    move-result-object v4
  :L3
  .line 941
    const/4 v5, 0
  :L4
    if-ge v0, v3, :L16
  :L5
  .line 942
    invoke-interface { v2, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lcom/innioasis/y1/database/Song;
  .line 943
    if-eqz v6, :L14
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v7
    if-nez v7, :L6
    goto/16 :L14
  :L6
  .line 944
    and-int/lit8 v7, v0, 15
    if-nez v7, :L9
    iget-object v7, p0, Lcom/innioasis/y1/activity/IppActivity$RescanTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    new-instance v8, Ljava/lang/StringBuilder;
    invoke-direct { v8 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v8, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v8
    const-string v9, "  "
    invoke-virtual { v8, v9 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v8
    mul-int/lit8 v9, v0, 100
    if-nez v3, :L7
    const/4 v10, 1
    goto :L8
  :L7
    move v10, v3
  :L8
    div-int/2addr v9, v10
    invoke-virtual { v8, v9 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v8
    const-string v9, "%"
    invoke-virtual { v8, v9 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v8
    invoke-virtual { v8 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v8
    invoke-virtual { v7, v8 }, Lcom/innioasis/y1/activity/IppActivity;->scanTick(Ljava/lang/String;)V
  :L9
  .line 945
    new-instance v7, Ljava/io/File;
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v8
    invoke-direct { v7, v8 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 946
    invoke-virtual { v7 }, Ljava/io/File;->exists()Z
    move-result v8
    if-nez v8, :L10
    goto :L14
  :L10
  .line 954
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v8
    invoke-static { v8 }, Lcom/innioasis/ipp/Art;->coverState(Ljava/lang/String;)I
    move-result v8
  .line 955
    if-eqz v8, :L11
  .line 956
    invoke-static { v6 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v9
    invoke-static { v9 }, Lcom/innioasis/ipp/CoverCache;->forget(Ljava/lang/String;)V
  .line 957
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v9
    invoke-static { v9 }, Lcom/innioasis/ipp/BigCover;->forget(Ljava/lang/String;)V
  .line 958
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v9
    invoke-static { v9 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v9
    invoke-static { v9 }, Lcom/innioasis/ipp/BigCover;->forget(Ljava/lang/String;)V
  .line 959
    const/4 v9, 2
    if-ne v8, v9, :L11
    add-int/lit8 v5, v5, 1
  :L11
  .line 962
    invoke-virtual { v7 }, Ljava/io/File;->lastModified()J
    move-result-wide v8
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getFileDate()J
    move-result-wide v10
    cmp-long v6, v8, v10
    if-nez v6, :L12
    goto :L14
  :L12
  .line 963
    invoke-virtual { v1, v7 }, Lcom/innioasis/y1/database/Y1Repository;->ippReplaceSong(Ljava/io/File;)V
  :L13
  .line 964
    add-int/lit8 v5, v5, 1
  :L14
  .line 941
    add-int/lit8 v0, v0, 1
    goto/16 :L4
  :L15
  .line 966
    move-exception v0
    move v0, v5
    goto :L18
  :L16
  .line 969
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  .line 970
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppActivity$RescanTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v0, v5 }, Lcom/innioasis/y1/activity/IppActivity;->scanFinished(I)V
    goto :L19
  :L17
  .line 966
    move-exception v1
  :L18
  .line 969
    invoke-static { }, Lcom/innioasis/ipp/Art;->flushStamps()V
  .line 970
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppActivity$RescanTask;->a:Lcom/innioasis/y1/activity/IppActivity;
    invoke-virtual { v1, v0 }, Lcom/innioasis/y1/activity/IppActivity;->scanFinished(I)V
  :L19
  .line 971
    nop
  .line 972
    return-void
.end method
