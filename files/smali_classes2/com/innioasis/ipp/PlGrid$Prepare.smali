.class final Lcom/innioasis/ipp/PlGrid$Prepare;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "PlGrid.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/PlGrid;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Prepare"
.end annotation

.field private final rv:Ljava/lang/ref/WeakReference;

.method constructor <init>(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 3
  .line 645
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/PlGrid$Prepare;->rv:Ljava/lang/ref/WeakReference;
    return-void
.end method

.method public run()V
  .registers 2
  .line 647
    new-instance v0, Lcom/innioasis/ipp/PlGrid$Sweep;
    invoke-direct { v0 }, Lcom/innioasis/ipp/PlGrid$Sweep;-><init>()V
    invoke-virtual { v0 }, Lcom/innioasis/ipp/PlGrid$Sweep;->run()V
  .line 648
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Prepare;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { v0 }, Lcom/innioasis/ipp/PlGrid;->access$600(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 649
    iget-object v0, p0, Lcom/innioasis/ipp/PlGrid$Prepare;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
    invoke-static { v0 }, Lcom/innioasis/ipp/PlGrid$Decoder;->all(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 650
    return-void
.end method
