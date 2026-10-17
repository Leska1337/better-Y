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
  .line 51
    invoke-static { }, Lcom/innioasis/ipp/Schema;->write()V
  .line 52
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
  .registers 1
  .line 26
    if-nez p0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 27
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/YearCache;->repPath(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Schema;->row(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumArtist;->of(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static line(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 60
    if-nez p0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/YearCache;->repPath(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Schema;->row(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object v0
  :L1
  .line 61
    if-eqz v0, :L2
    invoke-static { v0 }, Lcom/innioasis/ipp/AlbumArtist;->of(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object p1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/AlbumArtists;->of(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L2
  .line 62
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumArtist;->get(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/AlbumArtists;->of(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static needsRead(Ljava/lang/String;)Z
  .registers 1
  .line 31
    if-eqz p0, :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumArtist;->get(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    if-nez p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
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
  .registers 3
  .line 36
    const-string v0, ""
    if-eqz p0, :L4
    if-nez p1, :L0
    goto :L4
  :L0
  .line 37
    invoke-static { p1 }, Lcom/innioasis/ipp/Schema;->row(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumArtist;->of(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object p0
  .line 38
    if-eqz p0, :L1
    return-object p0
  :L1
  .line 39
    const/4 p0, 0
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/Meta;->read(Ljava/lang/String;Z)Lcom/innioasis/ipp/Meta$Info;
    move-result-object p0
  .line 40
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/Schema;->stage(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;)V
  .line 41
    iget-object p1, p0, Lcom/innioasis/ipp/Meta$Info;->albumArtist:Ljava/lang/String;
    if-nez p1, :L2
    goto :L3
  :L2
    iget-object p0, p0, Lcom/innioasis/ipp/Meta$Info;->albumArtist:Ljava/lang/String;
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0
  :L3
    return-object v0
  :L4
  .line 36
    return-object v0
.end method

.method public static readAndSave(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 45
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/AlbumArtist;->read(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 46
    invoke-static { }, Lcom/innioasis/ipp/Schema;->write()V
  .line 47
    return-object p0
.end method
