.class public final Lcom/innioasis/ipp/CoverCache;
.super Ljava/lang/Object;
.source "CoverCache.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/CoverCache$Save;
  }
.end annotation

.field private final static FILE:Ljava/lang/Object;

.field private final static ROOT:Ljava/lang/String; = "/storage/"

.field private final static SAVE:Ljava/lang/Object;

.field private final static SAVE_DELAY_MS:J = 5000L

.field private final static SEP:C = '\u0001'

.field private static lastMiss:J

.field private final static mem:Ljava/util/Hashtable;

.field private final static miss:Ljava/util/Hashtable;

.field private static volatile missDirty:Z

.field private static volatile missLoaded:Z

.field static volatile rowBlank:Landroid/graphics/Bitmap;

.field private static saveAsked:Z

.field private static swept:Z

.method static constructor <clinit>()V
  .registers 1
  .line 25
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/CoverCache;->mem:Ljava/util/Hashtable;
  .line 26
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/CoverCache;->miss:Ljava/util/Hashtable;
  .line 137
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/CoverCache;->SAVE:Ljava/lang/Object;
  .line 213
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    sput-object v0, Lcom/innioasis/ipp/CoverCache;->FILE:Ljava/lang/Object;
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 23
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method static synthetic access$000()Ljava/lang/Object;
  .registers 1
  .line 23
    sget-object v0, Lcom/innioasis/ipp/CoverCache;->SAVE:Ljava/lang/Object;
    return-object v0
.end method

.method static synthetic access$100()J
  .registers 2
  .line 23
    sget-wide v0, Lcom/innioasis/ipp/CoverCache;->lastMiss:J
    return-wide v0
.end method

.method static synthetic access$202(Z)Z
  .registers 1
  .line 23
    sput-boolean p0, Lcom/innioasis/ipp/CoverCache;->saveAsked:Z
    return p0
.end method

.method static synthetic access$300()V
  .registers 0
  .line 23
    invoke-static { }, Lcom/innioasis/ipp/CoverCache;->saveMiss()V
    return-void
.end method

.method private static askSave()V
  .catchall { :L0 .. :L3 } :L5
  .catchall { :L6 .. :L7 } :L5
  .registers 4
  .line 119
    sget-object v0, Lcom/innioasis/ipp/CoverCache;->SAVE:Ljava/lang/Object;
    monitor-enter v0
  .line 120
    const/4 v1, 1
  :L0
    sput-boolean v1, Lcom/innioasis/ipp/CoverCache;->missDirty:Z
  .line 121
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    sput-wide v2, Lcom/innioasis/ipp/CoverCache;->lastMiss:J
  .line 122
    sget-boolean v2, Lcom/innioasis/ipp/CoverCache;->saveAsked:Z
    if-nez v2, :L1
    const/4 v2, 1
    goto :L2
  :L1
    const/4 v2, 0
  :L2
  .line 123
    sput-boolean v1, Lcom/innioasis/ipp/CoverCache;->saveAsked:Z
  .line 124
    monitor-exit v0
  :L3
  .line 125
    if-eqz v2, :L4
    new-instance v0, Lcom/innioasis/ipp/CoverCache$Save;
    invoke-direct { v0 }, Lcom/innioasis/ipp/CoverCache$Save;-><init>()V
    const-wide/16 v1, 5000
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Albums;->later(Ljava/lang/Runnable;J)V
  :L4
  .line 126
    return-void
  :L5
  .line 124
    move-exception v1
  :L6
    monitor-exit v0
  :L7
    throw v1
.end method

.method public static clear()V
  .catchall { :L0 .. :L3 } :L4
  .registers 4
  .line 383
    sget-object v0, Lcom/innioasis/ipp/CoverCache;->mem:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 384
    invoke-static { }, Lcom/innioasis/ipp/CoverCache;->dropMiss()V
  :L0
  .line 386
    invoke-static { }, Lcom/innioasis/ipp/CoverCache;->dir()Ljava/io/File;
    move-result-object v0
  .line 387
    if-eqz v0, :L3
  .line 388
    invoke-virtual { v0 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v1
  .line 389
    if-eqz v1, :L3
  .line 390
    const/4 v2, 0
  :L1
    array-length v3, v1
    if-ge v2, v3, :L2
  .line 391
    aget-object v3, v1, v2
    invoke-virtual { v3 }, Ljava/io/File;->delete()Z
  .line 390
    add-int/lit8 v2, v2, 1
    goto :L1
  :L2
  .line 393
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  :L3
  .line 397
    goto :L5
  :L4
  .line 396
    move-exception v0
  :L5
  .line 398
    return-void
.end method

.method public static clearMiss()V
  .registers 1
  .line 357
    invoke-static { }, Lcom/innioasis/ipp/Scan;->keepsMisses()Z
    move-result v0
    if-eqz v0, :L0
    return-void
  :L0
  .line 358
    invoke-static { }, Lcom/innioasis/ipp/CoverCache;->dropMiss()V
  .line 359
    return-void
.end method

.method private static dir()Ljava/io/File;
  .catchall { :L3 .. :L5 } :L7
  .registers 5
  .line 38
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 39
    const/4 v1, 0
    if-nez v0, :L0
  .line 40
    return-object v1
  :L0
  .line 42
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  .line 43
    if-nez v0, :L1
  .line 44
    return-object v1
  :L1
  .line 46
    new-instance v1, Ljava/io/File;
    const-string v2, "ipp_covers"
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  .line 47
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v0
    if-nez v0, :L2
  .line 48
    invoke-virtual { v1 }, Ljava/io/File;->mkdirs()Z
  :L2
  .line 50
    sget-boolean v0, Lcom/innioasis/ipp/CoverCache;->swept:Z
    if-nez v0, :L8
  .line 51
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/CoverCache;->swept:Z
  :L3
  .line 53
    invoke-virtual { v1 }, Ljava/io/File;->listFiles()[Ljava/io/File;
    move-result-object v0
  .line 54
    if-eqz v0, :L6
  .line 55
    const/4 v2, 0
  :L4
    array-length v3, v0
    if-ge v2, v3, :L6
  .line 56
    aget-object v3, v0, v2
    invoke-virtual { v3 }, Ljava/io/File;->getName()Ljava/lang/String;
    move-result-object v3
    const-string v4, "-50q.jpg"
    invoke-virtual { v3, v4 }, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v3
    if-nez v3, :L5
  .line 57
    aget-object v3, v0, v2
    invoke-virtual { v3 }, Ljava/io/File;->delete()Z
  :L5
  .line 55
    add-int/lit8 v2, v2, 1
    goto :L4
  :L6
  .line 62
    goto :L8
  :L7
  .line 61
    move-exception v0
  :L8
  .line 64
    return-object v1
.end method

.method private static dropMiss()V
  .catchall { :L0 .. :L1 } :L9
  .catchall { :L2 .. :L3 } :L7
  .catchall { :L3 .. :L4 } :L5
  .catchall { :L6 .. :L8 } :L7
  .catchall { :L10 .. :L11 } :L9
  .registers 2
  .line 362
    const-class v0, Lcom/innioasis/ipp/CoverCache;
    monitor-enter v0
  .line 363
    const/4 v1, 1
  :L0
    sput-boolean v1, Lcom/innioasis/ipp/CoverCache;->missLoaded:Z
  .line 364
    monitor-exit v0
  :L1
  .line 366
    sget-object v1, Lcom/innioasis/ipp/CoverCache;->FILE:Ljava/lang/Object;
    monitor-enter v1
  :L2
  .line 367
    sget-object v0, Lcom/innioasis/ipp/CoverCache;->miss:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->clear()V
  .line 368
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/CoverCache;->missDirty:Z
  :L3
  .line 370
    invoke-static { }, Lcom/innioasis/ipp/CoverCache;->missFile()Ljava/io/File;
    move-result-object v0
  .line 371
    if-eqz v0, :L4
    invoke-virtual { v0 }, Ljava/io/File;->delete()Z
  :L4
  .line 373
    goto :L6
  :L5
  .line 372
    move-exception v0
  :L6
  .line 374
    monitor-exit v1
  .line 375
    return-void
  :L7
  .line 374
    move-exception v0
    monitor-exit v1
  :L8
    throw v0
  :L9
  .line 364
    move-exception v1
  :L10
    monitor-exit v0
  :L11
    throw v1
.end method

.method private static file(Ljava/lang/String;)Ljava/io/File;
  .registers 3
  .line 69
    invoke-static { }, Lcom/innioasis/ipp/CoverCache;->dir()Ljava/io/File;
    move-result-object v0
  .line 70
    if-nez v0, :L0
  .line 71
    const/4 p0, 0
    return-object p0
  :L0
  .line 73
    new-instance v1, Ljava/io/File;
    invoke-static { p0 }, Lcom/innioasis/ipp/CoverCache;->name(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
    invoke-direct { v1, v0, p0 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    return-object v1
.end method

.method public static forget(Ljava/lang/String;)V
  .catchall { :L1 .. :L2 } :L3
  .registers 2
  .line 340
    if-nez p0, :L0
  .line 341
    return-void
  :L0
  .line 343
    sget-object v0, Lcom/innioasis/ipp/CoverCache;->mem:Ljava/util/Hashtable;
    invoke-virtual { v0, p0 }, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 344
    invoke-static { }, Lcom/innioasis/ipp/CoverCache;->loadMiss()V
  .line 345
    sget-object v0, Lcom/innioasis/ipp/CoverCache;->miss:Ljava/util/Hashtable;
    invoke-virtual { v0, p0 }, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v0
    if-eqz v0, :L1
    invoke-static { }, Lcom/innioasis/ipp/CoverCache;->askSave()V
  :L1
  .line 347
    invoke-static { p0 }, Lcom/innioasis/ipp/CoverCache;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object p0
  .line 348
    if-eqz p0, :L2
  .line 349
    invoke-virtual { p0 }, Ljava/io/File;->delete()Z
  :L2
  .line 352
    goto :L4
  :L3
  .line 351
    move-exception p0
  :L4
  .line 353
    return-void
.end method

.method public static get(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;
  .catchall { :L4 .. :L6 } :L7
  .registers 7
  .line 298
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 299
    const/4 v0, 0
    if-nez p0, :L0
  .line 300
    return-object v0
  :L0
  .line 302
    invoke-static { p0 }, Lcom/innioasis/ipp/CoverCache;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 303
    if-eqz v1, :L1
  .line 304
    return-object v1
  :L1
  .line 306
    sget-object v2, Lcom/innioasis/ipp/CoverCache;->miss:Ljava/util/Hashtable;
    invoke-virtual { v2, p0 }, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z
    move-result v2
    if-eqz v2, :L2
  .line 307
    return-object v0
  :L2
  .line 309
    const/4 v2, 0
    if-nez p1, :L3
  .line 310
    invoke-static { p0, v0, v2 }, Lcom/innioasis/ipp/CoverCache;->remember(Ljava/lang/String;Landroid/graphics/Bitmap;Z)V
  .line 311
    return-object v0
  :L3
  .line 313
    nop
  .line 316
    const/4 v0, 1
    const/16 v3, 50
  :L4
    invoke-static { p0, p1, v3 }, Lcom/innioasis/ipp/Art;->thumb(Ljava/lang/String;Ljava/lang/String;I)Landroid/graphics/Bitmap;
    move-result-object p1
  .line 317
    if-eqz p1, :L6
  .line 318
    invoke-static { p1, v3 }, Lcom/innioasis/ipp/Cover;->square(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 319
    if-nez v1, :L5
  .line 320
    move-object v1, p1
  :L5
  .line 322
    invoke-static { p0 }, Lcom/innioasis/ipp/CoverCache;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object p1
  .line 323
    if-eqz p1, :L6
  .line 324
    new-instance v3, Ljava/io/FileOutputStream;
    invoke-direct { v3, p1 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
  .line 327
    sget-object p1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;
    const/16 v4, 85
    invoke-virtual { v1, p1, v4, v3 }, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
  .line 328
    invoke-virtual { v3 }, Ljava/io/FileOutputStream;->close()V
  :L6
  .line 333
    goto :L8
  :L7
  .line 331
    move-exception p1
  .line 332
    const/4 v2, 1
  :L8
  .line 334
    xor-int/lit8 p1, v2, 1
    invoke-static { p0, v1, p1 }, Lcom/innioasis/ipp/CoverCache;->remember(Ljava/lang/String;Landroid/graphics/Bitmap;Z)V
  .line 335
    return-object v1
.end method

.method static loadMiss()V
  .catchall { :L1 .. :L3 } :L15
  .catchall { :L3 .. :L10 } :L13
  .catchall { :L12 .. :L16 } :L15
  .registers 7
  .line 148
    sget-boolean v0, Lcom/innioasis/ipp/CoverCache;->missLoaded:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 149
    const-class v0, Lcom/innioasis/ipp/CoverCache;
    monitor-enter v0
  :L1
  .line 150
    sget-boolean v1, Lcom/innioasis/ipp/CoverCache;->missLoaded:Z
    if-eqz v1, :L2
    monitor-exit v0
    return-void
  :L2
  .line 151
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/CoverCache;->missLoaded:Z
  :L3
  .line 153
    invoke-static { }, Lcom/innioasis/ipp/CoverCache;->missFile()Ljava/io/File;
    move-result-object v1
  .line 154
    if-eqz v1, :L12
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-nez v2, :L4
    goto :L12
  :L4
  .line 155
    new-instance v2, Ljava/io/FileInputStream;
    invoke-direct { v2, v1 }, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
  .line 156
    invoke-virtual { v1 }, Ljava/io/File;->length()J
    move-result-wide v3
    long-to-int v1, v3
    new-array v3, v1, [B
  .line 157
    const/4 v4, 0
    const/4 v5, 0
  :L5
  .line 158
    if-ge v5, v1, :L7
  .line 159
    sub-int v6, v1, v5
    invoke-virtual { v2, v3, v5, v6 }, Ljava/io/FileInputStream;->read([BII)I
    move-result v6
  .line 160
    if-gez v6, :L6
    goto :L7
  :L6
  .line 161
    add-int/2addr v5, v6
  .line 162
    goto :L5
  :L7
  .line 163
    invoke-virtual { v2 }, Ljava/io/FileInputStream;->close()V
  .line 164
    new-instance v1, Ljava/lang/String;
    const-string v2, "UTF-8"
    invoke-direct { v1, v3, v4, v5, v2 }, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    const-string v2, "\n"
    invoke-virtual { v1, v2 }, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v1
  .line 165
    nop
  :L8
    array-length v2, v1
    if-ge v4, v2, :L11
  .line 166
    aget-object v2, v1, v4
    invoke-virtual { v2 }, Ljava/lang/String;->length()I
    move-result v2
    if-nez v2, :L9
    goto :L10
  :L9
  .line 167
    aget-object v2, v1, v4
    invoke-static { v2 }, Lcom/innioasis/ipp/CoverCache;->unpack(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
  .line 168
    sget-object v3, Lcom/innioasis/ipp/CoverCache;->miss:Ljava/util/Hashtable;
    invoke-virtual { v3, v2, v2 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  :L10
  .line 165
    add-int/lit8 v4, v4, 1
    goto :L8
  :L11
  .line 171
    goto :L14
  :L12
  .line 154
    monitor-exit v0
    return-void
  :L13
  .line 170
    move-exception v1
  :L14
  .line 172
    monitor-exit v0
  .line 173
    return-void
  :L15
  .line 172
    move-exception v1
    monitor-exit v0
  :L16
    goto :L18
  :L17
    throw v1
  :L18
    goto :L17
.end method

.method static memBytes()J
  .registers 2
  .line 30
    new-instance v0, Ljava/util/ArrayList;
    sget-object v1, Lcom/innioasis/ipp/CoverCache;->mem:Ljava/util/Hashtable;
    invoke-virtual { v1 }, Ljava/util/Hashtable;->values()Ljava/util/Collection;
    move-result-object v1
    invoke-direct { v0, v1 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->bitmapBytes(Ljava/util/Collection;)J
    move-result-wide v0
    return-wide v0
.end method

.method private static missFile()Ljava/io/File;
  .registers 3
  .line 140
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v0
  .line 141
    const/4 v1, 0
    if-nez v0, :L0
    move-object v0, v1
    goto :L1
  :L0
    invoke-virtual { v0 }, Landroid/content/Context;->getCacheDir()Ljava/io/File;
    move-result-object v0
  :L1
  .line 143
    if-nez v0, :L2
    goto :L3
  :L2
    new-instance v1, Ljava/io/File;
    const-string v2, "ipp_covers_none.txt"
    invoke-direct { v1, v0, v2 }, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
  :L3
    return-object v1
.end method

.method private static name(Ljava/lang/String;)Ljava/lang/String;
  .registers 3
  .line 77
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
    const-string v0, "-50q.jpg"
    invoke-virtual { p0, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
.end method

.method private static pack(Ljava/lang/String;)Ljava/lang/String;
  .registers 5
  .line 182
    const/4 v0, 1
    invoke-virtual { p0, v0 }, Ljava/lang/String;->indexOf(I)I
    move-result v1
  .line 183
    if-ltz v1, :L1
    add-int/2addr v1, v0
    const-string v0, "/storage/"
    invoke-virtual { p0, v0, v1 }, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z
    move-result v2
    if-nez v2, :L0
    goto :L1
  :L0
  .line 184
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const/4 v3, 0
    invoke-virtual { p0, v3, v1 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v3
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-virtual { v0 }, Ljava/lang/String;->length()I
    move-result v0
    add-int/2addr v1, v0
    invoke-virtual { p0, v1 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v2, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L1
  .line 183
    return-object p0
.end method

.method public static peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
  .catchall { :L3 .. :L4 } :L5
  .registers 4
  .line 254
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 255
    const/4 v0, 0
    if-nez p0, :L0
  .line 256
    return-object v0
  :L0
  .line 258
    sget-object v1, Lcom/innioasis/ipp/CoverCache;->mem:Ljava/util/Hashtable;
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroid/graphics/Bitmap;
  .line 259
    if-eqz v1, :L1
  .line 260
    return-object v1
  :L1
  .line 262
    invoke-static { }, Lcom/innioasis/ipp/CoverCache;->loadMiss()V
  .line 263
    sget-object v1, Lcom/innioasis/ipp/CoverCache;->miss:Ljava/util/Hashtable;
    invoke-virtual { v1, p0 }, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L2
  .line 264
    return-object v0
  :L2
  .line 266
    nop
  :L3
  .line 268
    invoke-static { p0 }, Lcom/innioasis/ipp/CoverCache;->file(Ljava/lang/String;)Ljava/io/File;
    move-result-object v1
  .line 269
    if-eqz v1, :L4
    invoke-virtual { v1 }, Ljava/io/File;->exists()Z
    move-result v2
    if-eqz v2, :L4
  .line 270
    invoke-virtual { v1 }, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    move-result-object v1
    invoke-static { v1 }, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;
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
  .line 276
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/CoverCache;->remember(Ljava/lang/String;Landroid/graphics/Bitmap;)V
  :L7
  .line 278
    return-object v0
.end method

.method static prune(Ljava/util/Set;Z)J
  .catchall { :L2 .. :L5 } :L6
  .catchall { :L7 .. :L8 } :L6
  .registers 7
  .line 82
    new-instance v0, Ljava/util/HashSet;
    invoke-direct { v0 }, Ljava/util/HashSet;-><init>()V
  .line 83
    invoke-interface { p0 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v1
  :L0
  .line 84
    invoke-interface { v1 }, Ljava/util/Iterator;->hasNext()Z
    move-result v2
    if-eqz v2, :L1
    invoke-interface { v1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Ljava/lang/String;
    invoke-static { v2 }, Lcom/innioasis/ipp/CoverCache;->name(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v0, v2 }, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    goto :L0
  :L1
  .line 85
    if-eqz p1, :L9
  .line 86
    invoke-static { }, Lcom/innioasis/ipp/CoverCache;->loadMiss()V
  .line 87
    nop
  .line 88
    sget-object v1, Lcom/innioasis/ipp/CoverCache;->miss:Ljava/util/Hashtable;
    monitor-enter v1
  :L2
  .line 89
    invoke-virtual { v1 }, Ljava/util/Hashtable;->keySet()Ljava/util/Set;
    move-result-object v2
    invoke-interface { v2 }, Ljava/util/Set;->iterator()Ljava/util/Iterator;
    move-result-object v2
    const/4 v3, 0
  :L3
  .line 90
    invoke-interface { v2 }, Ljava/util/Iterator;->hasNext()Z
    move-result v4
    if-eqz v4, :L4
  .line 91
    invoke-interface { v2 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
    move-result-object v4
    invoke-interface { p0, v4 }, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    move-result v4
    if-nez v4, :L3
  .line 92
    invoke-interface { v2 }, Ljava/util/Iterator;->remove()V
  .line 93
    const/4 v3, 1
    goto :L3
  :L4
  .line 96
    monitor-exit v1
  :L5
  .line 97
    if-eqz v3, :L9
    invoke-static { }, Lcom/innioasis/ipp/CoverCache;->askSave()V
    goto :L9
  :L6
  .line 96
    move-exception p0
  :L7
    monitor-exit v1
  :L8
    throw p0
  :L9
  .line 99
    invoke-static { }, Lcom/innioasis/ipp/CoverCache;->dir()Ljava/io/File;
    move-result-object p0
    invoke-static { p0, v0, p1 }, Lcom/innioasis/ipp/Stale;->files(Ljava/io/File;Ljava/util/Set;Z)J
    move-result-wide p0
    return-wide p0
.end method

.method private static remember(Ljava/lang/String;Landroid/graphics/Bitmap;)V
  .registers 3
  .line 103
    const/4 v0, 1
    invoke-static { p0, p1, v0 }, Lcom/innioasis/ipp/CoverCache;->remember(Ljava/lang/String;Landroid/graphics/Bitmap;Z)V
  .line 104
    return-void
.end method

.method private static remember(Ljava/lang/String;Landroid/graphics/Bitmap;Z)V
  .registers 3
  .line 108
    if-eqz p1, :L0
  .line 109
    sget-object p2, Lcom/innioasis/ipp/CoverCache;->mem:Ljava/util/Hashtable;
    invoke-virtual { p2, p0, p1 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 110
    return-void
  :L0
  .line 112
    invoke-static { }, Lcom/innioasis/ipp/CoverCache;->loadMiss()V
  .line 113
    sget-object p1, Lcom/innioasis/ipp/CoverCache;->miss:Ljava/util/Hashtable;
    invoke-virtual { p1, p0, p0 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p1
    if-nez p1, :L1
    if-eqz p2, :L1
    const/16 p1, 10
    invoke-virtual { p0, p1 }, Ljava/lang/String;->indexOf(I)I
    move-result p0
    if-gez p0, :L1
    invoke-static { }, Lcom/innioasis/ipp/CoverCache;->askSave()V
  :L1
  .line 114
    return-void
.end method

.method public static rowPeek(Ljava/lang/String;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .registers 3
  .line 289
    sput-object p1, Lcom/innioasis/ipp/CoverCache;->rowBlank:Landroid/graphics/Bitmap;
  .line 290
    invoke-static { p0 }, Lcom/innioasis/ipp/CoverCache;->peek(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 291
    if-eqz v0, :L0
    return-object v0
  :L0
  .line 292
    invoke-static { p0 }, Lcom/innioasis/ipp/Albums;->coverKey(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p0
  .line 293
    if-eqz p0, :L1
    sget-object v0, Lcom/innioasis/ipp/CoverCache;->miss:Ljava/util/Hashtable;
    invoke-virtual { v0, p0 }, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z
    move-result p0
    if-eqz p0, :L1
    goto :L2
  :L1
    const/4 p1, 0
  :L2
    return-object p1
.end method

.method private static saveLocked()V
  .catchall { :L1 .. :L3 } :L16
  .catchall { :L3 .. :L4 } :L13
  .catchall { :L4 .. :L6 } :L16
  .catchall { :L7 .. :L9 } :L12
  .catchall { :L10 .. :L13 } :L16
  .catchall { :L14 .. :L15 } :L13
  .catchall { :L15 .. :L16 } :L16
  .registers 8
  .line 216
    sget-boolean v0, Lcom/innioasis/ipp/CoverCache;->missDirty:Z
    if-nez v0, :L0
    return-void
  :L0
  .line 217
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/CoverCache;->missDirty:Z
  :L1
  .line 219
    invoke-static { }, Lcom/innioasis/ipp/CoverCache;->missFile()Ljava/io/File;
    move-result-object v1
  .line 220
    if-nez v1, :L2
    return-void
  :L2
  .line 222
    sget-object v2, Lcom/innioasis/ipp/CoverCache;->miss:Ljava/util/Hashtable;
    monitor-enter v2
  :L3
  .line 223
    invoke-virtual { v2 }, Ljava/util/Hashtable;->keySet()Ljava/util/Set;
    move-result-object v3
    invoke-interface { v3 }, Ljava/util/Set;->toArray()[Ljava/lang/Object;
    move-result-object v3
  .line 224
    monitor-exit v2
  :L4
  .line 225
    array-length v2, v3
    if-nez v2, :L5
  .line 226
    invoke-virtual { v1 }, Ljava/io/File;->delete()Z
  .line 227
    return-void
  :L5
  .line 231
    new-instance v2, Ljava/io/File;
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual { v1 }, Ljava/io/File;->getPath()Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    const-string v5, ".tmp"
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v4
    invoke-direct { v2, v4 }, Ljava/io/File;-><init>(Ljava/lang/String;)V
  .line 232
    new-instance v4, Ljava/io/BufferedWriter;
    new-instance v5, Ljava/io/OutputStreamWriter;
    new-instance v6, Ljava/io/FileOutputStream;
    invoke-direct { v6, v2 }, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    const-string v7, "UTF-8"
    invoke-direct { v5, v6, v7 }, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V
    const/16 v6, 8192
    invoke-direct { v4, v5, v6 }, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;I)V
  :L6
  .line 235
    nop
  :L7
    array-length v5, v3
    if-ge v0, v5, :L10
  .line 236
    aget-object v5, v3, v0
    check-cast v5, Ljava/lang/String;
  .line 237
    const/16 v6, 10
    invoke-virtual { v5, v6 }, Ljava/lang/String;->indexOf(I)I
    move-result v7
    if-ltz v7, :L8
    goto :L9
  :L8
  .line 238
    invoke-static { v5 }, Lcom/innioasis/ipp/CoverCache;->pack(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v5
    invoke-virtual { v4, v5 }, Ljava/io/Writer;->write(Ljava/lang/String;)V
  .line 239
    invoke-virtual { v4, v6 }, Ljava/io/Writer;->write(I)V
  :L9
  .line 235
    add-int/lit8 v0, v0, 1
    goto :L7
  :L10
  .line 242
    invoke-virtual { v4 }, Ljava/io/Writer;->close()V
  .line 243
    nop
  .line 244
    invoke-virtual { v2, v1 }, Ljava/io/File;->renameTo(Ljava/io/File;)Z
    move-result v0
    if-nez v0, :L11
    invoke-virtual { v2 }, Ljava/io/File;->delete()Z
  :L11
  .line 246
    goto :L17
  :L12
  .line 242
    move-exception v0
    invoke-virtual { v4 }, Ljava/io/Writer;->close()V
  .line 243
    throw v0
  :L13
  .line 224
    move-exception v0
  :L14
    monitor-exit v2
  :L15
    throw v0
  :L16
  .line 245
    move-exception v0
  :L17
  .line 247
    return-void
.end method

.method private static saveMiss()V
  .catchall { :L0 .. :L2 } :L1
  .registers 2
  .line 208
    sget-object v0, Lcom/innioasis/ipp/CoverCache;->FILE:Ljava/lang/Object;
    monitor-enter v0
  :L0
  .line 209
    invoke-static { }, Lcom/innioasis/ipp/CoverCache;->saveLocked()V
  .line 210
    monitor-exit v0
  .line 211
    return-void
  :L1
  .line 210
    move-exception v1
    monitor-exit v0
  :L2
    throw v1
.end method

.method static scanEnded(Z)V
  .registers 1
  .line 379
    if-eqz p0, :L0
    invoke-static { }, Lcom/innioasis/ipp/CoverCache;->dropMiss()V
  :L0
  .line 380
    return-void
.end method

.method private static unpack(Ljava/lang/String;)Ljava/lang/String;
  .registers 4
  .line 188
    const/4 v0, 1
    invoke-virtual { p0, v0 }, Ljava/lang/String;->indexOf(I)I
    move-result v1
  .line 189
    if-ltz v1, :L1
    add-int/2addr v1, v0
    invoke-virtual { p0 }, Ljava/lang/String;->length()I
    move-result v0
    if-ge v1, v0, :L1
    invoke-virtual { p0, v1 }, Ljava/lang/String;->charAt(I)C
    move-result v0
    const/16 v2, 47
    if-ne v0, v2, :L0
    goto :L1
  :L0
  .line 190
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const/4 v2, 0
    invoke-virtual { p0, v2, v1 }, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v2, "/storage/"
    invoke-virtual { v0, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { p0, v1 }, Ljava/lang/String;->substring(I)Ljava/lang/String;
    move-result-object p0
    invoke-virtual { v0, p0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object p0
    invoke-virtual { p0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0
    return-object p0
  :L1
  .line 189
    return-object p0
.end method
