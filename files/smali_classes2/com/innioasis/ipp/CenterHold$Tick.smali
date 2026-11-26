.class final Lcom/innioasis/ipp/CenterHold$Tick;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "CenterHold.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/CenterHold;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Tick"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 179
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L7 } :L9
  .registers 8
  :L0
  .line 183
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->access$000()Lcom/innioasis/ipp/CenterHold$Tick;
    move-result-object v0
    if-ne v0, p0, :L8
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->access$100()J
    move-result-wide v0
    const-wide/16 v2, 0
    cmp-long v4, v0, v2
    if-nez v4, :L1
    goto/16 :L8
  :L1
  .line 184
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 185
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->access$200()J
    move-result-wide v2
    sub-long v2, v0, v2
    const-wide/16 v4, 800
    cmp-long v6, v2, v4
    if-lez v6, :L2
  .line 186
    new-instance v2, Ljava/lang/StringBuilder;
    invoke-direct { v2 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v3, "no repeat for "
    invoke-virtual { v2, v3 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v2
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->access$200()J
    move-result-wide v3
    sub-long/2addr v0, v3
    invoke-virtual { v2, v0, v1 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v0
    const-string v1, "ms (release or lost UP)"
    invoke-virtual { v0, v1 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/CenterHold;->access$300(Ljava/lang/String;)V
  .line 187
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/CenterHold;->access$402(Z)Z
  .line 188
    return-void
  :L2
  .line 190
    sget-object v2, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v2 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v2
  .line 191
    invoke-static { v2 }, Lcom/innioasis/ipp/CenterHold;->access$500(Landroid/content/Context;)V
  .line 192
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->access$100()J
    move-result-wide v3
    sub-long/2addr v0, v3
  .line 193
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->access$600()Z
    move-result v3
    if-nez v3, :L5
    const-wide/16 v3, 3000
    cmp-long v5, v0, v3
    if-ltz v5, :L5
  .line 194
    const/4 v3, 1
    invoke-static { v3 }, Lcom/innioasis/ipp/CenterHold;->access$602(Z)Z
  .line 195
    invoke-static { v3 }, Lcom/innioasis/ipp/CenterHold;->access$702(Z)Z
  .line 196
    const-string v3, "Y1CenterHold"
    new-instance v4, Ljava/lang/StringBuilder;
    invoke-direct { v4 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v5, "warn at "
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4, v0, v1 }, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    move-result-object v4
    const-string v5, "ms"
    invoke-virtual { v4, v5 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v4
    invoke-static { v3, v4 }, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
  .line 197
    invoke-static { v2 }, Lcom/innioasis/ipp/CenterHold;->access$800(Landroid/content/Context;)Z
    move-result v3
    if-eqz v3, :L3
    const-string v3, "Apagando... suelta para cancelar"
    goto :L4
  :L3
  .line 198
    const-string v3, "Shutting down... release to cancel"
  :L4
  .line 197
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/CenterHold;->access$900(Landroid/content/Context;Ljava/lang/String;)V
  :L5
  .line 200
    const-wide/16 v3, 5000
    cmp-long v5, v0, v3
    if-ltz v5, :L6
  .line 201
    invoke-static { v2, v0, v1 }, Lcom/innioasis/ipp/CenterHold;->access$1000(Landroid/content/Context;J)V
  .line 202
    return-void
  :L6
  .line 204
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->access$1100()Landroid/os/Handler;
    move-result-object v0
    const-wide/16 v1, 100
    invoke-virtual { v0, p0, v1, v2 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  :L7
  .line 207
    goto :L10
  :L8
  .line 183
    return-void
  :L9
  .line 205
    move-exception v0
  .line 206
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->access$1200()V
  :L10
  .line 208
    return-void
.end method
