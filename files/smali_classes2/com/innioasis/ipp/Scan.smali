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

.field private final static DROP:I = 7

.field private final static DROP_BATCH:I = 500

.field private final static EXISTS:I = 1

.field private final static FLUSH_MS:J = 60000L

.field private final static FOLDER:I = 30

.field private final static GAP_MS:J = 5000L

.field private final static IDLE_MS:J = 5000L

.field private final static KNOWN:I = 4

.field private final static LOAD:I = 6

.field private final static LOCK:Ljava/lang/Object;

.field private final static LOOK:I = 6

.field private final static MARKER:Lcom/innioasis/y1/database/Song;

.field private final static MUSIC:[Ljava/lang/String;

.field private final static NEW:I = 22

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

.field private static dirs:I

.field private static dirsExpected:I

.field private static dropped:I

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

.field private static queued:I

.field private static ready:Ljava/util/HashMap;

.field private static repo:Lcom/innioasis/y1/database/Y1Repository;

.field private static seen:I

.field private static shown:I

.field private static tailDone:J

.field private static tailFrom:I

.field private static tailLoad:J

.field private static tailThread:Ljava/lang/Thread;

.field private static tailWork:J

.field private static units:J

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
  .line 232
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Scan;->shown:I
  .line 318
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
  .line 320
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
  .line 322
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
  .line 324
    new-instance v1, Ljava/util/HashSet;
    invoke-static { v0 }, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Formats;->more(Ljava/util/List;)Ljava/util/List;
    move-result-object v0
    invoke-direct { v1, v0 }, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V
    sput-object v1, Lcom/innioasis/ipp/Scan;->musicExt:Ljava/util/HashSet;
  .line 325
    new-instance v0, Ljava/util/HashSet;
    invoke-static { v15 }, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Formats;->more(Ljava/util/List;)Ljava/util/List;
    move-result-object v1
    invoke-direct { v0, v1 }, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V
    sput-object v0, Lcom/innioasis/ipp/Scan;->bookExt:Ljava/util/HashSet;
  .line 326
    new-instance v0, Ljava/util/HashSet;
    invoke-static { v2 }, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;
    move-result-object v1
    invoke-direct { v0, v1 }, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V
    sput-object v0, Lcom/innioasis/ipp/Scan;->videoExt:Ljava/util/HashSet;
  .line 387
    new-instance v0, Ljava/util/LinkedList;
    invoke-direct { v0 }, Ljava/util/LinkedList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->AHEAD:Ljava/util/LinkedList;
  .line 583
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->met:Ljava/util/HashSet;
  .line 607
    new-instance v0, Lcom/innioasis/y1/database/Song;
    invoke-direct { v0 }, Lcom/innioasis/y1/database/Song;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->MARKER:Lcom/innioasis/y1/database/Song;
  .line 730
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
  .line 736
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->upcoming:Ljava/util/ArrayList;
  .line 737
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
  .line 742
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
  .line 743
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
  .line 419
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
  .line 576
    const/4 v1, 1
  :L0
    sput-boolean v1, Lcom/innioasis/ipp/Scan;->wrote:Z
  .line 577
    sget-object v2, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
  .line 578
    if-eqz p0, :L3
    if-nez v2, :L1
    goto :L3
  :L1
  .line 579
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v2, p0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result p0
    if-nez p0, :L2
    sget p0, Lcom/innioasis/ipp/Scan;->added:I
    add-int/2addr p0, v1
    sput p0, Lcom/innioasis/ipp/Scan;->added:I
  :L2
  .line 580
    monitor-exit v0
    return-void
  :L3
  .line 578
    monitor-exit v0
    return-void
  :L4
  .line 575
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

.method private static declared-synchronized count(Z)V
  .catchall { :L0 .. :L3 } :L8
  .catchall { :L4 .. :L5 } :L8
  .catchall { :L6 .. :L7 } :L8
  .registers 7
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L0
  .line 238
    sget v1, Lcom/innioasis/ipp/Scan;->seen:I
    add-int/lit8 v1, v1, 1
    sput v1, Lcom/innioasis/ipp/Scan;->seen:I
  .line 239
    sget-wide v2, Lcom/innioasis/ipp/Scan;->units:J
    if-eqz p0, :L1
    const-wide/16 v4, 4
    goto :L2
  :L1
    const-wide/16 v4, 22
  :L2
    add-long/2addr v2, v4
    sput-wide v2, Lcom/innioasis/ipp/Scan;->units:J
  .line 240
    sget p0, Lcom/innioasis/ipp/Scan;->expected:I
    if-nez p0, :L6
  .line 241
    div-int/lit8 p0, v1, 16
  .line 242
    sget v2, Lcom/innioasis/ipp/Scan;->shown:I
  :L3
    if-ne p0, v2, :L4
    monitor-exit v0
    return-void
  :L4
  .line 243
    sput p0, Lcom/innioasis/ipp/Scan;->shown:I
  .line 244
    invoke-static { v1 }, Lcom/innioasis/ipp/Loading;->scanned(I)V
  :L5
  .line 245
    monitor-exit v0
    return-void
  :L6
  .line 247
    invoke-static { }, Lcom/innioasis/ipp/Scan;->walkShown()V
  :L7
  .line 248
    monitor-exit v0
    return-void
  :L8
  .line 237
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method public static dir(Ljava/io/File;)Z
  .registers 1
  .line 363
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

.method private static dirsOf(Ljava/util/HashSet;)I
  .registers 6
  .line 266
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
  .line 267
    invoke-virtual { p0 }, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;
    move-result-object p0
  :L0
  .line 268
    invoke-interface { p0 }, Ljava/util/Iterator;->hasNext()Z
    move-result v1
    if-eqz v1, :L3
  .line 269
    invoke-interface { p0 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/lang/String;
  .line 270
    const/16 v2, 47
    invoke-virtual { v1, v2 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v3
  :L1
  .line 271
    if-lez v3, :L2
    const/4 v4, 0
    invoke-virtual { v1, v4, v3 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v0, v4 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :L2
    add-int/lit8 v3, v3, -1
    invoke-virtual { v1, v2, v3 }, Ljava/lang/String;->lastIndexOf(II)I
    move-result v3
    goto :L1
  :L2
  .line 272
    goto :L0
  :L3
  .line 273
    invoke-virtual { v0 }, Ljava/util/HashSet;->size()I
    move-result p0
    return p0
.end method

.method static declared-synchronized done()V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L0
  .line 629
    invoke-static { }, Lcom/innioasis/ipp/Scan;->labEnd()V
  .line 630
    invoke-static { }, Lcom/innioasis/ipp/Tone;->recheck()V
  .line 631
    const/4 v1, 0
    sput-object v1, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
  .line 632
    const/4 v2, 0
    sput v2, Lcom/innioasis/ipp/Scan;->added:I
  .line 633
    sput v2, Lcom/innioasis/ipp/Scan;->dropped:I
  .line 634
    new-instance v3, Ljava/util/HashSet;
    invoke-direct { v3 }, Ljava/util/HashSet;-><init>()V
    sput-object v3, Lcom/innioasis/ipp/Scan;->met:Ljava/util/HashSet;
  .line 635
    sput-boolean v2, Lcom/innioasis/ipp/Scan;->marked:Z
  .line 636
    sput-boolean v2, Lcom/innioasis/ipp/Scan;->wrote:Z
  .line 637
    sput-object v1, Lcom/innioasis/ipp/Scan;->py:Ljava/util/HashMap;
  .line 638
    invoke-static { }, Lcom/innioasis/ipp/Scan;->forgetQueue()V
  :L1
  .line 639
    monitor-exit v0
    return-void
  :L2
  .line 628
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method private static drop(Ljava/util/List;)V
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/lang/Exception;
    }
  .end annotation
  .catchall { :L1 .. :L5 } :L24
  .catchall { :L11 .. :L14 } :L20
  .catchall { :L15 .. :L16 } :L17
  .catchall { :L18 .. :L19 } :L17
  .registers 12
  .line 507
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0, p0 }, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V
  .line 508
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
  .line 509
    const-wide/16 v1, -1
  :L0
  .line 511
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->db()Landroidx/room/RoomDatabase;
    move-result-object v3
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v5, "select rowid, path from song where rowid > "
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v4
    const-string v5, " order by rowid limit "
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    const/16 v5, 5000
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v4
    const/4 v6, 0
    invoke-virtual { v3, v4, v6 }, Landroidx/room/RoomDatabase;->query(Ljava/lang/String;[Ljava/lang/Object;)Landroid/database/Cursor;
    move-result-object v3
  .line 513
    const/4 v4, 0
    const/4 v6, 0
  :L1
  .line 515
    invoke-interface { v3 }, Landroid/database/Cursor;->moveToNext()Z
    move-result v7
    const/4 v8, 1
    if-eqz v7, :L6
  .line 516
    invoke-interface { v3, v4 }, Landroid/database/Cursor;->getLong(I)J
    move-result-wide v1
  .line 517
    add-int/lit8 v6, v6, 1
  .line 518
    invoke-interface { v3, v8 }, Landroid/database/Cursor;->isNull(I)Z
    move-result v7
    if-eqz v7, :L2
    goto :L1
  :L2
  .line 519
    invoke-interface { v3, v8 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v7
  .line 520
    invoke-virtual { v0, v7 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v8
    if-nez v8, :L3
    goto :L1
  :L3
  .line 521
    new-instance v8, Lcom/innioasis/y1/database/Song;
    invoke-direct { v8 }, Lcom/innioasis/y1/database/Song;-><init>()V
  .line 522
    invoke-virtual { v8, v7 }, Lcom/innioasis/y1/database/Song;->setPath(Ljava/lang/String;)V
  .line 523
    invoke-static { v8 }, Lcom/innioasis/ipp/Scan;->stays(Lcom/innioasis/y1/database/Song;)Z
    move-result v7
    if-nez v7, :L4
    invoke-static { v1, v2 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v7
    invoke-virtual { p0, v7 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L4
  .line 524
    const-wide/16 v7, 7
    invoke-static { v7, v8 }, Lcom/innioasis/ipp/Scan;->tailStep(J)V
  :L5
  .line 525
    goto :L1
  :L6
  .line 527
    invoke-interface { v3 }, Landroid/database/Cursor;->close()V
  .line 528
    nop
  .line 529
    if-ge v6, v5, :L23
  .line 531
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->db()Landroidx/room/RoomDatabase;
    move-result-object v0
  .line 532
    nop
  .line 533
    const/4 v1, 0
  :L7
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result v2
    if-ge v4, v2, :L21
  :L8
  .line 534
    sget-object v2, Lcom/innioasis/music/objects/Global;->INSTANCE:Lcom/innioasis/music/objects/Global;
    invoke-virtual { v2 }, Lcom/innioasis/music/objects/Global;->getScanLock()Z
    move-result v2
    if-eqz v2, :L9
    const-wide/16 v2, 100
    invoke-static { v2, v3 }, Ljava/lang/Thread;->sleep(J)V
    goto :L8
  :L9
  .line 535
    sget-object v2, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v2 }, Lcom/innioasis/music/util/Other;->sdCardIsReady()Z
    move-result v2
    if-nez v2, :L10
    goto :L21
  :L10
  .line 536
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result v2
    add-int/lit16 v3, v4, 500
    invoke-static { v2, v3 }, Ljava/lang/Math;->min(II)I
    move-result v2
  .line 537
    invoke-virtual { v0 }, Landroidx/room/RoomDatabase;->beginTransaction()V
  :L11
  .line 539
    const-string v5, "delete from song where rowid = ?"
    invoke-virtual { v0, v5 }, Landroidx/room/RoomDatabase;->compileStatement(Ljava/lang/String;)Landroidx/sqlite/db/SupportSQLiteStatement;
    move-result-object v5
  .line 540
    move v6, v4
  :L12
    if-ge v6, v2, :L13
  .line 541
    invoke-virtual { p0, v6 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Ljava/lang/Long;
    invoke-virtual { v7 }, Ljava/lang/Long;->longValue()J
    move-result-wide v9
    invoke-interface { v5, v8, v9, v10 }, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V
  .line 542
    invoke-interface { v5 }, Landroidx/sqlite/db/SupportSQLiteStatement;->executeUpdateDelete()I
  .line 543
    invoke-interface { v5 }, Landroidx/sqlite/db/SupportSQLiteStatement;->clearBindings()V
  .line 540
    add-int/lit8 v6, v6, 1
    goto :L12
  :L13
  .line 545
    invoke-virtual { v0 }, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
  :L14
  .line 547
    invoke-virtual { v0 }, Landroidx/room/RoomDatabase;->endTransaction()V
  .line 548
    nop
  .line 549
    sub-int/2addr v2, v4
    add-int/2addr v1, v2
  .line 550
    const-class v4, Lcom/innioasis/ipp/Scan;
    monitor-enter v4
  :L15
  .line 551
    sget v5, Lcom/innioasis/ipp/Scan;->dropped:I
    add-int/2addr v5, v2
    sput v5, Lcom/innioasis/ipp/Scan;->dropped:I
  .line 552
    monitor-exit v4
  :L16
  .line 553
    sget-object v4, Lcom/innioasis/music/objects/Global;->INSTANCE:Lcom/innioasis/music/objects/Global;
  .line 554
    invoke-virtual { v4 }, Lcom/innioasis/music/objects/Global;->getScanDeletedCount()I
    move-result v5
    add-int/2addr v5, v2
    invoke-virtual { v4, v5 }, Lcom/innioasis/music/objects/Global;->setScanDeletedCount(I)V
  .line 533
    move v4, v3
    goto :L7
  :L17
  .line 552
    move-exception p0
  :L18
    monitor-exit v4
  :L19
    throw p0
  :L20
  .line 547
    move-exception p0
    invoke-virtual { v0 }, Landroidx/room/RoomDatabase;->endTransaction()V
  .line 548
    throw p0
  :L21
  .line 556
    new-instance p0, Ljava/lang/StringBuilder;
    invoke-direct { p0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v0, "library scan: "
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v0, " row(s) of missing files dropped in bulk"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 557
    if-lez v1, :L22
    invoke-static { }, Lcom/innioasis/ipp/Ipp;->libraryChanged()V
  :L22
  .line 558
    return-void
  :L23
  .line 530
    goto/16 :L0
  :L24
  .line 527
    move-exception p0
    invoke-interface { v3 }, Landroid/database/Cursor;->close()V
  .line 528
    goto :L26
  :L25
    throw p0
  :L26
    goto :L25
.end method

.method public static exists(Ljava/io/File;)Z
  .registers 2
  .line 359
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
  .line 353
    invoke-virtual { p0 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object p0
  .line 354
    const/16 v0, 46
    invoke-virtual { p0, v0 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v0
  .line 355
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
  .line 715
    if-nez p1, :L0
    return-void
  :L0
  .line 716
    const/4 v0, 0
  :L1
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L4
  .line 717
    invoke-interface { p1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
  .line 718
    instance-of v2, v1, Lcom/innioasis/y1/database/Song;
    if-nez v2, :L2
    goto :L3
  :L2
  .line 719
    check-cast v1, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
  .line 720
    if-eqz v1, :L3
    invoke-virtual { p0, v1 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L3
  .line 716
    add-int/lit8 v0, v0, 1
    goto :L1
  :L4
  .line 722
    return-void
.end method

.method private static forgetQueue()V
  .catchall { :L0 .. :L2 } :L1
  .registers 2
  .line 882
    sget-object v0, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 883
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
    sput-object v1, Lcom/innioasis/ipp/Scan;->upcoming:Ljava/util/ArrayList;
  .line 884
    new-instance v1, Ljava/util/HashMap;
    invoke-direct { v1 }, Ljava/util/HashMap;-><init>()V
    sput-object v1, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
  .line 885
    new-instance v1, Ljava/util/HashMap;
    invoke-direct { v1 }, Ljava/util/HashMap;-><init>()V
    sput-object v1, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
  .line 886
    const/4 v1, 0
    sput v1, Lcom/innioasis/ipp/Scan;->cursor:I
  .line 887
    sput v1, Lcom/innioasis/ipp/Scan;->next:I
  .line 888
    const/4 v1, 0
    sput-object v1, Lcom/innioasis/ipp/Scan;->repo:Lcom/innioasis/y1/database/Y1Repository;
  .line 889
    invoke-virtual { v0 }, Ljava/lang/Object;->notifyAll()V
  .line 890
    monitor-exit v0
  .line 891
    return-void
  :L1
  .line 890
    move-exception v1
    monitor-exit v0
  :L2
    throw v1
.end method

.method static inDb(Ljava/lang/String;)Z
  .registers 3
  .line 618
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 619
    invoke-static { }, Lcom/innioasis/ipp/Scan;->table()Ljava/util/HashSet;
    move-result-object v1
  .line 620
    if-nez v1, :L1
    return v0
  :L1
  .line 621
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
  .line 337
    sget-object v0, Lcom/innioasis/ipp/Scan;->node:Ljava/io/File;
    if-eq p0, v0, :L4
  .line 338
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 339
    nop
  .line 340
    invoke-virtual { p0 }, Ljava/io/File;->isFile()Z
    move-result v2
    const/4 v3, 1
    if-eqz v2, :L0
    const/4 v2, 1
    goto :L3
  :L0
  .line 341
    invoke-virtual { p0 }, Ljava/io/File;->isDirectory()Z
    move-result v2
    if-eqz v2, :L1
    const/4 v2, 3
    goto :L3
  :L1
  .line 342
    invoke-virtual { p0 }, Ljava/io/File;->exists()Z
    move-result v2
    if-eqz v2, :L2
    const/4 v2, 1
    goto :L3
  :L2
    const/4 v2, 0
  :L3
  .line 343
    sget-wide v4, Lcom/innioasis/ipp/Scan;->labLook:J
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v6
    sub-long/2addr v6, v0
    add-long/2addr v4, v6
    sput-wide v4, Lcom/innioasis/ipp/Scan;->labLook:J
  .line 344
    sget v0, Lcom/innioasis/ipp/Scan;->labNodes:I
    add-int/2addr v0, v3
    sput v0, Lcom/innioasis/ipp/Scan;->labNodes:I
  .line 345
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->extOf(Ljava/io/File;)Ljava/lang/String;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Scan;->ext:Ljava/lang/String;
  .line 346
    sput v2, Lcom/innioasis/ipp/Scan;->kind:I
  .line 347
    sput-object p0, Lcom/innioasis/ipp/Scan;->node:Ljava/io/File;
  :L4
  .line 349
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
    invoke-static { v2 }, Lcom/innioasis/ipp/Scan;->count(Z)V
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
  .line 372
    invoke-static { }, Lcom/innioasis/ipp/Scan;->listedDir()V
  .line 373
    if-eqz p0, :L7
    array-length v0, p0
    if-nez v0, :L0
    goto :L7
  :L0
  .line 374
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 375
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->queue([Ljava/io/File;)V
  .line 376
    sget-object v2, Lcom/innioasis/ipp/Scan;->AHEAD:Ljava/util/LinkedList;
    monitor-enter v2
  :L1
  .line 377
    invoke-virtual { v2, p0 }, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V
  .line 378
    sget-boolean p0, Lcom/innioasis/ipp/Scan;->looking:Z
    if-nez p0, :L2
  .line 379
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/Scan;->looking:Z
  .line 380
    new-instance p0, Ljava/lang/Thread;
    new-instance v3, Lcom/innioasis/ipp/Scan$Looker;
    invoke-direct { v3 }, Lcom/innioasis/ipp/Scan$Looker;-><init>()V
    const-string v4, "ipp-scan-stat"
    invoke-direct { p0, v3, v4 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    invoke-virtual { p0 }, Ljava/lang/Thread;->start()V
  :L2
  .line 382
    invoke-virtual { v2 }, Ljava/lang/Object;->notifyAll()V
  .line 383
    monitor-exit v2
  :L3
  .line 384
    sget-wide v2, Lcom/innioasis/ipp/Scan;->labListed:J
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
    sub-long/2addr v4, v0
    add-long/2addr v2, v4
    sput-wide v2, Lcom/innioasis/ipp/Scan;->labListed:J
  .line 385
    return-void
  :L4
  .line 383
    move-exception p0
  :L5
    monitor-exit v2
  :L6
    throw p0
  :L7
  .line 373
    return-void
.end method

.method private static declared-synchronized listedDir()V
  .catchall { :L0 .. :L1 } :L2
  .registers 5
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L0
  .line 259
    sget v1, Lcom/innioasis/ipp/Scan;->dirs:I
    add-int/lit8 v1, v1, 1
    sput v1, Lcom/innioasis/ipp/Scan;->dirs:I
  .line 260
    sget-wide v1, Lcom/innioasis/ipp/Scan;->units:J
    const-wide/16 v3, 30
    add-long/2addr v1, v3
    sput-wide v1, Lcom/innioasis/ipp/Scan;->units:J
  .line 261
    invoke-static { }, Lcom/innioasis/ipp/Scan;->walkShown()V
  :L1
  .line 262
    monitor-exit v0
    return-void
  :L2
  .line 258
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method private static load()Ljava/util/HashSet;
  .catchall { :L0 .. :L3 } :L11
  .catchall { :L4 .. :L5 } :L8
  .catchall { :L5 .. :L7 } :L11
  .catchall { :L9 .. :L10 } :L8
  .catchall { :L10 .. :L11 } :L11
  .registers 8
  :L0
  .line 652
    invoke-static { }, Lcom/innioasis/ipp/Artists;->ensureExceptions()V
  .line 653
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 654
    if-nez v0, :L1
    sget-object v0, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
    return-object v0
  :L1
  .line 655
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
  .line 656
    invoke-static { }, Lcom/innioasis/ipp/Scan;->pathsOnly()Ljava/util/HashSet;
    move-result-object v3
  .line 657
    sget-wide v4, Lcom/innioasis/ipp/Scan;->labLoad:J
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v6
    sub-long/2addr v6, v1
    add-long/2addr v4, v6
    sput-wide v4, Lcom/innioasis/ipp/Scan;->labLoad:J
  .line 658
    if-nez v3, :L2
  .line 659
    new-instance v3, Ljava/util/HashSet;
    invoke-direct { v3 }, Ljava/util/HashSet;-><init>()V
  .line 660
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository;->ippSongDao()Lcom/innioasis/y1/database/SongDao;
    move-result-object v0
    invoke-interface { v0 }, Lcom/innioasis/y1/database/SongDao;->getSongsSync()Ljava/util/List;
    move-result-object v0
    invoke-static { v3, v0 }, Lcom/innioasis/ipp/Scan;->fill(Ljava/util/HashSet;Ljava/util/List;)V
  :L2
  .line 662
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
  .line 663
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L3
  .line 664
    const/4 v1, 0
  :L4
    sput v1, Lcom/innioasis/ipp/Scan;->seen:I
  .line 665
    const-wide/16 v4, 0
    sput-wide v4, Lcom/innioasis/ipp/Scan;->units:J
  .line 666
    invoke-virtual { v3 }, Ljava/util/HashSet;->size()I
    move-result v2
    sput v2, Lcom/innioasis/ipp/Scan;->expected:I
  .line 667
    invoke-static { v3 }, Lcom/innioasis/ipp/Scan;->dirsOf(Ljava/util/HashSet;)I
    move-result v2
    sput v2, Lcom/innioasis/ipp/Scan;->dirsExpected:I
  .line 668
    sput v1, Lcom/innioasis/ipp/Scan;->dirs:I
  .line 669
    sput v1, Lcom/innioasis/ipp/Scan;->queued:I
  .line 670
    const/4 v2, -1
    sput v2, Lcom/innioasis/ipp/Scan;->shown:I
  .line 671
    sput v1, Lcom/innioasis/ipp/Scan;->added:I
  .line 672
    monitor-exit v0
  :L5
  .line 674
    invoke-virtual { v3 }, Ljava/util/HashSet;->isEmpty()Z
    move-result v0
    if-eqz v0, :L6
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Meta;->noteLibraryRead(Landroid/content/Context;)V
  :L6
  .line 675
    sput-object v3, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
  :L7
  .line 676
    return-object v3
  :L8
  .line 672
    move-exception v1
  :L9
    monitor-exit v0
  :L10
    throw v1
  :L11
  .line 677
    move-exception v0
  .line 678
    sget-object v0, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
    return-object v0
.end method

.method static declared-synchronized loaded(I)V
  .catchall { :L0 .. :L2 } :L4
  .registers 10
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L0
  .line 302
    invoke-static { }, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object v1
    sget-object v2, Lcom/innioasis/ipp/Scan;->tailThread:Ljava/lang/Thread;
    if-ne v1, v2, :L3
    sget-wide v1, Lcom/innioasis/ipp/Scan;->tailLoad:J
    const-wide/16 v3, 0
    cmp-long v5, v1, v3
    if-gtz v5, :L1
    goto :L3
  :L1
  .line 303
    sget-wide v3, Lcom/innioasis/ipp/Scan;->tailWork:J
    sub-long/2addr v3, v1
  .line 304
    sget-wide v5, Lcom/innioasis/ipp/Scan;->tailDone:J
    int-to-long v7, p0
    mul-long v1, v1, v7
    const-wide/16 v7, 1000
    div-long/2addr v1, v7
    add-long/2addr v3, v1
    invoke-static { v5, v6, v3, v4 }, Ljava/lang/Math;->max(JJ)J
    move-result-wide v1
    sput-wide v1, Lcom/innioasis/ipp/Scan;->tailDone:J
  .line 305
    sget p0, Lcom/innioasis/ipp/Scan;->tailFrom:I
    rsub-int/lit8 v3, p0, 100
    int-to-long v3, v3
    sget-wide v5, Lcom/innioasis/ipp/Scan;->tailWork:J
    invoke-static { v1, v2, v5, v6 }, Ljava/lang/Math;->min(JJ)J
    move-result-wide v1
    mul-long v3, v3, v1
    sget-wide v1, Lcom/innioasis/ipp/Scan;->tailWork:J
    div-long/2addr v3, v1
    long-to-int v1, v3
    add-int/2addr p0, v1
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->show(I)V
  :L2
  .line 306
    monitor-exit v0
    return-void
  :L3
  .line 302
    monitor-exit v0
    return-void
  :L4
  .line 301
    move-exception p0
    monitor-exit v0
    throw p0
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
  .line 586
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
  .line 585
    move-exception p0
    monitor-exit v0
    throw p0
  :L3
  .line 587
    monitor-exit v0
    return-void
.end method

.method public static music(Ljava/io/File;)Z
  .registers 2
  .line 424
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
  .line 591
    sget-object v0, Lcom/innioasis/ipp/Scan;->card:Ljava/lang/String;
  .line 592
    if-nez v0, :L0
    invoke-static { }, Lcom/innioasis/ipp/Panel;->card()Ljava/io/File;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Scan;->card:Ljava/lang/String;
  :L0
  .line 593
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Scan;->under(Ljava/lang/String;Ljava/lang/String;)Z
    move-result p0
    return p0
.end method

.method private static pass(I)V
  .registers 5
  .line 852
    sget v0, Lcom/innioasis/ipp/Scan;->cursor:I
  :L0
    const/4 v1, 0
    if-ge v0, p0, :L3
  .line 853
    sget-object v2, Lcom/innioasis/ipp/Scan;->upcoming:Ljava/util/ArrayList;
    invoke-virtual { v2, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/io/File;
  .line 854
    if-nez v2, :L1
    goto :L2
  :L1
  .line 855
    invoke-virtual { v2 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v2
  .line 856
    sget-object v3, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
    invoke-virtual { v3, v2 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 857
    sget-object v3, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
    invoke-virtual { v3, v2 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 858
    sget-object v2, Lcom/innioasis/ipp/Scan;->upcoming:Ljava/util/ArrayList;
    invoke-virtual { v2, v0, v1 }, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;
  :L2
  .line 852
    add-int/lit8 v0, v0, 1
    goto :L0
  :L3
  .line 860
    sget-object v0, Lcom/innioasis/ipp/Scan;->upcoming:Ljava/util/ArrayList;
    invoke-virtual { v0, p0, v1 }, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;
  .line 861
    add-int/lit8 p0, p0, 1
    sput p0, Lcom/innioasis/ipp/Scan;->cursor:I
  .line 862
    return-void
.end method

.method private static pathsOnly()Ljava/util/HashSet;
  .catchall { :L1 .. :L2 } :L13
  .catchall { :L3 .. :L4 } :L12
  .catchall { :L6 .. :L7 } :L8
  .catchall { :L15 .. :L16 } :L17
  .registers 10
  .line 687
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
  .line 688
    const-wide/16 v1, -1
  :L0
  .line 690
    nop
  .line 691
    nop
  .line 693
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
  .line 695
    invoke-interface { v4 }, Landroid/database/Cursor;->moveToNext()Z
    move-result v8
    if-eqz v8, :L5
  .line 696
    invoke-interface { v4, v5 }, Landroid/database/Cursor;->getLong(I)J
    move-result-wide v1
  .line 697
    const/4 v8, 1
    invoke-interface { v4, v8 }, Landroid/database/Cursor;->isNull(I)Z
    move-result v9
    if-nez v9, :L4
    invoke-interface { v4, v8 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v8
    invoke-virtual { v0, v8 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L4
  .line 698
    add-int/lit8 v7, v7, 1
    goto :L3
  :L5
  .line 704
    if-eqz v4, :L9
  :L6
    invoke-interface { v4 }, Landroid/database/Cursor;->close()V
  :L7
    goto :L9
  :L8
  .line 705
    move-exception v3
  .line 707
    goto :L10
  :L9
  .line 706
    nop
  :L10
  .line 708
    if-ge v7, v6, :L11
    return-object v0
  :L11
  .line 709
    goto :L0
  :L12
  .line 700
    move-exception v0
    goto :L14
  :L13
    move-exception v0
    move-object v4, v3
  :L14
  .line 701
    nop
  .line 704
    if-eqz v4, :L18
  :L15
    invoke-interface { v4 }, Landroid/database/Cursor;->close()V
  :L16
    goto :L18
  :L17
  .line 705
    move-exception v0
    goto :L19
  :L18
  .line 706
    nop
  :L19
  .line 701
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
  .line 874
    invoke-static { }, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/Runtime;->availableProcessors()I
    move-result v0
  .line 875
    add-int/lit8 v0, v0, 1
  .line 876
    const/4 v1, 3
    if-le v0, v1, :L0
    const/4 v0, 3
  :L0
  .line 877
    return v0
.end method

.method private static queue([Ljava/io/File;)V
  .catchall { :L1 .. :L2 } :L5
  .catchall { :L9 .. :L10 } :L16
  .catchall { :L11 .. :L15 } :L14
  .catchall { :L17 .. :L18 } :L16
  .registers 7
  .line 759
    nop
  .line 760
    const/4 v0, 0
    const/4 v1, 0
    const/4 v2, 0
  :L0
    array-length v3, p0
    if-ge v2, v3, :L7
  .line 761
    aget-object v3, p0, v2
  .line 763
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
  .line 766
    nop
  .line 767
    if-nez v0, :L4
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  :L4
  .line 768
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L6
  :L5
  .line 764
    move-exception v3
  .line 765
    nop
  :L6
  .line 760
    add-int/lit8 v2, v2, 1
    goto :L0
  :L7
  .line 770
    if-nez v0, :L8
    return-void
  :L8
  .line 771
    const-class p0, Lcom/innioasis/ipp/Scan;
    monitor-enter p0
  :L9
  .line 772
    sget v2, Lcom/innioasis/ipp/Scan;->queued:I
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v3
    add-int/2addr v2, v3
    sput v2, Lcom/innioasis/ipp/Scan;->queued:I
  .line 773
    monitor-exit p0
  :L10
  .line 774
    sget-object v2, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    monitor-enter v2
  .line 775
    nop
  .line 776
    const/4 p0, 0
  :L11
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge v1, v3, :L12
  .line 777
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Ljava/io/File;
  .line 778
    sget-object v3, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
    invoke-virtual { p0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v4
    sget-object v5, Lcom/innioasis/ipp/Scan;->upcoming:Ljava/util/ArrayList;
    invoke-virtual { v5 }, Ljava/util/ArrayList;->size()I
    move-result v5
    invoke-static { v5 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v5
    invoke-virtual { v3, v4, v5 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 779
    sget-object v3, Lcom/innioasis/ipp/Scan;->upcoming:Ljava/util/ArrayList;
    invoke-virtual { v3, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 780
    nop
  .line 776
    add-int/lit8 v1, v1, 1
    const/4 p0, 1
    goto :L11
  :L12
  .line 782
    if-eqz p0, :L13
    sget-object p0, Lcom/innioasis/ipp/Scan;->repo:Lcom/innioasis/y1/database/Y1Repository;
    if-eqz p0, :L13
  .line 783
    invoke-static { }, Lcom/innioasis/ipp/Scan;->start()V
  .line 784
    sget-object p0, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    invoke-virtual { p0 }, Ljava/lang/Object;->notifyAll()V
  :L13
  .line 786
    monitor-exit v2
  .line 787
    return-void
  :L14
  .line 786
    move-exception p0
    monitor-exit v2
  :L15
    throw p0
  :L16
  .line 773
    move-exception v0
  :L17
    monitor-exit p0
  :L18
    goto :L20
  :L19
    throw v0
  :L20
    goto :L19
.end method

.method public static rows(Lcom/innioasis/y1/database/SongDao;)Ljava/util/List;
  .catchall { :L0 .. :L5 } :L12
  .catchall { :L6 .. :L7 } :L8
  .catchall { :L13 .. :L14 } :L12
  .registers 6
  .line 473
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sput-wide v0, Lcom/innioasis/ipp/Scan;->labTail:J
  .line 474
    invoke-static { }, Landroid/os/SystemClock;->currentThreadTimeMillis()J
    move-result-wide v0
    sput-wide v0, Lcom/innioasis/ipp/Scan;->labCpuTail:J
  .line 475
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 476
    const-class v1, Lcom/innioasis/ipp/Scan;
    monitor-enter v1
  :L0
  .line 477
    sget-object v2, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
    if-nez v2, :L1
    invoke-interface { p0 }, Lcom/innioasis/y1/database/SongDao;->getSongsSync()Ljava/util/List;
    move-result-object p0
    monitor-exit v1
    return-object p0
  :L1
  .line 478
    sget-object v2, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
    invoke-virtual { v2 }, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;
    move-result-object v2
  :L2
  .line 479
    invoke-interface { v2 }, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :L4
  .line 480
    invoke-interface { v2 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
  .line 481
    sget-object v4, Lcom/innioasis/ipp/Scan;->met:Ljava/util/HashSet;
    invoke-virtual { v4, v3 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v4
    if-nez v4, :L3
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 482
    goto :L2
  :L4
  .line 483
    monitor-exit v1
  :L5
  .line 484
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Scan;->tailStarts(I)V
  .line 485
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-eqz v1, :L6
    return-object v0
  :L6
  .line 487
    invoke-static { v0 }, Lcom/innioasis/ipp/Scan;->drop(Ljava/util/List;)V
  .line 488
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  :L7
    return-object v1
  :L8
  .line 489
    move-exception v1
  .line 490
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "library scan: batch clean-up failed, row by row: "
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  .line 493
    new-instance v1, Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v2
    invoke-direct { v1, v2 }, Ljava/util/ArrayList;-><init>(I)V
  .line 494
    const/4 v2, 0
  :L9
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge v2, v3, :L11
  .line 495
    invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
    invoke-interface { p0, v3 }, Lcom/innioasis/y1/database/SongDao;->getSongByPathSyncDB(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object v3
  .line 496
    if-eqz v3, :L10
    invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L10
  .line 494
    add-int/lit8 v2, v2, 1
    goto :L9
  :L11
  .line 498
    return-object v1
  :L12
  .line 483
    move-exception p0
  :L13
    monitor-exit v1
  :L14
    goto :L16
  :L15
    throw p0
  :L16
    goto :L15
.end method

.method private static show(I)V
  .registers 2
  .line 278
    const/16 v0, 99
    if-le p0, v0, :L0
    const/16 p0, 99
  :L0
  .line 279
    sget v0, Lcom/innioasis/ipp/Scan;->shown:I
    if-gt p0, v0, :L1
    return-void
  :L1
  .line 280
    sput p0, Lcom/innioasis/ipp/Scan;->shown:I
  .line 281
    invoke-static { p0 }, Lcom/innioasis/ipp/Loading;->scannedPercent(I)V
  .line 282
    return-void
.end method

.method public static skip(ZLjava/lang/String;)Z
  .registers 2
  .line 441
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
  .line 791
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 792
    nop
  :L0
  .line 794
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Scan;->take(Lcom/innioasis/y1/database/Y1Repository;Ljava/io/File;)Lcom/innioasis/y1/database/Song;
    move-result-object v2
  :L1
  .line 797
    goto :L3
  :L2
  .line 795
    move-exception v2
  .line 796
    const/4 v2, 0
  :L3
  .line 798
    if-nez v2, :L4
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/database/Y1Repository;->fileToSong(Ljava/io/File;)Lcom/innioasis/y1/database/Song;
    move-result-object v2
  :L4
  .line 799
    sget-wide p0, Lcom/innioasis/ipp/Scan;->labSong:J
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v3
    sub-long/2addr v3, v0
    add-long/2addr p0, v3
    sput-wide p0, Lcom/innioasis/ipp/Scan;->labSong:J
  .line 800
    sget p0, Lcom/innioasis/ipp/Scan;->labSongs:I
    add-int/lit8 p0, p0, 1
    sput p0, Lcom/innioasis/ipp/Scan;->labSongs:I
  .line 801
    invoke-static { v2 }, Lcom/innioasis/ipp/Scan;->built(Lcom/innioasis/y1/database/Song;)V
  .line 802
    return-object v2
.end method

.method private static songFile(Ljava/io/File;)Z
  .registers 3
  .line 747
    invoke-virtual { p0 }, Ljava/io/File;->isHidden()Z
    move-result v0
    const/4 v1, 0
    if-eqz v0, :L0
    return v1
  :L0
  .line 748
    invoke-virtual { p0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v0
  .line 749
    if-nez v0, :L1
    return v1
  :L1
  .line 750
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->extOf(Ljava/io/File;)Ljava/lang/String;
    move-result-object p0
  .line 751
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
  .line 866
    invoke-static { }, Lcom/innioasis/ipp/Scan;->pool()I
    move-result v0
  :L0
  .line 867
    sget v1, Lcom/innioasis/ipp/Scan;->live:I
    if-ge v1, v0, :L1
  .line 868
    add-int/lit8 v1, v1, 1
    sput v1, Lcom/innioasis/ipp/Scan;->live:I
  .line 869
    new-instance v1, Ljava/lang/Thread;
    new-instance v2, Lcom/innioasis/ipp/Scan$Builder;
    invoke-direct { v2 }, Lcom/innioasis/ipp/Scan$Builder;-><init>()V
    invoke-direct { v1, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v1 }, Ljava/lang/Thread;->start()V
    goto :L0
  :L1
  .line 871
    return-void
.end method

.method public static stays(Lcom/innioasis/y1/database/Song;)Z
  .catchall { :L2 .. :L3 } :L11
  .catchall { :L7 .. :L9 } :L8
  .catchall { :L12 .. :L13 } :L11
  .registers 4
  .line 450
    const/4 v0, 1
    if-nez p0, :L0
    return v0
  :L0
  .line 451
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
  .line 452
    if-nez p0, :L1
    return v0
  :L1
  .line 454
    const-class v1, Lcom/innioasis/ipp/Scan;
    monitor-enter v1
  :L2
  .line 455
    sget-object v2, Lcom/innioasis/ipp/Scan;->met:Ljava/util/HashSet;
    invoke-virtual { v2, p0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v2
  .line 456
    monitor-exit v1
  :L3
  .line 457
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
  .line 458
    if-nez p0, :L10
  .line 459
    const-class v1, Lcom/innioasis/ipp/Scan;
    monitor-enter v1
  :L7
  .line 460
    sput-boolean v0, Lcom/innioasis/ipp/Scan;->wrote:Z
  .line 461
    monitor-exit v1
    goto :L10
  :L8
    move-exception p0
    monitor-exit v1
  :L9
    throw p0
  :L10
  .line 463
    return p0
  :L11
  .line 456
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
  .line 642
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
  .line 643
    sget-object v3, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
  .line 644
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
  .line 645
    sput-wide v1, Lcom/innioasis/ipp/Scan;->asked:J
  :L3
  .line 646
    monitor-exit v0
    return-object v3
  :L4
  .line 641
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method static declared-synchronized tailEnds()V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  .line 310
    const/4 v1, 0
  :L0
    sput-object v1, Lcom/innioasis/ipp/Scan;->tailThread:Ljava/lang/Thread;
  .line 311
    const-wide/16 v1, 0
    sput-wide v1, Lcom/innioasis/ipp/Scan;->tailLoad:J
    sput-wide v1, Lcom/innioasis/ipp/Scan;->tailDone:J
    sput-wide v1, Lcom/innioasis/ipp/Scan;->tailWork:J
  :L1
  .line 312
    monitor-exit v0
    return-void
  :L2
  .line 309
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method private static declared-synchronized tailStarts(I)V
  .catchall { :L0 .. :L1 } :L6
  .catchall { :L2 .. :L5 } :L6
  .registers 8
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L0
  .line 286
    sget v1, Lcom/innioasis/ipp/Scan;->expected:I
  :L1
    if-nez v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 287
    invoke-static { }, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object v1
    sput-object v1, Lcom/innioasis/ipp/Scan;->tailThread:Ljava/lang/Thread;
  .line 288
    sget v1, Lcom/innioasis/ipp/Scan;->shown:I
    const/4 v2, 0
    invoke-static { v1, v2 }, Ljava/lang/Math;->max(II)I
    move-result v1
    sput v1, Lcom/innioasis/ipp/Scan;->tailFrom:I
  .line 289
    const-wide/16 v1, 0
    sput-wide v1, Lcom/innioasis/ipp/Scan;->tailDone:J
  .line 290
    sget-boolean v3, Lcom/innioasis/ipp/Scan;->wrote:Z
    if-nez v3, :L3
    if-lez p0, :L4
  :L3
    sget v1, Lcom/innioasis/ipp/Scan;->expected:I
    sget v2, Lcom/innioasis/ipp/Scan;->added:I
    add-int/2addr v1, v2
    sub-int/2addr v1, p0
    const/4 v2, 1
    invoke-static { v2, v1 }, Ljava/lang/Math;->max(II)I
    move-result v1
    int-to-long v1, v1
    const-wide/16 v3, 6
    mul-long v1, v1, v3
  :L4
    sput-wide v1, Lcom/innioasis/ipp/Scan;->tailLoad:J
  .line 291
    const-wide/16 v3, 7
    int-to-long v5, p0
    mul-long v5, v5, v3
    add-long/2addr v5, v1
    sput-wide v5, Lcom/innioasis/ipp/Scan;->tailWork:J
  :L5
  .line 292
    monitor-exit v0
    return-void
  :L6
  .line 285
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method private static declared-synchronized tailStep(J)V
  .catchall { :L0 .. :L2 } :L4
  .registers 9
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L0
  .line 295
    invoke-static { }, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object v1
    sget-object v2, Lcom/innioasis/ipp/Scan;->tailThread:Ljava/lang/Thread;
    if-ne v1, v2, :L3
    sget-wide v1, Lcom/innioasis/ipp/Scan;->tailWork:J
    const-wide/16 v3, 0
    cmp-long v5, v1, v3
    if-gtz v5, :L1
    goto :L3
  :L1
  .line 296
    sget-wide v3, Lcom/innioasis/ipp/Scan;->tailDone:J
    add-long/2addr v3, p0
    sput-wide v3, Lcom/innioasis/ipp/Scan;->tailDone:J
  .line 297
    sget p0, Lcom/innioasis/ipp/Scan;->tailFrom:I
    rsub-int/lit8 p1, p0, 100
    int-to-long v5, p1
    invoke-static { v3, v4, v1, v2 }, Ljava/lang/Math;->min(JJ)J
    move-result-wide v1
    mul-long v5, v5, v1
    sget-wide v1, Lcom/innioasis/ipp/Scan;->tailWork:J
    div-long/2addr v5, v1
    long-to-int p1, v5
    add-int/2addr p0, p1
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->show(I)V
  :L2
  .line 298
    monitor-exit v0
    return-void
  :L3
  .line 295
    monitor-exit v0
    return-void
  :L4
  .line 294
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method private static take(Lcom/innioasis/y1/database/Y1Repository;Ljava/io/File;)Lcom/innioasis/y1/database/Song;
  .catchall { :L1 .. :L8 } :L14
  .catchall { :L9 .. :L10 } :L11
  .catchall { :L12 .. :L15 } :L14
  .registers 10
  .line 807
    invoke-virtual { p1 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object p1
  .line 808
    const/4 v0, 0
    if-nez p1, :L0
    return-object v0
  :L0
  .line 810
    sget-object v1, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    monitor-enter v1
  :L1
  .line 811
    sget-object v2, Lcom/innioasis/ipp/Scan;->repo:Lcom/innioasis/y1/database/Y1Repository;
    if-nez v2, :L2
  .line 812
    sput-object p0, Lcom/innioasis/ipp/Scan;->repo:Lcom/innioasis/y1/database/Y1Repository;
  .line 813
    invoke-static { }, Lcom/innioasis/ipp/Scan;->start()V
  .line 814
    invoke-virtual { v1 }, Ljava/lang/Object;->notifyAll()V
  :L2
  .line 816
    sget-object p0, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
    invoke-virtual { p0, p1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 817
    if-nez p0, :L3
    const/4 p0, -1
    goto :L4
  :L3
    check-cast p0, Ljava/lang/Integer;
    invoke-virtual { p0 }, Ljava/lang/Integer;->intValue()I
    move-result p0
  :L4
  .line 818
    sget v2, Lcom/innioasis/ipp/Scan;->cursor:I
    if-ge p0, v2, :L5
  .line 819
    monitor-exit v1
    return-object v0
  :L5
  .line 821
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->pass(I)V
  .line 822
    sget v2, Lcom/innioasis/ipp/Scan;->next:I
    if-lt p0, v2, :L6
  .line 823
    add-int/lit8 p0, p0, 1
    sput p0, Lcom/innioasis/ipp/Scan;->next:I
  .line 824
    sget-object p0, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
    invoke-virtual { p0, p1 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 825
    invoke-static { }, Lcom/innioasis/ipp/Scan;->start()V
  .line 826
    invoke-virtual { v1 }, Ljava/lang/Object;->notifyAll()V
  .line 827
    monitor-exit v1
    return-object v0
  :L6
  .line 829
    sget-object p0, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
    invoke-virtual { p0, p1 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/database/Song;
  .line 830
    if-nez p0, :L13
    sget-object v0, Lcom/innioasis/ipp/Scan;->building:Ljava/util/HashSet;
    invoke-virtual { v0, p1 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L13
  .line 832
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    const-wide/16 v4, 20000
    add-long/2addr v2, v4
  :L7
  .line 833
    sget-object p0, Lcom/innioasis/ipp/Scan;->building:Ljava/util/HashSet;
    invoke-virtual { p0, p1 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L12
  .line 834
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
  :L8
    sub-long v4, v2, v4
  .line 835
    const-wide/16 v6, 0
    cmp-long p0, v4, v6
    if-gtz p0, :L9
    goto :L12
  :L9
  .line 837
    sget-object p0, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    invoke-virtual { p0, v4, v5 }, Ljava/lang/Object;->wait(J)V
  :L10
  .line 840
    nop
  .line 841
    goto :L7
  :L11
  .line 838
    move-exception p0
  .line 839
    nop
  :L12
  .line 842
    sget-object p0, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
    invoke-virtual { p0, p1 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/database/Song;
  :L13
  .line 844
    sget-object v0, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
    invoke-virtual { v0, p1 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 845
    sget-object p1, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    invoke-virtual { p1 }, Ljava/lang/Object;->notifyAll()V
  .line 846
    monitor-exit v1
    return-object p0
  :L14
  .line 847
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
  .line 434
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
  .line 567
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L0
  .line 568
    sget-object v1, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
    if-eqz v1, :L1
    sget-object p0, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
    invoke-virtual { p0 }, Ljava/util/HashSet;->size()I
    move-result p0
    sget v1, Lcom/innioasis/ipp/Scan;->added:I
    add-int/2addr p0, v1
    sget v1, Lcom/innioasis/ipp/Scan;->dropped:I
    sub-int/2addr p0, v1
    monitor-exit v0
    return p0
  :L1
  .line 569
    monitor-exit v0
  :L2
  .line 570
    if-nez p0, :L3
    const/4 p0, 0
    goto :L4
  :L3
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result p0
  :L4
    return p0
  :L5
  .line 569
    move-exception p0
  :L6
    monitor-exit v0
  :L7
    throw p0
.end method

.method private static under(Ljava/lang/String;Ljava/lang/String;)Z
  .registers 10
  .line 600
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 601
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v7
  .line 602
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
  .line 603
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
  .line 429
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

.method private static walkShown()V
  .registers 8
  .line 252
    sget v0, Lcom/innioasis/ipp/Scan;->expected:I
    if-nez v0, :L0
    return-void
  :L0
  .line 253
    sget v0, Lcom/innioasis/ipp/Scan;->dirsExpected:I
    sget v1, Lcom/innioasis/ipp/Scan;->dirs:I
    invoke-static { v0, v1 }, Ljava/lang/Math;->max(II)I
    move-result v0
    int-to-long v0, v0
    const-wide/16 v2, 30
    mul-long v0, v0, v2
    sget v2, Lcom/innioasis/ipp/Scan;->expected:I
    int-to-long v3, v2
    const-wide/16 v5, 4
    mul-long v3, v3, v5
    add-long/2addr v0, v3
    sget v3, Lcom/innioasis/ipp/Scan;->queued:I
    int-to-long v4, v3
    const-wide/16 v6, 22
    mul-long v4, v4, v6
    add-long/2addr v0, v4
  .line 254
    if-lez v3, :L1
    add-int/2addr v2, v3
    int-to-long v2, v2
    const-wide/16 v4, 6
    mul-long v2, v2, v4
    add-long/2addr v0, v2
  :L1
  .line 255
    sget-wide v2, Lcom/innioasis/ipp/Scan;->units:J
    const-wide/16 v4, 100
    mul-long v4, v4, v2
    const-wide/16 v6, 1
    add-long/2addr v2, v6
    invoke-static { v0, v1, v2, v3 }, Ljava/lang/Math;->max(JJ)J
    move-result-wide v0
    div-long/2addr v4, v0
    long-to-int v0, v4
    invoke-static { v0 }, Lcom/innioasis/ipp/Scan;->show(I)V
  .line 256
    return-void
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
