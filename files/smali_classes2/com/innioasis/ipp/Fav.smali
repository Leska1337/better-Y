.class public final Lcom/innioasis/ipp/Fav;
.super Ljava/lang/Object;
.source "Fav.java"

.field final static UUID_STR:Ljava/lang/String; = "1e5f0a00-0000-4000-8000-000000000001"

.method public constructor <init>()V
  .registers 1
  .line 29
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static add(Landroid/content/Context;Ljava/lang/String;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 3
  .line 83
    if-nez p1, :L0
  .line 84
    return-void
  :L0
  .line 87
    invoke-static { p0 }, Lcom/innioasis/ipp/Fav;->ensure(Landroid/content/Context;)V
  .line 88
    invoke-static { }, Lcom/innioasis/ipp/Fav;->repo()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object p0
  .line 89
    if-nez p0, :L1
  .line 90
    return-void
  :L1
  .line 94
    new-instance v0, Ljava/io/File;
    invoke-direct { v0, p1 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-static { }, Lcom/innioasis/ipp/Fav;->favUuid()Ljava/util/UUID;
    move-result-object p1
    invoke-virtual { p0, v0, p1 }, Lcom/innioasis/y1/database/Y1Repository;->addToPlayListByFile(Ljava/io/File;Ljava/util/UUID;)V
  :L2
  .line 96
    goto :L4
  :L3
  .line 95
    move-exception p0
  :L4
  .line 97
    return-void
.end method

.method public static ensure(Landroid/content/Context;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 9
  :L0
  .line 61
    invoke-static { }, Lcom/innioasis/ipp/Fav;->repo()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 62
    if-nez v0, :L1
  .line 63
    return-void
  :L1
  .line 65
    invoke-static { }, Lcom/innioasis/ipp/Fav;->favUuid()Ljava/util/UUID;
    move-result-object v2
  .line 66
    invoke-virtual { v0, v2 }, Lcom/innioasis/y1/database/Y1Repository;->getPlaylistById(Ljava/util/UUID;)Lcom/innioasis/y1/database/Playlist;
    move-result-object v1
    if-eqz v1, :L2
  .line 67
    return-void
  :L2
  .line 69
    invoke-static { p0 }, Lcom/innioasis/ipp/Fav;->nameFor(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v3
  .line 75
    new-instance p0, Lcom/innioasis/y1/database/Playlist;
    invoke-virtual { v3 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object v4
  .line 76
    invoke-static { }, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v5
    const/4 v7, 0
    move-object v1, p0
    invoke-direct/range { v1 .. v7 }, Lcom/innioasis/y1/database/Playlist;-><init>(Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;JZ)V
  .line 75
    invoke-virtual { v0, p0 }, Lcom/innioasis/y1/database/Y1Repository;->addPlaylist(Lcom/innioasis/y1/database/Playlist;)V
  :L3
  .line 78
    goto :L5
  :L4
  .line 77
    move-exception p0
  :L5
  .line 79
    return-void
.end method

.method private static favUuid()Ljava/util/UUID;
  .registers 1
  .line 43
    const-string v0, "1e5f0a00-0000-4000-8000-000000000001"
    invoke-static { v0 }, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;
    move-result-object v0
    return-object v0
.end method

.method private static nameFor(Landroid/content/Context;)Ljava/lang/String;
  .registers 2
  .line 47
    const v0, 2131821035
    invoke-virtual { p0, v0 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static remove(Landroid/content/Context;Ljava/lang/String;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 3
  .line 101
    if-nez p1, :L0
  .line 102
    return-void
  :L0
  .line 105
    invoke-static { }, Lcom/innioasis/ipp/Fav;->repo()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object p0
  .line 106
    if-nez p0, :L1
  .line 107
    return-void
  :L1
  .line 109
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/database/Y1Repository;->getSongByPathSync(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object p1
  .line 110
    if-nez p1, :L2
  .line 111
    return-void
  :L2
  .line 113
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getSongId()Ljava/lang/String;
    move-result-object p1
    invoke-static { }, Lcom/innioasis/ipp/Fav;->favUuid()Ljava/util/UUID;
    move-result-object v0
    invoke-virtual { p0, p1, v0 }, Lcom/innioasis/y1/database/Y1Repository;->removeFromPlayList(Ljava/lang/String;Ljava/util/UUID;)V
  :L3
  .line 115
    goto :L5
  :L4
  .line 114
    move-exception p0
  :L5
  .line 116
    return-void
.end method

.method private static repo()Lcom/innioasis/y1/database/Y1Repository;
  .registers 1
  .line 32
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
    return-object v0
.end method

.method public static sync(Landroid/content/Context;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 4
  :L0
  .line 129
    invoke-static { }, Lcom/innioasis/ipp/Fav;->repo()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 130
    if-nez v0, :L1
  .line 131
    return-void
  :L1
  .line 133
    invoke-static { }, Lcom/innioasis/ipp/Fav;->favUuid()Ljava/util/UUID;
    move-result-object v1
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/database/Y1Repository;->getPlaylistById(Ljava/util/UUID;)Lcom/innioasis/y1/database/Playlist;
    move-result-object v1
  .line 134
    if-nez v1, :L2
  .line 135
    return-void
  :L2
  .line 137
    invoke-static { p0 }, Lcom/innioasis/ipp/Fav;->nameFor(Landroid/content/Context;)Ljava/lang/String;
    move-result-object p0
  .line 138
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Playlist;->getName()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { p0, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L3
  .line 139
    return-void
  :L3
  .line 141
    invoke-virtual { v1, p0 }, Lcom/innioasis/y1/database/Playlist;->setName(Ljava/lang/String;)V
  .line 142
    invoke-virtual { p0 }, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v1, p0 }, Lcom/innioasis/y1/database/Playlist;->setLowerName(Ljava/lang/String;)V
  .line 143
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/database/Y1Repository;->updatePlaylist(Lcom/innioasis/y1/database/Playlist;)V
  :L4
  .line 145
    goto :L6
  :L5
  .line 144
    move-exception p0
  :L6
  .line 146
    return-void
.end method
