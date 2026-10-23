.class final Lcom/innioasis/ipp/Bar$HeadPaint;
.super Landroid/graphics/drawable/Drawable;
.source "Bar.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Bar;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "HeadPaint"
.end annotation

.field private final bar:Ljava/lang/ref/WeakReference;

.method constructor <init>(Lcom/innioasis/ipp/Bar;)V
  .registers 3
  .line 888
    invoke-direct { p0 }, Landroid/graphics/drawable/Drawable;-><init>()V
  .line 889
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Bar$HeadPaint;->bar:Ljava/lang/ref/WeakReference;
  .line 890
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
  .catchall { :L0 .. :L7 } :L10
  .registers 8
  :L0
  .line 894
    iget-object v0, p0, Lcom/innioasis/ipp/Bar$HeadPaint;->bar:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/ipp/Bar;
  .line 895
    if-nez v0, :L1
    return-void
  :L1
  .line 896
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Bar$HeadPaint;->getBounds()Landroid/graphics/Rect;
    move-result-object v1
  .line 897
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->access$000(Lcom/innioasis/ipp/Bar;)Landroid/view/View;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v2
  .line 898
    if-eqz v2, :L2
  .line 899
    invoke-virtual { v2, v1 }, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V
  .line 900
    invoke-virtual { v2, p1 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
  :L2
  .line 902
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->access$100(Lcom/innioasis/ipp/Bar;)Ljava/lang/ref/WeakReference;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Landroidx/recyclerview/widget/RecyclerView;
  .line 903
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->access$200(Lcom/innioasis/ipp/Bar;)Landroid/view/View;
    move-result-object v3
  .line 904
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->access$300(Lcom/innioasis/ipp/Bar;)Landroid/view/View;
    move-result-object v4
    invoke-virtual { v4 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v4
  .line 905
    if-eqz v2, :L9
    if-eqz v3, :L9
    if-eqz v4, :L9
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->access$400(Lcom/innioasis/ipp/Bar;)F
    move-result v5
    invoke-static { v5 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v5
    if-nez v5, :L9
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Bar;->access$500(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v5
    if-eqz v5, :L9
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->access$600(Lcom/innioasis/ipp/Bar;)Z
    move-result v5
    if-eqz v5, :L3
    goto :L9
  :L3
  .line 906
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->access$400(Lcom/innioasis/ipp/Bar;)F
    move-result v5
    invoke-static { v5 }, Ljava/lang/Math;->round(F)I
    move-result v5
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Bar;->access$700(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;)I
    move-result v2
    sub-int/2addr v5, v2
  .line 907
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->access$800(Lcom/innioasis/ipp/Bar;)F
    move-result v2
    invoke-static { v2 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v2
    if-eqz v2, :L4
    invoke-virtual { v3 }, Landroid/view/View;->getHeight()I
    move-result v0
    int-to-float v0, v0
    goto :L5
  :L4
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->access$800(Lcom/innioasis/ipp/Bar;)F
    move-result v0
  :L5
    invoke-static { v0 }, Ljava/lang/Math;->round(F)I
    move-result v0
  .line 908
    iget v2, v1, Landroid/graphics/Rect;->bottom:I
    if-ge v5, v2, :L8
    add-int/2addr v0, v5
    iget v2, v1, Landroid/graphics/Rect;->top:I
    if-gt v0, v2, :L6
    goto :L8
  :L6
  .line 909
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->save()I
  .line 910
    invoke-virtual { p1, v1 }, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z
  .line 911
    iget v2, v1, Landroid/graphics/Rect;->left:I
    iget v1, v1, Landroid/graphics/Rect;->right:I
    invoke-virtual { v4, v2, v5, v1, v0 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 912
    invoke-virtual { v4, p1 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
  .line 913
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->restore()V
  :L7
  .line 915
    goto :L11
  :L8
  .line 908
    return-void
  :L9
  .line 905
    return-void
  :L10
  .line 914
    move-exception p1
  :L11
  .line 916
    return-void
.end method

.method public getOpacity()I
  .registers 2
  .line 925
    const/4 v0, -3
    return v0
.end method

.method public setAlpha(I)V
  .registers 2
  .line 919
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
  .registers 2
  .line 922
    return-void
.end method
