.class final Lcom/innioasis/y1/activity/IppUsbActivity$Settle;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppUsbActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppUsbActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Settle"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppUsbActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppUsbActivity;)V
  .registers 2
  .line 323
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 324
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppUsbActivity$Settle;->a:Lcom/innioasis/y1/activity/IppUsbActivity;
  .line 325
    return-void
.end method

.method public run()V
  .registers 2
  .line 328
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppUsbActivity$Settle;->a:Lcom/innioasis/y1/activity/IppUsbActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppUsbActivity;->settle()V
  .line 329
    return-void
.end method
