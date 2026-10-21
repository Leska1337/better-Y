.class public final Lcom/innioasis/ipp/Scan;
.super Ljava/lang/Object;
.source "Scan.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Scan$Looker;,
    Lcom/innioasis/ipp/Scan$Builder;
  }
.end annotation

.field private final static AHEAD:Ljava/util/LinkedList;

.field private final static BOOK:[Ljava/lang/String;

.field private final static DIR:I = 2

.field private final static EXISTS:I = 1

.field private final static GAP_MS:J = 5000L

.field private final static IDLE_MS:J = 5000L

.field private final static LOCK:Ljava/lang/Object;

.field private final static LOOK:I = 4

.field private final static MARKER:Lcom/innioasis/y1/database/Song;

.field private final static MUSIC:[Ljava/lang/String;

.field private final static THEMES:Ljava/lang/String; = "/storage/sdcard0/themes"

.field private final static VIDEO:[Ljava/lang/String;

.field private final static WAIT_MS:J = 20000L

.field private static added:I

.field private static asked:J

.field private final static bookExt:Ljava/util/HashSet;

.field private final static building:Ljava/util/HashSet;

.field private static card:Ljava/lang/String;

.field private static dir:Ljava/lang/String;

.field private static expected:I

.field private static ext:Ljava/lang/String;

.field private static files:[Ljava/io/File;

.field private static kind:I

.field private static live:I

.field private static looking:Z

.field private static met:Ljava/util/HashSet;

.field private final static musicExt:Ljava/util/HashSet;

.field private static next:I

.field private static node:Ljava/io/File;

.field private static volatile paths:Ljava/util/HashSet;

.field private final static ready:Ljava/util/HashMap;

.field private static repo:Lcom/innioasis/y1/database/Y1Repository;

.field private static seen:I

.field private static shown:I

.field private final static videoExt:Ljava/util/HashSet;

.method static constructor <clinit>()V
  .registers 25
  .line 51
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Scan;->shown:I
  .line 65
    const/16 v0, 22
    new-array v0, v0, [Ljava/lang/String;
    const/4 v1, 0
    const-string v2, "ogg"
    aput-object v2, v0, v1
    const/4 v3, 1
    const-string v4, "mp3"
    aput-object v4, v0, v3
    const/4 v5, 2
    const-string v6, "amr"
    aput-object v6, v0, v5
    const/4 v7, 3
    const-string v8, "ape"
    aput-object v8, v0, v7
    const/4 v9, 4
    const-string v10, "flac"
    aput-object v10, v0, v9
    const/4 v11, 5
    const-string v12, "wav"
    aput-object v12, v0, v11
    const/4 v13, 6
    const-string v14, "wma"
    aput-object v14, v0, v13
    const/4 v15, 7
    const-string v16, "aac"
    aput-object v16, v0, v15
    const/16 v17, 8
    const-string v18, "m4r"
    aput-object v18, v0, v17
    const/16 v19, 9
    const-string v20, "mmf"
    aput-object v20, v0, v19
    const/16 v21, 10
    const-string v22, "mp2"
    aput-object v22, v0, v21
    const/16 v23, 11
    const-string v24, "wv"
    aput-object v24, v0, v23
    const/16 v23, 12
    const-string v24, "m4a"
    aput-object v24, v0, v23
    const/16 v23, 13
    const-string v24, "mid"
    aput-object v24, v0, v23
    const/16 v23, 14
    const-string v24, "aiff"
    aput-object v24, v0, v23
    const/16 v23, 15
    const-string v24, "au"
    aput-object v24, v0, v23
    const/16 v23, 16
    const-string v24, "mka"
    aput-object v24, v0, v23
    const/16 v23, 17
    const-string v24, "ra"
    aput-object v24, v0, v23
    const/16 v23, 18
    const-string v24, "ac3"
    aput-object v24, v0, v23
    const/16 v23, 19
    const-string v24, "aif"
    aput-object v24, v0, v23
    const/16 v23, 20
    const-string v24, "caf"
    aput-object v24, v0, v23
    const/16 v23, 21
    const-string v24, "3gpp"
    aput-object v24, v0, v23
    sput-object v0, Lcom/innioasis/ipp/Scan;->MUSIC:[Ljava/lang/String;
  .line 67
    const/16 v15, 21
    new-array v15, v15, [Ljava/lang/String;
    aput-object v2, v15, v1
    aput-object v4, v15, v3
    aput-object v6, v15, v5
    aput-object v8, v15, v7
    aput-object v10, v15, v9
    aput-object v12, v15, v11
    aput-object v14, v15, v13
    const/4 v2, 7
    aput-object v16, v15, v2
    aput-object v18, v15, v17
    aput-object v20, v15, v19
    aput-object v22, v15, v21
    const/16 v2, 11
    const-string v4, "wv"
    aput-object v4, v15, v2
    const/16 v2, 12
    const-string v4, "m4a"
    aput-object v4, v15, v2
    const/16 v2, 13
    const-string v4, "aiff"
    aput-object v4, v15, v2
    const/16 v2, 14
    const-string v4, "au"
    aput-object v4, v15, v2
    const/16 v2, 15
    const-string v4, "mka"
    aput-object v4, v15, v2
    const/16 v2, 16
    const-string v4, "ra"
    aput-object v4, v15, v2
    const/16 v2, 17
    const-string v4, "ac3"
    aput-object v4, v15, v2
    const/16 v2, 18
    const-string v4, "aif"
    aput-object v4, v15, v2
    const/16 v2, 19
    const-string v4, "caf"
    aput-object v4, v15, v2
    const/16 v2, 20
    const-string v4, "3gpp"
    aput-object v4, v15, v2
    sput-object v15, Lcom/innioasis/ipp/Scan;->BOOK:[Ljava/lang/String;
  .line 69
    new-array v2, v13, [Ljava/lang/String;
    const-string v4, "mp4"
    aput-object v4, v2, v1
    const-string v1, "mov"
    aput-object v1, v2, v3
    const-string v1, "wmv"
    aput-object v1, v2, v5
    const-string v1, "flv"
    aput-object v1, v2, v7
    const-string v1, "avi"
    aput-object v1, v2, v9
    const-string v1, "mkv"
    aput-object v1, v2, v11
    sput-object v2, Lcom/innioasis/ipp/Scan;->VIDEO:[Ljava/lang/String;
  .line 71
    new-instance v1, Ljava/util/HashSet;
    invoke-static { v0 }, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Formats;->more(Ljava/util/List;)Ljava/util/List;
    move-result-object v0
    invoke-direct { v1, v0 }, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V
    sput-object v1, Lcom/innioasis/ipp/Scan;->musicExt:Ljava/util/HashSet;
  .line 72
    new-instance v0, Ljava/util/HashSet;
    invoke-static { v15 }, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Formats;->more(Ljava/util/List;)Ljava/util/List;
    move-result-object v1
    invoke-direct { v0, v1 }, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V
    sput-object v0, Lcom/innioasis/ipp/Scan;->bookExt:Ljava/util/HashSet;
  .line 73
    new-instance v0, Ljava/util/HashSet;
    invoke-static { v2 }, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;
    move-result-object v1
    invoke-direct { v0, v1 }, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V
    sput-object v0, Lcom/innioasis/ipp/Scan;->videoExt:Ljava/util/HashSet;
  .line 127
    new-instance v0, Ljava/util/LinkedList;
    invoke-direct { v0 }, Ljava/util/LinkedList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->AHEAD:Ljava/util/LinkedList;
  .line 242
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->met:Ljava/util/HashSet;
  .line 266
    new-instance v0, Lcom/innioasis/y1/database/Song;
    invoke-direct { v0 }, Lcom/innioasis/y1/database/Song;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->MARKER:Lcom/innioasis/y1/database/Song;
  .line 364
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
  .line 372
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
  .line 373
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->building:Ljava/util/HashSet;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 31
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000()Ljava/util/LinkedList;
  .registers 1
  .line 29
    sget-object v0, Lcom/innioasis/ipp/Scan;->AHEAD:Ljava/util/LinkedList;
    return-object v0
.end method

.method static synthetic access$102(Z)Z
  .registers 1
  .line 29
    sput-boolean p0, Lcom/innioasis/ipp/Scan;->looking:Z
    return p0
.end method

.method static synthetic access$200()Ljava/lang/Object;
  .registers 1
  .line 29
    sget-object v0, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    return-object v0
.end method

.method static synthetic access$310()I
  .registers 2
  .line 29
    sget v0, Lcom/innioasis/ipp/Scan;->live:I
    add-int/lit8 v1, v0, -1
    sput v1, Lcom/innioasis/ipp/Scan;->live:I
    return v0
.end method

.method static synthetic access$400()Ljava/lang/String;
  .registers 1
  .line 29
    sget-object v0, Lcom/innioasis/ipp/Scan;->dir:Ljava/lang/String;
    return-object v0
.end method

.method static synthetic access$500()Lcom/innioasis/y1/database/Y1Repository;
  .registers 1
  .line 29
    sget-object v0, Lcom/innioasis/ipp/Scan;->repo:Lcom/innioasis/y1/database/Y1Repository;
    return-object v0
.end method

.method static synthetic access$600()Ljava/util/HashSet;
  .registers 1
  .line 29
    sget-object v0, Lcom/innioasis/ipp/Scan;->building:Ljava/util/HashSet;
    return-object v0
.end method

.method static synthetic access$700()Ljava/util/HashMap;
  .registers 1
  .line 29
    sget-object v0, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
    return-object v0
.end method

.method static synthetic access$800()[Ljava/io/File;
  .registers 1
  .line 29
    sget-object v0, Lcom/innioasis/ipp/Scan;->files:[Ljava/io/File;
    return-object v0
.end method

.method static synthetic access$900()I
  .registers 1
  .line 29
    sget v0, Lcom/innioasis/ipp/Scan;->next:I
    return v0
.end method

.method static synthetic access$908()I
  .registers 2
  .line 29
    sget v0, Lcom/innioasis/ipp/Scan;->next:I
    add-int/lit8 v1, v0, 1
    sput v1, Lcom/innioasis/ipp/Scan;->next:I
    return v0
.end method

.method private static audio(Lcom/innioasis/y1/database/Y1Repository;Ljava/io/File;)[Ljava/io/File;
  .catchall { :L2 .. :L3 } :L8
  .catchall { :L4 .. :L5 } :L6
  .registers 7
  .line 467
    invoke-virtual { p1 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object p0
  .line 468
    const/4 p1, 0
    if-nez p0, :L0
    new-array p0, p1, [Ljava/io/File;
    return-object p0
  :L0
  .line 469
    array-length v0, p0
    new-array v0, v0, [Ljava/io/File;
  .line 470
    nop
  .line 471
    const/4 v1, 0
    const/4 v2, 0
  :L1
    array-length v3, p0
    if-ge v1, v3, :L10
  :L2
  .line 473
    aget-object v3, p0, v1
    invoke-virtual { v3 }, Ljava/io/File;->isFile()Z
    move-result v3
    if-eqz v3, :L7
    aget-object v3, p0, v1
    invoke-virtual { v3 }, Ljava/io/File;->isHidden()Z
    move-result v3
    if-nez v3, :L7
    sget-object v3, Lcom/innioasis/ipp/Scan;->musicExt:Ljava/util/HashSet;
    aget-object v4, p0, v1
    invoke-static { v4 }, Lcom/innioasis/ipp/Scan;->extOf(Ljava/io/File;)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v3, v4 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v3
  :L3
    if-eqz v3, :L7
  .line 474
    add-int/lit8 v3, v2, 1
  :L4
    aget-object v4, p0, v1
    aput-object v4, v0, v2
  :L5
    move v2, v3
    goto :L7
  :L6
  .line 476
    move-exception v2
    move v2, v3
    goto :L9
  :L7
  .line 477
    goto :L9
  :L8
  .line 476
    move-exception v3
  :L9
  .line 471
    add-int/lit8 v1, v1, 1
    goto :L1
  :L10
  .line 479
    new-array p0, v2, [Ljava/io/File;
  .line 480
    invoke-static { v0, p1, p0, p1, v2 }, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
  .line 481
    return-object p0
.end method

.method public static book(Ljava/io/File;)Z
  .registers 2
  .line 159
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->kind(Ljava/io/File;)I
    move-result v0
    and-int/lit8 v0, v0, 2
    if-nez v0, :L0
    invoke-virtual { p0 }, Ljava/io/File;->isHidden()Z
    move-result p0
    if-nez p0, :L0
    sget-object p0, Lcom/innioasis/ipp/Scan;->bookExt:Ljava/util/HashSet;
    sget-object v0, Lcom/innioasis/ipp/Scan;->ext:Ljava/lang/String;
    invoke-virtual { p0, v0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method private static declared-synchronized built(Lcom/innioasis/y1/database/Song;)V
  .catchall { :L0 .. :L2 } :L4
  .registers 3
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L0
  .line 236
    sget-object v1, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
  .line 237
    if-eqz p0, :L3
    if-nez v1, :L1
    goto :L3
  :L1
  .line 238
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v1, p0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result p0
    if-nez p0, :L2
    sget p0, Lcom/innioasis/ipp/Scan;->added:I
    add-int/lit8 p0, p0, 1
    sput p0, Lcom/innioasis/ipp/Scan;->added:I
  :L2
  .line 239
    monitor-exit v0
    return-void
  :L3
  .line 237
    monitor-exit v0
    return-void
  :L4
  .line 235
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method private static declared-synchronized count()V
  .catchall { :L0 .. :L3 } :L6
  .catchall { :L4 .. :L5 } :L6
  .registers 5
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L0
  .line 54
    sget v1, Lcom/innioasis/ipp/Scan;->seen:I
    add-int/lit8 v1, v1, 1
    sput v1, Lcom/innioasis/ipp/Scan;->seen:I
  .line 55
    sget v2, Lcom/innioasis/ipp/Scan;->expected:I
    if-lez v2, :L1
    mul-int/lit8 v3, v1, 100
    div-int/2addr v3, v2
    goto :L2
  :L1
    div-int/lit8 v3, v1, 16
  :L2
  .line 56
    sget v4, Lcom/innioasis/ipp/Scan;->shown:I
  :L3
    if-ne v3, v4, :L4
    monitor-exit v0
    return-void
  :L4
  .line 57
    sput v3, Lcom/innioasis/ipp/Scan;->shown:I
  .line 58
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Loading;->scanned(II)V
  :L5
  .line 59
    monitor-exit v0
    return-void
  :L6
  .line 53
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method public static dir(Ljava/io/File;)Z
  .registers 1
  .line 107
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->kind(Ljava/io/File;)I
    move-result p0
    and-int/lit8 p0, p0, 2
    if-eqz p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method static declared-synchronized done()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  .line 288
    const/4 v1, 0
  :L0
    sput-object v1, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
  .line 289
    const/4 v1, 0
    sput v1, Lcom/innioasis/ipp/Scan;->added:I
  .line 290
    new-instance v1, Ljava/util/HashSet;
    invoke-direct { v1 }, Ljava/util/HashSet;-><init>()V
    sput-object v1, Lcom/innioasis/ipp/Scan;->met:Ljava/util/HashSet;
  :L1
  .line 291
    monitor-exit v0
    return-void
  :L2
  .line 287
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method public static exists(Ljava/io/File;)Z
  .registers 2
  .line 103
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->kind(Ljava/io/File;)I
    move-result p0
    const/4 v0, 1
    and-int/2addr p0, v0
    if-eqz p0, :L0
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    return v0
.end method

.method private static extOf(Ljava/io/File;)Ljava/lang/String;
  .registers 2
  .line 97
    invoke-virtual { p0 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object p0
  .line 98
    const/16 v0, 46
    invoke-virtual { p0, v0 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v0
  .line 99
    if-gez v0, :L0
    const-string p0, ""
    goto :L1
  :L0
    add-int/lit8 v0, v0, 1
    invoke-virtual { p0, v0 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
    invoke-virtual { p0, v0 }, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;
    move-result-object p0
  :L1
    return-object p0
.end method

.method private static fill(Ljava/util/HashSet;Ljava/util/List;)V
  .registers 5
  .line 349
    if-nez p1, :L0
    return-void
  :L0
  .line 350
    const/4 v0, 0
  :L1
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L4
  .line 351
    invoke-interface { p1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
  .line 352
    instance-of v2, v1, Lcom/innioasis/y1/database/Song;
    if-nez v2, :L2
    goto :L3
  :L2
  .line 353
    check-cast v1, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
  .line 354
    if-eqz v1, :L3
    invoke-virtual { p0, v1 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L3
  .line 350
    add-int/lit8 v0, v0, 1
    goto :L1
  :L4
  .line 356
    return-void
.end method

.method static inDb(Ljava/lang/String;)Z
  .registers 3
  .line 277
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 278
    invoke-static { }, Lcom/innioasis/ipp/Scan;->table()Ljava/util/HashSet;
    move-result-object v1
  .line 279
    if-nez v1, :L1
    return v0
  :L1
  .line 280
    sget-object v0, Lcom/innioasis/music/objects/Constant;->INSTANCE:Lcom/innioasis/music/objects/Constant;
    invoke-virtual { v0, p0 }, Lcom/innioasis/music/objects/Constant;->normalizeAudioBookPath(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v1, p0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result p0
    return p0
.end method

.method private static indexAfter(Ljava/lang/String;)I
  .registers 4
  .line 442
    sget-object v0, Lcom/innioasis/ipp/Scan;->files:[Ljava/io/File;
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 443
    nop
  :L1
    sget-object v0, Lcom/innioasis/ipp/Scan;->files:[Ljava/io/File;
    array-length v2, v0
    if-ge v1, v2, :L3
  .line 444
    aget-object v0, v0, v1
    invoke-virtual { v0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v0
    invoke-virtual { p0, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L2
    add-int/lit8 v1, v1, 1
    return v1
  :L2
  .line 443
    add-int/lit8 v1, v1, 1
    goto :L1
  :L3
  .line 446
    sget p0, Lcom/innioasis/ipp/Scan;->next:I
    return p0
.end method

.method private static kind(Ljava/io/File;)I
  .registers 3
  .line 84
    sget-object v0, Lcom/innioasis/ipp/Scan;->node:Ljava/io/File;
    if-eq p0, v0, :L4
  .line 85
    nop
  .line 86
    invoke-virtual { p0 }, Ljava/io/File;->isFile()Z
    move-result v0
    const/4 v1, 1
    if-eqz v0, :L0
    goto :L3
  :L0
  .line 87
    invoke-virtual { p0 }, Ljava/io/File;->isDirectory()Z
    move-result v0
    if-eqz v0, :L1
    const/4 v1, 3
    goto :L3
  :L1
  .line 88
    invoke-virtual { p0 }, Ljava/io/File;->exists()Z
    move-result v0
    if-eqz v0, :L2
    goto :L3
  :L2
    const/4 v1, 0
  :L3
  .line 89
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->extOf(Ljava/io/File;)Ljava/lang/String;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Scan;->ext:Ljava/lang/String;
  .line 90
    sput v1, Lcom/innioasis/ipp/Scan;->kind:I
  .line 91
    sput-object p0, Lcom/innioasis/ipp/Scan;->node:Ljava/io/File;
  :L4
  .line 93
    sget p0, Lcom/innioasis/ipp/Scan;->kind:I
    return p0
.end method

.method public static known(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
  .registers 6
  .line 39
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v0
  .line 40
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->inDb(Ljava/lang/String;)Z
    move-result v2
  .line 41
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->meet(Ljava/lang/String;)V
  .line 42
    invoke-static { }, Lcom/innioasis/ipp/Scan;->count()V
  .line 43
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v3
    sub-long/2addr v3, v0
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/ScanProbe;->known(J)V
  .line 44
    sget-boolean p0, Lcom/innioasis/ipp/ScanProbe;->force:Z
    const/4 v0, 0
    if-eqz p0, :L0
    return-object v0
  :L0
  .line 45
    if-eqz v2, :L1
    sget-object v0, Lcom/innioasis/ipp/Scan;->MARKER:Lcom/innioasis/y1/database/Song;
  :L1
    return-object v0
.end method

.method public static listed([Ljava/io/File;)V
  .catchall { :L1 .. :L4 } :L3
  .registers 4
  .line 116
    if-eqz p0, :L5
    array-length v0, p0
    if-nez v0, :L0
    goto :L5
  :L0
  .line 117
    sget-object v0, Lcom/innioasis/ipp/Scan;->AHEAD:Ljava/util/LinkedList;
    monitor-enter v0
  :L1
  .line 118
    invoke-virtual { v0, p0 }, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V
  .line 119
    sget-boolean p0, Lcom/innioasis/ipp/Scan;->looking:Z
    if-nez p0, :L2
  .line 120
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/Scan;->looking:Z
  .line 121
    new-instance p0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/ipp/Scan$Looker;
    invoke-direct { v1 }, Lcom/innioasis/ipp/Scan$Looker;-><init>()V
    const-string v2, "ipp-scan-stat"
    invoke-direct { p0, v1, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    invoke-virtual { p0 }, Ljava/lang/Thread;->start()V
  :L2
  .line 123
    invoke-virtual { v0 }, Ljava/lang/Object;->notifyAll()V
  .line 124
    monitor-exit v0
  .line 125
    return-void
  :L3
  .line 124
    move-exception p0
    monitor-exit v0
  :L4
    throw p0
  :L5
  .line 116
    return-void
.end method

.method private static load()Ljava/util/HashSet;
  .catchall { :L0 .. :L3 } :L11
  .catchall { :L4 .. :L5 } :L8
  .catchall { :L5 .. :L7 } :L11
  .catchall { :L9 .. :L10 } :L8
  .catchall { :L10 .. :L11 } :L11
  .registers 4
  :L0
  .line 304
    invoke-static { }, Lcom/innioasis/ipp/Artists;->ensureExceptions()V
  .line 305
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 306
    if-nez v0, :L1
    sget-object v0, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
    return-object v0
  :L1
  .line 307
    invoke-static { }, Lcom/innioasis/ipp/Scan;->pathsOnly()Ljava/util/HashSet;
    move-result-object v1
  .line 308
    if-nez v1, :L2
  .line 309
    new-instance v1, Ljava/util/HashSet;
    invoke-direct { v1 }, Ljava/util/HashSet;-><init>()V
  .line 310
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository;->ippSongDao()Lcom/innioasis/y1/database/SongDao;
    move-result-object v0
    invoke-interface { v0 }, Lcom/innioasis/y1/database/SongDao;->getSongsSync()Ljava/util/List;
    move-result-object v0
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Scan;->fill(Ljava/util/HashSet;Ljava/util/List;)V
  :L2
  .line 312
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "library scan: "
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v1 }, Ljava/util/HashSet;->size()I
    move-result v2
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v2, " path(s) already known"
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 313
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L3
  .line 314
    const/4 v2, 0
  :L4
    sput v2, Lcom/innioasis/ipp/Scan;->seen:I
  .line 315
    invoke-virtual { v1 }, Ljava/util/HashSet;->size()I
    move-result v3
    sput v3, Lcom/innioasis/ipp/Scan;->expected:I
  .line 316
    const/4 v3, -1
    sput v3, Lcom/innioasis/ipp/Scan;->shown:I
  .line 317
    sput v2, Lcom/innioasis/ipp/Scan;->added:I
  .line 318
    monitor-exit v0
  :L5
  .line 320
    invoke-virtual { v1 }, Ljava/util/HashSet;->isEmpty()Z
    move-result v0
    if-eqz v0, :L6
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Meta;->noteLibraryRead(Landroid/content/Context;)V
  :L6
  .line 321
    sput-object v1, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
  :L7
  .line 322
    return-object v1
  :L8
  .line 318
    move-exception v1
  :L9
    monitor-exit v0
  :L10
    throw v1
  :L11
  .line 323
    move-exception v0
  .line 324
    sget-object v0, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
    return-object v0
.end method

.method private static declared-synchronized meet(Ljava/lang/String;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  .line 245
    if-eqz p0, :L3
  :L0
    sget-object v1, Lcom/innioasis/ipp/Scan;->met:Ljava/util/HashSet;
    sget-object v2, Lcom/innioasis/music/objects/Constant;->INSTANCE:Lcom/innioasis/music/objects/Constant;
    invoke-virtual { v2, p0 }, Lcom/innioasis/music/objects/Constant;->normalizeAudioBookPath(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v1, p0 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L1
    goto :L3
  :L2
  .line 244
    move-exception p0
    monitor-exit v0
    throw p0
  :L3
  .line 246
    monitor-exit v0
    return-void
.end method

.method public static music(Ljava/io/File;)Z
  .registers 2
  .line 164
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->kind(Ljava/io/File;)I
    move-result v0
    and-int/lit8 v0, v0, 2
    if-nez v0, :L0
    invoke-virtual { p0 }, Ljava/io/File;->isHidden()Z
    move-result p0
    if-nez p0, :L0
    sget-object p0, Lcom/innioasis/ipp/Scan;->musicExt:Ljava/util/HashSet;
    sget-object v0, Lcom/innioasis/ipp/Scan;->ext:Ljava/lang/String;
    invoke-virtual { p0, v0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method private static ours(Ljava/lang/String;)Z
  .registers 2
  .line 250
    sget-object v0, Lcom/innioasis/ipp/Scan;->card:Ljava/lang/String;
  .line 251
    if-nez v0, :L0
    invoke-static { }, Lcom/innioasis/ipp/Panel;->card()Ljava/io/File;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Scan;->card:Ljava/lang/String;
  :L0
  .line 252
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Scan;->under(Ljava/lang/String;Ljava/lang/String;)Z
    move-result p0
    return p0
.end method

.method private static pathsOnly()Ljava/util/HashSet;
  .catchall { :L0 .. :L1 } :L11
  .catchall { :L1 .. :L3 } :L10
  .catchall { :L5 .. :L6 } :L7
  .catchall { :L13 .. :L14 } :L15
  .registers 5
  .line 330
    nop
  .line 332
    const/4 v0, 0
  :L0
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->db()Landroidx/room/RoomDatabase;
    move-result-object v1
    const-string v2, "select path from song"
    invoke-virtual { v1, v2, v0 }, Landroidx/room/RoomDatabase;->query(Ljava/lang/String;[Ljava/lang/Object;)Landroid/database/Cursor;
    move-result-object v1
  :L1
  .line 333
    new-instance v2, Ljava/util/HashSet;
    invoke-interface { v1 }, Landroid/database/Cursor;->getCount()I
    move-result v3
    mul-int/lit8 v3, v3, 2
    add-int/lit8 v3, v3, 16
    invoke-direct { v2, v3 }, Ljava/util/HashSet;-><init>(I)V
  :L2
  .line 334
    invoke-interface { v1 }, Landroid/database/Cursor;->moveToNext()Z
    move-result v3
    if-eqz v3, :L4
  .line 335
    const/4 v3, 0
    invoke-interface { v1, v3 }, Landroid/database/Cursor;->isNull(I)Z
    move-result v4
    if-nez v4, :L2
    invoke-interface { v1, v3 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L3
    goto :L2
  :L4
  .line 337
    nop
  .line 342
    if-eqz v1, :L8
  :L5
    invoke-interface { v1 }, Landroid/database/Cursor;->close()V
  :L6
    goto :L8
  :L7
  .line 343
    move-exception v0
    goto :L9
  :L8
  .line 344
    nop
  :L9
  .line 337
    return-object v2
  :L10
  .line 338
    move-exception v2
    goto :L12
  :L11
    move-exception v1
    move-object v1, v0
  :L12
  .line 339
    nop
  .line 342
    if-eqz v1, :L16
  :L13
    invoke-interface { v1 }, Landroid/database/Cursor;->close()V
  :L14
    goto :L16
  :L15
  .line 343
    move-exception v1
    goto :L17
  :L16
  .line 344
    nop
  :L17
  .line 339
    return-object v0
.end method

.method private static pool()I
  .registers 2
  .line 459
    invoke-static { }, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/Runtime;->availableProcessors()I
    move-result v0
  .line 460
    const/4 v1, 1
    if-ge v0, v1, :L0
    const/4 v0, 1
  :L0
  .line 461
    const/4 v1, 3
    if-le v0, v1, :L1
    const/4 v0, 3
  :L1
  .line 462
    return v0
.end method

.method public static rows(Lcom/innioasis/y1/database/SongDao;)Ljava/util/List;
  .catchall { :L0 .. :L5 } :L9
  .catchall { :L10 .. :L11 } :L9
  .registers 6
  .line 208
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 209
    const-class v1, Lcom/innioasis/ipp/Scan;
    monitor-enter v1
  :L0
  .line 210
    sget-object v2, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
    if-nez v2, :L1
    invoke-interface { p0 }, Lcom/innioasis/y1/database/SongDao;->getSongsSync()Ljava/util/List;
    move-result-object p0
    monitor-exit v1
    return-object p0
  :L1
  .line 211
    sget-object v2, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
    invoke-virtual { v2 }, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;
    move-result-object v2
  :L2
  .line 212
    invoke-interface { v2 }, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :L4
  .line 213
    invoke-interface { v2 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
  .line 214
    sget-object v4, Lcom/innioasis/ipp/Scan;->met:Ljava/util/HashSet;
    invoke-virtual { v4, v3 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v4
    if-nez v4, :L3
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 215
    goto :L2
  :L4
  .line 216
    monitor-exit v1
  :L5
  .line 217
    new-instance v1, Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v2
    invoke-direct { v1, v2 }, Ljava/util/ArrayList;-><init>(I)V
  .line 218
    const/4 v2, 0
  :L6
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge v2, v3, :L8
  .line 219
    invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
    invoke-interface { p0, v3 }, Lcom/innioasis/y1/database/SongDao;->getSongByPathSyncDB(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object v3
  .line 220
    if-eqz v3, :L7
    invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L7
  .line 218
    add-int/lit8 v2, v2, 1
    goto :L6
  :L8
  .line 222
    return-object v1
  :L9
  .line 216
    move-exception p0
  :L10
    monitor-exit v1
  :L11
    goto :L13
  :L12
    throw p0
  :L13
    goto :L12
.end method

.method public static skip(ZLjava/lang/String;)Z
  .registers 2
  .line 181
    if-nez p0, :L1
    invoke-static { p1 }, Lcom/innioasis/ipp/Scan;->ours(Ljava/lang/String;)Z
    move-result p0
    if-eqz p0, :L0
    goto :L1
  :L0
    const/4 p0, 0
    goto :L2
  :L1
    const/4 p0, 1
  :L2
    return p0
.end method

.method public static song(Lcom/innioasis/y1/database/Y1Repository;Ljava/io/File;)Lcom/innioasis/y1/database/Song;
  .catchall { :L0 .. :L1 } :L2
  .registers 7
  .line 377
    nop
  .line 378
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v0
  .line 379
    const/4 v2, 3
    sput v2, Lcom/innioasis/ipp/ScanProbe;->how:I
  :L0
  .line 381
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Scan;->take(Lcom/innioasis/y1/database/Y1Repository;Ljava/io/File;)Lcom/innioasis/y1/database/Song;
    move-result-object v2
  :L1
  .line 384
    goto :L3
  :L2
  .line 382
    move-exception v2
  .line 383
    const/4 v2, 0
  :L3
  .line 385
    if-nez v2, :L4
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/database/Y1Repository;->fileToSong(Ljava/io/File;)Lcom/innioasis/y1/database/Song;
    move-result-object v2
  :L4
  .line 386
    sget p0, Lcom/innioasis/ipp/ScanProbe;->how:I
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v3
    sub-long/2addr v3, v0
    invoke-static { p0, v3, v4 }, Lcom/innioasis/ipp/ScanProbe;->song(IJ)V
  .line 387
    invoke-static { v2 }, Lcom/innioasis/ipp/Scan;->built(Lcom/innioasis/y1/database/Song;)V
  .line 388
    return-object v2
.end method

.method private static start()V
  .registers 3
  .line 451
    invoke-static { }, Lcom/innioasis/ipp/Scan;->pool()I
    move-result v0
  :L0
  .line 452
    sget v1, Lcom/innioasis/ipp/Scan;->live:I
    if-ge v1, v0, :L1
  .line 453
    add-int/lit8 v1, v1, 1
    sput v1, Lcom/innioasis/ipp/Scan;->live:I
  .line 454
    new-instance v1, Ljava/lang/Thread;
    new-instance v2, Lcom/innioasis/ipp/Scan$Builder;
    invoke-direct { v2 }, Lcom/innioasis/ipp/Scan$Builder;-><init>()V
    invoke-direct { v1, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v1 }, Ljava/lang/Thread;->start()V
    goto :L0
  :L1
  .line 456
    return-void
.end method

.method public static stays(Lcom/innioasis/y1/database/Song;)Z
  .catchall { :L3 .. :L4 } :L7
  .catchall { :L8 .. :L9 } :L7
  .registers 5
  .line 190
    const/4 v0, 1
    if-nez p0, :L0
    return v0
  :L0
  .line 191
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
  .line 192
    if-nez p0, :L1
    return v0
  :L1
  .line 193
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->ours(Ljava/lang/String;)Z
    move-result v1
    const/4 v2, 0
    if-eqz v1, :L2
    return v2
  :L2
  .line 195
    const-class v1, Lcom/innioasis/ipp/Scan;
    monitor-enter v1
  :L3
  .line 196
    sget-object v3, Lcom/innioasis/ipp/Scan;->met:Ljava/util/HashSet;
    invoke-virtual { v3, p0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v3
  .line 197
    monitor-exit v1
  :L4
  .line 198
    invoke-static { v3 }, Lcom/innioasis/ipp/ScanProbe;->exists(Z)V
  .line 199
    if-nez v3, :L6
    new-instance v1, Ljava/io/File;
    invoke-direct { v1, p0 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result p0
    if-eqz p0, :L5
    goto :L6
  :L5
    const/4 v0, 0
  :L6
    return v0
  :L7
  .line 197
    move-exception p0
  :L8
    monitor-exit v1
  :L9
    throw p0
.end method

.method private static declared-synchronized table()Ljava/util/HashSet;
  .catchall { :L0 .. :L3 } :L4
  .registers 9
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L0
  .line 294
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
  .line 295
    sget-object v3, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
  .line 296
    if-eqz v3, :L1
    sget-wide v4, Lcom/innioasis/ipp/Scan;->asked:J
    sub-long v4, v1, v4
    const-wide/16 v6, 5000
    cmp-long v8, v4, v6
    if-lez v8, :L2
  :L1
    invoke-static { }, Lcom/innioasis/ipp/Scan;->load()Ljava/util/HashSet;
    move-result-object v3
  :L2
  .line 297
    sput-wide v1, Lcom/innioasis/ipp/Scan;->asked:J
  :L3
  .line 298
    monitor-exit v0
    return-object v3
  :L4
  .line 293
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method private static take(Lcom/innioasis/y1/database/Y1Repository;Ljava/io/File;)Lcom/innioasis/y1/database/Song;
  .catchall { :L1 .. :L6 } :L11
  .catchall { :L7 .. :L8 } :L9
  .catchall { :L10 .. :L12 } :L11
  .registers 11
  .line 393
    invoke-virtual { p1 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v0
  .line 394
    invoke-virtual { p1 }, Ljava/io/File;->getParent()Ljava/lang/String;
    move-result-object p1
  .line 395
    const/4 v1, 0
    if-eqz v0, :L13
    if-nez p1, :L0
    goto/16 :L13
  :L0
  .line 397
    sget-object v2, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    monitor-enter v2
  :L1
  .line 398
    sput-object p0, Lcom/innioasis/ipp/Scan;->repo:Lcom/innioasis/y1/database/Y1Repository;
  .line 399
    sget-object v3, Lcom/innioasis/ipp/Scan;->dir:Ljava/lang/String;
    invoke-virtual { p1, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :L2
  .line 400
    sput-object p1, Lcom/innioasis/ipp/Scan;->dir:Ljava/lang/String;
  .line 401
    new-instance v3, Ljava/io/File;
    invoke-direct { v3, p1 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-static { p0, v3 }, Lcom/innioasis/ipp/Scan;->audio(Lcom/innioasis/y1/database/Y1Repository;Ljava/io/File;)[Ljava/io/File;
    move-result-object p0
    sput-object p0, Lcom/innioasis/ipp/Scan;->files:[Ljava/io/File;
  .line 402
    invoke-static { v0 }, Lcom/innioasis/ipp/Scan;->indexAfter(Ljava/lang/String;)I
    move-result p0
    sput p0, Lcom/innioasis/ipp/Scan;->next:I
  .line 403
    sget-object p0, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
    invoke-virtual { p0 }, Ljava/util/HashMap;->clear()V
  .line 404
    sget-object p0, Lcom/innioasis/ipp/Scan;->building:Ljava/util/HashSet;
    invoke-virtual { p0 }, Ljava/util/HashSet;->clear()V
  .line 405
    invoke-static { }, Lcom/innioasis/ipp/Scan;->start()V
  .line 406
    const/4 p0, 2
    sput p0, Lcom/innioasis/ipp/ScanProbe;->how:I
  .line 407
    monitor-exit v2
    return-object v1
  :L2
  .line 409
    sget p0, Lcom/innioasis/ipp/Scan;->next:I
    invoke-static { v0 }, Lcom/innioasis/ipp/Scan;->indexAfter(Ljava/lang/String;)I
    move-result v3
    invoke-static { p0, v3 }, Ljava/lang/Math;->max(II)I
    move-result p0
    sput p0, Lcom/innioasis/ipp/Scan;->next:I
  .line 411
    sget-object p0, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
    invoke-virtual { p0, v0 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/database/Song;
  .line 412
    if-eqz p0, :L3
  .line 413
    invoke-static { }, Lcom/innioasis/ipp/Scan;->start()V
  .line 414
    invoke-virtual { v2 }, Ljava/lang/Object;->notifyAll()V
  .line 415
    const/4 p1, 0
    sput p1, Lcom/innioasis/ipp/ScanProbe;->how:I
  .line 416
    monitor-exit v2
    return-object p0
  :L3
  .line 418
    sget-object p0, Lcom/innioasis/ipp/Scan;->building:Ljava/util/HashSet;
    invoke-virtual { p0, v0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result p0
    if-nez p0, :L4
  .line 419
    invoke-static { }, Lcom/innioasis/ipp/Scan;->start()V
  .line 420
    invoke-virtual { v2 }, Ljava/lang/Object;->notifyAll()V
  .line 421
    monitor-exit v2
    return-object v1
  :L4
  .line 424
    const/4 p0, 1
    sput p0, Lcom/innioasis/ipp/ScanProbe;->how:I
  .line 425
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
    const-wide/16 v5, 20000
    add-long/2addr v3, v5
  :L5
  .line 426
    sget-object p0, Lcom/innioasis/ipp/Scan;->building:Ljava/util/HashSet;
    invoke-virtual { p0, v0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L10
    sget-object p0, Lcom/innioasis/ipp/Scan;->dir:Ljava/lang/String;
    invoke-virtual { p1, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L10
  .line 427
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v5
  :L6
    sub-long v5, v3, v5
  .line 428
    const-wide/16 v7, 0
    cmp-long p0, v5, v7
    if-gtz p0, :L7
    goto :L10
  :L7
  .line 430
    sget-object p0, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    invoke-virtual { p0, v5, v6 }, Ljava/lang/Object;->wait(J)V
  :L8
  .line 433
    nop
  .line 434
    goto :L5
  :L9
  .line 431
    move-exception p0
  .line 432
    nop
  :L10
  .line 435
    sget-object p0, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
    invoke-virtual { p0, v0 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/database/Song;
  .line 436
    sget-object p1, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    invoke-virtual { p1 }, Ljava/lang/Object;->notifyAll()V
  .line 437
    monitor-exit v2
    return-object p0
  :L11
  .line 438
    move-exception p0
    monitor-exit v2
  :L12
    throw p0
  :L13
  .line 395
    return-object v1
.end method

.method public static themes(Ljava/lang/String;)Z
  .registers 7
  .line 174
    if-eqz p0, :L0
    const/4 v1, 1
    const/4 v2, 0
    const-string v3, "/storage/sdcard0/themes"
    const/4 v4, 0
    const-string v0, "/storage/sdcard0/themes"
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v5
    move-object v0, p0
    invoke-virtual/range { v0 .. v5 }, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z
    move-result p0
    if-eqz p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method public static total(Ljava/util/List;)I
  .catchall { :L0 .. :L2 } :L5
  .catchall { :L6 .. :L7 } :L5
  .registers 3
  .line 227
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L0
  .line 228
    sget-object v1, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
    if-eqz v1, :L1
    sget-object p0, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
    invoke-virtual { p0 }, Ljava/util/HashSet;->size()I
    move-result p0
    sget v1, Lcom/innioasis/ipp/Scan;->added:I
    add-int/2addr p0, v1
    monitor-exit v0
    return p0
  :L1
  .line 229
    monitor-exit v0
  :L2
  .line 230
    if-nez p0, :L3
    const/4 p0, 0
    goto :L4
  :L3
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result p0
  :L4
    return p0
  :L5
  .line 229
    move-exception p0
  :L6
    monitor-exit v0
  :L7
    throw p0
.end method

.method private static under(Ljava/lang/String;Ljava/lang/String;)Z
  .registers 10
  .line 259
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 260
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v7
  .line 261
    const/4 v2, 1
    const/4 v3, 0
    const/4 v5, 0
    move-object v1, p0
    move-object v4, p1
    move v6, v7
    invoke-virtual/range { v1 .. v6 }, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z
    move-result p1
    if-nez p1, :L1
    return v0
  :L1
  .line 262
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result p1
    if-eq p1, v7, :L2
    invoke-virtual { p0, v7 }, Ljava/lang/String;->charAt(I)C
    move-result p0
    const/16 p1, 47
    if-ne p0, p1, :L3
  :L2
    const/4 v0, 1
  :L3
    return v0
.end method

.method public static video(Ljava/io/File;)Z
  .registers 2
  .line 169
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->kind(Ljava/io/File;)I
    move-result v0
    and-int/lit8 v0, v0, 2
    if-nez v0, :L0
    invoke-virtual { p0 }, Ljava/io/File;->isHidden()Z
    move-result p0
    if-nez p0, :L0
    sget-object p0, Lcom/innioasis/ipp/Scan;->videoExt:Ljava/util/HashSet;
    sget-object v0, Lcom/innioasis/ipp/Scan;->ext:Ljava/lang/String;
    invoke-virtual { p0, v0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method
