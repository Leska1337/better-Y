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
  .line 313
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 314
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/SongRows$Shown;->rv:Ljava/lang/ref/WeakReference;
  .line 315
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L5 } :L7
  .registers 6
  :L0
  .line 319
    iget-object v0, p0, Lcom/innioasis/ipp/SongRows$Shown;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 320
    invoke-static { v0 }, Lcom/innioasis/ipp/SongRows;->of(Landroidx/recyclerview/widget/RecyclerView;)Lcom/innioasis/ipp/SongRows;
    move-result-object v1
  .line 321
    if-eqz v1, :L6
    invoke-static { v1 }, Lcom/innioasis/ipp/SongRows;->access$000(Lcom/innioasis/ipp/SongRows;)Lcom/innioasis/music/adapter/SongListAdapter;
    move-result-object v2
    invoke-virtual { v2 }, Lcom/innioasis/music/adapter/SongListAdapter;->getCount()I
    move-result v2
    if-nez v2, :L1
    goto :L6
  :L1
  .line 322
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;
    move-result-object v2
  .line 323
    if-nez v2, :L2
    const/4 v2, 0
    goto :L3
  :L2
    invoke-virtual { v1 }, Lcom/innioasis/ipp/SongRows;->cursor()I
    move-result v3
    invoke-virtual { v2, v3 }, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->findViewByPosition(I)Landroid/view/View;
    move-result-object v2
  :L3
  .line 324
    if-eqz v2, :L4
    invoke-virtual { v2 }, Landroid/view/View;->getTop()I
    move-result v3
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingTop()I
    move-result v4
    if-lt v3, v4, :L4
  .line 325
    invoke-virtual { v2 }, Landroid/view/View;->getBottom()I
    move-result v2
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getHeight()I
    move-result v3
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getPaddingBottom()I
    move-result v4
    sub-int/2addr v3, v4
    if-le v2, v3, :L5
  :L4
  .line 326
    invoke-static { v1 }, Lcom/innioasis/ipp/SongRows;->access$000(Lcom/innioasis/ipp/SongRows;)Lcom/innioasis/music/adapter/SongListAdapter;
    move-result-object v1
    invoke-virtual { v1 }, Lcom/innioasis/music/adapter/SongListAdapter;->getPosition()I
    move-result v1
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Lv;->pin(Landroid/view/View;I)V
  :L5
  .line 329
    goto :L8
  :L6
  .line 321
    return-void
  :L7
  .line 328
    move-exception v0
  :L8
  .line 330
    return-void
.end method
