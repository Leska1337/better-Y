.class public final Lcom/innioasis/ipp/AlbumInfo;
.super Ljava/lang/Object;
.source "AlbumInfo.java"

.method private constructor <init>()V
  .registers 1
  .line 16
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static artist(Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 20
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
  .line 21
    if-nez p0, :L2
    goto :L3
  :L2
    invoke-virtual { p0 }, Lcom/innioasis/ipp/AlbumTags$Sum;->artist()Ljava/lang/String;
    move-result-object v0
  :L3
    return-object v0
.end method

.method public static clear()V
  .catchall { :L0 .. :L3 } :L4
  .registers 3
  :L0
  .line 36
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 37
    if-nez v0, :L1
    const/4 v0, 0
    goto :L2
  :L1
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  :L2
  .line 38
    if-eqz v0, :L3
    new-instance v1, Ljava/io/File;
    const-string v2, "ipp_albums.txt"
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-virtual { v1 }, Ljava/io/File;->delete()Z
  :L3
  .line 40
    goto :L5
  :L4
  .line 39
    move-exception v0
  :L5
  .line 41
    return-void
.end method

.method public static path(Ljava/lang/String;)Ljava/lang/String;
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
    iget-object v0, p0, Lcom/innioasis/ipp/AlbumTags$Sum;->rep:Ljava/lang/String;
  :L3
    return-object v0
.end method

.method public static put(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
  .registers 3
  .line 32
    return-void
.end method
