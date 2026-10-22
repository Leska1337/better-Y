.class public final Lcom/innioasis/ipp/AlbumInfo;
.super Ljava/lang/Object;
.source "AlbumInfo.java"

.field private static loaded:Z

.field private final static map:Ljava/util/Hashtable;

.method static constructor <clinit>()V
  .registers 1
  .line 24
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 22
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static artist(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 108
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 109
    const/4 v0, 0
    if-nez p0, :L0
  .line 110
    return-object v0
  :L0
  .line 112
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->load()V
  .line 113
    sget-object v1, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, [Ljava/lang/String;
  .line 114
    if-nez p0, :L1
  .line 115
    return-object v0
  :L1
  .line 117
    const/4 v0, 0
    aget-object p0, p0, v0
    return-object p0
.end method

.method private static bad(Ljava/lang/String;)Z
  .registers 2
  .line 29
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

.method public static clear()V
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  .line 191
    sget-object v0, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 192
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/AlbumInfo;->loaded:Z
  :L0
  .line 194
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->file()Ljava/io/File;
    move-result-object v0
  .line 195
    if-eqz v0, :L1
  .line 196
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  :L1
  .line 199
    goto :L3
  :L2
  .line 198
    move-exception v0
  :L3
  .line 200
    return-void
.end method

.method private static file()Ljava/io/File;
  .registers 3
  .line 33
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 34
    const/4 v1, 0
    if-nez v0, :L0
  .line 35
    return-object v1
  :L0
  .line 37
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 38
    if-nez v0, :L1
  .line 39
    return-object v1
  :L1
  .line 41
    new-instance v1, Ljava/io/File;
    const-string v2, "ipp_albums.txt"
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    return-object v1
.end method

.method private static load()V
  .catchall { :L1 .. :L7 } :L10
  .registers 9
  .line 46
    sget-boolean v0, Lcom/innioasis/ipp/AlbumInfo;->loaded:Z
    if-eqz v0, :L0
  .line 47
    return-void
  :L0
  .line 49
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/AlbumInfo;->loaded:Z
  :L1
  .line 51
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->file()Ljava/io/File;
    move-result-object v1
  .line 52
    if-eqz v1, :L9
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-nez v2, :L2
    goto :L9
  :L2
  .line 55
    new-instance v2, Ljava/io/FileInputStream;
    invoke-direct { v2, v1 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 56
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->available()I
    move-result v1
    new-array v1, v1, [B
  .line 57
    invoke-virtual { v2, v1 }, Ljava/io/FileInputStream;->read([B)I
  .line 58
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 59
    new-instance v2, Ljava/lang/String;
    invoke-direct { v2, v1 }, Ljava/lang/String;-><init>([B)V
    const-string v1, "\n"
    invoke-virtual { v2, v1 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v1
  .line 60
    const/4 v2, 0
    const/4 v3, 0
  :L3
    array-length v4, v1
    if-ge v3, v4, :L8
  .line 61
    aget-object v4, v1, v3
    const-string v5, "\t"
    invoke-virtual { v4, v5 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v4
  .line 62
    array-length v5, v4
    const/4 v6, 2
    if-ge v5, v6, :L4
  .line 63
    goto :L7
  :L4
  .line 65
    array-length v5, v4
    const/4 v7, 3
    if-lt v5, v7, :L5
    aget-object v5, v4, v6
    goto :L6
  :L5
    const-string v5, ""
  :L6
  .line 66
    sget-object v7, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    aget-object v8, v4, v2
    new-array v6, v6, [Ljava/lang/String;
    aget-object v4, v4, v0
    aput-object v4, v6, v2
    aput-object v5, v6, v0
    invoke-virtual { v7, v8, v6 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L7
  .line 60
    add-int/lit8 v3, v3, 1
    goto :L3
  :L8
  .line 69
    goto :L11
  :L9
  .line 53
    return-void
  :L10
  .line 68
    move-exception v0
  :L11
  .line 70
    return-void
.end method

.method public static path(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 122
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 123
    const/4 v0, 0
    if-nez p0, :L0
  .line 124
    return-object v0
  :L0
  .line 126
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->load()V
  .line 127
    sget-object v1, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, [Ljava/lang/String;
  .line 128
    if-nez p0, :L1
  .line 129
    return-object v0
  :L1
  .line 131
    const/4 v1, 1
    aget-object p0, p0, v1
  .line 132
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-nez v1, :L2
  .line 133
    return-object v0
  :L2
  .line 135
    return-object p0
.end method

.method static prune(Ljava/util/Set;Lcom/innioasis/ipp/Stale$Keys;Z)J
  .catchall { :L0 .. :L8 } :L7
  .registers 15
  .line 167
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->load()V
  .line 168
    nop
  .line 169
    sget-object v0, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    monitor-enter v0
  :L0
  .line 170
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 171
    invoke-virtual { v0 }, Ljava/util/Hashtable;->entrySet()Ljava/util/Set;
    move-result-object v2
    invoke-interface { v2 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v2
    const-wide/16 v3, 0
  :L1
  .line 172
    invoke-interface { v2 }, Ljava/util/Iterator;->hasNext()Z
    move-result v5
    const/4 v6, 0
    if-eqz v5, :L3
  .line 173
    invoke-interface { v2 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/util/Map$Entry;
  .line 174
    invoke-interface { v5 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v7
    check-cast v7, [Ljava/lang/String;
  .line 175
    invoke-interface { v5 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v8
    invoke-interface { p0, v8 }, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    move-result v8
    const/4 v9, 1
    if-eqz v8, :L2
    aget-object v8, v7, v9
  .line 176
    invoke-virtual { v8 }, Ljava/lang/String;->length()I
    move-result v8
    if-eqz v8, :L1
    aget-object v8, v7, v9
    invoke-static { v8 }, Lcom/innioasis/ipp/Stale$Keys;->of(Ljava/lang/String;)J
    move-result-wide v10
    invoke-virtual { p1, v10, v11 }, Lcom/innioasis/ipp/Stale$Keys;->has(J)Z
    move-result v8
    if-eqz v8, :L2
  .line 177
    goto :L1
  :L2
  .line 179
    invoke-interface { v5 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v8
    invoke-virtual { v1, v8 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 180
    invoke-interface { v5 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;
    invoke-direct { v8 }, Ljava/lang/StringBuilder;-><init>()V
    aget-object v6, v7, v6
    invoke-virtual { v8, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    const-string v8, "\t"
    invoke-virtual { v6, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    aget-object v7, v7, v9
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v6 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v6
    invoke-static { v5, v6 }, Lcom/innioasis/ipp/Stale;->line(Ljava/lang/String;Ljava/lang/String;)J
    move-result-wide v5
    add-long/2addr v3, v5
  .line 181
    goto :L1
  :L3
  .line 182
    if-eqz p2, :L6
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result p0
    if-nez p0, :L6
  .line 183
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
  .line 184
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->saveLocked()V
  :L6
  .line 186
    monitor-exit v0
  .line 187
    return-wide v3
  :L7
  .line 186
    move-exception p0
    monitor-exit v0
  :L8
    goto :L10
  :L9
    throw p0
  :L10
    goto :L9
.end method

.method public static put(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
  .registers 8
  .line 140
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 141
    if-nez p0, :L0
  .line 142
    return-void
  :L0
  .line 144
    const-string v0, ""
    if-nez p1, :L1
  .line 145
    move-object p1, v0
  :L1
  .line 147
    if-nez p2, :L2
  .line 148
    move-object p2, v0
  :L2
  .line 150
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
  .line 153
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->load()V
  .line 154
    sget-object v0, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    invoke-virtual { v0, p0 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, [Ljava/lang/String;
  .line 155
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
  .line 156
    return-void
  :L4
  .line 158
    const/4 v1, 2
    new-array v1, v1, [Ljava/lang/String;
    aput-object p1, v1, v3
    aput-object p2, v1, v2
    invoke-virtual { v0, p0, v1 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 159
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->save()V
  .line 160
    return-void
  :L5
  .line 151
    return-void
.end method

.method private static save()V
  .catchall { :L0 .. :L2 } :L1
  .registers 2
  .line 98
    sget-object v0, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    monitor-enter v0
  :L0
  .line 99
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->saveLocked()V
  .line 100
    monitor-exit v0
  .line 101
    return-void
  :L1
  .line 100
    move-exception v1
    monitor-exit v0
  :L2
    throw v1
.end method

.method private static saveLocked()V
  .catchall { :L0 .. :L4 } :L5
  .registers 6
  .line 74
    const-string v0, "\t"
  :L0
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->file()Ljava/io/File;
    move-result-object v1
  .line 75
    if-nez v1, :L1
  .line 76
    return-void
  :L1
  .line 78
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
  .line 79
    sget-object v3, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    invoke-virtual { v3 }, Ljava/util/Hashtable;->entrySet()Ljava/util/Set;
    move-result-object v3
    invoke-interface { v3 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v3
  :L2
  .line 80
    invoke-interface { v3 }, Ljava/util/Iterator;->hasNext()Z
    move-result v4
    if-eqz v4, :L3
  .line 81
    invoke-interface { v3 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/util/Map$Entry;
  .line 82
    invoke-interface { v4 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v5
    check-cast v5, [Ljava/lang/String;
  .line 83
    invoke-interface { v4 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 84
    invoke-virtual { v2, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 85
    const/4 v4, 0
    aget-object v4, v5, v4
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 86
    invoke-virtual { v2, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 87
    const/4 v4, 1
    aget-object v4, v5, v4
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 88
    const-string v4, "\n"
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 89
    goto :L2
  :L3
  .line 90
    new-instance v0, Ljava/io/FileOutputStream;
    invoke-direct { v0, v1 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  .line 91
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/String;->getBytes()[B
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/io/FileOutputStream;->write([B)V
  .line 92
    invoke-virtual { v0 }, Ljava/io/FileOutputStream;->close()V
  :L4
  .line 94
    goto :L6
  :L5
  .line 93
    move-exception v0
  :L6
  .line 95
    return-void
.end method
