.class public final Lcom/innioasis/ipp/Cover;
.super Ljava/lang/Object;
.source "Cover.java"

.field public final static KEY_TILT:Ljava/lang/String; = "cover_tilt"

.field private final static REFL_W:I = 150

.field private final static ROTATION:F = 20.0F

.field private static boxH:I

.field private static boxW:I

.field private static fitIn:Ljava/lang/ref/WeakReference;

.field private static fitOut:Landroid/graphics/Bitmap;

.field private static look:I

.field private static reflCache:Landroid/graphics/Bitmap;

.field private static reflIn:Ljava/lang/ref/WeakReference;

.field private static reflOut:Landroid/graphics/Bitmap;

.method static constructor <clinit>()V
  .registers 1
  .line 61
    const/4 v0, -1
    sput v0, Lcom/innioasis/ipp/Cover;->look:I
    return-void
.end method

.method public constructor <init>()V
  .registers 1
  .line 43
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static bigCover(Ljava/lang/String;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 684
    const/4 v0, 0
    if-nez p0, :L0
  .line 685
    return-object v0
  :L0
  .line 688
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->track(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object p0
  :L1
    return-object p0
  :L2
  .line 689
    move-exception p0
  .line 690
    return-object v0
.end method

.method private static bigCoverCached(Ljava/lang/String;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 700
    const/4 v0, 0
    if-nez p0, :L0
  .line 701
    return-object v0
  :L0
  .line 704
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object p0
  :L1
    return-object p0
  :L2
  .line 705
    move-exception p0
  .line 706
    return-object v0
.end method

.method private static blank(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .catchall { :L0 .. :L5 } :L9
  .registers 7
  :L0
  .line 438
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;
  .line 439
    if-nez p0, :L1
    return-void
  :L1
  .line 440
    iget-object v0, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg2:Lcom/innioasis/y1/view/ReflectImageView;
  .line 441
    if-eqz v0, :L8
    iget-object v1, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
    if-nez v1, :L2
    goto :L8
  :L2
  .line 442
    nop
  .line 443
    invoke-virtual { v0 }, Lcom/innioasis/y1/view/ReflectImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v1
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 444
    iget-object v2, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
  .line 445
    invoke-virtual { v2 }, Lcom/innioasis/y1/view/ReflectImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v2
    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 446
    if-eqz v1, :L7
    if-nez v2, :L3
    goto :L7
  :L3
  .line 447
    invoke-static { v2 }, Lcom/innioasis/ipp/Cover;->capture(Landroid/view/ViewGroup$MarginLayoutParams;)V
  .line 448
    sget v3, Lcom/innioasis/ipp/Cover;->boxW:I
    if-lez v3, :L6
    sget v3, Lcom/innioasis/ipp/Cover;->boxH:I
    if-gtz v3, :L4
    goto :L6
  :L4
  .line 450
    invoke-static { v2 }, Lcom/innioasis/ipp/Cover;->leftOf(Landroid/view/ViewGroup$MarginLayoutParams;)I
    move-result v5
  .line 451
    sget v2, Lcom/innioasis/ipp/Cover;->boxW:I
    invoke-static { p0, v2, v5 }, Lcom/innioasis/ipp/Cover;->inset(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;II)I
    move-result v3
    sub-int/2addr v2, v3
  .line 452
    sget-object v3, Landroid/widget/ImageView$ScaleType;->FIT_START:Landroid/widget/ImageView$ScaleType;
    invoke-virtual { v0, v3 }, Lcom/innioasis/y1/view/ReflectImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
  .line 453
    const/4 v3, 0
    invoke-virtual { v0, v3, v3, v3, v3 }, Lcom/innioasis/y1/view/ReflectImageView;->setPadding(IIII)V
  .line 454
    int-to-float v3, v2
    sget v4, Lcom/innioasis/ipp/Cover;->boxH:I
    int-to-float v4, v4
    mul-float v3, v3, v4
    sget v4, Lcom/innioasis/ipp/Cover;->boxW:I
    int-to-float v4, v4
    div-float/2addr v3, v4
    invoke-static { v3 }, Ljava/lang/Math;->round(F)I
    move-result v3
  .line 455
    invoke-static { p0, v1, v2 }, Lcom/innioasis/ipp/Cover;->topFor(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;Landroid/view/ViewGroup$MarginLayoutParams;I)I
    move-result v4
  .line 454
    invoke-static/range { v0 .. v5 }, Lcom/innioasis/ipp/Cover;->box(Lcom/innioasis/y1/view/ReflectImageView;Landroid/view/ViewGroup$MarginLayoutParams;IIII)V
  :L5
  .line 458
    goto :L10
  :L6
  .line 448
    return-void
  :L7
  .line 446
    return-void
  :L8
  .line 441
    return-void
  :L9
  .line 456
    move-exception p0
  :L10
  .line 459
    return-void
.end method

.method private static box(Lcom/innioasis/y1/view/ReflectImageView;Landroid/view/ViewGroup$MarginLayoutParams;IIII)V
  .registers 7
  .line 272
    if-lez p2, :L2
    if-lez p3, :L2
    if-ltz p4, :L2
    if-gez p5, :L0
    goto :L2
  :L0
  .line 274
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
  .line 275
    iput p2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
  .line 276
    iput p3, p1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
  .line 277
    iput p4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
  .line 278
    iput p5, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
  .line 285
    invoke-virtual { p1, p5 }, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V
  .line 286
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/view/ReflectImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 287
    return-void
  :L2
  .line 272
    return-void
.end method

.method private static capture(Landroid/view/ViewGroup$MarginLayoutParams;)V
  .registers 2
  .line 264
    sget v0, Lcom/innioasis/ipp/Cover;->boxW:I
    if-gtz v0, :L0
    if-eqz p0, :L0
    iget v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
    if-lez v0, :L0
  .line 265
    iget v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
    sput v0, Lcom/innioasis/ipp/Cover;->boxW:I
  .line 266
    iget p0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
    sput p0, Lcom/innioasis/ipp/Cover;->boxH:I
  :L0
  .line 268
    return-void
.end method

.method public static fitCover(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .catchall { :L1 .. :L11 } :L13
  .registers 8
  .line 559
    if-nez p0, :L0
  .line 560
    const/4 p0, 0
    return-object p0
  :L0
  .line 563
    invoke-static { }, Lcom/innioasis/ipp/Cover;->flatCover()Z
    move-result v0
  .line 565
    invoke-static { p0 }, Lcom/innioasis/ipp/Cover;->fitMemo(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 566
    if-eqz v1, :L1
  .line 567
    return-object v1
  :L1
  .line 575
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v1
  .line 576
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v2
  .line 577
    if-lez v1, :L12
    if-lez v2, :L12
  .line 578
    if-gt v1, v2, :L2
    move v3, v1
    goto :L3
  :L2
    move v3, v2
  :L3
  .line 579
    const/16 v4, 320
    if-le v3, v4, :L4
    goto :L5
  :L4
    move v4, v3
  :L5
  .line 580
    if-ne v1, v2, :L8
    if-ne v2, v4, :L8
  .line 582
    if-eqz v0, :L6
    move-object v0, p0
    goto :L7
  :L6
    invoke-static { p0 }, Lcom/innioasis/ipp/Cover;->softEdge(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object v0
  :L7
    invoke-static { p0, v0 }, Lcom/innioasis/ipp/Cover;->fitPut(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object p0
    return-object p0
  :L8
  .line 584
    sub-int/2addr v1, v3
    div-int/lit8 v1, v1, 2
  .line 585
    sub-int/2addr v2, v3
    div-int/lit8 v2, v2, 2
  .line 586
    new-instance v5, Landroid/graphics/Rect;
    add-int v6, v1, v3
    add-int/2addr v3, v2
    invoke-direct { v5, v1, v2, v6, v3 }, Landroid/graphics/Rect;-><init>(IIII)V
  .line 587
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v4, v4, v1 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 588
    new-instance v2, Landroid/graphics/Canvas;
    invoke-direct { v2, v1 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 589
    new-instance v3, Landroid/graphics/Rect;
    const/4 v6, 0
    invoke-direct { v3, v6, v6, v4, v4 }, Landroid/graphics/Rect;-><init>(IIII)V
  .line 590
    new-instance v4, Landroid/graphics/Paint;
    invoke-direct { v4 }, Landroid/graphics/Paint;-><init>()V
  .line 591
    const/4 v6, 1
    invoke-virtual { v4, v6 }, Landroid/graphics/Paint;->setFilterBitmap(Z)V
  .line 592
    invoke-virtual { v4, v6 }, Landroid/graphics/Paint;->setAntiAlias(Z)V
  .line 593
    invoke-virtual { v2, p0, v5, v3, v4 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 597
    if-eqz v0, :L9
    goto :L10
  :L9
    invoke-static { v1 }, Lcom/innioasis/ipp/Cover;->softEdge(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object v1
  :L10
    invoke-static { p0, v1 }, Lcom/innioasis/ipp/Cover;->fitPut(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object p0
  :L11
    return-object p0
  :L12
  .line 600
    goto :L14
  :L13
  .line 599
    move-exception v0
  :L14
  .line 601
    return-object p0
.end method

.method private static fitMemo(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .registers 4
  .line 113
    const/4 v0, 0
    if-eqz p0, :L3
    sget-object v1, Lcom/innioasis/ipp/Cover;->fitIn:Ljava/lang/ref/WeakReference;
    if-eqz v1, :L3
    sget-object v2, Lcom/innioasis/ipp/Cover;->fitOut:Landroid/graphics/Bitmap;
    if-nez v2, :L0
    goto :L3
  :L0
  .line 114
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    if-eq v1, p0, :L1
    return-object v0
  :L1
  .line 115
    sget-object p0, Lcom/innioasis/ipp/Cover;->fitOut:Landroid/graphics/Bitmap;
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result p0
    if-eqz p0, :L2
    sput-object v0, Lcom/innioasis/ipp/Cover;->fitOut:Landroid/graphics/Bitmap;
    return-object v0
  :L2
  .line 116
    sget-object p0, Lcom/innioasis/ipp/Cover;->fitOut:Landroid/graphics/Bitmap;
    return-object p0
  :L3
  .line 113
    return-object v0
.end method

.method private static fitPut(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .registers 3
  .line 121
    if-eqz p0, :L0
    if-eqz p1, :L0
  .line 122
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v0, Lcom/innioasis/ipp/Cover;->fitIn:Ljava/lang/ref/WeakReference;
  .line 123
    sput-object p1, Lcom/innioasis/ipp/Cover;->fitOut:Landroid/graphics/Bitmap;
  :L0
  .line 125
    return-object p1
.end method

.method public static flatCover()Z
  .catchall { :L0 .. :L3 } :L4
  .registers 4
  .line 81
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
  .line 82
    sget v3, Lcom/innioasis/ipp/Cover;->look:I
    if-eq v1, v3, :L3
  .line 83
    sput v1, Lcom/innioasis/ipp/Cover;->look:I
  .line 84
    const/4 v3, 0
    sput-object v3, Lcom/innioasis/ipp/Cover;->fitIn:Ljava/lang/ref/WeakReference;
  .line 85
    sput-object v3, Lcom/innioasis/ipp/Cover;->fitOut:Landroid/graphics/Bitmap;
  .line 86
    sput-object v3, Lcom/innioasis/ipp/Cover;->reflIn:Ljava/lang/ref/WeakReference;
  .line 87
    sput-object v3, Lcom/innioasis/ipp/Cover;->reflOut:Landroid/graphics/Bitmap;
  :L3
  .line 89
    xor-int/lit8 v0, v1, 1
    return v0
  :L4
  .line 90
    move-exception v1
  .line 91
    return v0
.end method

.method private static inset(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;II)I
  .catchall { :L0 .. :L1 } :L3
  .registers 6
  .line 402
    const/4 v0, 0
  :L0
    iget-object v1, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->musicInfoLl:Landroidx/constraintlayout/widget/ConstraintLayout;
  .line 403
    invoke-virtual { v1 }, Landroidx/constraintlayout/widget/ConstraintLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v1
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 404
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
    invoke-virtual { p0 }, Lcom/innioasis/y1/view/ReflectImageView;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object p0
    iget p0, p0, Landroid/util/DisplayMetrics;->widthPixels:I
  .line 405
    iget v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I
    sub-int/2addr p0, v2
    iget v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
  :L1
    sub-int/2addr p0, v1
  .line 406
    sub-int/2addr p0, p2
    sub-int/2addr p0, p2
  .line 409
    sub-int/2addr p1, p0
  .line 410
    if-lez p1, :L2
    move v0, p1
  :L2
    return v0
  :L3
  .line 411
    move-exception p0
  .line 412
    return v0
.end method

.method public static instantBlank(Lcom/innioasis/y1/base/BasePlayerActivity;Ljava/lang/String;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 3
  .line 478
    if-eqz p0, :L7
    if-nez p1, :L0
    goto :L7
  :L0
  .line 479
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->knownNone(Ljava/lang/String;)Z
    move-result p1
    if-nez p1, :L1
    return-void
  :L1
  .line 480
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;
  .line 481
    if-nez p0, :L2
    return-void
  :L2
  .line 482
    iget-object p1, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
    if-eqz p1, :L3
    iget-object p1, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
    const/16 v0, 8
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/view/ReflectImageView;->setVisibility(I)V
  :L3
  .line 483
    iget-object p1, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg2:Lcom/innioasis/y1/view/ReflectImageView;
    if-eqz p1, :L4
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg2:Lcom/innioasis/y1/view/ReflectImageView;
    const/4 p1, 0
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/view/ReflectImageView;->setVisibility(I)V
  :L4
  .line 486
    goto :L6
  :L5
  .line 484
    move-exception p0
  :L6
  .line 487
    return-void
  :L7
  .line 478
    return-void
.end method

.method public static instantCover(Lcom/innioasis/y1/base/BasePlayerActivity;Ljava/lang/String;)V
  .catchall { :L1 .. :L2 } :L3
  .registers 4
  .line 712
    invoke-static { p0 }, Lcom/innioasis/ipp/Cover;->blank(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .line 713
    invoke-static { p1 }, Lcom/innioasis/ipp/Cover;->bigCoverCached(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 714
    if-nez v0, :L0
  .line 719
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Cover;->instantBlank(Lcom/innioasis/y1/base/BasePlayerActivity;Ljava/lang/String;)V
  .line 720
    return-void
  :L0
  .line 722
    invoke-static { v0 }, Lcom/innioasis/ipp/Cover;->fitCover(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object p1
  .line 723
    if-nez p1, :L1
  .line 724
    return-void
  :L1
  .line 727
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;
  .line 728
    iget-object v1, v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
  .line 729
    invoke-virtual { v1, p1 }, Lcom/innioasis/y1/view/ReflectImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 730
    const/4 p1, 0
    invoke-virtual { v1, p1 }, Lcom/innioasis/y1/view/ReflectImageView;->setVisibility(I)V
  .line 731
    iget-object p1, v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg2:Lcom/innioasis/y1/view/ReflectImageView;
    const/16 v0, 8
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/view/ReflectImageView;->setVisibility(I)V
  .line 733
    invoke-static { p0 }, Lcom/innioasis/ipp/Cover;->tilt(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  :L2
  .line 735
    goto :L4
  :L3
  .line 734
    move-exception p0
  :L4
  .line 736
    return-void
.end method

.method private static leftOf(Landroid/view/ViewGroup$MarginLayoutParams;)I
  .registers 2
  .line 295
    invoke-virtual { p0 }, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginStart()I
    move-result v0
  .line 296
    if-lez v0, :L0
    goto :L1
  :L0
    iget v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
  :L1
    return v0
.end method

.method private static mapX(Landroid/graphics/Matrix;FF)F
  .registers 5
  .line 347
    const/4 v0, 2
    new-array v0, v0, [F
    const/4 v1, 0
    aput p1, v0, v1
    const/4 p1, 1
    aput p2, v0, p1
  .line 348
    invoke-virtual { p0, v0 }, Landroid/graphics/Matrix;->mapPoints([F)V
  .line 349
    aget p0, v0, v1
    return p0
.end method

.method public static reflCache()Landroid/graphics/Bitmap;
  .registers 3
  .line 500
    sget-object v0, Lcom/innioasis/ipp/Cover;->reflCache:Landroid/graphics/Bitmap;
  .line 501
    const/4 v1, 0
    if-nez v0, :L0
  .line 502
    return-object v1
  :L0
  .line 504
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v2
    if-eqz v2, :L1
  .line 505
    nop
  .line 506
    sput-object v1, Lcom/innioasis/ipp/Cover;->reflCache:Landroid/graphics/Bitmap;
    move-object v0, v1
  :L1
  .line 508
    return-object v0
.end method

.method public static reflect(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L6 } :L8
  .registers 23
  .line 146
    move-object/from16 v0, p0
    const/4 v8, 0
    if-nez v0, :L0
    return-object v8
  :L0
  .line 148
    invoke-static { }, Lcom/innioasis/ipp/Cover;->flatCover()Z
  .line 149
    sget-object v1, Lcom/innioasis/ipp/Cover;->reflIn:Ljava/lang/ref/WeakReference;
    if-eqz v1, :L1
    sget-object v2, Lcom/innioasis/ipp/Cover;->reflOut:Landroid/graphics/Bitmap;
    if-eqz v2, :L1
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    if-ne v1, v0, :L1
    sget-object v1, Lcom/innioasis/ipp/Cover;->reflOut:Landroid/graphics/Bitmap;
    invoke-virtual { v1 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v1
    if-nez v1, :L1
  .line 150
    sget-object v0, Lcom/innioasis/ipp/Cover;->reflOut:Landroid/graphics/Bitmap;
    return-object v0
  :L1
  .line 152
    invoke-virtual/range { p0 .. p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v9
  .line 153
    invoke-virtual/range { p0 .. p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v10
  .line 154
    if-lez v9, :L7
    if-gtz v10, :L2
    goto/16 :L7
  :L2
  .line 155
    div-int/lit8 v5, v10, 2
  .line 156
    if-gtz v5, :L3
    return-object v8
  :L3
  .line 158
    add-int v11, v10, v5
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v9, v11, v1 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v12
  .line 159
    new-instance v13, Landroid/graphics/Canvas;
    invoke-direct { v13, v12 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 160
    const/4 v1, 0
    invoke-virtual { v13, v0, v1, v1, v8 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
  .line 163
    const/16 v1, 150
    if-le v9, v1, :L4
    const/high16 v1, 0x43160000
    int-to-float v2, v9
    div-float/2addr v1, v2
    goto :L5
  :L4
    const/high16 v1, 0x3F800000
  :L5
  .line 164
    new-instance v6, Landroid/graphics/Matrix;
    invoke-direct { v6 }, Landroid/graphics/Matrix;-><init>()V
  .line 165
    neg-float v2, v1
    invoke-virtual { v6, v1, v2 }, Landroid/graphics/Matrix;->preScale(FF)Z
  .line 166
    const/4 v2, 0
    const/4 v7, 1
    move-object/from16 v1, p0
    move v3, v5
    move v4, v9
    invoke-static/range { v1 .. v7 }, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 167
    new-instance v2, Landroid/graphics/Paint;
    invoke-direct { v2 }, Landroid/graphics/Paint;-><init>()V
  .line 168
    const/4 v3, 1
    invoke-virtual { v2, v3 }, Landroid/graphics/Paint;->setFilterBitmap(Z)V
  .line 169
    invoke-virtual { v2, v3 }, Landroid/graphics/Paint;->setAntiAlias(Z)V
  .line 170
    new-instance v3, Landroid/graphics/Rect;
    const/4 v4, 0
    invoke-direct { v3, v4, v10, v9, v11 }, Landroid/graphics/Rect;-><init>(IIII)V
    invoke-virtual { v13, v1, v8, v3, v2 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 173
    new-instance v1, Landroid/graphics/Paint;
    invoke-direct { v1 }, Landroid/graphics/Paint;-><init>()V
  .line 174
    new-instance v2, Landroid/graphics/LinearGradient;
    const/4 v15, 0
    int-to-float v3, v10
    const/16 v17, 0
    int-to-float v4, v11
    const v19, 1895825407
    const v20, 16777215
    sget-object v21, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;
    move-object v14, v2
    move/from16 v16, v3
    move/from16 v18, v4
    invoke-direct/range { v14 .. v21 }, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V
    invoke-virtual { v1, v2 }, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;
  .line 176
    new-instance v2, Landroid/graphics/PorterDuffXfermode;
    sget-object v5, Landroid/graphics/PorterDuff$Mode;->DST_IN:Landroid/graphics/PorterDuff$Mode;
    invoke-direct { v2, v5 }, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V
    invoke-virtual { v1, v2 }, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;
  .line 177
    const/4 v14, 0
    int-to-float v2, v9
    move v15, v3
    move/from16 v16, v2
    move/from16 v17, v4
    move-object/from16 v18, v1
    invoke-virtual/range { v13 .. v18 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 179
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, v0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v1, Lcom/innioasis/ipp/Cover;->reflIn:Ljava/lang/ref/WeakReference;
  .line 180
    sput-object v12, Lcom/innioasis/ipp/Cover;->reflOut:Landroid/graphics/Bitmap;
  :L6
  .line 181
    return-object v12
  :L7
  .line 154
    return-object v8
  :L8
  .line 182
    move-exception v0
  .line 183
    return-object v8
.end method

.method private static rowsHeight(Landroid/view/ViewGroup;)I
  .registers 7
  .line 385
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getHeight()I
    move-result v0
  .line 386
    if-lez v0, :L0
    return v0
  :L0
  .line 387
    nop
  .line 388
    const/4 v0, 0
    const/4 v1, 0
    const/4 v2, 0
  :L1
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v3
    if-ge v1, v3, :L6
  .line 389
    invoke-virtual { p0, v1 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v3
  .line 390
    if-eqz v3, :L5
    invoke-virtual { v3 }, Landroid/view/View;->getVisibility()I
    move-result v4
    const/16 v5, 8
    if-ne v4, v5, :L2
    goto :L5
  :L2
  .line 391
    invoke-virtual { v3 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v3
  .line 392
    instance-of v4, v3, Landroid/view/ViewGroup$MarginLayoutParams;
    if-nez v4, :L3
    return v0
  :L3
  .line 393
    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 394
    iget v4, v3, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
    if-gtz v4, :L4
    return v0
  :L4
  .line 395
    iget v4, v3, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
    iget v3, v3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    add-int/2addr v4, v3
    add-int/2addr v2, v4
  :L5
  .line 388
    add-int/lit8 v1, v1, 1
    goto :L1
  :L6
  .line 397
    return v2
.end method

.method public static setReflCache(Landroid/graphics/Bitmap;)V
  .registers 1
  .line 512
    sput-object p0, Lcom/innioasis/ipp/Cover;->reflCache:Landroid/graphics/Bitmap;
  .line 513
    return-void
.end method

.method private static softEdge(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L3
  .registers 5
  .line 537
    if-nez p0, :L0
  .line 538
    const/4 p0, 0
    return-object p0
  :L0
  .line 541
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v0
  .line 542
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v1
  .line 543
    if-lez v0, :L2
    if-lez v1, :L2
  .line 544
    add-int/lit8 v0, v0, 4
    add-int/lit8 v1, v1, 2
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v0, v1, v2 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 545
    new-instance v1, Landroid/graphics/Canvas;
    invoke-direct { v1, v0 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 546
    new-instance v2, Landroid/graphics/Paint;
    invoke-direct { v2 }, Landroid/graphics/Paint;-><init>()V
  .line 547
    const/4 v3, 1
    invoke-virtual { v2, v3 }, Landroid/graphics/Paint;->setFilterBitmap(Z)V
  .line 548
    invoke-virtual { v2, v3 }, Landroid/graphics/Paint;->setAntiAlias(Z)V
  .line 549
    const/high16 v3, 0x40000000
    invoke-virtual { v1, p0, v3, v3, v2 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
  :L1
  .line 550
    return-object v0
  :L2
  .line 553
    goto :L4
  :L3
  .line 552
    move-exception v0
  :L4
  .line 554
    return-object p0
.end method

.method public static square(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L8 } :L10
  .registers 14
  .line 615
    if-nez p0, :L0
  .line 616
    const/4 p0, 0
    return-object p0
  :L0
  .line 619
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v0
  .line 620
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v1
  .line 621
    if-lez v0, :L9
    if-lez v1, :L9
    if-lez p1, :L9
  .line 622
    if-ne v0, p1, :L1
    if-ne v1, p1, :L1
  .line 623
    return-object p0
  :L1
  .line 625
    new-instance v2, Landroid/graphics/Paint;
    invoke-direct { v2 }, Landroid/graphics/Paint;-><init>()V
  .line 626
    const/4 v3, 1
    invoke-virtual { v2, v3 }, Landroid/graphics/Paint;->setFilterBitmap(Z)V
  .line 627
    invoke-virtual { v2, v3 }, Landroid/graphics/Paint;->setAntiAlias(Z)V
  .line 637
    nop
  .line 638
    const/4 v4, 0
    const/4 v6, 0
    move-object v5, p0
  :L2
  .line 639
    mul-int/lit8 v7, p1, 2
    if-lt v0, v7, :L5
    if-lt v1, v7, :L5
  .line 640
    div-int/lit8 v7, v0, 2
  .line 641
    div-int/lit8 v8, v1, 2
  .line 642
    if-lez v7, :L5
    if-gtz v8, :L3
    goto :L5
  :L3
  .line 643
    sget-object v9, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v7, v8, v9 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v9
  .line 644
    new-instance v10, Landroid/graphics/Canvas;
    invoke-direct { v10, v9 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 645
    new-instance v11, Landroid/graphics/Rect;
    invoke-direct { v11, v4, v4, v0, v1 }, Landroid/graphics/Rect;-><init>(IIII)V
    new-instance v0, Landroid/graphics/Rect;
    invoke-direct { v0, v4, v4, v7, v8 }, Landroid/graphics/Rect;-><init>(IIII)V
    invoke-virtual { v10, v5, v11, v0, v2 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 646
    if-eqz v6, :L4
  .line 647
    invoke-virtual { v5 }, Landroid/graphics/Bitmap;->recycle()V
  :L4
  .line 649
    nop
  .line 650
    nop
  .line 651
    nop
  .line 652
    nop
  .line 653
    move v0, v7
    move v1, v8
    move-object v5, v9
    const/4 v6, 1
    goto :L2
  :L5
  .line 655
    if-gt v0, v1, :L6
    move v3, v0
    goto :L7
  :L6
    move v3, v1
  :L7
  .line 656
    sub-int/2addr v0, v3
    div-int/lit8 v0, v0, 2
  .line 657
    sub-int/2addr v1, v3
    div-int/lit8 v1, v1, 2
  .line 658
    new-instance v7, Landroid/graphics/Rect;
    add-int v8, v0, v3
    add-int/2addr v3, v1
    invoke-direct { v7, v0, v1, v8, v3 }, Landroid/graphics/Rect;-><init>(IIII)V
  .line 659
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { p1, p1, v0 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 660
    new-instance v1, Landroid/graphics/Canvas;
    invoke-direct { v1, v0 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 661
    new-instance v3, Landroid/graphics/Rect;
    invoke-direct { v3, v4, v4, p1, p1 }, Landroid/graphics/Rect;-><init>(IIII)V
  .line 662
    invoke-virtual { v1, v5, v7, v3, v2 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 663
    if-eqz v6, :L8
  .line 664
    invoke-virtual { v5 }, Landroid/graphics/Bitmap;->recycle()V
  :L8
  .line 666
    return-object v0
  :L9
  .line 669
    goto :L11
  :L10
  .line 668
    move-exception p1
  :L11
  .line 670
    return-object p0
.end method

.method public static tilt(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .catchall { :L0 .. :L7 } :L8
  .registers 10
  .line 189
    if-nez p0, :L0
    return-void
  :L0
  .line 190
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;
  .line 191
    if-nez p0, :L1
    return-void
  :L1
  .line 193
    iget-object v6, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
  .line 194
    if-nez v6, :L2
    return-void
  :L2
  .line 195
    nop
  .line 196
    invoke-virtual { v6 }, Lcom/innioasis/y1/view/ReflectImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
    move-object v1, v0
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 197
    if-nez v1, :L3
    return-void
  :L3
  .line 198
    invoke-static { v1 }, Lcom/innioasis/ipp/Cover;->capture(Landroid/view/ViewGroup$MarginLayoutParams;)V
  .line 207
    invoke-static { }, Lcom/innioasis/ipp/Cover;->flatCover()Z
    move-result v0
  .line 208
    sget v2, Lcom/innioasis/ipp/Cover;->boxW:I
    invoke-static { v1 }, Lcom/innioasis/ipp/Cover;->leftOf(Landroid/view/ViewGroup$MarginLayoutParams;)I
    move-result v3
    invoke-static { p0, v2, v3 }, Lcom/innioasis/ipp/Cover;->inset(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;II)I
    move-result v3
    sub-int/2addr v2, v3
  .line 209
    sget-object v3, Landroid/widget/ImageView$ScaleType;->FIT_START:Landroid/widget/ImageView$ScaleType;
    invoke-virtual { v6, v3 }, Lcom/innioasis/y1/view/ReflectImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
  .line 211
    const/4 v3, 0
    const/4 v4, 0
    if-eqz v0, :L4
  .line 212
    invoke-virtual { v6, v3 }, Lcom/innioasis/y1/view/ReflectImageView;->setRotationY(F)V
  .line 213
    sget v0, Lcom/innioasis/ipp/Cover;->boxW:I
    sub-int/2addr v0, v2
    invoke-virtual { v6, v4, v4, v0, v4 }, Lcom/innioasis/y1/view/ReflectImageView;->setPadding(IIII)V
  .line 214
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
  .line 215
    return-void
  :L4
  .line 217
    invoke-virtual { v6, v4, v4, v4, v4 }, Lcom/innioasis/y1/view/ReflectImageView;->setPadding(IIII)V
  .line 221
    invoke-virtual { v6 }, Lcom/innioasis/y1/view/ReflectImageView;->getHeight()I
    move-result v0
    int-to-float v0, v0
  .line 222
    cmpg-float v4, v0, v3
    if-gtz v4, :L5
    iget v0, v1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
    int-to-float v0, v0
  :L5
  .line 223
    invoke-virtual { v6, v3 }, Lcom/innioasis/y1/view/ReflectImageView;->setPivotX(F)V
  .line 224
    const/high16 v7, 0x40400000
    cmpl-float v3, v0, v3
    if-lez v3, :L6
    div-float/2addr v0, v7
    invoke-virtual { v6, v0 }, Lcom/innioasis/y1/view/ReflectImageView;->setPivotY(F)V
  :L6
  .line 225
    const/high16 v0, 0x41A00000
    invoke-virtual { v6, v0 }, Lcom/innioasis/y1/view/ReflectImageView;->setRotationY(F)V
  .line 232
    invoke-static { v6, v2 }, Lcom/innioasis/ipp/Cover;->tiltWidth(Lcom/innioasis/y1/view/ReflectImageView;I)I
    move-result v2
  .line 233
    int-to-float v0, v2
    sget v3, Lcom/innioasis/ipp/Cover;->boxH:I
    int-to-float v3, v3
    mul-float v0, v0, v3
    sget v3, Lcom/innioasis/ipp/Cover;->boxW:I
    int-to-float v3, v3
    div-float/2addr v0, v3
    invoke-static { v0 }, Ljava/lang/Math;->round(F)I
    move-result v8
  .line 234
    invoke-static { p0, v1, v2 }, Lcom/innioasis/ipp/Cover;->topFor(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;Landroid/view/ViewGroup$MarginLayoutParams;I)I
    move-result v4
    invoke-static { v1 }, Lcom/innioasis/ipp/Cover;->leftOf(Landroid/view/ViewGroup$MarginLayoutParams;)I
    move-result v5
    move-object v0, v6
    move v3, v8
    invoke-static/range { v0 .. v5 }, Lcom/innioasis/ipp/Cover;->box(Lcom/innioasis/y1/view/ReflectImageView;Landroid/view/ViewGroup$MarginLayoutParams;IIII)V
  .line 235
    if-lez v8, :L7
    int-to-float p0, v8
    div-float/2addr p0, v7
    invoke-virtual { v6, p0 }, Lcom/innioasis/y1/view/ReflectImageView;->setPivotY(F)V
  :L7
  .line 238
    goto :L9
  :L8
  .line 236
    move-exception p0
  :L9
  .line 239
    return-void
.end method

.method private static tiltWidth(Lcom/innioasis/y1/view/ReflectImageView;I)I
  .catchall { :L0 .. :L11 } :L12
  .registers 9
  .line 327
    if-gtz p1, :L1
  :L0
    sget p0, Lcom/innioasis/ipp/Cover;->boxW:I
    return p0
  :L1
  .line 328
    invoke-virtual { p0 }, Lcom/innioasis/y1/view/ReflectImageView;->getMatrix()Landroid/graphics/Matrix;
    move-result-object v0
  .line 329
    if-eqz v0, :L10
    invoke-virtual { v0 }, Landroid/graphics/Matrix;->isIdentity()Z
    move-result v1
    if-eqz v1, :L2
    goto :L10
  :L2
  .line 330
    invoke-virtual { p0 }, Lcom/innioasis/y1/view/ReflectImageView;->getPivotY()F
    move-result p0
  .line 331
    int-to-float v1, p1
  .line 332
    const/high16 v2, 0x40400000
    mul-float v2, v2, v1
  .line 333
    invoke-static { v0, v2, p0 }, Lcom/innioasis/ipp/Cover;->mapX(Landroid/graphics/Matrix;FF)F
    move-result v3
    cmpg-float v3, v3, v1
    if-gez v3, :L3
    invoke-static { v2 }, Ljava/lang/Math;->round(F)I
    move-result p0
    return p0
  :L3
  .line 334
    const/4 v3, 0
    move v4, v1
  :L4
    const/16 v5, 24
    const/high16 v6, 0x3F000000
    if-ge v3, v5, :L7
  .line 335
    add-float v5, v4, v2
    mul-float v5, v5, v6
  .line 336
    invoke-static { v0, v5, p0 }, Lcom/innioasis/ipp/Cover;->mapX(Landroid/graphics/Matrix;FF)F
    move-result v6
    cmpg-float v6, v6, v1
    if-gez v6, :L5
    move v4, v5
    goto :L6
  :L5
    move v2, v5
  :L6
  .line 334
    add-int/lit8 v3, v3, 1
    goto :L4
  :L7
  .line 338
    add-float/2addr v4, v2
    mul-float v4, v4, v6
    invoke-static { v4 }, Ljava/lang/Math;->round(F)I
    move-result p0
  .line 339
    if-ge p0, p1, :L8
    goto :L9
  :L8
    move p1, p0
  :L9
    return p1
  :L10
  .line 329
    sget p0, Lcom/innioasis/ipp/Cover;->boxW:I
  :L11
    return p0
  :L12
  .line 340
    move-exception p0
  .line 341
    sget p0, Lcom/innioasis/ipp/Cover;->boxW:I
    return p0
.end method

.method private static topFor(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;Landroid/view/ViewGroup$MarginLayoutParams;I)I
  .catchall { :L0 .. :L2 } :L5
  .registers 4
  :L0
  .line 373
    iget-object v0, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->musicInfoLl:Landroidx/constraintlayout/widget/ConstraintLayout;
  .line 374
    invoke-virtual { v0 }, Landroidx/constraintlayout/widget/ConstraintLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 375
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->musicInfoLl:Landroidx/constraintlayout/widget/ConstraintLayout;
    invoke-static { p0 }, Lcom/innioasis/ipp/Cover;->rowsHeight(Landroid/view/ViewGroup;)I
    move-result p0
  .line 376
    if-gtz p0, :L1
    iget p0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    return p0
  :L1
  .line 377
    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    sub-int/2addr p0, p2
    div-int/lit8 p0, p0, 2
  :L2
    add-int/2addr v0, p0
  .line 378
    if-lez v0, :L3
    goto :L4
  :L3
    const/4 v0, 0
  :L4
    return v0
  :L5
  .line 379
    move-exception p0
  .line 380
    iget p0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    return p0
.end method
