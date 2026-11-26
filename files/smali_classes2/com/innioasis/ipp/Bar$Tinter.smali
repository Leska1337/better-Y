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
  .line 1349
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1350
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Bar$Tinter;->bar:Ljava/lang/ref/WeakReference;
  .line 1351
    return-void
.end method

.method public onPreDraw()Z
  .catchall { :L0 .. :L12 } :L14
  .registers 10
  .line 1355
    const/4 v0, 1
  :L0
    iget-object v1, p0, Lcom/innioasis/ipp/Bar$Tinter;->bar:Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/ipp/Bar;
  .line 1356
    if-nez v1, :L1
    const/4 v2, 0
    goto :L2
  :L1
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->access$300(Lcom/innioasis/ipp/Bar;)Ljava/lang/ref/WeakReference;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Landroidx/recyclerview/widget/RecyclerView;
  :L2
  .line 1357
    if-eqz v2, :L13
    invoke-static { v2 }, Lcom/innioasis/ipp/Bar;->access$1100(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v3
    if-nez v3, :L3
    goto/16 :L13
  :L3
  .line 1359
    invoke-virtual { v2 }, Landroidx/recyclerview/widget/RecyclerView;->isShown()Z
    move-result v3
    if-nez v3, :L4
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->access$1200(Lcom/innioasis/ipp/Bar;)Ljava/lang/ref/WeakReference;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v3
    if-nez v3, :L4
    return v0
  :L4
  .line 1360
    invoke-virtual { v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v3
    if-nez v3, :L6
  .line 1362
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->access$1300(Lcom/innioasis/ipp/Bar;)Z
    move-result v2
    if-nez v2, :L5
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->access$1400(Lcom/innioasis/ipp/Bar;)V
  :L5
  .line 1363
    return v0
  :L6
  .line 1365
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->access$1500(Lcom/innioasis/ipp/Bar;)V
  .line 1366
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Bar;->access$1600(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;)I
    move-result v3
  .line 1369
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->access$1700(Lcom/innioasis/ipp/Bar;)Z
    move-result v4
    if-nez v4, :L7
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->access$1800(Lcom/innioasis/ipp/Bar;)Z
    move-result v4
    if-nez v4, :L7
    invoke-static { v1, v2, v3 }, Lcom/innioasis/ipp/Bar;->access$1900(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;I)J
    move-result-wide v4
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->access$2000(Lcom/innioasis/ipp/Bar;)J
    move-result-wide v6
    cmp-long v8, v4, v6
    if-eqz v8, :L11
  :L7
  .line 1370
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Bar;->access$700(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v4
    if-eqz v4, :L8
    invoke-static { v1, v2, v3 }, Lcom/innioasis/ipp/Bar;->access$2100(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;I)Z
  :L8
  .line 1371
    invoke-static { v1, v2, v3 }, Lcom/innioasis/ipp/Bar;->access$2200(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;I)V
  .line 1372
    const/4 v4, 0
    const/4 v5, 0
  :L9
    invoke-virtual { v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v6
    if-ge v5, v6, :L10
    invoke-virtual { v2, v5 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v6
    invoke-static { v1, v6, v3 }, Lcom/innioasis/ipp/Bar;->access$2300(Lcom/innioasis/ipp/Bar;Landroid/view/View;I)V
    add-int/lit8 v5, v5, 1
    goto :L9
  :L10
  .line 1373
    invoke-static { v1, v2, v3 }, Lcom/innioasis/ipp/Bar;->access$2400(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;I)V
  .line 1374
    invoke-static { v1, v4 }, Lcom/innioasis/ipp/Bar;->access$1702(Lcom/innioasis/ipp/Bar;Z)Z
  .line 1375
    invoke-static { v1, v2, v3 }, Lcom/innioasis/ipp/Bar;->access$1900(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;I)J
    move-result-wide v4
    invoke-static { v1, v4, v5 }, Lcom/innioasis/ipp/Bar;->access$2002(Lcom/innioasis/ipp/Bar;J)J
  :L11
  .line 1377
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->access$1200(Lcom/innioasis/ipp/Bar;)Ljava/lang/ref/WeakReference;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v4
    if-eqz v4, :L12
  .line 1378
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->access$2500(Lcom/innioasis/ipp/Bar;)V
  .line 1379
    invoke-static { v1, v2, v3 }, Lcom/innioasis/ipp/Bar;->access$2600(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;I)V
  .line 1380
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Bar;->access$2700(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;)V
  :L12
  .line 1383
    goto :L15
  :L13
  .line 1357
    return v0
  :L14
  .line 1382
    move-exception v1
  :L15
  .line 1384
    return v0
.end method
