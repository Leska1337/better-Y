.class final Lcom/innioasis/ipp/SongRows$Watch;
.super Landroid/database/DataSetObserver;
.source "SongRows.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/SongRows;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Watch"
.end annotation

.field private final rows:Ljava/lang/ref/WeakReference;

.method constructor <init>(Lcom/innioasis/ipp/SongRows;)V
  .registers 3
  .line 606
    invoke-direct { p0 }, Landroid/database/DataSetObserver;-><init>()V
  .line 607
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/SongRows$Watch;->rows:Ljava/lang/ref/WeakReference;
  .line 608
    return-void
.end method

.method public onChanged()V
  .registers 2
  .line 611
    iget-object v0, p0, Lcom/innioasis/ipp/SongRows$Watch;->rows:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/ipp/SongRows;
  .line 612
    if-eqz v0, :L0
    invoke-virtual { v0 }, Lcom/innioasis/ipp/SongRows;->notifyDataSetChanged()V
  :L0
  .line 613
    return-void
.end method

.method public onInvalidated()V
  .registers 1
  .line 616
    invoke-virtual { p0 }, Lcom/innioasis/ipp/SongRows$Watch;->onChanged()V
  .line 617
    return-void
.end method
