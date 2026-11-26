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
  .line 429
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 430
    iput-object p1, p0, Lcom/innioasis/ipp/Wheel$Settle;->rv:Landroidx/recyclerview/widget/RecyclerView;
  .line 431
    iput p2, p0, Lcom/innioasis/ipp/Wheel$Settle;->pos:I
  .line 432
    iput p3, p0, Lcom/innioasis/ipp/Wheel$Settle;->bottom:I
  .line 433
    return-void
.end method

.method static at(Landroidx/recyclerview/widget/RecyclerView;II)V
  .registers 4
  .line 436
    new-instance v0, Lcom/innioasis/ipp/Wheel$Settle;
    invoke-direct { v0, p0, p1, p2 }, Lcom/innioasis/ipp/Wheel$Settle;-><init>(Landroidx/recyclerview/widget/RecyclerView;II)V
  .line 437
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->isLayoutRequested()Z
    move-result p1
    if-nez p1, :L0
    invoke-direct { v0 }, Lcom/innioasis/ipp/Wheel$Settle;->fix()Z
    move-result p1
    if-eqz p1, :L0
    return-void
  :L0
  .line 438
    invoke-virtual { p0 }, Landroidx/recyclerview/widget/RecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object p0
    invoke-virtual { p0, v0 }, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  .line 439
    return-void
.end method

.method private fix()Z
  .registers 4
  .line 443
    iget-object v0, p0, Lcom/innioasis/ipp/Wheel$Settle;->rv:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v0
  .line 444
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    iget v1, p0, Lcom/innioasis/ipp/Wheel$Settle;->pos:I
    invoke-virtual { v0, v1 }, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object v0
  :L1
  .line 445
    const/4 v1, 0
    if-nez v0, :L2
    return v1
  :L2
  .line 446
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Wheel;->access$600(Landroid/view/View;Z)I
    move-result v0
    iget v2, p0, Lcom/innioasis/ipp/Wheel$Settle;->bottom:I
    sub-int/2addr v0, v2
  .line 447
    if-eqz v0, :L3
    iget-object v2, p0, Lcom/innioasis/ipp/Wheel$Settle;->rv:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v2, v1, v0 }, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V
  :L3
  .line 448
    const/4 v0, 1
    return v0
.end method

.method public onPreDraw()Z
  .catchall { :L0 .. :L1 } :L2
  .registers 2
  :L0
  .line 453
    iget-object v0, p0, Lcom/innioasis/ipp/Wheel$Settle;->rv:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
    invoke-virtual { v0, p0 }, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  .line 454
    invoke-direct { p0 }, Lcom/innioasis/ipp/Wheel$Settle;->fix()Z
  :L1
  .line 456
    goto :L3
  :L2
  .line 455
    move-exception v0
  :L3
  .line 457
    const/4 v0, 1
    return v0
.end method
