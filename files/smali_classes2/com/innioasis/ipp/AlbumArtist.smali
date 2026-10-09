.class public final Lcom/innioasis/ipp/AlbumArtist;
.super Ljava/lang/Object;
.source "AlbumArtist.java"

.field private final static SEP:C = '\t'

.field private static dirty:Z

.field private static gen:I

.field private static loaded:Z

.field private final static map:Ljava/util/HashMap;

.method static constructor <clinit>()V
  .registers 1
  .line 24
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/AlbumArtist;->map:Ljava/util/HashMap;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 21
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static declared-synchronized clear()V
  .catchall { :L0 .. :L1 } :L5
  .catchall { :L1 .. :L2 } :L3
  .registers 3
    const-class v0, Lcom/innioasis/ipp/AlbumArtist;
    monitor-enter v0
  :L0
  .line 154
    sget-object v1, Lcom/innioasis/ipp/AlbumArtist;->map:Ljava/util/HashMap;
    invoke-virtual { v1 }, Ljava/util/HashMap;->clear()V
  .line 155
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/AlbumArtist;->loaded:Z
  .line 156
    sput-boolean v1, Lcom/innioasis/ipp/AlbumArtist;->dirty:Z
  .line 157
    sget v1, Lcom/innioasis/ipp/AlbumArtist;->gen:I
    add-int/lit8 v1, v1, 1
    sput v1, Lcom/innioasis/ipp/AlbumArtist;->gen:I
  :L1
  .line 159
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->file()Ljava/io/File;
    move-result-object v1
  .line 160
    if-eqz v1, :L2
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-eqz v2, :L2
    invoke-virtual { v1 }, Ljava/io/File;->delete()Z
  :L2
  .line 162
    goto :L4
  :L3
  .line 161
    move-exception v1
  :L4
  .line 163
    monitor-exit v0
    return-void
  :L5
  .line 153
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method private static file()Ljava/io/File;
  .registers 3
  .line 38
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 39
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 40
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 41
    if-nez v0, :L1
    goto :L2
  :L1
    new-instance v1, Ljava/io/File;
    const-string v2, "ipp_albumartist.txt"
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  :L2
    return-object v1
.end method

.method public static flush()V
  .registers 0
  .line 141
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->save()V
  .line 142
    return-void
.end method

.method public static forget(Ljava/lang/String;)V
  .catchall { :L1 .. :L4 } :L3
  .registers 3
  .line 145
    if-nez p0, :L0
    return-void
  :L0
  .line 146
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 147
    const-class v0, Lcom/innioasis/ipp/AlbumArtist;
    monitor-enter v0
  :L1
  .line 148
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->load()V
  .line 149
    sget-object v1, Lcom/innioasis/ipp/AlbumArtist;->map:Ljava/util/HashMap;
    invoke-virtual { v1, p0 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    if-eqz p0, :L2
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/AlbumArtist;->dirty:Z
    sget v1, Lcom/innioasis/ipp/AlbumArtist;->gen:I
    add-int/2addr v1, p0
    sput v1, Lcom/innioasis/ipp/AlbumArtist;->gen:I
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->save()V
  :L2
  .line 150
    monitor-exit v0
  .line 151
    return-void
  :L3
  .line 150
    move-exception p0
    monitor-exit v0
  :L4
    throw p0
.end method

.method public static declared-synchronized gen()I
  .catchall { :L0 .. :L1 } :L2
  .registers 2
    const-class v0, Lcom/innioasis/ipp/AlbumArtist;
    monitor-enter v0
  :L0
  .line 34
    sget v1, Lcom/innioasis/ipp/AlbumArtist;->gen:I
  :L1
    monitor-exit v0
    return v1
  :L2
  .line 34
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method public static get(Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L1 .. :L3 } :L2
  .registers 3
  .line 94
    if-nez p0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 95
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 96
    const-class v0, Lcom/innioasis/ipp/AlbumArtist;
    monitor-enter v0
  :L1
  .line 97
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->load()V
  .line 98
    sget-object v1, Lcom/innioasis/ipp/AlbumArtist;->map:Ljava/util/HashMap;
    invoke-virtual { v1, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Ljava/lang/String;
    monitor-exit v0
    return-object p0
  :L2
  .line 99
    move-exception p0
    monitor-exit v0
  :L3
    throw p0
.end method

.method public static line(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 170
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumArtist;->get(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/AlbumArtists;->of(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static declared-synchronized load()V
  .catchall { :L0 .. :L1 } :L13
  .catchall { :L3 .. :L4 } :L13
  .catchall { :L4 .. :L8 } :L11
  .registers 8
    const-class v0, Lcom/innioasis/ipp/AlbumArtist;
    monitor-enter v0
  :L0
  .line 45
    sget-boolean v1, Lcom/innioasis/ipp/AlbumArtist;->loaded:Z
  :L1
    if-eqz v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 46
    const/4 v1, 1
  :L3
    sput-boolean v1, Lcom/innioasis/ipp/AlbumArtist;->loaded:Z
  :L4
  .line 48
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->file()Ljava/io/File;
    move-result-object v1
  .line 49
    if-eqz v1, :L10
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-nez v2, :L5
    goto :L10
  :L5
  .line 50
    new-instance v2, Ljava/io/FileInputStream;
    invoke-direct { v2, v1 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 51
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->available()I
    move-result v1
    new-array v1, v1, [B
  .line 52
    invoke-virtual { v2, v1 }, Ljava/io/FileInputStream;->read([B)I
  .line 53
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 54
    new-instance v2, Ljava/lang/String;
    const-string v3, "UTF-8"
    invoke-direct { v2, v1, v3 }, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    const-string v1, "\n"
    invoke-virtual { v2, v1 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v1
  .line 55
    const/4 v2, 0
    const/4 v3, 0
  :L6
    array-length v4, v1
    if-ge v3, v4, :L9
  .line 56
    aget-object v4, v1, v3
  .line 57
    const/16 v5, 9
    invoke-virtual { v4, v5 }, Ljava/lang/String;->indexOf(I)I
    move-result v5
  .line 58
    if-gtz v5, :L7
    goto :L8
  :L7
  .line 59
    sget-object v6, Lcom/innioasis/ipp/AlbumArtist;->map:Ljava/util/HashMap;
    invoke-virtual { v4, v2, v5 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v7
    add-int/lit8 v5, v5, 1
    invoke-virtual { v4, v5 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v6, v7, v4 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L8
  .line 55
    add-int/lit8 v3, v3, 1
    goto :L6
  :L9
  .line 62
    goto :L12
  :L10
  .line 49
    monitor-exit v0
    return-void
  :L11
  .line 61
    move-exception v1
  :L12
  .line 63
    monitor-exit v0
    return-void
  :L13
  .line 44
    move-exception v1
    monitor-exit v0
    goto :L15
  :L14
    throw v1
  :L15
    goto :L14
.end method

.method public static needsRead(Ljava/lang/String;)Z
  .registers 1
  .line 103
    if-eqz p0, :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumArtist;->get(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    if-nez p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method public static put(Ljava/lang/String;Ljava/lang/String;)V
  .catchall { :L3 .. :L6 } :L5
  .registers 4
  .line 123
    if-nez p0, :L0
    return-void
  :L0
  .line 124
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 125
    if-nez p1, :L1
    const-string p1, ""
    goto :L2
  :L1
    invoke-virtual { p1 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p1
  :L2
  .line 126
    const-class v0, Lcom/innioasis/ipp/AlbumArtist;
    monitor-enter v0
  :L3
  .line 127
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->load()V
  .line 128
    sget-object v1, Lcom/innioasis/ipp/AlbumArtist;->map:Ljava/util/HashMap;
    invoke-virtual { v1, p0, p1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    invoke-virtual { p1, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L4
    monitor-exit v0
    return-void
  :L4
  .line 129
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/AlbumArtist;->dirty:Z
  .line 130
    sget p1, Lcom/innioasis/ipp/AlbumArtist;->gen:I
    add-int/2addr p1, p0
    sput p1, Lcom/innioasis/ipp/AlbumArtist;->gen:I
  .line 131
    monitor-exit v0
  .line 132
    return-void
  :L5
  .line 131
    move-exception p0
    monitor-exit v0
  :L6
    throw p0
.end method

.method public static read(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .registers 4
  .line 108
    const-string v0, ""
    if-nez p0, :L0
    return-object v0
  :L0
  .line 109
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumArtist;->get(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
  .line 110
    if-eqz v1, :L1
    return-object v1
  :L1
  .line 112
    nop
  .line 113
    if-eqz p1, :L2
  .line 114
    const/4 v1, 0
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/Meta;->read(Ljava/lang/String;Z)Lcom/innioasis/ipp/Meta$Info;
    move-result-object p1
    iget-object p1, p1, Lcom/innioasis/ipp/Meta$Info;->albumArtist:Ljava/lang/String;
  .line 115
    if-eqz p1, :L2
    invoke-virtual { p1 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0
  :L2
  .line 117
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/AlbumArtist;->put(Ljava/lang/String;Ljava/lang/String;)V
  .line 118
    return-object v0
.end method

.method public static readAndSave(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 135
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/AlbumArtist;->read(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 136
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->save()V
  .line 137
    return-object p0
.end method

.method private static declared-synchronized save()V
  .catchall { :L0 .. :L1 } :L11
  .catchall { :L2 .. :L3 } :L9
  .catchall { :L4 .. :L8 } :L9
  .registers 9
    const-class v0, Lcom/innioasis/ipp/AlbumArtist;
    monitor-enter v0
  :L0
  .line 71
    sget-boolean v1, Lcom/innioasis/ipp/AlbumArtist;->dirty:Z
  :L1
    if-nez v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 73
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->file()Ljava/io/File;
    move-result-object v1
  :L3
  .line 74
    if-nez v1, :L4
    monitor-exit v0
    return-void
  :L4
  .line 75
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
  .line 76
    sget-object v3, Lcom/innioasis/ipp/AlbumArtist;->map:Ljava/util/HashMap;
    invoke-virtual { v3 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v3
    invoke-interface { v3 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v3
  :L5
  .line 77
    invoke-interface { v3 }, Ljava/util/Iterator;->hasNext()Z
    move-result v4
    if-eqz v4, :L7
  .line 78
    invoke-interface { v3 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/util/Map$Entry;
  .line 79
    invoke-interface { v4 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/String;
  .line 80
    invoke-interface { v4 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
  .line 81
    if-eqz v5, :L5
    if-eqz v4, :L5
    const/16 v6, 9
    invoke-virtual { v5, v6 }, Ljava/lang/String;->indexOf(I)I
    move-result v7
    if-gez v7, :L5
    const/16 v7, 10
    invoke-virtual { v4, v7 }, Ljava/lang/String;->indexOf(I)I
    move-result v8
    if-ltz v8, :L6
    goto :L5
  :L6
  .line 82
    invoke-virtual { v2, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5, v6 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, v7 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 83
    goto :L5
  :L7
  .line 84
    new-instance v3, Ljava/io/FileOutputStream;
    invoke-direct { v3, v1 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  .line 85
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    const-string v2, "UTF-8"
    invoke-virtual { v1, v2 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object v1
    invoke-virtual { v3, v1 }, Ljava/io/FileOutputStream;->write([B)V
  .line 86
    invoke-virtual { v3 }, Ljava/io/FileOutputStream;->close()V
  .line 87
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/AlbumArtist;->dirty:Z
  :L8
  .line 89
    goto :L10
  :L9
  .line 88
    move-exception v1
  :L10
  .line 90
    monitor-exit v0
    return-void
  :L11
  .line 70
    move-exception v1
    monitor-exit v0
    goto :L13
  :L12
    throw v1
  :L13
    goto :L12
.end method

.method public static declared-synchronized warm()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
    const-class v0, Lcom/innioasis/ipp/AlbumArtist;
    monitor-enter v0
  :L0
  .line 67
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->load()V
  :L1
  .line 68
    monitor-exit v0
    return-void
  :L2
  .line 66
    move-exception v1
    monitor-exit v0
    throw v1
.end method
