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

.field private final static PORTION:I = 5000

.field private final static THEMES:Ljava/lang/String; = "/storage/sdcard0/themes"

.field private final static VIDEO:[Ljava/lang/String;

.field private final static WAIT_MS:J = 20000L

.field private final static WRITES:Ljava/util/LinkedList;

.field private static added:I

.field private static asked:J

.field private static at:Ljava/util/HashMap;

.field private final static bookExt:Ljava/util/HashSet;

.field private final static building:Ljava/util/HashSet;

.field private static card:Ljava/lang/String;

.field private static cursor:I

.field private static expected:I

.field private static ext:Ljava/lang/String;

.field private static inWrite:Z

.field private static kind:I

.field private static labCpu:J

.field private static labCpuTail:J

.field private static labDirs:I

.field private static labKnown:J

.field private static labList:J

.field private static labListed:J

.field private static labLoad:J

.field private static labLook:J

.field private static labNodes:I

.field private static labSong:J

.field private static labSongs:I

.field private static labStart:J

.field private static labTail:J

.field private static live:I

.field private static looking:Z

.field private static marked:Z

.field private static met:Ljava/util/HashSet;

.field private final static musicExt:Ljava/util/HashSet;

.field private static next:I

.field private static node:Ljava/io/File;

.field private static volatile paths:Ljava/util/HashSet;

.field private static volatile py:Ljava/util/HashMap;

.field private static ready:Ljava/util/HashMap;

.field private static repo:Lcom/innioasis/y1/database/Y1Repository;

.field private static seen:I

.field private static shown:I

.field private static upcoming:Ljava/util/ArrayList;

.field private final static videoExt:Ljava/util/HashSet;

.field private static writing:Z

.field private static wrote:Z

.method static constructor <clinit>()V
  .registers 25
  .line 133
    new-instance v0, Ljava/util/LinkedList;
    invoke-direct { v0 }, Ljava/util/LinkedList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->WRITES:Ljava/util/LinkedList;
  .line 220
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Scan;->shown:I
  .line 234
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
  .line 236
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
  .line 238
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
  .line 240
    new-instance v1, Ljava/util/HashSet;
    invoke-static { v0 }, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Formats;->more(Ljava/util/List;)Ljava/util/List;
    move-result-object v0
    invoke-direct { v1, v0 }, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V
    sput-object v1, Lcom/innioasis/ipp/Scan;->musicExt:Ljava/util/HashSet;
  .line 241
    new-instance v0, Ljava/util/HashSet;
    invoke-static { v15 }, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Formats;->more(Ljava/util/List;)Ljava/util/List;
    move-result-object v1
    invoke-direct { v0, v1 }, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V
    sput-object v0, Lcom/innioasis/ipp/Scan;->bookExt:Ljava/util/HashSet;
  .line 242
    new-instance v0, Ljava/util/HashSet;
    invoke-static { v2 }, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;
    move-result-object v1
    invoke-direct { v0, v1 }, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V
    sput-object v0, Lcom/innioasis/ipp/Scan;->videoExt:Ljava/util/HashSet;
  .line 302
    new-instance v0, Ljava/util/LinkedList;
    invoke-direct { v0 }, Ljava/util/LinkedList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->AHEAD:Ljava/util/LinkedList;
  .line 424
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->met:Ljava/util/HashSet;
  .line 448
    new-instance v0, Lcom/innioasis/y1/database/Song;
    invoke-direct { v0 }, Lcom/innioasis/y1/database/Song;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->MARKER:Lcom/innioasis/y1/database/Song;
  .line 565
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
  .line 571
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->upcoming:Ljava/util/ArrayList;
  .line 572
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
  .line 577
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
  .line 578
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
  .line 334
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
  .line 417
    const/4 v1, 1
  :L0
    sput-boolean v1, Lcom/innioasis/ipp/Scan;->wrote:Z
  .line 418
    sget-object v2, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
  .line 419
    if-eqz p0, :L3
    if-nez v2, :L1
    goto :L3
  :L1
  .line 420
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v2, p0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result p0
    if-nez p0, :L2
    sget p0, Lcom/innioasis/ipp/Scan;->added:I
    add-int/2addr p0, v1
    sput p0, Lcom/innioasis/ipp/Scan;->added:I
  :L2
  .line 421
    monitor-exit v0
    return-void
  :L3
  .line 419
    monitor-exit v0
    return-void
  :L4
  .line 416
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
  .line 214
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
  .line 214
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
  .line 223
    sget v1, Lcom/innioasis/ipp/Scan;->seen:I
    add-int/lit8 v1, v1, 1
    sput v1, Lcom/innioasis/ipp/Scan;->seen:I
  .line 224
    sget v2, Lcom/innioasis/ipp/Scan;->expected:I
    if-lez v2, :L1
    mul-int/lit8 v3, v1, 100
    div-int/2addr v3, v2
    goto :L2
  :L1
    div-int/lit8 v3, v1, 16
  :L2
  .line 225
    sget v4, Lcom/innioasis/ipp/Scan;->shown:I
  :L3
    if-ne v3, v4, :L4
    monitor-exit v0
    return-void
  :L4
  .line 226
    sput v3, Lcom/innioasis/ipp/Scan;->shown:I
  .line 227
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Loading;->scanned(II)V
  :L5
  .line 228
    monitor-exit v0
    return-void
  :L6
  .line 222
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method public static dir(Ljava/io/File;)Z
  .registers 1
  .line 279
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
  :L0
  .line 470
    invoke-static { }, Lcom/innioasis/ipp/Scan;->labEnd()V
  .line 471
    const/4 v1, 0
    sput-object v1, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
  .line 472
    const/4 v2, 0
    sput v2, Lcom/innioasis/ipp/Scan;->added:I
  .line 473
    new-instance v3, Ljava/util/HashSet;
    invoke-direct { v3 }, Ljava/util/HashSet;-><init>()V
    sput-object v3, Lcom/innioasis/ipp/Scan;->met:Ljava/util/HashSet;
  .line 474
    sput-boolean v2, Lcom/innioasis/ipp/Scan;->marked:Z
  .line 475
    sput-boolean v2, Lcom/innioasis/ipp/Scan;->wrote:Z
  .line 476
    sput-object v1, Lcom/innioasis/ipp/Scan;->py:Ljava/util/HashMap;
  .line 477
    invoke-static { }, Lcom/innioasis/ipp/Scan;->forgetQueue()V
  :L1
  .line 478
    monitor-exit v0
    return-void
  :L2
  .line 469
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method public static exists(Ljava/io/File;)Z
  .registers 2
  .line 275
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
  .line 269
    invoke-virtual { p0 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object p0
  .line 270
    const/16 v0, 46
    invoke-virtual { p0, v0 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v0
  .line 271
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
  .line 550
    if-nez p1, :L0
    return-void
  :L0
  .line 551
    const/4 v0, 0
  :L1
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L4
  .line 552
    invoke-interface { p1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
  .line 553
    instance-of v2, v1, Lcom/innioasis/y1/database/Song;
    if-nez v2, :L2
    goto :L3
  :L2
  .line 554
    check-cast v1, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
  .line 555
    if-eqz v1, :L3
    invoke-virtual { p0, v1 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L3
  .line 551
    add-int/lit8 v0, v0, 1
    goto :L1
  :L4
  .line 557
    return-void
.end method

.method private static forgetQueue()V
  .catchall { :L0 .. :L2 } :L1
  .registers 2
  .line 714
    sget-object v0, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 715
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
    sput-object v1, Lcom/innioasis/ipp/Scan;->upcoming:Ljava/util/ArrayList;
  .line 716
    new-instance v1, Ljava/util/HashMap;
    invoke-direct { v1 }, Ljava/util/HashMap;-><init>()V
    sput-object v1, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
  .line 717
    new-instance v1, Ljava/util/HashMap;
    invoke-direct { v1 }, Ljava/util/HashMap;-><init>()V
    sput-object v1, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
  .line 718
    const/4 v1, 0
    sput v1, Lcom/innioasis/ipp/Scan;->cursor:I
  .line 719
    sput v1, Lcom/innioasis/ipp/Scan;->next:I
  .line 720
    const/4 v1, 0
    sput-object v1, Lcom/innioasis/ipp/Scan;->repo:Lcom/innioasis/y1/database/Y1Repository;
  .line 721
    invoke-virtual { v0 }, Ljava/lang/Object;->notifyAll()V
  .line 722
    monitor-exit v0
  .line 723
    return-void
  :L1
  .line 722
    move-exception v1
    monitor-exit v0
  :L2
    throw v1
.end method

.method static inDb(Ljava/lang/String;)Z
  .registers 3
  .line 459
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 460
    invoke-static { }, Lcom/innioasis/ipp/Scan;->table()Ljava/util/HashSet;
    move-result-object v1
  .line 461
    if-nez v1, :L1
    return v0
  :L1
  .line 462
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
  .line 93
    if-eqz p0, :L5
    if-nez p1, :L0
    goto :L5
  :L0
  .line 94
    sget-object v0, Lcom/innioasis/ipp/Scan;->WRITES:Ljava/util/LinkedList;
    monitor-enter v0
  .line 95
    const/4 v1, 2
  :L1
    new-array v1, v1, [Ljava/lang/Object;
    const/4 v2, 0
    aput-object p0, v1, v2
    const/4 p0, 1
    aput-object p1, v1, p0
    invoke-virtual { v0, v1 }, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V
  .line 96
    sget-boolean p1, Lcom/innioasis/ipp/Scan;->writing:Z
    if-nez p1, :L2
  .line 97
    sput-boolean p0, Lcom/innioasis/ipp/Scan;->writing:Z
  .line 98
    new-instance p0, Ljava/lang/Thread;
    new-instance p1, Lcom/innioasis/ipp/Scan$Writer;
    invoke-direct { p1 }, Lcom/innioasis/ipp/Scan$Writer;-><init>()V
    const-string v1, "ipp-scan-db"
    invoke-direct { p0, p1, v1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    invoke-virtual { p0 }, Ljava/lang/Thread;->start()V
  :L2
  .line 100
    invoke-virtual { v0 }, Ljava/lang/Object;->notifyAll()V
  .line 101
    monitor-exit v0
  .line 102
    return-void
  :L3
  .line 101
    move-exception p0
    monitor-exit v0
  :L4
    throw p0
  :L5
  .line 93
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
  .registers 11
  .line 110
    sget-object v0, Lcom/innioasis/ipp/Scan;->WRITES:Ljava/util/LinkedList;
    monitor-enter v0
  :L0
  .line 111
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    const-wide/32 v3, 60000
    add-long/2addr v1, v3
  :L1
  .line 112
    sget-object v3, Lcom/innioasis/ipp/Scan;->WRITES:Ljava/util/LinkedList;
    invoke-virtual { v3 }, Ljava/util/LinkedList;->isEmpty()Z
    move-result v4
    if-nez v4, :L2
    sget-boolean v4, Lcom/innioasis/ipp/Scan;->writing:Z
    if-nez v4, :L3
  :L2
    sget-boolean v4, Lcom/innioasis/ipp/Scan;->inWrite:Z
    if-eqz v4, :L8
  :L3
  .line 113
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
  :L4
    sub-long v4, v1, v4
  .line 114
    const-wide/16 v6, 0
    cmp-long v8, v4, v6
    if-gtz v8, :L5
    goto :L8
  :L5
  .line 116
    invoke-virtual { v3, v4, v5 }, Ljava/lang/Object;->wait(J)V
  :L6
  .line 119
    nop
  .line 120
    goto :L1
  :L7
  .line 117
    move-exception v1
  .line 118
    nop
  :L8
  .line 121
    monitor-exit v0
  :L9
  .line 124
    sget-object v1, Lcom/innioasis/ipp/Scan;->WRITES:Ljava/util/LinkedList;
    monitor-enter v1
  :L10
  .line 125
    invoke-virtual { v1 }, Ljava/util/LinkedList;->isEmpty()Z
    move-result v0
    if-eqz v0, :L12
    monitor-exit v1
  :L11
  .line 130
    invoke-interface { p0, p1 }, Lcom/innioasis/y1/database/SongDao;->insert([Lcom/innioasis/y1/database/Song;)V
  .line 131
    return-void
  :L12
  .line 126
    invoke-virtual { v1 }, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, [Ljava/lang/Object;
  .line 127
    monitor-exit v1
  :L13
  .line 128
    const/4 v1, 0
    aget-object v1, v0, v1
    check-cast v1, Lcom/innioasis/y1/database/SongDao;
    const/4 v2, 1
    aget-object v0, v0, v2
    check-cast v0, [Lcom/innioasis/y1/database/Song;
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Scan;->write(Lcom/innioasis/y1/database/SongDao;[Lcom/innioasis/y1/database/Song;)V
  .line 129
    goto :L9
  :L14
  .line 127
    move-exception p0
  :L15
    monitor-exit v1
  :L16
    throw p0
  :L17
  .line 121
    move-exception p0
  :L18
    monitor-exit v0
  :L19
    goto :L21
  :L20
    throw p0
  :L21
    goto :L20
.end method

.method private static kind(Ljava/io/File;)I
  .registers 9
  .line 253
    sget-object v0, Lcom/innioasis/ipp/Scan;->node:Ljava/io/File;
    if-eq p0, v0, :L4
  .line 254
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 255
    nop
  .line 256
    invoke-virtual { p0 }, Ljava/io/File;->isFile()Z
    move-result v2
    const/4 v3, 1
    if-eqz v2, :L0
    const/4 v2, 1
    goto :L3
  :L0
  .line 257
    invoke-virtual { p0 }, Ljava/io/File;->isDirectory()Z
    move-result v2
    if-eqz v2, :L1
    const/4 v2, 3
    goto :L3
  :L1
  .line 258
    invoke-virtual { p0 }, Ljava/io/File;->exists()Z
    move-result v2
    if-eqz v2, :L2
    const/4 v2, 1
    goto :L3
  :L2
    const/4 v2, 0
  :L3
  .line 259
    sget-wide v4, Lcom/innioasis/ipp/Scan;->labLook:J
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v6
    sub-long/2addr v6, v0
    add-long/2addr v4, v6
    sput-wide v4, Lcom/innioasis/ipp/Scan;->labLook:J
  .line 260
    sget v0, Lcom/innioasis/ipp/Scan;->labNodes:I
    add-int/2addr v0, v3
    sput v0, Lcom/innioasis/ipp/Scan;->labNodes:I
  .line 261
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->extOf(Ljava/io/File;)Ljava/lang/String;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Scan;->ext:Ljava/lang/String;
  .line 262
    sput v2, Lcom/innioasis/ipp/Scan;->kind:I
  .line 263
    sput-object p0, Lcom/innioasis/ipp/Scan;->node:Ljava/io/File;
  :L4
  .line 265
    sget p0, Lcom/innioasis/ipp/Scan;->kind:I
    return p0
.end method

.method public static known(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
  .registers 8
  .line 40
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
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
    sget-wide v3, Lcom/innioasis/ipp/Scan;->labKnown:J
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v5
    sub-long/2addr v5, v0
    add-long/2addr v3, v5
    sput-wide v3, Lcom/innioasis/ipp/Scan;->labKnown:J
  .line 46
    if-eqz v2, :L1
    sget-object p0, Lcom/innioasis/ipp/Scan;->MARKER:Lcom/innioasis/y1/database/Song;
    goto :L2
  :L1
    const/4 p0, 0
  :L2
    return-object p0
.end method

.method private static labEnd()V
  .registers 9
  .line 67
    sget-wide v0, Lcom/innioasis/ipp/Scan;->labStart:J
    const-wide/16 v2, 0
    cmp-long v4, v0, v2
    if-nez v4, :L0
    return-void
  :L0
  .line 68
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 69
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v5, "scan: total "
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    sget-wide v5, Lcom/innioasis/ipp/Scan;->labStart:J
    sub-long v5, v0, v5
    invoke-virtual { v4, v5, v6 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v4
    const-string v5, " ms, walk "
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
  .line 70
    sget-wide v5, Lcom/innioasis/ipp/Scan;->labTail:J
    cmp-long v7, v5, v2
    if-nez v7, :L1
    move-wide v5, v0
  :L1
    sget-wide v7, Lcom/innioasis/ipp/Scan;->labStart:J
    sub-long/2addr v5, v7
    invoke-virtual { v4, v5, v6 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v4
    const-string v5, " ms, tail "
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    sget-wide v5, Lcom/innioasis/ipp/Scan;->labTail:J
    cmp-long v7, v5, v2
    if-nez v7, :L2
    move-wide v0, v2
    goto :L3
  :L2
    sub-long/2addr v0, v5
  :L3
    invoke-virtual { v4, v0, v1 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " ms; "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    sget v4, Lcom/innioasis/ipp/Scan;->labNodes:I
    invoke-virtual { v0, v4 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v4, " nodes looked "
    invoke-virtual { v0, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    sget-wide v4, Lcom/innioasis/ipp/Scan;->labLook:J
    invoke-virtual { v0, v4, v5 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    sget v4, Lcom/innioasis/ipp/Scan;->labDirs:I
    invoke-virtual { v0, v4 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v4, " dirs listFiles "
    invoke-virtual { v0, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    sget-wide v4, Lcom/innioasis/ipp/Scan;->labList:J
    invoke-virtual { v0, v4, v5 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    sget v1, Lcom/innioasis/ipp/Scan;->labSongs:I
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " songs built "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    sget-wide v4, Lcom/innioasis/ipp/Scan;->labSong:J
    invoke-virtual { v0, v4, v5 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " ms; paths load "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    sget-wide v4, Lcom/innioasis/ipp/Scan;->labLoad:J
    invoke-virtual { v0, v4, v5 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " ms; wrote "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    sget-boolean v1, Lcom/innioasis/ipp/Scan;->wrote:Z
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, "; known "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    sget-wide v4, Lcom/innioasis/ipp/Scan;->labKnown:J
    invoke-virtual { v0, v4, v5 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " ms (incl. load), listed "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    sget-wide v4, Lcom/innioasis/ipp/Scan;->labListed:J
    invoke-virtual { v0, v4, v5 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " ms; walk cpu "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    sget-wide v4, Lcom/innioasis/ipp/Scan;->labCpuTail:J
    sget-wide v6, Lcom/innioasis/ipp/Scan;->labCpu:J
    sub-long/2addr v4, v6
    invoke-virtual { v0, v4, v5 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " ms"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
  .line 69
    const-string v1, "ipplab"
    invoke-static { v1, v0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 75
    sput-wide v2, Lcom/innioasis/ipp/Scan;->labCpuTail:J
    sput-wide v2, Lcom/innioasis/ipp/Scan;->labCpu:J
    sput-wide v2, Lcom/innioasis/ipp/Scan;->labListed:J
    sput-wide v2, Lcom/innioasis/ipp/Scan;->labKnown:J
    sput-wide v2, Lcom/innioasis/ipp/Scan;->labLoad:J
    sput-wide v2, Lcom/innioasis/ipp/Scan;->labTail:J
    sput-wide v2, Lcom/innioasis/ipp/Scan;->labSong:J
    sput-wide v2, Lcom/innioasis/ipp/Scan;->labList:J
    sput-wide v2, Lcom/innioasis/ipp/Scan;->labLook:J
    sput-wide v2, Lcom/innioasis/ipp/Scan;->labStart:J
  .line 76
    const/4 v0, 0
    sput v0, Lcom/innioasis/ipp/Scan;->labSongs:I
    sput v0, Lcom/innioasis/ipp/Scan;->labDirs:I
    sput v0, Lcom/innioasis/ipp/Scan;->labNodes:I
  .line 77
    return-void
.end method

.method public static list(Ljava/io/File;)[Ljava/io/File;
  .registers 7
  .line 59
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 60
    invoke-virtual { p0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object p0
  .line 61
    sget-wide v2, Lcom/innioasis/ipp/Scan;->labList:J
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
    sub-long/2addr v4, v0
    add-long/2addr v2, v4
    sput-wide v2, Lcom/innioasis/ipp/Scan;->labList:J
  .line 62
    sget v0, Lcom/innioasis/ipp/Scan;->labDirs:I
    add-int/lit8 v0, v0, 1
    sput v0, Lcom/innioasis/ipp/Scan;->labDirs:I
  .line 63
    return-object p0
.end method

.method public static listed([Ljava/io/File;)V
  .catchall { :L1 .. :L3 } :L4
  .catchall { :L5 .. :L6 } :L4
  .registers 7
  .line 288
    if-eqz p0, :L7
    array-length v0, p0
    if-nez v0, :L0
    goto :L7
  :L0
  .line 289
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 290
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->queue([Ljava/io/File;)V
  .line 291
    sget-object v2, Lcom/innioasis/ipp/Scan;->AHEAD:Ljava/util/LinkedList;
    monitor-enter v2
  :L1
  .line 292
    invoke-virtual { v2, p0 }, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V
  .line 293
    sget-boolean p0, Lcom/innioasis/ipp/Scan;->looking:Z
    if-nez p0, :L2
  .line 294
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/Scan;->looking:Z
  .line 295
    new-instance p0, Ljava/lang/Thread;
    new-instance v3, Lcom/innioasis/ipp/Scan$Looker;
    invoke-direct { v3 }, Lcom/innioasis/ipp/Scan$Looker;-><init>()V
    const-string v4, "ipp-scan-stat"
    invoke-direct { p0, v3, v4 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    invoke-virtual { p0 }, Ljava/lang/Thread;->start()V
  :L2
  .line 297
    invoke-virtual { v2 }, Ljava/lang/Object;->notifyAll()V
  .line 298
    monitor-exit v2
  :L3
  .line 299
    sget-wide v2, Lcom/innioasis/ipp/Scan;->labListed:J
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
    sub-long/2addr v4, v0
    add-long/2addr v2, v4
    sput-wide v2, Lcom/innioasis/ipp/Scan;->labListed:J
  .line 300
    return-void
  :L4
  .line 298
    move-exception p0
  :L5
    monitor-exit v2
  :L6
    throw p0
  :L7
  .line 288
    return-void
.end method

.method private static load()Ljava/util/HashSet;
  .catchall { :L0 .. :L3 } :L11
  .catchall { :L4 .. :L5 } :L8
  .catchall { :L5 .. :L7 } :L11
  .catchall { :L9 .. :L10 } :L8
  .catchall { :L10 .. :L11 } :L11
  .registers 8
  :L0
  .line 491
    invoke-static { }, Lcom/innioasis/ipp/Artists;->ensureExceptions()V
  .line 492
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 493
    if-nez v0, :L1
    sget-object v0, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
    return-object v0
  :L1
  .line 494
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
  .line 495
    invoke-static { }, Lcom/innioasis/ipp/Scan;->pathsOnly()Ljava/util/HashSet;
    move-result-object v3
  .line 496
    sget-wide v4, Lcom/innioasis/ipp/Scan;->labLoad:J
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v6
    sub-long/2addr v6, v1
    add-long/2addr v4, v6
    sput-wide v4, Lcom/innioasis/ipp/Scan;->labLoad:J
  .line 497
    if-nez v3, :L2
  .line 498
    new-instance v3, Ljava/util/HashSet;
    invoke-direct { v3 }, Ljava/util/HashSet;-><init>()V
  .line 499
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository;->ippSongDao()Lcom/innioasis/y1/database/SongDao;
    move-result-object v0
    invoke-interface { v0 }, Lcom/innioasis/y1/database/SongDao;->getSongsSync()Ljava/util/List;
    move-result-object v0
    invoke-static { v3, v0 }, Lcom/innioasis/ipp/Scan;->fill(Ljava/util/HashSet;Ljava/util/List;)V
  :L2
  .line 501
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "library scan: "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v3 }, Ljava/util/HashSet;->size()I
    move-result v1
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " path(s) already known"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 502
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L3
  .line 503
    const/4 v1, 0
  :L4
    sput v1, Lcom/innioasis/ipp/Scan;->seen:I
  .line 504
    invoke-virtual { v3 }, Ljava/util/HashSet;->size()I
    move-result v2
    sput v2, Lcom/innioasis/ipp/Scan;->expected:I
  .line 505
    const/4 v2, -1
    sput v2, Lcom/innioasis/ipp/Scan;->shown:I
  .line 506
    sput v1, Lcom/innioasis/ipp/Scan;->added:I
  .line 507
    monitor-exit v0
  :L5
  .line 509
    invoke-virtual { v3 }, Ljava/util/HashSet;->isEmpty()Z
    move-result v0
    if-eqz v0, :L6
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Meta;->noteLibraryRead(Landroid/content/Context;)V
  :L6
  .line 510
    sput-object v3, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
  :L7
  .line 511
    return-object v3
  :L8
  .line 507
    move-exception v1
  :L9
    monitor-exit v0
  :L10
    throw v1
  :L11
  .line 512
    move-exception v0
  .line 513
    sget-object v0, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
    return-object v0
.end method

.method private static declared-synchronized mark()V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L0
  .line 80
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    sput-wide v1, Lcom/innioasis/ipp/Scan;->labStart:J
  .line 81
    invoke-static { }, Landroid/os/SystemClock;->currentThreadTimeMillis()J
    move-result-wide v1
    sput-wide v1, Lcom/innioasis/ipp/Scan;->labCpu:J
  .line 82
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/Scan;->marked:Z
  .line 83
    new-instance v1, Ljava/util/HashMap;
    invoke-direct { v1 }, Ljava/util/HashMap;-><init>()V
    sput-object v1, Lcom/innioasis/ipp/Scan;->py:Ljava/util/HashMap;
  .line 84
    invoke-static { }, Lcom/innioasis/ipp/Albums;->scanStarts()V
  :L1
  .line 85
    monitor-exit v0
    return-void
  :L2
  .line 79
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method private static declared-synchronized meet(Ljava/lang/String;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  .line 427
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
  .line 426
    move-exception p0
    monitor-exit v0
    throw p0
  :L3
  .line 428
    monitor-exit v0
    return-void
.end method

.method public static music(Ljava/io/File;)Z
  .registers 2
  .line 339
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
  .line 432
    sget-object v0, Lcom/innioasis/ipp/Scan;->card:Ljava/lang/String;
  .line 433
    if-nez v0, :L0
    invoke-static { }, Lcom/innioasis/ipp/Panel;->card()Ljava/io/File;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Scan;->card:Ljava/lang/String;
  :L0
  .line 434
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Scan;->under(Ljava/lang/String;Ljava/lang/String;)Z
    move-result p0
    return p0
.end method

.method private static pass(I)V
  .registers 5
  .line 684
    sget v0, Lcom/innioasis/ipp/Scan;->cursor:I
  :L0
    const/4 v1, 0
    if-ge v0, p0, :L3
  .line 685
    sget-object v2, Lcom/innioasis/ipp/Scan;->upcoming:Ljava/util/ArrayList;
    invoke-virtual { v2, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/io/File;
  .line 686
    if-nez v2, :L1
    goto :L2
  :L1
  .line 687
    invoke-virtual { v2 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v2
  .line 688
    sget-object v3, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
    invoke-virtual { v3, v2 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 689
    sget-object v3, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
    invoke-virtual { v3, v2 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 690
    sget-object v2, Lcom/innioasis/ipp/Scan;->upcoming:Ljava/util/ArrayList;
    invoke-virtual { v2, v0, v1 }, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;
  :L2
  .line 684
    add-int/lit8 v0, v0, 1
    goto :L0
  :L3
  .line 692
    sget-object v0, Lcom/innioasis/ipp/Scan;->upcoming:Ljava/util/ArrayList;
    invoke-virtual { v0, p0, v1 }, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;
  .line 693
    add-int/lit8 p0, p0, 1
    sput p0, Lcom/innioasis/ipp/Scan;->cursor:I
  .line 694
    return-void
.end method

.method private static pathsOnly()Ljava/util/HashSet;
  .catchall { :L1 .. :L2 } :L13
  .catchall { :L3 .. :L4 } :L12
  .catchall { :L6 .. :L7 } :L8
  .catchall { :L15 .. :L16 } :L17
  .registers 10
  .line 522
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
  .line 523
    const-wide/16 v1, -1
  :L0
  .line 525
    nop
  .line 526
    nop
  .line 528
    const/4 v3, 0
  :L1
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->db()Landroidx/room/RoomDatabase;
    move-result-object v4
    new-instance v5, Ljava/lang/StringBuilder;
    invoke-direct { v5 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v6, "select rowid, path from song where rowid > "
    invoke-virtual { v5, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v5
    const-string v6, " order by rowid limit "
    invoke-virtual { v5, v6 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    const/16 v6, 5000
    invoke-virtual { v5, v6 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v4, v5, v3 }, Landroidx/room/RoomDatabase;->query(Ljava/lang/String;[Ljava/lang/Object;)Landroid/database/Cursor;
    move-result-object v4
  :L2
    const/4 v5, 0
    const/4 v7, 0
  :L3
  .line 530
    invoke-interface { v4 }, Landroid/database/Cursor;->moveToNext()Z
    move-result v8
    if-eqz v8, :L5
  .line 531
    invoke-interface { v4, v5 }, Landroid/database/Cursor;->getLong(I)J
    move-result-wide v1
  .line 532
    const/4 v8, 1
    invoke-interface { v4, v8 }, Landroid/database/Cursor;->isNull(I)Z
    move-result v9
    if-nez v9, :L4
    invoke-interface { v4, v8 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v8
    invoke-virtual { v0, v8 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L4
  .line 533
    add-int/lit8 v7, v7, 1
    goto :L3
  :L5
  .line 539
    if-eqz v4, :L9
  :L6
    invoke-interface { v4 }, Landroid/database/Cursor;->close()V
  :L7
    goto :L9
  :L8
  .line 540
    move-exception v3
  .line 542
    goto :L10
  :L9
  .line 541
    nop
  :L10
  .line 543
    if-ge v7, v6, :L11
    return-object v0
  :L11
  .line 544
    goto :L0
  :L12
  .line 535
    move-exception v0
    goto :L14
  :L13
    move-exception v0
    move-object v4, v3
  :L14
  .line 536
    nop
  .line 539
    if-eqz v4, :L18
  :L15
    invoke-interface { v4 }, Landroid/database/Cursor;->close()V
  :L16
    goto :L18
  :L17
  .line 540
    move-exception v0
    goto :L19
  :L18
  .line 541
    nop
  :L19
  .line 536
    return-object v3
.end method

.method public static pinyin(Lcom/innioasis/y1/utils/HanziToPinyin;Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L1 .. :L2 } :L7
  .catchall { :L4 .. :L6 } :L5
  .catchall { :L8 .. :L9 } :L7
  .registers 4
  .line 198
    sget-object v0, Lcom/innioasis/ipp/Scan;->py:Ljava/util/HashMap;
  .line 199
    if-eqz v0, :L10
    if-nez p1, :L0
    goto :L10
  :L0
  .line 201
    monitor-enter v0
  :L1
  .line 202
    invoke-virtual { v0, p1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/lang/String;
  .line 203
    monitor-exit v0
  :L2
  .line 204
    if-eqz v1, :L3
    return-object v1
  :L3
  .line 205
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/utils/HanziToPinyin;->getString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 206
    monitor-enter v0
  :L4
  .line 207
    invoke-virtual { v0, p1, p0 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 208
    monitor-exit v0
  .line 209
    return-object p0
  :L5
  .line 208
    move-exception p0
    monitor-exit v0
  :L6
    throw p0
  :L7
  .line 203
    move-exception p0
  :L8
    monitor-exit v0
  :L9
    throw p0
  :L10
  .line 199
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/utils/HanziToPinyin;->getString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static pool()I
  .registers 2
  .line 706
    invoke-static { }, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/Runtime;->availableProcessors()I
    move-result v0
  .line 707
    add-int/lit8 v0, v0, 1
  .line 708
    const/4 v1, 3
    if-le v0, v1, :L0
    const/4 v0, 3
  :L0
  .line 709
    return v0
.end method

.method private static queue([Ljava/io/File;)V
  .catchall { :L1 .. :L2 } :L5
  .catchall { :L9 .. :L13 } :L12
  .registers 7
  .line 594
    nop
  .line 595
    const/4 v0, 0
    const/4 v1, 0
    const/4 v2, 0
  :L0
    array-length v3, p0
    if-ge v2, v3, :L7
  .line 596
    aget-object v3, p0, v2
  .line 598
    if-eqz v3, :L6
  :L1
    invoke-static { v3 }, Lcom/innioasis/ipp/Scan;->songFile(Ljava/io/File;)Z
    move-result v4
    if-eqz v4, :L6
    invoke-virtual { v3 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v4
    invoke-static { v4 }, Lcom/innioasis/ipp/Scan;->inDb(Ljava/lang/String;)Z
    move-result v4
  :L2
    if-eqz v4, :L3
    goto :L6
  :L3
  .line 601
    nop
  .line 602
    if-nez v0, :L4
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  :L4
  .line 603
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L6
  :L5
  .line 599
    move-exception v3
  .line 600
    nop
  :L6
  .line 595
    add-int/lit8 v2, v2, 1
    goto :L0
  :L7
  .line 605
    if-nez v0, :L8
    return-void
  :L8
  .line 606
    sget-object p0, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    monitor-enter p0
  .line 607
    nop
  .line 608
    const/4 v2, 0
  :L9
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge v1, v3, :L10
  .line 609
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/io/File;
  .line 610
    sget-object v3, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
    invoke-virtual { v2 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v4
    sget-object v5, Lcom/innioasis/ipp/Scan;->upcoming:Ljava/util/ArrayList;
    invoke-virtual { v5 }, Ljava/util/ArrayList;->size()I
    move-result v5
    invoke-static { v5 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v5
    invoke-virtual { v3, v4, v5 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 611
    sget-object v3, Lcom/innioasis/ipp/Scan;->upcoming:Ljava/util/ArrayList;
    invoke-virtual { v3, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 612
    nop
  .line 608
    add-int/lit8 v1, v1, 1
    const/4 v2, 1
    goto :L9
  :L10
  .line 614
    if-eqz v2, :L11
    sget-object v0, Lcom/innioasis/ipp/Scan;->repo:Lcom/innioasis/y1/database/Y1Repository;
    if-eqz v0, :L11
  .line 615
    invoke-static { }, Lcom/innioasis/ipp/Scan;->start()V
  .line 616
    sget-object v0, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    invoke-virtual { v0 }, Ljava/lang/Object;->notifyAll()V
  :L11
  .line 618
    monitor-exit p0
  .line 619
    return-void
  :L12
  .line 618
    move-exception v0
    monitor-exit p0
  :L13
    goto :L15
  :L14
    throw v0
  :L15
    goto :L14
.end method

.method public static rows(Lcom/innioasis/y1/database/SongDao;)Ljava/util/List;
  .catchall { :L0 .. :L5 } :L9
  .catchall { :L10 .. :L11 } :L9
  .registers 6
  .line 387
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sput-wide v0, Lcom/innioasis/ipp/Scan;->labTail:J
  .line 388
    invoke-static { }, Landroid/os/SystemClock;->currentThreadTimeMillis()J
    move-result-wide v0
    sput-wide v0, Lcom/innioasis/ipp/Scan;->labCpuTail:J
  .line 389
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 390
    const-class v1, Lcom/innioasis/ipp/Scan;
    monitor-enter v1
  :L0
  .line 391
    sget-object v2, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
    if-nez v2, :L1
    invoke-interface { p0 }, Lcom/innioasis/y1/database/SongDao;->getSongsSync()Ljava/util/List;
    move-result-object p0
    monitor-exit v1
    return-object p0
  :L1
  .line 392
    sget-object v2, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
    invoke-virtual { v2 }, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;
    move-result-object v2
  :L2
  .line 393
    invoke-interface { v2 }, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :L4
  .line 394
    invoke-interface { v2 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
  .line 395
    sget-object v4, Lcom/innioasis/ipp/Scan;->met:Ljava/util/HashSet;
    invoke-virtual { v4, v3 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v4
    if-nez v4, :L3
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 396
    goto :L2
  :L4
  .line 397
    monitor-exit v1
  :L5
  .line 398
    new-instance v1, Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v2
    invoke-direct { v1, v2 }, Ljava/util/ArrayList;-><init>(I)V
  .line 399
    const/4 v2, 0
  :L6
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge v2, v3, :L8
  .line 400
    invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
    invoke-interface { p0, v3 }, Lcom/innioasis/y1/database/SongDao;->getSongByPathSyncDB(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object v3
  .line 401
    if-eqz v3, :L7
    invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L7
  .line 399
    add-int/lit8 v2, v2, 1
    goto :L6
  :L8
  .line 403
    return-object v1
  :L9
  .line 397
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
  .line 356
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
  .line 623
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 624
    nop
  :L0
  .line 626
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Scan;->take(Lcom/innioasis/y1/database/Y1Repository;Ljava/io/File;)Lcom/innioasis/y1/database/Song;
    move-result-object v2
  :L1
  .line 629
    goto :L3
  :L2
  .line 627
    move-exception v2
  .line 628
    const/4 v2, 0
  :L3
  .line 630
    if-nez v2, :L4
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/database/Y1Repository;->fileToSong(Ljava/io/File;)Lcom/innioasis/y1/database/Song;
    move-result-object v2
  :L4
  .line 631
    sget-wide p0, Lcom/innioasis/ipp/Scan;->labSong:J
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
    sub-long/2addr v3, v0
    add-long/2addr p0, v3
    sput-wide p0, Lcom/innioasis/ipp/Scan;->labSong:J
  .line 632
    sget p0, Lcom/innioasis/ipp/Scan;->labSongs:I
    add-int/lit8 p0, p0, 1
    sput p0, Lcom/innioasis/ipp/Scan;->labSongs:I
  .line 633
    invoke-static { v2 }, Lcom/innioasis/ipp/Scan;->built(Lcom/innioasis/y1/database/Song;)V
  .line 634
    return-object v2
.end method

.method private static songFile(Ljava/io/File;)Z
  .registers 3
  .line 582
    invoke-virtual { p0 }, Ljava/io/File;->isHidden()Z
    move-result v0
    const/4 v1, 0
    if-eqz v0, :L0
    return v1
  :L0
  .line 583
    invoke-virtual { p0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v0
  .line 584
    if-nez v0, :L1
    return v1
  :L1
  .line 585
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->extOf(Ljava/io/File;)Ljava/lang/String;
    move-result-object p0
  .line 586
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
  .line 698
    invoke-static { }, Lcom/innioasis/ipp/Scan;->pool()I
    move-result v0
  :L0
  .line 699
    sget v1, Lcom/innioasis/ipp/Scan;->live:I
    if-ge v1, v0, :L1
  .line 700
    add-int/lit8 v1, v1, 1
    sput v1, Lcom/innioasis/ipp/Scan;->live:I
  .line 701
    new-instance v1, Ljava/lang/Thread;
    new-instance v2, Lcom/innioasis/ipp/Scan$Builder;
    invoke-direct { v2 }, Lcom/innioasis/ipp/Scan$Builder;-><init>()V
    invoke-direct { v1, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v1 }, Ljava/lang/Thread;->start()V
    goto :L0
  :L1
  .line 703
    return-void
.end method

.method public static stays(Lcom/innioasis/y1/database/Song;)Z
  .catchall { :L2 .. :L3 } :L11
  .catchall { :L7 .. :L9 } :L8
  .catchall { :L12 .. :L13 } :L11
  .registers 4
  .line 365
    const/4 v0, 1
    if-nez p0, :L0
    return v0
  :L0
  .line 366
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
  .line 367
    if-nez p0, :L1
    return v0
  :L1
  .line 369
    const-class v1, Lcom/innioasis/ipp/Scan;
    monitor-enter v1
  :L2
  .line 370
    sget-object v2, Lcom/innioasis/ipp/Scan;->met:Ljava/util/HashSet;
    invoke-virtual { v2, p0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v2
  .line 371
    monitor-exit v1
  :L3
  .line 372
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
  .line 373
    if-nez p0, :L10
  .line 374
    const-class v1, Lcom/innioasis/ipp/Scan;
    monitor-enter v1
  :L7
  .line 375
    sput-boolean v0, Lcom/innioasis/ipp/Scan;->wrote:Z
  .line 376
    monitor-exit v1
    goto :L10
  :L8
    move-exception p0
    monitor-exit v1
  :L9
    throw p0
  :L10
  .line 378
    return p0
  :L11
  .line 371
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
  .line 481
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
  .line 482
    sget-object v3, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
  .line 483
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
  .line 484
    sput-wide v1, Lcom/innioasis/ipp/Scan;->asked:J
  :L3
  .line 485
    monitor-exit v0
    return-object v3
  :L4
  .line 480
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method private static take(Lcom/innioasis/y1/database/Y1Repository;Ljava/io/File;)Lcom/innioasis/y1/database/Song;
  .catchall { :L1 .. :L8 } :L14
  .catchall { :L9 .. :L10 } :L11
  .catchall { :L12 .. :L15 } :L14
  .registers 10
  .line 639
    invoke-virtual { p1 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object p1
  .line 640
    const/4 v0, 0
    if-nez p1, :L0
    return-object v0
  :L0
  .line 642
    sget-object v1, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    monitor-enter v1
  :L1
  .line 643
    sget-object v2, Lcom/innioasis/ipp/Scan;->repo:Lcom/innioasis/y1/database/Y1Repository;
    if-nez v2, :L2
  .line 644
    sput-object p0, Lcom/innioasis/ipp/Scan;->repo:Lcom/innioasis/y1/database/Y1Repository;
  .line 645
    invoke-static { }, Lcom/innioasis/ipp/Scan;->start()V
  .line 646
    invoke-virtual { v1 }, Ljava/lang/Object;->notifyAll()V
  :L2
  .line 648
    sget-object p0, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
    invoke-virtual { p0, p1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 649
    if-nez p0, :L3
    const/4 p0, -1
    goto :L4
  :L3
    check-cast p0, Ljava/lang/Integer;
    invoke-virtual { p0 }, Ljava/lang/Integer;->intValue()I
    move-result p0
  :L4
  .line 650
    sget v2, Lcom/innioasis/ipp/Scan;->cursor:I
    if-ge p0, v2, :L5
  .line 651
    monitor-exit v1
    return-object v0
  :L5
  .line 653
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->pass(I)V
  .line 654
    sget v2, Lcom/innioasis/ipp/Scan;->next:I
    if-lt p0, v2, :L6
  .line 655
    add-int/lit8 p0, p0, 1
    sput p0, Lcom/innioasis/ipp/Scan;->next:I
  .line 656
    sget-object p0, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
    invoke-virtual { p0, p1 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 657
    invoke-static { }, Lcom/innioasis/ipp/Scan;->start()V
  .line 658
    invoke-virtual { v1 }, Ljava/lang/Object;->notifyAll()V
  .line 659
    monitor-exit v1
    return-object v0
  :L6
  .line 661
    sget-object p0, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
    invoke-virtual { p0, p1 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/database/Song;
  .line 662
    if-nez p0, :L13
    sget-object v0, Lcom/innioasis/ipp/Scan;->building:Ljava/util/HashSet;
    invoke-virtual { v0, p1 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L13
  .line 664
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    const-wide/16 v4, 20000
    add-long/2addr v2, v4
  :L7
  .line 665
    sget-object p0, Lcom/innioasis/ipp/Scan;->building:Ljava/util/HashSet;
    invoke-virtual { p0, p1 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L12
  .line 666
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
  :L8
    sub-long v4, v2, v4
  .line 667
    const-wide/16 v6, 0
    cmp-long p0, v4, v6
    if-gtz p0, :L9
    goto :L12
  :L9
  .line 669
    sget-object p0, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    invoke-virtual { p0, v4, v5 }, Ljava/lang/Object;->wait(J)V
  :L10
  .line 672
    nop
  .line 673
    goto :L7
  :L11
  .line 670
    move-exception p0
  .line 671
    nop
  :L12
  .line 674
    sget-object p0, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
    invoke-virtual { p0, p1 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/database/Song;
  :L13
  .line 676
    sget-object v0, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
    invoke-virtual { v0, p1 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 677
    sget-object p1, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    invoke-virtual { p1 }, Ljava/lang/Object;->notifyAll()V
  .line 678
    monitor-exit v1
    return-object p0
  :L14
  .line 679
    move-exception p0
    monitor-exit v1
  :L15
    goto :L17
  :L16
    throw p0
  :L17
    goto :L16
.end method

.method public static themes(Ljava/lang/String;)Z
  .registers 7
  .line 349
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
  .line 408
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L0
  .line 409
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
  .line 410
    monitor-exit v0
  :L2
  .line 411
    if-nez p0, :L3
    const/4 p0, 0
    goto :L4
  :L3
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result p0
  :L4
    return p0
  :L5
  .line 410
    move-exception p0
  :L6
    monitor-exit v0
  :L7
    throw p0
.end method

.method private static under(Ljava/lang/String;Ljava/lang/String;)Z
  .registers 10
  .line 441
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 442
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v7
  .line 443
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
  .line 444
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
  .line 344
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
  .registers 5
  .line 178
    const/4 v0, 0
  :L0
    const/4 v1, 3
    if-ge v0, v1, :L4
  :L1
  .line 180
    invoke-interface { p0, p1 }, Lcom/innioasis/y1/database/SongDao;->insert([Lcom/innioasis/y1/database/Song;)V
  .line 181
    invoke-static { }, Lcom/innioasis/ipp/Ipp;->libraryChanged()V
  :L2
  .line 182
    return-void
  :L3
  .line 183
    move-exception v1
  .line 184
    const-wide/16 v1, 1000
    invoke-static { v1, v2 }, Landroid/os/SystemClock;->sleep(J)V
  .line 178
    add-int/lit8 v0, v0, 1
    goto :L0
  :L4
  .line 187
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
  .line 188
    return-void
.end method
