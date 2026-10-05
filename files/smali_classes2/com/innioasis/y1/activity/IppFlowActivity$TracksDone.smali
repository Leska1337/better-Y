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

.field private final it:Lcom/innioasis/ipp/Flow$Item;

.field private final l:Ljava/util/List;

.field private final n:[Ljava/lang/String;

.method constructor <init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/ipp/Flow$Item;Ljava/util/List;[Ljava/lang/String;)V
  .registers 5
  .line 569
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 570
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;->it:Lcom/innioasis/ipp/Flow$Item;
    iput-object p3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;->l:Ljava/util/List;
    iput-object p4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;->n:[Ljava/lang/String;
  .line 571
    return-void
.end method

.method public run()V
  .registers 4
  .line 574
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
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;->l:Ljava/util/List;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;->n:[Ljava/lang/String;
    invoke-virtual { v0, v1, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->setSongs(Ljava/util/List;[Ljava/lang/String;)V
  :L0
  .line 575
    return-void
.end method
