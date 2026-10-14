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
  .line 859
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;->it:Lcom/innioasis/ipp/Flow$Item;
    return-void
.end method

.method public run()V
  .registers 10
  .line 862
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v4
  .line 863
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;->it:Lcom/innioasis/ipp/Flow$Item;
    invoke-static { v0 }, Lcom/innioasis/ipp/Flow;->back(Lcom/innioasis/ipp/Flow$Item;)Lcom/innioasis/ipp/Flow$Back;
    move-result-object v6
  .line 864
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$000(Lcom/innioasis/y1/activity/IppFlowActivity;)Landroid/os/Handler;
    move-result-object v7
    new-instance v8, Lcom/innioasis/y1/activity/IppFlowActivity$BackDone;
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;->it:Lcom/innioasis/ipp/Flow$Item;
    move-object v0, v8
    move-object v3, v6
    invoke-direct/range { v0 .. v5 }, Lcom/innioasis/y1/activity/IppFlowActivity$BackDone;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/ipp/Flow$Item;Lcom/innioasis/ipp/Flow$Back;J)V
    invoke-virtual { v7, v8 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 869
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iget-boolean v0, v0, Lcom/innioasis/y1/activity/IppFlowActivity;->animating:Z
    if-eqz v0, :L0
    return-void
  :L0
  .line 870
    invoke-static { v6 }, Lcom/innioasis/y1/activity/IppFlowActivity$Panel;->firstSong(Lcom/innioasis/ipp/Flow$Back;)Lcom/innioasis/y1/database/Song;
    move-result-object v0
  .line 871
    if-eqz v0, :L1
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v1
    if-eqz v1, :L1
  .line 872
    const/4 v1, 2
    new-array v1, v1, [Ljava/lang/Object;
  .line 873
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;->it:Lcom/innioasis/ipp/Flow$Item;
    iget-object v2, v2, Lcom/innioasis/ipp/Flow$Item;->rep:Lcom/innioasis/y1/database/Song;
    invoke-static { v0, v2, v1 }, Lcom/innioasis/ipp/Flow;->tripAhead(Lcom/innioasis/y1/database/Song;Lcom/innioasis/y1/database/Song;[Ljava/lang/Object;)Landroid/graphics/Bitmap;
    move-result-object v2
  .line 874
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v3 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$000(Lcom/innioasis/y1/activity/IppFlowActivity;)Landroid/os/Handler;
    move-result-object v3
    new-instance v4, Lcom/innioasis/y1/activity/IppFlowActivity$FirstPic;
    iget-object v5, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Tracks;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Song;->getPath()Ljava/lang/String;
    move-result-object v0
    invoke-direct { v4, v5, v0, v2, v1 }, Lcom/innioasis/y1/activity/IppFlowActivity$FirstPic;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Ljava/lang/String;Landroid/graphics/Bitmap;[Ljava/lang/Object;)V
    invoke-virtual { v3, v4 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  :L1
  .line 876
    invoke-static { }, Lcom/innioasis/y1/activity/IppFlowActivity;->tidy()V
  .line 877
    return-void
.end method
