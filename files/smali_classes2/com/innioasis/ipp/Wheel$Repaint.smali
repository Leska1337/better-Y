.class final Lcom/innioasis/ipp/Wheel$Repaint;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Wheel.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Wheel;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Repaint"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 460
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L6 } :L7
  .registers 7
  :L0
  .line 463
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$700()Z
    move-result v0
    if-nez v0, :L1
    return-void
  :L1
  .line 464
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$800()Ljava/lang/ref/WeakReference;
    move-result-object v0
  .line 465
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$900()I
    move-result v1
  .line 466
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$1000()V
  .line 467
    if-nez v0, :L2
    return-void
  :L2
  .line 468
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  .line 469
    instance-of v2, v0, Landroid/widget/ListView;
    if-nez v2, :L3
    return-void
  :L3
  .line 470
    check-cast v0, Landroid/widget/ListView;
  .line 471
    invoke-virtual { v0 }, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;
    move-result-object v2
  .line 472
    instance-of v3, v2, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v3, :L4
    return-void
  :L4
  .line 473
    check-cast v2, Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 474
    invoke-virtual { v0 }, Landroid/widget/ListView;->getFirstVisiblePosition()I
    move-result v3
  .line 475
    invoke-virtual { v0 }, Landroid/widget/ListView;->getLastVisiblePosition()I
    move-result v4
  .line 476
    invoke-virtual { v2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v5
  .line 477
    invoke-static { v0, v2, v1, v3, v4 }, Lcom/innioasis/ipp/Wheel;->access$1100(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;III)Z
    move-result v1
    if-eqz v1, :L5
    invoke-static { v0, v2, v5, v3, v4 }, Lcom/innioasis/ipp/Wheel;->access$1100(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;III)Z
    move-result v0
    if-nez v0, :L6
  :L5
  .line 478
    invoke-virtual { v2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  :L6
  .line 482
    goto :L8
  :L7
  .line 480
    move-exception v0
  :L8
  .line 483
    return-void
.end method
