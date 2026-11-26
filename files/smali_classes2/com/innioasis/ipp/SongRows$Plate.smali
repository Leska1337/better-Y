.class final Lcom/innioasis/ipp/SongRows$Plate;
.super Ljava/lang/Object;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;
.source "SongRows.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/SongRows;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Plate"
.end annotation

.field private final rv:Ljava/lang/ref/WeakReference;

.method constructor <init>(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 3
  .line 460
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 461
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/SongRows$Plate;->rv:Ljava/lang/ref/WeakReference;
  .line 462
    return-void
.end method

.method public onPreDraw()Z
  .catchall { :L0 .. :L4 } :L6
  .registers 5
  .line 466
    const/4 v0, 1
  :L0
    iget-object v1, p0, Lcom/innioasis/ipp/SongRows$Plate;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;
  .line 467
    if-nez v1, :L1
    const/4 v2, 0
    goto :L2
  :L1
    invoke-static { v1 }, Lcom/innioasis/ipp/SongRows;->access$000(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;
    move-result-object v2
  :L2
  .line 468
    if-eqz v2, :L5
    invoke-virtual { v2 }, Landroid/view/View;->getVisibility()I
    move-result v3
    if-eqz v3, :L3
    goto :L5
  :L3
  .line 469
    invoke-virtual { v1 }, Landroidx/recyclerview/widget/RecyclerView;->getTop()I
    move-result v3
    invoke-static { v1 }, Lcom/innioasis/ipp/SongRows;->access$200(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result v1
    add-int/2addr v3, v1
    invoke-virtual { v2 }, Landroid/view/View;->getTop()I
    move-result v1
    sub-int/2addr v3, v1
    int-to-float v1, v3
  .line 470
    invoke-virtual { v2 }, Landroid/view/View;->getTranslationY()F
    move-result v3
    cmpl-float v3, v3, v1
    if-eqz v3, :L4
  .line 471
    invoke-virtual { v2, v1 }, Landroid/view/View;->setTranslationY(F)V
  .line 473
    invoke-virtual { v2 }, Landroid/view/View;->invalidate()V
  :L4
  .line 476
    goto :L7
  :L5
  .line 468
    return v0
  :L6
  .line 475
    move-exception v1
  :L7
  .line 477
    return v0
.end method
