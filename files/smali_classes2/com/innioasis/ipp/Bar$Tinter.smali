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
  .line 804
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
  .line 805
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Bar$Tinter;->bar:Ljava/lang/ref/WeakReference;
  .line 806
    return-void
.end method

.method public onPreDraw()Z
  .catchall { :L0 .. :L9 } :L11
  .registers 7
  .line 810
    const/4 v0, 1
  :L0
    iget-object v1, p0, Lcom/innioasis/ipp/Bar$Tinter;->bar:Ljava/lang/ref/WeakReference;
    invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/ipp/Bar;
  .line 811
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
  .line 812
    if-eqz v2, :L10
    invoke-static { v2 }, Lcom/innioasis/ipp/Bar;->access$900(Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v3
    if-nez v3, :L3
    goto :L10
  :L3
  .line 813
    invoke-virtual { v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v3
    if-nez v3, :L5
  .line 815
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->access$1000(Lcom/innioasis/ipp/Bar;)Z
    move-result v2
    if-eqz v2, :L4
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->access$1100(Lcom/innioasis/ipp/Bar;)V
  :L4
  .line 816
    return v0
  :L5
  .line 818
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->access$1200(Lcom/innioasis/ipp/Bar;)V
  .line 819
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Bar;->access$1300(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;)I
    move-result v3
  .line 820
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Bar;->access$500(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v4
    if-eqz v4, :L6
    invoke-static { v1, v2, v3 }, Lcom/innioasis/ipp/Bar;->access$1400(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;I)Z
  :L6
  .line 821
    const/4 v4, 0
  :L7
    invoke-virtual { v2 }, Landroidx/recyclerview/widget/RecyclerView;->getChildCount()I
    move-result v5
    if-ge v4, v5, :L8
    invoke-virtual { v2, v4 }, Landroidx/recyclerview/widget/RecyclerView;->getChildAt(I)Landroid/view/View;
    move-result-object v5
    invoke-static { v1, v5, v3 }, Lcom/innioasis/ipp/Bar;->access$1500(Lcom/innioasis/ipp/Bar;Landroid/view/View;I)V
    add-int/lit8 v4, v4, 1
    goto :L7
  :L8
  .line 822
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->access$1600(Lcom/innioasis/ipp/Bar;)Ljava/lang/ref/WeakReference;
    move-result-object v4
    invoke-virtual { v4 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v4
    if-eqz v4, :L9
  .line 823
    invoke-static { v1 }, Lcom/innioasis/ipp/Bar;->access$1700(Lcom/innioasis/ipp/Bar;)V
  .line 824
    invoke-static { v1, v2, v3 }, Lcom/innioasis/ipp/Bar;->access$1800(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;I)V
  .line 825
    invoke-static { v1, v2 }, Lcom/innioasis/ipp/Bar;->access$1900(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;)V
  :L9
  .line 828
    goto :L12
  :L10
  .line 812
    return v0
  :L11
  .line 827
    move-exception v1
  :L12
  .line 829
    return v0
.end method
