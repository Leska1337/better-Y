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
  .line 112
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
  .line 163
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 164
    const/4 v0, 0
    if-nez p0, :L0
  .line 165
    return-object v0
  :L0
  .line 167
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->load()V
  .line 168
    sget-object v1, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, [Ljava/lang/String;
  .line 169
    if-nez p0, :L1
  .line 170
    return-object v0
  :L1
  .line 172
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
  .line 146
    sget-object v0, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    monitor-enter v0
  .line 147
    const/4 v1, 1
  :L0
    sput-boolean v1, Lcom/innioasis/ipp/AlbumInfo;->passing:Z
  .line 148
    monitor-exit v0
  .line 149
    return-void
  :L1
  .line 148
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
  .line 248
    sget-object v0, Lcom/innioasis/ipp/AlbumInfo;->FILE:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 249
    sget-object v1, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    invoke-virtual { v1 }, Ljava/util/Hashtable;->clear()V
  .line 250
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/AlbumInfo;->dirty:Z
  .line 251
    sput-boolean v1, Lcom/innioasis/ipp/AlbumInfo;->loaded:Z
  :L1
  .line 253
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->file()Ljava/io/File;
    move-result-object v1
  .line 254
    if-eqz v1, :L2
  .line 255
    invoke-virtual { v1 }, Ljava/io/File;->delete()Z
  :L2
  .line 258
    goto :L4
  :L3
  .line 257
    move-exception v1
  :L4
  .line 259
    monitor-exit v0
  .line 260
    return-void
  :L5
  .line 259
    move-exception v1
    monitor-exit v0
  :L6
    throw v1
.end method

.method public static endCache()V
  .catchall { :L0 .. :L1 } :L2
  .catchall { :L3 .. :L4 } :L2
  .registers 2
  .line 152
    sget-object v0, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    monitor-enter v0
  .line 153
    const/4 v1, 0
  :L0
    sput-boolean v1, Lcom/innioasis/ipp/AlbumInfo;->passing:Z
  .line 154
    monitor-exit v0
  :L1
  .line 155
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->write()V
  .line 156
    return-void
  :L2
  .line 154
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
  .line 177
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 178
    const/4 v0, 0
    if-nez p0, :L0
  .line 179
    return-object v0
  :L0
  .line 181
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->load()V
  .line 182
    sget-object v1, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, [Ljava/lang/String;
  .line 183
    if-nez p0, :L1
  .line 184
    return-object v0
  :L1
  .line 186
    const/4 v1, 1
    aget-object p0, p0, v1
  .line 187
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-nez v1, :L2
  .line 188
    return-object v0
  :L2
  .line 190
    return-object p0
.end method

.method static prune(Ljava/util/Set;Lcom/innioasis/ipp/Stale$Keys;Z)J
  .catchall { :L0 .. :L7 } :L9
  .catchall { :L10 .. :L11 } :L9
  .registers 14
  .line 222
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->load()V
  .line 223
    nop
  .line 224
    sget-object v0, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    monitor-enter v0
  :L0
  .line 225
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 226
    invoke-virtual { v0 }, Ljava/util/Hashtable;->entrySet()Ljava/util/Set;
    move-result-object v2
    invoke-interface { v2 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v2
    const-wide/16 v3, 0
  :L1
  .line 227
    invoke-interface { v2 }, Ljava/util/Iterator;->hasNext()Z
    move-result v5
    const/4 v6, 0
    const/4 v7, 1
    if-eqz v5, :L3
  .line 228
    invoke-interface { v2 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/util/Map$Entry;
  .line 229
    invoke-interface { v5 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v8
    check-cast v8, [Ljava/lang/String;
  .line 230
    invoke-interface { v5 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v9
    invoke-interface { p0, v9 }, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    move-result v9
    if-eqz v9, :L2
    aget-object v9, v8, v7
  .line 231
    invoke-virtual { v9 }, Ljava/lang/String;->length()I
    move-result v9
    if-eqz v9, :L1
    aget-object v9, v8, v7
    invoke-static { v9 }, Lcom/innioasis/ipp/Stale$Keys;->of(Ljava/lang/String;)J
    move-result-wide v9
    invoke-virtual { p1, v9, v10 }, Lcom/innioasis/ipp/Stale$Keys;->has(J)Z
    move-result v9
    if-eqz v9, :L2
  .line 232
    goto :L1
  :L2
  .line 234
    invoke-interface { v5 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v9
    invoke-virtual { v1, v9 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 235
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
  .line 236
    goto :L1
  :L3
  .line 237
    if-eqz p2, :L6
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result p0
    if-nez p0, :L6
  .line 238
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
  .line 239
    sput-boolean v7, Lcom/innioasis/ipp/AlbumInfo;->dirty:Z
  :L6
  .line 241
    monitor-exit v0
  :L7
  .line 242
    if-eqz p2, :L8
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->write()V
  :L8
  .line 243
    return-wide v3
  :L9
  .line 241
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
  .line 195
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 196
    if-nez p0, :L0
  .line 197
    return-void
  :L0
  .line 199
    const-string v0, ""
    if-nez p1, :L1
  .line 200
    move-object p1, v0
  :L1
  .line 202
    if-nez p2, :L2
  .line 203
    move-object p2, v0
  :L2
  .line 205
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
  .line 208
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->load()V
  .line 209
    sget-object v0, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    invoke-virtual { v0, p0 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, [Ljava/lang/String;
  .line 210
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
  .line 211
    return-void
  :L4
  .line 213
    const/4 v1, 2
    new-array v1, v1, [Ljava/lang/String;
    aput-object p1, v1, v3
    aput-object p2, v1, v2
    invoke-virtual { v0, p0, v1 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 214
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->save()V
  .line 215
    return-void
  :L5
  .line 206
    return-void
.end method

.method private static save()V
  .catchall { :L0 .. :L4 } :L6
  .catchall { :L7 .. :L8 } :L6
  .registers 4
  .line 120
    sget-object v0, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    monitor-enter v0
  .line 121
    const/4 v1, 1
  :L0
    sput-boolean v1, Lcom/innioasis/ipp/AlbumInfo;->dirty:Z
  .line 122
    sget-boolean v2, Lcom/innioasis/ipp/AlbumInfo;->passing:Z
    if-eqz v2, :L1
    monitor-exit v0
    return-void
  :L1
  .line 123
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    sput-wide v2, Lcom/innioasis/ipp/AlbumInfo;->lastPut:J
  .line 124
    sget-boolean v2, Lcom/innioasis/ipp/AlbumInfo;->saveAsked:Z
    if-nez v2, :L2
    const/4 v2, 1
    goto :L3
  :L2
    const/4 v2, 0
  :L3
  .line 125
    sput-boolean v1, Lcom/innioasis/ipp/AlbumInfo;->saveAsked:Z
  .line 126
    monitor-exit v0
  :L4
  .line 127
    if-eqz v2, :L5
    new-instance v0, Lcom/innioasis/ipp/AlbumInfo$Save;
    invoke-direct { v0 }, Lcom/innioasis/ipp/AlbumInfo$Save;-><init>()V
    const-wide/16 v1, 5000
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Albums;->later(Ljava/lang/Runnable;J)V
  :L5
  .line 128
    return-void
  :L6
  .line 126
    move-exception v1
  :L7
    monitor-exit v0
  :L8
    throw v1
.end method

.method private static write()V
  .catchall { :L0 .. :L1 } :L24
  .catchall { :L1 .. :L2 } :L21
  .catchall { :L2 .. :L3 } :L24
  .catchall { :L5 .. :L8 } :L21
  .catchall { :L8 .. :L9 } :L18
  .catchall { :L10 .. :L11 } :L24
  .catchall { :L12 .. :L17 } :L18
  .catchall { :L19 .. :L20 } :L24
  .catchall { :L22 .. :L23 } :L21
  .catchall { :L23 .. :L25 } :L24
  .registers 9
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
  .line 93
    new-instance v5, Ljava/lang/StringBuilder;
    invoke-direct { v5 }, Ljava/lang/StringBuilder;-><init>()V
  .line 94
    const/4 v6, 0
  :L13
    array-length v7, v3
    if-ge v6, v7, :L16
  .line 95
    aget-object v7, v4, v6
    check-cast v7, [Ljava/lang/String;
  .line 96
    if-nez v7, :L14
    goto :L15
  :L14
  .line 97
    aget-object v8, v3, v6
    check-cast v8, Ljava/lang/String;
    invoke-virtual { v5, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 98
    const-string v8, "\t"
    invoke-virtual { v5, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 99
    aget-object v8, v7, v2
    invoke-virtual { v5, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 100
    const-string v8, "\t"
    invoke-virtual { v5, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 101
    const/4 v8, 1
    aget-object v7, v7, v8
    invoke-virtual { v5, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 102
    const-string v7, "\n"
    invoke-virtual { v5, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L15
  .line 94
    add-int/lit8 v6, v6, 1
    goto :L13
  :L16
  .line 104
    new-instance v2, Ljava/io/FileOutputStream;
    invoke-direct { v2, v1 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  .line 105
    invoke-virtual { v5 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/String;->getBytes()[B
    move-result-object v1
    invoke-virtual { v2, v1 }, Ljava/io/FileOutputStream;->write([B)V
  .line 106
    invoke-virtual { v2 }, Ljava/io/FileOutputStream;->close()V
  :L17
  .line 108
    goto :L19
  :L18
  .line 107
    move-exception v1
  :L19
  .line 109
    monitor-exit v0
  :L20
  .line 110
    return-void
  :L21
  .line 87
    move-exception v2
  :L22
    monitor-exit v1
  :L23
    throw v2
  :L24
  .line 109
    move-exception v1
    monitor-exit v0
  :L25
    goto :L27
  :L26
    throw v1
  :L27
    goto :L26
.end method
