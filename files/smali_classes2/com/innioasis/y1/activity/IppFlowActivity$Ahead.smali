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
  .line 1901
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Ahead;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Ahead;->track:Lcom/innioasis/y1/database/Song;
    iput-object p3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Ahead;->rep:Lcom/innioasis/y1/database/Song;
    return-void
.end method

.method public run()V
  .catch Ljava/lang/InterruptedException; { :L0 .. :L1 } :L2
  .registers 8
  .line 1904
    const/4 v0, 2
    new-array v1, v0, [Ljava/lang/Object;
  .line 1905
    const/4 v2, 1
    sput-boolean v2, Lcom/innioasis/ipp/FlowView;->busyPic:Z
  .line 1906
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Ahead;->track:Lcom/innioasis/y1/database/Song;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Ahead;->rep:Lcom/innioasis/y1/database/Song;
    invoke-static { v2, v3, v1 }, Lcom/innioasis/ipp/Flow;->tripAhead(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;[Ljava/lang/Object;)Landroid/graphics/Bitmap;
    move-result-object v2
  .line 1907
    const/4 v3, 0
    sput-boolean v3, Lcom/innioasis/ipp/FlowView;->busyPic:Z
  .line 1908
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Ahead;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v3 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$100(Lcom/innioasis/y1/activity/IppFlowActivity;)Landroid/os/Handler;
    move-result-object v3
    new-instance v4, Lcom/innioasis/y1/activity/IppFlowActivity$AheadDone;
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Ahead;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iget-object v6, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Ahead;->track:Lcom/innioasis/y1/database/Song;
    invoke-virtual { v6 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v6
    invoke-direct { v4, v5, v6, v2, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$AheadDone;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Ljava/lang/String;Landroid/graphics/Bitmap;[Ljava/lang/Object;)V
    invoke-virtual { v3, v4 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 1912
    const-wide/16 v1, 700
  :L0
    invoke-static { v1, v2 }, Ljava/lang/Thread;->sleep(J)V
  :L1
  .line 1914
    goto :L3
  :L2
  .line 1913
    move-exception v1
  :L3
  .line 1915
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Ahead;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iget-boolean v1, v1, Lcom/innioasis/y1/activity/IppFlowActivity;->animating:Z
    if-nez v1, :L4
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Ahead;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$400(Lcom/innioasis/y1/activity/IppFlowActivity;)I
    move-result v1
    if-ne v1, v0, :L4
    invoke-static { }, Lcom/innioasis/y1/activity/IppFlowActivity;->tidy()V
  :L4
  .line 1916
    return-void
.end method
