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
  .line 29
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/GenreInfo;->map:Ljava/util/HashMap;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 27
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static clear()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 133
    sget-object v0, Lcom/innioasis/ipp/GenreInfo;->map:Ljava/util/HashMap;
    invoke-virtual { v0 }, Ljava/util/HashMap;->clear()V
  .line 134
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/GenreInfo;->loaded:Z
  .line 135
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/GenreInfo;->dirty:Z
  :L0
  .line 137
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->file()Ljava/io/File;
    move-result-object v0
  .line 138
    if-eqz v0, :L1
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v1
    if-eqz v1, :L1
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  :L1
  .line 140
    goto :L3
  :L2
  .line 139
    move-exception v0
  :L3
  .line 141
    return-void
.end method

.method private static file()Ljava/io/File;
  .registers 3
  .line 144
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 145
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 146
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 147
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
  .line 37
    if-eqz p0, :L6
  :L0
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object v0
    if-nez v0, :L1
    goto :L6
  :L1
  .line 38
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Genre;->getInfo()Ljava/lang/String;
    move-result-object v0
  .line 39
    if-eqz v0, :L2
    invoke-virtual { v0 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v0
    if-lez v0, :L2
    return-void
  :L2
  .line 40
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->load()V
  .line 41
    sget-object v0, Lcom/innioasis/ipp/GenreInfo;->map:Ljava/util/HashMap;
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
  .line 42
    if-eqz v0, :L3
    check-cast v0, Ljava/lang/String;
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/data/Genre;->setInfo(Ljava/lang/String;)V
  :L3
  .line 44
    goto :L5
  :L4
  .line 43
    move-exception p0
  :L5
  .line 45
    return-void
  :L6
  .line 37
    return-void
.end method

.method public static invalidate()V
  .registers 1
  .line 127
    sget-object v0, Lcom/innioasis/ipp/GenreInfo;->map:Ljava/util/HashMap;
    invoke-virtual { v0 }, Ljava/util/HashMap;->clear()V
  .line 128
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/GenreInfo;->loaded:Z
  .line 129
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/GenreInfo;->dirty:Z
  .line 130
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
  .line 157
    sget-boolean v1, Lcom/innioasis/ipp/GenreInfo;->loaded:Z
  :L1
    if-eqz v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 158
    const/4 v1, 1
  :L3
    sput-boolean v1, Lcom/innioasis/ipp/GenreInfo;->loaded:Z
  :L4
  .line 160
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->file()Ljava/io/File;
    move-result-object v2
  .line 161
    if-eqz v2, :L12
    invoke-virtual { v2 }, Ljava/io/File;->exists()Z
    move-result v3
    if-nez v3, :L5
    goto :L12
  :L5
  .line 162
    new-instance v3, Ljava/io/FileInputStream;
    invoke-direct { v3, v2 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 163
    invoke-virtual { v3 }, Ljava/io/FileInputStream;->available()I
    move-result v2
    new-array v2, v2, [B
  .line 164
    invoke-virtual { v3, v2 }, Ljava/io/FileInputStream;->read([B)I
  .line 165
    invoke-virtual { v3 }, Ljava/io/FileInputStream;->close()V
  .line 166
    new-instance v3, Ljava/lang/String;
    const-string v4, "UTF-8"
    invoke-direct { v3, v2, v4 }, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    const-string v2, "\n"
    invoke-virtual { v3, v2 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v2
  .line 167
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
  .line 168
    nop
  :L7
    array-length v3, v2
    if-ge v1, v3, :L10
  .line 169
    aget-object v3, v2, v1
  .line 170
    const/16 v5, 9
    invoke-virtual { v3, v5 }, Ljava/lang/String;->indexOf(I)I
    move-result v5
  .line 171
    if-gtz v5, :L8
    goto :L9
  :L8
  .line 172
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
  .line 168
    add-int/lit8 v1, v1, 1
    goto :L7
  :L10
  .line 175
    goto :L14
  :L11
  .line 167
    monitor-exit v0
    return-void
  :L12
  .line 161
    monitor-exit v0
    return-void
  :L13
  .line 174
    move-exception v1
  :L14
  .line 176
    monitor-exit v0
    return-void
  :L15
  .line 156
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
  .line 115
    if-eqz p0, :L8
    if-eqz p1, :L8
  :L0
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L1
    goto :L8
  :L1
  .line 116
    const/16 v0, 9
    invoke-virtual { p0, v0 }, Ljava/lang/String;->indexOf(I)I
    move-result v1
    if-gez v1, :L5
    invoke-virtual { p1, v0 }, Ljava/lang/String;->indexOf(I)I
    move-result v0
    if-ltz v0, :L2
    goto :L5
  :L2
  .line 117
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->load()V
  .line 118
    sget-object v0, Lcom/innioasis/ipp/GenreInfo;->map:Ljava/util/HashMap;
    invoke-virtual { v0, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    invoke-virtual { p1, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L3
    return-void
  :L3
  .line 119
    invoke-virtual { v0, p0, p1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 120
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/GenreInfo;->dirty:Z
  .line 121
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->save()V
  :L4
  .line 123
    goto :L7
  :L5
  .line 116
    return-void
  :L6
  .line 122
    move-exception p0
  :L7
  .line 124
    return-void
  :L8
  .line 115
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
  .line 179
    sget-boolean v1, Lcom/innioasis/ipp/GenreInfo;->dirty:Z
  :L1
    if-nez v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 181
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->file()Ljava/io/File;
    move-result-object v1
  :L3
  .line 182
    if-nez v1, :L4
    monitor-exit v0
    return-void
  :L4
  .line 183
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
  .line 184
    const-string v3, "#v2"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    const/16 v4, 10
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 185
    sget-object v3, Lcom/innioasis/ipp/GenreInfo;->map:Ljava/util/HashMap;
    invoke-virtual { v3 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v3
    invoke-interface { v3 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v3
  :L5
  .line 186
    invoke-interface { v3 }, Ljava/util/Iterator;->hasNext()Z
    move-result v5
    if-eqz v5, :L6
  .line 187
    invoke-interface { v3 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/util/Map$Entry;
  .line 188
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
  .line 189
    goto :L5
  :L6
  .line 190
    new-instance v3, Ljava/io/FileOutputStream;
    invoke-direct { v3, v1 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  .line 191
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    const-string v2, "UTF-8"
    invoke-virtual { v1, v2 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object v1
    invoke-virtual { v3, v1 }, Ljava/io/FileOutputStream;->write([B)V
  .line 192
    invoke-virtual { v3 }, Ljava/io/FileOutputStream;->close()V
  .line 193
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/GenreInfo;->dirty:Z
  :L7
  .line 195
    goto :L9
  :L8
  .line 194
    move-exception v1
  :L9
  .line 196
    monitor-exit v0
    return-void
  :L10
  .line 178
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
  .line 53
    if-nez p0, :L0
    return-void
  :L0
  .line 54
    invoke-static { }, Lcom/innioasis/ipp/GenreInfo;->load()V
  .line 55
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 56
    const/4 v1, 0
  :L1
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v2
    if-ge v1, v2, :L6
  .line 57
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v2
  .line 58
    instance-of v3, v2, Lcom/innioasis/music/data/Genre;
    if-nez v3, :L2
    goto :L5
  :L2
  .line 59
    check-cast v2, Lcom/innioasis/music/data/Genre;
  .line 60
    invoke-virtual { v2 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object v3
    if-nez v3, :L3
    goto :L5
  :L3
  .line 61
    sget-object v3, Lcom/innioasis/ipp/GenreInfo;->map:Ljava/util/HashMap;
    invoke-virtual { v2 }, Lcom/innioasis/music/data/Genre;->getName()Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v3, v4 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v3
  .line 62
    if-eqz v3, :L4
    check-cast v3, Ljava/lang/String;
    invoke-virtual { v2, v3 }, Lcom/innioasis/music/data/Genre;->setInfo(Ljava/lang/String;)V
    goto :L5
  :L4
  .line 63
    invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 56
    add-int/lit8 v1, v1, 1
    goto :L1
  :L6
  .line 65
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-nez v1, :L7
    new-instance v1, Ljava/lang/Thread;
    new-instance v2, Lcom/innioasis/ipp/GenreInfo$Warm;
    invoke-direct { v2, p0, v0 }, Lcom/innioasis/ipp/GenreInfo$Warm;-><init>(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/util/ArrayList;)V
    invoke-direct { v1, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v1 }, Ljava/lang/Thread;->start()V
  :L7
  .line 67
    goto :L9
  :L8
  .line 66
    move-exception p0
  :L9
  .line 68
    return-void
.end method
