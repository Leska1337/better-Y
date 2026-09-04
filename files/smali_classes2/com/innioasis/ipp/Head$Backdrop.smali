.class final Lcom/innioasis/ipp/Head$Backdrop;
.super Landroid/graphics/drawable/Drawable;
.source "Head.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Head;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 24
  name = "Backdrop"
.end annotation

.field private final bmp:Landroid/graphics/Bitmap;

.field private final dst:Landroid/graphics/Rect;

.field private final host:Landroid/view/View;

.field private final loc:[I

.field private final paint:Landroid/graphics/Paint;

.method constructor <init>(Landroid/view/View;Landroid/graphics/Bitmap;)V
  .registers 5
  .line 277
    invoke-direct { p0 }, Landroid/graphics/drawable/Drawable;-><init>()V
  .line 265
    const/4 v0, 2
    new-array v0, v0, [I
    iput-object v0, p0, Lcom/innioasis/ipp/Head$Backdrop;->loc:[I
  .line 266
    new-instance v0, Landroid/graphics/Rect;
    invoke-direct { v0 }, Landroid/graphics/Rect;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Head$Backdrop;->dst:Landroid/graphics/Rect;
  .line 274
    new-instance v0, Landroid/graphics/Paint;
    const/4 v1, 6
    invoke-direct { v0, v1 }, Landroid/graphics/Paint;-><init>(I)V
    iput-object v0, p0, Lcom/innioasis/ipp/Head$Backdrop;->paint:Landroid/graphics/Paint;
  .line 278
    iput-object p1, p0, Lcom/innioasis/ipp/Head$Backdrop;->host:Landroid/view/View;
  .line 279
    iput-object p2, p0, Lcom/innioasis/ipp/Head$Backdrop;->bmp:Landroid/graphics/Bitmap;
  .line 280
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
  .registers 10
  .line 283
    iget-object v0, p0, Lcom/innioasis/ipp/Head$Backdrop;->bmp:Landroid/graphics/Bitmap;
    invoke-virtual { v0 }, Landroid/graphics/Bitmap;->isRecycled()Z
    move-result v0
    if-eqz v0, :L0
    return-void
  :L0
  .line 284
    iget-object v0, p0, Lcom/innioasis/ipp/Head$Backdrop;->host:Landroid/view/View;
    iget-object v1, p0, Lcom/innioasis/ipp/Head$Backdrop;->loc:[I
    invoke-virtual { v0, v1 }, Landroid/view/View;->getLocationOnScreen([I)V
  .line 285
    iget-object v0, p0, Lcom/innioasis/ipp/Head$Backdrop;->host:Landroid/view/View;
    invoke-virtual { v0 }, Landroid/view/View;->getResources()Landroid/content/res/Resources;
    move-result-object v0
    invoke-virtual { v0 }, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v0
  .line 286
    iget-object v1, p0, Lcom/innioasis/ipp/Head$Backdrop;->dst:Landroid/graphics/Rect;
    iget-object v2, p0, Lcom/innioasis/ipp/Head$Backdrop;->loc:[I
    const/4 v3, 0
    aget v4, v2, v3
    neg-int v4, v4
    const/4 v5, 1
    aget v2, v2, v5
    neg-int v2, v2
    iget v6, v0, Landroid/util/DisplayMetrics;->widthPixels:I
    iget-object v7, p0, Lcom/innioasis/ipp/Head$Backdrop;->loc:[I
    aget v3, v7, v3
    sub-int/2addr v6, v3
    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I
    iget-object v3, p0, Lcom/innioasis/ipp/Head$Backdrop;->loc:[I
    aget v3, v3, v5
    sub-int/2addr v0, v3
    invoke-virtual { v1, v4, v2, v6, v0 }, Landroid/graphics/Rect;->set(IIII)V
  .line 287
    iget-object v0, p0, Lcom/innioasis/ipp/Head$Backdrop;->bmp:Landroid/graphics/Bitmap;
    iget-object v1, p0, Lcom/innioasis/ipp/Head$Backdrop;->dst:Landroid/graphics/Rect;
    iget-object v2, p0, Lcom/innioasis/ipp/Head$Backdrop;->paint:Landroid/graphics/Paint;
    const/4 v3, 0
    invoke-virtual { p1, v0, v3, v1, v2 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
  .line 288
    return-void
.end method

.method public getOpacity()I
  .registers 2
  .line 294
    const/4 v0, -3
    return v0
.end method

.method public setAlpha(I)V
  .registers 2
  .line 290
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
  .registers 2
  .line 292
    return-void
.end method
