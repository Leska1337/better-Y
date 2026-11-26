.class final Lcom/innioasis/y1/activity/IppFlowActivity$Enqueued;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppFlowActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppFlowActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Enqueued"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppFlowActivity;

.field private final songs:Ljava/util/List;

.method constructor <init>(Lcom/innioasis/y1/activity/IppFlowActivity;Ljava/util/List;)V
  .registers 3
  .line 1978
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Enqueued;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Enqueued;->songs:Ljava/util/List;
    return-void
.end method

.method public run()V
  .registers 3
  .line 1980
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Enqueued;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Enqueued;->songs:Ljava/util/List;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->enqueued(Ljava/util/List;)V
    return-void
.end method
