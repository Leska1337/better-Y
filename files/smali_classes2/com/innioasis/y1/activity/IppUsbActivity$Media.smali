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
  .line 347
    invoke-direct { p0 }, Landroid/content/BroadcastReceiver;-><init>()V
  .line 348
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppUsbActivity$Media;->a:Lcom/innioasis/y1/activity/IppUsbActivity;
  .line 349
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
  .registers 3
  .line 353
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppUsbActivity$Media;->a:Lcom/innioasis/y1/activity/IppUsbActivity;
    invoke-virtual { p1 }, Lcom/innioasis/y1/activity/IppUsbActivity;->settle()V
  .line 354
    return-void
.end method
