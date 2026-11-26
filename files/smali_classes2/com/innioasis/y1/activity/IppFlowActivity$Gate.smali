.class final Lcom/innioasis/y1/activity/IppFlowActivity$Gate;
.super Ljava/lang/Object;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;
.source "IppFlowActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppFlowActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Gate"
.end annotation

.field private final static GATE_MS:J = 600L

.field private final a:Lcom/innioasis/y1/activity/IppFlowActivity;

.field private final until:J

.method constructor <init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
  .registers 6
  .line 1764
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1762
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
    const-wide/16 v2, 600
    add-long/2addr v0, v2
    iput-wide v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Gate;->until:J
  .line 1764
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Gate;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    return-void
.end method

.method public onPreDraw()Z
  .registers 9
  .line 1767
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Gate;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$200(Lcom/innioasis/y1/activity/IppFlowActivity;)Lcom/innioasis/ipp/Flow$Loader;
    move-result-object v0
  .line 1768
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Gate;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$300(Lcom/innioasis/y1/activity/IppFlowActivity;)Ljava/util/List;
    move-result-object v1
    const/4 v2, 1
    const/4 v3, 0
    if-eqz v1, :L0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Gate;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$300(Lcom/innioasis/y1/activity/IppFlowActivity;)Ljava/util/List;
    move-result-object v1
    invoke-interface { v1 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-eqz v1, :L0
    const/4 v1, 1
    goto :L1
  :L0
    const/4 v1, 0
  :L1
  .line 1769
    if-nez v1, :L3
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Gate;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-virtual { v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->isFinishing()Z
    move-result v1
    if-nez v1, :L3
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
    iget-wide v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Gate;->until:J
    cmp-long v1, v4, v6
    if-gez v1, :L3
    if-eqz v0, :L2
  .line 1770
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Flow$Loader;->firstReady()Z
    move-result v0
    if-nez v0, :L3
  :L2
  .line 1771
    return v3
  :L3
  .line 1773
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Gate;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->getWindow()Landroid/view/Window;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
    invoke-virtual { v0, p0 }, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  .line 1774
    return v2
.end method
