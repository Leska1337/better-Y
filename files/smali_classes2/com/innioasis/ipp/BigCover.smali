.class public final Lcom/innioasis/ipp/BigCover;
.super Ljava/lang/Object;
.source "BigCover.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/BigCover$Src;,
    Lcom/innioasis/ipp/BigCover$Walk;,
    Lcom/innioasis/ipp/BigCover$Warm;,
    Lcom/innioasis/ipp/BigCover$Save;,
    Lcom/innioasis/ipp/BigCover$Lru;
  }
.end annotation

.field private final static LIMIT:I = 25600

.field private final static LOCK:Ljava/lang/Object;

.field private final static MEM_MAX:I = 24

.field private final static NONE:I = 0

.field private final static NOTE_FILE:Ljava/lang/Object;

.field private final static OWN:I = 2

.field private final static Q_MAX:I = 92

.field private final static Q_MIN:I = 76

.field private final static SAVE_DELAY_MS:J = 5000L

.field private final static SEP:C = '\t'

.field private final static SHARED:I = 1

.field private final static SIG:Ljava/lang/String; = "\u0001"

.field private final static SIZE:I = 300

.field private final static SLOPE:D = -0.6D

.field private final static STORED:I = 0

.field private final static STORE_FAILED:I = 2

.field private final static STORE_NO_PICTURE:I = 1

.field private final static SUFFIX:Ljava/lang/String; = "-300q.jpg"

.field private final static UNKNOWN:I = -1

.field private final static UNREAD:Lcom/innioasis/ipp/BigCover$Src;

.field private static forgetting:I

.field private static lastNote:J

.field private static volatile lastQ:I

.field private static mayNone:Z

.field private final static mem:Ljava/util/Map;

.field private final static miss:Ljava/util/Hashtable;

.field private final static notes:Ljava/util/HashMap;

.field private static notesDirty:Z

.field private static notesLoaded:Z

.field private static volatile passing:Z

.field private static saveAsked:Z

.field private static swept:Z

.field private static worker:Landroid/os/Handler;

.method static constructor <clinit>()V
  .registers 1
  .line 58
    new-instance v0, Lcom/innioasis/ipp/BigCover$Lru;
    invoke-direct { v0 }, Lcom/innioasis/ipp/BigCover$Lru;-><init>()V
    invoke-static { v0 }, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
  .line 76
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
  .line 80
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/BigCover;->LOCK:Ljava/lang/Object;
  .line 557
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
  .line 641
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/BigCover;->NOTE_FILE:Ljava/lang/Object;
  .line 773
    new-instance v0, Lcom/innioasis/ipp/BigCover$Src;
    invoke-direct { v0 }, Lcom/innioasis/ipp/BigCover$Src;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/BigCover;->UNREAD:Lcom/innioasis/ipp/BigCover$Src;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 40
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000()Ljava/util/Map;
  .registers 1
  .line 38
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    return-object v0
.end method

.method static synthetic access$1000()J
  .registers 2
  .line 38
    sget-wide v0, Lcom/innioasis/ipp/BigCover;->lastNote:J
    return-wide v0
.end method

.method static synthetic access$1102(Z)Z
  .registers 1
  .line 38
    sput-boolean p0, Lcom/innioasis/ipp/BigCover;->saveAsked:Z
    return p0
.end method

.method static synthetic access$1200()V
  .registers 0
  .line 38
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
    return-void
.end method

.method private static declared-synchronized askSave()V
  .catchall { :L0 .. :L1 } :L5
  .catchall { :L3 .. :L4 } :L5
  .registers 4
    const-class v0, Lcom/innioasis/ipp/BigCover;
    monitor-enter v0
  :L0
  .line 651
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    sput-wide v1, Lcom/innioasis/ipp/BigCover;->lastNote:J
  .line 652
    sget-boolean v1, Lcom/innioasis/ipp/BigCover;->saveAsked:Z
  :L1
    if-eqz v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 653
    const/4 v1, 1
  :L3
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->saveAsked:Z
  .line 654
    new-instance v1, Lcom/innioasis/ipp/BigCover$Save;
    invoke-direct { v1 }, Lcom/innioasis/ipp/BigCover$Save;-><init>()V
    const-wide/16 v2, 5000
    invoke-static { v1, v2, v3 }, Lcom/innioasis/ipp/Albums;->later(Ljava/lang/Runnable;J)V
  :L4
  .line 655
    monitor-exit v0
    return-void
  :L5
  .line 650
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method public static beginCache()V
  .registers 1
  .line 540
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/BigCover;->passing:Z
  .line 541
    return-void
.end method

.method public static declared-synchronized beginForget()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
    const-class v0, Lcom/innioasis/ipp/BigCover;
    monitor-enter v0
  :L0
  .line 701
    sget v1, Lcom/innioasis/ipp/BigCover;->forgetting:I
    add-int/lit8 v1, v1, 1
    sput v1, Lcom/innioasis/ipp/BigCover;->forgetting:I
  :L1
  .line 702
    monitor-exit v0
    return-void
  :L2
  .line 700
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method public static cache(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;[B)Z
  .catchall { :L1 .. :L19 } :L20
  .registers 16
  .line 381
    const/4 v0, 1
    if-eqz p1, :L21
    if-nez p0, :L0
    goto/16 :L21
  :L0
  .line 383
    const/4 v1, 0
    const-wide/16 v2, 1
  :L1
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->needs(Ljava/lang/String;)Z
    move-result v4
    if-nez v4, :L2
    return v0
  :L2
  .line 384
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
  .line 385
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$100(Lcom/innioasis/ipp/BigCover$Walk;)Ljava/lang/String;
    move-result-object v5
    if-eqz v5, :L3
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$100(Lcom/innioasis/ipp/BigCover$Walk;)Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v5, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v5
    if-nez v5, :L3
    invoke-virtual { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->done()V
  :L3
  .line 386
    invoke-static { p0, v4 }, Lcom/innioasis/ipp/BigCover$Walk;->access$102(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;)Ljava/lang/String;
  .line 389
    if-eqz p2, :L4
    array-length v5, p2
    if-lez v5, :L4
  .line 390
    nop
  .line 391
    iget-wide v5, p0, Lcom/innioasis/ipp/BigCover$Walk;->embedded:J
    add-long/2addr v5, v2
    iput-wide v5, p0, Lcom/innioasis/ipp/BigCover$Walk;->embedded:J
    goto :L5
  :L4
  .line 393
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v5
  .line 394
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/BigCover;->external(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;)[B
    move-result-object p2
  .line 395
    iget-wide v7, p0, Lcom/innioasis/ipp/BigCover$Walk;->externalNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v9
    sub-long/2addr v9, v5
    add-long/2addr v7, v9
    iput-wide v7, p0, Lcom/innioasis/ipp/BigCover$Walk;->externalNs:J
  .line 396
    if-eqz p2, :L5
    array-length v5, p2
    if-lez v5, :L5
    iget-wide v5, p0, Lcom/innioasis/ipp/BigCover$Walk;->external:J
    add-long/2addr v5, v2
    iput-wide v5, p0, Lcom/innioasis/ipp/BigCover$Walk;->external:J
  :L5
  .line 398
    if-eqz p2, :L18
    array-length v5, p2
    if-nez v5, :L6
    goto/16 :L18
  :L6
  .line 401
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v5
    if-eqz v5, :L7
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v5
    invoke-static { v5, p2 }, Ljava/util/Arrays;->equals([B[B)Z
    move-result v5
    if-eqz v5, :L7
  .line 402
    iget-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->sameBytes:J
    add-long/2addr v4, v2
    iput-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->sameBytes:J
  .line 403
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 404
    return v0
  :L7
  .line 407
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v5
    const/4 v6, 2
    if-nez v5, :L12
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$300(Lcom/innioasis/ipp/BigCover$Walk;)Landroid/graphics/Bitmap;
    move-result-object v5
    if-nez v5, :L12
  .line 408
    invoke-static { v4 }, Lcom/innioasis/ipp/BigCover;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v5
  .line 409
    if-eqz v5, :L8
    invoke-virtual { v5 }, Ljava/io/File;->exists()Z
    move-result v5
    if-eqz v5, :L8
    invoke-static { v4, p2 }, Lcom/innioasis/ipp/BigCover;->sigIs(Ljava/lang/String;[B)Z
    move-result v5
    if-eqz v5, :L8
  .line 410
    iget-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->sigOnDisk:J
    add-long/2addr v4, v2
    iput-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->sigOnDisk:J
  .line 411
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/BigCover$Walk;->access$202(Lcom/innioasis/ipp/BigCover$Walk;[B)[B
  .line 412
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 413
    return v0
  :L8
  .line 415
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v7
  .line 416
    invoke-static { v4 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v5
  .line 417
    iget-wide v9, p0, Lcom/innioasis/ipp/BigCover$Walk;->decodeNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v11
    sub-long/2addr v11, v7
    add-long/2addr v9, v11
    iput-wide v9, p0, Lcom/innioasis/ipp/BigCover$Walk;->decodeNs:J
  .line 418
    if-nez v5, :L11
  .line 419
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v7
  .line 420
    invoke-static { p0, v4, p2 }, Lcom/innioasis/ipp/BigCover;->storeSrc(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;[B)I
    move-result v5
  .line 421
    iget-wide v9, p0, Lcom/innioasis/ipp/BigCover$Walk;->storeNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v11
    sub-long/2addr v11, v7
    add-long/2addr v9, v11
    iput-wide v9, p0, Lcom/innioasis/ipp/BigCover$Walk;->storeNs:J
  .line 422
    if-ne v5, v6, :L9
    iget-wide p1, p0, Lcom/innioasis/ipp/BigCover$Walk;->failed:J
    add-long/2addr p1, v2
    iput-wide p1, p0, Lcom/innioasis/ipp/BigCover$Walk;->failed:J
    return v1
  :L9
  .line 423
    if-ne v5, v0, :L10
    iget-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->none:J
    add-long/2addr v4, v2
    iput-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->none:J
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
    return v0
  :L10
  .line 424
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/BigCover$Walk;->access$202(Lcom/innioasis/ipp/BigCover$Walk;[B)[B
  .line 425
    invoke-static { v4, p2 }, Lcom/innioasis/ipp/BigCover;->sigSet(Ljava/lang/String;[B)V
  .line 426
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 427
    return v0
  :L11
  .line 429
    invoke-static { p0, v5 }, Lcom/innioasis/ipp/BigCover$Walk;->access$302(Lcom/innioasis/ipp/BigCover$Walk;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  :L12
  .line 432
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v4
  .line 433
    invoke-static { p2 }, Lcom/innioasis/ipp/BigCover;->capped([B)Landroid/graphics/Bitmap;
    move-result-object v7
  .line 434
    if-eqz v7, :L13
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$300(Lcom/innioasis/ipp/BigCover$Walk;)Landroid/graphics/Bitmap;
    move-result-object v8
    if-nez v8, :L13
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v8
    invoke-static { v8 }, Lcom/innioasis/ipp/BigCover;->capped([B)Landroid/graphics/Bitmap;
    move-result-object v8
    invoke-static { p0, v8 }, Lcom/innioasis/ipp/BigCover$Walk;->access$302(Lcom/innioasis/ipp/BigCover$Walk;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  :L13
  .line 435
    iget-wide v8, p0, Lcom/innioasis/ipp/BigCover$Walk;->decodeNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v10
    sub-long/2addr v10, v4
    add-long/2addr v8, v10
    iput-wide v8, p0, Lcom/innioasis/ipp/BigCover$Walk;->decodeNs:J
  .line 436
    if-nez v7, :L14
    iget-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->none:J
    add-long/2addr v4, v2
    iput-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->none:J
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
    return v0
  :L14
  .line 437
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$300(Lcom/innioasis/ipp/BigCover$Walk;)Landroid/graphics/Bitmap;
    move-result-object v4
    invoke-static { v4, v7 }, Lcom/innioasis/ipp/BigCover;->same(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Z
    move-result v4
    if-eqz v4, :L16
  .line 438
    iget-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->samePixels:J
    add-long/2addr v4, v2
    iput-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->samePixels:J
  .line 440
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v4
    if-nez v4, :L15
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/BigCover$Walk;->access$202(Lcom/innioasis/ipp/BigCover$Walk;[B)[B
  :L15
  .line 441
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 442
    return v0
  :L16
  .line 444
    new-instance v4, Lcom/innioasis/ipp/BigCover$Src;
    invoke-direct { v4 }, Lcom/innioasis/ipp/BigCover$Src;-><init>()V
  .line 445
    iput-object v7, v4, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
  .line 446
    iput-object p2, v4, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
  .line 447
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v7
  .line 448
    invoke-static { p1, v4, p0 }, Lcom/innioasis/ipp/BigCover;->store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;Lcom/innioasis/ipp/BigCover$Walk;)Z
    move-result p2
  .line 449
    iget-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->storeNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v9
    sub-long/2addr v9, v7
    add-long/2addr v4, v9
    iput-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->storeNs:J
  .line 450
    sget-object v4, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v4, p1 }, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 451
    if-nez p2, :L17
    iget-wide p1, p0, Lcom/innioasis/ipp/BigCover$Walk;->failed:J
    add-long/2addr p1, v2
    iput-wide p1, p0, Lcom/innioasis/ipp/BigCover$Walk;->failed:J
    return v1
  :L17
  .line 452
    iget-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->own:J
    add-long/2addr v4, v2
    iput-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->own:J
  .line 453
    invoke-static { p1, v6 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 454
    return v0
  :L18
  .line 398
    iget-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->none:J
    add-long/2addr v4, v2
    iput-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->none:J
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  :L19
    return v0
  :L20
  .line 455
    move-exception p1
  .line 456
    iget-wide p1, p0, Lcom/innioasis/ipp/BigCover$Walk;->failed:J
    add-long/2addr p1, v2
    iput-wide p1, p0, Lcom/innioasis/ipp/BigCover$Walk;->failed:J
  .line 457
    return v1
  :L21
  .line 381
    return v0
.end method

.method public static cachedFile(Ljava/lang/String;)Ljava/io/File;
  .registers 4
  .line 222
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 223
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->note(Ljava/lang/String;)I
    move-result v1
  .line 224
    const/4 v2, 2
    if-ne v1, v2, :L1
    goto :L3
  :L1
    const/4 v2, 1
    if-ne v1, v2, :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    goto :L3
  :L2
    move-object p0, v0
  :L3
  .line 225
    if-nez p0, :L4
    move-object p0, v0
    goto :L5
  :L4
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object p0
  :L5
  .line 226
    if-eqz p0, :L6
    invoke-virtual { p0 }, Ljava/io/File;->exists()Z
    move-result v1
    if-eqz v1, :L6
    move-object v0, p0
  :L6
    return-object v0
.end method

.method private static capped([B)Landroid/graphics/Bitmap;
  .catch Ljava/lang/OutOfMemoryError; { :L0 .. :L2 } :L5
  .catchall { :L0 .. :L2 } :L4
  .registers 7
  .line 812
    const/4 v0, 0
  :L0
    new-instance v1, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v1 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 813
    const/4 v2, 1
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 814
    array-length v2, p0
    const/4 v3, 0
    invoke-static { p0, v3, v2, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 815
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    if-lez v2, :L3
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    if-gtz v2, :L1
    goto :L3
  :L1
  .line 816
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    iget v4, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    const/16 v5, 300
    invoke-static { v2, v4, v5, v5 }, Lcom/innioasis/ipp/Art;->sample(IIII)I
    move-result v2
    iput v2, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 817
    iput-boolean v3, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 818
    array-length v2, p0
    invoke-static { p0, v3, v2, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object p0
  .line 819
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->square(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object p0
  :L2
    return-object p0
  :L3
  .line 815
    return-object v0
  :L4
  .line 822
    move-exception p0
  .line 823
    return-object v0
  :L5
  .line 820
    move-exception p0
  .line 821
    throw p0
.end method

.method public static clear()V
  .catchall { :L0 .. :L5 } :L6
  .registers 4
  .line 302
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v0 }, Ljava/util/Map;->clear()V
  .line 303
    sget-object v0, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 304
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteClear()V
  :L0
  .line 306
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->dir()Ljava/io/File;
    move-result-object v0
  .line 307
    if-nez v0, :L1
    return-void
  :L1
  .line 308
    invoke-virtual { v0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v1
  .line 309
    if-nez v1, :L2
    return-void
  :L2
  .line 310
    const/4 v2, 0
  :L3
    array-length v3, v1
    if-ge v2, v3, :L4
    aget-object v3, v1, v2
    invoke-virtual { v3 }, Ljava/io/File;->delete()Z
    add-int/lit8 v2, v2, 1
    goto :L3
  :L4
  .line 311
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  :L5
  .line 313
    goto :L7
  :L6
  .line 312
    move-exception v0
  :L7
  .line 314
    return-void
.end method

.method public static clearMiss()V
  .registers 1
  .line 296
    sget-object v0, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 297
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteForgetNone()V
  .line 298
    return-void
.end method

.method private static dir()Ljava/io/File;
  .catchall { :L3 .. :L5 } :L7
  .registers 5
  .line 1011
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 1012
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 1013
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 1014
    if-nez v0, :L1
    return-object v1
  :L1
  .line 1015
    new-instance v1, Ljava/io/File;
    const-string v2, "ipp_big"
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 1016
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v0
    if-nez v0, :L2
    invoke-virtual { v1 }, Ljava/io/File;->mkdirs()Z
  :L2
  .line 1017
    sget-boolean v0, Lcom/innioasis/ipp/BigCover;->swept:Z
    if-nez v0, :L8
  .line 1018
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/BigCover;->swept:Z
  :L3
  .line 1020
    invoke-virtual { v1 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v0
  .line 1021
    if-eqz v0, :L6
  .line 1022
    const/4 v2, 0
  :L4
    array-length v3, v0
    if-ge v2, v3, :L6
  .line 1023
    aget-object v3, v0, v2
    invoke-virtual { v3 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v3
    const-string v4, "-300q.jpg"
    invoke-virtual { v3, v4 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v3
    if-nez v3, :L5
    aget-object v3, v0, v2
    invoke-virtual { v3 }, Ljava/io/File;->delete()Z
  :L5
  .line 1022
    add-int/lit8 v2, v2, 1
    goto :L4
  :L6
  .line 1027
    goto :L8
  :L7
  .line 1026
    move-exception v0
  :L8
  .line 1029
    return-object v1
.end method

.method private static encode(Landroid/graphics/Bitmap;ILcom/innioasis/ipp/BigCover$Walk;)[B
  .catchall { :L0 .. :L1 } :L3
  .registers 9
  .line 953
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v0
  .line 955
    const-wide/16 v2, 1
  :L0
    new-instance v4, Ljava/io/ByteArrayOutputStream;
    const/16 v5, 25600
    invoke-direct { v4, v5 }, Ljava/io/ByteArrayOutputStream;-><init>(I)V
  .line 956
    sget-object v5, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;
    invoke-virtual { p0, v5, p1, v4 }, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
  .line 957
    invoke-virtual { v4 }, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    move-result-object p0
  :L1
  .line 961
    if-eqz p2, :L2
    iget-wide v4, p2, Lcom/innioasis/ipp/BigCover$Walk;->probes:J
    add-long/2addr v4, v2
    iput-wide v4, p2, Lcom/innioasis/ipp/BigCover$Walk;->probes:J
    iget-wide v2, p2, Lcom/innioasis/ipp/BigCover$Walk;->encodeNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v4
    sub-long/2addr v4, v0
    add-long/2addr v2, v4
    iput-wide v2, p2, Lcom/innioasis/ipp/BigCover$Walk;->encodeNs:J
  :L2
  .line 957
    return-object p0
  :L3
  .line 958
    move-exception p0
  .line 959
    nop
  .line 961
    if-eqz p2, :L4
    iget-wide p0, p2, Lcom/innioasis/ipp/BigCover$Walk;->probes:J
    add-long/2addr p0, v2
    iput-wide p0, p2, Lcom/innioasis/ipp/BigCover$Walk;->probes:J
    iget-wide p0, p2, Lcom/innioasis/ipp/BigCover$Walk;->encodeNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v2
    sub-long/2addr v2, v0
    add-long/2addr p0, v2
    iput-wide p0, p2, Lcom/innioasis/ipp/BigCover$Walk;->encodeNs:J
  :L4
  .line 959
    const/4 p0, 0
    return-object p0
.end method

.method public static endCache()V
  .registers 1
  .line 544
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/BigCover;->passing:Z
  .line 545
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  .line 546
    return-void
.end method

.method public static declared-synchronized endForget()V
  .catchall { :L0 .. :L2 } :L3
  .registers 2
    const-class v0, Lcom/innioasis/ipp/BigCover;
    monitor-enter v0
  :L0
  .line 705
    sget v1, Lcom/innioasis/ipp/BigCover;->forgetting:I
    if-lez v1, :L1
    add-int/lit8 v1, v1, -1
    sput v1, Lcom/innioasis/ipp/BigCover;->forgetting:I
  :L1
  .line 706
    sget v1, Lcom/innioasis/ipp/BigCover;->forgetting:I
    if-nez v1, :L2
    sget-boolean v1, Lcom/innioasis/ipp/BigCover;->passing:Z
    if-nez v1, :L2
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  :L2
  .line 707
    monitor-exit v0
    return-void
  :L3
  .line 704
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method private static external(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;)[B
  .catchall { :L2 .. :L3 } :L4
  .registers 6
  .line 479
    const/16 v0, 47
    invoke-virtual { p1, v0 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v0
  .line 480
    if-lez v0, :L0
    const/4 v1, 0
    invoke-virtual { p1, v1, v0 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v0
    goto :L1
  :L0
    const-string v0, ""
  :L1
  .line 481
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$400(Lcom/innioasis/ipp/BigCover$Walk;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$500(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object p0
    return-object p0
  :L2
  .line 483
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/BigCover;->externalFile(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;)[B
    move-result-object p1
  .line 484
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$402(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;)Ljava/lang/String;
  .line 485
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/BigCover$Walk;->access$502(Lcom/innioasis/ipp/BigCover$Walk;[B)[B
  .line 486
    iget-wide v0, p0, Lcom/innioasis/ipp/BigCover$Walk;->extLookups:J
    const-wide/16 v2, 1
    add-long/2addr v0, v2
    iput-wide v0, p0, Lcom/innioasis/ipp/BigCover$Walk;->extLookups:J
  :L3
  .line 487
    return-object p1
  :L4
  .line 488
    move-exception p0
  .line 489
    const/4 p0, 0
    return-object p0
.end method

.method private static external(Ljava/lang/String;)[B
  .catchall { :L0 .. :L2 } :L3
  .registers 3
  .line 464
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v1
  .line 465
    if-nez v1, :L1
    return-object v0
  :L1
  .line 466
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->stampRead(Ljava/lang/String;)V
  .line 467
    invoke-static { v1 }, Lcom/innioasis/ipp/BigCover;->readAll(Ljava/io/File;)[B
    move-result-object p0
  :L2
    return-object p0
  :L3
  .line 468
    move-exception p0
  .line 469
    return-object v0
.end method

.method private static externalFile(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;)[B
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/io/IOException;
    }
  .end annotation
  .registers 10
  .line 494
    invoke-static { p1 }, Lcom/innioasis/ipp/Art;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v0
  .line 495
    if-nez v0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 496
    invoke-static { p1 }, Lcom/innioasis/ipp/Art;->stampRead(Ljava/lang/String;)V
  .line 497
    invoke-virtual { v0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object p1
  .line 498
    invoke-virtual { v0 }, Ljava/io/File;->length()J
    move-result-wide v1
  .line 499
    invoke-virtual { v0 }, Ljava/io/File;->lastModified()J
    move-result-wide v3
  .line 500
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$600(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v5
    if-eqz v5, :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$700(Lcom/innioasis/ipp/BigCover$Walk;)Ljava/lang/String;
    move-result-object v5
    invoke-virtual { p1, v5 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v5
    if-eqz v5, :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$800(Lcom/innioasis/ipp/BigCover$Walk;)J
    move-result-wide v5
    cmp-long v7, v1, v5
    if-nez v7, :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$900(Lcom/innioasis/ipp/BigCover$Walk;)J
    move-result-wide v5
    cmp-long v7, v3, v5
    if-nez v7, :L1
  .line 501
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$600(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object p0
    return-object p0
  :L1
  .line 503
    invoke-static { v0 }, Lcom/innioasis/ipp/BigCover;->readAll(Ljava/io/File;)[B
    move-result-object v0
  .line 504
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/BigCover$Walk;->access$702(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;)Ljava/lang/String;
  .line 505
    invoke-static { p0, v1, v2 }, Lcom/innioasis/ipp/BigCover$Walk;->access$802(Lcom/innioasis/ipp/BigCover$Walk;J)J
  .line 506
    invoke-static { p0, v3, v4 }, Lcom/innioasis/ipp/BigCover$Walk;->access$902(Lcom/innioasis/ipp/BigCover$Walk;J)J
  .line 507
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$602(Lcom/innioasis/ipp/BigCover$Walk;[B)[B
  .line 508
    return-object v0
.end method

.method private static file(Ljava/lang/String;)Ljava/io/File;
  .registers 3
  .line 971
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->dir()Ljava/io/File;
    move-result-object v0
  .line 972
    if-nez v0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 973
    new-instance v1, Ljava/io/File;
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->name(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-direct { v1, v0, p0 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    return-object v1
.end method

.method private static fit(Lcom/innioasis/ipp/BigCover$Src;Lcom/innioasis/ipp/BigCover$Walk;)[B
  .registers 26
  .line 894
    move-object/from16 v0, p0
    move-object/from16 v1, p1
    iget-object v2, v0, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
    const/16 v3, 25600
    if-eqz v2, :L0
    iget-object v2, v0, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
    array-length v2, v2
    if-gt v2, v3, :L0
    iget-object v2, v0, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
    invoke-static { v2 }, Lcom/innioasis/ipp/BigCover;->isJpeg([B)Z
    move-result v2
    if-eqz v2, :L0
    iget-object v0, v0, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
    return-object v0
  :L0
  .line 899
    nop
  .line 900
    nop
  .line 901
    nop
  .line 902
    nop
  .line 903
    nop
  .line 904
    sget v2, Lcom/innioasis/ipp/BigCover;->lastQ:I
  .line 905
    const/16 v4, 92
    const/16 v5, 76
    if-lt v2, v5, :L1
    if-le v2, v4, :L2
  :L1
    const/16 v2, 84
  :L2
  .line 906
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->limit()I
    move-result v6
    int-to-double v6, v6
    invoke-static { v6, v7 }, Ljava/lang/Math;->log(D)D
    move-result-wide v6
  .line 907
    nop
  .line 908
    const/4 v8, 0
    const/4 v9, 0
    move-object v12, v9
    move-object v13, v12
    const/4 v9, 0
    const/16 v14, 76
    const-wide/16 v15, 0
    const-wide/16 v17, 0
  :L3
  .line 909
    if-gt v14, v4, :L15
  .line 910
    if-ge v2, v14, :L4
    move v2, v14
  :L4
  .line 911
    if-le v2, v4, :L5
    move v2, v4
  :L5
  .line 912
    iget-object v10, v0, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
    invoke-static { v10, v2, v1 }, Lcom/innioasis/ipp/BigCover;->encode(Landroid/graphics/Bitmap;ILcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v10
  .line 913
    if-nez v10, :L6
    goto/16 :L15
  :L6
  .line 914
    array-length v11, v10
    if-gt v11, v3, :L7
  .line 915
    nop
  .line 916
    nop
  .line 917
    add-int/lit8 v14, v2, 1
    move v8, v2
    move-object v12, v10
    goto :L9
  :L7
  .line 919
    if-ne v2, v5, :L8
    move-object v13, v10
  :L8
  .line 920
    add-int/lit8 v4, v2, -1
  :L9
  .line 922
    nop
  .line 923
    nop
  .line 924
    mul-int/lit8 v2, v2, 2
    const/16 v11, 200
    rsub-int v2, v2, 200
    move/from16 v21, v4
    int-to-double v3, v2
    invoke-static { v3, v4 }, Ljava/lang/Math;->log(D)D
    move-result-wide v2
  .line 925
    array-length v4, v10
    move-object v10, v12
    int-to-double v11, v4
    invoke-static { v11, v12 }, Ljava/lang/Math;->log(D)D
    move-result-wide v11
  .line 926
    const/4 v4, 1
    add-int/2addr v9, v4
  .line 927
    nop
  .line 928
    if-le v9, v4, :L10
    cmpl-double v22, v2, v15
    if-eqz v22, :L10
  .line 929
    sub-double v17, v11, v17
    sub-double v15, v2, v15
    div-double v17, v17, v15
  .line 930
    const-wide/16 v15, 0
    cmpg-double v19, v17, v15
    if-gez v19, :L11
    goto :L12
  :L10
  .line 928
    const-wide/16 v15, 0
  :L11
  .line 932
    const-wide v17, -4619792497756654797L
  :L12
    sub-double v19, v6, v11
    div-double v19, v19, v17
    add-double v19, v2, v19
    invoke-static/range { v19 .. v20 }, Ljava/lang/Math;->exp(D)D
    move-result-wide v17
  .line 933
    move-wide/from16 v22, v6
    invoke-static/range { v17 .. v18 }, Ljava/lang/Math;->ceil(D)D
    move-result-wide v5
    double-to-int v5, v5
  .line 934
    const/16 v6, 200
    if-lt v5, v6, :L13
    const/16 v4, 76
    goto :L14
  :L13
    rsub-int v5, v5, 200
    shr-int/lit8 v4, v5, 1
  :L14
  .line 935
    move-wide v15, v2
    move v2, v4
    move-wide/from16 v17, v11
    move/from16 v4, v21
    move-wide/from16 v6, v22
    const/16 v3, 25600
    const/16 v5, 76
    move-object v12, v10
    goto :L3
  :L15
  .line 936
    if-eqz v12, :L16
    move-object v13, v12
    goto :L18
  :L16
    if-eqz v13, :L17
    goto :L18
  :L17
    iget-object v0, v0, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
    const/16 v2, 76
    invoke-static { v0, v2, v1 }, Lcom/innioasis/ipp/BigCover;->encode(Landroid/graphics/Bitmap;ILcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v13
  :L18
  .line 937
    if-eqz v12, :L19
    sput v8, Lcom/innioasis/ipp/BigCover;->lastQ:I
  :L19
  .line 938
    return-object v13
.end method

.method public static forget(Ljava/lang/String;)V
  .catchall { :L1 .. :L2 } :L3
  .registers 2
  .line 282
    if-nez p0, :L0
    return-void
  :L0
  .line 283
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v0, p0 }, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 284
    sget-object v0, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v0, p0 }, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 285
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->noteForget(Ljava/lang/String;)V
  :L1
  .line 287
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v0
  .line 288
    if-eqz v0, :L2
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  :L2
  .line 290
    goto :L4
  :L3
  .line 289
    move-exception v0
  :L4
  .line 291
    invoke-static { p0 }, Lcom/innioasis/ipp/FlowCache;->forget(Ljava/lang/String;)V
  .line 292
    return-void
.end method

.method private static isJpeg([B)Z
  .registers 6
  .line 967
    array-length v0, p0
    const/4 v1, 3
    const/4 v2, 0
    if-le v0, v1, :L0
    aget-byte v0, p0, v2
    const/16 v1, 255
    and-int/2addr v0, v1
    if-ne v0, v1, :L0
    const/4 v0, 1
    aget-byte v3, p0, v0
    and-int/2addr v3, v1
    const/16 v4, 216
    if-ne v3, v4, :L0
    const/4 v3, 2
    aget-byte p0, p0, v3
    and-int/2addr p0, v1
    if-ne p0, v1, :L0
    const/4 v2, 1
  :L0
    return v2
.end method

.method public static keep(Ljava/lang/String;Landroid/graphics/Bitmap;)V
  .registers 4
  .line 251
    if-eqz p0, :L0
    if-eqz p1, :L0
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v0, p0 }, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    if-nez v1, :L0
    invoke-interface { v0, p0, p1 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L0
  .line 252
    return-void
.end method

.method public static knownNone(Ljava/lang/String;)Z
  .registers 1
  .line 370
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->note(Ljava/lang/String;)I
    move-result p0
    if-nez p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method private static limit()I
  .registers 1
  .line 946
    const/16 v0, 25600
    return v0
.end method

.method static memBytes()J
  .catchall { :L0 .. :L1 } :L2
  .catchall { :L3 .. :L4 } :L2
  .registers 3
  .line 63
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    monitor-enter v0
  :L0
  .line 64
    new-instance v1, Ljava/util/ArrayList;
    invoke-interface { v0 }, Ljava/util/Map;->values()Ljava/util/Collection;
    move-result-object v2
    invoke-direct { v1, v2 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 65
    monitor-exit v0
  :L1
  .line 66
    invoke-static { v1 }, Lcom/innioasis/ipp/Diag;->bitmapBytes(Ljava/util/Collection;)J
    move-result-wide v0
    return-wide v0
  :L2
  .line 65
    move-exception v1
  :L3
    monitor-exit v0
  :L4
    throw v1
.end method

.method private static name(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 977
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { p0 }, Ljava/lang/String;->hashCode()I
    move-result v1
    invoke-static { v1 }, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, "-"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result p0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v0, "-300q.jpg"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static needs(Ljava/lang/String;)Z
  .registers 4
  .line 354
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->note(Ljava/lang/String;)I
    move-result v0
  .line 355
    const/4 v1, -1
    const/4 v2, 1
    if-ne v0, v1, :L0
    return v2
  :L0
  .line 356
    const/4 v1, 0
    if-nez v0, :L1
    return v1
  :L1
  .line 357
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->cachedFile(Ljava/lang/String;)Ljava/io/File;
    move-result-object p0
    if-nez p0, :L2
    goto :L3
  :L2
    const/4 v2, 0
  :L3
    return v2
.end method

.method private static declared-synchronized note(Ljava/lang/String;)I
  .catchall { :L0 .. :L3 } :L5
  .registers 4
    const-class v0, Lcom/innioasis/ipp/BigCover;
    monitor-enter v0
  .line 673
    const/4 v1, -1
    if-nez p0, :L0
    monitor-exit v0
    return v1
  :L0
  .line 674
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 675
    sget-object v2, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v2, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 676
    if-nez p0, :L2
  :L1
    goto :L4
  :L2
    check-cast p0, Ljava/lang/Integer;
    invoke-virtual { p0 }, Ljava/lang/Integer;->intValue()I
    move-result v1
  :L3
    goto :L1
  :L4
    monitor-exit v0
    return v1
  :L5
  .line 672
    move-exception p0
    monitor-exit v0
    goto :L7
  :L6
    throw p0
  :L7
    goto :L6
.end method

.method private static declared-synchronized noteClear()V
  .catchall { :L0 .. :L1 } :L5
  .catchall { :L1 .. :L2 } :L3
  .registers 3
    const-class v0, Lcom/innioasis/ipp/BigCover;
    monitor-enter v0
  :L0
  .line 756
    sget-object v1, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v1 }, Ljava/util/HashMap;->clear()V
  .line 757
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->mayNone:Z
  .line 758
    const/4 v2, 1
    sput-boolean v2, Lcom/innioasis/ipp/BigCover;->notesLoaded:Z
  .line 759
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  :L1
  .line 761
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteFile()Ljava/io/File;
    move-result-object v1
  .line 762
    if-eqz v1, :L2
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-eqz v2, :L2
    invoke-virtual { v1 }, Ljava/io/File;->delete()Z
  :L2
  .line 764
    goto :L4
  :L3
  .line 763
    move-exception v1
  :L4
  .line 765
    monitor-exit v0
    return-void
  :L5
  .line 755
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method private static noteFile()Ljava/io/File;
  .registers 3
  .line 565
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 566
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 567
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 569
    if-nez v0, :L1
    goto :L2
  :L1
    new-instance v1, Ljava/io/File;
    const-string v2, "ipp_bigcover.txt"
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  :L2
    return-object v1
.end method

.method private static declared-synchronized noteForget(Ljava/lang/String;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 7
    const-class v0, Lcom/innioasis/ipp/BigCover;
    monitor-enter v0
  :L0
  .line 691
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 692
    sget-object v1, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v1, p0 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
    const/4 v3, 1
    if-eqz v2, :L1
    const/4 v2, 1
    goto :L2
  :L1
    const/4 v2, 0
  :L2
  .line 693
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v5, "\u0001"
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v1, p0 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    if-eqz p0, :L3
    const/4 v2, 1
  :L3
  .line 694
    if-eqz v2, :L4
    sput-boolean v3, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
    sget p0, Lcom/innioasis/ipp/BigCover;->forgetting:I
    if-nez p0, :L4
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  :L4
  .line 695
    monitor-exit v0
    return-void
  :L5
  .line 690
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method private static declared-synchronized noteForgetNone()V
  .catchall { :L0 .. :L1 } :L12
  .catchall { :L2 .. :L7 } :L12
  .catchall { :L9 .. :L11 } :L12
  .registers 6
    const-class v0, Lcom/innioasis/ipp/BigCover;
    monitor-enter v0
  :L0
  .line 711
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 712
    sget-boolean v1, Lcom/innioasis/ipp/BigCover;->mayNone:Z
  :L1
    if-nez v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 713
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 714
    sget-object v2, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v2 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v2
    invoke-interface { v2 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v2
  :L3
  .line 715
    invoke-interface { v2 }, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :L6
  .line 716
    invoke-interface { v2 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/util/Map$Entry;
  .line 717
    invoke-interface { v3 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
    const-string v5, "\u0001"
    invoke-virtual { v4, v5 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :L4
    goto :L3
  :L4
  .line 718
    invoke-interface { v3 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/Integer;
    invoke-virtual { v4 }, Ljava/lang/Integer;->intValue()I
    move-result v4
    if-nez v4, :L5
    invoke-interface { v3 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v3
    invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L5
  .line 719
    goto :L3
  :L6
  .line 720
    const/4 v2, 0
    sput-boolean v2, Lcom/innioasis/ipp/BigCover;->mayNone:Z
  .line 721
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v3
  :L7
    if-eqz v3, :L8
    monitor-exit v0
    return-void
  :L8
  .line 722
    nop
  :L9
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge v2, v3, :L10
    sget-object v3, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v1, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v4
    invoke-virtual { v3, v4 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    add-int/lit8 v2, v2, 1
    goto :L9
  :L10
  .line 723
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  .line 724
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  :L11
  .line 725
    monitor-exit v0
    return-void
  :L12
  .line 710
    move-exception v1
    monitor-exit v0
    goto :L14
  :L13
    throw v1
  :L14
    goto :L13
.end method

.method private static declared-synchronized noteLoad()V
  .catchall { :L0 .. :L1 } :L17
  .catchall { :L3 .. :L4 } :L17
  .catchall { :L4 .. :L7 } :L15
  .catchall { :L9 .. :L10 } :L11
  .registers 9
    const-class v0, Lcom/innioasis/ipp/BigCover;
    monitor-enter v0
  :L0
  .line 573
    sget-boolean v1, Lcom/innioasis/ipp/BigCover;->notesLoaded:Z
  :L1
    if-eqz v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 574
    const/4 v1, 1
  :L3
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesLoaded:Z
  :L4
  .line 576
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteFile()Ljava/io/File;
    move-result-object v2
  .line 577
    if-eqz v2, :L14
    invoke-virtual { v2 }, Ljava/io/File;->exists()Z
    move-result v3
    if-nez v3, :L5
    goto :L14
  :L5
  .line 578
    new-instance v3, Ljava/io/FileInputStream;
    invoke-direct { v3, v2 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 579
    invoke-virtual { v3 }, Ljava/io/FileInputStream;->available()I
    move-result v2
    new-array v2, v2, [B
  .line 580
    invoke-virtual { v3, v2 }, Ljava/io/FileInputStream;->read([B)I
  .line 581
    invoke-virtual { v3 }, Ljava/io/FileInputStream;->close()V
  .line 582
    new-instance v3, Ljava/lang/String;
    const-string v4, "UTF-8"
    invoke-direct { v3, v2, v4 }, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    const-string v2, "\n"
    invoke-virtual { v3, v2 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v2
  .line 583
    const/4 v3, 0
    const/4 v4, 0
  :L6
    array-length v5, v2
    if-ge v4, v5, :L13
  .line 584
    aget-object v5, v2, v4
  .line 585
    const/16 v6, 9
    invoke-virtual { v5, v6 }, Ljava/lang/String;->indexOf(I)I
    move-result v6
  :L7
  .line 586
    if-gtz v6, :L8
    goto :L12
  :L8
  .line 588
    add-int/lit8 v7, v6, 1
  :L9
    invoke-virtual { v5, v7 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v7
    invoke-virtual { v7 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v7
    invoke-static { v7 }, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;
    move-result-object v7
  .line 589
    sget-object v8, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v5, v3, v6 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v8, v5, v7 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 590
    invoke-virtual { v7 }, Ljava/lang/Integer;->intValue()I
    move-result v5
    if-nez v5, :L10
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->mayNone:Z
  :L10
  .line 592
    goto :L12
  :L11
  .line 591
    move-exception v5
  :L12
  .line 583
    add-int/lit8 v4, v4, 1
    goto :L6
  :L13
  .line 595
    goto :L16
  :L14
  .line 577
    monitor-exit v0
    return-void
  :L15
  .line 594
    move-exception v1
  :L16
  .line 596
    monitor-exit v0
    return-void
  :L17
  .line 572
    move-exception v1
    monitor-exit v0
    goto :L19
  :L18
    throw v1
  :L19
    goto :L18
.end method

.method private static noteSave()V
  .catchall { :L0 .. :L2 } :L21
  .catchall { :L3 .. :L4 } :L11
  .catchall { :L5 .. :L7 } :L9
  .catchall { :L8 .. :L10 } :L11
  .catchall { :L12 .. :L13 } :L18
  .catchall { :L14 .. :L16 } :L15
  .catchall { :L19 .. :L20 } :L18
  .catchall { :L22 .. :L23 } :L21
  .registers 11
  .line 601
    const-class v0, Lcom/innioasis/ipp/BigCover;
    monitor-enter v0
  :L0
  .line 602
    sget-boolean v1, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
    if-nez v1, :L1
    monitor-exit v0
    return-void
  :L1
  .line 603
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  .line 604
    sget-object v2, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v2 }, Ljava/util/HashMap;->keySet()Ljava/util/Set;
    move-result-object v3
    invoke-interface { v3 }, Ljava/util/Set;->toArray()[Ljava/lang/Object;
    move-result-object v3
  .line 605
    invoke-virtual { v2 }, Ljava/util/HashMap;->values()Ljava/util/Collection;
    move-result-object v2
    invoke-interface { v2 }, Ljava/util/Collection;->toArray()[Ljava/lang/Object;
    move-result-object v2
  .line 606
    monitor-exit v0
  :L2
  .line 607
    nop
  .line 608
    sget-object v4, Lcom/innioasis/ipp/BigCover;->NOTE_FILE:Ljava/lang/Object;
    monitor-enter v4
  :L3
  .line 610
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteFile()Ljava/io/File;
    move-result-object v0
  .line 611
    if-eqz v0, :L10
  .line 614
    new-instance v5, Ljava/io/File;
    new-instance v6, Ljava/lang/StringBuilder;
    invoke-direct { v6 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v7
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    const-string v7, ".tmp"
    invoke-virtual { v6, v7 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v6
    invoke-virtual { v6 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v6
    invoke-direct { v5, v6 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 615
    new-instance v6, Ljava/io/BufferedWriter;
    new-instance v7, Ljava/io/OutputStreamWriter;
    new-instance v8, Ljava/io/FileOutputStream;
    invoke-direct { v8, v5 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    const-string v9, "UTF-8"
    invoke-direct { v7, v8, v9 }, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V
    const/16 v8, 8192
    invoke-direct { v6, v7, v8 }, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;I)V
  :L4
  .line 618
    const/4 v7, 0
  :L5
    array-length v8, v3
    if-ge v7, v8, :L8
  .line 619
    aget-object v8, v3, v7
    check-cast v8, Ljava/lang/String;
  .line 620
    if-eqz v8, :L7
    const/16 v9, 9
    invoke-virtual { v8, v9 }, Ljava/lang/String;->indexOf(I)I
    move-result v10
    if-ltz v10, :L6
    goto :L7
  :L6
  .line 621
    invoke-virtual { v6, v8 }, Ljava/io/Writer;->write(Ljava/lang/String;)V
  .line 622
    invoke-virtual { v6, v9 }, Ljava/io/Writer;->write(I)V
  .line 623
    aget-object v8, v2, v7
    check-cast v8, Ljava/lang/Integer;
    invoke-virtual { v8 }, Ljava/lang/Integer;->intValue()I
    move-result v8
    invoke-static { v8 }, Ljava/lang/String;->valueOf(I)Ljava/lang/String;
    move-result-object v8
    invoke-virtual { v6, v8 }, Ljava/io/Writer;->write(Ljava/lang/String;)V
  .line 624
    const/16 v8, 10
    invoke-virtual { v6, v8 }, Ljava/io/Writer;->write(I)V
  :L7
  .line 618
    add-int/lit8 v7, v7, 1
    goto :L5
  :L8
  .line 627
    invoke-virtual { v6 }, Ljava/io/Writer;->close()V
  .line 628
    nop
  .line 629
    invoke-virtual { v5, v0 }, Ljava/io/File;->renameTo(Ljava/io/File;)Z
    move-result v1
    goto :L10
  :L9
  .line 627
    move-exception v0
    invoke-virtual { v6 }, Ljava/io/Writer;->close()V
  .line 628
    throw v0
  :L10
  .line 632
    goto :L12
  :L11
  .line 631
    move-exception v0
  :L12
  .line 633
    monitor-exit v4
  :L13
  .line 634
    if-nez v1, :L17
  .line 635
    const-class v0, Lcom/innioasis/ipp/BigCover;
    monitor-enter v0
  .line 636
    const/4 v1, 1
  :L14
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  .line 637
    monitor-exit v0
    goto :L17
  :L15
    move-exception v1
    monitor-exit v0
  :L16
    throw v1
  :L17
  .line 639
    return-void
  :L18
  .line 633
    move-exception v0
  :L19
    monitor-exit v4
  :L20
    throw v0
  :L21
  .line 606
    move-exception v1
  :L22
    monitor-exit v0
  :L23
    goto :L25
  :L24
    throw v1
  :L25
    goto :L24
.end method

.method private static declared-synchronized noteSet(Ljava/lang/String;I)V
  .catchall { :L0 .. :L2 } :L5
  .catchall { :L3 .. :L4 } :L5
  .registers 5
    const-class v0, Lcom/innioasis/ipp/BigCover;
    monitor-enter v0
  .line 681
    if-nez p0, :L0
    monitor-exit v0
    return-void
  :L0
  .line 682
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 683
    sget-object v1, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
    invoke-virtual { v1, p0, v2 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 684
    const/4 v1, 1
    if-nez p1, :L1
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->mayNone:Z
  :L1
  .line 685
    if-eqz p0, :L3
    check-cast p0, Ljava/lang/Integer;
    invoke-virtual { p0 }, Ljava/lang/Integer;->intValue()I
    move-result p0
  :L2
    if-ne p0, p1, :L3
    monitor-exit v0
    return-void
  :L3
  .line 686
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  .line 687
    sget-boolean p0, Lcom/innioasis/ipp/BigCover;->passing:Z
    if-nez p0, :L4
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->askSave()V
  :L4
  .line 688
    monitor-exit v0
    return-void
  :L5
  .line 680
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method public static ownArt(Ljava/lang/String;)Z
  .registers 2
  .line 362
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->note(Ljava/lang/String;)I
    move-result p0
    const/4 v0, 2
    if-ne p0, v0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method public static peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
  .registers 2
  .line 234
    const/4 v0, 1
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;Z)Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
.end method

.method private static peek(Ljava/lang/String;Z)Landroid/graphics/Bitmap;
  .catchall { :L3 .. :L4 } :L5
  .registers 8
  .line 255
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 256
    sget-object v1, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v1, p0 }, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  .line 257
    if-eqz v1, :L1
    check-cast v1, Landroid/graphics/Bitmap;
    return-object v1
  :L1
  .line 258
    sget-object v1, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L2
    return-object v0
  :L2
  .line 259
    nop
  :L3
  .line 261
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v1
  .line 262
    if-eqz v1, :L4
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-eqz v2, :L4
  .line 263
    invoke-virtual { v1 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object v1
  .line 264
    new-instance v2, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v2 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 265
    const/4 v3, 1
    iput-boolean v3, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 266
    invoke-static { v1, v2 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 267
    iget v3, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    if-lez v3, :L4
    iget v3, v2, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    if-lez v3, :L4
  .line 268
    iget v3, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    iget v4, v2, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    const/16 v5, 300
    invoke-static { v3, v4, v5, v5 }, Lcom/innioasis/ipp/Art;->sample(IIII)I
    move-result v3
    iput v3, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 269
    const/4 v3, 0
    iput-boolean v3, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 270
    invoke-static { v1, v2 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/BigCover;->square(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object v0
  :L4
  .line 275
    goto :L6
  :L5
  .line 273
    move-exception v1
  .line 274
    nop
  :L6
  .line 276
    if-eqz v0, :L7
    if-eqz p1, :L7
    sget-object p1, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { p1, p0, v0 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L7
  .line 277
    return-object v0
.end method

.method public static peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
  .registers 4
  .line 211
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 212
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 213
    if-eqz v1, :L1
    return-object v1
  :L1
  .line 214
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->note(Ljava/lang/String;)I
    move-result v1
    const/4 v2, 1
    if-eq v1, v2, :L2
    return-object v0
  :L2
  .line 215
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 216
    if-eqz v0, :L3
    sget-object v1, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v1, p0, v0 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L3
  .line 217
    return-object v0
.end method

.method public static peekTrackFree(Ljava/lang/String;)Landroid/graphics/Bitmap;
  .registers 5
  .line 243
    if-nez p0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 244
    const/4 v0, 0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;Z)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 245
    if-nez v1, :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->note(Ljava/lang/String;)I
    move-result v2
    const/4 v3, 1
    if-eq v2, v3, :L1
    goto :L2
  :L1
  .line 246
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;Z)Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
  :L2
  .line 245
    return-object v1
.end method

.method public static prefetch(Ljava/util/List;I)V
  .catchall { :L0 .. :L3 } :L4
  .registers 3
  .line 153
    if-eqz p0, :L6
    if-ltz p1, :L6
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    if-lt p1, v0, :L1
    goto :L6
  :L1
  .line 154
    invoke-interface { p0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p0
  .line 155
    instance-of p1, p0, Lcom/innioasis/y1/database/Song;
    if-nez p1, :L2
    return-void
  :L2
  .line 156
    move-object p1, p0
    check-cast p1, Lcom/innioasis/y1/database/Song;
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Ahead;->picked(Ljava/lang/String;)V
  .line 157
    check-cast p0, Lcom/innioasis/y1/database/Song;
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->warm(Ljava/lang/String;)V
  :L3
  .line 159
    goto :L5
  :L4
  .line 158
    move-exception p0
  :L5
  .line 160
    return-void
  :L6
  .line 153
    return-void
.end method

.method public static prefetchPlaying()V
  .catchall { :L0 .. :L5 } :L6
  .registers 2
  :L0
  .line 170
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 171
    const/4 v1, 0
    if-nez v0, :L1
    move-object v0, v1
    goto :L2
  :L1
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingSong()Lcom/innioasis/y1/database/Song;
    move-result-object v0
  :L2
  .line 172
    if-nez v0, :L3
    goto :L4
  :L3
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
  :L4
    invoke-static { v1 }, Lcom/innioasis/ipp/BigCover;->warm(Ljava/lang/String;)V
  .line 173
    invoke-static { }, Lcom/innioasis/ipp/Queue;->nextPath()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/BigCover;->warm(Ljava/lang/String;)V
  :L5
  .line 175
    goto :L7
  :L6
  .line 174
    move-exception v0
  :L7
  .line 176
    return-void
.end method

.method static prune(Lcom/innioasis/ipp/Stale$Keys;Ljava/util/Set;Z)J
  .registers 6
  .line 985
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->dir()Ljava/io/File;
    move-result-object v0
    const-string v1, "-300q.jpg"
    const/4 v2, 0
    invoke-static { v0, p0, v1, v2, p2 }, Lcom/innioasis/ipp/Stale;->files(Ljava/io/File;Lcom/innioasis/ipp/Stale$Keys;Ljava/lang/String;ZZ)J
    move-result-wide v0
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/BigCover;->pruneNotes(Lcom/innioasis/ipp/Stale$Keys;Ljava/util/Set;Z)J
    move-result-wide p0
    add-long/2addr v0, p0
    return-wide v0
.end method

.method private static declared-synchronized pruneNotes(Lcom/innioasis/ipp/Stale$Keys;Ljava/util/Set;Z)J
  .catchall { :L0 .. :L8 } :L9
  .registers 12
    const-class v0, Lcom/innioasis/ipp/BigCover;
    monitor-enter v0
  :L0
  .line 989
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 990
    nop
  .line 991
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 992
    sget-object v2, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v2 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v2
    invoke-interface { v2 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v2
    const-wide/16 v3, 0
  :L1
  .line 993
    invoke-interface { v2 }, Ljava/util/Iterator;->hasNext()Z
    move-result v5
    if-eqz v5, :L5
  .line 994
    invoke-interface { v2 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/util/Map$Entry;
  .line 995
    invoke-interface { v5 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Ljava/lang/String;
  .line 996
    const-string v7, "\u0001"
    invoke-virtual { v6, v7 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v7
    if-eqz v7, :L2
    const-string v7, "\u0001"
    invoke-virtual { v7 }, Ljava/lang/String;->length()I
    move-result v7
    invoke-virtual { v6, v7 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v7
    invoke-interface { p1, v7 }, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    move-result v7
    goto :L3
  :L2
  .line 997
    invoke-static { v6 }, Lcom/innioasis/ipp/Stale$Keys;->of(Ljava/lang/String;)J
    move-result-wide v7
    invoke-virtual { p0, v7, v8 }, Lcom/innioasis/ipp/Stale$Keys;->has(J)Z
    move-result v7
  :L3
  .line 998
    if-eqz v7, :L4
    goto :L1
  :L4
  .line 999
    invoke-virtual { v1, v6 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 1000
    invoke-interface { v5 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v5
    invoke-static { v5 }, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v5
    invoke-static { v6, v5 }, Lcom/innioasis/ipp/Stale;->line(Ljava/lang/String;Ljava/lang/String;)J
    move-result-wide v5
    add-long/2addr v3, v5
  .line 1001
    goto :L1
  :L5
  .line 1002
    if-eqz p2, :L8
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result p0
    if-nez p0, :L8
  .line 1003
    const/4 p0, 0
  :L6
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result p1
    if-ge p0, p1, :L7
    sget-object p1, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v1, p0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object p2
    invoke-virtual { p1, p2 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    add-int/lit8 p0, p0, 1
    goto :L6
  :L7
  .line 1004
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  .line 1005
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  :L8
  .line 1007
    monitor-exit v0
    return-wide v3
  :L9
  .line 988
    move-exception p0
    monitor-exit v0
    goto :L11
  :L10
    throw p0
  :L11
    goto :L10
.end method

.method private static read(Ljava/lang/String;)Lcom/innioasis/ipp/BigCover$Src;
  .registers 4
  .line 780
    const/4 v0, 1
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Meta;->read(Ljava/lang/String;Z)Lcom/innioasis/ipp/Meta$Info;
    move-result-object v0
  .line 781
    iget-object v1, v0, Lcom/innioasis/ipp/Meta$Info;->art:[B
    if-eqz v1, :L0
    iget-object v1, v0, Lcom/innioasis/ipp/Meta$Info;->art:[B
    array-length v1, v1
    if-lez v1, :L0
    iget-object p0, v0, Lcom/innioasis/ipp/Meta$Info;->art:[B
    goto :L1
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->external(Ljava/lang/String;)[B
    move-result-object p0
  :L1
  .line 782
    const/4 v1, 0
    if-eqz p0, :L4
    array-length v2, p0
    if-nez v2, :L2
    goto :L4
  :L2
  .line 783
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->capped([B)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 784
    if-nez v0, :L3
    return-object v1
  :L3
  .line 785
    new-instance v1, Lcom/innioasis/ipp/BigCover$Src;
    invoke-direct { v1 }, Lcom/innioasis/ipp/BigCover$Src;-><init>()V
  .line 786
    iput-object v0, v1, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
  .line 787
    iput-object p0, v1, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
  .line 788
    return-object v1
  :L4
  .line 782
    iget-boolean p0, v0, Lcom/innioasis/ipp/Meta$Info;->ok:Z
    if-eqz p0, :L5
    goto :L6
  :L5
    sget-object v1, Lcom/innioasis/ipp/BigCover;->UNREAD:Lcom/innioasis/ipp/BigCover$Src;
  :L6
    return-object v1
.end method

.method private static readAll(Ljava/io/File;)[B
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/io/IOException;
    }
  .end annotation
  .catchall { :L2 .. :L3 } :L5
  .registers 7
  .line 792
    invoke-virtual { p0 }, Ljava/io/File;->length()J
    move-result-wide v0
  .line 793
    const-wide/16 v2, 0
    const/4 v4, 0
    cmp-long v5, v0, v2
    if-lez v5, :L7
    const-wide/32 v2, 8388608
    cmp-long v5, v0, v2
    if-lez v5, :L0
    goto :L7
  :L0
  .line 794
    long-to-int v1, v0
    new-array v0, v1, [B
  .line 795
    new-instance v2, Ljava/io/FileInputStream;
    invoke-direct { v2, p0 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 797
    const/4 p0, 0
  :L1
  .line 798
    if-ge p0, v1, :L6
  .line 799
    sub-int v3, v1, p0
  :L2
    invoke-virtual { v2, v0, p0, v3 }, Ljava/io/FileInputStream;->read([BII)I
    move-result v3
  :L3
  .line 800
    if-gez v3, :L4
  .line 804
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 800
    return-object v4
  :L4
  .line 801
    add-int/2addr p0, v3
  .line 802
    goto :L1
  :L5
  .line 804
    move-exception p0
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 805
    throw p0
  :L6
  .line 804
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 805
    nop
  .line 806
    return-object v0
  :L7
  .line 793
    return-object v4
.end method

.method private static same(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Z
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 842
    const/4 v0, 0
    if-eqz p0, :L3
    if-eqz p1, :L3
  :L0
    invoke-virtual { p0, p1 }, Landroid/graphics/Bitmap;->sameAs(Landroid/graphics/Bitmap;)Z
    move-result p0
  :L1
    if-eqz p0, :L3
    const/4 v0, 1
    goto :L3
  :L2
  .line 843
    move-exception p0
  .line 844
    return v0
  :L3
  .line 842
    return v0
.end method

.method private static sig([B)I
  .registers 4
  .line 734
    new-instance v0, Ljava/util/zip/CRC32;
    invoke-direct { v0 }, Ljava/util/zip/CRC32;-><init>()V
  .line 735
    const/4 v1, 0
    array-length v2, p0
    invoke-virtual { v0, p0, v1, v2 }, Ljava/util/zip/CRC32;->update([BII)V
  .line 736
    invoke-virtual { v0 }, Ljava/util/zip/CRC32;->getValue()J
    move-result-wide v0
    long-to-int v1, v0
    array-length p0, p0
    xor-int/2addr p0, v1
    return p0
.end method

.method private static declared-synchronized sigIs(Ljava/lang/String;[B)Z
  .catchall { :L0 .. :L1 } :L3
  .registers 7
    const-class v0, Lcom/innioasis/ipp/BigCover;
    monitor-enter v0
  .line 749
    const/4 v1, 0
    if-eqz p0, :L4
    if-nez p1, :L0
    goto :L4
  :L0
  .line 750
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 751
    sget-object v2, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "\u0001"
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v2, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 752
    if-eqz p0, :L2
    check-cast p0, Ljava/lang/Integer;
    invoke-virtual { p0 }, Ljava/lang/Integer;->intValue()I
    move-result p0
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->sig([B)I
    move-result p1
  :L1
    if-ne p0, p1, :L2
    const/4 v1, 1
  :L2
    monitor-exit v0
    return v1
  :L3
  .line 748
    move-exception p0
    monitor-exit v0
    throw p0
  :L4
  .line 749
    monitor-exit v0
    return v1
.end method

.method private static declared-synchronized sigSet(Ljava/lang/String;[B)V
  .catchall { :L0 .. :L1 } :L5
  .catchall { :L3 .. :L4 } :L5
  .registers 6
    const-class v0, Lcom/innioasis/ipp/BigCover;
    monitor-enter v0
  .line 740
    if-eqz p0, :L6
    if-nez p1, :L0
    goto :L6
  :L0
  .line 741
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 742
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->sig([B)I
    move-result p1
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
  .line 743
    sget-object v1, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "\u0001"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v1, p0, p1 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    invoke-virtual { p1, p0 }, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z
    move-result p0
  :L1
    if-eqz p0, :L2
    monitor-exit v0
    return-void
  :L2
  .line 744
    const/4 p0, 1
  :L3
    sput-boolean p0, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  .line 745
    sget-boolean p0, Lcom/innioasis/ipp/BigCover;->passing:Z
    if-nez p0, :L4
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->askSave()V
  :L4
  .line 746
    monitor-exit v0
    return-void
  :L5
  .line 739
    move-exception p0
    monitor-exit v0
    throw p0
  :L6
  .line 740
    monitor-exit v0
    return-void
.end method

.method private static square(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .registers 4
  .line 829
    if-nez p0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 830
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v0
  .line 831
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v1
  .line 832
    const/16 v2, 300
    if-ne v0, v1, :L1
    if-gt v0, v2, :L1
    return-object p0
  :L1
  .line 833
    invoke-static { v0, v1 }, Ljava/lang/Math;->min(II)I
    move-result v0
  .line 834
    if-lez v0, :L3
    if-le v0, v2, :L2
    goto :L3
  :L2
    move v2, v0
  :L3
  .line 835
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Cover;->square(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 836
    if-nez v0, :L4
    goto :L5
  :L4
    move-object p0, v0
  :L5
    return-object p0
.end method

.method private static store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;Lcom/innioasis/ipp/BigCover$Walk;)Z
  .registers 4
  .line 850
    const/4 v0, 1
    invoke-static { p0, p1, p2, v0 }, Lcom/innioasis/ipp/BigCover;->store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;Lcom/innioasis/ipp/BigCover$Walk;Z)Z
    move-result p0
    return p0
.end method

.method private static store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;Lcom/innioasis/ipp/BigCover$Walk;Z)Z
  .catchall { :L0 .. :L5 } :L6
  .registers 12
  .line 856
    const/4 v0, 0
    if-eqz p1, :L7
  :L0
    iget-object v1, p1, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
    if-nez v1, :L1
    goto :L7
  :L1
  .line 857
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/BigCover;->fit(Lcom/innioasis/ipp/BigCover$Src;Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v1
  .line 858
    if-nez v1, :L2
    return v0
  :L2
  .line 859
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v2
  .line 860
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/BigCover;->write(Ljava/lang/String;[B)Z
    move-result v1
  .line 861
    if-eqz p2, :L3
    iget-wide v4, p2, Lcom/innioasis/ipp/BigCover$Walk;->writeNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v6
    sub-long/2addr v6, v2
    add-long/2addr v4, v6
    iput-wide v4, p2, Lcom/innioasis/ipp/BigCover$Walk;->writeNs:J
  :L3
  .line 862
    if-nez v1, :L4
    return v0
  :L4
  .line 863
    if-eqz p3, :L5
    sget-object p2, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    iget-object p1, p1, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
    invoke-interface { p2, p0, p1 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L5
  .line 864
    const/4 p0, 1
    return p0
  :L6
  .line 865
    move-exception p0
  .line 866
    return v0
  :L7
  .line 856
    return v0
.end method

.method private static storeSrc(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;[B)I
  .registers 12
  .line 517
    array-length v0, p2
    const/16 v1, 25600
    const/4 v2, 2
    const/4 v3, 0
    const-wide/16 v4, 1
    if-gt v0, v1, :L1
    invoke-static { p2 }, Lcom/innioasis/ipp/BigCover;->isJpeg([B)Z
    move-result v0
    if-eqz v0, :L1
  .line 518
    iget-wide v0, p0, Lcom/innioasis/ipp/BigCover$Walk;->verbatim:J
    add-long/2addr v0, v4
    iput-wide v0, p0, Lcom/innioasis/ipp/BigCover$Walk;->verbatim:J
  .line 519
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v0
  .line 520
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/BigCover;->write(Ljava/lang/String;[B)Z
    move-result p1
  .line 521
    iget-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->writeNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v6
    sub-long/2addr v6, v0
    add-long/2addr v4, v6
    iput-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->writeNs:J
  .line 522
    if-eqz p1, :L0
    const/4 v2, 0
  :L0
    return v2
  :L1
  .line 524
    iget-wide v0, p0, Lcom/innioasis/ipp/BigCover$Walk;->encoded:J
    add-long/2addr v0, v4
    iput-wide v0, p0, Lcom/innioasis/ipp/BigCover$Walk;->encoded:J
  .line 525
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v0
  .line 526
    invoke-static { p2 }, Lcom/innioasis/ipp/BigCover;->capped([B)Landroid/graphics/Bitmap;
    move-result-object v4
  .line 527
    iget-wide v5, p0, Lcom/innioasis/ipp/BigCover$Walk;->srcDecodeNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v7
    sub-long/2addr v7, v0
    add-long/2addr v5, v7
    iput-wide v5, p0, Lcom/innioasis/ipp/BigCover$Walk;->srcDecodeNs:J
  .line 528
    if-nez v4, :L2
    const/4 p0, 1
    return p0
  :L2
  .line 529
    new-instance v0, Lcom/innioasis/ipp/BigCover$Src;
    invoke-direct { v0 }, Lcom/innioasis/ipp/BigCover$Src;-><init>()V
  .line 530
    iput-object v4, v0, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
  .line 531
    iput-object p2, v0, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
  .line 532
    invoke-static { p1, v0, p0 }, Lcom/innioasis/ipp/BigCover;->store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;Lcom/innioasis/ipp/BigCover$Walk;)Z
    move-result p2
  .line 533
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v0, p1 }, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 534
    if-nez p2, :L3
    return v2
  :L3
  .line 535
    invoke-static { p0, v4 }, Lcom/innioasis/ipp/BigCover$Walk;->access$302(Lcom/innioasis/ipp/BigCover$Walk;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .line 536
    return v3
.end method

.method public static track(Ljava/lang/String;)Landroid/graphics/Bitmap;
  .registers 2
  .line 84
    const/4 v0, 1
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/BigCover;->track(Ljava/lang/String;Z)Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
.end method

.method private static track(Ljava/lang/String;Z)Landroid/graphics/Bitmap;
  .catchall { :L5 .. :L10 } :L26
  .catch Ljava/lang/OutOfMemoryError; { :L11 .. :L12 } :L25
  .catchall { :L11 .. :L12 } :L13
  .catchall { :L14 .. :L27 } :L26
  .registers 10
  .line 96
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 97
    if-eqz p1, :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v1
    goto :L2
  :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peekTrackFree(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v1
  :L2
  .line 98
    if-eqz v1, :L3
    return-object v1
  :L3
  .line 99
    sget-object v1, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L4
    return-object v0
  :L4
  .line 102
    sget-object v2, Lcom/innioasis/ipp/BigCover;->LOCK:Ljava/lang/Object;
    monitor-enter v2
  .line 103
    if-eqz p1, :L6
  :L5
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v3
    goto :L7
  :L6
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peekTrackFree(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v3
  :L7
  .line 104
    if-eqz v3, :L8
    monitor-exit v2
    return-object v3
  :L8
  .line 105
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L9
    monitor-exit v2
    return-object v0
  :L9
  .line 107
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
  .line 108
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->note(Ljava/lang/String;)I
    move-result v4
    if-nez v4, :L11
    invoke-virtual { v1, p0, p0 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    monitor-exit v2
  :L10
    return-object v0
  :L11
  .line 112
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->read(Ljava/lang/String;)Lcom/innioasis/ipp/BigCover$Src;
    move-result-object v1
  :L12
  .line 117
    goto :L14
  :L13
  .line 115
    move-exception v1
  .line 116
    move-object v1, v0
  :L14
  .line 118
    sget-object v4, Lcom/innioasis/ipp/BigCover;->UNREAD:Lcom/innioasis/ipp/BigCover$Src;
    if-ne v1, v4, :L15
    monitor-exit v2
    return-object v0
  :L15
  .line 119
    if-nez v1, :L16
  .line 120
    sget-object p1, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { p1, p0, p0 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 121
    const/4 p1, 0
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 122
    monitor-exit v2
    return-object v0
  :L16
  .line 124
    iget-object v4, v1, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
  .line 127
    invoke-static { v3, p1 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;Z)Landroid/graphics/Bitmap;
    move-result-object v5
  .line 128
    const/4 v6, 1
    if-nez v5, :L19
  .line 129
    if-eqz p1, :L17
    sget-object v5, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v5, p0, v4 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L17
  .line 130
    invoke-static { v3, v1, v0, p1 }, Lcom/innioasis/ipp/BigCover;->store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;Lcom/innioasis/ipp/BigCover$Walk;Z)Z
    move-result p1
    if-nez p1, :L18
    monitor-exit v2
    return-object v4
  :L18
  .line 131
    iget-object p1, v1, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
    invoke-static { v3, p1 }, Lcom/innioasis/ipp/BigCover;->sigSet(Ljava/lang/String;[B)V
  .line 132
    invoke-static { p0, v6 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 133
    monitor-exit v2
    return-object v4
  :L19
  .line 135
    iget-object v7, v1, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
    invoke-static { v3, v7 }, Lcom/innioasis/ipp/BigCover;->sigIs(Ljava/lang/String;[B)Z
    move-result v3
    if-nez v3, :L23
    invoke-static { v5, v4 }, Lcom/innioasis/ipp/BigCover;->same(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Z
    move-result v3
    if-eqz v3, :L20
    goto :L23
  :L20
  .line 140
    if-eqz p1, :L21
    sget-object v3, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v3, p0, v4 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L21
  .line 141
    invoke-static { p0, v1, v0, p1 }, Lcom/innioasis/ipp/BigCover;->store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;Lcom/innioasis/ipp/BigCover$Walk;Z)Z
    move-result p1
    if-eqz p1, :L22
    const/4 p1, 2
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  :L22
  .line 142
    monitor-exit v2
    return-object v4
  :L23
  .line 136
    if-eqz p1, :L24
    sget-object p1, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { p1, p0, v5 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L24
  .line 137
    invoke-static { p0, v6 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 138
    monitor-exit v2
    return-object v5
  :L25
  .line 113
    move-exception p0
  .line 114
    monitor-exit v2
    return-object v0
  :L26
  .line 143
    move-exception p0
    monitor-exit v2
  :L27
    throw p0
.end method

.method public static trackFree(Ljava/lang/String;)Landroid/graphics/Bitmap;
  .registers 2
  .line 92
    const/4 v0, 0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/BigCover;->track(Ljava/lang/String;Z)Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
.end method

.method private static warm(Ljava/lang/String;)V
  .registers 3
  .line 180
    if-eqz p0, :L2
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v0, p0 }, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    if-nez v0, :L2
    sget-object v0, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v0, p0 }, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L0
    goto :L2
  :L0
  .line 181
    sget-object v0, Lcom/innioasis/ipp/BigCover;->worker:Landroid/os/Handler;
    if-nez v0, :L1
  .line 182
    new-instance v0, Landroid/os/HandlerThread;
    const-string v1, "ipp-cover"
    invoke-direct { v0, v1 }, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V
  .line 183
    invoke-virtual { v0 }, Landroid/os/HandlerThread;->start()V
  .line 184
    new-instance v1, Landroid/os/Handler;
    invoke-virtual { v0 }, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;
    move-result-object v0
    invoke-direct { v1, v0 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v1, Lcom/innioasis/ipp/BigCover;->worker:Landroid/os/Handler;
  :L1
  .line 186
    sget-object v0, Lcom/innioasis/ipp/BigCover;->worker:Landroid/os/Handler;
    new-instance v1, Lcom/innioasis/ipp/BigCover$Warm;
    invoke-direct { v1, p0 }, Lcom/innioasis/ipp/BigCover$Warm;-><init>(Ljava/lang/String;)V
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 187
    return-void
  :L2
  .line 180
    return-void
.end method

.method private static write(Ljava/lang/String;[B)Z
  .catchall { :L0 .. :L1 } :L7
  .catchall { :L2 .. :L3 } :L6
  .catchall { :L3 .. :L4 } :L5
  .catchall { :L4 .. :L6 } :L6
  .catchall { :L9 .. :L10 } :L11
  .registers 4
  .line 872
    nop
  .line 874
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object p0
  :L1
  .line 875
    if-nez p0, :L2
    return v0
  :L2
  .line 876
    new-instance v1, Ljava/io/FileOutputStream;
    invoke-direct { v1, p0 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  :L3
  .line 878
    invoke-virtual { v1, p1 }, Ljava/io/FileOutputStream;->write([B)V
  :L4
  .line 880
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
  .line 881
    nop
  .line 882
    const/4 p0, 1
    return p0
  :L5
  .line 880
    move-exception p1
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
  .line 881
    throw p1
  :L6
  .line 883
    move-exception p1
    goto :L8
  :L7
    move-exception p0
    const/4 p0, 0
  :L8
  .line 884
    if-eqz p0, :L12
  :L9
    invoke-virtual { p0 }, Ljava/io/File;->delete()Z
  :L10
    goto :L12
  :L11
    move-exception p0
  :L12
  .line 885
    return v0
.end method
