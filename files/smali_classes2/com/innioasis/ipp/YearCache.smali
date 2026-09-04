.class public final Lcom/innioasis/ipp/YearCache;
.super Ljava/lang/Object;
.source "YearCache.java"

.field private static dirty:Z

.field private static loaded:Z

.field private final static map:Ljava/util/HashMap;

.method static constructor <clinit>()V
  .registers 1
  .line 40
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/YearCache;->map:Ljava/util/HashMap;
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 36
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static clear()V
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  .line 43
    sget-object v0, Lcom/innioasis/ipp/YearCache;->map:Ljava/util/HashMap;
    invoke-virtual { v0 }, Ljava/util/HashMap;->clear()V
  .line 44
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/YearCache;->loaded:Z
  .line 45
    sput-boolean v0, Lcom/innioasis/ipp/YearCache;->dirty:Z
  :L0
  .line 47
    invoke-static { }, Lcom/innioasis/ipp/YearCache;->file()Ljava/io/File;
    move-result-object v0
  .line 48
    if-eqz v0, :L1
  .line 49
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  :L1
  .line 52
    goto :L3
  :L2
  .line 51
    move-exception v0
  :L3
  .line 53
    return-void
.end method

.method private static digits4(Ljava/lang/String;)Ljava/lang/String;
  .registers 10
  .line 57
    const/4 v0, 0
    if-nez p0, :L0
  .line 58
    return-object v0
  :L0
  .line 60
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
  .line 61
    const/4 v2, 0
    const/4 v3, 0
  :L1
    add-int/lit8 v4, v1, -3
    if-ge v3, v4, :L6
  .line 62
    add-int/lit8 v4, v3, 4
    invoke-virtual { p0, v3, v4 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v4
  .line 63
    const/4 v5, 0
  :L2
  .line 64
    const/4 v6, 4
    if-ge v5, v6, :L4
  .line 65
    invoke-virtual { v4, v5 }, Ljava/lang/String;->charAt(I)C
    move-result v7
  .line 66
    const/16 v8, 48
    if-lt v7, v8, :L4
    const/16 v8, 57
    if-le v7, v8, :L3
  .line 67
    goto :L4
  :L3
  .line 69
    add-int/lit8 v5, v5, 1
  .line 70
    goto :L2
  :L4
  .line 71
    if-ne v5, v6, :L5
  .line 72
    return-object v4
  :L5
  .line 61
    add-int/lit8 v3, v3, 1
    goto :L1
  :L6
  .line 75
    return-object v0
.end method

.method private static file()Ljava/io/File;
  .registers 3
  .line 79
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 80
    const/4 v1, 0
    if-nez v0, :L0
  .line 81
    return-object v1
  :L0
  .line 83
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 84
    if-nez v0, :L1
  .line 85
    return-object v1
  :L1
  .line 87
    new-instance v1, Ljava/io/File;
    const-string v2, "ipp_years.txt"
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    return-object v1
.end method

.method public static get(Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 97
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 98
    if-nez p0, :L0
  .line 99
    const/4 p0, 0
    return-object p0
  :L0
  .line 101
    invoke-static { }, Lcom/innioasis/ipp/YearCache;->load()V
  .line 102
    sget-object v0, Lcom/innioasis/ipp/YearCache;->map:Ljava/util/HashMap;
    invoke-virtual { v0, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Ljava/lang/String;
    return-object p0
.end method

.method private static load()V
  .catchall { :L1 .. :L5 } :L8
  .registers 7
  .line 106
    sget-boolean v0, Lcom/innioasis/ipp/YearCache;->loaded:Z
    if-eqz v0, :L0
  .line 107
    return-void
  :L0
  .line 109
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/YearCache;->loaded:Z
  :L1
  .line 111
    invoke-static { }, Lcom/innioasis/ipp/YearCache;->file()Ljava/io/File;
    move-result-object v0
  .line 112
    if-eqz v0, :L7
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v1
    if-nez v1, :L2
    goto :L7
  :L2
  .line 115
    new-instance v1, Ljava/io/FileInputStream;
    invoke-direct { v1, v0 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 116
    invoke-virtual { v1 }, Ljava/io/FileInputStream;->available()I
    move-result v0
    new-array v0, v0, [B
  .line 117
    invoke-virtual { v1, v0 }, Ljava/io/FileInputStream;->read([B)I
  .line 118
    invoke-virtual { v1 }, Ljava/io/FileInputStream;->close()V
  .line 119
    new-instance v1, Ljava/lang/String;
    invoke-direct { v1, v0 }, Ljava/lang/String;-><init>([B)V
    const-string v0, "\n"
    invoke-virtual { v1, v0 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v0
  .line 120
    const/4 v1, 0
    const/4 v2, 0
  :L3
    array-length v3, v0
    if-ge v2, v3, :L6
  .line 121
    aget-object v3, v0, v2
  .line 122
    const/16 v4, 9
    invoke-virtual { v3, v4 }, Ljava/lang/String;->indexOf(I)I
    move-result v4
  .line 123
    if-gez v4, :L4
  .line 124
    goto :L5
  :L4
  .line 126
    sget-object v5, Lcom/innioasis/ipp/YearCache;->map:Ljava/util/HashMap;
    invoke-virtual { v3, v1, v4 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v6
    add-int/lit8 v4, v4, 1
    invoke-virtual { v3, v4 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v5, v6, v3 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L5
  .line 120
    add-int/lit8 v2, v2, 1
    goto :L3
  :L6
  .line 129
    goto :L9
  :L7
  .line 113
    return-void
  :L8
  .line 128
    move-exception v0
  :L9
  .line 130
    return-void
.end method

.method public static put(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
  .registers 3
  .line 168
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 169
    if-nez p0, :L0
  .line 170
    return-void
  :L0
  .line 172
    invoke-static { }, Lcom/innioasis/ipp/YearCache;->load()V
  .line 173
    invoke-static { p1 }, Lcom/innioasis/ipp/YearCache;->digits4(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
  .line 174
    if-nez p1, :L1
  .line 175
    invoke-static { p2 }, Lcom/innioasis/ipp/YearCache;->digits4(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
  :L1
  .line 177
    if-nez p1, :L2
  .line 178
    const-string p1, ""
  :L2
  .line 180
    sget-object p2, Lcom/innioasis/ipp/YearCache;->map:Ljava/util/HashMap;
    invoke-virtual { p2, p0, p1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 181
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/YearCache;->dirty:Z
  .line 182
    return-void
.end method

.method private static save()V
  .catchall { :L0 .. :L4 } :L5
  .registers 5
  .line 134
    sget-boolean v0, Lcom/innioasis/ipp/YearCache;->dirty:Z
    if-nez v0, :L0
  .line 135
    return-void
  :L0
  .line 138
    invoke-static { }, Lcom/innioasis/ipp/YearCache;->file()Ljava/io/File;
    move-result-object v0
  .line 139
    if-nez v0, :L1
  .line 140
    return-void
  :L1
  .line 142
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
  .line 143
    sget-object v2, Lcom/innioasis/ipp/YearCache;->map:Ljava/util/HashMap;
    invoke-virtual { v2 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v2
    invoke-interface { v2 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v2
  :L2
  .line 144
    invoke-interface { v2 }, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :L3
  .line 145
    invoke-interface { v2 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/util/Map$Entry;
  .line 146
    invoke-interface { v3 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 147
    const/16 v4, 9
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 148
    invoke-interface { v3 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
    invoke-virtual { v1, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 149
    const/16 v3, 10
    invoke-virtual { v1, v3 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 150
    goto :L2
  :L3
  .line 151
    new-instance v2, Ljava/io/FileOutputStream;
    invoke-direct { v2, v0 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  .line 152
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/String;->getBytes()[B
    move-result-object v0
    invoke-virtual { v2, v0 }, Ljava/io/FileOutputStream;->write([B)V
  .line 153
    invoke-virtual { v2 }, Ljava/io/FileOutputStream;->close()V
  .line 154
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/YearCache;->dirty:Z
  :L4
  .line 156
    goto :L6
  :L5
  .line 155
    move-exception v0
  :L6
  .line 157
    return-void
.end method

.method public static warm(Ljava/util/List;)V
  .catchall { :L1 .. :L8 } :L19
  .catchall { :L8 .. :L9 } :L11
  .catchall { :L12 .. :L13 } :L14
  .catchall { :L15 .. :L18 } :L19
  .registers 9
  .line 186
    if-nez p0, :L0
  .line 187
    return-void
  :L0
  .line 189
    invoke-static { }, Lcom/innioasis/ipp/YearCache;->load()V
  :L1
  .line 191
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 192
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v1
  .line 193
    const/4 v2, 0
    const/4 v3, 0
  :L2
    if-ge v3, v1, :L17
  .line 194
    invoke-interface { p0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
  .line 195
    if-nez v4, :L3
  .line 196
    goto :L16
  :L3
  .line 200
    invoke-static { v4 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result v5
    if-eqz v5, :L4
  .line 201
    goto :L16
  :L4
  .line 203
    sget-object v5, Lcom/innioasis/ipp/YearCache;->map:Ljava/util/HashMap;
    invoke-virtual { v5, v4 }, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z
    move-result v5
    if-eqz v5, :L5
  .line 204
    goto :L16
  :L5
  .line 206
    sget-object v5, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    invoke-virtual { v0, v4, v5 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsByAlbum(Ljava/lang/String;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object v5
  .line 207
    if-eqz v5, :L16
    invoke-interface { v5 }, Ljava/util/List;->isEmpty()Z
    move-result v6
    if-eqz v6, :L6
  .line 208
    goto :L16
  :L6
  .line 210
    invoke-interface { v5, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v5
  .line 211
    if-nez v5, :L7
  .line 212
    goto :L16
  :L7
  .line 214
    const-string v6, ""
  .line 215
    new-instance v7, Landroid/media/MediaMetadataRetriever;
    invoke-direct { v7 }, Landroid/media/MediaMetadataRetriever;-><init>()V
  :L8
  .line 217
    invoke-virtual { v7, v5 }, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;)V
  .line 218
    const/16 v5, 8
    invoke-virtual { v7, v5 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v5
    invoke-static { v5 }, Lcom/innioasis/ipp/YearCache;->digits4(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
  .line 219
    if-nez v5, :L9
  .line 220
    const/4 v5, 5
    invoke-virtual { v7, v5 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v5
    invoke-static { v5 }, Lcom/innioasis/ipp/YearCache;->digits4(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
  :L9
  .line 222
    if-eqz v5, :L10
  .line 223
    move-object v6, v5
  :L10
  .line 226
    goto :L12
  :L11
  .line 225
    move-exception v5
  :L12
  .line 228
    invoke-virtual { v7 }, Landroid/media/MediaMetadataRetriever;->release()V
  :L13
  .line 230
    goto :L15
  :L14
  .line 229
    move-exception v5
  :L15
  .line 231
    sget-object v5, Lcom/innioasis/ipp/YearCache;->map:Ljava/util/HashMap;
    invoke-virtual { v5, v4, v6 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 232
    const/4 v4, 1
    sput-boolean v4, Lcom/innioasis/ipp/YearCache;->dirty:Z
  :L16
  .line 193
    add-int/lit8 v3, v3, 1
    goto :L2
  :L17
  .line 234
    invoke-static { }, Lcom/innioasis/ipp/YearCache;->save()V
  :L18
  .line 236
    goto :L20
  :L19
  .line 235
    move-exception p0
  :L20
  .line 237
    return-void
.end method
