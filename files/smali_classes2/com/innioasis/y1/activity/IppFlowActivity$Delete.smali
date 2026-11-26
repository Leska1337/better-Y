.class final Lcom/innioasis/y1/activity/IppFlowActivity$Delete;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "IppFlowActivity.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/y1/activity/IppFlowActivity;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Delete"
.end annotation

.field private final a:Lcom/innioasis/y1/activity/IppFlowActivity;

.field private final it:Lcom/innioasis/ipp/Flow$Item;

.method constructor <init>(Lcom/innioasis/y1/activity/IppFlowActivity;Lcom/innioasis/ipp/Flow$Item;)V
  .registers 3
  .line 2001
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Delete;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    iput-object p2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Delete;->it:Lcom/innioasis/ipp/Flow$Item;
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L6
  .catchall { :L2 .. :L3 } :L5
  .catchall { :L4 .. :L6 } :L6
  .registers 5
  :L0
  .line 2006
    sget-object v0, Lcom/innioasis/y1/Y1Application;->Companion:Lcom/innioasis/y1/Y1Application$Companion;
    invoke-virtual { v0 }, Lcom/innioasis/y1/Y1Application$Companion;->getY1Repository()Lcom/innioasis/y1/database/Y1Repository;
    move-result-object v0
  .line 2007
    new-instance v1, Ljava/util/ArrayList;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Delete;->it:Lcom/innioasis/ipp/Flow$Item;
    iget-object v2, v2, Lcom/innioasis/ipp/Flow$Item;->key:Ljava/lang/String;
    invoke-static { v2 }, Lcom/innioasis/ipp/Albums;->songsOf(Ljava/lang/String;)Ljava/util/List;
    move-result-object v2
    invoke-direct { v1, v2 }, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
  .line 2008
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository;->startDeleteSongs()V
  :L1
  .line 2010
    const/4 v2, 0
  :L2
    invoke-interface { v1 }, Ljava/util/List;->size()I
    move-result v3
    if-ge v2, v3, :L4
    invoke-interface { v1, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v3
    check-cast v3, Lcom/innioasis/y1/database/Song;
    invoke-virtual { v0, v3 }, Lcom/innioasis/y1/database/Y1Repository;->deleteSong(Lcom/innioasis/y1/database/Song;)V
  :L3
    add-int/lit8 v2, v2, 1
    goto :L2
  :L4
  .line 2012
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository;->endDeleteSongs()V
  .line 2013
    nop
  .line 2015
    goto :L7
  :L5
  .line 2012
    move-exception v1
    invoke-virtual { v0 }, Lcom/innioasis/y1/database/Y1Repository;->endDeleteSongs()V
  .line 2013
    throw v1
  :L6
  .line 2014
    move-exception v0
  :L7
  .line 2016
    iget-object v0, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Delete;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-static { v0 }, Lcom/innioasis/y1/activity/IppFlowActivity;->access$100(Lcom/innioasis/y1/activity/IppFlowActivity;)Landroid/os/Handler;
    move-result-object v0
    new-instance v1, Lcom/innioasis/y1/activity/IppFlowActivity$Reload;
    iget-object v2, p0, Lcom/innioasis/y1/activity/IppFlowActivity$Delete;->a:Lcom/innioasis/y1/activity/IppFlowActivity;
    invoke-direct { v1, v2 }, Lcom/innioasis/y1/activity/IppFlowActivity$Reload;-><init>(Lcom/innioasis/y1/activity/IppFlowActivity;)V
    invoke-virtual { v0, v1 }, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
  .line 2017
    return-void
.end method
