.class final Lcom/innioasis/ipp/Tone$Watch;
.super Landroid/content/BroadcastReceiver;
.source "Tone.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Tone;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Watch"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 78
    invoke-direct { p0 }, Landroid/content/BroadcastReceiver;-><init>()V
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
  .registers 4
  .line 81
    if-eqz p1, :L3
    if-nez p2, :L0
    goto :L3
  :L0
  .line 82
    const-string v0, "android.intent.action.SCREEN_ON"
    invoke-virtual { p2 }, Landroid/content/Intent;->getAction()Ljava/lang/String;
    move-result-object p2
    invoke-virtual { v0, p2 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p2
    if-eqz p2, :L1
    invoke-static { p1 }, Lcom/innioasis/ipp/Tone;->access$000(Landroid/content/Context;)V
    goto :L2
  :L1
    invoke-static { p1 }, Lcom/innioasis/ipp/Tone;->access$100(Landroid/content/Context;)V
  :L2
  .line 83
    return-void
  :L3
  .line 81
    return-void
.end method
