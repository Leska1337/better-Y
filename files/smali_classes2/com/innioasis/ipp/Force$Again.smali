.class final Lcom/innioasis/ipp/Force$Again;
.super Lcom/innioasis/y1/utils/DialogUtil$DialogCallback;
.source "Force.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Force;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Again"
.end annotation

.method private constructor <init>()V
  .registers 1
  .line 172
    invoke-direct { p0 }, Lcom/innioasis/y1/utils/DialogUtil$DialogCallback;-><init>()V
    return-void
.end method

.method synthetic constructor <init>(Lcom/innioasis/ipp/Force$1;)V
  .registers 2
  .line 172
    invoke-direct { p0 }, Lcom/innioasis/ipp/Force$Again;-><init>()V
    return-void
.end method

.method public cancel()V
  .registers 1
  .line 180
    return-void
.end method

.method public confirm()V
  .registers 5
  .line 175
    invoke-static { }, Lcom/innioasis/ipp/Force;->access$600()Landroid/os/Handler;
    move-result-object v0
    new-instance v1, Lcom/innioasis/ipp/Force$Restart;
    const/4 v2, 0
    invoke-direct { v1, v2 }, Lcom/innioasis/ipp/Force$Restart;-><init>(Lcom/innioasis/ipp/Force$1;)V
    const-wide/16 v2, 400
    invoke-virtual { v0, v1, v2, v3 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  .line 176
    return-void
.end method
