.class final Lcom/innioasis/y1/activity/IppFlowActivity$TrackDeleted;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppFlowActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppFlowActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "TrackDeleted"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppFlowActivity;

.field private final b:Lcom/innioasis/ipp/Flow$Back;

.field private final it:Lcom/innioasis/ipp/Flow$Item;

.field private final row:I

.method constructor <init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/ipp/Flow$Item;Lcom/innioasis/ipp/Flow$Back;I)V
  .registers 5
  .line 2128
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 2129
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TrackDeleted;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TrackDeleted;->it:Lcom/innioasis/ipp/Flow$Item;
    iput-object p3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TrackDeleted;->b:Lcom/innioasis/ipp/Flow$Back;
    iput p4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TrackDeleted;->row:I
  .line 2130
    return-void
.end method

.method public run()V
  .registers 5
  .line 2132
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TrackDeleted;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TrackDeleted;->it:Lcom/innioasis/ipp/Flow$Item;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TrackDeleted;->b:Lcom/innioasis/ipp/Flow$Back;
    iget v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$TrackDeleted;->row:I
    invoke-virtual { v0, v1, v2, v3 }, Lcom/innioasis/y1/activity/IppFlowActivity;->trackDeleted(Lcom/innioasis/ipp/Flow$Item;Lcom/innioasis/ipp/Flow$Back;I)V
    return-void
.end method
