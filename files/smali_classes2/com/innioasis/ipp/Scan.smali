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

.field private final static otherExt:Ljava/util/HashSet;

.field private static othersListed:I

.field private static othersSeen:I

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
  .registers 24
  .line 143
    new-instance v0, Ljava/util/LinkedList;
    invoke-direct { v0 }, Ljava/util/LinkedList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->WRITES:Ljava/util/LinkedList;
  .line 242
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Scan;->shown:I
  .line 334
    const/16 v0, 22
    new-array v0, v0, [Ljava/lang/String;
    const/4 v1, 0
    const-string v2, "ogg"
    aput-object v2, v0, v1
    const/4 v3, 1
    const-string v4, "mp3"
    aput-object v4, v0, v3
    const-string v5, "amr"
    const/4 v6, 2
    aput-object v5, v0, v6
    const-string v5, "ape"
    const/4 v7, 3
    aput-object v5, v0, v7
    const-string v5, "flac"
    const/4 v8, 4
    aput-object v5, v0, v8
    const-string v5, "wav"
    const/4 v9, 5
    aput-object v5, v0, v9
    const-string v5, "wma"
    const/4 v10, 6
    aput-object v5, v0, v10
    const-string v5, "aac"
    const/4 v11, 7
    aput-object v5, v0, v11
    const-string v5, "m4r"
    const/16 v12, 8
    aput-object v5, v0, v12
    const-string v5, "mmf"
    const/16 v13, 9
    aput-object v5, v0, v13
    const-string v5, "mp2"
    const/16 v14, 10
    aput-object v5, v0, v14
    const-string v5, "wv"
    const/16 v15, 11
    aput-object v5, v0, v15
    const-string v5, "m4a"
    const/16 v16, 12
    aput-object v5, v0, v16
    const-string v5, "mid"
    const/16 v17, 13
    aput-object v5, v0, v17
    const-string v5, "aiff"
    const/16 v18, 14
    aput-object v5, v0, v18
    const-string v5, "au"
    const/16 v19, 15
    aput-object v5, v0, v19
    const-string v5, "mka"
    const/16 v20, 16
    aput-object v5, v0, v20
    const-string v5, "ra"
    const/16 v21, 17
    aput-object v5, v0, v21
    const-string v5, "ac3"
    const/16 v22, 18
    aput-object v5, v0, v22
    const-string v5, "aif"
    const/16 v15, 19
    aput-object v5, v0, v15
    const/16 v5, 20
    const-string v23, "caf"
    aput-object v23, v0, v5
    const/16 v5, 21
    const-string v23, "3gpp"
    aput-object v23, v0, v5
    sput-object v0, Lcom/innioasis/ipp/Scan;->MUSIC:[Ljava/lang/String;
  .line 336
    new-array v5, v5, [Ljava/lang/String;
    aput-object v2, v5, v1
    aput-object v4, v5, v3
    const-string v2, "amr"
    aput-object v2, v5, v6
    const-string v2, "ape"
    aput-object v2, v5, v7
    const-string v2, "flac"
    aput-object v2, v5, v8
    const-string v2, "wav"
    aput-object v2, v5, v9
    const-string v2, "wma"
    aput-object v2, v5, v10
    const-string v2, "aac"
    aput-object v2, v5, v11
    const-string v2, "m4r"
    aput-object v2, v5, v12
    const-string v2, "mmf"
    aput-object v2, v5, v13
    const-string v2, "mp2"
    aput-object v2, v5, v14
    const-string v2, "wv"
    const/16 v4, 11
    aput-object v2, v5, v4
    const-string v2, "m4a"
    aput-object v2, v5, v16
    const-string v2, "aiff"
    aput-object v2, v5, v17
    const-string v2, "au"
    aput-object v2, v5, v18
    const-string v2, "mka"
    aput-object v2, v5, v19
    const-string v2, "ra"
    aput-object v2, v5, v20
    const-string v2, "ac3"
    aput-object v2, v5, v21
    const-string v2, "aif"
    aput-object v2, v5, v22
    const-string v2, "caf"
    aput-object v2, v5, v15
    const/16 v2, 20
    const-string v4, "3gpp"
    aput-object v4, v5, v2
    sput-object v5, Lcom/innioasis/ipp/Scan;->BOOK:[Ljava/lang/String;
  .line 338
    new-array v2, v10, [Ljava/lang/String;
    const-string v4, "mp4"
    aput-object v4, v2, v1
    const-string v4, "mov"
    aput-object v4, v2, v3
    const-string v4, "wmv"
    aput-object v4, v2, v6
    const-string v4, "flv"
    aput-object v4, v2, v7
    const-string v4, "avi"
    aput-object v4, v2, v8
    const-string v4, "mkv"
    aput-object v4, v2, v9
    sput-object v2, Lcom/innioasis/ipp/Scan;->VIDEO:[Ljava/lang/String;
  .line 340
    new-instance v4, Ljava/util/HashSet;
    invoke-static { v0 }, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Formats;->more(Ljava/util/List;)Ljava/util/List;
    move-result-object v0
    invoke-direct { v4, v0 }, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V
    sput-object v4, Lcom/innioasis/ipp/Scan;->musicExt:Ljava/util/HashSet;
  .line 341
    new-instance v0, Ljava/util/HashSet;
    invoke-static { v5 }, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;
    move-result-object v4
    invoke-static { v4 }, Lcom/innioasis/ipp/Formats;->more(Ljava/util/List;)Ljava/util/List;
    move-result-object v4
    invoke-direct { v0, v4 }, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V
    sput-object v0, Lcom/innioasis/ipp/Scan;->bookExt:Ljava/util/HashSet;
  .line 342
    new-instance v0, Ljava/util/HashSet;
    invoke-static { v2 }, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;
    move-result-object v2
    invoke-direct { v0, v2 }, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V
    sput-object v0, Lcom/innioasis/ipp/Scan;->videoExt:Ljava/util/HashSet;
  .line 372
    new-instance v0, Ljava/util/HashSet;
    new-array v2, v15, [Ljava/lang/String;
    const-string v4, "txt"
    aput-object v4, v2, v1
    const-string v1, "epub"
    aput-object v1, v2, v3
    const-string v1, "lrc"
    aput-object v1, v2, v6
    const-string v1, "jpg"
    aput-object v1, v2, v7
    const-string v1, "jpeg"
    aput-object v1, v2, v8
    const-string v1, "png"
    aput-object v1, v2, v9
    const-string v1, "bmp"
    aput-object v1, v2, v10
    const-string v1, "gif"
    aput-object v1, v2, v11
    const-string v1, "webp"
    aput-object v1, v2, v12
    const-string v1, "cue"
    aput-object v1, v2, v13
    const-string v1, "m3u"
    aput-object v1, v2, v14
    const-string v1, "m3u8"
    const/16 v3, 11
    aput-object v1, v2, v3
    const-string v1, "nfo"
    aput-object v1, v2, v16
    const-string v1, "log"
    aput-object v1, v2, v17
    const-string v1, "pdf"
    aput-object v1, v2, v18
    const-string v1, "json"
    aput-object v1, v2, v19
    const-string v1, "ini"
    aput-object v1, v2, v20
    const-string v1, "db"
    aput-object v1, v2, v21
    const-string v1, "zip"
    aput-object v1, v2, v22
    invoke-static { v2 }, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;
    move-result-object v1
    invoke-direct { v0, v1 }, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V
    sput-object v0, Lcom/innioasis/ipp/Scan;->otherExt:Ljava/util/HashSet;
  .line 413
    new-instance v0, Ljava/util/LinkedList;
    invoke-direct { v0 }, Ljava/util/LinkedList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->AHEAD:Ljava/util/LinkedList;
  .line 607
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->met:Ljava/util/HashSet;
  .line 631
    new-instance v0, Lcom/innioasis/y1/database/Song;
    invoke-direct { v0 }, Lcom/innioasis/y1/database/Song;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->MARKER:Lcom/innioasis/y1/database/Song;
  .line 754
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
  .line 760
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->upcoming:Ljava/util/ArrayList;
  .line 761
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
  .line 766
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
  .line 767
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
  .line 445
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
  .line 600
    const/4 v1, 1
  :L0
    sput-boolean v1, Lcom/innioasis/ipp/Scan;->wrote:Z
  .line 601
    sget-object v2, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
  .line 602
    if-eqz p0, :L3
    if-nez v2, :L1
    goto :L3
  :L1
  .line 603
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v2, p0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result p0
    if-nez p0, :L2
    sget p0, Lcom/innioasis/ipp/Scan;->added:I
    add-int/2addr p0, v1
    sput p0, Lcom/innioasis/ipp/Scan;->added:I
  :L2
  .line 604
    monitor-exit v0
    return-void
  :L3
  .line 602
    monitor-exit v0
    return-void
  :L4
  .line 599
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method public static busy()Z
  .registers 1
  .line 86
    sget-object v0, Lcom/innioasis/ipp/Scan;->walker:Ljava/lang/Thread;
  .line 87
    if-eqz v0, :L0
    invoke-virtual { v0 }, Ljava/lang/Thread;->isAlive()Z
    move-result v0
    if-eqz v0, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    return v0
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
  .line 224
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
  .line 224
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
  .line 248
    sget v1, Lcom/innioasis/ipp/Scan;->seen:I
    add-int/lit8 v1, v1, 1
    sput v1, Lcom/innioasis/ipp/Scan;->seen:I
  .line 249
    sget-wide v2, Lcom/innioasis/ipp/Scan;->units:J
    if-eqz p0, :L1
    const-wide/16 v4, 4
    goto :L2
  :L1
    const-wide/16 v4, 22
  :L2
    add-long/2addr v2, v4
    sput-wide v2, Lcom/innioasis/ipp/Scan;->units:J
  .line 250
    sget p0, Lcom/innioasis/ipp/Scan;->expected:I
    if-nez p0, :L6
  .line 251
    div-int/lit8 p0, v1, 16
  .line 252
    sget v2, Lcom/innioasis/ipp/Scan;->shown:I
  :L3
    if-ne p0, v2, :L4
    monitor-exit v0
    return-void
  :L4
  .line 253
    sput p0, Lcom/innioasis/ipp/Scan;->shown:I
  .line 254
    invoke-static { v1 }, Lcom/innioasis/ipp/Loading;->scanned(I)V
  :L5
  .line 255
    monitor-exit v0
    return-void
  :L6
  .line 257
    invoke-static { }, Lcom/innioasis/ipp/Scan;->walkShown()V
  :L7
  .line 258
    monitor-exit v0
    return-void
  :L8
  .line 247
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method public static dir(Ljava/io/File;)Z
  .registers 1
  .line 387
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
  .line 282
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
  .line 283
    invoke-virtual { p0 }, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;
    move-result-object p0
  :L0
  .line 284
    invoke-interface { p0 }, Ljava/util/Iterator;->hasNext()Z
    move-result v1
    if-eqz v1, :L3
  .line 285
    invoke-interface { p0 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/lang/String;
  .line 286
    const/16 v2, 47
    invoke-virtual { v1, v2 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v3
  :L1
  .line 287
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
  .line 288
    goto :L0
  :L3
  .line 289
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
  .line 653
    invoke-static { }, Lcom/innioasis/ipp/Tone;->recheck()V
  .line 654
    const/4 v1, 0
    sput-object v1, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
  .line 655
    const/4 v2, 0
    sput v2, Lcom/innioasis/ipp/Scan;->added:I
  .line 656
    sput v2, Lcom/innioasis/ipp/Scan;->dropped:I
  .line 657
    new-instance v3, Ljava/util/HashSet;
    invoke-direct { v3 }, Ljava/util/HashSet;-><init>()V
    sput-object v3, Lcom/innioasis/ipp/Scan;->met:Ljava/util/HashSet;
  .line 658
    sput-boolean v2, Lcom/innioasis/ipp/Scan;->marked:Z
  .line 659
    sput-boolean v2, Lcom/innioasis/ipp/Scan;->wrote:Z
  .line 660
    sput-object v1, Lcom/innioasis/ipp/Scan;->walker:Ljava/lang/Thread;
  .line 661
    sput-object v1, Lcom/innioasis/ipp/Scan;->py:Ljava/util/HashMap;
  .line 662
    invoke-static { }, Lcom/innioasis/ipp/Scan;->forgetQueue()V
  :L1
  .line 663
    monitor-exit v0
    return-void
  :L2
  .line 652
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
  .line 531
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0, p0 }, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V
  .line 532
    new-instance p0, Ljava/util/ArrayList;
    invoke-direct { p0 }, Ljava/util/ArrayList;-><init>()V
  .line 533
    const-wide/16 v1, -1
  :L0
  .line 535
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
  .line 537
    const/4 v4, 0
    const/4 v6, 0
  :L1
  .line 539
    invoke-interface { v3 }, Landroid/database/Cursor;->moveToNext()Z
    move-result v7
    const/4 v8, 1
    if-eqz v7, :L6
  .line 540
    invoke-interface { v3, v4 }, Landroid/database/Cursor;->getLong(I)J
    move-result-wide v1
  .line 541
    add-int/lit8 v6, v6, 1
  .line 542
    invoke-interface { v3, v8 }, Landroid/database/Cursor;->isNull(I)Z
    move-result v7
    if-eqz v7, :L2
    goto :L1
  :L2
  .line 543
    invoke-interface { v3, v8 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v7
  .line 544
    invoke-virtual { v0, v7 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v8
    if-nez v8, :L3
    goto :L1
  :L3
  .line 545
    new-instance v8, Lcom/innioasis/y1/database/Song;
    invoke-direct { v8 }, Lcom/innioasis/y1/database/Song;-><init>()V
  .line 546
    invoke-virtual { v8, v7 }, Lcom/innioasis/y1/database/Song;->setPath(Ljava/lang/String;)V
  .line 547
    invoke-static { v8 }, Lcom/innioasis/ipp/Scan;->stays(Lcom/innioasis/y1/database/Song;)Z
    move-result v7
    if-nez v7, :L4
    invoke-static { v1, v2 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v7
    invoke-virtual { p0, v7 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L4
  .line 548
    const-wide/16 v7, 7
    invoke-static { v7, v8 }, Lcom/innioasis/ipp/Scan;->tailStep(J)V
  :L5
  .line 549
    goto :L1
  :L6
  .line 551
    invoke-interface { v3 }, Landroid/database/Cursor;->close()V
  .line 552
    nop
  .line 553
    if-ge v6, v5, :L23
  .line 555
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->db()Landroidx/room/RoomDatabase;
    move-result-object v0
  .line 556
    nop
  .line 557
    const/4 v1, 0
  :L7
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result v2
    if-ge v4, v2, :L21
  :L8
  .line 558
    sget-object v2, Lcom/innioasis/music/objects/Global;->INSTANCE:Lcom/innioasis/music/objects/Global;
    invoke-virtual { v2 }, Lcom/innioasis/music/objects/Global;->getScanLock()Z
    move-result v2
    if-eqz v2, :L9
    const-wide/16 v2, 100
    invoke-static { v2, v3 }, Ljava/lang/Thread;->sleep(J)V
    goto :L8
  :L9
  .line 559
    sget-object v2, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v2 }, Lcom/innioasis/music/util/Other;->sdCardIsReady()Z
    move-result v2
    if-nez v2, :L10
    goto :L21
  :L10
  .line 560
    invoke-virtual { p0 }, Ljava/util/ArrayList;->size()I
    move-result v2
    add-int/lit16 v3, v4, 500
    invoke-static { v2, v3 }, Ljava/lang/Math;->min(II)I
    move-result v2
  .line 561
    invoke-virtual { v0 }, Landroidx/room/RoomDatabase;->beginTransaction()V
  :L11
  .line 563
    const-string v5, "delete from song where rowid = ?"
    invoke-virtual { v0, v5 }, Landroidx/room/RoomDatabase;->compileStatement(Ljava/lang/String;)Landroidx/sqlite/db/SupportSQLiteStatement;
    move-result-object v5
  .line 564
    move v6, v4
  :L12
    if-ge v6, v2, :L13
  .line 565
    invoke-virtual { p0, v6 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v7
    check-cast v7, Ljava/lang/Long;
    invoke-virtual { v7 }, Ljava/lang/Long;->longValue()J
    move-result-wide v9
    invoke-interface { v5, v8, v9, v10 }, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V
  .line 566
    invoke-interface { v5 }, Landroidx/sqlite/db/SupportSQLiteStatement;->executeUpdateDelete()I
  .line 567
    invoke-interface { v5 }, Landroidx/sqlite/db/SupportSQLiteStatement;->clearBindings()V
  .line 564
    add-int/lit8 v6, v6, 1
    goto :L12
  :L13
  .line 569
    invoke-virtual { v0 }, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
  :L14
  .line 571
    invoke-virtual { v0 }, Landroidx/room/RoomDatabase;->endTransaction()V
  .line 572
    nop
  .line 573
    sub-int/2addr v2, v4
    add-int/2addr v1, v2
  .line 574
    const-class v4, Lcom/innioasis/ipp/Scan;
    monitor-enter v4
  :L15
  .line 575
    sget v5, Lcom/innioasis/ipp/Scan;->dropped:I
    add-int/2addr v5, v2
    sput v5, Lcom/innioasis/ipp/Scan;->dropped:I
  .line 576
    monitor-exit v4
  :L16
  .line 577
    sget-object v4, Lcom/innioasis/music/objects/Global;->INSTANCE:Lcom/innioasis/music/objects/Global;
  .line 578
    invoke-virtual { v4 }, Lcom/innioasis/music/objects/Global;->getScanDeletedCount()I
    move-result v5
    add-int/2addr v5, v2
    invoke-virtual { v4, v5 }, Lcom/innioasis/music/objects/Global;->setScanDeletedCount(I)V
  .line 557
    move v4, v3
    goto :L7
  :L17
  .line 576
    move-exception p0
  :L18
    monitor-exit v4
  :L19
    throw p0
  :L20
  .line 571
    move-exception p0
    invoke-virtual { v0 }, Landroidx/room/RoomDatabase;->endTransaction()V
  .line 572
    throw p0
  :L21
  .line 580
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
  .line 581
    if-lez v1, :L22
    invoke-static { }, Lcom/innioasis/ipp/Ipp;->libraryChanged()V
  :L22
  .line 582
    return-void
  :L23
  .line 554
    goto/16 :L0
  :L24
  .line 551
    move-exception p0
    invoke-interface { v3 }, Landroid/database/Cursor;->close()V
  .line 552
    goto :L26
  :L25
    throw p0
  :L26
    goto :L25
.end method

.method public static exists(Ljava/io/File;)Z
  .registers 2
  .line 383
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
  .line 367
    invoke-virtual { p0 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object p0
  .line 368
    const/16 v0, 46
    invoke-virtual { p0, v0 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v0
  .line 369
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

.method public static fileExt(Ljava/lang/String;)Z
  .registers 2
  .line 378
    sget-object v0, Lcom/innioasis/ipp/Scan;->musicExt:Ljava/util/HashSet;
    invoke-virtual { v0, p0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    sget-object v0, Lcom/innioasis/ipp/Scan;->bookExt:Ljava/util/HashSet;
    invoke-virtual { v0, p0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    sget-object v0, Lcom/innioasis/ipp/Scan;->videoExt:Ljava/util/HashSet;
    invoke-virtual { v0, p0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :L1
    sget-object v0, Lcom/innioasis/ipp/Scan;->otherExt:Ljava/util/HashSet;
  .line 379
    invoke-virtual { v0, p0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L0
    goto :L1
  :L0
    const/4 p0, 0
    goto :L2
  :L1
    const/4 p0, 1
  :L2
  .line 378
    return p0
.end method

.method private static fill(Ljava/util/HashSet;Ljava/util/List;)V
  .registers 5
  .line 739
    if-nez p1, :L0
    return-void
  :L0
  .line 740
    const/4 v0, 0
  :L1
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v1
    if-ge v0, v1, :L4
  .line 741
    invoke-interface { p1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
  .line 742
    instance-of v2, v1, Lcom/innioasis/y1/database/Song;
    if-nez v2, :L2
    goto :L3
  :L2
  .line 743
    check-cast v1, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
  .line 744
    if-eqz v1, :L3
    invoke-virtual { p0, v1 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L3
  .line 740
    add-int/lit8 v0, v0, 1
    goto :L1
  :L4
  .line 746
    return-void
.end method

.method private static forgetQueue()V
  .catchall { :L0 .. :L2 } :L1
  .registers 2
  .line 903
    sget-object v0, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 904
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
    sput-object v1, Lcom/innioasis/ipp/Scan;->upcoming:Ljava/util/ArrayList;
  .line 905
    new-instance v1, Ljava/util/HashMap;
    invoke-direct { v1 }, Ljava/util/HashMap;-><init>()V
    sput-object v1, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
  .line 906
    new-instance v1, Ljava/util/HashMap;
    invoke-direct { v1 }, Ljava/util/HashMap;-><init>()V
    sput-object v1, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
  .line 907
    const/4 v1, 0
    sput v1, Lcom/innioasis/ipp/Scan;->cursor:I
  .line 908
    sput v1, Lcom/innioasis/ipp/Scan;->next:I
  .line 909
    const/4 v1, 0
    sput-object v1, Lcom/innioasis/ipp/Scan;->repo:Lcom/innioasis/y1/database/Y1Repository;
  .line 910
    invoke-virtual { v0 }, Ljava/lang/Object;->notifyAll()V
  .line 911
    monitor-exit v0
  .line 912
    return-void
  :L1
  .line 911
    move-exception v1
    monitor-exit v0
  :L2
    throw v1
.end method

.method static inDb(Ljava/lang/String;)Z
  .registers 3
  .line 642
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 643
    invoke-static { }, Lcom/innioasis/ipp/Scan;->table()Ljava/util/HashSet;
    move-result-object v1
  .line 644
    if-nez v1, :L1
    return v0
  :L1
  .line 645
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
  .line 103
    if-eqz p0, :L5
    if-nez p1, :L0
    goto :L5
  :L0
  .line 104
    sget-object v0, Lcom/innioasis/ipp/Scan;->WRITES:Ljava/util/LinkedList;
    monitor-enter v0
  .line 105
    const/4 v1, 2
  :L1
    new-array v1, v1, [Ljava/lang/Object;
    const/4 v2, 0
    aput-object p0, v1, v2
    const/4 p0, 1
    aput-object p1, v1, p0
    invoke-virtual { v0, v1 }, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V
  .line 106
    sget-boolean p1, Lcom/innioasis/ipp/Scan;->writing:Z
    if-nez p1, :L2
  .line 107
    sput-boolean p0, Lcom/innioasis/ipp/Scan;->writing:Z
  .line 108
    new-instance p0, Ljava/lang/Thread;
    new-instance p1, Lcom/innioasis/ipp/Scan$Writer;
    invoke-direct { p1 }, Lcom/innioasis/ipp/Scan$Writer;-><init>()V
    const-string v1, "ipp-scan-db"
    invoke-direct { p0, p1, v1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    invoke-virtual { p0 }, Ljava/lang/Thread;->start()V
  :L2
  .line 110
    invoke-virtual { v0 }, Ljava/lang/Object;->notifyAll()V
  .line 111
    monitor-exit v0
  .line 112
    return-void
  :L3
  .line 111
    move-exception p0
    monitor-exit v0
  :L4
    throw p0
  :L5
  .line 103
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
  .line 120
    sget-object v0, Lcom/innioasis/ipp/Scan;->WRITES:Ljava/util/LinkedList;
    monitor-enter v0
  :L0
  .line 121
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    const-wide/32 v3, 60000
    add-long/2addr v1, v3
  :L1
  .line 122
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
  .line 123
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
  :L4
    sub-long v4, v1, v4
  .line 124
    const-wide/16 v6, 0
    cmp-long v8, v4, v6
    if-gtz v8, :L5
    goto :L8
  :L5
  .line 126
    invoke-virtual { v3, v4, v5 }, Ljava/lang/Object;->wait(J)V
  :L6
  .line 129
    nop
  .line 130
    goto :L1
  :L7
  .line 127
    move-exception v1
  .line 128
    nop
  :L8
  .line 131
    monitor-exit v0
  :L9
  .line 134
    sget-object v1, Lcom/innioasis/ipp/Scan;->WRITES:Ljava/util/LinkedList;
    monitor-enter v1
  :L10
  .line 135
    invoke-virtual { v1 }, Ljava/util/LinkedList;->isEmpty()Z
    move-result v0
    if-eqz v0, :L12
    monitor-exit v1
  :L11
  .line 140
    invoke-interface { p0, p1 }, Lcom/innioasis/y1/database/SongDao;->insert([Lcom/innioasis/y1/database/Song;)V
  .line 141
    return-void
  :L12
  .line 136
    invoke-virtual { v1 }, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, [Ljava/lang/Object;
  .line 137
    monitor-exit v1
  :L13
  .line 138
    const/4 v1, 0
    aget-object v1, v0, v1
    check-cast v1, Lcom/innioasis/y1/database/SongDao;
    const/4 v2, 1
    aget-object v0, v0, v2
    check-cast v0, [Lcom/innioasis/y1/database/Song;
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Scan;->write(Lcom/innioasis/y1/database/SongDao;[Lcom/innioasis/y1/database/Song;)V
  .line 139
    goto :L9
  :L14
  .line 137
    move-exception p0
  :L15
    monitor-exit v1
  :L16
    throw p0
  :L17
  .line 131
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
  .registers 4
  .line 353
    sget-object v0, Lcom/innioasis/ipp/Scan;->node:Ljava/io/File;
    if-eq p0, v0, :L5
  .line 354
    nop
  .line 355
    invoke-virtual { p0 }, Ljava/io/File;->isFile()Z
    move-result v0
    const/4 v1, 1
    if-eqz v0, :L0
    const/4 v0, 1
    goto :L3
  :L0
  .line 356
    invoke-virtual { p0 }, Ljava/io/File;->isDirectory()Z
    move-result v0
    if-eqz v0, :L1
    const/4 v0, 3
    goto :L3
  :L1
  .line 357
    invoke-virtual { p0 }, Ljava/io/File;->exists()Z
    move-result v0
    if-eqz v0, :L2
    const/4 v0, 1
    goto :L3
  :L2
    const/4 v0, 0
  :L3
  .line 358
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->extOf(Ljava/io/File;)Ljava/lang/String;
    move-result-object v2
    sput-object v2, Lcom/innioasis/ipp/Scan;->ext:Ljava/lang/String;
  .line 359
    invoke-static { v2 }, Lcom/innioasis/ipp/Scan;->fileExt(Ljava/lang/String;)Z
    move-result v2
    if-nez v2, :L4
    sget v2, Lcom/innioasis/ipp/Scan;->othersSeen:I
    add-int/2addr v2, v1
    sput v2, Lcom/innioasis/ipp/Scan;->othersSeen:I
  :L4
  .line 360
    sput v0, Lcom/innioasis/ipp/Scan;->kind:I
  .line 361
    sput-object p0, Lcom/innioasis/ipp/Scan;->node:Ljava/io/File;
  :L5
  .line 363
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
  .catchall { :L4 .. :L7 } :L6
  .registers 4
  .line 396
    nop
  .line 397
    const/4 v0, 0
    const/4 v1, 0
  :L0
    if-eqz p0, :L2
    array-length v2, p0
    if-ge v0, v2, :L2
  .line 398
    aget-object v2, p0, v0
    if-eqz v2, :L1
    invoke-static { v2 }, Lcom/innioasis/ipp/Scan;->extOf(Ljava/io/File;)Ljava/lang/String;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Scan;->fileExt(Ljava/lang/String;)Z
    move-result v2
    if-nez v2, :L1
    add-int/lit8 v1, v1, 1
  :L1
  .line 397
    add-int/lit8 v0, v0, 1
    goto :L0
  :L2
  .line 400
    invoke-static { v1 }, Lcom/innioasis/ipp/Scan;->listedDir(I)V
  .line 401
    if-eqz p0, :L8
    array-length v0, p0
    if-nez v0, :L3
    goto :L8
  :L3
  .line 402
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->queue([Ljava/io/File;)V
  .line 403
    sget-object v0, Lcom/innioasis/ipp/Scan;->AHEAD:Ljava/util/LinkedList;
    monitor-enter v0
  :L4
  .line 404
    invoke-virtual { v0, p0 }, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V
  .line 405
    sget-boolean p0, Lcom/innioasis/ipp/Scan;->looking:Z
    if-nez p0, :L5
  .line 406
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/Scan;->looking:Z
  .line 407
    new-instance p0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/ipp/Scan$Looker;
    invoke-direct { v1 }, Lcom/innioasis/ipp/Scan$Looker;-><init>()V
    const-string v2, "ipp-scan-stat"
    invoke-direct { p0, v1, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    invoke-virtual { p0 }, Ljava/lang/Thread;->start()V
  :L5
  .line 409
    invoke-virtual { v0 }, Ljava/lang/Object;->notifyAll()V
  .line 410
    monitor-exit v0
  .line 411
    return-void
  :L6
  .line 410
    move-exception p0
    monitor-exit v0
  :L7
    throw p0
  :L8
  .line 401
    return-void
.end method

.method private static declared-synchronized listedDir(I)V
  .catchall { :L0 .. :L1 } :L2
  .registers 6
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L0
  .line 274
    sget v1, Lcom/innioasis/ipp/Scan;->othersListed:I
    add-int/2addr v1, p0
    sput v1, Lcom/innioasis/ipp/Scan;->othersListed:I
  .line 275
    sget p0, Lcom/innioasis/ipp/Scan;->dirs:I
    add-int/lit8 p0, p0, 1
    sput p0, Lcom/innioasis/ipp/Scan;->dirs:I
  .line 276
    sget-wide v1, Lcom/innioasis/ipp/Scan;->units:J
    const-wide/16 v3, 30
    add-long/2addr v1, v3
    sput-wide v1, Lcom/innioasis/ipp/Scan;->units:J
  .line 277
    invoke-static { }, Lcom/innioasis/ipp/Scan;->walkShown()V
  :L1
  .line 278
    monitor-exit v0
    return-void
  :L2
  .line 273
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method private static load()Ljava/util/HashSet;
  .catchall { :L0 .. :L3 } :L11
  .catchall { :L4 .. :L5 } :L8
  .catchall { :L5 .. :L7 } :L11
  .catchall { :L9 .. :L10 } :L8
  .catchall { :L10 .. :L11 } :L11
  .registers 5
  :L0
  .line 676
    invoke-static { }, Lcom/innioasis/ipp/Artists;->ensureExceptions()V
  .line 677
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 678
    if-nez v0, :L1
    sget-object v0, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
    return-object v0
  :L1
  .line 679
    invoke-static { }, Lcom/innioasis/ipp/Scan;->pathsOnly()Ljava/util/HashSet;
    move-result-object v1
  .line 680
    if-nez v1, :L2
  .line 681
    new-instance v1, Ljava/util/HashSet;
    invoke-direct { v1 }, Ljava/util/HashSet;-><init>()V
  .line 682
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository;->ippSongDao()Lcom/innioasis/y1/database/SongDao;
    move-result-object v0
    invoke-interface { v0 }, Lcom/innioasis/y1/database/SongDao;->getSongsSync()Ljava/util/List;
    move-result-object v0
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Scan;->fill(Ljava/util/HashSet;Ljava/util/List;)V
  :L2
  .line 684
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
  .line 685
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L3
  .line 686
    const/4 v2, 0
  :L4
    sput v2, Lcom/innioasis/ipp/Scan;->seen:I
  .line 687
    const-wide/16 v3, 0
    sput-wide v3, Lcom/innioasis/ipp/Scan;->units:J
  .line 688
    invoke-virtual { v1 }, Ljava/util/HashSet;->size()I
    move-result v3
    sput v3, Lcom/innioasis/ipp/Scan;->expected:I
  .line 689
    invoke-static { v1 }, Lcom/innioasis/ipp/Scan;->dirsOf(Ljava/util/HashSet;)I
    move-result v3
    sput v3, Lcom/innioasis/ipp/Scan;->dirsExpected:I
  .line 690
    sput v2, Lcom/innioasis/ipp/Scan;->dirs:I
  .line 691
    sput v2, Lcom/innioasis/ipp/Scan;->othersListed:I
  .line 692
    sput v2, Lcom/innioasis/ipp/Scan;->othersSeen:I
  .line 693
    sput v2, Lcom/innioasis/ipp/Scan;->queued:I
  .line 694
    const/4 v3, -1
    sput v3, Lcom/innioasis/ipp/Scan;->shown:I
  .line 695
    sput v2, Lcom/innioasis/ipp/Scan;->added:I
  .line 696
    monitor-exit v0
  :L5
  .line 698
    invoke-virtual { v1 }, Ljava/util/HashSet;->isEmpty()Z
    move-result v0
    if-eqz v0, :L6
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Meta;->noteLibraryRead(Landroid/content/Context;)V
  :L6
  .line 699
    sput-object v1, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
  :L7
  .line 700
    return-object v1
  :L8
  .line 696
    move-exception v1
  :L9
    monitor-exit v0
  :L10
    throw v1
  :L11
  .line 701
    move-exception v0
  .line 702
    sget-object v0, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
    return-object v0
.end method

.method static declared-synchronized loaded(I)V
  .catchall { :L0 .. :L2 } :L4
  .registers 10
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L0
  .line 318
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
  .line 319
    sget-wide v3, Lcom/innioasis/ipp/Scan;->tailWork:J
    sub-long/2addr v3, v1
  .line 320
    sget-wide v5, Lcom/innioasis/ipp/Scan;->tailDone:J
    int-to-long v7, p0
    mul-long v1, v1, v7
    const-wide/16 v7, 1000
    div-long/2addr v1, v7
    add-long/2addr v3, v1
    invoke-static { v5, v6, v3, v4 }, Ljava/lang/Math;->max(JJ)J
    move-result-wide v1
    sput-wide v1, Lcom/innioasis/ipp/Scan;->tailDone:J
  .line 321
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
  .line 322
    monitor-exit v0
    return-void
  :L3
  .line 318
    monitor-exit v0
    return-void
  :L4
  .line 317
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
  .line 91
    invoke-static { }, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object v1
    sput-object v1, Lcom/innioasis/ipp/Scan;->walker:Ljava/lang/Thread;
  .line 92
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/Scan;->marked:Z
  .line 93
    new-instance v1, Ljava/util/HashMap;
    invoke-direct { v1 }, Ljava/util/HashMap;-><init>()V
    sput-object v1, Lcom/innioasis/ipp/Scan;->py:Ljava/util/HashMap;
  .line 94
    invoke-static { }, Lcom/innioasis/ipp/Albums;->scanStarts()V
  :L1
  .line 95
    monitor-exit v0
    return-void
  :L2
  .line 90
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method private static declared-synchronized meet(Ljava/lang/String;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  .line 610
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
  .line 609
    move-exception p0
    monitor-exit v0
    throw p0
  :L3
  .line 611
    monitor-exit v0
    return-void
.end method

.method public static music(Ljava/io/File;)Z
  .registers 2
  .line 450
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
  .line 615
    sget-object v0, Lcom/innioasis/ipp/Scan;->card:Ljava/lang/String;
  .line 616
    if-nez v0, :L0
    invoke-static { }, Lcom/innioasis/ipp/Panel;->card()Ljava/io/File;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/Scan;->card:Ljava/lang/String;
  :L0
  .line 617
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Scan;->under(Ljava/lang/String;Ljava/lang/String;)Z
    move-result p0
    return p0
.end method

.method private static pass(I)V
  .registers 5
  .line 873
    sget v0, Lcom/innioasis/ipp/Scan;->cursor:I
  :L0
    const/4 v1, 0
    if-ge v0, p0, :L3
  .line 874
    sget-object v2, Lcom/innioasis/ipp/Scan;->upcoming:Ljava/util/ArrayList;
    invoke-virtual { v2, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/io/File;
  .line 875
    if-nez v2, :L1
    goto :L2
  :L1
  .line 876
    invoke-virtual { v2 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v2
  .line 877
    sget-object v3, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
    invoke-virtual { v3, v2 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 878
    sget-object v3, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
    invoke-virtual { v3, v2 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 879
    sget-object v2, Lcom/innioasis/ipp/Scan;->upcoming:Ljava/util/ArrayList;
    invoke-virtual { v2, v0, v1 }, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;
  :L2
  .line 873
    add-int/lit8 v0, v0, 1
    goto :L0
  :L3
  .line 881
    sget-object v0, Lcom/innioasis/ipp/Scan;->upcoming:Ljava/util/ArrayList;
    invoke-virtual { v0, p0, v1 }, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;
  .line 882
    add-int/lit8 p0, p0, 1
    sput p0, Lcom/innioasis/ipp/Scan;->cursor:I
  .line 883
    return-void
.end method

.method private static pathsOnly()Ljava/util/HashSet;
  .catchall { :L1 .. :L2 } :L13
  .catchall { :L3 .. :L4 } :L12
  .catchall { :L6 .. :L7 } :L8
  .catchall { :L15 .. :L16 } :L17
  .registers 10
  .line 711
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
  .line 712
    const-wide/16 v1, -1
  :L0
  .line 714
    nop
  .line 715
    nop
  .line 717
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
  .line 719
    invoke-interface { v4 }, Landroid/database/Cursor;->moveToNext()Z
    move-result v8
    if-eqz v8, :L5
  .line 720
    invoke-interface { v4, v5 }, Landroid/database/Cursor;->getLong(I)J
    move-result-wide v1
  .line 721
    const/4 v8, 1
    invoke-interface { v4, v8 }, Landroid/database/Cursor;->isNull(I)Z
    move-result v9
    if-nez v9, :L4
    invoke-interface { v4, v8 }, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    move-result-object v8
    invoke-virtual { v0, v8 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
  :L4
  .line 722
    add-int/lit8 v7, v7, 1
    goto :L3
  :L5
  .line 728
    if-eqz v4, :L9
  :L6
    invoke-interface { v4 }, Landroid/database/Cursor;->close()V
  :L7
    goto :L9
  :L8
  .line 729
    move-exception v3
  .line 731
    goto :L10
  :L9
  .line 730
    nop
  :L10
  .line 732
    if-ge v7, v6, :L11
    return-object v0
  :L11
  .line 733
    goto :L0
  :L12
  .line 724
    move-exception v0
    goto :L14
  :L13
    move-exception v0
    move-object v4, v3
  :L14
  .line 725
    nop
  .line 728
    if-eqz v4, :L18
  :L15
    invoke-interface { v4 }, Landroid/database/Cursor;->close()V
  :L16
    goto :L18
  :L17
  .line 729
    move-exception v0
    goto :L19
  :L18
  .line 730
    nop
  :L19
  .line 725
    return-object v3
.end method

.method public static pinyin(Lcom/innioasis/y1/utils/HanziToPinyin;Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L1 .. :L2 } :L7
  .catchall { :L4 .. :L6 } :L5
  .catchall { :L8 .. :L9 } :L7
  .registers 4
  .line 208
    sget-object v0, Lcom/innioasis/ipp/Scan;->py:Ljava/util/HashMap;
  .line 209
    if-eqz v0, :L10
    if-nez p1, :L0
    goto :L10
  :L0
  .line 211
    monitor-enter v0
  :L1
  .line 212
    invoke-virtual { v0, p1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Ljava/lang/String;
  .line 213
    monitor-exit v0
  :L2
  .line 214
    if-eqz v1, :L3
    return-object v1
  :L3
  .line 215
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/utils/HanziToPinyin;->getString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 216
    monitor-enter v0
  :L4
  .line 217
    invoke-virtual { v0, p1, p0 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 218
    monitor-exit v0
  .line 219
    return-object p0
  :L5
  .line 218
    move-exception p0
    monitor-exit v0
  :L6
    throw p0
  :L7
  .line 213
    move-exception p0
  :L8
    monitor-exit v0
  :L9
    throw p0
  :L10
  .line 209
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/utils/HanziToPinyin;->getString(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static pool()I
  .registers 2
  .line 895
    invoke-static { }, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/Runtime;->availableProcessors()I
    move-result v0
  .line 896
    add-int/lit8 v0, v0, 1
  .line 897
    const/4 v1, 3
    if-le v0, v1, :L0
    const/4 v0, 3
  :L0
  .line 898
    return v0
.end method

.method private static queue([Ljava/io/File;)V
  .catchall { :L1 .. :L2 } :L5
  .catchall { :L9 .. :L10 } :L16
  .catchall { :L11 .. :L15 } :L14
  .catchall { :L17 .. :L18 } :L16
  .registers 7
  .line 783
    nop
  .line 784
    const/4 v0, 0
    const/4 v1, 0
    const/4 v2, 0
  :L0
    array-length v3, p0
    if-ge v2, v3, :L7
  .line 785
    aget-object v3, p0, v2
  .line 787
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
  .line 790
    nop
  .line 791
    if-nez v0, :L4
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  :L4
  .line 792
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    goto :L6
  :L5
  .line 788
    move-exception v3
  .line 789
    nop
  :L6
  .line 784
    add-int/lit8 v2, v2, 1
    goto :L0
  :L7
  .line 794
    if-nez v0, :L8
    return-void
  :L8
  .line 795
    const-class p0, Lcom/innioasis/ipp/Scan;
    monitor-enter p0
  :L9
  .line 796
    sget v2, Lcom/innioasis/ipp/Scan;->queued:I
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v3
    add-int/2addr v2, v3
    sput v2, Lcom/innioasis/ipp/Scan;->queued:I
  .line 797
    monitor-exit p0
  :L10
  .line 798
    sget-object v2, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    monitor-enter v2
  .line 799
    nop
  .line 800
    const/4 p0, 0
  :L11
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge v1, v3, :L12
  .line 801
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Ljava/io/File;
  .line 802
    sget-object v3, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
    invoke-virtual { p0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v4
    sget-object v5, Lcom/innioasis/ipp/Scan;->upcoming:Ljava/util/ArrayList;
    invoke-virtual { v5 }, Ljava/util/ArrayList;->size()I
    move-result v5
    invoke-static { v5 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v5
    invoke-virtual { v3, v4, v5 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 803
    sget-object v3, Lcom/innioasis/ipp/Scan;->upcoming:Ljava/util/ArrayList;
    invoke-virtual { v3, p0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 804
    nop
  .line 800
    add-int/lit8 v1, v1, 1
    const/4 p0, 1
    goto :L11
  :L12
  .line 806
    if-eqz p0, :L13
    sget-object p0, Lcom/innioasis/ipp/Scan;->repo:Lcom/innioasis/y1/database/Y1Repository;
    if-eqz p0, :L13
  .line 807
    invoke-static { }, Lcom/innioasis/ipp/Scan;->start()V
  .line 808
    sget-object p0, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    invoke-virtual { p0 }, Ljava/lang/Object;->notifyAll()V
  :L13
  .line 810
    monitor-exit v2
  .line 811
    return-void
  :L14
  .line 810
    move-exception p0
    monitor-exit v2
  :L15
    throw p0
  :L16
  .line 797
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
  .line 499
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
  .line 500
    const-class v1, Lcom/innioasis/ipp/Scan;
    monitor-enter v1
  :L0
  .line 501
    sget-object v2, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
    if-nez v2, :L1
    invoke-interface { p0 }, Lcom/innioasis/y1/database/SongDao;->getSongsSync()Ljava/util/List;
    move-result-object p0
    monitor-exit v1
    return-object p0
  :L1
  .line 502
    sget-object v2, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
    invoke-virtual { v2 }, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;
    move-result-object v2
  :L2
  .line 503
    invoke-interface { v2 }, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :L4
  .line 504
    invoke-interface { v2 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
  .line 505
    sget-object v4, Lcom/innioasis/ipp/Scan;->met:Ljava/util/HashSet;
    invoke-virtual { v4, v3 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v4
    if-nez v4, :L3
    invoke-virtual { v0, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 506
    goto :L2
  :L4
  .line 507
    monitor-exit v1
  :L5
  .line 508
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v1
    invoke-static { v1 }, Lcom/innioasis/ipp/Scan;->tailStarts(I)V
  .line 509
    invoke-virtual { v0 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v1
    if-eqz v1, :L6
    return-object v0
  :L6
  .line 511
    invoke-static { v0 }, Lcom/innioasis/ipp/Scan;->drop(Ljava/util/List;)V
  .line 512
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  :L7
    return-object v1
  :L8
  .line 513
    move-exception v1
  .line 514
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
  .line 517
    new-instance v1, Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v2
    invoke-direct { v1, v2 }, Ljava/util/ArrayList;-><init>(I)V
  .line 518
    const/4 v2, 0
  :L9
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge v2, v3, :L11
  .line 519
    invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
    invoke-interface { p0, v3 }, Lcom/innioasis/y1/database/SongDao;->getSongByPathSyncDB(Ljava/lang/String;)Lcom/innioasis/y1/database/Song;
    move-result-object v3
  .line 520
    if-eqz v3, :L10
    invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L10
  .line 518
    add-int/lit8 v2, v2, 1
    goto :L9
  :L11
  .line 522
    return-object v1
  :L12
  .line 507
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
  .line 294
    const/16 v0, 99
    if-le p0, v0, :L0
    const/16 p0, 99
  :L0
  .line 295
    sget v0, Lcom/innioasis/ipp/Scan;->shown:I
    if-gt p0, v0, :L1
    return-void
  :L1
  .line 296
    sput p0, Lcom/innioasis/ipp/Scan;->shown:I
  .line 297
    invoke-static { p0 }, Lcom/innioasis/ipp/Loading;->scannedPercent(I)V
  .line 298
    return-void
.end method

.method public static skip(ZLjava/lang/String;)Z
  .registers 2
  .line 467
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
  .line 815
    nop
  :L0
  .line 817
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Scan;->take(Lcom/innioasis/y1/database/Y1Repository;Ljava/io/File;)Lcom/innioasis/y1/database/Song;
    move-result-object v0
  :L1
  .line 820
    goto :L3
  :L2
  .line 818
    move-exception v0
  .line 819
    const/4 v0, 0
  :L3
  .line 821
    if-nez v0, :L4
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/database/Y1Repository;->fileToSong(Ljava/io/File;)Lcom/innioasis/y1/database/Song;
    move-result-object v0
  :L4
  .line 822
    invoke-static { v0 }, Lcom/innioasis/ipp/Scan;->built(Lcom/innioasis/y1/database/Song;)V
  .line 823
    return-object v0
.end method

.method private static songFile(Ljava/io/File;)Z
  .registers 3
  .line 771
    invoke-virtual { p0 }, Ljava/io/File;->isHidden()Z
    move-result v0
    const/4 v1, 0
    if-eqz v0, :L0
    return v1
  :L0
  .line 772
    invoke-virtual { p0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v0
  .line 773
    if-nez v0, :L1
    return v1
  :L1
  .line 774
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->extOf(Ljava/io/File;)Ljava/lang/String;
    move-result-object p0
  .line 775
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
  .line 887
    invoke-static { }, Lcom/innioasis/ipp/Scan;->pool()I
    move-result v0
  :L0
  .line 888
    sget v1, Lcom/innioasis/ipp/Scan;->live:I
    if-ge v1, v0, :L1
  .line 889
    add-int/lit8 v1, v1, 1
    sput v1, Lcom/innioasis/ipp/Scan;->live:I
  .line 890
    new-instance v1, Ljava/lang/Thread;
    new-instance v2, Lcom/innioasis/ipp/Scan$Builder;
    invoke-direct { v2 }, Lcom/innioasis/ipp/Scan$Builder;-><init>()V
    invoke-direct { v1, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v1 }, Ljava/lang/Thread;->start()V
    goto :L0
  :L1
  .line 892
    return-void
.end method

.method public static stays(Lcom/innioasis/y1/database/Song;)Z
  .catchall { :L2 .. :L3 } :L11
  .catchall { :L7 .. :L9 } :L8
  .catchall { :L12 .. :L13 } :L11
  .registers 4
  .line 476
    const/4 v0, 1
    if-nez p0, :L0
    return v0
  :L0
  .line 477
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
  .line 478
    if-nez p0, :L1
    return v0
  :L1
  .line 480
    const-class v1, Lcom/innioasis/ipp/Scan;
    monitor-enter v1
  :L2
  .line 481
    sget-object v2, Lcom/innioasis/ipp/Scan;->met:Ljava/util/HashSet;
    invoke-virtual { v2, p0 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v2
  .line 482
    monitor-exit v1
  :L3
  .line 483
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
  .line 484
    if-nez p0, :L10
  .line 485
    const-class v1, Lcom/innioasis/ipp/Scan;
    monitor-enter v1
  :L7
  .line 486
    sput-boolean v0, Lcom/innioasis/ipp/Scan;->wrote:Z
  .line 487
    monitor-exit v1
    goto :L10
  :L8
    move-exception p0
    monitor-exit v1
  :L9
    throw p0
  :L10
  .line 489
    return p0
  :L11
  .line 482
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
  .line 666
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
  .line 667
    sget-object v3, Lcom/innioasis/ipp/Scan;->paths:Ljava/util/HashSet;
  .line 668
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
  .line 669
    sput-wide v1, Lcom/innioasis/ipp/Scan;->asked:J
  :L3
  .line 670
    monitor-exit v0
    return-object v3
  :L4
  .line 665
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method static declared-synchronized tailEnds()V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  .line 326
    const/4 v1, 0
  :L0
    sput-object v1, Lcom/innioasis/ipp/Scan;->tailThread:Ljava/lang/Thread;
  .line 327
    const-wide/16 v1, 0
    sput-wide v1, Lcom/innioasis/ipp/Scan;->tailLoad:J
    sput-wide v1, Lcom/innioasis/ipp/Scan;->tailDone:J
    sput-wide v1, Lcom/innioasis/ipp/Scan;->tailWork:J
  :L1
  .line 328
    monitor-exit v0
    return-void
  :L2
  .line 325
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
  .line 302
    sget v1, Lcom/innioasis/ipp/Scan;->expected:I
  :L1
    if-nez v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 303
    invoke-static { }, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object v1
    sput-object v1, Lcom/innioasis/ipp/Scan;->tailThread:Ljava/lang/Thread;
  .line 304
    sget v1, Lcom/innioasis/ipp/Scan;->shown:I
    const/4 v2, 0
    invoke-static { v1, v2 }, Ljava/lang/Math;->max(II)I
    move-result v1
    sput v1, Lcom/innioasis/ipp/Scan;->tailFrom:I
  .line 305
    const-wide/16 v1, 0
    sput-wide v1, Lcom/innioasis/ipp/Scan;->tailDone:J
  .line 306
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
  .line 307
    const-wide/16 v3, 7
    int-to-long v5, p0
    mul-long v5, v5, v3
    add-long/2addr v5, v1
    sput-wide v5, Lcom/innioasis/ipp/Scan;->tailWork:J
  :L5
  .line 308
    monitor-exit v0
    return-void
  :L6
  .line 301
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
  .line 311
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
  .line 312
    sget-wide v3, Lcom/innioasis/ipp/Scan;->tailDone:J
    add-long/2addr v3, p0
    sput-wide v3, Lcom/innioasis/ipp/Scan;->tailDone:J
  .line 313
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
  .line 314
    monitor-exit v0
    return-void
  :L3
  .line 311
    monitor-exit v0
    return-void
  :L4
  .line 310
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method private static take(Lcom/innioasis/y1/database/Y1Repository;Ljava/io/File;)Lcom/innioasis/y1/database/Song;
  .catchall { :L1 .. :L8 } :L14
  .catchall { :L9 .. :L10 } :L11
  .catchall { :L12 .. :L15 } :L14
  .registers 10
  .line 828
    invoke-virtual { p1 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object p1
  .line 829
    const/4 v0, 0
    if-nez p1, :L0
    return-object v0
  :L0
  .line 831
    sget-object v1, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    monitor-enter v1
  :L1
  .line 832
    sget-object v2, Lcom/innioasis/ipp/Scan;->repo:Lcom/innioasis/y1/database/Y1Repository;
    if-nez v2, :L2
  .line 833
    sput-object p0, Lcom/innioasis/ipp/Scan;->repo:Lcom/innioasis/y1/database/Y1Repository;
  .line 834
    invoke-static { }, Lcom/innioasis/ipp/Scan;->start()V
  .line 835
    invoke-virtual { v1 }, Ljava/lang/Object;->notifyAll()V
  :L2
  .line 837
    sget-object p0, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
    invoke-virtual { p0, p1 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 838
    if-nez p0, :L3
    const/4 p0, -1
    goto :L4
  :L3
    check-cast p0, Ljava/lang/Integer;
    invoke-virtual { p0 }, Ljava/lang/Integer;->intValue()I
    move-result p0
  :L4
  .line 839
    sget v2, Lcom/innioasis/ipp/Scan;->cursor:I
    if-ge p0, v2, :L5
  .line 840
    monitor-exit v1
    return-object v0
  :L5
  .line 842
    invoke-static { p0 }, Lcom/innioasis/ipp/Scan;->pass(I)V
  .line 843
    sget v2, Lcom/innioasis/ipp/Scan;->next:I
    if-lt p0, v2, :L6
  .line 844
    add-int/lit8 p0, p0, 1
    sput p0, Lcom/innioasis/ipp/Scan;->next:I
  .line 845
    sget-object p0, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
    invoke-virtual { p0, p1 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 846
    invoke-static { }, Lcom/innioasis/ipp/Scan;->start()V
  .line 847
    invoke-virtual { v1 }, Ljava/lang/Object;->notifyAll()V
  .line 848
    monitor-exit v1
    return-object v0
  :L6
  .line 850
    sget-object p0, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
    invoke-virtual { p0, p1 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/database/Song;
  .line 851
    if-nez p0, :L13
    sget-object v0, Lcom/innioasis/ipp/Scan;->building:Ljava/util/HashSet;
    invoke-virtual { v0, p1 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L13
  .line 853
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    const-wide/16 v4, 20000
    add-long/2addr v2, v4
  :L7
  .line 854
    sget-object p0, Lcom/innioasis/ipp/Scan;->building:Ljava/util/HashSet;
    invoke-virtual { p0, p1 }, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L12
  .line 855
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
  :L8
    sub-long v4, v2, v4
  .line 856
    const-wide/16 v6, 0
    cmp-long p0, v4, v6
    if-gtz p0, :L9
    goto :L12
  :L9
  .line 858
    sget-object p0, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    invoke-virtual { p0, v4, v5 }, Ljava/lang/Object;->wait(J)V
  :L10
  .line 861
    nop
  .line 862
    goto :L7
  :L11
  .line 859
    move-exception p0
  .line 860
    nop
  :L12
  .line 863
    sget-object p0, Lcom/innioasis/ipp/Scan;->ready:Ljava/util/HashMap;
    invoke-virtual { p0, p1 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/database/Song;
  :L13
  .line 865
    sget-object v0, Lcom/innioasis/ipp/Scan;->at:Ljava/util/HashMap;
    invoke-virtual { v0, p1 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 866
    sget-object p1, Lcom/innioasis/ipp/Scan;->LOCK:Ljava/lang/Object;
    invoke-virtual { p1 }, Ljava/lang/Object;->notifyAll()V
  .line 867
    monitor-exit v1
    return-object p0
  :L14
  .line 868
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
  .line 460
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
  .line 591
    const-class v0, Lcom/innioasis/ipp/Scan;
    monitor-enter v0
  :L0
  .line 592
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
  .line 593
    monitor-exit v0
  :L2
  .line 594
    if-nez p0, :L3
    const/4 p0, 0
    goto :L4
  :L3
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result p0
  :L4
    return p0
  :L5
  .line 593
    move-exception p0
  :L6
    monitor-exit v0
  :L7
    throw p0
.end method

.method private static under(Ljava/lang/String;Ljava/lang/String;)Z
  .registers 10
  .line 624
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 625
    invoke-virtual { p1 }, Ljava/lang/String;->length()I
    move-result v7
  .line 626
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
  .line 627
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
  .line 455
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
  .line 262
    sget v0, Lcom/innioasis/ipp/Scan;->expected:I
    if-nez v0, :L0
    return-void
  :L0
  .line 265
    sget v0, Lcom/innioasis/ipp/Scan;->othersListed:I
    sget v1, Lcom/innioasis/ipp/Scan;->othersSeen:I
    sub-int/2addr v0, v1
    const/4 v1, 0
    invoke-static { v1, v0 }, Ljava/lang/Math;->max(II)I
    move-result v0
  .line 266
    sget v1, Lcom/innioasis/ipp/Scan;->dirsExpected:I
    sget v2, Lcom/innioasis/ipp/Scan;->dirs:I
    add-int/2addr v2, v0
    invoke-static { v1, v2 }, Ljava/lang/Math;->max(II)I
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
  .line 267
    if-lez v3, :L1
    add-int/2addr v2, v3
    int-to-long v2, v2
    const-wide/16 v4, 6
    mul-long v2, v2, v4
    add-long/2addr v0, v2
  :L1
  .line 268
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
  .line 269
    return-void
.end method

.method private static write(Lcom/innioasis/y1/database/SongDao;[Lcom/innioasis/y1/database/Song;)V
  .catchall { :L1 .. :L2 } :L3
  .registers 5
  .line 188
    const/4 v0, 0
  :L0
    const/4 v1, 3
    if-ge v0, v1, :L4
  :L1
  .line 190
    invoke-interface { p0, p1 }, Lcom/innioasis/y1/database/SongDao;->insert([Lcom/innioasis/y1/database/Song;)V
  .line 191
    invoke-static { }, Lcom/innioasis/ipp/Ipp;->libraryChanged()V
  :L2
  .line 192
    return-void
  :L3
  .line 193
    move-exception v1
  .line 194
    const-wide/16 v1, 1000
    invoke-static { v1, v2 }, Landroid/os/SystemClock;->sleep(J)V
  .line 188
    add-int/lit8 v0, v0, 1
    goto :L0
  :L4
  .line 197
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
  .line 198
    return-void
.end method
