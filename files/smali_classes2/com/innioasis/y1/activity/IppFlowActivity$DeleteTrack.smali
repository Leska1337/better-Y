.class final Lcom/innioasis/y1/activity/IppFlowActivity$DeleteTrack;
.super Lcom/innioasis/y1/utils/DialogUtil$DialogCallback;
.source "IppFlowActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppFlowActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "DeleteTrack"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppFlowActivity;

.field private final s:Lcom/innioasis/y1/database/Song;

.method constructor <init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/y1/database/Song;)V
  .registers 3
  .line 2084
    invoke-direct { p0 }, Lcom/innioasis/y1/utils/DialogUtil$DialogCallback;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$DeleteTrack;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$DeleteTrack;->s:Lcom/innioasis/y1/database/Song;
    return-void
.end method

.method public cancel()V
  .registers 1
  .line 2091
    return-void
.end method

.method public confirm()V
  .registers 3
  .line 2087
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$DeleteTrack;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$DeleteTrack;->s:Lcom/innioasis/y1/database/Song;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->deleteTrack(Lcom/innioasis/y1/database/Song;)V
    return-void
.end method
