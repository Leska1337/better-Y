.class public final Lcom/innioasis/ipp/AlbumInfo;
.super Ljava/lang/Object;
.source "AlbumInfo.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/AlbumInfo$Save;
  }
.end annotation

.field private final static FILE:Ljava/lang/Object;

.field private final static SAVE_DELAY_MS:J = 5000L

.field private static dirty:Z

.field private static lastPut:J

.field private static loaded:Z

.field private final static map:Ljava/util/Hashtable;

.field private static passing:Z

.field private static saveAsked:Z

.method static constructor <clinit>()V
  .registers 1
  .line 24
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
  .line 117
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/AlbumInfo;->FILE:Ljava/lang/Object;
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 22
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000()Ljava/util/Hashtable;
  .registers 1
  .line 22
    sget-object v0, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    return-object v0
.end method

.method static synthetic access$100()J
  .registers 2
  .line 22
    sget-wide v0, Lcom/innioasis/ipp/AlbumInfo;->lastPut:J
    return-wide v0
.end method

.method static synthetic access$202(Z)Z
  .registers 1
  .line 22
    sput-boolean p0, Lcom/innioasis/ipp/AlbumInfo;->saveAsked:Z
    return p0
.end method

.method static synthetic access$300()V
  .registers 0
  .line 22
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->write()V
    return-void
.end method

.method public static artist(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 168
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 169
    const/4 v0, 0
    if-nez p0, :L0
  .line 170
    return-object v0
  :L0
  .line 172
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->load()V
  .line 173
    sget-object v1, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, [Ljava/lang/String;
  .line 174
    if-nez p0, :L1
  .line 175
    return-object v0
  :L1
  .line 177
    const/4 v0, 0
    aget-object p0, p0, v0
    return-object p0
.end method

.method private static bad(Ljava/lang/String;)Z
  .registers 2
  .line 31
    const/16 v0, 9
    invoke-virtual { p0, v0 }, Ljava/lang/String;->indexOf(I)I
    move-result v0
    if-gez v0, :L1
    const/16 v0, 10
    invoke-virtual { p0, v0 }, Ljava/lang/String;->indexOf(I)I
    move-result p0
    if-ltz p0, :L0
    goto :L1
  :L0
    const/4 p0, 0
    goto :L2
  :L1
    const/4 p0, 1
  :L2
    return p0
.end method

.method public static beginCache()V
  .catchall { :L0 .. :L2 } :L1
  .registers 2
  .line 151
    sget-object v0, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    monitor-enter v0
  .line 152
    const/4 v1, 1
  :L0
    sput-boolean v1, Lcom/innioasis/ipp/AlbumInfo;->passing:Z
  .line 153
    monitor-exit v0
  .line 154
    return-void
  :L1
  .line 153
    move-exception v1
    monitor-exit v0
  :L2
    throw v1
.end method

.method public static clear()V
  .catchall { :L0 .. :L1 } :L5
  .catchall { :L1 .. :L2 } :L3
  .catchall { :L4 .. :L6 } :L5
  .registers 2
  .line 253
    sget-object v0, Lcom/innioasis/ipp/AlbumInfo;->FILE:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 254
    sget-object v1, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    invoke-virtual { v1 }, Ljava/util/Hashtable;->clear()V
  .line 255
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/AlbumInfo;->dirty:Z
  .line 256
    sput-boolean v1, Lcom/innioasis/ipp/AlbumInfo;->loaded:Z
  :L1
  .line 258
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->file()Ljava/io/File;
    move-result-object v1
  .line 259
    if-eqz v1, :L2
  .line 260
    invoke-virtual { v1 }, Ljava/io/File;->delete()Z
  :L2
  .line 263
    goto :L4
  :L3
  .line 262
    move-exception v1
  :L4
  .line 264
    monitor-exit v0
  .line 265
    return-void
  :L5
  .line 264
    move-exception v1
    monitor-exit v0
  :L6
    throw v1
.end method

.method public static endCache()V
  .catchall { :L0 .. :L1 } :L2
  .catchall { :L3 .. :L4 } :L2
  .registers 2
  .line 157
    sget-object v0, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    monitor-enter v0
  .line 158
    const/4 v1, 0
  :L0
    sput-boolean v1, Lcom/innioasis/ipp/AlbumInfo;->passing:Z
  .line 159
    monitor-exit v0
  :L1
  .line 160
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->write()V
  .line 161
    return-void
  :L2
  .line 159
    move-exception v1
  :L3
    monitor-exit v0
  :L4
    throw v1
.end method

.method private static file()Ljava/io/File;
  .registers 3
  .line 35
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 36
    const/4 v1, 0
    if-nez v0, :L0
  .line 37
    return-object v1
  :L0
  .line 39
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 40
    if-nez v0, :L1
  .line 41
    return-object v1
  :L1
  .line 43
    new-instance v1, Ljava/io/File;
    const-string v2, "ipp_albums.txt"
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    return-object v1
.end method

.method private static load()V
  .catchall { :L1 .. :L7 } :L10
  .registers 9
  .line 48
    sget-boolean v0, Lcom/innioasis/ipp/AlbumInfo;->loaded:Z
    if-eqz v0, :L0
  .line 49
    return-void
  :L0
  .line 51
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/AlbumInfo;->loaded:Z
  :L1
  .line 53
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->file()Ljava/io/File;
    move-result-object v1
  .line 54
    if-eqz v1, :L9
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-nez v2, :L2
    goto :L9
  :L2
  .line 57
    new-instance v2, Ljava/io/FileInputStream;
    invoke-direct { v2, v1 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 58
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->available()I
    move-result v1
    new-array v1, v1, [B
  .line 59
    invoke-virtual { v2, v1 }, Ljava/io/FileInputStream;->read([B)I
  .line 60
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 61
    new-instance v2, Ljava/lang/String;
    invoke-direct { v2, v1 }, Ljava/lang/String;-><init>([B)V
    const-string v1, "\n"
    invoke-virtual { v2, v1 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v1
  .line 62
    const/4 v2, 0
    const/4 v3, 0
  :L3
    array-length v4, v1
    if-ge v3, v4, :L8
  .line 63
    aget-object v4, v1, v3
    const-string v5, "\t"
    invoke-virtual { v4, v5 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v4
  .line 64
    array-length v5, v4
    const/4 v6, 2
    if-ge v5, v6, :L4
  .line 65
    goto :L7
  :L4
  .line 67
    array-length v5, v4
    const/4 v7, 3
    if-lt v5, v7, :L5
    aget-object v5, v4, v6
    goto :L6
  :L5
    const-string v5, ""
  :L6
  .line 68
    sget-object v7, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    aget-object v8, v4, v2
    new-array v6, v6, [Ljava/lang/String;
    aget-object v4, v4, v0
    aput-object v4, v6, v2
    aput-object v5, v6, v0
    invoke-virtual { v7, v8, v6 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L7
  .line 62
    add-int/lit8 v3, v3, 1
    goto :L3
  :L8
  .line 71
    goto :L11
  :L9
  .line 55
    return-void
  :L10
  .line 70
    move-exception v0
  :L11
  .line 72
    return-void
.end method

.method public static path(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 182
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 183
    const/4 v0, 0
    if-nez p0, :L0
  .line 184
    return-object v0
  :L0
  .line 186
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->load()V
  .line 187
    sget-object v1, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, [Ljava/lang/String;
  .line 188
    if-nez p0, :L1
  .line 189
    return-object v0
  :L1
  .line 191
    const/4 v1, 1
    aget-object p0, p0, v1
  .line 192
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-nez v1, :L2
  .line 193
    return-object v0
  :L2
  .line 195
    return-object p0
.end method

.method static prune(Ljava/util/Set;Lcom/innioasis/ipp/Stale$Keys;Z)J
  .catchall { :L0 .. :L7 } :L9
  .catchall { :L10 .. :L11 } :L9
  .registers 14
  .line 227
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->load()V
  .line 228
    nop
  .line 229
    sget-object v0, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    monitor-enter v0
  :L0
  .line 230
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 231
    invoke-virtual { v0 }, Ljava/util/Hashtable;->entrySet()Ljava/util/Set;
    move-result-object v2
    invoke-interface { v2 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v2
    const-wide/16 v3, 0
  :L1
  .line 232
    invoke-interface { v2 }, Ljava/util/Iterator;->hasNext()Z
    move-result v5
    const/4 v6, 0
    const/4 v7, 1
    if-eqz v5, :L3
  .line 233
    invoke-interface { v2 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/util/Map$Entry;
  .line 234
    invoke-interface { v5 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v8
    check-cast v8, [Ljava/lang/String;
  .line 235
    invoke-interface { v5 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v9
    invoke-interface { p0, v9 }, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    move-result v9
    if-eqz v9, :L2
    aget-object v9, v8, v7
  .line 236
    invoke-virtual { v9 }, Ljava/lang/String;->length()I
    move-result v9
    if-eqz v9, :L1
    aget-object v9, v8, v7
    invoke-static { v9 }, Lcom/innioasis/ipp/Stale$Keys;->of(Ljava/lang/String;)J
    move-result-wide v9
    invoke-virtual { p1, v9, v10 }, Lcom/innioasis/ipp/Stale$Keys;->has(J)Z
    move-result v9
    if-eqz v9, :L2
  .line 237
    goto :L1
  :L2
  .line 239
    invoke-interface { v5 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v9
    invoke-virtual { v1, v9 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 240
    invoke-interface { v5 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;
    invoke-direct { v9 }, Ljava/lang/StringBuilder;-><init>()V
    aget-object v6, v8, v6
    invoke-virtual { v9, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    const-string v9, "\t"
    invoke-virtual { v6, v9 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    aget-object v7, v8, v7
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v6 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v6
    invoke-static { v5, v6 }, Lcom/innioasis/ipp/Stale;->line(Ljava/lang/String;Ljava/lang/String;)J
    move-result-wide v5
    add-long/2addr v3, v5
  .line 241
    goto :L1
  :L3
  .line 242
    if-eqz p2, :L6
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result p0
    if-nez p0, :L6
  .line 243
    nop
  :L4
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result p0
    if-ge v6, p0, :L5
    sget-object p0, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    invoke-virtual { v1, v6 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object p1
    invoke-virtual { p0, p1 }, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    add-int/lit8 v6, v6, 1
    goto :L4
  :L5
  .line 244
    sput-boolean v7, Lcom/innioasis/ipp/AlbumInfo;->dirty:Z
  :L6
  .line 246
    monitor-exit v0
  :L7
  .line 247
    if-eqz p2, :L8
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->write()V
  :L8
  .line 248
    return-wide v3
  :L9
  .line 246
    move-exception p0
  :L10
    monitor-exit v0
  :L11
    goto :L13
  :L12
    throw p0
  :L13
    goto :L12
.end method

.method public static put(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
  .registers 8
  .line 200
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 201
    if-nez p0, :L0
  .line 202
    return-void
  :L0
  .line 204
    const-string v0, ""
    if-nez p1, :L1
  .line 205
    move-object p1, v0
  :L1
  .line 207
    if-nez p2, :L2
  .line 208
    move-object p2, v0
  :L2
  .line 210
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumInfo;->bad(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L5
    invoke-static { p1 }, Lcom/innioasis/ipp/AlbumInfo;->bad(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L5
    invoke-static { p2 }, Lcom/innioasis/ipp/AlbumInfo;->bad(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L3
    goto :L5
  :L3
  .line 213
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->load()V
  .line 214
    sget-object v0, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    invoke-virtual { v0, p0 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, [Ljava/lang/String;
  .line 215
    const/4 v2, 1
    const/4 v3, 0
    if-eqz v1, :L4
    aget-object v4, v1, v3
    invoke-virtual { v4, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :L4
    aget-object v1, v1, v2
    invoke-virtual { v1, p2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L4
  .line 216
    return-void
  :L4
  .line 218
    const/4 v1, 2
    new-array v1, v1, [Ljava/lang/String;
    aput-object p1, v1, v3
    aput-object p2, v1, v2
    invoke-virtual { v0, p0, v1 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 219
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->save()V
  .line 220
    return-void
  :L5
  .line 211
    return-void
.end method

.method private static save()V
  .catchall { :L0 .. :L4 } :L6
  .catchall { :L7 .. :L8 } :L6
  .registers 4
  .line 125
    sget-object v0, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    monitor-enter v0
  .line 126
    const/4 v1, 1
  :L0
    sput-boolean v1, Lcom/innioasis/ipp/AlbumInfo;->dirty:Z
  .line 127
    sget-boolean v2, Lcom/innioasis/ipp/AlbumInfo;->passing:Z
    if-eqz v2, :L1
    monitor-exit v0
    return-void
  :L1
  .line 128
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    sput-wide v2, Lcom/innioasis/ipp/AlbumInfo;->lastPut:J
  .line 129
    sget-boolean v2, Lcom/innioasis/ipp/AlbumInfo;->saveAsked:Z
    if-nez v2, :L2
    const/4 v2, 1
    goto :L3
  :L2
    const/4 v2, 0
  :L3
  .line 130
    sput-boolean v1, Lcom/innioasis/ipp/AlbumInfo;->saveAsked:Z
  .line 131
    monitor-exit v0
  :L4
  .line 132
    if-eqz v2, :L5
    new-instance v0, Lcom/innioasis/ipp/AlbumInfo$Save;
    invoke-direct { v0 }, Lcom/innioasis/ipp/AlbumInfo$Save;-><init>()V
    const-wide/16 v1, 5000
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Albums;->later(Ljava/lang/Runnable;J)V
  :L5
  .line 133
    return-void
  :L6
  .line 131
    move-exception v1
  :L7
    monitor-exit v0
  :L8
    throw v1
.end method

.method private static write()V
  .catchall { :L0 .. :L1 } :L26
  .catchall { :L1 .. :L2 } :L23
  .catchall { :L2 .. :L3 } :L26
  .catchall { :L5 .. :L8 } :L23
  .catchall { :L8 .. :L9 } :L20
  .catchall { :L10 .. :L11 } :L26
  .catchall { :L12 .. :L13 } :L20
  .catchall { :L14 .. :L16 } :L19
  .catchall { :L17 .. :L20 } :L20
  .catchall { :L21 .. :L22 } :L26
  .catchall { :L24 .. :L25 } :L23
  .catchall { :L25 .. :L27 } :L26
  .registers 11
  .line 79
    sget-object v0, Lcom/innioasis/ipp/AlbumInfo;->FILE:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 81
    sget-object v1, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    monitor-enter v1
  :L1
  .line 82
    sget-boolean v2, Lcom/innioasis/ipp/AlbumInfo;->dirty:Z
    if-nez v2, :L4
    monitor-exit v1
  :L2
    monitor-exit v0
  :L3
    return-void
  :L4
  .line 83
    const/4 v2, 0
  :L5
    sput-boolean v2, Lcom/innioasis/ipp/AlbumInfo;->dirty:Z
  .line 84
    invoke-virtual { v1 }, Ljava/util/Hashtable;->keySet()Ljava/util/Set;
    move-result-object v3
    invoke-interface { v3 }, Ljava/util/Set;->toArray()[Ljava/lang/Object;
    move-result-object v3
  .line 85
    array-length v4, v3
    new-array v4, v4, [Ljava/lang/Object;
  .line 86
    const/4 v5, 0
  :L6
    array-length v6, v3
    if-ge v5, v6, :L7
    sget-object v6, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    aget-object v7, v3, v5
    invoke-virtual { v6, v7 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v6
    aput-object v6, v4, v5
    add-int/lit8 v5, v5, 1
    goto :L6
  :L7
  .line 87
    monitor-exit v1
  :L8
  .line 89
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->file()Ljava/io/File;
    move-result-object v1
  :L9
  .line 90
    if-nez v1, :L12
  :L10
  .line 91
    monitor-exit v0
  :L11
    return-void
  :L12
  .line 94
    new-instance v5, Ljava/io/File;
    new-instance v6, Ljava/lang/StringBuilder;
    invoke-direct { v6 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v1 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v7
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    const-string v7, ".tmp"
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v6 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v6
    invoke-direct { v5, v6 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 95
    new-instance v6, Ljava/io/BufferedWriter;
    new-instance v7, Ljava/io/OutputStreamWriter;
    new-instance v8, Ljava/io/FileOutputStream;
    invoke-direct { v8, v5 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    const-string v9, "UTF-8"
    invoke-direct { v7, v8, v9 }, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V
    const/16 v8, 8192
    invoke-direct { v6, v7, v8 }, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;I)V
  :L13
  .line 98
    const/4 v7, 0
  :L14
    array-length v8, v3
    if-ge v7, v8, :L17
  .line 99
    aget-object v8, v4, v7
    check-cast v8, [Ljava/lang/String;
  .line 100
    if-nez v8, :L15
    goto :L16
  :L15
  .line 101
    aget-object v9, v3, v7
    check-cast v9, Ljava/lang/String;
    invoke-virtual { v6, v9 }, Ljava/io/Writer;->write(Ljava/lang/String;)V
  .line 102
    const/16 v9, 9
    invoke-virtual { v6, v9 }, Ljava/io/Writer;->write(I)V
  .line 103
    aget-object v10, v8, v2
    invoke-virtual { v6, v10 }, Ljava/io/Writer;->write(Ljava/lang/String;)V
  .line 104
    invoke-virtual { v6, v9 }, Ljava/io/Writer;->write(I)V
  .line 105
    const/4 v9, 1
    aget-object v8, v8, v9
    invoke-virtual { v6, v8 }, Ljava/io/Writer;->write(Ljava/lang/String;)V
  .line 106
    const/16 v8, 10
    invoke-virtual { v6, v8 }, Ljava/io/Writer;->write(I)V
  :L16
  .line 98
    add-int/lit8 v7, v7, 1
    goto :L14
  :L17
  .line 109
    invoke-virtual { v6 }, Ljava/io/Writer;->close()V
  .line 110
    nop
  .line 111
    invoke-virtual { v5, v1 }, Ljava/io/File;->renameTo(Ljava/io/File;)Z
    move-result v1
    if-nez v1, :L18
    invoke-virtual { v5 }, Ljava/io/File;->delete()Z
  :L18
  .line 113
    goto :L21
  :L19
  .line 109
    move-exception v1
    invoke-virtual { v6 }, Ljava/io/Writer;->close()V
  .line 110
    throw v1
  :L20
  .line 112
    move-exception v1
  :L21
  .line 114
    monitor-exit v0
  :L22
  .line 115
    return-void
  :L23
  .line 87
    move-exception v2
  :L24
    monitor-exit v1
  :L25
    throw v2
  :L26
  .line 114
    move-exception v1
    monitor-exit v0
  :L27
    goto :L29
  :L28
    throw v1
  :L29
    goto :L28
.end method
