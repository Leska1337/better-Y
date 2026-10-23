.class final Lcom/innioasis/ipp/Fixed$Self;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "Fixed.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Fixed;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Self"
.end annotation

.field private final rv:Lcom/innioasis/ipp/Fixed;

.method constructor <init>(Lcom/innioasis/ipp/Fixed;)V
  .registers 2
  .line 92
    invoke-direct { p0 }, Ljava/lang/Object;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Fixed$Self;->rv:Lcom/innioasis/ipp/Fixed;
    return-void
.end method

.method public run()V
  .catchall { :L3 .. :L4 } :L5
  .registers 7
  .line 95
    iget-object v0, p0, Lcom/innioasis/ipp/Fixed$Self;->rv:Lcom/innioasis/ipp/Fixed;
    const/4 v1, 0
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Fixed;->access$002(Lcom/innioasis/ipp/Fixed;Z)Z
  .line 96
    iget-object v0, p0, Lcom/innioasis/ipp/Fixed$Self;->rv:Lcom/innioasis/ipp/Fixed;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Fixed;->isLayoutRequested()Z
    move-result v0
    if-nez v0, :L0
    return-void
  :L0
  .line 98
    iget-object v0, p0, Lcom/innioasis/ipp/Fixed$Self;->rv:Lcom/innioasis/ipp/Fixed;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Fixed;->getParent()Landroid/view/ViewParent;
    move-result-object v0
    if-eqz v0, :L1
    iget-object v0, p0, Lcom/innioasis/ipp/Fixed$Self;->rv:Lcom/innioasis/ipp/Fixed;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Fixed;->getParent()Landroid/view/ViewParent;
    move-result-object v0
    invoke-interface { v0 }, Landroid/view/ViewParent;->isLayoutRequested()Z
    move-result v0
    if-eqz v0, :L1
    return-void
  :L1
  .line 99
    iget-object v0, p0, Lcom/innioasis/ipp/Fixed$Self;->rv:Lcom/innioasis/ipp/Fixed;
    invoke-static { v0 }, Lcom/innioasis/ipp/Fixed;->access$100(Lcom/innioasis/ipp/Fixed;)Z
    move-result v0
    if-nez v0, :L2
  .line 100
    iget-object v0, p0, Lcom/innioasis/ipp/Fixed$Self;->rv:Lcom/innioasis/ipp/Fixed;
    invoke-static { v0 }, Lcom/innioasis/ipp/Fixed;->access$200(Lcom/innioasis/ipp/Fixed;)V
  .line 101
    return-void
  :L2
  .line 103
    iget-object v0, p0, Lcom/innioasis/ipp/Fixed$Self;->rv:Lcom/innioasis/ipp/Fixed;
    const/4 v2, 1
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Fixed;->access$302(Lcom/innioasis/ipp/Fixed;Z)Z
  :L3
  .line 105
    iget-object v0, p0, Lcom/innioasis/ipp/Fixed$Self;->rv:Lcom/innioasis/ipp/Fixed;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Fixed;->getWidth()I
    move-result v2
    const/high16 v3, 0x40000000
    invoke-static { v2, v3 }, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I
    move-result v2
    iget-object v4, p0, Lcom/innioasis/ipp/Fixed$Self;->rv:Lcom/innioasis/ipp/Fixed;
  .line 106
    invoke-virtual { v4 }, Lcom/innioasis/ipp/Fixed;->getHeight()I
    move-result v4
    invoke-static { v4, v3 }, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I
    move-result v3
  .line 105
    invoke-virtual { v0, v2, v3 }, Lcom/innioasis/ipp/Fixed;->measure(II)V
  .line 107
    iget-object v0, p0, Lcom/innioasis/ipp/Fixed$Self;->rv:Lcom/innioasis/ipp/Fixed;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Fixed;->getLeft()I
    move-result v2
    iget-object v3, p0, Lcom/innioasis/ipp/Fixed$Self;->rv:Lcom/innioasis/ipp/Fixed;
    invoke-virtual { v3 }, Lcom/innioasis/ipp/Fixed;->getTop()I
    move-result v3
    iget-object v4, p0, Lcom/innioasis/ipp/Fixed$Self;->rv:Lcom/innioasis/ipp/Fixed;
    invoke-virtual { v4 }, Lcom/innioasis/ipp/Fixed;->getRight()I
    move-result v4
    iget-object v5, p0, Lcom/innioasis/ipp/Fixed$Self;->rv:Lcom/innioasis/ipp/Fixed;
    invoke-virtual { v5 }, Lcom/innioasis/ipp/Fixed;->getBottom()I
    move-result v5
    invoke-virtual { v0, v2, v3, v4, v5 }, Lcom/innioasis/ipp/Fixed;->layout(IIII)V
  :L4
  .line 109
    iget-object v0, p0, Lcom/innioasis/ipp/Fixed$Self;->rv:Lcom/innioasis/ipp/Fixed;
    invoke-static { v0, v1 }, Lcom/innioasis/ipp/Fixed;->access$302(Lcom/innioasis/ipp/Fixed;Z)Z
  .line 110
    nop
  .line 111
    iget-object v0, p0, Lcom/innioasis/ipp/Fixed$Self;->rv:Lcom/innioasis/ipp/Fixed;
    invoke-virtual { v0 }, Lcom/innioasis/ipp/Fixed;->invalidate()V
  .line 112
    return-void
  :L5
  .line 109
    move-exception v0
    iget-object v2, p0, Lcom/innioasis/ipp/Fixed$Self;->rv:Lcom/innioasis/ipp/Fixed;
    invoke-static { v2, v1 }, Lcom/innioasis/ipp/Fixed;->access$302(Lcom/innioasis/ipp/Fixed;Z)Z
  .line 110
    throw v0
.end method
