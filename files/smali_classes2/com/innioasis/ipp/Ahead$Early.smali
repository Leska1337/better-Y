.class final Lcom/innioasis/ipp/Ahead$Early;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Ahead.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Ahead;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Early"
.end annotation

.field private final path:Ljava/lang/String;

.method constructor <init>(Ljava/lang/String;)V
  .registers 2
  .line 123
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 124
    iput-object p1, p0, Lcom/innioasis/ipp/Ahead$Early;->path:Ljava/lang/String;
  .line 125
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L3 } :L5
  .registers 7
  :L0
  .line 129
    invoke-static { }, Lcom/innioasis/ipp/Ahead;->access$000()Landroid/os/CountDownTimer;
    move-result-object v0
  .line 130
    if-eqz v0, :L4
    invoke-static { }, Lcom/innioasis/ipp/Ahead;->access$100()Z
    move-result v1
    if-nez v1, :L4
    iget-object v1, p0, Lcom/innioasis/ipp/Ahead$Early;->path:Ljava/lang/String;
    invoke-static { }, Lcom/innioasis/ipp/Ahead;->access$200()Ljava/lang/String;
    move-result-object v2
    invoke-virtual { v1, v2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-nez v1, :L1
    goto :L4
  :L1
  .line 131
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v1
    invoke-static { }, Lcom/innioasis/ipp/Ahead;->access$300()J
    move-result-wide v3
    sub-long/2addr v1, v3
    const-wide/16 v3, 180
    cmp-long v5, v1, v3
    if-ltz v5, :L2
    return-void
  :L2
  .line 132
    const/4 v1, 0
    invoke-static { v1 }, Lcom/innioasis/ipp/Ahead;->access$002(Landroid/os/CountDownTimer;)Landroid/os/CountDownTimer;
  .line 133
    invoke-virtual { v0 }, Landroid/os/CountDownTimer;->cancel()V
  .line 134
    invoke-virtual { v0 }, Landroid/os/CountDownTimer;->onFinish()V
  :L3
  .line 136
    goto :L6
  :L4
  .line 130
    return-void
  :L5
  .line 135
    move-exception v0
  :L6
  .line 137
    return-void
.end method
