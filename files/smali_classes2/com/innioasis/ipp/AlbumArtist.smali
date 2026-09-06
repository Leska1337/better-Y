.class public final Lcom/innioasis/ipp/AlbumArtist;
.super Ljava/lang/Object;
.source "AlbumArtist.java"

.field private final static SEP:C = '\t'

.field private static dirty:Z

.field private static loaded:Z

.field private final static map:Ljava/util/HashMap;

.method static constructor <clinit>()V
  .registers 1
  .line 42
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/AlbumArtist;->map:Ljava/util/HashMap;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 39
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static clear()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 170
    sget-object v0, Lcom/innioasis/ipp/AlbumArtist;->map:Ljava/util/HashMap;
    invoke-virtual { v0 }, Ljava/util/HashMap;->clear()V
  .line 171
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/AlbumArtist;->loaded:Z
  .line 172
    sput-boolean v0, Lcom/innioasis/ipp/AlbumArtist;->dirty:Z
  :L0
  .line 174
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->file()Ljava/io/File;
    move-result-object v0
  .line 175
    if-eqz v0, :L1
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v1
    if-eqz v1, :L1
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  :L1
  .line 178
    goto :L3
  :L2
  .line 176
    move-exception v0
  :L3
  .line 179
    return-void
.end method

.method private static file()Ljava/io/File;
  .registers 3
  .line 49
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 50
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 51
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 52
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
  .line 156
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->save()V
  .line 157
    return-void
.end method

.method public static forget(Ljava/lang/String;)V
  .registers 2
  .line 164
    if-nez p0, :L0
    return-void
  :L0
  .line 165
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->load()V
  .line 166
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
  .line 167
    return-void
.end method

.method public static get(Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 102
    if-nez p0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 103
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->load()V
  .line 104
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
  .line 192
    invoke-static { p0 }, Lcom/innioasis/ipp/AlbumArtist;->get(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 193
    if-eqz p0, :L0
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v0
    if-lez v0, :L0
    return-object p0
  :L0
  .line 194
    invoke-static { p1 }, Lcom/innioasis/ipp/Feat;->first(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static load()V
  .catchall { :L1 .. :L5 } :L8
  .registers 7
  .line 56
    sget-boolean v0, Lcom/innioasis/ipp/AlbumArtist;->loaded:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 57
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/AlbumArtist;->loaded:Z
  :L1
  .line 59
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->file()Ljava/io/File;
    move-result-object v0
  .line 60
    if-eqz v0, :L7
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v1
    if-nez v1, :L2
    goto :L7
  :L2
  .line 61
    new-instance v1, Ljava/io/FileInputStream;
    invoke-direct { v1, v0 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 62
    invoke-virtual { v1 }, Ljava/io/FileInputStream;->available()I
    move-result v0
    new-array v0, v0, [B
  .line 63
    invoke-virtual { v1, v0 }, Ljava/io/FileInputStream;->read([B)I
  .line 64
    invoke-virtual { v1 }, Ljava/io/FileInputStream;->close()V
  .line 65
    new-instance v1, Ljava/lang/String;
    const-string v2, "UTF-8"
    invoke-direct { v1, v0, v2 }, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    const-string v0, "\n"
    invoke-virtual { v1, v0 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v0
  .line 66
    const/4 v1, 0
    const/4 v2, 0
  :L3
    array-length v3, v0
    if-ge v2, v3, :L6
  .line 67
    aget-object v3, v0, v2
  .line 68
    const/16 v4, 9
    invoke-virtual { v3, v4 }, Ljava/lang/String;->indexOf(I)I
    move-result v4
  .line 69
    if-gtz v4, :L4
    goto :L5
  :L4
  .line 70
    sget-object v5, Lcom/innioasis/ipp/AlbumArtist;->map:Ljava/util/HashMap;
    invoke-virtual { v3, v1, v4 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v6
    add-int/lit8 v4, v4, 1
    invoke-virtual { v3, v4 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v5, v6, v3 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L5
  .line 66
    add-int/lit8 v2, v2, 1
    goto :L3
  :L6
  .line 74
    goto :L9
  :L7
  .line 60
    return-void
  :L8
  .line 72
    move-exception v0
  :L9
  .line 75
    return-void
.end method

.method public static needsRead(Ljava/lang/String;)Z
  .registers 1
  .line 109
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
  .line 142
    if-nez p0, :L0
    return-void
  :L0
  .line 143
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->load()V
  .line 144
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
  .line 145
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/AlbumArtist;->dirty:Z
  .line 146
    return-void
.end method

.method public static read(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .registers 5
  .line 118
    const-string v0, ""
    if-nez p0, :L0
    return-object v0
  :L0
  .line 119
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->load()V
  .line 121
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 122
    sget-object v1, Lcom/innioasis/ipp/AlbumArtist;->map:Ljava/util/HashMap;
    invoke-virtual { v1, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/String;
  .line 123
    if-eqz v2, :L1
    return-object v2
  :L1
  .line 124
    nop
  .line 125
    if-eqz p1, :L2
  .line 126
    const/4 v2, 0
    invoke-static { p1, v2 }, Lcom/innioasis/ipp/Meta;->read(Ljava/lang/String;Z)Lcom/innioasis/ipp/Meta$Info;
    move-result-object p1
    iget-object p1, p1, Lcom/innioasis/ipp/Meta$Info;->albumArtist:Ljava/lang/String;
  .line 127
    if-eqz p1, :L2
    invoke-virtual { p1 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0
  :L2
  .line 129
    invoke-virtual { v1, p0, v0 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 130
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/AlbumArtist;->dirty:Z
  .line 131
    return-object v0
.end method

.method public static readAndSave(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 149
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/AlbumArtist;->read(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 150
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->save()V
  .line 151
    return-object p0
.end method

.method private static save()V
  .catchall { :L0 .. :L5 } :L6
  .registers 8
  .line 78
    sget-boolean v0, Lcom/innioasis/ipp/AlbumArtist;->dirty:Z
    if-nez v0, :L0
    return-void
  :L0
  .line 80
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->file()Ljava/io/File;
    move-result-object v0
  .line 81
    if-nez v0, :L1
    return-void
  :L1
  .line 82
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
  .line 83
    sget-object v2, Lcom/innioasis/ipp/AlbumArtist;->map:Ljava/util/HashMap;
    invoke-virtual { v2 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v2
    invoke-interface { v2 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v2
  :L2
  .line 84
    invoke-interface { v2 }, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :L4
  .line 85
    invoke-interface { v2 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/util/Map$Entry;
  .line 86
    invoke-interface { v3 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
  .line 87
    invoke-interface { v3 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
  .line 88
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
  .line 89
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3, v6 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 90
    goto :L2
  :L4
  .line 91
    new-instance v2, Ljava/io/FileOutputStream;
    invoke-direct { v2, v0 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  .line 92
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    const-string v1, "UTF-8"
    invoke-virtual { v0, v1 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object v0
    invoke-virtual { v2, v0 }, Ljava/io/FileOutputStream;->write([B)V
  .line 93
    invoke-virtual { v2 }, Ljava/io/FileOutputStream;->close()V
  .line 94
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/AlbumArtist;->dirty:Z
  :L5
  .line 97
    goto :L7
  :L6
  .line 95
    move-exception v0
  :L7
  .line 98
    return-void
.end method
