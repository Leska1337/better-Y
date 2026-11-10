.class public final Lcom/innioasis/ipp/Art;
.super Ljava/lang/Object;
.source "Art.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Art$Hint;,
    Lcom/innioasis/ipp/Art$Save;
  }
.end annotation

.field private final static NONE:Ljava/lang/String; = ""

.field private final static NO_ART:[B

.field private final static OWN:[Ljava/lang/String;

.field private final static OWN_THUMB:[Ljava/lang/String;

.field final static PICK:Ljava/lang/String; = "thumb\u0001"

.field private final static SAVE_DELAY_MS:J = 5000L

.field private final static SEP:C = '\t'

.field private final static UP:[Ljava/lang/String;

.field private final static chain:Ljava/util/Hashtable;

.field private final static hint:Ljava/lang/ThreadLocal;

.field private static saveAsked:Z

.field private final static seen:Ljava/util/Hashtable;

.field private final static stamps:Ljava/util/Hashtable;

.field private static stampsDirty:Z

.field private static stampsLoaded:Z

.method static constructor <clinit>()V
  .registers 14
  .line 40
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
  .line 46
    new-array v0, v0, [Ljava/lang/String;
    aput-object v9, v0, v2
    aput-object v11, v0, v4
    aput-object v13, v0, v6
    aput-object v3, v0, v8
    aput-object v5, v0, v10
    aput-object v7, v0, v12
    sput-object v0, Lcom/innioasis/ipp/Art;->OWN_THUMB:[Ljava/lang/String;
  .line 52
    new-array v0, v8, [Ljava/lang/String;
    aput-object v9, v0, v2
    aput-object v11, v0, v4
    aput-object v13, v0, v6
    sput-object v0, Lcom/innioasis/ipp/Art;->UP:[Ljava/lang/String;
  .line 60
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Art;->chain:Ljava/util/Hashtable;
  .line 130
    new-instance v0, Ljava/lang/ThreadLocal;
    invoke-direct { v0 }, Ljava/lang/ThreadLocal;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Art;->hint:Ljava/lang/ThreadLocal;
  .line 132
    new-array v0, v2, [B
    sput-object v0, Lcom/innioasis/ipp/Art;->NO_ART:[B
  .line 225
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Art;->stamps:Ljava/util/Hashtable;
  .line 227
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/Art;->seen:Ljava/util/Hashtable;
    return-void
.end method

.method private constructor <init>()V
  .registers 1
  .line 37
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$100()V
  .registers 0
  .line 35
    invoke-static { }, Lcom/innioasis/ipp/Art;->saveStamps()V
    return-void
.end method

.method public static albumKey(Lcom/innioasis/music/adapter/MyBaseAdapter;)Ljava/lang/String;
  .registers 3
  .line 454
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 455
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v1
    invoke-virtual { p0, v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object p0
  .line 456
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
  .line 193
    const-string v0, ""
    if-nez p0, :L0
    return-object v0
  :L0
  .line 194
    invoke-virtual { p0 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object v1
  .line 195
    sget-object v2, Lcom/innioasis/ipp/Art;->chain:Ljava/util/Hashtable;
    invoke-virtual { v2, v1 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
  .line 196
    if-eqz v2, :L1
    check-cast v2, Ljava/lang/String;
    return-object v2
  :L1
  .line 198
    nop
  .line 199
    const/4 v2, 0
  :L2
    sget-object v3, Lcom/innioasis/ipp/Art;->UP:[Ljava/lang/String;
    array-length v4, v3
    if-ge v2, v4, :L4
  .line 200
    new-instance v4, Ljava/io/File;
    aget-object v3, v3, v2
    invoke-direct { v4, p0, v3 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 201
    invoke-virtual { v4 }, Ljava/io/File;->isFile()Z
    move-result v3
    if-eqz v3, :L3
    invoke-virtual { v4 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object v0
    goto :L4
  :L3
  .line 199
    add-int/lit8 v2, v2, 1
    goto :L2
  :L4
  .line 203
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v2
    if-nez v2, :L5
    invoke-virtual { p0 }, Ljava/io/File;->getParentFile()Ljava/io/File;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->chain(Ljava/io/File;)Ljava/lang/String;
    move-result-object v0
  :L5
  .line 204
    sget-object p0, Lcom/innioasis/ipp/Art;->chain:Ljava/util/Hashtable;
    invoke-virtual { p0, v1, v0 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 205
    return-object v0
.end method

.method public static clear()V
  .registers 1
  .line 213
    sget-object v0, Lcom/innioasis/ipp/Art;->chain:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 214
    return-void
.end method

.method public static clearStamps()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 298
    sget-object v0, Lcom/innioasis/ipp/Art;->chain:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 299
    sget-object v0, Lcom/innioasis/ipp/Art;->stamps:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 300
    sget-object v0, Lcom/innioasis/ipp/Art;->seen:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 301
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/Art;->stampsLoaded:Z
  .line 302
    sput-boolean v0, Lcom/innioasis/ipp/Art;->stampsDirty:Z
  :L0
  .line 304
    invoke-static { }, Lcom/innioasis/ipp/Art;->stampFile()Ljava/io/File;
    move-result-object v0
  .line 305
    if-eqz v0, :L1
    invoke-virtual { v0 }, Ljava/io/File;->exists()Z
    move-result v1
    if-eqz v1, :L1
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  :L1
  .line 307
    goto :L3
  :L2
  .line 306
    move-exception v0
  :L3
  .line 308
    return-void
.end method

.method public static coverChanged(Ljava/lang/String;)Z
  .catchall { :L0 .. :L3 } :L10
  .catchall { :L3 .. :L5 } :L4
  .catchall { :L5 .. :L8 } :L10
  .registers 7
  .line 264
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 265
    if-eqz p0, :L9
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-nez v1, :L1
    goto :L9
  :L1
  .line 266
    sget-object v1, Lcom/innioasis/ipp/Art;->seen:Ljava/util/Hashtable;
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v2
  .line 267
    if-eqz v2, :L2
    check-cast v2, Ljava/lang/Boolean;
    invoke-virtual { v2 }, Ljava/lang/Boolean;->booleanValue()Z
    move-result p0
    return p0
  :L2
  .line 269
    invoke-static { }, Lcom/innioasis/ipp/Art;->loadStamps()V
  .line 270
    sget-object v2, Lcom/innioasis/ipp/Art;->stamps:Ljava/util/Hashtable;
    invoke-virtual { v2, p0 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Ljava/lang/String;
  .line 271
    nop
  .line 272
    if-eqz v3, :L6
  .line 273
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->stamp(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
  .line 274
    invoke-virtual { v4, v3 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v3
  .line 276
    const/4 v4, 1
    xor-int/2addr v3, v4
    if-eqz v3, :L7
  .line 277
    const-class v5, Lcom/innioasis/ipp/Art;
    monitor-enter v5
  :L3
  .line 278
    invoke-virtual { v2, p0 }, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 279
    sput-boolean v4, Lcom/innioasis/ipp/Art;->stampsDirty:Z
  .line 280
    monitor-exit v5
    goto :L7
  :L4
    move-exception p0
    monitor-exit v5
  :L5
    throw p0
  :L6
  .line 272
    const/4 v3, 0
  :L7
  .line 283
    invoke-static { v3 }, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    move-result-object v2
    invoke-virtual { v1, p0, v2 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L8
  .line 284
    return v3
  :L9
  .line 265
    return v0
  :L10
  .line 285
    move-exception p0
  .line 286
    return v0
.end method

.method private static decode(Ljava/io/File;II)Landroid/graphics/Bitmap;
  .registers 6
  .line 525
    if-lez p1, :L1
    if-gtz p2, :L0
    goto :L1
  :L0
  .line 526
    new-instance v0, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v0 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 527
    const/4 v1, 1
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 528
    invoke-virtual { p0 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object v1
    invoke-static { v1, v0 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 529
    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    invoke-static { v1, v2, p1, p2 }, Lcom/innioasis/ipp/Art;->sample(IIII)I
    move-result p1
    iput p1, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 530
    const/4 p1, 0
    iput-boolean p1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 531
    invoke-virtual { p0 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0, v0 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
  :L1
  .line 525
    invoke-virtual { p0 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object p0
    invoke-static { p0 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
.end method

.method private static decode([BII)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L3 } :L5
  .registers 8
  .line 169
    const/4 v0, 0
    if-eqz p0, :L6
  :L0
    array-length v1, p0
    if-nez v1, :L1
    goto :L6
  :L1
  .line 170
    new-instance v1, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v1 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 171
    const/4 v2, 1
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 172
    array-length v2, p0
    const/4 v3, 0
    invoke-static { p0, v3, v2, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
  .line 173
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    if-lez v2, :L4
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    if-gtz v2, :L2
    goto :L4
  :L2
  .line 174
    iget v2, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I
    iget v4, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I
    invoke-static { v2, v4, p1, p2 }, Lcom/innioasis/ipp/Art;->sample(IIII)I
    move-result p1
    iput p1, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
  .line 175
    iput-boolean v3, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
  .line 176
    array-length p1, p0
    invoke-static { p0, v3, p1, v1 }, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object p0
  :L3
    return-object p0
  :L4
  .line 173
    return-object v0
  :L5
  .line 177
    move-exception p0
  .line 178
    return-object v0
  :L6
  .line 169
    return-object v0
.end method

.method public static external(Ljava/lang/String;II)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L3 } :L4
  .registers 5
  .line 67
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Meta;->tagArt(Ljava/lang/String;)[B
    move-result-object v1
  .line 68
    if-eqz v1, :L1
  .line 69
    invoke-static { v1, p1, p2 }, Lcom/innioasis/ipp/Art;->decode([BII)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 70
    if-eqz v1, :L1
    return-object v1
  :L1
  .line 72
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v1
  .line 73
    if-nez v1, :L2
    return-object v0
  :L2
  .line 74
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->stampRead(Ljava/lang/String;)V
  .line 75
    invoke-static { v1, p1, p2 }, Lcom/innioasis/ipp/Art;->decode(Ljava/io/File;II)Landroid/graphics/Bitmap;
    move-result-object p0
  :L3
    return-object p0
  :L4
  .line 76
    move-exception p0
  .line 77
    return-object v0
.end method

.method public static file(Ljava/lang/String;)Ljava/io/File;
  .registers 2
  .line 82
    sget-object v0, Lcom/innioasis/ipp/Art;->OWN:[Ljava/lang/String;
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Art;->file(Ljava/lang/String;[Ljava/lang/String;)Ljava/io/File;
    move-result-object p0
    return-object p0
.end method

.method private static file(Ljava/lang/String;[Ljava/lang/String;)Ljava/io/File;
  .registers 6
  .line 86
    const/4 v0, 0
    if-nez p0, :L0
    return-object v0
  :L0
  .line 87
    const/16 v1, 47
    invoke-virtual { p0, v1 }, Ljava/lang/String;->lastIndexOf(I)I
    move-result v1
  .line 88
    if-gtz v1, :L1
    return-object v0
  :L1
  .line 89
    new-instance v2, Ljava/io/File;
    const/4 v3, 0
    invoke-virtual { p0, v3, v1 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object p0
    invoke-direct { v2, p0 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 91
    nop
  :L2
    array-length p0, p1
    if-ge v3, p0, :L4
  .line 92
    new-instance p0, Ljava/io/File;
    aget-object v1, p1, v3
    invoke-direct { p0, v2, v1 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 93
    invoke-virtual { p0 }, Ljava/io/File;->isFile()Z
    move-result v1
    if-eqz v1, :L3
    return-object p0
  :L3
  .line 91
    add-int/lit8 v3, v3, 1
    goto :L2
  :L4
  .line 95
    invoke-virtual { v2 }, Ljava/io/File;->getParentFile()Ljava/io/File;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->chain(Ljava/io/File;)Ljava/lang/String;
    move-result-object p0
  .line 96
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
  .line 292
    sget-object v0, Lcom/innioasis/ipp/Art;->seen:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 293
    invoke-static { }, Lcom/innioasis/ipp/Art;->saveStamps()V
  .line 294
    return-void
.end method

.method public static hasPick(Ljava/lang/String;)Z
  .catchall { :L0 .. :L1 } :L3
  .registers 5
  .line 444
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 445
    invoke-static { }, Lcom/innioasis/ipp/Prefs;->file()Landroid/content/SharedPreferences;
    move-result-object v1
  .line 446
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
  .line 447
    move-exception p0
  .line 448
    return v0
.end method

.method public static hint(Ljava/lang/String;[B)V
  .registers 4
  .line 141
    const/4 v0, 0
    if-nez p0, :L0
  .line 142
    sget-object p0, Lcom/innioasis/ipp/Art;->hint:Ljava/lang/ThreadLocal;
    invoke-virtual { p0, v0 }, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V
  .line 143
    return-void
  :L0
  .line 145
    new-instance v1, Lcom/innioasis/ipp/Art$Hint;
    invoke-direct { v1, v0 }, Lcom/innioasis/ipp/Art$Hint;-><init>(Lcom/innioasis/ipp/Art$1;)V
  .line 146
    iput-object p0, v1, Lcom/innioasis/ipp/Art$Hint;->path:Ljava/lang/String;
  .line 147
    if-nez p1, :L1
    sget-object p1, Lcom/innioasis/ipp/Art;->NO_ART:[B
  :L1
    iput-object p1, v1, Lcom/innioasis/ipp/Art$Hint;->art:[B
  .line 148
    sget-object p0, Lcom/innioasis/ipp/Art;->hint:Ljava/lang/ThreadLocal;
    invoke-virtual { p0, v1 }, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V
  .line 149
    return-void
.end method

.method private static hintFor(Ljava/lang/String;)[B
  .registers 4
  .line 161
    sget-object v0, Lcom/innioasis/ipp/Art;->hint:Ljava/lang/ThreadLocal;
    invoke-virtual { v0 }, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;
    move-result-object v0
  .line 162
    instance-of v1, v0, Lcom/innioasis/ipp/Art$Hint;
    const/4 v2, 0
    if-nez v1, :L0
    return-object v2
  :L0
  .line 163
    check-cast v0, Lcom/innioasis/ipp/Art$Hint;
  .line 164
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

.method private static declared-synchronized loadStamps()V
  .catchall { :L0 .. :L1 } :L13
  .catchall { :L3 .. :L4 } :L13
  .catchall { :L4 .. :L8 } :L11
  .registers 8
    const-class v0, Lcom/innioasis/ipp/Art;
    monitor-enter v0
  :L0
  .line 358
    sget-boolean v1, Lcom/innioasis/ipp/Art;->stampsLoaded:Z
  :L1
    if-eqz v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 359
    const/4 v1, 1
  :L3
    sput-boolean v1, Lcom/innioasis/ipp/Art;->stampsLoaded:Z
  :L4
  .line 361
    invoke-static { }, Lcom/innioasis/ipp/Art;->stampFile()Ljava/io/File;
    move-result-object v1
  .line 362
    if-eqz v1, :L10
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-nez v2, :L5
    goto :L10
  :L5
  .line 363
    new-instance v2, Ljava/io/FileInputStream;
    invoke-direct { v2, v1 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 364
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->available()I
    move-result v1
    new-array v1, v1, [B
  .line 365
    invoke-virtual { v2, v1 }, Ljava/io/FileInputStream;->read([B)I
  .line 366
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 367
    new-instance v2, Ljava/lang/String;
    const-string v3, "UTF-8"
    invoke-direct { v2, v1, v3 }, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    const-string v1, "\n"
    invoke-virtual { v2, v1 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v1
  .line 368
    const/4 v2, 0
    const/4 v3, 0
  :L6
    array-length v4, v1
    if-ge v3, v4, :L9
  .line 369
    aget-object v4, v1, v3
    const/16 v5, 9
    invoke-virtual { v4, v5 }, Ljava/lang/String;->indexOf(I)I
    move-result v4
  .line 370
    if-gtz v4, :L7
    goto :L8
  :L7
  .line 371
    sget-object v5, Lcom/innioasis/ipp/Art;->stamps:Ljava/util/Hashtable;
    aget-object v6, v1, v3
    invoke-virtual { v6, v2, v4 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v6
    aget-object v7, v1, v3
    add-int/lit8 v4, v4, 1
    invoke-virtual { v7, v4 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object v4
    invoke-virtual { v5, v6, v4 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L8
  .line 368
    add-int/lit8 v3, v3, 1
    goto :L6
  :L9
  .line 374
    goto :L12
  :L10
  .line 362
    monitor-exit v0
    return-void
  :L11
  .line 373
    move-exception v1
  :L12
  .line 375
    monitor-exit v0
    return-void
  :L13
  .line 357
    move-exception v1
    monitor-exit v0
    goto :L15
  :L14
    throw v1
  :L15
    goto :L14
.end method

.method private static picked(Ljava/lang/String;)Ljava/lang/String;
  .catchall { :L0 .. :L3 } :L6
  .registers 5
  .line 407
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 408
    if-nez p0, :L1
    return-object v0
  :L1
  .line 409
    invoke-static { }, Lcom/innioasis/ipp/Prefs;->file()Landroid/content/SharedPreferences;
    move-result-object v1
  .line 410
    if-nez v1, :L2
    return-object v0
  :L2
  .line 411
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
  .line 412
    if-eqz p0, :L5
    new-instance v1, Ljava/io/File;
    invoke-direct { v1, p0 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual { v1 }, Ljava/io/File;->isFile()Z
    move-result v1
  :L3
    if-nez v1, :L4
    goto :L5
  :L4
  .line 413
    return-object p0
  :L5
  .line 412
    return-object v0
  :L6
  .line 414
    move-exception p0
  .line 415
    return-object v0
.end method

.method private static pickedArt(Ljava/lang/String;I)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  :L0
  .line 185
    sget-object v0, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v0, p0, p1, p1 }, Lcom/innioasis/music/util/Other;->getAlbumCover(Ljava/lang/String;II)Landroid/graphics/Bitmap;
    move-result-object p0
  :L1
    return-object p0
  :L2
  .line 186
    move-exception p0
  .line 187
    const/4 p0, 0
    return-object p0
.end method

.method public static pickedPath(Ljava/lang/String;)Ljava/lang/String;
  .registers 1
  .line 421
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->picked(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method public static pin(Ljava/lang/String;Ljava/lang/String;)Z
  .catchall { :L0 .. :L1 } :L8
  .catchall { :L3 .. :L6 } :L8
  .registers 6
  .line 430
    const/4 v0, 0
  :L0
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 431
    invoke-static { }, Lcom/innioasis/ipp/Prefs;->file()Landroid/content/SharedPreferences;
    move-result-object v1
  :L1
  .line 432
    if-eqz p0, :L7
    if-nez v1, :L2
    goto :L7
  :L2
  .line 433
    const-string v2, "thumb\u0001"
    if-nez p1, :L4
  :L3
    invoke-interface { v1 }, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object p1
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-interface { p1, v1 }, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    move-result-object p1
    invoke-interface { p1 }, Landroid/content/SharedPreferences$Editor;->commit()Z
    goto :L5
  :L4
  .line 434
    invoke-interface { v1 }, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v1
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v3, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    invoke-interface { v1, v2, p1 }, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    move-result-object p1
    invoke-interface { p1 }, Landroid/content/SharedPreferences$Editor;->commit()Z
  :L5
  .line 435
    invoke-static { p0 }, Lcom/innioasis/ipp/CoverCache;->forget(Ljava/lang/String;)V
  :L6
  .line 436
    const/4 p0, 1
    return p0
  :L7
  .line 432
    return v0
  :L8
  .line 437
    move-exception p0
  .line 438
    return v0
.end method

.method static prune(Ljava/util/Set;Z)J
  .catchall { :L0 .. :L7 } :L9
  .catchall { :L8 .. :L10 } :L9
  .registers 9
  .line 312
    invoke-static { }, Lcom/innioasis/ipp/Art;->loadStamps()V
  .line 313
    nop
  .line 314
    const-class v0, Lcom/innioasis/ipp/Art;
    monitor-enter v0
  :L0
  .line 315
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
  .line 316
    sget-object v2, Lcom/innioasis/ipp/Art;->stamps:Ljava/util/Hashtable;
    invoke-virtual { v2 }, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;
    move-result-object v2
    const-wide/16 v3, 0
  :L1
  .line 317
    invoke-interface { v2 }, Ljava/util/Enumeration;->hasMoreElements()Z
    move-result v5
    if-eqz v5, :L3
  .line 318
    invoke-interface { v2 }, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/String;
  .line 319
    invoke-interface { p0, v5 }, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    move-result v6
    if-eqz v6, :L2
    goto :L1
  :L2
  .line 320
    invoke-virtual { v1, v5 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  .line 321
    sget-object v6, Lcom/innioasis/ipp/Art;->stamps:Ljava/util/Hashtable;
    invoke-virtual { v6, v5 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v6
    check-cast v6, Ljava/lang/String;
    invoke-static { v5, v6 }, Lcom/innioasis/ipp/Stale;->line(Ljava/lang/String;Ljava/lang/String;)J
    move-result-wide v5
    add-long/2addr v3, v5
  .line 322
    goto :L1
  :L3
  .line 323
    if-eqz p1, :L8
    invoke-virtual { v1 }, Ljava/util/ArrayList;->isEmpty()Z
    move-result p0
    if-eqz p0, :L4
    goto :L8
  :L4
  .line 324
    const/4 p0, 0
  :L5
    invoke-virtual { v1 }, Ljava/util/ArrayList;->size()I
    move-result p1
    if-ge p0, p1, :L6
    sget-object p1, Lcom/innioasis/ipp/Art;->stamps:Ljava/util/Hashtable;
    invoke-virtual { v1, p0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    invoke-virtual { p1, v2 }, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    add-int/lit8 p0, p0, 1
    goto :L5
  :L6
  .line 325
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/Art;->stampsDirty:Z
  .line 326
    monitor-exit v0
  :L7
  .line 327
    invoke-static { }, Lcom/innioasis/ipp/Art;->saveStamps()V
  .line 328
    return-wide v3
  :L8
  .line 323
    monitor-exit v0
    return-wide v3
  :L9
  .line 326
    move-exception p0
    monitor-exit v0
  :L10
    goto :L12
  :L11
    throw p0
  :L12
    goto :L11
.end method

.method private static repaint(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/String;Ljava/lang/String;)V
  .registers 6
  .line 502
    invoke-static { p1 }, Lcom/innioasis/ipp/CoverCache;->forget(Ljava/lang/String;)V
  .line 503
    if-nez p0, :L0
    return-void
  :L0
  .line 504
    const/4 v0, 0
  :L1
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v1
    if-ge v0, v1, :L9
  .line 505
    invoke-virtual { p0, v0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v1
  .line 506
    instance-of v2, v1, Lcom/innioasis/music/data/Album;
    if-nez v2, :L2
    goto :L8
  :L2
  .line 507
    check-cast v1, Lcom/innioasis/music/data/Album;
  .line 508
    invoke-virtual { v1 }, Lcom/innioasis/music/data/Album;->getName()Ljava/lang/String;
    move-result-object v2
    invoke-static { v2 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { p1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2
    if-nez v2, :L3
    goto :L8
  :L3
  .line 509
    if-eqz p2, :L4
    move-object v2, p2
    goto :L5
  :L4
    invoke-virtual { v1 }, Lcom/innioasis/music/data/Album;->getCoverFlag()Ljava/lang/String;
    move-result-object v2
  :L5
  .line 510
    if-nez v2, :L6
    const/4 v2, 0
    goto :L7
  :L6
    invoke-static { p1, v2 }, Lcom/innioasis/ipp/CoverCache;->get(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v2
  :L7
    invoke-virtual { v1, v2 }, Lcom/innioasis/music/data/Album;->setBitmap(Landroid/graphics/Bitmap;)V
  :L8
  .line 504
    add-int/lit8 v0, v0, 1
    goto :L1
  :L9
  .line 512
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  .line 513
    return-void
.end method

.method public static resetThumb(Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
  .registers 7
  .line 483
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->albumKey(Lcom/innioasis/music/adapter/MyBaseAdapter;)Ljava/lang/String;
    move-result-object v0
  .line 484
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 485
    invoke-static { }, Lcom/innioasis/ipp/Prefs;->file()Landroid/content/SharedPreferences;
    move-result-object v2
  .line 486
    if-nez v2, :L1
    return v1
  :L1
  .line 487
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
  .line 488
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
  .line 490
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v1
  .line 491
    if-eqz v1, :L3
    invoke-interface { v1 }, Ljava/util/List;->clear()V
  :L3
  .line 492
    invoke-static { p0, v0, v5 }, Lcom/innioasis/ipp/Art;->repaint(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/String;Ljava/lang/String;)V
  .line 493
    const p0, 2131821063
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->toast(I)V
  .line 494
    const/4 p0, 1
    return p0
.end method

.method static sample(IIII)I
  .registers 6
  .line 540
    nop
  .line 541
    const/4 v0, 1
    if-gt p1, p3, :L0
    if-le p0, p2, :L2
  :L0
  .line 542
    div-int/lit8 p1, p1, 2
  .line 543
    div-int/lit8 p0, p0, 2
  :L1
  .line 544
    div-int v1, p1, v0
    if-lt v1, p3, :L2
    div-int v1, p0, v0
    if-lt v1, p2, :L2
    mul-int/lit8 v0, v0, 2
    goto :L1
  :L2
  .line 546
    return v0
.end method

.method private static declared-synchronized saveStamps()V
  .catchall { :L0 .. :L1 } :L11
  .catchall { :L2 .. :L3 } :L9
  .catchall { :L4 .. :L8 } :L9
  .registers 8
    const-class v0, Lcom/innioasis/ipp/Art;
    monitor-enter v0
  .line 378
    const/4 v1, 0
  :L0
    sput-boolean v1, Lcom/innioasis/ipp/Art;->saveAsked:Z
  .line 379
    sget-boolean v2, Lcom/innioasis/ipp/Art;->stampsDirty:Z
  :L1
    if-nez v2, :L2
    monitor-exit v0
    return-void
  :L2
  .line 381
    invoke-static { }, Lcom/innioasis/ipp/Art;->stampFile()Ljava/io/File;
    move-result-object v2
  :L3
  .line 382
    if-nez v2, :L4
    monitor-exit v0
    return-void
  :L4
  .line 383
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct { v3 }, Ljava/lang/StringBuilder;-><init>()V
  .line 384
    sget-object v4, Lcom/innioasis/ipp/Art;->stamps:Ljava/util/Hashtable;
    invoke-virtual { v4 }, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;
    move-result-object v4
  :L5
  .line 385
    invoke-interface { v4 }, Ljava/util/Enumeration;->hasMoreElements()Z
    move-result v5
    if-eqz v5, :L7
  .line 386
    invoke-interface { v4 }, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/String;
  .line 387
    if-eqz v5, :L5
    const/16 v6, 9
    invoke-virtual { v5, v6 }, Ljava/lang/String;->indexOf(I)I
    move-result v7
    if-ltz v7, :L6
    goto :L5
  :L6
  .line 388
    invoke-virtual { v3, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v7
    invoke-virtual { v7, v6 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v6
    sget-object v7, Lcom/innioasis/ipp/Art;->stamps:Ljava/util/Hashtable;
    invoke-virtual { v7, v5 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v5
    check-cast v5, Ljava/lang/String;
    invoke-virtual { v6, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v5
    const/16 v6, 10
    invoke-virtual { v5, v6 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
  .line 389
    goto :L5
  :L7
  .line 390
    new-instance v4, Ljava/io/FileOutputStream;
    invoke-direct { v4, v2 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  .line 391
    invoke-virtual { v3 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v2
    const-string v3, "UTF-8"
    invoke-virtual { v2, v3 }, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    move-result-object v2
    invoke-virtual { v4, v2 }, Ljava/io/FileOutputStream;->write([B)V
  .line 392
    invoke-virtual { v4 }, Ljava/io/FileOutputStream;->close()V
  .line 393
    sput-boolean v1, Lcom/innioasis/ipp/Art;->stampsDirty:Z
  :L8
  .line 395
    goto :L10
  :L9
  .line 394
    move-exception v1
  :L10
  .line 396
    monitor-exit v0
    return-void
  :L11
  .line 377
    move-exception v1
    monitor-exit v0
    goto :L13
  :L12
    throw v1
  :L13
    goto :L12
.end method

.method public static setThumb(Lcom/innioasis/music/adapter/MyBaseAdapter;Lcom/innioasis/music/adapter/MyBaseAdapter;)Z
  .registers 8
  .line 461
    const/4 v0, 0
    if-nez p0, :L0
    return v0
  :L0
  .line 462
    nop
  .line 463
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getSelectedIndexList()Ljava/util/List;
    move-result-object v1
  .line 464
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
  .line 465
    const/4 v2, 0
  :L2
    if-nez v2, :L3
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v2
    invoke-virtual { p0, v2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getItem(I)Ljava/lang/Object;
    move-result-object v2
  :L3
  .line 466
    instance-of v3, v2, Lcom/innioasis/y1/database/Song;
    if-nez v3, :L4
    return v0
  :L4
  .line 467
    check-cast v2, Lcom/innioasis/y1/database/Song;
  .line 468
    invoke-static { v2 }, Lcom/innioasis/ipp/Albums;->keyOf(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v3
  .line 469
    if-eqz v3, :L8
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v4
    if-nez v4, :L5
    goto :L8
  :L5
  .line 471
    invoke-static { }, Lcom/innioasis/ipp/Prefs;->file()Landroid/content/SharedPreferences;
    move-result-object v4
  .line 472
    if-nez v4, :L6
    return v0
  :L6
  .line 473
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
  .line 474
    invoke-virtual { v2 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
    invoke-static { p1, v3, v0 }, Lcom/innioasis/ipp/Art;->repaint(Lcom/innioasis/music/adapter/MyBaseAdapter;Ljava/lang/String;Ljava/lang/String;)V
  .line 476
    if-eqz v1, :L7
    invoke-interface { v1 }, Ljava/util/List;->clear()V
  :L7
  .line 477
    invoke-virtual { p0 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  .line 478
    const p0, 2131821061
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->toast(I)V
  .line 479
    const/4 p0, 1
    return p0
  :L8
  .line 469
    return v0
.end method

.method private static stamp(Ljava/lang/String;)Ljava/lang/String;
  .registers 9
  .line 333
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
  .line 334
    new-instance v1, Ljava/io/File;
    invoke-direct { v1, p0 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 335
    const/4 p0, 0
  :L0
    sget-object v2, Lcom/innioasis/ipp/Art;->OWN_THUMB:[Ljava/lang/String;
    array-length v3, v2
    const/16 v4, 59
    const/16 v5, 58
    if-ge p0, v3, :L2
  .line 336
    new-instance v3, Ljava/io/File;
    aget-object v6, v2, p0
    invoke-direct { v3, v1, v6 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 337
    invoke-virtual { v3 }, Ljava/io/File;->isFile()Z
    move-result v6
    if-eqz v6, :L1
    aget-object v2, v2, p0
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v2, v5 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v2
  .line 338
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
  .line 335
    add-int/lit8 p0, p0, 1
    goto :L0
  :L2
  .line 340
    invoke-virtual { v1 }, Ljava/io/File;->getParentFile()Ljava/io/File;
    move-result-object p0
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->chain(Ljava/io/File;)Ljava/lang/String;
    move-result-object p0
  .line 341
    if-eqz p0, :L3
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v1
    if-lez v1, :L3
  .line 342
    new-instance v1, Ljava/io/File;
    invoke-direct { v1, p0 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 344
    invoke-virtual { v1 }, Ljava/io/File;->isFile()Z
    move-result p0
    if-eqz p0, :L3
    const-string p0, "^:"
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
  .line 345
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
  .line 347
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static stampFile()Ljava/io/File;
  .registers 3
  .line 351
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 352
    const/4 v1, 0
    if-nez v0, :L0
    return-object v1
  :L0
  .line 353
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 354
    if-nez v0, :L1
    goto :L2
  :L1
    new-instance v1, Ljava/io/File;
    const-string v2, "ipp_art.txt"
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  :L2
    return-object v1
.end method

.method public static stampRead(Ljava/lang/String;)V
  .catchall { :L0 .. :L4 } :L14
  .catchall { :L4 .. :L7 } :L10
  .catchall { :L8 .. :L9 } :L14
  .catchall { :L11 .. :L12 } :L10
  .catchall { :L12 .. :L13 } :L14
  .registers 4
  :L0
  .line 236
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->trackFolder(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 237
    if-eqz p0, :L13
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v0
    if-nez v0, :L1
    goto :L13
  :L1
  .line 238
    invoke-static { }, Lcom/innioasis/ipp/Art;->loadStamps()V
  .line 239
    sget-object v0, Lcom/innioasis/ipp/Art;->stamps:Ljava/util/Hashtable;
    invoke-virtual { v0, p0 }, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L2
    return-void
  :L2
  .line 240
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->stamp(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1
  .line 241
    invoke-virtual { v1 }, Ljava/lang/String;->length()I
    move-result v2
    if-nez v2, :L3
    return-void
  :L3
  .line 243
    const-class v2, Lcom/innioasis/ipp/Art;
    monitor-enter v2
  :L4
  .line 244
    invoke-virtual { v0, p0, v1 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 245
    const/4 p0, 1
    sput-boolean p0, Lcom/innioasis/ipp/Art;->stampsDirty:Z
  .line 246
    sget-boolean v0, Lcom/innioasis/ipp/Art;->saveAsked:Z
    if-nez v0, :L5
    const/4 v0, 1
    goto :L6
  :L5
    const/4 v0, 0
  :L6
  .line 247
    sput-boolean p0, Lcom/innioasis/ipp/Art;->saveAsked:Z
  .line 248
    monitor-exit v2
  :L7
  .line 249
    if-eqz v0, :L9
  :L8
    new-instance p0, Lcom/innioasis/ipp/Art$Save;
    invoke-direct { p0 }, Lcom/innioasis/ipp/Art$Save;-><init>()V
    const-wide/16 v0, 5000
    invoke-static { p0, v0, v1 }, Lcom/innioasis/ipp/Albums;->later(Ljava/lang/Runnable;J)V
  :L9
  .line 251
    goto :L15
  :L10
  .line 248
    move-exception p0
  :L11
    monitor-exit v2
  :L12
    throw p0
  :L13
  .line 237
    return-void
  :L14
  .line 250
    move-exception p0
  :L15
  .line 252
    return-void
.end method

.method public static thumb(Ljava/lang/String;Ljava/lang/String;I)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L3
  .registers 3
  .line 105
    invoke-static { p0 }, Lcom/innioasis/ipp/Art;->picked(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 106
    if-eqz p0, :L0
  .line 107
    invoke-static { p0, p2 }, Lcom/innioasis/ipp/Art;->pickedArt(Ljava/lang/String;I)Landroid/graphics/Bitmap;
    move-result-object p0
  .line 108
    if-eqz p0, :L0
    return-object p0
  :L0
  .line 111
    sget-object p0, Lcom/innioasis/ipp/Art;->OWN_THUMB:[Ljava/lang/String;
    invoke-static { p1, p0 }, Lcom/innioasis/ipp/Art;->file(Ljava/lang/String;[Ljava/lang/String;)Ljava/io/File;
    move-result-object p0
  .line 112
    if-eqz p0, :L2
  .line 113
    invoke-static { p1 }, Lcom/innioasis/ipp/Art;->stampRead(Ljava/lang/String;)V
  .line 114
    invoke-static { p0, p2, p2 }, Lcom/innioasis/ipp/Art;->decode(Ljava/io/File;II)Landroid/graphics/Bitmap;
    move-result-object p0
  :L1
  .line 115
    if-eqz p0, :L2
    return-object p0
  :L2
  .line 118
    goto :L4
  :L3
  .line 117
    move-exception p0
  :L4
  .line 119
    if-nez p1, :L5
    const/4 p0, 0
    return-object p0
  :L5
  .line 120
    invoke-static { p1 }, Lcom/innioasis/ipp/Art;->hintFor(Ljava/lang/String;)[B
    move-result-object p0
  .line 121
    if-eqz p0, :L6
    invoke-static { p0, p2, p2 }, Lcom/innioasis/ipp/Art;->decode([BII)Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
  :L6
  .line 122
    sget-object p0, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { p0, p1, p2, p2 }, Lcom/innioasis/music/util/Other;->getAlbumCover(Ljava/lang/String;II)Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
.end method

.method public static thumbFromTags(Ljava/lang/String;Ljava/lang/String;)Z
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  .line 154
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
  .line 155
    move-exception p0
  .line 156
    return v0
  :L3
  .line 154
    return v0
.end method

.method private static toast(I)V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
  :L0
  .line 517
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 518
    if-eqz v0, :L1
    invoke-virtual { v0, p0 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object p0
    const/4 v1, 0
    invoke-static { v0, p0, v1 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/widget/Toast;->show()V
  :L1
  .line 520
    goto :L3
  :L2
  .line 519
    move-exception p0
  :L3
  .line 521
    return-void
.end method
