.class public final Lcom/innioasis/ipp/Scan;
.super Ljava/lang/Object;
.source "Scan.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Scan$Writer;,
    Lcom/innioasis/ipp/Scan$Looker;,
    Lcom/innioasis/ipp/Scan$Builder;
  }
.end annotation

.field private final static AHEAD:Ljava/util/LinkedList;

.field private final static BOOK:[Ljava/lang/String;

.field private final static DIR:I = 2

.field private final static EXISTS:I = 1

.field private final static FLUSH_MS:J = 60000L

.field private final static GAP_MS:J = 5000L

.field private final static IDLE_MS:J = 5000L

.field private final static LOCK:Ljava/lang/Object;

.field private final static LOOK:I = 6

.field private final static MARKER:Lcom/innioasis/y1/database/Song;

.field private final static MUSIC:[Ljava/lang/String;

.field private final static THEMES:Ljava/lang/String; = "/storage/sdcard0/themes"

.field private final static VIDEO:[Ljava/lang/String;

.field private final static WAIT_MS:J = 20000L

.field private final static WRITES:Ljava/util/LinkedList;

.field private static added:I

.field private static asked:J

.field private final static at:Ljava/util/HashMap;

.field private final static bookExt:Ljava/util/HashSet;

.field private final static building:Ljava/util/HashSet;

.field private static card:Ljava/lang/String;

.field private static cursor:I

.field private static expected:I

.field private static ext:Ljava/lang/String;

.field private static inWrite:Z

.field private static kind:I

.field private static live:I

.field private static looking:Z

.field private static marked:Z

.field private static met:Ljava/util/HashSet;

.field private final static musicExt:Ljava/util/HashSet;

.field private static next:I

.field private static node:Ljava/io/File;

.field private static volatile paths:Ljava/util/HashSet;

.field private static volatile py:Ljava/util/HashMap;

.field private final static ready:Ljava/util/HashMap;

.field private static repo:Lcom/innioasis/y1/database/Y1Repository;

.field private static seen:I

.field private static shown:I

.field private final static upcoming:Ljava/util/ArrayList;

.field private final static videoExt:Ljava/util/HashSet;

.field private static writing:Z

.field private static wrote:Z

.method static constructor <clinit>()V
  .registers 25
  .line 108
    new-instance v0, Ljava/util/LinkedList;
    invoke-direct { v0 }, Ljava/util/LinkedList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->WRITES:Ljava/util/LinkedList;
  .line 197
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Scan;->shown:I
  .line 211
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
  .line 213
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
  .line 215
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
  .line 217
    new-instance v1, Ljava/util/HashSet;
    invoke-static { v0 }, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Formats;->more(Ljava/util/List;)Ljava/util/List;
    move-result-object v0
    invoke-direct { v1, v0 }, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V
    sput-object v1, Lcom/innioasis/ipp/Scan;->musicExt:Ljava/util/HashSet;
  .line 218
    new-instance v0, Ljava/util/HashSet;
    invoke-static { v15 }, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Formats;->more(Ljava/util/List;)Ljava/util/List;
    move-result-object v1
    invoke-direct { v0, v1 }, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V
    sput-object v0, Lcom/innioasis/ipp/Scan;->bookExt:Ljava/util/HashSet;
  .line 219
    new-instance v0, Ljava/util/HashSet;
    invoke-static { v2 }, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;
    move-result-object v1
    invoke-direct { v0, v1 }, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V
    sput-object v0, Lcom/innioasis/ipp/Scan;->videoExt:Ljava/util/HashSet;
  .line 274
    new-instance v0, Ljava/util/LinkedList;
    invoke-direct { v0 }, Ljava/util/LinkedList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->AHEAD:Ljava/util/LinkedList;
  .line 395
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->met:Ljava/util/HashSet;
  .line 419
    new-instance v0, Lcom/innioasis/y1/database/Song;
    invoke-direct { v0 }, Lcom/innioasis/y1/database/Song;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->MARKER:Lcom/innioasis/y1/database/Song;
  .line 521
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
  .line 526
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->upcoming:Ljava/util/ArrayList;
  .line 527
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
  .line 532
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
  .line 533
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->building:Ljava/util/HashSet;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 32
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000()Ljava/util/LinkedList;
  .registers 1
  .line 30
    sget-object v0, Lcom/innioasis/ipp/Scan;->WRITES:Ljava/util/LinkedList;
    return-object v0
.end method

.method static synthetic access$1000()Ljava/util/HashMap;
  .registers 1
  .line 30
    sget-object v0, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
    return-object v0
.end method

.method static synthetic access$102(Z)Z
  .registers 1
  .line 30
    sput-boolean p0, Lcom/innioasis/ipp/Scan;->writing:Z
    return p0
.end method

.method static synthetic access$1100()Ljava/util/HashMap;
  .registers 1
  .line 30
    sget-object v0, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
    return-object v0
.end method

.method static synthetic access$1200()I
  .registers 1
  .line 30
    sget v0, Lcom/innioasis/ipp/Scan;->next:I
    return v0
.end method

.method static synthetic access$1202(I)I
  .registers 1
  .line 30
    sput p0, Lcom/innioasis/ipp/Scan;->next:I
    return p0
.end method

.method static synthetic access$1208()I
  .registers 2
  .line 30
    sget v0, Lcom/innioasis/ipp/Scan;->next:I
    add-int/lit8 v1, v0, 1
    sput v1, Lcom/innioasis/ipp/Scan;->next:I
    return v0
.end method

.method static synthetic access$1300()I
  .registers 1
  .line 30
    sget v0, Lcom/innioasis/ipp/Scan;->cursor:I
    return v0
.end method

.method static synthetic access$1400()Ljava/util/ArrayList;
  .registers 1
  .line 30
    sget-object v0, Lcom/innioasis/ipp/Scan;->upcoming:Ljava/util/ArrayList;
    return-object v0
.end method

.method static synthetic access$202(Z)Z
  .registers 1
  .line 30
    sput-boolean p0, Lcom/innioasis/ipp/Scan;->inWrite:Z
    return p0
.end method

.method static synthetic access$300(Lcom/innioasis/y1/database/SongDao;[Lcom/innioasis/y1/database/Song;)V
  .registers 2
  .line 30
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Scan;->write(Lcom/innioasis/y1/database/SongDao;[Lcom/innioasis/y1/database/Song;)V
    return-void
.end method

.method static synthetic access$400()Ljava/util/LinkedList;
  .registers 1
  .line 30
    sget-object v0, Lcom/innioasis/ipp/Scan;->AHEAD:Ljava/util/LinkedList;
    return-object v0
.end method

.method static synthetic access$502(Z)Z
  .registers 1
  .line 30
    sput-boolean p0, Lcom/innioasis/ipp/Scan;->looking:Z
    return p0
.end method

.method static synthetic access$600()Ljava/lang/Object;
  .registers 1
  .line 30
    sget-object v0, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    return-object v0
.end method

.method static synthetic access$710()I
  .registers 2
  .line 30
    sget v0, Lcom/innioasis/ipp/Scan;->live:I
    add-int/lit8 v1, v0, -1
    sput v1, Lcom/innioasis/ipp/Scan;->live:I
    return v0
.end method

.method static synthetic access$800()Lcom/innioasis/y1/database/Y1Repository;
  .registers 1
  .line 30
    sget-object v0, Lcom/innioasis/ipp/Scan;->repo:Lcom/innioasis/y1/database/Y1Repository;
    return-object v0
.end method

.method static synthetic access$900()Ljava/util/HashSet;
  .registers 1
  .line 30
    sget-object v0, Lcom/innioasis/ipp/Scan;->building:Ljava/util/HashSet;
    return-object v0
.end method

.method public static book(Ljava/io/File;)Z
  .registers 2
  .line 306
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
  .registers 4
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  .line 388
    const/4 v1, 1
  :L0
    sput-boolean v1, Lcom/innioasis/ipp/Scan;->wrote:Z
  .line 389
    sget-object v2, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
  .line 390
    if-eqz p0, :L3
    if-nez v2, :L1
    goto :L3
  :L1
  .line 391
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v2, p0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result p0
    if-nez p0, :L2
    sget p0, Lcom/innioasis/ipp/Scan;->added:I
    add-int/2addr p0, v1
    sput p0, Lcom/innioasis/ipp/Scan;->added:I
  :L2
  .line 392
    monitor-exit v0
    return-void
  :L3
  .line 390
    monitor-exit v0
    return-void
  :L4
  .line 387
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method static declared-synchronized clean()Z
  .catchall { :L0 .. :L1 } :L4
  .registers 2
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L0
  .line 191
    sget-boolean v1, Lcom/innioasis/ipp/Scan;->marked:Z
    if-eqz v1, :L2
    sget-boolean v1, Lcom/innioasis/ipp/Scan;->wrote:Z
  :L1
    if-nez v1, :L2
    const/4 v1, 1
    goto :L3
  :L2
    const/4 v1, 0
  :L3
    monitor-exit v0
    return v1
  :L4
  .line 191
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method private static declared-synchronized count()V
  .catchall { :L0 .. :L3 } :L6
  .catchall { :L4 .. :L5 } :L6
  .registers 5
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L0
  .line 200
    sget v1, Lcom/innioasis/ipp/Scan;->seen:I
    add-int/lit8 v1, v1, 1
    sput v1, Lcom/innioasis/ipp/Scan;->seen:I
  .line 201
    sget v2, Lcom/innioasis/ipp/Scan;->expected:I
    if-lez v2, :L1
    mul-int/lit8 v3, v1, 100
    div-int/2addr v3, v2
    goto :L2
  :L1
    div-int/lit8 v3, v1, 16
  :L2
  .line 202
    sget v4, Lcom/innioasis/ipp/Scan;->shown:I
  :L3
    if-ne v3, v4, :L4
    monitor-exit v0
    return-void
  :L4
  .line 203
    sput v3, Lcom/innioasis/ipp/Scan;->shown:I
  .line 204
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Loading;->scanned(II)V
  :L5
  .line 205
    monitor-exit v0
    return-void
  :L6
  .line 199
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method public static dir(Ljava/io/File;)Z
  .registers 1
  .line 253
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
  .registers 4
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  .line 441
    const/4 v1, 0
  :L0
    sput-object v1, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
  .line 442
    const/4 v2, 0
    sput v2, Lcom/innioasis/ipp/Scan;->added:I
  .line 443
    new-instance v3, Ljava/util/HashSet;
    invoke-direct { v3 }, Ljava/util/HashSet;-><init>()V
    sput-object v3, Lcom/innioasis/ipp/Scan;->met:Ljava/util/HashSet;
  .line 444
    sput-boolean v2, Lcom/innioasis/ipp/Scan;->marked:Z
  .line 445
    sput-boolean v2, Lcom/innioasis/ipp/Scan;->wrote:Z
  .line 446
    sput-object v1, Lcom/innioasis/ipp/Scan;->py:Ljava/util/HashMap;
  .line 447
    invoke-static { }, Lcom/innioasis/ipp/Scan;->forgetQueue()V
  :L1
  .line 448
    monitor-exit v0
    return-void
  :L2
  .line 440
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method public static exists(Ljava/io/File;)Z
  .registers 2
  .line 249
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
  .line 243
    invoke-virtual { p0 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object p0
  .line 244
    const/16 v0, 46
    invoke-virtual { p0, v0 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v0
  .line 245
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
  .line 506
    if-nez p1, :L0
    return-void
  :L0
  .line 507
    const/4 v0, 0
  :L1
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L4
  .line 508
    invoke-interface { p1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
  .line 509
    instance-of v2, v1, Lcom/innioasis/y1/database/Song;
    if-nez v2, :L2
    goto :L3
  :L2
  .line 510
    check-cast v1, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
  .line 511
    if-eqz v1, :L3
    invoke-virtual { p0, v1 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L3
  .line 507
    add-int/lit8 v0, v0, 1
    goto :L1
  :L4
  .line 513
    return-void
.end method

.method private static forgetQueue()V
  .catchall { :L0 .. :L2 } :L1
  .registers 2
  .line 663
    sget-object v0, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 664
    sget-object v1, Lcom/innioasis/ipp/Scan;->upcoming:Ljava/util/ArrayList;
    invoke-virtual { v1 }, Ljava/util/ArrayList;->clear()V
  .line 665
    sget-object v1, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
    invoke-virtual { v1 }, Ljava/util/HashMap;->clear()V
  .line 666
    sget-object v1, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
    invoke-virtual { v1 }, Ljava/util/HashMap;->clear()V
  .line 667
    const/4 v1, 0
    sput v1, Lcom/innioasis/ipp/Scan;->cursor:I
  .line 668
    sput v1, Lcom/innioasis/ipp/Scan;->next:I
  .line 669
    const/4 v1, 0
    sput-object v1, Lcom/innioasis/ipp/Scan;->repo:Lcom/innioasis/y1/database/Y1Repository;
  .line 670
    invoke-virtual { v0 }, Ljava/lang/Object;->notifyAll()V
  .line 671
    monitor-exit v0
  .line 672
    return-void
  :L1
  .line 671
    move-exception v1
    monitor-exit v0
  :L2
    throw v1
.end method

.method static inDb(Ljava/lang/String;)Z
  .registers 3
  .line 430
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 431
    invoke-static { }, Lcom/innioasis/ipp/Scan;->table()Ljava/util/HashSet;
    move-result-object v1
  .line 432
    if-nez v1, :L1
    return v0
  :L1
  .line 433
    sget-object v0, Lcom/innioasis/music/objects/Constant;->INSTANCE:Lcom/innioasis/music/objects/Constant;
    invoke-virtual { v0, p0 }, Lcom/innioasis/music/objects/Constant;->normalizeAudioBookPath(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v1, p0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result p0
    return p0
.end method

.method public static insert(Lcom/innioasis/y1/database/SongDao;[Lcom/innioasis/y1/database/Song;)V
  .catchall { :L1 .. :L4 } :L3
  .registers 5
  .line 66
    if-eqz p0, :L5
    if-nez p1, :L0
    goto :L5
  :L0
  .line 67
    sget-object v0, Lcom/innioasis/ipp/Scan;->WRITES:Ljava/util/LinkedList;
    monitor-enter v0
  .line 68
    const/4 v1, 2
  :L1
    new-array v1, v1, [Ljava/lang/Object;
    const/4 v2, 0
    aput-object p0, v1, v2
    const/4 p0, 1
    aput-object p1, v1, p0
    invoke-virtual { v0, v1 }, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V
  .line 69
    sget-boolean p1, Lcom/innioasis/ipp/Scan;->writing:Z
    if-nez p1, :L2
  .line 70
    sput-boolean p0, Lcom/innioasis/ipp/Scan;->writing:Z
  .line 71
    new-instance p0, Ljava/lang/Thread;
    new-instance p1, Lcom/innioasis/ipp/Scan$Writer;
    invoke-direct { p1 }, Lcom/innioasis/ipp/Scan$Writer;-><init>()V
    const-string v1, "ipp-scan-db"
    invoke-direct { p0, p1, v1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    invoke-virtual { p0 }, Ljava/lang/Thread;->start()V
  :L2
  .line 73
    invoke-virtual { v0 }, Ljava/lang/Object;->notifyAll()V
  .line 74
    monitor-exit v0
  .line 75
    return-void
  :L3
  .line 74
    move-exception p0
    monitor-exit v0
  :L4
    throw p0
  :L5
  .line 66
    return-void
.end method

.method public static insertLast(Lcom/innioasis/y1/database/SongDao;[Lcom/innioasis/y1/database/Song;)V
  .catchall { :L0 .. :L4 } :L17
  .catch Ljava/lang/InterruptedException; { :L5 .. :L6 } :L7
  .catchall { :L5 .. :L6 } :L17
  .catchall { :L8 .. :L9 } :L17
  .catchall { :L10 .. :L11 } :L14
  .catchall { :L12 .. :L13 } :L14
  .catchall { :L15 .. :L16 } :L14
  .catchall { :L18 .. :L19 } :L17
  .registers 13
  .line 83
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v0
  .line 84
    sget-object v2, Lcom/innioasis/ipp/Scan;->WRITES:Ljava/util/LinkedList;
    monitor-enter v2
  :L0
  .line 85
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
    const-wide/32 v5, 60000
    add-long/2addr v3, v5
  :L1
  .line 86
    sget-object v5, Lcom/innioasis/ipp/Scan;->WRITES:Ljava/util/LinkedList;
    invoke-virtual { v5 }, Ljava/util/LinkedList;->isEmpty()Z
    move-result v6
    if-nez v6, :L2
    sget-boolean v6, Lcom/innioasis/ipp/Scan;->writing:Z
    if-nez v6, :L3
  :L2
    sget-boolean v6, Lcom/innioasis/ipp/Scan;->inWrite:Z
    if-eqz v6, :L8
  :L3
  .line 87
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v6
  :L4
    sub-long v6, v3, v6
  .line 88
    const-wide/16 v8, 0
    cmp-long v10, v6, v8
    if-gtz v10, :L5
    goto :L8
  :L5
  .line 90
    invoke-virtual { v5, v6, v7 }, Ljava/lang/Object;->wait(J)V
  :L6
  .line 93
    nop
  .line 94
    goto :L1
  :L7
  .line 91
    move-exception v3
  .line 92
    nop
  :L8
  .line 95
    monitor-exit v2
  :L9
  .line 98
    sget-object v3, Lcom/innioasis/ipp/Scan;->WRITES:Ljava/util/LinkedList;
    monitor-enter v3
  :L10
  .line 99
    invoke-virtual { v3 }, Ljava/util/LinkedList;->isEmpty()Z
    move-result v2
    if-eqz v2, :L12
    monitor-exit v3
  :L11
  .line 104
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v2
    sub-long/2addr v2, v0
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/ScanProbe;->flushed(J)V
  .line 105
    invoke-interface { p0, p1 }, Lcom/innioasis/y1/database/SongDao;->insert([Lcom/innioasis/y1/database/Song;)V
  .line 106
    return-void
  :L12
  .line 100
    invoke-virtual { v3 }, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, [Ljava/lang/Object;
  .line 101
    monitor-exit v3
  :L13
  .line 102
    const/4 v3, 0
    aget-object v3, v2, v3
    check-cast v3, Lcom/innioasis/y1/database/SongDao;
    const/4 v4, 1
    aget-object v2, v2, v4
    check-cast v2, [Lcom/innioasis/y1/database/Song;
    invoke-static { v3, v2 }, Lcom/innioasis/ipp/Scan;->write(Lcom/innioasis/y1/database/SongDao;[Lcom/innioasis/y1/database/Song;)V
  .line 103
    goto :L9
  :L14
  .line 101
    move-exception p0
  :L15
    monitor-exit v3
  :L16
    throw p0
  :L17
  .line 95
    move-exception p0
  :L18
    monitor-exit v2
  :L19
    goto :L21
  :L20
    throw p0
  :L21
    goto :L20
.end method

.method private static kind(Ljava/io/File;)I
  .registers 3
  .line 230
    sget-object v0, Lcom/innioasis/ipp/Scan;->node:Ljava/io/File;
    if-eq p0, v0, :L4
  .line 231
    nop
  .line 232
    invoke-virtual { p0 }, Ljava/io/File;->isFile()Z
    move-result v0
    const/4 v1, 1
    if-eqz v0, :L0
    goto :L3
  :L0
  .line 233
    invoke-virtual { p0 }, Ljava/io/File;->isDirectory()Z
    move-result v0
    if-eqz v0, :L1
    const/4 v1, 3
    goto :L3
  :L1
  .line 234
    invoke-virtual { p0 }, Ljava/io/File;->exists()Z
    move-result v0
    if-eqz v0, :L2
    goto :L3
  :L2
    const/4 v1, 0
  :L3
  .line 235
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->extOf(Ljava/io/File;)Ljava/lang/String;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Scan;->ext:Ljava/lang/String;
  .line 236
    sput v1, Lcom/innioasis/ipp/Scan;->kind:I
  .line 237
    sput-object p0, Lcom/innioasis/ipp/Scan;->node:Ljava/io/File;
  :L4
  .line 239
    sget p0, Lcom/innioasis/ipp/Scan;->kind:I
    return p0
.end method

.method public static known(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
  .registers 6
  .line 40
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v0
  .line 41
    sget-boolean v2, Lcom/innioasis/ipp/Scan;->marked:Z
    if-nez v2, :L0
    invoke-static { }, Lcom/innioasis/ipp/Scan;->mark()V
  :L0
  .line 42
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->inDb(Ljava/lang/String;)Z
    move-result v2
  .line 43
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->meet(Ljava/lang/String;)V
  .line 44
    invoke-static { }, Lcom/innioasis/ipp/Scan;->count()V
  .line 45
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v3
    sub-long/2addr v3, v0
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/ScanProbe;->known(J)V
  .line 46
    sget-boolean p0, Lcom/innioasis/ipp/ScanProbe;->force:Z
    const/4 v0, 0
    if-eqz p0, :L1
    return-object v0
  :L1
  .line 47
    if-eqz v2, :L2
    sget-object v0, Lcom/innioasis/ipp/Scan;->MARKER:Lcom/innioasis/y1/database/Song;
  :L2
    return-object v0
.end method

.method public static listed([Ljava/io/File;)V
  .catchall { :L1 .. :L4 } :L3
  .registers 4
  .line 262
    if-eqz p0, :L5
    array-length v0, p0
    if-nez v0, :L0
    goto :L5
  :L0
  .line 263
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->queue([Ljava/io/File;)V
  .line 264
    sget-object v0, Lcom/innioasis/ipp/Scan;->AHEAD:Ljava/util/LinkedList;
    monitor-enter v0
  :L1
  .line 265
    invoke-virtual { v0, p0 }, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V
  .line 266
    sget-boolean p0, Lcom/innioasis/ipp/Scan;->looking:Z
    if-nez p0, :L2
  .line 267
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/Scan;->looking:Z
  .line 268
    new-instance p0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/ipp/Scan$Looker;
    invoke-direct { v1 }, Lcom/innioasis/ipp/Scan$Looker;-><init>()V
    const-string v2, "ipp-scan-stat"
    invoke-direct { p0, v1, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    invoke-virtual { p0 }, Ljava/lang/Thread;->start()V
  :L2
  .line 270
    invoke-virtual { v0 }, Ljava/lang/Object;->notifyAll()V
  .line 271
    monitor-exit v0
  .line 272
    return-void
  :L3
  .line 271
    move-exception p0
    monitor-exit v0
  :L4
    throw p0
  :L5
  .line 262
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
  .line 461
    invoke-static { }, Lcom/innioasis/ipp/Artists;->ensureExceptions()V
  .line 462
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 463
    if-nez v0, :L1
    sget-object v0, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
    return-object v0
  :L1
  .line 464
    invoke-static { }, Lcom/innioasis/ipp/Scan;->pathsOnly()Ljava/util/HashSet;
    move-result-object v1
  .line 465
    if-nez v1, :L2
  .line 466
    new-instance v1, Ljava/util/HashSet;
    invoke-direct { v1 }, Ljava/util/HashSet;-><init>()V
  .line 467
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository;->ippSongDao()Lcom/innioasis/y1/database/SongDao;
    move-result-object v0
    invoke-interface { v0 }, Lcom/innioasis/y1/database/SongDao;->getSongsSync()Ljava/util/List;
    move-result-object v0
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Scan;->fill(Ljava/util/HashSet;Ljava/util/List;)V
  :L2
  .line 469
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
  .line 470
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L3
  .line 471
    const/4 v2, 0
  :L4
    sput v2, Lcom/innioasis/ipp/Scan;->seen:I
  .line 472
    invoke-virtual { v1 }, Ljava/util/HashSet;->size()I
    move-result v3
    sput v3, Lcom/innioasis/ipp/Scan;->expected:I
  .line 473
    const/4 v3, -1
    sput v3, Lcom/innioasis/ipp/Scan;->shown:I
  .line 474
    sput v2, Lcom/innioasis/ipp/Scan;->added:I
  .line 475
    monitor-exit v0
  :L5
  .line 477
    invoke-virtual { v1 }, Ljava/util/HashSet;->isEmpty()Z
    move-result v0
    if-eqz v0, :L6
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Meta;->noteLibraryRead(Landroid/content/Context;)V
  :L6
  .line 478
    sput-object v1, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
  :L7
  .line 479
    return-object v1
  :L8
  .line 475
    move-exception v1
  :L9
    monitor-exit v0
  :L10
    throw v1
  :L11
  .line 480
    move-exception v0
  .line 481
    sget-object v0, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
    return-object v0
.end method

.method private static declared-synchronized mark()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  .line 55
    const/4 v1, 1
  :L0
    sput-boolean v1, Lcom/innioasis/ipp/Scan;->marked:Z
  .line 56
    new-instance v1, Ljava/util/HashMap;
    invoke-direct { v1 }, Ljava/util/HashMap;-><init>()V
    sput-object v1, Lcom/innioasis/ipp/Scan;->py:Ljava/util/HashMap;
  .line 57
    invoke-static { }, Lcom/innioasis/ipp/Albums;->scanStarts()V
  :L1
  .line 58
    monitor-exit v0
    return-void
  :L2
  .line 54
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method private static declared-synchronized meet(Ljava/lang/String;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  .line 398
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
  .line 397
    move-exception p0
    monitor-exit v0
    throw p0
  :L3
  .line 399
    monitor-exit v0
    return-void
.end method

.method public static music(Ljava/io/File;)Z
  .registers 2
  .line 311
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
  .line 403
    sget-object v0, Lcom/innioasis/ipp/Scan;->card:Ljava/lang/String;
  .line 404
    if-nez v0, :L0
    invoke-static { }, Lcom/innioasis/ipp/Panel;->card()Ljava/io/File;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Scan;->card:Ljava/lang/String;
  :L0
  .line 405
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Scan;->under(Ljava/lang/String;Ljava/lang/String;)Z
    move-result p0
    return p0
.end method

.method private static pass(I)V
  .registers 6
  .line 633
    sget v0, Lcom/innioasis/ipp/Scan;->cursor:I
  :L0
    const/4 v1, 0
    if-ge v0, p0, :L3
  .line 634
    sget-object v2, Lcom/innioasis/ipp/Scan;->upcoming:Ljava/util/ArrayList;
    invoke-virtual { v2, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/io/File;
  .line 635
    if-nez v3, :L1
    goto :L2
  :L1
  .line 636
    invoke-virtual { v3 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v3
  .line 637
    sget-object v4, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
    invoke-virtual { v4, v3 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 638
    sget-object v4, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
    invoke-virtual { v4, v3 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 639
    invoke-virtual { v2, v0, v1 }, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;
  :L2
  .line 633
    add-int/lit8 v0, v0, 1
    goto :L0
  :L3
  .line 641
    sget-object v0, Lcom/innioasis/ipp/Scan;->upcoming:Ljava/util/ArrayList;
    invoke-virtual { v0, p0, v1 }, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;
  .line 642
    add-int/lit8 p0, p0, 1
    sput p0, Lcom/innioasis/ipp/Scan;->cursor:I
  .line 643
    return-void
.end method

.method private static pathsOnly()Ljava/util/HashSet;
  .catchall { :L0 .. :L1 } :L11
  .catchall { :L1 .. :L3 } :L10
  .catchall { :L5 .. :L6 } :L7
  .catchall { :L13 .. :L14 } :L15
  .registers 5
  .line 487
    nop
  .line 489
    const/4 v0, 0
  :L0
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->db()Landroidx/room/RoomDatabase;
    move-result-object v1
    const-string v2, "select path from song"
    invoke-virtual { v1, v2, v0 }, Landroidx/room/RoomDatabase;->query(Ljava/lang/String;[Ljava/lang/Object;)Landroid/database/Cursor;
    move-result-object v1
  :L1
  .line 490
    new-instance v2, Ljava/util/HashSet;
    invoke-interface { v1 }, Landroid/database/Cursor;->getCount()I
    move-result v3
    mul-int/lit8 v3, v3, 2
    add-int/lit8 v3, v3, 16
    invoke-direct { v2, v3 }, Ljava/util/HashSet;-><init>(I)V
  :L2
  .line 491
    invoke-interface { v1 }, Landroid/database/Cursor;->moveToNext()Z
    move-result v3
    if-eqz v3, :L4
  .line 492
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
  .line 494
    nop
  .line 499
    if-eqz v1, :L8
  :L5
    invoke-interface { v1 }, Landroid/database/Cursor;->close()V
  :L6
    goto :L8
  :L7
  .line 500
    move-exception v0
    goto :L9
  :L8
  .line 501
    nop
  :L9
  .line 494
    return-object v2
  :L10
  .line 495
    move-exception v2
    goto :L12
  :L11
    move-exception v1
    move-object v1, v0
  :L12
  .line 496
    nop
  .line 499
    if-eqz v1, :L16
  :L13
    invoke-interface { v1 }, Landroid/database/Cursor;->close()V
  :L14
    goto :L16
  :L15
  .line 500
    move-exception v1
    goto :L17
  :L16
  .line 501
    nop
  :L17
  .line 496
    return-object v0
.end method

.method public static pinyin(Lcom/innioasis/y1/utils/HanziToPinyin;Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L1 .. :L2 } :L7
  .catchall { :L4 .. :L6 } :L5
  .catchall { :L8 .. :L9 } :L7
  .registers 4
  .line 175
    sget-object v0, Lcom/innioasis/ipp/Scan;->py:Ljava/util/HashMap;
  .line 176
    if-eqz v0, :L10
    if-nez p1, :L0
    goto :L10
  :L0
  .line 178
    monitor-enter v0
  :L1
  .line 179
    invoke-virtual { v0, p1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/lang/String;
  .line 180
    monitor-exit v0
  :L2
  .line 181
    if-eqz v1, :L3
    return-object v1
  :L3
  .line 182
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/utils/HanziToPinyin;->getString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 183
    monitor-enter v0
  :L4
  .line 184
    invoke-virtual { v0, p1, p0 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 185
    monitor-exit v0
  .line 186
    return-object p0
  :L5
  .line 185
    move-exception p0
    monitor-exit v0
  :L6
    throw p0
  :L7
  .line 180
    move-exception p0
  :L8
    monitor-exit v0
  :L9
    throw p0
  :L10
  .line 176
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/utils/HanziToPinyin;->getString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static pool()I
  .registers 2
  .line 655
    invoke-static { }, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/Runtime;->availableProcessors()I
    move-result v0
  .line 656
    add-int/lit8 v0, v0, 1
  .line 657
    const/4 v1, 3
    if-le v0, v1, :L0
    const/4 v0, 3
  :L0
  .line 658
    return v0
.end method

.method private static queue([Ljava/io/File;)V
  .catchall { :L0 .. :L1 } :L10
  .catchall { :L2 .. :L3 } :L6
  .catchall { :L5 .. :L11 } :L10
  .registers 8
  .line 546
    sget-object v0, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    monitor-enter v0
  .line 547
    nop
  .line 548
    const/4 v1, 0
    const/4 v2, 0
  :L0
    array-length v3, p0
    if-ge v1, v3, :L8
  .line 549
    aget-object v3, p0, v1
  :L1
  .line 551
    if-eqz v3, :L7
  :L2
    invoke-static { v3 }, Lcom/innioasis/ipp/Scan;->songFile(Ljava/io/File;)Z
    move-result v4
  :L3
    if-nez v4, :L4
    goto :L7
  :L4
  .line 554
    nop
  :L5
  .line 555
    sget-object v2, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
    invoke-virtual { v3 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v4
    sget-object v5, Lcom/innioasis/ipp/Scan;->upcoming:Ljava/util/ArrayList;
    invoke-virtual { v5 }, Ljava/util/ArrayList;->size()I
    move-result v6
    invoke-static { v6 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v6
    invoke-virtual { v2, v4, v6 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 556
    invoke-virtual { v5, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 557
    const/4 v2, 1
    goto :L7
  :L6
  .line 552
    move-exception v3
  .line 553
    nop
  :L7
  .line 548
    add-int/lit8 v1, v1, 1
    goto :L0
  :L8
  .line 559
    if-eqz v2, :L9
    sget-object p0, Lcom/innioasis/ipp/Scan;->repo:Lcom/innioasis/y1/database/Y1Repository;
    if-eqz p0, :L9
  .line 560
    invoke-static { }, Lcom/innioasis/ipp/Scan;->start()V
  .line 561
    sget-object p0, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    invoke-virtual { p0 }, Ljava/lang/Object;->notifyAll()V
  :L9
  .line 563
    monitor-exit v0
  .line 564
    return-void
  :L10
  .line 563
    move-exception p0
    monitor-exit v0
  :L11
    goto :L13
  :L12
    throw p0
  :L13
    goto :L12
.end method

.method public static rows(Lcom/innioasis/y1/database/SongDao;)Ljava/util/List;
  .catchall { :L0 .. :L5 } :L9
  .catchall { :L10 .. :L11 } :L9
  .registers 6
  .line 360
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 361
    const-class v1, Lcom/innioasis/ipp/Scan;
    monitor-enter v1
  :L0
  .line 362
    sget-object v2, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
    if-nez v2, :L1
    invoke-interface { p0 }, Lcom/innioasis/y1/database/SongDao;->getSongsSync()Ljava/util/List;
    move-result-object p0
    monitor-exit v1
    return-object p0
  :L1
  .line 363
    sget-object v2, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
    invoke-virtual { v2 }, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;
    move-result-object v2
  :L2
  .line 364
    invoke-interface { v2 }, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :L4
  .line 365
    invoke-interface { v2 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
  .line 366
    sget-object v4, Lcom/innioasis/ipp/Scan;->met:Ljava/util/HashSet;
    invoke-virtual { v4, v3 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v4
    if-nez v4, :L3
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 367
    goto :L2
  :L4
  .line 368
    monitor-exit v1
  :L5
  .line 369
    new-instance v1, Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v2
    invoke-direct { v1, v2 }, Ljava/util/ArrayList;-><init>(I)V
  .line 370
    const/4 v2, 0
  :L6
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge v2, v3, :L8
  .line 371
    invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
    invoke-interface { p0, v3 }, Lcom/innioasis/y1/database/SongDao;->getSongByPathSyncDB(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object v3
  .line 372
    if-eqz v3, :L7
    invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L7
  .line 370
    add-int/lit8 v2, v2, 1
    goto :L6
  :L8
  .line 374
    return-object v1
  :L9
  .line 368
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
  .line 328
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
  .line 568
    nop
  .line 569
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v0
  .line 570
    const/4 v2, 3
    sput v2, Lcom/innioasis/ipp/ScanProbe;->how:I
  :L0
  .line 572
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Scan;->take(Lcom/innioasis/y1/database/Y1Repository;Ljava/io/File;)Lcom/innioasis/y1/database/Song;
    move-result-object v2
  :L1
  .line 575
    goto :L3
  :L2
  .line 573
    move-exception v2
  .line 574
    const/4 v2, 0
  :L3
  .line 576
    if-nez v2, :L4
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/database/Y1Repository;->fileToSong(Ljava/io/File;)Lcom/innioasis/y1/database/Song;
    move-result-object v2
  :L4
  .line 577
    sget p0, Lcom/innioasis/ipp/ScanProbe;->how:I
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v3
    sub-long/2addr v3, v0
    invoke-static { p0, v3, v4 }, Lcom/innioasis/ipp/ScanProbe;->song(IJ)V
  .line 578
    invoke-static { v2 }, Lcom/innioasis/ipp/Scan;->built(Lcom/innioasis/y1/database/Song;)V
  .line 579
    return-object v2
.end method

.method private static songFile(Ljava/io/File;)Z
  .registers 3
  .line 537
    invoke-virtual { p0 }, Ljava/io/File;->isHidden()Z
    move-result v0
    const/4 v1, 0
    if-eqz v0, :L0
    return v1
  :L0
  .line 538
    invoke-virtual { p0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v0
  .line 539
    if-nez v0, :L1
    return v1
  :L1
  .line 540
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->extOf(Ljava/io/File;)Ljava/lang/String;
    move-result-object p0
  .line 541
    sget-object v1, Lcom/innioasis/music/objects/Constant;->INSTANCE:Lcom/innioasis/music/objects/Constant;
    invoke-virtual { v1, v0 }, Lcom/innioasis/music/objects/Constant;->pathInAudiobook(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :L2
    sget-object v0, Lcom/innioasis/ipp/Scan;->bookExt:Ljava/util/HashSet;
    goto :L3
  :L2
    sget-object v0, Lcom/innioasis/ipp/Scan;->musicExt:Ljava/util/HashSet;
  :L3
    invoke-virtual { v0, p0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result p0
    return p0
.end method

.method private static start()V
  .registers 3
  .line 647
    invoke-static { }, Lcom/innioasis/ipp/Scan;->pool()I
    move-result v0
  :L0
  .line 648
    sget v1, Lcom/innioasis/ipp/Scan;->live:I
    if-ge v1, v0, :L1
  .line 649
    add-int/lit8 v1, v1, 1
    sput v1, Lcom/innioasis/ipp/Scan;->live:I
  .line 650
    new-instance v1, Ljava/lang/Thread;
    new-instance v2, Lcom/innioasis/ipp/Scan$Builder;
    invoke-direct { v2 }, Lcom/innioasis/ipp/Scan$Builder;-><init>()V
    invoke-direct { v1, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v1 }, Ljava/lang/Thread;->start()V
    goto :L0
  :L1
  .line 652
    return-void
.end method

.method public static stays(Lcom/innioasis/y1/database/Song;)Z
  .catchall { :L2 .. :L3 } :L11
  .catchall { :L7 .. :L9 } :L8
  .catchall { :L12 .. :L13 } :L11
  .registers 4
  .line 337
    const/4 v0, 1
    if-nez p0, :L0
    return v0
  :L0
  .line 338
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
  .line 339
    if-nez p0, :L1
    return v0
  :L1
  .line 341
    const-class v1, Lcom/innioasis/ipp/Scan;
    monitor-enter v1
  :L2
  .line 342
    sget-object v2, Lcom/innioasis/ipp/Scan;->met:Ljava/util/HashSet;
    invoke-virtual { v2, p0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v2
  .line 343
    monitor-exit v1
  :L3
  .line 344
    invoke-static { v2 }, Lcom/innioasis/ipp/ScanProbe;->exists(Z)V
  .line 345
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->ours(Ljava/lang/String;)Z
    move-result v1
    if-nez v1, :L5
    if-nez v2, :L4
    new-instance v1, Ljava/io/File;
    invoke-direct { v1, p0 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result p0
    if-eqz p0, :L5
  :L4
    const/4 p0, 1
    goto :L6
  :L5
    const/4 p0, 0
  :L6
  .line 346
    if-nez p0, :L10
  .line 347
    const-class v1, Lcom/innioasis/ipp/Scan;
    monitor-enter v1
  :L7
  .line 348
    sput-boolean v0, Lcom/innioasis/ipp/Scan;->wrote:Z
  .line 349
    monitor-exit v1
    goto :L10
  :L8
    move-exception p0
    monitor-exit v1
  :L9
    throw p0
  :L10
  .line 351
    return p0
  :L11
  .line 343
    move-exception p0
  :L12
    monitor-exit v1
  :L13
    throw p0
.end method

.method private static declared-synchronized table()Ljava/util/HashSet;
  .catchall { :L0 .. :L3 } :L4
  .registers 9
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L0
  .line 451
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
  .line 452
    sget-object v3, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
  .line 453
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
  .line 454
    sput-wide v1, Lcom/innioasis/ipp/Scan;->asked:J
  :L3
  .line 455
    monitor-exit v0
    return-object v3
  :L4
  .line 450
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method private static take(Lcom/innioasis/y1/database/Y1Repository;Ljava/io/File;)Lcom/innioasis/y1/database/Song;
  .catchall { :L1 .. :L9 } :L15
  .catchall { :L10 .. :L11 } :L12
  .catchall { :L13 .. :L16 } :L15
  .registers 10
  .line 584
    invoke-virtual { p1 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object p1
  .line 585
    const/4 v0, 0
    if-nez p1, :L0
    return-object v0
  :L0
  .line 587
    sget-object v1, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    monitor-enter v1
  :L1
  .line 588
    sget-object v2, Lcom/innioasis/ipp/Scan;->repo:Lcom/innioasis/y1/database/Y1Repository;
    if-nez v2, :L2
  .line 589
    sput-object p0, Lcom/innioasis/ipp/Scan;->repo:Lcom/innioasis/y1/database/Y1Repository;
  .line 590
    invoke-static { }, Lcom/innioasis/ipp/Scan;->start()V
  .line 591
    invoke-virtual { v1 }, Ljava/lang/Object;->notifyAll()V
  :L2
  .line 593
    sget-object p0, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
    invoke-virtual { p0, p1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
  .line 594
    if-nez v2, :L3
    const/4 v2, -1
    goto :L4
  :L3
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result v2
  :L4
  .line 595
    sget v3, Lcom/innioasis/ipp/Scan;->cursor:I
    if-ge v2, v3, :L5
  .line 596
    const/4 p0, 2
    sput p0, Lcom/innioasis/ipp/ScanProbe;->how:I
  .line 597
    monitor-exit v1
    return-object v0
  :L5
  .line 599
    invoke-static { v2 }, Lcom/innioasis/ipp/Scan;->pass(I)V
  .line 600
    sget v3, Lcom/innioasis/ipp/Scan;->next:I
    const/4 v4, 1
    if-lt v2, v3, :L6
  .line 601
    add-int/2addr v2, v4
    sput v2, Lcom/innioasis/ipp/Scan;->next:I
  .line 602
    invoke-virtual { p0, p1 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 603
    invoke-static { }, Lcom/innioasis/ipp/Scan;->start()V
  .line 604
    invoke-virtual { v1 }, Ljava/lang/Object;->notifyAll()V
  .line 605
    monitor-exit v1
    return-object v0
  :L6
  .line 607
    sget-object p0, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
    invoke-virtual { p0, p1 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/database/Song;
  .line 608
    if-eqz p0, :L7
  .line 609
    const/4 v0, 0
    sput v0, Lcom/innioasis/ipp/ScanProbe;->how:I
    goto :L14
  :L7
  .line 610
    sget-object v0, Lcom/innioasis/ipp/Scan;->building:Ljava/util/HashSet;
    invoke-virtual { v0, p1 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L14
  .line 612
    sput v4, Lcom/innioasis/ipp/ScanProbe;->how:I
  .line 613
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    const-wide/16 v4, 20000
    add-long/2addr v2, v4
  :L8
  .line 614
    sget-object p0, Lcom/innioasis/ipp/Scan;->building:Ljava/util/HashSet;
    invoke-virtual { p0, p1 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L13
  .line 615
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
  :L9
    sub-long v4, v2, v4
  .line 616
    const-wide/16 v6, 0
    cmp-long p0, v4, v6
    if-gtz p0, :L10
    goto :L13
  :L10
  .line 618
    sget-object p0, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    invoke-virtual { p0, v4, v5 }, Ljava/lang/Object;->wait(J)V
  :L11
  .line 621
    nop
  .line 622
    goto :L8
  :L12
  .line 619
    move-exception p0
  .line 620
    nop
  :L13
  .line 623
    sget-object p0, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
    invoke-virtual { p0, p1 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/database/Song;
  :L14
  .line 625
    sget-object v0, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
    invoke-virtual { v0, p1 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 626
    sget-object p1, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    invoke-virtual { p1 }, Ljava/lang/Object;->notifyAll()V
  .line 627
    monitor-exit v1
    return-object p0
  :L15
  .line 628
    move-exception p0
    monitor-exit v1
  :L16
    goto :L18
  :L17
    throw p0
  :L18
    goto :L17
.end method

.method public static themes(Ljava/lang/String;)Z
  .registers 7
  .line 321
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
  .line 379
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L0
  .line 380
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
  .line 381
    monitor-exit v0
  :L2
  .line 382
    if-nez p0, :L3
    const/4 p0, 0
    goto :L4
  :L3
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result p0
  :L4
    return p0
  :L5
  .line 381
    move-exception p0
  :L6
    monitor-exit v0
  :L7
    throw p0
.end method

.method private static under(Ljava/lang/String;Ljava/lang/String;)Z
  .registers 10
  .line 412
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 413
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v7
  .line 414
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
  .line 415
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
  .line 316
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

.method private static write(Lcom/innioasis/y1/database/SongDao;[Lcom/innioasis/y1/database/Song;)V
  .catchall { :L1 .. :L2 } :L3
  .registers 7
  .line 153
    const/4 v0, 0
  :L0
    const/4 v1, 3
    if-ge v0, v1, :L4
  .line 154
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v1
  :L1
  .line 156
    invoke-interface { p0, p1 }, Lcom/innioasis/y1/database/SongDao;->insert([Lcom/innioasis/y1/database/Song;)V
  .line 157
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v3
    sub-long/2addr v3, v1
    invoke-static { v3, v4 }, Lcom/innioasis/ipp/ScanProbe;->wrote(J)V
  .line 158
    invoke-static { }, Lcom/innioasis/ipp/Ipp;->libraryChanged()V
  :L2
  .line 159
    return-void
  :L3
  .line 160
    move-exception v1
  .line 161
    const-wide/16 v1, 1000
    invoke-static { v1, v2 }, Landroid/os/SystemClock;->sleep(J)V
  .line 153
    add-int/lit8 v0, v0, 1
    goto :L0
  :L4
  .line 164
    new-instance p0, Ljava/lang/StringBuilder;
    invoke-direct { p0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v0, "library scan: a batch of "
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    array-length p1, p1
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string p1, " song(s) was not written"
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 165
    return-void
.end method
