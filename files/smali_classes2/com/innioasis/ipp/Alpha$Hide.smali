.class final Lcom/innioasis/ipp/Alpha$Hide;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Alpha.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Alpha;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Hide"
.end annotation

.method constructor <init>()V
  .registers 1
  .line 570
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public run()V
  .registers 4
  .line 572
    const/4 v0, 0
    invoke-static { v0 }, Lcom/innioasis/ipp/Alpha;->access$102(I)I
  .line 573
    invoke-static { v0 }, Lcom/innioasis/ipp/Alpha;->access$202(Z)Z
  .line 574
    invoke-static { }, Lcom/innioasis/ipp/Alpha;->access$300()Ljava/lang/ref/WeakReference;
    move-result-object v0
    const/4 v1, 0
    if-nez v0, :L0
    move-object v0, v1
    goto :L1
  :L0
    invoke-static { }, Lcom/innioasis/ipp/Alpha;->access$300()Ljava/lang/ref/WeakReference;
    move-result-object v0
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
  :L1
  .line 575
    instance-of v2, v0, Landroid/widget/TextView;
    if-nez v2, :L2
    return-void
  :L2
  .line 576
    check-cast v0, Landroid/widget/TextView;
  .line 577
    const/16 v2, 8
    invoke-virtual { v0, v2 }, Landroid/widget/TextView;->setVisibility(I)V
  .line 578
    invoke-virtual { v0 }, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;
    move-result-object v2
    instance-of v2, v2, Landroid/view/ViewGroup;
    if-eqz v2, :L3
    invoke-virtual { v0 }, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;
    move-result-object v2
    check-cast v2, Landroid/view/ViewGroup;
    goto :L4
  :L3
    move-object v2, v1
  :L4
  .line 579
    if-eqz v2, :L5
    invoke-virtual { v2, v0 }, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V
  :L5
  .line 580
    invoke-static { v1 }, Lcom/innioasis/ipp/Alpha;->access$302(Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
  .line 581
    return-void
.end method
