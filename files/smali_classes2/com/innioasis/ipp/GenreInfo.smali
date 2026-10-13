.class public final Lcom/innioasis/ipp/GenreInfo;
.super Ljava/lang/Object;
.source "GenreInfo.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/GenreInfo$Warm;,
    Lcom/innioasis/ipp/GenreInfo$Bucket;,
    Lcom/innioasis/ipp/GenreInfo$Repaint;
  }
.end annotation

.field private final static SEP:C = '\t'

.field private final static VERSION:Ljava/lang/String; = "#v2"

.field private static dirty:Z

.field private static loaded:Z

.field private final static map:Ljava/util/HashMap;

.field private static volatile warming:Z

.method static constructor <clinit>()V
  .registers 1
  .line 34
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/GenreInfo;->map:Ljava/util/HashMap;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 32
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$100()Ljava/util/HashMap;
  .registers 1
  .line 30
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->count()Ljava/util/HashMap;
    move-result-object v0
    return-object v0
.end method

.method static synthetic access$200(Ljava/lang/String;Ljava/lang/String;)V
  .registers 2
  .line 30
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/GenreInfo;->keep(Ljava/lang/String;Ljava/lang/String;)V
    return-void
.end method

.method static synthetic access$300()V
  .registers 0
  .line 30
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->save()V
    return-void
.end method

.method static synthetic access$402(Z)Z
  .registers 1
  .line 30
    sput-boolean p0, Lcom/innioasis/ipp/GenreInfo;->warming:Z
    return p0
.end method

.method private static bucket(Ljava/util/HashMap;Ljava/lang/String;)Lcom/innioasis/ipp/GenreInfo$Bucket;
  .registers 4
  .line 106
    invoke-virtual { p0, p1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/ipp/GenreInfo$Bucket;
  .line 107
    if-nez v0, :L0
  .line 108
    new-instance v0, Lcom/innioasis/ipp/GenreInfo$Bucket;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/GenreInfo$Bucket;-><init>(Lcom/innioasis/ipp/GenreInfo$1;)V
  .line 109
    invoke-virtual { p0, p1, v0 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L0
  .line 111
    return-object v0
.end method

.method public static clear()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 253
    sget-object v0, Lcom/innioasis/ipp/GenreInfo;->map:Ljava/util/HashMap;
    invoke-virtual { v0 }, Ljava/util/HashMap;->clear()V
  .line 254
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/GenreInfo;->loaded:Z
  .line 255
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/GenreInfo;->dirty:Z
  :L0
  .line 257
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->file()Ljava/io/File;
    move-result-object v0
  .line 258
    if-eqz v0, :L1
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v1
    if-eqz v1, :L1
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  :L1
  .line 260
    goto :L3
  :L2
  .line 259
    move-exception v0
  :L3
  .line 261
    return-void
.end method

.method private static count()Ljava/util/HashMap;
  .registers 13
  .line 120
    invoke-static { }, Lcom/innioasis/ipp/GenreSplit;->enabled()Z
    move-result v0
  .line 121
    new-instance v1, Ljava/util/HashMap;
    invoke-direct { v1 }, Ljava/util/HashMap;-><init>()V
  .line 122
    new-instance v2, Ljava/util/HashMap;
    invoke-direct { v2 }, Ljava/util/HashMap;-><init>()V
  .line 123
    invoke-static { }, Lcom/innioasis/ipp/Albums;->allSongs()Ljava/util/List;
    move-result-object v3
  .line 124
    if-nez v3, :L0
    return-object v1
  :L0
  .line 125
    const/4 v4, 0
    const/4 v5, 0
  :L1
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v6
    if-ge v5, v6, :L15
  .line 126
    invoke-interface { v3, v5 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
  .line 127
    instance-of v7, v6, Lcom/innioasis/y1/database/Song;
    if-nez v7, :L2
    goto/16 :L14
  :L2
  .line 128
    check-cast v6, Lcom/innioasis/y1/database/Song;
  .line 129
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getGenre()Ljava/lang/String;
    move-result-object v7
  .line 130
    const-string v8, ""
    if-nez v7, :L3
    move-object v7, v8
  :L3
  .line 131
    invoke-virtual { v2, v7 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v9
    check-cast v9, [Ljava/lang/String;
  .line 132
    if-nez v9, :L8
  .line 133
    new-instance v9, Ljava/util/LinkedHashSet;
    invoke-direct { v9 }, Ljava/util/LinkedHashSet;-><init>()V
  .line 134
    if-eqz v0, :L6
  .line 135
    invoke-static { v7 }, Lcom/innioasis/ipp/GenreSplit;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v10
    invoke-virtual { v9, v10 }, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z
  .line 136
    invoke-static { v7 }, Lcom/innioasis/ipp/GenreSplit;->parts(Ljava/lang/String;)Ljava/util/List;
    move-result-object v10
  .line 137
    const/4 v11, 0
  :L4
    invoke-interface { v10 }, Ljava/util/List;->size()I
    move-result v12
    if-ge v11, v12, :L5
    invoke-interface { v10, v11 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v12
    check-cast v12, Ljava/lang/String;
    invoke-static { v12 }, Lcom/innioasis/ipp/GenreSplit;->norm(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v12
    invoke-virtual { v9, v12 }, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z
    add-int/lit8 v11, v11, 1
    goto :L4
  :L5
  .line 138
    goto :L7
  :L6
  .line 139
    invoke-virtual { v9, v7 }, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z
  :L7
  .line 141
    invoke-virtual { v9 }, Ljava/util/LinkedHashSet;->size()I
    move-result v10
    new-array v10, v10, [Ljava/lang/String;
    invoke-virtual { v9, v10 }, Ljava/util/LinkedHashSet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    move-result-object v9
    check-cast v9, [Ljava/lang/String;
  .line 142
    invoke-virtual { v2, v7, v9 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L8
  .line 144
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getArtist()Ljava/lang/String;
    move-result-object v10
  .line 145
    if-nez v10, :L9
    goto :L10
  :L9
    move-object v8, v10
  :L10
  .line 146
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getAlbum()Ljava/lang/String;
    move-result-object v10
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v6
    invoke-static { v10, v6 }, Lcom/innioasis/ipp/Albums;->albumKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v6
  .line 147
    const/4 v10, 0
  :L11
    array-length v11, v9
    if-ge v10, v11, :L14
  .line 148
    aget-object v11, v9, v10
    invoke-static { v1, v11 }, Lcom/innioasis/ipp/GenreInfo;->bucket(Ljava/util/HashMap;Ljava/lang/String;)Lcom/innioasis/ipp/GenreInfo$Bucket;
    move-result-object v11
  .line 149
    iget-object v12, v11, Lcom/innioasis/ipp/GenreInfo$Bucket;->albums:Ljava/util/HashSet;
    invoke-virtual { v12, v6 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  .line 150
    iget-object v12, v11, Lcom/innioasis/ipp/GenreInfo$Bucket;->artists:Ljava/util/HashSet;
    invoke-virtual { v12, v8 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  .line 151
    if-lez v10, :L12
    const/4 v12, 1
    iput-boolean v12, v11, Lcom/innioasis/ipp/GenreInfo$Bucket;->composite:Z
  :L12
  .line 152
    iget-object v12, v11, Lcom/innioasis/ipp/GenreInfo$Bucket;->exact:Ljava/util/HashMap;
    invoke-virtual { v12, v7 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v12
    check-cast v12, Ljava/util/HashSet;
  .line 153
    if-nez v12, :L13
  .line 154
    new-instance v12, Ljava/util/HashSet;
    invoke-direct { v12 }, Ljava/util/HashSet;-><init>()V
  .line 155
    iget-object v11, v11, Lcom/innioasis/ipp/GenreInfo$Bucket;->exact:Ljava/util/HashMap;
    invoke-virtual { v11, v7, v12 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L13
  .line 157
    invoke-virtual { v12, v8 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  .line 147
    add-int/lit8 v10, v10, 1
    goto :L11
  :L14
  .line 125
    add-int/lit8 v5, v5, 1
    goto/16 :L1
  :L15
  .line 160
    return-object v1
.end method

.method public static counted(Lcom/innioasis/music/data/Genre;)Z
  .catchall { :L0 .. :L2 } :L5
  .registers 4
  .line 87
    const/4 v0, 0
  :L0
    sget-boolean v1, Lcom/innioasis/ipp/GenreInfo;->warming:Z
    const/4 v2, 1
    if-nez v1, :L4
    if-nez p0, :L1
    goto :L4
  :L1
  .line 88
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Genre;->getInfo()Ljava/lang/String;
    move-result-object p0
  .line 89
    if-eqz p0, :L3
    invoke-virtual { p0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result p0
  :L2
    if-lez p0, :L3
    const/4 v0, 1
  :L3
    return v0
  :L4
  .line 87
    return v2
  :L5
  .line 90
    move-exception p0
  .line 91
    return v0
.end method

.method private static file()Ljava/io/File;
  .registers 3
  .line 264
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 265
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 266
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 267
    if-nez v0, :L1
    goto :L2
  :L1
    new-instance v1, Ljava/io/File;
    const-string v2, "ipp_genres.txt"
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  :L2
    return-object v1
.end method

.method public static fill(Lcom/innioasis/music/data/Genre;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 3
  .line 42
    if-eqz p0, :L6
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object v0
    if-nez v0, :L1
    goto :L6
  :L1
  .line 43
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Genre;->getInfo()Ljava/lang/String;
    move-result-object v0
  .line 44
    if-eqz v0, :L2
    invoke-virtual { v0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v0
    if-lez v0, :L2
    return-void
  :L2
  .line 45
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->load()V
  .line 46
    sget-object v0, Lcom/innioasis/ipp/GenreInfo;->map:Ljava/util/HashMap;
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
  .line 47
    if-eqz v0, :L3
    check-cast v0, Ljava/lang/String;
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/data/Genre;->setInfo(Ljava/lang/String;)V
  :L3
  .line 49
    goto :L5
  :L4
  .line 48
    move-exception p0
  :L5
  .line 50
    return-void
  :L6
  .line 42
    return-void
.end method

.method public static invalidate()V
  .registers 1
  .line 247
    sget-object v0, Lcom/innioasis/ipp/GenreInfo;->map:Ljava/util/HashMap;
    invoke-virtual { v0 }, Ljava/util/HashMap;->clear()V
  .line 248
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/GenreInfo;->loaded:Z
  .line 249
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/GenreInfo;->dirty:Z
  .line 250
    return-void
.end method

.method private static keep(Ljava/lang/String;Ljava/lang/String;)V
  .registers 4
  .line 217
    if-eqz p0, :L2
    const/16 v0, 9
    invoke-virtual { p0, v0 }, Ljava/lang/String;->indexOf(I)I
    move-result v1
    if-gez v1, :L2
    invoke-virtual { p1, v0 }, Ljava/lang/String;->indexOf(I)I
    move-result v0
    if-ltz v0, :L0
    goto :L2
  :L0
  .line 218
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->load()V
  .line 219
    sget-object v0, Lcom/innioasis/ipp/GenreInfo;->map:Ljava/util/HashMap;
    invoke-virtual { v0, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L1
    return-void
  :L1
  .line 220
    invoke-virtual { v0, p0, p1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 221
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/GenreInfo;->dirty:Z
  .line 222
    return-void
  :L2
  .line 217
    return-void
.end method

.method private static declared-synchronized load()V
  .catchall { :L0 .. :L1 } :L15
  .catchall { :L3 .. :L4 } :L15
  .catchall { :L4 .. :L9 } :L13
  .registers 8
    const-class v0, Lcom/innioasis/ipp/GenreInfo;
    monitor-enter v0
  :L0
  .line 277
    sget-boolean v1, Lcom/innioasis/ipp/GenreInfo;->loaded:Z
  :L1
    if-eqz v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 278
    const/4 v1, 1
  :L3
    sput-boolean v1, Lcom/innioasis/ipp/GenreInfo;->loaded:Z
  :L4
  .line 280
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->file()Ljava/io/File;
    move-result-object v2
  .line 281
    if-eqz v2, :L12
    invoke-virtual { v2 }, Ljava/io/File;->exists()Z
    move-result v3
    if-nez v3, :L5
    goto :L12
  :L5
  .line 282
    new-instance v3, Ljava/io/FileInputStream;
    invoke-direct { v3, v2 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 283
    invoke-virtual { v3 }, Ljava/io/FileInputStream;->available()I
    move-result v2
    new-array v2, v2, [B
  .line 284
    invoke-virtual { v3, v2 }, Ljava/io/FileInputStream;->read([B)I
  .line 285
    invoke-virtual { v3 }, Ljava/io/FileInputStream;->close()V
  .line 286
    new-instance v3, Ljava/lang/String;
    const-string v4, "UTF-8"
    invoke-direct { v3, v2, v4 }, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    const-string v2, "\n"
    invoke-virtual { v3, v2 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v2
  .line 287
    array-length v3, v2
    if-eqz v3, :L11
    const-string v3, "#v2"
    const/4 v4, 0
    aget-object v5, v2, v4
    invoke-virtual { v5 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v3, v5 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :L6
    goto :L11
  :L6
  .line 288
    nop
  :L7
    array-length v3, v2
    if-ge v1, v3, :L10
  .line 289
    aget-object v3, v2, v1
  .line 290
    const/16 v5, 9
    invoke-virtual { v3, v5 }, Ljava/lang/String;->indexOf(I)I
    move-result v5
  .line 291
    if-gtz v5, :L8
    goto :L9
  :L8
  .line 292
    sget-object v6, Lcom/innioasis/ipp/GenreInfo;->map:Ljava/util/HashMap;
    invoke-virtual { v3, v4, v5 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v7
    add-int/lit8 v5, v5, 1
    invoke-virtual { v3, v5 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v6, v7, v3 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L9
  .line 288
    add-int/lit8 v1, v1, 1
    goto :L7
  :L10
  .line 295
    goto :L14
  :L11
  .line 287
    monitor-exit v0
    return-void
  :L12
  .line 281
    monitor-exit v0
    return-void
  :L13
  .line 294
    move-exception v1
  :L14
  .line 296
    monitor-exit v0
    return-void
  :L15
  .line 276
    move-exception v1
    monitor-exit v0
    goto :L17
  :L16
    throw v1
  :L17
    goto :L16
.end method

.method public static put(Ljava/lang/String;Ljava/lang/String;)V
  .catchall { :L0 .. :L4 } :L6
  .registers 4
  .line 235
    if-eqz p0, :L8
    if-eqz p1, :L8
  :L0
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L1
    goto :L8
  :L1
  .line 236
    const/16 v0, 9
    invoke-virtual { p0, v0 }, Ljava/lang/String;->indexOf(I)I
    move-result v1
    if-gez v1, :L5
    invoke-virtual { p1, v0 }, Ljava/lang/String;->indexOf(I)I
    move-result v0
    if-ltz v0, :L2
    goto :L5
  :L2
  .line 237
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->load()V
  .line 238
    sget-object v0, Lcom/innioasis/ipp/GenreInfo;->map:Ljava/util/HashMap;
    invoke-virtual { v0, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L3
    return-void
  :L3
  .line 239
    invoke-virtual { v0, p0, p1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 240
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/GenreInfo;->dirty:Z
  .line 241
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->save()V
  :L4
  .line 243
    goto :L7
  :L5
  .line 236
    return-void
  :L6
  .line 242
    move-exception p0
  :L7
  .line 244
    return-void
  :L8
  .line 235
    return-void
.end method

.method private static declared-synchronized save()V
  .catchall { :L0 .. :L1 } :L10
  .catchall { :L2 .. :L3 } :L8
  .catchall { :L4 .. :L7 } :L8
  .registers 8
    const-class v0, Lcom/innioasis/ipp/GenreInfo;
    monitor-enter v0
  :L0
  .line 299
    sget-boolean v1, Lcom/innioasis/ipp/GenreInfo;->dirty:Z
  :L1
    if-nez v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 301
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->file()Ljava/io/File;
    move-result-object v1
  :L3
  .line 302
    if-nez v1, :L4
    monitor-exit v0
    return-void
  :L4
  .line 303
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
  .line 304
    const-string v3, "#v2"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    const/16 v4, 10
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 305
    sget-object v3, Lcom/innioasis/ipp/GenreInfo;->map:Ljava/util/HashMap;
    invoke-virtual { v3 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v3
    invoke-interface { v3 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v3
  :L5
  .line 306
    invoke-interface { v3 }, Ljava/util/Iterator;->hasNext()Z
    move-result v5
    if-eqz v5, :L6
  .line 307
    invoke-interface { v3 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/util/Map$Entry;
  .line 308
    invoke-interface { v5 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Ljava/lang/String;
    invoke-virtual { v2, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    const/16 v7, 9
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-interface { v5 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/String;
    invoke-virtual { v6, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 309
    goto :L5
  :L6
  .line 310
    new-instance v3, Ljava/io/FileOutputStream;
    invoke-direct { v3, v1 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  .line 311
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    const-string v2, "UTF-8"
    invoke-virtual { v1, v2 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object v1
    invoke-virtual { v3, v1 }, Ljava/io/FileOutputStream;->write([B)V
  .line 312
    invoke-virtual { v3 }, Ljava/io/FileOutputStream;->close()V
  .line 313
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/GenreInfo;->dirty:Z
  :L7
  .line 315
    goto :L9
  :L8
  .line 314
    move-exception v1
  :L9
  .line 316
    monitor-exit v0
    return-void
  :L10
  .line 298
    move-exception v1
    monitor-exit v0
    goto :L12
  :L11
    throw v1
  :L12
    goto :L11
.end method

.method public static warm(Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .catchall { :L1 .. :L9 } :L10
  .registers 7
  .line 58
    if-nez p0, :L0
    return-void
  :L0
  .line 59
    const/4 v0, 0
  :L1
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->load()V
  .line 60
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 61
    const/4 v2, 0
  :L2
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v3
    if-ge v2, v3, :L7
  .line 62
    invoke-virtual { p0, v2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v3
  .line 63
    instance-of v4, v3, Lcom/innioasis/music/data/Genre;
    if-nez v4, :L3
    goto :L6
  :L3
  .line 64
    check-cast v3, Lcom/innioasis/music/data/Genre;
  .line 65
    invoke-virtual { v3 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object v4
    if-nez v4, :L4
    goto :L6
  :L4
  .line 66
    sget-object v4, Lcom/innioasis/ipp/GenreInfo;->map:Ljava/util/HashMap;
    invoke-virtual { v3 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v4, v5 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v4
  .line 67
    if-eqz v4, :L5
    check-cast v4, Ljava/lang/String;
    invoke-virtual { v3, v4 }, Lcom/innioasis/music/data/Genre;->setInfo(Ljava/lang/String;)V
    goto :L6
  :L5
  .line 68
    invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L6
  .line 61
    add-int/lit8 v2, v2, 1
    goto :L2
  :L7
  .line 70
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v2
    if-eqz v2, :L8
    return-void
  :L8
  .line 71
    const/4 v2, 1
    sput-boolean v2, Lcom/innioasis/ipp/GenreInfo;->warming:Z
  .line 72
    new-instance v2, Ljava/lang/Thread;
    new-instance v3, Lcom/innioasis/ipp/GenreInfo$Warm;
    invoke-direct { v3, p0, v1 }, Lcom/innioasis/ipp/GenreInfo$Warm;-><init>(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/util/ArrayList;)V
    invoke-direct { v2, v3 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v2 }, Ljava/lang/Thread;->start()V
  :L9
  .line 75
    goto :L11
  :L10
  .line 73
    move-exception p0
  .line 74
    sput-boolean v0, Lcom/innioasis/ipp/GenreInfo;->warming:Z
  :L11
  .line 76
    return-void
.end method
