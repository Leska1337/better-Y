.class public final Lcom/innioasis/ipp/GenreSplit;
.super Ljava/lang/Object;
.source "GenreSplit.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/GenreSplit$FileNameCmp;,
    Lcom/innioasis/ipp/GenreSplit$NameCmp;,
    Lcom/innioasis/ipp/GenreSplit$RowCmp;
  }
.end annotation

.field private final static F_ALBUM:I = 1

.field private final static F_ARTIST:I = 0

.field public final static KEY_SPLIT:Ljava/lang/String; = "genre_split"

.field private static memoOut:Ljava/util/ArrayList;

.field private static memoSongs:Ljava/util/List;

.field private static memoTarget:Ljava/lang/String;

.method private constructor <init>()V
  .registers 1
  .line 28
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$100(Ljava/lang/String;Ljava/lang/String;)I
  .registers 2
  .line 26
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/GenreSplit;->cmpStr(Ljava/lang/String;Ljava/lang/String;)I
    move-result p0
    return p0
.end method

.method public static albumsIn(Lcom/innioasis/music/data/Genre;)Ljava/util/List;
  .catchall { :L0 .. :L2 } :L3
  .registers 3
  .line 170
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/GenreSplit;->collect(Lcom/innioasis/music/data/Genre;)Ljava/util/ArrayList;
    move-result-object p0
  .line 171
    if-nez p0, :L1
    goto :L2
  :L1
    const/4 v1, 1
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/GenreSplit;->distinct(Ljava/util/ArrayList;I)Ljava/util/List;
    move-result-object v0
  :L2
    return-object v0
  :L3
  .line 172
    move-exception p0
  .line 173
    return-object v0
.end method

.method public static artistsIn(Lcom/innioasis/music/data/Genre;)Ljava/util/List;
  .catchall { :L0 .. :L2 } :L3
  .registers 3
  .line 160
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/GenreSplit;->collect(Lcom/innioasis/music/data/Genre;)Ljava/util/ArrayList;
    move-result-object p0
  .line 161
    if-nez p0, :L1
    goto :L2
  :L1
    const/4 v1, 0
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/GenreSplit;->distinct(Ljava/util/ArrayList;I)Ljava/util/List;
    move-result-object v0
  :L2
    return-object v0
  :L3
  .line 162
    move-exception p0
  .line 163
    return-object v0
.end method

.method private static cmpStr(Ljava/lang/String;Ljava/lang/String;)I
  .registers 2
  .line 271
    invoke-static { p0 }, Lcom/innioasis/ipp/GenreSplit;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { p1 }, Lcom/innioasis/ipp/GenreSplit;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result p0
    return p0
.end method

.method private static collect(Lcom/innioasis/music/data/Genre;)Ljava/util/ArrayList;
  .catchall { :L3 .. :L5 } :L9
  .catchall { :L6 .. :L8 } :L7
  .catchall { :L10 .. :L11 } :L9
  .registers 5
  .line 102
    const/4 v0, 0
    if-eqz p0, :L12
    invoke-static { }, Lcom/innioasis/ipp/GenreSplit;->enabled()Z
    move-result v1
    if-nez v1, :L0
    goto :L12
  :L0
  .line 103
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/GenreSplit;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 104
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-nez v1, :L1
    return-object v0
  :L1
  .line 105
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v1
  .line 106
    if-nez v1, :L2
    return-object v0
  :L2
  .line 107
    const-class v2, Lcom/innioasis/ipp/GenreSplit;
    monitor-enter v2
  :L3
  .line 108
    sget-object v0, Lcom/innioasis/ipp/GenreSplit;->memoSongs:Ljava/util/List;
    if-ne v1, v0, :L4
    sget-object v0, Lcom/innioasis/ipp/GenreSplit;->memoTarget:Ljava/lang/String;
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L4
    sget-object p0, Lcom/innioasis/ipp/GenreSplit;->memoOut:Ljava/util/ArrayList;
    monitor-exit v2
    return-object p0
  :L4
  .line 109
    monitor-exit v2
  :L5
  .line 110
    invoke-static { v1, p0 }, Lcom/innioasis/ipp/GenreSplit;->scan(Ljava/util/List;Ljava/lang/String;)Ljava/util/ArrayList;
    move-result-object v0
  .line 111
    const-class v3, Lcom/innioasis/ipp/GenreSplit;
    monitor-enter v3
  :L6
  .line 112
    sput-object v1, Lcom/innioasis/ipp/GenreSplit;->memoSongs:Ljava/util/List;
  .line 113
    sput-object p0, Lcom/innioasis/ipp/GenreSplit;->memoTarget:Ljava/lang/String;
  .line 114
    sput-object v0, Lcom/innioasis/ipp/GenreSplit;->memoOut:Ljava/util/ArrayList;
  .line 115
    monitor-exit v3
  .line 116
    return-object v0
  :L7
  .line 115
    move-exception p0
    monitor-exit v3
  :L8
    throw p0
  :L9
  .line 109
    move-exception p0
  :L10
    monitor-exit v2
  :L11
    throw p0
  :L12
  .line 102
    return-object v0
.end method

.method public static composite(Lcom/innioasis/music/data/Genre;)Z
  .catchall { :L0 .. :L1 } :L3
  .registers 2
  .line 138
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/GenreSplit;->collect(Lcom/innioasis/music/data/Genre;)Ljava/util/ArrayList;
    move-result-object p0
  :L1
    if-eqz p0, :L2
    const/4 v0, 1
  :L2
    return v0
  :L3
  .line 139
    move-exception p0
  .line 140
    return v0
.end method

.method private static distinct(Ljava/util/ArrayList;I)Ljava/util/List;
  .registers 6
  .line 212
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 213
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1, p0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 214
    new-instance p0, Lcom/innioasis/ipp/GenreSplit$RowCmp;
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->isSortByName()Z
    move-result v2
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->isSortLogic()Z
    move-result v0
    invoke-direct { p0, p1, v2, v0 }, Lcom/innioasis/ipp/GenreSplit$RowCmp;-><init>(IZZ)V
    invoke-static { v1, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 215
    new-instance p0, Ljava/util/LinkedHashMap;
    invoke-direct { p0 }, Ljava/util/LinkedHashMap;-><init>()V
  .line 216
    const/4 v0, 0
  :L0
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v2
    if-ge v0, v2, :L5
  .line 217
    invoke-virtual { v1, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/database/Song;
  .line 218
    if-nez p1, :L1
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v2
    goto :L2
  :L1
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v2
  :L2
  .line 219
    if-nez v2, :L3
    const-string v2, ""
  :L3
  .line 220
    invoke-virtual { p0, v2 }, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :L4
    invoke-virtual { p0, v2, v2 }, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L4
  .line 216
    add-int/lit8 v0, v0, 1
    goto :L0
  :L5
  .line 222
    new-instance p1, Ljava/util/ArrayList;
    invoke-virtual { p0 }, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;
    move-result-object p0
    invoke-direct { p1, p0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    return-object p1
.end method

.method public static enabled()Z
  .registers 2
  .line 33
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 34
    const-string v1, "genre_split"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
    return v0
.end method

.method private static eq(Ljava/lang/String;Ljava/lang/String;)Z
  .registers 3
  .line 42
    const-string v0, ""
    if-nez p0, :L0
    move-object p0, v0
  :L0
    if-nez p1, :L1
    move-object p1, v0
  :L1
    invoke-virtual { p0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    return p0
.end method

.method public static has(Ljava/lang/String;Ljava/lang/String;)Z
  .registers 6
  .line 68
    invoke-static { }, Lcom/innioasis/ipp/GenreSplit;->enabled()Z
    move-result v0
    if-nez v0, :L0
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/GenreSplit;->eq(Ljava/lang/String;Ljava/lang/String;)Z
    move-result p0
    return p0
  :L0
  .line 69
    invoke-static { p1 }, Lcom/innioasis/ipp/GenreSplit;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
  .line 70
    invoke-static { p0 }, Lcom/innioasis/ipp/GenreSplit;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 71
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v1
    const/4 v2, 0
    const/4 v3, 1
    if-nez v1, :L2
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result p0
    if-nez p0, :L1
    const/4 v2, 1
  :L1
    return v2
  :L2
  .line 72
    invoke-virtual { v0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L3
    return v3
  :L3
  .line 73
    invoke-static { p0 }, Lcom/innioasis/ipp/GenreSplit;->joined(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L4
    return v2
  :L4
  .line 74
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/GenreSplit;->inParts(Ljava/lang/String;Ljava/lang/String;)Z
    move-result p0
    return p0
.end method

.method public static hasLoose(Ljava/lang/String;Ljava/lang/String;)Z
  .registers 4
  .line 79
    invoke-static { p1 }, Lcom/innioasis/ipp/GenreSplit;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
  .line 80
    invoke-static { p0 }, Lcom/innioasis/ipp/GenreSplit;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    const/4 v1, 1
    if-eqz v0, :L0
    return v1
  :L0
  .line 81
    invoke-static { }, Lcom/innioasis/ipp/GenreSplit;->enabled()Z
    move-result v0
    if-eqz v0, :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/GenreSplit;->joined(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L1
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/GenreSplit;->inParts(Ljava/lang/String;Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L1
    goto :L2
  :L1
    const/4 v1, 0
  :L2
    return v1
.end method

.method private static inParts(Ljava/lang/String;Ljava/lang/String;)Z
  .registers 5
  .line 85
    invoke-static { p0 }, Lcom/innioasis/ipp/GenreSplit;->parts(Ljava/lang/String;)Ljava/util/List;
    move-result-object p0
  .line 86
    const/4 v0, 0
    const/4 v1, 0
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L2
  .line 87
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/String;
    invoke-static { v2 }, Lcom/innioasis/ipp/GenreSplit;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v2, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L1
    const/4 p0, 1
    return p0
  :L1
  .line 86
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 89
    return v0
.end method

.method private static joined(Ljava/lang/String;)Z
  .registers 2
  .line 47
    if-eqz p0, :L1
    const/16 v0, 44
    invoke-virtual { p0, v0 }, Ljava/lang/String;->indexOf(I)I
    move-result v0
    if-gez v0, :L0
    const/16 v0, 59
    invoke-virtual { p0, v0 }, Ljava/lang/String;->indexOf(I)I
    move-result v0
    if-gez v0, :L0
    const/16 v0, 47
    invoke-virtual { p0, v0 }, Ljava/lang/String;->indexOf(I)I
    move-result p0
    if-ltz p0, :L1
  :L0
    const/4 p0, 1
    goto :L2
  :L1
    const/4 p0, 0
  :L2
    return p0
.end method

.method public static list(Ljava/util/List;)Ljava/util/List;
  .catchall { :L0 .. :L8 } :L9
  .registers 9
  .line 182
    if-eqz p0, :L10
    invoke-static { }, Lcom/innioasis/ipp/GenreSplit;->enabled()Z
    move-result v0
    if-nez v0, :L0
    goto :L10
  :L0
  .line 184
    new-instance v0, Ljava/util/LinkedHashMap;
    invoke-direct { v0 }, Ljava/util/LinkedHashMap;-><init>()V
  .line 185
    const/4 v1, 0
    const/4 v2, 0
  :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L6
  .line 186
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
  .line 187
    instance-of v4, v3, Ljava/lang/String;
    if-nez v4, :L2
    goto :L5
  :L2
  .line 188
    check-cast v3, Ljava/lang/String;
    invoke-static { v3 }, Lcom/innioasis/ipp/GenreSplit;->parts(Ljava/lang/String;)Ljava/util/List;
    move-result-object v3
  .line 189
    const/4 v4, 0
  :L3
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v5
    if-ge v4, v5, :L5
  .line 190
    invoke-interface { v3, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/String;
  .line 191
    invoke-static { v5 }, Lcom/innioasis/ipp/GenreSplit;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
  .line 192
    invoke-virtual { v0, v6 }, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z
    move-result v7
    if-nez v7, :L4
    invoke-virtual { v0, v6, v5 }, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L4
  .line 189
    add-int/lit8 v4, v4, 1
    goto :L3
  :L5
  .line 185
    add-int/lit8 v2, v2, 1
    goto :L1
  :L6
  .line 195
    new-instance v2, Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;
    move-result-object v0
    invoke-direct { v2, v0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 196
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 197
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->isSortByName()Z
    move-result v3
    if-eqz v3, :L8
    new-instance v3, Lcom/innioasis/ipp/GenreSplit$NameCmp;
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->isSortLogic()Z
    move-result v0
    if-nez v0, :L7
    const/4 v1, 1
  :L7
    invoke-direct { v3, v1 }, Lcom/innioasis/ipp/GenreSplit$NameCmp;-><init>(Z)V
    invoke-static { v2, v3 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  :L8
  .line 198
    return-object v2
  :L9
  .line 199
    move-exception v0
  .line 200
    return-object p0
  :L10
  .line 182
    return-object p0
.end method

.method static norm(Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 38
    if-nez p0, :L0
    const-string p0, ""
    goto :L1
  :L0
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { p0, v0 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object p0
  :L1
    return-object p0
.end method

.method public static parts(Ljava/lang/String;)Ljava/util/List;
  .registers 6
  .line 51
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 52
    if-nez p0, :L0
    return-object v0
  :L0
  .line 53
    invoke-static { p0 }, Lcom/innioasis/ipp/GenreSplit;->joined(Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :L1
  .line 54
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 55
    return-object v0
  :L1
  .line 57
    const-string v1, "[,;/]"
    invoke-virtual { p0, v1 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v1
  .line 58
    const/4 v2, 0
  :L2
    array-length v3, v1
    if-ge v2, v3, :L4
  .line 59
    aget-object v3, v1, v2
    invoke-virtual { v3 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v3
  .line 60
    invoke-virtual { v3 }, Ljava/lang/String;->length()I
    move-result v4
    if-lez v4, :L3
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 58
    add-int/lit8 v2, v2, 1
    goto :L2
  :L4
  .line 62
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-eqz v1, :L5
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 63
    return-object v0
.end method

.method private static scan(Ljava/util/List;Ljava/lang/String;)Ljava/util/ArrayList;
  .registers 9
  .line 120
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 121
    nop
  .line 122
    const/4 v1, 0
    const/4 v2, 0
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v1, v3, :L5
  .line 123
    invoke-interface { p0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
  .line 124
    instance-of v4, v3, Lcom/innioasis/y1/database/Song;
    if-nez v4, :L1
    goto :L4
  :L1
  .line 125
    check-cast v3, Lcom/innioasis/y1/database/Song;
  .line 126
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getGenre()Ljava/lang/String;
    move-result-object v4
  .line 127
    invoke-static { v4 }, Lcom/innioasis/ipp/GenreSplit;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v5, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v5
  .line 128
    if-nez v5, :L3
    invoke-static { v4 }, Lcom/innioasis/ipp/GenreSplit;->joined(Ljava/lang/String;)Z
    move-result v6
    if-eqz v6, :L2
    invoke-static { v4, p1 }, Lcom/innioasis/ipp/GenreSplit;->inParts(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v4
    if-nez v4, :L3
  :L2
    goto :L4
  :L3
  .line 129
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 130
    if-nez v5, :L4
    const/4 v2, 1
  :L4
  .line 122
    add-int/lit8 v1, v1, 1
    goto :L0
  :L5
  .line 132
    if-eqz v2, :L6
    goto :L7
  :L6
    const/4 v0, 0
  :L7
    return-object v0
.end method

.method public static songsIn(Lcom/innioasis/music/data/Genre;)Ljava/util/List;
  .catchall { :L0 .. :L2 } :L3
  .registers 3
  .line 147
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/GenreSplit;->collect(Lcom/innioasis/music/data/Genre;)Ljava/util/ArrayList;
    move-result-object p0
  .line 148
    if-nez p0, :L1
    return-object v0
  :L1
  .line 149
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1, p0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 150
    new-instance p0, Lcom/innioasis/ipp/GenreSplit$FileNameCmp;
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/GenreSplit$FileNameCmp;-><init>(Lcom/innioasis/ipp/GenreSplit$1;)V
    invoke-static { v1, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  :L2
  .line 151
    return-object v1
  :L3
  .line 152
    move-exception p0
  .line 153
    return-object v0
.end method
