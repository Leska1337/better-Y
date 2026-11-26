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
  .line 1123
    invoke-direct { p0 }, Landroid/graphics/drawable/Drawable;-><init>()V
  .line 1124
    new-instance v0, Ljava/lang/ref/WeakReference;
    invoke-direct { v0, p1 }, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V
    iput-object v0, p0, Lcom/innioasis/ipp/Bar$HeadPaint;->bar:Ljava/lang/ref/WeakReference;
  .line 1125
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
  .catchall { :L0 .. :L7 } :L10
  .registers 8
  :L0
  .line 1129
    iget-object v0, p0, Lcom/innioasis/ipp/Bar$HeadPaint;->bar:Ljava/lang/ref/WeakReference;
    invoke-virtual { v0 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Lcom/innioasis/ipp/Bar;
  .line 1130
    if-nez v0, :L1
    return-void
  :L1
  .line 1131
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Bar$HeadPaint;->getBounds()Landroid/graphics/Rect;
    move-result-object v1
  .line 1132
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->access$200(Lcom/innioasis/ipp/Bar;)Landroid/view/View;
    move-result-object v2
    invoke-virtual { v2 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v2
  .line 1133
    if-eqz v2, :L2
  .line 1134
    invoke-virtual { v2, v1 }, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V
  .line 1135
    invoke-virtual { v2, p1 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
  :L2
  .line 1137
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->access$300(Lcom/innioasis/ipp/Bar;)Ljava/lang/ref/WeakReference;
    move-result-object v2
    invoke-virtual { v2 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
    move-result-object v2
    check-cast v2, Landroidx/recyclerview/widget/RecyclerView;
  .line 1138
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->access$400(Lcom/innioasis/ipp/Bar;)Landroid/view/View;
    move-result-object v3
  .line 1139
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->access$500(Lcom/innioasis/ipp/Bar;)Landroid/view/View;
    move-result-object v4
    invoke-virtual { v4 }, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;
    move-result-object v4
  .line 1140
    if-eqz v2, :L9
    if-eqz v3, :L9
    if-eqz v4, :L9
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->access$600(Lcom/innioasis/ipp/Bar;)F
    move-result v5
    invoke-static { v5 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v5
    if-nez v5, :L9
    invoke-static { v0, v2 }, Lcom/innioasis/ipp/Bar;->access$700(Lcom/innioasis/ipp/Bar;Landroidx/recyclerview/widget/RecyclerView;)Z
    move-result v5
    if-eqz v5, :L9
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->access$800(Lcom/innioasis/ipp/Bar;)Z
    move-result v5
    if-eqz v5, :L3
    goto :L9
  :L3
  .line 1141
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->access$600(Lcom/innioasis/ipp/Bar;)F
    move-result v5
    invoke-static { v5 }, Ljava/lang/Math;->round(F)I
    move-result v5
    invoke-static { v2, v3 }, Lcom/innioasis/ipp/Bar;->access$900(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;)I
    move-result v2
    sub-int/2addr v5, v2
  .line 1142
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->access$1000(Lcom/innioasis/ipp/Bar;)F
    move-result v2
    invoke-static { v2 }, Ljava/lang/Float;->isNaN(F)Z
    move-result v2
    if-eqz v2, :L4
    invoke-virtual { v3 }, Landroid/view/View;->getHeight()I
    move-result v0
    int-to-float v0, v0
    goto :L5
  :L4
    invoke-static { v0 }, Lcom/innioasis/ipp/Bar;->access$1000(Lcom/innioasis/ipp/Bar;)F
    move-result v0
  :L5
    invoke-static { v0 }, Ljava/lang/Math;->round(F)I
    move-result v0
  .line 1143
    iget v2, v1, Landroid/graphics/Rect;->bottom:I
    if-ge v5, v2, :L8
    add-int/2addr v0, v5
    iget v2, v1, Landroid/graphics/Rect;->top:I
    if-gt v0, v2, :L6
    goto :L8
  :L6
  .line 1144
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->save()I
  .line 1145
    invoke-virtual { p1, v1 }, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z
  .line 1146
    iget v2, v1, Landroid/graphics/Rect;->left:I
    iget v1, v1, Landroid/graphics/Rect;->right:I
    invoke-virtual { v4, v2, v5, v1, v0 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 1147
    invoke-virtual { v4, p1 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
  .line 1148
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->restore()V
  :L7
  .line 1150
    goto :L11
  :L8
  .line 1143
    return-void
  :L9
  .line 1140
    return-void
  :L10
  .line 1149
    move-exception p1
  :L11
  .line 1151
    return-void
.end method

.method public getOpacity()I
  .registers 2
  .line 1160
    const/4 v0, -3
    return v0
.end method

.method public setAlpha(I)V
  .registers 2
  .line 1154
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
  .registers 2
  .line 1157
    return-void
.end method
