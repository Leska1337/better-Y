.class final Lcom/innioasis/ipp/Ahead$Pick;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Ahead.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Ahead;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Pick"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 161
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L3 } :L5
  .registers 5
  :L0
  .line 164
    invoke-static { }, Lcom/innioasis/ipp/Queue;->nextPath()Ljava/lang/String;
    move-result-object v0
  .line 165
    if-eqz v0, :L4
    invoke-static { }, Lcom/innioasis/ipp/Ahead;->access$400()Ljava/lang/String;
    move-result-object v1
    invoke-virtual { v0, v1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :L1
    goto :L4
  :L1
  .line 166
    invoke-static { }, Lcom/innioasis/ipp/Ahead;->access$500()Landroid/os/Handler;
    move-result-object v1
    if-nez v1, :L2
  .line 167
    new-instance v1, Landroid/os/HandlerThread;
    const-string v2, "ipp-ahead"
    const/16 v3, 10
    invoke-direct { v1, v2, v3 }, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V
  .line 168
    invoke-virtual { v1 }, Landroid/os/HandlerThread;->start()V
  .line 169
    new-instance v2, Landroid/os/Handler;
    invoke-virtual { v1 }, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;
    move-result-object v1
    invoke-direct { v2, v1 }, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V
    invoke-static { v2 }, Lcom/innioasis/ipp/Ahead;->access$502(Landroid/os/Handler;)Landroid/os/Handler;
  :L2
  .line 171
    invoke-static { }, Lcom/innioasis/ipp/Ahead;->access$500()Landroid/os/Handler;
    move-result-object v1
    new-instance v2, Lcom/innioasis/ipp/Ahead$Read;
    sget v3, Lcom/innioasis/ipp/Ahead;->turn:I
    invoke-direct { v2, v0, v3 }, Lcom/innioasis/ipp/Ahead$Read;-><init>(Ljava/lang/String;I)V
    invoke-virtual { v1, v2 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  :L3
  .line 173
    goto :L6
  :L4
  .line 165
    return-void
  :L5
  .line 172
    move-exception v0
  :L6
  .line 174
    return-void
.end method
