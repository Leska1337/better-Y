.class final Lcom/innioasis/ipp/Wheel$Settle;
.super Ljava/lang/Object;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;
.source "Wheel.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Wheel;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Settle"
.end annotation

.field private final bottom:I

.field private final pos:I

.field private final rv:Landroidx/recyclerview/widget/RecyclerView;

.method private constructor <init>(Landroidx/recyclerview/widget/RecyclerView;II)V
  .registers 4
  .line 478
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 479
    iput-object p1, p0, Lcom/innioasis/ipp/Wheel$Settle;->rv:Landroidx/recyclerview/widget/RecyclerView;
  .line 480
    iput p2, p0, Lcom/innioasis/ipp/Wheel$Settle;->pos:I
  .line 481
    iput p3, p0, Lcom/innioasis/ipp/Wheel$Settle;->bottom:I
  .line 482
    return-void
.end method

.method static at(Landroidx/recyclerview/widget/RecyclerView;II)V
  .registers 4
  .line 485
    new-instance v0, Lcom/innioasis/ipp/Wheel$Settle;
    invoke-direct { v0, p0, p1, p2 }, Lcom/innioasis/ipp/Wheel$Settle;-><init>(Landroidx/recyclerview/widget/RecyclerView;II)V
  .line 486
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->isLayoutRequested()Z
    move-result p1
    if-nez p1, :L0
    invoke-direct { v0 }, Lcom/innioasis/ipp/Wheel$Settle;->fix()Z
    move-result p1
    if-eqz p1, :L0
    return-void
  :L0
  .line 487
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object p0
    invoke-virtual { p0, v0 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  .line 488
    return-void
.end method

.method private fix()Z
  .registers 4
  .line 492
    iget-object v0, p0, Lcom/innioasis/ipp/Wheel$Settle;->rv:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v0
  .line 493
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    iget v1, p0, Lcom/innioasis/ipp/Wheel$Settle;->pos:I
    invoke-virtual { v0, v1 }, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object v0
  :L1
  .line 494
    const/4 v1, 0
    if-nez v0, :L2
    return v1
  :L2
  .line 495
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Wheel;->access$700(Landroid/view/View;Z)I
    move-result v0
    iget v2, p0, Lcom/innioasis/ipp/Wheel$Settle;->bottom:I
    sub-int/2addr v0, v2
  .line 496
    if-eqz v0, :L3
    iget-object v2, p0, Lcom/innioasis/ipp/Wheel$Settle;->rv:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v2, v1, v0 }, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V
  :L3
  .line 497
    const/4 v0, 1
    return v0
.end method

.method public onPreDraw()Z
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  :L0
  .line 502
    iget-object v0, p0, Lcom/innioasis/ipp/Wheel$Settle;->rv:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
    invoke-virtual { v0, p0 }, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  .line 503
    invoke-direct { p0 }, Lcom/innioasis/ipp/Wheel$Settle;->fix()Z
  :L1
  .line 505
    goto :L3
  :L2
  .line 504
    move-exception v0
  :L3
  .line 506
    const/4 v0, 1
    return v0
.end method
