.class final Lcom/innioasis/ipp/Bar$Tinter;
.super Ljava/lang/Object;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;
.source "Bar.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Bar;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Tinter"
.end annotation

.field private final bar:Ljava/lang/ref/WeakReference;

.method constructor <init>(Lcom/innioasis/ipp/Bar;)V
  .registers 3
  .line 376
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 377
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Bar$Tinter;->bar:Ljava/lang/ref/WeakReference;
  .line 378
    return-void
.end method

.method public onPreDraw()Z
  .catchall { :L0 .. :L5 } :L8
  .registers 7
  .line 382
    const/4 v0, 1
  :L0
    iget-object v1, p0, Lcom/innioasis/ipp/Bar$Tinter;->bar:Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/ipp/Bar;
  .line 383
    if-nez v1, :L1
    const/4 v2, 0
    goto :L2
  :L1
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->access$000(Lcom/innioasis/ipp/Bar;)Ljava/lang/ref/WeakReference;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Landroidx/recyclerview/widget/RecyclerView;
  :L2
  .line 384
    if-eqz v2, :L7
    invoke-virtual { v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v3
    if-nez v3, :L3
    goto :L7
  :L3
  .line 385
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->access$100(Lcom/innioasis/ipp/Bar;)V
  .line 386
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Bar;->access$200(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;)I
    move-result v3
  .line 387
    invoke-static { v1, v2, v3 }, Lcom/innioasis/ipp/Bar;->access$300(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;I)Z
  .line 388
    const/4 v4, 0
  :L4
    invoke-virtual { v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v5
    if-ge v4, v5, :L6
    invoke-virtual { v2, v4 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v5
    invoke-static { v1, v5, v3 }, Lcom/innioasis/ipp/Bar;->access$400(Lcom/innioasis/ipp/Bar;Landroid/view/View;I)V
  :L5
    add-int/lit8 v4, v4, 1
    goto :L4
  :L6
  .line 390
    goto :L9
  :L7
  .line 384
    return v0
  :L8
  .line 389
    move-exception v1
  :L9
  .line 391
    return v0
.end method
