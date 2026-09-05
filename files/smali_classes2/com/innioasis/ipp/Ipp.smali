.class public final Lcom/innioasis/ipp/Ipp;
.super Ljava/lang/Object;
.source "Ipp.java"

.field public final static KEY_LINE_SCROLL:Ljava/lang/String; = "artist_album_scroll"

.method public constructor <init>()V
  .registers 1
  .line 24
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

.method public static playerLine(Landroid/widget/TextView;Ljava/lang/String;Z)V
  .registers 5
  .line 122
    if-nez p0, :L0
  .line 123
    return-void
  :L0
  .line 125
    if-nez p1, :L1
    const-string p1, ""
  :L1
  .line 126
    invoke-virtual { p0 }, Landroid/widget/TextView;->getContext()Landroid/content/Context;
    move-result-object v0
    const-string v1, "artist_album_scroll"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
  .line 127
    const/4 v1, 3
    if-eqz p2, :L2
    const/4 p2, 2
    if-eq v0, p2, :L4
    if-ne v0, v1, :L3
    goto :L4
  :L2
    const/4 p2, 1
    if-eq v0, p2, :L4
    if-ne v0, v1, :L3
    goto :L4
  :L3
  .line 131
    invoke-static { p0 }, Lcom/innioasis/ipp/Scroll;->stopMarquee(Landroid/widget/TextView;)V
  .line 132
    sget-object p2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-virtual { p0, p2 }, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
  .line 133
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 134
    return-void
  :L4
  .line 128
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Scroll;->marqueeText(Landroid/widget/TextView;Ljava/lang/String;)V
  .line 129
    return-void
.end method

.method public static songChanged(Lcom/innioasis/y1/database/Song;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 58
    invoke-static { }, Lcom/innioasis/ipp/Ipp;->libraryChanged()V
  .line 59
    if-nez p0, :L0
  .line 60
    return-void
  :L0
  .line 63
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v0
  .line 64
    invoke-static { v0 }, Lcom/innioasis/ipp/CoverCache;->forget(Ljava/lang/String;)V
  .line 66
    invoke-static { v0 }, Lcom/innioasis/ipp/AlbumArtist;->forget(Ljava/lang/String;)V
  .line 67
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
  .line 69
    invoke-static { p0 }, Lcom/innioasis/ipp/DiscCache;->forget(Ljava/lang/String;)V
  .line 74
    invoke-static { p0 }, Lcom/innioasis/ipp/TrackCache;->forget(Ljava/lang/String;)V
  .line 78
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->forget(Ljava/lang/String;)V
  .line 79
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->forget(Ljava/lang/String;)V
  :L1
  .line 81
    goto :L3
  :L2
  .line 80
    move-exception p0
  :L3
  .line 82
    return-void
.end method

.method public static songTitle(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .registers 4
  .line 96
    const-string v0, "meta_title"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L0
    if-eqz p1, :L0
  .line 97
    invoke-virtual { p1 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result p0
    if-lez p0, :L0
  .line 98
    sget-object p0, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L0
  .line 100
    if-nez p2, :L1
  .line 101
    const-string p2, ""
  :L1
  .line 103
    sget-object p0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { p0, p2 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->processFileExtensions(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method
