.class public final Lcom/innioasis/ipp/BigCover;
.super Ljava/lang/Object;
.source "BigCover.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/BigCover$Src;,
    Lcom/innioasis/ipp/BigCover$Warm;,
    Lcom/innioasis/ipp/BigCover$Walk;,
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

.field private final static STORED:I = 0

.field private final static STORE_FAILED:I = 2

.field private final static STORE_NO_PICTURE:I = 1

.field private final static SUFFIX:Ljava/lang/String; = "-300q.jpg"

.field private final static UNKNOWN:I = -1

.field private final static UNREAD:Lcom/innioasis/ipp/BigCover$Src;

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
  .line 458
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
  .line 601
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
  .line 441
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/BigCover;->passing:Z
  .line 442
    return-void
.end method

.method public static cache(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;[B)Z
  .catchall { :L1 .. :L19 } :L20
  .registers 8
  .line 351
    const/4 v0, 1
    if-eqz p1, :L21
    if-nez p0, :L0
    goto/16 :L21
  :L0
  .line 353
    const/4 v1, 0
  :L1
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->needs(Ljava/lang/String;)Z
    move-result v2
    if-nez v2, :L2
    return v0
  :L2
  .line 354
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 355
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$100(Lcom/innioasis/ipp/BigCover$Walk;)Ljava/lang/String;
    move-result-object v3
    if-eqz v3, :L3
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$100(Lcom/innioasis/ipp/BigCover$Walk;)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v3, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
    if-nez v3, :L3
    invoke-virtual { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->done()V
  :L3
  .line 356
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/BigCover$Walk;->access$102(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;)Ljava/lang/String;
  .line 358
    if-eqz p2, :L4
    array-length v3, p2
    if-lez v3, :L4
    goto :L5
  :L4
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->external(Ljava/lang/String;)[B
    move-result-object p2
  :L5
  .line 359
    if-eqz p2, :L18
    array-length v3, p2
    if-nez v3, :L6
    goto/16 :L18
  :L6
  .line 362
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v3
    if-eqz v3, :L7
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v3
    invoke-static { v3, p2 }, Ljava/util/Arrays;->equals([B[B)Z
    move-result v3
    if-eqz v3, :L7
  .line 363
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 364
    return v0
  :L7
  .line 367
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v3
    const/4 v4, 2
    if-nez v3, :L12
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$300(Lcom/innioasis/ipp/BigCover$Walk;)Landroid/graphics/Bitmap;
    move-result-object v3
    if-nez v3, :L12
  .line 368
    invoke-static { v2 }, Lcom/innioasis/ipp/BigCover;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v3
  .line 369
    if-eqz v3, :L8
    invoke-virtual { v3 }, Ljava/io/File;->exists()Z
    move-result v3
    if-eqz v3, :L8
    invoke-static { v2, p2 }, Lcom/innioasis/ipp/BigCover;->sigIs(Ljava/lang/String;[B)Z
    move-result v3
    if-eqz v3, :L8
  .line 370
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/BigCover$Walk;->access$202(Lcom/innioasis/ipp/BigCover$Walk;[B)[B
  .line 371
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 372
    return v0
  :L8
  .line 374
    invoke-static { v2 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v3
  .line 375
    if-nez v3, :L11
  .line 376
    invoke-static { p0, v2, p2 }, Lcom/innioasis/ipp/BigCover;->storeSrc(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;[B)I
    move-result v3
  .line 377
    if-ne v3, v4, :L9
    return v1
  :L9
  .line 378
    if-ne v3, v0, :L10
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
    return v0
  :L10
  .line 379
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/BigCover$Walk;->access$202(Lcom/innioasis/ipp/BigCover$Walk;[B)[B
  .line 380
    invoke-static { v2, p2 }, Lcom/innioasis/ipp/BigCover;->sigSet(Ljava/lang/String;[B)V
  .line 381
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 382
    return v0
  :L11
  .line 384
    invoke-static { p0, v3 }, Lcom/innioasis/ipp/BigCover$Walk;->access$302(Lcom/innioasis/ipp/BigCover$Walk;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  :L12
  .line 387
    invoke-static { p2 }, Lcom/innioasis/ipp/BigCover;->capped([B)Landroid/graphics/Bitmap;
    move-result-object v2
  .line 388
    if-nez v2, :L13
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
    return v0
  :L13
  .line 389
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$300(Lcom/innioasis/ipp/BigCover$Walk;)Landroid/graphics/Bitmap;
    move-result-object v3
    if-nez v3, :L14
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v3
    invoke-static { v3 }, Lcom/innioasis/ipp/BigCover;->capped([B)Landroid/graphics/Bitmap;
    move-result-object v3
    invoke-static { p0, v3 }, Lcom/innioasis/ipp/BigCover$Walk;->access$302(Lcom/innioasis/ipp/BigCover$Walk;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  :L14
  .line 390
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$300(Lcom/innioasis/ipp/BigCover$Walk;)Landroid/graphics/Bitmap;
    move-result-object v3
    invoke-static { v3, v2 }, Lcom/innioasis/ipp/BigCover;->same(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Z
    move-result v3
    if-eqz v3, :L16
  .line 392
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v2
    if-nez v2, :L15
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/BigCover$Walk;->access$202(Lcom/innioasis/ipp/BigCover$Walk;[B)[B
  :L15
  .line 393
    invoke-static { p1, v0 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 394
    return v0
  :L16
  .line 396
    new-instance p0, Lcom/innioasis/ipp/BigCover$Src;
    invoke-direct { p0 }, Lcom/innioasis/ipp/BigCover$Src;-><init>()V
  .line 397
    iput-object v2, p0, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
  .line 398
    iput-object p2, p0, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
  .line 399
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/BigCover;->store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;)Z
    move-result p0
  .line 400
    sget-object p2, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { p2, p1 }, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 401
    if-nez p0, :L17
    return v1
  :L17
  .line 402
    invoke-static { p1, v4 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 403
    return v0
  :L18
  .line 359
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  :L19
    return v0
  :L20
  .line 404
    move-exception p0
  .line 405
    return v1
  :L21
  .line 351
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
  .line 640
    const/4 v0, 0
  :L0
    new-instance v1, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v1 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 641
    const/4 v2, 1
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 642
    array-length v2, p0
    const/4 v3, 0
    invoke-static { p0, v3, v2, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 643
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    if-lez v2, :L3
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    if-gtz v2, :L1
    goto :L3
  :L1
  .line 644
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    iget v4, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    const/16 v5, 300
    invoke-static { v2, v4, v5, v5 }, Lcom/innioasis/ipp/Art;->sample(IIII)I
    move-result v2
    iput v2, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 645
    iput-boolean v3, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 646
    array-length v2, p0
    invoke-static { p0, v3, v2, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object p0
  .line 647
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->square(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object p0
  :L2
    return-object p0
  :L3
  .line 643
    return-object v0
  :L4
  .line 650
    move-exception p0
  .line 651
    return-object v0
  :L5
  .line 648
    move-exception p0
  .line 649
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
  .line 755
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 756
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 757
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 758
    if-nez v0, :L1
    return-object v1
  :L1
  .line 759
    new-instance v1, Ljava/io/File;
    const-string v2, "ipp_big"
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 760
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v0
    if-nez v0, :L2
    invoke-virtual { v1 }, Ljava/io/File;->mkdirs()Z
  :L2
  .line 761
    sget-boolean v0, Lcom/innioasis/ipp/BigCover;->swept:Z
    if-nez v0, :L8
  .line 762
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/BigCover;->swept:Z
  :L3
  .line 764
    invoke-virtual { v1 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v0
  .line 765
    if-eqz v0, :L6
  .line 766
    const/4 v2, 0
  :L4
    array-length v3, v0
    if-ge v2, v3, :L6
  .line 767
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
  .line 766
    add-int/lit8 v2, v2, 1
    goto :L4
  :L6
  .line 771
    goto :L8
  :L7
  .line 770
    move-exception v0
  :L8
  .line 773
    return-object v1
.end method

.method private static encode(Landroid/graphics/Bitmap;I)[B
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  :L0
  .line 735
    new-instance v0, Ljava/io/ByteArrayOutputStream;
    const/16 v1, 25600
    invoke-direct { v0, v1 }, Ljava/io/ByteArrayOutputStream;-><init>(I)V
  .line 736
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;
    invoke-virtual { p0, v1, p1, v0 }, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
  .line 737
    invoke-virtual { v0 }, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    move-result-object p0
  :L1
    return-object p0
  :L2
  .line 738
    move-exception p0
  .line 739
    const/4 p0, 0
    return-object p0
.end method

.method public static endCache()V
  .registers 1
  .line 445
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/BigCover;->passing:Z
  .line 446
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  .line 447
    return-void
.end method

.method private static external(Ljava/lang/String;)[B
  .catchall { :L0 .. :L2 } :L3
  .registers 3
  .line 412
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v1
  .line 413
    if-nez v1, :L1
    return-object v0
  :L1
  .line 414
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->stampRead(Ljava/lang/String;)V
  .line 415
    invoke-static { v1 }, Lcom/innioasis/ipp/BigCover;->readAll(Ljava/io/File;)[B
    move-result-object p0
  :L2
    return-object p0
  :L3
  .line 416
    move-exception p0
  .line 417
    return-object v0
.end method

.method private static file(Ljava/lang/String;)Ljava/io/File;
  .registers 5
  .line 749
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->dir()Ljava/io/File;
    move-result-object v0
  .line 750
    if-nez v0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 751
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

.method private static fit(Lcom/innioasis/ipp/BigCover$Src;)[B
  .registers 9
  .line 714
    iget-object v0, p0, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
    const/16 v1, 25600
    if-eqz v0, :L0
    iget-object v0, p0, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
    array-length v0, v0
    if-gt v0, v1, :L0
    iget-object v0, p0, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
    invoke-static { v0 }, Lcom/innioasis/ipp/BigCover;->isJpeg([B)Z
    move-result v0
    if-eqz v0, :L0
    iget-object p0, p0, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
    return-object p0
  :L0
  .line 716
    nop
  .line 717
    nop
  .line 718
    const/16 v0, 76
    const/4 v2, 0
    const/16 v3, 92
    const/16 v4, 76
  :L1
  .line 719
    if-gt v4, v3, :L5
  .line 720
    add-int v5, v4, v3
    add-int/lit8 v5, v5, 1
    shr-int/lit8 v5, v5, 1
  .line 721
    iget-object v6, p0, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
    invoke-static { v6, v5 }, Lcom/innioasis/ipp/BigCover;->encode(Landroid/graphics/Bitmap;I)[B
    move-result-object v6
  .line 722
    if-nez v6, :L2
    goto :L5
  :L2
  .line 723
    array-length v7, v6
    if-gt v7, v1, :L3
  .line 724
    nop
  .line 725
    add-int/lit8 v4, v5, 1
    move-object v2, v6
    goto :L4
  :L3
  .line 727
    add-int/lit8 v5, v5, -1
    move v3, v5
  :L4
  .line 729
    goto :L1
  :L5
  .line 730
    if-eqz v2, :L6
    goto :L7
  :L6
    iget-object p0, p0, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/BigCover;->encode(Landroid/graphics/Bitmap;I)[B
    move-result-object v2
  :L7
    return-object v2
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
  .line 745
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
  .line 340
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
  .line 324
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->note(Ljava/lang/String;)I
    move-result v0
  .line 325
    const/4 v1, -1
    const/4 v2, 1
    if-ne v0, v1, :L0
    return v2
  :L0
  .line 326
    const/4 v1, 0
    if-nez v0, :L1
    return v1
  :L1
  .line 327
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
  .line 517
    const/4 v1, -1
    if-nez p0, :L0
    monitor-exit v0
    return v1
  :L0
  .line 518
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 519
    sget-object v2, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v2, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 520
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
  .line 516
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
  .line 585
    sget-object v1, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v1 }, Ljava/util/HashMap;->clear()V
  .line 586
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesLoaded:Z
  .line 587
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  :L1
  .line 589
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteFile()Ljava/io/File;
    move-result-object v1
  .line 590
    if-eqz v1, :L2
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-eqz v2, :L2
    invoke-virtual { v1 }, Ljava/io/File;->delete()Z
  :L2
  .line 592
    goto :L4
  :L3
  .line 591
    move-exception v1
  :L4
  .line 593
    monitor-exit v0
    return-void
  :L5
  .line 584
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method private static noteFile()Ljava/io/File;
  .registers 3
  .line 464
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 465
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 466
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 468
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
  .line 534
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 535
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
  .line 536
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
  .line 537
    if-eqz v2, :L4
    sput-boolean v3, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  :L4
  .line 538
    monitor-exit v0
    return-void
  :L5
  .line 533
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method private static declared-synchronized noteForgetNone()V
  .catchall { :L0 .. :L5 } :L10
  .catchall { :L7 .. :L9 } :L10
  .registers 6
    const-class v0, Lcom/innioasis/ipp/BigCover;
    monitor-enter v0
  :L0
  .line 542
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 543
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 544
    sget-object v2, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v2 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v2
    invoke-interface { v2 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v2
  :L1
  .line 545
    invoke-interface { v2 }, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :L4
  .line 546
    invoke-interface { v2 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/util/Map$Entry;
  .line 547
    invoke-interface { v3 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
    const-string v5, "\u0001"
    invoke-virtual { v4, v5 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :L2
    goto :L1
  :L2
  .line 548
    invoke-interface { v3 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/Integer;
    invoke-virtual { v4 }, Ljava/lang/Integer;->intValue()I
    move-result v4
    if-nez v4, :L3
    invoke-interface { v3 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v3
    invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L3
  .line 549
    goto :L1
  :L4
  .line 550
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v2
  :L5
    if-eqz v2, :L6
    monitor-exit v0
    return-void
  :L6
  .line 551
    const/4 v2, 0
  :L7
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge v2, v3, :L8
    sget-object v3, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v1, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v4
    invoke-virtual { v3, v4 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    add-int/lit8 v2, v2, 1
    goto :L7
  :L8
  .line 552
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  .line 553
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  :L9
  .line 554
    monitor-exit v0
    return-void
  :L10
  .line 541
    move-exception v1
    monitor-exit v0
    goto :L12
  :L11
    throw v1
  :L12
    goto :L11
.end method

.method private static declared-synchronized noteLoad()V
  .catchall { :L0 .. :L1 } :L16
  .catchall { :L3 .. :L4 } :L16
  .catchall { :L4 .. :L7 } :L14
  .catchall { :L8 .. :L9 } :L10
  .registers 8
    const-class v0, Lcom/innioasis/ipp/BigCover;
    monitor-enter v0
  :L0
  .line 472
    sget-boolean v1, Lcom/innioasis/ipp/BigCover;->notesLoaded:Z
  :L1
    if-eqz v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 473
    const/4 v1, 1
  :L3
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesLoaded:Z
  :L4
  .line 475
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteFile()Ljava/io/File;
    move-result-object v1
  .line 476
    if-eqz v1, :L13
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-nez v2, :L5
    goto :L13
  :L5
  .line 477
    new-instance v2, Ljava/io/FileInputStream;
    invoke-direct { v2, v1 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 478
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->available()I
    move-result v1
    new-array v1, v1, [B
  .line 479
    invoke-virtual { v2, v1 }, Ljava/io/FileInputStream;->read([B)I
  .line 480
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 481
    new-instance v2, Ljava/lang/String;
    const-string v3, "UTF-8"
    invoke-direct { v2, v1, v3 }, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    const-string v1, "\n"
    invoke-virtual { v2, v1 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v1
  .line 482
    const/4 v2, 0
    const/4 v3, 0
  :L6
    array-length v4, v1
    if-ge v3, v4, :L12
  .line 483
    aget-object v4, v1, v3
  .line 484
    const/16 v5, 9
    invoke-virtual { v4, v5 }, Ljava/lang/String;->indexOf(I)I
    move-result v5
  :L7
  .line 485
    if-gtz v5, :L8
    goto :L11
  :L8
  .line 487
    sget-object v6, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v4, v2, v5 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v7
    add-int/lit8 v5, v5, 1
    invoke-virtual { v4, v5 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v4
    invoke-static { v4 }, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;
    move-result-object v4
    invoke-virtual { v6, v7, v4 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L9
  .line 489
    goto :L11
  :L10
  .line 488
    move-exception v4
  :L11
  .line 482
    add-int/lit8 v3, v3, 1
    goto :L6
  :L12
  .line 492
    goto :L15
  :L13
  .line 476
    monitor-exit v0
    return-void
  :L14
  .line 491
    move-exception v1
  :L15
  .line 493
    monitor-exit v0
    return-void
  :L16
  .line 471
    move-exception v1
    monitor-exit v0
    goto :L18
  :L17
    throw v1
  :L18
    goto :L17
.end method

.method private static declared-synchronized noteSave()V
  .catchall { :L0 .. :L1 } :L11
  .catchall { :L2 .. :L3 } :L9
  .catchall { :L4 .. :L8 } :L9
  .registers 8
    const-class v0, Lcom/innioasis/ipp/BigCover;
    monitor-enter v0
  :L0
  .line 496
    sget-boolean v1, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  :L1
    if-nez v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 498
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteFile()Ljava/io/File;
    move-result-object v1
  :L3
  .line 499
    if-nez v1, :L4
    monitor-exit v0
    return-void
  :L4
  .line 500
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
  .line 501
    sget-object v3, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v3 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v3
    invoke-interface { v3 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v3
  :L5
  .line 502
    invoke-interface { v3 }, Ljava/util/Iterator;->hasNext()Z
    move-result v4
    if-eqz v4, :L7
  .line 503
    invoke-interface { v3 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/util/Map$Entry;
  .line 504
    invoke-interface { v4 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/String;
  .line 505
    if-eqz v5, :L5
    const/16 v6, 9
    invoke-virtual { v5, v6 }, Ljava/lang/String;->indexOf(I)I
    move-result v7
    if-ltz v7, :L6
    goto :L5
  :L6
  .line 506
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
  .line 507
    goto :L5
  :L7
  .line 508
    new-instance v3, Ljava/io/FileOutputStream;
    invoke-direct { v3, v1 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  .line 509
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    const-string v2, "UTF-8"
    invoke-virtual { v1, v2 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object v1
    invoke-virtual { v3, v1 }, Ljava/io/FileOutputStream;->write([B)V
  .line 510
    invoke-virtual { v3 }, Ljava/io/FileOutputStream;->close()V
  .line 511
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  :L8
  .line 513
    goto :L10
  :L9
  .line 512
    move-exception v1
  :L10
  .line 514
    monitor-exit v0
    return-void
  :L11
  .line 495
    move-exception v1
    monitor-exit v0
    goto :L13
  :L12
    throw v1
  :L13
    goto :L12
.end method

.method private static declared-synchronized noteSet(Ljava/lang/String;I)V
  .catchall { :L0 .. :L1 } :L5
  .catchall { :L3 .. :L4 } :L5
  .registers 5
    const-class v0, Lcom/innioasis/ipp/BigCover;
    monitor-enter v0
  .line 525
    if-nez p0, :L0
    monitor-exit v0
    return-void
  :L0
  .line 526
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 527
    sget-object v1, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
    invoke-virtual { v1, p0, v2 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 528
    if-eqz p0, :L2
    check-cast p0, Ljava/lang/Integer;
    invoke-virtual { p0 }, Ljava/lang/Integer;->intValue()I
    move-result p0
  :L1
    if-ne p0, p1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 529
    const/4 p0, 1
  :L3
    sput-boolean p0, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  .line 530
    sget-boolean p0, Lcom/innioasis/ipp/BigCover;->passing:Z
    if-nez p0, :L4
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  :L4
  .line 531
    monitor-exit v0
    return-void
  :L5
  .line 524
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method public static ownArt(Ljava/lang/String;)Z
  .registers 2
  .line 332
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
  .line 608
    const/4 v0, 1
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Meta;->read(Ljava/lang/String;Z)Lcom/innioasis/ipp/Meta$Info;
    move-result-object v0
  .line 609
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
  .line 610
    const/4 v1, 0
    if-eqz p0, :L4
    array-length v2, p0
    if-nez v2, :L2
    goto :L4
  :L2
  .line 611
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->capped([B)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 612
    if-nez v0, :L3
    return-object v1
  :L3
  .line 613
    new-instance v1, Lcom/innioasis/ipp/BigCover$Src;
    invoke-direct { v1 }, Lcom/innioasis/ipp/BigCover$Src;-><init>()V
  .line 614
    iput-object v0, v1, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
  .line 615
    iput-object p0, v1, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
  .line 616
    return-object v1
  :L4
  .line 610
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
  .line 620
    invoke-virtual { p0 }, Ljava/io/File;->length()J
    move-result-wide v0
  .line 621
    const-wide/16 v2, 0
    const/4 v4, 0
    cmp-long v5, v0, v2
    if-lez v5, :L7
    const-wide/32 v2, 8388608
    cmp-long v5, v0, v2
    if-lez v5, :L0
    goto :L7
  :L0
  .line 622
    long-to-int v1, v0
    new-array v0, v1, [B
  .line 623
    new-instance v2, Ljava/io/FileInputStream;
    invoke-direct { v2, p0 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 625
    const/4 p0, 0
  :L1
  .line 626
    if-ge p0, v1, :L6
  .line 627
    sub-int v3, v1, p0
  :L2
    invoke-virtual { v2, v0, p0, v3 }, Ljava/io/FileInputStream;->read([BII)I
    move-result v3
  :L3
  .line 628
    if-gez v3, :L4
  .line 632
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 628
    return-object v4
  :L4
  .line 629
    add-int/2addr p0, v3
  .line 630
    goto :L1
  :L5
  .line 632
    move-exception p0
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 633
    throw p0
  :L6
  .line 632
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 633
    nop
  .line 634
    return-object v0
  :L7
  .line 621
    return-object v4
.end method

.method private static same(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Z
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 670
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
  .line 671
    move-exception p0
  .line 672
    return v0
  :L3
  .line 670
    return v0
.end method

.method private static sig([B)I
  .registers 4
  .line 563
    new-instance v0, Ljava/util/zip/CRC32;
    invoke-direct { v0 }, Ljava/util/zip/CRC32;-><init>()V
  .line 564
    const/4 v1, 0
    array-length v2, p0
    invoke-virtual { v0, p0, v1, v2 }, Ljava/util/zip/CRC32;->update([BII)V
  .line 565
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
  .line 578
    const/4 v1, 0
    if-eqz p0, :L4
    if-nez p1, :L0
    goto :L4
  :L0
  .line 579
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 580
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
  .line 581
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
  .line 577
    move-exception p0
    monitor-exit v0
    throw p0
  :L4
  .line 578
    monitor-exit v0
    return v1
.end method

.method private static declared-synchronized sigSet(Ljava/lang/String;[B)V
  .catchall { :L0 .. :L1 } :L5
  .catchall { :L3 .. :L4 } :L5
  .registers 6
    const-class v0, Lcom/innioasis/ipp/BigCover;
    monitor-enter v0
  .line 569
    if-eqz p0, :L6
    if-nez p1, :L0
    goto :L6
  :L0
  .line 570
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 571
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->sig([B)I
    move-result p1
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
  .line 572
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
  .line 573
    const/4 p0, 1
  :L3
    sput-boolean p0, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  .line 574
    sget-boolean p0, Lcom/innioasis/ipp/BigCover;->passing:Z
    if-nez p0, :L4
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  :L4
  .line 575
    monitor-exit v0
    return-void
  :L5
  .line 568
    move-exception p0
    monitor-exit v0
    throw p0
  :L6
  .line 569
    monitor-exit v0
    return-void
.end method

.method private static square(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .registers 4
  .line 657
    if-nez p0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 658
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v0
  .line 659
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v1
  .line 660
    const/16 v2, 300
    if-ne v0, v1, :L1
    if-gt v0, v2, :L1
    return-object p0
  :L1
  .line 661
    invoke-static { v0, v1 }, Ljava/lang/Math;->min(II)I
    move-result v0
  .line 662
    if-lez v0, :L3
    if-le v0, v2, :L2
    goto :L3
  :L2
    move v2, v0
  :L3
  .line 663
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Cover;->square(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 664
    if-nez v0, :L4
    goto :L5
  :L4
    move-object p0, v0
  :L5
    return-object p0
.end method

.method private static store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;)Z
  .catchall { :L0 .. :L4 } :L5
  .registers 4
  .line 679
    const/4 v0, 0
    if-eqz p1, :L6
  :L0
    iget-object v1, p1, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
    if-nez v1, :L1
    goto :L6
  :L1
  .line 680
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->fit(Lcom/innioasis/ipp/BigCover$Src;)[B
    move-result-object v1
  .line 681
    if-nez v1, :L2
    return v0
  :L2
  .line 682
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/BigCover;->write(Ljava/lang/String;[B)Z
    move-result v1
    if-nez v1, :L3
    return v0
  :L3
  .line 683
    sget-object v1, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    iget-object p1, p1, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
    invoke-interface { v1, p0, p1 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L4
  .line 684
    const/4 p0, 1
    return p0
  :L5
  .line 685
    move-exception p0
  .line 686
    return v0
  :L6
  .line 679
    return v0
.end method

.method private static storeSrc(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;[B)I
  .registers 7
  .line 427
    array-length v0, p2
    const/16 v1, 25600
    const/4 v2, 2
    const/4 v3, 0
    if-gt v0, v1, :L1
    invoke-static { p2 }, Lcom/innioasis/ipp/BigCover;->isJpeg([B)Z
    move-result v0
    if-eqz v0, :L1
    invoke-static { p1, p2 }, Lcom/innioasis/ipp/BigCover;->write(Ljava/lang/String;[B)Z
    move-result p0
    if-eqz p0, :L0
    const/4 v2, 0
  :L0
    return v2
  :L1
  .line 428
    invoke-static { p2 }, Lcom/innioasis/ipp/BigCover;->capped([B)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 429
    if-nez v0, :L2
    const/4 p0, 1
    return p0
  :L2
  .line 430
    new-instance v1, Lcom/innioasis/ipp/BigCover$Src;
    invoke-direct { v1 }, Lcom/innioasis/ipp/BigCover$Src;-><init>()V
  .line 431
    iput-object v0, v1, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
  .line 432
    iput-object p2, v1, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
  .line 433
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/BigCover;->store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;)Z
    move-result p2
  .line 434
    sget-object v1, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v1, p1 }, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 435
    if-nez p2, :L3
    return v2
  :L3
  .line 436
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$302(Lcom/innioasis/ipp/BigCover$Walk;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .line 437
    return v3
.end method

.method public static track(Ljava/lang/String;)Landroid/graphics/Bitmap;
  .catchall { :L3 .. :L6 } :L19
  .catch Ljava/lang/OutOfMemoryError; { :L7 .. :L8 } :L18
  .catchall { :L7 .. :L8 } :L9
  .catchall { :L10 .. :L20 } :L19
  .registers 8
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
    iget-object v0, v1, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
  .line 112
    invoke-static { v3 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v4
  .line 113
    const/4 v5, 1
    if-nez v4, :L14
  .line 114
    sget-object v4, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v4, p0, v0 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 115
    invoke-static { v3, v1 }, Lcom/innioasis/ipp/BigCover;->store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;)Z
    move-result v4
    if-nez v4, :L13
    monitor-exit v2
    return-object v0
  :L13
  .line 116
    iget-object v1, v1, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
    invoke-static { v3, v1 }, Lcom/innioasis/ipp/BigCover;->sigSet(Ljava/lang/String;[B)V
  .line 117
    invoke-static { p0, v5 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 118
    monitor-exit v2
    return-object v0
  :L14
  .line 120
    iget-object v6, v1, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
    invoke-static { v3, v6 }, Lcom/innioasis/ipp/BigCover;->sigIs(Ljava/lang/String;[B)Z
    move-result v3
    if-nez v3, :L17
    invoke-static { v4, v0 }, Lcom/innioasis/ipp/BigCover;->same(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Z
    move-result v3
    if-eqz v3, :L15
    goto :L17
  :L15
  .line 125
    sget-object v3, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v3, p0, v0 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 126
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/BigCover;->store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;)Z
    move-result v1
    if-eqz v1, :L16
    const/4 v1, 2
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  :L16
  .line 127
    monitor-exit v2
    return-object v0
  :L17
  .line 121
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v0, p0, v4 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 122
    invoke-static { p0, v5 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 123
    monitor-exit v2
    return-object v4
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
  .line 692
    nop
  .line 694
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object p0
  :L1
  .line 695
    if-nez p0, :L2
    return v0
  :L2
  .line 696
    new-instance v1, Ljava/io/FileOutputStream;
    invoke-direct { v1, p0 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  :L3
  .line 698
    invoke-virtual { v1, p1 }, Ljava/io/FileOutputStream;->write([B)V
  :L4
  .line 700
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
  .line 701
    nop
  .line 702
    const/4 p0, 1
    return p0
  :L5
  .line 700
    move-exception p1
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
  .line 701
    throw p1
  :L6
  .line 703
    move-exception p1
    goto :L8
  :L7
    move-exception p0
    const/4 p0, 0
  :L8
  .line 704
    if-eqz p0, :L12
  :L9
    invoke-virtual { p0 }, Ljava/io/File;->delete()Z
  :L10
    goto :L12
  :L11
    move-exception p0
  :L12
  .line 705
    return v0
.end method
