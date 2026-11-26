.class final Lcom/innioasis/ipp/SongRows$Gap;
.super Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;
.source "SongRows.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/SongRows;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Gap"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 450
    invoke-direct { p0 }, Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;-><init>()V
    return-void
.end method

.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$State;)V
  .registers 5
  .line 452
    instance-of p2, p2, Lcom/innioasis/y1/view/ShufflePlaylistItemView;
    const/4 p4, 0
    if-eqz p2, :L0
    invoke-static { p3 }, Lcom/innioasis/ipp/SongRows;->access$000(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
    move-result-object p2
    invoke-static { p2 }, Lcom/innioasis/ipp/SongRows;->access$100(Landroid/view/View;)I
    move-result p2
    goto :L1
  :L0
    const/4 p2, 0
  :L1
    invoke-virtual { p1, p4, p4, p4, p2 }, Landroid/graphics/Rect;->set(IIII)V
  .line 453
    return-void
.end method
