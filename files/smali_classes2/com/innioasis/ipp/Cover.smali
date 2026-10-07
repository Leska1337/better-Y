.class public final Lcom/innioasis/ipp/Cover;
.super Ljava/lang/Object;
.source "Cover.java"

.field public final static KEY_TILT:Ljava/lang/String; = "cover_tilt"

.field private final static REFL_W:I = 150

.field private final static ROTATION:F = 20.0F

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
  .line 36
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Cover;->look:I
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 28
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static bigCover(Ljava/lang/String;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 522
    const/4 v0, 0
    if-nez p0, :L0
  .line 523
    return-object v0
  :L0
  .line 526
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->track(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object p0
  :L1
    return-object p0
  :L2
  .line 527
    move-exception p0
  .line 528
    return-object v0
.end method

.method private static bigCoverCached(Ljava/lang/String;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 534
    const/4 v0, 0
    if-nez p0, :L0
  .line 535
    return-object v0
  :L0
  .line 538
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object p0
  :L1
    return-object p0
  :L2
  .line 539
    move-exception p0
  .line 540
    return-object v0
.end method

.method private static blank(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .catchall { :L0 .. :L5 } :L9
  .registers 7
  :L0
  .line 326
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;
  .line 327
    if-nez p0, :L1
    return-void
  :L1
  .line 328
    iget-object v0, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg2:Lcom/innioasis/y1/view/ReflectImageView;
  .line 329
    if-eqz v0, :L8
    iget-object v1, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
    if-nez v1, :L2
    goto :L8
  :L2
  .line 330
    nop
  .line 331
    invoke-virtual { v0 }, Lcom/innioasis/y1/view/ReflectImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v1
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 332
    iget-object v2, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
  .line 333
    invoke-virtual { v2 }, Lcom/innioasis/y1/view/ReflectImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v2
    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 334
    if-eqz v1, :L7
    if-nez v2, :L3
    goto :L7
  :L3
  .line 335
    invoke-static { v2 }, Lcom/innioasis/ipp/Cover;->capture(Landroid/view/ViewGroup$MarginLayoutParams;)V
  .line 336
    sget v3, Lcom/innioasis/ipp/Cover;->boxW:I
    if-lez v3, :L6
    sget v3, Lcom/innioasis/ipp/Cover;->boxH:I
    if-gtz v3, :L4
    goto :L6
  :L4
  .line 338
    invoke-static { v2 }, Lcom/innioasis/ipp/Cover;->leftOf(Landroid/view/ViewGroup$MarginLayoutParams;)I
    move-result v5
  .line 339
    sget v2, Lcom/innioasis/ipp/Cover;->boxW:I
    invoke-static { p0, v2, v5 }, Lcom/innioasis/ipp/Cover;->inset(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;II)I
    move-result v3
    sub-int/2addr v2, v3
  .line 340
    sget-object v3, Landroid/widget/ImageView$ScaleType;->FIT_START:Landroid/widget/ImageView$ScaleType;
    invoke-virtual { v0, v3 }, Lcom/innioasis/y1/view/ReflectImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
  .line 341
    const/4 v3, 0
    invoke-virtual { v0, v3, v3, v3, v3 }, Lcom/innioasis/y1/view/ReflectImageView;->setPadding(IIII)V
  .line 342
    int-to-float v3, v2
    sget v4, Lcom/innioasis/ipp/Cover;->boxH:I
    int-to-float v4, v4
    mul-float v3, v3, v4
    sget v4, Lcom/innioasis/ipp/Cover;->boxW:I
    int-to-float v4, v4
    div-float/2addr v3, v4
    invoke-static { v3 }, Ljava/lang/Math;->round(F)I
    move-result v3
  .line 343
    invoke-static { p0, v1, v2 }, Lcom/innioasis/ipp/Cover;->topFor(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;Landroid/view/ViewGroup$MarginLayoutParams;I)I
    move-result v4
  .line 342
    invoke-static/range { v0 .. v5 }, Lcom/innioasis/ipp/Cover;->box(Lcom/innioasis/y1/view/ReflectImageView;Landroid/view/ViewGroup$MarginLayoutParams;IIII)V
  :L5
  .line 345
    goto :L10
  :L6
  .line 336
    return-void
  :L7
  .line 334
    return-void
  :L8
  .line 329
    return-void
  :L9
  .line 344
    move-exception p0
  :L10
  .line 346
    return-void
.end method

.method private static box(Lcom/innioasis/y1/view/ReflectImageView;Landroid/view/ViewGroup$MarginLayoutParams;IIII)V
  .registers 7
  .line 215
    if-lez p2, :L2
    if-lez p3, :L2
    if-ltz p4, :L2
    if-gez p5, :L0
    goto :L2
  :L0
  .line 217
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
  .line 218
    iput p2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
  .line 219
    iput p3, p1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
  .line 220
    iput p4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
  .line 221
    iput p5, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
  .line 223
    invoke-virtual { p1, p5 }, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V
  .line 224
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/view/ReflectImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 225
    return-void
  :L2
  .line 215
    return-void
.end method

.method private static capture(Landroid/view/ViewGroup$MarginLayoutParams;)V
  .registers 2
  .line 207
    sget v0, Lcom/innioasis/ipp/Cover;->boxW:I
    if-gtz v0, :L0
    if-eqz p0, :L0
    iget v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
    if-lez v0, :L0
  .line 208
    iget v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
    sput v0, Lcom/innioasis/ipp/Cover;->boxW:I
  .line 209
    iget p0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
    sput p0, Lcom/innioasis/ipp/Cover;->boxH:I
  :L0
  .line 211
    return-void
.end method

.method public static declared-synchronized fitCover(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L18
  .catchall { :L2 .. :L9 } :L16
  .catchall { :L11 .. :L14 } :L16
  .registers 9
    const-class v0, Lcom/innioasis/ipp/Cover;
    monitor-enter v0
  .line 428
    if-nez p0, :L0
  .line 429
    monitor-exit v0
    const/4 p0, 0
    return-object p0
  :L0
  .line 431
    invoke-static { }, Lcom/innioasis/ipp/Cover;->flatCover()Z
    move-result v1
  .line 432
    invoke-static { p0 }, Lcom/innioasis/ipp/Cover;->fitMemo(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object v2
  :L1
  .line 433
    if-eqz v2, :L2
  .line 434
    monitor-exit v0
    return-object v2
  :L2
  .line 437
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v2
  .line 438
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v3
  .line 439
    if-lez v2, :L15
    if-lez v3, :L15
  .line 440
    if-gt v2, v3, :L3
    move v4, v2
    goto :L4
  :L3
    move v4, v3
  :L4
  .line 441
    const/16 v5, 320
    if-le v4, v5, :L5
    goto :L6
  :L5
    move v5, v4
  :L6
  .line 442
    if-ne v2, v3, :L10
    if-ne v3, v5, :L10
  .line 444
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
  .line 446
    sub-int/2addr v2, v4
  :L11
    div-int/lit8 v2, v2, 2
  .line 447
    sub-int/2addr v3, v4
    div-int/lit8 v3, v3, 2
  .line 448
    new-instance v6, Landroid/graphics/Rect;
    add-int v7, v2, v4
    add-int/2addr v4, v3
    invoke-direct { v6, v2, v3, v7, v4 }, Landroid/graphics/Rect;-><init>(IIII)V
  .line 449
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v5, v5, v2 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v2
  .line 450
    new-instance v3, Landroid/graphics/Canvas;
    invoke-direct { v3, v2 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 451
    new-instance v4, Landroid/graphics/Rect;
    const/4 v7, 0
    invoke-direct { v4, v7, v7, v5, v5 }, Landroid/graphics/Rect;-><init>(IIII)V
  .line 452
    new-instance v5, Landroid/graphics/Paint;
    invoke-direct { v5 }, Landroid/graphics/Paint;-><init>()V
  .line 453
    const/4 v7, 1
    invoke-virtual { v5, v7 }, Landroid/graphics/Paint;->setFilterBitmap(Z)V
  .line 454
    invoke-virtual { v5, v7 }, Landroid/graphics/Paint;->setAntiAlias(Z)V
  .line 455
    invoke-virtual { v3, p0, v6, v4, v5 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 456
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
  .line 459
    goto :L17
  :L16
  .line 458
    move-exception v1
  :L17
  .line 460
    monitor-exit v0
    return-object p0
  :L18
  .line 427
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method private static fitMemo(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .registers 4
  .line 69
    const/4 v0, 0
    if-eqz p0, :L3
    sget-object v1, Lcom/innioasis/ipp/Cover;->fitIn:Ljava/lang/ref/WeakReference;
    if-eqz v1, :L3
    sget-object v2, Lcom/innioasis/ipp/Cover;->fitOut:Landroid/graphics/Bitmap;
    if-nez v2, :L0
    goto :L3
  :L0
  .line 70
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    if-eq v1, p0, :L1
    return-object v0
  :L1
  .line 71
    sget-object p0, Lcom/innioasis/ipp/Cover;->fitOut:Landroid/graphics/Bitmap;
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result p0
    if-eqz p0, :L2
    sput-object v0, Lcom/innioasis/ipp/Cover;->fitOut:Landroid/graphics/Bitmap;
    return-object v0
  :L2
  .line 72
    sget-object p0, Lcom/innioasis/ipp/Cover;->fitOut:Landroid/graphics/Bitmap;
    return-object p0
  :L3
  .line 69
    return-object v0
.end method

.method private static fitPut(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .registers 3
  .line 77
    if-eqz p0, :L0
    if-eqz p1, :L0
  .line 78
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Cover;->fitIn:Ljava/lang/ref/WeakReference;
  .line 79
    sput-object p1, Lcom/innioasis/ipp/Cover;->fitOut:Landroid/graphics/Bitmap;
  :L0
  .line 81
    return-object p1
.end method

.method public static flatCover()Z
  .catchall { :L0 .. :L3 } :L4
  .registers 4
  .line 45
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
  .line 46
    sget v3, Lcom/innioasis/ipp/Cover;->look:I
    if-eq v1, v3, :L3
  .line 47
    sput v1, Lcom/innioasis/ipp/Cover;->look:I
  .line 48
    const/4 v3, 0
    sput-object v3, Lcom/innioasis/ipp/Cover;->fitIn:Ljava/lang/ref/WeakReference;
  .line 49
    sput-object v3, Lcom/innioasis/ipp/Cover;->fitOut:Landroid/graphics/Bitmap;
  .line 50
    sput-object v3, Lcom/innioasis/ipp/Cover;->reflIn:Ljava/lang/ref/WeakReference;
  .line 51
    sput-object v3, Lcom/innioasis/ipp/Cover;->reflOut:Landroid/graphics/Bitmap;
  :L3
  .line 53
    xor-int/lit8 v0, v1, 1
    return v0
  :L4
  .line 54
    move-exception v1
  .line 55
    return v0
.end method

.method public static declared-synchronized hold(Landroid/graphics/Bitmap;)V
  .catchall { :L0 .. :L1 } :L2
  .registers 3
    const-class v0, Lcom/innioasis/ipp/Cover;
    monitor-enter v0
  :L0
  .line 96
    sput-object p0, Lcom/innioasis/ipp/Cover;->held:Landroid/graphics/Bitmap;
  .line 97
    sget-object v1, Lcom/innioasis/ipp/Cover;->spare:Landroid/graphics/Bitmap;
    if-ne v1, p0, :L1
    const/4 p0, 0
    sput-object p0, Lcom/innioasis/ipp/Cover;->spare:Landroid/graphics/Bitmap;
  :L1
  .line 98
    monitor-exit v0
    return-void
  :L2
  .line 95
    move-exception p0
    monitor-exit v0
    throw p0
.end method

.method private static inset(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;II)I
  .catchall { :L0 .. :L1 } :L3
  .registers 6
  .line 306
    const/4 v0, 0
  :L0
    iget-object v1, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->musicInfoLl:Landroidx/constraintlayout/widget/ConstraintLayout;
  .line 307
    invoke-virtual { v1 }, Landroidx/constraintlayout/widget/ConstraintLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v1
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 308
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
    invoke-virtual { p0 }, Lcom/innioasis/y1/view/ReflectImageView;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object p0
    iget p0, p0, Landroid/util/DisplayMetrics;->widthPixels:I
  .line 309
    iget v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I
    sub-int/2addr p0, v2
    iget v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
  :L1
    sub-int/2addr p0, v1
  .line 310
    sub-int/2addr p0, p2
    sub-int/2addr p0, p2
  .line 312
    sub-int/2addr p1, p0
  .line 313
    if-lez p1, :L2
    move v0, p1
  :L2
    return v0
  :L3
  .line 314
    move-exception p0
  .line 315
    return v0
.end method

.method public static instantBlank(Lcom/innioasis/y1/base/BasePlayerActivity;Ljava/lang/String;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 3
  .line 354
    if-eqz p0, :L7
    if-nez p1, :L0
    goto :L7
  :L0
  .line 355
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->knownNone(Ljava/lang/String;)Z
    move-result p1
    if-nez p1, :L1
    return-void
  :L1
  .line 356
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;
  .line 357
    if-nez p0, :L2
    return-void
  :L2
  .line 358
    iget-object p1, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
    if-eqz p1, :L3
    iget-object p1, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
    const/16 v0, 8
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/view/ReflectImageView;->setVisibility(I)V
  :L3
  .line 359
    iget-object p1, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg2:Lcom/innioasis/y1/view/ReflectImageView;
    if-eqz p1, :L4
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg2:Lcom/innioasis/y1/view/ReflectImageView;
    const/4 p1, 0
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/view/ReflectImageView;->setVisibility(I)V
  :L4
  .line 362
    goto :L6
  :L5
  .line 360
    move-exception p0
  :L6
  .line 363
    return-void
  :L7
  .line 354
    return-void
.end method

.method public static instantCover(Lcom/innioasis/y1/base/BasePlayerActivity;Ljava/lang/String;)V
  .catchall { :L1 .. :L2 } :L3
  .registers 4
  .line 546
    invoke-static { p0 }, Lcom/innioasis/ipp/Cover;->blank(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .line 547
    invoke-static { p1 }, Lcom/innioasis/ipp/Cover;->bigCoverCached(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 548
    if-nez v0, :L0
  .line 549
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Cover;->instantBlank(Lcom/innioasis/y1/base/BasePlayerActivity;Ljava/lang/String;)V
  .line 550
    return-void
  :L0
  .line 552
    invoke-static { v0 }, Lcom/innioasis/ipp/Cover;->fitCover(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object p1
  .line 553
    if-nez p1, :L1
  .line 554
    return-void
  :L1
  .line 557
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;
  .line 558
    iget-object v1, v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
  .line 559
    invoke-virtual { v1, p1 }, Lcom/innioasis/y1/view/ReflectImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 560
    const/4 p1, 0
    invoke-virtual { v1, p1 }, Lcom/innioasis/y1/view/ReflectImageView;->setVisibility(I)V
  .line 561
    iget-object p1, v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg2:Lcom/innioasis/y1/view/ReflectImageView;
    const/16 v0, 8
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/view/ReflectImageView;->setVisibility(I)V
  .line 562
    invoke-static { p0 }, Lcom/innioasis/ipp/Cover;->tilt(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  :L2
  .line 564
    goto :L4
  :L3
  .line 563
    move-exception p0
  :L4
  .line 565
    return-void
.end method

.method private static leftOf(Landroid/view/ViewGroup$MarginLayoutParams;)I
  .registers 2
  .line 229
    invoke-virtual { p0 }, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginStart()I
    move-result v0
  .line 230
    if-lez v0, :L0
    goto :L1
  :L0
    iget v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
  :L1
    return v0
.end method

.method private static mapX(Landroid/graphics/Matrix;FF)F
  .registers 5
  .line 260
    const/4 v0, 2
    new-array v0, v0, [F
    const/4 v1, 0
    aput p1, v0, v1
    const/4 p1, 1
    aput p2, v0, p1
  .line 261
    invoke-virtual { p0, v0 }, Landroid/graphics/Matrix;->mapPoints([F)V
  .line 262
    aget p0, v0, v1
    return p0
.end method

.method public static reflCache()Landroid/graphics/Bitmap;
  .registers 3
  .line 372
    sget-object v0, Lcom/innioasis/ipp/Cover;->reflCache:Landroid/graphics/Bitmap;
  .line 373
    const/4 v1, 0
    if-nez v0, :L0
  .line 374
    return-object v1
  :L0
  .line 376
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v2
    if-eqz v2, :L1
  .line 377
    nop
  .line 378
    sput-object v1, Lcom/innioasis/ipp/Cover;->reflCache:Landroid/graphics/Bitmap;
    move-object v0, v1
  :L1
  .line 380
    return-object v0
.end method

.method public static declared-synchronized reflect(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L13
  .catchall { :L2 .. :L4 } :L13
  .catchall { :L5 .. :L11 } :L13
  .registers 25
    move-object/from16 v0, p0
    const-class v8, Lcom/innioasis/ipp/Cover;
    monitor-enter v8
  .line 106
    const/4 v9, 0
    if-nez v0, :L0
    monitor-exit v8
    return-object v9
  :L0
  .line 107
    invoke-static { }, Lcom/innioasis/ipp/Cover;->flatCover()Z
  .line 108
    sget-object v1, Lcom/innioasis/ipp/Cover;->reflIn:Ljava/lang/ref/WeakReference;
    if-eqz v1, :L2
    sget-object v2, Lcom/innioasis/ipp/Cover;->reflOut:Landroid/graphics/Bitmap;
    if-eqz v2, :L2
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    if-ne v1, v0, :L2
    sget v1, Lcom/innioasis/ipp/Cover;->reflGen:I
  .line 109
    invoke-virtual/range { p0 .. p0 }, Landroid/graphics/Bitmap;->getGenerationId()I
    move-result v2
    if-ne v1, v2, :L2
    sget-object v1, Lcom/innioasis/ipp/Cover;->reflOut:Landroid/graphics/Bitmap;
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v1
    if-nez v1, :L2
  .line 110
    sget-object v0, Lcom/innioasis/ipp/Cover;->reflOut:Landroid/graphics/Bitmap;
  :L1
    monitor-exit v8
    return-object v0
  :L2
  .line 112
    invoke-virtual/range { p0 .. p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v10
  .line 113
    invoke-virtual/range { p0 .. p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v11
  .line 114
    if-lez v10, :L12
    if-gtz v11, :L3
    goto/16 :L12
  :L3
  .line 115
    div-int/lit8 v12, v11, 2
  :L4
  .line 116
    if-gtz v12, :L5
    monitor-exit v8
    return-object v9
  :L5
  .line 120
    sget-object v1, Lcom/innioasis/ipp/Cover;->spare:Landroid/graphics/Bitmap;
  .line 121
    sput-object v9, Lcom/innioasis/ipp/Cover;->spare:Landroid/graphics/Bitmap;
  .line 122
    const/4 v13, 0
    if-eqz v1, :L6
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v2
    if-nez v2, :L6
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->isMutable()Z
    move-result v2
    if-eqz v2, :L6
  .line 123
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v2
    if-ne v2, v10, :L6
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v2
    add-int v3, v11, v12
    if-ne v2, v3, :L6
  .line 124
    invoke-virtual { v1, v13 }, Landroid/graphics/Bitmap;->eraseColor(I)V
    move-object v14, v1
    goto :L7
  :L6
  .line 126
    add-int v1, v11, v12
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v10, v1, v2 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v1
    move-object v14, v1
  :L7
  .line 128
    new-instance v15, Landroid/graphics/Canvas;
    invoke-direct { v15, v14 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 129
    const/4 v1, 0
    invoke-virtual { v15, v0, v1, v1, v9 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
  .line 131
    const/16 v1, 150
    if-le v10, v1, :L8
    const/high16 v1, 0x43160000
    int-to-float v2, v10
    div-float/2addr v1, v2
    goto :L9
  :L8
    const/high16 v1, 0x3F800000
  :L9
  .line 132
    new-instance v6, Landroid/graphics/Matrix;
    invoke-direct { v6 }, Landroid/graphics/Matrix;-><init>()V
  .line 133
    neg-float v2, v1
    invoke-virtual { v6, v1, v2 }, Landroid/graphics/Matrix;->preScale(FF)Z
  .line 134
    const/4 v2, 0
    const/4 v7, 1
    move-object/from16 v1, p0
    move v3, v12
    move v4, v10
    move v5, v12
    invoke-static/range { v1 .. v7 }, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 135
    new-instance v2, Landroid/graphics/Paint;
    invoke-direct { v2 }, Landroid/graphics/Paint;-><init>()V
  .line 136
    const/4 v3, 1
    invoke-virtual { v2, v3 }, Landroid/graphics/Paint;->setFilterBitmap(Z)V
  .line 137
    invoke-virtual { v2, v3 }, Landroid/graphics/Paint;->setAntiAlias(Z)V
  .line 138
    new-instance v3, Landroid/graphics/Rect;
    add-int/2addr v12, v11
    invoke-direct { v3, v13, v11, v10, v12 }, Landroid/graphics/Rect;-><init>(IIII)V
    invoke-virtual { v15, v1, v9, v3, v2 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 141
    new-instance v6, Landroid/graphics/Paint;
    invoke-direct { v6 }, Landroid/graphics/Paint;-><init>()V
  .line 142
    new-instance v1, Landroid/graphics/LinearGradient;
    const/16 v17, 0
    int-to-float v3, v11
    const/16 v19, 0
    int-to-float v5, v12
    const v21, 1895825407
    const v22, 16777215
    sget-object v23, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;
    move-object/from16 v16, v1
    move/from16 v18, v3
    move/from16 v20, v5
    invoke-direct/range { v16 .. v23 }, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V
    invoke-virtual { v6, v1 }, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;
  .line 144
    new-instance v1, Landroid/graphics/PorterDuffXfermode;
    sget-object v2, Landroid/graphics/PorterDuff$Mode;->DST_IN:Landroid/graphics/PorterDuff$Mode;
    invoke-direct { v1, v2 }, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V
    invoke-virtual { v6, v1 }, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;
  .line 145
    const/4 v2, 0
    int-to-float v4, v10
    move-object v1, v15
    invoke-virtual/range { v1 .. v6 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 147
    sget-object v1, Lcom/innioasis/ipp/Cover;->reflOut:Landroid/graphics/Bitmap;
    sget-object v2, Lcom/innioasis/ipp/Cover;->held:Landroid/graphics/Bitmap;
    if-eq v1, v2, :L10
    sput-object v1, Lcom/innioasis/ipp/Cover;->spare:Landroid/graphics/Bitmap;
  :L10
  .line 148
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, v0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v1, Lcom/innioasis/ipp/Cover;->reflIn:Ljava/lang/ref/WeakReference;
  .line 149
    invoke-virtual/range { p0 .. p0 }, Landroid/graphics/Bitmap;->getGenerationId()I
    move-result v0
    sput v0, Lcom/innioasis/ipp/Cover;->reflGen:I
  .line 150
    sput-object v14, Lcom/innioasis/ipp/Cover;->reflOut:Landroid/graphics/Bitmap;
  :L11
  .line 151
    monitor-exit v8
    return-object v14
  :L12
  .line 114
    monitor-exit v8
    return-object v9
  :L13
  .line 152
    move-exception v0
  .line 153
    monitor-exit v8
    return-object v9
.end method

.method private static rowsHeight(Landroid/view/ViewGroup;)I
  .registers 7
  .line 285
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getHeight()I
    move-result v0
  .line 286
    if-lez v0, :L0
    return v0
  :L0
  .line 287
    nop
  .line 288
    const/4 v0, 0
    const/4 v1, 0
    const/4 v2, 0
  :L1
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v3
    if-ge v1, v3, :L6
  .line 289
    invoke-virtual { p0, v1 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v3
  .line 290
    if-eqz v3, :L5
    invoke-virtual { v3 }, Landroid/view/View;->getVisibility()I
    move-result v4
    const/16 v5, 8
    if-ne v4, v5, :L2
    goto :L5
  :L2
  .line 291
    invoke-virtual { v3 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v3
  .line 292
    instance-of v4, v3, Landroid/view/ViewGroup$MarginLayoutParams;
    if-nez v4, :L3
    return v0
  :L3
  .line 293
    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 294
    iget v4, v3, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
    if-gtz v4, :L4
    return v0
  :L4
  .line 295
    iget v4, v3, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
    iget v3, v3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    add-int/2addr v4, v3
    add-int/2addr v2, v4
  :L5
  .line 288
    add-int/lit8 v1, v1, 1
    goto :L1
  :L6
  .line 297
    return v2
.end method

.method public static setReflCache(Landroid/graphics/Bitmap;)V
  .registers 1
  .line 384
    sput-object p0, Lcom/innioasis/ipp/Cover;->reflCache:Landroid/graphics/Bitmap;
  .line 385
    return-void
.end method

.method private static softEdge(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L3 } :L5
  .registers 6
  .line 399
    if-nez p0, :L0
  .line 400
    const/4 p0, 0
    return-object p0
  :L0
  .line 403
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v0
  .line 404
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v1
  .line 405
    if-lez v0, :L4
    if-lez v1, :L4
  .line 406
    sget-object v2, Lcom/innioasis/ipp/Cover;->edge:Landroid/graphics/Bitmap;
  .line 407
    if-eqz v2, :L1
    invoke-virtual { v2 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v3
    if-nez v3, :L1
  .line 408
    invoke-virtual { v2 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v3
    add-int/lit8 v4, v0, 4
    if-ne v3, v4, :L1
    invoke-virtual { v2 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v3
    add-int/lit8 v4, v1, 2
    if-ne v3, v4, :L1
  .line 409
    const/4 v0, 0
    invoke-virtual { v2, v0 }, Landroid/graphics/Bitmap;->eraseColor(I)V
    goto :L2
  :L1
  .line 411
    add-int/lit8 v0, v0, 4
    add-int/lit8 v1, v1, 2
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v0, v1, v2 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v2
  .line 412
    sput-object v2, Lcom/innioasis/ipp/Cover;->edge:Landroid/graphics/Bitmap;
  :L2
  .line 414
    new-instance v0, Landroid/graphics/Canvas;
    invoke-direct { v0, v2 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 415
    new-instance v1, Landroid/graphics/Paint;
    invoke-direct { v1 }, Landroid/graphics/Paint;-><init>()V
  .line 416
    const/4 v3, 1
    invoke-virtual { v1, v3 }, Landroid/graphics/Paint;->setFilterBitmap(Z)V
  .line 417
    invoke-virtual { v1, v3 }, Landroid/graphics/Paint;->setAntiAlias(Z)V
  .line 418
    const/high16 v3, 0x40000000
    invoke-virtual { v0, p0, v3, v3, v1 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
  :L3
  .line 419
    return-object v2
  :L4
  .line 422
    goto :L6
  :L5
  .line 421
    move-exception v0
  :L6
  .line 423
    return-object p0
.end method

.method public static square(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L8 } :L10
  .registers 14
  .line 468
    if-nez p0, :L0
  .line 469
    const/4 p0, 0
    return-object p0
  :L0
  .line 472
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v0
  .line 473
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v1
  .line 474
    if-lez v0, :L9
    if-lez v1, :L9
    if-lez p1, :L9
  .line 475
    if-ne v0, p1, :L1
    if-ne v1, p1, :L1
  .line 476
    return-object p0
  :L1
  .line 478
    new-instance v2, Landroid/graphics/Paint;
    invoke-direct { v2 }, Landroid/graphics/Paint;-><init>()V
  .line 479
    const/4 v3, 1
    invoke-virtual { v2, v3 }, Landroid/graphics/Paint;->setFilterBitmap(Z)V
  .line 480
    invoke-virtual { v2, v3 }, Landroid/graphics/Paint;->setAntiAlias(Z)V
  .line 484
    nop
  .line 485
    const/4 v4, 0
    const/4 v6, 0
    move-object v5, p0
  :L2
  .line 486
    mul-int/lit8 v7, p1, 2
    if-lt v0, v7, :L5
    if-lt v1, v7, :L5
  .line 487
    div-int/lit8 v7, v0, 2
  .line 488
    div-int/lit8 v8, v1, 2
  .line 489
    if-lez v7, :L5
    if-gtz v8, :L3
    goto :L5
  :L3
  .line 490
    sget-object v9, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v7, v8, v9 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v9
  .line 491
    new-instance v10, Landroid/graphics/Canvas;
    invoke-direct { v10, v9 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 492
    new-instance v11, Landroid/graphics/Rect;
    invoke-direct { v11, v4, v4, v0, v1 }, Landroid/graphics/Rect;-><init>(IIII)V
    new-instance v0, Landroid/graphics/Rect;
    invoke-direct { v0, v4, v4, v7, v8 }, Landroid/graphics/Rect;-><init>(IIII)V
    invoke-virtual { v10, v5, v11, v0, v2 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 493
    if-eqz v6, :L4
  .line 494
    invoke-virtual { v5 }, Landroid/graphics/Bitmap;->recycle()V
  :L4
  .line 496
    nop
  .line 497
    nop
  .line 498
    nop
  .line 499
    nop
  .line 500
    move v0, v7
    move v1, v8
    move-object v5, v9
    const/4 v6, 1
    goto :L2
  :L5
  .line 502
    if-gt v0, v1, :L6
    move v3, v0
    goto :L7
  :L6
    move v3, v1
  :L7
  .line 503
    sub-int/2addr v0, v3
    div-int/lit8 v0, v0, 2
  .line 504
    sub-int/2addr v1, v3
    div-int/lit8 v1, v1, 2
  .line 505
    new-instance v7, Landroid/graphics/Rect;
    add-int v8, v0, v3
    add-int/2addr v3, v1
    invoke-direct { v7, v0, v1, v8, v3 }, Landroid/graphics/Rect;-><init>(IIII)V
  .line 506
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { p1, p1, v0 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 507
    new-instance v1, Landroid/graphics/Canvas;
    invoke-direct { v1, v0 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 508
    new-instance v3, Landroid/graphics/Rect;
    invoke-direct { v3, v4, v4, p1, p1 }, Landroid/graphics/Rect;-><init>(IIII)V
  .line 509
    invoke-virtual { v1, v5, v7, v3, v2 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 510
    if-eqz v6, :L8
  .line 511
    invoke-virtual { v5 }, Landroid/graphics/Bitmap;->recycle()V
  :L8
  .line 513
    return-object v0
  :L9
  .line 516
    goto :L11
  :L10
  .line 515
    move-exception p1
  :L11
  .line 517
    return-object p0
.end method

.method public static tilt(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .catchall { :L0 .. :L7 } :L8
  .registers 10
  .line 159
    if-nez p0, :L0
    return-void
  :L0
  .line 160
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;
  .line 161
    if-nez p0, :L1
    return-void
  :L1
  .line 163
    iget-object v6, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
  .line 164
    if-nez v6, :L2
    return-void
  :L2
  .line 165
    nop
  .line 166
    invoke-virtual { v6 }, Lcom/innioasis/y1/view/ReflectImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
    move-object v1, v0
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 167
    if-nez v1, :L3
    return-void
  :L3
  .line 168
    invoke-static { v1 }, Lcom/innioasis/ipp/Cover;->capture(Landroid/view/ViewGroup$MarginLayoutParams;)V
  .line 172
    invoke-static { }, Lcom/innioasis/ipp/Cover;->flatCover()Z
    move-result v0
  .line 173
    sget v2, Lcom/innioasis/ipp/Cover;->boxW:I
    invoke-static { v1 }, Lcom/innioasis/ipp/Cover;->leftOf(Landroid/view/ViewGroup$MarginLayoutParams;)I
    move-result v3
    invoke-static { p0, v2, v3 }, Lcom/innioasis/ipp/Cover;->inset(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;II)I
    move-result v3
    sub-int/2addr v2, v3
  .line 174
    sget-object v3, Landroid/widget/ImageView$ScaleType;->FIT_START:Landroid/widget/ImageView$ScaleType;
    invoke-virtual { v6, v3 }, Lcom/innioasis/y1/view/ReflectImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
  .line 176
    const/4 v3, 0
    const/4 v4, 0
    if-eqz v0, :L4
  .line 177
    invoke-virtual { v6, v3 }, Lcom/innioasis/y1/view/ReflectImageView;->setRotationY(F)V
  .line 178
    sget v0, Lcom/innioasis/ipp/Cover;->boxW:I
    sub-int/2addr v0, v2
    invoke-virtual { v6, v4, v4, v0, v4 }, Lcom/innioasis/y1/view/ReflectImageView;->setPadding(IIII)V
  .line 179
    sget v3, Lcom/innioasis/ipp/Cover;->boxW:I
    sget v4, Lcom/innioasis/ipp/Cover;->boxH:I
    invoke-static { p0, v1, v2 }, Lcom/innioasis/ipp/Cover;->topFor(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;Landroid/view/ViewGroup$MarginLayoutParams;I)I
    move-result p0
    invoke-static { v1 }, Lcom/innioasis/ipp/Cover;->leftOf(Landroid/view/ViewGroup$MarginLayoutParams;)I
    move-result v5
    move-object v0, v6
    move v2, v3
    move v3, v4
    move v4, p0
    invoke-static/range { v0 .. v5 }, Lcom/innioasis/ipp/Cover;->box(Lcom/innioasis/y1/view/ReflectImageView;Landroid/view/ViewGroup$MarginLayoutParams;IIII)V
  .line 180
    return-void
  :L4
  .line 182
    invoke-virtual { v6, v4, v4, v4, v4 }, Lcom/innioasis/y1/view/ReflectImageView;->setPadding(IIII)V
  .line 185
    invoke-virtual { v6 }, Lcom/innioasis/y1/view/ReflectImageView;->getHeight()I
    move-result v0
    int-to-float v0, v0
  .line 186
    cmpg-float v4, v0, v3
    if-gtz v4, :L5
    iget v0, v1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
    int-to-float v0, v0
  :L5
  .line 187
    invoke-virtual { v6, v3 }, Lcom/innioasis/y1/view/ReflectImageView;->setPivotX(F)V
  .line 188
    const/high16 v7, 0x40400000
    cmpl-float v3, v0, v3
    if-lez v3, :L6
    div-float/2addr v0, v7
    invoke-virtual { v6, v0 }, Lcom/innioasis/y1/view/ReflectImageView;->setPivotY(F)V
  :L6
  .line 189
    const/high16 v0, 0x41A00000
    invoke-virtual { v6, v0 }, Lcom/innioasis/y1/view/ReflectImageView;->setRotationY(F)V
  .line 193
    invoke-static { v6, v2 }, Lcom/innioasis/ipp/Cover;->tiltWidth(Lcom/innioasis/y1/view/ReflectImageView;I)I
    move-result v2
  .line 194
    int-to-float v0, v2
    sget v3, Lcom/innioasis/ipp/Cover;->boxH:I
    int-to-float v3, v3
    mul-float v0, v0, v3
    sget v3, Lcom/innioasis/ipp/Cover;->boxW:I
    int-to-float v3, v3
    div-float/2addr v0, v3
    invoke-static { v0 }, Ljava/lang/Math;->round(F)I
    move-result v8
  .line 195
    invoke-static { p0, v1, v2 }, Lcom/innioasis/ipp/Cover;->topFor(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;Landroid/view/ViewGroup$MarginLayoutParams;I)I
    move-result v4
    invoke-static { v1 }, Lcom/innioasis/ipp/Cover;->leftOf(Landroid/view/ViewGroup$MarginLayoutParams;)I
    move-result v5
    move-object v0, v6
    move v3, v8
    invoke-static/range { v0 .. v5 }, Lcom/innioasis/ipp/Cover;->box(Lcom/innioasis/y1/view/ReflectImageView;Landroid/view/ViewGroup$MarginLayoutParams;IIII)V
  .line 196
    if-lez v8, :L7
    int-to-float p0, v8
    div-float/2addr p0, v7
    invoke-virtual { v6, p0 }, Lcom/innioasis/y1/view/ReflectImageView;->setPivotY(F)V
  :L7
  .line 198
    goto :L9
  :L8
  .line 197
    move-exception p0
  :L9
  .line 199
    return-void
.end method

.method private static tiltWidth(Lcom/innioasis/y1/view/ReflectImageView;I)I
  .catchall { :L0 .. :L11 } :L12
  .registers 9
  .line 240
    if-gtz p1, :L1
  :L0
    sget p0, Lcom/innioasis/ipp/Cover;->boxW:I
    return p0
  :L1
  .line 241
    invoke-virtual { p0 }, Lcom/innioasis/y1/view/ReflectImageView;->getMatrix()Landroid/graphics/Matrix;
    move-result-object v0
  .line 242
    if-eqz v0, :L10
    invoke-virtual { v0 }, Landroid/graphics/Matrix;->isIdentity()Z
    move-result v1
    if-eqz v1, :L2
    goto :L10
  :L2
  .line 243
    invoke-virtual { p0 }, Lcom/innioasis/y1/view/ReflectImageView;->getPivotY()F
    move-result p0
  .line 244
    int-to-float v1, p1
  .line 245
    const/high16 v2, 0x40400000
    mul-float v2, v2, v1
  .line 246
    invoke-static { v0, v2, p0 }, Lcom/innioasis/ipp/Cover;->mapX(Landroid/graphics/Matrix;FF)F
    move-result v3
    cmpg-float v3, v3, v1
    if-gez v3, :L3
    invoke-static { v2 }, Ljava/lang/Math;->round(F)I
    move-result p0
    return p0
  :L3
  .line 247
    const/4 v3, 0
    move v4, v1
  :L4
    const/16 v5, 24
    const/high16 v6, 0x3F000000
    if-ge v3, v5, :L7
  .line 248
    add-float v5, v4, v2
    mul-float v5, v5, v6
  .line 249
    invoke-static { v0, v5, p0 }, Lcom/innioasis/ipp/Cover;->mapX(Landroid/graphics/Matrix;FF)F
    move-result v6
    cmpg-float v6, v6, v1
    if-gez v6, :L5
    move v4, v5
    goto :L6
  :L5
    move v2, v5
  :L6
  .line 247
    add-int/lit8 v3, v3, 1
    goto :L4
  :L7
  .line 251
    add-float/2addr v4, v2
    mul-float v4, v4, v6
    invoke-static { v4 }, Ljava/lang/Math;->round(F)I
    move-result p0
  .line 252
    if-ge p0, p1, :L8
    goto :L9
  :L8
    move p1, p0
  :L9
    return p1
  :L10
  .line 242
    sget p0, Lcom/innioasis/ipp/Cover;->boxW:I
  :L11
    return p0
  :L12
  .line 253
    move-exception p0
  .line 254
    sget p0, Lcom/innioasis/ipp/Cover;->boxW:I
    return p0
.end method

.method private static topFor(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;Landroid/view/ViewGroup$MarginLayoutParams;I)I
  .catchall { :L0 .. :L2 } :L5
  .registers 4
  :L0
  .line 273
    iget-object v0, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->musicInfoLl:Landroidx/constraintlayout/widget/ConstraintLayout;
  .line 274
    invoke-virtual { v0 }, Landroidx/constraintlayout/widget/ConstraintLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 275
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->musicInfoLl:Landroidx/constraintlayout/widget/ConstraintLayout;
    invoke-static { p0 }, Lcom/innioasis/ipp/Cover;->rowsHeight(Landroid/view/ViewGroup;)I
    move-result p0
  .line 276
    if-gtz p0, :L1
    iget p0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    return p0
  :L1
  .line 277
    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    sub-int/2addr p0, p2
    div-int/lit8 p0, p0, 2
  :L2
    add-int/2addr v0, p0
  .line 278
    if-lez v0, :L3
    goto :L4
  :L3
    const/4 v0, 0
  :L4
    return v0
  :L5
  .line 279
    move-exception p0
  .line 280
    iget p0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    return p0
.end method
