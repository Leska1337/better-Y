.class final Lcom/innioasis/ipp/Rows$Flat;
.super Landroid/graphics/drawable/Drawable;
.source "Rows.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Rows;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Flat"
.end annotation

.field private d:Landroid/graphics/drawable/Drawable;

.field res:I

.field private top:I

.method constructor <init>(Landroid/graphics/drawable/Drawable;)V
  .registers 2
  .line 788
    invoke-direct { p0 }, Landroid/graphics/drawable/Drawable;-><init>()V
  .line 789
    iput-object p1, p0, Lcom/innioasis/ipp/Rows$Flat;->d:Landroid/graphics/drawable/Drawable;
  .line 790
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
  .registers 3
  .line 817
    iget-object v0, p0, Lcom/innioasis/ipp/Rows$Flat;->d:Landroid/graphics/drawable/Drawable;
    invoke-virtual { v0, p1 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
  .line 818
    return-void
.end method

.method public getIntrinsicHeight()I
  .registers 2
  .line 841
    const/4 v0, -1
    return v0
.end method

.method public getIntrinsicWidth()I
  .registers 2
  .line 837
    const/4 v0, -1
    return v0
.end method

.method public getOpacity()I
  .registers 2
  .line 833
    iget-object v0, p0, Lcom/innioasis/ipp/Rows$Flat;->d:Landroid/graphics/drawable/Drawable;
    invoke-virtual { v0 }, Landroid/graphics/drawable/Drawable;->getOpacity()I
    move-result v0
    return v0
.end method

.method holds(Landroid/graphics/Bitmap;)Z
  .registers 4
  .line 793
    iget-object v0, p0, Lcom/innioasis/ipp/Rows$Flat;->d:Landroid/graphics/drawable/Drawable;
    instance-of v1, v0, Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v1, :L0
    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual { v0 }, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;
    move-result-object v0
    if-ne v0, p1, :L0
    const/4 p1, 1
    goto :L1
  :L0
    const/4 p1, 0
  :L1
    return p1
.end method

.method inset(I)V
  .registers 3
  .line 810
    iget v0, p0, Lcom/innioasis/ipp/Rows$Flat;->top:I
    if-ne p1, v0, :L0
    return-void
  :L0
  .line 811
    iput p1, p0, Lcom/innioasis/ipp/Rows$Flat;->top:I
  .line 812
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Rows$Flat;->getBounds()Landroid/graphics/Rect;
    move-result-object p1
    invoke-virtual { p0, p1 }, Lcom/innioasis/ipp/Rows$Flat;->onBoundsChange(Landroid/graphics/Rect;)V
  .line 813
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Rows$Flat;->invalidateSelf()V
  .line 814
    return-void
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
  .registers 6
  .line 821
    iget-object v0, p0, Lcom/innioasis/ipp/Rows$Flat;->d:Landroid/graphics/drawable/Drawable;
    iget v1, p1, Landroid/graphics/Rect;->left:I
    iget v2, p1, Landroid/graphics/Rect;->top:I
    iget v3, p0, Lcom/innioasis/ipp/Rows$Flat;->top:I
    add-int/2addr v2, v3
    iget v3, p1, Landroid/graphics/Rect;->right:I
    iget p1, p1, Landroid/graphics/Rect;->bottom:I
    invoke-virtual { v0, v1, v2, v3, p1 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 822
    return-void
.end method

.method public setAlpha(I)V
  .registers 3
  .line 825
    iget-object v0, p0, Lcom/innioasis/ipp/Rows$Flat;->d:Landroid/graphics/drawable/Drawable;
    invoke-virtual { v0, p1 }, Landroid/graphics/drawable/Drawable;->setAlpha(I)V
  .line 826
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
  .registers 3
  .line 829
    iget-object v0, p0, Lcom/innioasis/ipp/Rows$Flat;->d:Landroid/graphics/drawable/Drawable;
    invoke-virtual { v0, p1 }, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V
  .line 830
    return-void
.end method

.method swap(Landroid/graphics/drawable/Drawable;I)V
  .registers 3
  .line 802
    iput-object p1, p0, Lcom/innioasis/ipp/Rows$Flat;->d:Landroid/graphics/drawable/Drawable;
  .line 803
    iput p2, p0, Lcom/innioasis/ipp/Rows$Flat;->res:I
  .line 804
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Rows$Flat;->getBounds()Landroid/graphics/Rect;
    move-result-object p1
    invoke-virtual { p0, p1 }, Lcom/innioasis/ipp/Rows$Flat;->onBoundsChange(Landroid/graphics/Rect;)V
  .line 805
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Rows$Flat;->invalidateSelf()V
  .line 806
    return-void
.end method
