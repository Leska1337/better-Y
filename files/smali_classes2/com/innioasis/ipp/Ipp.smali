.class public final Lcom/innioasis/ipp/Ipp;
.super Ljava/lang/Object;
.source "Ipp.java"

.method public constructor <init>()V
  .registers 1
  .line 22
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static libraryChanged()V
  .registers 0
  .line 39
    invoke-static { }, Lcom/innioasis/ipp/Albums;->invalidate()V
  .line 40
    invoke-static { }, Lcom/innioasis/ipp/CoverCache;->clearMiss()V
  .line 41
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->clearMiss()V
  .line 44
    invoke-static { }, Lcom/innioasis/ipp/Art;->clear()V
  .line 47
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->invalidate()V
  .line 48
    return-void
.end method

.method public static songChanged(Lcom/innioasis/y1/database/Song;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 59
    invoke-static { }, Lcom/innioasis/ipp/Ipp;->libraryChanged()V
  .line 60
    if-nez p0, :L0
  .line 61
    return-void
  :L0
  .line 64
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v0
  .line 65
    invoke-static { v0 }, Lcom/innioasis/ipp/CoverCache;->forget(Ljava/lang/String;)V
  .line 67
    invoke-static { v0 }, Lcom/innioasis/ipp/AlbumArtist;->forget(Ljava/lang/String;)V
  .line 68
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
  .line 70
    invoke-static { p0 }, Lcom/innioasis/ipp/DiscCache;->forget(Ljava/lang/String;)V
  .line 75
    invoke-static { p0 }, Lcom/innioasis/ipp/TrackCache;->forget(Ljava/lang/String;)V
  .line 79
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->forget(Ljava/lang/String;)V
  .line 80
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->forget(Ljava/lang/String;)V
  :L1
  .line 82
    goto :L3
  :L2
  .line 81
    move-exception p0
  :L3
  .line 83
    return-void
.end method

.method public static songTitle(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .registers 4
  .line 97
    const-string v0, "meta_title"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L0
    if-eqz p1, :L0
  .line 98
    invoke-virtual { p1 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result p0
    if-lez p0, :L0
  .line 99
    sget-object p0, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L0
  .line 101
    if-nez p2, :L1
  .line 102
    const-string p2, ""
  :L1
  .line 104
    sget-object p0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { p0, p2 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->processFileExtensions(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method
