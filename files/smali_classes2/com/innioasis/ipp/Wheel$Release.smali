.class final Lcom/innioasis/ipp/Wheel$Release;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Wheel.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Wheel;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Release"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 520
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .catchall { :L2 .. :L4 } :L5
  .registers 5
  .line 522
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$700()Ljava/lang/ref/WeakReference;
    move-result-object v0
    const/4 v1, 0
    if-nez v0, :L0
    move-object v0, v1
    goto :L1
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$700()Ljava/lang/ref/WeakReference;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  :L1
  .line 523
    invoke-static { v1 }, Lcom/innioasis/ipp/Wheel;->access$702(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
  .line 524
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$800()Z
    move-result v1
  .line 526
    const/4 v2, 0
    if-eqz v0, :L7
  :L2
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v3
    if-eqz v3, :L7
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getWindowToken()Landroid/os/IBinder;
    move-result-object v3
    if-nez v3, :L3
    goto :L7
  :L3
  .line 527
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$900()Z
    move-result v3
    invoke-static { v3 }, Lcom/innioasis/ipp/Wheel;->access$802(Z)Z
  .line 529
    const/4 v3, 1
    invoke-static { v3 }, Lcom/innioasis/ipp/Wheel;->access$1002(Z)Z
  .line 530
    invoke-static { v0 }, Lcom/innioasis/ipp/PlGrid;->cursorAt(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result v3
    invoke-static { v0, v3 }, Lcom/innioasis/ipp/Wheel;->access$1100(Landroidx/recyclerview/widget/RecyclerView;I)V
  :L4
    goto :L6
  :L5
  .line 531
    move-exception v0
  :L6
  .line 533
    invoke-static { v2 }, Lcom/innioasis/ipp/Wheel;->access$1002(Z)Z
  .line 534
    invoke-static { v2 }, Lcom/innioasis/ipp/Wheel;->access$902(Z)Z
  .line 535
    invoke-static { v1 }, Lcom/innioasis/ipp/Wheel;->access$802(Z)Z
  .line 536
    nop
  .line 537
    return-void
  :L7
  .line 533
    invoke-static { v2 }, Lcom/innioasis/ipp/Wheel;->access$1002(Z)Z
  .line 534
    invoke-static { v2 }, Lcom/innioasis/ipp/Wheel;->access$902(Z)Z
  .line 535
    invoke-static { v1 }, Lcom/innioasis/ipp/Wheel;->access$802(Z)Z
  .line 526
    return-void
.end method
