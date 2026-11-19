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
  .line 379
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
  .line 588
    const/4 v0, 0
    if-nez p0, :L0
  .line 589
    return-object v0
  :L0
  .line 592
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->track(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object p0
  :L1
    return-object p0
  :L2
  .line 593
    move-exception p0
  .line 594
    return-object v0
.end method

.method private static bigCoverCached(Ljava/lang/String;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 600
    const/4 v0, 0
    if-nez p0, :L0
  .line 601
    return-object v0
  :L0
  .line 604
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object p0
  :L1
    return-object p0
  :L2
  .line 605
    move-exception p0
  .line 606
    return-object v0
.end method

.method private static blank(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .catchall { :L0 .. :L6 } :L9
  .registers 8
  :L0
  .line 357
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;
  .line 358
    if-nez v0, :L1
    return-void
  :L1
  .line 359
    iget-object v1, v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg2:Lcom/innioasis/y1/view/ReflectImageView;
  .line 360
    if-eqz v1, :L8
    iget-object v2, v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
    if-nez v2, :L2
    goto :L8
  :L2
  .line 361
    nop
  .line 362
    invoke-virtual { v1 }, Lcom/innioasis/y1/view/ReflectImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v2
    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 363
    iget-object v3, v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
  .line 364
    invoke-virtual { v3 }, Lcom/innioasis/y1/view/ReflectImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v3
    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 365
    if-eqz v2, :L7
    if-nez v3, :L3
    goto :L7
  :L3
  .line 366
    invoke-static { v3 }, Lcom/innioasis/ipp/Cover;->capture(Landroid/view/ViewGroup$MarginLayoutParams;)V
  .line 367
    invoke-static { }, Lcom/innioasis/ipp/Cover;->blankCover()Landroid/graphics/Bitmap;
    move-result-object v4
  .line 368
    invoke-virtual { v1 }, Lcom/innioasis/y1/view/ReflectImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object v5
  .line 369
    if-eqz v4, :L5
    instance-of v6, v5, Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v6, :L4
    check-cast v5, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { v5 }, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;
    move-result-object v5
    if-eq v5, v4, :L5
  :L4
  .line 371
    new-instance v5, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    invoke-direct { v5, p0, v4 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    invoke-virtual { v1, v5 }, Lcom/innioasis/y1/view/ReflectImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
  :L5
  .line 373
    invoke-static { v3 }, Lcom/innioasis/ipp/Cover;->leftOf(Landroid/view/ViewGroup$MarginLayoutParams;)I
    move-result p0
    invoke-static { v0, v1, v2, p0 }, Lcom/innioasis/ipp/Cover;->shape(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;Lcom/innioasis/y1/view/ReflectImageView;Landroid/view/ViewGroup$MarginLayoutParams;I)V
  :L6
  .line 375
    goto :L10
  :L7
  .line 365
    return-void
  :L8
  .line 360
    return-void
  :L9
  .line 374
    move-exception p0
  :L10
  .line 376
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
  .line 383
    invoke-static { }, Lcom/innioasis/ipp/Cover;->flatCover()Z
    move-result v1
  .line 384
    const/4 v2, 0
    if-eqz v1, :L1
    const/4 v3, 0
    goto :L2
  :L1
    const/4 v3, 1
  :L2
  .line 385
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
  .line 386
    new-instance v4, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v4 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 387
    iput-boolean v2, v4, Landroid/graphics/BitmapFactory$Options;->inScaled:Z
  .line 388
    sget-object v5, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
  .line 389
    invoke-virtual { v5 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v5
    invoke-virtual { v5 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v5
  .line 388
    const v6, 2131230831
    invoke-static { v5, v6, v4 }, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object v4
  :L5
  .line 390
    const/4 v5, 0
    if-nez v4, :L6
    monitor-exit v0
    return-object v5
  :L6
  .line 391
    invoke-virtual { v4 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v6
  .line 392
    invoke-virtual { v4 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v7
  .line 393
    if-gt v6, v7, :L7
    move v8, v6
    goto :L8
  :L7
    move v8, v7
  :L8
  .line 394
    const/4 v9, 2
    if-eqz v1, :L9
    goto :L10
  :L9
    const/4 v2, 2
  :L10
  .line 395
    mul-int/lit8 v1, v2, 2
    add-int/2addr v1, v8
    add-int v10, v8, v2
    sget-object v11, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v1, v10, v11 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 396
    new-instance v11, Landroid/graphics/Paint;
    invoke-direct { v11, v9 }, Landroid/graphics/Paint;-><init>(I)V
  .line 397
    sub-int/2addr v6, v8
    div-int/2addr v6, v9
  .line 398
    sub-int/2addr v7, v8
    div-int/2addr v7, v9
  .line 399
    new-instance v9, Landroid/graphics/Canvas;
    invoke-direct { v9, v1 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
    new-instance v12, Landroid/graphics/Rect;
    add-int v13, v6, v8
    add-int/2addr v8, v7
    invoke-direct { v12, v6, v7, v13, v8 }, Landroid/graphics/Rect;-><init>(IIII)V
    new-instance v6, Landroid/graphics/Rect;
    invoke-direct { v6, v2, v2, v10, v10 }, Landroid/graphics/Rect;-><init>(IIII)V
    invoke-virtual { v9, v4, v12, v6, v11 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 401
    invoke-virtual { v4 }, Landroid/graphics/Bitmap;->recycle()V
  .line 402
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v4
  .line 403
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v6
  .line 404
    div-int/lit8 v7, v6, 2
    add-int/2addr v7, v6
    sget-object v8, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v4, v7, v8 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v7
  .line 405
    new-instance v8, Landroid/graphics/Canvas;
    invoke-direct { v8, v7 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 406
    const/4 v9, 0
    invoke-virtual { v8, v1, v9, v9, v5 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
  .line 407
    invoke-static { v8, v1, v4, v6, v2 }, Lcom/innioasis/ipp/Cover;->mirror(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;III)V
  .line 408
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->recycle()V
  .line 409
    sput-object v7, Lcom/innioasis/ipp/Cover;->blankPic:Landroid/graphics/Bitmap;
  .line 410
    sput v3, Lcom/innioasis/ipp/Cover;->blankLook:I
  :L11
  .line 411
    monitor-exit v0
    return-object v7
  :L12
  .line 382
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method private static box(Lcom/innioasis/y1/view/ReflectImageView;Landroid/view/ViewGroup$MarginLayoutParams;IIII)V
  .registers 7
  .line 245
    if-lez p2, :L2
    if-lez p3, :L2
    if-ltz p4, :L2
    if-gez p5, :L0
    goto :L2
  :L0
  .line 247
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
  .line 248
    iput p2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
  .line 249
    iput p3, p1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
  .line 250
    iput p4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
  .line 251
    iput p5, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
  .line 253
    invoke-virtual { p1, p5 }, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V
  .line 254
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/view/ReflectImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 255
    return-void
  :L2
  .line 245
    return-void
.end method

.method private static capture(Landroid/view/ViewGroup$MarginLayoutParams;)V
  .registers 2
  .line 237
    sget v0, Lcom/innioasis/ipp/Cover;->boxW:I
    if-gtz v0, :L0
    if-eqz p0, :L0
    iget v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
    if-lez v0, :L0
  .line 238
    iget v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
    sput v0, Lcom/innioasis/ipp/Cover;->boxW:I
  .line 239
    iget p0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
    sput p0, Lcom/innioasis/ipp/Cover;->boxH:I
  :L0
  .line 241
    return-void
.end method

.method public static declared-synchronized fitCover(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L18
  .catchall { :L2 .. :L9 } :L16
  .catchall { :L11 .. :L14 } :L16
  .registers 9
    const-class v0, Lcom/innioasis/ipp/Cover;
    monitor-enter v0
  .line 494
    if-nez p0, :L0
  .line 495
    monitor-exit v0
    const/4 p0, 0
    return-object p0
  :L0
  .line 497
    invoke-static { }, Lcom/innioasis/ipp/Cover;->flatCover()Z
    move-result v1
  .line 498
    invoke-static { p0 }, Lcom/innioasis/ipp/Cover;->fitMemo(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object v2
  :L1
  .line 499
    if-eqz v2, :L2
  .line 500
    monitor-exit v0
    return-object v2
  :L2
  .line 503
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v2
  .line 504
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v3
  .line 505
    if-lez v2, :L15
    if-lez v3, :L15
  .line 506
    if-gt v2, v3, :L3
    move v4, v2
    goto :L4
  :L3
    move v4, v3
  :L4
  .line 507
    const/16 v5, 320
    if-le v4, v5, :L5
    goto :L6
  :L5
    move v5, v4
  :L6
  .line 508
    if-ne v2, v3, :L10
    if-ne v3, v5, :L10
  .line 510
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
  .line 512
    sub-int/2addr v2, v4
  :L11
    div-int/lit8 v2, v2, 2
  .line 513
    sub-int/2addr v3, v4
    div-int/lit8 v3, v3, 2
  .line 514
    new-instance v6, Landroid/graphics/Rect;
    add-int v7, v2, v4
    add-int/2addr v4, v3
    invoke-direct { v6, v2, v3, v7, v4 }, Landroid/graphics/Rect;-><init>(IIII)V
  .line 515
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v5, v5, v2 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v2
  .line 516
    new-instance v3, Landroid/graphics/Canvas;
    invoke-direct { v3, v2 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 517
    new-instance v4, Landroid/graphics/Rect;
    const/4 v7, 0
    invoke-direct { v4, v7, v7, v5, v5 }, Landroid/graphics/Rect;-><init>(IIII)V
  .line 518
    new-instance v5, Landroid/graphics/Paint;
    invoke-direct { v5 }, Landroid/graphics/Paint;-><init>()V
  .line 519
    const/4 v7, 1
    invoke-virtual { v5, v7 }, Landroid/graphics/Paint;->setFilterBitmap(Z)V
  .line 520
    invoke-virtual { v5, v7 }, Landroid/graphics/Paint;->setAntiAlias(Z)V
  .line 521
    invoke-virtual { v3, p0, v6, v4, v5 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 522
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
  .line 525
    goto :L17
  :L16
  .line 524
    move-exception v1
  :L17
  .line 526
    monitor-exit v0
    return-object p0
  :L18
  .line 493
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
  .line 336
    const/4 v0, 0
  :L0
    iget-object v1, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->musicInfoLl:Landroidx/constraintlayout/widget/ConstraintLayout;
  .line 337
    invoke-virtual { v1 }, Landroidx/constraintlayout/widget/ConstraintLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v1
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 338
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
    invoke-virtual { p0 }, Lcom/innioasis/y1/view/ReflectImageView;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object p0
    iget p0, p0, Landroid/util/DisplayMetrics;->widthPixels:I
  .line 339
    iget v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I
    sub-int/2addr p0, v2
    iget v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
  :L1
    sub-int/2addr p0, v1
  .line 340
    sub-int/2addr p0, p2
    sub-int/2addr p0, p2
  .line 342
    sub-int/2addr p1, p0
  .line 343
    if-lez p1, :L2
    move v0, p1
  :L2
    return v0
  :L3
  .line 344
    move-exception p0
  .line 345
    return v0
.end method

.method public static instantBlank(Lcom/innioasis/y1/base/BasePlayerActivity;Ljava/lang/String;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 3
  .line 420
    if-eqz p0, :L7
    if-nez p1, :L0
    goto :L7
  :L0
  .line 421
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->knownNone(Ljava/lang/String;)Z
    move-result p1
    if-nez p1, :L1
    return-void
  :L1
  .line 422
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;
  .line 423
    if-nez p0, :L2
    return-void
  :L2
  .line 424
    iget-object p1, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
    if-eqz p1, :L3
    iget-object p1, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
    const/16 v0, 8
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/view/ReflectImageView;->setVisibility(I)V
  :L3
  .line 425
    iget-object p1, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg2:Lcom/innioasis/y1/view/ReflectImageView;
    if-eqz p1, :L4
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg2:Lcom/innioasis/y1/view/ReflectImageView;
    const/4 p1, 0
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/view/ReflectImageView;->setVisibility(I)V
  :L4
  .line 428
    goto :L6
  :L5
  .line 426
    move-exception p0
  :L6
  .line 429
    return-void
  :L7
  .line 420
    return-void
.end method

.method public static instantCover(Lcom/innioasis/y1/base/BasePlayerActivity;Ljava/lang/String;)V
  .catchall { :L1 .. :L2 } :L3
  .registers 4
  .line 631
    invoke-static { p0 }, Lcom/innioasis/ipp/Cover;->blank(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .line 632
    invoke-static { p1 }, Lcom/innioasis/ipp/Cover;->bigCoverCached(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 633
    if-nez v0, :L0
  .line 634
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Cover;->instantBlank(Lcom/innioasis/y1/base/BasePlayerActivity;Ljava/lang/String;)V
  .line 635
    return-void
  :L0
  .line 637
    invoke-static { v0 }, Lcom/innioasis/ipp/Cover;->fitCover(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object p1
  .line 638
    if-nez p1, :L1
  .line 639
    return-void
  :L1
  .line 642
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;
  .line 643
    iget-object v1, v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
  .line 644
    invoke-virtual { v1, p1 }, Lcom/innioasis/y1/view/ReflectImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 645
    const/4 p1, 0
    invoke-virtual { v1, p1 }, Lcom/innioasis/y1/view/ReflectImageView;->setVisibility(I)V
  .line 646
    iget-object p1, v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg2:Lcom/innioasis/y1/view/ReflectImageView;
    const/16 v0, 8
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/view/ReflectImageView;->setVisibility(I)V
  .line 647
    invoke-static { p0 }, Lcom/innioasis/ipp/Cover;->tilt(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  :L2
  .line 649
    goto :L4
  :L3
  .line 648
    move-exception p0
  :L4
  .line 650
    return-void
.end method

.method private static leftOf(Landroid/view/ViewGroup$MarginLayoutParams;)I
  .registers 2
  .line 259
    invoke-virtual { p0 }, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginStart()I
    move-result v0
  .line 260
    if-lez v0, :L0
    goto :L1
  :L0
    iget v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
  :L1
    return v0
.end method

.method private static mapX(Landroid/graphics/Matrix;FF)F
  .registers 5
  .line 290
    const/4 v0, 2
    new-array v0, v0, [F
    const/4 v1, 0
    aput p1, v0, v1
    const/4 p1, 1
    aput p2, v0, p1
  .line 291
    invoke-virtual { p0, v0 }, Landroid/graphics/Matrix;->mapPoints([F)V
  .line 292
    aget p0, v0, v1
    return p0
.end method

.method private static mirror(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;III)V
  .registers 26
  .line 158
    move/from16 v0, p2
    move/from16 v1, p3
    move/from16 v9, p4
    div-int/lit8 v10, v1, 2
  .line 159
    const/16 v2, 150
    if-le v0, v2, :L0
    const/high16 v2, 0x43160000
    int-to-float v3, v0
    div-float/2addr v2, v3
    goto :L1
  :L0
    const/high16 v2, 0x3F800000
  :L1
  .line 160
    new-instance v7, Landroid/graphics/Matrix;
    invoke-direct { v7 }, Landroid/graphics/Matrix;-><init>()V
  .line 161
    neg-float v3, v2
    invoke-virtual { v7, v2, v3 }, Landroid/graphics/Matrix;->preScale(FF)Z
  .line 162
    mul-int/lit8 v2, v9, 2
    sub-int v5, v0, v2
    const/4 v8, 1
    move-object/from16 v2, p1
    move/from16 v3, p4
    move v4, v10
    move v6, v10
    invoke-static/range { v2 .. v8 }, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;
    move-result-object v2
  .line 163
    new-instance v3, Landroid/graphics/Paint;
    invoke-direct { v3 }, Landroid/graphics/Paint;-><init>()V
  .line 164
    const/4 v4, 1
    invoke-virtual { v3, v4 }, Landroid/graphics/Paint;->setFilterBitmap(Z)V
  .line 165
    invoke-virtual { v3, v4 }, Landroid/graphics/Paint;->setAntiAlias(Z)V
  .line 166
    new-instance v4, Landroid/graphics/Rect;
    sub-int v5, v0, v9
    add-int v6, v1, v10
    invoke-direct { v4, v9, v1, v5, v6 }, Landroid/graphics/Rect;-><init>(IIII)V
    const/4 v5, 0
    move-object/from16 v7, p0
    invoke-virtual { v7, v2, v5, v4, v3 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 169
    new-instance v12, Landroid/graphics/Paint;
    invoke-direct { v12 }, Landroid/graphics/Paint;-><init>()V
  .line 170
    new-instance v2, Landroid/graphics/LinearGradient;
    const/4 v14, 0
    int-to-float v9, v1
    const/16 v16, 0
    int-to-float v11, v6
    const v18, 1895825407
    const v19, 16777215
    sget-object v20, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;
    move-object v13, v2
    move v15, v9
    move/from16 v17, v11
    invoke-direct/range { v13 .. v20 }, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V
    invoke-virtual { v12, v2 }, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;
  .line 172
    new-instance v1, Landroid/graphics/PorterDuffXfermode;
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->DST_IN:Landroid/graphics/PorterDuff$Mode;
    invoke-direct { v1, v2 }, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V
    invoke-virtual { v12, v1 }, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;
  .line 173
    const/4 v8, 0
    int-to-float v10, v0
    invoke-virtual/range { v7 .. v12 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 174
    return-void
.end method

.method public static preview(Lcom/innioasis/y1/base/BasePlayerActivity;Landroid/graphics/Bitmap;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 6
  :L0
  .line 613
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;
  .line 614
    invoke-static { p0 }, Lcom/innioasis/ipp/Cover;->blank(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .line 615
    if-nez p1, :L1
    const/4 p1, 0
    goto :L2
  :L1
    invoke-static { p1 }, Lcom/innioasis/ipp/Cover;->fitCover(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object p1
  :L2
  .line 616
    const/4 v1, 0
    const/16 v2, 8
    if-nez p1, :L3
  .line 617
    iget-object p0, v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/view/ReflectImageView;->setVisibility(I)V
  .line 618
    iget-object p0, v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg2:Lcom/innioasis/y1/view/ReflectImageView;
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/view/ReflectImageView;->setVisibility(I)V
  .line 619
    return-void
  :L3
  .line 621
    iget-object v3, v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
    invoke-virtual { v3, p1 }, Lcom/innioasis/y1/view/ReflectImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 622
    iget-object p1, v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
    invoke-virtual { p1, v1 }, Lcom/innioasis/y1/view/ReflectImageView;->setVisibility(I)V
  .line 623
    iget-object p1, v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg2:Lcom/innioasis/y1/view/ReflectImageView;
    invoke-virtual { p1, v2 }, Lcom/innioasis/y1/view/ReflectImageView;->setVisibility(I)V
  .line 624
    invoke-static { p0 }, Lcom/innioasis/ipp/Cover;->tilt(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  :L4
  .line 626
    goto :L6
  :L5
  .line 625
    move-exception p0
  :L6
  .line 627
    return-void
.end method

.method public static reflCache()Landroid/graphics/Bitmap;
  .registers 3
  .line 438
    sget-object v0, Lcom/innioasis/ipp/Cover;->reflCache:Landroid/graphics/Bitmap;
  .line 439
    const/4 v1, 0
    if-nez v0, :L0
  .line 440
    return-object v1
  :L0
  .line 442
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v2
    if-eqz v2, :L1
  .line 443
    nop
  .line 444
    sput-object v1, Lcom/innioasis/ipp/Cover;->reflCache:Landroid/graphics/Bitmap;
    move-object v0, v1
  :L1
  .line 446
    return-object v0
.end method

.method public static declared-synchronized reflect(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L13
  .catchall { :L2 .. :L4 } :L13
  .catchall { :L5 .. :L11 } :L13
  .registers 10
    const-class v0, Lcom/innioasis/ipp/Cover;
    monitor-enter v0
  .line 120
    const/4 v1, 0
    if-nez p0, :L0
    monitor-exit v0
    return-object v1
  :L0
  .line 121
    invoke-static { }, Lcom/innioasis/ipp/Cover;->flatCover()Z
  .line 122
    sget-object v2, Lcom/innioasis/ipp/Cover;->reflIn:Ljava/lang/ref/WeakReference;
    if-eqz v2, :L2
    sget-object v3, Lcom/innioasis/ipp/Cover;->reflOut:Landroid/graphics/Bitmap;
    if-eqz v3, :L2
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
    if-ne v2, p0, :L2
    sget v2, Lcom/innioasis/ipp/Cover;->reflGen:I
  .line 123
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getGenerationId()I
    move-result v3
    if-ne v2, v3, :L2
    sget-object v2, Lcom/innioasis/ipp/Cover;->reflOut:Landroid/graphics/Bitmap;
    invoke-virtual { v2 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v2
    if-nez v2, :L2
  .line 124
    sget-object p0, Lcom/innioasis/ipp/Cover;->reflOut:Landroid/graphics/Bitmap;
  :L1
    monitor-exit v0
    return-object p0
  :L2
  .line 126
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v2
  .line 127
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v3
  .line 128
    if-lez v2, :L12
    if-gtz v3, :L3
    goto :L12
  :L3
  .line 129
    div-int/lit8 v4, v3, 2
  :L4
  .line 130
    if-gtz v4, :L5
    monitor-exit v0
    return-object v1
  :L5
  .line 134
    sget-object v5, Lcom/innioasis/ipp/Cover;->spare:Landroid/graphics/Bitmap;
  .line 135
    sput-object v1, Lcom/innioasis/ipp/Cover;->spare:Landroid/graphics/Bitmap;
  .line 136
    const/4 v6, 0
    if-eqz v5, :L6
    invoke-virtual { v5 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v7
    if-nez v7, :L6
    invoke-virtual { v5 }, Landroid/graphics/Bitmap;->isMutable()Z
    move-result v7
    if-eqz v7, :L6
  .line 137
    invoke-virtual { v5 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v7
    if-ne v7, v2, :L6
    invoke-virtual { v5 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v7
    add-int v8, v3, v4
    if-ne v7, v8, :L6
  .line 138
    invoke-virtual { v5, v6 }, Landroid/graphics/Bitmap;->eraseColor(I)V
    goto :L7
  :L6
  .line 140
    add-int/2addr v4, v3
    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v2, v4, v5 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v5
  :L7
  .line 142
    new-instance v4, Landroid/graphics/Canvas;
    invoke-direct { v4, v5 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 143
    const/4 v7, 0
    invoke-virtual { v4, p0, v7, v7, v1 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
  .line 144
    invoke-static { }, Lcom/innioasis/ipp/Cover;->flatCover()Z
    move-result v7
    if-eqz v7, :L8
    goto :L9
  :L8
    const/4 v6, 2
  :L9
    invoke-static { v4, p0, v2, v3, v6 }, Lcom/innioasis/ipp/Cover;->mirror(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;III)V
  .line 146
    sget-object v2, Lcom/innioasis/ipp/Cover;->reflOut:Landroid/graphics/Bitmap;
    sget-object v3, Lcom/innioasis/ipp/Cover;->held:Landroid/graphics/Bitmap;
    if-eq v2, v3, :L10
    sput-object v2, Lcom/innioasis/ipp/Cover;->spare:Landroid/graphics/Bitmap;
  :L10
  .line 147
    new-instance v2, Ljava/lang/ref/WeakReference;
    invoke-direct { v2, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v2, Lcom/innioasis/ipp/Cover;->reflIn:Ljava/lang/ref/WeakReference;
  .line 148
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getGenerationId()I
    move-result p0
    sput p0, Lcom/innioasis/ipp/Cover;->reflGen:I
  .line 149
    sput-object v5, Lcom/innioasis/ipp/Cover;->reflOut:Landroid/graphics/Bitmap;
  :L11
  .line 150
    monitor-exit v0
    return-object v5
  :L12
  .line 128
    monitor-exit v0
    return-object v1
  :L13
  .line 151
    move-exception p0
  .line 152
    monitor-exit v0
    return-object v1
.end method

.method public static declared-synchronized release(Landroid/graphics/Bitmap;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 4
    const-class v0, Lcom/innioasis/ipp/Cover;
    monitor-enter v0
  .line 105
    if-eqz p0, :L6
  :L0
    sget-object v1, Lcom/innioasis/ipp/Cover;->blankPic:Landroid/graphics/Bitmap;
    if-eq p0, v1, :L6
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v1
    if-nez v1, :L6
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->isMutable()Z
    move-result v1
    if-nez v1, :L1
    goto :L6
  :L1
  .line 106
    sget-object v1, Lcom/innioasis/ipp/Cover;->held:Landroid/graphics/Bitmap;
    const/4 v2, 0
    if-ne v1, p0, :L2
    sput-object v2, Lcom/innioasis/ipp/Cover;->held:Landroid/graphics/Bitmap;
  :L2
  .line 107
    sget-object v1, Lcom/innioasis/ipp/Cover;->reflOut:Landroid/graphics/Bitmap;
    if-ne v1, p0, :L3
  .line 108
    sput-object v2, Lcom/innioasis/ipp/Cover;->reflOut:Landroid/graphics/Bitmap;
  .line 109
    sput-object v2, Lcom/innioasis/ipp/Cover;->reflIn:Ljava/lang/ref/WeakReference;
  :L3
  .line 111
    sput-object p0, Lcom/innioasis/ipp/Cover;->spare:Landroid/graphics/Bitmap;
  :L4
  .line 112
    monitor-exit v0
    return-void
  :L5
  .line 104
    move-exception p0
    monitor-exit v0
    throw p0
  :L6
  .line 105
    monitor-exit v0
    return-void
.end method

.method private static rowsHeight(Landroid/view/ViewGroup;)I
  .registers 7
  .line 315
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getHeight()I
    move-result v0
  .line 316
    if-lez v0, :L0
    return v0
  :L0
  .line 317
    nop
  .line 318
    const/4 v0, 0
    const/4 v1, 0
    const/4 v2, 0
  :L1
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v3
    if-ge v1, v3, :L6
  .line 319
    invoke-virtual { p0, v1 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v3
  .line 320
    if-eqz v3, :L5
    invoke-virtual { v3 }, Landroid/view/View;->getVisibility()I
    move-result v4
    const/16 v5, 8
    if-ne v4, v5, :L2
    goto :L5
  :L2
  .line 321
    invoke-virtual { v3 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v3
  .line 322
    instance-of v4, v3, Landroid/view/ViewGroup$MarginLayoutParams;
    if-nez v4, :L3
    return v0
  :L3
  .line 323
    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 324
    iget v4, v3, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
    if-gtz v4, :L4
    return v0
  :L4
  .line 325
    iget v4, v3, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
    iget v3, v3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    add-int/2addr v4, v3
    add-int/2addr v2, v4
  :L5
  .line 318
    add-int/lit8 v1, v1, 1
    goto :L1
  :L6
  .line 327
    return v2
.end method

.method public static setReflCache(Landroid/graphics/Bitmap;)V
  .registers 1
  .line 450
    sput-object p0, Lcom/innioasis/ipp/Cover;->reflCache:Landroid/graphics/Bitmap;
  .line 451
    return-void
.end method

.method private static shape(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;Lcom/innioasis/y1/view/ReflectImageView;Landroid/view/ViewGroup$MarginLayoutParams;I)V
  .catchall { :L0 .. :L5 } :L7
  .registers 14
  :L0
  .line 201
    sget v0, Lcom/innioasis/ipp/Cover;->boxW:I
    if-lez v0, :L6
    sget v0, Lcom/innioasis/ipp/Cover;->boxH:I
    if-gtz v0, :L1
    goto/16 :L6
  :L1
  .line 202
    invoke-static { }, Lcom/innioasis/ipp/Cover;->flatCover()Z
    move-result v0
  .line 203
    sget v1, Lcom/innioasis/ipp/Cover;->boxW:I
    invoke-static { p0, v1, p3 }, Lcom/innioasis/ipp/Cover;->inset(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;II)I
    move-result v2
    sub-int/2addr v1, v2
  .line 204
    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_START:Landroid/widget/ImageView$ScaleType;
    invoke-virtual { p1, v2 }, Lcom/innioasis/y1/view/ReflectImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
  .line 206
    const/4 v2, 0
    const/4 v3, 0
    if-eqz v0, :L2
  .line 207
    invoke-virtual { p1, v2 }, Lcom/innioasis/y1/view/ReflectImageView;->setRotationY(F)V
  .line 208
    sget v0, Lcom/innioasis/ipp/Cover;->boxW:I
    sub-int/2addr v0, v1
    invoke-virtual { p1, v3, v3, v0, v3 }, Lcom/innioasis/y1/view/ReflectImageView;->setPadding(IIII)V
  .line 209
    sget v6, Lcom/innioasis/ipp/Cover;->boxW:I
    sget v7, Lcom/innioasis/ipp/Cover;->boxH:I
    invoke-static { p0, p2, v1 }, Lcom/innioasis/ipp/Cover;->topFor(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;Landroid/view/ViewGroup$MarginLayoutParams;I)I
    move-result v8
    move-object v4, p1
    move-object v5, p2
    move v9, p3
    invoke-static/range { v4 .. v9 }, Lcom/innioasis/ipp/Cover;->box(Lcom/innioasis/y1/view/ReflectImageView;Landroid/view/ViewGroup$MarginLayoutParams;IIII)V
  .line 210
    return-void
  :L2
  .line 212
    invoke-virtual { p1, v3, v3, v3, v3 }, Lcom/innioasis/y1/view/ReflectImageView;->setPadding(IIII)V
  .line 215
    invoke-virtual { p1 }, Lcom/innioasis/y1/view/ReflectImageView;->getHeight()I
    move-result v0
    int-to-float v0, v0
  .line 216
    cmpg-float v3, v0, v2
    if-gtz v3, :L3
    iget v0, p2, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
    int-to-float v0, v0
  :L3
  .line 217
    invoke-virtual { p1, v2 }, Lcom/innioasis/y1/view/ReflectImageView;->setPivotX(F)V
  .line 218
    const/high16 v3, 0x40400000
    cmpl-float v2, v0, v2
    if-lez v2, :L4
    div-float/2addr v0, v3
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/view/ReflectImageView;->setPivotY(F)V
  :L4
  .line 219
    const/high16 v0, 0x41A00000
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/view/ReflectImageView;->setRotationY(F)V
  .line 223
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/Cover;->tiltWidth(Lcom/innioasis/y1/view/ReflectImageView;I)I
    move-result v6
  .line 224
    int-to-float v0, v6
    sget v1, Lcom/innioasis/ipp/Cover;->boxH:I
    int-to-float v1, v1
    mul-float v0, v0, v1
    sget v1, Lcom/innioasis/ipp/Cover;->boxW:I
    int-to-float v1, v1
    div-float/2addr v0, v1
    invoke-static { v0 }, Ljava/lang/Math;->round(F)I
    move-result v0
  .line 225
    invoke-static { p0, p2, v6 }, Lcom/innioasis/ipp/Cover;->topFor(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;Landroid/view/ViewGroup$MarginLayoutParams;I)I
    move-result v8
    move-object v4, p1
    move-object v5, p2
    move v7, v0
    move v9, p3
    invoke-static/range { v4 .. v9 }, Lcom/innioasis/ipp/Cover;->box(Lcom/innioasis/y1/view/ReflectImageView;Landroid/view/ViewGroup$MarginLayoutParams;IIII)V
  .line 226
    if-lez v0, :L5
    int-to-float p0, v0
    div-float/2addr p0, v3
    invoke-virtual { p1, p0 }, Lcom/innioasis/y1/view/ReflectImageView;->setPivotY(F)V
  :L5
  .line 228
    goto :L8
  :L6
  .line 201
    return-void
  :L7
  .line 227
    move-exception p0
  :L8
  .line 229
    return-void
.end method

.method private static softEdge(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L3 } :L5
  .registers 6
  .line 465
    if-nez p0, :L0
  .line 466
    const/4 p0, 0
    return-object p0
  :L0
  .line 469
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v0
  .line 470
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v1
  .line 471
    if-lez v0, :L4
    if-lez v1, :L4
  .line 472
    sget-object v2, Lcom/innioasis/ipp/Cover;->edge:Landroid/graphics/Bitmap;
  .line 473
    if-eqz v2, :L1
    invoke-virtual { v2 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v3
    if-nez v3, :L1
  .line 474
    invoke-virtual { v2 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v3
    add-int/lit8 v4, v0, 4
    if-ne v3, v4, :L1
    invoke-virtual { v2 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v3
    add-int/lit8 v4, v1, 2
    if-ne v3, v4, :L1
  .line 475
    const/4 v0, 0
    invoke-virtual { v2, v0 }, Landroid/graphics/Bitmap;->eraseColor(I)V
    goto :L2
  :L1
  .line 477
    add-int/lit8 v0, v0, 4
    add-int/lit8 v1, v1, 2
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v0, v1, v2 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v2
  .line 478
    sput-object v2, Lcom/innioasis/ipp/Cover;->edge:Landroid/graphics/Bitmap;
  :L2
  .line 480
    new-instance v0, Landroid/graphics/Canvas;
    invoke-direct { v0, v2 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 481
    new-instance v1, Landroid/graphics/Paint;
    invoke-direct { v1 }, Landroid/graphics/Paint;-><init>()V
  .line 482
    const/4 v3, 1
    invoke-virtual { v1, v3 }, Landroid/graphics/Paint;->setFilterBitmap(Z)V
  .line 483
    invoke-virtual { v1, v3 }, Landroid/graphics/Paint;->setAntiAlias(Z)V
  .line 484
    const/high16 v3, 0x40000000
    invoke-virtual { v0, p0, v3, v3, v1 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
  :L3
  .line 485
    return-object v2
  :L4
  .line 488
    goto :L6
  :L5
  .line 487
    move-exception v0
  :L6
  .line 489
    return-object p0
.end method

.method public static square(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L8 } :L10
  .registers 14
  .line 534
    if-nez p0, :L0
  .line 535
    const/4 p0, 0
    return-object p0
  :L0
  .line 538
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v0
  .line 539
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v1
  .line 540
    if-lez v0, :L9
    if-lez v1, :L9
    if-lez p1, :L9
  .line 541
    if-ne v0, p1, :L1
    if-ne v1, p1, :L1
  .line 542
    return-object p0
  :L1
  .line 544
    new-instance v2, Landroid/graphics/Paint;
    invoke-direct { v2 }, Landroid/graphics/Paint;-><init>()V
  .line 545
    const/4 v3, 1
    invoke-virtual { v2, v3 }, Landroid/graphics/Paint;->setFilterBitmap(Z)V
  .line 546
    invoke-virtual { v2, v3 }, Landroid/graphics/Paint;->setAntiAlias(Z)V
  .line 550
    nop
  .line 551
    const/4 v4, 0
    const/4 v6, 0
    move-object v5, p0
  :L2
  .line 552
    mul-int/lit8 v7, p1, 2
    if-lt v0, v7, :L5
    if-lt v1, v7, :L5
  .line 553
    div-int/lit8 v7, v0, 2
  .line 554
    div-int/lit8 v8, v1, 2
  .line 555
    if-lez v7, :L5
    if-gtz v8, :L3
    goto :L5
  :L3
  .line 556
    sget-object v9, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v7, v8, v9 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v9
  .line 557
    new-instance v10, Landroid/graphics/Canvas;
    invoke-direct { v10, v9 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 558
    new-instance v11, Landroid/graphics/Rect;
    invoke-direct { v11, v4, v4, v0, v1 }, Landroid/graphics/Rect;-><init>(IIII)V
    new-instance v0, Landroid/graphics/Rect;
    invoke-direct { v0, v4, v4, v7, v8 }, Landroid/graphics/Rect;-><init>(IIII)V
    invoke-virtual { v10, v5, v11, v0, v2 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 559
    if-eqz v6, :L4
  .line 560
    invoke-virtual { v5 }, Landroid/graphics/Bitmap;->recycle()V
  :L4
  .line 562
    nop
  .line 563
    nop
  .line 564
    nop
  .line 565
    nop
  .line 566
    move v0, v7
    move v1, v8
    move-object v5, v9
    const/4 v6, 1
    goto :L2
  :L5
  .line 568
    if-gt v0, v1, :L6
    move v3, v0
    goto :L7
  :L6
    move v3, v1
  :L7
  .line 569
    sub-int/2addr v0, v3
    div-int/lit8 v0, v0, 2
  .line 570
    sub-int/2addr v1, v3
    div-int/lit8 v1, v1, 2
  .line 571
    new-instance v7, Landroid/graphics/Rect;
    add-int v8, v0, v3
    add-int/2addr v3, v1
    invoke-direct { v7, v0, v1, v8, v3 }, Landroid/graphics/Rect;-><init>(IIII)V
  .line 572
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { p1, p1, v0 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 573
    new-instance v1, Landroid/graphics/Canvas;
    invoke-direct { v1, v0 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 574
    new-instance v3, Landroid/graphics/Rect;
    invoke-direct { v3, v4, v4, p1, p1 }, Landroid/graphics/Rect;-><init>(IIII)V
  .line 575
    invoke-virtual { v1, v5, v7, v3, v2 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 576
    if-eqz v6, :L8
  .line 577
    invoke-virtual { v5 }, Landroid/graphics/Bitmap;->recycle()V
  :L8
  .line 579
    return-object v0
  :L9
  .line 582
    goto :L11
  :L10
  .line 581
    move-exception p1
  :L11
  .line 583
    return-object p0
.end method

.method public static tilt(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 4
  .line 178
    if-nez p0, :L0
    return-void
  :L0
  .line 179
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;
  .line 180
    if-nez p0, :L1
    return-void
  :L1
  .line 182
    iget-object v0, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
  .line 183
    if-nez v0, :L2
    return-void
  :L2
  .line 184
    nop
  .line 185
    invoke-virtual { v0 }, Lcom/innioasis/y1/view/ReflectImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v1
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 186
    if-nez v1, :L3
    return-void
  :L3
  .line 187
    invoke-static { v1 }, Lcom/innioasis/ipp/Cover;->capture(Landroid/view/ViewGroup$MarginLayoutParams;)V
  .line 188
    invoke-static { v1 }, Lcom/innioasis/ipp/Cover;->leftOf(Landroid/view/ViewGroup$MarginLayoutParams;)I
    move-result v2
    invoke-static { p0, v0, v1, v2 }, Lcom/innioasis/ipp/Cover;->shape(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;Lcom/innioasis/y1/view/ReflectImageView;Landroid/view/ViewGroup$MarginLayoutParams;I)V
  :L4
  .line 190
    goto :L6
  :L5
  .line 189
    move-exception p0
  :L6
  .line 191
    return-void
.end method

.method private static tiltWidth(Lcom/innioasis/y1/view/ReflectImageView;I)I
  .catchall { :L0 .. :L11 } :L12
  .registers 9
  .line 270
    if-gtz p1, :L1
  :L0
    sget p0, Lcom/innioasis/ipp/Cover;->boxW:I
    return p0
  :L1
  .line 271
    invoke-virtual { p0 }, Lcom/innioasis/y1/view/ReflectImageView;->getMatrix()Landroid/graphics/Matrix;
    move-result-object v0
  .line 272
    if-eqz v0, :L10
    invoke-virtual { v0 }, Landroid/graphics/Matrix;->isIdentity()Z
    move-result v1
    if-eqz v1, :L2
    goto :L10
  :L2
  .line 273
    invoke-virtual { p0 }, Lcom/innioasis/y1/view/ReflectImageView;->getPivotY()F
    move-result p0
  .line 274
    int-to-float v1, p1
  .line 275
    const/high16 v2, 0x40400000
    mul-float v2, v2, v1
  .line 276
    invoke-static { v0, v2, p0 }, Lcom/innioasis/ipp/Cover;->mapX(Landroid/graphics/Matrix;FF)F
    move-result v3
    cmpg-float v3, v3, v1
    if-gez v3, :L3
    invoke-static { v2 }, Ljava/lang/Math;->round(F)I
    move-result p0
    return p0
  :L3
  .line 277
    const/4 v3, 0
    move v4, v1
  :L4
    const/16 v5, 24
    const/high16 v6, 0x3F000000
    if-ge v3, v5, :L7
  .line 278
    add-float v5, v4, v2
    mul-float v5, v5, v6
  .line 279
    invoke-static { v0, v5, p0 }, Lcom/innioasis/ipp/Cover;->mapX(Landroid/graphics/Matrix;FF)F
    move-result v6
    cmpg-float v6, v6, v1
    if-gez v6, :L5
    move v4, v5
    goto :L6
  :L5
    move v2, v5
  :L6
  .line 277
    add-int/lit8 v3, v3, 1
    goto :L4
  :L7
  .line 281
    add-float/2addr v4, v2
    mul-float v4, v4, v6
    invoke-static { v4 }, Ljava/lang/Math;->round(F)I
    move-result p0
  .line 282
    if-ge p0, p1, :L8
    goto :L9
  :L8
    move p1, p0
  :L9
    return p1
  :L10
  .line 272
    sget p0, Lcom/innioasis/ipp/Cover;->boxW:I
  :L11
    return p0
  :L12
  .line 283
    move-exception p0
  .line 284
    sget p0, Lcom/innioasis/ipp/Cover;->boxW:I
    return p0
.end method

.method private static topFor(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;Landroid/view/ViewGroup$MarginLayoutParams;I)I
  .catchall { :L0 .. :L2 } :L5
  .registers 4
  :L0
  .line 303
    iget-object v0, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->musicInfoLl:Landroidx/constraintlayout/widget/ConstraintLayout;
  .line 304
    invoke-virtual { v0 }, Landroidx/constraintlayout/widget/ConstraintLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 305
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->musicInfoLl:Landroidx/constraintlayout/widget/ConstraintLayout;
    invoke-static { p0 }, Lcom/innioasis/ipp/Cover;->rowsHeight(Landroid/view/ViewGroup;)I
    move-result p0
  .line 306
    if-gtz p0, :L1
    iget p0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    return p0
  :L1
  .line 307
    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    sub-int/2addr p0, p2
    div-int/lit8 p0, p0, 2
  :L2
    add-int/2addr v0, p0
  .line 308
    if-lez v0, :L3
    goto :L4
  :L3
    const/4 v0, 0
  :L4
    return v0
  :L5
  .line 309
    move-exception p0
  .line 310
    iget p0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    return p0
.end method
