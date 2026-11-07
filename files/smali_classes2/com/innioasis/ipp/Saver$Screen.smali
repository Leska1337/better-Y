.class final Lcom/innioasis/ipp/Saver$Screen;
.super Landroid/content/BroadcastReceiver;
.source "Saver.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Saver;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Screen"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 163
    invoke-direct { p0 }, Landroid/content/BroadcastReceiver;-><init>()V
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
  .registers 3
  .line 166
    if-nez p2, :L0
    return-void
  :L0
  .line 167
    const-string p1, "android.intent.action.SCREEN_ON"
    invoke-virtual { p2 }, Landroid/content/Intent;->getAction()Ljava/lang/String;
    move-result-object p2
    invoke-virtual { p1, p2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L1
  .line 169
    invoke-static { }, Lcom/innioasis/ipp/Saver;->access$000()Landroid/os/Handler;
    move-result-object p1
    if-eqz p1, :L2
    invoke-static { }, Lcom/innioasis/ipp/Saver;->access$000()Landroid/os/Handler;
    move-result-object p1
    new-instance p2, Lcom/innioasis/ipp/Saver$Later;
    invoke-direct { p2 }, Lcom/innioasis/ipp/Saver$Later;-><init>()V
    invoke-virtual { p1, p2 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    goto :L2
  :L1
  .line 170
    invoke-static { }, Lcom/innioasis/ipp/Saver;->access$000()Landroid/os/Handler;
    move-result-object p1
    if-eqz p1, :L2
  .line 171
    invoke-static { }, Lcom/innioasis/ipp/Saver;->access$000()Landroid/os/Handler;
    move-result-object p1
    invoke-static { }, Lcom/innioasis/ipp/Saver;->access$100()Ljava/lang/Runnable;
    move-result-object p2
    invoke-virtual { p1, p2 }, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V
  :L2
  .line 173
    return-void
.end method
