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
  .line 682
    invoke-direct { p0 }, Landroid/graphics/drawable/Drawable;-><init>()V
  .line 683
    iput-object p1, p0, Lcom/innioasis/ipp/Rows$Flat;->d:Landroid/graphics/drawable/Drawable;
  .line 684
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
  .registers 3
  .line 711
    iget-object v0, p0, Lcom/innioasis/ipp/Rows$Flat;->d:Landroid/graphics/drawable/Drawable;
    invoke-virtual { v0, p1 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
  .line 712
    return-void
.end method

.method public getIntrinsicHeight()I
  .registers 2
  .line 735
    const/4 v0, -1
    return v0
.end method

.method public getIntrinsicWidth()I
  .registers 2
  .line 731
    const/4 v0, -1
    return v0
.end method

.method public getOpacity()I
  .registers 2
  .line 727
    iget-object v0, p0, Lcom/innioasis/ipp/Rows$Flat;->d:Landroid/graphics/drawable/Drawable;
    invoke-virtual { v0 }, Landroid/graphics/drawable/Drawable;->getOpacity()I
    move-result v0
    return v0
.end method

.method holds(Landroid/graphics/Bitmap;)Z
  .registers 4
  .line 687
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
  .line 704
    iget v0, p0, Lcom/innioasis/ipp/Rows$Flat;->top:I
    if-ne p1, v0, :L0
    return-void
  :L0
  .line 705
    iput p1, p0, Lcom/innioasis/ipp/Rows$Flat;->top:I
  .line 706
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Rows$Flat;->getBounds()Landroid/graphics/Rect;
    move-result-object p1
    invoke-virtual { p0, p1 }, Lcom/innioasis/ipp/Rows$Flat;->onBoundsChange(Landroid/graphics/Rect;)V
  .line 707
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Rows$Flat;->invalidateSelf()V
  .line 708
    return-void
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
  .registers 6
  .line 715
    iget-object v0, p0, Lcom/innioasis/ipp/Rows$Flat;->d:Landroid/graphics/drawable/Drawable;
    iget v1, p1, Landroid/graphics/Rect;->left:I
    iget v2, p1, Landroid/graphics/Rect;->top:I
    iget v3, p0, Lcom/innioasis/ipp/Rows$Flat;->top:I
    add-int/2addr v2, v3
    iget v3, p1, Landroid/graphics/Rect;->right:I
    iget p1, p1, Landroid/graphics/Rect;->bottom:I
    invoke-virtual { v0, v1, v2, v3, p1 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 716
    return-void
.end method

.method public setAlpha(I)V
  .registers 3
  .line 719
    iget-object v0, p0, Lcom/innioasis/ipp/Rows$Flat;->d:Landroid/graphics/drawable/Drawable;
    invoke-virtual { v0, p1 }, Landroid/graphics/drawable/Drawable;->setAlpha(I)V
  .line 720
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
  .registers 3
  .line 723
    iget-object v0, p0, Lcom/innioasis/ipp/Rows$Flat;->d:Landroid/graphics/drawable/Drawable;
    invoke-virtual { v0, p1 }, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V
  .line 724
    return-void
.end method

.method swap(Landroid/graphics/drawable/Drawable;I)V
  .registers 3
  .line 696
    iput-object p1, p0, Lcom/innioasis/ipp/Rows$Flat;->d:Landroid/graphics/drawable/Drawable;
  .line 697
    iput p2, p0, Lcom/innioasis/ipp/Rows$Flat;->res:I
  .line 698
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Rows$Flat;->getBounds()Landroid/graphics/Rect;
    move-result-object p1
    invoke-virtual { p0, p1 }, Lcom/innioasis/ipp/Rows$Flat;->onBoundsChange(Landroid/graphics/Rect;)V
  .line 699
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Rows$Flat;->invalidateSelf()V
  .line 700
    return-void
.end method
