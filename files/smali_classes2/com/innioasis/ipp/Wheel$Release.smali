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
  .line 735
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .catchall { :L2 .. :L4 } :L5
  .registers 5
  .line 737
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$1400()Ljava/lang/ref/WeakReference;
    move-result-object v0
    const/4 v1, 0
    if-nez v0, :L0
    move-object v0, v1
    goto :L1
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$1400()Ljava/lang/ref/WeakReference;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  :L1
  .line 738
    invoke-static { v1 }, Lcom/innioasis/ipp/Wheel;->access$1402(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
  .line 739
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$1500()Z
    move-result v1
  .line 741
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
  .line 742
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$1600()Z
    move-result v3
    invoke-static { v3 }, Lcom/innioasis/ipp/Wheel;->access$1502(Z)Z
  .line 744
    const/4 v3, 1
    invoke-static { v3 }, Lcom/innioasis/ipp/Wheel;->access$1702(Z)Z
  .line 745
    invoke-static { v0 }, Lcom/innioasis/ipp/PlGrid;->cursorAt(Landroidx/recyclerview/widget/RecyclerView;)I
    move-result v3
    invoke-static { v0, v3 }, Lcom/innioasis/ipp/Wheel;->access$1800(Landroidx/recyclerview/widget/RecyclerView;I)V
  :L4
    goto :L6
  :L5
  .line 746
    move-exception v0
  :L6
  .line 748
    invoke-static { v2 }, Lcom/innioasis/ipp/Wheel;->access$1702(Z)Z
  .line 749
    invoke-static { v2 }, Lcom/innioasis/ipp/Wheel;->access$1602(Z)Z
  .line 750
    invoke-static { v1 }, Lcom/innioasis/ipp/Wheel;->access$1502(Z)Z
  .line 751
    nop
  .line 752
    return-void
  :L7
  .line 748
    invoke-static { v2 }, Lcom/innioasis/ipp/Wheel;->access$1702(Z)Z
  .line 749
    invoke-static { v2 }, Lcom/innioasis/ipp/Wheel;->access$1602(Z)Z
  .line 750
    invoke-static { v1 }, Lcom/innioasis/ipp/Wheel;->access$1502(Z)Z
  .line 741
    return-void
.end method
