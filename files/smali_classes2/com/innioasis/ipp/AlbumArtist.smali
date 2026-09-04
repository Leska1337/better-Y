.class public final Lcom/innioasis/ipp/AlbumArtist;
.super Ljava/lang/Object;
.source "AlbumArtist.java"

.field private final static SEP:C = '\t'

.field private static dirty:Z

.field private static loaded:Z

.field private final static map:Ljava/util/HashMap;

.method static constructor <clinit>()V
  .registers 1
  .line 43
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/AlbumArtist;->map:Ljava/util/HashMap;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 40
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static clear()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 178
    sget-object v0, Lcom/innioasis/ipp/AlbumArtist;->map:Ljava/util/HashMap;
    invoke-virtual { v0 }, Ljava/util/HashMap;->clear()V
  .line 179
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/AlbumArtist;->loaded:Z
  .line 180
    sput-boolean v0, Lcom/innioasis/ipp/AlbumArtist;->dirty:Z
  :L0
  .line 182
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->file()Ljava/io/File;
    move-result-object v0
  .line 183
    if-eqz v0, :L1
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v1
    if-eqz v1, :L1
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  :L1
  .line 186
    goto :L3
  :L2
  .line 184
    move-exception v0
  :L3
  .line 187
    return-void
.end method

.method private static file()Ljava/io/File;
  .registers 3
  .line 50
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 51
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 52
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 53
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
  .line 164
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->save()V
  .line 165
    return-void
.end method

.method public static forget(Ljava/lang/String;)V
  .registers 2
  .line 172
    if-nez p0, :L0
    return-void
  :L0
  .line 173
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->load()V
  .line 174
    sget-object v0, Lcom/innioasis/ipp/AlbumArtist;->map:Ljava/util/HashMap;
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    if-eqz p0, :L1
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/AlbumArtist;->dirty:Z
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->save()V
  :L1
  .line 175
    return-void
.end method

.method public static get(Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 103
    if-nez p0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 104
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->load()V
  .line 105
    sget-object v0, Lcom/innioasis/ipp/AlbumArtist;->map:Ljava/util/HashMap;
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Ljava/lang/String;
    return-object p0
.end method

.method public static line(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 200
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumArtist;->get(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 201
    if-eqz p0, :L0
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v0
    if-lez v0, :L0
    return-object p0
  :L0
  .line 202
    invoke-static { p1 }, Lcom/innioasis/ipp/Feat;->first(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static load()V
  .catchall { :L1 .. :L5 } :L8
  .registers 7
  .line 57
    sget-boolean v0, Lcom/innioasis/ipp/AlbumArtist;->loaded:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 58
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/AlbumArtist;->loaded:Z
  :L1
  .line 60
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->file()Ljava/io/File;
    move-result-object v0
  .line 61
    if-eqz v0, :L7
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v1
    if-nez v1, :L2
    goto :L7
  :L2
  .line 62
    new-instance v1, Ljava/io/FileInputStream;
    invoke-direct { v1, v0 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 63
    invoke-virtual { v1 }, Ljava/io/FileInputStream;->available()I
    move-result v0
    new-array v0, v0, [B
  .line 64
    invoke-virtual { v1, v0 }, Ljava/io/FileInputStream;->read([B)I
  .line 65
    invoke-virtual { v1 }, Ljava/io/FileInputStream;->close()V
  .line 66
    new-instance v1, Ljava/lang/String;
    const-string v2, "UTF-8"
    invoke-direct { v1, v0, v2 }, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    const-string v0, "\n"
    invoke-virtual { v1, v0 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v0
  .line 67
    const/4 v1, 0
    const/4 v2, 0
  :L3
    array-length v3, v0
    if-ge v2, v3, :L6
  .line 68
    aget-object v3, v0, v2
  .line 69
    const/16 v4, 9
    invoke-virtual { v3, v4 }, Ljava/lang/String;->indexOf(I)I
    move-result v4
  .line 70
    if-gtz v4, :L4
    goto :L5
  :L4
  .line 71
    sget-object v5, Lcom/innioasis/ipp/AlbumArtist;->map:Ljava/util/HashMap;
    invoke-virtual { v3, v1, v4 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v6
    add-int/lit8 v4, v4, 1
    invoke-virtual { v3, v4 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v5, v6, v3 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L5
  .line 67
    add-int/lit8 v2, v2, 1
    goto :L3
  :L6
  .line 75
    goto :L9
  :L7
  .line 61
    return-void
  :L8
  .line 73
    move-exception v0
  :L9
  .line 76
    return-void
.end method

.method public static needsRead(Ljava/lang/String;)Z
  .registers 1
  .line 110
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
  .registers 3
  .line 150
    if-nez p0, :L0
    return-void
  :L0
  .line 151
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->load()V
  .line 152
    sget-object v0, Lcom/innioasis/ipp/AlbumArtist;->map:Ljava/util/HashMap;
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    if-nez p1, :L1
    const-string p1, ""
    goto :L2
  :L1
    invoke-virtual { p1 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object p1
  :L2
    invoke-virtual { v0, p0, p1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 153
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/AlbumArtist;->dirty:Z
  .line 154
    return-void
.end method

.method public static read(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L2 .. :L3 } :L4
  .catchall { :L5 .. :L6 } :L7
  .registers 4
  .line 119
    const-string v0, ""
    if-nez p0, :L0
    return-object v0
  :L0
  .line 120
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->load()V
  .line 122
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 123
    sget-object v1, Lcom/innioasis/ipp/AlbumArtist;->map:Ljava/util/HashMap;
    invoke-virtual { v1, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/lang/String;
  .line 124
    if-eqz v1, :L1
    return-object v1
  :L1
  .line 125
    nop
  .line 126
    if-eqz p1, :L8
  .line 127
    new-instance v1, Landroid/media/MediaMetadataRetriever;
    invoke-direct { v1 }, Landroid/media/MediaMetadataRetriever;-><init>()V
  :L2
  .line 129
    invoke-virtual { v1, p1 }, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;)V
  .line 130
    const/16 p1, 13
    invoke-virtual { v1, p1 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object p1
  .line 131
    if-eqz p1, :L3
    invoke-virtual { p1 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0
  :L3
  .line 134
    goto :L5
  :L4
  .line 132
    move-exception p1
  .line 133
    nop
  :L5
  .line 135
    invoke-virtual { v1 }, Landroid/media/MediaMetadataRetriever;->release()V
  :L6
    goto :L8
  :L7
    move-exception p1
  :L8
  .line 137
    sget-object p1, Lcom/innioasis/ipp/AlbumArtist;->map:Ljava/util/HashMap;
    invoke-virtual { p1, p0, v0 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 138
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/AlbumArtist;->dirty:Z
  .line 139
    return-object v0
.end method

.method public static readAndSave(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 157
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/AlbumArtist;->read(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 158
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->save()V
  .line 159
    return-object p0
.end method

.method private static save()V
  .catchall { :L0 .. :L5 } :L6
  .registers 8
  .line 79
    sget-boolean v0, Lcom/innioasis/ipp/AlbumArtist;->dirty:Z
    if-nez v0, :L0
    return-void
  :L0
  .line 81
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->file()Ljava/io/File;
    move-result-object v0
  .line 82
    if-nez v0, :L1
    return-void
  :L1
  .line 83
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
  .line 84
    sget-object v2, Lcom/innioasis/ipp/AlbumArtist;->map:Ljava/util/HashMap;
    invoke-virtual { v2 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v2
    invoke-interface { v2 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v2
  :L2
  .line 85
    invoke-interface { v2 }, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :L4
  .line 86
    invoke-interface { v2 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/util/Map$Entry;
  .line 87
    invoke-interface { v3 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
  .line 88
    invoke-interface { v3 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
  .line 89
    if-eqz v4, :L2
    if-eqz v3, :L2
    const/16 v5, 9
    invoke-virtual { v4, v5 }, Ljava/lang/String;->indexOf(I)I
    move-result v6
    if-gez v6, :L2
    const/16 v6, 10
    invoke-virtual { v3, v6 }, Ljava/lang/String;->indexOf(I)I
    move-result v7
    if-ltz v7, :L3
    goto :L2
  :L3
  .line 90
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3, v6 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 91
    goto :L2
  :L4
  .line 92
    new-instance v2, Ljava/io/FileOutputStream;
    invoke-direct { v2, v0 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  .line 93
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    const-string v1, "UTF-8"
    invoke-virtual { v0, v1 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object v0
    invoke-virtual { v2, v0 }, Ljava/io/FileOutputStream;->write([B)V
  .line 94
    invoke-virtual { v2 }, Ljava/io/FileOutputStream;->close()V
  .line 95
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/AlbumArtist;->dirty:Z
  :L5
  .line 98
    goto :L7
  :L6
  .line 96
    move-exception v0
  :L7
  .line 99
    return-void
.end method
