.class final Lcom/innioasis/y1/activity/IppUsbActivity$GiveUp;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppUsbActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppUsbActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "GiveUp"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppUsbActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppUsbActivity;)V
  .registers 2
  .line 326
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 327
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppUsbActivity$GiveUp;->a:Lcom/innioasis/y1/activity/IppUsbActivity;
  .line 328
    return-void
.end method

.method public run()V
  .registers 2
  .line 331
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppUsbActivity$GiveUp;->a:Lcom/innioasis/y1/activity/IppUsbActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppUsbActivity;->giveUp()V
  .line 332
    return-void
.end method
