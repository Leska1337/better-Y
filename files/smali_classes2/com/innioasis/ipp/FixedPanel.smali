.class public Lcom/innioasis/ipp/FixedPanel;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "FixedPanel.java"

.field private final box:Lcom/innioasis/ipp/Fixed$Box;

.method public constructor <init>(Landroid/content/Context;)V
  .registers 3
  .line 17
    invoke-direct { p0, p1 }, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V
  .line 28
    new-instance p1, Lcom/innioasis/ipp/Fixed$Box;
    const/4 v0, 0
    invoke-direct { p1, p0, v0 }, Lcom/innioasis/ipp/Fixed$Box;-><init>(Landroid/view/ViewGroup;Z)V
    iput-object p1, p0, Lcom/innioasis/ipp/FixedPanel;->box:Lcom/innioasis/ipp/Fixed$Box;
  .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
  .registers 3
  .line 21
    invoke-direct { p0, p1, p2 }, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
  .line 28
    new-instance p1, Lcom/innioasis/ipp/Fixed$Box;
    const/4 p2, 0
    invoke-direct { p1, p0, p2 }, Lcom/innioasis/ipp/Fixed$Box;-><init>(Landroid/view/ViewGroup;Z)V
    iput-object p1, p0, Lcom/innioasis/ipp/FixedPanel;->box:Lcom/innioasis/ipp/Fixed$Box;
  .line 22
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
  .registers 4
  .line 25
    invoke-direct { p0, p1, p2, p3 }, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
  .line 28
    new-instance p1, Lcom/innioasis/ipp/Fixed$Box;
    const/4 p2, 0
    invoke-direct { p1, p0, p2 }, Lcom/innioasis/ipp/Fixed$Box;-><init>(Landroid/view/ViewGroup;Z)V
    iput-object p1, p0, Lcom/innioasis/ipp/FixedPanel;->box:Lcom/innioasis/ipp/Fixed$Box;
  .line 26
    return-void
.end method

.method protected onAttachedToWindow()V
  .registers 4
  .line 55
    invoke-super { p0 }, Landroidx/constraintlayout/widget/ConstraintLayout;->onAttachedToWindow()V
  .line 56
    iget-object v0, p0, Lcom/innioasis/ipp/FixedPanel;->box:Lcom/innioasis/ipp/Fixed$Box;
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    iput-wide v1, v0, Lcom/innioasis/ipp/Fixed$Box;->attachedAt:J
  .line 57
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FixedPanel;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
    iget-object v1, p0, Lcom/innioasis/ipp/FixedPanel;->box:Lcom/innioasis/ipp/Fixed$Box;
    invoke-virtual { v0, v1 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  .line 58
    return-void
.end method

.method protected onDetachedFromWindow()V
  .registers 3
  .line 61
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FixedPanel;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
    iget-object v1, p0, Lcom/innioasis/ipp/FixedPanel;->box:Lcom/innioasis/ipp/Fixed$Box;
    invoke-virtual { v0, v1 }, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  .line 62
    invoke-super { p0 }, Landroidx/constraintlayout/widget/ConstraintLayout;->onDetachedFromWindow()V
  .line 63
    return-void
.end method

.method protected onLayout(ZIIII)V
  .catchall { :L0 .. :L1 } :L2
  .registers 8
  .line 45
    iget-object v0, p0, Lcom/innioasis/ipp/FixedPanel;->box:Lcom/innioasis/ipp/Fixed$Box;
    const/4 v1, 1
    iput-boolean v1, v0, Lcom/innioasis/ipp/Fixed$Box;->laying:Z
  .line 47
    const/4 v0, 0
  :L0
    invoke-super/range { p0 .. p5 }, Landroidx/constraintlayout/widget/ConstraintLayout;->onLayout(ZIIII)V
  :L1
  .line 49
    iget-object p1, p0, Lcom/innioasis/ipp/FixedPanel;->box:Lcom/innioasis/ipp/Fixed$Box;
    iput-boolean v0, p1, Lcom/innioasis/ipp/Fixed$Box;->laying:Z
  .line 50
    nop
  .line 51
    iget-object p1, p0, Lcom/innioasis/ipp/FixedPanel;->box:Lcom/innioasis/ipp/Fixed$Box;
    invoke-virtual { p1 }, Lcom/innioasis/ipp/Fixed$Box;->laid()V
  .line 52
    return-void
  :L2
  .line 49
    move-exception p1
    iget-object p2, p0, Lcom/innioasis/ipp/FixedPanel;->box:Lcom/innioasis/ipp/Fixed$Box;
    iput-boolean v0, p2, Lcom/innioasis/ipp/Fixed$Box;->laying:Z
  .line 50
    throw p1
.end method

.method protected onMeasure(II)V
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  .line 36
    iget-object v0, p0, Lcom/innioasis/ipp/FixedPanel;->box:Lcom/innioasis/ipp/Fixed$Box;
    const/4 v1, 1
    iput-boolean v1, v0, Lcom/innioasis/ipp/Fixed$Box;->laying:Z
  .line 38
    const/4 v0, 0
  :L0
    invoke-super { p0, p1, p2 }, Landroidx/constraintlayout/widget/ConstraintLayout;->onMeasure(II)V
  :L1
  .line 40
    iget-object p1, p0, Lcom/innioasis/ipp/FixedPanel;->box:Lcom/innioasis/ipp/Fixed$Box;
    iput-boolean v0, p1, Lcom/innioasis/ipp/Fixed$Box;->laying:Z
  .line 41
    nop
  .line 42
    return-void
  :L2
  .line 40
    move-exception p1
    iget-object p2, p0, Lcom/innioasis/ipp/FixedPanel;->box:Lcom/innioasis/ipp/Fixed$Box;
    iput-boolean v0, p2, Lcom/innioasis/ipp/Fixed$Box;->laying:Z
  .line 41
    throw p1
.end method

.method public requestLayout()V
  .registers 2
  .line 32
    iget-object v0, p0, Lcom/innioasis/ipp/FixedPanel;->box:Lcom/innioasis/ipp/Fixed$Box;
    if-eqz v0, :L0
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Fixed$Box;->take()Z
    move-result v0
    if-nez v0, :L1
  :L0
    invoke-super { p0 }, Landroidx/constraintlayout/widget/ConstraintLayout;->requestLayout()V
  :L1
  .line 33
    return-void
.end method
