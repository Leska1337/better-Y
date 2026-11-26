.class final Lcom/innioasis/ipp/PlGrid$Decoder$Repainted;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "PlGrid.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/PlGrid$Decoder;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Repainted"
.end annotation

.field private final rv:Landroidx/recyclerview/widget/RecyclerView;

.method constructor <init>(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 2
  .line 1193
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/PlGrid$Decoder$Repainted;->rv:Landroidx/recyclerview/widget/RecyclerView;
    return-void
.end method

.method public run()V
  .catchall { :L0 .. :L1 } :L3
  .catchall { :L4 .. :L5 } :L3
  .registers 3
  .line 1195
    invoke-static { }, Lcom/innioasis/ipp/PlGrid$Decoder;->access$1700()Ljava/util/LinkedList;
    move-result-object v0
    monitor-enter v0
  .line 1196
    const/4 v1, 0
  :L0
    invoke-static { v1 }, Lcom/innioasis/ipp/PlGrid$Decoder;->access$1802(Z)Z
  .line 1197
    monitor-exit v0
  :L1
  .line 1198
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Decoder$Repainted;->rv:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v0
    if-eqz v0, :L2
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Decoder$Repainted;->rv:Landroidx/recyclerview/widget/RecyclerView;
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v0
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V
  :L2
  .line 1199
    return-void
  :L3
  .line 1197
    move-exception v1
  :L4
    monitor-exit v0
  :L5
    throw v1
.end method
