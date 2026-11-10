.class public final Lcom/innioasis/ipp/YearCache;
.super Ljava/lang/Object;
.source "YearCache.java"

.method private constructor <init>()V
  .registers 1
  .line 14
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static digits4(Ljava/lang/String;)Ljava/lang/String;
  .registers 10
  .line 18
    const/4 v0, 0
    if-nez p0, :L0
  .line 19
    return-object v0
  :L0
  .line 21
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
  .line 22
    const/4 v2, 0
    const/4 v3, 0
  :L1
    add-int/lit8 v4, v1, -3
    if-ge v3, v4, :L6
  .line 23
    add-int/lit8 v4, v3, 4
    invoke-virtual { p0, v3, v4 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v4
  .line 24
    const/4 v5, 0
  :L2
  .line 25
    const/4 v6, 4
    if-ge v5, v6, :L4
  .line 26
    invoke-virtual { v4, v5 }, Ljava/lang/String;->charAt(I)C
    move-result v7
  .line 27
    const/16 v8, 48
    if-lt v7, v8, :L4
    const/16 v8, 57
    if-le v7, v8, :L3
  .line 28
    goto :L4
  :L3
  .line 30
    add-int/lit8 v5, v5, 1
  .line 31
    goto :L2
  :L4
  .line 32
    if-ne v5, v6, :L5
  .line 33
    return-object v4
  :L5
  .line 22
    add-int/lit8 v3, v3, 1
    goto :L1
  :L6
  .line 36
    return-object v0
.end method

.method public static get(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 41
    const/4 v0, 0
    if-nez p0, :L0
    move-object p0, v0
    goto :L1
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumTags;->of(Ljava/lang/String;)Lcom/innioasis/ipp/AlbumTags$Sum;
    move-result-object p0
  :L1
  .line 42
    if-eqz p0, :L5
    invoke-virtual { p0 }, Lcom/innioasis/ipp/AlbumTags$Sum;->anyRead()Z
    move-result v1
    if-nez v1, :L2
    goto :L5
  :L2
  .line 43
    iget v0, p0, Lcom/innioasis/ipp/AlbumTags$Sum;->yearMin:I
    if-nez v0, :L3
    const-string p0, ""
    goto :L4
  :L3
    iget p0, p0, Lcom/innioasis/ipp/AlbumTags$Sum;->yearMin:I
    invoke-static { p0 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object p0
  :L4
    return-object p0
  :L5
  .line 42
    return-object v0
.end method

.method public static label(Ljava/lang/String;)Ljava/lang/String;
  .registers 1
  .line 48
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumTags;->of(Ljava/lang/String;)Lcom/innioasis/ipp/AlbumTags$Sum;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumTags;->yearLabel(Lcom/innioasis/ipp/AlbumTags$Sum;)Ljava/lang/String;
    move-result-object p0
  :L1
    return-object p0
.end method

.method static prepare(Ljava/util/List;)V
  .registers 1
  .line 79
    invoke-static { p0 }, Lcom/innioasis/ipp/YearCache;->warm(Ljava/util/List;)V
  .line 80
    return-void
.end method

.method public static warm(Ljava/util/List;)V
  .catchall { :L0 .. :L4 } :L6
  .registers 6
  .line 53
    if-nez p0, :L0
  .line 54
    return-void
  :L0
  .line 57
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
  .line 58
    const/4 v1, 0
    const/4 v2, 0
  :L1
    if-ge v2, v0, :L5
  .line 59
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
    invoke-static { v3 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
  .line 60
    if-eqz v3, :L4
    invoke-static { v3 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :L2
  .line 61
    goto :L4
  :L2
  .line 63
    invoke-static { v3 }, Lcom/innioasis/ipp/AlbumTags;->of(Ljava/lang/String;)Lcom/innioasis/ipp/AlbumTags$Sum;
    move-result-object v3
  .line 64
    if-eqz v3, :L4
    invoke-virtual { v3 }, Lcom/innioasis/ipp/AlbumTags$Sum;->anyRead()Z
    move-result v4
    if-nez v4, :L4
    iget-object v4, v3, Lcom/innioasis/ipp/AlbumTags$Sum;->rep:Ljava/lang/String;
    if-nez v4, :L3
  .line 65
    goto :L4
  :L3
  .line 67
    iget-object v4, v3, Lcom/innioasis/ipp/AlbumTags$Sum;->rep:Ljava/lang/String;
    invoke-static { v4 }, Lcom/innioasis/ipp/Schema;->row(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object v4
  .line 68
    if-eqz v4, :L4
    invoke-static { v4 }, Lcom/innioasis/ipp/Schema;->unread(Lcom/innioasis/y1/database/Song;)Z
    move-result v4
    if-eqz v4, :L4
  .line 69
    iget-object v4, v3, Lcom/innioasis/ipp/AlbumTags$Sum;->rep:Ljava/lang/String;
    iget-object v3, v3, Lcom/innioasis/ipp/AlbumTags$Sum;->rep:Ljava/lang/String;
    invoke-static { v3, v1 }, Lcom/innioasis/ipp/Meta;->read(Ljava/lang/String;Z)Lcom/innioasis/ipp/Meta$Info;
    move-result-object v3
    invoke-static { v4, v3 }, Lcom/innioasis/ipp/Schema;->stage(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;)V
  :L4
  .line 58
    add-int/lit8 v2, v2, 1
    goto :L1
  :L5
  .line 73
    goto :L7
  :L6
  .line 72
    move-exception p0
  :L7
  .line 74
    invoke-static { }, Lcom/innioasis/ipp/Schema;->write()V
  .line 75
    return-void
.end method
