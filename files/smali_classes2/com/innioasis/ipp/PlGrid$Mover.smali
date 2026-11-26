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

.field private pendAt:J

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
  .line 432
    invoke-direct { p0 }, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;-><init>()V
  .line 362
    new-instance v0, Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->list:Ljava/lang/ref/WeakReference;
  .line 383
    new-instance v0, Landroid/graphics/Paint;
    const/4 v1, 1
    invoke-direct { v0, v1 }, Landroid/graphics/Paint;-><init>(I)V
    iput-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->paint:Landroid/graphics/Paint;
  .line 385
    new-instance v0, Landroid/graphics/RectF;
    invoke-direct { v0 }, Landroid/graphics/RectF;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->draw:Landroid/graphics/RectF;
  .line 386
    new-instance v0, Landroid/graphics/Path;
    invoke-direct { v0 }, Landroid/graphics/Path;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->ring:Landroid/graphics/Path;
  .line 395
    iput v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->span:I
  .line 397
    const/high16 v0, 0x3F800000
    iput v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
  .line 403
    new-instance v0, Landroid/graphics/Paint;
    invoke-direct { v0 }, Landroid/graphics/Paint;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->fade:Landroid/graphics/Paint;
  .line 494
    sget v0, Lcom/innioasis/ipp/Loop;->wraps:I
    iput v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->seenWraps:I
  .line 433
    iput-boolean p1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->photos:Z
  .line 434
    return-void
.end method

.method static synthetic access$300(Lcom/innioasis/ipp/PlGrid$Mover;)Z
  .registers 1
  .line 357
    iget-boolean p0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
    return p0
.end method

.method static synthetic access$400(Lcom/innioasis/ipp/PlGrid$Mover;)Z
  .registers 1
  .line 357
    iget-boolean p0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->leg:Z
    return p0
.end method

.method static synthetic access$500(Lcom/innioasis/ipp/PlGrid$Mover;)J
  .registers 3
  .line 357
    iget-wide v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->legAt:J
    return-wide v0
.end method

.method static synthetic access$600(Lcom/innioasis/ipp/PlGrid$Mover;)I
  .registers 1
  .line 357
    iget p0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->span:I
    return p0
.end method

.method static synthetic access$700(Lcom/innioasis/ipp/PlGrid$Mover;)I
  .registers 1
  .line 357
    iget p0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->txPos:I
    return p0
.end method

.method static synthetic access$800(Lcom/innioasis/ipp/PlGrid$Mover;)J
  .registers 3
  .line 357
    iget-wide v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pendAt:J
    return-wide v0
.end method

.method static synthetic access$802(Lcom/innioasis/ipp/PlGrid$Mover;J)J
  .registers 3
  .line 357
    iput-wide p1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pendAt:J
    return-wide p1
.end method

.method private static box(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;IZ)[F
  .registers 6
  .line 565
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
  .line 566
    nop
  :L4
    if-eqz p0, :L6
    if-eq p0, p1, :L6
  .line 567
    invoke-virtual { p0 }, Landroid/view/View;->getLeft()I
    move-result p3
    int-to-float p3, p3
    add-float/2addr v0, p3
  .line 568
    invoke-virtual { p0 }, Landroid/view/View;->getTop()I
    move-result p3
    int-to-float p3, p3
    add-float/2addr p2, p3
  .line 569
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p3
    instance-of p3, p3, Landroid/view/View;
    if-nez p3, :L5
    goto :L6
  :L5
  .line 566
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
    check-cast p0, Landroid/view/View;
    goto :L4
  :L6
  .line 571
    const/4 p0, 2
    new-array p0, p0, [F
    aput v0, p0, v1
    const/4 p1, 1
    aput p2, p0, p1
    return-object p0
.end method

.method private edgeBox(Landroidx/recyclerview/widget/RecyclerView;II)[F
  .registers 7
  .line 499
    iget v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->span:I
    const/4 v1, 1
    invoke-static { v1, v0 }, Ljava/lang/Math;->max(II)I
    move-result v0
  .line 500
    div-int/2addr p2, v0
    mul-int p2, p2, v0
  .line 501
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
  .line 502
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
  .line 503
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
  .line 526
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
  .line 528
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
  .line 529
    if-lez v0, :L9
    if-gtz v1, :L1
    goto/16 :L9
  :L1
  .line 530
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
  .line 533
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pic:Landroid/graphics/Bitmap;
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/graphics/Bitmap;->eraseColor(I)V
    goto :L4
  :L3
  .line 531
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v0, v1, v2 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pic:Landroid/graphics/Bitmap;
  :L4
  .line 535
    new-instance v0, Landroid/graphics/Canvas;
    iget-object v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pic:Landroid/graphics/Bitmap;
    invoke-direct { v0, v1 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 536
    iget-object v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->draw:Landroid/graphics/RectF;
    iget v2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->w:F
    iget v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->h:F
    const/4 v7, 0
    invoke-virtual { v1, v7, v7, v2, v3 }, Landroid/graphics/RectF;->set(FFFF)V
  .line 537
    iget v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->edge:F
    iget v4, p0, Lcom/innioasis/ipp/PlGrid$Mover;->radius:F
    iget v5, p0, Lcom/innioasis/ipp/PlGrid$Mover;->inner:F
    move-object v1, p0
    move-object v2, v0
    move v6, p4
    invoke-direct/range { v1 .. v6 }, Lcom/innioasis/ipp/PlGrid$Mover;->ring(Landroid/graphics/Canvas;FFFI)V
  .line 538
    iget v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->rim:F
    cmpl-float v1, v3, v7
    if-lez v1, :L5
    iget v4, p0, Lcom/innioasis/ipp/PlGrid$Mover;->inner:F
    sub-float v1, v4, v3
    invoke-static { v7, v1 }, Ljava/lang/Math;->max(FF)F
    move-result v5
    invoke-static { p4 }, Lcom/innioasis/ipp/PlGrid;->access$900(I)I
    move-result v6
    move-object v1, p0
    move-object v2, v0
    invoke-direct/range { v1 .. v6 }, Lcom/innioasis/ipp/PlGrid$Mover;->ring(Landroid/graphics/Canvas;FFFI)V
  :L5
  .line 539
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
  .line 541
    iget-object p4, p0, Lcom/innioasis/ipp/PlGrid$Mover;->fade:Landroid/graphics/Paint;
    const/high16 v0, 0x437F0000
    iget v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
    mul-float v1, v1, v0
    invoke-static { v1 }, Ljava/lang/Math;->round(F)I
    move-result v0
    invoke-virtual { p4, v0 }, Landroid/graphics/Paint;->setAlpha(I)V
  .line 542
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
  .line 543
    return-void
  :L9
  .line 529
    return-void
.end method

.method private glide(FFF)F
  .registers 8
  .line 576
    sub-float/2addr p1, p2
  .line 577
    iget v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->lv:F
    const/high16 v1, 0x41F00000
    mul-float v2, p1, v1
    add-float/2addr v0, v2
  .line 578
    const/high16 v2, 0xC1F00000
    mul-float v2, v2, p3
    float-to-double v2, v2
    invoke-static { v2, v3 }, Ljava/lang/Math;->exp(D)D
    move-result-wide v2
    double-to-float v2, v2
  .line 579
    mul-float v3, v0, p3
    add-float/2addr p1, v3
    mul-float p1, p1, v2
  .line 580
    iget v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->lv:F
    mul-float v0, v0, v1
    mul-float v0, v0, p3
    sub-float/2addr v3, v0
    mul-float v3, v3, v2
    iput v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->lv:F
  .line 581
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
  .line 582
    const/4 p1, 0
    iput p1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->lv:F
  .line 583
    return p2
  :L0
  .line 585
    add-float/2addr p2, p1
    return p2
.end method

.method private measure(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 7
  .line 411
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v0
  .line 412
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
  .line 413
    const/4 v1, 0
  :L2
    if-eqz v0, :L4
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v2
    if-ge v1, v2, :L4
  .line 414
    invoke-virtual { p1, v1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v2
  .line 415
    invoke-virtual { p1, v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I
    move-result v3
  .line 416
    const/4 v4, -1
    if-ne v3, v4, :L3
  .line 413
    add-int/lit8 v1, v1, 1
    goto :L2
  :L3
  .line 417
    invoke-virtual { v2 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object p1
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 418
    invoke-virtual { v0, v2 }, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getDecoratedMeasuredHeight(Landroid/view/View;)I
    move-result v1
    iget v4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    add-int/2addr v1, v4
    iget v4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I
    add-int/2addr v1, v4
    iput v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pitch:I
  .line 419
    iget v4, p0, Lcom/innioasis/ipp/PlGrid$Mover;->span:I
    div-int/2addr v3, v4
    mul-int v3, v3, v1
    invoke-virtual { v0, v2 }, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getDecoratedTop(Landroid/view/View;)I
    move-result v0
    iget p1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    sub-int/2addr v0, p1
    sub-int/2addr v3, v0
    iput v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->off:I
  .line 420
    return-void
  :L4
  .line 422
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollOffset()I
    move-result p1
    iput p1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->off:I
  .line 423
    return-void
.end method

.method private project(Landroidx/recyclerview/widget/RecyclerView;I)[F
  .registers 8
  .line 507
    const/4 v0, 0
  :L0
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v1
    if-ge v0, v1, :L4
  .line 508
    invoke-virtual { p1, v0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v1
  .line 509
    invoke-virtual { p1, v1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I
    move-result v2
  .line 510
    const/4 v3, -1
    if-eq v2, v3, :L3
    iget v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->span:I
    rem-int v4, v2, v3
    rem-int v3, p2, v3
    if-eq v4, v3, :L1
    goto :L3
  :L1
  .line 511
    invoke-direct { p0, v1, p1 }, Lcom/innioasis/ipp/PlGrid$Mover;->shape(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;)[F
    move-result-object v1
  .line 512
    if-nez v1, :L2
    goto :L3
  :L2
  .line 513
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
  .line 514
    return-object v1
  :L3
  .line 507
    add-int/lit8 v0, v0, 1
    goto :L0
  :L4
  .line 516
    const/4 p1, 0
    return-object p1
.end method

.method private rested(Z)Z
  .registers 3
  .line 549
    iget-boolean v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->was:Z
    if-eqz v0, :L0
    if-nez p1, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
  .line 550
    iput-boolean p1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->was:Z
  .line 551
    return v0
.end method

.method private ring(Landroid/graphics/Canvas;FFFI)V
  .registers 9
  .line 590
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->ring:Landroid/graphics/Path;
    invoke-virtual { v0 }, Landroid/graphics/Path;->reset()V
  .line 591
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->ring:Landroid/graphics/Path;
    sget-object v1, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;
    invoke-virtual { v0, v1 }, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V
  .line 592
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->ring:Landroid/graphics/Path;
    iget-object v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->draw:Landroid/graphics/RectF;
    sget-object v2, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;
    invoke-virtual { v0, v1, p3, p3, v2 }, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V
  .line 593
    iget-object p3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->draw:Landroid/graphics/RectF;
    invoke-virtual { p3, p2, p2 }, Landroid/graphics/RectF;->inset(FF)V
  .line 594
    iget-object p2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->ring:Landroid/graphics/Path;
    iget-object p3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->draw:Landroid/graphics/RectF;
    sget-object v0, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;
    invoke-virtual { p2, p3, p4, p4, v0 }, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V
  .line 595
    iget-object p2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->paint:Landroid/graphics/Paint;
    invoke-virtual { p2, p5 }, Landroid/graphics/Paint;->setColor(I)V
  .line 596
    iget-object p2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->ring:Landroid/graphics/Path;
    iget-object p3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->paint:Landroid/graphics/Paint;
    invoke-virtual { p1, p2, p3 }, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V
  .line 597
    return-void
.end method

.method private shape(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;)[F
  .registers 11
  .line 457
    const v0, 2131362091
    invoke-virtual { p1, v0 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 458
    const v1, 2131361934
    invoke-virtual { p1, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 459
    const v2, 2131362087
    invoke-virtual { p1, v2 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v2
  .line 460
    instance-of v3, v1, Landroidx/cardview/widget/CardView;
    const/4 v4, 0
    if-eqz v3, :L5
    if-nez v2, :L0
    goto/16 :L5
  :L0
  .line 461
    iget-boolean v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->photos:Z
    const/4 v5, 1
    const/4 v6, 0
    const/4 v7, 0
    if-eqz v3, :L1
  .line 462
    invoke-virtual { p1 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object p1
    invoke-virtual { p1 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object p1
    iget p1, p1, Landroid/util/DisplayMetrics;->density:F
    const/high16 v0, 0x40000000
    mul-float p1, p1, v0
  .line 463
    iget v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->off:I
    invoke-static { v2, p2, v3, v7 }, Lcom/innioasis/ipp/PlGrid$Mover;->box(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;IZ)[F
    move-result-object p2
  .line 464
    invoke-virtual { v2 }, Landroid/view/View;->getWidth()I
    move-result v3
    int-to-float v3, v3
    mul-float v0, v0, p1
    add-float/2addr v3, v0
    iput v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->w:F
  .line 465
    invoke-virtual { v2 }, Landroid/view/View;->getHeight()I
    move-result v2
    int-to-float v2, v2
    add-float/2addr v2, v0
    iput v2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->h:F
  .line 466
    iput p1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->edge:F
  .line 467
    iput v6, p0, Lcom/innioasis/ipp/PlGrid$Mover;->rim:F
  .line 468
    check-cast v1, Landroidx/cardview/widget/CardView;
    invoke-virtual { v1 }, Landroidx/cardview/widget/CardView;->getRadius()F
    move-result v0
    iput v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->radius:F
  .line 469
    iput v6, p0, Lcom/innioasis/ipp/PlGrid$Mover;->inner:F
  .line 470
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
  .line 472
    instance-of p1, v0, Landroidx/cardview/widget/CardView;
    if-nez p1, :L2
    return-object v4
  :L2
  .line 475
    iget p1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->off:I
    invoke-static { v0, p2, p1, v5 }, Lcom/innioasis/ipp/PlGrid$Mover;->box(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;IZ)[F
    move-result-object p1
  .line 476
    iget v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->off:I
    invoke-static { v1, p2, v3, v5 }, Lcom/innioasis/ipp/PlGrid$Mover;->box(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;IZ)[F
    move-result-object v3
    iget v4, p0, Lcom/innioasis/ipp/PlGrid$Mover;->off:I
    invoke-static { v2, p2, v4, v7 }, Lcom/innioasis/ipp/PlGrid$Mover;->box(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;IZ)[F
    move-result-object p2
  .line 477
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
  .line 478
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
  .line 479
    aget v2, v3, v7
    aget v4, p1, v7
    sub-float/2addr v2, v4
    const/high16 v4, 0x3F800000
    invoke-static { v4, v2 }, Ljava/lang/Math;->max(FF)F
    move-result v2
    iput v2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->edge:F
  .line 481
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
  .line 482
    check-cast v0, Landroidx/cardview/widget/CardView;
    invoke-virtual { v0 }, Landroidx/cardview/widget/CardView;->getRadius()F
    move-result p2
    iput p2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->radius:F
  .line 483
    check-cast v1, Landroidx/cardview/widget/CardView;
    invoke-virtual { v1 }, Landroidx/cardview/widget/CardView;->getRadius()F
    move-result p2
    iput p2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->inner:F
  .line 484
    return-object p1
  :L5
  .line 460
    return-object v4
.end method

.method private watch(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
  .registers 3
  .line 438
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->watched:Ljava/lang/ref/WeakReference;
    if-eqz v0, :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    if-ne v0, p1, :L0
    return-void
  :L0
  .line 439
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->watched:Ljava/lang/ref/WeakReference;
  .line 440
    new-instance v0, Lcom/innioasis/ipp/PlGrid$Snap;
    invoke-direct { v0, p0 }, Lcom/innioasis/ipp/PlGrid$Snap;-><init>(Lcom/innioasis/ipp/PlGrid$Mover;)V
    invoke-virtual { p1, v0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->registerAdapterDataObserver(Landroidx/recyclerview/widget/RecyclerView$AdapterDataObserver;)V
  .line 441
    return-void
.end method

.method along(I)Z
  .registers 4
  .line 556
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
  .line 373
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->list:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 374
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
  .line 366
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->list:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 367
    if-eqz v0, :L1
    iget-boolean v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
    if-eqz v1, :L1
    iget-boolean v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->leg:Z
    if-eqz v1, :L0
    goto :L1
  :L0
  .line 368
    iget v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->lv:F
    int-to-float p1, p1
    const/high16 v2, 0x43700000
    mul-float p1, p1, v2
    add-float/2addr v1, p1
    iput v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->lv:F
  .line 369
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->postInvalidateOnAnimation()V
  .line 370
    return-void
  :L1
  .line 367
    return-void
.end method

.method public count()I
  .registers 2
  .line 378
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->list:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 379
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v0
  :L1
  .line 380
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
  .line 602
    move-object/from16 v1, p0
    move-object/from16 v0, p2
  :L0
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    iput-wide v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->drawn:J
  .line 603
    invoke-virtual/range { p2 .. p2 }, Landroidx/recyclerview/widget/RecyclerView;->getContext()Landroid/content/Context;
    move-result-object v2
  .line 604
    invoke-virtual/range { p2 .. p2 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v3
  .line 605
    const/high16 v4, 0x3F800000
    const/4 v5, 0
    if-eqz v3, :L39
    invoke-static { v2 }, Lcom/innioasis/ipp/PlGrid;->access$1000(Landroid/content/Context;)Z
    move-result v2
    if-nez v2, :L39
    instance-of v2, v3, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-eqz v2, :L1
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->access$1100()Z
    move-result v2
    if-eqz v2, :L1
    goto/16 :L39
  :L1
  .line 612
    invoke-static/range { p2 .. p2 }, Lcom/innioasis/ipp/Theme;->tilesAhead(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 613
    invoke-direct { v1, v0 }, Lcom/innioasis/ipp/PlGrid$Mover;->measure(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 614
    invoke-static/range { p2 .. p2 }, Lcom/innioasis/ipp/PlGrid;->cursorAt(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result v2
  .line 615
    iget-boolean v6, v1, Lcom/innioasis/ipp/PlGrid$Mover;->photos:Z
    if-eqz v6, :L2
    invoke-direct { v1, v3 }, Lcom/innioasis/ipp/PlGrid$Mover;->watch(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
  :L2
  .line 616
    invoke-virtual/range { p2 .. p2 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v6
    const/4 v7, 0
    if-nez v6, :L3
    move-object v6, v7
    goto :L4
  :L3
  .line 617
    invoke-virtual/range { p2 .. p2 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v6
    invoke-virtual { v6, v2 }, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object v6
  :L4
  .line 618
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v8
  .line 619
    nop
  .line 620
    if-nez v6, :L5
    goto :L6
  :L5
    invoke-direct { v1, v6, v0 }, Lcom/innioasis/ipp/PlGrid$Mover;->shape(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;)[F
    move-result-object v7
  :L6
  .line 621
    if-nez v7, :L7
    iget-boolean v6, v1, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
    if-eqz v6, :L7
  .line 623
    invoke-direct { v1, v0, v2 }, Lcom/innioasis/ipp/PlGrid$Mover;->project(Landroidx/recyclerview/widget/RecyclerView;I)[F
    move-result-object v7
  :L7
  .line 625
    const-wide/16 v10, 0
    const/4 v6, 0
    const/4 v12, 1
    if-eqz v7, :L8
    iget-boolean v13, v1, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
    if-nez v13, :L8
  .line 626
    aget v3, v7, v5
    iput v3, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
    aget v4, v7, v12
    iput v4, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
  .line 627
    iput v6, v1, Lcom/innioasis/ipp/PlGrid$Mover;->lv:F
  .line 628
    iput v3, v1, Lcom/innioasis/ipp/PlGrid$Mover;->tx:F
  .line 629
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->txPos:I
  .line 630
    iput-boolean v12, v1, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
    goto/16 :L30
  :L8
  .line 631
    if-eqz v7, :L30
  .line 632
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
  .line 633
    invoke-static/range { p2 .. p2 }, Lcom/innioasis/ipp/Wheel$Glider;->left(Landroidx/recyclerview/widget/RecyclerView;)F
    move-result v14
  .line 634
    invoke-static/range { p2 .. p2 }, Lcom/innioasis/ipp/Wheel;->held(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v16
  .line 637
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
  .line 638
    iget-boolean v11, v1, Lcom/innioasis/ipp/PlGrid$Mover;->leg:Z
    if-nez v11, :L21
    aget v11, v7, v12
    iget v15, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
    cmpl-float v11, v11, v15
    if-eqz v11, :L21
    if-nez v10, :L21
  .line 639
    if-eqz v16, :L13
    invoke-static/range { p2 .. p2 }, Lcom/innioasis/ipp/Wheel;->releaseSoon(Landroidx/recyclerview/widget/RecyclerView;)V
  :L13
  .line 641
    sget v11, Lcom/innioasis/ipp/Loop;->wraps:I
    iget v15, v1, Lcom/innioasis/ipp/PlGrid$Mover;->seenWraps:I
    if-eq v11, v15, :L14
    const/4 v11, 1
    goto :L15
  :L14
    const/4 v11, 0
  :L15
  .line 642
    sget v15, Lcom/innioasis/ipp/Loop;->wraps:I
    iput v15, v1, Lcom/innioasis/ipp/PlGrid$Mover;->seenWraps:I
  .line 643
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
  .line 647
    iput-boolean v12, v1, Lcom/innioasis/ipp/PlGrid$Mover;->leg:Z
  .line 648
    iget v11, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
    iget v15, v1, Lcom/innioasis/ipp/PlGrid$Mover;->off:I
    int-to-float v15, v15
    sub-float v15, v11, v15
    iput v15, v1, Lcom/innioasis/ipp/PlGrid$Mover;->sy:F
  .line 649
    iput-wide v8, v1, Lcom/innioasis/ipp/PlGrid$Mover;->legAt:J
  .line 650
    aget v15, v7, v12
    cmpl-float v11, v15, v11
    if-lez v11, :L17
    const/4 v11, 1
    goto :L18
  :L17
    const/4 v11, 0
  :L18
    iput-boolean v11, v1, Lcom/innioasis/ipp/PlGrid$Mover;->legDown:Z
  .line 651
    iput v4, v1, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
  .line 652
    iput-boolean v5, v1, Lcom/innioasis/ipp/PlGrid$Mover;->placed:Z
    goto :L20
  :L19
  .line 654
    aget v11, v7, v5
    iput v11, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
  .line 655
    aget v11, v7, v12
    iput v11, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
  .line 656
    iput v6, v1, Lcom/innioasis/ipp/PlGrid$Mover;->lv:F
  :L20
  .line 658
    aget v11, v7, v5
    iput v11, v1, Lcom/innioasis/ipp/PlGrid$Mover;->lx:F
  .line 659
    aget v11, v7, v12
    iput v11, v1, Lcom/innioasis/ipp/PlGrid$Mover;->ly:F
  :L21
  .line 661
    iget-boolean v11, v1, Lcom/innioasis/ipp/PlGrid$Mover;->leg:Z
    if-eqz v11, :L26
  .line 664
    invoke-virtual { v3 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I
    move-result v3
    invoke-direct { v1, v0, v2, v3 }, Lcom/innioasis/ipp/PlGrid$Mover;->edgeBox(Landroidx/recyclerview/widget/RecyclerView;II)[F
    move-result-object v2
  .line 665
    if-eqz v2, :L22
  .line 666
    aget v3, v2, v5
    iput v3, v1, Lcom/innioasis/ipp/PlGrid$Mover;->lx:F
  .line 667
    aget v2, v2, v12
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->ly:F
  :L22
  .line 670
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
  .line 671
    iget-boolean v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->placed:Z
    const/high16 v3, 0x42700000
    if-nez v2, :L24
  .line 672
    iget v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
    const/high16 v4, 0x447A0000
    mul-float v13, v13, v4
    div-float/2addr v13, v3
    sub-float/2addr v2, v13
    invoke-static { v6, v2 }, Ljava/lang/Math;->max(FF)F
    move-result v2
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
  .line 673
    iget v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->sy:F
    iget v3, v1, Lcom/innioasis/ipp/PlGrid$Mover;->off:I
    int-to-float v3, v3
    add-float/2addr v2, v3
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
    goto :L25
  :L24
  .line 675
    iget v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->lx:F
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
  .line 676
    iget v10, v1, Lcom/innioasis/ipp/PlGrid$Mover;->ly:F
    iput v10, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
  .line 677
    iput v6, v1, Lcom/innioasis/ipp/PlGrid$Mover;->lv:F
  .line 678
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->tx:F
  .line 679
    iget v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->edgePos:I
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->txPos:I
  .line 680
    iget v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
    const/high16 v10, 0x447A0000
    mul-float v13, v13, v10
    div-float/2addr v13, v3
    add-float/2addr v2, v13
    invoke-static { v4, v2 }, Ljava/lang/Math;->min(FF)F
    move-result v2
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
  .line 681
    cmpl-float v2, v2, v4
    if-ltz v2, :L25
    iput-boolean v5, v1, Lcom/innioasis/ipp/PlGrid$Mover;->leg:Z
  :L25
  .line 683
    goto :L28
  :L26
    if-eqz v10, :L27
  .line 684
    iget v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
    iget v3, v1, Lcom/innioasis/ipp/PlGrid$Mover;->tx:F
    invoke-direct { v1, v2, v3, v13 }, Lcom/innioasis/ipp/PlGrid$Mover;->glide(FFF)F
    move-result v2
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
    goto :L28
  :L27
  .line 686
    iget v3, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
    aget v4, v7, v5
    invoke-direct { v1, v3, v4, v13 }, Lcom/innioasis/ipp/PlGrid$Mover;->glide(FFF)F
    move-result v3
    iput v3, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
  .line 687
    aget v3, v7, v5
    iput v3, v1, Lcom/innioasis/ipp/PlGrid$Mover;->tx:F
  .line 688
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->txPos:I
  :L28
  .line 690
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
  .line 692
    invoke-direct { v1, v5 }, Lcom/innioasis/ipp/PlGrid$Mover;->rested(Z)Z
    move-result v2
    if-eqz v2, :L31
    invoke-static/range { p2 .. p2 }, Lcom/innioasis/ipp/PlGrid$Tidy;->at(Landroidx/recyclerview/widget/RecyclerView;)V
  :L31
  .line 694
    if-eqz v5, :L32
    invoke-static { }, Lcom/innioasis/ipp/Loop;->animating()V
  :L32
  .line 695
    iget-boolean v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
    if-eqz v2, :L34
    invoke-virtual/range { p2 .. p2 }, Landroidx/recyclerview/widget/RecyclerView;->hasWindowFocus()Z
    move-result v2
    if-eqz v2, :L34
  .line 696
    iget-object v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->list:Ljava/lang/ref/WeakReference;
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
    if-eq v2, v0, :L33
    new-instance v2, Ljava/lang/ref/WeakReference;
    invoke-direct { v2, v0 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->list:Ljava/lang/ref/WeakReference;
  :L33
  .line 697
    invoke-static/range { p0 .. p0 }, Lcom/innioasis/ipp/Loop;->bumper(Lcom/innioasis/ipp/Loop$Bumper;)V
  :L34
  .line 699
    if-eqz v5, :L35
    goto :L36
  :L35
    const-wide/16 v8, 0
  :L36
    iput-wide v8, v1, Lcom/innioasis/ipp/PlGrid$Mover;->last:J
  .line 700
    iget-boolean v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
    if-nez v2, :L37
    return-void
  :L37
  .line 701
    if-eqz v5, :L38
    invoke-virtual/range { p2 .. p2 }, Landroidx/recyclerview/widget/RecyclerView;->postInvalidateOnAnimation()V
  :L38
  .line 703
    goto :L43
  :L39
  .line 606
    invoke-static/range { p2 .. p2 }, Lcom/innioasis/ipp/Wheel;->held(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v2
    if-eqz v2, :L40
    invoke-static/range { p2 .. p2 }, Lcom/innioasis/ipp/Wheel;->releaseSoon(Landroidx/recyclerview/widget/RecyclerView;)V
  :L40
  .line 607
    iput-boolean v5, v1, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
  .line 608
    iput-boolean v5, v1, Lcom/innioasis/ipp/PlGrid$Mover;->leg:Z
  .line 609
    iput v4, v1, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
  :L41
  .line 610
    return-void
  :L42
  .line 702
    move-exception v0
  :L43
  .line 704
    return-void
.end method

.method public onDrawOver(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V
  .catchall { :L0 .. :L6 } :L7
  .registers 10
  :L0
  .line 709
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
  .line 710
    iget-boolean p3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
    if-nez p3, :L2
    return-void
  :L2
  .line 711
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
  .line 712
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
  .line 714
    goto :L8
  :L7
  .line 713
    move-exception p1
  :L8
  .line 715
    return-void
.end method

.method snap()V
  .registers 2
  .line 444
    const/4 v0, 0
    iput-boolean v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
  .line 445
    iput-boolean v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->leg:Z
  .line 446
    const/high16 v0, 0x3F800000
    iput v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
  .line 447
    return-void
.end method
