.class public Lcom/innioasis/ipp/Fixed;
.super Landroidx/recyclerview/widget/RecyclerView;
.source "Fixed.java"

.annotation system Ldalvik/annotation/MemberClasses;
  value = {
    Lcom/innioasis/ipp/Fixed$Box;
  }
.end annotation

.field private final box:Lcom/innioasis/ipp/Fixed$Box;

.method public constructor <init>(Landroid/content/Context;)V
  .registers 3
  .line 21
    invoke-direct { p0, p1 }, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;)V
  .line 32
    new-instance p1, Lcom/innioasis/ipp/Fixed$Box;
    const/4 v0, 1
    invoke-direct { p1, p0, v0 }, Lcom/innioasis/ipp/Fixed$Box;-><init>(Landroid/view/ViewGroup;Z)V
    iput-object p1, p0, Lcom/innioasis/ipp/Fixed;->box:Lcom/innioasis/ipp/Fixed$Box;
  .line 22
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
  .registers 3
  .line 25
    invoke-direct { p0, p1, p2 }, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
  .line 32
    new-instance p1, Lcom/innioasis/ipp/Fixed$Box;
    const/4 p2, 1
    invoke-direct { p1, p0, p2 }, Lcom/innioasis/ipp/Fixed$Box;-><init>(Landroid/view/ViewGroup;Z)V
    iput-object p1, p0, Lcom/innioasis/ipp/Fixed;->box:Lcom/innioasis/ipp/Fixed$Box;
  .line 26
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
  .registers 4
  .line 29
    invoke-direct { p0, p1, p2, p3 }, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
  .line 32
    new-instance p1, Lcom/innioasis/ipp/Fixed$Box;
    const/4 p2, 1
    invoke-direct { p1, p0, p2 }, Lcom/innioasis/ipp/Fixed$Box;-><init>(Landroid/view/ViewGroup;Z)V
    iput-object p1, p0, Lcom/innioasis/ipp/Fixed;->box:Lcom/innioasis/ipp/Fixed$Box;
  .line 30
    return-void
.end method

.method public static layNow(Landroid/view/View;)V
  .registers 2
  .line 40
    instance-of v0, p0, Lcom/innioasis/ipp/Fixed;
    if-eqz v0, :L0
    check-cast p0, Lcom/innioasis/ipp/Fixed;
    iget-object p0, p0, Lcom/innioasis/ipp/Fixed;->box:Lcom/innioasis/ipp/Fixed$Box;
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Fixed$Box;->now()V
  :L0
  .line 41
    return-void
.end method

.method protected onAttachedToWindow()V
  .registers 4
  .line 68
    invoke-super { p0 }, Landroidx/recyclerview/widget/RecyclerView;->onAttachedToWindow()V
  .line 69
    iget-object v0, p0, Lcom/innioasis/ipp/Fixed;->box:Lcom/innioasis/ipp/Fixed$Box;
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    iput-wide v1, v0, Lcom/innioasis/ipp/Fixed$Box;->attachedAt:J
  .line 70
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Fixed;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
    iget-object v1, p0, Lcom/innioasis/ipp/Fixed;->box:Lcom/innioasis/ipp/Fixed$Box;
    invoke-virtual { v0, v1 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  .line 71
    return-void
.end method

.method protected onDetachedFromWindow()V
  .registers 3
  .line 74
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Fixed;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
    iget-object v1, p0, Lcom/innioasis/ipp/Fixed;->box:Lcom/innioasis/ipp/Fixed$Box;
    invoke-virtual { v0, v1 }, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  .line 75
    invoke-super { p0 }, Landroidx/recyclerview/widget/RecyclerView;->onDetachedFromWindow()V
  .line 76
    return-void
.end method

.method protected onLayout(ZIIII)V
  .catchall { :L0 .. :L1 } :L2
  .registers 8
  .line 58
    iget-object v0, p0, Lcom/innioasis/ipp/Fixed;->box:Lcom/innioasis/ipp/Fixed$Box;
    const/4 v1, 1
    iput-boolean v1, v0, Lcom/innioasis/ipp/Fixed$Box;->laying:Z
  .line 60
    const/4 v0, 0
  :L0
    invoke-super/range { p0 .. p5 }, Landroidx/recyclerview/widget/RecyclerView;->onLayout(ZIIII)V
  :L1
  .line 62
    iget-object p1, p0, Lcom/innioasis/ipp/Fixed;->box:Lcom/innioasis/ipp/Fixed$Box;
    iput-boolean v0, p1, Lcom/innioasis/ipp/Fixed$Box;->laying:Z
  .line 63
    nop
  .line 64
    iget-object p1, p0, Lcom/innioasis/ipp/Fixed;->box:Lcom/innioasis/ipp/Fixed$Box;
    invoke-virtual { p1 }, Lcom/innioasis/ipp/Fixed$Box;->laid()V
  .line 65
    return-void
  :L2
  .line 62
    move-exception p1
    iget-object p2, p0, Lcom/innioasis/ipp/Fixed;->box:Lcom/innioasis/ipp/Fixed$Box;
    iput-boolean v0, p2, Lcom/innioasis/ipp/Fixed$Box;->laying:Z
  .line 63
    throw p1
.end method

.method protected onMeasure(II)V
  .catchall { :L0 .. :L1 } :L2
  .registers 5
  .line 49
    iget-object v0, p0, Lcom/innioasis/ipp/Fixed;->box:Lcom/innioasis/ipp/Fixed$Box;
    const/4 v1, 1
    iput-boolean v1, v0, Lcom/innioasis/ipp/Fixed$Box;->laying:Z
  .line 51
    const/4 v0, 0
  :L0
    invoke-super { p0, p1, p2 }, Landroidx/recyclerview/widget/RecyclerView;->onMeasure(II)V
  :L1
  .line 53
    iget-object p1, p0, Lcom/innioasis/ipp/Fixed;->box:Lcom/innioasis/ipp/Fixed$Box;
    iput-boolean v0, p1, Lcom/innioasis/ipp/Fixed$Box;->laying:Z
  .line 54
    nop
  .line 55
    return-void
  :L2
  .line 53
    move-exception p1
    iget-object p2, p0, Lcom/innioasis/ipp/Fixed;->box:Lcom/innioasis/ipp/Fixed$Box;
    iput-boolean v0, p2, Lcom/innioasis/ipp/Fixed$Box;->laying:Z
  .line 54
    throw p1
.end method

.method public requestLayout()V
  .registers 2
  .line 45
    iget-object v0, p0, Lcom/innioasis/ipp/Fixed;->box:Lcom/innioasis/ipp/Fixed$Box;
    if-eqz v0, :L0
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Fixed$Box;->take()Z
    move-result v0
    if-nez v0, :L1
  :L0
    invoke-super { p0 }, Landroidx/recyclerview/widget/RecyclerView;->requestLayout()V
  :L1
  .line 46
    return-void
.end method
