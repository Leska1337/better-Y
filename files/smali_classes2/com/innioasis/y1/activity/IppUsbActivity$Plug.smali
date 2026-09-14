.class final Lcom/innioasis/y1/activity/IppUsbActivity$Plug;
.super Landroid/content/BroadcastReceiver;
.source "IppUsbActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppUsbActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Plug"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppUsbActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppUsbActivity;)V
  .registers 2
  .line 362
    invoke-direct { p0 }, Landroid/content/BroadcastReceiver;-><init>()V
  .line 363
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppUsbActivity$Plug;->a:Lcom/innioasis/y1/activity/IppUsbActivity;
  .line 364
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
  .registers 4
  .line 368
    if-eqz p2, :L0
    const-string p1, "connected"
    const/4 v0, 0
    invoke-virtual { p2, p1, v0 }, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
    move-result p1
    if-nez p1, :L0
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppUsbActivity$Plug;->a:Lcom/innioasis/y1/activity/IppUsbActivity;
    invoke-virtual { p1 }, Lcom/innioasis/y1/activity/IppUsbActivity;->finish()V
  :L0
  .line 369
    return-void
.end method
