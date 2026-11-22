.class final Lcom/innioasis/ipp/Ends$Sliced;
.super Landroid/graphics/drawable/BitmapDrawable;
.source "Ends.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Ends;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Sliced"
.end annotation

.field private final capL:I

.field private final capR:I

.field private final dst:Landroid/graphics/Rect;

.field res:I

.field private final src:Landroid/graphics/Rect;

.method constructor <init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;II)V
  .registers 5
  .line 139
    invoke-direct { p0, p1, p2 }, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
  .line 135
    new-instance p1, Landroid/graphics/Rect;
    invoke-direct { p1 }, Landroid/graphics/Rect;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Ends$Sliced;->src:Landroid/graphics/Rect;
  .line 136
    new-instance p1, Landroid/graphics/Rect;
    invoke-direct { p1 }, Landroid/graphics/Rect;-><init>()V
    iput-object p1, p0, Lcom/innioasis/ipp/Ends$Sliced;->dst:Landroid/graphics/Rect;
  .line 140
    iput p3, p0, Lcom/innioasis/ipp/Ends$Sliced;->capL:I
  .line 141
    iput p4, p0, Lcom/innioasis/ipp/Ends$Sliced;->capR:I
  .line 142
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
  .registers 14
  .line 146
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Ends$Sliced;->getBitmap()Landroid/graphics/Bitmap;
    move-result-object v0
  .line 147
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Ends$Sliced;->getBounds()Landroid/graphics/Rect;
    move-result-object v1
  .line 148
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result v2
  .line 149
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v3
  .line 150
    invoke-virtual { v1 }, Landroid/graphics/Rect;->height()I
    move-result v4
    if-lez v4, :L4
    if-gtz v3, :L0
    goto/16 :L4
  :L0
  .line 151
    invoke-virtual { v1 }, Landroid/graphics/Rect;->height()I
    move-result v4
    int-to-float v4, v4
    int-to-float v5, v3
    div-float/2addr v4, v5
  .line 152
    iget v5, p0, Lcom/innioasis/ipp/Ends$Sliced;->capL:I
    int-to-float v5, v5
    mul-float v5, v5, v4
    invoke-static { v5 }, Ljava/lang/Math;->round(F)I
    move-result v5
  .line 153
    iget v6, p0, Lcom/innioasis/ipp/Ends$Sliced;->capR:I
    int-to-float v6, v6
    mul-float v6, v6, v4
    invoke-static { v6 }, Ljava/lang/Math;->round(F)I
    move-result v4
  .line 155
    add-int v6, v5, v4
    invoke-virtual { v1 }, Landroid/graphics/Rect;->width()I
    move-result v7
    if-lt v6, v7, :L1
  .line 156
    invoke-super { p0, p1 }, Landroid/graphics/drawable/BitmapDrawable;->draw(Landroid/graphics/Canvas;)V
  .line 157
    return-void
  :L1
  .line 159
    iget v6, p0, Lcom/innioasis/ipp/Ends$Sliced;->capL:I
    const/4 v7, 0
    if-lez v6, :L2
  .line 160
    iget-object v8, p0, Lcom/innioasis/ipp/Ends$Sliced;->src:Landroid/graphics/Rect;
    invoke-virtual { v8, v7, v7, v6, v3 }, Landroid/graphics/Rect;->set(IIII)V
  .line 161
    iget-object v6, p0, Lcom/innioasis/ipp/Ends$Sliced;->dst:Landroid/graphics/Rect;
    iget v8, v1, Landroid/graphics/Rect;->left:I
    iget v9, v1, Landroid/graphics/Rect;->top:I
    iget v10, v1, Landroid/graphics/Rect;->left:I
    add-int/2addr v10, v5
    iget v11, v1, Landroid/graphics/Rect;->bottom:I
    invoke-virtual { v6, v8, v9, v10, v11 }, Landroid/graphics/Rect;->set(IIII)V
  .line 162
    iget-object v6, p0, Lcom/innioasis/ipp/Ends$Sliced;->src:Landroid/graphics/Rect;
    iget-object v8, p0, Lcom/innioasis/ipp/Ends$Sliced;->dst:Landroid/graphics/Rect;
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Ends$Sliced;->getPaint()Landroid/graphics/Paint;
    move-result-object v9
    invoke-virtual { p1, v0, v6, v8, v9 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  :L2
  .line 164
    iget-object v6, p0, Lcom/innioasis/ipp/Ends$Sliced;->src:Landroid/graphics/Rect;
    iget v8, p0, Lcom/innioasis/ipp/Ends$Sliced;->capL:I
    iget v9, p0, Lcom/innioasis/ipp/Ends$Sliced;->capR:I
    sub-int v9, v2, v9
    invoke-virtual { v6, v8, v7, v9, v3 }, Landroid/graphics/Rect;->set(IIII)V
  .line 165
    iget-object v6, p0, Lcom/innioasis/ipp/Ends$Sliced;->dst:Landroid/graphics/Rect;
    iget v8, v1, Landroid/graphics/Rect;->left:I
    add-int/2addr v8, v5
    iget v5, v1, Landroid/graphics/Rect;->top:I
    iget v9, v1, Landroid/graphics/Rect;->right:I
    sub-int/2addr v9, v4
    iget v10, v1, Landroid/graphics/Rect;->bottom:I
    invoke-virtual { v6, v8, v5, v9, v10 }, Landroid/graphics/Rect;->set(IIII)V
  .line 166
    iget-object v5, p0, Lcom/innioasis/ipp/Ends$Sliced;->src:Landroid/graphics/Rect;
    iget-object v6, p0, Lcom/innioasis/ipp/Ends$Sliced;->dst:Landroid/graphics/Rect;
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Ends$Sliced;->getPaint()Landroid/graphics/Paint;
    move-result-object v8
    invoke-virtual { p1, v0, v5, v6, v8 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 167
    iget v5, p0, Lcom/innioasis/ipp/Ends$Sliced;->capR:I
    if-lez v5, :L3
  .line 168
    iget-object v6, p0, Lcom/innioasis/ipp/Ends$Sliced;->src:Landroid/graphics/Rect;
    sub-int v5, v2, v5
    invoke-virtual { v6, v5, v7, v2, v3 }, Landroid/graphics/Rect;->set(IIII)V
  .line 169
    iget-object v2, p0, Lcom/innioasis/ipp/Ends$Sliced;->dst:Landroid/graphics/Rect;
    iget v3, v1, Landroid/graphics/Rect;->right:I
    sub-int/2addr v3, v4
    iget v4, v1, Landroid/graphics/Rect;->top:I
    iget v5, v1, Landroid/graphics/Rect;->right:I
    iget v1, v1, Landroid/graphics/Rect;->bottom:I
    invoke-virtual { v2, v3, v4, v5, v1 }, Landroid/graphics/Rect;->set(IIII)V
  .line 170
    iget-object v1, p0, Lcom/innioasis/ipp/Ends$Sliced;->src:Landroid/graphics/Rect;
    iget-object v2, p0, Lcom/innioasis/ipp/Ends$Sliced;->dst:Landroid/graphics/Rect;
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Ends$Sliced;->getPaint()Landroid/graphics/Paint;
    move-result-object v3
    invoke-virtual { p1, v0, v1, v2, v3 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  :L3
  .line 172
    return-void
  :L4
  .line 150
    return-void
.end method
