.class public final Lcom/innioasis/ipp/Art;
.super Ljava/lang/Object;
.source "Art.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Art$Hint;
  }
.end annotation

.field public final static COVER_CHANGED:I = 2

.field public final static COVER_NEW:I = 1

.field public final static COVER_SAME:I = 0

.field private final static NONE:Ljava/lang/String; = ""

.field private final static NO_ART:[B

.field private final static OWN:[Ljava/lang/String;

.field private final static OWN_THUMB:[Ljava/lang/String;

.field private final static PICK:Ljava/lang/String; = "thumb\u0001"

.field private final static SEP:C = '\t'

.field private final static UP:[Ljava/lang/String;

.field private final static chain:Ljava/util/Hashtable;

.field private final static hint:Ljava/lang/ThreadLocal;

.field private final static seen:Ljava/util/Hashtable;

.field private final static stamps:Ljava/util/Hashtable;

.field private static stampsDirty:Z

.field private static stampsLoaded:Z

.method static constructor <clinit>()V
  .registers 14
  .line 60
    const/4 v0, 6
    new-array v1, v0, [Ljava/lang/String;
    const/4 v2, 0
    const-string v3, "cover.jpg"
    aput-object v3, v1, v2
    const/4 v4, 1
    const-string v5, "cover.jpeg"
    aput-object v5, v1, v4
    const/4 v6, 2
    const-string v7, "cover.png"
    aput-object v7, v1, v6
    const/4 v8, 3
    const-string v9, "folder.jpg"
    aput-object v9, v1, v8
    const/4 v10, 4
    const-string v11, "folder.jpeg"
    aput-object v11, v1, v10
    const/4 v12, 5
    const-string v13, "folder.png"
    aput-object v13, v1, v12
    sput-object v1, Lcom/innioasis/ipp/Art;->OWN:[Ljava/lang/String;
  .line 71
    new-array v0, v0, [Ljava/lang/String;
    aput-object v9, v0, v2
    aput-object v11, v0, v4
    aput-object v13, v0, v6
    aput-object v3, v0, v8
    aput-object v5, v0, v10
    aput-object v7, v0, v12
    sput-object v0, Lcom/innioasis/ipp/Art;->OWN_THUMB:[Ljava/lang/String;
  .line 77
    new-array v0, v8, [Ljava/lang/String;
    aput-object v9, v0, v2
    aput-object v11, v0, v4
    aput-object v13, v0, v6
    sput-object v0, Lcom/innioasis/ipp/Art;->UP:[Ljava/lang/String;
  .line 85
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Art;->chain:Ljava/util/Hashtable;
  .line 184
    new-instance v0, Ljava/lang/ThreadLocal;
    invoke-direct { v0 }, Ljava/lang/ThreadLocal;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Art;->hint:Ljava/lang/ThreadLocal;
  .line 186
    new-array v0, v2, [B
    sput-object v0, Lcom/innioasis/ipp/Art;->NO_ART:[B
  .line 295
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Art;->stamps:Ljava/util/Hashtable;
  .line 297
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Art;->seen:Ljava/util/Hashtable;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 57
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static albumKey(Lcom/innioasis/music/adapter/MyBaseAdapter;)Ljava/lang/String;
  .registers 3
  .line 522
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 523
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v1
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object p0
  .line 524
    instance-of v1, p0, Lcom/innioasis/music/data/Album;
    if-eqz v1, :L1
    check-cast p0, Lcom/innioasis/music/data/Album;
    invoke-virtual { p0 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
  :L1
    return-object v0
.end method

.method private static chain(Ljava/io/File;)Ljava/lang/String;
  .registers 6
  .line 255
    const-string v0, ""
    if-nez p0, :L0
    return-object v0
  :L0
  .line 256
    invoke-virtual { p0 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object v1
  .line 257
    sget-object v2, Lcom/innioasis/ipp/Art;->chain:Ljava/util/Hashtable;
    invoke-virtual { v2, v1 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
  .line 258
    if-eqz v2, :L1
    check-cast v2, Ljava/lang/String;
    return-object v2
  :L1
  .line 260
    nop
  .line 261
    const/4 v2, 0
  :L2
    sget-object v3, Lcom/innioasis/ipp/Art;->UP:[Ljava/lang/String;
    array-length v4, v3
    if-ge v2, v4, :L4
  .line 262
    new-instance v4, Ljava/io/File;
    aget-object v3, v3, v2
    invoke-direct { v4, p0, v3 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 263
    invoke-virtual { v4 }, Ljava/io/File;->isFile()Z
    move-result v3
    if-eqz v3, :L3
    invoke-virtual { v4 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object v0
    goto :L4
  :L3
  .line 261
    add-int/lit8 v2, v2, 1
    goto :L2
  :L4
  .line 265
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v2
    if-nez v2, :L5
    invoke-virtual { p0 }, Ljava/io/File;->getParentFile()Ljava/io/File;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->chain(Ljava/io/File;)Ljava/lang/String;
    move-result-object v0
  :L5
  .line 266
    sget-object p0, Lcom/innioasis/ipp/Art;->chain:Ljava/util/Hashtable;
    invoke-virtual { p0, v1, v0 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 267
    return-object v0
.end method

.method public static clear()V
  .registers 1
  .line 276
    sget-object v0, Lcom/innioasis/ipp/Art;->chain:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 277
    return-void
.end method

.method public static clearStamps()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 375
    sget-object v0, Lcom/innioasis/ipp/Art;->chain:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 376
    sget-object v0, Lcom/innioasis/ipp/Art;->stamps:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 377
    sget-object v0, Lcom/innioasis/ipp/Art;->seen:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 378
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Art;->stampsLoaded:Z
  .line 379
    sput-boolean v0, Lcom/innioasis/ipp/Art;->stampsDirty:Z
  :L0
  .line 381
    invoke-static { }, Lcom/innioasis/ipp/Art;->stampFile()Ljava/io/File;
    move-result-object v0
  .line 382
    if-eqz v0, :L1
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v1
    if-eqz v1, :L1
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  :L1
  .line 385
    goto :L3
  :L2
  .line 383
    move-exception v0
  :L3
  .line 386
    return-void
.end method

.method public static coverChanged(Ljava/lang/String;)Z
  .registers 1
  .line 311
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->coverState(Ljava/lang/String;)I
    move-result p0
    if-eqz p0, :L0
    const/4 p0, 1
    goto :L1
  :L0
    const/4 p0, 0
  :L1
    return p0
.end method

.method public static coverState(Ljava/lang/String;)I
  .catchall { :L0 .. :L10 } :L12
  .registers 9
  .line 331
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 332
    if-eqz p0, :L11
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-nez v1, :L1
    goto :L11
  :L1
  .line 333
    sget-object v1, Lcom/innioasis/ipp/Art;->seen:Ljava/util/Hashtable;
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
  .line 334
    if-eqz v2, :L2
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result p0
    return p0
  :L2
  .line 336
    invoke-static { }, Lcom/innioasis/ipp/Art;->loadStamps()V
  .line 337
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->stamp(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 338
    sget-object v3, Lcom/innioasis/ipp/Art;->stamps:Ljava/util/Hashtable;
    invoke-virtual { v3, p0 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
  .line 340
    invoke-virtual { v2 }, Ljava/lang/String;->length()I
    move-result v5
    const/4 v6, 2
    const/4 v7, 1
    if-nez v5, :L6
  .line 344
    if-eqz v4, :L3
    goto :L4
  :L3
    const/4 v6, 0
  :L4
  .line 345
    if-eqz v4, :L5
  .line 346
    invoke-virtual { v3, p0 }, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 347
    sput-boolean v7, Lcom/innioasis/ipp/Art;->stampsDirty:Z
  :L5
  .line 360
    move v7, v6
    goto :L9
  :L6
  .line 349
    if-nez v4, :L7
  .line 350
    nop
  .line 351
    invoke-virtual { v3, p0, v2 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 352
    sput-boolean v7, Lcom/innioasis/ipp/Art;->stampsDirty:Z
    goto :L9
  :L7
  .line 354
    invoke-virtual { v2, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :L8
    const/4 v6, 0
  :L8
  .line 355
    if-eqz v6, :L5
  .line 356
    invoke-virtual { v3, p0, v2 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 357
    sput-boolean v7, Lcom/innioasis/ipp/Art;->stampsDirty:Z
    goto :L5
  :L9
  .line 360
    invoke-static { v7 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
    invoke-virtual { v1, p0, v2 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L10
  .line 361
    return v7
  :L11
  .line 332
    return v0
  :L12
  .line 362
    move-exception p0
  .line 363
    return v0
.end method

.method private static decode(Ljava/io/File;II)Landroid/graphics/Bitmap;
  .registers 6
  .line 620
    if-lez p1, :L1
    if-gtz p2, :L0
    goto :L1
  :L0
  .line 621
    new-instance v0, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v0 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 622
    const/4 v1, 1
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 623
    invoke-virtual { p0 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object v1
    invoke-static { v1, v0 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 624
    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    invoke-static { v1, v2, p1, p2 }, Lcom/innioasis/ipp/Art;->sample(IIII)I
    move-result p1
    iput p1, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 625
    const/4 p1, 0
    iput-boolean p1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 626
    invoke-virtual { p0 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0, v0 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
  :L1
  .line 620
    invoke-virtual { p0 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
.end method

.method private static decode([BII)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L3 } :L5
  .registers 8
  .line 224
    const/4 v0, 0
    if-eqz p0, :L6
  :L0
    array-length v1, p0
    if-nez v1, :L1
    goto :L6
  :L1
  .line 225
    new-instance v1, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v1 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 226
    const/4 v2, 1
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 227
    array-length v2, p0
    const/4 v3, 0
    invoke-static { p0, v3, v2, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 228
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    if-lez v2, :L4
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    if-gtz v2, :L2
    goto :L4
  :L2
  .line 229
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    iget v4, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    invoke-static { v2, v4, p1, p2 }, Lcom/innioasis/ipp/Art;->sample(IIII)I
    move-result p1
    iput p1, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 230
    iput-boolean v3, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 231
    array-length p1, p0
    invoke-static { p0, v3, p1, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object p0
  :L3
    return-object p0
  :L4
  .line 228
    return-object v0
  :L5
  .line 232
    move-exception p0
  .line 233
    return-object v0
  :L6
  .line 224
    return-object v0
.end method

.method public static external(Ljava/lang/String;II)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L3 } :L4
  .registers 5
  .line 98
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Meta;->tagArt(Ljava/lang/String;)[B
    move-result-object v1
  .line 99
    if-eqz v1, :L1
  .line 100
    invoke-static { v1, p1, p2 }, Lcom/innioasis/ipp/Art;->decode([BII)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 101
    if-eqz v1, :L1
    return-object v1
  :L1
  .line 103
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object p0
  .line 104
    if-nez p0, :L2
    goto :L3
  :L2
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Art;->decode(Ljava/io/File;II)Landroid/graphics/Bitmap;
    move-result-object v0
  :L3
    return-object v0
  :L4
  .line 105
    move-exception p0
  .line 106
    return-object v0
.end method

.method public static file(Ljava/lang/String;)Ljava/io/File;
  .registers 2
  .line 112
    sget-object v0, Lcom/innioasis/ipp/Art;->OWN:[Ljava/lang/String;
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Art;->file(Ljava/lang/String;[Ljava/lang/String;)Ljava/io/File;
    move-result-object p0
    return-object p0
.end method

.method private static file(Ljava/lang/String;[Ljava/lang/String;)Ljava/io/File;
  .registers 6
  .line 116
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 117
    const/16 v1, 47
    invoke-virtual { p0, v1 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v1
  .line 118
    if-gtz v1, :L1
    return-object v0
  :L1
  .line 119
    new-instance v2, Ljava/io/File;
    const/4 v3, 0
    invoke-virtual { p0, v3, v1 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object p0
    invoke-direct { v2, p0 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 122
    nop
  :L2
    array-length p0, p1
    if-ge v3, p0, :L4
  .line 123
    new-instance p0, Ljava/io/File;
    aget-object v1, p1, v3
    invoke-direct { p0, v2, v1 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 124
    invoke-virtual { p0 }, Ljava/io/File;->isFile()Z
    move-result v1
    if-eqz v1, :L3
    return-object p0
  :L3
  .line 122
    add-int/lit8 v3, v3, 1
    goto :L2
  :L4
  .line 127
    invoke-virtual { v2 }, Ljava/io/File;->getParentFile()Ljava/io/File;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->chain(Ljava/io/File;)Ljava/lang/String;
    move-result-object p0
  .line 128
    if-eqz p0, :L6
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result p1
    if-nez p1, :L5
    goto :L6
  :L5
    new-instance v0, Ljava/io/File;
    invoke-direct { v0, p0 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  :L6
    return-object v0
.end method

.method public static flushStamps()V
  .registers 1
  .line 369
    sget-object v0, Lcom/innioasis/ipp/Art;->seen:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 370
    invoke-static { }, Lcom/innioasis/ipp/Art;->saveStamps()V
  .line 371
    return-void
.end method

.method public static hasPick(Ljava/lang/String;)Z
  .catchall { :L0 .. :L1 } :L3
  .registers 5
  .line 501
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 502
    invoke-static { }, Lcom/innioasis/ipp/Art;->prefs()Landroid/content/SharedPreferences;
    move-result-object v1
  .line 503
    if-eqz p0, :L2
    if-eqz v1, :L2
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "thumb\u0001"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    const/4 v2, 0
    invoke-interface { v1, p0, v2 }, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  :L1
    if-eqz p0, :L2
    const/4 v0, 1
  :L2
    return v0
  :L3
  .line 504
    move-exception p0
  .line 505
    return v0
.end method

.method public static hint(Ljava/lang/String;[B)V
  .registers 4
  .line 196
    const/4 v0, 0
    if-nez p0, :L0
  .line 197
    sget-object p0, Lcom/innioasis/ipp/Art;->hint:Ljava/lang/ThreadLocal;
    invoke-virtual { p0, v0 }, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V
  .line 198
    return-void
  :L0
  .line 200
    new-instance v1, Lcom/innioasis/ipp/Art$Hint;
    invoke-direct { v1, v0 }, Lcom/innioasis/ipp/Art$Hint;-><init>(Lcom/innioasis/ipp/Art$1;)V
  .line 201
    iput-object p0, v1, Lcom/innioasis/ipp/Art$Hint;->path:Ljava/lang/String;
  .line 202
    if-nez p1, :L1
    sget-object p1, Lcom/innioasis/ipp/Art;->NO_ART:[B
  :L1
    iput-object p1, v1, Lcom/innioasis/ipp/Art$Hint;->art:[B
  .line 203
    sget-object p0, Lcom/innioasis/ipp/Art;->hint:Ljava/lang/ThreadLocal;
    invoke-virtual { p0, v1 }, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V
  .line 204
    return-void
.end method

.method private static hintFor(Ljava/lang/String;)[B
  .registers 4
  .line 216
    sget-object v0, Lcom/innioasis/ipp/Art;->hint:Ljava/lang/ThreadLocal;
    invoke-virtual { v0 }, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;
    move-result-object v0
  .line 217
    instance-of v1, v0, Lcom/innioasis/ipp/Art$Hint;
    const/4 v2, 0
    if-nez v1, :L0
    return-object v2
  :L0
  .line 218
    check-cast v0, Lcom/innioasis/ipp/Art$Hint;
  .line 219
    iget-object v1, v0, Lcom/innioasis/ipp/Art$Hint;->path:Ljava/lang/String;
    if-eqz v1, :L1
    iget-object v1, v0, Lcom/innioasis/ipp/Art$Hint;->path:Ljava/lang/String;
    invoke-virtual { v1, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L1
    iget-object v2, v0, Lcom/innioasis/ipp/Art$Hint;->art:[B
  :L1
    return-object v2
.end method

.method private static loadStamps()V
  .catchall { :L1 .. :L5 } :L8
  .registers 7
  .line 421
    sget-boolean v0, Lcom/innioasis/ipp/Art;->stampsLoaded:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 422
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Art;->stampsLoaded:Z
  :L1
  .line 424
    invoke-static { }, Lcom/innioasis/ipp/Art;->stampFile()Ljava/io/File;
    move-result-object v0
  .line 425
    if-eqz v0, :L7
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v1
    if-nez v1, :L2
    goto :L7
  :L2
  .line 426
    new-instance v1, Ljava/io/FileInputStream;
    invoke-direct { v1, v0 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 427
    invoke-virtual { v1 }, Ljava/io/FileInputStream;->available()I
    move-result v0
    new-array v0, v0, [B
  .line 428
    invoke-virtual { v1, v0 }, Ljava/io/FileInputStream;->read([B)I
  .line 429
    invoke-virtual { v1 }, Ljava/io/FileInputStream;->close()V
  .line 430
    new-instance v1, Ljava/lang/String;
    const-string v2, "UTF-8"
    invoke-direct { v1, v0, v2 }, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    const-string v0, "\n"
    invoke-virtual { v1, v0 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v0
  .line 431
    const/4 v1, 0
    const/4 v2, 0
  :L3
    array-length v3, v0
    if-ge v2, v3, :L6
  .line 432
    aget-object v3, v0, v2
    const/16 v4, 9
    invoke-virtual { v3, v4 }, Ljava/lang/String;->indexOf(I)I
    move-result v3
  .line 433
    if-gtz v3, :L4
    goto :L5
  :L4
  .line 434
    sget-object v4, Lcom/innioasis/ipp/Art;->stamps:Ljava/util/Hashtable;
    aget-object v5, v0, v2
    invoke-virtual { v5, v1, v3 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v5
    aget-object v6, v0, v2
    add-int/lit8 v3, v3, 1
    invoke-virtual { v6, v3 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v4, v5, v3 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L5
  .line 431
    add-int/lit8 v2, v2, 1
    goto :L3
  :L6
  .line 438
    goto :L9
  :L7
  .line 425
    return-void
  :L8
  .line 436
    move-exception v0
  :L9
  .line 439
    return-void
.end method

.method private static picked(Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L3 } :L6
  .registers 5
  .line 486
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 487
    if-nez p0, :L1
    return-object v0
  :L1
  .line 488
    invoke-static { }, Lcom/innioasis/ipp/Art;->prefs()Landroid/content/SharedPreferences;
    move-result-object v1
  .line 489
    if-nez v1, :L2
    return-object v0
  :L2
  .line 490
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "thumb\u0001"
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    invoke-interface { v1, p0, v0 }, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 491
    if-eqz p0, :L5
    new-instance v1, Ljava/io/File;
    invoke-direct { v1, p0 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v1 }, Ljava/io/File;->isFile()Z
    move-result v1
  :L3
    if-nez v1, :L4
    goto :L5
  :L4
  .line 492
    return-object p0
  :L5
  .line 491
    return-object v0
  :L6
  .line 493
    move-exception p0
  .line 494
    return-object v0
.end method

.method private static pickedArt(Ljava/lang/String;I)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  :L0
  .line 243
    sget-object v0, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v0, p0, p1, p1 }, Lcom/innioasis/music/util/Other;->getAlbumCover(Ljava/lang/String;II)Landroid/graphics/Bitmap;
    move-result-object p0
  :L1
    return-object p0
  :L2
  .line 244
    move-exception p0
  .line 245
    const/4 p0, 0
    return-object p0
.end method

.method private static prefs()Landroid/content/SharedPreferences;
  .registers 3
  .line 611
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 612
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    const-string v1, "innioasis_plus"
    const/4 v2, 0
    invoke-virtual { v0, v1, v2 }, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v0
  :L1
    return-object v0
.end method

.method private static repaint(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/String;Ljava/lang/String;)V
  .registers 6
  .line 587
    invoke-static { p1 }, Lcom/innioasis/ipp/CoverCache;->forget(Ljava/lang/String;)V
  .line 588
    if-nez p0, :L0
    return-void
  :L0
  .line 589
    const/4 v0, 0
  :L1
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v1
    if-ge v0, v1, :L9
  .line 590
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v1
  .line 591
    instance-of v2, v1, Lcom/innioasis/music/data/Album;
    if-nez v2, :L2
    goto :L8
  :L2
  .line 592
    check-cast v1, Lcom/innioasis/music/data/Album;
  .line 594
    invoke-virtual { v1 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { p1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :L3
    goto :L8
  :L3
  .line 595
    if-eqz p2, :L4
    move-object v2, p2
    goto :L5
  :L4
    invoke-virtual { v1 }, Lcom/innioasis/music/data/Album;->getCoverFlag()Ljava/lang/String;
    move-result-object v2
  :L5
  .line 596
    if-nez v2, :L6
    const/4 v2, 0
    goto :L7
  :L6
    invoke-static { p1, v2 }, Lcom/innioasis/ipp/CoverCache;->get(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v2
  :L7
    invoke-virtual { v1, v2 }, Lcom/innioasis/music/data/Album;->setBitmap(Landroid/graphics/Bitmap;)V
  :L8
  .line 589
    add-int/lit8 v0, v0, 1
    goto :L1
  :L9
  .line 598
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  .line 599
    return-void
.end method

.method public static resetThumb(Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
  .registers 7
  .line 558
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->albumKey(Lcom/innioasis/music/adapter/MyBaseAdapter;)Ljava/lang/String;
    move-result-object v0
  .line 559
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 560
    invoke-static { }, Lcom/innioasis/ipp/Art;->prefs()Landroid/content/SharedPreferences;
    move-result-object v2
  .line 561
    if-nez v2, :L1
    return v1
  :L1
  .line 562
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "thumb\u0001"
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    const/4 v5, 0
    invoke-interface { v2, v3, v5 }, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    if-nez v3, :L2
    return v1
  :L2
  .line 563
    invoke-interface { v2 }, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v1
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-interface { v1, v2 }, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    move-result-object v1
    invoke-interface { v1 }, Landroid/content/SharedPreferences$Editor;->commit()Z
  .line 565
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v1
  .line 566
    if-eqz v1, :L3
    invoke-interface { v1 }, Ljava/util/List;->clear()V
  :L3
  .line 567
    invoke-static { p0, v0, v5 }, Lcom/innioasis/ipp/Art;->repaint(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/String;Ljava/lang/String;)V
  .line 568
    const p0, 2131821063
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->toast(I)V
  .line 569
    const/4 p0, 1
    return p0
.end method

.method static sample(IIII)I
  .registers 6
  .line 644
    nop
  .line 645
    const/4 v0, 1
    if-gt p1, p3, :L0
    if-le p0, p2, :L2
  :L0
  .line 646
    div-int/lit8 p1, p1, 2
  .line 647
    div-int/lit8 p0, p0, 2
  :L1
  .line 648
    div-int v1, p1, v0
    if-lt v1, p3, :L2
    div-int v1, p0, v0
    if-lt v1, p2, :L2
    mul-int/lit8 v0, v0, 2
    goto :L1
  :L2
  .line 650
    return v0
.end method

.method private static saveStamps()V
  .catchall { :L0 .. :L5 } :L6
  .registers 6
  .line 442
    sget-boolean v0, Lcom/innioasis/ipp/Art;->stampsDirty:Z
    if-nez v0, :L0
    return-void
  :L0
  .line 444
    invoke-static { }, Lcom/innioasis/ipp/Art;->stampFile()Ljava/io/File;
    move-result-object v0
  .line 445
    if-nez v0, :L1
    return-void
  :L1
  .line 446
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
  .line 447
    sget-object v2, Lcom/innioasis/ipp/Art;->stamps:Ljava/util/Hashtable;
    invoke-virtual { v2 }, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;
    move-result-object v2
  :L2
  .line 448
    invoke-interface { v2 }, Ljava/util/Enumeration;->hasMoreElements()Z
    move-result v3
    if-eqz v3, :L4
  .line 449
    invoke-interface { v2 }, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
  .line 450
    if-eqz v3, :L2
    const/16 v4, 9
    invoke-virtual { v3, v4 }, Ljava/lang/String;->indexOf(I)I
    move-result v5
    if-ltz v5, :L3
    goto :L2
  :L3
  .line 451
    invoke-virtual { v1, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    invoke-virtual { v5, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v4
    sget-object v5, Lcom/innioasis/ipp/Art;->stamps:Ljava/util/Hashtable;
    invoke-virtual { v5, v3 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
    invoke-virtual { v4, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    const/16 v4, 10
    invoke-virtual { v3, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 452
    goto :L2
  :L4
  .line 453
    new-instance v2, Ljava/io/FileOutputStream;
    invoke-direct { v2, v0 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  .line 454
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    const-string v1, "UTF-8"
    invoke-virtual { v0, v1 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object v0
    invoke-virtual { v2, v0 }, Ljava/io/FileOutputStream;->write([B)V
  .line 455
    invoke-virtual { v2 }, Ljava/io/FileOutputStream;->close()V
  .line 456
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Art;->stampsDirty:Z
  :L5
  .line 459
    goto :L7
  :L6
  .line 457
    move-exception v0
  :L7
  .line 460
    return-void
.end method

.method public static setThumb(Lcom/innioasis/music/adapter/MyBaseAdapter;Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
  .registers 8
  .line 532
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 533
    nop
  .line 534
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v1
  .line 535
    if-eqz v1, :L1
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v2
    if-nez v2, :L1
    invoke-interface { v1, v0 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result v2
    invoke-virtual { p0, v2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v2
    goto :L2
  :L1
  .line 536
    const/4 v2, 0
  :L2
    if-nez v2, :L3
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v2
    invoke-virtual { p0, v2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v2
  :L3
  .line 537
    instance-of v3, v2, Lcom/innioasis/y1/database/Song;
    if-nez v3, :L4
    return v0
  :L4
  .line 538
    check-cast v2, Lcom/innioasis/y1/database/Song;
  .line 539
    invoke-static { v2 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v3
  .line 540
    if-eqz v3, :L8
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v4
    if-nez v4, :L5
    goto :L8
  :L5
  .line 542
    invoke-static { }, Lcom/innioasis/ipp/Art;->prefs()Landroid/content/SharedPreferences;
    move-result-object v4
  .line 543
    if-nez v4, :L6
    return v0
  :L6
  .line 544
    invoke-interface { v4 }, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v0
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v5, "thumb\u0001"
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v5
    invoke-interface { v0, v4, v5 }, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    move-result-object v0
    invoke-interface { v0 }, Landroid/content/SharedPreferences$Editor;->commit()Z
  .line 545
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
    invoke-static { p1, v3, v0 }, Lcom/innioasis/ipp/Art;->repaint(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/String;Ljava/lang/String;)V
  .line 547
    if-eqz v1, :L7
    invoke-interface { v1 }, Ljava/util/List;->clear()V
  :L7
  .line 548
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  .line 549
    const p0, 2131821061
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->toast(I)V
  .line 550
    const/4 p0, 1
    return p0
  :L8
  .line 540
    return v0
.end method

.method private static stamp(Ljava/lang/String;)Ljava/lang/String;
  .registers 9
  .line 394
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
  .line 395
    new-instance v1, Ljava/io/File;
    invoke-direct { v1, p0 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 396
    const/4 p0, 0
  :L0
    sget-object v2, Lcom/innioasis/ipp/Art;->OWN_THUMB:[Ljava/lang/String;
    array-length v3, v2
    const/16 v4, 59
    const/16 v5, 58
    if-ge p0, v3, :L2
  .line 397
    new-instance v3, Ljava/io/File;
    aget-object v6, v2, p0
    invoke-direct { v3, v1, v6 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 398
    invoke-virtual { v3 }, Ljava/io/File;->isFile()Z
    move-result v6
    if-eqz v6, :L1
    aget-object v2, v2, p0
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v5 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v2
  .line 399
    invoke-virtual { v3 }, Ljava/io/File;->lastModified()J
    move-result-wide v6
    invoke-virtual { v2, v6, v7 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v5 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v3 }, Ljava/io/File;->length()J
    move-result-wide v5
    invoke-virtual { v2, v5, v6 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L1
  .line 396
    add-int/lit8 p0, p0, 1
    goto :L0
  :L2
  .line 401
    invoke-virtual { v1 }, Ljava/io/File;->getParentFile()Ljava/io/File;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->chain(Ljava/io/File;)Ljava/lang/String;
    move-result-object p0
  .line 402
    if-eqz p0, :L3
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-lez v1, :L3
  .line 403
    new-instance v1, Ljava/io/File;
    invoke-direct { v1, p0 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 407
    invoke-virtual { v1 }, Ljava/io/File;->isFile()Z
    move-result p0
    if-eqz p0, :L3
    const-string p0, "^:"
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
  .line 408
    invoke-virtual { v1 }, Ljava/io/File;->lastModified()J
    move-result-wide v2
    invoke-virtual { p0, v2, v3 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v5 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { v1 }, Ljava/io/File;->length()J
    move-result-wide v1
    invoke-virtual { p0, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0, v4 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  :L3
  .line 410
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static stampFile()Ljava/io/File;
  .registers 3
  .line 414
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 415
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 416
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 417
    if-nez v0, :L1
    goto :L2
  :L1
    new-instance v1, Ljava/io/File;
    const-string v2, "ipp_art.txt"
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  :L2
    return-object v1
.end method

.method public static thumb(Ljava/lang/String;Ljava/lang/String;I)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L3
  .registers 3
  .line 147
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->picked(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 148
    if-eqz p0, :L0
  .line 149
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/Art;->pickedArt(Ljava/lang/String;I)Landroid/graphics/Bitmap;
    move-result-object p0
  .line 150
    if-eqz p0, :L0
    return-object p0
  :L0
  .line 155
    sget-object p0, Lcom/innioasis/ipp/Art;->OWN_THUMB:[Ljava/lang/String;
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/Art;->file(Ljava/lang/String;[Ljava/lang/String;)Ljava/io/File;
    move-result-object p0
  .line 156
    if-eqz p0, :L2
  .line 157
    invoke-static { p0, p2, p2 }, Lcom/innioasis/ipp/Art;->decode(Ljava/io/File;II)Landroid/graphics/Bitmap;
    move-result-object p0
  :L1
  .line 158
    if-eqz p0, :L2
    return-object p0
  :L2
  .line 162
    goto :L4
  :L3
  .line 160
    move-exception p0
  :L4
  .line 163
    if-nez p1, :L5
    const/4 p0, 0
    return-object p0
  :L5
  .line 164
    invoke-static { p1 }, Lcom/innioasis/ipp/Art;->hintFor(Ljava/lang/String;)[B
    move-result-object p0
  .line 165
    if-eqz p0, :L6
    invoke-static { p0, p2, p2 }, Lcom/innioasis/ipp/Art;->decode([BII)Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
  :L6
  .line 166
    sget-object p0, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { p0, p1, p2, p2 }, Lcom/innioasis/music/util/Other;->getAlbumCover(Ljava/lang/String;II)Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
.end method

.method public static thumbFromTags(Ljava/lang/String;Ljava/lang/String;)Z
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 209
    const/4 v0, 0
    if-eqz p1, :L3
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->picked(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    if-nez p0, :L3
    sget-object p0, Lcom/innioasis/ipp/Art;->OWN_THUMB:[Ljava/lang/String;
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/Art;->file(Ljava/lang/String;[Ljava/lang/String;)Ljava/io/File;
    move-result-object p0
  :L1
    if-nez p0, :L3
    const/4 v0, 1
    goto :L3
  :L2
  .line 210
    move-exception p0
  .line 211
    return v0
  :L3
  .line 209
    return v0
.end method

.method private static toast(I)V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  :L0
  .line 603
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 604
    if-eqz v0, :L1
    invoke-virtual { v0, p0 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p0
    const/4 v1, 0
    invoke-static { v0, p0, v1 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/widget/Toast;->show()V
  :L1
  .line 607
    goto :L3
  :L2
  .line 605
    move-exception p0
  :L3
  .line 608
    return-void
.end method
