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

.method constructor <init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/ipp/Flow$Item;Lcom/innioasis/ipp/Flow$Back;)V
  .registers 4
  .line 670
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 671
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;->it:Lcom/innioasis/ipp/Flow$Item;
    iput-object p3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;->b:Lcom/innioasis/ipp/Flow$Back;
  .line 672
    return-void
.end method

.method public run()V
  .registers 3
  .line 675
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$200(Lcom/innioasis/y1/activity/IppFlowActivity;)I
    move-result v0
    if-ltz v0, :L0
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$300(Lcom/innioasis/y1/activity/IppFlowActivity;)Ljava/util/List;
    move-result-object v0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$200(Lcom/innioasis/y1/activity/IppFlowActivity;)I
    move-result v1
    invoke-interface { v0, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;->it:Lcom/innioasis/ipp/Flow$Item;
    if-ne v0, v1, :L0
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$400(Lcom/innioasis/y1/activity/IppFlowActivity;)Lcom/innioasis/y1/activity/IppFlowActivity$Panel;
    move-result-object v0
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;->b:Lcom/innioasis/ipp/Flow$Back;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setSongs(Lcom/innioasis/ipp/Flow$Back;)V
  :L0
  .line 676
    return-void
.end method
