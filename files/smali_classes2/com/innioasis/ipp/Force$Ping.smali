.class final Lcom/innioasis/ipp/Force$Ping;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Force.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Force;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Ping"
.end annotation

.method private constructor <init>()V
  .registers 1
  .line 328
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method synthetic constructor <init>(Lcom/innioasis/ipp/Force$1;)V
  .registers 2
  .line 328
    invoke-direct { p0 }, Lcom/innioasis/ipp/Force$Ping;-><init>()V
    return-void
.end method

.method public run()V
  .catch Ljava/lang/InterruptedException; { :L0 .. :L1 } :L3
  .catchall { :L0 .. :L1 } :L2
  .registers 7
  .line 330
    new-instance v0, Lcom/innioasis/ipp/Force$Pong;
    const/4 v1, 0
    invoke-direct { v0, v1 }, Lcom/innioasis/ipp/Force$Pong;-><init>(Lcom/innioasis/ipp/Force$1;)V
  :L0
  .line 333
    invoke-static { }, Lcom/innioasis/ipp/Force;->access$600()Landroid/os/Handler;
    move-result-object v1
    invoke-virtual { v1, v0 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 334
    const-wide/16 v1, 2000
    invoke-static { v1, v2 }, Ljava/lang/Thread;->sleep(J)V
  :L1
  .line 339
    nop
  .line 340
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    invoke-static { }, Lcom/innioasis/ipp/Force;->access$1200()J
    move-result-wide v3
    sub-long/2addr v1, v3
    const-wide/16 v3, 20000
    cmp-long v5, v1, v3
    if-ltz v5, :L0
  .line 341
    new-instance v0, Ljava/lang/StringBuilder;
    invoke-direct { v0 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "main thread wedged for "
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
  .line 342
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    invoke-static { }, Lcom/innioasis/ipp/Force;->access$1200()J
    move-result-wide v3
    sub-long/2addr v1, v3
    invoke-virtual { v0, v1, v2 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, "ms, rebooting"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
  .line 341
    const-string v1, "ippForce"
    invoke-static { v1, v0 }, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
  .line 343
    invoke-static { }, Lcom/innioasis/ipp/Force;->access$200()V
  .line 344
    return-void
  :L2
  .line 337
    move-exception v0
  .line 338
    return-void
  :L3
  .line 335
    move-exception v0
  .line 336
    return-void
.end method
