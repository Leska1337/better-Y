.class public final Lcom/innioasis/ipp/YearCache;
.super Ljava/lang/Object;
.source "YearCache.java"

.field private static dirty:Z

.field private static loaded:Z

.field private final static map:Ljava/util/HashMap;

.method static constructor <clinit>()V
  .registers 1
  .line 25
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/YearCache;->map:Ljava/util/HashMap;
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 21
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static clear()V
  .catchall { :L0 .. :L1 } :L2
  .registers 1
  .line 28
    sget-object v0, Lcom/innioasis/ipp/YearCache;->map:Ljava/util/HashMap;
    invoke-virtual { v0 }, Ljava/util/HashMap;->clear()V
  .line 29
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/YearCache;->loaded:Z
  .line 30
    sput-boolean v0, Lcom/innioasis/ipp/YearCache;->dirty:Z
  :L0
  .line 32
    invoke-static { }, Lcom/innioasis/ipp/YearCache;->file()Ljava/io/File;
    move-result-object v0
  .line 33
    if-eqz v0, :L1
  .line 34
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  :L1
  .line 37
    goto :L3
  :L2
  .line 36
    move-exception v0
  :L3
  .line 38
    return-void
.end method

.method private static digits4(Ljava/lang/String;)Ljava/lang/String;
  .registers 10
  .line 42
    const/4 v0, 0
    if-nez p0, :L0
  .line 43
    return-object v0
  :L0
  .line 45
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
  .line 46
    const/4 v2, 0
    const/4 v3, 0
  :L1
    add-int/lit8 v4, v1, -3
    if-ge v3, v4, :L6
  .line 47
    add-int/lit8 v4, v3, 4
    invoke-virtual { p0, v3, v4 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v4
  .line 48
    const/4 v5, 0
  :L2
  .line 49
    const/4 v6, 4
    if-ge v5, v6, :L4
  .line 50
    invoke-virtual { v4, v5 }, Ljava/lang/String;->charAt(I)C
    move-result v7
  .line 51
    const/16 v8, 48
    if-lt v7, v8, :L4
    const/16 v8, 57
    if-le v7, v8, :L3
  .line 52
    goto :L4
  :L3
  .line 54
    add-int/lit8 v5, v5, 1
  .line 55
    goto :L2
  :L4
  .line 56
    if-ne v5, v6, :L5
  .line 57
    return-object v4
  :L5
  .line 46
    add-int/lit8 v3, v3, 1
    goto :L1
  :L6
  .line 60
    return-object v0
.end method

.method private static file()Ljava/io/File;
  .registers 3
  .line 64
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 65
    const/4 v1, 0
    if-nez v0, :L0
  .line 66
    return-object v1
  :L0
  .line 68
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 69
    if-nez v0, :L1
  .line 70
    return-object v1
  :L1
  .line 72
    new-instance v1, Ljava/io/File;
    const-string v2, "ipp_years.txt"
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    return-object v1
.end method

.method public static get(Ljava/lang/String;)Ljava/lang/String;
  .registers 2
  .line 77
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 78
    if-nez p0, :L0
  .line 79
    const/4 p0, 0
    return-object p0
  :L0
  .line 81
    invoke-static { }, Lcom/innioasis/ipp/YearCache;->load()V
  .line 82
    sget-object v0, Lcom/innioasis/ipp/YearCache;->map:Ljava/util/HashMap;
    invoke-virtual { v0, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Ljava/lang/String;
    return-object p0
.end method

.method private static load()V
  .catchall { :L1 .. :L5 } :L8
  .registers 7
  .line 86
    sget-boolean v0, Lcom/innioasis/ipp/YearCache;->loaded:Z
    if-eqz v0, :L0
  .line 87
    return-void
  :L0
  .line 89
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/YearCache;->loaded:Z
  :L1
  .line 91
    invoke-static { }, Lcom/innioasis/ipp/YearCache;->file()Ljava/io/File;
    move-result-object v0
  .line 92
    if-eqz v0, :L7
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v1
    if-nez v1, :L2
    goto :L7
  :L2
  .line 95
    new-instance v1, Ljava/io/FileInputStream;
    invoke-direct { v1, v0 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 96
    invoke-virtual { v1 }, Ljava/io/FileInputStream;->available()I
    move-result v0
    new-array v0, v0, [B
  .line 97
    invoke-virtual { v1, v0 }, Ljava/io/FileInputStream;->read([B)I
  .line 98
    invoke-virtual { v1 }, Ljava/io/FileInputStream;->close()V
  .line 99
    new-instance v1, Ljava/lang/String;
    invoke-direct { v1, v0 }, Ljava/lang/String;-><init>([B)V
    const-string v0, "\n"
    invoke-virtual { v1, v0 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v0
  .line 100
    const/4 v1, 0
    const/4 v2, 0
  :L3
    array-length v3, v0
    if-ge v2, v3, :L6
  .line 101
    aget-object v3, v0, v2
  .line 102
    const/16 v4, 9
    invoke-virtual { v3, v4 }, Ljava/lang/String;->indexOf(I)I
    move-result v4
  .line 103
    if-gez v4, :L4
  .line 104
    goto :L5
  :L4
  .line 106
    sget-object v5, Lcom/innioasis/ipp/YearCache;->map:Ljava/util/HashMap;
    invoke-virtual { v3, v1, v4 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v6
    add-int/lit8 v4, v4, 1
    invoke-virtual { v3, v4 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v5, v6, v3 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L5
  .line 100
    add-int/lit8 v2, v2, 1
    goto :L3
  :L6
  .line 109
    goto :L9
  :L7
  .line 93
    return-void
  :L8
  .line 108
    move-exception v0
  :L9
  .line 110
    return-void
.end method

.method public static put(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
  .registers 3
  .line 143
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 144
    if-nez p0, :L0
  .line 145
    return-void
  :L0
  .line 147
    invoke-static { }, Lcom/innioasis/ipp/YearCache;->load()V
  .line 148
    invoke-static { p1 }, Lcom/innioasis/ipp/YearCache;->digits4(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
  .line 149
    if-nez p1, :L1
  .line 150
    invoke-static { p2 }, Lcom/innioasis/ipp/YearCache;->digits4(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
  :L1
  .line 152
    if-nez p1, :L2
  .line 153
    const-string p1, ""
  :L2
  .line 155
    sget-object p2, Lcom/innioasis/ipp/YearCache;->map:Ljava/util/HashMap;
    invoke-virtual { p2, p0, p1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 156
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/YearCache;->dirty:Z
  .line 157
    return-void
.end method

.method private static save()V
  .catchall { :L0 .. :L4 } :L5
  .registers 5
  .line 113
    sget-boolean v0, Lcom/innioasis/ipp/YearCache;->dirty:Z
    if-nez v0, :L0
  .line 114
    return-void
  :L0
  .line 117
    invoke-static { }, Lcom/innioasis/ipp/YearCache;->file()Ljava/io/File;
    move-result-object v0
  .line 118
    if-nez v0, :L1
  .line 119
    return-void
  :L1
  .line 121
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
  .line 122
    sget-object v2, Lcom/innioasis/ipp/YearCache;->map:Ljava/util/HashMap;
    invoke-virtual { v2 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v2
    invoke-interface { v2 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v2
  :L2
  .line 123
    invoke-interface { v2 }, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :L3
  .line 124
    invoke-interface { v2 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/util/Map$Entry;
  .line 125
    invoke-interface { v3 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 126
    const/16 v4, 9
    invoke-virtual { v1, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 127
    invoke-interface { v3 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
    invoke-virtual { v1, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 128
    const/16 v3, 10
    invoke-virtual { v1, v3 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 129
    goto :L2
  :L3
  .line 130
    new-instance v2, Ljava/io/FileOutputStream;
    invoke-direct { v2, v0 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  .line 131
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/String;->getBytes()[B
    move-result-object v0
    invoke-virtual { v2, v0 }, Ljava/io/FileOutputStream;->write([B)V
  .line 132
    invoke-virtual { v2 }, Ljava/io/FileOutputStream;->close()V
  .line 133
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/YearCache;->dirty:Z
  :L4
  .line 135
    goto :L6
  :L5
  .line 134
    move-exception v0
  :L6
  .line 136
    return-void
.end method

.method public static warm(Ljava/util/List;)V
  .catchall { :L1 .. :L12 } :L13
  .registers 10
  .line 161
    if-nez p0, :L0
  .line 162
    return-void
  :L0
  .line 164
    invoke-static { }, Lcom/innioasis/ipp/YearCache;->load()V
  :L1
  .line 166
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 167
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v1
  .line 168
    const/4 v2, 0
    const/4 v3, 0
  :L2
    if-ge v3, v1, :L11
  .line 169
    invoke-interface { p0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
  .line 170
    if-nez v4, :L3
  .line 171
    goto :L10
  :L3
  .line 173
    invoke-static { v4 }, Lcom/innioasis/ipp/Albums;->isAllSongs(Ljava/lang/String;)Z
    move-result v5
    if-eqz v5, :L4
  .line 174
    goto :L10
  :L4
  .line 176
    sget-object v5, Lcom/innioasis/ipp/YearCache;->map:Ljava/util/HashMap;
    invoke-virtual { v5, v4 }, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z
    move-result v6
    if-eqz v6, :L5
  .line 177
    goto :L10
  :L5
  .line 179
    sget-object v6, Lcom/innioasis/y1/database/Y1Repository$SongSortType;->FileName_A_To_Z:Lcom/innioasis/y1/database/Y1Repository$SongSortType;
    invoke-virtual { v0, v4, v6 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsByAlbum(Ljava/lang/String;Lcom/innioasis/y1/database/Y1Repository$SongSortType;)Ljava/util/List;
    move-result-object v6
  .line 180
    if-eqz v6, :L10
    invoke-interface { v6 }, Ljava/util/List;->isEmpty()Z
    move-result v7
    if-eqz v7, :L6
  .line 181
    goto :L10
  :L6
  .line 183
    invoke-interface { v6, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v6
  .line 184
    if-nez v6, :L7
  .line 185
    goto :L10
  :L7
  .line 187
    const-string v7, ""
  .line 188
    invoke-static { v6, v2 }, Lcom/innioasis/ipp/Meta;->read(Ljava/lang/String;Z)Lcom/innioasis/ipp/Meta$Info;
    move-result-object v6
  .line 189
    iget-object v8, v6, Lcom/innioasis/ipp/Meta$Info;->year:Ljava/lang/String;
    invoke-static { v8 }, Lcom/innioasis/ipp/YearCache;->digits4(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v8
  .line 190
    if-nez v8, :L8
  .line 191
    iget-object v6, v6, Lcom/innioasis/ipp/Meta$Info;->date:Ljava/lang/String;
    invoke-static { v6 }, Lcom/innioasis/ipp/YearCache;->digits4(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v8
  :L8
  .line 193
    if-eqz v8, :L9
  .line 194
    move-object v7, v8
  :L9
  .line 196
    invoke-virtual { v5, v4, v7 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 197
    const/4 v4, 1
    sput-boolean v4, Lcom/innioasis/ipp/YearCache;->dirty:Z
  :L10
  .line 168
    add-int/lit8 v3, v3, 1
    goto :L2
  :L11
  .line 199
    invoke-static { }, Lcom/innioasis/ipp/YearCache;->save()V
  :L12
  .line 201
    goto :L14
  :L13
  .line 200
    move-exception p0
  :L14
  .line 202
    return-void
.end method
