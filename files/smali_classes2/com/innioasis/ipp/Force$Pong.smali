.class final Lcom/innioasis/ipp/Force$Pong;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Force.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Force;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Pong"
.end annotation

.method private constructor <init>()V
  .registers 1
  .line 353
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method synthetic constructor <init>(Lcom/innioasis/ipp/Force$1;)V
  .registers 2
  .line 353
    invoke-direct { p0 }, Lcom/innioasis/ipp/Force$Pong;-><init>()V
    return-void
.end method

.method public run()V
  .registers 3
  .line 355
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Force;->access$902(J)J
  .line 356
    return-void
.end method
