.class final Lcom/innioasis/ipp/PlGrid$Repaint;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "PlGrid.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/PlGrid;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Repaint"
.end annotation

.field private final rv:Ljava/lang/ref/WeakReference;

.method constructor <init>(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 3
  .line 1275
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1276
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/PlGrid$Repaint;->rv:Ljava/lang/ref/WeakReference;
  .line 1277
    return-void
.end method

.method public run()V
  .registers 3
  .line 1280
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Repaint;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 1281
    if-eqz v0, :L0
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v1
    if-eqz v1, :L0
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v0
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V
  :L0
  .line 1282
    return-void
.end method
