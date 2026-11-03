.class public final Lcom/innioasis/ipp/Ipp;
.super Ljava/lang/Object;
.source "Ipp.java"

.field public final static KEY_LINE_SCROLL:Ljava/lang/String; = "artist_album_scroll"

.method public constructor <init>()V
  .registers 1
  .line 16
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static forget(Lcom/innioasis/y1/database/Song;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 57
    if-nez p0, :L0
  .line 58
    return-void
  :L0
  .line 61
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v0
  .line 62
    invoke-static { v0 }, Lcom/innioasis/ipp/CoverCache;->forget(Ljava/lang/String;)V
  .line 63
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
  .line 65
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->forget(Ljava/lang/String;)V
  .line 66
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->forget(Ljava/lang/String;)V
  :L1
  .line 68
    goto :L3
  :L2
  .line 67
    move-exception p0
  :L3
  .line 69
    return-void
.end method

.method public static libraryChanged()V
  .registers 0
  .line 24
    invoke-static { }, Lcom/innioasis/ipp/Albums;->invalidate()V
  .line 25
    invoke-static { }, Lcom/innioasis/ipp/CoverCache;->clearMiss()V
  .line 26
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->clearMiss()V
  .line 27
    invoke-static { }, Lcom/innioasis/ipp/Art;->clear()V
  .line 28
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->invalidate()V
  .line 29
    invoke-static { }, Lcom/innioasis/ipp/Prefs;->forgetLabels()V
  .line 30
    return-void
.end method

.method public static playerLine(Landroid/widget/TextView;Ljava/lang/String;Z)V
  .registers 5
  .line 95
    if-nez p0, :L0
  .line 96
    return-void
  :L0
  .line 98
    if-nez p1, :L1
    const-string p1, ""
  :L1
  .line 99
    invoke-virtual { p0 }, Landroid/widget/TextView;->getContext()Landroid/content/Context;
    move-result-object v0
    const-string v1, "artist_album_scroll"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->val(Landroid/content/Context;Ljava/lang/String;)I
    move-result v0
  .line 100
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
  .line 104
    invoke-static { p0 }, Lcom/innioasis/ipp/Scroll;->stopMarquee(Landroid/widget/TextView;)V
  .line 105
    sget-object p2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-virtual { p0, p2 }, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
  .line 106
    invoke-virtual { p0, p1 }, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
  .line 107
    return-void
  :L4
  .line 101
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Scroll;->marqueeText(Landroid/widget/TextView;Ljava/lang/String;)V
  .line 102
    return-void
.end method

.method public static songChanged(Lcom/innioasis/y1/database/Song;)V
  .registers 1
  .line 38
    invoke-static { }, Lcom/innioasis/ipp/Ipp;->libraryChanged()V
  .line 39
    invoke-static { p0 }, Lcom/innioasis/ipp/Ipp;->forget(Lcom/innioasis/y1/database/Song;)V
  .line 40
    return-void
.end method

.method public static songTitle(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .registers 4
  .line 77
    const-string v0, "meta_title"
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L0
    if-eqz p1, :L0
  .line 78
    invoke-virtual { p1 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result p0
    if-lez p0, :L0
  .line 79
    sget-object p0, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { p0, p1 }, Lcom/innioasis/music/util/Other;->unNamed(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L0
  .line 81
    if-nez p2, :L1
  .line 82
    const-string p2, ""
  :L1
  .line 84
    sget-object p0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { p0, p2 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->processFileExtensions(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static songsChanged([Lcom/innioasis/y1/database/Song;)V
  .catchall { :L1 .. :L2 } :L4
  .registers 3
  .line 44
    invoke-static { }, Lcom/innioasis/ipp/Ipp;->libraryChanged()V
  .line 45
    if-nez p0, :L0
    return-void
  :L0
  .line 46
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->beginForget()V
  .line 47
    invoke-static { }, Lcom/innioasis/ipp/FlowCache;->beginForget()V
  .line 49
    const/4 v0, 0
  :L1
    array-length v1, p0
    if-ge v0, v1, :L3
    aget-object v1, p0, v0
    invoke-static { v1 }, Lcom/innioasis/ipp/Ipp;->forget(Lcom/innioasis/y1/database/Song;)V
  :L2
    add-int/lit8 v0, v0, 1
    goto :L1
  :L3
  .line 51
    invoke-static { }, Lcom/innioasis/ipp/FlowCache;->endForget()V
  .line 52
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->endForget()V
  .line 53
    nop
  .line 54
    return-void
  :L4
  .line 51
    move-exception p0
    invoke-static { }, Lcom/innioasis/ipp/FlowCache;->endForget()V
  .line 52
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->endForget()V
  .line 53
    goto :L6
  :L5
    throw p0
  :L6
    goto :L5
.end method
