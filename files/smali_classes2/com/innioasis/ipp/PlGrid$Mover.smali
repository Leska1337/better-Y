.class final Lcom/innioasis/ipp/PlGrid$Mover;
.super Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;
.source "PlGrid.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/PlGrid;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Mover"
.end annotation

.field private final static FADE_MS:J = 60L

.field private final static PHOTO_RING:F = 2.0F

.field private final static RATE:F = 22.0F

.field private final static VMAX:F = 6000.0F

.field private final static VMIN:F = 700.0F

.field private final draw:Landroid/graphics/RectF;

.field private drawn:J

.field private edge:F

.field private fa:F

.field private final fade:Landroid/graphics/Paint;

.field private focus:I

.field private h:F

.field private has:Z

.field private inner:F

.field private l:F

.field private last:J

.field private leg:Z

.field private legPos:I

.field private lx:F

.field private ly:F

.field private off:I

.field private pIn:F

.field private pRad:F

.field private final paint:Landroid/graphics/Paint;

.field private pc:I

.field private pe:F

.field private ph:F

.field private final photos:Z

.field private pic:Landroid/graphics/Bitmap;

.field private pitch:I

.field private placed:Z

.field private pr:F

.field private pw:F

.field private radius:F

.field private rim:F

.field private final ring:Landroid/graphics/Path;

.field private span:I

.field private sy:F

.field private t:F

.field private tx:F

.field private txPos:I

.field private w:F

.field private was:Z

.field private watched:Ljava/lang/ref/WeakReference;

.method constructor <init>(Z)V
  .registers 4
  .line 377
    invoke-direct { p0 }, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;-><init>()V
  .line 328
    new-instance v0, Landroid/graphics/Paint;
    const/4 v1, 1
    invoke-direct { v0, v1 }, Landroid/graphics/Paint;-><init>(I)V
    iput-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->paint:Landroid/graphics/Paint;
  .line 330
    new-instance v0, Landroid/graphics/RectF;
    invoke-direct { v0 }, Landroid/graphics/RectF;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->draw:Landroid/graphics/RectF;
  .line 331
    new-instance v0, Landroid/graphics/Path;
    invoke-direct { v0 }, Landroid/graphics/Path;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->ring:Landroid/graphics/Path;
  .line 340
    iput v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->span:I
  .line 342
    const/high16 v0, 0x3F800000
    iput v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
  .line 348
    new-instance v0, Landroid/graphics/Paint;
    invoke-direct { v0 }, Landroid/graphics/Paint;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->fade:Landroid/graphics/Paint;
  .line 378
    iput-boolean p1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->photos:Z
  .line 379
    return-void
.end method

.method private static box(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;IZ)[F
  .registers 6
  .line 492
    if-eqz p3, :L0
    invoke-virtual { p0 }, Landroid/view/View;->getPaddingLeft()I
    move-result v0
    int-to-float v0, v0
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    const/4 v1, 0
    if-eqz p3, :L2
    invoke-virtual { p0 }, Landroid/view/View;->getPaddingTop()I
    move-result p3
    goto :L3
  :L2
    const/4 p3, 0
  :L3
    add-int/2addr p3, p2
    int-to-float p2, p3
  .line 493
    nop
  :L4
    if-eqz p0, :L6
    if-eq p0, p1, :L6
  .line 494
    invoke-virtual { p0 }, Landroid/view/View;->getLeft()I
    move-result p3
    int-to-float p3, p3
    add-float/2addr v0, p3
  .line 495
    invoke-virtual { p0 }, Landroid/view/View;->getTop()I
    move-result p3
    int-to-float p3, p3
    add-float/2addr p2, p3
  .line 496
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p3
    instance-of p3, p3, Landroid/view/View;
    if-nez p3, :L5
    goto :L6
  :L5
  .line 493
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
    check-cast p0, Landroid/view/View;
    goto :L4
  :L6
  .line 498
    const/4 p0, 2
    new-array p0, p0, [F
    aput v0, p0, v1
    const/4 p1, 1
    aput p2, p0, p1
    return-object p0
.end method

.method private frame(Landroid/graphics/Canvas;FFI)V
  .registers 13
  .line 453
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pic:Landroid/graphics/Bitmap;
    if-eqz v0, :L0
    iget v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pw:F
    iget v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->w:F
    cmpl-float v0, v0, v1
    if-nez v0, :L0
    iget v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->ph:F
    iget v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->h:F
    cmpl-float v0, v0, v1
    if-nez v0, :L0
    iget v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pe:F
    iget v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->edge:F
    cmpl-float v0, v0, v1
    if-nez v0, :L0
    iget v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pr:F
    iget v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->rim:F
    cmpl-float v0, v0, v1
    if-nez v0, :L0
    iget v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pc:I
    if-ne v0, p4, :L0
    iget v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pRad:F
    iget v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->radius:F
    cmpl-float v0, v0, v1
    if-nez v0, :L0
    iget v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pIn:F
    iget v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->inner:F
    cmpl-float v0, v0, v1
    if-eqz v0, :L6
  :L0
  .line 455
    iget v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->w:F
    float-to-double v0, v0
    invoke-static { v0, v1 }, Ljava/lang/Math;->ceil(D)D
    move-result-wide v0
    double-to-int v0, v0
    iget v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->h:F
    float-to-double v1, v1
    invoke-static { v1, v2 }, Ljava/lang/Math;->ceil(D)D
    move-result-wide v1
    double-to-int v1, v1
  .line 456
    if-lez v0, :L9
    if-gtz v1, :L1
    goto/16 :L9
  :L1
  .line 457
    iget-object v2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pic:Landroid/graphics/Bitmap;
    if-eqz v2, :L3
    invoke-virtual { v2 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v2
    if-ne v2, v0, :L3
    iget-object v2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pic:Landroid/graphics/Bitmap;
    invoke-virtual { v2 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v2
    if-eq v2, v1, :L2
    goto :L3
  :L2
  .line 460
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pic:Landroid/graphics/Bitmap;
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/graphics/Bitmap;->eraseColor(I)V
    goto :L4
  :L3
  .line 458
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v0, v1, v2 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pic:Landroid/graphics/Bitmap;
  :L4
  .line 462
    new-instance v0, Landroid/graphics/Canvas;
    iget-object v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pic:Landroid/graphics/Bitmap;
    invoke-direct { v0, v1 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 463
    iget-object v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->draw:Landroid/graphics/RectF;
    iget v2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->w:F
    iget v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->h:F
    const/4 v7, 0
    invoke-virtual { v1, v7, v7, v2, v3 }, Landroid/graphics/RectF;->set(FFFF)V
  .line 464
    iget v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->edge:F
    iget v4, p0, Lcom/innioasis/ipp/PlGrid$Mover;->radius:F
    iget v5, p0, Lcom/innioasis/ipp/PlGrid$Mover;->inner:F
    move-object v1, p0
    move-object v2, v0
    move v6, p4
    invoke-direct/range { v1 .. v6 }, Lcom/innioasis/ipp/PlGrid$Mover;->ring(Landroid/graphics/Canvas;FFFI)V
  .line 465
    iget v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->rim:F
    cmpl-float v1, v3, v7
    if-lez v1, :L5
    iget v4, p0, Lcom/innioasis/ipp/PlGrid$Mover;->inner:F
    sub-float v1, v4, v3
    invoke-static { v7, v1 }, Ljava/lang/Math;->max(FF)F
    move-result v5
    invoke-static { p4 }, Lcom/innioasis/ipp/PlGrid;->access$300(I)I
    move-result v6
    move-object v1, p0
    move-object v2, v0
    invoke-direct/range { v1 .. v6 }, Lcom/innioasis/ipp/PlGrid$Mover;->ring(Landroid/graphics/Canvas;FFFI)V
  :L5
  .line 466
    iget v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->w:F
    iput v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pw:F
    iget v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->h:F
    iput v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->ph:F
    iget v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->edge:F
    iput v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pe:F
    iget v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->rim:F
    iput v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pr:F
    iput p4, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pc:I
    iget p4, p0, Lcom/innioasis/ipp/PlGrid$Mover;->radius:F
    iput p4, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pRad:F
    iget p4, p0, Lcom/innioasis/ipp/PlGrid$Mover;->inner:F
    iput p4, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pIn:F
  :L6
  .line 468
    iget-object p4, p0, Lcom/innioasis/ipp/PlGrid$Mover;->fade:Landroid/graphics/Paint;
    const/high16 v0, 0x437F0000
    iget v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
    mul-float v1, v1, v0
    invoke-static { v1 }, Ljava/lang/Math;->round(F)I
    move-result v0
    invoke-virtual { p4, v0 }, Landroid/graphics/Paint;->setAlpha(I)V
  .line 469
    iget-object p4, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pic:Landroid/graphics/Bitmap;
    invoke-static { p2 }, Ljava/lang/Math;->round(F)I
    move-result p2
    int-to-float p2, p2
    invoke-static { p3 }, Ljava/lang/Math;->round(F)I
    move-result p3
    int-to-float p3, p3
    iget v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
    const/high16 v1, 0x3F800000
    cmpg-float v0, v0, v1
    if-gez v0, :L7
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->fade:Landroid/graphics/Paint;
    goto :L8
  :L7
    const/4 v0, 0
  :L8
    invoke-virtual { p1, p4, p2, p3, v0 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
  .line 470
    return-void
  :L9
  .line 456
    return-void
.end method

.method private static glide(FFF)F
  .registers 6
  .line 503
    sub-float v0, p1, p0
    invoke-static { v0 }, Ljava/lang/Math;->abs(F)F
    move-result v1
  .line 504
    const/high16 v2, 0x3F800000
    cmpg-float v2, v1, v2
    if-gez v2, :L0
    return p1
  :L0
  .line 505
    const/high16 p1, 0x41B00000
    mul-float p1, p1, v1
    const v2, 1169915904
    invoke-static { v2, p1 }, Ljava/lang/Math;->min(FF)F
    move-result p1
    const/high16 v2, 0x442F0000
    invoke-static { v2, p1 }, Ljava/lang/Math;->max(FF)F
    move-result p1
    mul-float p1, p1, p2
    invoke-static { v1, p1 }, Ljava/lang/Math;->min(FF)F
    move-result p1
  .line 506
    const/4 p2, 0
    cmpl-float p2, v0, p2
    if-lez p2, :L1
    goto :L2
  :L1
    neg-float p1, p1
  :L2
    add-float/2addr p0, p1
    return p0
.end method

.method private measure(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 7
  .line 356
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v0
  .line 357
    instance-of v1, v0, Landroidx/recyclerview/widget/GridLayoutManager;
    if-eqz v1, :L0
    move-object v1, v0
    check-cast v1, Landroidx/recyclerview/widget/GridLayoutManager;
    invoke-virtual { v1 }, Landroidx/recyclerview/widget/GridLayoutManager;->getSpanCount()I
    move-result v1
    goto :L1
  :L0
    const/4 v1, 1
  :L1
    iput v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->span:I
  .line 358
    const/4 v1, 0
  :L2
    if-eqz v0, :L4
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v2
    if-ge v1, v2, :L4
  .line 359
    invoke-virtual { p1, v1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v2
  .line 360
    invoke-virtual { p1, v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I
    move-result v3
  .line 361
    const/4 v4, -1
    if-ne v3, v4, :L3
  .line 358
    add-int/lit8 v1, v1, 1
    goto :L2
  :L3
  .line 362
    invoke-virtual { v2 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object p1
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 363
    invoke-virtual { v0, v2 }, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getDecoratedMeasuredHeight(Landroid/view/View;)I
    move-result v1
    iget v4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    add-int/2addr v1, v4
    iget v4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I
    add-int/2addr v1, v4
    iput v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pitch:I
  .line 364
    iget v4, p0, Lcom/innioasis/ipp/PlGrid$Mover;->span:I
    div-int/2addr v3, v4
    mul-int v3, v3, v1
    invoke-virtual { v0, v2 }, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getDecoratedTop(Landroid/view/View;)I
    move-result v0
    iget p1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    sub-int/2addr v0, p1
    sub-int/2addr v3, v0
    iput v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->off:I
  .line 365
    return-void
  :L4
  .line 367
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollOffset()I
    move-result p1
    iput p1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->off:I
  .line 368
    return-void
.end method

.method private project(Landroidx/recyclerview/widget/RecyclerView;I)[F
  .registers 8
  .line 434
    const/4 v0, 0
  :L0
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v1
    if-ge v0, v1, :L4
  .line 435
    invoke-virtual { p1, v0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v1
  .line 436
    invoke-virtual { p1, v1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I
    move-result v2
  .line 437
    const/4 v3, -1
    if-eq v2, v3, :L3
    iget v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->span:I
    rem-int v4, v2, v3
    rem-int v3, p2, v3
    if-eq v4, v3, :L1
    goto :L3
  :L1
  .line 438
    invoke-direct { p0, v1, p1 }, Lcom/innioasis/ipp/PlGrid$Mover;->shape(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;)[F
    move-result-object v1
  .line 439
    if-nez v1, :L2
    goto :L3
  :L2
  .line 440
    const/4 p1, 1
    aget v0, v1, p1
    iget v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->span:I
    div-int/2addr p2, v3
    div-int/2addr v2, v3
    sub-int/2addr p2, v2
    iget v2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pitch:I
    mul-int p2, p2, v2
    int-to-float p2, p2
    add-float/2addr v0, p2
    aput v0, v1, p1
  .line 441
    return-object v1
  :L3
  .line 434
    add-int/lit8 v0, v0, 1
    goto :L0
  :L4
  .line 443
    const/4 p1, 0
    return-object p1
.end method

.method private rested(Z)Z
  .registers 3
  .line 476
    iget-boolean v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->was:Z
    if-eqz v0, :L0
    if-nez p1, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
  .line 477
    iput-boolean p1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->was:Z
  .line 478
    return v0
.end method

.method private ring(Landroid/graphics/Canvas;FFFI)V
  .registers 9
  .line 511
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->ring:Landroid/graphics/Path;
    invoke-virtual { v0 }, Landroid/graphics/Path;->reset()V
  .line 512
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->ring:Landroid/graphics/Path;
    sget-object v1, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;
    invoke-virtual { v0, v1 }, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V
  .line 513
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->ring:Landroid/graphics/Path;
    iget-object v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->draw:Landroid/graphics/RectF;
    sget-object v2, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;
    invoke-virtual { v0, v1, p3, p3, v2 }, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V
  .line 514
    iget-object p3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->draw:Landroid/graphics/RectF;
    invoke-virtual { p3, p2, p2 }, Landroid/graphics/RectF;->inset(FF)V
  .line 515
    iget-object p2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->ring:Landroid/graphics/Path;
    iget-object p3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->draw:Landroid/graphics/RectF;
    sget-object v0, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;
    invoke-virtual { p2, p3, p4, p4, v0 }, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V
  .line 516
    iget-object p2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->paint:Landroid/graphics/Paint;
    invoke-virtual { p2, p5 }, Landroid/graphics/Paint;->setColor(I)V
  .line 517
    iget-object p2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->ring:Landroid/graphics/Path;
    iget-object p3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->paint:Landroid/graphics/Paint;
    invoke-virtual { p1, p2, p3 }, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V
  .line 518
    return-void
.end method

.method private shape(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;)[F
  .registers 11
  .line 402
    const v0, 2131362091
    invoke-virtual { p1, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 403
    const v1, 2131361934
    invoke-virtual { p1, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 404
    const v2, 2131362087
    invoke-virtual { p1, v2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v2
  .line 405
    instance-of v3, v1, Landroidx/cardview/widget/CardView;
    const/4 v4, 0
    if-eqz v3, :L5
    if-nez v2, :L0
    goto/16 :L5
  :L0
  .line 406
    iget-boolean v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->photos:Z
    const/4 v5, 1
    const/4 v6, 0
    const/4 v7, 0
    if-eqz v3, :L1
  .line 407
    invoke-virtual { p1 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object p1
    invoke-virtual { p1 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object p1
    iget p1, p1, Landroid/util/DisplayMetrics;->density:F
    const/high16 v0, 0x40000000
    mul-float p1, p1, v0
  .line 408
    iget v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->off:I
    invoke-static { v2, p2, v3, v7 }, Lcom/innioasis/ipp/PlGrid$Mover;->box(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;IZ)[F
    move-result-object p2
  .line 409
    invoke-virtual { v2 }, Landroid/view/View;->getWidth()I
    move-result v3
    int-to-float v3, v3
    mul-float v0, v0, p1
    add-float/2addr v3, v0
    iput v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->w:F
  .line 410
    invoke-virtual { v2 }, Landroid/view/View;->getHeight()I
    move-result v2
    int-to-float v2, v2
    add-float/2addr v2, v0
    iput v2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->h:F
  .line 411
    iput p1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->edge:F
  .line 412
    iput v6, p0, Lcom/innioasis/ipp/PlGrid$Mover;->rim:F
  .line 413
    check-cast v1, Landroidx/cardview/widget/CardView;
    invoke-virtual { v1 }, Landroidx/cardview/widget/CardView;->getRadius()F
    move-result v0
    iput v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->radius:F
  .line 414
    iput v6, p0, Lcom/innioasis/ipp/PlGrid$Mover;->inner:F
  .line 415
    const/4 v0, 2
    new-array v0, v0, [F
    aget v1, p2, v7
    sub-float/2addr v1, p1
    aput v1, v0, v7
    aget p2, p2, v5
    sub-float/2addr p2, p1
    aput p2, v0, v5
    return-object v0
  :L1
  .line 417
    instance-of p1, v0, Landroidx/cardview/widget/CardView;
    if-nez p1, :L2
    return-object v4
  :L2
  .line 420
    iget p1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->off:I
    invoke-static { v0, p2, p1, v5 }, Lcom/innioasis/ipp/PlGrid$Mover;->box(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;IZ)[F
    move-result-object p1
  .line 421
    iget v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->off:I
    invoke-static { v1, p2, v3, v5 }, Lcom/innioasis/ipp/PlGrid$Mover;->box(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;IZ)[F
    move-result-object v3
    iget v4, p0, Lcom/innioasis/ipp/PlGrid$Mover;->off:I
    invoke-static { v2, p2, v4, v7 }, Lcom/innioasis/ipp/PlGrid$Mover;->box(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;IZ)[F
    move-result-object p2
  .line 422
    invoke-virtual { v0 }, Landroid/view/View;->getWidth()I
    move-result v2
    invoke-virtual { v0 }, Landroid/view/View;->getPaddingLeft()I
    move-result v4
    sub-int/2addr v2, v4
    invoke-virtual { v0 }, Landroid/view/View;->getPaddingRight()I
    move-result v4
    sub-int/2addr v2, v4
    int-to-float v2, v2
    iput v2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->w:F
  .line 423
    invoke-virtual { v0 }, Landroid/view/View;->getHeight()I
    move-result v2
    invoke-virtual { v0 }, Landroid/view/View;->getPaddingTop()I
    move-result v4
    sub-int/2addr v2, v4
    invoke-virtual { v0 }, Landroid/view/View;->getPaddingBottom()I
    move-result v4
    sub-int/2addr v2, v4
    int-to-float v2, v2
    iput v2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->h:F
  .line 424
    aget v2, v3, v7
    aget v4, p1, v7
    sub-float/2addr v2, v4
    const/high16 v4, 0x3F800000
    invoke-static { v4, v2 }, Ljava/lang/Math;->max(FF)F
    move-result v2
    iput v2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->edge:F
  .line 426
    const v2, 2131362561
    invoke-virtual { v1, v2 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object v2
    if-nez v2, :L3
    goto :L4
  :L3
    aget p2, p2, v7
    aget v2, v3, v7
    sub-float/2addr p2, v2
    invoke-static { v6, p2 }, Ljava/lang/Math;->max(FF)F
    move-result v6
  :L4
    iput v6, p0, Lcom/innioasis/ipp/PlGrid$Mover;->rim:F
  .line 427
    check-cast v0, Landroidx/cardview/widget/CardView;
    invoke-virtual { v0 }, Landroidx/cardview/widget/CardView;->getRadius()F
    move-result p2
    iput p2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->radius:F
  .line 428
    check-cast v1, Landroidx/cardview/widget/CardView;
    invoke-virtual { v1 }, Landroidx/cardview/widget/CardView;->getRadius()F
    move-result p2
    iput p2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->inner:F
  .line 429
    return-object p1
  :L5
  .line 405
    return-object v4
.end method

.method private watch(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .registers 3
  .line 383
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->watched:Ljava/lang/ref/WeakReference;
    if-eqz v0, :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    if-ne v0, p1, :L0
    return-void
  :L0
  .line 384
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->watched:Ljava/lang/ref/WeakReference;
  .line 385
    new-instance v0, Lcom/innioasis/ipp/PlGrid$Snap;
    invoke-direct { v0, p0 }, Lcom/innioasis/ipp/PlGrid$Snap;-><init>(Lcom/innioasis/ipp/PlGrid$Mover;)V
    invoke-virtual { p1, v0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->registerAdapterDataObserver(Landroidx/recyclerview/widget/RecyclerView$AdapterDataObserver;)V
  .line 386
    return-void
.end method

.method along(I)Z
  .registers 4
  .line 483
    iget-boolean v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
    if-eqz v0, :L0
    iget-boolean v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->leg:Z
    if-nez v0, :L0
    iget v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->span:I
    if-lez v0, :L0
    iget v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
    iget v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->tx:F
    sub-float/2addr v0, v1
    invoke-static { v0 }, Ljava/lang/Math;->abs(F)F
    move-result v0
    const/high16 v1, 0x3F800000
    cmpl-float v0, v0, v1
    if-ltz v0, :L0
    iget v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->span:I
    div-int/2addr p1, v0
    iget v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->txPos:I
    div-int/2addr v1, v0
    if-eq p1, v1, :L0
    const/4 p1, 1
    goto :L1
  :L0
    const/4 p1, 0
  :L1
    return p1
.end method

.method public onDraw(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V
  .catchall { :L0 .. :L33 } :L34
  .registers 21
  .line 523
    move-object/from16 v1, p0
    move-object/from16 v0, p2
  :L0
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    iput-wide v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->drawn:J
  .line 524
    invoke-virtual/range { p2 .. p2 }, Landroidx/recyclerview/widget/RecyclerView;->getContext()Landroid/content/Context;
    move-result-object v2
  .line 525
    invoke-virtual/range { p2 .. p2 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v3
  .line 526
    const/high16 v4, 0x3F800000
    const/4 v5, 0
    if-eqz v3, :L31
    invoke-static { v2 }, Lcom/innioasis/ipp/PlGrid;->access$400(Landroid/content/Context;)Z
    move-result v2
    if-nez v2, :L31
    instance-of v2, v3, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-eqz v2, :L1
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->access$500()Z
    move-result v2
    if-eqz v2, :L1
    goto/16 :L31
  :L1
  .line 533
    invoke-static/range { p2 .. p2 }, Lcom/innioasis/ipp/Theme;->tilesAhead(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 534
    invoke-direct { v1, v0 }, Lcom/innioasis/ipp/PlGrid$Mover;->measure(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 535
    invoke-static/range { p2 .. p2 }, Lcom/innioasis/ipp/PlGrid;->cursorAt(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result v2
  .line 536
    iget-boolean v6, v1, Lcom/innioasis/ipp/PlGrid$Mover;->photos:Z
    if-eqz v6, :L2
    invoke-direct { v1, v3 }, Lcom/innioasis/ipp/PlGrid$Mover;->watch(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
  :L2
  .line 537
    invoke-virtual/range { p2 .. p2 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v3
    const/4 v6, 0
    if-nez v3, :L3
    move-object v3, v6
    goto :L4
  :L3
  .line 538
    invoke-virtual/range { p2 .. p2 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v3
    invoke-virtual { v3, v2 }, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object v3
  :L4
  .line 539
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v7
  .line 540
    nop
  .line 541
    if-nez v3, :L5
    goto :L6
  :L5
    invoke-direct { v1, v3, v0 }, Lcom/innioasis/ipp/PlGrid$Mover;->shape(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;)[F
    move-result-object v6
  :L6
  .line 542
    if-nez v6, :L7
    iget-boolean v3, v1, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
    if-eqz v3, :L7
  .line 544
    invoke-direct { v1, v0, v2 }, Lcom/innioasis/ipp/PlGrid$Mover;->project(Landroidx/recyclerview/widget/RecyclerView;I)[F
    move-result-object v6
  :L7
  .line 546
    const-wide/16 v9, 0
    const/4 v3, 1
    if-eqz v6, :L8
    iget-boolean v11, v1, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
    if-nez v11, :L8
  .line 547
    aget v4, v6, v5
    iput v4, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
    aget v6, v6, v3
    iput v6, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
  .line 548
    iput v4, v1, Lcom/innioasis/ipp/PlGrid$Mover;->tx:F
  .line 549
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->txPos:I
  .line 550
    iput-boolean v3, v1, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
    goto/16 :L25
  :L8
  .line 551
    if-eqz v6, :L25
  .line 552
    iget-wide v11, v1, Lcom/innioasis/ipp/PlGrid$Mover;->last:J
    const/high16 v13, 0x447A0000
    cmp-long v14, v11, v9
    if-nez v14, :L9
    const v11, 1015222895
    goto :L10
  :L9
    sub-long v11, v7, v11
    long-to-float v11, v11
    div-float/2addr v11, v13
    const v12, 1028443341
    invoke-static { v12, v11 }, Ljava/lang/Math;->min(FF)F
    move-result v11
  :L10
  .line 553
    invoke-static/range { p2 .. p2 }, Lcom/innioasis/ipp/Wheel$Glider;->left(Landroidx/recyclerview/widget/RecyclerView;)F
    move-result v12
  .line 554
    invoke-static/range { p2 .. p2 }, Lcom/innioasis/ipp/Wheel;->held(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v14
  .line 557
    iget-boolean v15, v1, Lcom/innioasis/ipp/PlGrid$Mover;->leg:Z
    if-nez v15, :L11
    aget v15, v6, v3
    iget v9, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
    cmpl-float v9, v15, v9
    if-eqz v9, :L11
    iget v9, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
    iget v10, v1, Lcom/innioasis/ipp/PlGrid$Mover;->tx:F
    sub-float/2addr v9, v10
    invoke-static { v9 }, Ljava/lang/Math;->abs(F)F
    move-result v9
    cmpl-float v9, v9, v4
    if-ltz v9, :L11
    const/4 v9, 1
    goto :L12
  :L11
    const/4 v9, 0
  :L12
  .line 558
    iget-boolean v10, v1, Lcom/innioasis/ipp/PlGrid$Mover;->leg:Z
    const/4 v15, 0
    if-nez v10, :L17
    aget v10, v6, v3
    iget v13, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
    cmpl-float v10, v10, v13
    if-eqz v10, :L17
    if-nez v9, :L17
  .line 559
    if-eqz v14, :L13
    invoke-static/range { p2 .. p2 }, Lcom/innioasis/ipp/Wheel;->releaseSoon(Landroidx/recyclerview/widget/RecyclerView;)V
  :L13
  .line 560
    aget v10, v6, v3
    iget v13, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
    sub-float/2addr v10, v13
    invoke-static { v10 }, Ljava/lang/Math;->abs(F)F
    move-result v10
    iget v13, v1, Lcom/innioasis/ipp/PlGrid$Mover;->pitch:I
    int-to-float v13, v13
    const/high16 v16, 0x3FC00000
    mul-float v13, v13, v16
    cmpg-float v10, v10, v13
    if-lez v10, :L15
    cmpl-float v10, v12, v15
    if-nez v10, :L15
    if-eqz v14, :L14
    goto :L15
  :L14
  .line 570
    aget v10, v6, v5
    iput v10, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
  .line 571
    aget v10, v6, v3
    iput v10, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
    goto :L16
  :L15
  .line 564
    iput-boolean v3, v1, Lcom/innioasis/ipp/PlGrid$Mover;->leg:Z
  .line 565
    iget v10, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
    iget v13, v1, Lcom/innioasis/ipp/PlGrid$Mover;->off:I
    int-to-float v13, v13
    sub-float/2addr v10, v13
    iput v10, v1, Lcom/innioasis/ipp/PlGrid$Mover;->sy:F
  .line 566
    iput v4, v1, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
  .line 567
    iput-boolean v5, v1, Lcom/innioasis/ipp/PlGrid$Mover;->placed:Z
  .line 568
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->legPos:I
  :L16
  .line 573
    aget v10, v6, v5
    iput v10, v1, Lcom/innioasis/ipp/PlGrid$Mover;->lx:F
  .line 574
    aget v10, v6, v3
    iput v10, v1, Lcom/innioasis/ipp/PlGrid$Mover;->ly:F
  :L17
  .line 576
    iget-boolean v10, v1, Lcom/innioasis/ipp/PlGrid$Mover;->leg:Z
    if-eqz v10, :L21
  .line 577
    iget v9, v1, Lcom/innioasis/ipp/PlGrid$Mover;->legPos:I
    if-ne v2, v9, :L18
  .line 578
    aget v9, v6, v5
    iput v9, v1, Lcom/innioasis/ipp/PlGrid$Mover;->lx:F
  .line 579
    aget v9, v6, v3
    iput v9, v1, Lcom/innioasis/ipp/PlGrid$Mover;->ly:F
  :L18
  .line 582
    iget-boolean v9, v1, Lcom/innioasis/ipp/PlGrid$Mover;->placed:Z
    if-nez v9, :L19
    invoke-static { v12 }, Ljava/lang/Math;->abs(F)F
    move-result v9
    iget v10, v1, Lcom/innioasis/ipp/PlGrid$Mover;->pitch:I
    int-to-float v10, v10
    const/high16 v12, 0x40000000
    div-float/2addr v10, v12
    cmpg-float v9, v9, v10
    if-gez v9, :L19
    iget v9, v1, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
    cmpl-float v9, v9, v15
    if-nez v9, :L19
    iput-boolean v3, v1, Lcom/innioasis/ipp/PlGrid$Mover;->placed:Z
  :L19
  .line 583
    iget-boolean v9, v1, Lcom/innioasis/ipp/PlGrid$Mover;->placed:Z
    const/high16 v10, 0x42700000
    if-nez v9, :L20
  .line 584
    iget v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
    const/high16 v4, 0x447A0000
    mul-float v11, v11, v4
    div-float/2addr v11, v10
    sub-float/2addr v2, v11
    invoke-static { v15, v2 }, Ljava/lang/Math;->max(FF)F
    move-result v2
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
  .line 585
    iget v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->sy:F
    iget v4, v1, Lcom/innioasis/ipp/PlGrid$Mover;->off:I
    int-to-float v4, v4
    add-float/2addr v2, v4
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
    goto :L23
  :L20
  .line 587
    iget v9, v1, Lcom/innioasis/ipp/PlGrid$Mover;->lx:F
    iput v9, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
  .line 588
    iget v12, v1, Lcom/innioasis/ipp/PlGrid$Mover;->ly:F
    iput v12, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
  .line 589
    iput v9, v1, Lcom/innioasis/ipp/PlGrid$Mover;->tx:F
  .line 590
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->txPos:I
  .line 591
    iget v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
    const/high16 v9, 0x447A0000
    mul-float v11, v11, v9
    div-float/2addr v11, v10
    add-float/2addr v2, v11
    invoke-static { v4, v2 }, Ljava/lang/Math;->min(FF)F
    move-result v2
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
  .line 592
    cmpl-float v2, v2, v4
    if-ltz v2, :L23
    iput-boolean v5, v1, Lcom/innioasis/ipp/PlGrid$Mover;->leg:Z
    goto :L23
  :L21
  .line 594
    if-eqz v9, :L22
  .line 595
    iget v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
    iget v4, v1, Lcom/innioasis/ipp/PlGrid$Mover;->tx:F
    invoke-static { v2, v4, v11 }, Lcom/innioasis/ipp/PlGrid$Mover;->glide(FFF)F
    move-result v2
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
    goto :L23
  :L22
  .line 597
    iget v4, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
    aget v9, v6, v5
    invoke-static { v4, v9, v11 }, Lcom/innioasis/ipp/PlGrid$Mover;->glide(FFF)F
    move-result v4
    iput v4, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
  .line 598
    aget v4, v6, v5
    iput v4, v1, Lcom/innioasis/ipp/PlGrid$Mover;->tx:F
  .line 599
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->txPos:I
  :L23
  .line 601
    iget-boolean v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->leg:Z
    if-nez v2, :L24
    iget v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
    aget v4, v6, v5
    cmpl-float v2, v2, v4
    if-nez v2, :L24
    iget v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
    aget v4, v6, v3
    cmpl-float v2, v2, v4
    if-eqz v2, :L25
  :L24
    const/4 v5, 1
  :L25
  .line 603
    invoke-direct { v1, v5 }, Lcom/innioasis/ipp/PlGrid$Mover;->rested(Z)Z
    move-result v2
    if-eqz v2, :L26
    invoke-static/range { p2 .. p2 }, Lcom/innioasis/ipp/PlGrid$Tidy;->at(Landroidx/recyclerview/widget/RecyclerView;)V
  :L26
  .line 604
    if-eqz v5, :L27
    goto :L28
  :L27
    const-wide/16 v7, 0
  :L28
    iput-wide v7, v1, Lcom/innioasis/ipp/PlGrid$Mover;->last:J
  .line 605
    iget-boolean v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
    if-nez v2, :L29
    return-void
  :L29
  .line 606
    if-eqz v5, :L30
    invoke-virtual/range { p2 .. p2 }, Landroidx/recyclerview/widget/RecyclerView;->postInvalidateOnAnimation()V
  :L30
  .line 608
    goto :L35
  :L31
  .line 527
    invoke-static/range { p2 .. p2 }, Lcom/innioasis/ipp/Wheel;->held(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v2
    if-eqz v2, :L32
    invoke-static/range { p2 .. p2 }, Lcom/innioasis/ipp/Wheel;->releaseSoon(Landroidx/recyclerview/widget/RecyclerView;)V
  :L32
  .line 528
    iput-boolean v5, v1, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
  .line 529
    iput-boolean v5, v1, Lcom/innioasis/ipp/PlGrid$Mover;->leg:Z
  .line 530
    iput v4, v1, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
  :L33
  .line 531
    return-void
  :L34
  .line 607
    move-exception v0
  :L35
  .line 609
    return-void
.end method

.method public onDrawOver(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V
  .catchall { :L0 .. :L6 } :L7
  .registers 10
  :L0
  .line 614
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    iget-wide v2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->drawn:J
    sub-long/2addr v0, v2
    const-wide/16 v4, 8
    cmp-long p3, v0, v4
    if-ltz p3, :L1
    const-string p3, "tiles drawn"
    invoke-static { p3, v2, v3 }, Lcom/innioasis/ipp/Frames;->part(Ljava/lang/String;J)V
  :L1
  .line 615
    iget-boolean p3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
    if-nez p3, :L2
    return-void
  :L2
  .line 616
    iget-boolean p3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->photos:Z
    if-eqz p3, :L3
    iget p3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->focus:I
    if-nez p3, :L3
    invoke-virtual { p2 }, Landroidx/recyclerview/widget/RecyclerView;->getContext()Landroid/content/Context;
    move-result-object p2
    invoke-static { p2 }, Lcom/innioasis/ipp/Photos;->focus(Landroid/content/Context;)I
    move-result p2
    iput p2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->focus:I
  :L3
  .line 617
    iget p2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
    iget p3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
    iget v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->off:I
    int-to-float v0, v0
    sub-float/2addr p3, v0
    iget-boolean v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->photos:Z
    if-eqz v0, :L4
    iget v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->focus:I
    goto :L5
  :L4
    invoke-static { }, Lcom/innioasis/ipp/Theme;->tileFrame()I
    move-result v0
  :L5
    invoke-direct { p0, p1, p2, p3, v0 }, Lcom/innioasis/ipp/PlGrid$Mover;->frame(Landroid/graphics/Canvas;FFI)V
  :L6
  .line 619
    goto :L8
  :L7
  .line 618
    move-exception p1
  :L8
  .line 620
    return-void
.end method

.method snap()V
  .registers 2
  .line 389
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
  .line 390
    iput-boolean v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->leg:Z
  .line 391
    const/high16 v0, 0x3F800000
    iput v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
  .line 392
    return-void
.end method
