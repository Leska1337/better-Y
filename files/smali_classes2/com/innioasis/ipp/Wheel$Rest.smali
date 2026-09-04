.class final Lcom/innioasis/ipp/Wheel$Rest;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Wheel.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Wheel;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Rest"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 439
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .catchall { :L2 .. :L3 } :L4
  .registers 4
  .line 441
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Wheel;->access$202(Z)Z
  .line 442
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Wheel;->access$302(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
  .line 443
    invoke-static { }, Lcom/innioasis/ipp/Eq;->rest()V
  .line 444
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$400()Ljava/lang/ref/WeakReference;
    move-result-object v1
    if-nez v1, :L0
    move-object v1, v0
    goto :L1
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$400()Ljava/lang/ref/WeakReference;
    move-result-object v1
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
  :L1
  .line 445
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$500()Ljava/lang/String;
    move-result-object v2
  .line 446
    invoke-static { v0 }, Lcom/innioasis/ipp/Wheel;->access$402(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
  .line 447
    invoke-static { v0 }, Lcom/innioasis/ipp/Wheel;->access$502(Ljava/lang/String;)Ljava/lang/String;
  .line 448
    instance-of v0, v1, Lcom/innioasis/y1/activity/SettingActivity;
    if-eqz v0, :L5
    if-eqz v2, :L5
  :L2
  .line 450
    invoke-static { v2 }, Lcom/innioasis/ipp/Wheel;->access$602(Ljava/lang/String;)Ljava/lang/String;
  .line 451
    check-cast v1, Lcom/innioasis/y1/activity/SettingActivity;
    invoke-virtual { v1, v2 }, Lcom/innioasis/y1/activity/SettingActivity;->ippRefreshRight(Ljava/lang/String;)V
  :L3
  .line 454
    goto :L5
  :L4
  .line 452
    move-exception v0
  :L5
  .line 456
    return-void
.end method
