.class final Lcom/innioasis/y1/activity/IppFlowActivity$Load;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppFlowActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppFlowActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Load"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppFlowActivity;

.method constructor <init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
  .registers 2
  .line 531
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Load;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    return-void
.end method

.method public run()V
  .registers 5
  .line 534
    invoke-static { }, Lcom/innioasis/ipp/Flow;->albums()Ljava/util/List;
    move-result-object v0
  .line 535
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Load;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$000(Lcom/innioasis/y1/activity/IppFlowActivity;)Landroid/os/Handler;
    move-result-object v1
    new-instance v2, Lcom/innioasis/y1/activity/IppFlowActivity$Loaded;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Load;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-direct { v2, v3, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$Loaded;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Ljava/util/List;)V
    invoke-virtual { v1, v2 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 536
    return-void
.end method
