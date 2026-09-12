.class final Lcom/innioasis/ipp/Photos$Ends;
.super Landroid/graphics/drawable/Drawable;
.source "Photos.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Photos;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Ends"
.end annotation

.field private final b:Landroid/graphics/Bitmap;

.field private final dst:Landroid/graphics/Rect;

.field private final p:Landroid/graphics/Paint;

.field private final src:Landroid/graphics/Rect;

.method constructor <init>(Landroid/graphics/Bitmap;)V
  .registers 4
  .line 246
    invoke-direct { p0 }, Landroid/graphics/drawable/Drawable;-><init>()V
  .line 242
    new-instance v0, Landroid/graphics/Paint;
    const/4 v1, 2
    invoke-direct { v0, v1 }, Landroid/graphics/Paint;-><init>(I)V
    iput-object v0, p0, Lcom/innioasis/ipp/Photos$Ends;->p:Landroid/graphics/Paint;
  .line 243
    new-instance v0, Landroid/graphics/Rect;
    invoke-direct { v0 }, Landroid/graphics/Rect;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Photos$Ends;->src:Landroid/graphics/Rect;
  .line 244
    new-instance v0, Landroid/graphics/Rect;
    invoke-direct { v0 }, Landroid/graphics/Rect;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Photos$Ends;->dst:Landroid/graphics/Rect;
  .line 247
    iput-object p1, p0, Lcom/innioasis/ipp/Photos$Ends;->b:Landroid/graphics/Bitmap;
  .line 248
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
  .registers 12
  .line 251
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Photos$Ends;->getBounds()Landroid/graphics/Rect;
    move-result-object v0
  .line 252
    invoke-virtual { v0 }, Landroid/graphics/Rect;->width()I
    move-result v1
  .line 253
    invoke-virtual { v0 }, Landroid/graphics/Rect;->height()I
    move-result v2
  .line 254
    iget-object v3, p0, Lcom/innioasis/ipp/Photos$Ends;->b:Landroid/graphics/Bitmap;
    invoke-virtual { v3 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v3
  .line 255
    iget-object v4, p0, Lcom/innioasis/ipp/Photos$Ends;->b:Landroid/graphics/Bitmap;
    invoke-virtual { v4 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v4
  .line 256
    if-lez v1, :L2
    if-lez v2, :L2
    if-lez v3, :L2
    if-lez v4, :L2
    iget-object v5, p0, Lcom/innioasis/ipp/Photos$Ends;->b:Landroid/graphics/Bitmap;
    invoke-virtual { v5 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v5
    if-eqz v5, :L0
    goto :L2
  :L0
  .line 257
    iget v5, v0, Landroid/graphics/Rect;->left:I
    div-int/lit8 v1, v1, 2
    add-int/2addr v5, v1
  .line 258
    iget v1, v0, Landroid/graphics/Rect;->left:I
    sub-int v1, v5, v1
    mul-int v1, v1, v4
    int-to-float v1, v1
    int-to-float v2, v2
    div-float/2addr v1, v2
    float-to-int v1, v1
  .line 259
    mul-int/lit8 v6, v1, 2
    if-lt v6, v3, :L1
  .line 260
    iget-object v1, p0, Lcom/innioasis/ipp/Photos$Ends;->b:Landroid/graphics/Bitmap;
    const/4 v2, 0
    iget-object v3, p0, Lcom/innioasis/ipp/Photos$Ends;->p:Landroid/graphics/Paint;
    invoke-virtual { p1, v1, v2, v0, v3 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 261
    return-void
  :L1
  .line 263
    iget-object v6, p0, Lcom/innioasis/ipp/Photos$Ends;->src:Landroid/graphics/Rect;
    const/4 v7, 0
    invoke-virtual { v6, v7, v7, v1, v4 }, Landroid/graphics/Rect;->set(IIII)V
  .line 264
    iget-object v1, p0, Lcom/innioasis/ipp/Photos$Ends;->dst:Landroid/graphics/Rect;
    iget v6, v0, Landroid/graphics/Rect;->left:I
    iget v8, v0, Landroid/graphics/Rect;->top:I
    iget v9, v0, Landroid/graphics/Rect;->bottom:I
    invoke-virtual { v1, v6, v8, v5, v9 }, Landroid/graphics/Rect;->set(IIII)V
  .line 265
    iget-object v1, p0, Lcom/innioasis/ipp/Photos$Ends;->b:Landroid/graphics/Bitmap;
    iget-object v6, p0, Lcom/innioasis/ipp/Photos$Ends;->src:Landroid/graphics/Rect;
    iget-object v8, p0, Lcom/innioasis/ipp/Photos$Ends;->dst:Landroid/graphics/Rect;
    iget-object v9, p0, Lcom/innioasis/ipp/Photos$Ends;->p:Landroid/graphics/Paint;
    invoke-virtual { p1, v1, v6, v8, v9 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 266
    iget v1, v0, Landroid/graphics/Rect;->right:I
    sub-int/2addr v1, v5
    mul-int v1, v1, v4
    int-to-float v1, v1
    div-float/2addr v1, v2
    float-to-int v1, v1
  .line 267
    iget-object v2, p0, Lcom/innioasis/ipp/Photos$Ends;->src:Landroid/graphics/Rect;
    sub-int v1, v3, v1
    invoke-virtual { v2, v1, v7, v3, v4 }, Landroid/graphics/Rect;->set(IIII)V
  .line 268
    iget-object v1, p0, Lcom/innioasis/ipp/Photos$Ends;->dst:Landroid/graphics/Rect;
    iget v2, v0, Landroid/graphics/Rect;->top:I
    iget v3, v0, Landroid/graphics/Rect;->right:I
    iget v0, v0, Landroid/graphics/Rect;->bottom:I
    invoke-virtual { v1, v5, v2, v3, v0 }, Landroid/graphics/Rect;->set(IIII)V
  .line 269
    iget-object v0, p0, Lcom/innioasis/ipp/Photos$Ends;->b:Landroid/graphics/Bitmap;
    iget-object v1, p0, Lcom/innioasis/ipp/Photos$Ends;->src:Landroid/graphics/Rect;
    iget-object v2, p0, Lcom/innioasis/ipp/Photos$Ends;->dst:Landroid/graphics/Rect;
    iget-object v3, p0, Lcom/innioasis/ipp/Photos$Ends;->p:Landroid/graphics/Paint;
    invoke-virtual { p1, v0, v1, v2, v3 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 270
    return-void
  :L2
  .line 256
    return-void
.end method

.method public getOpacity()I
  .registers 2
  .line 281
    const/4 v0, -3
    return v0
.end method

.method public setAlpha(I)V
  .registers 3
  .line 273
    iget-object v0, p0, Lcom/innioasis/ipp/Photos$Ends;->p:Landroid/graphics/Paint;
    invoke-virtual { v0, p1 }, Landroid/graphics/Paint;->setAlpha(I)V
  .line 274
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
  .registers 3
  .line 277
    iget-object v0, p0, Lcom/innioasis/ipp/Photos$Ends;->p:Landroid/graphics/Paint;
    invoke-virtual { v0, p1 }, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;
  .line 278
    return-void
.end method
