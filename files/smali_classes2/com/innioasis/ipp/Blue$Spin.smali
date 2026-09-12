.class final Lcom/innioasis/ipp/Blue$Spin;
.super Landroid/view/View;
.source "Blue.java"

.annotation system Ldalvik/annotation/EnclosingClass;
  value = Lcom/innioasis/ipp/Blue;
.end annotation
.annotation system Ldalvik/annotation/InnerClass;
  accessFlags = 26
  name = "Spin"
.end annotation

.field private final static SWEEP:F = 300.0F

.field private final box:Landroid/graphics/RectF;

.field private final paint:Landroid/graphics/Paint;

.field private final rgb:I

.field private final ring:F

.method constructor <init>(Landroid/content/Context;IF)V
  .registers 5
  .line 355
    invoke-direct { p0, p1 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
  .line 349
    new-instance p1, Landroid/graphics/Paint;
    const/4 v0, 1
    invoke-direct { p1, v0 }, Landroid/graphics/Paint;-><init>(I)V
    iput-object p1, p0, Lcom/innioasis/ipp/Blue$Spin;->paint:Landroid/graphics/Paint;
  .line 350
    new-instance v0, Landroid/graphics/RectF;
    invoke-direct { v0 }, Landroid/graphics/RectF;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/Blue$Spin;->box:Landroid/graphics/RectF;
  .line 356
    iput p2, p0, Lcom/innioasis/ipp/Blue$Spin;->rgb:I
  .line 357
    iput p3, p0, Lcom/innioasis/ipp/Blue$Spin;->ring:F
  .line 358
    sget-object p2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;
    invoke-virtual { p1, p2 }, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V
  .line 359
    invoke-virtual { p1, p3 }, Landroid/graphics/Paint;->setStrokeWidth(F)V
  .line 360
    sget-object p2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;
    invoke-virtual { p1, p2 }, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V
  .line 361
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
  .registers 13
  .line 375
    invoke-virtual { p1 }, Landroid/graphics/Canvas;->save()I
    move-result v0
  .line 376
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Blue$Spin;->getWidth()I
    move-result v1
    int-to-float v1, v1
    const/high16 v2, 0x40000000
    div-float/2addr v1, v2
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Blue$Spin;->getHeight()I
    move-result v3
    int-to-float v3, v3
    div-float/2addr v3, v2
    const/high16 v2, 0xBF800000
    const/high16 v4, 0x3F800000
    invoke-virtual { p1, v2, v4, v1, v3 }, Landroid/graphics/Canvas;->scale(FFFF)V
  .line 377
    iget-object v6, p0, Lcom/innioasis/ipp/Blue$Spin;->box:Landroid/graphics/RectF;
    const/4 v7, 0
    const/high16 v8, 0x43960000
    const/4 v9, 0
    iget-object v10, p0, Lcom/innioasis/ipp/Blue$Spin;->paint:Landroid/graphics/Paint;
    move-object v5, p1
    invoke-virtual/range { v5 .. v10 }, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V
  .line 378
    invoke-virtual { p1, v0 }, Landroid/graphics/Canvas;->restoreToCount(I)V
  .line 379
    return-void
.end method

.method protected onSizeChanged(IIII)V
  .registers 8
  .line 364
    iget p3, p0, Lcom/innioasis/ipp/Blue$Spin;->ring:F
    const/high16 p4, 0x40000000
    div-float/2addr p3, p4
  .line 365
    iget-object v0, p0, Lcom/innioasis/ipp/Blue$Spin;->box:Landroid/graphics/RectF;
    int-to-float p1, p1
    sub-float v1, p1, p3
    int-to-float p2, p2
    sub-float v2, p2, p3
    invoke-virtual { v0, p3, p3, v1, v2 }, Landroid/graphics/RectF;->set(FFFF)V
  .line 369
    iget-object p3, p0, Lcom/innioasis/ipp/Blue$Spin;->paint:Landroid/graphics/Paint;
    new-instance v0, Landroid/graphics/SweepGradient;
    div-float/2addr p1, p4
    div-float/2addr p2, p4
    iget p4, p0, Lcom/innioasis/ipp/Blue$Spin;->rgb:I
    const/high16 v1, 0xFF000000
    or-int/2addr v1, p4
    filled-new-array { v1, p4 }, [I
    move-result-object p4
    const/4 v1, 2
    new-array v1, v1, [F
    fill-array-data v1, :L0
    invoke-direct { v0, p1, p2, p4, v1 }, Landroid/graphics/SweepGradient;-><init>(FF[I[F)V
    invoke-virtual { p3, v0 }, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;
  .line 371
    return-void
  :L0
  .array-data 4
      0
      1062557013
  .end array-data
.end method
