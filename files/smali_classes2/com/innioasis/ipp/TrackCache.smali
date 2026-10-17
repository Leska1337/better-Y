.class public final Lcom/innioasis/ipp/TrackCache;
.super Ljava/lang/Object;
.source "TrackCache.java"

.method public constructor <init>()V
  .registers 1
  .line 14
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static ensure(Ljava/util/List;)V
  .registers 6
  .line 18
    if-nez p0, :L0
  .line 19
    return-void
  :L0
  .line 21
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
  .line 22
    const/4 v1, 0
    const/4 v2, 0
  :L1
    if-ge v2, v0, :L4
  .line 23
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v3
  .line 24
    invoke-static { v3 }, Lcom/innioasis/ipp/Schema;->row(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object v4
  .line 25
    if-eqz v4, :L3
    invoke-static { v4 }, Lcom/innioasis/ipp/Schema;->unread(Lcom/innioasis/y1/database/Song;)Z
    move-result v4
    if-nez v4, :L2
  .line 26
    goto :L3
  :L2
  .line 28
    invoke-static { v3, v1 }, Lcom/innioasis/ipp/Meta;->read(Ljava/lang/String;Z)Lcom/innioasis/ipp/Meta$Info;
    move-result-object v4
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/Schema;->stage(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;)V
  :L3
  .line 22
    add-int/lit8 v2, v2, 1
    goto :L1
  :L4
  .line 30
    invoke-static { }, Lcom/innioasis/ipp/Schema;->write()V
  .line 31
    return-void
.end method

.method public static get(Ljava/lang/String;)I
  .registers 2
  .line 35
    invoke-static { p0 }, Lcom/innioasis/ipp/Schema;->row(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object p0
  .line 36
    if-nez p0, :L0
    const/4 p0, 0
    goto :L1
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getTrack()Ljava/lang/String;
    move-result-object p0
  :L1
  .line 37
    const v0, 2147483647
    if-nez p0, :L2
  .line 38
    return v0
  :L2
  .line 40
    invoke-static { p0 }, Lcom/innioasis/ipp/TrackCache;->parse(Ljava/lang/String;)I
    move-result p0
  .line 41
    if-lez p0, :L3
    move v0, p0
  :L3
    return v0
.end method

.method private static parse(Ljava/lang/String;)I
  .registers 7
  .line 49
    nop
  .line 50
    nop
  .line 51
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v0
    const/4 v1, 0
    const/4 v2, 0
  :L0
  .line 52
    const/16 v3, 57
    const/16 v4, 48
    if-ge v2, v0, :L2
  .line 53
    invoke-virtual { p0, v2 }, Ljava/lang/String;->charAt(I)C
    move-result v5
  .line 54
    if-lt v5, v4, :L1
    if-gt v5, v3, :L1
  .line 55
    goto :L2
  :L1
  .line 57
    add-int/lit8 v2, v2, 1
  .line 58
    goto :L0
  :L2
  .line 59
    if-ge v2, v0, :L4
  .line 60
    invoke-virtual { p0, v2 }, Ljava/lang/String;->charAt(I)C
    move-result v5
  .line 61
    if-lt v5, v4, :L4
    if-le v5, v3, :L3
  .line 62
    goto :L4
  :L3
  .line 64
    mul-int/lit8 v1, v1, 10
    add-int/lit8 v5, v5, -48
    add-int/2addr v1, v5
  .line 65
    add-int/lit8 v2, v2, 1
  .line 66
    goto :L2
  :L4
  .line 67
    return v1
.end method

.method public static sorted(Ljava/util/List;)Ljava/util/List;
  .registers 2
  .line 72
    if-nez p0, :L0
  .line 73
    const/4 p0, 0
    return-object p0
  :L0
  .line 75
    invoke-static { p0 }, Lcom/innioasis/ipp/TrackCache;->ensure(Ljava/util/List;)V
  .line 76
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0, p0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 77
    new-instance p0, Lcom/innioasis/ipp/TrackComparator;
    invoke-direct { p0 }, Lcom/innioasis/ipp/TrackComparator;-><init>()V
    invoke-static { v0, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 78
    return-object v0
.end method
