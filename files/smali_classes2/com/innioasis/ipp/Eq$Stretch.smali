.class final Lcom/innioasis/ipp/Eq$Stretch;
.super Ljava/lang/Object;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;
.source "Eq.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Eq;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Stretch"
.end annotation

.field private final rv:Landroidx/recyclerview/widget/RecyclerView;

.method constructor <init>(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 2
  .line 463
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 464
    iput-object p1, p0, Lcom/innioasis/ipp/Eq$Stretch;->rv:Landroidx/recyclerview/widget/RecyclerView;
  .line 465
    return-void
.end method

.method public onPreDraw()Z
  .catchall { :L0 .. :L9 } :L13
  .registers 12
  .line 469
    const/4 v0, 1
  :L0
    iget-object v1, p0, Lcom/innioasis/ipp/Eq$Stretch;->rv:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v1 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v1
  .line 470
    const/4 v2, 0
    if-nez v1, :L1
    const/4 v1, 0
    goto :L2
  :L1
    invoke-virtual { v1 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I
    move-result v1
  :L2
  .line 471
    iget-object v3, p0, Lcom/innioasis/ipp/Eq$Stretch;->rv:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v3 }, Landroidx/recyclerview/widget/RecyclerView;->getHeight()I
    move-result v3
  .line 472
    iget-object v4, p0, Lcom/innioasis/ipp/Eq$Stretch;->rv:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v4 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v4
  .line 473
    if-lez v1, :L12
    if-lez v3, :L12
    if-gtz v4, :L3
    goto :L12
  :L3
  .line 474
    div-int v5, v3, v1
  .line 475
    mul-int v1, v1, v5
    sub-int/2addr v3, v1
  .line 476
    nop
  .line 477
    const/4 v1, 0
    const/4 v6, 0
  :L4
    if-ge v1, v4, :L11
  .line 478
    iget-object v7, p0, Lcom/innioasis/ipp/Eq$Stretch;->rv:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v7, v1 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v7
  .line 479
    iget-object v8, p0, Lcom/innioasis/ipp/Eq$Stretch;->rv:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v8, v7 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I
    move-result v8
  .line 480
    if-gez v8, :L5
    goto :L10
  :L5
  .line 481
    if-ge v8, v3, :L6
    const/4 v8, 1
    goto :L7
  :L6
    const/4 v8, 0
  :L7
    add-int/2addr v8, v5
  .line 482
    invoke-virtual { v7 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    move-result-object v9
  .line 483
    if-eqz v9, :L10
    iget v10, v9, Landroid/view/ViewGroup$LayoutParams;->height:I
    if-ne v10, v8, :L8
    goto :L10
  :L8
  .line 484
    iput v8, v9, Landroid/view/ViewGroup$LayoutParams;->height:I
  .line 485
    invoke-virtual { v7, v9 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
  :L9
  .line 486
    const/4 v6, 1
  :L10
  .line 477
    add-int/lit8 v1, v1, 1
    goto :L4
  :L11
  .line 488
    xor-int/2addr v0, v6
    return v0
  :L12
  .line 473
    return v0
  :L13
  .line 489
    move-exception v1
  .line 490
    return v0
.end method
