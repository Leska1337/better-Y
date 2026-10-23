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

.field private spare:Landroid/graphics/drawable/BitmapDrawable;

.field private top:I

.method constructor <init>(Landroid/graphics/drawable/Drawable;)V
  .registers 2
  .line 583
    invoke-direct { p0 }, Landroid/graphics/drawable/Drawable;-><init>()V
  .line 584
    iput-object p1, p0, Lcom/innioasis/ipp/Rows$Flat;->d:Landroid/graphics/drawable/Drawable;
  .line 585
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
  .registers 3
  .line 620
    iget-object v0, p0, Lcom/innioasis/ipp/Rows$Flat;->d:Landroid/graphics/drawable/Drawable;
    invoke-virtual { v0, p1 }, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V
  .line 621
    return-void
.end method

.method public getIntrinsicHeight()I
  .registers 2
  .line 644
    const/4 v0, -1
    return v0
.end method

.method public getIntrinsicWidth()I
  .registers 2
  .line 640
    const/4 v0, -1
    return v0
.end method

.method public getOpacity()I
  .registers 2
  .line 636
    iget-object v0, p0, Lcom/innioasis/ipp/Rows$Flat;->d:Landroid/graphics/drawable/Drawable;
    invoke-virtual { v0 }, Landroid/graphics/drawable/Drawable;->getOpacity()I
    move-result v0
    return v0
.end method

.method holds(Landroid/graphics/Bitmap;)Z
  .registers 4
  .line 592
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

.method inner()Landroid/graphics/drawable/Drawable;
  .registers 2
  .line 588
    iget-object v0, p0, Lcom/innioasis/ipp/Rows$Flat;->d:Landroid/graphics/drawable/Drawable;
    return-object v0
.end method

.method inset(I)V
  .registers 3
  .line 613
    iget v0, p0, Lcom/innioasis/ipp/Rows$Flat;->top:I
    if-ne p1, v0, :L0
    return-void
  :L0
  .line 614
    iput p1, p0, Lcom/innioasis/ipp/Rows$Flat;->top:I
  .line 615
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Rows$Flat;->getBounds()Landroid/graphics/Rect;
    move-result-object p1
    invoke-virtual { p0, p1 }, Lcom/innioasis/ipp/Rows$Flat;->onBoundsChange(Landroid/graphics/Rect;)V
  .line 616
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Rows$Flat;->invalidateSelf()V
  .line 617
    return-void
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
  .registers 6
  .line 624
    iget-object v0, p0, Lcom/innioasis/ipp/Rows$Flat;->d:Landroid/graphics/drawable/Drawable;
    iget v1, p1, Landroid/graphics/Rect;->left:I
    iget v2, p1, Landroid/graphics/Rect;->top:I
    iget v3, p0, Lcom/innioasis/ipp/Rows$Flat;->top:I
    add-int/2addr v2, v3
    iget v3, p1, Landroid/graphics/Rect;->right:I
    iget p1, p1, Landroid/graphics/Rect;->bottom:I
    invoke-virtual { v0, v1, v2, v3, p1 }, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V
  .line 625
    return-void
.end method

.method public setAlpha(I)V
  .registers 3
  .line 628
    iget-object v0, p0, Lcom/innioasis/ipp/Rows$Flat;->d:Landroid/graphics/drawable/Drawable;
    invoke-virtual { v0, p1 }, Landroid/graphics/drawable/Drawable;->setAlpha(I)V
  .line 629
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
  .registers 3
  .line 632
    iget-object v0, p0, Lcom/innioasis/ipp/Rows$Flat;->d:Landroid/graphics/drawable/Drawable;
    invoke-virtual { v0, p1 }, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V
  .line 633
    return-void
.end method

.method spareFor(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/BitmapDrawable;
  .registers 3
  .line 599
    iget-object v0, p0, Lcom/innioasis/ipp/Rows$Flat;->spare:Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v0, :L0
    invoke-virtual { v0 }, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;
    move-result-object v0
    if-ne v0, p1, :L0
    iget-object p1, p0, Lcom/innioasis/ipp/Rows$Flat;->spare:Landroid/graphics/drawable/BitmapDrawable;
    goto :L1
  :L0
    const/4 p1, 0
  :L1
    return-object p1
.end method

.method swap(Landroid/graphics/drawable/Drawable;I)V
  .registers 5
  .line 604
    iget-object v0, p0, Lcom/innioasis/ipp/Rows$Flat;->d:Landroid/graphics/drawable/Drawable;
    instance-of v1, v0, Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v1, :L0
    if-eq v0, p1, :L0
    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;
    iput-object v0, p0, Lcom/innioasis/ipp/Rows$Flat;->spare:Landroid/graphics/drawable/BitmapDrawable;
  :L0
  .line 605
    iput-object p1, p0, Lcom/innioasis/ipp/Rows$Flat;->d:Landroid/graphics/drawable/Drawable;
  .line 606
    iput p2, p0, Lcom/innioasis/ipp/Rows$Flat;->res:I
  .line 607
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Rows$Flat;->getBounds()Landroid/graphics/Rect;
    move-result-object p1
    invoke-virtual { p0, p1 }, Lcom/innioasis/ipp/Rows$Flat;->onBoundsChange(Landroid/graphics/Rect;)V
  .line 608
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Rows$Flat;->invalidateSelf()V
  .line 609
    return-void
.end method
