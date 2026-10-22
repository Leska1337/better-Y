.class final Lcom/innioasis/ipp/Lab$Frame;
.super Ljava/lang/Object;
.implements Landroid/view/Choreographer$FrameCallback;
.implements Ljava/lang/Runnable;
.source "Lab.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Lab;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Frame"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 99
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public doFrame(J)V
  .registers 3
  .line 101
    new-instance p1, Landroid/os/Handler;
    invoke-static { }, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;
    move-result-object p2
    invoke-direct { p1, p2 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    invoke-virtual { p1, p0 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 102
    return-void
.end method

.method public run()V
  .registers 2
  .line 105
    const-string v0, "first frame"
    invoke-static { v0 }, Lcom/innioasis/ipp/Lab;->access$200(Ljava/lang/String;)V
  .line 106
    return-void
.end method
