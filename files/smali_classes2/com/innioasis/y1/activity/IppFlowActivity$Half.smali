.class final Lcom/innioasis/y1/activity/IppFlowActivity$Half;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppFlowActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppFlowActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Half"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppFlowActivity;

.field private final over:Z

.method constructor <init>(Lcom/innioasis/y1/activity/IppFlowActivity;Z)V
  .registers 3
  .line 1871
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Half;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iput-boolean p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Half;->over:Z
    return-void
.end method

.method public run()V
  .registers 2
  .line 1874
    iget-boolean v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Half;->over:Z
    if-eqz v0, :L0
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Half;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->halfOver()V
    goto :L1
  :L0
  .line 1875
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Half;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->halfBack()V
  :L1
  .line 1876
    return-void
.end method
