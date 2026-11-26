.class final Lcom/innioasis/ipp/Nav$Run;
.super Ljava/lang/Object;
.implements Landroid/view/Choreographer$FrameCallback;
.source "Nav.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Nav;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Run"
.end annotation

.field final act:Landroid/app/Activity;

.field private final at:[I

.field private final back:Z

.field private bar:Landroid/view/View;

.field private decor:Landroid/view/ViewGroup;

.field private done:Z

.field private edge:I

.field private elapsed:J

.field private first:J

.field private h:I

.field private hid:Z

.field private last:J

.field private final loc:[I

.field private final mode:I

.field private final moved:Ljava/util/ArrayList;

.field private nL:I

.field private nR:I

.field private final newList:Landroid/view/View;

.field private oL:I

.field private oR:I

.field private oldBg:Landroid/graphics/drawable/Drawable;

.field oldEdge:I

.field private final oldList:Landroid/view/View;

.field private origX:[F

.field private over:Lcom/innioasis/ipp/Nav$Layer;

.field private p:F

.field private pre:Z

.field private preList:Z

.field private final prev:Landroid/app/Activity;

.field private root:Landroid/view/ViewGroup;

.field private shot:Landroid/graphics/Bitmap;

.field private shot2:Landroid/graphics/Bitmap;

.field private strip:Lcom/innioasis/ipp/Nav$Layer;

.field private top:I

.field private under:Lcom/innioasis/ipp/Nav$Layer;

.field private w:I

.method constructor <init>(Landroid/app/Activity;Landroid/app/Activity;ZILandroid/view/View;Landroid/view/View;)V
  .registers 9
  .line 379
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 348
    const/4 v0, -1
    iput v0, p0, Lcom/innioasis/ipp/Nav$Run;->oldEdge:I
  .line 367
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->moved:Ljava/util/ArrayList;
  .line 376
    const/4 v0, 2
    new-array v1, v0, [I
    iput-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->loc:[I
  .line 377
    new-array v0, v0, [I
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->at:[I
  .line 380
    iput-object p1, p0, Lcom/innioasis/ipp/Nav$Run;->act:Landroid/app/Activity;
  .line 381
    iput-object p2, p0, Lcom/innioasis/ipp/Nav$Run;->prev:Landroid/app/Activity;
  .line 382
    iput-boolean p3, p0, Lcom/innioasis/ipp/Nav$Run;->back:Z
  .line 383
    iput p4, p0, Lcom/innioasis/ipp/Nav$Run;->mode:I
  .line 384
    iput-object p5, p0, Lcom/innioasis/ipp/Nav$Run;->oldList:Landroid/view/View;
  .line 385
    iput-object p6, p0, Lcom/innioasis/ipp/Nav$Run;->newList:Landroid/view/View;
  .line 386
    return-void
.end method

.method private drawStrip(Landroid/graphics/Canvas;)V
  .registers 7
  .line 629
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->root:Landroid/view/ViewGroup;
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->at:[I
    invoke-virtual { v0, v1 }, Landroid/view/ViewGroup;->getLocationInWindow([I)V
  .line 630
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->save()I
  .line 631
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->at:[I
    const/4 v1, 0
    aget v2, v0, v1
    neg-int v2, v2
    int-to-float v2, v2
    const/4 v3, 1
    aget v0, v0, v3
    neg-int v0, v0
    int-to-float v0, v0
    invoke-virtual { p1, v2, v0 }, Landroid/graphics/Canvas;->translate(FF)V
  .line 632
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->decor:Landroid/view/ViewGroup;
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 633
    if-nez v0, :L0
  .line 634
    const/high16 v0, 0xFF000000
    invoke-virtual { p1, v0 }, Landroid/graphics/Canvas;->drawColor(I)V
    goto :L1
  :L0
  .line 636
    iget v2, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    iget v3, p0, Lcom/innioasis/ipp/Nav$Run;->h:I
    invoke-virtual { v0, v1, v1, v2, v3 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 637
    invoke-virtual { v0, p1 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
  :L1
  .line 639
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->restore()V
  .line 640
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    iget v2, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    invoke-virtual { p1, v1, v1, v0, v2 }, Landroid/graphics/Canvas;->clipRect(IIII)Z
  .line 641
    nop
  :L2
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->origX:[F
    array-length v0, v0
    if-ge v1, v0, :L5
  .line 642
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->moved:Ljava/util/ArrayList;
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/view/View;
  .line 643
    invoke-virtual { v0 }, Landroid/view/View;->getVisibility()I
    move-result v2
    if-eqz v2, :L3
    goto :L4
  :L3
  .line 644
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->save()I
  .line 645
    invoke-virtual { v0 }, Landroid/view/View;->getLeft()I
    move-result v2
    int-to-float v2, v2
    iget-object v3, p0, Lcom/innioasis/ipp/Nav$Run;->origX:[F
    aget v3, v3, v1
    add-float/2addr v2, v3
    iget-object v3, p0, Lcom/innioasis/ipp/Nav$Run;->strip:Lcom/innioasis/ipp/Nav$Layer;
    invoke-virtual { v3 }, Lcom/innioasis/ipp/Nav$Layer;->getLeft()I
    move-result v3
    int-to-float v3, v3
    sub-float/2addr v2, v3
    invoke-virtual { v0 }, Landroid/view/View;->getTop()I
    move-result v3
    int-to-float v3, v3
    invoke-virtual { v0 }, Landroid/view/View;->getTranslationY()F
    move-result v4
    add-float/2addr v3, v4
    iget-object v4, p0, Lcom/innioasis/ipp/Nav$Run;->strip:Lcom/innioasis/ipp/Nav$Layer;
    invoke-virtual { v4 }, Lcom/innioasis/ipp/Nav$Layer;->getTop()I
    move-result v4
    int-to-float v4, v4
    sub-float/2addr v3, v4
    invoke-virtual { p1, v2, v3 }, Landroid/graphics/Canvas;->translate(FF)V
  .line 646
    invoke-virtual { v0, p1 }, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V
  .line 647
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->restore()V
  :L4
  .line 641
    add-int/lit8 v1, v1, 1
    goto :L2
  :L5
  .line 649
    return-void
.end method

.method private layer(I)Lcom/innioasis/ipp/Nav$Layer;
  .registers 6
  .line 446
    new-instance v0, Lcom/innioasis/ipp/Nav$Layer;
    invoke-direct { v0, p0 }, Lcom/innioasis/ipp/Nav$Layer;-><init>(Lcom/innioasis/ipp/Nav$Run;)V
  .line 447
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->decor:Landroid/view/ViewGroup;
    new-instance v2, Landroid/view/ViewGroup$LayoutParams;
    const/4 v3, -1
    invoke-direct { v2, v3, v3 }, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v0, p1, v2 }, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
  .line 448
    iget p1, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    const/high16 v1, 0x40000000
    invoke-static { p1, v1 }, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I
    move-result p1
    iget v2, p0, Lcom/innioasis/ipp/Nav$Run;->h:I
  .line 449
    invoke-static { v2, v1 }, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I
    move-result v1
  .line 448
    invoke-virtual { v0, p1, v1 }, Lcom/innioasis/ipp/Nav$Layer;->measure(II)V
  .line 450
    iget p1, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->h:I
    const/4 v2, 0
    invoke-virtual { v0, v2, v2, p1, v1 }, Lcom/innioasis/ipp/Nav$Layer;->layout(IIII)V
  .line 451
    return-object v0
.end method

.method private moveSetup()Z
  .registers 7
  .line 456
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->act:Landroid/app/Activity;
    const v1, 2131362153
    invoke-virtual { v0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 457
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-virtual { v0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v0
  :L1
  .line 458
    instance-of v1, v0, Landroid/view/ViewGroup;
    const/4 v2, 0
    if-nez v1, :L2
    return v2
  :L2
  .line 459
    check-cast v0, Landroid/view/ViewGroup;
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->root:Landroid/view/ViewGroup;
  .line 460
    const/4 v0, 0
  :L3
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->root:Landroid/view/ViewGroup;
    invoke-virtual { v1 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v1
    if-ge v0, v1, :L5
  .line 461
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->root:Landroid/view/ViewGroup;
    invoke-virtual { v1, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v1
  .line 462
    iget-object v3, p0, Lcom/innioasis/ipp/Nav$Run;->bar:Landroid/view/View;
    if-eq v1, v3, :L4
    iget-object v3, p0, Lcom/innioasis/ipp/Nav$Run;->moved:Ljava/util/ArrayList;
    invoke-virtual { v3, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L4
  .line 460
    add-int/lit8 v0, v0, 1
    goto :L3
  :L5
  .line 464
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->moved:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v0
    new-array v0, v0, [F
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->origX:[F
  .line 465
    const/4 v0, 0
  :L6
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->origX:[F
    array-length v3, v1
    if-ge v0, v3, :L7
    iget-object v3, p0, Lcom/innioasis/ipp/Nav$Run;->moved:Ljava/util/ArrayList;
    invoke-virtual { v3, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Landroid/view/View;
    invoke-virtual { v3 }, Landroid/view/View;->getTranslationX()F
    move-result v3
    aput v3, v1, v0
    add-int/lit8 v0, v0, 1
    goto :L6
  :L7
  .line 466
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->mode:I
    const/4 v1, 1
    if-ne v0, v1, :L8
    iget-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->back:Z
    if-eqz v0, :L8
    const/4 v0, -1
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/Nav$Run;->layer(I)Lcom/innioasis/ipp/Nav$Layer;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->over:Lcom/innioasis/ipp/Nav$Layer;
    goto :L9
  :L8
  .line 467
    invoke-direct { p0, v2 }, Lcom/innioasis/ipp/Nav$Run;->layer(I)Lcom/innioasis/ipp/Nav$Layer;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->under:Lcom/innioasis/ipp/Nav$Layer;
  :L9
  .line 469
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    if-lez v0, :L10
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->root:Landroid/view/ViewGroup;
    instance-of v0, v0, Landroidx/constraintlayout/widget/ConstraintLayout;
    if-eqz v0, :L10
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->bar:Landroid/view/View;
    if-eqz v0, :L10
    invoke-virtual { v0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v0
    iget-object v3, p0, Lcom/innioasis/ipp/Nav$Run;->root:Landroid/view/ViewGroup;
    if-ne v0, v3, :L10
  .line 470
    new-instance v0, Lcom/innioasis/ipp/Nav$Layer;
    invoke-direct { v0, p0 }, Lcom/innioasis/ipp/Nav$Layer;-><init>(Lcom/innioasis/ipp/Nav$Run;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->strip:Lcom/innioasis/ipp/Nav$Layer;
  .line 471
    new-instance v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    iget v3, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    iget v4, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    invoke-direct { v0, v3, v4 }, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;-><init>(II)V
  .line 472
    iput v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->leftToLeft:I
  .line 473
    iput v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->topToTop:I
  .line 474
    iget-object v3, p0, Lcom/innioasis/ipp/Nav$Run;->root:Landroid/view/ViewGroup;
    iget-object v4, p0, Lcom/innioasis/ipp/Nav$Run;->strip:Lcom/innioasis/ipp/Nav$Layer;
    iget-object v5, p0, Lcom/innioasis/ipp/Nav$Run;->bar:Landroid/view/View;
    invoke-virtual { v3, v5 }, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I
    move-result v5
    invoke-virtual { v3, v4, v5, v0 }, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
  .line 475
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->strip:Lcom/innioasis/ipp/Nav$Layer;
    iget v3, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    const/high16 v4, 0x40000000
    invoke-static { v3, v4 }, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I
    move-result v3
    iget v5, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
  .line 476
    invoke-static { v5, v4 }, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I
    move-result v4
  .line 475
    invoke-virtual { v0, v3, v4 }, Lcom/innioasis/ipp/Nav$Layer;->measure(II)V
  .line 477
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->strip:Lcom/innioasis/ipp/Nav$Layer;
    iget v3, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    iget v4, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    invoke-virtual { v0, v2, v2, v3, v4 }, Lcom/innioasis/ipp/Nav$Layer;->layout(IIII)V
  :L10
  .line 479
    return v1
.end method

.method private paint(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;FFF)V
  .registers 8
  .line 614
    cmpg-float v0, p5, p4
    if-gtz v0, :L0
    return-void
  :L0
  .line 615
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->save()I
  .line 616
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    int-to-float v0, v0
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->h:I
    int-to-float v1, v1
    invoke-virtual { p1, p4, v0, p5, v1 }, Landroid/graphics/Canvas;->clipRect(FFFF)Z
  .line 617
    const/4 p4, 0
    invoke-virtual { p1, p3, p4 }, Landroid/graphics/Canvas;->translate(FF)V
  .line 618
    if-nez p2, :L1
  .line 619
    const/high16 p2, 0xFF000000
    invoke-virtual { p1, p2 }, Landroid/graphics/Canvas;->drawColor(I)V
    goto :L2
  :L1
  .line 621
    iget p3, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    iget p4, p0, Lcom/innioasis/ipp/Nav$Run;->h:I
    const/4 p5, 0
    invoke-virtual { p2, p5, p5, p3, p4 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 622
    invoke-virtual { p2, p1 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
  :L2
  .line 624
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->restore()V
  .line 625
    return-void
.end method

.method private piece(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;FFF)V
  .registers 8
  .line 605
    cmpg-float v0, p5, p4
    if-gtz v0, :L0
    return-void
  :L0
  .line 606
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->save()I
  .line 607
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    int-to-float v0, v0
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->h:I
    int-to-float v1, v1
    invoke-virtual { p1, p4, v0, p5, v1 }, Landroid/graphics/Canvas;->clipRect(FFFF)Z
  .line 608
    iget p4, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    int-to-float p4, p4
    const/4 p5, 0
    invoke-virtual { p1, p2, p3, p4, p5 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
  .line 609
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->restore()V
  .line 610
    return-void
.end method

.method private step(F)V
  .registers 5
  .line 509
    iput p1, p0, Lcom/innioasis/ipp/Nav$Run;->p:F
  .line 510
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->origX:[F
    if-eqz v0, :L5
  .line 512
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->mode:I
    const/high16 v1, 0x3F800000
    const/4 v2, 1
    if-ne v0, v2, :L1
    iget-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->back:Z
    if-eqz v0, :L0
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    int-to-float v0, v0
    mul-float v0, v0, p1
    iget p1, p0, Lcom/innioasis/ipp/Nav$Run;->edge:I
    int-to-float p1, p1
    sub-float/2addr v0, p1
    const/4 p1, 0
    invoke-static { p1, v0 }, Ljava/lang/Math;->min(FF)F
    move-result p1
    goto :L3
  :L0
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    int-to-float v0, v0
    sub-float/2addr v1, p1
    mul-float p1, v0, v1
    goto :L3
  :L1
  .line 513
    iget-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->back:Z
    if-eqz v0, :L2
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    int-to-float v1, v0
    mul-float v1, v1, p1
    int-to-float p1, v0
    sub-float/2addr v1, p1
    move p1, v1
    goto :L3
  :L2
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    int-to-float v0, v0
    sub-float/2addr v1, p1
    mul-float v0, v0, v1
    move p1, v0
  :L3
  .line 514
    const/4 v0, 0
  :L4
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->origX:[F
    array-length v1, v1
    if-ge v0, v1, :L5
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->moved:Ljava/util/ArrayList;
    invoke-virtual { v1, v0 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroid/view/View;
    iget-object v2, p0, Lcom/innioasis/ipp/Nav$Run;->origX:[F
    aget v2, v2, v0
    add-float/2addr v2, p1
    invoke-virtual { v1, v2 }, Landroid/view/View;->setTranslationX(F)V
    add-int/lit8 v0, v0, 1
    goto :L4
  :L5
  .line 516
    iget-object p1, p0, Lcom/innioasis/ipp/Nav$Run;->under:Lcom/innioasis/ipp/Nav$Layer;
    if-eqz p1, :L6
    invoke-virtual { p1 }, Lcom/innioasis/ipp/Nav$Layer;->invalidate()V
  :L6
  .line 517
    iget-object p1, p0, Lcom/innioasis/ipp/Nav$Run;->over:Lcom/innioasis/ipp/Nav$Layer;
    if-eqz p1, :L7
    invoke-virtual { p1 }, Lcom/innioasis/ipp/Nav$Layer;->invalidate()V
  :L7
  .line 518
    return-void
.end method

.method begin()Z
  .registers 9
  .line 395
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->act:Landroid/app/Activity;
    invoke-virtual { v0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/view/ViewGroup;
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->decor:Landroid/view/ViewGroup;
  .line 396
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->getWidth()I
    move-result v0
    iput v0, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
  .line 397
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->decor:Landroid/view/ViewGroup;
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->getHeight()I
    move-result v0
    iput v0, p0, Lcom/innioasis/ipp/Nav$Run;->h:I
  .line 398
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    const/4 v2, 0
    if-lez v1, :L18
    if-gtz v0, :L0
    goto/16 :L18
  :L0
  .line 399
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->act:Landroid/app/Activity;
    const v1, 2131362408
    invoke-virtual { v0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->bar:Landroid/view/View;
  .line 400
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->act:Landroid/app/Activity;
    invoke-static { v0 }, Lcom/innioasis/ipp/Nav;->access$900(Landroid/app/Activity;)I
    move-result v0
    iput v0, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
  .line 401
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->h:I
    if-lt v0, v1, :L1
    return v2
  :L1
  .line 402
    iget-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->pre:Z
    if-eqz v0, :L3
    invoke-static { }, Lcom/innioasis/ipp/Nav;->access$1000()Landroid/graphics/Bitmap;
    move-result-object v0
    if-eqz v0, :L2
    invoke-static { }, Lcom/innioasis/ipp/Nav;->access$1000()Landroid/graphics/Bitmap;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v0
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    if-ne v0, v1, :L2
    invoke-static { }, Lcom/innioasis/ipp/Nav;->access$1000()Landroid/graphics/Bitmap;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v0
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->h:I
    iget v3, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    sub-int/2addr v1, v3
    if-eq v0, v1, :L3
  :L2
    return v2
  :L3
  .line 403
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->prev:Landroid/app/Activity;
    invoke-virtual { v0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->oldBg:Landroid/graphics/drawable/Drawable;
  .line 404
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->mode:I
    const/4 v1, -1
    const/4 v3, 1
    if-nez v0, :L6
  .line 405
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->oldList:Landroid/view/View;
    invoke-static { v0 }, Lcom/innioasis/ipp/Nav;->access$1100(Landroid/view/View;)I
    move-result v0
    iput v0, p0, Lcom/innioasis/ipp/Nav$Run;->oL:I
  .line 406
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->oldList:Landroid/view/View;
    invoke-static { v0 }, Lcom/innioasis/ipp/Nav;->access$1200(Landroid/view/View;)I
    move-result v0
    iput v0, p0, Lcom/innioasis/ipp/Nav$Run;->oR:I
  .line 407
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->newList:Landroid/view/View;
    invoke-static { v0 }, Lcom/innioasis/ipp/Nav;->access$1100(Landroid/view/View;)I
    move-result v0
    iput v0, p0, Lcom/innioasis/ipp/Nav$Run;->nL:I
  .line 408
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->newList:Landroid/view/View;
    invoke-static { v0 }, Lcom/innioasis/ipp/Nav;->access$1200(Landroid/view/View;)I
    move-result v0
    iput v0, p0, Lcom/innioasis/ipp/Nav$Run;->nR:I
  .line 409
    iget-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->pre:Z
    if-eqz v0, :L4
    iget-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->preList:Z
    if-eqz v0, :L4
  .line 410
    invoke-static { }, Lcom/innioasis/ipp/Nav;->access$1300()Landroid/graphics/Bitmap;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
    goto :L5
  :L4
  .line 412
    invoke-static { }, Lcom/innioasis/ipp/Nav;->access$1300()Landroid/graphics/Bitmap;
    move-result-object v0
    iget v2, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    iget v4, p0, Lcom/innioasis/ipp/Nav$Run;->h:I
    iget v5, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    sub-int/2addr v4, v5
    invoke-static { v0, v2, v4 }, Lcom/innioasis/ipp/Nav;->access$1400(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Nav;->access$1302(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
  .line 413
    iget-object v2, p0, Lcom/innioasis/ipp/Nav$Run;->oldList:Landroid/view/View;
    iget v4, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    invoke-static { v0, v2, v4 }, Lcom/innioasis/ipp/Nav;->access$1500(Landroid/graphics/Bitmap;Landroid/view/View;I)V
  :L5
  .line 415
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->newList:Landroid/view/View;
    const/4 v2, 4
    invoke-virtual { v0, v2 }, Landroid/view/View;->setVisibility(I)V
  .line 416
    iput-boolean v3, p0, Lcom/innioasis/ipp/Nav$Run;->hid:Z
  .line 417
    invoke-direct { p0, v1 }, Lcom/innioasis/ipp/Nav$Run;->layer(I)Lcom/innioasis/ipp/Nav$Layer;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->over:Lcom/innioasis/ipp/Nav$Layer;
    goto/16 :L17
  :L6
  .line 419
    const/4 v4, 3
    if-eq v0, v3, :L7
    if-ne v0, v4, :L12
  :L7
  .line 420
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->oldEdge:I
    if-ltz v0, :L8
    goto :L11
  :L8
    iget-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->back:Z
    if-eqz v0, :L9
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->newList:Landroid/view/View;
    goto :L10
  :L9
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->oldList:Landroid/view/View;
  :L10
    invoke-static { v0 }, Lcom/innioasis/ipp/Nav;->access$1200(Landroid/view/View;)I
    move-result v0
  :L11
    iput v0, p0, Lcom/innioasis/ipp/Nav$Run;->edge:I
  .line 421
    iget v5, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    invoke-static { v5, v0 }, Ljava/lang/Math;->min(II)I
    move-result v0
    iput v0, p0, Lcom/innioasis/ipp/Nav$Run;->edge:I
  :L12
  .line 423
    iget-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->pre:Z
    if-nez v0, :L13
  .line 424
    invoke-static { }, Lcom/innioasis/ipp/Nav;->access$1000()Landroid/graphics/Bitmap;
    move-result-object v0
    iget v5, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    iget v6, p0, Lcom/innioasis/ipp/Nav$Run;->h:I
    iget v7, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    sub-int/2addr v6, v7
    invoke-static { v0, v5, v6 }, Lcom/innioasis/ipp/Nav;->access$1400(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Nav;->access$1002(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
  .line 425
    iget-object v5, p0, Lcom/innioasis/ipp/Nav$Run;->prev:Landroid/app/Activity;
    iget v6, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    invoke-static { v0, v5, v6 }, Lcom/innioasis/ipp/Nav;->access$1600(Landroid/graphics/Bitmap;Landroid/app/Activity;I)V
    goto :L14
  :L13
  .line 427
    invoke-static { }, Lcom/innioasis/ipp/Nav;->access$1000()Landroid/graphics/Bitmap;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
  :L14
  .line 429
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->mode:I
    if-ne v0, v4, :L16
  .line 430
    iget-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->back:Z
    if-eqz v0, :L15
  .line 431
    invoke-static { }, Lcom/innioasis/ipp/Nav;->access$1700()Landroid/graphics/Bitmap;
    move-result-object v0
    iget v2, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    iget v4, p0, Lcom/innioasis/ipp/Nav$Run;->h:I
    iget v5, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    sub-int/2addr v4, v5
    invoke-static { v0, v2, v4 }, Lcom/innioasis/ipp/Nav;->access$1400(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Nav;->access$1702(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->shot2:Landroid/graphics/Bitmap;
  .line 432
    iget-object v2, p0, Lcom/innioasis/ipp/Nav$Run;->act:Landroid/app/Activity;
    iget v4, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    invoke-static { v0, v2, v4 }, Lcom/innioasis/ipp/Nav;->access$1600(Landroid/graphics/Bitmap;Landroid/app/Activity;I)V
  :L15
  .line 434
    invoke-direct { p0, v1 }, Lcom/innioasis/ipp/Nav$Run;->layer(I)Lcom/innioasis/ipp/Nav$Layer;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->over:Lcom/innioasis/ipp/Nav$Layer;
    goto :L17
  :L16
  .line 435
    invoke-direct { p0 }, Lcom/innioasis/ipp/Nav$Run;->moveSetup()Z
    move-result v0
    if-nez v0, :L17
  .line 436
    return v2
  :L17
  .line 439
    const/4 v0, 0
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/Nav$Run;->step(F)V
  .line 440
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    invoke-virtual { v0, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  .line 441
    return v3
  :L18
  .line 398
    return v2
.end method

.method public doFrame(J)V
  .registers 10
  .line 484
    iget-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->done:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 485
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->act:Landroid/app/Activity;
    invoke-static { v0 }, Lcom/innioasis/ipp/Nav$Popups;->hide(Landroid/app/Activity;)V
  .line 488
    iget-wide v0, p0, Lcom/innioasis/ipp/Nav$Run;->last:J
    const-wide/16 v2, 0
    cmp-long v4, v0, v2
    if-nez v4, :L1
    iput-wide p1, p0, Lcom/innioasis/ipp/Nav$Run;->first:J
  :L1
  .line 489
    cmp-long v4, v0, v2
    if-nez v4, :L2
    const-wide/32 v0, 27000000
    goto :L3
  :L2
    sub-long v0, p1, v0
    const-wide/32 v4, 54000000
    invoke-static { v0, v1, v4, v5 }, Ljava/lang/Math;->min(JJ)J
    move-result-wide v0
  :L3
  .line 490
    iput-wide p1, p0, Lcom/innioasis/ipp/Nav$Run;->last:J
  .line 492
    iget-wide v4, p0, Lcom/innioasis/ipp/Nav$Run;->elapsed:J
    cmp-long v6, v4, v2
    if-nez v6, :L4
    iget-wide v2, p0, Lcom/innioasis/ipp/Nav$Run;->first:J
    sub-long/2addr p1, v2
    const-wide/32 v2, 400000000
    cmp-long v4, p1, v2
    if-gez v4, :L4
    iget-object p1, p0, Lcom/innioasis/ipp/Nav$Run;->act:Landroid/app/Activity;
    const p2, 2131362153
    invoke-virtual { p1, p2 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Nav;->access$1800(Landroid/view/View;)Z
    move-result p1
    if-nez p1, :L4
  .line 493
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p1
    invoke-virtual { p1, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  .line 494
    return-void
  :L4
  .line 496
    iget-wide p1, p0, Lcom/innioasis/ipp/Nav$Run;->elapsed:J
    add-long/2addr p1, v0
    iput-wide p1, p0, Lcom/innioasis/ipp/Nav$Run;->elapsed:J
  .line 497
    const/high16 v0, 0x41600000
    long-to-float p1, p1
    mul-float p1, p1, v0
    const p2, 1315859240
    div-float/2addr p1, p2
  .line 498
    const/high16 p2, 0x3F800000
    add-float v0, p1, p2
    neg-float p1, p1
    float-to-double v1, p1
    invoke-static { v1, v2 }, Ljava/lang/Math;->exp(D)D
    move-result-wide v1
    double-to-float p1, v1
    mul-float v0, v0, p1
    sub-float p1, p2, v0
  .line 499
    sub-float v0, p2, p1
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    int-to-float v1, v1
    mul-float v0, v0, v1
    const/high16 v1, 0x3F000000
    cmpg-float v0, v0, v1
    if-gez v0, :L5
    const/high16 p1, 0x3F800000
  :L5
  .line 500
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Nav$Run;->step(F)V
  .line 501
    cmpl-float p1, p1, p2
    if-ltz p1, :L6
  .line 502
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Nav$Run;->end()V
  .line 503
    return-void
  :L6
  .line 505
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p1
    invoke-virtual { p1, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  .line 506
    return-void
.end method

.method draw(Lcom/innioasis/ipp/Nav$Layer;Landroid/graphics/Canvas;)V
  .registers 13
  .line 539
    iget-boolean v1, p0, Lcom/innioasis/ipp/Nav$Run;->done:Z
    if-nez v1, :L22
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
    if-nez v1, :L0
    goto/16 :L22
  :L0
  .line 540
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->strip:Lcom/innioasis/ipp/Nav$Layer;
    if-ne p1, v1, :L1
  .line 541
    invoke-direct { p0, p2 }, Lcom/innioasis/ipp/Nav$Run;->drawStrip(Landroid/graphics/Canvas;)V
  .line 542
    return-void
  :L1
  .line 544
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->decor:Landroid/view/ViewGroup;
    invoke-virtual { v1 }, Landroid/view/ViewGroup;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v2
  .line 546
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->mode:I
    const/4 v3, 0
    const/high16 v4, 0x3F800000
    packed-switch v1, :L23
  .line 585
    iget-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->back:Z
    if-eqz v0, :L15
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->p:F
    sub-float/2addr v4, v1
    goto/16 :L16
  :L2
  .line 578
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    int-to-float v1, v0
    iget v2, p0, Lcom/innioasis/ipp/Nav$Run;->p:F
    mul-float v4, v1, v2
  .line 579
    iget-boolean v1, p0, Lcom/innioasis/ipp/Nav$Run;->back:Z
    if-nez v1, :L3
    iget-object v2, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
    neg-float v3, v4
    const/4 v5, 0
    int-to-float v0, v0
    sub-float v6, v0, v4
    move-object v0, p0
    move-object v1, p2
    move v4, v5
    move v5, v6
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/Nav$Run;->piece(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;FFF)V
    goto :L4
  :L3
  .line 580
    iget-object v2, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
    int-to-float v5, v0
    move-object v0, p0
    move-object v1, p2
    move v3, v4
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/Nav$Run;->piece(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;FFF)V
  :L4
  .line 581
    return-void
  :L5
  .line 567
    iget-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->back:Z
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    int-to-float v1, v1
    if-eqz v0, :L6
    iget v4, p0, Lcom/innioasis/ipp/Nav$Run;->p:F
    goto :L7
  :L6
    iget v5, p0, Lcom/innioasis/ipp/Nav$Run;->p:F
    sub-float/2addr v4, v5
  :L7
    mul-float v1, v1, v4
    move v6, v1
  .line 569
    if-nez v0, :L8
  .line 570
    iget-object v2, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->edge:I
    int-to-float v0, v0
    sub-float v0, v6, v0
    invoke-static { v3, v0 }, Ljava/lang/Math;->min(FF)F
    move-result v3
    const/4 v4, 0
    move-object v0, p0
    move-object v1, p2
    move v5, v6
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/Nav$Run;->piece(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;FFF)V
    goto :L9
  :L8
  .line 572
    const/4 v3, 0
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    int-to-float v5, v0
    move-object v0, p0
    move-object v1, p2
    move v4, v6
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/Nav$Run;->paint(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;FFF)V
  .line 573
    iget-object v2, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    int-to-float v5, v0
    move-object v0, p0
    move v3, v6
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/Nav$Run;->piece(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;FFF)V
  :L9
  .line 575
    return-void
  :L10
  .line 550
    iget-boolean v1, p0, Lcom/innioasis/ipp/Nav$Run;->back:Z
    if-nez v1, :L11
  .line 551
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->oR:I
    neg-int v2, v1
    int-to-float v2, v2
    iget v5, p0, Lcom/innioasis/ipp/Nav$Run;->p:F
    mul-float v2, v2, v5
  .line 552
    iget v6, p0, Lcom/innioasis/ipp/Nav$Run;->nL:I
    sub-int/2addr v1, v6
    int-to-float v1, v1
    sub-float/2addr v4, v5
    mul-float v1, v1, v4
    goto :L12
  :L11
  .line 554
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->nR:I
    int-to-float v2, v1
    iget v5, p0, Lcom/innioasis/ipp/Nav$Run;->p:F
    mul-float v2, v2, v5
  .line 555
    iget v6, p0, Lcom/innioasis/ipp/Nav$Run;->oL:I
    sub-int/2addr v1, v6
    neg-int v1, v1
    int-to-float v1, v1
    sub-float/2addr v4, v5
    mul-float v1, v1, v4
  :L12
  .line 558
    iget v4, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    int-to-float v4, v4
    iget v5, p0, Lcom/innioasis/ipp/Nav$Run;->nR:I
    iget v6, p0, Lcom/innioasis/ipp/Nav$Run;->oR:I
    if-lt v5, v6, :L13
    int-to-float v5, v5
    goto :L14
  :L13
    int-to-float v7, v6
    sub-int/2addr v5, v6
    int-to-float v5, v5
    iget v6, p0, Lcom/innioasis/ipp/Nav$Run;->p:F
    mul-float v5, v5, v6
    add-float/2addr v5, v7
  :L14
    iget v6, p0, Lcom/innioasis/ipp/Nav$Run;->h:I
    int-to-float v6, v6
    invoke-virtual { p2, v3, v4, v5, v6 }, Landroid/graphics/Canvas;->clipRect(FFFF)Z
  .line 559
    iget-object v3, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
    iget v4, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    int-to-float v4, v4
    const/4 v5, 0
    invoke-virtual { p2, v3, v2, v4, v5 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
  .line 560
    iget-object v2, p0, Lcom/innioasis/ipp/Nav$Run;->newList:Landroid/view/View;
    iget-object v3, p0, Lcom/innioasis/ipp/Nav$Run;->loc:[I
    invoke-virtual { v2, v3 }, Landroid/view/View;->getLocationInWindow([I)V
  .line 561
    iget-object v2, p0, Lcom/innioasis/ipp/Nav$Run;->at:[I
    invoke-virtual { p1, v2 }, Lcom/innioasis/ipp/Nav$Layer;->getLocationInWindow([I)V
  .line 562
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->loc:[I
    const/4 v2, 0
    aget v3, v0, v2
    int-to-float v3, v3
    add-float/2addr v1, v3
    iget-object v3, p0, Lcom/innioasis/ipp/Nav$Run;->at:[I
    aget v2, v3, v2
    int-to-float v2, v2
    sub-float/2addr v1, v2
    const/4 v2, 1
    aget v0, v0, v2
    aget v2, v3, v2
    sub-int/2addr v0, v2
    int-to-float v0, v0
    invoke-virtual { p2, v1, v0 }, Landroid/graphics/Canvas;->translate(FF)V
  .line 563
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->newList:Landroid/view/View;
    invoke-virtual { v0, p2 }, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V
  .line 564
    return-void
  :L15
  .line 585
    iget v4, p0, Lcom/innioasis/ipp/Nav$Run;->p:F
  :L16
    move v6, v4
  .line 586
    if-eqz v0, :L17
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->shot2:Landroid/graphics/Bitmap;
    goto :L18
  :L17
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
  :L18
    move-object v7, v1
  .line 588
    if-eqz v0, :L19
    move-object v8, v2
    goto :L20
  :L19
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->oldBg:Landroid/graphics/drawable/Drawable;
    move-object v8, v1
  :L20
  .line 589
    if-eqz v0, :L21
  .line 590
    iget-object v2, p0, Lcom/innioasis/ipp/Nav$Run;->oldBg:Landroid/graphics/drawable/Drawable;
    const/4 v3, 0
    const/4 v4, 0
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    int-to-float v5, v0
    move-object v0, p0
    move-object v1, p2
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/Nav$Run;->paint(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;FFF)V
  .line 591
    iget-object v2, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    int-to-float v5, v0
    move-object v0, p0
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/Nav$Run;->piece(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;FFF)V
  :L21
  .line 593
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->edge:I
    neg-int v1, v0
    int-to-float v1, v1
    mul-float v9, v1, v6
  .line 594
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    sub-int/2addr v1, v0
    int-to-float v1, v1
    mul-float v6, v6, v1
  .line 595
    const/4 v4, 0
    int-to-float v0, v0
    add-float v5, v0, v9
    move-object v0, p0
    move-object v1, p2
    move-object v2, v8
    move v3, v9
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/Nav$Run;->paint(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;FFF)V
  .line 596
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->edge:I
    int-to-float v0, v0
    add-float v5, v0, v9
    move-object v0, p0
    move-object v2, v7
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/Nav$Run;->piece(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;FFF)V
  .line 597
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->edge:I
    int-to-float v0, v0
    add-float v4, v0, v6
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    int-to-float v5, v0
    move-object v0, p0
    move-object v2, v8
    move v3, v6
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/Nav$Run;->paint(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;FFF)V
  .line 598
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->edge:I
    int-to-float v0, v0
    add-float v4, v0, v6
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    int-to-float v5, v0
    move-object v0, p0
    move-object v2, v7
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/Nav$Run;->piece(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;FFF)V
  .line 601
    return-void
  :L22
  .line 539
    return-void
  :L23
  .packed-switch 0
    :L10
    :L5
    :L2
  .end packed-switch
.end method

.method end()V
  .catchall { :L1 .. :L7 } :L8
  .registers 5
  .line 521
    iget-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->done:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 522
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->done:Z
  :L1
  .line 524
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    invoke-virtual { v0, p0 }, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  .line 525
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->under:Lcom/innioasis/ipp/Nav$Layer;
    if-eqz v0, :L2
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->decor:Landroid/view/ViewGroup;
    invoke-virtual { v1, v0 }, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V
  :L2
  .line 526
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->over:Lcom/innioasis/ipp/Nav$Layer;
    if-eqz v0, :L3
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->decor:Landroid/view/ViewGroup;
    invoke-virtual { v1, v0 }, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V
  :L3
  .line 527
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->strip:Lcom/innioasis/ipp/Nav$Layer;
    if-eqz v0, :L4
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->root:Landroid/view/ViewGroup;
    invoke-virtual { v1, v0 }, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V
  :L4
  .line 528
    const/4 v0, 0
    const/4 v1, 0
  :L5
    iget-object v2, p0, Lcom/innioasis/ipp/Nav$Run;->origX:[F
    if-eqz v2, :L6
    array-length v2, v2
    if-ge v1, v2, :L6
    iget-object v2, p0, Lcom/innioasis/ipp/Nav$Run;->moved:Ljava/util/ArrayList;
    invoke-virtual { v2, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Landroid/view/View;
    iget-object v3, p0, Lcom/innioasis/ipp/Nav$Run;->origX:[F
    aget v3, v3, v1
    invoke-virtual { v2, v3 }, Landroid/view/View;->setTranslationX(F)V
    add-int/lit8 v1, v1, 1
    goto :L5
  :L6
  .line 529
    iget-boolean v1, p0, Lcom/innioasis/ipp/Nav$Run;->hid:Z
    if-eqz v1, :L7
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->newList:Landroid/view/View;
    invoke-virtual { v1 }, Landroid/view/View;->getVisibility()I
    move-result v1
    const/4 v2, 4
    if-ne v1, v2, :L7
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->newList:Landroid/view/View;
    invoke-virtual { v1, v0 }, Landroid/view/View;->setVisibility(I)V
  :L7
  .line 531
    goto :L9
  :L8
  .line 530
    move-exception v0
  :L9
  .line 532
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
  .line 533
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->shot2:Landroid/graphics/Bitmap;
  .line 534
    invoke-static { }, Lcom/innioasis/ipp/Nav$Popups;->restore()V
  .line 535
    sget-object v1, Lcom/innioasis/ipp/Nav;->running:Lcom/innioasis/ipp/Nav$Run;
    if-ne v1, p0, :L10
    sput-object v0, Lcom/innioasis/ipp/Nav;->running:Lcom/innioasis/ipp/Nav$Run;
  :L10
  .line 536
    return-void
.end method

.method preShot(Z)V
  .registers 3
  .line 390
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->pre:Z
  .line 391
    iput-boolean p1, p0, Lcom/innioasis/ipp/Nav$Run;->preList:Z
  .line 392
    return-void
.end method
