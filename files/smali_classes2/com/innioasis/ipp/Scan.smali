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

.field private final static BOOT_MS:J = 120000L

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

.field private static cardAway:Z

.field private static cardSeen:Z

.field private static cursor:I

.field private static dirs:I

.field private static dirsExpected:I

.field private static dropped:I

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

.field private static walker:Ljava/lang/Thread;

.field private static writing:Z

.field private static wrote:Z

.method static constructor <clinit>()V
  .registers 25
  .line 137
    new-instance v0, Ljava/util/LinkedList;
    invoke-direct { v0 }, Ljava/util/LinkedList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->WRITES:Ljava/util/LinkedList;
  .line 236
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Scan;->shown:I
  .line 322
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
  .line 324
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
  .line 326
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
  .line 328
    new-instance v1, Ljava/util/HashSet;
    invoke-static { v0 }, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Formats;->more(Ljava/util/List;)Ljava/util/List;
    move-result-object v0
    invoke-direct { v1, v0 }, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V
    sput-object v1, Lcom/innioasis/ipp/Scan;->musicExt:Ljava/util/HashSet;
  .line 329
    new-instance v0, Ljava/util/HashSet;
    invoke-static { v15 }, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Formats;->more(Ljava/util/List;)Ljava/util/List;
    move-result-object v1
    invoke-direct { v0, v1 }, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V
    sput-object v0, Lcom/innioasis/ipp/Scan;->bookExt:Ljava/util/HashSet;
  .line 330
    new-instance v0, Ljava/util/HashSet;
    invoke-static { v2 }, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;
    move-result-object v1
    invoke-direct { v0, v1 }, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V
    sput-object v0, Lcom/innioasis/ipp/Scan;->videoExt:Ljava/util/HashSet;
  .line 386
    new-instance v0, Ljava/util/LinkedList;
    invoke-direct { v0 }, Ljava/util/LinkedList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->AHEAD:Ljava/util/LinkedList;
  .line 580
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->met:Ljava/util/HashSet;
  .line 604
    new-instance v0, Lcom/innioasis/y1/database/Song;
    invoke-direct { v0 }, Lcom/innioasis/y1/database/Song;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->MARKER:Lcom/innioasis/y1/database/Song;
  .line 725
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
  .line 731
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->upcoming:Ljava/util/ArrayList;
  .line 732
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
  .line 737
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
  .line 738
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
  .line 418
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
  .line 573
    const/4 v1, 1
  :L0
    sput-boolean v1, Lcom/innioasis/ipp/Scan;->wrote:Z
  .line 574
    sget-object v2, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
  .line 575
    if-eqz p0, :L3
    if-nez v2, :L1
    goto :L3
  :L1
  .line 576
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v2, p0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result p0
    if-nez p0, :L2
    sget p0, Lcom/innioasis/ipp/Scan;->added:I
    add-int/2addr p0, v1
    sput p0, Lcom/innioasis/ipp/Scan;->added:I
  :L2
  .line 577
    monitor-exit v0
    return-void
  :L3
  .line 575
    monitor-exit v0
    return-void
  :L4
  .line 572
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method public static declared-synchronized cardLeft()V
  .catchall { :L0 .. :L2 } :L3
  .registers 6
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L0
  .line 69
    sget-boolean v1, Lcom/innioasis/ipp/Scan;->cardSeen:Z
    if-nez v1, :L1
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    const-wide/32 v3, 120000
    cmp-long v5, v1, v3
    if-lez v5, :L2
  :L1
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/Scan;->cardAway:Z
  :L2
  .line 70
    monitor-exit v0
    return-void
  :L3
  .line 68
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method public static declared-synchronized cardMounted()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  .line 74
    const/4 v1, 1
  :L0
    sput-boolean v1, Lcom/innioasis/ipp/Scan;->cardSeen:Z
  :L1
  .line 75
    monitor-exit v0
    return-void
  :L2
  .line 73
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method static declared-synchronized clean()Z
  .catchall { :L0 .. :L1 } :L4
  .registers 2
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L0
  .line 218
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
  .line 218
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
  .line 242
    sget v1, Lcom/innioasis/ipp/Scan;->seen:I
    add-int/lit8 v1, v1, 1
    sput v1, Lcom/innioasis/ipp/Scan;->seen:I
  .line 243
    sget-wide v2, Lcom/innioasis/ipp/Scan;->units:J
    if-eqz p0, :L1
    const-wide/16 v4, 4
    goto :L2
  :L1
    const-wide/16 v4, 22
  :L2
    add-long/2addr v2, v4
    sput-wide v2, Lcom/innioasis/ipp/Scan;->units:J
  .line 244
    sget p0, Lcom/innioasis/ipp/Scan;->expected:I
    if-nez p0, :L6
  .line 245
    div-int/lit8 p0, v1, 16
  .line 246
    sget v2, Lcom/innioasis/ipp/Scan;->shown:I
  :L3
    if-ne p0, v2, :L4
    monitor-exit v0
    return-void
  :L4
  .line 247
    sput p0, Lcom/innioasis/ipp/Scan;->shown:I
  .line 248
    invoke-static { v1 }, Lcom/innioasis/ipp/Loading;->scanned(I)V
  :L5
  .line 249
    monitor-exit v0
    return-void
  :L6
  .line 251
    invoke-static { }, Lcom/innioasis/ipp/Scan;->walkShown()V
  :L7
  .line 252
    monitor-exit v0
    return-void
  :L8
  .line 241
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method public static dir(Ljava/io/File;)Z
  .registers 1
  .line 364
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
  .line 270
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
  .line 271
    invoke-virtual { p0 }, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;
    move-result-object p0
  :L0
  .line 272
    invoke-interface { p0 }, Ljava/util/Iterator;->hasNext()Z
    move-result v1
    if-eqz v1, :L3
  .line 273
    invoke-interface { p0 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/lang/String;
  .line 274
    const/16 v2, 47
    invoke-virtual { v1, v2 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v3
  :L1
  .line 275
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
  .line 276
    goto :L0
  :L3
  .line 277
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
  .line 626
    invoke-static { }, Lcom/innioasis/ipp/Tone;->recheck()V
  .line 627
    const/4 v1, 0
    sput-object v1, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
  .line 628
    const/4 v2, 0
    sput v2, Lcom/innioasis/ipp/Scan;->added:I
  .line 629
    sput v2, Lcom/innioasis/ipp/Scan;->dropped:I
  .line 630
    new-instance v3, Ljava/util/HashSet;
    invoke-direct { v3 }, Ljava/util/HashSet;-><init>()V
    sput-object v3, Lcom/innioasis/ipp/Scan;->met:Ljava/util/HashSet;
  .line 631
    sput-boolean v2, Lcom/innioasis/ipp/Scan;->marked:Z
  .line 632
    sput-boolean v2, Lcom/innioasis/ipp/Scan;->wrote:Z
  .line 633
    sput-object v1, Lcom/innioasis/ipp/Scan;->walker:Ljava/lang/Thread;
  .line 634
    sput-object v1, Lcom/innioasis/ipp/Scan;->py:Ljava/util/HashMap;
  .line 635
    invoke-static { }, Lcom/innioasis/ipp/Scan;->forgetQueue()V
  :L1
  .line 636
    monitor-exit v0
    return-void
  :L2
  .line 625
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
  .line 504
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0, p0 }, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V
  .line 505
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
  .line 506
    const-wide/16 v1, -1
  :L0
  .line 508
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
  .line 510
    const/4 v4, 0
    const/4 v6, 0
  :L1
  .line 512
    invoke-interface { v3 }, Landroid/database/Cursor;->moveToNext()Z
    move-result v7
    const/4 v8, 1
    if-eqz v7, :L6
  .line 513
    invoke-interface { v3, v4 }, Landroid/database/Cursor;->getLong(I)J
    move-result-wide v1
  .line 514
    add-int/lit8 v6, v6, 1
  .line 515
    invoke-interface { v3, v8 }, Landroid/database/Cursor;->isNull(I)Z
    move-result v7
    if-eqz v7, :L2
    goto :L1
  :L2
  .line 516
    invoke-interface { v3, v8 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v7
  .line 517
    invoke-virtual { v0, v7 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v8
    if-nez v8, :L3
    goto :L1
  :L3
  .line 518
    new-instance v8, Lcom/innioasis/y1/database/Song;
    invoke-direct { v8 }, Lcom/innioasis/y1/database/Song;-><init>()V
  .line 519
    invoke-virtual { v8, v7 }, Lcom/innioasis/y1/database/Song;->setPath(Ljava/lang/String;)V
  .line 520
    invoke-static { v8 }, Lcom/innioasis/ipp/Scan;->stays(Lcom/innioasis/y1/database/Song;)Z
    move-result v7
    if-nez v7, :L4
    invoke-static { v1, v2 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v7
    invoke-virtual { p0, v7 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L4
  .line 521
    const-wide/16 v7, 7
    invoke-static { v7, v8 }, Lcom/innioasis/ipp/Scan;->tailStep(J)V
  :L5
  .line 522
    goto :L1
  :L6
  .line 524
    invoke-interface { v3 }, Landroid/database/Cursor;->close()V
  .line 525
    nop
  .line 526
    if-ge v6, v5, :L23
  .line 528
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->db()Landroidx/room/RoomDatabase;
    move-result-object v0
  .line 529
    nop
  .line 530
    const/4 v1, 0
  :L7
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result v2
    if-ge v4, v2, :L21
  :L8
  .line 531
    sget-object v2, Lcom/innioasis/music/objects/Global;->INSTANCE:Lcom/innioasis/music/objects/Global;
    invoke-virtual { v2 }, Lcom/innioasis/music/objects/Global;->getScanLock()Z
    move-result v2
    if-eqz v2, :L9
    const-wide/16 v2, 100
    invoke-static { v2, v3 }, Ljava/lang/Thread;->sleep(J)V
    goto :L8
  :L9
  .line 532
    sget-object v2, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v2 }, Lcom/innioasis/music/util/Other;->sdCardIsReady()Z
    move-result v2
    if-nez v2, :L10
    goto :L21
  :L10
  .line 533
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result v2
    add-int/lit16 v3, v4, 500
    invoke-static { v2, v3 }, Ljava/lang/Math;->min(II)I
    move-result v2
  .line 534
    invoke-virtual { v0 }, Landroidx/room/RoomDatabase;->beginTransaction()V
  :L11
  .line 536
    const-string v5, "delete from song where rowid = ?"
    invoke-virtual { v0, v5 }, Landroidx/room/RoomDatabase;->compileStatement(Ljava/lang/String;)Landroidx/sqlite/db/SupportSQLiteStatement;
    move-result-object v5
  .line 537
    move v6, v4
  :L12
    if-ge v6, v2, :L13
  .line 538
    invoke-virtual { p0, v6 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Ljava/lang/Long;
    invoke-virtual { v7 }, Ljava/lang/Long;->longValue()J
    move-result-wide v9
    invoke-interface { v5, v8, v9, v10 }, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V
  .line 539
    invoke-interface { v5 }, Landroidx/sqlite/db/SupportSQLiteStatement;->executeUpdateDelete()I
  .line 540
    invoke-interface { v5 }, Landroidx/sqlite/db/SupportSQLiteStatement;->clearBindings()V
  .line 537
    add-int/lit8 v6, v6, 1
    goto :L12
  :L13
  .line 542
    invoke-virtual { v0 }, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
  :L14
  .line 544
    invoke-virtual { v0 }, Landroidx/room/RoomDatabase;->endTransaction()V
  .line 545
    nop
  .line 546
    sub-int/2addr v2, v4
    add-int/2addr v1, v2
  .line 547
    const-class v4, Lcom/innioasis/ipp/Scan;
    monitor-enter v4
  :L15
  .line 548
    sget v5, Lcom/innioasis/ipp/Scan;->dropped:I
    add-int/2addr v5, v2
    sput v5, Lcom/innioasis/ipp/Scan;->dropped:I
  .line 549
    monitor-exit v4
  :L16
  .line 550
    sget-object v4, Lcom/innioasis/music/objects/Global;->INSTANCE:Lcom/innioasis/music/objects/Global;
  .line 551
    invoke-virtual { v4 }, Lcom/innioasis/music/objects/Global;->getScanDeletedCount()I
    move-result v5
    add-int/2addr v5, v2
    invoke-virtual { v4, v5 }, Lcom/innioasis/music/objects/Global;->setScanDeletedCount(I)V
  .line 530
    move v4, v3
    goto :L7
  :L17
  .line 549
    move-exception p0
  :L18
    monitor-exit v4
  :L19
    throw p0
  :L20
  .line 544
    move-exception p0
    invoke-virtual { v0 }, Landroidx/room/RoomDatabase;->endTransaction()V
  .line 545
    throw p0
  :L21
  .line 553
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
  .line 554
    if-lez v1, :L22
    invoke-static { }, Lcom/innioasis/ipp/Ipp;->libraryChanged()V
  :L22
  .line 555
    return-void
  :L23
  .line 527
    goto/16 :L0
  :L24
  .line 524
    move-exception p0
    invoke-interface { v3 }, Landroid/database/Cursor;->close()V
  .line 525
    goto :L26
  :L25
    throw p0
  :L26
    goto :L25
.end method

.method public static exists(Ljava/io/File;)Z
  .registers 2
  .line 360
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
  .line 354
    invoke-virtual { p0 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object p0
  .line 355
    const/16 v0, 46
    invoke-virtual { p0, v0 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v0
  .line 356
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
  .line 710
    if-nez p1, :L0
    return-void
  :L0
  .line 711
    const/4 v0, 0
  :L1
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L4
  .line 712
    invoke-interface { p1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
  .line 713
    instance-of v2, v1, Lcom/innioasis/y1/database/Song;
    if-nez v2, :L2
    goto :L3
  :L2
  .line 714
    check-cast v1, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
  .line 715
    if-eqz v1, :L3
    invoke-virtual { p0, v1 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L3
  .line 711
    add-int/lit8 v0, v0, 1
    goto :L1
  :L4
  .line 717
    return-void
.end method

.method private static forgetQueue()V
  .catchall { :L0 .. :L2 } :L1
  .registers 2
  .line 874
    sget-object v0, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 875
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
    sput-object v1, Lcom/innioasis/ipp/Scan;->upcoming:Ljava/util/ArrayList;
  .line 876
    new-instance v1, Ljava/util/HashMap;
    invoke-direct { v1 }, Ljava/util/HashMap;-><init>()V
    sput-object v1, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
  .line 877
    new-instance v1, Ljava/util/HashMap;
    invoke-direct { v1 }, Ljava/util/HashMap;-><init>()V
    sput-object v1, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
  .line 878
    const/4 v1, 0
    sput v1, Lcom/innioasis/ipp/Scan;->cursor:I
  .line 879
    sput v1, Lcom/innioasis/ipp/Scan;->next:I
  .line 880
    const/4 v1, 0
    sput-object v1, Lcom/innioasis/ipp/Scan;->repo:Lcom/innioasis/y1/database/Y1Repository;
  .line 881
    invoke-virtual { v0 }, Ljava/lang/Object;->notifyAll()V
  .line 882
    monitor-exit v0
  .line 883
    return-void
  :L1
  .line 882
    move-exception v1
    monitor-exit v0
  :L2
    throw v1
.end method

.method static inDb(Ljava/lang/String;)Z
  .registers 3
  .line 615
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 616
    invoke-static { }, Lcom/innioasis/ipp/Scan;->table()Ljava/util/HashSet;
    move-result-object v1
  .line 617
    if-nez v1, :L1
    return v0
  :L1
  .line 618
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
  .line 97
    if-eqz p0, :L5
    if-nez p1, :L0
    goto :L5
  :L0
  .line 98
    sget-object v0, Lcom/innioasis/ipp/Scan;->WRITES:Ljava/util/LinkedList;
    monitor-enter v0
  .line 99
    const/4 v1, 2
  :L1
    new-array v1, v1, [Ljava/lang/Object;
    const/4 v2, 0
    aput-object p0, v1, v2
    const/4 p0, 1
    aput-object p1, v1, p0
    invoke-virtual { v0, v1 }, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V
  .line 100
    sget-boolean p1, Lcom/innioasis/ipp/Scan;->writing:Z
    if-nez p1, :L2
  .line 101
    sput-boolean p0, Lcom/innioasis/ipp/Scan;->writing:Z
  .line 102
    new-instance p0, Ljava/lang/Thread;
    new-instance p1, Lcom/innioasis/ipp/Scan$Writer;
    invoke-direct { p1 }, Lcom/innioasis/ipp/Scan$Writer;-><init>()V
    const-string v1, "ipp-scan-db"
    invoke-direct { p0, p1, v1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    invoke-virtual { p0 }, Ljava/lang/Thread;->start()V
  :L2
  .line 104
    invoke-virtual { v0 }, Ljava/lang/Object;->notifyAll()V
  .line 105
    monitor-exit v0
  .line 106
    return-void
  :L3
  .line 105
    move-exception p0
    monitor-exit v0
  :L4
    throw p0
  :L5
  .line 97
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
  .line 114
    sget-object v0, Lcom/innioasis/ipp/Scan;->WRITES:Ljava/util/LinkedList;
    monitor-enter v0
  :L0
  .line 115
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    const-wide/32 v3, 60000
    add-long/2addr v1, v3
  :L1
  .line 116
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
  .line 117
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
  :L4
    sub-long v4, v1, v4
  .line 118
    const-wide/16 v6, 0
    cmp-long v8, v4, v6
    if-gtz v8, :L5
    goto :L8
  :L5
  .line 120
    invoke-virtual { v3, v4, v5 }, Ljava/lang/Object;->wait(J)V
  :L6
  .line 123
    nop
  .line 124
    goto :L1
  :L7
  .line 121
    move-exception v1
  .line 122
    nop
  :L8
  .line 125
    monitor-exit v0
  :L9
  .line 128
    sget-object v1, Lcom/innioasis/ipp/Scan;->WRITES:Ljava/util/LinkedList;
    monitor-enter v1
  :L10
  .line 129
    invoke-virtual { v1 }, Ljava/util/LinkedList;->isEmpty()Z
    move-result v0
    if-eqz v0, :L12
    monitor-exit v1
  :L11
  .line 134
    invoke-interface { p0, p1 }, Lcom/innioasis/y1/database/SongDao;->insert([Lcom/innioasis/y1/database/Song;)V
  .line 135
    return-void
  :L12
  .line 130
    invoke-virtual { v1 }, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, [Ljava/lang/Object;
  .line 131
    monitor-exit v1
  :L13
  .line 132
    const/4 v1, 0
    aget-object v1, v0, v1
    check-cast v1, Lcom/innioasis/y1/database/SongDao;
    const/4 v2, 1
    aget-object v0, v0, v2
    check-cast v0, [Lcom/innioasis/y1/database/Song;
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Scan;->write(Lcom/innioasis/y1/database/SongDao;[Lcom/innioasis/y1/database/Song;)V
  .line 133
    goto :L9
  :L14
  .line 131
    move-exception p0
  :L15
    monitor-exit v1
  :L16
    throw p0
  :L17
  .line 125
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

.method static declared-synchronized keepsMisses()Z
  .catchall { :L0 .. :L1 } :L4
  .registers 3
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L0
  .line 56
    sget-boolean v1, Lcom/innioasis/ipp/Scan;->marked:Z
    if-eqz v1, :L2
    sget-boolean v1, Lcom/innioasis/ipp/Scan;->wrote:Z
    if-nez v1, :L2
    invoke-static { }, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object v1
    sget-object v2, Lcom/innioasis/ipp/Scan;->walker:Ljava/lang/Thread;
  :L1
    if-ne v1, v2, :L2
    const/4 v1, 1
    goto :L3
  :L2
    const/4 v1, 0
  :L3
    monitor-exit v0
    return v1
  :L4
  .line 56
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method private static kind(Ljava/io/File;)I
  .registers 3
  .line 341
    sget-object v0, Lcom/innioasis/ipp/Scan;->node:Ljava/io/File;
    if-eq p0, v0, :L4
  .line 342
    nop
  .line 343
    invoke-virtual { p0 }, Ljava/io/File;->isFile()Z
    move-result v0
    const/4 v1, 1
    if-eqz v0, :L0
    goto :L3
  :L0
  .line 344
    invoke-virtual { p0 }, Ljava/io/File;->isDirectory()Z
    move-result v0
    if-eqz v0, :L1
    const/4 v1, 3
    goto :L3
  :L1
  .line 345
    invoke-virtual { p0 }, Ljava/io/File;->exists()Z
    move-result v0
    if-eqz v0, :L2
    goto :L3
  :L2
    const/4 v1, 0
  :L3
  .line 346
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->extOf(Ljava/io/File;)Ljava/lang/String;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Scan;->ext:Ljava/lang/String;
  .line 347
    sput v1, Lcom/innioasis/ipp/Scan;->kind:I
  .line 348
    sput-object p0, Lcom/innioasis/ipp/Scan;->node:Ljava/io/File;
  :L4
  .line 350
    sget p0, Lcom/innioasis/ipp/Scan;->kind:I
    return p0
.end method

.method public static known(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
  .registers 2
  .line 40
    sget-boolean v0, Lcom/innioasis/ipp/Scan;->marked:Z
    if-nez v0, :L0
    invoke-static { }, Lcom/innioasis/ipp/Scan;->mark()V
  :L0
  .line 41
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->inDb(Ljava/lang/String;)Z
    move-result v0
  .line 42
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->meet(Ljava/lang/String;)V
  .line 43
    invoke-static { v0 }, Lcom/innioasis/ipp/Scan;->count(Z)V
  .line 44
    if-eqz v0, :L1
    sget-object p0, Lcom/innioasis/ipp/Scan;->MARKER:Lcom/innioasis/y1/database/Song;
    goto :L2
  :L1
    const/4 p0, 0
  :L2
    return-object p0
.end method

.method public static listed([Ljava/io/File;)V
  .catchall { :L1 .. :L4 } :L3
  .registers 4
  .line 373
    invoke-static { }, Lcom/innioasis/ipp/Scan;->listedDir()V
  .line 374
    if-eqz p0, :L5
    array-length v0, p0
    if-nez v0, :L0
    goto :L5
  :L0
  .line 375
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->queue([Ljava/io/File;)V
  .line 376
    sget-object v0, Lcom/innioasis/ipp/Scan;->AHEAD:Ljava/util/LinkedList;
    monitor-enter v0
  :L1
  .line 377
    invoke-virtual { v0, p0 }, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V
  .line 378
    sget-boolean p0, Lcom/innioasis/ipp/Scan;->looking:Z
    if-nez p0, :L2
  .line 379
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/Scan;->looking:Z
  .line 380
    new-instance p0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/ipp/Scan$Looker;
    invoke-direct { v1 }, Lcom/innioasis/ipp/Scan$Looker;-><init>()V
    const-string v2, "ipp-scan-stat"
    invoke-direct { p0, v1, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    invoke-virtual { p0 }, Ljava/lang/Thread;->start()V
  :L2
  .line 382
    invoke-virtual { v0 }, Ljava/lang/Object;->notifyAll()V
  .line 383
    monitor-exit v0
  .line 384
    return-void
  :L3
  .line 383
    move-exception p0
    monitor-exit v0
  :L4
    throw p0
  :L5
  .line 374
    return-void
.end method

.method private static declared-synchronized listedDir()V
  .catchall { :L0 .. :L1 } :L2
  .registers 5
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L0
  .line 263
    sget v1, Lcom/innioasis/ipp/Scan;->dirs:I
    add-int/lit8 v1, v1, 1
    sput v1, Lcom/innioasis/ipp/Scan;->dirs:I
  .line 264
    sget-wide v1, Lcom/innioasis/ipp/Scan;->units:J
    const-wide/16 v3, 30
    add-long/2addr v1, v3
    sput-wide v1, Lcom/innioasis/ipp/Scan;->units:J
  .line 265
    invoke-static { }, Lcom/innioasis/ipp/Scan;->walkShown()V
  :L1
  .line 266
    monitor-exit v0
    return-void
  :L2
  .line 262
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
  .registers 5
  :L0
  .line 649
    invoke-static { }, Lcom/innioasis/ipp/Artists;->ensureExceptions()V
  .line 650
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 651
    if-nez v0, :L1
    sget-object v0, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
    return-object v0
  :L1
  .line 652
    invoke-static { }, Lcom/innioasis/ipp/Scan;->pathsOnly()Ljava/util/HashSet;
    move-result-object v1
  .line 653
    if-nez v1, :L2
  .line 654
    new-instance v1, Ljava/util/HashSet;
    invoke-direct { v1 }, Ljava/util/HashSet;-><init>()V
  .line 655
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository;->ippSongDao()Lcom/innioasis/y1/database/SongDao;
    move-result-object v0
    invoke-interface { v0 }, Lcom/innioasis/y1/database/SongDao;->getSongsSync()Ljava/util/List;
    move-result-object v0
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Scan;->fill(Ljava/util/HashSet;Ljava/util/List;)V
  :L2
  .line 657
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
  .line 658
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L3
  .line 659
    const/4 v2, 0
  :L4
    sput v2, Lcom/innioasis/ipp/Scan;->seen:I
  .line 660
    const-wide/16 v3, 0
    sput-wide v3, Lcom/innioasis/ipp/Scan;->units:J
  .line 661
    invoke-virtual { v1 }, Ljava/util/HashSet;->size()I
    move-result v3
    sput v3, Lcom/innioasis/ipp/Scan;->expected:I
  .line 662
    invoke-static { v1 }, Lcom/innioasis/ipp/Scan;->dirsOf(Ljava/util/HashSet;)I
    move-result v3
    sput v3, Lcom/innioasis/ipp/Scan;->dirsExpected:I
  .line 663
    sput v2, Lcom/innioasis/ipp/Scan;->dirs:I
  .line 664
    sput v2, Lcom/innioasis/ipp/Scan;->queued:I
  .line 665
    const/4 v3, -1
    sput v3, Lcom/innioasis/ipp/Scan;->shown:I
  .line 666
    sput v2, Lcom/innioasis/ipp/Scan;->added:I
  .line 667
    monitor-exit v0
  :L5
  .line 669
    invoke-virtual { v1 }, Ljava/util/HashSet;->isEmpty()Z
    move-result v0
    if-eqz v0, :L6
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Meta;->noteLibraryRead(Landroid/content/Context;)V
  :L6
  .line 670
    sput-object v1, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
  :L7
  .line 671
    return-object v1
  :L8
  .line 667
    move-exception v1
  :L9
    monitor-exit v0
  :L10
    throw v1
  :L11
  .line 672
    move-exception v0
  .line 673
    sget-object v0, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
    return-object v0
.end method

.method static declared-synchronized loaded(I)V
  .catchall { :L0 .. :L2 } :L4
  .registers 10
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L0
  .line 306
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
  .line 307
    sget-wide v3, Lcom/innioasis/ipp/Scan;->tailWork:J
    sub-long/2addr v3, v1
  .line 308
    sget-wide v5, Lcom/innioasis/ipp/Scan;->tailDone:J
    int-to-long v7, p0
    mul-long v1, v1, v7
    const-wide/16 v7, 1000
    div-long/2addr v1, v7
    add-long/2addr v3, v1
    invoke-static { v5, v6, v3, v4 }, Ljava/lang/Math;->max(JJ)J
    move-result-wide v1
    sput-wide v1, Lcom/innioasis/ipp/Scan;->tailDone:J
  .line 309
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
  .line 310
    monitor-exit v0
    return-void
  :L3
  .line 306
    monitor-exit v0
    return-void
  :L4
  .line 305
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method private static declared-synchronized mark()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L0
  .line 85
    invoke-static { }, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object v1
    sput-object v1, Lcom/innioasis/ipp/Scan;->walker:Ljava/lang/Thread;
  .line 86
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/Scan;->marked:Z
  .line 87
    new-instance v1, Ljava/util/HashMap;
    invoke-direct { v1 }, Ljava/util/HashMap;-><init>()V
    sput-object v1, Lcom/innioasis/ipp/Scan;->py:Ljava/util/HashMap;
  .line 88
    invoke-static { }, Lcom/innioasis/ipp/Albums;->scanStarts()V
  :L1
  .line 89
    monitor-exit v0
    return-void
  :L2
  .line 84
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method private static declared-synchronized meet(Ljava/lang/String;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  .line 583
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
  .line 582
    move-exception p0
    monitor-exit v0
    throw p0
  :L3
  .line 584
    monitor-exit v0
    return-void
.end method

.method public static music(Ljava/io/File;)Z
  .registers 2
  .line 423
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
  .line 588
    sget-object v0, Lcom/innioasis/ipp/Scan;->card:Ljava/lang/String;
  .line 589
    if-nez v0, :L0
    invoke-static { }, Lcom/innioasis/ipp/Panel;->card()Ljava/io/File;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Scan;->card:Ljava/lang/String;
  :L0
  .line 590
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Scan;->under(Ljava/lang/String;Ljava/lang/String;)Z
    move-result p0
    return p0
.end method

.method private static pass(I)V
  .registers 5
  .line 844
    sget v0, Lcom/innioasis/ipp/Scan;->cursor:I
  :L0
    const/4 v1, 0
    if-ge v0, p0, :L3
  .line 845
    sget-object v2, Lcom/innioasis/ipp/Scan;->upcoming:Ljava/util/ArrayList;
    invoke-virtual { v2, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/io/File;
  .line 846
    if-nez v2, :L1
    goto :L2
  :L1
  .line 847
    invoke-virtual { v2 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v2
  .line 848
    sget-object v3, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
    invoke-virtual { v3, v2 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 849
    sget-object v3, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
    invoke-virtual { v3, v2 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 850
    sget-object v2, Lcom/innioasis/ipp/Scan;->upcoming:Ljava/util/ArrayList;
    invoke-virtual { v2, v0, v1 }, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;
  :L2
  .line 844
    add-int/lit8 v0, v0, 1
    goto :L0
  :L3
  .line 852
    sget-object v0, Lcom/innioasis/ipp/Scan;->upcoming:Ljava/util/ArrayList;
    invoke-virtual { v0, p0, v1 }, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;
  .line 853
    add-int/lit8 p0, p0, 1
    sput p0, Lcom/innioasis/ipp/Scan;->cursor:I
  .line 854
    return-void
.end method

.method private static pathsOnly()Ljava/util/HashSet;
  .catchall { :L1 .. :L2 } :L13
  .catchall { :L3 .. :L4 } :L12
  .catchall { :L6 .. :L7 } :L8
  .catchall { :L15 .. :L16 } :L17
  .registers 10
  .line 682
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
  .line 683
    const-wide/16 v1, -1
  :L0
  .line 685
    nop
  .line 686
    nop
  .line 688
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
  .line 690
    invoke-interface { v4 }, Landroid/database/Cursor;->moveToNext()Z
    move-result v8
    if-eqz v8, :L5
  .line 691
    invoke-interface { v4, v5 }, Landroid/database/Cursor;->getLong(I)J
    move-result-wide v1
  .line 692
    const/4 v8, 1
    invoke-interface { v4, v8 }, Landroid/database/Cursor;->isNull(I)Z
    move-result v9
    if-nez v9, :L4
    invoke-interface { v4, v8 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v8
    invoke-virtual { v0, v8 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L4
  .line 693
    add-int/lit8 v7, v7, 1
    goto :L3
  :L5
  .line 699
    if-eqz v4, :L9
  :L6
    invoke-interface { v4 }, Landroid/database/Cursor;->close()V
  :L7
    goto :L9
  :L8
  .line 700
    move-exception v3
  .line 702
    goto :L10
  :L9
  .line 701
    nop
  :L10
  .line 703
    if-ge v7, v6, :L11
    return-object v0
  :L11
  .line 704
    goto :L0
  :L12
  .line 695
    move-exception v0
    goto :L14
  :L13
    move-exception v0
    move-object v4, v3
  :L14
  .line 696
    nop
  .line 699
    if-eqz v4, :L18
  :L15
    invoke-interface { v4 }, Landroid/database/Cursor;->close()V
  :L16
    goto :L18
  :L17
  .line 700
    move-exception v0
    goto :L19
  :L18
  .line 701
    nop
  :L19
  .line 696
    return-object v3
.end method

.method public static pinyin(Lcom/innioasis/y1/utils/HanziToPinyin;Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L1 .. :L2 } :L7
  .catchall { :L4 .. :L6 } :L5
  .catchall { :L8 .. :L9 } :L7
  .registers 4
  .line 202
    sget-object v0, Lcom/innioasis/ipp/Scan;->py:Ljava/util/HashMap;
  .line 203
    if-eqz v0, :L10
    if-nez p1, :L0
    goto :L10
  :L0
  .line 205
    monitor-enter v0
  :L1
  .line 206
    invoke-virtual { v0, p1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/lang/String;
  .line 207
    monitor-exit v0
  :L2
  .line 208
    if-eqz v1, :L3
    return-object v1
  :L3
  .line 209
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/utils/HanziToPinyin;->getString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 210
    monitor-enter v0
  :L4
  .line 211
    invoke-virtual { v0, p1, p0 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 212
    monitor-exit v0
  .line 213
    return-object p0
  :L5
  .line 212
    move-exception p0
    monitor-exit v0
  :L6
    throw p0
  :L7
  .line 207
    move-exception p0
  :L8
    monitor-exit v0
  :L9
    throw p0
  :L10
  .line 203
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/utils/HanziToPinyin;->getString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static pool()I
  .registers 2
  .line 866
    invoke-static { }, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/Runtime;->availableProcessors()I
    move-result v0
  .line 867
    add-int/lit8 v0, v0, 1
  .line 868
    const/4 v1, 3
    if-le v0, v1, :L0
    const/4 v0, 3
  :L0
  .line 869
    return v0
.end method

.method private static queue([Ljava/io/File;)V
  .catchall { :L1 .. :L2 } :L5
  .catchall { :L9 .. :L10 } :L16
  .catchall { :L11 .. :L15 } :L14
  .catchall { :L17 .. :L18 } :L16
  .registers 7
  .line 754
    nop
  .line 755
    const/4 v0, 0
    const/4 v1, 0
    const/4 v2, 0
  :L0
    array-length v3, p0
    if-ge v2, v3, :L7
  .line 756
    aget-object v3, p0, v2
  .line 758
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
  .line 761
    nop
  .line 762
    if-nez v0, :L4
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  :L4
  .line 763
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L6
  :L5
  .line 759
    move-exception v3
  .line 760
    nop
  :L6
  .line 755
    add-int/lit8 v2, v2, 1
    goto :L0
  :L7
  .line 765
    if-nez v0, :L8
    return-void
  :L8
  .line 766
    const-class p0, Lcom/innioasis/ipp/Scan;
    monitor-enter p0
  :L9
  .line 767
    sget v2, Lcom/innioasis/ipp/Scan;->queued:I
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v3
    add-int/2addr v2, v3
    sput v2, Lcom/innioasis/ipp/Scan;->queued:I
  .line 768
    monitor-exit p0
  :L10
  .line 769
    sget-object v2, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    monitor-enter v2
  .line 770
    nop
  .line 771
    const/4 p0, 0
  :L11
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge v1, v3, :L12
  .line 772
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Ljava/io/File;
  .line 773
    sget-object v3, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
    invoke-virtual { p0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v4
    sget-object v5, Lcom/innioasis/ipp/Scan;->upcoming:Ljava/util/ArrayList;
    invoke-virtual { v5 }, Ljava/util/ArrayList;->size()I
    move-result v5
    invoke-static { v5 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v5
    invoke-virtual { v3, v4, v5 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 774
    sget-object v3, Lcom/innioasis/ipp/Scan;->upcoming:Ljava/util/ArrayList;
    invoke-virtual { v3, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 775
    nop
  .line 771
    add-int/lit8 v1, v1, 1
    const/4 p0, 1
    goto :L11
  :L12
  .line 777
    if-eqz p0, :L13
    sget-object p0, Lcom/innioasis/ipp/Scan;->repo:Lcom/innioasis/y1/database/Y1Repository;
    if-eqz p0, :L13
  .line 778
    invoke-static { }, Lcom/innioasis/ipp/Scan;->start()V
  .line 779
    sget-object p0, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    invoke-virtual { p0 }, Ljava/lang/Object;->notifyAll()V
  :L13
  .line 781
    monitor-exit v2
  .line 782
    return-void
  :L14
  .line 781
    move-exception p0
    monitor-exit v2
  :L15
    throw p0
  :L16
  .line 768
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
  .line 472
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 473
    const-class v1, Lcom/innioasis/ipp/Scan;
    monitor-enter v1
  :L0
  .line 474
    sget-object v2, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
    if-nez v2, :L1
    invoke-interface { p0 }, Lcom/innioasis/y1/database/SongDao;->getSongsSync()Ljava/util/List;
    move-result-object p0
    monitor-exit v1
    return-object p0
  :L1
  .line 475
    sget-object v2, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
    invoke-virtual { v2 }, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;
    move-result-object v2
  :L2
  .line 476
    invoke-interface { v2 }, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :L4
  .line 477
    invoke-interface { v2 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
  .line 478
    sget-object v4, Lcom/innioasis/ipp/Scan;->met:Ljava/util/HashSet;
    invoke-virtual { v4, v3 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v4
    if-nez v4, :L3
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 479
    goto :L2
  :L4
  .line 480
    monitor-exit v1
  :L5
  .line 481
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Scan;->tailStarts(I)V
  .line 482
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-eqz v1, :L6
    return-object v0
  :L6
  .line 484
    invoke-static { v0 }, Lcom/innioasis/ipp/Scan;->drop(Ljava/util/List;)V
  .line 485
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  :L7
    return-object v1
  :L8
  .line 486
    move-exception v1
  .line 487
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
  .line 490
    new-instance v1, Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v2
    invoke-direct { v1, v2 }, Ljava/util/ArrayList;-><init>(I)V
  .line 491
    const/4 v2, 0
  :L9
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge v2, v3, :L11
  .line 492
    invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
    invoke-interface { p0, v3 }, Lcom/innioasis/y1/database/SongDao;->getSongByPathSyncDB(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object v3
  .line 493
    if-eqz v3, :L10
    invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L10
  .line 491
    add-int/lit8 v2, v2, 1
    goto :L9
  :L11
  .line 495
    return-object v1
  :L12
  .line 480
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
  .line 282
    const/16 v0, 99
    if-le p0, v0, :L0
    const/16 p0, 99
  :L0
  .line 283
    sget v0, Lcom/innioasis/ipp/Scan;->shown:I
    if-gt p0, v0, :L1
    return-void
  :L1
  .line 284
    sput p0, Lcom/innioasis/ipp/Scan;->shown:I
  .line 285
    invoke-static { p0 }, Lcom/innioasis/ipp/Loading;->scannedPercent(I)V
  .line 286
    return-void
.end method

.method public static skip(ZLjava/lang/String;)Z
  .registers 2
  .line 440
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
  .registers 3
  .line 786
    nop
  :L0
  .line 788
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Scan;->take(Lcom/innioasis/y1/database/Y1Repository;Ljava/io/File;)Lcom/innioasis/y1/database/Song;
    move-result-object v0
  :L1
  .line 791
    goto :L3
  :L2
  .line 789
    move-exception v0
  .line 790
    const/4 v0, 0
  :L3
  .line 792
    if-nez v0, :L4
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/database/Y1Repository;->fileToSong(Ljava/io/File;)Lcom/innioasis/y1/database/Song;
    move-result-object v0
  :L4
  .line 793
    invoke-static { v0 }, Lcom/innioasis/ipp/Scan;->built(Lcom/innioasis/y1/database/Song;)V
  .line 794
    return-object v0
.end method

.method private static songFile(Ljava/io/File;)Z
  .registers 3
  .line 742
    invoke-virtual { p0 }, Ljava/io/File;->isHidden()Z
    move-result v0
    const/4 v1, 0
    if-eqz v0, :L0
    return v1
  :L0
  .line 743
    invoke-virtual { p0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v0
  .line 744
    if-nez v0, :L1
    return v1
  :L1
  .line 745
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->extOf(Ljava/io/File;)Ljava/lang/String;
    move-result-object p0
  .line 746
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
  .line 858
    invoke-static { }, Lcom/innioasis/ipp/Scan;->pool()I
    move-result v0
  :L0
  .line 859
    sget v1, Lcom/innioasis/ipp/Scan;->live:I
    if-ge v1, v0, :L1
  .line 860
    add-int/lit8 v1, v1, 1
    sput v1, Lcom/innioasis/ipp/Scan;->live:I
  .line 861
    new-instance v1, Ljava/lang/Thread;
    new-instance v2, Lcom/innioasis/ipp/Scan$Builder;
    invoke-direct { v2 }, Lcom/innioasis/ipp/Scan$Builder;-><init>()V
    invoke-direct { v1, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v1 }, Ljava/lang/Thread;->start()V
    goto :L0
  :L1
  .line 863
    return-void
.end method

.method public static stays(Lcom/innioasis/y1/database/Song;)Z
  .catchall { :L2 .. :L3 } :L11
  .catchall { :L7 .. :L9 } :L8
  .catchall { :L12 .. :L13 } :L11
  .registers 4
  .line 449
    const/4 v0, 1
    if-nez p0, :L0
    return v0
  :L0
  .line 450
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
  .line 451
    if-nez p0, :L1
    return v0
  :L1
  .line 453
    const-class v1, Lcom/innioasis/ipp/Scan;
    monitor-enter v1
  :L2
  .line 454
    sget-object v2, Lcom/innioasis/ipp/Scan;->met:Ljava/util/HashSet;
    invoke-virtual { v2, p0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v2
  .line 455
    monitor-exit v1
  :L3
  .line 456
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
  .line 457
    if-nez p0, :L10
  .line 458
    const-class v1, Lcom/innioasis/ipp/Scan;
    monitor-enter v1
  :L7
  .line 459
    sput-boolean v0, Lcom/innioasis/ipp/Scan;->wrote:Z
  .line 460
    monitor-exit v1
    goto :L10
  :L8
    move-exception p0
    monitor-exit v1
  :L9
    throw p0
  :L10
  .line 462
    return p0
  :L11
  .line 455
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
  .line 639
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
  .line 640
    sget-object v3, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
  .line 641
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
  .line 642
    sput-wide v1, Lcom/innioasis/ipp/Scan;->asked:J
  :L3
  .line 643
    monitor-exit v0
    return-object v3
  :L4
  .line 638
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method static declared-synchronized tailEnds()V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  .line 314
    const/4 v1, 0
  :L0
    sput-object v1, Lcom/innioasis/ipp/Scan;->tailThread:Ljava/lang/Thread;
  .line 315
    const-wide/16 v1, 0
    sput-wide v1, Lcom/innioasis/ipp/Scan;->tailLoad:J
    sput-wide v1, Lcom/innioasis/ipp/Scan;->tailDone:J
    sput-wide v1, Lcom/innioasis/ipp/Scan;->tailWork:J
  :L1
  .line 316
    monitor-exit v0
    return-void
  :L2
  .line 313
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
  .line 290
    sget v1, Lcom/innioasis/ipp/Scan;->expected:I
  :L1
    if-nez v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 291
    invoke-static { }, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object v1
    sput-object v1, Lcom/innioasis/ipp/Scan;->tailThread:Ljava/lang/Thread;
  .line 292
    sget v1, Lcom/innioasis/ipp/Scan;->shown:I
    const/4 v2, 0
    invoke-static { v1, v2 }, Ljava/lang/Math;->max(II)I
    move-result v1
    sput v1, Lcom/innioasis/ipp/Scan;->tailFrom:I
  .line 293
    const-wide/16 v1, 0
    sput-wide v1, Lcom/innioasis/ipp/Scan;->tailDone:J
  .line 294
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
  .line 295
    const-wide/16 v3, 7
    int-to-long v5, p0
    mul-long v5, v5, v3
    add-long/2addr v5, v1
    sput-wide v5, Lcom/innioasis/ipp/Scan;->tailWork:J
  :L5
  .line 296
    monitor-exit v0
    return-void
  :L6
  .line 289
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
  .line 299
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
  .line 300
    sget-wide v3, Lcom/innioasis/ipp/Scan;->tailDone:J
    add-long/2addr v3, p0
    sput-wide v3, Lcom/innioasis/ipp/Scan;->tailDone:J
  .line 301
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
  .line 302
    monitor-exit v0
    return-void
  :L3
  .line 299
    monitor-exit v0
    return-void
  :L4
  .line 298
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method private static take(Lcom/innioasis/y1/database/Y1Repository;Ljava/io/File;)Lcom/innioasis/y1/database/Song;
  .catchall { :L1 .. :L8 } :L14
  .catchall { :L9 .. :L10 } :L11
  .catchall { :L12 .. :L15 } :L14
  .registers 10
  .line 799
    invoke-virtual { p1 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object p1
  .line 800
    const/4 v0, 0
    if-nez p1, :L0
    return-object v0
  :L0
  .line 802
    sget-object v1, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    monitor-enter v1
  :L1
  .line 803
    sget-object v2, Lcom/innioasis/ipp/Scan;->repo:Lcom/innioasis/y1/database/Y1Repository;
    if-nez v2, :L2
  .line 804
    sput-object p0, Lcom/innioasis/ipp/Scan;->repo:Lcom/innioasis/y1/database/Y1Repository;
  .line 805
    invoke-static { }, Lcom/innioasis/ipp/Scan;->start()V
  .line 806
    invoke-virtual { v1 }, Ljava/lang/Object;->notifyAll()V
  :L2
  .line 808
    sget-object p0, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
    invoke-virtual { p0, p1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 809
    if-nez p0, :L3
    const/4 p0, -1
    goto :L4
  :L3
    check-cast p0, Ljava/lang/Integer;
    invoke-virtual { p0 }, Ljava/lang/Integer;->intValue()I
    move-result p0
  :L4
  .line 810
    sget v2, Lcom/innioasis/ipp/Scan;->cursor:I
    if-ge p0, v2, :L5
  .line 811
    monitor-exit v1
    return-object v0
  :L5
  .line 813
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->pass(I)V
  .line 814
    sget v2, Lcom/innioasis/ipp/Scan;->next:I
    if-lt p0, v2, :L6
  .line 815
    add-int/lit8 p0, p0, 1
    sput p0, Lcom/innioasis/ipp/Scan;->next:I
  .line 816
    sget-object p0, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
    invoke-virtual { p0, p1 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 817
    invoke-static { }, Lcom/innioasis/ipp/Scan;->start()V
  .line 818
    invoke-virtual { v1 }, Ljava/lang/Object;->notifyAll()V
  .line 819
    monitor-exit v1
    return-object v0
  :L6
  .line 821
    sget-object p0, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
    invoke-virtual { p0, p1 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/database/Song;
  .line 822
    if-nez p0, :L13
    sget-object v0, Lcom/innioasis/ipp/Scan;->building:Ljava/util/HashSet;
    invoke-virtual { v0, p1 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L13
  .line 824
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    const-wide/16 v4, 20000
    add-long/2addr v2, v4
  :L7
  .line 825
    sget-object p0, Lcom/innioasis/ipp/Scan;->building:Ljava/util/HashSet;
    invoke-virtual { p0, p1 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L12
  .line 826
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
  :L8
    sub-long v4, v2, v4
  .line 827
    const-wide/16 v6, 0
    cmp-long p0, v4, v6
    if-gtz p0, :L9
    goto :L12
  :L9
  .line 829
    sget-object p0, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    invoke-virtual { p0, v4, v5 }, Ljava/lang/Object;->wait(J)V
  :L10
  .line 832
    nop
  .line 833
    goto :L7
  :L11
  .line 830
    move-exception p0
  .line 831
    nop
  :L12
  .line 834
    sget-object p0, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
    invoke-virtual { p0, p1 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/database/Song;
  :L13
  .line 836
    sget-object v0, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
    invoke-virtual { v0, p1 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 837
    sget-object p1, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    invoke-virtual { p1 }, Ljava/lang/Object;->notifyAll()V
  .line 838
    monitor-exit v1
    return-object p0
  :L14
  .line 839
    move-exception p0
    monitor-exit v1
  :L15
    goto :L17
  :L16
    throw p0
  :L17
    goto :L16
.end method

.method static declared-synchronized takeCardAway()Z
  .catchall { :L0 .. :L1 } :L2
  .registers 3
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L0
  .line 79
    sget-boolean v1, Lcom/innioasis/ipp/Scan;->cardAway:Z
  .line 80
    const/4 v2, 0
    sput-boolean v2, Lcom/innioasis/ipp/Scan;->cardAway:Z
  :L1
  .line 81
    monitor-exit v0
    return v1
  :L2
  .line 78
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method public static themes(Ljava/lang/String;)Z
  .registers 7
  .line 433
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
  .line 564
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L0
  .line 565
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
  .line 566
    monitor-exit v0
  :L2
  .line 567
    if-nez p0, :L3
    const/4 p0, 0
    goto :L4
  :L3
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result p0
  :L4
    return p0
  :L5
  .line 566
    move-exception p0
  :L6
    monitor-exit v0
  :L7
    throw p0
.end method

.method private static under(Ljava/lang/String;Ljava/lang/String;)Z
  .registers 10
  .line 597
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 598
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v7
  .line 599
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
  .line 600
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
  .line 428
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
  .line 256
    sget v0, Lcom/innioasis/ipp/Scan;->expected:I
    if-nez v0, :L0
    return-void
  :L0
  .line 257
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
  .line 258
    if-lez v3, :L1
    add-int/2addr v2, v3
    int-to-long v2, v2
    const-wide/16 v4, 6
    mul-long v2, v2, v4
    add-long/2addr v0, v2
  :L1
  .line 259
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
  .line 260
    return-void
.end method

.method private static write(Lcom/innioasis/y1/database/SongDao;[Lcom/innioasis/y1/database/Song;)V
  .catchall { :L1 .. :L2 } :L3
  .registers 5
  .line 182
    const/4 v0, 0
  :L0
    const/4 v1, 3
    if-ge v0, v1, :L4
  :L1
  .line 184
    invoke-interface { p0, p1 }, Lcom/innioasis/y1/database/SongDao;->insert([Lcom/innioasis/y1/database/Song;)V
  .line 185
    invoke-static { }, Lcom/innioasis/ipp/Ipp;->libraryChanged()V
  :L2
  .line 186
    return-void
  :L3
  .line 187
    move-exception v1
  .line 188
    const-wide/16 v1, 1000
    invoke-static { v1, v2 }, Landroid/os/SystemClock;->sleep(J)V
  .line 182
    add-int/lit8 v0, v0, 1
    goto :L0
  :L4
  .line 191
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
  .line 192
    return-void
.end method
