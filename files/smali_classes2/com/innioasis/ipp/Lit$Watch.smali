.class final Lcom/innioasis/ipp/Lit$Watch;
.super Landroid/content/BroadcastReceiver;
.source "Lit.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Lit;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Watch"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 60
    invoke-direct { p0 }, Landroid/content/BroadcastReceiver;-><init>()V
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
  .registers 3
  .line 63
    if-nez p2, :L0
    return-void
  :L0
  .line 64
    const-string p1, "android.intent.action.SCREEN_ON"
    invoke-virtual { p2 }, Landroid/content/Intent;->getAction()Ljava/lang/String;
    move-result-object p2
    invoke-virtual { p1, p2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    invoke-static { p1 }, Lcom/innioasis/ipp/Lit;->access$002(Z)Z
  .line 65
    return-void
.end method
