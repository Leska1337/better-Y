.class public final Lcom/innioasis/ipp/Stale;
.super Ljava/lang/Object;
.source "Stale.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Stale$Need;,
    Lcom/innioasis/ipp/Stale$Keys;
  }
.end annotation

.method private constructor <init>()V
  .registers 1
  .line 23
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static clear()V
  .registers 1
  .line 31
    const/4 v0, 1
    invoke-static { v0 }, Lcom/innioasis/ipp/Stale;->run(Z)J
  .line 32
    return-void
.end method

.method static files(Ljava/io/File;Lcom/innioasis/ipp/Stale$Keys;Ljava/lang/String;ZZ)J
  .registers 10
  .line 152
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    invoke-virtual { p0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object p0
  :L1
  .line 153
    const-wide/16 v0, 0
    if-nez p0, :L2
    return-wide v0
  :L2
  .line 154
    nop
  .line 155
    const/4 v2, 0
  :L3
    array-length v3, p0
    if-ge v2, v3, :L6
  .line 156
    aget-object v3, p0, v2
    invoke-virtual { v3 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v3
    invoke-static { v3, p2, p3 }, Lcom/innioasis/ipp/Stale;->key(Ljava/lang/String;Ljava/lang/String;Z)J
    move-result-wide v3
    invoke-virtual { p1, v3, v4 }, Lcom/innioasis/ipp/Stale$Keys;->has(J)Z
    move-result v3
    if-eqz v3, :L4
    goto :L5
  :L4
  .line 157
    aget-object v3, p0, v2
    invoke-virtual { v3 }, Ljava/io/File;->length()J
    move-result-wide v3
    add-long/2addr v0, v3
  .line 158
    if-eqz p4, :L5
    aget-object v3, p0, v2
    invoke-virtual { v3 }, Ljava/io/File;->delete()Z
  :L5
  .line 155
    add-int/lit8 v2, v2, 1
    goto :L3
  :L6
  .line 160
    return-wide v0
.end method

.method static files(Ljava/io/File;Ljava/util/Set;Z)J
  .registers 8
  .line 181
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    invoke-virtual { p0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object p0
  :L1
  .line 182
    const-wide/16 v0, 0
    if-nez p0, :L2
    return-wide v0
  :L2
  .line 183
    nop
  .line 184
    const/4 v2, 0
  :L3
    array-length v3, p0
    if-ge v2, v3, :L6
  .line 185
    aget-object v3, p0, v2
    invoke-virtual { v3 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v3
    invoke-interface { p1, v3 }, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L4
    goto :L5
  :L4
  .line 186
    aget-object v3, p0, v2
    invoke-virtual { v3 }, Ljava/io/File;->length()J
    move-result-wide v3
    add-long/2addr v0, v3
  .line 187
    if-eqz p2, :L5
    aget-object v3, p0, v2
    invoke-virtual { v3 }, Ljava/io/File;->delete()Z
  :L5
  .line 184
    add-int/lit8 v2, v2, 1
    goto :L3
  :L6
  .line 189
    return-wide v0
.end method

.method private static key(Ljava/lang/String;Ljava/lang/String;Z)J
  .catchall { :L0 .. :L4 } :L6
  .registers 10
  .line 166
    const-wide v0, 9223372036854775807L
  :L0
    invoke-virtual { p0, p1 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v2
    if-nez v2, :L1
    return-wide v0
  :L1
  .line 167
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v2
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result p1
    sub-int/2addr v2, p1
  .line 168
    const/16 p1, 45
    invoke-virtual { p0, p1 }, Ljava/lang/String;->indexOf(I)I
    move-result p1
  .line 169
    if-lez p1, :L5
    if-lt p1, v2, :L2
    goto :L5
  :L2
  .line 170
    const/4 v3, 0
    invoke-virtual { p0, v3, p1 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v3
    const/16 v4, 16
    invoke-static { v3, v4 }, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J
    move-result-wide v5
    long-to-int v3, v5
  .line 171
    add-int/lit8 p1, p1, 1
    invoke-virtual { p0, p1, v2 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object p0
  .line 172
    if-eqz p2, :L3
    invoke-static { p0, v4 }, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J
    move-result-wide p0
    long-to-int p1, p0
    goto :L4
  :L3
    invoke-static { p0 }, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    move-result p1
  :L4
  .line 173
    int-to-long v0, v3
    const/16 p0, 32
    shl-long/2addr v0, p0
    int-to-long p0, p1
    const-wide v2, 4294967295L
    and-long/2addr p0, v2
    or-long/2addr p0, v0
    return-wide p0
  :L5
  .line 169
    return-wide v0
  :L6
  .line 174
    move-exception p0
  .line 175
    return-wide v0
.end method

.method static line(Ljava/lang/String;Ljava/lang/String;)J
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  :L0
  .line 195
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
  .line 196
    move-exception v0
  .line 197
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
  .catchall { :L1 .. :L2 } :L29
  .catchall { :L9 .. :L10 } :L11
  .catchall { :L13 .. :L14 } :L15
  .catchall { :L17 .. :L18 } :L19
  .catchall { :L21 .. :L22 } :L23
  .catchall { :L25 .. :L26 } :L27
  .registers 9
  .line 35
    const-string v0, "stale"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->b(Ljava/lang/String;)V
  .line 36
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v0
  .line 38
    const-wide/16 v1, 0
    if-eqz v0, :L30
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v3
    if-eqz v3, :L0
    goto/16 :L30
  :L0
  .line 39
    nop
  :L1
  .line 41
    sget-object v3, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v3 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v3
  .line 42
    const/4 v4, 0
    const/4 v5, 1
    if-eqz v3, :L3
    invoke-virtual { v3, v5 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsSync(I)Ljava/util/List;
    move-result-object v3
  :L2
    goto :L4
  :L3
    move-object v3, v4
  :L4
  .line 45
    nop
  .line 46
    new-instance v6, Lcom/innioasis/ipp/Stale$Need;
    invoke-direct { v6, v4 }, Lcom/innioasis/ipp/Stale$Need;-><init>(Lcom/innioasis/ipp/Stale$1;)V
  .line 49
    invoke-static { v0 }, Lcom/innioasis/ipp/Albums;->albumSongsOf(Ljava/util/List;)Ljava/util/HashMap;
    move-result-object v4
  .line 50
    if-eqz v4, :L7
  .line 51
    iget-object v0, v6, Lcom/innioasis/ipp/Stale$Need;->albums:Ljava/util/HashSet;
    invoke-virtual { v4 }, Ljava/util/HashMap;->keySet()Ljava/util/Set;
    move-result-object v7
    invoke-virtual { v0, v7 }, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z
  .line 52
    invoke-virtual { v4 }, Ljava/util/HashMap;->values()Ljava/util/Collection;
    move-result-object v0
    invoke-interface { v0 }, Ljava/util/Collection;->iterator()Ljava/util/Iterator;
    move-result-object v0
  :L5
  .line 53
    invoke-interface { v0 }, Ljava/util/Iterator;->hasNext()Z
    move-result v4
    if-eqz v4, :L6
    invoke-interface { v0 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/util/List;
    const/4 v7, 0
    invoke-virtual { v6, v4, v7 }, Lcom/innioasis/ipp/Stale$Need;->addAll(Ljava/util/List;Z)V
    goto :L5
  :L6
  .line 54
    goto :L8
  :L7
  .line 55
    invoke-virtual { v6, v0, v5 }, Lcom/innioasis/ipp/Stale$Need;->addAll(Ljava/util/List;Z)V
  :L8
  .line 57
    invoke-virtual { v6, v3, v5 }, Lcom/innioasis/ipp/Stale$Need;->addAll(Ljava/util/List;Z)V
  .line 58
    iget-object v0, v6, Lcom/innioasis/ipp/Stale$Need;->big:Lcom/innioasis/ipp/Stale$Keys;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Stale$Keys;->seal()V
  .line 59
    iget-object v0, v6, Lcom/innioasis/ipp/Stale$Need;->flow:Lcom/innioasis/ipp/Stale$Keys;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Stale$Keys;->seal()V
  .line 60
    const-string v0, "library"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->s(Ljava/lang/String;)V
  .line 62
    nop
  :L9
  .line 63
    iget-object v0, v6, Lcom/innioasis/ipp/Stale$Need;->albums:Ljava/util/HashSet;
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/CoverCache;->prune(Ljava/util/Set;Z)J
    move-result-wide v3
  :L10
    add-long/2addr v1, v3
    goto :L12
  :L11
    move-exception v0
  :L12
  .line 64
    const-string v0, "covers"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->s(Ljava/lang/String;)V
  :L13
  .line 65
    iget-object v0, v6, Lcom/innioasis/ipp/Stale$Need;->big:Lcom/innioasis/ipp/Stale$Keys;
    iget-object v3, v6, Lcom/innioasis/ipp/Stale$Need;->folders:Ljava/util/HashSet;
    invoke-static { v0, v3, p0 }, Lcom/innioasis/ipp/BigCover;->prune(Lcom/innioasis/ipp/Stale$Keys;Ljava/util/Set;Z)J
    move-result-wide v3
  :L14
    add-long/2addr v1, v3
    goto :L16
  :L15
    move-exception v0
  :L16
  .line 66
    const-string v0, "big"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->s(Ljava/lang/String;)V
  :L17
  .line 67
    iget-object v0, v6, Lcom/innioasis/ipp/Stale$Need;->flow:Lcom/innioasis/ipp/Stale$Keys;
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/FlowCache;->prune(Lcom/innioasis/ipp/Stale$Keys;Z)J
    move-result-wide v3
  :L18
    add-long/2addr v1, v3
    goto :L20
  :L19
    move-exception v0
  :L20
  .line 68
    const-string v0, "flow"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->s(Ljava/lang/String;)V
  :L21
  .line 69
    iget-object v0, v6, Lcom/innioasis/ipp/Stale$Need;->folders:Ljava/util/HashSet;
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Art;->prune(Ljava/util/Set;Z)J
    move-result-wide v3
  :L22
    add-long/2addr v1, v3
    goto :L24
  :L23
    move-exception v0
  :L24
  .line 70
    const-string v0, "art"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->s(Ljava/lang/String;)V
  :L25
  .line 71
    iget-object v0, v6, Lcom/innioasis/ipp/Stale$Need;->albums:Ljava/util/HashSet;
    iget-object v3, v6, Lcom/innioasis/ipp/Stale$Need;->big:Lcom/innioasis/ipp/Stale$Keys;
    invoke-static { v0, v3, p0 }, Lcom/innioasis/ipp/AlbumInfo;->prune(Ljava/util/Set;Lcom/innioasis/ipp/Stale$Keys;Z)J
    move-result-wide v3
  :L26
    add-long/2addr v1, v3
    goto :L28
  :L27
    move-exception p0
  :L28
  .line 72
    const-string p0, "albuminfo"
    invoke-static { p0 }, Lcom/innioasis/ipp/Lab;->s(Ljava/lang/String;)V
  .line 73
    return-wide v1
  :L29
  .line 43
    move-exception p0
  .line 44
    return-wide v1
  :L30
  .line 38
    return-wide v1
.end method

.method static size()J
  .registers 2
  .line 27
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Stale;->run(Z)J
    move-result-wide v0
    return-wide v0
.end method
