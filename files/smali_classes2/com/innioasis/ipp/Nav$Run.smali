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
  .line 369
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 339
    const/4 v0, -1
    iput v0, p0, Lcom/innioasis/ipp/Nav$Run;->oldEdge:I
  .line 358
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->moved:Ljava/util/ArrayList;
  .line 366
    const/4 v0, 2
    new-array v1, v0, [I
    iput-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->loc:[I
  .line 367
    new-array v0, v0, [I
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->at:[I
  .line 370
    iput-object p1, p0, Lcom/innioasis/ipp/Nav$Run;->act:Landroid/app/Activity;
  .line 371
    iput-object p2, p0, Lcom/innioasis/ipp/Nav$Run;->prev:Landroid/app/Activity;
  .line 372
    iput-boolean p3, p0, Lcom/innioasis/ipp/Nav$Run;->back:Z
  .line 373
    iput p4, p0, Lcom/innioasis/ipp/Nav$Run;->mode:I
  .line 374
    iput-object p5, p0, Lcom/innioasis/ipp/Nav$Run;->oldList:Landroid/view/View;
  .line 375
    iput-object p6, p0, Lcom/innioasis/ipp/Nav$Run;->newList:Landroid/view/View;
  .line 376
    return-void
.end method

.method private drawStrip(Landroid/graphics/Canvas;)V
  .registers 7
  .line 618
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->root:Landroid/view/ViewGroup;
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->at:[I
    invoke-virtual { v0, v1 }, Landroid/view/ViewGroup;->getLocationInWindow([I)V
  .line 619
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->save()I
  .line 620
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
  .line 621
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->decor:Landroid/view/ViewGroup;
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 622
    if-nez v0, :L0
  .line 623
    const/high16 v0, 0xFF000000
    invoke-virtual { p1, v0 }, Landroid/graphics/Canvas;->drawColor(I)V
    goto :L1
  :L0
  .line 625
    iget v2, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    iget v3, p0, Lcom/innioasis/ipp/Nav$Run;->h:I
    invoke-virtual { v0, v1, v1, v2, v3 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 626
    invoke-virtual { v0, p1 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
  :L1
  .line 628
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->restore()V
  .line 629
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    iget v2, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    invoke-virtual { p1, v1, v1, v0, v2 }, Landroid/graphics/Canvas;->clipRect(IIII)Z
  .line 630
    nop
  :L2
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->origX:[F
    array-length v0, v0
    if-ge v1, v0, :L5
  .line 631
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->moved:Ljava/util/ArrayList;
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/view/View;
  .line 632
    invoke-virtual { v0 }, Landroid/view/View;->getVisibility()I
    move-result v2
    if-eqz v2, :L3
    goto :L4
  :L3
  .line 633
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->save()I
  .line 634
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
  .line 635
    invoke-virtual { v0, p1 }, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V
  .line 636
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->restore()V
  :L4
  .line 630
    add-int/lit8 v1, v1, 1
    goto :L2
  :L5
  .line 638
    return-void
.end method

.method private layer(I)Lcom/innioasis/ipp/Nav$Layer;
  .registers 6
  .line 435
    new-instance v0, Lcom/innioasis/ipp/Nav$Layer;
    invoke-direct { v0, p0 }, Lcom/innioasis/ipp/Nav$Layer;-><init>(Lcom/innioasis/ipp/Nav$Run;)V
  .line 436
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->decor:Landroid/view/ViewGroup;
    new-instance v2, Landroid/view/ViewGroup$LayoutParams;
    const/4 v3, -1
    invoke-direct { v2, v3, v3 }, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v0, p1, v2 }, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
  .line 437
    iget p1, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    const/high16 v1, 0x40000000
    invoke-static { p1, v1 }, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I
    move-result p1
    iget v2, p0, Lcom/innioasis/ipp/Nav$Run;->h:I
  .line 438
    invoke-static { v2, v1 }, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I
    move-result v1
  .line 437
    invoke-virtual { v0, p1, v1 }, Lcom/innioasis/ipp/Nav$Layer;->measure(II)V
  .line 439
    iget p1, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->h:I
    const/4 v2, 0
    invoke-virtual { v0, v2, v2, p1, v1 }, Lcom/innioasis/ipp/Nav$Layer;->layout(IIII)V
  .line 440
    return-object v0
.end method

.method private moveSetup()Z
  .registers 7
  .line 445
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->act:Landroid/app/Activity;
    const v1, 2131362153
    invoke-virtual { v0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 446
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-virtual { v0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v0
  :L1
  .line 447
    instance-of v1, v0, Landroid/view/ViewGroup;
    const/4 v2, 0
    if-nez v1, :L2
    return v2
  :L2
  .line 448
    check-cast v0, Landroid/view/ViewGroup;
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->root:Landroid/view/ViewGroup;
  .line 449
    const/4 v0, 0
  :L3
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->root:Landroid/view/ViewGroup;
    invoke-virtual { v1 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v1
    if-ge v0, v1, :L5
  .line 450
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->root:Landroid/view/ViewGroup;
    invoke-virtual { v1, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v1
  .line 451
    iget-object v3, p0, Lcom/innioasis/ipp/Nav$Run;->bar:Landroid/view/View;
    if-eq v1, v3, :L4
    iget-object v3, p0, Lcom/innioasis/ipp/Nav$Run;->moved:Ljava/util/ArrayList;
    invoke-virtual { v3, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L4
  .line 449
    add-int/lit8 v0, v0, 1
    goto :L3
  :L5
  .line 453
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->moved:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v0
    new-array v0, v0, [F
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->origX:[F
  .line 454
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
  .line 455
    invoke-direct { p0, v2 }, Lcom/innioasis/ipp/Nav$Run;->layer(I)Lcom/innioasis/ipp/Nav$Layer;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->under:Lcom/innioasis/ipp/Nav$Layer;
  .line 456
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->mode:I
    const/4 v1, 1
    if-ne v0, v1, :L8
    iget-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->back:Z
    if-eqz v0, :L8
    const/4 v0, -1
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/Nav$Run;->layer(I)Lcom/innioasis/ipp/Nav$Layer;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->over:Lcom/innioasis/ipp/Nav$Layer;
  :L8
  .line 458
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    if-lez v0, :L9
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->root:Landroid/view/ViewGroup;
    instance-of v0, v0, Landroidx/constraintlayout/widget/ConstraintLayout;
    if-eqz v0, :L9
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->bar:Landroid/view/View;
    if-eqz v0, :L9
    invoke-virtual { v0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v0
    iget-object v3, p0, Lcom/innioasis/ipp/Nav$Run;->root:Landroid/view/ViewGroup;
    if-ne v0, v3, :L9
  .line 459
    new-instance v0, Lcom/innioasis/ipp/Nav$Layer;
    invoke-direct { v0, p0 }, Lcom/innioasis/ipp/Nav$Layer;-><init>(Lcom/innioasis/ipp/Nav$Run;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->strip:Lcom/innioasis/ipp/Nav$Layer;
  .line 460
    new-instance v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    iget v3, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    iget v4, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    invoke-direct { v0, v3, v4 }, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;-><init>(II)V
  .line 461
    iput v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->leftToLeft:I
  .line 462
    iput v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->topToTop:I
  .line 463
    iget-object v3, p0, Lcom/innioasis/ipp/Nav$Run;->root:Landroid/view/ViewGroup;
    iget-object v4, p0, Lcom/innioasis/ipp/Nav$Run;->strip:Lcom/innioasis/ipp/Nav$Layer;
    iget-object v5, p0, Lcom/innioasis/ipp/Nav$Run;->bar:Landroid/view/View;
    invoke-virtual { v3, v5 }, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I
    move-result v5
    invoke-virtual { v3, v4, v5, v0 }, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
  .line 464
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->strip:Lcom/innioasis/ipp/Nav$Layer;
    iget v3, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    const/high16 v4, 0x40000000
    invoke-static { v3, v4 }, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I
    move-result v3
    iget v5, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
  .line 465
    invoke-static { v5, v4 }, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I
    move-result v4
  .line 464
    invoke-virtual { v0, v3, v4 }, Lcom/innioasis/ipp/Nav$Layer;->measure(II)V
  .line 466
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->strip:Lcom/innioasis/ipp/Nav$Layer;
    iget v3, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    iget v4, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    invoke-virtual { v0, v2, v2, v3, v4 }, Lcom/innioasis/ipp/Nav$Layer;->layout(IIII)V
  :L9
  .line 468
    return v1
.end method

.method private paint(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;FFF)V
  .registers 8
  .line 603
    cmpg-float v0, p5, p4
    if-gtz v0, :L0
    return-void
  :L0
  .line 604
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->save()I
  .line 605
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    int-to-float v0, v0
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->h:I
    int-to-float v1, v1
    invoke-virtual { p1, p4, v0, p5, v1 }, Landroid/graphics/Canvas;->clipRect(FFFF)Z
  .line 606
    const/4 p4, 0
    invoke-virtual { p1, p3, p4 }, Landroid/graphics/Canvas;->translate(FF)V
  .line 607
    if-nez p2, :L1
  .line 608
    const/high16 p2, 0xFF000000
    invoke-virtual { p1, p2 }, Landroid/graphics/Canvas;->drawColor(I)V
    goto :L2
  :L1
  .line 610
    iget p3, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    iget p4, p0, Lcom/innioasis/ipp/Nav$Run;->h:I
    const/4 p5, 0
    invoke-virtual { p2, p5, p5, p3, p4 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 611
    invoke-virtual { p2, p1 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
  :L2
  .line 613
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->restore()V
  .line 614
    return-void
.end method

.method private piece(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;FFF)V
  .registers 8
  .line 594
    cmpg-float v0, p5, p4
    if-gtz v0, :L0
    return-void
  :L0
  .line 595
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->save()I
  .line 596
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    int-to-float v0, v0
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->h:I
    int-to-float v1, v1
    invoke-virtual { p1, p4, v0, p5, v1 }, Landroid/graphics/Canvas;->clipRect(FFFF)Z
  .line 597
    iget p4, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    int-to-float p4, p4
    const/4 p5, 0
    invoke-virtual { p1, p2, p3, p4, p5 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
  .line 598
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->restore()V
  .line 599
    return-void
.end method

.method private step(F)V
  .registers 5
  .line 499
    iput p1, p0, Lcom/innioasis/ipp/Nav$Run;->p:F
  .line 500
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->origX:[F
    if-eqz v0, :L5
  .line 502
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
  .line 503
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
  .line 504
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
  .line 506
    iget-object p1, p0, Lcom/innioasis/ipp/Nav$Run;->under:Lcom/innioasis/ipp/Nav$Layer;
    if-eqz p1, :L6
    invoke-virtual { p1 }, Lcom/innioasis/ipp/Nav$Layer;->invalidate()V
  :L6
  .line 507
    iget-object p1, p0, Lcom/innioasis/ipp/Nav$Run;->over:Lcom/innioasis/ipp/Nav$Layer;
    if-eqz p1, :L7
    invoke-virtual { p1 }, Lcom/innioasis/ipp/Nav$Layer;->invalidate()V
  :L7
  .line 508
    return-void
.end method

.method begin()Z
  .registers 9
  .line 385
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->act:Landroid/app/Activity;
    invoke-virtual { v0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/view/ViewGroup;
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->decor:Landroid/view/ViewGroup;
  .line 386
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->getWidth()I
    move-result v0
    iput v0, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
  .line 387
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->decor:Landroid/view/ViewGroup;
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->getHeight()I
    move-result v0
    iput v0, p0, Lcom/innioasis/ipp/Nav$Run;->h:I
  .line 388
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    const/4 v2, 0
    if-lez v1, :L18
    if-gtz v0, :L0
    goto/16 :L18
  :L0
  .line 389
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->act:Landroid/app/Activity;
    const v1, 2131362408
    invoke-virtual { v0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->bar:Landroid/view/View;
  .line 390
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->act:Landroid/app/Activity;
    invoke-static { v0 }, Lcom/innioasis/ipp/Nav;->access$900(Landroid/app/Activity;)I
    move-result v0
    iput v0, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
  .line 391
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->h:I
    if-lt v0, v1, :L1
    return v2
  :L1
  .line 392
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
  .line 393
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->mode:I
    const/4 v1, -1
    const/4 v3, 1
    if-nez v0, :L6
  .line 394
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->oldList:Landroid/view/View;
    invoke-static { v0 }, Lcom/innioasis/ipp/Nav;->access$1100(Landroid/view/View;)I
    move-result v0
    iput v0, p0, Lcom/innioasis/ipp/Nav$Run;->oL:I
  .line 395
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->oldList:Landroid/view/View;
    invoke-static { v0 }, Lcom/innioasis/ipp/Nav;->access$1200(Landroid/view/View;)I
    move-result v0
    iput v0, p0, Lcom/innioasis/ipp/Nav$Run;->oR:I
  .line 396
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->newList:Landroid/view/View;
    invoke-static { v0 }, Lcom/innioasis/ipp/Nav;->access$1100(Landroid/view/View;)I
    move-result v0
    iput v0, p0, Lcom/innioasis/ipp/Nav$Run;->nL:I
  .line 397
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->newList:Landroid/view/View;
    invoke-static { v0 }, Lcom/innioasis/ipp/Nav;->access$1200(Landroid/view/View;)I
    move-result v0
    iput v0, p0, Lcom/innioasis/ipp/Nav$Run;->nR:I
  .line 398
    iget-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->pre:Z
    if-eqz v0, :L4
    iget-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->preList:Z
    if-eqz v0, :L4
  .line 399
    invoke-static { }, Lcom/innioasis/ipp/Nav;->access$1300()Landroid/graphics/Bitmap;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
    goto :L5
  :L4
  .line 401
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
  .line 402
    iget-object v2, p0, Lcom/innioasis/ipp/Nav$Run;->oldList:Landroid/view/View;
    iget v4, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    invoke-static { v0, v2, v4 }, Lcom/innioasis/ipp/Nav;->access$1500(Landroid/graphics/Bitmap;Landroid/view/View;I)V
  :L5
  .line 404
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->newList:Landroid/view/View;
    const/4 v2, 4
    invoke-virtual { v0, v2 }, Landroid/view/View;->setVisibility(I)V
  .line 405
    iput-boolean v3, p0, Lcom/innioasis/ipp/Nav$Run;->hid:Z
  .line 406
    invoke-direct { p0, v1 }, Lcom/innioasis/ipp/Nav$Run;->layer(I)Lcom/innioasis/ipp/Nav$Layer;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->over:Lcom/innioasis/ipp/Nav$Layer;
    goto/16 :L17
  :L6
  .line 408
    const/4 v4, 3
    if-eq v0, v3, :L7
    if-ne v0, v4, :L12
  :L7
  .line 409
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
  .line 410
    iget v5, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    invoke-static { v5, v0 }, Ljava/lang/Math;->min(II)I
    move-result v0
    iput v0, p0, Lcom/innioasis/ipp/Nav$Run;->edge:I
  :L12
  .line 412
    iget-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->pre:Z
    if-nez v0, :L13
  .line 413
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
  .line 414
    iget-object v5, p0, Lcom/innioasis/ipp/Nav$Run;->prev:Landroid/app/Activity;
    iget v6, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    invoke-static { v0, v5, v6 }, Lcom/innioasis/ipp/Nav;->access$1600(Landroid/graphics/Bitmap;Landroid/app/Activity;I)V
    goto :L14
  :L13
  .line 416
    invoke-static { }, Lcom/innioasis/ipp/Nav;->access$1000()Landroid/graphics/Bitmap;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
  :L14
  .line 418
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->mode:I
    if-ne v0, v4, :L16
  .line 419
    iget-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->back:Z
    if-eqz v0, :L15
  .line 420
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
  .line 421
    iget-object v2, p0, Lcom/innioasis/ipp/Nav$Run;->act:Landroid/app/Activity;
    iget v4, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    invoke-static { v0, v2, v4 }, Lcom/innioasis/ipp/Nav;->access$1600(Landroid/graphics/Bitmap;Landroid/app/Activity;I)V
  :L15
  .line 423
    invoke-direct { p0, v1 }, Lcom/innioasis/ipp/Nav$Run;->layer(I)Lcom/innioasis/ipp/Nav$Layer;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->over:Lcom/innioasis/ipp/Nav$Layer;
    goto :L17
  :L16
  .line 424
    invoke-direct { p0 }, Lcom/innioasis/ipp/Nav$Run;->moveSetup()Z
    move-result v0
    if-nez v0, :L17
  .line 425
    return v2
  :L17
  .line 428
    const/4 v0, 0
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/Nav$Run;->step(F)V
  .line 429
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    invoke-virtual { v0, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  .line 430
    return v3
  :L18
  .line 388
    return v2
.end method

.method public doFrame(J)V
  .registers 10
  .line 473
    iget-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->done:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 474
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->act:Landroid/app/Activity;
    invoke-static { v0 }, Lcom/innioasis/ipp/Nav$Popups;->hide(Landroid/app/Activity;)V
  .line 477
    iget-wide v0, p0, Lcom/innioasis/ipp/Nav$Run;->last:J
    const-wide/16 v2, 0
    cmp-long v4, v0, v2
    if-nez v4, :L1
    iput-wide p1, p0, Lcom/innioasis/ipp/Nav$Run;->first:J
  :L1
  .line 478
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
  .line 479
    iput-wide p1, p0, Lcom/innioasis/ipp/Nav$Run;->last:J
  .line 481
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
  .line 482
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p1
    invoke-virtual { p1, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  .line 483
    return-void
  :L4
  .line 485
    iget-wide p1, p0, Lcom/innioasis/ipp/Nav$Run;->elapsed:J
    add-long/2addr p1, v0
    iput-wide p1, p0, Lcom/innioasis/ipp/Nav$Run;->elapsed:J
  .line 486
    long-to-float p1, p1
    const p2, 1232348160
    div-float/2addr p1, p2
    invoke-static { }, Lcom/innioasis/ipp/Nav;->access$1900()[J
    move-result-object p2
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->mode:I
    aget-wide v0, p2, v0
    long-to-float p2, v0
    div-float/2addr p1, p2
    const/high16 p2, 0x3F800000
    invoke-static { p2, p1 }, Ljava/lang/Math;->min(FF)F
    move-result p1
  .line 488
    sub-float v0, p2, p1
  .line 489
    const v1, 1053609165
    mul-float v1, v1, p1
    mul-float v1, v1, p1
    const/high16 v2, 0x40000000
    mul-float v2, v2, p1
    const/high16 v3, 0x40400000
    sub-float/2addr v3, v2
    mul-float v1, v1, v3
    mul-float v0, v0, v0
    sub-float v0, p2, v0
    const v2, 1058642330
    mul-float v0, v0, v2
    add-float/2addr v1, v0
  .line 490
    invoke-direct { p0, v1 }, Lcom/innioasis/ipp/Nav$Run;->step(F)V
  .line 491
    cmpl-float p1, p1, p2
    if-ltz p1, :L5
  .line 492
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Nav$Run;->end()V
  .line 493
    return-void
  :L5
  .line 495
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p1
    invoke-virtual { p1, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  .line 496
    return-void
.end method

.method draw(Lcom/innioasis/ipp/Nav$Layer;Landroid/graphics/Canvas;)V
  .registers 11
  .line 529
    iget-boolean v1, p0, Lcom/innioasis/ipp/Nav$Run;->done:Z
    if-nez v1, :L21
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
    if-nez v1, :L0
    goto/16 :L21
  :L0
  .line 530
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->strip:Lcom/innioasis/ipp/Nav$Layer;
    if-ne p1, v1, :L1
  .line 531
    invoke-direct { p0, p2 }, Lcom/innioasis/ipp/Nav$Run;->drawStrip(Landroid/graphics/Canvas;)V
  .line 532
    return-void
  :L1
  .line 534
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->decor:Landroid/view/ViewGroup;
    invoke-virtual { v1 }, Landroid/view/ViewGroup;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v6
  .line 536
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->mode:I
    const/4 v2, 0
    const/high16 v3, 0x3F800000
    packed-switch v1, :L22
  .line 581
    iget-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->back:Z
    if-eqz v0, :L16
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->p:F
    sub-float/2addr v3, v1
    goto/16 :L17
  :L2
  .line 569
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    int-to-float v1, v0
    iget v2, p0, Lcom/innioasis/ipp/Nav$Run;->p:F
    mul-float v7, v1, v2
  .line 570
    iget-boolean v1, p0, Lcom/innioasis/ipp/Nav$Run;->back:Z
    if-nez v1, :L3
  .line 571
    iget-object v2, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
    neg-float v3, v7
    const/4 v4, 0
    int-to-float v0, v0
    sub-float v5, v0, v7
    move-object v0, p0
    move-object v1, p2
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/Nav$Run;->piece(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;FFF)V
  .line 572
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    int-to-float v1, v0
    sub-float v3, v1, v7
    int-to-float v1, v0
    sub-float v4, v1, v7
    int-to-float v5, v0
    move-object v0, p0
    move-object v1, p2
    move-object v2, v6
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/Nav$Run;->paint(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;FFF)V
    goto :L4
  :L3
  .line 574
    int-to-float v0, v0
    sub-float v3, v7, v0
    const/4 v4, 0
    move-object v0, p0
    move-object v1, p2
    move-object v2, v6
    move v5, v7
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/Nav$Run;->paint(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;FFF)V
  .line 575
    iget-object v2, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    int-to-float v5, v0
    move-object v0, p0
    move v3, v7
    move v4, v7
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/Nav$Run;->piece(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;FFF)V
  :L4
  .line 577
    return-void
  :L5
  .line 557
    iget-boolean v1, p0, Lcom/innioasis/ipp/Nav$Run;->back:Z
    if-eqz v1, :L6
    iget v3, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    int-to-float v3, v3
    iget v4, p0, Lcom/innioasis/ipp/Nav$Run;->p:F
    mul-float v3, v3, v4
    move v7, v3
    goto :L7
  :L6
    iget v4, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    int-to-float v4, v4
    iget v5, p0, Lcom/innioasis/ipp/Nav$Run;->p:F
    sub-float/2addr v3, v5
    mul-float v4, v4, v3
    move v7, v4
  :L7
  .line 558
    if-nez v1, :L8
  .line 559
    iget-object v3, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->edge:I
    int-to-float v0, v0
    sub-float v0, v7, v0
    invoke-static { v2, v0 }, Ljava/lang/Math;->min(FF)F
    move-result v4
    const/4 v5, 0
    move-object v0, p0
    move-object v1, p2
    move-object v2, v3
    move v3, v4
    move v4, v5
    move v5, v7
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/Nav$Run;->piece(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;FFF)V
  .line 560
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    int-to-float v5, v0
    move-object v0, p0
    move-object v2, v6
    move v3, v7
    move v4, v7
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/Nav$Run;->paint(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;FFF)V
    goto :L10
  :L8
  .line 561
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->under:Lcom/innioasis/ipp/Nav$Layer;
    if-ne p1, v1, :L9
  .line 562
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->edge:I
    int-to-float v0, v0
    sub-float v0, v7, v0
    invoke-static { v2, v0 }, Ljava/lang/Math;->min(FF)F
    move-result v3
    const/4 v4, 0
    move-object v0, p0
    move-object v1, p2
    move-object v2, v6
    move v5, v7
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/Nav$Run;->paint(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;FFF)V
    goto :L10
  :L9
  .line 564
    iget-object v2, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    int-to-float v5, v0
    move-object v0, p0
    move-object v1, p2
    move v3, v7
    move v4, v7
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/Nav$Run;->piece(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;FFF)V
  :L10
  .line 566
    return-void
  :L11
  .line 540
    iget-boolean v1, p0, Lcom/innioasis/ipp/Nav$Run;->back:Z
    if-nez v1, :L12
  .line 541
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->oR:I
    neg-int v4, v1
    int-to-float v4, v4
    iget v5, p0, Lcom/innioasis/ipp/Nav$Run;->p:F
    mul-float v4, v4, v5
  .line 542
    iget v6, p0, Lcom/innioasis/ipp/Nav$Run;->nL:I
    sub-int/2addr v1, v6
    int-to-float v1, v1
    sub-float/2addr v3, v5
    mul-float v1, v1, v3
    goto :L13
  :L12
  .line 544
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->nR:I
    int-to-float v4, v1
    iget v5, p0, Lcom/innioasis/ipp/Nav$Run;->p:F
    mul-float v4, v4, v5
  .line 545
    iget v6, p0, Lcom/innioasis/ipp/Nav$Run;->oL:I
    sub-int/2addr v1, v6
    neg-int v1, v1
    int-to-float v1, v1
    sub-float/2addr v3, v5
    mul-float v1, v1, v3
  :L13
  .line 548
    iget v3, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    int-to-float v3, v3
    iget v5, p0, Lcom/innioasis/ipp/Nav$Run;->nR:I
    iget v6, p0, Lcom/innioasis/ipp/Nav$Run;->oR:I
    if-lt v5, v6, :L14
    int-to-float v5, v5
    goto :L15
  :L14
    int-to-float v7, v6
    sub-int/2addr v5, v6
    int-to-float v5, v5
    iget v6, p0, Lcom/innioasis/ipp/Nav$Run;->p:F
    mul-float v5, v5, v6
    add-float/2addr v5, v7
  :L15
    iget v6, p0, Lcom/innioasis/ipp/Nav$Run;->h:I
    int-to-float v6, v6
    invoke-virtual { p2, v2, v3, v5, v6 }, Landroid/graphics/Canvas;->clipRect(FFFF)Z
  .line 549
    iget-object v2, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
    iget v3, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    int-to-float v3, v3
    const/4 v5, 0
    invoke-virtual { p2, v2, v4, v3, v5 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
  .line 550
    iget-object v2, p0, Lcom/innioasis/ipp/Nav$Run;->newList:Landroid/view/View;
    iget-object v3, p0, Lcom/innioasis/ipp/Nav$Run;->loc:[I
    invoke-virtual { v2, v3 }, Landroid/view/View;->getLocationInWindow([I)V
  .line 551
    iget-object v2, p0, Lcom/innioasis/ipp/Nav$Run;->at:[I
    invoke-virtual { p1, v2 }, Lcom/innioasis/ipp/Nav$Layer;->getLocationInWindow([I)V
  .line 552
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
  .line 553
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->newList:Landroid/view/View;
    invoke-virtual { v0, p2 }, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V
  .line 554
    return-void
  :L16
  .line 581
    iget v3, p0, Lcom/innioasis/ipp/Nav$Run;->p:F
  :L17
    move v6, v3
  .line 582
    if-eqz v0, :L18
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->shot2:Landroid/graphics/Bitmap;
    goto :L19
  :L18
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
  :L19
    move-object v7, v1
  .line 583
    if-eqz v0, :L20
    iget-object v2, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
    const/4 v3, 0
    const/4 v4, 0
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    int-to-float v5, v0
    move-object v0, p0
    move-object v1, p2
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/Nav$Run;->piece(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;FFF)V
  :L20
  .line 584
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->edge:I
    neg-int v1, v0
    int-to-float v1, v1
    mul-float v3, v1, v6
  .line 585
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    sub-int/2addr v1, v0
    int-to-float v1, v1
    mul-float v6, v6, v1
  .line 586
    const/4 v4, 0
    int-to-float v0, v0
    add-float v5, v0, v3
    move-object v0, p0
    move-object v1, p2
    move-object v2, v7
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/Nav$Run;->piece(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;FFF)V
  .line 587
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->edge:I
    int-to-float v0, v0
    add-float v4, v0, v6
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    int-to-float v5, v0
    move-object v0, p0
    move v3, v6
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/Nav$Run;->piece(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;FFF)V
  .line 590
    return-void
  :L21
  .line 529
    return-void
  :L22
  .packed-switch 0
    :L11
    :L5
    :L2
  .end packed-switch
.end method

.method end()V
  .catchall { :L1 .. :L7 } :L8
  .registers 5
  .line 511
    iget-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->done:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 512
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->done:Z
  :L1
  .line 514
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    invoke-virtual { v0, p0 }, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  .line 515
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->under:Lcom/innioasis/ipp/Nav$Layer;
    if-eqz v0, :L2
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->decor:Landroid/view/ViewGroup;
    invoke-virtual { v1, v0 }, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V
  :L2
  .line 516
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->over:Lcom/innioasis/ipp/Nav$Layer;
    if-eqz v0, :L3
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->decor:Landroid/view/ViewGroup;
    invoke-virtual { v1, v0 }, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V
  :L3
  .line 517
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->strip:Lcom/innioasis/ipp/Nav$Layer;
    if-eqz v0, :L4
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->root:Landroid/view/ViewGroup;
    invoke-virtual { v1, v0 }, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V
  :L4
  .line 518
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
  .line 519
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
  .line 521
    goto :L9
  :L8
  .line 520
    move-exception v0
  :L9
  .line 522
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
  .line 523
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->shot2:Landroid/graphics/Bitmap;
  .line 524
    invoke-static { }, Lcom/innioasis/ipp/Nav$Popups;->restore()V
  .line 525
    sget-object v1, Lcom/innioasis/ipp/Nav;->running:Lcom/innioasis/ipp/Nav$Run;
    if-ne v1, p0, :L10
    sput-object v0, Lcom/innioasis/ipp/Nav;->running:Lcom/innioasis/ipp/Nav$Run;
  :L10
  .line 526
    return-void
.end method

.method preShot(Z)V
  .registers 3
  .line 380
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->pre:Z
  .line 381
    iput-boolean p1, p0, Lcom/innioasis/ipp/Nav$Run;->preList:Z
  .line 382
    return-void
.end method
