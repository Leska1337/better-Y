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
  .line 55
    new-instance v0, Lcom/innioasis/ipp/BigCover$Lru;
    invoke-direct { v0 }, Lcom/innioasis/ipp/BigCover$Lru;-><init>()V
    invoke-static { v0 }, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
  .line 73
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
  .line 77
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/BigCover;->LOCK:Ljava/lang/Object;
  .line 527
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
  .line 678
    new-instance v0, Lcom/innioasis/ipp/BigCover$Src;
    invoke-direct { v0 }, Lcom/innioasis/ipp/BigCover$Src;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/BigCover;->UNREAD:Lcom/innioasis/ipp/BigCover$Src;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 37
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000()Ljava/util/Map;
  .registers 1
  .line 35
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    return-object v0
.end method

.method public static beginCache()V
  .registers 1
  .line 510
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/BigCover;->passing:Z
  .line 511
    return-void
.end method

.method public static cache(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;[B)Z
  .catchall { :L1 .. :L19 } :L20
  .registers 16
  .line 363
    const/4 v0, 1
    if-eqz p1, :L21
    if-nez p0, :L0
    goto/16 :L21
  :L0
  .line 365
    const/4 v1, 0
    const-wide/16 v2, 1
  :L1
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->needs(Ljava/lang/String;)Z
    move-result v4
    if-nez v4, :L2
    return v0
  :L2
  .line 366
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
  .line 367
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
  .line 368
    invoke-static { p0, v4 }, Lcom/innioasis/ipp/BigCover$Walk;->access$102(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;)Ljava/lang/String;
  .line 371
    if-eqz p2, :L4
    array-length v5, p2
    if-lez v5, :L4
  .line 372
    nop
  .line 373
    iget-wide v5, p0, Lcom/innioasis/ipp/BigCover$Walk;->embedded:J
    add-long/2addr v5, v2
    iput-wide v5, p0, Lcom/innioasis/ipp/BigCover$Walk;->embedded:J
    goto :L5
  :L4
  .line 375
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v5
  .line 376
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/BigCover;->external(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;)[B
    move-result-object p2
  .line 377
    iget-wide v7, p0, Lcom/innioasis/ipp/BigCover$Walk;->externalNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v9
    sub-long/2addr v9, v5
    add-long/2addr v7, v9
    iput-wide v7, p0, Lcom/innioasis/ipp/BigCover$Walk;->externalNs:J
  .line 378
    if-eqz p2, :L5
    array-length v5, p2
    if-lez v5, :L5
    iget-wide v5, p0, Lcom/innioasis/ipp/BigCover$Walk;->external:J
    add-long/2addr v5, v2
    iput-wide v5, p0, Lcom/innioasis/ipp/BigCover$Walk;->external:J
  :L5
  .line 380
    if-eqz p2, :L18
    array-length v5, p2
    if-nez v5, :L6
    goto/16 :L18
  :L6
  .line 383
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v5
    if-eqz v5, :L7
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v5
    invoke-static { v5, p2 }, Ljava/util/Arrays;->equals([B[B)Z
    move-result v5
    if-eqz v5, :L7
  .line 384
    iget-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->sameBytes:J
    add-long/2addr v4, v2
    iput-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->sameBytes:J
  .line 385
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 386
    return v0
  :L7
  .line 389
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v5
    const/4 v6, 2
    if-nez v5, :L12
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$300(Lcom/innioasis/ipp/BigCover$Walk;)Landroid/graphics/Bitmap;
    move-result-object v5
    if-nez v5, :L12
  .line 390
    invoke-static { v4 }, Lcom/innioasis/ipp/BigCover;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v5
  .line 391
    if-eqz v5, :L8
    invoke-virtual { v5 }, Ljava/io/File;->exists()Z
    move-result v5
    if-eqz v5, :L8
    invoke-static { v4, p2 }, Lcom/innioasis/ipp/BigCover;->sigIs(Ljava/lang/String;[B)Z
    move-result v5
    if-eqz v5, :L8
  .line 392
    iget-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->sigOnDisk:J
    add-long/2addr v4, v2
    iput-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->sigOnDisk:J
  .line 393
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/BigCover$Walk;->access$202(Lcom/innioasis/ipp/BigCover$Walk;[B)[B
  .line 394
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 395
    return v0
  :L8
  .line 397
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v7
  .line 398
    invoke-static { v4 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v5
  .line 399
    iget-wide v9, p0, Lcom/innioasis/ipp/BigCover$Walk;->decodeNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v11
    sub-long/2addr v11, v7
    add-long/2addr v9, v11
    iput-wide v9, p0, Lcom/innioasis/ipp/BigCover$Walk;->decodeNs:J
  .line 400
    if-nez v5, :L11
  .line 401
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v7
  .line 402
    invoke-static { p0, v4, p2 }, Lcom/innioasis/ipp/BigCover;->storeSrc(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;[B)I
    move-result v5
  .line 403
    iget-wide v9, p0, Lcom/innioasis/ipp/BigCover$Walk;->storeNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v11
    sub-long/2addr v11, v7
    add-long/2addr v9, v11
    iput-wide v9, p0, Lcom/innioasis/ipp/BigCover$Walk;->storeNs:J
  .line 404
    if-ne v5, v6, :L9
    iget-wide p1, p0, Lcom/innioasis/ipp/BigCover$Walk;->failed:J
    add-long/2addr p1, v2
    iput-wide p1, p0, Lcom/innioasis/ipp/BigCover$Walk;->failed:J
    return v1
  :L9
  .line 405
    if-ne v5, v0, :L10
    iget-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->none:J
    add-long/2addr v4, v2
    iput-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->none:J
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
    return v0
  :L10
  .line 406
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/BigCover$Walk;->access$202(Lcom/innioasis/ipp/BigCover$Walk;[B)[B
  .line 407
    invoke-static { v4, p2 }, Lcom/innioasis/ipp/BigCover;->sigSet(Ljava/lang/String;[B)V
  .line 408
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 409
    return v0
  :L11
  .line 411
    invoke-static { p0, v5 }, Lcom/innioasis/ipp/BigCover$Walk;->access$302(Lcom/innioasis/ipp/BigCover$Walk;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  :L12
  .line 414
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v4
  .line 415
    invoke-static { p2 }, Lcom/innioasis/ipp/BigCover;->capped([B)Landroid/graphics/Bitmap;
    move-result-object v7
  .line 416
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
  .line 417
    iget-wide v8, p0, Lcom/innioasis/ipp/BigCover$Walk;->decodeNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v10
    sub-long/2addr v10, v4
    add-long/2addr v8, v10
    iput-wide v8, p0, Lcom/innioasis/ipp/BigCover$Walk;->decodeNs:J
  .line 418
    if-nez v7, :L14
    iget-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->none:J
    add-long/2addr v4, v2
    iput-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->none:J
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
    return v0
  :L14
  .line 419
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$300(Lcom/innioasis/ipp/BigCover$Walk;)Landroid/graphics/Bitmap;
    move-result-object v4
    invoke-static { v4, v7 }, Lcom/innioasis/ipp/BigCover;->same(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Z
    move-result v4
    if-eqz v4, :L16
  .line 420
    iget-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->samePixels:J
    add-long/2addr v4, v2
    iput-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->samePixels:J
  .line 422
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v4
    if-nez v4, :L15
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/BigCover$Walk;->access$202(Lcom/innioasis/ipp/BigCover$Walk;[B)[B
  :L15
  .line 423
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 424
    return v0
  :L16
  .line 426
    new-instance v4, Lcom/innioasis/ipp/BigCover$Src;
    invoke-direct { v4 }, Lcom/innioasis/ipp/BigCover$Src;-><init>()V
  .line 427
    iput-object v7, v4, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
  .line 428
    iput-object p2, v4, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
  .line 429
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v7
  .line 430
    invoke-static { p1, v4, p0 }, Lcom/innioasis/ipp/BigCover;->store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;Lcom/innioasis/ipp/BigCover$Walk;)Z
    move-result p2
  .line 431
    iget-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->storeNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v9
    sub-long/2addr v9, v7
    add-long/2addr v4, v9
    iput-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->storeNs:J
  .line 432
    sget-object v4, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v4, p1 }, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 433
    if-nez p2, :L17
    iget-wide p1, p0, Lcom/innioasis/ipp/BigCover$Walk;->failed:J
    add-long/2addr p1, v2
    iput-wide p1, p0, Lcom/innioasis/ipp/BigCover$Walk;->failed:J
    return v1
  :L17
  .line 434
    iget-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->own:J
    add-long/2addr v4, v2
    iput-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->own:J
  .line 435
    invoke-static { p1, v6 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 436
    return v0
  :L18
  .line 380
    iget-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->none:J
    add-long/2addr v4, v2
    iput-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->none:J
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  :L19
    return v0
  :L20
  .line 437
    move-exception p1
  .line 438
    iget-wide p1, p0, Lcom/innioasis/ipp/BigCover$Walk;->failed:J
    add-long/2addr p1, v2
    iput-wide p1, p0, Lcom/innioasis/ipp/BigCover$Walk;->failed:J
  .line 439
    return v1
  :L21
  .line 363
    return v0
.end method

.method public static cachedFile(Ljava/lang/String;)Ljava/io/File;
  .registers 4
  .line 207
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 208
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->note(Ljava/lang/String;)I
    move-result v1
  .line 209
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
  .line 210
    if-nez p0, :L4
    move-object p0, v0
    goto :L5
  :L4
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object p0
  :L5
  .line 211
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
  .line 717
    const/4 v0, 0
  :L0
    new-instance v1, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v1 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 718
    const/4 v2, 1
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 719
    array-length v2, p0
    const/4 v3, 0
    invoke-static { p0, v3, v2, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 720
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    if-lez v2, :L3
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    if-gtz v2, :L1
    goto :L3
  :L1
  .line 721
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    iget v4, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    const/16 v5, 300
    invoke-static { v2, v4, v5, v5 }, Lcom/innioasis/ipp/Art;->sample(IIII)I
    move-result v2
    iput v2, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 722
    iput-boolean v3, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 723
    array-length v2, p0
    invoke-static { p0, v3, v2, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object p0
  .line 724
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->square(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object p0
  :L2
    return-object p0
  :L3
  .line 720
    return-object v0
  :L4
  .line 727
    move-exception p0
  .line 728
    return-object v0
  :L5
  .line 725
    move-exception p0
  .line 726
    throw p0
.end method

.method public static clear()V
  .catchall { :L0 .. :L5 } :L6
  .registers 4
  .line 287
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v0 }, Ljava/util/Map;->clear()V
  .line 288
    sget-object v0, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 289
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteClear()V
  :L0
  .line 291
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->dir()Ljava/io/File;
    move-result-object v0
  .line 292
    if-nez v0, :L1
    return-void
  :L1
  .line 293
    invoke-virtual { v0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v1
  .line 294
    if-nez v1, :L2
    return-void
  :L2
  .line 295
    const/4 v2, 0
  :L3
    array-length v3, v1
    if-ge v2, v3, :L4
    aget-object v3, v1, v2
    invoke-virtual { v3 }, Ljava/io/File;->delete()Z
    add-int/lit8 v2, v2, 1
    goto :L3
  :L4
  .line 296
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  :L5
  .line 298
    goto :L7
  :L6
  .line 297
    move-exception v0
  :L7
  .line 299
    return-void
.end method

.method public static clearMiss()V
  .registers 1
  .line 281
    sget-object v0, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 282
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteForgetNone()V
  .line 283
    return-void
.end method

.method private static dir()Ljava/io/File;
  .catchall { :L3 .. :L5 } :L7
  .registers 5
  .line 877
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 878
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 879
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 880
    if-nez v0, :L1
    return-object v1
  :L1
  .line 881
    new-instance v1, Ljava/io/File;
    const-string v2, "ipp_big"
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 882
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v0
    if-nez v0, :L2
    invoke-virtual { v1 }, Ljava/io/File;->mkdirs()Z
  :L2
  .line 883
    sget-boolean v0, Lcom/innioasis/ipp/BigCover;->swept:Z
    if-nez v0, :L8
  .line 884
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/BigCover;->swept:Z
  :L3
  .line 886
    invoke-virtual { v1 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v0
  .line 887
    if-eqz v0, :L6
  .line 888
    const/4 v2, 0
  :L4
    array-length v3, v0
    if-ge v2, v3, :L6
  .line 889
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
  .line 888
    add-int/lit8 v2, v2, 1
    goto :L4
  :L6
  .line 893
    goto :L8
  :L7
  .line 892
    move-exception v0
  :L8
  .line 895
    return-object v1
.end method

.method private static encode(Landroid/graphics/Bitmap;ILcom/innioasis/ipp/BigCover$Walk;)[B
  .catchall { :L0 .. :L1 } :L3
  .registers 9
  .line 853
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v0
  .line 855
    const-wide/16 v2, 1
  :L0
    new-instance v4, Ljava/io/ByteArrayOutputStream;
    const/16 v5, 25600
    invoke-direct { v4, v5 }, Ljava/io/ByteArrayOutputStream;-><init>(I)V
  .line 856
    sget-object v5, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;
    invoke-virtual { p0, v5, p1, v4 }, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
  .line 857
    invoke-virtual { v4 }, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    move-result-object p0
  :L1
  .line 861
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
  .line 857
    return-object p0
  :L3
  .line 858
    move-exception p0
  .line 859
    nop
  .line 861
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
  .line 859
    const/4 p0, 0
    return-object p0
.end method

.method public static endCache()V
  .registers 1
  .line 514
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/BigCover;->passing:Z
  .line 515
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  .line 516
    return-void
.end method

.method private static external(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;)[B
  .catchall { :L0 .. :L3 } :L4
  .registers 11
  .line 461
    const/4 v0, 0
  :L0
    invoke-static { p1 }, Lcom/innioasis/ipp/Art;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v1
  .line 462
    if-nez v1, :L1
    return-object v0
  :L1
  .line 463
    invoke-static { p1 }, Lcom/innioasis/ipp/Art;->stampRead(Ljava/lang/String;)V
  .line 464
    invoke-virtual { v1 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object p1
  .line 465
    invoke-virtual { v1 }, Ljava/io/File;->length()J
    move-result-wide v2
  .line 466
    invoke-virtual { v1 }, Ljava/io/File;->lastModified()J
    move-result-wide v4
  .line 467
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$400(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v6
    if-eqz v6, :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$500(Lcom/innioasis/ipp/BigCover$Walk;)Ljava/lang/String;
    move-result-object v6
    invoke-virtual { p1, v6 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v6
    if-eqz v6, :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$600(Lcom/innioasis/ipp/BigCover$Walk;)J
    move-result-wide v6
    cmp-long v8, v2, v6
    if-nez v8, :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$700(Lcom/innioasis/ipp/BigCover$Walk;)J
    move-result-wide v6
    cmp-long v8, v4, v6
    if-nez v8, :L2
  .line 468
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$400(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object p0
    return-object p0
  :L2
  .line 470
    invoke-static { v1 }, Lcom/innioasis/ipp/BigCover;->readAll(Ljava/io/File;)[B
    move-result-object v1
  .line 471
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/BigCover$Walk;->access$502(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;)Ljava/lang/String;
  .line 472
    invoke-static { p0, v2, v3 }, Lcom/innioasis/ipp/BigCover$Walk;->access$602(Lcom/innioasis/ipp/BigCover$Walk;J)J
  .line 473
    invoke-static { p0, v4, v5 }, Lcom/innioasis/ipp/BigCover$Walk;->access$702(Lcom/innioasis/ipp/BigCover$Walk;J)J
  .line 474
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/BigCover$Walk;->access$402(Lcom/innioasis/ipp/BigCover$Walk;[B)[B
  :L3
  .line 475
    return-object v1
  :L4
  .line 476
    move-exception p0
  .line 477
    return-object v0
.end method

.method private static external(Ljava/lang/String;)[B
  .catchall { :L0 .. :L2 } :L3
  .registers 3
  .line 446
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v1
  .line 447
    if-nez v1, :L1
    return-object v0
  :L1
  .line 448
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->stampRead(Ljava/lang/String;)V
  .line 449
    invoke-static { v1 }, Lcom/innioasis/ipp/BigCover;->readAll(Ljava/io/File;)[B
    move-result-object p0
  :L2
    return-object p0
  :L3
  .line 450
    move-exception p0
  .line 451
    return-object v0
.end method

.method private static file(Ljava/lang/String;)Ljava/io/File;
  .registers 5
  .line 871
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->dir()Ljava/io/File;
    move-result-object v0
  .line 872
    if-nez v0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 873
    new-instance v1, Ljava/io/File;
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { p0 }, Ljava/lang/String;->hashCode()I
    move-result v3
    invoke-static { v3 }, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    const-string v3, "-"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result p0
    invoke-virtual { v2, p0 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object p0
    const-string v2, "-300q.jpg"
    invoke-virtual { p0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-direct { v1, v0, p0 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    return-object v1
.end method

.method private static fit(Lcom/innioasis/ipp/BigCover$Src;Lcom/innioasis/ipp/BigCover$Walk;)[B
  .registers 26
  .line 794
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
  .line 799
    nop
  .line 800
    nop
  .line 801
    nop
  .line 802
    nop
  .line 803
    nop
  .line 804
    sget v2, Lcom/innioasis/ipp/BigCover;->lastQ:I
  .line 805
    const/16 v4, 92
    const/16 v5, 76
    if-lt v2, v5, :L1
    if-le v2, v4, :L2
  :L1
    const/16 v2, 84
  :L2
  .line 806
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->limit()I
    move-result v6
    int-to-double v6, v6
    invoke-static { v6, v7 }, Ljava/lang/Math;->log(D)D
    move-result-wide v6
  .line 807
    nop
  .line 808
    const/4 v8, 0
    const/4 v9, 0
    move-object v12, v9
    move-object v13, v12
    const/4 v9, 0
    const/16 v14, 76
    const-wide/16 v15, 0
    const-wide/16 v17, 0
  :L3
  .line 809
    if-gt v14, v4, :L15
  .line 810
    if-ge v2, v14, :L4
    move v2, v14
  :L4
  .line 811
    if-le v2, v4, :L5
    move v2, v4
  :L5
  .line 812
    iget-object v10, v0, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
    invoke-static { v10, v2, v1 }, Lcom/innioasis/ipp/BigCover;->encode(Landroid/graphics/Bitmap;ILcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v10
  .line 813
    if-nez v10, :L6
    goto/16 :L15
  :L6
  .line 814
    array-length v11, v10
    if-gt v11, v3, :L7
  .line 815
    nop
  .line 816
    nop
  .line 817
    add-int/lit8 v14, v2, 1
    move v8, v2
    move-object v12, v10
    goto :L9
  :L7
  .line 819
    if-ne v2, v5, :L8
    move-object v13, v10
  :L8
  .line 820
    add-int/lit8 v4, v2, -1
  :L9
  .line 822
    nop
  .line 823
    nop
  .line 824
    mul-int/lit8 v2, v2, 2
    const/16 v11, 200
    rsub-int v2, v2, 200
    move/from16 v21, v4
    int-to-double v3, v2
    invoke-static { v3, v4 }, Ljava/lang/Math;->log(D)D
    move-result-wide v2
  .line 825
    array-length v4, v10
    move-object v10, v12
    int-to-double v11, v4
    invoke-static { v11, v12 }, Ljava/lang/Math;->log(D)D
    move-result-wide v11
  .line 826
    const/4 v4, 1
    add-int/2addr v9, v4
  .line 827
    nop
  .line 828
    if-le v9, v4, :L10
    cmpl-double v22, v2, v15
    if-eqz v22, :L10
  .line 829
    sub-double v17, v11, v17
    sub-double v15, v2, v15
    div-double v17, v17, v15
  .line 830
    const-wide/16 v15, 0
    cmpg-double v19, v17, v15
    if-gez v19, :L11
    goto :L12
  :L10
  .line 828
    const-wide/16 v15, 0
  :L11
  .line 832
    const-wide v17, -4619792497756654797L
  :L12
    sub-double v19, v6, v11
    div-double v19, v19, v17
    add-double v19, v2, v19
    invoke-static/range { v19 .. v20 }, Ljava/lang/Math;->exp(D)D
    move-result-wide v17
  .line 833
    move-wide/from16 v22, v6
    invoke-static/range { v17 .. v18 }, Ljava/lang/Math;->ceil(D)D
    move-result-wide v5
    double-to-int v5, v5
  .line 834
    const/16 v6, 200
    if-lt v5, v6, :L13
    const/16 v4, 76
    goto :L14
  :L13
    rsub-int v5, v5, 200
    shr-int/lit8 v4, v5, 1
  :L14
  .line 835
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
  .line 836
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
  .line 837
    if-eqz v12, :L19
    sput v8, Lcom/innioasis/ipp/BigCover;->lastQ:I
  :L19
  .line 838
    return-object v13
.end method

.method public static forget(Ljava/lang/String;)V
  .catchall { :L1 .. :L2 } :L3
  .registers 2
  .line 267
    if-nez p0, :L0
    return-void
  :L0
  .line 268
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v0, p0 }, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 269
    sget-object v0, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v0, p0 }, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 270
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->noteForget(Ljava/lang/String;)V
  :L1
  .line 272
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v0
  .line 273
    if-eqz v0, :L2
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  :L2
  .line 275
    goto :L4
  :L3
  .line 274
    move-exception v0
  :L4
  .line 276
    invoke-static { p0 }, Lcom/innioasis/ipp/FlowCache;->forget(Ljava/lang/String;)V
  .line 277
    return-void
.end method

.method private static isJpeg([B)Z
  .registers 6
  .line 867
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
  .line 236
    if-eqz p0, :L0
    if-eqz p1, :L0
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v0, p0 }, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    if-nez v1, :L0
    invoke-interface { v0, p0, p1 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L0
  .line 237
    return-void
.end method

.method public static knownNone(Ljava/lang/String;)Z
  .registers 1
  .line 352
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
  .line 846
    const/16 v0, 25600
    return v0
.end method

.method static memBytes()J
  .catchall { :L0 .. :L1 } :L2
  .catchall { :L3 .. :L4 } :L2
  .registers 3
  .line 60
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    monitor-enter v0
  :L0
  .line 61
    new-instance v1, Ljava/util/ArrayList;
    invoke-interface { v0 }, Ljava/util/Map;->values()Ljava/util/Collection;
    move-result-object v2
    invoke-direct { v1, v2 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 62
    monitor-exit v0
  :L1
  .line 63
    invoke-static { v1 }, Lcom/innioasis/ipp/Diag;->bitmapBytes(Ljava/util/Collection;)J
    move-result-wide v0
    return-wide v0
  :L2
  .line 62
    move-exception v1
  :L3
    monitor-exit v0
  :L4
    throw v1
.end method

.method public static needs(Ljava/lang/String;)Z
  .registers 4
  .line 336
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->note(Ljava/lang/String;)I
    move-result v0
  .line 337
    const/4 v1, -1
    const/4 v2, 1
    if-ne v0, v1, :L0
    return v2
  :L0
  .line 338
    const/4 v1, 0
    if-nez v0, :L1
    return v1
  :L1
  .line 339
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
  .line 590
    const/4 v1, -1
    if-nez p0, :L0
    monitor-exit v0
    return v1
  :L0
  .line 591
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 592
    sget-object v2, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v2, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 593
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
  .line 589
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
  .line 661
    sget-object v1, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v1 }, Ljava/util/HashMap;->clear()V
  .line 662
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->mayNone:Z
  .line 663
    const/4 v2, 1
    sput-boolean v2, Lcom/innioasis/ipp/BigCover;->notesLoaded:Z
  .line 664
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  :L1
  .line 666
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteFile()Ljava/io/File;
    move-result-object v1
  .line 667
    if-eqz v1, :L2
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-eqz v2, :L2
    invoke-virtual { v1 }, Ljava/io/File;->delete()Z
  :L2
  .line 669
    goto :L4
  :L3
  .line 668
    move-exception v1
  :L4
  .line 670
    monitor-exit v0
    return-void
  :L5
  .line 660
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method private static noteFile()Ljava/io/File;
  .registers 3
  .line 535
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 536
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 537
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 539
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
  .line 608
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 609
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
  .line 610
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
  .line 611
    if-eqz v2, :L4
    sput-boolean v3, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  :L4
  .line 612
    monitor-exit v0
    return-void
  :L5
  .line 607
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
  .line 616
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 617
    sget-boolean v1, Lcom/innioasis/ipp/BigCover;->mayNone:Z
  :L1
    if-nez v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 618
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 619
    sget-object v2, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v2 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v2
    invoke-interface { v2 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v2
  :L3
  .line 620
    invoke-interface { v2 }, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :L6
  .line 621
    invoke-interface { v2 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/util/Map$Entry;
  .line 622
    invoke-interface { v3 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
    const-string v5, "\u0001"
    invoke-virtual { v4, v5 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :L4
    goto :L3
  :L4
  .line 623
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
  .line 624
    goto :L3
  :L6
  .line 625
    const/4 v2, 0
    sput-boolean v2, Lcom/innioasis/ipp/BigCover;->mayNone:Z
  .line 626
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v3
  :L7
    if-eqz v3, :L8
    monitor-exit v0
    return-void
  :L8
  .line 627
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
  .line 628
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  .line 629
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  :L11
  .line 630
    monitor-exit v0
    return-void
  :L12
  .line 615
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
  .line 543
    sget-boolean v1, Lcom/innioasis/ipp/BigCover;->notesLoaded:Z
  :L1
    if-eqz v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 544
    const/4 v1, 1
  :L3
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesLoaded:Z
  :L4
  .line 546
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteFile()Ljava/io/File;
    move-result-object v2
  .line 547
    if-eqz v2, :L14
    invoke-virtual { v2 }, Ljava/io/File;->exists()Z
    move-result v3
    if-nez v3, :L5
    goto :L14
  :L5
  .line 548
    new-instance v3, Ljava/io/FileInputStream;
    invoke-direct { v3, v2 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 549
    invoke-virtual { v3 }, Ljava/io/FileInputStream;->available()I
    move-result v2
    new-array v2, v2, [B
  .line 550
    invoke-virtual { v3, v2 }, Ljava/io/FileInputStream;->read([B)I
  .line 551
    invoke-virtual { v3 }, Ljava/io/FileInputStream;->close()V
  .line 552
    new-instance v3, Ljava/lang/String;
    const-string v4, "UTF-8"
    invoke-direct { v3, v2, v4 }, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    const-string v2, "\n"
    invoke-virtual { v3, v2 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v2
  .line 553
    const/4 v3, 0
    const/4 v4, 0
  :L6
    array-length v5, v2
    if-ge v4, v5, :L13
  .line 554
    aget-object v5, v2, v4
  .line 555
    const/16 v6, 9
    invoke-virtual { v5, v6 }, Ljava/lang/String;->indexOf(I)I
    move-result v6
  :L7
  .line 556
    if-gtz v6, :L8
    goto :L12
  :L8
  .line 558
    add-int/lit8 v7, v6, 1
  :L9
    invoke-virtual { v5, v7 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v7
    invoke-virtual { v7 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v7
    invoke-static { v7 }, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;
    move-result-object v7
  .line 559
    sget-object v8, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v5, v3, v6 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v8, v5, v7 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 560
    invoke-virtual { v7 }, Ljava/lang/Integer;->intValue()I
    move-result v5
    if-nez v5, :L10
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->mayNone:Z
  :L10
  .line 562
    goto :L12
  :L11
  .line 561
    move-exception v5
  :L12
  .line 553
    add-int/lit8 v4, v4, 1
    goto :L6
  :L13
  .line 565
    goto :L16
  :L14
  .line 547
    monitor-exit v0
    return-void
  :L15
  .line 564
    move-exception v1
  :L16
  .line 566
    monitor-exit v0
    return-void
  :L17
  .line 542
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
  .line 569
    sget-boolean v1, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  :L1
    if-nez v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 571
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteFile()Ljava/io/File;
    move-result-object v1
  :L3
  .line 572
    if-nez v1, :L4
    monitor-exit v0
    return-void
  :L4
  .line 573
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
  .line 574
    sget-object v3, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v3 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v3
    invoke-interface { v3 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v3
  :L5
  .line 575
    invoke-interface { v3 }, Ljava/util/Iterator;->hasNext()Z
    move-result v4
    if-eqz v4, :L7
  .line 576
    invoke-interface { v3 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/util/Map$Entry;
  .line 577
    invoke-interface { v4 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/String;
  .line 578
    if-eqz v5, :L5
    const/16 v6, 9
    invoke-virtual { v5, v6 }, Ljava/lang/String;->indexOf(I)I
    move-result v7
    if-ltz v7, :L6
    goto :L5
  :L6
  .line 579
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
  .line 580
    goto :L5
  :L7
  .line 581
    new-instance v3, Ljava/io/FileOutputStream;
    invoke-direct { v3, v1 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  .line 582
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    const-string v2, "UTF-8"
    invoke-virtual { v1, v2 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object v1
    invoke-virtual { v3, v1 }, Ljava/io/FileOutputStream;->write([B)V
  .line 583
    invoke-virtual { v3 }, Ljava/io/FileOutputStream;->close()V
  .line 584
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  :L8
  .line 586
    goto :L10
  :L9
  .line 585
    move-exception v1
  :L10
  .line 587
    monitor-exit v0
    return-void
  :L11
  .line 568
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
  .line 598
    if-nez p0, :L0
    monitor-exit v0
    return-void
  :L0
  .line 599
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 600
    sget-object v1, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
    invoke-virtual { v1, p0, v2 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 601
    const/4 v1, 1
    if-nez p1, :L1
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->mayNone:Z
  :L1
  .line 602
    if-eqz p0, :L3
    check-cast p0, Ljava/lang/Integer;
    invoke-virtual { p0 }, Ljava/lang/Integer;->intValue()I
    move-result p0
  :L2
    if-ne p0, p1, :L3
    monitor-exit v0
    return-void
  :L3
  .line 603
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  .line 604
    sget-boolean p0, Lcom/innioasis/ipp/BigCover;->passing:Z
    if-nez p0, :L4
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  :L4
  .line 605
    monitor-exit v0
    return-void
  :L5
  .line 597
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method public static ownArt(Ljava/lang/String;)Z
  .registers 2
  .line 344
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
  .line 219
    const/4 v0, 1
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;Z)Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
.end method

.method private static peek(Ljava/lang/String;Z)Landroid/graphics/Bitmap;
  .catchall { :L3 .. :L4 } :L5
  .registers 8
  .line 240
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 241
    sget-object v1, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v1, p0 }, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  .line 242
    if-eqz v1, :L1
    check-cast v1, Landroid/graphics/Bitmap;
    return-object v1
  :L1
  .line 243
    sget-object v1, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L2
    return-object v0
  :L2
  .line 244
    nop
  :L3
  .line 246
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v1
  .line 247
    if-eqz v1, :L4
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-eqz v2, :L4
  .line 248
    invoke-virtual { v1 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object v1
  .line 249
    new-instance v2, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v2 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 250
    const/4 v3, 1
    iput-boolean v3, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 251
    invoke-static { v1, v2 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 252
    iget v3, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    if-lez v3, :L4
    iget v3, v2, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    if-lez v3, :L4
  .line 253
    iget v3, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    iget v4, v2, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    const/16 v5, 300
    invoke-static { v3, v4, v5, v5 }, Lcom/innioasis/ipp/Art;->sample(IIII)I
    move-result v3
    iput v3, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 254
    const/4 v3, 0
    iput-boolean v3, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 255
    invoke-static { v1, v2 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/BigCover;->square(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object v0
  :L4
  .line 260
    goto :L6
  :L5
  .line 258
    move-exception v1
  .line 259
    nop
  :L6
  .line 261
    if-eqz v0, :L7
    if-eqz p1, :L7
    sget-object p1, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { p1, p0, v0 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L7
  .line 262
    return-object v0
.end method

.method public static peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
  .registers 4
  .line 196
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 197
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 198
    if-eqz v1, :L1
    return-object v1
  :L1
  .line 199
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->note(Ljava/lang/String;)I
    move-result v1
    const/4 v2, 1
    if-eq v1, v2, :L2
    return-object v0
  :L2
  .line 200
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 201
    if-eqz v0, :L3
    sget-object v1, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v1, p0, v0 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L3
  .line 202
    return-object v0
.end method

.method public static peekTrackFree(Ljava/lang/String;)Landroid/graphics/Bitmap;
  .registers 5
  .line 228
    if-nez p0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 229
    const/4 v0, 0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;Z)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 230
    if-nez v1, :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->note(Ljava/lang/String;)I
    move-result v2
    const/4 v3, 1
    if-eq v2, v3, :L1
    goto :L2
  :L1
  .line 231
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;Z)Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
  :L2
  .line 230
    return-object v1
.end method

.method public static prefetch(Ljava/util/List;I)V
  .catchall { :L0 .. :L3 } :L4
  .registers 3
  .line 138
    if-eqz p0, :L6
    if-ltz p1, :L6
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    if-lt p1, v0, :L1
    goto :L6
  :L1
  .line 139
    invoke-interface { p0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p0
  .line 140
    instance-of p1, p0, Lcom/innioasis/y1/database/Song;
    if-nez p1, :L2
    return-void
  :L2
  .line 141
    move-object p1, p0
    check-cast p1, Lcom/innioasis/y1/database/Song;
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Ahead;->picked(Ljava/lang/String;)V
  .line 142
    check-cast p0, Lcom/innioasis/y1/database/Song;
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->warm(Ljava/lang/String;)V
  :L3
  .line 144
    goto :L5
  :L4
  .line 143
    move-exception p0
  :L5
  .line 145
    return-void
  :L6
  .line 138
    return-void
.end method

.method public static prefetchPlaying()V
  .catchall { :L0 .. :L5 } :L6
  .registers 2
  :L0
  .line 155
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 156
    const/4 v1, 0
    if-nez v0, :L1
    move-object v0, v1
    goto :L2
  :L1
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingSong()Lcom/innioasis/y1/database/Song;
    move-result-object v0
  :L2
  .line 157
    if-nez v0, :L3
    goto :L4
  :L3
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
  :L4
    invoke-static { v1 }, Lcom/innioasis/ipp/BigCover;->warm(Ljava/lang/String;)V
  .line 158
    invoke-static { }, Lcom/innioasis/ipp/Queue;->nextPath()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/BigCover;->warm(Ljava/lang/String;)V
  :L5
  .line 160
    goto :L7
  :L6
  .line 159
    move-exception v0
  :L7
  .line 161
    return-void
.end method

.method private static read(Ljava/lang/String;)Lcom/innioasis/ipp/BigCover$Src;
  .registers 4
  .line 685
    const/4 v0, 1
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Meta;->read(Ljava/lang/String;Z)Lcom/innioasis/ipp/Meta$Info;
    move-result-object v0
  .line 686
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
  .line 687
    const/4 v1, 0
    if-eqz p0, :L4
    array-length v2, p0
    if-nez v2, :L2
    goto :L4
  :L2
  .line 688
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->capped([B)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 689
    if-nez v0, :L3
    return-object v1
  :L3
  .line 690
    new-instance v1, Lcom/innioasis/ipp/BigCover$Src;
    invoke-direct { v1 }, Lcom/innioasis/ipp/BigCover$Src;-><init>()V
  .line 691
    iput-object v0, v1, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
  .line 692
    iput-object p0, v1, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
  .line 693
    return-object v1
  :L4
  .line 687
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
  .line 697
    invoke-virtual { p0 }, Ljava/io/File;->length()J
    move-result-wide v0
  .line 698
    const-wide/16 v2, 0
    const/4 v4, 0
    cmp-long v5, v0, v2
    if-lez v5, :L7
    const-wide/32 v2, 8388608
    cmp-long v5, v0, v2
    if-lez v5, :L0
    goto :L7
  :L0
  .line 699
    long-to-int v1, v0
    new-array v0, v1, [B
  .line 700
    new-instance v2, Ljava/io/FileInputStream;
    invoke-direct { v2, p0 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 702
    const/4 p0, 0
  :L1
  .line 703
    if-ge p0, v1, :L6
  .line 704
    sub-int v3, v1, p0
  :L2
    invoke-virtual { v2, v0, p0, v3 }, Ljava/io/FileInputStream;->read([BII)I
    move-result v3
  :L3
  .line 705
    if-gez v3, :L4
  .line 709
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 705
    return-object v4
  :L4
  .line 706
    add-int/2addr p0, v3
  .line 707
    goto :L1
  :L5
  .line 709
    move-exception p0
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 710
    throw p0
  :L6
  .line 709
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 710
    nop
  .line 711
    return-object v0
  :L7
  .line 698
    return-object v4
.end method

.method private static same(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Z
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 747
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
  .line 748
    move-exception p0
  .line 749
    return v0
  :L3
  .line 747
    return v0
.end method

.method private static sig([B)I
  .registers 4
  .line 639
    new-instance v0, Ljava/util/zip/CRC32;
    invoke-direct { v0 }, Ljava/util/zip/CRC32;-><init>()V
  .line 640
    const/4 v1, 0
    array-length v2, p0
    invoke-virtual { v0, p0, v1, v2 }, Ljava/util/zip/CRC32;->update([BII)V
  .line 641
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
  .line 654
    const/4 v1, 0
    if-eqz p0, :L4
    if-nez p1, :L0
    goto :L4
  :L0
  .line 655
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 656
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
  .line 657
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
  .line 653
    move-exception p0
    monitor-exit v0
    throw p0
  :L4
  .line 654
    monitor-exit v0
    return v1
.end method

.method private static declared-synchronized sigSet(Ljava/lang/String;[B)V
  .catchall { :L0 .. :L1 } :L5
  .catchall { :L3 .. :L4 } :L5
  .registers 6
    const-class v0, Lcom/innioasis/ipp/BigCover;
    monitor-enter v0
  .line 645
    if-eqz p0, :L6
    if-nez p1, :L0
    goto :L6
  :L0
  .line 646
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 647
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->sig([B)I
    move-result p1
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
  .line 648
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
  .line 649
    const/4 p0, 1
  :L3
    sput-boolean p0, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  .line 650
    sget-boolean p0, Lcom/innioasis/ipp/BigCover;->passing:Z
    if-nez p0, :L4
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  :L4
  .line 651
    monitor-exit v0
    return-void
  :L5
  .line 644
    move-exception p0
    monitor-exit v0
    throw p0
  :L6
  .line 645
    monitor-exit v0
    return-void
.end method

.method private static square(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .registers 4
  .line 734
    if-nez p0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 735
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v0
  .line 736
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v1
  .line 737
    const/16 v2, 300
    if-ne v0, v1, :L1
    if-gt v0, v2, :L1
    return-object p0
  :L1
  .line 738
    invoke-static { v0, v1 }, Ljava/lang/Math;->min(II)I
    move-result v0
  .line 739
    if-lez v0, :L3
    if-le v0, v2, :L2
    goto :L3
  :L2
    move v2, v0
  :L3
  .line 740
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Cover;->square(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 741
    if-nez v0, :L4
    goto :L5
  :L4
    move-object p0, v0
  :L5
    return-object p0
.end method

.method private static store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;Lcom/innioasis/ipp/BigCover$Walk;)Z
  .catchall { :L0 .. :L5 } :L6
  .registers 11
  .line 756
    const/4 v0, 0
    if-eqz p1, :L7
  :L0
    iget-object v1, p1, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
    if-nez v1, :L1
    goto :L7
  :L1
  .line 757
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/BigCover;->fit(Lcom/innioasis/ipp/BigCover$Src;Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v1
  .line 758
    if-nez v1, :L2
    return v0
  :L2
  .line 759
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v2
  .line 760
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/BigCover;->write(Ljava/lang/String;[B)Z
    move-result v1
  .line 761
    if-eqz p2, :L3
    iget-wide v4, p2, Lcom/innioasis/ipp/BigCover$Walk;->writeNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v6
    sub-long/2addr v6, v2
    add-long/2addr v4, v6
    iput-wide v4, p2, Lcom/innioasis/ipp/BigCover$Walk;->writeNs:J
  :L3
  .line 762
    if-nez v1, :L4
    return v0
  :L4
  .line 763
    sget-object p2, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    iget-object p1, p1, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
    invoke-interface { p2, p0, p1 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L5
  .line 764
    const/4 p0, 1
    return p0
  :L6
  .line 765
    move-exception p0
  .line 766
    return v0
  :L7
  .line 756
    return v0
.end method

.method private static storeSrc(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;[B)I
  .registers 12
  .line 487
    array-length v0, p2
    const/16 v1, 25600
    const/4 v2, 2
    const/4 v3, 0
    const-wide/16 v4, 1
    if-gt v0, v1, :L1
    invoke-static { p2 }, Lcom/innioasis/ipp/BigCover;->isJpeg([B)Z
    move-result v0
    if-eqz v0, :L1
  .line 488
    iget-wide v0, p0, Lcom/innioasis/ipp/BigCover$Walk;->verbatim:J
    add-long/2addr v0, v4
    iput-wide v0, p0, Lcom/innioasis/ipp/BigCover$Walk;->verbatim:J
  .line 489
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v0
  .line 490
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/BigCover;->write(Ljava/lang/String;[B)Z
    move-result p1
  .line 491
    iget-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->writeNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v6
    sub-long/2addr v6, v0
    add-long/2addr v4, v6
    iput-wide v4, p0, Lcom/innioasis/ipp/BigCover$Walk;->writeNs:J
  .line 492
    if-eqz p1, :L0
    const/4 v2, 0
  :L0
    return v2
  :L1
  .line 494
    iget-wide v0, p0, Lcom/innioasis/ipp/BigCover$Walk;->encoded:J
    add-long/2addr v0, v4
    iput-wide v0, p0, Lcom/innioasis/ipp/BigCover$Walk;->encoded:J
  .line 495
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v0
  .line 496
    invoke-static { p2 }, Lcom/innioasis/ipp/BigCover;->capped([B)Landroid/graphics/Bitmap;
    move-result-object v4
  .line 497
    iget-wide v5, p0, Lcom/innioasis/ipp/BigCover$Walk;->srcDecodeNs:J
    invoke-static { }, Ljava/lang/System;->nanoTime()J
    move-result-wide v7
    sub-long/2addr v7, v0
    add-long/2addr v5, v7
    iput-wide v5, p0, Lcom/innioasis/ipp/BigCover$Walk;->srcDecodeNs:J
  .line 498
    if-nez v4, :L2
    const/4 p0, 1
    return p0
  :L2
  .line 499
    new-instance v0, Lcom/innioasis/ipp/BigCover$Src;
    invoke-direct { v0 }, Lcom/innioasis/ipp/BigCover$Src;-><init>()V
  .line 500
    iput-object v4, v0, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
  .line 501
    iput-object p2, v0, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
  .line 502
    invoke-static { p1, v0, p0 }, Lcom/innioasis/ipp/BigCover;->store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;Lcom/innioasis/ipp/BigCover$Walk;)Z
    move-result p2
  .line 503
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v0, p1 }, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 504
    if-nez p2, :L3
    return v2
  :L3
  .line 505
    invoke-static { p0, v4 }, Lcom/innioasis/ipp/BigCover$Walk;->access$302(Lcom/innioasis/ipp/BigCover$Walk;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .line 506
    return v3
.end method

.method public static track(Ljava/lang/String;)Landroid/graphics/Bitmap;
  .catchall { :L3 .. :L6 } :L19
  .catch Ljava/lang/OutOfMemoryError; { :L7 .. :L8 } :L18
  .catchall { :L7 .. :L8 } :L9
  .catchall { :L10 .. :L20 } :L19
  .registers 9
  .line 81
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 82
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 83
    if-eqz v1, :L1
    return-object v1
  :L1
  .line 84
    sget-object v1, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L2
    return-object v0
  :L2
  .line 87
    sget-object v2, Lcom/innioasis/ipp/BigCover;->LOCK:Ljava/lang/Object;
    monitor-enter v2
  :L3
  .line 88
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v3
  .line 89
    if-eqz v3, :L4
    monitor-exit v2
    return-object v3
  :L4
  .line 90
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L5
    monitor-exit v2
    return-object v0
  :L5
  .line 92
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
  .line 93
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->note(Ljava/lang/String;)I
    move-result v4
    if-nez v4, :L7
    invoke-virtual { v1, p0, p0 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    monitor-exit v2
  :L6
    return-object v0
  :L7
  .line 97
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->read(Ljava/lang/String;)Lcom/innioasis/ipp/BigCover$Src;
    move-result-object v1
  :L8
  .line 102
    goto :L10
  :L9
  .line 100
    move-exception v1
  .line 101
    move-object v1, v0
  :L10
  .line 103
    sget-object v4, Lcom/innioasis/ipp/BigCover;->UNREAD:Lcom/innioasis/ipp/BigCover$Src;
    if-ne v1, v4, :L11
    monitor-exit v2
    return-object v0
  :L11
  .line 104
    if-nez v1, :L12
  .line 105
    sget-object v1, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v1, p0, p0 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 106
    const/4 v1, 0
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 107
    monitor-exit v2
    return-object v0
  :L12
  .line 109
    iget-object v4, v1, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
  .line 112
    invoke-static { v3 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v5
  .line 113
    const/4 v6, 1
    if-nez v5, :L14
  .line 114
    sget-object v5, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v5, p0, v4 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 115
    invoke-static { v3, v1, v0 }, Lcom/innioasis/ipp/BigCover;->store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;Lcom/innioasis/ipp/BigCover$Walk;)Z
    move-result v0
    if-nez v0, :L13
    monitor-exit v2
    return-object v4
  :L13
  .line 116
    iget-object v0, v1, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
    invoke-static { v3, v0 }, Lcom/innioasis/ipp/BigCover;->sigSet(Ljava/lang/String;[B)V
  .line 117
    invoke-static { p0, v6 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 118
    monitor-exit v2
    return-object v4
  :L14
  .line 120
    iget-object v7, v1, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
    invoke-static { v3, v7 }, Lcom/innioasis/ipp/BigCover;->sigIs(Ljava/lang/String;[B)Z
    move-result v3
    if-nez v3, :L17
    invoke-static { v5, v4 }, Lcom/innioasis/ipp/BigCover;->same(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Z
    move-result v3
    if-eqz v3, :L15
    goto :L17
  :L15
  .line 125
    sget-object v3, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v3, p0, v4 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 126
    invoke-static { p0, v1, v0 }, Lcom/innioasis/ipp/BigCover;->store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;Lcom/innioasis/ipp/BigCover$Walk;)Z
    move-result v0
    if-eqz v0, :L16
    const/4 v0, 2
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  :L16
  .line 127
    monitor-exit v2
    return-object v4
  :L17
  .line 121
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v0, p0, v5 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 122
    invoke-static { p0, v6 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 123
    monitor-exit v2
    return-object v5
  :L18
  .line 98
    move-exception p0
  .line 99
    monitor-exit v2
    return-object v0
  :L19
  .line 128
    move-exception p0
    monitor-exit v2
  :L20
    throw p0
.end method

.method private static warm(Ljava/lang/String;)V
  .registers 3
  .line 165
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
  .line 166
    sget-object v0, Lcom/innioasis/ipp/BigCover;->worker:Landroid/os/Handler;
    if-nez v0, :L1
  .line 167
    new-instance v0, Landroid/os/HandlerThread;
    const-string v1, "ipp-cover"
    invoke-direct { v0, v1 }, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V
  .line 168
    invoke-virtual { v0 }, Landroid/os/HandlerThread;->start()V
  .line 169
    new-instance v1, Landroid/os/Handler;
    invoke-virtual { v0 }, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;
    move-result-object v0
    invoke-direct { v1, v0 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v1, Lcom/innioasis/ipp/BigCover;->worker:Landroid/os/Handler;
  :L1
  .line 171
    sget-object v0, Lcom/innioasis/ipp/BigCover;->worker:Landroid/os/Handler;
    new-instance v1, Lcom/innioasis/ipp/BigCover$Warm;
    invoke-direct { v1, p0 }, Lcom/innioasis/ipp/BigCover$Warm;-><init>(Ljava/lang/String;)V
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 172
    return-void
  :L2
  .line 165
    return-void
.end method

.method private static write(Ljava/lang/String;[B)Z
  .catchall { :L0 .. :L1 } :L7
  .catchall { :L2 .. :L3 } :L6
  .catchall { :L3 .. :L4 } :L5
  .catchall { :L4 .. :L6 } :L6
  .catchall { :L9 .. :L10 } :L11
  .registers 4
  .line 772
    nop
  .line 774
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object p0
  :L1
  .line 775
    if-nez p0, :L2
    return v0
  :L2
  .line 776
    new-instance v1, Ljava/io/FileOutputStream;
    invoke-direct { v1, p0 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  :L3
  .line 778
    invoke-virtual { v1, p1 }, Ljava/io/FileOutputStream;->write([B)V
  :L4
  .line 780
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
  .line 781
    nop
  .line 782
    const/4 p0, 1
    return p0
  :L5
  .line 780
    move-exception p1
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
  .line 781
    throw p1
  :L6
  .line 783
    move-exception p1
    goto :L8
  :L7
    move-exception p0
    const/4 p0, 0
  :L8
  .line 784
    if-eqz p0, :L12
  :L9
    invoke-virtual { p0 }, Ljava/io/File;->delete()Z
  :L10
    goto :L12
  :L11
    move-exception p0
  :L12
  .line 785
    return v0
.end method
