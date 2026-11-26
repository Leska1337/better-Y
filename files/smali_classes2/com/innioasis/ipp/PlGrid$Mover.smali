.class final Lcom/innioasis/ipp/PlGrid$Mover;
.super Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;
.implements Lcom/innioasis/ipp/Loop$Bumper;
.source "PlGrid.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/PlGrid;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Mover"
.end annotation

.field private final static FADE_MS:J = 60L

.field private final static OMEGA:F = 30.0F

.field private final static PHOTO_RING:F = 2.0F

.field private final draw:Landroid/graphics/RectF;

.field private drawn:J

.field private edge:F

.field private edgePos:I

.field private fa:F

.field private final fade:Landroid/graphics/Paint;

.field private focus:I

.field private h:F

.field private has:Z

.field private inner:F

.field private l:F

.field private last:J

.field private leg:Z

.field private legAt:J

.field private legDown:Z

.field private list:Ljava/lang/ref/WeakReference;

.field private lv:F

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

.field private seenWraps:I

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
  .line 423
    invoke-direct { p0 }, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;-><init>()V
  .line 353
    new-instance v0, Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->list:Ljava/lang/ref/WeakReference;
  .line 374
    new-instance v0, Landroid/graphics/Paint;
    const/4 v1, 1
    invoke-direct { v0, v1 }, Landroid/graphics/Paint;-><init>(I)V
    iput-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->paint:Landroid/graphics/Paint;
  .line 376
    new-instance v0, Landroid/graphics/RectF;
    invoke-direct { v0 }, Landroid/graphics/RectF;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->draw:Landroid/graphics/RectF;
  .line 377
    new-instance v0, Landroid/graphics/Path;
    invoke-direct { v0 }, Landroid/graphics/Path;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->ring:Landroid/graphics/Path;
  .line 386
    iput v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->span:I
  .line 388
    const/high16 v0, 0x3F800000
    iput v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
  .line 394
    new-instance v0, Landroid/graphics/Paint;
    invoke-direct { v0 }, Landroid/graphics/Paint;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->fade:Landroid/graphics/Paint;
  .line 483
    sget v0, Lcom/innioasis/ipp/Loop;->wraps:I
    iput v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->seenWraps:I
  .line 424
    iput-boolean p1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->photos:Z
  .line 425
    return-void
.end method

.method static synthetic access$300(Lcom/innioasis/ipp/PlGrid$Mover;)Z
  .registers 1
  .line 348
    iget-boolean p0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->leg:Z
    return p0
.end method

.method static synthetic access$400(Lcom/innioasis/ipp/PlGrid$Mover;)Z
  .registers 1
  .line 348
    iget-boolean p0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
    return p0
.end method

.method static synthetic access$500(Lcom/innioasis/ipp/PlGrid$Mover;)J
  .registers 3
  .line 348
    iget-wide v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->legAt:J
    return-wide v0
.end method

.method private static box(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;IZ)[F
  .registers 6
  .line 554
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
  .line 555
    nop
  :L4
    if-eqz p0, :L6
    if-eq p0, p1, :L6
  .line 556
    invoke-virtual { p0 }, Landroid/view/View;->getLeft()I
    move-result p3
    int-to-float p3, p3
    add-float/2addr v0, p3
  .line 557
    invoke-virtual { p0 }, Landroid/view/View;->getTop()I
    move-result p3
    int-to-float p3, p3
    add-float/2addr p2, p3
  .line 558
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p3
    instance-of p3, p3, Landroid/view/View;
    if-nez p3, :L5
    goto :L6
  :L5
  .line 555
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
    check-cast p0, Landroid/view/View;
    goto :L4
  :L6
  .line 560
    const/4 p0, 2
    new-array p0, p0, [F
    aput v0, p0, v1
    const/4 p1, 1
    aput p2, p0, p1
    return-object p0
.end method

.method private edgeBox(Landroidx/recyclerview/widget/RecyclerView;II)[F
  .registers 7
  .line 488
    iget v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->span:I
    const/4 v1, 1
    invoke-static { v1, v0 }, Ljava/lang/Math;->max(II)I
    move-result v0
  .line 489
    div-int/2addr p2, v0
    mul-int p2, p2, v0
  .line 490
    iget-boolean v2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->legDown:Z
    if-eqz v2, :L0
    goto :L1
  :L0
    sub-int/2addr p3, v1
    add-int/2addr p2, v0
    sub-int/2addr p2, v1
    invoke-static { p3, p2 }, Ljava/lang/Math;->min(II)I
    move-result p2
  :L1
    iput p2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->edgePos:I
  .line 491
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object p2
    if-nez p2, :L2
    const/4 p2, 0
    goto :L3
  :L2
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object p2
    iget p3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->edgePos:I
    invoke-virtual { p2, p3 }, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object p2
  :L3
  .line 492
    if-eqz p2, :L4
    invoke-direct { p0, p2, p1 }, Lcom/innioasis/ipp/PlGrid$Mover;->shape(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;)[F
    move-result-object p1
    goto :L5
  :L4
    iget p2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->edgePos:I
    invoke-direct { p0, p1, p2 }, Lcom/innioasis/ipp/PlGrid$Mover;->project(Landroidx/recyclerview/widget/RecyclerView;I)[F
    move-result-object p1
  :L5
    return-object p1
.end method

.method private frame(Landroid/graphics/Canvas;FFI)V
  .registers 13
  .line 515
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
  .line 517
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
  .line 518
    if-lez v0, :L9
    if-gtz v1, :L1
    goto/16 :L9
  :L1
  .line 519
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
  .line 522
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pic:Landroid/graphics/Bitmap;
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/graphics/Bitmap;->eraseColor(I)V
    goto :L4
  :L3
  .line 520
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v0, v1, v2 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pic:Landroid/graphics/Bitmap;
  :L4
  .line 524
    new-instance v0, Landroid/graphics/Canvas;
    iget-object v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pic:Landroid/graphics/Bitmap;
    invoke-direct { v0, v1 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 525
    iget-object v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->draw:Landroid/graphics/RectF;
    iget v2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->w:F
    iget v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->h:F
    const/4 v7, 0
    invoke-virtual { v1, v7, v7, v2, v3 }, Landroid/graphics/RectF;->set(FFFF)V
  .line 526
    iget v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->edge:F
    iget v4, p0, Lcom/innioasis/ipp/PlGrid$Mover;->radius:F
    iget v5, p0, Lcom/innioasis/ipp/PlGrid$Mover;->inner:F
    move-object v1, p0
    move-object v2, v0
    move v6, p4
    invoke-direct/range { v1 .. v6 }, Lcom/innioasis/ipp/PlGrid$Mover;->ring(Landroid/graphics/Canvas;FFFI)V
  .line 527
    iget v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->rim:F
    cmpl-float v1, v3, v7
    if-lez v1, :L5
    iget v4, p0, Lcom/innioasis/ipp/PlGrid$Mover;->inner:F
    sub-float v1, v4, v3
    invoke-static { v7, v1 }, Ljava/lang/Math;->max(FF)F
    move-result v5
    invoke-static { p4 }, Lcom/innioasis/ipp/PlGrid;->access$600(I)I
    move-result v6
    move-object v1, p0
    move-object v2, v0
    invoke-direct/range { v1 .. v6 }, Lcom/innioasis/ipp/PlGrid$Mover;->ring(Landroid/graphics/Canvas;FFFI)V
  :L5
  .line 528
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
  .line 530
    iget-object p4, p0, Lcom/innioasis/ipp/PlGrid$Mover;->fade:Landroid/graphics/Paint;
    const/high16 v0, 0x437F0000
    iget v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
    mul-float v1, v1, v0
    invoke-static { v1 }, Ljava/lang/Math;->round(F)I
    move-result v0
    invoke-virtual { p4, v0 }, Landroid/graphics/Paint;->setAlpha(I)V
  .line 531
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
  .line 532
    return-void
  :L9
  .line 518
    return-void
.end method

.method private glide(FFF)F
  .registers 8
  .line 565
    sub-float/2addr p1, p2
  .line 566
    iget v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->lv:F
    const/high16 v1, 0x41F00000
    mul-float v2, p1, v1
    add-float/2addr v0, v2
  .line 567
    const/high16 v2, 0xC1F00000
    mul-float v2, v2, p3
    float-to-double v2, v2
    invoke-static { v2, v3 }, Ljava/lang/Math;->exp(D)D
    move-result-wide v2
    double-to-float v2, v2
  .line 568
    mul-float v3, v0, p3
    add-float/2addr p1, v3
    mul-float p1, p1, v2
  .line 569
    iget v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->lv:F
    mul-float v0, v0, v1
    mul-float v0, v0, p3
    sub-float/2addr v3, v0
    mul-float v3, v3, v2
    iput v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->lv:F
  .line 570
    invoke-static { p1 }, Ljava/lang/Math;->abs(F)F
    move-result p3
    const/high16 v0, 0x3F000000
    cmpg-float p3, p3, v0
    if-gez p3, :L0
    iget p3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->lv:F
    invoke-static { p3 }, Ljava/lang/Math;->abs(F)F
    move-result p3
    const/high16 v0, 0x41700000
    cmpg-float p3, p3, v0
    if-gez p3, :L0
  .line 571
    const/4 p1, 0
    iput p1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->lv:F
  .line 572
    return p2
  :L0
  .line 574
    add-float/2addr p2, p1
    return p2
.end method

.method private measure(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 7
  .line 402
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v0
  .line 403
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
  .line 404
    const/4 v1, 0
  :L2
    if-eqz v0, :L4
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v2
    if-ge v1, v2, :L4
  .line 405
    invoke-virtual { p1, v1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v2
  .line 406
    invoke-virtual { p1, v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I
    move-result v3
  .line 407
    const/4 v4, -1
    if-ne v3, v4, :L3
  .line 404
    add-int/lit8 v1, v1, 1
    goto :L2
  :L3
  .line 408
    invoke-virtual { v2 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object p1
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 409
    invoke-virtual { v0, v2 }, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getDecoratedMeasuredHeight(Landroid/view/View;)I
    move-result v1
    iget v4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    add-int/2addr v1, v4
    iget v4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I
    add-int/2addr v1, v4
    iput v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pitch:I
  .line 410
    iget v4, p0, Lcom/innioasis/ipp/PlGrid$Mover;->span:I
    div-int/2addr v3, v4
    mul-int v3, v3, v1
    invoke-virtual { v0, v2 }, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getDecoratedTop(Landroid/view/View;)I
    move-result v0
    iget p1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    sub-int/2addr v0, p1
    sub-int/2addr v3, v0
    iput v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->off:I
  .line 411
    return-void
  :L4
  .line 413
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollOffset()I
    move-result p1
    iput p1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->off:I
  .line 414
    return-void
.end method

.method private project(Landroidx/recyclerview/widget/RecyclerView;I)[F
  .registers 8
  .line 496
    const/4 v0, 0
  :L0
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v1
    if-ge v0, v1, :L4
  .line 497
    invoke-virtual { p1, v0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v1
  .line 498
    invoke-virtual { p1, v1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I
    move-result v2
  .line 499
    const/4 v3, -1
    if-eq v2, v3, :L3
    iget v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->span:I
    rem-int v4, v2, v3
    rem-int v3, p2, v3
    if-eq v4, v3, :L1
    goto :L3
  :L1
  .line 500
    invoke-direct { p0, v1, p1 }, Lcom/innioasis/ipp/PlGrid$Mover;->shape(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;)[F
    move-result-object v1
  .line 501
    if-nez v1, :L2
    goto :L3
  :L2
  .line 502
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
  .line 503
    return-object v1
  :L3
  .line 496
    add-int/lit8 v0, v0, 1
    goto :L0
  :L4
  .line 505
    const/4 p1, 0
    return-object p1
.end method

.method private rested(Z)Z
  .registers 3
  .line 538
    iget-boolean v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->was:Z
    if-eqz v0, :L0
    if-nez p1, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
  .line 539
    iput-boolean p1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->was:Z
  .line 540
    return v0
.end method

.method private ring(Landroid/graphics/Canvas;FFFI)V
  .registers 9
  .line 579
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->ring:Landroid/graphics/Path;
    invoke-virtual { v0 }, Landroid/graphics/Path;->reset()V
  .line 580
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->ring:Landroid/graphics/Path;
    sget-object v1, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;
    invoke-virtual { v0, v1 }, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V
  .line 581
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->ring:Landroid/graphics/Path;
    iget-object v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->draw:Landroid/graphics/RectF;
    sget-object v2, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;
    invoke-virtual { v0, v1, p3, p3, v2 }, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V
  .line 582
    iget-object p3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->draw:Landroid/graphics/RectF;
    invoke-virtual { p3, p2, p2 }, Landroid/graphics/RectF;->inset(FF)V
  .line 583
    iget-object p2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->ring:Landroid/graphics/Path;
    iget-object p3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->draw:Landroid/graphics/RectF;
    sget-object v0, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;
    invoke-virtual { p2, p3, p4, p4, v0 }, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V
  .line 584
    iget-object p2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->paint:Landroid/graphics/Paint;
    invoke-virtual { p2, p5 }, Landroid/graphics/Paint;->setColor(I)V
  .line 585
    iget-object p2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->ring:Landroid/graphics/Path;
    iget-object p3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->paint:Landroid/graphics/Paint;
    invoke-virtual { p1, p2, p3 }, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V
  .line 586
    return-void
.end method

.method private shape(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;)[F
  .registers 11
  .line 448
    const v0, 2131362091
    invoke-virtual { p1, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 449
    const v1, 2131361934
    invoke-virtual { p1, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 450
    const v2, 2131362087
    invoke-virtual { p1, v2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v2
  .line 451
    instance-of v3, v1, Landroidx/cardview/widget/CardView;
    const/4 v4, 0
    if-eqz v3, :L5
    if-nez v2, :L0
    goto/16 :L5
  :L0
  .line 452
    iget-boolean v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->photos:Z
    const/4 v5, 1
    const/4 v6, 0
    const/4 v7, 0
    if-eqz v3, :L1
  .line 453
    invoke-virtual { p1 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object p1
    invoke-virtual { p1 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object p1
    iget p1, p1, Landroid/util/DisplayMetrics;->density:F
    const/high16 v0, 0x40000000
    mul-float p1, p1, v0
  .line 454
    iget v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->off:I
    invoke-static { v2, p2, v3, v7 }, Lcom/innioasis/ipp/PlGrid$Mover;->box(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;IZ)[F
    move-result-object p2
  .line 455
    invoke-virtual { v2 }, Landroid/view/View;->getWidth()I
    move-result v3
    int-to-float v3, v3
    mul-float v0, v0, p1
    add-float/2addr v3, v0
    iput v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->w:F
  .line 456
    invoke-virtual { v2 }, Landroid/view/View;->getHeight()I
    move-result v2
    int-to-float v2, v2
    add-float/2addr v2, v0
    iput v2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->h:F
  .line 457
    iput p1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->edge:F
  .line 458
    iput v6, p0, Lcom/innioasis/ipp/PlGrid$Mover;->rim:F
  .line 459
    check-cast v1, Landroidx/cardview/widget/CardView;
    invoke-virtual { v1 }, Landroidx/cardview/widget/CardView;->getRadius()F
    move-result v0
    iput v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->radius:F
  .line 460
    iput v6, p0, Lcom/innioasis/ipp/PlGrid$Mover;->inner:F
  .line 461
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
  .line 463
    instance-of p1, v0, Landroidx/cardview/widget/CardView;
    if-nez p1, :L2
    return-object v4
  :L2
  .line 466
    iget p1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->off:I
    invoke-static { v0, p2, p1, v5 }, Lcom/innioasis/ipp/PlGrid$Mover;->box(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;IZ)[F
    move-result-object p1
  .line 467
    iget v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->off:I
    invoke-static { v1, p2, v3, v5 }, Lcom/innioasis/ipp/PlGrid$Mover;->box(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;IZ)[F
    move-result-object v3
    iget v4, p0, Lcom/innioasis/ipp/PlGrid$Mover;->off:I
    invoke-static { v2, p2, v4, v7 }, Lcom/innioasis/ipp/PlGrid$Mover;->box(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;IZ)[F
    move-result-object p2
  .line 468
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
  .line 469
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
  .line 470
    aget v2, v3, v7
    aget v4, p1, v7
    sub-float/2addr v2, v4
    const/high16 v4, 0x3F800000
    invoke-static { v4, v2 }, Ljava/lang/Math;->max(FF)F
    move-result v2
    iput v2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->edge:F
  .line 472
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
  .line 473
    check-cast v0, Landroidx/cardview/widget/CardView;
    invoke-virtual { v0 }, Landroidx/cardview/widget/CardView;->getRadius()F
    move-result p2
    iput p2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->radius:F
  .line 474
    check-cast v1, Landroidx/cardview/widget/CardView;
    invoke-virtual { v1 }, Landroidx/cardview/widget/CardView;->getRadius()F
    move-result p2
    iput p2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->inner:F
  .line 475
    return-object p1
  :L5
  .line 451
    return-object v4
.end method

.method private watch(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .registers 3
  .line 429
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->watched:Ljava/lang/ref/WeakReference;
    if-eqz v0, :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    if-ne v0, p1, :L0
    return-void
  :L0
  .line 430
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->watched:Ljava/lang/ref/WeakReference;
  .line 431
    new-instance v0, Lcom/innioasis/ipp/PlGrid$Snap;
    invoke-direct { v0, p0 }, Lcom/innioasis/ipp/PlGrid$Snap;-><init>(Lcom/innioasis/ipp/PlGrid$Mover;)V
    invoke-virtual { p1, v0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->registerAdapterDataObserver(Landroidx/recyclerview/widget/RecyclerView$AdapterDataObserver;)V
  .line 432
    return-void
.end method

.method along(I)Z
  .registers 4
  .line 545
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

.method public at()I
  .registers 2
  .line 364
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->list:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 365
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-static { v0 }, Lcom/innioasis/ipp/PlGrid;->cursorAt(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result v0
  :L1
    return v0
.end method

.method public bump(I)V
  .registers 5
  .line 357
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->list:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 358
    if-eqz v0, :L1
    iget-boolean v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
    if-eqz v1, :L1
    iget-boolean v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->leg:Z
    if-eqz v1, :L0
    goto :L1
  :L0
  .line 359
    iget v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->lv:F
    int-to-float p1, p1
    const/high16 v2, 0x43700000
    mul-float p1, p1, v2
    add-float/2addr v1, p1
    iput v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->lv:F
  .line 360
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->postInvalidateOnAnimation()V
  .line 361
    return-void
  :L1
  .line 358
    return-void
.end method

.method public count()I
  .registers 2
  .line 369
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->list:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 370
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v0
  :L1
  .line 371
    if-nez v0, :L2
    const/4 v0, 0
    goto :L3
  :L2
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I
    move-result v0
  :L3
    return v0
.end method

.method public onDraw(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V
  .catchall { :L0 .. :L41 } :L42
  .registers 22
  .line 591
    move-object/from16 v1, p0
    move-object/from16 v0, p2
  :L0
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    iput-wide v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->drawn:J
  .line 592
    invoke-virtual/range { p2 .. p2 }, Landroidx/recyclerview/widget/RecyclerView;->getContext()Landroid/content/Context;
    move-result-object v2
  .line 593
    invoke-virtual/range { p2 .. p2 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v3
  .line 594
    const/high16 v4, 0x3F800000
    const/4 v5, 0
    if-eqz v3, :L39
    invoke-static { v2 }, Lcom/innioasis/ipp/PlGrid;->access$700(Landroid/content/Context;)Z
    move-result v2
    if-nez v2, :L39
    instance-of v2, v3, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-eqz v2, :L1
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->access$800()Z
    move-result v2
    if-eqz v2, :L1
    goto/16 :L39
  :L1
  .line 601
    invoke-static/range { p2 .. p2 }, Lcom/innioasis/ipp/Theme;->tilesAhead(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 602
    invoke-direct { v1, v0 }, Lcom/innioasis/ipp/PlGrid$Mover;->measure(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 603
    invoke-static/range { p2 .. p2 }, Lcom/innioasis/ipp/PlGrid;->cursorAt(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result v2
  .line 604
    iget-boolean v6, v1, Lcom/innioasis/ipp/PlGrid$Mover;->photos:Z
    if-eqz v6, :L2
    invoke-direct { v1, v3 }, Lcom/innioasis/ipp/PlGrid$Mover;->watch(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
  :L2
  .line 605
    invoke-virtual/range { p2 .. p2 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v6
    const/4 v7, 0
    if-nez v6, :L3
    move-object v6, v7
    goto :L4
  :L3
  .line 606
    invoke-virtual/range { p2 .. p2 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v6
    invoke-virtual { v6, v2 }, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object v6
  :L4
  .line 607
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v8
  .line 608
    nop
  .line 609
    if-nez v6, :L5
    goto :L6
  :L5
    invoke-direct { v1, v6, v0 }, Lcom/innioasis/ipp/PlGrid$Mover;->shape(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;)[F
    move-result-object v7
  :L6
  .line 610
    if-nez v7, :L7
    iget-boolean v6, v1, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
    if-eqz v6, :L7
  .line 612
    invoke-direct { v1, v0, v2 }, Lcom/innioasis/ipp/PlGrid$Mover;->project(Landroidx/recyclerview/widget/RecyclerView;I)[F
    move-result-object v7
  :L7
  .line 614
    const-wide/16 v10, 0
    const/4 v6, 0
    const/4 v12, 1
    if-eqz v7, :L8
    iget-boolean v13, v1, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
    if-nez v13, :L8
  .line 615
    aget v3, v7, v5
    iput v3, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
    aget v4, v7, v12
    iput v4, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
  .line 616
    iput v6, v1, Lcom/innioasis/ipp/PlGrid$Mover;->lv:F
  .line 617
    iput v3, v1, Lcom/innioasis/ipp/PlGrid$Mover;->tx:F
  .line 618
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->txPos:I
  .line 619
    iput-boolean v12, v1, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
    goto/16 :L30
  :L8
  .line 620
    if-eqz v7, :L30
  .line 621
    iget-wide v13, v1, Lcom/innioasis/ipp/PlGrid$Mover;->last:J
    const/high16 v15, 0x447A0000
    cmp-long v16, v13, v10
    if-nez v16, :L9
    const v13, 1015222895
    goto :L10
  :L9
    sub-long v13, v8, v13
    long-to-float v13, v13
    div-float/2addr v13, v15
    const v14, 1028443341
    invoke-static { v14, v13 }, Ljava/lang/Math;->min(FF)F
    move-result v13
  :L10
  .line 622
    invoke-static/range { p2 .. p2 }, Lcom/innioasis/ipp/Wheel$Glider;->left(Landroidx/recyclerview/widget/RecyclerView;)F
    move-result v14
  .line 623
    invoke-static/range { p2 .. p2 }, Lcom/innioasis/ipp/Wheel;->held(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v16
  .line 626
    iget-boolean v10, v1, Lcom/innioasis/ipp/PlGrid$Mover;->leg:Z
    if-nez v10, :L11
    aget v10, v7, v12
    iget v11, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
    cmpl-float v10, v10, v11
    if-eqz v10, :L11
    iget v10, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
    iget v11, v1, Lcom/innioasis/ipp/PlGrid$Mover;->tx:F
    sub-float/2addr v10, v11
    invoke-static { v10 }, Ljava/lang/Math;->abs(F)F
    move-result v10
    cmpl-float v10, v10, v4
    if-ltz v10, :L11
    const/4 v10, 1
    goto :L12
  :L11
    const/4 v10, 0
  :L12
  .line 627
    iget-boolean v11, v1, Lcom/innioasis/ipp/PlGrid$Mover;->leg:Z
    if-nez v11, :L21
    aget v11, v7, v12
    iget v15, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
    cmpl-float v11, v11, v15
    if-eqz v11, :L21
    if-nez v10, :L21
  .line 628
    if-eqz v16, :L13
    invoke-static/range { p2 .. p2 }, Lcom/innioasis/ipp/Wheel;->releaseSoon(Landroidx/recyclerview/widget/RecyclerView;)V
  :L13
  .line 630
    sget v11, Lcom/innioasis/ipp/Loop;->wraps:I
    iget v15, v1, Lcom/innioasis/ipp/PlGrid$Mover;->seenWraps:I
    if-eq v11, v15, :L14
    const/4 v11, 1
    goto :L15
  :L14
    const/4 v11, 0
  :L15
  .line 631
    sget v15, Lcom/innioasis/ipp/Loop;->wraps:I
    iput v15, v1, Lcom/innioasis/ipp/PlGrid$Mover;->seenWraps:I
  .line 632
    if-nez v11, :L19
    aget v11, v7, v12
    iget v15, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
    sub-float/2addr v11, v15
    invoke-static { v11 }, Ljava/lang/Math;->abs(F)F
    move-result v11
    iget v15, v1, Lcom/innioasis/ipp/PlGrid$Mover;->pitch:I
    int-to-float v15, v15
    const/high16 v17, 0x3FC00000
    mul-float v15, v15, v17
    cmpg-float v11, v11, v15
    if-lez v11, :L16
    cmpl-float v11, v14, v6
    if-nez v11, :L16
    if-eqz v16, :L19
  :L16
  .line 636
    iput-boolean v12, v1, Lcom/innioasis/ipp/PlGrid$Mover;->leg:Z
  .line 637
    iget v11, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
    iget v15, v1, Lcom/innioasis/ipp/PlGrid$Mover;->off:I
    int-to-float v15, v15
    sub-float v15, v11, v15
    iput v15, v1, Lcom/innioasis/ipp/PlGrid$Mover;->sy:F
  .line 638
    iput-wide v8, v1, Lcom/innioasis/ipp/PlGrid$Mover;->legAt:J
  .line 639
    aget v15, v7, v12
    cmpl-float v11, v15, v11
    if-lez v11, :L17
    const/4 v11, 1
    goto :L18
  :L17
    const/4 v11, 0
  :L18
    iput-boolean v11, v1, Lcom/innioasis/ipp/PlGrid$Mover;->legDown:Z
  .line 640
    iput v4, v1, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
  .line 641
    iput-boolean v5, v1, Lcom/innioasis/ipp/PlGrid$Mover;->placed:Z
    goto :L20
  :L19
  .line 643
    aget v11, v7, v5
    iput v11, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
  .line 644
    aget v11, v7, v12
    iput v11, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
  .line 645
    iput v6, v1, Lcom/innioasis/ipp/PlGrid$Mover;->lv:F
  :L20
  .line 647
    aget v11, v7, v5
    iput v11, v1, Lcom/innioasis/ipp/PlGrid$Mover;->lx:F
  .line 648
    aget v11, v7, v12
    iput v11, v1, Lcom/innioasis/ipp/PlGrid$Mover;->ly:F
  :L21
  .line 650
    iget-boolean v11, v1, Lcom/innioasis/ipp/PlGrid$Mover;->leg:Z
    if-eqz v11, :L26
  .line 653
    invoke-virtual { v3 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I
    move-result v3
    invoke-direct { v1, v0, v2, v3 }, Lcom/innioasis/ipp/PlGrid$Mover;->edgeBox(Landroidx/recyclerview/widget/RecyclerView;II)[F
    move-result-object v2
  .line 654
    if-eqz v2, :L22
  .line 655
    aget v3, v2, v5
    iput v3, v1, Lcom/innioasis/ipp/PlGrid$Mover;->lx:F
  .line 656
    aget v2, v2, v12
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->ly:F
  :L22
  .line 659
    iget-boolean v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->placed:Z
    if-nez v2, :L23
    invoke-static { v14 }, Ljava/lang/Math;->abs(F)F
    move-result v2
    iget v3, v1, Lcom/innioasis/ipp/PlGrid$Mover;->pitch:I
    int-to-float v3, v3
    const/high16 v10, 0x40000000
    div-float/2addr v3, v10
    cmpg-float v2, v2, v3
    if-gez v2, :L23
    iget v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
    cmpl-float v2, v2, v6
    if-nez v2, :L23
    iput-boolean v12, v1, Lcom/innioasis/ipp/PlGrid$Mover;->placed:Z
  :L23
  .line 660
    iget-boolean v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->placed:Z
    const/high16 v3, 0x42700000
    if-nez v2, :L24
  .line 661
    iget v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
    const/high16 v4, 0x447A0000
    mul-float v13, v13, v4
    div-float/2addr v13, v3
    sub-float/2addr v2, v13
    invoke-static { v6, v2 }, Ljava/lang/Math;->max(FF)F
    move-result v2
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
  .line 662
    iget v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->sy:F
    iget v3, v1, Lcom/innioasis/ipp/PlGrid$Mover;->off:I
    int-to-float v3, v3
    add-float/2addr v2, v3
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
    goto :L25
  :L24
  .line 664
    iget v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->lx:F
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
  .line 665
    iget v10, v1, Lcom/innioasis/ipp/PlGrid$Mover;->ly:F
    iput v10, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
  .line 666
    iput v6, v1, Lcom/innioasis/ipp/PlGrid$Mover;->lv:F
  .line 667
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->tx:F
  .line 668
    iget v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->edgePos:I
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->txPos:I
  .line 669
    iget v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
    const/high16 v10, 0x447A0000
    mul-float v13, v13, v10
    div-float/2addr v13, v3
    add-float/2addr v2, v13
    invoke-static { v4, v2 }, Ljava/lang/Math;->min(FF)F
    move-result v2
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
  .line 670
    cmpl-float v2, v2, v4
    if-ltz v2, :L25
    iput-boolean v5, v1, Lcom/innioasis/ipp/PlGrid$Mover;->leg:Z
  :L25
  .line 672
    goto :L28
  :L26
    if-eqz v10, :L27
  .line 673
    iget v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
    iget v3, v1, Lcom/innioasis/ipp/PlGrid$Mover;->tx:F
    invoke-direct { v1, v2, v3, v13 }, Lcom/innioasis/ipp/PlGrid$Mover;->glide(FFF)F
    move-result v2
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
    goto :L28
  :L27
  .line 675
    iget v3, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
    aget v4, v7, v5
    invoke-direct { v1, v3, v4, v13 }, Lcom/innioasis/ipp/PlGrid$Mover;->glide(FFF)F
    move-result v3
    iput v3, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
  .line 676
    aget v3, v7, v5
    iput v3, v1, Lcom/innioasis/ipp/PlGrid$Mover;->tx:F
  .line 677
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->txPos:I
  :L28
  .line 679
    iget-boolean v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->leg:Z
    if-nez v2, :L29
    iget v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
    aget v3, v7, v5
    cmpl-float v2, v2, v3
    if-nez v2, :L29
    iget v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
    aget v3, v7, v12
    cmpl-float v2, v2, v3
    if-nez v2, :L29
    iget v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->lv:F
    cmpl-float v2, v2, v6
    if-eqz v2, :L30
  :L29
    const/4 v5, 1
  :L30
  .line 681
    invoke-direct { v1, v5 }, Lcom/innioasis/ipp/PlGrid$Mover;->rested(Z)Z
    move-result v2
    if-eqz v2, :L31
    invoke-static/range { p2 .. p2 }, Lcom/innioasis/ipp/PlGrid$Tidy;->at(Landroidx/recyclerview/widget/RecyclerView;)V
  :L31
  .line 683
    if-eqz v5, :L32
    invoke-static { }, Lcom/innioasis/ipp/Loop;->animating()V
  :L32
  .line 684
    iget-boolean v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
    if-eqz v2, :L34
    invoke-virtual/range { p2 .. p2 }, Landroidx/recyclerview/widget/RecyclerView;->hasWindowFocus()Z
    move-result v2
    if-eqz v2, :L34
  .line 685
    iget-object v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->list:Ljava/lang/ref/WeakReference;
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
    if-eq v2, v0, :L33
    new-instance v2, Ljava/lang/ref/WeakReference;
    invoke-direct { v2, v0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->list:Ljava/lang/ref/WeakReference;
  :L33
  .line 686
    invoke-static/range { p0 .. p0 }, Lcom/innioasis/ipp/Loop;->bumper(Lcom/innioasis/ipp/Loop$Bumper;)V
  :L34
  .line 688
    if-eqz v5, :L35
    goto :L36
  :L35
    const-wide/16 v8, 0
  :L36
    iput-wide v8, v1, Lcom/innioasis/ipp/PlGrid$Mover;->last:J
  .line 689
    iget-boolean v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
    if-nez v2, :L37
    return-void
  :L37
  .line 690
    if-eqz v5, :L38
    invoke-virtual/range { p2 .. p2 }, Landroidx/recyclerview/widget/RecyclerView;->postInvalidateOnAnimation()V
  :L38
  .line 692
    goto :L43
  :L39
  .line 595
    invoke-static/range { p2 .. p2 }, Lcom/innioasis/ipp/Wheel;->held(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v2
    if-eqz v2, :L40
    invoke-static/range { p2 .. p2 }, Lcom/innioasis/ipp/Wheel;->releaseSoon(Landroidx/recyclerview/widget/RecyclerView;)V
  :L40
  .line 596
    iput-boolean v5, v1, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
  .line 597
    iput-boolean v5, v1, Lcom/innioasis/ipp/PlGrid$Mover;->leg:Z
  .line 598
    iput v4, v1, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
  :L41
  .line 599
    return-void
  :L42
  .line 691
    move-exception v0
  :L43
  .line 693
    return-void
.end method

.method public onDrawOver(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V
  .catchall { :L0 .. :L6 } :L7
  .registers 10
  :L0
  .line 698
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
  .line 699
    iget-boolean p3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
    if-nez p3, :L2
    return-void
  :L2
  .line 700
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
  .line 701
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
  .line 703
    goto :L8
  :L7
  .line 702
    move-exception p1
  :L8
  .line 704
    return-void
.end method

.method snap()V
  .registers 2
  .line 435
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
  .line 436
    iput-boolean v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->leg:Z
  .line 437
    const/high16 v0, 0x3F800000
    iput v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
  .line 438
    return-void
.end method
