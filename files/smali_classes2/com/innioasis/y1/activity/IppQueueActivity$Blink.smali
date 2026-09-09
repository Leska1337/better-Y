.class final Lcom/innioasis/y1/activity/IppQueueActivity$Blink;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppQueueActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppQueueActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Blink"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppQueueActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
  .registers 2
  .line 1665
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1666
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity$Blink;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
  .line 1667
    return-void
.end method

.method public run()V
  .registers 2
  .line 1671
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity$Blink;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->blinkTick()V
  .line 1672
    return-void
.end method
