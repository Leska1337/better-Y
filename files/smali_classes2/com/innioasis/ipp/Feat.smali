.class public final Lcom/innioasis/ipp/Feat;
.super Ljava/lang/Object;
.source "Feat.java"

.field public final static KEY:Ljava/lang/String; = "player_album_artist"

.field public final static KEY_FEAT:Ljava/lang/String; = "aa_feat_in_title"

.field public final static KEY_FIRST:Ljava/lang/String; = "first_artist_only"

.field public final static KEY_FIRST_FEAT:Ljava/lang/String; = "feat_in_title"

.field public final static KEY_VARIOUS:Ljava/lang/String; = "various_artist"

.method public constructor <init>()V
  .registers 1
  .line 18
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static albumArtist(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
  .catchall { :L0 .. :L3 } :L4
  .registers 3
  .line 60
    const-string v0, ""
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getAlbumArtist()Ljava/lang/String;
    move-result-object v1
  .line 61
    if-nez v1, :L1
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Schema;->row(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumArtist;->of(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v1
  :L1
  .line 62
    if-nez v1, :L2
    goto :L3
  :L2
    invoke-virtual { v1 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0
  :L3
    return-object v0
  :L4
  .line 63
    move-exception p0
  .line 64
    return-object v0
.end method

.method public static artist(Ljava/lang/String;Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
  .registers 2
  .line 41
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Feat;->shown(Ljava/lang/String;Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object p1
  .line 42
    if-nez p1, :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->display(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
  :L0
    return-object p1
.end method

.method private static first(Ljava/lang/String;)Ljava/lang/String;
  .registers 4
  .line 74
    if-nez p0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 75
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->parts(Ljava/lang/String;)Ljava/util/List;
    move-result-object v0
  .line 76
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v1
    const/4 v2, 2
    if-ge v1, v2, :L1
    return-object p0
  :L1
  .line 77
    const/4 p0, 0
    invoke-interface { v0, p0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Ljava/lang/String;
    return-object p0
.end method

.method private static pref(Ljava/lang/String;)Z
  .registers 2
  .line 34
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 35
    if-nez v0, :L0
    const/4 p0, 0
    return p0
  :L0
  .line 36
    invoke-static { v0, p0 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result p0
    return p0
.end method

.method public static rival(Ljava/lang/String;)Ljava/lang/String;
  .registers 4
  .line 28
    const-string v0, "first_artist_only"
    invoke-virtual { v0, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    const-string v2, "player_album_artist"
    if-eqz v1, :L0
    return-object v2
  :L0
  .line 29
    invoke-virtual { v2, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L1
    return-object v0
  :L1
  .line 30
    const/4 p0, 0
    return-object p0
.end method

.method private static shown(Ljava/lang/String;Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
  .registers 4
  .line 50
    const/4 v0, 0
    if-nez p1, :L0
    return-object v0
  :L0
  .line 51
    const-string v1, "player_album_artist"
    invoke-static { v1 }, Lcom/innioasis/ipp/Feat;->pref(Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :L2
    const-string p1, "first_artist_only"
    invoke-static { p1 }, Lcom/innioasis/ipp/Feat;->pref(Ljava/lang/String;)Z
    move-result p1
    if-eqz p1, :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/Feat;->first(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->display(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  :L1
    return-object v0
  :L2
  .line 52
    invoke-static { p1 }, Lcom/innioasis/ipp/Feat;->albumArtist(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object p1
  .line 53
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v0
    if-lez v0, :L4
    const-string v0, "various_artist"
    invoke-static { v0 }, Lcom/innioasis/ipp/Feat;->pref(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L3
    invoke-static { p1 }, Lcom/innioasis/ipp/Feat;->various(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L4
  :L3
    return-object p1
  :L4
  .line 54
    invoke-static { p0 }, Lcom/innioasis/ipp/Feat;->first(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->display(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static title(Ljava/lang/String;Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
  .registers 9
  .line 85
    if-eqz p0, :L15
    if-eqz p1, :L15
    const-string v0, "player_album_artist"
    invoke-static { v0 }, Lcom/innioasis/ipp/Feat;->pref(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L0
    const-string v0, "aa_feat_in_title"
    goto :L1
  :L0
    const-string v0, "feat_in_title"
  :L1
    invoke-static { v0 }, Lcom/innioasis/ipp/Feat;->pref(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L2
    goto/16 :L15
  :L2
  .line 86
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v0
  .line 87
    invoke-static { v0, p1 }, Lcom/innioasis/ipp/Feat;->shown(Ljava/lang/String;Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object p1
  .line 88
    if-eqz p1, :L14
    if-eqz v0, :L14
    const-string v1, "\uffe6\uffe6\uffe6\uffe6<unknown>"
    invoke-virtual { v1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L3
    goto/16 :L14
  :L3
  .line 90
    invoke-static { p1 }, Lcom/innioasis/ipp/Feat;->various(Ljava/lang/String;)Z
    move-result v1
    if-eqz v1, :L4
    return-object p0
  :L4
  .line 91
    invoke-static { v0 }, Lcom/innioasis/ipp/Artists;->parts(Ljava/lang/String;)Ljava/util/List;
    move-result-object v0
  .line 92
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-eqz v1, :L5
    return-object p0
  :L5
  .line 94
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { p0, v1 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v1
  .line 95
    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { p1, v2 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object p1
  .line 96
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
  .line 97
    const/4 v3, 0
  :L6
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v3, v4, :L12
  .line 98
    invoke-interface { v0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
  .line 99
    if-eqz v4, :L11
    invoke-virtual { v4 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v5 }, Ljava/lang/String;->length()I
    move-result v5
    if-nez v5, :L7
    goto :L11
  :L7
  .line 100
    invoke-virtual { v4 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v5
    sget-object v6, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { v5, v6 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object v5
  .line 101
    invoke-virtual { p1, v5 }, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    move-result v6
    if-ltz v6, :L8
    goto :L11
  :L8
  .line 102
    invoke-virtual { v1, v5 }, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    move-result v5
    if-ltz v5, :L9
    return-object p0
  :L9
  .line 103
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->length()I
    move-result v5
    if-lez v5, :L10
    const-string v5, ", "
    invoke-virtual { v2, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L10
  .line 104
    invoke-virtual { v4 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L11
  .line 97
    add-int/lit8 v3, v3, 1
    goto :L6
  :L12
  .line 106
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->length()I
    move-result p1
    if-nez p1, :L13
    return-object p0
  :L13
  .line 107
    new-instance p1, Ljava/lang/StringBuilder;
    invoke-direct { p1 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { p1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string p1, " (feat. "
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string p1, ")"
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L14
  .line 88
    return-object p0
  :L15
  .line 85
    return-object p0
.end method

.method private static various(Ljava/lang/String;)Z
  .registers 2
  .line 69
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { p0, v0 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object p0
  .line 70
    const-string v0, "various"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    const-string v0, "various artists"
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L0
    goto :L1
  :L0
    const/4 p0, 0
    goto :L2
  :L1
    const/4 p0, 1
  :L2
    return p0
.end method
