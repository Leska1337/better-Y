.class final Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppFlowActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppFlowActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "TracksDone"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppFlowActivity;

.field private final b:Lcom/innioasis/ipp/Flow$Back;

.field private final it:Lcom/innioasis/ipp/Flow$Item;

.field private final t0:J

.method constructor <init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/ipp/Flow$Item;Lcom/innioasis/ipp/Flow$Back;J)V
  .registers 6
  .line 1854
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1855
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;->it:Lcom/innioasis/ipp/Flow$Item;
    iput-object p3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;->b:Lcom/innioasis/ipp/Flow$Back;
    iput-wide p4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;->t0:J
  .line 1856
    return-void
.end method

.method public run()V
  .registers 4
  .line 1859
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$800(Lcom/innioasis/y1/activity/IppFlowActivity;)I
    move-result v0
    if-ltz v0, :L0
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$300(Lcom/innioasis/y1/activity/IppFlowActivity;)Ljava/util/List;
    move-result-object v0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$800(Lcom/innioasis/y1/activity/IppFlowActivity;)I
    move-result v1
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;->it:Lcom/innioasis/ipp/Flow$Item;
    if-ne v0, v1, :L0
  .line 1860
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$900(Lcom/innioasis/y1/activity/IppFlowActivity;)Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    move-result-object v0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;->b:Lcom/innioasis/ipp/Flow$Back;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setSongs(Lcom/innioasis/ipp/Flow$Back;)V
  .line 1861
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$400(Lcom/innioasis/y1/activity/IppFlowActivity;)I
    move-result v0
    const/4 v1, 2
    if-ne v0, v1, :L0
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$1000(Lcom/innioasis/y1/activity/IppFlowActivity;)V
  :L0
  .line 1863
    const-string v0, "flow tracks shown"
    iget-wide v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;->t0:J
    invoke-static { v0, v1, v2 }, Lcom/innioasis/ipp/Diag;->slow(Ljava/lang/String;J)V
  .line 1864
    return-void
.end method
