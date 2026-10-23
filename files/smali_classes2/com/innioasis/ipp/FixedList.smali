.class public Lcom/innioasis/ipp/FixedList;
.super Landroid/widget/ListView;
.source "FixedList.java"

.field private final box:Lcom/innioasis/ipp/Fixed$Box;

.method public constructor <init>(Landroid/content/Context;)V
  .registers 2
  .line 11
    invoke-direct { p0, p1 }, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V
  .line 22
    new-instance p1, Lcom/innioasis/ipp/Fixed$Box;
    invoke-direct { p1, p0 }, Lcom/innioasis/ipp/Fixed$Box;-><init>(Landroid/view/ViewGroup;)V
    iput-object p1, p0, Lcom/innioasis/ipp/FixedList;->box:Lcom/innioasis/ipp/Fixed$Box;
  .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
  .registers 3
  .line 15
    invoke-direct { p0, p1, p2 }, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
  .line 22
    new-instance p1, Lcom/innioasis/ipp/Fixed$Box;
    invoke-direct { p1, p0 }, Lcom/innioasis/ipp/Fixed$Box;-><init>(Landroid/view/ViewGroup;)V
    iput-object p1, p0, Lcom/innioasis/ipp/FixedList;->box:Lcom/innioasis/ipp/Fixed$Box;
  .line 16
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
  .registers 4
  .line 19
    invoke-direct { p0, p1, p2, p3 }, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
  .line 22
    new-instance p1, Lcom/innioasis/ipp/Fixed$Box;
    invoke-direct { p1, p0 }, Lcom/innioasis/ipp/Fixed$Box;-><init>(Landroid/view/ViewGroup;)V
    iput-object p1, p0, Lcom/innioasis/ipp/FixedList;->box:Lcom/innioasis/ipp/Fixed$Box;
  .line 20
    return-void
.end method

.method protected onAttachedToWindow()V
  .registers 4
  .line 48
    invoke-super { p0 }, Landroid/widget/ListView;->onAttachedToWindow()V
  .line 49
    iget-object v0, p0, Lcom/innioasis/ipp/FixedList;->box:Lcom/innioasis/ipp/Fixed$Box;
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    iput-wide v1, v0, Lcom/innioasis/ipp/Fixed$Box;->attachedAt:J
  .line 50
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FixedList;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
    iget-object v1, p0, Lcom/innioasis/ipp/FixedList;->box:Lcom/innioasis/ipp/Fixed$Box;
    invoke-virtual { v0, v1 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  .line 51
    return-void
.end method

.method protected onDetachedFromWindow()V
  .registers 3
  .line 54
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FixedList;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
    iget-object v1, p0, Lcom/innioasis/ipp/FixedList;->box:Lcom/innioasis/ipp/Fixed$Box;
    invoke-virtual { v0, v1 }, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  .line 55
    invoke-super { p0 }, Landroid/widget/ListView;->onDetachedFromWindow()V
  .line 56
    return-void
.end method

.method protected onLayout(ZIIII)V
  .catchall { :L0 .. :L1 } :L2
  .registers 8
  .line 38
    iget-object v0, p0, Lcom/innioasis/ipp/FixedList;->box:Lcom/innioasis/ipp/Fixed$Box;
    const/4 v1, 1
    iput-boolean v1, v0, Lcom/innioasis/ipp/Fixed$Box;->laying:Z
  .line 40
    const/4 v0, 0
  :L0
    invoke-super/range { p0 .. p5 }, Landroid/widget/ListView;->onLayout(ZIIII)V
  :L1
  .line 42
    iget-object p1, p0, Lcom/innioasis/ipp/FixedList;->box:Lcom/innioasis/ipp/Fixed$Box;
    iput-boolean v0, p1, Lcom/innioasis/ipp/Fixed$Box;->laying:Z
  .line 43
    nop
  .line 44
    iget-object p1, p0, Lcom/innioasis/ipp/FixedList;->box:Lcom/innioasis/ipp/Fixed$Box;
    invoke-virtual { p1 }, Lcom/innioasis/ipp/Fixed$Box;->laid()V
  .line 45
    return-void
  :L2
  .line 42
    move-exception p1
    iget-object p2, p0, Lcom/innioasis/ipp/FixedList;->box:Lcom/innioasis/ipp/Fixed$Box;
    iput-boolean v0, p2, Lcom/innioasis/ipp/Fixed$Box;->laying:Z
  .line 43
    throw p1
.end method

.method protected onMeasure(II)V
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  .line 29
    iget-object v0, p0, Lcom/innioasis/ipp/FixedList;->box:Lcom/innioasis/ipp/Fixed$Box;
    const/4 v1, 1
    iput-boolean v1, v0, Lcom/innioasis/ipp/Fixed$Box;->laying:Z
  .line 31
    const/4 v0, 0
  :L0
    invoke-super { p0, p1, p2 }, Landroid/widget/ListView;->onMeasure(II)V
  :L1
  .line 33
    iget-object p1, p0, Lcom/innioasis/ipp/FixedList;->box:Lcom/innioasis/ipp/Fixed$Box;
    iput-boolean v0, p1, Lcom/innioasis/ipp/Fixed$Box;->laying:Z
  .line 34
    nop
  .line 35
    return-void
  :L2
  .line 33
    move-exception p1
    iget-object p2, p0, Lcom/innioasis/ipp/FixedList;->box:Lcom/innioasis/ipp/Fixed$Box;
    iput-boolean v0, p2, Lcom/innioasis/ipp/Fixed$Box;->laying:Z
  .line 34
    throw p1
.end method

.method public requestLayout()V
  .registers 2
  .line 25
    iget-object v0, p0, Lcom/innioasis/ipp/FixedList;->box:Lcom/innioasis/ipp/Fixed$Box;
    if-eqz v0, :L0
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Fixed$Box;->take()Z
    move-result v0
    if-nez v0, :L1
  :L0
    invoke-super { p0 }, Landroid/widget/ListView;->requestLayout()V
  :L1
  .line 26
    return-void
.end method
