.class public final Lcom/innioasis/ipp/AlbumArtist;
.super Ljava/lang/Object;
.source "AlbumArtist.java"

.method private constructor <init>()V
  .registers 1
  .line 17
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static clear()V
  .catchall { :L0 .. :L3 } :L4
  .registers 3
  :L0
  .line 62
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 63
    if-nez v0, :L1
    const/4 v0, 0
    goto :L2
  :L1
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  :L2
  .line 64
    if-eqz v0, :L3
    new-instance v1, Ljava/io/File;
    const-string v2, "ipp_albumartist.txt"
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-virtual { v1 }, Ljava/io/File;->delete()Z
  :L3
  .line 66
    goto :L5
  :L4
  .line 65
    move-exception v0
  :L5
  .line 67
    return-void
.end method

.method public static flush()V
  .registers 0
  .line 56
    invoke-static { }, Lcom/innioasis/ipp/Schema;->write()V
  .line 57
    return-void
.end method

.method public static gen()I
  .registers 1
  .line 21
    invoke-static { }, Lcom/innioasis/ipp/Schema;->gen()I
    move-result v0
    return v0
.end method

.method public static get(Ljava/lang/String;)Ljava/lang/String;
  .registers 1
  .line 31
    if-nez p0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 32
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumInfo;->path(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Schema;->row(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumArtist;->of(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static line(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 74
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumArtist;->get(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/AlbumArtists;->of(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static needsRead(Ljava/lang/String;)Z
  .registers 1
  .line 36
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
  .line 26
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
  .line 41
    const-string v0, ""
    if-eqz p0, :L4
    if-nez p1, :L0
    goto :L4
  :L0
  .line 42
    invoke-static { p1 }, Lcom/innioasis/ipp/Schema;->row(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumArtist;->of(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object p0
  .line 43
    if-eqz p0, :L1
    return-object p0
  :L1
  .line 44
    const/4 p0, 0
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/Meta;->read(Ljava/lang/String;Z)Lcom/innioasis/ipp/Meta$Info;
    move-result-object p0
  .line 45
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/Schema;->stage(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;)V
  .line 46
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
  .line 41
    return-object v0
.end method

.method public static readAndSave(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 50
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/AlbumArtist;->read(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 51
    invoke-static { }, Lcom/innioasis/ipp/Schema;->write()V
  .line 52
    return-object p0
.end method
