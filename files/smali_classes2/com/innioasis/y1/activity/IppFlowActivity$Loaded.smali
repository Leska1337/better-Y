.class final Lcom/innioasis/y1/activity/IppFlowActivity$Loaded;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppFlowActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppFlowActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Loaded"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppFlowActivity;

.field private final l:Ljava/util/List;

.field private final t0:J

.method constructor <init>(Lcom/innioasis/y1/activity/IppFlowActivity;Ljava/util/List;J)V
  .registers 5
  .line 1747
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Loaded;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Loaded;->l:Ljava/util/List;
    iput-wide p3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Loaded;->t0:J
    return-void
.end method

.method public run()V
  .registers 4
  .line 1750
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Loaded;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Loaded;->l:Ljava/util/List;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->loaded(Ljava/util/List;)V
  .line 1751
    const-string v0, "flow list shown"
    iget-wide v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Loaded;->t0:J
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Diag;->slow(Ljava/lang/String;J)V
  .line 1752
    return-void
.end method
