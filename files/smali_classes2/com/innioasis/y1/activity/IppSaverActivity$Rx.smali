.class final Lcom/innioasis/y1/activity/IppSaverActivity$Rx;
.super Landroid/content/BroadcastReceiver;
.source "IppSaverActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppSaverActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Rx"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppSaverActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppSaverActivity;)V
  .registers 2
  .line 675
    invoke-direct { p0 }, Landroid/content/BroadcastReceiver;-><init>()V
  .line 676
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity$Rx;->a:Lcom/innioasis/y1/activity/IppSaverActivity;
  .line 677
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
  .registers 5
  .line 681
    if-nez p2, :L0
    const/4 p1, 0
    goto :L1
  :L0
    invoke-virtual { p2 }, Landroid/content/Intent;->getAction()Ljava/lang/String;
    move-result-object p1
  :L1
  .line 682
    if-nez p1, :L2
    return-void
  :L2
  .line 683
    const-string p2, "android.intent.action.SCREEN_OFF"
    invoke-virtual { p2, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p2
    if-eqz p2, :L3
  .line 684
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity$Rx;->a:Lcom/innioasis/y1/activity/IppSaverActivity;
    invoke-virtual { p1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->finish()V
    goto :L7
  :L3
  .line 685
    const-string p2, "android.intent.action.ACTION_POWER_CONNECTED"
    invoke-virtual { p2, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p2
    if-nez p2, :L6
    const-string p2, "android.intent.action.ACTION_POWER_DISCONNECTED"
    invoke-virtual { p2, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p2
    if-eqz p2, :L4
    goto :L6
  :L4
  .line 688
    const-string p2, "android.intent.action.MY_PLAY_SONG"
    invoke-virtual { p2, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result p1
    if-eqz p1, :L5
  .line 689
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity$Rx;->a:Lcom/innioasis/y1/activity/IppSaverActivity;
    invoke-static { p1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->access$300(Lcom/innioasis/y1/activity/IppSaverActivity;)V
    goto :L7
  :L5
  .line 691
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity$Rx;->a:Lcom/innioasis/y1/activity/IppSaverActivity;
    invoke-static { p1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->access$400(Lcom/innioasis/y1/activity/IppSaverActivity;)V
    goto :L7
  :L6
  .line 687
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppSaverActivity$Rx;->a:Lcom/innioasis/y1/activity/IppSaverActivity;
    invoke-static { p1 }, Lcom/innioasis/y1/activity/IppSaverActivity;->access$200(Lcom/innioasis/y1/activity/IppSaverActivity;)Landroid/os/Handler;
    move-result-object p1
    new-instance p2, Lcom/innioasis/y1/activity/IppSaverActivity$Rearm;
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppSaverActivity$Rx;->a:Lcom/innioasis/y1/activity/IppSaverActivity;
    invoke-direct { p2, v0 }, Lcom/innioasis/y1/activity/IppSaverActivity$Rearm;-><init>(Lcom/innioasis/y1/activity/IppSaverActivity;)V
    const-wide/16 v0, 1500
    invoke-virtual { p1, p2, v0, v1 }, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
  :L7
  .line 693
    return-void
.end method
