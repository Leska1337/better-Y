.class final Lcom/innioasis/y1/activity/IppFlowActivity$DeleteSong;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppFlowActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppFlowActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "DeleteSong"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppFlowActivity;

.field private final it:Lcom/innioasis/ipp/Flow$Item;

.field private final row:I

.field private final s:Lcom/innioasis/y1/database/Song;

.method constructor <init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/y1/database/Song;Lcom/innioasis/ipp/Flow$Item;I)V
  .registers 5
  .line 2100
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 2101
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$DeleteSong;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$DeleteSong;->s:Lcom/innioasis/y1/database/Song;
    iput-object p3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$DeleteSong;->it:Lcom/innioasis/ipp/Flow$Item;
    iput p4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$DeleteSong;->row:I
  .line 2102
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L4
  .catchall { :L1 .. :L2 } :L3
  .catchall { :L2 .. :L4 } :L4
  .registers 7
  .line 2105
    nop
  :L0
  .line 2108
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 2109
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository;->startDeleteSongs()V
  :L1
  .line 2111
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$DeleteSong;->s:Lcom/innioasis/y1/database/Song;
    invoke-virtual { v0, v1 }, Lcom/innioasis/y1/database/Y1Repository;->deleteSong(Lcom/innioasis/y1/database/Song;)V
  :L2
  .line 2113
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository;->endDeleteSongs()V
  .line 2114
    nop
  .line 2115
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$DeleteSong;->it:Lcom/innioasis/ipp/Flow$Item;
    invoke-static { v0 }, Lcom/innioasis/ipp/Flow;->back(Lcom/innioasis/ipp/Flow$Item;)Lcom/innioasis/ipp/Flow$Back;
    move-result-object v0
  .line 2117
    goto :L5
  :L3
  .line 2113
    move-exception v1
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository;->endDeleteSongs()V
  .line 2114
    throw v1
  :L4
  .line 2116
    move-exception v0
    const/4 v0, 0
  :L5
  .line 2118
    iget-object v1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$DeleteSong;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v1 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$100(Lcom/innioasis/y1/activity/IppFlowActivity;)Landroid/os/Handler;
    move-result-object v1
    new-instance v2, Lcom/innioasis/y1/activity/IppFlowActivity$TrackDeleted;
    iget-object v3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$DeleteSong;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iget-object v4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$DeleteSong;->it:Lcom/innioasis/ipp/Flow$Item;
    iget v5, p0, Lcom/innioasis/y1/activity/IppFlowActivity$DeleteSong;->row:I
    invoke-direct { v2, v3, v4, v0, v5 }, Lcom/innioasis/y1/activity/IppFlowActivity$TrackDeleted;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/ipp/Flow$Item;Lcom/innioasis/ipp/Flow$Back;I)V
    invoke-virtual { v1, v2 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 2119
    return-void
.end method
