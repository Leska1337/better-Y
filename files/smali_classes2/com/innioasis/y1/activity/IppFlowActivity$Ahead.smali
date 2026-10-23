.class final Lcom/innioasis/y1/activity/IppFlowActivity$Ahead;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppFlowActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppFlowActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Ahead"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppFlowActivity;

.field private final rep:Lcom/innioasis/y1/database/Song;

.field private final track:Lcom/innioasis/y1/database/Song;

.method constructor <init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;)V
  .registers 4
  .line 1068
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Ahead;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Ahead;->track:Lcom/innioasis/y1/database/Song;
    iput-object p3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Ahead;->rep:Lcom/innioasis/y1/database/Song;
    return-void
.end method

.method public run()V
  .registers 7
  .line 1071
    const/4 v0, 2
    new-array v0, v0, [Ljava/lang/Object;
  .line 1072
    const/4 v1, 1
    sput-boolean v1, Lcom/innioasis/ipp/FlowView;->busyPic:Z
  .line 1073
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Ahead;->track:Lcom/innioasis/y1/database/Song;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Ahead;->rep:Lcom/innioasis/y1/database/Song;
    invoke-static { v1, v2, v0 }, Lcom/innioasis/ipp/Flow;->tripAhead(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;[Ljava/lang/Object;)Landroid/graphics/Bitmap;
    move-result-object v1
  .line 1074
    const/4 v2, 0
    sput-boolean v2, Lcom/innioasis/ipp/FlowView;->busyPic:Z
  .line 1075
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Ahead;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v2 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$000(Lcom/innioasis/y1/activity/IppFlowActivity;)Landroid/os/Handler;
    move-result-object v2
    new-instance v3, Lcom/innioasis/y1/activity/IppFlowActivity$AheadDone;
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Ahead;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Ahead;->track:Lcom/innioasis/y1/database/Song;
    invoke-virtual { v5 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v5
    invoke-direct { v3, v4, v5, v1, v0 }, Lcom/innioasis/y1/activity/IppFlowActivity$AheadDone;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Ljava/lang/String;Landroid/graphics/Bitmap;[Ljava/lang/Object;)V
    invoke-virtual { v2, v3 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 1076
    invoke-static { }, Lcom/innioasis/y1/activity/IppFlowActivity;->tidy()V
  .line 1077
    return-void
.end method
