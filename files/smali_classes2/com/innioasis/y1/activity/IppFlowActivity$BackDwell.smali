.class final Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppFlowActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppFlowActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "BackDwell"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppFlowActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
  .registers 2
  .line 1836
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    return-void
.end method

.method public run()V
  .registers 4
  .line 1841
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$700(Lcom/innioasis/y1/activity/IppFlowActivity;)Lcom/innioasis/ipp/FlowView;
    move-result-object v0
    invoke-virtual { v0 }, Lcom/innioasis/ipp/FlowView;->resting()Z
    move-result v0
    if-nez v0, :L0
    return-void
  :L0
  .line 1842
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$400(Lcom/innioasis/y1/activity/IppFlowActivity;)I
    move-result v0
    if-nez v0, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$300(Lcom/innioasis/y1/activity/IppFlowActivity;)Ljava/util/List;
    move-result-object v0
    if-eqz v0, :L1
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$300(Lcom/innioasis/y1/activity/IppFlowActivity;)Ljava/util/List;
    move-result-object v0
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-nez v0, :L1
  .line 1843
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$300(Lcom/innioasis/y1/activity/IppFlowActivity;)Ljava/util/List;
    move-result-object v1
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$BackDwell;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$700(Lcom/innioasis/y1/activity/IppFlowActivity;)Lcom/innioasis/ipp/FlowView;
    move-result-object v2
    invoke-virtual { v2 }, Lcom/innioasis/ipp/FlowView;->target()I
    move-result v2
    invoke-interface { v1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/ipp/Flow$Item;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->tracksAhead(Lcom/innioasis/ipp/Flow$Item;)V
  :L1
  .line 1845
    return-void
.end method
