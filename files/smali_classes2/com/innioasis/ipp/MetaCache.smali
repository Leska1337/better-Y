.class public final Lcom/innioasis/ipp/MetaCache;
.super Ljava/lang/Object;
.source "MetaCache.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/MetaCache$Flush;
  }
.end annotation

.field private final static FIELDS:I = 5

.field private final static FLUSH:Ljava/lang/Runnable;

.field private final static FLUSH_DELAY_MS:J = 5000L

.field private final static SEP:C = '\t'

.field private final static VER:Ljava/lang/String; = "#v1"

.field private static dirty:Z

.field private static flushAsked:Z

.field private static loaded:Z

.field private final static map:Ljava/util/HashMap;

.method static constructor <clinit>()V
  .registers 1
  .line 24
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/MetaCache;->map:Ljava/util/HashMap;
  .line 33
    new-instance v0, Lcom/innioasis/ipp/MetaCache$Flush;
    invoke-direct { v0 }, Lcom/innioasis/ipp/MetaCache$Flush;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/MetaCache;->FLUSH:Ljava/lang/Runnable;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 22
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method private static clean(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 75
    if-eqz p0, :L1
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L0
    goto :L1
  :L0
  .line 76
    const/16 v0, 9
    const/16 v1, 32
    invoke-virtual { p0, v0, v1 }, Ljava/lang/String;->replace(CC)Ljava/lang/String;
    move-result-object p0
    const/16 v0, 10
    invoke-virtual { p0, v0, v1 }, Ljava/lang/String;->replace(CC)Ljava/lang/String;
    move-result-object p0
    const/16 v0, 13
    invoke-virtual { p0, v0, v1 }, Ljava/lang/String;->replace(CC)Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L1
  .line 75
    const/4 p0, 0
    return-object p0
.end method

.method public static declared-synchronized clear()V
  .catchall { :L0 .. :L1 } :L5
  .catchall { :L1 .. :L2 } :L3
  .registers 3
    const-class v0, Lcom/innioasis/ipp/MetaCache;
    monitor-enter v0
  :L0
  .line 148
    sget-object v1, Lcom/innioasis/ipp/MetaCache;->map:Ljava/util/HashMap;
    invoke-virtual { v1 }, Ljava/util/HashMap;->clear()V
  .line 149
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/MetaCache;->loaded:Z
  .line 150
    sput-boolean v1, Lcom/innioasis/ipp/MetaCache;->dirty:Z
  :L1
  .line 152
    invoke-static { }, Lcom/innioasis/ipp/MetaCache;->file()Ljava/io/File;
    move-result-object v1
  .line 153
    if-eqz v1, :L2
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-eqz v2, :L2
    invoke-virtual { v1 }, Ljava/io/File;->delete()Z
  :L2
  .line 155
    goto :L4
  :L3
  .line 154
    move-exception v1
  :L4
  .line 156
    monitor-exit v0
    return-void
  :L5
  .line 147
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method private static file()Ljava/io/File;
  .registers 3
  .line 36
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 37
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 38
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 39
    if-nez v0, :L1
    goto :L2
  :L1
    new-instance v1, Ljava/io/File;
    const-string v2, "ipp_meta.txt"
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  :L2
    return-object v1
.end method

.method public static flush()V
  .catchall { :L0 .. :L2 } :L15
  .catchall { :L2 .. :L9 } :L10
  .catchall { :L11 .. :L14 } :L13
  .catchall { :L16 .. :L17 } :L15
  .registers 9
  .line 110
    const-class v0, Lcom/innioasis/ipp/MetaCache;
    monitor-enter v0
  .line 111
    const/4 v1, 0
  :L0
    sput-boolean v1, Lcom/innioasis/ipp/MetaCache;->flushAsked:Z
  .line 112
    sget-boolean v2, Lcom/innioasis/ipp/MetaCache;->dirty:Z
    if-nez v2, :L1
    monitor-exit v0
    return-void
  :L1
  .line 113
    sput-boolean v1, Lcom/innioasis/ipp/MetaCache;->dirty:Z
  .line 114
    sget-object v2, Lcom/innioasis/ipp/MetaCache;->map:Ljava/util/HashMap;
    invoke-virtual { v2 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v2
    invoke-interface { v2 }, Ljava/util/Set;->toArray()[Ljava/lang/Object;
    move-result-object v2
  .line 115
    monitor-exit v0
  :L2
  .line 117
    invoke-static { }, Lcom/innioasis/ipp/MetaCache;->file()Ljava/io/File;
    move-result-object v0
  .line 118
    if-nez v0, :L3
    return-void
  :L3
  .line 119
    new-instance v3, Ljava/lang/StringBuilder;
    array-length v4, v2
    mul-int/lit8 v4, v4, 96
    invoke-direct { v3, v4 }, Ljava/lang/StringBuilder;-><init>(I)V
  .line 120
    const-string v4, "#v1"
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    const/16 v5, 10
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 121
    const/4 v4, 0
  :L4
    array-length v6, v2
    if-ge v4, v6, :L8
  .line 122
    aget-object v6, v2, v4
    check-cast v6, Ljava/util/Map$Entry;
  .line 123
    invoke-interface { v6 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v7
    check-cast v7, [Ljava/lang/String;
  .line 124
    invoke-interface { v6 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Ljava/lang/String;
    invoke-virtual { v3, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 125
    const/4 v6, 0
  :L5
    const/4 v8, 5
    if-ge v6, v8, :L7
  .line 126
    const/16 v8, 9
    invoke-virtual { v3, v8 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 127
    aget-object v8, v7, v6
    if-eqz v8, :L6
    invoke-virtual { v3, v8 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L6
  .line 125
    add-int/lit8 v6, v6, 1
    goto :L5
  :L7
  .line 129
    invoke-virtual { v3, v5 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 121
    add-int/lit8 v4, v4, 1
    goto :L4
  :L8
  .line 133
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    const-string v3, "UTF-8"
    invoke-virtual { v1, v3 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object v1
  .line 134
    new-instance v3, Ljava/io/FileOutputStream;
    invoke-direct { v3, v0 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  .line 135
    invoke-virtual { v3, v1 }, Ljava/io/FileOutputStream;->write([B)V
  .line 136
    invoke-virtual { v3 }, Ljava/io/FileOutputStream;->close()V
  .line 137
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "tags table: "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    array-length v1, v2
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " songs saved"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L9
  .line 140
    goto :L12
  :L10
  .line 138
    move-exception v0
  .line 139
    const-class v1, Lcom/innioasis/ipp/MetaCache;
    monitor-enter v1
    const/4 v0, 1
  :L11
    sput-boolean v0, Lcom/innioasis/ipp/MetaCache;->dirty:Z
    monitor-exit v1
  :L12
  .line 141
    return-void
  :L13
  .line 139
    move-exception v0
    monitor-exit v1
  :L14
    throw v0
  :L15
  .line 115
    move-exception v1
  :L16
    monitor-exit v0
  :L17
    goto :L19
  :L18
    throw v1
  :L19
    goto :L18
.end method

.method public static declared-synchronized get(Ljava/lang/String;)Lcom/innioasis/ipp/Meta$Info;
  .catchall { :L0 .. :L1 } :L4
  .catchall { :L2 .. :L3 } :L4
  .registers 5
    const-class v0, Lcom/innioasis/ipp/MetaCache;
    monitor-enter v0
  .line 44
    const/4 v1, 0
    if-nez p0, :L0
    monitor-exit v0
    return-object v1
  :L0
  .line 45
    invoke-static { }, Lcom/innioasis/ipp/MetaCache;->load()V
  .line 46
    sget-object v2, Lcom/innioasis/ipp/MetaCache;->map:Ljava/util/HashMap;
    invoke-virtual { v2, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, [Ljava/lang/String;
  :L1
  .line 47
    if-nez p0, :L2
    monitor-exit v0
    return-object v1
  :L2
  .line 48
    new-instance v1, Lcom/innioasis/ipp/Meta$Info;
    invoke-direct { v1 }, Lcom/innioasis/ipp/Meta$Info;-><init>()V
  .line 49
    const/4 v2, 1
    iput-boolean v2, v1, Lcom/innioasis/ipp/Meta$Info;->ok:Z
  .line 50
    const/4 v3, 0
    aget-object v3, p0, v3
    iput-object v3, v1, Lcom/innioasis/ipp/Meta$Info;->albumArtist:Ljava/lang/String;
  .line 51
    aget-object v2, p0, v2
    iput-object v2, v1, Lcom/innioasis/ipp/Meta$Info;->track:Ljava/lang/String;
  .line 52
    const/4 v2, 2
    aget-object v2, p0, v2
    iput-object v2, v1, Lcom/innioasis/ipp/Meta$Info;->disc:Ljava/lang/String;
  .line 53
    const/4 v2, 3
    aget-object v2, p0, v2
    iput-object v2, v1, Lcom/innioasis/ipp/Meta$Info;->year:Ljava/lang/String;
  .line 54
    const/4 v2, 4
    aget-object p0, p0, v2
    iput-object p0, v1, Lcom/innioasis/ipp/Meta$Info;->date:Ljava/lang/String;
  :L3
  .line 55
    monitor-exit v0
    return-object v1
  :L4
  .line 43
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method private static load()V
  .catchall { :L1 .. :L10 } :L14
  .registers 9
  .line 85
    sget-boolean v0, Lcom/innioasis/ipp/MetaCache;->loaded:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 86
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/MetaCache;->loaded:Z
  :L1
  .line 88
    invoke-static { }, Lcom/innioasis/ipp/MetaCache;->file()Ljava/io/File;
    move-result-object v1
  .line 89
    if-eqz v1, :L13
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-nez v2, :L2
    goto/16 :L13
  :L2
  .line 90
    new-instance v2, Ljava/io/FileInputStream;
    invoke-direct { v2, v1 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 91
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->available()I
    move-result v1
    new-array v1, v1, [B
  .line 92
    invoke-virtual { v2, v1 }, Ljava/io/FileInputStream;->read([B)I
  .line 93
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 94
    new-instance v2, Ljava/lang/String;
    const-string v3, "UTF-8"
    invoke-direct { v2, v1, v3 }, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    const-string v1, "\n"
    invoke-virtual { v2, v1 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v1
  .line 95
    array-length v2, v1
    if-eqz v2, :L12
    const-string v2, "#v1"
    const/4 v3, 0
    aget-object v4, v1, v3
    invoke-virtual { v4 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v2, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :L3
    goto :L12
  :L3
  .line 96
    nop
  :L4
    array-length v2, v1
    if-ge v0, v2, :L11
  .line 97
    aget-object v2, v1, v0
    const-string v4, "\t"
    const/4 v5, -1
    invoke-virtual { v2, v4, v5 }, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;
    move-result-object v2
  .line 98
    array-length v4, v2
    const/4 v5, 6
    if-ne v4, v5, :L10
    aget-object v4, v2, v3
    invoke-virtual { v4 }, Ljava/lang/String;->length()I
    move-result v4
    if-nez v4, :L5
    goto :L10
  :L5
  .line 99
    const/4 v4, 5
    new-array v5, v4, [Ljava/lang/String;
  .line 100
    const/4 v6, 0
  :L6
    if-ge v6, v4, :L9
    add-int/lit8 v7, v6, 1
    aget-object v8, v2, v7
    invoke-virtual { v8 }, Ljava/lang/String;->length()I
    move-result v8
    if-nez v8, :L7
    const/4 v8, 0
    goto :L8
  :L7
    aget-object v8, v2, v7
  :L8
    aput-object v8, v5, v6
    move v6, v7
    goto :L6
  :L9
  .line 101
    sget-object v4, Lcom/innioasis/ipp/MetaCache;->map:Ljava/util/HashMap;
    aget-object v2, v2, v3
    invoke-virtual { v4, v2, v5 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L10
  .line 96
    add-int/lit8 v0, v0, 1
    goto :L4
  :L11
  .line 104
    goto :L15
  :L12
  .line 95
    return-void
  :L13
  .line 89
    return-void
  :L14
  .line 103
    move-exception v0
  :L15
  .line 105
    return-void
.end method

.method public static put(Ljava/lang/String;Lcom/innioasis/ipp/Meta$Info;)V
  .catchall { :L1 .. :L3 } :L5
  .catchall { :L6 .. :L7 } :L5
  .registers 9
  .line 60
    if-eqz p0, :L8
    if-eqz p1, :L8
    const/16 v0, 9
    invoke-virtual { p0, v0 }, Ljava/lang/String;->indexOf(I)I
    move-result v0
    if-gez v0, :L8
    const/16 v0, 10
    invoke-virtual { p0, v0 }, Ljava/lang/String;->indexOf(I)I
    move-result v0
    if-ltz v0, :L0
    goto :L8
  :L0
  .line 62
    const-class v0, Lcom/innioasis/ipp/MetaCache;
    monitor-enter v0
  :L1
  .line 63
    invoke-static { }, Lcom/innioasis/ipp/MetaCache;->load()V
  .line 64
    sget-object v1, Lcom/innioasis/ipp/MetaCache;->map:Ljava/util/HashMap;
    const/4 v2, 5
    new-array v2, v2, [Ljava/lang/String;
    iget-object v3, p1, Lcom/innioasis/ipp/Meta$Info;->albumArtist:Ljava/lang/String;
  .line 65
    invoke-static { v3 }, Lcom/innioasis/ipp/MetaCache;->clean(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    const/4 v4, 0
    aput-object v3, v2, v4
    iget-object v3, p1, Lcom/innioasis/ipp/Meta$Info;->track:Ljava/lang/String;
    invoke-static { v3 }, Lcom/innioasis/ipp/MetaCache;->clean(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    const/4 v5, 1
    aput-object v3, v2, v5
    iget-object v3, p1, Lcom/innioasis/ipp/Meta$Info;->disc:Ljava/lang/String;
    invoke-static { v3 }, Lcom/innioasis/ipp/MetaCache;->clean(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    const/4 v6, 2
    aput-object v3, v2, v6
    iget-object v3, p1, Lcom/innioasis/ipp/Meta$Info;->year:Ljava/lang/String;
    invoke-static { v3 }, Lcom/innioasis/ipp/MetaCache;->clean(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    const/4 v6, 3
    aput-object v3, v2, v6
    iget-object p1, p1, Lcom/innioasis/ipp/Meta$Info;->date:Ljava/lang/String;
    invoke-static { p1 }, Lcom/innioasis/ipp/MetaCache;->clean(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    const/4 v3, 4
    aput-object p1, v2, v3
  .line 64
    invoke-virtual { v1, p0, v2 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 66
    sput-boolean v5, Lcom/innioasis/ipp/MetaCache;->dirty:Z
  .line 67
    sget-boolean p0, Lcom/innioasis/ipp/MetaCache;->flushAsked:Z
    if-nez p0, :L2
    const/4 v4, 1
  :L2
  .line 68
    sput-boolean v5, Lcom/innioasis/ipp/MetaCache;->flushAsked:Z
  .line 69
    monitor-exit v0
  :L3
  .line 70
    if-eqz v4, :L4
    sget-object p0, Lcom/innioasis/ipp/MetaCache;->FLUSH:Ljava/lang/Runnable;
    const-wide/16 v0, 5000
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Albums;->later(Ljava/lang/Runnable;J)V
  :L4
  .line 71
    return-void
  :L5
  .line 69
    move-exception p0
  :L6
    monitor-exit v0
  :L7
    throw p0
  :L8
  .line 60
    return-void
.end method

.method public static declared-synchronized warm()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
    const-class v0, Lcom/innioasis/ipp/MetaCache;
    monitor-enter v0
  :L0
  .line 81
    invoke-static { }, Lcom/innioasis/ipp/MetaCache;->load()V
  :L1
  .line 82
    monitor-exit v0
    return-void
  :L2
  .line 80
    move-exception v1
    monitor-exit v0
    throw v1
.end method
