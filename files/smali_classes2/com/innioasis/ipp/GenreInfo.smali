.class public final Lcom/innioasis/ipp/GenreInfo;
.super Ljava/lang/Object;
.source "GenreInfo.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/GenreInfo$Warm;,
    Lcom/innioasis/ipp/GenreInfo$Repaint;
  }
.end annotation

.field private final static SEP:C = '\t'

.field private final static VERSION:Ljava/lang/String; = "#v2"

.field private static dirty:Z

.field private static loaded:Z

.field private final static map:Ljava/util/HashMap;

.method static constructor <clinit>()V
  .registers 1
  .line 42
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/GenreInfo;->map:Ljava/util/HashMap;
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
  .line 165
    sget-object v0, Lcom/innioasis/ipp/GenreInfo;->map:Ljava/util/HashMap;
    invoke-virtual { v0 }, Ljava/util/HashMap;->clear()V
  .line 166
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/GenreInfo;->loaded:Z
  .line 167
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/GenreInfo;->dirty:Z
  :L0
  .line 169
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->file()Ljava/io/File;
    move-result-object v0
  .line 170
    if-eqz v0, :L1
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v1
    if-eqz v1, :L1
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  :L1
  .line 173
    goto :L3
  :L2
  .line 171
    move-exception v0
  :L3
  .line 174
    return-void
.end method

.method private static file()Ljava/io/File;
  .registers 3
  .line 177
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 178
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 179
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 180
    if-nez v0, :L1
    goto :L2
  :L1
    new-instance v1, Ljava/io/File;
    const-string v2, "ipp_genres.txt"
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  :L2
    return-object v1
.end method

.method public static fill(Lcom/innioasis/music/data/Genre;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 3
  .line 55
    if-eqz p0, :L6
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object v0
    if-nez v0, :L1
    goto :L6
  :L1
  .line 56
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Genre;->getInfo()Ljava/lang/String;
    move-result-object v0
  .line 57
    if-eqz v0, :L2
    invoke-virtual { v0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v0
    if-lez v0, :L2
    return-void
  :L2
  .line 58
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->load()V
  .line 59
    sget-object v0, Lcom/innioasis/ipp/GenreInfo;->map:Ljava/util/HashMap;
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
  .line 60
    if-eqz v0, :L3
    check-cast v0, Ljava/lang/String;
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/data/Genre;->setInfo(Ljava/lang/String;)V
  :L3
  .line 63
    goto :L5
  :L4
  .line 61
    move-exception p0
  :L5
  .line 64
    return-void
  :L6
  .line 55
    return-void
.end method

.method public static invalidate()V
  .registers 1
  .line 159
    sget-object v0, Lcom/innioasis/ipp/GenreInfo;->map:Ljava/util/HashMap;
    invoke-virtual { v0 }, Ljava/util/HashMap;->clear()V
  .line 160
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/GenreInfo;->loaded:Z
  .line 161
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/GenreInfo;->dirty:Z
  .line 162
    return-void
.end method

.method private static declared-synchronized load()V
  .catchall { :L0 .. :L1 } :L15
  .catchall { :L3 .. :L4 } :L15
  .catchall { :L4 .. :L9 } :L13
  .registers 8
    const-class v0, Lcom/innioasis/ipp/GenreInfo;
    monitor-enter v0
  :L0
  .line 191
    sget-boolean v1, Lcom/innioasis/ipp/GenreInfo;->loaded:Z
  :L1
    if-eqz v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 192
    const/4 v1, 1
  :L3
    sput-boolean v1, Lcom/innioasis/ipp/GenreInfo;->loaded:Z
  :L4
  .line 194
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->file()Ljava/io/File;
    move-result-object v2
  .line 195
    if-eqz v2, :L12
    invoke-virtual { v2 }, Ljava/io/File;->exists()Z
    move-result v3
    if-nez v3, :L5
    goto :L12
  :L5
  .line 196
    new-instance v3, Ljava/io/FileInputStream;
    invoke-direct { v3, v2 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 197
    invoke-virtual { v3 }, Ljava/io/FileInputStream;->available()I
    move-result v2
    new-array v2, v2, [B
  .line 198
    invoke-virtual { v3, v2 }, Ljava/io/FileInputStream;->read([B)I
  .line 199
    invoke-virtual { v3 }, Ljava/io/FileInputStream;->close()V
  .line 200
    new-instance v3, Ljava/lang/String;
    const-string v4, "UTF-8"
    invoke-direct { v3, v2, v4 }, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    const-string v2, "\n"
    invoke-virtual { v3, v2 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v2
  .line 201
    array-length v3, v2
    if-eqz v3, :L11
    const-string v3, "#v2"
    const/4 v4, 0
    aget-object v5, v2, v4
    invoke-virtual { v5 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v3, v5 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :L6
    goto :L11
  :L6
  .line 202
    nop
  :L7
    array-length v3, v2
    if-ge v1, v3, :L10
  .line 203
    aget-object v3, v2, v1
  .line 204
    const/16 v5, 9
    invoke-virtual { v3, v5 }, Ljava/lang/String;->indexOf(I)I
    move-result v5
  .line 205
    if-gtz v5, :L8
    goto :L9
  :L8
  .line 206
    sget-object v6, Lcom/innioasis/ipp/GenreInfo;->map:Ljava/util/HashMap;
    invoke-virtual { v3, v4, v5 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v7
    add-int/lit8 v5, v5, 1
    invoke-virtual { v3, v5 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v6, v7, v3 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L9
  .line 202
    add-int/lit8 v1, v1, 1
    goto :L7
  :L10
  .line 210
    goto :L14
  :L11
  .line 201
    monitor-exit v0
    return-void
  :L12
  .line 195
    monitor-exit v0
    return-void
  :L13
  .line 208
    move-exception v1
  :L14
  .line 211
    monitor-exit v0
    return-void
  :L15
  .line 190
    move-exception v1
    monitor-exit v0
    goto :L17
  :L16
    throw v1
  :L17
    goto :L16
.end method

.method public static put(Ljava/lang/String;Ljava/lang/String;)V
  .catchall { :L0 .. :L4 } :L6
  .registers 4
  .line 145
    if-eqz p0, :L8
    if-eqz p1, :L8
  :L0
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L1
    goto :L8
  :L1
  .line 146
    const/16 v0, 9
    invoke-virtual { p0, v0 }, Ljava/lang/String;->indexOf(I)I
    move-result v1
    if-gez v1, :L5
    invoke-virtual { p1, v0 }, Ljava/lang/String;->indexOf(I)I
    move-result v0
    if-ltz v0, :L2
    goto :L5
  :L2
  .line 147
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->load()V
  .line 148
    sget-object v0, Lcom/innioasis/ipp/GenreInfo;->map:Ljava/util/HashMap;
    invoke-virtual { v0, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L3
    return-void
  :L3
  .line 149
    invoke-virtual { v0, p0, p1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 150
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/GenreInfo;->dirty:Z
  .line 151
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->save()V
  :L4
  .line 154
    goto :L7
  :L5
  .line 146
    return-void
  :L6
  .line 152
    move-exception p0
  :L7
  .line 155
    return-void
  :L8
  .line 145
    return-void
.end method

.method private static declared-synchronized save()V
  .catchall { :L0 .. :L1 } :L10
  .catchall { :L2 .. :L3 } :L8
  .catchall { :L4 .. :L7 } :L8
  .registers 8
    const-class v0, Lcom/innioasis/ipp/GenreInfo;
    monitor-enter v0
  :L0
  .line 214
    sget-boolean v1, Lcom/innioasis/ipp/GenreInfo;->dirty:Z
  :L1
    if-nez v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 216
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->file()Ljava/io/File;
    move-result-object v1
  :L3
  .line 217
    if-nez v1, :L4
    monitor-exit v0
    return-void
  :L4
  .line 218
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
  .line 219
    const-string v3, "#v2"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    const/16 v4, 10
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 220
    sget-object v3, Lcom/innioasis/ipp/GenreInfo;->map:Ljava/util/HashMap;
    invoke-virtual { v3 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v3
    invoke-interface { v3 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v3
  :L5
  .line 221
    invoke-interface { v3 }, Ljava/util/Iterator;->hasNext()Z
    move-result v5
    if-eqz v5, :L6
  .line 222
    invoke-interface { v3 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/util/Map$Entry;
  .line 223
    invoke-interface { v5 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Ljava/lang/String;
    invoke-virtual { v2, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    const/16 v7, 9
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-interface { v5 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/String;
    invoke-virtual { v6, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 224
    goto :L5
  :L6
  .line 225
    new-instance v3, Ljava/io/FileOutputStream;
    invoke-direct { v3, v1 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  .line 226
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    const-string v2, "UTF-8"
    invoke-virtual { v1, v2 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object v1
    invoke-virtual { v3, v1 }, Ljava/io/FileOutputStream;->write([B)V
  .line 227
    invoke-virtual { v3 }, Ljava/io/FileOutputStream;->close()V
  .line 228
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/GenreInfo;->dirty:Z
  :L7
  .line 231
    goto :L9
  :L8
  .line 229
    move-exception v1
  :L9
  .line 232
    monitor-exit v0
    return-void
  :L10
  .line 213
    move-exception v1
    monitor-exit v0
    goto :L12
  :L11
    throw v1
  :L12
    goto :L11
.end method

.method public static warm(Lcom/innioasis/music/adapter/MyBaseAdapter;)V
  .catchall { :L0 .. :L7 } :L8
  .registers 6
  .line 78
    if-nez p0, :L0
    return-void
  :L0
  .line 79
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->load()V
  .line 80
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 81
    const/4 v1, 0
  :L1
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v2
    if-ge v1, v2, :L6
  .line 82
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v2
  .line 83
    instance-of v3, v2, Lcom/innioasis/music/data/Genre;
    if-nez v3, :L2
    goto :L5
  :L2
  .line 84
    check-cast v2, Lcom/innioasis/music/data/Genre;
  .line 85
    invoke-virtual { v2 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object v3
    if-nez v3, :L3
    goto :L5
  :L3
  .line 86
    sget-object v3, Lcom/innioasis/ipp/GenreInfo;->map:Ljava/util/HashMap;
    invoke-virtual { v2 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v3, v4 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v3
  .line 87
    if-eqz v3, :L4
    check-cast v3, Ljava/lang/String;
    invoke-virtual { v2, v3 }, Lcom/innioasis/music/data/Genre;->setInfo(Ljava/lang/String;)V
    goto :L5
  :L4
  .line 88
    invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 81
    add-int/lit8 v1, v1, 1
    goto :L1
  :L6
  .line 90
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-nez v1, :L7
    new-instance v1, Ljava/lang/Thread;
    new-instance v2, Lcom/innioasis/ipp/GenreInfo$Warm;
    invoke-direct { v2, p0, v0 }, Lcom/innioasis/ipp/GenreInfo$Warm;-><init>(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/util/ArrayList;)V
    invoke-direct { v1, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v1 }, Ljava/lang/Thread;->start()V
  :L7
  .line 93
    goto :L9
  :L8
  .line 91
    move-exception p0
  :L9
  .line 94
    return-void
.end method
