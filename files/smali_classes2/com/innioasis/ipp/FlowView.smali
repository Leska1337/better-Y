.class public final Lcom/innioasis/ipp/FlowView;
.super Landroid/view/View;
.source "FlowView.java"

.field private final static ANCHOR:I = 142

.field private final static ANGLE:F = 0.0F

.field private final static BASE:I = 202

.field private final static RATE:F = 8.0F

.field private final static SIDE:I = 6

.field private final static SPACING:F = 40.0F

.field private final static VMAX:F = 30.0F

.field private final static VMIN:F = 2.5F

.field private final artist:Landroid/text/TextPaint;

.field private final bmpPaint:Landroid/graphics/Paint;

.field private final dst:[F

.field private h:I

.field private hidden:I

.field private items:Ljava/util/List;

.field private last:J

.field private loader:Lcom/innioasis/ipp/Flow$Loader;

.field private final m:Landroid/graphics/Matrix;

.field private final name:Landroid/text/TextPaint;

.field private final offX:F

.field private final offY:F

.field private pos:F

.field private sAlpha:I

.field private sAngle:F

.field private sCx:F

.field private sCy:F

.field private spread:F

.field private final src:[F

.field private target:I

.field private w:I

.method static constructor <clinit>()V
  .registers 2
  .line 27
    const-wide v0, 4634626229029306368L
    invoke-static { v0, v1 }, Ljava/lang/Math;->toRadians(D)D
    move-result-wide v0
    double-to-float v0, v0
    sput v0, Lcom/innioasis/ipp/FlowView;->ANGLE:F
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
  .registers 10
  .line 62
    invoke-direct { p0, p1 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
  .line 48
    const/4 p1, -1
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->hidden:I
  .line 53
    new-instance v0, Landroid/graphics/Matrix;
    invoke-direct { v0 }, Landroid/graphics/Matrix;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/FlowView;->m:Landroid/graphics/Matrix;
  .line 54
    const/16 v0, 8
    new-array v1, v0, [F
    iput-object v1, p0, Lcom/innioasis/ipp/FlowView;->src:[F
  .line 55
    new-array v0, v0, [F
    iput-object v0, p0, Lcom/innioasis/ipp/FlowView;->dst:[F
  .line 56
    new-instance v0, Landroid/graphics/Paint;
    const/4 v1, 2
    invoke-direct { v0, v1 }, Landroid/graphics/Paint;-><init>(I)V
    iput-object v0, p0, Lcom/innioasis/ipp/FlowView;->bmpPaint:Landroid/graphics/Paint;
  .line 58
    new-instance v0, Landroid/text/TextPaint;
    const/4 v1, 1
    invoke-direct { v0, v1 }, Landroid/text/TextPaint;-><init>(I)V
    iput-object v0, p0, Lcom/innioasis/ipp/FlowView;->name:Landroid/text/TextPaint;
  .line 59
    new-instance v2, Landroid/text/TextPaint;
    invoke-direct { v2, v1 }, Landroid/text/TextPaint;-><init>(I)V
    iput-object v2, p0, Lcom/innioasis/ipp/FlowView;->artist:Landroid/text/TextPaint;
  .line 63
    sget v3, Lcom/innioasis/ipp/FlowView;->ANGLE:F
    float-to-double v4, v3
    invoke-static { v4, v5 }, Ljava/lang/Math;->cos(D)D
    move-result-wide v4
    double-to-float v4, v4
    const/high16 v5, 0x3F800000
    sub-float v4, v5, v4
    const/high16 v6, 0x42B40000
    mul-float v4, v4, v6
    const/high16 v7, 0x43340000
    add-float/2addr v4, v7
    iput v4, p0, Lcom/innioasis/ipp/FlowView;->offX:F
  .line 64
    float-to-double v3, v3
    invoke-static { v3, v4 }, Ljava/lang/Math;->sin(D)D
    move-result-wide v3
    double-to-float v3, v3
    mul-float v3, v3, v6
    const/high16 v4, 0x42340000
    add-float/2addr v3, v4
    iput v3, p0, Lcom/innioasis/ipp/FlowView;->offY:F
  .line 65
    invoke-virtual { v0, p1 }, Landroid/text/TextPaint;->setColor(I)V
  .line 66
    const/high16 p1, 0x41A00000
    invoke-virtual { v0, p1 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 67
    sget-object p1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-static { p1, v1 }, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;
    move-result-object p1
    invoke-virtual { v0, p1 }, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  .line 68
    invoke-virtual { v0, v1 }, Landroid/text/TextPaint;->setFakeBoldText(Z)V
  .line 69
    sget-object p1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;
    invoke-virtual { v0, p1 }, Landroid/text/TextPaint;->setTextAlign(Landroid/graphics/Paint$Align;)V
  .line 70
    const/high16 p1, 0x40000000
    const/4 v1, 0
    const/high16 v3, 0xC0000000
    invoke-virtual { v0, p1, v1, v5, v3 }, Landroid/text/TextPaint;->setShadowLayer(FFFI)V
  .line 71
    const v0, -2039584
    invoke-virtual { v2, v0 }, Landroid/text/TextPaint;->setColor(I)V
  .line 72
    const/high16 v0, 0x41880000
    invoke-virtual { v2, v0 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 73
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { v2, v0 }, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  .line 74
    sget-object v0, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;
    invoke-virtual { v2, v0 }, Landroid/text/TextPaint;->setTextAlign(Landroid/graphics/Paint$Align;)V
  .line 75
    invoke-virtual { v2, p1, v1, v5, v3 }, Landroid/text/TextPaint;->setShadowLayer(FFFI)V
  .line 76
    return-void
.end method

.method private advance()Z
  .registers 8
  .line 129
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 130
    iget-wide v2, p0, Lcom/innioasis/ipp/FlowView;->last:J
    const-wide/16 v4, 0
    cmp-long v6, v2, v4
    if-nez v6, :L0
    const v2, 1015222895
    goto :L1
  :L0
    sub-long v2, v0, v2
    long-to-float v2, v2
    const/high16 v3, 0x447A0000
    div-float/2addr v2, v3
    const v3, 1036831949
    invoke-static { v3, v2 }, Ljava/lang/Math;->min(FF)F
    move-result v2
  :L1
  .line 131
    iput-wide v0, p0, Lcom/innioasis/ipp/FlowView;->last:J
  .line 132
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->target:I
    int-to-float v0, v0
    iget v1, p0, Lcom/innioasis/ipp/FlowView;->pos:F
    sub-float/2addr v0, v1
  .line 133
    const/4 v1, 0
    const/4 v3, 0
    cmpl-float v4, v0, v3
    if-nez v4, :L2
    return v1
  :L2
  .line 134
    invoke-static { v0 }, Ljava/lang/Math;->abs(F)F
    move-result v4
    const/high16 v5, 0x41000000
    mul-float v4, v4, v5
    const/high16 v5, 0x41F00000
    invoke-static { v5, v4 }, Ljava/lang/Math;->min(FF)F
    move-result v4
    const/high16 v5, 0x40200000
    invoke-static { v5, v4 }, Ljava/lang/Math;->max(FF)F
    move-result v4
  .line 135
    mul-float v4, v4, v2
  .line 136
    invoke-static { v0 }, Ljava/lang/Math;->abs(F)F
    move-result v2
    cmpl-float v2, v4, v2
    if-ltz v2, :L3
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->target:I
    int-to-float v0, v0
    iput v0, p0, Lcom/innioasis/ipp/FlowView;->pos:F
    goto :L6
  :L3
  .line 137
    iget v2, p0, Lcom/innioasis/ipp/FlowView;->pos:F
    cmpl-float v0, v0, v3
    if-lez v0, :L4
    goto :L5
  :L4
    neg-float v4, v4
  :L5
    add-float/2addr v2, v4
    iput v2, p0, Lcom/innioasis/ipp/FlowView;->pos:F
  :L6
  .line 138
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->pos:F
    iget v2, p0, Lcom/innioasis/ipp/FlowView;->target:I
    int-to-float v2, v2
    cmpl-float v0, v0, v2
    if-eqz v0, :L7
    const/4 v1, 1
  :L7
    return v1
.end method

.method private corner(IFFFF)V
  .registers 9
  .line 215
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->sCx:F
    mul-float p4, p4, p2
    add-float/2addr v0, p4
  .line 216
    iget p4, p0, Lcom/innioasis/ipp/FlowView;->h:I
    int-to-float v1, p4
    iget v2, p0, Lcom/innioasis/ipp/FlowView;->sCy:F
    add-float/2addr v1, v2
    mul-float p2, p2, p5
    add-float/2addr v1, p2
  .line 217
    iget-object p2, p0, Lcom/innioasis/ipp/FlowView;->dst:[F
    iget p5, p0, Lcom/innioasis/ipp/FlowView;->w:I
    int-to-float p5, p5
    const/high16 v2, 0x40000000
    div-float/2addr p5, v2
    int-to-float v2, p4
    mul-float v2, v2, v0
    div-float/2addr v2, v1
    add-float/2addr p5, v2
    aput p5, p2, p1
  .line 218
    add-int/lit8 p1, p1, 1
    const/high16 p5, 0x430E0000
    sub-float/2addr p3, p5
    int-to-float p4, p4
    mul-float p3, p3, p4
    div-float/2addr p3, v1
    add-float/2addr p3, p5
    aput p3, p2, p1
  .line 219
    return-void
.end method

.method private place(F)V
  .registers 8
  .line 170
    invoke-static { p1 }, Ljava/lang/Math;->abs(F)F
    move-result v0
  .line 171
    const/high16 v1, 0x3F800000
    const/4 v2, 0
    cmpg-float p1, p1, v2
    if-gez p1, :L0
    const/high16 p1, 0xBF800000
    goto :L1
  :L0
    const/high16 p1, 0x3F800000
  :L1
  .line 172
    cmpg-float v3, v0, v1
    if-gtz v3, :L2
  .line 173
    neg-float v3, p1
    sget v4, Lcom/innioasis/ipp/FlowView;->ANGLE:F
    mul-float v3, v3, v4
    mul-float v3, v3, v0
    iput v3, p0, Lcom/innioasis/ipp/FlowView;->sAngle:F
  .line 174
    iget v3, p0, Lcom/innioasis/ipp/FlowView;->offX:F
    mul-float p1, p1, v3
    mul-float p1, p1, v0
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->sCx:F
  .line 175
    iget p1, p0, Lcom/innioasis/ipp/FlowView;->offY:F
    mul-float p1, p1, v0
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->sCy:F
    goto :L3
  :L2
  .line 177
    neg-float v3, p1
    sget v4, Lcom/innioasis/ipp/FlowView;->ANGLE:F
    mul-float v3, v3, v4
    iput v3, p0, Lcom/innioasis/ipp/FlowView;->sAngle:F
  .line 178
    iget v3, p0, Lcom/innioasis/ipp/FlowView;->offX:F
    const/high16 v4, 0x42200000
    sub-float v5, v0, v1
    mul-float v5, v5, v4
    add-float/2addr v3, v5
    mul-float p1, p1, v3
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->sCx:F
  .line 179
    iget p1, p0, Lcom/innioasis/ipp/FlowView;->offY:F
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->sCy:F
  :L3
  .line 181
    const/high16 p1, 0x40C00000
    sub-float/2addr p1, v0
    const/high16 v0, 0x40000000
    div-float/2addr p1, v0
  .line 182
    cmpl-float v0, p1, v1
    if-ltz v0, :L4
    const/16 p1, 255
    goto :L6
  :L4
    cmpg-float v0, p1, v2
    if-gtz v0, :L5
    const/4 p1, 0
    goto :L6
  :L5
    const/high16 v0, 0x437F0000
    mul-float p1, p1, v0
    float-to-int p1, p1
  :L6
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->sAlpha:I
  .line 183
    return-void
.end method

.method private slide(Landroid/graphics/Canvas;II)V
  .registers 15
  .line 186
    if-ltz p2, :L7
    if-ge p2, p3, :L7
    iget p3, p0, Lcom/innioasis/ipp/FlowView;->hidden:I
    if-ne p2, p3, :L0
    goto/16 :L7
  :L0
  .line 187
    int-to-float p3, p2
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->pos:F
    sub-float v0, p3, v0
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/FlowView;->place(F)V
  .line 188
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->sAlpha:I
    if-gtz v0, :L1
    return-void
  :L1
  .line 189
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView;->loader:Lcom/innioasis/ipp/Flow$Loader;
    invoke-virtual { v0, p2 }, Lcom/innioasis/ipp/Flow$Loader;->get(I)Landroid/graphics/Bitmap;
    move-result-object p2
  .line 190
    if-nez p2, :L2
    return-void
  :L2
  .line 191
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->sAngle:F
    float-to-double v0, v0
    invoke-static { v0, v1 }, Ljava/lang/Math;->cos(D)D
    move-result-wide v0
    double-to-float v0, v0
    iget v1, p0, Lcom/innioasis/ipp/FlowView;->sAngle:F
    float-to-double v1, v1
    invoke-static { v1, v2 }, Ljava/lang/Math;->sin(D)D
    move-result-wide v1
    double-to-float v1, v1
  .line 192
    nop
  .line 193
    const/high16 v8, 0x41A00000
  .line 194
    const/high16 v9, 0x43920000
  .line 195
    const/4 v3, 0
    const/high16 v10, 0xC2B80000
    const/high16 v5, 0x41A00000
    move-object v2, p0
    move v4, v10
    move v6, v0
    move v7, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/ipp/FlowView;->corner(IFFFF)V
  .line 196
    const/4 v3, 2
    const/high16 v4, 0x42B80000
    move v5, v8
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/ipp/FlowView;->corner(IFFFF)V
  .line 197
    const/4 v3, 4
    const/high16 v5, 0x43920000
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/ipp/FlowView;->corner(IFFFF)V
  .line 198
    const/4 v3, 6
    move v4, v10
    move v5, v9
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/ipp/FlowView;->corner(IFFFF)V
  .line 199
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->spread:F
    const/4 v1, 0
    const/4 v2, 0
    cmpl-float v3, v0, v2
    if-lez v3, :L5
  .line 200
    iget v3, p0, Lcom/innioasis/ipp/FlowView;->pos:F
    cmpg-float p3, p3, v3
    if-gez p3, :L3
    neg-float v0, v0
  :L3
    iget p3, p0, Lcom/innioasis/ipp/FlowView;->w:I
    int-to-float p3, p3
    mul-float v0, v0, p3
  .line 201
    const/4 p3, 0
  :L4
    const/16 v3, 8
    if-ge p3, v3, :L5
    iget-object v3, p0, Lcom/innioasis/ipp/FlowView;->dst:[F
    aget v4, v3, p3
    add-float/2addr v4, v0
    aput v4, v3, p3
    add-int/lit8 p3, p3, 2
    goto :L4
  :L5
  .line 203
    invoke-virtual { p2 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result p3
    invoke-virtual { p2 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v0
  .line 204
    iget-object v4, p0, Lcom/innioasis/ipp/FlowView;->src:[F
    aput v2, v4, v1
    const/4 v1, 1
    aput v2, v4, v1
  .line 205
    int-to-float p3, p3
    const/4 v1, 2
    aput p3, v4, v1
    const/4 v1, 3
    aput v2, v4, v1
  .line 206
    const/4 v1, 4
    aput p3, v4, v1
    int-to-float p3, v0
    const/4 v0, 5
    aput p3, v4, v0
  .line 207
    const/4 v0, 6
    aput v2, v4, v0
    const/4 v0, 7
    aput p3, v4, v0
  .line 208
    iget-object v3, p0, Lcom/innioasis/ipp/FlowView;->m:Landroid/graphics/Matrix;
    const/4 v5, 0
    iget-object v6, p0, Lcom/innioasis/ipp/FlowView;->dst:[F
    const/4 v7, 0
    const/4 v8, 4
    invoke-virtual/range { v3 .. v8 }, Landroid/graphics/Matrix;->setPolyToPoly([FI[FII)Z
    move-result p3
    if-nez p3, :L6
    return-void
  :L6
  .line 209
    iget-object p3, p0, Lcom/innioasis/ipp/FlowView;->bmpPaint:Landroid/graphics/Paint;
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->sAlpha:I
    invoke-virtual { p3, v0 }, Landroid/graphics/Paint;->setAlpha(I)V
  .line 210
    iget-object p3, p0, Lcom/innioasis/ipp/FlowView;->m:Landroid/graphics/Matrix;
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView;->bmpPaint:Landroid/graphics/Paint;
    invoke-virtual { p1, p2, p3, v0 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V
  .line 211
    return-void
  :L7
  .line 186
    return-void
.end method

.method public count()I
  .registers 2
  .line 89
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView;->items:Ljava/util/List;
    if-nez v0, :L0
    const/4 v0, 0
    goto :L1
  :L0
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
  :L1
    return v0
.end method

.method public coverLeft()I
  .registers 2
  .line 108
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->w:I
    div-int/lit8 v0, v0, 2
    add-int/lit8 v0, v0, -90
    return v0
.end method

.method public coverTop()I
  .registers 2
  .line 110
    const/16 v0, 22
    return v0
.end method

.method public getSpread()F
  .registers 2
  .line 120
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->spread:F
    return v0
.end method

.method public hide(I)V
  .registers 2
  .line 103
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->hidden:I
  .line 104
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->invalidate()V
  .line 105
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
  .registers 9
  .line 143
    invoke-direct { p0 }, Lcom/innioasis/ipp/FlowView;->advance()Z
    move-result v0
  .line 144
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->count()I
    move-result v1
  .line 145
    if-lez v1, :L3
    iget v2, p0, Lcom/innioasis/ipp/FlowView;->w:I
    if-lez v2, :L3
  .line 146
    iget v2, p0, Lcom/innioasis/ipp/FlowView;->pos:F
    invoke-static { v2 }, Ljava/lang/Math;->round(F)I
    move-result v2
  .line 148
    const/4 v3, 7
  :L0
    if-ltz v3, :L2
  .line 149
    sub-int v4, v2, v3
    invoke-direct { p0, p1, v4, v1 }, Lcom/innioasis/ipp/FlowView;->slide(Landroid/graphics/Canvas;II)V
  .line 150
    if-eqz v3, :L1
    add-int v4, v2, v3
    invoke-direct { p0, p1, v4, v1 }, Lcom/innioasis/ipp/FlowView;->slide(Landroid/graphics/Canvas;II)V
  :L1
  .line 148
    add-int/lit8 v3, v3, -1
    goto :L0
  :L2
  .line 152
    iget-object v3, p0, Lcom/innioasis/ipp/FlowView;->items:Ljava/util/List;
    add-int/lit8 v1, v1, -1
    invoke-static { v1, v2 }, Ljava/lang/Math;->min(II)I
    move-result v1
    const/4 v2, 0
    invoke-static { v2, v1 }, Ljava/lang/Math;->max(II)I
    move-result v1
    invoke-interface { v3, v1 }, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Lcom/innioasis/ipp/Flow$Item;
  .line 153
    iget v2, p0, Lcom/innioasis/ipp/FlowView;->w:I
    int-to-float v2, v2
    const/high16 v3, 0x40000000
    div-float/2addr v2, v3
  .line 154
    iget v4, p0, Lcom/innioasis/ipp/FlowView;->spread:F
    mul-float v4, v4, v3
    const/high16 v3, 0x3F800000
    invoke-static { v3, v4 }, Ljava/lang/Math;->min(FF)F
    move-result v4
    sub-float/2addr v3, v4
    const/high16 v4, 0x437F0000
    mul-float v3, v3, v4
    float-to-int v3, v3
  .line 155
    iget-object v4, p0, Lcom/innioasis/ipp/FlowView;->name:Landroid/text/TextPaint;
    invoke-virtual { v4, v3 }, Landroid/text/TextPaint;->setAlpha(I)V
  .line 156
    iget-object v4, p0, Lcom/innioasis/ipp/FlowView;->artist:Landroid/text/TextPaint;
    invoke-virtual { v4, v3 }, Landroid/text/TextPaint;->setAlpha(I)V
  .line 157
    iget-object v3, v1, Lcom/innioasis/ipp/Flow$Item;->name:Ljava/lang/String;
    iget-object v4, p0, Lcom/innioasis/ipp/FlowView;->name:Landroid/text/TextPaint;
    iget v5, p0, Lcom/innioasis/ipp/FlowView;->w:I
    add-int/lit8 v5, v5, -24
    int-to-float v5, v5
    sget-object v6, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-static { v3, v4, v5, v6 }, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;
    move-result-object v3
    invoke-interface { v3 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v3
    iget v4, p0, Lcom/innioasis/ipp/FlowView;->h:I
    add-int/lit8 v4, v4, -40
    int-to-float v4, v4
    iget-object v5, p0, Lcom/innioasis/ipp/FlowView;->name:Landroid/text/TextPaint;
    invoke-virtual { p1, v3, v2, v4, v5 }, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
  .line 159
    iget-object v1, v1, Lcom/innioasis/ipp/Flow$Item;->artist:Ljava/lang/String;
    iget-object v3, p0, Lcom/innioasis/ipp/FlowView;->artist:Landroid/text/TextPaint;
    iget v4, p0, Lcom/innioasis/ipp/FlowView;->w:I
    add-int/lit8 v4, v4, -24
    int-to-float v4, v4
    sget-object v5, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;
    invoke-static { v1, v3, v4, v5 }, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;
    move-result-object v1
    invoke-interface { v1 }, Ljava/lang/CharSequence;->toString()Ljava/lang/String;
    move-result-object v1
    iget v3, p0, Lcom/innioasis/ipp/FlowView;->h:I
    add-int/lit8 v3, v3, -14
    int-to-float v3, v3
    iget-object v4, p0, Lcom/innioasis/ipp/FlowView;->artist:Landroid/text/TextPaint;
    invoke-virtual { p1, v1, v2, v3, v4 }, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V
  :L3
  .line 162
    if-eqz v0, :L4
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->postInvalidateOnAnimation()V
  :L4
  .line 163
    return-void
.end method

.method protected onSizeChanged(IIII)V
  .registers 5
  .line 124
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->w:I
  .line 125
    iput p2, p0, Lcom/innioasis/ipp/FlowView;->h:I
  .line 126
    return-void
.end method

.method public setItems(Ljava/util/List;Lcom/innioasis/ipp/Flow$Loader;I)V
  .registers 4
  .line 79
    iput-object p1, p0, Lcom/innioasis/ipp/FlowView;->items:Ljava/util/List;
  .line 80
    iput-object p2, p0, Lcom/innioasis/ipp/FlowView;->loader:Lcom/innioasis/ipp/Flow$Loader;
  .line 81
    iput p3, p0, Lcom/innioasis/ipp/FlowView;->target:I
  .line 82
    int-to-float p1, p3
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->pos:F
  .line 83
    invoke-virtual { p2, p3 }, Lcom/innioasis/ipp/Flow$Loader;->aim(I)V
  .line 84
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->invalidate()V
  .line 85
    return-void
.end method

.method public setSpread(F)V
  .registers 2
  .line 116
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->spread:F
  .line 117
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->invalidate()V
  .line 118
    return-void
.end method

.method public step(I)V
  .registers 4
  .line 92
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView;->items:Ljava/util/List;
    if-eqz v0, :L2
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    goto :L2
  :L0
  .line 93
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView;->items:Ljava/util/List;
    invoke-interface { v0 }, Ljava/util/List;->size()I
    move-result v0
    add-int/lit8 v0, v0, -1
    iget v1, p0, Lcom/innioasis/ipp/FlowView;->target:I
    add-int/2addr v1, p1
    invoke-static { v0, v1 }, Ljava/lang/Math;->min(II)I
    move-result p1
    const/4 v0, 0
    invoke-static { v0, p1 }, Ljava/lang/Math;->max(II)I
    move-result p1
  .line 94
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->target:I
    if-ne p1, v0, :L1
    return-void
  :L1
  .line 95
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->target:I
  .line 96
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView;->loader:Lcom/innioasis/ipp/Flow$Loader;
    invoke-virtual { v0, p1 }, Lcom/innioasis/ipp/Flow$Loader;->aim(I)V
  .line 97
    const-wide/16 v0, 0
    iput-wide v0, p0, Lcom/innioasis/ipp/FlowView;->last:J
  .line 98
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->postInvalidateOnAnimation()V
  .line 99
    return-void
  :L2
  .line 92
    return-void
.end method

.method public target()I
  .registers 2
  .line 87
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->target:I
    return v0
.end method
