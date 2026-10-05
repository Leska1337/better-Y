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

.field public final static KEEP:I = 10

.field private blank:Landroid/graphics/Bitmap;

.field private final born:Ljava/util/Hashtable;

.field private final items:Ljava/util/List;

.field private final onSlide:Ljava/lang/Runnable;

.field private readArtist:Z

.field public final slides:Ljava/util/Hashtable;

.field private volatile stop:Z

.field private volatile target:I

.field private final ui:Landroid/os/Handler;

.field private final wake:Ljava/lang/Object;

.method public constructor <init>(Ljava/util/List;Landroid/os/Handler;Ljava/lang/Runnable;)V
  .registers 5
  .line 245
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 236
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->slides:Ljava/util/Hashtable;
  .line 238
    new-instance v0, Ljava/util/Hashtable;
    invoke-direct { v0 }, Ljava/util/Hashtable;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->born:Ljava/util/Hashtable;
  .line 243
    new-instance v0, Ljava/lang/Object;
    invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
  .line 246
    iput-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->items:Ljava/util/List;
  .line 247
    iput-object p2, p0, Lcom/innioasis/ipp/Flow$Loader;->ui:Landroid/os/Handler;
  .line 248
    iput-object p3, p0, Lcom/innioasis/ipp/Flow$Loader;->onSlide:Ljava/lang/Runnable;
  .line 249
    return-void
.end method

.method private evict(I)V
  .registers 6
  .line 322
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->slides:Ljava/util/Hashtable;
    invoke-virtual { v0 }, Ljava/util/Hashtable;->keySet()Ljava/util/Set;
    move-result-object v0
    invoke-interface { v0 }, Ljava/util/Set;->toArray()[Ljava/lang/Object;
    move-result-object v0
  .line 323
    const/4 v1, 0
  :L0
    array-length v2, v0
    if-ge v1, v2, :L2
  .line 324
    aget-object v2, v0, v1
    check-cast v2, Ljava/lang/Integer;
    invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
    move-result v2
  .line 325
    sub-int/2addr v2, p1
    invoke-static { v2 }, Ljava/lang/Math;->abs(I)I
    move-result v2
    const/16 v3, 10
    if-le v2, v3, :L1
  .line 326
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->slides:Ljava/util/Hashtable;
    aget-object v3, v0, v1
    invoke-virtual { v2, v3 }, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  .line 327
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->born:Ljava/util/Hashtable;
    aget-object v3, v0, v1
    invoke-virtual { v2, v3 }, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;
  :L1
  .line 323
    add-int/lit8 v1, v1, 1
    goto :L0
  :L2
  .line 330
    return-void
.end method

.method private has(I)Z
  .registers 3
  .line 318
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
  .catchall { :L5 .. :L6 } :L12
  .catch Ljava/lang/InterruptedException; { :L7 .. :L8 } :L9
  .catchall { :L7 .. :L8 } :L12
  .catchall { :L10 .. :L13 } :L12
  .registers 7
  .line 282
    nop
  :L0
    iget-boolean v0, p0, Lcom/innioasis/ipp/Flow$Loader;->stop:Z
    if-nez v0, :L19
  .line 283
    iget v0, p0, Lcom/innioasis/ipp/Flow$Loader;->target:I
  .line 284
    nop
  .line 285
    const/4 v1, -1
    const/4 v2, 0
  :L1
    const/4 v3, 7
    if-gt v2, v3, :L4
    if-gez v1, :L4
  .line 286
    add-int v3, v0, v2
    invoke-direct { p0, v3 }, Lcom/innioasis/ipp/Flow$Loader;->has(I)Z
    move-result v4
    if-eqz v4, :L2
    move v1, v3
    goto :L3
  :L2
  .line 287
    sub-int v3, v0, v2
    invoke-direct { p0, v3 }, Lcom/innioasis/ipp/Flow$Loader;->has(I)Z
    move-result v4
    if-eqz v4, :L3
    move v1, v3
  :L3
  .line 285
    add-int/lit8 v2, v2, 1
    goto :L1
  :L4
  .line 289
    if-gez v1, :L14
  .line 290
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/Flow$Loader;->evict(I)V
  .line 291
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    monitor-enter v2
  :L5
  .line 292
    iget v1, p0, Lcom/innioasis/ipp/Flow$Loader;->target:I
    if-ne v1, v0, :L11
    iget-boolean v0, p0, Lcom/innioasis/ipp/Flow$Loader;->stop:Z
  :L6
    if-nez v0, :L11
  :L7
  .line 293
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    invoke-virtual { v0 }, Ljava/lang/Object;->wait()V
  :L8
    goto :L11
  :L9
    move-exception v0
  :L10
    monitor-exit v2
    return-void
  :L11
  .line 295
    monitor-exit v2
  .line 296
    goto :L0
  :L12
  .line 295
    move-exception v0
    monitor-exit v2
  :L13
    throw v0
  :L14
  .line 298
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->items:Ljava/util/List;
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/ipp/Flow$Item;
  .line 299
    iget-object v2, v0, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    invoke-static { v2 }, Lcom/innioasis/ipp/AlbumArtist;->needsRead(Ljava/lang/String;)Z
    move-result v2
    if-eqz v2, :L15
  .line 300
    iget-object v2, v0, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    iget-object v3, v0, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
    iget-object v4, v0, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    iget-object v5, v0, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v5
    invoke-static { v4, v5 }, Lcom/innioasis/ipp/AlbumArtist;->read(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4
    invoke-static { v2, v3, v4 }, Lcom/innioasis/ipp/Flow;->artistOf(Ljava/lang/String;Lcom/innioasis/y1/database/Song;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2
    iput-object v2, v0, Lcom/innioasis/ipp/Flow$Item;->artist:Ljava/lang/String;
  .line 301
    const/4 v2, 1
    iput-boolean v2, p0, Lcom/innioasis/ipp/Flow$Loader;->readArtist:Z
  :L15
  .line 303
    invoke-static { v0 }, Lcom/innioasis/ipp/Flow;->cover(Lcom/innioasis/ipp/Flow$Item;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 305
    if-nez v0, :L17
  .line 306
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->blank:Landroid/graphics/Bitmap;
    if-nez v0, :L16
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Flow;->slide(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->blank:Landroid/graphics/Bitmap;
  :L16
  .line 307
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->blank:Landroid/graphics/Bitmap;
    goto :L18
  :L17
  .line 309
    invoke-static { v0 }, Lcom/innioasis/ipp/Flow;->slide(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object v0
  :L18
  .line 311
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->born:Ljava/util/Hashtable;
    invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v3
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
    invoke-static { v4, v5 }, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v4
    invoke-virtual { v2, v3, v4 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 312
    iget-object v2, p0, Lcom/innioasis/ipp/Flow$Loader;->slides:Ljava/util/Hashtable;
    invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v1
    invoke-virtual { v2, v1, v0 }, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
  .line 313
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->ui:Landroid/os/Handler;
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->onSlide:Ljava/lang/Runnable;
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 314
    goto/16 :L0
  :L19
  .line 315
    return-void
.end method

.method public age(I)J
  .registers 6
  .line 268
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->born:Ljava/util/Hashtable;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
    invoke-virtual { v0, p1 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p1
  .line 269
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
  .line 252
    iput p1, p0, Lcom/innioasis/ipp/Flow$Loader;->target:I
  .line 253
    iget-object p1, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    monitor-enter p1
  :L0
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    invoke-virtual { v0 }, Ljava/lang/Object;->notifyAll()V
    monitor-exit p1
  .line 254
    return-void
  :L1
  .line 253
    move-exception v0
    monitor-exit p1
  :L2
    throw v0
.end method

.method public get(I)Landroid/graphics/Bitmap;
  .registers 3
  .line 262
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->slides:Ljava/util/Hashtable;
    invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object p1
    invoke-virtual { v0, p1 }, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object p1
  .line 263
    if-nez p1, :L0
    const/4 p1, 0
    goto :L1
  :L0
    check-cast p1, Landroid/graphics/Bitmap;
  :L1
    return-object p1
.end method

.method public quit()V
  .catchall { :L0 .. :L2 } :L1
  .registers 3
  .line 257
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/Flow$Loader;->stop:Z
  .line 258
    iget-object v0, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    monitor-enter v0
  :L0
    iget-object v1, p0, Lcom/innioasis/ipp/Flow$Loader;->wake:Ljava/lang/Object;
    invoke-virtual { v1 }, Ljava/lang/Object;->notifyAll()V
    monitor-exit v0
  .line 259
    return-void
  :L1
  .line 258
    move-exception v1
    monitor-exit v0
  :L2
    throw v1
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L3
  .registers 3
  .line 273
    const/16 v0, 10
    invoke-static { v0 }, Landroid/os/Process;->setThreadPriority(I)V
  :L0
  .line 275
    invoke-direct { p0 }, Lcom/innioasis/ipp/Flow$Loader;->loop()V
  :L1
  .line 277
    iget-boolean v0, p0, Lcom/innioasis/ipp/Flow$Loader;->readArtist:Z
    if-eqz v0, :L2
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->flush()V
  :L2
  .line 279
    return-void
  :L3
  .line 277
    move-exception v0
    iget-boolean v1, p0, Lcom/innioasis/ipp/Flow$Loader;->readArtist:Z
    if-eqz v1, :L4
    invoke-static { }, Lcom/innioasis/ipp/AlbumArtist;->flush()V
  :L4
  .line 278
    throw v0
.end method
