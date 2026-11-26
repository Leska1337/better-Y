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
  .line 1733
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Load;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    return-void
.end method

.method public run()V
  .registers 7
  .line 1736
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 1737
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Load;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { }, Lcom/innioasis/ipp/Flow;->albums()Ljava/util/List;
    move-result-object v3
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Flow;->ordered(Landroid/content/Context;Ljava/util/List;)Ljava/util/List;
    move-result-object v2
  .line 1738
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Load;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v3 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$100(Lcom/innioasis/y1/activity/IppFlowActivity;)Landroid/os/Handler;
    move-result-object v3
    new-instance v4, Lcom/innioasis/y1/activity/IppFlowActivity$Loaded;
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Load;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-direct { v4, v5, v2, v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Loaded;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Ljava/util/List;J)V
    invoke-virtual { v3, v4 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 1739
    return-void
.end method
