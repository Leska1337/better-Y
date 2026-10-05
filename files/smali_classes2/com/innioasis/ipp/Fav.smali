.class public final Lcom/innioasis/ipp/Fav;
.super Ljava/lang/Object;
.source "Fav.java"

.field final static UUID_STR:Ljava/lang/String; = "1e5f0a00-0000-4000-8000-000000000001"

.method public constructor <init>()V
  .registers 1
  .line 19
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static add(Landroid/content/Context;Ljava/lang/String;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 3
  .line 59
    if-nez p1, :L0
  .line 60
    return-void
  :L0
  .line 63
    invoke-static { p0 }, Lcom/innioasis/ipp/Fav;->ensure(Landroid/content/Context;)V
  .line 64
    invoke-static { }, Lcom/innioasis/ipp/Fav;->repo()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object p0
  .line 65
    if-nez p0, :L1
  .line 66
    return-void
  :L1
  .line 69
    new-instance v0, Ljava/io/File;
    invoke-direct { v0, p1 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-static { }, Lcom/innioasis/ipp/Fav;->favUuid()Ljava/util/UUID;
    move-result-object p1
    invoke-virtual { p0, v0, p1 }, Lcom/innioasis/y1/database/Y1Repository;->addToPlayListByFile(Ljava/io/File;Ljava/util/UUID;)V
  :L2
  .line 71
    goto :L4
  :L3
  .line 70
    move-exception p0
  :L4
  .line 72
    return-void
.end method

.method public static ensure(Landroid/content/Context;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 9
  :L0
  .line 42
    invoke-static { }, Lcom/innioasis/ipp/Fav;->repo()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 43
    if-nez v0, :L1
  .line 44
    return-void
  :L1
  .line 46
    invoke-static { }, Lcom/innioasis/ipp/Fav;->favUuid()Ljava/util/UUID;
    move-result-object v2
  .line 47
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/database/Y1Repository;->getPlaylistById(Ljava/util/UUID;)Lcom/innioasis/y1/database/Playlist;
    move-result-object v1
    if-eqz v1, :L2
  .line 48
    return-void
  :L2
  .line 50
    invoke-static { p0 }, Lcom/innioasis/ipp/Fav;->nameFor(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v3
  .line 52
    new-instance p0, Lcom/innioasis/y1/database/Playlist;
    invoke-virtual { v3 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object v4
  .line 53
    invoke-static { }, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v5
    const/4 v7, 0
    move-object v1, p0
    invoke-direct/range { v1 .. v7 }, Lcom/innioasis/y1/database/Playlist;-><init>(Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;JZ)V
  .line 52
    invoke-virtual { v0, p0 }, Lcom/innioasis/y1/database/Y1Repository;->addPlaylist(Lcom/innioasis/y1/database/Playlist;)V
  :L3
  .line 55
    goto :L5
  :L4
  .line 54
    move-exception p0
  :L5
  .line 56
    return-void
.end method

.method private static favUuid()Ljava/util/UUID;
  .registers 1
  .line 29
    const-string v0, "1e5f0a00-0000-4000-8000-000000000001"
    invoke-static { v0 }, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;
    move-result-object v0
    return-object v0
.end method

.method private static nameFor(Landroid/content/Context;)Ljava/lang/String;
  .registers 2
  .line 33
    const v0, 2131821035
    invoke-virtual { p0, v0 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static remove(Landroid/content/Context;Ljava/lang/String;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 3
  .line 75
    if-nez p1, :L0
  .line 76
    return-void
  :L0
  .line 79
    invoke-static { }, Lcom/innioasis/ipp/Fav;->repo()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object p0
  .line 80
    if-nez p0, :L1
  .line 81
    return-void
  :L1
  .line 83
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/database/Y1Repository;->getSongByPathSync(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object p1
  .line 84
    if-nez p1, :L2
  .line 85
    return-void
  :L2
  .line 87
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getSongId()Ljava/lang/String;
    move-result-object p1
    invoke-static { }, Lcom/innioasis/ipp/Fav;->favUuid()Ljava/util/UUID;
    move-result-object v0
    invoke-virtual { p0, p1, v0 }, Lcom/innioasis/y1/database/Y1Repository;->removeFromPlayList(Ljava/lang/String;Ljava/util/UUID;)V
  :L3
  .line 89
    goto :L5
  :L4
  .line 88
    move-exception p0
  :L5
  .line 90
    return-void
.end method

.method private static repo()Lcom/innioasis/y1/database/Y1Repository;
  .registers 1
  .line 22
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
    return-object v0
.end method

.method public static sync(Landroid/content/Context;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 4
  :L0
  .line 98
    invoke-static { }, Lcom/innioasis/ipp/Fav;->repo()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 99
    if-nez v0, :L1
  .line 100
    return-void
  :L1
  .line 102
    invoke-static { }, Lcom/innioasis/ipp/Fav;->favUuid()Ljava/util/UUID;
    move-result-object v1
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/database/Y1Repository;->getPlaylistById(Ljava/util/UUID;)Lcom/innioasis/y1/database/Playlist;
    move-result-object v1
  .line 103
    if-nez v1, :L2
  .line 104
    return-void
  :L2
  .line 106
    invoke-static { p0 }, Lcom/innioasis/ipp/Fav;->nameFor(Landroid/content/Context;)Ljava/lang/String;
    move-result-object p0
  .line 107
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Playlist;->getName()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { p0, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L3
  .line 108
    return-void
  :L3
  .line 110
    invoke-virtual { v1, p0 }, Lcom/innioasis/y1/database/Playlist;->setName(Ljava/lang/String;)V
  .line 111
    invoke-virtual { p0 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v1, p0 }, Lcom/innioasis/y1/database/Playlist;->setLowerName(Ljava/lang/String;)V
  .line 112
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/database/Y1Repository;->updatePlaylist(Lcom/innioasis/y1/database/Playlist;)V
  :L4
  .line 114
    goto :L6
  :L5
  .line 113
    move-exception p0
  :L6
  .line 115
    return-void
.end method
