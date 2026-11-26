.class final Lcom/innioasis/ipp/SongRows$Reveal;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "SongRows.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/SongRows;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Reveal"
.end annotation

.field private rv:Ljava/lang/ref/WeakReference;

.method constructor <init>()V
  .registers 3
  .line 571
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 572
    new-instance v0, Ljava/lang/ref/WeakReference;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/SongRows$Reveal;->rv:Ljava/lang/ref/WeakReference;
    return-void
.end method

.method at(Landroidx/recyclerview/widget/RecyclerView;)Lcom/innioasis/ipp/SongRows$Reveal;
  .registers 3
  .line 575
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/SongRows$Reveal;->rv:Ljava/lang/ref/WeakReference;
  .line 576
    return-object p0
.end method

.method public run()V
  .catchall { :L0 .. :L2 } :L4
  .registers 4
  :L0
  .line 581
    iget-object v0, p0, Lcom/innioasis/ipp/SongRows$Reveal;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 582
    invoke-static { v0 }, Lcom/innioasis/ipp/SongRows;->of(Landroidx/recyclerview/widget/RecyclerView;)Lcom/innioasis/ipp/SongRows;
    move-result-object v1
  .line 583
    if-eqz v1, :L3
    invoke-virtual { v1 }, Lcom/innioasis/ipp/SongRows;->heads()I
    move-result v2
    if-eqz v2, :L3
    invoke-virtual { v1 }, Lcom/innioasis/ipp/SongRows;->cursor()I
    move-result v2
    if-eqz v2, :L1
    goto :L3
  :L1
  .line 584
    const/4 v2, 0
    invoke-static { v0, v2, v1 }, Lcom/innioasis/ipp/Wheel;->follow(Landroidx/recyclerview/widget/RecyclerView;ILandroidx/recyclerview/widget/RecyclerView$Adapter;)V
  :L2
  .line 586
    goto :L5
  :L3
  .line 583
    return-void
  :L4
  .line 585
    move-exception v0
  :L5
  .line 587
    return-void
.end method
