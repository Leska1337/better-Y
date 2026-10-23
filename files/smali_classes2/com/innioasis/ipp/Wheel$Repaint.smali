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
  .line 360
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L6 } :L7
  .registers 7
  :L0
  .line 363
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$500()Z
    move-result v0
    if-nez v0, :L1
    return-void
  :L1
  .line 364
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$600()Ljava/lang/ref/WeakReference;
    move-result-object v0
  .line 365
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$700()I
    move-result v1
  .line 366
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$800()V
  .line 367
    if-nez v0, :L2
    return-void
  :L2
  .line 368
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  .line 369
    instance-of v2, v0, Landroid/widget/ListView;
    if-nez v2, :L3
    return-void
  :L3
  .line 370
    check-cast v0, Landroid/widget/ListView;
  .line 371
    invoke-virtual { v0 }, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;
    move-result-object v2
  .line 372
    instance-of v3, v2, Lcom/innioasis/music/adapter/MyBaseAdapter;
    if-nez v3, :L4
    return-void
  :L4
  .line 373
    check-cast v2, Lcom/innioasis/music/adapter/MyBaseAdapter;
  .line 374
    invoke-virtual { v0 }, Landroid/widget/ListView;->getFirstVisiblePosition()I
    move-result v3
  .line 375
    invoke-virtual { v0 }, Landroid/widget/ListView;->getLastVisiblePosition()I
    move-result v4
  .line 376
    invoke-virtual { v2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->getPosition()I
    move-result v5
  .line 377
    invoke-static { v0, v2, v1, v3, v4 }, Lcom/innioasis/ipp/Wheel;->access$900(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;III)Z
    move-result v1
    if-eqz v1, :L5
    invoke-static { v0, v2, v5, v3, v4 }, Lcom/innioasis/ipp/Wheel;->access$900(Landroid/widget/ListView;Lcom/innioasis/music/adapter/MyBaseAdapter;III)Z
    move-result v0
    if-nez v0, :L6
  :L5
  .line 378
    invoke-virtual { v2 }, Lcom/innioasis/music/adapter/MyBaseAdapter;->notifyDataSetChanged()V
  :L6
  .line 381
    goto :L8
  :L7
  .line 380
    move-exception v0
  :L8
  .line 382
    return-void
.end method
