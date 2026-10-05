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
  .line 542
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;->it:Lcom/innioasis/ipp/Flow$Item;
    return-void
.end method

.method public run()V
  .registers 7
  .line 545
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;->it:Lcom/innioasis/ipp/Flow$Item;
    invoke-static { v0 }, Lcom/innioasis/ipp/Flow;->songs(Lcom/innioasis/ipp/Flow$Item;)Ljava/util/List;
    move-result-object v0
  .line 546
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v1
    new-array v2, v1, [Ljava/lang/String;
  .line 547
    const/4 v3, 0
  :L0
    if-ge v3, v1, :L1
    invoke-interface { v0, v3 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v4
    check-cast v4, Lcom/innioasis/y1/database/Song;
    invoke-static { v4 }, Lcom/innioasis/ipp/Flow;->title(Lcom/innioasis/y1/database/Song;)Ljava/lang/String;
    move-result-object v4
    aput-object v4, v2, v3
    add-int/lit8 v3, v3, 1
    goto :L0
  :L1
  .line 548
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$000(Lcom/innioasis/y1/activity/IppFlowActivity;)Landroid/os/Handler;
    move-result-object v1
    new-instance v3, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;->it:Lcom/innioasis/ipp/Flow$Item;
    invoke-direct { v3, v4, v5, v0, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$TracksDone;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/ipp/Flow$Item;Ljava/util/List;[Ljava/lang/String;)V
    invoke-virtual { v1, v3 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 549
    return-void
.end method
