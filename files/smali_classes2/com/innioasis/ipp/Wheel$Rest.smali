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
  .line 172
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .registers 2
  .line 174
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Wheel;->access$102(Z)Z
  .line 175
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Wheel;->access$202(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
  .line 176
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->paintPanel()V
  .line 177
    return-void
.end method
