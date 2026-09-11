.class final Lcom/innioasis/ipp/Usb$Open;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Usb.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Usb;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Open"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 55
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  :L0
  .line 58
    new-instance v0, Landroid/content/Intent;
    invoke-static { }, Lcom/innioasis/ipp/Usb;->access$000()Landroid/content/Context;
    move-result-object v1
    const-class v2, Lcom/innioasis/y1/activity/IppUsbActivity;
    invoke-direct { v0, v1, v2 }, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V
  .line 59
    const/high16 v1, 0x10000000
    invoke-virtual { v0, v1 }, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;
  .line 60
    invoke-static { }, Lcom/innioasis/ipp/Usb;->access$000()Landroid/content/Context;
    move-result-object v1
    invoke-virtual { v1, v0 }, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
  :L1
  .line 63
    goto :L3
  :L2
  .line 61
    move-exception v0
  .line 62
    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct { v1 }, Ljava/lang/StringBuilder;-><init>()V
    const-string v2, "usb: opening our screen failed: "
    invoke-virtual { v1, v2 }, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v1
    invoke-virtual { v1, v0 }, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    invoke-static { v0 }, Lcom/innioasis/ipp/Diag;->note(Ljava/lang/String;)V
  :L3
  .line 64
    return-void
.end method
