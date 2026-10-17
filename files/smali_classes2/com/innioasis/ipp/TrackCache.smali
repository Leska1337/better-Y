.class public final Lcom/innioasis/ipp/TrackCache;
.super Ljava/lang/Object;
.source "TrackCache.java"

.method public constructor <init>()V
  .registers 1
  .line 18
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static clear()V
  .catchall { :L0 .. :L3 } :L4
  .registers 3
  :L0
  .line 23
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 24
    if-nez v0, :L1
    const/4 v0, 0
    goto :L2
  :L1
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  :L2
  .line 25
    if-eqz v0, :L3
    new-instance v1, Ljava/io/File;
    const-string v2, "ipp_tracks.txt"
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    invoke-virtual { v1 }, Ljava/io/File;->delete()Z
  :L3
  .line 27
    goto :L5
  :L4
  .line 26
    move-exception v0
  :L5
  .line 28
    return-void
.end method

.method private static ensure(Ljava/util/List;)V
  .registers 6
  .line 32
    if-nez p0, :L0
  .line 33
    return-void
  :L0
  .line 35
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
  .line 36
    const/4 v1, 0
    const/4 v2, 0
  :L1
    if-ge v2, v0, :L4
  .line 37
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v3
  .line 38
    invoke-static { v3 }, Lcom/innioasis/ipp/Schema;->row(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object v4
  .line 39
    if-eqz v4, :L3
    invoke-static { v4 }, Lcom/innioasis/ipp/Schema;->unread(Lcom/innioasis/y1/database/Song;)Z
    move-result v4
    if-nez v4, :L2
  .line 40
    goto :L3
  :L2
  .line 42
    invoke-static { v3, v1 }, Lcom/innioasis/ipp/Meta;->read(Ljava/lang/String;Z)Lcom/innioasis/ipp/Meta$Info;
    move-result-object v4
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/Schema;->stage(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;)V
  :L3
  .line 36
    add-int/lit8 v2, v2, 1
    goto :L1
  :L4
  .line 44
    invoke-static { }, Lcom/innioasis/ipp/Schema;->write()V
  .line 45
    return-void
.end method

.method public static get(Ljava/lang/String;)I
  .registers 2
  .line 49
    invoke-static { p0 }, Lcom/innioasis/ipp/Schema;->row(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object p0
  .line 50
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getTrack()Ljava/lang/String;
    move-result-object p0
  :L1
  .line 51
    const v0, 2147483647
    if-nez p0, :L2
  .line 52
    return v0
  :L2
  .line 54
    invoke-static { p0 }, Lcom/innioasis/ipp/TrackCache;->parse(Ljava/lang/String;)I
    move-result p0
  .line 55
    if-lez p0, :L3
    move v0, p0
  :L3
    return v0
.end method

.method private static parse(Ljava/lang/String;)I
  .registers 7
  .line 63
    nop
  .line 64
    nop
  .line 65
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v0
    const/4 v1, 0
    const/4 v2, 0
  :L0
  .line 66
    const/16 v3, 57
    const/16 v4, 48
    if-ge v2, v0, :L2
  .line 67
    invoke-virtual { p0, v2 }, Ljava/lang/String;->charAt(I)C
    move-result v5
  .line 68
    if-lt v5, v4, :L1
    if-gt v5, v3, :L1
  .line 69
    goto :L2
  :L1
  .line 71
    add-int/lit8 v2, v2, 1
  .line 72
    goto :L0
  :L2
  .line 73
    if-ge v2, v0, :L4
  .line 74
    invoke-virtual { p0, v2 }, Ljava/lang/String;->charAt(I)C
    move-result v5
  .line 75
    if-lt v5, v4, :L4
    if-le v5, v3, :L3
  .line 76
    goto :L4
  :L3
  .line 78
    mul-int/lit8 v1, v1, 10
    add-int/lit8 v5, v5, -48
    add-int/2addr v1, v5
  .line 79
    add-int/lit8 v2, v2, 1
  .line 80
    goto :L2
  :L4
  .line 81
    return v1
.end method

.method public static sorted(Ljava/util/List;)Ljava/util/List;
  .registers 2
  .line 86
    if-nez p0, :L0
  .line 87
    const/4 p0, 0
    return-object p0
  :L0
  .line 89
    invoke-static { p0 }, Lcom/innioasis/ipp/TrackCache;->ensure(Ljava/util/List;)V
  .line 90
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0, p0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 91
    new-instance p0, Lcom/innioasis/ipp/TrackComparator;
    invoke-direct { p0 }, Lcom/innioasis/ipp/TrackComparator;-><init>()V
    invoke-static { v0, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 92
    return-object v0
.end method
