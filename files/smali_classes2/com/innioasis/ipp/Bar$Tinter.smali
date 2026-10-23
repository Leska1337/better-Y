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
  .line 956
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 957
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Bar$Tinter;->bar:Ljava/lang/ref/WeakReference;
  .line 958
    return-void
.end method

.method public onPreDraw()Z
  .catchall { :L0 .. :L10 } :L12
  .registers 7
  .line 962
    const/4 v0, 1
  :L0
    iget-object v1, p0, Lcom/innioasis/ipp/Bar$Tinter;->bar:Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/ipp/Bar;
  .line 963
    if-nez v1, :L1
    const/4 v2, 0
    goto :L2
  :L1
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->access$100(Lcom/innioasis/ipp/Bar;)Ljava/lang/ref/WeakReference;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Landroidx/recyclerview/widget/RecyclerView;
  :L2
  .line 964
    if-eqz v2, :L11
    invoke-static { v2 }, Lcom/innioasis/ipp/Bar;->access$900(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v3
    if-nez v3, :L3
    goto :L11
  :L3
  .line 966
    invoke-virtual { v2 }, Landroidx/recyclerview/widget/RecyclerView;->isShown()Z
    move-result v3
    if-nez v3, :L4
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->access$1000(Lcom/innioasis/ipp/Bar;)Ljava/lang/ref/WeakReference;
    move-result-object v3
    invoke-virtual { v3 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v3
    if-nez v3, :L4
    return v0
  :L4
  .line 967
    invoke-virtual { v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v3
    if-nez v3, :L6
  .line 969
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->access$1100(Lcom/innioasis/ipp/Bar;)Z
    move-result v2
    if-nez v2, :L5
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->access$1200(Lcom/innioasis/ipp/Bar;)V
  :L5
  .line 970
    return v0
  :L6
  .line 972
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->access$1300(Lcom/innioasis/ipp/Bar;)V
  .line 973
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Bar;->access$1400(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;)I
    move-result v3
  .line 974
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Bar;->access$500(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v4
    if-eqz v4, :L7
    invoke-static { v1, v2, v3 }, Lcom/innioasis/ipp/Bar;->access$1500(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;I)Z
  :L7
  .line 975
    invoke-static { v1, v2, v3 }, Lcom/innioasis/ipp/Bar;->access$1600(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;I)V
  .line 976
    const/4 v4, 0
  :L8
    invoke-virtual { v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v5
    if-ge v4, v5, :L9
    invoke-virtual { v2, v4 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v5
    invoke-static { v1, v5, v3 }, Lcom/innioasis/ipp/Bar;->access$1700(Lcom/innioasis/ipp/Bar;Landroid/view/View;I)V
    add-int/lit8 v4, v4, 1
    goto :L8
  :L9
  .line 977
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->access$1000(Lcom/innioasis/ipp/Bar;)Ljava/lang/ref/WeakReference;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v4
    if-eqz v4, :L10
  .line 978
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->access$1800(Lcom/innioasis/ipp/Bar;)V
  .line 979
    invoke-static { v1, v2, v3 }, Lcom/innioasis/ipp/Bar;->access$1900(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;I)V
  .line 980
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Bar;->access$2000(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;)V
  :L10
  .line 983
    goto :L13
  :L11
  .line 964
    return v0
  :L12
  .line 982
    move-exception v1
  :L13
  .line 984
    return v0
.end method
