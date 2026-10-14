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

.field private final static RATE:F = 22.0F

.field private final static VMAX:F = 6000.0F

.field private final static VMIN:F = 700.0F

.field private final draw:Landroid/graphics/RectF;

.field private drawn:J

.field private edge:F

.field private fa:F

.field private final fade:Landroid/graphics/Paint;

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

.field private w:F

.field private was:Z

.method constructor <init>()V
  .registers 3
  .line 285
    invoke-direct { p0 }, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;-><init>()V
  .line 290
    new-instance v0, Landroid/graphics/Paint;
    const/4 v1, 1
    invoke-direct { v0, v1 }, Landroid/graphics/Paint;-><init>(I)V
    iput-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->paint:Landroid/graphics/Paint;
  .line 292
    new-instance v0, Landroid/graphics/RectF;
    invoke-direct { v0 }, Landroid/graphics/RectF;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->draw:Landroid/graphics/RectF;
  .line 293
    new-instance v0, Landroid/graphics/Path;
    invoke-direct { v0 }, Landroid/graphics/Path;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->ring:Landroid/graphics/Path;
  .line 299
    iput v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->span:I
  .line 301
    const/high16 v0, 0x3F800000
    iput v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
  .line 307
    new-instance v0, Landroid/graphics/Paint;
    invoke-direct { v0 }, Landroid/graphics/Paint;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->fade:Landroid/graphics/Paint;
    return-void
.end method

.method private static box(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;IZ)[F
  .registers 6
  .line 385
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
  .line 386
    nop
  :L4
    if-eqz p0, :L6
    if-eq p0, p1, :L6
  .line 387
    invoke-virtual { p0 }, Landroid/view/View;->getLeft()I
    move-result p3
    int-to-float p3, p3
    add-float/2addr v0, p3
  .line 388
    invoke-virtual { p0 }, Landroid/view/View;->getTop()I
    move-result p3
    int-to-float p3, p3
    add-float/2addr p2, p3
  .line 389
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p3
    instance-of p3, p3, Landroid/view/View;
    if-nez p3, :L5
    goto :L6
  :L5
  .line 386
    invoke-virtual { p0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object p0
    check-cast p0, Landroid/view/View;
    goto :L4
  :L6
  .line 391
    const/4 p0, 2
    new-array p0, p0, [F
    aput v0, p0, v1
    const/4 p1, 1
    aput p2, p0, p1
    return-object p0
.end method

.method private frame(Landroid/graphics/Canvas;FFI)V
  .registers 13
  .line 351
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
  .line 353
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
  .line 354
    if-lez v0, :L9
    if-gtz v1, :L1
    goto/16 :L9
  :L1
  .line 355
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
  .line 358
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pic:Landroid/graphics/Bitmap;
    const/4 v1, 0
    invoke-virtual { v0, v1 }, Landroid/graphics/Bitmap;->eraseColor(I)V
    goto :L4
  :L3
  .line 356
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;
    invoke-static { v0, v1, v2 }, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pic:Landroid/graphics/Bitmap;
  :L4
  .line 360
    new-instance v0, Landroid/graphics/Canvas;
    iget-object v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pic:Landroid/graphics/Bitmap;
    invoke-direct { v0, v1 }, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V
  .line 361
    iget-object v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->draw:Landroid/graphics/RectF;
    iget v2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->w:F
    iget v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->h:F
    const/4 v7, 0
    invoke-virtual { v1, v7, v7, v2, v3 }, Landroid/graphics/RectF;->set(FFFF)V
  .line 362
    iget v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->edge:F
    iget v4, p0, Lcom/innioasis/ipp/PlGrid$Mover;->radius:F
    iget v5, p0, Lcom/innioasis/ipp/PlGrid$Mover;->inner:F
    move-object v1, p0
    move-object v2, v0
    move v6, p4
    invoke-direct/range { v1 .. v6 }, Lcom/innioasis/ipp/PlGrid$Mover;->ring(Landroid/graphics/Canvas;FFFI)V
  .line 363
    iget v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->rim:F
    cmpl-float v1, v3, v7
    if-lez v1, :L5
    iget v4, p0, Lcom/innioasis/ipp/PlGrid$Mover;->inner:F
    sub-float v1, v4, v3
    invoke-static { v7, v1 }, Ljava/lang/Math;->max(FF)F
    move-result v5
    invoke-static { p4 }, Lcom/innioasis/ipp/PlGrid;->access$200(I)I
    move-result v6
    move-object v1, p0
    move-object v2, v0
    invoke-direct/range { v1 .. v6 }, Lcom/innioasis/ipp/PlGrid$Mover;->ring(Landroid/graphics/Canvas;FFFI)V
  :L5
  .line 364
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
  .line 366
    iget-object p4, p0, Lcom/innioasis/ipp/PlGrid$Mover;->fade:Landroid/graphics/Paint;
    const/high16 v0, 0x437F0000
    iget v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
    mul-float v1, v1, v0
    invoke-static { v1 }, Ljava/lang/Math;->round(F)I
    move-result v0
    invoke-virtual { p4, v0 }, Landroid/graphics/Paint;->setAlpha(I)V
  .line 367
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
  .line 368
    return-void
  :L9
  .line 354
    return-void
.end method

.method private static glide(FFF)F
  .registers 6
  .line 396
    sub-float v0, p1, p0
    invoke-static { v0 }, Ljava/lang/Math;->abs(F)F
    move-result v1
  .line 397
    const/high16 v2, 0x3F800000
    cmpg-float v2, v1, v2
    if-gez v2, :L0
    return p1
  :L0
  .line 398
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
  .line 399
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
  .line 315
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v0
  .line 316
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
  .line 317
    const/4 v1, 0
  :L2
    if-eqz v0, :L4
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v2
    if-ge v1, v2, :L4
  .line 318
    invoke-virtual { p1, v1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v2
  .line 319
    invoke-virtual { p1, v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I
    move-result v3
  .line 320
    const/4 v4, -1
    if-ne v3, v4, :L3
  .line 317
    add-int/lit8 v1, v1, 1
    goto :L2
  :L3
  .line 321
    invoke-virtual { v2 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object p1
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;
  .line 322
    invoke-virtual { v0, v2 }, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getDecoratedMeasuredHeight(Landroid/view/View;)I
    move-result v1
    iget v4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    add-int/2addr v1, v4
    iget v4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I
    add-int/2addr v1, v4
    iput v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pitch:I
  .line 323
    iget v4, p0, Lcom/innioasis/ipp/PlGrid$Mover;->span:I
    div-int/2addr v3, v4
    mul-int v3, v3, v1
    invoke-virtual { v0, v2 }, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getDecoratedTop(Landroid/view/View;)I
    move-result v0
    iget p1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I
    sub-int/2addr v0, p1
    sub-int/2addr v3, v0
    iput v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->off:I
  .line 324
    return-void
  :L4
  .line 326
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollOffset()I
    move-result p1
    iput p1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->off:I
  .line 327
    return-void
.end method

.method private project(Landroidx/recyclerview/widget/RecyclerView;I)[F
  .registers 8
  .line 331
    const/4 v0, 0
  :L0
    invoke-virtual { p1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v1
    if-ge v0, v1, :L4
  .line 332
    invoke-virtual { p1, v0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v1
  .line 333
    invoke-virtual { p1, v1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I
    move-result v2
  .line 334
    const/4 v3, -1
    if-eq v2, v3, :L3
    iget v3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->span:I
    rem-int v4, v2, v3
    rem-int v3, p2, v3
    if-eq v4, v3, :L1
    goto :L3
  :L1
  .line 335
    const v3, 2131362091
    invoke-virtual { v1, v3 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v1
  .line 336
    if-nez v1, :L2
    goto :L3
  :L2
  .line 337
    iget v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->off:I
    const/4 v3, 1
    invoke-static { v1, p1, v0, v3 }, Lcom/innioasis/ipp/PlGrid$Mover;->box(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;IZ)[F
    move-result-object p1
  .line 338
    aget v0, p1, v3
    iget v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->span:I
    div-int/2addr p2, v1
    div-int/2addr v2, v1
    sub-int/2addr p2, v2
    iget v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->pitch:I
    mul-int p2, p2, v1
    int-to-float p2, p2
    add-float/2addr v0, p2
    aput v0, p1, v3
  .line 339
    return-object p1
  :L3
  .line 331
    add-int/lit8 v0, v0, 1
    goto :L0
  :L4
  .line 341
    const/4 p1, 0
    return-object p1
.end method

.method private rested(Z)Z
  .registers 3
  .line 374
    iget-boolean v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->was:Z
    if-eqz v0, :L0
    if-nez p1, :L0
    const/4 v0, 1
    goto :L1
  :L0
    const/4 v0, 0
  :L1
  .line 375
    iput-boolean p1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->was:Z
  .line 376
    return v0
.end method

.method private ring(Landroid/graphics/Canvas;FFFI)V
  .registers 9
  .line 404
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->ring:Landroid/graphics/Path;
    invoke-virtual { v0 }, Landroid/graphics/Path;->reset()V
  .line 405
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->ring:Landroid/graphics/Path;
    sget-object v1, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;
    invoke-virtual { v0, v1 }, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V
  .line 406
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->ring:Landroid/graphics/Path;
    iget-object v1, p0, Lcom/innioasis/ipp/PlGrid$Mover;->draw:Landroid/graphics/RectF;
    sget-object v2, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;
    invoke-virtual { v0, v1, p3, p3, v2 }, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V
  .line 407
    iget-object p3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->draw:Landroid/graphics/RectF;
    invoke-virtual { p3, p2, p2 }, Landroid/graphics/RectF;->inset(FF)V
  .line 408
    iget-object p2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->ring:Landroid/graphics/Path;
    iget-object p3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->draw:Landroid/graphics/RectF;
    sget-object v0, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;
    invoke-virtual { p2, p3, p4, p4, v0 }, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V
  .line 409
    iget-object p2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->paint:Landroid/graphics/Paint;
    invoke-virtual { p2, p5 }, Landroid/graphics/Paint;->setColor(I)V
  .line 410
    iget-object p2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->ring:Landroid/graphics/Path;
    iget-object p3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->paint:Landroid/graphics/Paint;
    invoke-virtual { p1, p2, p3 }, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V
  .line 411
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V
  .catchall { :L0 .. :L35 } :L36
  .registers 20
  .line 416
    move-object/from16 v1, p0
    move-object/from16 v0, p2
  :L0
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v2
    iput-wide v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->drawn:J
  .line 417
    invoke-virtual/range { p2 .. p2 }, Landroidx/recyclerview/widget/RecyclerView;->getContext()Landroid/content/Context;
    move-result-object v2
  .line 418
    invoke-virtual/range { p2 .. p2 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v3
  .line 419
    const/high16 v4, 0x3F800000
    const/4 v5, 0
    if-eqz v3, :L34
    invoke-static { v2 }, Lcom/innioasis/ipp/PlGrid;->access$300(Landroid/content/Context;)Z
    move-result v2
    if-nez v2, :L34
    instance-of v2, v3, Lcom/innioasis/music/adapter/rv/RVBaseAdapter;
    if-eqz v2, :L1
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->access$400()Z
    move-result v2
    if-eqz v2, :L1
    goto/16 :L34
  :L1
  .line 425
    invoke-static/range { p2 .. p2 }, Lcom/innioasis/ipp/Theme;->tilesAhead(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 426
    invoke-direct { v1, v0 }, Lcom/innioasis/ipp/PlGrid$Mover;->measure(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 427
    invoke-static/range { p2 .. p2 }, Lcom/innioasis/ipp/PlGrid;->cursorAt(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result v2
  .line 428
    invoke-virtual/range { p2 .. p2 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v3
    const/4 v6, 0
    if-nez v3, :L2
    move-object v3, v6
    goto :L3
  :L2
  .line 429
    invoke-virtual/range { p2 .. p2 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v3
    invoke-virtual { v3, v2 }, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object v3
  :L3
  .line 430
    if-nez v3, :L4
    move-object v7, v6
    goto :L5
  :L4
    const v7, 2131362091
    invoke-virtual { v3, v7 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v7
  :L5
  .line 431
    if-nez v3, :L6
    move-object v8, v6
    goto :L7
  :L6
    const v8, 2131361934
    invoke-virtual { v3, v8 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v8
  :L7
  .line 432
    if-nez v3, :L8
    move-object v3, v6
    goto :L9
  :L8
    const v9, 2131362087
    invoke-virtual { v3, v9 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
    move-result-object v3
  :L9
  .line 433
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v9
  .line 434
    nop
  .line 435
    nop
  .line 436
    instance-of v11, v7, Landroidx/cardview/widget/CardView;
    const/4 v12, 0
    const/4 v13, 1
    if-eqz v11, :L12
    instance-of v11, v8, Landroidx/cardview/widget/CardView;
    if-eqz v11, :L12
    if-eqz v3, :L12
  .line 439
    iget v6, v1, Lcom/innioasis/ipp/PlGrid$Mover;->off:I
    invoke-static { v7, v0, v6, v13 }, Lcom/innioasis/ipp/PlGrid$Mover;->box(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;IZ)[F
    move-result-object v6
  .line 440
    iget v11, v1, Lcom/innioasis/ipp/PlGrid$Mover;->off:I
    invoke-static { v8, v0, v11, v13 }, Lcom/innioasis/ipp/PlGrid$Mover;->box(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;IZ)[F
    move-result-object v11
    iget v14, v1, Lcom/innioasis/ipp/PlGrid$Mover;->off:I
    invoke-static { v3, v0, v14, v5 }, Lcom/innioasis/ipp/PlGrid$Mover;->box(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;IZ)[F
    move-result-object v3
  .line 441
    invoke-virtual { v7 }, Landroid/view/View;->getWidth()I
    move-result v14
    invoke-virtual { v7 }, Landroid/view/View;->getPaddingLeft()I
    move-result v15
    sub-int/2addr v14, v15
    invoke-virtual { v7 }, Landroid/view/View;->getPaddingRight()I
    move-result v15
    sub-int/2addr v14, v15
    int-to-float v14, v14
    iput v14, v1, Lcom/innioasis/ipp/PlGrid$Mover;->w:F
  .line 442
    invoke-virtual { v7 }, Landroid/view/View;->getHeight()I
    move-result v14
    invoke-virtual { v7 }, Landroid/view/View;->getPaddingTop()I
    move-result v15
    sub-int/2addr v14, v15
    invoke-virtual { v7 }, Landroid/view/View;->getPaddingBottom()I
    move-result v15
    sub-int/2addr v14, v15
    int-to-float v14, v14
    iput v14, v1, Lcom/innioasis/ipp/PlGrid$Mover;->h:F
  .line 443
    aget v14, v11, v5
    aget v15, v6, v5
    sub-float/2addr v14, v15
    invoke-static { v4, v14 }, Ljava/lang/Math;->max(FF)F
    move-result v14
    iput v14, v1, Lcom/innioasis/ipp/PlGrid$Mover;->edge:F
  .line 445
    const v14, 2131362561
    invoke-virtual { v8, v14 }, Landroid/view/View;->getTag(I)Ljava/lang/Object;
    move-result-object v14
    if-nez v14, :L10
    const/4 v3, 0
    goto :L11
  :L10
    aget v3, v3, v5
    aget v11, v11, v5
    sub-float/2addr v3, v11
    invoke-static { v12, v3 }, Ljava/lang/Math;->max(FF)F
    move-result v3
  :L11
    iput v3, v1, Lcom/innioasis/ipp/PlGrid$Mover;->rim:F
  .line 446
    check-cast v7, Landroidx/cardview/widget/CardView;
    invoke-virtual { v7 }, Landroidx/cardview/widget/CardView;->getRadius()F
    move-result v3
    iput v3, v1, Lcom/innioasis/ipp/PlGrid$Mover;->radius:F
  .line 447
    check-cast v8, Landroidx/cardview/widget/CardView;
    invoke-virtual { v8 }, Landroidx/cardview/widget/CardView;->getRadius()F
    move-result v3
    iput v3, v1, Lcom/innioasis/ipp/PlGrid$Mover;->inner:F
    goto :L13
  :L12
  .line 448
    iget-boolean v3, v1, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
    if-eqz v3, :L13
  .line 450
    invoke-direct { v1, v0, v2 }, Lcom/innioasis/ipp/PlGrid$Mover;->project(Landroidx/recyclerview/widget/RecyclerView;I)[F
    move-result-object v6
    goto :L14
  :L13
  .line 448
    nop
  :L14
  .line 452
    const-wide/16 v7, 0
    if-eqz v6, :L15
    iget-boolean v3, v1, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
    if-nez v3, :L15
  .line 453
    aget v2, v6, v5
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
    aget v2, v6, v13
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
  .line 454
    iput-boolean v13, v1, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
    goto/16 :L28
  :L15
  .line 455
    if-eqz v6, :L28
  .line 456
    iget-wide v14, v1, Lcom/innioasis/ipp/PlGrid$Mover;->last:J
    const/high16 v3, 0x447A0000
    cmp-long v11, v14, v7
    if-nez v11, :L16
    const v11, 1015222895
    goto :L17
  :L16
    sub-long v14, v9, v14
    long-to-float v11, v14
    div-float/2addr v11, v3
    const v14, 1028443341
    invoke-static { v14, v11 }, Ljava/lang/Math;->min(FF)F
    move-result v11
  :L17
  .line 457
    invoke-static/range { p2 .. p2 }, Lcom/innioasis/ipp/Wheel$Glider;->left(Landroidx/recyclerview/widget/RecyclerView;)F
    move-result v14
  .line 458
    iget-boolean v15, v1, Lcom/innioasis/ipp/PlGrid$Mover;->leg:Z
    if-nez v15, :L21
    aget v15, v6, v13
    iget v7, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
    cmpl-float v8, v15, v7
    if-eqz v8, :L21
  .line 459
    sub-float/2addr v15, v7
    invoke-static { v15 }, Ljava/lang/Math;->abs(F)F
    move-result v7
    iget v8, v1, Lcom/innioasis/ipp/PlGrid$Mover;->pitch:I
    int-to-float v8, v8
    const/high16 v15, 0x3FC00000
    mul-float v8, v8, v15
    cmpg-float v7, v7, v8
    if-lez v7, :L19
    cmpl-float v7, v14, v12
    if-eqz v7, :L18
    goto :L19
  :L18
  .line 469
    aget v7, v6, v5
    iput v7, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
  .line 470
    aget v7, v6, v13
    iput v7, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
    goto :L20
  :L19
  .line 463
    iput-boolean v13, v1, Lcom/innioasis/ipp/PlGrid$Mover;->leg:Z
  .line 464
    iget v7, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
    iget v8, v1, Lcom/innioasis/ipp/PlGrid$Mover;->off:I
    int-to-float v8, v8
    sub-float/2addr v7, v8
    iput v7, v1, Lcom/innioasis/ipp/PlGrid$Mover;->sy:F
  .line 465
    iput v4, v1, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
  .line 466
    iput-boolean v5, v1, Lcom/innioasis/ipp/PlGrid$Mover;->placed:Z
  .line 467
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->legPos:I
  :L20
  .line 472
    aget v7, v6, v5
    iput v7, v1, Lcom/innioasis/ipp/PlGrid$Mover;->lx:F
  .line 473
    aget v7, v6, v13
    iput v7, v1, Lcom/innioasis/ipp/PlGrid$Mover;->ly:F
  :L21
  .line 475
    iget-boolean v7, v1, Lcom/innioasis/ipp/PlGrid$Mover;->leg:Z
    if-eqz v7, :L25
  .line 476
    iget v7, v1, Lcom/innioasis/ipp/PlGrid$Mover;->legPos:I
    if-ne v2, v7, :L22
  .line 477
    aget v2, v6, v5
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->lx:F
  .line 478
    aget v2, v6, v13
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->ly:F
  :L22
  .line 481
    iget-boolean v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->placed:Z
    if-nez v2, :L23
    invoke-static { v14 }, Ljava/lang/Math;->abs(F)F
    move-result v2
    iget v7, v1, Lcom/innioasis/ipp/PlGrid$Mover;->pitch:I
    int-to-float v7, v7
    const/high16 v8, 0x40000000
    div-float/2addr v7, v8
    cmpg-float v2, v2, v7
    if-gez v2, :L23
    iget v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
    cmpl-float v2, v2, v12
    if-nez v2, :L23
    iput-boolean v13, v1, Lcom/innioasis/ipp/PlGrid$Mover;->placed:Z
  :L23
  .line 482
    iget-boolean v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->placed:Z
    const/high16 v7, 0x42700000
    if-nez v2, :L24
  .line 483
    iget v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
    mul-float v11, v11, v3
    div-float/2addr v11, v7
    sub-float/2addr v2, v11
    invoke-static { v12, v2 }, Ljava/lang/Math;->max(FF)F
    move-result v2
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
  .line 484
    iget v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->sy:F
    iget v3, v1, Lcom/innioasis/ipp/PlGrid$Mover;->off:I
    int-to-float v3, v3
    add-float/2addr v2, v3
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
    goto :L26
  :L24
  .line 486
    iget v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->lx:F
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
  .line 487
    iget v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->ly:F
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
  .line 488
    iget v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
    mul-float v11, v11, v3
    div-float/2addr v11, v7
    add-float/2addr v2, v11
    invoke-static { v4, v2 }, Ljava/lang/Math;->min(FF)F
    move-result v2
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
  .line 489
    cmpl-float v2, v2, v4
    if-ltz v2, :L26
    iput-boolean v5, v1, Lcom/innioasis/ipp/PlGrid$Mover;->leg:Z
    goto :L26
  :L25
  .line 492
    iget v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
    aget v3, v6, v5
    invoke-static { v2, v3, v11 }, Lcom/innioasis/ipp/PlGrid$Mover;->glide(FFF)F
    move-result v2
    iput v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
  :L26
  .line 494
    iget-boolean v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->leg:Z
    if-nez v2, :L27
    iget v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
    aget v3, v6, v5
    cmpl-float v2, v2, v3
    if-nez v2, :L27
    iget v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
    aget v3, v6, v13
    cmpl-float v2, v2, v3
    if-eqz v2, :L28
  :L27
    const/4 v5, 1
  :L28
  .line 496
    invoke-direct { v1, v5 }, Lcom/innioasis/ipp/PlGrid$Mover;->rested(Z)Z
    move-result v2
    if-eqz v2, :L29
    invoke-static/range { p2 .. p2 }, Lcom/innioasis/ipp/PlGrid$Tidy;->at(Landroidx/recyclerview/widget/RecyclerView;)V
  :L29
  .line 497
    if-eqz v5, :L30
    goto :L31
  :L30
    const-wide/16 v9, 0
  :L31
    iput-wide v9, v1, Lcom/innioasis/ipp/PlGrid$Mover;->last:J
  .line 498
    iget-boolean v2, v1, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
    if-nez v2, :L32
    return-void
  :L32
  .line 499
    if-eqz v5, :L33
    invoke-virtual/range { p2 .. p2 }, Landroidx/recyclerview/widget/RecyclerView;->postInvalidateOnAnimation()V
  :L33
  .line 501
    goto :L37
  :L34
  .line 420
    iput-boolean v5, v1, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
  .line 421
    iput-boolean v5, v1, Lcom/innioasis/ipp/PlGrid$Mover;->leg:Z
  .line 422
    iput v4, v1, Lcom/innioasis/ipp/PlGrid$Mover;->fa:F
  :L35
  .line 423
    return-void
  :L36
  .line 500
    move-exception v0
  :L37
  .line 502
    return-void
.end method

.method public onDrawOver(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V
  .catchall { :L0 .. :L2 } :L3
  .registers 9
  :L0
  .line 507
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide p2
    iget-wide v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->drawn:J
    sub-long/2addr p2, v0
    const-wide/16 v2, 8
    cmp-long v4, p2, v2
    if-ltz v4, :L1
    const-string p2, "tiles drawn"
    invoke-static { p2, v0, v1 }, Lcom/innioasis/ipp/Frames;->part(Ljava/lang/String;J)V
  :L1
  .line 508
    iget-boolean p2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->has:Z
    if-eqz p2, :L2
    iget p2, p0, Lcom/innioasis/ipp/PlGrid$Mover;->l:F
    iget p3, p0, Lcom/innioasis/ipp/PlGrid$Mover;->t:F
    iget v0, p0, Lcom/innioasis/ipp/PlGrid$Mover;->off:I
    int-to-float v0, v0
    sub-float/2addr p3, v0
    invoke-static { }, Lcom/innioasis/ipp/Theme;->tileFrame()I
    move-result v0
    invoke-direct { p0, p1, p2, p3, v0 }, Lcom/innioasis/ipp/PlGrid$Mover;->frame(Landroid/graphics/Canvas;FFI)V
  :L2
  .line 510
    goto :L4
  :L3
  .line 509
    move-exception p1
  :L4
  .line 511
    return-void
.end method
