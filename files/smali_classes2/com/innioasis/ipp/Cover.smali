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
  .line 484
    const/4 v0, 0
    if-nez p0, :L0
  .line 485
    return-object v0
  :L0
  .line 488
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->track(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object p0
  :L1
    return-object p0
  :L2
  .line 489
    move-exception p0
  .line 490
    return-object v0
.end method

.method private static bigCoverCached(Ljava/lang/String;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  .line 496
    const/4 v0, 0
    if-nez p0, :L0
  .line 497
    return-object v0
  :L0
  .line 500
    invoke-static { p0 }, Lcom/innioasis/ipp/BigCover;->peekTrack(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object p0
  :L1
    return-object p0
  :L2
  .line 501
    move-exception p0
  .line 502
    return-object v0
.end method

.method private static blank(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .catchall { :L0 .. :L5 } :L9
  .registers 7
  :L0
  .line 301
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;
  .line 302
    if-nez p0, :L1
    return-void
  :L1
  .line 303
    iget-object v0, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg2:Lcom/innioasis/y1/view/ReflectImageView;
  .line 304
    if-eqz v0, :L8
    iget-object v1, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
    if-nez v1, :L2
    goto :L8
  :L2
  .line 305
    nop
  .line 306
    invoke-virtual { v0 }, Lcom/innioasis/y1/view/ReflectImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v1
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 307
    iget-object v2, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
  .line 308
    invoke-virtual { v2 }, Lcom/innioasis/y1/view/ReflectImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v2
    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 309
    if-eqz v1, :L7
    if-nez v2, :L3
    goto :L7
  :L3
  .line 310
    invoke-static { v2 }, Lcom/innioasis/ipp/Cover;->capture(Landroid/view/ViewGroup$MarginLayoutParams;)V
  .line 311
    sget v3, Lcom/innioasis/ipp/Cover;->boxW:I
    if-lez v3, :L6
    sget v3, Lcom/innioasis/ipp/Cover;->boxH:I
    if-gtz v3, :L4
    goto :L6
  :L4
  .line 313
    invoke-static { v2 }, Lcom/innioasis/ipp/Cover;->leftOf(Landroid/view/ViewGroup$MarginLayoutParams;)I
    move-result v5
  .line 314
    sget v2, Lcom/innioasis/ipp/Cover;->boxW:I
    invoke-static { p0, v2, v5 }, Lcom/innioasis/ipp/Cover;->inset(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;II)I
    move-result v3
    sub-int/2addr v2, v3
  .line 315
    sget-object v3, Landroid/widget/ImageView$ScaleType;->FIT_START:Landroid/widget/ImageView$ScaleType;
    invoke-virtual { v0, v3 }, Lcom/innioasis/y1/view/ReflectImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
  .line 316
    const/4 v3, 0
    invoke-virtual { v0, v3, v3, v3, v3 }, Lcom/innioasis/y1/view/ReflectImageView;->setPadding(IIII)V
  .line 317
    int-to-float v3, v2
    sget v4, Lcom/innioasis/ipp/Cover;->boxH:I
    int-to-float v4, v4
    mul-float v3, v3, v4
    sget v4, Lcom/innioasis/ipp/Cover;->boxW:I
    int-to-float v4, v4
    div-float/2addr v3, v4
    invoke-static { v3 }, Ljava/lang/Math;->round(F)I
    move-result v3
  .line 318
    invoke-static { p0, v1, v2 }, Lcom/innioasis/ipp/Cover;->topFor(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;Landroid/view/ViewGroup$MarginLayoutParams;I)I
    move-result v4
  .line 317
    invoke-static/range { v0 .. v5 }, Lcom/innioasis/ipp/Cover;->box(Lcom/innioasis/y1/view/ReflectImageView;Landroid/view/ViewGroup$MarginLayoutParams;IIII)V
  :L5
  .line 320
    goto :L10
  :L6
  .line 311
    return-void
  :L7
  .line 309
    return-void
  :L8
  .line 304
    return-void
  :L9
  .line 319
    move-exception p0
  :L10
  .line 321
    return-void
.end method

.method private static box(Lcom/innioasis/y1/view/ReflectImageView;Landroid/view/ViewGroup$MarginLayoutParams;IIII)V
  .registers 7
  .line 190
    if-lez p2, :L2
    if-lez p3, :L2
    if-ltz p4, :L2
    if-gez p5, :L0
    goto :L2
  :L0
  .line 192
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
  .line 193
    iput p2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
  .line 194
    iput p3, p1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
  .line 195
    iput p4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
  .line 196
    iput p5, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
  .line 198
    invoke-virtual { p1, p5 }, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V
  .line 199
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/view/ReflectImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  .line 200
    return-void
  :L2
  .line 190
    return-void
.end method

.method private static capture(Landroid/view/ViewGroup$MarginLayoutParams;)V
  .registers 2
  .line 182
    sget v0, Lcom/innioasis/ipp/Cover;->boxW:I
    if-gtz v0, :L0
    if-eqz p0, :L0
    iget v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
    if-lez v0, :L0
  .line 183
    iget v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
    sput v0, Lcom/innioasis/ipp/Cover;->boxW:I
  .line 184
    iget p0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
    sput p0, Lcom/innioasis/ipp/Cover;->boxH:I
  :L0
  .line 186
    return-void
.end method

.method public static fitCover(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .catchall { :L1 .. :L11 } :L13
  .registers 8
  .line 390
    if-nez p0, :L0
  .line 391
    const/4 p0, 0
    return-object p0
  :L0
  .line 393
    invoke-static { }, Lcom/innioasis/ipp/Cover;->flatCover()Z
    move-result v0
  .line 394
    invoke-static { p0 }, Lcom/innioasis/ipp/Cover;->fitMemo(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 395
    if-eqz v1, :L1
  .line 396
    return-object v1
  :L1
  .line 399
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v1
  .line 400
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v2
  .line 401
    if-lez v1, :L12
    if-lez v2, :L12
  .line 402
    if-gt v1, v2, :L2
    move v3, v1
    goto :L3
  :L2
    move v3, v2
  :L3
  .line 403
    const/16 v4, 320
    if-le v3, v4, :L4
    goto :L5
  :L4
    move v4, v3
  :L5
  .line 404
    if-ne v1, v2, :L8
    if-ne v2, v4, :L8
  .line 406
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
  .line 408
    sub-int/2addr v1, v3
    div-int/lit8 v1, v1, 2
  .line 409
    sub-int/2addr v2, v3
    div-int/lit8 v2, v2, 2
  .line 410
    new-instance v5, Landroid/graphics/Rect;
    add-int v6, v1, v3
    add-int/2addr v3, v2
    invoke-direct { v5, v1, v2, v6, v3 }, Landroid/graphics/Rect;-><init>(IIII)V
  .line 411
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v4, v4, v1 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 412
    new-instance v2, Landroid/graphics/Canvas;
    invoke-direct { v2, v1 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 413
    new-instance v3, Landroid/graphics/Rect;
    const/4 v6, 0
    invoke-direct { v3, v6, v6, v4, v4 }, Landroid/graphics/Rect;-><init>(IIII)V
  .line 414
    new-instance v4, Landroid/graphics/Paint;
    invoke-direct { v4 }, Landroid/graphics/Paint;-><init>()V
  .line 415
    const/4 v6, 1
    invoke-virtual { v4, v6 }, Landroid/graphics/Paint;->setFilterBitmap(Z)V
  .line 416
    invoke-virtual { v4, v6 }, Landroid/graphics/Paint;->setAntiAlias(Z)V
  .line 417
    invoke-virtual { v2, p0, v5, v3, v4 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 418
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
  .line 421
    goto :L14
  :L13
  .line 420
    move-exception v0
  :L14
  .line 422
    return-object p0
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

.method private static inset(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;II)I
  .catchall { :L0 .. :L1 } :L3
  .registers 6
  .line 281
    const/4 v0, 0
  :L0
    iget-object v1, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->musicInfoLl:Landroidx/constraintlayout/widget/ConstraintLayout;
  .line 282
    invoke-virtual { v1 }, Landroidx/constraintlayout/widget/ConstraintLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v1
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 283
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
    invoke-virtual { p0 }, Lcom/innioasis/y1/view/ReflectImageView;->getResources()Landroid/content/res/Resources;
    move-result-object p0
    invoke-virtual { p0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object p0
    iget p0, p0, Landroid/util/DisplayMetrics;->widthPixels:I
  .line 284
    iget v2, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I
    sub-int/2addr p0, v2
    iget v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->width:I
  :L1
    sub-int/2addr p0, v1
  .line 285
    sub-int/2addr p0, p2
    sub-int/2addr p0, p2
  .line 287
    sub-int/2addr p1, p0
  .line 288
    if-lez p1, :L2
    move v0, p1
  :L2
    return v0
  :L3
  .line 289
    move-exception p0
  .line 290
    return v0
.end method

.method public static instantBlank(Lcom/innioasis/y1/base/BasePlayerActivity;Ljava/lang/String;)V
  .catchall { :L0 .. :L4 } :L5
  .registers 3
  .line 329
    if-eqz p0, :L7
    if-nez p1, :L0
    goto :L7
  :L0
  .line 330
    invoke-static { p1 }, Lcom/innioasis/ipp/BigCover;->knownNone(Ljava/lang/String;)Z
    move-result p1
    if-nez p1, :L1
    return-void
  :L1
  .line 331
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;
  .line 332
    if-nez p0, :L2
    return-void
  :L2
  .line 333
    iget-object p1, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
    if-eqz p1, :L3
    iget-object p1, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
    const/16 v0, 8
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/view/ReflectImageView;->setVisibility(I)V
  :L3
  .line 334
    iget-object p1, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg2:Lcom/innioasis/y1/view/ReflectImageView;
    if-eqz p1, :L4
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg2:Lcom/innioasis/y1/view/ReflectImageView;
    const/4 p1, 0
    invoke-virtual { p0, p1 }, Lcom/innioasis/y1/view/ReflectImageView;->setVisibility(I)V
  :L4
  .line 337
    goto :L6
  :L5
  .line 335
    move-exception p0
  :L6
  .line 338
    return-void
  :L7
  .line 329
    return-void
.end method

.method public static instantCover(Lcom/innioasis/y1/base/BasePlayerActivity;Ljava/lang/String;)V
  .catchall { :L1 .. :L2 } :L3
  .registers 4
  .line 508
    invoke-static { p0 }, Lcom/innioasis/ipp/Cover;->blank(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .line 509
    invoke-static { p1 }, Lcom/innioasis/ipp/Cover;->bigCoverCached(Ljava/lang/String;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 510
    if-nez v0, :L0
  .line 511
    invoke-static { p0, p1 }, Lcom/innioasis/ipp/Cover;->instantBlank(Lcom/innioasis/y1/base/BasePlayerActivity;Ljava/lang/String;)V
  .line 512
    return-void
  :L0
  .line 514
    invoke-static { v0 }, Lcom/innioasis/ipp/Cover;->fitCover(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object p1
  .line 515
    if-nez p1, :L1
  .line 516
    return-void
  :L1
  .line 519
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object v0
    check-cast v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;
  .line 520
    iget-object v1, v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
  .line 521
    invoke-virtual { v1, p1 }, Lcom/innioasis/y1/view/ReflectImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
  .line 522
    const/4 p1, 0
    invoke-virtual { v1, p1 }, Lcom/innioasis/y1/view/ReflectImageView;->setVisibility(I)V
  .line 523
    iget-object p1, v0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg2:Lcom/innioasis/y1/view/ReflectImageView;
    const/16 v0, 8
    invoke-virtual { p1, v0 }, Lcom/innioasis/y1/view/ReflectImageView;->setVisibility(I)V
  .line 524
    invoke-static { p0 }, Lcom/innioasis/ipp/Cover;->tilt(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  :L2
  .line 526
    goto :L4
  :L3
  .line 525
    move-exception p0
  :L4
  .line 527
    return-void
.end method

.method private static leftOf(Landroid/view/ViewGroup$MarginLayoutParams;)I
  .registers 2
  .line 204
    invoke-virtual { p0 }, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginStart()I
    move-result v0
  .line 205
    if-lez v0, :L0
    goto :L1
  :L0
    iget v0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I
  :L1
    return v0
.end method

.method private static mapX(Landroid/graphics/Matrix;FF)F
  .registers 5
  .line 235
    const/4 v0, 2
    new-array v0, v0, [F
    const/4 v1, 0
    aput p1, v0, v1
    const/4 p1, 1
    aput p2, v0, p1
  .line 236
    invoke-virtual { p0, v0 }, Landroid/graphics/Matrix;->mapPoints([F)V
  .line 237
    aget p0, v0, v1
    return p0
.end method

.method public static reflCache()Landroid/graphics/Bitmap;
  .registers 3
  .line 347
    sget-object v0, Lcom/innioasis/ipp/Cover;->reflCache:Landroid/graphics/Bitmap;
  .line 348
    const/4 v1, 0
    if-nez v0, :L0
  .line 349
    return-object v1
  :L0
  .line 351
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v2
    if-eqz v2, :L1
  .line 352
    nop
  .line 353
    sput-object v1, Lcom/innioasis/ipp/Cover;->reflCache:Landroid/graphics/Bitmap;
    move-object v0, v1
  :L1
  .line 355
    return-object v0
.end method

.method public static reflect(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L6 } :L8
  .registers 23
  .line 93
    move-object/from16 v0, p0
    const/4 v8, 0
    if-nez v0, :L0
    return-object v8
  :L0
  .line 94
    invoke-static { }, Lcom/innioasis/ipp/Cover;->flatCover()Z
  .line 95
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
  .line 96
    sget-object v0, Lcom/innioasis/ipp/Cover;->reflOut:Landroid/graphics/Bitmap;
    return-object v0
  :L1
  .line 98
    invoke-virtual/range { p0 .. p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v9
  .line 99
    invoke-virtual/range { p0 .. p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v10
  .line 100
    if-lez v9, :L7
    if-gtz v10, :L2
    goto/16 :L7
  :L2
  .line 101
    div-int/lit8 v5, v10, 2
  .line 102
    if-gtz v5, :L3
    return-object v8
  :L3
  .line 104
    add-int v11, v10, v5
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v9, v11, v1 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v12
  .line 105
    new-instance v13, Landroid/graphics/Canvas;
    invoke-direct { v13, v12 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 106
    const/4 v1, 0
    invoke-virtual { v13, v0, v1, v1, v8 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
  .line 108
    const/16 v1, 150
    if-le v9, v1, :L4
    const/high16 v1, 0x43160000
    int-to-float v2, v9
    div-float/2addr v1, v2
    goto :L5
  :L4
    const/high16 v1, 0x3F800000
  :L5
  .line 109
    new-instance v6, Landroid/graphics/Matrix;
    invoke-direct { v6 }, Landroid/graphics/Matrix;-><init>()V
  .line 110
    neg-float v2, v1
    invoke-virtual { v6, v1, v2 }, Landroid/graphics/Matrix;->preScale(FF)Z
  .line 111
    const/4 v2, 0
    const/4 v7, 1
    move-object/from16 v1, p0
    move v3, v5
    move v4, v9
    invoke-static/range { v1 .. v7 }, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 112
    new-instance v2, Landroid/graphics/Paint;
    invoke-direct { v2 }, Landroid/graphics/Paint;-><init>()V
  .line 113
    const/4 v3, 1
    invoke-virtual { v2, v3 }, Landroid/graphics/Paint;->setFilterBitmap(Z)V
  .line 114
    invoke-virtual { v2, v3 }, Landroid/graphics/Paint;->setAntiAlias(Z)V
  .line 115
    new-instance v3, Landroid/graphics/Rect;
    const/4 v4, 0
    invoke-direct { v3, v4, v10, v9, v11 }, Landroid/graphics/Rect;-><init>(IIII)V
    invoke-virtual { v13, v1, v8, v3, v2 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 118
    new-instance v1, Landroid/graphics/Paint;
    invoke-direct { v1 }, Landroid/graphics/Paint;-><init>()V
  .line 119
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
  .line 121
    new-instance v2, Landroid/graphics/PorterDuffXfermode;
    sget-object v5, Landroid/graphics/PorterDuff$Mode;->DST_IN:Landroid/graphics/PorterDuff$Mode;
    invoke-direct { v2, v5 }, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V
    invoke-virtual { v1, v2 }, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;
  .line 122
    const/4 v14, 0
    int-to-float v2, v9
    move v15, v3
    move/from16 v16, v2
    move/from16 v17, v4
    move-object/from16 v18, v1
    invoke-virtual/range { v13 .. v18 }, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V
  .line 124
    new-instance v1, Ljava/lang/ref/WeakReference;
    invoke-direct { v1, v0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    sput-object v1, Lcom/innioasis/ipp/Cover;->reflIn:Ljava/lang/ref/WeakReference;
  .line 125
    sput-object v12, Lcom/innioasis/ipp/Cover;->reflOut:Landroid/graphics/Bitmap;
  :L6
  .line 126
    return-object v12
  :L7
  .line 100
    return-object v8
  :L8
  .line 127
    move-exception v0
  .line 128
    return-object v8
.end method

.method private static rowsHeight(Landroid/view/ViewGroup;)I
  .registers 7
  .line 260
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getHeight()I
    move-result v0
  .line 261
    if-lez v0, :L0
    return v0
  :L0
  .line 262
    nop
  .line 263
    const/4 v0, 0
    const/4 v1, 0
    const/4 v2, 0
  :L1
    invoke-virtual { p0 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v3
    if-ge v1, v3, :L6
  .line 264
    invoke-virtual { p0, v1 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v3
  .line 265
    if-eqz v3, :L5
    invoke-virtual { v3 }, Landroid/view/View;->getVisibility()I
    move-result v4
    const/16 v5, 8
    if-ne v4, v5, :L2
    goto :L5
  :L2
  .line 266
    invoke-virtual { v3 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v3
  .line 267
    instance-of v4, v3, Landroid/view/ViewGroup$MarginLayoutParams;
    if-nez v4, :L3
    return v0
  :L3
  .line 268
    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 269
    iget v4, v3, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
    if-gtz v4, :L4
    return v0
  :L4
  .line 270
    iget v4, v3, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
    iget v3, v3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    add-int/2addr v4, v3
    add-int/2addr v2, v4
  :L5
  .line 263
    add-int/lit8 v1, v1, 1
    goto :L1
  :L6
  .line 272
    return v2
.end method

.method public static setReflCache(Landroid/graphics/Bitmap;)V
  .registers 1
  .line 359
    sput-object p0, Lcom/innioasis/ipp/Cover;->reflCache:Landroid/graphics/Bitmap;
  .line 360
    return-void
.end method

.method private static softEdge(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L1 } :L3
  .registers 5
  .line 368
    if-nez p0, :L0
  .line 369
    const/4 p0, 0
    return-object p0
  :L0
  .line 372
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v0
  .line 373
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v1
  .line 374
    if-lez v0, :L2
    if-lez v1, :L2
  .line 375
    add-int/lit8 v0, v0, 4
    add-int/lit8 v1, v1, 2
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v0, v1, v2 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 376
    new-instance v1, Landroid/graphics/Canvas;
    invoke-direct { v1, v0 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 377
    new-instance v2, Landroid/graphics/Paint;
    invoke-direct { v2 }, Landroid/graphics/Paint;-><init>()V
  .line 378
    const/4 v3, 1
    invoke-virtual { v2, v3 }, Landroid/graphics/Paint;->setFilterBitmap(Z)V
  .line 379
    invoke-virtual { v2, v3 }, Landroid/graphics/Paint;->setAntiAlias(Z)V
  .line 380
    const/high16 v3, 0x40000000
    invoke-virtual { v1, p0, v3, v3, v2 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
  :L1
  .line 381
    return-object v0
  :L2
  .line 384
    goto :L4
  :L3
  .line 383
    move-exception v0
  :L4
  .line 385
    return-object p0
.end method

.method public static square(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
  .catchall { :L0 .. :L8 } :L10
  .registers 14
  .line 430
    if-nez p0, :L0
  .line 431
    const/4 p0, 0
    return-object p0
  :L0
  .line 434
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v0
  .line 435
    invoke-virtual { p0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v1
  .line 436
    if-lez v0, :L9
    if-lez v1, :L9
    if-lez p1, :L9
  .line 437
    if-ne v0, p1, :L1
    if-ne v1, p1, :L1
  .line 438
    return-object p0
  :L1
  .line 440
    new-instance v2, Landroid/graphics/Paint;
    invoke-direct { v2 }, Landroid/graphics/Paint;-><init>()V
  .line 441
    const/4 v3, 1
    invoke-virtual { v2, v3 }, Landroid/graphics/Paint;->setFilterBitmap(Z)V
  .line 442
    invoke-virtual { v2, v3 }, Landroid/graphics/Paint;->setAntiAlias(Z)V
  .line 446
    nop
  .line 447
    const/4 v4, 0
    const/4 v6, 0
    move-object v5, p0
  :L2
  .line 448
    mul-int/lit8 v7, p1, 2
    if-lt v0, v7, :L5
    if-lt v1, v7, :L5
  .line 449
    div-int/lit8 v7, v0, 2
  .line 450
    div-int/lit8 v8, v1, 2
  .line 451
    if-lez v7, :L5
    if-gtz v8, :L3
    goto :L5
  :L3
  .line 452
    sget-object v9, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v7, v8, v9 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v9
  .line 453
    new-instance v10, Landroid/graphics/Canvas;
    invoke-direct { v10, v9 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 454
    new-instance v11, Landroid/graphics/Rect;
    invoke-direct { v11, v4, v4, v0, v1 }, Landroid/graphics/Rect;-><init>(IIII)V
    new-instance v0, Landroid/graphics/Rect;
    invoke-direct { v0, v4, v4, v7, v8 }, Landroid/graphics/Rect;-><init>(IIII)V
    invoke-virtual { v10, v5, v11, v0, v2 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 455
    if-eqz v6, :L4
  .line 456
    invoke-virtual { v5 }, Landroid/graphics/Bitmap;->recycle()V
  :L4
  .line 458
    nop
  .line 459
    nop
  .line 460
    nop
  .line 461
    nop
  .line 462
    move v0, v7
    move v1, v8
    move-object v5, v9
    const/4 v6, 1
    goto :L2
  :L5
  .line 464
    if-gt v0, v1, :L6
    move v3, v0
    goto :L7
  :L6
    move v3, v1
  :L7
  .line 465
    sub-int/2addr v0, v3
    div-int/lit8 v0, v0, 2
  .line 466
    sub-int/2addr v1, v3
    div-int/lit8 v1, v1, 2
  .line 467
    new-instance v7, Landroid/graphics/Rect;
    add-int v8, v0, v3
    add-int/2addr v3, v1
    invoke-direct { v7, v0, v1, v8, v3 }, Landroid/graphics/Rect;-><init>(IIII)V
  .line 468
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { p1, p1, v0 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v0
  .line 469
    new-instance v1, Landroid/graphics/Canvas;
    invoke-direct { v1, v0 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 470
    new-instance v3, Landroid/graphics/Rect;
    invoke-direct { v3, v4, v4, p1, p1 }, Landroid/graphics/Rect;-><init>(IIII)V
  .line 471
    invoke-virtual { v1, v5, v7, v3, v2 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 472
    if-eqz v6, :L8
  .line 473
    invoke-virtual { v5 }, Landroid/graphics/Bitmap;->recycle()V
  :L8
  .line 475
    return-object v0
  :L9
  .line 478
    goto :L11
  :L10
  .line 477
    move-exception p1
  :L11
  .line 479
    return-object p0
.end method

.method public static tilt(Lcom/innioasis/y1/base/BasePlayerActivity;)V
  .catchall { :L0 .. :L7 } :L8
  .registers 10
  .line 134
    if-nez p0, :L0
    return-void
  :L0
  .line 135
    invoke-virtual { p0 }, Lcom/innioasis/y1/base/BasePlayerActivity;->getVb()Landroidx/viewbinding/ViewBinding;
    move-result-object p0
    check-cast p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;
  .line 136
    if-nez p0, :L1
    return-void
  :L1
  .line 138
    iget-object v6, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->coverBg:Lcom/innioasis/y1/view/ReflectImageView;
  .line 139
    if-nez v6, :L2
    return-void
  :L2
  .line 140
    nop
  .line 141
    invoke-virtual { v6 }, Lcom/innioasis/y1/view/ReflectImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
    move-object v1, v0
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 142
    if-nez v1, :L3
    return-void
  :L3
  .line 143
    invoke-static { v1 }, Lcom/innioasis/ipp/Cover;->capture(Landroid/view/ViewGroup$MarginLayoutParams;)V
  .line 147
    invoke-static { }, Lcom/innioasis/ipp/Cover;->flatCover()Z
    move-result v0
  .line 148
    sget v2, Lcom/innioasis/ipp/Cover;->boxW:I
    invoke-static { v1 }, Lcom/innioasis/ipp/Cover;->leftOf(Landroid/view/ViewGroup$MarginLayoutParams;)I
    move-result v3
    invoke-static { p0, v2, v3 }, Lcom/innioasis/ipp/Cover;->inset(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;II)I
    move-result v3
    sub-int/2addr v2, v3
  .line 149
    sget-object v3, Landroid/widget/ImageView$ScaleType;->FIT_START:Landroid/widget/ImageView$ScaleType;
    invoke-virtual { v6, v3 }, Lcom/innioasis/y1/view/ReflectImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
  .line 151
    const/4 v3, 0
    const/4 v4, 0
    if-eqz v0, :L4
  .line 152
    invoke-virtual { v6, v3 }, Lcom/innioasis/y1/view/ReflectImageView;->setRotationY(F)V
  .line 153
    sget v0, Lcom/innioasis/ipp/Cover;->boxW:I
    sub-int/2addr v0, v2
    invoke-virtual { v6, v4, v4, v0, v4 }, Lcom/innioasis/y1/view/ReflectImageView;->setPadding(IIII)V
  .line 154
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
  .line 155
    return-void
  :L4
  .line 157
    invoke-virtual { v6, v4, v4, v4, v4 }, Lcom/innioasis/y1/view/ReflectImageView;->setPadding(IIII)V
  .line 160
    invoke-virtual { v6 }, Lcom/innioasis/y1/view/ReflectImageView;->getHeight()I
    move-result v0
    int-to-float v0, v0
  .line 161
    cmpg-float v4, v0, v3
    if-gtz v4, :L5
    iget v0, v1, Landroid/view/ViewGroup$MarginLayoutParams;->height:I
    int-to-float v0, v0
  :L5
  .line 162
    invoke-virtual { v6, v3 }, Lcom/innioasis/y1/view/ReflectImageView;->setPivotX(F)V
  .line 163
    const/high16 v7, 0x40400000
    cmpl-float v3, v0, v3
    if-lez v3, :L6
    div-float/2addr v0, v7
    invoke-virtual { v6, v0 }, Lcom/innioasis/y1/view/ReflectImageView;->setPivotY(F)V
  :L6
  .line 164
    const/high16 v0, 0x41A00000
    invoke-virtual { v6, v0 }, Lcom/innioasis/y1/view/ReflectImageView;->setRotationY(F)V
  .line 168
    invoke-static { v6, v2 }, Lcom/innioasis/ipp/Cover;->tiltWidth(Lcom/innioasis/y1/view/ReflectImageView;I)I
    move-result v2
  .line 169
    int-to-float v0, v2
    sget v3, Lcom/innioasis/ipp/Cover;->boxH:I
    int-to-float v3, v3
    mul-float v0, v0, v3
    sget v3, Lcom/innioasis/ipp/Cover;->boxW:I
    int-to-float v3, v3
    div-float/2addr v0, v3
    invoke-static { v0 }, Ljava/lang/Math;->round(F)I
    move-result v8
  .line 170
    invoke-static { p0, v1, v2 }, Lcom/innioasis/ipp/Cover;->topFor(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;Landroid/view/ViewGroup$MarginLayoutParams;I)I
    move-result v4
    invoke-static { v1 }, Lcom/innioasis/ipp/Cover;->leftOf(Landroid/view/ViewGroup$MarginLayoutParams;)I
    move-result v5
    move-object v0, v6
    move v3, v8
    invoke-static/range { v0 .. v5 }, Lcom/innioasis/ipp/Cover;->box(Lcom/innioasis/y1/view/ReflectImageView;Landroid/view/ViewGroup$MarginLayoutParams;IIII)V
  .line 171
    if-lez v8, :L7
    int-to-float p0, v8
    div-float/2addr p0, v7
    invoke-virtual { v6, p0 }, Lcom/innioasis/y1/view/ReflectImageView;->setPivotY(F)V
  :L7
  .line 173
    goto :L9
  :L8
  .line 172
    move-exception p0
  :L9
  .line 174
    return-void
.end method

.method private static tiltWidth(Lcom/innioasis/y1/view/ReflectImageView;I)I
  .catchall { :L0 .. :L11 } :L12
  .registers 9
  .line 215
    if-gtz p1, :L1
  :L0
    sget p0, Lcom/innioasis/ipp/Cover;->boxW:I
    return p0
  :L1
  .line 216
    invoke-virtual { p0 }, Lcom/innioasis/y1/view/ReflectImageView;->getMatrix()Landroid/graphics/Matrix;
    move-result-object v0
  .line 217
    if-eqz v0, :L10
    invoke-virtual { v0 }, Landroid/graphics/Matrix;->isIdentity()Z
    move-result v1
    if-eqz v1, :L2
    goto :L10
  :L2
  .line 218
    invoke-virtual { p0 }, Lcom/innioasis/y1/view/ReflectImageView;->getPivotY()F
    move-result p0
  .line 219
    int-to-float v1, p1
  .line 220
    const/high16 v2, 0x40400000
    mul-float v2, v2, v1
  .line 221
    invoke-static { v0, v2, p0 }, Lcom/innioasis/ipp/Cover;->mapX(Landroid/graphics/Matrix;FF)F
    move-result v3
    cmpg-float v3, v3, v1
    if-gez v3, :L3
    invoke-static { v2 }, Ljava/lang/Math;->round(F)I
    move-result p0
    return p0
  :L3
  .line 222
    const/4 v3, 0
    move v4, v1
  :L4
    const/16 v5, 24
    const/high16 v6, 0x3F000000
    if-ge v3, v5, :L7
  .line 223
    add-float v5, v4, v2
    mul-float v5, v5, v6
  .line 224
    invoke-static { v0, v5, p0 }, Lcom/innioasis/ipp/Cover;->mapX(Landroid/graphics/Matrix;FF)F
    move-result v6
    cmpg-float v6, v6, v1
    if-gez v6, :L5
    move v4, v5
    goto :L6
  :L5
    move v2, v5
  :L6
  .line 222
    add-int/lit8 v3, v3, 1
    goto :L4
  :L7
  .line 226
    add-float/2addr v4, v2
    mul-float v4, v4, v6
    invoke-static { v4 }, Ljava/lang/Math;->round(F)I
    move-result p0
  .line 227
    if-ge p0, p1, :L8
    goto :L9
  :L8
    move p1, p0
  :L9
    return p1
  :L10
  .line 217
    sget p0, Lcom/innioasis/ipp/Cover;->boxW:I
  :L11
    return p0
  :L12
  .line 228
    move-exception p0
  .line 229
    sget p0, Lcom/innioasis/ipp/Cover;->boxW:I
    return p0
.end method

.method private static topFor(Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;Landroid/view/ViewGroup$MarginLayoutParams;I)I
  .catchall { :L0 .. :L2 } :L5
  .registers 4
  :L0
  .line 248
    iget-object v0, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->musicInfoLl:Landroidx/constraintlayout/widget/ConstraintLayout;
  .line 249
    invoke-virtual { v0 }, Landroidx/constraintlayout/widget/ConstraintLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v0
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 250
    iget-object p0, p0, Lcom/innioasis/y1/databinding/ActivityMusicPlayerBinding;->musicInfoLl:Landroidx/constraintlayout/widget/ConstraintLayout;
    invoke-static { p0 }, Lcom/innioasis/ipp/Cover;->rowsHeight(Landroid/view/ViewGroup;)I
    move-result p0
  .line 251
    if-gtz p0, :L1
    iget p0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    return p0
  :L1
  .line 252
    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    sub-int/2addr p0, p2
    div-int/lit8 p0, p0, 2
  :L2
    add-int/2addr v0, p0
  .line 253
    if-lez v0, :L3
    goto :L4
  :L3
    const/4 v0, 0
  :L4
    return v0
  :L5
  .line 254
    move-exception p0
  .line 255
    iget p0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    return p0
.end method
