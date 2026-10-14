.class public final Lcom/innioasis/ipp/Flow$Loader;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Flow.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Flow;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 25
  name = "Loader"
.end annotation

.field public final static AHEAD:I = 7

.field public final static KEEP:I = 16

.field private final static POOL:I = 8

.field private static volatile reserve:[B

.field private static roomMade:Z

.field private blank:Landroid/graphics/Bitmap;

.field private final born:Ljava/util/Hashtable;

.field private decoded:Landroid/graphics/Bitmap;

.field private file:[B

.field private final filter:Landroid/graphics/Paint;

.field private final from:Landroid/graphics/Rect;

.field private volatile held:Z

.field private final items:Ljava/util/List;

.field private final onSlide:Ljava/lang/Runnable;

.field private final opts:Landroid/graphics/BitmapFactory$Options;

.field private final out:[I

.field private final pool:Ljava/util/ArrayList;

.field private final px:[I

.field private readArtist:Z

.field private final scratch:[B

.field public final slides:Ljava/util/Hashtable;

.field private final small:Landroid/graphics/Bitmap;

.field private final smallCanvas:Landroid/graphics/Canvas;

.field private volatile stop:Z

.field private volatile target:I

.field private final to:Landroid/graphics/Rect;

.field private final ui:Landroid/os/Handler;

.field private final wake:Ljava/lang/Object;

.method public constructor <init>(Ljava/util/List;Landroid/os/Handler;Ljava/lang/Runnable;)V
  .registers 7
  .line 336
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 315
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->slides:Ljava/util/Hashtable;
  .line 317
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->born:Ljava/util/Hashtable;
  .line 322
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
  .line 324
    const/16 v0, 32400
    new-array v0, v0, [I
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->px:[I
  .line 325
    const v0, 50048
    new-array v0, v0, [I
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->out:[I
  .line 328
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
  .line 330
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    const/16 v1, 180
    invoke-static { v1, v1, v0 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->small:Landroid/graphics/Bitmap;
  .line 331
    new-instance v2, Landroid/graphics/Canvas;
    invoke-direct { v2, v0 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
    iput-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->smallCanvas:Landroid/graphics/Canvas;
  .line 332
    new-instance v0, Landroid/graphics/Paint;
    const/4 v2, 2
    invoke-direct { v0, v2 }, Landroid/graphics/Paint;-><init>(I)V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->filter:Landroid/graphics/Paint;
  .line 333
    new-instance v0, Landroid/graphics/Rect;
    invoke-direct { v0 }, Landroid/graphics/Rect;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->from:Landroid/graphics/Rect;
  .line 334
    new-instance v0, Landroid/graphics/Rect;
    const/4 v2, 0
    invoke-direct { v0, v2, v2, v1, v1 }, Landroid/graphics/Rect;-><init>(IIII)V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->to:Landroid/graphics/Rect;
  .line 494
    const/high16 v0, 0x00010000
    new-array v0, v0, [B
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->file:[B
  .line 495
    const/16 v0, 16384
    new-array v0, v0, [B
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->scratch:[B
  .line 496
    new-instance v0, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v0 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->opts:Landroid/graphics/BitmapFactory$Options;
  .line 337
    iput-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->items:Ljava/util/List;
  .line 338
    iput-object p2, p0, Lcom/innioasis/ipp/Flow$Loader;->ui:Landroid/os/Handler;
  .line 339
    iput-object p3, p0, Lcom/innioasis/ipp/Flow$Loader;->onSlide:Ljava/lang/Runnable;
  .line 340
    return-void
.end method

.method private cover(Lcom/innioasis/ipp/Flow$Item;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L6 } :L7
  .registers 9
  .line 471
    const/4 v0, 0
  :L0
    iget-object p1, p1, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p1
  .line 472
    nop
  .line 473
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->cachedFile(Ljava/lang/String;)Ljava/io/File;
    move-result-object v1
  .line 474
    if-eqz v1, :L1
    invoke-direct { p0, v1 }, Lcom/innioasis/ipp/Flow$Loader;->decode(Ljava/io/File;)Landroid/graphics/Bitmap;
    move-result-object v1
    goto :L2
  :L1
    move-object v1, v0
  :L2
  .line 475
    if-nez v1, :L3
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->track(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v1
  :L3
  .line 476
    if-nez v1, :L4
    return-object v0
  :L4
  .line 477
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result p1
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v2
  .line 478
    invoke-static { p1, v2 }, Ljava/lang/Math;->min(II)I
    move-result v3
  .line 479
    const/16 v4, 360
    if-le v3, v4, :L5
  .line 481
    const/16 p1, 180
    invoke-static { v1, p1 }, Lcom/innioasis/ipp/Cover;->square(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    move-result-object p1
  .line 482
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->smallCanvas:Landroid/graphics/Canvas;
    const/4 v2, 0
    invoke-virtual { v1, p1, v2, v2, v0 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
  .line 483
    iget-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->small:Landroid/graphics/Bitmap;
    return-object p1
  :L5
  .line 485
    iget-object v4, p0, Lcom/innioasis/ipp/Flow$Loader;->from:Landroid/graphics/Rect;
    sub-int/2addr p1, v3
    div-int/lit8 v5, p1, 2
    sub-int/2addr v2, v3
    div-int/lit8 v6, v2, 2
    div-int/lit8 p1, p1, 2
    add-int/2addr p1, v3
    div-int/lit8 v2, v2, 2
    add-int/2addr v2, v3
    invoke-virtual { v4, v5, v6, p1, v2 }, Landroid/graphics/Rect;->set(IIII)V
  .line 486
    iget-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->smallCanvas:Landroid/graphics/Canvas;
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->from:Landroid/graphics/Rect;
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->to:Landroid/graphics/Rect;
    iget-object v4, p0, Lcom/innioasis/ipp/Flow$Loader;->filter:Landroid/graphics/Paint;
    invoke-virtual { p1, v1, v2, v3, v4 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 487
    iget-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->small:Landroid/graphics/Bitmap;
  :L6
    return-object p1
  :L7
  .line 488
    move-exception p1
  .line 489
    return-object v0
.end method

.method private decode(Ljava/io/File;)Landroid/graphics/Bitmap;
  .catch Ljava/lang/IllegalArgumentException; { :L2 .. :L3 } :L4
  .registers 9
  .line 521
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Flow$Loader;->read(Ljava/io/File;)I
    move-result p1
  .line 522
    const/4 v0, 0
    if-gtz p1, :L0
    return-object v0
  :L0
  .line 523
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->opts:Landroid/graphics/BitmapFactory$Options;
  .line 524
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->scratch:[B
    iput-object v2, v1, Landroid/graphics/BitmapFactory$Options;->inTempStorage:[B
  .line 525
    iput-object v0, v1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
  .line 526
    const/4 v2, 1
    iput v2, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 527
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 528
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->file:[B
    const/4 v4, 0
    invoke-static { v3, v4, p1, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 529
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    if-lez v3, :L7
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    if-gtz v3, :L1
    goto :L7
  :L1
  .line 530
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    iget v5, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    const/16 v6, 180
    invoke-static { v3, v5, v6, v6 }, Lcom/innioasis/ipp/Art;->sample(IIII)I
    move-result v3
    iput v3, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 531
    iput-boolean v4, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 532
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inMutable:Z
  .line 534
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
    if-ne v3, v2, :L2
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->decoded:Landroid/graphics/Bitmap;
    if-eqz v3, :L2
  .line 535
    invoke-virtual { v3 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v3
    iget v5, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    if-ne v3, v5, :L2
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->decoded:Landroid/graphics/Bitmap;
    invoke-virtual { v3 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v3
    iget v5, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    if-ne v3, v5, :L2
  .line 536
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->decoded:Landroid/graphics/Bitmap;
    iput-object v3, v1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
  :L2
  .line 540
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->file:[B
    invoke-static { v3, v4, p1, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object p1
  :L3
  .line 544
    goto :L5
  :L4
  .line 541
    move-exception v3
  .line 542
    iput-object v0, v1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;
  .line 543
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->file:[B
    invoke-static { v0, v4, p1, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object p1
  :L5
  .line 545
    if-eqz p1, :L6
    iget v0, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
    if-ne v0, v2, :L6
    iput-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->decoded:Landroid/graphics/Bitmap;
  :L6
  .line 546
    return-object p1
  :L7
  .line 529
    return-object v0
.end method

.method private evict(I)V
  .registers 7
  .line 452
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->slides:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->keySet()Ljava/util/Set;
    move-result-object v0
    invoke-interface { v0 }, Ljava/util/Set;->toArray()[Ljava/lang/Object;
    move-result-object v0
  .line 453
    const/4 v1, 0
  :L0
    array-length v2, v0
    if-ge v1, v2, :L2
  .line 454
    aget-object v2, v0, v1
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result v2
  .line 455
    sub-int/2addr v2, p1
    invoke-static { v2 }, Ljava/lang/Math;->abs(I)I
    move-result v2
    const/16 v3, 16
    if-le v2, v3, :L1
  .line 456
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->slides:Ljava/util/Hashtable;
    aget-object v3, v0, v1
    invoke-virtual { v2, v3 }, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
  .line 457
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->born:Ljava/util/Hashtable;
    aget-object v4, v0, v1
    invoke-virtual { v3, v4 }, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 458
    if-eqz v2, :L1
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->blank:Landroid/graphics/Bitmap;
    if-eq v2, v3, :L1
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
    invoke-virtual { v3 }, Ljava/util/ArrayList;->size()I
    move-result v3
    const/16 v4, 8
    if-ge v3, v4, :L1
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
    invoke-virtual { v3, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L1
  .line 453
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 461
    return-void
.end method

.method private has(I)Z
  .registers 3
  .line 448
    if-ltz p1, :L0
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->items:Ljava/util/List;
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    if-ge p1, v0, :L0
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->slides:Ljava/util/Hashtable;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
    invoke-virtual { v0, p1 }, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z
    move-result p1
    if-nez p1, :L0
    const/4 p1, 1
    goto :L1
  :L0
    const/4 p1, 0
  :L1
    return p1
.end method

.method private loop()V
  .catchall { :L1 .. :L2 } :L8
  .catch Ljava/lang/InterruptedException; { :L3 .. :L4 } :L5
  .catchall { :L3 .. :L4 } :L8
  .catchall { :L6 .. :L9 } :L8
  .catchall { :L15 .. :L16 } :L22
  .catch Ljava/lang/InterruptedException; { :L17 .. :L18 } :L19
  .catchall { :L17 .. :L18 } :L22
  .catchall { :L20 .. :L23 } :L22
  .registers 8
  .line 403
    nop
  :L0
    iget-boolean v0, p0, Lcom/innioasis/ipp/Flow$Loader;->stop:Z
    if-nez v0, :L31
  .line 404
    iget-boolean v0, p0, Lcom/innioasis/ipp/Flow$Loader;->held:Z
    if-eqz v0, :L10
  .line 405
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    monitor-enter v0
  :L1
  .line 406
    iget-boolean v1, p0, Lcom/innioasis/ipp/Flow$Loader;->held:Z
    if-eqz v1, :L7
    iget-boolean v1, p0, Lcom/innioasis/ipp/Flow$Loader;->stop:Z
  :L2
    if-nez v1, :L7
  :L3
  .line 407
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    invoke-virtual { v1 }, Ljava/lang/Object;->wait()V
  :L4
    goto :L1
  :L5
    move-exception v1
  :L6
    monitor-exit v0
    return-void
  :L7
  .line 409
    monitor-exit v0
  .line 410
    goto :L0
  :L8
  .line 409
    move-exception v1
    monitor-exit v0
  :L9
    throw v1
  :L10
  .line 412
    iget v0, p0, Lcom/innioasis/ipp/Flow$Loader;->target:I
  .line 414
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/Flow$Loader;->evict(I)V
  .line 415
    nop
  .line 416
    const/4 v1, -1
    const/4 v2, 0
  :L11
    const/4 v3, 7
    if-gt v2, v3, :L14
    if-gez v1, :L14
  .line 417
    add-int v3, v0, v2
    invoke-direct { p0, v3 }, Lcom/innioasis/ipp/Flow$Loader;->has(I)Z
    move-result v4
    if-eqz v4, :L12
    move v1, v3
    goto :L13
  :L12
  .line 418
    sub-int v3, v0, v2
    invoke-direct { p0, v3 }, Lcom/innioasis/ipp/Flow$Loader;->has(I)Z
    move-result v4
    if-eqz v4, :L13
    move v1, v3
  :L13
  .line 416
    add-int/lit8 v2, v2, 1
    goto :L11
  :L14
  .line 420
    if-gez v1, :L24
  .line 421
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    monitor-enter v2
  :L15
  .line 422
    iget v1, p0, Lcom/innioasis/ipp/Flow$Loader;->target:I
    if-ne v1, v0, :L21
    iget-boolean v0, p0, Lcom/innioasis/ipp/Flow$Loader;->stop:Z
  :L16
    if-nez v0, :L21
  :L17
  .line 423
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    invoke-virtual { v0 }, Ljava/lang/Object;->wait()V
  :L18
    goto :L21
  :L19
    move-exception v0
  :L20
    monitor-exit v2
    return-void
  :L21
  .line 425
    monitor-exit v2
  .line 426
    goto :L0
  :L22
  .line 425
    move-exception v0
    monitor-exit v2
  :L23
    throw v0
  :L24
  .line 428
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->items:Ljava/util/List;
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/ipp/Flow$Item;
  .line 429
    iget-object v2, v0, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    invoke-static { v2 }, Lcom/innioasis/ipp/AlbumArtist;->needsRead(Ljava/lang/String;)Z
    move-result v2
    const/4 v3, 1
    if-eqz v2, :L25
  .line 430
    iget-object v2, v0, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    iget-object v4, v0, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
    iget-object v5, v0, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    iget-object v6, v0, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v6
    invoke-static { v5, v6 }, Lcom/innioasis/ipp/AlbumArtist;->read(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
    invoke-static { v2, v4, v5 }, Lcom/innioasis/ipp/Flow;->artistOf(Ljava/lang/String;Lcom/innioasis/y1/database/Song;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    iput-object v2, v0, Lcom/innioasis/ipp/Flow$Item;->artist:Ljava/lang/String;
  .line 431
    iput-boolean v3, p0, Lcom/innioasis/ipp/Flow$Loader;->readArtist:Z
  :L25
  .line 433
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/Flow$Loader;->cover(Lcom/innioasis/ipp/Flow$Item;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 435
    const/4 v2, 0
    if-nez v0, :L27
  .line 436
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->blank:Landroid/graphics/Bitmap;
    if-nez v0, :L26
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->px:[I
    iget-object v3, p0, Lcom/innioasis/ipp/Flow$Loader;->out:[I
    invoke-static { v2, v0, v3, v2 }, Lcom/innioasis/ipp/Flow;->slide(Landroid/graphics/Bitmap;[I[ILandroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->blank:Landroid/graphics/Bitmap;
  :L26
  .line 437
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->blank:Landroid/graphics/Bitmap;
    goto :L30
  :L27
  .line 439
    iget-object v4, p0, Lcom/innioasis/ipp/Flow$Loader;->px:[I
    iget-object v5, p0, Lcom/innioasis/ipp/Flow$Loader;->out:[I
    iget-object v6, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
    invoke-virtual { v6 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v6
    if-eqz v6, :L28
    goto :L29
  :L28
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->pool:Ljava/util/ArrayList;
    invoke-virtual { v2 }, Ljava/util/ArrayList;->size()I
    move-result v6
    sub-int/2addr v6, v3
    invoke-virtual { v2, v6 }, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Landroid/graphics/Bitmap;
  :L29
    invoke-static { v0, v4, v5, v2 }, Lcom/innioasis/ipp/Flow;->slide(Landroid/graphics/Bitmap;[I[ILandroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object v0
  :L30
  .line 441
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->born:Ljava/util/Hashtable;
    invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v3
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
    invoke-static { v4, v5 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v4
    invoke-virtual { v2, v3, v4 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 442
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->slides:Ljava/util/Hashtable;
    invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v1
    invoke-virtual { v2, v1, v0 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 443
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->onSlide:Ljava/lang/Runnable;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 444
    goto/16 :L0
  :L31
  .line 445
    return-void
.end method

.method private read(Ljava/io/File;)I
  .catchall { :L0 .. :L3 } :L15
  .catchall { :L5 .. :L6 } :L8
  .catchall { :L10 .. :L11 } :L12
  .catchall { :L17 .. :L18 } :L19
  .registers 9
  .line 500
    nop
  .line 502
    const/4 v0, 0
    const/4 v1, 0
  :L0
    invoke-virtual { p1 }, Ljava/io/File;->length()J
    move-result-wide v2
  .line 503
    const-wide/16 v4, 0
    cmp-long v6, v2, v4
    if-lez v6, :L14
    const-wide/32 v4, 8388608
    cmp-long v6, v2, v4
    if-lez v6, :L1
    goto :L14
  :L1
  .line 504
    iget-object v4, p0, Lcom/innioasis/ipp/Flow$Loader;->file:[B
    array-length v4, v4
    int-to-long v4, v4
    cmp-long v6, v4, v2
    if-gez v6, :L2
    long-to-int v4, v2
    add-int/lit16 v4, v4, 16384
    new-array v4, v4, [B
    iput-object v4, p0, Lcom/innioasis/ipp/Flow$Loader;->file:[B
  :L2
  .line 505
    new-instance v4, Ljava/io/FileInputStream;
    invoke-direct { v4, p1 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  :L3
  .line 506
    const/4 p1, 0
  :L4
  .line 507
    int-to-long v5, p1
    cmp-long v1, v5, v2
    if-gez v1, :L9
  :L5
  .line 508
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->file:[B
    long-to-int v5, v2
    sub-int/2addr v5, p1
    invoke-virtual { v4, v1, p1, v5 }, Ljava/io/FileInputStream;->read([BII)I
    move-result v1
  :L6
  .line 509
    if-gez v1, :L7
    goto :L9
  :L7
  .line 510
    add-int/2addr p1, v1
  .line 511
    goto :L4
  :L8
  .line 513
    move-exception p1
    move-object v1, v4
    goto :L16
  :L9
  .line 512
    nop
  :L10
  .line 516
    invoke-virtual { v4 }, Ljava/io/FileInputStream;->close()V
  :L11
    goto :L13
  :L12
    move-exception v0
  :L13
  .line 512
    return p1
  :L14
  .line 516
    nop
  .line 503
    return v0
  :L15
  .line 513
    move-exception p1
  :L16
  .line 514
    nop
  .line 516
    if-eqz v1, :L20
  :L17
    invoke-virtual { v1 }, Ljava/io/FileInputStream;->close()V
  :L18
    goto :L20
  :L19
    move-exception p1
  :L20
  .line 514
    return v0
.end method

.method private static room()V
  .catchall { :L1 .. :L2 } :L3
  .registers 1
  .line 393
    sget-boolean v0, Lcom/innioasis/ipp/Flow$Loader;->roomMade:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 394
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Flow$Loader;->roomMade:Z
  .line 396
    const/high16 v0, 0x00800000
  :L1
    new-array v0, v0, [B
    sput-object v0, Lcom/innioasis/ipp/Flow$Loader;->reserve:[B
  :L2
  .line 398
    goto :L4
  :L3
  .line 397
    move-exception v0
  :L4
  .line 399
    const/4 v0, 0
    sput-object v0, Lcom/innioasis/ipp/Flow$Loader;->reserve:[B
  .line 400
    return-void
.end method

.method public age(I)J
  .registers 6
  .line 370
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->born:Ljava/util/Hashtable;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
    invoke-virtual { v0, p1 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p1
  .line 371
    if-nez p1, :L0
    const-wide v0, 9223372036854775807L
    goto :L1
  :L0
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    check-cast p1, Ljava/lang/Long;
    invoke-virtual { p1 }, Ljava/lang/Long;->longValue()J
    move-result-wide v2
    sub-long/2addr v0, v2
  :L1
    return-wide v0
.end method

.method public aim(I)V
  .catchall { :L0 .. :L2 } :L1
  .registers 3
  .line 343
    iput p1, p0, Lcom/innioasis/ipp/Flow$Loader;->target:I
  .line 344
    iget-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    monitor-enter p1
  :L0
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    invoke-virtual { v0 }, Ljava/lang/Object;->notifyAll()V
    monitor-exit p1
  .line 345
    return-void
  :L1
  .line 344
    move-exception v0
    monitor-exit p1
  :L2
    throw v0
.end method

.method public get(I)Landroid/graphics/Bitmap;
  .registers 3
  .line 364
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->slides:Ljava/util/Hashtable;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
    invoke-virtual { v0, p1 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p1
  .line 365
    if-nez p1, :L0
    const/4 p1, 0
    goto :L1
  :L0
    check-cast p1, Landroid/graphics/Bitmap;
  :L1
    return-object p1
.end method

.method public hold(Z)V
  .catchall { :L0 .. :L2 } :L1
  .registers 3
  .line 359
    iput-boolean p1, p0, Lcom/innioasis/ipp/Flow$Loader;->held:Z
  .line 360
    if-nez p1, :L3
    iget-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    monitor-enter p1
  :L0
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    invoke-virtual { v0 }, Ljava/lang/Object;->notifyAll()V
    monitor-exit p1
    goto :L3
  :L1
    move-exception v0
    monitor-exit p1
  :L2
    throw v0
  :L3
  .line 361
    return-void
.end method

.method public quit()V
  .catchall { :L0 .. :L2 } :L1
  .registers 3
  .line 348
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/Flow$Loader;->stop:Z
  .line 349
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    monitor-enter v0
  :L0
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    invoke-virtual { v1 }, Ljava/lang/Object;->notifyAll()V
    monitor-exit v0
  .line 350
    return-void
  :L1
  .line 349
    move-exception v1
    monitor-exit v0
  :L2
    throw v1
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L3
  .registers 3
  .line 375
    const/16 v0, 10
    invoke-static { v0 }, Landroid/os/Process;->setThreadPriority(I)V
  :L0
  .line 377
    invoke-static { }, Lcom/innioasis/ipp/Flow$Loader;->room()V
  .line 378
    invoke-direct { p0 }, Lcom/innioasis/ipp/Flow$Loader;->loop()V
  :L1
  .line 380
    iget-boolean v0, p0, Lcom/innioasis/ipp/Flow$Loader;->readArtist:Z
    if-eqz v0, :L2
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->flush()V
  :L2
  .line 382
    return-void
  :L3
  .line 380
    move-exception v0
    iget-boolean v1, p0, Lcom/innioasis/ipp/Flow$Loader;->readArtist:Z
    if-eqz v1, :L4
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->flush()V
  :L4
  .line 381
    throw v0
.end method
