.class public final Lcom/innioasis/ipp/Lab;
.super Ljava/lang/Object;
.source "Lab.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Lab$Allocs;,
    Lcom/innioasis/ipp/Lab$Stacks;,
    Lcom/innioasis/ipp/Lab$Survivors;,
    Lcom/innioasis/ipp/Lab$Frame;,
    Lcom/innioasis/ipp/Lab$Reads;,
    Lcom/innioasis/ipp/Lab$Ids;,
    Lcom/innioasis/ipp/Lab$ByCount;
  }
.end annotation

.field private static allocating:Z

.field private static compared:Z

.field private static idsRan:Z

.field private static last:J

.field private static ran:Z

.field private static restoreAt:J

.field private static screenNo:I

.field private final static screensEver:Ljava/util/WeakHashMap;

.field private static stacking:Z

.field private static start:J

.field private static what:Ljava/lang/String;

.field private static whos:I

.method static constructor <clinit>()V
  .registers 1
  .line 48
    new-instance v0, Ljava/util/WeakHashMap;
    invoke-direct { v0 }, Ljava/util/WeakHashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Lab;->screensEver:Ljava/util/WeakHashMap;
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 13
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static a0()V
  .registers 1
  .line 30
    const-string v0, "albums"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->begin(Ljava/lang/String;)V
    return-void
.end method

.method public static a1()V
  .registers 1
  .line 31
    const-string v0, "names query"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->lap(Ljava/lang/String;)V
    return-void
.end method

.method public static a2()V
  .registers 1
  .line 32
    const-string v0, "listForView"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->lap(Ljava/lang/String;)V
    return-void
.end method

.method public static a3()V
  .registers 1
  .line 33
    const-string v0, "years"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->lap(Ljava/lang/String;)V
    return-void
.end method

.method public static a4()V
  .registers 1
  .line 34
    const-string v0, "to main + setAlbums"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->lap(Ljava/lang/String;)V
    invoke-static { }, Lcom/innioasis/ipp/Lab;->frame()V
    return-void
.end method

.method static synthetic access$200()Ljava/util/WeakHashMap;
  .registers 1
  .line 13
    sget-object v0, Lcom/innioasis/ipp/Lab;->screensEver:Ljava/util/WeakHashMap;
    return-object v0
.end method

.method static synthetic access$300(Ljava/lang/String;)V
  .registers 1
  .line 13
    invoke-static { p0 }, Lcom/innioasis/ipp/Lab;->lap(Ljava/lang/String;)V
    return-void
.end method

.method private static allocs()V
  .catchall { :L1 .. :L2 } :L4
  .registers 4
  .line 63
    sget-boolean v0, Lcom/innioasis/ipp/Lab;->allocating:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 64
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Lab;->allocating:Z
  :L1
  .line 66
    new-instance v1, Ljava/io/File;
    const-string v2, "/data/local/tmp/ippalloc"
    invoke-direct { v1, v2 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v1
  :L2
    if-nez v1, :L3
    return-void
  :L3
  .line 69
    nop
  .line 70
    new-instance v1, Ljava/lang/Thread;
    new-instance v2, Lcom/innioasis/ipp/Lab$Allocs;
    invoke-direct { v2 }, Lcom/innioasis/ipp/Lab$Allocs;-><init>()V
    const-string v3, "ipp-allocs"
    invoke-direct { v1, v2, v3 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 71
    invoke-virtual { v1, v0 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 72
    invoke-virtual { v1 }, Ljava/lang/Thread;->start()V
  .line 73
    return-void
  :L4
  .line 67
    move-exception v0
  .line 68
    return-void
.end method

.method static b(Ljava/lang/String;)V
  .registers 1
  .line 45
    invoke-static { p0 }, Lcom/innioasis/ipp/Lab;->begin(Ljava/lang/String;)V
    return-void
.end method

.method private static begin(Ljava/lang/String;)V
  .registers 3
  .line 20
    sput-object p0, Lcom/innioasis/ipp/Lab;->what:Ljava/lang/String;
  .line 21
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    sput-wide v0, Lcom/innioasis/ipp/Lab;->last:J
    sput-wide v0, Lcom/innioasis/ipp/Lab;->start:J
  .line 22
    return-void
.end method

.method static compareRead(Ljava/util/List;)V
  .catchall { :L1 .. :L6 } :L7
  .registers 13
  .line 503
    const-string v0, "ipplab"
    sget-boolean v1, Lcom/innioasis/ipp/Lab;->compared:Z
    if-nez v1, :L9
    if-nez p0, :L0
    goto/16 :L9
  :L0
  .line 504
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/Lab;->compared:Z
  :L1
  .line 506
    new-instance v1, Ljava/io/File;
    const-string v2, "/data/local/tmp/ippread"
    invoke-direct { v1, v2 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v1
    if-nez v1, :L2
    return-void
  :L2
  .line 507
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
  .line 508
    sget-object v3, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v3 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v3
    const/4 v4, 0
    invoke-virtual { v3, v4 }, Lcom/innioasis/y1/database/Y1Repository;->getSongsSync(I)Ljava/util/List;
    move-result-object v3
  .line 509
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v5
  .line 510
    nop
  .line 511
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v7
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v8
    invoke-static { v7, v8 }, Ljava/lang/Math;->min(II)I
    move-result v7
  .line 512
    const/4 v8, -1
    const/4 v8, 0
    const/4 v9, -1
  :L3
    if-ge v4, v7, :L5
  .line 513
    invoke-interface { p0, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v10
    invoke-interface { v3, v4 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v11
    invoke-virtual { v10, v11 }, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
    move-result v10
    if-nez v10, :L4
  .line 514
    add-int/lit8 v8, v8, 1
  .line 515
    if-gez v9, :L4
    move v9, v4
  :L4
  .line 512
    add-int/lit8 v4, v4, 1
    goto :L3
  :L5
  .line 518
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v7, "compare read: portions "
    invoke-virtual { v4, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result p0
    invoke-virtual { v4, p0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v4, ", stock "
    invoke-virtual { p0, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-interface { v3 }, Ljava/util/List;->size()I
    move-result v3
    invoke-virtual { p0, v3 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v3, " rows in "
    invoke-virtual { p0, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    sub-long/2addr v5, v1
    invoke-virtual { p0, v5, v6 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v1, " ms, "
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v8 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v1, " differ (first "
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v9 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v1, ")"
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { v0, p0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  :L6
  .line 522
    goto :L8
  :L7
  .line 520
    move-exception p0
  .line 521
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "compare read failed "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { v0, p0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  :L8
  .line 523
    return-void
  :L9
  .line 503
    return-void
.end method

.method public static f0()V
  .registers 1
  .line 36
    const-string v0, "folders"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->begin(Ljava/lang/String;)V
    return-void
.end method

.method public static f1()V
  .registers 1
  .line 37
    const-string v0, "byParentPath query"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->lap(Ljava/lang/String;)V
    return-void
.end method

.method public static f2()V
  .registers 1
  .line 38
    const-string v0, "filter + exists"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->lap(Ljava/lang/String;)V
    return-void
.end method

.method public static f3()V
  .registers 1
  .line 39
    const-string v0, "listFiles + sort"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->lap(Ljava/lang/String;)V
    return-void
.end method

.method public static f4()V
  .registers 1
  .line 40
    const-string v0, "build"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->lap(Ljava/lang/String;)V
    return-void
.end method

.method public static f5()V
  .registers 1
  .line 41
    const-string v0, "to main + setItems"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->lap(Ljava/lang/String;)V
    invoke-static { }, Lcom/innioasis/ipp/Lab;->frame()V
    return-void
.end method

.method private static frame()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  :L0
  .line 338
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    new-instance v1, Lcom/innioasis/ipp/Lab$Frame;
    invoke-direct { v1 }, Lcom/innioasis/ipp/Lab$Frame;-><init>()V
    invoke-virtual { v0, v1 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  :L1
  .line 340
    goto :L3
  :L2
  .line 339
    move-exception v0
  :L3
  .line 341
    return-void
.end method

.method static ids()V
  .catchall { :L1 .. :L2 } :L4
  .registers 3
  .line 417
    sget-boolean v0, Lcom/innioasis/ipp/Lab;->idsRan:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 418
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Lab;->idsRan:Z
  :L1
  .line 420
    new-instance v0, Ljava/io/File;
    const-string v1, "/data/local/tmp/ippid"
    invoke-direct { v0, v1 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v0
  :L2
    if-nez v0, :L3
    return-void
  :L3
  .line 423
    nop
  .line 424
    new-instance v0, Lcom/innioasis/ipp/Lab$Ids;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Lab$Ids;-><init>()V
    const-wide/16 v1, 5000
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Albums;->later(Ljava/lang/Runnable;J)V
  .line 425
    return-void
  :L4
  .line 421
    move-exception v0
  .line 422
    return-void
.end method

.method private static lap(Ljava/lang/String;)V
  .registers 5
  .line 25
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 26
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    sget-object v3, Lcom/innioasis/ipp/Lab;->what:Ljava/lang/String;
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, " "
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v2, " +"
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    sget-wide v2, Lcom/innioasis/ipp/Lab;->last:J
    sub-long v2, v0, v2
    invoke-virtual { p0, v2, v3 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v2, " ms ("
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    sget-wide v2, Lcom/innioasis/ipp/Lab;->start:J
    sub-long v2, v0, v2
    invoke-virtual { p0, v2, v3 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v2, ")"
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    const-string v2, "ipplab"
    invoke-static { v2, p0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 27
    sput-wide v0, Lcom/innioasis/ipp/Lab;->last:J
  .line 28
    return-void
.end method

.method static queue(Ljava/lang/String;Ljava/util/List;I)V
  .catchall { :L0 .. :L8 } :L9
  .registers 8
  .line 372
    const-string v0, "ipplab"
    const-string v1, "queue "
  :L0
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2, v1 }, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual { v2, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, ": "
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
  .line 373
    if-nez p1, :L1
    const/4 v3, -1
    goto :L2
  :L1
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v3
  :L2
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, " songs @"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, p2 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v2
  .line 374
    if-eqz p1, :L5
    if-ltz p2, :L5
    invoke-interface { p1 }, Ljava/util/List;->size()I
    move-result v3
    if-ge p2, v3, :L5
  .line 375
    invoke-interface { p1, p2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p1
    check-cast p1, Lcom/innioasis/y1/database/Song;
  .line 376
    const-string p2, " "
    invoke-virtual { v2, p2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p2
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { p2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p2
    const-string v3, " exists "
    invoke-virtual { p2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p2
    new-instance v3, Ljava/io/File;
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v4
    invoke-direct { v3, v4 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v3 }, Ljava/io/File;->exists()Z
    move-result v3
    invoke-virtual { p2, v3 }, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
    move-result-object p2
    const-string v3, " id "
  .line 377
    invoke-virtual { p2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p2
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getSongId()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p1
    invoke-virtual { v3, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L3
    const-string p1, "path"
    goto :L4
  :L3
    const-string p1, "other"
  :L4
    invoke-virtual { p2, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  :L5
  .line 379
    const-string p1, " on "
    invoke-virtual { v2, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    invoke-static { }, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object p2
    invoke-virtual { p2 }, Ljava/lang/Thread;->getName()Ljava/lang/String;
    move-result-object p2
    invoke-virtual { p1, p2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p1
    const-string p2, " from"
    invoke-virtual { p1, p2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 380
    new-instance p1, Ljava/lang/Throwable;
    invoke-direct { p1 }, Ljava/lang/Throwable;-><init>()V
    invoke-virtual { p1 }, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;
    move-result-object p1
  .line 381
    const/4 p2, 2
  :L6
    array-length v3, p1
    if-ge p2, v3, :L7
    const/4 v3, 7
    if-ge p2, v3, :L7
    const/16 v3, 32
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v3
    aget-object v4, p1, p2
    invoke-virtual { v4 }, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
  .line 382
    const/16 v4, 46
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v3
    aget-object v4, p1, p2
    invoke-virtual { v4 }, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
  .line 381
    add-int/lit8 p2, p2, 1
    goto :L6
  :L7
  .line 383
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p1
    invoke-static { v0, p1 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  :L8
  .line 386
    goto :L10
  :L9
  .line 384
    move-exception p1
  .line 385
    new-instance p2, Ljava/lang/StringBuilder;
    invoke-direct { p2 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { p2, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p2
    invoke-virtual { p2, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string p2, " failed "
    invoke-virtual { p0, p2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, p1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { v0, p0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  :L10
  .line 387
    return-void
.end method

.method static reads()V
  .catchall { :L1 .. :L2 } :L4
  .registers 3
  .line 359
    sget-boolean v0, Lcom/innioasis/ipp/Lab;->ran:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 360
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Lab;->ran:Z
  :L1
  .line 362
    new-instance v0, Ljava/io/File;
    const-string v1, "/data/local/tmp/ipplab"
    invoke-direct { v0, v1 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v0
  :L2
    if-nez v0, :L3
    return-void
  :L3
  .line 365
    nop
  .line 366
    new-instance v0, Lcom/innioasis/ipp/Lab$Reads;
    invoke-direct { v0 }, Lcom/innioasis/ipp/Lab$Reads;-><init>()V
    const-wide/16 v1, 15000
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Albums;->later(Ljava/lang/Runnable;J)V
  .line 367
    return-void
  :L4
  .line 363
    move-exception v0
  .line 364
    return-void
.end method

.method public static restored(Lcom/innioasis/y1/service/PlayerService;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 7
  .line 405
    const-string v0, "ipplab"
  :L0
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "restore ends +"
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    sget-wide v4, Lcom/innioasis/ipp/Lab;->restoreAt:J
    sub-long/2addr v2, v4
    invoke-virtual { v1, v2, v3 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, " ms, playing "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
  .line 406
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getPlaying()Lcom/innioasis/y1/service/PlayerService$Playing;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, ", music "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getMusicList()Ljava/util/List;
    move-result-object v2
    if-nez v2, :L1
    const/4 v2, -1
    goto :L2
  :L1
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getMusicList()Ljava/util/List;
    move-result-object v2
    invoke-interface { v2 }, Ljava/util/List;->size()I
    move-result v2
  :L2
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v1
    const-string v2, " @"
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
  .line 407
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getMusicIndex()I
    move-result p0
    invoke-virtual { v1, p0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
  .line 405
    invoke-static { v0, p0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  :L3
  .line 410
    goto :L5
  :L4
  .line 408
    move-exception p0
  .line 409
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "restore ends failed "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { v0, p0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  :L5
  .line 411
    return-void
.end method

.method public static restoring(Lcom/innioasis/y1/service/PlayerService;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  .line 393
    const-string v0, "ipplab"
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    sput-wide v1, Lcom/innioasis/ipp/Lab;->restoreAt:J
  :L0
  .line 395
    new-instance v1, Ljava/io/File;
    invoke-virtual { p0 }, Lcom/innioasis/y1/service/PlayerService;->getFilesDir()Ljava/io/File;
    move-result-object p0
    const-string v2, "save_state"
    invoke-direct { v1, p0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 396
    new-instance p0, Ljava/lang/StringBuilder;
    invoke-direct { p0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "restore begins: save_state "
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { v1 }, Ljava/io/File;->length()J
    move-result-wide v1
    invoke-virtual { p0, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v1, " bytes, card "
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    new-instance v1, Ljava/io/File;
    const-string v2, "/storage/sdcard0/Music"
    invoke-direct { v1, v2 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 397
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v1
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
  .line 396
    invoke-static { v0, p0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  :L1
  .line 400
    goto :L3
  :L2
  .line 398
    move-exception p0
  .line 399
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "restore begins failed "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { v0, p0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  :L3
  .line 401
    return-void
.end method

.method public static s(Ljava/lang/String;)V
  .registers 1
  .line 43
    invoke-static { p0 }, Lcom/innioasis/ipp/Lab;->lap(Ljava/lang/String;)V
    return-void
.end method

.method static screen(Landroid/app/Activity;)V
  .registers 3
  .line 52
    sget-object v0, Lcom/innioasis/ipp/Lab;->screensEver:Ljava/util/WeakHashMap;
    sget v1, Lcom/innioasis/ipp/Lab;->screenNo:I
    add-int/lit8 v1, v1, 1
    sput v1, Lcom/innioasis/ipp/Lab;->screenNo:I
    invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v1
    invoke-virtual { v0, p0, v1 }, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 53
    invoke-static { }, Lcom/innioasis/ipp/Lab;->stacks()V
  .line 54
    invoke-static { }, Lcom/innioasis/ipp/Lab;->allocs()V
  .line 55
    return-void
.end method

.method static screensLater()V
  .registers 4
  .line 300
    new-instance v0, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v0, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    new-instance v1, Lcom/innioasis/ipp/Lab$Survivors;
    const/4 v2, 0
    invoke-direct { v1, v2 }, Lcom/innioasis/ipp/Lab$Survivors;-><init>(Lcom/innioasis/ipp/Lab$1;)V
    const-wide/16 v2, 5000
    invoke-virtual { v0, v1, v2, v3 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 301
    return-void
.end method

.method private static stacks()V
  .catchall { :L1 .. :L2 } :L4
  .registers 4
  .line 168
    sget-boolean v0, Lcom/innioasis/ipp/Lab;->stacking:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 169
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Lab;->stacking:Z
  :L1
  .line 171
    new-instance v1, Ljava/io/File;
    const-string v2, "/data/local/tmp/ippstack"
    invoke-direct { v1, v2 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v1
  :L2
    if-nez v1, :L3
    return-void
  :L3
  .line 174
    nop
  .line 175
    new-instance v1, Ljava/lang/Thread;
    new-instance v2, Lcom/innioasis/ipp/Lab$Stacks;
    invoke-direct { v2 }, Lcom/innioasis/ipp/Lab$Stacks;-><init>()V
    const-string v3, "ipp-stacks"
    invoke-direct { v1, v2, v3 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
  .line 176
    invoke-virtual { v1, v0 }, Ljava/lang/Thread;->setDaemon(Z)V
  .line 177
    invoke-virtual { v1 }, Ljava/lang/Thread;->start()V
  .line 178
    return-void
  :L4
  .line 172
    move-exception v0
  .line 173
    return-void
.end method

.method static who(Ljava/lang/String;)V
  .registers 7
  .line 325
    sget v0, Lcom/innioasis/ipp/Lab;->whos:I
    add-int/lit8 v0, v0, 1
    sput v0, Lcom/innioasis/ipp/Lab;->whos:I
    const/16 v1, 40
    if-le v0, v1, :L0
    return-void
  :L0
  .line 326
    new-instance v0, Ljava/lang/Throwable;
    invoke-direct { v0 }, Ljava/lang/Throwable;-><init>()V
    invoke-virtual { v0 }, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;
    move-result-object v0
  .line 327
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1, p0 }, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    const-string p0, " on "
    invoke-virtual { v1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-static { }, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/Thread;->getName()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { p0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
  .line 328
    const/4 v1, 2
  :L1
    array-length v2, v0
    if-ge v1, v2, :L2
    const/16 v2, 9
    if-ge v1, v2, :L2
  .line 329
    const-string v2, " < "
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    aget-object v3, v0, v1
    invoke-virtual { v3 }, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;
    move-result-object v3
    const-string v4, "com.innioasis."
    const-string v5, ""
    invoke-virtual { v3, v4, v5 }, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
  .line 330
    const/16 v3, 46
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v2
    aget-object v3, v0, v1
    invoke-virtual { v3 }, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const/16 v3, 58
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v2
    aget-object v3, v0, v1
    invoke-virtual { v3 }, Ljava/lang/StackTraceElement;->getLineNumber()I
    move-result v3
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
  .line 328
    add-int/lit8 v1, v1, 1
    goto :L1
  :L2
  .line 332
    const-string v0, "ipplab"
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-static { v0, p0 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 333
    return-void
.end method
