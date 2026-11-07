.class final Lcom/innioasis/ipp/Saver$Check;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Saver.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Saver;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Check"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 183
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .registers 4
  .line 186
    invoke-static { }, Lcom/innioasis/ipp/Saver;->access$400()Z
    move-result v0
    if-nez v0, :L3
    invoke-static { }, Lcom/innioasis/ipp/Lit;->screenOn()Z
    move-result v0
    if-nez v0, :L0
    goto :L3
  :L0
  .line 187
    invoke-static { }, Lcom/innioasis/ipp/Saver;->access$500()Landroid/content/Context;
    move-result-object v0
    const-string v1, "ss_on"
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Prefs;->on(Landroid/content/Context;Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :L1
  .line 188
    invoke-static { }, Lcom/innioasis/ipp/Saver;->access$200()J
    move-result-wide v0
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Saver;->access$300(J)V
  .line 189
    return-void
  :L1
  .line 191
    invoke-static { }, Lcom/innioasis/ipp/Saver;->access$500()Landroid/content/Context;
    move-result-object v0
    const/4 v1, 0
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Saver;->prefetchWall(Landroid/content/Context;Landroid/widget/ImageView;)V
  .line 192
    invoke-static { }, Lcom/innioasis/ipp/Saver;->access$600()Z
    move-result v0
    if-eqz v0, :L2
    return-void
  :L2
  .line 193
    const/4 v0, 1
    invoke-static { v0 }, Lcom/innioasis/ipp/Saver;->access$602(Z)Z
  .line 194
    new-instance v0, Ljava/lang/Thread;
    new-instance v1, Lcom/innioasis/ipp/Saver$Dump;
    invoke-direct { v1 }, Lcom/innioasis/ipp/Saver$Dump;-><init>()V
    const-string v2, "ipp-saver"
    invoke-direct { v0, v1, v2 }, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V
    invoke-virtual { v0 }, Ljava/lang/Thread;->start()V
  .line 195
    return-void
  :L3
  .line 186
    return-void
.end method
