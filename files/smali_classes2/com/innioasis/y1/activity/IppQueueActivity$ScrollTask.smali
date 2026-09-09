.class final Lcom/innioasis/y1/activity/IppQueueActivity$ScrollTask;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppQueueActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppQueueActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "ScrollTask"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppQueueActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppQueueActivity;)V
  .registers 2
  .line 1608
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1609
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppQueueActivity$ScrollTask;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
  .line 1610
    return-void
.end method

.method public run()V
  .registers 2
  .line 1614
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppQueueActivity$ScrollTask;->a:Lcom/innioasis/y1/activity/IppQueueActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppQueueActivity;->doScroll()Z
  .line 1615
    return-void
.end method
