.class public Lcom/innioasis/ipp/Outline;
.super Landroid/widget/TextView;
.source "Outline.java"

.field private drawing:Z

.field private stroke:I

.field private width:F

.method public constructor <init>(Landroid/content/Context;)V
  .registers 2
  .line 23
    invoke-direct { p0, p1 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
  .registers 3
  .line 27
    invoke-direct { p0, p1, p2 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
  .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
  .registers 4
  .line 31
    invoke-direct { p0, p1, p2, p3 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
  .line 32
    return-void
.end method

.method private static room(F)I
  .registers 3
  .line 57
    float-to-double v0, p0
    invoke-static { v0, v1 }, Ljava/lang/Math;->ceil(D)D
    move-result-wide v0
    double-to-int p0, v0
    add-int/lit8 p0, p0, 2
    return p0
.end method

.method public invalidate()V
  .registers 2
  .line 86
    iget-boolean v0, p0, Lcom/innioasis/ipp/Outline;->drawing:Z
    if-nez v0, :L0
    invoke-super { p0 }, Landroid/widget/TextView;->invalidate()V
  :L0
  .line 87
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
  .catchall { :L1 .. :L2 } :L3
  .registers 6
  .line 62
    iget v0, p0, Lcom/innioasis/ipp/Outline;->stroke:I
    if-eqz v0, :L4
    iget v0, p0, Lcom/innioasis/ipp/Outline;->width:F
    const/4 v1, 0
    cmpg-float v0, v0, v1
    if-gtz v0, :L0
    goto :L4
  :L0
  .line 66
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Outline;->getTextColors()Landroid/content/res/ColorStateList;
    move-result-object v0
  .line 67
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Outline;->getPaint()Landroid/text/TextPaint;
    move-result-object v1
  .line 68
    const/4 v2, 1
    iput-boolean v2, p0, Lcom/innioasis/ipp/Outline;->drawing:Z
  .line 70
    const/4 v2, 0
  :L1
    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;
    invoke-virtual { v1, v3 }, Landroid/text/TextPaint;->setStyle(Landroid/graphics/Paint$Style;)V
  .line 71
    sget-object v3, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;
    invoke-virtual { v1, v3 }, Landroid/text/TextPaint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V
  .line 72
    iget v3, p0, Lcom/innioasis/ipp/Outline;->width:F
    invoke-virtual { v1, v3 }, Landroid/text/TextPaint;->setStrokeWidth(F)V
  .line 73
    iget v3, p0, Lcom/innioasis/ipp/Outline;->stroke:I
    invoke-virtual { p0, v3 }, Lcom/innioasis/ipp/Outline;->setTextColor(I)V
  .line 74
    invoke-super { p0, p1 }, Landroid/widget/TextView;->onDraw(Landroid/graphics/Canvas;)V
  .line 75
    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;
    invoke-virtual { v1, v3 }, Landroid/text/TextPaint;->setStyle(Landroid/graphics/Paint$Style;)V
  .line 76
    invoke-virtual { p0, v0 }, Lcom/innioasis/ipp/Outline;->setTextColor(Landroid/content/res/ColorStateList;)V
  .line 77
    invoke-super { p0, p1 }, Landroid/widget/TextView;->onDraw(Landroid/graphics/Canvas;)V
  :L2
  .line 79
    sget-object p1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;
    invoke-virtual { v1, p1 }, Landroid/text/TextPaint;->setStyle(Landroid/graphics/Paint$Style;)V
  .line 80
    iput-boolean v2, p0, Lcom/innioasis/ipp/Outline;->drawing:Z
  .line 81
    nop
  .line 82
    return-void
  :L3
  .line 79
    move-exception p1
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;
    invoke-virtual { v1, v0 }, Landroid/text/TextPaint;->setStyle(Landroid/graphics/Paint$Style;)V
  .line 80
    iput-boolean v2, p0, Lcom/innioasis/ipp/Outline;->drawing:Z
  .line 81
    throw p1
  :L4
  .line 63
    invoke-super { p0, p1 }, Landroid/widget/TextView;->onDraw(Landroid/graphics/Canvas;)V
  .line 64
    return-void
.end method

.method public setOutline(IF)V
  .registers 9
  .line 42
    iget v0, p0, Lcom/innioasis/ipp/Outline;->stroke:I
    if-ne v0, p1, :L0
    iget v0, p0, Lcom/innioasis/ipp/Outline;->width:F
    cmpl-float v0, v0, p2
    if-nez v0, :L0
    return-void
  :L0
  .line 43
    iget v0, p0, Lcom/innioasis/ipp/Outline;->width:F
    const/4 v1, 0
    const/4 v2, 0
    cmpg-float v3, v0, v2
    if-gtz v3, :L1
    const/4 v0, 0
    goto :L2
  :L1
    invoke-static { v0 }, Lcom/innioasis/ipp/Outline;->room(F)I
    move-result v0
  :L2
  .line 44
    cmpg-float v3, p2, v2
    if-gtz v3, :L3
    const/4 v3, 0
    goto :L4
  :L3
    invoke-static { p2 }, Lcom/innioasis/ipp/Outline;->room(F)I
    move-result v3
  :L4
  .line 45
    iput p1, p0, Lcom/innioasis/ipp/Outline;->stroke:I
  .line 46
    iput p2, p0, Lcom/innioasis/ipp/Outline;->width:F
  .line 47
    if-eq v3, v0, :L5
  .line 48
    sub-int p1, v3, v0
  .line 49
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Outline;->getPaddingLeft()I
    move-result p2
    add-int/2addr p2, p1
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Outline;->getPaddingTop()I
    move-result v0
    add-int/2addr v0, p1
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Outline;->getPaddingRight()I
    move-result v4
    add-int/2addr v4, p1
  .line 50
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Outline;->getPaddingBottom()I
    move-result v5
    add-int/2addr v5, p1
  .line 49
    invoke-virtual { p0, p2, v0, v4, v5 }, Lcom/innioasis/ipp/Outline;->setPadding(IIII)V
  :L5
  .line 52
    int-to-float p1, v3
    invoke-virtual { p0, p1, v2, v2, v1 }, Lcom/innioasis/ipp/Outline;->setShadowLayer(FFFI)V
  .line 53
    invoke-virtual { p0 }, Lcom/innioasis/ipp/Outline;->invalidate()V
  .line 54
    return-void
.end method
