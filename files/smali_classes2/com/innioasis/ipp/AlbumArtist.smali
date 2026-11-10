.class public final Lcom/innioasis/ipp/AlbumArtist;
.super Ljava/lang/Object;
.source "AlbumArtist.java"

.method private constructor <init>()V
  .registers 1
  .line 12
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static flush()V
  .registers 0
  .line 53
    invoke-static { }, Lcom/innioasis/ipp/Schema;->write()V
  .line 54
    return-void
.end method

.method public static gen()I
  .registers 1
  .line 16
    invoke-static { }, Lcom/innioasis/ipp/Schema;->gen()I
    move-result v0
    return v0
.end method

.method public static get(Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 26
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
  .line 27
    if-nez p0, :L2
    goto :L3
  :L2
    iget-object v0, p0, Lcom/innioasis/ipp/AlbumTags$Sum;->albumArtist:Ljava/lang/String;
  :L3
    return-object v0
.end method

.method public static line(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 61
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
  .line 62
    if-eqz p0, :L2
    invoke-virtual { p0 }, Lcom/innioasis/ipp/AlbumTags$Sum;->line()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L2
  .line 63
    invoke-static { v0, p1 }, Lcom/innioasis/ipp/AlbumArtists;->of(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static needsRead(Ljava/lang/String;)Z
  .registers 1
  .line 32
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumTags;->of(Ljava/lang/String;)Lcom/innioasis/ipp/AlbumTags$Sum;
    move-result-object p0
  :L1
  .line 33
    if-eqz p0, :L2
    invoke-virtual { p0 }, Lcom/innioasis/ipp/AlbumTags$Sum;->anyRead()Z
    move-result p0
    if-nez p0, :L2
    const/4 p0, 1
    goto :L3
  :L2
    const/4 p0, 0
  :L3
    return p0
.end method

.method public static of(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
  .registers 1
  .line 21
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getAlbumArtist()Ljava/lang/String;
    move-result-object p0
  :L1
    return-object p0
.end method

.method public static read(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .registers 4
  .line 38
    const-string v0, ""
    if-eqz p0, :L4
    if-nez p1, :L0
    goto :L4
  :L0
  .line 39
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumArtist;->get(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
  .line 40
    if-eqz v1, :L1
    return-object v1
  :L1
  .line 41
    const/4 v1, 0
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/Meta;->read(Ljava/lang/String;Z)Lcom/innioasis/ipp/Meta$Info;
    move-result-object v1
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/Schema;->stage(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;)V
  .line 42
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumArtist;->get(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 43
    if-nez p0, :L2
    goto :L3
  :L2
    move-object v0, p0
  :L3
    return-object v0
  :L4
  .line 38
    return-object v0
.end method

.method public static readAndSave(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 47
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/AlbumArtist;->read(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 48
    invoke-static { }, Lcom/innioasis/ipp/Schema;->write()V
  .line 49
    return-object p0
.end method

.method public static row(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 68
    if-eqz p0, :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/AlbumTags;->shown(Ljava/lang/String;)V
  :L0
  .line 69
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/AlbumArtist;->line(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method
