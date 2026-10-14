.class final Lcom/innioasis/ipp/PlGrid$Warm;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "PlGrid.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/PlGrid;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Warm"
.end annotation

.field private final rv:Ljava/lang/ref/WeakReference;

.method constructor <init>(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 3
  .line 219
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/PlGrid$Warm;->rv:Ljava/lang/ref/WeakReference;
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L4 } :L7
  .registers 7
  :L0
  .line 222
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Warm;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 223
    if-eqz v0, :L6
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getWindowToken()Landroid/os/IBinder;
    move-result-object v1
    if-eqz v1, :L6
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v1
    instance-of v1, v1, Landroidx/recyclerview/widget/GridLayoutManager;
    if-nez v1, :L1
    goto :L6
  :L1
  .line 226
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v1
  .line 227
    if-eqz v1, :L5
    invoke-virtual { v1 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I
    move-result v2
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v3
    if-gt v2, v3, :L2
    goto :L5
  :L2
  .line 228
    const/4 v2, 0
    invoke-virtual { v1, v2 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemViewType(I)I
    move-result v2
  .line 229
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getRecycledViewPool()Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;
    move-result-object v3
  .line 230
    const/16 v4, 12
    invoke-virtual { v3, v2, v4 }, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;->setMaxRecycledViews(II)V
  .line 231
    invoke-virtual { v3, v2 }, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;->getRecycledViewCount(I)I
    move-result v5
    if-lt v5, v4, :L3
  .line 232
    invoke-static { }, Lcom/innioasis/ipp/PlGrid$Tidy;->now()V
  .line 233
    return-void
  :L3
  .line 235
    invoke-virtual { v1, v0, v2 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->createViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    move-result-object v0
    invoke-virtual { v3, v0 }, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;->putRecycledView(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V
  .line 236
    invoke-static { }, Lcom/innioasis/ipp/PlGrid;->access$100()Landroid/os/Handler;
    move-result-object v0
    invoke-virtual { v0, p0 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  :L4
  .line 238
    goto :L8
  :L5
  .line 227
    return-void
  :L6
  .line 224
    return-void
  :L7
  .line 237
    move-exception v0
  :L8
  .line 239
    return-void
.end method
