.class final Lcom/innioasis/ipp/Blue$Touch;
.super Landroidx/recyclerview/widget/RecyclerView$AdapterDataObserver;
.source "Blue.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Blue;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Touch"
.end annotation

.field private final ad:Landroidx/recyclerview/widget/RecyclerView$Adapter;

.field private final rule:Landroid/view/View;

.method constructor <init>(Landroidx/recyclerview/widget/RecyclerView$Adapter;Landroid/view/View;)V
  .registers 3
  .line 243
    invoke-direct { p0 }, Landroidx/recyclerview/widget/RecyclerView$AdapterDataObserver;-><init>()V
  .line 244
    iput-object p1, p0, Lcom/innioasis/ipp/Blue$Touch;->ad:Landroidx/recyclerview/widget/RecyclerView$Adapter;
  .line 245
    iput-object p2, p0, Lcom/innioasis/ipp/Blue$Touch;->rule:Landroid/view/View;
  .line 246
    return-void
.end method

.method public onChanged()V
  .registers 3
  .line 250
    iget-object v0, p0, Lcom/innioasis/ipp/Blue$Touch;->rule:Landroid/view/View;
    iget-object v1, p0, Lcom/innioasis/ipp/Blue$Touch;->ad:Landroidx/recyclerview/widget/RecyclerView$Adapter;
    invoke-virtual { v1 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I
    move-result v1
    if-lez v1, :L0
    const/4 v1, 0
    goto :L1
  :L0
    const/16 v1, 8
  :L1
    invoke-virtual { v0, v1 }, Landroid/view/View;->setVisibility(I)V
  .line 251
    return-void
.end method

.method public onItemRangeInserted(II)V
  .registers 3
  .line 255
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Blue$Touch;->onChanged()V
  .line 256
    return-void
.end method

.method public onItemRangeRemoved(II)V
  .registers 3
  .line 260
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Blue$Touch;->onChanged()V
  .line 261
    return-void
.end method
