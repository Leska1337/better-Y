.class public final Lcom/innioasis/ipp/TrackCache;
.super Ljava/lang/Object;
.source "TrackCache.java"

.field private static dirty:Z

.field private static loaded:Z

.field private final static map:Ljava/util/HashMap;

.method static constructor <clinit>()V
  .registers 1
  .line 37
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/TrackCache;->map:Ljava/util/HashMap;
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 33
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static clear()V
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  .line 40
    sget-object v0, Lcom/innioasis/ipp/TrackCache;->map:Ljava/util/HashMap;
    invoke-virtual { v0 }, Ljava/util/HashMap;->clear()V
  .line 41
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/TrackCache;->loaded:Z
  .line 42
    sput-boolean v0, Lcom/innioasis/ipp/TrackCache;->dirty:Z
  :L0
  .line 44
    invoke-static { }, Lcom/innioasis/ipp/TrackCache;->file()Ljava/io/File;
    move-result-object v0
  .line 45
    if-eqz v0, :L1
  .line 46
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  :L1
  .line 49
    goto :L3
  :L2
  .line 48
    move-exception v0
  :L3
  .line 50
    return-void
.end method

.method private static ensure(Ljava/util/List;)V
  .catchall { :L4 .. :L5 } :L6
  .catchall { :L7 .. :L8 } :L9
  .registers 7
  .line 60
    if-nez p0, :L0
  .line 61
    return-void
  :L0
  .line 63
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
  .line 64
    const/4 v1, 0
    const/4 v2, 0
  :L1
    if-ge v2, v0, :L12
  .line 65
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v3
  .line 66
    if-nez v3, :L2
  .line 67
    goto :L11
  :L2
  .line 69
    sget-object v4, Lcom/innioasis/ipp/TrackCache;->map:Ljava/util/HashMap;
    invoke-virtual { v4, v3 }, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :L3
  .line 70
    goto :L11
  :L3
  .line 72
    new-instance v4, Landroid/media/MediaMetadataRetriever;
    invoke-direct { v4 }, Landroid/media/MediaMetadataRetriever;-><init>()V
  :L4
  .line 74
    invoke-virtual { v4, v3 }, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;)V
  .line 75
    invoke-virtual { v4, v1 }, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    move-result-object v5
    invoke-static { v3, v5 }, Lcom/innioasis/ipp/TrackCache;->put(Ljava/lang/String;Ljava/lang/String;)V
  :L5
  .line 77
    goto :L7
  :L6
  .line 76
    move-exception v5
  :L7
  .line 79
    invoke-virtual { v4 }, Landroid/media/MediaMetadataRetriever;->release()V
  :L8
  .line 81
    goto :L10
  :L9
  .line 80
    move-exception v4
  :L10
  .line 82
    sget-object v4, Lcom/innioasis/ipp/TrackCache;->map:Ljava/util/HashMap;
    invoke-virtual { v4, v3 }, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z
    move-result v5
    if-nez v5, :L11
  .line 83
    const v5, 2147483647
    invoke-static { v5 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v5
    invoke-virtual { v4, v3, v5 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 84
    const/4 v3, 1
    sput-boolean v3, Lcom/innioasis/ipp/TrackCache;->dirty:Z
  :L11
  .line 64
    add-int/lit8 v2, v2, 1
    goto :L1
  :L12
  .line 87
    return-void
.end method

.method private static file()Ljava/io/File;
  .registers 3
  .line 128
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 129
    const/4 v1, 0
    if-nez v0, :L0
  .line 130
    return-object v1
  :L0
  .line 132
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 133
    if-nez v0, :L1
  .line 134
    return-object v1
  :L1
  .line 136
    new-instance v1, Ljava/io/File;
    const-string v2, "ipp_tracks.txt"
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    return-object v1
.end method

.method public static forget(Ljava/lang/String;)V
  .registers 2
  .line 96
    if-nez p0, :L0
  .line 97
    return-void
  :L0
  .line 99
    invoke-static { }, Lcom/innioasis/ipp/TrackCache;->load()V
  .line 100
    sget-object v0, Lcom/innioasis/ipp/TrackCache;->map:Ljava/util/HashMap;
    invoke-virtual { v0, p0 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    if-nez p0, :L1
  .line 101
    return-void
  :L1
  .line 103
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/TrackCache;->dirty:Z
  .line 104
    invoke-static { }, Lcom/innioasis/ipp/TrackCache;->save()V
  .line 105
    return-void
.end method

.method public static get(Ljava/lang/String;)I
  .registers 3
  .line 141
    const v0, 2147483647
    if-nez p0, :L0
  .line 142
    return v0
  :L0
  .line 144
    sget-object v1, Lcom/innioasis/ipp/TrackCache;->map:Ljava/util/HashMap;
    invoke-virtual { v1, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Ljava/lang/Integer;
  .line 145
    if-nez p0, :L1
  .line 146
    return v0
  :L1
  .line 148
    invoke-virtual { p0 }, Ljava/lang/Integer;->intValue()I
    move-result p0
    return p0
.end method

.method private static load()V
  .catchall { :L1 .. :L6 } :L9
  .registers 7
  .line 152
    sget-boolean v0, Lcom/innioasis/ipp/TrackCache;->loaded:Z
    if-eqz v0, :L0
  .line 153
    return-void
  :L0
  .line 155
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/TrackCache;->loaded:Z
  :L1
  .line 157
    invoke-static { }, Lcom/innioasis/ipp/TrackCache;->file()Ljava/io/File;
    move-result-object v0
  .line 158
    if-eqz v0, :L8
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v1
    if-nez v1, :L2
    goto :L8
  :L2
  .line 161
    new-instance v1, Ljava/io/FileInputStream;
    invoke-direct { v1, v0 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 162
    invoke-virtual { v1 }, Ljava/io/FileInputStream;->available()I
    move-result v0
    new-array v0, v0, [B
  .line 163
    invoke-virtual { v1, v0 }, Ljava/io/FileInputStream;->read([B)I
  .line 164
    invoke-virtual { v1 }, Ljava/io/FileInputStream;->close()V
  .line 165
    new-instance v1, Ljava/lang/String;
    invoke-direct { v1, v0 }, Ljava/lang/String;-><init>([B)V
    const-string v0, "\n"
    invoke-virtual { v1, v0 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v0
  .line 166
    const/4 v1, 0
    const/4 v2, 0
  :L3
    array-length v3, v0
    if-ge v2, v3, :L7
  .line 167
    aget-object v3, v0, v2
  .line 168
    const/16 v4, 9
    invoke-virtual { v3, v4 }, Ljava/lang/String;->indexOf(I)I
    move-result v4
  .line 169
    if-gez v4, :L4
  .line 170
    goto :L6
  :L4
  .line 172
    add-int/lit8 v5, v4, 1
    invoke-virtual { v3, v5 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v5
    invoke-static { v5 }, Lcom/innioasis/ipp/TrackCache;->parse(Ljava/lang/String;)I
    move-result v5
  .line 173
    if-gtz v5, :L5
  .line 174
    goto :L6
  :L5
  .line 176
    sget-object v6, Lcom/innioasis/ipp/TrackCache;->map:Ljava/util/HashMap;
    invoke-virtual { v3, v1, v4 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v3
    invoke-static { v5 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v4
    invoke-virtual { v6, v3, v4 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L6
  .line 166
    add-int/lit8 v2, v2, 1
    goto :L3
  :L7
  .line 179
    goto :L10
  :L8
  .line 159
    return-void
  :L9
  .line 178
    move-exception v0
  :L10
  .line 180
    return-void
.end method

.method private static parse(Ljava/lang/String;)I
  .registers 7
  .line 192
    nop
  .line 193
    nop
  .line 194
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v0
    const/4 v1, 0
    const/4 v2, 0
  :L0
  .line 195
    const/16 v3, 57
    const/16 v4, 48
    if-ge v2, v0, :L2
  .line 196
    invoke-virtual { p0, v2 }, Ljava/lang/String;->charAt(I)C
    move-result v5
  .line 197
    if-lt v5, v4, :L1
    if-gt v5, v3, :L1
  .line 198
    goto :L2
  :L1
  .line 200
    add-int/lit8 v2, v2, 1
  .line 201
    goto :L0
  :L2
  .line 202
    if-ge v2, v0, :L4
  .line 203
    invoke-virtual { p0, v2 }, Ljava/lang/String;->charAt(I)C
    move-result v5
  .line 204
    if-lt v5, v4, :L4
    if-le v5, v3, :L3
  .line 205
    goto :L4
  :L3
  .line 207
    mul-int/lit8 v1, v1, 10
    add-int/lit8 v5, v5, -48
    add-int/2addr v1, v5
  .line 208
    add-int/lit8 v2, v2, 1
  .line 209
    goto :L2
  :L4
  .line 210
    return v1
.end method

.method public static put(Ljava/lang/String;Ljava/lang/String;)V
  .registers 3
  .line 215
    if-eqz p0, :L2
    if-nez p1, :L0
    goto :L2
  :L0
  .line 218
    invoke-static { p1 }, Lcom/innioasis/ipp/TrackCache;->parse(Ljava/lang/String;)I
    move-result p1
  .line 219
    if-gtz p1, :L1
  .line 220
    return-void
  :L1
  .line 222
    sget-object v0, Lcom/innioasis/ipp/TrackCache;->map:Ljava/util/HashMap;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
    invoke-virtual { v0, p0, p1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 223
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/TrackCache;->dirty:Z
  .line 224
    return-void
  :L2
  .line 216
    return-void
.end method

.method private static save()V
  .catchall { :L0 .. :L4 } :L5
  .registers 5
  .line 227
    sget-boolean v0, Lcom/innioasis/ipp/TrackCache;->dirty:Z
    if-nez v0, :L0
  .line 228
    return-void
  :L0
  .line 231
    invoke-static { }, Lcom/innioasis/ipp/TrackCache;->file()Ljava/io/File;
    move-result-object v0
  .line 232
    if-nez v0, :L1
  .line 233
    return-void
  :L1
  .line 235
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
  .line 236
    sget-object v2, Lcom/innioasis/ipp/TrackCache;->map:Ljava/util/HashMap;
    invoke-virtual { v2 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v2
    invoke-interface { v2 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v2
  :L2
  .line 237
    invoke-interface { v2 }, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :L3
  .line 238
    invoke-interface { v2 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/util/Map$Entry;
  .line 239
    invoke-interface { v3 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 240
    const/16 v4, 9
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 241
    invoke-interface { v3 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/Integer;
    invoke-virtual { v3 }, Ljava/lang/Integer;->intValue()I
    move-result v3
    invoke-virtual { v1, v3 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
  .line 242
    const/16 v3, 10
    invoke-virtual { v1, v3 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 243
    goto :L2
  :L3
  .line 244
    new-instance v2, Ljava/io/FileOutputStream;
    invoke-direct { v2, v0 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  .line 245
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/String;->getBytes()[B
    move-result-object v0
    invoke-virtual { v2, v0 }, Ljava/io/FileOutputStream;->write([B)V
  .line 246
    invoke-virtual { v2 }, Ljava/io/FileOutputStream;->close()V
  .line 247
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/TrackCache;->dirty:Z
  :L4
  .line 249
    goto :L6
  :L5
  .line 248
    move-exception v0
  :L6
  .line 250
    return-void
.end method

.method public static sorted(Ljava/util/List;)Ljava/util/List;
  .registers 2
  .line 254
    if-nez p0, :L0
  .line 255
    const/4 p0, 0
    return-object p0
  :L0
  .line 257
    invoke-static { }, Lcom/innioasis/ipp/TrackCache;->load()V
  .line 258
    invoke-static { p0 }, Lcom/innioasis/ipp/TrackCache;->ensure(Ljava/util/List;)V
  .line 259
    invoke-static { }, Lcom/innioasis/ipp/TrackCache;->save()V
  .line 260
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0, p0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 261
    new-instance p0, Lcom/innioasis/ipp/TrackComparator;
    invoke-direct { p0 }, Lcom/innioasis/ipp/TrackComparator;-><init>()V
    invoke-static { v0, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 262
    return-object v0
.end method

.method public static warmIfWanted()V
  .registers 2
  .line 117
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 118
    if-nez v0, :L0
  .line 119
    return-void
  :L0
  .line 121
    const-string v1, "track_numbers"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L1
  .line 122
    return-void
  :L1
  .line 124
    invoke-static { }, Lcom/innioasis/ipp/TrackCache;->load()V
  .line 125
    return-void
.end method
