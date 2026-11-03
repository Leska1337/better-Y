.class public final Lcom/innioasis/ipp/BigCover;
.super Ljava/lang/Object;
.source "BigCover.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/BigCover$Src;,
    Lcom/innioasis/ipp/BigCover$Walk;,
    Lcom/innioasis/ipp/BigCover$Warm;,
    Lcom/innioasis/ipp/BigCover$Lru;
  }
.end annotation

.field private final static LIMIT:I = 25600

.field private final static LOCK:Ljava/lang/Object;

.field private final static MEM_MAX:I = 24

.field private final static NONE:I = 0

.field private final static OWN:I = 2

.field private final static Q_MAX:I = 92

.field private final static Q_MIN:I = 76

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

.field private static volatile lastQ:I

.field private static mayNone:Z

.field private final static mem:Ljava/util/Map;

.field private final static miss:Ljava/util/Hashtable;

.field private final static notes:Ljava/util/HashMap;

.field private static notesDirty:Z

.field private static notesLoaded:Z

.field private static volatile passing:Z

.field private static swept:Z

.field private static worker:Landroid/os/Handler;

.method static constructor <clinit>()V
  .registers 1
  .line 57
    new-instance v0, Lcom/innioasis/ipp/BigCover$Lru;
    invoke-direct { v0 }, Lcom/innioasis/ipp/BigCover$Lru;-><init>()V
    invoke-static { v0 }, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
  .line 75
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
  .line 79
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/BigCover;->LOCK:Ljava/lang/Object;
  .line 556
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
  .line 719
    new-instance v0, Lcom/innioasis/ipp/BigCover$Src;
    invoke-direct { v0 }, Lcom/innioasis/ipp/BigCover$Src;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/BigCover;->UNREAD:Lcom/innioasis/ipp/BigCover$Src;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 39
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000()Ljava/util/Map;
  .registers 1
  .line 37
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    return-object v0
.end method

.method public static beginCache()V
  .registers 1
  .line 539
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/BigCover;->passing:Z
  .line 540
    return-void
.end method

.method public static declared-synchronized beginForget()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
    const-class v0, Lcom/innioasis/ipp/BigCover;
    monitor-enter v0
  :L0
  .line 647
    sget v1, Lcom/innioasis/ipp/BigCover;->forgetting:I
    add-int/lit8 v1, v1, 1
    sput v1, Lcom/innioasis/ipp/BigCover;->forgetting:I
  :L1
  .line 648
    monitor-exit v0
    return-void
  :L2
  .line 646
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method public static cache(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;[B)Z
  .catchall { :L1 .. :L19 } :L20
  .registers 16
  .line 380
    const/4 v0, 1
    if-eqz p1, :L21
    if-nez p0, :L0
    goto/16 :L21
  :L0
  .line 382
    const/4 v1, 0
    const-wide/16 v2, 1
  :L1
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->needs(Ljava/lang/String;)Z
    move-result v4
    if-nez v4, :L2
    return v0
  :L2
  .line 383
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
  .line 384
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
  .line 385
    invoke-static { p0, v4 }, Lcom/innioasis/ipp/BigCover$Walk;->access$102(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;)Ljava/lang/String;
  .line 388
    if-eqz p2, :L4
    array-length v5, p2
    if-lez v5, :L4
  .line 389
    nop
  .line 390
    iget-wide v5, p0, Lcom/innioasis/ipp/BigCover$Walk;->embedded:J
    add-long/2addr v5, v2
    iput-wide v5, p0, Lcom/innioasis/ipp/BigCover$Walk;->embedded:J
    goto :L5
  :L4
  .line 392
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v5
  .line 393
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/BigCover;->external(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;)[B
    move-result-object p2
  .line 394
    iget-wide v7, p0, Lcom/innioasis/ipp/BigCover$Walk;->externalNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v9
    sub-long/2addr v9, v5
    add-long/2addr v7, v9
    iput-wide v7, p0, Lcom/innioasis/ipp/BigCover$Walk;->externalNs:J
  .line 395
    if-eqz p2, :L5
    array-length v5, p2
    if-lez v5, :L5
    iget-wide v5, p0, Lcom/innioasis/ipp/BigCover$Walk;->external:J
    add-long/2addr v5, v2
    iput-wide v5, p0, Lcom/innioasis/ipp/BigCover$Walk;->external:J
  :L5
  .line 397
    if-eqz p2, :L18
    array-length v5, p2
    if-nez v5, :L6
    goto/16 :L18
  :L6
  .line 400
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v5
    if-eqz v5, :L7
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v5
    invoke-static { v5, p2 }, Ljava/util/Arrays;->equals([B[B)Z
    move-result v5
    if-eqz v5, :L7
  .line 401
    iget-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->sameBytes:J
    add-long/2addr v4, v2
    iput-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->sameBytes:J
  .line 402
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 403
    return v0
  :L7
  .line 406
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v5
    const/4 v6, 2
    if-nez v5, :L12
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$300(Lcom/innioasis/ipp/BigCover$Walk;)Landroid/graphics/Bitmap;
    move-result-object v5
    if-nez v5, :L12
  .line 407
    invoke-static { v4 }, Lcom/innioasis/ipp/BigCover;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v5
  .line 408
    if-eqz v5, :L8
    invoke-virtual { v5 }, Ljava/io/File;->exists()Z
    move-result v5
    if-eqz v5, :L8
    invoke-static { v4, p2 }, Lcom/innioasis/ipp/BigCover;->sigIs(Ljava/lang/String;[B)Z
    move-result v5
    if-eqz v5, :L8
  .line 409
    iget-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->sigOnDisk:J
    add-long/2addr v4, v2
    iput-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->sigOnDisk:J
  .line 410
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/BigCover$Walk;->access$202(Lcom/innioasis/ipp/BigCover$Walk;[B)[B
  .line 411
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 412
    return v0
  :L8
  .line 414
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v7
  .line 415
    invoke-static { v4 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v5
  .line 416
    iget-wide v9, p0, Lcom/innioasis/ipp/BigCover$Walk;->decodeNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v11
    sub-long/2addr v11, v7
    add-long/2addr v9, v11
    iput-wide v9, p0, Lcom/innioasis/ipp/BigCover$Walk;->decodeNs:J
  .line 417
    if-nez v5, :L11
  .line 418
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v7
  .line 419
    invoke-static { p0, v4, p2 }, Lcom/innioasis/ipp/BigCover;->storeSrc(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;[B)I
    move-result v5
  .line 420
    iget-wide v9, p0, Lcom/innioasis/ipp/BigCover$Walk;->storeNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v11
    sub-long/2addr v11, v7
    add-long/2addr v9, v11
    iput-wide v9, p0, Lcom/innioasis/ipp/BigCover$Walk;->storeNs:J
  .line 421
    if-ne v5, v6, :L9
    iget-wide p1, p0, Lcom/innioasis/ipp/BigCover$Walk;->failed:J
    add-long/2addr p1, v2
    iput-wide p1, p0, Lcom/innioasis/ipp/BigCover$Walk;->failed:J
    return v1
  :L9
  .line 422
    if-ne v5, v0, :L10
    iget-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->none:J
    add-long/2addr v4, v2
    iput-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->none:J
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
    return v0
  :L10
  .line 423
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/BigCover$Walk;->access$202(Lcom/innioasis/ipp/BigCover$Walk;[B)[B
  .line 424
    invoke-static { v4, p2 }, Lcom/innioasis/ipp/BigCover;->sigSet(Ljava/lang/String;[B)V
  .line 425
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 426
    return v0
  :L11
  .line 428
    invoke-static { p0, v5 }, Lcom/innioasis/ipp/BigCover$Walk;->access$302(Lcom/innioasis/ipp/BigCover$Walk;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  :L12
  .line 431
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v4
  .line 432
    invoke-static { p2 }, Lcom/innioasis/ipp/BigCover;->capped([B)Landroid/graphics/Bitmap;
    move-result-object v7
  .line 433
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
  .line 434
    iget-wide v8, p0, Lcom/innioasis/ipp/BigCover$Walk;->decodeNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v10
    sub-long/2addr v10, v4
    add-long/2addr v8, v10
    iput-wide v8, p0, Lcom/innioasis/ipp/BigCover$Walk;->decodeNs:J
  .line 435
    if-nez v7, :L14
    iget-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->none:J
    add-long/2addr v4, v2
    iput-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->none:J
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
    return v0
  :L14
  .line 436
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$300(Lcom/innioasis/ipp/BigCover$Walk;)Landroid/graphics/Bitmap;
    move-result-object v4
    invoke-static { v4, v7 }, Lcom/innioasis/ipp/BigCover;->same(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Z
    move-result v4
    if-eqz v4, :L16
  .line 437
    iget-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->samePixels:J
    add-long/2addr v4, v2
    iput-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->samePixels:J
  .line 439
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v4
    if-nez v4, :L15
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/BigCover$Walk;->access$202(Lcom/innioasis/ipp/BigCover$Walk;[B)[B
  :L15
  .line 440
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 441
    return v0
  :L16
  .line 443
    new-instance v4, Lcom/innioasis/ipp/BigCover$Src;
    invoke-direct { v4 }, Lcom/innioasis/ipp/BigCover$Src;-><init>()V
  .line 444
    iput-object v7, v4, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
  .line 445
    iput-object p2, v4, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
  .line 446
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v7
  .line 447
    invoke-static { p1, v4, p0 }, Lcom/innioasis/ipp/BigCover;->store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;Lcom/innioasis/ipp/BigCover$Walk;)Z
    move-result p2
  .line 448
    iget-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->storeNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v9
    sub-long/2addr v9, v7
    add-long/2addr v4, v9
    iput-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->storeNs:J
  .line 449
    sget-object v4, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v4, p1 }, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 450
    if-nez p2, :L17
    iget-wide p1, p0, Lcom/innioasis/ipp/BigCover$Walk;->failed:J
    add-long/2addr p1, v2
    iput-wide p1, p0, Lcom/innioasis/ipp/BigCover$Walk;->failed:J
    return v1
  :L17
  .line 451
    iget-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->own:J
    add-long/2addr v4, v2
    iput-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->own:J
  .line 452
    invoke-static { p1, v6 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 453
    return v0
  :L18
  .line 397
    iget-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->none:J
    add-long/2addr v4, v2
    iput-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->none:J
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  :L19
    return v0
  :L20
  .line 454
    move-exception p1
  .line 455
    iget-wide p1, p0, Lcom/innioasis/ipp/BigCover$Walk;->failed:J
    add-long/2addr p1, v2
    iput-wide p1, p0, Lcom/innioasis/ipp/BigCover$Walk;->failed:J
  .line 456
    return v1
  :L21
  .line 380
    return v0
.end method

.method public static cachedFile(Ljava/lang/String;)Ljava/io/File;
  .registers 4
  .line 221
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 222
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->note(Ljava/lang/String;)I
    move-result v1
  .line 223
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
  .line 224
    if-nez p0, :L4
    move-object p0, v0
    goto :L5
  :L4
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object p0
  :L5
  .line 225
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
  .line 758
    const/4 v0, 0
  :L0
    new-instance v1, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v1 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 759
    const/4 v2, 1
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 760
    array-length v2, p0
    const/4 v3, 0
    invoke-static { p0, v3, v2, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 761
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    if-lez v2, :L3
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    if-gtz v2, :L1
    goto :L3
  :L1
  .line 762
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    iget v4, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    const/16 v5, 300
    invoke-static { v2, v4, v5, v5 }, Lcom/innioasis/ipp/Art;->sample(IIII)I
    move-result v2
    iput v2, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 763
    iput-boolean v3, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 764
    array-length v2, p0
    invoke-static { p0, v3, v2, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object p0
  .line 765
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->square(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object p0
  :L2
    return-object p0
  :L3
  .line 761
    return-object v0
  :L4
  .line 768
    move-exception p0
  .line 769
    return-object v0
  :L5
  .line 766
    move-exception p0
  .line 767
    throw p0
.end method

.method public static clear()V
  .catchall { :L0 .. :L5 } :L6
  .registers 4
  .line 301
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v0 }, Ljava/util/Map;->clear()V
  .line 302
    sget-object v0, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 303
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteClear()V
  :L0
  .line 305
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->dir()Ljava/io/File;
    move-result-object v0
  .line 306
    if-nez v0, :L1
    return-void
  :L1
  .line 307
    invoke-virtual { v0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v1
  .line 308
    if-nez v1, :L2
    return-void
  :L2
  .line 309
    const/4 v2, 0
  :L3
    array-length v3, v1
    if-ge v2, v3, :L4
    aget-object v3, v1, v2
    invoke-virtual { v3 }, Ljava/io/File;->delete()Z
    add-int/lit8 v2, v2, 1
    goto :L3
  :L4
  .line 310
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  :L5
  .line 312
    goto :L7
  :L6
  .line 311
    move-exception v0
  :L7
  .line 313
    return-void
.end method

.method public static clearMiss()V
  .registers 1
  .line 295
    sget-object v0, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 296
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteForgetNone()V
  .line 297
    return-void
.end method

.method private static dir()Ljava/io/File;
  .catchall { :L3 .. :L5 } :L7
  .registers 5
  .line 957
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 958
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 959
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 960
    if-nez v0, :L1
    return-object v1
  :L1
  .line 961
    new-instance v1, Ljava/io/File;
    const-string v2, "ipp_big"
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 962
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v0
    if-nez v0, :L2
    invoke-virtual { v1 }, Ljava/io/File;->mkdirs()Z
  :L2
  .line 963
    sget-boolean v0, Lcom/innioasis/ipp/BigCover;->swept:Z
    if-nez v0, :L8
  .line 964
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/BigCover;->swept:Z
  :L3
  .line 966
    invoke-virtual { v1 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v0
  .line 967
    if-eqz v0, :L6
  .line 968
    const/4 v2, 0
  :L4
    array-length v3, v0
    if-ge v2, v3, :L6
  .line 969
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
  .line 968
    add-int/lit8 v2, v2, 1
    goto :L4
  :L6
  .line 973
    goto :L8
  :L7
  .line 972
    move-exception v0
  :L8
  .line 975
    return-object v1
.end method

.method private static encode(Landroid/graphics/Bitmap;ILcom/innioasis/ipp/BigCover$Walk;)[B
  .catchall { :L0 .. :L1 } :L3
  .registers 9
  .line 899
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v0
  .line 901
    const-wide/16 v2, 1
  :L0
    new-instance v4, Ljava/io/ByteArrayOutputStream;
    const/16 v5, 25600
    invoke-direct { v4, v5 }, Ljava/io/ByteArrayOutputStream;-><init>(I)V
  .line 902
    sget-object v5, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;
    invoke-virtual { p0, v5, p1, v4 }, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
  .line 903
    invoke-virtual { v4 }, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    move-result-object p0
  :L1
  .line 907
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
  .line 903
    return-object p0
  :L3
  .line 904
    move-exception p0
  .line 905
    nop
  .line 907
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
  .line 905
    const/4 p0, 0
    return-object p0
.end method

.method public static endCache()V
  .registers 1
  .line 543
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/BigCover;->passing:Z
  .line 544
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  .line 545
    return-void
.end method

.method public static declared-synchronized endForget()V
  .catchall { :L0 .. :L2 } :L3
  .registers 2
    const-class v0, Lcom/innioasis/ipp/BigCover;
    monitor-enter v0
  :L0
  .line 651
    sget v1, Lcom/innioasis/ipp/BigCover;->forgetting:I
    if-lez v1, :L1
    add-int/lit8 v1, v1, -1
    sput v1, Lcom/innioasis/ipp/BigCover;->forgetting:I
  :L1
  .line 652
    sget v1, Lcom/innioasis/ipp/BigCover;->forgetting:I
    if-nez v1, :L2
    sget-boolean v1, Lcom/innioasis/ipp/BigCover;->passing:Z
    if-nez v1, :L2
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  :L2
  .line 653
    monitor-exit v0
    return-void
  :L3
  .line 650
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method private static external(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;)[B
  .catchall { :L2 .. :L3 } :L4
  .registers 6
  .line 478
    const/16 v0, 47
    invoke-virtual { p1, v0 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v0
  .line 479
    if-lez v0, :L0
    const/4 v1, 0
    invoke-virtual { p1, v1, v0 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v0
    goto :L1
  :L0
    const-string v0, ""
  :L1
  .line 480
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$400(Lcom/innioasis/ipp/BigCover$Walk;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$500(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object p0
    return-object p0
  :L2
  .line 482
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/BigCover;->externalFile(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;)[B
    move-result-object p1
  .line 483
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$402(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;)Ljava/lang/String;
  .line 484
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/BigCover$Walk;->access$502(Lcom/innioasis/ipp/BigCover$Walk;[B)[B
  .line 485
    iget-wide v0, p0, Lcom/innioasis/ipp/BigCover$Walk;->extLookups:J
    const-wide/16 v2, 1
    add-long/2addr v0, v2
    iput-wide v0, p0, Lcom/innioasis/ipp/BigCover$Walk;->extLookups:J
  :L3
  .line 486
    return-object p1
  :L4
  .line 487
    move-exception p0
  .line 488
    const/4 p0, 0
    return-object p0
.end method

.method private static external(Ljava/lang/String;)[B
  .catchall { :L0 .. :L2 } :L3
  .registers 3
  .line 463
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v1
  .line 464
    if-nez v1, :L1
    return-object v0
  :L1
  .line 465
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->stampRead(Ljava/lang/String;)V
  .line 466
    invoke-static { v1 }, Lcom/innioasis/ipp/BigCover;->readAll(Ljava/io/File;)[B
    move-result-object p0
  :L2
    return-object p0
  :L3
  .line 467
    move-exception p0
  .line 468
    return-object v0
.end method

.method private static externalFile(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;)[B
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/io/IOException;
    }
  .end annotation
  .registers 10
  .line 493
    invoke-static { p1 }, Lcom/innioasis/ipp/Art;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v0
  .line 494
    if-nez v0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 495
    invoke-static { p1 }, Lcom/innioasis/ipp/Art;->stampRead(Ljava/lang/String;)V
  .line 496
    invoke-virtual { v0 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object p1
  .line 497
    invoke-virtual { v0 }, Ljava/io/File;->length()J
    move-result-wide v1
  .line 498
    invoke-virtual { v0 }, Ljava/io/File;->lastModified()J
    move-result-wide v3
  .line 499
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
  .line 500
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$600(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object p0
    return-object p0
  :L1
  .line 502
    invoke-static { v0 }, Lcom/innioasis/ipp/BigCover;->readAll(Ljava/io/File;)[B
    move-result-object v0
  .line 503
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/BigCover$Walk;->access$702(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;)Ljava/lang/String;
  .line 504
    invoke-static { p0, v1, v2 }, Lcom/innioasis/ipp/BigCover$Walk;->access$802(Lcom/innioasis/ipp/BigCover$Walk;J)J
  .line 505
    invoke-static { p0, v3, v4 }, Lcom/innioasis/ipp/BigCover$Walk;->access$902(Lcom/innioasis/ipp/BigCover$Walk;J)J
  .line 506
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$602(Lcom/innioasis/ipp/BigCover$Walk;[B)[B
  .line 507
    return-object v0
.end method

.method private static file(Ljava/lang/String;)Ljava/io/File;
  .registers 3
  .line 917
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->dir()Ljava/io/File;
    move-result-object v0
  .line 918
    if-nez v0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 919
    new-instance v1, Ljava/io/File;
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->name(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-direct { v1, v0, p0 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    return-object v1
.end method

.method private static fit(Lcom/innioasis/ipp/BigCover$Src;Lcom/innioasis/ipp/BigCover$Walk;)[B
  .registers 26
  .line 840
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
  .line 845
    nop
  .line 846
    nop
  .line 847
    nop
  .line 848
    nop
  .line 849
    nop
  .line 850
    sget v2, Lcom/innioasis/ipp/BigCover;->lastQ:I
  .line 851
    const/16 v4, 92
    const/16 v5, 76
    if-lt v2, v5, :L1
    if-le v2, v4, :L2
  :L1
    const/16 v2, 84
  :L2
  .line 852
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->limit()I
    move-result v6
    int-to-double v6, v6
    invoke-static { v6, v7 }, Ljava/lang/Math;->log(D)D
    move-result-wide v6
  .line 853
    nop
  .line 854
    const/4 v8, 0
    const/4 v9, 0
    move-object v12, v9
    move-object v13, v12
    const/4 v9, 0
    const/16 v14, 76
    const-wide/16 v15, 0
    const-wide/16 v17, 0
  :L3
  .line 855
    if-gt v14, v4, :L15
  .line 856
    if-ge v2, v14, :L4
    move v2, v14
  :L4
  .line 857
    if-le v2, v4, :L5
    move v2, v4
  :L5
  .line 858
    iget-object v10, v0, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
    invoke-static { v10, v2, v1 }, Lcom/innioasis/ipp/BigCover;->encode(Landroid/graphics/Bitmap;ILcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v10
  .line 859
    if-nez v10, :L6
    goto/16 :L15
  :L6
  .line 860
    array-length v11, v10
    if-gt v11, v3, :L7
  .line 861
    nop
  .line 862
    nop
  .line 863
    add-int/lit8 v14, v2, 1
    move v8, v2
    move-object v12, v10
    goto :L9
  :L7
  .line 865
    if-ne v2, v5, :L8
    move-object v13, v10
  :L8
  .line 866
    add-int/lit8 v4, v2, -1
  :L9
  .line 868
    nop
  .line 869
    nop
  .line 870
    mul-int/lit8 v2, v2, 2
    const/16 v11, 200
    rsub-int v2, v2, 200
    move/from16 v21, v4
    int-to-double v3, v2
    invoke-static { v3, v4 }, Ljava/lang/Math;->log(D)D
    move-result-wide v2
  .line 871
    array-length v4, v10
    move-object v10, v12
    int-to-double v11, v4
    invoke-static { v11, v12 }, Ljava/lang/Math;->log(D)D
    move-result-wide v11
  .line 872
    const/4 v4, 1
    add-int/2addr v9, v4
  .line 873
    nop
  .line 874
    if-le v9, v4, :L10
    cmpl-double v22, v2, v15
    if-eqz v22, :L10
  .line 875
    sub-double v17, v11, v17
    sub-double v15, v2, v15
    div-double v17, v17, v15
  .line 876
    const-wide/16 v15, 0
    cmpg-double v19, v17, v15
    if-gez v19, :L11
    goto :L12
  :L10
  .line 874
    const-wide/16 v15, 0
  :L11
  .line 878
    const-wide v17, -4619792497756654797L
  :L12
    sub-double v19, v6, v11
    div-double v19, v19, v17
    add-double v19, v2, v19
    invoke-static/range { v19 .. v20 }, Ljava/lang/Math;->exp(D)D
    move-result-wide v17
  .line 879
    move-wide/from16 v22, v6
    invoke-static/range { v17 .. v18 }, Ljava/lang/Math;->ceil(D)D
    move-result-wide v5
    double-to-int v5, v5
  .line 880
    const/16 v6, 200
    if-lt v5, v6, :L13
    const/16 v4, 76
    goto :L14
  :L13
    rsub-int v5, v5, 200
    shr-int/lit8 v4, v5, 1
  :L14
  .line 881
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
  .line 882
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
  .line 883
    if-eqz v12, :L19
    sput v8, Lcom/innioasis/ipp/BigCover;->lastQ:I
  :L19
  .line 884
    return-object v13
.end method

.method public static forget(Ljava/lang/String;)V
  .catchall { :L1 .. :L2 } :L3
  .registers 2
  .line 281
    if-nez p0, :L0
    return-void
  :L0
  .line 282
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v0, p0 }, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 283
    sget-object v0, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v0, p0 }, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 284
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->noteForget(Ljava/lang/String;)V
  :L1
  .line 286
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v0
  .line 287
    if-eqz v0, :L2
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  :L2
  .line 289
    goto :L4
  :L3
  .line 288
    move-exception v0
  :L4
  .line 290
    invoke-static { p0 }, Lcom/innioasis/ipp/FlowCache;->forget(Ljava/lang/String;)V
  .line 291
    return-void
.end method

.method private static isJpeg([B)Z
  .registers 6
  .line 913
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
  .line 250
    if-eqz p0, :L0
    if-eqz p1, :L0
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v0, p0 }, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    if-nez v1, :L0
    invoke-interface { v0, p0, p1 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L0
  .line 251
    return-void
.end method

.method public static knownNone(Ljava/lang/String;)Z
  .registers 1
  .line 369
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
  .line 892
    const/16 v0, 25600
    return v0
.end method

.method static memBytes()J
  .catchall { :L0 .. :L1 } :L2
  .catchall { :L3 .. :L4 } :L2
  .registers 3
  .line 62
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    monitor-enter v0
  :L0
  .line 63
    new-instance v1, Ljava/util/ArrayList;
    invoke-interface { v0 }, Ljava/util/Map;->values()Ljava/util/Collection;
    move-result-object v2
    invoke-direct { v1, v2 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 64
    monitor-exit v0
  :L1
  .line 65
    invoke-static { v1 }, Lcom/innioasis/ipp/Diag;->bitmapBytes(Ljava/util/Collection;)J
    move-result-wide v0
    return-wide v0
  :L2
  .line 64
    move-exception v1
  :L3
    monitor-exit v0
  :L4
    throw v1
.end method

.method private static name(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 923
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
  .line 353
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->note(Ljava/lang/String;)I
    move-result v0
  .line 354
    const/4 v1, -1
    const/4 v2, 1
    if-ne v0, v1, :L0
    return v2
  :L0
  .line 355
    const/4 v1, 0
    if-nez v0, :L1
    return v1
  :L1
  .line 356
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
  .line 619
    const/4 v1, -1
    if-nez p0, :L0
    monitor-exit v0
    return v1
  :L0
  .line 620
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 621
    sget-object v2, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v2, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 622
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
  .line 618
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
  .line 702
    sget-object v1, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v1 }, Ljava/util/HashMap;->clear()V
  .line 703
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->mayNone:Z
  .line 704
    const/4 v2, 1
    sput-boolean v2, Lcom/innioasis/ipp/BigCover;->notesLoaded:Z
  .line 705
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  :L1
  .line 707
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteFile()Ljava/io/File;
    move-result-object v1
  .line 708
    if-eqz v1, :L2
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-eqz v2, :L2
    invoke-virtual { v1 }, Ljava/io/File;->delete()Z
  :L2
  .line 710
    goto :L4
  :L3
  .line 709
    move-exception v1
  :L4
  .line 711
    monitor-exit v0
    return-void
  :L5
  .line 701
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method private static noteFile()Ljava/io/File;
  .registers 3
  .line 564
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 565
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 566
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 568
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
  .line 637
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 638
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
  .line 639
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
  .line 640
    if-eqz v2, :L4
    sput-boolean v3, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
    sget p0, Lcom/innioasis/ipp/BigCover;->forgetting:I
    if-nez p0, :L4
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  :L4
  .line 641
    monitor-exit v0
    return-void
  :L5
  .line 636
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
  .line 657
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 658
    sget-boolean v1, Lcom/innioasis/ipp/BigCover;->mayNone:Z
  :L1
    if-nez v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 659
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 660
    sget-object v2, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v2 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v2
    invoke-interface { v2 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v2
  :L3
  .line 661
    invoke-interface { v2 }, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :L6
  .line 662
    invoke-interface { v2 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/util/Map$Entry;
  .line 663
    invoke-interface { v3 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
    const-string v5, "\u0001"
    invoke-virtual { v4, v5 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :L4
    goto :L3
  :L4
  .line 664
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
  .line 665
    goto :L3
  :L6
  .line 666
    const/4 v2, 0
    sput-boolean v2, Lcom/innioasis/ipp/BigCover;->mayNone:Z
  .line 667
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v3
  :L7
    if-eqz v3, :L8
    monitor-exit v0
    return-void
  :L8
  .line 668
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
  .line 669
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  .line 670
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  :L11
  .line 671
    monitor-exit v0
    return-void
  :L12
  .line 656
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
  .line 572
    sget-boolean v1, Lcom/innioasis/ipp/BigCover;->notesLoaded:Z
  :L1
    if-eqz v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 573
    const/4 v1, 1
  :L3
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesLoaded:Z
  :L4
  .line 575
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteFile()Ljava/io/File;
    move-result-object v2
  .line 576
    if-eqz v2, :L14
    invoke-virtual { v2 }, Ljava/io/File;->exists()Z
    move-result v3
    if-nez v3, :L5
    goto :L14
  :L5
  .line 577
    new-instance v3, Ljava/io/FileInputStream;
    invoke-direct { v3, v2 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 578
    invoke-virtual { v3 }, Ljava/io/FileInputStream;->available()I
    move-result v2
    new-array v2, v2, [B
  .line 579
    invoke-virtual { v3, v2 }, Ljava/io/FileInputStream;->read([B)I
  .line 580
    invoke-virtual { v3 }, Ljava/io/FileInputStream;->close()V
  .line 581
    new-instance v3, Ljava/lang/String;
    const-string v4, "UTF-8"
    invoke-direct { v3, v2, v4 }, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    const-string v2, "\n"
    invoke-virtual { v3, v2 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v2
  .line 582
    const/4 v3, 0
    const/4 v4, 0
  :L6
    array-length v5, v2
    if-ge v4, v5, :L13
  .line 583
    aget-object v5, v2, v4
  .line 584
    const/16 v6, 9
    invoke-virtual { v5, v6 }, Ljava/lang/String;->indexOf(I)I
    move-result v6
  :L7
  .line 585
    if-gtz v6, :L8
    goto :L12
  :L8
  .line 587
    add-int/lit8 v7, v6, 1
  :L9
    invoke-virtual { v5, v7 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v7
    invoke-virtual { v7 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v7
    invoke-static { v7 }, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;
    move-result-object v7
  .line 588
    sget-object v8, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v5, v3, v6 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v8, v5, v7 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 589
    invoke-virtual { v7 }, Ljava/lang/Integer;->intValue()I
    move-result v5
    if-nez v5, :L10
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->mayNone:Z
  :L10
  .line 591
    goto :L12
  :L11
  .line 590
    move-exception v5
  :L12
  .line 582
    add-int/lit8 v4, v4, 1
    goto :L6
  :L13
  .line 594
    goto :L16
  :L14
  .line 576
    monitor-exit v0
    return-void
  :L15
  .line 593
    move-exception v1
  :L16
  .line 595
    monitor-exit v0
    return-void
  :L17
  .line 571
    move-exception v1
    monitor-exit v0
    goto :L19
  :L18
    throw v1
  :L19
    goto :L18
.end method

.method private static declared-synchronized noteSave()V
  .catchall { :L0 .. :L1 } :L11
  .catchall { :L2 .. :L3 } :L9
  .catchall { :L4 .. :L8 } :L9
  .registers 8
    const-class v0, Lcom/innioasis/ipp/BigCover;
    monitor-enter v0
  :L0
  .line 598
    sget-boolean v1, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  :L1
    if-nez v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 600
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteFile()Ljava/io/File;
    move-result-object v1
  :L3
  .line 601
    if-nez v1, :L4
    monitor-exit v0
    return-void
  :L4
  .line 602
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
  .line 603
    sget-object v3, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v3 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v3
    invoke-interface { v3 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v3
  :L5
  .line 604
    invoke-interface { v3 }, Ljava/util/Iterator;->hasNext()Z
    move-result v4
    if-eqz v4, :L7
  .line 605
    invoke-interface { v3 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/util/Map$Entry;
  .line 606
    invoke-interface { v4 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/String;
  .line 607
    if-eqz v5, :L5
    const/16 v6, 9
    invoke-virtual { v5, v6 }, Ljava/lang/String;->indexOf(I)I
    move-result v7
    if-ltz v7, :L6
    goto :L5
  :L6
  .line 608
    invoke-virtual { v2, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5, v6 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-interface { v4 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/Integer;
    invoke-virtual { v4 }, Ljava/lang/Integer;->intValue()I
    move-result v4
    invoke-virtual { v5, v4 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v4
    const/16 v5, 10
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 609
    goto :L5
  :L7
  .line 610
    new-instance v3, Ljava/io/FileOutputStream;
    invoke-direct { v3, v1 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  .line 611
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    const-string v2, "UTF-8"
    invoke-virtual { v1, v2 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object v1
    invoke-virtual { v3, v1 }, Ljava/io/FileOutputStream;->write([B)V
  .line 612
    invoke-virtual { v3 }, Ljava/io/FileOutputStream;->close()V
  .line 613
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  :L8
  .line 615
    goto :L10
  :L9
  .line 614
    move-exception v1
  :L10
  .line 616
    monitor-exit v0
    return-void
  :L11
  .line 597
    move-exception v1
    monitor-exit v0
    goto :L13
  :L12
    throw v1
  :L13
    goto :L12
.end method

.method private static declared-synchronized noteSet(Ljava/lang/String;I)V
  .catchall { :L0 .. :L2 } :L5
  .catchall { :L3 .. :L4 } :L5
  .registers 5
    const-class v0, Lcom/innioasis/ipp/BigCover;
    monitor-enter v0
  .line 627
    if-nez p0, :L0
    monitor-exit v0
    return-void
  :L0
  .line 628
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 629
    sget-object v1, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
    invoke-virtual { v1, p0, v2 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 630
    const/4 v1, 1
    if-nez p1, :L1
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->mayNone:Z
  :L1
  .line 631
    if-eqz p0, :L3
    check-cast p0, Ljava/lang/Integer;
    invoke-virtual { p0 }, Ljava/lang/Integer;->intValue()I
    move-result p0
  :L2
    if-ne p0, p1, :L3
    monitor-exit v0
    return-void
  :L3
  .line 632
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  .line 633
    sget-boolean p0, Lcom/innioasis/ipp/BigCover;->passing:Z
    if-nez p0, :L4
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  :L4
  .line 634
    monitor-exit v0
    return-void
  :L5
  .line 626
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method public static ownArt(Ljava/lang/String;)Z
  .registers 2
  .line 361
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
  .line 233
    const/4 v0, 1
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;Z)Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
.end method

.method private static peek(Ljava/lang/String;Z)Landroid/graphics/Bitmap;
  .catchall { :L3 .. :L4 } :L5
  .registers 8
  .line 254
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 255
    sget-object v1, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v1, p0 }, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  .line 256
    if-eqz v1, :L1
    check-cast v1, Landroid/graphics/Bitmap;
    return-object v1
  :L1
  .line 257
    sget-object v1, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L2
    return-object v0
  :L2
  .line 258
    nop
  :L3
  .line 260
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v1
  .line 261
    if-eqz v1, :L4
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-eqz v2, :L4
  .line 262
    invoke-virtual { v1 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object v1
  .line 263
    new-instance v2, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v2 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 264
    const/4 v3, 1
    iput-boolean v3, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 265
    invoke-static { v1, v2 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 266
    iget v3, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    if-lez v3, :L4
    iget v3, v2, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    if-lez v3, :L4
  .line 267
    iget v3, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    iget v4, v2, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    const/16 v5, 300
    invoke-static { v3, v4, v5, v5 }, Lcom/innioasis/ipp/Art;->sample(IIII)I
    move-result v3
    iput v3, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 268
    const/4 v3, 0
    iput-boolean v3, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 269
    invoke-static { v1, v2 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/BigCover;->square(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object v0
  :L4
  .line 274
    goto :L6
  :L5
  .line 272
    move-exception v1
  .line 273
    nop
  :L6
  .line 275
    if-eqz v0, :L7
    if-eqz p1, :L7
    sget-object p1, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { p1, p0, v0 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L7
  .line 276
    return-object v0
.end method

.method public static peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
  .registers 4
  .line 210
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 211
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 212
    if-eqz v1, :L1
    return-object v1
  :L1
  .line 213
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->note(Ljava/lang/String;)I
    move-result v1
    const/4 v2, 1
    if-eq v1, v2, :L2
    return-object v0
  :L2
  .line 214
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 215
    if-eqz v0, :L3
    sget-object v1, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v1, p0, v0 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L3
  .line 216
    return-object v0
.end method

.method public static peekTrackFree(Ljava/lang/String;)Landroid/graphics/Bitmap;
  .registers 5
  .line 242
    if-nez p0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 243
    const/4 v0, 0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;Z)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 244
    if-nez v1, :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->note(Ljava/lang/String;)I
    move-result v2
    const/4 v3, 1
    if-eq v2, v3, :L1
    goto :L2
  :L1
  .line 245
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;Z)Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
  :L2
  .line 244
    return-object v1
.end method

.method public static prefetch(Ljava/util/List;I)V
  .catchall { :L0 .. :L3 } :L4
  .registers 3
  .line 152
    if-eqz p0, :L6
    if-ltz p1, :L6
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    if-lt p1, v0, :L1
    goto :L6
  :L1
  .line 153
    invoke-interface { p0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p0
  .line 154
    instance-of p1, p0, Lcom/innioasis/y1/database/Song;
    if-nez p1, :L2
    return-void
  :L2
  .line 155
    move-object p1, p0
    check-cast p1, Lcom/innioasis/y1/database/Song;
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Ahead;->picked(Ljava/lang/String;)V
  .line 156
    check-cast p0, Lcom/innioasis/y1/database/Song;
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->warm(Ljava/lang/String;)V
  :L3
  .line 158
    goto :L5
  :L4
  .line 157
    move-exception p0
  :L5
  .line 159
    return-void
  :L6
  .line 152
    return-void
.end method

.method public static prefetchPlaying()V
  .catchall { :L0 .. :L5 } :L6
  .registers 2
  :L0
  .line 169
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 170
    const/4 v1, 0
    if-nez v0, :L1
    move-object v0, v1
    goto :L2
  :L1
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingSong()Lcom/innioasis/y1/database/Song;
    move-result-object v0
  :L2
  .line 171
    if-nez v0, :L3
    goto :L4
  :L3
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
  :L4
    invoke-static { v1 }, Lcom/innioasis/ipp/BigCover;->warm(Ljava/lang/String;)V
  .line 172
    invoke-static { }, Lcom/innioasis/ipp/Queue;->nextPath()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/BigCover;->warm(Ljava/lang/String;)V
  :L5
  .line 174
    goto :L7
  :L6
  .line 173
    move-exception v0
  :L7
  .line 175
    return-void
.end method

.method static prune(Lcom/innioasis/ipp/Stale$Keys;Ljava/util/Set;Z)J
  .registers 6
  .line 931
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
  .line 935
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 936
    nop
  .line 937
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 938
    sget-object v2, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v2 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v2
    invoke-interface { v2 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v2
    const-wide/16 v3, 0
  :L1
  .line 939
    invoke-interface { v2 }, Ljava/util/Iterator;->hasNext()Z
    move-result v5
    if-eqz v5, :L5
  .line 940
    invoke-interface { v2 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/util/Map$Entry;
  .line 941
    invoke-interface { v5 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Ljava/lang/String;
  .line 942
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
  .line 943
    invoke-static { v6 }, Lcom/innioasis/ipp/Stale$Keys;->of(Ljava/lang/String;)J
    move-result-wide v7
    invoke-virtual { p0, v7, v8 }, Lcom/innioasis/ipp/Stale$Keys;->has(J)Z
    move-result v7
  :L3
  .line 944
    if-eqz v7, :L4
    goto :L1
  :L4
  .line 945
    invoke-virtual { v1, v6 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 946
    invoke-interface { v5 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v5
    invoke-static { v5 }, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
    move-result-object v5
    invoke-static { v6, v5 }, Lcom/innioasis/ipp/Stale;->line(Ljava/lang/String;Ljava/lang/String;)J
    move-result-wide v5
    add-long/2addr v3, v5
  .line 947
    goto :L1
  :L5
  .line 948
    if-eqz p2, :L8
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result p0
    if-nez p0, :L8
  .line 949
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
  .line 950
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  .line 951
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  :L8
  .line 953
    monitor-exit v0
    return-wide v3
  :L9
  .line 934
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
  .line 726
    const/4 v0, 1
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Meta;->read(Ljava/lang/String;Z)Lcom/innioasis/ipp/Meta$Info;
    move-result-object v0
  .line 727
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
  .line 728
    const/4 v1, 0
    if-eqz p0, :L4
    array-length v2, p0
    if-nez v2, :L2
    goto :L4
  :L2
  .line 729
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->capped([B)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 730
    if-nez v0, :L3
    return-object v1
  :L3
  .line 731
    new-instance v1, Lcom/innioasis/ipp/BigCover$Src;
    invoke-direct { v1 }, Lcom/innioasis/ipp/BigCover$Src;-><init>()V
  .line 732
    iput-object v0, v1, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
  .line 733
    iput-object p0, v1, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
  .line 734
    return-object v1
  :L4
  .line 728
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
  .line 738
    invoke-virtual { p0 }, Ljava/io/File;->length()J
    move-result-wide v0
  .line 739
    const-wide/16 v2, 0
    const/4 v4, 0
    cmp-long v5, v0, v2
    if-lez v5, :L7
    const-wide/32 v2, 8388608
    cmp-long v5, v0, v2
    if-lez v5, :L0
    goto :L7
  :L0
  .line 740
    long-to-int v1, v0
    new-array v0, v1, [B
  .line 741
    new-instance v2, Ljava/io/FileInputStream;
    invoke-direct { v2, p0 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 743
    const/4 p0, 0
  :L1
  .line 744
    if-ge p0, v1, :L6
  .line 745
    sub-int v3, v1, p0
  :L2
    invoke-virtual { v2, v0, p0, v3 }, Ljava/io/FileInputStream;->read([BII)I
    move-result v3
  :L3
  .line 746
    if-gez v3, :L4
  .line 750
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 746
    return-object v4
  :L4
  .line 747
    add-int/2addr p0, v3
  .line 748
    goto :L1
  :L5
  .line 750
    move-exception p0
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 751
    throw p0
  :L6
  .line 750
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 751
    nop
  .line 752
    return-object v0
  :L7
  .line 739
    return-object v4
.end method

.method private static same(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Z
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 788
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
  .line 789
    move-exception p0
  .line 790
    return v0
  :L3
  .line 788
    return v0
.end method

.method private static sig([B)I
  .registers 4
  .line 680
    new-instance v0, Ljava/util/zip/CRC32;
    invoke-direct { v0 }, Ljava/util/zip/CRC32;-><init>()V
  .line 681
    const/4 v1, 0
    array-length v2, p0
    invoke-virtual { v0, p0, v1, v2 }, Ljava/util/zip/CRC32;->update([BII)V
  .line 682
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
  .line 695
    const/4 v1, 0
    if-eqz p0, :L4
    if-nez p1, :L0
    goto :L4
  :L0
  .line 696
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 697
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
  .line 698
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
  .line 694
    move-exception p0
    monitor-exit v0
    throw p0
  :L4
  .line 695
    monitor-exit v0
    return v1
.end method

.method private static declared-synchronized sigSet(Ljava/lang/String;[B)V
  .catchall { :L0 .. :L1 } :L5
  .catchall { :L3 .. :L4 } :L5
  .registers 6
    const-class v0, Lcom/innioasis/ipp/BigCover;
    monitor-enter v0
  .line 686
    if-eqz p0, :L6
    if-nez p1, :L0
    goto :L6
  :L0
  .line 687
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 688
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->sig([B)I
    move-result p1
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
  .line 689
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
  .line 690
    const/4 p0, 1
  :L3
    sput-boolean p0, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  .line 691
    sget-boolean p0, Lcom/innioasis/ipp/BigCover;->passing:Z
    if-nez p0, :L4
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  :L4
  .line 692
    monitor-exit v0
    return-void
  :L5
  .line 685
    move-exception p0
    monitor-exit v0
    throw p0
  :L6
  .line 686
    monitor-exit v0
    return-void
.end method

.method private static square(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .registers 4
  .line 775
    if-nez p0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 776
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v0
  .line 777
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v1
  .line 778
    const/16 v2, 300
    if-ne v0, v1, :L1
    if-gt v0, v2, :L1
    return-object p0
  :L1
  .line 779
    invoke-static { v0, v1 }, Ljava/lang/Math;->min(II)I
    move-result v0
  .line 780
    if-lez v0, :L3
    if-le v0, v2, :L2
    goto :L3
  :L2
    move v2, v0
  :L3
  .line 781
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Cover;->square(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 782
    if-nez v0, :L4
    goto :L5
  :L4
    move-object p0, v0
  :L5
    return-object p0
.end method

.method private static store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;Lcom/innioasis/ipp/BigCover$Walk;)Z
  .registers 4
  .line 796
    const/4 v0, 1
    invoke-static { p0, p1, p2, v0 }, Lcom/innioasis/ipp/BigCover;->store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;Lcom/innioasis/ipp/BigCover$Walk;Z)Z
    move-result p0
    return p0
.end method

.method private static store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;Lcom/innioasis/ipp/BigCover$Walk;Z)Z
  .catchall { :L0 .. :L5 } :L6
  .registers 12
  .line 802
    const/4 v0, 0
    if-eqz p1, :L7
  :L0
    iget-object v1, p1, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
    if-nez v1, :L1
    goto :L7
  :L1
  .line 803
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/BigCover;->fit(Lcom/innioasis/ipp/BigCover$Src;Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v1
  .line 804
    if-nez v1, :L2
    return v0
  :L2
  .line 805
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v2
  .line 806
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/BigCover;->write(Ljava/lang/String;[B)Z
    move-result v1
  .line 807
    if-eqz p2, :L3
    iget-wide v4, p2, Lcom/innioasis/ipp/BigCover$Walk;->writeNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v6
    sub-long/2addr v6, v2
    add-long/2addr v4, v6
    iput-wide v4, p2, Lcom/innioasis/ipp/BigCover$Walk;->writeNs:J
  :L3
  .line 808
    if-nez v1, :L4
    return v0
  :L4
  .line 809
    if-eqz p3, :L5
    sget-object p2, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    iget-object p1, p1, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
    invoke-interface { p2, p0, p1 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L5
  .line 810
    const/4 p0, 1
    return p0
  :L6
  .line 811
    move-exception p0
  .line 812
    return v0
  :L7
  .line 802
    return v0
.end method

.method private static storeSrc(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;[B)I
  .registers 12
  .line 516
    array-length v0, p2
    const/16 v1, 25600
    const/4 v2, 2
    const/4 v3, 0
    const-wide/16 v4, 1
    if-gt v0, v1, :L1
    invoke-static { p2 }, Lcom/innioasis/ipp/BigCover;->isJpeg([B)Z
    move-result v0
    if-eqz v0, :L1
  .line 517
    iget-wide v0, p0, Lcom/innioasis/ipp/BigCover$Walk;->verbatim:J
    add-long/2addr v0, v4
    iput-wide v0, p0, Lcom/innioasis/ipp/BigCover$Walk;->verbatim:J
  .line 518
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v0
  .line 519
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/BigCover;->write(Ljava/lang/String;[B)Z
    move-result p1
  .line 520
    iget-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->writeNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v6
    sub-long/2addr v6, v0
    add-long/2addr v4, v6
    iput-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->writeNs:J
  .line 521
    if-eqz p1, :L0
    const/4 v2, 0
  :L0
    return v2
  :L1
  .line 523
    iget-wide v0, p0, Lcom/innioasis/ipp/BigCover$Walk;->encoded:J
    add-long/2addr v0, v4
    iput-wide v0, p0, Lcom/innioasis/ipp/BigCover$Walk;->encoded:J
  .line 524
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v0
  .line 525
    invoke-static { p2 }, Lcom/innioasis/ipp/BigCover;->capped([B)Landroid/graphics/Bitmap;
    move-result-object v4
  .line 526
    iget-wide v5, p0, Lcom/innioasis/ipp/BigCover$Walk;->srcDecodeNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v7
    sub-long/2addr v7, v0
    add-long/2addr v5, v7
    iput-wide v5, p0, Lcom/innioasis/ipp/BigCover$Walk;->srcDecodeNs:J
  .line 527
    if-nez v4, :L2
    const/4 p0, 1
    return p0
  :L2
  .line 528
    new-instance v0, Lcom/innioasis/ipp/BigCover$Src;
    invoke-direct { v0 }, Lcom/innioasis/ipp/BigCover$Src;-><init>()V
  .line 529
    iput-object v4, v0, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
  .line 530
    iput-object p2, v0, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
  .line 531
    invoke-static { p1, v0, p0 }, Lcom/innioasis/ipp/BigCover;->store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;Lcom/innioasis/ipp/BigCover$Walk;)Z
    move-result p2
  .line 532
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v0, p1 }, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 533
    if-nez p2, :L3
    return v2
  :L3
  .line 534
    invoke-static { p0, v4 }, Lcom/innioasis/ipp/BigCover$Walk;->access$302(Lcom/innioasis/ipp/BigCover$Walk;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .line 535
    return v3
.end method

.method public static track(Ljava/lang/String;)Landroid/graphics/Bitmap;
  .registers 2
  .line 83
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
  .line 95
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 96
    if-eqz p1, :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v1
    goto :L2
  :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peekTrackFree(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v1
  :L2
  .line 97
    if-eqz v1, :L3
    return-object v1
  :L3
  .line 98
    sget-object v1, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L4
    return-object v0
  :L4
  .line 101
    sget-object v2, Lcom/innioasis/ipp/BigCover;->LOCK:Ljava/lang/Object;
    monitor-enter v2
  .line 102
    if-eqz p1, :L6
  :L5
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v3
    goto :L7
  :L6
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peekTrackFree(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v3
  :L7
  .line 103
    if-eqz v3, :L8
    monitor-exit v2
    return-object v3
  :L8
  .line 104
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L9
    monitor-exit v2
    return-object v0
  :L9
  .line 106
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
  .line 107
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->note(Ljava/lang/String;)I
    move-result v4
    if-nez v4, :L11
    invoke-virtual { v1, p0, p0 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    monitor-exit v2
  :L10
    return-object v0
  :L11
  .line 111
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->read(Ljava/lang/String;)Lcom/innioasis/ipp/BigCover$Src;
    move-result-object v1
  :L12
  .line 116
    goto :L14
  :L13
  .line 114
    move-exception v1
  .line 115
    move-object v1, v0
  :L14
  .line 117
    sget-object v4, Lcom/innioasis/ipp/BigCover;->UNREAD:Lcom/innioasis/ipp/BigCover$Src;
    if-ne v1, v4, :L15
    monitor-exit v2
    return-object v0
  :L15
  .line 118
    if-nez v1, :L16
  .line 119
    sget-object p1, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { p1, p0, p0 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 120
    const/4 p1, 0
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 121
    monitor-exit v2
    return-object v0
  :L16
  .line 123
    iget-object v4, v1, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
  .line 126
    invoke-static { v3, p1 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;Z)Landroid/graphics/Bitmap;
    move-result-object v5
  .line 127
    const/4 v6, 1
    if-nez v5, :L19
  .line 128
    if-eqz p1, :L17
    sget-object v5, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v5, p0, v4 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L17
  .line 129
    invoke-static { v3, v1, v0, p1 }, Lcom/innioasis/ipp/BigCover;->store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;Lcom/innioasis/ipp/BigCover$Walk;Z)Z
    move-result p1
    if-nez p1, :L18
    monitor-exit v2
    return-object v4
  :L18
  .line 130
    iget-object p1, v1, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
    invoke-static { v3, p1 }, Lcom/innioasis/ipp/BigCover;->sigSet(Ljava/lang/String;[B)V
  .line 131
    invoke-static { p0, v6 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 132
    monitor-exit v2
    return-object v4
  :L19
  .line 134
    iget-object v7, v1, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
    invoke-static { v3, v7 }, Lcom/innioasis/ipp/BigCover;->sigIs(Ljava/lang/String;[B)Z
    move-result v3
    if-nez v3, :L23
    invoke-static { v5, v4 }, Lcom/innioasis/ipp/BigCover;->same(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Z
    move-result v3
    if-eqz v3, :L20
    goto :L23
  :L20
  .line 139
    if-eqz p1, :L21
    sget-object v3, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v3, p0, v4 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L21
  .line 140
    invoke-static { p0, v1, v0, p1 }, Lcom/innioasis/ipp/BigCover;->store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;Lcom/innioasis/ipp/BigCover$Walk;Z)Z
    move-result p1
    if-eqz p1, :L22
    const/4 p1, 2
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  :L22
  .line 141
    monitor-exit v2
    return-object v4
  :L23
  .line 135
    if-eqz p1, :L24
    sget-object p1, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { p1, p0, v5 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L24
  .line 136
    invoke-static { p0, v6 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 137
    monitor-exit v2
    return-object v5
  :L25
  .line 112
    move-exception p0
  .line 113
    monitor-exit v2
    return-object v0
  :L26
  .line 142
    move-exception p0
    monitor-exit v2
  :L27
    throw p0
.end method

.method public static trackFree(Ljava/lang/String;)Landroid/graphics/Bitmap;
  .registers 2
  .line 91
    const/4 v0, 0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/BigCover;->track(Ljava/lang/String;Z)Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
.end method

.method private static warm(Ljava/lang/String;)V
  .registers 3
  .line 179
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
  .line 180
    sget-object v0, Lcom/innioasis/ipp/BigCover;->worker:Landroid/os/Handler;
    if-nez v0, :L1
  .line 181
    new-instance v0, Landroid/os/HandlerThread;
    const-string v1, "ipp-cover"
    invoke-direct { v0, v1 }, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V
  .line 182
    invoke-virtual { v0 }, Landroid/os/HandlerThread;->start()V
  .line 183
    new-instance v1, Landroid/os/Handler;
    invoke-virtual { v0 }, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;
    move-result-object v0
    invoke-direct { v1, v0 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v1, Lcom/innioasis/ipp/BigCover;->worker:Landroid/os/Handler;
  :L1
  .line 185
    sget-object v0, Lcom/innioasis/ipp/BigCover;->worker:Landroid/os/Handler;
    new-instance v1, Lcom/innioasis/ipp/BigCover$Warm;
    invoke-direct { v1, p0 }, Lcom/innioasis/ipp/BigCover$Warm;-><init>(Ljava/lang/String;)V
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 186
    return-void
  :L2
  .line 179
    return-void
.end method

.method private static write(Ljava/lang/String;[B)Z
  .catchall { :L0 .. :L1 } :L7
  .catchall { :L2 .. :L3 } :L6
  .catchall { :L3 .. :L4 } :L5
  .catchall { :L4 .. :L6 } :L6
  .catchall { :L9 .. :L10 } :L11
  .registers 4
  .line 818
    nop
  .line 820
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object p0
  :L1
  .line 821
    if-nez p0, :L2
    return v0
  :L2
  .line 822
    new-instance v1, Ljava/io/FileOutputStream;
    invoke-direct { v1, p0 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  :L3
  .line 824
    invoke-virtual { v1, p1 }, Ljava/io/FileOutputStream;->write([B)V
  :L4
  .line 826
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
  .line 827
    nop
  .line 828
    const/4 p0, 1
    return p0
  :L5
  .line 826
    move-exception p1
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
  .line 827
    throw p1
  :L6
  .line 829
    move-exception p1
    goto :L8
  :L7
    move-exception p0
    const/4 p0, 0
  :L8
  .line 830
    if-eqz p0, :L12
  :L9
    invoke-virtual { p0 }, Ljava/io/File;->delete()Z
  :L10
    goto :L12
  :L11
    move-exception p0
  :L12
  .line 831
    return v0
.end method
