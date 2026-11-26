.class final Lcom/innioasis/y1/activity/IppFlowActivity$Enqueue;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppFlowActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppFlowActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Enqueue"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppFlowActivity;

.field private final it:Lcom/innioasis/ipp/Flow$Item;

.method constructor <init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/ipp/Flow$Item;)V
  .registers 3
  .line 1966
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Enqueue;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Enqueue;->it:Lcom/innioasis/ipp/Flow$Item;
    return-void
.end method

.method public run()V
  .registers 5
  .line 1969
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Enqueue;->it:Lcom/innioasis/ipp/Flow$Item;
    invoke-static { v0 }, Lcom/innioasis/ipp/Flow;->back(Lcom/innioasis/ipp/Flow$Item;)Lcom/innioasis/ipp/Flow$Back;
    move-result-object v0
  .line 1970
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Enqueue;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$100(Lcom/innioasis/y1/activity/IppFlowActivity;)Landroid/os/Handler;
    move-result-object v1
    new-instance v2, Lcom/innioasis/y1/activity/IppFlowActivity$Enqueued;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Enqueue;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    iget-object v0, v0, Lcom/innioasis/ipp/Flow$Back;->songs:Ljava/util/List;
  :L1
    invoke-direct { v2, v3, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Enqueued;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Ljava/util/List;)V
    invoke-virtual { v1, v2 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 1971
    return-void
.end method
