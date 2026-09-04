.class final Lcom/innioasis/ipp/Head$Ride;
.super Ljava/lang/Object;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;
.source "Head.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Head;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Ride"
.end annotation

.field private final static PEND_FRAMES:I = 120

.field private final barRef:Ljava/lang/ref/WeakReference;

.field private final lvRef:Ljava/lang/ref/WeakReference;

.field private pendAd:Ljava/lang/ref/WeakReference;

.field private pendAge:I

.field private pendFixed:Z

.field private pendPos:I

.field private pendY:I

.field private final spvRef:Ljava/lang/ref/WeakReference;

.method constructor <init>(Landroid/widget/ListView;Landroid/view/View;Landroid/view/View;)V
  .registers 5
  .line 312
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 354
    const/4 v0, -1
    iput v0, p0, Lcom/innioasis/ipp/Head$Ride;->pendPos:I
  .line 313
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Head$Ride;->lvRef:Ljava/lang/ref/WeakReference;
  .line 314
    new-instance p1, Ljava/lang/ref/WeakReference;
    invoke-direct { p1, p2 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object p1, p0, Lcom/innioasis/ipp/Head$Ride;->spvRef:Ljava/lang/ref/WeakReference;
  .line 315
    if-nez p3, :L0
    const/4 p1, 0
    goto :L1
  :L0
    new-instance p1, Ljava/lang/ref/WeakReference;
    invoke-direct { p1, p3 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
  :L1
    iput-object p1, p0, Lcom/innioasis/ipp/Head$Ride;->barRef:Ljava/lang/ref/WeakReference;
  .line 316
    return-void
.end method

.method private bar()Landroid/view/View;
  .registers 4
  .line 329
    iget-object v0, p0, Lcom/innioasis/ipp/Head$Ride;->barRef:Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    if-nez v0, :L0
    move-object v0, v1
    goto :L1
  :L0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L1
  .line 330
    instance-of v2, v0, Landroid/view/View;
    if-eqz v2, :L2
    move-object v1, v0
    check-cast v1, Landroid/view/View;
  :L2
    return-object v1
.end method

.method private static h(Landroid/view/View;)I
  .registers 3
  .line 340
    const/4 v0, 0
    if-eqz p0, :L3
    invoke-virtual { p0 }, Landroid/view/View;->getVisibility()I
    move-result v1
    if-eqz v1, :L0
    goto :L3
  :L0
  .line 341
    invoke-virtual { p0 }, Landroid/view/View;->getHeight()I
    move-result v1
  .line 342
    if-lez v1, :L1
    return v1
  :L1
  .line 343
    invoke-virtual { p0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object p0
  .line 344
    if-eqz p0, :L2
    iget v1, p0, Landroid/view/ViewGroup$LayoutParams;->height:I
    if-lez v1, :L2
    iget v0, p0, Landroid/view/ViewGroup$LayoutParams;->height:I
  :L2
    return v0
  :L3
  .line 340
    return v0
.end method

.method private lv()Landroid/widget/ListView;
  .registers 3
  .line 319
    iget-object v0, p0, Lcom/innioasis/ipp/Head$Ride;->lvRef:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  .line 320
    instance-of v1, v0, Landroid/widget/ListView;
    if-eqz v1, :L0
    check-cast v0, Landroid/widget/ListView;
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    return-object v0
.end method

.method private spv()Landroid/view/View;
  .registers 3
  .line 324
    iget-object v0, p0, Lcom/innioasis/ipp/Head$Ride;->spvRef:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  .line 325
    instance-of v1, v0, Landroid/view/View;
    if-eqz v1, :L0
    check-cast v0, Landroid/view/View;
    goto :L1
  :L0
    const/4 v0, 0
  :L1
    return-object v0
.end method

.method anchor(IIZ)V
  .registers 4
  .line 375
    iput p1, p0, Lcom/innioasis/ipp/Head$Ride;->pendPos:I
  .line 376
    iput p2, p0, Lcom/innioasis/ipp/Head$Ride;->pendY:I
  .line 377
    const/4 p1, 0
    iput p1, p0, Lcom/innioasis/ipp/Head$Ride;->pendAge:I
  .line 378
    iput-boolean p3, p0, Lcom/innioasis/ipp/Head$Ride;->pendFixed:Z
  .line 379
    invoke-direct { p0 }, Lcom/innioasis/ipp/Head$Ride;->lv()Landroid/widget/ListView;
    move-result-object p1
  .line 380
    const/4 p2, 0
    if-nez p1, :L0
    move-object p1, p2
    goto :L1
  :L0
    invoke-virtual { p1 }, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;
    move-result-object p1
  :L1
  .line 381
    if-nez p1, :L2
    goto :L3
  :L2
    new-instance p2, Ljava/lang/ref/WeakReference;
    invoke-direct { p2, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
  :L3
    iput-object p2, p0, Lcom/innioasis/ipp/Head$Ride;->pendAd:Ljava/lang/ref/WeakReference;
  .line 382
    return-void
.end method

.method applyPadding()Z
  .registers 8
  .line 405
    invoke-direct { p0 }, Lcom/innioasis/ipp/Head$Ride;->lv()Landroid/widget/ListView;
    move-result-object v0
  .line 406
    const/4 v1, 0
    if-nez v0, :L0
    return v1
  :L0
  .line 407
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Head$Ride;->wantPad()I
    move-result v2
  .line 408
    invoke-virtual { v0 }, Landroid/widget/ListView;->getPaddingTop()I
    move-result v3
  .line 409
    if-ne v3, v2, :L1
    return v1
  :L1
  .line 410
    invoke-virtual { v0 }, Landroid/widget/ListView;->getChildCount()I
    move-result v4
    if-lez v4, :L2
    invoke-virtual { v0, v1 }, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;
    move-result-object v4
    goto :L3
  :L2
    const/4 v4, 0
  :L3
  .line 411
    invoke-virtual { v0 }, Landroid/widget/ListView;->getFirstVisiblePosition()I
    move-result v5
  .line 412
    iget v6, p0, Lcom/innioasis/ipp/Head$Ride;->pendPos:I
    if-ltz v6, :L5
  .line 419
    iget-boolean v4, p0, Lcom/innioasis/ipp/Head$Ride;->pendFixed:Z
    if-nez v4, :L4
    iget v4, p0, Lcom/innioasis/ipp/Head$Ride;->pendY:I
    sub-int v3, v2, v3
    add-int/2addr v4, v3
    iput v4, p0, Lcom/innioasis/ipp/Head$Ride;->pendY:I
  :L4
  .line 420
    iput v1, p0, Lcom/innioasis/ipp/Head$Ride;->pendAge:I
    goto :L7
  :L5
  .line 421
    if-eqz v4, :L6
    if-ltz v5, :L6
  .line 422
    invoke-virtual { v4 }, Landroid/view/View;->getTop()I
    move-result v4
    add-int/2addr v4, v2
    sub-int/2addr v4, v3
    invoke-virtual { p0, v5, v4, v1 }, Lcom/innioasis/ipp/Head$Ride;->anchor(IIZ)V
    goto :L7
  :L6
  .line 430
    invoke-virtual { p0, v1, v2, v1 }, Lcom/innioasis/ipp/Head$Ride;->anchor(IIZ)V
  :L7
  .line 432
    invoke-virtual { v0 }, Landroid/widget/ListView;->getPaddingLeft()I
    move-result v1
    invoke-virtual { v0 }, Landroid/widget/ListView;->getPaddingRight()I
    move-result v3
    invoke-virtual { v0 }, Landroid/widget/ListView;->getPaddingBottom()I
    move-result v4
    invoke-virtual { v0, v1, v2, v3, v4 }, Landroid/widget/ListView;->setPadding(IIII)V
  .line 433
    const/4 v0, 1
    return v0
.end method

.method barHeight()I
  .registers 2
  .line 349
    invoke-direct { p0 }, Lcom/innioasis/ipp/Head$Ride;->bar()Landroid/view/View;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Head$Ride;->h(Landroid/view/View;)I
    move-result v0
    return v0
.end method

.method edge()I
  .registers 4
  .line 490
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Head$Ride;->barHeight()I
    move-result v0
  .line 491
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Head$Ride;->headerHeight()I
    move-result v1
    add-int/2addr v1, v0
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Head$Ride;->ridden()I
    move-result v2
    sub-int/2addr v1, v2
  .line 492
    if-ge v1, v0, :L0
    goto :L1
  :L0
    move v0, v1
  :L1
    return v0
.end method

.method flushAnchor()Z
  .registers 10
  .line 445
    invoke-direct { p0 }, Lcom/innioasis/ipp/Head$Ride;->lv()Landroid/widget/ListView;
    move-result-object v0
  .line 446
    const/4 v1, 0
    if-eqz v0, :L10
    iget v2, p0, Lcom/innioasis/ipp/Head$Ride;->pendPos:I
    if-gez v2, :L0
    goto :L10
  :L0
  .line 447
    invoke-virtual { v0 }, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;
    move-result-object v2
  .line 448
    if-nez v2, :L1
    const/4 v3, 0
    goto :L2
  :L1
    invoke-interface { v2 }, Landroid/widget/ListAdapter;->getCount()I
    move-result v3
  :L2
  .line 449
    const/4 v4, -1
    const/4 v5, 1
    if-nez v3, :L4
  .line 450
    iget v0, p0, Lcom/innioasis/ipp/Head$Ride;->pendAge:I
    add-int/2addr v0, v5
    iput v0, p0, Lcom/innioasis/ipp/Head$Ride;->pendAge:I
    const/16 v2, 120
    if-le v0, v2, :L3
    iput v4, p0, Lcom/innioasis/ipp/Head$Ride;->pendPos:I
  :L3
  .line 451
    return v1
  :L4
  .line 453
    iget v6, p0, Lcom/innioasis/ipp/Head$Ride;->pendPos:I
  .line 454
    iget v7, p0, Lcom/innioasis/ipp/Head$Ride;->pendY:I
  .line 455
    iput v4, p0, Lcom/innioasis/ipp/Head$Ride;->pendPos:I
  .line 467
    iget-object v4, p0, Lcom/innioasis/ipp/Head$Ride;->pendAd:Ljava/lang/ref/WeakReference;
    const/4 v8, 0
    if-nez v4, :L5
    move-object v4, v8
    goto :L6
  :L5
    invoke-virtual { v4 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v4
  :L6
  .line 468
    iput-object v8, p0, Lcom/innioasis/ipp/Head$Ride;->pendAd:Ljava/lang/ref/WeakReference;
  .line 469
    iget-boolean v8, p0, Lcom/innioasis/ipp/Head$Ride;->pendFixed:Z
    if-nez v8, :L7
    if-eqz v4, :L7
    if-eq v4, v2, :L7
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Head$Ride;->wantPad()I
    move-result v7
    goto :L8
  :L7
  .line 470
    move v1, v6
  :L8
    if-lt v1, v3, :L9
    add-int/lit8 v1, v3, -1
  :L9
  .line 471
    invoke-virtual { v0 }, Landroid/widget/ListView;->getPaddingTop()I
    move-result v2
    sub-int/2addr v7, v2
    invoke-virtual { v0, v1, v7 }, Landroid/widget/ListView;->setSelectionFromTop(II)V
  .line 472
    return v5
  :L10
  .line 446
    return v1
.end method

.method headerHeight()I
  .registers 2
  .line 347
    invoke-direct { p0 }, Lcom/innioasis/ipp/Head$Ride;->spv()Landroid/view/View;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Head$Ride;->h(Landroid/view/View;)I
    move-result v0
    return v0
.end method

.method public onPreDraw()Z
  .catchall { :L0 .. :L4 } :L5
  .registers 4
  :L0
  .line 501
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Head$Ride;->applyPadding()Z
    move-result v0
    const/4 v1, 0
    if-eqz v0, :L1
    return v1
  :L1
  .line 502
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Head$Ride;->flushAnchor()Z
    move-result v0
    if-eqz v0, :L2
    return v1
  :L2
  .line 503
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Head$Ride;->ridden()I
    move-result v0
    neg-int v0, v0
    int-to-float v0, v0
  .line 504
    invoke-direct { p0 }, Lcom/innioasis/ipp/Head$Ride;->spv()Landroid/view/View;
    move-result-object v1
  .line 505
    if-eqz v1, :L3
    invoke-virtual { v1 }, Landroid/view/View;->getTranslationY()F
    move-result v2
    cmpl-float v2, v2, v0
    if-eqz v2, :L3
    invoke-virtual { v1, v0 }, Landroid/view/View;->setTranslationY(F)V
  :L3
  .line 506
    invoke-direct { p0 }, Lcom/innioasis/ipp/Head$Ride;->bar()Landroid/view/View;
    move-result-object v1
  .line 507
    if-eqz v1, :L4
    invoke-virtual { v1 }, Landroid/view/View;->getTranslationY()F
    move-result v2
    cmpl-float v2, v2, v0
    if-eqz v2, :L4
  .line 508
    invoke-virtual { v1, v0 }, Landroid/view/View;->setTranslationY(F)V
  .line 513
    invoke-virtual { v1 }, Landroid/view/View;->invalidate()V
  :L4
  .line 517
    goto :L6
  :L5
  .line 515
    move-exception v0
  :L6
  .line 518
    const/4 v0, 1
    return v0
.end method

.method ridden()I
  .registers 5
  .line 477
    invoke-direct { p0 }, Lcom/innioasis/ipp/Head$Ride;->lv()Landroid/widget/ListView;
    move-result-object v0
  .line 478
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Head$Ride;->headerHeight()I
    move-result v1
  .line 479
    const/4 v2, 0
    if-eqz v0, :L7
    if-nez v1, :L0
    goto :L7
  :L0
  .line 480
    invoke-virtual { v0 }, Landroid/widget/ListView;->getFirstVisiblePosition()I
    move-result v3
    if-nez v3, :L6
    invoke-virtual { v0 }, Landroid/widget/ListView;->getChildCount()I
    move-result v3
    if-nez v3, :L1
    goto :L6
  :L1
  .line 481
    invoke-virtual { v0, v2 }, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;
    move-result-object v3
  .line 482
    if-nez v3, :L2
    return v1
  :L2
  .line 483
    invoke-virtual { v0 }, Landroid/widget/ListView;->getPaddingTop()I
    move-result v0
    invoke-virtual { v3 }, Landroid/view/View;->getTop()I
    move-result v3
    sub-int/2addr v0, v3
  .line 484
    if-gez v0, :L3
    return v2
  :L3
  .line 485
    if-le v0, v1, :L4
    goto :L5
  :L4
    move v1, v0
  :L5
    return v1
  :L6
  .line 480
    return v1
  :L7
  .line 479
    return v2
.end method

.method wantPad()I
  .registers 3
  .line 351
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Head$Ride;->headerHeight()I
    move-result v0
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Head$Ride;->barHeight()I
    move-result v1
    add-int/2addr v0, v1
    return v0
.end method
