.class final Lcom/innioasis/y1/activity/IppFlowActivity$Rested;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppFlowActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppFlowActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Rested"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppFlowActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
  .registers 2
  .line 1820
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Rested;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    return-void
.end method

.method public run()V
  .registers 3
  .line 1823
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Rested;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$400(Lcom/innioasis/y1/activity/IppFlowActivity;)I
    move-result v0
    if-eqz v0, :L0
    return-void
  :L0
  .line 1824
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Rested;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iget-boolean v0, v0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipPending:Z
    if-eqz v0, :L1
  .line 1825
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Rested;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    const/4 v1, 0
    iput-boolean v1, v0, Lcom/innioasis/y1/activity/IppFlowActivity;->flipPending:Z
  .line 1826
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Rested;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$500(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    goto :L2
  :L1
  .line 1828
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Rested;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$600(Lcom/innioasis/y1/activity/IppFlowActivity;)V
  :L2
  .line 1830
    return-void
.end method
