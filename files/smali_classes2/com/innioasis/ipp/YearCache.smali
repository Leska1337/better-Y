.class public final Lcom/innioasis/ipp/YearCache;
.super Ljava/lang/Object;
.source "YearCache.java"

.field private static dirty:Z

.field private static loaded:Z

.field private final static map:Ljava/util/HashMap;

.method static constructor <clinit>()V
  .registers 1
  .line 39
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/YearCache;->map:Ljava/util/HashMap;
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 35
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static clear()V
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  .line 42
    sget-object v0, Lcom/innioasis/ipp/YearCache;->map:Ljava/util/HashMap;
    invoke-virtual { v0 }, Ljava/util/HashMap;->clear()V
  .line 43
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/YearCache;->loaded:Z
  .line 44
    sput-boolean v0, Lcom/innioasis/ipp/YearCache;->dirty:Z
  :L0
  .line 46
    invoke-static { }, Lcom/innioasis/ipp/YearCache;->file()Ljava/io/File;
    move-result-object v0
  .line 47
    if-eqz v0, :L1
  .line 48
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  :L1
  .line 51
    goto :L3
  :L2
  .line 50
    move-exception v0
  :L3
  .line 52
    return-void
.end method

.method private static digits4(Ljava/lang/String;)Ljava/lang/String;
  .registers 10
  .line 56
    const/4 v0, 0
    if-nez p0, :L0
  .line 57
    return-object v0
  :L0
  .line 59
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
  .line 60
    const/4 v2, 0
    const/4 v3, 0
  :L1
    add-int/lit8 v4, v1, -3
    if-ge v3, v4, :L6
  .line 61
    add-int/lit8 v4, v3, 4
    invoke-virtual { p0, v3, v4 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v4
  .line 62
    const/4 v5, 0
  :L2
  .line 63
    const/4 v6, 4
    if-ge v5, v6, :L4
  .line 64
    invoke-virtual { v4, v5 }, Ljava/lang/String;->charAt(I)C
    move-result v7
  .line 65
    const/16 v8, 48
    if-lt v7, v8, :L4
    const/16 v8, 57
    if-le v7, v8, :L3
  .line 66
    goto :L4
  :L3
  .line 68
    add-int/lit8 v5, v5, 1
  .line 69
    goto :L2
  :L4
  .line 70
    if-ne v5, v6, :L5
  .line 71
    return-object v4
  :L5
  .line 60
    add-int/lit8 v3, v3, 1
    goto :L1
  :L6
  .line 74
    return-object v0
.end method

.method private static file()Ljava/io/File;
  .registers 3
  .line 78
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 79
    const/4 v1, 0
    if-nez v0, :L0
  .line 80
    return-object v1
  :L0
  .line 82
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 83
    if-nez v0, :L1
  .line 84
    return-object v1
  :L1
  .line 86
    new-instance v1, Ljava/io/File;
    const-string v2, "ipp_years.txt"
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    return-object v1
.end method

.method public static get(Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 96
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 97
    if-nez p0, :L0
  .line 98
    const/4 p0, 0
    return-object p0
  :L0
  .line 100
    invoke-static { }, Lcom/innioasis/ipp/YearCache;->load()V
  .line 101
    sget-object v0, Lcom/innioasis/ipp/YearCache;->map:Ljava/util/HashMap;
    invoke-virtual { v0, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Ljava/lang/String;
    return-object p0
.end method

.method private static load()V
  .catchall { :L1 .. :L5 } :L8
  .registers 7
  .line 105
    sget-boolean v0, Lcom/innioasis/ipp/YearCache;->loaded:Z
    if-eqz v0, :L0
  .line 106
    return-void
  :L0
  .line 108
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/YearCache;->loaded:Z
  :L1
  .line 110
    invoke-static { }, Lcom/innioasis/ipp/YearCache;->file()Ljava/io/File;
    move-result-object v0
  .line 111
    if-eqz v0, :L7
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v1
    if-nez v1, :L2
    goto :L7
  :L2
  .line 114
    new-instance v1, Ljava/io/FileInputStream;
    invoke-direct { v1, v0 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 115
    invoke-virtual { v1 }, Ljava/io/FileInputStream;->available()I
    move-result v0
    new-array v0, v0, [B
  .line 116
    invoke-virtual { v1, v0 }, Ljava/io/FileInputStream;->read([B)I
  .line 117
    invoke-virtual { v1 }, Ljava/io/FileInputStream;->close()V
  .line 118
    new-instance v1, Ljava/lang/String;
    invoke-direct { v1, v0 }, Ljava/lang/String;-><init>([B)V
    const-string v0, "\n"
    invoke-virtual { v1, v0 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v0
  .line 119
    const/4 v1, 0
    const/4 v2, 0
  :L3
    array-length v3, v0
    if-ge v2, v3, :L6
  .line 120
    aget-object v3, v0, v2
  .line 121
    const/16 v4, 9
    invoke-virtual { v3, v4 }, Ljava/lang/String;->indexOf(I)I
    move-result v4
  .line 122
    if-gez v4, :L4
  .line 123
    goto :L5
  :L4
  .line 125
    sget-object v5, Lcom/innioasis/ipp/YearCache;->map:Ljava/util/HashMap;
    invoke-virtual { v3, v1, v4 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v6
    add-int/lit8 v4, v4, 1
    invoke-virtual { v3, v4 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v5, v6, v3 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L5
  .line 119
    add-int/lit8 v2, v2, 1
    goto :L3
  :L6
  .line 128
    goto :L9
  :L7
  .line 112
    return-void
  :L8
  .line 127
    move-exception v0
  :L9
  .line 129
    return-void
.end method

.method public static put(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
  .registers 3
  .line 167
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 168
    if-nez p0, :L0
  .line 169
    return-void
  :L0
  .line 171
    invoke-static { }, Lcom/innioasis/ipp/YearCache;->load()V
  .line 172
    invoke-static { p1 }, Lcom/innioasis/ipp/YearCache;->digits4(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
  .line 173
    if-nez p1, :L1
  .line 174
    invoke-static { p2 }, Lcom/innioasis/ipp/YearCache;->digits4(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
  :L1
  .line 176
    if-nez p1, :L2
  .line 177
    const-string p1, ""
  :L2
  .line 179
    sget-object p2, Lcom/innioasis/ipp/YearCache;->map:Ljava/util/HashMap;
    invoke-virtual { p2, p0, p1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 180
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/YearCache;->dirty:Z
  .line 181
    return-void
.end method

.method private static save()V
  .catchall { :L0 .. :L4 } :L5
  .registers 5
  .line 133
    sget-boolean v0, Lcom/innioasis/ipp/YearCache;->dirty:Z
    if-nez v0, :L0
  .line 134
    return-void
  :L0
  .line 137
    invoke-static { }, Lcom/innioasis/ipp/YearCache;->file()Ljava/io/File;
    move-result-object v0
  .line 138
    if-nez v0, :L1
  .line 139
    return-void
  :L1
  .line 141
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
  .line 142
    sget-object v2, Lcom/innioasis/ipp/YearCache;->map:Ljava/util/HashMap;
    invoke-virtual { v2 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v2
    invoke-interface { v2 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v2
  :L2
  .line 143
    invoke-interface { v2 }, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :L3
  .line 144
    invoke-interface { v2 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/util/Map$Entry;
  .line 145
    invoke-interface { v3 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 146
    const/16 v4, 9
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 147
    invoke-interface { v3 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
    invoke-virtual { v1, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 148
    const/16 v3, 10
    invoke-virtual { v1, v3 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 149
    goto :L2
  :L3
  .line 150
    new-instance v2, Ljava/io/FileOutputStream;
    invoke-direct { v2, v0 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  .line 151
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/String;->getBytes()[B
    move-result-object v0
    invoke-virtual { v2, v0 }, Ljava/io/FileOutputStream;->write([B)V
  .line 152
    invoke-virtual { v2 }, Ljava/io/FileOutputStream;->close()V
  .line 153
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/YearCache;->dirty:Z
  :L4
  .line 155
    goto :L6
  :L5
  .line 154
    move-exception v0
  :L6
  .line 156
    return-void
.end method

.method public static warm(Ljava/util/List;)V
  .catchall { :L1 .. :L12 } :L13
  .registers 10
  .line 185
    if-nez p0, :L0
  .line 186
    return-void
  :L0
  .line 188
    invoke-static { }, Lcom/innioasis/ipp/YearCache;->load()V
  :L1
  .line 190
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 191
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v1
  .line 192
    const/4 v2, 0
    const/4 v3, 0
  :L2
    if-ge v3, v1, :L11
  .line 193
    invoke-interface { p0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
  .line 194
    if-nez v4, :L3
  .line 195
    goto :L10
  :L3
  .line 199
    invoke-static { v4 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result v5
    if-eqz v5, :L4
  .line 200
    goto :L10
  :L4
  .line 202
    sget-object v5, Lcom/innioasis/ipp/YearCache;->map:Ljava/util/HashMap;
    invoke-virtual { v5, v4 }, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z
    move-result v6
    if-eqz v6, :L5
  .line 203
    goto :L10
  :L5
  .line 205
    sget-object v6, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    invoke-virtual { v0, v4, v6 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsByAlbum(Ljava/lang/String;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object v6
  .line 206
    if-eqz v6, :L10
    invoke-interface { v6 }, Ljava/util/List;->isEmpty()Z
    move-result v7
    if-eqz v7, :L6
  .line 207
    goto :L10
  :L6
  .line 209
    invoke-interface { v6, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v6
  .line 210
    if-nez v6, :L7
  .line 211
    goto :L10
  :L7
  .line 213
    const-string v7, ""
  .line 214
    invoke-static { v6, v2 }, Lcom/innioasis/ipp/Meta;->read(Ljava/lang/String;Z)Lcom/innioasis/ipp/Meta$Info;
    move-result-object v6
  .line 215
    iget-object v8, v6, Lcom/innioasis/ipp/Meta$Info;->year:Ljava/lang/String;
    invoke-static { v8 }, Lcom/innioasis/ipp/YearCache;->digits4(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v8
  .line 216
    if-nez v8, :L8
  .line 217
    iget-object v6, v6, Lcom/innioasis/ipp/Meta$Info;->date:Ljava/lang/String;
    invoke-static { v6 }, Lcom/innioasis/ipp/YearCache;->digits4(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v8
  :L8
  .line 219
    if-eqz v8, :L9
  .line 220
    move-object v7, v8
  :L9
  .line 222
    invoke-virtual { v5, v4, v7 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 223
    const/4 v4, 1
    sput-boolean v4, Lcom/innioasis/ipp/YearCache;->dirty:Z
  :L10
  .line 192
    add-int/lit8 v3, v3, 1
    goto :L2
  :L11
  .line 225
    invoke-static { }, Lcom/innioasis/ipp/YearCache;->save()V
  :L12
  .line 227
    goto :L14
  :L13
  .line 226
    move-exception p0
  :L14
  .line 228
    return-void
.end method
