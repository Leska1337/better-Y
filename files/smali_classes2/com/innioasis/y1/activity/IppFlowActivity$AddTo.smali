.class final Lcom/innioasis/y1/activity/IppFlowActivity$AddTo;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppFlowActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppFlowActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "AddTo"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppFlowActivity;

.field private final id:Ljava/util/UUID;

.field private final it:Lcom/innioasis/ipp/Flow$Item;

.field private final songs:Ljava/util/List;

.method constructor <init>(Lcom/innioasis/y1/activity/IppFlowActivity;Ljava/util/List;Lcom/innioasis/ipp/Flow$Item;Ljava/util/UUID;)V
  .registers 5
  .line 2053
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 2054
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$AddTo;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$AddTo;->songs:Ljava/util/List;
    iput-object p3, p0, Lcom/innioasis/y1/activity/IppFlowActivity$AddTo;->it:Lcom/innioasis/ipp/Flow$Item;
    iput-object p4, p0, Lcom/innioasis/y1/activity/IppFlowActivity$AddTo;->id:Ljava/util/UUID;
  .line 2055
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L4 } :L6
  .registers 4
  :L0
  .line 2059
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$AddTo;->songs:Ljava/util/List;
  .line 2060
    if-nez v0, :L2
  .line 2061
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$AddTo;->it:Lcom/innioasis/ipp/Flow$Item;
    invoke-static { v0 }, Lcom/innioasis/ipp/Flow;->back(Lcom/innioasis/ipp/Flow$Item;)Lcom/innioasis/ipp/Flow$Back;
    move-result-object v0
  .line 2062
    if-nez v0, :L1
    const/4 v0, 0
    goto :L2
  :L1
    iget-object v0, v0, Lcom/innioasis/ipp/Flow$Back;->songs:Ljava/util/List;
  :L2
  .line 2064
    if-eqz v0, :L5
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v1
    if-eqz v1, :L3
    goto :L5
  :L3
  .line 2065
    sget-object v1, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v1 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v1
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$AddTo;->id:Ljava/util/UUID;
    invoke-virtual { v1, v0, v2 }, Lcom/innioasis/y1/database/Y1Repository;->addToPlayList(Ljava/util/List;Ljava/util/UUID;)V
  .line 2066
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$AddTo;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$100(Lcom/innioasis/y1/activity/IppFlowActivity;)Landroid/os/Handler;
    move-result-object v0
    new-instance v1, Lcom/innioasis/y1/activity/IppFlowActivity$Added;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$AddTo;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-direct { v1, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Added;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  :L4
  .line 2068
    goto :L7
  :L5
  .line 2064
    return-void
  :L6
  .line 2067
    move-exception v0
  :L7
  .line 2069
    return-void
.end method
