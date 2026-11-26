.class final Lcom/innioasis/ipp/PlGrid$Snap;
.super Landroidx/recyclerview/widget/RecyclerView$AdapterDataObserver;
.source "PlGrid.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/PlGrid;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Snap"
.end annotation

.field private final m:Lcom/innioasis/ipp/PlGrid$Mover;

.method constructor <init>(Lcom/innioasis/ipp/PlGrid$Mover;)V
  .registers 2
  .line 722
    invoke-direct { p0 }, Landroidx/recyclerview/widget/RecyclerView$AdapterDataObserver;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/PlGrid$Snap;->m:Lcom/innioasis/ipp/PlGrid$Mover;
    return-void
.end method

.method public onChanged()V
  .registers 2
  .line 726
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Snap;->m:Lcom/innioasis/ipp/PlGrid$Mover;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/PlGrid$Mover;->snap()V
  .line 727
    return-void
.end method

.method public onItemRangeInserted(II)V
  .registers 3
  .line 731
    iget-object p1, p0, Lcom/innioasis/ipp/PlGrid$Snap;->m:Lcom/innioasis/ipp/PlGrid$Mover;
    invoke-virtual { p1 }, Lcom/innioasis/ipp/PlGrid$Mover;->snap()V
  .line 732
    return-void
.end method

.method public onItemRangeRemoved(II)V
  .registers 3
  .line 736
    iget-object p1, p0, Lcom/innioasis/ipp/PlGrid$Snap;->m:Lcom/innioasis/ipp/PlGrid$Mover;
    invoke-virtual { p1 }, Lcom/innioasis/ipp/PlGrid$Mover;->snap()V
  .line 737
    return-void
.end method
