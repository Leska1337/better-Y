.class final Lcom/innioasis/y1/activity/IppUsbActivity$Media;
.super Landroid/content/BroadcastReceiver;
.source "IppUsbActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppUsbActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Media"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppUsbActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppUsbActivity;)V
  .registers 2
  .line 350
    invoke-direct { p0 }, Landroid/content/BroadcastReceiver;-><init>()V
  .line 351
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppUsbActivity$Media;->a:Lcom/innioasis/y1/activity/IppUsbActivity;
  .line 352
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
  .registers 3
  .line 356
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppUsbActivity$Media;->a:Lcom/innioasis/y1/activity/IppUsbActivity;
    invoke-virtual { p1 }, Lcom/innioasis/y1/activity/IppUsbActivity;->settle()V
  .line 357
    return-void
.end method
