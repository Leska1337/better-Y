.class final Lcom/innioasis/ipp/SongRows$Shown;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "SongRows.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/SongRows;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Shown"
.end annotation

.field private final rv:Ljava/lang/ref/WeakReference;

.method constructor <init>(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 3
  .line 549
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 550
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/SongRows$Shown;->rv:Ljava/lang/ref/WeakReference;
  .line 551
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L5 } :L7
  .registers 6
  :L0
  .line 555
    iget-object v0, p0, Lcom/innioasis/ipp/SongRows$Shown;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 556
    invoke-static { v0 }, Lcom/innioasis/ipp/SongRows;->of(Landroidx/recyclerview/widget/RecyclerView;)Lcom/innioasis/ipp/SongRows;
    move-result-object v1
  .line 557
    if-eqz v1, :L6
    invoke-static { v1 }, Lcom/innioasis/ipp/SongRows;->access$300(Lcom/innioasis/ipp/SongRows;)Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object v2
    invoke-virtual { v2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getCount()I
    move-result v2
    if-nez v2, :L1
    goto :L6
  :L1
  .line 558
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v2
  .line 559
    invoke-virtual { v1 }, Lcom/innioasis/ipp/SongRows;->cursor()I
    move-result v3
  .line 560
    if-nez v2, :L2
    const/4 v2, 0
    goto :L3
  :L2
    invoke-virtual { v2, v3 }, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object v2
  :L3
  .line 561
    if-eqz v2, :L4
    invoke-virtual { v2 }, Landroid/view/View;->getTop()I
    move-result v4
    invoke-static { v0, v3 }, Lcom/innioasis/ipp/SongRows;->top(Landroidx/recyclerview/widget/RecyclerView;I)I
    move-result v3
    if-lt v4, v3, :L4
  .line 562
    invoke-virtual { v2 }, Landroid/view/View;->getBottom()I
    move-result v2
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getHeight()I
    move-result v3
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingBottom()I
    move-result v4
    sub-int/2addr v3, v4
    if-le v2, v3, :L5
  :L4
  .line 563
    invoke-static { v1 }, Lcom/innioasis/ipp/SongRows;->access$300(Lcom/innioasis/ipp/SongRows;)Lcom/innioasis/music/adapter/MyBaseAdapter;
    move-result-object v1
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v1
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Lv;->pin(Landroid/view/View;I)V
  :L5
  .line 566
    goto :L8
  :L6
  .line 557
    return-void
  :L7
  .line 565
    move-exception v0
  :L8
  .line 567
    return-void
.end method
