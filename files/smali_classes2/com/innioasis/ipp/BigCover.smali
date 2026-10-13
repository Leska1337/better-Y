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
  .line 65
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
  .line 69
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/BigCover;->LOCK:Ljava/lang/Object;
  .line 416
    new-instance v0, Ljava/util/HashMap;
    invoke-direct { v0 }, Ljava/util/HashMap;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
  .line 559
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
  .line 399
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/BigCover;->passing:Z
  .line 400
    return-void
.end method

.method public static cache(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;[B)V
  .catchall { :L0 .. :L16 } :L17
  .registers 7
  .line 317
    if-eqz p1, :L19
    if-nez p0, :L0
    goto/16 :L19
  :L0
  .line 319
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->note(Ljava/lang/String;)I
    move-result v0
    const/4 v1, -1
    if-eq v0, v1, :L1
    return-void
  :L1
  .line 320
    invoke-static { p1 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  .line 321
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
  .line 322
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$102(Lcom/innioasis/ipp/BigCover$Walk;Ljava/lang/String;)Ljava/lang/String;
  .line 324
    if-eqz p2, :L3
    array-length v1, p2
    if-lez v1, :L3
    goto :L4
  :L3
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->external(Ljava/lang/String;)[B
    move-result-object p2
  :L4
  .line 325
    const/4 v1, 0
    if-eqz p2, :L15
    array-length v2, p2
    if-nez v2, :L5
    goto/16 :L15
  :L5
  .line 328
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v2
    const/4 v3, 1
    if-eqz v2, :L6
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v2
    invoke-static { v2, p2 }, Ljava/util/Arrays;->equals([B[B)Z
    move-result v2
    if-eqz v2, :L6
  .line 329
    invoke-static { p1, v3 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 330
    return-void
  :L6
  .line 333
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v2
    if-nez v2, :L9
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$300(Lcom/innioasis/ipp/BigCover$Walk;)Landroid/graphics/Bitmap;
    move-result-object v2
    if-nez v2, :L9
  .line 334
    invoke-static { v0 }, Lcom/innioasis/ipp/BigCover;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v2
  .line 335
    if-eqz v2, :L7
    invoke-virtual { v2 }, Ljava/io/File;->exists()Z
    move-result v2
    if-eqz v2, :L7
    invoke-static { v0, p2 }, Lcom/innioasis/ipp/BigCover;->sigIs(Ljava/lang/String;[B)Z
    move-result v2
    if-eqz v2, :L7
  .line 336
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/BigCover$Walk;->access$202(Lcom/innioasis/ipp/BigCover$Walk;[B)[B
  .line 337
    invoke-static { p1, v3 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 338
    return-void
  :L7
  .line 340
    invoke-static { v0 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v2
  .line 341
    if-nez v2, :L8
  .line 342
    invoke-static { v0, p2 }, Lcom/innioasis/ipp/BigCover;->storeSrc(Ljava/lang/String;[B)Landroid/graphics/Bitmap;
    move-result-object v1
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/BigCover$Walk;->access$302(Lcom/innioasis/ipp/BigCover$Walk;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .line 343
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/BigCover$Walk;->access$202(Lcom/innioasis/ipp/BigCover$Walk;[B)[B
  .line 344
    invoke-static { v0, p2 }, Lcom/innioasis/ipp/BigCover;->sigSet(Ljava/lang/String;[B)V
  .line 345
    invoke-static { p1, v3 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 346
    return-void
  :L8
  .line 348
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/BigCover$Walk;->access$302(Lcom/innioasis/ipp/BigCover$Walk;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  :L9
  .line 351
    invoke-static { p2 }, Lcom/innioasis/ipp/BigCover;->capped([B)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 352
    if-nez v0, :L10
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
    return-void
  :L10
  .line 353
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$300(Lcom/innioasis/ipp/BigCover$Walk;)Landroid/graphics/Bitmap;
    move-result-object v1
    if-nez v1, :L11
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/BigCover;->capped([B)Landroid/graphics/Bitmap;
    move-result-object v1
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/BigCover$Walk;->access$302(Lcom/innioasis/ipp/BigCover$Walk;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  :L11
  .line 354
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$300(Lcom/innioasis/ipp/BigCover$Walk;)Landroid/graphics/Bitmap;
    move-result-object v1
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/BigCover;->same(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Z
    move-result v1
    if-eqz v1, :L13
  .line 356
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover$Walk;->access$200(Lcom/innioasis/ipp/BigCover$Walk;)[B
    move-result-object v0
    if-nez v0, :L12
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/BigCover$Walk;->access$202(Lcom/innioasis/ipp/BigCover$Walk;[B)[B
  :L12
  .line 357
    invoke-static { p1, v3 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
    goto :L14
  :L13
  .line 359
    new-instance p0, Lcom/innioasis/ipp/BigCover$Src;
    invoke-direct { p0 }, Lcom/innioasis/ipp/BigCover$Src;-><init>()V
  .line 360
    iput-object v0, p0, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
  .line 361
    iput-object p2, p0, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
  .line 362
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/BigCover;->store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;)V
  .line 363
    sget-object p0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { p0, p1 }, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 364
    const/4 p0, 2
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  :L14
  .line 367
    goto :L18
  :L15
  .line 325
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  :L16
    return-void
  :L17
  .line 366
    move-exception p0
  :L18
  .line 368
    return-void
  :L19
  .line 317
    return-void
.end method

.method public static cachedFile(Ljava/lang/String;)Ljava/io/File;
  .registers 4
  .line 199
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 200
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->note(Ljava/lang/String;)I
    move-result v1
  .line 201
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
  .line 202
    if-nez p0, :L4
    move-object p0, v0
    goto :L5
  :L4
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object p0
  :L5
  .line 203
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
  .line 598
    const/4 v0, 0
  :L0
    new-instance v1, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v1 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 599
    const/4 v2, 1
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 600
    array-length v2, p0
    const/4 v3, 0
    invoke-static { p0, v3, v2, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 601
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    if-lez v2, :L3
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    if-gtz v2, :L1
    goto :L3
  :L1
  .line 602
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    iget v4, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    const/16 v5, 300
    invoke-static { v2, v4, v5, v5 }, Lcom/innioasis/ipp/Art;->sample(IIII)I
    move-result v2
    iput v2, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 603
    iput-boolean v3, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 604
    array-length v2, p0
    invoke-static { p0, v3, v2, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object p0
  .line 605
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->square(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object p0
  :L2
    return-object p0
  :L3
  .line 601
    return-object v0
  :L4
  .line 608
    move-exception p0
  .line 609
    return-object v0
  :L5
  .line 606
    move-exception p0
  .line 607
    throw p0
.end method

.method public static clear()V
  .catchall { :L0 .. :L5 } :L6
  .registers 4
  .line 257
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v0 }, Ljava/util/Map;->clear()V
  .line 258
    sget-object v0, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 259
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteClear()V
  :L0
  .line 261
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->dir()Ljava/io/File;
    move-result-object v0
  .line 262
    if-nez v0, :L1
    return-void
  :L1
  .line 263
    invoke-virtual { v0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v1
  .line 264
    if-nez v1, :L2
    return-void
  :L2
  .line 265
    const/4 v2, 0
  :L3
    array-length v3, v1
    if-ge v2, v3, :L4
    aget-object v3, v1, v2
    invoke-virtual { v3 }, Ljava/io/File;->delete()Z
    add-int/lit8 v2, v2, 1
    goto :L3
  :L4
  .line 266
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  :L5
  .line 268
    goto :L7
  :L6
  .line 267
    move-exception v0
  :L7
  .line 269
    return-void
.end method

.method public static clearMiss()V
  .registers 1
  .line 251
    sget-object v0, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 252
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteForgetNone()V
  .line 253
    return-void
.end method

.method private static dir()Ljava/io/File;
  .catchall { :L3 .. :L5 } :L7
  .registers 5
  .line 706
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 707
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 708
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 709
    if-nez v0, :L1
    return-object v1
  :L1
  .line 710
    new-instance v1, Ljava/io/File;
    const-string v2, "ipp_big"
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 711
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v0
    if-nez v0, :L2
    invoke-virtual { v1 }, Ljava/io/File;->mkdirs()Z
  :L2
  .line 712
    sget-boolean v0, Lcom/innioasis/ipp/BigCover;->swept:Z
    if-nez v0, :L8
  .line 713
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/BigCover;->swept:Z
  :L3
  .line 715
    invoke-virtual { v1 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v0
  .line 716
    if-eqz v0, :L6
  .line 717
    const/4 v2, 0
  :L4
    array-length v3, v0
    if-ge v2, v3, :L6
  .line 718
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
  .line 717
    add-int/lit8 v2, v2, 1
    goto :L4
  :L6
  .line 722
    goto :L8
  :L7
  .line 721
    move-exception v0
  :L8
  .line 724
    return-object v1
.end method

.method private static encode(Landroid/graphics/Bitmap;I)[B
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  :L0
  .line 686
    new-instance v0, Ljava/io/ByteArrayOutputStream;
    const/16 v1, 25600
    invoke-direct { v0, v1 }, Ljava/io/ByteArrayOutputStream;-><init>(I)V
  .line 687
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;
    invoke-virtual { p0, v1, p1, v0 }, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
  .line 688
    invoke-virtual { v0 }, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    move-result-object p0
  :L1
    return-object p0
  :L2
  .line 689
    move-exception p0
  .line 690
    const/4 p0, 0
    return-object p0
.end method

.method public static endCache()V
  .registers 1
  .line 403
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/BigCover;->passing:Z
  .line 404
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  .line 405
    return-void
.end method

.method private static external(Ljava/lang/String;)[B
  .catchall { :L0 .. :L2 } :L3
  .registers 3
  .line 373
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v1
  .line 374
    if-nez v1, :L1
    return-object v0
  :L1
  .line 375
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->stampRead(Ljava/lang/String;)V
  .line 376
    invoke-static { v1 }, Lcom/innioasis/ipp/BigCover;->readAll(Ljava/io/File;)[B
    move-result-object p0
  :L2
    return-object p0
  :L3
  .line 377
    move-exception p0
  .line 378
    return-object v0
.end method

.method private static file(Ljava/lang/String;)Ljava/io/File;
  .registers 5
  .line 700
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->dir()Ljava/io/File;
    move-result-object v0
  .line 701
    if-nez v0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 702
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
  .line 665
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
  .line 667
    nop
  .line 668
    nop
  .line 669
    const/16 v0, 76
    const/4 v2, 0
    const/16 v3, 92
    const/16 v4, 76
  :L1
  .line 670
    if-gt v4, v3, :L5
  .line 671
    add-int v5, v4, v3
    add-int/lit8 v5, v5, 1
    shr-int/lit8 v5, v5, 1
  .line 672
    iget-object v6, p0, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
    invoke-static { v6, v5 }, Lcom/innioasis/ipp/BigCover;->encode(Landroid/graphics/Bitmap;I)[B
    move-result-object v6
  .line 673
    if-nez v6, :L2
    goto :L5
  :L2
  .line 674
    array-length v7, v6
    if-gt v7, v1, :L3
  .line 675
    nop
  .line 676
    add-int/lit8 v4, v5, 1
    move-object v2, v6
    goto :L4
  :L3
  .line 678
    add-int/lit8 v5, v5, -1
    move v3, v5
  :L4
  .line 680
    goto :L1
  :L5
  .line 681
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
  .line 238
    if-nez p0, :L0
    return-void
  :L0
  .line 239
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v0, p0 }, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 240
    sget-object v0, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v0, p0 }, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 241
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->noteForget(Ljava/lang/String;)V
  :L1
  .line 243
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object p0
  .line 244
    if-eqz p0, :L2
    invoke-virtual { p0 }, Ljava/io/File;->delete()Z
  :L2
  .line 246
    goto :L4
  :L3
  .line 245
    move-exception p0
  :L4
  .line 247
    return-void
.end method

.method private static isJpeg([B)Z
  .registers 6
  .line 696
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
  .line 307
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
  .line 294
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
  .line 475
    const/4 v1, -1
    if-nez p0, :L0
    monitor-exit v0
    return v1
  :L0
  .line 476
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 477
    sget-object v2, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v2, p0 }, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 478
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
  .line 474
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
  .line 543
    sget-object v1, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v1 }, Ljava/util/HashMap;->clear()V
  .line 544
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesLoaded:Z
  .line 545
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  :L1
  .line 547
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteFile()Ljava/io/File;
    move-result-object v1
  .line 548
    if-eqz v1, :L2
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-eqz v2, :L2
    invoke-virtual { v1 }, Ljava/io/File;->delete()Z
  :L2
  .line 550
    goto :L4
  :L3
  .line 549
    move-exception v1
  :L4
  .line 551
    monitor-exit v0
    return-void
  :L5
  .line 542
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method private static noteFile()Ljava/io/File;
  .registers 3
  .line 422
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 423
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 424
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 426
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
  .line 492
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 493
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
  .line 494
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
  .line 495
    if-eqz v2, :L4
    sput-boolean v3, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  :L4
  .line 496
    monitor-exit v0
    return-void
  :L5
  .line 491
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
  .line 500
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 501
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 502
    sget-object v2, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v2 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v2
    invoke-interface { v2 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v2
  :L1
  .line 503
    invoke-interface { v2 }, Ljava/util/Iterator;->hasNext()Z
    move-result v3
    if-eqz v3, :L4
  .line 504
    invoke-interface { v2 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/util/Map$Entry;
  .line 505
    invoke-interface { v3 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
    const-string v5, "\u0001"
    invoke-virtual { v4, v5 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :L2
    goto :L1
  :L2
  .line 506
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
  .line 507
    goto :L1
  :L4
  .line 508
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result v2
  :L5
    if-eqz v2, :L6
    monitor-exit v0
    return-void
  :L6
  .line 509
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
  .line 510
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  .line 511
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  :L9
  .line 512
    monitor-exit v0
    return-void
  :L10
  .line 499
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
  .line 430
    sget-boolean v1, Lcom/innioasis/ipp/BigCover;->notesLoaded:Z
  :L1
    if-eqz v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 431
    const/4 v1, 1
  :L3
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesLoaded:Z
  :L4
  .line 433
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteFile()Ljava/io/File;
    move-result-object v1
  .line 434
    if-eqz v1, :L13
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-nez v2, :L5
    goto :L13
  :L5
  .line 435
    new-instance v2, Ljava/io/FileInputStream;
    invoke-direct { v2, v1 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 436
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->available()I
    move-result v1
    new-array v1, v1, [B
  .line 437
    invoke-virtual { v2, v1 }, Ljava/io/FileInputStream;->read([B)I
  .line 438
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 439
    new-instance v2, Ljava/lang/String;
    const-string v3, "UTF-8"
    invoke-direct { v2, v1, v3 }, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    const-string v1, "\n"
    invoke-virtual { v2, v1 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v1
  .line 440
    const/4 v2, 0
    const/4 v3, 0
  :L6
    array-length v4, v1
    if-ge v3, v4, :L12
  .line 441
    aget-object v4, v1, v3
  .line 442
    const/16 v5, 9
    invoke-virtual { v4, v5 }, Ljava/lang/String;->indexOf(I)I
    move-result v5
  :L7
  .line 443
    if-gtz v5, :L8
    goto :L11
  :L8
  .line 445
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
  .line 447
    goto :L11
  :L10
  .line 446
    move-exception v4
  :L11
  .line 440
    add-int/lit8 v3, v3, 1
    goto :L6
  :L12
  .line 450
    goto :L15
  :L13
  .line 434
    monitor-exit v0
    return-void
  :L14
  .line 449
    move-exception v1
  :L15
  .line 451
    monitor-exit v0
    return-void
  :L16
  .line 429
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
  .line 454
    sget-boolean v1, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  :L1
    if-nez v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 456
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteFile()Ljava/io/File;
    move-result-object v1
  :L3
  .line 457
    if-nez v1, :L4
    monitor-exit v0
    return-void
  :L4
  .line 458
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
  .line 459
    sget-object v3, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-virtual { v3 }, Ljava/util/HashMap;->entrySet()Ljava/util/Set;
    move-result-object v3
    invoke-interface { v3 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v3
  :L5
  .line 460
    invoke-interface { v3 }, Ljava/util/Iterator;->hasNext()Z
    move-result v4
    if-eqz v4, :L7
  .line 461
    invoke-interface { v3 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/util/Map$Entry;
  .line 462
    invoke-interface { v4 }, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/String;
  .line 463
    if-eqz v5, :L5
    const/16 v6, 9
    invoke-virtual { v5, v6 }, Ljava/lang/String;->indexOf(I)I
    move-result v7
    if-ltz v7, :L6
    goto :L5
  :L6
  .line 464
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
  .line 465
    goto :L5
  :L7
  .line 466
    new-instance v3, Ljava/io/FileOutputStream;
    invoke-direct { v3, v1 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  .line 467
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    const-string v2, "UTF-8"
    invoke-virtual { v1, v2 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object v1
    invoke-virtual { v3, v1 }, Ljava/io/FileOutputStream;->write([B)V
  .line 468
    invoke-virtual { v3 }, Ljava/io/FileOutputStream;->close()V
  .line 469
    const/4 v1, 0
    sput-boolean v1, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  :L8
  .line 471
    goto :L10
  :L9
  .line 470
    move-exception v1
  :L10
  .line 472
    monitor-exit v0
    return-void
  :L11
  .line 453
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
  .line 483
    if-nez p0, :L0
    monitor-exit v0
    return-void
  :L0
  .line 484
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 485
    sget-object v1, Lcom/innioasis/ipp/BigCover;->notes:Ljava/util/HashMap;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
    invoke-virtual { v1, p0, v2 }, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p0
  .line 486
    if-eqz p0, :L2
    check-cast p0, Ljava/lang/Integer;
    invoke-virtual { p0 }, Ljava/lang/Integer;->intValue()I
    move-result p0
  :L1
    if-ne p0, p1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 487
    const/4 p0, 1
  :L3
    sput-boolean p0, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  .line 488
    sget-boolean p0, Lcom/innioasis/ipp/BigCover;->passing:Z
    if-nez p0, :L4
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  :L4
  .line 489
    monitor-exit v0
    return-void
  :L5
  .line 482
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method public static ownArt(Ljava/lang/String;)Z
  .registers 2
  .line 299
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
  .line 211
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 212
    sget-object v1, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v1, p0 }, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
  .line 213
    if-eqz v1, :L1
    check-cast v1, Landroid/graphics/Bitmap;
    return-object v1
  :L1
  .line 214
    sget-object v1, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L2
    return-object v0
  :L2
  .line 215
    nop
  :L3
  .line 217
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v1
  .line 218
    if-eqz v1, :L4
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-eqz v2, :L4
  .line 219
    invoke-virtual { v1 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object v1
  .line 220
    new-instance v2, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v2 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 221
    const/4 v3, 1
    iput-boolean v3, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 222
    invoke-static { v1, v2 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 223
    iget v3, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    if-lez v3, :L4
    iget v3, v2, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    if-lez v3, :L4
  .line 224
    iget v3, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    iget v4, v2, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    const/16 v5, 300
    invoke-static { v3, v4, v5, v5 }, Lcom/innioasis/ipp/Art;->sample(IIII)I
    move-result v3
    iput v3, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 225
    const/4 v3, 0
    iput-boolean v3, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 226
    invoke-static { v1, v2 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object v1
    invoke-static { v1 }, Lcom/innioasis/ipp/BigCover;->square(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object v0
  :L4
  .line 231
    goto :L6
  :L5
  .line 229
    move-exception v1
  .line 230
    nop
  :L6
  .line 232
    if-eqz v0, :L7
    sget-object v1, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v1, p0, v0 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L7
  .line 233
    return-object v0
.end method

.method public static peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
  .registers 4
  .line 188
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 189
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 190
    if-eqz v1, :L1
    return-object v1
  :L1
  .line 191
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->note(Ljava/lang/String;)I
    move-result v1
    const/4 v2, 1
    if-eq v1, v2, :L2
    return-object v0
  :L2
  .line 192
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 193
    if-eqz v0, :L3
    sget-object v1, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v1, p0, v0 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L3
  .line 194
    return-object v0
.end method

.method public static prefetch(Ljava/util/List;I)V
  .catchall { :L0 .. :L3 } :L4
  .registers 3
  .line 130
    if-eqz p0, :L6
    if-ltz p1, :L6
  :L0
    invoke-interface { p0 }, Ljava/util/List;->size()I
    move-result v0
    if-lt p1, v0, :L1
    goto :L6
  :L1
  .line 131
    invoke-interface { p0, p1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object p0
  .line 132
    instance-of p1, p0, Lcom/innioasis/y1/database/Song;
    if-nez p1, :L2
    return-void
  :L2
  .line 133
    move-object p1, p0
    check-cast p1, Lcom/innioasis/y1/database/Song;
    invoke-virtual { p1 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Ahead;->picked(Ljava/lang/String;)V
  .line 134
    check-cast p0, Lcom/innioasis/y1/database/Song;
    invoke-virtual { p0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->warm(Ljava/lang/String;)V
  :L3
  .line 136
    goto :L5
  :L4
  .line 135
    move-exception p0
  :L5
  .line 137
    return-void
  :L6
  .line 130
    return-void
.end method

.method public static prefetchPlaying()V
  .catchall { :L0 .. :L5 } :L6
  .registers 2
  :L0
  .line 147
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getPlayerService()Lcom/innioasis/y1/service/PlayerService;
    move-result-object v0
  .line 148
    const/4 v1, 0
    if-nez v0, :L1
    move-object v0, v1
    goto :L2
  :L1
    invoke-virtual { v0 }, Lcom/innioasis/y1/service/PlayerService;->getPlayingSong()Lcom/innioasis/y1/database/Song;
    move-result-object v0
  :L2
  .line 149
    if-nez v0, :L3
    goto :L4
  :L3
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
  :L4
    invoke-static { v1 }, Lcom/innioasis/ipp/BigCover;->warm(Ljava/lang/String;)V
  .line 150
    invoke-static { }, Lcom/innioasis/ipp/Queue;->nextPath()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/BigCover;->warm(Ljava/lang/String;)V
  :L5
  .line 152
    goto :L7
  :L6
  .line 151
    move-exception v0
  :L7
  .line 153
    return-void
.end method

.method private static read(Ljava/lang/String;)Lcom/innioasis/ipp/BigCover$Src;
  .registers 4
  .line 566
    const/4 v0, 1
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Meta;->read(Ljava/lang/String;Z)Lcom/innioasis/ipp/Meta$Info;
    move-result-object v0
  .line 567
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
  .line 568
    const/4 v1, 0
    if-eqz p0, :L4
    array-length v2, p0
    if-nez v2, :L2
    goto :L4
  :L2
  .line 569
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->capped([B)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 570
    if-nez v0, :L3
    return-object v1
  :L3
  .line 571
    new-instance v1, Lcom/innioasis/ipp/BigCover$Src;
    invoke-direct { v1 }, Lcom/innioasis/ipp/BigCover$Src;-><init>()V
  .line 572
    iput-object v0, v1, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
  .line 573
    iput-object p0, v1, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
  .line 574
    return-object v1
  :L4
  .line 568
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
  .line 578
    invoke-virtual { p0 }, Ljava/io/File;->length()J
    move-result-wide v0
  .line 579
    const-wide/16 v2, 0
    const/4 v4, 0
    cmp-long v5, v0, v2
    if-lez v5, :L7
    const-wide/32 v2, 8388608
    cmp-long v5, v0, v2
    if-lez v5, :L0
    goto :L7
  :L0
  .line 580
    long-to-int v1, v0
    new-array v0, v1, [B
  .line 581
    new-instance v2, Ljava/io/FileInputStream;
    invoke-direct { v2, p0 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 583
    const/4 p0, 0
  :L1
  .line 584
    if-ge p0, v1, :L6
  .line 585
    sub-int v3, v1, p0
  :L2
    invoke-virtual { v2, v0, p0, v3 }, Ljava/io/FileInputStream;->read([BII)I
    move-result v3
  :L3
  .line 586
    if-gez v3, :L4
  .line 590
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 586
    return-object v4
  :L4
  .line 587
    add-int/2addr p0, v3
  .line 588
    goto :L1
  :L5
  .line 590
    move-exception p0
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 591
    throw p0
  :L6
  .line 590
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 591
    nop
  .line 592
    return-object v0
  :L7
  .line 579
    return-object v4
.end method

.method private static same(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Z
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 628
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
  .line 629
    move-exception p0
  .line 630
    return v0
  :L3
  .line 628
    return v0
.end method

.method private static sig([B)I
  .registers 4
  .line 521
    new-instance v0, Ljava/util/zip/CRC32;
    invoke-direct { v0 }, Ljava/util/zip/CRC32;-><init>()V
  .line 522
    const/4 v1, 0
    array-length v2, p0
    invoke-virtual { v0, p0, v1, v2 }, Ljava/util/zip/CRC32;->update([BII)V
  .line 523
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
  .line 536
    const/4 v1, 0
    if-eqz p0, :L4
    if-nez p1, :L0
    goto :L4
  :L0
  .line 537
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 538
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
  .line 539
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
  .line 535
    move-exception p0
    monitor-exit v0
    throw p0
  :L4
  .line 536
    monitor-exit v0
    return v1
.end method

.method private static declared-synchronized sigSet(Ljava/lang/String;[B)V
  .catchall { :L0 .. :L1 } :L5
  .catchall { :L3 .. :L4 } :L5
  .registers 6
    const-class v0, Lcom/innioasis/ipp/BigCover;
    monitor-enter v0
  .line 527
    if-eqz p0, :L6
    if-nez p1, :L0
    goto :L6
  :L0
  .line 528
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteLoad()V
  .line 529
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->sig([B)I
    move-result p1
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
  .line 530
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
  .line 531
    const/4 p0, 1
  :L3
    sput-boolean p0, Lcom/innioasis/ipp/BigCover;->notesDirty:Z
  .line 532
    sget-boolean p0, Lcom/innioasis/ipp/BigCover;->passing:Z
    if-nez p0, :L4
    invoke-static { }, Lcom/innioasis/ipp/BigCover;->noteSave()V
  :L4
  .line 533
    monitor-exit v0
    return-void
  :L5
  .line 526
    move-exception p0
    monitor-exit v0
    throw p0
  :L6
  .line 527
    monitor-exit v0
    return-void
.end method

.method private static square(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .registers 4
  .line 615
    if-nez p0, :L0
    const/4 p0, 0
    return-object p0
  :L0
  .line 616
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v0
  .line 617
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v1
  .line 618
    const/16 v2, 300
    if-ne v0, v1, :L1
    if-gt v0, v2, :L1
    return-object p0
  :L1
  .line 619
    invoke-static { v0, v1 }, Ljava/lang/Math;->min(II)I
    move-result v0
  .line 620
    if-lez v0, :L3
    if-le v0, v2, :L2
    goto :L3
  :L2
    move v2, v0
  :L3
  .line 621
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Cover;->square(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 622
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
  .line 636
    if-eqz p1, :L6
  :L0
    iget-object v0, p1, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
    if-nez v0, :L1
    goto :L6
  :L1
  .line 637
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->fit(Lcom/innioasis/ipp/BigCover$Src;)[B
    move-result-object v0
  .line 638
    if-nez v0, :L2
    return-void
  :L2
  .line 639
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/BigCover;->write(Ljava/lang/String;[B)Z
    move-result v0
    if-eqz v0, :L3
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    iget-object p1, p1, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
    invoke-interface { v0, p0, p1 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L3
  .line 641
    goto :L5
  :L4
  .line 640
    move-exception p0
  :L5
  .line 642
    return-void
  :L6
  .line 636
    return-void
.end method

.method private static storeSrc(Ljava/lang/String;[B)Landroid/graphics/Bitmap;
  .registers 5
  .line 384
    array-length v0, p1
    const/16 v1, 25600
    const/4 v2, 0
    if-gt v0, v1, :L0
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->isJpeg([B)Z
    move-result v0
    if-eqz v0, :L0
  .line 385
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/BigCover;->write(Ljava/lang/String;[B)Z
  .line 386
    return-object v2
  :L0
  .line 388
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->capped([B)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 389
    if-nez v0, :L1
    return-object v2
  :L1
  .line 390
    new-instance v1, Lcom/innioasis/ipp/BigCover$Src;
    invoke-direct { v1 }, Lcom/innioasis/ipp/BigCover$Src;-><init>()V
  .line 391
    iput-object v0, v1, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
  .line 392
    iput-object p1, v1, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
  .line 393
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/BigCover;->store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;)V
  .line 394
    sget-object p1, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { p1, p0 }, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 395
    return-object v0
.end method

.method public static track(Ljava/lang/String;)Landroid/graphics/Bitmap;
  .catchall { :L3 .. :L6 } :L17
  .catch Ljava/lang/OutOfMemoryError; { :L7 .. :L8 } :L16
  .catchall { :L7 .. :L8 } :L9
  .catchall { :L10 .. :L18 } :L17
  .registers 8
  .line 73
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 74
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 75
    if-eqz v1, :L1
    return-object v1
  :L1
  .line 76
    sget-object v1, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L2
    return-object v0
  :L2
  .line 79
    sget-object v2, Lcom/innioasis/ipp/BigCover;->LOCK:Ljava/lang/Object;
    monitor-enter v2
  :L3
  .line 80
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v3
  .line 81
    if-eqz v3, :L4
    monitor-exit v2
    return-object v3
  :L4
  .line 82
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z
    move-result v3
    if-eqz v3, :L5
    monitor-exit v2
    return-object v0
  :L5
  .line 84
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
  .line 85
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->note(Ljava/lang/String;)I
    move-result v4
    if-nez v4, :L7
    invoke-virtual { v1, p0, p0 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    monitor-exit v2
  :L6
    return-object v0
  :L7
  .line 89
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->read(Ljava/lang/String;)Lcom/innioasis/ipp/BigCover$Src;
    move-result-object v1
  :L8
  .line 94
    goto :L10
  :L9
  .line 92
    move-exception v1
  .line 93
    move-object v1, v0
  :L10
  .line 95
    sget-object v4, Lcom/innioasis/ipp/BigCover;->UNREAD:Lcom/innioasis/ipp/BigCover$Src;
    if-ne v1, v4, :L11
    monitor-exit v2
    return-object v0
  :L11
  .line 96
    if-nez v1, :L12
  .line 97
    sget-object v1, Lcom/innioasis/ipp/BigCover;->miss:Ljava/util/Hashtable;
    invoke-virtual { v1, p0, p0 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 98
    const/4 v1, 0
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 99
    monitor-exit v2
    return-object v0
  :L12
  .line 101
    iget-object v0, v1, Lcom/innioasis/ipp/BigCover$Src;->bmp:Landroid/graphics/Bitmap;
  .line 103
    invoke-static { v3 }, Lcom/innioasis/ipp/BigCover;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v4
  .line 104
    const/4 v5, 1
    if-nez v4, :L13
  .line 105
    invoke-static { v3, v1 }, Lcom/innioasis/ipp/BigCover;->store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;)V
  .line 106
    iget-object v1, v1, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
    invoke-static { v3, v1 }, Lcom/innioasis/ipp/BigCover;->sigSet(Ljava/lang/String;[B)V
  .line 107
    sget-object v1, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v1, p0, v0 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 108
    invoke-static { p0, v5 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 109
    monitor-exit v2
    return-object v0
  :L13
  .line 111
    iget-object v6, v1, Lcom/innioasis/ipp/BigCover$Src;->raw:[B
    invoke-static { v3, v6 }, Lcom/innioasis/ipp/BigCover;->sigIs(Ljava/lang/String;[B)Z
    move-result v3
    if-nez v3, :L15
    invoke-static { v4, v0 }, Lcom/innioasis/ipp/BigCover;->same(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Z
    move-result v3
    if-eqz v3, :L14
    goto :L15
  :L14
  .line 116
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/BigCover;->store(Ljava/lang/String;Lcom/innioasis/ipp/BigCover$Src;)V
  .line 117
    sget-object v1, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v1, p0, v0 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 118
    const/4 v1, 2
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 119
    monitor-exit v2
    return-object v0
  :L15
  .line 112
    sget-object v0, Lcom/innioasis/ipp/BigCover;->mem:Ljava/util/Map;
    invoke-interface { v0, p0, v4 }, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 113
    invoke-static { p0, v5 }, Lcom/innioasis/ipp/BigCover;->noteSet(Ljava/lang/String;I)V
  .line 114
    monitor-exit v2
    return-object v4
  :L16
  .line 90
    move-exception p0
  .line 91
    monitor-exit v2
    return-object v0
  :L17
  .line 120
    move-exception p0
    monitor-exit v2
  :L18
    throw p0
.end method

.method private static warm(Ljava/lang/String;)V
  .registers 3
  .line 157
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
  .line 158
    sget-object v0, Lcom/innioasis/ipp/BigCover;->worker:Landroid/os/Handler;
    if-nez v0, :L1
  .line 159
    new-instance v0, Landroid/os/HandlerThread;
    const-string v1, "ipp-cover"
    invoke-direct { v0, v1 }, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V
  .line 160
    invoke-virtual { v0 }, Landroid/os/HandlerThread;->start()V
  .line 161
    new-instance v1, Landroid/os/Handler;
    invoke-virtual { v0 }, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;
    move-result-object v0
    invoke-direct { v1, v0 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    sput-object v1, Lcom/innioasis/ipp/BigCover;->worker:Landroid/os/Handler;
  :L1
  .line 163
    sget-object v0, Lcom/innioasis/ipp/BigCover;->worker:Landroid/os/Handler;
    new-instance v1, Lcom/innioasis/ipp/BigCover$Warm;
    invoke-direct { v1, p0 }, Lcom/innioasis/ipp/BigCover$Warm;-><init>(Ljava/lang/String;)V
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 164
    return-void
  :L2
  .line 157
    return-void
.end method

.method private static write(Ljava/lang/String;[B)Z
  .catchall { :L0 .. :L2 } :L5
  .catchall { :L2 .. :L3 } :L4
  .catchall { :L3 .. :L5 } :L5
  .registers 4
  .line 646
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object p0
  .line 647
    if-nez p0, :L1
    return v0
  :L1
  .line 648
    new-instance v1, Ljava/io/FileOutputStream;
    invoke-direct { v1, p0 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  :L2
  .line 650
    invoke-virtual { v1, p1 }, Ljava/io/FileOutputStream;->write([B)V
  :L3
  .line 652
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
  .line 653
    nop
  .line 654
    const/4 p0, 1
    return p0
  :L4
  .line 652
    move-exception p0
    invoke-virtual { v1 }, Ljava/io/FileOutputStream;->close()V
  .line 653
    throw p0
  :L5
  .line 655
    move-exception p0
  .line 656
    return v0
.end method
