.class public final Lcom/innioasis/ipp/TrackCache;
.super Ljava/lang/Object;
.source "TrackCache.java"

.field private static dirty:Z

.field private static loaded:Z

.field private final static map:Ljava/util/HashMap;

.method static constructor <clinit>()V
  .registers 1
  .line 36
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/TrackCache;->map:Ljava/util/HashMap;
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 32
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static clear()V
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  .line 39
    sget-object v0, Lcom/innioasis/ipp/TrackCache;->map:Ljava/util/HashMap;
    invoke-virtual { v0 }, Ljava/util/HashMap;->clear()V
  .line 40
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/TrackCache;->loaded:Z
  .line 41
    sput-boolean v0, Lcom/innioasis/ipp/TrackCache;->dirty:Z
  :L0
  .line 43
    invoke-static { }, Lcom/innioasis/ipp/TrackCache;->file()Ljava/io/File;
    move-result-object v0
  .line 44
    if-eqz v0, :L1
  .line 45
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  :L1
  .line 48
    goto :L3
  :L2
  .line 47
    move-exception v0
  :L3
  .line 49
    return-void
.end method

.method private static ensure(Ljava/util/List;)V
  .registers 7
  .line 59
    if-nez p0, :L0
  .line 60
    return-void
  :L0
  .line 62
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
  .line 63
    const/4 v1, 0
    const/4 v2, 0
  :L1
    if-ge v2, v0, :L5
  .line 64
    invoke-interface { p0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v3 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v3
  .line 65
    if-nez v3, :L2
  .line 66
    goto :L4
  :L2
  .line 68
    sget-object v4, Lcom/innioasis/ipp/TrackCache;->map:Ljava/util/HashMap;
    invoke-virtual { v4, v3 }, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z
    move-result v5
    if-eqz v5, :L3
  .line 69
    goto :L4
  :L3
  .line 71
    invoke-static { v3, v1 }, Lcom/innioasis/ipp/Meta;->read(Ljava/lang/String;Z)Lcom/innioasis/ipp/Meta$Info;
    move-result-object v5
    iget-object v5, v5, Lcom/innioasis/ipp/Meta$Info;->track:Ljava/lang/String;
    invoke-static { v3, v5 }, Lcom/innioasis/ipp/TrackCache;->put(Ljava/lang/String;Ljava/lang/String;)V
  .line 72
    invoke-virtual { v4, v3 }, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z
    move-result v5
    if-nez v5, :L4
  .line 73
    const v5, 2147483647
    invoke-static { v5 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v5
    invoke-virtual { v4, v3, v5 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 74
    const/4 v3, 1
    sput-boolean v3, Lcom/innioasis/ipp/TrackCache;->dirty:Z
  :L4
  .line 63
    add-int/lit8 v2, v2, 1
    goto :L1
  :L5
  .line 77
    return-void
.end method

.method private static file()Ljava/io/File;
  .registers 3
  .line 118
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 119
    const/4 v1, 0
    if-nez v0, :L0
  .line 120
    return-object v1
  :L0
  .line 122
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 123
    if-nez v0, :L1
  .line 124
    return-object v1
  :L1
  .line 126
    new-instance v1, Ljava/io/File;
    const-string v2, "ipp_tracks.txt"
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    return-object v1
.end method

.method public static forget(Ljava/lang/String;)V
  .registers 2
  .line 86
    if-nez p0, :L0
  .line 87
    return-void
  :L0
  .line 89
    invoke-static { }, Lcom/innioasis/ipp/TrackCache;->load()V
  .line 90
    sget-object v0, Lcom/innioasis/ipp/TrackCache;->map:Ljava/util/HashMap;
    invoke-virtual { v0, p0 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    if-nez p0, :L1
  .line 91
    return-void
  :L1
  .line 93
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/TrackCache;->dirty:Z
  .line 94
    invoke-static { }, Lcom/innioasis/ipp/TrackCache;->save()V
  .line 95
    return-void
.end method

.method public static get(Ljava/lang/String;)I
  .registers 3
  .line 131
    const v0, 2147483647
    if-nez p0, :L0
  .line 132
    return v0
  :L0
  .line 134
    sget-object v1, Lcom/innioasis/ipp/TrackCache;->map:Ljava/util/HashMap;
    invoke-virtual { v1, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Ljava/lang/Integer;
  .line 135
    if-nez p0, :L1
  .line 136
    return v0
  :L1
  .line 138
    invoke-virtual { p0 }, Ljava/lang/Integer;->intValue()I
    move-result p0
    return p0
.end method

.method private static load()V
  .catchall { :L1 .. :L6 } :L9
  .registers 7
  .line 142
    sget-boolean v0, Lcom/innioasis/ipp/TrackCache;->loaded:Z
    if-eqz v0, :L0
  .line 143
    return-void
  :L0
  .line 145
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/TrackCache;->loaded:Z
  :L1
  .line 147
    invoke-static { }, Lcom/innioasis/ipp/TrackCache;->file()Ljava/io/File;
    move-result-object v0
  .line 148
    if-eqz v0, :L8
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v1
    if-nez v1, :L2
    goto :L8
  :L2
  .line 151
    new-instance v1, Ljava/io/FileInputStream;
    invoke-direct { v1, v0 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 152
    invoke-virtual { v1 }, Ljava/io/FileInputStream;->available()I
    move-result v0
    new-array v0, v0, [B
  .line 153
    invoke-virtual { v1, v0 }, Ljava/io/FileInputStream;->read([B)I
  .line 154
    invoke-virtual { v1 }, Ljava/io/FileInputStream;->close()V
  .line 155
    new-instance v1, Ljava/lang/String;
    invoke-direct { v1, v0 }, Ljava/lang/String;-><init>([B)V
    const-string v0, "\n"
    invoke-virtual { v1, v0 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v0
  .line 156
    const/4 v1, 0
    const/4 v2, 0
  :L3
    array-length v3, v0
    if-ge v2, v3, :L7
  .line 157
    aget-object v3, v0, v2
  .line 158
    const/16 v4, 9
    invoke-virtual { v3, v4 }, Ljava/lang/String;->indexOf(I)I
    move-result v4
  .line 159
    if-gez v4, :L4
  .line 160
    goto :L6
  :L4
  .line 162
    add-int/lit8 v5, v4, 1
    invoke-virtual { v3, v5 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v5
    invoke-static { v5 }, Lcom/innioasis/ipp/TrackCache;->parse(Ljava/lang/String;)I
    move-result v5
  .line 163
    if-gtz v5, :L5
  .line 164
    goto :L6
  :L5
  .line 166
    sget-object v6, Lcom/innioasis/ipp/TrackCache;->map:Ljava/util/HashMap;
    invoke-virtual { v3, v1, v4 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v3
    invoke-static { v5 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v4
    invoke-virtual { v6, v3, v4 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L6
  .line 156
    add-int/lit8 v2, v2, 1
    goto :L3
  :L7
  .line 169
    goto :L10
  :L8
  .line 149
    return-void
  :L9
  .line 168
    move-exception v0
  :L10
  .line 170
    return-void
.end method

.method private static parse(Ljava/lang/String;)I
  .registers 7
  .line 182
    nop
  .line 183
    nop
  .line 184
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v0
    const/4 v1, 0
    const/4 v2, 0
  :L0
  .line 185
    const/16 v3, 57
    const/16 v4, 48
    if-ge v2, v0, :L2
  .line 186
    invoke-virtual { p0, v2 }, Ljava/lang/String;->charAt(I)C
    move-result v5
  .line 187
    if-lt v5, v4, :L1
    if-gt v5, v3, :L1
  .line 188
    goto :L2
  :L1
  .line 190
    add-int/lit8 v2, v2, 1
  .line 191
    goto :L0
  :L2
  .line 192
    if-ge v2, v0, :L4
  .line 193
    invoke-virtual { p0, v2 }, Ljava/lang/String;->charAt(I)C
    move-result v5
  .line 194
    if-lt v5, v4, :L4
    if-le v5, v3, :L3
  .line 195
    goto :L4
  :L3
  .line 197
    mul-int/lit8 v1, v1, 10
    add-int/lit8 v5, v5, -48
    add-int/2addr v1, v5
  .line 198
    add-int/lit8 v2, v2, 1
  .line 199
    goto :L2
  :L4
  .line 200
    return v1
.end method

.method public static put(Ljava/lang/String;Ljava/lang/String;)V
  .registers 3
  .line 205
    if-eqz p0, :L2
    if-nez p1, :L0
    goto :L2
  :L0
  .line 208
    invoke-static { p1 }, Lcom/innioasis/ipp/TrackCache;->parse(Ljava/lang/String;)I
    move-result p1
  .line 209
    if-gtz p1, :L1
  .line 210
    return-void
  :L1
  .line 212
    sget-object v0, Lcom/innioasis/ipp/TrackCache;->map:Ljava/util/HashMap;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
    invoke-virtual { v0, p0, p1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 213
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/TrackCache;->dirty:Z
  .line 214
    return-void
  :L2
  .line 206
    return-void
.end method

.method private static save()V
  .catchall { :L0 .. :L4 } :L5
  .registers 5
  .line 217
    sget-boolean v0, Lcom/innioasis/ipp/TrackCache;->dirty:Z
    if-nez v0, :L0
  .line 218
    return-void
  :L0
  .line 221
    invoke-static { }, Lcom/innioasis/ipp/TrackCache;->file()Ljava/io/File;
    move-result-object v0
  .line 222
    if-nez v0, :L1
  .line 223
    return-void
  :L1
  .line 225
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
  .line 226
    sget-object v2, Lcom/innioasis/ipp/TrackCache;->map:Ljava/util/HashMap;
    invoke-virtual { v2 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v2
    invoke-interface { v2 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v2
  :L2
  .line 227
    invoke-interface { v2 }, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :L3
  .line 228
    invoke-interface { v2 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/util/Map$Entry;
  .line 229
    invoke-interface { v3 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 230
    const/16 v4, 9
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 231
    invoke-interface { v3 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/Integer;
    invoke-virtual { v3 }, Ljava/lang/Integer;->intValue()I
    move-result v3
    invoke-virtual { v1, v3 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
  .line 232
    const/16 v3, 10
    invoke-virtual { v1, v3 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 233
    goto :L2
  :L3
  .line 234
    new-instance v2, Ljava/io/FileOutputStream;
    invoke-direct { v2, v0 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  .line 235
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/String;->getBytes()[B
    move-result-object v0
    invoke-virtual { v2, v0 }, Ljava/io/FileOutputStream;->write([B)V
  .line 236
    invoke-virtual { v2 }, Ljava/io/FileOutputStream;->close()V
  .line 237
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/TrackCache;->dirty:Z
  :L4
  .line 239
    goto :L6
  :L5
  .line 238
    move-exception v0
  :L6
  .line 240
    return-void
.end method

.method public static sorted(Ljava/util/List;)Ljava/util/List;
  .registers 2
  .line 244
    if-nez p0, :L0
  .line 245
    const/4 p0, 0
    return-object p0
  :L0
  .line 247
    invoke-static { }, Lcom/innioasis/ipp/TrackCache;->load()V
  .line 248
    invoke-static { p0 }, Lcom/innioasis/ipp/TrackCache;->ensure(Ljava/util/List;)V
  .line 249
    invoke-static { }, Lcom/innioasis/ipp/TrackCache;->save()V
  .line 250
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0, p0 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 251
    new-instance p0, Lcom/innioasis/ipp/TrackComparator;
    invoke-direct { p0 }, Lcom/innioasis/ipp/TrackComparator;-><init>()V
    invoke-static { v0, p0 }, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
  .line 252
    return-object v0
.end method

.method public static warmIfWanted()V
  .registers 2
  .line 107
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 108
    if-nez v0, :L0
  .line 109
    return-void
  :L0
  .line 111
    const-string v1, "track_numbers"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L1
  .line 112
    return-void
  :L1
  .line 114
    invoke-static { }, Lcom/innioasis/ipp/TrackCache;->load()V
  .line 115
    return-void
.end method
