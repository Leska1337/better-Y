.class final Lcom/innioasis/ipp/Follow$Land;
.super Ljava/lang/Object;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;
.source "Follow.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Follow;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Land"
.end annotation

.field private final a:Lcom/innioasis/music/adapter/MyBaseAdapter;

.field private final lv:Landroid/widget/ListView;

.field private passes:I

.field private final pos:I

.field private settled:I

.field private snaps:I

.field private final until:J

.method constructor <init>(Lcom/innioasis/music/adapter/MyBaseAdapter;Landroid/widget/ListView;I)V
  .registers 8
  .line 437
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 432
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    const-wide/16 v2, 2000
    add-long/2addr v0, v2
    iput-wide v0, p0, Lcom/innioasis/ipp/Follow$Land;->until:J
  .line 438
    iput-object p1, p0, Lcom/innioasis/ipp/Follow$Land;->a:Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 439
    iput-object p2, p0, Lcom/innioasis/ipp/Follow$Land;->lv:Landroid/widget/ListView;
  .line 440
    iput p3, p0, Lcom/innioasis/ipp/Follow$Land;->pos:I
  .line 441
    return-void
.end method

.method private done()Z
  .registers 2
  .line 490
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Follow$Land;->drop()V
  .line 491
    invoke-static { }, Lcom/innioasis/ipp/Follow;->access$200()Lcom/innioasis/ipp/Follow$Land;
    move-result-object v0
    if-ne v0, p0, :L0
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Follow;->access$202(Lcom/innioasis/ipp/Follow$Land;)Lcom/innioasis/ipp/Follow$Land;
  :L0
  .line 492
    const/4 v0, 1
    return v0
.end method

.method private restIfNoNeed(Landroid/view/View;II)Z
  .registers 7
  .line 467
    iget v0, p0, Lcom/innioasis/ipp/Follow$Land;->snaps:I
    const/4 v1, 2
    const/4 v2, 0
    if-lt v0, v1, :L0
    return v2
  :L0
  .line 468
    iget-object v0, p0, Lcom/innioasis/ipp/Follow$Land;->lv:Landroid/widget/ListView;
    invoke-virtual { v0 }, Landroid/widget/ListView;->getFirstVisiblePosition()I
    move-result v0
    if-nez v0, :L5
    iget-object v0, p0, Lcom/innioasis/ipp/Follow$Land;->lv:Landroid/widget/ListView;
    invoke-virtual { v0 }, Landroid/widget/ListView;->getChildCount()I
    move-result v0
    if-nez v0, :L1
    goto :L5
  :L1
  .line 469
    iget-object v0, p0, Lcom/innioasis/ipp/Follow$Land;->lv:Landroid/widget/ListView;
    invoke-virtual { v0, v2 }, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;
    move-result-object v0
  .line 470
    if-nez v0, :L2
    return v2
  :L2
  .line 471
    iget-object v1, p0, Lcom/innioasis/ipp/Follow$Land;->lv:Landroid/widget/ListView;
    invoke-virtual { v1 }, Landroid/widget/ListView;->getPaddingTop()I
    move-result v1
    invoke-virtual { v0 }, Landroid/view/View;->getTop()I
    move-result v0
    sub-int/2addr v1, v0
  .line 472
    if-gtz v1, :L3
    return v2
  :L3
  .line 473
    invoke-virtual { p1 }, Landroid/view/View;->getTop()I
    move-result p1
    add-int/2addr p1, v1
    sub-int/2addr p2, p3
    if-le p1, p2, :L4
    return v2
  :L4
  .line 474
    iget p1, p0, Lcom/innioasis/ipp/Follow$Land;->snaps:I
    const/4 p2, 1
    add-int/2addr p1, p2
    iput p1, p0, Lcom/innioasis/ipp/Follow$Land;->snaps:I
  .line 475
    iget-object p1, p0, Lcom/innioasis/ipp/Follow$Land;->lv:Landroid/widget/ListView;
    invoke-static { p1 }, Lcom/innioasis/ipp/Head;->rest(Landroid/widget/ListView;)V
  .line 476
    iput v2, p0, Lcom/innioasis/ipp/Follow$Land;->settled:I
  .line 477
    return p2
  :L5
  .line 468
    return v2
.end method

.method drop()V
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  :L0
  .line 483
    iget-object v0, p0, Lcom/innioasis/ipp/Follow$Land;->lv:Landroid/widget/ListView;
    invoke-virtual { v0 }, Landroid/widget/ListView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
    invoke-virtual { v0, p0 }, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  :L1
  .line 486
    goto :L3
  :L2
  .line 484
    move-exception v0
  :L3
  .line 487
    return-void
.end method

.method public onPreDraw()Z
  .catchall { :L0 .. :L17 } :L18
  .registers 9
  :L0
  .line 501
    iget-object v0, p0, Lcom/innioasis/ipp/Follow$Land;->lv:Landroid/widget/ListView;
    invoke-virtual { v0 }, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;
    move-result-object v0
  .line 502
    if-eqz v0, :L1
    iget-object v1, p0, Lcom/innioasis/ipp/Follow$Land;->a:Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-eq v0, v1, :L1
    invoke-direct { p0 }, Lcom/innioasis/ipp/Follow$Land;->done()Z
    move-result v0
    return v0
  :L1
  .line 504
    iget-object v0, p0, Lcom/innioasis/ipp/Follow$Land;->lv:Landroid/widget/ListView;
    invoke-static { v0 }, Lcom/innioasis/ipp/Head;->top(Landroid/widget/ListView;)I
    move-result v0
  .line 505
    iget-object v1, p0, Lcom/innioasis/ipp/Follow$Land;->lv:Landroid/widget/ListView;
    invoke-virtual { v1 }, Landroid/widget/ListView;->getHeight()I
    move-result v1
    iget-object v2, p0, Lcom/innioasis/ipp/Follow$Land;->lv:Landroid/widget/ListView;
    invoke-virtual { v2 }, Landroid/widget/ListView;->getPaddingBottom()I
    move-result v2
    sub-int/2addr v1, v2
  .line 506
    iget v2, p0, Lcom/innioasis/ipp/Follow$Land;->passes:I
    const/4 v3, 1
    add-int/2addr v2, v3
    iput v2, p0, Lcom/innioasis/ipp/Follow$Land;->passes:I
    const/16 v4, 12
    if-gt v2, v4, :L16
  .line 507
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
    iget-wide v6, p0, Lcom/innioasis/ipp/Follow$Land;->until:J
    cmp-long v2, v4, v6
    if-lez v2, :L2
    goto/16 :L16
  :L2
  .line 508
    if-gt v1, v0, :L3
    return v3
  :L3
  .line 510
    iget-object v2, p0, Lcom/innioasis/ipp/Follow$Land;->lv:Landroid/widget/ListView;
    iget v4, p0, Lcom/innioasis/ipp/Follow$Land;->pos:I
    invoke-virtual { v2 }, Landroid/widget/ListView;->getFirstVisiblePosition()I
    move-result v5
    sub-int/2addr v4, v5
    invoke-virtual { v2, v4 }, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;
    move-result-object v2
  .line 511
    const/4 v4, 0
    if-eqz v2, :L9
  .line 512
    invoke-virtual { v2 }, Landroid/view/View;->getHeight()I
    move-result v5
  .line 513
    sub-int v6, v1, v0
    if-le v5, v6, :L4
    invoke-direct { p0 }, Lcom/innioasis/ipp/Follow$Land;->done()Z
    move-result v0
    return v0
  :L4
  .line 514
    invoke-direct { p0, v2, v1, v5 }, Lcom/innioasis/ipp/Follow$Land;->restIfNoNeed(Landroid/view/View;II)Z
    move-result v6
    if-eqz v6, :L5
    return v4
  :L5
  .line 515
    invoke-virtual { v2 }, Landroid/view/View;->getBottom()I
    move-result v6
    if-le v6, v1, :L6
  .line 516
    iget-object v0, p0, Lcom/innioasis/ipp/Follow$Land;->lv:Landroid/widget/ListView;
    iget v2, p0, Lcom/innioasis/ipp/Follow$Land;->pos:I
    sub-int/2addr v1, v5
    invoke-static { v0, v2, v1 }, Lcom/innioasis/ipp/Head;->place(Landroid/widget/ListView;II)V
  .line 517
    iput v4, p0, Lcom/innioasis/ipp/Follow$Land;->settled:I
  .line 518
    return v4
  :L6
  .line 520
    invoke-virtual { v2 }, Landroid/view/View;->getTop()I
    move-result v1
    if-ge v1, v0, :L7
  .line 521
    iget-object v1, p0, Lcom/innioasis/ipp/Follow$Land;->lv:Landroid/widget/ListView;
    iget v2, p0, Lcom/innioasis/ipp/Follow$Land;->pos:I
    invoke-static { v1, v2, v0 }, Lcom/innioasis/ipp/Head;->place(Landroid/widget/ListView;II)V
  .line 522
    iput v4, p0, Lcom/innioasis/ipp/Follow$Land;->settled:I
  .line 523
    return v4
  :L7
  .line 527
    iget v0, p0, Lcom/innioasis/ipp/Follow$Land;->settled:I
    add-int/2addr v0, v3
    iput v0, p0, Lcom/innioasis/ipp/Follow$Land;->settled:I
    const/4 v1, 3
    if-lt v0, v1, :L8
    invoke-direct { p0 }, Lcom/innioasis/ipp/Follow$Land;->done()Z
    move-result v0
    return v0
  :L8
  .line 528
    return v3
  :L9
  .line 534
    nop
  .line 535
    const/4 v2, 0
    const/4 v3, 0
  :L10
    iget-object v5, p0, Lcom/innioasis/ipp/Follow$Land;->lv:Landroid/widget/ListView;
    invoke-virtual { v5 }, Landroid/widget/ListView;->getChildCount()I
    move-result v5
    if-ge v2, v5, :L12
  .line 536
    iget-object v5, p0, Lcom/innioasis/ipp/Follow$Land;->lv:Landroid/widget/ListView;
    invoke-virtual { v5, v2 }, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;
    move-result-object v5
  .line 537
    if-eqz v5, :L11
    invoke-virtual { v5 }, Landroid/view/View;->getHeight()I
    move-result v6
    if-le v6, v3, :L11
    invoke-virtual { v5 }, Landroid/view/View;->getHeight()I
    move-result v3
  :L11
  .line 535
    add-int/lit8 v2, v2, 1
    goto :L10
  :L12
  .line 539
    if-gtz v3, :L13
    invoke-direct { p0 }, Lcom/innioasis/ipp/Follow$Land;->done()Z
    move-result v0
    return v0
  :L13
  .line 540
    sub-int/2addr v1, v3
  .line 541
    if-ge v1, v0, :L14
    goto :L15
  :L14
    move v0, v1
  :L15
  .line 542
    iget-object v1, p0, Lcom/innioasis/ipp/Follow$Land;->lv:Landroid/widget/ListView;
    iget v2, p0, Lcom/innioasis/ipp/Follow$Land;->pos:I
    invoke-static { v1, v2, v0 }, Lcom/innioasis/ipp/Head;->place(Landroid/widget/ListView;II)V
  .line 543
    iput v4, p0, Lcom/innioasis/ipp/Follow$Land;->settled:I
  .line 544
    return v4
  :L16
  .line 507
    invoke-direct { p0 }, Lcom/innioasis/ipp/Follow$Land;->done()Z
    move-result v0
  :L17
    return v0
  :L18
  .line 545
    move-exception v0
  .line 546
    invoke-direct { p0 }, Lcom/innioasis/ipp/Follow$Land;->done()Z
    move-result v0
    return v0
.end method
