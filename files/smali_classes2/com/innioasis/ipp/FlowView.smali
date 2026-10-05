.class public final Lcom/innioasis/ipp/FlowView;
.super Landroid/view/View;
.source "FlowView.java"

.field private final static ANCHOR:I = 142

.field private final static ANGLE:F = 0.0F

.field private final static ARTIST_ALPHA:I = 176

.field private final static BASE:I = 202

.field private final static RATE:F = 8.0F

.field private final static SIDE:I = 6

.field private final static SPACING:F = 40.0F

.field private final static VMAX:F = 30.0F

.field private final static VMIN:F = 2.5F

.field private final artist:Landroid/text/TextPaint;

.field private final bmpPaint:Landroid/graphics/Paint;

.field private final dst:[F

.field private final erase:Landroid/graphics/Paint;

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
  .line 32
    const-wide v0, 4634626229029306368L
    invoke-static { v0, v1 }, Ljava/lang/Math;->toRadians(D)D
    move-result-wide v0
    double-to-float v0, v0
    sput v0, Lcom/innioasis/ipp/FlowView;->ANGLE:F
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
  .registers 12
  .line 70
    invoke-direct { p0, p1 }, Landroid/view/View;-><init>(Landroid/content/Context;)V
  .line 53
    const/4 v0, -1
    iput v0, p0, Lcom/innioasis/ipp/FlowView;->hidden:I
  .line 58
    new-instance v0, Landroid/graphics/Matrix;
    invoke-direct { v0 }, Landroid/graphics/Matrix;-><init>()V
    iput-object v0, p0, Lcom/innioasis/ipp/FlowView;->m:Landroid/graphics/Matrix;
  .line 59
    const/16 v0, 8
    new-array v1, v0, [F
    iput-object v1, p0, Lcom/innioasis/ipp/FlowView;->src:[F
  .line 60
    new-array v0, v0, [F
    iput-object v0, p0, Lcom/innioasis/ipp/FlowView;->dst:[F
  .line 61
    new-instance v0, Landroid/graphics/Paint;
    const/4 v1, 2
    invoke-direct { v0, v1 }, Landroid/graphics/Paint;-><init>(I)V
    iput-object v0, p0, Lcom/innioasis/ipp/FlowView;->bmpPaint:Landroid/graphics/Paint;
  .line 62
    new-instance v0, Landroid/graphics/Paint;
    invoke-direct { v0, v1 }, Landroid/graphics/Paint;-><init>(I)V
    iput-object v0, p0, Lcom/innioasis/ipp/FlowView;->erase:Landroid/graphics/Paint;
  .line 64
    new-instance v2, Landroid/text/TextPaint;
    const/4 v3, 1
    invoke-direct { v2, v3 }, Landroid/text/TextPaint;-><init>(I)V
    iput-object v2, p0, Lcom/innioasis/ipp/FlowView;->name:Landroid/text/TextPaint;
  .line 65
    new-instance v4, Landroid/text/TextPaint;
    invoke-direct { v4, v3 }, Landroid/text/TextPaint;-><init>(I)V
    iput-object v4, p0, Lcom/innioasis/ipp/FlowView;->artist:Landroid/text/TextPaint;
  .line 71
    sget v5, Lcom/innioasis/ipp/FlowView;->ANGLE:F
    float-to-double v6, v5
    invoke-static { v6, v7 }, Ljava/lang/Math;->cos(D)D
    move-result-wide v6
    double-to-float v6, v6
    const/high16 v7, 0x3F800000
    sub-float v6, v7, v6
    const/high16 v8, 0x42B40000
    mul-float v6, v6, v8
    const/high16 v9, 0x43340000
    add-float/2addr v6, v9
    iput v6, p0, Lcom/innioasis/ipp/FlowView;->offX:F
  .line 72
    float-to-double v5, v5
    invoke-static { v5, v6 }, Ljava/lang/Math;->sin(D)D
    move-result-wide v5
    double-to-float v5, v5
    mul-float v5, v5, v8
    const/high16 v6, 0x42340000
    add-float/2addr v5, v6
    iput v5, p0, Lcom/innioasis/ipp/FlowView;->offY:F
  .line 74
    const/4 v5, 0
    invoke-virtual { p0, v1, v5 }, Lcom/innioasis/ipp/FlowView;->setLayerType(ILandroid/graphics/Paint;)V
  .line 75
    new-instance v1, Landroid/graphics/PorterDuffXfermode;
    sget-object v5, Landroid/graphics/PorterDuff$Mode;->DST_OUT:Landroid/graphics/PorterDuff$Mode;
    invoke-direct { v1, v5 }, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V
    invoke-virtual { v0, v1 }, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;
  .line 76
    invoke-static { p1 }, Lcom/innioasis/ipp/FlowView;->textColor(Landroid/content/Context;)I
    move-result p1
  .line 77
    invoke-static { p1 }, Lcom/innioasis/ipp/FlowView;->lum(I)I
    move-result v0
    const/16 v1, 128
    if-le v0, v1, :L0
    const/high16 v0, 0xC0000000
    goto :L1
  :L0
    const v0, -2130706433
  :L1
  .line 78
    invoke-virtual { v2, p1 }, Landroid/text/TextPaint;->setColor(I)V
  .line 79
    const/high16 v1, 0x41A00000
    invoke-virtual { v2, v1 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 80
    sget-object v1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-static { v1, v3 }, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;
    move-result-object v1
    invoke-virtual { v2, v1 }, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  .line 81
    invoke-virtual { v2, v3 }, Landroid/text/TextPaint;->setFakeBoldText(Z)V
  .line 82
    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;
    invoke-virtual { v2, v1 }, Landroid/text/TextPaint;->setTextAlign(Landroid/graphics/Paint$Align;)V
  .line 83
    const/high16 v1, 0x40000000
    const/4 v3, 0
    invoke-virtual { v2, v1, v3, v7, v0 }, Landroid/text/TextPaint;->setShadowLayer(FFFI)V
  .line 84
    invoke-virtual { v4, p1 }, Landroid/text/TextPaint;->setColor(I)V
  .line 85
    const/high16 p1, 0x41880000
    invoke-virtual { v4, p1 }, Landroid/text/TextPaint;->setTextSize(F)V
  .line 86
    sget-object p1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;
    invoke-virtual { v4, p1 }, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
  .line 87
    sget-object p1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;
    invoke-virtual { v4, p1 }, Landroid/text/TextPaint;->setTextAlign(Landroid/graphics/Paint$Align;)V
  .line 88
    invoke-virtual { v4, v1, v3, v7, v0 }, Landroid/text/TextPaint;->setShadowLayer(FFFI)V
  .line 89
    return-void
.end method

.method private advance()Z
  .registers 8
  .line 157
    invoke-static { }, Landroid/os/SystemClock;->uptimeMillis()J
    move-result-wide v0
  .line 158
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
  .line 159
    iput-wide v0, p0, Lcom/innioasis/ipp/FlowView;->last:J
  .line 160
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->target:I
    int-to-float v0, v0
    iget v1, p0, Lcom/innioasis/ipp/FlowView;->pos:F
    sub-float/2addr v0, v1
  .line 161
    const/4 v1, 0
    const/4 v3, 0
    cmpl-float v4, v0, v3
    if-nez v4, :L2
    return v1
  :L2
  .line 162
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
  .line 163
    mul-float v4, v4, v2
  .line 164
    invoke-static { v0 }, Ljava/lang/Math;->abs(F)F
    move-result v2
    cmpl-float v2, v4, v2
    if-ltz v2, :L3
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->target:I
    int-to-float v0, v0
    iput v0, p0, Lcom/innioasis/ipp/FlowView;->pos:F
    goto :L6
  :L3
  .line 165
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
  .line 166
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
  .line 249
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->sCx:F
    mul-float p4, p4, p2
    add-float/2addr v0, p4
  .line 250
    iget p4, p0, Lcom/innioasis/ipp/FlowView;->h:I
    int-to-float v1, p4
    iget v2, p0, Lcom/innioasis/ipp/FlowView;->sCy:F
    add-float/2addr v1, v2
    mul-float p2, p2, p5
    add-float/2addr v1, p2
  .line 251
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
  .line 252
    add-int/lit8 p1, p1, 1
    const/high16 p5, 0x430E0000
    sub-float/2addr p3, p5
    int-to-float p4, p4
    mul-float p3, p3, p4
    div-float/2addr p3, v1
    add-float/2addr p3, p5
    aput p3, p2, p1
  .line 253
    return-void
.end method

.method private static lum(I)I
  .registers 3
  .line 103
    shr-int/lit8 v0, p0, 16
    and-int/lit16 v0, v0, 255
    mul-int/lit16 v0, v0, 299
    shr-int/lit8 v1, p0, 8
    and-int/lit16 v1, v1, 255
    mul-int/lit16 v1, v1, 587
    add-int/2addr v0, v1
    and-int/lit16 p0, p0, 255
    mul-int/lit8 p0, p0, 114
    add-int/2addr v0, p0
    div-int/lit16 v0, v0, 1000
    return v0
.end method

.method private place(F)V
  .registers 8
  .line 198
    invoke-static { p1 }, Ljava/lang/Math;->abs(F)F
    move-result v0
  .line 199
    const/high16 v1, 0x3F800000
    const/4 v2, 0
    cmpg-float p1, p1, v2
    if-gez p1, :L0
    const/high16 p1, 0xBF800000
    goto :L1
  :L0
    const/high16 p1, 0x3F800000
  :L1
  .line 200
    cmpg-float v3, v0, v1
    if-gtz v3, :L2
  .line 201
    neg-float v3, p1
    sget v4, Lcom/innioasis/ipp/FlowView;->ANGLE:F
    mul-float v3, v3, v4
    mul-float v3, v3, v0
    iput v3, p0, Lcom/innioasis/ipp/FlowView;->sAngle:F
  .line 202
    iget v3, p0, Lcom/innioasis/ipp/FlowView;->offX:F
    mul-float p1, p1, v3
    mul-float p1, p1, v0
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->sCx:F
  .line 203
    iget p1, p0, Lcom/innioasis/ipp/FlowView;->offY:F
    mul-float p1, p1, v0
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->sCy:F
    goto :L3
  :L2
  .line 205
    neg-float v3, p1
    sget v4, Lcom/innioasis/ipp/FlowView;->ANGLE:F
    mul-float v3, v3, v4
    iput v3, p0, Lcom/innioasis/ipp/FlowView;->sAngle:F
  .line 206
    iget v3, p0, Lcom/innioasis/ipp/FlowView;->offX:F
    const/high16 v4, 0x42200000
    sub-float v5, v0, v1
    mul-float v5, v5, v4
    add-float/2addr v3, v5
    mul-float p1, p1, v3
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->sCx:F
  .line 207
    iget p1, p0, Lcom/innioasis/ipp/FlowView;->offY:F
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->sCy:F
  :L3
  .line 209
    const/high16 p1, 0x40C00000
    sub-float/2addr p1, v0
    const/high16 v0, 0x40000000
    div-float/2addr p1, v0
  .line 210
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
  .line 211
    return-void
.end method

.method private slide(Landroid/graphics/Canvas;II)V
  .registers 15
  .line 214
    if-ltz p2, :L8
    if-ge p2, p3, :L8
    iget p3, p0, Lcom/innioasis/ipp/FlowView;->hidden:I
    if-ne p2, p3, :L0
    goto/16 :L8
  :L0
  .line 215
    int-to-float p3, p2
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->pos:F
    sub-float v0, p3, v0
    invoke-direct { p0, v0 }, Lcom/innioasis/ipp/FlowView;->place(F)V
  .line 216
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->sAlpha:I
    if-gtz v0, :L1
    return-void
  :L1
  .line 217
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView;->loader:Lcom/innioasis/ipp/Flow$Loader;
    invoke-virtual { v0, p2 }, Lcom/innioasis/ipp/Flow$Loader;->get(I)Landroid/graphics/Bitmap;
    move-result-object p2
  .line 218
    if-nez p2, :L2
    return-void
  :L2
  .line 219
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
  .line 220
    nop
  .line 221
    const/high16 v8, 0x41A00000
  .line 222
    const/high16 v9, 0x43920000
  .line 223
    const/4 v3, 0
    const/high16 v10, 0xC2B80000
    const/high16 v5, 0x41A00000
    move-object v2, p0
    move v4, v10
    move v6, v0
    move v7, v1
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/ipp/FlowView;->corner(IFFFF)V
  .line 224
    const/4 v3, 2
    const/high16 v4, 0x42B80000
    move v5, v8
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/ipp/FlowView;->corner(IFFFF)V
  .line 225
    const/4 v3, 4
    const/high16 v5, 0x43920000
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/ipp/FlowView;->corner(IFFFF)V
  .line 226
    const/4 v3, 6
    move v4, v10
    move v5, v9
    invoke-direct/range { v2 .. v7 }, Lcom/innioasis/ipp/FlowView;->corner(IFFFF)V
  .line 227
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->spread:F
    const/4 v1, 0
    const/4 v2, 0
    cmpl-float v3, v0, v2
    if-lez v3, :L5
  .line 228
    iget v3, p0, Lcom/innioasis/ipp/FlowView;->pos:F
    cmpg-float p3, p3, v3
    if-gez p3, :L3
    neg-float v0, v0
  :L3
    iget p3, p0, Lcom/innioasis/ipp/FlowView;->w:I
    int-to-float p3, p3
    mul-float v0, v0, p3
  .line 229
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
  .line 231
    invoke-virtual { p2 }, Landroid/graphics/Bitmap;->getWidth()I
    move-result p3
    invoke-virtual { p2 }, Landroid/graphics/Bitmap;->getHeight()I
    move-result v0
  .line 232
    iget-object v4, p0, Lcom/innioasis/ipp/FlowView;->src:[F
    aput v2, v4, v1
    const/4 v1, 1
    aput v2, v4, v1
  .line 233
    int-to-float p3, p3
    const/4 v1, 2
    aput p3, v4, v1
    const/4 v1, 3
    aput v2, v4, v1
  .line 234
    const/4 v1, 4
    aput p3, v4, v1
    int-to-float p3, v0
    const/4 v0, 5
    aput p3, v4, v0
  .line 235
    const/4 v0, 6
    aput v2, v4, v0
    const/4 v0, 7
    aput p3, v4, v0
  .line 236
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
  .line 238
    invoke-static { }, Lcom/innioasis/ipp/Flow;->mask()Landroid/graphics/Bitmap;
    move-result-object p3
  .line 239
    if-eqz p3, :L7
  .line 240
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView;->erase:Landroid/graphics/Paint;
    iget v1, p0, Lcom/innioasis/ipp/FlowView;->sAlpha:I
    invoke-virtual { v0, v1 }, Landroid/graphics/Paint;->setAlpha(I)V
  .line 241
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView;->m:Landroid/graphics/Matrix;
    iget-object v1, p0, Lcom/innioasis/ipp/FlowView;->erase:Landroid/graphics/Paint;
    invoke-virtual { p1, p3, v0, v1 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V
  :L7
  .line 243
    iget-object p3, p0, Lcom/innioasis/ipp/FlowView;->bmpPaint:Landroid/graphics/Paint;
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->sAlpha:I
    invoke-virtual { p3, v0 }, Landroid/graphics/Paint;->setAlpha(I)V
  .line 244
    iget-object p3, p0, Lcom/innioasis/ipp/FlowView;->m:Landroid/graphics/Matrix;
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView;->bmpPaint:Landroid/graphics/Paint;
    invoke-virtual { p1, p2, p3, v0 }, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V
  .line 245
    return-void
  :L8
  .line 214
    return-void
.end method

.method private static textColor(Landroid/content/Context;)I
  .catchall { :L0 .. :L1 } :L2
  .registers 4
  .line 94
    const/4 v0, -1
  :L0
    new-instance v1, Landroid/widget/TextView;
    invoke-direct { v1, p0 }, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V
  .line 95
    sget-object p0, Lcom/innioasis/y1/theme/ThemeManager;->INSTANCE:Lcom/innioasis/y1/theme/ThemeManager;
    const/4 v2, 0
    invoke-virtual { p0, v1, v0, v2 }, Lcom/innioasis/y1/theme/ThemeManager;->itemSetTextColor(Landroid/widget/TextView;IZ)V
  .line 96
    invoke-virtual { v1 }, Landroid/widget/TextView;->getCurrentTextColor()I
    move-result p0
  :L1
    return p0
  :L2
  .line 97
    move-exception p0
  .line 98
    return v0
.end method

.method public count()I
  .registers 2
  .line 117
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
  .line 136
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->w:I
    div-int/lit8 v0, v0, 2
    add-int/lit8 v0, v0, -90
    return v0
.end method

.method public coverTop()I
  .registers 2
  .line 138
    const/16 v0, 22
    return v0
.end method

.method public getSpread()F
  .registers 2
  .line 148
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->spread:F
    return v0
.end method

.method public hide(I)V
  .registers 2
  .line 131
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->hidden:I
  .line 132
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->invalidate()V
  .line 133
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
  .registers 9
  .line 171
    invoke-direct { p0 }, Lcom/innioasis/ipp/FlowView;->advance()Z
    move-result v0
  .line 172
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->count()I
    move-result v1
  .line 173
    if-lez v1, :L3
    iget v2, p0, Lcom/innioasis/ipp/FlowView;->w:I
    if-lez v2, :L3
  .line 174
    iget v2, p0, Lcom/innioasis/ipp/FlowView;->pos:F
    invoke-static { v2 }, Ljava/lang/Math;->round(F)I
    move-result v2
  .line 176
    const/4 v3, 7
  :L0
    if-ltz v3, :L2
  .line 177
    sub-int v4, v2, v3
    invoke-direct { p0, p1, v4, v1 }, Lcom/innioasis/ipp/FlowView;->slide(Landroid/graphics/Canvas;II)V
  .line 178
    if-eqz v3, :L1
    add-int v4, v2, v3
    invoke-direct { p0, p1, v4, v1 }, Lcom/innioasis/ipp/FlowView;->slide(Landroid/graphics/Canvas;II)V
  :L1
  .line 176
    add-int/lit8 v3, v3, -1
    goto :L0
  :L2
  .line 180
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
  .line 181
    iget v2, p0, Lcom/innioasis/ipp/FlowView;->w:I
    int-to-float v2, v2
    const/high16 v3, 0x40000000
    div-float/2addr v2, v3
  .line 182
    iget v4, p0, Lcom/innioasis/ipp/FlowView;->spread:F
    mul-float v4, v4, v3
    const/high16 v3, 0x3F800000
    invoke-static { v3, v4 }, Ljava/lang/Math;->min(FF)F
    move-result v4
    sub-float/2addr v3, v4
    const/high16 v4, 0x437F0000
    mul-float v3, v3, v4
    float-to-int v3, v3
  .line 183
    iget-object v4, p0, Lcom/innioasis/ipp/FlowView;->name:Landroid/text/TextPaint;
    invoke-virtual { v4, v3 }, Landroid/text/TextPaint;->setAlpha(I)V
  .line 184
    iget-object v4, p0, Lcom/innioasis/ipp/FlowView;->artist:Landroid/text/TextPaint;
    mul-int/lit16 v3, v3, 176
    div-int/lit16 v3, v3, 255
    invoke-virtual { v4, v3 }, Landroid/text/TextPaint;->setAlpha(I)V
  .line 185
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
  .line 187
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
  .line 190
    if-eqz v0, :L4
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->postInvalidateOnAnimation()V
  :L4
  .line 191
    return-void
.end method

.method protected onSizeChanged(IIII)V
  .registers 5
  .line 152
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->w:I
  .line 153
    iput p2, p0, Lcom/innioasis/ipp/FlowView;->h:I
  .line 154
    return-void
.end method

.method public setItems(Ljava/util/List;Lcom/innioasis/ipp/Flow$Loader;I)V
  .registers 4
  .line 107
    iput-object p1, p0, Lcom/innioasis/ipp/FlowView;->items:Ljava/util/List;
  .line 108
    iput-object p2, p0, Lcom/innioasis/ipp/FlowView;->loader:Lcom/innioasis/ipp/Flow$Loader;
  .line 109
    iput p3, p0, Lcom/innioasis/ipp/FlowView;->target:I
  .line 110
    int-to-float p1, p3
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->pos:F
  .line 111
    invoke-virtual { p2, p3 }, Lcom/innioasis/ipp/Flow$Loader;->aim(I)V
  .line 112
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->invalidate()V
  .line 113
    return-void
.end method

.method public setSpread(F)V
  .registers 2
  .line 144
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->spread:F
  .line 145
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->invalidate()V
  .line 146
    return-void
.end method

.method public step(I)V
  .registers 4
  .line 120
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView;->items:Ljava/util/List;
    if-eqz v0, :L2
    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
    move-result v0
    if-eqz v0, :L0
    goto :L2
  :L0
  .line 121
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
  .line 122
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->target:I
    if-ne p1, v0, :L1
    return-void
  :L1
  .line 123
    iput p1, p0, Lcom/innioasis/ipp/FlowView;->target:I
  .line 124
    iget-object v0, p0, Lcom/innioasis/ipp/FlowView;->loader:Lcom/innioasis/ipp/Flow$Loader;
    invoke-virtual { v0, p1 }, Lcom/innioasis/ipp/Flow$Loader;->aim(I)V
  .line 125
    const-wide/16 v0, 0
    iput-wide v0, p0, Lcom/innioasis/ipp/FlowView;->last:J
  .line 126
    invoke-virtual { p0 }, Lcom/innioasis/ipp/FlowView;->postInvalidateOnAnimation()V
  .line 127
    return-void
  :L2
  .line 120
    return-void
.end method

.method public target()I
  .registers 2
  .line 115
    iget v0, p0, Lcom/innioasis/ipp/FlowView;->target:I
    return v0
.end method
