.class public final Lcom/innioasis/ipp/YearCache;
.super Ljava/lang/Object;
.source "YearCache.java"

.field private final static reps:Ljava/util/HashMap;

.field private static repsFor:Ljava/util/List;

.method static constructor <clinit>()V
  .registers 1
  .line 18
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/YearCache;->reps:Ljava/util/HashMap;
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 15
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static digits4(Ljava/lang/String;)Ljava/lang/String;
  .registers 10
  .line 22
    const/4 v0, 0
    if-nez p0, :L0
  .line 23
    return-object v0
  :L0
  .line 25
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
  .line 26
    const/4 v2, 0
    const/4 v3, 0
  :L1
    add-int/lit8 v4, v1, -3
    if-ge v3, v4, :L6
  .line 27
    add-int/lit8 v4, v3, 4
    invoke-virtual { p0, v3, v4 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v4
  .line 28
    const/4 v5, 0
  :L2
  .line 29
    const/4 v6, 4
    if-ge v5, v6, :L4
  .line 30
    invoke-virtual { v4, v5 }, Ljava/lang/String;->charAt(I)C
    move-result v7
  .line 31
    const/16 v8, 48
    if-lt v7, v8, :L4
    const/16 v8, 57
    if-le v7, v8, :L3
  .line 32
    goto :L4
  :L3
  .line 34
    add-int/lit8 v5, v5, 1
  .line 35
    goto :L2
  :L4
  .line 36
    if-ne v5, v6, :L5
  .line 37
    return-object v4
  :L5
  .line 26
    add-int/lit8 v3, v3, 1
    goto :L1
  :L6
  .line 40
    return-object v0
.end method

.method public static get(Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 60
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 61
    const/4 v0, 0
    if-nez p0, :L0
  .line 62
    return-object v0
  :L0
  .line 64
    invoke-static { p0 }, Lcom/innioasis/ipp/YearCache;->repPath(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Schema;->row(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object p0
  .line 65
    if-nez p0, :L1
    goto :L2
  :L1
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getYear()Ljava/lang/String;
    move-result-object v0
  :L2
    return-object v0
.end method

.method private static declared-synchronized noteRep(Ljava/lang/String;Ljava/lang/String;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
    const-class v0, Lcom/innioasis/ipp/YearCache;
    monitor-enter v0
  :L0
  .line 55
    sget-object v1, Lcom/innioasis/ipp/YearCache;->reps:Ljava/util/HashMap;
    invoke-virtual { v1, p0, p1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L1
  .line 56
    monitor-exit v0
    return-void
  :L2
  .line 54
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method static prepare(Ljava/util/List;)V
  .registers 2
  .line 75
    const/4 v0, 0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/YearCache;->warm(Ljava/util/List;Z)V
  .line 76
    return-void
.end method

.method static declared-synchronized repPath(Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L3 } :L4
  .registers 4
    const-class v0, Lcom/innioasis/ipp/YearCache;
    monitor-enter v0
  :L0
  .line 45
    invoke-static { }, Lcom/innioasis/ipp/Albums;->loaded()Ljava/util/List;
    move-result-object v1
  .line 46
    if-eqz v1, :L1
    sget-object v2, Lcom/innioasis/ipp/YearCache;->repsFor:Ljava/util/List;
    if-eq v1, v2, :L1
  .line 47
    sget-object v2, Lcom/innioasis/ipp/YearCache;->reps:Ljava/util/HashMap;
    invoke-virtual { v2 }, Ljava/util/HashMap;->clear()V
  .line 48
    sput-object v1, Lcom/innioasis/ipp/YearCache;->repsFor:Ljava/util/List;
  :L1
  .line 50
    sget-object v1, Lcom/innioasis/ipp/YearCache;->reps:Ljava/util/HashMap;
    invoke-virtual { v1, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/lang/String;
  .line 51
    if-eqz v1, :L2
    goto :L3
  :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumInfo;->path(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
  :L3
    monitor-exit v0
    return-object v1
  :L4
  .line 44
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method public static warm(Ljava/util/List;)V
  .registers 2
  .line 70
    const/4 v0, 1
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/YearCache;->warm(Ljava/util/List;Z)V
  .line 71
    return-void
.end method

.method private static warm(Ljava/util/List;Z)V
  .catchall { :L0 .. :L8 } :L10
  .registers 9
  .line 79
    if-nez p0, :L0
  .line 80
    return-void
  :L0
  .line 83
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 84
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v1
  .line 85
    const/4 v2, 0
    const/4 v3, 0
  :L1
    if-ge v3, v1, :L9
  .line 86
    invoke-interface { p0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
    invoke-static { v4 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
  .line 87
    if-eqz v4, :L8
    invoke-static { v4 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result v5
    if-eqz v5, :L2
  .line 88
    goto :L8
  :L2
  .line 90
    invoke-static { v4 }, Lcom/innioasis/ipp/YearCache;->get(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
    if-eqz v5, :L3
  .line 91
    goto :L8
  :L3
  .line 93
    invoke-static { v4 }, Lcom/innioasis/ipp/YearCache;->repPath(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
  .line 94
    if-nez v5, :L4
  .line 95
    invoke-static { v4, p1 }, Lcom/innioasis/ipp/Albums;->firstPath(Ljava/lang/String;Z)Ljava/lang/String;
    move-result-object v5
  .line 96
    if-eqz v5, :L4
    invoke-static { v4, v5 }, Lcom/innioasis/ipp/YearCache;->noteRep(Ljava/lang/String;Ljava/lang/String;)V
  :L4
  .line 98
    if-nez v5, :L7
  .line 99
    sget-object v5, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    invoke-virtual { v0, v4, v5 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsByAlbum(Ljava/lang/String;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object v5
  .line 100
    if-eqz v5, :L8
    invoke-interface { v5 }, Ljava/util/List;->isEmpty()Z
    move-result v6
    if-eqz v6, :L5
  .line 101
    goto :L8
  :L5
  .line 103
    invoke-interface { v5, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v5
  .line 104
    if-nez v5, :L6
  .line 105
    goto :L8
  :L6
  .line 107
    invoke-static { v4, v5 }, Lcom/innioasis/ipp/YearCache;->noteRep(Ljava/lang/String;Ljava/lang/String;)V
  :L7
  .line 109
    invoke-static { v5 }, Lcom/innioasis/ipp/Schema;->row(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object v4
  .line 110
    if-eqz v4, :L8
    invoke-static { v4 }, Lcom/innioasis/ipp/Schema;->unread(Lcom/innioasis/y1/database/Song;)Z
    move-result v4
    if-eqz v4, :L8
  .line 111
    invoke-static { v5, v2 }, Lcom/innioasis/ipp/Meta;->read(Ljava/lang/String;Z)Lcom/innioasis/ipp/Meta$Info;
    move-result-object v4
    invoke-static { v5, v4 }, Lcom/innioasis/ipp/Schema;->stage(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;)V
  :L8
  .line 85
    add-int/lit8 v3, v3, 1
    goto :L1
  :L9
  .line 115
    goto :L11
  :L10
  .line 114
    move-exception p0
  :L11
  .line 116
    invoke-static { }, Lcom/innioasis/ipp/Schema;->write()V
  .line 117
    return-void
.end method
