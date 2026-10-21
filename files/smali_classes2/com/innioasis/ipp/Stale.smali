.class public final Lcom/innioasis/ipp/Stale;
.super Ljava/lang/Object;
.source "Stale.java"

.method private constructor <init>()V
  .registers 1
  .line 19
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static add(Ljava/util/List;Ljava/util/Set;Ljava/util/Set;Ljava/util/Set;)V
  .registers 7
  .line 58
    if-nez p0, :L0
    return-void
  :L0
  .line 59
    const/4 v0, 0
  :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L7
  .line 60
    invoke-interface { p0, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
  .line 61
    instance-of v2, v1, Lcom/innioasis/y1/database/Song;
    if-nez v2, :L2
    goto :L6
  :L2
  .line 62
    check-cast v1, Lcom/innioasis/y1/database/Song;
  .line 63
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v2
  .line 64
    if-nez v2, :L3
    goto :L6
  :L3
  .line 65
    invoke-interface { p1, v2 }, Ljava/util/Set;->add(Ljava/lang/Object;)Z
  .line 66
    invoke-static { v2 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-interface { p2, v2 }, Ljava/util/Set;->add(Ljava/lang/Object;)Z
  .line 67
    invoke-static { v1 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v2
    invoke-interface { p3, v2 }, Ljava/util/Set;->add(Ljava/lang/Object;)Z
  .line 68
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v2
    if-nez v2, :L4
    const-string v1, ""
    goto :L5
  :L4
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v1
  :L5
    invoke-interface { p3, v1 }, Ljava/util/Set;->add(Ljava/lang/Object;)Z
  :L6
  .line 59
    add-int/lit8 v0, v0, 1
    goto :L1
  :L7
  .line 70
    return-void
.end method

.method static clear()V
  .registers 1
  .line 27
    const/4 v0, 1
    invoke-static { v0 }, Lcom/innioasis/ipp/Stale;->run(Z)J
  .line 28
    return-void
.end method

.method static files(Ljava/io/File;Ljava/util/Set;Z)J
  .registers 8
  .line 74
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    invoke-virtual { p0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object p0
  :L1
  .line 75
    const-wide/16 v0, 0
    if-nez p0, :L2
    return-wide v0
  :L2
  .line 76
    nop
  .line 77
    const/4 v2, 0
  :L3
    array-length v3, p0
    if-ge v2, v3, :L6
  .line 78
    aget-object v3, p0, v2
    invoke-virtual { v3 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v3
    invoke-interface { p1, v3 }, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L4
    goto :L5
  :L4
  .line 79
    aget-object v3, p0, v2
    invoke-virtual { v3 }, Ljava/io/File;->length()J
    move-result-wide v3
    add-long/2addr v0, v3
  .line 80
    if-eqz p2, :L5
    aget-object v3, p0, v2
    invoke-virtual { v3 }, Ljava/io/File;->delete()Z
  :L5
  .line 77
    add-int/lit8 v2, v2, 1
    goto :L3
  :L6
  .line 82
    return-wide v0
.end method

.method static line(Ljava/lang/String;Ljava/lang/String;)J
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  :L0
  .line 88
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, "\t"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, "\n"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    const-string v1, "UTF-8"
    invoke-virtual { v0, v1 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object v0
    array-length p0, v0
  :L1
    int-to-long p0, p0
    return-wide p0
  :L2
  .line 89
    move-exception v0
  .line 90
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result p0
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result p1
    add-int/2addr p0, p1
    add-int/lit8 p0, p0, 2
    int-to-long p0, p0
    return-wide p0
.end method

.method private static run(Z)J
  .catchall { :L1 .. :L2 } :L21
  .catchall { :L5 .. :L6 } :L7
  .catchall { :L8 .. :L9 } :L10
  .catchall { :L11 .. :L12 } :L13
  .catchall { :L14 .. :L15 } :L16
  .catchall { :L17 .. :L18 } :L19
  .registers 10
  .line 31
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 33
    const-wide/16 v1, 0
    if-eqz v0, :L22
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v3
    if-eqz v3, :L0
    goto :L22
  :L0
  .line 34
    nop
  :L1
  .line 36
    sget-object v3, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v3 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v3
  .line 37
    if-eqz v3, :L3
    const/4 v4, 1
    invoke-virtual { v3, v4 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsSync(I)Ljava/util/List;
    move-result-object v3
  :L2
    goto :L4
  :L3
    const/4 v3, 0
  :L4
  .line 40
    nop
  .line 41
    new-instance v4, Ljava/util/HashSet;
    invoke-direct { v4 }, Ljava/util/HashSet;-><init>()V
  .line 42
    new-instance v5, Ljava/util/HashSet;
    invoke-direct { v5 }, Ljava/util/HashSet;-><init>()V
  .line 43
    new-instance v6, Ljava/util/HashSet;
    invoke-direct { v6 }, Ljava/util/HashSet;-><init>()V
  .line 44
    invoke-static { v0, v4, v5, v6 }, Lcom/innioasis/ipp/Stale;->add(Ljava/util/List;Ljava/util/Set;Ljava/util/Set;Ljava/util/Set;)V
  .line 45
    invoke-static { v3, v4, v5, v6 }, Lcom/innioasis/ipp/Stale;->add(Ljava/util/List;Ljava/util/Set;Ljava/util/Set;Ljava/util/Set;)V
  .line 47
    nop
  :L5
  .line 48
    invoke-static { v6, p0 }, Lcom/innioasis/ipp/CoverCache;->prune(Ljava/util/Set;Z)J
    move-result-wide v7
  :L6
    add-long/2addr v1, v7
    goto :L8
  :L7
    move-exception v0
  :L8
  .line 49
    invoke-static { v4, v5, p0 }, Lcom/innioasis/ipp/BigCover;->prune(Ljava/util/Set;Ljava/util/Set;Z)J
    move-result-wide v7
  :L9
    add-long/2addr v1, v7
    goto :L11
  :L10
    move-exception v0
  :L11
  .line 50
    invoke-static { v4, p0 }, Lcom/innioasis/ipp/FlowCache;->prune(Ljava/util/Set;Z)J
    move-result-wide v7
  :L12
    add-long/2addr v1, v7
    goto :L14
  :L13
    move-exception v0
  :L14
  .line 51
    invoke-static { v5, p0 }, Lcom/innioasis/ipp/Art;->prune(Ljava/util/Set;Z)J
    move-result-wide v7
  :L15
    add-long/2addr v1, v7
    goto :L17
  :L16
    move-exception v0
  :L17
  .line 52
    invoke-static { v6, v4, p0 }, Lcom/innioasis/ipp/AlbumInfo;->prune(Ljava/util/Set;Ljava/util/Set;Z)J
    move-result-wide v3
  :L18
    add-long/2addr v1, v3
    goto :L20
  :L19
    move-exception p0
  :L20
  .line 53
    return-wide v1
  :L21
  .line 38
    move-exception p0
  .line 39
    return-wide v1
  :L22
  .line 33
    return-wide v1
.end method

.method static size()J
  .registers 2
  .line 23
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Stale;->run(Z)J
    move-result-wide v0
    return-wide v0
.end method
