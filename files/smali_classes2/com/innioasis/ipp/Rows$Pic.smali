.class final Lcom/innioasis/ipp/Rows$Pic;
.super Landroid/graphics/drawable/Drawable;
.source "Rows.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Rows;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Pic"
.end annotation

.field b:Landroid/graphics/Bitmap;

.field density:I

.field private final paint:Landroid/graphics/Paint;

.method constructor <init>()V
  .registers 3
  .line 608
    invoke-direct { p0 }, Landroid/graphics/drawable/Drawable;-><init>()V
  .line 612
    new-instance v0, Landroid/graphics/Paint;
    const/4 v1, 6
    invoke-direct { v0, v1 }, Landroid/graphics/Paint;-><init>(I)V
    iput-object v0, p0, Lcom/innioasis/ipp/Rows$Pic;->paint:Landroid/graphics/Paint;
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
  .registers 6
  .line 615
    iget-object v0, p0, Lcom/innioasis/ipp/Rows$Pic;->b:Landroid/graphics/Bitmap;
  .line 616
    if-eqz v0, :L0
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v1
    if-nez v1, :L0
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Rows$Pic;->getBounds()Landroid/graphics/Rect;
    move-result-object v1
    iget-object v2, p0, Lcom/innioasis/ipp/Rows$Pic;->paint:Landroid/graphics/Paint;
    const/4 v3, 0
    invoke-virtual { p1, v0, v3, v1, v2 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  :L0
  .line 617
    return-void
.end method

.method public getIntrinsicHeight()I
  .registers 3
  .line 638
    iget-object v0, p0, Lcom/innioasis/ipp/Rows$Pic;->b:Landroid/graphics/Bitmap;
    if-nez v0, :L0
    const/4 v0, -1
    goto :L1
  :L0
    iget v1, p0, Lcom/innioasis/ipp/Rows$Pic;->density:I
    invoke-virtual { v0, v1 }, Landroid/graphics/Bitmap;->getScaledHeight(I)I
    move-result v0
  :L1
    return v0
.end method

.method public getIntrinsicWidth()I
  .registers 3
  .line 634
    iget-object v0, p0, Lcom/innioasis/ipp/Rows$Pic;->b:Landroid/graphics/Bitmap;
    if-nez v0, :L0
    const/4 v0, -1
    goto :L1
  :L0
    iget v1, p0, Lcom/innioasis/ipp/Rows$Pic;->density:I
    invoke-virtual { v0, v1 }, Landroid/graphics/Bitmap;->getScaledWidth(I)I
    move-result v0
  :L1
    return v0
.end method

.method public getOpacity()I
  .registers 2
  .line 630
    const/4 v0, -3
    return v0
.end method

.method public setAlpha(I)V
  .registers 3
  .line 620
    iget-object v0, p0, Lcom/innioasis/ipp/Rows$Pic;->paint:Landroid/graphics/Paint;
    invoke-virtual { v0, p1 }, Landroid/graphics/Paint;->setAlpha(I)V
  .line 621
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Rows$Pic;->invalidateSelf()V
  .line 622
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
  .registers 3
  .line 625
    iget-object v0, p0, Lcom/innioasis/ipp/Rows$Pic;->paint:Landroid/graphics/Paint;
    invoke-virtual { v0, p1 }, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;
  .line 626
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Rows$Pic;->invalidateSelf()V
  .line 627
    return-void
.end method
