.class public final Lcom/innioasis/ipp/AlbumInfo;
.super Ljava/lang/Object;
.source "AlbumInfo.java"

.field private static loaded:Z

.field private final static map:Ljava/util/Hashtable;

.method static constructor <clinit>()V
  .registers 1
  .line 32
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 30
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static artist(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 121
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 122
    const/4 v0, 0
    if-nez p0, :L0
  .line 123
    return-object v0
  :L0
  .line 125
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->load()V
  .line 126
    sget-object v1, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, [Ljava/lang/String;
  .line 127
    if-nez p0, :L1
  .line 128
    return-object v0
  :L1
  .line 130
    const/4 v0, 0
    aget-object p0, p0, v0
    return-object p0
.end method

.method private static bad(Ljava/lang/String;)Z
  .registers 2
  .line 37
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
  .line 176
    sget-object v0, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 177
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/AlbumInfo;->loaded:Z
  :L0
  .line 179
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->file()Ljava/io/File;
    move-result-object v0
  .line 180
    if-eqz v0, :L1
  .line 181
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  :L1
  .line 184
    goto :L3
  :L2
  .line 183
    move-exception v0
  :L3
  .line 185
    return-void
.end method

.method private static file()Ljava/io/File;
  .registers 3
  .line 41
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 42
    const/4 v1, 0
    if-nez v0, :L0
  .line 43
    return-object v1
  :L0
  .line 45
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 46
    if-nez v0, :L1
  .line 47
    return-object v1
  :L1
  .line 49
    new-instance v1, Ljava/io/File;
    const-string v2, "ipp_albums.txt"
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    return-object v1
.end method

.method private static load()V
  .catchall { :L1 .. :L7 } :L10
  .registers 9
  .line 54
    sget-boolean v0, Lcom/innioasis/ipp/AlbumInfo;->loaded:Z
    if-eqz v0, :L0
  .line 55
    return-void
  :L0
  .line 57
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/AlbumInfo;->loaded:Z
  :L1
  .line 59
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->file()Ljava/io/File;
    move-result-object v1
  .line 60
    if-eqz v1, :L9
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-nez v2, :L2
    goto :L9
  :L2
  .line 63
    new-instance v2, Ljava/io/FileInputStream;
    invoke-direct { v2, v1 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 64
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->available()I
    move-result v1
    new-array v1, v1, [B
  .line 65
    invoke-virtual { v2, v1 }, Ljava/io/FileInputStream;->read([B)I
  .line 66
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 67
    new-instance v2, Ljava/lang/String;
    invoke-direct { v2, v1 }, Ljava/lang/String;-><init>([B)V
    const-string v1, "\n"
    invoke-virtual { v2, v1 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v1
  .line 68
    const/4 v2, 0
    const/4 v3, 0
  :L3
    array-length v4, v1
    if-ge v3, v4, :L8
  .line 69
    aget-object v4, v1, v3
    const-string v5, "\t"
    invoke-virtual { v4, v5 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v4
  .line 70
    array-length v5, v4
    const/4 v6, 2
    if-ge v5, v6, :L4
  .line 71
    goto :L7
  :L4
  .line 73
    array-length v5, v4
    const/4 v7, 3
    if-lt v5, v7, :L5
    aget-object v5, v4, v6
    goto :L6
  :L5
    const-string v5, ""
  :L6
  .line 74
    sget-object v7, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    aget-object v8, v4, v2
    new-array v6, v6, [Ljava/lang/String;
    aget-object v4, v4, v0
    aput-object v4, v6, v2
    aput-object v5, v6, v0
    invoke-virtual { v7, v8, v6 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L7
  .line 68
    add-int/lit8 v3, v3, 1
    goto :L3
  :L8
  .line 77
    goto :L11
  :L9
  .line 61
    return-void
  :L10
  .line 76
    move-exception v0
  :L11
  .line 78
    return-void
.end method

.method public static path(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 135
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 136
    const/4 v0, 0
    if-nez p0, :L0
  .line 137
    return-object v0
  :L0
  .line 139
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->load()V
  .line 140
    sget-object v1, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, [Ljava/lang/String;
  .line 141
    if-nez p0, :L1
  .line 142
    return-object v0
  :L1
  .line 144
    const/4 v1, 1
    aget-object p0, p0, v1
  .line 145
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-nez v1, :L2
  .line 146
    return-object v0
  :L2
  .line 148
    return-object p0
.end method

.method public static put(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
  .registers 8
  .line 153
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 154
    if-nez p0, :L0
  .line 155
    return-void
  :L0
  .line 157
    const-string v0, ""
    if-nez p1, :L1
  .line 158
    move-object p1, v0
  :L1
  .line 160
    if-nez p2, :L2
  .line 161
    move-object p2, v0
  :L2
  .line 163
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
  .line 166
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->load()V
  .line 167
    sget-object v0, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    invoke-virtual { v0, p0 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, [Ljava/lang/String;
  .line 168
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
  .line 169
    return-void
  :L4
  .line 171
    const/4 v1, 2
    new-array v1, v1, [Ljava/lang/String;
    aput-object p1, v1, v3
    aput-object p2, v1, v2
    invoke-virtual { v0, p0, v1 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 172
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->save()V
  .line 173
    return-void
  :L5
  .line 164
    return-void
.end method

.method private static save()V
  .catchall { :L0 .. :L2 } :L1
  .registers 2
  .line 106
    sget-object v0, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    monitor-enter v0
  :L0
  .line 107
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->saveLocked()V
  .line 108
    monitor-exit v0
  .line 109
    return-void
  :L1
  .line 108
    move-exception v1
    monitor-exit v0
  :L2
    throw v1
.end method

.method private static saveLocked()V
  .catchall { :L0 .. :L4 } :L5
  .registers 6
  .line 82
    const-string v0, "\t"
  :L0
    invoke-static { }, Lcom/innioasis/ipp/AlbumInfo;->file()Ljava/io/File;
    move-result-object v1
  .line 83
    if-nez v1, :L1
  .line 84
    return-void
  :L1
  .line 86
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
  .line 87
    sget-object v3, Lcom/innioasis/ipp/AlbumInfo;->map:Ljava/util/Hashtable;
    invoke-virtual { v3 }, Ljava/util/Hashtable;->entrySet()Ljava/util/Set;
    move-result-object v3
    invoke-interface { v3 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v3
  :L2
  .line 88
    invoke-interface { v3 }, Ljava/util/Iterator;->hasNext()Z
    move-result v4
    if-eqz v4, :L3
  .line 89
    invoke-interface { v3 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/util/Map$Entry;
  .line 90
    invoke-interface { v4 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v5
    check-cast v5, [Ljava/lang/String;
  .line 91
    invoke-interface { v4 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 92
    invoke-virtual { v2, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 93
    const/4 v4, 0
    aget-object v4, v5, v4
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 94
    invoke-virtual { v2, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 95
    const/4 v4, 1
    aget-object v4, v5, v4
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 96
    const-string v4, "\n"
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 97
    goto :L2
  :L3
  .line 98
    new-instance v0, Ljava/io/FileOutputStream;
    invoke-direct { v0, v1 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  .line 99
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/String;->getBytes()[B
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/io/FileOutputStream;->write([B)V
  .line 100
    invoke-virtual { v0 }, Ljava/io/FileOutputStream;->close()V
  :L4
  .line 102
    goto :L6
  :L5
  .line 101
    move-exception v0
  :L6
  .line 103
    return-void
.end method
