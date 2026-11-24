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
  .line 133
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L5 } :L7
  .registers 10
  :L0
  .line 137
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->access$000()Lcom/innioasis/ipp/CenterHold$Tick;
    move-result-object v0
    if-ne v0, p0, :L6
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->access$100()J
    move-result-wide v0
    const-wide/16 v2, 0
    cmp-long v4, v0, v2
    if-nez v4, :L1
    goto :L6
  :L1
  .line 138
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 139
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->access$200()J
    move-result-wide v2
    sub-long v2, v0, v2
    const-wide/16 v4, 800
    const/4 v6, 0
    cmp-long v7, v2, v4
    if-lez v7, :L2
  .line 140
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->access$300()V
  .line 141
    invoke-static { v6 }, Lcom/innioasis/ipp/CenterHold;->access$402(Z)Z
  .line 142
    return-void
  :L2
  .line 144
    sget-object v2, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v2 }, Lcom/innioasis/y1/Y1Application$Companion;->getAppContext()Landroid/content/Context;
    move-result-object v2
  .line 145
    invoke-static { v2 }, Lcom/innioasis/ipp/CenterHold;->access$500(Landroid/content/Context;)V
  .line 146
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->access$100()J
    move-result-wide v3
    sub-long/2addr v0, v3
  .line 147
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->access$600()Z
    move-result v3
    const/4 v4, 1
    if-nez v3, :L3
    const-wide/16 v7, 3000
    cmp-long v3, v0, v7
    if-ltz v3, :L3
  .line 148
    invoke-static { v4 }, Lcom/innioasis/ipp/CenterHold;->access$602(Z)Z
  .line 149
    invoke-static { v4 }, Lcom/innioasis/ipp/CenterHold;->access$702(Z)Z
  .line 150
    if-eqz v2, :L3
  .line 151
    const v3, 2131821188
    invoke-virtual { v2, v3 }, Landroid/content/Context;->getString(I)Ljava/lang/String;
    move-result-object v3
    invoke-static { v2, v3, v6 }, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object v2
  .line 152
    invoke-virtual { v2 }, Landroid/widget/Toast;->show()V
  :L3
  .line 155
    const-wide/16 v2, 5000
    cmp-long v5, v0, v2
    if-ltz v5, :L4
  .line 156
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->access$300()V
  .line 157
    invoke-static { v4 }, Lcom/innioasis/ipp/CenterHold;->access$802(Z)Z
  .line 158
    invoke-static { v6 }, Lcom/innioasis/ipp/CenterHold;->access$402(Z)Z
  .line 159
    sget-object v0, Lcom/innioasis/music/util/Other;->INSTANCE:Lcom/innioasis/music/util/Other;
    invoke-virtual { v0 }, Lcom/innioasis/music/util/Other;->shutdown()V
  .line 160
    return-void
  :L4
  .line 162
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->access$900()Landroid/os/Handler;
    move-result-object v0
    const-wide/16 v1, 100
    invoke-virtual { v0, p0, v1, v2 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  :L5
  .line 165
    goto :L8
  :L6
  .line 137
    return-void
  :L7
  .line 163
    move-exception v0
  .line 164
    invoke-static { }, Lcom/innioasis/ipp/CenterHold;->access$300()V
  :L8
  .line 166
    return-void
.end method
