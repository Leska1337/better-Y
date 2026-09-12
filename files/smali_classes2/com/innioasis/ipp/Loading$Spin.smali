.class public final Lcom/innioasis/ipp/Loading$Spin;
.super Landroid/view/SurfaceView;
.implements Landroid/view/SurfaceHolder$Callback;
.implements Ljava/lang/Runnable;
.source "Loading.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Loading;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 25
  name = "Spin"
.end annotation

.field private final static FRAME_MS:J = 20L

.field private final static TURN_MS:J = 800L

.field private static ring:Landroid/graphics/Bitmap;

.field private final box:Landroid/graphics/RectF;

.field private final paint:Landroid/graphics/Paint;

.field private volatile running:Z

.field private thread:Ljava/lang/Thread;

.method public constructor <init>(Landroid/content/Context;I)V
  .registers 4
  .line 345
    invoke-direct { p0, p1 }, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V
  .line 339
    new-instance p1, Landroid/graphics/Paint;
    const/4 v0, 3
    invoke-direct { p1, v0 }, Landroid/graphics/Paint;-><init>(I)V
    iput-object p1, p0, Lcom/innioasis/ipp/Loading$Spin;->paint:Landroid/graphics/Paint;
  .line 340
    new-instance v0, Landroid/graphics/RectF;
    invoke-direct { v0 }, Landroid/graphics/RectF;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Loading$Spin;->box:Landroid/graphics/RectF;
  .line 346
    const v0, 16707006
    if-eq p2, v0, :L0
    invoke-static { p2 }, Lcom/innioasis/ipp/Loading;->access$000(I)Landroid/graphics/ColorMatrixColorFilter;
    move-result-object p2
    invoke-virtual { p1, p2 }, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;
  :L0
  .line 347
    const/4 p1, 1
    invoke-virtual { p0, p1 }, Lcom/innioasis/ipp/Loading$Spin;->setZOrderOnTop(Z)V
  .line 348
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Loading$Spin;->getHolder()Landroid/view/SurfaceHolder;
    move-result-object p1
    const/4 p2, -3
    invoke-interface { p1, p2 }, Landroid/view/SurfaceHolder;->setFormat(I)V
  .line 349
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Loading$Spin;->getHolder()Landroid/view/SurfaceHolder;
    move-result-object p1
    invoke-interface { p1, p0 }, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V
  .line 350
    return-void
.end method

.method private frame(Landroid/view/SurfaceHolder;Landroid/graphics/Bitmap;F)V
  .catchall { :L0 .. :L1 } :L17
  .catchall { :L2 .. :L3 } :L4
  .catchall { :L6 .. :L7 } :L16
  .catchall { :L8 .. :L9 } :L10
  .catchall { :L12 .. :L13 } :L16
  .catchall { :L14 .. :L15 } :L22
  .catchall { :L18 .. :L19 } :L24
  .catchall { :L20 .. :L21 } :L22
  .catchall { :L25 .. :L26 } :L27
  .registers 15
  .line 399
    nop
  .line 401
    const/4 v0, 0
    const/4 v1, 0
  :L0
    invoke-interface { p1 }, Landroid/view/SurfaceHolder;->lockCanvas()Landroid/graphics/Canvas;
    move-result-object v2
  :L1
  .line 402
    if-nez v2, :L6
  .line 416
    if-eqz v2, :L5
  :L2
  .line 418
    invoke-interface { p1, v2 }, Landroid/view/SurfaceHolder;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V
  :L3
  .line 421
    goto :L5
  :L4
  .line 419
    move-exception p1
  .line 420
    iput-boolean v0, p0, Lcom/innioasis/ipp/Loading$Spin;->running:Z
  :L5
  .line 402
    return-void
  :L6
  .line 403
    sget-object v3, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;
    invoke-virtual { v2, v0, v3 }, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V
  :L7
  .line 404
    if-nez p2, :L12
  .line 416
    if-eqz v2, :L11
  :L8
  .line 418
    invoke-interface { p1, v2 }, Landroid/view/SurfaceHolder;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V
  :L9
  .line 421
    goto :L11
  :L10
  .line 419
    move-exception p1
  .line 420
    iput-boolean v0, p0, Lcom/innioasis/ipp/Loading$Spin;->running:Z
  :L11
  .line 404
    return-void
  :L12
  .line 405
    invoke-virtual { v2 }, Landroid/graphics/Canvas;->getWidth()I
    move-result v3
    int-to-float v3, v3
  .line 406
    invoke-virtual { v2 }, Landroid/graphics/Canvas;->getHeight()I
    move-result v4
    int-to-float v4, v4
  .line 407
    invoke-static { v3, v4 }, Ljava/lang/Math;->min(FF)F
    move-result v5
  .line 408
    iget-object v6, p0, Lcom/innioasis/ipp/Loading$Spin;->box:Landroid/graphics/RectF;
    sub-float v7, v3, v5
    const/high16 v8, 0x40000000
    div-float/2addr v7, v8
    sub-float v9, v4, v5
    div-float/2addr v9, v8
    add-float v10, v3, v5
    div-float/2addr v10, v8
    add-float/2addr v5, v4
    div-float/2addr v5, v8
    invoke-virtual { v6, v7, v9, v10, v5 }, Landroid/graphics/RectF;->set(FFFF)V
  .line 409
    invoke-virtual { v2 }, Landroid/graphics/Canvas;->save()I
  .line 410
    div-float/2addr v3, v8
    div-float/2addr v4, v8
    invoke-virtual { v2, p3, v3, v4 }, Landroid/graphics/Canvas;->rotate(FFF)V
  .line 411
    iget-object p3, p0, Lcom/innioasis/ipp/Loading$Spin;->box:Landroid/graphics/RectF;
    iget-object v3, p0, Lcom/innioasis/ipp/Loading$Spin;->paint:Landroid/graphics/Paint;
    invoke-virtual { v2, p2, v1, p3, v3 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
  .line 412
    invoke-virtual { v2 }, Landroid/graphics/Canvas;->restore()V
  :L13
  .line 416
    if-eqz v2, :L23
  :L14
  .line 418
    invoke-interface { p1, v2 }, Landroid/view/SurfaceHolder;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V
  :L15
    goto :L21
  :L16
  .line 413
    move-exception p2
    move-object v1, v2
    goto :L18
  :L17
    move-exception p2
  :L18
  .line 414
    iput-boolean v0, p0, Lcom/innioasis/ipp/Loading$Spin;->running:Z
  :L19
  .line 416
    if-eqz v1, :L23
  :L20
  .line 418
    invoke-interface { p1, v1 }, Landroid/view/SurfaceHolder;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V
  :L21
  .line 421
    goto :L23
  :L22
  .line 419
    move-exception p1
  .line 420
    iput-boolean v0, p0, Lcom/innioasis/ipp/Loading$Spin;->running:Z
    goto :L21
  :L23
  .line 424
    return-void
  :L24
  .line 416
    move-exception p2
    if-eqz v1, :L28
  :L25
  .line 418
    invoke-interface { p1, v1 }, Landroid/view/SurfaceHolder;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V
  :L26
  .line 421
    goto :L28
  :L27
  .line 419
    move-exception p1
  .line 420
    iput-boolean v0, p0, Lcom/innioasis/ipp/Loading$Spin;->running:Z
  :L28
  .line 423
    goto :L30
  :L29
    throw p2
  :L30
    goto :L29
.end method

.method private halt()V
  .catch Ljava/lang/InterruptedException; { :L1 .. :L2 } :L3
  .registers 4
  .line 372
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/ipp/Loading$Spin;->running:Z
  .line 373
    iget-object v0, p0, Lcom/innioasis/ipp/Loading$Spin;->thread:Ljava/lang/Thread;
  .line 374
    const/4 v1, 0
    iput-object v1, p0, Lcom/innioasis/ipp/Loading$Spin;->thread:Ljava/lang/Thread;
  .line 375
    if-nez v0, :L0
    return-void
  :L0
  .line 376
    invoke-virtual { v0 }, Ljava/lang/Thread;->interrupt()V
  .line 378
    const-wide/16 v1, 500
  :L1
    invoke-virtual { v0, v1, v2 }, Ljava/lang/Thread;->join(J)V
  :L2
  .line 381
    goto :L4
  :L3
  .line 379
    move-exception v0
  :L4
  .line 382
    return-void
.end method

.method private static declared-synchronized ring(Landroid/content/res/Resources;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L2 } :L3
  .registers 4
    const-class v0, Lcom/innioasis/ipp/Loading$Spin;
    monitor-enter v0
  :L0
  .line 427
    sget-object v1, Lcom/innioasis/ipp/Loading$Spin;->ring:Landroid/graphics/Bitmap;
    if-nez v1, :L1
  .line 428
    new-instance v1, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v1 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 429
    const/4 v2, 0
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inScaled:Z
  .line 430
    const v2, 2131231058
    invoke-static { p0, v2, v1 }, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object p0
    sput-object p0, Lcom/innioasis/ipp/Loading$Spin;->ring:Landroid/graphics/Bitmap;
  :L1
  .line 432
    sget-object p0, Lcom/innioasis/ipp/Loading$Spin;->ring:Landroid/graphics/Bitmap;
  :L2
    monitor-exit v0
    return-object p0
  :L3
  .line 426
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method protected onDetachedFromWindow()V
  .registers 1
  .line 367
    invoke-direct { p0 }, Lcom/innioasis/ipp/Loading$Spin;->halt()V
  .line 368
    invoke-super { p0 }, Landroid/view/SurfaceView;->onDetachedFromWindow()V
  .line 369
    return-void
.end method

.method public run()V
  .catch Ljava/lang/InterruptedException; { :L1 .. :L2 } :L3
  .registers 9
  .line 385
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Loading$Spin;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Loading$Spin;->ring(Landroid/content/res/Resources;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 386
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Loading$Spin;->getHolder()Landroid/view/SurfaceHolder;
    move-result-object v1
  .line 387
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
  :L0
  .line 388
    iget-boolean v4, p0, Lcom/innioasis/ipp/Loading$Spin;->running:Z
    if-eqz v4, :L4
  .line 389
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
    sub-long/2addr v4, v2
    const-wide/16 v6, 800
    rem-long/2addr v4, v6
    long-to-float v4, v4
    const/high16 v5, 0x43B40000
    mul-float v4, v4, v5
    const/high16 v5, 0x44480000
    div-float/2addr v4, v5
    invoke-direct { p0, v1, v0, v4 }, Lcom/innioasis/ipp/Loading$Spin;->frame(Landroid/view/SurfaceHolder;Landroid/graphics/Bitmap;F)V
  .line 391
    const-wide/16 v4, 20
  :L1
    invoke-static { v4, v5 }, Ljava/lang/Thread;->sleep(J)V
  :L2
  .line 394
    goto :L0
  :L3
  .line 392
    move-exception v0
  .line 393
    return-void
  :L4
  .line 396
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
  .registers 5
  .line 360
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
  .registers 3
  .line 353
    invoke-direct { p0 }, Lcom/innioasis/ipp/Loading$Spin;->halt()V
  .line 354
    const/4 p1, 1
    iput-boolean p1, p0, Lcom/innioasis/ipp/Loading$Spin;->running:Z
  .line 355
    new-instance p1, Ljava/lang/Thread;
    const-string v0, "ipp-spin"
    invoke-direct { p1, p0, v0 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    iput-object p1, p0, Lcom/innioasis/ipp/Loading$Spin;->thread:Ljava/lang/Thread;
  .line 356
    invoke-virtual { p1 }, Ljava/lang/Thread;->start()V
  .line 357
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
  .registers 2
  .line 363
    invoke-direct { p0 }, Lcom/innioasis/ipp/Loading$Spin;->halt()V
  .line 364
    return-void
.end method
