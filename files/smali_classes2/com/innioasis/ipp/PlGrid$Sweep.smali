.class final Lcom/innioasis/ipp/PlGrid$Sweep;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "PlGrid.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/PlGrid;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Sweep"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 1261
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L7 } :L10
  .registers 8
  :L0
  .line 1264
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->dir()Ljava/io/File;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v0
  .line 1265
    if-eqz v0, :L9
    array-length v1, v0
    if-nez v1, :L1
    goto :L9
  :L1
  .line 1266
    new-instance v1, Ljava/util/HashSet;
    invoke-direct { v1 }, Ljava/util/HashSet;-><init>()V
  .line 1267
    const-string v2, "1e5f0a00-0000-4000-8000-000000000001"
    invoke-virtual { v1, v2 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  .line 1268
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->access$700()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v2
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Y1Repository;->getAllPlaylistSync()Ljava/util/List;
    move-result-object v2
  .line 1269
    if-nez v2, :L2
    return-void
  :L2
  .line 1270
    const/4 v3, 0
    const/4 v4, 0
  :L3
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v5
    if-ge v4, v5, :L5
  .line 1271
    invoke-interface { v2, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
  .line 1272
    instance-of v6, v5, Lcom/innioasis/y1/database/Playlist;
    if-eqz v6, :L4
    check-cast v5, Lcom/innioasis/y1/database/Playlist;
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Playlist;->getPlaylistId()Ljava/util/UUID;
    move-result-object v5
    invoke-static { v5 }, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v1, v5 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L4
  .line 1270
    add-int/lit8 v4, v4, 1
    goto :L3
  :L5
  .line 1274
    const/4 v2, 0
  :L6
    array-length v4, v0
    if-ge v2, v4, :L8
  .line 1275
    aget-object v4, v0, v2
    invoke-virtual { v4 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v4
  .line 1276
    const/16 v5, 46
    invoke-virtual { v4, v5 }, Ljava/lang/String;->indexOf(I)I
    move-result v5
  .line 1277
    if-lez v5, :L7
    invoke-virtual { v4, v3, v5 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v1, v4 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v4
    if-nez v4, :L7
    aget-object v4, v0, v2
    invoke-virtual { v4 }, Ljava/io/File;->delete()Z
  :L7
  .line 1274
    add-int/lit8 v2, v2, 1
    goto :L6
  :L8
  .line 1280
    goto :L11
  :L9
  .line 1265
    return-void
  :L10
  .line 1279
    move-exception v0
  :L11
  .line 1281
    return-void
.end method
