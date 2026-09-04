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
  .line 64
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
  .line 75
    new-array v0, v0, [Ljava/lang/String;
    aput-object v9, v0, v2
    aput-object v11, v0, v4
    aput-object v13, v0, v6
    aput-object v3, v0, v8
    aput-object v5, v0, v10
    aput-object v7, v0, v12
    sput-object v0, Lcom/innioasis/ipp/Art;->OWN_THUMB:[Ljava/lang/String;
  .line 81
    new-array v0, v8, [Ljava/lang/String;
    aput-object v9, v0, v2
    aput-object v11, v0, v4
    aput-object v13, v0, v6
    sput-object v0, Lcom/innioasis/ipp/Art;->UP:[Ljava/lang/String;
  .line 89
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Art;->chain:Ljava/util/Hashtable;
  .line 179
    new-instance v0, Ljava/lang/ThreadLocal;
    invoke-direct { v0 }, Ljava/lang/ThreadLocal;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Art;->hint:Ljava/lang/ThreadLocal;
  .line 181
    new-array v0, v2, [B
    sput-object v0, Lcom/innioasis/ipp/Art;->NO_ART:[B
  .line 291
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Art;->stamps:Ljava/util/Hashtable;
  .line 293
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Art;->seen:Ljava/util/Hashtable;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 61
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static albumKey(Lcom/innioasis/music/adapter/MyBaseAdapter;)Ljava/lang/String;
  .registers 3
  .line 518
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 519
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v1
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object p0
  .line 520
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
  .line 251
    const-string v0, ""
    if-nez p0, :L0
    return-object v0
  :L0
  .line 252
    invoke-virtual { p0 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object v1
  .line 253
    sget-object v2, Lcom/innioasis/ipp/Art;->chain:Ljava/util/Hashtable;
    invoke-virtual { v2, v1 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
  .line 254
    if-eqz v2, :L1
    check-cast v2, Ljava/lang/String;
    return-object v2
  :L1
  .line 256
    nop
  .line 257
    const/4 v2, 0
  :L2
    sget-object v3, Lcom/innioasis/ipp/Art;->UP:[Ljava/lang/String;
    array-length v4, v3
    if-ge v2, v4, :L4
  .line 258
    new-instance v4, Ljava/io/File;
    aget-object v3, v3, v2
    invoke-direct { v4, p0, v3 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 259
    invoke-virtual { v4 }, Ljava/io/File;->isFile()Z
    move-result v3
    if-eqz v3, :L3
    invoke-virtual { v4 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object v0
    goto :L4
  :L3
  .line 257
    add-int/lit8 v2, v2, 1
    goto :L2
  :L4
  .line 261
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v2
    if-nez v2, :L5
    invoke-virtual { p0 }, Ljava/io/File;->getParentFile()Ljava/io/File;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->chain(Ljava/io/File;)Ljava/lang/String;
    move-result-object v0
  :L5
  .line 262
    sget-object p0, Lcom/innioasis/ipp/Art;->chain:Ljava/util/Hashtable;
    invoke-virtual { p0, v1, v0 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 263
    return-object v0
.end method

.method public static clear()V
  .registers 1
  .line 272
    sget-object v0, Lcom/innioasis/ipp/Art;->chain:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 273
    return-void
.end method

.method public static clearStamps()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 371
    sget-object v0, Lcom/innioasis/ipp/Art;->chain:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 372
    sget-object v0, Lcom/innioasis/ipp/Art;->stamps:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 373
    sget-object v0, Lcom/innioasis/ipp/Art;->seen:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 374
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Art;->stampsLoaded:Z
  .line 375
    sput-boolean v0, Lcom/innioasis/ipp/Art;->stampsDirty:Z
  :L0
  .line 377
    invoke-static { }, Lcom/innioasis/ipp/Art;->stampFile()Ljava/io/File;
    move-result-object v0
  .line 378
    if-eqz v0, :L1
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v1
    if-eqz v1, :L1
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  :L1
  .line 381
    goto :L3
  :L2
  .line 379
    move-exception v0
  :L3
  .line 382
    return-void
.end method

.method public static coverChanged(Ljava/lang/String;)Z
  .registers 1
  .line 307
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
  .line 327
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 328
    if-eqz p0, :L11
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-nez v1, :L1
    goto :L11
  :L1
  .line 329
    sget-object v1, Lcom/innioasis/ipp/Art;->seen:Ljava/util/Hashtable;
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
  .line 330
    if-eqz v2, :L2
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result p0
    return p0
  :L2
  .line 332
    invoke-static { }, Lcom/innioasis/ipp/Art;->loadStamps()V
  .line 333
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->stamp(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 334
    sget-object v3, Lcom/innioasis/ipp/Art;->stamps:Ljava/util/Hashtable;
    invoke-virtual { v3, p0 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Ljava/lang/String;
  .line 336
    invoke-virtual { v2 }, Ljava/lang/String;->length()I
    move-result v5
    const/4 v6, 2
    const/4 v7, 1
    if-nez v5, :L6
  .line 340
    if-eqz v4, :L3
    goto :L4
  :L3
    const/4 v6, 0
  :L4
  .line 341
    if-eqz v4, :L5
  .line 342
    invoke-virtual { v3, p0 }, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 343
    sput-boolean v7, Lcom/innioasis/ipp/Art;->stampsDirty:Z
  :L5
  .line 356
    move v7, v6
    goto :L9
  :L6
  .line 345
    if-nez v4, :L7
  .line 346
    nop
  .line 347
    invoke-virtual { v3, p0, v2 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 348
    sput-boolean v7, Lcom/innioasis/ipp/Art;->stampsDirty:Z
    goto :L9
  :L7
  .line 350
    invoke-virtual { v2, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4
    if-eqz v4, :L8
    const/4 v6, 0
  :L8
  .line 351
    if-eqz v6, :L5
  .line 352
    invoke-virtual { v3, p0, v2 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 353
    sput-boolean v7, Lcom/innioasis/ipp/Art;->stampsDirty:Z
    goto :L5
  :L9
  .line 356
    invoke-static { v7 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v2
    invoke-virtual { v1, p0, v2 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L10
  .line 357
    return v7
  :L11
  .line 328
    return v0
  :L12
  .line 358
    move-exception p0
  .line 359
    return v0
.end method

.method private static decode(Ljava/io/File;II)Landroid/graphics/Bitmap;
  .registers 6
  .line 616
    if-lez p1, :L1
    if-gtz p2, :L0
    goto :L1
  :L0
  .line 617
    new-instance v0, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v0 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 618
    const/4 v1, 1
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 619
    invoke-virtual { p0 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object v1
    invoke-static { v1, v0 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 620
    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    invoke-static { v1, v2, p1, p2 }, Lcom/innioasis/ipp/Art;->sample(IIII)I
    move-result p1
    iput p1, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 621
    const/4 p1, 0
    iput-boolean p1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 622
    invoke-virtual { p0 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0, v0 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
  :L1
  .line 616
    invoke-virtual { p0 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
.end method

.method private static decode([BII)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L3 } :L5
  .registers 8
  .line 219
    const/4 v0, 0
    if-eqz p0, :L6
  :L0
    array-length v1, p0
    if-nez v1, :L1
    goto :L6
  :L1
  .line 220
    new-instance v1, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v1 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 221
    const/4 v2, 1
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 222
    array-length v2, p0
    const/4 v3, 0
    invoke-static { p0, v3, v2, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 223
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    if-lez v2, :L4
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    if-gtz v2, :L2
    goto :L4
  :L2
  .line 224
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    iget v4, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    invoke-static { v2, v4, p1, p2 }, Lcom/innioasis/ipp/Art;->sample(IIII)I
    move-result p1
    iput p1, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 225
    iput-boolean v3, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 226
    array-length p1, p0
    invoke-static { p0, v3, p1, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object p0
  :L3
    return-object p0
  :L4
  .line 223
    return-object v0
  :L5
  .line 227
    move-exception p0
  .line 228
    return-object v0
  :L6
  .line 219
    return-object v0
.end method

.method public static external(Ljava/lang/String;II)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L2 } :L3
  .registers 4
  .line 98
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object p0
  .line 99
    if-nez p0, :L1
    goto :L2
  :L1
    invoke-static { p0, p1, p2 }, Lcom/innioasis/ipp/Art;->decode(Ljava/io/File;II)Landroid/graphics/Bitmap;
    move-result-object v0
  :L2
    return-object v0
  :L3
  .line 100
    move-exception p0
  .line 101
    return-object v0
.end method

.method public static file(Ljava/lang/String;)Ljava/io/File;
  .registers 2
  .line 107
    sget-object v0, Lcom/innioasis/ipp/Art;->OWN:[Ljava/lang/String;
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Art;->file(Ljava/lang/String;[Ljava/lang/String;)Ljava/io/File;
    move-result-object p0
    return-object p0
.end method

.method private static file(Ljava/lang/String;[Ljava/lang/String;)Ljava/io/File;
  .registers 6
  .line 111
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 112
    const/16 v1, 47
    invoke-virtual { p0, v1 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v1
  .line 113
    if-gtz v1, :L1
    return-object v0
  :L1
  .line 114
    new-instance v2, Ljava/io/File;
    const/4 v3, 0
    invoke-virtual { p0, v3, v1 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object p0
    invoke-direct { v2, p0 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 117
    nop
  :L2
    array-length p0, p1
    if-ge v3, p0, :L4
  .line 118
    new-instance p0, Ljava/io/File;
    aget-object v1, p1, v3
    invoke-direct { p0, v2, v1 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 119
    invoke-virtual { p0 }, Ljava/io/File;->isFile()Z
    move-result v1
    if-eqz v1, :L3
    return-object p0
  :L3
  .line 117
    add-int/lit8 v3, v3, 1
    goto :L2
  :L4
  .line 122
    invoke-virtual { v2 }, Ljava/io/File;->getParentFile()Ljava/io/File;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->chain(Ljava/io/File;)Ljava/lang/String;
    move-result-object p0
  .line 123
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
  .line 365
    sget-object v0, Lcom/innioasis/ipp/Art;->seen:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 366
    invoke-static { }, Lcom/innioasis/ipp/Art;->saveStamps()V
  .line 367
    return-void
.end method

.method public static hasPick(Ljava/lang/String;)Z
  .catchall { :L0 .. :L1 } :L3
  .registers 5
  .line 497
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 498
    invoke-static { }, Lcom/innioasis/ipp/Art;->prefs()Landroid/content/SharedPreferences;
    move-result-object v1
  .line 499
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
  .line 500
    move-exception p0
  .line 501
    return v0
.end method

.method public static hint(Ljava/lang/String;[B)V
  .registers 4
  .line 191
    const/4 v0, 0
    if-nez p0, :L0
  .line 192
    sget-object p0, Lcom/innioasis/ipp/Art;->hint:Ljava/lang/ThreadLocal;
    invoke-virtual { p0, v0 }, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V
  .line 193
    return-void
  :L0
  .line 195
    new-instance v1, Lcom/innioasis/ipp/Art$Hint;
    invoke-direct { v1, v0 }, Lcom/innioasis/ipp/Art$Hint;-><init>(Lcom/innioasis/ipp/Art$1;)V
  .line 196
    iput-object p0, v1, Lcom/innioasis/ipp/Art$Hint;->path:Ljava/lang/String;
  .line 197
    if-nez p1, :L1
    sget-object p1, Lcom/innioasis/ipp/Art;->NO_ART:[B
  :L1
    iput-object p1, v1, Lcom/innioasis/ipp/Art$Hint;->art:[B
  .line 198
    sget-object p0, Lcom/innioasis/ipp/Art;->hint:Ljava/lang/ThreadLocal;
    invoke-virtual { p0, v1 }, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V
  .line 199
    return-void
.end method

.method private static hintFor(Ljava/lang/String;)[B
  .registers 4
  .line 211
    sget-object v0, Lcom/innioasis/ipp/Art;->hint:Ljava/lang/ThreadLocal;
    invoke-virtual { v0 }, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;
    move-result-object v0
  .line 212
    instance-of v1, v0, Lcom/innioasis/ipp/Art$Hint;
    const/4 v2, 0
    if-nez v1, :L0
    return-object v2
  :L0
  .line 213
    check-cast v0, Lcom/innioasis/ipp/Art$Hint;
  .line 214
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
  .line 417
    sget-boolean v0, Lcom/innioasis/ipp/Art;->stampsLoaded:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 418
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/Art;->stampsLoaded:Z
  :L1
  .line 420
    invoke-static { }, Lcom/innioasis/ipp/Art;->stampFile()Ljava/io/File;
    move-result-object v0
  .line 421
    if-eqz v0, :L7
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v1
    if-nez v1, :L2
    goto :L7
  :L2
  .line 422
    new-instance v1, Ljava/io/FileInputStream;
    invoke-direct { v1, v0 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 423
    invoke-virtual { v1 }, Ljava/io/FileInputStream;->available()I
    move-result v0
    new-array v0, v0, [B
  .line 424
    invoke-virtual { v1, v0 }, Ljava/io/FileInputStream;->read([B)I
  .line 425
    invoke-virtual { v1 }, Ljava/io/FileInputStream;->close()V
  .line 426
    new-instance v1, Ljava/lang/String;
    const-string v2, "UTF-8"
    invoke-direct { v1, v0, v2 }, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    const-string v0, "\n"
    invoke-virtual { v1, v0 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v0
  .line 427
    const/4 v1, 0
    const/4 v2, 0
  :L3
    array-length v3, v0
    if-ge v2, v3, :L6
  .line 428
    aget-object v3, v0, v2
    const/16 v4, 9
    invoke-virtual { v3, v4 }, Ljava/lang/String;->indexOf(I)I
    move-result v3
  .line 429
    if-gtz v3, :L4
    goto :L5
  :L4
  .line 430
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
  .line 427
    add-int/lit8 v2, v2, 1
    goto :L3
  :L6
  .line 434
    goto :L9
  :L7
  .line 421
    return-void
  :L8
  .line 432
    move-exception v0
  :L9
  .line 435
    return-void
.end method

.method private static picked(Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L3 } :L6
  .registers 5
  .line 482
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 483
    if-nez p0, :L1
    return-object v0
  :L1
  .line 484
    invoke-static { }, Lcom/innioasis/ipp/Art;->prefs()Landroid/content/SharedPreferences;
    move-result-object v1
  .line 485
    if-nez v1, :L2
    return-object v0
  :L2
  .line 486
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
  .line 487
    if-eqz p0, :L5
    new-instance v1, Ljava/io/File;
    invoke-direct { v1, p0 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v1 }, Ljava/io/File;->isFile()Z
    move-result v1
  :L3
    if-nez v1, :L4
    goto :L5
  :L4
  .line 488
    return-object p0
  :L5
  .line 487
    return-object v0
  :L6
  .line 489
    move-exception p0
  .line 490
    return-object v0
.end method

.method private static pickedArt(Ljava/lang/String;I)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  :L0
  .line 239
    sget-object v0, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v0, p0, p1, p1 }, Lcom/innioasis/music/util/Other;->getAlbumCover(Ljava/lang/String;II)Landroid/graphics/Bitmap;
    move-result-object p0
  :L1
    return-object p0
  :L2
  .line 240
    move-exception p0
  .line 241
    const/4 p0, 0
    return-object p0
.end method

.method private static prefs()Landroid/content/SharedPreferences;
  .registers 3
  .line 607
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 608
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
  .line 583
    invoke-static { p1 }, Lcom/innioasis/ipp/CoverCache;->forget(Ljava/lang/String;)V
  .line 584
    if-nez p0, :L0
    return-void
  :L0
  .line 585
    const/4 v0, 0
  :L1
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v1
    if-ge v0, v1, :L9
  .line 586
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v1
  .line 587
    instance-of v2, v1, Lcom/innioasis/music/data/Album;
    if-nez v2, :L2
    goto :L8
  :L2
  .line 588
    check-cast v1, Lcom/innioasis/music/data/Album;
  .line 590
    invoke-virtual { v1 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { p1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :L3
    goto :L8
  :L3
  .line 591
    if-eqz p2, :L4
    move-object v2, p2
    goto :L5
  :L4
    invoke-virtual { v1 }, Lcom/innioasis/music/data/Album;->getCoverFlag()Ljava/lang/String;
    move-result-object v2
  :L5
  .line 592
    if-nez v2, :L6
    const/4 v2, 0
    goto :L7
  :L6
    invoke-static { p1, v2 }, Lcom/innioasis/ipp/CoverCache;->get(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v2
  :L7
    invoke-virtual { v1, v2 }, Lcom/innioasis/music/data/Album;->setBitmap(Landroid/graphics/Bitmap;)V
  :L8
  .line 585
    add-int/lit8 v0, v0, 1
    goto :L1
  :L9
  .line 594
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  .line 595
    return-void
.end method

.method public static resetThumb(Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
  .registers 7
  .line 554
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->albumKey(Lcom/innioasis/music/adapter/MyBaseAdapter;)Ljava/lang/String;
    move-result-object v0
  .line 555
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 556
    invoke-static { }, Lcom/innioasis/ipp/Art;->prefs()Landroid/content/SharedPreferences;
    move-result-object v2
  .line 557
    if-nez v2, :L1
    return v1
  :L1
  .line 558
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
  .line 559
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
  .line 561
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v1
  .line 562
    if-eqz v1, :L3
    invoke-interface { v1 }, Ljava/util/List;->clear()V
  :L3
  .line 563
    invoke-static { p0, v0, v5 }, Lcom/innioasis/ipp/Art;->repaint(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/String;Ljava/lang/String;)V
  .line 564
    const p0, 2131821063
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->toast(I)V
  .line 565
    const/4 p0, 1
    return p0
.end method

.method static sample(IIII)I
  .registers 6
  .line 640
    nop
  .line 641
    const/4 v0, 1
    if-gt p1, p3, :L0
    if-le p0, p2, :L2
  :L0
  .line 642
    div-int/lit8 p1, p1, 2
  .line 643
    div-int/lit8 p0, p0, 2
  :L1
  .line 644
    div-int v1, p1, v0
    if-lt v1, p3, :L2
    div-int v1, p0, v0
    if-lt v1, p2, :L2
    mul-int/lit8 v0, v0, 2
    goto :L1
  :L2
  .line 646
    return v0
.end method

.method private static saveStamps()V
  .catchall { :L0 .. :L5 } :L6
  .registers 6
  .line 438
    sget-boolean v0, Lcom/innioasis/ipp/Art;->stampsDirty:Z
    if-nez v0, :L0
    return-void
  :L0
  .line 440
    invoke-static { }, Lcom/innioasis/ipp/Art;->stampFile()Ljava/io/File;
    move-result-object v0
  .line 441
    if-nez v0, :L1
    return-void
  :L1
  .line 442
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
  .line 443
    sget-object v2, Lcom/innioasis/ipp/Art;->stamps:Ljava/util/Hashtable;
    invoke-virtual { v2 }, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;
    move-result-object v2
  :L2
  .line 444
    invoke-interface { v2 }, Ljava/util/Enumeration;->hasMoreElements()Z
    move-result v3
    if-eqz v3, :L4
  .line 445
    invoke-interface { v2 }, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
  .line 446
    if-eqz v3, :L2
    const/16 v4, 9
    invoke-virtual { v3, v4 }, Ljava/lang/String;->indexOf(I)I
    move-result v5
    if-ltz v5, :L3
    goto :L2
  :L3
  .line 447
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
  .line 448
    goto :L2
  :L4
  .line 449
    new-instance v2, Ljava/io/FileOutputStream;
    invoke-direct { v2, v0 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  .line 450
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    const-string v1, "UTF-8"
    invoke-virtual { v0, v1 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object v0
    invoke-virtual { v2, v0 }, Ljava/io/FileOutputStream;->write([B)V
  .line 451
    invoke-virtual { v2 }, Ljava/io/FileOutputStream;->close()V
  .line 452
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Art;->stampsDirty:Z
  :L5
  .line 455
    goto :L7
  :L6
  .line 453
    move-exception v0
  :L7
  .line 456
    return-void
.end method

.method public static setThumb(Lcom/innioasis/music/adapter/MyBaseAdapter;Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
  .registers 8
  .line 528
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 529
    nop
  .line 530
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v1
  .line 531
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
  .line 532
    const/4 v2, 0
  :L2
    if-nez v2, :L3
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v2
    invoke-virtual { p0, v2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v2
  :L3
  .line 533
    instance-of v3, v2, Lcom/innioasis/y1/database/Song;
    if-nez v3, :L4
    return v0
  :L4
  .line 534
    check-cast v2, Lcom/innioasis/y1/database/Song;
  .line 535
    invoke-static { v2 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v3
  .line 536
    if-eqz v3, :L8
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v4
    if-nez v4, :L5
    goto :L8
  :L5
  .line 538
    invoke-static { }, Lcom/innioasis/ipp/Art;->prefs()Landroid/content/SharedPreferences;
    move-result-object v4
  .line 539
    if-nez v4, :L6
    return v0
  :L6
  .line 540
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
  .line 541
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
    invoke-static { p1, v3, v0 }, Lcom/innioasis/ipp/Art;->repaint(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/String;Ljava/lang/String;)V
  .line 543
    if-eqz v1, :L7
    invoke-interface { v1 }, Ljava/util/List;->clear()V
  :L7
  .line 544
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  .line 545
    const p0, 2131821061
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->toast(I)V
  .line 546
    const/4 p0, 1
    return p0
  :L8
  .line 536
    return v0
.end method

.method private static stamp(Ljava/lang/String;)Ljava/lang/String;
  .registers 9
  .line 390
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
  .line 391
    new-instance v1, Ljava/io/File;
    invoke-direct { v1, p0 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 392
    const/4 p0, 0
  :L0
    sget-object v2, Lcom/innioasis/ipp/Art;->OWN_THUMB:[Ljava/lang/String;
    array-length v3, v2
    const/16 v4, 59
    const/16 v5, 58
    if-ge p0, v3, :L2
  .line 393
    new-instance v3, Ljava/io/File;
    aget-object v6, v2, p0
    invoke-direct { v3, v1, v6 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 394
    invoke-virtual { v3 }, Ljava/io/File;->isFile()Z
    move-result v6
    if-eqz v6, :L1
    aget-object v2, v2, p0
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v5 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v2
  .line 395
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
  .line 392
    add-int/lit8 p0, p0, 1
    goto :L0
  :L2
  .line 397
    invoke-virtual { v1 }, Ljava/io/File;->getParentFile()Ljava/io/File;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->chain(Ljava/io/File;)Ljava/lang/String;
    move-result-object p0
  .line 398
    if-eqz p0, :L3
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-lez v1, :L3
  .line 399
    new-instance v1, Ljava/io/File;
    invoke-direct { v1, p0 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 403
    invoke-virtual { v1 }, Ljava/io/File;->isFile()Z
    move-result p0
    if-eqz p0, :L3
    const-string p0, "^:"
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
  .line 404
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
  .line 406
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static stampFile()Ljava/io/File;
  .registers 3
  .line 410
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 411
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 412
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 413
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
  .line 142
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->picked(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 143
    if-eqz p0, :L0
  .line 144
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/Art;->pickedArt(Ljava/lang/String;I)Landroid/graphics/Bitmap;
    move-result-object p0
  .line 145
    if-eqz p0, :L0
    return-object p0
  :L0
  .line 150
    sget-object p0, Lcom/innioasis/ipp/Art;->OWN_THUMB:[Ljava/lang/String;
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/Art;->file(Ljava/lang/String;[Ljava/lang/String;)Ljava/io/File;
    move-result-object p0
  .line 151
    if-eqz p0, :L2
  .line 152
    invoke-static { p0, p2, p2 }, Lcom/innioasis/ipp/Art;->decode(Ljava/io/File;II)Landroid/graphics/Bitmap;
    move-result-object p0
  :L1
  .line 153
    if-eqz p0, :L2
    return-object p0
  :L2
  .line 157
    goto :L4
  :L3
  .line 155
    move-exception p0
  :L4
  .line 158
    if-nez p1, :L5
    const/4 p0, 0
    return-object p0
  :L5
  .line 159
    invoke-static { p1 }, Lcom/innioasis/ipp/Art;->hintFor(Ljava/lang/String;)[B
    move-result-object p0
  .line 160
    if-eqz p0, :L6
    invoke-static { p0, p2, p2 }, Lcom/innioasis/ipp/Art;->decode([BII)Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
  :L6
  .line 161
    sget-object p0, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { p0, p1, p2, p2 }, Lcom/innioasis/music/util/Other;->getAlbumCover(Ljava/lang/String;II)Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
.end method

.method public static thumbFromTags(Ljava/lang/String;Ljava/lang/String;)Z
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 204
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
  .line 205
    move-exception p0
  .line 206
    return v0
  :L3
  .line 204
    return v0
.end method

.method private static toast(I)V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  :L0
  .line 599
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 600
    if-eqz v0, :L1
    invoke-virtual { v0, p0 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p0
    const/4 v1, 0
    invoke-static { v0, p0, v1 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/widget/Toast;->show()V
  :L1
  .line 603
    goto :L3
  :L2
  .line 601
    move-exception p0
  :L3
  .line 604
    return-void
.end method
