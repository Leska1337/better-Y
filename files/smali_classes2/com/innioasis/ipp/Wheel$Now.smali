.class final Lcom/innioasis/ipp/Wheel$Now;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Wheel.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Wheel;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Now"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 476
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .registers 6
  .line 478
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$200()J
    move-result-wide v2
    sub-long/2addr v0, v2
    const-wide/16 v2, 70
    cmp-long v4, v0, v2
    if-ltz v4, :L0
    invoke-static { }, Lcom/innioasis/ipp/Wheel;->access$300()V
  :L0
  .line 479
    return-void
.end method
