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

.field private frames:I

.field private fromKey:J

.field private final gaps:Ljava/lang/StringBuilder;

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
  .line 383
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 348
    const/4 v0, -1
    iput v0, p0, Lcom/innioasis/ipp/Nav$Run;->oldEdge:I
  .line 367
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->moved:Ljava/util/ArrayList;
  .line 377
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->gaps:Ljava/lang/StringBuilder;
  .line 379
    const-wide/16 v0, -1
    iput-wide v0, p0, Lcom/innioasis/ipp/Nav$Run;->fromKey:J
  .line 380
    const/4 v0, 2
    new-array v1, v0, [I
    iput-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->loc:[I
  .line 381
    new-array v0, v0, [I
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->at:[I
  .line 384
    iput-object p1, p0, Lcom/innioasis/ipp/Nav$Run;->act:Landroid/app/Activity;
  .line 385
    iput-object p2, p0, Lcom/innioasis/ipp/Nav$Run;->prev:Landroid/app/Activity;
  .line 386
    iput-boolean p3, p0, Lcom/innioasis/ipp/Nav$Run;->back:Z
  .line 387
    iput p4, p0, Lcom/innioasis/ipp/Nav$Run;->mode:I
  .line 388
    iput-object p5, p0, Lcom/innioasis/ipp/Nav$Run;->oldList:Landroid/view/View;
  .line 389
    iput-object p6, p0, Lcom/innioasis/ipp/Nav$Run;->newList:Landroid/view/View;
  .line 390
    return-void
.end method

.method private drawStrip(Landroid/graphics/Canvas;)V
  .registers 7
  .line 641
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->root:Landroid/view/ViewGroup;
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->at:[I
    invoke-virtual { v0, v1 }, Landroid/view/ViewGroup;->getLocationInWindow([I)V
  .line 642
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->save()I
  .line 643
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
  .line 644
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->decor:Landroid/view/ViewGroup;
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
  .line 645
    if-nez v0, :L0
  .line 646
    const/high16 v0, 0xFF000000
    invoke-virtual { p1, v0 }, Landroid/graphics/Canvas;->drawColor(I)V
    goto :L1
  :L0
  .line 648
    iget v2, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    iget v3, p0, Lcom/innioasis/ipp/Nav$Run;->h:I
    invoke-virtual { v0, v1, v1, v2, v3 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 649
    invoke-virtual { v0, p1 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
  :L1
  .line 651
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->restore()V
  .line 652
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    iget v2, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    invoke-virtual { p1, v1, v1, v0, v2 }, Landroid/graphics/Canvas;->clipRect(IIII)Z
  .line 653
    nop
  :L2
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->origX:[F
    array-length v0, v0
    if-ge v1, v0, :L5
  .line 654
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->moved:Ljava/util/ArrayList;
    invoke-virtual { v0, v1 }, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/view/View;
  .line 655
    invoke-virtual { v0 }, Landroid/view/View;->getVisibility()I
    move-result v2
    if-eqz v2, :L3
    goto :L4
  :L3
  .line 656
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->save()I
  .line 657
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
  .line 658
    invoke-virtual { v0, p1 }, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V
  .line 659
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->restore()V
  :L4
  .line 653
    add-int/lit8 v1, v1, 1
    goto :L2
  :L5
  .line 661
    return-void
.end method

.method private layer(I)Lcom/innioasis/ipp/Nav$Layer;
  .registers 6
  .line 451
    new-instance v0, Lcom/innioasis/ipp/Nav$Layer;
    invoke-direct { v0, p0 }, Lcom/innioasis/ipp/Nav$Layer;-><init>(Lcom/innioasis/ipp/Nav$Run;)V
  .line 452
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->decor:Landroid/view/ViewGroup;
    new-instance v2, Landroid/view/ViewGroup$LayoutParams;
    const/4 v3, -1
    invoke-direct { v2, v3, v3 }, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V
    invoke-virtual { v1, v0, p1, v2 }, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
  .line 453
    iget p1, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    const/high16 v1, 0x40000000
    invoke-static { p1, v1 }, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I
    move-result p1
    iget v2, p0, Lcom/innioasis/ipp/Nav$Run;->h:I
  .line 454
    invoke-static { v2, v1 }, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I
    move-result v1
  .line 453
    invoke-virtual { v0, p1, v1 }, Lcom/innioasis/ipp/Nav$Layer;->measure(II)V
  .line 455
    iget p1, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->h:I
    const/4 v2, 0
    invoke-virtual { v0, v2, v2, p1, v1 }, Lcom/innioasis/ipp/Nav$Layer;->layout(IIII)V
  .line 456
    return-object v0
.end method

.method private moveSetup()Z
  .registers 7
  .line 461
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->act:Landroid/app/Activity;
    const v1, 2131362153
    invoke-virtual { v0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
  .line 462
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-virtual { v0 }, Landroid/view/View;->getParent()Landroid/view/ViewParent;
    move-result-object v0
  :L1
  .line 463
    instance-of v1, v0, Landroid/view/ViewGroup;
    const/4 v2, 0
    if-nez v1, :L2
    return v2
  :L2
  .line 464
    check-cast v0, Landroid/view/ViewGroup;
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->root:Landroid/view/ViewGroup;
  .line 465
    const/4 v0, 0
  :L3
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->root:Landroid/view/ViewGroup;
    invoke-virtual { v1 }, Landroid/view/ViewGroup;->getChildCount()I
    move-result v1
    if-ge v0, v1, :L5
  .line 466
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->root:Landroid/view/ViewGroup;
    invoke-virtual { v1, v0 }, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;
    move-result-object v1
  .line 467
    iget-object v3, p0, Lcom/innioasis/ipp/Nav$Run;->bar:Landroid/view/View;
    if-eq v1, v3, :L4
    iget-object v3, p0, Lcom/innioasis/ipp/Nav$Run;->moved:Ljava/util/ArrayList;
    invoke-virtual { v3, v1 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
  :L4
  .line 465
    add-int/lit8 v0, v0, 1
    goto :L3
  :L5
  .line 469
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->moved:Ljava/util/ArrayList;
    invoke-virtual { v0 }, Ljava/util/ArrayList;->size()I
    move-result v0
    new-array v0, v0, [F
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->origX:[F
  .line 470
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
  .line 471
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
  .line 472
    invoke-direct { p0, v2 }, Lcom/innioasis/ipp/Nav$Run;->layer(I)Lcom/innioasis/ipp/Nav$Layer;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->under:Lcom/innioasis/ipp/Nav$Layer;
  :L9
  .line 474
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
  .line 475
    new-instance v0, Lcom/innioasis/ipp/Nav$Layer;
    invoke-direct { v0, p0 }, Lcom/innioasis/ipp/Nav$Layer;-><init>(Lcom/innioasis/ipp/Nav$Run;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->strip:Lcom/innioasis/ipp/Nav$Layer;
  .line 476
    new-instance v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;
    iget v3, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    iget v4, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    invoke-direct { v0, v3, v4 }, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;-><init>(II)V
  .line 477
    iput v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->leftToLeft:I
  .line 478
    iput v2, v0, Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;->topToTop:I
  .line 479
    iget-object v3, p0, Lcom/innioasis/ipp/Nav$Run;->root:Landroid/view/ViewGroup;
    iget-object v4, p0, Lcom/innioasis/ipp/Nav$Run;->strip:Lcom/innioasis/ipp/Nav$Layer;
    iget-object v5, p0, Lcom/innioasis/ipp/Nav$Run;->bar:Landroid/view/View;
    invoke-virtual { v3, v5 }, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I
    move-result v5
    invoke-virtual { v3, v4, v5, v0 }, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
  .line 480
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->strip:Lcom/innioasis/ipp/Nav$Layer;
    iget v3, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    const/high16 v4, 0x40000000
    invoke-static { v3, v4 }, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I
    move-result v3
    iget v5, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
  .line 481
    invoke-static { v5, v4 }, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I
    move-result v4
  .line 480
    invoke-virtual { v0, v3, v4 }, Lcom/innioasis/ipp/Nav$Layer;->measure(II)V
  .line 482
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->strip:Lcom/innioasis/ipp/Nav$Layer;
    iget v3, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    iget v4, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    invoke-virtual { v0, v2, v2, v3, v4 }, Lcom/innioasis/ipp/Nav$Layer;->layout(IIII)V
  :L10
  .line 484
    return v1
.end method

.method private paint(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;FFF)V
  .registers 8
  .line 626
    cmpg-float v0, p5, p4
    if-gtz v0, :L0
    return-void
  :L0
  .line 627
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->save()I
  .line 628
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    int-to-float v0, v0
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->h:I
    int-to-float v1, v1
    invoke-virtual { p1, p4, v0, p5, v1 }, Landroid/graphics/Canvas;->clipRect(FFFF)Z
  .line 629
    const/4 p4, 0
    invoke-virtual { p1, p3, p4 }, Landroid/graphics/Canvas;->translate(FF)V
  .line 630
    if-nez p2, :L1
  .line 631
    const/high16 p2, 0xFF000000
    invoke-virtual { p1, p2 }, Landroid/graphics/Canvas;->drawColor(I)V
    goto :L2
  :L1
  .line 633
    iget p3, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    iget p4, p0, Lcom/innioasis/ipp/Nav$Run;->h:I
    const/4 p5, 0
    invoke-virtual { p2, p5, p5, p3, p4 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 634
    invoke-virtual { p2, p1 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
  :L2
  .line 636
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->restore()V
  .line 637
    return-void
.end method

.method private piece(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;FFF)V
  .registers 8
  .line 617
    cmpg-float v0, p5, p4
    if-gtz v0, :L0
    return-void
  :L0
  .line 618
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->save()I
  .line 619
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    int-to-float v0, v0
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->h:I
    int-to-float v1, v1
    invoke-virtual { p1, p4, v0, p5, v1 }, Landroid/graphics/Canvas;->clipRect(FFFF)Z
  .line 620
    iget p4, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    int-to-float p4, p4
    const/4 p5, 0
    invoke-virtual { p1, p2, p3, p4, p5 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
  .line 621
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->restore()V
  .line 622
    return-void
.end method

.method private step(F)V
  .registers 5
  .line 519
    iput p1, p0, Lcom/innioasis/ipp/Nav$Run;->p:F
  .line 520
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->origX:[F
    if-eqz v0, :L5
  .line 522
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
  .line 523
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
  .line 524
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
  .line 526
    iget-object p1, p0, Lcom/innioasis/ipp/Nav$Run;->under:Lcom/innioasis/ipp/Nav$Layer;
    if-eqz p1, :L6
    invoke-virtual { p1 }, Lcom/innioasis/ipp/Nav$Layer;->invalidate()V
  :L6
  .line 527
    iget-object p1, p0, Lcom/innioasis/ipp/Nav$Run;->over:Lcom/innioasis/ipp/Nav$Layer;
    if-eqz p1, :L7
    invoke-virtual { p1 }, Lcom/innioasis/ipp/Nav$Layer;->invalidate()V
  :L7
  .line 528
    return-void
.end method

.method begin()Z
  .registers 9
  .line 399
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->act:Landroid/app/Activity;
    invoke-virtual { v0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v0
    check-cast v0, Landroid/view/ViewGroup;
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->decor:Landroid/view/ViewGroup;
  .line 400
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->getWidth()I
    move-result v0
    iput v0, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
  .line 401
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->decor:Landroid/view/ViewGroup;
    invoke-virtual { v0 }, Landroid/view/ViewGroup;->getHeight()I
    move-result v0
    iput v0, p0, Lcom/innioasis/ipp/Nav$Run;->h:I
  .line 402
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    const/4 v2, 0
    if-lez v1, :L19
    if-gtz v0, :L0
    goto/16 :L19
  :L0
  .line 403
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->act:Landroid/app/Activity;
    const v1, 2131362408
    invoke-virtual { v0, v1 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->bar:Landroid/view/View;
  .line 404
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->act:Landroid/app/Activity;
    invoke-static { v0 }, Lcom/innioasis/ipp/Nav;->access$900(Landroid/app/Activity;)I
    move-result v0
    iput v0, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
  .line 405
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->h:I
    if-lt v0, v1, :L1
    return v2
  :L1
  .line 406
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
  .line 407
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->prev:Landroid/app/Activity;
    invoke-virtual { v0 }, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->oldBg:Landroid/graphics/drawable/Drawable;
  .line 408
    iget-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->pre:Z
    if-eqz v0, :L4
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    invoke-static { }, Lcom/innioasis/ipp/Nav;->access$1100()J
    move-result-wide v3
    sub-long/2addr v0, v3
    iput-wide v0, p0, Lcom/innioasis/ipp/Nav$Run;->fromKey:J
  :L4
  .line 409
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->mode:I
    const/4 v1, -1
    const/4 v3, 1
    if-nez v0, :L7
  .line 410
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->oldList:Landroid/view/View;
    invoke-static { v0 }, Lcom/innioasis/ipp/Nav;->access$1200(Landroid/view/View;)I
    move-result v0
    iput v0, p0, Lcom/innioasis/ipp/Nav$Run;->oL:I
  .line 411
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->oldList:Landroid/view/View;
    invoke-static { v0 }, Lcom/innioasis/ipp/Nav;->access$1300(Landroid/view/View;)I
    move-result v0
    iput v0, p0, Lcom/innioasis/ipp/Nav$Run;->oR:I
  .line 412
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->newList:Landroid/view/View;
    invoke-static { v0 }, Lcom/innioasis/ipp/Nav;->access$1200(Landroid/view/View;)I
    move-result v0
    iput v0, p0, Lcom/innioasis/ipp/Nav$Run;->nL:I
  .line 413
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->newList:Landroid/view/View;
    invoke-static { v0 }, Lcom/innioasis/ipp/Nav;->access$1300(Landroid/view/View;)I
    move-result v0
    iput v0, p0, Lcom/innioasis/ipp/Nav$Run;->nR:I
  .line 414
    iget-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->pre:Z
    if-eqz v0, :L5
    iget-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->preList:Z
    if-eqz v0, :L5
  .line 415
    invoke-static { }, Lcom/innioasis/ipp/Nav;->access$1400()Landroid/graphics/Bitmap;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
    goto :L6
  :L5
  .line 417
    invoke-static { }, Lcom/innioasis/ipp/Nav;->access$1400()Landroid/graphics/Bitmap;
    move-result-object v0
    iget v2, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    iget v4, p0, Lcom/innioasis/ipp/Nav$Run;->h:I
    iget v5, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    sub-int/2addr v4, v5
    invoke-static { v0, v2, v4 }, Lcom/innioasis/ipp/Nav;->access$1500(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Nav;->access$1402(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
  .line 418
    iget-object v2, p0, Lcom/innioasis/ipp/Nav$Run;->oldList:Landroid/view/View;
    iget v4, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    invoke-static { v0, v2, v4 }, Lcom/innioasis/ipp/Nav;->access$1600(Landroid/graphics/Bitmap;Landroid/view/View;I)V
  :L6
  .line 420
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->newList:Landroid/view/View;
    const/4 v2, 4
    invoke-virtual { v0, v2 }, Landroid/view/View;->setVisibility(I)V
  .line 421
    iput-boolean v3, p0, Lcom/innioasis/ipp/Nav$Run;->hid:Z
  .line 422
    invoke-direct { p0, v1 }, Lcom/innioasis/ipp/Nav$Run;->layer(I)Lcom/innioasis/ipp/Nav$Layer;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->over:Lcom/innioasis/ipp/Nav$Layer;
    goto/16 :L18
  :L7
  .line 424
    const/4 v4, 3
    if-eq v0, v3, :L8
    if-ne v0, v4, :L13
  :L8
  .line 425
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->oldEdge:I
    if-ltz v0, :L9
    goto :L12
  :L9
    iget-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->back:Z
    if-eqz v0, :L10
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->newList:Landroid/view/View;
    goto :L11
  :L10
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->oldList:Landroid/view/View;
  :L11
    invoke-static { v0 }, Lcom/innioasis/ipp/Nav;->access$1300(Landroid/view/View;)I
    move-result v0
  :L12
    iput v0, p0, Lcom/innioasis/ipp/Nav$Run;->edge:I
  .line 426
    iget v5, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    invoke-static { v5, v0 }, Ljava/lang/Math;->min(II)I
    move-result v0
    iput v0, p0, Lcom/innioasis/ipp/Nav$Run;->edge:I
  :L13
  .line 428
    iget-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->pre:Z
    if-nez v0, :L14
  .line 429
    invoke-static { }, Lcom/innioasis/ipp/Nav;->access$1000()Landroid/graphics/Bitmap;
    move-result-object v0
    iget v5, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    iget v6, p0, Lcom/innioasis/ipp/Nav$Run;->h:I
    iget v7, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    sub-int/2addr v6, v7
    invoke-static { v0, v5, v6 }, Lcom/innioasis/ipp/Nav;->access$1500(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Nav;->access$1002(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
  .line 430
    iget-object v5, p0, Lcom/innioasis/ipp/Nav$Run;->prev:Landroid/app/Activity;
    iget v6, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    invoke-static { v0, v5, v6 }, Lcom/innioasis/ipp/Nav;->access$1700(Landroid/graphics/Bitmap;Landroid/app/Activity;I)V
    goto :L15
  :L14
  .line 432
    invoke-static { }, Lcom/innioasis/ipp/Nav;->access$1000()Landroid/graphics/Bitmap;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
  :L15
  .line 434
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->mode:I
    if-ne v0, v4, :L17
  .line 435
    iget-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->back:Z
    if-eqz v0, :L16
  .line 436
    invoke-static { }, Lcom/innioasis/ipp/Nav;->access$1800()Landroid/graphics/Bitmap;
    move-result-object v0
    iget v2, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    iget v4, p0, Lcom/innioasis/ipp/Nav$Run;->h:I
    iget v5, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    sub-int/2addr v4, v5
    invoke-static { v0, v2, v4 }, Lcom/innioasis/ipp/Nav;->access$1500(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Nav;->access$1802(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->shot2:Landroid/graphics/Bitmap;
  .line 437
    iget-object v2, p0, Lcom/innioasis/ipp/Nav$Run;->act:Landroid/app/Activity;
    iget v4, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    invoke-static { v0, v2, v4 }, Lcom/innioasis/ipp/Nav;->access$1700(Landroid/graphics/Bitmap;Landroid/app/Activity;I)V
  :L16
  .line 439
    invoke-direct { p0, v1 }, Lcom/innioasis/ipp/Nav$Run;->layer(I)Lcom/innioasis/ipp/Nav$Layer;
    move-result-object v0
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->over:Lcom/innioasis/ipp/Nav$Layer;
    goto :L18
  :L17
  .line 440
    invoke-direct { p0 }, Lcom/innioasis/ipp/Nav$Run;->moveSetup()Z
    move-result v0
    if-nez v0, :L18
  .line 441
    return v2
  :L18
  .line 444
    const/4 v0, 0
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/Nav$Run;->step(F)V
  .line 445
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    invoke-virtual { v0, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  .line 446
    return v3
  :L19
  .line 402
    return v2
.end method

.method public doFrame(J)V
  .registers 10
  .line 489
    iget-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->done:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 490
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->act:Landroid/app/Activity;
    invoke-static { v0 }, Lcom/innioasis/ipp/Nav$Popups;->hide(Landroid/app/Activity;)V
  .line 493
    iget-wide v0, p0, Lcom/innioasis/ipp/Nav$Run;->last:J
    const-wide/16 v2, 0
    cmp-long v4, v0, v2
    if-nez v4, :L1
    iput-wide p1, p0, Lcom/innioasis/ipp/Nav$Run;->first:J
  :L1
  .line 494
    cmp-long v4, v0, v2
    if-eqz v4, :L2
  .line 495
    sub-long v0, p1, v0
    const-wide/32 v4, 1000000
    div-long/2addr v0, v4
  .line 496
    iget v4, p0, Lcom/innioasis/ipp/Nav$Run;->frames:I
    add-int/lit8 v4, v4, 1
    iput v4, p0, Lcom/innioasis/ipp/Nav$Run;->frames:I
  .line 497
    const-wide/16 v4, 40
    cmp-long v6, v0, v4
    if-lez v6, :L2
    iget-object v4, p0, Lcom/innioasis/ipp/Nav$Run;->gaps:Ljava/lang/StringBuilder;
    const/16 v5, 32
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, v0, v1 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
  :L2
  .line 499
    iget-wide v0, p0, Lcom/innioasis/ipp/Nav$Run;->last:J
    cmp-long v4, v0, v2
    if-nez v4, :L3
    const-wide/32 v0, 27000000
    goto :L4
  :L3
    sub-long v0, p1, v0
    const-wide/32 v4, 54000000
    invoke-static { v0, v1, v4, v5 }, Ljava/lang/Math;->min(JJ)J
    move-result-wide v0
  :L4
  .line 500
    iput-wide p1, p0, Lcom/innioasis/ipp/Nav$Run;->last:J
  .line 502
    iget-wide v4, p0, Lcom/innioasis/ipp/Nav$Run;->elapsed:J
    cmp-long v6, v4, v2
    if-nez v6, :L5
    iget-wide v2, p0, Lcom/innioasis/ipp/Nav$Run;->first:J
    sub-long/2addr p1, v2
    const-wide/32 v2, 400000000
    cmp-long v4, p1, v2
    if-gez v4, :L5
    iget-object p1, p0, Lcom/innioasis/ipp/Nav$Run;->act:Landroid/app/Activity;
    const p2, 2131362153
    invoke-virtual { p1, p2 }, Landroid/app/Activity;->findViewById(I)Landroid/view/View;
    move-result-object p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Nav;->access$1900(Landroid/view/View;)Z
    move-result p1
    if-nez p1, :L5
  .line 503
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p1
    invoke-virtual { p1, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  .line 504
    return-void
  :L5
  .line 506
    iget-wide p1, p0, Lcom/innioasis/ipp/Nav$Run;->elapsed:J
    add-long/2addr p1, v0
    iput-wide p1, p0, Lcom/innioasis/ipp/Nav$Run;->elapsed:J
  .line 507
    const/high16 v0, 0x41600000
    long-to-float p1, p1
    mul-float p1, p1, v0
    const p2, 1315859240
    div-float/2addr p1, p2
  .line 508
    const/high16 p2, 0x3F800000
    add-float v0, p1, p2
    neg-float p1, p1
    float-to-double v1, p1
    invoke-static { v1, v2 }, Ljava/lang/Math;->exp(D)D
    move-result-wide v1
    double-to-float p1, v1
    mul-float v0, v0, p1
    sub-float p1, p2, v0
  .line 509
    sub-float v0, p2, p1
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    int-to-float v1, v1
    mul-float v0, v0, v1
    const/high16 v1, 0x3F000000
    cmpg-float v0, v0, v1
    if-gez v0, :L6
    const/high16 p1, 0x3F800000
  :L6
  .line 510
    invoke-direct { p0, p1 }, Lcom/innioasis/ipp/Nav$Run;->step(F)V
  .line 511
    cmpl-float p1, p1, p2
    if-ltz p1, :L7
  .line 512
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Nav$Run;->end()V
  .line 513
    return-void
  :L7
  .line 515
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object p1
    invoke-virtual { p1, p0 }, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  .line 516
    return-void
.end method

.method draw(Lcom/innioasis/ipp/Nav$Layer;Landroid/graphics/Canvas;)V
  .registers 13
  .line 551
    iget-boolean v1, p0, Lcom/innioasis/ipp/Nav$Run;->done:Z
    if-nez v1, :L22
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
    if-nez v1, :L0
    goto/16 :L22
  :L0
  .line 552
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->strip:Lcom/innioasis/ipp/Nav$Layer;
    if-ne p1, v1, :L1
  .line 553
    invoke-direct { p0, p2 }, Lcom/innioasis/ipp/Nav$Run;->drawStrip(Landroid/graphics/Canvas;)V
  .line 554
    return-void
  :L1
  .line 556
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->decor:Landroid/view/ViewGroup;
    invoke-virtual { v1 }, Landroid/view/ViewGroup;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v2
  .line 558
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->mode:I
    const/4 v3, 0
    const/high16 v4, 0x3F800000
    packed-switch v1, :L23
  .line 597
    iget-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->back:Z
    if-eqz v0, :L15
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->p:F
    sub-float/2addr v4, v1
    goto/16 :L16
  :L2
  .line 590
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    int-to-float v1, v0
    iget v2, p0, Lcom/innioasis/ipp/Nav$Run;->p:F
    mul-float v4, v1, v2
  .line 591
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
  .line 592
    iget-object v2, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
    int-to-float v5, v0
    move-object v0, p0
    move-object v1, p2
    move v3, v4
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/Nav$Run;->piece(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;FFF)V
  :L4
  .line 593
    return-void
  :L5
  .line 579
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
  .line 581
    if-nez v0, :L8
  .line 582
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
  .line 584
    const/4 v3, 0
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    int-to-float v5, v0
    move-object v0, p0
    move-object v1, p2
    move v4, v6
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/Nav$Run;->paint(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;FFF)V
  .line 585
    iget-object v2, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    int-to-float v5, v0
    move-object v0, p0
    move v3, v6
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/Nav$Run;->piece(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;FFF)V
  :L9
  .line 587
    return-void
  :L10
  .line 562
    iget-boolean v1, p0, Lcom/innioasis/ipp/Nav$Run;->back:Z
    if-nez v1, :L11
  .line 563
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->oR:I
    neg-int v2, v1
    int-to-float v2, v2
    iget v5, p0, Lcom/innioasis/ipp/Nav$Run;->p:F
    mul-float v2, v2, v5
  .line 564
    iget v6, p0, Lcom/innioasis/ipp/Nav$Run;->nL:I
    sub-int/2addr v1, v6
    int-to-float v1, v1
    sub-float/2addr v4, v5
    mul-float v1, v1, v4
    goto :L12
  :L11
  .line 566
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->nR:I
    int-to-float v2, v1
    iget v5, p0, Lcom/innioasis/ipp/Nav$Run;->p:F
    mul-float v2, v2, v5
  .line 567
    iget v6, p0, Lcom/innioasis/ipp/Nav$Run;->oL:I
    sub-int/2addr v1, v6
    neg-int v1, v1
    int-to-float v1, v1
    sub-float/2addr v4, v5
    mul-float v1, v1, v4
  :L12
  .line 570
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
  .line 571
    iget-object v3, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
    iget v4, p0, Lcom/innioasis/ipp/Nav$Run;->top:I
    int-to-float v4, v4
    const/4 v5, 0
    invoke-virtual { p2, v3, v2, v4, v5 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
  .line 572
    iget-object v2, p0, Lcom/innioasis/ipp/Nav$Run;->newList:Landroid/view/View;
    iget-object v3, p0, Lcom/innioasis/ipp/Nav$Run;->loc:[I
    invoke-virtual { v2, v3 }, Landroid/view/View;->getLocationInWindow([I)V
  .line 573
    iget-object v2, p0, Lcom/innioasis/ipp/Nav$Run;->at:[I
    invoke-virtual { p1, v2 }, Lcom/innioasis/ipp/Nav$Layer;->getLocationInWindow([I)V
  .line 574
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
  .line 575
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->newList:Landroid/view/View;
    invoke-virtual { v0, p2 }, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V
  .line 576
    return-void
  :L15
  .line 597
    iget v4, p0, Lcom/innioasis/ipp/Nav$Run;->p:F
  :L16
    move v6, v4
  .line 598
    if-eqz v0, :L17
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->shot2:Landroid/graphics/Bitmap;
    goto :L18
  :L17
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
  :L18
    move-object v7, v1
  .line 600
    if-eqz v0, :L19
    move-object v8, v2
    goto :L20
  :L19
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->oldBg:Landroid/graphics/drawable/Drawable;
    move-object v8, v1
  :L20
  .line 601
    if-eqz v0, :L21
  .line 602
    iget-object v2, p0, Lcom/innioasis/ipp/Nav$Run;->oldBg:Landroid/graphics/drawable/Drawable;
    const/4 v3, 0
    const/4 v4, 0
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    int-to-float v5, v0
    move-object v0, p0
    move-object v1, p2
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/Nav$Run;->paint(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;FFF)V
  .line 603
    iget-object v2, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    int-to-float v5, v0
    move-object v0, p0
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/Nav$Run;->piece(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;FFF)V
  :L21
  .line 605
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->edge:I
    neg-int v1, v0
    int-to-float v1, v1
    mul-float v9, v1, v6
  .line 606
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    sub-int/2addr v1, v0
    int-to-float v1, v1
    mul-float v6, v6, v1
  .line 607
    const/4 v4, 0
    int-to-float v0, v0
    add-float v5, v0, v9
    move-object v0, p0
    move-object v1, p2
    move-object v2, v8
    move v3, v9
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/Nav$Run;->paint(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;FFF)V
  .line 608
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->edge:I
    int-to-float v0, v0
    add-float v5, v0, v9
    move-object v0, p0
    move-object v2, v7
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/Nav$Run;->piece(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;FFF)V
  .line 609
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->edge:I
    int-to-float v0, v0
    add-float v4, v0, v6
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    int-to-float v5, v0
    move-object v0, p0
    move-object v2, v8
    move v3, v6
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/Nav$Run;->paint(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;FFF)V
  .line 610
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->edge:I
    int-to-float v0, v0
    add-float v4, v0, v6
    iget v0, p0, Lcom/innioasis/ipp/Nav$Run;->w:I
    int-to-float v5, v0
    move-object v0, p0
    move-object v2, v7
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/ipp/Nav$Run;->piece(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;FFF)V
  .line 613
    return-void
  :L22
  .line 551
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
  .registers 6
  .line 531
    iget-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->done:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 532
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->done:Z
  .line 533
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->act:Landroid/app/Activity;
    invoke-virtual { v1 }, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " mode "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->mode:I
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " key-start "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-wide v1, p0, Lcom/innioasis/ipp/Nav$Run;->fromKey:J
    invoke-virtual { v0, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " frames "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget v1, p0, Lcom/innioasis/ipp/Nav$Run;->frames:I
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " ms "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-wide v1, p0, Lcom/innioasis/ipp/Nav$Run;->last:J
    iget-wide v3, p0, Lcom/innioasis/ipp/Nav$Run;->first:J
    sub-long/2addr v1, v3
    const-wide/32 v3, 1000000
    div-long/2addr v1, v3
    invoke-virtual { v0, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, " slow"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->gaps:Ljava/lang/StringBuilder;
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    const-string v1, "ippnav"
    invoke-static { v1, v0 }, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
  :L1
  .line 536
    invoke-static { }, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;
    move-result-object v0
    invoke-virtual { v0, p0 }, Landroid/view/Choreographer;->removeFrameCallback(Landroid/view/Choreographer$FrameCallback;)V
  .line 537
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->under:Lcom/innioasis/ipp/Nav$Layer;
    if-eqz v0, :L2
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->decor:Landroid/view/ViewGroup;
    invoke-virtual { v1, v0 }, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V
  :L2
  .line 538
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->over:Lcom/innioasis/ipp/Nav$Layer;
    if-eqz v0, :L3
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->decor:Landroid/view/ViewGroup;
    invoke-virtual { v1, v0 }, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V
  :L3
  .line 539
    iget-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->strip:Lcom/innioasis/ipp/Nav$Layer;
    if-eqz v0, :L4
    iget-object v1, p0, Lcom/innioasis/ipp/Nav$Run;->root:Landroid/view/ViewGroup;
    invoke-virtual { v1, v0 }, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V
  :L4
  .line 540
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
  .line 541
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
  .line 543
    goto :L9
  :L8
  .line 542
    move-exception v0
  :L9
  .line 544
    const/4 v0, 0
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->shot:Landroid/graphics/Bitmap;
  .line 545
    iput-object v0, p0, Lcom/innioasis/ipp/Nav$Run;->shot2:Landroid/graphics/Bitmap;
  .line 546
    invoke-static { }, Lcom/innioasis/ipp/Nav$Popups;->restore()V
  .line 547
    sget-object v1, Lcom/innioasis/ipp/Nav;->running:Lcom/innioasis/ipp/Nav$Run;
    if-ne v1, p0, :L10
    sput-object v0, Lcom/innioasis/ipp/Nav;->running:Lcom/innioasis/ipp/Nav$Run;
  :L10
  .line 548
    return-void
.end method

.method preShot(Z)V
  .registers 3
  .line 394
    const/4 v0, 1
    iput-boolean v0, p0, Lcom/innioasis/ipp/Nav$Run;->pre:Z
  .line 395
    iput-boolean p1, p0, Lcom/innioasis/ipp/Nav$Run;->preList:Z
  .line 396
    return-void
.end method
