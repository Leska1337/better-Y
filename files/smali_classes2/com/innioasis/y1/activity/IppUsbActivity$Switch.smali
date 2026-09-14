.class final Lcom/innioasis/y1/activity/IppUsbActivity$Switch;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppUsbActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppUsbActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Switch"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppUsbActivity;

.field private final on:Z

.method constructor <init>(Lcom/innioasis/y1/activity/IppUsbActivity;Z)V
  .registers 3
  .line 304
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 305
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppUsbActivity$Switch;->a:Lcom/innioasis/y1/activity/IppUsbActivity;
  .line 306
    iput-boolean p2, p0, Lcom/innioasis/y1/activity/IppUsbActivity$Switch;->on:Z
  .line 307
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L5 } :L6
  .registers 4
  :L0
  .line 311
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppUsbActivity$Switch;->a:Lcom/innioasis/y1/activity/IppUsbActivity;
    new-instance v1, Landroid/content/Intent;
    iget-boolean v2, p0, Lcom/innioasis/y1/activity/IppUsbActivity$Switch;->on:Z
    if-eqz v2, :L1
    const-string v2, "com.innioasis.y1.PRE_UNMOUNT_SDCARD"
    goto :L2
  :L1
    const-string v2, "com.innioasis.y1.PRE_MOUNT_SDCARD"
  :L2
    invoke-direct { v1, v2 }, Landroid/content/Intent;-><init>(Ljava/lang/String;)V
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppUsbActivity;->sendBroadcast(Landroid/content/Intent;)V
  .line 312
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppUsbActivity$Switch;->a:Lcom/innioasis/y1/activity/IppUsbActivity;
    iget-boolean v1, p0, Lcom/innioasis/y1/activity/IppUsbActivity$Switch;->on:Z
    if-eqz v1, :L3
    const-string v1, "enableUsbMassStorage"
    goto :L4
  :L3
    const-string v1, "disableUsbMassStorage"
  :L4
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppUsbActivity;->storage(Ljava/lang/String;)Z
  :L5
  .line 315
    goto :L7
  :L6
  .line 313
    move-exception v0
  .line 314
    const-string v1, "ippUsb"
    const-string v2, "switch failed"
    invoke-static { v1, v2, v0 }, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
  :L7
  .line 316
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppUsbActivity$Switch;->a:Lcom/innioasis/y1/activity/IppUsbActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppUsbActivity;->access$000(Lcom/innioasis/y1/activity/IppUsbActivity;)Landroid/os/Handler;
    move-result-object v0
    new-instance v1, Lcom/innioasis/y1/activity/IppUsbActivity$Settle;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppUsbActivity$Switch;->a:Lcom/innioasis/y1/activity/IppUsbActivity;
    invoke-direct { v1, v2 }, Lcom/innioasis/y1/activity/IppUsbActivity$Settle;-><init>(Lcom/innioasis/y1/activity/IppUsbActivity;)V
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 317
    return-void
.end method
