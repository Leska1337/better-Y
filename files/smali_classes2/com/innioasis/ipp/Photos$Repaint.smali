.class final Lcom/innioasis/ipp/Photos$Repaint;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Photos.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Photos;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Repaint"
.end annotation

.field private final rv:Ljava/lang/ref/WeakReference;

.method constructor <init>(Landroidx/recyclerview/widget/RecyclerView;)V
  .registers 3
  .line 236
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 237
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Photos$Repaint;->rv:Ljava/lang/ref/WeakReference;
  .line 238
    return-void
.end method

.method public run()V
  .registers 3
  .line 241
    iget-object v0, p0, Lcom/innioasis/ipp/Photos$Repaint;->rv:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  .line 242
    instance-of v1, v0, Landroidx/recyclerview/widget/RecyclerView;
    if-nez v1, :L0
    return-void
  :L0
  .line 243
    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;
  .line 244
    invoke-static { v0 }, Lcom/innioasis/ipp/Photos;->access$000(Landroidx/recyclerview/widget/RecyclerView;)V
  .line 245
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    move-result-object v0
  .line 246
    if-eqz v0, :L1
    invoke-virtual { v0 }, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V
  :L1
  .line 247
    return-void
.end method
