.class final Lcom/innioasis/ipp/Disc$Bar;
.super Ljava/lang/Object;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;
.implements Ljava/lang/Runnable;
.source "Disc.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Disc;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Bar"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 586
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public onPreDraw()Z
  .registers 2
  .line 588
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Disc$Bar;->run()V
  .line 589
    const/4 v0, 1
    return v0
.end method

.method public run()V
  .registers 4
  .line 593
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Disc;->access$102(Z)Z
  .line 597
    invoke-static { }, Lcom/innioasis/ipp/Disc;->access$200()Ljava/lang/ref/WeakReference;
    move-result-object v0
    const/4 v1, 0
    if-nez v0, :L0
    move-object v0, v1
    goto :L1
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Disc;->access$200()Ljava/lang/ref/WeakReference;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L1
  .line 598
    invoke-static { v1 }, Lcom/innioasis/ipp/Disc;->access$202(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
  .line 599
    instance-of v2, v0, Landroid/view/View;
    if-eqz v2, :L2
  .line 600
    check-cast v0, Landroid/view/View;
    invoke-virtual { v0 }, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;
    move-result-object v0
  .line 601
    if-eqz v0, :L2
    invoke-virtual { v0 }, Landroid/view/ViewTreeObserver;->isAlive()Z
    move-result v2
    if-eqz v2, :L2
    invoke-virtual { v0, p0 }, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V
  :L2
  .line 603
    invoke-static { }, Lcom/innioasis/ipp/Disc;->access$300()Ljava/lang/ref/WeakReference;
    move-result-object v0
    if-nez v0, :L3
    goto :L4
  :L3
    invoke-static { }, Lcom/innioasis/ipp/Disc;->access$300()Ljava/lang/ref/WeakReference;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v1
  :L4
  .line 604
    instance-of v0, v1, Landroid/widget/ListView;
    if-eqz v0, :L5
    check-cast v1, Landroid/widget/ListView;
    invoke-static { v1 }, Lcom/innioasis/ipp/Disc;->access$400(Landroid/widget/ListView;)Ljava/lang/String;
    move-result-object v0
    invoke-static { v1, v0 }, Lcom/innioasis/ipp/Disc;->access$500(Landroid/widget/ListView;Ljava/lang/String;)V
  :L5
  .line 605
    return-void
.end method
