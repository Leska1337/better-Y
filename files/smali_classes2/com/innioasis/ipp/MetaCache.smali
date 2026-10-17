.class public final Lcom/innioasis/ipp/MetaCache;
.super Ljava/lang/Object;
.source "MetaCache.java"

.field private final static FIELDS:I = 5

.field private final static SEP:C = '\t'

.field private final static VER:Ljava/lang/String; = "#v1"

.field private static loaded:Z

.field private final static map:Ljava/util/HashMap;

.method static constructor <clinit>()V
  .registers 1
  .line 20
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/MetaCache;->map:Ljava/util/HashMap;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 18
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static declared-synchronized drop()V
  .catchall { :L0 .. :L1 } :L5
  .catchall { :L1 .. :L2 } :L3
  .registers 2
    const-class v0, Lcom/innioasis/ipp/MetaCache;
    monitor-enter v0
  :L0
  .line 75
    sget-object v1, Lcom/innioasis/ipp/MetaCache;->map:Ljava/util/HashMap;
    invoke-virtual { v1 }, Ljava/util/HashMap;->clear()V
  .line 76
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/MetaCache;->loaded:Z
  :L1
  .line 78
    invoke-static { }, Lcom/innioasis/ipp/MetaCache;->file()Ljava/io/File;
    move-result-object v1
  .line 79
    if-eqz v1, :L2
    invoke-virtual { v1 }, Ljava/io/File;->delete()Z
  :L2
  .line 81
    goto :L4
  :L3
  .line 80
    move-exception v1
  :L4
  .line 82
    monitor-exit v0
    return-void
  :L5
  .line 74
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method private static file()Ljava/io/File;
  .registers 3
  .line 28
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 29
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 30
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 31
    if-nez v0, :L1
    goto :L2
  :L1
    new-instance v1, Ljava/io/File;
    const-string v2, "ipp_meta.txt"
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  :L2
    return-object v1
.end method

.method public static declared-synchronized get(Ljava/lang/String;)Lcom/innioasis/ipp/Meta$Info;
  .catchall { :L0 .. :L1 } :L4
  .catchall { :L2 .. :L3 } :L4
  .registers 5
    const-class v0, Lcom/innioasis/ipp/MetaCache;
    monitor-enter v0
  .line 36
    const/4 v1, 0
    if-nez p0, :L0
    monitor-exit v0
    return-object v1
  :L0
  .line 37
    invoke-static { }, Lcom/innioasis/ipp/MetaCache;->load()V
  .line 38
    sget-object v2, Lcom/innioasis/ipp/MetaCache;->map:Ljava/util/HashMap;
    invoke-virtual { v2, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, [Ljava/lang/String;
  :L1
  .line 39
    if-nez p0, :L2
    monitor-exit v0
    return-object v1
  :L2
  .line 40
    new-instance v1, Lcom/innioasis/ipp/Meta$Info;
    invoke-direct { v1 }, Lcom/innioasis/ipp/Meta$Info;-><init>()V
  .line 41
    const/4 v2, 1
    iput-boolean v2, v1, Lcom/innioasis/ipp/Meta$Info;->ok:Z
  .line 42
    const/4 v3, 0
    aget-object v3, p0, v3
    iput-object v3, v1, Lcom/innioasis/ipp/Meta$Info;->albumArtist:Ljava/lang/String;
  .line 43
    aget-object v2, p0, v2
    iput-object v2, v1, Lcom/innioasis/ipp/Meta$Info;->track:Ljava/lang/String;
  .line 44
    const/4 v2, 2
    aget-object v2, p0, v2
    iput-object v2, v1, Lcom/innioasis/ipp/Meta$Info;->disc:Ljava/lang/String;
  .line 45
    const/4 v2, 3
    aget-object v2, p0, v2
    iput-object v2, v1, Lcom/innioasis/ipp/Meta$Info;->year:Ljava/lang/String;
  .line 46
    const/4 v2, 4
    aget-object p0, p0, v2
    iput-object p0, v1, Lcom/innioasis/ipp/Meta$Info;->date:Ljava/lang/String;
  :L3
  .line 47
    monitor-exit v0
    return-object v1
  :L4
  .line 35
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method private static load()V
  .catchall { :L1 .. :L10 } :L14
  .registers 9
  .line 51
    sget-boolean v0, Lcom/innioasis/ipp/MetaCache;->loaded:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 52
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/MetaCache;->loaded:Z
  :L1
  .line 54
    invoke-static { }, Lcom/innioasis/ipp/MetaCache;->file()Ljava/io/File;
    move-result-object v1
  .line 55
    if-eqz v1, :L13
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-nez v2, :L2
    goto/16 :L13
  :L2
  .line 56
    new-instance v2, Ljava/io/FileInputStream;
    invoke-direct { v2, v1 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 57
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->available()I
    move-result v1
    new-array v1, v1, [B
  .line 58
    invoke-virtual { v2, v1 }, Ljava/io/FileInputStream;->read([B)I
  .line 59
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 60
    new-instance v2, Ljava/lang/String;
    const-string v3, "UTF-8"
    invoke-direct { v2, v1, v3 }, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    const-string v1, "\n"
    invoke-virtual { v2, v1 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v1
  .line 61
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
  .line 62
    nop
  :L4
    array-length v2, v1
    if-ge v0, v2, :L11
  .line 63
    aget-object v2, v1, v0
    const/16 v4, 9
    invoke-static { v4 }, Ljava/lang/String;->valueOf(C)Ljava/lang/String;
    move-result-object v4
    const/4 v5, -1
    invoke-virtual { v2, v4, v5 }, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;
    move-result-object v2
  .line 64
    array-length v4, v2
    const/4 v5, 6
    if-ne v4, v5, :L10
    aget-object v4, v2, v3
    invoke-virtual { v4 }, Ljava/lang/String;->length()I
    move-result v4
    if-nez v4, :L5
    goto :L10
  :L5
  .line 65
    const/4 v4, 5
    new-array v5, v4, [Ljava/lang/String;
  .line 66
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
  .line 67
    sget-object v4, Lcom/innioasis/ipp/MetaCache;->map:Ljava/util/HashMap;
    aget-object v2, v2, v3
    invoke-virtual { v4, v2, v5 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L10
  .line 62
    add-int/lit8 v0, v0, 1
    goto :L4
  :L11
  .line 70
    goto :L15
  :L12
  .line 61
    return-void
  :L13
  .line 55
    return-void
  :L14
  .line 69
    move-exception v0
  :L15
  .line 71
    return-void
.end method
