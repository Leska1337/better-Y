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

.method private constructor <init>()V
  .registers 1
  .line 50
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$100(Ljava/lang/String;Ljava/lang/String;)I
  .registers 2
  .line 48
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/GenreSplit;->cmpStr(Ljava/lang/String;Ljava/lang/String;)I
    move-result p0
    return p0
.end method

.method public static albumsIn(Lcom/innioasis/music/data/Genre;)Ljava/util/List;
  .catchall { :L0 .. :L2 } :L3
  .registers 3
  .line 197
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/GenreSplit;->collect(Lcom/innioasis/music/data/Genre;)Ljava/util/ArrayList;
    move-result-object p0
  .line 198
    if-nez p0, :L1
    goto :L2
  :L1
    const/4 v1, 1
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/GenreSplit;->distinct(Ljava/util/ArrayList;I)Ljava/util/List;
    move-result-object v0
  :L2
    return-object v0
  :L3
  .line 199
    move-exception p0
  .line 200
    return-object v0
.end method

.method public static artistsIn(Lcom/innioasis/music/data/Genre;)Ljava/util/List;
  .catchall { :L0 .. :L2 } :L3
  .registers 3
  .line 187
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/GenreSplit;->collect(Lcom/innioasis/music/data/Genre;)Ljava/util/ArrayList;
    move-result-object p0
  .line 188
    if-nez p0, :L1
    goto :L2
  :L1
    const/4 v1, 0
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/GenreSplit;->distinct(Ljava/util/ArrayList;I)Ljava/util/List;
    move-result-object v0
  :L2
    return-object v0
  :L3
  .line 189
    move-exception p0
  .line 190
    return-object v0
.end method

.method private static cmpStr(Ljava/lang/String;Ljava/lang/String;)I
  .registers 2
  .line 312
    invoke-static { p0 }, Lcom/innioasis/ipp/GenreSplit;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { p1 }, Lcom/innioasis/ipp/GenreSplit;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    invoke-virtual { p0, p1 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result p0
    return p0
.end method

.method private static collect(Lcom/innioasis/music/data/Genre;)Ljava/util/ArrayList;
  .registers 10
  .line 137
    const/4 v0, 0
    if-eqz p0, :L10
    invoke-static { }, Lcom/innioasis/ipp/GenreSplit;->enabled()Z
    move-result v1
    if-nez v1, :L0
    goto :L10
  :L0
  .line 138
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/GenreSplit;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 139
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-nez v1, :L1
    return-object v0
  :L1
  .line 140
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v1
  .line 141
    if-nez v1, :L2
    return-object v0
  :L2
  .line 142
    new-instance v2, Ljava/util/ArrayList;
    invoke-direct { v2 }, Ljava/util/ArrayList;-><init>()V
  .line 143
    nop
  .line 144
    const/4 v3, 0
    const/4 v4, 0
  :L3
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v5
    if-ge v3, v5, :L8
  .line 145
    invoke-interface { v1, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
  .line 146
    instance-of v6, v5, Lcom/innioasis/y1/database/Song;
    if-nez v6, :L4
    goto :L7
  :L4
  .line 147
    check-cast v5, Lcom/innioasis/y1/database/Song;
  .line 148
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getGenre()Ljava/lang/String;
    move-result-object v6
  .line 149
    invoke-static { v6 }, Lcom/innioasis/ipp/GenreSplit;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
    invoke-virtual { v7, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v7
  .line 150
    if-nez v7, :L6
    invoke-static { v6 }, Lcom/innioasis/ipp/GenreSplit;->joined(Ljava/lang/String;)Z
    move-result v8
    if-eqz v8, :L5
    invoke-static { v6, p0 }, Lcom/innioasis/ipp/GenreSplit;->inParts(Ljava/lang/String;Ljava/lang/String;)Z
    move-result v6
    if-nez v6, :L6
  :L5
    goto :L7
  :L6
  .line 151
    invoke-virtual { v2, v5 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 152
    if-nez v7, :L7
    const/4 v4, 1
  :L7
  .line 144
    add-int/lit8 v3, v3, 1
    goto :L3
  :L8
  .line 154
    if-eqz v4, :L9
    move-object v0, v2
  :L9
    return-object v0
  :L10
  .line 137
    return-object v0
.end method

.method public static composite(Lcom/innioasis/music/data/Genre;)Z
  .catchall { :L0 .. :L1 } :L3
  .registers 2
  .line 164
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
  .line 165
    move-exception p0
  .line 166
    return v0
.end method

.method private static distinct(Ljava/util/ArrayList;I)Ljava/util/List;
  .registers 6
  .line 253
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 254
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1, p0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 255
    new-instance p0, Lcom/innioasis/ipp/GenreSplit$RowCmp;
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->isSortByName()Z
    move-result v2
    invoke-virtual { v0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->isSortLogic()Z
    move-result v0
    invoke-direct { p0, p1, v2, v0 }, Lcom/innioasis/ipp/GenreSplit$RowCmp;-><init>(IZZ)V
    invoke-static { v1, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 256
    new-instance p0, Ljava/util/LinkedHashMap;
    invoke-direct { p0 }, Ljava/util/LinkedHashMap;-><init>()V
  .line 257
    const/4 v0, 0
  :L0
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v2
    if-ge v0, v2, :L5
  .line 258
    invoke-virtual { v1, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/database/Song;
  .line 259
    if-nez p1, :L1
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v2
    goto :L2
  :L1
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v2
  :L2
  .line 260
    if-nez v2, :L3
    const-string v2, ""
  :L3
  .line 261
    invoke-virtual { p0, v2 }, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :L4
    invoke-virtual { p0, v2, v2 }, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L4
  .line 257
    add-int/lit8 v0, v0, 1
    goto :L0
  :L5
  .line 263
    new-instance p1, Ljava/util/ArrayList;
    invoke-virtual { p0 }, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;
    move-result-object p0
    invoke-direct { p1, p0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    return-object p1
.end method

.method public static enabled()Z
  .registers 2
  .line 56
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 57
    const-string v1, "genre_split"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
    return v0
.end method

.method private static eq(Ljava/lang/String;Ljava/lang/String;)Z
  .registers 3
  .line 65
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
  .line 100
    invoke-static { }, Lcom/innioasis/ipp/GenreSplit;->enabled()Z
    move-result v0
    if-nez v0, :L0
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/GenreSplit;->eq(Ljava/lang/String;Ljava/lang/String;)Z
    move-result p0
    return p0
  :L0
  .line 101
    invoke-static { p1 }, Lcom/innioasis/ipp/GenreSplit;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
  .line 102
    invoke-static { p0 }, Lcom/innioasis/ipp/GenreSplit;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 103
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
  .line 104
    invoke-virtual { v0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L3
    return v3
  :L3
  .line 105
    invoke-static { p0 }, Lcom/innioasis/ipp/GenreSplit;->joined(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L4
    return v2
  :L4
  .line 106
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/GenreSplit;->inParts(Ljava/lang/String;Ljava/lang/String;)Z
    move-result p0
    return p0
.end method

.method public static hasLoose(Ljava/lang/String;Ljava/lang/String;)Z
  .registers 4
  .line 116
    invoke-static { p1 }, Lcom/innioasis/ipp/GenreSplit;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
  .line 117
    invoke-static { p0 }, Lcom/innioasis/ipp/GenreSplit;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    const/4 v1, 1
    if-eqz v0, :L0
    return v1
  :L0
  .line 118
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
  .line 122
    invoke-static { p0 }, Lcom/innioasis/ipp/GenreSplit;->parts(Ljava/lang/String;)Ljava/util/List;
    move-result-object p0
  .line 123
    const/4 v0, 0
    const/4 v1, 0
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v2
    if-ge v1, v2, :L2
  .line 124
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
  .line 123
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 126
    return v0
.end method

.method private static joined(Ljava/lang/String;)Z
  .registers 2
  .line 74
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
  .line 215
    if-eqz p0, :L10
    invoke-static { }, Lcom/innioasis/ipp/GenreSplit;->enabled()Z
    move-result v0
    if-nez v0, :L0
    goto :L10
  :L0
  .line 217
    new-instance v0, Ljava/util/LinkedHashMap;
    invoke-direct { v0 }, Ljava/util/LinkedHashMap;-><init>()V
  .line 218
    const/4 v1, 0
    const/4 v2, 0
  :L1
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L6
  .line 219
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
  .line 220
    instance-of v4, v3, Ljava/lang/String;
    if-nez v4, :L2
    goto :L5
  :L2
  .line 221
    check-cast v3, Ljava/lang/String;
    invoke-static { v3 }, Lcom/innioasis/ipp/GenreSplit;->parts(Ljava/lang/String;)Ljava/util/List;
    move-result-object v3
  .line 222
    const/4 v4, 0
  :L3
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v5
    if-ge v4, v5, :L5
  .line 223
    invoke-interface { v3, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/String;
  .line 224
    invoke-static { v5 }, Lcom/innioasis/ipp/GenreSplit;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
  .line 225
    invoke-virtual { v0, v6 }, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z
    move-result v7
    if-nez v7, :L4
    invoke-virtual { v0, v6, v5 }, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L4
  .line 222
    add-int/lit8 v4, v4, 1
    goto :L3
  :L5
  .line 218
    add-int/lit8 v2, v2, 1
    goto :L1
  :L6
  .line 228
    new-instance v2, Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;
    move-result-object v0
    invoke-direct { v2, v0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 229
    sget-object v0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
  .line 230
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
  .line 231
    return-object v2
  :L9
  .line 232
    move-exception v0
  .line 233
    return-object p0
  :L10
  .line 215
    return-object p0
.end method

.method private static norm(Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 61
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
  .line 79
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 80
    if-nez p0, :L0
    return-object v0
  :L0
  .line 81
    invoke-static { p0 }, Lcom/innioasis/ipp/GenreSplit;->joined(Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :L1
  .line 82
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 83
    return-object v0
  :L1
  .line 85
    const-string v1, "[,;/]"
    invoke-virtual { p0, v1 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v1
  .line 86
    const/4 v2, 0
  :L2
    array-length v3, v1
    if-ge v2, v3, :L4
  .line 87
    aget-object v3, v1, v2
    invoke-virtual { v3 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v3
  .line 88
    invoke-virtual { v3 }, Ljava/lang/String;->length()I
    move-result v4
    if-lez v4, :L3
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 86
    add-int/lit8 v2, v2, 1
    goto :L2
  :L4
  .line 90
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-eqz v1, :L5
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 91
    return-object v0
.end method

.method public static songsIn(Lcom/innioasis/music/data/Genre;)Ljava/util/List;
  .catchall { :L0 .. :L2 } :L3
  .registers 3
  .line 175
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/GenreSplit;->collect(Lcom/innioasis/music/data/Genre;)Ljava/util/ArrayList;
    move-result-object p0
  .line 176
    if-nez p0, :L1
    return-object v0
  :L1
  .line 177
    new-instance v1, Lcom/innioasis/ipp/GenreSplit$FileNameCmp;
    invoke-direct { v1, v0 }, Lcom/innioasis/ipp/GenreSplit$FileNameCmp;-><init>(Lcom/innioasis/ipp/GenreSplit$1;)V
    invoke-static { p0, v1 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  :L2
  .line 178
    return-object p0
  :L3
  .line 179
    move-exception p0
  .line 180
    return-object v0
.end method
