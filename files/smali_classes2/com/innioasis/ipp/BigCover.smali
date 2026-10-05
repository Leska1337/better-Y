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

.field private final static SIZE:I = 300

.field private final static SUFFIX:Ljava/lang/String; = "-300q.jpg"

.field private final static UNKNOWN:I = -1

.field private final static mem:Ljava/util/Map;

.field private final static miss:Ljava/util/Hashtable;

.field private final static notes:Ljava/util/HashMap;

.field private static notesDirty:Z

.field private static notesLoaded:Z

.field private static volatile passing:Z

.field private static swept:Z

.method static constructor <clinit>()V
  .registers 1
  .line 110
    new-instance v0, Lcom/innioasis/ipp/BigCover$Lru;
    invoke-direct { v0 }, Lcom/innioasis/ipp/BigCover$Lru;-><init>()V
    invoke-static { v0 }, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;
    move-result-object v0
    sput-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
  .line 120
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
  .line 125
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/BigCover;->LOCK:Ljava/lang/Object;
  .line 543
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 71
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000()Ljava/util/Map;
  .registers 1
  .line 69
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    return-object v0
.end method

.method public static beginCache()V
  .registers 1
  .line 523
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/BigCover;->passing:Z
  .line 524
    return-void
.end method

.method private static bytes(Ljava/lang/String;)[B
  .registers 3
  .line 693
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->embedded(Ljava/lang/String;)[B
    move-result-object v0
  .line 694
    if-eqz v0, :L0
    array-length v1, v0
    if-lez v1, :L0
    return-object v0
  :L0
  .line 695
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->external(Ljava/lang/String;)[B
    move-result-object p0
    return-object p0
.end method

.method public static cache(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;[B)V
  .catchall { :L0 .. :L15 } :L16
  .registers 7
  .line 436
    if-eqz p1, :L18
    if-nez p0, :L0
    goto/16 :L18
  :L0
  .line 438
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->note(Ljava/lang/String;)I
    move-result v0
    const/4 v1, -1
    if-eq v0, v1, :L1
    return-void
  :L1
  .line 439
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 440
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$100(Lcom/innioasis/ipp/BigCover$Walk;)Ljava/lang/String;
    move-result-object v1
    if-eqz v1, :L2
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$100(Lcom/innioasis/ipp/BigCover$Walk;)Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :L2
    invoke-virtual { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->done()V
  :L2
  .line 441
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$102(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;)Ljava/lang/String;
  .line 443
    if-eqz p2, :L3
    array-length v1, p2
    if-lez v1, :L3
    goto :L4
  :L3
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->external(Ljava/lang/String;)[B
    move-result-object p2
  :L4
  .line 444
    const/4 v1, 0
    if-eqz p2, :L14
    array-length v2, p2
    if-nez v2, :L5
    goto/16 :L14
  :L5
  .line 451
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v2
    const/4 v3, 1
    if-eqz v2, :L6
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v2
    invoke-static { v2, p2 }, Ljava/util/Arrays;->equals([B[B)Z
    move-result v2
    if-eqz v2, :L6
  .line 452
    invoke-static { p1, v3 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 453
    return-void
  :L6
  .line 456
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v2
    if-nez v2, :L8
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$300(Lcom/innioasis/ipp/BigCover$Walk;)Landroid/graphics/Bitmap;
    move-result-object v2
    if-nez v2, :L8
  .line 457
    invoke-static { v0 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v2
  .line 458
    if-nez v2, :L7
  .line 459
    invoke-static { v0, p2 }, Lcom/innioasis/ipp/BigCover;->storeSrc(Ljava/lang/String;[B)Landroid/graphics/Bitmap;
    move-result-object v0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$302(Lcom/innioasis/ipp/BigCover$Walk;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .line 460
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/BigCover$Walk;->access$202(Lcom/innioasis/ipp/BigCover$Walk;[B)[B
  .line 461
    invoke-static { p1, v3 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 462
    return-void
  :L7
  .line 464
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/BigCover$Walk;->access$302(Lcom/innioasis/ipp/BigCover$Walk;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  :L8
  .line 469
    invoke-static { p2 }, Lcom/innioasis/ipp/BigCover;->capped([B)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 470
    if-nez v0, :L9
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
    return-void
  :L9
  .line 471
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$300(Lcom/innioasis/ipp/BigCover$Walk;)Landroid/graphics/Bitmap;
    move-result-object v1
    if-nez v1, :L10
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/BigCover;->capped([B)Landroid/graphics/Bitmap;
    move-result-object v1
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/BigCover$Walk;->access$302(Lcom/innioasis/ipp/BigCover$Walk;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  :L10
  .line 472
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$300(Lcom/innioasis/ipp/BigCover$Walk;)Landroid/graphics/Bitmap;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/BigCover;->same(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Z
    move-result v1
    if-eqz v1, :L12
  .line 476
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v0
    if-nez v0, :L11
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/BigCover$Walk;->access$202(Lcom/innioasis/ipp/BigCover$Walk;[B)[B
  :L11
  .line 477
    invoke-static { p1, v3 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
    goto :L13
  :L12
  .line 479
    new-instance p0, Lcom/innioasis/ipp/BigCover$Src;
    invoke-direct { p0 }, Lcom/innioasis/ipp/BigCover$Src;-><init>()V
  .line 480
    iput-object v0, p0, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
  .line 481
    iput-object p2, p0, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
  .line 482
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/BigCover;->store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;)V
  .line 483
    sget-object p0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { p0, p1 }, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 484
    const/4 p0, 2
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  :L13
  .line 488
    goto :L17
  :L14
  .line 444
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  :L15
    return-void
  :L16
  .line 486
    move-exception p0
  :L17
  .line 489
    return-void
  :L18
  .line 436
    return-void
.end method

.method public static cachedFile(Ljava/lang/String;)Ljava/io/File;
  .registers 4
  .line 275
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 276
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->note(Ljava/lang/String;)I
    move-result v1
  .line 277
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
  .line 278
    if-nez p0, :L4
    move-object p0, v0
    goto :L5
  :L4
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object p0
  :L5
  .line 279
    if-eqz p0, :L6
    invoke-virtual { p0 }, Ljava/io/File;->exists()Z
    move-result v1
    if-eqz v1, :L6
    move-object v0, p0
  :L6
    return-object v0
.end method

.method private static capped([B)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L2 } :L4
  .registers 7
  .line 723
    const/4 v0, 0
  :L0
    new-instance v1, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v1 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 724
    const/4 v2, 1
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 725
    array-length v2, p0
    const/4 v3, 0
    invoke-static { p0, v3, v2, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 726
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    if-lez v2, :L3
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    if-gtz v2, :L1
    goto :L3
  :L1
  .line 727
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    iget v4, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    const/16 v5, 300
    invoke-static { v2, v4, v5, v5 }, Lcom/innioasis/ipp/Art;->sample(IIII)I
    move-result v2
    iput v2, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 728
    iput-boolean v3, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 729
    array-length v2, p0
    invoke-static { p0, v3, v2, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object p0
  .line 730
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->square(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object p0
  :L2
    return-object p0
  :L3
  .line 726
    return-object v0
  :L4
  .line 731
    move-exception p0
  .line 732
    return-object v0
.end method

.method public static clear()V
  .catchall { :L0 .. :L5 } :L6
  .registers 4
  .line 344
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v0 }, Ljava/util/Map;->clear()V
  .line 345
    sget-object v0, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 346
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteClear()V
  :L0
  .line 348
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->dir()Ljava/io/File;
    move-result-object v0
  .line 349
    if-nez v0, :L1
    return-void
  :L1
  .line 350
    invoke-virtual { v0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v1
  .line 351
    if-nez v1, :L2
    return-void
  :L2
  .line 352
    const/4 v2, 0
  :L3
    array-length v3, v1
    if-ge v2, v3, :L4
    aget-object v3, v1, v2
    invoke-virtual { v3 }, Ljava/io/File;->delete()Z
    add-int/lit8 v2, v2, 1
    goto :L3
  :L4
  .line 353
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  :L5
  .line 356
    goto :L7
  :L6
  .line 354
    move-exception v0
  :L7
  .line 357
    return-void
.end method

.method public static clearMiss()V
  .registers 1
  .line 338
    sget-object v0, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 339
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteForgetNone()V
  .line 340
    return-void
.end method

.method private static dir()Ljava/io/File;
  .catchall { :L3 .. :L5 } :L7
  .registers 5
  .line 849
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 850
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 851
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 852
    if-nez v0, :L1
    return-object v1
  :L1
  .line 853
    new-instance v1, Ljava/io/File;
    const-string v2, "ipp_big"
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 854
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v0
    if-nez v0, :L2
    invoke-virtual { v1 }, Ljava/io/File;->mkdirs()Z
  :L2
  .line 855
    sget-boolean v0, Lcom/innioasis/ipp/BigCover;->swept:Z
    if-nez v0, :L8
  .line 856
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/BigCover;->swept:Z
  :L3
  .line 858
    invoke-virtual { v1 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v0
  .line 859
    if-eqz v0, :L6
  .line 860
    const/4 v2, 0
  :L4
    array-length v3, v0
    if-ge v2, v3, :L6
  .line 861
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
  .line 860
    add-int/lit8 v2, v2, 1
    goto :L4
  :L6
  .line 866
    goto :L8
  :L7
  .line 864
    move-exception v0
  :L8
  .line 868
    return-object v1
.end method

.method private static embedded(Ljava/lang/String;)[B
  .registers 1
  .line 699
    invoke-static { p0 }, Lcom/innioasis/ipp/Meta;->art(Ljava/lang/String;)[B
    move-result-object p0
    return-object p0
.end method

.method private static encode(Landroid/graphics/Bitmap;I)[B
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  :L0
  .line 829
    new-instance v0, Ljava/io/ByteArrayOutputStream;
    const/16 v1, 25600
    invoke-direct { v0, v1 }, Ljava/io/ByteArrayOutputStream;-><init>(I)V
  .line 830
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;
    invoke-virtual { p0, v1, p1, v0 }, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
  .line 831
    invoke-virtual { v0 }, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    move-result-object p0
  :L1
    return-object p0
  :L2
  .line 832
    move-exception p0
  .line 833
    const/4 p0, 0
    return-object p0
.end method

.method public static endCache()V
  .registers 1
  .line 528
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/BigCover;->passing:Z
  .line 529
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  .line 530
    return-void
.end method

.method private static external(Ljava/lang/String;)[B
  .catchall { :L0 .. :L2 } :L3
  .registers 2
  .line 494
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object p0
  .line 495
    if-nez p0, :L1
    goto :L2
  :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->readAll(Ljava/io/File;)[B
    move-result-object v0
  :L2
    return-object v0
  :L3
  .line 496
    move-exception p0
  .line 497
    return-object v0
.end method

.method private static file(Ljava/lang/String;)Ljava/io/File;
  .registers 5
  .line 843
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->dir()Ljava/io/File;
    move-result-object v0
  .line 844
    if-nez v0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 845
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
  .line 808
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
  .line 810
    nop
  .line 811
    nop
  .line 812
    const/16 v0, 76
    const/4 v2, 0
    const/16 v3, 92
    const/16 v4, 76
  :L1
  .line 813
    if-gt v4, v3, :L5
  .line 814
    add-int v5, v4, v3
    add-int/lit8 v5, v5, 1
    shr-int/lit8 v5, v5, 1
  .line 815
    iget-object v6, p0, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
    invoke-static { v6, v5 }, Lcom/innioasis/ipp/BigCover;->encode(Landroid/graphics/Bitmap;I)[B
    move-result-object v6
  .line 816
    if-nez v6, :L2
    goto :L5
  :L2
  .line 817
    array-length v7, v6
    if-gt v7, v1, :L3
  .line 818
    nop
  .line 819
    add-int/lit8 v4, v5, 1
    move-object v2, v6
    goto :L4
  :L3
  .line 821
    add-int/lit8 v5, v5, -1
    move v3, v5
  :L4
  .line 823
    goto :L1
  :L5
  .line 824
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
  .line 324
    if-nez p0, :L0
    return-void
  :L0
  .line 325
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v0, p0 }, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 326
    sget-object v0, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v0, p0 }, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 327
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->noteForget(Ljava/lang/String;)V
  :L1
  .line 329
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object p0
  .line 330
    if-eqz p0, :L2
    invoke-virtual { p0 }, Ljava/io/File;->delete()Z
  :L2
  .line 333
    goto :L4
  :L3
  .line 331
    move-exception p0
  :L4
  .line 334
    return-void
.end method

.method private static isJpeg([B)Z
  .registers 6
  .line 839
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

.method public static knownNone(Ljava/lang/String;)Z
  .registers 1
  .line 411
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

.method public static needs(Ljava/lang/String;)Z
  .registers 2
  .line 389
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->note(Ljava/lang/String;)I
    move-result p0
    const/4 v0, -1
    if-ne p0, v0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method private static declared-synchronized note(Ljava/lang/String;)I
  .catchall { :L0 .. :L3 } :L5
  .registers 4
    const-class v0, Lcom/innioasis/ipp/BigCover;
    monitor-enter v0
  .line 606
    const/4 v1, -1
    if-nez p0, :L0
    monitor-exit v0
    return v1
  :L0
  .line 607
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 608
    sget-object v2, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v2, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 609
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
  .line 605
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
  .line 648
    sget-object v1, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v1 }, Ljava/util/HashMap;->clear()V
  .line 649
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesLoaded:Z
  .line 650
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  :L1
  .line 652
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteFile()Ljava/io/File;
    move-result-object v1
  .line 653
    if-eqz v1, :L2
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-eqz v2, :L2
    invoke-virtual { v1 }, Ljava/io/File;->delete()Z
  :L2
  .line 656
    goto :L4
  :L3
  .line 654
    move-exception v1
  :L4
  .line 657
    monitor-exit v0
    return-void
  :L5
  .line 647
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method private static noteFile()Ljava/io/File;
  .registers 3
  .line 549
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 550
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 551
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 554
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
  .catchall { :L0 .. :L1 } :L2
  .registers 3
    const-class v0, Lcom/innioasis/ipp/BigCover;
    monitor-enter v0
  :L0
  .line 628
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 629
    sget-object v1, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v1, p0 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    if-eqz p0, :L1
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  :L1
  .line 630
    monitor-exit v0
    return-void
  :L2
  .line 627
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method private static declared-synchronized noteForgetNone()V
  .catchall { :L0 .. :L4 } :L9
  .catchall { :L6 .. :L8 } :L9
  .registers 5
    const-class v0, Lcom/innioasis/ipp/BigCover;
    monitor-enter v0
  :L0
  .line 634
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 635
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 636
    sget-object v2, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v2 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v2
    invoke-interface { v2 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v2
  :L1
  .line 637
    invoke-interface { v2 }, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :L3
  .line 638
    invoke-interface { v2 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/util/Map$Entry;
  .line 639
    invoke-interface { v3 }, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/Integer;
    invoke-virtual { v4 }, Ljava/lang/Integer;->intValue()I
    move-result v4
    if-nez v4, :L2
    invoke-interface { v3 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v3
    invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L2
  .line 640
    goto :L1
  :L3
  .line 641
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v2
  :L4
    if-eqz v2, :L5
    monitor-exit v0
    return-void
  :L5
  .line 642
    const/4 v2, 0
  :L6
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result v3
    if-ge v2, v3, :L7
    sget-object v3, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v1, v2 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v4
    invoke-virtual { v3, v4 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    add-int/lit8 v2, v2, 1
    goto :L6
  :L7
  .line 643
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  .line 644
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  :L8
  .line 645
    monitor-exit v0
    return-void
  :L9
  .line 633
    move-exception v1
    monitor-exit v0
    goto :L11
  :L10
    throw v1
  :L11
    goto :L10
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
  .line 558
    sget-boolean v1, Lcom/innioasis/ipp/BigCover;->notesLoaded:Z
  :L1
    if-eqz v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 559
    const/4 v1, 1
  :L3
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesLoaded:Z
  :L4
  .line 561
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteFile()Ljava/io/File;
    move-result-object v1
  .line 562
    if-eqz v1, :L13
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-nez v2, :L5
    goto :L13
  :L5
  .line 563
    new-instance v2, Ljava/io/FileInputStream;
    invoke-direct { v2, v1 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 564
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->available()I
    move-result v1
    new-array v1, v1, [B
  .line 565
    invoke-virtual { v2, v1 }, Ljava/io/FileInputStream;->read([B)I
  .line 566
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 567
    new-instance v2, Ljava/lang/String;
    const-string v3, "UTF-8"
    invoke-direct { v2, v1, v3 }, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    const-string v1, "\n"
    invoke-virtual { v2, v1 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v1
  .line 568
    const/4 v2, 0
    const/4 v3, 0
  :L6
    array-length v4, v1
    if-ge v3, v4, :L12
  .line 569
    aget-object v4, v1, v3
  .line 570
    const/16 v5, 9
    invoke-virtual { v4, v5 }, Ljava/lang/String;->indexOf(I)I
    move-result v5
  :L7
  .line 571
    if-gtz v5, :L8
    goto :L11
  :L8
  .line 573
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
  .line 576
    goto :L11
  :L10
  .line 574
    move-exception v4
  :L11
  .line 568
    add-int/lit8 v3, v3, 1
    goto :L6
  :L12
  .line 580
    goto :L15
  :L13
  .line 562
    monitor-exit v0
    return-void
  :L14
  .line 578
    move-exception v1
  :L15
  .line 581
    monitor-exit v0
    return-void
  :L16
  .line 557
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
  .line 584
    sget-boolean v1, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  :L1
    if-nez v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 586
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteFile()Ljava/io/File;
    move-result-object v1
  :L3
  .line 587
    if-nez v1, :L4
    monitor-exit v0
    return-void
  :L4
  .line 588
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
  .line 589
    sget-object v3, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v3 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v3
    invoke-interface { v3 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v3
  :L5
  .line 590
    invoke-interface { v3 }, Ljava/util/Iterator;->hasNext()Z
    move-result v4
    if-eqz v4, :L7
  .line 591
    invoke-interface { v3 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/util/Map$Entry;
  .line 592
    invoke-interface { v4 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/String;
  .line 593
    if-eqz v5, :L5
    const/16 v6, 9
    invoke-virtual { v5, v6 }, Ljava/lang/String;->indexOf(I)I
    move-result v7
    if-ltz v7, :L6
    goto :L5
  :L6
  .line 594
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
  .line 595
    goto :L5
  :L7
  .line 596
    new-instance v3, Ljava/io/FileOutputStream;
    invoke-direct { v3, v1 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  .line 597
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    const-string v2, "UTF-8"
    invoke-virtual { v1, v2 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object v1
    invoke-virtual { v3, v1 }, Ljava/io/FileOutputStream;->write([B)V
  .line 598
    invoke-virtual { v3 }, Ljava/io/FileOutputStream;->close()V
  .line 599
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  :L8
  .line 602
    goto :L10
  :L9
  .line 600
    move-exception v1
  :L10
  .line 603
    monitor-exit v0
    return-void
  :L11
  .line 583
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
  .line 619
    if-nez p0, :L0
    monitor-exit v0
    return-void
  :L0
  .line 620
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 621
    sget-object v1, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
    invoke-virtual { v1, p0, v2 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 622
    if-eqz p0, :L2
    check-cast p0, Ljava/lang/Integer;
    invoke-virtual { p0 }, Ljava/lang/Integer;->intValue()I
    move-result p0
  :L1
    if-ne p0, p1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 623
    const/4 p0, 1
  :L3
    sput-boolean p0, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  .line 624
    sget-boolean p0, Lcom/innioasis/ipp/BigCover;->passing:Z
    if-nez p0, :L4
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  :L4
  .line 625
    monitor-exit v0
    return-void
  :L5
  .line 618
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method public static ownArt(Ljava/lang/String;)Z
  .registers 2
  .line 407
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
  .catchall { :L3 .. :L4 } :L5
  .registers 7
  .line 292
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 293
    sget-object v1, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v1, p0 }, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  .line 294
    if-eqz v1, :L1
    check-cast v1, Landroid/graphics/Bitmap;
    return-object v1
  :L1
  .line 295
    sget-object v1, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L2
    return-object v0
  :L2
  .line 296
    nop
  :L3
  .line 298
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v1
  .line 299
    if-eqz v1, :L4
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-eqz v2, :L4
  .line 300
    invoke-virtual { v1 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object v1
  .line 301
    new-instance v2, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v2 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 302
    const/4 v3, 1
    iput-boolean v3, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 303
    invoke-static { v1, v2 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 304
    iget v3, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    if-lez v3, :L4
    iget v3, v2, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    if-lez v3, :L4
  .line 305
    iget v3, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    iget v4, v2, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    const/16 v5, 300
    invoke-static { v3, v4, v5, v5 }, Lcom/innioasis/ipp/Art;->sample(IIII)I
    move-result v3
    iput v3, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 306
    const/4 v3, 0
    iput-boolean v3, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 307
    invoke-static { v1, v2 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/BigCover;->square(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object v0
  :L4
  .line 312
    goto :L6
  :L5
  .line 310
    move-exception v1
  .line 311
    nop
  :L6
  .line 313
    if-eqz v0, :L7
    sget-object v1, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v1, p0, v0 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L7
  .line 314
    return-object v0
.end method

.method public static peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
  .registers 4
  .line 260
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 261
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 262
    if-eqz v1, :L1
    return-object v1
  :L1
  .line 263
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->note(Ljava/lang/String;)I
    move-result v1
    const/4 v2, 1
    if-eq v1, v2, :L2
    return-object v0
  :L2
  .line 264
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 265
    if-eqz v0, :L3
    sget-object v1, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v1, p0, v0 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L3
  .line 266
    return-object v0
.end method

.method public static prefetch(Ljava/util/List;I)V
  .catchall { :L0 .. :L3 } :L4
  .registers 3
  .line 197
    if-eqz p0, :L6
    if-ltz p1, :L6
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    if-lt p1, v0, :L1
    goto :L6
  :L1
  .line 198
    invoke-interface { p0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p0
  .line 199
    instance-of p1, p0, Lcom/innioasis/y1/database/Song;
    if-nez p1, :L2
    return-void
  :L2
  .line 200
    check-cast p0, Lcom/innioasis/y1/database/Song;
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->warm(Ljava/lang/String;)V
  :L3
  .line 203
    goto :L5
  :L4
  .line 201
    move-exception p0
  :L5
  .line 204
    return-void
  :L6
  .line 197
    return-void
.end method

.method public static prefetchPlaying()V
  .catchall { :L0 .. :L5 } :L6
  .registers 2
  :L0
  .line 220
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 221
    const/4 v1, 0
    if-nez v0, :L1
    move-object v0, v1
    goto :L2
  :L1
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingSong()Lcom/innioasis/y1/database/Song;
    move-result-object v0
  :L2
  .line 222
    if-nez v0, :L3
    goto :L4
  :L3
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
  :L4
    invoke-static { v1 }, Lcom/innioasis/ipp/BigCover;->warm(Ljava/lang/String;)V
  :L5
  .line 225
    goto :L7
  :L6
  .line 223
    move-exception v0
  :L7
  .line 226
    return-void
.end method

.method private static read(Ljava/lang/String;)Lcom/innioasis/ipp/BigCover$Src;
  .registers 3
  .line 681
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->bytes(Ljava/lang/String;)[B
    move-result-object p0
  .line 682
    const/4 v0, 0
    if-eqz p0, :L2
    array-length v1, p0
    if-nez v1, :L0
    goto :L2
  :L0
  .line 683
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->capped([B)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 684
    if-nez v1, :L1
    return-object v0
  :L1
  .line 685
    new-instance v0, Lcom/innioasis/ipp/BigCover$Src;
    invoke-direct { v0 }, Lcom/innioasis/ipp/BigCover$Src;-><init>()V
  .line 686
    iput-object v1, v0, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
  .line 687
    iput-object p0, v0, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
  .line 688
    return-object v0
  :L2
  .line 682
    return-object v0
.end method

.method private static readAll(Ljava/io/File;)[B
  .annotation system Ldalvik/annotation/Throws;
    value = {
      Ljava/io/IOException;
    }
  .end annotation
  .catchall { :L2 .. :L3 } :L5
  .registers 7
  .line 703
    invoke-virtual { p0 }, Ljava/io/File;->length()J
    move-result-wide v0
  .line 704
    const-wide/16 v2, 0
    const/4 v4, 0
    cmp-long v5, v0, v2
    if-lez v5, :L7
    const-wide/32 v2, 8388608
    cmp-long v5, v0, v2
    if-lez v5, :L0
    goto :L7
  :L0
  .line 705
    long-to-int v1, v0
    new-array v0, v1, [B
  .line 706
    new-instance v2, Ljava/io/FileInputStream;
    invoke-direct { v2, p0 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 708
    const/4 p0, 0
  :L1
  .line 709
    if-ge p0, v1, :L6
  .line 710
    sub-int v3, v1, p0
  :L2
    invoke-virtual { v2, v0, p0, v3 }, Ljava/io/FileInputStream;->read([BII)I
    move-result v3
  :L3
  .line 711
    if-gez v3, :L4
  .line 715
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 711
    return-object v4
  :L4
  .line 712
    add-int/2addr p0, v3
  .line 713
    goto :L1
  :L5
  .line 715
    move-exception p0
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 716
    throw p0
  :L6
  .line 715
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 716
    nop
  .line 717
    return-object v0
  :L7
  .line 704
    return-object v4
.end method

.method private static same(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Z
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 756
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
  .line 757
    move-exception p0
  .line 758
    return v0
  :L3
  .line 756
    return v0
.end method

.method private static square(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .registers 4
  .line 738
    if-nez p0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 739
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v0
  .line 740
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v1
  .line 741
    const/16 v2, 300
    if-ne v0, v1, :L1
    if-gt v0, v2, :L1
    return-object p0
  :L1
  .line 742
    invoke-static { v0, v1 }, Ljava/lang/Math;->min(II)I
    move-result v0
  .line 743
    if-lez v0, :L3
    if-le v0, v2, :L2
    goto :L3
  :L2
    move v2, v0
  :L3
  .line 744
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Cover;->square(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 745
    if-nez v0, :L4
    goto :L5
  :L4
    move-object p0, v0
  :L5
    return-object p0
.end method

.method private static store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;)V
  .catchall { :L0 .. :L3 } :L4
  .registers 3
  .line 764
    if-eqz p1, :L6
  :L0
    iget-object v0, p1, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
    if-nez v0, :L1
    goto :L6
  :L1
  .line 765
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->fit(Lcom/innioasis/ipp/BigCover$Src;)[B
    move-result-object v0
  .line 766
    if-nez v0, :L2
    return-void
  :L2
  .line 767
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/BigCover;->write(Ljava/lang/String;[B)Z
    move-result v0
    if-eqz v0, :L3
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    iget-object p1, p1, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
    invoke-interface { v0, p0, p1 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L3
  .line 770
    goto :L5
  :L4
  .line 768
    move-exception p0
  :L5
  .line 771
    return-void
  :L6
  .line 764
    return-void
.end method

.method private static storeSrc(Ljava/lang/String;[B)Landroid/graphics/Bitmap;
  .registers 5
  .line 507
    array-length v0, p1
    const/16 v1, 25600
    const/4 v2, 0
    if-gt v0, v1, :L0
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->isJpeg([B)Z
    move-result v0
    if-eqz v0, :L0
  .line 508
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/BigCover;->write(Ljava/lang/String;[B)Z
  .line 509
    return-object v2
  :L0
  .line 511
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->capped([B)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 512
    if-nez v0, :L1
    return-object v2
  :L1
  .line 513
    new-instance v1, Lcom/innioasis/ipp/BigCover$Src;
    invoke-direct { v1 }, Lcom/innioasis/ipp/BigCover$Src;-><init>()V
  .line 514
    iput-object v0, v1, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
  .line 515
    iput-object p1, v1, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
  .line 516
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/BigCover;->store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;)V
  .line 517
    sget-object p1, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { p1, p0 }, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 518
    return-object v0
.end method

.method public static track(Ljava/lang/String;)Landroid/graphics/Bitmap;
  .catchall { :L3 .. :L6 } :L15
  .catchall { :L7 .. :L8 } :L9
  .catchall { :L11 .. :L16 } :L15
  .registers 7
  .line 134
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 135
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 136
    if-eqz v1, :L1
    return-object v1
  :L1
  .line 137
    sget-object v1, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L2
    return-object v0
  :L2
  .line 142
    sget-object v2, Lcom/innioasis/ipp/BigCover;->LOCK:Ljava/lang/Object;
    monitor-enter v2
  :L3
  .line 143
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v3
  .line 144
    if-eqz v3, :L4
    monitor-exit v2
    return-object v3
  :L4
  .line 145
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L5
    monitor-exit v2
    return-object v0
  :L5
  .line 147
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
  .line 148
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->note(Ljava/lang/String;)I
    move-result v4
    if-nez v4, :L7
    invoke-virtual { v1, p0, p0 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    monitor-exit v2
  :L6
    return-object v0
  :L7
  .line 152
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->read(Ljava/lang/String;)Lcom/innioasis/ipp/BigCover$Src;
    move-result-object v1
  :L8
  .line 155
    goto :L10
  :L9
  .line 153
    move-exception v1
  .line 154
    move-object v1, v0
  :L10
  .line 156
    if-nez v1, :L12
  :L11
  .line 157
    sget-object v1, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v1, p0, p0 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 158
    const/4 v1, 0
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 159
    monitor-exit v2
    return-object v0
  :L12
  .line 161
    iget-object v0, v1, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
  .line 163
    invoke-static { v3 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v4
  .line 164
    const/4 v5, 1
    if-nez v4, :L13
  .line 166
    invoke-static { v3, v1 }, Lcom/innioasis/ipp/BigCover;->store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;)V
  .line 167
    sget-object v1, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v1, p0, v0 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 168
    invoke-static { p0, v5 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 169
    monitor-exit v2
    return-object v0
  :L13
  .line 171
    invoke-static { v4, v0 }, Lcom/innioasis/ipp/BigCover;->same(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Z
    move-result v3
    if-eqz v3, :L14
  .line 172
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v0, p0, v4 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 173
    invoke-static { p0, v5 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 174
    monitor-exit v2
    return-object v4
  :L14
  .line 176
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/BigCover;->store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;)V
  .line 177
    sget-object v1, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v1, p0, v0 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 178
    const/4 v1, 2
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 179
    monitor-exit v2
    return-object v0
  :L15
  .line 180
    move-exception p0
    monitor-exit v2
  :L16
    throw p0
.end method

.method private static warm(Ljava/lang/String;)V
  .registers 3
  .line 234
    if-eqz p0, :L1
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v0, p0 }, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    if-nez v0, :L1
    sget-object v0, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v0, p0 }, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L0
    goto :L1
  :L0
  .line 235
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/ipp/BigCover$Warm;
    invoke-direct { v1, p0 }, Lcom/innioasis/ipp/BigCover$Warm;-><init>(Ljava/lang/String;)V
    invoke-direct { v0, v1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 236
    return-void
  :L1
  .line 234
    return-void
.end method

.method private static write(Ljava/lang/String;[B)Z
  .catchall { :L0 .. :L2 } :L5
  .catchall { :L2 .. :L3 } :L4
  .catchall { :L3 .. :L5 } :L5
  .registers 4
  .line 776
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object p0
  .line 777
    if-nez p0, :L1
    return v0
  :L1
  .line 778
    new-instance v1, Ljava/io/FileOutputStream;
    invoke-direct { v1, p0 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  :L2
  .line 780
    invoke-virtual { v1, p1 }, Ljava/io/FileOutputStream;->write([B)V
  :L3
  .line 782
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
  .line 783
    nop
  .line 784
    const/4 p0, 1
    return p0
  :L4
  .line 782
    move-exception p0
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
  .line 783
    throw p0
  :L5
  .line 785
    move-exception p0
  .line 786
    return v0
.end method
