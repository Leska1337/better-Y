.class public final Lcom/innioasis/ipp/BigCover;
.super Ljava/lang/Object;
.source "BigCover.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/BigCover$Src;,
    Lcom/innioasis/ipp/BigCover$Warm;,
    Lcom/innioasis/ipp/BigCover$Walk;
  }
.end annotation

.field private final static LIMIT:I = 25600

.field private final static LOCK:Ljava/lang/Object;

.field private final static NONE:I = 0

.field private final static OWN:I = 2

.field private final static Q_MAX:I = 92

.field private final static Q_MIN:I = 76

.field private final static SEP:C = '\t'

.field private final static SHARED:I = 1

.field private final static SIZE:I = 300

.field private final static SUFFIX:Ljava/lang/String; = "-300q.jpg"

.field private final static UNKNOWN:I = -1

.field private final static mem:Ljava/util/Hashtable;

.field private final static miss:Ljava/util/Hashtable;

.field private final static notes:Ljava/util/HashMap;

.field private static notesDirty:Z

.field private static notesLoaded:Z

.field private static volatile passing:Z

.field private static swept:Z

.method static constructor <clinit>()V
  .registers 1
  .line 105
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Hashtable;
  .line 108
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
  .line 113
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/BigCover;->LOCK:Ljava/lang/Object;
  .line 518
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

.method static synthetic access$000()Ljava/util/Hashtable;
  .registers 1
  .line 69
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Hashtable;
    return-object v0
.end method

.method public static beginCache()V
  .registers 1
  .line 498
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/BigCover;->passing:Z
  .line 499
    return-void
.end method

.method private static bytes(Ljava/lang/String;)[B
  .registers 3
  .line 668
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->embedded(Ljava/lang/String;)[B
    move-result-object v0
  .line 669
    if-eqz v0, :L0
    array-length v1, v0
    if-lez v1, :L0
    return-object v0
  :L0
  .line 670
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->external(Ljava/lang/String;)[B
    move-result-object p0
    return-object p0
.end method

.method public static cache(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;[B)V
  .catchall { :L0 .. :L15 } :L16
  .registers 7
  .line 411
    if-eqz p1, :L18
    if-nez p0, :L0
    goto/16 :L18
  :L0
  .line 413
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->note(Ljava/lang/String;)I
    move-result v0
    const/4 v1, -1
    if-eq v0, v1, :L1
    return-void
  :L1
  .line 414
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 415
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
  .line 416
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$102(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;)Ljava/lang/String;
  .line 418
    if-eqz p2, :L3
    array-length v1, p2
    if-lez v1, :L3
    goto :L4
  :L3
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->external(Ljava/lang/String;)[B
    move-result-object p2
  :L4
  .line 419
    const/4 v1, 0
    if-eqz p2, :L14
    array-length v2, p2
    if-nez v2, :L5
    goto/16 :L14
  :L5
  .line 426
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v2
    const/4 v3, 1
    if-eqz v2, :L6
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v2
    invoke-static { v2, p2 }, Ljava/util/Arrays;->equals([B[B)Z
    move-result v2
    if-eqz v2, :L6
  .line 427
    invoke-static { p1, v3 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 428
    return-void
  :L6
  .line 431
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v2
    if-nez v2, :L8
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$300(Lcom/innioasis/ipp/BigCover$Walk;)Landroid/graphics/Bitmap;
    move-result-object v2
    if-nez v2, :L8
  .line 432
    invoke-static { v0 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v2
  .line 433
    if-nez v2, :L7
  .line 434
    invoke-static { v0, p2 }, Lcom/innioasis/ipp/BigCover;->storeSrc(Ljava/lang/String;[B)Landroid/graphics/Bitmap;
    move-result-object v0
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$302(Lcom/innioasis/ipp/BigCover$Walk;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .line 435
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/BigCover$Walk;->access$202(Lcom/innioasis/ipp/BigCover$Walk;[B)[B
  .line 436
    invoke-static { p1, v3 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 437
    return-void
  :L7
  .line 439
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/BigCover$Walk;->access$302(Lcom/innioasis/ipp/BigCover$Walk;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  :L8
  .line 444
    invoke-static { p2 }, Lcom/innioasis/ipp/BigCover;->capped([B)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 445
    if-nez v0, :L9
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
    return-void
  :L9
  .line 446
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$300(Lcom/innioasis/ipp/BigCover$Walk;)Landroid/graphics/Bitmap;
    move-result-object v1
    if-nez v1, :L10
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/BigCover;->capped([B)Landroid/graphics/Bitmap;
    move-result-object v1
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/BigCover$Walk;->access$302(Lcom/innioasis/ipp/BigCover$Walk;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  :L10
  .line 447
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$300(Lcom/innioasis/ipp/BigCover$Walk;)Landroid/graphics/Bitmap;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/BigCover;->same(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Z
    move-result v1
    if-eqz v1, :L12
  .line 451
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v0
    if-nez v0, :L11
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/BigCover$Walk;->access$202(Lcom/innioasis/ipp/BigCover$Walk;[B)[B
  :L11
  .line 452
    invoke-static { p1, v3 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
    goto :L13
  :L12
  .line 454
    new-instance p0, Lcom/innioasis/ipp/BigCover$Src;
    invoke-direct { p0 }, Lcom/innioasis/ipp/BigCover$Src;-><init>()V
  .line 455
    iput-object v0, p0, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
  .line 456
    iput-object p2, p0, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
  .line 457
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/BigCover;->store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;)V
  .line 458
    sget-object p0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Hashtable;
    invoke-virtual { p0, p1 }, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 459
    const/4 p0, 2
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  :L13
  .line 463
    goto :L17
  :L14
  .line 419
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  :L15
    return-void
  :L16
  .line 461
    move-exception p0
  :L17
  .line 464
    return-void
  :L18
  .line 411
    return-void
.end method

.method private static capped([B)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L2 } :L4
  .registers 7
  .line 710
    const/4 v0, 0
  :L0
    new-instance v1, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v1 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 711
    const/4 v2, 1
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 712
    array-length v2, p0
    const/4 v3, 0
    invoke-static { p0, v3, v2, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 713
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    if-lez v2, :L3
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    if-gtz v2, :L1
    goto :L3
  :L1
  .line 714
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    iget v4, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    const/16 v5, 300
    invoke-static { v2, v4, v5, v5 }, Lcom/innioasis/ipp/Art;->sample(IIII)I
    move-result v2
    iput v2, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 715
    iput-boolean v3, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 716
    array-length v2, p0
    invoke-static { p0, v3, v2, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object p0
  .line 717
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->square(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object p0
  :L2
    return-object p0
  :L3
  .line 713
    return-object v0
  :L4
  .line 718
    move-exception p0
  .line 719
    return-object v0
.end method

.method public static clear()V
  .catchall { :L0 .. :L5 } :L6
  .registers 4
  .line 319
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 320
    sget-object v0, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 321
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteClear()V
  :L0
  .line 323
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->dir()Ljava/io/File;
    move-result-object v0
  .line 324
    if-nez v0, :L1
    return-void
  :L1
  .line 325
    invoke-virtual { v0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v1
  .line 326
    if-nez v1, :L2
    return-void
  :L2
  .line 327
    const/4 v2, 0
  :L3
    array-length v3, v1
    if-ge v2, v3, :L4
    aget-object v3, v1, v2
    invoke-virtual { v3 }, Ljava/io/File;->delete()Z
    add-int/lit8 v2, v2, 1
    goto :L3
  :L4
  .line 328
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  :L5
  .line 331
    goto :L7
  :L6
  .line 329
    move-exception v0
  :L7
  .line 332
    return-void
.end method

.method public static clearMiss()V
  .registers 1
  .line 313
    sget-object v0, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 314
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteForgetNone()V
  .line 315
    return-void
.end method

.method private static dir()Ljava/io/File;
  .catchall { :L3 .. :L5 } :L7
  .registers 5
  .line 836
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 837
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 838
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 839
    if-nez v0, :L1
    return-object v1
  :L1
  .line 840
    new-instance v1, Ljava/io/File;
    const-string v2, "ipp_big"
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 841
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v0
    if-nez v0, :L2
    invoke-virtual { v1 }, Ljava/io/File;->mkdirs()Z
  :L2
  .line 842
    sget-boolean v0, Lcom/innioasis/ipp/BigCover;->swept:Z
    if-nez v0, :L8
  .line 843
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/BigCover;->swept:Z
  :L3
  .line 845
    invoke-virtual { v1 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v0
  .line 846
    if-eqz v0, :L6
  .line 847
    const/4 v2, 0
  :L4
    array-length v3, v0
    if-ge v2, v3, :L6
  .line 848
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
  .line 847
    add-int/lit8 v2, v2, 1
    goto :L4
  :L6
  .line 853
    goto :L8
  :L7
  .line 851
    move-exception v0
  :L8
  .line 855
    return-object v1
.end method

.method private static embedded(Ljava/lang/String;)[B
  .catchall { :L0 .. :L1 } :L5
  .catchall { :L1 .. :L2 } :L3
  .catchall { :L6 .. :L7 } :L8
  .registers 2
  .line 674
    new-instance v0, Landroid/media/MediaMetadataRetriever;
    invoke-direct { v0 }, Landroid/media/MediaMetadataRetriever;-><init>()V
  :L0
  .line 676
    invoke-virtual { v0, p0 }, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;)V
  .line 677
    invoke-virtual { v0 }, Landroid/media/MediaMetadataRetriever;->getEmbeddedPicture()[B
    move-result-object p0
  :L1
  .line 682
    invoke-virtual { v0 }, Landroid/media/MediaMetadataRetriever;->release()V
  :L2
  .line 685
    goto :L4
  :L3
  .line 683
    move-exception v0
  :L4
  .line 677
    return-object p0
  :L5
  .line 678
    move-exception p0
  .line 679
    nop
  :L6
  .line 682
    invoke-virtual { v0 }, Landroid/media/MediaMetadataRetriever;->release()V
  :L7
  .line 685
    goto :L9
  :L8
  .line 683
    move-exception p0
  :L9
  .line 679
    const/4 p0, 0
    return-object p0
.end method

.method private static encode(Landroid/graphics/Bitmap;I)[B
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  :L0
  .line 816
    new-instance v0, Ljava/io/ByteArrayOutputStream;
    const/16 v1, 25600
    invoke-direct { v0, v1 }, Ljava/io/ByteArrayOutputStream;-><init>(I)V
  .line 817
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;
    invoke-virtual { p0, v1, p1, v0 }, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
  .line 818
    invoke-virtual { v0 }, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    move-result-object p0
  :L1
    return-object p0
  :L2
  .line 819
    move-exception p0
  .line 820
    const/4 p0, 0
    return-object p0
.end method

.method public static endCache()V
  .registers 1
  .line 503
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/BigCover;->passing:Z
  .line 504
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  .line 505
    return-void
.end method

.method private static external(Ljava/lang/String;)[B
  .catchall { :L0 .. :L2 } :L3
  .registers 2
  .line 469
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object p0
  .line 470
    if-nez p0, :L1
    goto :L2
  :L1
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->readAll(Ljava/io/File;)[B
    move-result-object v0
  :L2
    return-object v0
  :L3
  .line 471
    move-exception p0
  .line 472
    return-object v0
.end method

.method private static file(Ljava/lang/String;)Ljava/io/File;
  .registers 5
  .line 830
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->dir()Ljava/io/File;
    move-result-object v0
  .line 831
    if-nez v0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 832
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
  .line 795
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
  .line 797
    nop
  .line 798
    nop
  .line 799
    const/16 v0, 76
    const/4 v2, 0
    const/16 v3, 92
    const/16 v4, 76
  :L1
  .line 800
    if-gt v4, v3, :L5
  .line 801
    add-int v5, v4, v3
    add-int/lit8 v5, v5, 1
    shr-int/lit8 v5, v5, 1
  .line 802
    iget-object v6, p0, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
    invoke-static { v6, v5 }, Lcom/innioasis/ipp/BigCover;->encode(Landroid/graphics/Bitmap;I)[B
    move-result-object v6
  .line 803
    if-nez v6, :L2
    goto :L5
  :L2
  .line 804
    array-length v7, v6
    if-gt v7, v1, :L3
  .line 805
    nop
  .line 806
    add-int/lit8 v4, v5, 1
    move-object v2, v6
    goto :L4
  :L3
  .line 808
    add-int/lit8 v5, v5, -1
    move v3, v5
  :L4
  .line 810
    goto :L1
  :L5
  .line 811
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
  .line 299
    if-nez p0, :L0
    return-void
  :L0
  .line 300
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Hashtable;
    invoke-virtual { v0, p0 }, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 301
    sget-object v0, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v0, p0 }, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 302
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->noteForget(Ljava/lang/String;)V
  :L1
  .line 304
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object p0
  .line 305
    if-eqz p0, :L2
    invoke-virtual { p0 }, Ljava/io/File;->delete()Z
  :L2
  .line 308
    goto :L4
  :L3
  .line 306
    move-exception p0
  :L4
  .line 309
    return-void
.end method

.method private static isJpeg([B)Z
  .registers 6
  .line 826
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
  .line 386
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
  .line 364
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
  .line 581
    const/4 v1, -1
    if-nez p0, :L0
    monitor-exit v0
    return v1
  :L0
  .line 582
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 583
    sget-object v2, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v2, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 584
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
  .line 580
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
  .line 623
    sget-object v1, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v1 }, Ljava/util/HashMap;->clear()V
  .line 624
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesLoaded:Z
  .line 625
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  :L1
  .line 627
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteFile()Ljava/io/File;
    move-result-object v1
  .line 628
    if-eqz v1, :L2
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-eqz v2, :L2
    invoke-virtual { v1 }, Ljava/io/File;->delete()Z
  :L2
  .line 631
    goto :L4
  :L3
  .line 629
    move-exception v1
  :L4
  .line 632
    monitor-exit v0
    return-void
  :L5
  .line 622
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method private static noteFile()Ljava/io/File;
  .registers 3
  .line 524
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 525
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 526
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 529
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
  .line 603
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 604
    sget-object v1, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v1, p0 }, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
    if-eqz p0, :L1
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  :L1
  .line 605
    monitor-exit v0
    return-void
  :L2
  .line 602
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
  .line 609
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 610
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 611
    sget-object v2, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v2 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v2
    invoke-interface { v2 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v2
  :L1
  .line 612
    invoke-interface { v2 }, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :L3
  .line 613
    invoke-interface { v2 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/util/Map$Entry;
  .line 614
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
  .line 615
    goto :L1
  :L3
  .line 616
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v2
  :L4
    if-eqz v2, :L5
    monitor-exit v0
    return-void
  :L5
  .line 617
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
  .line 618
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  .line 619
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  :L8
  .line 620
    monitor-exit v0
    return-void
  :L9
  .line 608
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
  .line 533
    sget-boolean v1, Lcom/innioasis/ipp/BigCover;->notesLoaded:Z
  :L1
    if-eqz v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 534
    const/4 v1, 1
  :L3
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesLoaded:Z
  :L4
  .line 536
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteFile()Ljava/io/File;
    move-result-object v1
  .line 537
    if-eqz v1, :L13
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-nez v2, :L5
    goto :L13
  :L5
  .line 538
    new-instance v2, Ljava/io/FileInputStream;
    invoke-direct { v2, v1 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 539
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->available()I
    move-result v1
    new-array v1, v1, [B
  .line 540
    invoke-virtual { v2, v1 }, Ljava/io/FileInputStream;->read([B)I
  .line 541
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 542
    new-instance v2, Ljava/lang/String;
    const-string v3, "UTF-8"
    invoke-direct { v2, v1, v3 }, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    const-string v1, "\n"
    invoke-virtual { v2, v1 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v1
  .line 543
    const/4 v2, 0
    const/4 v3, 0
  :L6
    array-length v4, v1
    if-ge v3, v4, :L12
  .line 544
    aget-object v4, v1, v3
  .line 545
    const/16 v5, 9
    invoke-virtual { v4, v5 }, Ljava/lang/String;->indexOf(I)I
    move-result v5
  :L7
  .line 546
    if-gtz v5, :L8
    goto :L11
  :L8
  .line 548
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
  .line 551
    goto :L11
  :L10
  .line 549
    move-exception v4
  :L11
  .line 543
    add-int/lit8 v3, v3, 1
    goto :L6
  :L12
  .line 555
    goto :L15
  :L13
  .line 537
    monitor-exit v0
    return-void
  :L14
  .line 553
    move-exception v1
  :L15
  .line 556
    monitor-exit v0
    return-void
  :L16
  .line 532
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
  .line 559
    sget-boolean v1, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  :L1
    if-nez v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 561
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteFile()Ljava/io/File;
    move-result-object v1
  :L3
  .line 562
    if-nez v1, :L4
    monitor-exit v0
    return-void
  :L4
  .line 563
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
  .line 564
    sget-object v3, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v3 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v3
    invoke-interface { v3 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v3
  :L5
  .line 565
    invoke-interface { v3 }, Ljava/util/Iterator;->hasNext()Z
    move-result v4
    if-eqz v4, :L7
  .line 566
    invoke-interface { v3 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/util/Map$Entry;
  .line 567
    invoke-interface { v4 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/String;
  .line 568
    if-eqz v5, :L5
    const/16 v6, 9
    invoke-virtual { v5, v6 }, Ljava/lang/String;->indexOf(I)I
    move-result v7
    if-ltz v7, :L6
    goto :L5
  :L6
  .line 569
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
  .line 570
    goto :L5
  :L7
  .line 571
    new-instance v3, Ljava/io/FileOutputStream;
    invoke-direct { v3, v1 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  .line 572
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    const-string v2, "UTF-8"
    invoke-virtual { v1, v2 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object v1
    invoke-virtual { v3, v1 }, Ljava/io/FileOutputStream;->write([B)V
  .line 573
    invoke-virtual { v3 }, Ljava/io/FileOutputStream;->close()V
  .line 574
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  :L8
  .line 577
    goto :L10
  :L9
  .line 575
    move-exception v1
  :L10
  .line 578
    monitor-exit v0
    return-void
  :L11
  .line 558
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
  .line 594
    if-nez p0, :L0
    monitor-exit v0
    return-void
  :L0
  .line 595
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 596
    sget-object v1, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
    invoke-virtual { v1, p0, v2 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 597
    if-eqz p0, :L2
    check-cast p0, Ljava/lang/Integer;
    invoke-virtual { p0 }, Ljava/lang/Integer;->intValue()I
    move-result p0
  :L1
    if-ne p0, p1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 598
    const/4 p0, 1
  :L3
    sput-boolean p0, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  .line 599
    sget-boolean p0, Lcom/innioasis/ipp/BigCover;->passing:Z
    if-nez p0, :L4
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  :L4
  .line 600
    monitor-exit v0
    return-void
  :L5
  .line 593
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method public static ownArt(Ljava/lang/String;)Z
  .registers 2
  .line 382
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
  .line 267
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 268
    sget-object v1, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Hashtable;
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  .line 269
    if-eqz v1, :L1
    check-cast v1, Landroid/graphics/Bitmap;
    return-object v1
  :L1
  .line 270
    sget-object v1, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L2
    return-object v0
  :L2
  .line 271
    nop
  :L3
  .line 273
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v1
  .line 274
    if-eqz v1, :L4
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-eqz v2, :L4
  .line 275
    invoke-virtual { v1 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object v1
  .line 276
    new-instance v2, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v2 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 277
    const/4 v3, 1
    iput-boolean v3, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 278
    invoke-static { v1, v2 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 279
    iget v3, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    if-lez v3, :L4
    iget v3, v2, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    if-lez v3, :L4
  .line 280
    iget v3, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    iget v4, v2, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    const/16 v5, 300
    invoke-static { v3, v4, v5, v5 }, Lcom/innioasis/ipp/Art;->sample(IIII)I
    move-result v3
    iput v3, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 281
    const/4 v3, 0
    iput-boolean v3, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 282
    invoke-static { v1, v2 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/BigCover;->square(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object v0
  :L4
  .line 287
    goto :L6
  :L5
  .line 285
    move-exception v1
  .line 286
    nop
  :L6
  .line 288
    if-eqz v0, :L7
    sget-object v1, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Hashtable;
    invoke-virtual { v1, p0, v0 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L7
  .line 289
    return-object v0
.end method

.method public static peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
  .registers 4
  .line 248
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 249
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 250
    if-eqz v1, :L1
    return-object v1
  :L1
  .line 251
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->note(Ljava/lang/String;)I
    move-result v1
    const/4 v2, 1
    if-eq v1, v2, :L2
    return-object v0
  :L2
  .line 252
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 253
    if-eqz v0, :L3
    sget-object v1, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Hashtable;
    invoke-virtual { v1, p0, v0 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L3
  .line 254
    return-object v0
.end method

.method public static prefetch(Ljava/util/List;I)V
  .catchall { :L0 .. :L3 } :L4
  .registers 3
  .line 185
    if-eqz p0, :L6
    if-ltz p1, :L6
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    if-lt p1, v0, :L1
    goto :L6
  :L1
  .line 186
    invoke-interface { p0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p0
  .line 187
    instance-of p1, p0, Lcom/innioasis/y1/database/Song;
    if-nez p1, :L2
    return-void
  :L2
  .line 188
    check-cast p0, Lcom/innioasis/y1/database/Song;
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->warm(Ljava/lang/String;)V
  :L3
  .line 191
    goto :L5
  :L4
  .line 189
    move-exception p0
  :L5
  .line 192
    return-void
  :L6
  .line 185
    return-void
.end method

.method public static prefetchPlaying()V
  .catchall { :L0 .. :L5 } :L6
  .registers 2
  :L0
  .line 208
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 209
    const/4 v1, 0
    if-nez v0, :L1
    move-object v0, v1
    goto :L2
  :L1
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingSong()Lcom/innioasis/y1/database/Song;
    move-result-object v0
  :L2
  .line 210
    if-nez v0, :L3
    goto :L4
  :L3
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
  :L4
    invoke-static { v1 }, Lcom/innioasis/ipp/BigCover;->warm(Ljava/lang/String;)V
  :L5
  .line 213
    goto :L7
  :L6
  .line 211
    move-exception v0
  :L7
  .line 214
    return-void
.end method

.method private static read(Ljava/lang/String;)Lcom/innioasis/ipp/BigCover$Src;
  .registers 3
  .line 656
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->bytes(Ljava/lang/String;)[B
    move-result-object p0
  .line 657
    const/4 v0, 0
    if-eqz p0, :L2
    array-length v1, p0
    if-nez v1, :L0
    goto :L2
  :L0
  .line 658
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->capped([B)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 659
    if-nez v1, :L1
    return-object v0
  :L1
  .line 660
    new-instance v0, Lcom/innioasis/ipp/BigCover$Src;
    invoke-direct { v0 }, Lcom/innioasis/ipp/BigCover$Src;-><init>()V
  .line 661
    iput-object v1, v0, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
  .line 662
    iput-object p0, v0, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
  .line 663
    return-object v0
  :L2
  .line 657
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
  .line 690
    invoke-virtual { p0 }, Ljava/io/File;->length()J
    move-result-wide v0
  .line 691
    const-wide/16 v2, 0
    const/4 v4, 0
    cmp-long v5, v0, v2
    if-lez v5, :L7
    const-wide/32 v2, 8388608
    cmp-long v5, v0, v2
    if-lez v5, :L0
    goto :L7
  :L0
  .line 692
    long-to-int v1, v0
    new-array v0, v1, [B
  .line 693
    new-instance v2, Ljava/io/FileInputStream;
    invoke-direct { v2, p0 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 695
    const/4 p0, 0
  :L1
  .line 696
    if-ge p0, v1, :L6
  .line 697
    sub-int v3, v1, p0
  :L2
    invoke-virtual { v2, v0, p0, v3 }, Ljava/io/FileInputStream;->read([BII)I
    move-result v3
  :L3
  .line 698
    if-gez v3, :L4
  .line 702
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 698
    return-object v4
  :L4
  .line 699
    add-int/2addr p0, v3
  .line 700
    goto :L1
  :L5
  .line 702
    move-exception p0
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 703
    throw p0
  :L6
  .line 702
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 703
    nop
  .line 704
    return-object v0
  :L7
  .line 691
    return-object v4
.end method

.method private static same(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Z
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 743
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
  .line 744
    move-exception p0
  .line 745
    return v0
  :L3
  .line 743
    return v0
.end method

.method private static square(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .registers 4
  .line 725
    if-nez p0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 726
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v0
  .line 727
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v1
  .line 728
    const/16 v2, 300
    if-ne v0, v1, :L1
    if-gt v0, v2, :L1
    return-object p0
  :L1
  .line 729
    invoke-static { v0, v1 }, Ljava/lang/Math;->min(II)I
    move-result v0
  .line 730
    if-lez v0, :L3
    if-le v0, v2, :L2
    goto :L3
  :L2
    move v2, v0
  :L3
  .line 731
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Cover;->square(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 732
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
  .line 751
    if-eqz p1, :L6
  :L0
    iget-object v0, p1, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
    if-nez v0, :L1
    goto :L6
  :L1
  .line 752
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->fit(Lcom/innioasis/ipp/BigCover$Src;)[B
    move-result-object v0
  .line 753
    if-nez v0, :L2
    return-void
  :L2
  .line 754
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/BigCover;->write(Ljava/lang/String;[B)Z
    move-result v0
    if-eqz v0, :L3
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Hashtable;
    iget-object p1, p1, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
    invoke-virtual { v0, p0, p1 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L3
  .line 757
    goto :L5
  :L4
  .line 755
    move-exception p0
  :L5
  .line 758
    return-void
  :L6
  .line 751
    return-void
.end method

.method private static storeSrc(Ljava/lang/String;[B)Landroid/graphics/Bitmap;
  .registers 5
  .line 482
    array-length v0, p1
    const/16 v1, 25600
    const/4 v2, 0
    if-gt v0, v1, :L0
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->isJpeg([B)Z
    move-result v0
    if-eqz v0, :L0
  .line 483
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/BigCover;->write(Ljava/lang/String;[B)Z
  .line 484
    return-object v2
  :L0
  .line 486
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->capped([B)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 487
    if-nez v0, :L1
    return-object v2
  :L1
  .line 488
    new-instance v1, Lcom/innioasis/ipp/BigCover$Src;
    invoke-direct { v1 }, Lcom/innioasis/ipp/BigCover$Src;-><init>()V
  .line 489
    iput-object v0, v1, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
  .line 490
    iput-object p1, v1, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
  .line 491
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/BigCover;->store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;)V
  .line 492
    sget-object p1, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Hashtable;
    invoke-virtual { p1, p0 }, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 493
    return-object v0
.end method

.method public static track(Ljava/lang/String;)Landroid/graphics/Bitmap;
  .catchall { :L3 .. :L6 } :L15
  .catchall { :L7 .. :L8 } :L9
  .catchall { :L11 .. :L16 } :L15
  .registers 7
  .line 122
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 123
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 124
    if-eqz v1, :L1
    return-object v1
  :L1
  .line 125
    sget-object v1, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L2
    return-object v0
  :L2
  .line 130
    sget-object v2, Lcom/innioasis/ipp/BigCover;->LOCK:Ljava/lang/Object;
    monitor-enter v2
  :L3
  .line 131
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v3
  .line 132
    if-eqz v3, :L4
    monitor-exit v2
    return-object v3
  :L4
  .line 133
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L5
    monitor-exit v2
    return-object v0
  :L5
  .line 135
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
  .line 136
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->note(Ljava/lang/String;)I
    move-result v4
    if-nez v4, :L7
    invoke-virtual { v1, p0, p0 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    monitor-exit v2
  :L6
    return-object v0
  :L7
  .line 140
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->read(Ljava/lang/String;)Lcom/innioasis/ipp/BigCover$Src;
    move-result-object v1
  :L8
  .line 143
    goto :L10
  :L9
  .line 141
    move-exception v1
  .line 142
    move-object v1, v0
  :L10
  .line 144
    if-nez v1, :L12
  :L11
  .line 145
    sget-object v1, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v1, p0, p0 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 146
    const/4 v1, 0
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 147
    monitor-exit v2
    return-object v0
  :L12
  .line 149
    iget-object v0, v1, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
  .line 151
    invoke-static { v3 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v4
  .line 152
    const/4 v5, 1
    if-nez v4, :L13
  .line 154
    invoke-static { v3, v1 }, Lcom/innioasis/ipp/BigCover;->store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;)V
  .line 155
    sget-object v1, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Hashtable;
    invoke-virtual { v1, p0, v0 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 156
    invoke-static { p0, v5 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 157
    monitor-exit v2
    return-object v0
  :L13
  .line 159
    invoke-static { v4, v0 }, Lcom/innioasis/ipp/BigCover;->same(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Z
    move-result v3
    if-eqz v3, :L14
  .line 160
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Hashtable;
    invoke-virtual { v0, p0, v4 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 161
    invoke-static { p0, v5 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 162
    monitor-exit v2
    return-object v4
  :L14
  .line 164
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/BigCover;->store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;)V
  .line 165
    sget-object v1, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Hashtable;
    invoke-virtual { v1, p0, v0 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 166
    const/4 v1, 2
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 167
    monitor-exit v2
    return-object v0
  :L15
  .line 168
    move-exception p0
    monitor-exit v2
  :L16
    throw p0
.end method

.method private static warm(Ljava/lang/String;)V
  .registers 3
  .line 222
    if-eqz p0, :L1
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Hashtable;
    invoke-virtual { v0, p0 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    if-nez v0, :L1
    sget-object v0, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v0, p0 }, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :L0
    goto :L1
  :L0
  .line 223
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/ipp/BigCover$Warm;
    invoke-direct { v1, p0 }, Lcom/innioasis/ipp/BigCover$Warm;-><init>(Ljava/lang/String;)V
    invoke-direct { v0, v1 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 224
    return-void
  :L1
  .line 222
    return-void
.end method

.method private static write(Ljava/lang/String;[B)Z
  .catchall { :L0 .. :L2 } :L5
  .catchall { :L2 .. :L3 } :L4
  .catchall { :L3 .. :L5 } :L5
  .registers 4
  .line 763
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object p0
  .line 764
    if-nez p0, :L1
    return v0
  :L1
  .line 765
    new-instance v1, Ljava/io/FileOutputStream;
    invoke-direct { v1, p0 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  :L2
  .line 767
    invoke-virtual { v1, p1 }, Ljava/io/FileOutputStream;->write([B)V
  :L3
  .line 769
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
  .line 770
    nop
  .line 771
    const/4 p0, 1
    return p0
  :L4
  .line 769
    move-exception p0
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
  .line 770
    throw p0
  :L5
  .line 772
    move-exception p0
  .line 773
    return v0
.end method
