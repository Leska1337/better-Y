.class public final Lcom/innioasis/ipp/Cover;
.super Ljava/lang/Object;
.source "Cover.java"

.field public final static KEY_TILT:Ljava/lang/String; = "cover_tilt"

.field private final static PLAYER_SRCS:[I

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

.field private static spare2:Landroid/graphics/Bitmap;

.field private static srcKeep:[Ljava/lang/Object;

.method static constructor <clinit>()V
  .registers 1
  .line 39
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Cover;->look:I
  .line 404
    sput v0, Lcom/innioasis/ipp/Cover;->blankLook:I
  .line 413
    const/16 v0, 12
    new-array v0, v0, [I
    fill-array-data v0, :L0
    sput-object v0, Lcom/innioasis/ipp/Cover;->PLAYER_SRCS:[I
    return-void
  :L0
  .array-data 4
      2131230901
      2131230904
      2131624019
      2131623987
      2131623990
      2131623989
      2131624015
      2131624017
      2131623974
      2131623975
      2131623979
      2131623980
  .end array-data
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
  .line 637
    const/4 v0, 0
    if-nez p0, :L0
  .line 638
    return-object v0
  :L0
  .line 641
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->track(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object p0
  :L1
    return-object p0
  :L2
  .line 642
    move-exception p0
  .line 643
    return-object v0
.end method

.method private static bigCoverCached(Ljava/lang/String;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 649
    const/4 v0, 0
    if-nez p0, :L0
  .line 650
    return-object v0
  :L0
  .line 653
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object p0
  :L1
    return-object p0
  :L2
  .line 654
    move-exception p0
  .line 655
    return-object v0
.end method

.method private static blank(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .catchall { :L0 .. :L7 } :L10
  .registers 8
  :L0
  .line 381
    sget-object v0, Lcom/innioasis/ipp/Cover;->srcKeep:[Ljava/lang/Object;
    if-nez v0, :L1
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Cover;->keepSrcs(Landroid/content/res/Resources;)V
  :L1
  .line 382
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;
  .line 383
    if-nez v0, :L2
    return-void
  :L2
  .line 384
    iget-object v1, v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg2:Lcom/innioasis/y1/view/ReflectImageView;
  .line 385
    if-eqz v1, :L9
    iget-object v2, v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
    if-nez v2, :L3
    goto :L9
  :L3
  .line 386
    nop
  .line 387
    invoke-virtual { v1 }, Lcom/innioasis/y1/view/ReflectImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v2
    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 388
    iget-object v3, v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
  .line 389
    invoke-virtual { v3 }, Lcom/innioasis/y1/view/ReflectImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v3
    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 390
    if-eqz v2, :L8
    if-nez v3, :L4
    goto :L8
  :L4
  .line 391
    invoke-static { v3 }, Lcom/innioasis/ipp/Cover;->capture(Landroid/view/ViewGroup$MarginLayoutParams;)V
  .line 392
    invoke-static { }, Lcom/innioasis/ipp/Cover;->blankCover()Landroid/graphics/Bitmap;
    move-result-object v4
  .line 393
    invoke-virtual { v1 }, Lcom/innioasis/y1/view/ReflectImageView;->getDrawable()Landroid/graphics/drawable/Drawable;
    move-result-object v5
  .line 394
    if-eqz v4, :L6
    instance-of v6, v5, Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v6, :L5
    check-cast v5, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { v5 }, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;
    move-result-object v5
    if-eq v5, v4, :L6
  :L5
  .line 396
    new-instance v5, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    invoke-direct { v5, p0, v4 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    invoke-virtual { v1, v5 }, Lcom/innioasis/y1/view/ReflectImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
  :L6
  .line 398
    invoke-static { v3 }, Lcom/innioasis/ipp/Cover;->leftOf(Landroid/view/ViewGroup$MarginLayoutParams;)I
    move-result p0
    invoke-static { v0, v1, v2, p0 }, Lcom/innioasis/ipp/Cover;->shape(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;Lcom/innioasis/y1/view/ReflectImageView;Landroid/view/ViewGroup$MarginLayoutParams;I)V
  :L7
  .line 400
    goto :L11
  :L8
  .line 390
    return-void
  :L9
  .line 385
    return-void
  :L10
  .line 399
    move-exception p0
  :L11
  .line 401
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
  .line 432
    invoke-static { }, Lcom/innioasis/ipp/Cover;->flatCover()Z
    move-result v1
  .line 433
    const/4 v2, 0
    if-eqz v1, :L1
    const/4 v3, 0
    goto :L2
  :L1
    const/4 v3, 1
  :L2
  .line 434
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
  .line 435
    new-instance v4, Landroid/graphics/BitmapFactory$Options;
    invoke-direct { v4 }, Landroid/graphics/BitmapFactory$Options;-><init>()V
  .line 436
    iput-boolean v2, v4, Landroid/graphics/BitmapFactory$Options;->inScaled:Z
  .line 437
    sget-object v5, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
  .line 438
    invoke-virtual { v5 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v5
    invoke-virtual { v5 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v5
  .line 437
    const v6, 2131230831
    invoke-static { v5, v6, v4 }, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    move-result-object v4
  :L5
  .line 439
    const/4 v5, 0
    if-nez v4, :L6
    monitor-exit v0
    return-object v5
  :L6
  .line 440
    invoke-virtual { v4 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v6
  .line 441
    invoke-virtual { v4 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v7
  .line 442
    if-gt v6, v7, :L7
    move v8, v6
    goto :L8
  :L7
    move v8, v7
  :L8
  .line 443
    const/4 v9, 2
    if-eqz v1, :L9
    goto :L10
  :L9
    const/4 v2, 2
  :L10
  .line 444
    mul-int/lit8 v1, v2, 2
    add-int/2addr v1, v8
    add-int v10, v8, v2
    sget-object v11, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v1, v10, v11 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 445
    new-instance v11, Landroid/graphics/Paint;
    invoke-direct { v11, v9 }, Landroid/graphics/Paint;-><init>(I)V
  .line 446
    sub-int/2addr v6, v8
    div-int/2addr v6, v9
  .line 447
    sub-int/2addr v7, v8
    div-int/2addr v7, v9
  .line 448
    new-instance v9, Landroid/graphics/Canvas;
    invoke-direct { v9, v1 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
    new-instance v12, Landroid/graphics/Rect;
    add-int v13, v6, v8
    add-int/2addr v8, v7
    invoke-direct { v12, v6, v7, v13, v8 }, Landroid/graphics/Rect;-><init>(IIII)V
    new-instance v6, Landroid/graphics/Rect;
    invoke-direct { v6, v2, v2, v10, v10 }, Landroid/graphics/Rect;-><init>(IIII)V
    invoke-virtual { v9, v4, v12, v6, v11 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 450
    invoke-virtual { v4 }, Landroid/graphics/Bitmap;->recycle()V
  .line 451
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v4
  .line 452
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v6
  .line 453
    div-int/lit8 v7, v6, 2
    add-int/2addr v7, v6
    sget-object v8, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v4, v7, v8 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v7
  .line 454
    new-instance v8, Landroid/graphics/Canvas;
    invoke-direct { v8, v7 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 455
    const/4 v9, 0
    invoke-virtual { v8, v1, v9, v9, v5 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
  .line 456
    invoke-static { v8, v1, v4, v6, v2 }, Lcom/innioasis/ipp/Cover;->mirror(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;III)V
  .line 457
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->recycle()V
  .line 458
    sput-object v7, Lcom/innioasis/ipp/Cover;->blankPic:Landroid/graphics/Bitmap;
  .line 459
    sput v3, Lcom/innioasis/ipp/Cover;->blankLook:I
  :L11
  .line 460
    monitor-exit v0
    return-object v7
  :L12
  .line 431
    move-exception v1
    monitor-exit v0
    throw v1
.end method

.method private static box(Lcom/innioasis/y1/view/ReflectImageView;Landroid/view/ViewGroup$MarginLayoutParams;IIII)V
  .registers 7
  .line 269
    if-lez p2, :L2
    if-lez p3, :L2
    if-ltz p4, :L2
    if-gez p5, :L0
    goto :L2
  :L0
  .line 271
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
  .line 272
    iput p2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
  .line 273
    iput p3, p1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
  .line 274
    iput p4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
  .line 275
    iput p5, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
  .line 277
    invoke-virtual { p1, p5 }, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V
  .line 278
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/view/ReflectImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 279
    return-void
  :L2
  .line 269
    return-void
.end method

.method private static capture(Landroid/view/ViewGroup$MarginLayoutParams;)V
  .registers 2
  .line 261
    sget v0, Lcom/innioasis/ipp/Cover;->boxW:I
    if-gtz v0, :L0
    if-eqz p0, :L0
    iget v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
    if-lez v0, :L0
  .line 262
    iget v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
    sput v0, Lcom/innioasis/ipp/Cover;->boxW:I
  .line 263
    iget p0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
    sput p0, Lcom/innioasis/ipp/Cover;->boxH:I
  :L0
  .line 265
    return-void
.end method

.method public static declared-synchronized fitCover(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L18
  .catchall { :L2 .. :L9 } :L16
  .catchall { :L11 .. :L14 } :L16
  .registers 9
    const-class v0, Lcom/innioasis/ipp/Cover;
    monitor-enter v0
  .line 543
    if-nez p0, :L0
  .line 544
    monitor-exit v0
    const/4 p0, 0
    return-object p0
  :L0
  .line 546
    invoke-static { }, Lcom/innioasis/ipp/Cover;->flatCover()Z
    move-result v1
  .line 547
    invoke-static { p0 }, Lcom/innioasis/ipp/Cover;->fitMemo(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object v2
  :L1
  .line 548
    if-eqz v2, :L2
  .line 549
    monitor-exit v0
    return-object v2
  :L2
  .line 552
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v2
  .line 553
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v3
  .line 554
    if-lez v2, :L15
    if-lez v3, :L15
  .line 555
    if-gt v2, v3, :L3
    move v4, v2
    goto :L4
  :L3
    move v4, v3
  :L4
  .line 556
    const/16 v5, 320
    if-le v4, v5, :L5
    goto :L6
  :L5
    move v5, v4
  :L6
  .line 557
    if-ne v2, v3, :L10
    if-ne v3, v5, :L10
  .line 559
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
  .line 561
    sub-int/2addr v2, v4
  :L11
    div-int/lit8 v2, v2, 2
  .line 562
    sub-int/2addr v3, v4
    div-int/lit8 v3, v3, 2
  .line 563
    new-instance v6, Landroid/graphics/Rect;
    add-int v7, v2, v4
    add-int/2addr v4, v3
    invoke-direct { v6, v2, v3, v7, v4 }, Landroid/graphics/Rect;-><init>(IIII)V
  .line 564
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v5, v5, v2 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v2
  .line 565
    new-instance v3, Landroid/graphics/Canvas;
    invoke-direct { v3, v2 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 566
    new-instance v4, Landroid/graphics/Rect;
    const/4 v7, 0
    invoke-direct { v4, v7, v7, v5, v5 }, Landroid/graphics/Rect;-><init>(IIII)V
  .line 567
    new-instance v5, Landroid/graphics/Paint;
    invoke-direct { v5 }, Landroid/graphics/Paint;-><init>()V
  .line 568
    const/4 v7, 1
    invoke-virtual { v5, v7 }, Landroid/graphics/Paint;->setFilterBitmap(Z)V
  .line 569
    invoke-virtual { v5, v7 }, Landroid/graphics/Paint;->setAntiAlias(Z)V
  .line 570
    invoke-virtual { v3, p0, v6, v4, v5 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 571
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
  .line 574
    goto :L17
  :L16
  .line 573
    move-exception v1
  :L17
  .line 575
    monitor-exit v0
    return-object p0
  :L18
  .line 542
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

.method private static give(Landroid/graphics/Bitmap;)V
  .registers 3
  .line 101
    if-eqz p0, :L4
    sget-object v0, Lcom/innioasis/ipp/Cover;->spare:Landroid/graphics/Bitmap;
    if-eq p0, v0, :L4
    sget-object v1, Lcom/innioasis/ipp/Cover;->spare2:Landroid/graphics/Bitmap;
    if-ne p0, v1, :L0
    goto :L4
  :L0
  .line 102
    if-nez v0, :L1
    sput-object p0, Lcom/innioasis/ipp/Cover;->spare:Landroid/graphics/Bitmap;
    goto :L3
  :L1
  .line 103
    if-nez v1, :L2
    sput-object p0, Lcom/innioasis/ipp/Cover;->spare2:Landroid/graphics/Bitmap;
    goto :L3
  :L2
  .line 104
    sput-object p0, Lcom/innioasis/ipp/Cover;->spare:Landroid/graphics/Bitmap;
  :L3
  .line 105
    return-void
  :L4
  .line 101
    return-void
.end method

.method public static declared-synchronized hold(Landroid/graphics/Bitmap;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 4
    const-class v0, Lcom/innioasis/ipp/Cover;
    monitor-enter v0
  :L0
  .line 124
    sput-object p0, Lcom/innioasis/ipp/Cover;->held:Landroid/graphics/Bitmap;
  .line 125
    sget-object v1, Lcom/innioasis/ipp/Cover;->spare:Landroid/graphics/Bitmap;
    const/4 v2, 0
    if-ne v1, p0, :L1
    sput-object v2, Lcom/innioasis/ipp/Cover;->spare:Landroid/graphics/Bitmap;
  :L1
  .line 126
    sget-object v1, Lcom/innioasis/ipp/Cover;->spare2:Landroid/graphics/Bitmap;
    if-ne v1, p0, :L2
    sput-object v2, Lcom/innioasis/ipp/Cover;->spare2:Landroid/graphics/Bitmap;
  :L2
  .line 127
    monitor-exit v0
    return-void
  :L3
  .line 123
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method private static inset(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;II)I
  .catchall { :L0 .. :L1 } :L3
  .registers 6
  .line 360
    const/4 v0, 0
  :L0
    iget-object v1, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->musicInfoLl:Landroidx/constraintlayout/widget/ConstraintLayout;
  .line 361
    invoke-virtual { v1 }, Landroidx/constraintlayout/widget/ConstraintLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v1
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 362
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
    invoke-virtual { p0 }, Lcom/innioasis/y1/view/ReflectImageView;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object p0
    iget p0, p0, Landroid/util/DisplayMetrics;->widthPixels:I
  .line 363
    iget v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I
    sub-int/2addr p0, v2
    iget v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
  :L1
    sub-int/2addr p0, v1
  .line 364
    sub-int/2addr p0, p2
    sub-int/2addr p0, p2
  .line 366
    sub-int/2addr p1, p0
  .line 367
    if-lez p1, :L2
    move v0, p1
  :L2
    return v0
  :L3
  .line 368
    move-exception p0
  .line 369
    return v0
.end method

.method public static instantBlank(Lcom/innioasis/y1/base/BasePlayerActivity;Ljava/lang/String;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 3
  .line 469
    if-eqz p0, :L7
    if-nez p1, :L0
    goto :L7
  :L0
  .line 470
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->knownNone(Ljava/lang/String;)Z
    move-result p1
    if-nez p1, :L1
    return-void
  :L1
  .line 471
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;
  .line 472
    if-nez p0, :L2
    return-void
  :L2
  .line 473
    iget-object p1, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
    if-eqz p1, :L3
    iget-object p1, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
    const/16 v0, 8
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/view/ReflectImageView;->setVisibility(I)V
  :L3
  .line 474
    iget-object p1, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg2:Lcom/innioasis/y1/view/ReflectImageView;
    if-eqz p1, :L4
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg2:Lcom/innioasis/y1/view/ReflectImageView;
    const/4 p1, 0
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/view/ReflectImageView;->setVisibility(I)V
  :L4
  .line 477
    goto :L6
  :L5
  .line 475
    move-exception p0
  :L6
  .line 478
    return-void
  :L7
  .line 469
    return-void
.end method

.method public static instantCover(Lcom/innioasis/y1/base/BasePlayerActivity;Ljava/lang/String;)V
  .catchall { :L1 .. :L2 } :L3
  .registers 4
  .line 680
    invoke-static { p0 }, Lcom/innioasis/ipp/Cover;->blank(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .line 681
    invoke-static { p1 }, Lcom/innioasis/ipp/Cover;->bigCoverCached(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 682
    if-nez v0, :L0
  .line 683
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Cover;->instantBlank(Lcom/innioasis/y1/base/BasePlayerActivity;Ljava/lang/String;)V
  .line 684
    return-void
  :L0
  .line 686
    invoke-static { v0 }, Lcom/innioasis/ipp/Cover;->fitCover(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object p1
  .line 687
    if-nez p1, :L1
  .line 688
    return-void
  :L1
  .line 691
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;
  .line 692
    iget-object v1, v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
  .line 693
    invoke-virtual { v1, p1 }, Lcom/innioasis/y1/view/ReflectImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 694
    const/4 p1, 0
    invoke-virtual { v1, p1 }, Lcom/innioasis/y1/view/ReflectImageView;->setVisibility(I)V
  .line 695
    iget-object p1, v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg2:Lcom/innioasis/y1/view/ReflectImageView;
    const/16 v0, 8
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/view/ReflectImageView;->setVisibility(I)V
  .line 696
    invoke-static { p0 }, Lcom/innioasis/ipp/Cover;->tilt(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  :L2
  .line 698
    goto :L4
  :L3
  .line 697
    move-exception p0
  :L4
  .line 699
    return-void
.end method

.method private static keepSrcs(Landroid/content/res/Resources;)V
  .catchall { :L1 .. :L2 } :L3
  .registers 5
  .line 420
    sget-object v0, Lcom/innioasis/ipp/Cover;->PLAYER_SRCS:[I
    array-length v0, v0
    new-array v1, v0, [Ljava/lang/Object;
  .line 421
    const/4 v2, 0
  :L0
    if-ge v2, v0, :L5
  :L1
  .line 423
    sget-object v3, Lcom/innioasis/ipp/Cover;->PLAYER_SRCS:[I
    aget v3, v3, v2
    invoke-virtual { p0, v3 }, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;
    move-result-object v3
    aput-object v3, v1, v2
  :L2
  .line 425
    goto :L4
  :L3
  .line 424
    move-exception v3
  :L4
  .line 421
    add-int/lit8 v2, v2, 1
    goto :L0
  :L5
  .line 427
    sput-object v1, Lcom/innioasis/ipp/Cover;->srcKeep:[Ljava/lang/Object;
  .line 428
    return-void
.end method

.method private static leftOf(Landroid/view/ViewGroup$MarginLayoutParams;)I
  .registers 2
  .line 283
    invoke-virtual { p0 }, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginStart()I
    move-result v0
  .line 284
    if-lez v0, :L0
    goto :L1
  :L0
    iget v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
  :L1
    return v0
.end method

.method private static mapX(Landroid/graphics/Matrix;FF)F
  .registers 5
  .line 314
    const/4 v0, 2
    new-array v0, v0, [F
    const/4 v1, 0
    aput p1, v0, v1
    const/4 p1, 1
    aput p2, v0, p1
  .line 315
    invoke-virtual { p0, v0 }, Landroid/graphics/Matrix;->mapPoints([F)V
  .line 316
    aget p0, v0, v1
    return p0
.end method

.method private static mirror(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;III)V
  .registers 26
  .line 182
    move/from16 v0, p2
    move/from16 v1, p3
    move/from16 v9, p4
    div-int/lit8 v10, v1, 2
  .line 183
    const/16 v2, 150
    if-le v0, v2, :L0
    const/high16 v2, 0x43160000
    int-to-float v3, v0
    div-float/2addr v2, v3
    goto :L1
  :L0
    const/high16 v2, 0x3F800000
  :L1
  .line 184
    new-instance v7, Landroid/graphics/Matrix;
    invoke-direct { v7 }, Landroid/graphics/Matrix;-><init>()V
  .line 185
    neg-float v3, v2
    invoke-virtual { v7, v2, v3 }, Landroid/graphics/Matrix;->preScale(FF)Z
  .line 186
    mul-int/lit8 v2, v9, 2
    sub-int v5, v0, v2
    const/4 v8, 1
    move-object/from16 v2, p1
    move/from16 v3, p4
    move v4, v10
    move v6, v10
    invoke-static/range { v2 .. v8 }, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;
    move-result-object v2
  .line 187
    new-instance v3, Landroid/graphics/Paint;
    invoke-direct { v3 }, Landroid/graphics/Paint;-><init>()V
  .line 188
    const/4 v4, 1
    invoke-virtual { v3, v4 }, Landroid/graphics/Paint;->setFilterBitmap(Z)V
  .line 189
    invoke-virtual { v3, v4 }, Landroid/graphics/Paint;->setAntiAlias(Z)V
  .line 190
    new-instance v4, Landroid/graphics/Rect;
    sub-int v5, v0, v9
    add-int v6, v1, v10
    invoke-direct { v4, v9, v1, v5, v6 }, Landroid/graphics/Rect;-><init>(IIII)V
    const/4 v5, 0
    move-object/from16 v7, p0
    invoke-virtual { v7, v2, v5, v4, v3 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 193
    new-instance v12, Landroid/graphics/Paint;
    invoke-direct { v12 }, Landroid/graphics/Paint;-><init>()V
  .line 194
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
  .line 196
    new-instance v1, Landroid/graphics/PorterDuffXfermode;
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->DST_IN:Landroid/graphics/PorterDuff$Mode;
    invoke-direct { v1, v2 }, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V
    invoke-virtual { v12, v1 }, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;
  .line 197
    const/4 v8, 0
    int-to-float v10, v0
    invoke-virtual/range { v7 .. v12 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 198
    return-void
.end method

.method public static preview(Lcom/innioasis/y1/base/BasePlayerActivity;Landroid/graphics/Bitmap;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 6
  :L0
  .line 662
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;
  .line 663
    invoke-static { p0 }, Lcom/innioasis/ipp/Cover;->blank(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .line 664
    if-nez p1, :L1
    const/4 p1, 0
    goto :L2
  :L1
    invoke-static { p1 }, Lcom/innioasis/ipp/Cover;->fitCover(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object p1
  :L2
  .line 665
    const/4 v1, 0
    const/16 v2, 8
    if-nez p1, :L3
  .line 666
    iget-object p0, v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
    invoke-virtual { p0, v2 }, Lcom/innioasis/y1/view/ReflectImageView;->setVisibility(I)V
  .line 667
    iget-object p0, v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg2:Lcom/innioasis/y1/view/ReflectImageView;
    invoke-virtual { p0, v1 }, Lcom/innioasis/y1/view/ReflectImageView;->setVisibility(I)V
  .line 668
    return-void
  :L3
  .line 670
    iget-object v3, v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
    invoke-virtual { v3, p1 }, Lcom/innioasis/y1/view/ReflectImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 671
    iget-object p1, v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
    invoke-virtual { p1, v1 }, Lcom/innioasis/y1/view/ReflectImageView;->setVisibility(I)V
  .line 672
    iget-object p1, v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg2:Lcom/innioasis/y1/view/ReflectImageView;
    invoke-virtual { p1, v2 }, Lcom/innioasis/y1/view/ReflectImageView;->setVisibility(I)V
  .line 673
    invoke-static { p0 }, Lcom/innioasis/ipp/Cover;->tilt(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  :L4
  .line 675
    goto :L6
  :L5
  .line 674
    move-exception p0
  :L6
  .line 676
    return-void
.end method

.method public static reflCache()Landroid/graphics/Bitmap;
  .registers 3
  .line 487
    sget-object v0, Lcom/innioasis/ipp/Cover;->reflCache:Landroid/graphics/Bitmap;
  .line 488
    const/4 v1, 0
    if-nez v0, :L0
  .line 489
    return-object v1
  :L0
  .line 491
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v2
    if-eqz v2, :L1
  .line 492
    nop
  .line 493
    sput-object v1, Lcom/innioasis/ipp/Cover;->reflCache:Landroid/graphics/Bitmap;
    move-object v0, v1
  :L1
  .line 495
    return-object v0
.end method

.method public static declared-synchronized reflect(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L14
  .catchall { :L2 .. :L4 } :L14
  .catchall { :L6 .. :L12 } :L14
  .registers 9
    const-class v0, Lcom/innioasis/ipp/Cover;
    monitor-enter v0
  .line 146
    const/4 v1, 0
    if-nez p0, :L0
    monitor-exit v0
    return-object v1
  :L0
  .line 147
    invoke-static { }, Lcom/innioasis/ipp/Cover;->flatCover()Z
  .line 148
    sget-object v2, Lcom/innioasis/ipp/Cover;->reflIn:Ljava/lang/ref/WeakReference;
    if-eqz v2, :L2
    sget-object v3, Lcom/innioasis/ipp/Cover;->reflOut:Landroid/graphics/Bitmap;
    if-eqz v3, :L2
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
    if-ne v2, p0, :L2
    sget v2, Lcom/innioasis/ipp/Cover;->reflGen:I
  .line 149
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getGenerationId()I
    move-result v3
    if-ne v2, v3, :L2
    sget-object v2, Lcom/innioasis/ipp/Cover;->reflOut:Landroid/graphics/Bitmap;
    invoke-virtual { v2 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v2
    if-nez v2, :L2
  .line 150
    sget-object p0, Lcom/innioasis/ipp/Cover;->reflOut:Landroid/graphics/Bitmap;
  :L1
    monitor-exit v0
    return-object p0
  :L2
  .line 152
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v2
  .line 153
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v3
  .line 154
    if-lez v2, :L13
    if-gtz v3, :L3
    goto :L13
  :L3
  .line 155
    div-int/lit8 v4, v3, 2
  :L4
  .line 156
    if-gtz v4, :L5
    monitor-exit v0
    return-object v1
  :L5
  .line 160
    add-int/2addr v4, v3
  :L6
    invoke-static { v2, v4 }, Lcom/innioasis/ipp/Cover;->take(II)Landroid/graphics/Bitmap;
    move-result-object v5
  .line 161
    const/4 v6, 0
    if-eqz v5, :L7
  .line 162
    invoke-virtual { v5, v6 }, Landroid/graphics/Bitmap;->eraseColor(I)V
    goto :L8
  :L7
  .line 164
    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v2, v4, v5 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v5
  :L8
  .line 166
    new-instance v4, Landroid/graphics/Canvas;
    invoke-direct { v4, v5 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 167
    const/4 v7, 0
    invoke-virtual { v4, p0, v7, v7, v1 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
  .line 168
    invoke-static { }, Lcom/innioasis/ipp/Cover;->flatCover()Z
    move-result v7
    if-eqz v7, :L9
    goto :L10
  :L9
    const/4 v6, 2
  :L10
    invoke-static { v4, p0, v2, v3, v6 }, Lcom/innioasis/ipp/Cover;->mirror(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;III)V
  .line 170
    sget-object v2, Lcom/innioasis/ipp/Cover;->reflOut:Landroid/graphics/Bitmap;
    sget-object v3, Lcom/innioasis/ipp/Cover;->held:Landroid/graphics/Bitmap;
    if-eq v2, v3, :L11
    invoke-static { v2 }, Lcom/innioasis/ipp/Cover;->give(Landroid/graphics/Bitmap;)V
  :L11
  .line 171
    new-instance v2, Ljava/lang/ref/WeakReference;
    invoke-direct { v2, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v2, Lcom/innioasis/ipp/Cover;->reflIn:Ljava/lang/ref/WeakReference;
  .line 172
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getGenerationId()I
    move-result p0
    sput p0, Lcom/innioasis/ipp/Cover;->reflGen:I
  .line 173
    sput-object v5, Lcom/innioasis/ipp/Cover;->reflOut:Landroid/graphics/Bitmap;
  :L12
  .line 174
    monitor-exit v0
    return-object v5
  :L13
  .line 154
    monitor-exit v0
    return-object v1
  :L14
  .line 175
    move-exception p0
  .line 176
    monitor-exit v0
    return-object v1
.end method

.method public static declared-synchronized release(Landroid/graphics/Bitmap;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 4
    const-class v0, Lcom/innioasis/ipp/Cover;
    monitor-enter v0
  .line 131
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
  .line 132
    sget-object v1, Lcom/innioasis/ipp/Cover;->held:Landroid/graphics/Bitmap;
    const/4 v2, 0
    if-ne v1, p0, :L2
    sput-object v2, Lcom/innioasis/ipp/Cover;->held:Landroid/graphics/Bitmap;
  :L2
  .line 133
    sget-object v1, Lcom/innioasis/ipp/Cover;->reflOut:Landroid/graphics/Bitmap;
    if-ne v1, p0, :L3
  .line 134
    sput-object v2, Lcom/innioasis/ipp/Cover;->reflOut:Landroid/graphics/Bitmap;
  .line 135
    sput-object v2, Lcom/innioasis/ipp/Cover;->reflIn:Ljava/lang/ref/WeakReference;
  :L3
  .line 137
    invoke-static { p0 }, Lcom/innioasis/ipp/Cover;->give(Landroid/graphics/Bitmap;)V
  :L4
  .line 138
    monitor-exit v0
    return-void
  :L5
  .line 130
    move-exception p0
    monitor-exit v0
    throw p0
  :L6
  .line 131
    monitor-exit v0
    return-void
.end method

.method private static rowsHeight(Landroid/view/ViewGroup;)I
  .registers 7
  .line 339
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getHeight()I
    move-result v0
  .line 340
    if-lez v0, :L0
    return v0
  :L0
  .line 341
    nop
  .line 342
    const/4 v0, 0
    const/4 v1, 0
    const/4 v2, 0
  :L1
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v3
    if-ge v1, v3, :L6
  .line 343
    invoke-virtual { p0, v1 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v3
  .line 344
    if-eqz v3, :L5
    invoke-virtual { v3 }, Landroid/view/View;->getVisibility()I
    move-result v4
    const/16 v5, 8
    if-ne v4, v5, :L2
    goto :L5
  :L2
  .line 345
    invoke-virtual { v3 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v3
  .line 346
    instance-of v4, v3, Landroid/view/ViewGroup$MarginLayoutParams;
    if-nez v4, :L3
    return v0
  :L3
  .line 347
    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 348
    iget v4, v3, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
    if-gtz v4, :L4
    return v0
  :L4
  .line 349
    iget v4, v3, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
    iget v3, v3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    add-int/2addr v4, v3
    add-int/2addr v2, v4
  :L5
  .line 342
    add-int/lit8 v1, v1, 1
    goto :L1
  :L6
  .line 351
    return v2
.end method

.method public static setReflCache(Landroid/graphics/Bitmap;)V
  .registers 1
  .line 499
    sput-object p0, Lcom/innioasis/ipp/Cover;->reflCache:Landroid/graphics/Bitmap;
  .line 500
    return-void
.end method

.method private static shape(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;Lcom/innioasis/y1/view/ReflectImageView;Landroid/view/ViewGroup$MarginLayoutParams;I)V
  .catchall { :L0 .. :L5 } :L7
  .registers 14
  :L0
  .line 225
    sget v0, Lcom/innioasis/ipp/Cover;->boxW:I
    if-lez v0, :L6
    sget v0, Lcom/innioasis/ipp/Cover;->boxH:I
    if-gtz v0, :L1
    goto/16 :L6
  :L1
  .line 226
    invoke-static { }, Lcom/innioasis/ipp/Cover;->flatCover()Z
    move-result v0
  .line 227
    sget v1, Lcom/innioasis/ipp/Cover;->boxW:I
    invoke-static { p0, v1, p3 }, Lcom/innioasis/ipp/Cover;->inset(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;II)I
    move-result v2
    sub-int/2addr v1, v2
  .line 228
    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_START:Landroid/widget/ImageView$ScaleType;
    invoke-virtual { p1, v2 }, Lcom/innioasis/y1/view/ReflectImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
  .line 230
    const/4 v2, 0
    const/4 v3, 0
    if-eqz v0, :L2
  .line 231
    invoke-virtual { p1, v2 }, Lcom/innioasis/y1/view/ReflectImageView;->setRotationY(F)V
  .line 232
    sget v0, Lcom/innioasis/ipp/Cover;->boxW:I
    sub-int/2addr v0, v1
    invoke-virtual { p1, v3, v3, v0, v3 }, Lcom/innioasis/y1/view/ReflectImageView;->setPadding(IIII)V
  .line 233
    sget v6, Lcom/innioasis/ipp/Cover;->boxW:I
    sget v7, Lcom/innioasis/ipp/Cover;->boxH:I
    invoke-static { p0, p2, v1 }, Lcom/innioasis/ipp/Cover;->topFor(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;Landroid/view/ViewGroup$MarginLayoutParams;I)I
    move-result v8
    move-object v4, p1
    move-object v5, p2
    move v9, p3
    invoke-static/range { v4 .. v9 }, Lcom/innioasis/ipp/Cover;->box(Lcom/innioasis/y1/view/ReflectImageView;Landroid/view/ViewGroup$MarginLayoutParams;IIII)V
  .line 234
    return-void
  :L2
  .line 236
    invoke-virtual { p1, v3, v3, v3, v3 }, Lcom/innioasis/y1/view/ReflectImageView;->setPadding(IIII)V
  .line 239
    invoke-virtual { p1 }, Lcom/innioasis/y1/view/ReflectImageView;->getHeight()I
    move-result v0
    int-to-float v0, v0
  .line 240
    cmpg-float v3, v0, v2
    if-gtz v3, :L3
    iget v0, p2, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
    int-to-float v0, v0
  :L3
  .line 241
    invoke-virtual { p1, v2 }, Lcom/innioasis/y1/view/ReflectImageView;->setPivotX(F)V
  .line 242
    const/high16 v3, 0x40400000
    cmpl-float v2, v0, v2
    if-lez v2, :L4
    div-float/2addr v0, v3
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/view/ReflectImageView;->setPivotY(F)V
  :L4
  .line 243
    const/high16 v0, 0x41A00000
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/view/ReflectImageView;->setRotationY(F)V
  .line 247
    invoke-static { p1, v1 }, Lcom/innioasis/ipp/Cover;->tiltWidth(Lcom/innioasis/y1/view/ReflectImageView;I)I
    move-result v6
  .line 248
    int-to-float v0, v6
    sget v1, Lcom/innioasis/ipp/Cover;->boxH:I
    int-to-float v1, v1
    mul-float v0, v0, v1
    sget v1, Lcom/innioasis/ipp/Cover;->boxW:I
    int-to-float v1, v1
    div-float/2addr v0, v1
    invoke-static { v0 }, Ljava/lang/Math;->round(F)I
    move-result v0
  .line 249
    invoke-static { p0, p2, v6 }, Lcom/innioasis/ipp/Cover;->topFor(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;Landroid/view/ViewGroup$MarginLayoutParams;I)I
    move-result v8
    move-object v4, p1
    move-object v5, p2
    move v7, v0
    move v9, p3
    invoke-static/range { v4 .. v9 }, Lcom/innioasis/ipp/Cover;->box(Lcom/innioasis/y1/view/ReflectImageView;Landroid/view/ViewGroup$MarginLayoutParams;IIII)V
  .line 250
    if-lez v0, :L5
    int-to-float p0, v0
    div-float/2addr p0, v3
    invoke-virtual { p1, p0 }, Lcom/innioasis/y1/view/ReflectImageView;->setPivotY(F)V
  :L5
  .line 252
    goto :L8
  :L6
  .line 225
    return-void
  :L7
  .line 251
    move-exception p0
  :L8
  .line 253
    return-void
.end method

.method private static softEdge(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L3 } :L5
  .registers 6
  .line 514
    if-nez p0, :L0
  .line 515
    const/4 p0, 0
    return-object p0
  :L0
  .line 518
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v0
  .line 519
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v1
  .line 520
    if-lez v0, :L4
    if-lez v1, :L4
  .line 521
    sget-object v2, Lcom/innioasis/ipp/Cover;->edge:Landroid/graphics/Bitmap;
  .line 522
    if-eqz v2, :L1
    invoke-virtual { v2 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v3
    if-nez v3, :L1
  .line 523
    invoke-virtual { v2 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v3
    add-int/lit8 v4, v0, 4
    if-ne v3, v4, :L1
    invoke-virtual { v2 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v3
    add-int/lit8 v4, v1, 2
    if-ne v3, v4, :L1
  .line 524
    const/4 v0, 0
    invoke-virtual { v2, v0 }, Landroid/graphics/Bitmap;->eraseColor(I)V
    goto :L2
  :L1
  .line 526
    add-int/lit8 v0, v0, 4
    add-int/lit8 v1, v1, 2
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v0, v1, v2 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v2
  .line 527
    sput-object v2, Lcom/innioasis/ipp/Cover;->edge:Landroid/graphics/Bitmap;
  :L2
  .line 529
    new-instance v0, Landroid/graphics/Canvas;
    invoke-direct { v0, v2 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 530
    new-instance v1, Landroid/graphics/Paint;
    invoke-direct { v1 }, Landroid/graphics/Paint;-><init>()V
  .line 531
    const/4 v3, 1
    invoke-virtual { v1, v3 }, Landroid/graphics/Paint;->setFilterBitmap(Z)V
  .line 532
    invoke-virtual { v1, v3 }, Landroid/graphics/Paint;->setAntiAlias(Z)V
  .line 533
    const/high16 v3, 0x40000000
    invoke-virtual { v0, p0, v3, v3, v1 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
  :L3
  .line 534
    return-object v2
  :L4
  .line 537
    goto :L6
  :L5
  .line 536
    move-exception v0
  :L6
  .line 538
    return-object p0
.end method

.method public static square(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L8 } :L10
  .registers 14
  .line 583
    if-nez p0, :L0
  .line 584
    const/4 p0, 0
    return-object p0
  :L0
  .line 587
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v0
  .line 588
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v1
  .line 589
    if-lez v0, :L9
    if-lez v1, :L9
    if-lez p1, :L9
  .line 590
    if-ne v0, p1, :L1
    if-ne v1, p1, :L1
  .line 591
    return-object p0
  :L1
  .line 593
    new-instance v2, Landroid/graphics/Paint;
    invoke-direct { v2 }, Landroid/graphics/Paint;-><init>()V
  .line 594
    const/4 v3, 1
    invoke-virtual { v2, v3 }, Landroid/graphics/Paint;->setFilterBitmap(Z)V
  .line 595
    invoke-virtual { v2, v3 }, Landroid/graphics/Paint;->setAntiAlias(Z)V
  .line 599
    nop
  .line 600
    const/4 v4, 0
    const/4 v6, 0
    move-object v5, p0
  :L2
  .line 601
    mul-int/lit8 v7, p1, 2
    if-lt v0, v7, :L5
    if-lt v1, v7, :L5
  .line 602
    div-int/lit8 v7, v0, 2
  .line 603
    div-int/lit8 v8, v1, 2
  .line 604
    if-lez v7, :L5
    if-gtz v8, :L3
    goto :L5
  :L3
  .line 605
    sget-object v9, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v7, v8, v9 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v9
  .line 606
    new-instance v10, Landroid/graphics/Canvas;
    invoke-direct { v10, v9 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 607
    new-instance v11, Landroid/graphics/Rect;
    invoke-direct { v11, v4, v4, v0, v1 }, Landroid/graphics/Rect;-><init>(IIII)V
    new-instance v0, Landroid/graphics/Rect;
    invoke-direct { v0, v4, v4, v7, v8 }, Landroid/graphics/Rect;-><init>(IIII)V
    invoke-virtual { v10, v5, v11, v0, v2 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 608
    if-eqz v6, :L4
  .line 609
    invoke-virtual { v5 }, Landroid/graphics/Bitmap;->recycle()V
  :L4
  .line 611
    nop
  .line 612
    nop
  .line 613
    nop
  .line 614
    nop
  .line 615
    move v0, v7
    move v1, v8
    move-object v5, v9
    const/4 v6, 1
    goto :L2
  :L5
  .line 617
    if-gt v0, v1, :L6
    move v3, v0
    goto :L7
  :L6
    move v3, v1
  :L7
  .line 618
    sub-int/2addr v0, v3
    div-int/lit8 v0, v0, 2
  .line 619
    sub-int/2addr v1, v3
    div-int/lit8 v1, v1, 2
  .line 620
    new-instance v7, Landroid/graphics/Rect;
    add-int v8, v0, v3
    add-int/2addr v3, v1
    invoke-direct { v7, v0, v1, v8, v3 }, Landroid/graphics/Rect;-><init>(IIII)V
  .line 621
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { p1, p1, v0 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 622
    new-instance v1, Landroid/graphics/Canvas;
    invoke-direct { v1, v0 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 623
    new-instance v3, Landroid/graphics/Rect;
    invoke-direct { v3, v4, v4, p1, p1 }, Landroid/graphics/Rect;-><init>(IIII)V
  .line 624
    invoke-virtual { v1, v5, v7, v3, v2 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 625
    if-eqz v6, :L8
  .line 626
    invoke-virtual { v5 }, Landroid/graphics/Bitmap;->recycle()V
  :L8
  .line 628
    return-object v0
  :L9
  .line 631
    goto :L11
  :L10
  .line 630
    move-exception p1
  :L11
  .line 632
    return-object p0
.end method

.method private static take(II)Landroid/graphics/Bitmap;
  .registers 5
  .line 109
    sget-object v0, Lcom/innioasis/ipp/Cover;->spare:Landroid/graphics/Bitmap;
  .line 110
    const/4 v1, 0
    if-eqz v0, :L0
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v2
    if-nez v2, :L0
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->isMutable()Z
    move-result v2
    if-eqz v2, :L0
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v2
    if-ne v2, p0, :L0
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v2
    if-ne v2, p1, :L0
  .line 111
    sput-object v1, Lcom/innioasis/ipp/Cover;->spare:Landroid/graphics/Bitmap;
  .line 112
    return-object v0
  :L0
  .line 114
    sget-object v0, Lcom/innioasis/ipp/Cover;->spare2:Landroid/graphics/Bitmap;
  .line 115
    if-eqz v0, :L1
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v2
    if-nez v2, :L1
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->isMutable()Z
    move-result v2
    if-eqz v2, :L1
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v2
    if-ne v2, p0, :L1
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result p0
    if-ne p0, p1, :L1
  .line 116
    sput-object v1, Lcom/innioasis/ipp/Cover;->spare2:Landroid/graphics/Bitmap;
  .line 117
    return-object v0
  :L1
  .line 119
    return-object v1
.end method

.method public static tilt(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 4
  .line 202
    if-nez p0, :L0
    return-void
  :L0
  .line 203
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;
  .line 204
    if-nez p0, :L1
    return-void
  :L1
  .line 206
    iget-object v0, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
  .line 207
    if-nez v0, :L2
    return-void
  :L2
  .line 208
    nop
  .line 209
    invoke-virtual { v0 }, Lcom/innioasis/y1/view/ReflectImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v1
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 210
    if-nez v1, :L3
    return-void
  :L3
  .line 211
    invoke-static { v1 }, Lcom/innioasis/ipp/Cover;->capture(Landroid/view/ViewGroup$MarginLayoutParams;)V
  .line 212
    invoke-static { v1 }, Lcom/innioasis/ipp/Cover;->leftOf(Landroid/view/ViewGroup$MarginLayoutParams;)I
    move-result v2
    invoke-static { p0, v0, v1, v2 }, Lcom/innioasis/ipp/Cover;->shape(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;Lcom/innioasis/y1/view/ReflectImageView;Landroid/view/ViewGroup$MarginLayoutParams;I)V
  :L4
  .line 214
    goto :L6
  :L5
  .line 213
    move-exception p0
  :L6
  .line 215
    return-void
.end method

.method private static tiltWidth(Lcom/innioasis/y1/view/ReflectImageView;I)I
  .catchall { :L0 .. :L11 } :L12
  .registers 9
  .line 294
    if-gtz p1, :L1
  :L0
    sget p0, Lcom/innioasis/ipp/Cover;->boxW:I
    return p0
  :L1
  .line 295
    invoke-virtual { p0 }, Lcom/innioasis/y1/view/ReflectImageView;->getMatrix()Landroid/graphics/Matrix;
    move-result-object v0
  .line 296
    if-eqz v0, :L10
    invoke-virtual { v0 }, Landroid/graphics/Matrix;->isIdentity()Z
    move-result v1
    if-eqz v1, :L2
    goto :L10
  :L2
  .line 297
    invoke-virtual { p0 }, Lcom/innioasis/y1/view/ReflectImageView;->getPivotY()F
    move-result p0
  .line 298
    int-to-float v1, p1
  .line 299
    const/high16 v2, 0x40400000
    mul-float v2, v2, v1
  .line 300
    invoke-static { v0, v2, p0 }, Lcom/innioasis/ipp/Cover;->mapX(Landroid/graphics/Matrix;FF)F
    move-result v3
    cmpg-float v3, v3, v1
    if-gez v3, :L3
    invoke-static { v2 }, Ljava/lang/Math;->round(F)I
    move-result p0
    return p0
  :L3
  .line 301
    const/4 v3, 0
    move v4, v1
  :L4
    const/16 v5, 24
    const/high16 v6, 0x3F000000
    if-ge v3, v5, :L7
  .line 302
    add-float v5, v4, v2
    mul-float v5, v5, v6
  .line 303
    invoke-static { v0, v5, p0 }, Lcom/innioasis/ipp/Cover;->mapX(Landroid/graphics/Matrix;FF)F
    move-result v6
    cmpg-float v6, v6, v1
    if-gez v6, :L5
    move v4, v5
    goto :L6
  :L5
    move v2, v5
  :L6
  .line 301
    add-int/lit8 v3, v3, 1
    goto :L4
  :L7
  .line 305
    add-float/2addr v4, v2
    mul-float v4, v4, v6
    invoke-static { v4 }, Ljava/lang/Math;->round(F)I
    move-result p0
  .line 306
    if-ge p0, p1, :L8
    goto :L9
  :L8
    move p1, p0
  :L9
    return p1
  :L10
  .line 296
    sget p0, Lcom/innioasis/ipp/Cover;->boxW:I
  :L11
    return p0
  :L12
  .line 307
    move-exception p0
  .line 308
    sget p0, Lcom/innioasis/ipp/Cover;->boxW:I
    return p0
.end method

.method private static topFor(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;Landroid/view/ViewGroup$MarginLayoutParams;I)I
  .catchall { :L0 .. :L2 } :L5
  .registers 4
  :L0
  .line 327
    iget-object v0, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->musicInfoLl:Landroidx/constraintlayout/widget/ConstraintLayout;
  .line 328
    invoke-virtual { v0 }, Landroidx/constraintlayout/widget/ConstraintLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 329
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->musicInfoLl:Landroidx/constraintlayout/widget/ConstraintLayout;
    invoke-static { p0 }, Lcom/innioasis/ipp/Cover;->rowsHeight(Landroid/view/ViewGroup;)I
    move-result p0
  .line 330
    if-gtz p0, :L1
    iget p0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    return p0
  :L1
  .line 331
    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    sub-int/2addr p0, p2
    div-int/lit8 p0, p0, 2
  :L2
    add-int/2addr v0, p0
  .line 332
    if-lez v0, :L3
    goto :L4
  :L3
    const/4 v0, 0
  :L4
    return v0
  :L5
  .line 333
    move-exception p0
  .line 334
    iget p0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    return p0
.end method
