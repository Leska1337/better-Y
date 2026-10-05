.class public final Lcom/innioasis/ipp/AlbumArtists;
.super Ljava/lang/Object;
.source "AlbumArtists.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/AlbumArtists$Reader;,
    Lcom/innioasis/ipp/AlbumArtists$NormCmp;
  }
.end annotation

.field public final static EXTRA:Ljava/lang/String; = "ipp_album_artists"

.field public final static KEY:Ljava/lang/String; = "album_artists"

.field private final static MARK:C = '\u0004'

.field private static keyToNorm:Ljava/util/HashMap;

.field private static memoAll:Ljava/util/List;

.field private static memoGen:I

.field private static names:Ljava/util/LinkedHashMap;

.method static constructor <clinit>()V
  .registers 1
  .line 128
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/AlbumArtists;->memoGen:I
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 33
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static declared-synchronized build()Z
  .catchall { :L0 .. :L1 } :L25
  .catchall { :L2 .. :L3 } :L25
  .catchall { :L4 .. :L24 } :L25
  .registers 14
    const-class v0, Lcom/innioasis/ipp/AlbumArtists;
    monitor-enter v0
  :L0
  .line 137
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v1
  :L1
  .line 138
    const/4 v2, 0
    if-nez v1, :L2
    monitor-exit v0
    return v2
  :L2
  .line 139
    sget-object v3, Lcom/innioasis/ipp/AlbumArtists;->memoAll:Ljava/util/List;
    const/4 v4, 1
    if-ne v1, v3, :L4
    sget v3, Lcom/innioasis/ipp/AlbumArtists;->memoGen:I
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->gen()I
    move-result v5
    if-ne v3, v5, :L4
    sget-object v3, Lcom/innioasis/ipp/AlbumArtists;->keyToNorm:Ljava/util/HashMap;
  :L3
    if-eqz v3, :L4
    monitor-exit v0
    return v4
  :L4
  .line 142
    new-instance v3, Ljava/util/HashMap;
    invoke-direct { v3 }, Ljava/util/HashMap;-><init>()V
  .line 143
    const/4 v5, 0
  :L5
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v6
    if-ge v5, v6, :L10
  .line 144
    invoke-interface { v1, v5 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
  .line 145
    instance-of v7, v6, Lcom/innioasis/y1/database/Song;
    if-nez v7, :L6
    goto :L9
  :L6
  .line 146
    check-cast v6, Lcom/innioasis/y1/database/Song;
  .line 147
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v7
    if-nez v7, :L7
    goto :L9
  :L7
  .line 148
    invoke-static { v6 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v7
  .line 149
    invoke-virtual { v3, v7 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v8
    check-cast v8, Lcom/innioasis/y1/database/Song;
  .line 150
    if-eqz v8, :L8
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v9
    invoke-virtual { v8 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v8
    invoke-virtual { v9, v8 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result v8
    if-gez v8, :L9
  :L8
    invoke-virtual { v3, v7, v6 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L9
  .line 143
    add-int/lit8 v5, v5, 1
    goto :L5
  :L10
  .line 152
    invoke-static { v3 }, Lcom/innioasis/ipp/AlbumArtists;->readMissing(Ljava/util/HashMap;)V
  .line 154
    new-instance v5, Ljava/util/HashMap;
    invoke-direct { v5 }, Ljava/util/HashMap;-><init>()V
  .line 155
    new-instance v6, Ljava/util/HashMap;
    invoke-direct { v6 }, Ljava/util/HashMap;-><init>()V
  .line 156
    invoke-virtual { v3 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v3
    invoke-interface { v3 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v3
  :L11
  .line 157
    invoke-interface { v3 }, Ljava/util/Iterator;->hasNext()Z
    move-result v7
    if-eqz v7, :L17
  .line 158
    invoke-interface { v3 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Ljava/util/Map$Entry;
  .line 159
    invoke-interface { v7 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v8
    check-cast v8, Ljava/lang/String;
  .line 160
    invoke-static { v8 }, Lcom/innioasis/ipp/AlbumArtist;->get(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v9
    invoke-interface { v7 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v7 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v7
    invoke-static { v9, v7 }, Lcom/innioasis/ipp/AlbumArtists;->of(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v7
  .line 161
    const-string v9, "\uffe6\uffe6\uffe6\uffe6<unknown>"
    invoke-virtual { v9, v7 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v9
    if-eqz v9, :L12
    const-string v9, "\uffe6\uffe6\uffe6\uffe6<unknown>"
    goto :L13
  :L12
    invoke-static { v7 }, Lcom/innioasis/ipp/AlbumArtists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v9
  :L13
  .line 162
    invoke-virtual { v5, v8, v9 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 163
    invoke-virtual { v6, v9 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v8
    check-cast v8, Ljava/util/HashMap;
  .line 164
    if-nez v8, :L14
    new-instance v8, Ljava/util/HashMap;
    invoke-direct { v8 }, Ljava/util/HashMap;-><init>()V
    invoke-virtual { v6, v9, v8 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L14
  .line 165
    invoke-virtual { v8, v7 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v9
    check-cast v9, Ljava/lang/Integer;
  .line 166
    if-nez v9, :L15
    const/4 v9, 1
    goto :L16
  :L15
    invoke-virtual { v9 }, Ljava/lang/Integer;->intValue()I
    move-result v9
    add-int/2addr v9, v4
  :L16
    invoke-static { v9 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v9
    invoke-virtual { v8, v7, v9 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 167
    goto :L11
  :L17
  .line 168
    new-instance v3, Ljava/util/LinkedHashMap;
    invoke-direct { v3 }, Ljava/util/LinkedHashMap;-><init>()V
  .line 169
    invoke-virtual { v6 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v6
    invoke-interface { v6 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v6
  :L18
  .line 170
    invoke-interface { v6 }, Ljava/util/Iterator;->hasNext()Z
    move-result v7
    if-eqz v7, :L23
  .line 171
    invoke-interface { v6 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Ljava/util/Map$Entry;
  .line 172
    nop
  .line 173
    nop
  .line 174
    invoke-interface { v7 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v8
    check-cast v8, Ljava/util/HashMap;
    invoke-virtual { v8 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v8
    invoke-interface { v8 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v8
    const/4 v9, 0
    const/4 v10, 0
  :L19
  .line 175
    invoke-interface { v8 }, Ljava/util/Iterator;->hasNext()Z
    move-result v11
    if-eqz v11, :L22
  .line 176
    invoke-interface { v8 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v11
    check-cast v11, Ljava/util/Map$Entry;
  .line 177
    invoke-interface { v11 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v12
    check-cast v12, Ljava/lang/String;
  .line 178
    invoke-interface { v11 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v11
    check-cast v11, Ljava/lang/Integer;
    invoke-virtual { v11 }, Ljava/lang/Integer;->intValue()I
    move-result v11
  .line 179
    if-gt v11, v10, :L20
    if-ne v11, v10, :L21
    invoke-virtual { v12, v9 }, Ljava/lang/String;->compareTo(Ljava/lang/String;)I
    move-result v13
    if-gez v13, :L21
  :L20
    move v10, v11
    move-object v9, v12
  :L21
  .line 180
    goto :L19
  :L22
  .line 181
    invoke-interface { v7 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v7
    invoke-virtual { v3, v7, v9 }, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 182
    goto :L18
  :L23
  .line 183
    sput-object v5, Lcom/innioasis/ipp/AlbumArtists;->keyToNorm:Ljava/util/HashMap;
  .line 184
    sput-object v3, Lcom/innioasis/ipp/AlbumArtists;->names:Ljava/util/LinkedHashMap;
  .line 185
    sput-object v1, Lcom/innioasis/ipp/AlbumArtists;->memoAll:Ljava/util/List;
  .line 186
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->gen()I
    move-result v1
    sput v1, Lcom/innioasis/ipp/AlbumArtists;->memoGen:I
  :L24
  .line 187
    monitor-exit v0
    return v4
  :L25
  .line 136
    move-exception v1
    monitor-exit v0
    goto :L27
  :L26
    throw v1
  :L27
    goto :L26
.end method

.method private static first(Ljava/lang/String;)Ljava/lang/String;
  .registers 4
  .line 66
    const-string v0, "\uffe6\uffe6\uffe6\uffe6<unknown>"
    if-nez p0, :L0
    return-object v0
  :L0
  .line 67
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
  .line 68
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-eqz v1, :L6
    invoke-virtual { v0, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L1
    goto :L6
  :L1
  .line 69
    invoke-static { p0 }, Lcom/innioasis/ipp/Artists;->parts(Ljava/lang/String;)Ljava/util/List;
    move-result-object v1
  .line 70
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-eqz v2, :L2
    goto :L3
  :L2
    const/4 p0, 0
    invoke-interface { v1, p0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Ljava/lang/String;
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
  :L3
  .line 71
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-nez v1, :L4
    goto :L5
  :L4
    move-object v0, p0
  :L5
    return-object v0
  :L6
  .line 68
    return-object v0
.end method

.method public static is(Ljava/lang/String;)Z
  .registers 3
  .line 43
    const/4 v0, 0
    if-eqz p0, :L0
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-lez v1, :L0
    invoke-virtual { p0, v0 }, Ljava/lang/String;->charAt(I)C
    move-result p0
    const/4 v1, 4
    if-ne p0, v1, :L0
    const/4 v0, 1
  :L0
    return v0
.end method

.method public static musicMenu(Ljava/util/List;Landroid/content/Context;)V
  .catchall { :L0 .. :L5 } :L6
  .registers 4
  .line 77
    if-eqz p0, :L8
    if-eqz p1, :L8
  :L0
    const-string v0, "album_artists"
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L1
    goto :L8
  :L1
  .line 78
    const v0, 2131821161
    invoke-virtual { p1, v0 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v0
  .line 79
    invoke-interface { p0, v0 }, Ljava/util/List;->contains(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L2
    return-void
  :L2
  .line 80
    const v1, 2131820839
    invoke-virtual { p1, v1 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p1
    invoke-interface { p0, p1 }, Ljava/util/List;->indexOf(Ljava/lang/Object;)I
    move-result p1
  .line 81
    if-gez p1, :L3
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result p1
    goto :L4
  :L3
    add-int/lit8 p1, p1, 1
  :L4
    invoke-interface { p0, p1, v0 }, Ljava/util/List;->add(ILjava/lang/Object;)V
  :L5
  .line 83
    goto :L7
  :L6
  .line 82
    move-exception p0
  :L7
  .line 84
    return-void
  :L8
  .line 77
    return-void
.end method

.method public static musicPick(Landroid/app/Activity;I)I
  .catchall { :L0 .. :L4 } :L7
  .registers 5
  :L0
  .line 89
    sget-object v0, Lcom/innioasis/music/objects/Constant;->INSTANCE:Lcom/innioasis/music/objects/Constant;
    invoke-virtual { v0 }, Lcom/innioasis/music/objects/Constant;->getMainList()Ljava/util/List;
    move-result-object v0
  .line 90
    if-eqz p0, :L6
    if-nez v0, :L1
    goto :L6
  :L1
  .line 91
    const v1, 2131821161
    invoke-virtual { p0, v1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object v1
    invoke-interface { v0, v1 }, Ljava/util/List;->indexOf(Ljava/lang/Object;)I
    move-result v0
  .line 92
    if-ltz v0, :L5
    if-ge p1, v0, :L2
    goto :L5
  :L2
  .line 93
    const/4 v1, 1
    if-le p1, v0, :L3
    sub-int/2addr p1, v1
    return p1
  :L3
  .line 94
    new-instance v0, Landroid/content/Intent;
    const-class v2, Lcom/innioasis/music/ArtistsActivity;
    invoke-direct { v0, p0, v2 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
  .line 95
    const-string v2, "ipp_album_artists"
    invoke-virtual { v0, v2, v1 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;
  .line 96
    invoke-virtual { p0, v0 }, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
  :L4
  .line 97
    const/4 p0, -1
    return p0
  :L5
  .line 92
    return p1
  :L6
  .line 90
    return p1
  :L7
  .line 98
    move-exception p0
  .line 99
    return p1
.end method

.method public static name(Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 48
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumArtists;->is(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L0
    const/4 v0, 1
    invoke-virtual { p0, v0 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
  :L0
    return-object p0
.end method

.method private static norm(Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 52
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

.method public static of(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 61
    if-eqz p0, :L0
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v0
    if-lez v0, :L0
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L0
  .line 62
    invoke-static { p1 }, Lcom/innioasis/ipp/AlbumArtists;->first(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static readMissing(Ljava/util/HashMap;)V
  .catch Ljava/lang/InterruptedException; { :L7 .. :L8 } :L9
  .registers 10
  .line 192
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 193
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 194
    invoke-virtual { p0 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object p0
    invoke-interface { p0 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object p0
  :L0
  .line 195
    invoke-interface { p0 }, Ljava/util/Iterator;->hasNext()Z
    move-result v2
    if-eqz v2, :L2
  .line 196
    invoke-interface { p0 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/util/Map$Entry;
  .line 197
    invoke-interface { v2 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
  .line 198
    invoke-static { v3 }, Lcom/innioasis/ipp/AlbumArtist;->needsRead(Ljava/lang/String;)Z
    move-result v4
    if-nez v4, :L1
    goto :L0
  :L1
  .line 199
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 200
    invoke-interface { v2 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 201
    goto :L0
  :L2
  .line 202
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result p0
    if-eqz p0, :L3
    return-void
  :L3
  .line 203
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result p0
    new-array v2, p0, [Ljava/lang/String;
  .line 204
    new-instance v3, Lcom/innioasis/ipp/AlbumArtists$Reader;
    invoke-direct { v3, v1, v2 }, Lcom/innioasis/ipp/AlbumArtists$Reader;-><init>(Ljava/util/List;[Ljava/lang/String;)V
  .line 205
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v1
    div-int/lit8 v1, v1, 8
    const/4 v4, 1
    invoke-static { v4, v1 }, Ljava/lang/Math;->max(II)I
    move-result v1
    const/4 v5, 3
    invoke-static { v5, v1 }, Ljava/lang/Math;->min(II)I
    move-result v1
  .line 206
    sub-int/2addr v1, v4
    new-array v4, v1, [Ljava/lang/Thread;
  .line 207
    const/4 v5, 0
    const/4 v6, 0
  :L4
    if-ge v6, v1, :L5
  .line 208
    new-instance v7, Ljava/lang/Thread;
    const-string v8, "ipp-albumartist"
    invoke-direct { v7, v3, v8 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    aput-object v7, v4, v6
  .line 209
    invoke-virtual { v7 }, Ljava/lang/Thread;->start()V
  .line 207
    add-int/lit8 v6, v6, 1
    goto :L4
  :L5
  .line 211
    invoke-virtual { v3 }, Lcom/innioasis/ipp/AlbumArtists$Reader;->run()V
  .line 212
    const/4 v3, 0
  :L6
    if-ge v3, v1, :L11
  :L7
  .line 213
    aget-object v6, v4, v3
    invoke-virtual { v6 }, Ljava/lang/Thread;->join()V
  :L8
    goto :L10
  :L9
    move-exception v6
  :L10
  .line 212
    add-int/lit8 v3, v3, 1
    goto :L6
  :L11
  .line 215
    nop
  :L12
    if-ge v5, p0, :L14
  .line 216
    aget-object v1, v2, v5
    if-eqz v1, :L13
    invoke-virtual { v0, v5 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/lang/String;
    aget-object v3, v2, v5
    invoke-static { v1, v3 }, Lcom/innioasis/ipp/AlbumArtist;->put(Ljava/lang/String;Ljava/lang/String;)V
  :L13
  .line 215
    add-int/lit8 v5, v5, 1
    goto :L12
  :L14
  .line 218
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->flush()V
  .line 219
    return-void
.end method

.method public static rows(Z)Ljava/util/List;
  .registers 7
  .line 252
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 253
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtists;->build()Z
    move-result v1
    if-nez v1, :L0
    return-object v0
  :L0
  .line 254
    new-instance v1, Ljava/util/ArrayList;
    sget-object v2, Lcom/innioasis/ipp/AlbumArtists;->names:Ljava/util/LinkedHashMap;
    invoke-virtual { v2 }, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;
    move-result-object v2
    invoke-direct { v1, v2 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 255
    const-string v2, "\uffe6\uffe6\uffe6\uffe6<unknown>"
    invoke-virtual { v1, v2 }, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
    move-result v2
  .line 256
    new-instance v3, Lcom/innioasis/ipp/AlbumArtists$NormCmp;
    invoke-direct { v3, p0 }, Lcom/innioasis/ipp/AlbumArtists$NormCmp;-><init>(Z)V
    invoke-static { v1, v3 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 257
    const/4 p0, 0
  :L1
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge p0, v3, :L2
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    const/4 v4, 4
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v3
    sget-object v4, Lcom/innioasis/ipp/AlbumArtists;->names:Ljava/util/LinkedHashMap;
    invoke-virtual { v1, p0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v5
    invoke-virtual { v4, v5 }, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    add-int/lit8 p0, p0, 1
    goto :L1
  :L2
  .line 258
    if-eqz v2, :L3
    const-string p0, "\u0004\uffe6\uffe6\uffe6\uffe6<unknown>"
    invoke-virtual { v0, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 259
    return-object v0
.end method

.method private static screen(Landroid/app/Activity;)Z
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 105
    const/4 v0, 0
    if-eqz p0, :L3
  :L0
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object v1
    if-eqz v1, :L3
    invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object p0
    const-string v1, "ipp_album_artists"
    invoke-virtual { p0, v1, v0 }, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
    move-result p0
  :L1
    if-eqz p0, :L3
    const/4 v0, 1
    goto :L3
  :L2
  .line 106
    move-exception p0
  .line 107
    return v0
  :L3
  .line 105
    return v0
.end method

.method public static screenList(Ljava/util/List;Landroid/app/Activity;)Ljava/util/List;
  .catchall { :L0 .. :L3 } :L4
  .registers 2
  .line 117
    invoke-static { p1 }, Lcom/innioasis/ipp/AlbumArtists;->screen(Landroid/app/Activity;)Z
    move-result p1
    if-nez p1, :L0
    return-object p0
  :L0
  .line 119
    sget-object p0, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->INSTANCE:Lcom/innioasis/y1/utils/SharedPreferencesUtils;
    invoke-virtual { p0 }, Lcom/innioasis/y1/utils/SharedPreferencesUtils;->getSortArtist()I
    move-result p0
    sget-object p1, Lcom/innioasis/y1/database/Y1Repository$SortArtistsType;->Z_A:Lcom/innioasis/y1/database/Y1Repository$SortArtistsType;
  .line 120
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Y1Repository$SortArtistsType;->getType()I
    move-result p1
    if-ne p0, p1, :L1
    const/4 p0, 1
    goto :L2
  :L1
    const/4 p0, 0
  :L2
  .line 121
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumArtists;->rows(Z)Ljava/util/List;
    move-result-object p0
  :L3
    return-object p0
  :L4
  .line 122
    move-exception p0
  .line 123
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
    return-object p0
.end method

.method public static songs(Ljava/lang/String;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
  .catchall { :L0 .. :L10 } :L11
  .registers 8
  .line 273
    const-string v0, "\uffe6\uffe6\uffe6\uffe6<unknown>"
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  :L0
  .line 275
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtists;->build()Z
    move-result v2
    if-nez v2, :L1
    return-object v1
  :L1
  .line 276
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumArtists;->name(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 277
    invoke-virtual { v0, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L2
    goto :L3
  :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumArtists;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  :L3
  .line 278
    sget-object p0, Lcom/innioasis/ipp/AlbumArtists;->memoAll:Ljava/util/List;
  .line 279
    sget-object v2, Lcom/innioasis/ipp/AlbumArtists;->keyToNorm:Ljava/util/HashMap;
  .line 280
    const/4 v3, 0
  :L4
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v4
    if-ge v3, v4, :L7
  .line 281
    invoke-interface { p0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
  .line 282
    instance-of v5, v4, Lcom/innioasis/y1/database/Song;
    if-nez v5, :L5
    goto :L6
  :L5
  .line 283
    move-object v5, v4
    check-cast v5, Lcom/innioasis/y1/database/Song;
    invoke-static { v5 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v2, v5 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v5
    invoke-virtual { v0, v5 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v5
    if-eqz v5, :L6
    invoke-virtual { v1, v4 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L6
  .line 280
    add-int/lit8 v3, v3, 1
    goto :L4
  :L7
  .line 285
    sget-object p0, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Track_Number:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    if-ne p1, p0, :L8
  .line 286
    sget-object p1, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->Album:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    goto :L9
  :L8
    nop
  :L9
  .line 287
    new-instance p0, Lcom/innioasis/ipp/Artists$SongCmp;
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Artists$SongCmp;-><init>(Lcom/innioasis/y1/database/Y1Repository$SongSortType;)V
    invoke-static { v1, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  :L10
  .line 289
    goto :L12
  :L11
  .line 288
    move-exception p0
  :L12
  .line 290
    return-object v1
.end method

.method public static title(Landroid/app/Activity;Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 112
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumArtists;->screen(Landroid/app/Activity;)Z
    move-result v0
    if-eqz v0, :L0
    const p1, 2131821161
    invoke-virtual { p0, p1 }, Landroid/app/Activity;->getString(I)Ljava/lang/String;
    move-result-object p1
  :L0
    return-object p1
.end method
