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
  .line 1304
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 1305
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Bar$Tinter;->bar:Ljava/lang/ref/WeakReference;
  .line 1306
    return-void
.end method

.method public onPreDraw()Z
  .catchall { :L0 .. :L10 } :L12
  .registers 7
  .line 1310
    const/4 v0, 1
  :L0
    iget-object v1, p0, Lcom/innioasis/ipp/Bar$Tinter;->bar:Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/ipp/Bar;
  .line 1311
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
  .line 1312
    if-eqz v2, :L11
    invoke-static { v2 }, Lcom/innioasis/ipp/Bar;->access$1100(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v3
    if-nez v3, :L3
    goto :L11
  :L3
  .line 1314
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
  .line 1315
    invoke-virtual { v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v3
    if-nez v3, :L6
  .line 1317
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->access$1300(Lcom/innioasis/ipp/Bar;)Z
    move-result v2
    if-nez v2, :L5
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->access$1400(Lcom/innioasis/ipp/Bar;)V
  :L5
  .line 1318
    return v0
  :L6
  .line 1320
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->access$1500(Lcom/innioasis/ipp/Bar;)V
  .line 1321
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Bar;->access$1600(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;)I
    move-result v3
  .line 1322
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Bar;->access$700(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v4
    if-eqz v4, :L7
    invoke-static { v1, v2, v3 }, Lcom/innioasis/ipp/Bar;->access$1700(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;I)Z
  :L7
  .line 1323
    invoke-static { v1, v2, v3 }, Lcom/innioasis/ipp/Bar;->access$1800(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;I)V
  .line 1324
    const/4 v4, 0
  :L8
    invoke-virtual { v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v5
    if-ge v4, v5, :L9
    invoke-virtual { v2, v4 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v5
    invoke-static { v1, v5, v3 }, Lcom/innioasis/ipp/Bar;->access$1900(Lcom/innioasis/ipp/Bar;Landroid/view/View;I)V
    add-int/lit8 v4, v4, 1
    goto :L8
  :L9
  .line 1325
    invoke-static { v1, v2, v3 }, Lcom/innioasis/ipp/Bar;->access$2000(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;I)V
  .line 1326
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->access$1200(Lcom/innioasis/ipp/Bar;)Ljava/lang/ref/WeakReference;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v4
    if-eqz v4, :L10
  .line 1327
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->access$2100(Lcom/innioasis/ipp/Bar;)V
  .line 1328
    invoke-static { v1, v2, v3 }, Lcom/innioasis/ipp/Bar;->access$2200(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;I)V
  .line 1329
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Bar;->access$2300(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;)V
  :L10
  .line 1332
    goto :L13
  :L11
  .line 1312
    return v0
  :L12
  .line 1331
    move-exception v1
  :L13
  .line 1333
    return v0
.end method
