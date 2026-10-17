.class public final Lcom/innioasis/ipp/Cover;
.super Ljava/lang/Object;
.source "Cover.java"

.field public final static KEY_TILT:Ljava/lang/String; = "cover_tilt"

.field private final static REFL_W:I = 150

.field private final static ROTATION:F = 20.0F

.field private static blankLook:I

.field private static blankPic:Landroid/graphics/Bitmap;

.field private static boxH:I

.field private static boxW:I

.field private static edge:Landroid/graphics/Bitmap;

.field private static fitIn:Ljava/lang/ref/WeakReference;

.field private static fitOut:Landroid/graphics/Bitmap;

.field private static held:Landroid/graphics/Bitmap;

.field private static look:I

.field private static reflCache:Landroid/graphics/Bitmap;

.field private static reflGen:I

.field private static reflIn:Ljava/lang/ref/WeakReference;

.field private static reflOut:Landroid/graphics/Bitmap;

.field private static spare:Landroid/graphics/Bitmap;

.method static constructor <clinit>()V
  .registers 1
  .line 39
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Cover;->look:I
  .line 368
    sput v0, Lcom/innioasis/ipp/Cover;->blankLook:I
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 31
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static bigCover(Ljava/lang/String;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 577
    const/4 v0, 0
    if-nez p0, :L0
  .line 578
    return-object v0
  :L0
  .line 581
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->track(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object p0
  :L1
    return-object p0
  :L2
  .line 582
    move-exception p0
  .line 583
    return-object v0
.end method

.method private static bigCoverCached(Ljava/lang/String;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 589
    const/4 v0, 0
    if-nez p0, :L0
  .line 590
    return-object v0
  :L0
  .line 593
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object p0
  :L1
    return-object p0
  :L2
  .line 594
    move-exception p0
  .line 595
    return-object v0
.end method

.method private static blank(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .catchall { :L0 .. :L6 } :L9
  .registers 8
  :L0
  .line 346
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;
  .line 347
    if-nez v0, :L1
    return-void
  :L1
  .line 348
    iget-object v1, v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg2:Lcom/innioasis/y1/view/ReflectImageView;
  .line 349
    if-eqz v1, :L8
    iget-object v2, v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
    if-nez v2, :L2
    goto :L8
  :L2
  .line 350
    nop
  .line 351
    invoke-virtual { v1 }, Lcom/innioasis/y1/view/ReflectImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v2
    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 352
    iget-object v3, v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
  .line 353
    invoke-virtual { v3 }, Lcom/innioasis/y1/view/ReflectImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v3
    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 354
    if-eqz v2, :L7
    if-nez v3, :L3
    goto :L7
  :L3
  .line 355
    invoke-static { v3 }, Lcom/innioasis/ipp/Cover;->capture(Landroid/view/ViewGroup$MarginLayoutParams;)V
  .line 356
    invoke-static { }, Lcom/innioasis/ipp/Cover;->blankCover()Landroid/graphics/Bitmap;
    move-result-object v4
  .line 357
    invoke-virtual { v1 }, Lcom/innioasis/y1/view/ReflectImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object v5
  .line 358
    if-eqz v4, :L5
    instance-of v6, v5, Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v6, :L4
    check-cast v5, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { v5 }, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;
    move-result-object v5
    if-eq v5, v4, :L5
  :L4
  .line 360
    new-instance v5, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    invoke-direct { v5, p0, v4 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    invoke-virtual { v1, v5 }, Lcom/innioasis/y1/view/ReflectImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
  :L5
  .line 362
    invoke-static { v3 }, Lcom/innioasis/ipp/Cover;->leftOf(Landroid/view/ViewGroup$MarginLayoutParams;)I
    move-result p0
    invoke-static { v0, v1, v2, p0 }, Lcom/innioasis/ipp/Cover;->shape(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;Lcom/innioasis/y1/view/ReflectImageView;Landroid/view/ViewGroup$MarginLayoutParams;I)V
  :L6
  .line 364
    goto :L10
  :L7
  .line 354
    return-void
  :L8
  .line 349
    return-void
  :L9
  .line 363
    move-exception p0
  :L10
  .line 365
    return-void
.end method

.method public static declared-synchronized blankCover()Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L3 } :L12
  .catchall { :L4 .. :L5 } :L12
  .catchall { :L6 .. :L11 } :L12
  .registers 14
    const-class v0, Lcom/innioasis/ipp/Cover;
    monitor-enter v0
  :L0
  .line 372
    invoke-static { }, Lcom/innioasis/ipp/Cover;->flatCover()Z
    move-result v1
  .line 373
    const/4 v2, 0
    if-eqz v1, :L1
    const/4 v3, 0
    goto :L2
  :L1
    const/4 v3, 1
  :L2
  .line 374
    sget-object v4, Lcom/innioasis/ipp/Cover;->blankPic:Landroid/graphics/Bitmap;
    if-eqz v4, :L4
    sget v5, Lcom/innioasis/ipp/Cover;->blankLook:I
    if-ne v5, v3, :L4
    invoke-virtual { v4 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v4
    if-nez v4, :L4
    sget-object v1, Lcom/innioasis/ipp/Cover;->blankPic:Landroid/graphics/Bitmap;
  :L3
    monitor-exit v0
    return-object v1
  :L4
  .line 375
    new-instance v4, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v4 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 376
    iput-boolean v2, v4, Landroid/graphics/BitmapFactory$Options;->inScaled:Z
  .line 377
    sget-object v5, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
  .line 378
    invoke-virtual { v5 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v5
    invoke-virtual { v5 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v5
  .line 377
    const v6, 2131230831
    invoke-static { v5, v6, v4 }, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object v4
  :L5
  .line 379
    const/4 v5, 0
    if-nez v4, :L6
    monitor-exit v0
    return-object v5
  :L6
  .line 380
    invoke-virtual { v4 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v6
  .line 381
    invoke-virtual { v4 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v7
  .line 382
    if-gt v6, v7, :L7
    move v8, v6
    goto :L8
  :L7
    move v8, v7
  :L8
  .line 383
    const/4 v9, 2
    if-eqz v1, :L9
    goto :L10
  :L9
    const/4 v2, 2
  :L10
  .line 384
    mul-int/lit8 v1, v2, 2
    add-int/2addr v1, v8
    add-int v10, v8, v2
    sget-object v11, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v1, v10, v11 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 385
    new-instance v11, Landroid/graphics/Paint;
    invoke-direct { v11, v9 }, Landroid/graphics/Paint;-><init>(I)V
  .line 386
    sub-int/2addr v6, v8
    div-int/2addr v6, v9
  .line 387
    sub-int/2addr v7, v8
    div-int/2addr v7, v9
  .line 388
    new-instance v9, Landroid/graphics/Canvas;
    invoke-direct { v9, v1 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
    new-instance v12, Landroid/graphics/Rect;
    add-int v13, v6, v8
    add-int/2addr v8, v7
    invoke-direct { v12, v6, v7, v13, v8 }, Landroid/graphics/Rect;-><init>(IIII)V
    new-instance v6, Landroid/graphics/Rect;
    invoke-direct { v6, v2, v2, v10, v10 }, Landroid/graphics/Rect;-><init>(IIII)V
    invoke-virtual { v9, v4, v12, v6, v11 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 390
    invoke-virtual { v4 }, Landroid/graphics/Bitmap;->recycle()V
  .line 391
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v2
  .line 392
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v4
  .line 393
    div-int/lit8 v6, v4, 2
    add-int/2addr v6, v4
    sget-object v7, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v2, v6, v7 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v6
  .line 394
    new-instance v7, Landroid/graphics/Canvas;
    invoke-direct { v7, v6 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 395
    const/4 v8, 0
    invoke-virtual { v7, v1, v8, v8, v5 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
  .line 396
    invoke-static { v7, v1, v2, v4 }, Lcom/innioasis/ipp/Cover;->mirror(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;II)V
  .line 397
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->recycle()V
  .line 398
    sput-object v6, Lcom/innioasis/ipp/Cover;->blankPic:Landroid/graphics/Bitmap;
  .line 399
    sput v3, Lcom/innioasis/ipp/Cover;->blankLook:I
  :L11
  .line 400
    monitor-exit v0
    return-object v6
  :L12
  .line 371
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method private static box(Lcom/innioasis/y1/view/ReflectImageView;Landroid/view/ViewGroup$MarginLayoutParams;IIII)V
  .registers 7
  .line 234
    if-lez p2, :L2
    if-lez p3, :L2
    if-ltz p4, :L2
    if-gez p5, :L0
    goto :L2
  :L0
  .line 236
    iget v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
    if-ne v0, p2, :L1
    iget v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
    if-ne v0, p3, :L1
    iget v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    if-ne v0, p4, :L1
    invoke-static { p1 }, Lcom/innioasis/ipp/Cover;->leftOf(Landroid/view/ViewGroup$MarginLayoutParams;)I
    move-result v0
    if-ne v0, p5, :L1
    return-void
  :L1
  .line 237
    iput p2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
  .line 238
    iput p3, p1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
  .line 239
    iput p4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
  .line 240
    iput p5, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
  .line 242
    invoke-virtual { p1, p5 }, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V
  .line 243
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/view/ReflectImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 244
    return-void
  :L2
  .line 234
    return-void
.end method

.method private static capture(Landroid/view/ViewGroup$MarginLayoutParams;)V
  .registers 2
  .line 226
    sget v0, Lcom/innioasis/ipp/Cover;->boxW:I
    if-gtz v0, :L0
    if-eqz p0, :L0
    iget v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
    if-lez v0, :L0
  .line 227
    iget v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
    sput v0, Lcom/innioasis/ipp/Cover;->boxW:I
  .line 228
    iget p0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
    sput p0, Lcom/innioasis/ipp/Cover;->boxH:I
  :L0
  .line 230
    return-void
.end method

.method public static declared-synchronized fitCover(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L18
  .catchall { :L2 .. :L9 } :L16
  .catchall { :L11 .. :L14 } :L16
  .registers 9
    const-class v0, Lcom/innioasis/ipp/Cover;
    monitor-enter v0
  .line 483
    if-nez p0, :L0
  .line 484
    monitor-exit v0
    const/4 p0, 0
    return-object p0
  :L0
  .line 486
    invoke-static { }, Lcom/innioasis/ipp/Cover;->flatCover()Z
    move-result v1
  .line 487
    invoke-static { p0 }, Lcom/innioasis/ipp/Cover;->fitMemo(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object v2
  :L1
  .line 488
    if-eqz v2, :L2
  .line 489
    monitor-exit v0
    return-object v2
  :L2
  .line 492
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v2
  .line 493
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v3
  .line 494
    if-lez v2, :L15
    if-lez v3, :L15
  .line 495
    if-gt v2, v3, :L3
    move v4, v2
    goto :L4
  :L3
    move v4, v3
  :L4
  .line 496
    const/16 v5, 320
    if-le v4, v5, :L5
    goto :L6
  :L5
    move v5, v4
  :L6
  .line 497
    if-ne v2, v3, :L10
    if-ne v3, v5, :L10
  .line 499
    if-eqz v1, :L7
    move-object v1, p0
    goto :L8
  :L7
    invoke-static { p0 }, Lcom/innioasis/ipp/Cover;->softEdge(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object v1
  :L8
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Cover;->fitPut(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object p0
  :L9
    monitor-exit v0
    return-object p0
  :L10
  .line 501
    sub-int/2addr v2, v4
  :L11
    div-int/lit8 v2, v2, 2
  .line 502
    sub-int/2addr v3, v4
    div-int/lit8 v3, v3, 2
  .line 503
    new-instance v6, Landroid/graphics/Rect;
    add-int v7, v2, v4
    add-int/2addr v4, v3
    invoke-direct { v6, v2, v3, v7, v4 }, Landroid/graphics/Rect;-><init>(IIII)V
  .line 504
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v5, v5, v2 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v2
  .line 505
    new-instance v3, Landroid/graphics/Canvas;
    invoke-direct { v3, v2 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 506
    new-instance v4, Landroid/graphics/Rect;
    const/4 v7, 0
    invoke-direct { v4, v7, v7, v5, v5 }, Landroid/graphics/Rect;-><init>(IIII)V
  .line 507
    new-instance v5, Landroid/graphics/Paint;
    invoke-direct { v5 }, Landroid/graphics/Paint;-><init>()V
  .line 508
    const/4 v7, 1
    invoke-virtual { v5, v7 }, Landroid/graphics/Paint;->setFilterBitmap(Z)V
  .line 509
    invoke-virtual { v5, v7 }, Landroid/graphics/Paint;->setAntiAlias(Z)V
  .line 510
    invoke-virtual { v3, p0, v6, v4, v5 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 511
    if-eqz v1, :L12
    goto :L13
  :L12
    invoke-static { v2 }, Lcom/innioasis/ipp/Cover;->softEdge(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object v2
  :L13
    invoke-static { p0, v2 }, Lcom/innioasis/ipp/Cover;->fitPut(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object p0
  :L14
    monitor-exit v0
    return-object p0
  :L15
  .line 514
    goto :L17
  :L16
  .line 513
    move-exception v1
  :L17
  .line 515
    monitor-exit v0
    return-object p0
  :L18
  .line 482
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method private static fitMemo(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .registers 4
  .line 72
    const/4 v0, 0
    if-eqz p0, :L3
    sget-object v1, Lcom/innioasis/ipp/Cover;->fitIn:Ljava/lang/ref/WeakReference;
    if-eqz v1, :L3
    sget-object v2, Lcom/innioasis/ipp/Cover;->fitOut:Landroid/graphics/Bitmap;
    if-nez v2, :L0
    goto :L3
  :L0
  .line 73
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    if-eq v1, p0, :L1
    return-object v0
  :L1
  .line 74
    sget-object p0, Lcom/innioasis/ipp/Cover;->fitOut:Landroid/graphics/Bitmap;
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result p0
    if-eqz p0, :L2
    sput-object v0, Lcom/innioasis/ipp/Cover;->fitOut:Landroid/graphics/Bitmap;
    return-object v0
  :L2
  .line 75
    sget-object p0, Lcom/innioasis/ipp/Cover;->fitOut:Landroid/graphics/Bitmap;
    return-object p0
  :L3
  .line 72
    return-object v0
.end method

.method private static fitPut(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .registers 3
  .line 80
    if-eqz p0, :L0
    if-eqz p1, :L0
  .line 81
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Cover;->fitIn:Ljava/lang/ref/WeakReference;
  .line 82
    sput-object p1, Lcom/innioasis/ipp/Cover;->fitOut:Landroid/graphics/Bitmap;
  :L0
  .line 84
    return-object p1
.end method

.method public static flatCover()Z
  .catchall { :L0 .. :L3 } :L4
  .registers 4
  .line 48
    const/4 v0, 0
  :L0
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v1
    const-string v2, "cover_tilt"
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v1
    const/4 v2, 1
    if-eqz v1, :L1
    const/4 v1, 1
    goto :L2
  :L1
    const/4 v1, 0
  :L2
  .line 49
    sget v3, Lcom/innioasis/ipp/Cover;->look:I
    if-eq v1, v3, :L3
  .line 50
    sput v1, Lcom/innioasis/ipp/Cover;->look:I
  .line 51
    const/4 v3, 0
    sput-object v3, Lcom/innioasis/ipp/Cover;->fitIn:Ljava/lang/ref/WeakReference;
  .line 52
    sput-object v3, Lcom/innioasis/ipp/Cover;->fitOut:Landroid/graphics/Bitmap;
  .line 53
    sput-object v3, Lcom/innioasis/ipp/Cover;->reflIn:Ljava/lang/ref/WeakReference;
  .line 54
    sput-object v3, Lcom/innioasis/ipp/Cover;->reflOut:Landroid/graphics/Bitmap;
  :L3
  .line 56
    xor-int/lit8 v0, v1, 1
    return v0
  :L4
  .line 57
    move-exception v1
  .line 58
    return v0
.end method

.method public static declared-synchronized hold(Landroid/graphics/Bitmap;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
    const-class v0, Lcom/innioasis/ipp/Cover;
    monitor-enter v0
  :L0
  .line 99
    sput-object p0, Lcom/innioasis/ipp/Cover;->held:Landroid/graphics/Bitmap;
  .line 100
    sget-object v1, Lcom/innioasis/ipp/Cover;->spare:Landroid/graphics/Bitmap;
    if-ne v1, p0, :L1
    const/4 p0, 0
    sput-object p0, Lcom/innioasis/ipp/Cover;->spare:Landroid/graphics/Bitmap;
  :L1
  .line 101
    monitor-exit v0
    return-void
  :L2
  .line 98
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method private static inset(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;II)I
  .catchall { :L0 .. :L1 } :L3
  .registers 6
  .line 325
    const/4 v0, 0
  :L0
    iget-object v1, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->musicInfoLl:Landroidx/constraintlayout/widget/ConstraintLayout;
  .line 326
    invoke-virtual { v1 }, Landroidx/constraintlayout/widget/ConstraintLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v1
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 327
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
    invoke-virtual { p0 }, Lcom/innioasis/y1/view/ReflectImageView;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object p0
    iget p0, p0, Landroid/util/DisplayMetrics;->widthPixels:I
  .line 328
    iget v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I
    sub-int/2addr p0, v2
    iget v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
  :L1
    sub-int/2addr p0, v1
  .line 329
    sub-int/2addr p0, p2
    sub-int/2addr p0, p2
  .line 331
    sub-int/2addr p1, p0
  .line 332
    if-lez p1, :L2
    move v0, p1
  :L2
    return v0
  :L3
  .line 333
    move-exception p0
  .line 334
    return v0
.end method

.method public static instantBlank(Lcom/innioasis/y1/base/BasePlayerActivity;Ljava/lang/String;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 3
  .line 409
    if-eqz p0, :L7
    if-nez p1, :L0
    goto :L7
  :L0
  .line 410
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->knownNone(Ljava/lang/String;)Z
    move-result p1
    if-nez p1, :L1
    return-void
  :L1
  .line 411
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;
  .line 412
    if-nez p0, :L2
    return-void
  :L2
  .line 413
    iget-object p1, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
    if-eqz p1, :L3
    iget-object p1, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
    const/16 v0, 8
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/view/ReflectImageView;->setVisibility(I)V
  :L3
  .line 414
    iget-object p1, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg2:Lcom/innioasis/y1/view/ReflectImageView;
    if-eqz p1, :L4
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg2:Lcom/innioasis/y1/view/ReflectImageView;
    const/4 p1, 0
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/view/ReflectImageView;->setVisibility(I)V
  :L4
  .line 417
    goto :L6
  :L5
  .line 415
    move-exception p0
  :L6
  .line 418
    return-void
  :L7
  .line 409
    return-void
.end method

.method public static instantCover(Lcom/innioasis/y1/base/BasePlayerActivity;Ljava/lang/String;)V
  .catchall { :L1 .. :L2 } :L3
  .registers 4
  .line 601
    invoke-static { p0 }, Lcom/innioasis/ipp/Cover;->blank(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .line 602
    invoke-static { p1 }, Lcom/innioasis/ipp/Cover;->bigCoverCached(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 603
    if-nez v0, :L0
  .line 604
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Cover;->instantBlank(Lcom/innioasis/y1/base/BasePlayerActivity;Ljava/lang/String;)V
  .line 605
    return-void
  :L0
  .line 607
    invoke-static { v0 }, Lcom/innioasis/ipp/Cover;->fitCover(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object p1
  .line 608
    if-nez p1, :L1
  .line 609
    return-void
  :L1
  .line 612
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;
  .line 613
    iget-object v1, v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
  .line 614
    invoke-virtual { v1, p1 }, Lcom/innioasis/y1/view/ReflectImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 615
    const/4 p1, 0
    invoke-virtual { v1, p1 }, Lcom/innioasis/y1/view/ReflectImageView;->setVisibility(I)V
  .line 616
    iget-object p1, v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg2:Lcom/innioasis/y1/view/ReflectImageView;
    const/16 v0, 8
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/view/ReflectImageView;->setVisibility(I)V
  .line 617
    invoke-static { p0 }, Lcom/innioasis/ipp/Cover;->tilt(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  :L2
  .line 619
    goto :L4
  :L3
  .line 618
    move-exception p0
  :L4
  .line 620
    return-void
.end method

.method private static leftOf(Landroid/view/ViewGroup$MarginLayoutParams;)I
  .registers 2
  .line 248
    invoke-virtual { p0 }, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginStart()I
    move-result v0
  .line 249
    if-lez v0, :L0
    goto :L1
  :L0
    iget v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
  :L1
    return v0
.end method

.method private static mapX(Landroid/graphics/Matrix;FF)F
  .registers 5
  .line 279
    const/4 v0, 2
    new-array v0, v0, [F
    const/4 v1, 0
    aput p1, v0, v1
    const/4 p1, 1
    aput p2, v0, p1
  .line 280
    invoke-virtual { p0, v0 }, Landroid/graphics/Matrix;->mapPoints([F)V
  .line 281
    aget p0, v0, v1
    return p0
.end method

.method private static mirror(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;II)V
  .registers 23
  .line 147
    move/from16 v7, p2
    move/from16 v8, p3
    div-int/lit8 v9, v8, 2
  .line 148
    const/16 v0, 150
    if-le v7, v0, :L0
    const/high16 v0, 0x43160000
    int-to-float v1, v7
    div-float/2addr v0, v1
    goto :L1
  :L0
    const/high16 v0, 0x3F800000
  :L1
  .line 149
    new-instance v5, Landroid/graphics/Matrix;
    invoke-direct { v5 }, Landroid/graphics/Matrix;-><init>()V
  .line 150
    neg-float v1, v0
    invoke-virtual { v5, v0, v1 }, Landroid/graphics/Matrix;->preScale(FF)Z
  .line 151
    const/4 v1, 0
    const/4 v6, 1
    move-object/from16 v0, p1
    move v2, v9
    move/from16 v3, p2
    move v4, v9
    invoke-static/range { v0 .. v6 }, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 152
    new-instance v1, Landroid/graphics/Paint;
    invoke-direct { v1 }, Landroid/graphics/Paint;-><init>()V
  .line 153
    const/4 v2, 1
    invoke-virtual { v1, v2 }, Landroid/graphics/Paint;->setFilterBitmap(Z)V
  .line 154
    invoke-virtual { v1, v2 }, Landroid/graphics/Paint;->setAntiAlias(Z)V
  .line 155
    new-instance v2, Landroid/graphics/Rect;
    add-int v3, v8, v9
    const/4 v4, 0
    invoke-direct { v2, v4, v8, v7, v3 }, Landroid/graphics/Rect;-><init>(IIII)V
    const/4 v4, 0
    move-object/from16 v5, p0
    invoke-virtual { v5, v0, v4, v2, v1 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 158
    new-instance v10, Landroid/graphics/Paint;
    invoke-direct { v10 }, Landroid/graphics/Paint;-><init>()V
  .line 159
    new-instance v0, Landroid/graphics/LinearGradient;
    const/4 v12, 0
    int-to-float v1, v8
    const/4 v14, 0
    int-to-float v9, v3
    const v16, 1895825407
    const v17, 16777215
    sget-object v18, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;
    move-object v11, v0
    move v13, v1
    move v15, v9
    invoke-direct/range { v11 .. v18 }, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V
    invoke-virtual { v10, v0 }, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;
  .line 161
    new-instance v0, Landroid/graphics/PorterDuffXfermode;
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->DST_IN:Landroid/graphics/PorterDuff$Mode;
    invoke-direct { v0, v2 }, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V
    invoke-virtual { v10, v0 }, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;
  .line 162
    const/4 v6, 0
    int-to-float v8, v7
    move v7, v1
    invoke-virtual/range { v5 .. v10 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 163
    return-void
.end method

.method public static reflCache()Landroid/graphics/Bitmap;
  .registers 3
  .line 427
    sget-object v0, Lcom/innioasis/ipp/Cover;->reflCache:Landroid/graphics/Bitmap;
  .line 428
    const/4 v1, 0
    if-nez v0, :L0
  .line 429
    return-object v1
  :L0
  .line 431
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v2
    if-eqz v2, :L1
  .line 432
    nop
  .line 433
    sput-object v1, Lcom/innioasis/ipp/Cover;->reflCache:Landroid/graphics/Bitmap;
    move-object v0, v1
  :L1
  .line 435
    return-object v0
.end method

.method public static declared-synchronized reflect(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L11
  .catchall { :L2 .. :L4 } :L11
  .catchall { :L5 .. :L9 } :L11
  .registers 9
    const-class v0, Lcom/innioasis/ipp/Cover;
    monitor-enter v0
  .line 109
    const/4 v1, 0
    if-nez p0, :L0
    monitor-exit v0
    return-object v1
  :L0
  .line 110
    invoke-static { }, Lcom/innioasis/ipp/Cover;->flatCover()Z
  .line 111
    sget-object v2, Lcom/innioasis/ipp/Cover;->reflIn:Ljava/lang/ref/WeakReference;
    if-eqz v2, :L2
    sget-object v3, Lcom/innioasis/ipp/Cover;->reflOut:Landroid/graphics/Bitmap;
    if-eqz v3, :L2
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
    if-ne v2, p0, :L2
    sget v2, Lcom/innioasis/ipp/Cover;->reflGen:I
  .line 112
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getGenerationId()I
    move-result v3
    if-ne v2, v3, :L2
    sget-object v2, Lcom/innioasis/ipp/Cover;->reflOut:Landroid/graphics/Bitmap;
    invoke-virtual { v2 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v2
    if-nez v2, :L2
  .line 113
    sget-object p0, Lcom/innioasis/ipp/Cover;->reflOut:Landroid/graphics/Bitmap;
  :L1
    monitor-exit v0
    return-object p0
  :L2
  .line 115
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v2
  .line 116
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v3
  .line 117
    if-lez v2, :L10
    if-gtz v3, :L3
    goto :L10
  :L3
  .line 118
    div-int/lit8 v4, v3, 2
  :L4
  .line 119
    if-gtz v4, :L5
    monitor-exit v0
    return-object v1
  :L5
  .line 123
    sget-object v5, Lcom/innioasis/ipp/Cover;->spare:Landroid/graphics/Bitmap;
  .line 124
    sput-object v1, Lcom/innioasis/ipp/Cover;->spare:Landroid/graphics/Bitmap;
  .line 125
    if-eqz v5, :L6
    invoke-virtual { v5 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v6
    if-nez v6, :L6
    invoke-virtual { v5 }, Landroid/graphics/Bitmap;->isMutable()Z
    move-result v6
    if-eqz v6, :L6
  .line 126
    invoke-virtual { v5 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v6
    if-ne v6, v2, :L6
    invoke-virtual { v5 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v6
    add-int v7, v3, v4
    if-ne v6, v7, :L6
  .line 127
    const/4 v4, 0
    invoke-virtual { v5, v4 }, Landroid/graphics/Bitmap;->eraseColor(I)V
    goto :L7
  :L6
  .line 129
    add-int/2addr v4, v3
    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v2, v4, v5 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v5
  :L7
  .line 131
    new-instance v4, Landroid/graphics/Canvas;
    invoke-direct { v4, v5 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 132
    const/4 v6, 0
    invoke-virtual { v4, p0, v6, v6, v1 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
  .line 133
    invoke-static { v4, p0, v2, v3 }, Lcom/innioasis/ipp/Cover;->mirror(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;II)V
  .line 135
    sget-object v2, Lcom/innioasis/ipp/Cover;->reflOut:Landroid/graphics/Bitmap;
    sget-object v3, Lcom/innioasis/ipp/Cover;->held:Landroid/graphics/Bitmap;
    if-eq v2, v3, :L8
    sput-object v2, Lcom/innioasis/ipp/Cover;->spare:Landroid/graphics/Bitmap;
  :L8
  .line 136
    new-instance v2, Ljava/lang/ref/WeakReference;
    invoke-direct { v2, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v2, Lcom/innioasis/ipp/Cover;->reflIn:Ljava/lang/ref/WeakReference;
  .line 137
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getGenerationId()I
    move-result p0
    sput p0, Lcom/innioasis/ipp/Cover;->reflGen:I
  .line 138
    sput-object v5, Lcom/innioasis/ipp/Cover;->reflOut:Landroid/graphics/Bitmap;
  :L9
  .line 139
    monitor-exit v0
    return-object v5
  :L10
  .line 117
    monitor-exit v0
    return-object v1
  :L11
  .line 140
    move-exception p0
  .line 141
    monitor-exit v0
    return-object v1
.end method

.method private static rowsHeight(Landroid/view/ViewGroup;)I
  .registers 7
  .line 304
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getHeight()I
    move-result v0
  .line 305
    if-lez v0, :L0
    return v0
  :L0
  .line 306
    nop
  .line 307
    const/4 v0, 0
    const/4 v1, 0
    const/4 v2, 0
  :L1
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v3
    if-ge v1, v3, :L6
  .line 308
    invoke-virtual { p0, v1 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v3
  .line 309
    if-eqz v3, :L5
    invoke-virtual { v3 }, Landroid/view/View;->getVisibility()I
    move-result v4
    const/16 v5, 8
    if-ne v4, v5, :L2
    goto :L5
  :L2
  .line 310
    invoke-virtual { v3 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v3
  .line 311
    instance-of v4, v3, Landroid/view/ViewGroup$MarginLayoutParams;
    if-nez v4, :L3
    return v0
  :L3
  .line 312
    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 313
    iget v4, v3, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
    if-gtz v4, :L4
    return v0
  :L4
  .line 314
    iget v4, v3, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
    iget v3, v3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    add-int/2addr v4, v3
    add-int/2addr v2, v4
  :L5
  .line 307
    add-int/lit8 v1, v1, 1
    goto :L1
  :L6
  .line 316
    return v2
.end method

.method public static setReflCache(Landroid/graphics/Bitmap;)V
  .registers 1
  .line 439
    sput-object p0, Lcom/innioasis/ipp/Cover;->reflCache:Landroid/graphics/Bitmap;
  .line 440
    return-void
.end method

.method private static shape(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;Lcom/innioasis/y1/view/ReflectImageView;Landroid/view/ViewGroup$MarginLayoutParams;I)V
  .catchall { :L0 .. :L5 } :L7
  .registers 14
  :L0
  .line 190
    sget v0, Lcom/innioasis/ipp/Cover;->boxW:I
    if-lez v0, :L6
    sget v0, Lcom/innioasis/ipp/Cover;->boxH:I
    if-gtz v0, :L1
    goto/16 :L6
  :L1
  .line 191
    invoke-static { }, Lcom/innioasis/ipp/Cover;->flatCover()Z
    move-result v0
  .line 192
    sget v1, Lcom/innioasis/ipp/Cover;->boxW:I
    invoke-static { p0, v1, p3 }, Lcom/innioasis/ipp/Cover;->inset(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;II)I
    move-result v2
    sub-int/2addr v1, v2
  .line 193
    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_START:Landroid/widget/ImageView$ScaleType;
    invoke-virtual { p1, v2 }, Lcom/innioasis/y1/view/ReflectImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
  .line 195
    const/4 v2, 0
    const/4 v3, 0
    if-eqz v0, :L2
  .line 196
    invoke-virtual { p1, v2 }, Lcom/innioasis/y1/view/ReflectImageView;->setRotationY(F)V
  .line 197
    sget v0, Lcom/innioasis/ipp/Cover;->boxW:I
    sub-int/2addr v0, v1
    invoke-virtual { p1, v3, v3, v0, v3 }, Lcom/innioasis/y1/view/ReflectImageView;->setPadding(IIII)V
  .line 198
    sget v6, Lcom/innioasis/ipp/Cover;->boxW:I
    sget v7, Lcom/innioasis/ipp/Cover;->boxH:I
    invoke-static { p0, p2, v1 }, Lcom/innioasis/ipp/Cover;->topFor(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;Landroid/view/ViewGroup$MarginLayoutParams;I)I
    move-result v8
    move-object v4, p1
    move-object v5, p2
    move v9, p3
    invoke-static/range { v4 .. v9 }, Lcom/innioasis/ipp/Cover;->box(Lcom/innioasis/y1/view/ReflectImageView;Landroid/view/ViewGroup$MarginLayoutParams;IIII)V
  .line 199
    return-void
  :L2
  .line 201
    invoke-virtual { p1, v3, v3, v3, v3 }, Lcom/innioasis/y1/view/ReflectImageView;->setPadding(IIII)V
  .line 204
    invoke-virtual { p1 }, Lcom/innioasis/y1/view/ReflectImageView;->getHeight()I
    move-result v0
    int-to-float v0, v0
  .line 205
    cmpg-float v3, v0, v2
    if-gtz v3, :L3
    iget v0, p2, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
    int-to-float v0, v0
  :L3
  .line 206
    invoke-virtual { p1, v2 }, Lcom/innioasis/y1/view/ReflectImageView;->setPivotX(F)V
  .line 207
    const/high16 v3, 0x40400000
    cmpl-float v2, v0, v2
    if-lez v2, :L4
    div-float/2addr v0, v3
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/view/ReflectImageView;->setPivotY(F)V
  :L4
  .line 208
    const/high16 v0, 0x41A00000
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/view/ReflectImageView;->setRotationY(F)V
  .line 212
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/Cover;->tiltWidth(Lcom/innioasis/y1/view/ReflectImageView;I)I
    move-result v6
  .line 213
    int-to-float v0, v6
    sget v1, Lcom/innioasis/ipp/Cover;->boxH:I
    int-to-float v1, v1
    mul-float v0, v0, v1
    sget v1, Lcom/innioasis/ipp/Cover;->boxW:I
    int-to-float v1, v1
    div-float/2addr v0, v1
    invoke-static { v0 }, Ljava/lang/Math;->round(F)I
    move-result v0
  .line 214
    invoke-static { p0, p2, v6 }, Lcom/innioasis/ipp/Cover;->topFor(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;Landroid/view/ViewGroup$MarginLayoutParams;I)I
    move-result v8
    move-object v4, p1
    move-object v5, p2
    move v7, v0
    move v9, p3
    invoke-static/range { v4 .. v9 }, Lcom/innioasis/ipp/Cover;->box(Lcom/innioasis/y1/view/ReflectImageView;Landroid/view/ViewGroup$MarginLayoutParams;IIII)V
  .line 215
    if-lez v0, :L5
    int-to-float p0, v0
    div-float/2addr p0, v3
    invoke-virtual { p1, p0 }, Lcom/innioasis/y1/view/ReflectImageView;->setPivotY(F)V
  :L5
  .line 217
    goto :L8
  :L6
  .line 190
    return-void
  :L7
  .line 216
    move-exception p0
  :L8
  .line 218
    return-void
.end method

.method private static softEdge(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L3 } :L5
  .registers 6
  .line 454
    if-nez p0, :L0
  .line 455
    const/4 p0, 0
    return-object p0
  :L0
  .line 458
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v0
  .line 459
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v1
  .line 460
    if-lez v0, :L4
    if-lez v1, :L4
  .line 461
    sget-object v2, Lcom/innioasis/ipp/Cover;->edge:Landroid/graphics/Bitmap;
  .line 462
    if-eqz v2, :L1
    invoke-virtual { v2 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v3
    if-nez v3, :L1
  .line 463
    invoke-virtual { v2 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v3
    add-int/lit8 v4, v0, 4
    if-ne v3, v4, :L1
    invoke-virtual { v2 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v3
    add-int/lit8 v4, v1, 2
    if-ne v3, v4, :L1
  .line 464
    const/4 v0, 0
    invoke-virtual { v2, v0 }, Landroid/graphics/Bitmap;->eraseColor(I)V
    goto :L2
  :L1
  .line 466
    add-int/lit8 v0, v0, 4
    add-int/lit8 v1, v1, 2
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v0, v1, v2 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v2
  .line 467
    sput-object v2, Lcom/innioasis/ipp/Cover;->edge:Landroid/graphics/Bitmap;
  :L2
  .line 469
    new-instance v0, Landroid/graphics/Canvas;
    invoke-direct { v0, v2 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 470
    new-instance v1, Landroid/graphics/Paint;
    invoke-direct { v1 }, Landroid/graphics/Paint;-><init>()V
  .line 471
    const/4 v3, 1
    invoke-virtual { v1, v3 }, Landroid/graphics/Paint;->setFilterBitmap(Z)V
  .line 472
    invoke-virtual { v1, v3 }, Landroid/graphics/Paint;->setAntiAlias(Z)V
  .line 473
    const/high16 v3, 0x40000000
    invoke-virtual { v0, p0, v3, v3, v1 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
  :L3
  .line 474
    return-object v2
  :L4
  .line 477
    goto :L6
  :L5
  .line 476
    move-exception v0
  :L6
  .line 478
    return-object p0
.end method

.method public static square(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L8 } :L10
  .registers 14
  .line 523
    if-nez p0, :L0
  .line 524
    const/4 p0, 0
    return-object p0
  :L0
  .line 527
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v0
  .line 528
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v1
  .line 529
    if-lez v0, :L9
    if-lez v1, :L9
    if-lez p1, :L9
  .line 530
    if-ne v0, p1, :L1
    if-ne v1, p1, :L1
  .line 531
    return-object p0
  :L1
  .line 533
    new-instance v2, Landroid/graphics/Paint;
    invoke-direct { v2 }, Landroid/graphics/Paint;-><init>()V
  .line 534
    const/4 v3, 1
    invoke-virtual { v2, v3 }, Landroid/graphics/Paint;->setFilterBitmap(Z)V
  .line 535
    invoke-virtual { v2, v3 }, Landroid/graphics/Paint;->setAntiAlias(Z)V
  .line 539
    nop
  .line 540
    const/4 v4, 0
    const/4 v6, 0
    move-object v5, p0
  :L2
  .line 541
    mul-int/lit8 v7, p1, 2
    if-lt v0, v7, :L5
    if-lt v1, v7, :L5
  .line 542
    div-int/lit8 v7, v0, 2
  .line 543
    div-int/lit8 v8, v1, 2
  .line 544
    if-lez v7, :L5
    if-gtz v8, :L3
    goto :L5
  :L3
  .line 545
    sget-object v9, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v7, v8, v9 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v9
  .line 546
    new-instance v10, Landroid/graphics/Canvas;
    invoke-direct { v10, v9 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 547
    new-instance v11, Landroid/graphics/Rect;
    invoke-direct { v11, v4, v4, v0, v1 }, Landroid/graphics/Rect;-><init>(IIII)V
    new-instance v0, Landroid/graphics/Rect;
    invoke-direct { v0, v4, v4, v7, v8 }, Landroid/graphics/Rect;-><init>(IIII)V
    invoke-virtual { v10, v5, v11, v0, v2 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 548
    if-eqz v6, :L4
  .line 549
    invoke-virtual { v5 }, Landroid/graphics/Bitmap;->recycle()V
  :L4
  .line 551
    nop
  .line 552
    nop
  .line 553
    nop
  .line 554
    nop
  .line 555
    move v0, v7
    move v1, v8
    move-object v5, v9
    const/4 v6, 1
    goto :L2
  :L5
  .line 557
    if-gt v0, v1, :L6
    move v3, v0
    goto :L7
  :L6
    move v3, v1
  :L7
  .line 558
    sub-int/2addr v0, v3
    div-int/lit8 v0, v0, 2
  .line 559
    sub-int/2addr v1, v3
    div-int/lit8 v1, v1, 2
  .line 560
    new-instance v7, Landroid/graphics/Rect;
    add-int v8, v0, v3
    add-int/2addr v3, v1
    invoke-direct { v7, v0, v1, v8, v3 }, Landroid/graphics/Rect;-><init>(IIII)V
  .line 561
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { p1, p1, v0 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 562
    new-instance v1, Landroid/graphics/Canvas;
    invoke-direct { v1, v0 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 563
    new-instance v3, Landroid/graphics/Rect;
    invoke-direct { v3, v4, v4, p1, p1 }, Landroid/graphics/Rect;-><init>(IIII)V
  .line 564
    invoke-virtual { v1, v5, v7, v3, v2 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 565
    if-eqz v6, :L8
  .line 566
    invoke-virtual { v5 }, Landroid/graphics/Bitmap;->recycle()V
  :L8
  .line 568
    return-object v0
  :L9
  .line 571
    goto :L11
  :L10
  .line 570
    move-exception p1
  :L11
  .line 572
    return-object p0
.end method

.method public static tilt(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 4
  .line 167
    if-nez p0, :L0
    return-void
  :L0
  .line 168
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;
  .line 169
    if-nez p0, :L1
    return-void
  :L1
  .line 171
    iget-object v0, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
  .line 172
    if-nez v0, :L2
    return-void
  :L2
  .line 173
    nop
  .line 174
    invoke-virtual { v0 }, Lcom/innioasis/y1/view/ReflectImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v1
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 175
    if-nez v1, :L3
    return-void
  :L3
  .line 176
    invoke-static { v1 }, Lcom/innioasis/ipp/Cover;->capture(Landroid/view/ViewGroup$MarginLayoutParams;)V
  .line 177
    invoke-static { v1 }, Lcom/innioasis/ipp/Cover;->leftOf(Landroid/view/ViewGroup$MarginLayoutParams;)I
    move-result v2
    invoke-static { p0, v0, v1, v2 }, Lcom/innioasis/ipp/Cover;->shape(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;Lcom/innioasis/y1/view/ReflectImageView;Landroid/view/ViewGroup$MarginLayoutParams;I)V
  :L4
  .line 179
    goto :L6
  :L5
  .line 178
    move-exception p0
  :L6
  .line 180
    return-void
.end method

.method private static tiltWidth(Lcom/innioasis/y1/view/ReflectImageView;I)I
  .catchall { :L0 .. :L11 } :L12
  .registers 9
  .line 259
    if-gtz p1, :L1
  :L0
    sget p0, Lcom/innioasis/ipp/Cover;->boxW:I
    return p0
  :L1
  .line 260
    invoke-virtual { p0 }, Lcom/innioasis/y1/view/ReflectImageView;->getMatrix()Landroid/graphics/Matrix;
    move-result-object v0
  .line 261
    if-eqz v0, :L10
    invoke-virtual { v0 }, Landroid/graphics/Matrix;->isIdentity()Z
    move-result v1
    if-eqz v1, :L2
    goto :L10
  :L2
  .line 262
    invoke-virtual { p0 }, Lcom/innioasis/y1/view/ReflectImageView;->getPivotY()F
    move-result p0
  .line 263
    int-to-float v1, p1
  .line 264
    const/high16 v2, 0x40400000
    mul-float v2, v2, v1
  .line 265
    invoke-static { v0, v2, p0 }, Lcom/innioasis/ipp/Cover;->mapX(Landroid/graphics/Matrix;FF)F
    move-result v3
    cmpg-float v3, v3, v1
    if-gez v3, :L3
    invoke-static { v2 }, Ljava/lang/Math;->round(F)I
    move-result p0
    return p0
  :L3
  .line 266
    const/4 v3, 0
    move v4, v1
  :L4
    const/16 v5, 24
    const/high16 v6, 0x3F000000
    if-ge v3, v5, :L7
  .line 267
    add-float v5, v4, v2
    mul-float v5, v5, v6
  .line 268
    invoke-static { v0, v5, p0 }, Lcom/innioasis/ipp/Cover;->mapX(Landroid/graphics/Matrix;FF)F
    move-result v6
    cmpg-float v6, v6, v1
    if-gez v6, :L5
    move v4, v5
    goto :L6
  :L5
    move v2, v5
  :L6
  .line 266
    add-int/lit8 v3, v3, 1
    goto :L4
  :L7
  .line 270
    add-float/2addr v4, v2
    mul-float v4, v4, v6
    invoke-static { v4 }, Ljava/lang/Math;->round(F)I
    move-result p0
  .line 271
    if-ge p0, p1, :L8
    goto :L9
  :L8
    move p1, p0
  :L9
    return p1
  :L10
  .line 261
    sget p0, Lcom/innioasis/ipp/Cover;->boxW:I
  :L11
    return p0
  :L12
  .line 272
    move-exception p0
  .line 273
    sget p0, Lcom/innioasis/ipp/Cover;->boxW:I
    return p0
.end method

.method private static topFor(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;Landroid/view/ViewGroup$MarginLayoutParams;I)I
  .catchall { :L0 .. :L2 } :L5
  .registers 4
  :L0
  .line 292
    iget-object v0, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->musicInfoLl:Landroidx/constraintlayout/widget/ConstraintLayout;
  .line 293
    invoke-virtual { v0 }, Landroidx/constraintlayout/widget/ConstraintLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 294
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->musicInfoLl:Landroidx/constraintlayout/widget/ConstraintLayout;
    invoke-static { p0 }, Lcom/innioasis/ipp/Cover;->rowsHeight(Landroid/view/ViewGroup;)I
    move-result p0
  .line 295
    if-gtz p0, :L1
    iget p0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    return p0
  :L1
  .line 296
    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    sub-int/2addr p0, p2
    div-int/lit8 p0, p0, 2
  :L2
    add-int/2addr v0, p0
  .line 297
    if-lez v0, :L3
    goto :L4
  :L3
    const/4 v0, 0
  :L4
    return v0
  :L5
  .line 298
    move-exception p0
  .line 299
    iget p0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    return p0
.end method
