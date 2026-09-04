.class final Lcom/innioasis/y1/activity/IppQueueActivity$PlayWatch;
.super Landroid/content/BroadcastReceiver;
.source "IppQueueActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppQueueActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "PlayWatch"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppQueueActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
  .registers 2
  .line 1188
    invoke-direct { p0 }, Landroid/content/BroadcastReceiver;-><init>()V
  .line 1189
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity$PlayWatch;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
  .line 1190
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
  .registers 3
  .line 1194
    iget-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity$PlayWatch;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-virtual { p1 }, Lcom/innioasis/y1/activity/IppQueueActivity;->onTrackChanged()V
  .line 1195
    return-void
.end method
