.class final Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppFlowActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppFlowActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Tracks"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppFlowActivity;

.field private final it:Lcom/innioasis/ipp/Flow$Item;

.method constructor <init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/ipp/Flow$Item;)V
  .registers 3
  .line 1790
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;->it:Lcom/innioasis/ipp/Flow$Item;
    return-void
.end method

.method public run()V
  .registers 9
  .line 1793
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
  .line 1794
    const/4 v0, 1
    sput-boolean v0, Lcom/innioasis/ipp/FlowView;->busyTracks:Z
  .line 1795
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;->it:Lcom/innioasis/ipp/Flow$Item;
    invoke-static { v0 }, Lcom/innioasis/ipp/Flow;->back(Lcom/innioasis/ipp/Flow$Item;)Lcom/innioasis/ipp/Flow$Back;
    move-result-object v3
  .line 1796
    const/4 v0, 0
    sput-boolean v0, Lcom/innioasis/ipp/FlowView;->busyTracks:Z
  .line 1800
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$100(Lcom/innioasis/y1/activity/IppFlowActivity;)Landroid/os/Handler;
    move-result-object v6
    new-instance v7, Lcom/innioasis/y1/activity/IppFlowActivity$BackDone;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;->it:Lcom/innioasis/ipp/Flow$Item;
    move-object v0, v7
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/y1/activity/IppFlowActivity$BackDone;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/ipp/Flow$Item;Lcom/innioasis/ipp/Flow$Back;J)V
    invoke-virtual { v6, v7 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 1801
    return-void
.end method
